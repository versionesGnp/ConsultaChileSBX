forward
global type w_carga_equifax from window
end type
type cb_ordenar from commandbutton within w_carga_equifax
end type
type dw_gestiones_recupera from datawindow within w_carga_equifax
end type
type cb_1 from commandbutton within w_carga_equifax
end type
type tab_1 from tab within w_carga_equifax
end type
type tabpage_1 from userobject within tab_1
end type
type cb_filtrar from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type cb_recuperar_gestiones from commandbutton within tabpage_1
end type
type dw_carga_gestiones from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_filtrar cb_filtrar
cb_2 cb_2
cb_recuperar_gestiones cb_recuperar_gestiones
dw_carga_gestiones dw_carga_gestiones
end type
type tab_1 from tab within w_carga_equifax
tabpage_1 tabpage_1
end type
type dw_direcciones_recupera from datawindow within w_carga_equifax
end type
end forward

global type w_carga_equifax from window
integer width = 4878
integer height = 1920
boolean titlebar = true
string title = "Carga Archivos Equifax"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_ordenar cb_ordenar
dw_gestiones_recupera dw_gestiones_recupera
cb_1 cb_1
tab_1 tab_1
dw_direcciones_recupera dw_direcciones_recupera
end type
global w_carga_equifax w_carga_equifax

type variables
string named,is_tipo_cobranza,is_depto
long	il_row
end variables

on w_carga_equifax.create
this.cb_ordenar=create cb_ordenar
this.dw_gestiones_recupera=create dw_gestiones_recupera
this.cb_1=create cb_1
this.tab_1=create tab_1
this.dw_direcciones_recupera=create dw_direcciones_recupera
this.Control[]={this.cb_ordenar,&
this.dw_gestiones_recupera,&
this.cb_1,&
this.tab_1,&
this.dw_direcciones_recupera}
end on

on w_carga_equifax.destroy
destroy(this.cb_ordenar)
destroy(this.dw_gestiones_recupera)
destroy(this.cb_1)
destroy(this.tab_1)
destroy(this.dw_direcciones_recupera)
end on

event open;Date		ld_fecha,ld_fecha_proc,ld_fecha_inicial,ld_fecha_log
String		ls_dia
Long		ll_parque

gf_centrar(w_carga_equifax)

tab_1.tabpage_1.dw_carga_gestiones.settransobject(sqlca)
dw_gestiones_recupera.settransobject(sqlca)
//tab_1.tabpage_2.dw_carga_direcciones.settransobject(sqlca)
end event

type cb_ordenar from commandbutton within w_carga_equifax
event ue_mousemove pbm_dwnmousemove
integer x = 3753
integer y = 1704
integer width = 338
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_gestiones_recupera.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_gestiones_recupera.SETSORT(NULO)
	dw_gestiones_recupera.SORT()
end if
end event

type dw_gestiones_recupera from datawindow within w_carga_equifax
integer x = 3726
integer y = 96
integer width = 1070
integer height = 1544
integer taborder = 20
string title = "none"
string dataobject = "dwe_carga_gestiones_equifax"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_carga_equifax
integer x = 3191
integer y = 1704
integer width = 338
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_carga_equifax)
end event

type tab_1 from tab within w_carga_equifax
integer x = 46
integer y = 40
integer width = 3529
integer height = 1604
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3493
integer height = 1476
long backcolor = 67108864
string text = "Gestiones"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_filtrar cb_filtrar
cb_2 cb_2
cb_recuperar_gestiones cb_recuperar_gestiones
dw_carga_gestiones dw_carga_gestiones
end type

on tabpage_1.create
this.cb_filtrar=create cb_filtrar
this.cb_2=create cb_2
this.cb_recuperar_gestiones=create cb_recuperar_gestiones
this.dw_carga_gestiones=create dw_carga_gestiones
this.Control[]={this.cb_filtrar,&
this.cb_2,&
this.cb_recuperar_gestiones,&
this.dw_carga_gestiones}
end on

on tabpage_1.destroy
destroy(this.cb_filtrar)
destroy(this.cb_2)
destroy(this.cb_recuperar_gestiones)
destroy(this.dw_carga_gestiones)
end on

type cb_filtrar from commandbutton within tabpage_1
integer x = 1573
integer y = 1336
integer width = 343
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string ls_nulo
setnull(ls_nulo)
dw_carga_gestiones.setfilter(ls_nulo)
dw_carga_gestiones.filter()
end event

type cb_2 from commandbutton within tabpage_1
integer x = 3118
integer y = 1340
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string ls_base,ls_serie,ls_cod_accion,ls_cod_resultado,ls_usuario_gest,ls_glosa,ls_depto,ls_cod_depto,ls_cod_resultado_ant
long	ll_indi,ll_tot_reg,ll_count_reg,ll_max_corr,ll_rut,ll_graba
double	ll_numero
datetime	ld_fecha_gestion
datetime	ldt_fec_ultima_gest

ll_graba								= 0
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
	VALUES 	 ( :ll_max_corr,			:gdt_fec_sistema,			:gdt_fec_sistema,	:gs_user,					:named )
	USING		sqlca;
	if sqlca.sqlcode=0 then
		commit;
		ll_tot_reg	= dw_carga_gestiones.rowcount()
		for ll_indi =1 to ll_tot_reg
			ls_base				= dw_carga_gestiones.getitemstring(ll_indi,'base')
			ls_serie				= dw_carga_gestiones.getitemstring(ll_indi,'serie')
			ll_numero			= dw_carga_gestiones.getitemnumber(ll_indi,'numero')
			ls_cod_accion		= dw_carga_gestiones.getitemstring(ll_indi,'cod_accion')
			ls_cod_resultado	= dw_carga_gestiones.getitemstring(ll_indi,'tipo_gestion')
			ls_usuario_gest		= dw_carga_gestiones.getitemstring(ll_indi,'usuario_gestor')
			ld_fecha_gestion	= dw_carga_gestiones.getitemdatetime(ll_indi,'fecha_gestion')
			ls_glosa				= dw_carga_gestiones.getitemstring(ll_indi,'glosa')
			SELECT "ENCARGADOS"."DEPTO"  
			INTO 		:ls_depto  
			FROM 	"ENCARGADOS"  
			WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_gest   ;
			if ls_depto = 'E' then
				ls_cod_depto = 'TR'	
			else
				ls_cod_depto = 'CT'
			end if
			 
			if ls_cod_depto = 'CT' then
				SELECT 	  MAX("GESTION_COBRANZA"."FECHA_ASIGNACION") 
				INTO		:ldt_fec_ultima_gest
				FROM 	  "GESTION_COBRANZA" 
				WHERE 	( "GESTION_COBRANZA"."BASE" = :ls_base ) AND 
							( "GESTION_COBRANZA"."SERIE" = :ls_serie ) AND 
							( "GESTION_COBRANZA"."NUMERO" = :ll_numero )
				USING sqlca;
			elseif ls_cod_depto = 'TR' then
				SELECT 	  MAX("AT_GESTION"."FECHA_CREA") 
				INTO		:ldt_fec_ultima_gest
				FROM 	  "AT_GESTION" 
				WHERE 	( "AT_GESTION"."BASE" = :ls_base ) AND 
							( "AT_GESTION"."SERIE" = :ls_serie ) AND 
							( "AT_GESTION"."NUMERO" = :ll_numero )
				USING sqlca;
			end if
			SELECT 	"CADENA"."RUT"  
			INTO 		:ll_rut  
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
						( "CADENA"."SERIE" = :ls_serie ) AND  
						( "CADENA"."NUMERO" = :ll_numero )
			USING sqlca;
			
			if ld_fecha_gestion <> ldt_fec_ultima_gest then
				if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and ll_numero > 0 and ll_rut > 0  and not isnull(ls_glosa) and ls_glosa <> '' /*and not isnull(ls_cod_resultado) and ls_cod_resultado <> '' */ then //ls_glosa + ls_est_gest
					if ls_cod_depto = 'CT' then
						INSERT INTO 	"TELE_LOG"  
											( "RUT"  ,"ESTADO"  ,"FECHA"  ,		"GLOSA","USUARIO",		  "BASE"  ,"SERIE"  ,"NUMERO" )  
						VALUES 			( :ll_rut,:ls_cod_resultado,:ld_fecha_gestion ,:ls_glosa,	:ls_usuario_gest,:ls_base,:ls_serie,:ll_numero)  
						USING			sqlca;
						if sqlca.sqlcode=0 then
							commit;
							if ldt_fec_ultima_gest < ld_fecha_gestion then
								commit;
								UPDATE	"CLIENTE"
								SET 		"ESTADO_COBRANZA" = :ls_cod_resultado,
											"FECHA_COBRANZA"  = :ld_fecha_gestion,
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
									//messagebox("Error Grabar","Error Grabar Tabla CLIENTE SQL: "+sqlca.sqlerrtext)
								end if
								
							end if
						else
							rollback;
						//	messagebox("Error Grabar","Error Grabar Tabla TELE_LOG SQL: "+sqlca.sqlerrtext +' Linea '+string(ll_indi))
						end if
					elseif 	ls_cod_depto = 'TR' then
						INSERT INTO 	"ATENCION_LOG"  
											( "RUT"  ,"ESTADO"  ,"FECHA"  ,		"GLOSA","USUARIO",		  "BASE"  ,"SERIE"  ,"NUMERO" )  
						VALUES 			( :ll_rut,:ls_cod_resultado,:ld_fecha_gestion ,:ls_glosa,	:ls_usuario_gest,:ls_base,:ls_serie,:ll_numero)  
						USING			sqlca;
						if sqlca.sqlcode=0 then
							commit;
								UPDATE	"CLIENTE"
								SET 		"ESTADO_COBRANZA" = :ls_cod_resultado,
											"FECHA_COBRANZA"  = :ld_fecha_gestion,
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
								//	messagebox("Error Grabar","Error Grabar Tabla CLIENTE SQL: "+sqlca.sqlerrtext)
								end if
						else
							rollback;
						//	messagebox("Error Grabar","Error Grabar Tabla ATENCION_LOG SQL: "+sqlca.sqlerrtext +' Linea '+string(ll_indi))
						end if
					end if	
				end if
			else
			end if
		next
		messagebox("Aviso","Grabacion Exitosa, total de registros guardados : "+string(ll_graba))
		dw_carga_gestiones.reset()
	else
		rollback;
	end if
end if	
end event

type cb_recuperar_gestiones from commandbutton within tabpage_1
integer x = 23
integer y = 1336
integer width = 498
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Recupear Gestiones"
end type

event clicked;int value
long	ll_tot_reg,ll_indi,ll_pos,ll_rut,ll_new,ll_est_gestion,ll_parque,ll_pos_cobro,ll_secuencia
string	docname,ls_nom_arch,ls_base,ls_serie,ls_parque,ls_est_gest,ls_usuario_gest,ls_est_gest_glosa,ls_cuenta,ls_cuenta_aux,ls_tipo_cob_gest,&
		ls_cod_accion,ls_cod_result,ls_glosa,ls_cod_gnp,ls_cod_depto,ls_usu_valida,ls_base_ant,ls_serie_ant,ls_glosa_completa,ls_pasa = 'N',ls_cod_result_ant,ls_parque_glosa
datetime	ls_fecha_ges
datetime	ldt_fecha_crea,ld_fecha_gestion
double	ldb_numero,ll_numero,ll_numero_ant,ll_num

dw_carga_gestiones.reset()
dw_gestiones_recupera.dataobject							= 'dwe_carga_gestiones_equifax'
tab_1.tabpage_1.dw_carga_gestiones.settransobject(sqlca)
dw_gestiones_recupera.settransobject(sqlca)
value 												= GetFileOpenName("Seleccione Archivo", docname, named, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
if value = 1 then
	dw_gestiones_recupera.ImportFile(docname)
	ls_nom_arch							= UPPER(named)
	dw_gestiones_recupera.Sort()
	dw_gestiones_recupera.accepttext()
	SELECT	"LOG_SERVIPAG"."FECHA_CREA"
	INTO 		:ldt_fecha_crea
	FROM 	"LOG_SERVIPAG"
	WHERE 	"LOG_SERVIPAG"."NOMBRE_ARCHIVO" = :named
	USING	sqlca;
	if sqlca.sqlcode=0 then
		messagebox("Advertencia","No Es Posible Cargar Archivo "+named+" ya Fue Realizado Ejecutado el día "+string(ldt_fecha_crea,'dd/mm/yyyy hh:mm'))
		dw_gestiones_recupera.reset()
		tab_1.tabpage_1.dw_carga_gestiones.reset()
	else
		ll_tot_reg			= dw_gestiones_recupera.rowcount()
		for ll_indi = 1 to ll_tot_reg
			ls_cuenta			= dw_gestiones_recupera.getitemstring(ll_indi,'cuenta')
			ll_secuencia			= long(dw_gestiones_recupera.getitemstring(ll_indi,'numero_sequencia'))
			ls_base				= mid(ls_cuenta,1,1)
			if ls_base = '0' or ls_base = '1' or ls_base = '3' or ls_base = '4' or ls_base = '5' or ls_base = '6' or ls_base = '7' or ls_base = '8' or ls_base = '9' then
				ll_rut		= long(ls_cuenta)
				SELECT max("CADENA"."NUMERO")
				INTO 	 	:ll_num  
				FROM   	"CADENA"  
				WHERE 	"CADENA"."RUT" = :ll_rut
				USING	sqlca;
				if sqlca.sqlcode=0 then
					SELECT 	"CADENA"."CODIGO", "CADENA"."SERIE", "CADENA"."NUMERO","CADENA"."COD_PARQUE"  
					INTO 		:ls_base,:ls_serie,:ll_numero,:ll_parque  
					FROM 	"CADENA"  
					WHERE 	( "CADENA"."RUT" = :ll_rut ) AND  
								( "CADENA"."NUMERO" = :ll_num );				
				end if
				ls_tipo_cob_gest	= 'C'
			else	
				ls_serie				= mid(ls_cuenta,2,1)
				ls_cuenta_aux		= mid(ls_cuenta,3)
				ll_pos_cobro		= pos(ls_cuenta_aux,'C')
				if ll_pos_cobro = 0 then
					ll_pos_cobro	= pos(ls_cuenta_aux,'M')
					ls_tipo_cob_gest	= mid(ls_cuenta_aux,ll_pos_cobro,1)
					ll_numero			= long(left(ls_cuenta_aux,ll_pos_cobro + (-1)))
					ll_parque				= long(mid(ls_cuenta_aux,(ll_pos_cobro + 1)))
				else
					ls_tipo_cob_gest	= mid(ls_cuenta_aux,ll_pos_cobro,1)
					ll_numero			= long(left(ls_cuenta_aux,ll_pos_cobro + (-1)))
					ll_parque				= long(mid(ls_cuenta_aux,(ll_pos_cobro + 1)))
				end if
			end if
			if ll_parque = 11 then
				ls_parque_glosa	= 'La Foresta'
			elseif ll_parque = 104 then
				ls_parque_glosa	= 'Memorial Park'
			else
				ls_parque_glosa	= 'El Prado'					
			end if	
			if gs_empresa = ls_parque_glosa then
				if ll_secuencia > 1 then //ls_base = ls_base_ant and ls_serie = ls_serie_ant and ll_numero = ll_numero_ant and ls_cod_result_ant = ls_cod_result then 
					ls_glosa					= dw_gestiones_recupera.getitemstring(ll_indi,'comentario')
					ls_glosa_completa		= ls_glosa_completa + ls_glosa
					dw_carga_gestiones.setitem(ll_new,'glosa',ls_glosa_completa)
				else	
					setnull(ls_glosa_completa)
					ld_fecha_gestion	= dw_gestiones_recupera.getitemdatetime(ll_indi,'fecha_actividad')
					ls_cod_accion		= dw_gestiones_recupera.getitemstring(ll_indi,'codigo_accion')
					ls_cod_result		= dw_gestiones_recupera.getitemstring(ll_indi,'codigo_resultado')
					ls_usuario_gest		= UPPER(dw_gestiones_recupera.getitemstring(ll_indi,'gestor'))
					ls_glosa				= dw_gestiones_recupera.getitemstring(ll_indi,'comentario')
					if ls_cod_accion <> 'RA' then // RA error - basura no lo cargaremos		
						if gs_empresa = ls_parque_glosa then
							SELECT "ENCARGADOS"."DEPTO"  
							INTO 		:is_depto  
							FROM 	"ENCARGADOS"  
							WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_gest   ;
							if is_depto = 'E' then
								ls_cod_depto = 'TR'	
							else
								ls_cod_depto = 'CT'
							end if
							if ls_cod_accion <> 'CM' then
								if ls_cod_result	= '-' then
									ls_pasa = 'N'
								else
									ls_pasa = 'S'
								end if	
								SELECT DISTINCT	"CYBER_CODIGOS_GESTION"."CODIGO_GNP"
								INTO 		:ls_cod_gnp
								FROM 	"CYBER_CODIGOS_GESTION"  
								WHERE 	"CYBER_CODIGOS_GESTION"."CODIGO_ACCION" = :ls_cod_accion and
											"CYBER_CODIGOS_GESTION"."CODIGO_RESULTADO" = :ls_cod_result and
											"CYBER_CODIGOS_GESTION"."CODIGO_DEPTO" = :ls_cod_depto  ;
							else
								SELECT DISTINCT "CYBER_CODIGOS_GESTION"."CODIGO_GNP"
								INTO 		:ls_cod_gnp
								FROM 	"CYBER_CODIGOS_GESTION"  
								WHERE 	"CYBER_CODIGOS_GESTION"."CODIGO_ACCION" = :ls_cod_accion AND
											"CYBER_CODIGOS_GESTION"."CODIGO_DEPTO" = :ls_cod_depto  ;						
							end if				
						end if	
						if ls_pasa = 'S' then
							ll_new				= dw_carga_gestiones.insertrow(0)
							dw_carga_gestiones.setitem(ll_new,'base',ls_base)
							dw_carga_gestiones.setitem(ll_new,'serie',ls_serie)
							dw_carga_gestiones.setitem(ll_new,'numero',ll_numero)
							dw_carga_gestiones.setitem(ll_new,'parque',ll_parque)
							dw_carga_gestiones.setitem(ll_new,'cod_accion',ls_cod_accion)
							dw_carga_gestiones.setitem(ll_new,'tipo_gestion',ls_cod_gnp)
							dw_carga_gestiones.setitem(ll_new,'usuario_gestor',ls_usuario_gest)
							dw_carga_gestiones.setitem(ll_new,'fecha_gestion',ld_fecha_gestion)
							dw_carga_gestiones.setitem(ll_new,'glosa',ls_glosa)
							ls_glosa_completa		= ls_glosa
						end if	
						setnull(ls_base);setnull(ls_serie);setnull(ll_numero);setnull(ll_parque); setnull(ls_cod_depto);setnull(ls_cod_gnp);setnull(ls_usuario_gest);setnull(ld_fecha_gestion);setnull(ll_rut);
						setnull(ls_tipo_cob_gest);setnull(ls_pasa);
					end if
				end if	
			end if	
		next
	end if	
end if	
end event

type dw_carga_gestiones from datawindow within tabpage_1
integer x = 5
integer y = 40
integer width = 3474
integer height = 1264
integer taborder = 20
string title = "none"
string dataobject = "dwe_carga_equifax"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_direcciones_recupera from datawindow within w_carga_equifax
integer x = 3735
integer y = 644
integer width = 686
integer height = 400
integer taborder = 40
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

