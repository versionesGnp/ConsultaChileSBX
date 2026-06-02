forward
global type w_ingresar_co_propietario_promesa from window
end type
type st_salir from statictext within w_ingresar_co_propietario_promesa
end type
type cb_salir from picturebutton within w_ingresar_co_propietario_promesa
end type
type st_grabar from statictext within w_ingresar_co_propietario_promesa
end type
type cb_grabar from picturebutton within w_ingresar_co_propietario_promesa
end type
type st_1 from statictext within w_ingresar_co_propietario_promesa
end type
type cb_borrar from picturebutton within w_ingresar_co_propietario_promesa
end type
type st_borrar_benef from statictext within w_ingresar_co_propietario_promesa
end type
type cb_insertar from picturebutton within w_ingresar_co_propietario_promesa
end type
type st_insert_benef from statictext within w_ingresar_co_propietario_promesa
end type
type dw_beneficiarios from datawindow within w_ingresar_co_propietario_promesa
end type
end forward

global type w_ingresar_co_propietario_promesa from window
integer width = 2272
integer height = 1228
boolean titlebar = true
string title = "Ingreso Co-Propietario"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_salir st_salir
cb_salir cb_salir
st_grabar st_grabar
cb_grabar cb_grabar
st_1 st_1
cb_borrar cb_borrar
st_borrar_benef st_borrar_benef
cb_insertar cb_insertar
st_insert_benef st_insert_benef
dw_beneficiarios dw_beneficiarios
end type
global w_ingresar_co_propietario_promesa w_ingresar_co_propietario_promesa

type variables
String	is_base,is_serie
Double	il_numero
end variables

on w_ingresar_co_propietario_promesa.create
this.st_salir=create st_salir
this.cb_salir=create cb_salir
this.st_grabar=create st_grabar
this.cb_grabar=create cb_grabar
this.st_1=create st_1
this.cb_borrar=create cb_borrar
this.st_borrar_benef=create st_borrar_benef
this.cb_insertar=create cb_insertar
this.st_insert_benef=create st_insert_benef
this.dw_beneficiarios=create dw_beneficiarios
this.Control[]={this.st_salir,&
this.cb_salir,&
this.st_grabar,&
this.cb_grabar,&
this.st_1,&
this.cb_borrar,&
this.st_borrar_benef,&
this.cb_insertar,&
this.st_insert_benef,&
this.dw_beneficiarios}
end on

on w_ingresar_co_propietario_promesa.destroy
destroy(this.st_salir)
destroy(this.cb_salir)
destroy(this.st_grabar)
destroy(this.cb_grabar)
destroy(this.st_1)
destroy(this.cb_borrar)
destroy(this.st_borrar_benef)
destroy(this.cb_insertar)
destroy(this.st_insert_benef)
destroy(this.dw_beneficiarios)
end on

event mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_grabar.visible			= false
st_salir.visible				= false

end event

event open;gf_centrar(w_ingresar_co_propietario_promesa)
st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_grabar.visible			= false
st_salir.visible				= false
is_base						= trim(substr(1,1,Message.StringParm))
is_serie						= trim(substr(1,2,Message.StringParm))
il_numero					= Double(substr(1,3,Message.StringParm))
dw_beneficiarios.settransobject(sqlca)
if dw_beneficiarios.Retrieve(is_serie,il_numero)=0 then
//	messagebox("Advertencia","No Registra Dato")
end if

end event

type st_salir from statictext within w_ingresar_co_propietario_promesa
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2043
integer y = 872
integer width = 151
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Salir"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_grabar.visible			= false
st_salir.visible			= false

end event

type cb_salir from picturebutton within w_ingresar_co_propietario_promesa
event ue_mousemove pbm_mousemove
integer x = 2039
integer y = 936
integer width = 160
integer height = 140
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
string disabledname = "salir_off.bmp"
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_grabar.visible			= false
st_salir.visible			= true

end event

event clicked;close(w_ingresar_co_propietario_promesa)
end event

type st_grabar from statictext within w_ingresar_co_propietario_promesa
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 517
integer y = 872
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Grabar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_grabar.visible			= false
st_salir.visible			= false

end event

type cb_grabar from picturebutton within w_ingresar_co_propietario_promesa
event ue_mousemove pbm_mousemove
integer x = 539
integer y = 936
integer width = 160
integer height = 140
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar.bmp"
string disabledname = "grabar_no.bmp"
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_grabar.visible			= true
st_salir.visible			= false

end event

event clicked;Long	i, ll_tot_reg,ll_contador

ll_tot_reg	= dw_beneficiarios.RowCount()
if ll_tot_reg>0 then
	FOR i = 1 to ll_tot_reg
		IF dw_beneficiarios.GetItemNumber(i, "contador") = 0 THEN
			gf_contador_co_prop(ll_contador)
			dw_beneficiarios.SetItem(i, "contador", (ll_contador + (i - 1)))
		END IF
	NEXT
end if
dw_beneficiarios.accepttext()
IF dw_beneficiarios.update() = 1 THEN
	commit;
	messagebox("Grabar","Grabación Exitosa")
	cb_salir.triggerevent(clicked!)
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
END IF
end event

type st_1 from statictext within w_ingresar_co_propietario_promesa
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 20
integer width = 1403
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
string text = "Lista Co-Propietarios"
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_grabar.visible			= false
st_salir.visible			= false

end event

type cb_borrar from picturebutton within w_ingresar_co_propietario_promesa
event ue_mousemove pbm_mousemove
integer x = 293
integer y = 936
integer width = 160
integer height = 140
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Borrar_on.bmp"
string disabledname = "Borrar_off.bmp"
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= true
st_grabar.visible			= false
st_salir.visible			= false

end event

event clicked;Long	ll_resp
IF dw_beneficiarios.GetRow() > 0 THEN
	ll_resp	= messagebox("Advertencia","Está Seguro de Eliminar Registro Nº "+string(dw_beneficiarios.GetRow()),Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_beneficiarios.DeleteRow(dw_beneficiarios.GetRow())
		messagebox("Advertencia","Eliminación Exitosa, recuerde Grabar los Cambios antes de Salir")
	end if
END IF
end event

type st_borrar_benef from statictext within w_ingresar_co_propietario_promesa
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 256
integer y = 872
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Eliminar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_grabar.visible			= false
st_salir.visible			= false

end event

type cb_insertar from picturebutton within w_ingresar_co_propietario_promesa
event ue_mousemove pbm_mousemove
integer x = 46
integer y = 936
integer width = 160
integer height = 140
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Insertar_on.bmp"
string disabledname = "Insertar_off.bmp"
end type

event ue_mousemove;st_insert_benef.visible	= true
st_borrar_benef.visible	= false
st_grabar.visible			= false
st_salir.visible			= false

end event

event clicked;long 		ll_fila, ll_contador,ll_indi,ll_tot_reg
String	ls_nombre,ls_a_pat,ls_a_mat,ls_sw_pasa='N'
if not isnull(is_serie) and not isnull(il_numero) and il_numero>0 then
	ll_tot_reg				= dw_beneficiarios.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_nombre		= trim(dw_beneficiarios.getitemstring(ll_indi,'nombre'))
			ls_a_pat			= trim(dw_beneficiarios.getitemstring(ll_indi,'a_paterno'))
			ls_a_mat			= trim(dw_beneficiarios.getitemstring(ll_indi,'a_materno'))
			if isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre Beneficiario en Fila Nº "+string(ll_indi))
				dw_beneficiarios.setfocus()
				dw_beneficiarios.scrolltorow(ll_indi)
				dw_beneficiarios.setcolumn('nombre')
				ls_sw_pasa	= 'S'
				ll_indi		= ll_tot_reg
			elseif isnull(ls_a_pat) or ls_a_pat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno Beneficiario en Fila Nº "+string(ll_indi))
				dw_beneficiarios.setfocus()
				dw_beneficiarios.scrolltorow(ll_indi)
				dw_beneficiarios.setcolumn('a_paterno')
				ls_sw_pasa	= 'S'
				ll_indi		= ll_tot_reg
			elseif isnull(ls_a_mat) or ls_a_mat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno Beneficiario en Fila Nº "+string(ll_indi))
				dw_beneficiarios.setfocus()
				dw_beneficiarios.scrolltorow(ll_indi)
				dw_beneficiarios.setcolumn('a_materno')
				ls_sw_pasa	= 'S'
				ll_indi		= ll_tot_reg
			end if
		next
	end if
	if ls_sw_pasa='N' then
		ll_fila				= dw_beneficiarios.InsertRow(0)
		dw_beneficiarios.scrolltorow(ll_fila)
		ll_contador 		= 0
		dw_beneficiarios.SetItem(ll_fila, "serie", is_serie)
		dw_beneficiarios.SetItem(ll_fila, "nro_oferta", il_numero)
		dw_beneficiarios.SetItem(ll_fila, "contador", ll_contador)
		dw_beneficiarios.setfocus()
		dw_beneficiarios.Setcolumn('nombre')
	end if
end if
end event

type st_insert_benef from statictext within w_ingresar_co_propietario_promesa
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 14
integer y = 872
integer width = 224
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Insertar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_grabar.visible			= false
st_salir.visible			= false

end event

type dw_beneficiarios from datawindow within w_ingresar_co_propietario_promesa
event ue_mousemove pbm_mousemove
integer x = 46
integer y = 108
integer width = 2153
integer height = 768
integer taborder = 10
string dataobject = "d_ingreso_co_prop"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_grabar.visible			= false
st_salir.visible			= false

end event

