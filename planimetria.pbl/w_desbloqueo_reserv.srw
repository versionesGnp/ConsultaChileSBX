forward
global type w_desbloqueo_reserv from window
end type
type pb_buscar from picturebutton within w_desbloqueo_reserv
end type
type em_buscar from editmask within w_desbloqueo_reserv
end type
type st_1 from statictext within w_desbloqueo_reserv
end type
type cb_2 from commandbutton within w_desbloqueo_reserv
end type
type cb_1 from commandbutton within w_desbloqueo_reserv
end type
type dw_1 from datawindow within w_desbloqueo_reserv
end type
end forward

global type w_desbloqueo_reserv from window
integer width = 1682
integer height = 1300
boolean titlebar = true
string title = "Reservas Bloqueadas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
pb_buscar pb_buscar
em_buscar em_buscar
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_desbloqueo_reserv w_desbloqueo_reserv

type variables
Long fila
end variables

on w_desbloqueo_reserv.create
this.pb_buscar=create pb_buscar
this.em_buscar=create em_buscar
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.pb_buscar,&
this.em_buscar,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_desbloqueo_reserv.destroy
destroy(this.pb_buscar)
destroy(this.em_buscar)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;integer i
gf_centrar(w_desbloqueo_reserv)
dw_1.settransobject(sqlca)
i = dw_1.retrieve()
if i = 0 then
	messagebox('No hay datos','No existen registros a eliminar', stopsign!)
	close(w_desbloqueo_reserv)
end if
end event

type pb_buscar from picturebutton within w_desbloqueo_reserv
integer x = 1211
integer y = 44
integer width = 105
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar3.bmp"
end type

event clicked;String	ls_sepult
Long		ll_fila

if dw_1.rowcount() > 0 then
	ls_sepult	= Trim(em_buscar.text)
	ll_fila		= dw_1.Find("sepultura = '"+ls_sepult+"'", 1, dw_1.RowCount())
	if ll_fila>0 then
		dw_1.scrolltorow(ll_fila)
	else
		messagebox("Advertencia","Sepultura "+ls_sepult+" No Existe en Lista")
		em_buscar.text	= ''
		dw_1.scrolltorow(1)
		SetNull(fila)
	end if
end if
end event

type em_buscar from editmask within w_desbloqueo_reserv
integer x = 544
integer y = 44
integer width = 663
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

event modified;String	ls_sepult
if dw_1.rowcount() > 0 then
	ls_sepult	= Trim(em_buscar.text)
	if not isnull(ls_sepult) and ls_sepult<>'' then pb_buscar.triggerevent(clicked!)
end if
end event

type st_1 from statictext within w_desbloqueo_reserv
integer x = 59
integer y = 56
integer width = 443
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Sepultura"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_desbloqueo_reserv
integer x = 69
integer y = 1048
integer width = 338
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Borrar"
end type

event clicked;String		ls_sepultura,ls_sector
Long		ll_res

fila 						= dw_1.getrow()
if fila > 0 then
	ls_sepultura			= trim(dw_1.getitemstring(fila,'sepultura'))
	ls_sector				= trim(dw_1.getitemstring(fila,'sector'))
	ll_res					= messagebox("Eliminar Reserva","Está Seguro de Eliminar Sector: "+ls_sector+" y Sepultura: "+ls_sepultura,Exclamation!,YesNo!,2)
	if ll_res = 1 then
		dw_1.DeleteRow(fila)
		if dw_1.Update()=1 then
			commit;
			messagebox("Eliminar","Eliminación Exitosa")
			em_buscar.text	= ''
		else
			rollback;
			messagebox("Error Eliminar","Error al Eliminar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_1 from commandbutton within w_desbloqueo_reserv
integer x = 1275
integer y = 1048
integer width = 338
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_desbloqueo_reserv)
end event

type dw_1 from datawindow within w_desbloqueo_reserv
integer x = 69
integer y = 180
integer width = 1545
integer height = 812
integer taborder = 30
string title = "none"
string dataobject = "dw_desbloqueo_reserv"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;fila = row
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)
end event

event rowfocuschanged;fila = getrow()
This.SelectRow(0, FALSE)
This.SelectRow(fila, TRUE)
end event

