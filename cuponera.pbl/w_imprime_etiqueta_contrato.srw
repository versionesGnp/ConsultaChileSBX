forward
global type w_imprime_etiqueta_contrato from window
end type
type cb_11 from commandbutton within w_imprime_etiqueta_contrato
end type
type cb_7 from commandbutton within w_imprime_etiqueta_contrato
end type
type dw_2 from datawindow within w_imprime_etiqueta_contrato
end type
type pb_fin from picture within w_imprime_etiqueta_contrato
end type
type pb_antes from picture within w_imprime_etiqueta_contrato
end type
type pb_sigue from picture within w_imprime_etiqueta_contrato
end type
type pb_primer from picture within w_imprime_etiqueta_contrato
end type
type cb_6 from commandbutton within w_imprime_etiqueta_contrato
end type
type cb_5 from commandbutton within w_imprime_etiqueta_contrato
end type
type cb_4 from commandbutton within w_imprime_etiqueta_contrato
end type
type cb_3 from commandbutton within w_imprime_etiqueta_contrato
end type
type cb_1 from commandbutton within w_imprime_etiqueta_contrato
end type
type dw_1 from datawindow within w_imprime_etiqueta_contrato
end type
end forward

global type w_imprime_etiqueta_contrato from window
integer x = 5
integer y = 4
integer width = 3831
integer height = 2404
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_11 cb_11
cb_7 cb_7
dw_2 dw_2
pb_fin pb_fin
pb_antes pb_antes
pb_sigue pb_sigue
pb_primer pb_primer
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_1 cb_1
dw_1 dw_1
end type
global w_imprime_etiqueta_contrato w_imprime_etiqueta_contrato

on w_imprime_etiqueta_contrato.create
this.cb_11=create cb_11
this.cb_7=create cb_7
this.dw_2=create dw_2
this.pb_fin=create pb_fin
this.pb_antes=create pb_antes
this.pb_sigue=create pb_sigue
this.pb_primer=create pb_primer
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_11,&
this.cb_7,&
this.dw_2,&
this.pb_fin,&
this.pb_antes,&
this.pb_sigue,&
this.pb_primer,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_1,&
this.dw_1}
end on

on w_imprime_etiqueta_contrato.destroy
destroy(this.cb_11)
destroy(this.cb_7)
destroy(this.dw_2)
destroy(this.pb_fin)
destroy(this.pb_antes)
destroy(this.pb_sigue)
destroy(this.pb_primer)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;gf_centrar(w_imprime_etiqueta_contrato)
gs_ventana		= 'w_imprime_etiqueta_contrato'
f_valida_objeto()
this.title = gs_app_name+' - Contratos'
dw_1.settransobject (sqlca)
dw_2.settransobject (sqlca)
if dw_1.retrieve() = 0 then
	messagebox('No hay Registros','No hay Registros para imprimir',stopsign!)
	close(w_imprime_etiqueta_contrato)
else
	dw_2.retrieve()
end if
end event

type cb_11 from commandbutton within w_imprime_etiqueta_contrato
event clicked pbm_bnclicked
integer x = 567
integer y = 2160
integer width = 576
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Etiquetas"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type cb_7 from commandbutton within w_imprime_etiqueta_contrato
event clicked pbm_bnclicked
integer x = 46
integer y = 2160
integer width = 517
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Listado"
end type

event clicked;Long		ll_tot_reg,ll_indi
String	ls_direc_comp,ls_tipo_via
ll_tot_reg	= dw_2.rowcount()
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ls_direc_comp	= dw_2.getitemstring(ll_indi,'compute_5')
		ls_tipo_via		= dw_2.getitemstring(ll_indi,'tipo_via_descripcion')
		if ls_tipo_via<>'-' and not isnull(ls_tipo_via) then ls_direc_comp=trim(ls_tipo_via)+' '+trim(ls_direc_comp)
		dw_2.setitem(ll_indi,'direccion_completa',ls_direc_comp)
	next
	dw_2.accepttext()
	dw_2.SaveAs("C:\Mod_cp\cuponera\contratos"+string(day(today()))+'_'+string(month(today()))+'_'+string(year(today()))+'.xls',Excel! , true)
	if 1 = messagebox('Imprimir','¿ Desea Imprimir listado ?',information!,yesno!,2) then f_Print( dw_2 )
end if
end event

type dw_2 from datawindow within w_imprime_etiqueta_contrato
boolean visible = false
integer x = 1879
integer y = 2148
integer width = 494
integer height = 360
integer taborder = 70
string dataobject = "dw_etiquetas_contratos_listado"
boolean livescroll = true
end type

type pb_fin from picture within w_imprime_etiqueta_contrato
integer x = 1568
integer y = 2180
integer width = 73
integer height = 60
string picturename = "fin.bmp"
boolean focusrectangle = false
end type

event clicked;dw_1.ScrollToRow(dw_1.rowcount() )
end event

type pb_antes from picture within w_imprime_etiqueta_contrato
integer x = 1303
integer y = 2180
integer width = 73
integer height = 60
string picturename = "flec_iz.bmp"
boolean focusrectangle = false
end type

event clicked;dw_1.ScrollPriorPage( )
end event

type pb_sigue from picture within w_imprime_etiqueta_contrato
integer x = 1435
integer y = 2180
integer width = 73
integer height = 60
string picturename = "flec_de.bmp"
boolean focusrectangle = false
end type

event clicked;dw_1.ScrollNextPage( )
end event

type pb_primer from picture within w_imprime_etiqueta_contrato
integer x = 1179
integer y = 2180
integer width = 73
integer height = 60
string picturename = "primer.bmp"
boolean focusrectangle = false
end type

event clicked;dw_1.ScrollToRow(1)
end event

type cb_6 from commandbutton within w_imprime_etiqueta_contrato
integer x = 1545
integer y = 2160
integer width = 128
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;pb_fin.TriggerEvent(clicked!)
end event

type cb_5 from commandbutton within w_imprime_etiqueta_contrato
integer x = 1280
integer y = 2160
integer width = 128
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type cb_4 from commandbutton within w_imprime_etiqueta_contrato
integer x = 1413
integer y = 2160
integer width = 128
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type cb_3 from commandbutton within w_imprime_etiqueta_contrato
integer x = 1147
integer y = 2160
integer width = 128
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;pb_primer.TriggerEvent(clicked!)
end event

type cb_1 from commandbutton within w_imprime_etiqueta_contrato
integer x = 3442
integer y = 2160
integer width = 325
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_imprime_etiqueta_contrato)
end event

type dw_1 from datawindow within w_imprime_etiqueta_contrato
integer x = 46
integer y = 36
integer width = 3721
integer height = 2096
integer taborder = 80
string dataobject = "dw_etiquetas_contratos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

