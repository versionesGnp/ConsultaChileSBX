forward
global type w_ingreso_boletas_depositos from window
end type
type ddplb_sociedad from dropdownpicturelistbox within w_ingreso_boletas_depositos
end type
type st_7 from statictext within w_ingreso_boletas_depositos
end type
type dw_print from datawindow within w_ingreso_boletas_depositos
end type
type cb_imprimir from commandbutton within w_ingreso_boletas_depositos
end type
type cb_grabar from commandbutton within w_ingreso_boletas_depositos
end type
type st_parque from statictext within w_ingreso_boletas_depositos
end type
type st_fecha from statictext within w_ingreso_boletas_depositos
end type
type st_caja from statictext within w_ingreso_boletas_depositos
end type
type st_3 from statictext within w_ingreso_boletas_depositos
end type
type st_2 from statictext within w_ingreso_boletas_depositos
end type
type st_1 from statictext within w_ingreso_boletas_depositos
end type
type cb_25 from commandbutton within w_ingreso_boletas_depositos
end type
type cb_print_depositos from commandbutton within w_ingreso_boletas_depositos
end type
type cb_exportar_depositos from commandbutton within w_ingreso_boletas_depositos
end type
type cb_filtrar_depositos from commandbutton within w_ingreso_boletas_depositos
end type
type cb_sort_depositos from commandbutton within w_ingreso_boletas_depositos
end type
type cb_cerrar from commandbutton within w_ingreso_boletas_depositos
end type
type tab_1 from tab within w_ingreso_boletas_depositos
end type
type tabpage_1 from userobject within tab_1
end type
type st_saldo_efectivo from statictext within tabpage_1
end type
type st_total_efectivo from statictext within tabpage_1
end type
type cb_grabar_depositos from commandbutton within tabpage_1
end type
type cb_eliminar_boleta from commandbutton within tabpage_1
end type
type cb_crear from commandbutton within tabpage_1
end type
type st_10 from statictext within tabpage_1
end type
type dw_deposito_ef from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_saldo_efectivo st_saldo_efectivo
st_total_efectivo st_total_efectivo
cb_grabar_depositos cb_grabar_depositos
cb_eliminar_boleta cb_eliminar_boleta
cb_crear cb_crear
st_10 st_10
dw_deposito_ef dw_deposito_ef
end type
type tabpage_2 from userobject within tab_1
end type
type st_saldo_cheque from statictext within tabpage_2
end type
type st_total_cheque from statictext within tabpage_2
end type
type cb_graba_ch from commandbutton within tabpage_2
end type
type cb_eliminar_ch from commandbutton within tabpage_2
end type
type cb_crear_ch from commandbutton within tabpage_2
end type
type st_4 from statictext within tabpage_2
end type
type dw_deposito_ch from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_saldo_cheque st_saldo_cheque
st_total_cheque st_total_cheque
cb_graba_ch cb_graba_ch
cb_eliminar_ch cb_eliminar_ch
cb_crear_ch cb_crear_ch
st_4 st_4
dw_deposito_ch dw_deposito_ch
end type
type tab_1 from tab within w_ingreso_boletas_depositos
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_ingreso_boletas_depositos from window
integer width = 4229
integer height = 1728
boolean titlebar = true
string title = "Ingreso Depositos Efectivo & Cheque al Día"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
ddplb_sociedad ddplb_sociedad
st_7 st_7
dw_print dw_print
cb_imprimir cb_imprimir
cb_grabar cb_grabar
st_parque st_parque
st_fecha st_fecha
st_caja st_caja
st_3 st_3
st_2 st_2
st_1 st_1
cb_25 cb_25
cb_print_depositos cb_print_depositos
cb_exportar_depositos cb_exportar_depositos
cb_filtrar_depositos cb_filtrar_depositos
cb_sort_depositos cb_sort_depositos
cb_cerrar cb_cerrar
tab_1 tab_1
end type
global w_ingreso_boletas_depositos w_ingreso_boletas_depositos

type variables
String		is_caja
Date		idt_fecha
Long		il_cod_parque, il_monto_ef, il_monto_ch,il_monto_deposito_ef,il_count_ch
end variables

on w_ingreso_boletas_depositos.create
this.ddplb_sociedad=create ddplb_sociedad
this.st_7=create st_7
this.dw_print=create dw_print
this.cb_imprimir=create cb_imprimir
this.cb_grabar=create cb_grabar
this.st_parque=create st_parque
this.st_fecha=create st_fecha
this.st_caja=create st_caja
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_25=create cb_25
this.cb_print_depositos=create cb_print_depositos
this.cb_exportar_depositos=create cb_exportar_depositos
this.cb_filtrar_depositos=create cb_filtrar_depositos
this.cb_sort_depositos=create cb_sort_depositos
this.cb_cerrar=create cb_cerrar
this.tab_1=create tab_1
this.Control[]={this.ddplb_sociedad,&
this.st_7,&
this.dw_print,&
this.cb_imprimir,&
this.cb_grabar,&
this.st_parque,&
this.st_fecha,&
this.st_caja,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_25,&
this.cb_print_depositos,&
this.cb_exportar_depositos,&
this.cb_filtrar_depositos,&
this.cb_sort_depositos,&
this.cb_cerrar,&
this.tab_1}
end on

on w_ingreso_boletas_depositos.destroy
destroy(this.ddplb_sociedad)
destroy(this.st_7)
destroy(this.dw_print)
destroy(this.cb_imprimir)
destroy(this.cb_grabar)
destroy(this.st_parque)
destroy(this.st_fecha)
destroy(this.st_caja)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_25)
destroy(this.cb_print_depositos)
destroy(this.cb_exportar_depositos)
destroy(this.cb_filtrar_depositos)
destroy(this.cb_sort_depositos)
destroy(this.cb_cerrar)
destroy(this.tab_1)
end on

event open;String		ls_descrip_parque,ls_sociedad, ls_descrip_sociedad,ls_descrip_soc
Long		ll_count_ef,ll_count_ch
gf_centrar(w_ingreso_boletas_depositos)
is_caja  						= substr(1,1,Message.StringParm)
idt_fecha  					= Date(substr(1,2,Message.StringParm))
il_cod_parque  				= Long(substr(1,3,Message.StringParm))

ddplb_sociedad.reset()

DECLARE x0 CURSOR FOR  
SELECT 		"SAP_SOCIEDAD"."CODIGO",   
         		"SAP_SOCIEDAD"."DESCRIPCION"  
FROM 		"SAP_SOCIEDAD"  
WHERE 		"SAP_SOCIEDAD"."ESTADO" = 'V'    
ORDER BY 	"SAP_SOCIEDAD"."CODIGO" ASC   
USING		sqlca;
open x0;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x0 into :ls_sociedad, :ls_descrip_sociedad;
		if not isnull(ls_sociedad) and ls_sociedad<>'' then
			ddplb_sociedad.additem(ls_sociedad + ' - ' +ls_descrip_sociedad)
		end if
		Setnull(ls_sociedad)
	LOOP
end if
close x0;
if gs_conexion	= "Parque El Prado" then
	ls_sociedad				= 'CL02'
	SELECT	"SAP_SOCIEDAD"."DESCRIPCION"  
	INTO 		:ls_descrip_soc  
	FROM 	"SAP_SOCIEDAD"  
	WHERE 	"SAP_SOCIEDAD"."CODIGO" = :ls_sociedad   ;
	ddplb_sociedad.text	= ls_sociedad+' - '+ls_descrip_soc
else
	ls_sociedad				= 'CL03'
	SELECT	"SAP_SOCIEDAD"."DESCRIPCION"  
	INTO 		:ls_descrip_soc  
	FROM 	"SAP_SOCIEDAD"  
	WHERE 	"SAP_SOCIEDAD"."CODIGO" = :ls_sociedad   ;
	ddplb_sociedad.text	= ls_sociedad+' - '+ls_descrip_soc
end if
tab_1.tabpage_1.dw_deposito_ef.settransobject(sqlca)
tab_1.tabpage_2.dw_deposito_ch.settransobject(sqlca)
ll_count_ef					= tab_1.tabpage_1.dw_deposito_ef.retrieve(is_caja,idt_fecha,ls_sociedad)
ll_count_ch					= tab_1.tabpage_2.dw_deposito_ch.retrieve(is_caja,idt_fecha,ls_sociedad)
dw_print.settransobject(sqlca)
st_caja.text					= is_caja
st_fecha.text				= String(idt_fecha,'dd/mm/yyyy')

//SELECT "COD_PARQ"."NOMBRE"  INTO :ls_descrip_parque  FROM "COD_PARQ"  WHERE "COD_PARQ"."CODIGO" = :il_cod_parque   ;
//st_parque.text				= string(il_cod_parque)+' - '+ls_descrip_parque

SELECT "TASA"."MONTO_DEPOSITO"  INTO :il_monto_deposito_ef  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
if ll_count_ef > 0 or ll_count_ch > 0 then
	if ls_sociedad <> 'CL04' then
		SELECT	SUM( "DOCUMENTOS"."MONTO" )
		INTO		:il_monto_ef
		FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."COD_PAGO" = 'EF' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
					"DOCUMENTOS"."TIPO_COB_AUX" <> 'BA'  ;
//				 (( "DOCUMENTOS"."TIPO_COB" = 'BE' OR "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "DOCUMENTOS"."TIPO_COB" = 'FE') and "DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ) ;
//				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI' ) ;
		tab_1.tabpage_1.st_total_efectivo.text	= 'Total Ingreso Efectivo $ '+string(il_monto_ef,'###,###,###,###,##0')
		if isnull(il_monto_ef) then il_monto_ef=0
		SELECT	SUM( "DOCUMENTOS"."MONTO" )
		INTO		:il_monto_ch
		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
					"DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ;
//				  (( "DOCUMENTOS"."TIPO_COB" = 'BE' OR "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "DOCUMENTOS"."TIPO_COB" = 'FE') and "DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ) ;
//				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI' );
		if isnull(il_monto_ch) then il_monto_ch=0
		tab_1.tabpage_2.st_total_cheque.text		= 'Total Ingreso Cheque al día $ '+string(il_monto_ch,'###,###,###,###,##0')
		
		
		SELECT COUNT(DISTINCT	"DOCUMENTOS"."COD_BANCO")
		INTO		:il_count_ch
		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
					"DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ;
//				  (( "DOCUMENTOS"."TIPO_COB" = 'BE' OR "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "DOCUMENTOS"."TIPO_COB" = 'FE') and "DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ) ;
//				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI' );
		if isnull(il_count_ch) then il_count_ch=0
	else
		SELECT	SUM( "DOCUMENTOS"."MONTO" )
		INTO		:il_monto_ef
		FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."COD_PAGO" = 'EF' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
					"DOCUMENTOS"."TIPO_COB_AUX" = 'BA' ;
//				  (( "DOCUMENTOS"."TIPO_COB" = 'BA' or "DOCUMENTOS"."TIPO_COB" = 'FA' or "DOCUMENTOS"."TIPO_COB" = 'CU') and "DOCUMENTOS"."TIPO_COB_AUX" = 'BA') ;
//				 	("DOCUMENTOS"."TIPO_COB_AUX" = 'BA' or "DOCUMENTOS"."TIPO_COB_AUX" = 'FA' or "DOCUMENTOS"."TIPO_COB_AUX" = 'FE' or "VISTA_SAP_FOLIOS_CAJA"."BASE" = 'F') ;
		tab_1.tabpage_1.st_total_efectivo.text	= 'Total Ingreso Efectivo $ '+string(il_monto_ef,'###,###,###,###,##0')
		if isnull(il_monto_ef) then il_monto_ef=0
		SELECT	SUM( "DOCUMENTOS"."MONTO" )
		INTO		:il_monto_ch
		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
					"DOCUMENTOS"."TIPO_COB_AUX" = 'BA' ;
//					(("DOCUMENTOS"."TIPO_COB" = 'BA' or "DOCUMENTOS"."TIPO_COB" = 'FA' or "DOCUMENTOS"."TIPO_COB" = 'CU')  and "DOCUMENTOS"."TIPO_COB_AUX" = 'BA') ;
//				 	("DOCUMENTOS"."TIPO_COB_AUX" = 'BA' or "DOCUMENTOS"."TIPO_COB_AUX" = 'FA' or "DOCUMENTOS"."TIPO_COB_AUX" = 'FE' OR "VISTA_SAP_FOLIOS_CAJA"."BASE" = 'F') ;
		if isnull(il_monto_ch) then il_monto_ch=0
		tab_1.tabpage_2.st_total_cheque.text		= 'Total Ingreso Cheque al día $ '+string(il_monto_ch,'###,###,###,###,##0')
		
		
		SELECT COUNT(DISTINCT	"DOCUMENTOS"."COD_BANCO")
		INTO		:il_count_ch
		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
					"DOCUMENTOS"."TIPO_COB_AUX" = 'BA' ;
//					(("DOCUMENTOS"."TIPO_COB" = 'BA' or "DOCUMENTOS"."TIPO_COB" = 'FA' or "DOCUMENTOS"."TIPO_COB" = 'CU')  and "DOCUMENTOS"."TIPO_COB_AUX" = 'BA') ;
//					("DOCUMENTOS"."TIPO_COB_AUX" = 'BA' or "DOCUMENTOS"."TIPO_COB_AUX" = 'FA' or "DOCUMENTOS"."TIPO_COB_AUX" = 'FE' OR "VISTA_SAP_FOLIOS_CAJA"."BASE" = 'F') ;
		if isnull(il_count_ch) then il_count_ch=0
	end if
end if
ddplb_sociedad.triggerevent(selectionchanged!)
ddplb_sociedad.setfocus()
end event

type ddplb_sociedad from dropdownpicturelistbox within w_ingreso_boletas_depositos
integer x = 357
integer y = 40
integer width = 1463
integer height = 544
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

event selectionchanged;String		ls_sociedad
Long		ll_suma_ef, ll_suma_ch

tab_1.tabpage_1.dw_deposito_ef.reset()
tab_1.tabpage_2.dw_deposito_ch.reset()
ls_sociedad		= mid(ddplb_sociedad.text,1,4)
if ls_sociedad <> 'CL04' then
	if ls_sociedad = 'CL02' or ls_sociedad = 'CL03' then
		SELECT	SUM( "DOCUMENTOS"."MONTO" )
		INTO		:il_monto_ef
		FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."COD_PAGO" = 'EF' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
					"DOCUMENTOS"."TIPO_COB_AUX" <> 'BA'  ;
		if isnull(il_monto_ef) then il_monto_ef=0
		tab_1.tabpage_1.st_total_efectivo.text	= 'Total Ingreso Efectivo $ '+string(il_monto_ef,'###,###,###,###,##0')
		tab_1.tabpage_1.st_saldo_efectivo.text	= 'Saldo Efectivo:  ' +string(il_monto_ef,'###,###,###,##0')
		SELECT	SUM( "DOCUMENTOS"."MONTO" )
		INTO		:il_monto_ch
		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
				  	"DOCUMENTOS"."TIPO_COB_AUX" <> 'BA'  ;
		if isnull(il_monto_ch) then il_monto_ch=0
		tab_1.tabpage_2.st_total_cheque.text		= 'Total Ingreso Cheque al día $ '+string(il_monto_ch,'###,###,###,###,##0')
		tab_1.tabpage_2.st_saldo_cheque.text	= 'Saldo Cheque:  ' +string(il_monto_ch,'###,###,###,##0')
		SELECT COUNT(DISTINCT	"DOCUMENTOS"."COD_BANCO")
		INTO		:il_count_ch
		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
				  	"DOCUMENTOS"."TIPO_COB_AUX" <> 'BA'  ;
		if isnull(il_count_ch) then il_count_ch=0
//	elseif ls_sociedad = 'CL03' then
//		SELECT	SUM( "DOCUMENTOS"."MONTO" )
//		INTO		:il_monto_ef
//		FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
//		WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
//					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
//					"DOCUMENTOS"."COD_PAGO" = 'EF' AND
//					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
//					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
//					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
//					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
//					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
//					"VISTA_SAP_FOLIOS_CAJA"."COD_PARQUE" = 11 AND
//				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI' ) ;
//		 if isnull(il_monto_ef) then il_monto_ef=0
//		tab_1.tabpage_1.st_total_efectivo.text	= 'Total Ingreso Efectivo $ '+string(il_monto_ef,'###,###,###,###,##0')
//		tab_1.tabpage_1.st_saldo_efectivo.text	= 'Saldo Efectivo:  ' +string(il_monto_ef,'###,###,###,##0')
//		SELECT	SUM( "DOCUMENTOS"."MONTO" )
//		INTO		:il_monto_ch
//		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
//		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
//					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
//					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
//					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
//					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
//					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
//					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
//					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
//					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
//					"VISTA_SAP_FOLIOS_CAJA"."COD_PARQUE" = 11 and
//				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI' );
//		if isnull(il_monto_ch) then il_monto_ch=0
//		tab_1.tabpage_2.st_total_cheque.text		= 'Total Ingreso Cheque al día $ '+string(il_monto_ch,'###,###,###,###,##0')
//		tab_1.tabpage_2.st_saldo_cheque.text	= 'Saldo Cheque:  ' +string(il_monto_ch,'###,###,###,##0')
//		SELECT COUNT(DISTINCT	"DOCUMENTOS"."COD_BANCO")
//		INTO		:il_count_ch
//		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
//		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
//					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
//					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
//					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
//					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
//					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
//					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
//					"DOCUMENTOS"."COD_CAJA" = :is_caja AND
//					"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
//					"VISTA_SAP_FOLIOS_CAJA"."COD_PARQUE" = 11 and
//				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI' );
//		if isnull(il_count_ch) then il_count_ch=0
	end if
else
	SELECT	SUM( "DOCUMENTOS"."MONTO" )
	INTO		:il_monto_ef
	FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
	WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
				"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
				"DOCUMENTOS"."COD_PAGO" = 'EF' AND
				"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
				"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
				"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
				"DOCUMENTOS"."COD_CAJA" = :is_caja AND
				"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
			  	"DOCUMENTOS"."TIPO_COB_AUX" = 'BA' ;
	
	
	if isnull(il_monto_ef) then il_monto_ef=0
	tab_1.tabpage_1.st_total_efectivo.text	= 'Total Ingreso Efectivo $ '+string(il_monto_ef,'###,###,###,###,##0')
	tab_1.tabpage_1.st_saldo_efectivo.text	= 'Saldo Efectivo: '+string(il_monto_ef,'###,###,###,###,##0')
	SELECT	SUM( "DOCUMENTOS"."MONTO" )
	INTO		:il_monto_ch
	FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
	WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
				"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
				"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
				"DOCUMENTOS"."COD_PAGO" = 'CH' AND
				"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
				"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
				"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
				"DOCUMENTOS"."COD_CAJA" = :is_caja AND
				"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
				"DOCUMENTOS"."TIPO_COB_AUX" = 'BA' ;
	if isnull(il_monto_ch) then il_monto_ch=0
	tab_1.tabpage_2.st_total_cheque.text		= 'Total Ingreso Cheque al día $ '+string(il_monto_ch,'###,###,###,###,##0')
	tab_1.tabpage_2.st_saldo_cheque.text	= 'Saldo Cheque: '+string(il_monto_ch,'###,###,###,###,##0')
	SELECT COUNT(DISTINCT	"DOCUMENTOS"."COD_BANCO")
	INTO		:il_count_ch
	FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
	WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
				"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
				"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
				"DOCUMENTOS"."COD_PAGO" = 'CH' AND
				"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
				"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
				"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
				"DOCUMENTOS"."COD_CAJA" = :is_caja AND
				"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
				"DOCUMENTOS"."TIPO_COB_AUX" = 'BA' ;
	if isnull(il_count_ch) then il_count_ch=0
end if
if tab_1.tabpage_1.dw_deposito_ef.retrieve(is_caja,idt_fecha,ls_sociedad) > 0 then
	ll_suma_ef												= tab_1.tabpage_1.dw_deposito_ef.getitemnumber(1,'c_suma')
	tab_1.tabpage_1.st_saldo_efectivo.text		= 'Saldo Efectivo:  ' +string(il_monto_ef - ll_suma_ef,'###,###,###,##0')
end if
if tab_1.tabpage_2.dw_deposito_ch.retrieve(is_caja,idt_fecha,ls_sociedad) > 0 then
	ll_suma_ch												= tab_1.tabpage_2.dw_deposito_ch.getitemnumber(1,'c_suma')
	tab_1.tabpage_2.st_saldo_cheque.text		= 'Saldo Cheque:  ' +string(il_monto_ch - ll_suma_ch,'###,###,###,##0')
end if


end event

type st_7 from statictext within w_ingreso_boletas_depositos
integer x = 46
integer y = 48
integer width = 288
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Sociedad"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_print from datawindow within w_ingreso_boletas_depositos
boolean visible = false
integer x = 9
integer y = 1596
integer width = 3863
integer height = 840
string title = "none"
string dataobject = "dwe_imprimir_depositos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_ingreso_boletas_depositos
integer x = 2848
integer y = 1492
integer width = 466
integer height = 104
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;Long		ll_fila
String		ls_sociedad

dw_print.reset()
//ll_fila				= dw_print.insertrow(0)
ls_sociedad			= mid(ddplb_sociedad.text,1,4)
if dw_print.retrieve(is_caja,idt_fecha,ls_sociedad) > 0 then
	dw_print.accepttext()
	f_Print( dw_print )
end if
end event

type cb_grabar from commandbutton within w_ingreso_boletas_depositos
integer x = 1861
integer y = 1492
integer width = 466
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Long		ll_suma_ch,ll_suma_ef,ll_pos,ll_indi,ll_tot_reg,ll_res
String		ls_sociedad,ls_pasa_ef='S',ls_pasa_ch='S'
Double	ll_monto_ef,ll_monto_ch

ls_sociedad			= mid(ddplb_sociedad.text,1,4)
if isnull(ls_sociedad) then
	messagebox("Advertencia","Debe Seleccionar Sociedad")
	ddplb_sociedad.setfocus()
else
	if tab_1.tabpage_1.dw_deposito_ef.rowcount() > 0 then
		ll_suma_ef				= tab_1.tabpage_1.dw_deposito_ef.getitemnumber(1,'c_suma')
		if il_monto_ef <> ll_suma_ef and ll_suma_ef > 0 then
			messagebox("Advertencia","No Coincide Suma Efectivo en Caja $ "+string(il_monto_ef,'###,###,###,###,##0'))
			ls_pasa_ef			= 'N'
		end if	
	end if
	if tab_1.tabpage_2.dw_deposito_ch.rowcount() > 0 and ls_pasa_ef = 'S' then
		ll_suma_ch	= tab_1.tabpage_2.dw_deposito_ch.getitemnumber(1,'c_suma')
		if il_monto_ch <> ll_suma_ch and ll_suma_ch > 0 then
			messagebox("Advertencia","No Coincide Suma Cheque en Caja $ "+string(il_monto_ch,'###,###,###,###,##0'))
			ls_pasa_ch				= 'N'
		end if		
	end if
	if ls_pasa_ef='S' and ls_pasa_ch='S' then
		ll_res							= messagebox("Garabar","Está Seguro Grabar Deposito",Exclamation!,YesNo!,2)
		if ll_res = 1 then
			if il_monto_ef = ll_suma_ef then
				ll_tot_reg			= tab_1.tabpage_1.dw_deposito_ef.rowcount()
				for ll_indi=1 to ll_tot_reg
					tab_1.tabpage_1.dw_deposito_ef.setitem(ll_indi,'correlativo',ll_indi)
					ll_monto_ef		= tab_1.tabpage_1.dw_deposito_ef.getitemnumber(ll_indi,'monto')
					tab_1.tabpage_1.dw_deposito_ef.setitem(ll_indi,'monto_uf',ll_monto_ef)
				next
				tab_1.tabpage_1.dw_deposito_ef.accepttext()
				if tab_1.tabpage_1.dw_deposito_ef.update()=1 then
					commit;
					if tab_1.tabpage_2.dw_deposito_ch.rowcount() > 0 then
						ll_suma_ch	= tab_1.tabpage_2.dw_deposito_ch.getitemnumber(1,'c_suma')
						if il_monto_ch = ll_suma_ch then
							ll_tot_reg			= tab_1.tabpage_2.dw_deposito_ch.rowcount()
							for ll_indi=1 to ll_tot_reg
								tab_1.tabpage_2.dw_deposito_ch.setitem(ll_indi,'correlativo',ll_indi)
								ll_monto_ch		= tab_1.tabpage_2.dw_deposito_ch.getitemnumber(ll_indi,'monto')
								tab_1.tabpage_2.dw_deposito_ch.setitem(ll_indi,'monto_uf',ll_monto_ch)
							next
							tab_1.tabpage_2.dw_deposito_ch.accepttext()
							if tab_1.tabpage_2.dw_deposito_ch.update()=1 then
								commit;
		//						messagebox("Grabar","Grabación Exitosa Boleta Deposito para Caja "+is_caja +" del "+string(idt_fecha,'dd/mm/yyyy'))
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar Deposito Cheque SQL "+sqlca.sqlerrtext)
							end if
						end if
					end if
					messagebox("Grabar","Grabación Exitosa, Deposito para Caja "+is_caja +" del "+string(idt_fecha,'dd/mm/yyyy') + ' - Total Monto Efectivo $ '+string(il_monto_ef,'###,###,###,##0')+' / Monto Cheque al día $ '+string(il_monto_ch,'###,###,###,##0'))
					close(w_ingreso_boletas_depositos)
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Deposito Efectivo SQL "+sqlca.sqlerrtext)
				end if
			end if
		end if
	end if
end if
end event

type st_parque from statictext within w_ingreso_boletas_depositos
boolean visible = false
integer x = 3397
integer y = 40
integer width = 773
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_fecha from statictext within w_ingreso_boletas_depositos
integer x = 2656
integer y = 40
integer width = 453
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_caja from statictext within w_ingreso_boletas_depositos
integer x = 2062
integer y = 40
integer width = 325
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_3 from statictext within w_ingreso_boletas_depositos
boolean visible = false
integer x = 3090
integer y = 56
integer width = 270
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ingreso_boletas_depositos
integer x = 1851
integer y = 48
integer width = 187
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Caja"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ingreso_boletas_depositos
integer x = 2336
integer y = 48
integer width = 293
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Pago"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_25 from commandbutton within w_ingreso_boletas_depositos
integer x = 997
integer y = 1488
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;tab_1.tabpage_1.dw_deposito_ef.reset()
tab_1.tabpage_2.dw_deposito_ch.reset()
end event

type cb_print_depositos from commandbutton within w_ingreso_boletas_depositos
integer x = 722
integer y = 1488
integer width = 219
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;
CHOOSE CASE tab_1.SelectedTab
	CASE 1 //EF
		if tab_1.tabpage_1.dw_deposito_ef.rowcount() > 0 then
			tab_1.tabpage_1.dw_deposito_ef.print()
		end if
	
	CASE 2 //EF
		if tab_1.tabpage_2.dw_deposito_ch.rowcount() > 0 then
			tab_1.tabpage_2.dw_deposito_ch.print()
		end if
END CHOOSE
end event

type cb_exportar_depositos from commandbutton within w_ingreso_boletas_depositos
integer x = 498
integer y = 1488
integer width = 219
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
CHOOSE CASE tab_1.SelectedTab
	CASE 1 //EF
		if tab_1.tabpage_1.dw_deposito_ef.rowcount() > 0 then
			dw_paso	= tab_1.tabpage_1.dw_deposito_ef
			if tab_1.tabpage_1.dw_deposito_ef.rowcount() > 0 then f_DWToExcel( dw_paso )
		end if
	
	CASE 2 //EF
		if tab_1.tabpage_2.dw_deposito_ch.rowcount() > 0 then
			dw_paso	= tab_1.tabpage_2.dw_deposito_ch
			if tab_1.tabpage_2.dw_deposito_ch.rowcount() > 0 then f_DWToExcel( dw_paso )
		end if
END CHOOSE
end event

type cb_filtrar_depositos from commandbutton within w_ingreso_boletas_depositos
integer x = 274
integer y = 1488
integer width = 219
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)

CHOOSE CASE tab_1.SelectedTab
	CASE 1 //EF
		tab_1.tabpage_1.dw_deposito_ef.SETfilter(NULO)
		tab_1.tabpage_1.dw_deposito_ef.filter()
	
	CASE 2 //EF
		tab_1.tabpage_2.dw_deposito_ch.SETfilter(NULO)
		tab_1.tabpage_2.dw_deposito_ch.filter()
END CHOOSE
end event

type cb_sort_depositos from commandbutton within w_ingreso_boletas_depositos
integer x = 50
integer y = 1488
integer width = 219
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
setnull (nulo)
CHOOSE CASE tab_1.SelectedTab
	CASE 1 //EF
		if tab_1.tabpage_1.dw_deposito_ef.rowcount() > 0 then
			tab_1.tabpage_1.dw_deposito_ef.SETSORT(NULO)
			tab_1.tabpage_1.dw_deposito_ef.SORT()
		end if
	
	CASE 2 //EF
		if tab_1.tabpage_2.dw_deposito_ch.rowcount() > 0 then
			tab_1.tabpage_2.dw_deposito_ch.SETSORT(NULO)
			tab_1.tabpage_2.dw_deposito_ch.SORT()
		end if
END CHOOSE
end event

type cb_cerrar from commandbutton within w_ingreso_boletas_depositos
integer x = 3831
integer y = 1488
integer width = 343
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ingreso_boletas_depositos)
end event

type tab_1 from tab within w_ingreso_boletas_depositos
integer x = 46
integer y = 192
integer width = 4128
integer height = 1264
integer taborder = 10
integer textsize = -8
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

event selectionchanged;//CHOOSE CASE tab_1.SelectedTab
//	CASE 1 //EF
//		 tab_1.tabpage_1.cb_mostrar_depositos.triggerevent(clicked!)
//	
//	CASE 2 //EF
//		tab_1.tabpage_2.cb_mostrar_ch.triggerevent(clicked!)
//END CHOOSE
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4091
integer height = 1144
long backcolor = 67108864
string text = "Deposito - Efectivo"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_saldo_efectivo st_saldo_efectivo
st_total_efectivo st_total_efectivo
cb_grabar_depositos cb_grabar_depositos
cb_eliminar_boleta cb_eliminar_boleta
cb_crear cb_crear
st_10 st_10
dw_deposito_ef dw_deposito_ef
end type

on tabpage_1.create
this.st_saldo_efectivo=create st_saldo_efectivo
this.st_total_efectivo=create st_total_efectivo
this.cb_grabar_depositos=create cb_grabar_depositos
this.cb_eliminar_boleta=create cb_eliminar_boleta
this.cb_crear=create cb_crear
this.st_10=create st_10
this.dw_deposito_ef=create dw_deposito_ef
this.Control[]={this.st_saldo_efectivo,&
this.st_total_efectivo,&
this.cb_grabar_depositos,&
this.cb_eliminar_boleta,&
this.cb_crear,&
this.st_10,&
this.dw_deposito_ef}
end on

on tabpage_1.destroy
destroy(this.st_saldo_efectivo)
destroy(this.st_total_efectivo)
destroy(this.cb_grabar_depositos)
destroy(this.cb_eliminar_boleta)
destroy(this.cb_crear)
destroy(this.st_10)
destroy(this.dw_deposito_ef)
end on

type st_saldo_efectivo from statictext within tabpage_1
integer x = 2633
integer y = 1024
integer width = 919
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_total_efectivo from statictext within tabpage_1
integer x = 1449
integer y = 1024
integer width = 1134
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_grabar_depositos from commandbutton within tabpage_1
boolean visible = false
integer x = 3566
integer y = 1012
integer width = 475
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Grabar"
end type

event clicked;Long		ll_suma,ll_suma_ef,ll_pos,ll_indi,ll_tot_reg
String		ls_sociedad

if dw_deposito_ef.rowcount() > 0 then
	ls_sociedad			= mid(ddplb_sociedad.text,1,4)
	if isnull(ls_sociedad) then
		messagebox("Advertencia","Debe Seleccionar Sociedad")
		ddplb_sociedad.setfocus()
	else
		ll_suma		= dw_deposito_ef.getitemnumber(1,'c_suma')
		if ls_sociedad <> 'CL04' then
			SELECT	SUM( "DOCUMENTOS"."MONTO" )
			INTO		:ll_suma_ef
			FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
			WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
						"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
						"DOCUMENTOS"."COD_PAGO" = 'EF' AND
						"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
						"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
						"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
						"DOCUMENTOS"."COD_CAJA" = :is_caja AND
						"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
						"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
						("DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI') 
			USING	sqlca;
		else
			SELECT	SUM( "DOCUMENTOS"."MONTO" )
			INTO		:ll_suma_ef
			FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
			WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
						"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
						"DOCUMENTOS"."COD_PAGO" = 'EF' AND
						"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
						"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
						"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
						"DOCUMENTOS"."COD_CAJA" = :is_caja AND
						"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
						("DOCUMENTOS"."TIPO_COB_AUX" = 'BA' or "DOCUMENTOS"."TIPO_COB_AUX" = 'FA' or "VISTA_SAP_FOLIOS_CAJA"."BASE" = 'F')
			USING	sqlca;
		end if
		if ll_suma_ef = ll_suma then
			ll_tot_reg			= dw_deposito_ef.rowcount()
			for ll_indi=1 to ll_tot_reg
				dw_deposito_ef.setitem(ll_indi,'correlativo',ll_indi)
			next
			dw_deposito_ef.accepttext()
			if dw_deposito_ef.update()=1 then
				commit;
				messagebox("Grabar","Grabación Exitosa Boleta Deposito para Caja "+is_caja +" del "+string(idt_fecha,'dd/mm/yyyy'))
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Boleta Deposito SQL "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","No Coincide Suma Efectivo en Caja $ "+string(ll_suma_ef,'###,###,###,###,##0'))
		end if
	end if
end if
end event

type cb_eliminar_boleta from commandbutton within tabpage_1
integer x = 901
integer y = 1012
integer width = 485
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar Deposito"
end type

event clicked;Long		ll_fila,ll_res

if dw_deposito_ef.getrow() > 0 then
	ll_fila		= dw_deposito_ef.getrow()
//	ll_res		= messagebox("Eliminar","Está Seguro Eliminar Fila N° "+string(ll_fila),Exclamation!,YesNo!,2)
//	if ll_res=1 then
		dw_deposito_ef.deleterow(ll_fila)
		messagebox("Eliminación","Eliminación Fila "+string(ll_fila)+" Exitosa, recuerde Grabar los Cambios antes de Salir")
//	end if
end if
end event

type cb_crear from commandbutton within tabpage_1
integer x = 466
integer y = 1012
integer width = 425
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crear Deposito"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_monto,ll_fila,ll_pos
String		ls_cuenta,ls_boleta,ls_caja,ls_sociedad,ls_pasa='S'
date		MIAR

if il_monto_ef > 0 then
	ls_sociedad			= mid(ddplb_sociedad.text,1,4)
	if isnull(ls_sociedad) then
		messagebox("Advertencia","Debe Seleccionar Sociedad")
		ddplb_sociedad.setfocus()
	else
		ll_tot_reg		= dw_deposito_ef.rowcount()
		for ll_indi=1 to ll_tot_reg
			ls_boleta		= dw_deposito_ef.getitemstring(ll_indi,'boleta_deposito')
			ll_monto		= dw_deposito_ef.getitemnumber(ll_indi,'monto')
			if isnull(ls_boleta) or ls_boleta='' then
				messagebox("Advertencia","Debe Ingresar N° Boleta Depósito en Fila "+string(ll_indi))
				dw_deposito_ef.setfocus()
				dw_deposito_ef.scrolltorow(ll_indi)
				dw_deposito_ef.setcolumn('boleta_deposito')
				ls_pasa	= 'N'
			elseif isnull(ll_monto) or ll_monto=0 then
				messagebox("Advertencia","Debe Ingresar Monto en Fila "+string(ll_indi))
				dw_deposito_ef.setfocus()
				dw_deposito_ef.scrolltorow(ll_indi)
				dw_deposito_ef.setcolumn('monto')
				ls_pasa	= 'N'
			end if
		next
		if ls_pasa = 'S' then
			ll_fila			= dw_deposito_ef.insertrow(0)
			dw_deposito_ef.scrolltorow(ll_fila)
			dw_deposito_ef.setitem(ll_fila,'cod_caja',is_caja)
			dw_deposito_ef.setitem(ll_fila,'sociedad',ls_sociedad)
			dw_deposito_ef.setitem(ll_fila,'cod_pago','EF')
			dw_deposito_ef.setitem(ll_fila,'fecha_pago',idt_fecha)
			SELECT DISTINCT 	"SAP_CUENTAS_CONTABLES"."CUENTA_CONTABLE"  
			INTO		:ls_cuenta
			FROM 	"SAP_CUENTAS_CONTABLES"  
			WHERE ( "SAP_CUENTAS_CONTABLES"."COD_CAJA" =:is_caja) AND  
					  ( "SAP_CUENTAS_CONTABLES"."COD_PAGO" = 'EF' ) AND  
					  ( "SAP_CUENTAS_CONTABLES"."ESTADO_CHEQUE" = 'EF' ) AND  
					  ( "SAP_CUENTAS_CONTABLES"."SOCIEDAD" = :ls_sociedad ) AND  
					  ( "SAP_CUENTAS_CONTABLES"."TIPO_MOV" = 'E' )   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_deposito_ef.setitem(ll_fila,'cuenta_contable',ls_cuenta)
				dw_deposito_ef.accepttext()
				dw_deposito_ef.setfocus()
				dw_deposito_ef.setcolumn('boleta_deposito')
			else
				messagebox("Advertencia","No se encontro Cuenta Contable")
			end if
		end if
	end if
else
	messagebox("Advertencia","No Registra Monto para Deposito en Efectivo")
end if
end event

type st_10 from statictext within tabpage_1
integer y = 1032
integer width = 430
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Boleta Deposito"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_deposito_ef from datawindow within tabpage_1
integer x = 23
integer y = 40
integer width = 4023
integer height = 932
integer taborder = 20
string title = "none"
string dataobject = "dw_sap_detalle_boleta_deposito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String		ls_columna,ls_cuenta,ls_obs,ls_sociedad
Double	ll_bol_depo,ll_cant_bol_dec
Long		ll_cant_bol,ll_indi,ll_fila,ll_tot_fila,ll_suma,ll_dif,ll_monto_ult_fila,ll_monto,ll_monto_calc
Int			ll_cant_bol_ent
String		ls_bol_depo

this.accepttext()
if row > 0 then
	dw_deposito_ef.SelectRow(0, false)
	dw_deposito_ef.SelectRow(row, true)
	ls_columna				= dwo.name
	if ls_columna = 'monto' or ls_columna='boleta_deposito' then 
		ll_monto				= dw_deposito_ef.getitemnumber(row,'monto')
		ll_suma				= tab_1.tabpage_1.dw_deposito_ef.getitemnumber(1,'c_suma')
		ls_bol_depo			= TRIM(dw_deposito_ef.getitemString(row,'boleta_deposito'))
		ls_sociedad			= dw_deposito_ef.getitemstring(row,'sociedad')
		if ll_monto > 0 and not isnull(ls_bol_depo) and len(ls_bol_depo) > 0 then
			if ll_monto = 0 or isnull(ll_monto) then
//				if ll_monto <= il_monto_deposito_ef then
//					dw_deposito_ef.setitem(row,'monto',ll_monto)
//				else
//					dw_deposito_ef.setitem(row,'monto',il_monto_deposito_ef)
//				end if
//				ll_monto		= il_monto_deposito_ef
				dw_deposito_ef.accepttext()
			end if
			if ll_monto > il_monto_ef then
				messagebox("Advertencia","Monto Deposito NO puede ser Mayor a lo Recaudado en Efectivo $ "+string(il_monto_ef,'###,###,###,###,##0'))
//			elseif ll_monto <> il_monto_deposito_ef and ll_monto > il_monto_ef then
//				messagebox("Advertencia","Recuerde Monto por Deposito es de $ "+string(il_monto_deposito_ef,'###,###,###,###,##0'))
			elseif ll_monto < il_monto_ef then		//ll_monto <> il_monto_deposito_ef and
				ls_obs			= 'DEPOSITO EF '+ls_bol_depo+' MONTO '+string(ll_monto,'###,###,###,##0')+' CAJA '+is_caja+' DEL '+string(idt_fecha,'dd/mm/yyyy')+' SOCIEDAD '+ls_sociedad
				dw_deposito_ef.setitem(row,'observacion',ls_obs)
			else
				if ll_monto < 0 then
					messagebox("Advertencia","Monto NO debe ser Menor a Cero")
					dw_deposito_ef.setitem(row,'monto',0)
					dw_deposito_ef.accepttext()
				else
					ll_tot_fila				= tab_1.tabpage_1.dw_deposito_ef.rowcount()
//					if row = 1 and ll_tot_fila = 1 then
//	//					ll_cant_bol_dec		= il_monto_ef / il_monto_deposito_ef
//	//					ll_cant_bol_ent		= int(il_monto_ef / il_monto_deposito_ef)
//	//					if ll_cant_bol_dec = ll_cant_bol_ent then
//	//						ll_cant_bol		= (round(il_monto_ef / il_monto_deposito_ef,0)) 
//	//					elseif ll_cant_bol_dec < ll_cant_bol_ent then
//	//						ll_cant_bol		= (round(il_monto_ef / il_monto_deposito_ef,0)) - 1
//	//					elseif ll_cant_bol_dec > ll_cant_bol_ent then
//	//						ll_cant_bol		= (round(il_monto_ef / il_monto_deposito_ef,0)) + 1
//	//					end if
//						if ll_monto < il_monto_ef then
//							ll_cant_bol	= (round(il_monto_ef / il_monto_deposito_ef,0)) - 1
//							ll_bol_depo	= Double(dw_deposito_ef.getitemString(1,'boleta_deposito'))
//							ls_obs		= 'DEPOSITO EF '+string(ll_bol_depo)+' MONTO '+string(ll_monto,'###,###,###,##0')+' CAJA '+is_caja+' DEL '+string(idt_fecha,'dd/mm/yyyy')+' SOCIEDAD '+ls_sociedad
//							dw_deposito_ef.setitem(1,'observacion',ls_obs)
//							for ll_indi=1 to ll_cant_bol
//								ll_bol_depo ++
//								ll_fila			= dw_deposito_ef.insertrow(0)
//								dw_deposito_ef.scrolltorow(ll_fila)
//								dw_deposito_ef.setitem(ll_fila,'boleta_deposito',string(ll_bol_depo))
//								dw_deposito_ef.setitem(ll_fila,'cod_caja',is_caja)
//								dw_deposito_ef.setitem(ll_fila,'cod_pago','EF')
//								dw_deposito_ef.setitem(ll_fila,'fecha_pago',idt_fecha)
//								dw_deposito_ef.setitem(ll_fila,'monto',ll_monto)
//								dw_deposito_ef.setitem(ll_fila,'sociedad',ls_sociedad)
//								ls_obs		= 'DEPOSITO EF '+string(ll_bol_depo)+' MONTO '+string(ll_monto,'###,###,###,##0')+' CAJA '+is_caja+' DEL '+string(idt_fecha,'dd/mm/yyyy')+' SOCIEDAD '+ls_sociedad
//								dw_deposito_ef.setitem(ll_fila,'observacion',ls_obs)
//								SELECT DISTINCT 	"SAP_CUENTAS_CONTABLES"."CUENTA_CONTABLE"  
//								INTO		:ls_cuenta
//								FROM 	"SAP_CUENTAS_CONTABLES"  
//								WHERE ( "SAP_CUENTAS_CONTABLES"."COD_CAJA" =:is_caja) AND  
//										  ( "SAP_CUENTAS_CONTABLES"."COD_PAGO" = 'EF' ) AND  
//										  ( "SAP_CUENTAS_CONTABLES"."ESTADO_CHEQUE" = 'EF' ) AND  
//										  ( "SAP_CUENTAS_CONTABLES"."SOCIEDAD" = :ls_sociedad ) AND
//										  ( "SAP_CUENTAS_CONTABLES"."TIPO_MOV" = 'E' )   
//								USING	sqlca;
//								if sqlca.sqlcode=0 then
//									dw_deposito_ef.setitem(ll_fila,'cuenta_contable',ls_cuenta)
//								else
//									messagebox("Advertencia","No se encontro Cuenta Contable")
//								end if
//							next
//							dw_deposito_ef.accepttext()
//							ll_tot_fila					= tab_1.tabpage_1.dw_deposito_ef.rowcount()
//							ll_suma					= tab_1.tabpage_1.dw_deposito_ef.getitemnumber(1,'c_suma')
//							if ll_suma > il_monto_ef then
//								ll_dif					= ll_suma - il_monto_ef
//								ll_monto_ult_fila	= dw_deposito_ef.getitemnumber(ll_tot_fila,'monto')
//								ll_monto_calc		= ll_monto_ult_fila - ll_dif
//								if ll_monto_calc < 0 then ll_monto_calc = ll_monto_calc * -1
//								dw_deposito_ef.setitem(ll_tot_fila,'monto',ll_monto_calc)
//								ls_obs				= 'DEPOSITO EF '+string(ll_bol_depo)+' MONTO '+string(ll_monto_calc,'###,###,###,##0')+' CAJA '+is_caja+' DEL '+string(idt_fecha,'dd/mm/yyyy')+' SOCIEDAD '+ls_sociedad
//								dw_deposito_ef.setitem(ll_tot_fila,'observacion',ls_obs)
//							end if
//						else
//							ls_obs					= 'DEPOSITO EF '+string(ls_bol_depo)+' MONTO '+string(ll_monto,'###,###,###,##0')+' CAJA '+is_caja+' DEL '+string(idt_fecha,'dd/mm/yyyy')+' SOCIEDAD '+ls_sociedad
//							dw_deposito_ef.setitem(ll_tot_fila,'observacion',ls_obs)
//						end if
//					else
						ls_obs						= 'DEPOSITO EF '+ls_bol_depo+' MONTO '+string(ll_monto,'###,###,###,##0')+' CAJA '+is_caja+' DEL '+string(idt_fecha,'dd/mm/yyyy')+' SOCIEDAD '+ls_sociedad
						dw_deposito_ef.setitem(1,'observacion',ls_obs)
//					end if
				end if
			end if
			st_saldo_efectivo.text					= 'Saldo Efectivo:  ' +string(il_monto_ef - ll_suma,'###,###,###,##0')
		end if
	end if
end if
end event

event itemfocuschanged;Double	ll_monto

ll_monto		= Double(dw_deposito_ef.getitemnumber(row,'monto'))
if ll_monto < 0 then
	dw_deposito_ef.setitem(row,'monto',0)
	dw_deposito_ef.accepttext()
end if

end event

event rowfocuschanged;if getrow() > 0 then
	dw_deposito_ef.SelectRow(0, false)
	dw_deposito_ef.SelectRow(getrow(), true)
end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4091
integer height = 1144
long backcolor = 67108864
string text = "Deposito - Cheque al Dia"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_saldo_cheque st_saldo_cheque
st_total_cheque st_total_cheque
cb_graba_ch cb_graba_ch
cb_eliminar_ch cb_eliminar_ch
cb_crear_ch cb_crear_ch
st_4 st_4
dw_deposito_ch dw_deposito_ch
end type

on tabpage_2.create
this.st_saldo_cheque=create st_saldo_cheque
this.st_total_cheque=create st_total_cheque
this.cb_graba_ch=create cb_graba_ch
this.cb_eliminar_ch=create cb_eliminar_ch
this.cb_crear_ch=create cb_crear_ch
this.st_4=create st_4
this.dw_deposito_ch=create dw_deposito_ch
this.Control[]={this.st_saldo_cheque,&
this.st_total_cheque,&
this.cb_graba_ch,&
this.cb_eliminar_ch,&
this.cb_crear_ch,&
this.st_4,&
this.dw_deposito_ch}
end on

on tabpage_2.destroy
destroy(this.st_saldo_cheque)
destroy(this.st_total_cheque)
destroy(this.cb_graba_ch)
destroy(this.cb_eliminar_ch)
destroy(this.cb_crear_ch)
destroy(this.st_4)
destroy(this.dw_deposito_ch)
end on

type st_saldo_cheque from statictext within tabpage_2
integer x = 2633
integer y = 1028
integer width = 919
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_total_cheque from statictext within tabpage_2
integer x = 1449
integer y = 1028
integer width = 1134
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_graba_ch from commandbutton within tabpage_2
boolean visible = false
integer x = 3566
integer y = 1012
integer width = 475
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Grabar"
end type

event clicked;Long		ll_suma,ll_suma_ch,ll_pos,ll_indi,ll_tot_reg
String		ls_sociedad

if dw_deposito_ch.rowcount() > 0 then
	ls_sociedad			= mid(ddplb_sociedad.text,1,4)
	if isnull(ls_sociedad) then
		messagebox("Advertencia","Debe Seleccionar Sociedad")
		ddplb_sociedad.setfocus()
	else
		ll_suma		= dw_deposito_ch.getitemnumber(1,'c_suma')
		if ls_sociedad <> 'CL04' then
			SELECT	SUM( "DOCUMENTOS"."MONTO" )
			INTO		:ll_suma_ch
			FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
			WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
						"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
						"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
						"DOCUMENTOS"."COD_PAGO" = 'CH' AND
						"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
						"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
						"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
						"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
						"DOCUMENTOS"."COD_CAJA" = :is_caja AND
						"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
					  ( "DOCUMENTOS"."TIPO_COB" = 'BE' or "DOCUMENTOS"."TIPO_COB" = 'CI')
			USING	sqlca;
		else
			SELECT	SUM( "DOCUMENTOS"."MONTO" )
			INTO		:ll_suma_ch
			FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
			WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
						"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
						"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
						"DOCUMENTOS"."COD_PAGO" = 'CH' AND
						"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
						"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
						"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
						"DOCUMENTOS"."COD_CAJA" = :is_caja AND
						"DOCUMENTOS"."FECHA_PAGO" = :idt_fecha AND
						("DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "VISTA_SAP_FOLIOS_CAJA"."BASE" = 'F') 
			USING	sqlca;
		end if
		if ll_suma_ch = ll_suma then
			ll_tot_reg			= dw_deposito_ch.rowcount()
			for ll_indi=1 to ll_tot_reg
				dw_deposito_ch.setitem(ll_indi,'correlativo',ll_indi)
			next
			dw_deposito_ch.accepttext()
			if dw_deposito_ch.update()=1 then
				commit;
				messagebox("Grabar","Grabación Exitosa Boleta Deposito para Caja "+is_caja +" del "+string(idt_fecha,'dd/mm/yyyy'))
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Boleta Deposito SQL "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","No Coincide Suma Efectivo en Caja $ "+string(ll_suma_ch,'###,###,###,###,##0'))
		end if
	end if
end if
end event

type cb_eliminar_ch from commandbutton within tabpage_2
integer x = 901
integer y = 1012
integer width = 485
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar Deposito"
end type

event clicked;Long		ll_fila,ll_res

if dw_deposito_ch.getrow() > 0 then
	ll_fila		= dw_deposito_ch.getrow()
//	ll_res		= messagebox("Eliminar","Está Seguro Eliminar Fila N° "+string(ll_fila),Exclamation!,YesNo!,2)
//	if ll_res=1 then
		dw_deposito_ch.deleterow(ll_fila)
		messagebox("Eliminación","Eliminación Fila "+string(ll_fila)+" Exitosa, recuerde Grabar los Cambios antes de Salir")
//	end if
end if
end event

type cb_crear_ch from commandbutton within tabpage_2
integer x = 466
integer y = 1012
integer width = 425
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crear Deposito"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_monto,ll_fila,ll_pos
String		ls_cuenta,ls_boleta,ls_caja,ls_sociedad,ls_pasa='S'
date		MIAR

if il_monto_ch > 0 then
	ls_sociedad			= mid(ddplb_sociedad.text,1,4)
	if isnull(ls_sociedad) then
		messagebox("Advertencia","Debe Seleccionar Sociedad")
		ddplb_sociedad.setfocus()
	else
		ll_tot_reg		= dw_deposito_ch.rowcount()
		for ll_indi=1 to ll_tot_reg
			ls_boleta		= dw_deposito_ch.getitemstring(ll_indi,'boleta_deposito')
			ll_monto		= dw_deposito_ch.getitemnumber(ll_indi,'monto')
			if isnull(ls_boleta) or ls_boleta='' then
				messagebox("Advertencia","Debe Ingresar N° Depósito en Fila "+string(ll_indi))
				dw_deposito_ch.setfocus()
				dw_deposito_ch.scrolltorow(ll_indi)
				dw_deposito_ch.setcolumn('boleta_deposito')
				ls_pasa	= 'N'
			elseif isnull(ll_monto) or ll_monto=0 then
				messagebox("Advertencia","Debe Ingresar Monto en Fila "+string(ll_indi))
				dw_deposito_ch.setfocus()
				dw_deposito_ch.scrolltorow(ll_indi)
				dw_deposito_ch.setcolumn('monto')
				ls_pasa	= 'N'
			end if
		next
		if ls_pasa = 'S' then
			ll_fila			= dw_deposito_ch.insertrow(0)
			dw_deposito_ch.scrolltorow(ll_fila)
			dw_deposito_ch.setitem(ll_fila,'cod_caja',is_caja)
			dw_deposito_ch.setitem(ll_fila,'cod_pago','CH')
			dw_deposito_ch.setitem(ll_fila,'fecha_pago',idt_fecha)
			dw_deposito_ch.setitem(ll_fila,'sociedad',ls_sociedad)
			SELECT DISTINCT 	"SAP_CUENTAS_CONTABLES"."CUENTA_CONTABLE"  
			INTO		:ls_cuenta
			FROM 	"SAP_CUENTAS_CONTABLES"  
			WHERE ( "SAP_CUENTAS_CONTABLES"."COD_CAJA" =:is_caja) AND  
					  ( "SAP_CUENTAS_CONTABLES"."COD_PAGO" = 'CH' ) AND  
					  ( "SAP_CUENTAS_CONTABLES"."SOCIEDAD" = :ls_sociedad ) AND  
					  ( "SAP_CUENTAS_CONTABLES"."ESTADO_CHEQUE" = 'DIA' )
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_deposito_ch.setitem(ll_fila,'cuenta_contable',ls_cuenta)
				dw_deposito_ch.accepttext()
				dw_deposito_ch.setfocus()
				dw_deposito_ch.setcolumn('boleta_deposito')
			else
				messagebox("Advertencia","No se encontro Cuenta Contable")
			end if
		end if
	end if
else
	messagebox("Advertencia","No Registra Monto para Deposito Cheque al Día")
end if
end event

type st_4 from statictext within tabpage_2
integer y = 1032
integer width = 430
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Boleta Deposito"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_deposito_ch from datawindow within tabpage_2
integer x = 23
integer y = 40
integer width = 4023
integer height = 932
integer taborder = 20
string title = "none"
string dataobject = "dw_sap_detalle_boleta_deposito_ch"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String		ls_columna,ls_bol_depo,ls_obs,ls_cuenta,ls_sociedad
Double	ll_monto,ll_suma
Long		ll_cant_bol,ll_bol_depo,ll_indi,ll_fila,ll_cant_reg

this.accepttext()
if row > 0 then
	dw_deposito_ch.SelectRow(0, false)
	dw_deposito_ch.SelectRow(row, true)
	ll_cant_reg			= dw_deposito_ch.rowcount()
	ls_columna			= dwo.name
	if ls_columna='boleta_deposito' then
		ls_bol_depo		= TRIM(dw_deposito_ch.getitemString(row,'boleta_deposito'))
		ll_monto			= Double(dw_deposito_ch.getitemnumber(row,'monto'))
		ls_sociedad		= dw_deposito_ch.getitemstring(row,'sociedad')
		if row = 1 and ll_cant_reg = 1 then
			ll_cant_bol		= il_count_ch - ll_cant_reg
			ll_bol_depo		= Double(dw_deposito_ch.getitemString(1,'boleta_deposito'))
			if ll_monto > 0 then 
				ls_obs			= 'Deposito CH '+string(ll_bol_depo)+' Monto '+string(ll_monto,'###,###,###,##0')+' Caja '+is_caja+' del Fecha '+string(idt_fecha,'dd/mm/yyyy')+' Sociedad '+ls_sociedad
				dw_deposito_ch.setitem(1,'observacion',ls_obs)
			end if
			for ll_indi=1 to ll_cant_bol
				ll_bol_depo ++
				ll_fila			= dw_deposito_ch.insertrow(0)
				dw_deposito_ch.scrolltorow(ll_fila)
				dw_deposito_ch.setitem(ll_fila,'boleta_deposito',string(ll_bol_depo))
				dw_deposito_ch.setitem(ll_fila,'cod_caja',is_caja)
				dw_deposito_ch.setitem(ll_fila,'cod_pago','CH')
				dw_deposito_ch.setitem(ll_fila,'fecha_pago',idt_fecha)
				dw_deposito_ch.setitem(ll_fila,'sociedad',ls_sociedad)
				SELECT DISTINCT 	"SAP_CUENTAS_CONTABLES"."CUENTA_CONTABLE"  
				INTO		:ls_cuenta
				FROM 	"SAP_CUENTAS_CONTABLES"  
				WHERE ( "SAP_CUENTAS_CONTABLES"."COD_CAJA" =:is_caja) AND  
						  ( "SAP_CUENTAS_CONTABLES"."COD_PAGO" = 'CH' ) AND  
						  ( "SAP_CUENTAS_CONTABLES"."SOCIEDAD" = :ls_sociedad ) AND  
						  ( "SAP_CUENTAS_CONTABLES"."ESTADO_CHEQUE" = 'DIA' )
				USING	sqlca;
				if sqlca.sqlcode=0 then
					dw_deposito_ch.setitem(ll_fila,'cuenta_contable',ls_cuenta)
					dw_deposito_ch.accepttext()
					dw_deposito_ch.setfocus()
					dw_deposito_ch.setcolumn('boleta_deposito')
				else
					messagebox("Advertencia","No se encontro Cuenta Contable")
				end if
			next
		end if
	end if
	if ls_columna='monto' then
		ll_suma		= Double(dw_deposito_ch.getitemnumber(row,'c_suma'))
		ll_monto		= Double(dw_deposito_ch.getitemnumber(row,'monto'))
		if ll_monto < 0 then
			messagebox("Advertencia","Monto NO debe ser Menor a Cero")
			dw_deposito_ch.setitem(row,'monto',0)
			dw_deposito_ch.accepttext()
		elseif  ll_monto > il_monto_ch then
			messagebox("Advertencia","Monto NO debe ser Mayor a "+string(il_monto_ch,'###,###,###,###,##0'))
			dw_deposito_ch.setitem(row,'monto',0)
			dw_deposito_ch.accepttext()
		else
			ls_bol_depo		= TRIM(dw_deposito_ch.getitemString(row,'boleta_deposito'))
			ll_monto			= Double(dw_deposito_ch.getitemnumber(row,'monto'))
			ll_cant_bol		= il_count_ch
			ll_bol_depo		= Double(dw_deposito_ch.getitemString(1,'boleta_deposito'))
			if ll_monto > 0 then 
				ls_obs		= 'Deposito CH '+string(ll_bol_depo)+' Monto '+string(ll_monto,'###,###,###,##0')+' Caja '+is_caja+' del Fecha '+string(idt_fecha,'dd/mm/yyyy')+' Sociedad '+ls_sociedad
				dw_deposito_ch.setitem(row,'observacion',ls_obs)
			end if
		end if
		st_saldo_cheque.text		= 'Saldo Cheque:  ' +string(il_monto_ch - ll_suma,'###,###,###,##0')
	end if
end if
end event

event itemfocuschanged;Double	ll_monto

ll_monto		= Double(dw_deposito_ch.getitemnumber(row,'monto'))
if ll_monto < 0 then
	dw_deposito_ch.setitem(row,'monto',0)
	dw_deposito_ch.accepttext()
end if

end event

event rowfocuschanged;if getrow() > 0 then
	dw_deposito_ch.SelectRow(0, false)
	dw_deposito_ch.SelectRow(getrow(), true)
end if
end event

