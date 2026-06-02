forward
global type w_ingreso_equipo from window
end type
type cb_listado from commandbutton within w_ingreso_equipo
end type
type cb_nuevo from commandbutton within w_ingreso_equipo
end type
type cb_grabar from commandbutton within w_ingreso_equipo
end type
type dw_ingreso_equipo from datawindow within w_ingreso_equipo
end type
type cb_cerrar from commandbutton within w_ingreso_equipo
end type
end forward

global type w_ingreso_equipo from window
integer width = 2606
integer height = 2156
boolean titlebar = true
string title = "Ingreso Equipo Nuevo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_listado cb_listado
cb_nuevo cb_nuevo
cb_grabar cb_grabar
dw_ingreso_equipo dw_ingreso_equipo
cb_cerrar cb_cerrar
end type
global w_ingreso_equipo w_ingreso_equipo

on w_ingreso_equipo.create
this.cb_listado=create cb_listado
this.cb_nuevo=create cb_nuevo
this.cb_grabar=create cb_grabar
this.dw_ingreso_equipo=create dw_ingreso_equipo
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_listado,&
this.cb_nuevo,&
this.cb_grabar,&
this.dw_ingreso_equipo,&
this.cb_cerrar}
end on

on w_ingreso_equipo.destroy
destroy(this.cb_listado)
destroy(this.cb_nuevo)
destroy(this.cb_grabar)
destroy(this.dw_ingreso_equipo)
destroy(this.cb_cerrar)
end on

event open;long		ll_new,ll_count
string	ls_lector_grabador
datetime ldt_fecha_hoy

gf_centrar(w_ingreso_equipo)
dw_ingreso_equipo.settransobject(sqlca)
ll_new					= dw_ingreso_equipo.insertrow(0)
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
dw_ingreso_equipo.setitem(ll_new,'fecha_ingreso',ldt_fecha_hoy)
ls_lector_grabador	= dw_ingreso_equipo.GetItemString(1,'lector_grabador')
dw_ingreso_equipo.setitem(1,'lector_grabador','N')





end event

type cb_listado from commandbutton within w_ingreso_equipo
integer x = 1285
integer y = 1908
integer width = 485
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Equipo"
end type

event clicked;if isvalid(w_lista_equipos) then close(w_lista_equipos)
open(w_lista_equipos)
end event

type cb_nuevo from commandbutton within w_ingreso_equipo
integer x = 338
integer y = 1908
integer width = 288
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;datetime ldt_fecha_hoy
long ll_new,ll_resp

ll_resp		= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp	=1 then
dw_ingreso_equipo.reset()
ll_new					= dw_ingreso_equipo.insertrow(0)
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
dw_ingreso_equipo.setitem(ll_new,'fecha_ingreso',ldt_fecha_hoy)
end if
end event

type cb_grabar from commandbutton within w_ingreso_equipo
integer x = 27
integer y = 1908
integer width = 288
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

event clicked;string	ls_sw='S',ls_id_pc,ls_ip,ls_placa_madre,ls_procesador,ls_memoria,ls_disco,ls_lector_grabador,ls_columna,&
			ls_tcp_ip,ls_var,ls_var2,ls_var3,ls_var4,ls_obs,ls_estado,ls_estado_ori
long		ret,ll_parque,ll_count,ll_contar,ll_pos
datetime	ldt_fecha_hoy,ldt_fecha_ingreso

dw_ingreso_equipo.accepttext()
ldt_fecha_ingreso		= dw_ingreso_equipo.getitemdatetime(1,'fecha_ingreso')
ls_id_pc 	 			= dw_ingreso_equipo.GetItemString(1,'id_pc')
ls_ip			 			= dw_ingreso_equipo.GetItemString(1,'ip')
ls_estado				= dw_ingreso_equipo.GetItemString(1,'tcp_ip_parque_estado')
ls_obs					= dw_ingreso_equipo.getitemstring(1,'tcp_ip_parque_glosa_estado')
	
if ls_estado='I' and (isnull(ls_obs) or ls_obs='' or ls_obs='-' or ls_obs=' ') then
	messagebox("Advertencia","Debe Ingresar Motivo por Anulación de IP")
	dw_ingreso_equipo.setfocus()
	dw_ingreso_equipo.setcolumn('tcp_ip_parque_glosa_estado')
else
	if not isnull(ls_ip) then
		ll_contar	=0 
		ll_pos		=Pos(ls_ip,'.')
		if ll_pos > 0 then
			ll_contar++
			ls_var	= Mid(ls_ip,ll_pos+1)
			ll_pos	= Pos(ls_ip,'.')
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
	end if
	if ll_contar <> 3 then
		messagebox('ERROR','IP Invalida')
		dw_ingreso_equipo.setitem(1,'IP',0)
	else
		ls_placa_madre			= dw_ingreso_equipo.GetItemString(1,'placa_madre')
		ls_procesador 			= dw_ingreso_equipo.GetItemString(1,'procesador')
		ls_memoria				= dw_ingreso_equipo.GetItemString(1,'memoria')
		ls_disco					= dw_ingreso_equipo.GetItemString(1,'disco')
		ls_lector_grabador	= dw_ingreso_equipo.GetItemString(1,'lector_grabador')
		if isnull(ls_id_pc) or ls_id_pc='' then
			messagebox('Advertencia','Debe la ID DEL COMPUTADOR')
			dw_ingreso_equipo.setfocus()
			dw_ingreso_equipo.setcolumn('id_pc')
			ls_sw		= 'N'
			
		elseif isnull(ldt_fecha_ingreso) then
			messagebox('Advertencia','Debe Ingresar FECHA DE INGRESO')
			dw_ingreso_equipo.setfocus()
			dw_ingreso_equipo.setcolumn('fecha_ingreso')
			ls_sw		= 'N'
			
		elseif isnull(ls_ip) or ls_ip='' then
			messagebox('Advertencia','Debe Ingresar LA IP DEL COMPUTADOR')
			dw_ingreso_equipo.setfocus()
			dw_ingreso_equipo.setcolumn('ip')
			ls_sw		= 'N'
			
		elseif isnull(ls_placa_madre) or ls_placa_madre='' then
			messagebox('Advertencia','Debe PLACA MADRE')
			dw_ingreso_equipo.setfocus()
			dw_ingreso_equipo.setcolumn('placa_madre')
			ls_sw		= 'N'
		
		elseif isnull(ls_procesador) or ls_procesador='' then
			messagebox('Advertencia','Debe Ingresar PROCESADOR')
			dw_ingreso_equipo.setfocus()
			dw_ingreso_equipo.setcolumn('procesador')
			ls_sw		= 'N'
			
		elseif isnull(ls_memoria) or ls_memoria='' then
			messagebox('Advertencia','Debe Ingresar MEMORIA')
			dw_ingreso_equipo.setfocus()
			dw_ingreso_equipo.setcolumn('memoria')
			ls_sw		= 'N'
			
		elseif isnull(ls_disco) or ls_disco='' then
			messagebox('Advertencia','Debe Ingresar DISCO')
			dw_ingreso_equipo.setfocus()
			dw_ingreso_equipo.setcolumn('disco')
			ls_sw		= 'N'
			
		elseif isnull(ls_lector_grabador) or ls_lector_grabador='' then
			messagebox('Advertencia','Debe Ingresar LECTOR/GRABADOR')
			dw_ingreso_equipo.setfocus()
			dw_ingreso_equipo.setcolumn('lector_grabador')
			ls_sw		= 'N'
			
		end if
		
		if ls_sw='S' then
			dw_ingreso_equipo.setitem(1,'id_pc',ls_id_pc)
			dw_ingreso_equipo.setitem(1,'ip',ls_ip)
			dw_ingreso_equipo.setitem(1,'placa_madre',ls_placa_madre)
			dw_ingreso_equipo.setitem(1,'procesador',ls_procesador)
			dw_ingreso_equipo.setitem(1,'memoria',ll_parque)
			dw_ingreso_equipo.setitem(1,'disco',ls_disco)
			dw_ingreso_equipo.setitem(1,'lector_grabador',ls_lector_grabador)
			ret	= MessageBox('Actualizar', "Desea Grabar INGRESO EQUIPO", Question!, YesNo!, 2)
			SELECT	MAX("SOPORTE_EQUIPOS"."CORRELATIVO")  
			INTO 		:ll_count  
			FROM 		"SOPORTE_EQUIPOS"  
			USING		sqlca;
			if ll_count=0 or isnull(ll_count) then
				ll_count	= 1
			else
				ll_count ++
			end if
			dw_ingreso_equipo.setitem(1,'correlativo',ll_count)
			IF ret = 1 THEN
				if dw_ingreso_equipo.update()=1 then
					commit;
					if ls_estado='I' then
						UPDATE	"TCP_IP_PARQUE"  
						SET 		"ESTADO" = :ls_estado,   
									"GLOSA_ESTADO" = :ls_obs  
						WHERE 	"TCP_IP_PARQUE"."TCP_IP" = :ls_ip   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					elseif ls_estado='A' then
						SELECT	"TCP_IP_PARQUE"."ESTADO"  
						INTO 		:ls_estado_ori  
						FROM 		"TCP_IP_PARQUE"  
						WHERE 	"TCP_IP_PARQUE"."TCP_IP" = :ls_ip   ;
						if ls_estado_ori='I' then
							ls_obs	= 'Se Re-Activa IP por el Usuario '+gs_user+ ' con Fecha '+string(gdt_fec_sistema,'dd/mm/yyyy')
							UPDATE	"TCP_IP_PARQUE"  
							SET 		"ESTADO" = :ls_estado,   
										"GLOSA_ESTADO" = :ls_obs
							WHERE 	"TCP_IP_PARQUE"."TCP_IP" = :ls_ip   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
					end if
					dw_ingreso_equipo.reset()
					dw_ingreso_equipo.insertrow(0)
					ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
					dw_ingreso_equipo.setitem(1,'fecha_ingreso',ldt_fecha_hoy)
					messagebox("Grabar","Grabación Exitosa")
					//close(w_ingreso_equipo)
					if isvalid(w_lista_equipos) then
					w_lista_equipos.dw_lista_equipos.retrieve()
					end if
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Ingreso: "+sqlca.sqlerrtext)
				end if
			end if
		end if
	end if
end if
end event

type dw_ingreso_equipo from datawindow within w_ingreso_equipo
integer x = 32
integer y = 44
integer width = 2519
integer height = 1828
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_equipo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_tcp_ip,ls_var,ls_var2,ls_var3,ls_var4,ls_usuario,ls_estado,ls_fecha,ls_ip,ls_id_pc,&
			ls_nulo
long		ll_contar,ll_pos
datetime ldt_fecha_hoy

this.accepttext()
ls_columna 		= dwo.name
setnull(ls_nulo)
if ls_columna	= 'id_pc' then
	ls_id_pc		= dw_ingreso_equipo.getitemstring(1,'id_pc')
	SELECT	("SOPORTE_EQUIPOS"."IP")   
	INTO		:ls_ip
	FROM 		"SOPORTE_EQUIPOS"  
	WHERE 	"SOPORTE_EQUIPOS"."ID_PC" = :ls_id_pc   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		messagebox("Advertencia","El Equipo ya ha sido Ingresado")
		dw_ingreso_equipo.reset()
		dw_ingreso_equipo.insertrow(0)
		ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
		dw_ingreso_equipo.setitem(1,'fecha_ingreso',ldt_fecha_hoy)
		dw_ingreso_equipo.setfocus()
		dw_ingreso_equipo.setcolumn('id_pc')
	end if
end if
if ls_columna = 'ip' then
	ls_tcp_ip	=	dw_ingreso_equipo.getitemstring(1,'ip')
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
			dw_ingreso_equipo.setitem(1,'IP','')
			setcolumn('ip')
		else
			SELECT	("TCP_IP_PARQUE"."USUARIO")   
			INTO		:ls_usuario
			FROM 		"TCP_IP_PARQUE"  
			WHERE 	"TCP_IP_PARQUE"."TCP_IP" = :ls_tcp_ip AND
						"TCP_IP_PARQUE"."ESTADO" = 'A'
			USING		sqlca;
			if sqlca.sqlcode=0 then
				messagebox("Advertencia","LA IP "+string(ls_tcp_ip)+" Esta asignada Para este Usuario,"+string(ls_usuario))
				dw_ingreso_equipo.setfocus()
				dw_ingreso_equipo.setcolumn('ip')
			else
				SELECT	"SOPORTE_EQUIPOS"."ID_PC"  
				INTO 		:ls_id_pc  
				FROM 		"SOPORTE_EQUIPOS"  
				WHERE 	"SOPORTE_EQUIPOS"."IP" = :ls_ip  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					messagebox("Advertencia","Nº IP ya está asociada al PC Código Id.: "+ls_id_pc)
				else
					messagebox("Advertencia","No Existe IP Asociada a un Parque, se Abrirá la Ventana de Mantención")
					open(w_mant_ip_parque)
					w_mant_ip_parque.dw_ip_parque.setitem(1,'tcp_ip',ls_tcp_ip)
					w_mant_ip_parque.dw_ip_parque.object.tcp_ip.protect	= 1
				end if
			end if
		end if
	end if
end if
end event

event clicked;string ls_columna,ls_fecha,ls_ip,ls_id_pc

ls_columna	= dwo.name
if ls_columna = 'p_1' then
 		ls_fecha	= string(date(dw_ingreso_equipo.getitemdatetime(dw_ingreso_equipo.getrow(),'fecha_ingreso')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_ingreso_equipo.setitem(dw_ingreso_equipo.getrow(),'fecha_ingreso',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		ls_ip		= dw_ingreso_equipo.getitemstring(1,'ip')
		ls_id_pc	= dw_ingreso_equipo.getitemstring(1,'id_pc')
		if not isnull(ls_ip) and not isnull(ls_id_pc) then
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ingreso_equipo.setitem(dw_ingreso_equipo.getrow(),'fecha_ingreso',date(ls_fecha))
			END IF
		end if
	end if

end event

type cb_cerrar from commandbutton within w_ingreso_equipo
integer x = 2121
integer y = 1908
integer width = 402
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_equipo)
end event

