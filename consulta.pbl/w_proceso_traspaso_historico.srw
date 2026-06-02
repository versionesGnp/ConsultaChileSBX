forward
global type w_proceso_traspaso_historico from window
end type
type cb_3 from commandbutton within w_proceso_traspaso_historico
end type
type cb_6 from commandbutton within w_proceso_traspaso_historico
end type
type cb_5 from commandbutton within w_proceso_traspaso_historico
end type
type cb_4 from commandbutton within w_proceso_traspaso_historico
end type
type dw_3 from datawindow within w_proceso_traspaso_historico
end type
type dw_2 from datawindow within w_proceso_traspaso_historico
end type
type cb_2 from commandbutton within w_proceso_traspaso_historico
end type
type cb_1 from commandbutton within w_proceso_traspaso_historico
end type
type dw_1 from datawindow within w_proceso_traspaso_historico
end type
end forward

global type w_proceso_traspaso_historico from window
integer x = 5
integer y = 4
integer width = 3657
integer height = 2348
boolean titlebar = true
string title = "Rezagos Históricos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
event proceso pbm_custom01
cb_3 cb_3
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
dw_3 dw_3
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_proceso_traspaso_historico w_proceso_traspaso_historico

type variables
string is_banda_new,is_campo,is_banda_old
datawindow dw_paso
end variables

forward prototypes
public subroutine wf_sort (string as_banda)
public function integer wf_rut (long row)
end prototypes

event proceso;integer i,filas,j
double precio,nro_cuotas,valor_cuota,pie,monto,valor_uf
string base,tipo_mov,tipo_cob,moneda,estado
long folio

if dw_1.retrieve() > 0 then
	wf_sort('fecha_pago')
	dw_1.object.titulo.text = 'Rezagos Históricos de '+gs_conexion
	dw_1.object.titulo1.text = 'User : '+gs_codigo_usuario+'     Usuario : '+gs_nombre
	filas = dw_1.rowcount()
	for i = 1 to filas
		dw_1.SelectRow(0, FALSE)
		dw_1.SelectRow(i, TRUE)
		dw_1.ScrollToRow(i) 
		base     = dw_1.GetItemString(i, "base")
		tipo_mov = dw_1.GetItemString(i, "tipo_mov")
		tipo_cob = dw_1.GetItemString(i, "tipo_cob")
		folio    = dw_1.GetItemNumber(i, "folio")
		if wf_rut(i) = 1 then
			if dw_2.rowcount() > 0 then
				for j = 1 to dw_2.rowcount()
					gs_base   = dw_2.GetItemString(j, "codigo")
					gs_serie  = dw_2.GetItemString(j, "serie")
					gi_numero = dw_2.GetItemNumber(j, "numero")
					estado    = dw_2.GetItemString(j, "estado")
					if estado = 'V' then	
						dw_3.Reset()
						CHOOSE CASE gs_base
							CASE "O","U","M"
								dw_3.DataObject = "d_trapaso_datos_oferta_1"
								dw_3.SetTransObject(SQLCA)
								dw_3.Retrieve(gs_serie, gi_numero)
							CASE "L"
								dw_3.DataObject = "d_trapaso_datos_anexo_1"
								dw_3.SetTransObject(SQLCA)
								dw_3.Retrieve(gs_serie, gi_numero)
							CASE "C"
								dw_3.DataObject = "d_trapaso_datos_contrato_isa_1"
								dw_3.SetTransObject(SQLCA)
								dw_3.Retrieve(gs_serie, gi_numero)
							CASE "P"
								dw_3.DataObject = "d_trapaso_datos_pagare_1"
								dw_3.SetTransObject(SQLCA)
								dw_3.Retrieve(gs_serie, gi_numero)
							CASE "D"
								dw_3.DataObject = "d_trapaso_datos_derecho_1"
								dw_3.SetTransObject(SQLCA)
								dw_3.Retrieve(gs_serie, gi_numero)
							CASE "R"
								dw_3.DataObject = "d_trapaso_datos_reproman_1"
								dw_3.SetTransObject(SQLCA)
								dw_3.Retrieve(gs_serie, gi_numero)
						END CHOOSE
						if dw_3.dataobject='d_trapaso_datos_reproman_1' then
							precio		=	dw_3.getitemnumber(1,'total_deuda')
							nro_cuotas	=	dw_3.getitemnumber(1,'cuotas_pactadas')
							valor_cuota	=	dw_3.getitemnumber(1,'valor_cuota')
//							pie			=	dw_3.getitemnumber(1,'pie')
							moneda		=	dw_3.getitemstring(1,'tipo_moneda')
						else
							if dw_3.rowcount()>0 then
								precio		=	dw_3.getitemnumber(1,'precio')
								nro_cuotas	=	dw_3.getitemnumber(1,'nro_cuotas')
								valor_cuota	=	dw_3.getitemnumber(1,'valor_cuota')
								pie			=	dw_3.getitemnumber(1,'pie')
								moneda		=	dw_3.getitemstring(1,'moneda')
							end if
						end if
						SELECT "INGRESO"."MONTO",   
								 "INGRESO"."VALOR_UF"  
						INTO :monto,   
							  :valor_uf  
						FROM "INGRESO"  
						WHERE ( "INGRESO"."FOLIO" = :folio ) AND  
								( "INGRESO"."TIPO_MOV" = :tipo_mov ) AND  
								( "INGRESO"."TIPO_COB" = :tipo_cob ) AND  
								( "INGRESO"."BASE" = :base )   ;
						if precio > 0 and nro_cuotas > 0 and valor_cuota > 0 then
							if moneda = '2' then
								monto = round(monto / valor_uf,2)
							end if	
							if ( valor_cuota = monto ) then
								dw_1.setitem(i,'traspaso',1)
								dw_1.setitem(i,'base',gs_base)
								dw_1.setitem(i,'serie',gs_serie)
								dw_1.setitem(i,'numero',gi_numero)
								dw_1.accepttext ()							
							elseif ( pie = monto ) then
								dw_1.setitem(i,'traspaso',1)
								dw_1.setitem(i,'base',gs_base)
								dw_1.setitem(i,'serie',gs_serie)
								dw_1.setitem(i,'numero',gi_numero)
								dw_1.accepttext ()
							elseif mod ( monto , precio ) = 0 then
								dw_1.setitem(i,'traspaso',1)
								dw_1.setitem(i,'base',gs_base)
								dw_1.setitem(i,'serie',gs_serie)
								dw_1.setitem(i,'numero',gi_numero)
								dw_1.accepttext ()
							elseif mod ( monto , valor_cuota ) = 0 then
								dw_1.setitem(i,'traspaso',1)
								dw_1.setitem(i,'base',gs_base)
								dw_1.setitem(i,'serie',gs_serie)
								dw_1.setitem(i,'numero',gi_numero)
								dw_1.accepttext ()								
							end if
						end if
					end if
				next
			end if	
		end if
	next
end if
end event

public subroutine wf_sort (string as_banda);is_banda_new			=	as_banda
CHOOSE CASE as_banda
	CASE "a_rut"
		is_campo	=	'rut'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_folio"
		is_campo	=	'folio'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_tipo_cob"
		is_campo	=	'tipo_cob'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_fecha_pago"
		is_campo	=	'fecha_pago'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_tipo_mov"
		is_campo	=	'tipo_mov'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_monto"
		is_campo	=	'monto'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new		
	CASE "a_cuotas_pag"
		is_campo	=	'cuotas_pag'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_valor_uf"
		is_campo	=	'valor_uf'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_mora"
		is_campo	=	'mora'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_contrato"
		is_campo	=	'contrato'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_traspaso"
		is_campo	=	'traspaso'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
END CHOOSE
end subroutine

public function integer wf_rut (long row);long rut

rut = dw_1.getitemnumber(row,'rut')
dw_2.dataobject = 'dw_contrato_rezago'
dw_2.settransobject (sqlca)
if dw_2.retrieve(rut) > 0 then
	return 1
else
	dw_2.dataobject = 'dw_contrato_rezago_co_prop'
	dw_2.settransobject (sqlca)
	if dw_2.retrieve(rut) > 0 then
		return 1
	else
		return 0
	end if
end if

end function

on w_proceso_traspaso_historico.create
this.cb_3=create cb_3
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.dw_3,&
this.dw_2,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_proceso_traspaso_historico.destroy
destroy(this.cb_3)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;gf_centrar(w_proceso_traspaso_historico)
dw_1.settransobject (sqlca)
gs_ventana	= 'w_proceso_traspaso_historico'
f_valida_objeto()
postevent ('proceso')

end event

type cb_3 from commandbutton within w_proceso_traspaso_historico
integer x = 3319
integer y = 1636
integer width = 297
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;dw_paso = dw_1
f_DWToExcel( dw_paso )
end event

type cb_6 from commandbutton within w_proceso_traspaso_historico
event clicked pbm_bnclicked
integer x = 3017
integer y = 1636
integer width = 297
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo

setnull(nulo)
dw_1.setsort(nulo)
dw_1.sort()
end event

type cb_5 from commandbutton within w_proceso_traspaso_historico
event clicked pbm_bnclicked
integer x = 3319
integer y = 1756
integer width = 297
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo

setnull(nulo)
dw_1.setfilter(nulo)
dw_1.filter()
end event

type cb_4 from commandbutton within w_proceso_traspaso_historico
event clicked pbm_bnclicked
integer x = 3017
integer y = 2100
integer width = 297
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;
dw_1.print()
end event

type dw_3 from datawindow within w_proceso_traspaso_historico
integer x = 3013
integer y = 844
integer width = 608
integer height = 760
integer taborder = 80
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_proceso_traspaso_historico
integer x = 3013
integer y = 32
integer width = 608
integer height = 760
integer taborder = 70
string dataobject = "dw_contrato_rezago"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	
	gs_base = This.GetItemString(row, "codigo")
	gs_serie = This.GetItemString(row, "serie")
	gi_numero = This.GetItemNumber(row, "numero")
//	cb_ver_cta_cte.Enabled = TRUE
	dw_3.Reset()
	CHOOSE CASE gs_base
		CASE "O","U","M"
			dw_3.DataObject = "d_trapaso_datos_oferta_1"
			dw_3.SetTransObject(SQLCA)
			dw_3.Retrieve(gs_serie, gi_numero)
		CASE "L"
			dw_3.DataObject = "d_trapaso_datos_anexo_1"
			dw_3.SetTransObject(SQLCA)
			dw_3.Retrieve(gs_serie, gi_numero)
		CASE "C"
			dw_3.DataObject = "d_trapaso_datos_contrato_isa_1"
			dw_3.SetTransObject(SQLCA)
			dw_3.Retrieve(gs_serie, gi_numero)
		CASE "P"
			dw_3.DataObject = "d_trapaso_datos_pagare_1"
			dw_3.SetTransObject(SQLCA)
			dw_3.Retrieve(gs_serie, gi_numero)
		CASE "D"
			dw_3.DataObject = "d_trapaso_datos_derecho_1"
			dw_3.SetTransObject(SQLCA)
			dw_3.Retrieve(gs_serie, gi_numero)
	END CHOOSE
END IF
end event

event doubleclicked;CHOOSE CASE gs_base
	CASE "O","U","M"
		Open(w_cuenta_corriente_oferta)
	CASE "L"
		Open(w_cuenta_corriente_liberador)
	CASE "C"
		Open(w_cuenta_corriente_contrato_isa)
	CASE "P"
		Open(w_cuenta_corriente_pagare)
	CASE "D"
		Open(w_cuenta_corriente_derecho)
END CHOOSE
end event

type cb_2 from commandbutton within w_proceso_traspaso_historico
integer x = 3017
integer y = 1756
integer width = 297
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Despejar"
end type

event clicked;integer i,filas

filas = dw_1.rowcount()
if filas > 0 then
	for i = filas to 1 step -1
		if dw_1.getitemnumber(i,'traspaso') <> 1 then
			dw_1.deleterow(i)
			dw_1.accepttext ()
		end if
	next
end if
end event

type cb_1 from commandbutton within w_proceso_traspaso_historico
integer x = 3319
integer y = 2100
integer width = 297
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_proceso_traspaso_historico)
end event

type dw_1 from datawindow within w_proceso_traspaso_historico
integer x = 41
integer y = 32
integer width = 2944
integer height = 2180
integer taborder = 60
string dataobject = "dw_rezagos_historico"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_1.Accepttext()
dw_1.SelectRow(0,FALSE) 
IF row > 0 THEN
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(row, TRUE)
	dw_2.reset()
	wf_rut(row)
	dw_3.reset()
ELSE
	wf_sort(STRING(dwo.name))
END IF
end event

event doubleclicked;long folio
string param
IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	folio = This.GetItemNumber(row, "folio")
	if not isnull(This.GetItemString(row, "base")) and &
	   not isnull(This.GetItemString(row, "serie")) and &
		not isnull(This.GetItemNumber(row, "numero")) then
		gs_base = This.GetItemString(row, "base")
		gs_serie = This.GetItemString(row, "serie")
		gi_numero = This.GetItemNumber(row, "numero")
		dw_3.Reset()
		CHOOSE CASE gs_base
			CASE "O","U","M"
				dw_3.DataObject = "d_trapaso_datos_oferta_1"
				dw_3.SetTransObject(SQLCA)
				dw_3.Retrieve(gs_serie, gi_numero)
			CASE "L"
				dw_3.DataObject = "d_trapaso_datos_anexo_1"
				dw_3.SetTransObject(SQLCA)
				dw_3.Retrieve(gs_serie, gi_numero)
			CASE "C"
				dw_3.DataObject = "d_trapaso_datos_contrato_isa_1"
				dw_3.SetTransObject(SQLCA)
				dw_3.Retrieve(gs_serie, gi_numero)
			CASE "P"
				dw_3.DataObject = "d_trapaso_datos_pagare_1"
				dw_3.SetTransObject(SQLCA)
				dw_3.Retrieve(gs_serie, gi_numero)
			CASE "D"
				dw_3.DataObject = "d_trapaso_datos_derecho_1"
				dw_3.SetTransObject(SQLCA)
				dw_3.Retrieve(gs_serie, gi_numero)
		END CHOOSE
	end if
	param = string(folio)
//	OpenWithParm(w_documentos,param)
END IF
end event

