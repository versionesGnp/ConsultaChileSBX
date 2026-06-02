forward
global type w_ingreso_soporte_general from window
end type
type cb_limpiar from commandbutton within w_ingreso_soporte_general
end type
type cb_busca_ot from commandbutton within w_ingreso_soporte_general
end type
type cb_grabar from commandbutton within w_ingreso_soporte_general
end type
type cb_cerrar from commandbutton within w_ingreso_soporte_general
end type
type dw_soporte_general from datawindow within w_ingreso_soporte_general
end type
end forward

global type w_ingreso_soporte_general from window
integer width = 2405
integer height = 1328
boolean titlebar = true
string title = "Ingreso Soporte"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_limpiar cb_limpiar
cb_busca_ot cb_busca_ot
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_soporte_general dw_soporte_general
end type
global w_ingreso_soporte_general w_ingreso_soporte_general

on w_ingreso_soporte_general.create
this.cb_limpiar=create cb_limpiar
this.cb_busca_ot=create cb_busca_ot
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_soporte_general=create dw_soporte_general
this.Control[]={this.cb_limpiar,&
this.cb_busca_ot,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_soporte_general}
end on

on w_ingreso_soporte_general.destroy
destroy(this.cb_limpiar)
destroy(this.cb_busca_ot)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_soporte_general)
end on

event open;long		ll_new
datetime ldt_fecha_hoy
String	ls_depto

gf_centrar(w_ingreso_soporte_general)
dw_soporte_general.settransobject(sqlca)
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
//dw_soporte_general.getchild('usuario_contacto',idw_detalle)
//idw_detalle.settransobject(sqlca)
//idw_detalle.insertrow(0)
ll_new					= dw_soporte_general.insertrow(0)
dw_soporte_general.setitem(ll_new,'fecha_ingreso',ldt_fecha_hoy)
end event

type cb_limpiar from commandbutton within w_ingreso_soporte_general
integer x = 512
integer y = 1056
integer width = 375
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;long		ll_new,ll_resp
datetime ldt_fecha_hoy
String	ls_depto

ll_resp		= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp	=1 then
dw_soporte_general.reset()
dw_soporte_general.settransobject(sqlca)
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
ll_new					= dw_soporte_general.insertrow(0)
dw_soporte_general.setitem(ll_new,'fecha_ingreso',ldt_fecha_hoy)
dw_soporte_general.object.t_nombre.text   = ''
dw_soporte_general.setfocus()
dw_soporte_general.setcolumn('usuario_contacto')
end if
end event

type cb_busca_ot from commandbutton within w_ingreso_soporte_general
integer x = 969
integer y = 1056
integer width = 375
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar O.T."
end type

event clicked;open(w_lista_soporte)
end event

type cb_grabar from commandbutton within w_ingreso_soporte_general
integer x = 55
integer y = 1056
integer width = 375
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_sw='S',ls_id_pc,ls_depto,ls_usuario_contacto,ls_estado_prioridad,&
			ls_obs_inicial,ls_estado_ot
long		ret,ll_at_general,ll_count
datetime	ldt_fecha_ingreso,ldt_fecha_hoy

dw_soporte_general.accepttext()
ls_usuario_contacto	= dw_soporte_general.GetItemString(1,'usuario_contacto')
ll_at_general			= dw_soporte_general.GetItemNumber(1,'codigo_atencion')
ls_estado_prioridad	= dw_soporte_general.GetItemString(1,'estado_prioridad')
ls_obs_inicial			= dw_soporte_general.GetitemString(1,'observacion_ini')
ldt_fecha_ingreso		= dw_soporte_general.getitemdatetime(1,'fecha_ingreso')
ls_estado_ot			= dw_soporte_general.getitemstring(1,'estado_ot')

if isnull(ls_usuario_contacto) or ls_usuario_contacto='' then
	messagebox('Advertencia','Debe Ingresar Usuario Contacto')
	dw_soporte_general.setfocus()
	dw_soporte_general.setcolumn('usuario_contacto')
	ls_sw		= 'N'

elseif isnull(ll_at_general) or ll_at_general=0 then
	messagebox('Advertencia','Debe Ingresar Codigo De Atención')
	dw_soporte_general.setfocus()
	dw_soporte_general.setcolumn('codigo_atencion')
	ls_sw		= 'N'
	
elseif isnull(ls_estado_prioridad) or ls_estado_prioridad='' then
	messagebox('Advertencia','Debe Ingresar Prioridad')
	dw_soporte_general.setfocus()
	dw_soporte_general.setcolumn('estado_prioridad')
	ls_sw		= 'N'

elseif isnull(ls_obs_inicial) or ls_obs_inicial='' then
	messagebox('Advertencia','Debe Ingresar Observación')
	dw_soporte_general.setfocus()
	dw_soporte_general.setcolumn('observacion_ini')
	ls_sw		= 'N'

elseif isnull(ldt_fecha_ingreso) then
	messagebox('Advertencia','Debe Ingresar FECHA DE INGRESO')
	dw_soporte_general.setfocus()
	dw_soporte_general.setcolumn('fecha_ingreso')
	ls_sw		= 'N'
end if

if ls_sw='S' then
	dw_soporte_general.setitem(1,'usuario_contacto',ls_usuario_contacto)
	dw_soporte_general.setitem(1,'codigo_atencion',ll_at_general)
	dw_soporte_general.setitem(1,'estado_prioridad',ls_estado_prioridad)
	dw_soporte_general.setitem(1,'observacion_ini',ls_obs_inicial)
	dw_soporte_general.setitem(1,'fecha_ingreso',ldt_fecha_ingreso)
	ret	= MessageBox('Actualizar', "Desea Grabar Orden de Trabajo", Question!, YesNo!, 2)
	IF ret = 1 THEN
			SELECT	MAX("SOPORTE_ATENCION"."CORRELATIVO_OT")  
			INTO 		:ll_count  
			FROM 		"SOPORTE_ATENCION"  
			USING		sqlca;
			if ll_count=0 or isnull(ll_count) then
				ll_count	= 1
			else
				ll_count ++
			end if
			dw_soporte_general.setitem(1,'correlativo_ot',ll_count)
			dw_soporte_general.setitem(1,'estado_ot','P')
			dw_soporte_general.setitem(1,'usuario_crea',gs_user)
		if dw_soporte_general.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			dw_soporte_general.reset()
			dw_soporte_general.insertrow(0)
			ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
			dw_soporte_general.setitem(1,'fecha_ingreso',ldt_fecha_hoy)
			dw_soporte_general.object.t_nombre.text   = ''
		//	close(w_ingreso_soporte_general)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Soporte: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_ingreso_soporte_general
integer x = 1943
integer y = 1056
integer width = 375
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_soporte_general)
end event

type dw_soporte_general from datawindow within w_ingreso_soporte_general
integer x = 64
integer y = 36
integer width = 2254
integer height = 988
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_sop_general"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	 ls_depto,ls_columna,ls_nombre_usuario,ls_cod_user,ls_anexos,ls_tcp_ip,ls_var,ls_var2,ls_var3,&
			 ls_var4
long		 ll_contar,ll_pos			 
datetime	 ldt_fecha_hoy 	

ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
dw_soporte_general.accepttext()
ls_columna	= dwo.name
if ls_columna	='usuario_contacto' then
	ls_cod_user	= dw_soporte_general.getitemstring(1,'usuario_contacto')
  SELECT "ENCARGADOS"."NOMBRE","ENCARGADOS"."ANEXOS"  
    INTO  :ls_nombre_usuario,
	 		 :ls_anexos	
    FROM "ENCARGADOS"  
   WHERE "ENCARGADOS"."CODIGO_USUARIO" = :ls_cod_user   
   USING	sqlca;
	if sqlca.sqlcode=0 then
		dw_soporte_general.object.t_nombre.text   = ls_nombre_usuario
		dw_soporte_general.setitem(1,'anexos',ls_anexos)
	else 
		messagebox('Advertencia','El Usuario Digitado No Existe')
		dw_soporte_general.reset()
		dw_soporte_general.insertrow(0)
		dw_soporte_general.setfocus()
		dw_soporte_general.setcolumn('usuario_contacto')
		dw_soporte_general.setitem(1,'fecha_ingreso',ldt_fecha_hoy)
	end if
		if ls_columna = 'ip' then
		ls_tcp_ip	=	dw_soporte_general.getitemstring(1,'ip')
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
				dw_soporte_general.setitem(1,'IP','')
				setcolumn('ip')
			end if
			dw_soporte_general.accepttext()
		end if
		dw_soporte_general.accepttext()
	end if
	dw_soporte_general.accepttext()
end if

end event

event itemfocuschanged;string ls_columna, ls_tcp_ip,ls_var,ls_var2,ls_var3,ls_var4
long	 ll_contar,ll_pos 

ls_columna 		= dwo.name
if ls_columna <> 'ip' then
	ls_tcp_ip	=	dw_soporte_general.getitemstring(1,'ip')
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
			dw_soporte_general.setitem(1,'IP','')
			setcolumn('ip')
		end if
			dw_soporte_general.accepttext()
	end if
end if
end event

