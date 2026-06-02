forward
global type w_mant_ip_parque from window
end type
type cb_cerrar from commandbutton within w_mant_ip_parque
end type
type cb_grabar from commandbutton within w_mant_ip_parque
end type
type st_1 from statictext within w_mant_ip_parque
end type
type dw_ip_parque from datawindow within w_mant_ip_parque
end type
end forward

global type w_mant_ip_parque from window
integer width = 2167
integer height = 920
boolean titlebar = true
string title = "Mantenedor IP Parques"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_grabar cb_grabar
st_1 st_1
dw_ip_parque dw_ip_parque
end type
global w_mant_ip_parque w_mant_ip_parque

on w_mant_ip_parque.create
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.st_1=create st_1
this.dw_ip_parque=create dw_ip_parque
this.Control[]={this.cb_cerrar,&
this.cb_grabar,&
this.st_1,&
this.dw_ip_parque}
end on

on w_mant_ip_parque.destroy
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.st_1)
destroy(this.dw_ip_parque)
end on

event open;gf_centrar(w_mant_ip_parque)
dw_ip_parque.settransobject(sqlca)
dw_ip_parque.insertrow(0)
end event

type cb_cerrar from commandbutton within w_mant_ip_parque
integer x = 1769
integer y = 644
integer width = 293
integer height = 116
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mant_ip_parque)
end event

type cb_grabar from commandbutton within w_mant_ip_parque
integer x = 55
integer y = 644
integer width = 293
integer height = 116
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_tcp_ip,ls_usuario,ls_conexion,ls_sw='S',ls_ubicacion
long		ret,ll_parque
datetime	ldt_fecha_hoy

ls_tcp_ip 	 = dw_ip_parque.GetItemString(1,'tcp_ip')
ls_usuario	 = dw_ip_parque.GetItemString(1,'usuario')
ls_ubicacion = dw_ip_parque.GetItemString(1,'ubicacion')
ls_conexion	 = dw_ip_parque.GetItemString(1,'conexion')
ll_parque	 = dw_ip_parque.GetItemnumber(1,'cod_parque')

if isnull(ls_tcp_ip) or ls_tcp_ip='' then
	messagebox('Advertencia','Debe Ingresar IP')
	dw_ip_parque.setfocus()
	dw_ip_parque.setcolumn('tcp_ip')
	ls_sw		= 'N'
	
elseif isnull(ls_usuario) or ls_usuario='' then
	messagebox('Advertencia','Debe Ingresar NOMBRE USUARIO')
	dw_ip_parque.setfocus()
	dw_ip_parque.setcolumn('usuario')
	ls_sw		= 'N'
	
elseif isnull(ls_ubicacion) or ls_ubicacion='' then
	messagebox('Advertencia','Debe Ingresar Ubicación')
	dw_ip_parque.setfocus()
	dw_ip_parque.setcolumn('ubicacion')
	ls_sw		= 'N'

elseif isnull(ls_conexion) or ls_conexion='' then
	messagebox('Advertencia','Debe Ingresar Conexión')
	dw_ip_parque.setfocus()
	dw_ip_parque.setcolumn('conexion')
	ls_sw		= 'N'
	
elseif isnull(ll_parque) or ll_parque=0 then
	messagebox('Advertencia','Debe Ingresar PARQUE')
	dw_ip_parque.setfocus()
	dw_ip_parque.setcolumn('cod_parque')
	ls_sw		= 'N'
end if

if ls_sw='S' then
	dw_ip_parque.setitem(1,'tcp_ip',ls_tcp_ip)
	dw_ip_parque.setitem(1,'usuario',ls_usuario)
	dw_ip_parque.setitem(1,'ubicacion',ls_ubicacion)
	dw_ip_parque.setitem(1,'conexion',ls_conexion)
	dw_ip_parque.setitem(1,'cod_parque',ll_parque)
	
	ret	= MessageBox('Actualizar', "Desea Grabar IP PARQUE", Question!, YesNo!, 2)
	IF ret = 1 THEN
		if dw_ip_parque.update()=1 then
			commit;
			if isvalid(w_lista_ip_parque) then
				w_lista_ip_parque.dw_lista.reset()
				w_lista_ip_parque.dw_lista.retrieve()
			else
				messagebox("Grabar","Grabación Exitosa")
				close(w_mant_ip_parque)
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Mensaje: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type st_1 from statictext within w_mant_ip_parque
integer x = 55
integer y = 44
integer width = 910
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mantenedor IP Parques"
boolean focusrectangle = false
end type

type dw_ip_parque from datawindow within w_mant_ip_parque
integer x = 55
integer y = 184
integer width = 2007
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_ip_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_tcp_ip, ls_columna,ls_usuario,ls_var,ls_var2,ls_var3,ls_var4,ls_ubicacion,ls_conexion	
long	 ll_res,ll_contar,ll_pos,ll_parque

dw_ip_parque.accepttext()
ls_columna		= dwo.name 
ls_ubicacion	= dw_ip_parque.GetItemString(1,'ubicacion')
ll_parque		= dw_ip_parque.getitemnumber(1,'cod_parque')
ls_conexion		= dw_ip_parque.getitemstring(1,'conexion')
ls_usuario		= dw_ip_parque.getitemstring(1,'usuario')	
if ls_columna = 'tcp_ip' then
	ls_tcp_ip	=	dw_ip_parque.getitemstring(1,'tcp_ip')
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
			dw_ip_parque.reset()
			dw_ip_parque.insertrow(0)
			dw_ip_parque.setfocus()
			dw_ip_parque.setitem(1,'ubicacion',ls_ubicacion)
			dw_ip_parque.setitem(1,'usuario',ls_usuario)
			dw_ip_parque.setitem(1,'conexion',ls_conexion)
			dw_ip_parque.setitem(1,'cod_parque',ll_parque)
			setcolumn('tcp_ip')
		end if

		SELECT	("TCP_IP_PARQUE"."USUARIO")   
		INTO		:ls_usuario
		FROM 		"TCP_IP_PARQUE"  
		WHERE 	"TCP_IP_PARQUE"."TCP_IP" = :ls_tcp_ip   
		USING		sqlca;
		if sqlca.sqlcode=0 then
				ll_res	= messagebox("Advertencia","LA IP "+string(ls_tcp_ip)+" Esta asignada Para este Usuario, "+string(ls_usuario))
				dw_ip_parque.setfocus()
				dw_ip_parque.setcolumn('tcp_ip')
		end if
	end if
end if

end event

event itemfocuschanged;String	ls_columna,ls_tcp_ip,ls_nulo,ls_usuario

ls_columna		= dwo.name
if ls_columna <> 'tcp_ip' then
	setnull(ls_nulo)
	ls_tcp_ip	= dw_ip_parque.getitemstring(1,'tcp_ip')
	SELECT	"TCP_IP_PARQUE"."USUARIO"
	INTO		:ls_usuario
	FROM 		"TCP_IP_PARQUE"  
	WHERE 	"TCP_IP_PARQUE"."TCP_IP" = :ls_tcp_ip   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_ip_parque.setitem(1,'tcp_ip',ls_nulo)
		dw_ip_parque.accepttext()
		dw_ip_parque.setcolumn('tcp_ip')
	end if
end if
end event

