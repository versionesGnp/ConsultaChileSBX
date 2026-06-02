forward
global type w_impresion_previa_registro_sepultacion from window
end type
type dw_impresion from datawindow within w_impresion_previa_registro_sepultacion
end type
type cb_cancelar from commandbutton within w_impresion_previa_registro_sepultacion
end type
type cb_imprimir from commandbutton within w_impresion_previa_registro_sepultacion
end type
type p_11 from picture within w_impresion_previa_registro_sepultacion
end type
type p_22 from picture within w_impresion_previa_registro_sepultacion
end type
type p_33 from picture within w_impresion_previa_registro_sepultacion
end type
type p_44 from picture within w_impresion_previa_registro_sepultacion
end type
type pb_primer from picturebutton within w_impresion_previa_registro_sepultacion
end type
type pb_sigue from picturebutton within w_impresion_previa_registro_sepultacion
end type
type pb_antes from picturebutton within w_impresion_previa_registro_sepultacion
end type
type pb_fin from picturebutton within w_impresion_previa_registro_sepultacion
end type
type gb_1 from groupbox within w_impresion_previa_registro_sepultacion
end type
end forward

global type w_impresion_previa_registro_sepultacion from window
integer x = 192
integer y = 236
integer width = 3296
integer height = 1852
boolean titlebar = true
string title = "Impresión Previa"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
dw_impresion dw_impresion
cb_cancelar cb_cancelar
cb_imprimir cb_imprimir
p_11 p_11
p_22 p_22
p_33 p_33
p_44 p_44
pb_primer pb_primer
pb_sigue pb_sigue
pb_antes pb_antes
pb_fin pb_fin
gb_1 gb_1
end type
global w_impresion_previa_registro_sepultacion w_impresion_previa_registro_sepultacion

on w_impresion_previa_registro_sepultacion.create
this.dw_impresion=create dw_impresion
this.cb_cancelar=create cb_cancelar
this.cb_imprimir=create cb_imprimir
this.p_11=create p_11
this.p_22=create p_22
this.p_33=create p_33
this.p_44=create p_44
this.pb_primer=create pb_primer
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.pb_fin=create pb_fin
this.gb_1=create gb_1
this.Control[]={this.dw_impresion,&
this.cb_cancelar,&
this.cb_imprimir,&
this.p_11,&
this.p_22,&
this.p_33,&
this.p_44,&
this.pb_primer,&
this.pb_sigue,&
this.pb_antes,&
this.pb_fin,&
this.gb_1}
end on

on w_impresion_previa_registro_sepultacion.destroy
destroy(this.dw_impresion)
destroy(this.cb_cancelar)
destroy(this.cb_imprimir)
destroy(this.p_11)
destroy(this.p_22)
destroy(this.p_33)
destroy(this.p_44)
destroy(this.pb_primer)
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.pb_fin)
destroy(this.gb_1)
end on

event open;gf_centrar (w_impresion_previa_registro_sepultacion)
dw_impresion.DataObject	= gs_datawindow_a_imprimir
dw_impresion.SetTransObject(SQLCA)
if dw_impresion.Retrieve(gl_corr_mensual, gl_corr_anual,gl_cod_parque,gdt_fecha_sepult) = 0 then
	messagebox("Advertencia","No Registra Dato a Imprimir")
	close(w_impresion_previa_registro_sepultacion)
end if

if gl_cod_parque = 1 then
	dw_impresion.object.p_prado.visible	= true
	dw_impresion.object.p_canaan.visible	= false
	dw_impresion.object.p_manantial.visible	= false
	dw_impresion.object.p_santiago.visible	= false
	dw_impresion.object.p_foresta.visible	= false
elseif gl_cod_parque = 101 then
	dw_impresion.object.p_prado.visible	= false
	dw_impresion.object.p_canaan.visible	= true
	dw_impresion.object.p_manantial.visible	= false
	dw_impresion.object.p_santiago.visible	= false
	dw_impresion.object.p_foresta.visible	= false
elseif gl_cod_parque = 102 then
	dw_impresion.object.p_prado.visible	= false
	dw_impresion.object.p_canaan.visible	= false
	dw_impresion.object.p_manantial.visible	= true
	dw_impresion.object.p_santiago.visible	= false
	dw_impresion.object.p_foresta.visible	= false
elseif gl_cod_parque = 103 then
	dw_impresion.object.p_prado.visible	= false
	dw_impresion.object.p_canaan.visible	= false
	dw_impresion.object.p_manantial.visible	= false
	dw_impresion.object.p_santiago.visible	= true
	dw_impresion.object.p_foresta.visible	= false
elseif gl_cod_parque = 11 then
	dw_impresion.object.p_prado.visible	= false
	dw_impresion.object.p_canaan.visible	= false
	dw_impresion.object.p_manantial.visible	= false
	dw_impresion.object.p_santiago.visible	= false
	dw_impresion.object.p_foresta.visible	= true	
end if	
end event

type dw_impresion from datawindow within w_impresion_previa_registro_sepultacion
integer x = 37
integer y = 32
integer width = 3205
integer height = 1548
integer taborder = 10
string dataobject = "dw_imprimir_registro_sepultacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from commandbutton within w_impresion_previa_registro_sepultacion
integer x = 2903
integer y = 1624
integer width = 334
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_impresion_previa_registro_sepultacion)
end event

type cb_imprimir from commandbutton within w_impresion_previa_registro_sepultacion
integer x = 2565
integer y = 1624
integer width = 334
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;f_Print( dw_impresion )
Close(w_impresion_previa_registro_sepultacion)
end event

type p_11 from picture within w_impresion_previa_registro_sepultacion
event clicked pbm_bnclicked
integer x = 59
integer y = 1644
integer width = 73
integer height = 60
string picturename = "primer.bmp"
boolean focusrectangle = false
end type

event clicked;pb_primer.TriggerEvent(clicked!)
end event

type p_22 from picture within w_impresion_previa_registro_sepultacion
event clicked pbm_bnclicked
integer x = 160
integer y = 1644
integer width = 73
integer height = 60
string picturename = "antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type p_33 from picture within w_impresion_previa_registro_sepultacion
event clicked pbm_bnclicked
integer x = 261
integer y = 1644
integer width = 73
integer height = 60
string picturename = "sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type p_44 from picture within w_impresion_previa_registro_sepultacion
event clicked pbm_bnclicked
integer x = 357
integer y = 1644
integer width = 73
integer height = 60
string picturename = "fin.bmp"
boolean focusrectangle = false
end type

event clicked;pb_fin.TriggerEvent(clicked!)
end event

type pb_primer from picturebutton within w_impresion_previa_registro_sepultacion
event clicked pbm_bnclicked
integer x = 50
integer y = 1628
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_impresion.ScrollToRow(1) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type pb_sigue from picturebutton within w_impresion_previa_registro_sepultacion
event clicked pbm_bnclicked
integer x = 151
integer y = 1628
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_impresion.ScrollPriorPage( )
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type pb_antes from picturebutton within w_impresion_previa_registro_sepultacion
event clicked pbm_bnclicked
integer x = 251
integer y = 1628
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_impresion.ScrollNextPage( ) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type pb_fin from picturebutton within w_impresion_previa_registro_sepultacion
event clicked pbm_bnclicked
integer x = 347
integer y = 1628
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_impresion.ScrollToRow(dw_impresion.rowcount() ) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type gb_1 from groupbox within w_impresion_previa_registro_sepultacion
integer x = 37
integer y = 1580
integer width = 425
integer height = 156
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

