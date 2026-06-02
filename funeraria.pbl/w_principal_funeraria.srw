forward
global type w_principal_funeraria from window
end type
type pb_ok from picturebutton within w_principal_funeraria
end type
type st_3 from statictext within w_principal_funeraria
end type
type ddlb_parque from dropdownlistbox within w_principal_funeraria
end type
type st_2 from statictext within w_principal_funeraria
end type
type cb_5 from commandbutton within w_principal_funeraria
end type
type cb_4 from commandbutton within w_principal_funeraria
end type
type cb_3 from commandbutton within w_principal_funeraria
end type
type cb_2 from commandbutton within w_principal_funeraria
end type
type cb_1 from commandbutton within w_principal_funeraria
end type
type cb_beneficiarios from commandbutton within w_principal_funeraria
end type
type cb_datos_clientes from commandbutton within w_principal_funeraria
end type
type cb_datos_contrato from commandbutton within w_principal_funeraria
end type
type cb_cuenta_cte from commandbutton within w_principal_funeraria
end type
type cb_refrescar from commandbutton within w_principal_funeraria
end type
type st_1 from statictext within w_principal_funeraria
end type
type cb_salir from commandbutton within w_principal_funeraria
end type
type p_1 from picture within w_principal_funeraria
end type
type dw_listado from datawindow within w_principal_funeraria
end type
type gb_1 from groupbox within w_principal_funeraria
end type
end forward

global type w_principal_funeraria from window
integer y = 4
integer width = 3602
integer height = 2320
boolean titlebar = true
string title = "LISTADO GENERAL FUNERARIA CREMATORIO"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
pb_ok pb_ok
st_3 st_3
ddlb_parque ddlb_parque
st_2 st_2
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_beneficiarios cb_beneficiarios
cb_datos_clientes cb_datos_clientes
cb_datos_contrato cb_datos_contrato
cb_cuenta_cte cb_cuenta_cte
cb_refrescar cb_refrescar
st_1 st_1
cb_salir cb_salir
p_1 p_1
dw_listado dw_listado
gb_1 gb_1
end type
global w_principal_funeraria w_principal_funeraria

on w_principal_funeraria.create
this.pb_ok=create pb_ok
this.st_3=create st_3
this.ddlb_parque=create ddlb_parque
this.st_2=create st_2
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_beneficiarios=create cb_beneficiarios
this.cb_datos_clientes=create cb_datos_clientes
this.cb_datos_contrato=create cb_datos_contrato
this.cb_cuenta_cte=create cb_cuenta_cte
this.cb_refrescar=create cb_refrescar
this.st_1=create st_1
this.cb_salir=create cb_salir
this.p_1=create p_1
this.dw_listado=create dw_listado
this.gb_1=create gb_1
this.Control[]={this.pb_ok,&
this.st_3,&
this.ddlb_parque,&
this.st_2,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_beneficiarios,&
this.cb_datos_clientes,&
this.cb_datos_contrato,&
this.cb_cuenta_cte,&
this.cb_refrescar,&
this.st_1,&
this.cb_salir,&
this.p_1,&
this.dw_listado,&
this.gb_1}
end on

on w_principal_funeraria.destroy
destroy(this.pb_ok)
destroy(this.st_3)
destroy(this.ddlb_parque)
destroy(this.st_2)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_beneficiarios)
destroy(this.cb_datos_clientes)
destroy(this.cb_datos_contrato)
destroy(this.cb_cuenta_cte)
destroy(this.cb_refrescar)
destroy(this.st_1)
destroy(this.cb_salir)
destroy(this.p_1)
destroy(this.dw_listado)
destroy(this.gb_1)
end on

event open;long 		ll_cod_parque
string 	ls_nom_parque,ls_string

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
gf_centrar(w_principal_funeraria)
ddlb_parque.reset()
st_1.text		= ''
DECLARE x1 CURSOR FOR  
SELECT   "COD_PARQ"."CODIGO",         "COD_PARQ"."NOMBRE"  
FROM     "COD_PARQ"  
WHERE    "COD_PARQ"."GRUPO" = 1
ORDER BY "COD_PARQ"."CODIGO" ASC 
USING    sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ll_cod_parque, :ls_nom_parque;
		if not isnull(ll_cod_parque) and ll_cod_parque > 0 then
			ls_string           = string(ll_cod_parque)+' - '+trim(ls_nom_parque)
			ddlb_parque.AddItem(ls_string)
		end if
		Setnull(ls_string);Setnull(ll_cod_parque)
	LOOP
end if
close x1;
ddlb_parque.AddItem(string(99)+' - TODOS')
gs_ventana					= 'w_principal_funeraria'
f_valida_objeto()


end event

type pb_ok from picturebutton within w_principal_funeraria
integer x = 1737
integer y = 220
integer width = 178
integer height = 156
integer taborder = 20
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;string		ls_parque
long		ll_pos,ll_parque,ll_total_reg

setpointer(hourglass!)
st_1.text								= ''
ls_parque                        		= ddlb_parque.text
ll_pos                           			= POS (ls_parque,'-')
if ll_pos > 0 then ll_pos = ll_pos - 1
ll_parque                        		= long(trim(mid(ls_parque,1,ll_pos)))
if ll_parque = 99 then
	dw_listado.dataobject = 'dw_listado_funeraria_crematorio_todos'
	dw_listado.settransobject(sqlca)
	ll_total_reg              			= dw_listado.Retrieve()
else
	dw_listado.dataobject 		= 'dw_listado_funeraria_crematorio'
	dw_listado.settransobject(sqlca)
	ll_total_reg	              		= dw_listado.Retrieve(ll_parque)
end if

if ll_total_reg > 0 then
	st_1.text 							= "Total Contratos Funeraria "+String(ll_total_reg,"###,###,###,###,##0")
else
	messagebox("Advertencia","No Registra Datos")
end if
dw_listado.accepttext()
setpointer(arrow!)
end event

type st_3 from statictext within w_principal_funeraria
integer x = 439
integer y = 268
integer width = 480
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_parque from dropdownlistbox within w_principal_funeraria
integer x = 946
integer y = 248
integer width = 754
integer height = 564
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;st_1.text		= ''
dw_listado.reset()
end event

type st_2 from statictext within w_principal_funeraria
integer x = 439
integer y = 36
integer width = 2139
integer height = 112
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado General Funeraria - Crematorio - Servicio"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_principal_funeraria
integer x = 2418
integer y = 2060
integer width = 384
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&lación * Rut"
end type

event clicked;if dw_listado.getrow() > 0 then 
	gi_rut = dw_listado.getitemnumber(dw_listado.getrow(),'rut_comprador')
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if
end event

type cb_4 from commandbutton within w_principal_funeraria
integer x = 1664
integer y = 2060
integer width = 288
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fallec&idos"
end type

event clicked;if dw_listado.getrow() > 0 then Open(w_listado_fallecidos)
end event

type cb_3 from commandbutton within w_principal_funeraria
integer x = 3246
integer y = 92
integer width = 265
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_listado
if dw_listado.rowcount() > 0 then f_DWToExcel( dw_paso )

//SaveAsType TipoArchivo
//string Archivo
//boolean encabezado
//integer ret
//
//TipoArchivo = excel!
//Archivo = 'oferta.xls'
//
//If FileExists(Archivo) Then
//	Ret = MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
//	If Ret = 2 Then
//		Close(Parent)
//		Return
//	End If
//End If
//Ret = dw_listado_ofertas.SaveAs( Archivo,TipoArchivo, true)
//If Ret < 0  Then
//	MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
//End If
end event

type cb_2 from commandbutton within w_principal_funeraria
integer x = 3045
integer y = 92
integer width = 197
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtro"
end type

event clicked;string nulo
Setnull (nulo)
dw_listado.setfilter(nulo)
dw_listado.filter()
st_1.text	= string(dw_listado.rowcount(),"###,###,###,###,##0")+' Contrato Funeraria'
end event

type cb_1 from commandbutton within w_principal_funeraria
integer x = 2843
integer y = 92
integer width = 197
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
Setnull (nulo)
dw_listado.setsort(nulo)
dw_listado.sort()




end event

type cb_beneficiarios from commandbutton within w_principal_funeraria
event clicked pbm_bnclicked
integer x = 1339
integer y = 2060
integer width = 325
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Beneficiarios"
end type

event clicked;string		ls_string,ls_base,ls_serie
long		ll_tipo_benef,ll_capac,ll_cod_parque,ll_row
Double	ll_numero

dw_listado.accepttext()
if dw_listado.getrow()>0 then
	ll_row														= dw_listado.getrow()
		
	ls_base													= dw_listado.getitemstring(ll_row,'codigo')
	ls_serie													= dw_listado.getitemstring(ll_row,'serie')
	ll_numero												= dw_listado.getitemnumber(ll_row,'numero')
	ll_cod_parque											= dw_listado.getitemnumber(ll_row,'cod_parque')
	
	ll_tipo_benef											= 1
	ll_capac													= 1
	
	if not isnull(ll_tipo_benef) and ll_tipo_benef>0 then
		ls_string												= string(ll_tipo_benef)+'~t'+string(ll_cod_parque)+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_capac)
		openwithparm(w_producto_beneficiarios,ls_string)
	end if
end if
	

end event

type cb_datos_clientes from commandbutton within w_principal_funeraria
event clicked pbm_bnclicked
integer x = 914
integer y = 2060
integer width = 325
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Dat&os Cliente"
end type

event clicked;if dw_listado.getrow() > 0 then Open(w_datos_cliente)
end event

type cb_datos_contrato from commandbutton within w_principal_funeraria
event clicked pbm_bnclicked
integer x = 544
integer y = 2060
integer width = 366
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Datos Contrato"
end type

event clicked;if dw_listado.getrow() > 0 then 
	Open(w_datos_contrato_funeraria)
end if
end event

type cb_cuenta_cte from commandbutton within w_principal_funeraria
integer x = 32
integer y = 2060
integer width = 411
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_listado.getrow() > 0 then Open(w_cuenta_corriente_funeraria)
end event

type cb_refrescar from commandbutton within w_principal_funeraria
boolean visible = false
integer x = 46
integer y = 2060
integer width = 302
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Refrescar"
end type

event clicked;//long ll_total_ofertas
//
//Open(w_espera)
//ll_total_ofertas = dw_listado_ofertas.Retrieve()
//Close(w_espera)
//st_1.text = String(ll_total_ofertas,"###,###,###") + " Ofertas"
//
end event

type st_1 from statictext within w_principal_funeraria
integer x = 2071
integer y = 252
integer width = 1449
integer height = 100
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
boolean focusrectangle = false
end type

type cb_salir from commandbutton within w_principal_funeraria
integer x = 3209
integer y = 2060
integer width = 338
integer height = 100
integer taborder = 140
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_principal_funeraria)

end event

type p_1 from picture within w_principal_funeraria
integer x = 27
integer y = 20
integer width = 347
integer height = 364
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_listado from datawindow within w_principal_funeraria
integer x = 32
integer y = 428
integer width = 3511
integer height = 1592
integer taborder = 60
string dataobject = "dw_listado_funeraria_crematorio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base 		= GetItemString(row, "codigo")
	gs_serie 		= GetItemString(row, "serie")
	gi_numero	= GetItemNumber(row, "numero")
	gi_rut 		= This.GetItemNumber(row, "rut_comprador")
	cb_4.enabled = f_fallecido(gs_serie, gi_numero, gs_base) > 0	
END IF

end event

event doubleclicked;//gi_tipo_busqueda = 1
if row>0 then
	gs_base 		= GetItemString(row, "codigo")
	gs_serie 		= GetItemString(row, "serie")
	gi_numero	= GetItemNumber(row, "numero")
	gi_rut 		= This.GetItemNumber(row, "rut_comprador")
	Open(w_cuenta_corriente_oferta)
end if
//open(w_listado_contratos_rut)
end event

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	gs_base 			= GetItemString(this.getrow(), "codigo")
	gs_serie 			= GetItemString(this.getrow(), "serie")
	gi_numero		= GetItemNumber(this.getrow(), "numero")
	gi_rut 			= GetItemNumber(this.getrow(), "rut_comprador")
	cb_4.enabled 	= f_fallecido(gs_serie, gi_numero, gs_base) > 0	
END IF

end event

type gb_1 from groupbox within w_principal_funeraria
integer x = 2811
integer y = 20
integer width = 736
integer height = 192
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Utilitarios"
end type

