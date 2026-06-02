forward
global type w_informar_titulo_de_dominio from window
end type
type mdi_1 from mdiclient within w_informar_titulo_de_dominio
end type
type mditbb_1 from tabbedbar within w_informar_titulo_de_dominio
end type
type mdirbb_1 from ribbonbar within w_informar_titulo_de_dominio
end type
type em_ot from editmask within w_informar_titulo_de_dominio
end type
type st_ot from statictext within w_informar_titulo_de_dominio
end type
type dw_exp_archivo from datawindow within w_informar_titulo_de_dominio
end type
type cb_exp_mecanizado from commandbutton within w_informar_titulo_de_dominio
end type
type cb_actualiza_fila from commandbutton within w_informar_titulo_de_dominio
end type
type cb_actualiza_todo from commandbutton within w_informar_titulo_de_dominio
end type
type cb_filtrar from commandbutton within w_informar_titulo_de_dominio
end type
type cb_elimina from commandbutton within w_informar_titulo_de_dominio
end type
type dw_exp_etiqueta from datawindow within w_informar_titulo_de_dominio
end type
type dw_exp_libro from datawindow within w_informar_titulo_de_dominio
end type
type cb_exportar_etiqueta from commandbutton within w_informar_titulo_de_dominio
end type
type cb_exportar_libro_reg from commandbutton within w_informar_titulo_de_dominio
end type
type cb_print_titulo_dominio from commandbutton within w_informar_titulo_de_dominio
end type
type dw_print_carta from datawindow within w_informar_titulo_de_dominio
end type
type cb_print_carta_aviso from commandbutton within w_informar_titulo_de_dominio
end type
type cb_print_ccto_def from commandbutton within w_informar_titulo_de_dominio
end type
type rb_ambas from radiobutton within w_informar_titulo_de_dominio
end type
type rb_contrato_definitivo from radiobutton within w_informar_titulo_de_dominio
end type
type rb_titulo_dominio from radiobutton within w_informar_titulo_de_dominio
end type
type dw_print_ctto_def from datawindow within w_informar_titulo_de_dominio
end type
type em_rola from editmask within w_informar_titulo_de_dominio
end type
type st_5 from statictext within w_informar_titulo_de_dominio
end type
type sle_1 from uo_convierte_numero within w_informar_titulo_de_dominio
end type
type cb_ctacte from commandbutton within w_informar_titulo_de_dominio
end type
type st_6 from statictext within w_informar_titulo_de_dominio
end type
type em_foja from editmask within w_informar_titulo_de_dominio
end type
type em_libro from editmask within w_informar_titulo_de_dominio
end type
type st_4 from statictext within w_informar_titulo_de_dominio
end type
type st_3 from statictext within w_informar_titulo_de_dominio
end type
type em_correlativo from editmask within w_informar_titulo_de_dominio
end type
type st_1 from statictext within w_informar_titulo_de_dominio
end type
type cb_cerrar from commandbutton within w_informar_titulo_de_dominio
end type
type pb_aceptar from picturebutton within w_informar_titulo_de_dominio
end type
type p_ini from picture within w_informar_titulo_de_dominio
end type
type em_fec_ini from editmask within w_informar_titulo_de_dominio
end type
type st_2 from statictext within w_informar_titulo_de_dominio
end type
type cb_ordenar from commandbutton within w_informar_titulo_de_dominio
end type
type cb_exportar from commandbutton within w_informar_titulo_de_dominio
end type
type cb_imprimir from commandbutton within w_informar_titulo_de_dominio
end type
type dw_print_titulo from datawindow within w_informar_titulo_de_dominio
end type
type dw_lista from datawindow within w_informar_titulo_de_dominio
end type
type gb_2 from groupbox within w_informar_titulo_de_dominio
end type
type dw_parque from datawindow within w_informar_titulo_de_dominio
end type
end forward

global type w_informar_titulo_de_dominio from window
integer width = 3675
integer height = 2284
boolean titlebar = true
string title = "Titulo de Dominio"
string menuname = "m_menu_popup_titulo_ctto_def"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = mdihelp!
long backcolor = 67108864
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
em_ot em_ot
st_ot st_ot
dw_exp_archivo dw_exp_archivo
cb_exp_mecanizado cb_exp_mecanizado
cb_actualiza_fila cb_actualiza_fila
cb_actualiza_todo cb_actualiza_todo
cb_filtrar cb_filtrar
cb_elimina cb_elimina
dw_exp_etiqueta dw_exp_etiqueta
dw_exp_libro dw_exp_libro
cb_exportar_etiqueta cb_exportar_etiqueta
cb_exportar_libro_reg cb_exportar_libro_reg
cb_print_titulo_dominio cb_print_titulo_dominio
dw_print_carta dw_print_carta
cb_print_carta_aviso cb_print_carta_aviso
cb_print_ccto_def cb_print_ccto_def
rb_ambas rb_ambas
rb_contrato_definitivo rb_contrato_definitivo
rb_titulo_dominio rb_titulo_dominio
dw_print_ctto_def dw_print_ctto_def
em_rola em_rola
st_5 st_5
sle_1 sle_1
cb_ctacte cb_ctacte
st_6 st_6
em_foja em_foja
em_libro em_libro
st_4 st_4
st_3 st_3
em_correlativo em_correlativo
st_1 st_1
cb_cerrar cb_cerrar
pb_aceptar pb_aceptar
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
dw_print_titulo dw_print_titulo
dw_lista dw_lista
gb_2 gb_2
dw_parque dw_parque
end type
global w_informar_titulo_de_dominio w_informar_titulo_de_dominio

type variables
Long		il_row
String	is_filtro=''

end variables

forward prototypes
public function string wf_fecha_palabra (date ad_fecha)
public subroutine wf_imprimir_contrato_definitivo ()
public subroutine wf_imprimir_carta_aviso ()
public subroutine wf_imprimir_etiquetas ()
public subroutine wf_imprimir_libro ()
public subroutine wf_imprimir_titulo_de_dominio ()
public subroutine wf_actualizar (string as_base, string as_serie, double al_numero, long al_correlativo, long al_fila, long al_total_filas)
end prototypes

public function string wf_fecha_palabra (date ad_fecha);string	ls_fec_comp,ls_fecha
Long		ll_dia_fec,ll_mes_fec,ll_anno_fec
ls_fecha							= string(ad_fecha,"dd/mm/yyyy")
CHOOSE CASE UPPER(DayName(date(ls_fecha)))
	CASE 'LUNES','MONDAY'
		ls_fec_comp				= 'Lunes'
	CASE 'MARTES','TUESDAY'
		ls_fec_comp				= 'Martes'
	CASE 'MIERCOLES','WEDNESDAY'
		ls_fec_comp				= 'Miércoles'
	CASE 'JUEVES','THURSDAY'
		ls_fec_comp				= 'Jueves'
	CASE 'VIERNES','FRIDAY'
		ls_fec_comp				= 'Viernes'
	CASE 'SABADO','SATURDAY'
		ls_fec_comp				= 'Sábado'
	CASE 'DOMINGO','SUNDAY'
		ls_fec_comp				= 'Domingo'
END CHOOSE
ll_dia_fec						= day(ad_fecha)
ll_mes_fec						= month(ad_fecha)
ll_anno_fec						= year(ad_fecha)
if ll_mes_fec=1 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Enero de '+string(ll_anno_fec)
elseif ll_mes_fec=2 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Febrero de '+string(ll_anno_fec)
elseif ll_mes_fec=3 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Marzo de '+string(ll_anno_fec)
elseif ll_mes_fec=4 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Abril de '+string(ll_anno_fec)
elseif ll_mes_fec=5 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Mayo de '+string(ll_anno_fec)
elseif ll_mes_fec=6 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Junio de '+string(ll_anno_fec)
elseif ll_mes_fec=7 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Julio de '+string(ll_anno_fec)
elseif ll_mes_fec=8 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Agosto de '+string(ll_anno_fec)
elseif ll_mes_fec=9 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Septiembre de '+string(ll_anno_fec)
elseif ll_mes_fec=10 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Octubre de '+string(ll_anno_fec)
elseif ll_mes_fec=11 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Noviembre de '+string(ll_anno_fec)
elseif ll_mes_fec=12 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Diciembre de '+string(ll_anno_fec)
end if
Return ls_fec_comp
end function

public subroutine wf_imprimir_contrato_definitivo ();Long		ll_resp,ll_tot_reg,ll_indi,ll_cod_accion,ll_correlativo,ll_rut,ll_count_reg
String		ls_estado,ls_clasificacion,ls_estado_envio,ls_base,ls_serie,ls_glosa
Datetime	ldt_fecha
Date		ldt_fecha_hoy
Double	ll_int,ll_numero

//f_printdlg(dw_print_ctto_def,gstr_print,w_informar_titulo_de_dominio)
f_Print( dw_print_ctto_def )
ll_resp							= messagebox("Advertencia","Se Imprimió correctamente Contrato Definitivo",Exclamation!,YesNo!,2)
if ll_resp=1 then
	ldt_fecha_hoy				= date(gdt_fec_sistema)
	ll_tot_reg					= dw_lista.rowcount()
	if ll_tot_reg>0 then
		if rb_titulo_dominio.checked=true then
			ls_estado			= 'G_T1'
			ls_clasificacion	= 'T1'
			ll_cod_accion		= 8
			ls_estado_envio	= '0'
		elseif rb_contrato_definitivo.checked=true then
			ls_estado			= 'G_D1'
			ls_clasificacion	= 'D1'
			ll_cod_accion		= 8
			ls_estado_envio	= '0'
		elseif rb_ambas.checked=true then
			ls_estado			= 'G_TD'
			ls_clasificacion	= 'TD'
			ll_cod_accion		= 8
			ls_estado_envio	= '0'
		end if
		SELECT	MAX("CARTA_LOG"."CORRELATIVO")  
		INTO 		:ll_correlativo  
		FROM 		"CARTA_LOG"  
		USING		sqlca;
		if isnull(ll_correlativo) then ll_correlativo=0
		SELECT 	"TASA"."TASA_INT_P"  ,	sysdate
		INTO 		:ll_int,						:ldt_fecha
		FROM 		"TASA"  ;
		
		for ll_indi=1 to ll_tot_reg
			ls_base				= dw_lista.getitemstring(ll_indi,'base')
			ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
			ll_rut					= dw_lista.getitemnumber(ll_indi,'rut')
			ls_glosa				= 'Impresión Contrato Definitivo Contrato Nº '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' el día '+string(ldt_fecha_hoy)
			SELECT	Count("CARTA_LOG"."NUMERO")  
			INTO 		:ll_count_reg  
			FROM 		"CARTA_LOG"  
			WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
					 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
					 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
					 ( "CARTA_LOG"."COD_ACCION" = :ll_cod_accion ) AND  
					 ( TO_DATE(SUBSTR(TO_CHAR("CARTA_LOG"."FECHA_CARTA",'dd/mm/yyyy'),1,10)) = :ldt_fecha_hoy )   
			USING		trans_2;
			if ll_count_reg=0 or isnull(ll_count_reg) then
				dw_lista.setitem(ll_indi,'estado_print_ctto_def',ls_estado)
				dw_lista.setitem(ll_indi,'fecha_estado_print_ctto_def',ldt_fecha_hoy)
				ll_correlativo ++
				INSERT INTO "CARTA_LOG"  
							( "BASE",	"SERIE",		"NUMERO",		"RUT",	"COD_ENVIO",	"ESTADO_ENV",		"FECHA_CARTA",	"MORA",	"COD_ACCION",		"CORRELATIVO",		"MORA_MANT",	"CLASIFICACION",		"USUARIO" )  
				VALUES 	( :ls_base,	:ls_serie,	:ll_numero,		:ll_rut,	:ls_base,   	:ls_estado_envio,	:ldt_fecha,   	0,			:ll_cod_accion,	:ll_correlativo,  0,  				:ls_clasificacion,   :gs_user )  
				USING		trans_1;
				if trans_1.sqlcode=0 then
					commit using trans_1;
					INSERT INTO	"ATENCION_LOG"  
								( "RUT",		"ESTADO",   "FECHA",		"GLOSA",		"USUARIO",		"BASE",		"SERIE",		"NUMERO" )  
					VALUES 	( :ll_rut,	'14',			:ldt_fecha,	:ls_glosa,	:gs_user,		:ls_base,	:ls_serie,	:ll_numero )  
					USING		trans_2;
					if trans_2.sqlcode=0 then
						commit using trans_2;
						UPDATE 	"CLIENTE"  
						SET 		"ULT_ESTADO_PUB" = '14',   
									"ULT_GLOSA_PUB" = :ls_glosa,   
									"ULT_FECHA_PUB" = :ldt_fecha_hoy  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						USING		trans_2;
						if trans_2.sqlcode=0 then
							commit using trans_2;
						else
							rollback using trans_2;
							messagebox("Error Grabar","Error al Grabar SQL: "+trans_2.sqlerrtext)
						end if
					else
						rollback using trans_2;
						messagebox("Error Grabar","Error al Grabar SQL: "+trans_2.sqlerrtext)
					end if
				else
					rollback using trans_1;
					messagebox("Error Grabar","Error al Grabar SQL: "+trans_1.sqlerrtext)
				end if
			end if
		next
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit using sqlca;
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if		
	end if
end if
end subroutine

public subroutine wf_imprimir_carta_aviso ();Long		ll_resp,ll_tot_reg,ll_indi,ll_cod_accion,ll_count_reg,ll_rut,ll_correlativo
String		ls_estado,ls_base,ls_serie,ls_estado_envio,ls_clasificacion
datetime	ldt_fecha
Double	ll_int,ll_numero
Date		ldt_fecha_hoy

f_Print( dw_print_carta )
ll_resp							= messagebox("Advertencia","Se Imprimió correctamente Carta de Aviso",Exclamation!,YesNo!,2)
if ll_resp=1 then
	ldt_fecha_hoy				= date(gdt_fec_sistema)
	ll_tot_reg					= dw_lista.rowcount()
	if ll_tot_reg>0 then
		if rb_titulo_dominio.checked=true then
			ls_estado			= 'G_T1'
			ls_clasificacion		= 'T1'
			ll_cod_accion		= 13
			ls_estado_envio	= '0'
		elseif rb_contrato_definitivo.checked=true then
			ls_estado			= 'G_D1'
			ls_clasificacion		= 'D1'
			ll_cod_accion		= 14
			ls_estado_envio	= '0'
		elseif rb_ambas.checked=true then
			ls_estado			= 'G_TD'
			ls_clasificacion		= 'TD'
			ll_cod_accion		= 15
			ls_estado_envio	= '0'
		end if
		SELECT	MAX("CARTA_LOG"."CORRELATIVO")  
		INTO 		:ll_correlativo  
		FROM 		"CARTA_LOG"  
		USING		sqlca;
		if isnull(ll_correlativo) then ll_correlativo=0
		SELECT 	"TASA"."TASA_INT_P"  ,	sysdate
		INTO 		:ll_int,						:ldt_fecha
		FROM 		"TASA"  ;
		
		for ll_indi=1 to ll_tot_reg
			ls_base				= dw_lista.getitemstring(ll_indi,'base')
			ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
			ll_rut					= dw_lista.getitemnumber(ll_indi,'rut')
			SELECT	Count("CARTA_LOG"."NUMERO")  
			INTO 		:ll_count_reg  
			FROM 		"CARTA_LOG"  
			WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
					 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
					 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
					 ( "CARTA_LOG"."COD_ACCION" = :ll_cod_accion ) AND  
					 ( TO_DATE(SUBSTR(TO_CHAR("CARTA_LOG"."FECHA_CARTA",'dd/mm/yyyy'),1,10)) = :ldt_fecha_hoy )   
			USING		trans_2;
			if ll_count_reg=0 or isnull(ll_count_reg) then
				dw_lista.setitem(ll_indi,'estado_aviso_titulo',ls_estado)
				dw_lista.setitem(ll_indi,'fecha_estado_aviso_titulo',ldt_fecha_hoy)
				ll_correlativo ++
				INSERT INTO "CARTA_LOG"  
							( "BASE",	"SERIE",		"NUMERO",		"RUT",	"COD_ENVIO",	"ESTADO_ENV",		"FECHA_CARTA",	"MORA",	"COD_ACCION",		"CORRELATIVO",		"MORA_MANT",	"CLASIFICACION",		"USUARIO" )  
				VALUES 	( :ls_base,	:ls_serie,	:ll_numero,		:ll_rut,	:ls_base,   	:ls_estado_envio,	:ldt_fecha,   	0,			:ll_cod_accion,	:ll_correlativo,  0,  				:ls_clasificacion,   :gs_user )  
				USING		trans_1;
				if trans_1.sqlcode=0 then
					commit using trans_1;
				else
					rollback using trans_1;
					messagebox("Error Grabar","Error al Grabar SQL: "+trans_1.sqlerrtext)
				end if
			end if
		next
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit using sqlca;
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end subroutine

public subroutine wf_imprimir_etiquetas ();Long		ll_resp,ll_tot_reg,ll_indi
String	ls_estado
Date		ldt_fecha_hoy

ldt_fecha_hoy			= date(gdt_fec_sistema)
f_Print( dw_exp_etiqueta )
ll_resp	= messagebox("Advertencia","Se Imprimió correctamente Etiquetas",Exclamation!,YesNo!,2)
if ll_resp=1 then
	ll_tot_reg	= dw_lista.rowcount()
	if ll_tot_reg>0 then
		if rb_titulo_dominio.checked=true then
			ls_estado	= 'G_T1'
		elseif rb_contrato_definitivo.checked=true then
			ls_estado	= 'G_D1'
		elseif rb_ambas.checked=true then
			ls_estado	= 'G_TD'
		end if
		for ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,'estado_print_etiqueta',ls_estado)
			dw_lista.setitem(ll_indi,'fecha_estado_print_etiqueta',ldt_fecha_hoy)
		next
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end subroutine

public subroutine wf_imprimir_libro ();Long		ll_tot_reg,ll_indi,ll_resp
String	ls_estado
Date		ldt_fecha_hoy

ll_resp						= messagebox("Advertencia","Se Imprimió correctamente Libro de Registro",Exclamation!,YesNo!,2)
if ll_resp=1 then
	ll_tot_reg				= dw_lista.rowcount()
	if rb_titulo_dominio.checked=true then
		ls_estado			= 'G_T1'
	elseif rb_contrato_definitivo.checked=true then
		ls_estado			= 'G_D1'
	elseif rb_ambas.checked=true then
		ls_estado			= 'G_TD'
	end if
	ldt_fecha_hoy				= date(gdt_fec_sistema)
	for ll_indi=1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'estado_genera_libro',ls_estado)
		dw_lista.setitem(ll_indi,'fecha_estado_genera_libro',ldt_fecha_hoy)
	next
	dw_lista.accepttext()
	if dw_lista.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
end if
end subroutine

public subroutine wf_imprimir_titulo_de_dominio ();Long		ll_resp,ll_tot_reg,ll_indi,ll_cod_accion,ll_correlativo,ll_rut,ll_count_reg
String	ls_estado,ls_clasificacion,ls_estado_envio,ls_base,ls_serie,ls_glosa
datetime	ldt_fecha
Date		ldt_fecha_hoy
Double	ll_int,ll_numero

f_Print( dw_print_titulo )
ll_resp							= messagebox("Advertencia","Se Imprimió correctamente Título Dominio",Exclamation!,YesNo!,2)
if ll_resp=1 then
	ldt_fecha_hoy				= date(gdt_fec_sistema)
	ll_tot_reg					= dw_lista.rowcount()
	if ll_tot_reg>0 then
		if rb_titulo_dominio.checked=true then
			ls_estado			= 'G_T1'
			ls_clasificacion	= 'T1'
			ll_cod_accion		= 16
			ls_estado_envio	= '0'
		elseif rb_contrato_definitivo.checked=true then
			ls_estado			= 'G_D1'
			ls_clasificacion	= 'D1'
			ll_cod_accion		= 16
			ls_estado_envio	= '0'
		elseif rb_ambas.checked=true then
			ls_estado			= 'G_TD'
			ls_clasificacion	= 'TD'
			ll_cod_accion		= 16
			ls_estado_envio	= '0'
		end if
		SELECT	MAX("CARTA_LOG"."CORRELATIVO")  
		INTO 		:ll_correlativo  
		FROM 		"CARTA_LOG"  
		USING		sqlca;
		if isnull(ll_correlativo) then ll_correlativo=0
		SELECT 	"TASA"."TASA_INT_P"  ,	sysdate
		INTO 		:ll_int,						:ldt_fecha
		FROM 		"TASA"  ;
		
		for ll_indi=1 to ll_tot_reg
			ls_base				= dw_lista.getitemstring(ll_indi,'base')
			ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
			ll_rut					= dw_lista.getitemnumber(ll_indi,'rut')
			ls_glosa				= dw_lista.getitemstring(ll_indi,'glosa')
			SELECT	Count("CARTA_LOG"."NUMERO")  
			INTO 		:ll_count_reg  
			FROM 		"CARTA_LOG"  
			WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
					 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
					 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
					 ( "CARTA_LOG"."COD_ACCION" = :ll_cod_accion ) AND  
					 ( TO_DATE(SUBSTR(TO_CHAR("CARTA_LOG"."FECHA_CARTA",'dd/mm/yyyy'),1,10)) = :ldt_fecha_hoy )   
			USING		trans_2;
			if ll_count_reg=0 or isnull(ll_count_reg) then
				dw_lista.setitem(ll_indi,'estado_print_titulo',ls_estado)
				dw_lista.setitem(ll_indi,'fecha_estado_print_titulo',ldt_fecha_hoy)
				ll_correlativo ++
				INSERT INTO "CARTA_LOG"  
							( "BASE",	"SERIE",		"NUMERO",		"RUT",	"COD_ENVIO",	"ESTADO_ENV",		"FECHA_CARTA",	"MORA",	"COD_ACCION",		"CORRELATIVO",		"MORA_MANT",	"CLASIFICACION",		"USUARIO" )  
				VALUES 	( :ls_base,	:ls_serie,	:ll_numero,		:ll_rut,	:ls_base,   	:ls_estado_envio,	:ldt_fecha,   	0,			:ll_cod_accion,	:ll_correlativo,  0,  				:ls_clasificacion,   :gs_user )  
				USING		trans_1;
				if trans_1.sqlcode=0 then
					commit using trans_1;
					UPDATE	"CADENA"  
					SET 		"ESTADO_TITULO" = 'I',   
								"FECHA_TITULO" = :ldt_fecha_hoy  
					WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :ll_numero )   
					USING		trans_2;
					if trans_2.sqlcode=0 then
						commit using trans_2;
					else
						rollback using trans_2;
						messagebox("Error Grabar","Error al Grabar CADENA SQL: "+trans_2.sqlerrtext)
					end if
					INSERT INTO	"ATENCION_LOG"  
								( "RUT",		"ESTADO",   "FECHA",		"GLOSA",		"USUARIO",		"BASE",		"SERIE",		"NUMERO" )  
					VALUES 	( :ll_rut,	'13',			:ldt_fecha,	:ls_glosa,	:gs_user,		:ls_base,	:ls_serie,	:ll_numero )  
					USING		trans_2;
					if trans_2.sqlcode=0 then
						commit using trans_2;
						UPDATE 	"CLIENTE"  
						SET 		"ULT_ESTADO_PUB" = '13',   
									"ULT_GLOSA_PUB" = :ls_glosa,   
									"ULT_FECHA_PUB" = :ldt_fecha_hoy  
						WHERE 	"CLIENTE"."RUT" = :ll_rut   
						USING		trans_2;
						if trans_2.sqlcode=0 then
							commit using trans_2;
						else
							rollback using trans_2;
							messagebox("Error Grabar","Error al Grabar CLIENTE SQL: "+trans_2.sqlerrtext)
						end if
					else
						rollback using trans_2;
						messagebox("Error Grabar","Error al Grabar ATENCION_LOG SQL: "+trans_2.sqlerrtext)
					end if
				else
					rollback using trans_1;
					messagebox("Error Grabar","Error al Grabar CARTA_LOG SQL: "+trans_1.sqlerrtext)
				end if
			end if
		next
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit using sqlca;
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error al Grabar LISTA SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end subroutine

public subroutine wf_actualizar (string as_base, string as_serie, double al_numero, long al_correlativo, long al_fila, long al_total_filas);String	LS_ESTADO,LS_DV,LS_NOMBRE,LS_A_PATERNO,LS_A_MATERNO,LS_DIRECCION_P,LS_POBLACION,&
			LS_COD_CIUDAD,LS_CIUDAD,LS_COD_COMUNA,LS_COMUNA,LS_SEXO,LS_TIPO_VENTA,LS_TIPO_CONS,&
			LS_AREA,LS_SECTOR,LS_SEPULTURA,LS_NUMERO_PARTICULAR,LS_DEPTO_PARTICULAR,LS_BLOCK_PARTICULAR,&
			LS_ESTA_CIVIL,LS_USO,ls_trato,ls_nombre_comp,ls_dv_cli,ls_nom,ls_pat,ls_mat,ls_dir_p,ls_num_p,&
			ls_depto_p,ls_block_p,s_ciudad,ls_pob,ls_estado_civil,ls_via_descrip
Long		LL_FALLECIDOS,LL_RUT,LL_TOT_PAGADO,LL_NRO_CUOTAS,LL_CTA_PAG_S,	LL_CAPACIDAD,LL_COD_PARQUE,ll_rut_cli
Datetime	LDT_FECHA,LDT_FECHA_ENTRE,LDT_FECHA_MANT

if as_base='C' then
	SELECT	"CONTRATO"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."POBLACION",	"CLIENTE"."ESTA_CIVIL",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."SEXO"
	INTO 		:ll_rut_cli,		:ls_dv_cli,			:ls_nom,					:ls_pat,						:ls_mat,						:ls_dir_p,						:ls_num_p,								:ls_depto_p,						:ls_block_p,						:ls_comuna,				:ls_ciudad,				:ls_pob,						:ls_estado_civil,			:ls_via_descrip,				:ls_sexo
	FROM		"CLIENTE",	"CONTRATO",	"TIPO_VIA"  
	WHERE  ( "CLIENTE"."RUT" = "CONTRATO"."RUT" ) and  
			 ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
			 (("CONTRATO"."SERIE_C" = :as_serie ) AND  
			 ( "CONTRATO"."NRO_CONTRATO" = :al_numero ) )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if ls_sexo='F' then
			ls_trato		= 'Doña'
		else
			ls_trato		= 'Don'
		end if
		if isnull(ls_mat) then ls_mat = ''
		if isnull(ls_pat) then ls_pat = ''
		ls_nombre_comp	= ls_nom+' '+ls_pat+' '+ls_mat
		
		UPDATE	"PROCESO_TITULO_ISACRUZ"  
		SET 		"RUT" = :ll_rut_cli,   
					"DV" = :ls_dv_cli,   
					"TRATO" = :ls_trato,   
					"NOMBRE_CLIENTE" = :ls_nombre_comp,   
					"DIRECCION_P" = :ls_dir_p,   
					"NRO_PARTICULAR" = :ls_num_p,   
					"DEPTO_PARTICULAR" = :ls_depto_p,   
					"BLOCK_PARTICULAR" = :ls_block_p,   
					"COMUNA" = :ls_comuna,   
					"CIUDAD" = :ls_ciudad,   
					"POBLACION" = :ls_pob,   
					"ESTADO_CIVIL" = :ls_estado_civil,   
					"TIPO_VIA" = :ls_via_descrip  
		WHERE  ( "PROCESO_TITULO_ISACRUZ"."BASE" = :as_base ) AND  
				 ( "PROCESO_TITULO_ISACRUZ"."SERIE" = :as_serie ) AND  
				 ( "PROCESO_TITULO_ISACRUZ"."NUMERO" = :al_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if

	SELECT	"CADENA"."ESTADO",   "CADENA_MORA"."FALLECIDOS",   "CLIENTE"."RUT",  "CLIENTE"."DV",   "CLIENTE"."NOMBRE",  "CLIENTE"."A_PATERNO",  "CLIENTE"."A_MATERNO",  "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",  "CLIENTE"."CIUDAD",  "CIUDAD"."CIUDAD",   "CLIENTE"."COMUNA",  "COMUNA"."COMUNA",   "CLIENTE"."SEXO", "CONTRATO"."TOT_PAGADO",   "CONTRATO"."FECHA",  "CONTRATO"."PLAZO",  "CONTRATO"."CTA_PAG_ISA" + "CONTRATO"."CTA_PAG_LA",   '',				'T',				"CONTRATO"."ZONA",   "CONTRATO"."SECTOR", "CONTRATO"."SEPULTURA", "CONTRATO"."CAPACIDAD", "CLIENTE"."NUMERO_PARTICULAR",   "CLIENTE"."DEPTO_PARTICULAR", "CLIENTE"."BLOCK_PARTICULAR", "CLIENTE"."ESTA_CIVIL",	'',		null,					"CADENA"."COD_PARQUE",	"CONTRATO"."FECHA_M"
	INTO		:LS_ESTADO,   			:LL_FALLECIDOS,					:LL_RUT,				:LS_DV,   			:LS_NOMBRE,   			:LS_A_PATERNO,   			:LS_A_MATERNO,   			:LS_DIRECCION_P,   			:LS_POBLACION,   			:LS_COD_CIUDAD,   	:LS_CIUDAD,   			:LS_COD_COMUNA,   	:LS_COMUNA,   			:LS_SEXO,			:LL_TOT_PAGADO,   			:LDT_FECHA,				:LL_NRO_CUOTAS,		:LL_CTA_PAG_S,														:LS_TIPO_VENTA,:LS_TIPO_CONS,	:LS_AREA,				:LS_SECTOR,				:LS_SEPULTURA,				:LL_CAPACIDAD,				:LS_NUMERO_PARTICULAR,				:LS_DEPTO_PARTICULAR,			:LS_BLOCK_PARTICULAR,			:LS_ESTA_CIVIL,			:LS_USO,	:LDT_FECHA_ENTRE,	:LL_COD_PARQUE,			:LDT_FECHA_MANT
	FROM     "CADENA",   "CIUDAD",   "CLIENTE",   "COMUNA",   "PROCESO_TITULO_ISACRUZ",   "CADENA_MORA",   "CONTRATO"  
	WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
			 ( "PROCESO_TITULO_ISACRUZ"."RUT" = "CLIENTE"."RUT" ) and  
			 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
			 ( "CLIENTE"."CIUDAD" = "CIUDAD"."CODIGO_CIUDAD" ) and  
			 ( "CADENA"."CODIGO" = "PROCESO_TITULO_ISACRUZ"."BASE" ) and  
			 ( "CADENA"."SERIE" = "PROCESO_TITULO_ISACRUZ"."SERIE" ) and  
			 ( "CADENA"."NUMERO" = "PROCESO_TITULO_ISACRUZ"."NUMERO" ) and  
			 ( "PROCESO_TITULO_ISACRUZ"."BASE" = "CADENA_MORA"."BASE" ) and  
			 ( "PROCESO_TITULO_ISACRUZ"."SERIE" = "CADENA_MORA"."SERIE" ) and  
			 ( "PROCESO_TITULO_ISACRUZ"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
			 ( "PROCESO_TITULO_ISACRUZ"."SERIE" = "CONTRATO"."SERIE_C" ) and  
			 ( "PROCESO_TITULO_ISACRUZ"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
			 ( "CADENA"."CODIGO" = :as_base ) and  
			 ( "CADENA"."SERIE" = :as_serie ) and  
			 ( "CADENA"."NUMERO" = :al_numero ) 
	USING		sqlca;
end if
if as_base='O' then
	SELECT	"CADENA"."ESTADO",   "CADENA_MORA"."FALLECIDOS",   "CLIENTE"."RUT",  "CLIENTE"."DV",   "CLIENTE"."NOMBRE",  "CLIENTE"."A_PATERNO",  "CLIENTE"."A_MATERNO",  "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",  "CLIENTE"."CIUDAD",  "CIUDAD"."CIUDAD",   "CLIENTE"."COMUNA",  "COMUNA"."COMUNA",   "CLIENTE"."SEXO",	"OFERTA_V"."TOT_PAGADO",   "OFERTA_V"."FECHA",	"PAGO_OFERTA"."NRO_CUOTAS",	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."TIPO_VENTA",	"OFERTA_V"."TIPO_CONS",	"PAGO_OFERTA"."AREA",	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"PAGO_OFERTA"."CAPACIDAD",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."ESTA_CIVIL",	"OFERTA_V"."USO",	"PAGO_OFERTA"."FECHA_ENTRE",	"CADENA"."COD_PARQUE",	"OFERTA_V"."FECHA_M"
	INTO		:LS_ESTADO,   			:LL_FALLECIDOS,   				:LL_RUT,   			:LS_DV,   			:LS_NOMBRE,   			:LS_A_PATERNO,   			:LS_A_MATERNO,   			:LS_DIRECCION_P,   			:LS_POBLACION,   			:LS_COD_CIUDAD,   	:LS_CIUDAD,   			:LS_COD_COMUNA,   	:LS_COMUNA,   			:LS_SEXO,			:LL_TOT_PAGADO,   			:LDT_FECHA,				:LL_NRO_CUOTAS,					:LL_CTA_PAG_S,				:LS_TIPO_VENTA,				:LS_TIPO_CONS,				:LS_AREA,					:LS_SECTOR,					:LS_SEPULTURA,					:LL_CAPACIDAD,					:LS_NUMERO_PARTICULAR,				:LS_DEPTO_PARTICULAR,			:LS_BLOCK_PARTICULAR,			:LS_ESTA_CIVIL,			:LS_USO,				:LDT_FECHA_ENTRE,					:LL_COD_PARQUE,			:LDT_FECHA_MANT
	FROM		"CADENA",   "CADENA_MORA",   "CIUDAD",   "CLIENTE",   "COMUNA",   "OFERTA_V",	"PAGO_OFERTA"  
	WHERE	 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
			 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
			 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
			 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
			 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
			 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
			 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
			 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
			 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
			 ( "CLIENTE"."CIUDAD" = "CIUDAD"."CODIGO_CIUDAD" ) and  
			 ( "CADENA"."CODIGO" = :as_base ) and  
			 ( "CADENA"."SERIE" = :as_serie ) and  
			 ( "CADENA"."NUMERO" = :al_numero ) 
	USING		sqlca;
end if
if sqlca.sqlcode=0 then
	if ls_sexo='F' then
		ls_trato		= 'Doña'
	else
		ls_trato		= 'Don'
	end if
	ls_nombre_comp	= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
	UPDATE	"PROCESO_TITULO_CTTO_DEFINITIVO"  
	SET 		"ESTADO_CONTRATO" = :ls_estado,   
				"RUT" = :ll_rut,   
				"DV" = :ls_dv,   
				"NOMBRE_CLIENTE" = :ls_nombre_comp,   
				"DIRECCION_P" = :ls_direccion_p,   
				"POBLACION" = :ls_poblacion,   
				"CIUDAD" = :ls_cod_ciudad,   
				"COMUNA" = :ls_cod_comuna,   
				"TRATO" = :ls_trato,   
				"FECHA_PROMESA" = :ldt_fecha,  
				"TIPO_CONSTRUCCION" = :ls_tipo_cons,   
				"AREA" = :ls_area,   
				"SECTOR" = :ls_sector,   
				"NRO_SEPULTURA" = :ls_sepultura,   
				"CAPACIDAD" = :ll_capacidad,   
				"NRO_PARTICULAR" = :ls_numero_particular,   
				"DEPTO_PARTICULAR" = :ls_depto_particular,   
				"BLOCK_PARTICULAR" = :ls_block_particular,   
				"ESTADO_CIVIL" = :ls_esta_civil,   
				"USO" = :ls_uso,   
				"FECHA_ENTREGA" = :ldt_fecha_entre,   
				"COD_PARQUE" = :ll_cod_parque,
				"FECHA_MANT" = :ldt_fecha_mant
	WHERE	 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" = :al_correlativo ) AND  
			 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."BASE" = :as_base ) AND  
			 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."SERIE" = :as_serie ) AND  
			 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."NUMERO" = :al_numero )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		commit;
		if al_fila = al_total_filas then
			messagebox("Grabar","Grabación Exitosa")
		end if
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL "+sqlca.sqlerrtext)
	end if
end if
end subroutine

on w_informar_titulo_de_dominio.create
if this.MenuName = "m_menu_popup_titulo_ctto_def" then this.MenuID = create m_menu_popup_titulo_ctto_def
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.em_ot=create em_ot
this.st_ot=create st_ot
this.dw_exp_archivo=create dw_exp_archivo
this.cb_exp_mecanizado=create cb_exp_mecanizado
this.cb_actualiza_fila=create cb_actualiza_fila
this.cb_actualiza_todo=create cb_actualiza_todo
this.cb_filtrar=create cb_filtrar
this.cb_elimina=create cb_elimina
this.dw_exp_etiqueta=create dw_exp_etiqueta
this.dw_exp_libro=create dw_exp_libro
this.cb_exportar_etiqueta=create cb_exportar_etiqueta
this.cb_exportar_libro_reg=create cb_exportar_libro_reg
this.cb_print_titulo_dominio=create cb_print_titulo_dominio
this.dw_print_carta=create dw_print_carta
this.cb_print_carta_aviso=create cb_print_carta_aviso
this.cb_print_ccto_def=create cb_print_ccto_def
this.rb_ambas=create rb_ambas
this.rb_contrato_definitivo=create rb_contrato_definitivo
this.rb_titulo_dominio=create rb_titulo_dominio
this.dw_print_ctto_def=create dw_print_ctto_def
this.em_rola=create em_rola
this.st_5=create st_5
this.sle_1=create sle_1
this.cb_ctacte=create cb_ctacte
this.st_6=create st_6
this.em_foja=create em_foja
this.em_libro=create em_libro
this.st_4=create st_4
this.st_3=create st_3
this.em_correlativo=create em_correlativo
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.pb_aceptar=create pb_aceptar
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.dw_print_titulo=create dw_print_titulo
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.dw_parque=create dw_parque
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1,&
this.em_ot,&
this.st_ot,&
this.dw_exp_archivo,&
this.cb_exp_mecanizado,&
this.cb_actualiza_fila,&
this.cb_actualiza_todo,&
this.cb_filtrar,&
this.cb_elimina,&
this.dw_exp_etiqueta,&
this.dw_exp_libro,&
this.cb_exportar_etiqueta,&
this.cb_exportar_libro_reg,&
this.cb_print_titulo_dominio,&
this.dw_print_carta,&
this.cb_print_carta_aviso,&
this.cb_print_ccto_def,&
this.rb_ambas,&
this.rb_contrato_definitivo,&
this.rb_titulo_dominio,&
this.dw_print_ctto_def,&
this.em_rola,&
this.st_5,&
this.sle_1,&
this.cb_ctacte,&
this.st_6,&
this.em_foja,&
this.em_libro,&
this.st_4,&
this.st_3,&
this.em_correlativo,&
this.st_1,&
this.cb_cerrar,&
this.pb_aceptar,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_imprimir,&
this.dw_print_titulo,&
this.dw_lista,&
this.gb_2,&
this.dw_parque}
end on

on w_informar_titulo_de_dominio.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
destroy(this.em_ot)
destroy(this.st_ot)
destroy(this.dw_exp_archivo)
destroy(this.cb_exp_mecanizado)
destroy(this.cb_actualiza_fila)
destroy(this.cb_actualiza_todo)
destroy(this.cb_filtrar)
destroy(this.cb_elimina)
destroy(this.dw_exp_etiqueta)
destroy(this.dw_exp_libro)
destroy(this.cb_exportar_etiqueta)
destroy(this.cb_exportar_libro_reg)
destroy(this.cb_print_titulo_dominio)
destroy(this.dw_print_carta)
destroy(this.cb_print_carta_aviso)
destroy(this.cb_print_ccto_def)
destroy(this.rb_ambas)
destroy(this.rb_contrato_definitivo)
destroy(this.rb_titulo_dominio)
destroy(this.dw_print_ctto_def)
destroy(this.em_rola)
destroy(this.st_5)
destroy(this.sle_1)
destroy(this.cb_ctacte)
destroy(this.st_6)
destroy(this.em_foja)
destroy(this.em_libro)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.em_correlativo)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.pb_aceptar)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.dw_print_titulo)
destroy(this.dw_lista)
destroy(this.gb_2)
destroy(this.dw_parque)
end on

event open;Long		ll_max_corr,ll_max_libro,ll_max_foja,ll_max_rola,ll_cod_parque
Datetime	ldt_max_fecha
String	ls_estado_libro
connect using trans_1;
connect using trans_2;
if gs_depto='I' then 
//	cb_elimina.visible												= true
	m_menu_popup_titulo_ctto_def.m_0.m_eliminar.visible	= true
else
//	cb_elimina.visible												= false
	m_menu_popup_titulo_ctto_def.m_0.m_eliminar.visible	= false
end if
st_ot.visible		= false
em_ot.visible		= false
gf_centrar(w_informar_titulo_de_dominio)
dw_exp_archivo.settransobject(sqlca)
dw_lista.settransobject(sqlca)
dw_print_ctto_def.settransobject(sqlca)
dw_print_carta.settransobject(sqlca)
dw_print_titulo.settransobject(sqlca)
dw_exp_libro.settransobject(sqlca)
dw_exp_etiqueta.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
	dw_parque.setitem(1,'cod_parque',ll_cod_parque)
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque	= 11
	dw_parque.setitem(1,'cod_parque',ll_cod_parque)
elseif gs_conexion = "Parque Santiago" then
	ll_cod_parque	= 103
	dw_parque.setitem(1,'cod_parque',ll_cod_parque)
elseif gs_conexion = "Parque Concepción" then
	ll_cod_parque	= 801
	dw_parque.setitem(1,'cod_parque',ll_cod_parque)
end if
gl_cod_parque_cta	= ll_cod_parque
dw_parque.accepttext()
SELECT DISTINCT 	MAX("FACTURA_OFERTA"."FECHA_CIERRE")  
INTO 					:ldt_max_fecha  
FROM 					"FACTURA_OFERTA"  ;
em_fec_ini.text	= string(ldt_max_fecha,"dd/mm/yyyy")
SELECT	MAX("PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO")
INTO 		:ll_max_corr
FROM 		"PROCESO_TITULO_CTTO_DEFINITIVO"  
WHERE		"PROCESO_TITULO_CTTO_DEFINITIVO"."COD_PARQUE" = :ll_cod_parque
USING		sqlca;
if ll_max_corr>0 then
	SELECT	"PROCESO_TITULO_CTTO_DEFINITIVO"."NRO_LIBRO",   
				"PROCESO_TITULO_CTTO_DEFINITIVO"."FOJA",   
				"PROCESO_TITULO_CTTO_DEFINITIVO"."ROLA",
				"PROCESO_TITULO_CTTO_DEFINITIVO"."ESTADO_GENERA_LIBRO"
	INTO 		:ll_max_libro,   
				:ll_max_foja,   
				:ll_max_rola,
				:ls_estado_libro
	FROM 		"PROCESO_TITULO_CTTO_DEFINITIVO"  
	WHERE 	"PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" = :ll_max_corr   ;
end if
if isnull(ll_max_corr) or ll_max_corr=0 then ll_max_corr=0
if isnull(ll_max_libro) or ll_max_libro=0 then ll_max_libro=1
if isnull(ll_max_foja) or ll_max_foja=0 then ll_max_foja=1
if isnull(ll_max_rola) or ll_max_rola=0 then ll_max_rola=0
if ls_estado_libro = '' or isnull(ls_estado_libro) or ls_estado_libro = 'P' then
	if ll_max_rola>=10 then //>=10
		ll_max_rola			= 0
		if ll_max_foja>50 then 
			ll_max_foja		= 1
			ll_max_libro	= ll_max_libro + 1
		else
			ll_max_foja ++
		end if
	end if
elseif mid(ls_estado_libro,1,1)='G' then
	if ll_max_rola>0 then //>=10
		ll_max_rola			= 0
		if ll_max_foja>50 then 
			ll_max_foja		= 1
			ll_max_libro	= ll_max_libro + 1
		else
			ll_max_foja ++
		end if
	end if
end if
if ll_max_foja>50 then 
	ll_max_foja			= 1
	ll_max_libro		= ll_max_libro + 1
end if
em_correlativo.text	= string(ll_max_corr,"###,###,###,###,###,###")
em_libro.text			= string(ll_max_libro,"###,###,###,###,###,###")
em_foja.text			= string(ll_max_foja,"###,###,###,###,###,###")
em_rola.text			= string(ll_max_rola,"###,###,###,###,###,###")
end event

event close;disconnect using trans_1;
disconnect using trans_2;
end event

type mdi_1 from mdiclient within w_informar_titulo_de_dominio
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_informar_titulo_de_dominio
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_informar_titulo_de_dominio
int X=0
int Y=0
int Width=0
int Height=596
end type

type em_ot from editmask within w_informar_titulo_de_dominio
integer x = 2766
integer y = 204
integer width = 576
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###,###"
end type

event modified;Long		ll_tot_reg,ll_indi,ll_correlativo,ll_new,ll_count,ll_resp=1,ll_nro_ot,ll_rut
String		ls_nombre,ls_direccion_p,ls_poblacion,ls_comuna,ls_ciudad,ls_base,ls_serie,ls_pasa='S',&
			ls_descrip_comuna,ls_descrip_ciudad,ls_fono_p,ls_celular
Date		ld_fecha
Double	ll_numero
Datawindow	dw_paso
dw_exp_archivo.reset()
ll_tot_reg	= dw_lista.rowcount()
ll_nro_ot	= long(this.text)
if ll_tot_reg>0 and ll_nro_ot>0 then
	for ll_indi=1 to ll_tot_reg
		ll_rut			= dw_lista.getitemnumber(ll_indi,'rut')
		SELECT	"CLIENTE"."FONO_P",	"CLIENTE"."CELULAR"  
		INTO 		:ls_fono_p,				:ls_celular  
		FROM 		"CLIENTE"  
		WHERE 	"CLIENTE"."RUT" = :ll_rut   
		USING		sqlca;
		if isnull(ls_fono_p) then ls_fono_p='-'
		if isnull(ls_celular) then ls_celular='-'
		ls_nombre		= trim(dw_lista.getitemstring(ll_indi,'nombre_cliente'))
		ls_direccion_p	= trim(dw_lista.getitemstring(ll_indi,'tipo_via'))+' '+trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		if isnull(trim(dw_lista.getitemstring(ll_indi,'nro_particular'))) or trim(dw_lista.getitemstring(ll_indi,'nro_particular'))='' then
			ls_direccion_p	= ls_direccion_p + ' Nº:/-'
		else
			ls_direccion_p	= ls_direccion_p + ' Nº:/'+trim(dw_lista.getitemstring(ll_indi,'nro_particular'))
		end if
		if isnull(trim(dw_lista.getitemstring(ll_indi,'depto_particular'))) or trim(dw_lista.getitemstring(ll_indi,'depto_particular'))='' then
			ls_direccion_p	= ls_direccion_p + ' D:/-'
		else
			ls_direccion_p	= ls_direccion_p + ' D:/'+trim(dw_lista.getitemstring(ll_indi,'depto_particular'))
		end if
		if isnull(trim(dw_lista.getitemstring(ll_indi,'block_particular'))) or trim(dw_lista.getitemstring(ll_indi,'block_particular'))='' then
			ls_direccion_p	= ls_direccion_p + ' B:/-'
		else
			ls_direccion_p	= ls_direccion_p + ' B:/'+trim(dw_lista.getitemstring(ll_indi,'block_particular'))
		end if
		ls_poblacion	= trim(dw_lista.getitemstring(ll_indi,'poblacion'))
		ls_comuna		= trim(dw_lista.getitemstring(ll_indi,'comuna'))
		SELECT	"COMUNA"."COMUNA"  
		INTO 		:ls_descrip_comuna  
		FROM 		"COMUNA"  
		WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_comuna   ;
		ls_ciudad		= trim(dw_lista.getitemstring(ll_indi,'ciudad'))
		SELECT 	"CIUDAD"."SIGLA_CIUDAD"  
		INTO 		:ls_descrip_ciudad  
		FROM 		"CIUDAD"  
		WHERE 	"CIUDAD"."CODIGO_CIUDAD" = :ls_ciudad   ;

		ls_base			= trim(dw_lista.getitemstring(ll_indi,'base'))
		ls_serie			= trim(dw_lista.getitemstring(ll_indi,'serie'))
		ll_numero		= dw_lista.getitemnumber(ll_indi,'numero')
		ll_correlativo	= dw_lista.getitemnumber(ll_indi,'correlativo')
		ll_new			= dw_exp_archivo.insertrow(0)
		dw_exp_archivo.scrolltorow(ll_new)
		dw_exp_archivo.setitem(ll_new,'nombre',ls_nombre)
		dw_exp_archivo.setitem(ll_new,'direccion_p',ls_direccion_p)
		dw_exp_archivo.setitem(ll_new,'poblacion',ls_poblacion)
		dw_exp_archivo.setitem(ll_new,'comuna',ls_descrip_comuna)
		dw_exp_archivo.setitem(ll_new,'ciudad',ls_descrip_ciudad)
		dw_exp_archivo.setitem(ll_new,'base',ls_base)
		dw_exp_archivo.setitem(ll_new,'serie',ls_serie)
		dw_exp_archivo.setitem(ll_new,'numero',ll_numero)
		dw_exp_archivo.setitem(ll_new,'correlativo',ll_correlativo)
		dw_exp_archivo.setitem(ll_new,'fecha_emision',date(gdt_fec_sistema))
		dw_exp_archivo.setitem(ll_new,'numero_orden_trabajo',ll_nro_ot)
		dw_exp_archivo.setitem(ll_new,'fono_particular',ls_fono_p)
		dw_exp_archivo.setitem(ll_new,'celular',ls_celular)
	next
	dw_exp_archivo.accepttext()
	dw_paso			= dw_exp_archivo
	f_DWToExcel( dw_paso )
	st_ot.visible	= false
	em_ot.text		= ''
	em_ot.visible	= false
end if
end event

type st_ot from statictext within w_informar_titulo_de_dominio
integer x = 2281
integer y = 216
integer width = 462
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Nº O.T.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_exp_archivo from datawindow within w_informar_titulo_de_dominio
boolean visible = false
integer x = 1957
integer y = 2312
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_exportar_archivo_mecanizado_venc"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_exp_mecanizado from commandbutton within w_informar_titulo_de_dominio
boolean visible = false
integer x = 224
integer y = 2000
integer width = 695
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generar Archivo Mecanizado"
end type

event clicked;Long	ll_resp
ll_resp	= messagebox("Advertencia","Antes de Generarlo debe Hacer Filtro, desea crear ahora el Archivo",Exclamation!,YesNo!,2)
if ll_resp=1 then
	st_ot.visible			= true
	em_ot.visible		= true
	em_ot.setfocus()
else
	st_ot.visible			= false
	em_ot.visible		= false
	cb_filtrar.triggerevent(clicked!)
end if
end event

type cb_actualiza_fila from commandbutton within w_informar_titulo_de_dominio
boolean visible = false
integer x = 3177
integer y = 2128
integer width = 379
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar Fila"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_correlativo
String		ls_base,ls_serie
Double	ll_numero
SetPointer(HourGlass!)
ll_tot_reg				= dw_lista.rowcount()
ll_indi					= dw_lista.getrow()
if ll_tot_reg>0 and ll_indi>0 then
	ls_base			= dw_lista.getitemstring(ll_indi,'base')
	ls_serie			= dw_lista.getitemstring(ll_indi,'serie')
	ll_numero		= dw_lista.getitemnumber(ll_indi,'numero')
	ll_correlativo	= dw_lista.getitemnumber(ll_indi,'correlativo')
	wf_actualizar(ls_base,ls_serie,ll_numero,ll_correlativo,1,1)
	pb_aceptar.triggerevent(clicked!)
end if
SetPointer(Arrow!)
end event

type cb_actualiza_todo from commandbutton within w_informar_titulo_de_dominio
boolean visible = false
integer x = 2715
integer y = 2128
integer width = 379
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar Todo"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_correlativo
String		ls_base,ls_serie
Double	ll_numero
SetPointer(HourGlass!)
ll_tot_reg				= dw_lista.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_base			= dw_lista.getitemstring(ll_indi,'base')
		ls_serie			= dw_lista.getitemstring(ll_indi,'serie')
		ll_numero		= dw_lista.getitemnumber(ll_indi,'numero')
		ll_correlativo	= dw_lista.getitemnumber(ll_indi,'correlativo')
		wf_actualizar(ls_base,ls_serie,ll_numero,ll_correlativo,ll_indi,ll_tot_reg)
	next
	pb_aceptar.triggerevent(clicked!)
end if
SetPointer(Arrow!)
end event

type cb_filtrar from commandbutton within w_informar_titulo_de_dominio
integer x = 539
integer y = 2296
integer width = 238
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string	ls_formula
long 		ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string 	ls_texto
setnull (is_filtro)
dw_lista.SETfilter(is_filtro)
dw_lista.filter()
ll_filas				= dw_lista.rowcount()
ls_formula 			= dw_lista.describe("datawindow.syntax")
ll_largototal		= len(ls_formula)
ll_posini			= Pos(ls_formula, "filter") + 8
ll_posfin			= len("~nfilter~n")
ls_texto				= mid(ls_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(ls_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto				= ll_posfin - ll_posini
ls_formula			= trim(mid(ls_formula,ll_posini,ll_resto))
if mid(ls_formula,1,2)='7;' then
	ls_formula		= ''
end if
//dw_print_ctto_def.SETfilter(ls_formula)
dw_print_carta.SETfilter(ls_formula)
dw_print_titulo.SETfilter(ls_formula)
dw_exp_etiqueta.SETfilter(ls_formula)
//dw_print_ctto_def.filter()
dw_print_carta.filter()
dw_print_titulo.filter()
dw_exp_etiqueta.filter()
is_filtro	= ls_formula

end event

type cb_elimina from commandbutton within w_informar_titulo_de_dominio
boolean visible = false
integer x = 2770
integer y = 1984
integer width = 407
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar &Proceso"
end type

event clicked;Date	ldt_fecha_hoy
Long	ll_resp,ll_count_reg

ldt_fecha_hoy	= date(em_fec_ini.text)
SELECT	count("PROCESO_TITULO_CTTO_DEFINITIVO"."NRO_LIBRO")
INTO 		:ll_count_reg  
FROM 		"PROCESO_TITULO_CTTO_DEFINITIVO"  
WHERE   	"PROCESO_TITULO_CTTO_DEFINITIVO"."FECHA_CIERRE" = :ldt_fecha_hoy   ;
if ll_count_reg>0 then
	SELECT	count("PROCESO_TITULO_CTTO_DEFINITIVO"."NRO_LIBRO")
	INTO 		:ll_count_reg  
	FROM 		"PROCESO_TITULO_CTTO_DEFINITIVO"  
	WHERE   ("PROCESO_TITULO_CTTO_DEFINITIVO"."ESTADO_AVISO_TITULO" <> 'P' OR  
				"PROCESO_TITULO_CTTO_DEFINITIVO"."ESTADO_PRINT_TITULO" <> 'P' OR  
				"PROCESO_TITULO_CTTO_DEFINITIVO"."ESTADO_PRINT_CTTO_DEF" <> 'P') AND  
				"PROCESO_TITULO_CTTO_DEFINITIVO"."FECHA_CIERRE" = :ldt_fecha_hoy   
	USING		sqlca;
	if ll_count_reg>0 then
		messagebox("Advertencia","No es posible Eliminar Proceso, ya existe Gestion realizada alguna Promesa en la Fecha Cierre indicada")
	else	
		ll_resp			= messagebox("Eliminar Proceso Cierre del "+string(ldt_fecha_hoy,"dd/mm/yyyy"),"Está seguro de Eliminar Proceso Cierre del día "+string(ldt_fecha_hoy,"dd/mm/yyyy"),Exclamation!,YesNo!,2)
		if ll_resp=1 then
			DELETE FROM "PROCESO_TITULO_CTTO_DEFINITIVO"  
			WHERE 		"PROCESO_TITULO_CTTO_DEFINITIVO"."FECHA_CIERRE" = :ldt_fecha_hoy   
			USING			sqlca;
			if sqlca.sqlcode=0 then
				commit;
				dw_lista.reset()
				w_informar_titulo_de_dominio.triggerevent(open!)
				messagebox("Eliminar","Eliminación de Proceso Exitosa")
			else
				rollback;
				messagebox("Error Eliminar","Error al Eliminar Proceso Cierre del día "+string(ldt_fecha_hoy,"dd/mm/yyyy") +" SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
else
	messagebox("Advertencia","No Existe Proceso realizado en la Fecha Cierre indicada")
end if
end event

type dw_exp_etiqueta from datawindow within w_informar_titulo_de_dominio
boolean visible = false
integer x = 1975
integer y = 2080
integer width = 229
integer height = 168
string dataobject = "dw_etiquetas_titulo_dominio_ctto_def"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_exp_libro from datawindow within w_informar_titulo_de_dominio
boolean visible = false
integer x = 2391
integer y = 2080
integer width = 229
integer height = 168
string dataobject = "dwe_exportar_registro_propiedades_libro"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_exportar_etiqueta from commandbutton within w_informar_titulo_de_dominio
boolean visible = false
integer x = 1966
integer y = 1992
integer width = 242
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Etiquetas"
end type

event clicked;Long	ll_resp,ll_cod_parque

ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')
gl_cod_parque_cta	= ll_cod_parque
if isnull(is_filtro) or is_filtro='' then
	dw_exp_etiqueta.SETfilter('estado_print_etiqueta = "P"')
else
	dw_exp_etiqueta.SETfilter('estado_print_etiqueta = "P" and '+is_filtro)
end if
dw_exp_etiqueta.filter()
if dw_exp_etiqueta.rowcount() > 0 then 
	wf_imprimir_etiquetas()
else
	if dw_lista.rowcount()>0 then
		ll_resp	= messagebox("Advertencia","No registra Estado Impresión Etiquetas PENDIENTE, desea Imprimir TODA la Lista Nuevamente",Exclamation!,YesNo!,2)
		if ll_resp=1 then
			dw_exp_etiqueta.SETfilter(is_filtro)
			dw_exp_etiqueta.filter()
			wf_imprimir_etiquetas()
		end if
	end if
end if
dw_exp_etiqueta.SETfilter(is_filtro)
dw_exp_etiqueta.filter()
end event

type cb_exportar_libro_reg from commandbutton within w_informar_titulo_de_dominio
boolean visible = false
integer x = 2281
integer y = 1984
integer width = 439
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Libro Registro"
end type

event clicked;Long			ll_tot_reg,ll_indi,ll_foja,ll_rola,ll_nro_titulo,ll_rut_titular,ll_rut_copropietario,ll_capacidad,ll_new,ll_resp,ll_contar_fila,ll_agregar,ll_insertar,&
				ll_cod_parque
String			ls_serie_libro,ls_nombre_titular,ls_dv_titular,ls_nombre_copropietario,ls_dv_copropietario,ls_base,ls_serie,ls_area,ls_sector,ls_sepultura,&
				ls_tipo_construccion,ls_firma,ls_observaciones,ls_transferencias,ls_descrip_tipo_const,ls_estado,ls_nom_benef,ls_ap_pat_benef,ls_ap_mat_benef,&
				ls_ap_pat_titular,ls_ap_mat_titular,ls_descrip
Datetime		ldt_fecha_contrato,ldt_fecha_entrega_titulo
Double		ll_resto,ll_numero

if isnull(is_filtro) or is_filtro='' then
	dw_lista.SETfilter('estado_genera_libro = "P"')
else
	dw_lista.SETfilter('estado_genera_libro = "P" and '+is_filtro)
end if
dw_lista.filter()
if dw_lista.rowcount() > 0 then 
	datawindow dw_paso
	dw_exp_libro.reset()
	ll_tot_reg								= dw_lista.rowcount()
	ll_cod_parque							= dw_parque.getitemnumber(1,'cod_parque')
	gl_cod_parque_cta					= ll_cod_parque
	SELECT	"COD_PARQ"."NOMBRE"  
	INTO 		:ls_descrip  
	FROM 		"COD_PARQ"  
	WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque   
	USING		sqlca;
	
	for ll_indi=1 to ll_tot_reg
		ls_serie_libro					= dw_lista.getitemstring(ll_indi,'nro_libro_romano')
		ll_foja								= dw_lista.getitemNumber(ll_indi,'foja')
		ll_rola								= dw_lista.getitemNumber(ll_indi,'rola')
		ll_nro_titulo						= dw_lista.getitemNumber(ll_indi,'correlativo')
		ll_rut_titular						= dw_lista.getitemNumber(ll_indi,'rut')
		SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"  
		INTO 		:ls_nombre_titular,	:ls_ap_pat_titular,		:ls_ap_mat_titular
		FROM 		"CLIENTE"  
		WHERE 	"CLIENTE"."RUT" = :ll_rut_titular   
		USING		sqlca;
		ls_dv_titular						= dw_lista.getitemstring(ll_indi,'dv')
		ls_base							= dw_lista.getitemstring(ll_indi,'base')
		ls_serie							= dw_lista.getitemstring(ll_indi,'serie')
		ll_numero						= dw_lista.getitemNumber(ll_indi,'numero')
		ldt_fecha_contrato				= dw_lista.getitemdatetime(ll_indi,'fecha_promesa')
		ls_area							= dw_lista.getitemstring(ll_indi,'area')
		ls_sector							= dw_lista.getitemstring(ll_indi,'sector')
		ls_sepultura						= dw_lista.getitemstring(ll_indi,'nro_sepultura')
		ll_capacidad						= dw_lista.getitemNumber(ll_indi,'capacidad')
		ls_tipo_construccion			= dw_lista.getitemstring(ll_indi,'tipo_construccion')
		setnull(ls_nombre_copropietario);setnull(ll_rut_copropietario);setnull(ls_dv_copropietario)
		SELECT	"TIPO_CONSTRUCCION"."DESCRIPCION"  
		INTO 		:ls_descrip_tipo_const  
		FROM 		"TIPO_CONSTRUCCION"  
		WHERE 	"TIPO_CONSTRUCCION"."TIPO_CONST" = :ls_tipo_construccion   ;
		ll_new							= dw_exp_libro.insertrow(0)
		dw_exp_libro.scrolltorow(ll_new)
		dw_exp_libro.setitem(ll_new,'nro_libro',ls_serie_libro)
		dw_exp_libro.setitem(ll_new,'foja',ll_foja)
		dw_exp_libro.setitem(ll_new,'rola',ll_rola)
		dw_exp_libro.setitem(ll_new,'nro_titulo',ll_nro_titulo)
		dw_exp_libro.setitem(ll_new,'nombre_titular',ls_nombre_titular)
		dw_exp_libro.setitem(ll_new,'apellido_titular',trim(ls_ap_pat_titular)+' '+trim(ls_ap_mat_titular))
		dw_exp_libro.setitem(ll_new,'rut_titular',ll_rut_titular)
		dw_exp_libro.setitem(ll_new,'dv_titular',ls_dv_titular)
		dw_exp_libro.setitem(ll_new,'base',ls_base)
		dw_exp_libro.setitem(ll_new,'serie',ls_serie)
		dw_exp_libro.setitem(ll_new,'numero',ll_numero)
		dw_exp_libro.setitem(ll_new,'fecha_contrato',ldt_fecha_contrato)
		dw_exp_libro.setitem(ll_new,'area',ls_area)
		dw_exp_libro.setitem(ll_new,'sector',ls_sector)
		dw_exp_libro.setitem(ll_new,'sepultura',ls_sepultura)
		dw_exp_libro.setitem(ll_new,'capacidad',ll_capacidad)
		dw_exp_libro.setitem(ll_new,'tipo_construccion',ls_descrip_tipo_const)
		dw_exp_libro.setitem(ll_new,'parque',ls_descrip)
		if ls_base='C' then
			DECLARE x1 CURSOR FOR  
			SELECT	"COPROP_ISACRUZ"."RUT",	"COPROP_ISACRUZ"."DV",	"COPROP_ISACRUZ"."NOMBRES",	"COPROP_ISACRUZ"."APATERNO",	"COPROP_ISACRUZ"."AMATERNO"	
			FROM 		"COPROP_ISACRUZ",   
						"CADENA"  
			WHERE  ( "COPROP_ISACRUZ"."SERIE" = "CADENA"."SERIE" ) and  
					 ( "COPROP_ISACRUZ"."NUMERO" = "CADENA"."NUMERO" ) and  
					 (("CADENA"."CODIGO" = 'C' ) AND  
					 ( "COPROP_ISACRUZ"."SERIE" = :ls_serie ) AND  
					 ( "COPROP_ISACRUZ"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				ll_contar_fila			= 1
				DO WHILE sqlca.sqlcode=0
					fetch x1 into :ll_rut_copropietario, :ls_dv_copropietario, :ls_nom_benef, :ls_ap_pat_benef, :ls_ap_mat_benef ; 
					if not isnull(ll_rut_copropietario) and not isnull(ls_nom_benef) then
						ls_nombre_copropietario		= ls_nom_benef + ' ' + ls_ap_pat_benef + ' ' + ls_ap_mat_benef
						if not isnull(ls_nombre_copropietario) and ll_contar_fila<= 4 then
							dw_exp_libro.setitem(ll_new,'nombre_copropietario_'+string(ll_contar_fila),ls_nombre_copropietario)
							dw_exp_libro.setitem(ll_new,'rut_copropietario_'+string(ll_contar_fila),ll_rut_copropietario)
							dw_exp_libro.setitem(ll_new,'dv_copropietario_'+string(ll_contar_fila),ls_dv_copropietario)
						end if
					end if
					ll_contar_fila ++
					setnull(ll_rut_copropietario);setnull(ls_nom_benef);setnull(ls_ap_pat_benef);setnull(ls_dv_copropietario);setnull(ls_ap_mat_benef)
				LOOP
			end if
			close x1;
		end if
	next
	ll_resto				= ll_tot_reg / 10
	if ll_resto <> int(ll_tot_reg / 10) then
		ll_agregar		= ll_tot_reg - (long(ll_resto) * 10)
		ll_insertar		= 10 - ll_agregar
		for ll_indi=1 to ll_insertar
			ll_new		= dw_exp_libro.insertrow(0)
		next
	end if
	dw_exp_libro.accepttext()
	dw_lista.accepttext()
	if dw_exp_libro.rowcount() > 0 then 
		f_Print( dw_exp_libro )
		wf_imprimir_libro()
	end if
	//	dw_paso					= dw_exp_libro
	//	OpenWithParm(w_exportar_titulo_ctto_def, dw_paso)
end if
dw_lista.SETfilter(is_filtro)
dw_lista.filter()
end event

type cb_print_titulo_dominio from commandbutton within w_informar_titulo_de_dominio
boolean visible = false
integer x = 1394
integer y = 1992
integer width = 325
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Título Dominio"
end type

event clicked;Long	ll_resp,ll_cod_parque

ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')
gl_cod_parque_cta	= ll_cod_parque
if isnull(is_filtro) or is_filtro='' then
	dw_print_titulo.SETfilter('proceso_titulo_ctto_definitivo_estado_pr = "P"')
else
	dw_print_titulo.SETfilter('proceso_titulo_ctto_definitivo_estado_pr = "P" and '+is_filtro)
end if
dw_print_titulo.filter()
if dw_print_titulo.rowcount()>0 then
	wf_imprimir_titulo_de_dominio()
else
	if dw_lista.rowcount()>0 then
		ll_resp	= messagebox("Advertencia","No Registra Estado Impresión Título Dominio PENDIENTE, desea Imprimir TODA la Lista Nuevamente",Exclamation!,YesNo!,2)
		if ll_resp=1 then
			dw_print_titulo.SETfilter(is_filtro)
			dw_print_titulo.filter()
			wf_imprimir_titulo_de_dominio()
		end if
	end if
end if
dw_print_titulo.SETfilter(is_filtro)
dw_print_titulo.filter()
end event

type dw_print_carta from datawindow within w_informar_titulo_de_dominio
boolean visible = false
integer x = 1134
integer y = 2080
integer width = 229
integer height = 168
string dataobject = "dw_imprimir_carta_aviso"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print_carta_aviso from commandbutton within w_informar_titulo_de_dominio
boolean visible = false
integer x = 1102
integer y = 1992
integer width = 288
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Carta &Aviso"
end type

event clicked;Long	ll_resp,ll_cod_parque

ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')
gl_cod_parque_cta	= ll_cod_parque
if isnull(is_filtro) or is_filtro='' then
	dw_print_carta.SETfilter('proceso_titulo_ctto_definitivo_estado_av = "P"')
else
	dw_print_carta.SETfilter('proceso_titulo_ctto_definitivo_estado_av = "P" and '+is_filtro)
end if
dw_print_carta.filter()
if dw_print_carta.rowcount()>0 then
	wf_imprimir_carta_aviso()
else
	if dw_lista.rowcount()>0 then
		ll_resp	= messagebox("Advertencia","No Registra Estado Impresión Carta Aviso PENDIENTE, desea Imprimir TODA la Lista Nuevamente",Exclamation!,YesNo!,2)
		if ll_resp=1 then
			dw_print_carta.SETfilter(is_filtro)
			dw_print_carta.filter()
			wf_imprimir_carta_aviso()
		end if
	end if
end if
dw_print_carta.SETfilter(is_filtro)
dw_print_carta.filter()
end event

type cb_print_ccto_def from commandbutton within w_informar_titulo_de_dominio
boolean visible = false
integer x = 1723
integer y = 1992
integer width = 238
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ctto. &Def."
end type

event clicked;Long		ll_resp,ll_cod_parque
String		ls_string

ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')
gl_cod_parque_cta	= ll_cod_parque
if gs_conexion = "Parque El Prado" then
	if isnull(is_filtro) or is_filtro='' then
		ls_string			= '(estado_print_ctto_def = "P" and base="O" and numero > 28600) or (estado_print_ctto_def = "P" and base="O" and numero <= 28600 and serie <> "M" and serie <> "I")'
	else
		ls_string			= '(estado_print_ctto_def = "P" and base="O" and numero > 28600) or (estado_print_ctto_def = "P" and base="O" and numero <= 28600 and serie <> "M" and serie <> "I") and '+is_filtro
	end if
elseif gs_conexion = "Parque La Foresta" then
	if isnull(is_filtro) or is_filtro='' then
		ls_string			= '(estado_print_ctto_def = "P" and base="O" and numero > 5600)'
	else
		ls_string			= '(estado_print_ctto_def = "P" and base="O" and numero > 5600) and '+is_filtro
	end if
else
	ls_string				= ''
end if
dw_lista.SETfilter(ls_string)
dw_lista.filter()
if dw_lista.rowcount()>0 then
	dw_print_ctto_def.accepttext()
	if dw_print_ctto_def.rowcount()>0 then
		dw_print_ctto_def.scrolltorow(dw_print_ctto_def.rowcount())
		dw_print_ctto_def.scrolltorow(1)
	end if
	if dw_print_ctto_def.rowcount()>0 then
		wf_imprimir_contrato_definitivo()
	else
		if dw_lista.rowcount()>0 then
			ll_resp	= messagebox("Advertencia","No Registra Estado Impresión Contrato Definitivo PENDIENTE, desea Imprimir TODA la Lista Nuevamente",Exclamation!,YesNo!,2)
			if ll_resp=1 then
				wf_imprimir_contrato_definitivo()
			end if
		end if
	end if
else
	messagebox("Advertencia","No Registra Título de Dominio a Imprimir")
end if
if is_filtro='' or isnull(is_filtro) then
	if gs_conexion = "Parque El Prado" then
		ls_string			= '(estado_print_ctto_def = "P" and base="O" and numero > 28600) or (estado_print_ctto_def = "P" and base="O" and numero <= 28600 and serie <> "M" and serie <> "I")'
	elseif gs_conexion = "Parque La Foresta" then
		ls_string			= '(estado_print_ctto_def = "P" and base="O" and numero > 5600)'
	else
		ls_string			= ''
	end if
	dw_lista.SETfilter(ls_string)
else
	dw_lista.SETfilter(is_filtro)
end if
dw_lista.filter()
dw_print_ctto_def.accepttext()
end event

type rb_ambas from radiobutton within w_informar_titulo_de_dominio
integer x = 1783
integer y = 208
integer width = 338
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Ambas"
boolean checked = true
end type

event clicked;dw_lista.reset()
m_menu_popup_titulo_ctto_def.m_imprimir.m_contratodefinitivo.enabled	= true
cb_print_ccto_def.enabled															= true
m_menu_popup_titulo_ctto_def.m_imprimir.m_títulodominio.enabled		= true
cb_print_titulo_dominio.enabled													= true
end event

type rb_contrato_definitivo from radiobutton within w_informar_titulo_de_dominio
integer x = 910
integer y = 208
integer width = 704
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Contrato Definitivo"
end type

event clicked;dw_lista.reset()
m_menu_popup_titulo_ctto_def.m_imprimir.m_contratodefinitivo.enabled	= true
cb_print_ccto_def.enabled															= true
m_menu_popup_titulo_ctto_def.m_imprimir.m_títulodominio.enabled		= false
cb_print_titulo_dominio.enabled													= false

end event

type rb_titulo_dominio from radiobutton within w_informar_titulo_de_dominio
integer x = 110
integer y = 208
integer width = 704
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Titulo de Dominio"
end type

event clicked;dw_lista.reset()
m_menu_popup_titulo_ctto_def.m_imprimir.m_contratodefinitivo.enabled	= false
cb_print_ccto_def.enabled															= false
m_menu_popup_titulo_ctto_def.m_imprimir.m_títulodominio.enabled		= true
cb_print_titulo_dominio.enabled													= true
end event

type dw_print_ctto_def from datawindow within w_informar_titulo_de_dominio
boolean visible = false
integer x = 1728
integer y = 2080
integer width = 229
integer height = 168
string dataobject = "dw_post_imprimir_ctto_definitivo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_rola from editmask within w_informar_titulo_de_dominio
integer x = 2373
integer y = 312
integer width = 174
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0"
end type

type st_5 from statictext within w_informar_titulo_de_dominio
integer x = 2231
integer y = 328
integer width = 123
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Rola"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from uo_convierte_numero within w_informar_titulo_de_dominio
boolean visible = false
integer x = 539
integer y = 2076
integer width = 494
integer taborder = 0
boolean hideselection = false
end type

type cb_ctacte from commandbutton within w_informar_titulo_de_dominio
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 73
integer y = 2076
integer width = 425
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuen&ta Corriente"
end type

event clicked;string param
if il_row > 0 then
	gs_base			= dw_lista.getitemstring(il_row,'base')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'numero')
	gi_rut			= dw_lista.getitemnumber(il_row,'rut')
	param     		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R" //Reprog. Mant
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
		CASE "A" // Aumento Capacidad
			OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if
end event

type st_6 from statictext within w_informar_titulo_de_dominio
integer x = 2569
integer y = 328
integer width = 178
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_foja from editmask within w_informar_titulo_de_dominio
integer x = 2043
integer y = 312
integer width = 174
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0"
end type

type em_libro from editmask within w_informar_titulo_de_dominio
integer x = 1632
integer y = 312
integer width = 256
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0"
end type

type st_4 from statictext within w_informar_titulo_de_dominio
integer x = 1893
integer y = 328
integer width = 128
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Foja"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_informar_titulo_de_dominio
integer x = 1481
integer y = 328
integer width = 137
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Libro"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_correlativo from editmask within w_informar_titulo_de_dominio
integer x = 1152
integer y = 312
integer width = 315
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0"
end type

type st_1 from statictext within w_informar_titulo_de_dominio
integer x = 882
integer y = 328
integer width = 256
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Correlativo"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_informar_titulo_de_dominio
boolean visible = false
integer x = 3269
integer y = 2296
integer width = 343
integer height = 92
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;disconnect using trans_1;
disconnect using trans_2;
close(w_informar_titulo_de_dominio)
end event

type pb_aceptar from picturebutton within w_informar_titulo_de_dominio
integer x = 3410
integer y = 228
integer width = 146
integer height = 124
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date		ldt_fecha_hoy,ldt_fecha_promesa,ldt_fecha_cierre
Long		ll_correlativo,ll_nro_libro,ll_foja,ll_rola,ll_cod_parque,ll_max_corr,ll_max_libro,ll_max_foja,&
			ll_tot_reg,ll_indi,ll_tot_pagado,ll_max_rola,ll_capacidad
String		ls_tot_pag_pal,ls_fec_comp,ls_dir_parque,ls_empresa,ls_clasif_carta,ls_descrip_parque,ls_base,ls_serie,&
			ls_estdo_ctto_def
Double	ll_numero
SetPointer(HourGlass!)
dw_lista.reset()
dw_print_titulo.reset()
dw_print_ctto_def.reset()
dw_print_carta.reset()
dw_exp_etiqueta.reset()
ll_correlativo			= long(em_correlativo.text)
ll_nro_libro				= long(em_libro.text)
ll_foja						= long(em_foja.text)
ll_rola						= long(em_rola.text)
dw_parque.accepttext()
ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')
gl_cod_parque_cta	= ll_cod_parque
ldt_fecha_cierre		= date(em_fec_ini.text)
ldt_fecha_hoy			= date(gdt_fec_sistema)
if ll_cod_parque = 1 then
	ll_capacidad			= 1
else	//if ll_cod_parque = 102 or ll_cod_parque = 11 or ll_cod_parque = 103 or ll_cod_parque = 101 then
	ll_capacidad			= 0
end if
if not isnull(ldt_fecha_cierre) and ll_correlativo>=0 and ll_nro_libro>0 and ll_foja>0 and ll_cod_parque > 0 then
	ls_fec_comp			= wf_fecha_palabra(ldt_fecha_hoy)
	DECLARE sp_proc PROCEDURE FOR SP_PROCESO_TITULO_CTTO_DEF( :ll_correlativo, :ll_nro_libro, :ll_foja, :ll_rola, :gs_user, :ll_cod_parque, :ldt_fecha_cierre, :ldt_fecha_hoy, :ls_fec_comp, :ll_capacidad );
	EXECUTE sp_proc;
	
	ll_tot_reg	= dw_lista.retrieve(ldt_fecha_hoy,ll_cod_parque)
	if ll_tot_reg>0 then
		if rb_titulo_dominio.checked=true then
			ls_clasif_carta			= 'T1'
		elseif rb_contrato_definitivo.checked=true then
			ls_clasif_carta			= 'D1'
		elseif rb_ambas.checked=true then
			ls_clasif_carta			= 'TD'
		end if
		for ll_indi=1 to ll_tot_reg
			ls_base					= dw_lista.getitemstring(ll_indi,'base')
			ls_serie					= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero				= dw_lista.getitemnumber(ll_indi,'numero')
			ls_estdo_ctto_def		= trim(dw_lista.getitemstring(ll_indi,'estado_print_ctto_def'))
			ll_tot_pagado			= dw_lista.getitemnumber(ll_indi,'total_pagado')
			ldt_fecha_promesa	= date(dw_lista.getitemdatetime(ll_indi,'fecha_promesa'))
			ls_tot_pag_pal			= sle_1.uo_convertir_numero(string(ll_tot_pagado))
			dw_lista.setitem(ll_indi,'total_pagado_palabras',ls_tot_pag_pal)
			ls_fec_comp				= wf_fecha_palabra(ldt_fecha_promesa)
			dw_lista.setitem(ll_indi,'fecha_promesa_palabras',ls_fec_comp)
			dw_lista.setitem(ll_indi,'correlativo_carta',ll_indi)
			dw_lista.setitem(ll_indi,'cod_accion_carta',4)
			dw_lista.setitem(ll_indi,'clasificacion_carta',ls_clasif_carta)
			if ls_base='C' and ls_estdo_ctto_def='P' then
				dw_lista.setitem(ll_indi,'estado_print_ctto_def','G_TD')
				dw_lista.setitem(ll_indi,'fecha_estado_print_ctto_def',ldt_fecha_hoy)
			elseif ls_base='O' and gs_conexion="Parque El Prado" and ll_numero<=28600 and (ls_serie='M' or ls_serie='I') then
				dw_lista.setitem(ll_indi,'estado_print_ctto_def','G_TD')
				dw_lista.setitem(ll_indi,'fecha_estado_print_ctto_def',ldt_fecha_hoy)
			elseif ls_base='O' and gs_conexion="Parque La Foresta" and ll_numero<=5600 then
				dw_lista.setitem(ll_indi,'estado_print_ctto_def','G_TD')
				dw_lista.setitem(ll_indi,'fecha_estado_print_ctto_def',ldt_fecha_hoy)
			elseif ls_base='O' and gs_conexion="Parque Concepción" then
				dw_lista.setitem(ll_indi,'estado_print_ctto_def','G_TD')
				dw_lista.setitem(ll_indi,'fecha_estado_print_ctto_def',ldt_fecha_hoy)
			elseif ls_base='O' and ll_cod_parque=101 and ls_serie='C' then
				dw_lista.setitem(ll_indi,'estado_print_ctto_def','G_TD')
				dw_lista.setitem(ll_indi,'fecha_estado_print_ctto_def',ldt_fecha_hoy)
			end if
		next
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			gl_cod_parque_cta		= ll_cod_parque
			if ll_cod_parque=1 then
				SELECT	"MEMBRETE_EMPRESA"."SUCURSAL",
							"MEMBRETE_EMPRESA"."EMPRESA"
				INTO 		:ls_dir_parque,
							:ls_empresa
				FROM 	"MEMBRETE_EMPRESA"  
				WHERE 	"MEMBRETE_EMPRESA"."CODIGO" = 'P';

			elseif ll_cod_parque=11 then
				SELECT	"MEMBRETE_EMPRESA"."CASA_MATRIZ",
							"MEMBRETE_EMPRESA"."EMPRESA"
				INTO 		:ls_dir_parque,
							:ls_empresa
				FROM 	"MEMBRETE_EMPRESA"  
				WHERE 	"MEMBRETE_EMPRESA"."CODIGO" = 'F';
			elseif ll_cod_parque=101 then
				SELECT	"MEMBRETE_EMPRESA"."SUCURSAL",
							"MEMBRETE_EMPRESA"."EMPRESA"
				INTO 		:ls_dir_parque,
							:ls_empresa
				FROM 	"MEMBRETE_EMPRESA"  
				WHERE 	"MEMBRETE_EMPRESA"."CODIGO" = 'C';
				
			elseif ll_cod_parque=102 then
				SELECT	"MEMBRETE_EMPRESA"."SUCURSAL",
							"MEMBRETE_EMPRESA"."EMPRESA"
				INTO 		:ls_dir_parque,
							:ls_empresa
				FROM 	"MEMBRETE_EMPRESA"  
				WHERE 	"MEMBRETE_EMPRESA"."CODIGO" = 'M';
				
			elseif ll_cod_parque=103 then
				SELECT	"MEMBRETE_EMPRESA"."SUCURSAL",
							"MEMBRETE_EMPRESA"."EMPRESA"
				INTO 		:ls_dir_parque,
							:ls_empresa
				FROM 	"MEMBRETE_EMPRESA"  
				WHERE 	"MEMBRETE_EMPRESA"."CODIGO" = 'S';
			
			elseif ll_cod_parque=801 then
				SELECT	"MEMBRETE_EMPRESA"."SUCURSAL",
							"MEMBRETE_EMPRESA"."EMPRESA"
				INTO 		:ls_dir_parque,
							:ls_empresa
				FROM 	"MEMBRETE_EMPRESA"  
				WHERE 	"MEMBRETE_EMPRESA"."CODIGO" = 'C';
			end if
			dw_print_carta.retrieve(ldt_fecha_hoy,ls_clasif_carta,ls_dir_parque,ls_empresa,ll_cod_parque)
			if ll_cod_parque=11 then
				dw_print_ctto_def.retrieve(ldt_fecha_hoy,ll_cod_parque,5600)
			else
				dw_print_ctto_def.retrieve(ldt_fecha_hoy,ll_cod_parque,28600)
			end if
			dw_print_titulo.retrieve(ldt_fecha_hoy,ll_cod_parque)
			dw_exp_etiqueta.retrieve(ldt_fecha_hoy,ll_cod_parque)
		else
			rollback;
		end if
	else
		SELECT	"COD_PARQ"."NOMBRE"  
		INTO		:ls_descrip_parque  
		FROM		"COD_PARQ"  
		WHERE		"COD_PARQ"."CODIGO" = :ll_cod_parque   ;
		if rb_titulo_dominio.checked=true then
			messagebox("Advertencia","No Registra Contrato para entregar Título de Dominio, en Parque "+ls_descrip_parque)
		elseif rb_contrato_definitivo.checked=true then
			messagebox("Advertencia","No Registra Contrato para entregar Contrato Definitivo, en Parque "+ls_descrip_parque)
		elseif rb_ambas.checked=true then
			messagebox("Advertencia","No Registra Contrato para entregar Título de Dominio y Contrato definitivo, en Parque "+ls_descrip_parque)
		end if
	end if
else
	if isnull(ldt_fecha_cierre) then
		messagebox("Advertencia","Fecha Cierre Inválida")
		em_fec_ini.setfocus()
	elseif isnull(ll_correlativo) then
		messagebox("Advertencia","Correlativo Inválido")
		em_correlativo.setfocus()
	elseif ll_nro_libro=0 or isnull(ll_nro_libro) then
		messagebox("Advertencia","Libro Inválido")
		em_libro.setfocus()
	elseif ll_foja=0 or isnull(ll_foja) then
		messagebox("Advertencia","Foja Inválido")
		em_foja.setfocus()
	elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia","debe Seleccionar Parque")
		dw_parque.setfocus()
	end if
end if
SetPointer(Arrow!)
end event

type p_ini from picture within w_informar_titulo_de_dominio
integer x = 791
integer y = 308
integer width = 78
integer height = 88
boolean enabled = false
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_fec_ini.text)='00/00/0000' or trim(em_fec_ini.text)='' or &
	isnull(trim(em_fec_ini.text)) then	
	em_fec_ini.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if trim(em_fec_ini.text)<>'00/00/0000' and not isnull(trim(em_fec_ini.text)) and &
	trim(em_fec_ini.text)<>'' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_fec_ini.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini.text = Message.StringParm
end event

type em_fec_ini from editmask within w_informar_titulo_de_dominio
integer x = 439
integer y = 308
integer width = 347
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_informar_titulo_de_dominio
integer x = 64
integer y = 328
integer width = 370
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fec.Cierre Fact."
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_ordenar from commandbutton within w_informar_titulo_de_dominio
event ue_mousemove pbm_dwnmousemove
boolean visible = false
integer x = 55
integer y = 2296
integer width = 238
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_exportar from commandbutton within w_informar_titulo_de_dominio
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 297
integer y = 2296
integer width = 238
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_informar_titulo_de_dominio
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 795
integer y = 2296
integer width = 238
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type dw_print_titulo from datawindow within w_informar_titulo_de_dominio
boolean visible = false
integer x = 1445
integer y = 2080
integer width = 229
integer height = 168
boolean bringtotop = true
string dataobject = "dw_imprimir_titulo_de_dominio"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_lista from datawindow within w_informar_titulo_de_dominio
integer x = 37
integer y = 472
integer width = 3579
integer height = 1504
integer taborder = 40
string dataobject = "dw_proceso_titulo_dominio_ctto_def"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	cb_ctacte.triggerevent(clicked!)
end if
end event

type gb_2 from groupbox within w_informar_titulo_de_dominio
integer x = 37
integer y = 132
integer width = 3579
integer height = 296
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción de Busqueda"
end type

type dw_parque from datawindow within w_informar_titulo_de_dominio
integer x = 2766
integer y = 312
integer width = 594
integer height = 104
integer taborder = 20
boolean bringtotop = true
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long		ll_max_corr,ll_cod_parque,ll_max_libro,ll_max_foja,ll_max_rola
String		ls_estado_libro

dw_parque.accepttext()
dw_lista.reset()
dw_print_titulo.reset()
dw_print_ctto_def.reset()
dw_print_carta.reset()
dw_exp_etiqueta.reset()
ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')
gl_cod_parque_cta	= ll_cod_parque
SELECT	MAX("PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO")
INTO 		:ll_max_corr
FROM 		"PROCESO_TITULO_CTTO_DEFINITIVO"  
WHERE		"PROCESO_TITULO_CTTO_DEFINITIVO"."COD_PARQUE" = :ll_cod_parque
USING		sqlca;
if ll_max_corr>0 then
	SELECT	"PROCESO_TITULO_CTTO_DEFINITIVO"."NRO_LIBRO",   
				"PROCESO_TITULO_CTTO_DEFINITIVO"."FOJA",   
				"PROCESO_TITULO_CTTO_DEFINITIVO"."ROLA",
				"PROCESO_TITULO_CTTO_DEFINITIVO"."ESTADO_GENERA_LIBRO"
	INTO 		:ll_max_libro,   
				:ll_max_foja,   
				:ll_max_rola,
				:ls_estado_libro
	FROM 	"PROCESO_TITULO_CTTO_DEFINITIVO"  
	WHERE 	"PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" = :ll_max_corr  AND
				"PROCESO_TITULO_CTTO_DEFINITIVO"."COD_PARQUE" = :ll_cod_parque;
end if
if isnull(ll_max_corr) or ll_max_corr=0 then ll_max_corr=0
if isnull(ll_max_libro) or ll_max_libro=0 then ll_max_libro=1
if isnull(ll_max_foja) or ll_max_foja=0 then ll_max_foja=1
if isnull(ll_max_rola) or ll_max_rola=0 then ll_max_rola=0
if ls_estado_libro='' or isnull(ls_estado_libro) or ls_estado_libro='P' then
	if ll_max_rola>=10 then //>=10
		ll_max_rola			= 0
		if ll_max_foja>50 then 
			ll_max_foja		= 1
			ll_max_libro	= ll_max_libro + 1
		else
			ll_max_foja ++
		end if
	end if
elseif ls_estado_libro<>'' and not isnull(ls_estado_libro) then
	if ll_max_rola>0 then //>=10
		ll_max_rola			= 0
		if ll_max_foja>50 then 
			ll_max_foja		= 1
			ll_max_libro	= ll_max_libro + 1
		else
			ll_max_foja ++
		end if
	end if
end if
if ll_max_foja>50 then 
	ll_max_foja			= 1
	ll_max_libro			= ll_max_libro + 1
end if
em_correlativo.text	= string(ll_max_corr,"###,###,###,###,###,###")
em_libro.text			= string(ll_max_libro,"###,###,###,###,###,###")
em_foja.text			= string(ll_max_foja,"###,###,###,###,###,###")
em_rola.text			= string(ll_max_rola,"###,###,###,###,###,###")
end event

