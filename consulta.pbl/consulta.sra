//objectcomments PBL : consullta, repacta
forward
global type consulta from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
String		gs_usuario_1, gs_usuario_2,gs_usuario_3,gs_usuario_4,gs_usuario_5,gs_usuario_entregar,gs_base_aux, gs_serie_aux,gs_age,gs_sup,gs_jefe,gs_user_maq,gs_tcp_ip,&
			gs_base, gs_serie, gs_codigo_usuario, gs_nombre, gs_estado, gs_dv,gs_moneda,gs_datawindow_a_imprimir,gs_rezago,gs_solicitudes,&
			gs_nombre_completo,gs_tipo_cobro,gs_filtro,gs_user,gs_us,gs_caja,	gs_apellido_paterno, gs_apellido_materno, gs_nombres, gs_sector, gs_sepultura, gs_area,&
			gs_formato_fecha, gs_nombre_usuario, gs_acceso,gs_clave, gs_opera, gs_nom_comp_usuario,gs_app_name='Sistema Consulta <<SandBox QA>> v.11.01 F.Act.17-11-2025',gs_ventana,gs_cod_parque,&
			gs_agente, gs_superv, gs_empresa, gs_conexion, gs_cons_general,gs_codigo,gs_password,gs_nueva_oferta,gs_depto,gs_formula,gs_personal_interno,gs_digita,gs_multipago,&
			gs_contrato_rezago,gs_string_cli_rezago,gs_codigo_otro,gs_canal,gs_lic,gs_nombre_parque,	gs_nom_cod_parque,gs_sql,gs_est_cons,gs_parque,gs_tipo_contrato,cod_jefe,gs_grabar_pie,&
			gs_cuponera_aviso,gs_grabar_fosa,gs_base_sepult,gs_cerrar,gs_opcion_docto,gs_opcion,gs_graba_prod,gs_tipo_cob,gs_cartera,gs_servername,&
			gs_user_odbc, gs_data_name, gs_clave_odbc,	gs_sap_conex, gs_mandatario, gs_directorio_exe, gs_tcp_ip_print, gs_moneda_rezago,gs_nombre_fallecido_fc,gs_ap_paterno_fallecido_fc,&
			gs_ap_materno_fallecido_fc,gs_area_origen_fc,gs_sector_origen_fc,gs_sepultura_origen_fc,gs_nro_resolucion_fc,gs_nro_acta_fc,gs_base_fc,gs_serie_fc,gs_cod_registro_fc,gs_observacion_fc,&
			gs_area_fc,gs_sector_fc,gs_sepultura_fc,gs_nivel_fc,gs_estado_ctto_fc,gs_nom_titular_fc,gs_ap_pat_titular_fc,gs_ap_mat_titular_fc,gs_tipo_via_titular_fc,gs_direc_titular_fc,&
			gs_nro_direc_titular_fc,gs_depto_titular_fc,gs_block_titular_fc,gs_ciudad_titular_fc,gs_comuna_titular_fc,gs_fono_p_titular_fc,gs_estado_titular_fc,gs_nro_tecnico_fc,gs_dv_titular_fc,&
			gs_dv_fall_fc,gs_sexo_fall_fc,gs_sexo_fc,gs_cod_registro_pase_fc,gs_observacion_pase_fc,gs_registro_pase_fc,gs_sexo_fallecido_fc,gs_cod_estado_fallecido_fc,gs_cod_tamano_cuerpo_fc,&
			gs_cod_obs_cuerpo_fc,gs_causa_fallecimiento_fc,gs_reingreso_ci,gs_reingreso_be,gs_file,gs_aplicacion,gs_tipo_cobro_aux,gs_tipo_cobro_aux2,gs_producto,gs_cod_prod,gs_mant_serv,gs_mant_serv_uso, &
			gs_aplica_a // vhfb
long 		gi_rut, gi_rut_buscar, rutx,  gi_tecnico,gi_llave_f,gl_n_cuotas_pag,gi_llave,gi_busqueda_cop, gl_opcion, gl_ctas_pag_m,gl_cta_mora_original,gl_aplicacion=1,&
			gl_height,gl_width,gi_acceso,gi_credito,gl_cod_parque,gl_grupo,gi_cod_parque,gl_opcion_gestion,gi_prim_nro_A_cd,gl_codigo_parque,&
			mora_ini,mora_fin,mora_ini_cred,gi_prim_nro_O_cd,gi_prim_nro_L_cd,gi_prim_nro_P_cd,mora_fin_cred,mora_ini_cont, mora_fin_cont,mora_ini_lib , mora_fin_lib,mora_ini_der,&
			mora_fin_der,mora_ini_pag,mora_fin_pag,mora_ini_repro,mora_fin_repro,gl_count_lic,	gs_age_sup,gl_analisis,gl_cupones,gl_ultimo_cupon,gi_cant_cup,gl_cod_parque_cta,&
			gl_rut_encargado,gi_indice,gi_parque_select,gi_trimestre,gi_tipo_analisis,gl_cuo_digitada_desde,gl_cuo_digitada_hasta,gi_tipo_busqueda,gi_nivel_acceso, gi_parque,&
			gi_rut_tercero,gi_poliza,gl_corr_mensual,gl_corr_anual,gl_proceso,gl_cod_servicio,gl_contar_logon,gl_prim_folio,gl_ind_cart,gl_folio_diario,gl_veces_diario,gl_cod_parque_rezago,&
			gl_val_1,gl_llave_fallecido_fc, gl_cod_parque_origen_fc, gl_numero_fc,gl_rut_titular_fc, gl_capacidad_fc, gl_rut_fall_fc, gl_edad_fc,gl_anno_pase_fc,gl_iva_pie_l,gl_val_montosap,&
			gl_sw_mp,gl_codigo_mp
datetime gd_hoy,gdt_fecha_res,gd_fec_termino,gdt_fec_sistema,gd_fecha_inicio,gd_fecha_fin,gdt_fecha_sepult,fechasys,gd_fecha_servipag,gd_fecha_inicio_sup,gd_fecha_fin_sup,gdt_tiempo_servidor,&
			gdt_fec_cierre,gdt_fec_ini_pag,gdt_fecha_traslado_fc,gdt_fecha_resolucion_fc,gdt_fecha_ctto_fc,gdt_fec_nac_fc,gdt_fec_fall_fc,gdt_fecha_pase_fc
date 		gd_tiempo_serv,gd_fecha_prox_pago,gd_fec_ran_fin,gd_fecha_1,gd_fecha_2, gd_fecha_pago_plazo
boolean 	gb_presentacion, gb_aplica // vhfb
double 	gd_uf,gd_uf_dia,gd_val_interes, gd_val_deuda,ll_total_pago,gd_total,gdb_iva,gi_numero,gl_numero_aux,gl_folio,gl_valor_iva,gl_iva_exento_f, & 
			gd_descuento,gdb_porce_pie_mp //vhfb
			
datawindowchild			idw_detalle,idw_detalle1,idw_detalle2,idw_detalle3,idw_detalle4,idw_detalle12,idw_detalle13,idw_detalle14,idw_detalle15
Environment 				ge_Environment
gst_parametros 			st_param
gst_parametros_dcto		st_param_dcto
transaction 					Trans_1, Trans_2, Trans_3, Trans_4, Trans_5,Trans_6,Trans_7, Trans_hana
s_printdlgattrib 			gstr_print
gstr_parametros_indica	gstr_param

w_principal gw_frame
 
Boolean	gb_winopendoc, gb_winopen
Boolean  gb_connect = False
Integer	gi_popopc
 
String	gs_usuario, gs_pc, gs_emp = '01'
String	gs_ini = 'natural.ini', gs_iniProfile = '', gs_sys = 'Natural·GNP'
//String   gs_file
String   gs_version = '1A', gs_copyright 
//gs_aplicacion = 'NaturalSD GNP',
 
String   gs_winnumdoc = ''
String   gs_tma = '' /* Código de Tema/colores */
 
/* Tema/colores RGB */
Long		gl_ctheader, gl_ctlogo, gl_cttoolbar, gl_cttextbar, gl_ctmenubar, gl_cttext, gl_ctoption, gl_ctgroup, gl_cttitwin, &
			gl_ctbutton, gl_ctbuttonalt, gl_ctbuttonx
 
 
String   mysig
 
uo_Eclipse blEclipse
uo_sap sap
w_gen_principal gw_frameNat

/* Compatibilidad con GNP Consulta */
//String	gs_Empresa
Int gi_EntProd

end variables

global type consulta from application
string appname = "consulta"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 22.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "Scdrespl.ico"
string appruntimeversion = "25.0.0.3726"
boolean manualsession = false
boolean unsupportedapierror = false
boolean ultrafast = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
long webview2distribution = 0
boolean webview2checkx86 = false
boolean webview2checkx64 = false
string webview2url = "https://developer.microsoft.com/en-us/microsoft-edge/webview2/"
integer highdpimode = 0
end type
global consulta consulta

type prototypes
function long PFC_PrintDlg (uint hwnd, ref s_printdlgattrib printstruct) library "pfccom32.dll" alias for "PFC_PrintDlg;Ansi"
Function boolean GetUserNameA (ref string name, ref ulong len) library "ADVAPI32.DLL" alias for "GetUserNameA;Ansi"
Subroutine QRCodeEncode(ref String DataString, integer Version, integer Level,  integer Mask) Library "QRCodeFont.dll"
Function integer QRCodeGetRows() Library "QRCodeFont.dll"
Function integer QRCodeGetCols() Library "QRCodeFont.dll"
Function integer QRCodeGetCharAt(Integer RowIndex, Integer ColIndex) Library "QRCodeFont.dll"
Function integer QRCodeSetCharAt(Integer Position, Integer Ch) Library "QRCodeFont.dll"

SubRoutine QRC_FastQRCode(String Texto, String FileName) ALIAS FOR "FastQRCode;ansi" LIBRARY "QRCodeLib.dll"
Function String QRC_QRCodeLibVer() ALIAS FOR "QRCodeLibVer;ansi" LIBRARY"QRCodeLib.dll"
FUNCTION ulong GetTempPathA(long nBufferLength, ref string lpBuffer ) LIBRARY "KERNEL32.DLL"
Function long GetComputerNameA (REF string lpBuffer, ref long nSize) Library "Kernel32.DLL" alias for "GetComputerNameA;Ansi"

FUNCTION long ShellExecute( &
    long hwnd, &
    string lpOperation, &
    string lpFile, &
    string lpParameters, &
    string lpDirectory, &
    integer nShowCmd &
) LIBRARY "shell32.dll" ALIAS FOR "ShellExecuteW"
end prototypes

on consulta.create
appname="consulta"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on consulta.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;string	is_dbms, is_logpass, is_servername, is_logid, is_dbparam,nombre
long 		rut

gs_usuario_1 		= profilestring("INMOB.INI","Usuario","usuario1","" )
gs_usuario_2 		= profilestring("INMOB.INI","Usuario","usuario2","" )
gs_usuario_3 		= profilestring("INMOB.INI","Usuario","usuario3","" )
gs_usuario_4 		= profilestring("INMOB.INI","Usuario","usuario4","" )
gs_usuario_5 		= profilestring("INMOB.INI","Usuario","usuario5","" )
gi_cant_cup 		= profileint("INMOB.INI","Conexión","cantidad_cupones",24 )
mora_ini 			= ProfileInt("INMOB.INI", "Mora", "Mora_ini",2)
mora_fin 			= ProfileInt("INMOB.INI", "Mora", "Mora_fin",5)
mora_ini_cred 		= ProfileInt("INMOB.INI", "Mora_cred", "Mora_ini",2)
mora_fin_cred 		= ProfileInt("INMOB.INI", "Mora_cred", "Mora_fin",5)
mora_ini_cont 		= ProfileInt("INMOB.INI", "Mora_cont", "Mora_ini",2)
mora_fin_cont 		= ProfileInt("INMOB.INI", "Mora_cont", "Mora_fin",5)
mora_ini_lib  		= ProfileInt("INMOB.INI", "Mora_lib", "Mora_ini",2)
mora_fin_lib  		= ProfileInt("INMOB.INI", "Mora_lib", "Mora_fin",5)
mora_ini_der  		= ProfileInt("INMOB.INI", "Mora_der", "Mora_ini",2)
mora_fin_der  		= ProfileInt("INMOB.INI", "Mora_der", "Mora_fin",5)
mora_ini_pag  		= ProfileInt("INMOB.INI", "Mora_pag", "Mora_ini",2)
mora_fin_pag  		= ProfileInt("INMOB.INI", "Mora_pag", "Mora_fin",5)
IF Handle(This, TRUE) > 0 THEN
	MessageBox(gs_app_name,"La aplicación "+gs_app_name+", esta en ejecución.",information!)
	HALT CLOSE
END IF
GetEnvironment(ge_Environment)
gl_height	= PixelsToUnits(ge_Environment.ScreenHeight,YPixelsToUnits!)
gl_width		= PixelsToUnits(ge_Environment.ScreenWidth,XPixelsToUnits!)
open(w_conexion)
end event

event close;disconnect;
end event

