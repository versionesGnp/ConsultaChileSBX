forward
global type w_asociar_ip_caja from window
end type
type cb_eliminar from commandbutton within w_asociar_ip_caja
end type
type cb_nuevo from commandbutton within w_asociar_ip_caja
end type
type cb_grabar from commandbutton within w_asociar_ip_caja
end type
type cb_cerrar from commandbutton within w_asociar_ip_caja
end type
type dw_ip from datawindow within w_asociar_ip_caja
end type
end forward

global type w_asociar_ip_caja from window
integer width = 2400
integer height = 1176
boolean titlebar = true
string title = "Asociar IP CAJA"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_ip dw_ip
end type
global w_asociar_ip_caja w_asociar_ip_caja

type variables
String	is_nombre,is_ip,is_conexion
Long		il_row
end variables

on w_asociar_ip_caja.create
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_ip=create dw_ip
this.Control[]={this.cb_eliminar,&
this.cb_nuevo,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_ip}
end on

on w_asociar_ip_caja.destroy
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_ip)
end on

event open;gf_centrar(w_asociar_ip_caja)
is_nombre 	= substr(1,1,Message.StringParm)
dw_ip.settransobject(sqlca)
if dw_ip.retrieve(is_nombre)=0 then
	messagebox("Advertencia","No Existe Usuario")
	close(w_asociar_ip_caja)
end if


end event

type cb_eliminar from commandbutton within w_asociar_ip_caja
integer x = 585
integer y = 964
integer width = 320
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_resp
if il_row>0 then
	ll_resp	= messagebox("Eliminar","Está seguro Eliminar IP Nº "+dw_ip.getitemstring(il_row,'tcp_ip_caja_tcp_ip'),Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_ip.deleterow(il_row)
		messagebox("Advertencia","Recuerde debe Grabar antes de Cerrar")
	end if
end if
end event

type cb_nuevo from commandbutton within w_asociar_ip_caja
integer x = 37
integer y = 964
integer width = 320
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long	ll_new
ll_new	= dw_ip.insertrow(0)
dw_ip.scrolltorow(ll_new)
dw_ip.setitem(ll_new,'tcp_ip_caja_usuario',is_nombre)
dw_ip.setitem(ll_new,'tcp_ip_caja_tcp_ip',is_ip)
dw_ip.setitem(ll_new,'tcp_ip_caja_conexion',is_conexion)
dw_ip.accepttext()
end event

type cb_grabar from commandbutton within w_asociar_ip_caja
integer x = 1134
integer y = 964
integer width = 320
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_parque,ll_ok=0
String	ls_ip,ls_conexion,ls_ubica,ls_usuario,ls_caja

ll_tot_reg			= dw_ip.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_caja		= dw_ip.getitemstring(ll_indi,'tcp_ip_caja_caja')
		ls_conexion	= dw_ip.getitemstring(ll_indi,'tcp_ip_caja_conexion')
		ls_ip			= dw_ip.getitemstring(ll_indi,'tcp_ip_caja_tcp_ip')
		ls_usuario	= dw_ip.getitemstring(ll_indi,'tcp_ip_caja_usuario')
		if isnull(ls_ip) or ls_ip='' then
			messagebox("Advertencia","Debe Ingresar TCP IP en Fila Nº "+string(ll_indi))
			dw_ip.setfocus()
			dw_ip.scrolltorow(ll_indi)
			dw_ip.setcolumn('tcp_ip_caja_tcp_ip')
			ll_ok ++
			exit
		elseif isnull(ls_caja) or ls_caja='' then
			messagebox("Advertencia","Debe Ingresar CAJA en Fila Nº "+string(ll_indi))
			dw_ip.setfocus()
			dw_ip.scrolltorow(ll_indi)
			dw_ip.setcolumn('tcp_ip_caja_caja')
			ll_ok ++
			exit
		elseif isnull(ls_conexion) or ls_conexion='' then
			messagebox("Advertencia","Debe Ingresar Conexion en Fila Nº "+string(ll_indi))
			dw_ip.setfocus()
			dw_ip.scrolltorow(ll_indi)
			dw_ip.setcolumn('tcp_ip_caja_conexion')
			ll_ok ++
			exit
		elseif isnull(ls_usuario) or ls_usuario='' then
			messagebox("Advertencia","Debe Ingresar Usuario en Fila Nº "+string(ll_indi))
			dw_ip.setfocus()
			dw_ip.scrolltorow(ll_indi)
			dw_ip.setcolumn('tcp_ip_caja_usuario')
			ll_ok ++
			exit
		end if
	next
end if
if ll_ok=0 then
	if dw_ip.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
		close(w_asociar_ip)
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_cerrar from commandbutton within w_asociar_ip_caja
integer x = 2021
integer y = 960
integer width = 320
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_asociar_ip_caja)
end event

type dw_ip from datawindow within w_asociar_ip_caja
integer x = 37
integer y = 32
integer width = 2304
integer height = 904
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_asociar_ip_a_usuario_caja"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

