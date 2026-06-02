forward
global type w_modifica_caja_ingreso from window
end type
type cb_limpiar from commandbutton within w_modifica_caja_ingreso
end type
type st_3 from statictext within w_modifica_caja_ingreso
end type
type dw_lista_caja_origen from datawindow within w_modifica_caja_ingreso
end type
type st_2 from statictext within w_modifica_caja_ingreso
end type
type dw_tipo_cobro from datawindow within w_modifica_caja_ingreso
end type
type cb_guardar from commandbutton within w_modifica_caja_ingreso
end type
type cb_cerrar from commandbutton within w_modifica_caja_ingreso
end type
type cb_buscar from commandbutton within w_modifica_caja_ingreso
end type
type st_1 from statictext within w_modifica_caja_ingreso
end type
type sle_folio from singlelineedit within w_modifica_caja_ingreso
end type
type dw_lista_contratos from datawindow within w_modifica_caja_ingreso
end type
end forward

global type w_modifica_caja_ingreso from window
integer width = 3515
integer height = 1092
boolean titlebar = true
string title = "Modificar Caja Ingreso"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_limpiar cb_limpiar
st_3 st_3
dw_lista_caja_origen dw_lista_caja_origen
st_2 st_2
dw_tipo_cobro dw_tipo_cobro
cb_guardar cb_guardar
cb_cerrar cb_cerrar
cb_buscar cb_buscar
st_1 st_1
sle_folio sle_folio
dw_lista_contratos dw_lista_contratos
end type
global w_modifica_caja_ingreso w_modifica_caja_ingreso

type variables
Long	il_mod_cupones, il_mod_cliente_rez, il_mod_agentes,il_row
end variables

on w_modifica_caja_ingreso.create
this.cb_limpiar=create cb_limpiar
this.st_3=create st_3
this.dw_lista_caja_origen=create dw_lista_caja_origen
this.st_2=create st_2
this.dw_tipo_cobro=create dw_tipo_cobro
this.cb_guardar=create cb_guardar
this.cb_cerrar=create cb_cerrar
this.cb_buscar=create cb_buscar
this.st_1=create st_1
this.sle_folio=create sle_folio
this.dw_lista_contratos=create dw_lista_contratos
this.Control[]={this.cb_limpiar,&
this.st_3,&
this.dw_lista_caja_origen,&
this.st_2,&
this.dw_tipo_cobro,&
this.cb_guardar,&
this.cb_cerrar,&
this.cb_buscar,&
this.st_1,&
this.sle_folio,&
this.dw_lista_contratos}
end on

on w_modifica_caja_ingreso.destroy
destroy(this.cb_limpiar)
destroy(this.st_3)
destroy(this.dw_lista_caja_origen)
destroy(this.st_2)
destroy(this.dw_tipo_cobro)
destroy(this.cb_guardar)
destroy(this.cb_cerrar)
destroy(this.cb_buscar)
destroy(this.st_1)
destroy(this.sle_folio)
destroy(this.dw_lista_contratos)
end on

event open;gf_centrar(w_modifica_caja_ingreso)

dw_lista_contratos.settransobject(sqlca)
dw_tipo_cobro.settransobject(sqlca)
dw_lista_caja_origen.settransobject(sqlca)

dw_tipo_cobro.insertrow(0)
dw_tipo_cobro.setitem(1,'tipo_cob','CI')

dw_lista_caja_origen.insertrow(0)
dw_lista_caja_origen.setitem(1,'caja','T5')

end event

type cb_limpiar from commandbutton within w_modifica_caja_ingreso
integer x = 1518
integer y = 864
integer width = 325
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;String	ls_tipo_cob,ls_descrip,ls_string
dw_lista_contratos.reset()
dw_tipo_cobro.setitem(1,'tipo_cob','CI')
dw_lista_caja_origen.setitem(1,'caja','T5')
sle_folio.text	= ''

end event

type st_3 from statictext within w_modifica_caja_ingreso
integer x = 1646
integer y = 64
integer width = 347
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Caja origen: "
boolean focusrectangle = false
end type

type dw_lista_caja_origen from datawindow within w_modifica_caja_ingreso
integer x = 2002
integer y = 60
integer width = 274
integer height = 84
integer taborder = 30
string title = "none"
string dataobject = "ddw_lista_cajas_mod"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_modifica_caja_ingreso
integer x = 891
integer y = 64
integer width = 325
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Cobro:"
boolean focusrectangle = false
end type

type dw_tipo_cobro from datawindow within w_modifica_caja_ingreso
integer x = 1239
integer y = 60
integer width = 311
integer height = 84
integer taborder = 20
string title = "none"
string dataobject = "ddw_lista_tipo_cobro_mod"
boolean border = false
boolean livescroll = true
end type

type cb_guardar from commandbutton within w_modifica_caja_ingreso
integer x = 41
integer y = 864
integer width = 325
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar"
end type

event clicked;Long ll_folio
String ls_tipo_cob,ls_caja_origen,ls_caja_destino

ll_folio								= long(sle_folio.text)
ls_tipo_cob 							= dw_tipo_cobro.GetItemString(1, "tipo_cob")
ls_caja_origen 						= dw_lista_caja_origen.GetItemString(1, "caja")
ls_caja_destino 					= dw_lista_contratos.GetItemString(1, "cod_caja")

if il_mod_cupones > 0 then
	if dw_lista_contratos.update()=1 then
		UPDATE documentos
		SET cod_caja = :ls_caja_destino
		WHERE cod_caja = :ls_caja_origen and folio = :ll_folio and tipo_cob = :ls_tipo_cob
		using sqlca;
		if sqlca.sqlcode=0 then
				commit;
		else
				rollback;
		end if
		dw_lista_contratos.reset()
		messagebox("Grabar","Modificacion exitosa tabla cuponera")
		//cb_limpiar.TriggerEvent(clicked!)
	else
		rollback;
		messageBox("Error","Error al modificar")
	end if
end if


end event

type cb_cerrar from commandbutton within w_modifica_caja_ingreso
integer x = 3109
integer y = 864
integer width = 325
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_modifica_caja_ingreso)
end event

type cb_buscar from commandbutton within w_modifica_caja_ingreso
integer x = 2318
integer y = 48
integer width = 366
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;Long ll_folio
String ls_tipo_cob,ls_caja_origen,ls_caja_destino

ll_folio								= long(sle_folio.text)
ls_tipo_cob 							= dw_tipo_cobro.GetItemString(1, "tipo_cob")
ls_caja_origen 						= dw_lista_caja_origen.GetItemString(1, "caja")

dw_lista_contratos.retrieve(ll_folio,ls_tipo_cob,ls_caja_origen)
end event

type st_1 from statictext within w_modifica_caja_ingreso
integer x = 41
integer y = 64
integer width = 187
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Folio: "
boolean focusrectangle = false
end type

type sle_folio from singlelineedit within w_modifica_caja_ingreso
integer x = 256
integer y = 52
integer width = 594
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_lista_contratos from datawindow within w_modifica_caja_ingreso
integer x = 41
integer y = 196
integer width = 3401
integer height = 652
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_contrato_caja_ingre"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;il_mod_cupones++
end event

