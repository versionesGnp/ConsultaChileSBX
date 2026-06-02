forward
global type w_mant_ip_caja from window
end type
type cb_cerrar from commandbutton within w_mant_ip_caja
end type
type st_1 from statictext within w_mant_ip_caja
end type
type dw_ip_caja from datawindow within w_mant_ip_caja
end type
type cb_grabar from commandbutton within w_mant_ip_caja
end type
end forward

global type w_mant_ip_caja from window
integer width = 1755
integer height = 908
boolean titlebar = true
string title = "Mantenedor IP Caja"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
st_1 st_1
dw_ip_caja dw_ip_caja
cb_grabar cb_grabar
end type
global w_mant_ip_caja w_mant_ip_caja

on w_mant_ip_caja.create
this.cb_cerrar=create cb_cerrar
this.st_1=create st_1
this.dw_ip_caja=create dw_ip_caja
this.cb_grabar=create cb_grabar
this.Control[]={this.cb_cerrar,&
this.st_1,&
this.dw_ip_caja,&
this.cb_grabar}
end on

on w_mant_ip_caja.destroy
destroy(this.cb_cerrar)
destroy(this.st_1)
destroy(this.dw_ip_caja)
destroy(this.cb_grabar)
end on

event open;gf_centrar(w_mant_ip_caja)
dw_ip_caja.settransobject(sqlca)
dw_ip_caja.insertrow(0)
end event

type cb_cerrar from commandbutton within w_mant_ip_caja
integer x = 1367
integer y = 644
integer width = 302
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mant_ip_caja)
end event

type st_1 from statictext within w_mant_ip_caja
integer x = 59
integer y = 40
integer width = 809
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mantenedor IP Caja"
boolean focusrectangle = false
end type

type dw_ip_caja from datawindow within w_mant_ip_caja
integer x = 59
integer y = 176
integer width = 1609
integer height = 412
integer taborder = 10
string title = "none"
string dataobject = "dw_ip_caja"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_tcp_ip, ls_columna,ls_usuario,ls_var,ls_var2,ls_var3,ls_var4,ls_conexion,ls_caja
long	 ll_res,ll_pos,ll_contar
this.accepttext()
ls_columna		= dwo.name 
ls_conexion		= dw_ip_caja.getitemstring(1,'conexion')
ls_usuario		= dw_ip_caja.getitemstring(1,'usuario')	
ls_caja			= dw_ip_caja.getitemstring(1,'caja')
if ls_columna = 'tcp_ip' then
	ls_tcp_ip	=	dw_ip_caja.getitemstring(1,'tcp_ip')
	if not isnull(ls_tcp_ip) then
		ll_contar	=0 
		ll_pos		=Pos(ls_tcp_ip,'.')
		if ll_pos > 0 then
			ll_contar++
			ls_var	= Mid(ls_tcp_ip,ll_pos+1)
			ll_pos	= Pos(ls_tcp_ip,'.')
			if ll_pos > 0 then
				ll_contar++
				ls_var2	= Mid(ls_var,ll_pos+1)
				ll_pos	= Pos(ls_var2,'.')
				if ll_pos > 0 then
					ll_contar++
					ls_var3	= Mid(ls_var2,ll_pos+1)
					ll_pos	= Pos(ls_var3,'.')
					if ll_pos > 0 then
						ll_contar++
						ls_var4	= Mid(ls_var3,ll_pos+1)
						ll_pos	= Pos(ls_var4,'.')
					end if
				end if
			end if
		end if
		if ll_contar <> 3 then
			messagebox('ERROR','IP Invalida')
			dw_ip_caja.reset()
			dw_ip_caja.insertrow(0)
			dw_ip_caja.setfocus()
			dw_ip_caja.setitem(1,'usuario',ls_usuario)
			dw_ip_caja.setitem(1,'conexion',ls_conexion)
			dw_ip_caja.setitem(1,'caja',ls_caja)
			setcolumn('tcp_ip')
		end if
		SELECT	("TCP_IP_CAJA"."USUARIO")   
		INTO		:ls_usuario
		FROM 		"TCP_IP_CAJA"  
		WHERE 	"TCP_IP_CAJA"."TCP_IP" = :ls_tcp_ip   
		USING		sqlca;
		if sqlca.sqlcode=0 then
				ll_res	= messagebox("Advertencia","LA IP "+string(ls_tcp_ip)+" Esta asignada Para este Usuario,"+string(ls_usuario))
				dw_ip_caja.setcolumn('tcp_ip')
		end if
	end if
end if
end event

type cb_grabar from commandbutton within w_mant_ip_caja
integer x = 59
integer y = 644
integer width = 302
integer height = 108
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_tcp_ip,ls_usuario,ls_caja,ls_conexion,ls_sw='S'
long		ret
datetime	ldt_fecha_hoy

ls_tcp_ip 	= dw_ip_caja.GetItemString(1,'tcp_ip')
ls_usuario	= dw_ip_caja.GetItemString(1,'usuario')
ls_caja		= dw_ip_caja.GetItemString(1,'caja')
ls_conexion	= dw_ip_caja.GetItemString(1,'conexion')

if isnull(ls_tcp_ip) or ls_tcp_ip='' then
	messagebox('Advertencia','Debe Ingresar IP')
	dw_ip_caja.setfocus()
	dw_ip_caja.setcolumn('tcp_ip')
	ls_sw		= 'N'
	
elseif isnull(ls_usuario) or ls_usuario='' then
	messagebox('Advertencia','Debe Ingresar NOMBRE USUARIO')
	dw_ip_caja.setfocus()
	dw_ip_caja.setcolumn('usuario')
	ls_sw		= 'N'
	
elseif isnull(ls_caja) or ls_caja='' then
	messagebox('Advertencia','Debe Ingresar CAJA')
	dw_ip_caja.setfocus()
	dw_ip_caja.setcolumn('caja')
	ls_sw		= 'N'

elseif isnull(ls_conexion) or ls_conexion='' then
	messagebox('Advertencia','Debe Ingresar Conexion')
	dw_ip_caja.setfocus()
	dw_ip_caja.setcolumn('conexion')
	ls_sw		= 'N'
end if

if ls_sw='S' then
	dw_ip_caja.setitem(1,'tcp_ip',ls_tcp_ip)
	dw_ip_caja.setitem(1,'usuario',ls_usuario)
	dw_ip_caja.setitem(1,'caja',ls_caja)
	dw_ip_caja.setitem(1,'conexion',ls_conexion)
	ret	= MessageBox('Actualizar', "Desea Grabar IP CAJA", Question!, YesNo!, 2)
	IF ret = 1 THEN
		if dw_ip_caja.update()=1 then
			commit;
			w_lista_ip_caja.dw_lista.reset()
			w_lista_ip_caja.dw_lista.retrieve()
			messagebox("Grabar","Grabación Exitosa")
			close(w_mant_ip_caja)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Mensaje: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

