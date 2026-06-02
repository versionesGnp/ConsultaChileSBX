forward
global type w_ver_cupones from window
end type
type cb_autorizar_mant from commandbutton within w_ver_cupones
end type
type st_4 from statictext within w_ver_cupones
end type
type cb_autorizar from commandbutton within w_ver_cupones
end type
type tab_1 from tab within w_ver_cupones
end type
type tabpage_1 from userobject within tab_1
end type
type pb_crear_cup from picturebutton within tabpage_1
end type
type em_cup_mant from editmask within tabpage_1
end type
type st_6 from statictext within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type cb_anular from commandbutton within tabpage_1
end type
type pb_ok from picturebutton within tabpage_1
end type
type em_cuotas from editmask within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type rb_mantencion from radiobutton within tabpage_1
end type
type rb_credito from radiobutton within tabpage_1
end type
type dw_detalle from datawindow within tabpage_1
end type
type gb_2 from groupbox within tabpage_1
end type
type gb_3 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
pb_crear_cup pb_crear_cup
em_cup_mant em_cup_mant
st_6 st_6
st_3 st_3
cb_anular cb_anular
pb_ok pb_ok
em_cuotas em_cuotas
st_2 st_2
st_1 st_1
rb_mantencion rb_mantencion
rb_credito rb_credito
dw_detalle dw_detalle
gb_2 gb_2
gb_3 gb_3
end type
type tabpage_2 from userobject within tab_1
end type
type cb_anular_web from commandbutton within tabpage_2
end type
type dw_det_web from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_anular_web cb_anular_web
dw_det_web dw_det_web
end type
type tab_1 from tab within w_ver_cupones
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_ordenar from commandbutton within w_ver_cupones
end type
type cb_filtrar from commandbutton within w_ver_cupones
end type
type cb_exportar from commandbutton within w_ver_cupones
end type
type dw_print from datawindow within w_ver_cupones
end type
type cb_cerrar from commandbutton within w_ver_cupones
end type
type cb_print from commandbutton within w_ver_cupones
end type
type dw_lista from datawindow within w_ver_cupones
end type
type gb_1 from groupbox within w_ver_cupones
end type
type gb_4 from groupbox within w_ver_cupones
end type
end forward

global type w_ver_cupones from window
integer width = 3442
integer height = 2492
boolean titlebar = true
string title = "Detallle Cupones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_autorizar_mant cb_autorizar_mant
st_4 st_4
cb_autorizar cb_autorizar
tab_1 tab_1
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
dw_print dw_print
cb_cerrar cb_cerrar
cb_print cb_print
dw_lista dw_lista
gb_1 gb_1
gb_4 gb_4
end type
global w_ver_cupones w_ver_cupones

type variables
Long	il_cant_f, il_cant_e
end variables

on w_ver_cupones.create
this.cb_autorizar_mant=create cb_autorizar_mant
this.st_4=create st_4
this.cb_autorizar=create cb_autorizar
this.tab_1=create tab_1
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.dw_print=create dw_print
this.cb_cerrar=create cb_cerrar
this.cb_print=create cb_print
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_4=create gb_4
this.Control[]={this.cb_autorizar_mant,&
this.st_4,&
this.cb_autorizar,&
this.tab_1,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.dw_print,&
this.cb_cerrar,&
this.cb_print,&
this.dw_lista,&
this.gb_1,&
this.gb_4}
end on

on w_ver_cupones.destroy
destroy(this.cb_autorizar_mant)
destroy(this.st_4)
destroy(this.cb_autorizar)
destroy(this.tab_1)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.dw_print)
destroy(this.cb_cerrar)
destroy(this.cb_print)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_4)
end on

event open;Long		ll_indi, ll_tot_reg,ll_count_existe,ll_cantidad_cuotas,ll_valor_dscto,ll_flag_ctas,ll_flag_mant
String		ls_tipo_mov,ls_estado_cupon,ls_cod_tramo,ls_cod_movimiento,ls_cod_des

gf_centrar(w_ver_cupones) 
dw_lista.settransobject(sqlca)
tab_1.tabpage_1.dw_detalle.settransobject(sqlca)
tab_1.tabpage_2.dw_det_web.settransobject(sqlca)
dw_print.settransobject(sqlca)
il_cant_e													= 0
il_cant_f													= 0
ll_flag_ctas												= 0
ll_flag_mant												= 0
tab_1.tabpage_1.em_cuotas.text					= ''
tab_1.tabpage_1.em_cup_mant.text				= ''
tab_1.tabpage_2.dw_det_web.retrieve(gs_base,gs_serie,gi_numero)
//tab_1.tabpage_1.rb_mantencion.enabled		= false
//if(gs_base = 'L') then
//	tab_1.tabpage_1.gb_2.enabled					= false
//	tab_1.tabpage_1.rb_mantencion.enabled	= false
//	tab_1.tabpage_1.rb_credito.enabled			= false
//	tab_1.tabpage_1.gb_2.enabled					= false
//	tab_1.tabpage_1.pb_ok.enabled				= false
//	tab_1.tabpage_1.st_1.enabled					= false
//	tab_1.tabpage_1.st_2.enabled					= false
//	tab_1.tabpage_1.em_cuotas.enabled			= false
//end if
if dw_lista.retrieve(gs_base,gs_serie,gi_numero)>0 then
	ll_tot_reg								= tab_1.tabpage_1.dw_detalle.retrieve(gs_base,gs_serie,gi_numero)
	if ll_tot_reg > 0 then
		for ll_indi = 1 to ll_tot_reg
			ls_tipo_mov			= tab_1.tabpage_1.dw_detalle.getitemstring(ll_indi,'cuponeras_detalle_tipo_mov')
			ls_estado_cupon	= tab_1.tabpage_1.dw_detalle.getitemstring(ll_indi,'cuponeras_detalle_estado_pago_cupon')
			if ls_estado_cupon = 'V' and ls_tipo_mov='E' then
				il_cant_e ++
			elseif ls_estado_cupon = 'V' and ls_tipo_mov='F' then
				il_cant_f ++
			end if
		next
	end if
	
	dw_print.retrieve(gs_base,gs_serie,gi_numero)
	
	//FRANCK
	SELECT 	"WEBPREAUTORIZADO"."N_CANTIDAD_DET",   
				"WEBPREAUTORIZADO"."C_CODIGO_TRM",   
				"WEBPREAUTORIZADO"."C_CODIGO_MOV"
	INTO 		:ll_cantidad_cuotas,   
				:ls_cod_tramo,   
				:ls_cod_movimiento
    	FROM 	"WEBPREAUTORIZADO"  
   	WHERE 	( "WEBPREAUTORIZADO"."BASE" = :gs_base ) AND
         		( "WEBPREAUTORIZADO"."SERIE" = :gs_serie ) AND
         		( "WEBPREAUTORIZADO"."NUMERO" = :gi_numero )  AND
				( "WEBPREAUTORIZADO"."C_CODIGO_REG" = 'V' ) AND
				( "WEBPREAUTORIZADO"."C_CODIGO_MOV" = 'E')
	USING sqlca;
	if sqlca.sqlcode=0 then
		ll_flag_ctas = 1
		messagebox('MENSAJE','El contrato '+gs_base+gs_serie+string(gi_numero)+' tiene '+string(ll_cantidad_cuotas)+' cuotas de credito preautorizadas')
		commit;
	else
		rollback;
	end if
	
	SELECT 	"WEBPREAUTORIZADO"."N_CANTIDAD_DET",   
				"WEBPREAUTORIZADO"."C_CODIGO_TRM",   
				"WEBPREAUTORIZADO"."C_CODIGO_MOV"
	INTO 		:ll_cantidad_cuotas,   
				:ls_cod_tramo,   
				:ls_cod_movimiento
    	FROM 	"WEBPREAUTORIZADO"  
   	WHERE 	( "WEBPREAUTORIZADO"."BASE" = :gs_base ) AND
         		( "WEBPREAUTORIZADO"."SERIE" = :gs_serie ) AND
         		( "WEBPREAUTORIZADO"."NUMERO" = :gi_numero )  AND
				( "WEBPREAUTORIZADO"."C_CODIGO_REG" = 'V' ) AND
				( "WEBPREAUTORIZADO"."C_CODIGO_MOV" = 'F')
	USING sqlca;
	if sqlca.sqlcode=0 then
		ll_flag_mant = 1
		messagebox('MENSAJE','El contrato '+gs_base+gs_serie+string(gi_numero)+' tiene '+string(ll_cantidad_cuotas)+' cuotas de mantencion preautorizadas')
		commit;
	else
		rollback;
	end if
	
	if ll_flag_mant = 1 and ll_flag_ctas = 1 then
		cb_autorizar_mant.enabled =true
		cb_autorizar.enabled = true
	elseif ll_flag_mant = 1 and ll_flag_ctas = 0 then
		cb_autorizar_mant.enabled = true
		cb_autorizar.enabled = false
	elseif ll_flag_mant = 0 and ll_flag_ctas = 1 then
		cb_autorizar_mant.enabled = false
		cb_autorizar.enabled = true
	else
		cb_autorizar_mant.enabled = false
		cb_autorizar.enabled = false
	end if
	//FIN FRANCK
	
	SELECT 	  Count("SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD")  
	INTO 		  :ll_count_existe  
	FROM 	  "SOL_PERMISOS_USUARIO"  
	WHERE 	( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
				( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' ) AND  
				( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'CW' )   ;
	if ll_count_existe > 0 then
		tab_1.tabpage_1.gb_2.visible				= true
		tab_1.tabpage_1.rb_credito.visible			= true
		tab_1.tabpage_1.rb_mantencion.visible	= true
		tab_1.tabpage_1.st_1.visible				= true
		tab_1.tabpage_1.st_2.visible				= true
		tab_1.tabpage_1.em_cuotas.visible		= true
		tab_1.tabpage_1.pb_ok.visible				= true
		tab_1.tabpage_1.gb_3.visible				= true
		tab_1.tabpage_1.st_3.visible				= true
		tab_1.tabpage_1.st_6.visible				= true
		tab_1.tabpage_1.em_cup_mant.visible	= true
		tab_1.tabpage_1.pb_crear_cup.visible	= true
	else
		tab_1.tabpage_1.gb_2.visible				= false
		tab_1.tabpage_1.rb_credito.visible			= false
		tab_1.tabpage_1.rb_mantencion.visible	= false
		tab_1.tabpage_1.st_1.visible				= false
		tab_1.tabpage_1.st_2.visible				= false
		tab_1.tabpage_1.em_cuotas.visible		= false
		tab_1.tabpage_1.pb_ok.visible				= false
		tab_1.tabpage_1.gb_3.visible				= false
		tab_1.tabpage_1.st_3.visible				= false
		tab_1.tabpage_1.st_6.visible				= false
		tab_1.tabpage_1.em_cup_mant.visible	= false
		tab_1.tabpage_1.pb_crear_cup.visible	= false
	end if
else
	messagebox("Advertencia","No Registra Datos")
end if
end event

type cb_autorizar_mant from commandbutton within w_ver_cupones
integer x = 2935
integer y = 1000
integer width = 416
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Autorizar Mant"
end type

event clicked;String 	ls_base,ls_serie,ls_cod_emp,ls_cod_trm,ls_cod_cto,ls_cod_mov,ls_cod_registro,ls_cod_usuario,&
			ls_commit,ls_tipo_moneda,ls_cod,ls_estado,ls_msg,ls_numero
Long		ll_numero,ll_cod_prom,ll_cantidad
Date		ld_fecha_actual

ls_base 				= dw_lista.GetItemString(1,'cadena_codigo')
ls_serie 				= dw_lista.GetItemString(1,'cadena_serie')
ll_numero 			= dw_lista.GetItemNumber(1,'cadena_numero')
ls_commit			= '1'
ls_tipo_moneda 	= '1'
ld_fecha_actual		= Today()
//ll_cod_prom			= 1

SELECT  "WEBPREAUTORIZADO"."C_CODIGO_EMP",   
         	"WEBPREAUTORIZADO"."C_CODIGO_TRM",   
         	"WEBPREAUTORIZADO"."C_CODIGO_CTO",  
        		"WEBPREAUTORIZADO"."N_PROMOCION_DET",  
         	"WEBPREAUTORIZADO"."C_CODIGO_MOV",   
         	"WEBPREAUTORIZADO"."N_CANTIDAD_DET",   
         	"WEBPREAUTORIZADO"."C_CODIGO_REG",   
         	"WEBPREAUTORIZADO"."C_CODIGO_USU"  
INTO 		:ls_cod_emp,   
         	:ls_cod_trm,   
         	:ls_cod_cto,    
         	:ll_cod_prom,  
         	:ls_cod_mov,   
         	:ll_cantidad,   
         	:ls_cod_registro,   
         	:ls_cod_usuario  
FROM 	"WEBPREAUTORIZADO"  
WHERE 	( "WEBPREAUTORIZADO"."BASE" = :ls_base ) AND  
         	( "WEBPREAUTORIZADO"."SERIE" = :ls_serie ) AND  
         	( "WEBPREAUTORIZADO"."NUMERO" = :ll_numero ) AND
			( "WEBPREAUTORIZADO"."C_CODIGO_MOV" = 'F') 
USING sqlca;

if sqlca.sqlcode = 0 then
		SetPointer (HourGlass!)
		DECLARE usp_mantencion PROCEDURE FOR USP_CTO_TRAMO_AUTORIZA_MANT
			( :ls_cod_emp,:ls_cod_trm,:ls_cod_cto, :ll_cod_prom,:ls_cod_mov,:ls_tipo_moneda,:ll_cantidad, :ls_cod_registro,:ls_cod_usuario,:ls_commit )  
		Using sqlca;
		EXECUTE usp_mantencion;
		if sqlca.sqlcode = 0 then
			FETCH usp_mantencion INTO :ls_cod, :ls_estado, :ls_msg;
			messagebox('MENSAJE',ls_msg)
			CLOSE usp_mantencion;
			UPDATE 	"LOG_DESCUENTOS"  
			SET 		"USUARIO_AUTORIZA" 				= :ls_cod_usuario,   
						"FECHA_AUTORIZA" 					= :ld_fecha_actual  
			WHERE 	( "LOG_DESCUENTOS"."BASE" 		= :ls_base ) AND  
						( "LOG_DESCUENTOS"."SERIE" 	= :ls_serie ) AND  
						( "LOG_DESCUENTOS"."NUMERO" 	= :ll_numero )    ;
		end if
end if
SetPointer (Arrow!)
if isvalid(w_ver_cupones) then close(w_ver_cupones)
open(w_ver_cupones)
end event

type st_4 from statictext within w_ver_cupones
integer x = 2939
integer y = 796
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descuentos"
boolean focusrectangle = false
end type

type cb_autorizar from commandbutton within w_ver_cupones
integer x = 2935
integer y = 884
integer width = 416
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Autorizar Cred"
end type

event clicked;String 	ls_base,ls_serie,ls_cod_emp,ls_cod_trm,ls_cod_cto,ls_cod_mov,ls_cod_registro,ls_cod_usuario,&
			ls_commit,ls_tipo_moneda,ls_cod,ls_estado,ls_msg,ls_numero
Long		ll_numero,ll_cod_prom,ll_cantidad
Date		ld_fecha_actual

ls_base 				= dw_lista.GetItemString(1,'cadena_codigo')
ls_serie 				= dw_lista.GetItemString(1,'cadena_serie')
ll_numero 			= dw_lista.GetItemNumber(1,'cadena_numero')
ls_commit			= '1'
ls_tipo_moneda 	= '1'
ld_fecha_actual		= Today()
//ll_cod_prom			= 1

SELECT  "WEBPREAUTORIZADO"."C_CODIGO_EMP",   
         	"WEBPREAUTORIZADO"."C_CODIGO_TRM",   
         	"WEBPREAUTORIZADO"."C_CODIGO_CTO",  
        		"WEBPREAUTORIZADO"."N_PROMOCION_DET",  
         	"WEBPREAUTORIZADO"."C_CODIGO_MOV",   
         	"WEBPREAUTORIZADO"."N_CANTIDAD_DET",   
         	"WEBPREAUTORIZADO"."C_CODIGO_REG",   
         	"WEBPREAUTORIZADO"."C_CODIGO_USU"  
INTO 		:ls_cod_emp,   
         	:ls_cod_trm,   
         	:ls_cod_cto,    
         	:ll_cod_prom,  
         	:ls_cod_mov,   
         	:ll_cantidad,   
         	:ls_cod_registro,   
         	:ls_cod_usuario  
FROM 	"WEBPREAUTORIZADO"  
WHERE 	( "WEBPREAUTORIZADO"."BASE" = :ls_base ) AND  
         	( "WEBPREAUTORIZADO"."SERIE" = :ls_serie ) AND  
         	( "WEBPREAUTORIZADO"."NUMERO" = :ll_numero ) AND
			( "WEBPREAUTORIZADO"."C_CODIGO_MOV" = 'E') 
USING sqlca;

if sqlca.sqlcode = 0 then
		SetPointer (HourGlass!)
		DECLARE usp_mantencion PROCEDURE FOR USP_CTO_TRAMO_AUTORIZA_MANT
			( :ls_cod_emp,:ls_cod_trm,:ls_cod_cto, :ll_cod_prom,:ls_cod_mov,:ls_tipo_moneda,:ll_cantidad, :ls_cod_registro,:ls_cod_usuario,:ls_commit )  
		Using sqlca;
		EXECUTE usp_mantencion;
		if sqlca.sqlcode = 0 then
			FETCH usp_mantencion INTO :ls_cod, :ls_estado, :ls_msg;
			messagebox('MENSAJE',ls_msg)
			CLOSE usp_mantencion;
			UPDATE 	"LOG_DESCUENTOS"  
			SET 		"USUARIO_AUTORIZA" 				= :ls_cod_usuario,   
						"FECHA_AUTORIZA" 					= :ld_fecha_actual  
			WHERE 	( "LOG_DESCUENTOS"."BASE" 		= :ls_base ) AND  
						( "LOG_DESCUENTOS"."SERIE" 	= :ls_serie ) AND  
						( "LOG_DESCUENTOS"."NUMERO" 	= :ll_numero )    ;
		end if
end if
SetPointer (Arrow!)
if isvalid(w_ver_cupones) then close(w_ver_cupones)
open(w_ver_cupones)
end event

type tab_1 from tab within w_ver_cupones
event create ( )
event destroy ( )
integer x = 18
integer y = 1164
integer width = 3369
integer height = 1208
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 108
integer width = 3333
integer height = 1084
long backcolor = 67108864
string text = "Cuponera"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_crear_cup pb_crear_cup
em_cup_mant em_cup_mant
st_6 st_6
st_3 st_3
cb_anular cb_anular
pb_ok pb_ok
em_cuotas em_cuotas
st_2 st_2
st_1 st_1
rb_mantencion rb_mantencion
rb_credito rb_credito
dw_detalle dw_detalle
gb_2 gb_2
gb_3 gb_3
end type

on tabpage_1.create
this.pb_crear_cup=create pb_crear_cup
this.em_cup_mant=create em_cup_mant
this.st_6=create st_6
this.st_3=create st_3
this.cb_anular=create cb_anular
this.pb_ok=create pb_ok
this.em_cuotas=create em_cuotas
this.st_2=create st_2
this.st_1=create st_1
this.rb_mantencion=create rb_mantencion
this.rb_credito=create rb_credito
this.dw_detalle=create dw_detalle
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.pb_crear_cup,&
this.em_cup_mant,&
this.st_6,&
this.st_3,&
this.cb_anular,&
this.pb_ok,&
this.em_cuotas,&
this.st_2,&
this.st_1,&
this.rb_mantencion,&
this.rb_credito,&
this.dw_detalle,&
this.gb_2,&
this.gb_3}
end on

on tabpage_1.destroy
destroy(this.pb_crear_cup)
destroy(this.em_cup_mant)
destroy(this.st_6)
destroy(this.st_3)
destroy(this.cb_anular)
destroy(this.pb_ok)
destroy(this.em_cuotas)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_mantencion)
destroy(this.rb_credito)
destroy(this.dw_detalle)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type pb_crear_cup from picturebutton within tabpage_1
integer x = 3122
integer y = 912
integer width = 142
integer height = 116
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok.bmp"
end type

event clicked;Long		ll_count,ll_mora_mant,ll_estado_mora_mant,ll_ctas_pag_m,ll_cod_parque,ll_plazo,ll_cantidad,ll_res,ll_indi,ll_cant_meses,ll_nro_cuota,ll_cuponera,ll_ctas_pag_s,&
			ll_contar_cup_vig,ll_res2,ll_max_cuota,ll_count_fecha_venc
Double	ll_rut,ldb_valor_cuota_m,ll_cupon,ldb_valor_cuota_c,ll_numero_h
String		ls_estado_cuponera,ls_estado_ctto,ls_dv,ls_moneda,ls_paso,ls_base_h,ls_serie_h
date		ldt_fecha_venc_mant,ldt_fecha_prox,ldt_fecha_vencimiento,ldt_max_venc,ldt_fecha_prim,ldt_fecha_m

ls_paso				= 'N'
if gs_base='O' or gs_base='C' or gs_base='U' or gs_base='M' then
	ll_cantidad		= long(em_cup_mant.text)
	if ll_cantidad > 0 then
		SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
		INTO 		:ls_estado_cuponera  ,						:ll_cuponera
		FROM 	"CUPONERAS"  
		WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
					( "CUPONERAS"."SERIE" = :gs_serie ) AND  
					( "CUPONERAS"."NUMERO" = :gi_numero ) AND
					( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																		FROM 	"CUPONERAS"  
																		WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
																					( "CUPONERAS"."SERIE" = :gs_serie ) AND  
																					( "CUPONERAS"."NUMERO" = :gi_numero ) ) )
		USING	sqlca;
					
		SELECT 	count("CUPONERAS"."BASE")
		INTO 		:ll_count
		FROM 	"CUPONERAS"  
		WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
					( "CUPONERAS"."SERIE" = :gs_serie ) AND  
					( "CUPONERAS"."NUMERO" = :gi_numero )
		USING	sqlca;
		if isnull(ls_estado_cuponera) or ls_estado_cuponera='' then ll_count=0
		SELECT 	   "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES",		"PAGO_OFERTA"."NRO_CUOTAS",	"PAGO_OFERTA"."MONEDA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",  	"CADENA"."RUT",   	"CLIENTE"."DV",   	"OFERTA_V"."VALOR_CUOTA_M",   	"CADENA_MORA"."MORA_MANT",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"CADENA"."ESTADO_MORA_MANTENCION",   	"OFERTA_V"."CTA_PAG_M",   	"OFERTA_V"."CTA_PAG_S",		"PAGO_OFERTA"."VALOR_CUOTA" ,	"PAGO_OFERTA"."FECHA_PRIM",	"OFERTA_V"."FECHA_M"
		INTO 		  :ll_cant_meses,														:ll_plazo,									:ls_moneda,							:ll_cod_parque,					:ls_estado_ctto,   			:ll_rut,   					:ls_dv,   				:ldb_valor_cuota_m,   					:ll_mora_mant,   							:ldt_fecha_venc_mant,   							:ll_estado_mora_mant,   							:ll_ctas_pag_m  ,					:ll_ctas_pag_s,						:ldb_valor_cuota_c,						:ldt_fecha_prim,						:ldt_fecha_m
		FROM 	  "CADENA",   "OFERTA_V",   "PAGO_OFERTA",   "CLIENTE",   "CADENA_MORA" ,	"ESTADO_MORA_MANTENCION" 
		WHERE 	( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) AND
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero ) 
		UNION   
		SELECT 	  "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES",		"CONTRATO"."PLAZO",	"CONTRATO"."MONEDA","CADENA"."COD_PARQUE",	"CADENA"."ESTADO",   	"CADENA"."RUT",   	"CLIENTE"."DV",   	"CONTRATO"."VALOR_CUOTA_M",   	"CADENA_MORA"."MORA_MANT",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"CADENA"."ESTADO_MORA_MANTENCION",   	"CONTRATO"."CTA_PAG_M"  ,	0, 0, null, null
		FROM 	  "CADENA",   "CADENA_MORA",   "CLIENTE",   "CONTRATO",	"ESTADO_MORA_MANTENCION"
		WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) AND
					( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )    ;
		if ls_estado_ctto='V' or ls_estado_ctto='C' then
			if ll_count >= 0 then
				if ll_cantidad > ( ll_mora_mant + 8 ) then
					ll_res	= messagebox("Advertencia","Está Seguro de Crear "+string(ll_cantidad) +" Cupones de Mantención",Exclamation!,YesNo!,2)
				else
					ll_res	= messagebox("Advertencia","Está Seguro de Crear Cupones de Mantención",Exclamation!,YesNo!,2)
				end if
			end if
			if ll_res = 1 then
				SELECT 	MAX("CUPONERAS_DETALLE"."NRO_CUPON")  
				INTO 		:ll_cupon  
				FROM 	"CUPONERAS_DETALLE"  ;
				ll_cupon ++
				if ll_count = 0 then
					ll_cuponera	= ll_count + 1
					INSERT INTO "CUPONERAS"  
									( "BASE",   	"SERIE",  	"NUMERO",   	"NRO_CUPONERA",   	"FECHA_CREA",   	"USUARIO_CREADOR",   	"CUPON_INICIAL",   	"CUPON_FINAL",   	"ESTADO_CUPONERA",   	"COD_PARQUE",   	"MONEDA_CTTO",   	"PLAZO",   	"CANT_PRINT",   	"ULT_FECHA_VENC_CRED_PRINT" )  
					VALUES 		( :gs_base,	:gs_serie,   :gi_numero,   	:ll_cuponera,   			:gdt_fec_sistema,	:gs_user,   					1,   						2,   					'V',   								:ll_cod_parque,   	:ls_moneda,   			:ll_plazo,   	0,   					null )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ls_paso		= 'S'
					else
						rollback;
					end if
					
				elseif ll_count = 1 then
					if (gs_base='O' or gs_base='U' or gs_base='M') and ll_ctas_pag_s < ll_plazo then
						SELECT 	Count("CUPONERAS_DETALLE"."BASE" ) 
						INTO 		:ll_contar_cup_vig  
						FROM 	"CUPONERAS_DETALLE"  
						WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
								  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
								  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
								  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
								  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   ;
						if ll_contar_cup_vig = 0 then
							messagebox("Advertencia","Contrato Tiene Saldo Cuota Crédito, debe tener Cuponera Vigente antes de Crear Cupones de Mantención")
							
							DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota_c, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fecha_m, :ls_moneda);
							EXECUTE sp_proc_genera_cuponera;
							if ls_estado_cuponera = 'A' then
								UPDATE	"CUPONERAS"  
								SET 		"ESTADO_CUPONERA" = 'R'  
								WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
										 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										 ( "CUPONERAS"."ESTADO_CUPONERA" = :ls_estado_cuponera ) AND  
										 ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
								INTO 		:ls_estado_cuponera  ,						:ll_cuponera
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero ) AND
											( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																								FROM 	"CUPONERAS"  
																								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
																											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
																											( "CUPONERAS"."NUMERO" = :gi_numero ) ) )
								USING	sqlca;
											
								SELECT 	count("CUPONERAS"."BASE")
								INTO 		:ll_count
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero )
								USING	sqlca;
							end if
							ll_res2 = 1
						else
							ll_res2 = 1
						end if
					else
						ll_res2 	= 1
					end if
					
					if ll_res2 = 1 then
						if ls_estado_cuponera <> 'V' and ls_estado_cuponera <> 'C' then
							UPDATE 	"CUPONERAS"  
							SET 		"ESTADO_CUPONERA" = 'V'  
							WHERE ( "CUPONERAS"."BASE" = :gs_base ) AND  
									  ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
									  ( "CUPONERAS"."NUMERO" = :gi_numero )  AND
									  ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
						
						ls_paso	= 'S'
					else
						ls_paso	= 'N'
					end if
				elseif ll_count > 1 then
					if (gs_base='O' or gs_base='U' or gs_base='M') and ll_ctas_pag_s < ll_plazo then
						SELECT 	Count("CUPONERAS_DETALLE"."BASE" ) 
						INTO 		:ll_contar_cup_vig  
						FROM 	"CUPONERAS_DETALLE"  
						WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
								  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
								  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
								  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
								  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   ;
						if ll_contar_cup_vig = 0 then
							messagebox("Advertencia","Contrato Tiene Saldo Cuota Crédito, debe tener Cuponera Vigente antes de Crear Cupones de Mantención")
							
							DECLARE sp_proc_genera_cup2 PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota_c, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fecha_m, :ls_moneda);
							EXECUTE sp_proc_genera_cup2;
							if ls_estado_cuponera = 'A' then
								UPDATE	"CUPONERAS"  
								SET 		"ESTADO_CUPONERA" = 'R'  
								WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
										 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										 ( "CUPONERAS"."ESTADO_CUPONERA" = :ls_estado_cuponera ) AND  
										 ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
								INTO 		:ls_estado_cuponera  ,						:ll_cuponera
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero ) AND
											( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																								FROM 	"CUPONERAS"  
																								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
																											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
																											( "CUPONERAS"."NUMERO" = :gi_numero ) ) )
								USING	sqlca;
											
								SELECT 	count("CUPONERAS"."BASE")
								INTO 		:ll_count
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero )
								USING	sqlca;
							end if
							ll_res2 = 1
						else
							ll_res2 = 1
						end if
					else
						ll_res2 	= 1
					end if
					if ll_res2 = 1 then
						UPDATE 	"CUPONERAS"  
						SET 		"ESTADO_CUPONERA" = 'V'  
						WHERE ( "CUPONERAS"."BASE" = :gs_base ) AND  
								  ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
								  ( "CUPONERAS"."NUMERO" = :gi_numero )  AND
								  ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							UPDATE 	"CUPONERAS"  
							SET 		"ESTADO_CUPONERA" = 'A'  
							WHERE ( "CUPONERAS"."BASE" = :gs_base ) AND  
									  ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
									  ( "CUPONERAS"."NUMERO" = :gi_numero )  AND
									  ( "CUPONERAS"."NRO_CUPONERA" < :ll_cuponera )
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
								ls_paso	= 'S'
							else
								rollback;
							end if
						else
							rollback;
						end if
						
					end if
				end if
				if ls_paso = 'S' then
					SELECT 	Count("CUPONERAS_DETALLE"."FECHA_VENC" ) 
					INTO 		:ll_count_fecha_venc  
					FROM 	"CUPONERAS_DETALLE"  
					WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
							  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
							  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
							  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
							  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
							  ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   ;
					if isnull(ll_count_fecha_venc) then ll_count_fecha_venc=0
					if ll_count_fecha_venc > 0 then
						SELECT 	MAX("CUPONERAS_DETALLE"."FECHA_VENC" ) 
						INTO 		:ldt_max_venc  
						FROM 	"CUPONERAS_DETALLE"  
						WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
								  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
								  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
								  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
								  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
								  ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   ;
					elseif not isnull(ldt_fecha_venc_mant) then
						ldt_max_venc			= ldt_fecha_venc_mant
					else
						ldt_max_venc			= ldt_fecha_m			// ldt_fecha_venc_mant
					end if
					if not isnull(ldt_fecha_venc_mant) and ll_count_fecha_venc=0 then
						ldt_max_venc			= ldt_fecha_venc_mant
//						ldt_fecha_venc_mant	= ldt_max_venc
//						SELECT 	add_months( :ldt_fecha_venc_mant, :ll_cant_meses * -1) 
//						INTO		:ldt_max_venc
//						FROM		dual;
						ldt_fecha_prox			= ldt_max_venc
//						ldt_fecha_venc_mant	= ldt_fecha_prox
					elseif not isnull(ldt_max_venc) then
						ldt_fecha_venc_mant	= ldt_max_venc
						SELECT 	add_months( :ldt_fecha_venc_mant, :ll_cant_meses) 
						INTO		:ldt_fecha_prox
						FROM		dual;
						ldt_fecha_venc_mant	= ldt_fecha_prox
					else
						ldt_max_venc			= ldt_fecha_venc_mant
					end if
					
					SELECT 	count("CUPONERAS_DETALLE"."NRO_CUOTA" ) 
					INTO 		:ll_max_cuota  
					FROM 	"CUPONERAS_DETALLE"  
					WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
							  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
							  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
							  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
							  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
							  ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   ;
					if isnull(ll_max_cuota) or ll_max_cuota=0 then
						ll_max_cuota	= 0
					end if
					ldt_fecha_prox		= ldt_fecha_venc_mant
					for ll_indi = 1 to ll_cantidad
						ll_nro_cuota = ll_max_cuota + ll_ctas_pag_m + ll_indi
						if not isnull(ldt_fecha_prox) then
							INSERT INTO "CUPONERAS_DETALLE"  
										( "BASE",  	"SERIE",  	"NUMERO",	"NRO_CUPON",  	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"IP_PRINT",   	"USUARIO_PRINT",   	"NUMERO_GRUPO_AVISO",   	"BASE_ASOC",   	"SERIE_ASOC",   	"NUMERO_ASOC",   	"MONTO_OTROS_COBROS",   	"USUARIO_ACTUALIZA_REG",   	"FECHA_ACTUALIZA_REG",   	"CUPON_WEB",   	"SW_GRAN_CUPON" )  
							VALUES 	( :gs_base,	:gs_serie,   :gi_numero,	:ll_cupon,   			:ll_rut,   :ll_nro_cuota,   		:ldt_fecha_prox,   	'V',   								'F',   				null,   					null,   				null,   				:ldb_valor_cuota_m,   				0,   								0,   									0,											:ll_count,   				:ls_dv,   	null,   			null,   					null,   								null,   				null,   				null,   					null,   								:gs_user,   								:gdt_fec_sistema,   				0,   					1 )  
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
								ldt_fecha_venc_mant = ldt_fecha_prox;
								ll_cupon ++
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar Cupon SQL: "+sqlca.sqlerrtext)
							end if
		
						end if
						SELECT 	add_months( :ldt_fecha_venc_mant, :ll_cant_meses) 
						INTO		:ldt_fecha_prox
						FROM		dual;
					next
					if gs_base='M' then
						DECLARE x_ctto_hijo_mp CURSOR FOR  
						SELECT	"CADENA"."CODIGO",  	"CADENA"."SERIE",   	"CADENA"."NUMERO"  
						FROM 	"CADENA"  
						WHERE 	( "CADENA"."MPBASE" = :gs_base ) AND  ( "CADENA"."MPSERIE" = :gs_serie ) AND  ( "CADENA"."MPNUMERO" = :gi_numero )   
						USING	sqlca;
						open x_ctto_hijo_mp;
						if sqlca.sqlcode=0 then
							do while sqlca.sqlcode=0
								fetch x_ctto_hijo_mp into :ls_base_h, :ls_serie_h, :ll_numero_h;
								if not isnull(ls_base_h) then
								/////////////////////
									if ll_cantidad > 0 then
										SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
										INTO 		:ls_estado_cuponera  ,						:ll_cuponera
										FROM 	"CUPONERAS"  
										WHERE 	( "CUPONERAS"."BASE" = :ls_base_h ) AND  
													( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
													( "CUPONERAS"."NUMERO" = :ll_numero_h ) AND
													( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																										FROM 	"CUPONERAS"  
																										WHERE 	( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																													( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																													( "CUPONERAS"."NUMERO" = :ll_numero_h ) ) )
										USING	sqlca;
													
										SELECT 	count("CUPONERAS"."BASE")
										INTO 		:ll_count
										FROM 	"CUPONERAS"  
										WHERE 	( "CUPONERAS"."BASE" = :ls_base_h ) AND  
													( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
													( "CUPONERAS"."NUMERO" = :ll_numero_h )
										USING	sqlca;
										
										if isnull(ls_estado_cuponera) or ls_estado_cuponera='' then ll_count=0
										SELECT 	   "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES",		"PAGO_OFERTA"."NRO_CUOTAS",	"PAGO_OFERTA"."MONEDA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",  	"CADENA"."RUT",   	"CLIENTE"."DV",   	"OFERTA_V"."VALOR_CUOTA_M",   	"CADENA_MORA"."MORA_MANT",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"CADENA"."ESTADO_MORA_MANTENCION",   	"OFERTA_V"."CTA_PAG_M",   	"OFERTA_V"."CTA_PAG_S",		"PAGO_OFERTA"."VALOR_CUOTA" ,	"PAGO_OFERTA"."FECHA_PRIM",	"OFERTA_V"."FECHA_M"
										INTO 		  :ll_cant_meses,														:ll_plazo,									:ls_moneda,							:ll_cod_parque,					:ls_estado_ctto,   			:ll_rut,   					:ls_dv,   				:ldb_valor_cuota_m,   					:ll_mora_mant,   							:ldt_fecha_venc_mant,   							:ll_estado_mora_mant,   							:ll_ctas_pag_m  ,					:ll_ctas_pag_s,						:ldb_valor_cuota_c,						:ldt_fecha_prim,						:ldt_fecha_m
										FROM 	  "CADENA",   "OFERTA_V",   "PAGO_OFERTA",   "CLIENTE",   "CADENA_MORA" ,	"ESTADO_MORA_MANTENCION" 
										WHERE 	( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
													( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
													( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
													( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) AND
													( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
													( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
													( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
													( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
													( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
													( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
													( "CADENA"."CODIGO" = :ls_base_h ) AND  
													( "CADENA"."SERIE" = :ls_serie_h ) AND  
													( "CADENA"."NUMERO" = :ll_numero_h ) 
										UNION   
										SELECT 	  "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES",		"CONTRATO"."PLAZO",	"CONTRATO"."MONEDA","CADENA"."COD_PARQUE",	"CADENA"."ESTADO",   	"CADENA"."RUT",   	"CLIENTE"."DV",   	"CONTRATO"."VALOR_CUOTA_M",   	"CADENA_MORA"."MORA_MANT",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"CADENA"."ESTADO_MORA_MANTENCION",   	"CONTRATO"."CTA_PAG_M"  ,	0, 0, null, null
										FROM 	  "CADENA",   "CADENA_MORA",   "CLIENTE",   "CONTRATO",	"ESTADO_MORA_MANTENCION"
										WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
													( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
													( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
													( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
													( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
													( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) AND
													( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
													( "CADENA"."CODIGO" = :ls_base_h ) AND  
													( "CADENA"."SERIE" = :ls_serie_h ) AND  
													( "CADENA"."NUMERO" = :ll_numero_h )    ;
													
										if ls_estado_ctto='V' or ls_estado_ctto='C' then
											if ll_count >= 0 then
												if ll_cantidad > ( ll_mora_mant + 8 ) then
	//												ll_res	= messagebox("Advertencia","Está Seguro de Crear "+string(ll_cantidad) +" Cupones de Mantención",Exclamation!,YesNo!,2)
												else
	//												ll_res	= messagebox("Advertencia","Está Seguro de Crear Cupones de Mantención",Exclamation!,YesNo!,2)
												end if
												ll_res = 1
											end if
											if ll_res = 1 then
												SELECT 	MAX("CUPONERAS_DETALLE"."NRO_CUPON")  
												INTO 		:ll_cupon  
												FROM 	"CUPONERAS_DETALLE"  ;
												ll_cupon ++
												if ll_count = 0 then
													ll_cuponera	= ll_count + 1
													INSERT INTO "CUPONERAS"  
																	( "BASE",   		"SERIE",	  		"NUMERO",   		"NRO_CUPONERA",   	"FECHA_CREA",   	"USUARIO_CREADOR",   	"CUPON_INICIAL",   	"CUPON_FINAL",   	"ESTADO_CUPONERA",   	"COD_PARQUE",   	"MONEDA_CTTO",   	"PLAZO",   	"CANT_PRINT",   	"ULT_FECHA_VENC_CRED_PRINT" )  
													VALUES 		( :ls_base_h,	:ls_serie_h,   	:ll_numero_h,   	:ll_cuponera,   			:gdt_fec_sistema,	:gs_user,   					1,   						2,   					'V',   								:ll_cod_parque,   	:ls_moneda,   			:ll_plazo,   	0,   					null )  
													USING	sqlca;
													if sqlca.sqlcode=0 then
														commit;
														ls_paso		= 'S'
													else
														rollback;
													end if
													
												elseif ll_count = 1 then
													if (gs_base='O' or gs_base='U' or gs_base='M') and ll_ctas_pag_s < ll_plazo then
														SELECT 	Count("CUPONERAS_DETALLE"."BASE" ) 
														INTO 		:ll_contar_cup_vig  
														FROM 	"CUPONERAS_DETALLE"  
														WHERE ( "CUPONERAS_DETALLE"."BASE" = :ls_base_h ) AND  
																  ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie_h ) AND  
																  ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero_h ) AND  
																  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
																  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   ;
														if ll_contar_cup_vig = 0 then
	//														messagebox("Advertencia","Contrato Tiene Saldo Cuota Crédito, debe tener Cuponera Vigente antes de Crear Cupones de Mantención")
															
															DECLARE sp_proc_genera_cupones_h PROCEDURE FOR SP_GENERAR_CUPONERA( :ls_base_h, :ls_serie_h, :ll_numero_h, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota_c, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fecha_m, :ls_moneda);
															EXECUTE sp_proc_genera_cupones_h;
															if ls_estado_cuponera = 'A' then
																UPDATE	"CUPONERAS"  
																SET 		"ESTADO_CUPONERA" = 'R'  
																WHERE  ( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																		 ( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																		 ( "CUPONERAS"."NUMERO" = :ll_numero_h ) AND  
																		 ( "CUPONERAS"."ESTADO_CUPONERA" = :ls_estado_cuponera ) AND  
																		 ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )   
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																end if
																SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
																INTO 		:ls_estado_cuponera  ,						:ll_cuponera
																FROM 	"CUPONERAS"  
																WHERE 	( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																			( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																			( "CUPONERAS"."NUMERO" = :ll_numero_h ) AND
																			( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																																FROM 	"CUPONERAS"  
																																WHERE 	( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																																			( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																																			( "CUPONERAS"."NUMERO" = :ll_numero_h ) ) )
																USING	sqlca;
																			
																SELECT 	count("CUPONERAS"."BASE")
																INTO 		:ll_count
																FROM 	"CUPONERAS"  
																WHERE 	( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																			( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																			( "CUPONERAS"."NUMERO" = :ll_numero_h )
																USING	sqlca;
															end if
															ll_res2 = 1
														else
															ll_res2 = 1
														end if
													else
														ll_res2 	= 1
													end if
													
													if ll_res2 = 1 then
														if ls_estado_cuponera <> 'V' and ls_estado_cuponera <> 'C' then
															UPDATE 	"CUPONERAS"  
															SET 		"ESTADO_CUPONERA" = 'V'  
															WHERE ( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																	  ( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																	  ( "CUPONERAS"."NUMERO" = :ll_numero_h )  AND
																	  ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
															end if
														end if
														
														ls_paso	= 'S'
													else
														ls_paso	= 'N'
													end if
												elseif ll_count > 1 then
													if (gs_base='O' or gs_base='U' or gs_base='M') and ll_ctas_pag_s < ll_plazo then
														SELECT 	Count("CUPONERAS_DETALLE"."BASE" ) 
														INTO 		:ll_contar_cup_vig  
														FROM 	"CUPONERAS_DETALLE"  
														WHERE ( "CUPONERAS_DETALLE"."BASE" = :ls_base_h ) AND  
																  ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie_h ) AND  
																  ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero_h ) AND  
																  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
																  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   ;
														if ll_contar_cup_vig = 0 then
	//														messagebox("Advertencia","Contrato Tiene Saldo Cuota Crédito, debe tener Cuponera Vigente antes de Crear Cupones de Mantención")
															
															DECLARE sp_proc_genera_cup2_h PROCEDURE FOR SP_GENERAR_CUPONERA( :ls_base_h, :ls_serie_h, :ll_numero_h, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota_c, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fecha_m, :ls_moneda);
															EXECUTE sp_proc_genera_cup2_h;
															if ls_estado_cuponera = 'A' then
																UPDATE	"CUPONERAS"  
																SET 		"ESTADO_CUPONERA" = 'R'  
																WHERE  ( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																		 ( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																		 ( "CUPONERAS"."NUMERO" = :ll_numero_h ) AND  
																		 ( "CUPONERAS"."ESTADO_CUPONERA" = :ls_estado_cuponera ) AND  
																		 ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )   
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																end if
																SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
																INTO 		:ls_estado_cuponera  ,						:ll_cuponera
																FROM 	"CUPONERAS"  
																WHERE 	( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																			( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																			( "CUPONERAS"."NUMERO" = :ll_numero_h ) AND
																			( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																																FROM 	"CUPONERAS"  
																																WHERE 	( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																																			( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																																			( "CUPONERAS"."NUMERO" = :ll_numero_h ) ) )
																USING	sqlca;
																			
																SELECT 	count("CUPONERAS"."BASE")
																INTO 		:ll_count
																FROM 	"CUPONERAS"  
																WHERE 	( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																			( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																			( "CUPONERAS"."NUMERO" = :ll_numero_h )
																USING	sqlca;
															end if
															ll_res2 = 1
														else
															ll_res2 = 1
														end if
													else
														ll_res2 	= 1
													end if
													if ll_res2 = 1 then
														UPDATE 	"CUPONERAS"  
														SET 		"ESTADO_CUPONERA" = 'V'  
														WHERE ( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																  ( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																  ( "CUPONERAS"."NUMERO" = :ll_numero_h )  AND
																  ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )
														USING	sqlca;
														if sqlca.sqlcode=0 then
															commit;
															UPDATE 	"CUPONERAS"  
															SET 		"ESTADO_CUPONERA" = 'A'  
															WHERE ( "CUPONERAS"."BASE" = :ls_base_h ) AND  
																	  ( "CUPONERAS"."SERIE" = :ls_serie_h ) AND  
																	  ( "CUPONERAS"."NUMERO" = :ll_numero_h )  AND
																	  ( "CUPONERAS"."NRO_CUPONERA" < :ll_cuponera )
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
																ls_paso	= 'S'
															else
																rollback;
															end if
														else
															rollback;
														end if
														
													end if
												end if
												if ls_paso = 'S' then
													SELECT 	MAX("CUPONERAS_DETALLE"."FECHA_VENC" ) 
													INTO 		:ldt_max_venc  
													FROM 	"CUPONERAS_DETALLE"  
													WHERE ( "CUPONERAS_DETALLE"."BASE" = :ls_base_h ) AND  
															  ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie_h ) AND  
															  ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero_h ) AND  
															  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
															  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
															  ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   ;
													if not isnull(ldt_max_venc) then
														ldt_fecha_venc_mant	= ldt_max_venc
														SELECT 	add_months( :ldt_fecha_venc_mant, :ll_cant_meses) 
														INTO		:ldt_fecha_prox
														FROM		dual;
														ldt_fecha_venc_mant	= ldt_fecha_prox
													end if
													
													SELECT 	count("CUPONERAS_DETALLE"."NRO_CUOTA" ) 
													INTO 		:ll_max_cuota  
													FROM 	"CUPONERAS_DETALLE"  
													WHERE ( "CUPONERAS_DETALLE"."BASE" = :ls_base_h ) AND  
															  ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie_h ) AND  
															  ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero_h ) AND  
															  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
															  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
															  ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   ;
													if isnull(ll_max_cuota) or ll_max_cuota=0 then
														ll_max_cuota	= 0
													end if
													ldt_fecha_prox		= ldt_fecha_venc_mant
													for ll_indi = 1 to ll_cantidad
														ll_nro_cuota = ll_max_cuota + ll_ctas_pag_m + ll_indi
														if not isnull(ldt_fecha_prox) then
															INSERT INTO "CUPONERAS_DETALLE"  
																		( "BASE",  		"SERIE",  		"NUMERO",		"NRO_CUPON",  	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"IP_PRINT",   	"USUARIO_PRINT",   	"NUMERO_GRUPO_AVISO",   	"BASE_ASOC",   	"SERIE_ASOC",   	"NUMERO_ASOC",   	"MONTO_OTROS_COBROS",   	"USUARIO_ACTUALIZA_REG",   	"FECHA_ACTUALIZA_REG",   	"CUPON_WEB",   	"SW_GRAN_CUPON" )  
															VALUES 	( :ls_base_h,	:ls_serie_h,   	:ll_numero_h,	:ll_cupon,   			:ll_rut,   :ll_nro_cuota,   		:ldt_fecha_prox,   	'V',   								'F',   				null,   					null,   				null,   				:ldb_valor_cuota_m,   				0,   								0,   									0,											:ll_count,   				:ls_dv,   	null,   			null,   					null,   								null,   				null,   				null,   					null,   								:gs_user,   								:gdt_fec_sistema,   				0,   					1 )  
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
																ldt_fecha_venc_mant = ldt_fecha_prox;
																ll_cupon ++
															else
																rollback;
																messagebox("Error Grabar","Error al Grabar Cupon SQL: "+sqlca.sqlerrtext)
															end if
										
														end if
														SELECT 	add_months( :ldt_fecha_venc_mant, :ll_cant_meses) 
														INTO		:ldt_fecha_prox
														FROM		dual;
													next
												end if
											end if
										end if
									end if
								//////////////////
								end if
								Setnull(ls_base_h)
							loop
						end if
						close x_ctto_hijo_mp;
					end if
					w_ver_cupones.triggerevent(open!)
				end if
			end if
		else
			messagebox("Advertencia","Recuerde solo puede crear Cupones a Contratos en Estado VIGENTE o PAGADO")
		end if
	else
		em_cup_mant.text		= ''
	end if
else
	messagebox("Advertencia","Solo se puede Crear Cupones de Mantención a O-PROMESAS y C-CONTRATOS ISA")
end if
end event

type em_cup_mant from editmask within tabpage_1
integer x = 2752
integer y = 932
integer width = 274
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#####"
end type

event modified;Long		ll_cant
String		ls_tipo

ll_cant				= Long(em_cup_mant.text)
em_cuotas.text		= ''
if ll_cant = 0 then
	messagebox("Advertencia","NO es posible Crear Cupon Mantención, debe ingresar Cantidad de Cupones a Crear")
	em_cuotas.text	= ''
//else
//	pb_crear_cup.triggerevent(clicked!)
end if
end event

type st_6 from statictext within tabpage_1
integer x = 2441
integer y = 972
integer width = 288
integer height = 44
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "desea Crear"
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_1
integer x = 2441
integer y = 928
integer width = 265
integer height = 52
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "# Cupones"
boolean focusrectangle = false
end type

type cb_anular from commandbutton within tabpage_1
boolean visible = false
integer x = 1641
integer y = 920
integer width = 82
integer height = 100
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Anular Gran Cupón"
end type

event clicked;Long		ll_fila,ll_res,ll_sw_gran_cupon
Double	ll_gran_cupon
String		ls_tipo_mov,ls_estado_pago

if dw_detalle.rowcount() > 0 then
	ll_fila						= dw_detalle.getrow()
	if ll_fila > 0 then
		ll_gran_cupon		= dw_detalle.getitemnumber(ll_fila,'cuponeras_detalle_cupon_web')
		ll_sw_gran_cupon	= dw_detalle.getitemnumber(ll_fila,'cuponeras_detalle_sw_gran_cupon')
		ls_tipo_mov			= dw_detalle.getitemstring(ll_fila,'cuponeras_detalle_tipo_mov')
		ls_estado_pago		= dw_detalle.getitemstring(ll_fila,'cuponeras_detalle_estado_pago_cupon')
		if ll_gran_cupon > 0 and ll_sw_gran_cupon=0 and ls_estado_pago='V' then
			ll_res				= messagebox("Advertencia","Está Seguro Anular Gran Cupón N° "+string(ll_gran_cupon),Exclamation!,YesNo!,2)
			if ll_res=1 then
				UPDATE 	"CUPONERAS_DETALLE_WEB"  
				SET 		"ESTADO_PAGO_CUPON" = 'A',   
							"FECHA_PAGO" = :gdt_fec_sistema  
				WHERE 	( "CUPONERAS_DETALLE_WEB"."BASE" = :gs_base ) AND  
							( "CUPONERAS_DETALLE_WEB"."SERIE" = :gs_serie ) AND  
							( "CUPONERAS_DETALLE_WEB"."NUMERO" = :gi_numero ) AND  
							( "CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :ll_gran_cupon ) AND  
							( "CUPONERAS_DETALLE_WEB"."ESTADO_PAGO_CUPON" = 'V' ) AND  
							( "CUPONERAS_DETALLE_WEB"."TIPO_MOV" = :ls_tipo_mov )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
					UPDATE 	"CUPONERAS_DETALLE"  
					SET 		"CUPON_WEB" = null,   
								"SW_GRAN_CUPON" = 1  
					WHERE 	( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
								( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
								( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
								( "CUPONERAS_DETALLE"."TIPO_MOV" = :ls_tipo_mov ) AND  
								( "CUPONERAS_DETALLE"."SW_GRAN_CUPON" = 0 ) AND  
								( "CUPONERAS_DETALLE"."CUPON_WEB" = :ll_gran_cupon )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						messagebox("Anular","Anulación Exitosa")
						triggerevent(open!)
//						dw_detalle.retrieve(gs_base,gs_serie,gi_numero)
					else
						rollback;
					end if
				else
					rollback;
					messagebox("Error Anular","Error en Anulación Gran Cupón SQL: "+sqlca.sqlerrtext)
				end if

			end if
		end if
	end if
end if
end event

type pb_ok from picturebutton within tabpage_1
integer x = 1449
integer y = 912
integer width = 142
integer height = 116
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_cuotas,ll_count,ll_res,ll_indi,ll_tot_reg,ll_contador,ll_sw_web
Double	ll_cupon,ll_monto,ll_monto_reg_ctto,ll_suma_valor_cuota
String		ls_tipo,ls_moneda,ls_tipo_mov_reg,ls_estado_cupon_reg,ls_descrip
Date		ldt_fecha

ll_contador							= 1
ll_suma_valor_cuota				= 0
ll_cuotas								= Long(em_cuotas.text)
ldt_fecha								= Date(gdt_fec_sistema)
ll_tot_reg							= dw_detalle.rowcount()
Setnull(ls_tipo)
if ll_cuotas > 0 then
	if rb_credito.checked = true then
		ls_tipo						= 'E'
		ls_descrip					= 'Crédito'
		ls_moneda					= dw_detalle.getitemstring(1,'cuponeras_moneda_ctto')
	elseif rb_mantencion.checked = true then
		ls_tipo						= 'F'
		ls_descrip					= 'Mantención'
		ls_moneda					= '2'
	end if
	for ll_indi=1 to ll_tot_reg
		ls_tipo_mov_reg			= dw_detalle.getitemstring(ll_indi,'cuponeras_detalle_tipo_mov')
		ls_estado_cupon_reg		= dw_detalle.getitemstring(ll_indi,'cuponeras_detalle_estado_pago_cupon')
		ll_monto_reg_ctto			= Double(dw_detalle.getitemnumber(ll_indi,'cuponeras_detalle_monto_cuota_contrato'))
		if isnull(ll_monto_reg_ctto) then ll_monto_reg_ctto=0
		if ls_tipo_mov_reg = ls_tipo and ll_contador <= ll_cuotas and ls_estado_cupon_reg='V' then
			dw_detalle.setitem(ll_indi,'cuponeras_detalle_sw_gran_cupon',0)
			ll_suma_valor_cuota	= ll_suma_valor_cuota + ll_monto_reg_ctto
			ll_contador ++
			if ll_contador = 1 then
				dw_detalle.scrolltorow(ll_indi)
			end if
		end if
	next
	dw_detalle.accepttext()
	SELECT 	COUNT("CUPONERAS_DETALLE_WEB"."BASE") 
	INTO 		:ll_count  
	FROM 	"CUPONERAS_DETALLE_WEB"  
	WHERE 	( "CUPONERAS_DETALLE_WEB"."BASE" = :gs_base ) AND  
				( "CUPONERAS_DETALLE_WEB"."SERIE" = :gs_serie ) AND  
				( "CUPONERAS_DETALLE_WEB"."NUMERO" = :gi_numero ) AND  
				( "CUPONERAS_DETALLE_WEB"."RUT" = :gi_rut ) AND  
				( "CUPONERAS_DETALLE_WEB"."ESTADO_PAGO_CUPON" = 'V' ) AND  
				( "CUPONERAS_DETALLE_WEB"."TIPO_MOV" = :ls_tipo )   ;
	if isnull(ll_count) then ll_count=0
	if ll_count = 0 then
		if ls_tipo='E' and ll_cuotas > 0 then
			ll_res						= messagebox("Advertencia","Está Seguro Generar Cupón Credito Web",Exclamation!,YesNo!,2)
		elseif ls_tipo='F' and ll_cuotas > 0 then
			ll_res						= messagebox("Advertencia","Está Seguro Generar Cupón Mantención Web",Exclamation!,YesNo!,2)
		else
			messagebox("Advertencia","Debe Ingresar mas de 1 Cuota para Generar Cupon Web")
			ll_res						= 2
			em_cuotas.text			= ''
		end if
		if ll_res=1 then
			select id_cuponeras_web.nextval into :ll_cupon from dual;

//			SELECT 	Max("CUPONERAS_DETALLE_WEB"."NRO_CUPON")  
//			INTO 		:ll_cupon  
//			FROM 	"CUPONERAS_DETALLE_WEB"  
//			USING	sqlca;
//			if isnull(ll_cupon) then ll_cupon=0
//			ll_cupon ++
			INSERT INTO "CUPONERAS_DETALLE_WEB"  
						( "BASE",   	"SERIE",   	"NUMERO",   	"NRO_CUPON",   	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"TIPO_MONEDA" )  
			VALUES 	( :gs_base,  :gs_serie,   	:gi_numero,   	:ll_cupon,   			:gi_rut,   :ll_cuotas, 			:ldt_fecha,   		'V',   								:ls_tipo,   		null,   					:gi_rut,   				null,   			:ll_suma_valor_cuota,   				0,   								0,   									0,   										1,   						:gs_dv,  	:ls_moneda )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
				messagebox("Grabar","Grabación Exitosa Cupon "+ls_descrip+" N° "+string(ll_cupon))
				for ll_indi=1 to ll_tot_reg
					ls_tipo_mov_reg		= dw_detalle.getitemstring(ll_indi,'cuponeras_detalle_tipo_mov')
					ls_estado_cupon_reg	= dw_detalle.getitemstring(ll_indi,'cuponeras_detalle_estado_pago_cupon')
					ll_sw_web				= dw_detalle.getitemnumber(ll_indi,'cuponeras_detalle_sw_gran_cupon')
					if ls_tipo_mov_reg = ls_tipo and ls_estado_cupon_reg='V' and ll_sw_web = 0 then
						dw_detalle.setitem(ll_indi,'cuponeras_detalle_cupon_web',ll_cupon)
					end if
				next
				dw_detalle.accepttext()
				if dw_detalle.update()=1 then
					commit;
					w_ver_cupones.triggerevent(open!)
				else
					rollback;
				end if
			else
				rollback;
			end if
		end if
	else
		messagebox("Advertencia","No es posible Crear Cupon por Concepto Pago "+ls_descrip+", Ya Está Generado")
		em_cuotas.text		= ''
	end if
else
	em_cuotas.text			= ''
end if 
end event

type em_cuotas from editmask within tabpage_1
integer x = 1111
integer y = 932
integer width = 274
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

event modified;Long		ll_cant
String		ls_tipo

ll_cant				= Long(em_cuotas.text)
em_cup_mant.text	= ''
if ll_cant > 0 then
	Setnull(ls_tipo)
	if rb_credito.checked = true then
		ls_tipo	= 'E'
	elseif rb_mantencion.checked = true then
		ls_tipo	= 'F'
	end if
	if ls_tipo='E' and ll_cant > il_cant_e then
		messagebox("Advertencia","NO es posible Crear Cupon Credito, cuotas ingresadas Superan a las disponibles")
		em_cuotas.text	= ''
	elseif ls_tipo='F' and ll_cant > il_cant_f then
		messagebox("Advertencia","NO es posible Crear Cupon Mantención, cuotas ingresadas Superan a las disponibles")
		em_cuotas.text	= ''
//	else
//		pb_ok.triggerevent(clicked!)
	end if
end if
end event

type st_2 from statictext within tabpage_1
integer x = 823
integer y = 972
integer width = 261
integer height = 52
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cuotas"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_1
integer x = 823
integer y = 928
integer width = 261
integer height = 52
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar #"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_mantencion from radiobutton within tabpage_1
integer x = 416
integer y = 936
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mantención"
end type

event clicked;em_cuotas.text		= ''
em_cup_mant.text	= ''
em_cuotas.setfocus()
end event

type rb_credito from radiobutton within tabpage_1
integer x = 87
integer y = 936
integer width = 293
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Crédito"
boolean checked = true
end type

event clicked;em_cuotas.text		= ''
em_cup_mant.text	= ''
em_cuotas.setfocus()
end event

type dw_detalle from datawindow within tabpage_1
integer x = 37
integer y = 48
integer width = 3269
integer height = 788
integer taborder = 20
string dataobject = "dw_ver_cupon_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type gb_2 from groupbox within tabpage_1
integer x = 37
integer y = 860
integer width = 1586
integer height = 196
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Crear Cupón de Cuotas"
end type

type gb_3 from groupbox within tabpage_1
integer x = 2377
integer y = 860
integer width = 923
integer height = 196
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Crear Cupón Mantención"
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 108
integer width = 3333
integer height = 1084
long backcolor = 67108864
string text = "Detalle Cupones Web"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_anular_web cb_anular_web
dw_det_web dw_det_web
end type

on tabpage_2.create
this.cb_anular_web=create cb_anular_web
this.dw_det_web=create dw_det_web
this.Control[]={this.cb_anular_web,&
this.dw_det_web}
end on

on tabpage_2.destroy
destroy(this.cb_anular_web)
destroy(this.dw_det_web)
end on

type cb_anular_web from commandbutton within tabpage_2
integer x = 1477
integer y = 940
integer width = 539
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Anular Gran Cupón"
end type

event clicked;Long		ll_fila,ll_res,ll_sw_gran_cupon
Double	ll_gran_cupon
String		ls_tipo_mov,ls_estado_pago

if dw_det_web.rowcount() > 0 then
	ll_fila						= dw_det_web.getrow()
	if ll_fila > 0 then
		ll_gran_cupon		= dw_det_web.getitemnumber(ll_fila,'nro_cupon')
		ll_sw_gran_cupon	= 0
		ls_tipo_mov			= dw_det_web.getitemstring(ll_fila,'tipo_mov')
		ls_estado_pago		= dw_det_web.getitemstring(ll_fila,'estado_pago_cupon')
		if ll_gran_cupon > 0 and ll_sw_gran_cupon=0 and ls_estado_pago='V' then
			ll_res				= messagebox("Advertencia","Está Seguro Anular Gran Cupón N° "+string(ll_gran_cupon),Exclamation!,YesNo!,2)
			if ll_res=1 then
				UPDATE 	"CUPONERAS_DETALLE_WEB"  
				SET 		"ESTADO_PAGO_CUPON" = 'A',   
							"FECHA_PAGO" = :gdt_fec_sistema  
				WHERE 	( "CUPONERAS_DETALLE_WEB"."BASE" = :gs_base ) AND  
							( "CUPONERAS_DETALLE_WEB"."SERIE" = :gs_serie ) AND  
							( "CUPONERAS_DETALLE_WEB"."NUMERO" = :gi_numero ) AND  
							( "CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :ll_gran_cupon ) AND  
							( "CUPONERAS_DETALLE_WEB"."ESTADO_PAGO_CUPON" = 'V' ) AND  
							( "CUPONERAS_DETALLE_WEB"."TIPO_MOV" = :ls_tipo_mov )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
					UPDATE 	"CUPONERAS_DETALLE"  
					SET 		"CUPON_WEB" = null,   
								"SW_GRAN_CUPON" = 1  
					WHERE 	( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
								( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
								( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
								( "CUPONERAS_DETALLE"."TIPO_MOV" = :ls_tipo_mov ) AND  
								( "CUPONERAS_DETALLE"."SW_GRAN_CUPON" = 0 ) AND  
								( "CUPONERAS_DETALLE"."CUPON_WEB" = :ll_gran_cupon )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						messagebox("Anular","Anulación Exitosa")
						w_ver_cupones.triggerevent(open!)
//						dw_detalle.retrieve(gs_base,gs_serie,gi_numero)
					else
						rollback;
					end if
				else
					rollback;
					messagebox("Error Anular","Error en Anulación Gran Cupón SQL: "+sqlca.sqlerrtext)
				end if
			end if
		end if
	end if
end if
end event

type dw_det_web from datawindow within tabpage_2
integer x = 32
integer y = 32
integer width = 3278
integer height = 872
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_detalle_cuponeras_web"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

type cb_ordenar from commandbutton within w_ver_cupones
event ue_mousemove pbm_dwnmousemove
integer x = 2962
integer y = 88
integer width = 370
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if tab_1.tabpage_1.dw_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	tab_1.tabpage_1.dw_detalle.SETSORT(NULO)
	tab_1.tabpage_1.dw_detalle.SORT()
end if
end event

type cb_filtrar from commandbutton within w_ver_cupones
event ue_mousemove pbm_mousemove
integer x = 2962
integer y = 204
integer width = 370
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string ls_texto
setnull (gs_formula)
tab_1.tabpage_1.dw_detalle.SETfilter(gs_formula)
tab_1.tabpage_1.dw_detalle.filter()
ll_filas		= tab_1.tabpage_1.dw_detalle.rowcount()
gs_formula 	= tab_1.tabpage_1.dw_detalle.describe("datawindow.syntax")
ll_largototal	= len(gs_formula)
ll_posini	= Pos(gs_formula, "filter") + 8
ll_posfin	= len("~nfilter~n")
ls_texto		= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto		= ll_posfin - ll_posini
gs_formula	= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula	= ''
end if

end event

type cb_exportar from commandbutton within w_ver_cupones
event ue_mousemove pbm_mousemove
integer x = 2962
integer y = 320
integer width = 370
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_print
if dw_print.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type dw_print from datawindow within w_ver_cupones
boolean visible = false
integer x = 1303
integer y = 2412
integer width = 585
integer height = 432
string dataobject = "dw_ver_cupon_imprimir"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_ver_cupones
integer x = 2962
integer y = 552
integer width = 370
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ver_cupones)
end event

type cb_print from commandbutton within w_ver_cupones
integer x = 2962
integer y = 436
integer width = 370
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

event clicked;if dw_print.rowcount()>0 then
	f_Print( dw_print )
end if
end event

type dw_lista from datawindow within w_ver_cupones
integer x = 41
integer y = 12
integer width = 2843
integer height = 1160
string title = "none"
string dataobject = "dw_ver_cupon"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_ver_cupones
event ue_mousemove pbm_mousemove
integer x = 2917
integer y = 792
integer width = 453
integer height = 344
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_4 from groupbox within w_ver_cupones
event ue_mousemove pbm_mousemove
integer x = 2917
integer y = 32
integer width = 453
integer height = 648
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

