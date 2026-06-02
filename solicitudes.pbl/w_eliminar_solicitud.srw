forward
global type w_eliminar_solicitud from window
end type
type dw_print from datawindow within w_eliminar_solicitud
end type
type st_nro from statictext within w_eliminar_solicitud
end type
type st_2 from statictext within w_eliminar_solicitud
end type
type cb_cerrar from commandbutton within w_eliminar_solicitud
end type
type rb_otro from radiobutton within w_eliminar_solicitud
end type
type st_1 from statictext within w_eliminar_solicitud
end type
type rb_rechazado from radiobutton within w_eliminar_solicitud
end type
type rb_error from radiobutton within w_eliminar_solicitud
end type
type gb_1 from groupbox within w_eliminar_solicitud
end type
type mle_obs from multilineedit within w_eliminar_solicitud
end type
type cb_eliminar from commandbutton within w_eliminar_solicitud
end type
end forward

global type w_eliminar_solicitud from window
integer width = 2290
integer height = 1168
boolean titlebar = true
string title = "Eliminar Solicitud"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_print dw_print
st_nro st_nro
st_2 st_2
cb_cerrar cb_cerrar
rb_otro rb_otro
st_1 st_1
rb_rechazado rb_rechazado
rb_error rb_error
gb_1 gb_1
mle_obs mle_obs
cb_eliminar cb_eliminar
end type
global w_eliminar_solicitud w_eliminar_solicitud

type variables
string	is_tipo_sol,is_obs,is_base,is_serie
Long		il_corr, il_row
Double	il_numero
Date		idt_fecha_hoy
end variables

on w_eliminar_solicitud.create
this.dw_print=create dw_print
this.st_nro=create st_nro
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.rb_otro=create rb_otro
this.st_1=create st_1
this.rb_rechazado=create rb_rechazado
this.rb_error=create rb_error
this.gb_1=create gb_1
this.mle_obs=create mle_obs
this.cb_eliminar=create cb_eliminar
this.Control[]={this.dw_print,&
this.st_nro,&
this.st_2,&
this.cb_cerrar,&
this.rb_otro,&
this.st_1,&
this.rb_rechazado,&
this.rb_error,&
this.gb_1,&
this.mle_obs,&
this.cb_eliminar}
end on

on w_eliminar_solicitud.destroy
destroy(this.dw_print)
destroy(this.st_nro)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.rb_otro)
destroy(this.st_1)
destroy(this.rb_rechazado)
destroy(this.rb_error)
destroy(this.gb_1)
destroy(this.mle_obs)
destroy(this.cb_eliminar)
end on

event open;gf_centrar(w_eliminar_solicitud)
il_corr 				= long(substr(1,1,Message.StringParm))
is_tipo_sol			= substr(1,2,Message.StringParm)
il_row					= long(substr(1,3,Message.StringParm))
is_obs				= substr(1,4,Message.StringParm)
is_base				= substr(1,5,Message.StringParm)
is_serie				= substr(1,6,Message.StringParm)
il_numero			= Double(substr(1,7,Message.StringParm))

idt_fecha_hoy		= date(gdt_fec_sistema)
dw_print.settransobject(sqlca)
mle_obs.text		= is_obs
mle_obs.enabled	= false
rb_error.checked	= true
rb_error.triggerevent(clicked!)
st_nro.text			= gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,##0")+'-'+string(il_corr,"###,###,###,###,##0")
gs_ventana			= 'w_eliminar_solicitud'
f_valida_objeto()
end event

type dw_print from datawindow within w_eliminar_solicitud
boolean visible = false
integer x = 686
integer y = 924
integer width = 663
integer height = 432
integer taborder = 40
string dataobject = "dw_documento_solicitud_acepta_o_rechaza"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_nro from statictext within w_eliminar_solicitud
integer x = 1207
integer y = 36
integer width = 1015
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_2 from statictext within w_eliminar_solicitud
integer x = 713
integer y = 36
integer width = 457
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solicitud Nº"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_eliminar_solicitud
integer x = 1902
integer y = 904
integer width = 329
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_eliminar_solicitud)
end event

type rb_otro from radiobutton within w_eliminar_solicitud
integer x = 1870
integer y = 728
integer width = 265
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Otros"
end type

event clicked;mle_obs.enabled	= true
mle_obs.text		= is_obs+', Solicitud anulada por '+gs_nom_comp_usuario+' el '+string(idt_fecha_hoy,"dd/mm/yyyy")+', motivo: '
mle_obs.setfocus()
end event

type st_1 from statictext within w_eliminar_solicitud
integer x = 69
integer y = 56
integer width = 443
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Observación"
boolean focusrectangle = false
end type

type rb_rechazado from radiobutton within w_eliminar_solicitud
integer x = 864
integer y = 728
integer width = 754
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Reachazada por Operaciones"
end type

event clicked;mle_obs.enabled	= false
mle_obs.text		= is_obs+', Solicitud Rechazada por '+gs_nom_comp_usuario+' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
end event

type rb_error from radiobutton within w_eliminar_solicitud
integer x = 119
integer y = 728
integer width = 485
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Solicitud Erronea"
end type

event clicked;mle_obs.enabled	= false
mle_obs.text		= is_obs+', Solicitud Erronea, anulada por '+gs_nom_comp_usuario+' el '+string(idt_fecha_hoy,"dd/mm/yyyy")
end event

type gb_1 from groupbox within w_eliminar_solicitud
integer x = 46
integer y = 644
integer width = 2185
integer height = 216
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Motivo de Anulación"
end type

type mle_obs from multilineedit within w_eliminar_solicitud
integer x = 46
integer y = 144
integer width = 2185
integer height = 468
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
textcase textcase = upper!
integer limit = 500
borderstyle borderstyle = stylelowered!
end type

type cb_eliminar from commandbutton within w_eliminar_solicitud
integer x = 46
integer y = 904
integer width = 366
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Rechazar"
end type

event clicked;long		ll_cant,ll_estado=11
String	ls_obs,ls_comentario,ls_conex,ls_estado
datetime	ld_fecha_hoy

ld_fecha_hoy	= datetime(idt_fecha_hoy,now())
ls_obs			= trim(mle_obs.text)
if len(ls_obs) > 500 then ls_obs = mid(ls_obs,1,500)
if ls_obs = '' then
	messagebox("Advertencia","Observación Invalida")
	mle_obs.setfocus()
else
	if w_detalle_solicitudes.dw_reporte.update()=1 then
		commit;

		DECLARE sp_nuevo_cadena_mora1 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
		EXECUTE sp_nuevo_cadena_mora1;
		
		DECLARE sp_nuevo_cadena_mora2 PROCEDURE FOR sp_nuevo_cadena_mora(:is_base,:is_serie,:il_numero,'M');
		EXECUTE sp_nuevo_cadena_mora2;

		if is_tipo_sol='12' then
			UPDATE	"SOL_ESTATUS"  
			SET 		"ESTADO_REG" = 'I',
						"OBSERVACION" = :ls_obs
			WHERE 	( "SOL_ESTATUS"."BASE" = 'W' ) AND  
						( "SOL_ESTATUS"."SERIE" = 'W' ) AND  
						( "SOL_ESTATUS"."NUMERO" = :gi_rut ) AND  
						( "SOL_ESTATUS"."CORRELATIVO" = :il_corr ) AND  
						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol )   
			Using		sqlca;
		else
			UPDATE	"SOL_ESTATUS"  
			SET 		"ESTADO_REG" = 'I',
						"OBSERVACION" = :ls_obs
			WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
						( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
						( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
						( "SOL_ESTATUS"."CORRELATIVO" = :il_corr ) AND  
						( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :is_tipo_sol )   
			Using		sqlca;
		end if
		if sqlca.sqlcode=0 then
			commit;
			if is_tipo_sol='4' then
				ls_comentario	= 'SOLICITUD DE SEGURO RECHAZADA'
				INSERT INTO "ATENCION_LOG"  
							( "RUT",   "ESTADO",   "FECHA",   		"GLOSA",   			"USUARIO",   "BASE",   "SERIE",   "NUMERO" )  
				VALUES	( :gi_rut, :ll_estado, :ld_fecha_hoy,  :ls_comentario,   :gs_user,    :gs_base, :gs_serie, :gi_numero )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
			w_detalle_solicitudes.dw_reporte.setitem(il_row,'sol_estatus_estado_reg','I')
			w_detalle_solicitudes.dw_reporte.setitem(il_row,'sol_estatus_observacion',ls_obs)
			w_detalle_solicitudes.dw_reporte.accepttext()
//			if isvalid(w_ingreso_solicitudes) then
//				ll_cant	= w_ingreso_solicitudes.dw_lista.getitemnumber(il_row,'cantidad')
//				ll_cant	= ll_cant - 1
//				if ll_cant=0 then 
//					w_ingreso_solicitudes.dw_lista.setitem(il_row,'estado',1)
//					w_ingreso_solicitudes.dw_lista.setitem(il_row,'cantidad',ll_cant)
//				else
//					w_ingreso_solicitudes.dw_lista.setitem(il_row,'estado',0)
//					w_ingreso_solicitudes.dw_lista.setitem(il_row,'cantidad',0)
//				end if
//				w_ingreso_solicitudes.dw_lista.accepttext()
//			end if
			if is_tipo_sol="1" then
				if dw_print.retrieve(gs_base,gs_serie,gi_numero,il_corr)>0 then
					ls_estado		= TRIM(dw_print.getitemstring(1,'sol_estatus_estado_reg'))
					if gs_conexion = "Parque El Prado" then
						ls_conex											= "P"
						dw_print.setitem(1,'conexion',ls_conex)
						dw_print.object.t_4.text					= 'Inmobiliaria Parque La Florida SpA'
						dw_print.object.txt_aceptada.visible	= false
						dw_print.object.txt_rechazo.visible		= true
					elseif gs_conexion = "Parque La Foresta" then
						dw_print.object.t_4.text					= 'Inmobiliaria Parque de La Serena SpA'
						ls_conex											= "F"
						dw_print.setitem(1,'conexion',ls_conex)
						dw_print.object.txt_aceptada.visible	= false
						dw_print.object.txt_rechazo.visible		= true
					elseif gs_conexion = "Parque Concepción" then
						dw_print.object.t_4.text					= 'Parque de Concepción SpA'
						ls_conex											= "C"
						dw_print.setitem(1,'conexion',ls_conex)
						dw_print.object.txt_aceptada.visible	= false
						dw_print.object.txt_rechazo.visible		= true
					end if
					f_Print( dw_print )
				end if
			end if
			if is_tipo_sol="17" then
				UPDATE	"SOL_COPROP_PROMESA_DETALLE"  
				SET 		"ESTADO_REG" = 'I'  
				WHERE  ( "SOL_COPROP_PROMESA_DETALLE"."BASE" = :gs_base ) AND  
						 ( "SOL_COPROP_PROMESA_DETALLE"."SERIE" = :gs_serie ) AND  
						 ( "SOL_COPROP_PROMESA_DETALLE"."NUMERO" = :gi_numero ) AND  
						 ( "SOL_COPROP_PROMESA_DETALLE"."CORRELATIVO" = :il_corr )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
		else
			rollback;
		end if
	else
		rollback;
	end if
	cb_cerrar.triggerevent(clicked!)
end if
end event

