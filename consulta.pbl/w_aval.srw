forward
global type w_aval from window
end type
type dw_1 from datawindow within w_aval
end type
type cb_2 from commandbutton within w_aval
end type
type cb_1 from commandbutton within w_aval
end type
end forward

global type w_aval from window
integer x = 1074
integer y = 484
integer width = 1627
integer height = 1408
boolean titlebar = true
string title = "Datos Aval"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_aval w_aval

type variables
Long	il_modifica
end variables

forward prototypes
public subroutine wf_ingresar_nuevo_aval ()
end prototypes

public subroutine wf_ingresar_nuevo_aval ();dw_1.insertrow(0)
if isvalid(w_ingresar_oferta) then
	dw_1.setitem(1,'rut',w_ingresar_oferta.dw_oferta_v.getitemnumber(1,'rut_aval'))
	dw_1.setitem(1,'dv',w_ingresar_oferta.dw_oferta_v.getitemstring(1,'compute_0053'))
elseif isvalid(w_ingresar_pagare) then
	dw_1.setitem(1,'rut',w_ingresar_pagare.dw_pagare.getitemnumber(1,'rut_aval'))
	dw_1.setitem(1,'dv',w_ingresar_pagare.dw_pagare.getitemstring(1,'dv_aval'))
elseif isvalid(w_ingresar_aumento_capacidad) then
	dw_1.setitem(1,'rut',w_ingresar_aumento_capacidad.dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_rut_aval'))
	dw_1.setitem(1,'dv',w_ingresar_aumento_capacidad.dw_aumento_capacidad.getitemstring(1,'c_dv_aval'))
end if
dw_1.accepttext ()
dw_1.setfocus()
end subroutine

on w_aval.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_aval.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string	rut
il_modifica	= 0
gf_centrar(w_aval)
dw_1.settransobject (sqlca)
rut			= Message.StringParm
if len(rut) > 0 then
	if dw_1.retrieve(long(rut))=0 then
		wf_ingresar_nuevo_aval()
	end if
else
	wf_ingresar_nuevo_aval()
end if
end event

type dw_1 from datawindow within w_aval
integer x = 32
integer y = 28
integer width = 1550
integer height = 1096
integer taborder = 10
string dataobject = "dw_aval"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_columna

this.AcceptText()
il_modifica	= 1
ls_columna 	= GetColumnName()
IF ls_columna = "dv" THEN
	if String(getitemstring(1,'dv')) <> String(gf_obtener_dv(long(GetItemNumber(1, "rut")))) then
		messagebox('Error','El Rut del Aval no es valido',stopsign!)
		cb_1.setfocus()
		dw_1.setfocus()
		dw_1.SetColumn('rut')
	end if
end if
end event

type cb_2 from commandbutton within w_aval
integer x = 1262
integer y = 1172
integer width = 306
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;string	ls_resultado='0'
if il_modifica	= 1 then
	if MessageBox("Grabar", 'Desea grabar los datos', Exclamation!, YesNo!, 2) = 1 then
		if dw_1.update()=1 then
			commit;
			ls_resultado	= '1'
		else
			rollback;
			ls_resultado	= '0'
		end if
	end if
end if
CloseWithReturn(w_aval, ls_resultado)
end event

type cb_1 from commandbutton within w_aval
integer x = 41
integer y = 1172
integer width = 274
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_resultado
if dw_1.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
	ls_resultado	= '1'
else
	rollback;
	messagebox("Error al Grabar","Error SQL: "+sqlca.sqlerrtext)
	ls_resultado	= '0'
end if
CloseWithReturn(w_aval, ls_resultado)
end event

