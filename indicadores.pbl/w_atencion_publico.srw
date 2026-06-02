forward
global type w_atencion_publico from window
end type
type cb_3 from commandbutton within w_atencion_publico
end type
type p_4 from picture within w_atencion_publico
end type
type p_3 from picture within w_atencion_publico
end type
type p_2 from picture within w_atencion_publico
end type
type p_1 from picture within w_atencion_publico
end type
type pb_primer from picturebutton within w_atencion_publico
end type
type dw_1 from uo_datawindow within w_atencion_publico
end type
type cb_2 from commandbutton within w_atencion_publico
end type
type cb_1 from commandbutton within w_atencion_publico
end type
type pb_sigue from picturebutton within w_atencion_publico
end type
type pb_antes from picturebutton within w_atencion_publico
end type
type pb_fin from picturebutton within w_atencion_publico
end type
end forward

global type w_atencion_publico from window
integer x = 1189
integer y = 556
integer width = 3593
integer height = 2188
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_3 cb_3
p_4 p_4
p_3 p_3
p_2 p_2
p_1 p_1
pb_primer pb_primer
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
pb_sigue pb_sigue
pb_antes pb_antes
pb_fin pb_fin
end type
global w_atencion_publico w_atencion_publico

event open;string ls_colx,fecha1,fecha2,menu
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name

fecha1 = substr (1,1,Message.StringParm)
fecha2 = substr (1,2,Message.StringParm)
menu	 = substr (1,3,Message.StringParm)
dw_1.dataobject = menu
dw_1.settransobject (sqlca)
if dw_1.retrieve(date(fecha1),date(fecha2)) > 0 then
	dw_1.Modify( "datawindow.horizontalscrollsplit = " + '500' )
end if
end event

on w_atencion_publico.create
this.cb_3=create cb_3
this.p_4=create p_4
this.p_3=create p_3
this.p_2=create p_2
this.p_1=create p_1
this.pb_primer=create pb_primer
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.pb_fin=create pb_fin
this.Control[]={this.cb_3,&
this.p_4,&
this.p_3,&
this.p_2,&
this.p_1,&
this.pb_primer,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.pb_sigue,&
this.pb_antes,&
this.pb_fin}
end on

on w_atencion_publico.destroy
destroy(this.cb_3)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.pb_primer)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.pb_fin)
end on

type cb_3 from commandbutton within w_atencion_publico
boolean visible = false
integer x = 1659
integer y = 1940
integer width = 265
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_1
if dw_1.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type p_4 from picture within w_atencion_publico
event clicked pbm_bnclicked
integer x = 745
integer y = 1964
integer width = 73
integer height = 60
string picturename = "fin.bmp"
boolean focusrectangle = false
end type

event clicked;pb_fin.TriggerEvent(clicked!)
end event

type p_3 from picture within w_atencion_publico
event clicked pbm_bnclicked
integer x = 645
integer y = 1964
integer width = 73
integer height = 60
string picturename = "sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type p_2 from picture within w_atencion_publico
event clicked pbm_bnclicked
integer x = 544
integer y = 1964
integer width = 73
integer height = 60
string picturename = "antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type p_1 from picture within w_atencion_publico
event clicked pbm_bnclicked
integer x = 443
integer y = 1964
integer width = 73
integer height = 60
string picturename = "primer.bmp"
boolean focusrectangle = false
end type

event clicked;pb_primer.TriggerEvent(clicked!)
end event

type pb_primer from picturebutton within w_atencion_publico
event clicked pbm_bnclicked
integer x = 434
integer y = 1948
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollToRow(1)
end event

type dw_1 from uo_datawindow within w_atencion_publico
integer x = 59
integer y = 52
integer width = 3470
integer height = 1844
integer taborder = 10
string dataobject = "dw_cobranza_por_carta"
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;MenuHabilitado= '0011001' //1011001
end event

event rowfocuschanged;call super::rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)
end event

event doubleclicked;call super::doubleclicked;if dw_1.dataobject='dw_atencion_publico' then
	gs_base		= dw_1.getitemstring(dw_1.getrow(),'atencion_log_base')
	gs_serie		= dw_1.getitemstring(dw_1.getrow(),'atencion_log_serie')
	gi_numero	= dw_1.getitemnumber(dw_1.getrow(),'atencion_log_numero')
	gi_rut		= dw_1.getitemnumber(dw_1.getrow(),'rut')
elseif dw_1.dataobject='dw_cobranza_por_carta' then
	gs_base		= dw_1.getitemstring(dw_1.getrow(),'carta_log_base')
	gs_serie		= dw_1.getitemstring(dw_1.getrow(),'carta_log_serie')
	gi_numero	= dw_1.getitemnumber(dw_1.getrow(),'carta_log_numero')
	gi_rut		= dw_1.getitemnumber(dw_1.getrow(),'rut')
elseif dw_1.dataobject='dw_cobranza_telefonica_fecha' then
	gs_base		= dw_1.getitemstring(dw_1.getrow(),'tele_log_base')
	gs_serie		= dw_1.getitemstring(dw_1.getrow(),'tele_log_serie')
	gi_numero	= dw_1.getitemnumber(dw_1.getrow(),'tele_log_numero')
	gi_rut		= dw_1.getitemnumber(dw_1.getrow(),'rut')
end if
IF gi_numero > 0 AND gs_base <> "" AND gs_serie <> "" THEN
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			Open(w_cuenta_corriente_derecho)
		CASE "A"
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "R"
			Open(w_cuenta_corriente_repactar_cta_mant)
	END CHOOSE
END IF

end event

type cb_2 from commandbutton within w_atencion_publico
integer x = 3205
integer y = 1940
integer width = 325
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_atencion_publico)
end event

type cb_1 from commandbutton within w_atencion_publico
integer x = 59
integer y = 1940
integer width = 265
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_1.rowcount() >0 then 
	f_Print( dw_1 )
end if
end event

type pb_sigue from picturebutton within w_atencion_publico
event clicked pbm_bnclicked
integer x = 535
integer y = 1948
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollPriorPage( )
end event

type pb_antes from picturebutton within w_atencion_publico
event clicked pbm_bnclicked
integer x = 635
integer y = 1948
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollNextPage( )
end event

type pb_fin from picturebutton within w_atencion_publico
event clicked pbm_bnclicked
integer x = 736
integer y = 1948
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollToRow(dw_1.rowcount() )
end event

