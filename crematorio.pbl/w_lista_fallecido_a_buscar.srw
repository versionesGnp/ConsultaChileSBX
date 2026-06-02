forward
global type w_lista_fallecido_a_buscar from window
end type
type st_titulo from statictext within w_lista_fallecido_a_buscar
end type
type cb_cerrar from commandbutton within w_lista_fallecido_a_buscar
end type
type cb_aceptar from commandbutton within w_lista_fallecido_a_buscar
end type
type dw_fallecido from datawindow within w_lista_fallecido_a_buscar
end type
end forward

global type w_lista_fallecido_a_buscar from window
integer width = 2853
integer height = 1192
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_titulo st_titulo
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_fallecido dw_fallecido
end type
global w_lista_fallecido_a_buscar w_lista_fallecido_a_buscar

type variables
Long	il_row
end variables

on w_lista_fallecido_a_buscar.create
this.st_titulo=create st_titulo
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_fallecido=create dw_fallecido
this.Control[]={this.st_titulo,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_fallecido}
end on

on w_lista_fallecido_a_buscar.destroy
destroy(this.st_titulo)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_fallecido)
end on

event open;String	ls_sector,ls_sepultura

gf_centrar(w_lista_fallecido_a_buscar)
dw_fallecido.settransobject(sqlca)
ls_sector			= substr(1,1,Message.StringParm)
ls_sepultura		= substr(1,2,Message.StringParm)
if dw_fallecido.retrieve(ls_sector,ls_sepultura)=0 then
	messagebox("Advertencia","No Registra Fallecido Sector: "+ls_sector+" Sepultura: "+ls_sepultura)
	close(w_lista_fallecido_a_buscar)
else
	this.title		= 'Lista Fallecido en Sector: '+ls_sector+' Sepultura: '+ls_sepultura
	st_titulo.text	= 'Lista Fallecido en Sector: '+ls_sector+' Sepultura: '+ls_sepultura
end if

end event

type st_titulo from statictext within w_lista_fallecido_a_buscar
integer x = 41
integer y = 24
integer width = 2304
integer height = 68
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_lista_fallecido_a_buscar
integer x = 2478
integer y = 956
integer width = 311
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setfocus()
close(w_lista_fallecido_a_buscar)
end event

type cb_aceptar from commandbutton within w_lista_fallecido_a_buscar
integer x = 32
integer y = 956
integer width = 338
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_rut
String	ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_nom_comp
datetime	ldt_fec_nac,ldt_fec_fall,ldt_fec_sep
if il_row > 0 then
	if isvalid(w_ingreso_solicitud_grabacion_lapida) then
		ll_rut			= dw_fallecido.getitemnumber(il_row,'rut')
		ls_dv				= trim(dw_fallecido.getitemstring(il_row,'dv'))
		ls_nombre		= trim(dw_fallecido.getitemstring(il_row,'nombres'))
		ls_ap_pat		= trim(dw_fallecido.getitemstring(il_row,'ap_paterno'))
		ls_ap_mat		= trim(dw_fallecido.getitemstring(il_row,'ap_materno'))
		ldt_fec_nac		= dw_fallecido.getitemdatetime(il_row,'fec_nac')
		ldt_fec_fall	= dw_fallecido.getitemdatetime(il_row,'fec_fall')
		ldt_fec_sep		= dw_fallecido.getitemdatetime(il_row,'fec_sep')
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'rut_fallecido',ll_rut)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'dv_fallecido',ls_dv)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'nombre_fallecido',ls_nombre)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'apellido_paterno_fall',ls_ap_pat)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'apellido_materno_fall',ls_ap_mat)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'fecha_nacimiento_fall',ldt_fec_nac)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'fecha_fallecimiento',ldt_fec_fall)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'fecha_sepultacion',ldt_fec_sep)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'fecha_defuncion_lapida',ldt_fec_fall)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'fecha_nacimiento_lapida',ldt_fec_nac)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'estado_reg','P')
		ls_nom_comp		= ls_nombre+ ' ' +ls_ap_pat+' '+ls_ap_mat
		if len(ls_nom_comp) > 27 then	ls_nom_comp = mid(ls_nom_comp,1,27)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setitem(1,'nombre_fallecido_lapida',ls_nom_comp)
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.accepttext()
		w_ingreso_solicitud_grabacion_lapida.dw_ingreso.setfocus()
		close(w_lista_fallecido_a_buscar)
	end if
end if
end event

type dw_fallecido from datawindow within w_lista_fallecido_a_buscar
integer x = 32
integer y = 104
integer width = 2757
integer height = 812
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_fallecido_seleccionar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	cb_aceptar.triggerevent(clicked!)
end if
end event

