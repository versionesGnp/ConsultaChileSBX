forward
global type w_ingreso_ficha_sepultacion_bkp from window
end type
type dw_qr from datawindow within w_ingreso_ficha_sepultacion_bkp
end type
type cb_2 from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type dw_resumen from datawindow within w_ingreso_ficha_sepultacion_bkp
end type
type cb_1 from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type cb_tablas from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type cb_volver from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type cb_print from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type cb_eliminar from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type cb_buscar from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type pb_primer from picturebutton within w_ingreso_ficha_sepultacion_bkp
end type
type pb_sigue from picturebutton within w_ingreso_ficha_sepultacion_bkp
end type
type pb_antes from picturebutton within w_ingreso_ficha_sepultacion_bkp
end type
type pb_fin from picturebutton within w_ingreso_ficha_sepultacion_bkp
end type
type cb_grabar from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type cb_limpiar from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type dw_print from datawindow within w_ingreso_ficha_sepultacion_bkp
end type
type tab_1 from tab within w_ingreso_ficha_sepultacion_bkp
end type
type tabpage_3 from userobject within tab_1
end type
type st_help from statictext within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type dw_ficha_sepult from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_help st_help
st_3 st_3
dw_ficha_sepult dw_ficha_sepult
end type
type tabpage_2 from userobject within tab_1
end type
type st_2 from statictext within tabpage_2
end type
type dw_ant_titular from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_2 st_2
dw_ant_titular dw_ant_titular
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
type cb_beneficios from commandbutton within tabpage_4
end type
type cb_crear_cupon from commandbutton within tabpage_4
end type
type cb_4 from commandbutton within tabpage_4
end type
type st_4 from statictext within tabpage_4
end type
type dw_aranceles from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_beneficios cb_beneficios
cb_crear_cupon cb_crear_cupon
cb_4 cb_4
st_4 st_4
dw_aranceles dw_aranceles
end type
type tab_1 from tab within w_ingreso_ficha_sepultacion_bkp
tabpage_3 tabpage_3
tabpage_2 tabpage_2
tabpage_1 tabpage_1
tabpage_4 tabpage_4
end type
type cb_cerrar from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type gb_1 from groupbox within w_ingreso_ficha_sepultacion_bkp
end type
type gb_2 from groupbox within w_ingreso_ficha_sepultacion_bkp
end type
type cb_carta_lapida from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type cb_lapida from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
type cb_carta from commandbutton within w_ingreso_ficha_sepultacion_bkp
end type
end forward

global type w_ingreso_ficha_sepultacion_bkp from window
integer width = 3886
integer height = 2752
boolean titlebar = true
string title = "Ficha de Sepultación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_qr dw_qr
cb_2 cb_2
dw_resumen dw_resumen
cb_1 cb_1
cb_tablas cb_tablas
cb_volver cb_volver
cb_print cb_print
cb_eliminar cb_eliminar
cb_buscar cb_buscar
pb_primer pb_primer
pb_sigue pb_sigue
pb_antes pb_antes
pb_fin pb_fin
cb_grabar cb_grabar
cb_limpiar cb_limpiar
dw_print dw_print
tab_1 tab_1
cb_cerrar cb_cerrar
gb_1 gb_1
gb_2 gb_2
cb_carta_lapida cb_carta_lapida
cb_lapida cb_lapida
cb_carta cb_carta
end type
global w_ingreso_ficha_sepultacion_bkp w_ingreso_ficha_sepultacion_bkp

type variables
datawindowchild			idw_detalle5,idw_detalle6,idw_detalle7,idw_detalle8,idw_detalle9,idw_detalle10,idw_detalle16,idw_detalle17,idw_detalle18,&
								idw_detalle20,idw_detalle21,idw_detalle22,idw_detalle23,idw_detalle24,idw_detalle25
Long		il_tab,il_count_reg,il_count_otro,il_hora_ini,il_min_ini,il_hora_fin,il_min_fin,	il_intervalo,il_veces,il_capacidad,il_dw_tit_fall,il_modif1,il_modif2,il_modif3,&
			il_modif4,il_modif5,il_modif6,il_rut,il_sw,il_hora_ini_templo,il_min_ini_templo,il_hora_fin_templo,il_min_fin_templo,il_intervalo_templo,il_veces_templo,&
			il_horaval_uso_templo,il_minval_uso_templo,il_horavalfin_uso_templo,il_minvalfin_uso_templo
String		is_nro_tecnico,is_usuario_esta,is_nuevo,is_modif,is_dv,is_fono_contacto,is_celular_contacto,is_columna,is_obsval_uso_templo
Datetime	idt_fecha_sistema
end variables

forward prototypes
public subroutine wf_valida_contrato ()
public function string wf_validar ()
public subroutine wf_setear_datos ()
public subroutine wf_cargar_datos ()
public subroutine wf_actualizar_calculo (long al_fila)
public subroutine wf_setear_arancel_sw (long al_fila)
public function string wf_validar_detalle_dscto (string as_tipo_dscto)
public function string wf_validar_pregrabado ()
public function string wf_valida_largo (long al_largo, string as_columna)
public function string wf_validar_letras (string as_letras, string as_columna)
public subroutine wf_validar_horario (long al_fila, string as_tipo)
public subroutine wf_carga_detalle_boletas (string as_base, string as_serie, long al_numero, long al_corr_interno, long al_rut_tit, date adt_fech_sepult, long al_parque)
public subroutine wf_parentesco ()
end prototypes

public subroutine wf_valida_contrato ();String	ls_base,ls_serie,ls_sector_sepult,ls_nro_sepultura,ls_estado_ctto,&
			ls_nro_tecnico,ls_dv_titular,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,&
			ls_cod_tipo_via,ls_direccion_p,ls_nro_part,ls_depto_part,ls_block_part,&
			ls_pob_part,ls_sector_part,ls_comuna_part,ls_ciudad_part,ls_fono_part,&
			ls_parque,ls_cod_age_aux,ls_descrip_estado,ls_sector,ls_sepultura,ls_base_aux,ls_serie_aux,&
			ls_pasa
Long		ll_count_fall,ll_cod_parque,ll_capacidad,ll_mora_cred,ll_mora_mant,ll_nulo,&
			ll_rut_titular,ll_resp,ll_parque_aux,ll_parque_cons
datetime	ldt_fecha_ctto
Double	ll_numero,ll_numero_aux

ls_base			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base')
ls_serie			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie')
ll_numero		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero')
ll_parque_cons	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
ls_sector			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
ls_sepultura		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
Setnull(ll_nulo)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ll_numero>0 and &
	not isnull(ll_numero) then
	if ls_base='O' then
		SELECT	"INVENTARIO_PLANI"."BASE",	"INVENTARIO_PLANI"."SERIE",	"INVENTARIO_PLANI"."NUMERO"
		INTO 		:ls_base_aux,					:ls_serie_aux,						:ll_numero_aux  
		FROM 	"INVENTARIO_PLANI"  
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
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero',ll_nulo)
						tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						tab_1.tabpage_3.dw_ficha_sepult.setfocus()
						tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
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
					 ( "FALLECIDOS"."CONTRATO" = :ll_numero )   ;
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
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')=ls_sector_sepult then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector',ls_sector_sepult)
					else
						ll_resp	= messagebox("Advertencia","Sector Inválido, Promesa Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector',ls_sector_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')=ls_nro_sepultura then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura',ls_nro_sepultura)
					else
						ll_resp	= messagebox("Advertencia","Sepultura Inválida, Promesa Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura',ls_nro_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura')
						end if
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad',ll_capacidad)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_credito',ll_mora_cred)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_mantencion',ll_mora_cred)
					if isnull(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico')) or &
						trim(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico'))='' then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico',ls_nro_tecnico)
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_estado_contrato',ls_estado_ctto)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cantidad_sepultados',ll_count_fall)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad_libre_sepultura',ll_capacidad - ll_count_fall)
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
					if (ll_capacidad - ll_count_fall)=0 then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_completa','S')
					else
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_sepultura_completa','N')
					end if
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular',ll_rut_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular',ls_dv_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular',ls_nom_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular',ls_ap_pat_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular',ls_ap_mat_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular',ls_cod_tipo_via)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular',ls_direccion_p)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular',ls_nro_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular',ls_depto_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular',ls_block_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'poblacion_villa_titular',ls_pob_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'sector_titular',ls_sector_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular',ls_ciudad_part)
					if idw_detalle3.retrieve(ls_ciudad_part)=0 then
						idw_detalle3.insertrow(0)
					end if
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular',ls_comuna_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular',ls_fono_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_contrato',ldt_fecha_ctto)
				else
					SELECT	"ESTADO"."NOMBRE_ESTADO"  
					INTO 		:ls_descrip_estado  
					FROM 		"ESTADO"  
					WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_ctto   ;
					messagebox("Advertencia","Recuerde Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" Estado Actual es "+ls_descrip_estado+" debe estar VIGENTE o CANCELADO, regularice en Depto. Atención Cliente")
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
				end if
			else
				SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
				INTO 		:ll_parque_aux,				:ls_cod_age_aux  
				FROM 		"CD_FOLIO"  
				WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
						 //( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
//					if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
//						messagebox("Advertencia","Este Contrato NO tiene Agente Asignado")
//						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
//					else
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','S')
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_credito',0)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_mantencion',0)
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
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero',ll_nulo)
						tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						tab_1.tabpage_3.dw_ficha_sepult.setfocus()
						tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
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
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')=ls_sector_sepult then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector',ls_sector_sepult)
					else
						ll_resp	= messagebox("Advertencia","Sector Inválido, Contrato IsaCruz Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector',ls_sector_sepult)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector')
						end if
					end if
					if tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')=ls_nro_sepultura then
						tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura',ls_nro_sepultura)
					else
						ll_resp	= messagebox("Advertencia","Sepultura Inválida, Contrato IsaCruz Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura',ls_nro_sepultura)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						else
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura')
						end if
					end if
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'capacidad',ll_capacidad)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_credito',ll_mora_cred)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_mantencion',ll_mora_cred)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero_tecnico',ls_nro_tecnico)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_estado_contrato',ls_estado_ctto)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular',ll_rut_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular',ls_dv_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular',ls_nom_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular',ls_ap_pat_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular',ls_ap_mat_titular)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular',ls_cod_tipo_via)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular',ls_direccion_p)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular',ls_nro_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular',ls_depto_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular',ls_block_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'poblacion_villa_titular',ls_pob_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'sector_titular',ls_sector_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular',ls_ciudad_part)
					if idw_detalle3.retrieve(ls_ciudad_part)=0 then
						idw_detalle3.insertrow(0)
					end if
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular',ls_comuna_part)
					tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular',ls_fono_part)
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_contrato',ldt_fecha_ctto)
				else
					SELECT	"ESTADO"."NOMBRE_ESTADO"  
					INTO 		:ls_descrip_estado  
					FROM 		"ESTADO"  
					WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_ctto   ;
					messagebox("Advertencia","Recuerde Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" Estado Actual es "+ls_descrip_estado+" debe estar VIGENTE o CANCELADO, regularice en Depto. Atención Cliente")
					tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
				end if
			else
				messagebox("Advertencia","Contrato No Existe en Control Documentario")
				tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'c_existe_ctto','N')
			end if
		end if
	end if
end if
end subroutine

public function string wf_validar ();string   	ls_sw='S',ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_direc_fall,ls_dpto_dir_fall,ls_block_dir_fall,ls_sector_fall,ls_villa_fall,ls_ciud_fall,ls_comu_fall,ls_cod_est_fall,ls_causa_fall,&
			ls_num_dir_fall,ls_dv_tit,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,ls_sector_tit,ls_villa_tit,ls_ciud_tit,ls_comu_tit,ls_base,&
			ls_serie,ls_estad_contrato,ls_sector,ls_sepultura,ls_numero_tecni,ls_nivel,ls_est_sep_compl,ls_obs_sep_comp,ls_obs_credito,ls_obs_manten,ls_fono_titular,ls_ejecutivo,ls_fono_funera,ls_pase_sepult,&
			ls_sexo_fall,ls_tipo_via_fall,ls_tipo_via_tit,ls_parentesco,ls_sector1,ls_sepultura1,ls_obs,ls_estado_reg,ls_estado_ctto,ls_cod_age_aux,ls_estado_doc1,ls_estado_doc2,ls_periodo_nac,ls_tamano,&
			ls_obs_fall,ls_usar_capilla,ls_usar_templo,ls_obs_benef,ls_descto_1,ls_descto_2,ls_descto_3,ls_descto_4,ls_descto_5,ls_descto_6
long 		ll_rut_fall,ret,ll_rut_tit,ll_hora_sepult,ll_minuto_sepult,ll_funeraria,ll_parque,ll_capacidad,ll_cant_sepultados,ll_cap_libre_sep,&
			ll_est_credito,ll_est_manten,ll_count,ll_hora_hoy,ll_minutos_hoy,ll_edad_fall,ll_comprobante,ll_tot_reg,ll_indi,ll_corr_interno,ll_parque1,ll_parque_aux,&
			ll_hora_uso_capilla,ll_min_uso_capilla,ll_sw_otros_pagos,ll_hora_finvela,ll_hora_ini_templo,ll_hora_fin_templo,ll_sala_templo,ll_sala_velatorio,ll_sw_liberado,&
			ll_count_pend_ben
Datetime	ldt_fec_defun,ldt_fec_nac,ldt_fech_sepult,ldt_fech_contrato,ldt_fech_recep,ldt_fecha_hoy,ldt_fecha_sepult1,ldt_fecha_inivela,ldt_fecha_finvela
Double	ldb_uf_dia,ldb_der_sepult_uf,ldb_mov_sarcofago,ldb_cambio_ubica,ldb_reduccion,ldb_cert_defuncion,ldb_monto_canc,ldb_otros_pagos,ll_numero

SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
ll_hora_hoy					= long(string(gdt_fec_sistema,'hh'))
ll_minutos_hoy				= long(string(gdt_fec_sistema,'mm'))
if is_usuario_esta='S' then
	tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_recepcion',ldt_fecha_hoy)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'hora_recepcion',ll_hora_hoy)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'minuto_recepcion',ll_minutos_hoy)
end if
ll_parque1					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
ls_sector1					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
ls_sepultura1				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
ldt_fecha_sepult1			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_2.dw_ant_titular.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
tab_1.tabpage_4.dw_aranceles.accepttext()
ll_tot_reg					= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
for ll_indi=1 to ll_tot_reg
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'correlativo_interno',ll_indi)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'correlativo_interno',ll_indi)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'correlativo_interno',ll_indi)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'correlativo_interno',ll_indi)
	ll_rut_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'rut_fallecido')
	ls_dv_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'dv_fallecido')
	ls_nombre_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'nombre_fallecido')
	ls_ap_pat_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_paterno_fall')
	ls_ap_mat_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_materno_fall')
	ls_sexo_fall      	= tab_1.tabpage_1.dw_ant_fall.getItemString(ll_indi,'sexo_fallecido')
	ll_edad_fall     		= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'edad_fallecido')
	ls_tipo_via_fall  	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'tipo_via_fallecido')
	ls_direc_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'direccion_fall')
	ls_num_dir_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'numero_direccion_fall')
	ls_dpto_dir_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'depto_direccion_fall')
	ls_block_dir_fall	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'block_direccion_fall')
	ls_sector_fall	   	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'sector_fall')
	ls_villa_fall	   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'poblacion_villa_fall')
	ls_ciud_fall	 		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_ciudad_fall')
	ls_comu_fall	   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_comuna_fall')
	ls_cod_est_fall   	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_estado_fall')
	ls_causa_fall	   	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'causa_fallecimiento')
	ldt_fec_defun	   	= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_defuncion')
	ldt_fec_nac 	   		= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_nacimiento_fall')
	ls_periodo_nac		= tab_1.tabpage_1.dw_ant_fall.Getitemstring(ll_indi,'periodo_nacimiento')
	ls_tamano			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_tamano_cuerpo')
	ls_obs_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'observacion_fallecido')
	ls_usar_capilla		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'usar_capilla')
	ldt_fecha_inivela	= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_ini_velatorio')
	ll_hora_uso_capilla= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_capilla')
	ll_min_uso_capilla	= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'minuto_util_capilla')
	ldt_fecha_finvela	= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_fin_velatorio')
	ll_hora_finvela		= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_capilla_fin')
	ls_usar_templo		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'usar_templo')
	ll_hora_ini_templo	= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_templo')
	ll_hora_fin_templo	= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_fin_templo')
	ll_sala_templo		= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sala_templo')
	ll_sala_velatorio	= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sala_velatorio')
	//ficha titular//
	ll_rut_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'rut_titular')
	ls_dv_tit			 	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'dv_titular')
	ls_nombre_tit		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'nombre_titular')
	ls_ap_pat_tit		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_paterno_titular')
	ls_ap_mat_tit		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_materno_titular')
	ls_tipo_via_tit   	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'tipo_via_titular')
	ls_direc_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'direccion_titular')
	ls_num_dir_tit	   	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'num_direccion_titular')
	ls_dpto_dir_tit		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'depto_direccion_titular')
	ls_block_dir_tit		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'block_direccion_titular')
	ls_villa_tit	   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'poblacion_villa_titular')
	ls_sector_tit	   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'sector_titular')
	ls_ciud_tit	 	   	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_ciudad_titular')
	ls_comu_tit	      	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_comuna_titular')
	ls_fono_titular   	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'fono_titular')
	// ficha de sepultacion //
	ls_estado_ctto		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'c_existe_ctto')
	ls_ejecutivo        	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'codigo_ejecutivo')
	ldt_fech_sepult   	= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_sepultacion')
	ll_hora_sepult    	= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'hora')
	ll_minuto_sepult	= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'minutos')
	ll_funeraria			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'codigo_funeraria')
	ls_fono_funera		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'fono_funeraria')
	ls_pase_sepult		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'pase_sepultacion')
	ls_base				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'base')
	ls_serie				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'serie')
	ll_numero			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'numero')
	ldt_fech_contrato	= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_contrato')
	ls_estad_contrato	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_estado_contrato')
	ll_parque				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque')
	ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'sector')
	ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'sepultura')
	ls_numero_tecni	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'numero_tecnico')
	ll_capacidad			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad')
	ls_nivel				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nivel')
	ll_cant_sepultados	= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cantidad_sepultados')	
	ls_est_sep_compl	= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'estado_sepultura_completa')
	ll_cap_libre_sep	= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad_libre_sepultura')
	ls_obs_sep_comp	= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'observacion_sepultura_completa')
	ll_est_credito		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'estado_credito')
	ls_obs_credito		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'observacion_credito')
	ll_est_manten		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'estado_mantencion')
	ls_obs_manten		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'observacion_mantencion')
	ldt_fech_recep		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_recepcion')
	//ARANCELES//
	ls_parentesco        = tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'codigo_parentesco')
	ldb_monto_canc    = tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar')
	ll_comprobante    	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'folio_comprobante')
	ldb_otros_pagos	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'valor_otros_pagos')
	ll_sw_otros_pagos	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_otros_pagos')
	ls_obs_benef		= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'observacion_beneficio')
	ls_descto_1			= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_1')
	ls_descto_2			= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_2')
	ls_descto_3			= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_3')
	ls_descto_4			= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_4')
	ls_descto_5			= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_5')
	ls_descto_6			= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'dscto_otro_6')
	ll_sw_liberado		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_liberado')

	ls_estado_doc1		= 'N'
	ls_estado_doc2		= 'N'
	if isnull(ll_rut_fall) then 
		ll_rut_fall=0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'rut_fallecido',ll_rut_fall)
	end if
	if isnull(ls_dv_fall) then
		ls_dv_fall			= ''
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'dv_fallecido',ls_dv_fall)
	end if
	if isnull(ls_nombre_fall) and ll_rut_fall>0 then
		ls_nombre_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'nombre_fallecido',ls_nombre_fall)
	end if
	if isnull(ls_ap_pat_fall) and ll_rut_fall>0 then
		ls_ap_pat_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'ap_paterno_fall',ls_ap_pat_fall)
	end if
	if isnull(ls_ap_mat_fall) and ll_rut_fall>0 then
		ls_ap_mat_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'ap_materno_fall',ls_ap_mat_fall)
	end if
	if isnull(ls_sexo_fall) and ll_rut_fall>0 then
		ls_sexo_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sexo_fallecido',ls_sexo_fall)
	end if
	if isnull(ll_edad_fall) and ll_rut_fall>0 then
		ll_edad_fall		= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'edad_fallecido',ll_edad_fall)
	end if
	if isnull(ls_tipo_via_fall) and ll_rut_fall>0 then
		ls_tipo_via_fall	= '0'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'tipo_via_fallecido',ls_tipo_via_fall)
	end if
	if isnull(ls_direc_fall) and ll_rut_fall>0 then
		ls_direc_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'direccion_fall',ls_direc_fall)
	end if
	if isnull(ls_num_dir_fall) and ll_rut_fall>0 then
		ls_num_dir_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'numero_direccion_fall',ls_num_dir_fall)
	end if
	if isnull(ls_dpto_dir_fall) and ll_rut_fall>0 then
		ls_dpto_dir_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'depto_direccion_fall',ls_dpto_dir_fall)
	end if
	if isnull(ls_block_dir_fall) and ll_rut_fall>0 then
		ls_block_dir_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'block_direccion_fall',ls_block_dir_fall)
	end if
	if isnull(ls_sector_fall) and ll_rut_fall>0 then
		ls_sector_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sector_fall',ls_sector_fall)
	end if
	if isnull(ls_villa_fall) and ll_rut_fall>0 then
		ls_villa_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'poblacion_villa_fall',ls_villa_fall)
	end if
	if isnull(ls_ciud_fall) and ll_rut_fall>0 then
		ls_ciud_fall		= '0'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'codigo_ciudad_fall',ls_ciud_fall)
		if idw_detalle2.retrieve(ls_ciud_fall)=0 then
			idw_detalle2.insertrow(0)
		end if
	end if
	if (isnull(ls_comu_fall) or ls_ciud_fall='0') and ll_rut_fall>0 then
		ls_comu_fall		= '0'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'codigo_comuna_fall',ls_comu_fall)
	end if
	if isnull(ls_cod_est_fall) and ll_rut_fall>0 then
		ls_cod_est_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_estado_fall',ls_cod_est_fall)
	end if
	if isnull(ls_tamano) and ll_rut_fall>0 then
		ls_tamano	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_tamano_cuerpo',ls_tamano)
	end if
	if isnull(ls_obs_fall) and ll_rut_fall>0 then
		ls_obs_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'observacion_fallecido',ls_obs_fall)
	end if
	if isnull(ls_causa_fall) and ll_rut_fall>0 then
		ls_causa_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'causa_fallecimiento',ls_causa_fall)
	end if
	
	if isnull(ls_usar_capilla) then
		ls_usar_capilla	= 'N'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'usar_capilla',ls_usar_capilla)
	end if
	if isnull(ll_hora_uso_capilla) then
		ll_hora_uso_capilla	= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'hora_util_capilla',ll_hora_uso_capilla)
	end if
	if isnull(ll_min_uso_capilla) then
		ll_min_uso_capilla	= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'minuto_util_capilla',ll_min_uso_capilla)
	end if
//	if isnull(ll_rut_tit) then
//		ll_rut_tit			= 0
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'rut_titular',ll_rut_tit)
//	end if
//	if isnull(ls_dv_tit) then
//		ls_dv_tit			= ''
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'dv_titular',ls_dv_tit)
//	end if
//	if isnull(ls_nombre_tit) then
//		ls_nombre_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'nombre_titular',ls_nombre_tit)
//	end if
//	if isnull(ls_ap_pat_tit) then
//		ls_ap_pat_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'ap_paterno_titular',ls_ap_pat_tit)
//	end if
//	if isnull(ls_ap_mat_tit) then
//		ls_ap_mat_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'ap_materno_titular',ls_ap_mat_tit)
//	end if
//	if isnull(ls_tipo_via_tit) then
//		ls_tipo_via_tit	= '0'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'tipo_via_titular',ls_tipo_via_tit)
//	end if
//	if isnull(ls_direc_tit) then
//		ls_direc_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'direccion_titular',ls_direc_tit)
//	end if
//	if isnull(ls_num_dir_tit) then
//		ls_num_dir_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'num_direccion_titular',ls_num_dir_tit)
//	end if
//	if isnull(ls_dpto_dir_tit) then
//		ls_dpto_dir_tit	= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'depto_direccion_titular',ls_dpto_dir_tit)
//	end if
//	if isnull(ls_block_dir_tit) then
//		ls_block_dir_tit	= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'block_direccion_titular',ls_block_dir_tit)
//	end if
//	if isnull(ls_villa_tit) then
//		ls_villa_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'poblacion_villa_titular',ls_villa_tit)
//	end if
//	if isnull(ls_sector_tit) then
//		ls_sector_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'sector_titular',ls_sector_tit)
//	end if
//	if isnull(ls_ciud_tit) then
//		ls_ciud_tit			= '0'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'codigo_ciudad_titular',ls_ciud_tit)
//		if idw_detalle3.retrieve(ls_ciud_tit)=0 then
//			idw_detalle3.insertrow(0)
//		end if
//	end if
//	if isnull(ls_comu_tit) or ls_ciud_tit='0' then
//		ls_comu_tit			= '0'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'codigo_comuna_titular',ls_comu_tit)
//	end if
	if isnull(ls_fono_titular) then
		ls_fono_titular	= '-'
		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'fono_titular',ls_fono_titular)
	end if
	if isnull(ls_ejecutivo) then
		ls_ejecutivo		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_ejecutivo',ls_ejecutivo)
	end if
//	if isnull(ll_hora_sepult) then
//		ll_hora_sepult		= 0
//		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora',ll_hora_sepult)
//	end if
	if isnull(ll_minuto_sepult) then
		ll_minuto_sepult	= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minutos',ll_minuto_sepult)
	end if
	if isnull(ll_funeraria) then
		ll_funeraria		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_funeraria',ll_funeraria)
	end if
	if isnull(ls_fono_funera) then
		ls_fono_funera		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fono_funeraria',ls_fono_funera)
	end if
	if isnull(ls_pase_sepult) then
		ls_pase_sepult		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pase_sepultacion',ls_pase_sepult)
	end if
	if isnull(ll_capacidad) then
		ll_capacidad		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'capacidad',ll_capacidad)
	end if
	if isnull(ls_nivel) then
		ls_nivel				= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'nivel',ls_nivel)
	end if
	if isnull(ll_cant_sepultados) then
		ll_cant_sepultados=0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cantidad_sepultados',ll_cant_sepultados)	
	end if
	if isnull(ls_est_sep_compl) then
		ls_est_sep_compl	= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_sepultura_completa',ls_est_sep_compl)
	end if
	if isnull(ll_cap_libre_sep) then
		ll_cap_libre_sep	= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'capacidad_libre_sepultura',ll_cap_libre_sep)
	end if
	if isnull(ls_obs_sep_comp) then
		ls_obs_sep_comp	= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_sepultura_completa',ls_obs_sep_comp)
	end if
	if isnull(ll_est_credito) then
		ll_est_credito		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_credito',ll_est_credito)
	end if
	if isnull(ls_obs_credito) then
		ls_obs_credito		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_credito',ls_obs_credito)
	end if
	if isnull(ll_est_manten) then
		ll_est_manten		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_mantencion',ll_est_manten)
	end if
	if isnull(ls_obs_manten) then
		ls_obs_manten		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_mantencion',ls_obs_manten)
	end if
	if isnull(ldb_monto_canc) then
		ldb_monto_canc		= 0
		tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'monto_cancelar',ldb_monto_canc)
	end if
	if isnull(ll_comprobante) then
		ll_comprobante		= 0
		tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'folio_comprobante',ll_comprobante)
	end if
	if (ls_base='O' and ll_numero>=84001 and gs_conexion="Parque El Prado") or &
		(ls_base='O' and ll_numero>=15885 and gs_conexion="Parque La Foresta") then
		SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
		INTO 		:ll_parque_aux,				:ls_cod_age_aux  
		FROM 		"CD_FOLIO"  
		WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
				 //( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
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
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
		ls_sw		= 'N'
		exit
	elseif ls_estado_doc2 = 'S' then
		messagebox("Advertencia","Contrato No Existe en Control Documentario")
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
		ls_sw		= 'N'
		exit
	//FICHA SEPULTACION//
	elseif isnull(ll_hora_sepult) then
		messagebox('Advertencia','Debe Ingresar HORA DE SEPULTACION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ejecutivo) or ls_ejecutivo='' then
		messagebox('Advertencia','Debe Ingresar CODIGO EJECUTIVO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_ejecutivo')
		ls_sw		= 'N'
		exit
	elseif isnull(ldt_fech_sepult) then
		messagebox('Advertencia','Debe Ingresar FECHA SEPULTACION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_sepultacion')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_minuto_sepult) then
		messagebox('Advertencia','Debe Ingresar MINUTO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('minutos')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_funeraria) then
		messagebox('Advertencia','Debe Ingresar FUNERARIA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_funeraria')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_fono_funera) or ls_fono_funera='' then
		messagebox('Advertencia','Debe Ingresar FONO FUNERARIA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fono_funeraria')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_pase_sepult) or ls_pase_sepult='' then
		messagebox('Advertencia','Debe Ingresar PASE DE SEPULTACION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('pase_sepultacion')
		ls_sw		= 'N'
		exit
	elseif (isnull(ls_base) or ls_base='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar TIPO DE CONTRATO "BASE"')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('base')
		ls_sw		= 'N'
		exit
	elseif (isnull(ls_serie) or ls_serie='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar SERIE DE CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('serie')
		ls_sw		= 'N'
		exit
	elseif (isnull(ll_numero) or ll_numero=0) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar NUMERO DE CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
		ls_sw		= 'N'
		exit
	elseif (isnull(ldt_fech_contrato) or string(ldt_fech_contrato)='00/00/0000') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar FECHA DE CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_contrato')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_estad_contrato) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar ESTADO CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_estado_contrato')
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
		messagebox('Advertencia','Debe Ingresar SECTOR')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sepultura) or ls_sepultura='' then
		messagebox('Advertencia','Debe Ingresar SEPULTURA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura')
		ls_sw		= 'N'
		exit
	elseif (isnull(ls_numero_tecni) or ls_numero_tecni='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar NUMERO TECNICO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_tecnico')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_capacidad) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar CAPACIDAD')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('capacidad')
		ls_sw		= 'N'
		exit
	elseif (isnull(ls_nivel) or ls_nivel='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar NIVEL')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('nivel')
		ls_sw		= 'N'
		exit
	elseif (isnull(ll_cant_sepultados) or ll_cant_sepultados < 0) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar CANTIDAD DE SEPULTADOS')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cantidad_sepultados')
		ls_sw		= 'N'
		exit
	elseif (isnull(ls_est_sep_compl) or ls_est_sep_compl='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar ESTADO SEPULTURA COMPLETA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_sepultura_completa')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_cap_libre_sep) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar CAPACIDAD LIBRE DE SEPULTURA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('capacidad_libre_sepultura')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_obs_sep_comp) or ls_obs_sep_comp='' then
		messagebox('Advertencia','Debe Ingresar OBSERVACION SEPULTURA COMPLETA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('observacion_sepultura_completa')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_est_credito) then
		messagebox('Advertencia','Debe Ingresar ESTADO CREDITO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_credito')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_est_manten) then
		messagebox('Advertencia','Debe Ingresar ESTADO MANTENCION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_mantencion')
		ls_sw		= 'N'
		exit
	elseif isnull(ldt_fech_recep) and is_usuario_esta='S' then
		messagebox('Advertencia','Debe Ingresar FECHA DE RECEPCION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_recepcion')
		ls_sw		= 'N'
		exit
	//FICHA FALLECIDO //
	elseif isnull(ll_rut_fall) then
		messagebox('Advertencia','Debe Ingresar RUT FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_dv_fall) then
		messagebox('Advertencia','Debe Ingresar DIGITO VERIFICADOR')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('dv_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_nombre_fall) or ls_nombre_fall='' then
		messagebox('Advertencia','Debe Ingresar NOMBRE FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('nombre_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ap_pat_fall) or ls_ap_pat_fall='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO PATERNO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('ap_paterno_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ap_mat_fall) or ls_ap_mat_fall='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO MATERNO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('ap_materno_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sexo_fall) or ls_sexo_fall='' then
		messagebox('Advertencia','Debe Ingresar SEXO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('sexo_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ldt_fec_nac) then
		messagebox('Advertencia','Debe Ingresar FECHA NACIMIENTO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('fecha_nacimiento_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ll_edad_fall) then
		messagebox('Advertencia','Debe Ingresar EDAD FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('edad_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_periodo_nac) then
		messagebox('Advertencia','Debe Ingresar PERIODO NACIMIENTO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('periodo_nacimiento')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_tipo_via_fall) or ls_tipo_via_fall='' then
		messagebox('Advertencia','Debe Ingresar TIPO VIA')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('tipo_via_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_direc_fall) or ls_direc_fall='' then
		messagebox('Advertencia','Debe Ingresar DIRECCION FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('direccion_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_num_dir_fall) or ls_num_dir_fall='' then
		messagebox('Advertencia','Debe Ingresar NUMERO DIRECCION')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('numero_direccion_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_dpto_dir_fall) or ls_dpto_dir_fall='' then
		messagebox('Advertencia','Debe Ingresar DEPTO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('depto_direccion_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_block_dir_fall) or ls_block_dir_fall='' then
		messagebox('Advertencia','Debe Ingresar BLOCK')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('block_direccion_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sector_fall) or ls_sector_fall='' then
		messagebox('Advertencia','Debe Ingresar SECTOR')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('sector_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_villa_fall) or ls_villa_fall='' then
		messagebox('Advertencia','Debe Ingresar VILLA O POBLACION')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('poblacion_villa_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ciud_fall) or ls_ciud_fall='' then
		messagebox('Advertencia','Debe Ingresar CIUDAD')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('codigo_ciudad_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_comu_fall) or ls_comu_fall='' then
		messagebox('Advertencia','Debe Ingresar COMUNA')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('codigo_comuna_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_cod_est_fall) or ls_cod_est_fall='' then
		messagebox('Advertencia','Debe Ingresar ESTADO CUERPO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('cod_estado_fall')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_tamano) or ls_tamano='' then
		messagebox('Advertencia','Debe Ingresar TAMAÑO CUERPO FALLECIDO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('cod_tamano_cuerpo')
		ls_sw		= 'N'
		exit
	elseif isnull(ldt_fec_defun) then
		messagebox('Advertencia','Debe Ingresar FECHA DE DEFUNCION')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('fecha_defuncion')
		ls_sw		= 'N'
		exit
//	elseif ll_parque1=102 and ls_usar_capilla='S' and (ll_hora_uso_capilla=0 or isnull(ll_hora_uso_capilla)) then
//		messagebox('Advertencia','Debe Ingresar HORARIO UTILIZACION DE CAPILLA')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('hora_util_capilla')
//		ls_sw		= 'N'
//		exit
	elseif isnull(ls_obs_fall) or ls_obs_fall='' then
		messagebox('Advertencia','Debe Ingresar OBSERVACION FALLECIMIENTO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('observacion_fallecido')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_causa_fall) or ls_causa_fall='' then
		messagebox('Advertencia','Debe Ingresar CAUSA FALLECIMIENTO')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('causa_fallecimiento')
		ls_sw		= 'N'
		exit
		//FICHA TITULAR//
	elseif isnull(ll_rut_tit) then
		messagebox('Advertencia','Debe Ingresar RUT TITULAR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('rut_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_dv_tit) or ls_dv_tit='' then
		messagebox('Advertencia','Debe Ingresar DIGITO VERIFICADOR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('dv_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_nombre_tit) or ls_nombre_tit='' then
		messagebox('Advertencia','Debe Ingresar NOMBRE FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('nombre_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ap_pat_tit) or ls_ap_pat_tit='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO PATERNO FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('ap_paterno_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ap_mat_tit) or ls_ap_mat_tit='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO MATERNO FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('ap_materno_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_tipo_via_tit) or ls_tipo_via_tit='' then
		messagebox('Advertencia','Debe Ingresar TIPO VIA')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('tipo_via_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_direc_tit) or ls_direc_tit='' then
		messagebox('Advertencia','Debe Ingresar DIRECCION FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('direccion_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_num_dir_tit) or ls_num_dir_tit='' then
		messagebox('Advertencia','Debe Ingresar NUMERO DIRECCION')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('num_direccion_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_dpto_dir_tit) or ls_dpto_dir_tit='' then
		messagebox('Advertencia','Debe Ingresar DEPTO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('depto_direccion_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_block_dir_tit) or ls_block_dir_tit='' then
		messagebox('Advertencia','Debe Ingresar BLOCK')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('block_direccion_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_sector_tit) or ls_sector_tit='' then
		messagebox('Advertencia','Debe Ingresar SECTOR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('sector_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_villa_tit) or ls_villa_tit='' then
		messagebox('Advertencia','Debe Ingresar VILLA O POBLACION')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('poblacion_villa_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_ciud_tit) or ls_ciud_tit='' then
		messagebox('Advertencia','Debe Ingresar CIUDAD')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('codigo_ciudad_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_comu_tit) or ls_comu_tit='' then
		messagebox('Advertencia','Debe Ingresar COMUNA')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('codigo_comuna_titular')
		ls_sw		= 'N'
		exit
	elseif isnull(ls_fono_titular) or ls_fono_titular='' then
		messagebox('Advertencia','Debe Ingresar FONO TITULAR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_titular')
		ls_sw		= 'N'
		exit
	//ARANCELES//
	elseif isnull(ls_parentesco) or ls_parentesco='' then
		tab_1.SelectedTab	= 4
		messagebox('Advertencia','Debe Ingresar PARENTESCO')
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('codigo_parentesco')
		ls_sw		= 'N'
		exit
//	elseif ll_sw_otros_pagos=0 and (isnull(ldb_otros_pagos) or ldb_otros_pagos=0) then
//		messagebox('Advertencia','Debe Ingresar MONTO OTROS PAGOS A CANCELAR')
//		tab_1.SelectedTab	= 4
//		tab_1.tabpage_4.dw_aranceles.setfocus()
//		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
//		tab_1.tabpage_4.dw_aranceles.setcolumn('valor_otros_pagos')
//		ls_sw		= 'N'
//		exit
	elseif isnull(ldb_monto_canc) then
		tab_1.SelectedTab	= 4
		messagebox('Advertencia','Debe Ingresar MONTO A CANCELAR')
		tab_1.tabpage_4.dw_aranceles.setfocus()
		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_cancelar')
		ls_sw		= 'N'
		exit
//	elseif (ls_descto_1='109' or ls_descto_1='122' or ls_descto_2='109' or ls_descto_2='122' or ls_descto_3='109' or ls_descto_3='122' or ls_descto_4='109' or ls_descto_4='122' or &
//			 ls_descto_5='109' or ls_descto_5='122' or ls_descto_6='109' or ls_descto_6='122') and (isnull(ls_obs_benef) or ls_obs_benef='-') then
	elseif (((ls_descto_1<>'109' and ls_descto_1<>'122') and not isnull(ls_descto_1)) or ((ls_descto_2<>'109' and ls_descto_2<>'122') and not isnull(ls_descto_2)) or ((ls_descto_3<>'109' and ls_descto_3<>'122') and not isnull(ls_descto_3)) or ((ls_descto_4<>'109' and ls_descto_4<>'122') and not isnull(ls_descto_4)) or &
			((ls_descto_5<>'109' and ls_descto_5<>'122') and not isnull(ls_descto_5)) or ((ls_descto_6<>'109' and ls_descto_6<>'122') and not isnull(ls_descto_6)) ) and (isnull(ls_obs_benef) or ls_obs_benef='-') then
		SELECT 	Count("TIPO_PROMOCION_ASOCIADOS"."BASE"  )
		INTO 		:ll_count_pend_ben  
		FROM 	"TIPO_PROMOCION_ASOCIADOS"  
		WHERE ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :gs_base ) AND  
				( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :gs_serie ) AND  
				( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
				( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" = 'P' ) AND  
				("TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = 4 OR  	"TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = 6)   ;
		if ll_count_pend_ben = 0 then
			messagebox('Advertencia','Debe Ingresar Observación Beneficio')
	//		109 DESCUENTO BENEFICIO
	//		122 DESCUENTO SEPULTACION BENEFICIO
	
			tab_1.SelectedTab	= 4
			tab_1.tabpage_4.dw_aranceles.setfocus()
			tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
			tab_1.tabpage_4.dw_aranceles.setcolumn('observacion_beneficio')
			ls_sw		= 'N'
			exit
		end if
//	elseif ll_sw_liberado = 0 and (isnull(ls_obs_benef) or ls_obs_benef='-') then
//		messagebox('Advertencia','Debe Ingresar Observación Beneficio')
//		tab_1.SelectedTab	= 4
//		tab_1.tabpage_4.dw_aranceles.setfocus()
//		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
//		tab_1.tabpage_4.dw_aranceles.setcolumn('observacion_beneficio')
//		ls_sw		= 'N'
//		exit
	end if
	if ls_usar_capilla='S' and isnull(ll_sala_velatorio) then
		messagebox('Advertencia','Debe Ingresar Sala Velatorio')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('sala_velatorio')
		ls_sw		= 'N'
		exit
	elseif ls_usar_capilla='S' and isnull(ldt_fecha_inivela) then
		messagebox('Advertencia','Debe Ingresar Fecha Inicio Velatorio')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('fecha_ini_velatorio')
		ls_sw		= 'N'
		exit
	elseif ls_usar_capilla='S' and ll_hora_uso_capilla= 0 then
		messagebox('Advertencia','Debe Ingresar Hora Inicio Velatorio')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('hora_util_capilla')
		ls_sw		= 'N'
		exit
		
	elseif ls_usar_capilla='S' and isnull(ldt_fecha_finvela) then
		messagebox('Advertencia','Debe Ingresar Fecha Término Velatorio')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('fecha_fin_velatorio')
		ls_sw		= 'N'
		exit
	elseif ls_usar_capilla='S' and ll_hora_finvela= 0 then
		messagebox('Advertencia','Debe Ingresar Hora Término Velatorio')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('hora_util_capilla_fin')
		ls_sw		= 'N'
		exit
	elseif ls_usar_templo='S' and isnull(ll_sala_templo) then
		messagebox('Advertencia','Debe Ingresar Sala Templo')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('sala_templo')
		ls_sw		= 'N'
		exit
	elseif ls_usar_templo='S' and ll_hora_ini_templo= 0 then
		messagebox('Advertencia','Debe Ingresar Hora Inicio Uso Templo')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('hora_util_templo')
		ls_sw		= 'N'
		exit
	elseif ls_usar_templo='S' and ll_hora_fin_templo= 0 then
		messagebox('Advertencia','Debe Ingresar Hora Inicio Uso Templo')
		tab_1.SelectedTab	= 3
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
		tab_1.tabpage_1.dw_ant_fall.setcolumn('hora_util_fin_templo')
		ls_sw		= 'N'
		exit
	end if
next
return(ls_sw)
end function

public subroutine wf_setear_datos ();Long		ll_tot_reg,ll_indi,ll_corr_interno,ll_rut_fall,ll_edad_fall,ll_rut_tit,ll_comprobante,ll_hora_def,ll_min_def,ll_sw_derecho_sepult,ll_sw_pago_liberado,ll_hora_util,ll_minuto_util,&
			ll_sw_tit_fall,ll_sw_otros_pagos,ll_sw_alto_impacto,ll_sw_pago_1,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,ll_sw_dscto_1,ll_sw_dscto_2,&
			ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6,ll_rut_tercero,ll_covid,ls_covid_protocol,ll_hora_templo,ll_hora_capilla_fin,ll_minuto_capilla_fin,ll_minuto_templo,&
			ll_hora_fin_templo,ll_minuto_fin_templo,ll_sala_templo,ll_sala_velatorio
String		ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_sexo_fall,ls_tipo_via_fall,ls_direc_fall,ls_num_dir_fall,ls_dpto_dir_fall,ls_block_dir_fall,ls_sector_fall,&
			ls_villa_fall,ls_ciud_fall,ls_comu_fall,ls_cod_est_fall,ls_causa_fall,ls_dv_tit,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_tipo_via_tit,ls_direc_tit,ls_num_dir_tit,&
			ls_dpto_dir_tit,ls_block_dir_tit,ls_villa_tit,ls_sector_tit,ls_ciud_tit,ls_comu_tit,ls_fono_funera,ls_pase_sepult,ls_base,ls_serie,ls_fono_titular,ls_ejecutivo,ls_estad_contrato,&
			ls_sector,ls_sepultura,ls_numero_tecni,ls_nivel,ls_est_sep_compl,ls_obs_sep_comp,ls_obs_credito,ls_obs_manten,ls_parentesco,ls_obs,ls_capilla,ls_dir_capilla,ls_periodo_nac,ls_tamano,&
			ls_obs_fall,ls_usar_capilla,ls_obs_alto_impacto,ls_obs_cuerpo,ls_cod_est_ctto,ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6,ls_dscto_1,ls_dscto_2,ls_dscto_3,ls_dscto_4,&
			ls_dscto_5,ls_dscto_6,ls_dscto_d1,ls_dscto_d2,ls_dscto_d3,ls_dscto_d4,ls_dscto_d5,ls_dscto_d6,ls_pago_d1,ls_pago_d2,ls_pago_d3,ls_pago_d4,ls_pago_d5,ls_pago_d6,&
			ls_qr,ls_cel_titular,ls_nombre_contac,ls_dire_contac,ls_fono_contac,ls_cel_contac,ls_email_contac,ls_parentesco_contac,ls_nombre_tercero,ls_dire_tercero,ls_fono_tercero,&
			ls_cel_tercero,ls_email_tercero,ls_email_pagador,ls_dv_tercero,ls_ap_pater_tercero,ls_ap_mater_tercero,ls_parentesco_tercero,ls_email,ls_obs_templo,ls_usar_templo,&
			ls_obs_beneficio
Datetime	ldt_fec_defun,ldt_fec_nac,ldt_fech_sepult,ldt_fech_contrato,ldt_fech_recep,ldt_fec_ini_velatorio,ldt_fec_fin_velatorio
Double	ldb_uf_dia,ldb_der_sepult_uf,ldb_pago_1,ldb_pago_2,ldb_pago_3,ldb_pago_4,ldb_pago_5,ldb_pago_6,ldb_monto_canc,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,&
			ldb_dscto_6,ldb_total_dscto,ll_numero,ldb_dscto_d1,ldb_dscto_d2,ldb_dscto_d3,ldb_dscto_d4,ldb_dscto_d5,ldb_dscto_d6,ldb_pago_d1,ldb_pago_d2,ldb_pago_d3,&
			ldb_pago_d4,ldb_pago_d5,ldb_pago_d6
	
ll_tot_reg						= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_cod_est_ctto				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'cod_estado_contrato')
	ls_base						= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'base')
	ls_serie						= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'serie')
	ll_numero					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'numero')
	if not isnull(ls_base) and not isnull(ls_serie) and isnull(ls_cod_est_ctto) and ll_numero>0 then
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_estado_contrato','E')
	end if
	ll_corr_interno				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_interno')
	ll_covid						= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'sw_covid_19')
	ls_covid_protocol			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'sw_protocolo_covid')
	ls_qr							= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'qr_ficha')
	ll_rut_fall						= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'rut_fallecido')
	ls_dv_fall						= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'dv_fallecido')
	ls_nombre_fall		 		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'nombre_fallecido')
	ls_ap_pat_fall		 		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_paterno_fall')
	ls_ap_mat_fall		 		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_materno_fall')
	ls_sexo_fall      			= tab_1.tabpage_1.dw_ant_fall.getItemString(ll_indi,'sexo_fallecido')
	ll_edad_fall     				= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'edad_fallecido')
	ls_tipo_via_fall  			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'tipo_via_fallecido')
	ls_direc_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'direccion_fall')
	ls_num_dir_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'numero_direccion_fall')
	ls_dpto_dir_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'depto_direccion_fall')
	ls_block_dir_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'block_direccion_fall')
	ls_sector_fall	   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'sector_fall')
	ls_villa_fall	   				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'poblacion_villa_fall')
	ls_ciud_fall	 				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_ciudad_fall')
	ls_comu_fall	   				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_comuna_fall')
	ls_cod_est_fall   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_estado_fall')
	ls_causa_fall	   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'causa_fallecimiento')
	ls_capilla						= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'capilla_velatoria')
	ls_dir_capilla				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'direccion_capilla')
	ldt_fec_defun	   			= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_defuncion')
	ldt_fec_nac 	   				= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_nacimiento_fall')
	ls_periodo_nac				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'periodo_nacimiento')
	ls_tamano					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_tamano_cuerpo')
	ls_obs_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'observacion_fallecido')
	ls_usar_capilla				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'usar_capilla')
	ll_hora_util					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_capilla')
	ll_minuto_util				= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'minuto_util_capilla')
	ll_sw_tit_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sw_titular_fall')
	ll_sw_alto_impacto		= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sw_alto_impacto')
	ls_obs_alto_impacto		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'obs_alto_impacto')
	ls_obs_cuerpo				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_obs_cuerpo')
	ll_hora_templo				= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_templo')
	ll_minuto_templo			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'minuto_util_templo')
	ls_usar_templo				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'usar_templo')
	ll_hora_fin_templo			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_fin_templo')
	ll_minuto_fin_templo		= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'minuto_util_fin_templo')
	ls_obs_templo				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'observacion_templo')
	ll_hora_capilla_fin			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_capilla_fin')
	ll_minuto_capilla_fin		= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'minuto_util_capilla_fin')
	ldt_fec_ini_velatorio		= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_ini_velatorio')
	ldt_fec_fin_velatorio		= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_fin_velatorio')
	ll_sala_templo				= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sala_templo')
	ll_sala_velatorio			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'sala_velatorio')

	ll_rut_tit						= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'rut_titular')
	ls_dv_tit			 			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'dv_titular')
	ls_nombre_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'nombre_titular')
	ls_ap_pat_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_paterno_titular')
	ls_ap_mat_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_materno_titular')
	ls_tipo_via_tit   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'tipo_via_titular')
	ls_direc_tit					= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'direccion_titular')
	ls_num_dir_tit	   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'num_direccion_titular')
	ls_dpto_dir_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'depto_direccion_titular')
	ls_block_dir_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'block_direccion_titular')
	ls_villa_tit	   				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'poblacion_villa_titular')
	ls_sector_tit	   				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'sector_titular')
	ls_ciud_tit	 	   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_ciudad_titular')
	ls_comu_tit	      			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_comuna_titular')
	ls_fono_titular   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'fono_titular')	
	ls_cel_titular   				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'celular_titular')
	ls_email						= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'email_titular')
	//
	ls_nombre_contac			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'nombre_contacto')
	ls_dire_contac   			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'direccion_contacto')
	ls_fono_contac   			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'fono_contacto')
	ls_cel_contac   				= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'celular_contacto')
	ls_email_contac   			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'email_contacto')
	ls_parentesco_contac   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'parentesco_contacto')
	ls_email_pagador			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'email_pagador')
	
	ll_rut_tercero				= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'rut_tercero')
	ls_dv_tercero	 			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'dv_tercero')
	ls_nombre_tercero		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'nombre_tercero')
	ls_ap_pater_tercero		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'ap_paterno_tercero')
	ls_ap_mater_tercero		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'ap_materno_tercero')
	ls_dire_tercero   			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'direccion_tercero')
	ls_fono_tercero  			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'fono_tercero')
	ls_cel_tercero  				= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'celular_tercero')
	ls_email_tercero   			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'email_tercero')
//	ll_parentesco_tercero		= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'parentesco_tercero')
	ls_parentesco_tercero     = tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'parentesco_tercero')
	//
	
	ls_parentesco        		= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'codigo_parentesco')
	ldb_monto_canc       		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar')
	ll_comprobante       		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'folio_comprobante')
	ldb_uf_dia					= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'uf_dia')
	ldb_der_sepult_uf			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'valor_derecho_sepultacion_uf')
	ll_sw_derecho_sepult		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_derecho_sepult')
	ll_sw_pago_liberado		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_pago_liberado')
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
	ldb_total_dscto				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_total_dscto')
	ls_obs						= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'observacion')
	ls_obs_beneficio			= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'observacion_beneficio')
	
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'capilla_velatoria',ls_capilla)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'direccion_capilla',ls_dir_capilla)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'rut_fallecido',ll_rut_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dv_fallecido',ls_dv_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'nombre_fallecido',ls_nombre_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'ap_paterno_fall',ls_ap_pat_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'ap_materno_fall',ls_ap_mat_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sexo_fallecido',ls_sexo_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'edad_fallecido',ll_edad_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'tipo_via_fallecido',ls_tipo_via_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'direccion_fall',ls_direc_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'numero_direccion_fall',ls_num_dir_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'depto_direccion_fall',ls_dpto_dir_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'block_direccion_fall',ls_block_dir_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sector_fall',ls_sector_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'poblacion_villa_fall',ls_villa_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_ciudad_fall',ls_ciud_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_comuna_fall',ls_comu_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_estado_fall',ls_cod_est_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'causa_fallecimiento',ls_causa_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fecha_defuncion',ldt_fec_defun)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fecha_nacimiento_fall',ldt_fec_nac)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'rut_titular',ll_rut_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dv_titular',ls_dv_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'nombre_titular',ls_nombre_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'ap_paterno_titular',ls_ap_pat_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'ap_materno_titular',ls_ap_mat_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'tipo_via_titular',ls_tipo_via_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'direccion_titular',ls_direc_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'num_direccion_titular',ls_num_dir_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'depto_direccion_titular',ls_dpto_dir_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'block_direccion_titular',ls_block_dir_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'poblacion_villa_titular',ls_villa_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sector_titular',ls_sector_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_ciudad_titular',ls_ciud_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_comuna_titular',ls_comu_tit)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fono_titular',ls_fono_titular)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_util_templo',ll_hora_templo)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_util_templo',ll_minuto_templo)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_templo',ls_obs_templo)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_util_capilla_fin',ll_hora_capilla_fin)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_util_capilla_fin',ll_minuto_capilla_fin)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_util_fin_templo',ll_hora_fin_templo)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_util_fin_templo',ll_minuto_fin_templo)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'usar_templo',ls_usar_templo)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fecha_ini_velatorio',ldt_fec_ini_velatorio)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fecha_fin_velatorio',ldt_fec_fin_velatorio)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sala_templo',ll_sala_templo)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sala_velatorio',ll_sala_velatorio)

	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'celular_titular',ls_cel_titular)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'email_titular',ls_email)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'nombre_contacto',ls_nombre_contac)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'direccion_contacto',ls_dire_contac)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fono_contacto',ls_fono_contac)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'celular_contacto',ls_cel_contac)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'email_contacto',ls_email_contac)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'parentesco_contacto',ls_parentesco_contac)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'email_pagador',ls_email_pagador)
	//** Tecero
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'rut_tercero',ll_rut_tercero)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dv_tercero',ls_dv_tercero)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'nombre_tercero',ls_nombre_tercero)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'ap_paterno_tercero',ls_ap_pater_tercero)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'ap_materno_tercero',ls_ap_mater_tercero)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'direccion_tercero',ls_dire_tercero)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fono_tercero',ls_fono_tercero)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'celular_tercero',ls_cel_tercero)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'email_tercero',ls_email_tercero)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'parentesco_tercero',ls_parentesco_tercero)
	//fin juan	
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_parentesco',ls_parentesco)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_cancelar',ldb_monto_canc)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'folio_comprobante',ll_comprobante)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'uf_dia',ldb_uf_dia)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'valor_derecho_sepultacion_uf',ldb_der_sepult_uf)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_1',ldb_pago_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_2',ldb_pago_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_3',ldb_pago_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_4',ldb_pago_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_5',ldb_pago_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_otro_6',ldb_pago_6)
	
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_1',ls_pago_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_2',ls_pago_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_3',ls_pago_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_4',ls_pago_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_5',ls_pago_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pago_otro_6',ls_pago_6)
	
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_1',ls_dscto_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_2',ls_dscto_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_3',ls_dscto_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_4',ls_dscto_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_5',ls_dscto_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'dscto_otro_6',ls_dscto_6)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_total_dscto',ldb_total_dscto)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_1',ldb_dscto_1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_2',ldb_dscto_2)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_3',ldb_dscto_3)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_4',ldb_dscto_4)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_5',ldb_dscto_5)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'monto_dscto_6',ldb_dscto_6)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion',ls_obs)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_beneficio',ls_obs_beneficio)
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
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'usar_capilla',ls_usar_capilla)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_util_capilla',ll_hora_util)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_util_capilla',ll_minuto_util)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_titular_fall',ll_sw_tit_fall)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_alto_impacto',ll_sw_alto_impacto)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'obs_alto_impacto',ls_obs_alto_impacto)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_obs_cuerpo',ls_obs_cuerpo)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_covid_19',ll_covid)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sw_protocolo_covid',ls_covid_protocol)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'qr_ficha',ls_qr)
next
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
end subroutine

public subroutine wf_cargar_datos ();String	ls_cod_ejecutivo,ls_sector,ls_sepultura,ls_base,ls_serie,ls_estado_ctto,ls_nro_tecnico,&
			ls_obs_credito,ls_obs_mantencion,ls_vd_estadistico,ls_dv_titular,ls_nombre_tit,ls_ap_pat_tit,&
			ls_ap_mat_tit,ls_tipo_via_tit,ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,&
			ls_pob_villa_tit,ls_sector_tit,ls_cod_ciud_tit,ls_cod_com_tit,ls_fono_titular,ls_nro_tec_ctto,&
			ls_tipo_cons
Long		ll_cod_parque,ll_hora,ll_minutos,ll_mora_cred,ll_mora_mant,ll_hora_recep,ll_minuto_recep,&
			ll_hora_lleg_efec,ll_minu_lleg_efec,ll_rut_titular,ll_new_titular,ll_capacidad_ctto,ll_nro_tec_ctto,&
			ll_new_fall,ll_new_ara,ll_new
Datetime	ldt_fecha_sepult,ldt_fecha_ctto,ldt_fecha_recep
Double	ll_numero

is_nuevo												= 'S'
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
tab_1.tabpage_2.dw_ant_titular.enabled		= true
tab_1.tabpage_1.dw_ant_fall.enabled			= true
tab_1.tabpage_4.dw_aranceles.enabled		= true
ls_cod_ejecutivo  = tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'codigo_ejecutivo')
ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector')
ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sepultura')
ll_hora				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'hora')
ll_minutos			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'minutos')
ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(1,'fecha_sepultacion')
ls_base           		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'base')
ls_serie				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'serie')
ll_numero         	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'numero')
ldt_fecha_ctto		= tab_1.tabpage_3.dw_ficha_sepult.getitemDateTime(1,'fecha_contrato')
ls_estado_ctto 		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'cod_estado_contrato')
ls_nro_tecnico   	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'numero_tecnico')
il_capacidad  		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'capacidad')
ll_mora_cred		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'estado_credito')
ls_obs_credito		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'observacion_credito')
ll_mora_mant      	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'estado_mantencion')
ls_obs_mantencion = tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'observacion_mantencion')
ldt_fecha_recep	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(1,'fecha_recepcion')
ll_hora_recep		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'hora_recepcion')
ll_minuto_recep	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'minuto_recepcion')
ll_hora_lleg_efec	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'hora_llegada_efectiva')
ll_minu_lleg_efec	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'minuto_llegada_efectiva')
ls_vd_estadistico	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'vb_estadistico')

ll_rut_titular			= tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular')
ls_dv_titular			= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'dv_titular')
ls_nombre_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'nombre_titular')
ls_ap_pat_tit  		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_paterno_titular')
ls_ap_mat_tit    	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_materno_titular')
ls_tipo_via_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'tipo_via_titular')
ls_direc_tit      		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular')
ls_num_dir_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'num_direccion_titular')
ls_dpto_dir_tit 		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'depto_direccion_titular')
ls_block_dir_tit  	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'block_direccion_titular')
ls_pob_villa_tit  	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'poblacion_villa_titular')
ls_sector_tit			= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'sector_titular')
ls_cod_ciud_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
ls_cod_com_tit    	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_comuna_titular')
ls_fono_titular   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'fono_titular')
if idw_detalle3.retrieve(ls_cod_ciud_tit)=0 then
	idw_detalle3.insertrow(0)
end if
ll_new_titular		= tab_1.tabpage_2.dw_ant_titular.insertrow(0)
tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'rut_titular',ll_rut_titular)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'dv_titular',ls_dv_titular)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'nombre_titular',ls_nombre_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'ap_paterno_titular',ls_ap_pat_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'ap_materno_titular',ls_ap_mat_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'tipo_via_titular',ls_tipo_via_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'direccion_titular',ls_direc_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'num_direccion_titular',ls_num_dir_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'depto_direccion_titular',ls_dpto_dir_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'block_direccion_titular',ls_block_dir_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'poblacion_villa_titular',ls_pob_villa_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'sector_titular',ls_sector_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'codigo_ciudad_titular',ls_cod_ciud_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'codigo_comuna_titular',ls_cod_com_tit)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'fono_titular',ls_fono_titular)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'correlativo_interno',tab_1.tabpage_2.dw_ant_titular.rowcount())
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'cod_parque',ll_cod_parque)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'sector',ls_sector)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'sepultura',ls_sepultura)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_titular,'fecha_sepultacion',ldt_fecha_sepult)
tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
idw_detalle2.reset()
idw_detalle2.insertrow(0)
if ls_base='O' then
	SELECT	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."NRO_TECNICO",	"OFERTA_V"."TIPO_CONS"
	INTO 		:ll_capacidad_ctto,			:ls_nro_tec_ctto,					:ls_tipo_cons
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
			 (("CADENA"."CODIGO" = :ls_base ) AND  
			 ( "CADENA"."SERIE" = :ls_serie ) AND  
			 ( "CADENA"."NUMERO" = :ll_numero ) )   
	USING		sqlca;
elseif ls_base='C' then
	SELECT	"CONTRATO"."CAPACIDAD",		"CONTRATO"."NRO_TEC",	'T'
	INTO 		:ll_capacidad_ctto,			:ll_nro_tec_ctto,			:ls_tipo_cons
	FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
	WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
			 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
			 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
			 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
			 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
			 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
			 (("CADENA"."CODIGO" = :ls_base ) AND  
			 ( "CADENA"."SERIE" = :ls_serie ) AND  
			 ( "CADENA"."NUMERO" = :ll_numero ) )   
	USING		sqlca;
end if
if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
if idw_detalle7.retrieve(ll_capacidad_ctto,ll_cod_parque,ls_tipo_cons)=0 then
	idw_detalle7.reset()
	idw_detalle7.insertrow(0)
end if
ll_new_fall		= tab_1.tabpage_1.dw_ant_fall.insertrow(0)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'c_estadistico',is_usuario_esta)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_titular_fall',1)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'correlativo_interno',tab_1.tabpage_1.dw_ant_fall.rowcount())
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'usar_capilla','N')
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'usar_templo','N')
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sw_alto_impacto',1)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'cod_parque',ll_cod_parque)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sector',ls_sector)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'sepultura',ls_sepultura)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_fall,'fecha_sepultacion',ldt_fecha_sepult)
tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
ll_cod_parque	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
if idw_detalle4.retrieve(ll_cod_parque)=0 then
	idw_detalle4.insertrow(0)
end if
tab_1.tabpage_1.dw_ant_fall.accepttext()
ll_new_ara		= tab_1.tabpage_4.dw_aranceles.insertrow(0)
tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'correlativo_interno',tab_1.tabpage_4.dw_aranceles.rowcount())
tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'cod_parque',ll_cod_parque)
tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'sector',ls_sector)
tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'sepultura',ls_sepultura)
tab_1.tabpage_4.dw_aranceles.setitem(ll_new_ara,'fecha_sepultacion',ldt_fecha_sepult)
tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
if idw_detalle.retrieve(ls_base)=0 then
	idw_detalle.insertrow(0)
end if
if idw_detalle5.retrieve(ll_cod_parque)=0 then
	idw_detalle5.insertrow(0)
end if
if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
	idw_detalle6.insertrow(0)
end if
if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
	idw_detalle8.insertrow(0)
end if
ll_new			= tab_1.tabpage_3.dw_ficha_sepult.insertrow(0)
tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_new)
tab_1.tabpage_3.dw_ficha_sepult.setfocus()
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'c_estado_reg','S')
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'estado_reg','P')
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'fecha_sepultacion',ldt_fecha_sepult)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sector',ls_sector)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sepultura',ls_sepultura)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'cod_parque',ll_cod_parque)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'hora',ll_hora)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'minutos',ll_minutos)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'estado_responso','N')
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'correlativo_interno',tab_1.tabpage_3.dw_ficha_sepult.rowcount())
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'base',ls_base)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'serie',ls_serie)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'numero',ll_numero)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'fecha_contrato',ldt_fecha_ctto)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'cod_estado_contrato',ls_estado_ctto)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'numero_tecnico',ls_nro_tecnico)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'capacidad',il_capacidad)
idw_detalle7.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'estado_credito',ll_mora_cred)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'observacion_credito',ls_obs_credito)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'estado_mantencion',ll_mora_mant)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'observacion_mantencion',ls_obs_mantencion)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'fecha_recepcion',ldt_fecha_recep)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'hora_recepcion',ll_hora_recep)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',ll_minuto_recep)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'hora_llegada_efectiva',ll_hora_lleg_efec)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'minuto_llegada_efectiva',ll_minu_lleg_efec)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'vb_estadistico',ls_vd_estadistico)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_condolencia',1)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_pregrabado',1)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_tipo_ficha',1)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_protocolo_covid',1)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_covid_19',1)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
il_count_otro										= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_new)
tab_1.tabpage_3.dw_ficha_sepult.setfocus()
tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
end subroutine

public subroutine wf_actualizar_calculo (long al_fila);Double	ldb_valor_der,ldb_valor_1,ldb_valor_2,ldb_valor_3,ldb_valor_4,ldb_valor_5,ldb_valor_6,ldb_total,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,&
			ldb_dscto_6,ldb_total_dscto

tab_1.tabpage_4.dw_aranceles.accepttext()
ldb_valor_der			= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'valor_derecho_sepultacion_uf')
ldb_valor_1				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_1')
ldb_valor_2				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_2')
ldb_valor_3				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_3')
ldb_valor_4				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_4')
ldb_valor_5				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_5')
ldb_valor_6				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_otro_6')
ldb_total					= round(ldb_valor_der + ldb_valor_1 + ldb_valor_2 + ldb_valor_3 + ldb_valor_4 + ldb_valor_5 + ldb_valor_6,2)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'monto_cancelar',ldb_total)

ldb_dscto_1				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_1')
ldb_dscto_2				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_2')
ldb_dscto_3				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_3')
ldb_dscto_4				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_4')
ldb_dscto_5				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_5')
ldb_dscto_6				= tab_1.tabpage_4.dw_aranceles.getitemnumber(al_fila,'monto_dscto_6')
ldb_total_dscto			= round(ldb_dscto_1 + ldb_dscto_2 + ldb_dscto_3 + ldb_dscto_4 + ldb_dscto_5 + ldb_dscto_6,2)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'monto_total_dscto',ldb_total_dscto)
tab_1.tabpage_4.dw_aranceles.accepttext()
end subroutine

public subroutine wf_setear_arancel_sw (long al_fila);tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_derecho_sepult',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_pago_1',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_pago_2',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_pago_3',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_pago_4',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_pago_5',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_pago_6',1)

tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_pago_liberado',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_dscto_1',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_dscto_2',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_dscto_3',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_dscto_4',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_dscto_5',1)
tab_1.tabpage_4.dw_aranceles.setitem(al_fila,'sw_dscto_6',1)
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

public function string wf_validar_pregrabado ();string   	ls_sw_p='S',ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_direc_fall,ls_dpto_dir_fall,&
         	ls_block_dir_fall,ls_sector_fall,ls_villa_fall,ls_ciud_fall,ls_comu_fall,ls_cod_est_fall,ls_causa_fall,&
			ls_num_dir_fall,ls_dv_tit,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_direc_tit,ls_num_dir_tit,&
			ls_dpto_dir_tit,ls_block_dir_tit,ls_sector_tit,ls_villa_tit,ls_ciud_tit,ls_comu_tit,ls_base,&
			ls_serie,ls_estad_contrato,ls_sector,ls_sepultura,ls_numero_tecni,ls_nivel,ls_est_sep_compl,&
			ls_obs_sep_comp,ls_obs_credito,ls_obs_manten,ls_fono_titular,ls_ejecutivo,ls_fono_funera,ls_pase_sepult,&
			ls_sexo_fall,ls_tipo_via_fall,ls_tipo_via_tit,ls_parentesco,ls_sector1,ls_sepultura1,ls_obs,ls_estado_reg,&
			ls_estado_ctto,ls_cod_age_aux,ls_estado_doc1,ls_estado_doc2,ls_periodo_nac,ls_tamano,&
			ls_obs_fall,ls_usar_capilla,ls_cel_titular,ls_nombre_contac,ls_dire_contac,ls_fono_contac,ls_cel_contac,ls_email_contac,&
			ls_nombre_terc,ls_dire_terc,ls_fono_terc,ls_cel_terc,ls_email_terc,ls_dv_tercero
long 		ll_rut_fall,ret,ll_rut_tit,ll_hora_sepult,ll_minuto_sepult,ll_funeraria,&
         	ll_parque,ll_capacidad,ll_cant_sepultados,ll_cap_libre_sep,&
			ll_est_credito,ll_est_manten,ll_count,ll_hora_hoy,ll_minutos_hoy,ll_edad_fall,&
			ll_comprobante,ll_tot_reg,ll_indi,ll_corr_interno,ll_parque1,ll_parque_aux,&
			ll_hora_uso_capilla,ll_min_uso_capilla,ll_sw_otros_pagos,ll_ciudad_fall,ll_comuna_fall,ll_rut_tercero,ll_parent_terc
Datetime	ldt_fec_defun,ldt_fec_nac,ldt_fech_sepult,ldt_fech_contrato,ldt_fech_recep,ldt_fecha_hoy,&
			ldt_fecha_sepult1
Double	ldb_uf_dia,ldb_der_sepult_uf,ldb_mov_sarcofago,ldb_cambio_ubica,ldb_reduccion,ldb_cert_defuncion,&
			ldb_monto_canc,ldb_otros_pagos,ll_numero

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
ls_sector1					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector')
ls_sepultura1				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sepultura')
ldt_fecha_sepult1			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(1,'fecha_sepultacion')
tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_2.dw_ant_titular.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
tab_1.tabpage_4.dw_aranceles.accepttext()
ll_tot_reg					= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
for ll_indi=1 to ll_tot_reg
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'correlativo_interno',ll_indi)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'correlativo_interno',ll_indi)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'correlativo_interno',ll_indi)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'cod_parque',ll_parque1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'sector',ls_sector1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'sepultura',ls_sepultura1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'fecha_sepultacion',ldt_fecha_sepult1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'correlativo_interno',ll_indi)
	ll_rut_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'rut_fallecido')
	ls_dv_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'dv_fallecido')
	ls_nombre_fall		 	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'nombre_fallecido')
	ls_ap_pat_fall		 	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_paterno_fall')
	ls_ap_mat_fall		 	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_materno_fall')
	ls_sexo_fall      	= tab_1.tabpage_1.dw_ant_fall.getItemString(ll_indi,'sexo_fallecido')
	ll_edad_fall     		= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'edad_fallecido')
	ls_tipo_via_fall  	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'tipo_via_fallecido')
	ls_direc_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'direccion_fall')
	ls_num_dir_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'numero_direccion_fall')
	ls_dpto_dir_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'depto_direccion_fall')
	ls_block_dir_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'block_direccion_fall')
	ls_sector_fall	   	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'sector_fall')
	ls_villa_fall	   	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'poblacion_villa_fall')
	ls_ciud_fall	 		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_ciudad_fall')
	ls_comu_fall	   	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_comuna_fall')
	ls_cod_est_fall   	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_estado_fall')
	ls_causa_fall	   	= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'causa_fallecimiento')
	ldt_fec_defun	   	= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_defuncion')
	ldt_fec_nac 	   	= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_nacimiento_fall')
	ls_periodo_nac			= tab_1.tabpage_1.dw_ant_fall.Getitemstring(ll_indi,'periodo_nacimiento')
	ls_tamano				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_tamano_cuerpo')
	ls_obs_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'observacion_fallecido')
	ls_usar_capilla		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'usar_capilla')
	ll_hora_uso_capilla	= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'hora_util_capilla')
	ll_min_uso_capilla	= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'minuto_util_capilla')
	//ficha titular//
	ll_rut_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'rut_titular')
	ls_dv_tit			 	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'dv_titular')
	ls_nombre_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'nombre_titular')
	ls_ap_pat_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_paterno_titular')
	ls_ap_mat_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_materno_titular')
	ls_tipo_via_tit   	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'tipo_via_titular')
	ls_direc_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'direccion_titular')
	ls_num_dir_tit	   	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'num_direccion_titular')
	ls_dpto_dir_tit		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'depto_direccion_titular')
	ls_block_dir_tit		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'block_direccion_titular')
	ls_villa_tit	   	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'poblacion_villa_titular')
	ls_sector_tit	   	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'sector_titular')
	ls_ciud_tit	 	   	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_ciudad_titular')
	ls_comu_tit	      	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_comuna_titular')
	ls_fono_titular   	= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'fono_titular')
	ls_cel_titular   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'celular_titular')
	
	ls_nombre_contac	= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'nombre_contacto')
	ls_dire_contac   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'direccion_contacto')
	ls_fono_contac   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'fono_contacto')
	ls_cel_contac   		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'celular_contacto')
	ls_email_contac   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'email_contacto')
//	ll_parent_contac   	= tab_1.tabpage_2.dw_ant_titular.getitemnumber(ll_indi,'parentesco_contacto')

	ll_rut_tercero		= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'rut_tercero')
	ls_dv_tercero		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'dv_tercero')
	ls_nombre_terc		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'nombre_tercero')
	ls_dire_terc   		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'direccion_tercero')
	ls_fono_terc   		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'fono_tercero')
	ls_cel_terc   		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'celular_tercero')
	ls_email_terc   		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'email_tercero')
//	ll_parent_terc	   	= tab_1.tabpage_2.dw_ant_titular.getitemnumber(ll_indi,'parentesco_tercero')
	// ficha de sepultacion //
	ls_estado_ctto			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'c_existe_ctto')
	ls_ejecutivo        	= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'codigo_ejecutivo')
	ldt_fech_sepult   	= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_sepultacion')
	ll_hora_sepult    	= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'hora')
	ll_minuto_sepult		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'minutos')
	ll_funeraria			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'codigo_funeraria')
	ls_fono_funera			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'fono_funeraria')
	ls_pase_sepult			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'pase_sepultacion')
	ls_base					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'base')
	ls_serie					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'serie')
	ll_numero				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'numero')
	ldt_fech_contrato		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_contrato')
	ls_estad_contrato		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_estado_contrato')
	ll_parque				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque')
	ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'sector')
	ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'sepultura')
	ls_numero_tecni		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'numero_tecnico')
	ll_capacidad			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad')
	ls_nivel					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nivel')
	ll_cant_sepultados	= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cantidad_sepultados')	
	ls_est_sep_compl		= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'estado_sepultura_completa')
	ll_cap_libre_sep		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad_libre_sepultura')
	ls_obs_sep_comp		= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'observacion_sepultura_completa')
	ll_est_credito			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'estado_credito')
	ls_obs_credito			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'observacion_credito')
	ll_est_manten			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'estado_mantencion')
	ls_obs_manten			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'observacion_mantencion')
	ldt_fech_recep			= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_recepcion')
//	ll_ciudad_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'codigo_ciudad_fall')
//	ll_comuna_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'codigo_comuna_fall')
	//ARANCELES//
	ls_parentesco        = tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'codigo_parentesco')
	ldb_monto_canc       = tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar')
	ll_comprobante       = tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'folio_comprobante')
	ldb_otros_pagos		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'valor_otros_pagos')
	ll_sw_otros_pagos		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'sw_otros_pagos')

	ls_estado_doc1			= 'N'
	ls_estado_doc2			= 'N'
	if isnull(ll_rut_fall) then 
		ll_rut_fall=0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'rut_fallecido',ll_rut_fall)
	end if
	if isnull(ls_dv_fall) then
		ls_dv_fall			= ''
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'dv_fallecido',ls_dv_fall)
	end if
	if isnull(ls_nombre_fall) and ll_rut_fall>0 then
		ls_nombre_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'nombre_fallecido',ls_nombre_fall)
	end if
	if isnull(ls_ap_pat_fall) and ll_rut_fall>0 then
		ls_ap_pat_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'ap_paterno_fall',ls_ap_pat_fall)
	end if
	if isnull(ls_ap_mat_fall) and ll_rut_fall>0 then
		ls_ap_mat_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'ap_materno_fall',ls_ap_mat_fall)
	end if
	if isnull(ls_sexo_fall) and ll_rut_fall>0 then
		ls_sexo_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sexo_fallecido',ls_sexo_fall)
	end if
	if isnull(ll_edad_fall) and ll_rut_fall>0 then
		ll_edad_fall		= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'edad_fallecido',ll_edad_fall)
	end if
	if isnull(ls_tipo_via_fall) and ll_rut_fall>0 then
		ls_tipo_via_fall	= '0'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'tipo_via_fallecido',ls_tipo_via_fall)
	end if
	if isnull(ls_direc_fall) and ll_rut_fall>0 then
		ls_direc_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'direccion_fall',ls_direc_fall)
	end if
	if isnull(ls_num_dir_fall) and ll_rut_fall>0 then
		ls_num_dir_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'numero_direccion_fall',ls_num_dir_fall)
	end if
	if isnull(ls_dpto_dir_fall) and ll_rut_fall>0 then
		ls_dpto_dir_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'depto_direccion_fall',ls_dpto_dir_fall)
	end if
	if isnull(ls_block_dir_fall) and ll_rut_fall>0 then
		ls_block_dir_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'block_direccion_fall',ls_block_dir_fall)
	end if
	if isnull(ls_sector_fall) and ll_rut_fall>0 then
		ls_sector_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'sector_fall',ls_sector_fall)
	end if
	if isnull(ls_villa_fall) and ll_rut_fall>0 then
		ls_villa_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'poblacion_villa_fall',ls_villa_fall)
	end if
	if isnull(ls_ciud_fall) /*and ll_rut_fall>0*/ then
		ls_ciud_fall		= '130'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'codigo_ciudad_fall',ls_ciud_fall)
		if idw_detalle2.retrieve(ls_ciud_fall)=0 then
			idw_detalle2.insertrow(0)
		end if
		tab_1.tabpage_1.dw_ant_fall.accepttext()
	end if
	if (isnull(ls_comu_fall) or ls_ciud_fall='0') /*and ll_rut_fall>0 */ then
		ls_comu_fall		= '130001'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'codigo_comuna_fall',ls_comu_fall)
		tab_1.tabpage_1.dw_ant_fall.accepttext()
	end if
	if isnull(ls_cod_est_fall) and ll_rut_fall>0 then
		ls_cod_est_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_estado_fall',ls_cod_est_fall)
	end if
	if isnull(ls_tamano) and ll_rut_fall>0 then
		ls_tamano	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_tamano_cuerpo',ls_tamano)
	end if
	if isnull(ls_obs_fall) and ll_rut_fall>0 then
		ls_obs_fall	= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'observacion_fallecido',ls_obs_fall)
	end if
	if isnull(ls_causa_fall) and ll_rut_fall>0 then
		ls_causa_fall		= '-'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'causa_fallecimiento',ls_causa_fall)
	end if
	
	if isnull(ls_usar_capilla) then
		ls_usar_capilla	= 'N'
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'usar_capilla',ls_usar_capilla)
	end if
	if isnull(ll_hora_uso_capilla) then
		ll_hora_uso_capilla	= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'hora_util_capilla',ll_hora_uso_capilla)
	end if
	if isnull(ll_min_uso_capilla) then
		ll_min_uso_capilla	= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'minuto_util_capilla',ll_min_uso_capilla)
	end if
//	if isnull(ll_rut_tit) then
//		ll_rut_tit			= 0
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'rut_titular',ll_rut_tit)
//	end if
//	if isnull(ls_dv_tit) then
//		ls_dv_tit			= ''
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'dv_titular',ls_dv_tit)
//	end if
//	if isnull(ls_nombre_tit) then
//		ls_nombre_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'nombre_titular',ls_nombre_tit)
//	end if
//	if isnull(ls_ap_pat_tit) then
//		ls_ap_pat_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'ap_paterno_titular',ls_ap_pat_tit)
//	end if
//	if isnull(ls_ap_mat_tit) then
//		ls_ap_mat_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'ap_materno_titular',ls_ap_mat_tit)
//	end if
//	if isnull(ls_tipo_via_tit) then
//		ls_tipo_via_tit	= '0'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'tipo_via_titular',ls_tipo_via_tit)
//	end if
//	if isnull(ls_direc_tit) then
//		ls_direc_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'direccion_titular',ls_direc_tit)
//	end if
//	if isnull(ls_num_dir_tit) then
//		ls_num_dir_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'num_direccion_titular',ls_num_dir_tit)
//	end if
//	if isnull(ls_dpto_dir_tit) then
//		ls_dpto_dir_tit	= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'depto_direccion_titular',ls_dpto_dir_tit)
//	end if
//	if isnull(ls_block_dir_tit) then
//		ls_block_dir_tit	= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'block_direccion_titular',ls_block_dir_tit)
//	end if
//	if isnull(ls_villa_tit) then
//		ls_villa_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'poblacion_villa_titular',ls_villa_tit)
//	end if
//	if isnull(ls_sector_tit) then
//		ls_sector_tit		= '-'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'sector_titular',ls_sector_tit)
//	end if
//	if isnull(ls_ciud_tit) then
//		ls_ciud_tit			= '0'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'codigo_ciudad_titular',ls_ciud_tit)
//		if idw_detalle3.retrieve(ls_ciud_tit)=0 then
//			idw_detalle3.insertrow(0)
//		end if
//	end if
//	if isnull(ls_comu_tit) or ls_ciud_tit='0' then
//		ls_comu_tit			= '0'
//		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'codigo_comuna_titular',ls_comu_tit)
//	end if
	if isnull(ls_fono_titular) then
		ls_fono_titular	= '-'
		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'fono_titular',ls_fono_titular)
	end if
	if isnull(ls_cel_titular) then
		ls_cel_titular	= '-'
		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'celular_titular',ls_cel_titular)
	end if
	if isnull(ls_nombre_contac) then
		ls_nombre_contac	= '-'
		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'nombre_contacto',ls_nombre_contac)
	end if
	if isnull(ls_dire_contac) then
		ls_dire_contac	= '-'
		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'direccion_contacto',ls_dire_contac)
	end if
	if isnull(ls_fono_contac) then
		ls_fono_contac	= '-'
		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'fono_contacto',ls_dire_contac)
	end if
	if isnull(ls_cel_contac) then
		ls_cel_contac	= '-'
		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'celular_contacto',ls_cel_contac)
	end if
	if isnull(ls_email_contac) then
		ls_email_contac	= '-'
		tab_1.tabpage_2.dw_ant_titular.setitem(ll_indi,'email_contacto',ls_email_contac)
	end if
	if isnull(ls_ejecutivo) then
		ls_ejecutivo		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_ejecutivo',ls_ejecutivo)
	end if
//	if isnull(ll_hora_sepult) then
//		ll_hora_sepult		= 0
//		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora',ll_hora_sepult)
//	end if
	if isnull(ll_minuto_sepult) then
		ll_minuto_sepult	= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minutos',ll_minuto_sepult)
	end if
	if isnull(ll_funeraria) then
		ll_funeraria		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'codigo_funeraria',ll_funeraria)
	end if
	if isnull(ls_fono_funera) then
		ls_fono_funera		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'fono_funeraria',ls_fono_funera)
	end if
	if isnull(ls_pase_sepult) then
		ls_pase_sepult		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'pase_sepultacion',ls_pase_sepult)
	end if
	if isnull(ll_capacidad) then
		ll_capacidad		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'capacidad',ll_capacidad)
	end if
	if isnull(ls_nivel) then
		ls_nivel				= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'nivel',ls_nivel)
	end if
	if isnull(ll_cant_sepultados) then
		ll_cant_sepultados=0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'cantidad_sepultados',ll_cant_sepultados)	
	end if
	if isnull(ls_est_sep_compl) then
		ls_est_sep_compl	= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_sepultura_completa',ls_est_sep_compl)
	end if
	if isnull(ll_cap_libre_sep) then
		ll_cap_libre_sep	= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'capacidad_libre_sepultura',ll_cap_libre_sep)
	end if
	if isnull(ls_obs_sep_comp) then
		ls_obs_sep_comp	= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_sepultura_completa',ls_obs_sep_comp)
	end if
	if isnull(ll_est_credito) then
		ll_est_credito		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_credito',ll_est_credito)
	end if
	if isnull(ls_obs_credito) then
		ls_obs_credito		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_credito',ls_obs_credito)
	end if
	if isnull(ll_est_manten) then
		ll_est_manten		= 0
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'estado_mantencion',ll_est_manten)
	end if
	if isnull(ls_obs_manten) then
		ls_obs_manten		= '-'
		tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'observacion_mantencion',ls_obs_manten)
	end if
	if isnull(ldb_monto_canc) then
		ldb_monto_canc		= 0
		tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'monto_cancelar',ldb_monto_canc)
	end if
	if isnull(ll_comprobante) then
		ll_comprobante		= 0
		tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'folio_comprobante',ll_comprobante)
	end if
	if (ls_base='O' and ll_numero>=84001 and gs_conexion="Parque El Prado") or &
		(ls_base='O' and ll_numero>=15885 and gs_conexion="Parque La Foresta") then
		SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
		INTO 		:ll_parque_aux,				:ls_cod_age_aux  
		FROM 		"CD_FOLIO"  
		WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
				 //( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
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
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
		ls_sw_p		= 'N'
		exit
	elseif ls_estado_doc2 = 'S' then
		messagebox("Advertencia","Contrato No Existe en Control Documentario")
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
		ls_sw_p		= 'N'
		exit
	//FICHA SEPULTACION//
	elseif isnull(ll_hora_sepult) or ll_hora_sepult= 0  then
		messagebox('Advertencia','Debe Ingresar HORA DE SEPULTACION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_ejecutivo) or ls_ejecutivo='' then
		messagebox('Advertencia','Debe Ingresar CODIGO EJECUTIVO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_ejecutivo')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ldt_fech_sepult) then
		messagebox('Advertencia','Debe Ingresar FECHA SEPULTACION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_sepultacion')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ll_minuto_sepult) then
		messagebox('Advertencia','Debe Ingresar MINUTO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('minutos')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ll_funeraria) then
		messagebox('Advertencia','Debe Ingresar FUNERARIA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_funeraria')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_fono_funera) or ls_fono_funera='' then
		messagebox('Advertencia','Debe Ingresar FONO FUNERARIA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fono_funeraria')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_pase_sepult) or ls_pase_sepult='' then
		messagebox('Advertencia','Debe Ingresar PASE DE SEPULTACION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('pase_sepultacion')
		ls_sw_p		= 'N'
		exit
	elseif (isnull(ls_base) or ls_base='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar TIPO DE CONTRATO "BASE"')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('base')
		ls_sw_p		= 'N'
		exit
	elseif (isnull(ls_serie) or ls_serie='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar SERIE DE CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('serie')
		ls_sw_p		= 'N'
		exit
	elseif (isnull(ll_numero) or ll_numero=0) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar NUMERO DE CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
		ls_sw_p		= 'N'
		exit
	elseif (isnull(ldt_fech_contrato) or string(ldt_fech_contrato)='00/00/0000') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar FECHA DE CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_contrato')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_estad_contrato) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar ESTADO CONTRATO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_estado_contrato')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ll_parque) or ll_parque=0 then
		messagebox('Advertencia','Debe Ingresar PARQUE')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_sector) or ls_sector='' then
		messagebox('Advertencia','Debe Ingresar SECTOR')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_sepultura) or ls_sepultura='' then
		messagebox('Advertencia','Debe Ingresar SEPULTURA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura')
		ls_sw_p		= 'N'
		exit
	elseif (isnull(ls_numero_tecni) or ls_numero_tecni='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar NUMERO TECNICO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero_tecnico')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ll_capacidad) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar CAPACIDAD')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('capacidad')
		ls_sw_p		= 'N'
		exit
	elseif (isnull(ls_nivel) or ls_nivel='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar NIVEL')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('nivel')
		ls_sw_p		= 'N'
		exit
	elseif (isnull(ll_cant_sepultados) or ll_cant_sepultados < 0) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar CANTIDAD DE SEPULTADOS')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cantidad_sepultados')
		ls_sw_p		= 'N'
		exit
	elseif (isnull(ls_est_sep_compl) or ls_est_sep_compl='') and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar ESTADO SEPULTURA COMPLETA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_sepultura_completa')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ll_cap_libre_sep) and ls_estado_ctto<>'S' and ls_estado_ctto<>'N' then
		messagebox('Advertencia','Debe Ingresar CAPACIDAD LIBRE DE SEPULTURA')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('capacidad_libre_sepultura')
		ls_sw_p		= 'N'
		exit
//	elseif isnull(ls_obs_sep_comp) or ls_obs_sep_comp='' then
//		messagebox('Advertencia','Debe Ingresar OBSERVACION SEPULTURA COMPLETA')
//		tab_1.SelectedTab	= 1
//		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
//		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
//		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('observacion_sepultura_completa')
//		ls_sw_p		= 'N'
//		exit
	elseif isnull(ll_est_credito) then
		messagebox('Advertencia','Debe Ingresar ESTADO CREDITO')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_credito')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ll_est_manten) then
		messagebox('Advertencia','Debe Ingresar ESTADO MANTENCION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('estado_mantencion')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ldt_fech_recep) and is_usuario_esta='S' then
		messagebox('Advertencia','Debe Ingresar FECHA DE RECEPCION')
		tab_1.SelectedTab	= 1
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_indi)
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('fecha_recepcion')
		ls_sw_p		= 'N'
		exit
	//FICHA FALLECIDO //
//	elseif isnull(ll_rut_fall) then
//		messagebox('Advertencia','Debe Ingresar RUT FALLECIDO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_dv_fall) then
//		messagebox('Advertencia','Debe Ingresar DIGITO VERIFICADOR')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('dv_fallecido')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_nombre_fall) or ls_nombre_fall='' then
//		messagebox('Advertencia','Debe Ingresar NOMBRE FALLECIDO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('nombre_fallecido')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_ap_pat_fall) or ls_ap_pat_fall='' then
//		messagebox('Advertencia','Debe Ingresar APELLIDO PATERNO FALLECIDO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('ap_paterno_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_ap_mat_fall) or ls_ap_mat_fall='' then
//		messagebox('Advertencia','Debe Ingresar APELLIDO MATERNO FALLECIDO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('ap_materno_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_sexo_fall) or ls_sexo_fall='' then
//		messagebox('Advertencia','Debe Ingresar SEXO FALLECIDO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('sexo_fallecido')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ldt_fec_nac) then
//		messagebox('Advertencia','Debe Ingresar FECHA NACIMIENTO FALLECIDO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('fecha_nacimiento_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ll_edad_fall) then
//		messagebox('Advertencia','Debe Ingresar EDAD FALLECIDO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('edad_fallecido')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_periodo_nac) then
//		messagebox('Advertencia','Debe Ingresar PERIODO NACIMIENTO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('periodo_nacimiento')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_tipo_via_fall) or ls_tipo_via_fall='' then
//		messagebox('Advertencia','Debe Ingresar TIPO VIA')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('tipo_via_fallecido')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_direc_fall) or ls_direc_fall='' then
//		messagebox('Advertencia','Debe Ingresar DIRECCION FALLECIDO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('direccion_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_num_dir_fall) or ls_num_dir_fall='' then
//		messagebox('Advertencia','Debe Ingresar NUMERO DIRECCION')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('numero_direccion_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_dpto_dir_fall) or ls_dpto_dir_fall='' then
//		messagebox('Advertencia','Debe Ingresar DEPTO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('depto_direccion_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_block_dir_fall) or ls_block_dir_fall='' then
//		messagebox('Advertencia','Debe Ingresar BLOCK')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('block_direccion_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_sector_fall) or ls_sector_fall='' then
//		messagebox('Advertencia','Debe Ingresar SECTOR')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('sector_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_villa_fall) or ls_villa_fall='' then
//		messagebox('Advertencia','Debe Ingresar VILLA O POBLACION')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('poblacion_villa_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_ciud_fall) or ls_ciud_fall='' then
//		messagebox('Advertencia','Debe Ingresar CIUDAD')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('codigo_ciudad_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_comu_fall) or ls_comu_fall='' then
//		messagebox('Advertencia','Debe Ingresar COMUNA')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('codigo_comuna_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_cod_est_fall) or ls_cod_est_fall='' then
//		messagebox('Advertencia','Debe Ingresar ESTADO CUERPO FALLECIDO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('cod_estado_fall')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_tamano) or ls_tamano='' then
//		messagebox('Advertencia','Debe Ingresar TAMAÑO CUERPO FALLECIDO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('cod_tamano_cuerpo')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ldt_fec_defun) then
//		messagebox('Advertencia','Debe Ingresar FECHA DE DEFUNCION')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('fecha_defuncion')
//		ls_sw_p		= 'N'
//		exit
//	elseif ll_parque1=102 and ls_usar_capilla='S' and (ll_hora_uso_capilla=0 or isnull(ll_hora_uso_capilla)) then
//		messagebox('Advertencia','Debe Ingresar HORARIO UTILIZACION DE CAPILLA')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('hora_util_capilla')
//		ls_sw		= 'N'
//		exit
//	elseif isnull(ls_obs_fall) or ls_obs_fall='' then
//		messagebox('Advertencia','Debe Ingresar OBSERVACION FALLECIMIENTO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('observacion_fallecido')
//		ls_sw_p		= 'N'
//		exit
//	elseif isnull(ls_causa_fall) or ls_causa_fall='' then
//		messagebox('Advertencia','Debe Ingresar CAUSA FALLECIMIENTO')
//		tab_1.SelectedTab	= 3
//		tab_1.tabpage_1.dw_ant_fall.setfocus()
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_indi)
//		tab_1.tabpage_1.dw_ant_fall.setcolumn('causa_fallecimiento')
//		ls_sw		= 'N'
//		exit
		//FICHA TITULAR//
	elseif isnull(ll_rut_tit) then
		messagebox('Advertencia','Debe Ingresar RUT TITULAR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('rut_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_dv_tit) or ls_dv_tit='' then
		messagebox('Advertencia','Debe Ingresar DIGITO VERIFICADOR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('dv_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_nombre_tit) or ls_nombre_tit='' then
		messagebox('Advertencia','Debe Ingresar NOMBRE FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('nombre_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_ap_pat_tit) or ls_ap_pat_tit='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO PATERNO FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('ap_paterno_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_ap_mat_tit) or ls_ap_mat_tit='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO MATERNO FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('ap_materno_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_tipo_via_tit) or ls_tipo_via_tit='' then
		messagebox('Advertencia','Debe Ingresar TIPO VIA')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('tipo_via_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_direc_tit) or ls_direc_tit='' then
		messagebox('Advertencia','Debe Ingresar DIRECCION FALLECIDO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('direccion_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_num_dir_tit) or ls_num_dir_tit='' then
		messagebox('Advertencia','Debe Ingresar NUMERO DIRECCION')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('num_direccion_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_dpto_dir_tit) or ls_dpto_dir_tit='' then
		messagebox('Advertencia','Debe Ingresar DEPTO')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('depto_direccion_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_block_dir_tit) or ls_block_dir_tit='' then
		messagebox('Advertencia','Debe Ingresar BLOCK')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('block_direccion_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_sector_tit) or ls_sector_tit='' then
		messagebox('Advertencia','Debe Ingresar SECTOR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('sector_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_villa_tit) or ls_villa_tit='' then
		messagebox('Advertencia','Debe Ingresar VILLA O POBLACION')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('poblacion_villa_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_ciud_tit) or ls_ciud_tit='' then
		messagebox('Advertencia','Debe Ingresar CIUDAD')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('codigo_ciudad_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_comu_tit) or ls_comu_tit='' then
		messagebox('Advertencia','Debe Ingresar COMUNA')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('codigo_comuna_titular')
		ls_sw_p		= 'N'
		exit
	elseif isnull(ls_fono_titular) or ls_fono_titular='' then
		messagebox('Advertencia','Debe Ingresar FONO TITULAR')
		tab_1.SelectedTab	= 2
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_indi)
		tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_titular')
		ls_sw_p		= 'N'
		exit
	//ARANCELES//
//	elseif isnull(ls_parentesco) or ls_parentesco='' then
//		tab_1.SelectedTab	= 4
//		messagebox('Advertencia','Debe Ingresar PARENTESCO')
//		tab_1.tabpage_4.dw_aranceles.setfocus()
//		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
//		tab_1.tabpage_4.dw_aranceles.setcolumn('codigo_parentesco')
//		ls_sw		= 'N'
//		exit
//	elseif ll_sw_otros_pagos=0 and (isnull(ldb_otros_pagos) or ldb_otros_pagos=0) then
//		messagebox('Advertencia','Debe Ingresar MONTO OTROS PAGOS A CANCELAR')
//		tab_1.SelectedTab	= 4
//		tab_1.tabpage_4.dw_aranceles.setfocus()
//		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
//		tab_1.tabpage_4.dw_aranceles.setcolumn('valor_otros_pagos')
//		ls_sw		= 'N'
//		exit
//	elseif isnull(ldb_monto_canc) then
//		tab_1.SelectedTab	= 4
//		messagebox('Advertencia','Debe Ingresar MONTO A CANCELAR')
//		tab_1.tabpage_4.dw_aranceles.setfocus()
//		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
//		tab_1.tabpage_4.dw_aranceles.setcolumn('monto_cancelar')
//		ls_sw		= 'N'
//		exit
////	elseif isnull(ll_comprobante) or ll_comprobante=0 then
////		tab_1.SelectedTab	= 4
////		messagebox('Advertencia','Debe Ingresar FOLIO COMPROBANTE')
////		tab_1.tabpage_4.dw_aranceles.setfocus()
////		tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_indi)
////		tab_1.tabpage_4.dw_aranceles.setcolumn('folio_comprobante')
////		ls_sw		= 'N'
//		exit
	end if
next
return(ls_sw_p)
end function

public function string wf_valida_largo (long al_largo, string as_columna);string ls_pasa='S'

//if il_sw > 0 then
	if al_largo > 9 and as_columna='fono_contacto' then
		//messagebox('Advertencia','No puede Ingresar más de 9 Digitos en Telefono, Ingrese solo números',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'fono_contacto',is_fono_contacto)
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_contacto')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif	al_largo < 9 and as_columna='fono_contacto' then
		//messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Telefono, Ingrese solo números',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'fono_contacto',is_fono_contacto)
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_contacto')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif al_largo > 9 and as_columna='celular_contacto' then
	//	messagebox('Advertencia','No puede Ingresar más de 9 Digitos en Celular, Ingrese solo números',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'celular_contacto',is_celular_contacto)
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.setcolumn('celular_contacto')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif	al_largo < 9 and as_columna='celular_contacto' then
	//	messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Celular, Ingrese solo números',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'celular_contacto',is_celular_contacto)
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.setcolumn('celular_contacto')
		ls_pasa	= 'N'
		il_sw		= 0
	end if	
	if al_largo > 9 and as_columna='fono_tercero' then
		//messagebox('Advertencia','No puede Ingresar más de 9 Digitos en Telefono, Ingrese solo números',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'fono_tercero',is_fono_contacto)
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_tercero')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif	al_largo < 9 and as_columna='fono_tercero' then
		//messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Telefono, Ingrese solo números',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'fono_tercero',is_fono_contacto)
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_tercero')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif al_largo > 9 and as_columna='celular_tercero' then
	//	messagebox('Advertencia','No puede Ingresar más de 9 Digitos en Celular, Ingrese solo números',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'celular_tercero',is_celular_contacto)
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.setcolumn('celular_tercero')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif	al_largo < 9 and as_columna='celular_tercero' then
	//	messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Celular, Ingrese solo números',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'celular_tercero',is_celular_contacto)
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		tab_1.tabpage_2.dw_ant_titular.setcolumn('celular_tercero')
		ls_pasa	= 'N'
		il_sw		= 0
	end if	
	//tab_1.tabpage_2.dw_ant_titular.accepttext()
//end if
return ls_pasa
end function

public function string wf_validar_letras (string as_letras, string as_columna);string ls_pasa='S'

//if il_sw > 0 then
	if Match(as_letras, "[A-Z]+") and as_columna='fono_contacto' then
	//	messagebox('Advertencia','Solo debe Ingresar Números en Telefono Contacto',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'fono_contacto',is_fono_contacto)
		ls_pasa	= 'N'
		il_sw		= 0
	elseif Match(as_letras, "[A-Z]+") and as_columna='celular_contacto' then
	//	messagebox('Advertencia','Solo debe Ingresar Números en Celular Contacto',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'celular_contacto',is_celular_contacto)
		ls_pasa	= 'N'
		il_sw		= 0
	end if
	if Match(as_letras, "[A-Z]+") and as_columna='fono_tercero' then
	//	messagebox('Advertencia','Solo debe Ingresar Números en Telefono Contacto',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'fono_contacto',is_fono_contacto)
		ls_pasa	= 'N'
		il_sw		= 0
	elseif Match(as_letras, "[A-Z]+") and as_columna='celular_tercero' then
	//	messagebox('Advertencia','Solo debe Ingresar Números en Celular Contacto',stopsign!)
		tab_1.tabpage_2.dw_ant_titular.setitem(1,'celular_contacto',is_celular_contacto)
		ls_pasa	= 'N'
		il_sw		= 0
	end if
	tab_1.tabpage_2.dw_ant_titular.accepttext()
//end if
return ls_pasa
end function

public subroutine wf_validar_horario (long al_fila, string as_tipo);Long		ll_hora_fijada,ll_min_fijada,ll_parque_tras,ll_count_sep,ll_count_tras,ll_count_suma,ll_hora_fijada_t,ll_min_fijada_t,ll_numero,ll_hora_fin_fijada_t,&
			ll_min_fin_fijada_t
Datetime	ldt_fec_tras
String		ls_pasa='S'

ll_hora_fijada	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'hora')
ll_min_fijada	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'minutos')
ldt_fec_tras		= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(al_fila,'fecha_sepultacion')
ll_parque_tras	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'cod_parque')
ll_numero		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(al_fila,'numero')
if il_hora_ini = 0 or isnull(il_hora_ini) then
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
	WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_parque_tras   ;
end if
if il_hora_ini_templo = 0 or isnull(il_hora_ini_templo) then
	SELECT	"FICHA_HORAS_TEMPLO"."HORA_INICIO",   
				"FICHA_HORAS_TEMPLO"."MINUTO_INICIO",   
				"FICHA_HORAS_TEMPLO"."HORA_FINAL",   
				"FICHA_HORAS_TEMPLO"."MINUTO_FINAL",   
				"FICHA_HORAS_TEMPLO"."INTERVALO_MINUTO",   
				"FICHA_HORAS_TEMPLO"."VECES_USO"  
	INTO		:il_hora_ini_templo,   
				:il_min_ini_templo,   
				:il_hora_fin_templo,   
				:il_min_fin_templo,   
				:il_intervalo_templo,   
				:il_veces_templo  
	FROM 	"FICHA_HORAS_TEMPLO"  
	WHERE 	"FICHA_HORAS_TEMPLO"."COD_PARQUE" = :ll_parque_tras   ;
end if
if as_tipo = 'H' then
	if ll_hora_fijada>0 then
		if ll_hora_fijada < il_hora_ini or (ll_hora_fijada = il_hora_ini and ll_min_fijada < il_min_ini) then
			messagebox("Advertencia","No es Posible Ingresar Horario antes de las "+string(il_hora_ini,'00')+':'+string(il_min_ini,'00'))
			ls_pasa	= 'N'
		elseif ll_hora_fijada > il_hora_fin or (ll_hora_fijada = il_hora_fin and ll_min_fijada > il_min_fin) then
			messagebox("Advertencia","No es Posible Ingresar Horario despues de las "+string(il_hora_fin,'00')+':'+string(il_min_fin,'00'))
			ls_pasa	= 'N'
		end if
		tab_1.tabpage_3.dw_ficha_sepult.Setitem(al_fila,'hora_def',ll_hora_fijada)
		tab_1.tabpage_3.dw_ficha_sepult.Setitem(al_fila,'minuto_def',ll_min_fijada)
	end if
	if ls_pasa = 'S' then
		SELECT	Count("FICHA_SEPULTACION"."CODIGO_EJECUTIVO")  
		INTO 		:ll_count_sep
		FROM 	"FICHA_SEPULTACION"  
		WHERE  ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fec_tras ) AND 
				 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_parque_tras ) AND 
				 ( "FICHA_SEPULTACION"."HORA_DEF" = :ll_hora_fijada ) AND  
				 ( "FICHA_SEPULTACION"."MINUTO_DEF" = :ll_min_fijada )  and
				 ( "FICHA_SEPULTACION"."NUMERO" <> :ll_numero )  
		USING	sqlca;
		SELECT 	Count("FICHA_TRASLADO"."CODIGO_EJECUTIVO")  
		INTO		:ll_count_tras
		FROM 	"FICHA_TRASLADO"  
		WHERE  ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fec_tras ) AND  
				 ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_parque_tras ) AND 
				 ( "FICHA_TRASLADO"."HORA_DEF" = :ll_hora_fijada ) AND  
				 ( "FICHA_TRASLADO"."MINUTO_DEF" = :ll_min_fijada )   AND
				 ( "FICHA_TRASLADO"."NUMERO_DESTINO" <> :ll_numero )  
		USING		sqlca;
		if isnull(ll_count_sep) then ll_count_sep=0
		if isnull(ll_count_tras) then ll_count_tras=0
		ll_count_suma	= ll_count_sep + ll_count_tras
		if ll_count_suma>=il_veces then
			messagebox("Advertencia","No es posible Asignar Horario, sobrepasa lo Definido por Administración Parque")
		end if
	end if
elseif as_tipo = 'T' then
	ll_hora_fijada_t			= tab_1.tabpage_1.dw_ant_fall.getitemnumber(al_fila,'hora_util_templo')
	ll_min_fijada_t			= tab_1.tabpage_1.dw_ant_fall.getitemnumber(al_fila,'minuto_util_templo')
	ll_hora_fin_fijada_t	= tab_1.tabpage_1.dw_ant_fall.getitemnumber(al_fila,'hora_util_fin_templo')
	ll_min_fin_fijada_t		= tab_1.tabpage_1.dw_ant_fall.getitemnumber(al_fila,'minuto_util_fin_templo')
	if ll_hora_fijada_t > 0 then
		if ll_hora_fijada_t < il_hora_ini_templo or (ll_hora_fijada_t = il_hora_ini_templo and ll_min_fijada_t < il_min_ini_templo) then
			messagebox("Advertencia","No es Posible Ingresar Horario antes de las "+string(il_hora_ini_templo,'00')+':'+string(il_min_ini_templo,'00'))
			ls_pasa			= 'N'
		elseif ll_hora_fijada_t > il_hora_fin_templo or (ll_hora_fijada_t = il_hora_fin_templo and ll_min_fijada_t > il_min_fin_templo) then
			messagebox("Advertencia","No es Posible Ingresar Horario despues de las "+string(il_hora_fin_templo,'00')+':'+string(il_min_fin_templo,'00'))
			ls_pasa			= 'N'
		end if
	end if
	if ls_pasa = 'S' then
		SELECT 	COUNT("FICHA_SEPULTACION"."CODIGO_EJECUTIVO")  
		INTO 		:ll_count_sep  
		FROM 	"FICHA_SEPULTACION"  
		WHERE ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fec_tras ) AND  
				  ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_parque_tras ) AND  
				  ( "FICHA_SEPULTACION"."HORA_UTIL_TEMPLO" = :ll_hora_fijada_t ) AND  
				  ( "FICHA_SEPULTACION"."MINUTO_UTIL_TEMPLO" >= :ll_min_fijada_t ) AND  
				  ( "FICHA_SEPULTACION"."HORA_UTIL_FIN_TEMPLO" = :ll_hora_fin_fijada_t ) AND  
				  ( "FICHA_SEPULTACION"."MINUTO_UTIL_FIN_TEMPLO" <= :ll_min_fin_fijada_t )  AND
				  ( "FICHA_SEPULTACION"."NUMERO" <> :ll_numero)
		USING	sqlca;
		if isnull(ll_count_sep) then ll_count_sep=0
		if isnull(ll_count_tras) then ll_count_tras=0
		ll_count_suma	= ll_count_sep + ll_count_tras
		if ll_count_suma >= il_veces_templo then
			messagebox("Advertencia","No es posible Asignar Horario Templo, Ya existe Reserva Templo")
		end if
	end if
end if
end subroutine

public subroutine wf_carga_detalle_boletas (string as_base, string as_serie, long al_numero, long al_corr_interno, long al_rut_tit, date adt_fech_sepult, long al_parque);String		ls_estado_reg,ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6,ls_dscto_1,ls_dscto_2,ls_dscto_3,ls_dscto_4,&
			ls_dscto_5,ls_dscto_6,ls_tipo_mov,ls_tipo_cob
Long		ll_tot_reg,ll_indi,ll_sw_derecho_sepult,ll_sw_pago_1,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,&
			ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6
Double	ldb_der_sepult_uf,ldb_pago_1,ldb_pago_2,ldb_pago_3,ldb_pago_4,ldb_pago_5,ldb_pago_6,ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,&
			ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,ldb_total_dscto

DELETE FROM "FICHA_SEPULTACION_PAGO"  
WHERE 		( "FICHA_SEPULTACION_PAGO"."BASE" = :as_base ) AND  
				( "FICHA_SEPULTACION_PAGO"."SERIE" = :as_serie ) AND  
				( "FICHA_SEPULTACION_PAGO"."NUMERO" = :al_numero ) AND  
				( "FICHA_SEPULTACION_PAGO"."CORRELATIVO_FICHA" = :al_corr_interno ) AND  
				( "FICHA_SEPULTACION_PAGO"."RUT_TITULAR" = :al_rut_tit ) AND  
				( "FICHA_SEPULTACION_PAGO"."FECHA_SEPULTACION" = :adt_fech_sepult ) AND  
				( "FICHA_SEPULTACION_PAGO"."COD_PARQUE" = :al_parque ) AND
				( "FICHA_SEPULTACION_PAGO"."FOLIO_BOLETA" = 0 )
USING	sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if	
ll_tot_reg						= tab_1.tabpage_4.dw_aranceles.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_estado_reg				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'estado_reg')
	ldb_der_sepult_uf			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'valor_derecho_sepultacion_uf')
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
	ldb_total_dscto				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_total_dscto')
	
	if ldb_dscto_1 > 0 then ldb_dscto_1 = ldb_dscto_1 * -1
	if ldb_dscto_2 > 0 then ldb_dscto_2 = ldb_dscto_2 * -1
	if ldb_dscto_3 > 0 then ldb_dscto_3 = ldb_dscto_3 * -1
	if ldb_dscto_4 > 0 then ldb_dscto_4 = ldb_dscto_4 * -1
	if ldb_dscto_5 > 0 then ldb_dscto_5 = ldb_dscto_5 * -1
	if ldb_dscto_6 > 0 then ldb_dscto_6 = ldb_dscto_6 * -1
	
	if ll_sw_derecho_sepult=0 then
		ls_tipo_mov				= 'M'
		SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
		INTO 		:ls_tipo_cob  
		FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
		WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '0' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
					( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			INSERT INTO "FICHA_SEPULTACION_PAGO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   				"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
			VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_der_sepult_uf,	'0',   						:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_1 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_1,	:ls_pago_1,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_1 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_1,	:ls_dscto_1,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_2 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_2,	:ls_pago_2,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_2 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_2,	:ls_dscto_2,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_3 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_3,	:ls_pago_3,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_3 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_3,	:ls_dscto_3,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_4 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_4,	:ls_pago_4,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_4 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_4,	:ls_dscto_4,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_5 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_5,	:ls_pago_5,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_5 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_5,	:ls_dscto_5,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_pago_6 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_pago_6,	:ls_pago_6,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
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
	SELECT 	"FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE"  
	INTO 		:ls_tipo_cob  
	FROM 	"FICHA_CUENTA_CONTABLE_OTROS"  
	WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_dscto_6 ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) AND  
				( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = 'A' )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		INSERT INTO "FICHA_SEPULTACION_PAGO"  
					( "BASE",  	"SERIE",   	"NUMERO",   	"CORRELATIVO_FICHA",   	"RUT_TITULAR",   "MONTO",   		"CODIGO_OTRO",   	"TIPO_COB",		"TIPO_MOV",   	"FECHA_SEPULTACION",   	"COD_PARQUE" )  
		VALUES 	( :as_base,  :as_serie,   	:al_numero,   	:al_corr_interno,   			:al_rut_tit,   		:ldb_dscto_6,	:ls_dscto_6,   			:ls_tipo_cob,		:ls_tipo_mov,   	:adt_fech_sepult,   			:al_parque )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
	
next
end subroutine

public subroutine wf_parentesco ();String		ls_cod_parentesco,ls_base,ls_serie,ls_nulo,ls_uso_velatorio,ls_uso_templo,ls_cod_mov,ls_pasa,ls_cod_movconsulta
Long		ll_cod_parque,ll_numero,ll_reg,ll_sw_condolencia,ll_cod_benef,ll_cod_benef_det
Double	ldb_valor_uf_dia,ldb_valor_arancel,ll_valor,ll_suma_valor,ldb_valor
Datetime	ldt_fecha_hoy

Setnull(ls_nulo)
ldt_fecha_hoy		= datetime(date(gdt_fec_sistema),time('00:00:00'))
ls_cod_parentesco	= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'codigo_parentesco')
ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
ls_base				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base')
ls_serie				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie')
ll_numero			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero')
if ll_cod_parque>0 then
	if not isnull(ls_cod_parentesco) or ls_cod_parentesco<>'' then
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_valor_uf_dia  
		FROM 	"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'uf_dia',ldb_valor_uf_dia)
		end if
		tab_1.tabpage_4.dw_aranceles.accepttext()
		tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_derecho_sepult',0)
		SELECT	"PARENTESCO"."ARANCEL_DERECHO_SEPULTACION"  
		INTO 		:ldb_valor_arancel  
		FROM 	"PARENTESCO"  
		WHERE  ( "PARENTESCO"."CODIGO" = :ls_cod_parentesco ) AND  
				 ( "PARENTESCO"."COD_PARQUE" = :ll_cod_parque )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'valor_derecho_sepultacion_uf',ldb_valor_arancel)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_cancelar',ldb_valor_arancel)
			tab_1.tabpage_4.dw_aranceles.accepttext()
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_1',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_2',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_3',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_4',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_5',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_6',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_1',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_2',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_3',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_4',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_5',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_6',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_liberado',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_1',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_2',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_3',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_4',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_5',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_6',1)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_1',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_2',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_3',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_4',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_5',0)
			tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_6',0)
			ll_reg							= 0
			ll_sw_condolencia			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sw_condolencia')
			ls_uso_velatorio			= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'usar_capilla')
			ls_uso_templo				= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'usar_templo')
			DECLARE x1 CURSOR FOR  
			SELECT 	"TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO",		"TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE",	"BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA",	"CUENTA_CONTABLE_OTROS"."VALOR"  
				FROM 	"BENEFICIOS_COMPLEMENTARIO_DET",	"CUENTA_CONTABLE_OTROS",		"TIPO_PROMOCION_ASOCIADOS"  
			WHERE ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
					  ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
					  ( "BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA" = "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) and  
					  (("TIPO_PROMOCION_ASOCIADOS"."BASE" = :ls_base ) AND  
					  ( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :ls_serie ) AND  
					  ( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
					  ( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' ) AND  
					  ( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" = 'P' ) )  
			USING	sqlca;
			open x1;
			DO WHILE sqlca.sqlcode=0
				fetch x1 into :ll_cod_benef, :ll_cod_benef_det, :ls_cod_mov, :ll_valor;
				if not isnull(ls_cod_mov) and ll_valor > 0 then
//					if ( ll_sw_condolencia = 1 and ll_cod_benef=4 and ll_cod_benef_det=2 ) or ( ll_sw_condolencia = 1 and ll_cod_benef=6 and ll_cod_benef_det=15 ) then
//					if ( ll_sw_condolencia = 1 and ll_cod_benef=6 and ll_cod_benef_det=15 ) then
//						ls_pasa		= 'N'
					if ( ls_uso_velatorio = 'N' and ll_cod_benef=4 and ll_cod_benef_det=4 ) or ( ls_uso_velatorio = 'N' and ll_cod_benef=6 and ll_cod_benef_det=14 ) then
						ls_pasa		= 'N'
					elseif ( ll_cod_benef=4 and ll_cod_benef_det=2 ) or (ll_cod_benef=6 and ll_cod_benef_det=15 ) then
						ls_pasa		= 'S'
					else
						ls_pasa		= 'S'
					end if
					if ls_pasa = 'S' then
						ll_reg ++
						ll_suma_valor	= ll_suma_valor + ll_valor
						if ll_reg = 1 and isnull(tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_1')) then
							messagebox("Advertencia","Se Asignará Beneficio(s) Automáticamente, según estipulado por Contrato")
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_1',0)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_1',ls_cod_mov)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_1',ll_valor)
							tab_1.tabpage_4.dw_aranceles.accepttext()
						end if
						if ll_reg = 2 and isnull(tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_2')) then
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_2',0)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_2',ls_cod_mov)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_2',ll_valor)
							tab_1.tabpage_4.dw_aranceles.accepttext()
						end if
						if ll_reg = 3 and isnull(tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_3')) then
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_3',0)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_3',ls_cod_mov)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_3',ll_valor)
							tab_1.tabpage_4.dw_aranceles.accepttext()
						end if
						if ll_reg = 4 and isnull(tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_4')) then
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_4',0)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_4',ls_cod_mov)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_4',ll_valor)
							tab_1.tabpage_4.dw_aranceles.accepttext()
						end if
						if ll_reg = 5 and isnull(tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_5')) then
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_5',0)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_5',ls_cod_mov)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_5',ll_valor)
							tab_1.tabpage_4.dw_aranceles.accepttext()
						end if
						if ll_reg = 6 and isnull(tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_6')) then
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_6',0)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_6',ls_cod_mov)
							tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_6',ll_valor)
							tab_1.tabpage_4.dw_aranceles.accepttext()
						end if
					end if
				end if
				setnull(ll_cod_benef_det);setnull(ll_cod_benef);setnull(ls_cod_mov);setnull(ll_valor)
			LOOP
			close x1;
			if ll_reg > 0 then
				SELECT 	"BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA"
				INTO		:ls_cod_movconsulta
				FROM 	"BENEFICIOS_COMPLEMENTARIO_DET",	"TIPO_PROMOCION_ASOCIADOS"  
				WHERE ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
						  ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
						  ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :ls_base ) AND  
						  ( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :ls_serie ) AND  
						  ( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
						  ( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" = 'P' ) AND
						  ( "BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA" = 'M' )  
				USING	sqlca;
				if sqlca.sqlcode = 0 then
					//ll_suma_valor		= ll_suma_valor + ldb_valor_arancel
					tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_1',0)
					tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_1','122')
					tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_1',ldb_valor_arancel)
					tab_1.tabpage_4.dw_aranceles.accepttext()
				end if
				if ll_suma_valor > 0 then
					tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_2',0)
					tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_2','109')
					tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_2',ll_suma_valor )////NUEVO
					tab_1.tabpage_4.dw_aranceles.accepttext()
				end if
				tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'valor_derecho_sepultacion_uf',ldb_valor_arancel)
				tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_cancelar',ldb_valor_arancel)
				tab_1.tabpage_4.dw_aranceles.accepttext()
				tab_1.tabpage_4.dw_aranceles.setfocus()
				tab_1.tabpage_4.dw_aranceles.setcolumn('valor_derecho_sepultacion_uf')
			end if
			
			if ll_sw_condolencia = 0 and ll_reg = 0 then
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor
				FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"CUENTA_CONTABLE_OTROS"  
				WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "CUENTA_CONTABLE_OTROS"."TIPO_COB" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = "CUENTA_CONTABLE_OTROS"."ESTADO_REG" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '21' ) AND  
							( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) 
				USING	sqlca;
				if sqlca.sqlcode=0 then
					tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_1',0)
					tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_1','21')
					tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_1',ldb_valor)
				end if
				tab_1.tabpage_4.dw_aranceles.accepttext()
			end if
			if ls_uso_velatorio = 'S' and ll_reg = 0 then
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor
				FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"CUENTA_CONTABLE_OTROS"  
				WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "CUENTA_CONTABLE_OTROS"."TIPO_COB" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = "CUENTA_CONTABLE_OTROS"."ESTADO_REG" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '59' ) AND  
							( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) 
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_1') = 1 then
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_1',0)
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_1','59')
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_1',ldb_valor)
					elseif tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_2') = 1 then
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_2',0)
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_2','59')
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_2',ldb_valor)
					elseif tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_3') = 1 then
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_3',0)
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_3','59')
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_3',ldb_valor)
					elseif tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_4') = 1 then
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_4',0)
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_4','59')
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_4',ldb_valor)
					elseif tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_5') = 1 then
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_5',0)
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_5','59')
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_5',ldb_valor)
					end if
					tab_1.tabpage_4.dw_aranceles.accepttext()
				end if
			end if
			if ls_uso_templo = 'S' and ll_reg = 0 then
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor
				FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"CUENTA_CONTABLE_OTROS"  
				WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "CUENTA_CONTABLE_OTROS"."TIPO_COB" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = "CUENTA_CONTABLE_OTROS"."ESTADO_REG" ) and  
							( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '49' ) AND  
							( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) 
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_1') = 1 then
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_1',0)
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_1','49')
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_1',ldb_valor)
					elseif tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_2') = 1 then
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_2',0)
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_2','49')
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_2',ldb_valor)
					elseif tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_3') = 1 then
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_3',0)
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_3','49')
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_3',ldb_valor)
					elseif tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_4') = 1 then
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_4',0)
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_4','49')
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_4',ldb_valor)
					elseif tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_5') = 1 then
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_5',0)
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'pago_otro_5','49')
						tab_1.tabpage_4.dw_aranceles.setitem(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_otro_5',ldb_valor)
					end if
					tab_1.tabpage_4.dw_aranceles.accepttext()
				end if
			end if
			wf_actualizar_calculo(tab_1.tabpage_4.dw_aranceles.getrow())
		end if
	end if	
else
	messagebox("Advertencia","Debe Ingresar Parque en Ficha de Sepultación")
end if
end subroutine

on w_ingreso_ficha_sepultacion_bkp.create
this.dw_qr=create dw_qr
this.cb_2=create cb_2
this.dw_resumen=create dw_resumen
this.cb_1=create cb_1
this.cb_tablas=create cb_tablas
this.cb_volver=create cb_volver
this.cb_print=create cb_print
this.cb_eliminar=create cb_eliminar
this.cb_buscar=create cb_buscar
this.pb_primer=create pb_primer
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.pb_fin=create pb_fin
this.cb_grabar=create cb_grabar
this.cb_limpiar=create cb_limpiar
this.dw_print=create dw_print
this.tab_1=create tab_1
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.cb_carta_lapida=create cb_carta_lapida
this.cb_lapida=create cb_lapida
this.cb_carta=create cb_carta
this.Control[]={this.dw_qr,&
this.cb_2,&
this.dw_resumen,&
this.cb_1,&
this.cb_tablas,&
this.cb_volver,&
this.cb_print,&
this.cb_eliminar,&
this.cb_buscar,&
this.pb_primer,&
this.pb_sigue,&
this.pb_antes,&
this.pb_fin,&
this.cb_grabar,&
this.cb_limpiar,&
this.dw_print,&
this.tab_1,&
this.cb_cerrar,&
this.gb_1,&
this.gb_2,&
this.cb_carta_lapida,&
this.cb_lapida,&
this.cb_carta}
end on

on w_ingreso_ficha_sepultacion_bkp.destroy
destroy(this.dw_qr)
destroy(this.cb_2)
destroy(this.dw_resumen)
destroy(this.cb_1)
destroy(this.cb_tablas)
destroy(this.cb_volver)
destroy(this.cb_print)
destroy(this.cb_eliminar)
destroy(this.cb_buscar)
destroy(this.pb_primer)
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.pb_fin)
destroy(this.cb_grabar)
destroy(this.cb_limpiar)
destroy(this.dw_print)
destroy(this.tab_1)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.cb_carta_lapida)
destroy(this.cb_lapida)
destroy(this.cb_carta)
end on

event open;String		ls_area,ls_sector,ls_sepultura,ls_estado_ctto,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,ls_cod_tipo_via,ls_direccion_p,ls_nro_part,ls_string,&
			ls_depto_part,ls_block_part,ls_pob_part,ls_sector_part,ls_comuna_part,ls_ciudad_part,ls_fono_part,ls_nom_falle,ls_ap_pater_falle,ls_ap_mater_falle,ls_est_falle
Long		ll_new,ll_count_usuario,ll_new_arancel,ll_parque,ll_mora_cred,ll_mora_mant,ll_capacidad_ctto,ll_count_sol
Datetime	ldt_fecha_ctto
Double	ldb_valor_uf_dia

Connect using Trans_1;
Connect using Trans_2;
idt_fecha_sistema	= datetime(date(gdt_fec_sistema),time('00:00:00'))
gf_centrar(w_ingreso_ficha_sepultacion)
SELECT 	Count("SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD")  
INTO 		:ll_count_sol  
FROM 	"SOL_PERMISOS_USUARIO"  
WHERE ( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
			( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' ) AND  
			( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'CW' )   ;
if isnull(ll_count_sol) then ll_count_sol=0
if ll_count_sol > 0 then
	//tab_1.tabpage_4.cb_crear_cupon.visible	= true
else
	//tab_1.tabpage_4.cb_crear_cupon.visible	= false
end if

tab_1.tabpage_1.dw_ant_fall.settransobject(sqlca)
tab_1.tabpage_2.dw_ant_titular.settransobject(sqlca)
tab_1.tabpage_3.dw_ficha_sepult.settransobject(sqlca)
tab_1.tabpage_4.dw_aranceles.settransobject(sqlca)

tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_1',idw_detalle13)
idw_detalle13.settransobject(sqlca)
if idw_detalle13.retrieve('FS')=0 then
	idw_detalle13.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_2',idw_detalle14)
idw_detalle14.settransobject(sqlca)
if idw_detalle14.retrieve('FS')=0 then
	idw_detalle14.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_3',idw_detalle15)
idw_detalle15.settransobject(sqlca)
if idw_detalle15.retrieve('FS')=0 then
	idw_detalle15.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_4',idw_detalle16)
idw_detalle16.settransobject(sqlca)
if idw_detalle16.retrieve('FS')=0 then
	idw_detalle16.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_5',idw_detalle17)
idw_detalle17.settransobject(sqlca)
if idw_detalle17.retrieve('FS')=0 then
	idw_detalle17.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('pago_otro_6',idw_detalle18)
idw_detalle18.settransobject(sqlca)
if idw_detalle18.retrieve('FS')=0 then
	idw_detalle18.insertrow(0)
end if

tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_1',idw_detalle20)
idw_detalle20.settransobject(sqlca)
if idw_detalle20.retrieve('FS')=0 then
	idw_detalle20.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_2',idw_detalle21)
idw_detalle21.settransobject(sqlca)
if idw_detalle21.retrieve('FS')=0 then
	idw_detalle21.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_3',idw_detalle22)
idw_detalle22.settransobject(sqlca)
if idw_detalle22.retrieve('FS')=0 then
	idw_detalle22.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_4',idw_detalle23)
idw_detalle23.settransobject(sqlca)
if idw_detalle23.retrieve('FS')=0 then
	idw_detalle23.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_5',idw_detalle24)
idw_detalle24.settransobject(sqlca)
if idw_detalle24.retrieve('FS')=0 then
	idw_detalle24.insertrow(0)
end if
tab_1.tabpage_4.dw_aranceles.getchild('dscto_otro_6',idw_detalle25)
idw_detalle25.settransobject(sqlca)
if idw_detalle25.retrieve('FS')=0 then
	idw_detalle25.insertrow(0)
end if

dw_print.settransobject(sqlca)
//dw_qr.settransobject(sqlca)
dw_resumen.settransobject(sqlca)
is_nuevo					= 'N'
SELECT	COUNT("FICHA_USUARIO_ESTADISTICO"."USUARIO")  
INTO 		:ll_count_usuario  
FROM 		"FICHA_USUARIO_ESTADISTICO"  
WHERE  ( "FICHA_USUARIO_ESTADISTICO"."ESTADO" = 'A' ) AND  
		 ( "FICHA_USUARIO_ESTADISTICO"."USUARIO" = :gs_user )   
USING		sqlca;
if ll_count_usuario=1 then
	is_usuario_esta	= 'S'
else
	is_usuario_esta	= 'N'
end if

tab_1.tabpage_3.dw_ficha_sepult.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.insertrow(0)

tab_1.tabpage_1.dw_ant_fall.getchild('codigo_comuna_fall',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.insertrow(0)

tab_1.tabpage_2.dw_ant_titular.getchild('codigo_comuna_titular',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sector',idw_detalle5)
idw_detalle5.settransobject(sqlca)
idw_detalle5.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('nivel',idw_detalle7)
idw_detalle7.settransobject(sqlca)
idw_detalle7.insertrow(0)

tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura',idw_detalle6)
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)
tab_1.tabpage_3.dw_ficha_sepult.getchild('fecha_sepultacion_1',idw_detalle8)
idw_detalle8.settransobject(sqlca)
idw_detalle8.insertrow(0)
ll_new	= tab_1.tabpage_1.dw_ant_fall.insertrow(0)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'sw_titular_fall',1)
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'usar_capilla','N')
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'usar_templo','N')
tab_1.tabpage_1.dw_ant_fall.setitem(ll_new,'sw_alto_impacto',1)
tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'sw_tercero',1)
//tab_1.tabpage_2.dw_ant_titular.insertrow(0)
ll_new	= tab_1.tabpage_3.dw_ficha_sepult.insertrow(0)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_protocolo_covid',1)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_covid_19',1)
tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_tipo_ficha',1)
if gs_depto='R' or gs_depto='M' then
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
end if
tab_1.tabpage_4.dw_aranceles.getchild('codigo_parentesco',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	idw_detalle4.retrieve(1)
elseif gs_conexion = "Parque La Foresta" then
	idw_detalle4.retrieve(11)
end if
ll_new_arancel										= tab_1.tabpage_4.dw_aranceles.insertrow(0)
wf_setear_arancel_sw(ll_new_arancel)
//-------------- Juan
//--
tab_1.tabpage_2.dw_ant_titular.getchild('parentesco_contacto',idw_detalle9)
idw_detalle9.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	idw_detalle9.retrieve(1)
elseif gs_conexion = "Parque La Foresta" then
	idw_detalle9.retrieve(11)
end if
//tab_1.tabpage_2.dw_ant_titular.insertrow(0)

tab_1.tabpage_2.dw_ant_titular.getchild('parentesco_tercero',idw_detalle10)
idw_detalle10.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	idw_detalle10.retrieve(1)
elseif gs_conexion = "Parque La Foresta" then
	idw_detalle10.retrieve(11)
end if
tab_1.tabpage_2.dw_ant_titular.insertrow(0)

//--------------- fin juan
tab_1.tabpage_2.dw_ant_titular.enabled		= false
tab_1.tabpage_1.dw_ant_fall.enabled			= false
tab_1.tabpage_4.dw_aranceles.enabled		= false
tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
gs_ventana	= 'w_ingreso_ficha_sepultacion'
f_valida_objeto2()
tab_1.tabpage_3.dw_ficha_sepult.setfocus()
tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')


if isvalid(w_cuenta_corriente_oferta) or isvalid(w_cuenta_corriente_contrato_isa)  then
	gs_base 				= substr(1,1,Message.StringParm)
	gs_serie				= substr(1,2,Message.StringParm)
	gi_numero			= Double(substr(1,3,Message.StringParm))
	il_rut	 				= Double(substr(1,4,Message.StringParm))
	is_dv					= substr(1,5,Message.StringParm)
	ll_parque				= Double(substr(1,6,Message.StringParm))
	ls_area 				= substr(1,7,Message.StringParm)
	ls_sector				= substr(1,8,Message.StringParm)
	ls_sepultura			= substr(1,9,Message.StringParm)	
//	if gs_base='O' then
//		SELECT	"CADENA"."ESTADO", "CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA",	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."NRO_TECNICO",	"OFERTA_V"."TIPO_CONS"
//		INTO 		:ls_estado_ctto,		:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,					:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto,		:ll_capacidad_ctto,			:ls_nro_tec_ctto,					:ls_tipo_cons
//		FROM 		"CADENA",   "CADENA_MORA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
//		WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
//				 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
//				 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
//				 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
//				 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
//				 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
//				 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
//				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
//				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
//				 (("CADENA"."CODIGO" = 'O' ) AND  
//				 ( "CADENA"."SERIE" = :ls_serie ) AND  
//				 ( "CADENA"."NUMERO" = :ll_numero ) )   
//		USING		sqlca;
//		if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
//		if not isnull(ll_capacidad_ctto) and ll_capacidad_ctto>0 then il_capacidad = ll_capacidad_ctto
//		if not isnull(ls_nro_tec_ctto) and ls_nro_tec_ctto<>'' and ls_nro_tec_ctto<>'-' then is_nro_tecnico = ls_nro_tec_ctto
//	elseif ls_base='C' then
//		SELECT	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."FECHA",	"CONTRATO"."CAPACIDAD",	"CONTRATO"."NRO_TEC",	'T'  
//		INTO 		:ls_estado_ctto,		:ll_cod_parque,			:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part  ,		:ls_sector_sepult,	:ls_nro_sepultura,		:ldt_fecha_ctto,		:ll_capacidad_ctto,		:ll_nro_tec_ctto,			:ls_tipo_cons
//		FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
//		WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
//				 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
//				 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
//				 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
//				 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
//				 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
//				 (("CADENA"."CODIGO" = 'C' ) AND  
//				 ( "CADENA"."SERIE" = :ls_serie ) AND  
//				 ( "CADENA"."NUMERO" = :ll_numero ) )   
//		USING		sqlca;
//		if not isnull(ll_capacidad_ctto) and ll_capacidad_ctto>0 then il_capacidad = ll_capacidad_ctto
//		if not isnull(ll_nro_tec_ctto) and ll_nro_tec_ctto>0 then is_nro_tecnico = String(ll_nro_tec_ctto)
//	end if
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'cod_parque',ll_parque)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sector',ls_sector)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sepultura',ls_sepultura)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_protocolo_covid',1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_covid_19',1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_new,'sw_tipo_ficha',1)
	tab_1.tabpage_2.dw_ant_titular.setitem(1,'rut_titular',il_rut)
	tab_1.tabpage_2.dw_ant_titular.setitem(1,'dv_titular',is_dv)	
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
			( "FALLECIDOS"."N_SEP" = :ls_sepultura )
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
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'observacion_sepultura_completa',ls_string)
	tab_1.tabpage_3.dw_ficha_sepult.accepttext()
end if	

end event

event mousemove;tab_1.tabpage_3.st_help.visible	= false
end event

event close;Disconnect using Trans_1;
Disconnect using Trans_2;
end event

type dw_qr from datawindow within w_ingreso_ficha_sepultacion_bkp
integer x = 3991
integer y = 248
integer width = 910
integer height = 944
integer taborder = 30
string title = "none"
string dataobject = "dw_imprimir_qr_ficha_sepult"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_ingreso_ficha_sepultacion_bkp
integer x = 2181
integer y = 2512
integer width = 375
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ficha Marcado"
end type

event clicked;Long		ll_cod_parque,ll_count_reg
String	ls_sector,ls_sepultura
Datetime	ldt_fecha_sepult

tab_1.tabpage_3.dw_ficha_sepult.accepttext()
ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
SELECT	Count("FICHA_SEPULTACION"."FECHA_SEPULTACION")  
INTO 		:ll_count_reg  
FROM 		"FICHA_SEPULTACION"  
WHERE  ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
		 ( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
		 ( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
		 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )   
USINg		sqlca;
if ll_count_reg>0 then
	dw_resumen.reset()
	dw_resumen.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
	if dw_resumen.rowcount() > 0 then 
		f_Print( dw_resumen )
	end if
end if
end event

type dw_resumen from datawindow within w_ingreso_ficha_sepultacion_bkp
boolean visible = false
integer x = 1449
integer y = 2680
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_ingreso_ficha_print_resumen"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_ingreso_ficha_sepultacion_bkp
boolean visible = false
integer x = 73
integer y = 2792
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "E-Mail"
end type

event clicked;// (pSender    VARCHAR2,--Mail Origen
//pRecipient VARCHAR2,--Mail Destino
//pSubject   VARCHAR2,--Asunto
//pMessage   VARCHAR2)--Mensaje
//String	ls_email1,ls_email2,ls_asunto,ls_texto,ls_res
//ls_email1	= 'mirkom@elprado.cl'
//ls_email2	= 'sep_prado@elprado.cl'
//ls_asunto	= 'Ejemplo2'
//ls_texto		= 'prueba ejemplo2'
//
//select	EnviarMail(:ls_email1,:ls_email2,:ls_asunto,:ls_texto) 
//INTO 		:ls_res
//from 		DUAL;
//messagebox("",ls_res)
end event

type cb_tablas from commandbutton within w_ingreso_ficha_sepultacion_bkp
integer x = 2555
integer y = 2512
integer width = 201
integer height = 100
integer taborder = 100
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

type cb_volver from commandbutton within w_ingreso_ficha_sepultacion_bkp
boolean visible = false
integer x = 2432
integer y = 2712
integer width = 215
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Volver"
end type

event getfocus;tab_1.tabpage_2.dw_ant_titular.ScrollToRow(tab_1.tabpage_2.dw_ant_titular.rowcount())
tab_1.tabpage_2.dw_ant_titular.setfocus()

tab_1.tabpage_4.dw_aranceles.ScrollToRow(tab_1.tabpage_4.dw_aranceles.rowcount())
tab_1.tabpage_4.dw_aranceles.setfocus()

tab_1.tabpage_3.dw_ficha_sepult.ScrollToRow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

tab_1.SelectedTab	= 3
tab_1.tabpage_1.dw_ant_fall.ScrollToRow(tab_1.tabpage_1.dw_ant_fall.rowcount())
tab_1.tabpage_1.dw_ant_fall.setfocus()
tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
end event

type cb_print from commandbutton within w_ingreso_ficha_sepultacion_bkp
integer x = 677
integer y = 2516
integer width = 238
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Long		ll_cod_parque,ll_count_reg
String	ls_sector,ls_sepultura
Datetime	ldt_fecha_sepult

tab_1.tabpage_3.dw_ficha_sepult.accepttext()
ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
SELECT	Count("FICHA_SEPULTACION"."FECHA_SEPULTACION")  
INTO 		:ll_count_reg  
FROM 		"FICHA_SEPULTACION"  
WHERE  ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
		 ( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
		 ( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
		 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )   
USINg		sqlca;
if ll_count_reg>0 then
	dw_print.reset()
	dw_print.getchild('codigo_parentesco',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.retrieve(ll_cod_parque)
	
	dw_print.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
	if dw_print.rowcount() > 0 then 
		f_Print( dw_print )
		dw_print.print()
	end if
end if
end event

type cb_eliminar from commandbutton within w_ingreso_ficha_sepultacion_bkp
integer x = 914
integer y = 2516
integer width = 229
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_resp,ll_tot_reg,ll_cod_parque2,ll_count,ll_corr,ll_rut_diacono,ll_hora,ll_min,ll_cod_fune,ll_rut_fall,ll_cod_parque_desde,ll_cod_parque_hacia,ll_folio,ll_numero,ll_capacidad,ll_cod_parque,&
			ll_cantidad_sepult,ll_cap_libre_sepult,ll_hora_recep,ll_min_recep,ll_hora_llegada_efec,ll_min_llegada_efec,ll_rut_tit,ll_edad_fall,ll_corr_int,ll_corr_mensual,ll_corr_anual,ll_anno_pase,ll_hora_def,ll_min_def,&
			ll_sw_der_sep,ll_sw_mov_sercof,ll_sw_cambio_ubi,ll_sw_reduc,ll_sw_certif_def,ll_sw_pago_lib,ll_hora_util_cap,ll_min_util_cap,ll_sw_tit_fall,ll_sw_otros_pagos,ll_sw_pase_sepult,ll_sw_alto_impac,ll_sw_exhuma,ll_corr_ficha,&
			ll_elimina
String		ls_sector,ls_sepultura,ls_nom_fall,ls_ap_pat_fall,ls_nom_fall2,ls_ap_pat_fall2,ls_ap_mat_fall2,ls_dir_fall,ls_pob_fall,ls_sector_fall,ls_cod_comuna_fall,ls_cod_ciudad_fall,ls_cod_ejec,ls_est_responso,ls_dv_diacono,&
			ls_dv_fall,ls_cod_estado_fall,ls_pase_sepult,ls_causa_fall,ls_capilla_vela,ls_dire_capilla,ls_cod_parentesco,ls_obs,ls_base,ls_serie,ls_sector2,ls_sepultura2,ls_num_tec,ls_nivel,ls_nom_tit,ls_ap_pat_tit,ls_ap_mat_tit,&
			ls_direc_tit,ls_num_dir_tit,ls_depto_tit,ls_block_tit,ls_pob_villa_tit,ls_sector_tit,ls_cod_comuna_tit,ls_cod_ciudad_tit,ls_fono_tit,ls_estado_sepult_comp,ls_obs_sepult_comp,ls_estado_cred,ls_obs_cred,ls_estado_mant,&
			ls_obs_mant,ls_vb_estadistico,ls_fono_fune,ls_cod_est_ctto,ls_dv_tit,ls_sexo_fall,ls_tipo_via_fall,ls_tipo_via_tit,ls_estado_reg,ls_cod_reg_pase,ls_inscrip_pase,ls_registro_pase,ls_modif_adm,ls_periodo_nac,ls_cod_tamano_cuerpo,&
			ls_obs_fall,ls_usar_capilla,ls_ip,ls_obs_alto_imp,ls_cod_obs_cuerpo,ls_nro_dire_fall,ls_depto_fall,ls_block_fall,ls_ap_mat_fall,ls_ok
Datetime	ldt_fecha_sepult,ldt_fec_defuncion,ldt_fec_sep,ldt_fec_nac_fall,ldt_fec_ctto,ldt_fec_recep,ldt_fec_pase,ldt_fec_sistema
Double	ldb_val_der_esp,ldb_monto_cancelar,ldb_val_mov_sarcof,ldb_val_cambio_ubi,ldb_val_reduc,ldb_val_certif_def,ldb_uf_dia,ldb_val_otros_pag,ldb_val_axhuma

ll_elimina					= 0
ll_tot_reg					= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
ll_cod_parque				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_tot_reg,'cod_parque')
ls_sector						= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_tot_reg,'sector')
ls_sepultura					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_tot_reg,'sepultura')
ldt_fecha_sepult			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(ll_tot_reg,'fecha_sepultacion')
if ll_tot_reg > 0 and not isnull(ldt_fecha_sepult) and not isnull(ls_sector) and not isnull(ls_sepultura) and ll_cod_parque > 0 then
	ll_resp					= messagebox("Advertencia","Recuerde se Eliminará Siempre La Ultima Ficha, Está seguro de Eliminar",Exclamation!,YesNo!,2)
	if ll_resp=1 then
		ls_nom_fall			= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_tot_reg,'nombre_fallecido')
		ls_ap_pat_fall		= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_tot_reg,'ap_paterno_fall')
		ls_ap_mat_fall		= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_tot_reg,'ap_materno_fall')
		ll_corr				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_tot_reg,'correlativo_interno')
		if not isnull(ldt_fecha_sepult) and ll_cod_parque>0 and not isnull(ls_sector) and not isnull(ls_sepultura) then
			SELECT	Count("FICHA_SEPULTACION"."COD_PARQUE")  
			INTO 		:ll_count  
			FROM 	"FICHA_SEPULTACION"  
			WHERE  ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND  
					 ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
					 ( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
					 ( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura )  AND
					 ( "FICHA_SEPULTACION"."NOMBRE_FALLECIDO" = :ls_nom_fall )  AND
					 ( "FICHA_SEPULTACION"."AP_PATERNO_FALL" = :ls_ap_pat_fall ) AND
					 ( "FICHA_SEPULTACION"."AP_MATERNO_FALL" = :ls_ap_mat_fall )
			USING		sqlca;
			if ll_count>0 then
				SELECT 	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CODIGO_FUNERARIA",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."DIRECCION_FALL",	"FICHA_SEPULTACION"."NUMERO_DIRECCION_FALL",	"FICHA_SEPULTACION"."DEPTO_DIRECCION_FALL",	"FICHA_SEPULTACION"."BLOCK_DIRECCION_FALL",	"FICHA_SEPULTACION"."POBLACION_VILLA_FALL",	"FICHA_SEPULTACION"."SECTOR_FALL",	"FICHA_SEPULTACION"."CODIGO_COMUNA_FALL",	"FICHA_SEPULTACION"."CODIGO_CIUDAD_FALL",	"FICHA_SEPULTACION"."FECHA_DEFUNCION",	"FICHA_SEPULTACION"."ESTADO_RESPONSO",	"FICHA_SEPULTACION"."RUT_DIACONO",	"FICHA_SEPULTACION"."DV_DIACONO",	"FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",	"FICHA_SEPULTACION"."RUT_FALLECIDO",	"FICHA_SEPULTACION"."DV_FALLECIDO",	"FICHA_SEPULTACION"."COD_ESTADO_FALL",	"FICHA_SEPULTACION"."COD_PARQUE_DESDE",	"FICHA_SEPULTACION"."COD_PARQUE_HACIA",	"FICHA_SEPULTACION"."PASE_SEPULTACION",	"FICHA_SEPULTACION"."CAUSA_FALLECIMIENTO",	"FICHA_SEPULTACION"."CAPILLA_VELATORIA",	"FICHA_SEPULTACION"."DIRECCION_CAPILLA",	"FICHA_SEPULTACION"."VALOR_DERECHO_SEPULTACION_UF",	"FICHA_SEPULTACION"."CODIGO_PARENTESCO",	"FICHA_SEPULTACION"."MONTO_CANCELAR",	"FICHA_SEPULTACION"."FOLIO_COMPROBANTE",	"FICHA_SEPULTACION"."OBSERVACION",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."FECHA_CONTRATO",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."NUMERO_TECNICO",	"FICHA_SEPULTACION"."CAPACIDAD",	"FICHA_SEPULTACION"."NIVEL",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."NOMBRE_TITULAR",	"FICHA_SEPULTACION"."AP_PATERNO_TITULAR",	"FICHA_SEPULTACION"."AP_MATERNO_TITULAR",	"FICHA_SEPULTACION"."DIRECCION_TITULAR",	"FICHA_SEPULTACION"."NUM_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."DEPTO_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."BLOCK_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."POBLACION_VILLA_TITULAR",	"FICHA_SEPULTACION"."SECTOR_TITULAR",	"FICHA_SEPULTACION"."CODIGO_COMUNA_TITULAR",	"FICHA_SEPULTACION"."CODIGO_CIUDAD_TITULAR",	"FICHA_SEPULTACION"."FONO_TITULAR",	"FICHA_SEPULTACION"."CANTIDAD_SEPULTADOS",	"FICHA_SEPULTACION"."ESTADO_SEPULTURA_COMPLETA",	"FICHA_SEPULTACION"."CAPACIDAD_LIBRE_SEPULTURA",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA",	"FICHA_SEPULTACION"."ESTADO_CREDITO",	"FICHA_SEPULTACION"."OBSERVACION_CREDITO",	"FICHA_SEPULTACION"."ESTADO_MANTENCION",	"FICHA_SEPULTACION"."OBSERVACION_MANTENCION",	"FICHA_SEPULTACION"."FECHA_RECEPCION",	"FICHA_SEPULTACION"."HORA_RECEPCION",	"FICHA_SEPULTACION"."MINUTO_RECEPCION",	"FICHA_SEPULTACION"."HORA_LLEGADA_EFECTIVA",	"FICHA_SEPULTACION"."MINUTO_LLEGADA_EFECTIVA",	"FICHA_SEPULTACION"."VB_ESTADISTICO",	"FICHA_SEPULTACION"."FONO_FUNERARIA",	"FICHA_SEPULTACION"."COD_ESTADO_CONTRATO",	"FICHA_SEPULTACION"."RUT_TITULAR",	"FICHA_SEPULTACION"."DV_TITULAR",	"FICHA_SEPULTACION"."VALOR_MOV_SARCOFAGO",	"FICHA_SEPULTACION"."VALOR_CAMBIO_DE_UBICACION",	"FICHA_SEPULTACION"."VALOR_REDUCCION",	"FICHA_SEPULTACION"."VALOR_CERTIFICADO_DEFUNCION",	"FICHA_SEPULTACION"."UF_DIA",	"FICHA_SEPULTACION"."EDAD_FALLECIDO",	"FICHA_SEPULTACION"."SEXO_FALLECIDO",	"FICHA_SEPULTACION"."TIPO_VIA_FALLECIDO",	"FICHA_SEPULTACION"."TIPO_VIA_TITULAR",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."CORRELATIVO_MENSUAL",	"FICHA_SEPULTACION"."CORRELATIVO_ANUAL",	"FICHA_SEPULTACION"."ESTADO_REG",	"FICHA_SEPULTACION"."COD_REGISTRO_PASE",	"FICHA_SEPULTACION"."INSCRIPCION_PASE",	"FICHA_SEPULTACION"."REGISTRO_PASE",	"FICHA_SEPULTACION"."ANNO_PASE",	"FICHA_SEPULTACION"."FECHA_PASE",	"FICHA_SEPULTACION"."FECHA_SISTEMA",	"FICHA_SEPULTACION"."HORA_DEF",	"FICHA_SEPULTACION"."MINUTO_DEF",	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."SW_DERECHO_SEPULT",	"FICHA_SEPULTACION"."SW_MOV_SARCOFAGO",	"FICHA_SEPULTACION"."SW_CAMBIO_UBICACION",	"FICHA_SEPULTACION"."SW_REDUCCION",	"FICHA_SEPULTACION"."SW_CERTIFICADO_DEFUN",	"FICHA_SEPULTACION"."SW_PAGO_LIBERADO",	"FICHA_SEPULTACION"."PERIODO_NACIMIENTO",	"FICHA_SEPULTACION"."COD_TAMANO_CUERPO",	"FICHA_SEPULTACION"."OBSERVACION_FALLECIDO",	"FICHA_SEPULTACION"."USAR_CAPILLA",	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"FICHA_SEPULTACION"."IP",	"FICHA_SEPULTACION"."SW_TITULAR_FALL",	"FICHA_SEPULTACION"."SW_OTROS_PAGOS",	"FICHA_SEPULTACION"."VALOR_OTROS_PAGOS",	"FICHA_SEPULTACION"."SW_PASE_SEPULTACION",	"FICHA_SEPULTACION"."SW_ALTO_IMPACTO",	"FICHA_SEPULTACION"."OBS_ALTO_IMPACTO",	"FICHA_SEPULTACION"."COD_OBS_CUERPO",	"FICHA_SEPULTACION"."VALOR_EXHUMACION",	"FICHA_SEPULTACION"."SW_EXHUMACION",	"FICHA_SEPULTACION"."CORRELATIVO_FICHA"
				INTO 		:ls_cod_ejec,											:ldt_fec_sep,												:ll_hora,									:ll_min,										:ll_cod_fune,												:ls_nom_fall2,												:ls_ap_pat_fall2,										:ls_ap_mat_fall2,										:ls_dir_fall,											:ls_nro_dire_fall,													:ls_depto_fall,													:ls_block_fall,													:ls_pob_fall,														:ls_sector_fall,									:ls_cod_comuna_fall,											:ls_cod_ciudad_fall,										:ldt_fec_defuncion,									:ls_est_responso,											:ll_rut_diacono,										:ls_dv_diacono,									:ldt_fec_nac_fall,												:ll_rut_fall,											:ls_dv_fall,											:ls_cod_estado_fall,									:ll_cod_parque_desde,									:ll_cod_parque_hacia,									:ls_pase_sepult,										:ls_causa_fall,													:ls_capilla_vela,											:ls_dire_capilla,										:ldb_val_der_esp,																:ls_cod_parentesco,										:ldb_monto_cancelar,									:ll_folio,														:ls_obs,												:ls_base,									:ls_serie,									:ll_numero,									:ldt_fec_ctto,											:ls_sector2,									:ls_sepultura2,									:ls_num_tec,											:ll_capacidad,							:ls_nivel,							:ll_cod_parque2,							:ls_nom_tit,									:ls_ap_pat_tit,									:ls_ap_mat_tit,									:ls_direc_tit,										:ls_num_dir_tit,										:ls_depto_tit,												:ls_block_tit,												:ls_pob_villa_tit,										:ls_sector_tit,								:ls_cod_comuna_tit,									:ls_cod_ciudad_tit,									:ls_fono_tit,								:ll_cantidad_sepult,									:ls_estado_sepult_comp,										:ll_cap_libre_sepult,										:ls_obs_sepult_comp,												:ls_estado_cred,								:ls_obs_cred,   										:ls_estado_mant,									:ls_obs_mant,												:ldt_fec_recep,								:ll_hora_recep, 								:ll_min_recep,										:ll_hora_llegada_efec,								:ll_min_llegada_efec,									:ls_vb_estadistico,							:ls_fono_fune,									:ls_cod_est_ctto,										:ll_rut_tit,								:ls_dv_tit,									:ldb_val_mov_sarcof,									:ldb_val_cambio_ubi,											:ldb_val_reduc,								:ldb_val_certif_def,											:ldb_uf_dia,						:ll_edad_fall,									:ls_sexo_fall,									:ls_tipo_via_fall,								:ls_tipo_via_tit,									:ll_corr_int,											:ll_corr_mensual,										:ll_corr_anual,									:ls_estado_reg, 							:ls_cod_reg_pase, 								:ls_inscrip_pase,									:ls_registro_pase,							:ll_anno_pase,							:ldt_fec_pase,								:ldt_fec_sistema,								:ll_hora_def,							:ll_min_def, 								:ls_modif_adm,							:ll_sw_der_sep,									:ll_sw_mov_sercof,								:ll_sw_cambio_ubi,									:ll_sw_reduc,								:ll_sw_certif_def,									:ll_sw_pago_lib,									:ls_periodo_nac,									:ls_cod_tamano_cuerpo,							:ls_obs_fall,											:ls_usar_capilla, 						:ll_hora_util_cap, 								:ll_min_util_cap,										:ls_ip,							:ll_sw_tit_fall, 								:ll_sw_otros_pagos,							:ldb_val_otros_pag,								:ll_sw_pase_sepult,									:ll_sw_alto_impac,							:ls_obs_alto_imp,									:ls_cod_obs_cuerpo,							:ldb_val_axhuma,									:ll_sw_exhuma,									:ll_corr_ficha
				FROM 		"FICHA_SEPULTACION"  
				WHERE  ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND  
						 ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
						 ( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
						 ( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
						 ( "FICHA_SEPULTACION"."NOMBRE_FALLECIDO" = :ls_nom_fall ) AND  
						 ( "FICHA_SEPULTACION"."AP_PATERNO_FALL" = :ls_ap_pat_fall )  AND
						 ( "FICHA_SEPULTACION"."AP_MATERNO_FALL" = :ls_ap_mat_fall )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					INSERT INTO "LOG_FICHA_SEPULTACION"  
							 ( "LOG_FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"LOG_FICHA_SEPULTACION"."FECHA_SEPULTACION",	"LOG_FICHA_SEPULTACION"."HORA",	"LOG_FICHA_SEPULTACION"."MINUTOS",	"LOG_FICHA_SEPULTACION"."CODIGO_FUNERARIA",	"LOG_FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"LOG_FICHA_SEPULTACION"."AP_PATERNO_FALL",	"LOG_FICHA_SEPULTACION"."AP_MATERNO_FALL",	"LOG_FICHA_SEPULTACION"."DIRECCION_FALL",	"LOG_FICHA_SEPULTACION"."NUMERO_DIRECCION_FALL",	"LOG_FICHA_SEPULTACION"."DEPTO_DIRECCION_FALL",	"LOG_FICHA_SEPULTACION"."BLOCK_DIRECCION_FALL",	"LOG_FICHA_SEPULTACION"."POBLACION_VILLA_FALL",	"LOG_FICHA_SEPULTACION"."SECTOR_FALL",	"LOG_FICHA_SEPULTACION"."CODIGO_COMUNA_FALL",	"LOG_FICHA_SEPULTACION"."CODIGO_CIUDAD_FALL",	"LOG_FICHA_SEPULTACION"."FECHA_DEFUNCION",	"LOG_FICHA_SEPULTACION"."ESTADO_RESPONSO",	"LOG_FICHA_SEPULTACION"."RUT_DIACONO",	"LOG_FICHA_SEPULTACION"."DV_DIACONO",	"LOG_FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",	"LOG_FICHA_SEPULTACION"."RUT_FALLECIDO",	"LOG_FICHA_SEPULTACION"."DV_FALLECIDO",	"LOG_FICHA_SEPULTACION"."COD_ESTADO_FALL",	"LOG_FICHA_SEPULTACION"."COD_PARQUE_DESDE",	"LOG_FICHA_SEPULTACION"."COD_PARQUE_HACIA",	"LOG_FICHA_SEPULTACION"."PASE_SEPULTACION",	"LOG_FICHA_SEPULTACION"."CAUSA_FALLECIMIENTO",	"LOG_FICHA_SEPULTACION"."CAPILLA_VELATORIA",	"LOG_FICHA_SEPULTACION"."DIRECCION_CAPILLA",	"LOG_FICHA_SEPULTACION"."VALOR_DERECHO_SEPULTACION_UF",	"LOG_FICHA_SEPULTACION"."CODIGO_PARENTESCO",	"LOG_FICHA_SEPULTACION"."MONTO_CANCELAR",	"LOG_FICHA_SEPULTACION"."FOLIO_COMPROBANTE",	"LOG_FICHA_SEPULTACION"."OBSERVACION",	"LOG_FICHA_SEPULTACION"."BASE",	"LOG_FICHA_SEPULTACION"."SERIE",	"LOG_FICHA_SEPULTACION"."NUMERO",	"LOG_FICHA_SEPULTACION"."FECHA_CONTRATO",	"LOG_FICHA_SEPULTACION"."SECTOR",	"LOG_FICHA_SEPULTACION"."SEPULTURA",	"LOG_FICHA_SEPULTACION"."NUMERO_TECNICO",	"LOG_FICHA_SEPULTACION"."CAPACIDAD",	"LOG_FICHA_SEPULTACION"."NIVEL",	"LOG_FICHA_SEPULTACION"."COD_PARQUE",	"LOG_FICHA_SEPULTACION"."NOMBRE_TITULAR",	"LOG_FICHA_SEPULTACION"."AP_PATERNO_TITULAR",	"LOG_FICHA_SEPULTACION"."AP_MATERNO_TITULAR",	"LOG_FICHA_SEPULTACION"."DIRECCION_TITULAR",	"LOG_FICHA_SEPULTACION"."NUM_DIRECCION_TITULAR",	"LOG_FICHA_SEPULTACION"."DEPTO_DIRECCION_TITULAR",	"LOG_FICHA_SEPULTACION"."BLOCK_DIRECCION_TITULAR",	"LOG_FICHA_SEPULTACION"."POBLACION_VILLA_TITULAR",	"LOG_FICHA_SEPULTACION"."SECTOR_TITULAR",	"LOG_FICHA_SEPULTACION"."CODIGO_COMUNA_TITULAR",	"LOG_FICHA_SEPULTACION"."CODIGO_CIUDAD_TITULAR",	"LOG_FICHA_SEPULTACION"."FONO_TITULAR",	"LOG_FICHA_SEPULTACION"."CANTIDAD_SEPULTADOS",	"LOG_FICHA_SEPULTACION"."ESTADO_SEPULTURA_COMPLETA",	"LOG_FICHA_SEPULTACION"."CAPACIDAD_LIBRE_SEPULTURA",	"LOG_FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA",	"LOG_FICHA_SEPULTACION"."ESTADO_CREDITO",	"LOG_FICHA_SEPULTACION"."OBSERVACION_CREDITO",	"LOG_FICHA_SEPULTACION"."ESTADO_MANTENCION",	"LOG_FICHA_SEPULTACION"."OBSERVACION_MANTENCION",	"LOG_FICHA_SEPULTACION"."FECHA_RECEPCION",	"LOG_FICHA_SEPULTACION"."HORA_RECEPCION",	"LOG_FICHA_SEPULTACION"."MINUTO_RECEPCION",	"LOG_FICHA_SEPULTACION"."HORA_LLEGADA_EFECTIVA",	"LOG_FICHA_SEPULTACION"."MINUTO_LLEGADA_EFECTIVA",	"LOG_FICHA_SEPULTACION"."VB_ESTADISTICO",	"LOG_FICHA_SEPULTACION"."FONO_FUNERARIA",	"LOG_FICHA_SEPULTACION"."COD_ESTADO_CONTRATO",	"LOG_FICHA_SEPULTACION"."RUT_TITULAR",	"LOG_FICHA_SEPULTACION"."DV_TITULAR",	"LOG_FICHA_SEPULTACION"."VALOR_MOV_SARCOFAGO",	"LOG_FICHA_SEPULTACION"."VALOR_CAMBIO_DE_UBICACION",	"LOG_FICHA_SEPULTACION"."VALOR_REDUCCION",	"LOG_FICHA_SEPULTACION"."VALOR_CERTIFICADO_DEFUNCION",	"LOG_FICHA_SEPULTACION"."UF_DIA",	"LOG_FICHA_SEPULTACION"."EDAD_FALLECIDO",	"LOG_FICHA_SEPULTACION"."SEXO_FALLECIDO",	"LOG_FICHA_SEPULTACION"."TIPO_VIA_FALLECIDO",	"LOG_FICHA_SEPULTACION"."TIPO_VIA_TITULAR",	"LOG_FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"LOG_FICHA_SEPULTACION"."CORRELATIVO_MENSUAL",	"LOG_FICHA_SEPULTACION"."CORRELATIVO_ANUAL",	"LOG_FICHA_SEPULTACION"."ESTADO_REG",	"LOG_FICHA_SEPULTACION"."COD_REGISTRO_PASE",	"LOG_FICHA_SEPULTACION"."INSCRIPCION_PASE",	"LOG_FICHA_SEPULTACION"."REGISTRO_PASE",	"LOG_FICHA_SEPULTACION"."ANNO_PASE",	"LOG_FICHA_SEPULTACION"."FECHA_PASE",	"LOG_FICHA_SEPULTACION"."FECHA_SISTEMA",	"LOG_FICHA_SEPULTACION"."HORA_DEF",	"LOG_FICHA_SEPULTACION"."MINUTO_DEF",	"LOG_FICHA_SEPULTACION"."MODIF_ADM",	"LOG_FICHA_SEPULTACION"."SW_DERECHO_SEPULT",	"LOG_FICHA_SEPULTACION"."SW_MOV_SARCOFAGO",	"LOG_FICHA_SEPULTACION"."SW_CAMBIO_UBICACION",	"LOG_FICHA_SEPULTACION"."SW_REDUCCION",	"LOG_FICHA_SEPULTACION"."SW_CERTIFICADO_DEFUN",	"LOG_FICHA_SEPULTACION"."SW_PAGO_LIBERADO",	"LOG_FICHA_SEPULTACION"."PERIODO_NACIMIENTO",	"LOG_FICHA_SEPULTACION"."COD_TAMANO_CUERPO",	"LOG_FICHA_SEPULTACION"."OBSERVACION_FALLECIDO",	"LOG_FICHA_SEPULTACION"."USAR_CAPILLA",	"LOG_FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"LOG_FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"LOG_FICHA_SEPULTACION"."IP",	"LOG_FICHA_SEPULTACION"."SW_TITULAR_FALL",	"LOG_FICHA_SEPULTACION"."SW_OTROS_PAGOS",	"LOG_FICHA_SEPULTACION"."VALOR_OTROS_PAGOS",	"LOG_FICHA_SEPULTACION"."SW_PASE_SEPULTACION",	"LOG_FICHA_SEPULTACION"."SW_ALTO_IMPACTO",	"LOG_FICHA_SEPULTACION"."OBS_ALTO_IMPACTO",	"LOG_FICHA_SEPULTACION"."COD_OBS_CUERPO",	"LOG_FICHA_SEPULTACION"."VALOR_EXHUMACION",	"LOG_FICHA_SEPULTACION"."SW_EXHUMACION",	"CORRELATIVO_FICHA",	"USUARIO_ELIMINA" )
					VALUES ( :ls_cod_ejec,											:ldt_fec_sep,											:ll_hora,								:ll_min,										:ll_cod_fune,											:ls_nom_fall2,											:ls_ap_pat_fall2,										:ls_ap_mat_fall2,										:ls_dir_fall,										:ls_nro_dire_fall,											:ls_depto_fall,											:ls_block_fall,											:ls_pob_fall,												:ls_sector_fall,								:ls_cod_comuna_fall,										:ls_cod_ciudad_fall,										:ldt_fec_defuncion,									:ls_est_responso,										:ll_rut_diacono,								:ls_dv_diacono,								:ldt_fec_nac_fall,											:ll_rut_fall,										:ls_dv_fall,										:ls_cod_estado_fall,									:ll_cod_parque_desde,								:ll_cod_parque_hacia,								:ls_pase_sepult,										:ls_causa_fall,											:ls_capilla_vela,										:ls_dire_capilla,										:ldb_val_der_esp,														:ls_cod_parentesco,									:ldb_monto_cancelar,								:ll_folio,												:ls_obs,											:ls_base,								:ls_serie,								:ll_numero,									:ldt_fec_ctto,										:ls_sector2,								:ls_sepultura2,								:ls_num_tec,										:ll_capacidad,									:ls_nivel,								:ll_cod_parque2,								:ls_nom_tit,										:ls_ap_pat_tit,											:ls_ap_mat_tit,											:ls_direc_tit,											:ls_num_dir_tit,												:ls_depto_tit,													:ls_block_tit,													:ls_pob_villa_tit,											:ls_sector_tit,									:ls_cod_comuna_tit,											:ls_cod_ciudad_tit,											:ls_fono_tit,										:ll_cantidad_sepult,										:ls_estado_sepult_comp,											:ll_cap_libre_sepult,											:ls_obs_sepult_comp,														:ls_estado_cred,									:ls_obs_cred,   											:ls_estado_mant,										:ls_obs_mant,													:ldt_fec_recep,										:ll_hora_recep, 									:ll_min_recep,											:ll_hora_llegada_efec,										:ll_min_llegada_efec,										:ls_vb_estadistico,								:ls_fono_fune,										:ls_cod_est_ctto,											:ll_rut_tit,									:ls_dv_tit,										:ldb_val_mov_sarcof,										:ldb_val_cambio_ubi,												:ldb_val_reduc,										:ldb_val_certif_def,													:ldb_uf_dia,								:ll_edad_fall,										:ls_sexo_fall,										:ls_tipo_via_fall,										:ls_tipo_via_tit,										:ll_corr_int,												:ll_corr_mensual,											:ll_corr_anual,										:ls_estado_reg, 								:ls_cod_reg_pase, 									:ls_inscrip_pase,										:ls_registro_pase,								:ll_anno_pase,									:ldt_fec_pase,									:ldt_fec_sistema,									:ll_hora_def,								:ll_min_def, 									:ls_modif_adm,									:ll_sw_der_sep,										:ll_sw_mov_sercof,									:ll_sw_cambio_ubi,										:ll_sw_reduc,										:ll_sw_certif_def,										:ll_sw_pago_lib,										:ls_periodo_nac,											:ls_cod_tamano_cuerpo,								:ls_obs_fall,													:ls_usar_capilla, 								:ll_hora_util_cap, 									:ll_min_util_cap,											:ls_ip,								:ll_sw_tit_fall, 										:ll_sw_otros_pagos,								:ldb_val_otros_pag,									:ll_sw_pase_sepult,										:ll_sw_alto_impac,									:ls_obs_alto_imp,										:ls_cod_obs_cuerpo,								:ldb_val_axhuma,										:ll_sw_exhuma,										:ll_corr_ficha,		:gs_user )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
				tab_1.tabpage_3.dw_ficha_sepult.deleterow(ll_tot_reg)
				if tab_1.tabpage_3.dw_ficha_sepult.update()=1 then
					commit;
					DELETE FROM "FICHA_CARTA_SEPULTACION"  
					WHERE 	( "FICHA_CARTA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
								( "FICHA_CARTA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
								( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
								( "FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
								( "FICHA_CARTA_SEPULTACION"."NOMBRE_FALLECIDO" = :ls_nom_fall ) AND
								( "FICHA_CARTA_SEPULTACION"."APELLIDO_PATERNO_FALL" = :ls_ap_pat_fall ) AND
								( "FICHA_CARTA_SEPULTACION"."APELLIDO_MATERNO_FALL" = :ls_ap_mat_fall )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						ll_elimina ++
						messagebox("Error Eliminar","No se Eliminó CARTA SEPULTACION SQL: "+sqlca.sqlerrtext)
					end if
					DELETE FROM "FICHA_GRABACION_LAPIDA"  
					WHERE 	( "FICHA_GRABACION_LAPIDA"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
								( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
								( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
								( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "FICHA_GRABACION_LAPIDA"."NOMBRE_FALLECIDO" = :ls_nom_fall ) AND
								( "FICHA_GRABACION_LAPIDA"."APELLIDO_PATERNO_FALL" = :ls_ap_pat_fall ) AND
								( "FICHA_GRABACION_LAPIDA"."APELLIDO_MATERNO_FALL" = :ls_ap_mat_fall )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						ll_elimina ++
						messagebox("Error Eliminar","No se Eliminó GRABACION DE LAPIDA SQL: "+sqlca.sqlerrtext)
					end if
					ll_tot_reg	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					if ll_tot_reg = 0 then
						tab_1.tabpage_1.dw_ant_fall.reset()
						tab_1.tabpage_2.dw_ant_titular.reset()
						tab_1.tabpage_3.dw_ficha_sepult.reset()
						tab_1.tabpage_4.dw_aranceles.reset()
						idw_detalle.reset()
						idw_detalle.insertrow(0)
						idw_detalle2.reset()
						idw_detalle2.insertrow(0)
						idw_detalle3.reset()
						idw_detalle3.insertrow(0)
						idw_detalle5.reset()
						idw_detalle5.insertrow(0)
						idw_detalle6.reset()
						idw_detalle6.insertrow(0)
						idw_detalle8.reset()
						idw_detalle8.insertrow(0)
						idw_detalle4.reset()
						idw_detalle4.insertrow(0)
						tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
						tab_1.tabpage_1.dw_ant_fall.setitem(1,'sw_titular_fall',1)
						tab_1.tabpage_1.dw_ant_fall.setitem(1,'usar_capilla','N')
						tab_1.tabpage_1.dw_ant_fall.setitem(1,'usar_templo','N')
						tab_1.tabpage_1.dw_ant_fall.setitem(1,'sw_alto_impacto',1)
						tab_1.tabpage_1.dw_ant_fall.setitem(1,'sw_protocolo_covid',1)
						tab_1.tabpage_1.dw_ant_fall.setitem(1,'sw_covid_19',1)
						tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
						tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
						tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sw_pase_sepultacion',1)
						if gs_depto='R' or gs_depto='M' then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'codigo_ejecutivo',gs_user)
						end if
						tab_1.tabpage_4.dw_aranceles.InsertRow(0)
						tab_1.tabpage_1.dw_ant_fall.enabled	      = false
						tab_1.tabpage_2.dw_ant_titular.enabled		= false
						tab_1.tabpage_4.dw_aranceles.enabled		= false
						tab_1.tabpage_1.dw_ant_fall.accepttext()
						tab_1.tabpage_3.dw_ficha_sepult.accepttext()
						tab_1.tabpage_3.dw_ficha_sepult.enabled	= true   
						tab_1.SelectTab(1)
						tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
						tab_1.tabpage_3.dw_ficha_sepult.setfocus()
					end if
					ls_ok				= f_actualiza_beneficio_det(ls_base,ls_serie,ll_numero,'FS',ll_corr,'E')
					if ll_elimina=0 then
						messagebox("Eliminar","Eliminación Exitosa")
					elseif ll_elimina>0 then
						messagebox("Eliminar","Eliminación Exitosa de Ficha, pero NO la Carta de Autorización o Solicitud de Grabación de Lápida")
					end if
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
					tab_1.tabpage_3.dw_ficha_sepult.setfocus()
				else
					rollback;
				end if
			end if
		end if
		cb_grabar.setfocus()
	end if
end if
end event

type cb_buscar from commandbutton within w_ingreso_ficha_sepultacion_bkp
integer x = 302
integer y = 2512
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Ficha"
end type

event clicked;if isvalid(w_buscar_ficha) then close(w_buscar_ficha)
Long		ll_resp
string	ls_tabpage

tab_1.tabpage_1.dw_ant_fall.reset()
tab_1.tabpage_2.dw_ant_titular.reset()
tab_1.tabpage_3.dw_ficha_sepult.reset()
tab_1.tabpage_4.dw_aranceles.reset()
tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
if gs_depto='R' or gs_depto='M' then
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'codigo_ejecutivo',gs_user)
end if
tab_1.tabpage_4.dw_aranceles.InsertRow(0)
tab_1.tabpage_1.dw_ant_fall.enabled	      	= false
tab_1.tabpage_2.dw_ant_titular.enabled		= false
tab_1.tabpage_4.dw_aranceles.enabled		= false
tab_1.tabpage_3.dw_ficha_sepult.enabled	= true   
tab_1.SelectTab(1)
tab_1.tabpage_1.dw_ant_fall.setfocus()
tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
OpenWithParm(w_buscar_ficha, "FS")
end event

type pb_primer from picturebutton within w_ingreso_ficha_sepultacion_bkp
integer x = 2903
integer y = 2516
integer width = 114
integer height = 88
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_ant_fall.ScrollToRow(1)
tab_1.tabpage_1.dw_ant_fall.setfocus()

tab_1.tabpage_2.dw_ant_titular.ScrollToRow(1)
tab_1.tabpage_2.dw_ant_titular.setfocus()

tab_1.tabpage_3.dw_ficha_sepult.ScrollToRow(1)
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

tab_1.tabpage_4.dw_aranceles.ScrollToRow(1)
tab_1.tabpage_4.dw_aranceles.setfocus()

end event

type pb_sigue from picturebutton within w_ingreso_ficha_sepultacion_bkp
integer x = 3017
integer y = 2516
integer width = 114
integer height = 88
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_ant_fall.ScrollPriorPage( )
tab_1.tabpage_1.dw_ant_fall.setfocus()

tab_1.tabpage_2.dw_ant_titular.ScrollPriorPage( )
tab_1.tabpage_2.dw_ant_titular.setfocus()

tab_1.tabpage_3.dw_ficha_sepult.ScrollPriorPage( )
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

tab_1.tabpage_4.dw_aranceles.ScrollPriorPage( )
tab_1.tabpage_4.dw_aranceles.setfocus()

end event

type pb_antes from picturebutton within w_ingreso_ficha_sepultacion_bkp
integer x = 3131
integer y = 2516
integer width = 114
integer height = 88
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_ant_fall.ScrollNextPage( )
tab_1.tabpage_1.dw_ant_fall.setfocus()

tab_1.tabpage_2.dw_ant_titular.ScrollNextPage( )
tab_1.tabpage_2.dw_ant_titular.setfocus()

tab_1.tabpage_3.dw_ficha_sepult.ScrollNextPage( )
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

tab_1.tabpage_4.dw_aranceles.ScrollNextPage( )
tab_1.tabpage_4.dw_aranceles.setfocus()
end event

type pb_fin from picturebutton within w_ingreso_ficha_sepultacion_bkp
integer x = 3246
integer y = 2516
integer width = 114
integer height = 88
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_1.dw_ant_fall.ScrollToRow(tab_1.tabpage_1.dw_ant_fall.rowcount())
tab_1.tabpage_1.dw_ant_fall.setfocus()

tab_1.tabpage_2.dw_ant_titular.ScrollToRow(tab_1.tabpage_2.dw_ant_titular.rowcount())
tab_1.tabpage_2.dw_ant_titular.setfocus()

tab_1.tabpage_3.dw_ficha_sepult.ScrollToRow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

tab_1.tabpage_4.dw_aranceles.ScrollToRow(tab_1.tabpage_4.dw_aranceles.rowcount())
tab_1.tabpage_4.dw_aranceles.setfocus()
end event

type cb_grabar from commandbutton within w_ingreso_ficha_sepultacion_bkp
integer x = 50
integer y = 2512
integer width = 251
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string   	ls_pasa_dscto='N',ls_sw='S',ls_dv_fall,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_direc_fall,ls_dpto_dir_fall,ls_block_dir_fall,ls_sector_fall,ls_villa_fall,ls_ciud_fall,ls_comu_fall,ls_cod_est_fall,ls_causa_fall,&
			ls_num_dir_fall,ls_dv_tit,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,ls_sector_tit,ls_villa_tit,ls_ciud_tit,ls_comu_tit,ls_base,&
			ls_serie,ls_estad_contrato,ls_sector,ls_sepultura,ls_numero_tecni,ls_nivel,ls_est_sep_compl,ls_obs_sep_comp,ls_obs_credito,ls_obs_manten,ls_fono_titular,ls_ejecutivo,ls_fono_funera,ls_pase_sepult,&
			ls_sexo_fall,ls_tipo_via_fall,ls_tipo_via_tit,ls_parentesco,ls_sector1,ls_sepultura1,ls_obs,ls_estado_reg,ls_estado_ctto,ls_cod_age_aux,ls_estado_doc1,ls_estado_doc2,ls_primera_sepultura,ls_pasa_mora,&
			ls_email,ls_descrip_parque,ls_nom_usuario,ls_cod_tamano_cuerpo,ls_descrip_tamano,ls_obs_fall,ls_fono_com_tit,email_de,ls_email_para,ls_res,ls_dscto_1,ls_nombre_qr,ls_string,ls_dv_tercero,ls_nombre_tercero,&
			ls_ap_pater_tercero,ls_ap_mater_tercero,ls_dire_tercero,ls_fono_tercero,ls_cel_tercero,ls_email_tercero,ls_parentesco_tercero,ls_celular_tit,ls_email_pagador,ls_sw_p,ls_ok,&
			ls_pago_1,ls_pago_2,ls_pago_3,ls_pago_4,ls_pago_5,ls_pago_6,ls_dscto_2,ls_dscto_3,ls_dscto_4,ls_dscto_5,ls_dscto_6,ls_tipo_cob,ls_tipo_mov
long 		ll_rut_fall,ret,ll_rut_tit,ll_hora_sepult,ll_minuto_sepult,ll_funeraria,ll_parque,ll_capacidad,ll_cant_sepultados,ll_cap_libre_sep,ll_res_grabar,&
			ll_est_credito,ll_est_manten,ll_count,ll_hora_hoy,ll_minutos_hoy,ll_edad_fall,ll_count_reg,ll_comprobante,ll_tot_reg,ll_indi,ll_corr_interno,ll_parque1,ll_parque_aux,ll_cod_imagen,&
			ll_mora_cred,ll_mora_mant,ll_res,ll_hora_sepult_aux,ll_min_sepult_aux,ll_count_reg_aux,ll_max_ficha,ll_new,ll_sw_derecho,ll_sw_dscto_1,ll_corr_ficha,ll_rut_tercero,ll_corr_tercero,ll_parentesco_tercero,&
			ll_count_pre,ll_ficha_pregrabado,ll_sw_derecho_sepult,ll_sw_pago_1,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,&
			ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6
Datetime	ldt_fec_defun,ldt_fec_nac,ldt_fech_sepult,ldt_fech_contrato,ldt_fech_recep,ldt_fecha_hoy,ldt_fecha_sepult1
Double	ldb_uf_dia,ldb_der_sepult_uf,ldb_mov_sarcofago,ldb_cambio_ubica,ldb_reduccion,ldb_cert_defuncion,ldb_monto_canc,ll_numero,ll_num_inven,ldb_dscto_1,&
			ldb_pago_1,ldb_pago_2,ldb_pago_3,ldb_pago_4,ldb_pago_5,ldb_pago_6,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,ldb_total_dscto
//Validar Datos
tab_1.tabpage_4.dw_aranceles.accepttext()
ls_pasa_mora							= 'N'
ll_mora_cred							= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_credito')
ll_mora_mant							= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_mantencion')
ll_ficha_pregrabado					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'sw_pregrabado')
if ll_mora_cred>0 and ll_mora_mant>0 then
	ll_res									= messagebox("Advertencia","No es posible Crear Ficha Sepultación por Tener MORA CREDITO y MORA MANTENCION, desea Ingresar",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ls_pasa_mora					= 'S'
	end if
elseif ll_mora_cred>0 and ll_mora_mant=0 then
	ll_res									= messagebox("Advertencia","No es posible Crear Ficha Sepultación por Tener "+string(ll_mora_cred,'###,###,###,##0')+" cuota(s) MORA CREDITO, desea Ingresar",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ls_pasa_mora					= 'S'
	end if
elseif ll_mora_cred=0 and ll_mora_mant>0 then
	ll_res									= messagebox("Advertencia","No es posible Crear Ficha Sepultación por Tener "+string(ll_mora_mant,'###,###,###,##0')+" cuota(s) MORA MANTENCION, desea Ingresar",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ls_pasa_mora					= 'S'
	end if
else
	ls_pasa_mora						= 'S'
end if	
if ls_pasa_mora='S' then
	ll_sw_derecho						= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_pago_liberado')
	if ll_sw_derecho = 0 then
		ll_sw_dscto_1					= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'sw_dscto_1')
		ls_dscto_1						= tab_1.tabpage_4.dw_aranceles.getitemstring(tab_1.tabpage_4.dw_aranceles.getrow(),'dscto_otro_1')
		ldb_dscto_1						= tab_1.tabpage_4.dw_aranceles.getitemnumber(tab_1.tabpage_4.dw_aranceles.getrow(),'monto_dscto_1')
		if ll_sw_dscto_1 = 1 then
			messagebox("Advertencia","Debe Seleccionar Descuento")
			tab_1.tabpage_4.dw_aranceles.setfocus()
			tab_1.tabpage_4.dw_aranceles.setcolumn('sw_dscto_1')
		elseif isnull(ls_dscto_1) or ls_dscto_1='' then
			messagebox("Advertencia","Debe Seleccionar Tipo Descuento")
			tab_1.tabpage_4.dw_aranceles.setfocus()
			tab_1.tabpage_4.dw_aranceles.setcolumn('dscto_otro_1')
		elseif isnull(ldb_dscto_1) or ldb_dscto_1 <= 0 then
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
		ldt_fecha_hoy						= datetime(date(gdt_fec_sistema),time('00:00:00'))
		ll_hora_hoy							= long(string(gdt_fec_sistema,'hh'))
		ll_minutos_hoy						= long(string(gdt_fec_sistema,'mm'))
		//-- Juan
		ls_parentesco						= tab_1.tabpage_4.dw_aranceles.GetItemString(1,'codigo_parentesco')
		if ll_ficha_pregrabado = 0 then
			if isnull(ls_parentesco) then
				ls_sw_p							= wf_validar_pregrabado()
			else
				ll_ficha_pregrabado			= 1
				tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sw_pregrabado',ll_ficha_pregrabado)
				ls_sw								= wf_validar()
				ls_sw_p							= 'N'
			end if	
			ls_sw								= 'N'
		else
			ls_sw								= wf_validar()
			ls_sw_p							= 'N'
		end if
		if ls_sw = 'S' or ls_sw_p = 'S' then
		//-- fin juan
//		ls_sw									= wf_validar()
//		if ls_sw = 'S' then
			ret 								= MessageBox('Actualizar', "Desea Grabar Ficha De Sepultación", Question!, YesNo!, 2)
			IF ret = 1 THEN
				wf_setear_datos()
				// -- qr
				ls_estado_reg			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'estado_reg')
				ldt_fech_sepult   		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(1,'fecha_sepultacion')
				ll_parque					= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'cod_parque')
				ls_sector					= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(1,'sector')
				ls_sepultura				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'sepultura')
				ls_base					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'base')
				ls_serie					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(1,'serie')
				ll_numero				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'numero')
				ll_hora_sepult    		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'hora')
				ll_minuto_sepult		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(1,'minutos')
				if isnull(ll_hora_sepult) then ll_hora_sepult=0
				if isnull(ll_minuto_sepult) then ll_minuto_sepult=0
				ls_nombre_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(1,'nombre_fallecido')
				ls_ap_pat_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(1,'ap_paterno_fall')
				ls_ap_mat_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(1,'ap_materno_fall')
				if isnull(ls_nombre_fall) then ls_nombre_fall ='-'
				if isnull(ls_ap_pat_fall) then ls_ap_pat_fall ='-'
				if isnull(ls_ap_mat_fall) then ls_ap_mat_fall ='-'
				ls_nombre_qr			= ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
				SELECT	"COD_PARQ"."NOMBRE"  
				INTO 		:ls_descrip_parque  
				FROM 	"COD_PARQ"  
				WHERE 	"COD_PARQ"."CODIGO" = :ll_parque
				USING	sqlca;
			//	ls_string = 'Fallecido: '+ ls_nombre_qr + ' Contrato: '+ ls_base+' '+ls_serie + ' ' + string(ll_numero) + ' Parque: ' + ls_descrip_parque + ' Sector: ' + ls_sector+ ' Sepultura: ' +ls_sepultura
				ls_string = 'Fallecido: '+ ls_nombre_qr + ' Contrato: '+ ls_base+' '+ls_serie + ' ' + string(ll_numero) + ' Parque: ' + ls_descrip_parque + ' Sector: ' + ls_sector+ ' Sepultura: ' +ls_sepultura+ ' https://www.nuestrosparques.cl/geomobile/?parque='+string(ll_parque)+'&sector='+ls_sector+'&sepultura='+ls_sepultura
					String 	ls_ClientName[1]
					long 		ll_index
					integer 	rows
					integer 	cols
					string 	EncodedMsg
					integer 	i
					integer 	j
					integer 	count
					
					ls_ClientName[1] = ls_string
					for ll_index = 1 to 1				
						count = Len(ls_ClientName[ll_index])
						for i = 1 to count
							QRCodeSetCharAt(i - 1, Asc(Mid(ls_ClientName[ll_index], i, 1)));
						next
						QRCodeEncode(ls_ClientName[ll_index], 1, 2, 0);
						Rows = QRCodeGetRows()
						Cols = QRCodeGetCols()
						EncodedMsg = Char(13) + Char(10)
						for i = 1 to Rows
							for j = 1 to Cols
								EncodedMsg = EncodedMsg + Char(QRCodeGetCharAt(i - 1, j - 1))
							next
							EncodedMsg = EncodedMsg + Char(13) + Char(10)
						next
					next
					tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'qr_ficha',EncodedMsg)
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
				//qr_ficha
				if tab_1.tabpage_3.dw_ficha_sepult.update()=1 then
					commit;
					ls_estado_reg			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'estado_reg')
					ldt_fech_sepult   		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
					ll_parque					= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
					ls_sector					= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
					ls_sepultura				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
					ll_tot_reg				= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					SELECT	"COD_PARQ"."NOMBRE"  
					INTO 		:ls_descrip_parque  
					FROM 	"COD_PARQ"  
					WHERE 	"COD_PARQ"."CODIGO" = :ll_parque
					USING	sqlca;
	
					SELECT 	"FICHA_GRABACION_LAPIDA"."CODIGO_IMAGEN"
					INTO 		:ll_cod_imagen  
					FROM 	"FICHA_GRABACION_LAPIDA"  
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
						FROM 	"FALLECIDOS"  
						WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND  
								 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
								 ( "FALLECIDOS"."COD_PARQUE" = :ll_parque )   
						USING		sqlca;
						if ll_count_reg>0 then
							ll_cod_imagen	= 99
						else
							SELECT	"INVENTARIO_PLANI"."NUMERO"  
							INTO 		:ll_num_inven  
							FROM 	"INVENTARIO_PLANI"  
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
					for ll_indi=1 to ll_tot_reg
						ls_estado_reg			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_indi,'estado_reg')
						ll_corr_interno			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_interno')
						ll_rut_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'rut_fallecido')
						ls_dv_fall					= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'dv_fallecido')
						ls_nombre_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'nombre_fallecido')
						ls_ap_pat_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_paterno_fall')
						ls_ap_mat_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'ap_materno_fall')
						ls_sexo_fall      		= tab_1.tabpage_1.dw_ant_fall.getItemString(ll_indi,'sexo_fallecido')
						ll_edad_fall     			= tab_1.tabpage_1.dw_ant_fall.GetItemNumber(ll_indi,'edad_fallecido')
						ls_tipo_via_fall  		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'tipo_via_fallecido')
						ls_direc_fall				= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'direccion_fall')
						ls_num_dir_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'numero_direccion_fall')
						ls_dpto_dir_fall			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'depto_direccion_fall')
						ls_block_dir_fall		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'block_direccion_fall')
						ls_sector_fall	   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'sector_fall')
						ls_villa_fall	  	 		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'poblacion_villa_fall')
						ls_ciud_fall	 			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_ciudad_fall')
						ls_comu_fall	   			= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'codigo_comuna_fall')
						ls_cod_est_fall   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'cod_estado_fall')
						ls_causa_fall	   		= tab_1.tabpage_1.dw_ant_fall.GetItemString(ll_indi,'causa_fallecimiento')
						ldt_fec_defun	   		= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_defuncion')
						ldt_fec_nac 	   			= tab_1.tabpage_1.dw_ant_fall.GetItemdatetime(ll_indi,'fecha_nacimiento_fall')
						ll_rut_tit					= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'rut_titular')
						ls_dv_tit			 		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'dv_titular')
						ls_nombre_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'nombre_titular')
						ls_ap_pat_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_paterno_titular')
						ls_ap_mat_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'ap_materno_titular')
						ls_tipo_via_tit   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'tipo_via_titular')
						ls_direc_tit				= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'direccion_titular')
						ls_num_dir_tit	   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'num_direccion_titular')
						ls_dpto_dir_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'depto_direccion_titular')
						ls_block_dir_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'block_direccion_titular')
						ls_villa_tit	   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'poblacion_villa_titular')
						ls_sector_tit	   			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'sector_titular')
						ls_ciud_tit	 	   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_ciudad_titular')
						ls_comu_tit	      		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'codigo_comuna_titular')
						ls_fono_titular   		= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'fono_titular')
						//-- Juan
						ls_celular_tit			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'celular_titular')
						ls_email					= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'email_titular')
						ls_email_pagador		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'email_pagador')
						
						ll_rut_tercero				= tab_1.tabpage_2.dw_ant_titular.GetItemNumber(ll_indi,'rut_tercero')
						ls_dv_tercero	 			= tab_1.tabpage_2.dw_ant_titular.GetItemString(ll_indi,'dv_tercero')
						ls_nombre_tercero		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'nombre_tercero')
						ls_ap_pater_tercero		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'ap_paterno_tercero')
						ls_ap_mater_tercero		= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'ap_materno_tercero')
						ls_dire_tercero   			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'direccion_tercero')
						ls_fono_tercero  			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'fono_tercero')
						ls_cel_tercero  				= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'celular_tercero')
						ls_email_tercero   			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'email_tercero')
						ls_parentesco_tercero	= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_indi,'parentesco_tercero')
						//-- Fin Juan
						
						ls_ejecutivo        		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'codigo_ejecutivo')
						ldt_fech_sepult   		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_sepultacion')
						ll_hora_sepult    		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'hora')
						ll_minuto_sepult		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'minutos')
						ll_funeraria				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'codigo_funeraria')
						ls_fono_funera			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'fono_funeraria')
						ls_pase_sepult			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'pase_sepultacion')
						ls_base					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'base')
						ls_serie					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'serie')
						ll_numero				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'numero')
						ldt_fech_contrato		= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_contrato')
						ls_estad_contrato		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'cod_estado_contrato')
						ll_parque					= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cod_parque')
						ls_sector					= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'sector')
						ls_sepultura				= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'sepultura')
						ls_numero_tecni		= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'numero_tecnico')
						ll_capacidad				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad')
						ls_nivel					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'nivel')
						ll_cant_sepultados		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'cantidad_sepultados')	
						ls_est_sep_compl		= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'estado_sepultura_completa')
						ll_cap_libre_sep		= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'capacidad_libre_sepultura')
						ls_obs_sep_comp		= tab_1.tabpage_3.dw_ficha_sepult.GetItemstring(ll_indi,'observacion_sepultura_completa')
						ll_est_credito			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'estado_credito')
						ls_obs_credito			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'observacion_credito')
						ll_est_manten			= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(ll_indi,'estado_mantencion')
						ls_obs_manten			= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(ll_indi,'observacion_mantencion')
						ldt_fech_recep			= tab_1.tabpage_3.dw_ficha_sepult.GetItemDatetime(ll_indi,'fecha_recepcion')
						ls_parentesco			= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'codigo_parentesco')
						ldb_monto_canc    	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'monto_cancelar')
						ll_comprobante			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'folio_comprobante')
						ldb_uf_dia				= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'uf_dia')
						ldb_der_sepult_uf		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'valor_derecho_sepultacion_uf')
						ldb_mov_sarcofago	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'valor_mov_sarcofago')
						ldb_cambio_ubica		= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'valor_cambio_de_ubicacion')
						ldb_reduccion			= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'valor_reduccion')
						ldb_cert_defuncion	= tab_1.tabpage_4.dw_aranceles.GetItemNumber(ll_indi,'valor_certificado_defuncion')
						ls_obs					= tab_1.tabpage_4.dw_aranceles.GetItemString(ll_indi,'observacion')
						if ll_cant_sepultados > 1 then
							ls_primera_sepultura	= 'N'
						else
							ls_primera_sepultura	= 'S'
						end if
						if isnull(ls_numero_tecni) then ls_numero_tecni='-'
						if isnull(ls_nombre_fall) then ls_nombre_fall='-'
						if isnull(ls_ap_pat_fall) then ls_ap_pat_fall='-'
						if isnull(ls_ap_mat_fall) then ls_ap_mat_fall='-'
						if isnull(ll_hora_sepult) then ll_hora_sepult=0
						if isnull(ll_minuto_sepult) then ll_minuto_sepult=0
						SELECT	"CLIENTE"."FONO_P",	"CLIENTE"."FONO_C"  
						INTO 		:ls_fono_titular,		:ls_fono_com_tit  
						FROM 	"CLIENTE"  
						WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   
						USING		sqlca;
						if ll_rut_tercero > 0 then
							SELECT 	max("CLIENTE_TERCEROS"."CORRELATIVO_INGRESO")  
							INTO 		:ll_corr_tercero  
							FROM 	"CLIENTE_TERCEROS"  
							WHERE 	( "CLIENTE_TERCEROS"."BASE" = :ls_base ) AND  
										( "CLIENTE_TERCEROS"."SERIE" = :ls_serie ) AND  
										( "CLIENTE_TERCEROS"."NUMERO" = :ll_numero ) AND
										( "CLIENTE_TERCEROS"."RUT_TITULAR" = :ll_rut_tit );
						end if
	
	//					SELECT 	COUNT("FICHA_CARTA_SEPULTACION"."SECTOR")  
	//					INTO 		:ll_count  
	//					FROM 		"FICHA_CARTA_SEPULTACION"  
	//					WHERE  ( "FICHA_CARTA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
	//							 ( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
	//							 ( "FICHA_CARTA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fech_sepult ) AND  
	//							 ( "FICHA_CARTA_SEPULTACION"."CORRELATIVO" = :ll_indi ) AND  
	//							 ( "FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :ll_parque )   
	//					USING		sqlca;
	//					if ll_count>0 then
						if tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_ficha') > 0 then
							UPDATE 	"FICHA_CARTA_SEPULTACION"  
							SET	   "FECHA_CARTA"=:ldt_fecha_hoy,			
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
										"TIPO_VIA_TITULAR" = :ls_tipo_via_tit,
										"ESTADO_REG"=:ls_estado_reg,
										"FONO_PARTICULAR_TITULAR" = :ls_fono_titular,
										"FONO_COMERCIAL_TITULAR" = :ls_fono_com_tit
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
										"NOMBRE_TITULAR" = :ls_nombre_tit,   
										"APELLIDO_PATERNO_TITULAR" = :ls_ap_pat_tit,   
										"APELLIDO_MATERNO_TITULAR" = :ls_ap_mat_tit,   
										"RUT_TITULAR" = :ll_rut_tit,   
										"DV_TITULAR" = :ls_dv_tit,   
										"SECTOR" = :ls_sector,   
										"SEPULTURA" = :ls_sepultura,   
										"NUMERO_TECNICO" = :ls_numero_tecni,   
										"CAPACIDAD" = :ll_capacidad,   
										"NOMBRE_FALLECIDO" = :ls_nombre_fall,   
										"APELLIDO_PATERNO_FALL" = :ls_ap_pat_fall,   
										"APELLIDO_MATERNO_FALL" = :ls_ap_mat_fall,   
										"FECHA_NACIMIENTO_FALL" = :ldt_fec_nac,   
										"FECHA_FALLECIMIENTO" = :ldt_fec_defun,   
										"FECHA_DEFUNCION_LAPIDA" = :ldt_fec_defun,   
										"FECHA_NACIMIENTO_LAPIDA" = :ldt_fec_nac,   
										"RUT_FALLECIDO" = :ll_rut_fall,   
										"DV_FALLECIDO" = :ls_dv_fall,   
										"COD_PARQUE" = :ll_parque,
										"CODIGO_IMAGEN" = :ll_cod_imagen,
										"PRIMERA_SEPULTURA" = :ls_primera_sepultura,
										"ESTADO_REG"=:ls_estado_reg
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
							//--Juan
							ll_corr_ficha				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_indi,'correlativo_ficha')							
							INSERT INTO "FICHA_LOG_PRE_REGISTRO"  
												( "FECHA_CREA",		"USUARIO_LOG",	"COD_PARQUE",	"SECTOR",	"SEPULTURA",	"FECHA_SEPULTACION","BASE","SERIE","NUMERO","CORRELATIVO_FICHA")  
							VALUES 			( :gdt_fec_sistema,	:gs_user,	:ll_parque,		:ls_sector,	:ls_sepultura ,	:ldt_fech_sepult,:ls_base,:ls_serie, :ll_numero, :ll_corr_ficha)  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
							SELECT sysdate INTO :gdt_fec_sistema FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
							
							if ll_rut_tit > 0 then
								UPDATE 	"CLIENTE"  
								SET 	//	"EMAIL_PAGADOR" = :ls_email_pagador,   
											"EMAIL" = :ls_email,   
											"FONO_P" = :ls_fono_titular,   
											"CELULAR" = :ls_celular_tit  
								WHERE 	"CLIENTE"."RUT" = :ll_rut_tit  
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							end if
							
							if ll_rut_tercero > 0 then
								SELECT 	max("CLIENTE_TERCEROS"."CORRELATIVO_INGRESO")  
								INTO 		:ll_corr_tercero  
								FROM 	"CLIENTE_TERCEROS"  
								WHERE 	( "CLIENTE_TERCEROS"."BASE" = :ls_base ) AND  
											( "CLIENTE_TERCEROS"."SERIE" = :ls_serie ) AND  
											( "CLIENTE_TERCEROS"."NUMERO" = :ll_numero )   ;
						//		if ll_corr_tercero = 0 or isnull(ll_corr_tercero) then ll_corr_tercero = 1
								if ll_corr_tercero > 0 then		
									UPDATE "CLIENTE_TERCEROS"  
									SET	 	"BASE" = :ls_base,
												"SERIE" = :ls_serie, 
												"NUMERO" = :ll_numero, 
												"RUT_TITULAR" = :ll_rut_tit, 
												"DV_TITULAR" = :ls_dv_tit,
												"RUT_TERCERO" = :ll_rut_tercero,   
												"DV_RUT" = :ls_dv_tercero,   
												"NOMBRES_TERCERO" = :ls_nombre_tercero,   
												"APELLIDO_P_TERCERO" = :ls_ap_pater_tercero,   
												"APELLIDO_M_TERCERO" = :ls_ap_mater_tercero,   
												"TIPO_VIA" = '-',   
												"DIRECCION" = :ls_dire_tercero,   
												"FONO_PARTICULAR" = :ls_fono_tercero,   
												"CELULAR" = :ls_cel_tercero,   
												"CORRELATIVO_INGRESO" = :ll_corr_tercero,   
												"FECHA_SISTEMA" = :gdt_fec_sistema,   
												"PARENTESCO" = :ls_parentesco_tercero,   
												"EMAIL" = :ls_email_tercero  
									WHERE 	( "CLIENTE_TERCEROS"."BASE" = :ls_base ) AND  
												( "CLIENTE_TERCEROS"."SERIE" = :ls_serie) AND  
												( "CLIENTE_TERCEROS"."NUMERO" = :ll_numero ) AND  
												( "CLIENTE_TERCEROS"."RUT_TITULAR" = :ll_rut_tit ) and
												( "CLIENTE_TERCEROS"."CORRELATIVO_INGRESO" = :ll_corr_tercero )
									USING		sqlca;   
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
										//messagebox("Error Grabar","Error al Grabar Cliente Tercero SQL: "+sqlca.sqlerrtext)
									end if
								else
									if ll_corr_tercero = 0 or isnull(ll_corr_tercero) then ll_corr_tercero = 1
									INSERT INTO "CLIENTE_TERCEROS"  
												( "BASE", "SERIE", "NUMERO","CORRELATIVO_INGRESO",  "RUT_TITULAR", "DV_TITULAR", "RUT_TERCERO", "DV_RUT", "NOMBRES_TERCERO", "APELLIDO_P_TERCERO","APELLIDO_M_TERCERO", "TIPO_VIA", "DIRECCION", "NUMERO_PARTICULAR", "BLOCK_PARTICULAR", "POBLACION","SECTOR","COMUNA", "CIUDAD", "FONO_PARTICULAR", "CELULAR","OBSERVACION","FECHA_SISTEMA","PARENTESCO", "EMAIL" )  
									VALUES 	( :ls_base, :ls_serie, :ll_numero,		 :ll_corr_tercero,			:ll_rut_tit, 			:ls_dv_tit,  		:ll_rut_tercero,  	:ls_dv_tercero,  	:ls_nombre_tercero,   :ls_ap_pater_tercero,  :ls_ap_mater_tercero, '.',  :ls_dire_tercero,   	'-',   							'-',  						'-',   				'-', 	'-',  				'-',  :ls_fono_tercero,  			:ls_cel_tercero,   		null,  :gdt_fec_sistema,   :ls_parentesco_tercero, :ls_email_tercero);
									if sqlca.sqlcode = 0 then
										commit;
									else
										rollback;
									end if							
								end if
							end if
							//--juan
						else
							SELECT	MAX("FICHA_SEPULTACION"."CORRELATIVO_FICHA")  
							INTO 		:ll_max_ficha  
							FROM 		"FICHA_SEPULTACION"  
							WHERE		"FICHA_SEPULTACION"."COD_PARQUE" = :ll_parque
							USING		sqlca;
							if ll_max_ficha > 0 then
								ll_max_ficha ++
							else
								ll_max_ficha	= 1
							end if
							tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'correlativo_ficha',ll_max_ficha)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							if tab_1.tabpage_3.dw_ficha_sepult.update() = 1 then
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
										 ( "FECHA_CARTA",		"NOMBRE_TITULAR",	"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"DIRECCION_TITULAR",	"NUMERO_DIRECCION_TITULAR",	"DEPTO_DIRECCION_TITULAR",	"BLOCK_DIRECCION_TITULAR",	"POBLACION_VILLA_TITULAR",	"SECTOR_TITULAR",	"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION",	"CODIGO_FUNERARIA",	"FOLIO",		"BASE",	  	"SERIE",		"NUMERO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"CORRELATIVO",		"COD_PARQUE",	"TIPO_FICHA",	"TIPO_VIA_TITULAR",	"COD_PARENTESCO_AUTORIZA",	"FONO_PARTICULAR_TITULAR",	"FONO_COMERCIAL_TITULAR" )  
							VALUES 	 ( :ldt_fecha_hoy,			:ls_nombre_tit,			:ls_ap_pat_tit,							:ls_ap_mat_tit,							:ll_rut_tit,			:ls_dv_tit,		:ls_direc_tit,					:ls_num_dir_tit, 						:ls_dpto_dir_tit,						:ls_block_dir_tit,					:ls_villa_tit,							:ls_sector_tit,			:ls_sector,	:ls_sepultura,	:ls_numero_tecni,		:ll_capacidad,	:ls_nombre_fall,			:ls_ap_pat_fall,						:ls_ap_mat_fall,					:ldt_fech_sepult,			:ll_hora_sepult,				:ll_minuto_sepult,				:ll_funeraria,				:ll_count,		:ls_base,		:ls_serie,  	:ll_numero, 		:ll_rut_fall,  				:ls_dv_fall,     		:ll_indi,					:ll_parque,			'FS',				:ls_tipo_via_tit,				'19',										:ls_fono_titular,						:ls_fono_com_tit )
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
										( "BASE",		"SERIE",		"NUMERO",	"FECHA",				"FECHA_RECEPCION",	"NOMBRE_TITULAR",	"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_NACIMIENTO_FALL",	"FECHA_FALLECIMIENTO",	"CODIGO_RELIGION",	"CODIGO_IMAGEN",	"NOMBRE_FALLECIDO_LAPIDA",	"FECHA_DEFUNCION_LAPIDA",	"FECHA_NACIMIENTO_LAPIDA",	"FOLIO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"COD_PARQUE",	"PRIMERA_SEPULTURA",		"TIPO_FICHA",	"CORRELATIVO",	"FECHA_SEPULTACION",	"TIPO_CONSTRUCCION" )  
							VALUES 	( :ls_base,	:ls_serie,		:ll_numero,	:ldt_fecha_hoy,		:ldt_fecha_hoy,			:ls_nombre_tit,   		:ls_ap_pat_tit,							:ls_ap_mat_tit,							:ll_rut_tit,   			:ls_dv_tit,		:ls_sector,	:ls_sepultura,	:ls_numero_tecni,		:ll_capacidad,	:ls_nombre_fall,			:ls_ap_pat_fall,						:ls_ap_mat_fall,					:ldt_fec_nac,						:ldt_fec_defun,   				Null,						:ll_cod_imagen,		Null,										:ldt_fec_defun,						:ldt_fec_nac,							:ll_indi,		:ll_rut_fall,				:ls_dv_fall,			:ll_parque,			:ls_primera_sepultura,		'FS',				:ll_count,				:ldt_fech_sepult,			'G' )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
								//--Juan
									SELECT count("FICHA_LOG_PRE_REGISTRO"."USUARIO_LOG"  )
									INTO :ll_count_pre  
									FROM "FICHA_LOG_PRE_REGISTRO"  
									WHERE ( "FICHA_LOG_PRE_REGISTRO"."COD_PARQUE" = :ll_parque ) AND  
									( "FICHA_LOG_PRE_REGISTRO"."SECTOR" = :ls_sector ) AND  
									( "FICHA_LOG_PRE_REGISTRO"."SEPULTURA" = :ls_sepultura ) AND
									( "FICHA_LOG_PRE_REGISTRO"."CORRELATIVO_FICHA" = :ll_count )
									USING		sqlca;
									if ll_count_pre=0 then
										INSERT INTO "FICHA_LOG_PRE_REGISTRO"  
															( "FECHA_CREA",		"USUARIO_LOG",	"COD_PARQUE",	"SECTOR",	"SEPULTURA",	"FECHA_SEPULTACION","BASE","SERIE","NUMERO","CORRELATIVO_FICHA")  
										VALUES 			( :gdt_fec_sistema,	:gs_user,	:ll_parque,		:ls_sector,	:ls_sepultura ,	:ldt_fech_sepult,:ls_base,:ls_serie, :ll_numero, :ll_count)  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if	
								//--Juan fin												
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar GRABACION LAPIDA SQL: "+sqlca.sqlerrtext)
							end if
							//-- JUAN
							//if not isnull(ls_email_pagador) or ls_email_pagador= '' then
							if ll_rut_tit > 0 then
								UPDATE 	"CLIENTE"  
								SET 	//	"EMAIL_PAGADOR" = :ls_email_pagador,
											"FONO_P" = :ls_fono_titular,   
											"CELULAR" = :ls_celular_tit  
								WHERE 	"CLIENTE"."RUT" = :ll_rut_tit
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							end if
							if ll_rut_tercero > 0 then
								SELECT 	max("CLIENTE_TERCEROS"."CORRELATIVO_INGRESO")  
								INTO 		:ll_corr_tercero  
								FROM 	"CLIENTE_TERCEROS"  
								WHERE 	( "CLIENTE_TERCEROS"."BASE" = :ls_base ) AND  
										( "CLIENTE_TERCEROS"."SERIE" = :ls_serie ) AND  
										( "CLIENTE_TERCEROS"."NUMERO" = :ll_numero )   ;
								if ll_corr_tercero = 0 or isnull(ll_corr_tercero) then 
									ll_corr_tercero = 1
								else
									ll_corr_tercero  = ll_corr_tercero +1
								end if										
								if ll_corr_tercero > 0 then
									INSERT INTO "CLIENTE_TERCEROS"  
												( "BASE", "SERIE", "NUMERO","CORRELATIVO_INGRESO",  "RUT_TITULAR", "DV_TITULAR", "RUT_TERCERO", "DV_RUT", "NOMBRES_TERCERO", "APELLIDO_P_TERCERO","APELLIDO_M_TERCERO", "TIPO_VIA", "DIRECCION", "NUMERO_PARTICULAR", "BLOCK_PARTICULAR", "POBLACION","SECTOR","COMUNA", "CIUDAD", "FONO_PARTICULAR", "CELULAR","OBSERVACION","FECHA_SISTEMA","PARENTESCO", "EMAIL" )  
									VALUES 	( :ls_base, :ls_serie, :ll_numero,		 :ll_corr_tercero,			:ll_rut_tit, 			:ls_dv_tit,  		:ll_rut_tercero,  	:ls_dv_tercero,  	:ls_nombre_tercero,   :ls_ap_pater_tercero,  :ls_ap_mater_tercero, '.',  :ls_dire_tercero,   	'-',   							'-',  						'-',   				'-', 	'-',  				'-',  :ls_fono_tercero,  			:ls_cel_tercero,   		null,  :gdt_fec_sistema,   :ls_parentesco_tercero, :ls_email_tercero);
									if sqlca.sqlcode = 0 then
										commit;
									else
										rollback;
									end if	
								end if
							end if
						 	//-- Juan fin	
						end if
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
							
							ls_cod_tamano_cuerpo	= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'cod_tamano_cuerpo')
							ls_obs_fall					= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'observacion_fallecido')
							if not isnull(ls_cod_tamano_cuerpo) then
								SELECT	"FICHA_TAMANO"."DESCRIPCION"  
								INTO 		:ls_descrip_tamano  
								FROM 	"FICHA_TAMANO"  
								WHERE 	"FICHA_TAMANO"."CODIGO" = :ls_cod_tamano_cuerpo   ;
							end if
			
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
										
										ls_asunto				= 'AVISO DE SEPULTACION PARA EL DIA '+STRING(ldt_fech_sepult,"dd/mm/yyyy")+' HORA: '+string(ll_hora_sepult,'00')+' '+string(ll_minuto_sepult,'00')+' enviado por: '+ls_nom_usuario+' PARQUE: '+ls_descrip_parque
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
											ls_texto				= ls_texto+ ' Observación Fallecido: '+ls_obs_fall+'- Tamaño Cuerpo: '+ls_descrip_tamano
										end if
									end if
									if not isnull(ls_texto) then
										ls_texto					= ls_texto+'         Atte.Depto.At.y Serv.al Cliente'
										SELECT DISTINCT "ENCARGADOS"."EMAIL"  
										INTO 		:email_de  
										FROM 		"ENCARGADOS"  
										WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
										USING		sqlca;
										if isnull(email_de) or email_de='-' or email_de='' then
											email_de				= 'consulta@nuestrosparques.cl'
										end if
										
										SELECT 	"MEMBRETE_EMPRESA"."MAIL_SEPULTACION"  
										INTO 		:ls_email_para  
										FROM 	"MEMBRETE_EMPRESA"  
										WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_parque
										USING	sqlca;
	
	//									select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
	//									INTO 		:ls_res
	//									from 		DUAL;
	//									if ls_res='OK' then
	//										messagebox("Envio Email","Envio Email Exitoso")
	//									else
	//										messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
	//									end if
	
										SELECT sysdate INTO :gdt_fec_sistema FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
										INSERT INTO "FICHA_LOG_EMAIL"  
													( "FECHA_CREA",		"USUARIO_ENVIA",	"OBS_ENVIADA",	"USUARIO_RECEPTOR",	"COD_PARQUE",	"SECTOR",	"SEPULTURA",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION" )  
										VALUES 	( :gdt_fec_sistema,	:gs_user,			:ls_texto,		:ls_email_para,		:ll_parque,		:ls_sector,	:ls_sepultura,	:ldt_fech_sepult,		:ll_hora_sepult,		:ll_minuto_sepult	 )  
										USING		sqlca;
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
					ls_ok				= f_actualiza_beneficio_det(ls_base,ls_serie,ll_numero,'FS',ll_corr_interno,'M')
					wf_carga_detalle_boletas(ls_base, ls_serie, ll_numero, ll_corr_interno, ll_rut_tit, date(ldt_fech_sepult), ll_parque)
					ll_res_grabar	= messagebox("Grabar","Grabación Exitosa, desea Limpiar Pantalla",Exclamation!,YesNo!,2)
					if ll_res_grabar=1 then
						tab_1.tabpage_1.dw_ant_fall.reset()
						tab_1.tabpage_2.dw_ant_titular.reset()
						tab_1.tabpage_3.dw_ficha_sepult.reset()
						tab_1.tabpage_4.dw_aranceles.reset()
						idw_detalle5.reset()
						idw_detalle6.reset()
						//-- Juan
						tab_1.tabpage_1.dw_ant_fall.getchild('codigo_comuna_fall',idw_detalle2)
						idw_detalle2.settransobject(sqlca)
						idw_detalle2.insertrow(0)
						tab_1.tabpage_2.dw_ant_titular.getchild('codigo_comuna_titular',idw_detalle3)
						idw_detalle3.settransobject(sqlca)
						idw_detalle3.insertrow(0)
						//--
						idw_detalle5.InsertRow(0)
						idw_detalle6.InsertRow(0)
						tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
						tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
						tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
						if gs_depto='R' or gs_depto='M' then
							tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'codigo_ejecutivo',gs_user)
						end if
						ll_new												= tab_1.tabpage_4.dw_aranceles.InsertRow(0)
						wf_setear_arancel_sw(ll_new)
						tab_1.tabpage_1.dw_ant_fall.enabled	     	= false
						tab_1.tabpage_2.dw_ant_titular.enabled		= false
						tab_1.tabpage_4.dw_aranceles.enabled		= false
						tab_1.SelectTab(1)
						tab_1.tabpage_1.dw_ant_fall.setfocus()
						tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
					else
						cb_carta.setfocus()
					end if
					if isvalid(w_mantenedor_estadistico) then 
						close(w_ingreso_ficha_sepultacion)
						w_mantenedor_estadistico.setfocus()
					end if
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Ficha Sepultación SQL: "+sqlca.sqlerrtext)
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
	ls_sector			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector')
	ls_sepultura		= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura')
	if isnull(ll_cod_parque) then
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
	elseif isnull(ls_sector) then
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sector')
	elseif isnull(ls_sepultura) then
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('sepultura')
	end if
end if
end event

type cb_limpiar from commandbutton within w_ingreso_ficha_sepultacion_bkp
integer x = 1143
integer y = 2516
integer width = 215
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		ll_resp,ll_new
string	ls_tabpage

ll_resp	= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then
	tab_1.tabpage_1.dw_ant_fall.reset()
	tab_1.tabpage_2.dw_ant_titular.reset()
	tab_1.tabpage_3.dw_ficha_sepult.reset()
	tab_1.tabpage_4.dw_aranceles.reset()
	idw_detalle.reset()
	idw_detalle.insertrow(0)
	idw_detalle2.reset()
	idw_detalle2.insertrow(0)
	idw_detalle3.reset()
	idw_detalle3.insertrow(0)
	idw_detalle5.reset()
	idw_detalle5.insertrow(0)
	idw_detalle6.reset()
	idw_detalle6.insertrow(0)
	idw_detalle7.reset()
	idw_detalle7.insertrow(0)
	idw_detalle8.reset()
	idw_detalle8.insertrow(0)
	idw_detalle4.reset()
	idw_detalle4.insertrow(0)
	tab_1.tabpage_1.dw_ant_fall.getchild('codigo_comuna_fall',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	idw_detalle2.insertrow(0)
	
	tab_1.tabpage_2.dw_ant_titular.getchild('codigo_comuna_titular',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	idw_detalle3.insertrow(0)
	tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
	tab_1.tabpage_1.dw_ant_fall.setitem(1,'sw_titular_fall',1)
	tab_1.tabpage_1.dw_ant_fall.setitem(1,'usar_capilla','N')
	tab_1.tabpage_1.dw_ant_fall.setitem(1,'usar_templo','N')
	tab_1.tabpage_1.dw_ant_fall.setitem(1,'sw_alto_impacto',1)
	tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
	tab_1.tabpage_3.dw_ficha_sepult.InsertRow(0)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sw_pase_sepultacion',1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sw_protocolo_covid',1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sw_covid_19',1)
	tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sw_pregrabado',1)
	if gs_depto='R' or gs_depto='M' then
		tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'codigo_ejecutivo',gs_user)
	end if
	ll_new												= tab_1.tabpage_4.dw_aranceles.InsertRow(0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_pago_1',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_pago_2',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_pago_3',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_pago_4',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_pago_5',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_pago_6',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_otro_1',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_otro_2',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_otro_3',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_otro_4',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_otro_5',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_otro_6',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_pago_liberado',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_dscto_1',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_dscto_2',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_dscto_3',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_dscto_4',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_dscto_5',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sw_dscto_6',1)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_dscto_1',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_dscto_2',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_dscto_3',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_dscto_4',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_dscto_5',0)
	tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'monto_dscto_6',0)
	wf_setear_arancel_sw(ll_new)
	tab_1.tabpage_1.dw_ant_fall.enabled	      	= false
	tab_1.tabpage_2.dw_ant_titular.enabled		= false
	tab_1.tabpage_4.dw_aranceles.enabled		= false
end if
tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.enabled		= true   
tab_1.SelectTab(1)
tab_1.tabpage_3.dw_ficha_sepult.setcolumn('cod_parque')
tab_1.tabpage_3.dw_ficha_sepult.setfocus()

end event

type dw_print from datawindow within w_ingreso_ficha_sepultacion_bkp
boolean visible = false
integer x = 809
integer y = 2680
integer width = 457
integer height = 600
string title = "none"
string dataobject = "dw_ingreso_ficha_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_ingreso_ficha_sepultacion_bkp
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 48
integer width = 3753
integer height = 2428
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
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_3 tabpage_3
tabpage_2 tabpage_2
tabpage_1 tabpage_1
tabpage_4 tabpage_4
end type

event ue_mousemove;tab_1.tabpage_3.st_help.visible	= false
end event

on tab_1.create
this.tabpage_3=create tabpage_3
this.tabpage_2=create tabpage_2
this.tabpage_1=create tabpage_1
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_3,&
this.tabpage_2,&
this.tabpage_1,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_3)
destroy(this.tabpage_2)
destroy(this.tabpage_1)
destroy(this.tabpage_4)
end on

event clicked;Long	ll_cod_parque,ll_tot_reg,ll_indi
CHOOSE CASE tab_1.SelectedTab
	CASE 3
		ll_cod_parque	= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
		ll_tot_reg		= tab_1.tabpage_1.dw_ant_fall.rowcount()
		if ll_cod_parque>0 then
			for ll_indi=1 to ll_tot_reg
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'cod_parque',ll_cod_parque)
			next
			tab_1.tabpage_1.dw_ant_fall.accepttext()
		end if
//		if ll_cod_parque=102 then
//			tab_1.tabpage_1.dw_ant_fall.object.capilla_velatoria.y		= 1460
//			tab_1.tabpage_1.dw_ant_fall.object.capilla_velatoria.height	= 172
//			tab_1.tabpage_1.dw_ant_fall.object.capilla_velatoria_t.y		= 1468
//		else
//			tab_1.tabpage_1.dw_ant_fall.object.capilla_velatoria.y		= 1372
//			tab_1.tabpage_1.dw_ant_fall.object.capilla_velatoria.height	= 228
//			tab_1.tabpage_1.dw_ant_fall.object.capilla_velatoria_t.y		= 1380
//		end if
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
		tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		il_tab	= 3
		
	CASE 2
//		tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
		tab_1.tabpage_2.dw_ant_titular.setcolumn('rut_titular')
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		il_tab	= 2
		
	CASE 1
//		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('minutos')
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		il_tab	= 1
		
	CASE 4
//		tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
		tab_1.tabpage_4.dw_aranceles.setfocus()
		il_tab	= 4
		
END CHOOSE
end event

event selectionchanged;tab_1.tabpage_1.dw_ant_fall.accepttext()
tab_1.tabpage_2.dw_ant_titular.accepttext()
tab_1.tabpage_3.dw_ficha_sepult.accepttext()
tab_1.tabpage_4.dw_aranceles.accepttext()

CHOOSE CASE tab_1.SelectedTab
	CASE 3
//		tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
		if tab_1.tabpage_1.dw_ant_fall.getrow() > 0 then
			if tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'usar_templo') = 'S' then
				il_horaval_uso_templo	= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'hora_util_templo')
				il_minval_uso_templo		= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'minuto_util_templo')
				il_horavalfin_uso_templo	= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'hora_util_fin_templo')
				il_minvalfin_uso_templo	= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'minuto_util_fin_templo')
				is_obsval_uso_templo		= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'observacion_templo')
			end if
		end if
		tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
		tab_1.tabpage_1.dw_ant_fall.setfocus()
		il_tab								= 3
		
	CASE 2
//		tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
		tab_1.tabpage_2.dw_ant_titular.setcolumn('rut_titular')
		tab_1.tabpage_2.dw_ant_titular.setfocus()
		il_tab	= 2
		
	CASE 1
//		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		il_tab	= 1
		
	CASE 4
//		tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
		tab_1.tabpage_4.dw_aranceles.setcolumn('codigo_parentesco')
		tab_1.tabpage_4.dw_aranceles.setfocus()
		il_tab	= 4
		
END CHOOSE
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3717
integer height = 2300
long backcolor = 67108864
string text = "  Ficha Sepultacion"
long tabtextcolor = 33554432
string picturename = "AutosizeHeight!"
long picturemaskcolor = 536870912
st_help st_help
st_3 st_3
dw_ficha_sepult dw_ficha_sepult
end type

on tabpage_3.create
this.st_help=create st_help
this.st_3=create st_3
this.dw_ficha_sepult=create dw_ficha_sepult
this.Control[]={this.st_help,&
this.st_3,&
this.dw_ficha_sepult}
end on

on tabpage_3.destroy
destroy(this.st_help)
destroy(this.st_3)
destroy(this.dw_ficha_sepult)
end on

type st_help from statictext within tabpage_3
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2258
integer y = 360
integer width = 558
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28377087
boolean enabled = false
string text = "< Doble Click Obituario >"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;tab_1.tabpage_3.st_help.visible	= false
end event

type st_3 from statictext within tabpage_3
event ue_mousemove pbm_mousemove
integer x = 87
integer y = 40
integer width = 2226
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Ficha de Sepultación"
boolean focusrectangle = false
end type

event ue_mousemove;tab_1.tabpage_3.st_help.visible	= false
end event

type dw_ficha_sepult from datawindow within tabpage_3
event ue_mousemove pbm_dwnmousemove
integer x = 78
integer y = 160
integer width = 3561
integer height = 2080
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_ficha_sepultacion"
boolean border = false
end type

event ue_mousemove;String	ls_columna,ls_sector,ls_sepultura
Datetime	ldt_fec_sepult
Long		ll_cod_parque

ls_columna									= dwo.name
ldt_fec_sepult								= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
ls_sector										= this.getitemstring(this.getrow(),'sector')
ls_sepultura									= this.getitemstring(this.getrow(),'sepultura')
ll_cod_parque								= this.getitemnumber(this.getrow(),'cod_parque')
if isnull( ldt_fec_sepult ) or  ls_sector ='' or isnull( ls_sector ) or &
	isnull( ls_sepultura ) or  ls_sepultura ='' or  ll_cod_parque =0 or isnull( ll_cod_parque ) then
else
	if ls_columna='t_4' then//or ls_columna='hora' or ls_columna='t_5' or ls_columna='minutos'
		tab_1.tabpage_3.st_help.visible	= true
	else
		tab_1.tabpage_3.st_help.visible	= false
	end if
end if
end event

event itemchanged;String		ls_columna,ls_base, ls_ciudad,ls_serie,ls_sector_sepult,ls_nro_sepultura,ls_estado_ctto,ls_nro_tecnico,ls_dv_titular,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,&
			ls_cod_tipo_via,ls_direccion_p,ls_nro_part,ls_depto_part,ls_block_part,ls_pob_part,ls_sector_part,ls_comuna_part,ls_ciudad_part,ls_fono_part,ls_sector,ls_sepultura,ls_obs_credito,&
			ls_obs_mantencion,ls_vd_estadistico,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit, ls_tipo_via_tit,	ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,ls_pob_villa_tit,ls_sector_tit,&
			ls_cod_ciud_tit,ls_cod_com_tit,ls_fono_titular,ls_cod_ejecutivo,ls_nivel,ls_var_nivel,ls_var_final,ls_nivel_aux,ls_var_cap,ls_dv,ls_parque,ls_estado_reg,ls_cod_age_aux,ls_ciu_tit,ls_pasa,ls_pasa1,&
			ls_est_ctto,ls_descrip_estado,ls_nulo,ls_pasa_ctrol,ls_obs_pase,ls_mensaje_prov,ls_nro_tec_ctto,ls_tipo_cons,ls_string,ls_nom_falle,ls_ap_pater_falle,ls_ap_mater_falle,ls_est_falle,ls_cel_part,ls_email_titular
Double	ll_numero
Long		ll_cod_parque,ll_mora_cred,ll_mora_mant,ll_rut_titular,ll_hora,ll_new_arancel,ll_minutos,ll_new,ll_resp,ll_hora_recep,ll_minuto_recep,ll_hora_lleg_efec,ll_minu_lleg_efec,&
			ll_new_titular,ll_count_fall,ll_pos,ll_rut,ll_hora_hoy,ll_minutos_hoy,ll_new_fall,ll_new_ara,ll_anno,ll_hora_fijada,ll_min_fijada,ll_parque_tras,ll_count_sep,ll_count_tras,ll_count_suma,&
			ll_count_reserva,ll_parque_aux,ll_count_tiene,ll_sw_pase_sepultacion,ll_ins_fall,ll_count_cap,ll_nulo,ll_capacidad_ctto,ll_nro_tec_ctto,ll_tot_reg,ll_indi,ll_count_fosa,ll_sw_condolencia,ll_covid_19,ll_protocol_covid
Datetime	ldt_fecha_ctto,ldt_fecha_sepult,ldt_fecha_recep,ldt_fecha_hoy,ldt_fec_tras,	ldt_nulo,ldt_fecha_ini,ldt_fecha_fin
Date		ld_fecha,ld_fecha_sepult

this.accepttext()
Setnull(ldt_nulo);SetNull(ls_nulo);Setnull(ll_nulo)
ls_columna				= dwo.name
if ls_columna='cod_parque' or ls_columna='sector' or ls_columna='sepultura' or ls_columna='fecha_sepultacion' or ls_columna='fecha_sepultacion_1' then
	ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
	ls_sector				= this.getitemstring(this.getrow(),'sector')
	ls_sepultura			= this.getitemstring(this.getrow(),'sepultura')
	if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
		not isnull(ls_sepultura) and ls_sepultura<>'' then
		if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
			idw_detalle8.insertrow(0)
		end if
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
		if ls_pasa='S' or ls_pasa1='S' then
			ldt_fecha_sepult	= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
			if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
				not isnull(ls_sepultura) and ls_sepultura<>'' then //and not isnull(ldt_fecha_sepult)
				if dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)=0 then
					if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
						idw_detalle8.insertrow(0)
					end if
					idw_detalle7.reset()
					idw_detalle7.insertrow(0)
					idw_detalle.reset()
					idw_detalle.insertrow(0)
					if idw_detalle5.retrieve(ll_cod_parque)=0 then
						idw_detalle5.insertrow(0)
					end if
					if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
						idw_detalle6.insertrow(0)
					end if
					if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
						idw_detalle8.insertrow(0)
					end if
					ll_new		= dw_ficha_sepult.insertrow(0)
					dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
					dw_ficha_sepult.setitem(ll_new,'cod_parque',ll_cod_parque)
					dw_ficha_sepult.setitem(ll_new,'sector',ls_sector)
					dw_ficha_sepult.setitem(ll_new,'sepultura',ls_sepultura)
					dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
					dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
					dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
					dw_ficha_sepult.setitem(ll_new,'sw_protocolo_covid',1)
					dw_ficha_sepult.setitem(ll_new,'sw_covid_19',1)
					dw_ficha_sepult.accepttext()
					dw_ficha_sepult.setcolumn('fecha_sepultacion')
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
					if ls_pasa1='S' then
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
					end if
					if sqlca.sqlcode=0 then
						if ls_base='O' then
							if ll_numero=10000000 then
								ls_pasa_ctrol	= 'S'
							else
								SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
								INTO 		:ll_parque_aux,				:ls_cod_age_aux  
								FROM 		"CD_FOLIO"  
								WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
										 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
								USING		Trans_2;
								if Trans_2.sqlcode=0 then
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
							SELECT	"CADENA"."ESTADO",   
										"CLIENTE"."RUT",   
										"CLIENTE"."DV",   
										"CLIENTE"."NOMBRE",   
										"CLIENTE"."A_PATERNO",   
										"CLIENTE"."A_MATERNO",
										"CLIENTE"."EMAIL" 
							INTO		:ls_est_ctto,   
										:ll_rut_titular,   
										:ls_dv_titular,   
										:ls_nom_titular,   
										:ls_ap_pat_titular,   
										:ls_ap_mat_titular,
										:ls_email_titular  
							FROM		"CADENA",   
										"CLIENTE"  
							WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
									 ( "CADENA"."CODIGO" = :ls_base ) AND  
									 ( "CADENA"."SERIE" = :ls_serie ) AND  
									 ( "CADENA"."NUMERO" = :ll_numero )  
							USING		sqlca;
							if ls_est_ctto='V' or ls_est_ctto='C' or ls_est_ctto='R' or ls_est_ctto='S' or sqlca.sqlcode=100 then
								if not isnull(ldt_fecha_sepult) then
									if ls_base='O' then
										SELECT	"PAGO_OFERTA"."CAPACIDAD",	"OFERTA_V"."TIPO_CONS"
										INTO 		:il_capacidad,					:ls_tipo_cons
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
												 (("CADENA"."CODIGO" = :ls_base ) AND  
												 ( "CADENA"."SERIE" = :ls_serie ) AND  
												 ( "CADENA"."NUMERO" = :ll_numero ) )   
										USING		sqlca;
									elseif ls_base='C' then
										SELECT	"CONTRATO"."CAPACIDAD",	'T'
										INTO 		:il_capacidad,				:ls_tipo_cons
										FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
										WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
												 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
												 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
												 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
												 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
												 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
												 (("CADENA"."CODIGO" = :ls_base ) AND  
												 ( "CADENA"."SERIE" = :ls_serie ) AND  
												 ( "CADENA"."NUMERO" = :ll_numero ) )   
										USING		sqlca;
									end if
									if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
									ldt_fecha_ini	= datetime(RelativeDate(date(gdt_fec_sistema),  - 30))
									ldt_fecha_fin	= datetime(RelativeDate(date(gdt_fec_sistema), 60))
									if ldt_fecha_sepult <= ldt_fecha_fin and ldt_fecha_sepult >= ldt_fecha_ini then
										dw_ficha_sepult.setitem(ll_new,'fecha_sepultacion',ldt_fecha_sepult)
										dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
										
										if isnull(ls_nom_titular) then ls_nom_titular=''
										if isnull(ls_ap_pat_titular) then ls_ap_pat_titular=''
										if isnull(ls_ap_mat_titular) then ls_ap_mat_titular=''
										if ll_numero = 90000000 then
											messagebox("Advertencia","No es posible Generar Ficha de Sepultación de Fosa Común")
											ll_resp		= 2
										else
											ll_resp		= messagebox("Advertencia","Para Titular " +string(ll_rut_titular,'###,###,###,###,###')+'-'+ls_dv_titular+' '+ls_nom_titular+' '+ls_ap_pat_titular+' '+ls_ap_mat_titular+" No Existe Ficha de Sepultación, desea Ingresarla",Exclamation!,YesNo!,2)
										end if
										if ll_resp=1 then
											is_nuevo						= 'S'
											dw_ficha_sepult.accepttext()
											SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
											ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
											ll_hora_hoy					= long(string(gdt_fec_sistema,'hh'))
											ll_minutos_hoy				= long(string(gdt_fec_sistema,'mm'))
											dw_ficha_sepult.setitem(ll_new,'estado_reg','P')
											if is_usuario_esta='S' then
												dw_ficha_sepult.setitem(ll_new,'fecha_recepcion',ldt_fecha_hoy)
												dw_ficha_sepult.setitem(ll_new,'hora_recepcion',ll_hora_hoy)
												dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',ll_minutos_hoy)
											end if
											dw_ficha_sepult.setitem(ll_new,'c_estado_reg','S')
											dw_ficha_sepult.setitem(ll_new,'correlativo_interno',1)
											dw_ficha_sepult.setitem(ll_new,'sw_condolencia',1)
											dw_ficha_sepult.setitem(ll_new,'sw_pregrabado',1)
											dw_ficha_sepult.setitem(ll_new,'sw_tipo_ficha',1)
											dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
											dw_ficha_sepult.setitem(ll_new,'sw_protocolo_covid',1)
											dw_ficha_sepult.setitem(ll_new,'sw_covid_19',1)
											dw_ficha_sepult.setitem(ll_new,'sw_tipo_ficha',1)
											dw_ficha_sepult.setitem(ll_new,'sw_pregrabado',1)
											dw_ficha_sepult.setitem(ll_new,'estado_responso','N')
											dw_ficha_sepult.setitem(ll_new,'hora',0)
											dw_ficha_sepult.setitem(ll_new,'minutos',0)
											dw_ficha_sepult.setitem(ll_new,'hora_recepcion',0)
											dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',0)
											dw_ficha_sepult.setitem(ll_new,'hora_llegada_efectiva',0)
											dw_ficha_sepult.setitem(ll_new,'minuto_llegada_efectiva',0)
											dw_ficha_sepult.setitem(ll_new,'base',ls_base)
											if idw_detalle.retrieve(ls_base)=0 then
												idw_detalle.insertrow(0)
											end if
											dw_ficha_sepult.setitem(ll_new,'serie',ls_serie)
											dw_ficha_sepult.setitem(ll_new,'numero',ll_numero)
											//juan inicio
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
													( "FALLECIDOS"."N_SEP" = :ls_sepultura )
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
											tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'observacion_sepultura_completa',ls_string)
											tab_1.tabpage_3.dw_ficha_sepult.accepttext()
											// fin juan			
											
											SELECT	COUNT("FALLECIDOS"."LLAVE")  
											INTO 		:ll_count_fall  
											FROM 		"FALLECIDOS"  
											WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
													 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
													 ( "FALLECIDOS"."CONTRATO" = :ll_numero ) AND
													 ( "FALLECIDOS"."EST" = 'CC' );
											if isnull(ll_count_fall) then ll_count_fall=0
											if ls_base='O' then
												SELECT	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA",	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."NRO_TECNICO",	"OFERTA_V"."TIPO_CONS", "CLIENTE"."CELULAR" 
												INTO 		:ls_sector_sepult,		:ls_nro_sepultura,			:ll_cod_parque,			:ls_estado_ctto,		:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto,		:ll_capacidad_ctto,			:ls_nro_tec_ctto,					:ls_tipo_cons,		:ls_cel_part
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
													if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
													if isnull(ls_estado_ctto) or ls_estado_ctto='' then ls_estado_ctto='E'
													if not isnull(ll_capacidad_ctto) and ll_capacidad_ctto>0 then il_capacidad = ll_capacidad_ctto
													if not isnull(ls_nro_tec_ctto) and ls_nro_tec_ctto<>'' and ls_nro_tec_ctto<>'-' then is_nro_tecnico = ls_nro_tec_ctto
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','S')
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
													if dw_ficha_sepult.getitemstring(this.getrow(),'sector')=ls_sector_sepult then
														dw_ficha_sepult.setitem(this.getrow(),'sector',ls_sector_sepult)
													else
														ll_resp	= messagebox("Advertencia","Sector Inválido, Promesa Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
														if ll_resp=1 then
															dw_ficha_sepult.setitem(this.getrow(),'sector',ls_sector_sepult)
															dw_ficha_sepult.accepttext()
														else
															dw_ficha_sepult.setcolumn('sector')
														end if
													end if
													if dw_ficha_sepult.getitemstring(this.getrow(),'sepultura')=ls_nro_sepultura then
														dw_ficha_sepult.setitem(this.getrow(),'sepultura',ls_nro_sepultura)
													else
														ll_resp	= messagebox("Advertencia","Sepultura Inválida, Promesa Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
														if ll_resp=1 then
															dw_ficha_sepult.setitem(this.getrow(),'sepultura',ls_nro_sepultura)
															dw_ficha_sepult.accepttext()
														else
															dw_ficha_sepult.setcolumn('sepultura')
														end if
													end if
													dw_ficha_sepult.setitem(this.getrow(),'capacidad',il_capacidad)
													idw_detalle7.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)
													dw_ficha_sepult.setitem(this.getrow(),'estado_credito',ll_mora_cred)
													dw_ficha_sepult.setitem(this.getrow(),'estado_mantencion',ll_mora_cred)
													dw_ficha_sepult.setitem(this.getrow(),'numero_tecnico',is_nro_tecnico)//ls_nro_tecnico)
													dw_ficha_sepult.setitem(this.getrow(),'cod_estado_contrato',ls_estado_ctto)
													dw_ficha_sepult.setitem(this.getrow(),'cantidad_sepultados',ll_count_fall)
													dw_ficha_sepult.setitem(this.getrow(),'capacidad_libre_sepultura',il_capacidad - ll_count_fall)
													dw_ficha_sepult.accepttext()
													if (il_capacidad - ll_count_fall)=0 then
														dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_completa','S')
													else
														dw_ficha_sepult.setitem(this.getrow(),'estado_sepultura_completa','N')
													end if
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular',ll_rut_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular',ls_dv_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular',ls_nom_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular',ls_ap_pat_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular',ls_ap_mat_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'email_titular',ls_email_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular',ls_cod_tipo_via)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular',ls_direccion_p)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular',ls_nro_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular',ls_depto_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular',ls_block_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'poblacion_villa_titular',ls_pob_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'sector_titular',ls_sector_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular',ls_ciudad_part)
													if idw_detalle3.retrieve(ls_ciudad_part)=0 then
														idw_detalle3.insertrow(0)
													end if
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular',ls_comuna_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular',ls_fono_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'celular_titular',ls_cel_part)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato',ldt_fecha_ctto)
												else
													SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
													INTO 		:ll_parque_aux,				:ls_cod_age_aux  
													FROM 		"CD_FOLIO"  
													WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
															 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
													USING		Trans_2;
													if Trans_2.sqlcode=0 then
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','S')
														dw_ficha_sepult.setitem(this.getrow(),'estado_credito',0)
														dw_ficha_sepult.setitem(this.getrow(),'estado_mantencion',0)
													else
														messagebox("Advertencia","Contrato No Existe en Control Documentario")
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','N')
													end if
												end if
											elseif ls_base='C' then
												SELECT	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."FECHA",	"CONTRATO"."CAPACIDAD",		"CONTRATO"."NRO_TEC",	'T', "CLIENTE"."CELULAR"
												INTO 		:ls_estado_ctto,		:ll_cod_parque,			:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part  ,		:ls_sector_sepult,	:ls_nro_sepultura,		:ldt_fecha_ctto,		:ll_capacidad_ctto,			:ll_nro_tec_ctto,			:ls_tipo_cons,		:ls_cel_part
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
													if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
													if isnull(ls_estado_ctto) or ls_estado_ctto='' then ls_estado_ctto='E'
													if not isnull(ll_capacidad_ctto) and ll_capacidad_ctto>0 then il_capacidad = ll_capacidad_ctto
													if not isnull(ll_nro_tec_ctto) and ll_nro_tec_ctto>0 then is_nro_tecnico = String(ll_nro_tec_ctto)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','S')
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
													if dw_ficha_sepult.getitemstring(this.getrow(),'sector')=ls_sector_sepult then
														dw_ficha_sepult.setitem(this.getrow(),'sector',ls_sector_sepult)
													else
														ll_resp	= messagebox("Advertencia","Sector Inválido, Contrato IsaCruz Registra "+ls_sector_sepult+", desea Cambiar dato",Exclamation!,YesNo!,2)
														if ll_resp=1 then
															dw_ficha_sepult.setitem(this.getrow(),'sector',ls_sector_sepult)
															dw_ficha_sepult.accepttext()
														else
															dw_ficha_sepult.setcolumn('sector')
														end if
													end if
													if dw_ficha_sepult.getitemstring(this.getrow(),'sepultura')=ls_nro_sepultura then
														dw_ficha_sepult.setitem(this.getrow(),'sepultura',ls_nro_sepultura)
													else
														ll_resp	= messagebox("Advertencia","Sepultura Inválida, Contrato IsaCruz Registra Nº "+ls_nro_sepultura+", desea Cambiar dato",Exclamation!,YesNo!,2)
														if ll_resp=1 then
															dw_ficha_sepult.setitem(this.getrow(),'sepultura',ls_nro_sepultura)
															dw_ficha_sepult.accepttext()
														else
															dw_ficha_sepult.setcolumn('sepultura')
														end if
													end if
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'capacidad',il_capacidad)
													idw_detalle7.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)
													
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'estado_credito',ll_mora_cred)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'estado_mantencion',ll_mora_cred)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'numero_tecnico',is_nro_tecnico)//ls_nro_tecnico)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cod_estado_contrato',ls_estado_ctto)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'cantidad_sepultados',ll_count_fall)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'capacidad_libre_sepultura',il_capacidad - ll_count_fall)
													dw_ficha_sepult.accepttext()
													if (il_capacidad - ll_count_fall)=0 then
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'estado_sepultura_completa','S')
													else
														dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'estado_sepultura_completa','N')
													end if
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular',ll_rut_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular',ls_dv_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular',ls_nom_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular',ls_ap_pat_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular',ls_ap_mat_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'email_titular',ls_email_titular)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular',ls_cod_tipo_via)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular',ls_direccion_p)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular',ls_nro_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular',ls_depto_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular',ls_block_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'poblacion_villa_titular',ls_pob_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'sector_titular',ls_sector_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular',ls_ciudad_part)
													if idw_detalle3.retrieve(ls_ciudad_part)=0 then
														idw_detalle3.insertrow(0)
													end if
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular',ls_comuna_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular',ls_fono_part)
													tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'celular_titular',ls_cel_part)
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato',ldt_fecha_ctto)
												else
													dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','N')
												end if
											end if
											ll_cod_parque	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'cod_parque')
											if idw_detalle4.retrieve(ll_cod_parque)=0 then
												idw_detalle4.insertrow(0)
											end if
											tab_1.tabpage_2.dw_ant_titular.enabled		= true
											tab_1.tabpage_1.dw_ant_fall.enabled			= true
											tab_1.tabpage_4.dw_aranceles.enabled		= true
											dw_ficha_sepult.setfocus()
											dw_ficha_sepult.setcolumn('hora')
										else
											dw_ficha_sepult.reset()
											idw_detalle7.reset()
											idw_detalle7.insertrow(0)
											idw_detalle.reset()
											idw_detalle.insertrow(0)
											if idw_detalle5.retrieve(ll_cod_parque)=0 then
												idw_detalle5.insertrow(0)
											end if
											if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
												idw_detalle6.insertrow(0)
											end if
											if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
												idw_detalle8.insertrow(0)
											end if
											ll_new												= dw_ficha_sepult.insertrow(0)
											dw_ficha_sepult.setitem(ll_new,'c_estado_reg','N')
											dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
											dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
											dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
											dw_ficha_sepult.scrolltorow(dw_ficha_sepult.rowcount())
											dw_ficha_sepult.setfocus()
											dw_ficha_sepult.setcolumn('cod_parque')
											tab_1.tabpage_2.dw_ant_titular.reset()
											tab_1.tabpage_1.dw_ant_fall.reset()
											tab_1.tabpage_4.dw_aranceles.reset()
											idw_detalle3.reset()
											idw_detalle3.insertrow(0)
											idw_detalle2.reset()
											idw_detalle2.insertrow(0)
											tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
											tab_1.tabpage_1.dw_ant_fall.reset()
											ll_ins_fall		= tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
											tab_1.tabpage_1.dw_ant_fall.setitem(ll_ins_fall,'c_estadistico',is_usuario_esta)
											tab_1.tabpage_1.dw_ant_fall.setitem(ll_ins_fall,'usar_capilla','N')
											tab_1.tabpage_1.dw_ant_fall.setitem(ll_ins_fall,'usar_templo','N')
											tab_1.tabpage_1.dw_ant_fall.setitem(ll_ins_fall,'sw_alto_impacto',1)
											tab_1.tabpage_1.dw_ant_fall.setitem(ll_ins_fall,'sw_titular_fall',1)
											tab_1.tabpage_1.dw_ant_fall.accepttext()
											if gs_depto='R' or gs_depto='M' then
												tab_1.tabpage_1.dw_ant_fall.setitem(ll_ins_fall,'codigo_ejecutivo',gs_user)
											end if
											tab_1.tabpage_1.dw_ant_fall.accepttext()
											ll_cod_parque	= dw_ficha_sepult.getitemnumber(ll_new,'cod_parque')
											if idw_detalle4.retrieve(ll_cod_parque)=0 then
												idw_detalle4.insertrow(0)
											end if
											ll_new_arancel										= tab_1.tabpage_4.dw_aranceles.InsertRow(0)
											wf_setear_arancel_sw(ll_new_arancel)
											tab_1.tabpage_2.dw_ant_titular.enabled		= false
											tab_1.tabpage_1.dw_ant_fall.enabled			= false
											tab_1.tabpage_4.dw_aranceles.enabled		= false
										end if
									else
										messagebox("Advertencia","Fecha Sepultación Inválida, No debe ser Mayor al "+string(ldt_fecha_fin,'dd/mm/yyyy')+" ni Menor al "+string(ldt_fecha_ini,'dd/mm/yyyy'))
										this.setitem(this.getrow(),'fecha_sepultacion',ldt_nulo)
										this.accepttext()
										this.setcolumn('fecha_sepultacion')
									end if
								end if							
							else
								SELECT	"ESTADO"."NOMBRE_ESTADO"  
								INTO 		:ls_descrip_estado  
								FROM 		"ESTADO"  
								WHERE 	"ESTADO"."COD_ESTADO" = :ls_est_ctto   ;
								messagebox("Advertencia","Recuerde Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" Estado Actual es "+ls_descrip_estado+" debe estar VIGENTE, CANCELADO o RESUELTO, regularice en Depto. Atención Cliente")
								dw_ficha_sepult.setcolumn('sector')
							end if
						else
							messagebox("Advertencia","Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" No Existe en Control Documentario")
							dw_ficha_sepult.setcolumn('sector')
						end if
					else
						messagebox("Advertencia","Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,####')+" No Tiene Reserva")
						dw_ficha_sepult.setcolumn('sector')
					end if
				else
					ll_tot_reg	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					for ll_indi=1 to ll_tot_reg
						tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estadistico',is_usuario_esta)
					next
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
					if tab_1.tabpage_2.dw_ant_titular.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)>0 then
						ls_ciu_tit	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
						if idw_detalle3.retrieve(ls_ciu_tit)=0 then
							idw_detalle3.insertrow(0)
						end if
						ll_rut_titular	= tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular')
						ls_dv_titular	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'dv_titular')
						ls_nom_titular	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'nombre_titular')
						ls_ap_pat_titular	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_paterno_titular')
						ls_ap_mat_titular	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_materno_titular')
					end if
					ll_tot_reg	= tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
					for ll_indi=1 to ll_tot_reg
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'c_estadistico',is_usuario_esta)
					next
					tab_1.tabpage_1.dw_ant_fall.accepttext()
					ll_cod_parque	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'cod_parque')
					
					if idw_detalle4.retrieve(ll_cod_parque)=0 then
						idw_detalle4.insertrow(0)
					end if
					tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
					ls_estado_reg	= dw_ficha_sepult.getitemstring(1,'estado_reg')
					if ls_estado_reg='A' then
						messagebox("Advertencia","Ficha Anulada")
						tab_1.tabpage_2.dw_ant_titular.enabled		= false
						tab_1.tabpage_1.dw_ant_fall.enabled			= false
						tab_1.tabpage_4.dw_aranceles.enabled		= false
						dw_ficha_sepult.enabled							= false
					else
						il_count_reg	= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
						if isnull(ls_nom_titular) then ls_nom_titular=''
						if isnull(ls_ap_pat_titular) then ls_ap_pat_titular=''
						if isnull(ls_ap_mat_titular) then ls_ap_mat_titular=''
						ll_resp			= messagebox("Advertencia","Para Titular " +string(ll_rut_titular,'###,###,###,###,###')+'-'+ls_dv_titular+' '+ls_nom_titular+' '+ls_ap_pat_titular+' '+ls_ap_mat_titular+ ", desea Crear OTRA Ficha de Sepultación",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							
							wf_cargar_datos()
							
							cb_volver.triggerevent(getfocus!)
						else
							tab_1.tabpage_2.dw_ant_titular.enabled		= true
							tab_1.tabpage_1.dw_ant_fall.enabled			= true
							tab_1.tabpage_4.dw_aranceles.enabled		= true
						end if
					end if
				end if
				if not isnull(ll_cod_parque) and not isnull(ls_sector) and not isnull(ls_sepultura) and not isnull(ldt_fecha_sepult) then
					SELECT 	  Count("FOSA_COMUN"."AREA")
					INTO 		  :ll_count_fosa  
					FROM 	  "FOSA_COMUN"  
					WHERE 	( "FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "FOSA_COMUN"."SECTOR" = :ls_sector ) AND  
								( "FOSA_COMUN"."SEPULTURA" = :ls_sepultura )   ;
					if ll_count_fosa > 0 then
						messagebox("Advertencia","No es posible Generar Ficha de Sepultación de Fosa Común")
						dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'c_existe_ctto','N')
						dw_ficha_sepult.accepttext()
//						ls_string	= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura
//						if isvalid(w_lista_fosa_comun_para_fs) then close(w_lista_fosa_comun_para_fs)
//						openwithparm(w_lista_fosa_comun_para_fs,ls_string)
					end if
				end if
				
			end if
		else
			messagebox("Advertencia","No Existe Reserva para Sector: "+ls_sector+"  Sepultura: "+ls_sepultura)
		end if
		tab_1.tabpage_2.dw_ant_titular.accepttext()
		tab_1.tabpage_1.dw_ant_fall.accepttext()
		tab_1.tabpage_4.dw_aranceles.accepttext()
	end if
	if ls_columna='cod_parque' then 
		if ll_cod_parque>0 then 
			if idw_detalle5.retrieve(ll_cod_parque)=0 then
				idw_detalle5.insertrow(0)
			end if
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
			
			SELECT	"FICHA_HORAS_TEMPLO"."HORA_INICIO",   
						"FICHA_HORAS_TEMPLO"."MINUTO_INICIO",   
						"FICHA_HORAS_TEMPLO"."HORA_FINAL",   
						"FICHA_HORAS_TEMPLO"."MINUTO_FINAL",   
						"FICHA_HORAS_TEMPLO"."INTERVALO_MINUTO",   
						"FICHA_HORAS_TEMPLO"."VECES_USO"  
			INTO		:il_hora_ini_templo,   
						:il_min_ini_templo,   
						:il_hora_fin_templo,   
						:il_min_fin_templo,   
						:il_intervalo_templo,   
						:il_veces_templo  
			FROM 	"FICHA_HORAS_TEMPLO"  
			WHERE 	"FICHA_HORAS_TEMPLO"."COD_PARQUE" = :ll_cod_parque   ;
		end if
	end if
	if ls_columna='sector' then
		if ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' then 
			if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
				idw_detalle6.insertrow(0)
			end if
		end if
	end if	
end if
if ls_columna='sepultura' then
	is_modif	= 'S'
end if
if ls_columna='base' then
	ls_base	= this.getitemstring(this.getrow(),'base')
	if idw_detalle.retrieve(ls_base)=0 then
		idw_detalle.insertrow(0)
	end if
end if
if ls_columna='base' or ls_columna='serie' or ls_columna='numero' then
	wf_valida_contrato()
end if
if ls_columna='rut_diacono' or ls_columna='dv_diacono' then
	ll_rut				= this.getitemnumber(this.getrow(),'rut_diacono')
	if ll_rut>0 then
		SELECT	"DIACONOS"."DV_DIACONO"  
		INTO 		:ls_dv  
		FROM 		"DIACONOS"  
		WHERE 	"DIACONOS"."RUT_DIACONO" = :ll_rut   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			this.setitem(this.getrow(),'dv_diacono',ls_dv)
			this.accepttext()
		end if
	end if
end if
if ls_columna='capacidad' then
	il_capacidad		= dw_ficha_sepult.getitemnumber(this.getrow(),'capacidad')
	ll_cod_parque	= dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')
	ls_base			= dw_ficha_sepult.getitemstring(this.getrow(),'base')
	ls_serie			= dw_ficha_sepult.getitemstring(this.getrow(),'serie')
	ll_numero		= dw_ficha_sepult.getitemnumber(this.getrow(),'numero')
	SELECT	Count("LISTA_PRECIO"."SECTOR")  
	INTO 		:ll_count_cap  
	FROM 	"LISTA_PRECIO"  
	WHERE 	"LISTA_PRECIO"."CAPACIDAD" = :il_capacidad AND
				"LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque
	USING	sqlca;
	if ll_count_cap=0 then
		SELECT	"PAGO_OFERTA"."CAPACIDAD"  
		INTO 		:ll_count_cap  
		FROM 	"CADENA",  	"OFERTA_V", 	"PAGO_OFERTA"  
		WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = "OFERTA_V"."BASE" ) and  
					( ( "CADENA"."CODIGO" = :ls_base ) AND  
					( "CADENA"."SERIE" = :ls_serie ) AND  
					( "CADENA"."NUMERO" = :ll_numero ) )   
		UNION   
		SELECT 	"CONTRATO"."CAPACIDAD"  
		FROM 	"CADENA", 	"CONTRATO"  
		WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					( ( "CADENA"."CODIGO" = :ls_base ) AND  
					( "CADENA"."SERIE" = :ls_serie ) AND  
					( "CADENA"."NUMERO" = :ll_numero ) )   ;
		if ll_count_cap = 0 then
			messagebox("Advertencia","Capacidad NO Registrada")
			dw_ficha_sepult.setitem(this.getrow(),'capacidad',ll_nulo)
		end if
	end if
	if ll_count_cap > 0 then
		if ls_base='O' then
			SELECT	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."NRO_TECNICO",	"OFERTA_V"."TIPO_CONS"
			INTO 		:ll_capacidad_ctto,			:ls_nro_tec_ctto,					:ls_tipo_cons
			FROM 	"CADENA",   "CADENA_MORA",	"CLIENTE",	"OFERTA_V",	"PAGO_OFERTA"  
			WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
					 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
					 ( "CLIENTE"."RUT" = "CADENA"."RUT" ) and  
					 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
		elseif ls_base='C' then
			SELECT	"CONTRATO"."CAPACIDAD",		"CONTRATO"."NRO_TEC",	'T'
			INTO 		:ll_capacidad_ctto,			:ll_nro_tec_ctto,			:ls_tipo_cons
			FROM 		"CADENA",	"CADENA_MORA",	"CLIENTE",	"CONTRATO"  
			WHERE  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					 ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
		end if
		if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
		if ll_capacidad_ctto > 0 and il_capacidad > 0 and ll_capacidad_ctto <> il_capacidad then
		end if		
	end if
	dw_ficha_sepult.setitem(this.getrow(),'nivel',ls_nulo)
	if idw_detalle7.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
		idw_detalle7.insertrow(0)
	end if
	
end if
this.accepttext()
if ls_columna='sw_pase_sepultacion' then
	ll_sw_pase_sepultacion	= long(data)
	ls_mensaje_prov			= 'PASE PROVISORIO'
	if ll_sw_pase_sepultacion=0 then
		ls_obs_pase				= trim(this.getitemstring(this.getrow(),'pase_sepultacion'))
		if not isnull(ls_obs_pase) then
			if mid(ls_obs_pase,1,15) <> 'PASE PROVISORIO' then
				this.setitem(this.getrow(),'pase_sepultacion','PASE PROVISORIO '+ls_obs_pase)
			end if
		else
			this.setitem(this.getrow(),'pase_sepultacion',ls_mensaje_prov)
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
				this.setitem(this.getrow(),'pase_sepultacion',ls_obs_pase)
			end if
		end if
	end if
end if
if ls_columna='fecha_pase' then
	ld_fecha				= date(this.getitemdatetime(this.getrow(),'fecha_pase'))
	if not isnull(ld_fecha) then
		ll_anno				= year(ld_fecha)
		this.setitem(this.getrow(),'anno_pase',ll_anno)
	end if
	this.accepttext()
end if
if ls_columna='hora_llegada_efectiva' then
	ll_hora	= this.getitemnumber(this.getrow(),'hora_llegada_efectiva')
	if ll_hora>23 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'hora_llegada_efectiva',0)
	end if
end if
if ls_columna='minuto_llegada_efectiva' then
	ll_minutos	= this.getitemnumber(this.getrow(),'minuto_llegada_efectiva')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'minuto_llegada_efectiva',0)
	end if
end if
if ls_columna='hora' then
	ll_hora			= this.getitemnumber(this.getrow(),'hora')
	ll_cod_parque	= this.getitemnumber(this.getrow(),'cod_parque')
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
	
	SELECT	"FICHA_HORAS_TEMPLO"."HORA_INICIO",   
				"FICHA_HORAS_TEMPLO"."MINUTO_INICIO",   
				"FICHA_HORAS_TEMPLO"."HORA_FINAL",   
				"FICHA_HORAS_TEMPLO"."MINUTO_FINAL",   
				"FICHA_HORAS_TEMPLO"."INTERVALO_MINUTO",   
				"FICHA_HORAS_TEMPLO"."VECES_USO"  
	INTO		:il_hora_ini_templo,   
				:il_min_ini_templo,   
				:il_hora_fin_templo,   
				:il_min_fin_templo,   
				:il_intervalo_templo,   
				:il_veces_templo  
	FROM 	"FICHA_HORAS_TEMPLO"  
	WHERE 	"FICHA_HORAS_TEMPLO"."COD_PARQUE" = :ll_cod_parque   ;
	if ll_hora>23 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'hora',0)
		this.accepttext()
	end if
end if
if ls_columna='minutos' then
	ll_minutos	= this.getitemnumber(this.getrow(),'minutos')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'minutos',0)
		this.accepttext()
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
if ls_columna='hora' or ls_columna='minutos' then
	wf_validar_horario(this.getrow(),'H')
end if
if ls_columna='hora_recepcion' then
	ll_hora	= this.getitemnumber(this.getrow(),'hora_recepcion')
	if ll_hora>23 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'hora_recepcion',0)
		this.accepttext()
	end if
end if
if ls_columna='minuto_recepcion' then
	ll_minutos	= this.getitemnumber(this.getrow(),'minuto_recepcion')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'minuto_recepcion',0)
		this.accepttext()
	end if
end if

if ls_columna='sw_condolencia' then
	ll_sw_condolencia	= this.getitemnumber(this.getrow(),'sw_condolencia')
	if ll_sw_condolencia = 1 then
		this.setitem(this.getrow(),'cod_maestro_condolencia',ls_nulo)
		this.accepttext()
	end if
end if
if ls_columna='sw_covid_19' then
	ll_covid_19	= long(data)
	if ll_covid_19 = 0 then
		this.setitem(this.getrow(),'sw_protocolo_covid',0)
		this.accepttext()
	end if
end if
if ls_columna='sw_protocolo_covid' then
	ll_protocol_covid	= long(data)
	if ll_protocol_covid = 1 then
		this.setitem(this.getrow(),'sw_covid_19',1)	
		this.accepttext()
	end if
end if
this.accepttext()
end event

event clicked;String		ls_estado,ls_columna,ls_fecha,ls_sector,ls_sepultura,ls_base,ls_serie,ls_estado_ctto,ls_nro_tecnico,ls_obs_mantencion,ls_vd_estadistico,ls_obs_credito,ls_estado_reg,ls_dv_titular,ls_nombre_tit,ls_ap_pat_tit,&
			ls_ap_mat_tit,ls_tipo_via_tit,ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,ls_pob_villa_tit,ls_sector_tit,ls_cod_ciud_tit,ls_cod_com_tit,ls_fono_titular,ls_cod_ejecutivo,ls_vb,&
			ls_nombre,ls_ap_pat,ls_ap_mat,ls_string,ls_ejecutivo,ls_obs,ls_ciu_tit,ls_pasa,ls_pasa1,ls_est_ctto,ls_sector_sepult,ls_nro_sepultura,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,ls_cod_tipo_via,&
			ls_direccion_p,ls_nro_part,ls_depto_part,ls_block_part,ls_pob_part,ls_sector_part,ls_comuna_part,ls_ciudad_part,ls_fono_part,ls_cod_age_aux,ls_pasa_ctrol,ls_nro_tec_ctto,ls_tipo_cons,&
			ls_pasa_fosa='N',ls_cel_titular,ls_cel_part,ls_nombre_contac,ls_dire_contac,ls_fono_contac,ls_cel_contac,ls_email_contac
Long 		ll_hora, ll_minutos,ll_cod_parque,ll_new,ll_resp,ll_mora_cred,ll_mora_mant,ll_new_arancel,ll_hora_recep,ll_minuto_recep,ll_hora_lleg_efec,ll_minu_lleg_efec,ll_rut_titular,ll_new_1,&
			ll_max,ll_anno,ll_hora_fijada,ll_minuto_fijado,ll_hora_hoy,ll_minutos_hoy,ll_count_reserva,ll_count_tiene,ll_count_fall,ll_capacidad,ll_parque_aux,ll_new_ins,ll_row,ll_nro_tec_ctto,ll_capacidad_ctto,ll_count_fosa
Datetime	ldt_fecha_sepult,ldt_fecha_ctto,ldt_fecha_recep,ldt_fecha_hoy,ldt_nulo,ldt_fecha_ini,ldt_fecha_fin
Date		ld_fecha
Double	ll_numero

this.accepttext()
SetNull(ldt_nulo)
ll_row						= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
ls_columna						= dwo.name
ls_estado_reg					= this.getitemstring(this.getrow(),'estado_reg')
if (ls_estado_reg<>'G' and ls_estado_reg<>'A') or isnull(ls_estado_reg) then
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
			ls_sector				= this.getitemstring(this.getrow(),'sector')
			ls_sepultura			= this.getitemstring(this.getrow(),'sepultura')
			if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
				not isnull(ls_sepultura) and ls_sepultura<>'' then
				ls_fecha			= string(date(dw_ficha_sepult.getitemdatetime(dw_ficha_sepult.getrow(),'fecha_sepultacion')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_sepultacion',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_sepultacion',date(ls_fecha))
				END IF
				ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
				ls_sector				= this.getitemstring(this.getrow(),'sector')
				ls_sepultura			= this.getitemstring(this.getrow(),'sepultura')
				ldt_fecha_sepult	= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
				if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
					not isnull(ls_sepultura) and ls_sepultura<>'' and not isnull(ldt_fecha_sepult) then
					ldt_fecha_ini	= datetime(RelativeDate(date(gdt_fec_sistema),  - 30))
					ldt_fecha_fin	= datetime(RelativeDate(date(gdt_fec_sistema),  60))
					if ldt_fecha_sepult <= ldt_fecha_fin and ldt_fecha_sepult >= ldt_fecha_ini then
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
						if ls_pasa='S' or ls_pasa1='S' then
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
							if ls_pasa1='S' then
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
							end if
							if sqlca.sqlcode=0 then
								if ls_base='O' then
									if ll_numero=10000000 then
										ls_pasa_ctrol	= 'S'
									else
										SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
										INTO 		:ll_parque_aux,				:ls_cod_age_aux  
										FROM 		"CD_FOLIO"  
										WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
												 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
										USING		Trans_2;
										if Trans_2.sqlcode=0 then
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
									if ls_est_ctto='V' or ls_est_ctto='C' or ls_est_ctto='R' or ls_est_ctto='S' or sqlca.sqlcode=100 then
										SELECT	COUNT("FALLECIDOS"."LLAVE")  
										INTO 		:ll_count_fall  
										FROM 		"FALLECIDOS"  
										WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
												 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
												 ( "FALLECIDOS"."CONTRATO" = :ll_numero ) AND
 												 ( "FALLECIDOS"."EST" = 'CC' )  ;
										if isnull(ll_count_fall) then ll_count_fall=0

										if ls_base='O' then
											SELECT	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR", 	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION", 	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"OFERTA_V"."FECHA",	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."NRO_TECNICO",	"OFERTA_V"."TIPO_CONS"
											INTO 		:ls_sector_sepult,		:ls_nro_sepultura,			:ll_cod_parque,			:ls_estado_ctto,		:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,						:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part,			:ldt_fecha_ctto,		:ll_capacidad_ctto,			:ls_nro_tec_ctto,					:ls_tipo_cons
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
											if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
											if not isnull(ll_capacidad_ctto) and ll_capacidad_ctto>0 then il_capacidad = ll_capacidad_ctto
											if not isnull(ls_nro_tec_ctto) and ls_nro_tec_ctto<>'' and ls_nro_tec_ctto<>'-' then is_nro_tecnico = ls_nro_tec_ctto
										elseif ls_base='C' then
											SELECT	"CADENA"."ESTADO",	"CADENA"."COD_PARQUE",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."FONO_P",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA",	"CONTRATO"."FECHA",	"CONTRATO"."CAPACIDAD",	"CONTRATO"."NRO_TEC",	'T'  
											INTO 		:ls_estado_ctto,		:ll_cod_parque,			:ll_mora_cred,					:ll_mora_mant,					:ll_rut_titular,	:ls_dv_titular,	:ls_nom_titular,		:ls_ap_pat_titular,		:ls_ap_mat_titular,		:ls_cod_tipo_via,			:ls_direccion_p,				:ls_nro_part,							:ls_depto_part,					:ls_block_part,   				:ls_pob_part,				:ls_sector_part, 		:ls_comuna_part,		:ls_ciudad_part,		:ls_fono_part  ,		:ls_sector_sepult,	:ls_nro_sepultura,		:ldt_fecha_ctto,		:ll_capacidad_ctto,		:ll_nro_tec_ctto,			:ls_tipo_cons
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
											if not isnull(ll_capacidad_ctto) and ll_capacidad_ctto>0 then il_capacidad = ll_capacidad_ctto
											if not isnull(ll_nro_tec_ctto) and ll_nro_tec_ctto>0 then is_nro_tecnico = String(ll_nro_tec_ctto)
										end if
										if isnull(ls_estado_ctto) or ls_estado_ctto='' then ls_estado_ctto='E'
									end if
								end if
							end if
						end if
						if dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)=0 then
							idw_detalle4.reset()
							if gs_conexion	= "Parque El Prado" then
								idw_detalle4.retrieve(1)
							elseif gs_conexion = "Parque La Foresta" then
								idw_detalle4.retrieve(11)
							end if
							idw_detalle7.reset()
							idw_detalle7.insertrow(0)
							idw_detalle.reset()
							idw_detalle.insertrow(0)
							if idw_detalle5.retrieve(ll_cod_parque)=0 then
								idw_detalle5.insertrow(0)
							end if
							if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
								idw_detalle6.insertrow(0)
							end if
							if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
								idw_detalle8.insertrow(0)
							end if
							idw_detalle2.reset()
							idw_detalle2.insertrow(0)
							idw_detalle3.reset()
							idw_detalle3.insertrow(0)
							if idw_detalle4.retrieve(ll_cod_parque)=0 then
								idw_detalle4.insertrow(0)
							end if
							ll_new_ins	= tab_1.tabpage_1.dw_ant_fall.insertrow(0)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'usar_capilla','N')
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'usar_templo','N')
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_alto_impacto',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_titular_fall',1)
							// Juan
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_protocolo_covid',1)
							tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_covid_19',1)
							// fin juan
							tab_1.tabpage_1.dw_ant_fall.accepttext()
							tab_1.tabpage_2.dw_ant_titular.insertrow(0)
							ll_new	= dw_ficha_sepult.insertrow(0)
							dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
							dw_ficha_sepult.setitem(ll_new,'cod_parque',ll_cod_parque)
							dw_ficha_sepult.setitem(ll_new,'sector',ls_sector)
							dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
							dw_ficha_sepult.setitem(ll_new,'sepultura',ls_sepultura)
							dw_ficha_sepult.setitem(ll_new,'fecha_sepultacion',ldt_fecha_sepult)
							dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
							
							if isnull(ls_nom_titular) then ls_nom_titular=''
							if isnull(ls_ap_pat_titular) then ls_ap_pat_titular=''
							if isnull(ls_ap_mat_titular) then ls_ap_mat_titular=''
							if ll_numero = 90000000 then
								messagebox("Advertencia","No es posible Generar Ficha de Sepultación de Fosa Común")
								ll_resp			= 2
								ls_pasa_fosa	= 'S'
							else
								ll_resp			= messagebox("Advertencia","Para Titular " +string(ll_rut_titular,'###,###,###,###,###')+'-'+ls_dv_titular+' '+ls_nom_titular+' '+ls_ap_pat_titular+' '+ls_ap_mat_titular+" No Existe Ficha de Sepultación, desea Ingresarla",Exclamation!,YesNo!,2)
							end if
							if ll_resp=1 then
								dw_ficha_sepult.accepttext()
								dw_ficha_sepult.setitem(ll_new,'c_estado_reg','S')
								dw_ficha_sepult.setitem(ll_new,'sw_condolencia',1)
								dw_ficha_sepult.setitem(ll_new,'sw_pregrabado',1)
								dw_ficha_sepult.setitem(ll_new,'sw_tipo_ficha',1)
								dw_ficha_sepult.setitem(ll_new,'sw_protocolo_covid',1)
								dw_ficha_sepult.setitem(ll_new,'sw_covid_19',1)
								dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
								dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
								dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
								dw_ficha_sepult.setitem(ll_new,'estado_reg','P')
								dw_ficha_sepult.setitem(ll_new,'correlativo_interno',1)
								dw_ficha_sepult.setitem(ll_new,'estado_responso','N')
								SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
								ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
								ll_hora_hoy					= long(string(gdt_fec_sistema,'hh'))
								ll_minutos_hoy				= long(string(gdt_fec_sistema,'mm'))
								dw_ficha_sepult.setitem(ll_new,'fecha_recepcion',ldt_fecha_hoy)
								dw_ficha_sepult.setitem(ll_new,'hora_recepcion',ll_hora_hoy)
								dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',ll_minutos_hoy)
								dw_ficha_sepult.setitem(ll_new,'base',ls_base)
								dw_ficha_sepult.setitem(ll_new,'serie',ls_serie)
								dw_ficha_sepult.setitem(ll_new,'numero',ll_numero)
								dw_ficha_sepult.setitem(ll_new,'capacidad',il_capacidad)
								if idw_detalle7.retrieve(il_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
									idw_detalle7.insertrow(0)
								end if
								
								dw_ficha_sepult.setitem(ll_new,'estado_credito',ll_mora_cred)
								dw_ficha_sepult.setitem(ll_new,'estado_mantencion',ll_mora_mant)
								dw_ficha_sepult.setitem(ll_new,'numero_tecnico',is_nro_tecnico)//ls_nro_tecnico)
								dw_ficha_sepult.setitem(ll_new,'cod_estado_contrato',ls_estado_ctto)
								dw_ficha_sepult.setitem(ll_new,'cantidad_sepultados',ll_count_fall)
								dw_ficha_sepult.setitem(ll_new,'capacidad_libre_sepultura',il_capacidad - ll_count_fall)
								dw_ficha_sepult.accepttext()
								if (il_capacidad - ll_count_fall)=0 then
									dw_ficha_sepult.setitem(ll_new,'estado_sepultura_completa','S')
								else
									dw_ficha_sepult.setitem(ll_new,'estado_sepultura_completa','N')
								end if
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular',ll_rut_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular',ls_dv_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular',ls_nom_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular',ls_ap_pat_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular',ls_ap_mat_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular',ls_cod_tipo_via)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular',ls_direccion_p)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular',ls_nro_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular',ls_depto_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular',ls_block_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'poblacion_villa_titular',ls_pob_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'sector_titular',ls_sector_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular',ls_ciudad_part)
								if idw_detalle3.retrieve(ls_ciudad_part)=0 then
									idw_detalle3.insertrow(0)
								end if
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular',ls_comuna_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular',ls_fono_part)
								tab_1.tabpage_2.dw_ant_titular.setitem(tab_1.tabpage_2.dw_ant_titular.getrow(),'celular_titular',ls_cel_part)
								dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato',ldt_fecha_ctto)
								
								tab_1.tabpage_2.dw_ant_titular.enabled		= true
								tab_1.tabpage_1.dw_ant_fall.enabled			= true
								tab_1.tabpage_4.dw_aranceles.enabled		= true
								dw_ficha_sepult.setfocus()
								dw_ficha_sepult.setcolumn('hora')
							else
								dw_ficha_sepult.reset()
								tab_1.tabpage_2.dw_ant_titular.reset()
								tab_1.tabpage_1.dw_ant_fall.reset()
								tab_1.tabpage_4.dw_aranceles.reset()
								idw_detalle.reset()
								idw_detalle.insertrow(0)
								idw_detalle2.reset()
								idw_detalle2.insertrow(0)
								idw_detalle3.reset()
								idw_detalle3.insertrow(0)
								idw_detalle5.reset()
								idw_detalle5.insertrow(0)
								idw_detalle6.reset()
								idw_detalle6.insertrow(0)
								idw_detalle7.reset()
								idw_detalle7.insertrow(0)
								idw_detalle8.reset()
								idw_detalle8.insertrow(0)
								idw_detalle4.reset()
								idw_detalle4.insertrow(0)
								ll_new												= dw_ficha_sepult.insertrow(0)
								dw_ficha_sepult.setitem(ll_new,'c_estado_reg','N')
								dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
								dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
								dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
								dw_ficha_sepult.setitem(ll_new,'sw_protocolo_covid',1)
								dw_ficha_sepult.setitem(ll_new,'sw_covid_19',1)
								dw_ficha_sepult.setitem(ll_new,'sw_pregrabado',1)
								dw_ficha_sepult.scrolltorow(dw_ficha_sepult.rowcount())
								dw_ficha_sepult.setfocus()
								dw_ficha_sepult.setcolumn('cod_parque')
								tab_1.tabpage_2.dw_ant_titular.InsertRow(0)
								ll_new_ins	= tab_1.tabpage_1.dw_ant_fall.InsertRow(0)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_titular_fall',1)
								tab_1.tabpage_1.dw_ant_fall.accepttext()
								ll_new_arancel										= tab_1.tabpage_4.dw_aranceles.InsertRow(0)
								wf_setear_arancel_sw(ll_new_arancel)
								tab_1.tabpage_2.dw_ant_titular.enabled		= false
								tab_1.tabpage_1.dw_ant_fall.enabled			= false
								tab_1.tabpage_4.dw_aranceles.enabled		= false
							end if
						else
							if tab_1.tabpage_2.dw_ant_titular.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)>0 then
								ls_ciu_tit	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
								if idw_detalle3.retrieve(ls_ciu_tit)=0 then
									idw_detalle3.insertrow(0)
								end if
							end if
							tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
							tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
							
							if isnull(ls_nom_titular) then ls_nom_titular=''
							if isnull(ls_ap_pat_titular) then ls_ap_pat_titular=''
							if isnull(ls_ap_mat_titular) then ls_ap_mat_titular=''
							
							ll_resp		= messagebox("Advertencia","Para Titular " +string(ll_rut_titular,'###,###,###,###,###')+'-'+ls_dv_titular+' '+ls_nom_titular+' '+ls_ap_pat_titular+' '+ls_ap_mat_titular+ ", desea Crear OTRA Ficha de Sepultación",Exclamation!,YesNo!,2)
							if ll_resp=1 then
								dw_ficha_sepult.accepttext()
								ls_cod_ejecutivo  = dw_ficha_sepult.getitemstring(1,'codigo_ejecutivo')
								ll_cod_parque		= dw_ficha_sepult.getitemnumber(1,'cod_parque')
								ls_sector				= dw_ficha_sepult.getitemstring(1,'sector')
								ls_sepultura			= dw_ficha_sepult.getitemstring(1,'sepultura')
								ldt_fecha_sepult	= dw_ficha_sepult.getitemdatetime(1,'fecha_sepultacion')
								ls_base           		= dw_ficha_sepult.getitemstring(1,'base')
								ls_serie				= dw_ficha_sepult.getitemstring(1,'serie')
								ll_numero         	= dw_ficha_sepult.getitemnumber(1,'numero')
								ldt_fecha_ctto		= dw_ficha_sepult.getitemDateTime(1,'fecha_contrato')
								ls_estado_ctto 		= dw_ficha_sepult.getitemstring(1,'cod_estado_contrato')
								ls_nro_tecnico    	= dw_ficha_sepult.getitemstring(1,'numero_tecnico')
								ll_capacidad  		= dw_ficha_sepult.getitemnumber(1,'capacidad')
								ll_mora_cred		= dw_ficha_sepult.getitemnumber(1,'estado_credito')
								ls_obs_credito		= dw_ficha_sepult.getitemstring(1,'observacion_credito')
								ll_mora_mant      	= dw_ficha_sepult.getitemnumber(1,'estado_mantencion')
								ls_obs_mantencion = dw_ficha_sepult.getitemstring(1,'observacion_mantencion')
								ldt_fecha_recep	= dw_ficha_sepult.getitemdatetime(1,'fecha_recepcion')
								ll_hora_recep		= dw_ficha_sepult.getitemnumber(1,'hora_recepcion')
								ll_minuto_recep	= dw_ficha_sepult.getitemnumber(1,'minuto_recepcion')
								ll_hora_lleg_efec	= dw_ficha_sepult.getitemnumber(1,'hora_llegada_efectiva')
								ll_minu_lleg_efec	= dw_ficha_sepult.getitemnumber(1,'minuto_llegada_efectiva')
								ls_vd_estadistico	= dw_ficha_sepult.getitemstring(1,'vb_estadistico')
								if idw_detalle.retrieve(ls_base)=0 then
									idw_detalle.insertrow(0)
								end if
								if idw_detalle7.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then
									idw_detalle7.insertrow(0)
								end if
								if idw_detalle5.retrieve(ll_cod_parque)=0 then
									idw_detalle5.insertrow(0)
								end if
								if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
									idw_detalle6.insertrow(0)
								end if
								if idw_detalle8.retrieve(ll_cod_parque,ls_sector,ls_sepultura)=0 then
									idw_detalle8.insertrow(0)
								end if
								ll_new	= dw_ficha_sepult.insertrow(0)
								dw_ficha_sepult.scrolltorow(dw_ficha_sepult.rowcount())
								dw_ficha_sepult.setitem(ll_new,'sw_pase_sepultacion',1)
								dw_ficha_sepult.setitem(ll_new,'sw_condolencia',1)
								dw_ficha_sepult.setitem(ll_new,'sw_pregrabado',1)
								dw_ficha_sepult.setitem(ll_new,'sw_tipo_ficha',1)
								dw_ficha_sepult.setitem(ll_new,'sw_protocolo_covid',1)
								dw_ficha_sepult.setitem(ll_new,'sw_covid_19',1)
								dw_ficha_sepult.setitem(ll_new,'sw_dato_funeraria',1)
								dw_ficha_sepult.setitem(ll_new,'sw_titular_fall',1)
								dw_ficha_sepult.setitem(ll_new,'c_estadistico',is_usuario_esta)
								dw_ficha_sepult.setitem(ll_new,'codigo_ejecutivo',gs_user)
								dw_ficha_sepult.setitem(ll_new,'c_estado_reg','S')
								dw_ficha_sepult.setitem(ll_new,'estado_reg','P')
								dw_ficha_sepult.setitem(ll_new,'fecha_sepultacion',ldt_fecha_sepult)
								dw_ficha_sepult.setitem(ll_new,'sector',ls_sector)
								dw_ficha_sepult.setitem(ll_new,'sepultura',ls_sepultura)
								dw_ficha_sepult.setitem(ll_new,'cod_parque',ll_cod_parque)
								dw_ficha_sepult.setitem(ll_new,'estado_responso','N')
								dw_ficha_sepult.setitem(ll_new,'correlativo_interno',dw_ficha_sepult.rowcount())
								dw_ficha_sepult.setitem(ll_new,'base',ls_base)
								dw_ficha_sepult.setitem(ll_new,'serie',ls_serie)
								dw_ficha_sepult.setitem(ll_new,'numero',ll_numero)
								dw_ficha_sepult.setitem(ll_new,'fecha_contrato',ldt_fecha_ctto)
								dw_ficha_sepult.setitem(ll_new,'cod_estado_contrato',ls_estado_ctto)
								dw_ficha_sepult.setitem(ll_new,'numero_tecnico',ls_nro_tecnico)
								dw_ficha_sepult.setitem(ll_new,'capacidad',ll_capacidad)
								dw_ficha_sepult.setitem(ll_new,'estado_credito',ll_mora_cred)
								dw_ficha_sepult.setitem(ll_new,'observacion_credito',ls_obs_credito)
								dw_ficha_sepult.setitem(ll_new,'estado_mantencion',ll_mora_mant)
								dw_ficha_sepult.setitem(ll_new,'observacion_mantencion',ls_obs_mantencion)
								dw_ficha_sepult.setitem(ll_new,'fecha_recepcion',ldt_fecha_recep)
								dw_ficha_sepult.setitem(ll_new,'hora_recepcion',ll_hora_recep)
								dw_ficha_sepult.setitem(ll_new,'minuto_recepcion',ll_minuto_recep)
								dw_ficha_sepult.setitem(ll_new,'hora_llegada_efectiva',ll_hora_lleg_efec)
								dw_ficha_sepult.setitem(ll_new,'minuto_llegada_efectiva',ll_minu_lleg_efec)
								dw_ficha_sepult.setitem(ll_new,'vb_estadistico',ls_vd_estadistico)
								idw_detalle2.reset()
								idw_detalle2.insertrow(0)
								ll_new_ins		= tab_1.tabpage_1.dw_ant_fall.insertrow(0)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_titular_fall',1)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'usar_capilla','N')
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'usar_templo','N')
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_alto_impacto',1)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_protocolo_covid',1)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sw_covid_19',1)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'correlativo_interno',tab_1.tabpage_1.dw_ant_fall.rowcount())
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'fecha_sepultacion',ldt_fecha_sepult)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sector',ls_sector)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'sepultura',ls_sepultura)
								tab_1.tabpage_1.dw_ant_fall.setitem(ll_new_ins,'cod_parque',ll_cod_parque)
								tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
								if idw_detalle4.retrieve(ll_cod_parque)=0 then
									idw_detalle4.insertrow(0)
								end if
								tab_1.tabpage_1.dw_ant_fall.accepttext()
								ll_new_arancel								= tab_1.tabpage_4.dw_aranceles.insertrow(0)
								wf_setear_arancel_sw(ll_new_arancel)
								tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'correlativo_interno',tab_1.tabpage_4.dw_aranceles.rowcount())
								tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'fecha_sepultacion',ldt_fecha_sepult)
								tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sector',ls_sector)
								tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'sepultura',ls_sepultura)
								tab_1.tabpage_4.dw_aranceles.setitem(ll_new,'cod_parque',ll_cod_parque)
								tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
								tab_1.tabpage_2.dw_ant_titular.enabled		= true
								tab_1.tabpage_1.dw_ant_fall.enabled			= true
								tab_1.tabpage_4.dw_aranceles.enabled		= true
								dw_ficha_sepult.accepttext()

								tab_1.tabpage_2.dw_ant_titular.accepttext()
								ll_rut_titular			= tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular')
								ls_dv_titular			= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'dv_titular')
								ls_nombre_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'nombre_titular')
								ls_ap_pat_tit  		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_paterno_titular')
								ls_ap_mat_tit     	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_materno_titular')
								ls_tipo_via_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'tipo_via_titular')
								ls_direc_tit      		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular')
								ls_num_dir_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'num_direccion_titular')
								ls_dpto_dir_tit 		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'depto_direccion_titular')
								ls_block_dir_tit 	 	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'block_direccion_titular')
								ls_pob_villa_tit  	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'poblacion_villa_titular')
								ls_sector_tit			= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'sector_titular')
								ls_cod_ciud_tit		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
								ls_cod_com_tit    	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_comuna_titular')
								ls_fono_titular   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'fono_titular')
								//-- Juan
								ls_cel_titular   = tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'celular_titular')
								ls_nombre_contac	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'nombre_contacto')
								ls_dire_contac   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_contacto')
								ls_fono_contac   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'fono_contacto')
								ls_cel_contac   		= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'celular_contacto')
								ls_email_contac   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'email_contacto')
								//-- fin juan
								if idw_detalle3.retrieve(ls_cod_ciud_tit)=0 then
									idw_detalle3.insertrow(0)
								end if
								ll_new_1	= tab_1.tabpage_2.dw_ant_titular.insertrow(0)
								tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'correlativo_interno',tab_1.tabpage_2.dw_ant_titular.rowcount())
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'rut_titular',ll_rut_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'dv_titular',ls_dv_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'nombre_titular',ls_nombre_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'ap_paterno_titular',ls_ap_pat_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'ap_materno_titular',ls_ap_mat_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'tipo_via_titular',ls_tipo_via_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'direccion_titular',ls_direc_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'num_direccion_titular',ls_num_dir_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'depto_direccion_titular',ls_dpto_dir_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'block_direccion_titular',ls_block_dir_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'poblacion_villa_titular',ls_pob_villa_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'sector_titular',ls_sector_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'codigo_ciudad_titular',ls_cod_ciud_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'codigo_comuna_titular',ls_cod_com_tit)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'fono_titular',ls_fono_titular)
								//-- Juan
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'celular_titular',ls_cel_titular)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'nombre_contacto',ls_nombre_contac)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'direccion_contacto',ls_dire_contac)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'fono_contacto',ls_fono_contac)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'celular_contacto',ls_cel_contac)
								tab_1.tabpage_2.dw_ant_titular.setitem(ll_new_1,'email_contacto',ls_email_contac)
								//-- fin juan
								il_count_otro										= tab_1.tabpage_3.dw_ficha_sepult.rowcount()
								tab_1.tabpage_2.dw_ant_titular.scrolltorow(tab_1.tabpage_2.dw_ant_titular.rowcount())
								tab_1.tabpage_1.dw_ant_fall.scrolltorow(tab_1.tabpage_1.dw_ant_fall.rowcount())
								tab_1.tabpage_4.dw_aranceles.scrolltorow(tab_1.tabpage_4.dw_aranceles.rowcount())
								tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
								tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
								tab_1.tabpage_3.dw_ficha_sepult.setfocus()
							else
								tab_1.tabpage_2.dw_ant_titular.enabled		= false
								tab_1.tabpage_1.dw_ant_fall.enabled			= false
								tab_1.tabpage_4.dw_aranceles.enabled		= false
							end if
						end if
					else
						messagebox("Advertencia","Fecha Sepultación Inválida, No debe ser Mayor al "+string(ldt_fecha_fin,'dd/mm/yyyy')+" ni Menor al "+string(ldt_fecha_ini,'dd/mm/yyyy'))
						this.setitem(this.getrow(),'fecha_sepultacion',ldt_nulo)
						this.accepttext()
						this.setcolumn('fecha_sepultacion')
					end if
				end if
				if ls_columna='cod_parque' then 
					if ll_cod_parque>0 then 
						if idw_detalle5.retrieve(ll_cod_parque)=0 then
							idw_detalle5.insertrow(0)
						end if
					end if
				end if
				if ls_columna='sector' then
					if ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' then 
						if idw_detalle6.retrieve(ll_cod_parque,ls_sector)=0 then
							idw_detalle6.insertrow(0)
						end if
					end if
				end if	
				tab_1.tabpage_2.dw_ant_titular.accepttext()
				tab_1.tabpage_1.dw_ant_fall.accepttext()
				tab_1.tabpage_4.dw_aranceles.accepttext()
				
				if not isnull(ll_cod_parque) and not isnull(ls_sector) and not isnull(ls_sepultura) and not isnull(ldt_fecha_sepult) then
					SELECT 	  Count("FOSA_COMUN"."AREA")
					INTO 		  :ll_count_fosa  
					FROM 	  "FOSA_COMUN"  
					WHERE 	( "FOSA_COMUN"."COD_PARQUE" = :ll_cod_parque ) AND  
								( "FOSA_COMUN"."SECTOR" = :ls_sector ) AND  
								( "FOSA_COMUN"."SEPULTURA" = :ls_sepultura )   ;
					if ll_count_fosa > 0 and ls_pasa_fosa='N' then
						messagebox("Advertencia","No es posible Generar Ficha de Sepultación de Fosa Común")
//						ls_string	= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura
//						if isvalid(w_lista_fosa_comun_para_fs) then close(w_lista_fosa_comun_para_fs)
//						openwithparm(w_lista_fosa_comun_para_fs,ls_string)
					end if
				end if
			end if
	
		CASE 'p_2'
			ls_base           = dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'base')
			ls_serie				= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'serie')
			ll_numero         = dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'numero')
			if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
				ls_fecha	= string(date(dw_ficha_sepult.getitemdatetime(dw_ficha_sepult.getrow(),'fecha_contrato')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_contrato',date(ls_fecha))
				END IF
			end if
	
		CASE 'p_3'
			if is_usuario_esta='S' then
				ls_fecha	= string(date(dw_ficha_sepult.getitemdatetime(dw_ficha_sepult.getrow(),'fecha_recepcion')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_recepcion',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_recepcion',date(ls_fecha))
				End if
			end if
	
		CASE 'p_4'
			ls_fecha	= string(date(dw_ficha_sepult.getitemdatetime(dw_ficha_sepult.getrow(),'fecha_pase')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_pase',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ficha_sepult.setitem(dw_ficha_sepult.getrow(),'fecha_pase',date(ls_fecha))
			End if
			ld_fecha				= date(this.getitemdatetime(this.getrow(),'fecha_pase'))
			if not isnull(ld_fecha) then
				ll_anno				= year(ld_fecha)
				this.setitem(this.getrow(),'anno_pase',ll_anno)
			end if
			this.accepttext()
	
		CASE 'p_5'
			ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
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
			WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_cod_parque   ;
			ls_sector				= trim(this.getitemstring(this.getrow(),'sector'))
			ls_sepultura			= trim(this.getitemstring(this.getrow(),'sepultura'))
			ldt_fecha_sepult	= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
			ls_ejecutivo			= this.getitemString(this.getrow(),'codigo_ejecutivo')
			ls_obs				= this.getitemString(this.getrow(),'observacion_sepultura_completa')
			ll_hora_fijada		= this.getitemNumber(this.getrow(),'hora')
			ls_base				= trim(this.getitemstring(this.getrow(),'base'))
			ls_serie				= trim(this.getitemstring(this.getrow(),'serie'))
			ll_numero			= this.getitemNumber(this.getrow(),'numero')
			if isnull( ldt_fecha_sepult ) or  ls_sector ='' or isnull( ls_sector ) or &
				isnull( ls_sepultura ) or  ls_sepultura ='' or  ll_cod_parque =0 or isnull( ll_cod_parque ) then
			else
				ll_minuto_fijado	= this.getitemNumber(this.getrow(),'minutos')
				if isnull(ll_minuto_fijado) then 
					ll_minuto_fijado=0
					this.setitem(this.getrow(),'minutos',ll_minuto_fijado)
					this.accepttext()
				end if
				ls_nombre			= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'nombre_fallecido'))
				ls_ap_pat			= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'ap_paterno_fall'))
				ls_ap_mat			= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'ap_materno_fall'))
				if isnull(ll_cod_parque) or isnull(ls_sector) or isnull(ls_sepultura) or &
					isnull(ldt_fecha_sepult) or isnull(ls_ejecutivo) or isnull(ls_obs) then
					
					if isnull(ll_cod_parque) then
						messagebox("Advertencia","Debe Seleccionar Parque")
						this.setcolumn('cod_parque')
					elseif isnull(ls_sector) then
						messagebox("Advertencia","Debe Seleccionar Sector")
						this.setcolumn('sector')
					elseif isnull(ls_sepultura) then
						messagebox("Advertencia","Debe Seleccionar Sepultura")
						this.setcolumn('sepultura')
					elseif isnull(ldt_fecha_sepult) then
						messagebox("Advertencia","Debe Seleccionar Fecha Sepultación")
						this.setcolumn('fecha_sepultacion')
					elseif isnull(ls_ejecutivo) then
						messagebox("Advertencia","Debe Seleccionar Ejecutivo")
						this.setcolumn('codigo_ejecutivo')
					elseif isnull(ls_obs) then
						messagebox("Advertencia","Debe Ingresar Observación")
						this.setcolumn('observacion_sepultura_completa')
					end if
				else
					if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then
						ls_string	= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura+'~t'+string(ldt_fecha_sepult)+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_ejecutivo+'~t'+ls_obs+'~t'+string(ll_hora_fijada)+'~t'+string(ll_minuto_fijado)+'~t'+'FS'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+'F'
						if isvalid(w_lista_funerales) then close(w_lista_funerales)
						OpenWithParm(w_lista_funerales, ls_string)
					else
						messagebox("Advertencia","Debe Ingresar Antecedente Fallecido")
						tab_1.SelectedTab	= 3
					end if
				end if
			end if
			
	END CHOOSE
 end if
end event

event itemfocuschanged;String		ls_columna,ls_base,ls_serie,ls_nivel,ls_var_nivel,ls_var_cap,ls_var_final,ls_nivel_aux,ls_dv,ls_sector,ls_sepultura,ls_nulo,ls_cod_age_aux,ls_existe_ctto,&
			ls_pasa,ls_pasa1,ls_est_ctto,ls_estado_resp,ls_modif_adm,ls_pasa_ctrol,ls_base_aux,ls_serie_aux,ls_nro_tecnico
Long		ll_hora,ll_capacidad,ll_pos,ll_rut,ll_hora_fijada,ll_min_fijada,ll_parque_tras,ll_count_sep,ll_count_tras,ll_count_suma,ll_cod_parque,ll_count_reserva,&
			ll_parque_aux,ll_nulo,ll_count_tiene,ll_parque_cons,ll_count_cap,ll_sw_condolencia
datetime	ldt_fec_tras,ldt_nulo,ldt_fecha_ini,ldt_fecha_fin
Date		ld_fecha_sepult,ld_fecha
Double	ll_numero,ll_numero_aux

this.accepttext()
ls_columna				= dwo.name
SetNull(ls_nulo);SetNull(ll_nulo);Setnull(ldt_nulo)
ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
if ll_cod_parque>0 then
	ll_sw_condolencia	= this.getitemnumber(this.getrow(),'sw_condolencia')
	if ll_sw_condolencia = 1 then
		this.setitem(this.getrow(),'cod_maestro_condolencia',ls_nulo)
	end if
	if ls_columna='cod_parque' or ls_columna='sector' or ls_columna='sepultura' or ls_columna='fecha_sepultacion' then
		ll_cod_parque		= this.getitemnumber(this.getrow(),'cod_parque')
		ls_sector			= this.getitemstring(this.getrow(),'sector')
		ls_sepultura		= this.getitemstring(this.getrow(),'sepultura')
		if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_sector) and ls_sector<>'' and &
			not isnull(ls_sepultura) and ls_sepultura<>'' then
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
				this.setitem(this.getrow(),'sector',ls_nulo)
				this.setitem(this.getrow(),'sepultura',ls_nulo)
				idw_detalle6.reset()
				idw_detalle6.insertrow(0)
				this.accepttext()
				this.setcolumn('sector')
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
				end if
				if sqlca.sqlcode=0 then
					if ls_base='O' then
						if ll_numero=10000000 then
							ls_pasa_ctrol		= 'S'
						else
							SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
							INTO 		:ll_parque_aux,				:ls_cod_age_aux  
							FROM 		"CD_FOLIO"  
							WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
									// ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
									 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
							USING		Trans_2;
							if Trans_2.sqlcode=0 then
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
						if ls_est_ctto='V' or ls_est_ctto='C' or ls_est_ctto='R' or ls_est_ctto='S' or sqlca.sqlcode=100 then
						else
							this.setitem(this.getrow(),'sector',ls_nulo)
							this.setitem(this.getrow(),'sepultura',ls_nulo)
							idw_detalle6.reset()
							idw_detalle6.insertrow(0)
							this.accepttext()
							this.setcolumn('sector')
						end if
					end if
				end if
			end if
		else
			if isnull(ll_cod_parque) then
				this.setcolumn('cod_parque')
			elseif isnull(ls_sector) then
				this.setcolumn('sector')
			elseif isnull(ls_sepultura) then
				this.setcolumn('sepultura')
			end if
		end if
	end if
	if ls_columna<>'estado_responso' or ls_columna='estado_responso' then
		ls_estado_resp	= this.getitemstring(this.getrow(),'estado_responso')
		if ls_estado_resp='N' then
			this.setitem(this.getrow(),'rut_diacono',ll_nulo)
		end if
	end if
	
	if ls_columna<>'hora' and ls_columna<>'minutos' then
		ll_hora_fijada	= this.getitemnumber(this.getrow(),'hora')
		ll_min_fijada	= this.getitemnumber(this.getrow(),'minutos')
		ldt_fec_tras		= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
		ll_parque_tras	= this.getitemnumber(this.getrow(),'cod_parque')
		if ll_hora_fijada>0 then
			ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
			if ll_cod_parque>0 then
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
				WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_cod_parque   ;
			end if
			ls_modif_adm		= this.getitemstring(this.getrow(),'modif_adm')
			if ls_modif_adm = 'N' then
				if ll_hora_fijada<il_hora_ini or (ll_hora_fijada=il_hora_ini and ll_min_fijada<il_min_ini) then
					ll_hora_fijada	= 0
					ll_min_fijada	= 0
					this.setitem(this.getrow(),'hora',ll_hora_fijada)
					this.setitem(this.getrow(),'minutos',ll_min_fijada)
				elseif ll_hora_fijada>il_hora_fin or (ll_hora_fijada=il_hora_fin and ll_min_fijada>il_min_fin) then
					ll_hora_fijada	= 0
					ll_min_fijada	= 0
					this.setitem(this.getrow(),'hora',ll_hora_fijada)
					this.setitem(this.getrow(),'minutos',ll_min_fijada)
				end if
				tab_1.tabpage_3.dw_ficha_sepult.Setitem(this.getrow(),'hora_def',ll_hora_fijada)
				tab_1.tabpage_3.dw_ficha_sepult.Setitem(this.getrow(),'minuto_def',ll_min_fijada)
			end if
		end if
	end if
	if ls_columna<>'hora' then
		ll_hora	= this.getitemnumber(this.getrow(),'hora')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 23 then
				this.setitem(this.getrow(),'hora',0)
			end if
		end if
	end if
	if ls_columna<>'minutos' then
		ll_hora	= this.getitemnumber(this.getrow(),'minutos')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 59 then
				this.setitem(this.getrow(),'minutos',0)
				this.setcolumn('minutos')
			else
				if il_intervalo=30 then
					if ll_hora<>0 and ll_hora<>30 then
						this.setitem(this.getrow(),'minutos',0)
						this.setcolumn('minutos')
					end if
				elseif il_intervalo=15 then
					if ll_hora<>0 and ll_hora<>15 and ll_hora<>30 and ll_hora<>45 then
						this.setitem(this.getrow(),'minutos',0)
						this.setcolumn('minutos')
					end if
				elseif il_intervalo=60 then
					if ll_hora<>0 then
						this.setitem(this.getrow(),'minutos',0)
						this.setcolumn('minutos')
					end if
				end if
			end if
		end if
	end if
	
	if ls_columna <> 'capacidad' then
		ll_capacidad		= dw_ficha_sepult.getitemnumber(this.getrow(),'capacidad')
		ll_cod_parque	= dw_ficha_sepult.getitemnumber(this.getrow(),'cod_parque')
		SELECT	Count("LISTA_PRECIO"."SECTOR")  
		INTO 		:ll_count_cap  
		FROM 	"LISTA_PRECIO"  
		WHERE 	"LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad  and
					"LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque
		USING	sqlca;
		if ll_count_cap=0 then
			ls_base			= dw_ficha_sepult.getitemstring(this.getrow(),'base')
			ls_serie			= dw_ficha_sepult.getitemstring(this.getrow(),'serie')
			ll_numero		= dw_ficha_sepult.getitemnumber(this.getrow(),'numero')
			SELECT	"PAGO_OFERTA"."CAPACIDAD"  
			INTO 		:ll_count_cap  
			FROM 	"CADENA",  	"OFERTA_V", 	"PAGO_OFERTA"  
			WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
						( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						( "CADENA"."CODIGO" = "OFERTA_V"."BASE" ) and  
						( ( "CADENA"."CODIGO" = :ls_base ) AND  
						( "CADENA"."SERIE" = :ls_serie ) AND  
						( "CADENA"."NUMERO" = :ll_numero ) )   
			UNION   
			SELECT 	"CONTRATO"."CAPACIDAD"  
			FROM 	"CADENA", 	"CONTRATO"  
			WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
						( ( "CADENA"."CODIGO" = :ls_base ) AND  
						( "CADENA"."SERIE" = :ls_serie ) AND  
						( "CADENA"."NUMERO" = :ll_numero ) )   ;
			if ll_count_cap = 0 then
				dw_ficha_sepult.setitem(this.getrow(),'capacidad',ll_nulo)
				dw_ficha_sepult.setitem(this.getrow(),'nivel',ls_nulo)
				dw_ficha_sepult.accepttext()
			end if
		end if
	end if
//	if ls_columna='fecha_pase' or ls_columna<>'fecha_pase' then
//		ld_fecha				= date(this.getitemdatetime(this.getrow(),'fecha_pase'))
//		ld_fecha_sepult	= date(this.getitemdatetime(this.getrow(),'fecha_sepultacion'))
//		if ld_fecha > ld_fecha_sepult then
//			this.setitem(this.getrow(),'fecha_pase',ldt_nulo)
//		end if
//		this.accepttext()
//	end if
	if ls_columna<>'hora_recepcion' then
		ll_hora	= this.getitemnumber(this.getrow(),'hora_recepcion')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 23 then
				this.setitem(this.getrow(),'hora_recepcion',0)
			end if
		end if
	end if
	if ls_columna<>'minuto_recepcion' then
		ll_hora	= this.getitemnumber(this.getrow(),'minuto_recepcion')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 59 then
				this.setitem(this.getrow(),'minuto_recepcion',0)
			end if
		end if
	end if
	if ls_columna<>'hora_llegada_efectiva' then
		ll_hora	= this.getitemnumber(this.getrow(),'hora_llegada_efectiva')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 23 then
				this.setitem(this.getrow(),'hora_llegada_efectiva',0)
			end if
		end if
	end if
	if ls_columna<>'minuto_llegada_efectiva' then
		ll_hora	= this.getitemnumber(this.getrow(),'minuto_llegada_efectiva')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 59 then
				this.setitem(this.getrow(),'minuto_llegada_efectiva',0)
			end if
		end if
	end if
	
	if ls_columna<>'fecha_sepultacion' and is_modif	= 'S' then
		ldt_fec_tras	= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
		ldt_fecha_ini	= datetime(RelativeDate(date(gdt_fec_sistema),  - 30))
		ldt_fecha_fin	= datetime(RelativeDate(date(gdt_fec_sistema), 60))
		if ldt_fec_tras < ldt_fecha_ini or ldt_fec_tras > ldt_fecha_fin then
			this.setitem(this.getrow(),'fecha_sepultacion',ldt_nulo)
			this.accepttext()
			this.setcolumn('fecha_sepultacion')
		end if
	end if
	if ls_columna = 'numero_tecnico' or ls_columna = 'nivel' or ls_columna='observacion_sepultura_completa' then
		if not isnull(dw_ficha_sepult.getitemstring(this.getrow(),'nivel')) and dw_ficha_sepult.getitemstring(this.getrow(),'nivel')<>'-' and &
			dw_ficha_sepult.getitemstring(this.getrow(),'nivel')<>'' then
			ls_base			= dw_ficha_sepult.getitemstring(this.getrow(),'base')
			ls_serie			= dw_ficha_sepult.getitemstring(this.getrow(),'serie')
			ll_numero		= dw_ficha_sepult.getitemnumber(this.getrow(),'numero')
			ls_nivel			= trim(this.getitemstring(this.getrow(),'nivel'))
			ll_capacidad		= this.getitemnumber(this.getrow(),'capacidad')
			ll_pos				= Pos(ls_nivel, ".")
			ls_var_nivel		= mid(ls_nivel,ll_pos + 1)
			ll_pos				= Pos(ls_var_nivel, ".")
			ls_var_cap		= mid(ls_var_nivel,ll_pos + 1)
			ls_var_final		= mid(ls_var_nivel,1,ll_pos - 1)
//			if long(ls_var_final) > ll_capacidad then
//				this.setitem(this.getrow(),'nivel',ls_nulo)
//				this.accepttext()
//				this.setcolumn('nivel')
//			else
//				if long(ls_var_cap) <> ll_capacidad and long(ls_var_cap) > ll_capacidad then
//					this.setitem(this.getrow(),'nivel',ls_nulo)
//					this.accepttext()
//					this.setcolumn('nivel')
//				else
//					SELECT	"FICHA_SEPULTACION"."NIVEL"  
//					INTO 		:ls_nivel_aux  
//					FROM 		"FICHA_SEPULTACION"  
//					WHERE  ( "FICHA_SEPULTACION"."BASE" = :ls_base ) AND  
//							 ( "FICHA_SEPULTACION"."SERIE" = :ls_serie ) AND  
//							 ( "FICHA_SEPULTACION"."NUMERO" = :ll_numero ) AND
//							 ( "FICHA_SEPULTACION"."NIVEL"  = :ls_nivel )
//					USING		sqlca;
//					if sqlca.sqlcode=0 then
//						if not isnull(this.getitemstring(this.getrow(),'c_existe_ctto')) then
//							this.setitem(this.getrow(),'nivel',ls_nulo)
//							this.accepttext()
//							this.setcolumn('nivel')
//						end if
//					end if
//				end if
//			end if
		end if
	end if
	if ls_columna<>'base' and ls_columna<>'serie' and ls_columna<>'numero' then
		ls_base			= dw_ficha_sepult.getitemstring(this.getrow(),'base')
		ls_serie			= dw_ficha_sepult.getitemstring(this.getrow(),'serie')
		ll_numero		= dw_ficha_sepult.getitemnumber(this.getrow(),'numero')
		ls_existe_ctto	= dw_ficha_sepult.getitemstring(this.getrow(),'c_existe_ctto')
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and &
			not isnull(ll_numero) and ll_numero>0 and ls_existe_ctto='N' then
			SELECT	"CD_FOLIO"."COD_PARQUE",	"CD_FOLIO"."COD_AGENTE"  
			INTO 		:ll_parque_aux,				:ls_cod_age_aux  
			FROM 		"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
					 //( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
			USING		Trans_2;
			if Trans_2.sqlcode=0 then
				if isnull(ls_cod_age_aux) or ls_cod_age_aux='' then
//					dw_ficha_sepult.Setitem(this.getrow(),'numero',ll_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'cod_estado_contrato',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'capacidad',ll_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'nivel',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'numero_tecnico',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'cantidad_sepultados',ll_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'estado_sepultura_completa',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'capacidad_libre_sepultura',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'estado_credito',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'estado_mantencion',ll_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'observacion_credito',ls_nulo)
//					dw_ficha_sepult.Setitem(this.getrow(),'observacion_mantencion',ls_nulo)
//					dw_ficha_sepult.accepttext()
//					dw_ficha_sepult.setcolumn('numero')
				end if
			else
				dw_ficha_sepult.Setitem(this.getrow(),'numero',ll_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'cod_estado_contrato',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'capacidad',ll_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'nivel',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'numero_tecnico',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'cantidad_sepultados',ll_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'estado_sepultura_completa',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'capacidad_libre_sepultura',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'estado_credito',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'estado_mantencion',ll_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'observacion_credito',ls_nulo)
				dw_ficha_sepult.Setitem(this.getrow(),'observacion_mantencion',ls_nulo)
				dw_ficha_sepult.accepttext()
				dw_ficha_sepult.setcolumn('numero')
			end if
		end if
		ll_parque_cons	= dw_ficha_sepult.getitemnumber(dw_ficha_sepult.getrow(),'cod_parque')
		ls_sector		= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'sector')
		ls_sepultura	= dw_ficha_sepult.getitemstring(dw_ficha_sepult.getrow(),'sepultura')
		if ll_numero > 0 and ll_parque_cons > 0 and not isnull(ls_sepultura) and not isnull(ls_sector) then		//
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
					SELECT	"INVENTARIO_PLANI_CONST"."NUMERO_TEC"  
					INTO 		:ls_nro_tecnico  
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
							ls_pasa	= 'N'
							tab_1.tabpage_3.dw_ficha_sepult.setitem(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero',ll_nulo)
							tab_1.tabpage_3.dw_ficha_sepult.accepttext()
							tab_1.tabpage_3.dw_ficha_sepult.setfocus()
							tab_1.tabpage_3.dw_ficha_sepult.setcolumn('numero')
						end if
					end if
				else
					ls_pasa			= 'S'
				end if
			end if
		end if
	end if
//	if is_nuevo	= 'S' and (ls_columna='hora' or ls_columna='fecha_sepultacion') then
//		tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(tab_1.tabpage_3.dw_ficha_sepult.rowcount())
//		tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
//		tab_1.tabpage_3.dw_ficha_sepult.setfocus()
//		is_nuevo	= 'N'
////		cb_volver.triggerevent(getfocus!)
//	end if
end if
end event

event doubleclicked;String	ls_columna,ls_fecha,ls_mes
Long		ll_row,ll_dia,ll_mes,ll_anno
Datetime	ldt_fec_sepult

ls_columna			= dwo.name
if ls_columna='t_4' then //or ls_columna='hora' or ls_columna='t_5' or ls_columna='minutos'
	ll_row			= this.getrow()
	ldt_fec_sepult	= this.getitemdatetime(ll_row,'fecha_sepultacion')
	ll_dia			= day(date(ldt_fec_sepult))
	ll_mes			= month(date(ldt_fec_sepult))
	ll_anno			= year(date(ldt_fec_sepult))
	ls_fecha			= string(ll_dia)
	CHOOSE CASE ll_mes
		CASE 1
			ls_mes	= ' ENERO '
		CASE 2
			ls_mes	= ' FEBRERO '
		CASE 3
			ls_mes	= ' MARZO '
		CASE 4
			ls_mes	= ' ABRIL '
		CASE 5
			ls_mes	= ' MAYO '
		CASE 6
			ls_mes	= ' JUNIO '
		CASE 7
			ls_mes	= ' JULIO '
		CASE 8
			ls_mes	= ' AGOSTO '
		CASE 9
			ls_mes	= ' SEPTIEMBRE '
		CASE 10
			ls_mes	= ' OCTUBRE '
		CASE 11
			ls_mes	= ' NOVIEMBRE '
		CASE 12
			ls_mes	= ' DICIEMBRE '
	END CHOOSE
	ls_fecha			= ls_fecha+ls_mes+' '+string(ll_anno)
	if isvalid(w_lista_obituario) then close(w_lista_obituario)
	OpenWithParm(w_lista_obituario, ls_fecha)
end if
end event

event rowfocuschanged;Long	ll_row
ll_row	= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3717
integer height = 2300
long backcolor = 67108864
string text = "  Antecedente Titular"
long tabtextcolor = 33554432
string picturename = "Custom076!"
long picturemaskcolor = 536870912
st_2 st_2
dw_ant_titular dw_ant_titular
end type

on tabpage_2.create
this.st_2=create st_2
this.dw_ant_titular=create dw_ant_titular
this.Control[]={this.st_2,&
this.dw_ant_titular}
end on

on tabpage_2.destroy
destroy(this.st_2)
destroy(this.dw_ant_titular)
end on

type st_2 from statictext within tabpage_2
integer x = 87
integer y = 40
integer width = 2098
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedentes del Titular"
boolean focusrectangle = false
end type

type dw_ant_titular from datawindow within tabpage_2
integer x = 78
integer y = 160
integer width = 3561
integer height = 2016
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_antecedente_titular_ficha"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_ciudad,ls_dv,ls_fono_p,ls_pasa_p,ls_pasa_letras,ls_celu,ls_email_contacto,ls_nulo,ls_dv_tercero,ls_email_pagador,ls_email_tercero,ls_email_titular,&
		ls_dire_contac,ls_cel_ter,ls_fono_contac,ls_cel_contac,ls_email_contac,ls_parentesco_contac
long  	ll_rut,ll_new,ll_fono_p_largo,ll_cel_largo,ll_rut_tercero,ll_sw_tercero,ll_fila,ll_res

this.accepttext()
ls_columna		= dwo.name
if ls_columna='codigo_ciudad_titular' then
	ls_ciudad	= this.getitemstring(this.getrow(),'codigo_ciudad_titular')
	idw_detalle3.retrieve(ls_ciudad)
end if

this.accepttext()

if ls_columna='rut_titular' or ls_columna='dv_titular' then
	ll_new				= this.getrow()
	ll_rut				= this.getitemnumber(this.getrow(),'rut_titular')
	ls_dv					= this.getitemstring(this.getrow(),'dv_titular')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			Setnull(ls_dv)
//			dw_ant_titular.reset()
//			ll_new	= dw_ant_titular.insertrow(0)
			dw_ant_titular.scrolltorow(ll_new)
			dw_ant_titular.setitem(ll_new,'dv_fallecido',ls_dv)
			this.accepttext()
			dw_ant_titular.setfocus()
			dw_ant_titular.setcolumn('dv_fallecido')
		end if 
	end if
end if
if ls_columna = 'fono_contacto' then
	ll_new					= this.getrow()
	ls_fono_p				= this.getitemstring(ll_new,'fono_contacto')
	ll_fono_p_largo			= len(ls_fono_p)
	if ll_fono_p_largo > 0 and ls_fono_p <> '-' and ls_fono_p <>'' and not isnull(ls_fono_p) then 
		if ls_fono_p <> '' and ls_fono_p <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'fono_contacto')
			if ls_pasa_p='N' then
				dw_ant_titular.scrolltorow(ll_new)
				messagebox('Advertencia','Telefono de Contacto debe tener 9 Digitos',stopsign!)
				this.setitem(ll_new,'fono_contacto','')
				this.setfocus()
				this.setcolumn('fono_contacto')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_fono_p,'fono_contacto')
				if ls_pasa_letras = 'N' then
					this.scrolltorow(ll_new)
					messagebox('Advertencia','Ingrese solo números',stopsign!)
					this.setitem(ll_new,'fono_contacto',ls_nulo)
					this.accepttext()
					this.setfocus()
					this.setcolumn('fono_contacto')	
				end if	
			end if
		end if
	end if
end if
if ls_columna = 'celular_contacto' then
	ll_new					= this.getrow()
	ls_fono_p				= this.getitemstring(ll_new,'celular_contacto')
	ll_fono_p_largo			= len(ls_fono_p)
	if ll_fono_p_largo > 0 and ls_fono_p <> '-' and ls_fono_p <>'' and not isnull(ls_fono_p) then 
		if ls_fono_p <> '' and ls_fono_p <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular_contacto')
			if ls_pasa_p='N' then
				dw_ant_titular.scrolltorow(ll_new)
				messagebox('Advertencia','Celular de Contacto debe tener 9 Digitos',stopsign!)
				this.setitem(ll_new,'celular_contacto','')
				this.setfocus()
				this.setcolumn('fono_contacto')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_fono_p,'celular_contacto')
				if ls_pasa_letras = 'N' then
					this.scrolltorow(ll_new)
					messagebox('Advertencia','Ingrese solo números',stopsign!)
					this.setitem(ll_new,'celular_contacto','')
					this.accepttext()
					this.setfocus()
					this.setcolumn('celular_contacto')
				end if	
			end if
		end if
	end if
end if
if ls_columna = 'fono_tercero' then
	ll_new					= this.getrow()
	ls_fono_p				= this.getitemstring(ll_new,'fono_tercero')
	ll_fono_p_largo			= len(ls_fono_p)
	if ll_fono_p_largo > 0 and ls_fono_p <> '-' and ls_fono_p <>'' and not isnull(ls_fono_p) then 
		if ls_fono_p <> '' and ls_fono_p <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'fono_tercero')
			if ls_pasa_p='N' then
				dw_ant_titular.scrolltorow(ll_new)
				messagebox('Advertencia','Telefono de Tercero debe tener 9 Digitos',stopsign!)
				this.setitem(ll_new,'fono_tercero','')
				this.setfocus()
				this.setcolumn('fono_tercero')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_fono_p,'fono_tercero')
				if ls_pasa_letras = 'N' then
					this.scrolltorow(ll_new)
					messagebox('Advertencia','Ingrese solo números',stopsign!)
					this.setitem(ll_new,'fono_tercero',ls_nulo)
					this.accepttext()
					this.setfocus()
					this.setcolumn('fono_tercero')	
				end if	
			end if
		end if
	end if
end if
if ls_columna = 'celular_tercero' then
	ll_new					= this.getrow()
	ls_fono_p				= this.getitemstring(ll_new,'celular_tercero')
	ll_fono_p_largo			= len(ls_fono_p)
	if ll_fono_p_largo > 0 and ls_fono_p <> '-' and ls_fono_p <>'' and not isnull(ls_fono_p) then 
		if ls_fono_p <> '' and ls_fono_p <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular_contacto')
			if ls_pasa_p='N' then
				dw_ant_titular.scrolltorow(ll_new)
				messagebox('Advertencia','Celular de Tercero debe tener 9 Digitos',stopsign!)
				this.setitem(ll_new,'celular_tercero','')
				this.setfocus()
				this.setcolumn('celular_tercero')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_fono_p,'celular_contacto')
				if ls_pasa_letras = 'N' then
					this.scrolltorow(ll_new)
					messagebox('Advertencia','Ingrese solo números',stopsign!)
					this.setitem(ll_new,'celular_tercero','')
					this.accepttext()
					this.setfocus()
					this.setcolumn('celular_tercero')
				end if	
			end if
		end if
	end if
end if
////this.accepttext()
//
if ls_columna='rut_titular' or ls_columna='dv_titular' then
	ll_new				= this.getrow()
	ll_rut					= this.getitemnumber(this.getrow(),'rut_titular')
	ls_dv					= this.getitemstring(this.getrow(),'dv_titular')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			Setnull(ls_dv)
//			dw_ant_titular.reset()
//			ll_new	= dw_ant_titular.insertrow(0)
			dw_ant_titular.scrolltorow(ll_new)
			dw_ant_titular.setitem(ll_new,'dv_fallecido',ls_dv)
			this.accepttext()
			dw_ant_titular.setfocus()
			dw_ant_titular.setcolumn('dv_fallecido')
		end if 
	end if
end if

if ls_columna='rut_tercero' or ls_columna='dv_tercero' then
	ll_new				= tab_1.tabpage_2.dw_ant_titular.getrow()
	ll_rut_tercero					= tab_1.tabpage_2.dw_ant_titular.getitemnumber(this.getrow(),'rut_tercero')
	ls_dv_tercero					= tab_1.tabpage_2.dw_ant_titular.getitemstring(this.getrow(),'dv_tercero')
	if ll_rut_tercero>0 and ls_dv_tercero<>'' and not isnull(ls_dv_tercero) then
		if String(ls_dv_tercero) <> String(gf_obtener_dv(ll_rut_tercero)) then
			messagebox('Error','El Rut Tercero no es Válido',stopsign!)
			 tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
			 tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'dv_tercero',ls_nulo)
			 tab_1.tabpage_2.dw_ant_titular.accepttext()
			 tab_1.tabpage_2.dw_ant_titular.setfocus()
			 tab_1.tabpage_2.dw_ant_titular.setcolumn('dv_tercero')
		end if 
	end if
end if

if ls_columna = 'email_pagador' then
	ll_new				= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_email_pagador	= tab_1.tabpage_2.dw_ant_titular.getitemstring(this.getrow(),'email_pagador')
	if ls_email_pagador <> '' and ls_email_pagador <> '-' then
		if Match(ls_email_pagador, "@") then
		else
			messagebox('Error','El E-Mail Pagador no es Válido',stopsign!)
			Setnull(ls_email_pagador)
			tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'email_pagador',ls_email_pagador)
			tab_1.tabpage_2.dw_ant_titular.accepttext()
			tab_1.tabpage_2.dw_ant_titular.setfocus()
			tab_1.tabpage_2.dw_ant_titular.setcolumn('email_pagador')
		end if	
	end if	
end if


if ls_columna = 'email_contacto' then
	ll_new				= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_email_contacto	= tab_1.tabpage_2.dw_ant_titular.getitemstring(this.getrow(),'email_contacto')
	if ls_email_contacto <> '' and ls_email_contacto <> '-' then
		if Match(ls_email_contacto, "@") then
		else
			messagebox('Error','El E-Mail Contacto no es Válido',stopsign!)
			Setnull(ls_email_contacto)
			tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'email_contacto',ls_email_contacto)
			tab_1.tabpage_2.dw_ant_titular.accepttext()
			tab_1.tabpage_2.dw_ant_titular.setfocus()
			tab_1.tabpage_2.dw_ant_titular.setcolumn('email_contacto')
		end if	
	end if	
end if

if ls_columna = 'email_tercero' then
	ll_new				= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_email_tercero	= tab_1.tabpage_2.dw_ant_titular.getitemstring(this.getrow(),'email_tercero')
	if ls_email_tercero <> '' and ls_email_tercero <> '-' then
		if Match(ls_email_tercero, "@") then
		else
			messagebox('Error','El E-Mail Tercero no es Válido',stopsign!)
			Setnull(ls_email_tercero)
			tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'email_tercero',ls_email_tercero)
			tab_1.tabpage_2.dw_ant_titular.accepttext()
			tab_1.tabpage_2.dw_ant_titular.setfocus()
			tab_1.tabpage_2.dw_ant_titular.setcolumn('email_tercero')
		end if	
	end if	
end if

if ls_columna = 'email_titular' then
	ll_new				= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_email_titular		= tab_1.tabpage_2.dw_ant_titular.getitemstring(this.getrow(),'email_titular')
	if ls_email_titular <> '' and ls_email_titular <> '-' then
		if Match(ls_email_titular, "@") then
		else
			messagebox('Error','El E-Mail Titular no es Válido',stopsign!)
			Setnull(ls_email_titular)
			tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'email_titular',ls_email_titular)
			tab_1.tabpage_2.dw_ant_titular.accepttext()
			tab_1.tabpage_2.dw_ant_titular.setfocus()
			tab_1.tabpage_2.dw_ant_titular.setcolumn('email_titular')
		end if	
	end if	
end if
if ls_columna = 'sw_tercero' then
	ll_sw_tercero		= long(data)
	ll_fila					= tab_1.tabpage_2.dw_ant_titular.getrow()
	if ll_sw_tercero=0 then
		this.setitem(this.getrow(),'sw_tercero',0)
		this.accepttext()
		ll_res			= messagebox("Advertencia","Está Seguro COPIAR Antecedentes de Contacto",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ls_dire_contac   			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_fila,'direccion_contacto')
			ls_fono_contac   			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_fila,'fono_contacto')
			ls_cel_contac   				= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_fila,'celular_contacto')
			ls_email_contac   			= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_fila,'email_contacto')
			ls_parentesco_contac   	= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_fila,'parentesco_contacto')
			
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_fila,'email_tercero',ls_email_contac)
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_fila,'direccion_tercero',ls_dire_contac)
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_fila,'fono_tercero',ls_fono_contac)
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_fila,'celular_tercero',ls_cel_contac)
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_fila,'parentesco_tercero',ls_parentesco_contac)
			this.accepttext()
		else
			ll_res			= messagebox("Advertencia","Está Seguro de BORRAR Antecedentes del Fallecido",Exclamation!,YesNo!,2)
			if ll_res=1 then	
				tab_1.tabpage_2.dw_ant_titular.setitem(ll_fila,'email_tercero',ls_nulo)
				tab_1.tabpage_2.dw_ant_titular.setitem(ll_fila,'direccion_tercero',ls_nulo)
				tab_1.tabpage_2.dw_ant_titular.setitem(ll_fila,'fono_tercero',ls_nulo)
				tab_1.tabpage_2.dw_ant_titular.setitem(ll_fila,'celular_tercero',ls_nulo)
				tab_1.tabpage_2.dw_ant_titular.setitem(ll_fila,'parentesco_tercero',ls_nulo)
			end if		
		end if
	else
		this.setitem(this.getrow(),'sw_tercero',1)
		this.accepttext()
	end if	
end if
this.accepttext()
end event

event rowfocuschanged;Long	ll_row
ll_row	= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

event clicked;Long	ll_row
ll_row						= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

event itemfocuschanged;string ls_fono_p,ls_pasa_p,ls_nulo,ls_pasa_letras,ls_celu,ls_columna,ls_email_contacto,ls_email_pagador,ls_email_tercero,ls_dv_terc,ls_email_titular
long	ll_fono_p_largo,ll_new,ll_cel_largo,ll_rut_terc

tab_1.tabpage_2.dw_ant_titular.accepttext()
ls_columna		= dwo.name
Setnull(ls_nulo)
if is_columna <> ls_columna then
	ls_columna = is_columna
end if	

ll_new					= this.getrow()

if ls_columna = 'celular_contacto' then
	ll_new					= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_fono_p				= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_new,'celular_contacto')
	ll_fono_p_largo			= len(ls_fono_p)
	if ll_fono_p_largo > 0 and ls_fono_p <> '-' and ls_fono_p <>'' and not isnull(ls_fono_p) then 
		if ls_fono_p <> '' and ls_fono_p <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular_contacto')
			if ls_pasa_p='N' then
			//	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
				tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'celular_contacto','')
//				tab_1.tabpage_2.dw_ant_titular.setfocus()
//				tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_contacto')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_fono_p,'celular_contacto')
				if ls_pasa_letras = 'N' then
//					tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
					tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'celular_contacto','')
					tab_1.tabpage_2.dw_ant_titular.accepttext()
//					tab_1.tabpage_2.dw_ant_titular.setfocus()
//					tab_1.tabpage_2.dw_ant_titular.setcolumn('celular_contacto')
				end if	
			end if
		end if
	end if
end if

if ls_columna = 'fono_contacto' then
	ll_new					= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_fono_p				= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_new,'fono_contacto')
	ll_fono_p_largo			= len(ls_fono_p)
	if ll_fono_p_largo > 0 and ls_fono_p <> '-' and ls_fono_p <>'' and not isnull(ls_fono_p) then 
		if ls_fono_p <> '' and ls_fono_p <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'fono_contacto')
			if ls_pasa_p='N' then
			//	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
				tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'fono_contacto','')
//				tab_1.tabpage_2.dw_ant_titular.setfocus()
//				tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_contacto')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_fono_p,'fono_contacto')
				if ls_pasa_letras = 'N' then
//					tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
					tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'fono_contacto','')
					tab_1.tabpage_2.dw_ant_titular.accepttext()
//					tab_1.tabpage_2.dw_ant_titular.setfocus()
//					tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_contacto')
				end if	
			end if
		end if
	end if
end if
if ls_columna = 'celular_tercero' then
	ll_new					= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_fono_p				= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_new,'celular_tercero')
	ll_fono_p_largo			= len(ls_fono_p)
	if ll_fono_p_largo > 0 and ls_fono_p <> '-' and ls_fono_p <>'' and not isnull(ls_fono_p) then 
		if ls_fono_p <> '' and ls_fono_p <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular_tercero')
			if ls_pasa_p='N' then
			//	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
				tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'celular_tercero','')
//				tab_1.tabpage_2.dw_ant_titular.setfocus()
//				tab_1.tabpage_2.dw_ant_titular.setcolumn('celular_tercero')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_fono_p,'celular_tercero')
				if ls_pasa_letras = 'N' then
//					tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
					tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'celular_tercero','')
					tab_1.tabpage_2.dw_ant_titular.accepttext()
//					tab_1.tabpage_2.dw_ant_titular.setfocus()
//					tab_1.tabpage_2.dw_ant_titular.setcolumn('celular_tercero')
				end if	
			end if
		end if
	end if
end if

if ls_columna = 'fono_tercero' then
	ll_new					= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_fono_p				= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_new,'fono_tercero')
	ll_fono_p_largo			= len(ls_fono_p)
	if ll_fono_p_largo > 0 and ls_fono_p <> '-' and ls_fono_p <>'' and not isnull(ls_fono_p) then 
		if ls_fono_p <> '' and ls_fono_p <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'fono_tercero')
			if ls_pasa_p='N' then
			//	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
				tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'fono_tercero','')
//				tab_1.tabpage_2.dw_ant_titular.setfocus()
//				tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_tercero')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_fono_p,'fono_tercero')
				if ls_pasa_letras = 'N' then
//					tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_new)
					tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'fono_tercero','')
					tab_1.tabpage_2.dw_ant_titular.accepttext()
//					tab_1.tabpage_2.dw_ant_titular.setfocus()
//					tab_1.tabpage_2.dw_ant_titular.setcolumn('fono_tercero')
				end if	
			end if
		end if
	end if
end if
if ls_columna = 'email_contacto' then
	ll_new				= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_email_contacto	= tab_1.tabpage_2.dw_ant_titular.getitemstring(this.getrow(),'email_contacto')
	if ls_email_contacto <> '' or ls_email_contacto <> '-' then
		if Match(ls_email_contacto, "@") then
		else
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'email_contacto',ls_nulo)
			tab_1.tabpage_2.dw_ant_titular.accepttext()
		end if	
	end if	
end if
if ls_columna = 'email_pagador' then
	ll_new				= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_email_pagador	= tab_1.tabpage_2.dw_ant_titular.getitemstring(this.getrow(),'email_pagador')
	if ls_email_pagador <> '' or ls_email_pagador <> '-' then
		if Match(ls_email_pagador, "@") then
		else
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'email_pagador',ls_nulo)
			tab_1.tabpage_2.dw_ant_titular.accepttext()
		end if	
	end if	
end if
if ls_columna = 'email_tercero' then
	ll_new				= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_email_tercero	= tab_1.tabpage_2.dw_ant_titular.getitemstring(this.getrow(),'email_tercero')
	if ls_email_tercero <> '' or ls_email_tercero <> '-' then
		if Match(ls_email_pagador, "@") then
		else
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'email_tercero',ls_nulo)
			tab_1.tabpage_2.dw_ant_titular.accepttext()
		end if	
	end if	
end if

if ls_columna = 'email_titular' then
	ll_new				= tab_1.tabpage_2.dw_ant_titular.getrow()
	ls_email_titular		= tab_1.tabpage_2.dw_ant_titular.getitemstring(this.getrow(),'email_titular')
	if ls_email_titular <> '' or ls_email_titular <> '-' then
		if Match(ls_email_titular, "@") then
		else
			tab_1.tabpage_2.dw_ant_titular.setitem(ll_new,'email_titular',ls_nulo)
			tab_1.tabpage_2.dw_ant_titular.accepttext()
		end if	
	end if	
end if

if ls_columna='rut_tercero' or ls_columna='dv_tercero' then
	ll_new				= this.getrow()
	ll_rut_terc					= this.getitemnumber(this.getrow(),'rut_tercero')
	ls_dv_terc					= this.getitemstring(this.getrow(),'rut_tercero')
	if ll_rut_terc>0 and ls_dv_terc = '' and not isnull(ls_dv_terc) then
			dw_ant_titular.setitem(ll_new,'dv_fallecido',ls_nulo)
			tab_1.tabpage_2.dw_ant_titular.accepttext()
//			tab_1.tabpage_2.dw_ant_titular.setfocus()
//			tab_1.tabpage_2.dw_ant_titular.setcolumn('dv_fallecido')
	end if
end if
//////this.accepttext()
//tab_1.tabpage_2.dw_ant_titular.accepttext()
end event

event losefocus;tab_1.tabpage_2.dw_ant_titular.accepttext()
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3717
integer height = 2300
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
integer x = 87
integer y = 40
integer width = 2226
integer height = 112
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
integer x = 78
integer y = 160
integer width = 3561
integer height = 1940
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_antecedente_fall_ficha"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_ciudad,ls_dv,ls_nulo,ls_periodo,ls_usar_capilla,ls_nombre,ls_sexo,ls_cod_estado,ls_cod_tamano,ls_cod_obs,ls_tamano,&
			ls_usar_templo
Long		ll_rut,ll_resp,ll_new,ll_year,ll_mes,ll_dia,ll_year_hoy,ll_mes_hoy,ll_dia_hoy,ll_edad,ll_hora,ll_minutos,ll_sw_tit_fall,ll_res,ll_nulo,ll_fila,&
			ll_alto_impacto,ll_pos,ll_covid_19,ll_protocol_covid,ll_cod_parque,ll_hora_ini,ll_hora_fin,ll_count_templo,ll_hora_uso_templo,ll_horafin_uso_templo,&
			ll_min_uso_templo,ll_minfin_uso_templo,ll_hora_ini_t,ll_hora_fin_t,ll_minutos_ini_t,ll_minutos_fin_t,ll_hora_sepult,ll_minuto_sepult,ll_cal_minutos,&
			ll_hora_inivela,ll_hora_finvela,ll_minuto_inivela,ll_minuto_finvela,ll_sala_templo,ll_sala_velatorio,ll_hora_finv,ll_min_finv
Datetime	ldt_fecha_fall,ldt_fecha_defun,ldt_nulo,ldt_fec_sepult,ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_inivela,ldt_fecha_finvela,ldt_fecha_antes
date		ldt_fec_ini,ld_fecha_fall,ldt_fecha_ini_seteovela
Double	ll_numero

this.accepttext()
ls_columna				= dwo.name 
Setnull(ls_nulo);Setnull(ldt_nulo);setnull(ll_nulo)
tab_1.tabpage_1.dw_ant_fall.getchild('codigo_comuna_fall',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.insertrow(0)

tab_1.tabpage_2.dw_ant_titular.getchild('codigo_comuna_titular',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)
if ls_columna='sw_titular_fall' then
	il_dw_tit_fall		= 0
	ll_sw_tit_fall		= long(data)
	ll_fila	= tab_1.tabpage_1.dw_ant_fall.getrow()
	if ll_sw_tit_fall=0 then
		ll_res			= messagebox("Advertencia","Está Seguro COPIAR Antecedentes de Titular a Fallecido",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ll_rut		= tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular')
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'rut_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemnumber(1,'rut_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'dv_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'dv_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'nombre_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'ap_paterno_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_paterno_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'ap_materno_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'ap_materno_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'tipo_via_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'tipo_via_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'numero_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'num_direccion_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'depto_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'depto_direccion_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'block_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'block_direccion_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'poblacion_villa_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'poblacion_villa_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sector_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'sector_titular'))
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_ciudad_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular'))
			if idw_detalle2.retrieve(tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')) = 0 then
				idw_detalle2.insertrow(0)
			end if
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_comuna_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_comuna_titular'))
			tab_1.tabpage_1.dw_ant_fall.accepttext()
			SELECT	"CLIENTE"."FECHA_NAC",	"CLIENTE"."SEXO"  
			INTO 		:ldt_fecha_fall,			:ls_sexo  
			FROM 	"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_nacimiento_fall',ldt_fecha_fall)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sexo_fallecido',ls_sexo)
				ldt_fec_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
				if ldt_fecha_fall > ldt_fec_sepult then
					messagebox("Advertencia","Fecha Nacimiento Inválida, No bede ser Mayor a la Fecha de Sepultación")
					this.setitem(this.getrow(),'fecha_nacimiento_fall',ldt_nulo)
				else
					if not isnull(ldt_fecha_fall) then
						ll_year			= year(date(ldt_fecha_fall))
						ll_mes			= month(date(ldt_fecha_fall))
						ll_dia				= day(date(ldt_fecha_fall))
						ll_year_hoy		= year(date(gdt_fec_sistema))
						ll_mes_hoy		= month(date(gdt_fec_sistema))
						ll_dia_hoy		= day(date(gdt_fec_sistema))
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
			end if
		else
			il_dw_tit_fall	= 1
			tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sw_titular_fall',1)
		end if
	else
		ls_nombre			= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'nombre_fallecido')
		if not isnull(ls_nombre) or ls_nombre<>'' then
			ll_res			= messagebox("Advertencia","Está Seguro de BORRAR Antecedentes del Fallecido",Exclamation!,YesNo!,2)
			if ll_res=1 then
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'rut_fallecido',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'dv_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'nombre_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'ap_paterno_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'ap_materno_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'tipo_via_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'direccion_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'numero_direccion_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'depto_direccion_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'block_direccion_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'poblacion_villa_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sector_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_ciudad_fall',ls_nulo)
				idw_detalle2.reset()
				idw_detalle2.insertrow(0)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_comuna_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_nacimiento_fall',ldt_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'edad_fallecido',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'periodo_nacimiento',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sexo_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_estado_fall',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'cod_tamano_cuerpo',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'fecha_defuncion',ldt_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'observacion_fallecido',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'causa_fallecimiento',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'usar_capilla','N')
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'usar_templo','N')
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sw_alto_impacto',1)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'hora_util_capilla',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'minuto_util_capilla',ll_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'capilla_velatoria',ls_nulo)
				tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'direccion_capilla',ls_nulo)
				
				tab_1.tabpage_1.dw_ant_fall.accepttext()
				tab_1.tabpage_1.dw_ant_fall.setcolumn('rut_fallecido')
				tab_1.tabpage_1.dw_ant_fall.setfocus()
			end if
		end if
	end if
end if
if ls_columna='codigo_ciudad_fall' then
	ls_ciudad			= this.getitemstring(this.getrow(),'codigo_ciudad_fall')
//	if isnull(ls_ciudad) then
//		idw_detalle2.settransobject(sqlca)
//	end if	
	idw_detalle2.retrieve(ls_ciudad)
end if
if ls_columna='rut_fallecido' or ls_columna='dv_fallecido' then
	ll_new				= this.getrow()
	ll_rut				= this.getitemnumber(this.getrow(),'rut_fallecido')
	ls_dv					= this.getitemstring(this.getrow(),'dv_fallecido')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			Setnull(ls_dv)
//			dw_ant_fall.deleterow(this.getrow())
//			ll_new = dw_ant_fall.insertrow(0)
			dw_ant_fall.scrolltorow(ll_new)
//			dw_ant_fall.setitem(ll_new,'rut_fallecido',ll_rut)
			dw_ant_fall.setitem(ll_new,'dv_fallecido',ls_dv)
			dw_ant_fall.accepttext()
			dw_ant_fall.setfocus()
			dw_ant_fall.setcolumn('dv_fallecido')
		end if
	end if
end if
if ls_columna='fecha_defuncion' then
	ldt_fecha_defun	= this.getitemdatetime(this.getrow(),'fecha_defuncion')
	ldt_fec_sepult		= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
	if not isnull(ldt_fecha_defun) then
		if ldt_fecha_defun > ldt_fec_sepult then
			messagebox("Advertencia","Fecha Defunción Inválida, No bede ser Mayor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'fecha_defuncion',ldt_nulo)
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
if ls_columna='fecha_nacimiento_fall' then
	ldt_fecha_fall	= this.getitemdatetime(this.getrow(),'fecha_nacimiento_fall')
	ldt_fec_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
	if ldt_fecha_fall > ldt_fec_sepult then
		messagebox("Advertencia","Fecha Nacimiento Inválida, No bede ser Mayor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'fecha_nacimiento_fall',ldt_nulo)
	else
		if not isnull(ldt_fecha_fall) then
			ll_year			= year(date(ldt_fecha_fall))
			ll_mes			= month(date(ldt_fecha_fall))
			ll_dia				= day(date(ldt_fecha_fall))
			ll_year_hoy		= year(date(gdt_fec_sistema))
			ll_mes_hoy		= month(date(gdt_fec_sistema))
			ll_dia_hoy		= day(date(gdt_fec_sistema))
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
end if
if ls_columna='periodo_nacimiento' then
	ls_periodo			= this.getitemstring(this.getrow(),'periodo_nacimiento')
	if ls_periodo='A' then
		ldt_fec_ini		= RelativeDate(today(), -365)
		ld_fecha_fall	= date(this.getitemdatetime(this.getrow(),'fecha_nacimiento_fall'))
		if ld_fecha_fall > ldt_fec_ini then
			messagebox("Advertencia","No es Posible Ingresar Tipo de Periodo, Fecha Ingresar es Menor a UN Año")
		end if
	end if
end if
if ls_columna='cod_estado_fall' then
	ls_cod_estado	= this.getitemstring(this.getrow(),'cod_estado_fall')
	if not isnull(ls_cod_estado) then
		this.setitem(this.getrow(),'cod_obs_cuerpo',ls_nulo)
	end if
end if
if ls_columna='sw_alto_impacto' then
	ll_alto_impacto	= long(data)
	if ll_alto_impacto=1 then
		this.setitem(this.getrow(),'obs_alto_impacto',ls_nulo)
	end if
end if

if ls_columna = 'usar_templo' then
	ls_usar_templo				= string(data)
	ll_hora_sepult				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'hora')
	ll_minuto_sepult			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'minutos')
	ldt_fec_sepult				= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
	ll_cod_parque				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
	ll_numero					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero')
	ll_hora_ini_t					= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'hora_util_templo')
	ll_minutos_ini_t				= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'minuto_util_templo')
	ll_hora_fin_t					= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'hora_util_fin_templo')
	ll_minutos_fin_t			= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'minuto_util_fin_templo')
	ll_sala_templo				= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'sala_templo')
	if ls_usar_templo = 'S' then
		if ll_hora_sepult > 0 and not isnull(il_horaval_uso_templo) then
			tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'hora_util_templo',ll_hora_sepult - 1)
			tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'minuto_util_templo',ll_minuto_sepult)
			tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'hora_util_fin_templo',ll_hora_sepult)
			tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'minuto_util_fin_templo',ll_minuto_sepult)
		end if	
		tab_1.tabpage_1.dw_ant_fall.accepttext()
		SELECT 	COUNT("FICHA_SEPULTACION"."CODIGO_EJECUTIVO")  
		INTO 		:ll_count_templo  
		FROM 	"FICHA_SEPULTACION"  
		WHERE ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fec_sepult ) AND  
				  ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND  
				  ( "FICHA_SEPULTACION"."HORA_UTIL_TEMPLO" = :ll_hora_uso_templo ) AND  
				  ( "FICHA_SEPULTACION"."MINUTO_UTIL_TEMPLO" >= :ll_min_uso_templo ) AND  
				  ( "FICHA_SEPULTACION"."HORA_UTIL_FIN_TEMPLO" = :ll_horafin_uso_templo ) AND  
				  ( "FICHA_SEPULTACION"."MINUTO_UTIL_FIN_TEMPLO" <= :ll_minfin_uso_templo )  AND
				  ( "FICHA_SEPULTACION"."SALA_TEMPLO" = :ll_sala_templo ) AND
				  ( "FICHA_SEPULTACION"."NUMERO" <> :ll_numero)
		USING	sqlca;
		if ll_count_templo > 0 then
			messagebox("Advertencia","No es Posible Usar Templo, Existe Reserva")
			dw_ant_fall.setitem(dw_ant_fall.getrow(),'usar_templo','N')
			dw_ant_fall.setitem(dw_ant_fall.getrow(),'hora_util_templo',ll_nulo)
			dw_ant_fall.setitem(dw_ant_fall.getrow(),'minuto_util_templo',ll_nulo)
			dw_ant_fall.setitem(dw_ant_fall.getrow(),'hora_util_fin_templo',ll_nulo)
			dw_ant_fall.setitem(dw_ant_fall.getrow(),'minuto_util_fin_templo',ll_nulo)
			dw_ant_fall.accepttext()
		end if
	elseif ls_usar_templo = 'N' then
		this.setitem(this.getrow(),'hora_util_templo',ll_nulo)
		this.setitem(this.getrow(),'minuto_util_templo',ll_nulo)
		this.setitem(this.getrow(),'hora_util_fin_templo',ll_nulo)
		this.setitem(this.getrow(),'minuto_util_fin_templo',ll_nulo)
		this.setitem(this.getrow(),'observacion_templo',ls_nulo)
	end if
end if
if ls_columna='hora_util_templo' then
	ll_hora			= this.getitemnumber(this.getrow(),'hora_util_templo')
	ll_cod_parque	= this.getitemnumber(this.getrow(),'cod_parque')
	SELECT	"FICHA_HORAS_TEMPLO"."HORA_INICIO",   
				"FICHA_HORAS_TEMPLO"."MINUTO_INICIO",   
				"FICHA_HORAS_TEMPLO"."HORA_FINAL",   
				"FICHA_HORAS_TEMPLO"."MINUTO_FINAL",   
				"FICHA_HORAS_TEMPLO"."INTERVALO_MINUTO",   
				"FICHA_HORAS_TEMPLO"."VECES_USO"  
	INTO		:il_hora_ini_templo,   
				:il_min_ini_templo,   
				:il_hora_fin_templo,   
				:il_min_fin_templo,   
				:il_intervalo_templo,   
				:il_veces_templo  
	FROM 	"FICHA_HORAS_TEMPLO"  
	WHERE 	"FICHA_HORAS_TEMPLO"."COD_PARQUE" = :ll_cod_parque   ;
	if ll_hora>23 then
		messagebox("Advertencia","Hora Templo Incorrecta")
		this.setitem(this.getrow(),'hora_util_templo',0)
		this.accepttext()
	end if
end if
if ls_columna='minuto_util_templo' then
	ll_minutos	= this.getitemnumber(this.getrow(),'minuto_util_templo')
	if ll_minutos > 59 then
		messagebox("Advertencia","Minutos Templo Incorrecto")
		this.setitem(this.getrow(),'minuto_util_templo',0)
		this.accepttext()
	else
		if il_intervalo=30 then
			if ll_minutos<>0 and ll_minutos<>30 then
				messagebox("Advertencia","Horario Inválido, recuerde Uso Templo es cada "+string(il_intervalo_templo,'##0')+ " minutos")
			end if
		elseif il_intervalo=15 then
			if ll_minutos<>0 and ll_minutos<>15 and ll_minutos<>30 and ll_minutos<>45 then
				messagebox("Advertencia","Horario Inválido, recuerde Uso Templo es cada "+string(il_intervalo_templo,'##0')+ " minutos")
			end if
		elseif il_intervalo=60 then
			if ll_minutos<>0 then
				messagebox("Advertencia","Horario Inválido, recuerde Uso Templo es cada UNA hora")
			end if
		end if
	end if
end if

if ls_columna='hora_util_templo' or ls_columna='minuto_util_templo' then
	wf_validar_horario(this.getrow(),'T')
end if
if ls_columna='usar_capilla' then
	ls_usar_capilla	= data
	if ls_usar_capilla='N' then
		this.setitem(this.getrow(),'fecha_ini_velatorio',ldt_nulo)
		this.setitem(this.getrow(),'hora_util_capilla',0)
		this.setitem(this.getrow(),'minuto_util_capilla',0)
		this.setitem(this.getrow(),'capilla_velatoria',ls_nulo)
		this.setitem(this.getrow(),'fecha_fin_velatorio',ldt_nulo)
		this.setitem(this.getrow(),'hora_util_capilla_fin',0)
		this.setitem(this.getrow(),'minuto_util_capilla_fin',0)
	else
		ldt_fecha_inivela			= this.getitemdatetime(this.getrow(),'fecha_ini_velatorio')
		ll_hora_inivela				= this.getitemnumber(this.getrow(),'hora_util_capilla')
		ll_minuto_inivela			= this.getitemnumber(this.getrow(),'minuto_util_capilla')
		ldt_fecha_finvela			= this.getitemdatetime(this.getrow(),'fecha_fin_velatorio')
		ll_hora_finvela				= this.getitemnumber(this.getrow(),'hora_util_capilla_fin')
		ll_minuto_finvela			= this.getitemnumber(this.getrow(),'minuto_util_capilla_fin')
		ll_sala_velatorio			= this.getitemnumber(this.getrow(),'sala_velatorio')
		if ll_hora_inivela >= 0 then //isnull(ldt_fecha_inivela) and isnull(ldt_fecha_finvela) then
			ll_hora_sepult				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'hora')
			ll_minuto_sepult			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'minutos')
			ldt_fec_sepult				= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
			ll_cod_parque				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
			ll_numero					= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero')
			ll_hora_ini_t					= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'hora_util_templo')
			ll_minutos_ini_t				= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'minuto_util_templo')
			ll_hora_fin_t					= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'hora_util_fin_templo')
			ll_minutos_fin_t			= tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'minuto_util_fin_templo')
			SELECT 	COUNT("FICHA_SEPULTACION"."CODIGO_EJECUTIVO")  
			INTO 		:ll_count_templo  
			FROM 	"FICHA_SEPULTACION"  
			WHERE ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fec_sepult ) AND  
					  ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND  
					  ( "FICHA_SEPULTACION"."FECHA_INI_VELATORIO" >= :ldt_fecha_inivela ) AND  
					  ( "FICHA_SEPULTACION"."HORA_UTIL_CAPILLA" >= :ll_hora_inivela ) AND  
					  ( "FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA" >= :ll_minuto_inivela ) AND  
					  ( "FICHA_SEPULTACION"."FECHA_FIN_VELATORIO" <= :ldt_fecha_finvela ) AND  
					  ( "FICHA_SEPULTACION"."HORA_UTIL_CAPILLA_FIN" <= :ll_hora_finvela ) AND  
					  ( "FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA_FIN" <= :ll_minuto_finvela )  AND
					  ( "FICHA_SEPULTACION"."SALA_VELATORIO" = :ll_sala_velatorio ) AND
					  ( "FICHA_SEPULTACION"."NUMERO" <> :ll_numero)
			USING	sqlca;
			if ll_count_templo > 0 then
				messagebox("Advertencia","No es Posible Usar Velatorio, Existe Reserva")
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'usar_capilla','N')
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_ini_velatorio',ldt_nulo)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'hora_util_capilla',0)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'minuto_util_capilla',0)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'capilla_velatoria',ls_nulo)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_fin_velatorio',ldt_nulo)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'hora_util_capilla_fin',0)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'minuto_util_capilla_fin',0)
				dw_ant_fall.accepttext()
			else
				if ll_minuto_sepult >= 30 then
					ll_min_finv		= 60 - (ll_minuto_sepult - 30)
					ll_hora_finv		= ll_hora_sepult
				else
					ll_min_finv		= 60 - (30 - ll_minuto_sepult)
					ll_hora_finv		= ll_hora_sepult - 1
				end if
				if ll_min_finv = 60 then ll_min_finv=0
				
				ldt_fecha_ini_seteovela	= RelativeDate ( date(ldt_fec_sepult), - 1)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_ini_velatorio', ldt_fecha_ini_seteovela)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'hora_util_capilla',ll_hora_sepult)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'minuto_util_capilla',ll_minuto_sepult)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_fin_velatorio',ldt_fec_sepult)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'hora_util_capilla_fin',ll_hora_finv)
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'minuto_util_capilla_fin',ll_min_finv)
				dw_ant_fall.accepttext()
			end if
		end if
	end if
end if

if ls_columna = 'fecha_ini_velatorio' then
	ldt_fecha_ini		= this.getitemdatetime(this.getrow(),'fecha_ini_velatorio')
	ldt_fecha_fin		= this.getitemdatetime(this.getrow(),'fecha_fin_velatorio')
	ldt_fec_sepult		= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
	ldt_fecha_antes	= datetime(RelativeDate(date(ldt_fec_sepult), -2),time('00:00:00'))
	if ldt_fecha_ini < ldt_fecha_antes then
		messagebox("Advertencia","Fecha Uso Inicio Velatorio Inválido, No puede ser Menor a 2 dias de la Fecha de Sepultación")
		this.setitem(this.getrow(),'fecha_ini_velatorio',ldt_nulo)
		this.accepttext()
	elseif not isnull(ldt_fecha_ini) and not isnull(ldt_fecha_fin) and ldt_fecha_fin <= ldt_fecha_ini then
		messagebox("Advertencia","Rango Inválido, Fecha Término NO debe ser Menor a la Fecha Inicio Uso Velatorio")
		this.setitem(this.getrow(),'fecha_fin_velatorio',ldt_nulo)
		this.accepttext()
	elseif ldt_fecha_ini > ldt_fec_sepult then
		messagebox("Advertencia","Fecha Uso Término Velatorio Inválido, No puede ser Mayor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'fecha_fin_velatorio',ldt_nulo)
		this.accepttext()
	elseif ldt_fecha_ini > ldt_fec_sepult then
		messagebox("Advertencia","Rango Inválido, Fecha Inicio NO debe ser Mayor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'fecha_ini_velatorio',ldt_nulo)
		this.setitem(this.getrow(),'fecha_fin_velatorio',ldt_nulo)
		this.setitem(this.getrow(),'hora_util_capilla',0)
		this.setitem(this.getrow(),'hora_util_capilla_fin',0)
		this.setitem(this.getrow(),'minuto_util_capilla_fin',0)
		this.setitem(this.getrow(),'minuto_util_capilla',0)
		this.accepttext()
	end if
end if

if ls_columna = 'fecha_fin_velatorio' then
	ldt_fecha_ini		= this.getitemdatetime(this.getrow(),'fecha_ini_velatorio')
	ldt_fecha_fin		= this.getitemdatetime(this.getrow(),'fecha_fin_velatorio')
	ldt_fec_sepult		= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
	ldt_fecha_antes	= datetime(RelativeDate(date(ldt_fec_sepult), -2),time('00:00:00'))
	if ldt_fecha_ini < ldt_fecha_antes then
		messagebox("Advertencia","Fecha Uso Inicio Velatorio Inválido, No puede ser Menor a 2 dias de la Fecha de Sepultación")
		this.setitem(this.getrow(),'fecha_ini_velatorio',ldt_nulo)
		this.accepttext()
	elseif not isnull(ldt_fecha_ini) and not isnull(ldt_fecha_fin) and ldt_fecha_fin <= ldt_fecha_ini then
		messagebox("Advertencia","Rango Inválido, Fecha Término NO debe ser Menor a la Fecha Inicio Uso Velatorio")
		this.setitem(this.getrow(),'fecha_fin_velatorio',ldt_nulo)
		this.accepttext()
	elseif ldt_fecha_ini > ldt_fec_sepult then
		messagebox("Advertencia","Fecha Uso Término Velatorio Inválido, No puede ser Mayor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'fecha_fin_velatorio',ldt_nulo)
		this.accepttext()
	elseif ldt_fecha_ini > ldt_fec_sepult then
		messagebox("Advertencia","Rango Inválido, Fecha Inicio NO debe ser Mayor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'fecha_ini_velatorio',ldt_nulo)
		this.setitem(this.getrow(),'fecha_fin_velatorio',ldt_nulo)
		this.setitem(this.getrow(),'hora_util_capilla',0)
		this.setitem(this.getrow(),'hora_util_capilla_fin',0)
		this.setitem(this.getrow(),'minuto_util_capilla_fin',0)
		this.setitem(this.getrow(),'minuto_util_capilla',0)
		this.accepttext()
	end if
end if

if ls_columna='hora_util_capilla' then
	ldt_fecha_ini		= this.getitemdatetime(this.getrow(),'fecha_ini_velatorio')
	ldt_fecha_fin		= this.getitemdatetime(this.getrow(),'fecha_fin_velatorio')
	ll_hora_ini			= this.getitemnumber(this.getrow(),'hora_util_capilla')
	ll_hora_fin			= this.getitemnumber(this.getrow(),'hora_util_capilla_fin')
	ll_hora				= this.getitemnumber(this.getrow(),'hora_util_capilla')
	if ll_hora>23 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'hora_util_capilla',0)
	elseif not isnull(ll_hora_ini) and not isnull(ll_hora_fin) then
		if ll_hora_fin <= ll_hora_ini and ldt_fecha_ini >= ldt_fecha_fin then
			messagebox("Advertencia","Rango Inválido, Hora Término NO debe ser Menor a la Hora Inicio Uso Velatorio")
			this.setitem(this.getrow(),'hora_util_capilla_fin',ll_nulo)
			this.accepttext()
		end if	
	end if
end if
if ls_columna='minuto_util_capilla' then
	ll_minutos	= this.getitemnumber(this.getrow(),'minuto_util_capilla')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'minuto_util_capilla',0)
	end if
end if

if ls_columna='hora_util_capilla_fin' then
	ll_hora				= this.getitemnumber(this.getrow(),'hora_util_capilla_fin')
	ll_hora_ini			= this.getitemnumber(this.getrow(),'hora_util_capilla')
	ll_hora_fin			= this.getitemnumber(this.getrow(),'hora_util_capilla_fin')
	if ll_hora>23 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'hora_util_capilla_fin',0)
	elseif not isnull(ll_hora_ini) and not isnull(ll_hora_fin) then
		if ll_hora_fin <= ll_hora_ini then
			messagebox("Advertencia","Rango Inválido, Hora Término NO debe ser Menor a la Hora Inicio Uso Velatorio")
			this.setitem(this.getrow(),'hora_util_capilla_fin',ll_nulo)
			this.accepttext()
		end if	
	end if
end if
if ls_columna='minuto_util_capilla_fin' then
	ll_minutos	= this.getitemnumber(this.getrow(),'minuto_util_capilla_fin')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'minuto_util_capilla_fin',0)
	end if
end if
this.accepttext()
end event

event clicked;String		ls_estado,ls_columna,ls_fecha,ls_dv,ls_estado_reg,ls_sector,ls_sepultura,ls_ejecutivo,ls_obs,ls_base,ls_serie,ls_nombre,ls_ap_pat,ls_ap_mat,&
			ls_string
Datetime	ldt_fecha_fall,ldt_fecha_defun,ldt_nulo,ldt_fec_sepult,ldt_fecha_sepult
Long		ll_year,ll_year_hoy,ll_mes,ll_mes_hoy,ll_dia,ll_dia_hoy,ll_edad,ll_rut,ll_fila,ll_res,ll_row,ll_cod_parque,ll_hora_fijada,ll_minuto_fijado
Double	ll_numero

dw_ant_fall.accepttext()
Setnull(ldt_nulo)
ls_columna					= dwo.name
ll_row							= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
ls_estado_reg				= this.getitemstring(this.getrow(),'estado_reg')
if (ls_estado_reg<>'G' and ls_estado_reg<>'A') or isnull(ls_estado_reg) then
	CHOOSE CASE ls_columna
		CASE 't_copiar'
			ll_rut			= dw_ant_fall.getitemnumber(dw_ant_fall.getrow(),'rut_fallecido')
			ls_dv				= dw_ant_fall.getitemstring(dw_ant_fall.getrow(),'dv_fallecido')
			if ll_rut > 0 and not isnull(ll_rut) and not isnull(ls_dv) then
				ll_fila		= tab_1.tabpage_1.dw_ant_fall.getrow()
				if tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_fila,'direccion_fall') <> tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular') or isnull(tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_fila,'direccion_fall')) then
					ll_res	= messagebox("Advertencia","Está Seguro COPIAR Dirección de Titular a Fallecido",Exclamation!,YesNo!,2)
					if ll_res=1 then
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'tipo_via_fallecido',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'tipo_via_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'direccion_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'numero_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'num_direccion_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'depto_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'depto_direccion_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'block_direccion_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'block_direccion_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'poblacion_villa_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'poblacion_villa_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'sector_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'sector_titular'))
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_ciudad_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular'))
						if idw_detalle2.retrieve(tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')) = 0 then
							idw_detalle2.insertrow(0)
						end if
						tab_1.tabpage_1.dw_ant_fall.setitem(ll_fila,'codigo_comuna_fall',tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_comuna_titular'))
						tab_1.tabpage_1.dw_ant_fall.accepttext()
					end if
				end if
			end if
			
		CASE 'p_1'
			ll_rut	= dw_ant_fall.getitemnumber(dw_ant_fall.getrow(),'rut_fallecido')
			ls_dv		= dw_ant_fall.getitemstring(dw_ant_fall.getrow(),'dv_fallecido')
			if ll_rut > 0 and not isnull(ll_rut) and not isnull(ls_dv) then
				ls_fecha	= string(date(dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_defuncion')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_defuncion',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_defuncion',date(ls_fecha))
				END IF
				ldt_fecha_defun	= this.getitemdatetime(this.getrow(),'fecha_defuncion')
				ldt_fec_sepult		= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
				if not isnull(ldt_fecha_defun) then
					if ldt_fecha_defun > ldt_fec_sepult then
						messagebox("Advertencia","Fecha Defunción Inválida, No bede ser Mayor a la Fecha de Sepultación")
						dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_defuncion',ldt_nulo)
					end if
				end if
			end if
	
		CASE 'p_2'
			ll_rut	= dw_ant_fall.getitemnumber(dw_ant_fall.getrow(),'rut_fallecido')
			ls_dv		= dw_ant_fall.getitemstring(dw_ant_fall.getrow(),'dv_fallecido')
			if ll_rut<>0 and not isnull(ll_rut) and ls_dv<>'' and not isnull(ls_dv) then
				ls_fecha	= string(date(dw_ant_fall.getitemdatetime(dw_ant_fall.getrow(),'fecha_nacimiento_fall')))
				if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fall',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fall',date(ls_fecha))
				END IF
				ldt_fecha_fall	= this.getitemdatetime(this.getrow(),'fecha_nacimiento_fall')
				ldt_fec_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
				if not isnull(ldt_fecha_fall) then
					if ldt_fecha_fall > ldt_fec_sepult then
						messagebox("Advertencia","Fecha Nacimiento Inválida, No bede ser Mayor a la Fecha de Sepultación")
						dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fall',ldt_nulo)
					else
						ll_year			= year(date(ldt_fecha_fall))
						ll_mes			= month(date(ldt_fecha_fall))
						ll_dia			= day(date(ldt_fecha_fall))
						ll_year_hoy		= year(date(gdt_fec_sistema))
						ll_mes_hoy		= month(date(gdt_fec_sistema))
						ll_dia_hoy		= day(date(gdt_fec_sistema))
						ll_edad			= ll_year_hoy - ll_year
						if (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy < ll_mes then
							ll_edad		= ll_edad - 1
						elseif (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy = ll_mes and ll_dia_hoy < ll_dia then
							ll_edad		= ll_edad - 1
						end if
						if ll_edad >= 0 then
							dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_edad)
							dw_ant_fall.accepttext()
						else
							messagebox("Advertencia","Fecha Nacimiento Fallecido Inválido")
						end if
					end if
				end if
			end if
		CASE 'p_templo'
			ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
			SELECT	"FICHA_HORAS_TEMPLO"."HORA_INICIO",   
						"FICHA_HORAS_TEMPLO"."MINUTO_INICIO",   
						"FICHA_HORAS_TEMPLO"."HORA_FINAL",   
						"FICHA_HORAS_TEMPLO"."MINUTO_FINAL",   
						"FICHA_HORAS_TEMPLO"."INTERVALO_MINUTO",   
						"FICHA_HORAS_TEMPLO"."VECES_USO"  
			INTO		:il_hora_ini_templo,   
						:il_min_ini_templo,   
						:il_hora_fin_templo,   
						:il_min_fin_templo,   
						:il_intervalo_templo,   
						:il_veces_templo  
			FROM 	"FICHA_HORAS_TEMPLO"  
			WHERE 	"FICHA_HORAS_TEMPLO"."COD_PARQUE" = :ll_cod_parque   ;
			ls_sector				= trim(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sector'))
			ls_sepultura			= trim(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sepultura'))
			ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
			ls_ejecutivo			= tab_1.tabpage_3.dw_ficha_sepult.getitemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'codigo_ejecutivo')
			ls_obs				= this.getitemString(this.getrow(),'observacion_templo')
			ll_hora_fijada		= this.getitemNumber(this.getrow(),'hora_util_templo')
			ls_base				= trim(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base'))
			ls_serie				= trim(tab_1.tabpage_3.dw_ficha_sepult.getitemstring(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie'))
			ll_numero			= tab_1.tabpage_3.dw_ficha_sepult.getitemNumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero')
			if isnull( ldt_fecha_sepult ) or  ls_sector ='' or isnull( ls_sector ) or isnull( ls_sepultura ) or  ls_sepultura ='' or ll_cod_parque =0 or isnull( ll_cod_parque ) then
			else
				ll_minuto_fijado= this.getitemNumber(this.getrow(),'minuto_util_templo')
				if isnull(ll_minuto_fijado) then 
					ll_minuto_fijado=0
					this.setitem(this.getrow(),'minuto_util_templo',ll_minuto_fijado)
					this.accepttext()
				end if
				if isnull(ll_minuto_fijado) then ll_minuto_fijado=0
				ls_nombre		= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'nombre_fallecido'))
				ls_ap_pat		= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'ap_paterno_fall'))
				ls_ap_mat		= trim(tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'ap_materno_fall'))
				if isnull(ll_cod_parque) or isnull(ls_sector) or isnull(ls_sepultura) or isnull(ldt_fecha_sepult) or isnull(ls_ejecutivo) or isnull(ls_obs) then
					
					if isnull(ll_cod_parque) then
						messagebox("Advertencia","Debe Seleccionar Parque")
						this.setcolumn('cod_parque')
					elseif isnull(ls_sector) then
						messagebox("Advertencia","Debe Seleccionar Sector")
						this.setcolumn('sector')
					elseif isnull(ls_sepultura) then
						messagebox("Advertencia","Debe Seleccionar Sepultura")
						this.setcolumn('sepultura')
					elseif isnull(ldt_fecha_sepult) then
						messagebox("Advertencia","Debe Seleccionar Fecha Sepultación")
						this.setcolumn('fecha_sepultacion')
					elseif isnull(ls_ejecutivo) then
						messagebox("Advertencia","Debe Seleccionar Ejecutivo")
						this.setcolumn('codigo_ejecutivo')
					elseif isnull(ls_obs) then
						messagebox("Advertencia","Debe Ingresar Observación Templo")
						this.setcolumn('observacion_templo')
					end if
				else
					if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then
						ls_string	= string(ll_cod_parque)+'~t'+ls_sector+'~t'+ls_sepultura+'~t'+string(ldt_fecha_sepult)+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_ejecutivo+'~t'+ls_obs+'~t'+string(ll_hora_fijada)+'~t'+string(ll_minuto_fijado)+'~t'+'FS'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+'T'
						if isvalid(w_lista_funerales) then close(w_lista_funerales)
						OpenWithParm(w_lista_funerales, ls_string)
					else
						messagebox("Advertencia","Debe Ingresar Antecedente Fallecido")
						tab_1.SelectedTab	= 3
					end if
				end if
			end if
	END CHOOSE
end if
end event

event itemfocuschanged;String	ls_columna,ls_dv,ls_periodo,ls_nulo,ls_modif_adm
Long		ll_rut,ll_new,ll_nulo,ll_year,ll_mes,ll_dia,ll_year_hoy,ll_mes_hoy,ll_dia_hoy,ll_edad,ll_hora,ll_hora_fijada,ll_min_fijada,ll_cod_parque,ll_minutos
datetime	ldt_fecha_fall,ldt_nulo,ldt_fecha_defun,ldt_fec_sepult,ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_antes
date		ldt_fec_ini,ld_fecha_fall

if tab_1.tabpage_3.dw_ficha_sepult.getrow()>0 then
	Setnull(ll_nulo);Setnull(ldt_nulo);Setnull(ls_nulo)
	ls_columna					= dwo.name
	if ls_columna<>'rut_fallecido' and ls_columna<>'dv_fallecido' then
		ll_new					= this.getrow()
		ll_rut						= this.getitemnumber(this.getrow(),'rut_fallecido')
		ls_dv						= this.getitemstring(this.getrow(),'dv_fallecido')
		if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				setnull(ls_dv)
				dw_ant_fall.setitem(ll_new,'dv_fallecido',ls_dv)
				dw_ant_fall.accepttext()
				dw_ant_fall.setfocus()
				dw_ant_fall.setcolumn('dv_fallecido')
			end if
		end if
	end if
	if isnull(tab_1.tabpage_1.dw_ant_fall.getitemnumber(tab_1.tabpage_1.dw_ant_fall.getrow(),'sw_titular_fall')) then
		tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'sw_titular_fall',1)
	end if
	if (ls_columna<>'sw_titular_fall' or ls_columna='sw_titular_fall') and il_dw_tit_fall=1 then
		il_dw_tit_fall	= 0
		tab_1.tabpage_1.dw_ant_fall.setitem(tab_1.tabpage_1.dw_ant_fall.getrow(),'sw_titular_fall',1)
	end if
	if ls_columna<>'fecha_nacimiento_fall' or ls_columna='fecha_nacimiento_fall' then
		ldt_fecha_fall			= this.getitemdatetime(this.getrow(),'fecha_nacimiento_fall')
		ldt_fec_sepult			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
		if ldt_fecha_fall > ldt_fec_sepult then
			dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fall',ldt_nulo)
			dw_ant_fall.setfocus()
			dw_ant_fall.setcolumn('fecha_nacimiento_fall')
		else
			if not isnull(ldt_fecha_fall) then
				ll_year			= year(date(ldt_fecha_fall))
				ll_mes			= month(date(ldt_fecha_fall))
				ll_dia			= day(date(ldt_fecha_fall))
				ll_year_hoy		= year(date(gdt_fec_sistema))
				ll_mes_hoy		= month(date(gdt_fec_sistema))
				ll_dia_hoy		= day(date(gdt_fec_sistema))
				ll_edad			= ll_year_hoy - ll_year
				if (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy < ll_mes then
					ll_edad		= ll_edad - 1
				elseif (ll_year_hoy = (ll_year + ll_edad)) and ll_mes_hoy = ll_mes and ll_dia_hoy < ll_dia then
					ll_edad		= ll_edad - 1
				end if
				if ll_edad < 0 then
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'edad_fallecido',ll_nulo)
					dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_nacimiento_fall',ldt_nulo)
					dw_ant_fall.accepttext()
				end if
			end if
		end if
	end if
	if ls_columna='fecha_defuncion' or ls_columna<>'fecha_defuncion' then
		ldt_fecha_defun		= this.getitemdatetime(this.getrow(),'fecha_defuncion')
		ldt_fec_sepult			= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
		if not isnull(ldt_fecha_defun) then
			if ldt_fecha_defun > ldt_fec_sepult then
				dw_ant_fall.setitem(dw_ant_fall.getrow(),'fecha_defuncion',ldt_nulo)
				dw_ant_fall.setfocus()
				dw_ant_fall.setcolumn('fecha_defuncion')
			end if
		end if
	end if
	if ls_columna='periodo_nacimiento' or ls_columna<>'periodo_nacimiento' then
		ls_periodo				= this.getitemstring(this.getrow(),'periodo_nacimiento')
		if ls_periodo='A' then
			ldt_fec_ini			= RelativeDate(today(), -365)
			ld_fecha_fall		= date(this.getitemdatetime(this.getrow(),'fecha_nacimiento_fall'))
			if ld_fecha_fall > ldt_fec_ini then
				this.setitem(this.getrow(),'periodo_nacimiento',ls_nulo)
				this.setcolumn('edad_fallecido')
			end if
		end if
	end if
	
	if ls_columna<>'hora_util_templo' and ls_columna<>'minuto_util_templo' then
		ll_hora_fijada	= this.getitemnumber(this.getrow(),'hora_util_templo')
		ll_min_fijada	= this.getitemnumber(this.getrow(),'minuto_util_templo')
//		ldt_fec_tras		= this.getitemdatetime(this.getrow(),'fecha_sepultacion')
//		ll_parque_tras	= this.getitemnumber(this.getrow(),'cod_parque')
		if ll_hora_fijada>0 then
			ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
			if ll_cod_parque>0 then
				SELECT	"FICHA_HORAS_TEMPLO"."HORA_INICIO",   
							"FICHA_HORAS_TEMPLO"."MINUTO_INICIO",   
							"FICHA_HORAS_TEMPLO"."HORA_FINAL",   
							"FICHA_HORAS_TEMPLO"."MINUTO_FINAL",   
							"FICHA_HORAS_TEMPLO"."INTERVALO_MINUTO",   
							"FICHA_HORAS_TEMPLO"."VECES_USO"  
				INTO		:il_hora_ini_templo,   
							:il_min_ini_templo,   
							:il_hora_fin_templo,   
							:il_min_fin_templo,   
							:il_intervalo_templo,   
							:il_veces_templo  
				FROM 	"FICHA_HORAS_TEMPLO"  
				WHERE 	"FICHA_HORAS_TEMPLO"."COD_PARQUE" = :ll_cod_parque   ;
			end if
//			ls_modif_adm		= this.getitemstring(this.getrow(),'modif_adm')
//			if ls_modif_adm = 'N' then
//				if ll_hora_fijada<il_hora_ini_templo or (ll_hora_fijada=il_hora_ini_templo and ll_min_fijada<il_min_ini_templo) then
//					ll_hora_fijada	= 0
//					ll_min_fijada	= 0
//					this.setitem(this.getrow(),'hora_util_templo',ll_hora_fijada)
//					this.setitem(this.getrow(),'minuto_util_templo',ll_min_fijada)
//				elseif ll_hora_fijada>il_hora_fin_templo or (ll_hora_fijada=il_hora_fin_templo and ll_min_fijada>il_min_fin_templo) then
//					ll_hora_fijada	= 0
//					ll_min_fijada	= 0
//					this.setitem(this.getrow(),'hora_util_templo',ll_hora_fijada)
//					this.setitem(this.getrow(),'minuto_util_templo',ll_min_fijada)
//				end if
//			end if
		end if
	end if
	if ls_columna<>'hora_util_templo' then
		ll_hora	= this.getitemnumber(this.getrow(),'hora_util_templo')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 23 then
				this.setitem(this.getrow(),'hora_util_templo',0)
			end if
		end if
	end if
	if ls_columna<>'minuto_util_templo' then
		ll_hora	= this.getitemnumber(this.getrow(),'minuto_util_templo')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 59 then
				this.setitem(this.getrow(),'minuto_util_templo',0)
				this.setcolumn('minuto_util_templo')
			else
				if il_intervalo=30 then
					if ll_hora<>0 and ll_hora<>30 then
						this.setitem(this.getrow(),'minuto_util_templo',0)
						this.setcolumn('minuto_util_templo')
					end if
				elseif il_intervalo=15 then
					if ll_hora<>0 and ll_hora<>15 and ll_hora<>30 and ll_hora<>45 then
						this.setitem(this.getrow(),'minuto_util_templo',0)
						this.setcolumn('minuto_util_templo')
					end if
				elseif il_intervalo=60 then
					if ll_hora<>0 then
						this.setitem(this.getrow(),'minuto_util_templo',0)
						this.setcolumn('minuto_util_templo')
					end if
				end if
			end if
		end if
	end if
	
	ll_minutos	= this.getitemnumber(this.getrow(),'minuto_util_templo')
	if ll_minutos > 59 then
		this.setitem(this.getrow(),'minuto_util_templo',0)
		this.accepttext()
	end if
	if ls_columna<>'hora_util_capilla' then
		ll_hora	= this.getitemnumber(this.getrow(),'hora_util_capilla')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 23 then
				this.setitem(this.getrow(),'hora_util_capilla',0)
			end if
		end if
	end if
	if ls_columna<>'minuto_util_capilla' then
		ll_hora	= this.getitemnumber(this.getrow(),'minuto_util_capilla')
		if not isnull(ll_hora) then
			if ll_hora < 0 or ll_hora > 59 then
				this.setitem(this.getrow(),'minuto_util_capilla',0)
			end if
		end if
	end if
	ll_hora			= this.getitemnumber(this.getrow(),'hora_util_templo')
	ll_cod_parque	= this.getitemnumber(this.getrow(),'cod_parque')
	if ll_hora > 0 and ll_cod_parque > 0 then
		SELECT	"FICHA_HORAS_TEMPLO"."HORA_INICIO",   
					"FICHA_HORAS_TEMPLO"."MINUTO_INICIO",   
					"FICHA_HORAS_TEMPLO"."HORA_FINAL",   
					"FICHA_HORAS_TEMPLO"."MINUTO_FINAL",   
					"FICHA_HORAS_TEMPLO"."INTERVALO_MINUTO",   
					"FICHA_HORAS_TEMPLO"."VECES_USO"  
		INTO		:il_hora_ini_templo,   
					:il_min_ini_templo,   
					:il_hora_fin_templo,   
					:il_min_fin_templo,   
					:il_intervalo_templo,   
					:il_veces_templo  
		FROM 	"FICHA_HORAS_TEMPLO"  
		WHERE 	"FICHA_HORAS_TEMPLO"."COD_PARQUE" = :ll_cod_parque   ;
		if ll_hora>23 then
			this.setitem(this.getrow(),'hora_util_templo',0)
			this.accepttext()
		end if
	end if
	ldt_fecha_ini		= this.getitemdatetime(this.getrow(),'fecha_ini_velatorio')
	if not isnull(ldt_fecha_ini) then
		ldt_fecha_fin		= this.getitemdatetime(this.getrow(),'fecha_fin_velatorio')
		ldt_fec_sepult		= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_sepultacion')
		ldt_fecha_antes	= datetime(RelativeDate(date(ldt_fec_sepult), -2),time('00:00:00'))
		if ldt_fecha_ini < ldt_fecha_antes then
			this.setitem(this.getrow(),'fecha_ini_velatorio',ldt_nulo)
		elseif not isnull(ldt_fecha_ini) and not isnull(ldt_fecha_fin) and ldt_fecha_fin <= ldt_fecha_ini then
			this.setitem(this.getrow(),'fecha_fin_velatorio',ldt_nulo)
		elseif ldt_fecha_ini > ldt_fec_sepult then
			this.setitem(this.getrow(),'fecha_fin_velatorio',ldt_nulo)
		elseif ldt_fecha_ini > ldt_fec_sepult then
			this.setitem(this.getrow(),'fecha_ini_velatorio',ldt_nulo)
			this.setitem(this.getrow(),'fecha_fin_velatorio',ldt_nulo)
			this.setitem(this.getrow(),'hora_util_capilla',0)
			this.setitem(this.getrow(),'hora_util_capilla_fin',0)
			this.setitem(this.getrow(),'minuto_util_capilla_fin',0)
			this.setitem(this.getrow(),'minuto_util_capilla',0)
		end if
	end if
	this.accepttext()
end if
end event

event rowfocuschanged;Long	ll_row
ll_row	= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3717
integer height = 2300
long backcolor = 67108864
string text = "  Aranceles"
long tabtextcolor = 33554432
string picturename = "premio_ag_ing_caja.bmp"
long picturemaskcolor = 536870912
cb_beneficios cb_beneficios
cb_crear_cupon cb_crear_cupon
cb_4 cb_4
st_4 st_4
dw_aranceles dw_aranceles
end type

on tabpage_4.create
this.cb_beneficios=create cb_beneficios
this.cb_crear_cupon=create cb_crear_cupon
this.cb_4=create cb_4
this.st_4=create st_4
this.dw_aranceles=create dw_aranceles
this.Control[]={this.cb_beneficios,&
this.cb_crear_cupon,&
this.cb_4,&
this.st_4,&
this.dw_aranceles}
end on

on tabpage_4.destroy
destroy(this.cb_beneficios)
destroy(this.cb_crear_cupon)
destroy(this.cb_4)
destroy(this.st_4)
destroy(this.dw_aranceles)
end on

type cb_beneficios from commandbutton within tabpage_4
integer x = 1509
integer y = 2112
integer width = 434
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Beneficios"
end type

event clicked;gs_base					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base')
gs_serie					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie')
gi_numero				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero')
if gi_numero > 0 then
	if isvalid(w_beneficios_mantenedor) then close(w_beneficios_mantenedor)
	open(w_beneficios_mantenedor)
else
	messagebox("Advertencia","No Registra Número de Contrato a Consultar")
end if
end event

type cb_crear_cupon from commandbutton within tabpage_4
integer x = 2546
integer y = 2112
integer width = 539
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crear Cupon de Pago"
end type

event clicked;Long		ll_cod_parque,ll_count_reg,ll_fila,ll_res,ll_count_rezago
String		ls_sector,ls_sepultura,ls_base,ls_serie,ls_dv,ls_nombre,ls_ap_paterno,ls_ap_materno,ls_tipo_via,ls_direccion,	ls_num_direc,ls_depto_direc,ls_block_direc,	ls_ciudad,&
			ls_comuna,ls_fono,ls_celular,ls_telefono_def,ls_descrip_via,ls_direc_comp
Datetime	ldt_fecha_sepult
Double	ll_numero,ll_rut,ll_monto,ll_monto_ds,ll_cupon,ll_cupon_existe
Date		ldt_fecha_hoy

tab_1.tabpage_3.dw_ficha_sepult.accepttext()
ldt_fecha_hoy		= date(gdt_fec_sistema)
ll_fila					= tab_1.tabpage_3.dw_ficha_sepult.getrow()
ll_cupon_existe		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'numero_cupon')
if isnull(ll_cupon_existe) then ll_cupon_existe=0
if ll_cupon_existe > 0 then
	messagebox("Advertencia","No es posible Generar Cupón, Ya Existente")
else
	ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'cod_parque')
	ls_sector				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'sector')
	ls_sepultura			= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'sepultura')
	ldt_fecha_sepult	= tab_1.tabpage_3.dw_ficha_sepult.getitemdatetime(ll_fila,'fecha_sepultacion')
	SELECT	Count("FICHA_SEPULTACION"."FECHA_SEPULTACION")  
	INTO 		:ll_count_reg  
	FROM 	"FICHA_SEPULTACION"  
	WHERE  ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
			 ( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
			 ( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
			 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )   
	USINg		sqlca;
	if ll_count_reg>0 then
		ls_base				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'base')
		ls_serie				= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'serie')
		ll_numero			= Double(tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'numero'))
		ll_rut					= tab_1.tabpage_2.dw_ant_titular.getitemnumber(ll_fila,'rut_titular')
		ls_dv					= tab_1.tabpage_2.dw_ant_titular.getitemstring(ll_fila,'dv_titular')
		ll_monto				= Double(tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'monto_cancelar'))
		ll_monto_ds			= Double(tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_fila,'valor_derecho_sepultacion_uf'))
		if isnull(ll_monto) then ll_monto=0
		if isnull(ll_monto_ds) then ll_monto_ds=0
		if ll_monto = 0 then
			messagebox("Advertencia","No es posible Generar Cupón, Monto 0")
		elseif 	ll_monto <> ll_monto_ds then
			messagebox("Advertencia","No es posible Generar Cupón, Recuerde solo puede crear por Concepto Derecho Sepultación")
		else
			ll_res					= messagebox("Advertencia","Está Seguro Crear Cupon de Pago Derecho Sepultación",Exclamation!,YesNo!)
			if ll_res=1 then
				SELECT 	Max("CUPONERAS_DETALLE_WEB"."NRO_CUPON")  
				INTO 		:ll_cupon  
				FROM 	"CUPONERAS_DETALLE_WEB"  
				USING	sqlca;
				if isnull(ll_cupon) then ll_cupon=0
				ll_cupon ++
				if isnull(ldt_fecha_sepult) or date(ldt_fecha_sepult)=date('01/01/1900') then ldt_fecha_sepult=datetime(date(gdt_fec_sistema),time('00:00:00'))
				INSERT INTO "CUPONERAS_DETALLE_WEB"  
							( "BASE",   	"SERIE",   	"NUMERO",   	"NRO_CUPON",   	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   		"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"TIPO_MONEDA" )  
				VALUES 	( :ls_base,   :ls_serie,   	:ll_numero,   	:ll_cupon,   			:ll_rut,   	1, 					  	:ldt_fecha_sepult,   	'V',   								'M',   				null,   					:ll_rut,   				null,   				:ll_monto,   								0,   								0,   									0,   										1,   						:ls_dv,   	'2' )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					messagebox("Grabar","Grabación Exitosa Cupón N° "+string(ll_cupon,'###,###,###,###'))
					commit;
					tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_fila,'numero_cupon',ll_cupon)
					tab_1.tabpage_3.dw_ficha_sepult.accepttext()
					if tab_1.tabpage_3.dw_ficha_sepult.update()=1 then
						commit;
					else
						rollback;
					end if
//					SELECT 	  Count("CADENA"."CODIGO")  
//					INTO 		  :ll_count_rezago  
//					FROM 	  "CADENA"  
//					WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
//								( "CADENA"."SERIE" = :ls_serie ) AND  
//								( "CADENA"."NUMERO" = :ll_numero )  ;
//					if ll_count_rezago = 0 then
//						ll_rut				= tab_1.tabpage_2.dw_ant_titular.getitemnumber(tab_1.tabpage_2.dw_ant_titular.getrow(),'rut_titular')
//						ls_dv				= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'dv_titular')
//						ls_nombre		= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'nombre_titular')
//						ls_ap_paterno	= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_paterno_titular')
//						ls_ap_materno	= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'ap_materno_titular')
//						ls_tipo_via		= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'tipo_via_titular')
//						ls_direccion		= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'direccion_titular')
//						ls_num_direc	= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'num_direccion_titular')
//						ls_depto_direc	= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'depto_direccion_titular')
//						ls_block_direc	= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'block_direccion_titular')
//						ls_ciudad			= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_ciudad_titular')
//						ls_comuna		= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'codigo_comuna_titular')
//						ls_fono			= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'fono_titular')
//						ls_celular		= tab_1.tabpage_2.dw_ant_titular.getitemstring(tab_1.tabpage_2.dw_ant_titular.getrow(),'celular_titular')
//						ll_cod_parque	= tab_1.tabpage_3.dw_ficha_sepult.getitemNUMBER(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
//						if isnull(ls_nombre) then ls_nombre='-'
//						if isnull(ls_ap_paterno) then ls_ap_paterno='-'
//						if isnull(ls_ap_materno) then ls_ap_materno='-'
//						if isnull(ls_tipo_via) then ls_tipo_via='0'
//						if isnull(ls_direccion) then ls_direccion='-'
//						if isnull(ls_num_direc) then ls_num_direc='-'
//						if isnull(ls_depto_direc) then ls_depto_direc='-'
//						if isnull(ls_block_direc) then ls_block_direc='-'
//						if isnull(ls_ciudad) then ls_ciudad='0'
//						if isnull(ls_comuna) then ls_comuna='0'
//						if isnull(ls_fono) then ls_fono='-'
//						if isnull(ls_celular) then ls_celular='-'
//						
//						if ls_fono<> '-' then
//							ls_telefono_def		= ls_fono
//						else
//							ls_telefono_def		= ls_celular
//						end if
//						SELECT 	"TIPO_VIA"."DESCRIPCION"  
//						INTO 		:ls_descrip_via  
//						FROM 	"TIPO_VIA"  
//						WHERE 	"TIPO_VIA"."TIPO_VIA" = :ls_tipo_via   ;
//
//						ls_direc_comp	= trim(ls_descrip_via)+' '+ls_direccion+' N° '+ls_num_direc
//						if ls_depto_direc <> '-' then
//							ls_direc_comp	= ls_direc_comp+' D:/ '+ls_depto_direc
//						end if
//						if ls_block_direc <> '-' then
//							ls_direc_comp	= ls_direc_comp+' B:/ '+ls_block_direc
//						end if
//						INSERT INTO "CLIENTE_REZAGO"  
//									( "RUT", 		"BASE",   	"SERIE",   	"NUMERO",   	"NOMBRE",   	"AP_PATERNO",   	"AP_MATERNO",   	"DIRECCION_PART",   	"COMUNA_PART",   	"CIUDAD_PART",   	"TELEFONO_PART",   	"FECHA_CREA",   	"USUARIO",   	"DV",   	"COD_PAGO",   	"FOLIO",   	"FECHA_PAGO",   	"ESTADO",   	"CAJA",   	"FECHA_TRASPASO_REZAGO",   	"USUARIO_GENERA_TRASPASO",   	"COD_PARQUE",   	"MONEDA",   	"ESTADO_SAP",   	"ESTADO_SAP_CONTRATO",   	"NRO_CLIENTE_SAP",   	"FECHA_SAP" )  
//						VALUES 	( :ll_rut,   	:ls_base,   	:ls_serie,   	:ll_numero,   	:ls_nombre,   	:ls_ap_paterno,   	:ls_ap_materno,   	:ls_direc_comp,   			:ls_comuna,   			:ls_ciudad,   			:ls_telefono_def,   	:gdt_fec_sistema,	:gs_user,   		:ls_dv,   	'BE',   				:ll_rut,   		null,   				null,   			null,   		null,   									null,   										:ll_cod_parque,   	'2',   				3,   					0,   									null,   						null )  
//						USING	sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							rollback;
//						end if
//					end if

				else
					rollback;
				end if
			end if
		end if
	else
		messagebox("Advertencia","Debe Grabar Ficha Sepultación antes de Generar Cupón")
	end if
end if
end event

type cb_4 from commandbutton within tabpage_4
integer x = 471
integer y = 2112
integer width = 434
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;String		ls_serie,ls_base
long		ll_fila
Double	ll_numero
if  tab_1.tabpage_3.dw_ficha_sepult.rowcount()>0 then
	ll_fila							= tab_1.tabpage_3.dw_ficha_sepult.getrow()
	ls_base						= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'base')
	ls_serie						= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_fila,'serie')
	ll_numero					= Double(tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_fila,'numero'))
	gs_base						= ls_base
	gs_serie						= ls_serie
	gi_numero					= ll_numero
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			SELECT	"PAGARE_V"."SERIE",   
						"PAGARE_V"."NUMERO",   
						"PAGARE_V"."BASE"  
			INTO 		:ls_serie,   
						:ll_numero,   
						:ls_base  
			FROM 		"PAGARE_V"  
			WHERE  ( "PAGARE_V"."SERIE_P" = :gs_serie ) AND  
					 ( "PAGARE_V"."NUMERO_P" = :gi_numero )   
			USING		sqlca; 
			if not isnull(ls_serie) and ls_serie<>'' and not isnull(ls_base) and ls_base<>'0' and ll_numero>0 then
				messagebox("Advertencia","Recuerde Pagaré seleccionado está Asociado al Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###"))
			else
				messagebox("Advertencia","No Registra Datos Pagaré "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###"))
			end if
//			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
//			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" //Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
		CASE "F"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
end if	
end event

type st_4 from statictext within tabpage_4
integer x = 87
integer y = 40
integer width = 2226
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Aranceles"
boolean focusrectangle = false
end type

type dw_aranceles from datawindow within tabpage_4
integer x = 78
integer y = 160
integer width = 3607
integer height = 1908
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_aranceles_ficha"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string 	ls_columna,ls_cod_parentesco,ls_cod_pago_1,ls_nulo,ls_cod_pago_anterior,ls_cod_pago,ls_cod_pago_2,ls_cod_pago_3,ls_cod_pago_4,ls_cod_pago_5,&
			ls_cod_pago_6,ls_base,ls_serie, ls_cod_mov,ls_cod_movconsulta,ls_uso_velatorio,ls_pasa,ls_uso_templo
double 	ldb_valor_uf_dia,ldb_valor_arancel,ldb_valor_uf,ldb_valor_der,ldb_total,ldb_valor_1,ldb_valor_2,ldb_valor_3,ldb_valor_4,ldb_valor_5,ldb_valor_6,&
			ldb_dscto_1,ldb_dscto_2,ldb_dscto_3,ldb_dscto_4,ldb_dscto_5,ldb_dscto_6,ldb_monto_derecho_sep,ll_numero, ll_valor,ll_monto_cancelar,ll_descuento,&
			ll_suma_valor,ldb_valor,ldb_valor_condolencia,ldb_valor_dscto_be
datetime ldt_fecha_hoy 
Long		ll_cod_parque,ll_sw_derecho,ll_sw_otros_pagos,ll_sw_pago_1,ll_sw_pago_anterior,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,&
			ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,ll_sw_dscto_5,ll_sw_dscto_6,ll_sw_derecha_sep,ll_tot_desc,ll_tot_pago,ll_reg,ll_cod_benef,&
			ll_cod_benef_det,ll_sw_condolencia,ll_count_benef,ll_sum_condolencia,ll_sum_templo_velatorio=0

dw_aranceles.accepttext()
Setnull(ls_nulo)
ls_columna 				= dwo.name
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
SELECT	"TAB_UF"."VALOR_UF"  INTO :ldb_valor_uf_dia  FROM 	"TAB_UF"  WHERE "TAB_UF"."FECHA_UF" = :ldt_fecha_hoy ;
if ls_columna = 'codigo_parentesco' then 
	wf_parentesco()
elseif ls_columna='pago_otro_1' then
	ll_sw_pago_1		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
	ls_cod_pago_1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
	if not isnull(ls_cod_pago_1) then
		if ll_sw_pago_1 = 0 then
			SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
			INTO 		:ldb_valor_arancel  
			FROM 	"CUENTA_CONTABLE_OTROS"  
			WHERE ( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_cod_pago_1 ) AND  
					  ( "CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
					  ( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if ldb_valor_arancel > 100 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',ldb_valor_arancel / ldb_valor_uf_dia)
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',ldb_valor_arancel)
				end if
				dw_aranceles.accepttext()
				dw_aranceles.setfocus()
				dw_aranceles.setcolumn('monto_otro_1')
			end if
		else
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
		end if
		wf_actualizar_calculo(dw_aranceles.getrow())
	end if

elseif ls_columna='pago_otro_2' then
	ll_sw_pago_1				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
	ls_cod_pago_1				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
	if not isnull(ls_cod_pago_1) then
		ls_cod_pago_anterior		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		ls_cod_pago					= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
		if ls_cod_pago_anterior = ls_cod_pago then
			messagebox("Advertencia","Detalle Pago Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('pago_otro_2')
		else
			if ll_sw_pago_1 = 0 then
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_arancel  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE ( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_cod_pago_1 ) AND  
						  ( "CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
						  ( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if ldb_valor_arancel > 100 then
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',ldb_valor_arancel / ldb_valor_uf_dia)
					else
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',ldb_valor_arancel)
					end if
					dw_aranceles.accepttext()
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_otro_2')
				end if
			else
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
			end if
		end if
		wf_actualizar_calculo(dw_aranceles.getrow())
	end if
	
elseif ls_columna='pago_otro_3' then
	ll_sw_pago_3				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
	ls_cod_pago_3				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
	if not isnull(ls_cod_pago_3) then
		ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
		if ls_cod_pago_1 = ls_cod_pago_3 or ls_cod_pago_2 = ls_cod_pago_3 then
			messagebox("Advertencia","Detalle Pago Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('pago_otro_3')
		else
			if ll_sw_pago_1 = 0 then
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_arancel  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE ( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_cod_pago_3 ) AND  
						  ( "CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
						  ( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if ldb_valor_arancel > 100 then
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',ldb_valor_arancel / ldb_valor_uf_dia)
					else
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',ldb_valor_arancel)
					end if
					dw_aranceles.accepttext()
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_otro_3')
				end if
			else
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
			end if
			wf_actualizar_calculo(dw_aranceles.getrow())
		end if
	end if
	
elseif ls_columna='pago_otro_4' then
	ll_sw_pago_4				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
	ls_cod_pago_4				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')
	if not isnull(ls_cod_pago_4) then
		ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
		ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
		if ls_cod_pago_1 = ls_cod_pago_4 or ls_cod_pago_2 = ls_cod_pago_4 or ls_cod_pago_3 = ls_cod_pago_4  then
			messagebox("Advertencia","Detalle Pago Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('pago_otro_4')
		else
			if ll_sw_pago_1 = 0 then
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_arancel  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE ( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_cod_pago_1 ) AND  
						  ( "CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
						  ( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if ldb_valor_arancel > 100 then
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',ldb_valor_arancel / ldb_valor_uf_dia)
					else
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',ldb_valor_arancel)
					end if
					dw_aranceles.accepttext()
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_otro_4')
				end if
			else
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
			end if
			wf_actualizar_calculo(dw_aranceles.getrow())
		end if
	end if
elseif ls_columna='pago_otro_5' then
	ll_sw_pago_5				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
	ls_cod_pago_5				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_5')
	if not isnull(ls_cod_pago_5) then
		ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
		ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
		ls_cod_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')
		if ls_cod_pago_1 = ls_cod_pago_5 or ls_cod_pago_2 = ls_cod_pago_5 or ls_cod_pago_3 = ls_cod_pago_5 or ls_cod_pago_4 = ls_cod_pago_5  then
			messagebox("Advertencia","Detalle Pago Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('pago_otro_5')
		else
			if ll_sw_pago_1 = 0 then
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_arancel  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE ( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_cod_pago_1 ) AND  
						  ( "CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
						  ( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if ldb_valor_arancel > 100 then
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',ldb_valor_arancel / ldb_valor_uf_dia)
					else
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',ldb_valor_arancel)
					end if
					dw_aranceles.accepttext()
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_otro_5')
				end if
			else
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
			end if
			wf_actualizar_calculo(dw_aranceles.getrow())
		end if
	end if
	
elseif ls_columna='pago_otro_6' then
	ll_sw_pago_6				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')
	ls_cod_pago_6				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_6')
	if not isnull(ls_cod_pago_6) then
		ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')
		ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')
		ls_cod_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')
		ls_cod_pago_5			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_5')
		if ls_cod_pago_1 = ls_cod_pago_6 or ls_cod_pago_2 = ls_cod_pago_6 or ls_cod_pago_3 = ls_cod_pago_6 or ls_cod_pago_4 = ls_cod_pago_6  or ls_cod_pago_5 = ls_cod_pago_6 then
			messagebox("Advertencia","Detalle Pago Duplicado")
			dw_aranceles.setfocus()
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
			dw_aranceles.accepttext()
			dw_aranceles.setcolumn('pago_otro_6')
		else
			if ll_sw_pago_1 = 0 then
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ldb_valor_arancel  
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE ( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_cod_pago_1 ) AND  
						  ( "CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
						  ( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if ldb_valor_arancel > 100 then
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',ldb_valor_arancel / ldb_valor_uf_dia)
					else
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',ldb_valor_arancel)
					end if
					dw_aranceles.accepttext()
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_otro_6')
				end if
			else
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
			end if
			wf_actualizar_calculo(dw_aranceles.getrow())
		end if
	end if
elseif ls_columna='sw_pago_liberado' then
	ll_sw_derecho						= long(data)
	if ll_sw_derecho=0 then
		ll_sw_derecha_sep			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_derecho_sepult')
		ls_base							= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base')
		ls_serie							= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie')
		ll_numero						= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero')
		ll_sw_condolencia				= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sw_condolencia')
		ls_uso_velatorio				= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'usar_capilla')
		ls_uso_templo					= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'usar_templo')
		if ll_sw_derecha_sep = 0 then
			ldb_monto_derecho_sep	= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'valor_derecho_sepultacion_uf')
			if ldb_monto_derecho_sep > 0 then
				dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',0)
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1','122')
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',ldb_monto_derecho_sep)
				dw_aranceles.accepttext()
				ll_monto_cancelar		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_cancelar')
				ll_descuento				= ll_monto_cancelar - ldb_monto_derecho_sep
				if ll_descuento > 0 then
					SELECT 	count("TIPO_PROMOCION_ASOCIADOS"."BASE")  
					INTO 		:ll_count_benef  
					FROM 	"TIPO_PROMOCION_ASOCIADOS",  	"BENEFICIOS_COMPLEMENTARIO_DET"  
					WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
								( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
								( ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :ls_base ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :ls_serie ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
								( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" = 'P' ) AND  
								( "BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA" is not null ) )   ;
					if ll_count_benef > 0 then
						dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',0)
						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2','109')
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',ll_descuento)
					else
						dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',0)
						dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2','107')
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',ll_descuento)
					end if
					dw_aranceles.accepttext()
				end if
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
		dw_aranceles.accepttext()
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
end if
if ls_columna='sw_derecho_sepult' then
	ll_sw_pago_1			= long(data)	//dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_derecho_sepult')
	ls_cod_parentesco		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'codigo_parentesco')
	ll_cod_parque			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
	ls_base					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'base')
	ls_serie					= tab_1.tabpage_3.dw_ficha_sepult.GetItemString(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'serie')
	ll_numero				= tab_1.tabpage_3.dw_ficha_sepult.GetItemNumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'numero')
	ll_sw_condolencia		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sw_condolencia')
	ls_uso_velatorio		= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'usar_capilla')
	ls_uso_templo			= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'usar_templo')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'valor_derecho_sepultacion_uf',0)
		ls_cod_parentesco	= dw_aranceles.getitemstring(dw_aranceles.getrow(),'codigo_parentesco')
		ll_cod_parque		= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'cod_parque')
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
				dw_aranceles.setitem(dw_aranceles.getrow(),'sw_derecho_sepult',0)
				SELECT	"PARENTESCO"."ARANCEL_DERECHO_SEPULTACION"  
				INTO 		:ldb_valor_arancel  
				FROM 	"PARENTESCO"  
				WHERE  ( "PARENTESCO"."CODIGO" = :ls_cod_parentesco ) AND  
						   ( "PARENTESCO"."COD_PARQUE" = :ll_cod_parque )   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					dw_aranceles.setitem(dw_aranceles.getrow(),'valor_derecho_sepultacion_uf',ldb_valor_arancel)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_cancelar',ldb_valor_arancel)
					dw_aranceles.accepttext()
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
					dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
					ll_reg							= 0
					ll_sum_condolencia		= 0
					ll_sw_condolencia			= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(tab_1.tabpage_3.dw_ficha_sepult.getrow(),'sw_condolencia')
					ls_uso_velatorio			= tab_1.tabpage_1.dw_ant_fall.getitemstring(tab_1.tabpage_1.dw_ant_fall.getrow(),'usar_capilla')
					DECLARE x2 CURSOR FOR  
					SELECT DISTINCT	"TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO",		"TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE",	"BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA", "CUENTA_CONTABLE_OTROS"."VALOR"
					FROM 	"BENEFICIOS_COMPLEMENTARIO_DET",	"CUENTA_CONTABLE_OTROS",		"TIPO_PROMOCION_ASOCIADOS"  
					WHERE ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
							  ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
							  ( "BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA" = "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) and  
							  (("TIPO_PROMOCION_ASOCIADOS"."BASE" = :ls_base ) AND  
							  ( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :ls_serie ) AND  
							  ( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
							  ( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'BE' ) AND  
							  ( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" = 'P' ) )  
					USING	sqlca;
					open x2;
					DO WHILE sqlca.sqlcode=0
						fetch x2 into :ll_cod_benef, :ll_cod_benef_det, :ls_cod_mov, :ll_valor;
						if not isnull(ls_cod_mov) and ll_valor > 0 then
							if ( ls_uso_velatorio = 'N' and ll_cod_benef=4 and ll_cod_benef_det=4 ) or ( ls_uso_velatorio = 'N' and ll_cod_benef=6 and ll_cod_benef_det=14 ) then
								ls_pasa		= 'N'
							elseif ( ll_cod_benef=4 and ll_cod_benef_det=2 ) or (ll_cod_benef=6 and ll_cod_benef_det=15 ) then
								ls_pasa		= 'S'
							else
								ls_pasa		= 'S'
							end if
//							if ( ll_sw_condolencia = 1 and ll_cod_benef=4 and ll_cod_benef_det=2 ) or ( ll_sw_condolencia = 1 and ll_cod_benef=6 and ll_cod_benef_det=15 ) then
//								ls_pasa		= 'N'
//							elseif ( ls_uso_velatorio = 'N' and ll_cod_benef=4 and ll_cod_benef_det=4 ) or ( ls_uso_velatorio = 'N' and ll_cod_benef=6 and ll_cod_benef_det=14 ) then
//								ls_pasa		= 'N'
//							else
//								ls_pasa		= 'S'
//							end if
							if ls_pasa = 'S' then
								if ls_cod_mov = '21' then 
									ll_sum_condolencia ++
									ldb_valor_condolencia	= ll_valor
								elseif ls_cod_mov = '29' then 
									ll_sum_templo_velatorio ++
								end if
								ll_reg ++
								ll_suma_valor	= ll_suma_valor + ll_valor
								if ll_reg = 1 and isnull(dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')) then
									messagebox("Advertencia","Se Asignará Beneficio(s) Automáticamente, según estipulado por Contrato")
									dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',0)
									dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_cod_mov)
									dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',ll_valor)
									dw_aranceles.accepttext()
								end if
								if ll_reg = 2 and isnull(dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_2')) then
									dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',0)
									dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_cod_mov)
									dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',ll_valor)
									dw_aranceles.accepttext()
								end if
								if ll_reg = 3 and isnull(dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_3')) then
									dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',0)
									dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_cod_mov)
									dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',ll_valor)
									dw_aranceles.accepttext()
								end if
								if ll_reg = 4 and isnull(dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_4')) then
									dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',0)
									dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_cod_mov)
									dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',ll_valor)
									dw_aranceles.accepttext()
								end if
								if ll_reg = 5 and isnull(dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_5')) then
									dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',0)
									dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_cod_mov)
									dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',ll_valor)
									dw_aranceles.accepttext()
								end if
								if ll_reg = 6 and isnull(dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_6')) then
									dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',0)
									dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_cod_mov)
									dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',ll_valor)
									dw_aranceles.accepttext()
								end if
							end if
						end if
						setnull(ll_cod_benef_det);setnull(ll_cod_benef);setnull(ls_cod_mov);setnull(ll_valor)
					LOOP
					close x2;
					if ll_reg >= 0 then
						SELECT DISTINCT	"BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA"
						INTO		:ls_cod_movconsulta
						FROM 	"BENEFICIOS_COMPLEMENTARIO_DET",	"TIPO_PROMOCION_ASOCIADOS"  
						WHERE ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
								  ( "TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" ) and  
								  ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :ls_base ) AND  
								  ( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :ls_serie ) AND  
								  ( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
								  ( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" = 'P' ) AND
								  ( "BENEFICIOS_COMPLEMENTARIO_DET"."COD_MOV_CONSULTA" = 'M' )  
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							if ll_sum_condolencia > 0 then
								ll_suma_valor			= ll_suma_valor - ldb_valor_condolencia
								ldb_valor_dscto_be	= ldb_valor_arancel + ldb_valor_condolencia
							else
								ldb_valor_dscto_be	= ldb_valor_arancel
							end if
							dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',0)
							dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1','122')
							dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',ldb_valor_dscto_be)
							dw_aranceles.accepttext()
						end if
						if ll_suma_valor > 0 then
							dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',0)
							dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2','109')
							dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',ll_suma_valor )////NUEVO
							dw_aranceles.accepttext()
						end if
						dw_aranceles.setitem(dw_aranceles.getrow(),'valor_derecho_sepultacion_uf',ldb_valor_arancel)
						dw_aranceles.setitem(dw_aranceles.getrow(),'monto_cancelar',ldb_valor_arancel)
						dw_aranceles.accepttext()
						dw_aranceles.setfocus()
						dw_aranceles.setcolumn('valor_derecho_sepultacion_uf')
					end if
					if (ll_sw_condolencia = 0 and ll_reg = 0) or (ll_sw_condolencia = 1 and ll_reg > 0) then
						SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
						INTO 		:ldb_valor
						FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"CUENTA_CONTABLE_OTROS"  
						WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "CUENTA_CONTABLE_OTROS"."TIPO_COB" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = "CUENTA_CONTABLE_OTROS"."ESTADO_REG" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '21' ) AND  
									( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) 
						USING	sqlca;
						if sqlca.sqlcode=0 then
							dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',0)
							dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1','21')
							dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',ldb_valor)
							
							
							/////////////aca voy
						end if
						dw_aranceles.accepttext()
					end if
					if ls_uso_velatorio = 'S' and ll_reg >= 0 and ll_sum_templo_velatorio=0 then
						SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
						INTO 		:ldb_valor
						FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"CUENTA_CONTABLE_OTROS"  
						WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "CUENTA_CONTABLE_OTROS"."TIPO_COB" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = "CUENTA_CONTABLE_OTROS"."ESTADO_REG" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '59' ) AND  
									( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) 
						USING	sqlca;
						if sqlca.sqlcode=0 then
							if dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1') = 1 then
								dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',0)
								dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1','59')
								dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',ldb_valor)
							elseif dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2') = 1 then
								dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',0)
								dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2','59')
								dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',ldb_valor)
							elseif dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3') = 1 then
								dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',0)
								dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3','59')
								dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',ldb_valor)
							elseif dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4') = 1 then
								dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',0)
								dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4','59')
								dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',ldb_valor)
							elseif dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5') = 1 then
								dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',0)
								dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5','59')
								dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',ldb_valor)
							end if
							dw_aranceles.accepttext()
						end if
					end if
					if ls_uso_templo = 'S' and ll_reg >= 0 and ll_sum_templo_velatorio=0 then
						SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
						INTO 		:ldb_valor
						FROM 	"FICHA_CUENTA_CONTABLE_OTROS",  	"CUENTA_CONTABLE_OTROS"  
						WHERE 	( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_COB" = "CUENTA_CONTABLE_OTROS"."TIPO_COB" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."ESTADO_REG" = "CUENTA_CONTABLE_OTROS"."ESTADO_REG" ) and  
									( "FICHA_CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '49' ) AND  
									( "FICHA_CUENTA_CONTABLE_OTROS"."TIPO_FICHA" = 'FS' ) 
						USING	sqlca;
						if sqlca.sqlcode=0 then
							if dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1') = 1 then
								dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',0)
								dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1','49')
								dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',ldb_valor)
							elseif dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2') = 1 then
								dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',0)
								dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2','49')
								dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',ldb_valor)
							elseif dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3') = 1 then
								dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',0)
								dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3','49')
								dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',ldb_valor)
							elseif dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4') = 1 then
								dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',0)
								dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4','49')
								dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',ldb_valor)
							elseif dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5') = 1 then
								dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',0)
								dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5','49')
								dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',ldb_valor)
							end if
							dw_aranceles.accepttext()
						end if
					end if
					wf_actualizar_calculo(dw_aranceles.getrow())
				end if
			end if	
		else
			messagebox("Advertencia","Debe Ingresar Parque en Ficha de Sepultación")
		end if
	else
		dw_aranceles.setitem(dw_aranceles.getrow(),'valor_derecho_sepultacion_uf',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	dw_aranceles.accepttext()
	wf_actualizar_calculo(dw_aranceles.getrow())
	
elseif ls_columna='sw_pago_1' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
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
	end if
	dw_aranceles.accepttext()
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_2' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	else
		ll_sw_pago_anterior		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
		ls_cod_pago_anterior		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		if ll_sw_pago_anterior = 1 then
			messagebox("Advertencia","Selección Incorrecta, debe ingresar Item Anterior")
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
			dw_aranceles.setcolumn('sw_pago_1')
		end if
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_3' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_4' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_5' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_6' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_1' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
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
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())

elseif ls_columna='sw_dscto_2' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
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
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())

elseif ls_columna='sw_dscto_3' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
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
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_4' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_5' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_6' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_liberado',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='dscto_otro_1' then
	ll_sw_pago_1		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
	ls_cod_pago_1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
	if wf_validar_detalle_dscto(ls_cod_pago_1) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_1) then
			if ll_sw_pago_1 = 0 then
				dw_aranceles.setfocus()
				dw_aranceles.setcolumn('monto_dscto_1')
			else
				dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
			end if
			wf_actualizar_calculo(dw_aranceles.getrow())
		end if
	end if
elseif ls_columna='dscto_otro_2' then
	ll_sw_pago_1				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
	ls_cod_pago_1				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
	if wf_validar_detalle_dscto(ls_cod_pago_1) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_1) then
			ls_cod_pago_anterior		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
			ls_cod_pago					= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
			if ls_cod_pago_anterior = ls_cod_pago then
				messagebox("Advertencia","Detalle Descuento Duplicado")
				dw_aranceles.setfocus()
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
				dw_aranceles.accepttext()
				dw_aranceles.setcolumn('dscto_otro_2')
			else
				if ll_sw_pago_1 = 0 then
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_dscto_2')
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
				end if
			end if
			wf_actualizar_calculo(dw_aranceles.getrow())
		end if
	end if
elseif ls_columna='dscto_otro_3' then
	ll_sw_pago_3				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
	ls_cod_pago_3				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
	if wf_validar_detalle_dscto(ls_cod_pago_3) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_3) then
			ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
			ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
			if ls_cod_pago_1 = ls_cod_pago_3 or ls_cod_pago_2 = ls_cod_pago_3 then
				messagebox("Advertencia","Detalle Descuento Duplicado")
				dw_aranceles.setfocus()
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
				dw_aranceles.accepttext()
				dw_aranceles.setcolumn('monto_dscto_3')
			else
				if ll_sw_pago_1 = 0 then
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_dscto_3')
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
				end if
				wf_actualizar_calculo(dw_aranceles.getrow())
			end if
		end if
	end if
elseif ls_columna='dscto_otro_4' then
	ll_sw_pago_4				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
	ls_cod_pago_4				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
	if wf_validar_detalle_dscto(ls_cod_pago_4) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_4) then
			ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
			ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
			ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
			if ls_cod_pago_1 = ls_cod_pago_4 or ls_cod_pago_2 = ls_cod_pago_4 or ls_cod_pago_3 = ls_cod_pago_4  then
				messagebox("Advertencia","Detalle Descuento Duplicado")
				dw_aranceles.setfocus()
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
				dw_aranceles.accepttext()
				dw_aranceles.setcolumn('monto_dscto_4')
			else
				if ll_sw_pago_1 = 0 then
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_dscto_4')
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
				end if
				wf_actualizar_calculo(dw_aranceles.getrow())
			end if
		end if
	end if
elseif ls_columna='dscto_otro_5' then
	ll_sw_pago_5				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	ls_cod_pago_5				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_5')
	if wf_validar_detalle_dscto(ls_cod_pago_5) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_5) then
			ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
			ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
			ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
			ls_cod_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
			if ls_cod_pago_1 = ls_cod_pago_5 or ls_cod_pago_2 = ls_cod_pago_5 or ls_cod_pago_3 = ls_cod_pago_5 or ls_cod_pago_4 = ls_cod_pago_5  then
				messagebox("Advertencia","Detalle Descuento Duplicado")
				dw_aranceles.setfocus()
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
				dw_aranceles.accepttext()
				dw_aranceles.setcolumn('monto_dscto_5')
			else
				if ll_sw_pago_1 = 0 then
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_dscto_5')
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
				end if
				wf_actualizar_calculo(dw_aranceles.getrow())
			end if
		end if
	end if
elseif ls_columna='dscto_otro_6' then
	ll_sw_pago_6				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	ls_cod_pago_6				= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_6')
	if wf_validar_detalle_dscto(ls_cod_pago_6) = 'N' then
		messagebox("Advertencia","Descuento No Corresponde")
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
		dw_aranceles.accepttext()
	else
		if not isnull(ls_cod_pago_6) then
			ls_cod_pago_1			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
			ls_cod_pago_2			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
			ls_cod_pago_3			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
			ls_cod_pago_4			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
			ls_cod_pago_5			= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_5')
			if ls_cod_pago_1 = ls_cod_pago_6 or ls_cod_pago_2 = ls_cod_pago_6 or ls_cod_pago_3 = ls_cod_pago_6 or ls_cod_pago_4 = ls_cod_pago_6  or ls_cod_pago_5 = ls_cod_pago_6 then
				messagebox("Advertencia","Detalle Descuento Duplicado")
				dw_aranceles.setfocus()
				dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
				dw_aranceles.accepttext()
				dw_aranceles.setcolumn('dscto_otro_6')
			else
				if ll_sw_pago_1 = 0 then
					dw_aranceles.setfocus()
					dw_aranceles.setcolumn('monto_dscto_6')
				else
					dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
				end if
				wf_actualizar_calculo(dw_aranceles.getrow())
			end if
		end if
	end if
end if
if ls_columna='sw_derecho_sepult' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_derecho_sepult')
	if ll_sw_pago_1 = 0 then
//		dw_aranceles.setitem(dw_aranceles.getrow(),'valor_derecho_sepultacion_uf',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_1' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_2' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_2')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	else
		ll_sw_pago_anterior		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_1')
		ls_cod_pago_anterior		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'pago_otro_1')
		if ll_sw_pago_anterior = 1 then
			messagebox("Advertencia","Selección Incorrecta, debe ingresar Item Anterior")
			dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
			dw_aranceles.setcolumn('sw_pago_1')
		end if
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_3' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_3')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_4' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_4')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_5' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_5')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_pago_6' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_pago_6')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_1' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
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
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_2' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
	if ll_sw_pago_1 = 0 then
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
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_3' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
	if ll_sw_pago_1 = 0 then
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
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_4' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_5' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
elseif ls_columna='sw_dscto_6' then
	ll_sw_pago_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
	if ll_sw_pago_1 = 0 then
		dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
		dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
end if
dw_aranceles.accepttext()
if ls_columna='valor_derecho_sepultacion_uf' or ls_columna='monto_otro_1' or ls_columna='monto_otro_2' or ls_columna='monto_otro_3' or &
	ls_columna='monto_otro_4' or ls_columna='monto_otro_5' or ls_columna='monto_otro_6' or ls_columna='monto_dscto_1' or ls_columna='monto_dscto_2' or &
	ls_columna='monto_dscto_3' or ls_columna='monto_dscto_4' or ls_columna='monto_dscto_5' or ls_columna='monto_dscto_6' then
	ll_sw_dscto_1		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
	ll_sw_dscto_2		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
	ll_sw_dscto_3		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
	ll_sw_dscto_4		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
	ll_sw_dscto_5		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
	ll_sw_dscto_6		= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
	ll_tot_desc			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_dscto_total_peso') * -1
	ll_tot_pago			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_total_otros')
	if ls_columna='monto_dscto_1' then
		ldb_dscto_1		= double(data)
		if (ldb_dscto_1 < 0 or ldb_dscto_1 > 1000) and ll_sw_dscto_1=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_1')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_1')
		end if
		il_modif1 ++
	elseif ls_columna='monto_dscto_2' then
		ldb_dscto_2		= double(data)
		if (ldb_dscto_2 < 0 or ldb_dscto_2 > 1000) and ll_sw_dscto_2=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_2')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_2')
		end if
		il_modif2 ++
	elseif ls_columna='monto_dscto_3' then
		ldb_dscto_3		= double(data)
		if (ldb_dscto_3 < 0 or ldb_dscto_3 > 1000) and ll_sw_dscto_3=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_3')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_3')
		end if
		il_modif3 ++
	elseif ls_columna='monto_dscto_4' then
		ldb_dscto_4		= double(data)
		if (ldb_dscto_4 < 0 or ldb_dscto_4 > 1000) and ll_sw_dscto_4=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_4')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_4')
		end if
		il_modif4 ++
	elseif ls_columna='monto_dscto_5' then
		ldb_dscto_5		= double(data)
		if (ldb_dscto_5 < 0 or ldb_dscto_5 > 1000) and ll_sw_dscto_5=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_5')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_5')
		end if
		il_modif5 ++
	elseif ls_columna='monto_dscto_6' then
		ldb_dscto_6		= double(data)
		if (ldb_dscto_6 < 0 or ldb_dscto_6 > 1000) and ll_sw_dscto_6=0 then
			messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_6')
		elseif ll_tot_desc > ll_tot_pago then
			messagebox("Advertencia","Recuerde Valor Descuento NO puede ser Mayor al Monto a Cancelar")
			dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
			dw_aranceles.setfocus()
			dw_aranceles.setcolumn('monto_dscto_6')
		end if
		il_modif6 ++
	end if
	wf_actualizar_calculo(dw_aranceles.getrow())
end if
dw_aranceles.accepttext()
end event

event rowfocuschanged;Long	ll_row
ll_row	= getrow()
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

event clicked;Long		ll_row
ll_row						= row
if ll_row > 0 then
	tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_row)
	tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_row)
	tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_row)
	tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_row)
end if
end event

event itemfocuschanged;String		ls_columna,ls_nulo,ls_cod_pago_1,ls_cod_pago_2,ls_cod_pago_3,ls_cod_pago_4,ls_cod_pago_5,ls_cod_pago_6,ls_cod_dscto_1,ls_cod_dscto_2,ls_cod_dscto_3,ls_cod_dscto_4,&
			ls_cod_dscto_5,ls_cod_dscto_6
Long		ll_sw_pago_1,ll_sw_pago_anterior,ll_sw_pago_2,ll_sw_pago_3,ll_sw_pago_4,ll_sw_pago_5,ll_sw_pago_6,ll_sw_dscto_1,ll_sw_dscto_2,ll_sw_dscto_3,ll_sw_dscto_4,&
			ll_sw_dscto_5,ll_sw_dscto_6,ll_tot_desc,ll_tot_pago
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
if ll_sw_pago_1 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_2 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_3 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_4 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_5 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
elseif ll_sw_pago_6 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	
elseif ll_sw_dscto_1 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_2 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_3 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_4 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_5 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
elseif ll_sw_dscto_6 = 1  then
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
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
if ll_sw_pago_1=0 and isnull(ls_cod_pago_1) and ls_columna <> 'sw_pago_1' and ls_columna <> 'pago_otro_1' and ls_columna <> 'monto_otro_1' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
elseif ll_sw_pago_2=0 and isnull(ls_cod_pago_2) and ls_columna <> 'sw_pago_2' and ls_columna <> 'pago_otro_2' and ls_columna <> 'monto_otro_2' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
elseif ll_sw_pago_3=0 and isnull(ls_cod_pago_3) and ls_columna <> 'sw_pago_3' and ls_columna <> 'pago_otro_3' and ls_columna <> 'monto_otro_3' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
elseif ll_sw_pago_4=0 and isnull(ls_cod_pago_4) and ls_columna <> 'sw_pago_4' and ls_columna <> 'pago_otro_4' and ls_columna <> 'monto_otro_4' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
elseif ll_sw_pago_5=0 and isnull(ls_cod_pago_5) and ls_columna <> 'sw_pago_5' and ls_columna <> 'pago_otro_5' and ls_columna <> 'monto_otro_5' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ll_sw_pago_6=0 and isnull(ls_cod_pago_6) and ls_columna <> 'sw_pago_6' and ls_columna <> 'pago_otro_6' and ls_columna <> 'monto_otro_6' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
	
elseif ls_cod_dscto_1 = ls_cod_dscto_2 and not isnull(ls_cod_dscto_1) and not isnull(ls_cod_dscto_2) then
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

if ll_sw_pago_1=0 and isnull(ls_cod_pago_1) and ls_columna <> 'sw_pago_1' and ls_columna <> 'pago_otro_1' and ls_columna <> 'monto_otro_1' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_1',0)
elseif ll_sw_pago_2=0 and isnull(ls_cod_pago_2) and ls_columna <> 'sw_pago_2' and ls_columna <> 'pago_otro_2' and ls_columna <> 'monto_otro_2' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_2',0)
elseif ll_sw_pago_3=0 and isnull(ls_cod_pago_3) and ls_columna <> 'sw_pago_3' and ls_columna <> 'pago_otro_3' and ls_columna <> 'monto_otro_3' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_3',0)
elseif ll_sw_pago_4=0 and isnull(ls_cod_pago_4) and ls_columna <> 'sw_pago_4' and ls_columna <> 'pago_otro_4' and ls_columna <> 'monto_otro_4' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_4',0)
elseif ll_sw_pago_5=0 and isnull(ls_cod_pago_5) and ls_columna <> 'sw_pago_5' and ls_columna <> 'pago_otro_5' and ls_columna <> 'monto_otro_5' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
elseif ll_sw_pago_6=0 and isnull(ls_cod_pago_6) and ls_columna <> 'sw_pago_6' and ls_columna <> 'pago_otro_6' and ls_columna <> 'monto_otro_6' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
	
elseif ll_sw_dscto_1=0 and isnull(ls_cod_dscto_1) and ls_columna <> 'sw_dscto_1' and ls_columna <> 'dscto_otro_1' and ls_columna <> 'monto_dscto_1' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_1',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
elseif ll_sw_dscto_2=0 and isnull(ls_cod_dscto_2) and ls_columna <> 'sw_dscto_2' and ls_columna <> 'dscto_otro_2' and ls_columna <> 'monto_dscto_2' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_2',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
elseif ll_sw_dscto_3=0 and isnull(ls_cod_dscto_3) and ls_columna <> 'sw_dscto_3' and ls_columna <> 'dscto_otro_3' and ls_columna <> 'monto_dscto_3' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_3',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
elseif ll_sw_dscto_4=0 and isnull(ls_cod_dscto_4) and ls_columna <> 'sw_dscto_4' and ls_columna <> 'dscto_otro_4' and ls_columna <> 'monto_dscto_4' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_4',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
elseif ll_sw_dscto_5=0 and isnull(ls_cod_dscto_5) and ls_columna <> 'sw_dscto_5' and ls_columna <> 'dscto_otro_5' and ls_columna <> 'monto_dscto_5' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
elseif ll_sw_dscto_6=0 and isnull(ls_cod_dscto_6) and ls_columna <> 'sw_dscto_6' and ls_columna <> 'dscto_otro_6' and ls_columna <> 'monto_dscto_6' then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
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
elseif ll_sw_pago_5 = 0 and ll_sw_pago_4=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_pago_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'pago_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_otro_6',0)
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
	
elseif ll_sw_dscto_6 = 0 and ll_sw_dscto_5=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
elseif ll_sw_dscto_5 = 0 and ll_sw_dscto_4=1 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_5',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setitem(dw_aranceles.getrow(),'sw_dscto_6',1)
	dw_aranceles.setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
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
end if
dw_aranceles.accepttext()
ll_sw_dscto_1			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_1')
ll_sw_dscto_2			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_2')
ll_sw_dscto_3			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_3')
ll_sw_dscto_4			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_4')
ll_sw_dscto_5			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_5')
ll_sw_dscto_6			= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'sw_dscto_6')
ldb_dscto_1				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_1')
ldb_dscto_2				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_2')
ldb_dscto_3				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_3')
ldb_dscto_4				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_4')
ldb_dscto_5				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_5')
ldb_dscto_6				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'monto_dscto_6')

ll_tot_desc				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_dscto_total_peso') * -1
ll_tot_pago				= dw_aranceles.getitemnumber(dw_aranceles.getrow(),'c_total_otros')

if (ldb_dscto_6 < 0 or ldb_dscto_6 > 1000) and ll_sw_dscto_6=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_6')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_6) or ldb_dscto_6<>0) and il_modif6 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_6')
	il_modif6				= 0
end if
dw_aranceles.accepttext()
if (ldb_dscto_5 < 0 or ldb_dscto_5 > 1000) and ll_sw_dscto_5=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_5')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_5) or ldb_dscto_5<>0) and il_modif5 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_5')
	il_modif5				= 0
end if
dw_aranceles.accepttext()
if (ldb_dscto_4 < 0 or ldb_dscto_4 > 1000) and ll_sw_dscto_4=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_4')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_4) or ldb_dscto_4<>0) and il_modif4 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_4')
	il_modif4				= 0
end if
dw_aranceles.accepttext()
if (ldb_dscto_3 < 0 or ldb_dscto_3 > 1000) and ll_sw_dscto_3=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_3')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_3) or ldb_dscto_3<>0) and il_modif3 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_3')
	il_modif3				= 0
end if
dw_aranceles.accepttext()
if (ldb_dscto_2 < 0 or ldb_dscto_2 > 1000) and ll_sw_dscto_2=0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_2')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_2) or ldb_dscto_2<>0) and il_modif2 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_2')
	il_modif2				= 0
end if
dw_aranceles.accepttext()
if (ldb_dscto_1 < 0 or ldb_dscto_1 > 1000) and ll_sw_dscto_1=0 then
//	messagebox("Advertencia","Recuerde Ingresar Valor Descuento en U.F. y Mayor a CERO")
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_1')
elseif ll_tot_desc > ll_tot_pago and (not isnull(ldb_dscto_1) or ldb_dscto_1<>0) and il_modif1 > 0 then
	dw_aranceles.setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	dw_aranceles.setfocus()
	dw_aranceles.setcolumn('monto_dscto_1')
	il_modif1				= 0
end if
dw_aranceles.accepttext()

ls_cod_dscto_1		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_1')
ls_cod_dscto_2		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_2')
ls_cod_dscto_3		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_3')
ls_cod_dscto_4		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_4')
ls_cod_dscto_5		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_5')
ls_cod_dscto_6		= dw_aranceles.getitemstring(dw_aranceles.getrow(),'dscto_otro_6')
if not isnull(ls_cod_dscto_1) then
	if wf_validar_detalle_dscto(ls_cod_dscto_1) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_1',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_1',0)
	end if
end if
if not isnull(ls_cod_dscto_2) then
	if wf_validar_detalle_dscto(ls_cod_dscto_2) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_2',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_2',0)
	end if
end if
if not isnull(ls_cod_dscto_3) then
	if wf_validar_detalle_dscto(ls_cod_dscto_3) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_3',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_3',0)
	end if
end if
if not isnull(ls_cod_dscto_4) then
	if wf_validar_detalle_dscto(ls_cod_dscto_4) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_4',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_4',0)
	end if
end if
if not isnull(ls_cod_dscto_5) then
	if wf_validar_detalle_dscto(ls_cod_dscto_5) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_5',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_5',0)
	end if
end if
if not isnull(ls_cod_dscto_6) then
	if wf_validar_detalle_dscto(ls_cod_dscto_6) = 'N' then
		dw_aranceles.Setitem(dw_aranceles.getrow(),'dscto_otro_6',ls_nulo)
		dw_aranceles.Setitem(dw_aranceles.getrow(),'monto_dscto_6',0)
	end if
end if
dw_aranceles.accepttext()
wf_actualizar_calculo(dw_aranceles.getrow())	
dw_aranceles.accepttext()
end event

type cb_cerrar from commandbutton within w_ingreso_ficha_sepultacion_bkp
integer x = 3483
integer y = 2512
integer width = 315
integer height = 100
integer taborder = 150
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_ficha_sepultacion)
end event

type gb_1 from groupbox within w_ingreso_ficha_sepultacion_bkp
integer x = 2880
integer y = 2460
integer width = 507
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

type gb_2 from groupbox within w_ingreso_ficha_sepultacion_bkp
integer x = 654
integer y = 2460
integer width = 727
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

type cb_carta_lapida from commandbutton within w_ingreso_ficha_sepultacion_bkp
integer x = 1499
integer y = 2512
integer width = 681
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Carta &Autoriza Grab.Lápida"
end type

event clicked;String	ls_sector,ls_sepultura,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_dv_tit,ls_direc_tit,ls_num_dir_tit,&
			ls_dpto_dir_tit,ls_block_dir_tit,ls_villa_tit,ls_sector_tit,ls_numero_tecni,ls_nombre_fall,ls_ap_pat_fall,&
			ls_ap_mat_fall,ls_base,ls_serie,ls_dv_fall,ls_tipo_via_tit,ls_fono_titular,ls_fono_com_tit,ls_primera_sepultura,&
			ls_nom_comp_fall,ls_nom_fall,ls_pat_fall
Long		ll_cod_parque,ll_row,ll_resp,ll_rut_tit,ll_capacidad,ll_hora_sepult,ll_minuto_sepult,ll_funeraria,ll_count,&
			ll_rut_fall,ll_indi,ll_parque,ll_cod_imagen,ll_tot_reg,ll_fila,ll_count_reg,ll_cant_sepultados,&
			ll_row_reg
Double	ll_numero
Datetime	ldt_fecha_hoy,ldt_fech_sepult,ldt_fec_nac,ldt_fec_defun

ll_row												= tab_1.tabpage_3.dw_ficha_sepult.getrow()
ls_sector											= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sector')
ls_sepultura										= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sepultura')
ll_cod_parque									= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_row,'cod_parque')
ls_nom_fall										= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_row,'nombre_fallecido')
ls_pat_fall										= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_row,'ap_paterno_fall')
if tab_1.tabpage_3.dw_ficha_sepult.rowcount()>0 and ll_row>0 and not isnull(ls_sector) and &
	not isnull(ls_sepultura) and ll_cod_parque>0 then
	if isvalid(w_sol_carta_autoriza_grab_lapida) then close(w_sol_carta_autoriza_grab_lapida)
	open(w_sol_carta_autoriza_grab_lapida)
	w_sol_carta_autoriza_grab_lapida.dw_parque.enabled	= false
	w_sol_carta_autoriza_grab_lapida.dw_buscar.enabled	= false
	w_sol_carta_autoriza_grab_lapida.pb_ok.enabled		= false
//	w_sol_carta_autoriza_grab_lapida.cb_limpiar.enabled	= false
//	w_sol_carta_autoriza_grab_lapida.cb_limpiar.enabled	= false
//	w_sol_carta_autoriza_grab_lapida.cb_buscar.enabled	= false
	w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.cb_buscar.enabled	= false
	w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.cb_limpiar.enabled	= false
	if w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)>0 then
		w_sol_carta_autoriza_grab_lapida.dw_parque.reset()
		w_sol_carta_autoriza_grab_lapida.dw_parque.insertrow(0)
		w_sol_carta_autoriza_grab_lapida.dw_parque.setitem(1,'cod_parque',ll_cod_parque)
		w_sol_carta_autoriza_grab_lapida.dw_buscar.reset()
		w_sol_carta_autoriza_grab_lapida.dw_buscar.getchild('sepultura',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.reset()
		idw_detalle6.insertrow(0)
		
		w_sol_carta_autoriza_grab_lapida.dw_buscar.getchild('sector',idw_detalle5)
		idw_detalle5.reset()
		idw_detalle5.insertrow(0)
	
		w_sol_carta_autoriza_grab_lapida.dw_buscar.insertrow(0)
		w_sol_carta_autoriza_grab_lapida.dw_buscar.setitem(1,'sector',ls_sector)
		w_sol_carta_autoriza_grab_lapida.dw_buscar.setitem(1,'sepultura',ls_sepultura)
		ll_row_reg	= w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.dw_lista.Find("estado_reg <> 'G'", 1, w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.dw_lista.RowCount())
		if ll_row_reg > 0 then
			w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.cb_grabar.enabled	= true
			ll_row_reg	= w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.dw_lista.Find("nombre_fallecido='"+ls_nom_fall+"' and apellido_paterno_fall='"+ls_pat_fall+"'", 1, w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.dw_lista.RowCount())
			if ll_row_reg > 0 then
				w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.dw_lista.scrolltorow(ll_row_reg)
			end if
		else
			w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.cb_grabar.enabled	= false
		end if
		w_sol_carta_autoriza_grab_lapida.pb_ok.triggerevent(Clicked!)
		w_sol_carta_autoriza_grab_lapida.tab_1.tabpage_1.dw_lista.setfocus()
		
	else
		close(w_sol_carta_autoriza_grab_lapida)
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
				SELECT	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CODIGO_FUNERARIA",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."FECHA_DEFUNCION",	"FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",	"FICHA_SEPULTACION"."RUT_FALLECIDO",	"FICHA_SEPULTACION"."DV_FALLECIDO",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."NUMERO_TECNICO",	"FICHA_SEPULTACION"."CAPACIDAD",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."NOMBRE_TITULAR",	"FICHA_SEPULTACION"."AP_PATERNO_TITULAR",	"FICHA_SEPULTACION"."AP_MATERNO_TITULAR",	"FICHA_SEPULTACION"."DIRECCION_TITULAR",	"FICHA_SEPULTACION"."NUM_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."DEPTO_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."BLOCK_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."POBLACION_VILLA_TITULAR",	"FICHA_SEPULTACION"."SECTOR_TITULAR",	"FICHA_SEPULTACION"."FONO_TITULAR",	"FICHA_SEPULTACION"."CANTIDAD_SEPULTADOS",	"FICHA_SEPULTACION"."RUT_TITULAR",	"FICHA_SEPULTACION"."DV_TITULAR",	"FICHA_SEPULTACION"."TIPO_VIA_TITULAR",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO"
				FROM 		"FICHA_SEPULTACION"  
				WHERE  ( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
						 ( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
						 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )   
				USING		SQLCA;
				open X1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch x1 into :ldt_fech_sepult, :ll_hora_sepult, :ll_minuto_sepult, :ll_funeraria, :ls_nombre_fall, :ls_ap_pat_fall, :ls_ap_mat_fall, :ldt_fec_defun, :ldt_fec_nac, :ll_rut_fall, :ls_dv_fall, :ls_base,	:ls_serie, :ll_numero, :ls_sector, :ls_sepultura, :ls_numero_tecni, :ll_capacidad, :ll_parque, :ls_nombre_tit, :ls_ap_pat_tit, :ls_ap_mat_tit, :ls_direc_tit, :ls_num_dir_tit, :ls_dpto_dir_tit, :ls_block_dir_tit, :ls_villa_tit, :ls_sector_tit, :ls_fono_titular, :ll_cant_sepultados, :ll_rut_tit, :ls_dv_tit, :ls_tipo_via_tit, :ll_fila ;
						if not isnull(ldt_fech_sepult) then
							ll_indi				= ll_fila
							ldt_fecha_hoy		= ldt_fech_sepult
							ls_nom_comp_fall	= ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
							if len(ls_nom_comp_fall)>27 then
								ls_nom_comp_fall	= mid(ls_nom_comp_fall,1,27)
							end if
							SELECT	"CLIENTE"."FONO_C"  
							INTO 		:ls_fono_com_tit  
							FROM 		"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   ;
		
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
										 ( "FALLECIDOS"."COD_PARQUE" = :ll_parque )   
								USING		sqlca;
								if ll_count_reg>1 then
									ll_cod_imagen	= 99
								else
									ll_cod_imagen	= 0
								end if
							end if
							if ll_cant_sepultados>0 then
								ls_primera_sepultura	= 'N'
							else
								ls_primera_sepultura	= 'S'
							end if
							SELECT 	MAX("FICHA_CARTA_SEPULTACION"."FOLIO")  
							INTO 		:ll_count  
							FROM 		"FICHA_CARTA_SEPULTACION"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							
							INSERT INTO "FICHA_CARTA_SEPULTACION"  
										 ( "FECHA_CARTA",		"NOMBRE_TITULAR",	"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"DIRECCION_TITULAR",	"NUMERO_DIRECCION_TITULAR",	"DEPTO_DIRECCION_TITULAR",	"BLOCK_DIRECCION_TITULAR",	"POBLACION_VILLA_TITULAR",	"SECTOR_TITULAR",	"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION",	"CODIGO_FUNERARIA",	"FOLIO",		"BASE",	  	"SERIE",		"NUMERO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"CORRELATIVO",		"COD_PARQUE",	"TIPO_FICHA",	"TIPO_VIA_TITULAR",	"COD_PARENTESCO_AUTORIZA",	"FONO_PARTICULAR_TITULAR",	"FONO_COMERCIAL_TITULAR" )  
							VALUES 	 ( :ldt_fecha_hoy,	:ls_nombre_tit,	:ls_ap_pat_tit,					:ls_ap_mat_tit,					:ll_rut_tit,	:ls_dv_tit,		:ls_direc_tit,			:ls_num_dir_tit, 					:ls_dpto_dir_tit,				:ls_block_dir_tit,			:ls_villa_tit,					:ls_sector_tit,	:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fech_sepult,		:ll_hora_sepult,		:ll_minuto_sepult,		:ll_funeraria,			:ll_count,	:ls_base,	:ls_serie,  :ll_numero, 	:ll_rut_fall,  	:ls_dv_fall,     	:ll_indi,			:ll_parque,		'FS',				:ls_tipo_via_tit,		'19',								:ls_fono_titular,				:ls_fono_com_tit )
							USING		Trans_1;   
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
								messagebox("Error Grabar","Error al Grabar CARTA SEPULTACION SQL: "+sqlca.sqlerrtext)
							end if
							
							SELECT 	MAX("FICHA_GRABACION_LAPIDA"."CORRELATIVO")  
							INTO 		:ll_count  
							FROM 		"FICHA_GRABACION_LAPIDA"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							INSERT INTO "FICHA_GRABACION_LAPIDA"  
										( "BASE",	"SERIE",		"NUMERO",	"FECHA",				"NOMBRE_TITULAR",	"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_NACIMIENTO_FALL",	"FECHA_FALLECIMIENTO",	"CODIGO_RELIGION",	"CODIGO_IMAGEN",	"NOMBRE_FALLECIDO_LAPIDA",	"FECHA_DEFUNCION_LAPIDA",	"FECHA_NACIMIENTO_LAPIDA",	"FOLIO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"COD_PARQUE",	"PRIMERA_SEPULTURA",		"TIPO_FICHA",	"CORRELATIVO" )  
							VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha_hoy,	:ls_nombre_tit,   :ls_ap_pat_tit,					:ls_ap_mat_tit,					:ll_rut_tit,   :ls_dv_tit,		:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fec_nac,					:ldt_fec_defun,   		Null,						:ll_cod_imagen,	:ls_nom_comp_fall,			:ldt_fec_defun,				:ldt_fec_nac,					:ll_indi,	:ll_rut_fall,		:ls_dv_fall,		:ll_parque,		:ls_primera_sepultura,	'FS',				:ll_count )  
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
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

/*if tab_1.tabpage_3.dw_ficha_sepult.rowcount()>0 and ll_row>0 and not isnull(ls_sector) and &
	not isnull(ls_sepultura) and ll_cod_parque>0 then
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
		ll_row_reg	= w_carta_sepultacion.dw_lista.Find("estado_reg <> 'G'", 1, w_carta_sepultacion.dw_lista.RowCount())
		if ll_row_reg > 0 then
			w_carta_sepultacion.cb_grabar.enabled	= true
			ll_row_reg	= w_carta_sepultacion.dw_lista.Find("nombre_fallecido='"+ls_nom_fall+"' and apellido_paterno_fall='"+ls_pat_fall+"'", 1, w_carta_sepultacion.dw_lista.RowCount())
			if ll_row_reg > 0 then
				w_carta_sepultacion.dw_lista.scrolltorow(ll_row_reg)
			end if
		else
			w_carta_sepultacion.cb_grabar.enabled	= false
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
				SELECT	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CODIGO_FUNERARIA",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."FECHA_DEFUNCION",	"FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",	"FICHA_SEPULTACION"."RUT_FALLECIDO",	"FICHA_SEPULTACION"."DV_FALLECIDO",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."NUMERO_TECNICO",	"FICHA_SEPULTACION"."CAPACIDAD",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."NOMBRE_TITULAR",	"FICHA_SEPULTACION"."AP_PATERNO_TITULAR",	"FICHA_SEPULTACION"."AP_MATERNO_TITULAR",	"FICHA_SEPULTACION"."DIRECCION_TITULAR",	"FICHA_SEPULTACION"."NUM_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."DEPTO_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."BLOCK_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."POBLACION_VILLA_TITULAR",	"FICHA_SEPULTACION"."SECTOR_TITULAR",	"FICHA_SEPULTACION"."FONO_TITULAR",	"FICHA_SEPULTACION"."CANTIDAD_SEPULTADOS",	"FICHA_SEPULTACION"."RUT_TITULAR",	"FICHA_SEPULTACION"."DV_TITULAR",	"FICHA_SEPULTACION"."TIPO_VIA_TITULAR",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO"
				FROM 		"FICHA_SEPULTACION"  
				WHERE  ( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
						 ( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
						 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )   
				USING		SQLCA;
				open X1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch x1 into :ldt_fech_sepult, :ll_hora_sepult, :ll_minuto_sepult, :ll_funeraria, :ls_nombre_fall, :ls_ap_pat_fall, :ls_ap_mat_fall, :ldt_fec_defun, :ldt_fec_nac, :ll_rut_fall, :ls_dv_fall, :ls_base,	:ls_serie, :ll_numero, :ls_sector, :ls_sepultura, :ls_numero_tecni, :ll_capacidad, :ll_parque, :ls_nombre_tit, :ls_ap_pat_tit, :ls_ap_mat_tit, :ls_direc_tit, :ls_num_dir_tit, :ls_dpto_dir_tit, :ls_block_dir_tit, :ls_villa_tit, :ls_sector_tit, :ls_fono_titular, :ll_cant_sepultados, :ll_rut_tit, :ls_dv_tit, :ls_tipo_via_tit, :ll_fila ;
						if not isnull(ldt_fech_sepult) then
							ll_indi				= ll_fila
							ldt_fecha_hoy		= ldt_fech_sepult
							ls_nom_comp_fall	= ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
							if len(ls_nom_comp_fall)>27 then
								ls_nom_comp_fall	= mid(ls_nom_comp_fall,1,27)
							end if
							SELECT	"CLIENTE"."FONO_C"  
							INTO 		:ls_fono_com_tit  
							FROM 		"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   ;
		
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
										 ( "FALLECIDOS"."COD_PARQUE" = :ll_parque )   
								USING		sqlca;
								if ll_count_reg>1 then
									ll_cod_imagen	= 99
								else
									ll_cod_imagen	= 0
								end if
							end if
							if ll_cant_sepultados>0 then
								ls_primera_sepultura	= 'N'
							else
								ls_primera_sepultura	= 'S'
							end if
							SELECT 	MAX("FICHA_CARTA_SEPULTACION"."FOLIO")  
							INTO 		:ll_count  
							FROM 		"FICHA_CARTA_SEPULTACION"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							
							INSERT INTO "FICHA_CARTA_SEPULTACION"  
										 ( "FECHA_CARTA",		"NOMBRE_TITULAR",	"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"DIRECCION_TITULAR",	"NUMERO_DIRECCION_TITULAR",	"DEPTO_DIRECCION_TITULAR",	"BLOCK_DIRECCION_TITULAR",	"POBLACION_VILLA_TITULAR",	"SECTOR_TITULAR",	"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION",	"CODIGO_FUNERARIA",	"FOLIO",		"BASE",	  	"SERIE",		"NUMERO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"CORRELATIVO",		"COD_PARQUE",	"TIPO_FICHA",	"TIPO_VIA_TITULAR",	"COD_PARENTESCO_AUTORIZA",	"FONO_PARTICULAR_TITULAR",	"FONO_COMERCIAL_TITULAR" )  
							VALUES 	 ( :ldt_fecha_hoy,	:ls_nombre_tit,	:ls_ap_pat_tit,					:ls_ap_mat_tit,					:ll_rut_tit,	:ls_dv_tit,		:ls_direc_tit,			:ls_num_dir_tit, 					:ls_dpto_dir_tit,				:ls_block_dir_tit,			:ls_villa_tit,					:ls_sector_tit,	:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fech_sepult,		:ll_hora_sepult,		:ll_minuto_sepult,		:ll_funeraria,			:ll_count,	:ls_base,	:ls_serie,  :ll_numero, 	:ll_rut_fall,  	:ls_dv_fall,     	:ll_indi,			:ll_parque,		'FS',				:ls_tipo_via_tit,		'19',								:ls_fono_titular,				:ls_fono_com_tit )
							USING		Trans_1;   
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
								messagebox("Error Grabar","Error al Grabar CARTA SEPULTACION SQL: "+sqlca.sqlerrtext)
							end if
							
							SELECT 	MAX("FICHA_GRABACION_LAPIDA"."CORRELATIVO")  
							INTO 		:ll_count  
							FROM 		"FICHA_GRABACION_LAPIDA"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							INSERT INTO "FICHA_GRABACION_LAPIDA"  
										( "BASE",	"SERIE",		"NUMERO",	"FECHA",				"NOMBRE_TITULAR",	"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_NACIMIENTO_FALL",	"FECHA_FALLECIMIENTO",	"CODIGO_RELIGION",	"CODIGO_IMAGEN",	"NOMBRE_FALLECIDO_LAPIDA",	"FECHA_DEFUNCION_LAPIDA",	"FECHA_NACIMIENTO_LAPIDA",	"FOLIO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"COD_PARQUE",	"PRIMERA_SEPULTURA",		"TIPO_FICHA",	"CORRELATIVO" )  
							VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha_hoy,	:ls_nombre_tit,   :ls_ap_pat_tit,					:ls_ap_mat_tit,					:ll_rut_tit,   :ls_dv_tit,		:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fec_nac,					:ldt_fec_defun,   		Null,						:ll_cod_imagen,	:ls_nom_comp_fall,			:ldt_fec_defun,				:ldt_fec_nac,					:ll_indi,	:ll_rut_fall,		:ls_dv_fall,		:ll_parque,		:ls_primera_sepultura,	'FS',				:ll_count )  
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
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
*/
end event

type cb_lapida from commandbutton within w_ingreso_ficha_sepultacion_bkp
boolean visible = false
integer x = 1746
integer y = 2512
integer width = 434
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabación Lápida"
end type

event clicked;String	ls_sector,ls_sepultura,ls_nombre_archivo,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,&
			ls_dv_tit,ls_direc_tit,ls_num_dir_tit,ls_dpto_dir_tit,ls_block_dir_tit,ls_villa_tit,&
			ls_sector_tit,ls_numero_tecni,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_primera_sepultura,&
			ls_base,ls_serie,ls_dv_fall,ls_tipo_via_tit,ls_fono_titular,ls_fono_com_tit,ls_nom_comp_fall,&
			ls_nom_fall,ls_pat_fall
Long		ll_cod_parque,ll_imagen,ll_row,ll_resp,ll_tot_reg,ll_fila,ll_rut_tit,ll_capacidad,ll_cant_sepultados,&
			ll_hora_sepult,ll_minuto_sepult,ll_funeraria,ll_numero,ll_rut_fall,ll_indi,ll_parque,ll_cod_imagen,&
			ll_count_reg,ll_count,ll_row_reg
datetime	ldt_fecha_hoy,ldt_fech_sepult,ldt_fec_nac,ldt_fec_defun

ll_row															= tab_1.tabpage_3.dw_ficha_sepult.getrow()
ls_sector														= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sector')
ls_sepultura													= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sepultura')
ll_cod_parque												= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_row,'cod_parque')
ls_nom_fall													= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_row,'nombre_fallecido')
ls_pat_fall													= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_row,'ap_paterno_fall')
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
		ll_row_reg	= w_solicitud_grabacion_lapida.dw_lista.Find("estado_reg <> 'G'", 1, w_solicitud_grabacion_lapida.dw_lista.RowCount())
		if ll_row_reg > 0 then
			w_solicitud_grabacion_lapida.cb_nueva.enabled	= true
			ll_row_reg	= w_solicitud_grabacion_lapida.dw_lista.Find("nombre_fallecido='"+ls_nom_fall+"' and apellido_paterno_fall='"+ls_pat_fall+"'", 1, w_solicitud_grabacion_lapida.dw_lista.RowCount())
			if ll_row_reg>0 then
				w_solicitud_grabacion_lapida.dw_lista.scrolltorow(ll_row_reg)
			end if
		else
			w_solicitud_grabacion_lapida.cb_nueva.enabled	= false
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
				SELECT	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CODIGO_FUNERARIA",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."FECHA_DEFUNCION",	"FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",	"FICHA_SEPULTACION"."RUT_FALLECIDO",	"FICHA_SEPULTACION"."DV_FALLECIDO",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."NUMERO_TECNICO",	"FICHA_SEPULTACION"."CAPACIDAD",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."NOMBRE_TITULAR",	"FICHA_SEPULTACION"."AP_PATERNO_TITULAR",	"FICHA_SEPULTACION"."AP_MATERNO_TITULAR",	"FICHA_SEPULTACION"."DIRECCION_TITULAR",	"FICHA_SEPULTACION"."NUM_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."DEPTO_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."BLOCK_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."POBLACION_VILLA_TITULAR",	"FICHA_SEPULTACION"."SECTOR_TITULAR",	"FICHA_SEPULTACION"."FONO_TITULAR",	"FICHA_SEPULTACION"."CANTIDAD_SEPULTADOS",	"FICHA_SEPULTACION"."RUT_TITULAR",	"FICHA_SEPULTACION"."DV_TITULAR",	"FICHA_SEPULTACION"."TIPO_VIA_TITULAR",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO"
				FROM 		"FICHA_SEPULTACION"  
				WHERE  ( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
						 ( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
						 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )   
				USING		SQLCA;
				open X1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch x1 into :ldt_fech_sepult, :ll_hora_sepult, :ll_minuto_sepult, :ll_funeraria, :ls_nombre_fall, :ls_ap_pat_fall, :ls_ap_mat_fall, :ldt_fec_defun, :ldt_fec_nac, :ll_rut_fall, :ls_dv_fall, :ls_base,	:ls_serie, :ll_numero, :ls_sector, :ls_sepultura, :ls_numero_tecni, :ll_capacidad, :ll_parque, :ls_nombre_tit, :ls_ap_pat_tit, :ls_ap_mat_tit, :ls_direc_tit, :ls_num_dir_tit, :ls_dpto_dir_tit, :ls_block_dir_tit, :ls_villa_tit, :ls_sector_tit, :ls_fono_titular, :ll_cant_sepultados, :ll_rut_tit, :ls_dv_tit, :ls_tipo_via_tit, :ll_fila ;
						if not isnull(ldt_fech_sepult) then
							ll_indi				= ll_fila
							ldt_fecha_hoy		= ldt_fech_sepult
							ls_nom_comp_fall	= ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
							if len(ls_nom_comp_fall)>27 then
								ls_nom_comp_fall	= mid(ls_nom_comp_fall,1,27)
							end if
							SELECT	"CLIENTE"."FONO_C"  
							INTO 		:ls_fono_com_tit  
							FROM 		"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   ;
		
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
										 ( "FALLECIDOS"."COD_PARQUE" = :ll_parque )   
								USING		sqlca;
								if ll_count_reg>1 then
									ll_cod_imagen	= 99
								else
									ll_cod_imagen	= 0
								end if
							end if
							if ll_cant_sepultados>0 then
								ls_primera_sepultura	= 'N'
							else
								ls_primera_sepultura	= 'S'
							end if
							SELECT 	MAX("FICHA_CARTA_SEPULTACION"."FOLIO")  
							INTO 		:ll_count  
							FROM 		"FICHA_CARTA_SEPULTACION"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							
							INSERT INTO "FICHA_CARTA_SEPULTACION"  
										 ( "FECHA_CARTA",		"NOMBRE_TITULAR",	"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"DIRECCION_TITULAR",	"NUMERO_DIRECCION_TITULAR",	"DEPTO_DIRECCION_TITULAR",	"BLOCK_DIRECCION_TITULAR",	"POBLACION_VILLA_TITULAR",	"SECTOR_TITULAR",	"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION",	"CODIGO_FUNERARIA",	"FOLIO",		"BASE",	  	"SERIE",		"NUMERO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"CORRELATIVO",		"COD_PARQUE",	"TIPO_FICHA",	"TIPO_VIA_TITULAR",	"COD_PARENTESCO_AUTORIZA",	"FONO_PARTICULAR_TITULAR",	"FONO_COMERCIAL_TITULAR" )  
							VALUES 	 ( :ldt_fecha_hoy,	:ls_nombre_tit,	:ls_ap_pat_tit,					:ls_ap_mat_tit,					:ll_rut_tit,	:ls_dv_tit,		:ls_direc_tit,			:ls_num_dir_tit, 					:ls_dpto_dir_tit,				:ls_block_dir_tit,			:ls_villa_tit,					:ls_sector_tit,	:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fech_sepult,		:ll_hora_sepult,		:ll_minuto_sepult,		:ll_funeraria,			:ll_count,	:ls_base,	:ls_serie,  :ll_numero, 	:ll_rut_fall,  	:ls_dv_fall,     	:ll_indi,			:ll_parque,		'FS',				:ls_tipo_via_tit,		'19',								:ls_fono_titular,				:ls_fono_com_tit )
							USING		Trans_1;   
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
								messagebox("Error Grabar","Error al Grabar CARTA SEPULTACION SQL: "+sqlca.sqlerrtext)
							end if
							
							SELECT 	MAX("FICHA_GRABACION_LAPIDA"."CORRELATIVO")  
							INTO 		:ll_count  
							FROM 		"FICHA_GRABACION_LAPIDA"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							INSERT INTO "FICHA_GRABACION_LAPIDA"  
										( "BASE",	"SERIE",		"NUMERO",	"FECHA",				"NOMBRE_TITULAR",	"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_NACIMIENTO_FALL",	"FECHA_FALLECIMIENTO",	"CODIGO_RELIGION",	"CODIGO_IMAGEN",	"NOMBRE_FALLECIDO_LAPIDA",	"FECHA_DEFUNCION_LAPIDA",	"FECHA_NACIMIENTO_LAPIDA",	"FOLIO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"COD_PARQUE",	"PRIMERA_SEPULTURA",		"TIPO_FICHA",	"CORRELATIVO" )  
							VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha_hoy,	:ls_nombre_tit,   :ls_ap_pat_tit,					:ls_ap_mat_tit,					:ll_rut_tit,   :ls_dv_tit,		:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fec_nac,					:ldt_fec_defun,   		Null,						:ll_cod_imagen,	:ls_nom_comp_fall,			:ldt_fec_defun,				:ldt_fec_nac,					:ll_indi,	:ll_rut_fall,		:ls_dv_fall,		:ll_parque,		:ls_primera_sepultura,	'FS',				:ll_count )  
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
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

type cb_carta from commandbutton within w_ingreso_ficha_sepultacion_bkp
boolean visible = false
integer x = 1394
integer y = 2512
integer width = 352
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Carta &Autoriza"
end type

event clicked;String	ls_sector,ls_sepultura,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_dv_tit,ls_direc_tit,ls_num_dir_tit,&
			ls_dpto_dir_tit,ls_block_dir_tit,ls_villa_tit,ls_sector_tit,ls_numero_tecni,ls_nombre_fall,ls_ap_pat_fall,&
			ls_ap_mat_fall,ls_base,ls_serie,ls_dv_fall,ls_tipo_via_tit,ls_fono_titular,ls_fono_com_tit,ls_primera_sepultura,&
			ls_nom_comp_fall,ls_nom_fall,ls_pat_fall
Long		ll_cod_parque,ll_row,ll_resp,ll_rut_tit,ll_capacidad,ll_hora_sepult,ll_minuto_sepult,ll_funeraria,ll_count,&
			ll_rut_fall,ll_indi,ll_parque,ll_cod_imagen,ll_tot_reg,ll_fila,ll_count_reg,ll_cant_sepultados,&
			ll_row_reg
Double	ll_numero
Datetime	ldt_fecha_hoy,ldt_fech_sepult,ldt_fec_nac,ldt_fec_defun

ll_row												= tab_1.tabpage_3.dw_ficha_sepult.getrow()
ls_sector											= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sector')
ls_sepultura										= tab_1.tabpage_3.dw_ficha_sepult.getitemstring(ll_row,'sepultura')
ll_cod_parque									= tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(ll_row,'cod_parque')
ls_nom_fall										= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_row,'nombre_fallecido')
ls_pat_fall										= tab_1.tabpage_1.dw_ant_fall.getitemstring(ll_row,'ap_paterno_fall')
if tab_1.tabpage_3.dw_ficha_sepult.rowcount()>0 and ll_row>0 and not isnull(ls_sector) and &
	not isnull(ls_sepultura) and ll_cod_parque>0 then
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
		ll_row_reg	= w_carta_sepultacion.dw_lista.Find("estado_reg <> 'G'", 1, w_carta_sepultacion.dw_lista.RowCount())
		if ll_row_reg > 0 then
			w_carta_sepultacion.cb_grabar.enabled	= true
			ll_row_reg	= w_carta_sepultacion.dw_lista.Find("nombre_fallecido='"+ls_nom_fall+"' and apellido_paterno_fall='"+ls_pat_fall+"'", 1, w_carta_sepultacion.dw_lista.RowCount())
			if ll_row_reg > 0 then
				w_carta_sepultacion.dw_lista.scrolltorow(ll_row_reg)
			end if
		else
			w_carta_sepultacion.cb_grabar.enabled	= false
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
				SELECT	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CODIGO_FUNERARIA",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."FECHA_DEFUNCION",	"FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",	"FICHA_SEPULTACION"."RUT_FALLECIDO",	"FICHA_SEPULTACION"."DV_FALLECIDO",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."NUMERO_TECNICO",	"FICHA_SEPULTACION"."CAPACIDAD",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."NOMBRE_TITULAR",	"FICHA_SEPULTACION"."AP_PATERNO_TITULAR",	"FICHA_SEPULTACION"."AP_MATERNO_TITULAR",	"FICHA_SEPULTACION"."DIRECCION_TITULAR",	"FICHA_SEPULTACION"."NUM_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."DEPTO_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."BLOCK_DIRECCION_TITULAR",	"FICHA_SEPULTACION"."POBLACION_VILLA_TITULAR",	"FICHA_SEPULTACION"."SECTOR_TITULAR",	"FICHA_SEPULTACION"."FONO_TITULAR",	"FICHA_SEPULTACION"."CANTIDAD_SEPULTADOS",	"FICHA_SEPULTACION"."RUT_TITULAR",	"FICHA_SEPULTACION"."DV_TITULAR",	"FICHA_SEPULTACION"."TIPO_VIA_TITULAR",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO"
				FROM 		"FICHA_SEPULTACION"  
				WHERE  ( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
						 ( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
						 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )   
				USING		SQLCA;
				open X1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch x1 into :ldt_fech_sepult, :ll_hora_sepult, :ll_minuto_sepult, :ll_funeraria, :ls_nombre_fall, :ls_ap_pat_fall, :ls_ap_mat_fall, :ldt_fec_defun, :ldt_fec_nac, :ll_rut_fall, :ls_dv_fall, :ls_base,	:ls_serie, :ll_numero, :ls_sector, :ls_sepultura, :ls_numero_tecni, :ll_capacidad, :ll_parque, :ls_nombre_tit, :ls_ap_pat_tit, :ls_ap_mat_tit, :ls_direc_tit, :ls_num_dir_tit, :ls_dpto_dir_tit, :ls_block_dir_tit, :ls_villa_tit, :ls_sector_tit, :ls_fono_titular, :ll_cant_sepultados, :ll_rut_tit, :ls_dv_tit, :ls_tipo_via_tit, :ll_fila ;
						if not isnull(ldt_fech_sepult) then
							ll_indi				= ll_fila
							ldt_fecha_hoy		= ldt_fech_sepult
							ls_nom_comp_fall	= ls_nombre_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
							if len(ls_nom_comp_fall)>27 then
								ls_nom_comp_fall	= mid(ls_nom_comp_fall,1,27)
							end if
							SELECT	"CLIENTE"."FONO_C"  
							INTO 		:ls_fono_com_tit  
							FROM 		"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   ;
		
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
										 ( "FALLECIDOS"."COD_PARQUE" = :ll_parque )   
								USING		sqlca;
								if ll_count_reg>1 then
									ll_cod_imagen	= 99
								else
									ll_cod_imagen	= 0
								end if
							end if
							if ll_cant_sepultados>0 then
								ls_primera_sepultura	= 'N'
							else
								ls_primera_sepultura	= 'S'
							end if
							SELECT 	MAX("FICHA_CARTA_SEPULTACION"."FOLIO")  
							INTO 		:ll_count  
							FROM 		"FICHA_CARTA_SEPULTACION"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							
							INSERT INTO "FICHA_CARTA_SEPULTACION"  
										 ( "FECHA_CARTA",		"NOMBRE_TITULAR",	"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"DIRECCION_TITULAR",	"NUMERO_DIRECCION_TITULAR",	"DEPTO_DIRECCION_TITULAR",	"BLOCK_DIRECCION_TITULAR",	"POBLACION_VILLA_TITULAR",	"SECTOR_TITULAR",	"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_SEPULTACION",	"HORA_SEPULTACION",	"MINUTO_SEPULTACION",	"CODIGO_FUNERARIA",	"FOLIO",		"BASE",	  	"SERIE",		"NUMERO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"CORRELATIVO",		"COD_PARQUE",	"TIPO_FICHA",	"TIPO_VIA_TITULAR",	"COD_PARENTESCO_AUTORIZA",	"FONO_PARTICULAR_TITULAR",	"FONO_COMERCIAL_TITULAR" )  
							VALUES 	 ( :ldt_fecha_hoy,	:ls_nombre_tit,	:ls_ap_pat_tit,					:ls_ap_mat_tit,					:ll_rut_tit,	:ls_dv_tit,		:ls_direc_tit,			:ls_num_dir_tit, 					:ls_dpto_dir_tit,				:ls_block_dir_tit,			:ls_villa_tit,					:ls_sector_tit,	:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fech_sepult,		:ll_hora_sepult,		:ll_minuto_sepult,		:ll_funeraria,			:ll_count,	:ls_base,	:ls_serie,  :ll_numero, 	:ll_rut_fall,  	:ls_dv_fall,     	:ll_indi,			:ll_parque,		'FS',				:ls_tipo_via_tit,		'19',								:ls_fono_titular,				:ls_fono_com_tit )
							USING		Trans_1;   
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
								messagebox("Error Grabar","Error al Grabar CARTA SEPULTACION SQL: "+sqlca.sqlerrtext)
							end if
							
							SELECT 	MAX("FICHA_GRABACION_LAPIDA"."CORRELATIVO")  
							INTO 		:ll_count  
							FROM 		"FICHA_GRABACION_LAPIDA"  
							USING		sqlca;
							if isnull(ll_count) then ll_count=0
							ll_count ++
							INSERT INTO "FICHA_GRABACION_LAPIDA"  
										( "BASE",	"SERIE",		"NUMERO",	"FECHA",				"NOMBRE_TITULAR",	"APELLIDO_PATERNO_TITULAR",	"APELLIDO_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"SECTOR",	"SEPULTURA",	"NUMERO_TECNICO",	"CAPACIDAD",	"NOMBRE_FALLECIDO",	"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"FECHA_NACIMIENTO_FALL",	"FECHA_FALLECIMIENTO",	"CODIGO_RELIGION",	"CODIGO_IMAGEN",	"NOMBRE_FALLECIDO_LAPIDA",	"FECHA_DEFUNCION_LAPIDA",	"FECHA_NACIMIENTO_LAPIDA",	"FOLIO",		"RUT_FALLECIDO",	"DV_FALLECIDO",	"COD_PARQUE",	"PRIMERA_SEPULTURA",		"TIPO_FICHA",	"CORRELATIVO" )  
							VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha_hoy,	:ls_nombre_tit,   :ls_ap_pat_tit,					:ls_ap_mat_tit,					:ll_rut_tit,   :ls_dv_tit,		:ls_sector,	:ls_sepultura,	:ls_numero_tecni,	:ll_capacidad,	:ls_nombre_fall,		:ls_ap_pat_fall,				:ls_ap_mat_fall,				:ldt_fec_nac,					:ldt_fec_defun,   		Null,						:ll_cod_imagen,	:ls_nom_comp_fall,			:ldt_fec_defun,				:ldt_fec_nac,					:ll_indi,	:ll_rut_fall,		:ls_dv_fall,		:ll_parque,		:ls_primera_sepultura,	'FS',				:ll_count )  
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
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

