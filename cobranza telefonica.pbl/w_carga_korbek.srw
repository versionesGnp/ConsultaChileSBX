forward
global type w_carga_korbek from window
end type
type cb_2 from commandbutton within w_carga_korbek
end type
type rb_terreno from radiobutton within w_carga_korbek
end type
type rb_telefonica from radiobutton within w_carga_korbek
end type
type dw_cargar from datawindow within w_carga_korbek
end type
type cb_1 from commandbutton within w_carga_korbek
end type
type cb_cerrar from commandbutton within w_carga_korbek
end type
type cb_cargar from commandbutton within w_carga_korbek
end type
type dw_lista from datawindow within w_carga_korbek
end type
type gb_1 from groupbox within w_carga_korbek
end type
type dw_usuario_terreno from datawindow within w_carga_korbek
end type
type dw_usuario from datawindow within w_carga_korbek
end type
end forward

global type w_carga_korbek from window
integer width = 2958
integer height = 1804
boolean titlebar = true
string title = "Carga Gestión Cobranza Externa"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
rb_terreno rb_terreno
rb_telefonica rb_telefonica
dw_cargar dw_cargar
cb_1 cb_1
cb_cerrar cb_cerrar
cb_cargar cb_cargar
dw_lista dw_lista
gb_1 gb_1
dw_usuario_terreno dw_usuario_terreno
dw_usuario dw_usuario
end type
global w_carga_korbek w_carga_korbek

type variables
string named,is_tipo_cobranza
long	il_row
end variables

on w_carga_korbek.create
this.cb_2=create cb_2
this.rb_terreno=create rb_terreno
this.rb_telefonica=create rb_telefonica
this.dw_cargar=create dw_cargar
this.cb_1=create cb_1
this.cb_cerrar=create cb_cerrar
this.cb_cargar=create cb_cargar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.dw_usuario_terreno=create dw_usuario_terreno
this.dw_usuario=create dw_usuario
this.Control[]={this.cb_2,&
this.rb_terreno,&
this.rb_telefonica,&
this.dw_cargar,&
this.cb_1,&
this.cb_cerrar,&
this.cb_cargar,&
this.dw_lista,&
this.gb_1,&
this.dw_usuario_terreno,&
this.dw_usuario}
end on

on w_carga_korbek.destroy
destroy(this.cb_2)
destroy(this.rb_terreno)
destroy(this.rb_telefonica)
destroy(this.dw_cargar)
destroy(this.cb_1)
destroy(this.cb_cerrar)
destroy(this.cb_cargar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.dw_usuario_terreno)
destroy(this.dw_usuario)
end on

event open;gf_centrar(w_carga_korbek)
//dw_lista.settransobject(sqlca)
dw_cargar.settransobject(sqlca)
dw_usuario.settransobject(sqlca)
dw_usuario.insertrow(0)
dw_usuario_terreno.settransobject(sqlca)
dw_usuario_terreno.insertrow(0)
if gs_depto = 'E' then
	rb_terreno.enabled	= true
	rb_terreno.checked	= true
	dw_usuario.visible		= false
	is_tipo_cobranza		= 'T'
	dw_cargar.dataobject = 'dw_cargar_lista_terreno_masivo'
	dw_cargar.settransobject(sqlca)
	dw_lista.dataobject	= 'dwe_carga_terreno_masivo'
	dw_lista.settransobject(sqlca)
elseif 	gs_depto = 'F' then
	rb_telefonica.enabled = true
	dw_usuario_terreno.visible	= false
	is_tipo_cobranza		= 'P'
	dw_cargar.dataobject = 'dw_cargar_lista'
	dw_cargar.settransobject(sqlca)
	dw_lista.dataobject	= 'dwe_carga_korbek'
	dw_lista.settransobject(sqlca)
elseif 	gs_depto = 'I' then
	rb_terreno.enabled	= true
	rb_telefonica.checked	= true
	rb_telefonica.enabled = true
	dw_usuario_terreno.visible	= true
	dw_usuario.visible		= true
	is_tipo_cobranza		= 'P'
end if


end event

type cb_2 from commandbutton within w_carga_korbek
boolean visible = false
integer x = 942
integer y = 1596
integer width = 343
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "equifax"
end type

event clicked;if isvalid(w_carga_equifax) then close(w_carga_equifax)
open(w_carga_equifax)
end event

type rb_terreno from radiobutton within w_carga_korbek
integer x = 498
integer y = 72
integer width = 402
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "C. Terreno"
end type

event clicked;if rb_terreno.checked=true then
	dw_cargar.dataobject = 'dw_cargar_lista_terreno_masivo'
	dw_cargar.settransobject(sqlca)
	dw_usuario.visible		= false
	dw_usuario_terreno.visible	= true
	is_tipo_cobranza		= 'T'
	dw_lista.dataobject	= 'dwe_carga_terreno_masivo'
	dw_lista.settransobject(sqlca)
end if	
end event

type rb_telefonica from radiobutton within w_carga_korbek
integer x = 59
integer y = 72
integer width = 402
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "C. Telefonica"
boolean checked = true
end type

event clicked;if rb_telefonica.checked=true then
	dw_cargar.dataobject = 'dw_cargar_lista'
	dw_cargar.settransobject(sqlca)
	dw_usuario.visible		= true
	dw_usuario_terreno.visible	= false
	is_tipo_cobranza		= 'P'
	dw_lista.dataobject	= 'dwe_carga_korbek'
	dw_lista.settransobject(sqlca)
end if	
end event

type dw_cargar from datawindow within w_carga_korbek
integer x = 41
integer y = 204
integer width = 2862
integer height = 1348
string title = "none"
string dataobject = "dw_cargar_lista"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type cb_1 from commandbutton within w_carga_korbek
integer x = 32
integer y = 1584
integer width = 256
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string	ls_glosa,ls_usuario_gest,ls_base,ls_serie,ls_dia,ls_mes,ls_anno,ls_fecha_archivo,ls_est_gest
long ll_tot_reg,ll_rut,ll_count_reg,ll_max_corr,ll_indi,ll_graba,ll_ret
datetime	ldt_fech_crea,ldt_fech_gest,ldt_fec_ultima_gest
date	ld_fecha_archivo
double	ldb_numero

ll_tot_reg							= dw_lista.rowcount()
ll_graba								= 0
if not isnull(ll_tot_reg) and ll_tot_reg > 0 then
	ll_ret 		= messagebox('Grabar','Desea Grabar los Datos',Question!,YesNo!,2)
	if ll_ret = 1 then
		Setpointer(Hourglass!)
		/*normalizacion nombre   ejemplo: KORBEK12092014.txt */
		ls_dia										= trim(mid(named,7,2))
		ls_mes									= trim(mid(named,9,2))
		ls_anno									= trim(mid(named,11,4))
		ls_fecha_archivo						= ls_dia+'/'+ls_mes+'/'+ls_anno
		ld_fecha_archivo						= date(ls_fecha_archivo)
		if isnull(ld_fecha_archivo) then ld_fecha_archivo=date(gdt_fec_sistema)
		//ls_usuario_gest							= dw_usuario.getitemstring(1,'usuario_asigando')
		if is_tipo_cobranza= 'P' then
			ls_usuario_gest							= dw_usuario.getitemstring(1,'usuario_asigando')
		elseif is_tipo_cobranza = 'T' then	
			ls_usuario_gest							= dw_usuario_terreno.getitemstring(1,'usuario_asigando')
		end if	
		if not isnull(ls_usuario_gest ) and ls_usuario_gest <> '' then
			SELECT	COUNT("LOG_SERVIPAG"."CORRELATIVO")  
			INTO 		:ll_count_reg  
			FROM 	"LOG_SERVIPAG"
			WHERE 	"LOG_SERVIPAG"."NOMBRE_ARCHIVO" = :named ;
			if ll_count_reg>0 then
				messagebox("Advertencia","No es Posible Cargar, Ya fue Recuperado Archivo "+named)
			else
				SELECT	MAX("LOG_SERVIPAG"."CORRELATIVO")
				INTO 		:ll_max_corr  
				FROM 	"LOG_SERVIPAG"  ;
				if ll_max_corr > 0 then
					ll_max_corr ++
				else
					ll_max_corr		= 1
				end if
				INSERT INTO "LOG_SERVIPAG"
							 ( "CORRELATIVO",	"FECHA_ARCHIVO",		"FECHA_CREA",	"USUARIO_CREADOR",	"NOMBRE_ARCHIVO" )
				VALUES 	 ( :ll_max_corr,			:ld_fecha_archivo,			:gdt_fec_sistema,	:gs_user,					:named )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					for ll_indi=1 to ll_tot_reg
						ll_rut					= dw_cargar.getitemnumber(ll_indi,'rut')
						ls_est_gest			= dw_cargar.getitemstring(ll_indi,'estado')
						ldt_fech_gest		= dw_cargar.getitemdatetime(ll_indi,'fecha')
						ls_glosa				= dw_cargar.getitemstring(ll_indi,'glosa')
						ls_base				= dw_cargar.getitemstring(ll_indi,'base')
						ls_serie				= dw_cargar.getitemstring(ll_indi,'serie')
						ldb_numero			= dw_cargar.getitemnumber(ll_indi,'numero')
						if is_tipo_cobranza = 'P' then
							SELECT 	  MAX("GESTION_COBRANZA"."FECHA_ASIGNACION") 
							INTO		:ldt_fec_ultima_gest
							FROM 	  "GESTION_COBRANZA" 
							WHERE 	( "GESTION_COBRANZA"."BASE" = :ls_base ) AND 
										( "GESTION_COBRANZA"."SERIE" = :ls_serie ) AND 
										( "GESTION_COBRANZA"."NUMERO" = :ldb_numero )
							USING sqlca;
						elseif is_tipo_cobranza = 'T' then
							SELECT 	  MAX("AT_GESTION"."FECHA_CREA") 
							INTO		:ldt_fec_ultima_gest
							FROM 	  "AT_GESTION" 
							WHERE 	( "AT_GESTION"."BASE" = :ls_base ) AND 
										( "AT_GESTION"."SERIE" = :ls_serie ) AND 
										( "AT_GESTION"."NUMERO" = :ldb_numero )
							USING sqlca;
						end if	
						if ldt_fech_gest <> ldt_fec_ultima_gest then
							if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and ldb_numero > 0 and ll_rut > 0  and not isnull(ls_glosa) and ls_glosa <> '' and not isnull(ls_est_gest) and ls_est_gest <> '' then //ls_glosa + ls_est_gest
								if is_tipo_cobranza = 'P' then
									INSERT INTO 	"TELE_LOG"  
														( "RUT"  ,"ESTADO"  ,"FECHA"  ,		"GLOSA","USUARIO",		  "BASE"  ,"SERIE"  ,"NUMERO" )  
									VALUES 			( :ll_rut,:ls_est_gest,:ldt_fech_gest ,:ls_glosa,	:ls_usuario_gest,:ls_base,:ls_serie,:ldb_numero)  
									USING			sqlca;
									if sqlca.sqlcode=0 then
										commit;
										if ldt_fec_ultima_gest<ldt_fech_gest then
											UPDATE 	"GESTION_COBRANZA"  
											SET 		"ESTADO_COBRANZA" = :ls_est_gest,   
														"FECHA_COBRANZA" = :ldt_fech_gest,   
														"GLOSA_COBRANZA" = :ls_glosa  
											WHERE ( "GESTION_COBRANZA"."BASE" = :ls_base ) AND  
													  ( "GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
													  ( "GESTION_COBRANZA"."NUMERO" = :ldb_numero ) AND  
													  ( "GESTION_COBRANZA"."FECHA_ASIGNACION" = (	SELECT 	  MAX("GESTION_COBRANZA"."FECHA_ASIGNACION") 
																														FROM 	  "GESTION_COBRANZA" 
																														WHERE 	( "GESTION_COBRANZA"."BASE" = :ls_base ) AND 
																																	( "GESTION_COBRANZA"."SERIE" = :ls_serie ) AND 
																																	( "GESTION_COBRANZA"."NUMERO" = :ldb_numero ) ) )   
											USING	sqlca;
											if sqlca.sqlcode = 0 then
												commit;
												UPDATE	"CLIENTE"
												SET 		"ESTADO_COBRANZA" = :ls_est_gest,
															"FECHA_COBRANZA"  = :ldt_fech_gest,
															"GLOSA_COBRANZA"  = :ls_glosa,
															"USUARIO_COB_TELE" = :ls_usuario_gest
														//	"PROX_LLAMADO_COB" = :ldt_fech_gest + 10
												WHERE 	"CLIENTE"."RUT" = :ll_rut
												USING 	sqlca;
												if sqlca.sqlcode = 0 then
													commit;
													ll_graba ++
												else
													rollback;
													messagebox("Error Grabar","Error Grabar Tabla CLIENTE SQL: "+sqlca.sqlerrtext)
												end if
											else
												rollback;
												messagebox("Error Grabar","Error Grabar Tabla GESTION_COBRANZA SQL: "+sqlca.sqlerrtext)
											end if	
										end if
									else
										rollback;
										messagebox("Error Grabar","Error Grabar Tabla TELE_LOG SQL: "+sqlca.sqlerrtext +' Linea '+string(ll_indi))
									end if
								elseif 	is_tipo_cobranza = 'T' then
									INSERT INTO 	"ATENCION_LOG"  
														( "RUT"  ,"ESTADO"  ,"FECHA"  ,		"GLOSA","USUARIO",		  "BASE"  ,"SERIE"  ,"NUMERO" )  
									VALUES 			( :ll_rut,:ls_est_gest,:ldt_fech_gest ,:ls_glosa,	:ls_usuario_gest,:ls_base,:ls_serie,:ldb_numero)  
									USING			sqlca;
									if sqlca.sqlcode=0 then
										commit;
//										if ldt_fec_ultima_gest<ldt_fech_gest then
//											UPDATE 	"AT_GESTION"  
//											SET 		"ESTADO_GESTION" = :ls_est_gest//,   
//														//"FECHA_PROX_VISITA" = :ldt_fech_gest
//											WHERE ( "AT_GESTION"."BASE" = :ls_base ) AND  
//													  ( "AT_GESTION"."SERIE" = :ls_serie ) AND  
//													  ( "AT_GESTION"."NUMERO" = :ldb_numero ) AND
//													  ( "AT_GESTION"."TIPO_COBRANZA" <> 'N' )
//											USING	sqlca;
//											if sqlca.sqlcode = 0 then
//												commit;
//												UPDATE	"CLIENTE"
//												SET 		"ESTADO_COBRANZA" = :ls_est_gest
//														//	"FECHA_COBRANZA"  = :ldt_fech_gest,
//														//	"GLOSA_COBRANZA"  = :ls_glosa,
//														//	"USUARIO_COB_TELE" = :ls_usuario_gest
//														//	"PROX_LLAMADO_COB" = :ldt_fech_gest + 10
//												WHERE 	"CLIENTE"."RUT" = :ll_rut
//												USING 	sqlca;
//												if sqlca.sqlcode = 0 then
//													commit;
												ll_graba ++
//												else
//													rollback;
//													messagebox("Error Grabar","Error Grabar Tabla CLIENTE SQL: "+sqlca.sqlerrtext)
//												end if
//											else
//												rollback;
//												messagebox("Error Grabar","Error Grabar Tabla AT_GESTION SQL: "+sqlca.sqlerrtext)
//											end if	
//										end if
									else
										rollback;
										messagebox("Error Grabar","Error Grabar Tabla ATENCION_LOG SQL: "+sqlca.sqlerrtext +' Linea '+string(ll_indi))
									end if
								end if	
							end if
						else
						end if
					next
					if ll_graba > 0 then
						messagebox('Aviso','Grabación Exitosa, Total Registros '+string(ll_graba))
						dw_lista.reset()
						dw_cargar.reset()
					end if
				else
					rollback;
				end if
			end if
		Setpointer(Arrow!)	
		else
			messagebox('Advertencia','Falta Seleccionar Usuario')
			dw_usuario.setfocus()
		end if
	end if	
else
	messagebox('Advertencia','Falta Cargar Archivo')
end if
end event

type cb_cerrar from commandbutton within w_carga_korbek
integer x = 2647
integer y = 1592
integer width = 256
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_carga_korbek)
end event

type cb_cargar from commandbutton within w_carga_korbek
integer x = 2514
integer y = 56
integer width = 384
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cargar Archivo"
end type

event clicked;integer value
long	ll_tot_reg,ll_indi,ll_pos,ll_rut,ll_new,ll_est_gestion
string	docname,ls_nom_arch,ls_id_reg,ls_base,ls_serie,ls_rut,ls_parque,ls_fono,ls_glosa,ls_user,ls_est_gest,ls_fecha_archivo,ls_dia,ls_mes,ls_anno,ls_usuario_gest,ls_est_gest_glosa
date	ld_fecha_archivo,ls_fecha_ges
datetime	ldt_fecha_crea
double	ldb_numero

dw_lista.reset()
dw_cargar.reset()
value 											= GetFileOpenName("Seleccione Archivo", docname, named, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
if value = 1 then
	SetPointer(HourGlass!)
	dw_lista.ImportFile(docname)
	if is_tipo_cobranza= 'P' then
		ls_usuario_gest							= dw_usuario.getitemstring(1,'usuario_asigando')
	elseif is_tipo_cobranza = 'T' then	
		ls_usuario_gest							= dw_usuario_terreno.getitemstring(1,'usuario_asigando')
	end if	
	if not isnull(ls_usuario_gest) and ls_usuario_gest <> '' then
		ls_nom_arch							= UPPER(named)
		dw_cargar.object.t_titulo.text		= 'Archivo '+ls_nom_arch
		dw_cargar.object.t_titulo2.text		= 'Ingreso Gestiones '+ls_usuario_gest
		SELECT	"LOG_SERVIPAG"."FECHA_CREA"
		INTO 		:ldt_fecha_crea
		FROM 	"LOG_SERVIPAG"
		WHERE 	"LOG_SERVIPAG"."NOMBRE_ARCHIVO" = :named
		USING	sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","No Es Posible Cargar Archivo "+named+" ya Fue Realizado Ejecutado el día "+string(ldt_fecha_crea,'dd/mm/yyyy hh:mm'))
			dw_lista.reset()
		else
			if is_tipo_cobranza= 'P' then
				ls_user						= dw_usuario.getitemstring(1,'usuario_asigando')
			elseif is_tipo_cobranza = 'T' then		
				ls_user						= dw_usuario_terreno.getitemstring(1,'usuario_asigando')
			end if	
			ll_tot_reg					= dw_lista.rowcount()
			for ll_indi=1 to ll_tot_reg
				if is_tipo_cobranza= 'P' then 
					ls_id_reg					= dw_lista.getitemstring(ll_indi,'id_registro') // revisar si se necesita
				else
					setnull(ls_id_reg);
				end if
				ls_base					= dw_lista.getitemstring(ll_indi,'base')
				ls_serie					= dw_lista.getitemstring(ll_indi,'serie')
				ldb_numero				= dw_lista.getitemnumber(ll_indi,'numero')
				ls_rut						= dw_lista.getitemstring(ll_indi,'rut')
				ll_pos						= POS(ls_rut,'-')
				if ll_pos > 0 then ll_pos = ll_pos - 1
				ll_rut                        = long(trim(mid(ls_rut,1,ll_pos)))
				ls_parque				= trim(dw_lista.getitemstring(ll_indi,'parque')) // revisar si se necesita
				if is_tipo_cobranza= 'P' then
					ls_fono					= dw_lista.getitemstring(ll_indi,'telefono_gestion') // revisar si se necesita
				else
					setnull(ls_fono);
				end if
				if is_tipo_cobranza= 'P' then
					ls_est_gest_glosa		= RightTrim(dw_lista.getitemstring(ll_indi,'estado_gc'))	// CODIFICAR
				elseif is_tipo_cobranza= 'T' then
					//ls_est_gest_glosa		= RightTrim(dw_lista.getitemstring(ll_indi,'estado_gc'))
					ll_est_gestion			=  (dw_lista.getitemnumber(ll_indi,'estado_gc'))
				end if
				
				if is_tipo_cobranza= 'P' then
					SELECT 	"ESTADO_COBRANZA_KORBEK"."COD_ESTADO"  
					INTO 		:ls_est_gest  
					FROM 	"ESTADO_COBRANZA_KORBEK"  
					WHERE 	"ESTADO_COBRANZA_KORBEK"."GLOSA_ESTADO" = :ls_est_gest_glosa
					USING	sqlca;
				elseif is_tipo_cobranza = 'T' then
//					SELECT	"ESTADO_ATENCION"."COD_ESATDO"  
//					INTO 		:ls_est_gest  
//					FROM 	"ESTADO_ATENCION"  
//					WHERE 	"ESTADO_ATENCION"."GLOSA_ESTADO" = :ls_est_gest_glosa
//					USING	sqlca;
					ls_est_gest	= string(ll_est_gestion)
				end if	
				if isnull(ls_est_gest) or ls_est_gest = '' then
					ls_est_gest	= '0'
				end if	
				ls_fecha_ges			= dw_lista.getitemdate(ll_indi,'fecha_gestion')
				ls_glosa					= dw_lista.getitemstring(ll_indi,'glosa') 
		//		ls_user					= dw_lista.getitemstring(ll_indi,'usuario')   // KORBEK
				if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ldb_numero) and ldb_numero > 0  and not isnull(ll_rut) and ll_rut > 0 then
					ll_new				= dw_cargar.insertrow(0)
					dw_cargar.scrolltorow(ll_new)
					dw_cargar.setitem(ll_new,'rut',ll_rut)
					dw_cargar.setitem(ll_new,'estado',ls_est_gest)
					dw_cargar.setitem(ll_new,'fecha',ls_fecha_ges)
					dw_cargar.setitem(ll_new,'glosa',ls_glosa)
					dw_cargar.setitem(ll_new,'usuario',ls_user)
					dw_cargar.setitem(ll_new,'base',ls_base)
					dw_cargar.setitem(ll_new,'serie',ls_serie)
					dw_cargar.setitem(ll_new,'numero',ldb_numero)
				else
					messagebox('Error Registro','Error al Cargar Registro Linea ' + string(ll_indi))
				end if
				SETNULL(ls_est_gest);
			next	
		end if
	else
		messagebox('Advertencia','Falta Seleccionar Usuario')
		dw_usuario.setfocus()
	end if	
	SetPointer(Arrow!)
end if
end event

type dw_lista from datawindow within w_carga_korbek
integer x = 2953
integer y = 32
integer width = 1563
integer height = 1292
string title = "none"
string dataobject = "dwe_carga_terreno_masivo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_carga_korbek
integer x = 27
integer y = 36
integer width = 905
integer height = 128
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_usuario_terreno from datawindow within w_carga_korbek
integer x = 983
integer y = 68
integer width = 905
integer height = 96
integer taborder = 40
string title = "none"
string dataobject = "dwe_usuario_asignado_terreno_masivo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_cargar.reset()
dw_lista.reset()
end event

type dw_usuario from datawindow within w_carga_korbek
integer x = 983
integer y = 68
integer width = 905
integer height = 100
integer taborder = 30
string title = "none"
string dataobject = "dwe_usuario_asignado"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_cargar.reset()
dw_lista.reset()
end event

