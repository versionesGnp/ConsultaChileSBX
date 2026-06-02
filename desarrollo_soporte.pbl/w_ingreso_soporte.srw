forward
global type w_ingreso_soporte from window
end type
type dw_lista_ot_imprime from datawindow within w_ingreso_soporte
end type
type cb_imprimir from commandbutton within w_ingreso_soporte
end type
type cb_anular from commandbutton within w_ingreso_soporte
end type
type cb_gestionar from commandbutton within w_ingreso_soporte
end type
type cb_asignar from commandbutton within w_ingreso_soporte
end type
type cb_grabar from commandbutton within w_ingreso_soporte
end type
type cb_cerrar from commandbutton within w_ingreso_soporte
end type
type dw_detalle_mantencion from datawindow within w_ingreso_soporte
end type
type rb_software from radiobutton within w_ingreso_soporte
end type
type rb_hardware from radiobutton within w_ingreso_soporte
end type
type st_1 from statictext within w_ingreso_soporte
end type
type dw_soporte_mantencion from datawindow within w_ingreso_soporte
end type
type dw_ingreso_soporte from datawindow within w_ingreso_soporte
end type
type gb_1 from groupbox within w_ingreso_soporte
end type
type gb_2 from groupbox within w_ingreso_soporte
end type
end forward

global type w_ingreso_soporte from window
integer width = 3877
integer height = 2536
boolean titlebar = true
string title = "Ingreso Solicitud de Soporte"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
dw_lista_ot_imprime dw_lista_ot_imprime
cb_imprimir cb_imprimir
cb_anular cb_anular
cb_gestionar cb_gestionar
cb_asignar cb_asignar
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_detalle_mantencion dw_detalle_mantencion
rb_software rb_software
rb_hardware rb_hardware
st_1 st_1
dw_soporte_mantencion dw_soporte_mantencion
dw_ingreso_soporte dw_ingreso_soporte
gb_1 gb_1
gb_2 gb_2
end type
global w_ingreso_soporte w_ingreso_soporte

on w_ingreso_soporte.create
this.dw_lista_ot_imprime=create dw_lista_ot_imprime
this.cb_imprimir=create cb_imprimir
this.cb_anular=create cb_anular
this.cb_gestionar=create cb_gestionar
this.cb_asignar=create cb_asignar
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_detalle_mantencion=create dw_detalle_mantencion
this.rb_software=create rb_software
this.rb_hardware=create rb_hardware
this.st_1=create st_1
this.dw_soporte_mantencion=create dw_soporte_mantencion
this.dw_ingreso_soporte=create dw_ingreso_soporte
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_lista_ot_imprime,&
this.cb_imprimir,&
this.cb_anular,&
this.cb_gestionar,&
this.cb_asignar,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_detalle_mantencion,&
this.rb_software,&
this.rb_hardware,&
this.st_1,&
this.dw_soporte_mantencion,&
this.dw_ingreso_soporte,&
this.gb_1,&
this.gb_2}
end on

on w_ingreso_soporte.destroy
destroy(this.dw_lista_ot_imprime)
destroy(this.cb_imprimir)
destroy(this.cb_anular)
destroy(this.cb_gestionar)
destroy(this.cb_asignar)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_detalle_mantencion)
destroy(this.rb_software)
destroy(this.rb_hardware)
destroy(this.st_1)
destroy(this.dw_soporte_mantencion)
destroy(this.dw_ingreso_soporte)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;Long		ll_new,ll_nivel,ll_new2
datetime ldt_fecha_hoy

dw_ingreso_soporte.accepttext()
gf_centrar(w_ingreso_soporte)
dw_ingreso_soporte.settransobject(sqlca)
dw_soporte_mantencion.settransobject(sqlca)
dw_detalle_mantencion.settransobject(sqlca)
dw_lista_ot_imprime.settransobject(sqlca)
ll_new					= dw_ingreso_soporte.insertrow(0)
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
dw_ingreso_soporte.setitem(ll_new,'fecha_ingreso',ldt_fecha_hoy)
dw_ingreso_soporte.setitem(ll_new,'fecha_termino',ldt_fecha_hoy)
dw_ingreso_soporte.setitem(ll_new,'usuario_soporte',gs_user)
  SELECT "SOPORTE_NIVEL_USUARIO"."NIVEL"  
    INTO :ll_nivel  
    FROM "SOPORTE_NIVEL_USUARIO"  
   WHERE "SOPORTE_NIVEL_USUARIO"."USUARIO" = :gs_user 
	USING sqlca;
	if ll_nivel = 1 then
		dw_ingreso_soporte.object.usuario_soporte.protect		= 1
	end if 
dw_ingreso_soporte.setfocus()
end event

type dw_lista_ot_imprime from datawindow within w_ingreso_soporte
boolean visible = false
integer x = 3918
integer y = 188
integer width = 1298
integer height = 1624
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_ot_imprime"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_ingreso_soporte
integer x = 2487
integer y = 2252
integer width = 352
integer height = 116
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long ll_correlativo

ll_correlativo	=	dw_ingreso_soporte.getitemnumber(1,'correlativo_ot')
dw_lista_ot_imprime.retrieve(ll_correlativo)
if dw_lista_ot_imprime.rowcount() > 0 then 
	dw_lista_ot_imprime.object.datawindow.Print.Preview	= true
	f_Print( dw_lista_ot_imprime )
	dw_lista_ot_imprime.object.datawindow.Print.Preview	= False
end if
end event

type cb_anular from commandbutton within w_ingreso_soporte
integer x = 2025
integer y = 2252
integer width = 352
integer height = 116
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular"
end type

event clicked;string ls_obs_final,ls_sw='S'
long ret,ll_correlativo
datetime ldt_fecha_asigna, ldt_fecha_hoy

dw_ingreso_soporte.accepttext()
ls_obs_final			= dw_ingreso_soporte.GetitemString(1,'observacion_final')
if isnull(ls_obs_final) or ls_obs_final='' then
	messagebox('Advertencia','Debe Ingresar Observación Final')
	dw_ingreso_soporte.setfocus()
	dw_ingreso_soporte.setcolumn('observacion_final')
	ls_sw		= 'N'
	if ls_sw='S' then
	dw_ingreso_soporte.setitem(1,'observacion_final',ls_obs_final)
	end if
else
	ret	= MessageBox('Actualizar', "Desea Anular Orden de Trabajo", Question!, YesNo!, 2)
	IF ret = 1 THEN
		ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
		ll_correlativo 		= dw_ingreso_soporte.getitemnumber(1,'correlativo_ot')
		UPDATE	"SOPORTE_ATENCION"  
		SET		"FECHA_TERMINO" 		= :ldt_fecha_hoy,
					"ESTADO_OT"		 		= 'A',
					"OBSERVACION_FINAL"	= :ls_obs_final
		WHERE		"SOPORTE_ATENCION"."CORRELATIVO_OT" = :ll_correlativo   
		USING              sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Grabar","Grabación Exitosa")
			if isvalid(w_lista_soporte) then w_lista_soporte.pb_ok2.triggerevent(clicked!)
		close(w_ingreso_soporte)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Mensaje: "+sqlca.sqlerrtext)
		end if
	end if
end if

end event

type cb_gestionar from commandbutton within w_ingreso_soporte
integer x = 1106
integer y = 2252
integer width = 530
integer height = 116
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Dar &Término O.T"
end type

event clicked;string ls_obs_final,ls_sw='S'
long ret,ll_correlativo
datetime ldt_fecha_asigna, ldt_fecha_hoy

dw_ingreso_soporte.accepttext()
ls_obs_final			= dw_ingreso_soporte.GetitemString(1,'observacion_final')
if isnull(ls_obs_final) or ls_obs_final='' then
	messagebox('Advertencia','Debe Ingresar Observación Final')
	dw_ingreso_soporte.setfocus()
	dw_ingreso_soporte.setcolumn('observacion_final')
	ls_sw		= 'N'
	if ls_sw='S' then
	dw_ingreso_soporte.setitem(1,'observacion_final',ls_obs_final)
	end if
else
	ret	= MessageBox('Actualizar', "Desea Gestionar Orden de Trabajo", Question!, YesNo!, 2)
	IF ret = 1 THEN
		ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
		ll_correlativo 		= dw_ingreso_soporte.getitemnumber(1,'correlativo_ot')
		UPDATE	"SOPORTE_ATENCION"  
		SET		"FECHA_TERMINO" 		= :ldt_fecha_hoy,
					"ESTADO_OT"		 		= 'G',
					"OBSERVACION_FINAL"	= :ls_obs_final
		WHERE		"SOPORTE_ATENCION"."CORRELATIVO_OT" = :ll_correlativo   
		USING              sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Grabar","Grabación Exitosa")
			if isvalid(w_lista_soporte) then w_lista_soporte.pb_ok2.triggerevent(clicked!)
		close(w_ingreso_soporte)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Mensaje: "+sqlca.sqlerrtext)
		end if
	end if
end if

end event

type cb_asignar from commandbutton within w_ingreso_soporte
integer x = 480
integer y = 2252
integer width = 562
integer height = 116
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asignación Directa"
end type

event clicked;long ret,ll_correlativo
datetime ldt_fecha_asigna, ldt_fecha_hoy

	ret	= MessageBox('Actualizar', "Desea Asignar Orden de Trabajo", Question!, YesNo!, 2)
IF ret = 1 THEN
	ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
	ll_correlativo 		= dw_ingreso_soporte.getitemnumber(1,'correlativo_ot')
	UPDATE	"SOPORTE_ATENCION"  
	SET		"USUARIO_SOPORTE"	 = :gs_user,
				"FECHA_ASIGNACION" = :ldt_fecha_hoy,
				"ESTADO_INICIAL"	 = 'N'
	WHERE		"SOPORTE_ATENCION"."CORRELATIVO_OT" = :ll_correlativo   
	USING              sqlca;
	if sqlca.sqlcode=0 then
		messagebox("Grabar","Grabación Exitosa")
		if isvalid(w_lista_soporte) then w_lista_soporte.pb_ok2.triggerevent(clicked!)
	close(w_ingreso_soporte)
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Mensaje: "+sqlca.sqlerrtext)
	end if
end if




end event

type cb_grabar from commandbutton within w_ingreso_soporte
integer x = 46
integer y = 2252
integer width = 352
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_obs_inicial,ls_obs_final,ls_sw='S',ls_usuario_soporte,ls_ip,ls_descripcion_detalle,&
			ls_placa_madre,ls_memoria,ls_disco,ls_lector_grabador,ls_tarjeta_video,ls_tarjeta_sonido,&
			ls_tarjeta_wireless,ls_monitor,ls_impresora,ls_parlantes,ls_procesador,ls_pasa,ls_descrip
long		ret,ll_parque,ll_count,ll_estado,ll_correlativo,ll_corr_aux,ll_fila,ll_estado_cambio,&
			ll_codigo_des_mantencion,ll_tot_reg,ll_indi,ll_codigo,ll_count_mod=0
datetime	ldt_fecha_hoy,ldt_fecha_ingreso
	

dw_ingreso_soporte.accepttext()
dw_soporte_mantencion.accepttext()
dw_detalle_mantencion.accepttext()
ll_tot_reg						= dw_detalle_mantencion.rowcount()
ls_pasa							= 'S'
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ll_estado				= dw_detalle_mantencion.getitemnumber(ll_indi,'estado_cambio')
		ls_descrip				= dw_detalle_mantencion.getitemstring(ll_indi,'descripcion_detalle')
		if ll_estado=0 then
			if isnull(ls_descrip) or ls_descrip='' then
				messagebox("Advertencia","Debe Ingresar Descripción en Fila Nº "+string(ll_indi))
				dw_detalle_mantencion.scrolltorow(ll_indi)
				exit
				ls_pasa			= 'N'
			end if
		end if
	next
	if ls_pasa='S' then
		ls_obs_inicial				= dw_ingreso_soporte.GetItemString(1,'observacion_ini')
		ls_ip							= dw_ingreso_soporte.GetItemString(1,'ip')
		ls_obs_final				= dw_ingreso_soporte.GetItemString(1,'observacion_final')
		ll_correlativo				= dw_detalle_mantencion.getitemnumber(1,'correlativo')
		ls_usuario_soporte		= dw_ingreso_soporte.getitemstring(1,'usuario_soporte')
		ll_estado_cambio			= dw_detalle_mantencion.getitemnumber(1,'estado_cambio')
		ls_descripcion_detalle	= dw_detalle_mantencion.getitemstring(1,'descripcion_detalle')
		ll_codigo_des_mantencion= dw_detalle_mantencion.getitemnumber(1,'codigo_des_mantencion')
		
		if isnull(ls_obs_inicial) or ls_obs_inicial='' then
			messagebox('Advertencia','Debe Ingresar La Observacion Inicial')
			dw_ingreso_soporte.setfocus()
			dw_ingreso_soporte.setcolumn('observacion_ini')
			ls_sw		= 'N'
		end if
		if ls_sw='S' then
			dw_ingreso_soporte.setitem(1,'observacion_ini',ls_obs_inicial)
			dw_ingreso_soporte.setitem(1,'observacion_final',ls_obs_final)
			// validar que la dw tenga datos
			ret	= MessageBox('Actualizar', "Desea Grabar Soporte", Question!, YesNo!, 2)
			IF ret = 1 THEN
				if ls_usuario_soporte='' or isnull(ls_usuario_soporte) then
					dw_ingreso_soporte.setitem(1,'usuario_soporte',gs_user)
					dw_ingreso_soporte.setitem(1,'fecha_asignacion',ldt_fecha_hoy)
					dw_detalle_mantencion.setitem(1,'estado_ot','S')
				end if
				SELECT 	"SOPORTE_EQUIPOS"."PLACA_MADRE",	"SOPORTE_EQUIPOS"."MEMORIA",	"SOPORTE_EQUIPOS"."DISCO",	"SOPORTE_EQUIPOS"."LECTOR_GRABADOR",   "SOPORTE_EQUIPOS"."TARJETA_VIDEO",  "SOPORTE_EQUIPOS"."MONITOR",   "SOPORTE_EQUIPOS"."IMPRESORA",   "SOPORTE_EQUIPOS"."PROCESADOR"  
				INTO		:ls_placa_madre,  					:ls_memoria,						:ls_disco,						:ls_lector_grabador,							:ls_tarjeta_video,						:ls_monitor, 							:ls_impresora,						 :ls_procesador  
				FROM 		"SOPORTE_EQUIPOS"  
				WHERE 	"SOPORTE_EQUIPOS"."IP" = :ls_ip   
				USING  	sqlca;
				if sqlca.sqlcode=0 then
					for ll_indi=1 to ll_tot_reg
						ll_estado				= dw_detalle_mantencion.getitemnumber(ll_indi,'estado_cambio')
						ls_descrip				= dw_detalle_mantencion.getitemstring(ll_indi,'descripcion_detalle')
						ll_codigo				= dw_detalle_mantencion.getitemnumber(ll_indi,'codigo_des_mantencion')
						if ll_estado=0 then
							if ll_codigo=58 and ll_estado=0 then
								ls_placa_madre			= ls_descrip
								ll_count_mod++
							end if
							if ll_codigo=54 and ll_estado=0 then
								ls_memoria				= ls_descrip
								ll_count_mod++
							end if
							if ll_codigo=50 and ll_estado=0 then
								ls_disco					= ls_descrip
								ll_count_mod++
							end if
							if ll_codigo=53 and ll_estado=0 then
								ls_lector_grabador	= ls_descrip
								ll_count_mod++
							end if
							if ll_codigo=60 and ll_estado=0 then
								ls_tarjeta_video		= ls_descrip
								ll_count_mod++
							end if
							if ll_codigo=57 and ll_estado=0 then
								ls_monitor				= ls_descrip
								ll_count_mod++
							end if
							if ll_codigo=52 and ll_estado=0 then
								ls_impresora			= ls_descrip
								ll_count_mod++
							end if
							if ll_codigo=59 and ll_estado=0 then
								ls_procesador			= ls_descrip
								ll_count_mod++
							end if
						end if
					next
					if ll_count_mod>0 then
						UPDATE	"SOPORTE_EQUIPOS"  
						SET 		"PLACA_MADRE" = :ls_placa_madre,   
									"MEMORIA" = :ls_memoria,   
									"DISCO" = :ls_disco,   
									"LECTOR_GRABADOR" = :ls_lector_grabador,   
									"TARJETA_VIDEO" = :ls_tarjeta_video,   
									"MONITOR" = :ls_monitor,   
									"IMPRESORA" = :ls_impresora,
									"PROCESADOR" = :ls_procesador
						WHERE 	"SOPORTE_EQUIPOS"."IP" = :ls_ip   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error Grabar","Error al Grabar Mensaje: "+sqlca.sqlerrtext)
						end if
					end if
				end if
				if dw_ingreso_soporte.update()=1 and dw_detalle_mantencion.update()=1 then
					commit;
					messagebox("Grabar","Grabación Exitosa")
					if isvalid(w_lista_soporte) then w_lista_soporte.pb_ok2.triggerevent(clicked!)
					close(w_ingreso_soporte)
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Mensaje: "+sqlca.sqlerrtext)
				end if
			end if
		end if
	end if
else
	messagebox("Advertencia","Debe Seleccionar Opción de Mantención")
end if
end event

type cb_cerrar from commandbutton within w_ingreso_soporte
integer x = 3401
integer y = 2252
integer width = 352
integer height = 116
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_soporte)
end event

type dw_detalle_mantencion from datawindow within w_ingreso_soporte
integer x = 1106
integer y = 1060
integer width = 2619
integer height = 1136
integer taborder = 70
string title = "none"
string dataobject = "dw_detalle_mantencion"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long ll_estado_cambio

dw_detalle_mantencion.accepttext()
ll_estado_cambio	= dw_detalle_mantencion.getitemnumber(1,'estado_cambio')
if ll_estado_cambio = 1 then
	messagebox('Advertencia','Ingresar Descripción Detalle')
	dw_detalle_mantencion.setfocus()
	dw_detalle_mantencion.setcolumn('descripcion_detalle')
else 
	ll_estado_cambio = 0
end if
end event

type rb_software from radiobutton within w_ingreso_soporte
integer x = 562
integer y = 1048
integer width = 434
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Software"
end type

event clicked;long	ll_tot_reg, ll_fila, ll_indi,ll_estado,ll_tot_reg_mant,ll_cod,ll_row

if rb_software.checked	= true then
	ll_tot_reg				= dw_soporte_mantencion.retrieve('S')
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			dw_soporte_mantencion.setitem(ll_indi,'c_estado',1)
		next
		dw_soporte_mantencion.accepttext()
		ll_tot_reg_mant	= dw_detalle_mantencion.rowcount()
		if ll_tot_reg_mant > 0 then
			for ll_indi=1 to ll_tot_reg_mant
				ll_cod		= dw_detalle_mantencion.getitemnumber(ll_indi,'codigo_des_mantencion')
				w_ingreso_soporte.dw_detalle_mantencion.object.estado_cambio.protect	= 1
				ll_row	= dw_soporte_mantencion.Find("codigo = "+string(ll_cod), 1, dw_soporte_mantencion.RowCount())
				if ll_row>0 then
					dw_soporte_mantencion.setitem(ll_row,'c_estado',0)
				end if
			next
		end if
	end if
	dw_ingreso_soporte.setfocus()
end if

end event

type rb_hardware from radiobutton within w_ingreso_soporte
integer x = 87
integer y = 1048
integer width = 443
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hardware"
boolean checked = true
end type

event clicked;long	ll_tot_reg, ll_fila, ll_indi,ll_estado,ll_tot_reg_mant,ll_cod,ll_row

if rb_hardware.checked	= true then
	ll_tot_reg				= dw_soporte_mantencion.retrieve('H')
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			dw_soporte_mantencion.setitem(ll_indi,'c_estado',1)
		next
		dw_soporte_mantencion.accepttext()
		ll_tot_reg_mant	= dw_detalle_mantencion.rowcount()
		if ll_tot_reg_mant > 0 then
			for ll_indi=1 to ll_tot_reg_mant
				ll_cod	= dw_detalle_mantencion.getitemnumber(ll_indi,'codigo_des_mantencion')
				ll_row	= dw_soporte_mantencion.Find("codigo = "+string(ll_cod), 1, dw_soporte_mantencion.RowCount())
				if ll_row>0 then
					dw_soporte_mantencion.setitem(ll_row,'c_estado',0)
				end if
			next
		end if
	end if
	dw_ingreso_soporte.setfocus()
end if
end event

type st_1 from statictext within w_ingreso_soporte
integer x = 1317
integer y = 40
integer width = 1225
integer height = 104
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gestión Orden de Trabajo"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_soporte_mantencion from datawindow within w_ingreso_soporte
integer x = 69
integer y = 1152
integer width = 937
integer height = 1044
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_tabla_soporte_mantencion"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String	ls_columna,ls_estado_mant,ls_obs_final
Long		ll_estado,ll_new,ll_codigo,ll_fila,ll_correlativo

ls_columna			= dwo.name
if ls_columna='c_estado' then
	ll_estado		= long(data)
	if ll_estado=0 then
		ll_codigo		= dw_soporte_mantencion.getitemnumber(row,'codigo')
		ll_fila			= dw_detalle_mantencion.Find("codigo_des_mantencion = "+string(ll_codigo), 1, dw_detalle_mantencion.RowCount())
		ll_correlativo	= dw_ingreso_soporte.getitemnumber(1,'correlativo_ot')
		//ls_obs_final	= dw_ingreso_soporte.getitemstring(1,'observacion_final')
		ls_estado_mant	= dw_ingreso_soporte.getitemstring(1,'estado_ot')
		if ll_fila = 0 then
			ll_new		= dw_detalle_mantencion.insertrow(0)
			dw_detalle_mantencion.scrolltorow(ll_new)
			dw_detalle_mantencion.setitem(ll_new,'codigo_des_mantencion',ll_codigo)
			dw_detalle_mantencion.setitem(ll_new,'correlativo',ll_correlativo)
			//dw_detalle_mantencion.setitem(ll_new,'descripcion_detalle',ls_obs_final)
			dw_detalle_mantencion.setitem(ll_new,'estado_mantencion',ls_estado_mant)
			dw_detalle_mantencion.setitem(ll_new,'estado_cambio',1)
			dw_detalle_mantencion.setfocus()
		else
			messagebox("Advertencia","Tipo Mantención Ya fue Seleccionado")
			dw_soporte_mantencion.setitem(row,'c_estado',1)
		end if
	else
		ll_codigo	= dw_soporte_mantencion.getitemnumber(row,'codigo')
		ll_fila		= dw_detalle_mantencion.Find("codigo_des_mantencion = "+string(ll_codigo), 1, dw_detalle_mantencion.RowCount())
		if ll_fila>0 then
			dw_detalle_mantencion.deleterow(ll_fila)
			if dw_detalle_mantencion.rowcount() > 0 then
				dw_detalle_mantencion.scrolltorow(1)
			end if
		end if
	end if
	dw_soporte_mantencion.accepttext()
	dw_detalle_mantencion.accepttext()
end if
end event

type dw_ingreso_soporte from datawindow within w_ingreso_soporte
integer x = 55
integer y = 184
integer width = 3721
integer height = 740
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_soporte"
boolean border = false
boolean livescroll = true
end type

event clicked;String	ls_estado,ls_columna,ls_fecha
Datetime	ldt_fecha_fall
ls_columna	= dwo.name
if ls_columna = 'p_1' then
 		ls_fecha	= string(date(dw_ingreso_soporte.getitemdatetime(dw_ingreso_soporte.getrow(),'fecha_ingreso')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_ingreso_soporte.setitem(dw_ingreso_soporte.getrow(),'fecha_ingreso',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_ingreso_soporte.setitem(dw_ingreso_soporte.getrow(),'fecha_ingreso',date(ls_fecha))
		END IF
	end if
	
if ls_columna = 'p_2' then
 		ls_fecha	= string(date(dw_ingreso_soporte.getitemdatetime(dw_ingreso_soporte.getrow(),'fecha_termino')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_ingreso_soporte.setitem(dw_ingreso_soporte.getrow(),'fecha_termino',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_ingreso_soporte.setitem(dw_ingreso_soporte.getrow(),'fecha_termino',date(ls_fecha))
		END IF
	end if
end event

event itemchanged;string ls_columna, ls_tcp_ip,ls_var,ls_var2,ls_var3,ls_var4
long	 ll_contar,ll_pos 

this.accepttext()
ls_columna 		= dwo.name
if ls_columna = 'ip' then
	ls_tcp_ip	=	dw_ingreso_soporte.getitemstring(1,'ip')
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
			dw_ingreso_soporte.setitem(1,'IP','')
			setcolumn('ip')
		end if
	end if
end if
end event

type gb_1 from groupbox within w_ingreso_soporte
integer x = 37
integer y = 972
integer width = 1006
integer height = 1252
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
end type

type gb_2 from groupbox within w_ingreso_soporte
integer x = 1070
integer y = 972
integer width = 2688
integer height = 1252
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción Mantención"
end type

