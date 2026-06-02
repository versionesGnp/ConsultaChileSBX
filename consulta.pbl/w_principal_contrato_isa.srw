forward
global type w_principal_contrato_isa from window
end type
type st_2 from statictext within w_principal_contrato_isa
end type
type cb_beneficiarios from commandbutton within w_principal_contrato_isa
end type
type cb_filtrar_soli from commandbutton within w_principal_contrato_isa
end type
type cb_4 from commandbutton within w_principal_contrato_isa
end type
type cb_3 from commandbutton within w_principal_contrato_isa
end type
type cb_2 from commandbutton within w_principal_contrato_isa
end type
type cb_1 from commandbutton within w_principal_contrato_isa
end type
type cb_cta_cte from commandbutton within w_principal_contrato_isa
end type
type cb_refrescar from commandbutton within w_principal_contrato_isa
end type
type st_1 from statictext within w_principal_contrato_isa
end type
type cb_salir from commandbutton within w_principal_contrato_isa
end type
type p_1 from picture within w_principal_contrato_isa
end type
type dw_listado_contrato_isa from datawindow within w_principal_contrato_isa
end type
type gb_1 from groupbox within w_principal_contrato_isa
end type
end forward

global type w_principal_contrato_isa from window
integer x = 818
integer y = 576
integer width = 3639
integer height = 2288
boolean titlebar = true
string title = "Contratos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_2 st_2
cb_beneficiarios cb_beneficiarios
cb_filtrar_soli cb_filtrar_soli
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_cta_cte cb_cta_cte
cb_refrescar cb_refrescar
st_1 st_1
cb_salir cb_salir
p_1 p_1
dw_listado_contrato_isa dw_listado_contrato_isa
gb_1 gb_1
end type
global w_principal_contrato_isa w_principal_contrato_isa

on w_principal_contrato_isa.create
this.st_2=create st_2
this.cb_beneficiarios=create cb_beneficiarios
this.cb_filtrar_soli=create cb_filtrar_soli
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cta_cte=create cb_cta_cte
this.cb_refrescar=create cb_refrescar
this.st_1=create st_1
this.cb_salir=create cb_salir
this.p_1=create p_1
this.dw_listado_contrato_isa=create dw_listado_contrato_isa
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.cb_beneficiarios,&
this.cb_filtrar_soli,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_cta_cte,&
this.cb_refrescar,&
this.st_1,&
this.cb_salir,&
this.p_1,&
this.dw_listado_contrato_isa,&
this.gb_1}
end on

on w_principal_contrato_isa.destroy
destroy(this.st_2)
destroy(this.cb_beneficiarios)
destroy(this.cb_filtrar_soli)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cta_cte)
destroy(this.cb_refrescar)
destroy(this.st_1)
destroy(this.cb_salir)
destroy(this.p_1)
destroy(this.dw_listado_contrato_isa)
destroy(this.gb_1)
end on

event open;setpointer(hourglass!)
long 		ll_total,RET,i,cta_pag_la,cta_pag_isa,nro_cuotas, ret1, ret11, cta_pag_m
long		ret2, numero,cta_pag_s, ll_count_reg
datetime fecha_prim, fecha_m
string 	base, serie, ls_dir_p, ls_nro_p, ls_depto_p, ls_block_p, ls_via_p,ls_dir_part

if gs_conexion = "Parque El Prado" then
	if gl_cod_parque=1 then
		p_1.picturename 	= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 	= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	else
		p_1.picturename 	= 'logo_e.bmp'
	end if
elseif gs_conexion = "Parque La Foresta" then
	p_1.picturename 	= 'logo_e_s.bmp'
elseif gs_conexion = "Parque Santiago" then
	p_1.picturename 	= 'logo_parque_stgo.bmp'
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 	= 'logo_parque_conce.jpg'
end if
base 						= 'C'
gf_centrar(w_principal_contrato_isa)
dw_listado_contrato_isa.SetTransObject(SQLCA)
gs_ventana				= 'w_principal_contrato_isa'
f_valida_objeto()
//SELECT COUNT(SERIE_C) INTO :CUENTA FROM CONTRATO;
Open(w_espera)
ll_total 				= dw_listado_contrato_isa.Retrieve()
if ll_total > 0 then
	for i =1 to ll_total
		base				= dw_listado_contrato_isa.getitemstring(i,'cadena_codigo')
		serie				= dw_listado_contrato_isa.getitemstring(i,'contrato_serie_c')
		numero			= dw_listado_contrato_isa.getitemnumber(i,'contrato_nro_contrato')
		ls_via_p			= trim(dw_listado_contrato_isa.getitemstring(i,'tipo_via_descripcion'))
		ls_dir_part		= ls_via_p
		ls_dir_p			= trim(dw_listado_contrato_isa.getitemstring(i,'cliente_direccion_p'))
		ls_dir_part		= ls_dir_part+' '+ls_dir_p
		ls_nro_p			= trim(dw_listado_contrato_isa.getitemstring(i,'cliente_numero_particular'))
		if not isnull(ls_nro_p) and ls_nro_p<>'-' then
			ls_dir_part	= ls_dir_part+ ' Nº: '+ls_nro_p
		end if
		ls_depto_p	= trim(dw_listado_contrato_isa.getitemstring(i,'cliente_depto_particular'))
		if not isnull(ls_depto_p) and ls_depto_p<>'-' then
			ls_dir_part	= ls_dir_part+ ' Depto.: '+ls_depto_p
		end if
		ls_block_p	= trim(dw_listado_contrato_isa.getitemstring(i,'cliente_block_particular'))
		if not isnull(ls_block_p) and ls_block_p<>'-' then
			ls_dir_part	= ls_dir_part+ ' Block: '+ls_block_p
		end if
		dw_listado_contrato_isa.setitem(i,'dir_part_completa',ls_dir_part)
		SELECT	count("SOL_ESTATUS"."NUMERO")
    	INTO 		:ll_count_reg  
    	FROM 		"SOL_ESTATUS"  
   	WHERE  ( "SOL_ESTATUS"."BASE" = :base ) AND  
				 ( "SOL_ESTATUS"."SERIE" = :serie ) AND  
				 ( "SOL_ESTATUS"."NUMERO" = :numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_listado_contrato_isa.setitem(i,'cant_solicitudes',ll_count_reg)
		end if
		w_espera.st_i.text	= "Reg. Leidos "+ string(i) +" de " + string(ll_total)
	next
end if	
Close(w_espera)
st_1.text 						= String(ll_total,"###,###,###") + " Contratos"
dw_listado_contrato_isa.accepttext()
setpointer(arrow!)
end event

type st_2 from statictext within w_principal_contrato_isa
integer x = 439
integer y = 96
integer width = 1682
integer height = 128
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado General Contrato"
boolean focusrectangle = false
end type

type cb_beneficiarios from commandbutton within w_principal_contrato_isa
integer x = 2423
integer y = 2048
integer width = 453
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Beneficiarios"
end type

event clicked;if dw_listado_contrato_isa.getrow() > 0 then 
	CHOOSE CASE gs_base
		CASE "C" // Contrato
			Open(w_listado_beneficiarios2)
	END CHOOSE
end if
end event

type cb_filtrar_soli from commandbutton within w_principal_contrato_isa
boolean visible = false
integer x = 2194
integer y = 64
integer width = 558
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Filtrar S&olicitudes"
end type

event clicked;string DWfilter2

DWfilter2 = 'isnull( ingreso_solicitudes_codigo_solicitud ) or (ingreso_solicitudes_codigo_solicitud <>"1" and ingreso_solicitudes_codigo_solicitud <>"2") or (ingreso_solicitudes_estado_reg)<>"A"'
dw_listado_contrato_isa.SetFilter(DWfilter2)
dw_listado_contrato_isa.Filter( )
st_1.text	= string(dw_listado_contrato_isa.rowcount(),"###,###,###,###,##0")+' Ofertas'

end event

type cb_4 from commandbutton within w_principal_contrato_isa
integer x = 1966
integer y = 2048
integer width = 453
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Relación * Rut"
end type

event clicked;if dw_listado_contrato_isa.getrow() > 0 then 
	gi_rut = dw_listado_contrato_isa.getitemnumber(dw_listado_contrato_isa.getrow(),'cadena_rut')
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if
end event

type cb_3 from commandbutton within w_principal_contrato_isa
integer x = 3282
integer y = 108
integer width = 233
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_listado_contrato_isa
if dw_listado_contrato_isa.rowcount() > 0 then f_DWToExcel( dw_paso )

//SaveAsType TipoArchivo
//string Archivo
//boolean encabezado
//integer ret
//
//TipoArchivo = excel!
//Archivo = 'contrato.xls'
//
//If FileExists(Archivo) Then
//	Ret = MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
//	If Ret = 2 Then
//		Close(Parent)
//		Return
//	End If
//End If
//Ret = dw_listado_contrato_isa.SaveAs( Archivo,TipoArchivo, true)
//If Ret < 0  Then
//	MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
//End If
end event

type cb_2 from commandbutton within w_principal_contrato_isa
integer x = 3058
integer y = 108
integer width = 219
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filter"
end type

event clicked;string nulo
Setnull (nulo)
dw_listado_contrato_isa.setfilter(nulo)
dw_listado_contrato_isa.filter()
st_1.text	= string(dw_listado_contrato_isa.rowcount(),"###,###,###,###,##0")+' Contratos'
end event

type cb_1 from commandbutton within w_principal_contrato_isa
integer x = 2834
integer y = 108
integer width = 219
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sort"
end type

event clicked;string nulo
Setnull (nulo)
dw_listado_contrato_isa.setsort(nulo)
dw_listado_contrato_isa.sort()

end event

type cb_cta_cte from commandbutton within w_principal_contrato_isa
integer x = 1463
integer y = 2048
integer width = 498
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_listado_contrato_isa.getrow() > 0 then open(w_cuenta_corriente_contrato_isa)
end event

type cb_refrescar from commandbutton within w_principal_contrato_isa
boolean visible = false
integer x = 965
integer y = 2048
integer width = 347
integer height = 108
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&frescar"
end type

event clicked;//long ll_total
//
//Open(w_espera)
//ll_total = dw_listado_pagare.Retrieve()
//Close(w_espera)
//st_1.text = String(ll_total,"###,###,###") + " Pagares"
//
end event

type st_1 from statictext within w_principal_contrato_isa
integer x = 46
integer y = 2048
integer width = 896
integer height = 108
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "0 Contratos"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_salir from commandbutton within w_principal_contrato_isa
integer x = 3182
integer y = 2048
integer width = 379
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_principal_contrato_isa)

end event

type p_1 from picture within w_principal_contrato_isa
integer x = 27
integer y = 24
integer width = 320
integer height = 260
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_listado_contrato_isa from datawindow within w_principal_contrato_isa
integer x = 32
integer y = 308
integer width = 3525
integer height = 1696
integer taborder = 40
string dataobject = "d_listado_contrato_isa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gi_rut		= GetItemnumber(row, 'cadena_rut')
	gs_base 		= "C"
	gs_serie 	= GetItemString(row, "contrato_serie_c")
	gi_numero 	= GetItemNumber(row, "contrato_nro_contrato")
END IF
end event

event doubleclicked;if row>0 then
	gs_base 		= "C"
	gi_rut		= GetItemnumber(row, 'cadena_rut')
	gs_serie 	= GetItemString(row, "contrato_serie_c")
	gi_numero 	= GetItemNumber(row, "contrato_nro_contrato")
	open(w_cuenta_corriente_contrato_isa)
end if
end event

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	gi_rut		= GetItemnumber(this.getrow(), 'cadena_rut')
	gs_base 		= "C"
	gs_serie 	= GetItemString(this.getrow(), "contrato_serie_c")
	gi_numero 	= GetItemNumber(this.getrow(), "contrato_nro_contrato")
END IF
end event

type gb_1 from groupbox within w_principal_contrato_isa
integer x = 2793
integer y = 24
integer width = 750
integer height = 216
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Utilitarios"
end type

