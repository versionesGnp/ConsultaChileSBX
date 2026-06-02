forward
global type w_principal_fallecidos from window
end type
type st_2 from statictext within w_principal_fallecidos
end type
type cb_cta_cte from commandbutton within w_principal_fallecidos
end type
type p_1 from picture within w_principal_fallecidos
end type
type st_1 from statictext within w_principal_fallecidos
end type
type cb_2 from commandbutton within w_principal_fallecidos
end type
type cb_3 from commandbutton within w_principal_fallecidos
end type
type cb_4 from commandbutton within w_principal_fallecidos
end type
type dw_lista from datawindow within w_principal_fallecidos
end type
type cb_cerrar from commandbutton within w_principal_fallecidos
end type
type gb_1 from groupbox within w_principal_fallecidos
end type
end forward

global type w_principal_fallecidos from window
integer x = 5
integer y = 4
integer width = 3611
integer height = 2288
boolean titlebar = true
string title = "LISTADO GENERAL DE FALLECIDOS"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_2 st_2
cb_cta_cte cb_cta_cte
p_1 p_1
st_1 st_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
dw_lista dw_lista
cb_cerrar cb_cerrar
gb_1 gb_1
end type
global w_principal_fallecidos w_principal_fallecidos

on w_principal_fallecidos.create
this.st_2=create st_2
this.cb_cta_cte=create cb_cta_cte
this.p_1=create p_1
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.cb_cta_cte,&
this.p_1,&
this.st_1,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.dw_lista,&
this.cb_cerrar,&
this.gb_1}
end on

on w_principal_fallecidos.destroy
destroy(this.st_2)
destroy(this.cb_cta_cte)
destroy(this.p_1)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.gb_1)
end on

event open;long	ll_tot_reg
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
gf_centrar(w_principal_fallecidos)
dw_lista.settransobject(sqlca)
ll_tot_reg	= dw_lista.retrieve()
st_1.text	= string(ll_tot_reg,"###,###,###,###,##0")+" Fallecidos"
setpointer(Arrow!)
end event

type st_2 from statictext within w_principal_fallecidos
integer x = 439
integer y = 96
integer width = 1449
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
string text = "Listado General Fallecidos"
boolean focusrectangle = false
end type

type cb_cta_cte from commandbutton within w_principal_fallecidos
integer x = 1591
integer y = 2056
integer width = 759
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Contratos &Asociados * Rut"
end type

event clicked;if dw_lista.getrow() > 0 then 
	gi_rut = dw_lista.getitemnumber(dw_lista.getrow(),'cadena_rut')
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if
end event

type p_1 from picture within w_principal_fallecidos
integer x = 37
integer y = 32
integer width = 306
integer height = 256
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_principal_fallecidos
integer x = 46
integer y = 2056
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
string text = "0 Fallecidos"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_principal_fallecidos
integer x = 2779
integer y = 120
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
dw_lista.setsort(nulo)
dw_lista.sort()

end event

type cb_3 from commandbutton within w_principal_fallecidos
integer x = 3008
integer y = 120
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
dw_lista.setfilter(nulo)
dw_lista.filter()
st_1.text	= string(dw_lista.rowcount(),"###,###,###,###,##0")+" Fallecidos"
end event

type cb_4 from commandbutton within w_principal_fallecidos
integer x = 3237
integer y = 120
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
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

//SaveAsType TipoArchivo
//string Archivo
//boolean encabezado
//integer ret
//TipoArchivo = excel!
//Archivo = 'fallecidos.xls'
//
//If FileExists(Archivo) Then
//	Ret = MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
//	If Ret = 2 Then
//		Close(Parent)
//		Return
//	End If
//End If
//Ret = dw_lista.SaveAs( Archivo,TipoArchivo, true)
//If Ret < 0  Then
//	MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
//End If
end event

type dw_lista from datawindow within w_principal_fallecidos
integer x = 37
integer y = 320
integer width = 3511
integer height = 1696
integer taborder = 40
string title = "none"
string dataobject = "dw_general_fallecido"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base 		= GetItemString(row, "base")
	gi_rut		= GetItemnumber(row, 'cadena_rut')
	gs_serie 	= GetItemString(row, "ss")
	gi_numero 	= GetItemNumber(row, "contrato")
END IF
end event

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	gs_base 		= GetItemString(this.getrow(), "base")
	gi_rut		= GetItemnumber(this.getrow(), 'cadena_rut')
	gs_serie 	= GetItemString(this.getrow(), "ss")
	gi_numero 	= GetItemNumber(this.getrow(), "contrato")
END IF
end event

type cb_cerrar from commandbutton within w_principal_fallecidos
integer x = 3145
integer y = 2048
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_principal_fallecidos)
end event

type gb_1 from groupbox within w_principal_fallecidos
integer x = 2734
integer y = 44
integer width = 814
integer height = 208
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Utilitarios"
end type

