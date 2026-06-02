forward
global type w_principal_repacta_cta_mant_anexo from window
end type
type st_2 from statictext within w_principal_repacta_cta_mant_anexo
end type
type cb_4 from commandbutton within w_principal_repacta_cta_mant_anexo
end type
type cb_3 from commandbutton within w_principal_repacta_cta_mant_anexo
end type
type cb_2 from commandbutton within w_principal_repacta_cta_mant_anexo
end type
type cb_1 from commandbutton within w_principal_repacta_cta_mant_anexo
end type
type cb_cta_cte from commandbutton within w_principal_repacta_cta_mant_anexo
end type
type st_1 from statictext within w_principal_repacta_cta_mant_anexo
end type
type cb_salir from commandbutton within w_principal_repacta_cta_mant_anexo
end type
type p_1 from picture within w_principal_repacta_cta_mant_anexo
end type
type dw_listado_liberador from datawindow within w_principal_repacta_cta_mant_anexo
end type
type gb_1 from groupbox within w_principal_repacta_cta_mant_anexo
end type
end forward

global type w_principal_repacta_cta_mant_anexo from window
integer x = 818
integer y = 560
integer width = 3621
integer height = 2336
boolean titlebar = true
string title = "Anexo Liberador Cuotas de Mantención Mora"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_2 st_2
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_cta_cte cb_cta_cte
st_1 st_1
cb_salir cb_salir
p_1 p_1
dw_listado_liberador dw_listado_liberador
gb_1 gb_1
end type
global w_principal_repacta_cta_mant_anexo w_principal_repacta_cta_mant_anexo

on w_principal_repacta_cta_mant_anexo.create
this.st_2=create st_2
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cta_cte=create cb_cta_cte
this.st_1=create st_1
this.cb_salir=create cb_salir
this.p_1=create p_1
this.dw_listado_liberador=create dw_listado_liberador
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_cta_cte,&
this.st_1,&
this.cb_salir,&
this.p_1,&
this.dw_listado_liberador,&
this.gb_1}
end on

on w_principal_repacta_cta_mant_anexo.destroy
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cta_cte)
destroy(this.st_1)
destroy(this.cb_salir)
destroy(this.p_1)
destroy(this.dw_listado_liberador)
destroy(this.gb_1)
end on

event open;Long		ll_total,i,numero,ll_count_reg
String		base,serie

setpointer(hourglass!)
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
gf_centrar(w_principal_repacta_cta_mant_anexo)
dw_listado_liberador.SetTransObject(SQLCA)
gs_ventana					= 'w_principal_repacta_cta_mant_anexo'
f_valida_objeto()
ll_total = dw_listado_liberador.Retrieve()
st_1.text = String(ll_total,"###,###,###") + " Anexo Liberador Reprog.Ctas.Mant."
setpointer(arrow!)

end event

type st_2 from statictext within w_principal_repacta_cta_mant_anexo
integer x = 416
integer y = 112
integer width = 2217
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado General Anexo Reprogramación Cuota de Mantención"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_principal_repacta_cta_mant_anexo
boolean visible = false
integer x = 2135
integer y = 2084
integer width = 443
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Rel&ación * Rut"
end type

event clicked;//if dw_listado_liberador.getrow() > 0 then 
//	gi_rut = dw_listado_liberador.getitemnumber(dw_listado_liberador.getrow(),'cadena_rut')
//	gi_tipo_busqueda = 1
//	open(w_listado_contratos)
//end if
end event

type cb_3 from commandbutton within w_principal_repacta_cta_mant_anexo
integer x = 3246
integer y = 112
integer width = 265
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_listado_liberador
if dw_listado_liberador.rowcount() > 0 then f_DWToExcel( dw_paso )

//SaveAsType TipoArchivo
//string Archivo
//boolean encabezado
//integer ret
//
//TipoArchivo = excel!
//Archivo = 'reprog.xls'
//
//If FileExists(Archivo) Then
//	Ret = MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
//	If Ret = 2 Then
//		Close(Parent)
//		Return
//	End If
//End If
//Ret = dw_listado_liberador.SaveAs( Archivo,TipoArchivo, true)
//If Ret < 0  Then
//	MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
//End If
end event

type cb_2 from commandbutton within w_principal_repacta_cta_mant_anexo
integer x = 3017
integer y = 112
integer width = 224
integer height = 92
integer taborder = 20
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
dw_listado_liberador.setfilter(nulo)
dw_listado_liberador.filter()
st_1.text	= string(dw_listado_liberador.rowcount(),"###,###,###,###,##0")+" Anexo Liberador Reprog.Ctas.Mant."
end event

type cb_1 from commandbutton within w_principal_repacta_cta_mant_anexo
integer x = 2789
integer y = 112
integer width = 224
integer height = 92
integer taborder = 10
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
dw_listado_liberador.setsort(nulo)
dw_listado_liberador.sort()

end event

type cb_cta_cte from commandbutton within w_principal_repacta_cta_mant_anexo
boolean visible = false
integer x = 1618
integer y = 2084
integer width = 503
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&uenta Corriente"
end type

event clicked;//if dw_listado_liberador.getrow() > 0 then open(w_cuenta_corriente_repactar_cta_mant)

end event

type st_1 from statictext within w_principal_repacta_cta_mant_anexo
integer x = 37
integer y = 2084
integer width = 1454
integer height = 104
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "0 Anexo Liberador Reprog.Ctas.Mant."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_salir from commandbutton within w_principal_repacta_cta_mant_anexo
integer x = 3186
integer y = 2084
integer width = 370
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_principal_repacta_cta_mant_anexo)

end event

type p_1 from picture within w_principal_repacta_cta_mant_anexo
integer x = 32
integer y = 24
integer width = 315
integer height = 264
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_listado_liberador from datawindow within w_principal_repacta_cta_mant_anexo
integer x = 37
integer y = 308
integer width = 3511
integer height = 1716
integer taborder = 40
string dataobject = "d_listado_repacta_cta_mant_anexo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
//	gs_base 		= "R"
//	gs_serie 	= GetItemString(row, "repacta_mantencion_serie")
//	gi_numero 	= GetItemNumber(row, "repacta_mantencion_numero")
//	gi_rut		= GetItemnumber(row, 'cadena_rut')
END IF
end event

event doubleclicked;if row>0 then
//	gs_base 		= "R"
//	gs_serie 	= GetItemString(row, "repacta_mantencion_serie")
//	gi_numero 	= GetItemNumber(row, "repacta_mantencion_numero")
//	gi_rut	= GetItemnumber(row, 'cadena_rut')
//	open(w_cuenta_corriente_repactar_cta_mant)
end if
end event

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
//	gs_base 		= "R"
//	gs_serie 	= GetItemString(this.getrow(), "repacta_mantencion_serie")
//	gi_numero 	= GetItemNumber(this.getrow(), "repacta_mantencion_numero")
//	gi_rut		= GetItemnumber(this.getrow(), 'cadena_rut')
END IF
end event

type gb_1 from groupbox within w_principal_repacta_cta_mant_anexo
integer x = 2757
integer y = 28
integer width = 786
integer height = 216
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Utilitarios"
end type

