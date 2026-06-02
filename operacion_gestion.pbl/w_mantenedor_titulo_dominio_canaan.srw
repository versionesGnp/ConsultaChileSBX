forward
global type w_mantenedor_titulo_dominio_canaan from window
end type
type pb_aceptar from picturebutton within w_mantenedor_titulo_dominio_canaan
end type
type st_1 from statictext within w_mantenedor_titulo_dominio_canaan
end type
type em_numero from editmask within w_mantenedor_titulo_dominio_canaan
end type
type st_5 from statictext within w_mantenedor_titulo_dominio_canaan
end type
type em_serie from editmask within w_mantenedor_titulo_dominio_canaan
end type
type em_base from editmask within w_mantenedor_titulo_dominio_canaan
end type
type st_4 from statictext within w_mantenedor_titulo_dominio_canaan
end type
type cb_1 from commandbutton within w_mantenedor_titulo_dominio_canaan
end type
type cb_actualizar from commandbutton within w_mantenedor_titulo_dominio_canaan
end type
type dw_lista from datawindow within w_mantenedor_titulo_dominio_canaan
end type
type gb_1 from groupbox within w_mantenedor_titulo_dominio_canaan
end type
end forward

global type w_mantenedor_titulo_dominio_canaan from window
integer width = 1879
integer height = 1024
boolean titlebar = true
string title = "Cambio Estado Titulo Dominio"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_aceptar pb_aceptar
st_1 st_1
em_numero em_numero
st_5 st_5
em_serie em_serie
em_base em_base
st_4 st_4
cb_1 cb_1
cb_actualizar cb_actualizar
dw_lista dw_lista
gb_1 gb_1
end type
global w_mantenedor_titulo_dominio_canaan w_mantenedor_titulo_dominio_canaan

on w_mantenedor_titulo_dominio_canaan.create
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.em_numero=create em_numero
this.st_5=create st_5
this.em_serie=create em_serie
this.em_base=create em_base
this.st_4=create st_4
this.cb_1=create cb_1
this.cb_actualizar=create cb_actualizar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.pb_aceptar,&
this.st_1,&
this.em_numero,&
this.st_5,&
this.em_serie,&
this.em_base,&
this.st_4,&
this.cb_1,&
this.cb_actualizar,&
this.dw_lista,&
this.gb_1}
end on

on w_mantenedor_titulo_dominio_canaan.destroy
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.em_numero)
destroy(this.st_5)
destroy(this.em_serie)
destroy(this.em_base)
destroy(this.st_4)
destroy(this.cb_1)
destroy(this.cb_actualizar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_mantenedor_titulo_dominio_canaan)
dw_lista.settransobject(sqlca)


end event

type pb_aceptar from picturebutton within w_mantenedor_titulo_dominio_canaan
integer x = 1477
integer y = 60
integer width = 137
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
end type

event clicked;String		ls_base,ls_serie
Double 	ll_numero

dw_lista.reset()
ls_base		= trim(em_base.text)
ls_serie		= trim(em_serie.text)
ll_numero	= double(em_numero.text)
if em_base.text='' or isnull(em_numero.text) then
	messagebox("Advertencia","Debe Ingresar Base")
	em_base.setfocus()
else
	if em_serie.text='' or isnull(em_serie.text) then
		messagebox("Advertencia","Debe Ingresar Serie")
		em_serie.setfocus()
	else
		if Double(em_numero.text)=0 or isnull(em_numero.text) then
			messagebox("Advertencia","Debe Ingresar Número")
			em_numero.setfocus()
		else
			if dw_lista.retrieve(ls_base,ls_serie,ll_numero)=0 then
				messagebox("Advertencia","No registra dato")
			else
				dw_lista.retrieve(ls_base,ls_serie,ll_numero)
			end if
		end if
	end if
end if
end event

type st_1 from statictext within w_mantenedor_titulo_dominio_canaan
integer x = 27
integer y = 80
integer width = 517
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Promesa:"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_numero from editmask within w_mantenedor_titulo_dominio_canaan
integer x = 901
integer y = 68
integer width = 530
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;//pb_aceptar.triggerEvent(clicked!)
dw_lista.reset()
end event

type st_5 from statictext within w_mantenedor_titulo_dominio_canaan
integer x = 855
integer y = 84
integer width = 46
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "-"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_serie from editmask within w_mantenedor_titulo_dominio_canaan
integer x = 727
integer y = 68
integer width = 123
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

type em_base from editmask within w_mantenedor_titulo_dominio_canaan
integer x = 553
integer y = 68
integer width = 123
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

type st_4 from statictext within w_mantenedor_titulo_dominio_canaan
integer x = 681
integer y = 84
integer width = 46
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "-"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_mantenedor_titulo_dominio_canaan
integer x = 1458
integer y = 788
integer width = 347
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close (w_mantenedor_titulo_dominio_canaan)
end event

type cb_actualizar from commandbutton within w_mantenedor_titulo_dominio_canaan
integer x = 32
integer y = 788
integer width = 347
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Long		ll_res,ll_tot_reg

ll_tot_reg		= dw_lista.rowcount()
if ll_tot_reg >0 then
	ll_res					= messagebox("Grabar","¿Desea Actualizar Estado de Titulo?",Exclamation!,YesNo!,2)
	if ll_res=1 then
		if dw_lista.update() = 1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			close (w_mantenedor_titulo_dominio_canaan)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Cambio Estado Titulo SQL: "+sqlca.sqlerrtext)
		end if
	end if
else
	messagebox('Error Grabar','No Hay Datos')
end if

end event

type dw_lista from datawindow within w_mantenedor_titulo_dominio_canaan
integer x = 23
integer y = 224
integer width = 1783
integer height = 524
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_estado_titulo_canaan"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_mantenedor_titulo_dominio_canaan
integer x = 9
integer y = 12
integer width = 1797
integer height = 196
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

