forward
global type w_generar_libro_maestro_sepultacion from window
end type
type pb_filtrar_folio from picturebutton within w_generar_libro_maestro_sepultacion
end type
type em_folio from editmask within w_generar_libro_maestro_sepultacion
end type
type st_1 from statictext within w_generar_libro_maestro_sepultacion
end type
type cb_filtrar from commandbutton within w_generar_libro_maestro_sepultacion
end type
type cb_sort from commandbutton within w_generar_libro_maestro_sepultacion
end type
type cb_exportar from commandbutton within w_generar_libro_maestro_sepultacion
end type
type cb_print from commandbutton within w_generar_libro_maestro_sepultacion
end type
type cb_cerrar from commandbutton within w_generar_libro_maestro_sepultacion
end type
type dw_lista from datawindow within w_generar_libro_maestro_sepultacion
end type
type gb_1 from groupbox within w_generar_libro_maestro_sepultacion
end type
end forward

global type w_generar_libro_maestro_sepultacion from window
integer width = 4005
integer height = 2060
boolean titlebar = true
string title = "Imprimir MAESTRO de Sepultaciones"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
pb_filtrar_folio pb_filtrar_folio
em_folio em_folio
st_1 st_1
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_print cb_print
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_generar_libro_maestro_sepultacion w_generar_libro_maestro_sepultacion

type variables
String	is_opcion
Long		il_parque
end variables

on w_generar_libro_maestro_sepultacion.create
this.pb_filtrar_folio=create pb_filtrar_folio
this.em_folio=create em_folio
this.st_1=create st_1
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_print=create cb_print
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.pb_filtrar_folio,&
this.em_folio,&
this.st_1,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_print,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_generar_libro_maestro_sepultacion.destroy
destroy(this.pb_filtrar_folio)
destroy(this.em_folio)
destroy(this.st_1)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_print)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_generar_libro_maestro_sepultacion)
is_opcion	= substr(1,1,Message.StringParm)
il_parque	= Long(substr(1,2,Message.StringParm))
if is_opcion='M' then
	dw_lista.dataobject	= 'dw_imprimir_libro_maestro_sepultaciones'
elseif is_opcion='H' then
	dw_lista.dataobject	= 'dw_imprimir_libro_exhumacion_traslado'
elseif is_opcion='R' then
	dw_lista.dataobject	= 'dw_imprimir_libro_reducciones'
elseif is_opcion='V' then
	dw_lista.dataobject	= 'dw_imprimir_libro_ultima_voluntad'
elseif is_opcion='T' then
	dw_lista.dataobject	= 'dw_imprimir_libro_cadaver_transito'
end if
dw_lista.settransobject(sqlca)
if dw_lista.retrieve(il_parque)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_generar_libro_maestro_sepultacion)
else
	gs_ventana	= 'w_generar_libro_maestro_sepultacion'
	f_valida_objeto2()
end if
end event

type pb_filtrar_folio from picturebutton within w_generar_libro_maestro_sepultacion
integer x = 1563
integer y = 1752
integer width = 137
integer height = 124
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
alignment htextalign = left!
end type

event clicked;string 	ls_string
Long		ll_folio

ll_folio	= long(em_folio.text)
if ll_folio > 0 then
	if is_opcion='V' then
		ls_string	= 'correlativo >= '+string(ll_folio)
	else
		ls_string	= 'correlativo_interno >= '+string(ll_folio)
	end if
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
end if
end event

type em_folio from editmask within w_generar_libro_maestro_sepultacion
integer x = 1093
integer y = 1760
integer width = 453
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

type st_1 from statictext within w_generar_libro_maestro_sepultacion
integer x = 471
integer y = 1756
integer width = 599
integer height = 116
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar Folio Registro o Número Maestro del"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_filtrar from commandbutton within w_generar_libro_maestro_sepultacion
integer x = 2715
integer y = 1776
integer width = 224
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_sort from commandbutton within w_generar_libro_maestro_sepultacion
integer x = 2487
integer y = 1776
integer width = 224
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_generar_libro_maestro_sepultacion
integer x = 2167
integer y = 1776
integer width = 224
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_print from commandbutton within w_generar_libro_maestro_sepultacion
integer x = 41
integer y = 1756
integer width = 343
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Long	ll_res,ll_tot_reg,ll_indi

if dw_lista.rowcount() > 0 then 
	f_Print( dw_lista )
//	ll_res			= messagebox("Impresión","Imprimió Correctamente?... Recuerde se Actualizará LIBRO",Exclamation!,YesNo!,2)
//	if ll_res=1 then
//		ll_tot_reg	= dw_lista.rowcount()
//		for ll_indi=1 to ll_tot_reg
//			dw_lista.setitem(ll_indi,'estado_reg','G')
//		next
//		dw_lista.accepttext()
//		if dw_lista.update()=1 then
//			commit;
//			messagebox("Grabar","Grabación Exitosa")
//		else
//			rollback;
//			messagebox("Error Grabar","Error al Grabar Estado LIBRO SQL: "+sqlca.sqlerrtext)
//		end if
//	end if
end if

end event

type cb_cerrar from commandbutton within w_generar_libro_maestro_sepultacion
integer x = 3589
integer y = 1756
integer width = 325
integer height = 112
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_generar_libro_maestro_sepultacion)
end event

type dw_lista from datawindow within w_generar_libro_maestro_sepultacion
integer x = 41
integer y = 36
integer width = 3872
integer height = 1680
integer taborder = 10
string title = "none"
string dataobject = "dw_imprimir_libro_maestro_sepultaciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_generar_libro_maestro_sepultacion
integer x = 2139
integer y = 1724
integer width = 832
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

