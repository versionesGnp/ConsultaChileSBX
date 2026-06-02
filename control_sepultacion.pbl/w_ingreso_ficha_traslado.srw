forward
global type w_ingreso_ficha_traslado from window
end type
type dw_solicitud from datawindow within w_ingreso_ficha_traslado
end type
type cb_fosa_comun from commandbutton within w_ingreso_ficha_traslado
end type
type cb_datos_ctto from commandbutton within w_ingreso_ficha_traslado
end type
type dw_resumen from datawindow within w_ingreso_ficha_traslado
end type
type cb_2 from commandbutton within w_ingreso_ficha_traslado
end type
type cb_tablas from commandbutton within w_ingreso_ficha_traslado
end type
type dw_autoriza from datawindow within w_ingreso_ficha_traslado
end type
type cb_eliminar from commandbutton within w_ingreso_ficha_traslado
end type
type cb_print from commandbutton within w_ingreso_ficha_traslado
end type
type pb_fin from picturebutton within w_ingreso_ficha_traslado
end type
type pb_antes from picturebutton within w_ingreso_ficha_traslado
end type
type pb_sigue from picturebutton within w_ingreso_ficha_traslado
end type
type pb_primer from picturebutton within w_ingreso_ficha_traslado
end type
type cb_buscar from commandbutton within w_ingreso_ficha_traslado
end type
type cb_grabar from commandbutton within w_ingreso_ficha_traslado
end type
type cb_limpiar from commandbutton within w_ingreso_ficha_traslado
end type
type dw_print from datawindow within w_ingreso_ficha_traslado
end type
type tab_1 from tab within w_ingreso_ficha_traslado
end type
type tabpage_3 from userobject within tab_1
end type
type st_6 from statictext within tabpage_3
end type
type em_rut from editmask within tabpage_3
end type
type st_5 from statictext within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type dw_ficha_sepult from datawindow within tabpage_3
end type
type gb_3 from groupbox within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_6 st_6
em_rut em_rut
st_5 st_5
st_3 st_3
dw_ficha_sepult dw_ficha_sepult
gb_3 gb_3
end type
type tabpage_1 from userobject within tab_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_ant_fall from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_1 st_1
dw_ant_fall dw_ant_fall
end type
type tabpage_4 from userobject within tab_1
end type
type st_4 from statictext within tabpage_4
end type
type dw_aranceles from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
st_4 st_4
dw_aranceles dw_aranceles
end type
type tab_1 from tab within w_ingreso_ficha_traslado
tabpage_3 tabpage_3
tabpage_1 tabpage_1
tabpage_4 tabpage_4
end type
type cb_cerrar from commandbutton within w_ingreso_ficha_traslado
end type
type gb_1 from groupbox within w_ingreso_ficha_traslado
end type
type gb_2 from groupbox within w_ingreso_ficha_traslado
end type
type cb_carta from commandbutton within w_ingreso_ficha_traslado
end type
type cb_lapida from commandbutton within w_ingreso_ficha_traslado
end type
end forward

global type w_ingreso_ficha_traslado from window
integer width = 3689
integer height = 2620
boolean titlebar = true
string title = "Ficha de Traslado"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_solicitud dw_solicitud
cb_fosa_comun cb_fosa_comun
cb_datos_ctto cb_datos_ctto
dw_resumen dw_resumen
cb_2 cb_2
cb_tablas cb_tablas
dw_autoriza dw_autoriza
cb_eliminar cb_eliminar
cb_print cb_print
pb_fin pb_fin
pb_antes pb_antes
pb_sigue pb_sigue
pb_primer pb_primer
cb_buscar cb_buscar
cb_grabar cb_grabar
cb_limpiar cb_limpiar
dw_print dw_print
tab_1 tab_1
cb_cerrar cb_cerrar
gb_1 gb_1
gb_2 gb_2
cb_carta cb_carta
cb_lapida cb_lapida
end type
global w_ingreso_ficha_traslado w_ingreso_ficha_traslado

type variables
Long					il_count_reg,il_count_otro,il_hora_ini,il_min_ini,il_hora_fin,il_min_fin,il_intervalo,il_veces,il_capacidad,il_dw_tit_fall,il_modif,il_modif1,il_modif2,il_modif3,&
						il_modif4,il_modif5,il_modif6,il_modifd1,il_modifd2,il_modifd3,il_modifd4,il_modifd5,il_modifd6,il_modif_item=0
String					is_nro_tecnico,is_usuario_esta,is_pasa_plani,is_otro,is_destino_parque
datetime				idt_fecha_hoy
datawindowchild	idw_detalle5,idw_detalle6,idw_detalle7,idw_detalle8,idw_detalle9,idw_detalle10,&
						idw_detalle11	,idw_detalle16,idw_detalle17,idw_detalle18,idw_detalle19,idw_detalle20,idw_detalle21,idw_detalle22,idw_detalle23,idw_detalle24,idw_detalle25,&
						idw_detalle26,idw_detalle27,idw_detalle28,idw_detalle29,idw_detalle30,idw_detalle31,idw_detalle32,idw_detalle33,idw_detalle34,idw_detalle35,idw_detalle36
end variables

forward prototypes
public subroutine wf_validar_tiempo (string as_columna)
public subroutine wf_destino_parque (string as_columna)
public subroutine wf_setear_datos ()
public subroutine wf_tipo_traslado (string as_tipo_traslado, long al_fila)
public subroutine wf_valida_destino ()
public function string wf_validar ()
public subroutine wf_validar_columna (string as_columna)
public subroutine wf_validar_ctto (string as_columna)
public subroutine wf_validar_nivel (string as_columna)
public subroutine wf_calculo_monto ()
public function string wf_validar_detalle_dscto (string as_tipo_dscto)
public subroutine wf_carga_detalle_boletas (string as_base, string as_serie, long al_numero, long al_corr_interno, long al_rut_tit, date adt_fech_sepult, long al_parque, long al_rut_tit_d, string as_base_des, string as_serie_des, long al_numero_des)
end prototypes

public subroutine wf_validar_tiempo (string as_columna);Long		ll_hora,ll_minutos,ll_hora_fijada,ll_min_fijada,ll_parque_tras,ll_count_sep,ll_count_tras,ll_count_suma
Datetime	ldt_fec_tras
if as_columna='hora_fijada' then
	ll_hora	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'hora_fijada')
	if ll_hora>23 then
		messagebox("Advertencia","Hora Incorrecta")
		tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'hora_fijada',0)
		tab_1.tabpage_3.dw_ficha_sepult.accepttext()
	end if
end if
if as_columna='minuto_fijada' then
	ll_minutos	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'minuto_fijada')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'minuto_fijada',0)
		tab_1.tabpage_3.dw_ficha_sepult.accepttext()
	else
		if il_intervalo=30 then
			if ll_minutos<>0 and ll_minutos<>30 then
				messagebox("Advertencia","Horario Inválido, recuerde Sepultación es cada "+string(il_intervalo,'##0')+ " minutos")
			end if
		elseif il_intervalo=15 then
			if ll_minutos<>0 and ll_minutos<>15 and ll_minutos<>30 and ll_minutos<>45 then
				messagebox("Advertencia","Horario Inválido, recuerde Sepultación es cada "+string(il_intervalo,'##0')+ " minutos")
			end if
		elseif il_intervalo=60 then
			if ll_minutos<>0 then
				messagebox("Advertencia","Horario Inválido, recuerde Sepultación es cada UNA hora")
			end if
		end if
	end if
end if
if as_columna='hora_fijada' or as_columna='minuto_fijada' then
	ll_hora_fijada	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'hora_fijada')
	ll_min_fijada	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'minuto_fijada')
	ldt_fec_tras	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
	ll_parque_tras	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
	if ll_hora_fijada<il_hora_ini or (ll_hora_fijada=il_hora_ini and ll_min_fijada<il_min_ini) then
		messagebox("Advertencia","No es Posible Ingresar Horario antes de las "+string(il_hora_ini,'00')+':'+string(il_min_ini,'00'))
	elseif ll_hora_fijada>il_hora_fin or (ll_hora_fijada=il_hora_fin and ll_min_fijada>il_min_fin) then
		messagebox("Advertencia","No es Posible Ingresar Horario despues de las "+string(il_hora_fin,'00')+':'+string(il_min_fin,'00'))
	end if
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'hora_def',ll_hora_fijada)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'minuto_def',ll_min_fijada)
	SELECT	Count("FICHA_SEPULTACION"."CODIGO_EJECUTIVO")  
	INTO 		:ll_count_sep
	FROM 		"FICHA_SEPULTACION"  
	WHERE  ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fec_tras ) AND 
			 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_parque_tras ) AND 
			 ( "FICHA_SEPULTACION"."HORA_DEF" = :ll_hora_fijada ) AND  
			 ( "FICHA_SEPULTACION"."MINUTO_DEF" = :ll_min_fijada )   
	USING		sqlca;
	SELECT 	Count("FICHA_TRASLADO"."CODIGO_EJECUTIVO")  
	INTO		:ll_count_tras
	FROM 		"FICHA_TRASLADO"  
	WHERE  ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fec_tras ) AND  
			 ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_parque_tras ) AND 
			 ( "FICHA_TRASLADO"."HORA_DEF" = :ll_hora_fijada ) AND  
			 ( "FICHA_TRASLADO"."MINUTO_DEF" = :ll_min_fijada )   
	USING		sqlca;
	if isnull(ll_count_sep) then ll_count_sep=0
	if isnull(ll_count_tras) then ll_count_tras=0
	ll_count_suma	= ll_count_sep + ll_count_tras
	if ll_count_suma>=il_veces then
		messagebox("Advertencia","No es posible Asignar Horario, sobrepasa lo Definido por Administración Parque")
	end if
end if
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
end subroutine

public subroutine wf_destino_parque (string as_columna);Long		ll_fila,ll_nulo,ll_cod_parque,ll_cap_origen,ll_cod_parque_ori
String		ls_destino,ls_nulo,ls_sector,ls_sepultura,ls_base,ls_ciudad,ls_base_destino,ls_serie_destino,&
			ls_tipo_cons
Datetime	ldt_nulo
Double	ll_num_des,ll_numero_destino

tab_1.tabpage_3.dw_ficha_sepult.accepttext()
Setnull(ll_nulo);Setnull(ls_nulo);Setnull(ldt_nulo)
if as_columna='destino_parque' then
	ll_fila			= tab_1.tabpage_3.dw_ficha_sepult.getrow()
	ls_destino	= is_destino_parque	//tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'destino_parque')
	if ls_destino='S' then //nuestros parques
		ll_num_des	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'numero_destino')
		if ll_num_des>0 then
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'rut_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'rut_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'dv_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'dv_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nombre_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'nombre_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_pat_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'apellido_pat_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_mat_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'apellido_mat_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'estado_sepultura_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'estado_sepultura_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'tipo_via_origen_titular',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'tipo_via_destino_titular'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'direccion_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'direccion_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nro_direc_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'nro_direc_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'dpto_direc_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'depto_direc_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'block_direc_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'block_direc_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_ciudad_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'cod_ciudad_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_comuna_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'cod_comuna_titular_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_parque_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'cod_parque_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'base_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'base_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'serie_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'serie_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'numero_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'numero_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'fecha_contrato_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(ll_fila,'fecha_contrato_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'sector_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'sector_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'sepultura_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'sepultura_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nivel_sepultura_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'nivel_sepultura_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'capacidad_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'capacidad_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'estado_contrato_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'estado_contrato_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'numero_tecnico_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'numero_tecnico_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'observaciones_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'observaciones_destino'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'rut_titular_destino',ll_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'dv_titular_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nombre_titular_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_pat_titular_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_mat_titular_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'estado_sepultura_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'tipo_via_destino_titular',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'direccion_titular_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nro_direc_titular_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'depto_direc_titular_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'block_direc_titular_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_ciudad_titular_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_comuna_titular_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_parque_destino',ll_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'base_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'serie_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'numero_destino',ll_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'fecha_contrato_destino',ldt_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'sector_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'sepultura_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nivel_sepultura_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'capacidad_destino',ll_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'estado_contrato_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'numero_tecnico_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'observaciones_destino',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.accepttext()
			ll_cod_parque	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'cod_parque_origen')
			ls_sector			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'sector_origen')
			ls_base			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'base_origen')
			ls_ciudad			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'cod_ciudad_titular_origen')
			idw_detalle3.retrieve(ll_cod_parque)
			idw_detalle5.retrieve(ll_cod_parque,ls_sector)
			idw_detalle.retrieve(ls_base)
			idw_detalle7.retrieve(ls_ciudad)
			
			idw_detalle4.reset()
			idw_detalle4.insertrow(0)
			idw_detalle6.reset()
			idw_detalle6.insertrow(0)
			idw_detalle2.reset()
			idw_detalle2.insertrow(0)
			idw_detalle8.reset()
			idw_detalle8.insertrow(0)
		end if		
		
	elseif ls_destino='E' then //otros parques
		ll_num_des	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'numero_origen')
		if ll_num_des>0 then
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'rut_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'rut_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'dv_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'dv_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nombre_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'nombre_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_pat_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'apellido_pat_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_mat_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'apellido_mat_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'estado_sepultura_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'estado_sepultura_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'tipo_via_destino_titular',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'tipo_via_origen_titular'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'direccion_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'direccion_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nro_direc_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'nro_direc_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'depto_direc_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'dpto_direc_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'block_direc_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'block_direc_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_ciudad_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'cod_ciudad_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_comuna_titular_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'cod_comuna_titular_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_parque_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'cod_parque_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'base_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'base_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'serie_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'serie_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'numero_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'numero_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'fecha_contrato_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(ll_fila,'fecha_contrato_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'sector_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'sector_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'sepultura_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'sepultura_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nivel_sepultura_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'nivel_sepultura_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'capacidad_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'capacidad_origen'))
			ls_base_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'base_destino')
			ls_serie_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'serie_destino')
			ll_numero_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'numero_destino')
			if ls_base_destino='O' then
				SELECT	"OFERTA_V"."TIPO_CONS"  
				INTO 		:ls_tipo_cons  
				FROM 		"CADENA",   
							"OFERTA_V"  
				WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
						 (("CADENA"."CODIGO" = :ls_base_destino ) AND  
						 ( "OFERTA_V"."SERIE" = :ls_serie_destino ) AND  
						 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_destino ) )   
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					ls_tipo_cons	= 'T'
				end if
			else
				ls_tipo_cons		= 'T'
			end if
			if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
			ll_cap_origen		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber( tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad_destino')
			ll_cod_parque_ori	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber( tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino')
			if ll_cap_origen > 0 and ll_cod_parque_ori > 0 then
				if idw_detalle12.retrieve(ll_cap_origen,ll_cod_parque_ori,ls_tipo_cons)=0 then
					idw_detalle12.insertrow(0)
				end if
			end if
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'estado_contrato_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'estado_contrato_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'numero_tecnico_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'numero_tecnico_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'observaciones_destino',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'observaciones_origen'))
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'rut_titular_origen',ll_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'dv_titular_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nombre_titular_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_pat_titular_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_mat_titular_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'estado_sepultura_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'tipo_via_origen_titular',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'direccion_titular_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nro_direc_titular_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'dpto_direc_titular_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'block_direc_titular_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_ciudad_titular_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_comuna_titular_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_parque_origen',ll_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'base_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'serie_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'numero_origen',ll_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'fecha_contrato_origen',ldt_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nivel_sepultura_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'capacidad_origen',ll_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'estado_contrato_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'numero_tecnico_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'observaciones_origen',ls_nulo)
			tab_1.tabpage_3.dw_ficha_sepult.accepttext()
			ll_cod_parque	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'cod_parque_destino')
			ls_sector			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'sector_destino')
			ls_base			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'base_destino')
			ls_ciudad			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'cod_ciudad_titular_destino')
			idw_detalle4.retrieve(ll_cod_parque)
			idw_detalle6.retrieve(ll_cod_parque,ls_sector)
			idw_detalle2.retrieve(ls_base)
			idw_detalle8.retrieve(ls_ciudad)
			
			idw_detalle3.reset()
			idw_detalle3.insertrow(0)
			idw_detalle5.reset()
			idw_detalle5.insertrow(0)
			idw_detalle.reset()
			idw_detalle.insertrow(0)
			idw_detalle7.reset()
			idw_detalle7.insertrow(0)
		end if		
	end if
end if
end subroutine

public subroutine wf_setear_datos ();Long		ll_tot_reg,ll_indi,ll_rut_fall,ll_funeraria,ll_anno_pase,ll_comprobante,ll_comprobante_des,ll_hora_def,ll_min_def,ll_edad_fall,ll_sw_derecho_sepult,ll_sw_pago_1,&
			ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_liberado,ll_sw_tit_fall,ll_sw_pago_5,ll_sw_pase_sepultacion,ll_sw_pase_sepult,ll_sw_pago_6,&
			ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6,ll_sw_condolencia
Double	ll_numero_ori
String		ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_cod_est_fall,ls_fono_funera,ls_reg_civil_pase,ls_nro_inscrip_pase,ls_nro_registro_pase,ls_obs_pase,ls_parentesco,&
			ls_obs_ori,ls_obs_ori_des,ls_sexo_fall,ls_periodo_nac,ls_tamano,ls_obs_fall,ls_obs_cuerpo,ls_cod_est_ctto_ori,ls_base_ori,ls_serie_ori,ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,&
			ls_pago_5,ls_pago_6,ls_pago_d1,ls_pago_d2,ls_pago_d3,ls_pago_d4,ls_pago_d5,ls_pago_d6,ls_dscto_1,ls_dscto_2,ls_dscto_3,ls_dscto_4,ls_dscto_5,ls_dscto_6,ls_dscto_d1,&
			ls_dscto_d2,ls_dscto_d3,ls_dscto_d4,ls_dscto_d5,ls_dscto_d6
datetime	ldt_fec_pase,ldt_fec_nac_fall,ldt_fecha_defuncion
Double	ldb_monto_canc,ldb_monto_canc_des,ldb_der_ori,ldb_pago_1,ldb_pago_2,ldb_pago_3,ldb_pago_4,ldb_der_des,ldb_uf_dia,ldb_pago_5,ldb_otros_pag_des,ldb_pago_6,&
			ldb_pago_d1,ldb_pago_d2,ldb_pago_d3,ldb_pago_d4,ldb_pago_d5,ldb_pago_d6,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,ldb_dscto_d1,&
			ldb_dscto_d2,ldb_dscto_d3,ldb_dscto_d4,ldb_dscto_d5,ldb_dscto_d6,ll_llave_fallecido

tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_4.dw_aranceles.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
ll_tot_reg						= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_cod_est_ctto_ori		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'estado_contrato_origen')
	ls_base_ori					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'base_origen')
	ls_serie_ori					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'serie_origen')
	ll_numero_ori				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'numero_origen')
	if not isnull(ls_base_ori) and not isnull(ls_serie_ori) and isnull(ls_cod_est_ctto_ori) and ll_numero_ori>0 then
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_contrato_origen','E')
	end if

	ls_cod_est_ctto_ori		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'estado_contrato_destino')
	ls_base_ori					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'base_destino')
	ls_serie_ori					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'serie_destino')
	ll_numero_ori				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'numero_destino')
	if not isnull(ls_base_ori) and not isnull(ls_serie_ori) and isnull(ls_cod_est_ctto_ori) and ll_numero_ori>0 then
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_contrato_destino','E')
	end if
	
	ll_edad_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'edad_fallecido')
	ldt_fec_nac_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_nacimiento_fallecido')
	ldt_fecha_defuncion		= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_defuncion')
	ls_sexo_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'sexo_fallecido')
	ll_rut_fall						= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'rut_fallecido')
	ls_dv_fall						= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'dv_fallecido')
	ls_nombre_fall		 		= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'nombre_fallecido'))
	ls_ap_pat_fall		 		= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'apellido_paterno_fall'))
	ls_ap_mat_fall		 		= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'apellido_materno_fall'))
	ls_cod_est_fall   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_estado_fallecido')
	ll_sw_tit_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sw_titular_fall')
	ll_sw_pase_sepult			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sw_pase_sepultacion')
	
	ll_sw_condolencia			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sw_condolencia')
	if isnull(ll_sw_condolencia) then ll_sw_condolencia=1
	ll_funeraria					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'codigo_funeraria')
	ls_fono_funera				= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'fono_funeraria'))
	ls_reg_civil_pase   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_registro_pase')
	ls_nro_inscrip_pase  		= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'inscripcion_pase'))
	ls_nro_registro_pase 		= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'registro_pase'))
	ldt_fec_pase	   			= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_pase')
	ll_anno_pase				= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'anno_paso')
	ls_obs_pase					= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'pase_sepultacion'))
	ls_periodo_nac				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'periodo_nacimiento')
	ls_tamano					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_tamano_cuerpo')
	ls_obs_fall					= TRIM(tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'observacion_fallecido'))
	ll_sw_pase_sepultacion	= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sw_pase_sepultacion')
	ls_obs_cuerpo				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_obs_cuerpo')
	ll_llave_fallecido			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'llave_fallecido')
	//ARANCELES//
	ls_parentesco        		= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'codigo_parentesco')
	
	
	ldb_monto_canc       		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar_origen')
	ll_comprobante       		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'boleta_nro_origen')
	ls_obs_ori					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'obs_origen_arancel')
	ldb_uf_dia					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'uf_dia')
	ll_sw_derecho_sepult		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_derecho_sepult')
	ll_sw_pago_liberado		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_liberado')
	ll_sw_pago_1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_1')
	ll_sw_pago_2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_2')
	ll_sw_pago_3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_3')
	ll_sw_pago_4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_4')
	ll_sw_pago_5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_5')
	ll_sw_pago_6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_6')
	ldb_der_ori					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'derecho_sepultacion_origen')
	ldb_pago_1					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_1')
	ldb_pago_2					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_2')
	ldb_pago_3					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_3')
	ldb_pago_4					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_4')
	ldb_pago_5					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_5')
	ldb_pago_6					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_6')
	ls_pago_1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_1')
	ls_pago_2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_2')
	ls_pago_3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_3')
	ls_pago_4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_4')
	ls_pago_5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_5')
	ls_pago_6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_6')
	ldb_pago_d1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d1')
	ldb_pago_d2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d2')
	ldb_pago_d3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d3')
	ldb_pago_d4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d4')
	ldb_pago_d5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d5')
	ldb_pago_d6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d6')
	ls_pago_d1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d1')
	ls_pago_d2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d2')
	ls_pago_d3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d3')
	ls_pago_d4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d4')
	ls_pago_d5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d5')
	ls_pago_d6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d6')
	ldb_der_des					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'derecho_sepultacion_destino')
	
	ll_sw_dscto_1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_1')
	ll_sw_dscto_2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_2')
	ll_sw_dscto_3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_3')
	ll_sw_dscto_4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_4')
	ll_sw_dscto_5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_5')
	ll_sw_dscto_6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_6')
	ldb_dscto_1					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_1')
	ldb_dscto_2					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_2')
	ldb_dscto_3					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_3')
	ldb_dscto_4					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_4')
	ldb_dscto_5					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_5')
	ldb_dscto_6					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_6')
	ls_dscto_1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_1')
	ls_dscto_2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_2')
	ls_dscto_3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_3')
	ls_dscto_4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_4')
	ls_dscto_5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_5')
	ls_dscto_6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_6')
	ldb_dscto_d1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d1')
	ldb_dscto_d2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d2')
	ldb_dscto_d3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d3')
	ldb_dscto_d4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d4')
	ldb_dscto_d5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d5')
	ldb_dscto_d6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d6')
	ls_dscto_d1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d1')
	ls_dscto_d2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d2')
	ls_dscto_d3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d3')
	ls_dscto_d4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d4')
	ls_dscto_d5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d5')
	ls_dscto_d6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d6')
	
	ldb_monto_canc_des   	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar_destino')
	ll_comprobante_des  		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'boleta_nro_destino')
	ls_obs_ori_des				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'obs_destino_arancel')
	if isnull( tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'base_destino') ) then 
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'base_destino', tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'base_origen'))
	end if
	// Fallecido
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'edad_fallecido',ll_edad_fall)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'fecha_nacimiento_fallecido',ldt_fec_nac_fall)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'fecha_defuncion',ldt_fecha_defuncion)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sexo_fallecido',ls_sexo_fall)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'rut_fallecido',ll_rut_fall)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dv_fallecido',ls_dv_fall)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'nombre_fallecido',ls_nombre_fall)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'apellido_paterno_fall',ls_ap_pat_fall)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'apellido_materno_fall',ls_ap_mat_fall)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'cod_estado_fallecido',ls_cod_est_fall)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_titular_fall',ll_sw_tit_fall)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_pase_sepultacion',ll_sw_pase_sepult)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_condolencia',ll_sw_condolencia)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'codigo_funeraria',ll_funeraria)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'fono_funeraria',ls_fono_funera)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'cod_registro_pase',ls_reg_civil_pase)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'inscripcion_pase',ls_nro_inscrip_pase)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'registro_pase',ls_nro_registro_pase)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'fecha_pase',ldt_fec_pase)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'anno_paso',ll_anno_pase)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pase_sepultacion',ls_obs_pase)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'llave_fallecido',ll_llave_fallecido)
	//ARANCELES//
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'codigo_parentesco',ls_parentesco)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'derecho_sepultacion_origen',ldb_der_ori)
	
	
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_pago_1',ll_sw_pago_1)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_pago_2',ll_sw_pago_2)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_pago_3',ll_sw_pago_3)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_pago_4',ll_sw_pago_4)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_pago_5',ll_sw_pago_5)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_pago_6',ll_sw_pago_6)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_1',ldb_pago_1)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_2',ldb_pago_2)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_3',ldb_pago_3)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_4',ldb_pago_4)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_5',ldb_pago_5)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_6',ldb_pago_6)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_1',ls_pago_1)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_2',ls_pago_2)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_3',ls_pago_3)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_4',ls_pago_4)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_5',ls_pago_5)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_6',ls_pago_6)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_1',ldb_dscto_1)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_2',ldb_dscto_2)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_3',ldb_dscto_3)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_4',ldb_dscto_4)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_5',ldb_dscto_5)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_6',ldb_dscto_6)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_1',ls_dscto_1)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_2',ls_dscto_2)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_3',ls_dscto_3)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_4',ls_dscto_4)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_5',ls_dscto_5)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_6',ls_dscto_6)
	
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_dscto_1',ll_sw_dscto_1)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_dscto_2',ll_sw_dscto_2)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_dscto_3',ll_sw_dscto_3)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_dscto_4',ll_sw_dscto_4)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_dscto_5',ll_sw_dscto_5)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'sw_dscto_6',ll_sw_dscto_6)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_d1',ldb_pago_d1)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_d2',ldb_pago_d2)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_d3',ldb_pago_d3)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_d4',ldb_pago_d4)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_d5',ldb_pago_d5)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_otro_d6',ldb_pago_d6)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_d1',ls_pago_d1)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_d2',ls_pago_d2)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_d3',ls_pago_d3)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_d4',ls_pago_d4)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_d5',ls_pago_d5)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'pago_otro_d6',ls_pago_d6)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_d1',ldb_dscto_d1)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_d2',ldb_dscto_d2)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_d3',ldb_dscto_d3)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_d4',ldb_dscto_d4)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_d5',ldb_dscto_d5)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_dscto_d6',ldb_dscto_d6)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_d1',ls_dscto_d1)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_d2',ls_dscto_d2)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_d3',ls_dscto_d3)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_d4',ls_dscto_d4)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_d5',ls_dscto_d5)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dscto_otro_d6',ls_dscto_d6)
	
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_cancelar_origen',ldb_monto_canc)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'boleta_nro_origen',ll_comprobante)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'obs_origen_arancel',ls_obs_ori)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'derecho_sepultacion_destino',ldb_der_des)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'monto_cancelar_destino',ldb_monto_canc_des)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'boleta_nro_destino',ll_comprobante_des)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'obs_destino_arancel',ls_obs_ori_des)
	tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'uf_dia',ldb_uf_dia)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_derecho_sepult',ll_sw_derecho_sepult)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_1',ll_sw_pago_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_2',ll_sw_pago_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_3',ll_sw_pago_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_4',ll_sw_pago_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_5',ll_sw_pago_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_6',ll_sw_pago_6)
	
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_1',ll_sw_dscto_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_2',ll_sw_dscto_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_3',ll_sw_dscto_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_4',ll_sw_dscto_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_5',ll_sw_dscto_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_dscto_6',ll_sw_dscto_6)
	
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pago_liberado',ll_sw_pago_liberado)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'periodo_nacimiento',ls_periodo_nac)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_tamano_cuerpo',ls_tamano)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_fallecido',ls_obs_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'otros_pagos_destino',ldb_otros_pag_des)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_pase_sepultacion',ll_sw_pase_sepultacion)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_obs_cuerpo',ls_obs_cuerpo)
	
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'nombre_fallecido',ls_nombre_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'apellido_paterno_fall',ls_ap_pat_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'apellido_materno_fall',ls_ap_mat_fall)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'fono_funeraria',ls_fono_funera)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'inscripcion_pase',ls_nro_inscrip_pase)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'registro_pase',ls_nro_registro_pase)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'pase_sepultacion',ls_obs_pase)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'observacion_fallecido',ls_obs_fall)
next
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_4.dw_aranceles.accepttext()
end subroutine

public subroutine wf_tipo_traslado (string as_tipo_traslado, long al_fila);Double	ll_num_des,ll_num_origen,ll_numero_destino
Long		ll_nulo
String		ls_base_destino,ls_serie_destino,ls_tipo_cons,ls_nulo
Datetime	ldt_nulo

Setnull(ll_nulo);Setnull(ls_nulo);Setnull(ldt_nulo)
if as_tipo_traslado='I' then
	ll_num_des		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'numero_destino')
	ll_num_origen	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'numero_origen')
	if ll_num_des>0 and (ll_num_origen=0 or isnull(ll_num_origen)) then
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'rut_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'rut_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'dv_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'dv_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'nombre_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'nombre_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'apellido_pat_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'apellido_pat_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'apellido_mat_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'apellido_mat_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'estado_sepultura_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'estado_sepultura_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'tipo_via_origen_titular',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'tipo_via_destino_titular'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'direccion_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'direccion_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'nro_direc_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'nro_direc_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'dpto_direc_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'depto_direc_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'block_direc_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'block_direc_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'cod_ciudad_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'cod_ciudad_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'cod_comuna_titular_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'cod_comuna_titular_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'cod_parque_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'cod_parque_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'base_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'base_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'serie_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'serie_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'numero_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'numero_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'fecha_contrato_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(al_fila,'fecha_contrato_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'sector_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'sector_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'sepultura_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'sepultura_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'nivel_sepultura_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'nivel_sepultura_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'capacidad_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'capacidad_destino'))
		ls_base_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'base_destino')
		ls_serie_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'serie_destino')
		ll_numero_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'numero_destino')
		if ls_base_destino='O' then
			SELECT	"OFERTA_V"."TIPO_CONS"  
			INTO 		:ls_tipo_cons  
			FROM 		"CADENA",   
						"OFERTA_V"  
			WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = :ls_base_destino ) AND  
					 ( "OFERTA_V"."SERIE" = :ls_serie_destino ) AND  
					 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_destino ) )   
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				ls_tipo_cons	= 'T'
			end if
		else
			ls_tipo_cons		= 'T'
		end if
		if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
		if idw_detalle11.retrieve(tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'capacidad_destino'),tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'cod_parque_destino'),ls_tipo_cons)=0 then
			idw_detalle11.insertrow(0)
		end if
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'estado_contrato_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'estado_contrato_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'numero_tecnico_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'numero_tecnico_destino'))
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'observaciones_origen',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(al_fila,'observaciones_destino'))
		
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'rut_titular_destino',ll_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'dv_titular_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'nombre_titular_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'apellido_pat_titular_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'apellido_mat_titular_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'estado_sepultura_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'tipo_via_destino_titular',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'direccion_titular_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'nro_direc_titular_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'depto_direc_titular_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'block_direc_titular_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'cod_ciudad_titular_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'cod_comuna_titular_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'cod_parque_destino',ll_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'base_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'serie_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'numero_destino',ll_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'fecha_contrato_destino',ldt_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'sector_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'sepultura_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'nivel_sepultura_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'capacidad_destino',ll_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'estado_contrato_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'numero_tecnico_destino',ls_nulo)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(al_fila,'observaciones_destino',ls_nulo)
	end if		
end if	
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
end subroutine

public subroutine wf_valida_destino ();String		ls_base,ls_serie,ls_sector_sepult,ls_nro_sepultura,ls_estado_ctto,ls_nro_tecnico,&
			ls_dv_titular,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,ls_cod_tipo_via,ls_direccion_p,&
			ls_nro_part,ls_depto_part,ls_block_part,ls_pob_part,ls_sector_part,ls_comuna_part,&
			ls_ciudad_part,ls_fono_part,ls_parque,ls_cod_age_aux,ls_descrip_estado,ls_base_aux,ls_serie_aux,&
			ls_pasa,ls_sector,ls_sepultura,ls_base_destino,ls_serie_destino,ls_tipo_cons
Long		ll_count_fall,ll_cod_parque,ll_capacidad,ll_mora_cred,ll_mora_mant,ll_rut_titular,&
			ll_resp,ll_parque_aux,ll_parque_cons,ll_nulo
datetime	ldt_fecha_ctto
Double	ll_numero,ll_numero_aux,ll_numero_destino
Setnull(ll_nulo)
ls_base			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'base_destino')
if not isnull(ls_base) then
	idw_detalle2.retrieve(ls_base)
end if
ls_serie			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'serie_destino')
ll_numero		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'numero_destino')
ll_parque_cons	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque_destino')
ls_sector			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector_destino')
ls_sepultura		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sepultura_destino')
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ll_numero>0 then
	if ls_base='O' then
		SELECT	"INVENTARIO_PLANI"."BASE",	"INVENTARIO_PLANI"."SERIE",	"INVENTARIO_PLANI"."NUMERO"
		INTO 		:ls_base_aux,					:ls_serie_aux,						:ll_numero_aux  
		FROM 		"INVENTARIO_PLANI"  
		WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_parque_cons ) AND  
				 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
				 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura )   
		USING		sqlca;
		if sqlca.sqlcode=0 and ll_numero_aux <> 10000000 then
			ls_pasa	= 'S'
		else
			if ll_numero_aux = 10000000 then
				SELECT	"INVENTARIO_PLANI_CONST"."CAPACIDAD",	"INVENTARIO_PLANI_CONST"."NUMERO_TEC"  
				INTO 		:ll_capacidad,									:ls_nro_tecnico  
				FROM 		"INVENTARIO_PLANI_CONST"  
				WHERE  ( "INVENTARIO_PLANI_CONST"."SECTOR" = :ls_sector ) AND  
						 ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :ls_sepultura ) AND  
						 ( "INVENTARIO_PLANI_CONST"."BASE" = :ls_base ) AND  
						 ( "INVENTARIO_PLANI_CONST"."SERIE" = :ls_serie ) AND  
						 ( "INVENTARIO_PLANI_CONST"."NUMERO" = :ll_numero ) AND  
						 ( "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :ll_parque_cons )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_pasa	= 'S'
				else
					SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO"  
					INTO 		:ls_base,							:ls_serie,							:ll_numero  
					FROM 		"RESERVA_SEPULTURA"  
					WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
							 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
							 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
							 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_parque_cons ) AND  
							 ( "RESERVA_SEPULTURA"."BASE" = :ls_base )   AND
							 ( "RESERVA_SEPULTURA"."SERIE" = :ls_serie )   AND
							 ( "RESERVA_SEPULTURA"."NUMERO" = :ll_numero ) 
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_pasa	= 'S'
					else
						messagebox("Advertencia","Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" No Tiene Reserva")
						ls_pasa	= 'N'
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_destino',ll_nulo)
						tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						tab_1.tabpage_3.dw_ficha_sepult.setfocus()
						tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_destino')
					end if
				end if
			else
				ls_pasa			= 'S'
			end if
		end if
		if ls_pasa='S' then
			SELECT	COUNT("FALLECIDOS"."LLAVE")  
			INTO 		:ll_count_fall  
			FROM 		"FALLECIDOS"  
			WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
					 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
					 ( "FALLECIDOS"."CONTRATO" = :ll_numero )  AND
					 ( "FALLECIDOS"."EST" = 'CC' )  AND
					( "FALLECIDOS"."ESTADO_REG" = 'A' );
			if isnull(ll_count_fall) then ll_count_fall=0
	
			SELECT	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."COD_PARQUE",	"PAGO_OFERTA"."CAPACIDAD",	"CADENA"."ESTADO",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"PAGO_OFERTA"."NRO_TECNICO",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA" 
			INTO 		:ls_sector_sepult,		:ls_nro_sepultura,			:ll_cod_parque,			:ll_capacidad, 				:ls_estado_ctto,		:ll_mora_cred,					:ll_mora_mant,					:ls_nro_tecnico,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto
			FROM 		"CADENA",   "CADENA_MORA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
			WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
					 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
					 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
					 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = 'O' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado_ctto='V' or ls_estado_ctto='C' then
					if tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino')=ll_cod_parque or &
						isnull(tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino')) then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino',ll_cod_parque)
					else
						SELECT 	"COD_PARQ"."NOMBRE"  
						INTO 		:ls_parque  
						FROM 	"COD_PARQ"  
						WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
						USING	sqlca;	
						ll_resp	= messagebox("Advertencia","Parque Inválido, Promesa Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino',ll_cod_parque)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque_destino')
						end if
					end if
					
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino')=ls_sector_sepult or &
						isnull(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino')) then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino',ls_sector_sepult)
					else
						ll_resp	= messagebox("Advertencia","Sector Inválido, Promesa Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino',ls_sector_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector_destino')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_destino')=ls_nro_sepultura or &
						isnull(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_destino')) then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_destino',ls_nro_sepultura)
					else
						ll_resp	= messagebox("Advertencia","Sepultura Inválida, Promesa Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_destino',ls_nro_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura_destino')
						end if
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico_destino',ls_nro_tecnico)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_contrato_destino',ls_estado_ctto)
					if (ll_capacidad - ll_count_fall)=0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_destino','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_destino','N')
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad_destino',ll_capacidad)
					ls_base_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base_destino')
					ls_serie_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie_destino')
					ll_numero_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_destino')
					if ls_base_destino='O' then
						SELECT	"OFERTA_V"."TIPO_CONS"  
						INTO 		:ls_tipo_cons  
						FROM 		"CADENA",   
									"OFERTA_V"  
						WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								 (("CADENA"."CODIGO" = :ls_base_destino ) AND  
								 ( "OFERTA_V"."SERIE" = :ls_serie_destino ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_destino ) )   
						USING		sqlca;
						if sqlca.sqlcode<>0 then
							ls_tipo_cons	= 'T'
						end if
					else
						ls_tipo_cons		= 'T'
					end if
					if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
					if idw_detalle12.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
						idw_detalle12.insertrow(0)
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'rut_titular_destino',ll_rut_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'dv_titular_destino',ls_dv_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nombre_titular_destino',ls_nom_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'apellido_pat_titular_destino',ls_ap_pat_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'apellido_mat_titular_destino',ls_ap_mat_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'tipo_via_destino_titular',ls_cod_tipo_via)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'direccion_titular_destino',ls_direccion_p)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nro_direc_titular_destino',ls_nro_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'depto_direc_titular_destino',ls_depto_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'block_direc_titular_destino',ls_block_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'poblacion_villa_destino',ls_pob_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_titular_destino',ls_sector_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_ciudad_titular_destino',ls_ciudad_part)
					idw_detalle8.retrieve(ls_ciudad_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_comuna_titular_destino',ls_comuna_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fono_titular_destino',ls_fono_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_contrato_destino',ldt_fecha_ctto)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'mora_mant_destino',ll_mora_mant)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'mora_cred_destino',ll_mora_cred)
					if ll_mora_cred>0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_credito_destino','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_credito_destino','N')
					end if
					if ll_mora_mant>0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_mantencion_destino','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_mantencion_destino','N')
					end if
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
				else
					SELECT	"ESTADO"."NOMBRE_ESTADO"  
					INTO 		:ls_descrip_estado  
					FROM 		"ESTADO"  
					WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_ctto   ;
					messagebox("Advertencia","Recuerde Contrato Destino "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" Estado Actual es "+ls_descrip_estado+" debe estar VIGENTE o CANCELADO, regularice en Depto. Atención Cliente")
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
				end if
			else
				SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
				INTO 		:ll_parque_aux,				:ls_cod_age_aux  
				FROM 		"CD_FOLIO"  
				WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
						 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
//					if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
//						messagebox("Advertencia","Este Contrato Destino NO tiene Agente Asignado")
//						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
//					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','S')
//					end if
				else
					messagebox("Advertencia","Contrato No Existe en Control Documentario")
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
				end if
			end if
		end if
		
	elseif ls_base='C' then
		SELECT	"INVENTARIO_PLANI"."BASE",	"INVENTARIO_PLANI"."SERIE",	"INVENTARIO_PLANI"."NUMERO"
		INTO 		:ls_base_aux,					:ls_serie_aux,						:ll_numero_aux  
		FROM 		"INVENTARIO_PLANI"  
		WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_parque_cons ) AND  
				 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
				 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura )   
		USING		sqlca;
		if sqlca.sqlcode=0 and ll_numero_aux <> 10000000 then
			ls_pasa	= 'S'
		else
			if ll_numero_aux = 10000000 then
				SELECT	"INVENTARIO_PLANI_CONST"."CAPACIDAD",	"INVENTARIO_PLANI_CONST"."NUMERO_TEC"  
				INTO 		:ll_capacidad,									:ls_nro_tecnico  
				FROM 		"INVENTARIO_PLANI_CONST"  
				WHERE  ( "INVENTARIO_PLANI_CONST"."SECTOR" = :ls_sector ) AND  
						 ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :ls_sepultura ) AND  
						 ( "INVENTARIO_PLANI_CONST"."BASE" = :ls_base ) AND  
						 ( "INVENTARIO_PLANI_CONST"."SERIE" = :ls_serie ) AND  
						 ( "INVENTARIO_PLANI_CONST"."NUMERO" = :ll_numero ) AND  
						 ( "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :ll_parque_cons )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_pasa	= 'S'
				else
					SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO"  
					INTO 		:ls_base,							:ls_serie,							:ll_numero  
					FROM 		"RESERVA_SEPULTURA"  
					WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
							 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
							 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
							 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_parque_cons ) AND  
							 ( "RESERVA_SEPULTURA"."BASE" = :ls_base )   AND
							 ( "RESERVA_SEPULTURA"."SERIE" = :ls_serie )   AND
							 ( "RESERVA_SEPULTURA"."NUMERO" = :ll_numero ) 
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_pasa	= 'S'
					else
						messagebox("Advertencia","Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" No Tiene Reserva")
						ls_pasa	= 'N'
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_destino',ll_nulo)
						tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						tab_1.tabpage_3.dw_ficha_sepult.setfocus()
						tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_destino')
					end if
				end if
			else
				ls_pasa			= 'S'
			end if
		end if
		if ls_pasa='S' then
			SELECT	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."CAPACIDAD",	"CONTRATO"."NRO_TEC",	"CONTRATO"."FECHA"  
			INTO 		:ls_estado_ctto,		:ll_cod_parque,			:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part  ,		:ls_sector_sepult,	:ls_nro_sepultura,		:ll_capacidad, 			:ls_nro_tecnico,			:ldt_fecha_ctto			
			FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
			WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO" = 'C' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado_ctto='V' or ls_estado_ctto='C' then
					if tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino')=ll_cod_parque or &
						isnull(tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino')) then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino',ll_cod_parque)
					else
						SELECT 	"COD_PARQ"."NOMBRE"  
						INTO 		:ls_parque  
						FROM 	"COD_PARQ"  
						WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
						USING	sqlca;	
						ll_resp	= messagebox("Advertencia","Parque Inválido, Contrato IsaCruz Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino',ll_cod_parque)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque_destino')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino')=ls_sector_sepult or &
						isnull(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino')) then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino',ls_sector_sepult)
					else
						ll_resp	= messagebox("Advertencia","Sector Inválido, Contrato IsaCruz Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino',ls_sector_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector_destino')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_destino')=ls_nro_sepultura or &
						isnull(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_destino')) then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_destino',ls_nro_sepultura)
					else
						ll_resp	= messagebox("Advertencia","Sepultura Inválida, Contrato IsaCruz Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_destino',ls_nro_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura_destino')
						end if
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico_destino',ls_nro_tecnico)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_contrato_destino',ls_estado_ctto)
					if (ll_capacidad - ll_count_fall)=0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_destino','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_destino','N')
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad_destino',ll_capacidad)
					ls_base_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base_destino')
					ls_serie_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie_destino')
					ll_numero_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_destino')
					if ls_base_destino='O' then
						SELECT	"OFERTA_V"."TIPO_CONS"  
						INTO 		:ls_tipo_cons  
						FROM 		"CADENA",   
									"OFERTA_V"  
						WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								 (("CADENA"."CODIGO" = :ls_base_destino ) AND  
								 ( "OFERTA_V"."SERIE" = :ls_serie_destino ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_destino ) )   
						USING		sqlca;
						if sqlca.sqlcode<>0 then
							ls_tipo_cons	= 'T'
						end if
					else
						ls_tipo_cons		= 'T'
					end if
					if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
					if idw_detalle12.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
						idw_detalle12.insertrow(0)
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'rut_titular_destino',ll_rut_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'dv_titular_destino',ls_dv_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nombre_titular_destino',ls_nom_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'apellido_pat_titular_destino',ls_ap_pat_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'apellido_mat_titular_destino',ls_ap_mat_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'tipo_via_destino_titular',ls_cod_tipo_via)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'direccion_titular_destino',ls_direccion_p)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nro_direc_titular_destino',ls_nro_part) 
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'depto_direc_titular_destino',ls_depto_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'block_direc_titular_destino',ls_block_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'poblacion_villa_destino',ls_pob_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_titular_destino',ls_sector_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_ciudad_titular_destino',ls_ciudad_part)
					idw_detalle8.retrieve(ls_ciudad_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_comuna_titular_destino',ls_comuna_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fono_titular_destino',ls_fono_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_contrato_destino',ldt_fecha_ctto)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'mora_mant_destino',ll_mora_mant)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'mora_cred_destino',0)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_credito_destino','N')
					if ll_mora_mant>0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_mantencion_destino','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_mantencion_destino','N')
					end if
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
				else
					SELECT	"ESTADO"."NOMBRE_ESTADO"  
					INTO 		:ls_descrip_estado  
					FROM 		"ESTADO"  
					WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_ctto   ;
					messagebox("Advertencia","Recuerde Contrato Destino "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" Estado Actual es "+ls_descrip_estado+" debe estar VIGENTE o CANCELADO, regularice en Depto. Atención Cliente")
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
				end if
			else
				messagebox("Advertencia","Contrato Destino No Existe en Control Documentario")
				tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
			end if
		end if
	end if
end if
end subroutine

public function string wf_validar ();string   	ls_sw='S',ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_direc_fall,ls_dpto_dir_fall,ls_block_dir_fall,ls_sector_fall,ls_villa_fall,ls_ciud_fall,ls_comu_fall,ls_cod_est_fall,ls_causa_fall,&
			ls_num_dir_fall,ls_dv_tit_ori,ls_nombre_tit_ori,ls_ap_pat_tit_ori,ls_ap_mat_tit_ori,ls_dir_tit_ori,ls_nro_dir_tit_ori,ls_dep_tit_ori,ls_block_tit_ori,ls_sector_tit_ori,ls_villa_tit_ori,&
			ls_ciudad_tit_ori,ls_comuna_tit_ori,ls_base,ls_serie,ls_estad_contrato,ls_sector,ls_sepultura,ls_numero_tecni,ls_nivel,ls_est_sep_compl,ls_obs_sep_comp,ls_obs_credito,ls_obs_manten,ls_fono_titular,ls_ejecutivo,&
			ls_fono_funera,ls_pase_sepult,ls_tipo_via_tit_ori,ls_parentesco,ls_sector1,ls_sepultura1,ls_dv_tit_des,ls_tipo_via_tit_des,ls_dir_tit_des,ls_nro_dir_tit_des,ls_dep_tit_des,ls_block_tit_des,&
			ls_ciudad_tit_des,ls_comuna_tit_des,ls_base_des,ls_serie_des,ls_estad_contrato_des,ls_numero_tecni_des,ls_nivel_des,ls_est_sep_compl_des,ls_obs_sep_comp_des,ls_reg_civil_pase,ls_nro_inscrip_pase,&
			ls_nro_registro_pase,ls_obs_pase,ls_obs_ori,ls_obs_ori_des,ls_tipo_traslado,ls_usuario,ls_estado_reg,ls_estado_doc1,ls_estado_doc2,ls_cod_age_aux,ls_estado_ctto,ls_tamano,ls_obs_fall,ls_destino
long 		ll_rut_fall,ret,ll_rut_tit_ori,ll_hora_sepult,ll_minuto_sepult,ll_funeraria,ll_parque,ll_capacidad,ll_cant_sepultados,ll_cap_libre_sep,ll_sw_otros_pagos,ll_est_credito,ll_est_manten,&
			ll_count,ll_hora_hoy,ll_minutos_hoy,ll_edad_fall,ll_comprobante,ll_tot_reg,ll_indi,ll_corr_interno,ll_parque1,ll_rut_tit_des,ll_parque_des,ll_anno_pase,ll_comprobante_des,ll_corr,&
			ll_parque_aux,ll_cod_parque_ori
Datetime	ldt_fec_defun,ldt_fec_nac,ldt_fech_sepult,ldt_fech_contrato,ldt_fech_recep,ldt_fecha_hoy,ldt_fecha_sepult1,ldt_fech_contrato_des,ldt_fech_recep_des,ldt_fec_pase
Double	ldb_uf_dia,ldb_der_sepult_uf,ldb_mov_sarcofago,ldb_cambio_ubica,ldb_reduccion,ldb_cert_defuncion,ldb_monto_canc,ldb_monto_canc_des,ldb_valor_uf_dia,ldb_otros_pagos_ori,ll_numero,ll_numero_des

SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
ll_hora_hoy					= long(string(gdt_fec_sistema,'hh'))
ll_minutos_hoy				= long(string(gdt_fec_sistema,'mm'))
if is_usuario_esta='S' then
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'fecha_recepcion',ldt_fecha_hoy)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'hora_recepcion',ll_hora_hoy)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'minuto_recepcion',ll_minutos_hoy)
end if
ll_parque1					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
ls_sector1					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector_origen')
ls_sepultura1				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sepultura_origen')
ldt_fecha_sepult1			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(1,'fecha_traslado')
tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
tab_1.tabpage_4.dw_aranceles.accepttext()
//DATOS FALLECIDO//
ll_tot_reg					= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_estado_reg	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'estado_reg')
	if isnull(ls_estado_reg) or ls_estado_reg='' then
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_reg','P')
	end if
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sector_origen',ls_sector1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sepultura_origen',ls_sepultura1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fecha_traslado',ldt_fecha_sepult1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'folio',ll_indi)
	ls_tipo_traslado			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'tipo_traslado')
	ls_destino					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'destino_parque')
	//ficha
	ls_ejecutivo        			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'codigo_ejecutivo')
	ll_parque						= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque')
	ls_sector						= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'sector_origen')
	ls_sepultura					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'sepultura_origen')
	ldt_fech_sepult   			= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_traslado')
	ll_hora_sepult    			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'hora_fijada')
	ll_minuto_sepult			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'minuto_fijada')
	ll_rut_tit_ori					= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'rut_titular_origen')
	ls_dv_tit_ori					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'dv_titular_origen')
	ls_tipo_via_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'tipo_via_origen_titular')
	ls_dir_tit_ori					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'direccion_titular_origen')
	ls_nro_dir_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nro_direc_titular_origen')
	ls_dep_tit_ori				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'dpto_direc_titular_origen')
	ls_block_tit_ori				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'block_direc_titular_origen')
	ls_ciudad_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_ciudad_titular_origen')
	ls_comuna_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_comuna_titular_origen')
	ll_cod_parque_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque_origen')
	ls_base						= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'base_origen')
	ls_serie						= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'serie_origen')
	ll_numero					= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'numero_origen')
	ldt_fech_contrato			= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_contrato_origen')
	ls_estad_contrato			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'estado_contrato_origen')
	ls_numero_tecni			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'numero_tecnico_origen')
//	ls_nivel						= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nivel_sepultura_origen')
	ls_est_sep_compl			= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'estado_sepultura_origen')
	ls_obs_sep_comp			= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'observaciones_origen')
	ll_rut_tit_des				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'rut_titular_destino')
	ls_dv_tit_des				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'dv_titular_destino')
	ls_tipo_via_tit_des			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'tipo_via_destino_titular')
	ls_dir_tit_des				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'direccion_titular_destino')
	ls_nro_dir_tit_des			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nro_direc_titular_destino')
	ls_dep_tit_des				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'depto_direc_titular_destino')
	ls_block_tit_des			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'block_direc_titular_destino')
	ls_ciudad_tit_des			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_ciudad_titular_destino')
	ls_comuna_tit_des			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_comuna_titular_destino')
	ll_parque_des				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque_destino')
	ls_base_des					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'base_destino')
	ls_serie_des					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'serie_destino')
	ll_numero_des				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'numero_destino')
	ldt_fech_contrato_des	= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_contrato_destino')
	ls_estad_contrato_des	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'estado_contrato_destino')
	ls_numero_tecni_des		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'numero_tecnico_destino')
	ls_nivel_des					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nivel_sepultura_destino')
	ls_est_sep_compl_des	= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'estado_sepultura_destino')
	ls_obs_sep_comp_des	= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'observaciones_destino')
	ldt_fech_recep_des		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_recepcion')
	ls_estado_ctto				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'c_existe_ctto')
	// Fallecido
	ll_rut_fall						= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'rut_fallecido')
	ls_dv_fall						= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'dv_fallecido')
	ls_nombre_fall		 		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'nombre_fallecido')
	ls_ap_pat_fall		 		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'apellido_paterno_fall')
	ls_ap_mat_fall		 		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'apellido_materno_fall')
	ls_cod_est_fall   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_estado_fallecido')
	ll_funeraria					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'codigo_funeraria')
	ls_fono_funera				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'fono_funeraria')
	ls_reg_civil_pase   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_registro_pase')
	ls_nro_inscrip_pase  		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'inscripcion_pase')
	ls_nro_registro_pase 		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'registro_pase')
	ldt_fec_pase	   			= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_pase')
	ll_anno_pase				= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'anno_paso')
	ls_obs_pase					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'pase_sepultacion')
	ls_tamano					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_tamano_cuerpo')
	ls_obs_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'observacion_fallecido')
	//ARANCELES//
	ls_parentesco        		= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'codigo_parentesco')
	ldb_monto_canc       		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar_origen')
	ll_comprobante       		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'boleta_nro_origen')
	ls_obs_ori					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'obs_origen_arancel')
	ldb_monto_canc_des   	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar_destino')
	ll_comprobante_des   	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'boleta_nro_destino')
	ls_obs_ori_des				= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'obs_destino_arancel')
	ll_sw_otros_pagos			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_otros_pagos')
	ldb_otros_pagos_ori		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'otros_pagos_origen')
	ls_estado_doc1				= 'N'
	ls_estado_doc2				= 'N'
	if isnull(ls_ejecutivo) then
		ls_ejecutivo		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'codigo_ejecutivo',ls_ejecutivo)
	end if
	if isnull(ll_hora_sepult) then
		ll_hora_sepult		= 0
		tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'hora_fijada',ll_hora_sepult)
	end if
	if isnull(ll_minuto_sepult) then
		ll_minuto_sepult	= 0
		tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'minuto_fijada',ll_minuto_sepult)
	end if
	if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
		if isnull(ll_rut_tit_des) then
			ll_rut_tit_des		= 0
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'rut_titular_destino',ll_rut_tit_des)
		end if
		if isnull(ls_dv_tit_des) then
			ls_dv_tit_des		= ''
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dv_titular_destino',ls_dv_tit_des)
		end if
		if isnull(ls_tipo_via_tit_des) then
			ls_tipo_via_tit_des	= '0'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'tipo_via_destino_titular',ls_tipo_via_tit_des)
		end if
		if isnull(ls_dir_tit_des) then
			ls_dir_tit_des			= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'direccion_titular_destino',ls_dir_tit_des)
		end if
		if isnull(ls_nro_dir_tit_des) then
			ls_nro_dir_tit_des	= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'nro_direc_titular_destino',ls_nro_dir_tit_des)
		end if
		if isnull(ls_dep_tit_des) then
			ls_dep_tit_des			= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'depto_direc_titular_destino',ls_dep_tit_des)
		end if
		if isnull(ls_block_tit_des) then
			ls_block_tit_des		= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'block_direc_titular_destino',ls_block_tit_des)
		end if
		if isnull(ls_ciudad_tit_des) then
			ls_ciudad_tit_des		= '0'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'cod_ciudad_titular_destino',ls_ciudad_tit_des)
			idw_detalle8.retrieve(ls_ciudad_tit_des)		
		end if
		if (isnull(ls_comuna_tit_des) or ls_ciudad_tit_des='0') then
			ls_comuna_tit_des		= '0'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'cod_comuna_titular_destino',ls_comuna_tit_des)
		end if
		if isnull(ls_base_des) then
			ls_base_des	= ''
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'base_destino',ls_base_des)
		end if
		if isnull(ls_serie_des) then
			ls_serie_des	= ''
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'serie_destino',ls_serie_des)
		end if
		if isnull(ll_numero_des) then
			ll_numero_des	= 0
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'numero_destino',ll_numero_des)
		end if
		if isnull(ll_parque_des) then
			ll_parque_des	= 0
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'cod_parque_destino',ll_parque_des)
		end if
		if isnull(ls_estad_contrato_des) then
			ls_estad_contrato_des	= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'estado_contrato_destino',ls_estad_contrato_des)
		end if
		if isnull(ls_numero_tecni_des) then
			ls_numero_tecni_des		= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'numero_tecnico_destino',ls_numero_tecni_des)
		end if
		if isnull(ls_nivel_des) then
			ls_nivel_des				= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'nivel_sepultura_destino',ls_nivel_des)
		end if
		if isnull(ls_est_sep_compl_des) then
			ls_est_sep_compl_des		= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'estado_sepultura_destino',ls_est_sep_compl_des)
		end if
		if isnull(ls_obs_sep_comp_des) then
			ls_obs_sep_comp_des		= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'observaciones_destino',ls_obs_sep_comp_des)
		end if
		if isnull(ldb_monto_canc_des) then
			ldb_monto_canc_des	= 0
			tab_1.tabpage_4.dw_aranceles.Setitem(ll_indi,'monto_cancelar_destino',ldb_monto_canc_des)
		end if
		if isnull(ll_comprobante_des) then
			ll_comprobante_des	= 0
			tab_1.tabpage_4.dw_aranceles.Setitem(ll_indi,'boleta_nro_destino',ll_comprobante_des)
		end if
		if isnull(ls_obs_ori_des) then
			ls_obs_ori_des			= '-'
			tab_1.tabpage_4.dw_aranceles.Setitem(ll_indi,'obs_destino_arancel',ls_obs_ori_des)
		end if
	else
		if isnull(ll_rut_tit_ori) then
			ll_rut_tit_ori		= 0
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'rut_titular_origen',ll_rut_tit_ori)
		end if
		if isnull(ls_dv_tit_ori) then
			ls_dv_tit_ori		= ''
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dv_titular_origen',ls_dv_tit_ori)
		end if
		if isnull(ls_tipo_via_tit_ori) then
			ls_tipo_via_tit_ori	= '0'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'tipo_via_origen_titular',ls_tipo_via_tit_ori)
		end if
		if isnull(ls_dir_tit_ori) then
			ls_dir_tit_ori		= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'direccion_titular_origen',ls_dir_tit_ori)
		end if
		if isnull(ls_nro_dir_tit_ori) then
			ls_nro_dir_tit_ori	= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'nro_direc_titular_origen',ls_nro_dir_tit_ori)
		end if
		if isnull(ls_dep_tit_ori) then
			ls_dep_tit_ori		= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'dpto_direc_titular_origen',ls_dep_tit_ori)
		end if
		if isnull(ls_block_tit_ori) then
			ls_block_tit_ori	= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'block_direc_titular_origen',ls_block_tit_ori)
		end if
		if isnull(ls_ciudad_tit_ori) then
			ls_ciudad_tit_ori	= '0'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'cod_ciudad_titular_origen',ls_ciudad_tit_ori)
			idw_detalle7.retrieve(ls_ciudad_tit_ori)
		end if
		if isnull(ls_comuna_tit_ori) or ls_ciudad_tit_ori='0' then
			ls_comuna_tit_ori	= '0'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'cod_comuna_titular_origen',ls_comuna_tit_ori)
		end if
		if isnull(ls_estad_contrato) then
			ls_estad_contrato	= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'estado_contrato_origen',ls_estad_contrato)
		end if
		if isnull(ls_numero_tecni) then
			ls_numero_tecni	= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'numero_tecnico_origen',ls_numero_tecni)
		end if
		if isnull(ls_nivel) then
			ls_nivel				= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'nivel_sepultura_origen',ls_nivel)
		end if
		if isnull(ls_est_sep_compl) then
			ls_est_sep_compl	= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'estado_sepultura_origen',ls_est_sep_compl)
		end if
		if isnull(ls_obs_sep_comp) then
			ls_obs_sep_comp	= '-'
			tab_1.tabpage_3.dw_ficha_sepult.Setitem(ll_indi,'observaciones_origen',ls_obs_sep_comp)
		end if
		if isnull(ldb_monto_canc) then
			ldb_monto_canc			= 0
			tab_1.tabpage_4.dw_aranceles.Setitem(ll_indi,'monto_cancelar_origen',ldb_monto_canc)
		end if
		if isnull(ll_comprobante) then
			ll_comprobante			= 0
			tab_1.tabpage_4.dw_aranceles.Setitem(ll_indi,'boleta_nro_origen',ll_comprobante)
		end if
		if isnull(ls_obs_ori) then
			ls_obs_ori				= '-'
			tab_1.tabpage_4.dw_aranceles.Setitem(ll_indi,'obs_origen_arancel',ls_obs_ori)
		end if
	end if
	if isnull(ll_rut_fall) then
		ll_rut_fall				= 0
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'rut_fallecido',ll_rut_fall)
	end if
	if isnull(ls_dv_fall) then
		ls_dv_fall				= ''
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'dv_fallecido',ls_dv_fall)
	end if
	if isnull(ls_nombre_fall) then
		ls_nombre_fall			= '-'
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'nombre_fallecido',ls_nombre_fall)
	end if
	if isnull(ls_ap_pat_fall) then
		ls_ap_pat_fall			= '-'
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'apellido_paterno_fall',ls_ap_pat_fall)
	end if
	if isnull(ls_ap_mat_fall) then
		ls_ap_mat_fall			= '-'
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'apellido_materno_fall',ls_ap_mat_fall)
	end if
	if isnull(ls_cod_est_fall) then
		ls_cod_est_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'cod_estado_fallecido',ls_cod_est_fall)
	end if
	if isnull(ls_tamano) then
		ls_tamano		= '-'
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'cod_tamano_cuerpo',ls_tamano)
	end if
	if isnull(ls_obs_fall) then
		ls_obs_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'observacion_fallecido',ls_obs_fall)
	end if
	if isnull(ll_funeraria) then
		ll_funeraria			= 0
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'codigo_funeraria',ll_funeraria)
	end if
	if isnull(ls_fono_funera) then
		ls_fono_funera			= '-'
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'fono_funeraria',ls_fono_funera)
	end if
	if isnull(ls_reg_civil_pase) then
		ls_reg_civil_pase		= '-'
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'cod_registro_pase',ls_reg_civil_pase)
	end if
	if isnull(ls_nro_inscrip_pase) then
		ls_nro_inscrip_pase	= '-'
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'inscripcion_pase',ls_nro_inscrip_pase)
	end if
	if isnull(ls_nro_registro_pase) then
		ls_nro_registro_pase	= '-'
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'registro_pase',ls_nro_registro_pase)
	end if
	if isnull(ll_anno_pase) then
		ll_anno_pase			= 0
		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'anno_paso',ll_anno_pase)
	end if
	if isnull(ls_obs_pase) then
		ls_obs_pase				= '-'
//		tab_1.tabpage_1.dw_ant_fall.Setitem(ll_indi,'pase_sepultacion',ls_obs_pase)
	end if
	
	
	if (ls_base='O' and ll_numero>=84001 and gs_conexion="Parque El Prado") or &
		(ls_base='O' and ll_numero>=15885 and gs_conexion="Parque La Foresta") then
		SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
		INTO 		:ll_parque_aux,				:ls_cod_age_aux  
		FROM 		"CD_FOLIO"  
		WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
				 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
				 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
//			if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
//				ls_estado_doc1	= 'S'
//			end if
		else
			ls_estado_doc2	= 'S'
		end if
	end if
	if ls_estado_doc1 = 'S' then
		messagebox("Advertencia","Este Contrato NO tiene Agente Asignado")
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_origen')
		ls_sw		= 'N'
		exit
	elseif ls_estado_doc2 = 'S' then
		messagebox("Advertencia","Contrato No Existe en Control Documentario")
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_origen')
		ls_sw		= 'N'
		exit
	//FICHA FALLECIDO//
	elseif isnull(ls_ejecutivo) or ls_ejecutivo='' then
		messagebox('Advertencia','Debe Ingresar EJECUTIVO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_ejecutivo')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_parque) or ll_parque=0 then
		messagebox('Advertencia','Debe Ingresar PARQUE')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sector) or ls_sector='' then
		messagebox('Advertencia','Debe Ingresar SECTOR ORIGEN')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector_origen')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sepultura) or ls_sepultura='' then
		messagebox('Advertencia','Debe Ingresar SEPULTURA ORIGEN')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura_origen')
		ls_sw		= 'N'
		exit
	elseif isnull(ldt_fech_sepult) then
		messagebox('Advertencia','Debe Ingresar FECHA TRASLADO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_traslado')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_hora_sepult) then
		messagebox('Advertencia','Debe Ingresar HORA FIJADA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora_fijada')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_minuto_sepult) then
		messagebox('Advertencia','Debe Ingresar MINUTO FIJADO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('minuto_fijada')
		ls_sw		= 'N'
		exit
	elseif isnull(ldt_fech_recep_des) and is_usuario_esta='S' then
		messagebox('Advertencia','Debe Ingresar FECHA RECEPCION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_recepcion')
		ls_sw		= 'N'
		exit
	// FALLECIDO
	elseif isnull(ll_rut_fall) then
		messagebox('Advertencia','Debe Ingresar RUT FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_dv_fall) then
		messagebox('Advertencia','Debe Ingresar DIGITO VERIFICADOR FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('dv_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_nombre_fall) or ls_nombre_fall='' then
		messagebox('Advertencia','Debe Ingresar NOMBRE FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('nombre_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ap_pat_fall) or ls_ap_pat_fall='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO PATERNO FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('apellido_paterno_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ap_mat_fall) or ls_ap_mat_fall='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO MATERNO FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('apellido_materno_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_cod_est_fall) or ls_cod_est_fall='' then
		messagebox('Advertencia','Debe Ingresar ESTADO CUERPO FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('cod_estado_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_tamano) or ls_tamano='' then
		messagebox('Advertencia','Debe Ingresar TAMAÑO CUERPO FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('cod_tamano_cuerpo')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_funeraria) then
		messagebox('Advertencia','Debe Ingresar FUNERARIA')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('codigo_funeraria')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_fono_funera) or ls_fono_funera='' then
		messagebox('Advertencia','Debe Ingresar FONO FUNERARIA')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('fono_funeraria')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_reg_civil_pase) or ls_reg_civil_pase='' then
		messagebox('Advertencia','Debe Ingresar REGISTRO CIVIL PASE')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('cod_registro_pase')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_nro_inscrip_pase) or ls_nro_inscrip_pase='' then
		messagebox('Advertencia','Debe Ingresar INSCRIPCION PASE')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('inscripcion_pase')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_nro_registro_pase) or ls_nro_registro_pase='' then
		messagebox('Advertencia','Debe Ingresar Nº REGISTRO PASE')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('registro_pase')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_anno_pase) then
		messagebox('Advertencia','Debe Ingresar AÑO PASE')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('anno_paso')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_obs_pase) OR ls_obs_pase='' then
		messagebox('Advertencia','Debe Ingresar OBSERVACION PASE')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('pase_sepultacion')
		ls_sw		= 'N'
		exit
	//ARANCELES//
	elseif isnull(ls_parentesco) OR ls_parentesco='' then
		messagebox('Advertencia','Debe Ingresar PARENTESCO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('codigo_parentesco')
		ls_sw		= 'N'
		exit
	else
		if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
			if isnull(ll_rut_tit_des) then
				messagebox('Advertencia','Debe Ingresar RUT TITULAR DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('rut_titular_destino')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_dv_tit_des) then
				messagebox('Advertencia','Debe Ingresar DIGITO VERIFICADOR TITULAR DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('dv_titular_destino')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_tipo_via_tit_des) or ls_tipo_via_tit_des='') then
				messagebox('Advertencia','Debe Ingresar TIPO VIA TITULAR DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('tipo_via_destino_titular')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_dir_tit_des) or ls_dir_tit_des='') then
				messagebox('Advertencia','Debe Ingresar DIRECCION TITULAR DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('direccion_titular_destino')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_nro_dir_tit_des) or ls_nro_dir_tit_des='') then
				messagebox('Advertencia','Debe Ingresar Nº DIRECCION TITULAR DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('nro_direc_titular_destino')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_dep_tit_des) or ls_dep_tit_des='') then
				messagebox('Advertencia','Debe Ingresar Nº DIRECCION TITULAR DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('depto_direc_titular_destino')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_block_tit_des) or ls_block_tit_des='') then
				messagebox('Advertencia','Debe Ingresar BLOCK DIRECCION TITULAR DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('block_direc_titular_destino')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_ciudad_tit_des) or ls_ciudad_tit_des='') then
				messagebox('Advertencia','Debe Ingresar CIUDAD TITULAR DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_ciudad_titular_destino')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_comuna_tit_des) or ls_comuna_tit_des='') then
				messagebox('Advertencia','Debe Ingresar COMUNA TITULAR DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_comuna_titular_destino')
				ls_sw		= 'N'
				exit
			elseif isnull(ll_parque_des) then
				messagebox('Advertencia','Debe Ingresar PARQUE DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque_destino')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_base_des) then
				messagebox('Advertencia','Debe Ingresar BASE CONTRATO DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('base_destino')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_serie_des) then
				messagebox('Advertencia','Debe Ingresar SERIE CONTRATO DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('serie_destino')
				ls_sw		= 'N'
				exit
			elseif isnull(ll_numero_des) then
				messagebox('Advertencia','Debe Ingresar NUMERO CONTRATO DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_destino')
				ls_sw		= 'N'
				exit
			elseif ((isnull(ldt_fech_contrato_des) or string(ldt_fech_contrato)='00/00/0000')) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
				messagebox('Advertencia','Debe Ingresar FECHA CONTRATO DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_contrato_destino')
				ls_sw		= 'N'
				exit
			elseif ((isnull(ls_estad_contrato_des) OR ls_estad_contrato_des='') ) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
				messagebox('Advertencia','Debe Ingresar ESTADO CONTRATO DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_contrato_destino')
				ls_sw		= 'N'
				exit
			elseif ((isnull(ls_numero_tecni_des) OR ls_numero_tecni_des='') ) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
				messagebox('Advertencia','Debe Ingresar Nº TECNICO DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_tecnico_destino')
				ls_sw		= 'N'
				exit
			elseif ((isnull(ls_nivel_des) OR ls_nivel_des='') ) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
				messagebox('Advertencia','Debe Ingresar NIVEL CONTRATO DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('nivel_sepultura_destino')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_est_sep_compl_des) OR ls_est_sep_compl_des='') then
				messagebox('Advertencia','Debe Ingresar ESTADO SEPULTURA CONTRATO DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_sepultura_destino')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_obs_sep_comp_des) OR ls_obs_sep_comp_des='') then
				messagebox('Advertencia','Debe Ingresar OBSERVACION SEPULTURA CONTRATO DESTINO')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('observaciones_destino')
				ls_sw		= 'N'
				exit
			elseif isnull(ldb_monto_canc_des) then
				messagebox('Advertencia','Debe Ingresar MONTO CANCELAR DESTINO')
				tab_1.SelectedTab	= 3
				tab_1.tabpage_4.dw_aranceles.setfocus()
				tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
				tab_1.tabpage_4.dw_aranceles.setcolumn('monto_cancelar_destino')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_obs_ori_des) OR ls_obs_ori_des='') then
				messagebox('Advertencia','Debe Ingresar OBSERVACION CANCELAR DESTINO')
				tab_1.SelectedTab	= 3
				tab_1.tabpage_4.dw_aranceles.setfocus()
				tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
				tab_1.tabpage_4.dw_aranceles.setcolumn('obs_destino_arancel')
				ls_sw		= 'N'
				exit
			end if
		else
			if isnull(ll_rut_tit_ori) then
				messagebox('Advertencia','Debe Ingresar RUT TITULAR ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('rut_titular_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_dv_tit_ori) then
				messagebox('Advertencia','Debe Ingresar DV TITULAR ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('dv_titular_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_tipo_via_tit_ori) or ls_tipo_via_tit_ori='' then
				messagebox('Advertencia','Debe Ingresar TIPO VIA TITULAR ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('tipo_via_origen_titular')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_dir_tit_ori) or ls_dir_tit_ori='' then
				messagebox('Advertencia','Debe Ingresar DIRECCION TITULAR ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('direccion_titular_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_nro_dir_tit_ori) or ls_nro_dir_tit_ori='' then
				messagebox('Advertencia','Debe Ingresar Nº DIRECCION TITULAR ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('nro_direc_titular_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_dep_tit_ori) or ls_dep_tit_ori='' then
				messagebox('Advertencia','Debe Ingresar DEPTO. TITULAR ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('dpto_direc_titular_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_block_tit_ori) or ls_block_tit_ori='' then
				messagebox('Advertencia','Debe Ingresar BLOCK TITULAR ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('block_direc_titular_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_ciudad_tit_ori) or ls_ciudad_tit_ori='' then
				messagebox('Advertencia','Debe Ingresar CIUDAD TITULAR ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_ciudad_titular_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_comuna_tit_ori) or ls_comuna_tit_ori='' then
				messagebox('Advertencia','Debe Ingresar COMUNA TITULAR ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_comuna_titular_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_comuna_tit_ori) or ls_comuna_tit_ori='' then
				messagebox('Advertencia','Debe Ingresar COMUNA TITULAR ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_comuna_titular_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ll_cod_parque_ori) or ll_cod_parque_ori=0 then
				messagebox('Advertencia','Debe Ingresar PARQUE ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_base) or ls_base='' then
				messagebox('Advertencia','Debe Ingresar BASE CONTRATO ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('base_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_serie) or ls_serie='' then
				messagebox('Advertencia','Debe Ingresar SERIE CONTRATO ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('serie_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ll_numero) or ll_numero=0 then
				messagebox('Advertencia','Debe Ingresar NUMERO CONTRATO ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_origen')
				ls_sw		= 'N'
				exit
			elseif (isnull(ldt_fech_contrato) or string(ldt_fech_contrato)='00/00/0000') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
				messagebox('Advertencia','Debe Ingresar FECHA CONTRATO ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_contrato_origen')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_estad_contrato) or ls_estad_contrato='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
				messagebox('Advertencia','Debe Ingresar ESTADO CONTRATO ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_contrato_origen')
				ls_sw		= 'N'
				exit
			elseif (isnull(ls_numero_tecni) or ls_numero_tecni='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
				messagebox('Advertencia','Debe Ingresar Nº TECNICO CONTRATO ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_tecnico_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_est_sep_compl) or ls_est_sep_compl='' then
				messagebox('Advertencia','Debe Ingresar ESTADO SEPULTURA CONTRATO ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_sepultura_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_obs_sep_comp) or ls_obs_sep_comp='' then
				messagebox('Advertencia','Debe Ingresar OBSERVACION SEPULTURA CONTRATO ORIGEN')
				tab_1.SelectedTab	= 1
				tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
				tab_1.tabpage_3.dw_ficha_sepult.setcolumn('observaciones_origen')
				ls_sw		= 'N'
				exit	
			elseif isnull(ldb_monto_canc) then
				messagebox('Advertencia','Debe Ingresar MONTO CANCELAR ORIGINAL')
				tab_1.SelectedTab	= 3
				tab_1.tabpage_4.dw_aranceles.setfocus()
				tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
				tab_1.tabpage_4.dw_aranceles.setcolumn('monto_cancelar_origen')
				ls_sw		= 'N'
				exit
			elseif ll_sw_otros_pagos=0 and (isnull(ldb_otros_pagos_ori) or ldb_otros_pagos_ori=0) then
				messagebox('Advertencia','Debe Ingresar MONTO OTROS PAGOS A CANCELAR')
				tab_1.SelectedTab	= 3
				tab_1.tabpage_4.dw_aranceles.setfocus()
				tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
				tab_1.tabpage_4.dw_aranceles.setcolumn('otros_pagos_origen')
				ls_sw		= 'N'
				exit
			elseif isnull(ls_obs_ori) OR ls_obs_ori='' then
				messagebox('Advertencia','Debe Ingresar OBSERVACION CANCELAR ORIGINAL')
				tab_1.SelectedTab	= 3
				tab_1.tabpage_4.dw_aranceles.setfocus()
				tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
				tab_1.tabpage_4.dw_aranceles.setcolumn('obs_origen_arancel')
				ls_sw		= 'N'
				exit
			end if
		end if	
	end if
next
return ls_sw
end function

public subroutine wf_validar_columna (string as_columna);String	ls_ciudad,ls_base,ls_sector,ls_sector_des,ls_dv,ls_nombre_tit_des,ls_ap_pat_tit_des,&
			ls_ap_mat_tit_des,ls_dir_tit_des,ls_pob_tit_des,ls_sector_tit_des,ls_comuna_tit_des,&
			ls_ciudad_tit_des,ls_fono_tit_des,ls_nro_tit_des,ls_depto_tit_des,ls_block_tit_des,&
			ls_tipo_via_tit_des
Long		ll_cod_parque_des,ll_cod_parque,ll_fila,ll_rut

if as_columna='cod_ciudad_titular_origen' then
	ls_ciudad	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_ciudad_titular_origen')
	if not isnull(ls_ciudad) then
		idw_detalle7.retrieve(ls_ciudad)
	end if
elseif as_columna='cod_ciudad_titular_destino' then
	ls_ciudad	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_ciudad_titular_destino')
	if not isnull(ls_ciudad) then
		idw_detalle8.retrieve(ls_ciudad)
	end if
elseif as_columna='base_origen' then
	ls_base	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'base_origen')
	idw_detalle.retrieve(ls_base)
elseif as_columna='cod_parque_destino' then
	ll_cod_parque_des	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino')
	ls_sector_des		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino')
	if ll_cod_parque_des>0 then
		idw_detalle4.retrieve(ll_cod_parque_des)
	end if
	if ll_cod_parque_des>0 and not isnull(ls_sector_des) and ls_sector_des<>'' then 
		idw_detalle6.retrieve(ll_cod_parque_des,ls_sector_des)
	end if
elseif as_columna='sector_destino' then
	ll_cod_parque_des	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino')
	ls_sector_des		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino')
	if ll_cod_parque_des>0 and not isnull(ls_sector_des) and ls_sector_des<>'' then 
		idw_detalle6.retrieve(ll_cod_parque_des,ls_sector_des)
	end if
elseif as_columna='rut_titular_destino' or as_columna='dv_titular_destino' then
	ll_fila		= tab_1.tabpage_3.dw_ficha_sepult.getrow()
	ll_rut		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'rut_titular_destino')
	ls_dv			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'dv_titular_destino')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut Titular Destino Inválido',stopsign!)
		else
			SELECT 	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."TIPO_VIA"
			INTO 		:ls_nombre_tit_des,	:ls_ap_pat_tit_des,		:ls_ap_mat_tit_des,		:ls_dir_tit_des,				:ls_pob_tit_des,			:ls_sector_tit_des,	:ls_comuna_tit_des,	:ls_ciudad_tit_des,	:ls_fono_tit_des,		:ls_nro_tit_des,						:ls_depto_tit_des,				:ls_block_tit_des,				:ls_tipo_via_tit_des
			FROM 		"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nombre_titular_destino',ls_nombre_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_pat_titular_destino',ls_ap_pat_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_mat_titular_destino',ls_ap_mat_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'tipo_via_destino_titular',ls_tipo_via_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'direccion_titular_destino',ls_dir_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nro_direc_titular_destino',ls_nro_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'depto_direc_titular_destino',ls_depto_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'block_direc_titular_destino',ls_block_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_ciudad_titular_destino',ls_ciudad_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_comuna_titular_destino',ls_comuna_tit_des)
				idw_detalle8.retrieve(ls_ciudad_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.accepttext()
			else
				messagebox("Advertencia","Titular Destino No Existe")
			end if
		end if
	end if
elseif as_columna='rut_titular_origen' or as_columna='dv_titular_origen' then
	ll_fila		= tab_1.tabpage_3.dw_ficha_sepult.getrow()
	ll_rut		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'rut_titular_origen')
	ls_dv			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'dv_titular_origen')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut Titular Origen Inválido',stopsign!)
		else
			SELECT 	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."TIPO_VIA"
			INTO 		:ls_nombre_tit_des,	:ls_ap_pat_tit_des,		:ls_ap_mat_tit_des,		:ls_dir_tit_des,				:ls_pob_tit_des,			:ls_sector_tit_des,	:ls_comuna_tit_des,	:ls_ciudad_tit_des,	:ls_fono_tit_des,		:ls_nro_tit_des,						:ls_depto_tit_des,				:ls_block_tit_des,				:ls_tipo_via_tit_des
			FROM 		"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nombre_titular_origen',ls_nombre_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_pat_titular_origen',ls_ap_pat_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'apellido_mat_titular_origen',ls_ap_mat_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'tipo_via_origen_titular',ls_tipo_via_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'direccion_titular_origen',ls_dir_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'nro_direc_titular_origen',ls_nro_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'dpto_direc_titular_origen',ls_depto_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'block_direc_titular_origen',ls_block_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_ciudad_titular_origen',ls_ciudad_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'cod_comuna_titular_origen',ls_comuna_tit_des)
				idw_detalle7.retrieve(ls_ciudad_tit_des)
				tab_1.tabpage_3.dw_ficha_sepult.accepttext()
			else
				messagebox("Advertencia","Titular Origen No Existe")
			end if
		end if
	end if
end if
end subroutine

public subroutine wf_validar_ctto (string as_columna);String		ls_base,ls_serie,ls_sector_sepult,ls_nro_sepultura,ls_estado_ctto,ls_dv_titular,ls_nom_titular,&
			ls_ap_pat_titular,ls_ap_mat_titular,ls_cod_tipo_via,ls_direccion_p,ls_nro_part,ls_depto_part,&
			ls_block_part,ls_pob_part,ls_sector_part,ls_comuna_part,ls_ciudad_part,ls_fono_part,ls_parque,&
			ls_cod_age_aux,ls_base_aux,ls_serie_aux,ls_sector,ls_sepultura,ls_pasa,ls_nro_tecnico,ls_base_origen,&
			ls_serie_origen,ls_tipo_cons
Long		ll_count_fall,ll_cod_parque,ll_mora_cred,ll_mora_mant,ll_rut_titular,ll_resp,ll_parque_aux,&
			ll_parque_cons,ll_capacidad,ll_nulo
Datetime	ldt_fecha_ctto
Double	ll_numero,ll_numero_origen,ll_numero_aux

if as_columna='base_origen' or as_columna='serie_origen' or as_columna='numero_origen' then
	Setnull(ll_nulo)
	ls_base			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'base_origen')
	ls_serie			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'serie_origen')
	ll_numero		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'numero_origen')
	ll_parque_cons	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
	ls_sector			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector_origen')
	ls_sepultura		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sepultura_origen')
	if idw_detalle.retrieve(ls_base)=0 then
		idw_detalle.insertrow(0)
	end if
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ll_numero>0 then
		if ls_base='O' then
			SELECT	"INVENTARIO_PLANI"."BASE",	"INVENTARIO_PLANI"."SERIE",	"INVENTARIO_PLANI"."NUMERO"
			INTO 		:ls_base_aux,					:ls_serie_aux,						:ll_numero_aux  
			FROM 		"INVENTARIO_PLANI"  
			WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_parque_cons ) AND  
					 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
					 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura )   
			USING		sqlca;
			if sqlca.sqlcode=0 and ll_numero_aux <> 10000000 then
				ls_pasa	= 'S'
			else
				if ll_numero_aux = 10000000 then
					SELECT	"INVENTARIO_PLANI_CONST"."CAPACIDAD",	"INVENTARIO_PLANI_CONST"."NUMERO_TEC"  
					INTO 		:ll_capacidad,									:ls_nro_tecnico  
					FROM 		"INVENTARIO_PLANI_CONST"  
					WHERE  ( "INVENTARIO_PLANI_CONST"."SECTOR" = :ls_sector ) AND  
							 ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :ls_sepultura ) AND  
							 ( "INVENTARIO_PLANI_CONST"."BASE" = :ls_base ) AND  
							 ( "INVENTARIO_PLANI_CONST"."SERIE" = :ls_serie ) AND  
							 ( "INVENTARIO_PLANI_CONST"."NUMERO" = :ll_numero ) AND  
							 ( "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :ll_parque_cons )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_pasa	= 'S'
					else
						SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO"  
						INTO 		:ls_base,							:ls_serie,							:ll_numero  
						FROM 		"RESERVA_SEPULTURA"  
						WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
								 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
								 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
								 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_parque_cons ) AND  
								 ( "RESERVA_SEPULTURA"."BASE" = :ls_base )   AND
								 ( "RESERVA_SEPULTURA"."SERIE" = :ls_serie )   AND
								 ( "RESERVA_SEPULTURA"."NUMERO" = :ll_numero ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ls_pasa	= 'S'
						else
							messagebox("Advertencia","Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" No Tiene Reserva")
							ls_pasa	= 'N'
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_origen',ll_nulo)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							tab_1.tabpage_3.dw_ficha_sepult.setfocus()
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_origen')
						end if
					end if
				else
					ls_pasa			= 'S'
				end if
			end if
			if ls_pasa='S' then
				SELECT	COUNT("FALLECIDOS"."LLAVE")  
				INTO 		:ll_count_fall  
				FROM 		"FALLECIDOS"  
				WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
						 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
						 ( "FALLECIDOS"."CONTRATO" = :ll_numero ) AND
						 ( "FALLECIDOS"."EST" = 'CC' )  AND
						( "FALLECIDOS"."ESTADO_REG" = 'A' );
				if isnull(ll_count_fall) then ll_count_fall=0
				SELECT	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."NRO_TECNICO",	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA" 
				INTO 		:ls_sector_sepult,		:ll_capacidad,					:ls_nro_tecnico,					:ls_nro_sepultura,			:ll_cod_parque,			:ls_estado_ctto,		:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto
				FROM 		"CADENA",   "CADENA_MORA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
				WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
						 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
						 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
						 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
						 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
						 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
						 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
						 (("CADENA"."CODIGO" = 'O' ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero ) )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','S')
					if tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')=ll_cod_parque then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
					else
						SELECT 	"COD_PARQ"."NOMBRE"  
						INTO 		:ls_parque  
						FROM 	"COD_PARQ"  
						WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
						USING	sqlca;	
						ll_resp	= messagebox("Advertencia","Parque Inválido, Promesa Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_origen')=ls_sector_sepult then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_origen',ls_sector_sepult)
					else
						ll_resp	= messagebox("Advertencia","Sector Inválido, Promesa Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_origen',ls_sector_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector_origen')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_origen')=ls_nro_sepultura then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_origen',ls_nro_sepultura)
					else
						ll_resp	= messagebox("Advertencia","Sepultura Inválida, Promesa Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_origen',ls_nro_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura_origen')
						end if
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_origen',ll_cod_parque)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico_origen',ls_nro_tecnico)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad_origen',ll_capacidad)
					ls_base_origen		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base_origen')
					ls_serie_origen	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie_origen')
					ll_numero_origen	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_origen')
					if ls_base_origen='O' then
						SELECT	"OFERTA_V"."TIPO_CONS"  
						INTO 		:ls_tipo_cons  
						FROM 		"CADENA",   
									"OFERTA_V"  
						WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								 (("CADENA"."CODIGO" = :ls_base_origen ) AND  
								 ( "OFERTA_V"."SERIE" = :ls_serie_origen ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_origen ) )   
						USING		sqlca;
						if sqlca.sqlcode<>0 then
							ls_tipo_cons	= 'T'
						end if
					else
						ls_tipo_cons		= 'T'
					end if
					if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
					if idw_detalle11.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
						idw_detalle11.insertrow(0)
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_contrato_origen',ls_estado_ctto)
					if (ll_capacidad - ll_count_fall)=0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_origen','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_origen','N')
					end if
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'rut_titular_origen',ll_rut_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'dv_titular_origen',ls_dv_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nombre_titular_origen',ls_nom_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'apellido_pat_titular_origen',ls_ap_pat_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'apellido_mat_titular_origen',ls_ap_mat_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'tipo_via_origen_titular',ls_cod_tipo_via)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'direccion_titular_origen',ls_direccion_p)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nro_direc_titular_origen',ls_nro_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'dpto_direc_titular_origen',ls_depto_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'block_direc_titular_origen',ls_block_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'poblacion_villa_origen',ls_pob_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_titular_origen',ls_sector_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_ciudad_titular_origen',ls_ciudad_part)
					idw_detalle7.retrieve(ls_ciudad_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_comuna_titular_origen',ls_comuna_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fono_titular_origen',ls_fono_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_contrato_origen',ldt_fecha_ctto)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'mora_mant_origen',ll_mora_mant)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'mora_cred_origen',ll_mora_cred)
					if ll_mora_cred>0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_credito_origen','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_credito_origen','N')
					end if
					if ll_mora_mant>0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_mantencion_origen','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_mantencion_origen','N')
					end if
				else
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_origen','N')
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_destino','N')
					SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
					INTO 		:ll_parque_aux,				:ls_cod_age_aux  
					FROM 		"CD_FOLIO"  
					WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
							 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
							 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
//						if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
//							messagebox("Advertencia","Este Contrato NO tiene Agente Asignado")
//							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
//						else
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','S')
//						end if
					else
						messagebox("Advertencia","Contrato No Existe en Control Documentario")
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
					end if
				end if
			end if

		elseif ls_base='C' then
			SELECT	"INVENTARIO_PLANI"."BASE",	"INVENTARIO_PLANI"."SERIE",	"INVENTARIO_PLANI"."NUMERO"
			INTO 		:ls_base_aux,					:ls_serie_aux,						:ll_numero_aux  
			FROM 		"INVENTARIO_PLANI"  
			WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_parque_cons ) AND  
					 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
					 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura )   
			USING		sqlca;
			if sqlca.sqlcode=0 and ll_numero_aux <> 10000000 then
				ls_pasa	= 'S'
			else
				if ll_numero_aux = 10000000 then
					SELECT	"INVENTARIO_PLANI_CONST"."CAPACIDAD",	"INVENTARIO_PLANI_CONST"."NUMERO_TEC"  
					INTO 		:ll_capacidad,									:ls_nro_tecnico  
					FROM 		"INVENTARIO_PLANI_CONST"  
					WHERE  ( "INVENTARIO_PLANI_CONST"."SECTOR" = :ls_sector ) AND  
							 ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :ls_sepultura ) AND  
							 ( "INVENTARIO_PLANI_CONST"."BASE" = :ls_base ) AND  
							 ( "INVENTARIO_PLANI_CONST"."SERIE" = :ls_serie ) AND  
							 ( "INVENTARIO_PLANI_CONST"."NUMERO" = :ll_numero ) AND  
							 ( "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :ll_parque_cons )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_pasa	= 'S'
					else
						SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO"  
						INTO 		:ls_base,							:ls_serie,							:ll_numero  
						FROM 		"RESERVA_SEPULTURA"  
						WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
								 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
								 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
								 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_parque_cons ) AND  
								 ( "RESERVA_SEPULTURA"."BASE" = :ls_base )   AND
								 ( "RESERVA_SEPULTURA"."SERIE" = :ls_serie )   AND
								 ( "RESERVA_SEPULTURA"."NUMERO" = :ll_numero ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ls_pasa	= 'S'
						else
							messagebox("Advertencia","Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" No Tiene Reserva")
							ls_pasa	= 'N'
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_origen',ll_nulo)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							tab_1.tabpage_3.dw_ficha_sepult.setfocus()
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_origen')
						end if
					end if
				else
					ls_pasa			= 'S'
				end if
			end if
			if ls_pasa='S' then
				SELECT	"CADENA"."ESTADO",	"CONTRATO"."CAPACIDAD",	"CONTRATO"."NRO_TEC",	"CADENA"."COD_PARQUE",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."FECHA"  
				INTO 		:ls_estado_ctto,		:ll_capacidad	,			:ls_nro_tecnico,			:ll_cod_parque,			:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part  ,		:ls_sector_sepult,	:ls_nro_sepultura,		:ldt_fecha_ctto			
				FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
				WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
						 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
						 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
						 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
						 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
						 (("CADENA"."CODIGO" = 'C' ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero ) )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','S')
					if tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')=ll_cod_parque then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
					else
						SELECT 	"COD_PARQ"."NOMBRE"  
						INTO 		:ls_parque  
						FROM 	"COD_PARQ"  
						WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
						USING	sqlca;	
						ll_resp	= messagebox("Advertencia","Parque Inválido, Contrato IsaCruz Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_origen')=ls_sector_sepult then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_origen',ls_sector_sepult)
					else
						ll_resp	= messagebox("Advertencia","Sector Inválido, Contrato IsaCruz Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_origen',ls_sector_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector_origen')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_origen')=ls_nro_sepultura then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_origen',ls_nro_sepultura)
					else
						ll_resp	= messagebox("Advertencia","Sepultura Inválida, Contrato IsaCruz Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_origen',ls_nro_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura_origen')
						end if
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_origen',ll_cod_parque)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico_origen',ls_nro_tecnico)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad_origen',ll_capacidad)
					ls_base_origen		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base_origen')
					ls_serie_origen	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie_origen')
					ll_numero_origen	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_origen')
					if ls_base_origen='O' then
						SELECT	"OFERTA_V"."TIPO_CONS"  
						INTO 		:ls_tipo_cons  
						FROM 		"CADENA",   
									"OFERTA_V"  
						WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								 (("CADENA"."CODIGO" = :ls_base_origen ) AND  
								 ( "OFERTA_V"."SERIE" = :ls_serie_origen ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_origen ) )   
						USING		sqlca;
						if sqlca.sqlcode<>0 then
							ls_tipo_cons	= 'T'
						end if
					else
						ls_tipo_cons		= 'T'
					end if
					if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
					if idw_detalle11.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
						idw_detalle11.insertrow(0)
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_contrato_origen',ls_estado_ctto)
					if (ll_capacidad - ll_count_fall)=0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_origen','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_origen','N')
					end if
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'rut_titular_origen',ll_rut_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'dv_titular_origen',ls_dv_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nombre_titular_origen',ls_nom_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'apellido_pat_titular_origen',ls_ap_pat_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'apellido_mat_titular_origen',ls_ap_mat_titular)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'tipo_via_origen_titular',ls_cod_tipo_via)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'direccion_titular_origen',ls_direccion_p)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nro_direc_titular_origen',ls_nro_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'dpto_direc_titular_origen',ls_depto_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'block_direc_titular_origen',ls_block_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'poblacion_villa_origen',ls_pob_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_titular_origen',ls_sector_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_ciudad_titular_origen',ls_ciudad_part)
					idw_detalle7.retrieve(ls_ciudad_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_comuna_titular_origen',ls_comuna_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fono_titular_origen',ls_fono_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_contrato_origen',ldt_fecha_ctto)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'mora_mant_origen',ll_mora_mant)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'mora_cred_origen',0)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_credito_origen','N')
					if ll_mora_mant>0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_mantencion_origen','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_mantencion_origen','N')
					end if
				else
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_origen','N')
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_destino','N')
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
				end if
			end if
		end if
	end if
end if
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
end subroutine

public subroutine wf_validar_nivel (string as_columna);String	ls_base,ls_serie,ls_nivel,ls_var_nivel,ls_var_cap,ls_var_final,ls_nivel_aux,ls_sector,ls_sepultura,&
			ls_nulo
Long		ll_capacidad,ll_pos,ll_cod_parque
Double	ll_numero
Setnull(ls_nulo)
ls_sector		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_destino')
ls_sepultura	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_destino')
ll_cod_parque	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino')
SELECT	"INVENTARIO_PLANI"."BASE",   
			"INVENTARIO_PLANI"."SERIE",   
			"INVENTARIO_PLANI"."NUMERO",
			"INVENTARIO_PLANI"."NUMERO_TEC",
			"INVENTARIO_PLANI"."CAPACIDAD"
INTO 		:ls_base,   
			:ls_serie,   
			:ll_numero,
			:is_nro_tecnico,
			:il_capacidad
FROM 		"INVENTARIO_PLANI"  
WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
		 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
		 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) 
USING		sqlca;
ls_base			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base_destino')
ls_serie			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie_destino')
ll_numero		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_destino')
ls_nivel			= trim(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nivel_sepultura_destino'))
ll_capacidad	= il_capacidad //tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad_destino')
ll_pos			= Pos(ls_nivel, ".")
ls_var_nivel	= mid(ls_nivel,ll_pos + 1)
ll_pos			= Pos(ls_var_nivel, ".")
ls_var_cap		= mid(ls_var_nivel,ll_pos + 1)
ls_var_final	= mid(ls_var_nivel,1,ll_pos - 1)
//if long(ls_var_final) > ll_capacidad then
//	messagebox("Advertencia","Nivel Destino Capacidad Inválido")
//	tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nivel_sepultura_destino',ls_nulo)
//	tab_1.tabpage_3.dw_ficha_sepult.accepttext()
//else
//	if long(ls_var_cap) <> ll_capacidad then
//		messagebox("Advertencia","Nivel Destino Ingresado Inválido, No Corresponde a la Capacidad")
//		tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nivel_sepultura_destino',ls_nulo)
//		tab_1.tabpage_3.dw_ficha_sepult.accepttext()
//	else
		SELECT	"FICHA_TRASLADO"."NIVEL_SEPULTURA_DESTINO"  
		INTO 		:ls_nivel_aux  
		FROM 		"FICHA_TRASLADO"  
		WHERE  ( "FICHA_TRASLADO"."BASE_DESTINO" = :ls_base ) AND  
				 ( "FICHA_TRASLADO"."SERIE_DESTINO" = :ls_serie ) AND  
				 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = :ll_numero )  AND
				 ( "FICHA_TRASLADO"."NIVEL_SEPULTURA_DESTINO"  = :ls_nivel )
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","Nivel Destino Ingresado Ya Existe, verificar si es Reducción")
//			tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'nivel_sepultura_destino',ls_nulo)
//			tab_1.tabpage_3.dw_ficha_sepult.accepttext()
//		else
//			if ll_capacidad - long(ls_var_final)=0 then
//				tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_destino','S')
//			else
//				tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_destino','N')
//			end if
		end if
//	end if
//end if
end subroutine

public subroutine wf_calculo_monto ();Double	ldb_valor_der,ldb_pago_1,ldb_pago_2,ldb_pago_3,ldb_pago_4,ldb_pago_5,ldb_pago_6,ldb_total,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,&
			ldb_dscto_4,ldb_dscto_5,ldb_dscto_6
Long		ll_fila

ll_fila						= tab_1.tabpage_4.dw_aranceles.getrow()
ldb_valor_der			= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'derecho_sepultacion_origen')
ldb_pago_1				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_1')
ldb_pago_2				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_2')
ldb_pago_3				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_3')
ldb_pago_4				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_4')
ldb_pago_5				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_5')
ldb_pago_6				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_6')
ldb_dscto_1				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_1')
ldb_dscto_2				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_2')
ldb_dscto_3				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_3')
ldb_dscto_4				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_4')
ldb_dscto_5				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_5')
ldb_dscto_6				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_6')
ldb_total					= round(ldb_valor_der + ldb_pago_1 + ldb_pago_2 + ldb_pago_3 + ldb_pago_4 + ldb_pago_5 + ldb_pago_6 - ldb_dscto_1 - ldb_dscto_2 - ldb_dscto_3 - ldb_dscto_4 - ldb_dscto_5 - ldb_dscto_6, 2)
tab_1.tabpage_4.dw_aranceles.setitem(ll_fila,'monto_cancelar_origen',ldb_total)

ldb_valor_der			= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'derecho_sepultacion_destino')
ldb_pago_1				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_d1')
ldb_pago_2				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_d2')
ldb_pago_3				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_d3')
ldb_pago_4				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_d4')
ldb_pago_5				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_d5')
ldb_pago_6				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_otro_d6')
ldb_dscto_1				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_d1')
ldb_dscto_2				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_d2')
ldb_dscto_3				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_d3')
ldb_dscto_4				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_d4')
ldb_dscto_5				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_d5')
ldb_dscto_6				= tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_dscto_d6')
ldb_total					= round(ldb_valor_der + ldb_pago_1 + ldb_pago_2 + ldb_pago_3 + ldb_pago_4 + ldb_pago_5 + ldb_pago_6 - ldb_dscto_1 - ldb_dscto_2 - ldb_dscto_3 - ldb_dscto_4 - ldb_dscto_5 - ldb_dscto_6,2)
tab_1.tabpage_4.dw_aranceles.setitem(ll_fila,'monto_cancelar_destino',ldb_total)
tab_1.tabpage_4.dw_aranceles.accepttext()

end subroutine

public function string wf_validar_detalle_dscto (string as_tipo_dscto);String		ls_return,ls_cod_otro,ls_tipo_cob,ls_pago_m, ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6
//
DECLARE x1 CURSOR FOR  
SELECT 	"TIPO_COB_OTRO_VALIDA"."CODIGO_OTRO",	 "TIPO_COB_OTRO_VALIDA"."TIPO_COB_REFERENCIA"  
FROM 	"TIPO_COB_OTRO_VALIDA"  
WHERE ("TIPO_COB_OTRO_VALIDA"."TIPO_COB_REFERENCIA" = 'L' OR  "TIPO_COB_OTRO_VALIDA"."TIPO_COB_REFERENCIA" = 'M') AND  
			"TIPO_COB_OTRO_VALIDA"."TIPO_COMPROBANTE" = 'BE'   
USING	sqlca;
open  x1;
DO WHILE sqlca.sqlcode=0
	fetch x1 into :ls_cod_otro, :ls_tipo_cob;
	if not isnull(ls_cod_otro) then
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_derecho_sepult') = 0 then
			ls_pago_m			= 'M'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_1') =0 then
			ls_pago_1			= 'L'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_2') =0 then
			ls_pago_2			= 'L'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_3') =0 then
			ls_pago_3			= 'L'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_4') =0 then
			ls_pago_4			= 'L'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_5') =0 then
			ls_pago_5			= 'L'
		end if
		if tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_6') =0 then
			ls_pago_6			= 'L'
		end if
		if ls_cod_otro = as_tipo_dscto and ls_pago_m = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_1 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_2 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_3 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_4 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_5 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		elseif ls_cod_otro = as_tipo_dscto and ls_pago_6 = ls_tipo_cob then
			ls_return				= 'S'
			exit
		else
			ls_return				= 'N'
		end if
	end if
	Setnull(ls_cod_otro)
LOOP
close x1;

return ls_return
end function

public subroutine wf_carga_detalle_boletas (string as_base, string as_serie, long al_numero, long al_corr_interno, long al_rut_tit, date adt_fech_sepult, long al_parque, long al_rut_tit_d, string as_base_des, string as_serie_des, long al_numero_des);String		ls_estado_reg,ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6,ls_dscto_1,ls_dscto_2,ls_dscto_3,ls_dscto_4,&
			ls_dscto_5,ls_dscto_6,ls_tipo_mov,ls_tipo_cob,ls_pago_d1,ls_pago_d2,ls_pago_d3,ls_pago_d4,ls_pago_d5,ls_pago_d6,ls_dscto_d1,&
			ls_dscto_d2,ls_dscto_d3,ls_dscto_d4,ls_dscto_d5,ls_dscto_d6,ls_tipo_cobro_aux
Long		ll_tot_reg,ll_indi,ll_sw_derecho_sepult,ll_sw_pago_1,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,&
			ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6,ll_sw_pago_d1,ll_sw_pago_d2,ll_sw_pago_d3,&
			ll_sw_pago_d4,ll_sw_pago_d5,ll_sw_pago_d6,ll_sw_dscto_d1,ll_sw_dscto_d2,ll_sw_dscto_d3,ll_sw_dscto_d4,ll_sw_dscto_d5,ll_sw_dscto_d6
Double	ldb_der_sepult_uf,ldb_pago_1,ldb_pago_2,ldb_pago_3,ldb_pago_4,ldb_pago_5,ldb_pago_6,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,&
			ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,ldb_total_dscto,ldb_der_sepult_uf_d,ldb_pago_d1,ldb_pago_d2,ldb_pago_d3,ldb_pago_d4,ldb_pago_d5,&
			ldb_pago_d6,ldb_dscto_d1,ldb_dscto_d2,ldb_dscto_d3,ldb_dscto_d4,ldb_dscto_d5,ldb_dscto_d6

DELETE FROM "FICHA_SEPULTACION_PAGO"  
WHERE 		( "FICHA_SEPULTACION_PAGO"."BASE" = :as_base ) AND  
				( "FICHA_SEPULTACION_PAGO"."SERIE" = :as_serie ) AND  
				( "FICHA_SEPULTACION_PAGO"."NUMERO" = :al_numero ) AND  
				( "FICHA_SEPULTACION_PAGO"."CORRELATIVO_FICHA" = :al_corr_interno ) AND  
				( "FICHA_SEPULTACION_PAGO"."RUT_TITULAR" = :al_rut_tit ) AND  
				( "FICHA_SEPULTACION_PAGO"."FECHA_SEPULTACION" = :adt_fech_sepult ) AND  
				( "FICHA_SEPULTACION_PAGO"."COD_PARQUE" = :al_parque ) AND
				( "FICHA_SEPULTACION_PAGO"."FOLIO_BOLETA" = 0 ) AND 
				( "FICHA_SEPULTACION_PAGO"."TIPO_FICHA" ='FT' )
USING	sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if	
ll_tot_reg						= tab_1.tabpage_4.dw_aranceles.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_estado_reg				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'estado_reg')
	ldb_der_sepult_uf			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'derecho_sepultacion_origen')
	ldb_der_sepult_uf_d		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'derecho_sepultacion_destino')
	
	ll_sw_derecho_sepult		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_derecho_sepult')
	ll_sw_pago_1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_1')
	ll_sw_pago_2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_2')
	ll_sw_pago_3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_3')
	ll_sw_pago_4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_4')
	ll_sw_pago_5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_5')
	ll_sw_pago_6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_6')
	ls_pago_1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_1')
	ls_pago_2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_2')
	ls_pago_3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_3')
	ls_pago_4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_4')
	ls_pago_5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_5')
	ls_pago_6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_6')
	ldb_pago_1					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_1')
	ldb_pago_2					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_2')
	ldb_pago_3					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_3')
	ldb_pago_4					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_4')
	ldb_pago_5					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_5')
	ldb_pago_6					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_6')
	ll_sw_dscto_1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_1')
	ll_sw_dscto_2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_2')
	ll_sw_dscto_3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_3')
	ll_sw_dscto_4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_4')
	ll_sw_dscto_5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_5')
	ll_sw_dscto_6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_6')
	ls_dscto_1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_1')
	ls_dscto_2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_2')
	ls_dscto_3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_3')
	ls_dscto_4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_4')
	ls_dscto_5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_5')
	ls_dscto_6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_6')
	ldb_dscto_1					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_1')
	ldb_dscto_2					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_2')
	ldb_dscto_3					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_3')
	ldb_dscto_4					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_4')
	ldb_dscto_5					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_5')
	ldb_dscto_6					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_6')
	
//	ll_sw_pago_d1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_d1')
//	ll_sw_pago_d2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_d2')
//	ll_sw_pago_d3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_d3')
//	ll_sw_pago_d4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_d4')
//	ll_sw_pago_d5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_d5')
//	ll_sw_pago_d6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_d6')
	ls_pago_d1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d1')
	ls_pago_d2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d2')
	ls_pago_d3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d3')
	ls_pago_d4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d4')
	ls_pago_d5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d5')
	ls_pago_d6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'pago_otro_d6')
	ldb_pago_d1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d1')
	ldb_pago_d2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d2')
	ldb_pago_d3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d3')
	ldb_pago_d4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d4')
	ldb_pago_d5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d5')
	ldb_pago_d6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_otro_d6')
//	ll_sw_dscto_d1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_d1')
//	ll_sw_dscto_d2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_d2')
//	ll_sw_dscto_d3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_d3')
//	ll_sw_dscto_d4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_d4')
//	ll_sw_dscto_d5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_d5')
//	ll_sw_dscto_d6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_dscto_d6')
	ls_dscto_d1					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d1')
	ls_dscto_d2					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d2')
	ls_dscto_d3					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d3')
	ls_dscto_d4					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d4')
	ls_dscto_d5					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d5')
	ls_dscto_d6					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_d6')
	ldb_dscto_d1				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d1')
	ldb_dscto_d2				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d2')
	ldb_dscto_d3				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d3')
	ldb_dscto_d4				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d4')
	ldb_dscto_d5				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d5')
	ldb_dscto_d6				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_dscto_d6')
	//
	ldb_total_dscto				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_total_dscto')
	
	if ldb_dscto_1 > 0 then ldb_dscto_1 = ldb_dscto_1 * -1
	if ldb_dscto_2 > 0 then ldb_dscto_2 = ldb_dscto_2 * -1
	if ldb_dscto_3 > 0 then ldb_dscto_3 = ldb_dscto_3 * -1
	if ldb_dscto_4 > 0 then ldb_dscto_4 = ldb_dscto_4 * -1
	if ldb_dscto_5 > 0 then ldb_dscto_5 = ldb_dscto_5 * -1
	if ldb_dscto_6 > 0 then ldb_dscto_6 = ldb_dscto_6 * -1
	
	if ldb_dscto_d1 > 0 then ldb_dscto_d1 = ldb_dscto_d1 * -1
	if ldb_dscto_d2 > 0 then ldb_dscto_d2 = ldb_dscto_d2 * -1
	if ldb_dscto_d3 > 0 then ldb_dscto_d3 = ldb_dscto_d3 * -1
	if ldb_dscto_d4 > 0 then ldb_dscto_d4 = ldb_dscto_d4 * -1
	if ldb_dscto_d5 > 0 then ldb_dscto_d5 = ldb_dscto_d5 * -1
	if ldb_dscto_d6 > 0 then ldb_dscto_d6 = ldb_dscto_d6 * -1
	
	if ll_sw_derecho_sepult=0 then
		ls_tipo_mov				= 'M'
		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  ,	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"
		INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '0' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   				"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX" )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_der_sepult_uf,	'0',   						:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT',				:ls_tipo_cobro_aux )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	
	if not isnull(ls_pago_1) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_1 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_1,	:ls_pago_1,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT',				:ls_tipo_cobro_aux )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_1) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
	INTO 		:ls_tipo_cob ,																		:ls_tipo_cobro_aux 
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_1 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_1,	:ls_dscto_1,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	if not isnull(ls_pago_2) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
	INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_2 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_2,	:ls_pago_2,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_2) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
	INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_2 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_2,	:ls_dscto_2,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	if not isnull(ls_pago_3) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
	INTO 		:ls_tipo_cob ,																		:ls_tipo_cobro_aux 
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_3 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_3,	:ls_pago_3,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT',				:ls_tipo_cobro_aux )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_3) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_3 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_3,	:ls_dscto_3,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT',				:ls_tipo_cobro_aux )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	if not isnull(ls_pago_4) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_4 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_4,	:ls_pago_4,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_4) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_4 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_4,	:ls_dscto_4,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	if not isnull(ls_pago_5) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_5 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_5,	:ls_pago_5,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_5) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_5 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_5,	:ls_dscto_5,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	if not isnull(ls_pago_6) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
	INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_6 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_6,	:ls_pago_6,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_6) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_6 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_6,	:ls_dscto_6,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	//
	if ldb_der_sepult_uf_d > 0 then
		ls_tipo_mov				= 'M'
		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
		INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '0' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  			"SERIE",   		"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   				"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX" )  
			VALUES 	( :as_base_des,  :as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_der_sepult_uf_d,	'0',   						:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	
	if not isnull(ls_pago_d1) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
	INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_d1 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   		"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base_des,  :as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_pago_d1,	:ls_pago_d1,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT',				:ls_tipo_cobro_aux )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_d1) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
	INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_d1 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_dscto_d1,	:ls_dscto_d1,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT',				:ls_tipo_cobro_aux )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	if not isnull(ls_pago_d2) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_d2 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_pago_d2,	:ls_pago_d2,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_d2) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_d2 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_dscto_d2,	:ls_dscto_d2,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	if not isnull(ls_pago_d3) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_d3 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_pago_d3,	:ls_pago_d3,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_d3) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_d3 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_dscto_d3,	:ls_dscto_d3,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	if not isnull(ls_pago_d4) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE",		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"    
	INTO 		:ls_tipo_cob  ,																	:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_d4 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_pago_d4,	:ls_pago_d4,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_d4) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
	INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_d4 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_dscto_d4,	:ls_dscto_d4,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT',				:ls_tipo_cobro_aux )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	if not isnull(ls_pago_d5) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
	INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_d5 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_pago_d5,	:ls_pago_d5,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT',				:ls_tipo_cobro_aux )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_d5) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"  
	INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_d5 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA",	"TIPO_COBRO_AUX"  )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_dscto_d5,	:ls_dscto_d5,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT',				:ls_tipo_cobro_aux )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
	if not isnull(ls_pago_d6) then
		ls_tipo_mov				= 'L'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
	INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_d6 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_pago_d6,	:ls_pago_d6,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT',				:ls_tipo_cobro_aux )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	if not isnull(ls_dscto_d6) then
		ls_tipo_mov				= 'S'
	end if
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ,		"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COBRO_AUX"   
	INTO 		:ls_tipo_cob  ,																		:ls_tipo_cobro_aux
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_d6 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FT' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  			"SERIE",   			"NUMERO",   			"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE",	"TIPO_FICHA" ,	"TIPO_COBRO_AUX" )  
		VALUES 	( :as_base_des,  	:as_serie_des,   	:al_numero_des,   	:al_corr_interno,   			:al_rut_tit_d,   		:ldb_dscto_d6,	:ls_dscto_d6,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque,			'FT' ,				:ls_tipo_cobro_aux)  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	//
next
end subroutine

on w_ingreso_ficha_traslado.create
this.dw_solicitud=create dw_solicitud
this.cb_fosa_comun=create cb_fosa_comun
this.cb_datos_ctto=create cb_datos_ctto
this.dw_resumen=create dw_resumen
this.cb_2=create cb_2
this.cb_tablas=create cb_tablas
this.dw_autoriza=create dw_autoriza
this.cb_eliminar=create cb_eliminar
this.cb_print=create cb_print
this.pb_fin=create pb_fin
this.pb_antes=create pb_antes
this.pb_sigue=create pb_sigue
this.pb_primer=create pb_primer
this.cb_buscar=create cb_buscar
this.cb_grabar=create cb_grabar
this.cb_limpiar=create cb_limpiar
this.dw_print=create dw_print
this.tab_1=create tab_1
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.cb_carta=create cb_carta
this.cb_lapida=create cb_lapida
this.Control[]={this.dw_solicitud,&
this.cb_fosa_comun,&
this.cb_datos_ctto,&
this.dw_resumen,&
this.cb_2,&
this.cb_tablas,&
this.dw_autoriza,&
this.cb_eliminar,&
this.cb_print,&
this.pb_fin,&
this.pb_antes,&
this.pb_sigue,&
this.pb_primer,&
this.cb_buscar,&
this.cb_grabar,&
this.cb_limpiar,&
this.dw_print,&
this.tab_1,&
this.cb_cerrar,&
this.gb_1,&
this.gb_2,&
this.cb_carta,&
this.cb_lapida}
end on

on w_ingreso_ficha_traslado.destroy
destroy(this.dw_solicitud)
destroy(this.cb_fosa_comun)
destroy(this.cb_datos_ctto)
destroy(this.dw_resumen)
destroy(this.cb_2)
destroy(this.cb_tablas)
destroy(this.dw_autoriza)
destroy(this.cb_eliminar)
destroy(this.cb_print)
destroy(this.pb_fin)
destroy(this.pb_antes)
destroy(this.pb_sigue)
destroy(this.pb_primer)
destroy(this.cb_buscar)
destroy(this.cb_grabar)
destroy(this.cb_limpiar)
destroy(this.dw_print)
destroy(this.tab_1)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.cb_carta)
destroy(this.cb_lapida)
end on

event open;long		ll_new,ll_new_fic,ll_new_ara,ll_count_usuario
Double	ldb_valor_uf_dia

connect using Trans_1;
connect using Trans_2;
Setnull(gl_llave_fallecido_fc);Setnull(gl_cod_parque_origen_fc);Setnull(gl_numero_fc);Setnull(gl_rut_titular_fc);Setnull(gl_capacidad_fc);Setnull(gl_rut_fall_fc);Setnull(gl_edad_fc)
Setnull(gs_nombre_fallecido_fc);Setnull(gs_ap_paterno_fallecido_fc);Setnull(gs_ap_materno_fallecido_fc);Setnull(gs_area_origen_fc);Setnull(gs_sector_origen_fc);Setnull(gs_sepultura_origen_fc)
Setnull(gs_nro_resolucion_fc);Setnull(gs_nro_acta_fc);Setnull(gs_base_fc);Setnull(gs_serie_fc);Setnull(gs_cod_registro_fc);Setnull(gs_observacion_fc);Setnull(gs_area_fc)
Setnull(gs_sector_fc);Setnull(gs_sepultura_fc);Setnull(gs_nivel_fc);Setnull(gs_estado_ctto_fc);Setnull(gs_nom_titular_fc);Setnull(gs_ap_pat_titular_fc)
Setnull(gs_ap_mat_titular_fc);Setnull(gs_tipo_via_titular_fc);Setnull(gs_direc_titular_fc);Setnull(gs_nro_direc_titular_fc);Setnull(gs_depto_titular_fc);Setnull(gs_block_titular_fc)
Setnull(gs_ciudad_titular_fc);Setnull(gs_comuna_titular_fc);Setnull(gs_fono_p_titular_fc);Setnull(gs_estado_titular_fc);Setnull(gs_nro_tecnico_fc);Setnull(gs_dv_titular_fc)
Setnull(gs_dv_fall_fc);Setnull(gs_sexo_fc);Setnull(gdt_fecha_traslado_fc);Setnull(gdt_fecha_resolucion_fc);Setnull(gdt_fecha_ctto_fc);Setnull(gdt_fec_nac_fc);Setnull(gdt_fec_fall_fc)

SELECT	COUNT("FICHA_USUARIO_ESTADISTICO"."USUARIO")  
INTO 		:ll_count_usuario  
FROM 	"FICHA_USUARIO_ESTADISTICO"  
WHERE  ( "FICHA_USUARIO_ESTADISTICO"."ESTADO" = 'A' ) AND  
		 ( "FICHA_USUARIO_ESTADISTICO"."USUARIO" = :gs_user )   
USING		sqlca;
if ll_count_usuario=1 then
	is_usuario_esta	= 'S'
else
	is_usuario_esta	= 'N'
end if
il_modif			= 0
idt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))
gf_centrar(w_ingreso_ficha_traslado)
tab_1.tabpage_1.dw_ant_fall.settransobject(sqlca)
tab_1.tabpage_3.dw_ficha_sepult.settransobject(sqlca)
tab_1.tabpage_4.dw_aranceles.settransobject(sqlca)
dw_solicitud.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_resumen.settransobject(sqlca)
tab_1.tabpage_3.dw_ficha_sepult.getchild('serie_origen',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('serie_destino',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sector_origen',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sector_destino',idw_detalle4)
idw_detalle4.settransobject(sqlca)
idw_detalle4.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura_origen',idw_detalle5)
idw_detalle5.settransobject(sqlca)
idw_detalle5.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura_destino',idw_detalle6)
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('cod_comuna_titular_origen',idw_detalle7)
idw_detalle7.settransobject(sqlca)
idw_detalle7.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('cod_comuna_titular_destino',idw_detalle8)
idw_detalle8.settransobject(sqlca)
idw_detalle8.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('fecha_traslado_1',idw_detalle10)
idw_detalle10.settransobject(sqlca)
idw_detalle10.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('nivel_sepultura_origen',idw_detalle11)
idw_detalle11.settransobject(sqlca)
idw_detalle11.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('nivel_sepultura_destino',idw_detalle12)
idw_detalle12.settransobject(sqlca)
idw_detalle12.insertrow(0)
// Otros Pagos
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_1',idw_detalle13)
idw_detalle13.settransobject(sqlca)
if idw_detalle13.retrieve('FT')=0 then
	idw_detalle13.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_2',idw_detalle14)
idw_detalle14.settransobject(sqlca)
if idw_detalle14.retrieve('FT')=0 then
	idw_detalle14.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_3',idw_detalle15)
idw_detalle15.settransobject(sqlca)
if idw_detalle15.retrieve('FT')=0 then
	idw_detalle15.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_4',idw_detalle16)
idw_detalle16.settransobject(sqlca)
if idw_detalle16.retrieve('FT')=0 then
	idw_detalle16.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_5',idw_detalle17)
idw_detalle17.settransobject(sqlca)
if idw_detalle17.retrieve('FT')=0 then
	idw_detalle17.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_6',idw_detalle18)
idw_detalle18.settransobject(sqlca)
if idw_detalle18.retrieve('FT')=0 then
	idw_detalle18.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d1',idw_detalle19)
idw_detalle19.settransobject(sqlca)
if idw_detalle19.retrieve('FT')=0 then
	idw_detalle19.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d2',idw_detalle20)
idw_detalle20.settransobject(sqlca)
if idw_detalle20.retrieve('FT')=0 then
	idw_detalle20.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d3',idw_detalle21)
idw_detalle21.settransobject(sqlca)
if idw_detalle21.retrieve('FT')=0 then
	idw_detalle21.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d4',idw_detalle22)
idw_detalle22.settransobject(sqlca)
if idw_detalle22.retrieve('FT')=0 then
	idw_detalle22.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d5',idw_detalle23)
idw_detalle23.settransobject(sqlca)
if idw_detalle23.retrieve('FT')=0 then
	idw_detalle23.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d6',idw_detalle24)
idw_detalle24.settransobject(sqlca)
if idw_detalle24.retrieve('FT')=0 then
	idw_detalle24.insertrow(0)
end if
// Descuentos
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_1',idw_detalle25)
idw_detalle25.settransobject(sqlca)
if idw_detalle25.retrieve('FT')=0 then
	idw_detalle25.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_2',idw_detalle26)
idw_detalle26.settransobject(sqlca)
if idw_detalle26.retrieve('FT')=0 then
	idw_detalle26.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_3',idw_detalle27)
idw_detalle27.settransobject(sqlca)
if idw_detalle27.retrieve('FT')=0 then
	idw_detalle27.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_4',idw_detalle28)
idw_detalle28.settransobject(sqlca)
if idw_detalle28.retrieve('FT')=0 then
	idw_detalle28.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_5',idw_detalle29)
idw_detalle29.settransobject(sqlca)
if idw_detalle29.retrieve('FT')=0 then
	idw_detalle29.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_6',idw_detalle30)
idw_detalle30.settransobject(sqlca)
if idw_detalle30.retrieve('FT')=0 then
	idw_detalle30.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d1',idw_detalle31)
idw_detalle31.settransobject(sqlca)
if idw_detalle31.retrieve('FT')=0 then
	idw_detalle31.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d2',idw_detalle32)
idw_detalle32.settransobject(sqlca)
if idw_detalle32.retrieve('FT')=0 then
	idw_detalle32.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d3',idw_detalle33)
idw_detalle33.settransobject(sqlca)
if idw_detalle33.retrieve('FT')=0 then
	idw_detalle3.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d4',idw_detalle34)
idw_detalle34.settransobject(sqlca)
if idw_detalle34.retrieve('FT')=0 then
	idw_detalle34.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d5',idw_detalle35)
idw_detalle35.settransobject(sqlca)
if idw_detalle35.retrieve('FT')=0 then
	idw_detalle35.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d6',idw_detalle36)
idw_detalle36.settransobject(sqlca)
if idw_detalle36.retrieve('FT')=0 then
	idw_detalle36.insertrow(0)
end if

ll_new		= tab_1.tabpage_1.dw_ant_fall.insertrow(0)

ll_new_fic	= tab_1.tabpage_3.dw_ficha_sepult.insertrow(0)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_fic,'c_estado','N')
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_fic,'tipo_traslado','I')
tab_1.tabpage_4.dw_aranceles.getchild('codigo_parentesco',idw_detalle9)
idw_detalle9.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	idw_detalle9.retrieve(1)
elseif gs_conexion = "Parque La Foresta" then
	idw_detalle9.retrieve(11)
end if
ll_new_ara	= tab_1.tabpage_4.dw_aranceles.insertrow(0)
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_valor_uf_dia  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :idt_fecha_hoy   
USING		sqlca;
if sqlca.sqlcode=0 then
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'uf_dia',ldb_valor_uf_dia)
end if
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fic,'c_estado','S')
tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_4.dw_aranceles.setitem(ll_new_fic,'c_estado','S')
tab_1.tabpage_4.dw_aranceles.accepttext()
if gs_depto='R' or gs_depto='M' then
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
end if
tab_1.tabpage_1.dw_ant_fall.enabled			= false
tab_1.tabpage_4.dw_aranceles.enabled		= false
tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
gs_ventana	= 'w_ingreso_ficha_traslado'
f_valida_objeto2()
tab_1.tabpage_3.dw_ficha_sepult.setfocus()
tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
end event

event close;Disconnect using Trans_1;
Disconnect using Trans_2;
end event

type dw_solicitud from datawindow within w_ingreso_ficha_traslado
integer x = 2743
integer y = 2584
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_imprimir_solicitud_traslado_externo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_fosa_comun from commandbutton within w_ingreso_ficha_traslado
integer x = 2958
integer y = 20
integer width = 658
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fallecidos en Fosa Común"
end type

event clicked;String		ls_string
Long		ll_cod_parque

ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')

if ll_cod_parque > 0 then
	ls_string				= string(ll_cod_parque)
	if isvalid(w_lista_fosa_comun_para_fs_parque) then close(w_lista_fosa_comun_para_fs_parque)
	openwithparm(w_lista_fosa_comun_para_fs_parque,ls_string)
else
	messagebox("Advertencia","Debe Seleccionar Parque")
	tab_1.tabpage_3.dw_ficha_sepult.setfocus()
	tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
end if
end event

type cb_datos_ctto from commandbutton within w_ingreso_ficha_traslado
integer x = 2601
integer y = 2380
integer width = 283
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Datos Ctto"
end type

event clicked;String		ls_tipo_tras, ls_destino

ls_tipo_tras			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'tipo_traslado')
ls_destino			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'destino_parque')
if ls_tipo_tras = 'I' then
	gs_base			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'base_origen')
	gs_serie			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'serie_origen')
	gi_numero		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'numero_origen')
	gi_rut				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'rut_titular_origen')
else
	if ls_destino='E' then
		gs_base			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'base_destino')
		gs_serie			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'serie_destino')
		gi_numero		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'numero_destino')
		gi_rut				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'rut_titular_destino')
	else
		gs_base			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'base_origen')
		gs_serie			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'serie_origen')
		gi_numero		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'numero_origen')
		gi_rut				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'rut_titular_origen')
	end if
end if
if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 and gi_rut>0 and  tab_1.tabpage_3.dw_ficha_sepult.rowcount()>0 then
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_datos_contrato_oferta) then close(w_datos_contrato_oferta)
			Open(w_datos_contrato_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_datos_contrato_liberador) then close(w_datos_contrato_liberador)
			Open(w_datos_contrato_liberador)
		CASE "P" // Pagaré
			if isvalid(w_datos_contrato_pagare) then close(w_datos_contrato_pagare)
			Open(w_datos_contrato_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_datos_contrato_isa) then close(w_datos_contrato_isa)
			Open(w_datos_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_datos_contrato_derecho) then close(w_datos_contrato_derecho)
			Open(w_datos_contrato_derecho)	
		CASE "R" // Reprogramacion Cta. Mant.
			if isvalid(w_datos_contrato_reprogramacion_cta_mant) then close(w_datos_contrato_reprogramacion_cta_mant)
			open(w_datos_contrato_reprogramacion_cta_mant)
		CASE "A" // Aumento Capacidad
			if isvalid(w_datos_contrato_aumento_capacidad) then close(w_datos_contrato_aumento_capacidad)
			open(w_datos_contrato_aumento_capacidad)
	END CHOOSE
end if
end event

type dw_resumen from datawindow within w_ingreso_ficha_traslado
integer x = 1934
integer y = 2556
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_imprimir_traslado_resumen"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_ingreso_ficha_traslado
integer x = 2025
integer y = 2380
integer width = 366
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = " Ficha Marcado"
end type

event clicked;Long		ll_cod_parque,ll_count_reg
String	ls_sector,ls_sepultura
Datetime	ldt_fecha_sepult

tab_1.tabpage_3.dw_ficha_sepult.accepttext()
ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_origen')
ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_origen')
ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
SELECT	Count("FICHA_TRASLADO"."FECHA_TRASLADO")  
INTO 		:ll_count_reg  
FROM 		"FICHA_TRASLADO"  
WHERE  ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fecha_sepult ) AND  
		 ( "FICHA_TRASLADO"."SECTOR_ORIGEN" = :ls_sector ) AND  
		 ( "FICHA_TRASLADO"."SEPULTURA_ORIGEN" = :ls_sepultura ) AND  
		 ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque )   
USINg		sqlca;
if ll_count_reg>0 then
	dw_resumen.reset()
	dw_resumen.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
	if dw_resumen.rowcount() > 0 then 
		f_Print( dw_resumen )
	end if
end if
end event

type cb_tablas from commandbutton within w_ingreso_ficha_traslado
integer x = 2395
integer y = 2380
integer width = 201
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Tablas"
end type

event clicked;if isvalid(w_mantenedor_fune_diac_parques) then close(w_mantenedor_fune_diac_parques)
open(w_mantenedor_fune_diac_parques)
end event

type dw_autoriza from datawindow within w_ingreso_ficha_traslado
boolean visible = false
integer x = 1147
integer y = 2528
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_imprimir_autoriza_traslado_interno"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_eliminar from commandbutton within w_ingreso_ficha_traslado
integer x = 864
integer y = 2384
integer width = 210
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_resp,ll_tot_reg,ll_cod_parque,ll_count,ll_corr,fila1,fila3,fila4
String	ls_sector,ls_sepultura,ls_nom_fall,ls_ap_pat_fall
datetime	ldt_fecha_sepult,ldt_fecha_hoy
Double	ldb_valor_uf_dia

ll_tot_reg					= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
ll_cod_parque				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_tot_reg,'cod_parque')
ls_sector					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_tot_reg,'sector_origen')
ls_sepultura				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_tot_reg,'sepultura_origen')
ldt_fecha_sepult			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(ll_tot_reg,'fecha_traslado')
if ll_tot_reg > 0 and not isnull(ldt_fecha_sepult) and not isnull(ls_sector) and not isnull(ls_sepultura) and ll_cod_parque > 0 then
	ll_resp	= messagebox("Advertencia","Recuerde se Eliminará Siempre La Ultima Ficha de Traslado, Está seguro de Eliminar",Exclamation!,YesNo!,2)
	if ll_resp=1 then
		ldt_fecha_hoy		= datetime(date(gdt_fec_sistema),time('00:00:00'))
		ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_tot_reg,'cod_parque')
		ls_sector			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_tot_reg,'sector_origen')
		ls_sepultura		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_tot_reg,'sepultura_origen')
		ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(ll_tot_reg,'fecha_traslado')
		ls_nom_fall			= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_tot_reg,'nombre_fallecido')
		ls_ap_pat_fall		= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_tot_reg,'apellido_paterno_fall')
		ll_corr				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_tot_reg,'folio')
		if not isnull(ldt_fecha_sepult) and ll_cod_parque>0 and not isnull(ls_sector) and not isnull(ls_sepultura) then
			SELECT	Count("FICHA_TRASLADO"."COD_PARQUE")  
			INTO 		:ll_count  
			FROM 		"FICHA_TRASLADO"  
			WHERE  ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque ) AND  
					 ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fecha_sepult ) AND  
					 ( "FICHA_TRASLADO"."SECTOR_ORIGEN" = :ls_sector ) AND  
					 ( "FICHA_TRASLADO"."SEPULTURA_ORIGEN" = :ls_sepultura ) AND
					 ( "FICHA_TRASLADO"."NOMBRE_FALLECIDO" = :ls_nom_fall ) AND
					 ( "FICHA_TRASLADO"."APELLIDO_PATERNO_FALL" = :ls_ap_pat_fall )
			USING		sqlca;
			if ll_count>0 then
				
				tab_1.tabpage_3.dw_ficha_sepult.deleterow(ll_tot_reg)
				if tab_1.tabpage_3.dw_ficha_sepult.update()=1 then
					commit;
					DELETE FROM "FICHA_CARTA_SEPULTACION"  
					WHERE 	( "FICHA_CARTA_SEPULTACION"."FECHA_CARTA" = :ldt_fecha_sepult ) AND  
								( "FICHA_CARTA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
								( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
								( "FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
								( "FICHA_CARTA_SEPULTACION"."NOMBRE_FALLECIDO" = :ls_nom_fall ) AND
								( "FICHA_CARTA_SEPULTACION"."APELLIDO_PATERNO_FALL" = :ls_ap_pat_fall )
								
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					DELETE FROM "FICHA_GRABACION_LAPIDA"  
					WHERE 	( "FICHA_GRABACION_LAPIDA"."FECHA" = :ldt_fecha_sepult ) AND  
								( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
								( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
								( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "FICHA_GRABACION_LAPIDA"."NOMBRE_FALLECIDO" = :ls_nom_fall ) AND
								( "FICHA_GRABACION_LAPIDA"."APELLIDO_PATERNO_FALL" = :ls_ap_pat_fall )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					ll_tot_reg	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					if ll_tot_reg = 0 then
						tab_1.tabpage_1.dw_ant_fall.reset()
						tab_1.tabpage_3.dw_ficha_sepult.reset()
						tab_1.tabpage_4.dw_aranceles.reset()
						idw_detalle.reset()
						idw_detalle.insertrow(0)
						idw_detalle2.reset()
						idw_detalle2.insertrow(0)
						idw_detalle3.reset()
						idw_detalle3.insertrow(0)
						idw_detalle4.reset()
						idw_detalle4.insertrow(0)
						idw_detalle5.reset()
						idw_detalle5.insertrow(0)
						idw_detalle6.reset()
						idw_detalle6.insertrow(0)
						idw_detalle7.reset()
						idw_detalle7.insertrow(0)
						idw_detalle8.reset()
						idw_detalle8.insertrow(0)
						idw_detalle10.reset()
						idw_detalle10.insertrow(0)
						fila1	= tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
						fila3 = tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
						fila4 = tab_1.tabpage_4.dw_aranceles.InsertRow(0)
						tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'c_estado','N')
						idw_detalle9.reset()
						if gs_conexion	= "Parque El Prado" then
							idw_detalle9.retrieve(1)
						elseif gs_conexion = "Parque La Foresta" then
							idw_detalle9.retrieve(11)
						end if
						SELECT	"TAB_UF"."VALOR_UF"  
						INTO 		:ldb_valor_uf_dia  
						FROM 		"TAB_UF"  
						WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							tab_1.tabpage_4.dw_aranceles.setitem(fila4,'uf_dia',ldb_valor_uf_dia)
						end if
						if gs_depto='R' or gs_depto='M' then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'codigo_ejecutivo',gs_user)
						end if
						tab_1.SelectTab(1)
						tab_1.tabpage_1.dw_ant_fall.setitem(fila1,'c_estado','S')
						tab_1.tabpage_4.dw_aranceles.setitem(fila4,'c_estado','S')
						tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'tipo_traslado','I')
						tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'estado_reg','P')
						tab_1.tabpage_1.dw_ant_fall.enabled			= false
						tab_1.tabpage_4.dw_aranceles.enabled		= false
						tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
						tab_1.tabpage_3.dw_ficha_sepult.setfocus()
						tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
					end if
					messagebox("Eliminar","Eliminación Exitosa")
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
					tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				else
					rollback;
				end if
			end if
		end if		
	end if
end if
end event

type cb_print from commandbutton within w_ingreso_ficha_traslado
integer x = 649
integer y = 2384
integer width = 215
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Long ll_cod_parque,ll_count_reg, ll_tot_fila,ll_indi
String ls_sector,ls_sepultura,ls_tipo_traslado,ls_destino_parque,ls_nom_fall,ls_ap_pat_fall
Datetime ldt_fecha_sepult

tab_1.tabpage_3.dw_ficha_sepult.accepttext()
ll_cod_parque = tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
ls_sector = tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_origen')
ls_sepultura = tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_origen')
ldt_fecha_sepult = tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
SELECT Count("FICHA_TRASLADO"."COD_PARQUE")
INTO :ll_count_reg
FROM "FICHA_TRASLADO"
WHERE ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque ) AND
( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fecha_sepult ) AND
( "FICHA_TRASLADO"."SECTOR_ORIGEN" = :ls_sector ) AND
( "FICHA_TRASLADO"."SEPULTURA_ORIGEN" = :ls_sepultura )
USING sqlca;
if ll_count_reg>0 then
	dw_print.reset()
	dw_print.getchild('codigo_parentesco',idw_detalle9)
	idw_detalle9.settransobject(sqlca)
	idw_detalle9.retrieve(ll_cod_parque)
	ll_tot_fila = dw_print.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
	if dw_print.rowcount() > 0 then
		f_Print( dw_print )
		dw_print.print()
		for ll_indi = 1 to ll_tot_fila
			ls_tipo_traslado 	= dw_print.getitemstring(ll_indi,'tipo_traslado')
			ls_destino_parque = dw_print.getitemstring(ll_indi,'destino_parque')
			ls_nom_fall 			= dw_print.getitemstring(ll_indi,'nombre_fallecido')
			ls_ap_pat_fall = dw_print.getitemstring(ll_indi,'apellido_paterno_fall')
			if ls_tipo_traslado='I' then
				dw_autoriza.dataobject = 'dw_imprimir_autoriza_traslado_interno'
				dw_solicitud.dataobject = 'dw_imprimir_solicitud_traslado_interno'
			elseif ls_tipo_traslado='E' then
				dw_autoriza.dataobject = 'dw_imprimir_autoriza_traslado_externo'
				dw_solicitud.dataobject = 'dw_imprimir_solicitud_traslado_externo'
			end if
			dw_autoriza.settransobject(sqlca)
			dw_solicitud.settransobject(sqlca)
			if dw_autoriza.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult,ls_tipo_traslado,ls_nom_fall,ls_ap_pat_fall)>0 then
				dw_autoriza.print()
			end if
			if dw_solicitud.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult,ls_tipo_traslado,ls_nom_fall,ls_ap_pat_fall)>0 then
				dw_solicitud.print()
			end if
		next
	end if
end if





//Long		ll_cod_parque,ll_count_reg, ll_tot_fila,ll_indi
//String	ls_sector,ls_sepultura,ls_tipo_traslado,ls_destino_parque,ls_nom_fall,ls_ap_pat_fall
//Datetime	ldt_fecha_sepult
//
//tab_1.tabpage_3.dw_ficha_sepult.accepttext()
//ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
//ls_sector			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_origen')
//ls_sepultura		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_origen')
//ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
//SELECT	Count("FICHA_TRASLADO"."COD_PARQUE")  
//INTO 		:ll_count_reg  
//FROM 		"FICHA_TRASLADO"  
//WHERE  ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque ) AND  
//		 ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fecha_sepult ) AND  
//		 ( "FICHA_TRASLADO"."SECTOR_ORIGEN" = :ls_sector ) AND  
//		 ( "FICHA_TRASLADO"."SEPULTURA_ORIGEN" = :ls_sepultura )   
//USING		sqlca;
//if ll_count_reg>0 then
//	dw_print.reset()
//	dw_print.getchild('codigo_parentesco',idw_detalle9)
//	idw_detalle9.settransobject(sqlca)
//	idw_detalle9.retrieve(ll_cod_parque)
//	
//	ll_tot_fila									= dw_print.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
//	if dw_print.rowcount() > 0 then 
//		f_Print( dw_print )
//		dw_print.print()
//		for ll_indi = 1 to ll_tot_fila
//			ls_tipo_traslado					= dw_print.getitemstring(ll_indi,'tipo_traslado')
//			ls_destino_parque					= dw_print.getitemstring(ll_indi,'destino_parque')
//			ls_nom_fall							= dw_print.getitemstring(ll_indi,'nombre_fallecido')
//			ls_ap_pat_fall						= dw_print.getitemstring(ll_indi,'apellido_paterno_fall')
//			if ls_tipo_traslado='I' then
//				dw_autoriza.dataobject		= 'dw_imprimir_autoriza_traslado_interno'
//			elseif ls_tipo_traslado='E' then
//				dw_autoriza.dataobject		= 'dw_imprimir_autoriza_traslado_externo'
//			end if
//			dw_autoriza.settransobject(sqlca)
//			if dw_autoriza.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult,ls_tipo_traslado,ls_nom_fall,ls_ap_pat_fall)>0 then
//				dw_autoriza.print()
//			end if
//		next
//	end if
//end if
end event

type pb_fin from picturebutton within w_ingreso_ficha_traslado
integer x = 3250
integer y = 2384
integer width = 101
integer height = 88
integer taborder = 160
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_ant_fall.ScrollToRow(tab_1.tabpage_1.dw_ant_fall.rowcount())
tab_1.tabpage_3.dw_ficha_sepult.ScrollToRow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
tab_1.tabpage_4.dw_aranceles.ScrollToRow(tab_1.tabpage_4.dw_aranceles.rowcount())

if tab_1.SelectedTab=1 then
	 tab_1.tabpage_3.dw_ficha_sepult.setfocus()
elseif tab_1.SelectedTab=2 then
	tab_1.tabpage_1.dw_ant_fall.setfocus()
elseif tab_1.SelectedTab=3 then
	tab_1.tabpage_4.dw_aranceles.setfocus()
end if
end event

type pb_antes from picturebutton within w_ingreso_ficha_traslado
integer x = 3150
integer y = 2384
integer width = 101
integer height = 88
integer taborder = 150
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_row
if tab_1.SelectedTab=1 then
	ll_row	= tab_1.tabpage_3.dw_ficha_sepult.getrow()
elseif tab_1.SelectedTab=2 then
	ll_row	= tab_1.tabpage_1.dw_ant_fall.getrow()
elseif tab_1.SelectedTab=3 then
	ll_row	= tab_1.tabpage_4.dw_aranceles.getrow()
end if
ll_row		= ll_row + 1
if ll_row > tab_1.tabpage_3.dw_ficha_sepult.rowcount() then ll_row = tab_1.tabpage_3.dw_ficha_sepult.rowcount()
tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)

if tab_1.SelectedTab=1 then
	 tab_1.tabpage_3.dw_ficha_sepult.setfocus()
elseif tab_1.SelectedTab=2 then
	tab_1.tabpage_1.dw_ant_fall.setfocus()
elseif tab_1.SelectedTab=3 then
	tab_1.tabpage_4.dw_aranceles.setfocus()
end if
end event

type pb_sigue from picturebutton within w_ingreso_ficha_traslado
integer x = 3049
integer y = 2384
integer width = 101
integer height = 88
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_row
if tab_1.SelectedTab=1 then
	ll_row	= tab_1.tabpage_3.dw_ficha_sepult.getrow()
elseif tab_1.SelectedTab=2 then
	ll_row	= tab_1.tabpage_1.dw_ant_fall.getrow()
elseif tab_1.SelectedTab=3 then
	ll_row	= tab_1.tabpage_4.dw_aranceles.getrow()
end if
ll_row		= ll_row - 1
if ll_row=0 then ll_row = 1
tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)

if tab_1.SelectedTab=1 then
	 tab_1.tabpage_3.dw_ficha_sepult.setfocus()
elseif tab_1.SelectedTab=2 then
	tab_1.tabpage_1.dw_ant_fall.setfocus()
elseif tab_1.SelectedTab=3 then
	tab_1.tabpage_4.dw_aranceles.setfocus()
end if
end event

type pb_primer from picturebutton within w_ingreso_ficha_traslado
integer x = 2949
integer y = 2384
integer width = 101
integer height = 88
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_ant_fall.ScrollToRow(1)
tab_1.tabpage_3.dw_ficha_sepult.ScrollToRow(1)
tab_1.tabpage_4.dw_aranceles.ScrollToRow(1)
if tab_1.SelectedTab=1 then
	 tab_1.tabpage_3.dw_ficha_sepult.setfocus()
elseif tab_1.SelectedTab=2 then
	tab_1.tabpage_1.dw_ant_fall.setfocus()
elseif tab_1.SelectedTab=3 then
	tab_1.tabpage_4.dw_aranceles.setfocus()
end if
end event

type cb_buscar from commandbutton within w_ingreso_ficha_traslado
integer x = 288
integer y = 2380
integer width = 329
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Ficha"
end type

event clicked;if isvalid(w_buscar_ficha) then close(w_buscar_ficha)
Long		fila1, fila2, fila3, fila4,ll_resp
string 	ls_tabpage
Double	ldb_valor_uf_dia
datetime	ldt_fecha_hoy

tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
tab_1.tabpage_1.dw_ant_fall.reset()
tab_1.tabpage_3.dw_ficha_sepult.reset()
tab_1.tabpage_4.dw_aranceles.reset()
tab_1.tabpage_3.dw_ficha_sepult.getchild('serie_origen',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('serie_destino',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sector_origen',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sector_destino',idw_detalle4)
idw_detalle4.settransobject(sqlca)
idw_detalle4.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura_origen',idw_detalle5)
idw_detalle5.settransobject(sqlca)
idw_detalle5.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura_destino',idw_detalle6)
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('cod_comuna_titular_origen',idw_detalle7)
idw_detalle7.settransobject(sqlca)
idw_detalle7.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('cod_comuna_titular_destino',idw_detalle8)
idw_detalle8.settransobject(sqlca)
idw_detalle8.insertrow(0)

// Otros Pagos
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_1',idw_detalle13)
idw_detalle13.settransobject(sqlca)
if idw_detalle13.retrieve('FT')=0 then
	idw_detalle13.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_2',idw_detalle14)
idw_detalle14.settransobject(sqlca)
if idw_detalle14.retrieve('FT')=0 then
	idw_detalle14.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_3',idw_detalle15)
idw_detalle15.settransobject(sqlca)
if idw_detalle15.retrieve('FT')=0 then
	idw_detalle15.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_4',idw_detalle16)
idw_detalle16.settransobject(sqlca)
if idw_detalle16.retrieve('FT')=0 then
	idw_detalle16.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_5',idw_detalle17)
idw_detalle17.settransobject(sqlca)
if idw_detalle17.retrieve('FT')=0 then
	idw_detalle17.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_6',idw_detalle18)
idw_detalle18.settransobject(sqlca)
if idw_detalle18.retrieve('FT')=0 then
	idw_detalle18.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d1',idw_detalle19)
idw_detalle19.settransobject(sqlca)
if idw_detalle19.retrieve('FT')=0 then
	idw_detalle19.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d2',idw_detalle20)
idw_detalle20.settransobject(sqlca)
if idw_detalle20.retrieve('FT')=0 then
	idw_detalle20.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d3',idw_detalle21)
idw_detalle21.settransobject(sqlca)
if idw_detalle21.retrieve('FT')=0 then
	idw_detalle21.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d4',idw_detalle22)
idw_detalle22.settransobject(sqlca)
if idw_detalle22.retrieve('FT')=0 then
	idw_detalle22.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d5',idw_detalle23)
idw_detalle23.settransobject(sqlca)
if idw_detalle23.retrieve('FT')=0 then
	idw_detalle23.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_d6',idw_detalle24)
idw_detalle24.settransobject(sqlca)
if idw_detalle24.retrieve('FT')=0 then
	idw_detalle24.insertrow(0)
end if
// Descuentos
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_1',idw_detalle25)
idw_detalle25.settransobject(sqlca)
if idw_detalle25.retrieve('FT')=0 then
	idw_detalle25.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_2',idw_detalle26)
idw_detalle26.settransobject(sqlca)
if idw_detalle26.retrieve('FT')=0 then
	idw_detalle26.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_3',idw_detalle27)
idw_detalle27.settransobject(sqlca)
if idw_detalle27.retrieve('FT')=0 then
	idw_detalle27.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_4',idw_detalle28)
idw_detalle28.settransobject(sqlca)
if idw_detalle28.retrieve('FT')=0 then
	idw_detalle28.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_5',idw_detalle29)
idw_detalle29.settransobject(sqlca)
if idw_detalle29.retrieve('FT')=0 then
	idw_detalle29.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_6',idw_detalle30)
idw_detalle30.settransobject(sqlca)
if idw_detalle30.retrieve('FT')=0 then
	idw_detalle30.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d1',idw_detalle31)
idw_detalle31.settransobject(sqlca)
if idw_detalle31.retrieve('FT')=0 then
	idw_detalle31.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d2',idw_detalle32)
idw_detalle32.settransobject(sqlca)
if idw_detalle32.retrieve('FT')=0 then
	idw_detalle32.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d3',idw_detalle33)
idw_detalle33.settransobject(sqlca)
if idw_detalle33.retrieve('FT')=0 then
	idw_detalle3.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d4',idw_detalle34)
idw_detalle34.settransobject(sqlca)
if idw_detalle34.retrieve('FT')=0 then
	idw_detalle34.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d5',idw_detalle35)
idw_detalle35.settransobject(sqlca)
if idw_detalle35.retrieve('FT')=0 then
	idw_detalle35.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_d6',idw_detalle36)
idw_detalle36.settransobject(sqlca)
if idw_detalle36.retrieve('FT')=0 then
	idw_detalle36.insertrow(0)
end if

fila1	= tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
fila3 	= tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
fila4 	= tab_1.tabpage_4.dw_aranceles.InsertRow(0)
tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'c_estado','N')
tab_1.tabpage_4.dw_aranceles.getchild('codigo_parentesco',idw_detalle9)
idw_detalle9.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	idw_detalle9.retrieve(1)
elseif gs_conexion = "Parque La Foresta" then
	idw_detalle9.retrieve(11)
end if
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_valor_uf_dia  
FROM 	"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
USING	sqlca;
if sqlca.sqlcode=0 then
	tab_1.tabpage_4.dw_aranceles.setitem(fila4,'uf_dia',ldb_valor_uf_dia)
end if
if gs_depto='R' or gs_depto='M' then
	tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'codigo_ejecutivo',gs_user)
end if
tab_1.tabpage_3.dw_ficha_sepult.setfocus()
tab_1.SelectTab(1)
tab_1.tabpage_1.dw_ant_fall.setitem(fila1,'c_estado','S')
tab_1.tabpage_4.dw_aranceles.setitem(fila4,'c_estado','S')
tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'tipo_traslado','I')
tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'estado_reg','P')
tab_1.tabpage_3.dw_ficha_sepult.setfocus()
tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
OpenWithParm(w_buscar_ficha, "FT")
end event

type cb_grabar from commandbutton within w_ingreso_ficha_traslado
integer x = 46
integer y = 2380
integer width = 238
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string   	ls_pasa_dscto='N',ls_sw='S',ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_direc_fall,ls_dpto_dir_fall,ls_block_dir_fall,ls_sector_fall,ls_villa_fall,ls_ciud_fall,ls_comu_fall,ls_cod_est_fall,ls_causa_fall,&
			ls_num_dir_fall,ls_dv_tit_ori,ls_nombre_tit_ori,ls_ap_pat_tit_ori,ls_ap_mat_tit_ori,ls_dir_tit_ori,ls_nro_dir_tit_ori,ls_dep_tit_ori,ls_block_tit_ori,ls_sector_tit_ori,ls_villa_tit_ori,&
			ls_ciudad_tit_ori,ls_comuna_tit_ori,ls_base,ls_serie,ls_estad_contrato,ls_sector,ls_sepultura,ls_numero_tecni,ls_nivel,ls_est_sep_compl,ls_obs_sep_comp,ls_obs_credito,ls_obs_manten,ls_fono_titular,ls_ejecutivo,&
			ls_fono_funera,ls_pase_sepult,ls_tipo_via_tit_ori,ls_parentesco,ls_sector1,ls_sepultura1,ls_dv_tit_des,ls_tipo_via_tit_des,ls_dir_tit_des,ls_nro_dir_tit_des,ls_dep_tit_des,ls_block_tit_des,&
			ls_ciudad_tit_des,ls_comuna_tit_des,ls_base_des,ls_serie_des,ls_estad_contrato_des,ls_numero_tecni_des,ls_nivel_des,ls_est_sep_compl_des,ls_obs_sep_comp_des,ls_reg_civil_pase,ls_nro_inscrip_pase,&
			ls_nro_registro_pase,ls_obs_pase,ls_obs_ori,ls_obs_ori_des,ls_tipo_traslado,ls_usuario,ls_estado_reg,ls_estado_doc1,ls_estado_doc2,ls_cod_age_aux,ls_estado_ctto,ls_primera_sepultura,ls_pasa_mora,&
			ls_nom_usuario,ls_obs_fall,ls_email,ls_descrip_parque,ls_fono_com_tit,ls_destino,email_de,ls_email_para,ls_res,ls_dscto_1,ls_cod_reg_pase,ls_inscripcion_pase,&
			ls_pago_otro_1,ls_pago_otro_d1,ls_dscto__otro_1,ls_dscto__otro_d1, ls_pago_otro_2,ls_pago_otro_d2,ls_dscto__otro_2,ls_dscto__otro_d2, ls_pago_otro_3,ls_pago_otro_d3,&
			ls_dscto_otro_3,ls_dscto_otro_d3, ls_pago_otro_4,ls_pago_otro_d4,ls_dscto_otro_4,ls_dscto_otro_d4, ls_pago_otro_5,ls_pago_otro_d5,ls_dscto__otro_5,ls_dscto_otro_d5,&
			ls_pago_otro_6,ls_pago_otro_d6,ls_dscto_otro_6,ls_dscto_otro_d6,ls_valdscto_otro_1,ls_valdscto_otro_2,ls_valdscto_otro_3,ls_valdscto_otro_4,ls_valdscto_otro_5,ls_valdscto_otro_6,&
			ls_valdscto_otro_d1,ls_valdscto_otro_d2,ls_valdscto_otro_d3,ls_valdscto_otro_d4,ls_valdscto_otro_d5,ls_valdscto_otro_d6,ls_dscto_d1,ls_tipo_tras,ls_sector_val,ls_sepultura_val,&
			ls_sexo_fall,ls_funeraria,ls_otorgado_por,ls_op,base_s,serie_s,ls_sector_s,ls_sepultura_s,ls_nombre_s,ls_ap_pat_s,ls_ap_mat_s,ls_est_s,ls_op_s,ls_dv_s,ls_sexo_s,ls_periodo_s,ls_pase_s,ls_otorgado_por_s,&
			ls_causa_fall_s,ls_enf_obl_s,ls_funeraria_s,ls_boleta_s,ls_carta_aut_s,ls_n_tec_s,ls_nivel_s,ls_vta_s,ls_observaciones_s,ls_estado_contrato_s,ls_registro_pase_s,ls_cementerio_origen_s,&
			ls_nro_sarcofago_s,ls_cod_usuario_s,ls_usuario_ult_mod,ls_estado_exhum_s,ls_estado_inhuma_s,ls_estado_ti_s,ls_estado_te_s,ls_estado_re_s,ls_estado_tr_s,ls_estado_crem_s,ls_estado_reg_s,&
			ls_estado_fall_s,ls_base_dest_s,ls_serie_dest_s,ls_usuario_crea_s,ls_tipo_ficha_s,ls_resol_traslado_nro_s,ls_nuevo,ls_periodo_nacimiento,ls_estado_tit,ls_estado_reg_ft
long 		ll_rut_fall,ret,ll_rut_tit_ori,ll_hora_sepult,ll_minuto_sepult,ll_funeraria,ll_parque,ll_capacidad,ll_cant_sepultados,ll_cap_libre_sep,ll_res_grabar,&
			ll_est_credito,ll_est_manten,ll_count,ll_hora_hoy,ll_minutos_hoy,ll_edad_fall,ll_count_reg,ll_comprobante,ll_tot_reg,ll_indi,ll_corr_interno,ll_parque1,ll_rut_tit_des,ll_parque_des,&
			ll_anno_pase,ll_comprobante_des,ll_corr,ll_parque_aux,ll_cod_imagen,ll_count_fall,ll_mora_cred,ll_mora_mant,ll_res,ll_count_reg_aux,ll_hora_sepult_aux,ll_min_sepult_aux,&
			fila1,fila3,fila4,ll_max_ficha,ll_sw_derecho,ll_sw_dscto_1,ll_nm,ll_nl,ll_rut_s,ll_edad_s,ll_llave_s,ll_count_parque_s,ll_n_l_s,ll_n_m_s,numero_s,ll_corr_hist_reg_s,ll_cod_parque_s,&
			ll_llave_anterior_s,ll_folio_encuesta_s,ll_covid_s,ll_ubicacion_cuerpo_s,ll_numero_dest_s,ll_llave,	ll_sw_pago_1,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,&
			ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6,ll_row,ll_cod_parque_val,ll_folio,ll_corr_ficha,ll_count_ft
Datetime	ldt_fec_defun,ldt_fec_nac,ldt_fech_sepult,ldt_fech_contrato,ldt_fech_recep,ldt_fecha_hoy,ldt_fecha_sepult1,ldt_fech_contrato_des,ldt_fech_recep_des,ldt_fec_pase,ldt_fecha_defuncion,&
			ldt_fecha_nac_fall,ldt_fec_sepult_s,ldt_fec_nac_s,ldt_fec_fall_s,ldt_fecha_ult_mod_s,ldt_fecha_exhum_s,ldt_fecha_inhuma_s,ldt_fecha_ti_s,ldt_fecha_te_s,ldt_fecha_re_s,ldt_fecha_tr_s,&
			ldt_fecha_crem_s,ldt_fecha_crea_s
Double	ldb_uf_dia,ldb_der_sepult_uf,ldb_mov_sarcofago,ldb_cambio_ubica,ldb_reduccion,ldb_cert_defuncion,ldb_monto_canc,ldb_monto_canc_des,ldb_valor_uf_dia,ll_numero,ll_numero_des,ll_num_inven,&
			ldb_dscto_1,ldb_monto_otro_1,ldb_monto_otro_2,ldb_monto_otro_3,ldb_monto_otro_4,ldb_monto_otro_5,ldb_monto_otro_6,ldb_monto_otro_d1,ldb_monto_otro_d2,&
			ldb_monto_otro_d3,ldb_monto_otro_d4,ldb_monto_otro_d5,ldb_monto_otro_d6,ldb_dscto_otro_1,ldb_dscto_otro_2,ldb_dscto_otro_3,ldb_dscto_otro_4,ldb_dscto_otro_5,ldb_dscto_otro_6,ldb_dscto_otro_d1,ldb_dscto_otro_d2,&
			ldb_dscto_otro_d3,ldb_dscto_otro_d4,ldb_dscto_otro_d5,ldb_dscto_otro_d6,ll_tot_pago_ori,ll_tot_pago_des,ldb_dscto_d1,ll_llave_fallecido

tab_1.tabpage_4.dw_aranceles.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
tab_1.tabpage_1.dw_ant_fall.accepttext()
if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_estado')='S' then
	ls_pasa_mora				= 'N'
	
	ll_tot_pago_ori				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'c_total_ori')
	ll_tot_pago_des			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'c_total_des')
	
	ll_sw_pago_1				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_1')
	ll_sw_pago_2				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_2')
	ll_sw_pago_3				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_3')
	ll_sw_pago_4				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_4')
	ll_sw_pago_5				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_5')
	ll_sw_pago_6				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_6')
	ll_sw_dscto_1				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_1')
	ll_sw_dscto_2				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_2')
	ll_sw_dscto_3				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_3')
	ll_sw_dscto_4				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_4')
	ll_sw_dscto_5				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_5')
	ll_sw_dscto_6				= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_6')

	ls_pago_otro_1				= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_1')
	ldb_monto_otro_1			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_1')
	ls_pago_otro_d1			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d1')
	ldb_monto_otro_d1		= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d1')
	ls_valdscto_otro_1			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_1')
	ldb_dscto_otro_1			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_1')
	ls_valdscto_otro_d1		= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_d1')
	ldb_dscto_otro_d1			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_d1')
	
	ls_pago_otro_2				= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_2')
	ldb_monto_otro_2			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_2')
	ls_pago_otro_d2			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d2')
	ldb_monto_otro_d2		= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d2')
	ls_valdscto_otro_2			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_2')
	ldb_dscto_otro_2			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_2')
	ls_valdscto_otro_d2		= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_d2')
	ldb_dscto_otro_d2			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_d2')
	
	ls_pago_otro_3				= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_3')
	ldb_monto_otro_3			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_3')
	ls_pago_otro_d3			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d3')
	ldb_monto_otro_d3		= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d3')
	ls_valdscto_otro_3			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_3')
	ldb_dscto_otro_3			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_3')
	ls_valdscto_otro_d3		= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_d3')
	ldb_dscto_otro_d3			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_d3')
	
	ls_pago_otro_4				= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_4')
	ldb_monto_otro_4			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_4')
	ls_pago_otro_d4			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d4')
	ldb_monto_otro_d4		= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d4')
	ls_valdscto_otro_4			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_4')
	ldb_dscto_otro_4			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_4')
	ls_valdscto_otro_d4		= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_d4')
	ldb_dscto_otro_d4			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_d4')
	
	ls_pago_otro_5				= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_5')
	ldb_monto_otro_5			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_5')
	ls_pago_otro_d5			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d5')
	ldb_monto_otro_d5		= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d5')
	ls_valdscto_otro_5			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_5')
	ldb_dscto_otro_5			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_5')
	ls_valdscto_otro_d5		= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_d5')
	ldb_dscto_otro_d5			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_d5')
	
	ls_pago_otro_6				= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_6')
	ldb_monto_otro_6			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_6')
	ls_pago_otro_d6			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d6')
	ldb_monto_otro_d6		= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d6')
	ls_valdscto_otro_6			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_6')
	ldb_dscto_otro_6			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_6')
	ls_dscto_otro_d6			= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_d6')
	ldb_dscto_otro_d6			= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_d6')
	ls_base						= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'base_origen')
	ls_serie						= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'serie_origen')
	ll_numero					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'numero_origen')
	ll_row							= tab_1.tabpage_3.dw_ficha_sepult.getrow()
	ls_tipo_tras					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'tipo_traslado')
	if ls_tipo_tras='I' then
		ls_sector_val			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sector_destino')
		ls_sepultura_val		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sepultura_destino')
		ll_cod_parque_val		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_row,'cod_parque')
	else
		ls_sector_val			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sector_origen')
		ls_sepultura_val		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sepultura_origen')
		ll_cod_parque_val		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_row,'cod_parque')
	end if
	SELECT 	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT"  
	INTO 		:ll_mora_cred,					:ll_mora_mant
	FROM 	"CADENA_MORA"  
	WHERE  ( "CADENA_MORA"."BASE" = :ls_base ) AND  
			 ( "CADENA_MORA"."SERIE" = :ls_serie ) AND  
			 ( "CADENA_MORA"."NUMERO" = :ll_numero )   
	USING		sqlca;
	if isnull(ls_sector_val) or ls_sector_val='' then
		messagebox("Advertencia","Debe Ingresar Sector")
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		if ls_tipo_tras='I' then
		 	tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector_destino')
		else
			tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector_origen')
		end if
	elseif isnull(ls_sepultura_val) or ls_sepultura_val='' then
		messagebox("Advertencia","Debe Ingresar Sepultura")
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		if ls_tipo_tras='I' then
		 	tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura_destino')
		else
			tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura_origen')
		end if		 
	elseif isnull(ll_cod_parque_val) or ll_cod_parque_val=0 then
		messagebox("Advertencia","Debe Ingresar Parque")
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
			 
	elseif ll_tot_pago_ori < 0 then
		messagebox("Advertencia","Recuerde Valor a Cancelar NO puede ser Negativo")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_1')
	elseif ll_tot_pago_des < 0 then
		messagebox("Advertencia","Recuerde Valor a Cancelar NO puede ser Negativo")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_d1')
	elseif ll_sw_pago_1=0 and (isnull(ls_pago_otro_1) or ls_pago_otro_1='' ) and ldb_monto_otro_1 >= 0 and (isnull(ls_pago_otro_d1) or ls_pago_otro_d1='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_1')
	elseif ll_sw_pago_1=0 and (isnull(ldb_monto_otro_1) or ldb_monto_otro_1=0 ) and not isnull(ls_pago_otro_1) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_1')
	elseif ll_sw_pago_1=0 and isnull(ls_pago_otro_d1) and  ldb_monto_otro_d1<> 0  then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_d1')
	elseif ll_sw_pago_1=0 and isnull(ldb_monto_otro_d1) and not isnull(ls_pago_otro_d1) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_d1')
		
	elseif ll_sw_dscto_1=0 and (isnull(ls_valdscto_otro_1) or ls_valdscto_otro_1='' ) and ldb_dscto_otro_1 <> 0 and (isnull(ls_valdscto_otro_d1) or ls_valdscto_otro_d1='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_1')
	elseif ll_sw_dscto_1=0 and (isnull(ldb_dscto_otro_1) or ldb_dscto_otro_1=0 ) and not isnull(ls_valdscto_otro_1) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_1')
	elseif ll_sw_dscto_1=0 and isnull(ls_valdscto_otro_d1)  and ldb_dscto_otro_d1<>0 then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_d1')
	elseif ll_sw_dscto_1=0 and (isnull(ldb_dscto_otro_d1) or ldb_dscto_otro_d1=0) and not isnull(ls_valdscto_otro_d1) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_d1')
		
	elseif ll_sw_pago_2=0 and (isnull(ls_pago_otro_2) or ls_pago_otro_2='' ) and ldb_monto_otro_2 >= 0 and (isnull(ls_pago_otro_d2) or ls_pago_otro_d2='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_2')
	elseif ll_sw_pago_2=0 and (isnull(ldb_monto_otro_2) or ldb_monto_otro_2=0 ) and not isnull(ls_pago_otro_2) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_2')
	elseif ll_sw_pago_2=0 and isnull(ls_pago_otro_d2) and ldb_monto_otro_d2 <> 0 then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_d2')
	elseif ll_sw_pago_2=0 and (isnull(ldb_monto_otro_d2) or ldb_monto_otro_d2=0) and not isnull(ls_pago_otro_d2) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_d2')
	elseif ll_sw_dscto_2=0 and (isnull(ls_valdscto_otro_2) or ls_valdscto_otro_2='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_2')
	elseif ll_sw_dscto_2=0 and (isnull(ldb_dscto_otro_2) or ldb_dscto_otro_2=0 ) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_2')
	elseif ll_sw_dscto_2=0 and isnull(ls_valdscto_otro_d2) and ldb_dscto_otro_d2 <> 0 then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_d2')
	elseif ll_sw_dscto_2=0 and (isnull(ldb_dscto_otro_d2) or ldb_dscto_otro_d2=0) and not isnull(ls_valdscto_otro_d2) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_d2')
		
	elseif ll_sw_pago_3=0 and (isnull(ls_pago_otro_3) or ls_pago_otro_3='' ) and ldb_monto_otro_3 >= 0 and (isnull(ls_pago_otro_d3) or ls_pago_otro_d3='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_3')
	elseif ll_sw_pago_3=0 and (isnull(ldb_monto_otro_3) or ldb_monto_otro_3=0 ) and not isnull(ls_pago_otro_3) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_3')
	elseif ll_sw_pago_3=0 and isnull(ls_pago_otro_d3) and  ldb_monto_otro_d3 <> 0 then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_d3')
	elseif ll_sw_pago_3=0 and (isnull(ldb_monto_otro_d3) or ldb_monto_otro_d3=0) and not isnull(ls_pago_otro_d3) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_d3')
		
	elseif ll_sw_dscto_3=0 and (isnull(ls_valdscto_otro_3) or ls_valdscto_otro_3='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_3')
	elseif ll_sw_dscto_3=0 and (isnull(ldb_dscto_otro_3) or ldb_dscto_otro_3=0 ) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_3')
	elseif ll_sw_dscto_3=0 and isnull(ls_valdscto_otro_d3) and  ldb_dscto_otro_d3<>0 then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_d3')
	elseif ll_sw_dscto_3=0 and (isnull(ldb_dscto_otro_d3) or ldb_dscto_otro_d3=0) and not isnull(ls_valdscto_otro_d3) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_d3')
		
	elseif ll_sw_pago_4=0 and (isnull(ls_pago_otro_4) or ls_pago_otro_4='' ) and ldb_monto_otro_4 >= 0 and (isnull(ls_pago_otro_d4) or ls_pago_otro_d4='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_4')
	elseif ll_sw_pago_4=0 and (isnull(ldb_monto_otro_4) or ldb_monto_otro_4=0 ) and not isnull(ls_pago_otro_4) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_4')
	elseif ll_sw_pago_4=0 and isnull(ls_pago_otro_d4) and ldb_monto_otro_d4<>0 then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_d4')
	elseif ll_sw_pago_4=0 and (isnull(ldb_monto_otro_d4) or ldb_monto_otro_d4=0) and not isnull(ls_pago_otro_d4) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_d4')
	elseif ll_sw_dscto_4=0 and (isnull(ls_valdscto_otro_4) or ls_valdscto_otro_4='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_4')
	elseif ll_sw_dscto_4=0 and (isnull(ldb_dscto_otro_4) or ldb_dscto_otro_4=0 ) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_4')
	elseif ll_sw_dscto_4=0 and isnull(ls_valdscto_otro_d4) and ldb_dscto_otro_d4<>0 then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_d4')
	elseif ll_sw_dscto_4=0 and (isnull(ldb_dscto_otro_d4) or ldb_dscto_otro_d4=0) and not isnull(ls_valdscto_otro_d4) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_d4')
		
	elseif ll_sw_pago_5=0 and (isnull(ls_pago_otro_5) or ls_pago_otro_5='' ) and ldb_monto_otro_5 >= 0 and (isnull(ls_pago_otro_d5) or ls_pago_otro_d5='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_5')
	elseif ll_sw_pago_5=0 and (isnull(ldb_monto_otro_5) or ldb_monto_otro_5=0 ) and not isnull(ls_pago_otro_5) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_5')
	elseif ll_sw_pago_5=0 and isnull(ls_pago_otro_d5) and ldb_monto_otro_d5<>0 then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_d5')
	elseif ll_sw_pago_5=0 and (isnull(ldb_monto_otro_d5) or ldb_monto_otro_d5=0) and not isnull(ls_pago_otro_d5) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_d5')
	elseif ll_sw_dscto_5=0 and (isnull(ls_valdscto_otro_5) or ls_valdscto_otro_5='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_5')
	elseif ll_sw_dscto_5=0 and (isnull(ldb_dscto_otro_5) or ldb_dscto_otro_5=0 ) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_5')
	elseif ll_sw_dscto_5=0 and isnull(ls_valdscto_otro_d5) and ldb_dscto_otro_d5<>0 then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_d5')
	elseif ll_sw_dscto_5=0 and (isnull(ldb_dscto_otro_d5) or ldb_dscto_otro_d5=0) and not isnull(ls_valdscto_otro_d5) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_d5')
		
	elseif ll_sw_pago_6=0 and (isnull(ls_pago_otro_6) or ls_pago_otro_6='' ) and ldb_monto_otro_6 >= 0 and (isnull(ls_pago_otro_d6) or ls_pago_otro_d6='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_6')
	elseif ll_sw_pago_6=0 and (isnull(ldb_monto_otro_6) or ldb_monto_otro_6=0 ) and not isnull(ls_pago_otro_6) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_6')
	elseif ll_sw_pago_6=0 and isnull(ls_pago_otro_d6) and ldb_monto_otro_d6<>0 then
		messagebox("Advertencia","Debe Ingresar Tipo de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_d6')
	elseif ll_sw_pago_6=0 and (isnull(ldb_monto_otro_d6) or ldb_monto_otro_d6=0) and not isnull(ls_pago_otro_d6) then
		messagebox("Advertencia","Debe Ingresar Monto de Pago Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_otro_d6')
	elseif ll_sw_dscto_6=0 and (isnull(ls_valdscto_otro_6) or ls_valdscto_otro_6='' ) then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_6')
	elseif ll_sw_dscto_6=0 and (isnull(ldb_dscto_otro_6) or ldb_dscto_otro_6=0 ) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Origen")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_6')
	elseif ll_sw_dscto_6=0 and isnull(ls_valdscto_otro_d6) and ldb_dscto_otro_d6<>0 then
		messagebox("Advertencia","Debe Ingresar Tipo Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_d6')
	elseif ll_sw_dscto_6=0 and (isnull(ldb_dscto_otro_d6) or ldb_dscto_otro_d6=0) and not isnull(ls_valdscto_otro_d6) then
		messagebox("Advertencia","Debe Ingresar Monto Descuento Destino")
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_d66')
	elseif ll_mora_cred>0 and ll_mora_mant>0 then
		ll_res									= messagebox("Advertencia","No es posible Crear Ficha de Traslado por Tener MORA CREDITO y MORA MANTENCION, desea Ingresar",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ls_pasa_mora					= 'S'
		end if
	elseif ll_mora_cred>0 and ll_mora_mant=0 then
		ll_res									= messagebox("Advertencia","No es posible Crear Ficha de Traslado por Tener "+string(ll_mora_cred,'###,###,###,##0')+" cuota(s) MORA CREDITO, desea Ingresar",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ls_pasa_mora					= 'S'
		end if
	elseif ll_mora_cred=0 and ll_mora_mant>0 then
		ll_res									= messagebox("Advertencia","No es posible Crear Ficha de Traslado por Tener "+string(ll_mora_mant,'###,###,###,##0')+" cuota(s) MORA MANTENCION, desea Ingresar",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ls_pasa_mora					= 'S'
		end if
	else
		ls_pasa_mora						= 'S'
	end if	
else
	ls_pasa_mora							= 'S'
end if
if ls_pasa_mora='S' then
	ll_sw_derecho							= tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_pago_liberado')
	if ll_sw_derecho = 0 then
		ll_sw_dscto_1						= tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'sw_dscto_1')
		ls_dscto_1							= tab_1.tabpage_4.dw_aranceles.getitemstring(1,'dscto_otro_1')
		ldb_dscto_1							= tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'monto_dscto_1')
		
		ls_dscto_d1							= tab_1.tabpage_4.dw_aranceles.getitemstring(1,'dscto_otro_d1')
		ldb_dscto_d1						= tab_1.tabpage_4.dw_aranceles.getitemnumber(1,'monto_dscto_d1')
		
		if (ll_sw_dscto_1 = 1 and ldb_dscto_1=0 and ldb_dscto_d1=0) or (ll_sw_dscto_1 = 1 and isnull(ldb_dscto_1) and isnull(ldb_dscto_d1))  then
			messagebox("Advertencia","Debe Seleccionar Descuento")
			tab_1.tabpage_4.dw_aranceles.setfocus()
			tab_1.tabpage_4.dw_aranceles.setcolumn('sw_dscto_1')
		elseif (isnull(ls_dscto_1) or ls_dscto_1='') and (isnull(ls_dscto_d1) or ls_dscto_d1='')  then
			messagebox("Advertencia","Debe Seleccionar Tipo Descuento")
			tab_1.tabpage_4.dw_aranceles.setfocus()
			tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_1')
		elseif (isnull(ldb_dscto_1) or ldb_dscto_1= 0) and (isnull(ldb_dscto_d1) or ldb_dscto_d1= 0) then
			messagebox("Advertencia","Debe Ingresar Valor UF Descuento")
			tab_1.tabpage_4.dw_aranceles.setfocus()
			tab_1.tabpage_4.dw_aranceles.setcolumn('monto_dscto_1')
			
		else
			ls_pasa_dscto			= 'S'
		end if
	else
		ls_pasa_dscto				= 'S'
	end if
	if ls_pasa_dscto = 'S' then
		SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
		ldt_fecha_hoy							= datetime(date(gdt_fec_sistema),time('00:00:00'))
		ll_hora_hoy								= long(string(gdt_fec_sistema,'hh'))
		ll_minutos_hoy							= long(string(gdt_fec_sistema,'mm'))
		if is_usuario_esta='S' then
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'fecha_recepcion',ldt_fecha_hoy)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'hora_recepcion',ll_hora_hoy)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'minuto_recepcion',ll_minutos_hoy)
		end if
		ll_parque1					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
		ls_sector1					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector_origen')
		ls_sepultura1				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sepultura_origen')
		ldt_fecha_sepult1			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(1,'fecha_traslado')
		ll_parque						= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'cod_parque')
		SELECT	"COD_PARQ"."NOMBRE"  
		INTO 		:ls_descrip_parque  
		FROM 	"COD_PARQ"  
		WHERE 	"COD_PARQ"."CODIGO" = :ll_parque
		USING	sqlca;
		
		ls_sector						= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(1,'sector_destino')
		ls_sepultura					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'sepultura_destino')
		ldt_fech_sepult   			= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(1,'fecha_traslado')
		tab_1.tabpage_1.dw_ant_fall.accepttext()
		tab_1.tabpage_3.dw_ficha_sepult.accepttext()
		tab_1.tabpage_4.dw_aranceles.accepttext()
		ll_tot_reg					= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
		ls_sw	= wf_validar()
		if ls_sw='S' then
			ret 						= MessageBox('Actualizar', "Desea Grabar Ficha Traslado", Question!, YesNo!, 2)
			IF ret = 1 THEN
				wf_setear_datos()
				if tab_1.tabpage_3.dw_ficha_sepult.update()=1 then
					commit;
					ls_tipo_traslado			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'tipo_traslado')
					ls_destino					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'destino_parque')
					if ls_tipo_traslado='E' then
						if ls_destino='E' then // nuestros parque
							ls_base				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'base_destino')
							ls_serie				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'serie_destino')
							ll_numero			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'numero_destino')
						elseif ls_destino='S' then // otros parque
							ls_base				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'base_origen')
							ls_serie				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'serie_origen')
							ll_numero			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'numero_origen')
						end if
					elseif ls_tipo_traslado='I' then
						ls_base					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'base_destino')
						ls_serie					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'serie_destino')
						ll_numero				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'numero_destino')
					end if
					ls_base_des					= ls_base
					ls_serie_des					= ls_serie
					ll_numero_des				= ll_numero
					
					SELECT	Count("FALLECIDOS"."LLAVE")  
					INTO 		:ll_count_fall  
					FROM 		"FALLECIDOS"  
					WHERE  ( "FALLECIDOS"."BASE" = :ls_base_des ) AND  
							 ( "FALLECIDOS"."SS" = :ls_serie_des ) AND  
							 ( "FALLECIDOS"."CONTRATO" = :ll_numero_des )  AND
							 ( "FALLECIDOS"."EST" = 'CC' )  AND
							( "FALLECIDOS"."ESTADO_REG" = 'A' )
					USING		sqlca;
					if ll_count_fall>0 then
						ls_primera_sepultura	= 'N'
					else
						ls_primera_sepultura	= 'S'
					end if			
					SELECT 	"FICHA_GRABACION_LAPIDA"."CODIGO_IMAGEN"
					INTO 		:ll_cod_imagen  
					FROM 		"FICHA_GRABACION_LAPIDA"  
					WHERE	 ( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
							 ( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
							 ( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque ) AND  
							 ( "FICHA_GRABACION_LAPIDA"."FOLIO" = 1 ) AND  
							 ( "FICHA_GRABACION_LAPIDA"."FECHA" = :ldt_fech_sepult )   
					USING		sqlca;
					if isnull(ll_cod_imagen) or ll_cod_imagen=0 then ll_cod_imagen=0
					if ll_cod_imagen=0 then
						SELECT	COUNT("FALLECIDOS"."LLAVE")  
						INTO 		:ll_count_reg  
						FROM 		"FALLECIDOS"  
						WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND  
								 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
								 ( "FALLECIDOS"."COD_PARQUE" = :ll_parque )    AND
								( "FALLECIDOS"."ESTADO_REG" = 'A' )
						USING		sqlca;
						if ll_count_reg>0 then
							ll_cod_imagen		= 99
						else
							SELECT	"INVENTARIO_PLANI"."NUMERO"  
							INTO 		:ll_num_inven  
							FROM 		"INVENTARIO_PLANI"  
							WHERE  ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
									 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) AND  
									 ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_parque )   
							USING		sqlca;
							if ll_num_inven=10000000 then
								ll_cod_imagen	= 99
							else
								ll_cod_imagen	= 0
							end if
						end if
					end if
				
					ll_tot_reg					= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					for ll_indi=1 to ll_tot_reg
						ls_tipo_traslado		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'tipo_traslado')
						ls_destino				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'destino_parque')
						ll_corr_interno			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'folio')
						ls_ejecutivo        		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'codigo_ejecutivo')
						ldt_fech_sepult   		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_traslado')
						ll_hora_sepult    		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'hora_fijada')
						ll_minuto_sepult		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'minuto_fijada')
						if ls_tipo_traslado='E' then
							if ls_destino='E' then // nuestros parque
								ls_numero_tecni		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'numero_tecnico_destino')
								ll_capacidad			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad_destino')
								ll_rut_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'rut_titular_destino')
								ls_dv_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'dv_titular_destino')
								ls_tipo_via_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'tipo_via_destino_titular')
								ls_dir_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'direccion_titular_destino')
								ls_nro_dir_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nro_direc_titular_destino')
								ls_dep_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'depto_direc_titular_destino')
								ls_block_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'block_direc_titular_destino')
								ls_ciudad_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_ciudad_titular_destino')
								ls_comuna_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_comuna_titular_destino')
								ls_nombre_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nombre_titular_destino')
								ls_ap_pat_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'apellido_pat_titular_destino')
								ls_ap_mat_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'apellido_mat_titular_destino')
								ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'sector_destino')
								ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'sepultura_destino')
								ll_parque				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque_destino')
								ls_nivel				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nivel_sepultura_destino')
							elseif ls_destino='S' then // otros parque
								ls_numero_tecni	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'numero_tecnico_origen')
								ll_capacidad			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad_origen')
								ll_rut_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'rut_titular_origen')
								ls_dv_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'dv_titular_origen')
								ls_tipo_via_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'tipo_via_origen_titular')
								ls_dir_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'direccion_titular_origen')
								ls_nro_dir_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nro_direc_titular_origen')
								ls_dep_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'dpto_direc_titular_origen')
								ls_block_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'block_direc_titular_origen')
								ls_ciudad_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_ciudad_titular_origen')
								ls_comuna_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_comuna_titular_origen')
								ls_nombre_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nombre_titular_origen')
								ls_ap_pat_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'apellido_pat_titular_origen')
								ls_ap_mat_tit_ori	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'apellido_mat_titular_origen')
								ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'sector_origen')
								ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'sepultura_origen')
								ll_parque				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque_origen')
								ls_nivel				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nivel_sepultura_origen')
							end if
						elseif ls_tipo_traslado='I' then
							ls_numero_tecni		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'numero_tecnico_destino')
							ll_capacidad				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad_destino')
							ll_rut_tit_ori				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'rut_titular_destino')
							ls_dv_tit_ori				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'dv_titular_destino')
							ls_tipo_via_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'tipo_via_destino_titular')
							ls_dir_tit_ori				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'direccion_titular_destino')
							ls_nro_dir_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nro_direc_titular_destino')
							ls_dep_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'depto_direc_titular_destino')
							ls_block_tit_ori			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'block_direc_titular_destino')
							ls_ciudad_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_ciudad_titular_destino')
							ls_comuna_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_comuna_titular_destino')
							ls_nombre_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nombre_titular_destino')
							ls_ap_pat_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'apellido_pat_titular_destino')
							ls_ap_mat_tit_ori		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'apellido_mat_titular_destino')
							ls_sector					= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'sector_destino')
							ls_sepultura				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'sepultura_destino')
							ll_parque					= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque_destino')
							ls_nivel					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nivel_sepultura_destino')
						end if
						
						SELECT	"CLIENTE"."SECTOR",	"CLIENTE"."POBLACION"  
						INTO		:ls_villa_tit_ori,	:ls_sector_tit_ori  
						FROM 		"CLIENTE"  
						WHERE		"CLIENTE"."RUT" = :ll_rut_tit_ori   ;
						if isnull(ls_villa_tit_ori) then ls_villa_tit_ori='-'
						if isnull(ls_sector_tit_ori) then ls_sector_tit_ori='-'
						ll_rut_fall					= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'rut_fallecido')
						ls_dv_fall					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'dv_fallecido')
						ls_nombre_fall		 	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nombre_fallecido')
						ls_ap_pat_fall		 	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'apellido_paterno_fall')
						ls_ap_mat_fall		 	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'apellido_materno_fall')
						ls_cod_est_fall   		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_estado_fallecido')
						ll_funeraria				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'codigo_funeraria')
						ls_fono_funera			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'fono_funeraria')
						ls_reg_civil_pase   	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_registro_pase')
						ls_nro_inscrip_pase  	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'inscripcion_pase')
						ls_nro_registro_pase	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'registro_pase')
						ldt_fec_pase	   		= tab_1.tabpage_3.dw_ficha_sepult.GetItemdatetime(ll_indi,'fecha_pase')
						ll_anno_pase			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'anno_paso')
						ls_obs_pase				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'pase_sepultacion')
						ldt_fecha_defuncion	= tab_1.tabpage_3.dw_ficha_sepult.GetItemdatetime(ll_indi,'fecha_defuncion')
						ldt_fecha_nac_fall		= tab_1.tabpage_3.dw_ficha_sepult.GetItemdatetime(ll_indi,'fecha_nacimiento_fallecido')
						ll_llave_fallecido		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'llave_fallecido')
						
						if isnull(ls_numero_tecni) then ls_numero_tecni='-'
						if isnull(ll_hora_sepult) then ll_hora_sepult=0
						if isnull(ll_minuto_sepult) then ll_minuto_sepult=0
						if isnull(ls_nombre_fall) then ls_nombre_fall='-'
						if isnull(ls_ap_pat_fall) then ls_ap_pat_fall='-'
						if isnull(ls_ap_mat_fall) then ls_ap_mat_fall='-'
						
						SELECT	"CLIENTE"."FONO_P",	"CLIENTE"."FONO_C"  
						INTO 		:ls_fono_titular,		:ls_fono_com_tit  
						FROM 		"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut_tit_ori   
						USING		sqlca;
						
	//					SELECT 	COUNT("FICHA_CARTA_SEPULTACION"."SECTOR")  
	//					INTO 		:ll_count  
	//					FROM 		"FICHA_CARTA_SEPULTACION"  
	//					WHERE  ( "FICHA_CARTA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
	//							 ( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
	//							 ( "FICHA_CARTA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fech_sepult ) AND  
	//							 ( "FICHA_CARTA_SEPULTACION"."CORRELATIVO" = :ll_indi ) AND  
	//							 ( "FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :ll_parque )   
	//					USING		sqlca;
						if tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_ficha') > 0 then
		//					if ll_count>0 then
	//									"NOMBRE_TITULAR"=:ls_nombre_tit_ori,	
	//									"APELLIDO_PATERNO_TITULAR"=:ls_ap_pat_tit_ori,
	//									"APELLIDO_MATERNO_TITULAR"=:ls_ap_mat_tit_ori,
	//									"RUT_TITULAR"=:ll_rut_tit_ori,
	//									"DV_TITULAR"=:ls_dv_tit_ori,
	//									"TIPO_VIA_TITULAR"=:ls_tipo_via_tit_ori,
	//									"DIRECCION_TITULAR"=:ls_dir_tit_ori,
	//									"NUMERO_DIRECCION_TITULAR"=:ls_nro_dir_tit_ori,
	//									"DEPTO_DIRECCION_TITULAR"=:ls_dep_tit_ori,
	//									"BLOCK_DIRECCION_TITULAR"=:ls_block_tit_ori,
	//									"POBLACION_VILLA_TITULAR"=:ls_villa_tit_ori,
	//									"SECTOR_TITULAR"=:ls_sector_tit_ori,
							UPDATE 	"FICHA_CARTA_SEPULTACION"  
							SET	   	"FECHA_CARTA"=:ldt_fecha_hoy,			
										"SECTOR"=:ls_sector,
										"SEPULTURA"=:ls_sepultura,
										"NUMERO_TECNICO"=:ls_numero_tecni,
										"CAPACIDAD"=:ll_capacidad,
										"NOMBRE_FALLECIDO"=:ls_nombre_fall,
										"APELLIDO_PATERNO_FALL"=:ls_ap_pat_fall,
										"APELLIDO_MATERNO_FALL"=:ls_ap_mat_fall,
										"FECHA_SEPULTACION"=:ldt_fech_sepult,
										"HORA_SEPULTACION"=:ll_hora_sepult,
										"MINUTO_SEPULTACION"=:ll_minuto_sepult,
										"CODIGO_FUNERARIA"=:ll_funeraria,
										"BASE"=:ls_base,
										"SERIE"=:ls_serie,
										"NUMERO"=:ll_numero,
										"RUT_FALLECIDO"=:ll_rut_fall,
										"DV_FALLECIDO"=:ls_dv_fall,
										"CORRELATIVO"=:ll_corr_interno,
										"COD_PARQUE"=:ll_parque,
										"FONO_PARTICULAR_TITULAR"=:ls_fono_titular,
										"FONO_COMERCIAL_TITULAR"=:ls_fono_com_tit
							WHERE	 ( "FICHA_CARTA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
									 ( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
									 ( "FICHA_CARTA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fech_sepult ) AND  
									 ( "FICHA_CARTA_SEPULTACION"."CORRELATIVO" = :ll_indi ) AND  
									 ( "FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :ll_parque )  
							USING		sqlca;   
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error al Actualizar CARTA SEPULTACION SQL: "+sqlca.sqlerrtext)
							end if
							UPDATE	"FICHA_GRABACION_LAPIDA"  
							SET 		"BASE" = :ls_base,   
										"SERIE" = :ls_serie,   
										"NUMERO" = :ll_numero,   
										"FECHA" = :ldt_fecha_hoy,   
										"NOMBRE_TITULAR" = :ls_nombre_tit_ori,   
										"APELLIDO_PATERNO_TITULAR" = :ls_ap_pat_tit_ori,   
										"APELLIDO_MATERNO_TITULAR" = :ls_ap_mat_tit_ori,   
										"RUT_TITULAR" = :ll_rut_tit_ori,   
										"DV_TITULAR" = :ls_dv_tit_ori,   
										"SECTOR" = :ls_sector,   
										"SEPULTURA" = :ls_sepultura,   
										"NUMERO_TECNICO" = :ls_numero_tecni,   
										"CAPACIDAD" = :ll_capacidad,   
										"NOMBRE_FALLECIDO" = :ls_nombre_fall,   
										"APELLIDO_PATERNO_FALL" = :ls_ap_pat_fall,   
										"APELLIDO_MATERNO_FALL" = :ls_ap_mat_fall,   
										"FECHA_NACIMIENTO_FALL" = :ldt_fecha_nac_fall,   
										"FECHA_NACIMIENTO_LAPIDA" = :ldt_fecha_nac_fall,   
										"FECHA_FALLECIMIENTO" = :ldt_fecha_defuncion,   
										"FECHA_DEFUNCION_LAPIDA" = :ldt_fecha_defuncion,   
										"RUT_FALLECIDO" = :ll_rut_fall,   
										"DV_FALLECIDO" = :ls_dv_fall,   
										"CODIGO_IMAGEN" = :ll_cod_imagen,
										"PRIMERA_SEPULTURA" = :ls_primera_sepultura,
										"COD_PARQUE" = :ll_parque
							WHERE	 ( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."FOLIO" = :ll_indi ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."FECHA_SEPULTACION" = :ldt_fech_sepult )  
							USING		sqlca;   
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error al Actualizar GRABACION LAPIDA SQL: "+sqlca.sqlerrtext)
							end if
						else
							SELECT	MAX("FICHA_TRASLADO"."CORRELATIVO_FICHA")  
							INTO 		:ll_max_ficha 
							FROM 	"FICHA_TRASLADO"  
							WHERE	"FICHA_TRASLADO"."COD_PARQUE" = :ll_parque
							USING	sqlca;
							if ll_max_ficha > 0 then
								ll_max_ficha ++
							else
								ll_max_ficha	= 1
							end if
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'correlativo_ficha',ll_max_ficha)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							if tab_1.tabpage_3.dw_ficha_sepult.update()=1 then
								commit;
							else
								rollback;
							end if
							
							SELECT 	MAX("FICHA_CARTA_SEPULTACION"."FOLIO")  
							INTO 		:ll_count  
							FROM 		"FICHA_CARTA_SEPULTACION"  
							WHERE		"FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :ll_parque
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							
							INSERT INTO "FICHA_CARTA_SEPULTACION"  
										 ( "FECHA_CARTA",		"NOMBRE_TITULAR",		"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",		"DV_TITULAR",		"DIRECCION_TITULAR",	"NUMERO_DIRECCION_TITULAR",	"DEPTO_DIRECCION_TITULAR",	"BLOCK_DIRECCION_TITULAR",	"POBLACION_VILLA_TITULAR",	"SECTOR_TITULAR",		"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION",	"CODIGO_FUNERARIA",	"FOLIO",		"BASE",	  	"SERIE",		"NUMERO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"CORRELATIVO",	"COD_PARQUE",	"TIPO_FICHA",	"COD_PARENTESCO_AUTORIZA",	"FONO_PARTICULAR_TITULAR",	"FONO_COMERCIAL_TITULAR",	"TIPO_VIA_TITULAR" )  
							VALUES 	 ( :ldt_fecha_hoy,			:ls_nombre_tit_ori,		:ls_ap_pat_tit_ori,						:ls_ap_mat_tit_ori,					:ll_rut_tit_ori,			:ls_dv_tit_ori,		:ls_dir_tit_ori,				:ls_nro_dir_tit_ori, 					:ls_dep_tit_ori,							:ls_block_tit_ori,					:ls_villa_tit_ori,						:ls_sector_tit_ori,			:ls_sector,	:ls_sepultura,	:ls_numero_tecni,		:ll_capacidad,	:ls_nombre_fall,			:ls_ap_pat_fall,						:ls_ap_mat_fall,					:ldt_fech_sepult,			:ll_hora_sepult,				:ll_minuto_sepult,				:ll_funeraria,				:ll_count,		:ls_base,		:ls_serie,  	:ll_numero, 		:ll_rut_fall,  				:ls_dv_fall,     		:ll_indi,				:ll_parque,			'FT',				'19',										:ls_fono_titular,						:ls_fono_com_tit,					:ls_tipo_via_tit_ori )
							USING		sqlca;   
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar CARTA SEPULTACION SQL: "+sqlca.sqlerrtext)
							end if
							
							SELECT 	MAX("FICHA_GRABACION_LAPIDA"."CORRELATIVO")  
							INTO 		:ll_count  
							FROM 		"FICHA_GRABACION_LAPIDA"  
							WHERE		"FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							
							INSERT INTO "FICHA_GRABACION_LAPIDA"  
										( "BASE",		"SERIE",		"NUMERO",	"FECHA",				"FECHA_RECEPCION",	"NOMBRE_TITULAR",		"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",		"DV_TITULAR",		"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_NACIMIENTO_FALL",	"FECHA_FALLECIMIENTO",	"CODIGO_RELIGION",	"CODIGO_IMAGEN",	"NOMBRE_FALLECIDO_LAPIDA",	"FECHA_DEFUNCION_LAPIDA",	"FECHA_NACIMIENTO_LAPIDA",	"FOLIO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"COD_PARQUE",	"PRIMERA_SEPULTURA",		"TIPO_FICHA",	"CORRELATIVO",	"FECHA_SEPULTACION",	"TIPO_CONSTRUCCION" )  
							VALUES 	( :ls_base,	:ls_serie,		:ll_numero,	:ldt_fecha_hoy,		:ldt_fecha_hoy,			:ls_nombre_tit_ori,  		:ls_ap_pat_tit_ori,						:ls_ap_mat_tit_ori,					:ll_rut_tit_ori,  			:ls_dv_tit_ori,		:ls_sector,	:ls_sepultura,	:ls_numero_tecni,		:ll_capacidad,	:ls_nombre_fall,			:ls_ap_pat_fall,						:ls_ap_mat_fall,					:ldt_fecha_nac_fall,				:ldt_fecha_defuncion,  		null,						:ll_cod_imagen,		null,										:ldt_fecha_defuncion,				:ldt_fecha_nac_fall,					:ll_indi,		:ll_rut_fall,				:ls_dv_fall,			:ll_parque,			:ls_primera_sepultura,		'FT',				:ll_count,				:ldt_fech_sepult,			'G' )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar GRABACION LAPIDA SQL: "+sqlca.sqlerrtext)
							end if
						end if
						// Insertar Fallecido - Mirko 12/06/2022
						ll_nm					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_mensual')
						ll_nl					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_anual')
						ls_cod_reg_pase	= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_indi,'cod_registro_pase')
						ls_estado_ctto		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'estado_contrato_destino')
						ls_inscripcion_pase= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_indi,'registro_pase')
						ls_pase_sepult		= ''	//tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'inscripcion_pase')
						ls_sexo_fall			= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_indi,'sexo_fallecido')
						ll_rut_tit_des		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'rut_titular_destino')
						ls_causa_fall		= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_indi,'observacion_fallecido')
						ldt_fec_nac			= ldt_fecha_nac_fall
						ldt_fec_defun		= ldt_fecha_defuncion
						ll_corr_ficha			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_ficha')	
						
						SELECT	"FUNERARIA"."NOMBRE"  
						INTO 		:ls_funeraria  
						FROM 	"FUNERARIA"  
						WHERE 	"FUNERARIA"."RUT" = :ll_funeraria   ;
						if isnull(ls_funeraria) or ls_funeraria='' then ls_funeraria='-'
//						if ls_tipo_ficha='FS' then
//							SELECT	"COMUNA"."COMUNA"  
//							INTO 		:ls_otorgado_por  
//							FROM 	"COMUNA"  
//							WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_cod_regis   
//							USING	sqlca;
//						elseif ls_tipo_ficha='FT' then
							SELECT	"FICHA_OTORGADO_POR"."DESCRIPCION"  
							INTO 		:ls_otorgado_por  
							FROM 	"FICHA_OTORGADO_POR"  
							WHERE 	"FICHA_OTORGADO_POR"."CODIGO" = :ls_cod_reg_pase   
							USING	sqlca;
//						end if
//						
						if ls_tipo_traslado='E' and ls_destino='E' then
							ls_op				= 'IN'
						elseif ls_tipo_traslado='I' then
							ls_op				= 'TI'
						elseif ls_tipo_traslado='E' and ls_destino='S' then
							ls_op				= 'EX'
						end if

						if not isnull(ll_llave_fallecido) then
							SELECT   	 "LLAVE",		"FOLIO",					"N_L",		"N_M",		"BASE",		"SS",			"CONTRATO",		"SECTOR",	"N_SEP",				"NOMBRES",		"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",			"EST",		"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",			"PASE",		"REG_CIVIL",			"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",		"BOLETA",		"CARTA_AUT",		"RG_EST",				"N_TEC",		"NIVEL",			"VTA",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_REG",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",		"RESOLUCION_TRASLADO_NRO"
							INTO 			:ll_llave_s,	:ll_count_parque_s,	:ll_n_l_s,	:ll_n_m_s,	:base_s,		:serie_s,		:numero_s,		:ls_sector_s,	:ls_sepultura_s,	:ls_nombre_s,	:ls_ap_pat_s,		:ls_ap_mat_s,		:ldt_fec_sepult_s,	:ls_est_s,	:ls_op_s,	:ll_rut_s,	:ls_dv_s,	:ls_sexo_s,	:ll_edad_s,	:ls_periodo_s,	:ldt_fec_nac_s,	:ldt_fec_fall_s,		:ls_pase_s,	:ls_otorgado_por_s,	:ls_causa_fall_s,	:ls_enf_obl_s,	:ls_funeraria_s,	:ls_boleta_s,	:ls_carta_aut_s,	:ll_corr_hist_reg_s,	:ls_n_tec_s,	:ls_nivel_s,		:ls_vta_s,	:ls_observaciones_s,   	:ls_estado_contrato_s,	:ls_registro_pase_s,					:ls_otorgado_por_s,	:ls_cementerio_origen_s,	:ll_cod_parque_s,		:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_reg_s,	:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ls_usuario_crea_s,	:ldt_fecha_crea_s,		:ls_tipo_ficha_s,	:ls_resol_traslado_nro_s
							FROM		  	"FALLECIDOS"
							WHERE		"FALLECIDOS"."LLAVE" = :ll_llave_fallecido AND
											"FALLECIDOS"."ESTADO_REG" = 'A'
							USING		Trans_1;
						else
							SELECT   	 "LLAVE",		"FOLIO",					"N_L",		"N_M",		"BASE",		"SS",			"CONTRATO",		"SECTOR",	"N_SEP",				"NOMBRES",		"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",			"EST",		"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",			"PASE",		"REG_CIVIL",			"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",		"BOLETA",		"CARTA_AUT",		"RG_EST",				"N_TEC",		"NIVEL",			"VTA",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_REG",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",		"RESOLUCION_TRASLADO_NRO"
							INTO 			:ll_llave_s,	:ll_count_parque_s,	:ll_n_l_s,	:ll_n_m_s,	:base_s,		:serie_s,		:numero_s,		:ls_sector_s,	:ls_sepultura_s,	:ls_nombre_s,	:ls_ap_pat_s,		:ls_ap_mat_s,		:ldt_fec_sepult_s,	:ls_est_s,	:ls_op_s,	:ll_rut_s,	:ls_dv_s,	:ls_sexo_s,	:ll_edad_s,	:ls_periodo_s,	:ldt_fec_nac_s,	:ldt_fec_fall_s,		:ls_pase_s,	:ls_otorgado_por_s,	:ls_causa_fall_s,	:ls_enf_obl_s,	:ls_funeraria_s,	:ls_boleta_s,	:ls_carta_aut_s,	:ll_corr_hist_reg_s,	:ls_n_tec_s,	:ls_nivel_s,		:ls_vta_s,	:ls_observaciones_s,   	:ls_estado_contrato_s,	:ls_registro_pase_s,					:ls_otorgado_por_s,	:ls_cementerio_origen_s,	:ll_cod_parque_s,		:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_reg_s,	:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ls_usuario_crea_s,	:ldt_fecha_crea_s,		:ls_tipo_ficha_s,	:ls_resol_traslado_nro_s
							FROM		  	"FALLECIDOS"
							WHERE		TRIM("FALLECIDOS"."NOMBRES") = :ls_nombre_fall AND
											TRIM("FALLECIDOS"."AP_PATERNO") = :ls_ap_pat_fall AND
											TRIM("FALLECIDOS"."AP_MATERNO") = :ls_ap_mat_fall AND
											"FALLECIDOS"."RUT" = :ll_rut_fall AND
											"FALLECIDOS"."DV" = :ls_dv_fall AND
											"FALLECIDOS"."ESTADO_REG" = 'A'
							USING		Trans_1;
						end if
						if Trans_1.sqlcode=0 then
							if (ldt_fec_sepult_s = ldt_fech_sepult and ls_tipo_ficha_s = 'FT' and ls_op = ls_op_s ) or (ldt_fec_sepult_s = ldt_fech_sepult and isnull(ls_tipo_ficha_s) and ls_op = ls_op_s ) then
								ls_nuevo		= 'N'
							else
								ls_nuevo		= 'S'
							end if
						else
							if not isnull(ll_llave_fallecido) then
								SELECT   "LLAVE",		"FOLIO",					"N_L",		"N_M",		"BASE",		"SS",			"CONTRATO",		"SECTOR",	"N_SEP",				"NOMBRES",		"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",			"EST",		"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",			"PASE",		"REG_CIVIL",			"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",		"BOLETA",		"CARTA_AUT",		"RG_EST",				"N_TEC",		"NIVEL",			"VTA",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_REG",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",		"RESOLUCION_TRASLADO_NRO"
								INTO 		:ll_llave_s,	:ll_count_parque_s,	:ll_n_l_s,	:ll_n_m_s,	:base_s,		:serie_s,		:numero_s,		:ls_sector_s,	:ls_sepultura_s,	:ls_nombre_s,	:ls_ap_pat_s,		:ls_ap_mat_s,		:ldt_fec_sepult_s,	:ls_est_s,	:ls_op_s,	:ll_rut_s,	:ls_dv_s,	:ls_sexo_s,	:ll_edad_s,	:ls_periodo_s,	:ldt_fec_nac_s,	:ldt_fec_fall_s,		:ls_pase_s,	:ls_otorgado_por_s,	:ls_causa_fall_s,	:ls_enf_obl_s,	:ls_funeraria_s,	:ls_boleta_s,	:ls_carta_aut_s,	:ll_corr_hist_reg_s,	:ls_n_tec_s,	:ls_nivel_s,		:ls_vta_s,	:ls_observaciones_s,   	:ls_estado_contrato_s,	:ls_registro_pase_s,					:ls_otorgado_por_s,	:ls_cementerio_origen_s,	:ll_cod_parque_s,		:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_reg_s,	:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ls_usuario_crea_s,	:ldt_fecha_crea_s,		:ls_tipo_ficha_s,	:ls_resol_traslado_nro_s
								FROM 	"FALLECIDOS"  
								WHERE 	( "FALLECIDOS"."LLAVE" = :ll_llave_fallecido ) AND  
											( "FALLECIDOS"."ESTADO_REG" = 'A' )   ;
							else
								SELECT   "LLAVE",		"FOLIO",					"N_L",		"N_M",		"BASE",		"SS",			"CONTRATO",		"SECTOR",	"N_SEP",				"NOMBRES",		"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",			"EST",		"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",			"PASE",		"REG_CIVIL",			"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",		"BOLETA",		"CARTA_AUT",		"RG_EST",				"N_TEC",		"NIVEL",			"VTA",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_REG",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",		"RESOLUCION_TRASLADO_NRO"
								INTO 		:ll_llave_s,	:ll_count_parque_s,	:ll_n_l_s,	:ll_n_m_s,	:base_s,		:serie_s,		:numero_s,		:ls_sector_s,	:ls_sepultura_s,	:ls_nombre_s,	:ls_ap_pat_s,		:ls_ap_mat_s,		:ldt_fec_sepult_s,	:ls_est_s,	:ls_op_s,	:ll_rut_s,	:ls_dv_s,	:ls_sexo_s,	:ll_edad_s,	:ls_periodo_s,	:ldt_fec_nac_s,	:ldt_fec_fall_s,		:ls_pase_s,	:ls_otorgado_por_s,	:ls_causa_fall_s,	:ls_enf_obl_s,	:ls_funeraria_s,	:ls_boleta_s,	:ls_carta_aut_s,	:ll_corr_hist_reg_s,	:ls_n_tec_s,	:ls_nivel_s,		:ls_vta_s,	:ls_observaciones_s,   	:ls_estado_contrato_s,	:ls_registro_pase_s,					:ls_otorgado_por_s,	:ls_cementerio_origen_s,	:ll_cod_parque_s,		:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_reg_s,	:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ls_usuario_crea_s,	:ldt_fecha_crea_s,		:ls_tipo_ficha_s,	:ls_resol_traslado_nro_s
								FROM 	"FALLECIDOS"  
								WHERE 	( "FALLECIDOS"."BASE" = :ls_base ) AND  
											( "FALLECIDOS"."SS" = :ls_serie ) AND  
											( "FALLECIDOS"."CONTRATO" = :ll_numero ) AND  
	//										( "FALLECIDOS"."TIPO_FICHA" = 'FS' ) AND  
											( "FALLECIDOS"."FOLIO_FT" = :ll_corr_ficha ) AND  
											( "FALLECIDOS"."ESTADO_REG" = 'A' )   ;
							end if
							if ll_llave_s > 0 then
								ls_nuevo		= 'N'
							else
								ls_nuevo		= 'S'
							end if
						end if
						if isnull(ldt_fec_sepult_s) or date(ldt_fec_sepult_s) = date('01/01/1900') then setnull(ldt_fec_sepult_s)
						if isnull(ldt_fec_nac_s) or date(ldt_fec_nac_s) = date('01/01/1900') then setnull(ldt_fec_nac_s)
						if isnull(ldt_fec_fall_s) or date(ldt_fec_fall_s) = date('01/01/1900') then setnull(ldt_fec_fall_s)
						if isnull(ldt_fecha_ult_mod_s) or date(ldt_fecha_ult_mod_s) = date('01/01/1900') then setnull(ldt_fecha_ult_mod_s)
						if isnull(ldt_fecha_exhum_s) or date(ldt_fecha_exhum_s) = date('01/01/1900') then setnull(ldt_fecha_exhum_s)
						if isnull(ldt_fecha_inhuma_s) or date(ldt_fecha_inhuma_s) = date('01/01/1900') then setnull(ldt_fecha_inhuma_s)
						if isnull(ldt_fecha_ti_s) or date(ldt_fecha_ti_s) = date('01/01/1900') then setnull(ldt_fecha_ti_s)
						if isnull(ldt_fecha_te_s) or date(ldt_fecha_te_s) = date('01/01/1900') then setnull(ldt_fecha_te_s)
						if isnull(ldt_fecha_re_s) or date(ldt_fecha_re_s) = date('01/01/1900') then setnull(ldt_fecha_re_s)
						if isnull(ldt_fecha_tr_s) or date(ldt_fecha_tr_s) = date('01/01/1900') then setnull(ldt_fecha_tr_s)
						if isnull(ldt_fecha_crem_s) or date(ldt_fecha_crem_s) = date('01/01/1900') then setnull(ldt_fecha_crem_s)
						if isnull(ldt_fecha_crea_s) or date(ldt_fecha_crea_s) = date('01/01/1900') then setnull(ldt_fecha_crea_s)
						if isnull(ll_n_l_s) then ll_n_l_s=0
						if isnull(ll_n_m_s) then ll_n_m_s=0
						if isnull(base_s) then base_s=''
						if isnull(serie_s) then serie_s=''
						if isnull(numero_s) then numero_s=0
						if isnull(ls_sector_s) then ls_sector_s=''
						if isnull(ls_sepultura_s) then ls_sepultura_s=''
						if isnull(ls_nombre_s) then ls_nombre_s=''
						if isnull(ls_ap_pat_s) then ls_ap_pat_s=''
						if isnull(ls_ap_mat_s) then ls_ap_mat_s=''
						if isnull(ls_est_s) then ls_est_s=''
						if isnull(ls_op_s) then ls_op_s=''
						if isnull(ll_rut_s) then ll_rut_s=0
						if isnull(ls_dv_s) then ls_dv_s=''
						if isnull(ls_sexo_s) then ls_sexo_s=''
						if isnull(ll_edad_s) then ll_edad_s=0
						if isnull(ls_periodo_s) then ls_periodo_s=''
						if isnull(ls_pase_s) then ls_pase_s=''
						if isnull(ls_otorgado_por_s) then ls_otorgado_por_s=''
						if isnull(ls_causa_fall_s) then ls_causa_fall_s=''
						if isnull(ls_funeraria_s) then ls_funeraria_s=''
						if isnull(ls_n_tec_s) then ls_n_tec_s=''
						if isnull(ls_nivel_s) then ls_nivel_s=''
						if isnull(ls_observaciones_s) then ls_observaciones_s=''
						if isnull(ls_estado_contrato_s) then ls_estado_contrato_s=''
						if isnull(ls_resol_traslado_nro_s) then ls_resol_traslado_nro_s=''
						if isnull(ls_cementerio_origen_s) then ls_cementerio_origen_s=''
						if isnull(ll_cod_parque_s) then ll_cod_parque_s=0
						if ls_nuevo='S' then
							SELECT 	MAX("FALLECIDOS"."LLAVE")  
							INTO 		:ll_llave  
							FROM 	"FALLECIDOS"  ;
							if isnull(ll_llave) or ll_llave=0 then
								ll_llave					= 1
							else
								ll_llave ++
							end if
							
							SELECT	MAX("FALLECIDOS"."FOLIO")
							INTO 		:ll_folio
							FROM 	"FALLECIDOS"  
							WHERE 	"FALLECIDOS"."COD_PARQUE" = :ll_parque   ;
							if isnull(ll_folio) or ll_folio=0 then
								ll_folio					= 1
							else
								ll_folio ++
							end if
							
							if ll_llave_s > 0 then
								UPDATE 	"FALLECIDOS"  
								SET 		"ESTADO_REG" = 'I',   
											"USUARIO_ULT_MOD" = :gs_user,   
											"FECHA_ULT_MOD" = :gdt_fec_sistema  
								WHERE 	( "FALLECIDOS"."LLAVE" = :ll_llave_s ) AND  
											( "FALLECIDOS"."ESTADO_REG" = 'A' )  
								USING	Trans_1;
								if Trans_1.sqlcode=0 then
									commit using Trans_1;
								else
									rollback using Trans_1;
								end if
							end if
							
							if len(ls_funeraria) > 50 then ls_funeraria = mid(ls_funeraria,1,50)
							if len(ls_causa_fall) > 50 then ls_causa_fall = mid(ls_causa_fall,1,50)
							
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'llave_fallecido',ll_llave)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'llave_fallecido',ll_llave)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							tab_1.tabpage_1.dw_ant_fall.accepttext()
							if ls_tipo_tras='E' and ls_destino='S' then
								ls_estado_reg_ft	= 'I'
							else
								ls_estado_reg_ft	= 'A'
							end if
							INSERT INTO   "FALLECIDOS"  
											( "LLAVE",	"FOLIO",		"BASE",		"SS",			"CONTRATO",	"SECTOR",	"N_SEP",			"NOMBRES",			"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",				"EST",				"OP",		"RUT",		"DV",			"SEXO",			"EDAD",				"PERIODO",						"FEC_NAC",		"FEC_FALL",			"PASE",					"REG_CIVIL",		"CAUSA_FALL",		"FUNERARIA",	"N_TEC",				"NIVEL",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",	"FOLIO_FT",		"ESTADO_REG")
							VALUES 		( :ll_llave,	:ll_folio,		:ls_base,		:ls_serie,		:ll_numero,		:ls_sector,	:ls_sepultura,	:ls_nombre_fall,	:ls_ap_pat_fall,		:ls_ap_mat_fall,	:ldt_fech_sepult,		:ls_cod_est_fall,	:ls_op,	:ll_rut_fall,	:ls_dv_fall,	:ls_sexo_fall,	:ll_edad_fall,		:ls_periodo_nacimiento,		:ldt_fec_nac,	:ldt_fec_defun,		:ls_inscripcion_pase,	:ls_otorgado_por,	:ls_causa_fall,		:ls_funeraria,	:ls_numero_tecni,	:ls_nivel,		:ls_obs_sep_comp,   		:ls_estado_ctto,			:ls_pase_sepult,						:ls_otorgado_por,		:ls_descrip_parque,			:ll_parque,				:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:gs_user,				:gdt_fec_sistema,		'FT',				:ll_corr_ficha,	:ls_estado_reg_ft )  
							USING			sqlca;
							if sqlca.sqlcode=0 then
								commit;
								if ll_rut_fall = ll_rut_tit_des then
									SELECT	"CLIENTE"."ESTADO_TITULAR"  
									INTO 		:ls_estado_tit  
									FROM 	"CLIENTE"  
									WHERE 	"CLIENTE"."RUT" = :ll_rut_tit_des   
									USING	sqlca;
									if sqlca.sqlcode=0 then
										UPDATE	"CLIENTE"  
										SET 		"ESTADO_TITULAR" = '1'  
										WHERE 	"CLIENTE"."RUT" = :ll_rut_tit_des   
										USING	sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
								end if
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar Fallecido SQL: "+sqlca.sqlerrtext)
							end if
							
						else
							if   ll_n_l_s<>ll_nl or ll_n_m_s<>ll_nm or base_s<>ls_base or serie_s<>ls_serie or numero_s<>ll_numero or ls_sector_s<>ls_sector or &
								ls_sepultura_s<>ls_sepultura or ls_nombre_s<>ls_nombre_fall or ls_ap_pat_s<>ls_ap_pat_fall or ls_ap_mat_s<>ls_ap_mat_fall or ldt_fec_sepult_s<>ldt_fech_sepult or ls_est_s<>ls_cod_est_fall or &
								ls_op_s<>ls_op or ll_rut_s<>ll_rut_fall or ls_dv_s<>ls_dv_fall or ls_sexo_s<>ls_sexo_fall or ll_edad_s<>ll_edad_fall or ls_periodo_s<>ls_periodo_nacimiento or ldt_fec_nac_s<>ldt_fec_nac or &
								ldt_fec_fall_s<>ldt_fec_defun or ls_pase_s<>ls_pase_sepult or ls_otorgado_por_s<>ls_otorgado_por or ls_causa_fall_s<>ls_causa_fall or ls_funeraria_s<>ls_funeraria or &
								ls_n_tec_s<>ls_numero_tecni or ls_nivel_s<>ls_nivel or ls_observaciones_s<>ls_obs_sep_comp or ls_estado_contrato_s<>ls_estado_ctto or ls_resol_traslado_nro_s<>ls_inscripcion_pase or &
								ls_cementerio_origen_s<>ls_descrip_parque or ll_cod_parque_s<>ll_parque then
									
								UPDATE 	"FALLECIDOS"  
								SET 		"BASE" = :ls_base,   
											"SS" = :ls_serie,   
											"CONTRATO" = :ll_numero,   
											"SECTOR" = :ls_sector,   
											"N_SEP" = :ls_sepultura,   
											"NOMBRES" = :ls_nombre_fall,   
											"AP_PATERNO" = :ls_ap_pat_fall,   
											"AP_MATERNO" = :ls_ap_mat_fall,   
											"FEC_SEP" = :ldt_fech_sepult,   
											"EST" = :ls_cod_est_fall,   
											"OP" = :ls_op,
											"RUT" = :ll_rut_fall,   
											"DV" = :ls_dv_fall,   
											"SEXO" = :ls_sexo_fall,   
											"EDAD" = :ll_edad_fall,   
											"PERIODO" = :ls_periodo_nacimiento,   
											"FEC_NAC" = :ldt_fec_nac,   
											"FEC_FALL" = :ldt_fec_defun,   
											"PASE" = :ls_inscripcion_pase,   
											"REG_CIVIL" = :ls_otorgado_por,   
											"CAUSA_FALL" = :ls_causa_fall,   
											"FUNERARIA" = :ls_funeraria,   
											"N_TEC" = :ls_numero_tecni,   
											"NIVEL" = :ls_nivel,   
											"OBSERVACIONES" = :ls_obs_sep_comp,   
											"ESTADO_CONTRATO" = :ls_estado_ctto,   
											"RESOLUCION_TRASLADO_NRO" = :ls_pase_sepult,   
											"OTORGADO_POR" = :ls_otorgado_por,   
											"CEMENTERIO_ORIGEN" = :ls_descrip_parque,   
											"COD_PARQUE" = :ll_parque,   
											"LLAVE_ANTERIOR" = :ll_llave_anterior_s,   
											"NRO_SARCOFAGO" = :ls_nro_sarcofago_s,   
											"USUARIO_ULT_MOD" = :gs_user,   
											"FECHA_ULT_MOD" = :gdt_fec_sistema   
								WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave_s  
								USING	Trans_1;
								if Trans_1.sqlcode=0 then
									commit using Trans_1;
									INSERT INTO "LOG_FALLECIDOS"  
												( "LLAVE",  		"FOLIO",   				"N_L",   		"N_M",   		"BASE",   		"SS",   		"CONTRATO",   		"SECTOR",   	"N_SEP",   			"NOMBRES",   		"AP_PATERNO",   	"AP_MATERNO",   		"FEC_SEP",   			"EST",   		"OP",   		"RUT",   		"DV",   		"SEXO",   		"EDAD",   		"PERIODO",   		"FEC_NAC",   		"FEC_FALL",   		"PASE",   		"REG_CIVIL",   				"CAUSA_FALL",   	"ENF_OBL",   		"FUNERARIA",   		"BOLETA",   		"CARTA_AUT",   	"RG_EST",   			"N_TEC",   		"NIVEL",   		"VTA",   		"OBSERVACIONES",   		"ESTADO_CONTRATO",   		"RESOLUCION_TRASLADO_NRO",   	"OTORGADO_POR",   		"CEMENTERIO_ORIGEN",   	"COD_PARQUE",   		"USUARIO_CREA",   	"MOTIVO_CREA",	"FOLIO_FT" )  
									VALUES 	( :ll_llave_s,  	:ll_count_parque_s,   	:ll_n_l_s,   	:ll_n_m_s,   :base_s,   		:serie_s,   	:numero_s,  	 		:ls_sector_s,   	:ls_sepultura_s,   	:ls_nombre_s,   	:ls_ap_pat_s,   		:ls_ap_mat_s,   		:ldt_fec_sepult_s,   	:ls_est_s,  	:ls_op_s,   	:ll_rut_s,   	:ls_dv_s,   	:ls_sexo_s,   	:ll_edad_s,   	:ls_periodo_s,   	:ldt_fec_nac_s,   	:ldt_fec_fall_s,   	:ls_pase_s,   	:ls_otorgado_por_s,   	:ls_causa_fall_s,   	:ls_enf_obl_s,   	:ls_funeraria_s,   		:ls_boleta_s, 	:ls_carta_aut_s,   	:ll_corr_hist_reg_s,   	:ls_n_tec_s,   	:ls_nivel_s,   	:ls_vta_s, 	:ls_observaciones_s,  	:ls_estado_contrato_s,   			:ls_resol_traslado_nro_s,   				:ls_otorgado_por_s,   	:ls_cementerio_origen_s,   	:ll_cod_parque_s,   	:gs_user,   				'FT' ,					:ll_corr_ficha) 
									USING	Trans_1;
									if Trans_1.sqlcode=0 then
										commit using Trans_1;
									else
										rollback using Trans_1;
									end if
								else
									rollback using Trans_1;
								end if
							end if
							if ll_llave_s > 0 and isnull(ll_llave_fallecido) then
								tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'llave_fallecido',ll_llave_s)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'llave_fallecido',ll_llave_s)
								tab_1.tabpage_3.dw_ficha_sepult.accepttext()
								tab_1.tabpage_1.dw_ant_fall.accepttext()

							end if
						end if
						if tab_1.tabpage_3.dw_ficha_sepult.update() = 1 then
							commit;
						else
							rollback;
						end if
						ll_llave_s						= 0
						Setnull(ll_llave_s);Setnull(ll_count_parque_s);Setnull(ll_n_l_s);Setnull(ll_n_m_s);Setnull(base_s);Setnull(serie_s);Setnull(numero_s);Setnull(ls_sector_s);Setnull(ls_sepultura_s)
						Setnull(ls_nombre_s);Setnull(ls_ap_pat_s);Setnull(ls_ap_mat_s);Setnull(ldt_fec_sepult_s);Setnull(ls_est_s);Setnull(ls_op_s);Setnull(ll_rut_s);Setnull(ls_dv_s);Setnull(ls_sexo_s)
						Setnull(ll_edad_s);Setnull(ls_periodo_s);Setnull(ldt_fec_nac_s);Setnull(ldt_fec_fall_s);Setnull(ls_pase_s);Setnull(ls_otorgado_por_s);Setnull(ls_causa_fall_s);Setnull(ls_enf_obl_s)
						Setnull(ls_funeraria_s);Setnull(ls_boleta_s);Setnull(ls_carta_aut_s);Setnull(ll_corr_hist_reg_s);Setnull(ls_n_tec_s);Setnull(ls_nivel_s);Setnull(ls_vta_s);Setnull(ls_observaciones_s)
						Setnull(ls_estado_contrato_s);Setnull(ls_registro_pase_s);Setnull(ls_otorgado_por_s);Setnull(ls_cementerio_origen_s);Setnull(ll_cod_parque_s);Setnull(ll_llave_anterior_s)
						Setnull(ls_nro_sarcofago_s);Setnull(ls_cod_usuario_s);Setnull(ls_usuario_ult_mod);Setnull(ldt_fecha_ult_mod_s);Setnull(ll_folio_encuesta_s);Setnull(ll_covid_s);Setnull(ll_ubicacion_cuerpo_s)
						Setnull(ls_estado_exhum_s);Setnull(ldt_fecha_exhum_s);Setnull(ls_estado_inhuma_s);Setnull(ldt_fecha_inhuma_s);Setnull(ls_estado_ti_s);Setnull(ldt_fecha_ti_s);Setnull(ls_estado_te_s)
						Setnull(ldt_fecha_te_s);Setnull(ls_estado_re_s);Setnull(ldt_fecha_re_s);Setnull(ls_estado_tr_s);Setnull(ldt_fecha_tr_s);Setnull(ls_estado_crem_s);Setnull(ldt_fecha_crem_s);Setnull(ls_estado_reg_s)
						Setnull(ls_estado_fall_s);Setnull(ls_base_dest_s);Setnull(ls_serie_dest_s);Setnull(ll_numero_dest_s);Setnull(ls_usuario_crea_s);Setnull(ldt_fecha_crea_s);Setnull(ls_tipo_ficha_s)
						Setnull(ls_resol_traslado_nro_s)
						//Fin Codigo Falecido - Mirko
					next
					if isvalid(w_mantenedor_estadistico) then
						// no enviar email
					else
						SELECT	"ENCARGADOS"."NOMBRE"  
						INTO 		:ls_nom_usuario  
						FROM 	"ENCARGADOS"  
						WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
						if not isnull(ldt_fech_sepult) and ll_hora_sepult>0 and not isnull(ls_nom_usuario) and &
							not isnull(ls_sector) and ls_sector<>'' and ls_sector<>'-' and not isnull(ls_sepultura) and &
							ls_sepultura<>'' and ls_sepultura<>'-' and not isnull(ls_nombre_fall) and ls_nombre_fall<>'' and &
							not isnull(ls_ap_pat_fall) and ls_ap_pat_fall<>'' then
							
							ls_obs_fall				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'observacion_fallecido')
							ls_obs_sep_comp		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'observaciones_origen')
							DECLARE x1 CURSOR FOR  
							SELECT	"ENCARGADOS"."EMAIL"  
							FROM		"ENCARGADOS",   "FICHA_ADMINISTRADORES"  
							WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = "FICHA_ADMINISTRADORES"."USUARIO_ADM" ) and  
									 ( "ENCARGADOS"."ESTADO" = "FICHA_ADMINISTRADORES"."ESTADO" ) and  
									 (("FICHA_ADMINISTRADORES"."COD_PARQUE" = :ll_parque ) AND  
									 ( "FICHA_ADMINISTRADORES"."ESTADO" = 'A' )   )   
							USING		sqlca;
							open x1;
							if sqlca.sqlcode=0 then
								String	ls_asunto,ls_texto
								SetNull(ls_texto)
								SELECT	Count("ENCARGADOS"."EMAIL")
								INTO		:ll_tot_reg
								FROM		"ENCARGADOS",   "FICHA_ADMINISTRADORES"  
								WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = "FICHA_ADMINISTRADORES"."USUARIO_ADM" ) and  
										 ( "ENCARGADOS"."ESTADO" = "FICHA_ADMINISTRADORES"."ESTADO" ) and  
										 (("FICHA_ADMINISTRADORES"."COD_PARQUE" = :ll_parque ) AND  
										 ( "FICHA_ADMINISTRADORES"."ESTADO" = 'A' )   )   
								USING		sqlca;
								if ll_tot_reg>0 then
									SELECT	Count("FICHA_LOG_EMAIL"."COD_PARQUE")
									INTO 		:ll_count_reg_aux
									FROM 		"FICHA_LOG_EMAIL"  
									WHERE  ( "FICHA_LOG_EMAIL"."COD_PARQUE" = :ll_parque ) AND  
											 ( "FICHA_LOG_EMAIL"."SECTOR" = :ls_sector ) AND  
											 ( "FICHA_LOG_EMAIL"."SEPULTURA" = :ls_sepultura ) AND  
											 ( "FICHA_LOG_EMAIL"."FECHA_SEPULTACION" = :ldt_fech_sepult ) 
									USING		sqlca;
									
									SELECT	"FICHA_LOG_EMAIL"."HORA_SEPULTACION",	"FICHA_LOG_EMAIL"."MINUTO_SEPULTACION"  
									INTO 		:ll_hora_sepult_aux,							:ll_min_sepult_aux  
									FROM 		"FICHA_LOG_EMAIL"  
									WHERE  ( "FICHA_LOG_EMAIL"."COD_PARQUE" = :ll_parque ) AND  
											 ( "FICHA_LOG_EMAIL"."SECTOR" = :ls_sector ) AND  
											 ( "FICHA_LOG_EMAIL"."SEPULTURA" = :ls_sepultura ) AND  
											 ( "FICHA_LOG_EMAIL"."FECHA_SEPULTACION" = :ldt_fech_sepult ) AND  
											 ( "FICHA_LOG_EMAIL"."FECHA_CREA" = (	SELECT	max("FICHA_LOG_EMAIL"."FECHA_CREA") 
																								FROM 		"FICHA_LOG_EMAIL" 
																								WHERE  ( "FICHA_LOG_EMAIL"."COD_PARQUE" = :ll_parque ) AND 
																										 ( "FICHA_LOG_EMAIL"."SECTOR" = :ls_sector ) AND 
																										 ( "FICHA_LOG_EMAIL"."SEPULTURA" = :ls_sepultura ) AND 
																										 ( "FICHA_LOG_EMAIL"."FECHA_SEPULTACION" = :ldt_fech_sepult) ) )   
									USING		sqlca;
									if ll_count_reg_aux=0 or isnull(ll_count_reg_aux) then
										ls_asunto				= 'AVISO DE SEPULTACION PARA EL DIA '+STRING(ldt_fech_sepult,"dd/mm/yyyy")+' HORA: '+string(ll_hora_sepult,'00')+' '+string(ll_minuto_sepult,'00')+' enviado por : '+ls_nom_usuario+' PARQUE: '+ls_descrip_parque
										ls_texto 					= 'Recordamos que se GENERO Ficha de Sepultación a Realizarse el día '+string(ldt_fech_sepult,'dd/mm/yyyy')+' a las '+string(ll_hora_sepult,'00')+':'+string(ll_minuto_sepult,'00')+', Sector: '+ls_sector+' Nº Sepultura: '+ls_sepultura+' Nº Técnico: '+ls_numero_tecni+', el Nombre del Fallecido es '+ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
									else
										if (ll_hora_sepult_aux <> ll_hora_sepult and ll_min_sepult_aux <> ll_minuto_sepult) then
											ls_asunto			= 'AVISO MODIFICACION DE SEPULTACION PARA EL DIA '+STRING(ldt_fech_sepult,"dd/mm/yyyy")+' HORA: '+string(ll_hora_sepult,'00')+' '+string(ll_minuto_sepult,'00')+' enviado por : '+ls_nom_usuario+' PARQUE: '+ls_descrip_parque
											ls_texto 				= 'Recordamos que se MODIFICO HORARIO Ficha de Sepultación a Realizarse el día '+string(ldt_fech_sepult,'dd/mm/yyyy')+' a las '+string(ll_hora_sepult,'00')+':'+string(ll_minuto_sepult,'00')+', Sector: '+ls_sector+' Nº Sepultura: '+ls_sepultura+' Nº Técnico: '+ls_numero_tecni+', el Nombre del Fallecido es '+ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
										end if
									end if
									if ls_obs_sep_comp<>'' and ls_obs_sep_comp<>'-' and not isnull(ls_obs_sep_comp) and not isnull(ls_texto) then
										ls_texto					= ls_texto+ ' Observación Generales: '+ls_obs_sep_comp
										if not isnull(ls_obs_fall) then
											ls_texto				= ls_texto+ ' Observación Fallecido: '+ls_obs_fall
										end if
									end if
									if not isnull(ls_texto) then
										ls_texto					= ls_texto+'         Atte.Depto.At.y Serv.al Cliente'
										SELECT	"ENCARGADOS"."EMAIL"  
										INTO 		:email_de  
										FROM 	"ENCARGADOS"  
										WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
										USING	sqlca;
										
										SELECT 	"MEMBRETE_EMPRESA"."MAIL_SEPULTACION"  
										INTO 		:ls_email_para  
										FROM 	"MEMBRETE_EMPRESA"  
										WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_parque
										USING	sqlca;	
										
										select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
										INTO 		:ls_res
										from 		DUAL;
										if ls_res='OK' then
											messagebox("Envio Email","Envio Email Exitoso")
										else
											messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
										end if
		
										SELECT sysdate INTO :gdt_fec_sistema FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
										INSERT INTO "FICHA_LOG_EMAIL"  
													( "FECHA_CREA",		"USUARIO_ENVIA",	"OBS_ENVIADA",	"USUARIO_RECEPTOR",	"COD_PARQUE",	"SECTOR",	"SEPULTURA",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION" )  
										VALUES 	( :gdt_fec_sistema,	:gs_user,			:ls_texto,		:ls_email_para,		:ll_parque,		:ls_sector,	:ls_sepultura,	:ldt_fech_sepult,		:ll_hora_sepult,		:ll_minuto_sepult	 )  
										USING	sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
								else
									messagebox("Advertencia","No Existe Administrador Autorizado en Parque "+ls_descrip_parque+" para Envio Email, en Tabla FICHA_ADMINISTRADORES")
								end if
							end if
							close x1;
						end if
					end if
					wf_carga_detalle_boletas(ls_base, ls_serie, ll_numero, ll_corr_interno, ll_rut_tit_ori, date(ldt_fech_sepult), ll_parque, ll_rut_tit_des, ls_base_des, ls_serie_des, ll_numero_des)
					ll_res_grabar	= messagebox("Grabar","Grabación Exitosa, desea Limpiar Pantalla",Exclamation!,YesNo!,2)
					if ll_res_grabar=1 then
						il_modif		= 0
						tab_1.tabpage_1.dw_ant_fall.reset()
						tab_1.tabpage_3.dw_ficha_sepult.reset()
						tab_1.tabpage_4.dw_aranceles.reset()
					
						idw_detalle.reset()
						idw_detalle.insertrow(0)
						
						idw_detalle2.reset()
						idw_detalle2.insertrow(0)
						
						idw_detalle3.reset()
						idw_detalle3.insertrow(0)
						
						idw_detalle4.reset()
						idw_detalle4.insertrow(0)
						
						idw_detalle5.reset()
						idw_detalle5.insertrow(0)
						
						idw_detalle6.reset()
						idw_detalle6.insertrow(0)
						
						idw_detalle7.reset()
						idw_detalle7.insertrow(0)
						
						idw_detalle8.reset()
						idw_detalle8.insertrow(0)
						
						idw_detalle10.reset()
						idw_detalle10.insertrow(0)
					
						fila1	= tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
						fila3 = tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
						fila4 = tab_1.tabpage_4.dw_aranceles.InsertRow(0)
						tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'c_estado','N')
						idw_detalle9.reset()
						if gs_conexion	= "Parque El Prado" then
							idw_detalle9.retrieve(1)
						elseif gs_conexion = "Parque La Foresta" then
							idw_detalle9.retrieve(11)
						end if
						SELECT	"TAB_UF"."VALOR_UF"  
						INTO 		:ldb_valor_uf_dia  
						FROM 	"TAB_UF"  
						WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							tab_1.tabpage_4.dw_aranceles.setitem(fila4,'uf_dia',ldb_valor_uf_dia)
						end if
						if gs_depto='R' or gs_depto='M' then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'codigo_ejecutivo',gs_user)
						end if
						tab_1.SelectTab(1)
						tab_1.tabpage_1.dw_ant_fall.setitem(fila1,'c_estado','S')
						tab_1.tabpage_4.dw_aranceles.setitem(fila4,'c_estado','S')
						tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'tipo_traslado','I')
						tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'estado_reg','P')
						tab_1.tabpage_1.dw_ant_fall.enabled			= false
						tab_1.tabpage_4.dw_aranceles.enabled		= false
						tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
						tab_1.tabpage_3.dw_ficha_sepult.setfocus()
						tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
					else
						cb_carta.setfocus()
					end if
					if isvalid(w_mantenedor_estadistico) then 
						close(w_ingreso_ficha_traslado)
						w_mantenedor_estadistico.setfocus()
					end if
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Ficha Traslado SQL: "+sqlca.sqlerrtext)
				end if
			END IF
		end if
	end if
end if
end event

event getfocus;Long		ll_cod_parque
String	ls_sector,ls_sepultura
if tab_1.tabpage_3.dw_ficha_sepult.getrow()>0 then
	ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
	ls_sector			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector_origen')
	ls_sepultura		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura_origen')
	if isnull(ll_cod_parque) then
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
	elseif isnull(ls_sector) then
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector_origen')
	elseif isnull(ls_sepultura) then
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura_origen')
	end if
end if
end event

type cb_limpiar from commandbutton within w_ingreso_ficha_traslado
integer x = 1074
integer y = 2384
integer width = 201
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		fila1, fila2, fila3, fila4,ll_resp,ll_cod_parque
string 	ls_tabpage
Double	ldb_valor_uf_dia
datetime	ldt_fecha_hoy

ll_resp	= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then
	Setnull(gl_llave_fallecido_fc);Setnull(gl_cod_parque_origen_fc);Setnull(gl_numero_fc);Setnull(gl_rut_titular_fc);Setnull(gl_capacidad_fc);Setnull(gl_rut_fall_fc);Setnull(gl_edad_fc)
	Setnull(gs_nombre_fallecido_fc);Setnull(gs_ap_paterno_fallecido_fc);Setnull(gs_ap_materno_fallecido_fc);Setnull(gs_area_origen_fc);Setnull(gs_sector_origen_fc);Setnull(gs_sepultura_origen_fc)
	Setnull(gs_nro_resolucion_fc);Setnull(gs_nro_acta_fc);Setnull(gs_base_fc);Setnull(gs_serie_fc);Setnull(gs_cod_registro_fc);Setnull(gs_observacion_fc);Setnull(gs_area_fc)
	Setnull(gs_sector_fc);Setnull(gs_sepultura_fc);Setnull(gs_nivel_fc);Setnull(gs_estado_ctto_fc);Setnull(gs_nom_titular_fc);Setnull(gs_ap_pat_titular_fc)
	Setnull(gs_ap_mat_titular_fc);Setnull(gs_tipo_via_titular_fc);Setnull(gs_direc_titular_fc);Setnull(gs_nro_direc_titular_fc);Setnull(gs_depto_titular_fc);Setnull(gs_block_titular_fc)
	Setnull(gs_ciudad_titular_fc);Setnull(gs_comuna_titular_fc);Setnull(gs_fono_p_titular_fc);Setnull(gs_estado_titular_fc);Setnull(gs_nro_tecnico_fc);Setnull(gs_dv_titular_fc)
	Setnull(gs_dv_fall_fc);Setnull(gs_sexo_fc);Setnull(gdt_fecha_traslado_fc);Setnull(gdt_fecha_resolucion_fc);Setnull(gdt_fecha_ctto_fc);Setnull(gdt_fec_nac_fc);Setnull(gdt_fec_fall_fc)
	il_modif			= 0
	il_modif_item	= 0
	ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))
	tab_1.tabpage_1.dw_ant_fall.reset()
	tab_1.tabpage_3.dw_ficha_sepult.reset()
	tab_1.tabpage_4.dw_aranceles.reset()
	tab_1.tabpage_3.em_rut.text		= ''
	idw_detalle.reset()
	idw_detalle.insertrow(0)
	
	idw_detalle2.reset()
	idw_detalle2.insertrow(0)
	
	idw_detalle3.reset()
	idw_detalle3.insertrow(0)
	
	idw_detalle4.reset()
	idw_detalle4.insertrow(0)
	
	idw_detalle5.reset()
	idw_detalle5.insertrow(0)
	
	idw_detalle6.reset()
	idw_detalle6.insertrow(0)
	
	idw_detalle7.reset()
	idw_detalle7.insertrow(0)
	
	idw_detalle8.reset()
	idw_detalle8.insertrow(0)
	
	idw_detalle10.reset()
	idw_detalle10.insertrow(0)

	fila1	= tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
	fila3 = tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
	fila4 = tab_1.tabpage_4.dw_aranceles.InsertRow(0)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'c_estado','N')
	idw_detalle9.reset()
	ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
	if gs_conexion	= "Parque El Prado" then
		if isnull(ll_cod_parque) then ll_cod_parque=1
	elseif gs_conexion = "Parque La Foresta" then
		if isnull(ll_cod_parque) then ll_cod_parque=11
	end if
	idw_detalle9.retrieve(ll_cod_parque)
	if idw_detalle3.retrieve(ll_cod_parque)=0 then
		idw_detalle3.insertrow(0)
	end if
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_valor_uf_dia  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		tab_1.tabpage_4.dw_aranceles.setitem(fila4,'uf_dia',ldb_valor_uf_dia)
	end if
	if gs_depto='R' or gs_depto='M' then
		tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'codigo_ejecutivo',gs_user)
	end if
	tab_1.SelectTab(1)
	tab_1.tabpage_1.dw_ant_fall.setitem(fila1,'c_estado','S')
	tab_1.tabpage_4.dw_aranceles.setitem(fila4,'c_estado','S')
	tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'tipo_traslado','I')
	tab_1.tabpage_3.dw_ficha_sepult.setitem(fila3,'estado_reg','P')
	tab_1.tabpage_3.st_3.text						= 'Ficha Traslado (Interno - Externo)'
	tab_1.tabpage_1.dw_ant_fall.enabled			= false
	tab_1.tabpage_4.dw_aranceles.enabled		= false
	tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
	tab_1.tabpage_3.dw_ficha_sepult.accepttext()
	tab_1.tabpage_3.dw_ficha_sepult.setfocus()
	tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
end if
end event

type dw_print from datawindow within w_ingreso_ficha_traslado
boolean visible = false
integer x = 279
integer y = 2488
integer width = 571
integer height = 600
string title = "none"
string dataobject = "dw_ingreso_traslado_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_ingreso_ficha_traslado
integer x = 55
integer y = 52
integer width = 3561
integer height = 2280
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_3 tabpage_3
tabpage_1 tabpage_1
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_3=create tabpage_3
this.tabpage_1=create tabpage_1
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_3,&
this.tabpage_1,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_3)
destroy(this.tabpage_1)
destroy(this.tabpage_4)
end on

event selectionchanged;CHOOSE CASE tab_1.SelectedTab
	CASE 1
//		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		
	CASE 2
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
		
	CASE 3
//		tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
		tab_1.tabpage_4.dw_aranceles.setfocus()
//		tab_1.tabpage_4.dw_aranceles.setcolumn('codigo_parentesco')		
		
END CHOOSE
end event

event clicked;String		ls_estado_ctto_origen,ls_estado_ctto_destino,ls_tipo_traslado,ls_destino_parque,ls_estado_fosa

CHOOSE CASE tab_1.SelectedTab
	CASE 1
//		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		
	CASE 2
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
		ls_estado_ctto_origen		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_contrato_origen')
		ls_estado_ctto_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_contrato_destino')
		ls_tipo_traslado			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'tipo_traslado')
		ls_destino_parque			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'destino_parque')
		
		tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'estado_contrato_origen',ls_estado_ctto_origen)
		tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'estado_contrato_destino',ls_estado_ctto_destino)
		tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'tipo_traslado',ls_tipo_traslado)
		tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'destino_parque',ls_destino_parque)
		tab_1.tabpage_1.dw_ant_fall.accepttext()
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.setcolumn('sw_titular_fall')
		
	CASE 3
//		tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
		ls_tipo_traslado			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'tipo_traslado')
		ls_destino_parque			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'destino_parque')
		ls_estado_fosa				=  tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_ctto_fosa')
		tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'tipo_traslado',ls_tipo_traslado)
		tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'destino_parque',ls_destino_parque)
		tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'estado_ctto_fosa',ls_estado_fosa)
		tab_1.tabpage_4.dw_aranceles.accepttext()
		tab_1.tabpage_4.dw_aranceles.setfocus()
//		tab_1.tabpage_4.dw_aranceles.setcolumn('codigo_parentesco')		
		
END CHOOSE
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3525
integer height = 2152
long backcolor = 67108864
string text = "  Ficha Traslado"
long tabtextcolor = 33554432
string picturename = "AutosizeHeight!"
long picturemaskcolor = 536870912
st_6 st_6
em_rut em_rut
st_5 st_5
st_3 st_3
dw_ficha_sepult dw_ficha_sepult
gb_3 gb_3
end type

on tabpage_3.create
this.st_6=create st_6
this.em_rut=create em_rut
this.st_5=create st_5
this.st_3=create st_3
this.dw_ficha_sepult=create dw_ficha_sepult
this.gb_3=create gb_3
this.Control[]={this.st_6,&
this.em_rut,&
this.st_5,&
this.st_3,&
this.dw_ficha_sepult,&
this.gb_3}
end on

on tabpage_3.destroy
destroy(this.st_6)
destroy(this.em_rut)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.dw_ficha_sepult)
destroy(this.gb_3)
end on

type st_6 from statictext within tabpage_3
integer x = 2528
integer y = 68
integer width = 928
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "(Solo Contrato NO Ingresado)"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_rut from editmask within tabpage_3
integer x = 2107
integer y = 44
integer width = 393
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;string	ls_base_rez,ls_serie_rez,ls_nombre_rez,ls_ap_paterno_rez,ls_ap_materno_rez,ls_direccion_rez,ls_comuna_rez,ls_ciudad_rez,ls_fono_rez,ls_dv_rez,&
		ls_sector,ls_sepult,ls_estado_rez,ls_nom_falle,ls_ap_pater_falle,ls_ap_mater_falle,ls_est_falle,ls_string
long ll_rut,ll_numero_rez,ll_cod_parque

if long(this.text)>0 then
	ll_rut		= long(trim(em_rut.text))
	if ll_rut>0 then
		SELECT 	DISTINCT "RESERVA_SEPULTURA"."SECTOR", "RESERVA_SEPULTURA"."SEPULTURA",  "RESERVA_SEPULTURA"."COD_PARQUE", "RESERVA_SEPULTURA"."BASE", "RESERVA_SEPULTURA"."SERIE", "RESERVA_SEPULTURA"."NUMERO",  "RESERVA_SEPULTURA"."NOMBRE", "RESERVA_SEPULTURA"."A_PATERNO", "RESERVA_SEPULTURA"."A_MATERNO"   
		INTO		:ls_sector,:ls_sepult,:ll_cod_parque,:ls_base_rez,	:ls_serie_rez,:ll_numero_rez,	:ls_nombre_rez,							:ls_ap_paterno_rez,  					:ls_ap_materno_rez			
			FROM 	"RESERVA_SEPULTURA"  
			WHERE 	"RESERVA_SEPULTURA"."RUT" = :ll_rut ;
		if ll_cod_parque > 0 and ll_numero_rez > 0 then
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'cod_parque',ll_cod_parque)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sector_origen',ls_sector)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sepultura_origen',ls_sepult)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'rut_titular_origen',ll_rut)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'dv_titular_origen',ls_dv_rez)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'nombre_titular_origen',ls_nombre_rez)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'apellido_pat_titular_origen',ls_ap_paterno_rez)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'apellido_mat_titular_origen',ls_ap_materno_rez)
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'direccion_titular_origen','-')
		//	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'cod_comuna_titular_origen','-')
		//	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'cod_ciudad_titular_origen','-')
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'fono_titular_origen','-')
		//	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'tipo_via_titular_origen','-')
//			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'num_direccion_titular_origen','-')
//			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'depto_direccion_titular_origen','-')
//			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'block_direccion_titular_origen','-')
//			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'poblacion_villa_titular_origen','-')
	//		tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sector_titular','-')
			//
			DECLARE x1 CURSOR FOR
			SELECT "FALLECIDOS"."NOMBRES",   
				"FALLECIDOS"."AP_PATERNO",   
				"FALLECIDOS"."AP_MATERNO",   
				"FALLECIDOS"."EST"  
			FROM "FALLECIDOS"  
			WHERE ( "FALLECIDOS"."BASE" = :gs_base ) AND  
					( "FALLECIDOS"."SS" = :gs_serie ) AND  
					( "FALLECIDOS"."CONTRATO" = :gi_numero ) AND  
					( "FALLECIDOS"."SECTOR" = :ls_sector ) AND  
					( "FALLECIDOS"."N_SEP" = :ls_sepult )  AND
					( "FALLECIDOS"."ESTADO_REG" = 'A' )
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x1 into :ls_nom_falle,:ls_ap_pater_falle,:ls_ap_mater_falle,:ls_est_falle;
					if not isnull(ls_nom_falle) and ls_nom_falle <> '' then
						ls_string		= ls_string+' '+ls_nom_falle+' '+ls_ap_pater_falle+' '+ls_ap_mater_falle+' '+ls_est_falle+'||'
					end if
					Setnull(ls_nom_falle);Setnull(ls_ap_pater_falle);Setnull(ls_ap_mater_falle);Setnull(ls_est_falle)
				LOOP
			end if	
			close x1;
			tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'observaciones_origen',ls_string)
			tab_1.tabpage_3.dw_ficha_sepult.accepttext()
			//
		else
			messagebox("Advertencia","No se Encuentra Dato")
			em_rut.setfocus()
		end if	
	else
		if isnull(ll_rut) or ll_rut=0 then
			messagebox("Advertencia","Debe Ingresar Rut del Titular del NI")
			em_rut.setfocus()
		end if
	end if
end if

end event

type st_5 from statictext within tabpage_3
integer x = 1856
integer y = 68
integer width = 242
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut Titular"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_3
integer x = 59
integer y = 44
integer width = 1614
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Ficha Traslado (Interno - Externo)"
boolean focusrectangle = false
end type

type dw_ficha_sepult from datawindow within tabpage_3
integer x = 46
integer y = 184
integer width = 3479
integer height = 1944
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_ficha_traslado"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_base, ls_ciudad,ls_serie,ls_sector_sepult,ls_nro_sepultura,ls_estado_ctto,ls_nro_tecnico,ls_dv_titular,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,ls_cod_tipo_via,&
			ls_direccion_p,ls_nro_part,ls_depto_part,ls_block_part,ls_pob_part,ls_sector_part,ls_comuna_part,ls_ciudad_part,ls_fono_part,ls_parque,ls_sector,ls_sepultura,&
			ls_cod_ejecutivo,ls_vd_estadistico,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_tipo_via_tit,ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,&
			ls_pob_villa_tit,ls_sector_tit,ls_cod_ciud_tit,ls_cod_com_tit,ls_fono_titular,ls_dv,ls_nombre_tit_des,ls_ap_pat_tit_des,ls_ap_mat_tit_des,ls_dir_tit_des,ls_pob_tit_des,&
			ls_sector_tit_des,ls_comuna_tit_des,ls_ciudad_tit_des,ls_fono_tit_des,ls_nro_tit_des,ls_depto_tit_des,ls_block_tit_des,ls_tipo_via_tit_des,ls_base_des,ls_serie_des,ls_tipo_traslado,&
			ls_nivel,ls_var_nivel,ls_var_cap,ls_var_final,ls_nivel_aux,ls_estado_sep_ori,ls_estado_reg,ls_cod_age_aux,ls_ciu_ori,ls_ciu_des,ls_pasa,ls_pasa1,ls_est_ctto,ls_descrip_estado,&
			ls_pasa_ctrol,ls_nulo,ls_base_origen,ls_serie_origen,ls_base_destino,ls_serie_destino,ls_tipo_cons,ls_estado_fosa,ls_string,ls_destino_parque,ls_pasa_fc='N',&
			ls_estado_ctto_ori,ls_sector_d,ls_sepultura_d,ls_base_d,ls_serie_d,ls_estado_ctto_d,ls_nro_tecnico_d,ls_dv_titular_d,ls_nombre_tit_d,ls_ap_pat_tit_d,ls_ap_mat_tit_d,ls_tipo_via_tit_d,ls_direc_tit_d,&
			ls_dpto_dir_tit_d,ls_block_dir_tit_d,ls_pob_villa_tit_d,ls_sector_tit_d,ls_cod_ciud_tit_d,ls_cod_com_tit_d,ls_fono_titular_d,ls_num_dir_tit_d
Long		ll_count_fall,ll_cod_parque,ll_capacidad,ll_mora_cred,ll_mora_mant,ll_rut_titular,ll_resp,ll_new,ll_hora_hoy,ll_minutos_hoy,ll_hora,ll_minutos,ll_hora_recep,ll_minuto_recep,&
			ll_hora_salida,ll_minu_salida,ll_new_titular,ll_new_fall,ll_new_ara,ll_cod_parque_des,ll_rut,ll_pos,ll_indi,ll_hora_fijada,ll_min_fijada,ll_count,ll_parque_tras,&
			ll_count_sep,ll_count_tras,ll_count_suma,ll_count_reserva,ll_parque_aux,ll_count_tiene,	ll_cod_parque_ori,ll_new_reg_fall,ll_nulo,ll_fila,ll_capacidad_ori,ll_count_fila_fs,&
			ll_capacidad_des,ll_count_cap,ll_tot_reg_fall,ll_tot_reg,ll_count_fosa,ll_rut_titular_d,ll_capacidad_d
datetime	ldt_fecha_ctto,ldt_fecha_sepult,ldt_fecha_hoy,ldt_fecha_recep,ldt_fec_tras,ldt_nulo,ldt_fecha_ctto_d
Double	ll_numero,ll_numero_des,ll_num_des,ll_num_origen,ll_numero_origen,ll_numero_destino,ll_numero_d


is_otro		= 'N'
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
Setnull(ll_nulo);Setnull(ls_nulo);setnull(ldt_nulo)
ls_columna	= dwo.name
if ls_columna<>'cod_parque' and ls_columna<>'sector_origen' and ls_columna<>'sepultura_origen' and ls_columna<>'fecha_traslado' then
	il_modif_item ++
end if
if ls_columna='cod_ciudad_titular_origen' or ls_columna='cod_ciudad_titular_destino' or &
	ls_columna='base_origen' or ls_columna='cod_parque_destino' or ls_columna='sector_destino' or &
	ls_columna='rut_titular_destino' or ls_columna='dv_titular_destino' or ls_columna='rut_titular_origen' or &
	ls_columna='dv_titular_origen' then
	wf_validar_columna(ls_columna)
end if
if ls_columna='hora_fijada' or ls_columna='minuto_fijada' or ls_columna='hora_fijada' or ls_columna='minuto_fijada' then
	wf_validar_tiempo(ls_columna)
end if
if ls_columna='cod_parque' or ls_columna='sector_origen' or ls_columna='sepultura_origen' or ls_columna='fecha_traslado' or ls_columna='fecha_traslado_1' then
	ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
	if ll_cod_parque > 0 then
		SELECT	"FICHA_HORAS"."HORA_INICIO",   
					"FICHA_HORAS"."MINUTO_INICIO",   
					"FICHA_HORAS"."HORA_FINAL",   
					"FICHA_HORAS"."MINUTO_FINAL",   
					"FICHA_HORAS"."INTERVALO_MINUTO",   
					"FICHA_HORAS"."VECES_SEPULTACION"  
		INTO		:il_hora_ini,   
					:il_min_ini,   
					:il_hora_fin,   
					:il_min_fin,   
					:il_intervalo,   
					:il_veces  
		FROM 	"FICHA_HORAS"  
		WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_cod_parque   ;
		idw_detalle3.retrieve(ll_cod_parque)
		idw_detalle4.retrieve(ll_cod_parque)
	end if
	ls_sector				= this.getitemstring(this.getrow(),'sector_origen')
	ls_estado_fosa		= this.getitemstring(this.getrow(),'estado_ctto_fosa')
//	if ls_estado_fosa='F' then
//		st_3.text			= 'Ficha de Traslado desde Fosa Común'
//	else
//		st_3.text			= 'Ficha Traslado (Interno - Externo)'
//	end if
	if ll_cod_parque>0 and not isnull(ls_sector) then
		idw_detalle5.retrieve(ll_cod_parque,ls_sector)
		idw_detalle6.retrieve(ll_cod_parque,ls_sector)
	end if
	ls_sepultura		= this.getitemstring(this.getrow(),'sepultura_origen')
	if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
		not isnull(ls_sepultura) and ls_sepultura<>'' then
		if idw_detalle10.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
			idw_detalle10.insertrow(0)
		end if
		SELECT	Count("INVENTARIO_PLANI"."BASE")
		INTO 		:ll_count_reserva
		FROM 	"INVENTARIO_PLANI"  
		WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
				 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
				 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) AND  
				 ( "INVENTARIO_PLANI"."NUMERO" > 0 )   
		USING		sqlca;
		if ll_count_reserva>0 then
			ls_pasa	= 'S'
		else
			SELECT	Count("RESERVA_SEPULTURA"."FOLIO_RESERVA")  
			INTO 		:ll_count_tiene  
			FROM 	"RESERVA_SEPULTURA"  
			WHERE  ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) AND  
					 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
					 ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
					 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura )   
			USING		sqlca;
			if ll_count_tiene>0 then
				ls_pasa1	= 'S'
			else
				ls_pasa1	= 'N'
			end if
		end if
		if not isnull(ll_cod_parque) and not isnull(ls_sector) and not isnull(ls_sepultura) and not isnull(ldt_fecha_sepult) and ls_pasa1= 'N' then
			SELECT 	  Count("FOSA_COMUN"."AREA")
			INTO 		  :ll_count_fosa  
			FROM 	  "FOSA_COMUN"  
			WHERE 	( "FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque ) AND  
						( "FOSA_COMUN"."SECTOR" = :ls_sector ) AND  
						( "FOSA_COMUN"."SEPULTURA" = :ls_sepultura )   ;
			if ll_count_fosa > 0 then
				ls_pasa1	= 'S'
				st_3.text			= 'Ficha de Traslado desde Fosa Común'
			else
				ls_pasa1	= 'N'
				st_3.text			= 'Ficha Traslado (Interno - Externo)'
			end if
		end if
		if ls_pasa='S' or ls_pasa1='S' then
			ldt_fecha_sepult		= this.getitemdatetime(this.getrow(),'fecha_traslado')
			if isnull(ldt_fecha_sepult) and ll_count_fosa > 0 then 
				dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_traslado',datetime(date(gdt_fec_sistema),time('00:00:00')))
				dw_ficha_sepult.accepttext()
				ldt_fecha_sepult	= this.getitemdatetime(this.getrow(),'fecha_traslado')
			end if
			ls_cod_ejecutivo		= this.getitemstring(this.getrow(),'codigo_ejecutivo')
			if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
				not isnull(ls_sepultura) and ls_sepultura<>'' then //and not isnull(ldt_fecha_sepult)
				ls_tipo_traslado	= dw_ficha_sepult.getitemstring(this.getrow(),'tipo_traslado')
				if dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)=0 then
					if idw_detalle10.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
						idw_detalle10.insertrow(0)
					end if
					if idw_detalle9.retrieve(ll_cod_parque)=0 then
						idw_detalle9.insertrow(0)
					end if
					idw_detalle11.reset()
					idw_detalle11.insertrow(0)
					idw_detalle12.reset()
					idw_detalle12.insertrow(0)
					ll_new		= dw_ficha_sepult.insertrow(0)
					dw_ficha_sepult.setitem(ll_new,'sector_origen',ls_sector)
					dw_ficha_sepult.setitem(ll_new,'sepultura_origen',ls_sepultura)
					dw_ficha_sepult.setitem(ll_new,'cod_parque',ll_cod_parque)
					dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
					dw_ficha_sepult.setitem(ll_new,'sector_origen',ls_sector)
					dw_ficha_sepult.setitem(ll_new,'sepultura_origen',ls_sepultura)
					dw_ficha_sepult.setitem(ll_new,'tipo_traslado',ls_tipo_traslado)
					dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
					dw_ficha_sepult.setitem(ll_new,'est_uso_firma_digital',1)
					dw_ficha_sepult.setcolumn('fecha_traslado')
					SELECT	"INVENTARIO_PLANI"."BASE",   
								"INVENTARIO_PLANI"."SERIE",   
								"INVENTARIO_PLANI"."NUMERO",
								"INVENTARIO_PLANI"."NUMERO_TEC",
								"INVENTARIO_PLANI"."CAPACIDAD"
					INTO 		:ls_base,   
								:ls_serie,   
								:ll_numero,
								:is_nro_tecnico,
								:il_capacidad
					FROM 	"INVENTARIO_PLANI"  
					WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
							 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
							 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) 
					USING		sqlca;
					if ls_pasa1='S' then
						SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO",	"RESERVA_SEPULTURA"."CAPACIDAD"  
						INTO 		:ls_base,									:ls_serie,									:ll_numero,									:il_capacidad
						FROM 		"RESERVA_SEPULTURA"  
						WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
								 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
								 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
								 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) AND  
								 ( "RESERVA_SEPULTURA"."FOLIO_RESERVA" = ( 	SELECT MAX("RESERVA_SEPULTURA"."FOLIO_RESERVA") 
																									FROM 		"RESERVA_SEPULTURA" 
																									WHERE  	( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND 
																									 			( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
																												( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND 
																									 			( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) ) )   
						USING		sqlca;
						if sqlca.sqlcode <> 0 then
							//////////////VALIDAR
							SELECT	"CADENA"."CODIGO",		"CADENA"."SERIE", 	"CADENA"."NUMERO", 	"PAGO_OFERTA"."CAPACIDAD"  
							INTO 		:ls_base,						:ls_serie,					:ll_numero,					:il_capacidad
							FROM 	"OFERTA_V",  	"PAGO_OFERTA", 	"CADENA"  
							WHERE 	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
										( "PAGO_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
										( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
										( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
										( "PAGO_OFERTA"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
										( ( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
										( "PAGO_OFERTA"."SECTOR" = :ls_sector ) AND  
										( "PAGO_OFERTA"."SEPULTURA" = :ls_sepultura ) AND  
										( "CADENA"."CODIGO" = 'O' ) ) 
							UNION
							SELECT 	"CADENA"."CODIGO", 		"CADENA"."SERIE", 	"CADENA"."NUMERO", 	"CONTRATO"."CAPACIDAD"  
							FROM 	"CADENA",  	"CONTRATO"  
							WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
										( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
										( ( "CADENA"."CODIGO" = 'C' ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
										( "CONTRATO"."SECTOR" = :ls_sector ) AND  
										( "CONTRATO"."SEPULTURA" = :ls_sepultura ) )  
							USING	sqlca;
							if sqlca.sqlcode <> 0 then
								SELECT DISTINCT 	"FOSA_COMUN"."BASE",		MAX("FOSA_COMUN"."NUMERO"  ),	4
								INTO 						:ls_base,							:ll_numero,									:il_capacidad
								FROM 	"FOSA_COMUN"  
								WHERE   "FOSA_COMUN"."SECTOR" = :ls_sector  AND  
											"FOSA_COMUN"."SEPULTURA" = :ls_sepultura  AND 
											"FOSA_COMUN"."BASE" IS NOT NULL  AND 
											"FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque
								GROUP BY "FOSA_COMUN"."BASE"
								USING	sqlca;
								if sqlca.sqlcode=0 then 
									SELECT DISTINCT 	"FOSA_COMUN"."SERIE"
									INTO 						:ls_serie
									FROM 	"FOSA_COMUN"  
									WHERE   "FOSA_COMUN"."SECTOR" = :ls_sector  AND  
												"FOSA_COMUN"."SEPULTURA" = :ls_sepultura  AND 
												"FOSA_COMUN"."BASE" IS NOT NULL  AND 
												"FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque AND
												"FOSA_COMUN"."BASE" = :ls_base AND
												"FOSA_COMUN"."NUMERO" = :ll_numero
									USING	sqlca;
									ls_pasa_fc		= 'S'
								end if
							end if
						end if
					end if
					if sqlca.sqlcode=0 then
						if ls_base='O' then
							if ls_pasa_fc = 'S' then
								ls_pasa_ctrol	= 'S'
								is_pasa_plani	= 'S'
							elseif ll_numero=10000000 then
								ls_pasa_ctrol	= 'S'
								is_pasa_plani	= 'S'
							else
								is_pasa_plani	= 'N'
								SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
								INTO 		:ll_parque_aux,				:ls_cod_age_aux  
								FROM 		"CD_FOLIO"  
								WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
										 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
										 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ls_pasa_ctrol		= 'S'
								else
									if (ll_numero <= 84000 and gs_conexion	= "Parque El Prado") or &
										(ll_numero <= 15884 and gs_conexion	= "Parque La Foresta") then
										ls_pasa_ctrol	= 'S'
									else
										ls_pasa_ctrol	= 'N'
									end if
								end if
							end if
						else
							ls_pasa_ctrol			= 'S'
						end if
						if ls_pasa_ctrol='S' then
							SELECT	"CADENA"."ESTADO"  
							INTO		:ls_est_ctto  
							FROM 		"CADENA"  
							WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
									 ( "CADENA"."SERIE" = :ls_serie ) AND  
									 ( "CADENA"."NUMERO" = :ll_numero )   
							USING		sqlca;
							if ls_est_ctto='V' or ls_est_ctto='C' or ls_est_ctto='R' or ls_est_ctto='S' or ls_est_ctto='N' or ls_est_ctto='D' or ls_est_ctto='F' or ls_est_ctto='A' or sqlca.sqlcode=100 then
								if not isnull(ldt_fecha_sepult) then
									dw_ficha_sepult.setitem(ll_new,'fecha_traslado',ldt_fecha_sepult)
//									dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',ls_cod_ejecutivo)
									dw_ficha_sepult.setitem(ll_new,'estado_reg','P')
									dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
									dw_ficha_sepult.setitem(ll_new,'tipo_traslado',ls_tipo_traslado)
									dw_ficha_sepult.setitem(ll_new,'estado_ctto_fosa',ls_estado_fosa)
									ll_resp		= messagebox("Advertencia","No Existe Ficha de Traslado, desea Ingresarla",Exclamation!,YesNo!,2)
									if ll_resp=1 then
										tab_1.tabpage_1.dw_ant_fall.enabled		= true
										tab_1.tabpage_4.dw_aranceles.enabled	= true
										dw_ficha_sepult.enabled						= true
										dw_ficha_sepult.accepttext()
										SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
										ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
										ll_hora_hoy					= long(string(gdt_fec_sistema,'hh'))
										ll_minutos_hoy				= long(string(gdt_fec_sistema,'mm'))
										if is_usuario_esta='S' then
											dw_ficha_sepult.setitem(ll_new,'fecha_recepcion',ldt_fecha_hoy)
											dw_ficha_sepult.setitem(ll_new,'hora_recepcion',ll_hora_hoy)
											dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',ll_minutos_hoy)
										end if
										dw_ficha_sepult.setitem(ll_new,'c_estado','S')
										tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'c_estado','N')
										tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'sw_titular_fall',1)
										tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'sw_pase_sepultacion',1)
										tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'c_estado','N')
										dw_ficha_sepult.setitem(ll_new,'folio',1)
										dw_ficha_sepult.setitem(ll_new,'hora_fijada',0)
										dw_ficha_sepult.setitem(ll_new,'minuto_fijada',0)
										dw_ficha_sepult.setitem(ll_new,'hora_salida',0)
										dw_ficha_sepult.setitem(ll_new,'minuto_salida',0)
										dw_ficha_sepult.setitem(ll_new,'hora_recepcion',0)
										dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',0)
										
										dw_ficha_sepult.setitem(ll_new,'base_origen',ls_base)
										dw_ficha_sepult.setitem(ll_new,'serie_origen',ls_serie)
										dw_ficha_sepult.setitem(ll_new,'numero_origen',ll_numero)
										dw_ficha_sepult.setitem(ll_new,'cod_parque_origen',ll_cod_parque)

										if idw_detalle.retrieve(ls_base)=0 then
											idw_detalle.insertrow(0)
										end if
										SELECT	COUNT("FALLECIDOS"."LLAVE")  
										INTO 		:ll_count_fall  
										FROM 		"FALLECIDOS"  
										WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
												 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
												 ( "FALLECIDOS"."CONTRATO" = :ll_numero )  AND
												 ( "FALLECIDOS"."EST" = 'CC' )  AND
												( "FALLECIDOS"."ESTADO_REG" = 'A' );
										if isnull(ll_count_fall) then ll_count_fall=0
										if ls_base='O' then
											
//											SELECT	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA" 
//											INTO 		:ls_sector_sepult,					:ls_nro_sepultura,						:ll_cod_parque,					:ls_estado_ctto,		:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto
											
											SELECT	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."ESTADO",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA" 
											INTO 		:ls_sector_sepult,					:ls_nro_sepultura,						:ls_estado_ctto,		:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto
											FROM 		"CADENA",   "CADENA_MORA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
											WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
													 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
													 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
													 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
													 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
													 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
													 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
													 (("CADENA"."CODIGO" = 'O' ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												if isnull(ls_estado_ctto) or ls_estado_ctto='' then ls_estado_ctto='E'
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','S')
												if dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')=ll_cod_parque or &
													isnull(dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')) then
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
												else
													SELECT 	"MEMBRETE_EMPRESA"."PARQUE"  
													INTO 		:ls_parque  
													FROM 	"MEMBRETE_EMPRESA"  
													WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
//													if ll_cod_parque=1 then
//														ls_parque	= 'El Prado'
//													elseif ll_cod_parque=11 then
//														ls_parque	= 'La Foresta'
//													elseif ll_cod_parque=102 then
//														ls_parque	= 'El Manantial'
//													elseif ll_cod_parque=801 then
//														ls_parque	= 'Concepción'
//													end if
													ll_resp	= messagebox("Advertencia","Parque Inválido, Promesa Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
													if ll_resp=1 then
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
														dw_ficha_sepult.accepttext()
													else
														dw_ficha_sepult.setcolumn('cod_parque')
													end if
												end if
												
												//////////////////////////////////////////
												if dw_ficha_sepult.getitemstring(this.getrow(),'sector_origen')=ls_sector_sepult or isnull(dw_ficha_sepult.getitemstring(this.getrow(),'sector_origen')) or &
													ls_est_ctto='F' then
													if ls_est_ctto='F' then
														dw_ficha_sepult.setitem(this.getrow(),'sector_origen',ls_sector)
													else
														dw_ficha_sepult.setitem(this.getrow(),'sector_origen',ls_sector_sepult)
													end if
												else
													ll_resp	= messagebox("Advertencia","Sector Inválido, Promesa Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
													if ll_resp=1 then
														dw_ficha_sepult.setitem(this.getrow(),'sector_origen',ls_sector_sepult)
														dw_ficha_sepult.accepttext()
													else
														dw_ficha_sepult.setcolumn('sector_origen')
													end if
												end if
												if dw_ficha_sepult.getitemstring(this.getrow(),'sepultura_origen')=ls_nro_sepultura or &
													isnull(dw_ficha_sepult.getitemstring(this.getrow(),'sepultura_origen')) then
													dw_ficha_sepult.setitem(this.getrow(),'sepultura_origen',ls_nro_sepultura)
												else
													ll_resp	= messagebox("Advertencia","Sepultura Inválida, Promesa Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
													if ll_resp=1 then
														dw_ficha_sepult.setitem(this.getrow(),'sepultura_origen',ls_nro_sepultura)
														dw_ficha_sepult.accepttext()
													else
														dw_ficha_sepult.setcolumn('sepultura_origen')
													end if
												end if
												
												dw_ficha_sepult.setitem(this.getrow(),'cod_parque_origen',ll_cod_parque)
												dw_ficha_sepult.setitem(this.getrow(),'numero_tecnico_origen',is_nro_tecnico)
												dw_ficha_sepult.setitem(this.getrow(),'capacidad_origen',il_capacidad)
												ls_base_origen		= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'base_origen')
												ls_serie_origen		= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'serie_origen')
												ll_numero_origen	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'numero_origen')
												if ls_base_origen='O' then
													SELECT	"OFERTA_V"."TIPO_CONS"  
													INTO 		:ls_tipo_cons  
													FROM 		"CADENA",   
																"OFERTA_V"  
													WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
															 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
															 (("CADENA"."CODIGO" = :ls_base_origen ) AND  
															 ( "OFERTA_V"."SERIE" = :ls_serie_origen ) AND  
															 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_origen ) )   
													USING		sqlca;
													if sqlca.sqlcode<>0 then
														ls_tipo_cons	= 'T'
													end if
												else
													ls_tipo_cons		= 'T'
												end if
												if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
												if idw_detalle11.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
													idw_detalle11.insertrow(0)
												end if
												dw_ficha_sepult.setitem(this.getrow(),'estado_contrato_origen',ls_estado_ctto)
												if (il_capacidad - ll_count_fall)=0 then
													dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_origen','S')
												else
													dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_origen','N')
												end if
												dw_ficha_sepult.accepttext()
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'rut_titular_origen',ll_rut_titular)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'dv_titular_origen',ls_dv_titular)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'nombre_titular_origen',ls_nom_titular)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'apellido_pat_titular_origen',ls_ap_pat_titular)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'apellido_mat_titular_origen',ls_ap_mat_titular)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'tipo_via_origen_titular',ls_cod_tipo_via)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'direccion_titular_origen',ls_direccion_p)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'nro_direc_titular_origen',ls_nro_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'dpto_direc_titular_origen',ls_depto_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'block_direc_titular_origen',ls_block_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'poblacion_villa_origen',ls_pob_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'sector_titular_origen',ls_sector_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_ciudad_titular_origen',ls_ciudad_part)
												idw_detalle7.retrieve(ls_ciudad_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_comuna_titular_origen',ls_comuna_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fono_titular_origen',ls_fono_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato_origen',ldt_fecha_ctto)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'mora_mant_origen',ll_mora_mant)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'mora_cred_origen',ll_mora_cred)
												if ll_mora_cred>0 then
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_credito_origen','S')
												else
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_credito_origen','N')
												end if
												if ll_mora_mant>0 then
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_mantencion_origen','S')
												else
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_mantencion_origen','N')
												end if
												dw_ficha_sepult.setcolumn('hora_fijada')
											else
												dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_origen','N')
												dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_destino','N')
												SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
												INTO 		:ll_parque_aux,				:ls_cod_age_aux  
												FROM 		"CD_FOLIO"  
												WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
														 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
														 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
//													if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
//														messagebox("Advertencia","Este Contrato NO tiene Agente Asignado")
//														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','N')
//													else
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','S')
//													end if
												else
													messagebox("Advertencia","Contrato No Existe en Control Documentario")
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','N')
												end if
											end if
										elseif ls_base='C' then
											SELECT	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."FECHA"  
											INTO 		:ls_estado_ctto,		:ll_cod_parque,			:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part  ,		:ls_sector_sepult,	:ls_nro_sepultura,		:ldt_fecha_ctto			
											FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
											WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
													 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
													 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
													 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
													 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
													 (("CADENA"."CODIGO" = 'C' ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												if isnull(ls_estado_ctto) or ls_estado_ctto='' then ls_estado_ctto='E'
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','S')
												if dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')=ll_cod_parque or &
													isnull(dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')) then
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
												else
													SELECT 	"MEMBRETE_EMPRESA"."PARQUE"  
													INTO 		:ls_parque  
													FROM 	"MEMBRETE_EMPRESA"  
													WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
//													if ll_cod_parque=1 then
//														ls_parque	= 'El Prado'
//													elseif ll_cod_parque=11 then
//														ls_parque	= 'La Foresta'
//													elseif ll_cod_parque=102 then
//														ls_parque	= 'El Manantial'
//													elseif ll_cod_parque=801 then
//														ls_parque	= 'Concepción'
//													end if
													ll_resp	= messagebox("Advertencia","Parque Inválido, Contrato IsaCruz Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
													if ll_resp=1 then
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
														dw_ficha_sepult.accepttext()
													else
														dw_ficha_sepult.setcolumn('cod_parque')
													end if
												end if
												if dw_ficha_sepult.getitemstring(this.getrow(),'sector_origen')=ls_sector_sepult or &
													isnull(dw_ficha_sepult.getitemstring(this.getrow(),'sector_origen')) then
													dw_ficha_sepult.setitem(this.getrow(),'sector_origen',ls_sector_sepult)
												else
													ll_resp	= messagebox("Advertencia","Sector Inválido, Contrato IsaCruz Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
													if ll_resp=1 then
														dw_ficha_sepult.setitem(this.getrow(),'sector_origen',ls_sector_sepult)
														dw_ficha_sepult.accepttext()
													else
														dw_ficha_sepult.setcolumn('sector_origen')
													end if
												end if
												if dw_ficha_sepult.getitemstring(this.getrow(),'sepultura_origen')=ls_nro_sepultura or &
													isnull(dw_ficha_sepult.getitemstring(this.getrow(),'sepultura_origen')) then
													dw_ficha_sepult.setitem(this.getrow(),'sepultura_origen',ls_nro_sepultura)
												else
													ll_resp	= messagebox("Advertencia","Sepultura Inválida, Contrato IsaCruz Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
													if ll_resp=1 then
														dw_ficha_sepult.setitem(this.getrow(),'sepultura_origen',ls_nro_sepultura)
														dw_ficha_sepult.accepttext()
													else
														dw_ficha_sepult.setcolumn('sepultura_origen')
													end if
												end if
												dw_ficha_sepult.setitem(this.getrow(),'cod_parque_origen',ll_cod_parque)
												dw_ficha_sepult.setitem(this.getrow(),'numero_tecnico_origen',is_nro_tecnico)
												dw_ficha_sepult.setitem(this.getrow(),'capacidad_origen',il_capacidad)
												ls_base_origen		= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'base_origen')
												ls_serie_origen		= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'serie_origen')
												ll_numero_origen	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'numero_origen')
												if ls_base_origen='O' then
													SELECT	"OFERTA_V"."TIPO_CONS"  
													INTO 		:ls_tipo_cons  
													FROM 		"CADENA",   
																"OFERTA_V"  
													WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
															 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
															 (("CADENA"."CODIGO" = :ls_base_origen ) AND  
															 ( "OFERTA_V"."SERIE" = :ls_serie_origen ) AND  
															 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_origen ) )   
													USING		sqlca;
													if sqlca.sqlcode<>0 then
														ls_tipo_cons	= 'T'
													end if
												else
													ls_tipo_cons		= 'T'
												end if
												if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
												if idw_detalle11.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
													idw_detalle11.insertrow(0)
												end if
												dw_ficha_sepult.setitem(this.getrow(),'estado_contrato_origen',ls_estado_ctto)
												if (il_capacidad - ll_count_fall)=0 then
													dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_origen','S')
												else
													dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_origen','N')
												end if
												dw_ficha_sepult.accepttext()
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'rut_titular_origen',ll_rut_titular)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'dv_titular_origen',ls_dv_titular)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'nombre_titular_origen',ls_nom_titular)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'apellido_pat_titular_origen',ls_ap_pat_titular)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'apellido_mat_titular_origen',ls_ap_mat_titular)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'tipo_via_origen_titular',ls_cod_tipo_via)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'direccion_titular_origen',ls_direccion_p)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'nro_direc_titular_origen',ls_nro_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'dpto_direc_titular_origen',ls_depto_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'block_direc_titular_origen',ls_block_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'poblacion_villa_origen',ls_pob_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'sector_titular_origen',ls_sector_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_ciudad_titular_origen',ls_ciudad_part)
												idw_detalle7.retrieve(ls_ciudad_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_comuna_titular_origen',ls_comuna_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fono_titular_origen',ls_fono_part)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato_origen',ldt_fecha_ctto)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'mora_mant_origen',ll_mora_mant)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'mora_cred_origen',0)
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_credito_origen','N')
												if ll_mora_mant>0 then
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_mantencion_origen','S')
												else
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_mantencion_origen','N')
												end if
												tab_1.tabpage_1.dw_ant_fall.enabled			= true
												tab_1.tabpage_4.dw_aranceles.enabled		= true
												dw_ficha_sepult.setfocus()
												dw_ficha_sepult.setcolumn('hora_fijada')
											else
												dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_origen','N')
												dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_destino','N')
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','N')
											end if
										end if
									else
										dw_ficha_sepult.reset()
										idw_detalle10.reset()
										idw_detalle10.insertrow(0)
										idw_detalle11.reset()
										idw_detalle11.insertrow(0)
										idw_detalle12.reset()
										idw_detalle12.insertrow(0)
										ll_new												= dw_ficha_sepult.insertrow(0)
										dw_ficha_sepult.setitem(ll_new,'c_estado','N')
										dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
										dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
										dw_ficha_sepult.setitem(ll_new,'est_uso_firma_digital',1)
										tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'c_estado','N')
										tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'c_estado','N')
										dw_ficha_sepult.setitem(ll_new,'tipo_traslado','I')
										tab_1.tabpage_1.dw_ant_fall.reset()
										tab_1.tabpage_4.dw_aranceles.reset()
										ll_new_reg_fall	= tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
										tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_reg_fall,'c_estadistico',is_usuario_esta)
										tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_reg_fall,'codigo_ejecutivo',gs_user)
										tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_reg_fall,'sw_titular_fall',1)
										tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_reg_fall,'sw_pase_sepultacion',1)
										tab_1.tabpage_4.dw_aranceles.InsertRow(0)
										tab_1.tabpage_1.dw_ant_fall.enabled			= false
										tab_1.tabpage_4.dw_aranceles.enabled		= false
										dw_ficha_sepult.scrolltorow(ll_new)
										dw_ficha_sepult.setfocus()
										dw_ficha_sepult.setcolumn('cod_parque')
									end if
								end if
							else
								SELECT	"ESTADO"."NOMBRE_ESTADO"  
								INTO 		:ls_descrip_estado  
								FROM 		"ESTADO"  
								WHERE 	"ESTADO"."COD_ESTADO" = :ls_est_ctto   ;
								messagebox("Advertencia","Recuerde Contrato Origen "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" Estado Actual es "+ls_descrip_estado+" debe estar V-VIGENTE, C-CANCELADO, A-ANULADO, D-NULO POR DACION, F-FOSA COMUN, N-RESCILIADO o R-RESUELTO, regularice en Depto. Atención Cliente")
								dw_ficha_sepult.setcolumn('sector_origen')
							end if
						else
							messagebox("Advertencia","Contrato Origen "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" No Existe en Control Documentario")
							dw_ficha_sepult.setcolumn('sector_origen')
						end if
					else
						messagebox("Advertencia","Contrato Origen "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" No Tiene Reserva")
						dw_ficha_sepult.setcolumn('sector_origen')
					end if				
				else
					ls_ciu_ori			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(this.getrow(),'cod_ciudad_titular_origen')
					ls_ciu_des			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(this.getrow(),'cod_ciudad_titular_destino')
					if idw_detalle7.retrieve(ls_ciu_ori)=0 then idw_detalle7.insertrow(0)
					if idw_detalle8.retrieve(ls_ciu_des)=0 then idw_detalle8.insertrow(0)
					ll_tot_reg_fall	= tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
					if ll_tot_reg_fall > 0 then
						for ll_indi=1 to ll_tot_reg_fall
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'c_estadistico',is_usuario_esta)
						next
					end if
					
					ll_tot_reg			= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					if ll_tot_reg > 0 then
						for ll_indi=1 to ll_tot_reg
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estadistico',is_usuario_esta)
						next
					end if
					tab_1.tabpage_1.dw_ant_fall.accepttext()
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
					tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
					ls_estado_reg	= dw_ficha_sepult.getitemstring(this.getrow(),'estado_reg')
					if ls_estado_reg='A' then
						messagebox("Advertencia","Ficha Anulada")
						tab_1.tabpage_1.dw_ant_fall.enabled			= false
						tab_1.tabpage_4.dw_aranceles.enabled		= false
						dw_ficha_sepult.enabled							= false
					else
						tab_1.tabpage_1.dw_ant_fall.enabled			= true
						tab_1.tabpage_4.dw_aranceles.enabled		= true
						dw_ficha_sepult.enabled							= true
						il_count_reg	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
						ll_resp			= messagebox("Advertencia","Desea Crear OTRA Ficha de Traslado",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							is_otro												= 'S'
							dw_ficha_sepult.accepttext()
							tab_1.tabpage_1.dw_ant_fall.enabled			= true
							tab_1.tabpage_4.dw_aranceles.enabled		= true
							ls_tipo_traslado	= dw_ficha_sepult.getitemstring(1,'tipo_traslado')
							ls_destino_parque	= dw_ficha_sepult.getitemstring(1,'destino_parque')
							
							ls_cod_ejecutivo 	= dw_ficha_sepult.getitemstring(1,'codigo_ejecutivo')
							ll_cod_parque		= dw_ficha_sepult.getitemnumber(1,'cod_parque')
							ll_capacidad			= dw_ficha_sepult.getitemnumber(1,'capacidad_origen')
							ls_sector				= dw_ficha_sepult.getitemstring(1,'sector_origen')
							ls_sepultura			= dw_ficha_sepult.getitemstring(1,'sepultura_origen')
							ll_hora				= dw_ficha_sepult.getitemnumber(1,'hora_fijada')
							ll_minutos			= dw_ficha_sepult.getitemnumber(1,'minuto_fijada')
							ldt_fecha_sepult	= dw_ficha_sepult.getitemdatetime(1,'fecha_traslado')
							ls_base           		= dw_ficha_sepult.getitemstring(1,'base_origen')
							ls_serie				= dw_ficha_sepult.getitemstring(1,'serie_origen')
							ll_numero         	= dw_ficha_sepult.getitemnumber(1,'numero_origen')
							ldt_fecha_ctto		= dw_ficha_sepult.getitemDateTime(1,'fecha_contrato_origen')
							ls_estado_ctto 		= dw_ficha_sepult.getitemstring(1,'estado_contrato_origen')
							ls_nro_tecnico    	= dw_ficha_sepult.getitemstring(1,'numero_tecnico_origen')
							ldt_fecha_recep	= dw_ficha_sepult.getitemdatetime(1,'fecha_recepcion')
							ll_hora_recep		= dw_ficha_sepult.getitemnumber(1,'hora_recepcion')
							ll_minuto_recep	= dw_ficha_sepult.getitemnumber(1,'minuto_recepcion')
							ll_hora_salida		= dw_ficha_sepult.getitemnumber(1,'hora_salida')
							ll_minu_salida		= dw_ficha_sepult.getitemnumber(1,'minuto_salida')
							ls_vd_estadistico	= dw_ficha_sepult.getitemstring(1,'vb_estadistico')
							
							ll_rut_titular			= dw_ficha_sepult.getitemnumber(1,'rut_titular_origen')
							ls_dv_titular			= dw_ficha_sepult.getitemstring(1,'dv_titular_origen')
							ls_nombre_tit		= dw_ficha_sepult.getitemstring(1,'nombre_titular_origen')
							ls_ap_pat_tit  		= dw_ficha_sepult.getitemstring(1,'apellido_pat_titular_origen')
							ls_ap_mat_tit     	= dw_ficha_sepult.getitemstring(1,'apellido_mat_titular_origen')
							ls_tipo_via_tit		= dw_ficha_sepult.getitemstring(1,'tipo_via_origen_titular')
							ls_direc_tit      		= dw_ficha_sepult.getitemstring(1,'direccion_titular_origen')
							ls_num_dir_tit		= dw_ficha_sepult.getitemstring(1,'nro_direc_titular_origen')
							ls_dpto_dir_tit 		= dw_ficha_sepult.getitemstring(1,'dpto_direc_titular_origen')
							ls_block_dir_tit  	= dw_ficha_sepult.getitemstring(1,'block_direc_titular_origen')
							ls_pob_villa_tit  	= dw_ficha_sepult.getitemstring(1,'poblacion_villa_origen')
							ls_sector_tit			= dw_ficha_sepult.getitemstring(1,'sector_titular_origen')
							ls_cod_ciud_tit		= dw_ficha_sepult.getitemstring(1,'cod_ciudad_titular_origen')
							ls_cod_com_tit    	= dw_ficha_sepult.getitemstring(1,'cod_comuna_titular_origen')
							ls_fono_titular   	= dw_ficha_sepult.getitemstring(1,'fono_titular_origen')
			
							//Destino
							ls_sector_d			= dw_ficha_sepult.getitemstring(1,'sector_destino')
							ls_sepultura_d		= dw_ficha_sepult.getitemstring(1,'sepultura_destino')
							ls_base_d        		= dw_ficha_sepult.getitemstring(1,'base_destino')
							ls_serie_d			= dw_ficha_sepult.getitemstring(1,'serie_destino')
							ll_capacidad_d		= dw_ficha_sepult.getitemnumber(1,'capacidad_destino')
							ll_numero_d        	= dw_ficha_sepult.getitemnumber(1,'numero_destino')
							ldt_fecha_ctto_d	= dw_ficha_sepult.getitemDateTime(1,'fecha_contrato_destino')
							ls_estado_ctto_d	= dw_ficha_sepult.getitemstring(1,'estado_contrato_destino')
							ls_nro_tecnico_d  	= dw_ficha_sepult.getitemstring(1,'numero_tecnico_destino')
							ll_rut_titular_d		= dw_ficha_sepult.getitemnumber(1,'rut_titular_destino')
							ls_dv_titular_d		= dw_ficha_sepult.getitemstring(1,'dv_titular_destino')
							ls_nombre_tit_d	= dw_ficha_sepult.getitemstring(1,'nombre_titular_destino')
							ls_ap_pat_tit_d		= dw_ficha_sepult.getitemstring(1,'apellido_pat_titular_destino')
							ls_ap_mat_tit_d    	= dw_ficha_sepult.getitemstring(1,'apellido_mat_titular_destino')
							ls_tipo_via_tit_d	= dw_ficha_sepult.getitemstring(1,'tipo_via_destino_titular')
							ls_direc_tit_d   		= dw_ficha_sepult.getitemstring(1,'direccion_titular_destino')
							ls_num_dir_tit_d	= dw_ficha_sepult.getitemstring(1,'nro_direc_titular_destino')
							ls_dpto_dir_tit_d	= dw_ficha_sepult.getitemstring(1,'depto_direc_titular_destino')
							ls_block_dir_tit_d 	= dw_ficha_sepult.getitemstring(1,'block_direc_titular_destino')
							ls_pob_villa_tit_d 	= dw_ficha_sepult.getitemstring(1,'poblacion_villa_destino')
							ls_sector_tit_d		= dw_ficha_sepult.getitemstring(1,'sector_titular_destino')
							ls_cod_ciud_tit_d	= dw_ficha_sepult.getitemstring(1,'cod_ciudad_titular_destino')
							ls_cod_com_tit_d  	= dw_ficha_sepult.getitemstring(1,'cod_comuna_titular_destino')
							ls_fono_titular_d  	= dw_ficha_sepult.getitemstring(1,'fono_titular_destino')
			
			
							ll_new_titular		= dw_ficha_sepult.insertrow(0)
							dw_ficha_sepult.scrolltorow(ll_new_titular)
							dw_ficha_sepult.setitem(ll_new_titular,'tipo_traslado',ls_tipo_traslado)
							dw_ficha_sepult.setitem(ll_new_titular,'destino_parque',ls_destino_parque)
							dw_ficha_sepult.setitem(ll_new_titular,'c_estadistico',is_usuario_esta)
							dw_ficha_sepult.setitem(ll_new_titular,'capacidad_origen',ll_capacidad)
							dw_ficha_sepult.setitem(ll_new_titular,'tipo_traslado',0)
							dw_ficha_sepult.setitem(ll_new_titular,'rut_titular_origen',ll_rut_titular)
							dw_ficha_sepult.setitem(ll_new_titular,'dv_titular_origen',ls_dv_titular)
							dw_ficha_sepult.setitem(ll_new_titular,'nombre_titular_origen',ls_nombre_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'apellido_pat_titular_origen',ls_ap_pat_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'apellido_mat_titular_origen',ls_ap_mat_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'tipo_via_origen_titular',ls_tipo_via_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'direccion_titular_origen',ls_direc_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'nro_direc_titular_origen',ls_num_dir_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'dpto_direc_titular_origen',ls_dpto_dir_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'block_direc_titular_origen',ls_block_dir_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'poblacion_villa_origen',ls_pob_villa_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'sector_titular_origen',ls_sector_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'cod_ciudad_titular_origen',ls_cod_ciud_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'cod_comuna_titular_origen',ls_cod_com_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'fono_titular_origen',ls_fono_titular)
							dw_ficha_sepult.setitem(ll_new_titular,'folio',dw_ficha_sepult.rowcount())
							dw_ficha_sepult.setitem(ll_new_titular,'cod_parque',ll_cod_parque)
							dw_ficha_sepult.setitem(ll_new_titular,'sector_origen',ls_sector)
							dw_ficha_sepult.setitem(ll_new_titular,'sepultura_origen',ls_sepultura)
							dw_ficha_sepult.setitem(ll_new_titular,'fecha_traslado',ldt_fecha_sepult)
							dw_ficha_sepult.setitem(ll_new_titular,'sw_dato_funeraria',1)
							dw_ficha_sepult.setitem(ll_new_titular,'est_uso_firma_digital',1)
							
							dw_ficha_sepult.setitem(ll_new_titular,'sector_destino',ls_sector_d)
							dw_ficha_sepult.setitem(ll_new_titular,'sepultura_destino',ls_sepultura_d)
							dw_ficha_sepult.setitem(ll_new_titular,'base_destino',ls_base_d)
							dw_ficha_sepult.setitem(ll_new_titular,'serie_destino',ls_serie_d)
							dw_ficha_sepult.setitem(ll_new_titular,'capacidad_destino',ll_capacidad_d)
							dw_ficha_sepult.setitem(ll_new_titular,'numero_destino',ll_numero_d)
							dw_ficha_sepult.setitem(ll_new_titular,'fecha_contrato_destino',ldt_fecha_ctto_d)
							dw_ficha_sepult.setitem(ll_new_titular,'estado_contrato_destino',ls_estado_ctto_d)
							dw_ficha_sepult.setitem(ll_new_titular,'numero_tecnico_destino',ls_nro_tecnico_d)
							dw_ficha_sepult.setitem(ll_new_titular,'rut_titular_destino',ll_rut_titular_d)
							dw_ficha_sepult.setitem(ll_new_titular,'dv_titular_destino',ls_dv_titular_d)
							dw_ficha_sepult.setitem(ll_new_titular,'nombre_titular_destino',ls_nombre_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'apellido_pat_titular_destino',ls_ap_pat_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'apellido_mat_titular_destino',ls_ap_mat_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'tipo_via_destino_titular',ls_tipo_via_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'direccion_titular_destino',ls_direc_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'nro_direc_titular_destino',ls_num_dir_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'depto_direc_titular_destino',ls_dpto_dir_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'block_direc_titular_destino',ls_block_dir_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'poblacion_villa_destino',ls_pob_villa_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'sector_titular_destino',ls_sector_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'cod_ciudad_titular_destino',ls_cod_ciud_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'cod_comuna_titular_destino',ls_cod_com_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'fono_titular_destino',ls_fono_titular_d)
							dw_ficha_sepult.setitem(ll_new_titular,'cod_parque_destino',ll_cod_parque)
							dw_ficha_sepult.scrolltorow(ll_new_titular)
							
							if ls_base_d='O' then
								SELECT	"OFERTA_V"."TIPO_CONS"  
								INTO 		:ls_tipo_cons  
								FROM 		"CADENA",   
											"OFERTA_V"  
								WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
										 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
										 (("CADENA"."CODIGO" = :ls_base_d ) AND  
										 ( "OFERTA_V"."SERIE" = :ls_serie_d ) AND  
										 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_d ) )   
								USING		sqlca;
								if sqlca.sqlcode<>0 then
									ls_tipo_cons	= "T"
								end if
							else
								ls_tipo_cons		= "T"
							end if
							if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = "T"
							if idw_detalle12.retrieve(ll_capacidad_d,ll_cod_parque,ls_tipo_cons)=0 then
								idw_detalle12.insertrow(0)
							end if
							
							
							if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
							if idw_detalle11.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
								idw_detalle11.insertrow(0)
							end if
							dw_ficha_sepult.accepttext()
							ll_new_fall		= tab_1.tabpage_1.dw_ant_fall.insertrow(0)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'folio',tab_1.tabpage_1.dw_ant_fall.rowcount())
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'cod_parque',ll_cod_parque)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sector_origen',ls_sector)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sepultura_origen',ls_sepultura)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'fecha_traslado',ldt_fecha_sepult)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_titular_fall',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_pase_sepultacion',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_dato_funeraria',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_condolencia',1)
							tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_new_fall)
			
							ll_new_ara		= tab_1.tabpage_4.dw_aranceles.insertrow(0)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'folio',tab_1.tabpage_4.dw_aranceles.rowcount())
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'cod_parque',ll_cod_parque)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'sector_origen',ls_sector)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'sepultura_origen',ls_sepultura)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'fecha_traslado',ldt_fecha_sepult)
							tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_new_ara)
			
//							ll_new			= tab_1.tabpage_3.dw_ficha_sepult.insertrow(0)
							tab_1.tabpage_3.dw_ficha_sepult.setfocus()
							ll_count_fila_fs	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
							tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_new_titular)
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora_fijada')
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'sw_dato_funeraria',1)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'est_uso_firma_digital',1)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'c_estado','S')
							if tab_1.tabpage_1.dw_ant_fall.getitemnumber(ll_new_fall,'rut_fallecido') > 0 then
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'c_estado','S')
							else
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'c_estado','N')
							end if
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'c_estado','S')
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'c_estadistico',is_usuario_esta)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'codigo_ejecutivo',gs_user)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'fecha_traslado',ldt_fecha_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'sector_origen',ls_sector)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'sepultura_origen',ls_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'cod_parque',ll_cod_parque)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'hora_fijada',ll_hora)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'minuto_fijada',ll_minutos)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'folio',tab_1.tabpage_3.dw_ficha_sepult.rowcount())
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'base_origen',ls_base)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'serie_origen',ls_serie)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'numero_origen',ll_numero)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'fecha_contrato_origen',ldt_fecha_ctto)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'estado_contrato_origen',ls_estado_ctto)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'numero_tecnico_origen',ls_nro_tecnico)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'fecha_recepcion',ldt_fecha_recep)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'hora_recepcion',ll_hora_recep)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'minuto_recepcion',ll_minuto_recep)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'hora_salida',ll_hora_salida)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'minuto_salida',ll_minu_salida)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'vb_estadistico',ls_vd_estadistico)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							il_count_otro	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
							tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_new_titular)
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora_fijada')
						else
							for ll_indi=1 to il_count_reg
								tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estado','S')
								tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estadistico',is_usuario_esta)
								if tab_1.tabpage_1.dw_ant_fall.getitemnumber(ll_indi,'rut_fallecido')>0 then
									tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'c_estado','S')
								else
									tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'c_estado','N')
								end if
								tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'c_estado','S')
							next
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							tab_1.tabpage_1.dw_ant_fall.enabled			= true
							tab_1.tabpage_4.dw_aranceles.enabled		= true
						end if
						
						tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora_fijada')
						tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_new_titular)
						tab_1.tabpage_3.dw_ficha_sepult.setfocus()
					end if
				end if
			end if
			if not isnull(ll_cod_parque) and not isnull(ls_sector) and not isnull(ldt_fecha_sepult) then	//not isnull(ls_sepultura)
				SELECT 	  Count("FOSA_COMUN"."AREA")
				INTO 		  :ll_count_fosa  
				FROM 	  "FOSA_COMUN"  
				WHERE 	( "FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque ) AND  
							( "FOSA_COMUN"."SECTOR" = :ls_sector )  AND ( "FOSA_COMUN"."SEPULTURA" = :ls_sepultura )  ;

				if ll_count_fosa > 0 then
					ls_string	= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura
					if isvalid(w_lista_fosa_comun_para_fs) then close(w_lista_fosa_comun_para_fs)
					if isnull(gl_llave_fallecido_fc) then
						openwithparm(w_lista_fosa_comun_para_fs,ls_string)
					else
						f_cargar_fallecido_fc_ficha()
					end if
					//openwithparm(w_lista_fosa_comun_para_fs,ls_string)
				end if
			end if
			
		else
			messagebox("Advertencia","No Existe Reserva para Sector: "+ls_sector+"  Sepultura: "+ls_sepultura)
		end if
	end if		
	if ls_columna='cod_parque' then 
		if ll_cod_parque>0 then
			idw_detalle3.retrieve(ll_cod_parque)
			idw_detalle4.retrieve(ll_cod_parque)
		end if
	end if
	if ls_columna='sector_original' then
		if ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' then 
			idw_detalle5.retrieve(ll_cod_parque,ls_sector)
		end if
	end if
end if
if ls_columna='base_origen' or ls_columna='serie_origen' or ls_columna='numero_origen' then
	wf_validar_ctto(ls_columna)
end if
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
if ls_columna='base_destino' or ls_columna='serie_destino' or ls_columna='numero_destino' then
	wf_valida_destino()
end if
if ls_columna='nivel_sepultura_destino' then
	wf_validar_nivel(ls_columna)
end if
if ls_columna='tipo_traslado' then
	ls_tipo_traslado	= string(data)
	if ls_tipo_traslado='E' then
		tab_1.tabpage_4.dw_aranceles.setitem(dw_ficha_sepult.getrow(),'otros_pagos_destino',0)
		tab_1.tabpage_3.dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'destino_parque','S')
	else
		tab_1.tabpage_3.dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'destino_parque',ls_nulo)
	end if
	tab_1.tabpage_4.dw_aranceles.setitem(dw_ficha_sepult.getrow(),'tipo_traslado',ls_tipo_traslado)
	tab_1.tabpage_4.dw_aranceles.accepttext()
end if
if ls_columna='capacidad_origen' then
	ll_capacidad		= dw_ficha_sepult.getitemnumber(this.getrow(),'capacidad_origen')
	ll_cod_parque_ori	= dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque_origen')
	SELECT	Count("LISTA_PRECIO"."SECTOR")  
	INTO 		:ll_count_cap  
	FROM 		"LISTA_PRECIO"  
	WHERE 	"LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad AND
				"LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque_ori
	USING		sqlca;
	if ll_count_cap=0 then
		messagebox("Advertencia","Capacidad NO Registrada")
		dw_ficha_sepult.setitem(this.getrow(),'capacidad_origen',ll_nulo)
	end if
	dw_ficha_sepult.setitem(this.getrow(),'nivel_sepultura_origen',ls_nulo)
	ls_base_origen		= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'base_origen')
	ls_serie_origen		= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'serie_origen')
	ll_numero_origen	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'numero_origen')
	if ls_base_origen='O' then
		SELECT	"OFERTA_V"."TIPO_CONS"  
		INTO 		:ls_tipo_cons  
		FROM 		"CADENA",   
					"OFERTA_V"  
		WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 (("CADENA"."CODIGO" = :ls_base_origen ) AND  
				 ( "OFERTA_V"."SERIE" = :ls_serie_origen ) AND  
				 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_origen ) )   
		USING		sqlca;
		if sqlca.sqlcode<>0 then
			ls_tipo_cons	= 'T'
		end if
	else
		ls_tipo_cons		= 'T'
	end if
	if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
	if idw_detalle11.retrieve(ll_capacidad,ll_cod_parque_ori,ls_tipo_cons)=0 then
		idw_detalle11.insertrow(0)
	end if
	dw_ficha_sepult.accepttext()
end if

if ls_columna='capacidad_destino' then
	ll_capacidad			= dw_ficha_sepult.getitemnumber(this.getrow(),'capacidad_destino')
	ll_cod_parque_des	= dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque_destino')
	SELECT	Count("LISTA_PRECIO"."SECTOR")  
	INTO 		:ll_count_cap  
	FROM 	"LISTA_PRECIO"  
	WHERE 	"LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad AND
				"LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque_des
	USING		sqlca;
	if ll_count_cap=0 then
		messagebox("Advertencia","Capacidad NO Registrada")
		dw_ficha_sepult.setitem(this.getrow(),'capacidad_destino',ll_nulo)
	end if
	dw_ficha_sepult.setitem(this.getrow(),'nivel_sepultura_destino',ls_nulo)
	ls_base_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(this.getrow(),'base_destino')
	ls_serie_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(this.getrow(),'serie_destino')
	ll_numero_destino	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(this.getrow(),'numero_destino')
	if ls_base_destino='O' then
		SELECT	"OFERTA_V"."TIPO_CONS"  
		INTO 		:ls_tipo_cons  
		FROM 		"CADENA",   
					"OFERTA_V"  
		WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 (("CADENA"."CODIGO" = :ls_base_destino ) AND  
				 ( "OFERTA_V"."SERIE" = :ls_serie_destino ) AND  
				 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_destino ) )   
		USING		sqlca;
		if sqlca.sqlcode<>0 then
			ls_tipo_cons	= 'T'
		end if
	else
		ls_tipo_cons		= 'T'
	end if
	if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = "T"
	if idw_detalle12.retrieve( ll_capacidad, ll_cod_parque_des, ls_tipo_cons ) = 0 then
		idw_detalle12.insertrow(0)
	end if
	dw_ficha_sepult.accepttext()
end if
if ls_columna='destino_parque' then
	is_destino_parque	= string(data)
	wf_destino_parque(ls_columna)
end if
if ls_columna='tipo_traslado' then
	ll_fila					= tab_1.tabpage_3.dw_ficha_sepult.getrow()
	ls_tipo_traslado	= string(data)
	wf_tipo_traslado(ls_tipo_traslado,ll_fila)
	
end if
if ls_columna='tipo_traslado' or ls_columna='destino_parque' then
	if ls_columna='tipo_traslado' then
		ls_tipo_traslado	= string(data)
		ls_destino_parque	= this.getitemstring(this.getrow(),'destino_parque')
	elseif ls_columna='destino_parque' then
		ls_destino_parque	= string(data)
		ls_tipo_traslado	= this.getitemstring(this.getrow(),'tipo_traslado')
	end if
	ls_estado_ctto_ori		= this.getitemstring(this.getrow(),'estado_ctto_fosa')
	if ls_estado_ctto_ori <> 'F' then
		cb_carta.enabled	= true
		cb_lapida.enabled	= true
	elseif ls_estado_ctto_ori='F' and ls_tipo_traslado='I' then
		cb_carta.enabled	= true
		cb_lapida.enabled	= true
	elseif ls_estado_ctto_ori='F' and ls_tipo_traslado='E' then
		cb_carta.enabled	= false
		cb_lapida.enabled	= false
	end if
	if not isnull(ls_tipo_traslado) and not isnull(ls_destino_parque) then
		if ls_tipo_traslado='E' and ls_destino_parque='S' then
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'tipo_traslado',ls_tipo_traslado)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'destino_parque',ls_destino_parque)
			tab_1.tabpage_4.dw_aranceles.accepttext()
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d1',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)

			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d1',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d2',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d3',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d4',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d5',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_d6',0)
			tab_1.tabpage_4.dw_aranceles.accepttext()
			this.accepttext()
			tab_1.tabpage_4.dw_aranceles.setcolumn('pago_otro_1')
			wf_calculo_monto()
		end if
	end if
end if
this.accepttext()
end event

event clicked;String		ls_estado,ls_columna,ls_fecha,ls_sector,ls_sepultura,ls_ejecutivo,ls_obs,ls_nombre,ls_ap_pat,	ls_ap_mat,ls_string,ls_vb,ls_base,ls_serie,ls_sector_sepult,ls_nro_sepultura,ls_estado_ctto,&
			ls_nro_tecnico,ls_dv_titular,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,ls_cod_tipo_via,ls_direccion_p,ls_nro_part,ls_depto_part,ls_block_part,ls_pob_part,ls_sector_part,ls_comuna_part,&
			ls_ciudad_part,ls_fono_part,ls_parque,ls_cod_ejecutivo,ls_vd_estadistico,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_tipo_via_tit,ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,&
			ls_pob_villa_tit,ls_sector_tit,ls_cod_ciud_tit,ls_cod_com_tit,ls_fono_titular,ls_tipo_traslado,ls_estado_reg,ls_tipo_tras,ls_destino,ls_estado_fosa,ls_tipo_cons,ls_destino_parque,&
			ls_sector_d,ls_sepultura_d,ls_base_d,ls_serie_d,ls_estado_ctto_d,ls_nro_tecnico_d,ls_dv_titular_d,ls_nombre_tit_d,ls_ap_pat_tit_d,ls_ap_mat_tit_d,ls_tipo_via_tit_d,ls_direc_tit_d,&
			ls_dpto_dir_tit_d,ls_block_dir_tit_d,ls_pob_villa_tit_d,ls_sector_tit_d,ls_cod_ciud_tit_d,ls_cod_com_tit_d,ls_fono_titular_d,ls_num_dir_tit_d

Long		ll_cod_parque,ll_max,ll_new,ll_resp,ll_hora_hoy,ll_minutos_hoy,ll_count_fall,ll_capacidad,ll_mora_cred,ll_mora_mant,ll_rut_titular,ll_hora,ll_minutos,ll_hora_recep,ll_minuto_recep,&
			ll_hora_salida,ll_minu_salida,ll_new_titular,ll_new_fall,ll_new_ara,ll_hora_fijada,ll_minuto_fijado,ll_cod_parque_ori,ll_new_reg_fall,ll_row,ll_count_fosa,ll_count_fila_fs,ll_rut_titular_d,&
			ll_capacidad_d
datetime	ldt_fecha_sepult,ldt_fecha_hoy,ldt_fecha_ctto,ldt_fecha_recep,ldt_fecha_ctto_d
Double	ll_numero,ll_numero_d


this.accepttext()
is_otro							= 'N'
ll_row								= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
ls_estado						= this.getitemstring(1,'c_estado')
ls_estado_reg					= this.getitemstring(this.getrow(),'estado_reg')
ls_columna						= dwo.name
if (ls_estado_reg<>'G' and ls_estado_reg<>'A') or isnull(ls_estado_reg) then
//if ls_estado_reg='G' then Solo para Prueba
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
			ls_sector				= this.getitemstring(this.getrow(),'sector_origen')
			ls_sepultura			= this.getitemstring(this.getrow(),'sepultura_origen')
			ll_cod_parque_ori	= this.getitemnumber(this.getrow(),'cod_parque_origen')
			ls_estado_fosa		= this.getitemstring(this.getrow(),'estado_ctto_fosa')
			
			if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and not isnull(ls_sepultura) and ls_sepultura<>'' then	//and ll_cod_parque_ori>0
				ls_fecha			= string(date(dw_ficha_sepult.getitemdatetime(1,'fecha_traslado')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha) = -1 then 
					dw_ficha_sepult.setitem(1,'fecha_traslado',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha			= trim(Message.StringParm)
					dw_ficha_sepult.setitem(1,'fecha_traslado',date(ls_fecha))
				END IF
				
				ldt_fecha_sepult	= this.getitemdatetime(this.getrow(),'fecha_traslado')
				ls_tipo_traslado	= this.getitemString(this.getrow(),'tipo_traslado')
				if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
					not isnull(ls_sepultura) and ls_sepultura<>'' and not isnull(ldt_fecha_sepult) then
					if dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)=0 then
						ll_new		= dw_ficha_sepult.insertrow(0)
						if not isnull(gl_llave_fallecido_fc) and gl_llave_fallecido_fc <> 0 then
							f_cargar_fallecido_fc_ficha()
						end if
						dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
						dw_ficha_sepult.setitem(ll_new,'cod_parque',ll_cod_parque)
						dw_ficha_sepult.setitem(ll_new,'sector_origen',ls_sector)
						dw_ficha_sepult.setitem(ll_new,'sepultura_origen',ls_sepultura)
						dw_ficha_sepult.setitem(ll_new,'fecha_traslado',ldt_fecha_sepult)
						dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
						dw_ficha_sepult.setitem(ll_new,'tipo_traslado',ls_tipo_traslado)	
						dw_ficha_sepult.setitem(ll_new,'estado_ctto_fosa',ls_estado_fosa)
						dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
						dw_ficha_sepult.setitem(ll_new,'est_uso_firma_digital',1)
						ll_resp												= messagebox("Advertencia","No Existe Ficha de Traslado, desea Ingresarla",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_1.dw_ant_fall.enabled		= true
							tab_1.tabpage_4.dw_aranceles.enabled	= true
							dw_ficha_sepult.enabled						= true
							dw_ficha_sepult.accepttext()
							SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
							ldt_fecha_hoy									= datetime(date(gdt_fec_sistema),time('00:00:00'))
							ll_hora_hoy										= long(string(gdt_fec_sistema,'hh'))
							ll_minutos_hoy									= long(string(gdt_fec_sistema,'mm'))
							dw_ficha_sepult.setitem(ll_new,'fecha_recepcion',ldt_fecha_hoy)
							dw_ficha_sepult.setitem(ll_new,'hora_recepcion',ll_hora_hoy)
							dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',ll_minutos_hoy)
							dw_ficha_sepult.setitem(ll_new,'c_estado','S')
							if tab_1.tabpage_1.dw_ant_fall.getitemnumber(ll_new,'rut_fallecido')>0 then
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'c_estado','S')
							else
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'c_estado','N')
							end if
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'sw_titular_fall',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'sw_pase_sepultacion',1)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'c_estado','S')
							dw_ficha_sepult.setitem(ll_new,'folio',1)
							dw_ficha_sepult.setitem(ll_new,'hora_fijada',0)
							dw_ficha_sepult.setitem(ll_new,'minuto_fijada',0)
							dw_ficha_sepult.setitem(ll_new,'hora_salida',0)
							dw_ficha_sepult.setitem(ll_new,'minuto_salida',0)
							dw_ficha_sepult.setitem(ll_new,'hora_recepcion',0)
							dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',0)
							SELECT	"INVENTARIO_PLANI"."BASE",   
										"INVENTARIO_PLANI"."SERIE",   
										"INVENTARIO_PLANI"."NUMERO",
										"INVENTARIO_PLANI"."NUMERO_TEC",
										"INVENTARIO_PLANI"."CAPACIDAD"
							INTO 		:ls_base,   
										:ls_serie,   
										:ll_numero,
										:is_nro_tecnico,
										:il_capacidad
							FROM 		"INVENTARIO_PLANI"  
							WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
									 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
									 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) 
							USING		sqlca;
							if sqlca.sqlcode=0 then
								SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO",	"RESERVA_SEPULTURA"."CAPACIDAD"  
								INTO 		:ls_base,							:ls_serie,							:ll_numero,							:il_capacidad
								FROM 		"RESERVA_SEPULTURA"  
								WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
										 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
										 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
										 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) AND  
										 ( "RESERVA_SEPULTURA"."FOLIO_RESERVA" = ( 	SELECT MAX("RESERVA_SEPULTURA"."FOLIO_RESERVA") 
																									FROM 		"RESERVA_SEPULTURA" 
																									WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND 
																											 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
																											 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND 
																											 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) ) )   
								USING		sqlca;
								dw_ficha_sepult.setitem(ll_new,'base_origen',ls_base)
								dw_ficha_sepult.setitem(ll_new,'serie_origen',ls_serie)
								dw_ficha_sepult.setitem(ll_new,'numero_origen',ll_numero)
								dw_ficha_sepult.setitem(ll_new,'cod_parque_origen',ll_cod_parque)
								dw_ficha_sepult.setitem(ll_new,'capacidad_origen',il_capacidad)
								SELECT	COUNT("FALLECIDOS"."LLAVE")  
								INTO 		:ll_count_fall  
								FROM 		"FALLECIDOS"  
								WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
										 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
										 ( "FALLECIDOS"."CONTRATO" = :ll_numero ) AND
										 ( "FALLECIDOS"."EST" = 'CC' )  AND
										( "FALLECIDOS"."ESTADO_REG" = 'A' );
								if isnull(ll_count_fall) then ll_count_fall=0
								if ls_base='O' then
									SELECT	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA",	"OFERTA_V"."TIPO_CONS"  
									INTO 		:ls_sector_sepult,		:ls_nro_sepultura,			:ll_cod_parque,			:ls_estado_ctto,		:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto,		:ls_tipo_cons
									FROM 		"CADENA",   "CADENA_MORA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
									WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
											 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
											 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
											 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
											 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
											 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
											 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
											 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
											 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
											 (("CADENA"."CODIGO" = 'O' ) AND  
											 ( "CADENA"."SERIE" = :ls_serie ) AND  
											 ( "CADENA"."NUMERO" = :ll_numero ) )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										if isnull(ls_estado_ctto) or ls_estado_ctto='' then ls_estado_ctto='E'
										if dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')=ll_cod_parque then
											dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
										else
											SELECT 	"COD_PARQ"."NOMBRE"  
											INTO 		:ls_parque  
											FROM 	"COD_PARQ"  
											WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
											USING	sqlca;	
											ll_resp	= messagebox("Advertencia","Parque Inválido, Promesa Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
											if ll_resp=1 then
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
												dw_ficha_sepult.accepttext()
											else
												dw_ficha_sepult.setcolumn('cod_parque')
											end if
										end if
										if dw_ficha_sepult.getitemstring(this.getrow(),'sector_origen')=ls_sector_sepult then
											dw_ficha_sepult.setitem(this.getrow(),'sector_origen',ls_sector_sepult)
										else
											ll_resp	= messagebox("Advertencia","Sector Inválido, Promesa Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
											if ll_resp=1 then
												dw_ficha_sepult.setitem(this.getrow(),'sector_origen',ls_sector_sepult)
												dw_ficha_sepult.accepttext()
											else
												dw_ficha_sepult.setcolumn('sector_origen')
											end if
										end if
										if dw_ficha_sepult.getitemstring(this.getrow(),'sepultura_origen')=ls_nro_sepultura then
											dw_ficha_sepult.setitem(this.getrow(),'sepultura_origen',ls_nro_sepultura)
										else
											ll_resp	= messagebox("Advertencia","Sepultura Inválida, Promesa Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
											if ll_resp=1 then
												dw_ficha_sepult.setitem(this.getrow(),'sepultura_origen',ls_nro_sepultura)
												dw_ficha_sepult.accepttext()
											else
												dw_ficha_sepult.setcolumn('sepultura_origen')
											end if
										end if
										dw_ficha_sepult.setitem(this.getrow(),'numero_tecnico_origen',is_nro_tecnico)
										dw_ficha_sepult.setitem(this.getrow(),'capacidad_origen',il_capacidad)
										dw_ficha_sepult.setitem(this.getrow(),'estado_contrato_origen',ls_estado_ctto)
										if (il_capacidad - ll_count_fall)=0 then
											dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_origen','S')
										else
											dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_origen','N')
										end if
										dw_ficha_sepult.accepttext()
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'rut_titular_origen',ll_rut_titular)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'dv_titular_origen',ls_dv_titular)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'nombre_titular_origen',ls_nom_titular)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'apellido_pat_titular_origen',ls_ap_pat_titular)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'apellido_mat_titular_origen',ls_ap_mat_titular)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'tipo_via_origen_titular',ls_cod_tipo_via)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'direccion_titular_origen',ls_direccion_p)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'nro_direc_titular_origen',ls_nro_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'dpto_direc_titular_origen',ls_depto_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'block_direc_titular_origen',ls_block_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'poblacion_villa_origen',ls_pob_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'sector_titular_origen',ls_sector_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_ciudad_titular_origen',ls_ciudad_part)
										idw_detalle7.retrieve(ls_ciudad_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_comuna_titular_origen',ls_comuna_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fono_titular_origen',ls_fono_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato_origen',ldt_fecha_ctto)
									end if
									if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
									if idw_detalle11.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
										idw_detalle11.insertrow(0)
									end if
								elseif ls_base='C' then
									SELECT	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."FECHA"  
									INTO 		:ls_estado_ctto,		:ll_cod_parque,			:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part  ,		:ls_sector_sepult,	:ls_nro_sepultura,		:ldt_fecha_ctto			
									FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
									WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
											 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
											 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
											 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
											 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
											 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
											 (("CADENA"."CODIGO" = 'C' ) AND  
											 ( "CADENA"."SERIE" = :ls_serie ) AND  
											 ( "CADENA"."NUMERO" = :ll_numero ) )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										if isnull(ls_estado_ctto) or ls_estado_ctto='' then ls_estado_ctto='E'
										if dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')=ll_cod_parque then
											dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
										else
											SELECT 	"COD_PARQ"."NOMBRE"  
											INTO 		:ls_parque  
											FROM 	"COD_PARQ"  
											WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
											USING	sqlca;	
											ll_resp	= messagebox("Advertencia","Parque Inválido, Contrato IsaCruz Registra "+ls_parque+", desea Cambiar dato",Exclamation!,YesNo!,2)
											if ll_resp=1 then
												dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_parque',ll_cod_parque)
												dw_ficha_sepult.accepttext()
											else
												dw_ficha_sepult.setcolumn('cod_parque')
											end if
										end if
										if dw_ficha_sepult.getitemstring(this.getrow(),'sector_origen')=ls_sector_sepult then
											dw_ficha_sepult.setitem(this.getrow(),'sector_origen',ls_sector_sepult)
										else
											ll_resp	= messagebox("Advertencia","Sector Inválido, Contrato IsaCruz Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
											if ll_resp=1 then
												dw_ficha_sepult.setitem(this.getrow(),'sector_origen',ls_sector_sepult)
												dw_ficha_sepult.accepttext()
											else
												dw_ficha_sepult.setcolumn('sector_origen')
											end if
										end if
										if dw_ficha_sepult.getitemstring(this.getrow(),'sepultura_origen')=ls_nro_sepultura then
											dw_ficha_sepult.setitem(this.getrow(),'sepultura_origen',ls_nro_sepultura)
										else
											ll_resp	= messagebox("Advertencia","Sepultura Inválida, Contrato IsaCruz Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
											if ll_resp=1 then
												dw_ficha_sepult.setitem(this.getrow(),'sepultura_origen',ls_nro_sepultura)
												dw_ficha_sepult.accepttext()
											else
												dw_ficha_sepult.setcolumn('sepultura_origen')
											end if
										end if
										dw_ficha_sepult.setitem(this.getrow(),'numero_tecnico_origen',is_nro_tecnico)
										dw_ficha_sepult.setitem(this.getrow(),'capacidad_origen',il_capacidad)
										dw_ficha_sepult.setitem(this.getrow(),'estado_contrato_origen',ls_estado_ctto)
										if (il_capacidad - ll_count_fall)=0 then
											dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_origen','S')
										else
											dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_origen','N')
										end if
										dw_ficha_sepult.accepttext()
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'rut_titular_origen',ll_rut_titular)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'dv_titular_origen',ls_dv_titular)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'nombre_titular_origen',ls_nom_titular)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'apellido_pat_titular_origen',ls_ap_pat_titular)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'apellido_mat_titular_origen',ls_ap_mat_titular)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'tipo_via_origen_titular',ls_cod_tipo_via)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'direccion_titular_origen',ls_direccion_p)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'nro_direc_titular_origen',ls_nro_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'dpto_direc_titular_origen',ls_depto_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'block_direc_titular_origen',ls_block_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'poblacion_villa_origen',ls_pob_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'sector_titular_origen',ls_sector_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_ciudad_titular_origen',ls_ciudad_part)
										idw_detalle7.retrieve(ls_ciudad_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_comuna_titular_origen',ls_comuna_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fono_titular_origen',ls_fono_part)
										dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato_origen',ldt_fecha_ctto)
									end if
								end if
							end if
			//				tab_1.tabpage_2.dw_ant_titular.enabled		= true
							tab_1.tabpage_1.dw_ant_fall.enabled			= true
							tab_1.tabpage_4.dw_aranceles.enabled		= true
							dw_ficha_sepult.setfocus()
							dw_ficha_sepult.setcolumn('hora_fijada')
							if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
							if idw_detalle11.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
								idw_detalle11.insertrow(0)
							end if
						else
							dw_ficha_sepult.reset()
							ll_new												= dw_ficha_sepult.insertrow(0)
							dw_ficha_sepult.setitem(ll_new,'c_estado','N')
							dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
							dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
							dw_ficha_sepult.setitem(ll_new,'est_uso_firma_digital',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'c_estado','N')
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'c_estado','N')
							dw_ficha_sepult.scrolltorow(ll_new)
							dw_ficha_sepult.setfocus()
							dw_ficha_sepult.setcolumn('cod_parque')
							tab_1.tabpage_1.dw_ant_fall.reset()
							tab_1.tabpage_4.dw_aranceles.reset()
							ll_new_reg_fall									= tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_reg_fall,'codigo_ejecutivo',gs_user)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_reg_fall,'sw_titular_fall',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_reg_fall,'sw_pase_sepultacion',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_reg_fall,'sw_dato_funeraria',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_reg_fall,'sw_condolencia',1)
							tab_1.tabpage_4.dw_aranceles.InsertRow(0)
							tab_1.tabpage_1.dw_ant_fall.enabled			= false
							tab_1.tabpage_4.dw_aranceles.enabled		= false
						end if
					else
						tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
						tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
						
						il_count_reg	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
						ll_resp		= messagebox("Advertencia","Desea Crear OTRA Ficha de Traslado",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							is_otro												= 'S'
							dw_ficha_sepult.accepttext()
							tab_1.tabpage_1.dw_ant_fall.enabled			= true
							tab_1.tabpage_4.dw_aranceles.enabled		= true
							ls_tipo_traslado	= dw_ficha_sepult.getitemstring(1,'tipo_traslado')
							ls_destino_parque	= dw_ficha_sepult.getitemstring(1,'destino_parque')
							
							ls_cod_ejecutivo 	= dw_ficha_sepult.getitemstring(1,'codigo_ejecutivo')
							ll_cod_parque		= dw_ficha_sepult.getitemnumber(1,'cod_parque')
							ll_capacidad			= dw_ficha_sepult.getitemnumber(1,'capacidad_origen')
							ls_sector				= dw_ficha_sepult.getitemstring(1,'sector_origen')
							ls_sepultura			= dw_ficha_sepult.getitemstring(1,'sepultura_origen')
							ll_hora				= dw_ficha_sepult.getitemnumber(1,'hora_fijada')
							ll_minutos			= dw_ficha_sepult.getitemnumber(1,'minuto_fijada')
							ldt_fecha_sepult	= dw_ficha_sepult.getitemdatetime(1,'fecha_traslado')
							ls_base           		= dw_ficha_sepult.getitemstring(1,'base_origen')
							ls_serie				= dw_ficha_sepult.getitemstring(1,'serie_origen')
							ll_numero         	= dw_ficha_sepult.getitemnumber(1,'numero_origen')
							ldt_fecha_ctto		= dw_ficha_sepult.getitemDateTime(1,'fecha_contrato_origen')
							ls_estado_ctto 		= dw_ficha_sepult.getitemstring(1,'estado_contrato_origen')
							ls_nro_tecnico    	= dw_ficha_sepult.getitemstring(1,'numero_tecnico_origen')
							ldt_fecha_recep	= dw_ficha_sepult.getitemdatetime(1,'fecha_recepcion')
							ll_hora_recep		= dw_ficha_sepult.getitemnumber(1,'hora_recepcion')
							ll_minuto_recep	= dw_ficha_sepult.getitemnumber(1,'minuto_recepcion')
							ll_hora_salida		= dw_ficha_sepult.getitemnumber(1,'hora_salida')
							ll_minu_salida		= dw_ficha_sepult.getitemnumber(1,'minuto_salida')
							ls_vd_estadistico	= dw_ficha_sepult.getitemstring(1,'vb_estadistico')
							
							ll_rut_titular			= dw_ficha_sepult.getitemnumber(1,'rut_titular_origen')
							ls_dv_titular			= dw_ficha_sepult.getitemstring(1,'dv_titular_origen')
							ls_nombre_tit		= dw_ficha_sepult.getitemstring(1,'nombre_titular_origen')
							ls_ap_pat_tit  		= dw_ficha_sepult.getitemstring(1,'apellido_pat_titular_origen')
							ls_ap_mat_tit     	= dw_ficha_sepult.getitemstring(1,'apellido_mat_titular_origen')
							ls_tipo_via_tit		= dw_ficha_sepult.getitemstring(1,'tipo_via_origen_titular')
							ls_direc_tit      		= dw_ficha_sepult.getitemstring(1,'direccion_titular_origen')
							ls_num_dir_tit		= dw_ficha_sepult.getitemstring(1,'nro_direc_titular_origen')
							ls_dpto_dir_tit 		= dw_ficha_sepult.getitemstring(1,'dpto_direc_titular_origen')
							ls_block_dir_tit  	= dw_ficha_sepult.getitemstring(1,'block_direc_titular_origen')
							ls_pob_villa_tit  	= dw_ficha_sepult.getitemstring(1,'poblacion_villa_origen')
							ls_sector_tit			= dw_ficha_sepult.getitemstring(1,'sector_titular_origen')
							ls_cod_ciud_tit		= dw_ficha_sepult.getitemstring(1,'cod_ciudad_titular_origen')
							ls_cod_com_tit    	= dw_ficha_sepult.getitemstring(1,'cod_comuna_titular_origen')
							ls_fono_titular   	= dw_ficha_sepult.getitemstring(1,'fono_titular_origen')
			
							//Destino
							ls_sector_d			= dw_ficha_sepult.getitemstring(1,'sector_destino')
							ls_sepultura_d		= dw_ficha_sepult.getitemstring(1,'sepultura_destino')
							ls_base_d        		= dw_ficha_sepult.getitemstring(1,'base_destino')
							ls_serie_d			= dw_ficha_sepult.getitemstring(1,'serie_destino')
							ll_capacidad_d		= dw_ficha_sepult.getitemnumber(1,'capacidad_destino')
							ll_numero_d        	= dw_ficha_sepult.getitemnumber(1,'numero_destino')
							ldt_fecha_ctto_d	= dw_ficha_sepult.getitemDateTime(1,'fecha_contrato_destino')
							ls_estado_ctto_d	= dw_ficha_sepult.getitemstring(1,'estado_contrato_destino')
							ls_nro_tecnico_d  	= dw_ficha_sepult.getitemstring(1,'numero_tecnico_destino')
							ll_rut_titular_d		= dw_ficha_sepult.getitemnumber(1,'rut_titular_destino')
							ls_dv_titular_d		= dw_ficha_sepult.getitemstring(1,'dv_titular_destino')
							ls_nombre_tit_d	= dw_ficha_sepult.getitemstring(1,'nombre_titular_destino')
							ls_ap_pat_tit_d		= dw_ficha_sepult.getitemstring(1,'apellido_pat_titular_destino')
							ls_ap_mat_tit_d    	= dw_ficha_sepult.getitemstring(1,'apellido_mat_titular_destino')
							ls_tipo_via_tit_d	= dw_ficha_sepult.getitemstring(1,'tipo_via_destino_titular')
							ls_direc_tit_d   		= dw_ficha_sepult.getitemstring(1,'direccion_titular_destino')
							ls_num_dir_tit_d	= dw_ficha_sepult.getitemstring(1,'nro_direc_titular_destino')
							ls_dpto_dir_tit_d	= dw_ficha_sepult.getitemstring(1,'depto_direc_titular_destino')
							ls_block_dir_tit_d 	= dw_ficha_sepult.getitemstring(1,'block_direc_titular_destino')
							ls_pob_villa_tit_d 	= dw_ficha_sepult.getitemstring(1,'poblacion_villa_destino')
							ls_sector_tit_d		= dw_ficha_sepult.getitemstring(1,'sector_titular_destino')
							ls_cod_ciud_tit_d	= dw_ficha_sepult.getitemstring(1,'cod_ciudad_titular_destino')
							ls_cod_com_tit_d  	= dw_ficha_sepult.getitemstring(1,'cod_comuna_titular_destino')
							ls_fono_titular_d  	= dw_ficha_sepult.getitemstring(1,'fono_titular_destino')
			
			
							ll_new_titular		= dw_ficha_sepult.insertrow(0)
							dw_ficha_sepult.scrolltorow(ll_new_titular)
							dw_ficha_sepult.setitem(ll_new_titular,'tipo_traslado',ls_tipo_traslado)
							dw_ficha_sepult.setitem(ll_new_titular,'destino_parque',ls_destino_parque)
							dw_ficha_sepult.setitem(ll_new_titular,'c_estadistico',is_usuario_esta)
							dw_ficha_sepult.setitem(ll_new_titular,'capacidad_origen',ll_capacidad)
							dw_ficha_sepult.setitem(ll_new_titular,'tipo_traslado',0)
							dw_ficha_sepult.setitem(ll_new_titular,'rut_titular_origen',ll_rut_titular)
							dw_ficha_sepult.setitem(ll_new_titular,'dv_titular_origen',ls_dv_titular)
							dw_ficha_sepult.setitem(ll_new_titular,'nombre_titular_origen',ls_nombre_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'apellido_pat_titular_origen',ls_ap_pat_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'apellido_mat_titular_origen',ls_ap_mat_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'tipo_via_origen_titular',ls_tipo_via_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'direccion_titular_origen',ls_direc_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'nro_direc_titular_origen',ls_num_dir_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'dpto_direc_titular_origen',ls_dpto_dir_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'block_direc_titular_origen',ls_block_dir_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'poblacion_villa_origen',ls_pob_villa_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'sector_titular_origen',ls_sector_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'cod_ciudad_titular_origen',ls_cod_ciud_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'cod_comuna_titular_origen',ls_cod_com_tit)
							dw_ficha_sepult.setitem(ll_new_titular,'fono_titular_origen',ls_fono_titular)
							dw_ficha_sepult.setitem(ll_new_titular,'folio',dw_ficha_sepult.rowcount())
							dw_ficha_sepult.setitem(ll_new_titular,'cod_parque',ll_cod_parque)
							dw_ficha_sepult.setitem(ll_new_titular,'sector_origen',ls_sector)
							dw_ficha_sepult.setitem(ll_new_titular,'sepultura_origen',ls_sepultura)
							dw_ficha_sepult.setitem(ll_new_titular,'fecha_traslado',ldt_fecha_sepult)
							dw_ficha_sepult.setitem(ll_new_titular,'sw_dato_funeraria',1)
							dw_ficha_sepult.setitem(ll_new_titular,'est_uso_firma_digital',1)
							
							dw_ficha_sepult.setitem(ll_new_titular,'sector_destino',ls_sector_d)
							dw_ficha_sepult.setitem(ll_new_titular,'sepultura_destino',ls_sepultura_d)
							dw_ficha_sepult.setitem(ll_new_titular,'base_destino',ls_base_d)
							dw_ficha_sepult.setitem(ll_new_titular,'serie_destino',ls_serie_d)
							dw_ficha_sepult.setitem(ll_new_titular,'capacidad_destino',ll_capacidad_d)
							dw_ficha_sepult.setitem(ll_new_titular,'numero_destino',ll_numero_d)
							dw_ficha_sepult.setitem(ll_new_titular,'fecha_contrato_destino',ldt_fecha_ctto_d)
							dw_ficha_sepult.setitem(ll_new_titular,'estado_contrato_destino',ls_estado_ctto_d)
							dw_ficha_sepult.setitem(ll_new_titular,'numero_tecnico_destino',ls_nro_tecnico_d)
							dw_ficha_sepult.setitem(ll_new_titular,'rut_titular_destino',ll_rut_titular_d)
							dw_ficha_sepult.setitem(ll_new_titular,'dv_titular_destino',ls_dv_titular_d)
							dw_ficha_sepult.setitem(ll_new_titular,'nombre_titular_destino',ls_nombre_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'apellido_pat_titular_destino',ls_ap_pat_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'apellido_mat_titular_destino',ls_ap_mat_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'tipo_via_destino_titular',ls_tipo_via_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'direccion_titular_destino',ls_direc_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'nro_direc_titular_destino',ls_num_dir_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'depto_direc_titular_destino',ls_dpto_dir_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'block_direc_titular_destino',ls_block_dir_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'poblacion_villa_destino',ls_pob_villa_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'sector_titular_destino',ls_sector_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'cod_ciudad_titular_destino',ls_cod_ciud_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'cod_comuna_titular_destino',ls_cod_com_tit_d)
							dw_ficha_sepult.setitem(ll_new_titular,'fono_titular_destino',ls_fono_titular_d)
							dw_ficha_sepult.setitem(ll_new_titular,'cod_parque_destino',ll_cod_parque)
							dw_ficha_sepult.scrolltorow(ll_new_titular)
							
							if ls_base_d='O' then
								SELECT	"OFERTA_V"."TIPO_CONS"  
								INTO 		:ls_tipo_cons  
								FROM 		"CADENA",   
											"OFERTA_V"  
								WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
										 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
										 (("CADENA"."CODIGO" = :ls_base_d ) AND  
										 ( "OFERTA_V"."SERIE" = :ls_serie_d ) AND  
										 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_d ) )   
								USING		sqlca;
								if sqlca.sqlcode<>0 then
									ls_tipo_cons	= "T"
								end if
							else
								ls_tipo_cons		= "T"
							end if
							if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = "T"
							if idw_detalle12.retrieve(ll_capacidad_d,ll_cod_parque,ls_tipo_cons)=0 then
								idw_detalle12.insertrow(0)
							end if
							
							
							if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
							if idw_detalle11.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
								idw_detalle11.insertrow(0)
							end if
							dw_ficha_sepult.accepttext()
							ll_new_fall		= tab_1.tabpage_1.dw_ant_fall.insertrow(0)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'folio',tab_1.tabpage_1.dw_ant_fall.rowcount())
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'cod_parque',ll_cod_parque)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sector_origen',ls_sector)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sepultura_origen',ls_sepultura)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'fecha_traslado',ldt_fecha_sepult)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_titular_fall',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_pase_sepultacion',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_dato_funeraria',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_condolencia',1)
							tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_new_fall)
			
							ll_new_ara		= tab_1.tabpage_4.dw_aranceles.insertrow(0)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'folio',tab_1.tabpage_4.dw_aranceles.rowcount())
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'cod_parque',ll_cod_parque)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'sector_origen',ls_sector)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'sepultura_origen',ls_sepultura)
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'fecha_traslado',ldt_fecha_sepult)
							tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_new_ara)
			
//							ll_new			= tab_1.tabpage_3.dw_ficha_sepult.insertrow(0)
							tab_1.tabpage_3.dw_ficha_sepult.setfocus()
							ll_count_fila_fs	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
							tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_new_titular)
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora_fijada')
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'sw_dato_funeraria',1)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'est_uso_firma_digital',1)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'c_estado','S')
							if tab_1.tabpage_1.dw_ant_fall.getitemnumber(ll_new_fall,'rut_fallecido') > 0 then
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'c_estado','S')
							else
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'c_estado','N')
							end if
							tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'c_estado','S')
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'c_estadistico',is_usuario_esta)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'codigo_ejecutivo',gs_user)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'fecha_traslado',ldt_fecha_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'sector_origen',ls_sector)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'sepultura_origen',ls_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'cod_parque',ll_cod_parque)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'hora_fijada',ll_hora)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'minuto_fijada',ll_minutos)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'folio',tab_1.tabpage_3.dw_ficha_sepult.rowcount())
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'base_origen',ls_base)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'serie_origen',ls_serie)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'numero_origen',ll_numero)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'fecha_contrato_origen',ldt_fecha_ctto)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'estado_contrato_origen',ls_estado_ctto)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'numero_tecnico_origen',ls_nro_tecnico)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'fecha_recepcion',ldt_fecha_recep)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'hora_recepcion',ll_hora_recep)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'minuto_recepcion',ll_minuto_recep)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'hora_salida',ll_hora_salida)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'minuto_salida',ll_minu_salida)
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new_titular,'vb_estadistico',ls_vd_estadistico)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							il_count_otro	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
							tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_new_titular)
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora_fijada')
						else
							tab_1.tabpage_1.dw_ant_fall.enabled			= true
							tab_1.tabpage_4.dw_aranceles.enabled		= true
						end if
					end if
				end if
//				if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
//				if idw_detalle11.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
//					idw_detalle11.insertrow(0)
//				end if
				if not isnull(ll_cod_parque) and not isnull(ls_sector) and not isnull(ldt_fecha_sepult) then	//not isnull(ls_sepultura)
					SELECT 	  Count("FOSA_COMUN"."AREA")
					INTO 		  :ll_count_fosa  
					FROM 	  "FOSA_COMUN"  
					WHERE 	( "FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "FOSA_COMUN"."SECTOR" = :ls_sector )  ;		//AND ( "FOSA_COMUN"."SEPULTURA" = :ls_sepultura )  
	
					if ll_count_fosa > 0 then
						ls_string	= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura
						if isvalid(w_lista_fosa_comun_para_fs) then close(w_lista_fosa_comun_para_fs)
						if isnull(gl_llave_fallecido_fc) then
							openwithparm(w_lista_fosa_comun_para_fs,ls_string)
						else
							f_cargar_fallecido_fc_ficha()
						end if
					end if
				end if
//				if not isnull(ll_cod_parque) and not isnull(ls_sector) and not isnull(ls_sepultura) and not isnull(ldt_fecha_sepult) then
//					SELECT 	  Count("FOSA_COMUN"."AREA")
//					INTO 		  :ll_count_fosa  
//					FROM 	  "FOSA_COMUN"  
//					WHERE 	( "FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque ) AND  
//								( "FOSA_COMUN"."SECTOR" = :ls_sector ) AND  
//								( "FOSA_COMUN"."SEPULTURA" = :ls_sepultura )   ;
//					if ll_count_fosa > 0 then
//						ls_string	= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura
//						if isvalid(w_lista_fosa_comun_para_fs) then close(w_lista_fosa_comun_para_fs)
//						openwithparm(w_lista_fosa_comun_para_fs,ls_string)
//					end if
//				end if
			end if
	
		CASE 'p_2'
			if is_usuario_esta='S' then
				if ls_estado='S' then
					ls_fecha	= string(date(dw_ficha_sepult.getitemdatetime(1,'fecha_contrato_origen')))
					if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
					if f_valida_fecha(ls_fecha)=-1 then 
						dw_ficha_sepult.setitem(1,'fecha_contrato_origen',datetime(string(today(),gs_formato_fecha)))
						return
					end if
					OpenWithParm(w_calendar,ls_fecha)
					IF not isnull(Message.StringParm) THEN
						ls_fecha				= trim(Message.StringParm)
						dw_ficha_sepult.setitem(1,'fecha_contrato_origen',date(ls_fecha))
					END IF
				end if
			end if
			
	CASE 'p_3'
		
//		if (isnull( cod_parque ) or isnull( fecha_traslado ) or isnull( sector_origen ) or isnull( sepultura_origen )  or estado_reg='G' or estado_reg='A' or isnull( rut_titular_destino ) or isnull( dv_titular_destino ) ,1,0)
		
		if is_usuario_esta='S' then
			if ls_estado='S' then
				ls_fecha	= string(date(dw_ficha_sepult.getitemdatetime(1,'fecha_contrato_destino')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha) = -1 then 
					dw_ficha_sepult.setitem(1,'fecha_contrato_destino',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ficha_sepult.setitem(1,'fecha_contrato_destino',date(ls_fecha))
				END IF	
			end if
		end if
			
	CASE 'p_5'
		if ls_estado='S' then
			ls_tipo_tras			= trim(this.getitemstring(this.getrow(),'tipo_traslado'))
			ls_destino			= trim(this.getitemstring(this.getrow(),'destino_parque'))
			ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
			ldt_fecha_sepult	= this.getitemdatetime(this.getrow(),'fecha_traslado')
			ls_ejecutivo			= this.getitemString(this.getrow(),'codigo_ejecutivo')
			ll_hora_fijada		= this.getitemNumber(this.getrow(),'hora_fijada')
			if ls_tipo_tras='I' then
				ls_sector			= trim(this.getitemstring(this.getrow(),'sector_destino'))
				ls_sepultura		= trim(this.getitemstring(this.getrow(),'sepultura_destino'))
				ls_obs			= this.getitemString(this.getrow(),'observaciones_destino')
				ls_base			= this.getitemString(this.getrow(),'base_destino')
				ls_serie			= this.getitemString(this.getrow(),'serie_destino')
				ll_numero		= this.getitemnumber(this.getrow(),'numero_destino')
			else
				if ls_destino = 'E' then
					ls_sector		= trim(this.getitemstring(this.getrow(),'sector_destino'))
					ls_sepultura	= trim(this.getitemstring(this.getrow(),'sepultura_destino'))
					ls_obs		= this.getitemString(this.getrow(),'observaciones_destino')
					ls_base		= this.getitemString(this.getrow(),'base_destino')
					ls_serie		= this.getitemString(this.getrow(),'serie_destino')
					ll_numero	= this.getitemnumber(this.getrow(),'numero_destino')
				elseif ls_destino = 'S' then
					ls_sector		= trim(this.getitemstring(this.getrow(),'sector_origen'))
					ls_sepultura	= trim(this.getitemstring(this.getrow(),'sepultura_origen'))
					ls_obs		= this.getitemString(this.getrow(),'observaciones_origen')
					ls_base		= this.getitemString(this.getrow(),'base_origen')
					ls_serie		= this.getitemString(this.getrow(),'serie_origen')
					ll_numero	= this.getitemnumber(this.getrow(),'numero_origen')
				end if
			end if
	//		if ll_hora_fijada>0 then
				ll_minuto_fijado	= this.getitemNumber(this.getrow(),'minuto_fijada')
				ls_nombre			= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'nombre_fallecido'))
				ls_ap_pat			= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'apellido_paterno_fall'))
				ls_ap_mat			= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'apellido_materno_fall'))
				if isnull(ll_cod_parque) or isnull(ls_sector) or isnull(ls_sepultura) or &
					isnull(ldt_fecha_sepult) or isnull(ls_ejecutivo) or isnull(ls_obs) then
					
					if isnull(ll_cod_parque) then
						messagebox("Advertencia","Debe Seleccionar Parque")
						this.setcolumn('cod_parque')
					elseif isnull(ls_sector) then
						messagebox("Advertencia","Debe Seleccionar Sector")
						this.setcolumn('sector_origen')
					elseif isnull(ls_sepultura) then
						messagebox("Advertencia","Debe Seleccionar Sepultura")
						this.setcolumn('sepultura_origen')
					elseif isnull(ldt_fecha_sepult) then
						messagebox("Advertencia","Debe Seleccionar Fecha Traslado")
						this.setcolumn('fecha_traslado')
					elseif isnull(ls_ejecutivo) then
						messagebox("Advertencia","Debe Seleccionar Ejecutivo")
						this.setcolumn('codigo_ejecutivo')
					elseif isnull(ls_obs) then
						messagebox("Advertencia","Debe Ingresar Observación")
						this.setcolumn('observaciones_origen')
					end if
				else
					if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then
						ls_string		= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura+'~t'+string(ldt_fecha_sepult)+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_ejecutivo+'~t'+ls_obs+'~t'+string(ll_hora_fijada)+'~t'+string(ll_minuto_fijado)+'~t'+'FT'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+'F'
						if isvalid(w_lista_funerales) then close(w_lista_funerales)
						OpenWithParm(w_lista_funerales, ls_string)
					else
						messagebox("Advertencia","Debe Ingresar Antecedente Fallecido")
						tab_1.SelectedTab	= 2
						tab_1.tabpage_1.dw_ant_fall.setfocus()
						dw_ficha_sepult.scrolltorow(dw_ficha_sepult.getrow())
						tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
					end if
				end if
	//		else
	//			messagebox("Advertencia","Debe Ingresar Hora Fijada")
	//			this.setcolumn('hora_fijada')
	//		end if
		end if

	END CHOOSE
end if
end event

event itemfocuschanged;String		ls_columna,ls_dv,ls_nulo,ls_base,ls_serie,ls_nivel,ls_var_nivel,ls_var_cap,ls_var_final,ls_nivel_aux,ls_sector,ls_sepultura,ls_existe_ctto,ls_cod_age_aux,ls_pasa,ls_pasa1,ls_est_ctto,&
			ls_modif_adm,ls_pasa_ctrol,ls_pasa_fc='N'
Long		ll_rut,ll_capacidad,ll_pos,ll_cod_parque,ll_hora_fijada,ll_min_fijada,&
			ll_parque_tras,ll_count_sep,ll_count_tras,ll_count_suma,ll_count_reserva,ll_parque_aux,&
			ll_nulo,ll_count,ll_count_tiene,ll_hora,ll_cod_parque_ori,ll_count_cap,ll_cod_parque_des
Datetime	ldt_fecha_sepult,ldt_fec_tras
Double	ll_numero

this.accepttext()
if il_modif_item > 0 then
	setnull(ls_nulo);Setnull(ll_nulo)
	ls_columna			= dwo.name
	if ls_columna='tipo_via_destino_titular' then //ls_columna<>'rut_titular_destino' and ls_columna<>'dv_titular_destino' then
		ll_rut			= this.getitemnumber(this.getrow(),'rut_titular_destino')
		ls_dv				= trim(this.getitemstring(this.getrow(),'dv_titular_destino'))
		ls_existe_ctto	= this.getitemstring(this.getrow(),'c_estado')
		if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				this.setitem(this.getrow(),'dv_titular_destino',ls_nulo)
				this.setcolumn('dv_titular_destino')
			end if
	//		if ls_existe_ctto='S' then
	//			SELECT 	Count("CLIENTE"."NOMBRE")
	//			INTO 		:ll_count
	//			FROM 		"CLIENTE"  
	//			WHERE 	"CLIENTE"."RUT" = :ll_rut   
	//			USING		sqlca;
	//			if ll_count=0 or isnull(ll_count) then
	//				tab_1.tabpage_3.dw_ficha_sepult.setitem(this.getrow(),'dv_titular_destino',ls_nulo)
	//				this.setcolumn('dv_titular_destino')
	//			end if
	//		end if
		end if
	end if
	if ls_columna<>'hora_fijada' then
		ll_hora	= this.getitemnumber(this.getrow(),'hora_fijada')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 23 then
				this.setitem(this.getrow(),'hora_fijada',0)
			end if
		end if
	else
		if is_otro='S' then
			dw_ficha_sepult.scrolltorow(dw_ficha_sepult.rowcount())
		end if
	end if
	if ls_columna<>'minuto_fijada' then
		ll_hora	= this.getitemnumber(this.getrow(),'minuto_fijada')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 59 then
				this.setitem(this.getrow(),'minuto_fijada',0)
				this.setcolumn('minuto_fijada')
			else
				if il_intervalo=30 then
					if ll_hora<>0 and ll_hora<>30 then
						this.setitem(this.getrow(),'minuto_fijada',0)
						this.setcolumn('minuto_fijada')
					end if
				elseif il_intervalo=15 then
					if ll_hora<>0 and ll_hora<>15 and ll_hora<>30 and ll_hora<>45 then
						this.setitem(this.getrow(),'minuto_fijada',0)
						this.setcolumn('minuto_fijada')
					end if
				elseif il_intervalo=60 then
					if ll_hora<>0 then
						this.setitem(this.getrow(),'minuto_fijada',0)
						this.setcolumn('minuto_fijada')
					end if
				end if
			end if
		end if
	end if
	if ls_columna='tipo_via_origen_titular' then //and ls_columna<>'rut_titular_origen' and ls_columna<>'dv_titular_origen' then
		ll_rut			= this.getitemnumber(this.getrow(),'rut_titular_origen')
		ls_dv				= trim(this.getitemstring(this.getrow(),'dv_titular_origen'))
		ls_existe_ctto	= this.getitemstring(this.getrow(),'c_estado')//c_existe_ctto
		if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				this.setitem(this.getrow(),'dv_titular_origen',ls_nulo)
				this.setcolumn('dv_titular_origen')
			end if
	//		if ls_existe_ctto='S' then
	//			SELECT 	Count("CLIENTE"."NOMBRE")
	//			INTO 		:ll_count
	//			FROM 		"CLIENTE"  
	//			WHERE 	"CLIENTE"."RUT" = :ll_rut   
	//			USING		sqlca;
	//			if ll_count=0 or isnull(ll_count) then
	//				tab_1.tabpage_3.dw_ficha_sepult.setitem(this.getrow(),'dv_titular_origen',ls_nulo)
	//				this.setcolumn('dv_titular_origen')
	//			end if
	//		end if
		end if
	end if
	if ls_columna='numero_tecnico_destino' then
		ls_base			= dw_ficha_sepult.getitemstring(this.getrow(),'base_destino')
		ls_serie			= dw_ficha_sepult.getitemstring(this.getrow(),'serie_destino')
		ll_numero		= dw_ficha_sepult.getitemnumber(this.getrow(),'numero_destino')
		ls_nivel			= trim(this.getitemstring(this.getrow(),'nivel_sepultura_destino'))
		if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ll_numero) and not isnull(ls_nivel) then
			ll_capacidad	= this.getitemnumber(this.getrow(),'capacidad_destino')
			ll_pos			= Pos(ls_nivel, ".")
			ls_var_nivel	= mid(ls_nivel,ll_pos + 1)
			ll_pos			= Pos(ls_var_nivel, ".")
			ls_var_cap		= mid(ls_var_nivel,ll_pos + 1)
			ls_var_final	= mid(ls_var_nivel,1,ll_pos - 1)
			if long(ls_var_final) > ll_capacidad then
				this.setitem(this.getrow(),'nivel_sepultura_destino',ls_nulo)
				this.accepttext()
			else
				if ll_capacidad - long(ls_var_final)=0 then
					this.setitem(this.getrow(),'estado_sepultura_destino','S')
				else
					this.setitem(this.getrow(),'estado_sepultura_destino','N')
				end if
				if long(ls_var_cap) <> ll_capacidad then
					this.setitem(this.getrow(),'nivel_sepultura_destino',ls_nulo)
					this.accepttext()
				else
					SELECT	"FICHA_TRASLADO"."NIVEL_SEPULTURA_DESTINO"  
					INTO 		:ls_nivel_aux  
					FROM 		"FICHA_TRASLADO"  
					WHERE  ( "FICHA_TRASLADO"."BASE_DESTINO" = :ls_base ) AND  
							 ( "FICHA_TRASLADO"."SERIE_DESTINO" = :ls_serie ) AND  
							 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = :ll_numero )  AND
							 ( "FICHA_TRASLADO"."NIVEL_SEPULTURA_DESTINO"  = :ls_nivel )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if not isnull(this.getitemstring(this.getrow(),'c_existe_ctto')) then
							this.setitem(this.getrow(),'nivel_sepultura_destino',ls_nulo)
							this.setcolumn('nivel_sepultura_destino')
							this.accepttext()
						end if
					end if
				end if
			end if
		end if
	end if
	if ls_columna='cod_parque' or ls_columna='sector_origen' or ls_columna='sepultura_origen' or ls_columna='fecha_traslado' then
		ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
		ls_sector				= this.getitemstring(this.getrow(),'sector_origen')
		ls_sepultura			= this.getitemstring(this.getrow(),'sepultura_origen')
		ldt_fecha_sepult	= this.getitemdatetime(this.getrow(),'fecha_traslado')
		if not isnull(ll_cod_parque) and not isnull(ls_sector) and not isnull(ls_sepultura) then
			SELECT	Count("INVENTARIO_PLANI"."BASE")
			INTO 		:ll_count_reserva
			FROM 		"INVENTARIO_PLANI"  
			WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
					 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
					 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) AND  
					 ( "INVENTARIO_PLANI"."NUMERO" > 0 )   
			USING		sqlca;
			if ll_count_reserva>0 then
				ls_pasa	= 'S'
			else
				SELECT	Count("RESERVA_SEPULTURA"."FOLIO_RESERVA")  
				INTO 		:ll_count_tiene  
				FROM 		"RESERVA_SEPULTURA"  
				WHERE  ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) AND  
						 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
						 ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
						 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura )   
				USING		sqlca;
				if ll_count_tiene>0 then
					ls_pasa1	= 'S'
				else
					ls_pasa1	= 'N'
				end if
			end if
			if ls_pasa1='N' then
				this.setitem(this.getrow(),'sector_origen',ls_nulo)
				this.setitem(this.getrow(),'sepultura_origen',ls_nulo)
				idw_detalle5.reset()
				idw_detalle5.insertrow(0)
				this.accepttext()
				this.setcolumn('sector_origen')
			else
				if ls_pasa='S' then
					SELECT	"INVENTARIO_PLANI"."BASE",   
								"INVENTARIO_PLANI"."SERIE",   
								"INVENTARIO_PLANI"."NUMERO"
					INTO 		:ls_base,   
								:ls_serie,   
								:ll_numero
					FROM 		"INVENTARIO_PLANI"  
					WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
							 ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
							 ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepultura ) AND  
							 ( "INVENTARIO_PLANI"."NUMERO" > 0 )   
					USING		sqlca;
				elseif ls_pasa1='S' then
					SELECT	"RESERVA_SEPULTURA"."BASE",	"RESERVA_SEPULTURA"."SERIE",	"RESERVA_SEPULTURA"."NUMERO"  
					INTO 		:ls_base,							:ls_serie,							:ll_numero  
					FROM 		"RESERVA_SEPULTURA"  
					WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND  
							 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
							 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND  
							 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) AND  
							 ( "RESERVA_SEPULTURA"."FOLIO_RESERVA" = ( 	SELECT MAX("RESERVA_SEPULTURA"."FOLIO_RESERVA") 
																						FROM 		"RESERVA_SEPULTURA" 
																						WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND 
																								 ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND  
																								 ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sepultura ) AND 
																								 ( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque ) ) )   
					USING		sqlca;
					if sqlca.sqlcode <> 0 then
						//////////////VALIDAR
						SELECT	"CADENA"."CODIGO",		"CADENA"."SERIE", 	"CADENA"."NUMERO", 	"PAGO_OFERTA"."CAPACIDAD"  
						INTO 		:ls_base,						:ls_serie,					:ll_numero,					:il_capacidad
						FROM 	"OFERTA_V",  	"PAGO_OFERTA", 	"CADENA"  
						WHERE 	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
									( "PAGO_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
									( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
									( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
									( "PAGO_OFERTA"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
									( ( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
									( "PAGO_OFERTA"."SECTOR" = :ls_sector ) AND  
									( "PAGO_OFERTA"."SEPULTURA" = :ls_sepultura ) AND  
									( "CADENA"."CODIGO" = 'O' ) ) 
						UNION
						SELECT 	"CADENA"."CODIGO", 		"CADENA"."SERIE", 	"CADENA"."NUMERO", 	"CONTRATO"."CAPACIDAD"  
						FROM 	"CADENA",  	"CONTRATO"  
						WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
									( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
									( ( "CADENA"."CODIGO" = 'C' ) AND  
									( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND  
									( "CONTRATO"."SECTOR" = :ls_sector ) AND  
									( "CONTRATO"."SEPULTURA" = :ls_sepultura ) )  
						USING	sqlca;
						if sqlca.sqlcode <> 0 then
							SELECT DISTINCT 	"FOSA_COMUN"."BASE",  	"FOSA_COMUN"."SERIE",   	MAX("FOSA_COMUN"."NUMERO"  ),	4
							INTO 						:ls_base,							:ls_serie,						:ll_numero,										:il_capacidad
							FROM 	"FOSA_COMUN"  
							WHERE   "FOSA_COMUN"."SECTOR" = :ls_sector  AND  
										"FOSA_COMUN"."SEPULTURA" = :ls_sepultura  AND 
										"FOSA_COMUN"."BASE" IS NOT NULL  AND 
										"FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque
							GROUP BY "FOSA_COMUN"."BASE",  	"FOSA_COMUN"."SERIE"  
							USING	sqlca;
							if sqlca.sqlcode=0 then 
								ls_pasa_fc		= 'S'
							end if
						end if
					end if
				end if
				if sqlca.sqlcode=0 then
					if ls_base='O' then
						if ls_pasa_fc = 'S' then
							ls_pasa_ctrol	= 'S'
						elseif ll_numero=10000000 then
							ls_pasa_ctrol	= 'S'
						else
							SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
							INTO 		:ll_parque_aux,				:ls_cod_age_aux  
							FROM 		"CD_FOLIO"  
							WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
									 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
									 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
							USING		sqlca;
							if sqlca.sqlcode=0 then
								ls_pasa_ctrol		= 'S'
							else
								if (ll_numero <= 84000 and gs_conexion	= "Parque El Prado") or &
									(ll_numero <= 15884 and gs_conexion	= "Parque La Foresta") then
									ls_pasa_ctrol	= 'S'
								else
									ls_pasa_ctrol	= 'N'
								end if
							end if
						end if
					else
						ls_pasa_ctrol			= 'S'
					end if
					if ls_pasa_ctrol='S' then
						SELECT	"CADENA"."ESTADO"  
						INTO		:ls_est_ctto  
						FROM 		"CADENA"  
						WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_numero )   
						USING		sqlca;
						if ls_est_ctto='D' or ls_est_ctto='V' or ls_est_ctto='C' or ls_est_ctto='R' or ls_est_ctto='F' or ls_est_ctto='S' or ls_est_ctto='D' or ls_est_ctto='N' or ls_est_ctto='A' or sqlca.sqlcode=100 then
						else
							this.setitem(this.getrow(),'sector_origen',ls_nulo)
							this.setitem(this.getrow(),'sepultura_origen',ls_nulo)
							idw_detalle5.reset()
							idw_detalle5.insertrow(0)
							this.accepttext()
							this.setcolumn('sector_origen')
						end if
					end if
				end if
			end if
		end if
	end if
	if ls_columna<>'base_origen' and ls_columna<>'serie_origen' and ls_columna<>'numero_origen' then
		ls_base			= dw_ficha_sepult.getitemstring(this.getrow(),'base_origen')
		ls_serie			= dw_ficha_sepult.getitemstring(this.getrow(),'serie_origen')
		ll_numero		= dw_ficha_sepult.getitemnumber(this.getrow(),'numero_origen')
		ls_existe_ctto	= dw_ficha_sepult.getitemstring(this.getrow(),'c_existe_ctto')
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and &
			not isnull(ll_numero) and ll_numero>0 and ls_existe_ctto='N' then
			SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
			INTO 		:ll_parque_aux,				:ls_cod_age_aux  
			FROM 		"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
					 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
	//			if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
	//				dw_ficha_sepult.Setitem(this.getrow(),'numero_origen',ll_nulo)
	//				dw_ficha_sepult.Setitem(this.getrow(),'estado_contrato_origen',ls_nulo)
	//				dw_ficha_sepult.Setitem(this.getrow(),'nivel_sepultura_origen',ls_nulo)
	//				dw_ficha_sepult.Setitem(this.getrow(),'numero_tecnico_origen',ls_nulo)
	//				dw_ficha_sepult.accepttext()
	//				dw_ficha_sepult.setcolumn('numero_origen')
	//			end if
			else
				dw_ficha_sepult.Setitem(this.getrow(),'numero_origen',ll_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'estado_contrato_origen',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'nivel_sepultura_origen',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'numero_tecnico_origen',ls_nulo)
				dw_ficha_sepult.accepttext()
				dw_ficha_sepult.setcolumn('numero_origen')
			end if
		end if
	end if
	if ls_columna<>'base_destino' and ls_columna<>'serie_destino' and ls_columna<>'numero_destino' then
		ls_base			= dw_ficha_sepult.getitemstring(this.getrow(),'base_destino')
		ls_serie			= dw_ficha_sepult.getitemstring(this.getrow(),'serie_destino')
		ll_numero		= dw_ficha_sepult.getitemnumber(this.getrow(),'numero_destino')
		ls_existe_ctto	= dw_ficha_sepult.getitemstring(this.getrow(),'c_existe_ctto')
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and &
			not isnull(ll_numero) and ll_numero>0 and ls_existe_ctto='N' then
			SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
			INTO 		:ll_parque_aux,				:ls_cod_age_aux  
			FROM 		"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
					 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
	//			if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
	//				dw_ficha_sepult.Setitem(this.getrow(),'numero_destino',ll_nulo)
	//				dw_ficha_sepult.Setitem(this.getrow(),'estado_contrato_destino',ls_nulo)
	//				dw_ficha_sepult.Setitem(this.getrow(),'nivel_sepultura_destino',ls_nulo)
	//				dw_ficha_sepult.Setitem(this.getrow(),'numero_tecnico_destino',ls_nulo)
	//				dw_ficha_sepult.accepttext()
	//				dw_ficha_sepult.setcolumn('numero_destino')
	//			end if
			else
				dw_ficha_sepult.Setitem(this.getrow(),'numero_destino',ll_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'estado_contrato_destino',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'nivel_sepultura_destino',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'numero_tecnico_destino',ls_nulo)
				dw_ficha_sepult.accepttext()
				dw_ficha_sepult.setcolumn('numero_destino')
			end if
		end if
	end if
	if ls_columna <> 'capacidad_origen' then
		ll_capacidad		= dw_ficha_sepult.getitemnumber(this.getrow(),'capacidad_origen')
		ll_cod_parque_ori	= dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque_origen')
		SELECT	Count("LISTA_PRECIO"."SECTOR")  
		INTO 		:ll_count_cap  
		FROM 		"LISTA_PRECIO"  
		WHERE 	"LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad AND
					"LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque_ori
		USING		sqlca;
		if ll_count_cap=0 then
			dw_ficha_sepult.setitem(this.getrow(),'capacidad_origen',ll_nulo)
			dw_ficha_sepult.setitem(this.getrow(),'nivel_sepultura_origen',ls_nulo)
		end if
		dw_ficha_sepult.accepttext()
	end if
	
	if ls_columna <> 'capacidad_destino' then
		ll_capacidad		= dw_ficha_sepult.getitemnumber(this.getrow(),'capacidad_destino')
		ll_cod_parque_des	= dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque_destino')
		SELECT	Count("LISTA_PRECIO"."SECTOR")  
		INTO 		:ll_count_cap  
		FROM 		"LISTA_PRECIO"  
		WHERE 	"LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad AND
					"LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque_des
		USING		sqlca;
		if ll_count_cap=0 then
			dw_ficha_sepult.setitem(this.getrow(),'capacidad_destino',ll_nulo)
			dw_ficha_sepult.setitem(this.getrow(),'nivel_sepultura_destino',ls_nulo)
		end if
		dw_ficha_sepult.accepttext()
	end if
	
	if ls_columna<>'hora_fijada' or ls_columna<>'minuto_fijada' then
		ll_hora_fijada	= this.getitemnumber(this.getrow(),'hora_fijada')
		ll_min_fijada	= this.getitemnumber(this.getrow(),'minuto_fijada')
		ldt_fec_tras	= this.getitemdatetime(this.getrow(),'fecha_traslado')
		ll_parque_tras	= this.getitemnumber(this.getrow(),'cod_parque')
		tab_1.tabpage_3.dw_ficha_sepult.Setitem(this.getrow(),'hora_def',ll_hora_fijada)
		tab_1.tabpage_3.dw_ficha_sepult.Setitem(this.getrow(),'minuto_def',ll_min_fijada)
		if ll_parque_tras>0 then
			SELECT	"FICHA_HORAS"."HORA_INICIO",   
						"FICHA_HORAS"."MINUTO_INICIO",   
						"FICHA_HORAS"."HORA_FINAL",   
						"FICHA_HORAS"."MINUTO_FINAL",   
						"FICHA_HORAS"."INTERVALO_MINUTO",   
						"FICHA_HORAS"."VECES_SEPULTACION"  
			INTO		:il_hora_ini,   
						:il_min_ini,   
						:il_hora_fin,   
						:il_min_fin,   
						:il_intervalo,   
						:il_veces  
			FROM 		"FICHA_HORAS"  
			WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_parque_tras   ;
		end if
		ls_modif_adm		= this.getitemstring(this.getrow(),'modif_adm')
		if ls_modif_adm = 'N' then
			if ll_hora_fijada<il_hora_ini or (ll_hora_fijada=il_hora_ini and ll_min_fijada<il_min_ini) then
				this.setitem(this.getrow(),'hora_fijada',0)
				this.setitem(this.getrow(),'hora_def',0)
			elseif ll_hora_fijada>il_hora_fin or (ll_hora_fijada=il_hora_fin and ll_min_fijada>il_min_fin) then
				this.setitem(this.getrow(),'hora_fijada',0)
				this.setitem(this.getrow(),'hora_def',0)
			end if
			SELECT	Count("FICHA_SEPULTACION"."CODIGO_EJECUTIVO")  
			INTO 		:ll_count_sep
			FROM 		"FICHA_SEPULTACION"  
			WHERE  ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fec_tras ) AND 
					 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_parque_tras ) AND 
					 ( "FICHA_SEPULTACION"."HORA_DEF" = :ll_hora_fijada ) AND  
					 ( "FICHA_SEPULTACION"."MINUTO_DEF" = :ll_min_fijada )   
			USING		sqlca;
			SELECT 	Count("FICHA_TRASLADO"."CODIGO_EJECUTIVO")  
			INTO		:ll_count_tras
			FROM 		"FICHA_TRASLADO"  
			WHERE  ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fec_tras ) AND  
					 ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_parque_tras ) AND 
					 ( "FICHA_TRASLADO"."HORA_DEF" = :ll_hora_fijada ) AND  
					 ( "FICHA_TRASLADO"."MINUTO_DEF" = :ll_min_fijada )   
			USING		sqlca;
			if isnull(ll_count_sep) then ll_count_sep=0
			if isnull(ll_count_tras) then ll_count_tras=0
			ll_count_suma	= ll_count_sep + ll_count_tras
			if ll_count_suma>=il_veces then
				this.setitem(this.getrow(),'hora_fijada',0)
			end if
		end if
	end if
end if
end event

event rowfocuschanged;Long	ll_row
ll_row							= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

type gb_3 from groupbox within tabpage_3
integer x = 1833
integer y = 4
integer width = 1650
integer height = 148
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3525
integer height = 2152
long backcolor = 67108864
string text = "  Antecedente Fallecido"
long tabtextcolor = 33554432
string picturename = "ver_pagos_cta_mant.bmp"
long picturemaskcolor = 536870912
st_1 st_1
dw_ant_fall dw_ant_fall
end type

on tabpage_1.create
this.st_1=create st_1
this.dw_ant_fall=create dw_ant_fall
this.Control[]={this.st_1,&
this.dw_ant_fall}
end on

on tabpage_1.destroy
destroy(this.st_1)
destroy(this.dw_ant_fall)
end on

type st_1 from statictext within tabpage_1
integer x = 59
integer y = 44
integer width = 2226
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedentes del Fallecido"
boolean focusrectangle = false
end type

type dw_ant_fall from datawindow within tabpage_1
integer x = 46
integer y = 184
integer width = 3479
integer height = 1776
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_antecedente_fall_ficha_traspa"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_dv,ls_periodo,ls_nulo,ls_nombre,ls_mensaje_prov,ls_obs_pase,ls_tipo_tras,ls_des_parque,ls_sexo_fall,ls_texto,ls_tamano,ls_cod_estado_fall,ls_cod_tamano_cuerpo,ls_cod_obs_cuerpo,ls_causa_fallecimiento,&
			ls_fono_funeraria,ls_cod_registro_pase,ls_registro_pase,ls_sexo_fallecido,ls_pase_sepultacion,ls_periodo_nacimiento,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall
Long		ll_rut,ll_new,ll_year_hoy,ll_year,ll_mes,ll_dia,ll_mes_hoy,ll_dia_hoy,ll_edad,ll_nulo,ll_sw_tit_fall,ll_fila,ll_res,ll_fila_des,ll_sw_pase_sepultacion,ll_pos,ll_codigo_funeraria,ll_anno_pase,&
			ll_edad_fall
Datetime	ldt_fecha_pase,ldt_fecha_fall,ldt_fecha_defun,ldt_nulo,ldt_fecha_sepult,ldt_fec_sep_ult,	ldt_fec_def,ldt_fecha_pase_fall,ldt_fec_def_fall,ldt_fec_nac_fall
Date		ldt_fec_ini,ld_fecha_fall

this.accepttext()
ls_columna				= dwo.name 
il_modif ++
Setnull(ls_nulo);Setnull(ldt_nulo);setnull(ll_nulo)
if ls_columna='sw_titular_fall' then
	il_dw_tit_fall			= 0
	ll_sw_tit_fall			= long(data)
	ll_fila	= tab_1.tabpage_1.dw_ant_fall.getrow()
	if ll_sw_tit_fall=0 then
		ll_res				= messagebox("Advertencia","Está Seguro COPIAR Antecedentes de Titular a Fallecido",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ll_fila_des		= tab_1.tabpage_3.dw_ficha_sepult.getrow()
			ls_tipo_tras	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'tipo_traslado')
			ls_des_parque	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'destino_parque')
			if ls_tipo_tras='I' then
				ll_rut		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila_des,'rut_titular_origen')
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'rut_fallecido',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila_des,'rut_titular_origen'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'dv_fallecido',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'dv_titular_origen'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'nombre_titular_origen'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_paterno_fall',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'apellido_pat_titular_origen'))
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_materno_fall',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'apellido_mat_titular_origen'))
			elseif ls_tipo_tras='E' then
				if ls_des_parque='E' then //nuestros parques
					ll_rut		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila_des,'rut_titular_destino')
					tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'rut_fallecido',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila_des,'rut_titular_destino'))
					tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'dv_fallecido',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'dv_titular_destino'))
					tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'nombre_titular_destino'))
					tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_paterno_fall',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'apellido_pat_titular_destino'))
					tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_materno_fall',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'apellido_mat_titular_destino'))
				elseif ls_des_parque='S' then //otros parques
					ll_rut		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila_des,'rut_titular_origen')
					tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'rut_fallecido',tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila_des,'rut_titular_origen'))
					tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'dv_fallecido',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'dv_titular_origen'))
					tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'nombre_titular_origen'))
					tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_paterno_fall',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'apellido_pat_titular_origen'))
					tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_materno_fall',tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila_des,'apellido_mat_titular_origen'))
				end if
			end if
			
			SELECT DISTINCT 	"FICHA_SEPULTACION"."PERIODO_NACIMIENTO",	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."COD_ESTADO_FALL",  	"FICHA_SEPULTACION"."COD_TAMANO_CUERPO",  	"FICHA_SEPULTACION"."COD_OBS_CUERPO",  		"FICHA_SEPULTACION"."CAUSA_FALLECIMIENTO", 	"FICHA_SEPULTACION"."CODIGO_FUNERARIA",  	"FICHA_SEPULTACION"."FONO_FUNERARIA", 	"FICHA_SEPULTACION"."COD_REGISTRO_PASE",	"FICHA_SEPULTACION"."REGISTRO_PASE",	"FICHA_SEPULTACION"."FECHA_PASE",	"FICHA_SEPULTACION"."ANNO_PASE",	"FICHA_SEPULTACION"."SEXO_FALLECIDO",	"FICHA_SEPULTACION"."PASE_SEPULTACION",		"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",		"FICHA_SEPULTACION"."AP_PATERNO_FALL",		"FICHA_SEPULTACION"."AP_MATERNO_FALL",		"FICHA_SEPULTACION"."FECHA_DEFUNCION",		"FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",		"FICHA_SEPULTACION"."EDAD_FALLECIDO"
			INTO						:ls_periodo_nacimiento,									:ldt_fec_sep_ult,											:ls_cod_estado_fall,										:ls_cod_tamano_cuerpo,										:ls_cod_obs_cuerpo,										:ls_causa_fallecimiento,										:ll_codigo_funeraria,										:ls_fono_funeraria,									:ls_cod_registro_pase,									:ls_registro_pase,									:ldt_fecha_pase_fall,							:ll_anno_pase,									:ls_sexo_fallecido,										:ls_pase_sepultacion,										:ls_nom_fall,													:ls_ap_pat_fall,												:ls_ap_mat_fall,											:ldt_fec_def_fall,											:ldt_fec_nac_fall,													:ll_edad_fall
			FROM 		  "FICHA_SEPULTACION"  
			WHERE 		( "FICHA_SEPULTACION"."RUT_FALLECIDO" = :ll_rut ) AND  
							("FICHA_SEPULTACION"."ESTADO_REG" = 'P' OR  "FICHA_SEPULTACION"."ESTADO_REG" = 'G')  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'cod_estado_fallecido',ls_cod_estado_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'cod_tamano_cuerpo',ls_cod_tamano_cuerpo)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'cod_obs_cuerpo',ls_cod_obs_cuerpo)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'observacion_fallecido',ls_causa_fallecimiento)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'codigo_funeraria',ll_codigo_funeraria)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'fono_funeraria',ls_fono_funeraria)
//				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'cod_registro_pase',ls_cod_registro_pase)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'registro_pase',ls_registro_pase)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'fecha_pase',ldt_fecha_pase_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'anno_paso',ll_anno_pase)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'sexo_fallecido',ls_sexo_fallecido)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'pase_sepultacion',ls_pase_sepultacion)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'periodo_nacimiento',ls_periodo_nacimiento)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'nombre_fallecido',ls_nom_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'apellido_paterno_fall',ls_ap_pat_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'apellido_materno_fall',ls_ap_mat_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'fecha_defuncion',ldt_fec_def_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'fecha_nacimiento_fallecido',ldt_fec_nac_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'edad_fallecido',ll_edad_fall)
				tab_1.tabpage_1.dw_ant_fall.accepttext()
				
				ls_obs_pase			= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'pase_sepultacion')
				if not isnull(ls_obs_pase) and ls_obs_pase<>'' and ls_obs_pase<>'-' then
					ls_texto			= ', Fecha Sepultación Original del Fallecido fue el '+string(ldt_fec_sep_ult,'dd/mm/yyyy')
					ls_obs_pase		= ls_obs_pase + ls_texto
//					tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'pase_sepultacion',ls_obs_pase)
				else
					ls_texto			= 'Fecha Sepultación Original del Fallecido fue el '+string(ldt_fec_sep_ult,'dd/mm/yyyy')
//					tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'pase_sepultacion',ls_texto)
				end if
			end if
			SELECT	"CLIENTE"."FECHA_NAC",		"CLIENTE"."SEXO"
			INTO 		:ldt_fecha_fall,				:ls_sexo_fall  
			FROM 	"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_nacimiento_fallecido',ldt_fecha_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sexo_fallecido',ls_sexo_fall)
				ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(ll_fila_des,'fecha_traslado')
				if not isnull(ldt_fecha_fall) then
					ldt_fec_def		= dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_defuncion')
					if isnull(ldt_fec_def) then
						ll_year_hoy		= year(date(gdt_fec_sistema))
						ll_mes_hoy		= month(date(gdt_fec_sistema))
						ll_dia_hoy		= day(date(gdt_fec_sistema))
					else
						ll_year_hoy		= year(date(ldt_fec_def))
						ll_mes_hoy		= month(date(ldt_fec_def))
						ll_dia_hoy		= day(date(ldt_fec_def))
					end if							
					ll_year			= year(date(ldt_fecha_fall))
					ll_mes			= month(date(ldt_fecha_fall))
					ll_dia			= day(date(ldt_fecha_fall))
					
					ll_edad			= ll_year_hoy - ll_year
					if (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy < ll_mes then
						ll_edad		= ll_edad - 1
					elseif (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy = ll_mes and ll_dia_hoy < ll_dia then
						ll_edad		= ll_edad - 1
					end if
					if ll_edad >= 0 then
						dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_edad)
						if ll_edad > 0 then 
							dw_ant_fall.setitem(dw_ant_fall.getrow(),'periodo_nacimiento','A')
						else
							dw_ant_fall.setitem(dw_ant_fall.getrow(),'periodo_nacimiento',ls_nulo)
						end if
					else
						messagebox("Advertencia","Fecha Nacimiento Fallecido Inválido")
					end if
				end if
				dw_ant_fall.accepttext()
			end if
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sexo_fallecido',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_estado_fallecido',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_tamano_cuerpo',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'observacion_fallecido',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_funeraria',ll_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fono_funeraria',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_registro_pase',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'inscripcion_pase',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'registro_pase',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_defuncion',ldt_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_pase',ldt_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'anno_paso',ll_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'pase_sepultacion',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_paterno_fall',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_materno_fall',ls_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_defuncion',ldt_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_nacimiento_fallecido',ldt_nulo)
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'edad_fallecido',ll_nulo)
		else
			il_dw_tit_fall	= 1
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sw_titular_fall',1)
		end if
	else
		ls_nombre			= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'nombre_fallecido')
		if not isnull(ls_nombre) or ls_nombre<>'' then
			ll_res			= messagebox("Advertencia","Está Seguro de BORRAR Antecedentes del Fallecido",Exclamation!,YesNo!,2)
			if ll_res=1 then
				ls_obs_pase			= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'pase_sepultacion')
				ll_pos				= pos(ls_obs_pase,'Fecha Sepultación Original del Fallecido fue el')
				if ll_pos > 0 then
					tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'pase_sepultacion',ls_nulo)
					tab_1.tabpage_1.dw_ant_fall.accepttext()
				end if
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'rut_fallecido',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'dv_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_paterno_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_materno_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_nacimiento_fallecido',ldt_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'edad_fallecido',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'periodo_nacimiento',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sexo_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_estado_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_tamano_cuerpo',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'observacion_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_funeraria',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fono_funeraria',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_registro_pase',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'inscripcion_pase',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'registro_pase',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_defuncion',ldt_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_pase',ldt_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'anno_paso',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'pase_sepultacion',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_paterno_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'apellido_materno_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_defuncion',ldt_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_nacimiento_fallecido',ldt_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'edad_fallecido',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.accepttext()
				tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
				tab_1.tabpage_1.dw_ant_fall.setfocus()
			end if
		end if
	end if
end if
if ls_columna='rut_fallecido' or ls_columna='dv_fallecido' then
	ll_new				= this.getrow()
	ll_rut					= this.getitemnumber(this.getrow(),'rut_fallecido')
	ls_dv					= this.getitemstring(this.getrow(),'dv_fallecido')
	if ll_rut > 0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			Setnull(ls_dv)
//			dw_ant_fall.reset()
//			ll_new = dw_ant_fall.insertrow(0)
			dw_ant_fall.scrolltorow(ll_new)
			dw_ant_fall.setitem(ll_new,'dv_fallecido',ls_dv)
			dw_ant_fall.accepttext()
			dw_ant_fall.setfocus()
			dw_ant_fall.setcolumn('dv_fallecido')
		else
			SELECT DISTINCT 	"FICHA_SEPULTACION"."PERIODO_NACIMIENTO",	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."COD_ESTADO_FALL",  	"FICHA_SEPULTACION"."COD_TAMANO_CUERPO",  	"FICHA_SEPULTACION"."COD_OBS_CUERPO",  		"FICHA_SEPULTACION"."CAUSA_FALLECIMIENTO", 	"FICHA_SEPULTACION"."CODIGO_FUNERARIA",  	"FICHA_SEPULTACION"."FONO_FUNERARIA", 	"FICHA_SEPULTACION"."COD_REGISTRO_PASE",	"FICHA_SEPULTACION"."REGISTRO_PASE",	"FICHA_SEPULTACION"."FECHA_PASE",	"FICHA_SEPULTACION"."ANNO_PASE",	"FICHA_SEPULTACION"."SEXO_FALLECIDO",	"FICHA_SEPULTACION"."PASE_SEPULTACION",		"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",		"FICHA_SEPULTACION"."AP_PATERNO_FALL",		"FICHA_SEPULTACION"."AP_MATERNO_FALL",		"FICHA_SEPULTACION"."FECHA_DEFUNCION",		"FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",		"FICHA_SEPULTACION"."EDAD_FALLECIDO"
			INTO						:ls_periodo_nacimiento,									:ldt_fec_sep_ult,											:ls_cod_estado_fall,										:ls_cod_tamano_cuerpo,										:ls_cod_obs_cuerpo,										:ls_causa_fallecimiento,										:ll_codigo_funeraria,										:ls_fono_funeraria,									:ls_cod_registro_pase,									:ls_registro_pase,									:ldt_fecha_pase_fall,							:ll_anno_pase,									:ls_sexo_fallecido,										:ls_pase_sepultacion,										:ls_nom_fall,													:ls_ap_pat_fall,												:ls_ap_mat_fall,											:ldt_fec_def_fall,											:ldt_fec_nac_fall,													:ll_edad_fall
			FROM 		  "FICHA_SEPULTACION"  
			WHERE 		( "FICHA_SEPULTACION"."RUT_FALLECIDO" = :ll_rut ) AND  
							("FICHA_SEPULTACION"."ESTADO_REG" = 'P' OR  "FICHA_SEPULTACION"."ESTADO_REG" = 'G')  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'cod_estado_fallecido',ls_cod_estado_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'cod_tamano_cuerpo',ls_cod_tamano_cuerpo)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'cod_obs_cuerpo',ls_cod_obs_cuerpo)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'observacion_fallecido',ls_causa_fallecimiento)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'codigo_funeraria',ll_codigo_funeraria)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'fono_funeraria',ls_fono_funeraria)
//				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'cod_registro_pase',ls_cod_registro_pase)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'registro_pase',ls_registro_pase)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'fecha_pase',ldt_fecha_pase_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'anno_paso',ll_anno_pase)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'sexo_fallecido',ls_sexo_fallecido)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'pase_sepultacion',ls_pase_sepultacion)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'periodo_nacimiento',ls_periodo_nacimiento)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'nombre_fallecido',ls_nom_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'apellido_paterno_fall',ls_ap_pat_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'apellido_materno_fall',ls_ap_mat_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'fecha_defuncion',ldt_fec_def_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'fecha_nacimiento_fallecido',ldt_fec_nac_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'edad_fallecido',ll_edad_fall)
				tab_1.tabpage_1.dw_ant_fall.accepttext()
//			SELECT	"FALLECIDOS"."FEC_SEP"  
//			INTO 		:ldt_fec_sep_ult  
//			FROM 		"FALLECIDOS"  
//			WHERE 	"FALLECIDOS"."RUT" = :ll_rut    AND
//						( "FALLECIDOS"."ESTADO_REG" = 'A' )
//			USING		sqlca;
//			if sqlca.sqlcode=0 then
				ls_obs_pase			= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'pase_sepultacion')
				if not isnull(ls_obs_pase) and ls_obs_pase<>'' and ls_obs_pase<>'-' then
					ls_texto			= ', Fecha Sepultación Original del Fallecido fue el '+string(ldt_fec_sep_ult,'dd/mm/yyyy')
					ls_obs_pase		= ls_obs_pase + ls_texto
//					tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'pase_sepultacion',ls_obs_pase)
				else
					ls_texto			= 'Fecha Sepultación Original del Fallecido fue el '+string(ldt_fec_sep_ult,'dd/mm/yyyy')
//					tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'pase_sepultacion',ls_texto)
				end if
			end if
		end if
	end if
elseif ls_columna='fecha_pase' then
	ldt_fecha_pase		= this.getitemdatetime(this.getrow(),'fecha_pase')
	if not isnull(ldt_fecha_pase) then
//		if ldt_fecha_pase > ldt_fecha_sepult then
//			messagebox("Advertencia","Fecha Defunción Inválida, No bede ser Mayor a la Fecha de Traslado")
//		else
			ll_year_hoy		= year(date(ldt_fecha_pase))
			dw_ant_fall.setitem(dw_ant_fall.getrow(),'anno_paso',ll_year_hoy)
//		end if
	end if
	dw_ant_fall.accepttext()
	
elseif ls_columna='fecha_nacimiento_fallecido' then
	ldt_fecha_fall		= dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_nacimiento_fallecido')
	ldt_fec_def			= dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_defuncion')
	ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
	if ldt_fecha_fall > ldt_fecha_sepult then
		messagebox("Advertencia","Fecha Nacimiento Inválida, No bede ser Mayor a la Fecha de Traslado")
	else
		if not isnull(ldt_fecha_fall) then
			ll_year			= year(date(ldt_fecha_fall))
			ll_mes			= month(date(ldt_fecha_fall))
			ll_dia			= day(date(ldt_fecha_fall))
			if isnull(ldt_fec_def) then
				ll_year_hoy		= year(date(gdt_fec_sistema))
				ll_mes_hoy		= month(date(gdt_fec_sistema))
				ll_dia_hoy		= day(date(gdt_fec_sistema))
			else
				ll_year_hoy		= year(date(ldt_fec_def))
				ll_mes_hoy		= month(date(ldt_fec_def))
				ll_dia_hoy		= day(date(ldt_fec_def))
			end if	
			ll_edad			= ll_year_hoy - ll_year
			if (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy < ll_mes then
				ll_edad		= ll_edad - 1
			elseif (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy = ll_mes and ll_dia_hoy < ll_dia then
				ll_edad		= ll_edad - 1
			end if
			if ll_edad >= 0 then
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_edad)
				if ll_edad > 0 then 
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'periodo_nacimiento','A')
				else
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'periodo_nacimiento',ls_nulo)
				end if
				dw_ant_fall.accepttext()
			else
				messagebox("Advertencia","Fecha Nacimiento Fallecido Inválido")
			end if
		end if
	end if
	dw_ant_fall.accepttext()
end if
if ls_columna='sw_pase_sepultacion' then
	ll_sw_pase_sepultacion	= long(data)
	ls_mensaje_prov			= 'PASE PROVISORIO'
	if ll_sw_pase_sepultacion=0 then
		ls_obs_pase				= trim(this.getitemstring(this.getrow(),'pase_sepultacion'))
		if not isnull(ls_obs_pase) and ls_obs_pase <> '' then
			if mid(ls_obs_pase,1,15) <> 'PASE PROVISORIO' then
//				this.setitem(this.getrow(),'pase_sepultacion','PASE PROVISORIO '+ls_obs_pase)
			end if
		else
//			this.setitem(this.getrow(),'pase_sepultacion',ls_mensaje_prov)
		end if
	else
		ls_obs_pase				= trim(this.getitemstring(this.getrow(),'pase_sepultacion'))
		if not isnull(ls_obs_pase) then
			if len(ls_obs_pase) = len(ls_mensaje_prov) then
				this.setitem(this.getrow(),'pase_sepultacion','')
			else
				if mid(ls_obs_pase,1,15) = 'PASE PROVISORIO' then
					ls_obs_pase		= trim(mid(ls_obs_pase,16))
				end if
//				this.setitem(this.getrow(),'pase_sepultacion',ls_obs_pase)
			end if
		end if
	end if
end if
if ls_columna='cod_tamano_cuerpo' then
	ls_tamano		=  this.getitemstring(this.getrow(),'cod_tamano_cuerpo')
	if ls_tamano='N' then
		this.setitem(this.getrow(),'cod_obs_cuerpo',ls_nulo)
		this.accepttext()
	end if
end if
if ls_columna='fecha_defuncion' then
	ldt_fecha_defun	= this.getitemdatetime(this.getrow(),'fecha_defuncion')
	ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
	if not isnull(ldt_fecha_defun) then
		if ldt_fecha_defun > ldt_fecha_sepult then
			messagebox("Advertencia","Fecha Defunción Inválida, No bede ser Mayor a la Fecha de Traslado")
		end if
	end if
end if
if ls_columna='periodo_nacimiento' then
	ls_periodo		= this.getitemstring(this.getrow(),'periodo_nacimiento')
	if ls_periodo='A' then
		ldt_fec_ini		= RelativeDate(today(), -365)
		ld_fecha_fall	= date(this.getitemdatetime(this.getrow(),'fecha_nacimiento_fallecido'))
		if ld_fecha_fall > ldt_fec_ini then
			messagebox("Advertencia","No es Posible Ingresar Tipo de Periodo, Fecha Ingresar es Menor a UN Año")
		end if
	end if
end if
this.accepttext()
end event

event clicked;String	ls_estado,ls_columna,ls_fecha,ls_dv,ls_nulo,ls_estado_reg
Datetime	ldt_fecha_pase,ldt_fecha_fall,ldt_fecha_defun,ldt_nulo,ldt_fecha_sepult,ldt_fec_def
Long		ll_year_hoy,ll_year,ll_mes,ll_dia,ll_mes_hoy,ll_dia_hoy,ll_edad,ll_rut,ll_nulo,ll_row

Setnull(ldt_nulo);setnull(ll_nulo);Setnull(ls_nulo)
ll_row							= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
ls_estado						= this.getitemstring(this.getrow(),'c_estado')
ll_rut							= this.getitemnumber(this.getrow(),'rut_fallecido')
ls_dv								= this.getitemstring(this.getrow(),'dv_fallecido')
ls_estado_reg					= this.getitemstring(this.getrow(),'estado_reg')
if ls_estado_reg<>'G' and ls_estado_reg<>'A' then
	if ls_estado='N' and ll_rut>0 and not isnull(ls_dv) then
		ls_columna					= dwo.name
		CHOOSE CASE ls_columna
			CASE 'p_2'
				ls_fecha				= string(date(dw_ant_fall.getitemdatetime(this.getrow(),'fecha_defuncion')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ant_fall.setitem(1,'fecha_defuncion',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha			= trim(Message.StringParm)
					dw_ant_fall.setitem(1,'fecha_defuncion',date(ls_fecha))
				END IF
				ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
				ldt_fecha_defun	= this.getitemdatetime(this.getrow(),'fecha_defuncion')
				if not isnull(ldt_fecha_defun) then
					if ldt_fecha_defun > ldt_fecha_sepult then
						messagebox("Advertencia","Fecha Defunción Inválida, No bede ser Mayor a la Fecha de Traslado")
						dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_defuncion',ldt_nulo)
					end if
				end if
				
			CASE 'p_4'
				ls_fecha				= string(date(dw_ant_fall.getitemdatetime(this.getrow(),'fecha_pase')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ant_fall.setitem(1,'fecha_pase',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha			= trim(Message.StringParm)
					dw_ant_fall.setitem(1,'fecha_pase',date(ls_fecha))
				END IF
				ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
				ldt_fecha_pase		= this.getitemdatetime(this.getrow(),'fecha_pase')
				ldt_fecha_defun	= this.getitemdatetime(this.getrow(),'fecha_pase')
				if ldt_fecha_defun > ldt_fecha_sepult then
					messagebox("Advertencia","Fecha Defunción Inválida, No bede ser Mayor a la Fecha de Traslado")
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_pase',ldt_nulo)
					dw_ant_fall.setcolumn('fecha_pase')
				else
					ll_year_hoy		= year(date(ldt_fecha_pase))
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'anno_paso',ll_year_hoy)
					dw_ant_fall.accepttext()
				end if
				
			CASE 'p_1'
				ls_fecha				= string(date(dw_ant_fall.getitemdatetime(this.getrow(),'fecha_nacimiento_fallecido')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ant_fall.setitem(1,'fecha_nacimiento_fallecido',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha			= trim(Message.StringParm)
					dw_ant_fall.setitem(1,'fecha_nacimiento_fallecido',date(ls_fecha))
				END IF
				ldt_fecha_fall		= dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_nacimiento_fallecido')
				ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
				if ldt_fecha_defun > ldt_fecha_sepult then
					messagebox("Advertencia","Fecha Nacimiento Inválida, No bede ser Mayor a la Fecha de Traslado")
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fallecido',ldt_nulo)
					dw_ant_fall.setcolumn('fecha_nacimiento_fallecido')
				else
					if not isnull(ldt_fecha_fall) then
						ldt_fec_def		= dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_defuncion')
						if isnull(ldt_fec_def) then
							ll_year_hoy		= year(date(gdt_fec_sistema))
							ll_mes_hoy		= month(date(gdt_fec_sistema))
							ll_dia_hoy		= day(date(gdt_fec_sistema))
						else
							ll_year_hoy		= year(date(ldt_fec_def))
							ll_mes_hoy		= month(date(ldt_fec_def))
							ll_dia_hoy		= day(date(ldt_fec_def))
						end if
						ll_year			= year(date(ldt_fecha_fall))
						ll_mes			= month(date(ldt_fecha_fall))
						ll_dia			= day(date(ldt_fecha_fall))
						ll_edad			= ll_year_hoy - ll_year
						if (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy < ll_mes then
							ll_edad		= ll_edad - 1
						elseif (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy = ll_mes and ll_dia_hoy < ll_dia then
							ll_edad		= ll_edad - 1
						end if
						if ll_edad >= 0 then
							dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_edad)
							if ll_edad > 0 then 
								dw_ant_fall.setitem(dw_ant_fall.getrow(),'periodo_nacimiento','A')
							else
								dw_ant_fall.setitem(dw_ant_fall.getrow(),'periodo_nacimiento',ls_nulo)
							end if
							dw_ant_fall.accepttext()
						end if
					end if
				end if
				dw_ant_fall.accepttext()
		END CHOOSE
	end if
end if
end event

event itemfocuschanged;String	ls_columna,ls_dv,ls_nulo,ls_periodo
Long		ll_rut,ll_new,ll_year_hoy,ll_year,ll_mes,ll_dia,ll_mes_hoy,ll_dia_hoy,ll_edad,ll_nulo
Datetime	ldt_fecha_pase,ldt_fecha_fall,ldt_nulo,ldt_fecha_defun,ldt_fecha_sepult,ldt_fec_def
Date		ldt_fec_ini,ld_fecha_fall

if il_modif > 0 then
	if tab_1.tabpage_3.dw_ficha_sepult.getrow()>0 then
		this.accepttext()
		Setnull(ls_nulo);setnull(ldt_nulo);setnull(ll_nulo)
		ls_columna				= dwo.name 
		if ls_columna<>'rut_fallecido' or ls_columna<>'dv_fallecido' then
			ll_new				= this.getrow()
			ll_rut				= this.getitemnumber(this.getrow(),'rut_fallecido')
			ls_dv					= this.getitemstring(this.getrow(),'dv_fallecido')
			if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
				if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
					Setnull(ls_nulo)
	//				dw_ant_fall.reset()
	//				ll_new = dw_ant_fall.insertrow(0)
					dw_ant_fall.scrolltorow(ll_new)
					dw_ant_fall.setitem(ll_new,'dv_fallecido',ls_nulo)
					dw_ant_fall.accepttext()
					dw_ant_fall.setfocus()
					dw_ant_fall.setcolumn('dv_fallecido')
				end if
			end if
		end if
		if (ls_columna<>'sw_titular_fall' or ls_columna='sw_titular_fall') and il_dw_tit_fall=1 then
			il_dw_tit_fall		= 0
			tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'sw_titular_fall',1)
		end if
		if ls_columna='fecha_nacimiento_fallecido' or ls_columna<>'fecha_nacimiento_fallecido' then
			ldt_fecha_fall		= dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_nacimiento_fallecido')
			ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
			if ldt_fecha_fall > ldt_fecha_sepult then
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fallecido',ldt_nulo)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_nulo)
				dw_ant_fall.setcolumn('fecha_nacimiento_fallecido')
			else
				ll_year			= year(date(ldt_fecha_fall))
				ll_mes			= month(date(ldt_fecha_fall))
				ll_dia			= day(date(ldt_fecha_fall))
				ldt_fec_def		= dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_defuncion')
				if isnull(ldt_fec_def) then
					ll_year_hoy		= year(date(gdt_fec_sistema))
					ll_mes_hoy		= month(date(gdt_fec_sistema))
					ll_dia_hoy		= day(date(gdt_fec_sistema))
				else
					ll_year_hoy		= year(date(ldt_fec_def))
					ll_mes_hoy		= month(date(ldt_fec_def))
					ll_dia_hoy		= day(date(ldt_fec_def))
				end if
				ll_edad			= ll_year_hoy - ll_year
				if (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy < ll_mes then
					ll_edad		= ll_edad - 1
				elseif (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy = ll_mes and ll_dia_hoy < ll_dia then
					ll_edad		= ll_edad - 1
				end if
				if ll_edad < 0 then
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fallecido',ldt_nulo)
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_nulo)
					dw_ant_fall.setcolumn('fecha_nacimiento_fallecido')
				end if
			end if
		end if
		if ls_columna='fecha_defuncion' or ls_columna<>'fecha_defuncion' then
			ldt_fecha_defun	= this.getitemdatetime(this.getrow(),'fecha_defuncion')
			ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
			if ldt_fecha_defun > ldt_fecha_sepult then
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_defuncion',ldt_nulo)
				dw_ant_fall.setcolumn('fecha_defuncion')
			end if
		end if
	//	if ls_columna='fecha_pase' or ls_columna<>'fecha_pase' then
	//		ldt_fecha_defun	= this.getitemdatetime(this.getrow(),'fecha_pase')
	//		ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado')
	//		if ldt_fecha_defun > ldt_fecha_sepult then
	//			dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_pase',ldt_nulo)
	//			dw_ant_fall.setcolumn('fecha_pase')
	//		end if
	//	end if
		if ls_columna='periodo_nacimiento' or ls_columna<>'periodo_nacimiento' then
			ls_periodo		= this.getitemstring(this.getrow(),'periodo_nacimiento')
			if ls_periodo='A' then
				ldt_fec_ini		= RelativeDate(today(), -365)
				ld_fecha_fall	= date(this.getitemdatetime(this.getrow(),'fecha_nacimiento_fallecido'))
				if ld_fecha_fall > ldt_fec_ini then
					this.setitem(this.getrow(),'periodo_nacimiento',ls_nulo)
					this.setcolumn('edad_fallecido')
				end if
			end if
		end if
		dw_ant_fall.accepttext()
	end if
end if
end event

event rowfocuschanged;Long	ll_row
ll_row							= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3525
integer height = 2152
long backcolor = 67108864
string text = "  Aranceles"
long tabtextcolor = 33554432
string picturename = "premio_ag_ing_caja.bmp"
long picturemaskcolor = 536870912
st_4 st_4
dw_aranceles dw_aranceles
end type

on tabpage_4.create
this.st_4=create st_4
this.dw_aranceles=create dw_aranceles
this.Control[]={this.st_4,&
this.dw_aranceles}
end on

on tabpage_4.destroy
destroy(this.st_4)
destroy(this.dw_aranceles)
end on

type st_4 from statictext within tabpage_4
integer x = 59
integer y = 44
integer width = 2226
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Aranceles Sepultura"
boolean focusrectangle = false
end type

type dw_aranceles from datawindow within tabpage_4
integer x = 46
integer y = 152
integer width = 3479
integer height = 1980
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_aranceles_ficha_trasla"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string 	ls_columna,ls_cod_parentesco,ls_tipo_traslado,ls_destino,ls_cod_otro,ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6,ls_nulo,ls_dscto_1,&
			ls_fosa_comun
double 	ldb_valor_uf_dia,ldb_valor_arancel,ldb_valor_uf,ldb_valor_der,ldb_pago_1,ldb_pago_2,ldb_pago_3,ldb_pago_4,ldb_pago_5,ldb_pago_6,&
			ldb_total,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,ldb_monto_derecho_sep,ll_tot_pago_ori,ll_tot_pago_des,&
			ldb_monto_derecho_sep_des
datetime ldt_fecha_hoy 
Long		ll_cod_parque,ll_cod_parque_des,ll_sw_derecho,ll_nulo,ll_sw_pago_1,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,&
			ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6,ll_sw_derecha_sep

Setnull(ll_nulo);setnull(ls_nulo)
this.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
ls_columna 				= dwo.name
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
ls_tipo_traslado		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(dw_aranceles.getrow(),'tipo_traslado')
ls_destino				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(dw_aranceles.getrow(),'destino_parque')
if ls_columna = 'codigo_parentesco' then 
	ls_cod_parentesco	= dw_aranceles.getitemstring(dw_aranceles.getrow(),'codigo_parentesco')
	ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
	ll_cod_parque_des	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque_destino')
	ls_fosa_comun		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'estado_ctto_fosa')
	if isnull(ls_fosa_comun) then ls_fosa_comun=''
	if ll_cod_parque>0 then
		if not isnull(ls_cod_parentesco) or ls_cod_parentesco<>'' then
			SELECT	"TAB_UF"."VALOR_UF"  
			INTO 		:ldb_valor_uf_dia  
			FROM 	"TAB_UF"  
			WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'uf_dia',ldb_valor_uf_dia)
			end if
			dw_aranceles.accepttext()
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_derecho_sepult',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
			dw_aranceles.setitem(dw_aranceles.getrow(),'derecho_sepultacion_origen',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'derecho_sepultacion_destino',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
			
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d1',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d1',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
			
//			if ls_tipo_traslado='E' and ls_destino='E' then
//				SELECT	"PARENTESCO"."ARANCEL_DERECHO_SEPULTACION"  
//				INTO 		:ldb_valor_arancel  
//				FROM 	"PARENTESCO"  
//				WHERE  ( "PARENTESCO"."CODIGO" = :ls_cod_parentesco ) AND  
//						 ( "PARENTESCO"."COD_PARQUE" = :ll_cod_parque )   
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
////					ldb_valor_arancel		= 0 	// nuevo
//					if ls_fosa_comun <> 'F' then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'derecho_sepultacion_origen',ldb_valor_arancel)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_cancelar_origen',ldb_valor_arancel)
//					end if
//					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_derecho_sepult',0)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'derecho_sepultacion_destino',ldb_valor_arancel)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_cancelar_destino',ldb_valor_arancel)
//				end if
//			elseif ls_tipo_traslado='E' and ls_destino='S' then
			if ls_tipo_traslado='E' then
				dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',0)
				
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_arancel  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE ( "CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' ) AND  
							( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '15' )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if ls_destino='S' then
						dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1','15')
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',ldb_valor_arancel)
					else
						dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d1','15')
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',ldb_valor_arancel)
					end if
				end if
			else
				dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',0)
				
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_arancel  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE ( "CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' ) AND  
							( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '48' )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
//					if ls_destino='S' then
						dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1','48')
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',ldb_valor_arancel)
//					else
//						dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d1','48')
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',ldb_valor_arancel)
//					end if
				end if
			end if
			dw_aranceles.accepttext()
			wf_calculo_monto()
		end if
	else
		messagebox("Advertencia","Debe Ingresar Parque en Ficha de Traslado")
	end if
elseif ls_columna='sw_derecho_sepult' then
	ll_sw_derecho		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_derecho_sepult')
	ls_cod_parentesco	= dw_aranceles.getitemstring(dw_aranceles.getrow(),'codigo_parentesco')
	ls_fosa_comun		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'estado_ctto_fosa')
	ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
	if ll_cod_parque>0 and not isnull(ls_cod_parentesco) then
		if ll_sw_derecho=1 then
			SELECT	"PARENTESCO"."ARANCEL_DERECHO_SEPULTACION"  
			INTO 		:ldb_valor_arancel  
			FROM 	"PARENTESCO"  
			WHERE  ( "PARENTESCO"."CODIGO" = :ls_cod_parentesco ) AND  
					 ( "PARENTESCO"."COD_PARQUE" = :ll_cod_parque )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ldb_valor_arancel	= 0
				dw_aranceles.setitem(dw_aranceles.getrow(),'derecho_sepultacion_origen',ldb_valor_arancel)
				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
					dw_aranceles.setitem(dw_aranceles.getrow(),'derecho_sepultacion_destino',ldb_valor_arancel)
				end if
			end if
		else
			if ls_fosa_comun <> 'F' then
				dw_aranceles.setitem(dw_aranceles.getrow(),'derecho_sepultacion_origen',0)
			end if
			if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
				dw_aranceles.setitem(dw_aranceles.getrow(),'derecho_sepultacion_destino',0)
			end if
		end if
		wf_calculo_monto()
	end if
elseif ls_columna='pago_otro_1' then
	ls_fosa_comun		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'estado_ctto_fosa')
	ll_sw_pago_1		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
	ls_pago_1			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_1')
	if ll_sw_pago_1 = 0 and not isnull(ls_pago_1) then
		SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
		INTO 		:ldb_valor_uf  
		FROM 	"CUENTA_CONTABLE_OTROS"  
		WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_1 AND
					"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
					"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
		USING		sqlca;
		if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
		if sqlca.sqlcode=0 then
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',ldb_valor_uf)
//			if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') or ls_fosa_comun='F' then
//				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',ldb_valor_uf)
//				dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d1',ls_pago_1)
//			end if
		end if
		wf_calculo_monto()
	end if
	
elseif ls_columna='pago_otro_2' then
	ll_sw_pago_2		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
	ls_pago_2			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_2')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
	if ls_pago_1 = ls_pago_2 then
		messagebox("Advertencia","Detalle Pago Duplicado")
		dw_aranceles.setfocus()
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
		dw_aranceles.accepttext()
		dw_aranceles.setcolumn('pago_otro_2')
		wf_calculo_monto()
	else
		if ll_sw_pago_2 = 0 and not isnull(ls_pago_2) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_2 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',ldb_valor_uf)
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_pago_2)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if
	
elseif ls_columna='pago_otro_3' then
	ll_sw_pago_3		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
	ls_pago_3			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_3')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
	if ls_pago_1 = ls_pago_3 or ls_pago_2 = ls_pago_3 then
		messagebox("Advertencia","Detalle Pago Duplicado")
		dw_aranceles.setfocus()
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.accepttext()
		dw_aranceles.setcolumn('pago_otro_3')
		wf_calculo_monto()
	else
		if ll_sw_pago_3 = 0 and not isnull(ls_pago_3) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_3 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',ldb_valor_uf)
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_pago_3)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if

elseif ls_columna='pago_otro_4' then
	ll_sw_pago_4		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
	ls_pago_4			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_4')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
	if ls_pago_1 = ls_pago_4 or ls_pago_2 = ls_pago_4 or ls_pago_3 = ls_pago_4 then
		messagebox("Advertencia","Detalle Pago Duplicado")
		dw_aranceles.setfocus()
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.accepttext()
		dw_aranceles.setcolumn('pago_otro_4')
		wf_calculo_monto()
	else
		if ll_sw_pago_4 = 0 and not isnull(ls_pago_4) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_4 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',ldb_valor_uf)
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_pago_4)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if
	
elseif ls_columna='pago_otro_5' then
	ll_sw_pago_5		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
	ls_pago_5			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_5')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
	ls_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')
	if ls_pago_1 = ls_pago_5 or ls_pago_2 = ls_pago_5 or ls_pago_3 = ls_pago_5 or ls_pago_4 = ls_pago_5 then
		messagebox("Advertencia","Detalle Pago Duplicado")
		dw_aranceles.setfocus()
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.accepttext()
		dw_aranceles.setcolumn('pago_otro_5')
		wf_calculo_monto()
	else
		if ll_sw_pago_5 = 0 and not isnull(ls_pago_5) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_5 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',ldb_valor_uf)
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_pago_5)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if
	
elseif ls_columna='pago_otro_6' then
	ll_sw_pago_6		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')
	ls_pago_6			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_6')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
	ls_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')
	ls_pago_5			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_5')
	if ls_pago_1 = ls_pago_6 or ls_pago_2 = ls_pago_6 or ls_pago_3 = ls_pago_6 or ls_pago_4 = ls_pago_6 or ls_pago_5 = ls_pago_6 then
		messagebox("Advertencia","Detalle Pago Duplicado")
		dw_aranceles.setfocus()
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.accepttext()
		dw_aranceles.setcolumn('pago_otro_6')
		wf_calculo_monto()
	else
		if ll_sw_pago_6 = 0 and not isnull(ls_pago_6) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_6 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',ldb_valor_uf)
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_pago_6)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if
	
//	Valida Duplicado Descuento
elseif ls_columna='dscto_otro_1' then
	ll_sw_pago_1		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
	ls_pago_1			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_1')
	if wf_validar_detalle_dscto(ls_pago_1) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d1',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
		dw_aranceles.accepttext()
	else
		if ll_sw_pago_1 = 0 and not isnull(ls_pago_1) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_1 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',ldb_valor_uf )
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d1',ls_pago_1)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if
	
elseif ls_columna='dscto_otro_2' then
	ll_sw_pago_2		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
	ls_pago_2			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_2')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
	if wf_validar_detalle_dscto(ls_pago_2) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
		dw_aranceles.accepttext()
	else
		if ls_pago_1 = ls_pago_2 then
			messagebox("Advertencia","Detalle Descuento Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('dscto_otro_2')
			wf_calculo_monto()
		else
			if ll_sw_pago_2 = 0 and not isnull(ls_pago_2) then
				SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_uf  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_2 AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
				USING		sqlca;
				if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',ldb_valor_uf)
//					if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',ldb_valor_uf)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_pago_2)
//					end if
				end if
				wf_calculo_monto()
			end if
		end if
	end if
	
elseif ls_columna='dscto_otro_3' then
	ll_sw_pago_3		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
	ls_pago_3			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_3')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
	if wf_validar_detalle_dscto(ls_pago_3) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
		dw_aranceles.accepttext()
	else
		if ls_pago_1 = ls_pago_3 or ls_pago_2 = ls_pago_3 then
			messagebox("Advertencia","Detalle Descuento Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('dscto_otro_3')
			wf_calculo_monto()
		else
			if ll_sw_pago_3 = 0 and not isnull(ls_pago_3) then
				SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_uf  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_3 AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
				USING		sqlca;
				if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',ldb_valor_uf )
//					if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',ldb_valor_uf)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_pago_3)
//					end if
				end if
				wf_calculo_monto()
			end if
		end if
	end if
	
elseif ls_columna='dscto_otro_4' then
	ll_sw_pago_4		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
	ls_pago_4			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_4')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
	if wf_validar_detalle_dscto(ls_pago_4) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
		dw_aranceles.accepttext()
	else
		if ls_pago_1 = ls_pago_4 or ls_pago_2 = ls_pago_4 or ls_pago_3 = ls_pago_4 then
			messagebox("Advertencia","Detalle Descuento Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('dscto_otro_4')
			wf_calculo_monto()
		else
			if ll_sw_pago_4 = 0 and not isnull(ls_pago_4) then
				SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_uf  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_4 AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
				USING		sqlca;
				if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',ldb_valor_uf)
//					if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',ldb_valor_uf)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_pago_4)
//					end if
				end if
				wf_calculo_monto()
			end if
		end if
	end if
elseif ls_columna='dscto_otro_5' then
	ll_sw_pago_5		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	ls_pago_5			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_5')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
	ls_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
	if wf_validar_detalle_dscto(ls_pago_5) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
		dw_aranceles.accepttext()
	else
		if ls_pago_1 = ls_pago_5 or ls_pago_2 = ls_pago_5 or ls_pago_3 = ls_pago_5 or ls_pago_4 = ls_pago_5 then
			messagebox("Advertencia","Detalle Descuento Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('dscto_otro_5')
			wf_calculo_monto()
		else
			if ll_sw_pago_5 = 0 and not isnull(ls_pago_5) then
				SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_uf  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_5 AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
				USING		sqlca;
				if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',ldb_valor_uf )
//					if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',ldb_valor_uf)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_pago_5)
//					end if
				end if
				wf_calculo_monto()
			end if
		end if
	end if
elseif ls_columna='dscto_otro_6' then
	ll_sw_pago_6		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
	ls_pago_6			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_6')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
	ls_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
	ls_pago_5			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_5')
	if wf_validar_detalle_dscto(ls_pago_6) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
		dw_aranceles.accepttext()
	else
		if ls_pago_1 = ls_pago_6 or ls_pago_2 = ls_pago_6 or ls_pago_3 = ls_pago_6 or ls_pago_4 = ls_pago_6 or ls_pago_5 = ls_pago_6 then
			messagebox("Advertencia","Detalle Descuento Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('dscto_otro_6')
			wf_calculo_monto()
		else
			if ll_sw_pago_6 = 0 and not isnull(ls_pago_6) then
				SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_uf  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_6 AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
				USING		sqlca;
				if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',ldb_valor_uf)
//					if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',ldb_valor_uf)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_pago_6)
//					end if
				end if
				wf_calculo_monto()
			end if
		end if
	end if
	
//////////////////
elseif ls_columna='pago_otro_d1' then
	ll_sw_pago_1		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
	ls_pago_1			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_d1')
	if ll_sw_pago_1 = 0 and not isnull(ls_pago_1) then
		SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
		INTO 		:ldb_valor_uf  
		FROM 	"CUENTA_CONTABLE_OTROS"  
		WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_1 AND
					"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
					"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
		USING		sqlca;
		if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
		if sqlca.sqlcode=0 then
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',ldb_valor_uf)
//			if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',ldb_valor_uf)
//				dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d1',ls_pago_1)
//			end if
		end if
		wf_calculo_monto()
	end if
	
elseif ls_columna='pago_otro_d2' then
	ll_sw_pago_2		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
	ls_pago_2			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_d2')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d1')
	if ls_pago_1 = ls_pago_2 then
		messagebox("Advertencia","Detalle Pago Duplicado")
		dw_aranceles.setfocus()
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
		dw_aranceles.accepttext()
		dw_aranceles.setcolumn('pago_otro_d2')
		wf_calculo_monto()
	else
		if ll_sw_pago_2 = 0 and not isnull(ls_pago_2) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_2 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',ldb_valor_uf)
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_pago_2)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if
	
elseif ls_columna='pago_otro_d3' then
	ll_sw_pago_3		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
	ls_pago_3			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_d3')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d2')
	if ls_pago_1 = ls_pago_3 or ls_pago_2 = ls_pago_3 then
		messagebox("Advertencia","Detalle Pago Duplicado")
		dw_aranceles.setfocus()
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
		dw_aranceles.accepttext()
		dw_aranceles.setcolumn('pago_otro_d3')
		wf_calculo_monto()
	else
		if ll_sw_pago_3 = 0 and not isnull(ls_pago_3) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_3 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',ldb_valor_uf)
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_pago_3)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if

elseif ls_columna='pago_otro_d4' then
	ll_sw_pago_4		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
	ls_pago_4			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_d4')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d3')
	if ls_pago_1 = ls_pago_4 or ls_pago_2 = ls_pago_4 or ls_pago_3 = ls_pago_4 then
		messagebox("Advertencia","Detalle Pago Duplicado")
		dw_aranceles.setfocus()
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
		dw_aranceles.accepttext()
		dw_aranceles.setcolumn('pago_otro_d4')
		wf_calculo_monto()
	else
		if ll_sw_pago_4 = 0 and not isnull(ls_pago_4) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_4 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',ldb_valor_uf)
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_pago_4)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if
	
elseif ls_columna='pago_otro_d5' then
	ll_sw_pago_5		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
	ls_pago_5			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_d5')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d3')
	ls_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d4')
	if ls_pago_1 = ls_pago_5 or ls_pago_2 = ls_pago_5 or ls_pago_3 = ls_pago_5 or ls_pago_4 = ls_pago_5 then
		messagebox("Advertencia","Detalle Pago Duplicado")
		dw_aranceles.setfocus()
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
		dw_aranceles.accepttext()
		dw_aranceles.setcolumn('pago_otro_d5')
		wf_calculo_monto()
	else
		if ll_sw_pago_5 = 0 and not isnull(ls_pago_5) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_5 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',ldb_valor_uf)
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_pago_5)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if
	
elseif ls_columna='pago_otro_d6' then
	ll_sw_pago_6		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')
	ls_pago_6			= dw_aranceles.getitemString(dw_aranceles.getrow(),'pago_otro_d6')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d3')
	ls_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d4')
	ls_pago_5			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d5')
	if ls_pago_1 = ls_pago_6 or ls_pago_2 = ls_pago_6 or ls_pago_3 = ls_pago_6 or ls_pago_4 = ls_pago_6 or ls_pago_5 = ls_pago_6 then
		messagebox("Advertencia","Detalle Pago Duplicado")
		dw_aranceles.setfocus()
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
		dw_aranceles.accepttext()
		dw_aranceles.setcolumn('pago_otro_d6')
		wf_calculo_monto()
	else
		if ll_sw_pago_6 = 0 and not isnull(ls_pago_6) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_6 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',ldb_valor_uf)
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_pago_6)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if
	
//	Valida Duplicado Descuento
elseif ls_columna='dscto_otro_d1' then
	ll_sw_pago_1		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
	ls_pago_1			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_d1')
	if wf_validar_detalle_dscto(ls_pago_1) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d1',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
		dw_aranceles.accepttext()
	else
		if ll_sw_pago_1 = 0 and not isnull(ls_pago_1) then
			SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_uf  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_1 AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
						"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
			if sqlca.sqlcode=0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',ldb_valor_uf )
//				if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',ldb_valor_uf)
//					dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d1',ls_pago_1)
//				end if
			end if
			wf_calculo_monto()
		end if
	end if
	
elseif ls_columna='dscto_otro_d2' then
	ll_sw_pago_2		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
	ls_pago_2			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_d2')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d1')
	if wf_validar_detalle_dscto(ls_pago_2) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
		dw_aranceles.accepttext()
	else
		if ls_pago_1 = ls_pago_2 then
			messagebox("Advertencia","Detalle Descuento Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('dscto_otro_d2')
			wf_calculo_monto()
		else
			if ll_sw_pago_2 = 0 and not isnull(ls_pago_2) then
				SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_uf  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_2 AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
				USING		sqlca;
				if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',ldb_valor_uf )
//					if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',ldb_valor_uf)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_pago_2)
//					end if
				end if
				wf_calculo_monto()
			end if
		end if
	end if
	
elseif ls_columna='dscto_otro_d3' then
	ll_sw_pago_3		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
	ls_pago_3			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_d3')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d2')
	if wf_validar_detalle_dscto(ls_pago_3) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
		dw_aranceles.accepttext()
	else
		if ls_pago_1 = ls_pago_3 or ls_pago_2 = ls_pago_3 then
			messagebox("Advertencia","Detalle Descuento Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('dscto_otro_d3')
			wf_calculo_monto()
		else
			if ll_sw_pago_3 = 0 and not isnull(ls_pago_3) then
				SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_uf  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_3 AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
				USING		sqlca;
				if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',ldb_valor_uf)
//					if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',ldb_valor_uf)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_pago_3)
//					end if
				end if
				wf_calculo_monto()
			end if
		end if
	end if
	
elseif ls_columna='dscto_otro_d4' then
	ll_sw_pago_4		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
	ls_pago_4			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_d4')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d3')
	if wf_validar_detalle_dscto(ls_pago_4) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
		dw_aranceles.accepttext()
	else
		if ls_pago_1 = ls_pago_4 or ls_pago_2 = ls_pago_4 or ls_pago_3 = ls_pago_4 then
			messagebox("Advertencia","Detalle Descuento Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('dscto_otro_d4')
			wf_calculo_monto()
		else
			if ll_sw_pago_4 = 0 and not isnull(ls_pago_4) then
				SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_uf  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_4 AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
				USING		sqlca;
				if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4', ldb_valor_uf )
//					if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',ldb_valor_uf)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_pago_4)
//					end if
				end if
				wf_calculo_monto()
			end if
		end if
	end if
elseif ls_columna='dscto_otro_d5' then
	ll_sw_pago_5		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	ls_pago_5			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_d5')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d3')
	ls_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d4')
	if wf_validar_detalle_dscto(ls_pago_5) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
		dw_aranceles.accepttext()
	else
		if ls_pago_1 = ls_pago_5 or ls_pago_2 = ls_pago_5 or ls_pago_3 = ls_pago_5 or ls_pago_4 = ls_pago_5 then
			messagebox("Advertencia","Detalle Descuento Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('dscto_otro_d5')
			wf_calculo_monto()
		else
			if ll_sw_pago_5 = 0 and not isnull(ls_pago_5) then
				SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_uf  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_5 AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
				USING		sqlca;
				if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',ldb_valor_uf )
//					if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',ldb_valor_uf)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_pago_5)
//					end if
				end if
				wf_calculo_monto()
			end if
		end if
	end if
elseif ls_columna='dscto_otro_d6' then
	ll_sw_pago_6		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
	ls_pago_6			= dw_aranceles.getitemString(dw_aranceles.getrow(),'dscto_otro_d6')
	
	ls_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d1')
	ls_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d2')
	ls_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d3')
	ls_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d4')
	ls_pago_5			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d5')
	if wf_validar_detalle_dscto(ls_pago_6) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
//		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
		dw_aranceles.accepttext()
	else
		if ls_pago_1 = ls_pago_6 or ls_pago_2 = ls_pago_6 or ls_pago_3 = ls_pago_6 or ls_pago_4 = ls_pago_6 or ls_pago_5 = ls_pago_6 then
			messagebox("Advertencia","Detalle Descuento Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('dscto_otro_d6')
			wf_calculo_monto()
		else
			if ll_sw_pago_6 = 0 and not isnull(ls_pago_6) then
				SELECT	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_uf  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_6 AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' AND
							"CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'S'
				USING		sqlca;
				if isnull(ldb_valor_uf) or ldb_valor_uf=0 then ldb_valor_uf=0
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',ldb_valor_uf)
//					if ls_tipo_traslado='I' or (ls_tipo_traslado='E' and ls_destino='E') then
//						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',ldb_valor_uf)
//						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_pago_6)
//					end if
				end if
				wf_calculo_monto()
			end if
		end if
	end if

elseif ls_columna='sw_pago_liberado' then
	ll_sw_derecho								= long(data)
	if ll_sw_derecho=0 then
		ll_sw_derecha_sep					= dw_aranceles.getitemnumber(1,'sw_derecho_sepult')
		if ll_sw_derecha_sep = 0 then
			ldb_monto_derecho_sep			= dw_aranceles.getitemnumber(1,'derecho_sepultacion_origen')
			ldb_monto_derecho_sep_des	= dw_aranceles.getitemnumber(1,'derecho_sepultacion_destino')
			if ldb_monto_derecho_sep > 0 then
				dw_aranceles.setitem(1,'sw_dscto_1',0)
				dw_aranceles.setitem(1,'dscto_otro_1','122')
				dw_aranceles.setitem(1,'monto_dscto_1',ldb_monto_derecho_sep)
				dw_aranceles.accepttext()
			end if
			if ldb_monto_derecho_sep_des > 0 then
				dw_aranceles.setitem(1,'sw_dscto_1',0)
				dw_aranceles.setitem(1,'dscto_otro_d1','122')
				dw_aranceles.setitem(1,'monto_dscto_d1',ldb_monto_derecho_sep_des )
				dw_aranceles.accepttext()
			end if
		else
			messagebox("Advertencia","Recuerde Seleccionar Descuento Correspondientes")
		end if
	else
		dw_aranceles.setitem(1,'sw_dscto_1',1)
		dw_aranceles.setitem(1,'sw_dscto_2',1)
		dw_aranceles.setitem(1,'sw_dscto_3',1)
		dw_aranceles.setitem(1,'sw_dscto_4',1)
		dw_aranceles.setitem(1,'sw_dscto_5',1)
		dw_aranceles.setitem(1,'sw_dscto_6',1)
		dw_aranceles.setitem(1,'dscto_otro_1',ls_nulo)
		dw_aranceles.setitem(1,'dscto_otro_2',ls_nulo)
		dw_aranceles.setitem(1,'dscto_otro_3',ls_nulo)
		dw_aranceles.setitem(1,'dscto_otro_4',ls_nulo)
		dw_aranceles.setitem(1,'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(1,'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(1,'monto_dscto_1',0)
		dw_aranceles.setitem(1,'monto_dscto_2',0)
		dw_aranceles.setitem(1,'monto_dscto_3',0)
		dw_aranceles.setitem(1,'monto_dscto_4',0)
		dw_aranceles.setitem(1,'monto_dscto_5',0)
		dw_aranceles.setitem(1,'monto_dscto_6',0)
		
		dw_aranceles.setitem(1,'dscto_otro_d1',ls_nulo)
		dw_aranceles.setitem(1,'dscto_otro_d2',ls_nulo)
		dw_aranceles.setitem(1,'dscto_otro_d3',ls_nulo)
		dw_aranceles.setitem(1,'dscto_otro_d4',ls_nulo)
		dw_aranceles.setitem(1,'dscto_otro_d5',ls_nulo)
		dw_aranceles.setitem(1,'dscto_otro_d6',ls_nulo)
		dw_aranceles.setitem(1,'monto_dscto_d1',0)
		dw_aranceles.setitem(1,'monto_dscto_d2',0)
		dw_aranceles.setitem(1,'monto_dscto_d3',0)
		dw_aranceles.setitem(1,'monto_dscto_d4',0)
		dw_aranceles.setitem(1,'monto_dscto_d5',0)
		dw_aranceles.setitem(1,'monto_dscto_d6',0)
		dw_aranceles.accepttext()
	end if
	wf_calculo_monto()

end if
if ls_columna='derecho_sepultacion_origen' or ls_columna='monto_otro_1' or ls_columna='monto_otro_2' or 	ls_columna='monto_otro_3' or ls_columna='monto_otro_4' or &
	ls_columna='monto_otro_5' or 	ls_columna='monto_otro_6' or ls_columna='monto_otro_d1' or ls_columna='monto_otro_d2' or 	ls_columna='monto_otro_d3' or &
	ls_columna='monto_otro_d4' or ls_columna='monto_otro_d5' or 	ls_columna='monto_otro_d6' or ls_columna='dscto_otro_1' or ls_columna='dscto_otro_2' or &
	ls_columna='dscto_otro_3' or ls_columna='dscto_otro_4' or ls_columna='dscto_otro_5' or 	ls_columna='dscto_otro_6' or ls_columna='dscto_otro_d1' or ls_columna='dscto_otro_d2' or &
	ls_columna='dscto_otro_d3' or ls_columna='dscto_otro_d4' or ls_columna='dscto_otro_d5' or ls_columna='dscto_otro_d6' or ls_columna='derecho_sepultacion_destino' then
	
	wf_calculo_monto()
end if

if ls_columna='sw_derecho_sepult' then
	ll_sw_derecho		= long(data)	//dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_derecho_sepult')
	if ll_sw_derecho = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'derecho_sepultacion_origen',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'derecho_sepultacion_destino',0)
		wf_calculo_monto()
	end if
elseif ls_columna='sw_pago_1' then
	ll_sw_pago_1		= long(data)	//dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
	if ll_sw_pago_1 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',0)
		wf_calculo_monto()
	end if
elseif ls_columna='sw_pago_2'  then
	ll_sw_pago_2		= long(data)
	if ll_sw_pago_2 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',0)
		wf_calculo_monto()
	end if
elseif 	ls_columna='sw_pago_3' then
	ll_sw_pago_3		= long(data)
	if ll_sw_pago_3 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
		wf_calculo_monto()
	end if
elseif ls_columna='sw_pago_4' then
	ll_sw_pago_4		= long(data)
	if ll_sw_pago_4 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
		wf_calculo_monto()
	end if
elseif ls_columna='sw_pago_5' then
	ll_sw_pago_5		= long(data)
	if ll_sw_pago_5 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
		wf_calculo_monto()
	end if	
elseif ls_columna='sw_pago_6' then
	ll_sw_pago_6		= long(data)
	if ll_sw_pago_6 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
		wf_calculo_monto()
	end if	
elseif ls_columna='sw_dscto_1' then
	ll_sw_dscto_1		= long(data)
	if ll_sw_dscto_1 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',0)
		wf_calculo_monto()
	end if	
elseif ls_columna='sw_dscto_2' then
	ll_sw_dscto_2		= long(data)
	if ll_sw_dscto_2 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',0)
		wf_calculo_monto()
	end if	
elseif ls_columna='sw_dscto_3' then
	ll_sw_dscto_3		= long(data)
	if ll_sw_dscto_3 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',0)
		wf_calculo_monto()
	end if	
elseif ls_columna='sw_dscto_4' then
	ll_sw_dscto_4		= long(data)
	if ll_sw_dscto_4 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',0)
		wf_calculo_monto()
	end if	
elseif ls_columna='sw_dscto_5' then
	ll_sw_dscto_5		= long(data)
	if ll_sw_dscto_5 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',0)
		wf_calculo_monto()
	end if	
elseif ls_columna='sw_dscto_6'  then
	ll_sw_dscto_6		= long(data)
	if ll_sw_dscto_6 = 1 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',0)
		wf_calculo_monto()
	end if	
end if
ll_sw_dscto_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
ll_sw_dscto_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
ll_sw_dscto_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
ll_sw_dscto_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
ll_sw_dscto_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
ll_sw_dscto_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
ll_tot_pago_ori			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_total_ori')
ll_tot_pago_des		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_total_des')
if ls_columna='monto_dscto_1' then
	ldb_dscto_1			= long(data)	//dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
	if ll_sw_dscto_1 = 0 and ldb_dscto_1 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_1')
	elseif ll_tot_pago_ori < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_1')
	end if
	il_modif1 ++;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ls_columna='monto_dscto_2' then
	ldb_dscto_2			= long(data)
	if ll_sw_dscto_2 = 0 and ldb_dscto_2 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_2')
	elseif ll_tot_pago_ori < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_2')
	end if
	il_modif1=0;il_modif2 ++;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ls_columna='monto_dscto_3' then
	ldb_dscto_3			= long(data)
	if ll_sw_dscto_3 = 0 and ldb_dscto_3 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_3')
	elseif ll_tot_pago_ori < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_3')
	end if
	il_modif1=0;il_modif2=0;il_modif3 ++;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ls_columna='monto_dscto_4' then
	ldb_dscto_4			= long(data)
	if ll_sw_dscto_4 = 0 and ldb_dscto_4 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_4')
	elseif ll_tot_pago_ori < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_4')
	end if
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4 ++;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ls_columna='monto_dscto_5' then
	ldb_dscto_5			= long(data)
	if ll_sw_dscto_5 = 0 and ldb_dscto_5 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_5')
	elseif ll_tot_pago_ori < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_5')
	end if
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5 ++;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ls_columna='monto_dscto_6' then
	ldb_dscto_6			= long(data)
	if ll_sw_dscto_6 = 0 and ldb_dscto_6 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_6')
	elseif ll_tot_pago_ori < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_6')
	end if
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6 ++;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ls_columna='monto_dscto_d1' then
	ldb_dscto_1			= long(data)	//dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
	if ll_sw_dscto_1 = 0 and ldb_dscto_1 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d1')
	elseif ll_tot_pago_des < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d1')
	end if
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1 ++;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ls_columna='monto_dscto_d2' then
	ldb_dscto_2			= long(data)
	if ll_sw_dscto_2 = 0 and ldb_dscto_2 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d2')
	elseif ll_tot_pago_des < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d2')
	end if
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2 ++;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ls_columna='monto_dscto_d3' then
	ldb_dscto_3			= long(data)
	if ll_sw_dscto_3 = 0 and ldb_dscto_3 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d3')
	elseif ll_tot_pago_des < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d3')
	end if
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3 ++;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ls_columna='monto_dscto_d4' then
	ldb_dscto_4			= long(data)
	if ll_sw_dscto_4 = 0 and ldb_dscto_4 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d4')
	elseif ll_tot_pago_des < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d4')
	end if
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4 ++;il_modifd5=0;il_modifd6=0
elseif ls_columna='monto_dscto_d5' then
	ldb_dscto_5			= long(data)
	if ll_sw_dscto_5 = 0 and ldb_dscto_5 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d5')
	elseif ll_tot_pago_des < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d5')
	end if
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5 ++;il_modifd6=0
elseif ls_columna='monto_dscto_d6' then
	ldb_dscto_6			= long(data)
	if ll_sw_dscto_6 = 0 and ldb_dscto_6 <= 0 then
		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
		wf_calculo_monto()
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d6')
	elseif ll_tot_pago_des < 0 then
		messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
		dw_aranceles.setfocus()
		dw_aranceles.setcolumn('monto_dscto_d6')
	end if
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6 ++
end if
dw_aranceles.accepttext()
end event

event itemfocuschanged;String		ls_columna,ls_nulo,ls_cod_pago_1,ls_cod_pago_2,ls_cod_pago_3,ls_cod_pago_4,ls_cod_pago_5,ls_cod_pago_6,ls_cod_dscto_1,ls_cod_dscto_2,ls_cod_dscto_3,ls_cod_dscto_4,&
			ls_cod_dscto_5,ls_cod_dscto_6,ls_cod_pago_d1,ls_cod_pago_d2,ls_cod_pago_d3,ls_cod_pago_d4,ls_cod_pago_d5,ls_cod_pago_d6,ls_cod_dscto_d1,ls_cod_dscto_d2,&
			ls_cod_dscto_d3,ls_cod_dscto_d4,ls_cod_dscto_d5,ls_cod_dscto_d6
Long		ll_sw_pago_1,ll_sw_pago_anterior,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,&
			ll_sw_dscto_5,ll_sw_dscto_6,ll_sw_pago_d1,ll_sw_pago_d2,ll_sw_pago_d3,ll_sw_pago_d4,ll_sw_pago_d5,ll_sw_pago_d6,ll_sw_dscto_d1,ll_sw_dscto_d2,ll_sw_dscto_d3,&
			ll_sw_dscto_d4,ll_sw_dscto_d5,ll_sw_dscto_d6,ll_tot_pago_ori,ll_tot_pago_des
Double	ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,ldb_dscto_6

Setnull(ls_nulo)
dw_aranceles.accepttext()
ls_columna				= dwo.name	
ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
ll_sw_pago_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
ll_sw_pago_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
ll_sw_pago_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
ll_sw_pago_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
ll_sw_pago_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')

ll_sw_dscto_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
ll_sw_dscto_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
ll_sw_dscto_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
ll_sw_dscto_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
ll_sw_dscto_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
ll_sw_dscto_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')

ldb_dscto_1				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_1')
if ll_sw_dscto_1 = 0 and ldb_dscto_1 <= 0 then
//		messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
end if
ldb_dscto_2				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_2')
if ll_sw_dscto_2 = 0 and ldb_dscto_2 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
end if
ldb_dscto_3				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_3')
if ll_sw_dscto_3 = 0 and ldb_dscto_3 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
end if
ldb_dscto_4				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_4')
if ll_sw_dscto_4 = 0 and ldb_dscto_4 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
end if
ldb_dscto_5				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_5')
if ll_sw_dscto_5 = 0 and ldb_dscto_5 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
end if
ldb_dscto_6				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_6')
if ll_sw_dscto_6 = 0 and ldb_dscto_6 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
end if
ldb_dscto_1				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_d1')
if ll_sw_dscto_1 = 0 and ldb_dscto_1 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
end if
ldb_dscto_2				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_d2')
if ll_sw_dscto_2 = 0 and ldb_dscto_2 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
end if
ldb_dscto_3				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_d3')
if ll_sw_dscto_3 = 0 and ldb_dscto_3 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
end if
ldb_dscto_4				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_d4')
if ll_sw_dscto_4 = 0 and ldb_dscto_4 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
end if
ldb_dscto_5				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_d5')
if ll_sw_dscto_5 = 0 and ldb_dscto_5 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
end if
ldb_dscto_6				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_d6')
if ll_sw_dscto_6 = 0 and ldb_dscto_6 <= 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
end if
dw_aranceles.accepttext()
if ll_sw_pago_1 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_2 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_3 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_4 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_5 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_6 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
end if
if ll_sw_dscto_1 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_2 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_3 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_4 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_5 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_6 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
end if
//wf_actualizar_calculo(dw_aranceles.getrow())
ls_cod_pago_1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
ls_cod_pago_2		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
ls_cod_pago_3		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
ls_cod_pago_4		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')
ls_cod_pago_5		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_5')
ls_cod_pago_6		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_6')

ls_cod_dscto_1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
ls_cod_dscto_2		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
ls_cod_dscto_3		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
ls_cod_dscto_4		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
ls_cod_dscto_5		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_5')
ls_cod_dscto_6		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_6')

if ls_columna = 'pago_otro_1' and ll_sw_pago_1 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',0)
elseif ls_columna = 'pago_otro_2' and ll_sw_pago_2 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',0)
elseif ls_columna = 'pago_otro_3' and ll_sw_pago_3 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
elseif ls_columna = 'pago_otro_4' and ll_sw_pago_4 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
elseif ls_columna = 'pago_otro_5' and ll_sw_pago_5 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
elseif ls_columna = 'pago_otro_6' and ll_sw_pago_6 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
end if
	
if ls_columna = 'pago_dscto_1' and ll_sw_dscto_1 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
elseif ls_columna = 'pago_dscto_2' and ll_sw_dscto_2 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
elseif ls_columna = 'pago_dscto_3' and ll_sw_dscto_3 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
elseif ls_columna = 'pago_dscto_4' and ll_sw_dscto_4 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
elseif ls_columna = 'pago_dscto_5' and ll_sw_dscto_5 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
elseif ls_columna = 'pago_dscto_6' and ll_sw_dscto_6 = 1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
end if

if ls_cod_pago_1 = ls_cod_pago_2 and not isnull(ls_cod_pago_1) and not isnull(ls_cod_pago_2) then
//	messagebox("Advertencia","Detalle Pago Duplicado")
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
elseif ls_cod_pago_1 = ls_cod_pago_3  and not isnull(ls_cod_pago_1) and not isnull(ls_cod_pago_3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
elseif ls_cod_pago_1 = ls_cod_pago_4  and not isnull(ls_cod_pago_1) and not isnull(ls_cod_pago_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
elseif ls_cod_pago_1 = ls_cod_pago_5  and not isnull(ls_cod_pago_1) and not isnull(ls_cod_pago_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ls_cod_pago_1 = ls_cod_pago_6  and not isnull(ls_cod_pago_1) and not isnull(ls_cod_pago_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ls_cod_pago_2 = ls_cod_pago_3  and not isnull(ls_cod_pago_2) and not isnull(ls_cod_pago_3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
elseif ls_cod_pago_2 = ls_cod_pago_4  and not isnull(ls_cod_pago_2) and not isnull(ls_cod_pago_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
elseif ls_cod_pago_2 = ls_cod_pago_5  and not isnull(ls_cod_pago_2) and not isnull(ls_cod_pago_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ls_cod_pago_2 = ls_cod_pago_6  and not isnull(ls_cod_pago_2) and not isnull(ls_cod_pago_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ls_cod_pago_3 = ls_cod_pago_4  and not isnull(ls_cod_pago_3) and not isnull(ls_cod_pago_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
elseif ls_cod_pago_3 = ls_cod_pago_5  and not isnull(ls_cod_pago_3) and not isnull(ls_cod_pago_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ls_cod_pago_3 = ls_cod_pago_6  and not isnull(ls_cod_pago_3) and not isnull(ls_cod_pago_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ls_cod_pago_4 = ls_cod_pago_5  and not isnull(ls_cod_pago_4) and not isnull(ls_cod_pago_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ls_cod_pago_4 = ls_cod_pago_6  and not isnull(ls_cod_pago_4) and not isnull(ls_cod_pago_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ls_cod_pago_5 = ls_cod_pago_6  and not isnull(ls_cod_pago_5) and not isnull(ls_cod_pago_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
end if

ls_cod_pago_d1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d1')
ls_cod_pago_d2		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d2')
ls_cod_pago_d3		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d3')
ls_cod_pago_d4		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d4')
ls_cod_pago_d5		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d5')
ls_cod_pago_d6		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_d6')

ls_cod_dscto_d1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d1')
ls_cod_dscto_d2		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d2')
ls_cod_dscto_d3		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d3')
ls_cod_dscto_d4		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d4')
ls_cod_dscto_d5		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d5')
ls_cod_dscto_d6		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d6')

if ls_cod_pago_d1 = ls_cod_pago_d2 and not isnull(ls_cod_pago_d1) and not isnull(ls_cod_pago_d2) then
//	messagebox("Advertencia","Detalle Pago Duplicado")
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',0)
elseif ls_cod_pago_d1 = ls_cod_pago_d3  and not isnull(ls_cod_pago_d1) and not isnull(ls_cod_pago_d3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
elseif ls_cod_pago_d1 = ls_cod_pago_d4  and not isnull(ls_cod_pago_d1) and not isnull(ls_cod_pago_d4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
elseif ls_cod_pago_d1 = ls_cod_pago_d5  and not isnull(ls_cod_pago_d1) and not isnull(ls_cod_pago_d5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
elseif ls_cod_pago_d1 = ls_cod_pago_d6  and not isnull(ls_cod_pago_d1) and not isnull(ls_cod_pago_d6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
	
elseif ls_cod_pago_d2 = ls_cod_pago_d3  and not isnull(ls_cod_pago_d2) and not isnull(ls_cod_pago_d3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
elseif ls_cod_pago_d2 = ls_cod_pago_d4  and not isnull(ls_cod_pago_d2) and not isnull(ls_cod_pago_d4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
elseif ls_cod_pago_d2 = ls_cod_pago_d5  and not isnull(ls_cod_pago_d2) and not isnull(ls_cod_pago_d5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
elseif ls_cod_pago_d2 = ls_cod_pago_d6  and not isnull(ls_cod_pago_d2) and not isnull(ls_cod_pago_d6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
	
elseif ls_cod_pago_d3 = ls_cod_pago_d4  and not isnull(ls_cod_pago_d3) and not isnull(ls_cod_pago_d4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
elseif ls_cod_pago_d3 = ls_cod_pago_d5  and not isnull(ls_cod_pago_d3) and not isnull(ls_cod_pago_d5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
elseif ls_cod_pago_d3 = ls_cod_pago_d6  and not isnull(ls_cod_pago_d3) and not isnull(ls_cod_pago_d6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
	
elseif ls_cod_pago_d4 = ls_cod_pago_d5  and not isnull(ls_cod_pago_d4) and not isnull(ls_cod_pago_d5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
elseif ls_cod_pago_d4 = ls_cod_pago_d6  and not isnull(ls_cod_pago_d4) and not isnull(ls_cod_pago_d6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
elseif ls_cod_pago_d5 = ls_cod_pago_d6  and not isnull(ls_cod_pago_d5) and not isnull(ls_cod_pago_d6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
end if
///////////////////////
if ll_sw_pago_1=0 and isnull(ls_cod_pago_1) and isnull(ls_cod_pago_d1) and ls_columna <> 'sw_pago_1' and ls_columna <> 'pago_otro_1' and ls_columna <> 'monto_otro_1' and ls_columna <> 'pago_otro_d1' and ls_columna <> 'monto_otro_d1' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',0)
elseif ll_sw_pago_2=0 and isnull(ls_cod_pago_2) and isnull(ls_cod_pago_d2) and ls_columna <> 'sw_pago_2' and ls_columna <> 'pago_otro_2' and ls_columna <> 'monto_otro_2' and ls_columna <> 'pago_otro_d2' and ls_columna <> 'monto_otro_d2' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',0)
elseif ll_sw_pago_3=0 and isnull(ls_cod_pago_3) and isnull(ls_cod_pago_d3) and ls_columna <> 'sw_pago_3' and ls_columna <> 'pago_otro_3' and ls_columna <> 'monto_otro_3' and ls_columna <> 'pago_otro_d3' and ls_columna <> 'monto_otro_d3' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
elseif ll_sw_pago_4=0 and isnull(ls_cod_pago_4) and isnull(ls_cod_pago_d4) and ls_columna <> 'sw_pago_4' and ls_columna <> 'pago_otro_4' and ls_columna <> 'monto_otro_4' and ls_columna <> 'pago_otro_d4' and ls_columna <> 'monto_otro_d4' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
elseif ll_sw_pago_5=0 and isnull(ls_cod_pago_5) and isnull(ls_cod_pago_d5) and ls_columna <> 'sw_pago_5' and ls_columna <> 'pago_otro_5' and ls_columna <> 'monto_otro_5' and ls_columna <> 'pago_otro_d5' and ls_columna <> 'monto_otro_d5' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
elseif ll_sw_pago_6=0 and isnull(ls_cod_pago_6) and isnull(ls_cod_pago_d6) and ls_columna <> 'sw_pago_6' and ls_columna <> 'pago_otro_6' and ls_columna <> 'monto_otro_6' and ls_columna <> 'pago_otro_d6' and ls_columna <> 'monto_otro_d6' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
end if
if ls_cod_dscto_1 = ls_cod_dscto_2 and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_2) then
//	messagebox("Advertencia","Detalle Pago Duplicado")
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
elseif ls_cod_dscto_1 = ls_cod_dscto_3  and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
elseif ls_cod_dscto_1 = ls_cod_dscto_4  and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
elseif ls_cod_dscto_1 = ls_cod_dscto_5  and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
elseif ls_cod_dscto_1 = ls_cod_dscto_6  and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	
elseif ls_cod_dscto_2 = ls_cod_dscto_3  and not isnull(ls_cod_dscto_2) and not isnull(ls_cod_dscto_3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
elseif ls_cod_dscto_2 = ls_cod_dscto_4  and not isnull(ls_cod_dscto_2) and not isnull(ls_cod_dscto_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
elseif ls_cod_dscto_2 = ls_cod_dscto_5  and not isnull(ls_cod_dscto_2) and not isnull(ls_cod_dscto_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
elseif ls_cod_dscto_2 = ls_cod_dscto_6  and not isnull(ls_cod_dscto_2) and not isnull(ls_cod_dscto_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	
elseif ls_cod_dscto_3 = ls_cod_dscto_4  and not isnull(ls_cod_dscto_3) and not isnull(ls_cod_dscto_4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
elseif ls_cod_dscto_3 = ls_cod_dscto_5  and not isnull(ls_cod_dscto_3) and not isnull(ls_cod_dscto_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
elseif ls_cod_dscto_3 = ls_cod_dscto_6  and not isnull(ls_cod_dscto_3) and not isnull(ls_cod_dscto_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	
elseif ls_cod_dscto_4 = ls_cod_dscto_5  and not isnull(ls_cod_dscto_4) and not isnull(ls_cod_dscto_5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
elseif ls_cod_dscto_4 = ls_cod_dscto_6  and not isnull(ls_cod_dscto_4) and not isnull(ls_cod_dscto_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	
elseif ls_cod_dscto_5 = ls_cod_dscto_6  and not isnull(ls_cod_dscto_5) and not isnull(ls_cod_dscto_6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
end if

if ls_cod_dscto_d1 = ls_cod_dscto_d2 and not isnull(ls_cod_dscto_d1) and not isnull(ls_cod_dscto_d2) then
//	messagebox("Advertencia","Detalle Pago Duplicado")
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
elseif ls_cod_dscto_d1 = ls_cod_dscto_d3  and not isnull(ls_cod_dscto_d1) and not isnull(ls_cod_dscto_d3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
elseif ls_cod_dscto_d1 = ls_cod_dscto_d4  and not isnull(ls_cod_dscto_d1) and not isnull(ls_cod_dscto_d4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
elseif ls_cod_dscto_d1 = ls_cod_dscto_d5  and not isnull(ls_cod_dscto_d1) and not isnull(ls_cod_dscto_d5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
elseif ls_cod_dscto_d1 = ls_cod_dscto_d6  and not isnull(ls_cod_dscto_d1) and not isnull(ls_cod_dscto_d6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	
elseif ls_cod_dscto_d2 = ls_cod_dscto_d3  and not isnull(ls_cod_dscto_d2) and not isnull(ls_cod_dscto_d3) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
elseif ls_cod_dscto_d2 = ls_cod_dscto_d4  and not isnull(ls_cod_dscto_d2) and not isnull(ls_cod_dscto_d4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
elseif ls_cod_dscto_d2 = ls_cod_dscto_d5  and not isnull(ls_cod_dscto_d2) and not isnull(ls_cod_dscto_d5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
elseif ls_cod_dscto_d2 = ls_cod_dscto_d6  and not isnull(ls_cod_dscto_d2) and not isnull(ls_cod_dscto_d6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	
elseif ls_cod_dscto_d3 = ls_cod_dscto_d4  and not isnull(ls_cod_dscto_d3) and not isnull(ls_cod_dscto_d4) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
elseif ls_cod_dscto_d3 = ls_cod_dscto_d5  and not isnull(ls_cod_dscto_d3) and not isnull(ls_cod_dscto_d5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
elseif ls_cod_dscto_d3 = ls_cod_dscto_d6  and not isnull(ls_cod_dscto_d3) and not isnull(ls_cod_dscto_d6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	
elseif ls_cod_dscto_d4 = ls_cod_dscto_d5  and not isnull(ls_cod_dscto_d4) and not isnull(ls_cod_dscto_d5) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
elseif ls_cod_dscto_d4 = ls_cod_dscto_d6  and not isnull(ls_cod_dscto_d4) and not isnull(ls_cod_dscto_d6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	
elseif ls_cod_dscto_d5 = ls_cod_dscto_d6  and not isnull(ls_cod_dscto_d5) and not isnull(ls_cod_dscto_d6) then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
end if

if ll_sw_pago_1=0 and isnull(ls_cod_pago_1) and isnull(ls_cod_pago_d1) and ls_columna <> 'sw_pago_1' and ls_columna <> 'pago_otro_1' and ls_columna <> 'monto_otro_1' and ls_columna <> 'pago_otro_d1' and ls_columna <> 'monto_otro_d1' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d1',0)
elseif ll_sw_pago_2=0 and isnull(ls_cod_pago_2) and isnull(ls_cod_pago_d2) and ls_columna <> 'sw_pago_2' and ls_columna <> 'pago_otro_2' and ls_columna <> 'monto_otro_2' and ls_columna <> 'pago_otro_d2' and ls_columna <> 'monto_otro_d2' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',0)
elseif ll_sw_pago_3=0 and isnull(ls_cod_pago_3) and isnull(ls_cod_pago_d3) and ls_columna <> 'sw_pago_3' and ls_columna <> 'pago_otro_3' and ls_columna <> 'monto_otro_3' and ls_columna <> 'pago_otro_d3' and ls_columna <> 'monto_otro_d3' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
elseif ll_sw_pago_4=0 and isnull(ls_cod_pago_4) and isnull(ls_cod_pago_d4) and ls_columna <> 'sw_pago_4' and ls_columna <> 'pago_otro_4' and ls_columna <> 'monto_otro_4' and ls_columna <> 'pago_otro_d4' and ls_columna <> 'monto_otro_d4' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
elseif ll_sw_pago_5=0 and isnull(ls_cod_pago_5) and isnull(ls_cod_pago_d5) and ls_columna <> 'sw_pago_5' and ls_columna <> 'pago_otro_5' and ls_columna <> 'monto_otro_5' and ls_columna <> 'pago_otro_d5' and ls_columna <> 'monto_otro_d5' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
elseif ll_sw_pago_6=0 and isnull(ls_cod_pago_6) and isnull(ls_cod_pago_d6) and ls_columna <> 'sw_pago_6' and ls_columna <> 'pago_otro_6' and ls_columna <> 'monto_otro_6' and ls_columna <> 'pago_otro_d6' and ls_columna <> 'monto_otro_d6' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
end if
	
if ll_sw_dscto_1=0 and isnull(ls_cod_dscto_1) and isnull(ls_cod_dscto_d1) and ls_columna <> 'sw_dscto_1' and ls_columna <> 'dscto_otro_1' and ls_columna <> 'monto_dscto_1' and ls_columna <> 'dscto_otro_d1' and ls_columna <> 'monto_dscto_d1' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
elseif ll_sw_dscto_2=0 and isnull(ls_cod_dscto_2) and isnull(ls_cod_dscto_d2) and ls_columna <> 'sw_dscto_2' and ls_columna <> 'dscto_otro_2' and ls_columna <> 'monto_dscto_2' and ls_columna <> 'dscto_otro_d2' and ls_columna <> 'monto_dscto_d2' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
elseif ll_sw_dscto_3=0 and isnull(ls_cod_dscto_3) and isnull(ls_cod_dscto_d3) and ls_columna <> 'sw_dscto_3' and ls_columna <> 'dscto_otro_3' and ls_columna <> 'monto_dscto_3' and ls_columna <> 'dscto_otro_d3' and ls_columna <> 'monto_dscto_d3' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
elseif ll_sw_dscto_4=0 and isnull(ls_cod_dscto_4) and isnull(ls_cod_dscto_d4) and ls_columna <> 'sw_dscto_4' and ls_columna <> 'dscto_otro_4' and ls_columna <> 'monto_dscto_4' and ls_columna <> 'dscto_otro_d4' and ls_columna <> 'monto_dscto_d4' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
elseif ll_sw_dscto_5=0 and isnull(ls_cod_dscto_5) and isnull(ls_cod_dscto_d5) and ls_columna <> 'sw_dscto_5' and ls_columna <> 'dscto_otro_5' and ls_columna <> 'monto_dscto_5' and ls_columna <> 'dscto_otro_d5' and ls_columna <> 'monto_dscto_d5' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
elseif ll_sw_dscto_6=0 and isnull(ls_cod_dscto_6) and isnull(ls_cod_dscto_d6) and ls_columna <> 'sw_dscto_6' and ls_columna <> 'dscto_otro_6' and ls_columna <> 'monto_dscto_6' and ls_columna <> 'dscto_otro_d6' and ls_columna <> 'monto_dscto_d6' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
end if

dw_aranceles.accepttext()
ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
ll_sw_pago_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
ll_sw_pago_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
ll_sw_pago_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
ll_sw_pago_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
ll_sw_pago_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')

ll_sw_dscto_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
ll_sw_dscto_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
ll_sw_dscto_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
ll_sw_dscto_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
ll_sw_dscto_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
ll_sw_dscto_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
if ll_sw_pago_6 = 0 and ll_sw_pago_5=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
elseif ll_sw_pago_5 = 0 and ll_sw_pago_4=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
elseif ll_sw_pago_4 = 0 and ll_sw_pago_3=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
elseif ll_sw_pago_3 = 0 and ll_sw_pago_2=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
elseif ll_sw_pago_2 = 0 and ll_sw_pago_1=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_d6',0)
end if
if ll_sw_dscto_6 = 0 and ll_sw_dscto_5=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
elseif ll_sw_dscto_5 = 0 and ll_sw_dscto_4=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
elseif ll_sw_dscto_4 = 0 and ll_sw_dscto_3=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
elseif ll_sw_dscto_3 = 0 and ll_sw_dscto_2=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
elseif ll_sw_dscto_2 = 0 and ll_sw_dscto_1=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
end if
if not isnull(ls_cod_dscto_1) then
	if wf_validar_detalle_dscto(ls_cod_dscto_1) = 'N' then
	//	messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
	end if
end if
if not isnull(ls_cod_dscto_2) then
	if wf_validar_detalle_dscto(ls_cod_dscto_2) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	end if
end if
if not isnull(ls_cod_dscto_3) then
	if wf_validar_detalle_dscto(ls_cod_dscto_3) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	end if
end if
if not isnull(ls_cod_dscto_4) then
	if wf_validar_detalle_dscto(ls_cod_dscto_4) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	end if
end if
if not isnull(ls_cod_dscto_5) then
	if wf_validar_detalle_dscto(ls_cod_dscto_5) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	end if
end if
if not isnull(ls_cod_dscto_6) then
	if wf_validar_detalle_dscto(ls_cod_dscto_6) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	end if
end if
dw_aranceles.accepttext()

ls_cod_dscto_1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d1')
ls_cod_dscto_2		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d2')
ls_cod_dscto_3		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d3')
ls_cod_dscto_4		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d4')
ls_cod_dscto_5		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d5')
ls_cod_dscto_6		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_d6')
if not isnull(ls_cod_dscto_1) then
	if wf_validar_detalle_dscto(ls_cod_dscto_1) = 'N' then
	//	messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d1',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
	end if
end if
if not isnull(ls_cod_dscto_2) then
	if wf_validar_detalle_dscto(ls_cod_dscto_2) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d2',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
	end if
end if
if not isnull(ls_cod_dscto_3) then
	if wf_validar_detalle_dscto(ls_cod_dscto_3) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d3',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
	end if
end if
if not isnull(ls_cod_dscto_4) then
	if wf_validar_detalle_dscto(ls_cod_dscto_4) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d4',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
	end if
end if
if not isnull(ls_cod_dscto_5) then
	if wf_validar_detalle_dscto(ls_cod_dscto_5) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d5',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	end if
end if
if not isnull(ls_cod_dscto_6) then
	if wf_validar_detalle_dscto(ls_cod_dscto_6) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_d6',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	end if
end if
dw_aranceles.accepttext()

//wf_actualizar_calculo(dw_aranceles.getrow())	
ll_tot_pago_ori			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_total_ori')
ll_tot_pago_des		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_total_des')
if ll_tot_pago_ori < 0 and il_modif1 > 0 then
//	messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_1')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_ori < 0 and il_modif2 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_2')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_ori < 0 and il_modif3 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_3')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_ori < 0 and il_modif4 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_4')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_ori < 0 and il_modif5 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_5')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_ori < 0 and il_modif6 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_6')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_des < 0 and il_modifd1 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d1',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_d1')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_des < 0 and il_modifd2 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d2',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_d2')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_des < 0 and il_modifd3 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d3',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_d3')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_des < 0 and il_modifd4 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d4',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_d4')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_des < 0 and il_modifd5 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d5',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_d5')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
elseif ll_tot_pago_des < 0 and il_modifd6 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_d6',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_d6')
	il_modif1=0;il_modif2=0;il_modif3=0;il_modif4=0;il_modif5=0;il_modif6=0;il_modifd1=0;il_modifd2=0;il_modifd3=0;il_modifd4=0;il_modifd5=0;il_modifd6=0
end if

wf_calculo_monto()	
dw_aranceles.accepttext()
end event

event clicked;Long		ll_row,ll_nulo
String		ls_columna,ls_nulo

Setnull(ll_nulo);Setnull(ls_nulo)
ls_columna					= dwo.name
ll_row							= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
if ls_columna='p_1' then
	dw_aranceles.setitem(ll_row,'monto_otro_1',0)
	dw_aranceles.setitem(ll_row,'pago_otro_1',ls_nulo)
elseif ls_columna='p_2' then
	dw_aranceles.setitem(ll_row,'monto_otro_2',0)
	dw_aranceles.setitem(ll_row,'pago_otro_2',ls_nulo)
elseif ls_columna='p_3' then
	dw_aranceles.setitem(ll_row,'monto_otro_3',0)
	dw_aranceles.setitem(ll_row,'pago_otro_3',ls_nulo)
elseif ls_columna='p_4' then
	dw_aranceles.setitem(ll_row,'monto_otro_4',0)
	dw_aranceles.setitem(ll_row,'pago_otro_4',ls_nulo)
elseif ls_columna='p_5' then
	dw_aranceles.setitem(ll_row,'monto_otro_5',0)
	dw_aranceles.setitem(ll_row,'pago_otro_5',ls_nulo)
elseif ls_columna='p_6' then
	dw_aranceles.setitem(ll_row,'monto_otro_6',0)
	dw_aranceles.setitem(ll_row,'pago_otro_6',ls_nulo)
elseif ls_columna='p_7' then
	dw_aranceles.setitem(ll_row,'monto_otro_d1',0)
	dw_aranceles.setitem(ll_row,'pago_otro_d1',ls_nulo)
elseif ls_columna='p_8' then
	dw_aranceles.setitem(ll_row,'monto_otro_d2',0)
	dw_aranceles.setitem(ll_row,'pago_otro_d2',ls_nulo)
elseif ls_columna='p_9' then
	dw_aranceles.setitem(ll_row,'monto_otro_d3',0)
	dw_aranceles.setitem(ll_row,'pago_otro_d3',ls_nulo)
elseif ls_columna='p_10' then
	dw_aranceles.setitem(ll_row,'monto_otro_d4',0)
	dw_aranceles.setitem(ll_row,'pago_otro_d4',ls_nulo)
elseif ls_columna='p_11' then
	dw_aranceles.setitem(ll_row,'monto_otro_d5',0)
	dw_aranceles.setitem(ll_row,'pago_otro_d5',ls_nulo)
elseif ls_columna='p_12' then
	dw_aranceles.setitem(ll_row,'monto_otro_d6',0)
	dw_aranceles.setitem(ll_row,'pago_otro_d6',ls_nulo)

elseif ls_columna='p_d1' then
	dw_aranceles.setitem(ll_row,'monto_dscto_1',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_1',ls_nulo)
elseif ls_columna='p_d2' then
	dw_aranceles.setitem(ll_row,'monto_dscto_2',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_2',ls_nulo)
elseif ls_columna='p_d3' then
	dw_aranceles.setitem(ll_row,'monto_dscto_3',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_3',ls_nulo)
elseif ls_columna='p_d4' then
	dw_aranceles.setitem(ll_row,'mmonto_dscto_4',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_4',ls_nulo)
elseif ls_columna='p_d5' then
	dw_aranceles.setitem(ll_row,'monto_dscto_5',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_5',ls_nulo)
elseif ls_columna='p_d6' then
	dw_aranceles.setitem(ll_row,'monto_dscto_6',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_6',ls_nulo)
elseif ls_columna='p_d7' then
	dw_aranceles.setitem(ll_row,'monto_dscto_d1',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_d1',ls_nulo)
elseif ls_columna='p_d8' then
	dw_aranceles.setitem(ll_row,'monto_dscto_d2',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_d2',ls_nulo)
elseif ls_columna='p_d9' then
	dw_aranceles.setitem(ll_row,'monto_dscto_d3',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_d3',ls_nulo)
elseif ls_columna='p_d10' then
	dw_aranceles.setitem(ll_row,'monto_dscto_d4',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_d4',ls_nulo)
elseif ls_columna='p_d11' then
	dw_aranceles.setitem(ll_row,'monto_dscto_d5',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_d5',ls_nulo)
elseif ls_columna='p_d12' then
	dw_aranceles.setitem(ll_row,'monto_dscto_d6',0)
	dw_aranceles.setitem(ll_row,'dscto_otro_d6',ls_nulo)
end if
dw_aranceles.accepttext()
end event

event rowfocuschanged;Long	ll_row
ll_row							= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

type cb_cerrar from commandbutton within w_ingreso_ficha_traslado
integer x = 3401
integer y = 2380
integer width = 229
integer height = 100
integer taborder = 170
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_ficha_traslado)
end event

type gb_1 from groupbox within w_ingreso_ficha_traslado
integer x = 2930
integer y = 2332
integer width = 439
integer height = 156
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_ingreso_ficha_traslado
integer x = 626
integer y = 2332
integer width = 667
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_carta from commandbutton within w_ingreso_ficha_traslado
integer x = 1312
integer y = 2380
integer width = 352
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Carta &Autoriza"
end type

event clicked;Long		ll_row,ll_cod_parque,ll_resp,ll_tot_reg,ll_fila,ll_capacidad,ll_hora_sepult,ll_minuto_sepult,&
			ll_rut_tit_ori,ll_rut_fall,ll_funeraria,ll_count,ll_indi,ll_parque,ll_count_fall,&
			ll_cod_imagen,ll_count_reg,ll_rut_tit_des,ll_capacidad_origen,ll_row_reg
String		ls_tipo_traslado,ls_sector,ls_sepultura,ls_numero_tecni,ls_dv_tit_ori,ls_villa_tit_ori,&
			ls_tipo_via_tit_ori,ls_dir_tit_ori,ls_nro_dir_tit_ori,ls_dep_tit_ori,ls_block_tit_ori,&
			ls_ciudad_tit_ori,ls_comuna_tit_ori,ls_nombre_tit_ori,ls_ap_pat_tit_ori,ls_ap_mat_tit_ori,&
			ls_sector_tit_ori,ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_base,ls_serie,&
			ls_fono_titular,ls_fono_com_tit,ls_primera_sepultura,ls_nombre_tit_des,ls_ap_pat_tit_des,&
			ls_ap_mat_tit_des,ls_dir_tit_des,ls_nro_dir_tit_des,ls_dep_tit_des,ls_block_tit_des,ls_ciudad_tit_des,&
			ls_comuna_tit_des,ls_dv_tit_des,ls_tipo_via_tit_des,ls_base_des,ls_serie_des,ls_nom_comp_fall,&
			ls_sector_des, ls_sepultura_des,ls_tipo_tras,ls_destino_parque,ls_nom_fall,ls_pat_fall
datetime	ldt_fech_sepult,ldt_fecha_defuncion,ldt_fecha_nac_fall,ldt_fecha_hoy
Double	ll_numero,ll_numero_des

ll_row												= tab_1.tabpage_3.dw_ficha_sepult.getrow()
ls_tipo_tras										= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'tipo_traslado')
if ls_tipo_tras='I' then
	ls_sector										= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sector_destino')
	ls_sepultura									= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sepultura_destino')
	ll_cod_parque								= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_row,'cod_parque')
else
	ls_sector										= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sector_origen')
	ls_sepultura									= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sepultura_origen')
	ll_cod_parque								= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_row,'cod_parque')
end if
ls_nom_fall										= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_row,'nombre_fallecido')
ls_pat_fall										= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_row,'apellido_paterno_fall')

if tab_1.tabpage_3.dw_ficha_sepult.rowcount()>0 and ll_row>0 and not isnull(ls_sector) and not isnull(ls_sepultura) and ll_cod_parque>0 then
	if isvalid(w_carta_sepultacion) then close(w_carta_sepultacion)
	open(w_carta_sepultacion)
	w_carta_sepultacion.dw_parque.enabled	= false
	w_carta_sepultacion.dw_buscar.enabled	= false
	w_carta_sepultacion.pb_ok.enabled		= false
	w_carta_sepultacion.cb_limpiar.enabled	= false
	w_carta_sepultacion.cb_buscar.enabled	= false
	if w_carta_sepultacion.dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)>0 then
		w_carta_sepultacion.dw_parque.reset()
		w_carta_sepultacion.dw_parque.insertrow(0)
		w_carta_sepultacion.dw_parque.setitem(1,'cod_parque',ll_cod_parque)
		w_carta_sepultacion.dw_buscar.reset()
		w_carta_sepultacion.dw_buscar.getchild('sepultura',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.reset()
		idw_detalle6.insertrow(0)
		
		w_carta_sepultacion.dw_buscar.getchild('sector',idw_detalle5)
		idw_detalle5.reset()
		idw_detalle5.insertrow(0)
	
		w_carta_sepultacion.dw_buscar.insertrow(0)
		w_carta_sepultacion.dw_buscar.setitem(1,'sector',ls_sector)
		w_carta_sepultacion.dw_buscar.setitem(1,'sepultura',ls_sepultura)
		
		ll_row_reg	= w_carta_sepultacion.dw_lista.Find("nombre_fallecido='"+ls_nom_fall+"' and apellido_paterno_fall='"+ls_pat_fall+"'", 1, w_carta_sepultacion.dw_lista.RowCount())
		if ll_row_reg > 0 then
			w_carta_sepultacion.dw_lista.scrolltorow(ll_row_reg)
		end if
		w_carta_sepultacion.dw_lista.setfocus()		
	else
		close(w_carta_sepultacion)
		ll_resp						= messagebox("Advertencia","No Registra Carta Autorización, desea Crearla",exclamation!,YesNo!,2)
		if ll_resp=1 then
			ll_tot_reg				= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
			if ll_tot_reg>0 then
				DELETE FROM "FICHA_CARTA_SEPULTACION"  
				WHERE	( "FICHA_CARTA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
						( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
						( "FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				DELETE FROM "FICHA_GRABACION_LAPIDA"  
				WHERE 	( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
							( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
							( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_cod_parque )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if

				DECLARE x1 CURSOR FOR  
				SELECT	"FICHA_TRASLADO"."FECHA_TRASLADO",	"FICHA_TRASLADO"."HORA_FIJADA",	"FICHA_TRASLADO"."MINUTO_FIJADA",	"FICHA_TRASLADO"."CODIGO_FUNERARIA",	"FICHA_TRASLADO"."NOMBRE_FALLECIDO",	"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",	"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL",	"FICHA_TRASLADO"."FECHA_DEFUNCION",	"FICHA_TRASLADO"."FECHA_NACIMIENTO_FALLECIDO",	"FICHA_TRASLADO"."RUT_FALLECIDO",	"FICHA_TRASLADO"."DV_FALLECIDO",	"FICHA_TRASLADO"."BASE_ORIGEN",	"FICHA_TRASLADO"."SERIE_ORIGEN",	"FICHA_TRASLADO"."NUMERO_ORIGEN",	"FICHA_TRASLADO"."SECTOR_ORIGEN",	"FICHA_TRASLADO"."SEPULTURA_ORIGEN",	"FICHA_TRASLADO"."NUMERO_TECNICO_DESTINO",	"FICHA_TRASLADO"."CAPACIDAD_DESTINO",	"FICHA_TRASLADO"."COD_PARQUE",	"FICHA_TRASLADO"."NOMBRE_TITULAR_ORIGEN",	"FICHA_TRASLADO"."APELLIDO_PAT_TITULAR_ORIGEN",	"FICHA_TRASLADO"."APELLIDO_MAT_TITULAR_ORIGEN",	"FICHA_TRASLADO"."DIRECCION_TITULAR_ORIGEN",	"FICHA_TRASLADO"."NRO_DIREC_TITULAR_ORIGEN",	"FICHA_TRASLADO"."DPTO_DIREC_TITULAR_ORIGEN",	"FICHA_TRASLADO"."BLOCK_DIREC_TITULAR_ORIGEN",	"FICHA_TRASLADO"."COD_CIUDAD_TITULAR_ORIGEN",	"FICHA_TRASLADO"."COD_COMUNA_TITULAR_ORIGEN",	"FICHA_TRASLADO"."RUT_TITULAR_ORIGEN",	"FICHA_TRASLADO"."DV_TITULAR_ORIGEN",	"FICHA_TRASLADO"."TIPO_VIA_ORIGEN_TITULAR",	"FICHA_TRASLADO"."NOMBRE_TITULAR_DESTINO",	"FICHA_TRASLADO"."APELLIDO_PAT_TITULAR_DESTINO",	"FICHA_TRASLADO"."APELLIDO_MAT_TITULAR_DESTINO",	"FICHA_TRASLADO"."DIRECCION_TITULAR_DESTINO",	"FICHA_TRASLADO"."NRO_DIREC_TITULAR_DESTINO",	"FICHA_TRASLADO"."DEPTO_DIREC_TITULAR_DESTINO",	"FICHA_TRASLADO"."BLOCK_DIREC_TITULAR_DESTINO",	"FICHA_TRASLADO"."COD_CIUDAD_TITULAR_DESTINO",	"FICHA_TRASLADO"."COD_COMUNA_TITULAR_DESTINO",	"FICHA_TRASLADO"."RUT_TITULAR_DESTINO",	"FICHA_TRASLADO"."DV_TITULAR_DESTINO",	"FICHA_TRASLADO"."TIPO_VIA_DESTINO_TITULAR",	"FICHA_TRASLADO"."TIPO_TRASLADO",	"FICHA_TRASLADO"."FOLIO",	"FICHA_TRASLADO"."BASE_DESTINO",	"FICHA_TRASLADO"."SERIE_DESTINO",	"FICHA_TRASLADO"."NUMERO_DESTINO",	"FICHA_TRASLADO"."SECTOR_DESTINO",	"FICHA_TRASLADO"."SEPULTURA_DESTINO",	"FICHA_TRASLADO"."CAPACIDAD_ORIGEN",	"DESTINO_PARQUE"
				FROM 		"FICHA_TRASLADO"  
				WHERE  (("FICHA_TRASLADO"."SECTOR_ORIGEN" = :ls_sector ) AND  
						 ( "FICHA_TRASLADO"."SEPULTURA_ORIGEN" = :ls_sepultura ) AND  
						 ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque )) OR
						 (("FICHA_TRASLADO"."SECTOR_DESTINO" = :ls_sector ) AND  
						 ( "FICHA_TRASLADO"."SEPULTURA_DESTINO" = :ls_sepultura ) AND  
						 ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque )) 
				USING		SQLCA;
				open X1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch x1 into :ldt_fech_sepult,	:ll_hora_sepult, :ll_minuto_sepult, :ll_funeraria, :ls_nombre_fall, :ls_ap_pat_fall, :ls_ap_mat_fall, :ldt_fecha_defuncion, :ldt_fecha_nac_fall, :ll_rut_fall, :ls_dv_fall, :ls_base, :ls_serie, :ll_numero, :ls_sector, :ls_sepultura, :ls_numero_tecni, :ll_capacidad, :ll_parque, :ls_nombre_tit_ori, :ls_ap_pat_tit_ori, :ls_ap_mat_tit_ori, :ls_dir_tit_ori, :ls_nro_dir_tit_ori, :ls_dep_tit_ori, :ls_block_tit_ori, :ls_ciudad_tit_ori, :ls_comuna_tit_ori, :ll_rut_tit_ori, :ls_dv_tit_ori, :ls_tipo_via_tit_ori, :ls_nombre_tit_des, :ls_ap_pat_tit_des, :ls_ap_mat_tit_des, :ls_dir_tit_des, :ls_nro_dir_tit_des, :ls_dep_tit_des, :ls_block_tit_des, :ls_ciudad_tit_des, :ls_comuna_tit_des, :ll_rut_tit_des, :ls_dv_tit_des, :ls_tipo_via_tit_des, :ls_tipo_traslado, :ll_fila, :ls_base_des, :ls_serie_des, :ll_numero_des, :ls_sector_des, :ls_sepultura_des, :ll_capacidad_origen, :ls_destino_parque;
						if not isnull(ldt_fech_sepult) then
							ll_indi				= ll_fila
							ldt_fecha_hoy		= ldt_fech_sepult
							ls_nom_comp_fall	= ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
							if len(ls_nom_comp_fall)>27 then
								ls_nom_comp_fall	= mid(ls_nom_comp_fall,1,27)
							end if
							if ls_tipo_traslado='E' then
								if ls_destino_parque='E' then
									ll_rut_tit_ori			= ll_rut_tit_des
									ls_dv_tit_ori			= ls_dv_tit_des
									ls_tipo_via_tit_ori	= ls_tipo_via_tit_des
									ls_dir_tit_ori			= ls_dir_tit_des
									ls_nro_dir_tit_ori	= ls_nro_dir_tit_des
									ls_dep_tit_ori			= ls_dep_tit_des
									ls_block_tit_ori		= ls_block_tit_des
									ls_ciudad_tit_ori		= ls_ciudad_tit_des
									ls_comuna_tit_ori		= ls_comuna_tit_des
									ls_nombre_tit_ori		= ls_nombre_tit_des
									ls_ap_pat_tit_ori		= ls_ap_pat_tit_des
									ls_ap_mat_tit_ori		= ls_ap_mat_tit_des
									ls_sector				= ls_sector_des
									ls_sepultura			= ls_sepultura_des
									ll_capacidad_origen	= ll_capacidad
								end if
							elseif ls_tipo_traslado='I' then
								ll_rut_tit_ori			= ll_rut_tit_des
								ls_dv_tit_ori			= ls_dv_tit_des
								ls_tipo_via_tit_ori	= ls_tipo_via_tit_des
								ls_dir_tit_ori			= ls_dir_tit_des
								ls_nro_dir_tit_ori	= ls_nro_dir_tit_des
								ls_dep_tit_ori			= ls_dep_tit_des
								ls_block_tit_ori		= ls_block_tit_des
								ls_ciudad_tit_ori		= ls_ciudad_tit_des
								ls_comuna_tit_ori		= ls_comuna_tit_des
								ls_nombre_tit_ori		= ls_nombre_tit_des
								ls_ap_pat_tit_ori		= ls_ap_pat_tit_des
								ls_ap_mat_tit_ori		= ls_ap_mat_tit_des
								ls_sector				= ls_sector_des
								ls_sepultura			= ls_sepultura_des
								ll_capacidad_origen	= ll_capacidad
							end if
							SELECT	"CLIENTE"."SECTOR",	"CLIENTE"."POBLACION",	"CLIENTE"."FONO_P",	"CLIENTE"."FONO_C"  
							INTO		:ls_villa_tit_ori,	:ls_sector_tit_ori,		:ls_fono_titular,		:ls_fono_com_tit  
							FROM 		"CLIENTE"  
							WHERE		"CLIENTE"."RUT" = :ll_rut_tit_ori   ;
							if isnull(ls_villa_tit_ori) then ls_villa_tit_ori='-'
							if isnull(ls_sector_tit_ori) then ls_sector_tit_ori='-'
							if ls_tipo_traslado='I' then
								SELECT	Count("FALLECIDOS"."LLAVE")  
								INTO 		:ll_count_fall  
								FROM 		"FALLECIDOS"  
								WHERE  ( "FALLECIDOS"."BASE" = :ls_base_des ) AND  
										 ( "FALLECIDOS"."SS" = :ls_serie_des ) AND  
										 ( "FALLECIDOS"."CONTRATO" = :ll_numero_des )  AND
										( "FALLECIDOS"."ESTADO_REG" = 'A' )  
								USING		sqlca;
							else
								SELECT	Count("FALLECIDOS"."LLAVE")  
								INTO 		:ll_count_fall  
								FROM 		"FALLECIDOS"  
								WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
										 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
										 ( "FALLECIDOS"."CONTRATO" = :ll_numero )    AND
										( "FALLECIDOS"."ESTADO_REG" = 'A' )
								USING		sqlca;
							end if
							if ll_count_fall>0 then
								ls_primera_sepultura	= 'N'
							else
								ls_primera_sepultura	= 'S'
							end if			
							SELECT 	"FICHA_GRABACION_LAPIDA"."CODIGO_IMAGEN"
							INTO 		:ll_cod_imagen  
							FROM 		"FICHA_GRABACION_LAPIDA"  
							WHERE	 ( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."FOLIO" = 1 ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."FECHA" = :ldt_fech_sepult )   
							USING		sqlca;
							if isnull(ll_cod_imagen) or ll_cod_imagen=0 then ll_cod_imagen=0
							if ll_cod_imagen=0 then
								SELECT	COUNT("FALLECIDOS"."LLAVE")  
								INTO 		:ll_count_reg  
								FROM 		"FALLECIDOS"  
								WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND  
										 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
										 ( "FALLECIDOS"."COD_PARQUE" = :ll_parque )    AND
										( "FALLECIDOS"."ESTADO_REG" = 'A' )
								USING		sqlca;
								if ll_count_reg>1 then
									ll_cod_imagen		= 99
								else
									ll_cod_imagen		= 0
								end if
							end if
							
							SELECT 	MAX("FICHA_CARTA_SEPULTACION"."FOLIO")  
							INTO 		:ll_count  
							FROM 		"FICHA_CARTA_SEPULTACION"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							
							INSERT INTO "FICHA_CARTA_SEPULTACION"  
										 ( "FECHA_CARTA",		"NOMBRE_TITULAR",		"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",		"DV_TITULAR",		"DIRECCION_TITULAR",	"NUMERO_DIRECCION_TITULAR",	"DEPTO_DIRECCION_TITULAR",	"BLOCK_DIRECCION_TITULAR",	"POBLACION_VILLA_TITULAR",	"SECTOR_TITULAR",		"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",				"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION",	"CODIGO_FUNERARIA",	"FOLIO",		"BASE",	  	"SERIE",		"NUMERO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"CORRELATIVO",	"COD_PARQUE",	"TIPO_FICHA",	"COD_PARENTESCO_AUTORIZA",	"FONO_PARTICULAR_TITULAR",	"FONO_COMERCIAL_TITULAR",	"TIPO_VIA_TITULAR" )  
							VALUES 	 ( :ldt_fecha_hoy,			:ls_nombre_tit_ori,		:ls_ap_pat_tit_ori,						:ls_ap_mat_tit_ori,					:ll_rut_tit_ori,			:ls_dv_tit_ori,		:ls_dir_tit_ori,				:ls_nro_dir_tit_ori, 					:ls_dep_tit_ori,							:ls_block_tit_ori,					:ls_villa_tit_ori,						:ls_sector_tit_ori,			:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad_origen,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fech_sepult,		:ll_hora_sepult,		:ll_minuto_sepult,		:ll_funeraria,			:ll_count,	:ls_base,	:ls_serie,  :ll_numero, 	:ll_rut_fall,  	:ls_dv_fall,     	:ll_indi,		:ll_parque,		'FT',				'19',								:ls_fono_titular,				:ls_fono_com_tit,				:ls_tipo_via_tit_ori )
							USING		sqlca;   
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar CARTA SEPULTACION SQL: "+sqlca.sqlerrtext)
							end if
							
							SELECT 	MAX("FICHA_GRABACION_LAPIDA"."CORRELATIVO")  
							INTO 		:ll_count  
							FROM 		"FICHA_GRABACION_LAPIDA"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							
							INSERT INTO "FICHA_GRABACION_LAPIDA"  
										( "BASE",	"SERIE",		"NUMERO",	"FECHA",				"NOMBRE_TITULAR",		"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",		"DV_TITULAR",		"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",				"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_NACIMIENTO_FALL",	"FECHA_FALLECIMIENTO",	"CODIGO_RELIGION",	"CODIGO_IMAGEN",	"NOMBRE_FALLECIDO_LAPIDA",	"FECHA_DEFUNCION_LAPIDA",	"FECHA_NACIMIENTO_LAPIDA",	"FOLIO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"COD_PARQUE",	"PRIMERA_SEPULTURA",		"TIPO_FICHA",	"CORRELATIVO" )  
							VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha_hoy,	:ls_nombre_tit_ori,  :ls_ap_pat_tit_ori,				:ls_ap_mat_tit_ori,				:ll_rut_tit_ori,  :ls_dv_tit_ori,	:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad_origen,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fecha_nac_fall,			:ldt_fecha_defuncion,  	null,						:ll_cod_imagen,	:ls_nom_comp_fall,			:ldt_fecha_defuncion,		:ldt_fecha_nac_fall,			:ll_indi,	:ll_rut_fall,		:ls_dv_fall,		:ll_parque,		:ls_primera_sepultura,	'FT',				:ll_count )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar GRABACION LAPIDA SQL: "+sqlca.sqlerrtext)
							end if
						end if
						Setnull(ldt_fech_sepult)
					LOOP
				end if
				close x1;

				cb_carta.triggerevent(clicked!)
			end if
		end if
	end if
end if
end event

type cb_lapida from commandbutton within w_ingreso_ficha_traslado
integer x = 1669
integer y = 2380
integer width = 352
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar Lápida"
end type

event clicked;String	ls_sector,ls_sepultura,ls_nombre_archivo,ls_base,ls_serie,ls_tipo_traslado,ls_numero_tecni,&
			ls_dv_tit_ori,ls_tipo_via_tit_ori,ls_dir_tit_ori,ls_nro_dir_tit_ori,ls_dep_tit_ori,ls_block_tit_ori,&
			ls_ciudad_tit_ori,ls_comuna_tit_ori,ls_nombre_tit_ori,ls_ap_pat_tit_ori,ls_ap_mat_tit_ori,&
			ls_villa_tit_ori,ls_sector_tit_ori,ls_fono_titular,ls_fono_com_tit,ls_primera_sepultura,&
			ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_nombre_tit_des,ls_ap_pat_tit_des,&
			ls_ap_mat_tit_des,ls_dir_tit_des,ls_nro_dir_tit_des,ls_dep_tit_des,ls_block_tit_des,ls_ciudad_tit_des,&
			ls_comuna_tit_des,ls_dv_tit_des,ls_tipo_via_tit_des,ls_base_des,ls_serie_des,ls_nom_comp_fall,&
			ls_sector_des,ls_sepultura_des,ls_tipo_tras,ls_destino_parque,ls_nom_fall,ls_pat_fall
Long		ll_cod_parque,ll_imagen,ll_row,ll_resp,ll_tot_reg,ll_fila,ll_indi,ll_capacidad,&
			ll_hora_sepult,ll_minuto_sepult,ll_parque,ll_rut_tit_ori,ll_count_fall,ll_cod_imagen,&
			ll_count_reg,ll_rut_fall,ll_funeraria,ll_count,ll_rut_tit_des,ll_capacidad_origen,&
			ll_row_reg
Datetime	ldt_fecha_hoy,ldt_fech_sepult,ldt_fecha_defuncion,ldt_fecha_nac_fall
Double	ll_numero,ll_numero_des
ll_row												= tab_1.tabpage_3.dw_ficha_sepult.getrow()
ls_tipo_tras										= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'tipo_traslado')
if ls_tipo_tras='I' then
	ls_sector										= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sector_destino')
	ls_sepultura									= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sepultura_destino')
	ll_cod_parque									= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_row,'cod_parque')
else
	ls_sector										= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sector_origen')
	ls_sepultura									= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sepultura_origen')
	ll_cod_parque									= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_row,'cod_parque')
end if
ls_nom_fall											= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_row,'nombre_fallecido')
ls_pat_fall											= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_row,'apellido_paterno_fall')
if tab_1.tabpage_3.dw_ficha_sepult.rowcount()>0 and ll_row>0 and not isnull(ls_sector) and &
	not isnull(ls_sepultura) and ll_cod_parque>0 then
	
	if isvalid(w_solicitud_grabacion_lapida) then close(w_solicitud_grabacion_lapida)
	open(w_solicitud_grabacion_lapida)
	w_solicitud_grabacion_lapida.dw_parque.enabled	= false
	w_solicitud_grabacion_lapida.dw_buscar.enabled	= false
	w_solicitud_grabacion_lapida.pb_ok.enabled		= false
	w_solicitud_grabacion_lapida.cb_limpiar.enabled	= false
	w_solicitud_grabacion_lapida.cb_buscar.enabled	= false
	if ll_cod_parque=102 then
		w_solicitud_grabacion_lapida.dw_lista.dataobject	= 'dw_solicitud_grabacion_lapida_manantial'
	else
		w_solicitud_grabacion_lapida.dw_lista.dataobject	= 'dw_solicitud_grabacion_lapida'
	end if
	w_solicitud_grabacion_lapida.dw_lista.settransobject(sqlca)
	if w_solicitud_grabacion_lapida.dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)>0 then
		SELECT	"FICHA_GRABACION_LAPIDA"."CODIGO_IMAGEN"  
		INTO 		:ll_imagen  
		FROM 		"FICHA_GRABACION_LAPIDA"  
		WHERE  ( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_cod_parque ) AND  
				 ( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
				 ( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
				 ( "FICHA_GRABACION_LAPIDA"."FOLIO" = 1 )   
		USING		sqlca;
		SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
		INTO 		:ls_nombre_archivo  
		FROM 		"FICHA_CUNOS"  
		WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_imagen   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			w_solicitud_grabacion_lapida.dw_lista.object.p_1.Filename 	= ls_nombre_archivo
		else
			w_solicitud_grabacion_lapida.dw_lista.object.p_1.Filename 	= ''
		end if
		w_solicitud_grabacion_lapida.dw_parque.reset()
		w_solicitud_grabacion_lapida.dw_parque.insertrow(0)
		w_solicitud_grabacion_lapida.dw_parque.setitem(1,'cod_parque',ll_cod_parque)
		w_solicitud_grabacion_lapida.dw_buscar.reset()
		w_solicitud_grabacion_lapida.dw_buscar.getchild('sepultura',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.reset()
		idw_detalle6.insertrow(0)
		
		w_solicitud_grabacion_lapida.dw_buscar.getchild('sector',idw_detalle5)
		idw_detalle5.reset()
		idw_detalle5.insertrow(0)
	
		w_solicitud_grabacion_lapida.dw_buscar.insertrow(0)
		w_solicitud_grabacion_lapida.dw_buscar.setitem(1,'sector',ls_sector)
		w_solicitud_grabacion_lapida.dw_buscar.setitem(1,'sepultura',ls_sepultura)
		ll_row_reg	= w_solicitud_grabacion_lapida.dw_lista.Find("nombre_fallecido='"+ls_nom_fall+"' and apellido_paterno_fall='"+ls_pat_fall+"'", 1, w_solicitud_grabacion_lapida.dw_lista.RowCount())
		if ll_row_reg>0 then
			w_solicitud_grabacion_lapida.dw_lista.scrolltorow(ll_row_reg)
		end if
		w_solicitud_grabacion_lapida.dw_lista.setfocus()
	else
		close(w_solicitud_grabacion_lapida)
		ll_resp						= messagebox("Advertencia","No Registra Solicitud Grabación de Lápida, desea Crearla",exclamation!,YesNo!,2)
		if ll_resp=1 then
			ll_tot_reg				= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
			if ll_tot_reg>0 then
				DELETE FROM "FICHA_CARTA_SEPULTACION"  
				WHERE	( "FICHA_CARTA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
						( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
						( "FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				DELETE FROM "FICHA_GRABACION_LAPIDA"  
				WHERE 	( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
							( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
							( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_cod_parque )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if

				DECLARE x1 CURSOR FOR  
				SELECT	"FICHA_TRASLADO"."FECHA_TRASLADO",	"FICHA_TRASLADO"."HORA_FIJADA",	"FICHA_TRASLADO"."MINUTO_FIJADA",	"FICHA_TRASLADO"."CODIGO_FUNERARIA",	"FICHA_TRASLADO"."NOMBRE_FALLECIDO",	"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",	"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL",	"FICHA_TRASLADO"."FECHA_DEFUNCION",	"FICHA_TRASLADO"."FECHA_NACIMIENTO_FALLECIDO",	"FICHA_TRASLADO"."RUT_FALLECIDO",	"FICHA_TRASLADO"."DV_FALLECIDO",	"FICHA_TRASLADO"."BASE_ORIGEN",	"FICHA_TRASLADO"."SERIE_ORIGEN",	"FICHA_TRASLADO"."NUMERO_ORIGEN",	"FICHA_TRASLADO"."SECTOR_ORIGEN",	"FICHA_TRASLADO"."SEPULTURA_ORIGEN",	"FICHA_TRASLADO"."NUMERO_TECNICO_DESTINO",	"FICHA_TRASLADO"."CAPACIDAD_DESTINO",	"FICHA_TRASLADO"."COD_PARQUE",	"FICHA_TRASLADO"."NOMBRE_TITULAR_ORIGEN",	"FICHA_TRASLADO"."APELLIDO_PAT_TITULAR_ORIGEN",	"FICHA_TRASLADO"."APELLIDO_MAT_TITULAR_ORIGEN",	"FICHA_TRASLADO"."DIRECCION_TITULAR_ORIGEN",	"FICHA_TRASLADO"."NRO_DIREC_TITULAR_ORIGEN",	"FICHA_TRASLADO"."DPTO_DIREC_TITULAR_ORIGEN",	"FICHA_TRASLADO"."BLOCK_DIREC_TITULAR_ORIGEN",	"FICHA_TRASLADO"."COD_CIUDAD_TITULAR_ORIGEN",	"FICHA_TRASLADO"."COD_COMUNA_TITULAR_ORIGEN",	"FICHA_TRASLADO"."RUT_TITULAR_ORIGEN",	"FICHA_TRASLADO"."DV_TITULAR_ORIGEN",	"FICHA_TRASLADO"."TIPO_VIA_ORIGEN_TITULAR",	"FICHA_TRASLADO"."NOMBRE_TITULAR_DESTINO",	"FICHA_TRASLADO"."APELLIDO_PAT_TITULAR_DESTINO",	"FICHA_TRASLADO"."APELLIDO_MAT_TITULAR_DESTINO",	"FICHA_TRASLADO"."DIRECCION_TITULAR_DESTINO",	"FICHA_TRASLADO"."NRO_DIREC_TITULAR_DESTINO",	"FICHA_TRASLADO"."DEPTO_DIREC_TITULAR_DESTINO",	"FICHA_TRASLADO"."BLOCK_DIREC_TITULAR_DESTINO",	"FICHA_TRASLADO"."COD_CIUDAD_TITULAR_DESTINO",	"FICHA_TRASLADO"."COD_COMUNA_TITULAR_DESTINO",	"FICHA_TRASLADO"."RUT_TITULAR_DESTINO",	"FICHA_TRASLADO"."DV_TITULAR_DESTINO",	"FICHA_TRASLADO"."TIPO_VIA_DESTINO_TITULAR",	"FICHA_TRASLADO"."TIPO_TRASLADO",	"FICHA_TRASLADO"."FOLIO",	"FICHA_TRASLADO"."BASE_DESTINO",	"FICHA_TRASLADO"."SERIE_DESTINO",	"FICHA_TRASLADO"."NUMERO_DESTINO",	"FICHA_TRASLADO"."SECTOR_DESTINO",	"FICHA_TRASLADO"."SEPULTURA_DESTINO",	"FICHA_TRASLADO"."CAPACIDAD_ORIGEN",	"DESTINO_PARQUE"
				FROM 		"FICHA_TRASLADO"  
				WHERE  (("FICHA_TRASLADO"."SECTOR_ORIGEN" = :ls_sector ) AND  
						 ( "FICHA_TRASLADO"."SEPULTURA_ORIGEN" = :ls_sepultura ) AND  
						 ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque )) OR
						 (("FICHA_TRASLADO"."SECTOR_DESTINO" = :ls_sector ) AND  
						 ( "FICHA_TRASLADO"."SEPULTURA_DESTINO" = :ls_sepultura ) AND  
						 ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque )) 
				USING		SQLCA;
				open X1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch x1 into :ldt_fech_sepult,	:ll_hora_sepult, :ll_minuto_sepult, :ll_funeraria, :ls_nombre_fall, :ls_ap_pat_fall, :ls_ap_mat_fall, :ldt_fecha_defuncion, :ldt_fecha_nac_fall, :ll_rut_fall, :ls_dv_fall, :ls_base, :ls_serie, :ll_numero, :ls_sector, :ls_sepultura, :ls_numero_tecni, :ll_capacidad, :ll_parque, :ls_nombre_tit_ori, :ls_ap_pat_tit_ori, :ls_ap_mat_tit_ori, :ls_dir_tit_ori, :ls_nro_dir_tit_ori, :ls_dep_tit_ori, :ls_block_tit_ori, :ls_ciudad_tit_ori, :ls_comuna_tit_ori, :ll_rut_tit_ori, :ls_dv_tit_ori, :ls_tipo_via_tit_ori, :ls_nombre_tit_des, :ls_ap_pat_tit_des, :ls_ap_mat_tit_des, :ls_dir_tit_des, :ls_nro_dir_tit_des, :ls_dep_tit_des, :ls_block_tit_des, :ls_ciudad_tit_des, :ls_comuna_tit_des, :ll_rut_tit_des, :ls_dv_tit_des, :ls_tipo_via_tit_des, :ls_tipo_traslado, :ll_fila, :ls_base_des, :ls_serie_des, :ll_numero_des, :ls_sector_des, :ls_sepultura_des, :ll_capacidad_origen, :ls_destino_parque;
						if not isnull(ldt_fech_sepult) then
							ll_indi				= ll_fila
							ldt_fecha_hoy		= ldt_fech_sepult
							ls_nom_comp_fall	= ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
							if len(ls_nom_comp_fall)>27 then
								ls_nom_comp_fall	= mid(ls_nom_comp_fall,1,27)
							end if
							if ls_tipo_traslado='E' then
								if ls_destino_parque='E' then
									ll_rut_tit_ori			= ll_rut_tit_des
									ls_dv_tit_ori			= ls_dv_tit_des
									ls_tipo_via_tit_ori	= ls_tipo_via_tit_des
									ls_dir_tit_ori			= ls_dir_tit_des
									ls_nro_dir_tit_ori	= ls_nro_dir_tit_des
									ls_dep_tit_ori			= ls_dep_tit_des
									ls_block_tit_ori		= ls_block_tit_des
									ls_ciudad_tit_ori		= ls_ciudad_tit_des
									ls_comuna_tit_ori		= ls_comuna_tit_des
									ls_nombre_tit_ori		= ls_nombre_tit_des
									ls_ap_pat_tit_ori		= ls_ap_pat_tit_des
									ls_ap_mat_tit_ori		= ls_ap_mat_tit_des
									ls_sector				= ls_sector_des
									ls_sepultura			= ls_sepultura_des
									ll_capacidad_origen	= ll_capacidad
								end if
							elseif ls_tipo_traslado='I' then
								ll_rut_tit_ori			= ll_rut_tit_des
								ls_dv_tit_ori			= ls_dv_tit_des
								ls_tipo_via_tit_ori	= ls_tipo_via_tit_des
								ls_dir_tit_ori			= ls_dir_tit_des
								ls_nro_dir_tit_ori	= ls_nro_dir_tit_des
								ls_dep_tit_ori			= ls_dep_tit_des
								ls_block_tit_ori		= ls_block_tit_des
								ls_ciudad_tit_ori		= ls_ciudad_tit_des
								ls_comuna_tit_ori		= ls_comuna_tit_des
								ls_nombre_tit_ori		= ls_nombre_tit_des
								ls_ap_pat_tit_ori		= ls_ap_pat_tit_des
								ls_ap_mat_tit_ori		= ls_ap_mat_tit_des
								ls_sector				= ls_sector_des
								ls_sepultura			= ls_sepultura_des
								ll_capacidad_origen	= ll_capacidad
							end if
							SELECT	"CLIENTE"."SECTOR",	"CLIENTE"."POBLACION",	"CLIENTE"."FONO_P",	"CLIENTE"."FONO_C"  
							INTO		:ls_villa_tit_ori,	:ls_sector_tit_ori,		:ls_fono_titular,		:ls_fono_com_tit  
							FROM 		"CLIENTE"  
							WHERE		"CLIENTE"."RUT" = :ll_rut_tit_ori   ;
							if isnull(ls_villa_tit_ori) then ls_villa_tit_ori='-'
							if isnull(ls_sector_tit_ori) then ls_sector_tit_ori='-'
							if ls_tipo_traslado='I' then
								SELECT	Count("FALLECIDOS"."LLAVE")  
								INTO 		:ll_count_fall  
								FROM 		"FALLECIDOS"  
								WHERE  ( "FALLECIDOS"."BASE" = :ls_base_des ) AND  
										 ( "FALLECIDOS"."SS" = :ls_serie_des ) AND  
										 ( "FALLECIDOS"."CONTRATO" = :ll_numero_des )    AND
										( "FALLECIDOS"."ESTADO_REG" = 'A' )
								USING		sqlca;
							else
								SELECT	Count("FALLECIDOS"."LLAVE")  
								INTO 		:ll_count_fall  
								FROM 		"FALLECIDOS"  
								WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
										 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
										 ( "FALLECIDOS"."CONTRATO" = :ll_numero )    AND
										( "FALLECIDOS"."ESTADO_REG" = 'A' )
								USING		sqlca;
							end if
							if ll_count_fall>0 then
								ls_primera_sepultura	= 'N'
							else
								ls_primera_sepultura	= 'S'
							end if			
							SELECT 	"FICHA_GRABACION_LAPIDA"."CODIGO_IMAGEN"
							INTO 		:ll_cod_imagen  
							FROM 		"FICHA_GRABACION_LAPIDA"  
							WHERE	 ( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."FOLIO" = 1 ) AND  
									 ( "FICHA_GRABACION_LAPIDA"."FECHA" = :ldt_fech_sepult )   
							USING		sqlca;
							if isnull(ll_cod_imagen) or ll_cod_imagen=0 then ll_cod_imagen=0
							if ll_cod_imagen=0 then
								SELECT	COUNT("FALLECIDOS"."LLAVE")  
								INTO 		:ll_count_reg  
								FROM 		"FALLECIDOS"  
								WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND  
										 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
										 ( "FALLECIDOS"."COD_PARQUE" = :ll_parque )    AND
										( "FALLECIDOS"."ESTADO_REG" = 'A' )
								USING		sqlca;
								if ll_count_reg>1 then
									ll_cod_imagen		= 99
								else
									ll_cod_imagen		= 0
								end if
							end if
							
							SELECT 	MAX("FICHA_CARTA_SEPULTACION"."FOLIO")  
							INTO 		:ll_count  
							FROM 		"FICHA_CARTA_SEPULTACION"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							
							INSERT INTO "FICHA_CARTA_SEPULTACION"  
										 ( "FECHA_CARTA",		"NOMBRE_TITULAR",		"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",		"DV_TITULAR",		"DIRECCION_TITULAR",	"NUMERO_DIRECCION_TITULAR",	"DEPTO_DIRECCION_TITULAR",	"BLOCK_DIRECCION_TITULAR",	"POBLACION_VILLA_TITULAR",	"SECTOR_TITULAR",		"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",				"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION",	"CODIGO_FUNERARIA",	"FOLIO",		"BASE",	  	"SERIE",		"NUMERO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"CORRELATIVO",	"COD_PARQUE",	"TIPO_FICHA",	"COD_PARENTESCO_AUTORIZA",	"FONO_PARTICULAR_TITULAR",	"FONO_COMERCIAL_TITULAR",	"TIPO_VIA_TITULAR" )  
							VALUES 	 ( :ldt_fecha_hoy,	:ls_nombre_tit_ori,	:ls_ap_pat_tit_ori,				:ls_ap_mat_tit_ori,				:ll_rut_tit_ori,	:ls_dv_tit_ori,	:ls_dir_tit_ori,		:ls_nro_dir_tit_ori, 			:ls_dep_tit_ori,				:ls_block_tit_ori,			:ls_villa_tit_ori,			:ls_sector_tit_ori,	:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad_origen,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fech_sepult,		:ll_hora_sepult,		:ll_minuto_sepult,		:ll_funeraria,			:ll_count,	:ls_base,	:ls_serie,  :ll_numero, 	:ll_rut_fall,  	:ls_dv_fall,     	:ll_indi,		:ll_parque,		'FT',				'19',								:ls_fono_titular,				:ls_fono_com_tit,				:ls_tipo_via_tit_ori )
							USING		sqlca;   
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar CARTA SEPULTACION SQL: "+sqlca.sqlerrtext)
							end if
							
							SELECT 	MAX("FICHA_GRABACION_LAPIDA"."CORRELATIVO")  
							INTO 		:ll_count  
							FROM 		"FICHA_GRABACION_LAPIDA"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							
							INSERT INTO "FICHA_GRABACION_LAPIDA"  
										( "BASE",	"SERIE",		"NUMERO",	"FECHA",				"NOMBRE_TITULAR",		"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",		"DV_TITULAR",		"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",				"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_NACIMIENTO_FALL",	"FECHA_FALLECIMIENTO",	"CODIGO_RELIGION",	"CODIGO_IMAGEN",	"NOMBRE_FALLECIDO_LAPIDA",	"FECHA_DEFUNCION_LAPIDA",	"FECHA_NACIMIENTO_LAPIDA",	"FOLIO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"COD_PARQUE",	"PRIMERA_SEPULTURA",		"TIPO_FICHA",	"CORRELATIVO" )  
							VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha_hoy,	:ls_nombre_tit_ori,  :ls_ap_pat_tit_ori,				:ls_ap_mat_tit_ori,				:ll_rut_tit_ori,  :ls_dv_tit_ori,	:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad_origen,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fecha_nac_fall,			:ldt_fecha_defuncion,  	null,						:ll_cod_imagen,	:ls_nom_comp_fall,			:ldt_fecha_defuncion,		:ldt_fecha_nac_fall,			:ll_indi,	:ll_rut_fall,		:ls_dv_fall,		:ll_parque,		:ls_primera_sepultura,	'FT',				:ll_count )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar GRABACION LAPIDA SQL: "+sqlca.sqlerrtext)
							end if
						end if
						Setnull(ldt_fech_sepult)
					LOOP
				end if
				close x1;
				cb_lapida.triggerevent(clicked!)
			end if
		end if
	end if
end if
end event

