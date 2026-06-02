forward
global type w_sap_cuadratura_pagos from window
end type
type cb_2 from commandbutton within w_sap_cuadratura_pagos
end type
type cbx_refresh from checkbox within w_sap_cuadratura_pagos
end type
type cb_6 from commandbutton within w_sap_cuadratura_pagos
end type
type cb_27 from commandbutton within w_sap_cuadratura_pagos
end type
type cb_5 from commandbutton within w_sap_cuadratura_pagos
end type
type cb_4 from commandbutton within w_sap_cuadratura_pagos
end type
type cb_3 from commandbutton within w_sap_cuadratura_pagos
end type
type cbx_boleta from checkbox within w_sap_cuadratura_pagos
end type
type dw_boletas from datawindow within w_sap_cuadratura_pagos
end type
type cb_refresh from commandbutton within w_sap_cuadratura_pagos
end type
type st_1 from statictext within w_sap_cuadratura_pagos
end type
type ddplb_sociedad from dropdownpicturelistbox within w_sap_cuadratura_pagos
end type
type dw_cajas_hana from datawindow within w_sap_cuadratura_pagos
end type
type hpb_1 from hprogressbar within w_sap_cuadratura_pagos
end type
type st_porc from statictext within w_sap_cuadratura_pagos
end type
type cb_1 from commandbutton within w_sap_cuadratura_pagos
end type
type cb_crea_docto from commandbutton within w_sap_cuadratura_pagos
end type
type cbx_difer from checkbox within w_sap_cuadratura_pagos
end type
type rb_caja from radiobutton within w_sap_cuadratura_pagos
end type
type rb_todas from radiobutton within w_sap_cuadratura_pagos
end type
type st_5 from statictext within w_sap_cuadratura_pagos
end type
type ddplb_caja from dropdownpicturelistbox within w_sap_cuadratura_pagos
end type
type cb_eliminar from commandbutton within w_sap_cuadratura_pagos
end type
type cb_imprimir from commandbutton within w_sap_cuadratura_pagos
end type
type cb_exportar from commandbutton within w_sap_cuadratura_pagos
end type
type cb_filtrar from commandbutton within w_sap_cuadratura_pagos
end type
type cb_ordenar from commandbutton within w_sap_cuadratura_pagos
end type
type pb_ok from picturebutton within w_sap_cuadratura_pagos
end type
type p_fin from picture within w_sap_cuadratura_pagos
end type
type st_3 from statictext within w_sap_cuadratura_pagos
end type
type p_ini from picture within w_sap_cuadratura_pagos
end type
type em_fec_ini from editmask within w_sap_cuadratura_pagos
end type
type st_4 from statictext within w_sap_cuadratura_pagos
end type
type em_fec_fin from editmask within w_sap_cuadratura_pagos
end type
type cb_cerrar from commandbutton within w_sap_cuadratura_pagos
end type
type gb_3 from groupbox within w_sap_cuadratura_pagos
end type
type gb_1 from groupbox within w_sap_cuadratura_pagos
end type
type gb_2 from groupbox within w_sap_cuadratura_pagos
end type
type st_fondo from statictext within w_sap_cuadratura_pagos
end type
type dw_lista from datawindow within w_sap_cuadratura_pagos
end type
type gb_4 from groupbox within w_sap_cuadratura_pagos
end type
end forward

global type w_sap_cuadratura_pagos from window
integer width = 5563
integer height = 2384
boolean titlebar = true
string title = "Informe Cuadratura Cajas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_2 cb_2
cbx_refresh cbx_refresh
cb_6 cb_6
cb_27 cb_27
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cbx_boleta cbx_boleta
dw_boletas dw_boletas
cb_refresh cb_refresh
st_1 st_1
ddplb_sociedad ddplb_sociedad
dw_cajas_hana dw_cajas_hana
hpb_1 hpb_1
st_porc st_porc
cb_1 cb_1
cb_crea_docto cb_crea_docto
cbx_difer cbx_difer
rb_caja rb_caja
rb_todas rb_todas
st_5 st_5
ddplb_caja ddplb_caja
cb_eliminar cb_eliminar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
pb_ok pb_ok
p_fin p_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_4 st_4
em_fec_fin em_fec_fin
cb_cerrar cb_cerrar
gb_3 gb_3
gb_1 gb_1
gb_2 gb_2
st_fondo st_fondo
dw_lista dw_lista
gb_4 gb_4
end type
global w_sap_cuadratura_pagos w_sap_cuadratura_pagos

type variables
long	il_row,il_row2
string	is_lista
end variables

forward prototypes
public subroutine wf_carga_caja_sap (datetime as_fecha_ini, datetime as_fecha_fin, string as_mandat, string as_sociedad)
public subroutine wf_boleta_detalle (datetime adt_fec_ini, datetime adt_fec_fin, string as_sociedad)
public function double wf_web_pagos (string as_cod_caja, datetime adt_fecha_pago)
end prototypes

public subroutine wf_carga_caja_sap (datetime as_fecha_ini, datetime as_fecha_fin, string as_mandat, string as_sociedad);string		ls_cod_caja
long		ll_new
datetime	ldt_fecha_pago
double	ldb_debe,ldb_haber

//wf_carga_caja_sap(as_fecha_ini,as_fecha_fin,as_mandat,as_sociedad)
DECLARE x1 CURSOR FOR
SELECT	SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR",1,2),   
         	to_date(to_char(SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR",3,2)||'/'||SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR",5,2)||'/'||SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR" ,7,4)),'dd/mm/yyyy'),   
         	SUM(( CASE WHEN "SAPABAP1"."ZV_PAGO"."SHKZG" = 'S' THEN "SAPABAP1"."ZV_PAGO"."DMBTR" ELSE 0 END )),   
         	SUM(( CASE WHEN "SAPABAP1"."ZV_PAGO"."SHKZG" = 'H' THEN "SAPABAP1"."ZV_PAGO"."DMBTR" ELSE 0 END ))

FROM		"SAPABAP1"."ZV_PAGO"  
WHERE	to_date(to_char(SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR",3,2)||'/'||SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR",5,2)||'/'||SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR" ,7,4)),'dd/mm/yyyy') >= :as_fecha_ini AND  
        		to_date(to_char(SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR",3,2)||'/'||SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR",5,2)||'/'||SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR" ,7,4)),'dd/mm/yyyy') <= :as_fecha_fin AND  
        		"SAPABAP1"."ZV_PAGO"."MANDT" = :as_mandat AND  
         	"SAPABAP1"."ZV_PAGO"."BUKRS" = :as_sociedad AND  
         	("SAPABAP1"."ZV_PAGO"."STBLG" is null OR "SAPABAP1"."ZV_PAGO"."STBLG" = '') AND  
         	"SAPABAP1"."ZV_PAGO"."HKONT" <> '2114000199' AND  
         	("SAPABAP1"."ZV_PAGO"."USNAM" = 'WS_IF_FI' OR "SAPABAP1"."ZV_PAGO"."USNAM" = 'WS_IF_FI_2')  
group by	SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR",1,2),   
         	to_date(to_char(SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR",3,2)||'/'||SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR",5,2)||'/'||SUBSTR("SAPABAP1"."ZV_PAGO"."XBLNR" ,7,4)),'dd/mm/yyyy')	
ORDER BY 1 ASC, 2 ASC
USING	Trans_hana;
open x1;
if Trans_hana.sqlcode=0 then
	DO WHILE Trans_hana.sqlcode=0
	fetch x1 INTO :ls_cod_caja,:ldt_fecha_pago,:ldb_debe,:ldb_haber;
		if not isnull(ls_cod_caja) and ls_cod_caja <>'' and not isnull(ldt_fecha_pago) then
			if isnull(ldb_debe) then ldb_debe=0
			if isnull(ldb_haber) then ldb_haber=0
			
			ll_new						= dw_cajas_hana.insertrow(0)
			dw_cajas_hana.scrolltorow(ll_new)
			dw_cajas_hana.setitem(ll_new,"cod_caja",ls_cod_caja)
			dw_cajas_hana.setitem(ll_new,"fecha_pago",ldt_fecha_pago)
			dw_cajas_hana.setitem(ll_new,"debe",ldb_debe)
			dw_cajas_hana.setitem(ll_new,"haber",ldb_haber)
			dw_cajas_hana.accepttext()
		end if
		setnull(ls_cod_caja);setnull(ldt_fecha_pago);setnull(ldb_debe);setnull(ldb_haber)
	LOOP
end if
close x1;
end subroutine

public subroutine wf_boleta_detalle (datetime adt_fec_ini, datetime adt_fec_fin, string as_sociedad);string		ls_cod_caja,ls_sociedad
long		ll_new
datetime	ldt_fecha
double	ldb_mto_doc,ldb_mto_docsap,ldb_mto_bol,ldb_mto_bolsap,ldb_mto_difer,ldb_difer_boleta,ldb_mto_difsap

//wf_boleta_detalle(adt_fec_ini,adt_fec_fin,as_sociedad)

DECLARE x1 CURSOR FOR
SELECT		"DOCUMENTOS"."COD_CAJA",
				"DOCUMENTOS"."FECHA_DEPOSITO",
				 F_SOCIEDAD_TIPO_COB( "DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO" ) AS SOCIEDAD,
				SUM("DOCUMENTOS"."MONTO"),
				SUM("DOCUMENTOS"."MONTO_UF"),

				(	SELECT	SUM("MONTO")
					FROM		"SAP_BOLETA_DEPOSITO"
					WHERE	"SAP_BOLETA_DEPOSITO"."FECHA_PAGO" = "DOCUMENTOS"."FECHA_DEPOSITO" AND  
								"SAP_BOLETA_DEPOSITO"."COD_CAJA" = "DOCUMENTOS"."COD_CAJA"  AND
								"SAP_BOLETA_DEPOSITO"."SOCIEDAD" = F_SOCIEDAD_TIPO_COB( "DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO" )) AS MONTO_BOL,
				
				(	SELECT	SUM("MONTO_UF")
					FROM		"SAP_BOLETA_DEPOSITO"
					WHERE	"SAP_BOLETA_DEPOSITO"."FECHA_PAGO" = "DOCUMENTOS"."FECHA_DEPOSITO" AND  
								"SAP_BOLETA_DEPOSITO"."COD_CAJA" = "DOCUMENTOS"."COD_CAJA"  AND
								"SAP_BOLETA_DEPOSITO"."SOCIEDAD" =  F_SOCIEDAD_TIPO_COB( "DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO" )) AS MONTO_BOL

FROM			"CODIGO_CAJAS","DOCUMENTOS","SAP_SOCIEDAD"  
WHERE		"CODIGO_CAJAS"."COD_CAJA" = "DOCUMENTOS"."COD_CAJA" AND  
				"CODIGO_CAJAS"."TIPO_CAJA" = 'P'  AND  
				"DOCUMENTOS"."FECHA_DEPOSITO" >= :adt_fec_ini AND  
				"DOCUMENTOS"."FECHA_DEPOSITO" <= :adt_fec_fin AND
				F_SOCIEDAD_TIPO_COB( "DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO" ) = "SAP_SOCIEDAD"."CODIGO" AND

				F_SOCIEDAD_TIPO_COB( "DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO" ) = :as_sociedad and
				( "DOCUMENTOS"."COD_PAGO" = 'EF' OR ( "DOCUMENTOS"."FECHA_DEPOSITO" >= "DOCUMENTOS"."FECHA_VENC" AND "DOCUMENTOS"."COD_PAGO" = 'CH' ))
GROUP BY	"DOCUMENTOS"."COD_CAJA",
				"DOCUMENTOS"."FECHA_DEPOSITO",
				 F_SOCIEDAD_TIPO_COB( "DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO" )
ORDER BY	"DOCUMENTOS"."FECHA_DEPOSITO",
				"DOCUMENTOS"."COD_CAJA"
USING	sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
	fetch x1 INTO	:ls_cod_caja,	:ldt_fecha,	:ls_sociedad,	:ldb_mto_doc,	:ldb_mto_docsap, :ldb_mto_bol,	:ldb_mto_bolsap;
		if not isnull(ls_cod_caja) and ls_cod_caja<>'' and not isnull(ls_sociedad) and ls_sociedad<>'' and not isnull(ldt_fecha) then
			
			if isnull(ldb_mto_doc) then ldb_mto_doc=0
			if isnull(ldb_mto_docsap) then ldb_mto_docsap=0
			if isnull(ldb_mto_bol) then ldb_mto_bol=0
			if isnull(ldb_mto_bolsap) then ldb_mto_bolsap=0
			
			ldb_mto_difer				= ldb_mto_doc - ldb_mto_bol
			ldb_mto_difsap				= ldb_mto_docsap - ldb_mto_bolsap 
			ldb_difer_boleta			= ldb_mto_bol - ldb_mto_bolsap
			
			ll_new						= dw_boletas.insertrow(0)
			dw_boletas.scrolltorow(ll_new)
			dw_boletas.setitem(ll_new,"caja",ls_cod_caja)
			dw_boletas.setitem(ll_new,"fecha",ldt_fecha)
			dw_boletas.setitem(ll_new,"sociedad",ls_sociedad)
			dw_boletas.setitem(ll_new,"monto_doc",ldb_mto_doc)
			dw_boletas.setitem(ll_new,"monto_docsap",ldb_mto_docsap)
			dw_boletas.setitem(ll_new,"monto_bol",ldb_mto_bol)
			dw_boletas.setitem(ll_new,"monto_bol_sap",ldb_mto_bolsap)
			dw_boletas.setitem(ll_new,"monto_difer",ldb_mto_difer)
			
			dw_boletas.setitem(ll_new,"monto_difsap",ldb_mto_difsap)
			
			dw_boletas.setitem(ll_new,"difer_boleta",ldb_difer_boleta)
			dw_lista.accepttext()
			
		end if
		setnull(ls_cod_caja);setnull(ldt_fecha);setnull(ls_sociedad);setnull(ldb_mto_doc);setnull(ldb_mto_docsap);setnull(ldb_mto_bol);setnull(ldb_mto_bolsap)
		ldb_mto_difer                  = 0
		ldb_difer_boleta               = 0
	LOOP
end if
close x1;
end subroutine

public function double wf_web_pagos (string as_cod_caja, datetime adt_fecha_pago);double	ldb_monto

//wf_web_pagos(:as_cod_caja,:adt_fecha_pago)

SELECT	SUM("ELECTRONICA_FB_DETALLE"."MONTO_TOTAL")
INTO		:ldb_monto
FROM 	"ELECTRONICA_FB_DETALLE","WEB_PAGOS"
WHERE	( "ELECTRONICA_FB_DETALLE"."BASE" = "WEB_PAGOS"."BASE" ) and  
			( "ELECTRONICA_FB_DETALLE"."SERIE" = "WEB_PAGOS"."SERIE" ) and  
			( "ELECTRONICA_FB_DETALLE"."NUMERO" = "WEB_PAGOS"."NUMERO" ) and  
			( "ELECTRONICA_FB_DETALLE"."FOLIO_ASOC" = "WEB_PAGOS"."NUMERO_CUPON" ) and  
			

			"ELECTRONICA_FB_DETALLE"."COD_CAJA" = 'WP' AND
			
			"WEB_PAGOS"."FECHA_CREA" >= TO_DATE(:adt_fecha_pago,'dd/mm/yyyy hh24:mi:ss') AND  
			"WEB_PAGOS"."FECHA_CREA" <= TO_DATE(:adt_fecha_pago,'dd/mm/yyyy hh24:mi:ss') AND  
			"WEB_PAGOS"."ESTADO_PAGO" = 'P' AND  
			"WEB_PAGOS"."ACTUALIZA_INGRESO" = 'S' ;
			
return ldb_monto			
   
end function

on w_sap_cuadratura_pagos.create
this.cb_2=create cb_2
this.cbx_refresh=create cbx_refresh
this.cb_6=create cb_6
this.cb_27=create cb_27
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cbx_boleta=create cbx_boleta
this.dw_boletas=create dw_boletas
this.cb_refresh=create cb_refresh
this.st_1=create st_1
this.ddplb_sociedad=create ddplb_sociedad
this.dw_cajas_hana=create dw_cajas_hana
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.cb_1=create cb_1
this.cb_crea_docto=create cb_crea_docto
this.cbx_difer=create cbx_difer
this.rb_caja=create rb_caja
this.rb_todas=create rb_todas
this.st_5=create st_5
this.ddplb_caja=create ddplb_caja
this.cb_eliminar=create cb_eliminar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.pb_ok=create pb_ok
this.p_fin=create p_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_4=create st_4
this.em_fec_fin=create em_fec_fin
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.gb_1=create gb_1
this.gb_2=create gb_2
this.st_fondo=create st_fondo
this.dw_lista=create dw_lista
this.gb_4=create gb_4
this.Control[]={this.cb_2,&
this.cbx_refresh,&
this.cb_6,&
this.cb_27,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cbx_boleta,&
this.dw_boletas,&
this.cb_refresh,&
this.st_1,&
this.ddplb_sociedad,&
this.dw_cajas_hana,&
this.hpb_1,&
this.st_porc,&
this.cb_1,&
this.cb_crea_docto,&
this.cbx_difer,&
this.rb_caja,&
this.rb_todas,&
this.st_5,&
this.ddplb_caja,&
this.cb_eliminar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.pb_ok,&
this.p_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_4,&
this.em_fec_fin,&
this.cb_cerrar,&
this.gb_3,&
this.gb_1,&
this.gb_2,&
this.st_fondo,&
this.dw_lista,&
this.gb_4}
end on

on w_sap_cuadratura_pagos.destroy
destroy(this.cb_2)
destroy(this.cbx_refresh)
destroy(this.cb_6)
destroy(this.cb_27)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cbx_boleta)
destroy(this.dw_boletas)
destroy(this.cb_refresh)
destroy(this.st_1)
destroy(this.ddplb_sociedad)
destroy(this.dw_cajas_hana)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.cb_1)
destroy(this.cb_crea_docto)
destroy(this.cbx_difer)
destroy(this.rb_caja)
destroy(this.rb_todas)
destroy(this.st_5)
destroy(this.ddplb_caja)
destroy(this.cb_eliminar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.pb_ok)
destroy(this.p_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_4)
destroy(this.em_fec_fin)
destroy(this.cb_cerrar)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.st_fondo)
destroy(this.dw_lista)
destroy(this.gb_4)
end on

event open;string	ls_sociedad,ls_descrip_sociedad

connect using Trans_1;
connect using Trans_2;
connect using Trans_hana;


w_sap_cuadratura_pagos.width		= 3826

gf_centrar(w_sap_cuadratura_pagos)
dw_lista.dataobject						= 'dwe_sap_cuadratura_pagos'
dw_lista.settransobject(sqlca)

dw_cajas_hana.dataobject				= 'dwe_cajas_hana'
dw_cajas_hana.settransobject(sqlca)

em_fec_ini.text 							= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text 							= string(gdt_fec_sistema,'dd/mm/yyyy')

dw_boletas.dataobject					= 'dwe_sap_boleta_por_dia_caja'
dw_boletas.settransobject(sqlca)
is_lista										= 'I'		

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

end event

event close;//disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_hana;


end event

type cb_2 from commandbutton within w_sap_cuadratura_pagos
integer x = 512
integer y = 2100
integer width = 503
integer height = 112
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza &Integración"
end type

event clicked;string		ls_cod_caja,ls_sociedad,ls_pasa
long		ll_tot_reg,ll_res,ll_graba=0
datetime	ldt_fec_pago


if is_lista = 'I' then
	ll_tot_reg						=  dw_lista.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra datos Para Consultar")
		ls_pasa						= 'N'
	else
		if il_row>0 then
			ls_cod_caja				= dw_lista.getitemstring(il_row,'cod_caja')
			ldt_fec_pago			= dw_lista.getitemdatetime(il_row,'fecha_pago')
			ls_sociedad				= dw_lista.getitemstring(il_row,'sociedad')
		end if
		ls_pasa						= 'S'
	end if	
elseif is_lista = 'B' then
	ll_tot_reg					=  dw_boletas.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra datos Para Consultar")
		ls_pasa						= 'N'
	else
		if il_row2>0 then
			ls_cod_caja				= dw_boletas.getitemstring(il_row2,'caja')
			ldt_fec_pago			= dw_boletas.getitemdatetime(il_row2,'fecha')
			ls_sociedad				= dw_boletas.getitemstring(il_row2,'sociedad')
		end if
		ls_pasa						= 'S'
	end if	
end if

if ls_pasa='S' then
	if not isnull(ls_cod_caja) and ls_cod_caja<>'' and not isnull(ldt_fec_pago) then
		ll_res			= MessageBox("Advertencia", '¿Desea Actualizar Estado Integración Caja: '+ls_cod_caja+' Con Fecha: '+string(ldt_fec_pago,'dd/mm/yyyy')+'?', Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			
			UPDATE	"SAP_CABECERA_PAGOS"  
     		SET 		"ESTADO_SAP" = 1
			WHERE	"SAP_CABECERA_PAGOS"."FECHA_PAGO" = :ldt_fec_pago AND  
						"SAP_CABECERA_PAGOS"."COD_CAJA" = :ls_cod_caja AND
						"SAP_CABECERA_PAGOS"."SOCIEDAD" = :ls_sociedad
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				//ll_graba++
				ll_graba		= 3
			else
				rollback using sqlca;
			end if
			
//			UPDATE	"SAP_DEBE_SAP"  
//     		SET 		"ESTADO_SAP" = 0
//			WHERE	"SAP_DEBE_SAP"."FECHA_PAGO" = :ldt_fec_pago AND  
//						"SAP_DEBE_SAP"."COD_CAJA" = :ls_cod_caja AND
//						"SAP_DEBE_SAP"."SOCIEDAD" = :ls_sociedad
//			USING	sqlca;
//			if sqlca.sqlcode = 0 then
//				commit using sqlca;
//				ll_graba++
//				//messagebox("Eliminar","Eliminación Exitosa SAP Debe Pagos")
//			else
//				rollback using sqlca;
//			end if
			
//			UPDATE	"SAP_HABER_SAP"  
//     		SET 		"ESTADO_SAP" = 0
//			WHERE	"SAP_HABER_SAP"."FECHA_PAGO" = :ldt_fec_pago AND  
//						"SAP_HABER_SAP"."COD_CAJA" = :ls_cod_caja AND
//						"SAP_HABER_SAP"."SOCIEDAD" = :ls_sociedad 
//			USING	sqlca;
//			if sqlca.sqlcode = 0 then
//				commit using sqlca;
//				ll_graba++
//				//messagebox("Eliminar","Eliminación Exitosa SAP Haber Pagos")
//			else
//				rollback using sqlca;
//			end if
			
			
			
			if ll_graba=3 then
				DECLARE sap_actualiza PROCEDURE FOR F_SAP_ACT_INTEGRA_CAJA(:ls_cod_caja,:ldt_fec_pago,:ls_sociedad,0);
				EXECUTE sap_actualiza;
				if sqlca.sqlcode=0 then
				fetch sap_actualiza into :ll_graba;
				close sap_actualiza;
				end if
			end if	
				
			if ll_graba=0 then
				messagebox("Error",'No Actualizo Tabla "SAP_CABECERA_PAGOS" Caja :'+ls_cod_caja+' - Con Fecha :'+ string(ldt_fec_pago,'dd/mm/yyyy')+' - Sociedad :'+ls_sociedad)
			elseif ll_graba=3 then
				messagebox("Error",'No Actualizo Tabla "INGRESO" Caja :'+ls_cod_caja+' - Con Fecha :'+ string(ldt_fec_pago,'dd/mm/yyyy')+' - Sociedad :'+ls_sociedad)
			elseif ll_graba=4 then
				messagebox("Error",'No Actualizo Tabla "DOCUMENTO" Caja :'+ls_cod_caja+' - Con Fecha :'+ string(ldt_fec_pago,'dd/mm/yyyy')+' - Sociedad :'+ls_sociedad)	
			elseif ll_graba=5 then
				messagebox("Grabar","Actualización de Caja Exitosa")
			end if
		end if
	else
		
		if is_lista = 'I' then
			if isnull(ls_cod_caja) or ls_cod_caja='' then
				messagebox("Advertencia", "Debe Ingresar Código Caja")
				dw_lista.setfocus()
				dw_lista.setcolumn('cod_caja')
			elseif isnull(ldt_fec_pago) then
				messagebox("Advertencia", "Debe Ingresar Fecha Pago")
				dw_lista.setfocus()
				dw_lista.setcolumn('fecha_pago')
			end if
		
		elseif is_lista = 'B' then
			if isnull(ls_cod_caja) or ls_cod_caja='' then
				messagebox("Advertencia", "Debe Ingresar Código Caja")
				dw_lista.setfocus()
				dw_lista.setcolumn('caja')
			elseif isnull(ldt_fec_pago) then
				messagebox("Advertencia", "Debe Ingresar Fecha Pago")
				dw_lista.setfocus()
				dw_lista.setcolumn('fecha')
			end if
		end if
	end if
end if

end event

type cbx_refresh from checkbox within w_sap_cuadratura_pagos
integer x = 5134
integer y = 156
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Refresh"
boolean automatic = false
boolean checked = true
end type

event clicked;
if cbx_refresh.checked = true then
	cb_refresh.triggerevent(clicked!)
	cbx_refresh.checked 			= true
elseif cbx_refresh.checked = false then
	cbx_refresh.checked 			= true
end if
end event

type cb_6 from commandbutton within w_sap_cuadratura_pagos
boolean visible = false
integer x = 1691
integer y = 2492
integer width = 366
integer height = 112
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Prueba"
end type

event clicked;string		ls_cod_caja,ls_sociedad,ls_tipo_cob,ls_cod_pago
long		ll_tot_reg,ll_res,ll_indi,ll_folio,ll_cta,ll_graba,ll_no_graba,ll_cta2,ll_estado
datetime	ldt_fec_pago,ldt_fec_venc
double	ldb_monto,ldb_mto_grupo,ldb_mto_dcto

ll_tot_reg				=  dw_lista.rowcount()
if ll_tot_reg>0 then
	ll_res					= MessageBox("Advertencia", 'Esta seguro de Corregir Montos Para Integración SAP', Exclamation!, YesNo!, 2)
	if ll_res=1 then
		SetPointer(HourGlass!)
		for ll_indi=1 to ll_tot_reg
			ls_cod_caja				= dw_lista.getitemstring(ll_indi,'cod_caja')
			ldt_fec_pago			= dw_lista.getitemdatetime(ll_indi,'fecha_pago')
			ls_sociedad				= dw_lista.getitemstring(ll_indi,'sociedad')
			
			DECLARE x1 CURSOR FOR
			SELECT		"INGRESO"."FOLIO",
							"INGRESO"."FECHA_DEPOSITO",
							"INGRESO"."TIPO_COB",
							"INGRESO"."COD_CAJA",
							SUM((	CASE WHEN "INGRESO"."TIPO_MOV"='F' OR "INGRESO"."TIPO_MOV"='E' OR "INGRESO"."TIPO_MOV"='K' OR "INGRESO"."TIPO_MOV"='U' THEN "INGRESO"."CUOTAS_PAG" * ( CASE WHEN  "INGRESO"."MONEDA_SAP" = '1' THEN "INGRESO"."MONTO_UF" WHEN "INGRESO"."MONEDA_SAP" = '2' THEN ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0) END ) 
												WHEN "INGRESO"."TIPO_MOV"='Q' OR "INGRESO"."TIPO_MOV"='A'  THEN ( CASE WHEN "INGRESO"."CUOTAS_PAG" IS NULL OR "INGRESO"."CUOTAS_PAG" = 0 THEN 1 ELSE "INGRESO"."CUOTAS_PAG" END ) * ( CASE WHEN  "INGRESO"."MONEDA_SAP" = '1' THEN "INGRESO"."MONTO_UF" WHEN "INGRESO"."MONEDA_SAP" = '2' THEN ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0) END ) 
										ELSE ( CASE WHEN  "INGRESO"."MONEDA_SAP" = '1' THEN "INGRESO"."MONTO_UF" WHEN "INGRESO"."MONEDA_SAP" = '2' THEN ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0) END ) END))
			FROM			"INGRESO"
			WHERE	 	"INGRESO"."TIPO_COB" <> 'NE' AND "INGRESO"."TIPO_COB" <> 'NC' AND 
							F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = :ls_sociedad AND
							"INGRESO"."ESTADO_PAGO_SAP" = 99 AND
							"INGRESO"."COD_CAJA" = :ls_cod_caja AND
							//"INGRESO"."FOLIO" = 653993 AND
							"INGRESO"."FECHA_DEPOSITO" = :ldt_fec_pago AND
							("INGRESO"."PAGO_HIST" = 'A' OR "INGRESO"."PAGO_HIST" = 'N')
							
			GROUP BY 	"INGRESO"."FOLIO",
							"INGRESO"."FECHA_DEPOSITO",
							"INGRESO"."TIPO_COB",
							"INGRESO"."COD_CAJA"
			USING	Trans_1;
			open x1;
			if Trans_1.sqlcode=0 then
				DO WHILE Trans_1.sqlcode=0
					fetch x1 INTO	:ll_folio,	:ldt_fec_pago,	:ls_tipo_cob,	:ls_cod_caja,	:ldb_monto;
					if not isnull(ll_folio) and ll_folio > 0 and not isnull(ldt_fec_pago) and not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and not isnull(ls_cod_caja) and ls_cod_caja<>'' then
						SELECT	COUNT("DOCUMENTOS"."FOLIO")
						INTO		:ll_cta
						FROM		"DOCUMENTOS"
						WHERE	"DOCUMENTOS"."FOLIO" = :ll_folio AND  
									"DOCUMENTOS"."TIPO_COB" = :ls_tipo_cob AND  
									"DOCUMENTOS"."FECHA_DEPOSITO" = :ldt_fec_pago AND  
									"DOCUMENTOS"."COD_CAJA" = :ls_cod_caja
						USING	sqlca;
						if isnull(ll_cta) then ll_cta=0
						if ll_cta>0 then
							if ll_cta= 1 then
								UPDATE	"DOCUMENTOS"  
								SET		"MONTO_UF" = :ldb_monto  
								WHERE	"DOCUMENTOS"."FOLIO" = :ll_folio AND  
											"DOCUMENTOS"."TIPO_COB" = :ls_tipo_cob AND  
											"DOCUMENTOS"."FECHA_DEPOSITO" = :ldt_fec_pago AND  
											"DOCUMENTOS"."COD_CAJA" = :ls_cod_caja
								USING	sqlca;
								if sqlca.sqlcode=0 then
									commit using sqlca;
									ll_graba++
								else
									rollback using sqlca;
									ll_no_graba++
								end if
							else
								ldb_mto_grupo				= 0
								ll_cta2						= 0
								DECLARE x3 CURSOR FOR
								SELECT		"FECHA_VENC","MONTO","COD_PAGO"  
								FROM 		"DOCUMENTOS"  
								WHERE		( "DOCUMENTOS"."FOLIO" = :ll_folio ) AND  
												( "DOCUMENTOS"."TIPO_COB" = :ls_tipo_cob ) AND  
												( "DOCUMENTOS"."FECHA_DEPOSITO" = :ldt_fec_pago ) AND  
												( "DOCUMENTOS"."COD_CAJA" = :ls_cod_caja )
								ORDER BY	"DOCUMENTOS"."FECHA_VENC",
												"DOCUMENTOS"."COD_PAGO"
								USING	Trans_2;
								open x3;
								if Trans_2.sqlcode=0 then
									DO WHILE Trans_2.sqlcode=0
									fetch x3 INTO	:ldt_fec_venc,	:ldb_mto_dcto,:ls_cod_pago;
										if not isnull(ldt_fec_venc) and not isnull(ldb_mto_dcto) and ldb_mto_dcto > 0 and not isnull(ls_cod_pago) and ls_cod_pago<>'' then
											ll_cta2++
											if ll_cta2 < ll_cta then
												ldb_mto_grupo			= ldb_mto_grupo + ldb_mto_dcto
											elseif ll_cta2 = ll_cta then
												ldb_mto_dcto			= ldb_monto - ldb_mto_grupo
											end if
												
											UPDATE	"DOCUMENTOS"  
											SET		"MONTO_UF" = :ldb_mto_dcto  
											WHERE	"DOCUMENTOS"."FOLIO" = :ll_folio AND  
														"DOCUMENTOS"."TIPO_COB" = :ls_tipo_cob AND  
														"DOCUMENTOS"."FECHA_DEPOSITO" = :ldt_fec_pago AND  
														"DOCUMENTOS"."COD_CAJA" = :ls_cod_caja AND
														"DOCUMENTOS"."FECHA_VENC" = :ldt_fec_venc AND
														"DOCUMENTOS"."COD_PAGO" = :ls_cod_pago
											USING	sqlca;
											if sqlca.sqlcode=0 then
												commit using sqlca;
												ll_graba++
											else
												rollback using sqlca;
												ll_no_graba++
											end if
										end if
										setnull(ldt_fec_venc);setnull(ldb_mto_dcto);setnull(ls_cod_pago)
										ldb_mto_dcto				= 0
									LOOP
								end if
								close x3;
							end if
						end if
					end if
					setnull(ll_folio);setnull(ls_tipo_cob);setnull(ldb_monto)
				LOOP
			end if
			close x1;
			
			if ll_graba > 0 THEN
				DECLARE f_boleta	PROCEDURE FOR  F_SAP_BOLETA_DEPOS(:ls_cod_caja,:ldt_fec_pago,:ls_sociedad);
				EXECUTE f_boleta;
				if sqlca.sqlcode=0 then
					fetch f_boleta into :ll_estado;
					close f_boleta;						
				end if
			end if
			setnull(ls_cod_caja);setnull(ldt_fec_pago)
		next
	end if
end if
end event

type cb_27 from commandbutton within w_sap_cuadratura_pagos
integer x = 3826
integer y = 2092
integer width = 379
integer height = 112
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Detalle Boletas"
end type

event clicked;string		ls_cod_caja,ls_sociedad,ls_string,ls_pasa
long		ll_tot_reg
datetime	ldt_fec_pago		


if is_lista = 'I' then
	ll_tot_reg						=  dw_lista.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra datos Para Consultar")
		ls_pasa						= 'N'
	else
		if il_row>0 then
			ls_cod_caja				= dw_lista.getitemstring(il_row,'cod_caja')
			ldt_fec_pago			= dw_lista.getitemdatetime(il_row,'fecha_pago')
			ls_sociedad				= dw_lista.getitemstring(il_row,'sociedad')
		end if
		ls_pasa						= 'S'
	end if	
elseif is_lista = 'B' then
	ll_tot_reg					=  dw_boletas.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra datos Para Consultar")
		ls_pasa						= 'N'
	else
		if il_row2>0 then
			ls_cod_caja				= dw_boletas.getitemstring(il_row2,'caja')
			ldt_fec_pago			= dw_boletas.getitemdatetime(il_row2,'fecha')
			ls_sociedad				= dw_boletas.getitemstring(il_row2,'sociedad')
		end if
		ls_pasa						= 'S'
	end if	
end if

if ls_pasa = 'S' then
	if not isnull(ls_cod_caja) and ls_cod_caja<>'' and not isnull(ls_sociedad) and ls_sociedad<>'' and not isnull(ldt_fec_pago) then
		ls_string				= ls_cod_caja+'~t'+string(ldt_fec_pago,'dd/mm/yyyy')+'~t'+ls_sociedad
		OpenWithParm(w_cuadra_boleta_depos, ls_string)
	else
		if is_lista = 'I' then
			if isnull(ldt_fec_pago) then
				messagebox("Advertencia", "Debe Ingresar Fecha Caja")
			elseif isnull(ls_cod_caja) or ls_cod_caja = '' then
				messagebox("Advertencia", "Debe Ingresar Codigo Caja")
			elseif isnull(ls_sociedad) or ls_sociedad = '' then
				messagebox("Advertencia", "Debe Ingresar Sociedad")
			end if
		elseif is_lista = 'B' then
			if isnull(ls_cod_caja) or ls_cod_caja='' then
				messagebox("Advertencia", "Debe Ingresar Código Caja")
				dw_lista.setfocus()
				dw_lista.setcolumn('caja')
			elseif isnull(ldt_fec_pago) then
				messagebox("Advertencia", "Debe Ingresar Fecha Pago")
				dw_lista.setfocus()
				dw_lista.setcolumn('fecha')
			end if	
		end if
	end if
end if

end event

type cb_5 from commandbutton within w_sap_cuadratura_pagos
integer x = 4750
integer y = 2104
integer width = 238
integer height = 84
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_boletas.SETfilter(NULO)
dw_boletas.filter()
end event

type cb_4 from commandbutton within w_sap_cuadratura_pagos
integer x = 5234
integer y = 2104
integer width = 238
integer height = 84
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_boletas.rowcount() > 0 then f_Print( dw_boletas )
end event

type cb_3 from commandbutton within w_sap_cuadratura_pagos
integer x = 4987
integer y = 2104
integer width = 238
integer height = 84
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_boletas.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_boletas.SETSORT(NULO)
	dw_boletas.SORT()
end if
end event

type cbx_boleta from checkbox within w_sap_cuadratura_pagos
integer x = 2757
integer y = 2112
integer width = 603
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Revisa Pagos Boletas"
end type

event clicked;string		ls_sociedad,ls_cod_caja,ls_pasa
long		ll_new
datetime	ldt_fec_ini,ldt_fec_fin,ldt_fecha
double	ldb_mto_doc,ldb_mto_docsap,ldb_mto_bol,ldb_mto_bolsap

if cbx_boleta.checked = true then
	ls_pasa												= 'S'
	w_sap_cuadratura_pagos.width				= 5650
	
elseif cbx_boleta.checked = false then
	ls_pasa												= 'N'
	dw_boletas.reset()
	w_sap_cuadratura_pagos.width				= 3826
end if

if ls_pasa= 'S' then 
	ldt_fec_ini											= datetime(date(em_fec_ini.text),time('00:00:00'))
	ldt_fec_fin											= datetime(date(em_fec_fin.text),time('00:00:00'))
	ls_sociedad											= mid(ddplb_sociedad.text,1,4)
	if isnull(ls_sociedad) or ls_sociedad='' then
		messagebox("Advertencia","Debe Ingresar Sociedad")
		ddplb_sociedad.setfocus()
	else
		if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
			messagebox("Advertencia","Fecha Inicial Inválida")
			em_fec_ini.setfocus()
		else
			if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
				messagebox("Advertencia","Fecha Término Inválida") 
				em_fec_fin.setfocus()
			else
				if ldt_fec_ini>ldt_fec_fin then
					messagebox("Advertencia","Rango de Fecha Incorrecta")
					em_fec_ini.setfocus()
				else
					wf_boleta_detalle(ldt_fec_ini,ldt_fec_fin,ls_sociedad)
				end if
			end if
		end if
	end if
end if
end event

type dw_boletas from datawindow within w_sap_cuadratura_pagos
integer x = 3826
integer y = 236
integer width = 1655
integer height = 1828
integer taborder = 110
string title = "none"
string dataobject = "dwe_sap_boleta_por_dia_caja"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string	ls_cod_caja,ls_sociedad,ls_string
datetime	ldt_fecha

ls_cod_caja						= dw_boletas.getitemstring(il_row2,'caja')
ldt_fecha							= dw_boletas.getitemdatetime(il_row2,'fecha')
ls_sociedad						= dw_boletas.getitemstring(il_row2,'sociedad')

if not isnull(ls_cod_caja) and ls_cod_caja<>'' and not isnull(ls_sociedad) and ls_sociedad<>'' and not isnull(ldt_fecha) then
	ls_string				= ls_cod_caja+'~t'+string(ldt_fecha,'dd/mm/yyyy')+'~t'+ls_sociedad
	OpenWithParm(w_cuadra_boleta_depos, ls_string)
else
	if isnull(ldt_fecha) then
		messagebox("Advertencia", "Debe Ingresar Fecha Caja")
	elseif isnull(ls_cod_caja) or ls_cod_caja = '' then
		messagebox("Advertencia", "Debe Ingresar Codigo Caja")
	elseif isnull(ls_sociedad) or ls_sociedad = '' then
		messagebox("Advertencia", "Debe Ingresar Sociedad")
	end if
end if

end event

event clicked;if row>0 then
	il_row2	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row2, true)
	is_lista		= 'B'					
end if
end event

type cb_refresh from commandbutton within w_sap_cuadratura_pagos
boolean visible = false
integer x = 5655
integer y = 1180
integer width = 457
integer height = 112
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Calcular Diferencia"
end type

event clicked;string		ls_sociedad,ls_cod_caja
long		ll_new
datetime	ldt_fec_ini,ldt_fec_fin,ldt_fecha
double	ldb_mto_doc,ldb_mto_docsap,ldb_mto_bol,ldb_mto_bolsap

dw_boletas.reset()
ldt_fec_ini													= datetime(date(em_fec_ini.text),time('00:00:00'))
ldt_fec_fin													= datetime(date(em_fec_fin.text),time('00:00:00'))
ls_sociedad													= mid(ddplb_sociedad.text,1,4)
if isnull(ls_sociedad) or ls_sociedad='' then
	messagebox("Advertencia","Debe Ingresar Sociedad")
	ddplb_sociedad.setfocus()
else
	if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_fec_ini.setfocus()
	else
		if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
			messagebox("Advertencia","Fecha Término Inválida") 
			em_fec_fin.setfocus()
		else
			if ldt_fec_ini>ldt_fec_fin then
				messagebox("Advertencia","Rango de Fecha Incorrecta")
				em_fec_ini.setfocus()
			else
				wf_boleta_detalle(ldt_fec_ini,ldt_fec_fin,ls_sociedad)
			end if
		end if
	end if
end if

end event

type st_1 from statictext within w_sap_cuadratura_pagos
integer x = 78
integer y = 24
integer width = 379
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sociedad"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddplb_sociedad from dropdownpicturelistbox within w_sap_cuadratura_pagos
integer x = 46
integer y = 108
integer width = 1056
integer height = 536
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

type dw_cajas_hana from datawindow within w_sap_cuadratura_pagos
integer x = 1102
integer y = 2340
integer width = 512
integer height = 184
integer taborder = 50
string title = "none"
string dataobject = "dwe_cajas_hana"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type hpb_1 from hprogressbar within w_sap_cuadratura_pagos
boolean visible = false
integer x = 1221
integer y = 1132
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_sap_cuadratura_pagos
boolean visible = false
integer x = 1797
integer y = 1060
integer width = 233
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_sap_cuadratura_pagos
boolean visible = false
integer x = 41
integer y = 2348
integer width = 471
integer height = 104
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingreso <> &Doctos."
end type

event clicked;string ls_filtro

ls_filtro 					= 'difer_caja<>0'
dw_lista.setfilter(ls_filtro)
dw_lista.filter( )

end event

type cb_crea_docto from commandbutton within w_sap_cuadratura_pagos
boolean visible = false
integer x = 631
integer y = 2404
integer width = 411
integer height = 104
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crea Reg. Docto."
end type

event clicked;string		ls_caja,ls_tipo_cob
long		ll_folio,ll_hora,ll_minuto,ll_tot_reg,ll_res
double	ldb_monto
datetime	ldt_fec_pago,ldt_fec_sistema
date		ld_fec_pago

ll_tot_reg					=  dw_lista.rowcount()
if ll_tot_reg>0 then
	if il_row>0 then
		ls_caja				= dw_lista.getitemstring(il_row,'cod_caja')
		ldt_fec_pago		= dw_lista.getitemdatetime(il_row,'fecha_pago')
		ld_fec_pago			= date(ldt_fec_pago)
		
		if not isnull(ls_caja) and ls_caja<>'' and not isnull(ldt_fec_pago) then
			ll_res				= MessageBox("Advertencia", '¿Desea Eliminar Integración Caja: '+ls_caja+' Con Fecha: '+string(ldt_fec_pago,'dd/mm/yyyy')+'?', Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				DECLARE x1 CURSOR FOR
				SELECT	"FOLIO",	"TIPO_COB",	SUM("MONTO")
				FROM		"INGRESO"
				WHERE 	"INGRESO"."PAGO_HIST"='A' AND
							"INGRESO"."TIPO_COB"<>'NE' AND
							"INGRESO"."FECHA_PAGO" = :ldt_fec_pago AND
							"INGRESO"."COD_CAJA" = :ls_caja AND
							"INGRESO"."TIPO_MOV" <> 'S' 
				GROUP BY	"INGRESO"."FOLIO",	"INGRESO"."TIPO_COB"
				USING	sqlca;
				open x1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch x1 INTO	:ll_folio,	:ls_tipo_cob,	:ldb_monto;
						if not isnull(ll_folio) and ll_folio>0 and not isnull(ldb_monto) and ldb_monto>0 and not isnull(ls_tipo_cob) and ls_tipo_cob<>'' then
							SELECT	"FECHA_SISTEMA"
							INTO		:ldt_fec_sistema
							FROM		"INGRESO"
							WHERE 	"INGRESO"."PAGO_HIST"='A' AND
										"INGRESO"."TIPO_COB"<>'NE' AND
										"INGRESO"."FECHA_PAGO" = :ldt_fec_pago AND
										"INGRESO"."COD_CAJA" = :ls_caja AND
										"INGRESO"."TIPO_MOV" <> 'S' 
							USING	Trans_1;
							
							ll_hora		= long(string(ldt_fec_sistema,'hh'))
							ll_minuto		= long(string(ldt_fec_sistema,'mm'))
							
							
							INSERT INTO "DOCUMENTOS"  
											( "FOLIO",	"TIPO_COB",	"N_CHEQUE",	"COD_BANCO",	"MONTO",	"FECHA_VENC",		"COD_PAGO",	"ESTADO_CH",	"NUM_CHEQUES",	"REZAGO",	"FECHA_PAGO",	"COD_CAJA",	"COD_TARJETA_CREDITO",	"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",	"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO",	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",	"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",	"ESTADO_PAGO_SAP")  
							VALUES 	 	( :ll_folio,	:ls_tipo_cob,	999,				999,				:ldb_monto,	:ld_fec_pago,			'EF',				'C',				999,					' ',				:ld_fec_pago,		:ls_caja,			0,									0,									'0',											0,									0,									'0',											0,								null,						1,												:ll_hora,			:ll_minuto,			null,							'BE',					99)
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								commit;
							else
								rollback;
							end if
						end if
						setnull(ll_folio);setnull(ls_tipo_cob);setnull(ldb_monto)
					LOOP
				end if
				close x1;
			end if
		end if
	end if
end if
end event

type cbx_difer from checkbox within w_sap_cuadratura_pagos
integer x = 3351
integer y = 144
integer width = 398
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Sin Integrar"
end type

type rb_caja from radiobutton within w_sap_cuadratura_pagos
integer x = 2555
integer y = 36
integer width = 274
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Por Caja"
boolean lefttext = true
end type

event clicked;string		ls_caja,ls_descrip
datetime	ldt_fec_ini,ldt_fec_fin

dw_lista.reset()
ddplb_caja.reset()

ddplb_caja.enabled 	= true
st_5.enabled 			= true

ldt_fec_ini				= datetime(date(em_fec_ini.text),time('00:00:00'))
ldt_fec_fin				= datetime(date(em_fec_fin.text),time('00:00:00'))
DECLARE x1 CURSOR FOR  
SELECT DISTINCT "CODIGO_CAJAS"."COD_CAJA",   
				"CODIGO_CAJAS"."GLS_CAJA"  
FROM 		"CODIGO_CAJAS","INGRESO"  
WHERE 		"CODIGO_CAJAS"."COD_CAJA" = "INGRESO"."COD_CAJA" AND
				"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S' AND
				"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
				"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND  
				"INGRESO"."TIPO_COB" <> 'NE' AND  
				"INGRESO"."PAGO_HIST" = 'A' AND  
				"INGRESO"."TIPO_MOV" <> 'S' 
ORDER BY 	"CODIGO_CAJAS"."COD_CAJA" ASC   
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_caja, :ls_descrip;
		if not isnull(ls_caja) and ls_caja<>'' then
			ddplb_caja.additem(ls_caja + ' - ' +ls_descrip)
		end if
		Setnull(ls_caja)
	LOOP
end if
close x1;
end event

type rb_todas from radiobutton within w_sap_cuadratura_pagos
integer x = 2199
integer y = 36
integer width = 242
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Todas"
boolean checked = true
boolean lefttext = true
end type

event clicked;dw_lista.reset()
ddplb_caja.reset()
ddplb_caja.enabled 	= false
st_5.enabled 			= false
end event

type st_5 from statictext within w_sap_cuadratura_pagos
integer x = 2171
integer y = 120
integer width = 133
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Caja"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddplb_caja from dropdownpicturelistbox within w_sap_cuadratura_pagos
integer x = 2341
integer y = 108
integer width = 782
integer height = 544
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

event selectionchanged;dw_lista.reset()
end event

type cb_eliminar from commandbutton within w_sap_cuadratura_pagos
integer x = 41
integer y = 2100
integer width = 471
integer height = 112
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar &Integración"
end type

event clicked;string		ls_cod_caja,ls_sociedad,ls_pasa
long		ll_tot_reg,ll_res,ll_graba=0
datetime	ldt_fec_pago


if is_lista = 'I' then
	ll_tot_reg						=  dw_lista.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra datos Para Consultar")
		ls_pasa						= 'N'
	else
		if il_row>0 then
			ls_cod_caja				= dw_lista.getitemstring(il_row,'cod_caja')
			ldt_fec_pago			= dw_lista.getitemdatetime(il_row,'fecha_pago')
			ls_sociedad				= dw_lista.getitemstring(il_row,'sociedad')
		end if
		ls_pasa						= 'S'
	end if	
elseif is_lista = 'B' then
	ll_tot_reg					=  dw_boletas.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra datos Para Consultar")
		ls_pasa						= 'N'
	else
		if il_row2>0 then
			ls_cod_caja				= dw_boletas.getitemstring(il_row2,'caja')
			ldt_fec_pago			= dw_boletas.getitemdatetime(il_row2,'fecha')
			ls_sociedad				= dw_boletas.getitemstring(il_row2,'sociedad')
		end if
		ls_pasa						= 'S'
	end if	
end if

if ls_pasa='S' then
	if not isnull(ls_cod_caja) and ls_cod_caja<>'' and not isnull(ldt_fec_pago) then
		ll_res			= MessageBox("Advertencia", '¿Desea Eliminar Integración Caja: '+ls_cod_caja+' Con Fecha: '+string(ldt_fec_pago,'dd/mm/yyyy')+'?', Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			DELETE FROM "SAP_CABECERA_PAGOS"  
			WHERE	"SAP_CABECERA_PAGOS"."FECHA_PAGO" = :ldt_fec_pago AND  
						"SAP_CABECERA_PAGOS"."COD_CAJA" = :ls_cod_caja AND
						"SAP_CABECERA_PAGOS"."SOCIEDAD" = :ls_sociedad
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				ll_graba++
			else
				rollback using sqlca;
			end if
			
			if ll_graba=1 then
				DELETE FROM "SAP_DEBE_SAP"  
				WHERE	"SAP_DEBE_SAP"."FECHA_PAGO" = :ldt_fec_pago AND  
							"SAP_DEBE_SAP"."COD_CAJA" = :ls_cod_caja AND
							"SAP_DEBE_SAP"."SOCIEDAD" = :ls_sociedad
				USING	sqlca;
				if sqlca.sqlcode = 0 then
					commit using sqlca;
					ll_graba++
				else
					rollback using sqlca;
				end if
			end if
			
			if ll_graba=2 then
				DELETE FROM "SAP_HABER_SAP"  
				WHERE	"SAP_HABER_SAP"."FECHA_PAGO" = :ldt_fec_pago AND  
							"SAP_HABER_SAP"."COD_CAJA" = :ls_cod_caja AND
							"SAP_HABER_SAP"."SOCIEDAD" = :ls_sociedad 
				USING	sqlca;
				if sqlca.sqlcode = 0 then
					commit using sqlca;
					ll_graba++
				else
					rollback using sqlca;
				end if
			end if
			
			if ll_graba=3 then
				DECLARE sap_actualiza PROCEDURE FOR F_SAP_ACT_INTEGRA_CAJA(:ls_cod_caja,:ldt_fec_pago,:ls_sociedad,99);
				EXECUTE sap_actualiza;
				if sqlca.sqlcode=0 then
				fetch sap_actualiza into :ll_graba;
				close sap_actualiza;
				end if
			end if
			
			if ll_graba=0 then
				messagebox("Error",'No Actualizo Tabla "SAP_CABECERA_PAGOS" Caja :'+ls_cod_caja+' - Con Fecha :'+ string(ldt_fec_pago,'dd/mm/yyyy')+' - Sociedad :'+ls_sociedad)
			elseif ll_graba=1 then
				messagebox("Error",'No Actualizo Tabla "SAP_DEBE_SAP" Caja :'+ls_cod_caja+' - Con Fecha :'+ string(ldt_fec_pago,'dd/mm/yyyy')+' - Sociedad :'+ls_sociedad)
			elseif ll_graba=2 then
				messagebox("Error",'No Actualizo Tabla "SAP_HABER_SAP" Caja :'+ls_cod_caja+' - Con Fecha :'+ string(ldt_fec_pago,'dd/mm/yyyy')+' - Sociedad :'+ls_sociedad)	
			elseif ll_graba=3 then
				messagebox("Error",'No Actualizo Tabla "INGRESO" Caja :'+ls_cod_caja+' - Con Fecha :'+ string(ldt_fec_pago,'dd/mm/yyyy')+' - Sociedad :'+ls_sociedad)
			elseif ll_graba=4 then
				messagebox("Error",'No Actualizo Tabla "DOCUMENTO" Caja :'+ls_cod_caja+' - Con Fecha :'+ string(ldt_fec_pago,'dd/mm/yyyy')+' - Sociedad :'+ls_sociedad)	
			elseif ll_graba=5 then
				messagebox("Eliminar","Eliminación de Caja Exitosa")
			end if
		end if
	else
		if is_lista = 'I' then
			if isnull(ls_cod_caja) or ls_cod_caja='' then
				messagebox("Advertencia", "Debe Ingresar Código Caja")
				dw_lista.setfocus()
				dw_lista.setcolumn('cod_caja')
			elseif isnull(ldt_fec_pago) then
				messagebox("Advertencia", "Debe Ingresar Fecha Pago")
				dw_lista.setfocus()
				dw_lista.setcolumn('fecha_pago')
			end if
		
		elseif is_lista = 'B' then
			if isnull(ls_cod_caja) or ls_cod_caja='' then
				messagebox("Advertencia", "Debe Ingresar Código Caja")
				dw_lista.setfocus()
				dw_lista.setcolumn('caja')
			elseif isnull(ldt_fec_pago) then
				messagebox("Advertencia", "Debe Ingresar Fecha Pago")
				dw_lista.setfocus()
				dw_lista.setcolumn('fecha')
			end if
		end if
	end if
end if

end event

type cb_imprimir from commandbutton within w_sap_cuadratura_pagos
integer x = 1925
integer y = 2116
integer width = 224
integer height = 84
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )
end event

type cb_exportar from commandbutton within w_sap_cuadratura_pagos
integer x = 1234
integer y = 2116
integer width = 224
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_sap_cuadratura_pagos
integer x = 1458
integer y = 2116
integer width = 224
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_sap_cuadratura_pagos
integer x = 1678
integer y = 2116
integer width = 224
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_ok from picturebutton within w_sap_cuadratura_pagos
event ue_mousemove pbm_mousemove
integer x = 3173
integer y = 96
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string		ls_cod_caja,ls_sociedad,ls_empresa,ls_cob_orig,ls_caja_hana,ls_soc
long		ll_new,ll_tot_reg,ll_folio_orig,ll_tot_hana,ll_indi,ll_folio_orig_aux=0,ll_estado_integ
datetime	ldt_fec_ini,ldt_fec_fin,ldt_fec_pago,ldt_fec_proceso,ldt_fec_hana
double	ldb_tot_ingre,ldb_integ,ldb_sin_integ,ldb_dif_gnp,ldb_dif_sap,ldb_debe_sap,ldb_haber_sap,ldb_dif_integ,ldb_nota_cred2=0,ldb_dif_sap2,ldb_tot_descto,&
			ldb_tot_docto,ldb_docto_integ,ldb_docto_sin_integ,ldb_dif_caja,ldb_nota_cred,ldb_tot_porc	=0,ldb_tot_porc_aux=0,ldb_mto_real,ldb_dif_real

dw_lista.reset()
dw_cajas_hana.reset()
if gs_conexion = "Parque El Prado" then
	ls_empresa												= 'P'
	ls_soc														= 'CL02'
elseif gs_conexion = "Parque La Foresta" then
	ls_empresa												= 'F'
	ls_soc														= 'CL03'
end if

ls_cod_caja													= trim(mid(ddplb_caja.text,1,(pos(ddplb_caja.text,'-') - 1)))
ldt_fec_ini													= datetime(date(em_fec_ini.text),time('00:00:00'))
ldt_fec_fin													= datetime(date(em_fec_fin.text),time('00:00:00'))
ls_sociedad													= mid(ddplb_sociedad.text,1,4)
if isnull(ls_sociedad) or ls_sociedad='' then
	messagebox("Advertencia","Debe Ingresar Sociedad")
	ddplb_sociedad.setfocus()
else
	if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_fec_ini.setfocus()
	else
		if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
			messagebox("Advertencia","Fecha Término Inválida") 
			em_fec_fin.setfocus()
		else
			if ldt_fec_ini>ldt_fec_fin then
				messagebox("Advertencia","Rango de Fecha Incorrecta")
				em_fec_ini.setfocus()
			else
				dw_lista.object.usuario.text					= gs_user
				if cbx_difer.checked = true then
					ll_estado_integ								= 99
				else
					ll_estado_integ								= 0
				end if
				
				
				
				
				
				if rb_todas.checked = true then
					if ls_sociedad = 'CL04' then
						SELECT		SUM(COUNT( DISTINCT "INGRESO"."COD_CAJA"))
						INTO			:ll_tot_reg
						FROM 		"INGRESO"  
						WHERE		"INGRESO"."FECHA_DEPOSITO" >= :ldt_fec_ini AND  
										"INGRESO"."FECHA_DEPOSITO" <= :ldt_fec_fin AND
										"INGRESO"."FECHA_PAGO" >= TO_DATE('01/10/2018','DD/MM/YYYY') AND
										F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = 'CL04' AND
										("INGRESO"."PAGO_HIST" = 'A' OR "INGRESO"."PAGO_HIST" = 'N') AND
										"INGRESO"."ESTADO_PAGO_SAP" = :ll_estado_integ AND
										"INGRESO"."COD_CAJA" <> 'CR' AND
										"INGRESO"."TIPO_MOV" <> 'S' 
						GROUP BY	"INGRESO"."FECHA_DEPOSITO"
						USING		sqlca;
					else
						SELECT		SUM(COUNT( DISTINCT "INGRESO"."COD_CAJA"))
						INTO			:ll_tot_reg
						FROM 		"INGRESO"  
						WHERE		"INGRESO"."FECHA_DEPOSITO" >= :ldt_fec_ini AND  
										"INGRESO"."FECHA_DEPOSITO" <= :ldt_fec_fin AND
										"INGRESO"."FECHA_PAGO" >= TO_DATE('01/10/2018','DD/MM/YYYY') AND
										"INGRESO"."TIPO_COB" <> 'NE' AND 
										"INGRESO"."TIPO_COB" <> 'NC' AND
										"INGRESO"."TIPO_COB" <> 'ND' AND
										F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = :ls_soc AND
										("INGRESO"."PAGO_HIST" = 'A' OR "INGRESO"."PAGO_HIST" = 'N') AND
										"INGRESO"."ESTADO_PAGO_SAP" = :ll_estado_integ AND
										"INGRESO"."COD_CAJA" <> 'CR' AND
										"INGRESO"."TIPO_MOV" <> 'S' 
						GROUP BY	"INGRESO"."FECHA_DEPOSITO"
						USING		sqlca;
					end if	
				elseif rb_caja.checked = true then
					if ls_sociedad = 'CL04' then
						SELECT		SUM(COUNT( DISTINCT "INGRESO"."COD_CAJA"))
						INTO			:ll_tot_reg
						FROM			"INGRESO"  
						WHERE		"INGRESO"."FECHA_DEPOSITO" >= :ldt_fec_ini AND  
										"INGRESO"."FECHA_DEPOSITO" <= :ldt_fec_fin AND
										"INGRESO"."FECHA_PAGO" >= TO_DATE('01/10/2018','DD/MM/YYYY') AND
										F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = 'CL04' AND
										("INGRESO"."PAGO_HIST" = 'A' OR "INGRESO"."PAGO_HIST" = 'N') AND
										"INGRESO"."COD_CAJA" <> 'CR' AND
										"INGRESO"."ESTADO_PAGO_SAP" = :ll_estado_integ AND
										"INGRESO"."COD_CAJA" = :ls_cod_caja AND
										"INGRESO"."TIPO_MOV" <> 'S' 
						GROUP BY	"INGRESO"."FECHA_DEPOSITO"
						USING		sqlca;
					else
						SELECT		SUM(COUNT( DISTINCT "INGRESO"."COD_CAJA"))
						INTO			:ll_tot_reg
						FROM			"INGRESO"  
						WHERE		"INGRESO"."FECHA_DEPOSITO" >= :ldt_fec_ini AND  
										"INGRESO"."FECHA_DEPOSITO" <= :ldt_fec_fin AND
										"INGRESO"."FECHA_PAGO" >= TO_DATE('01/10/2018','DD/MM/YYYY') AND
										F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = :ls_soc AND
										("INGRESO"."PAGO_HIST" = 'A' OR "INGRESO"."PAGO_HIST" = 'N') AND
										"INGRESO"."COD_CAJA" <> 'CR' AND
										"INGRESO"."ESTADO_PAGO_SAP" = :ll_estado_integ AND
										"INGRESO"."COD_CAJA" = :ls_cod_caja AND
										"INGRESO"."TIPO_MOV" <> 'S' 
						GROUP BY	"INGRESO"."FECHA_DEPOSITO"
						USING		sqlca;
					end if
				end if
				if isnull(ll_tot_reg) then ll_tot_reg=0
				if ll_tot_reg=0 then
					messagebox("Advertencia","No Registra Datos")
				else
					SetPointer(HourGlass!)
					
					wf_carga_caja_sap(ldt_fec_ini,ldt_fec_fin,gs_mandatario,ls_sociedad)
					
					
					st_fondo.visible				= true
					hpb_1.visible				= true
					st_porc.visible				= true
					hpb_1.Position				= ldb_tot_porc
					if rb_todas.checked = true then
						if ls_sociedad = 'CL04' then
							DECLARE x1 CURSOR FOR
							SELECT	"INGRESO"."COD_CAJA",   
										"INGRESO"."FECHA_DEPOSITO",
										SUM("INGRESO"."MONTO"),
										SUM(( CASE		WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																	WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																															ELSE 1 END ) * "INGRESO"."MONTO_UF") 
															ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																		ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)) as pr01,
										
										
										SUM(( CASE WHEN  "INGRESO"."ESTADO_PAGO_SAP" = 0 THEN  (	CASE	WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																																		ELSE 1 END ) * "INGRESO"."MONTO_UF") 
																																ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																					WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																			ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)  ELSE 0 END )) as pr02,
										
										SUM(( CASE WHEN  "INGRESO"."ESTADO_PAGO_SAP" = 99 THEN  ( CASE	WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																																		ELSE 1 END ) * "INGRESO"."MONTO_UF") 
																																ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																					WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																			ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)  ELSE 0 END )) as pr03
							FROM 		"INGRESO"
							WHERE		"INGRESO"."FECHA_DEPOSITO" >= :ldt_fec_ini AND  
											"INGRESO"."FECHA_DEPOSITO" <= :ldt_fec_fin AND
											"INGRESO"."FECHA_PAGO" >= TO_DATE('01/10/2018','DD/MM/YYYY') AND
											F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = 'CL04' AND
											("INGRESO"."PAGO_HIST" = 'A' OR "INGRESO"."PAGO_HIST" = 'N') AND
											"INGRESO"."COD_CAJA" <> 'CR' AND
											"INGRESO"."ESTADO_PAGO_SAP" = :ll_estado_integ AND
											"INGRESO"."TIPO_MOV" <> 'S' 
							GROUP BY	"INGRESO"."COD_CAJA",
											"INGRESO"."FECHA_DEPOSITO"
							ORDER BY	"INGRESO"."FECHA_DEPOSITO" ASC,
											"INGRESO"."COD_CAJA" ASC
							USING		sqlca;
						else
							DECLARE x3 CURSOR FOR
							SELECT	"INGRESO"."COD_CAJA",   
										"INGRESO"."FECHA_DEPOSITO",
										SUM("INGRESO"."MONTO"),
										SUM(( CASE		WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																	WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																															ELSE 1 END ) * "INGRESO"."MONTO_UF") 
															ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																		ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)) as pr01,
										
										
										SUM(( CASE WHEN  "INGRESO"."ESTADO_PAGO_SAP" = 0 THEN  (	CASE	WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																																		ELSE 1 END ) * "INGRESO"."MONTO_UF") 
																																ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																					WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																			ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)  ELSE 0 END )) as pr02,
										
										SUM(( CASE WHEN  "INGRESO"."ESTADO_PAGO_SAP" = 99 THEN  ( CASE	WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																																		ELSE 1 END ) * "INGRESO"."MONTO_UF") 
																																ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																					WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																			ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)  ELSE 0 END )) as pr03
							FROM 		"INGRESO"
							WHERE		"INGRESO"."FECHA_DEPOSITO" >= :ldt_fec_ini AND  
											"INGRESO"."FECHA_DEPOSITO" <= :ldt_fec_fin AND
											"INGRESO"."FECHA_PAGO" >= TO_DATE('01/10/2018','DD/MM/YYYY') AND
											"INGRESO"."TIPO_COB" <> 'NE' AND
											"INGRESO"."TIPO_COB" <> 'NC' AND
											"INGRESO"."TIPO_COB" <> 'ND' AND
											F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = :ls_soc AND
											("INGRESO"."PAGO_HIST" = 'A' OR "INGRESO"."PAGO_HIST" = 'N') AND
											"INGRESO"."COD_CAJA" <> 'CR' AND
											"INGRESO"."ESTADO_PAGO_SAP" = :ll_estado_integ AND
											"INGRESO"."TIPO_MOV" <> 'S' 
							GROUP BY	"INGRESO"."COD_CAJA",
											"INGRESO"."FECHA_DEPOSITO"
							ORDER BY	"INGRESO"."FECHA_DEPOSITO" ASC,
											"INGRESO"."COD_CAJA" ASC
							USING		sqlca;
						end if
					elseif rb_caja.checked = true then
						if ls_sociedad = 'CL04' then
							DECLARE x2 CURSOR FOR
							SELECT		"INGRESO"."COD_CAJA",   
											"INGRESO"."FECHA_DEPOSITO",
											SUM("INGRESO"."MONTO"),
											SUM(( CASE		WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																	WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																															ELSE 1 END ) * "INGRESO"."MONTO_UF") 
															ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																		ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)) as pr01,
										
										
											SUM(( CASE WHEN  "INGRESO"."ESTADO_PAGO_SAP" = 0 THEN  (	CASE	WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																																		ELSE 1 END ) * "INGRESO"."MONTO_UF") 
																																ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																					WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																			ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)  ELSE 0 END )) as pr02,
										
											SUM(( CASE WHEN  "INGRESO"."ESTADO_PAGO_SAP" = 99 THEN  ( CASE	WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																																		ELSE 1 END ) * "INGRESO"."MONTO_UF") 
																																ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																					WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																			ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)  ELSE 0 END )) as pr03
							FROM 		"INGRESO"
							WHERE		"INGRESO"."FECHA_DEPOSITO" >= :ldt_fec_ini AND  
											"INGRESO"."FECHA_DEPOSITO" <= :ldt_fec_fin AND
											"INGRESO"."FECHA_PAGO" >= TO_DATE('01/10/2018','DD/MM/YYYY') AND
											F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = 'CL04' AND
											("INGRESO"."PAGO_HIST" = 'A' OR "INGRESO"."PAGO_HIST" = 'N') AND
											"INGRESO"."COD_CAJA" <> 'CR' AND
											"INGRESO"."ESTADO_PAGO_SAP" = :ll_estado_integ AND
											"INGRESO"."COD_CAJA" = :ls_cod_caja AND
											( "INGRESO"."TIPO_MOV" <> 'S' ) 
							GROUP BY	"INGRESO"."COD_CAJA",
											"INGRESO"."FECHA_DEPOSITO"
							ORDER BY	"INGRESO"."FECHA_DEPOSITO" ASC,
											"INGRESO"."COD_CAJA" ASC
							USING		sqlca;
						else
							DECLARE x4 CURSOR FOR
							SELECT		"INGRESO"."COD_CAJA",   
											"INGRESO"."FECHA_DEPOSITO",
											SUM("INGRESO"."MONTO"),
											SUM(( CASE		WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																	WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																															ELSE 1 END ) * "INGRESO"."MONTO_UF") 
															ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																		ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)) as pr01,
										
										
											SUM(( CASE WHEN  "INGRESO"."ESTADO_PAGO_SAP" = 0 THEN  (	CASE	WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																																		ELSE 1 END ) * "INGRESO"."MONTO_UF") 
																																ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																					WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																			ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)  ELSE 0 END )) as pr02,
										
											SUM(( CASE WHEN  "INGRESO"."ESTADO_PAGO_SAP" = 99 THEN  ( CASE	WHEN "INGRESO"."MONEDA_SAP" = '1' THEN ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																																				WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																																		ELSE 1 END ) * "INGRESO"."MONTO_UF") 
																																ELSE ( (	CASE WHEN "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K' OR "INGRESO"."TIPO_MOV" = 'U' OR "INGRESO"."TIPO_MOV" = 'F' THEN "INGRESO"."CUOTAS_PAG"
																																					WHEN "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q' THEN (SELECT F_SAP_CTAS_PAG_PIE ("INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO","INGRESO"."MONTO_UF") FROM dual)
																																			ELSE 1 END ) * ROUND("INGRESO"."MONTO_UF" * "INGRESO"."VALOR_UF",0)) END)  ELSE 0 END )) as pr03
							FROM 		"INGRESO"
							WHERE		"INGRESO"."FECHA_DEPOSITO" >= :ldt_fec_ini AND  
											"INGRESO"."FECHA_DEPOSITO" <= :ldt_fec_fin AND
											"INGRESO"."FECHA_PAGO" >= TO_DATE('01/10/2018','DD/MM/YYYY') AND
											"INGRESO"."TIPO_COB" <> 'NE' AND
											"INGRESO"."TIPO_COB" <> 'NC' AND
											"INGRESO"."TIPO_COB" <> 'ND' AND
											F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = :ls_soc AND
											("INGRESO"."PAGO_HIST" = 'A' OR "INGRESO"."PAGO_HIST" = 'N') AND
											"INGRESO"."COD_CAJA" <> 'CR' AND
											"INGRESO"."ESTADO_PAGO_SAP" = :ll_estado_integ AND
											"INGRESO"."COD_CAJA" = :ls_cod_caja AND
											( "INGRESO"."TIPO_MOV" <> 'S' ) 
							GROUP BY	"INGRESO"."COD_CAJA",
											"INGRESO"."FECHA_DEPOSITO"
							ORDER BY	"INGRESO"."FECHA_DEPOSITO" ASC,
											"INGRESO"."COD_CAJA" ASC
							USING		sqlca;
						end if
					end if
					if rb_todas.checked = true then
						if ls_sociedad = 'CL04' then
							open x1;
						else
							open x3;
						end if
					elseif rb_caja.checked = true then
						if ls_sociedad = 'CL04' then
							open x2;
						else
							open x4;
						end if
					end if
					if sqlca.sqlcode=0 then
						DO WHILE sqlca.sqlcode=0
							if rb_todas.checked = true then
								if ls_sociedad = 'CL04' then
									fetch x1 INTO	:ls_cod_caja,:ldt_fec_pago,:ldb_mto_real,:ldb_tot_ingre,:ldb_integ,:ldb_sin_integ;
								else
									fetch x3 INTO	:ls_cod_caja,:ldt_fec_pago,:ldb_mto_real,:ldb_tot_ingre,:ldb_integ,:ldb_sin_integ;
									end if
							elseif rb_caja.checked = true then
								if ls_sociedad = 'CL04' then
									fetch x2 INTO	:ls_cod_caja,:ldt_fec_pago,:ldb_mto_real,:ldb_tot_ingre,:ldb_integ,:ldb_sin_integ;
								else
									fetch x4 INTO	:ls_cod_caja,:ldt_fec_pago,:ldb_mto_real,:ldb_tot_ingre,:ldb_integ,:ldb_sin_integ;
								end if
							end if
							if not isnull(ls_cod_caja) and ls_cod_caja<>'' then
								if isnull(ldb_tot_ingre) then ldb_tot_ingre			= 0
								if isnull(ldb_integ) then ldb_integ					= 0
								if isnull(ldb_sin_integ) then ldb_sin_integ			= 0
								ldb_nota_cred 											= 0
								
								SELECT	SUM("DOCUMENTOS"."MONTO")
								INTO		:ldb_tot_docto
								FROM		"DOCUMENTOS"  
								WHERE	"DOCUMENTOS"."COD_CAJA" = :ls_cod_caja AND  
											"DOCUMENTOS"."FECHA_DEPOSITO" = :ldt_fec_pago AND  
											F_SOCIEDAD_TIPO_COB( "DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO" ) = : ls_sociedad
								USING	sqlca;
								if isnull(ldb_tot_docto) then ldb_tot_docto=0
								
								
								SELECT	SUM("INGRESO"."MONTO" * -1 )  
								INTO		:ldb_tot_descto
								FROM		"INGRESO"
								WHERE	"INGRESO"."COD_CAJA" = :ls_cod_caja AND  
											"INGRESO"."FECHA_DEPOSITO" = :ldt_fec_pago AND
											F_SOCIEDAD_TIPO_COB( "INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO" ) = :ls_sociedad AND
											"INGRESO"."TIPO_MOV" = 'S'	
								USING	sqlca;
								if isnull(ldb_tot_descto) then ldb_tot_descto=0
								
								ldb_tot_docto				= ldb_tot_docto + ldb_tot_descto 
								
								//ldb_pagos_ext				= wf_web_pagos(:ls_cod_caja,:ldt_fec_pago)
								
								
								ldb_dif_caja					= ldb_tot_ingre - ldb_tot_docto
								ldb_dif_gnp					= ldb_tot_ingre - ldb_integ
								
								ll_tot_hana					= dw_cajas_hana.rowcount()
								if ll_tot_hana>0 then
									for ll_indi=1 to	ll_tot_hana
										ls_caja_hana			= dw_cajas_hana.getitemstring(ll_indi,'cod_caja')
										ldt_fec_hana			= dw_cajas_hana.getitemdatetime(ll_indi,'fecha_pago')
										if ls_cod_caja=ls_caja_hana and ldt_fec_pago=ldt_fec_hana then
											ldb_debe_sap		= dw_cajas_hana.getitemnumber(ll_indi,'debe')
											ldb_haber_sap		= dw_cajas_hana.getitemnumber(ll_indi,'haber')
											ll_indi					= ll_tot_hana + 1
										end if
									next
								end if
								
								if ldb_mto_real = ldb_debe_sap then
									 ldb_nota_cred				= 0	
								else
									SELECT	MAX("SAP_CABECERA_PAGOS"."FECHA_SAP")
									INTO		:ldt_fec_proceso
									FROM 	"SAP_CABECERA_PAGOS"  
									WHERE	"SAP_CABECERA_PAGOS"."COD_CAJA"= :ls_cod_caja AND
												"SAP_CABECERA_PAGOS"."FECHA_PAGO" =:ldt_fec_pago
									USING	Trans_1;
									if Trans_1.sqlcode=0 then
										if ls_sociedad = 'CL04' then
											DECLARE x5 CURSOR FOR
											SELECT	DISTINCT "TIPO_COB_ORIGINAL",	"FOLIO_ORIGINAL"
											FROM 	"INGRESO","NOTA_DE_CREDITO"  
											WHERE	"INGRESO"."FECHA_PAGO" = "NOTA_DE_CREDITO"."FECHA_PAGO" AND 	
														"INGRESO"."FOLIO" = "NOTA_DE_CREDITO"."FOLIO" AND
														"INGRESO"."TIPO_COB" = "NOTA_DE_CREDITO"."TIPO_COB" AND
														 "INGRESO"."TIPO_MOV" = "NOTA_DE_CREDITO"."TIPO_MOV" AND
														"INGRESO"."FECHA_DEPOSITO" = :ldt_fec_pago AND  
														
														F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = 'CL04' AND
														
														"INGRESO"."COD_CAJA" = :ls_cod_caja AND
														"INGRESO"."TIPO_MOV" <> 'S'
											USING	Trans_2;
										else
											DECLARE x6 CURSOR FOR
											SELECT	DISTINCT "TIPO_COB_ORIGINAL",	"FOLIO_ORIGINAL"
											FROM 	"INGRESO","NOTA_DE_CREDITO"  
											WHERE	"INGRESO"."FECHA_PAGO" = "NOTA_DE_CREDITO"."FECHA_PAGO" AND 	
														"INGRESO"."FOLIO" = "NOTA_DE_CREDITO"."FOLIO" AND
														"INGRESO"."TIPO_COB" = "NOTA_DE_CREDITO"."TIPO_COB" AND
														 "INGRESO"."TIPO_MOV" = "NOTA_DE_CREDITO"."TIPO_MOV" AND
														"INGRESO"."FECHA_DEPOSITO" = :ldt_fec_pago AND  
														
														"INGRESO"."TIPO_COB" <> 'NE' AND
														"INGRESO"."TIPO_COB" <> 'NC' AND
														"INGRESO"."TIPO_COB" <> 'ND' AND
														
														F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") = :ls_soc AND
														
														"INGRESO"."COD_CAJA" = :ls_cod_caja AND
														"INGRESO"."TIPO_MOV" <> 'S'
											USING	Trans_2;
										end if
										if ls_sociedad='CL04' then
											open x5;
										else
											open x6;
										end if
										if Trans_2.sqlcode=0 then
											DO WHILE Trans_2.sqlcode=0
												if ls_sociedad='CL04' then	
													fetch x5 INTO :ls_cob_orig,:ll_folio_orig;
												else
													fetch x6 INTO :ls_cob_orig,:ll_folio_orig;
												end if
												if not isnull(ls_cob_orig) and ls_cob_orig <> '' and not isnull(ll_folio_orig) and ll_folio_orig>0 then
													SELECT	sum("INGRESO"."MONTO")
													INTO		:ldb_nota_cred2
													FROM 	"INGRESO"
													WHERE	"INGRESO"."FOLIO" = :ll_folio_orig AND
																"INGRESO"."TIPO_COB" =:ls_cob_orig AND
																 "INGRESO"."TIPO_MOV" = 'Z' AND
																"INGRESO"."FECHA_DEPOSITO" > :ldt_fec_proceso
													USING	Trans_1;
													if isnull(ldb_nota_cred2) then ldb_nota_cred2=0
													ldb_nota_cred				=  0	
												end if
												setnull(ls_cob_orig);setnull(ll_folio_orig)
											LOOP
										end if
										if ls_sociedad='CL04' then	
											close x5;
										else
											close x6;
										end if
									end if
								end if
								
								ldb_dif_sap										= ldb_debe_sap - ldb_haber_sap
								ldb_dif_gnp										= ldb_tot_ingre - ldb_integ
								
								
								ldb_dif_integ									= ldb_tot_ingre - ldb_debe_sap
								if ldb_dif_integ>-100 and ldb_dif_integ<100 and ldb_dif_integ<>0 then
									ldb_tot_ingre								= ldb_tot_ingre - ldb_dif_integ
									ldb_integ										= ldb_integ - ldb_dif_integ
									ldb_dif_integ								= ldb_dif_integ - ldb_dif_integ
								end if
								ldb_dif_real										= ldb_mto_real - ldb_tot_ingre
								
								ll_new						= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new)
								dw_lista.setitem(ll_new,"empresa",ls_empresa)
								dw_lista.setitem(ll_new,"cod_caja",ls_cod_caja)
								dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
								dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
								dw_lista.setitem(ll_new,"fecha_pago",ldt_fec_pago)
								dw_lista.setitem(ll_new,"monto_real",ldb_mto_real)
								
								dw_lista.setitem(ll_new,"total_ingreso",ldb_tot_ingre)
								dw_lista.setitem(ll_new,"integrado",ldb_integ)
								dw_lista.setitem(ll_new,"sin_integrar",ldb_sin_integ)
								dw_lista.setitem(ll_new,"total_docto",ldb_tot_docto)
								dw_lista.setitem(ll_new,"difer_caja",ldb_dif_caja)
								dw_lista.setitem(ll_new,"nota_cred",ldb_nota_cred)
								
		//						dw_lista.setitem(ll_new,"integrado",ldb_docto_integ)
								
								dw_lista.setitem(ll_new,"difer_montos",ldb_dif_real)
								dw_lista.setitem(ll_new,"diferencia_gnp",ldb_dif_gnp)
								dw_lista.setitem(ll_new,"monto_sap_s",ldb_debe_sap)
								dw_lista.setitem(ll_new,"monto_sap_h",ldb_haber_sap)
								dw_lista.setitem(ll_new,"diferencia_sap",ldb_dif_sap)
								dw_lista.setitem(ll_new,"diferencia_integrado",ldb_dif_integ)
								dw_lista.setitem(ll_new,"sociedad",ls_sociedad)
								dw_lista.accepttext()
								
							end if
							setnull(ls_cod_caja);setnull(ldt_fec_pago)
							if ldb_tot_porc <> ldb_tot_porc_aux then 
								st_porc.text								= string(ldb_tot_porc,'#0.##')+" %"
								ldb_tot_porc_aux						= ldb_tot_porc
							end if
							ldb_tot_porc									= (ll_new / ll_tot_reg) * 100
							hpb_1.Position 								= ldb_tot_porc
							ldb_debe_sap								= 0
							ldb_haber_sap								= 0
							dw_lista.accepttext()
						LOOP
					end if
					if rb_todas.checked = true then
						if ls_sociedad = 'CL04' then
							close x1;
						else
							close x3;
						end if
					elseif rb_caja.checked = true then
						if ls_sociedad = 'CL04' then
							close x2;
						else
							close x4;
						end if
					end if
					st_fondo.visible										= false
					hpb_1.visible										= false
					st_porc.visible										= false
					SetPointer(Arrow!)
				end if
			end if
		end if
	end if
end if
end event

type p_fin from picture within w_sap_cuadratura_pagos
integer x = 2025
integer y = 116
integer width = 78
integer height = 80
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech,ls_caja,ls_descrip
datetime	ldt_fec_ini,ldt_fec_fin

dw_lista.reset()

if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text 		= Message.StringParm
	end if	
END IF
end event

type st_3 from statictext within w_sap_cuadratura_pagos
integer x = 1641
integer y = 40
integer width = 379
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_ini from picture within w_sap_cuadratura_pagos
integer x = 1541
integer y = 116
integer width = 78
integer height = 80
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()

if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_sap_cuadratura_pagos
event ue_keypress pbm_keydown
integer x = 1147
integer y = 116
integer width = 379
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()

end event

type st_4 from statictext within w_sap_cuadratura_pagos
integer x = 1147
integer y = 40
integer width = 379
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_sap_cuadratura_pagos
integer x = 1641
integer y = 112
integer width = 379
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()

end event

type cb_cerrar from commandbutton within w_sap_cuadratura_pagos
integer x = 3429
integer y = 2100
integer width = 329
integer height = 112
integer taborder = 140
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_sap_cuadratura_pagos)
end event

type gb_3 from groupbox within w_sap_cuadratura_pagos
integer x = 4731
integer y = 2060
integer width = 759
integer height = 152
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_sap_cuadratura_pagos
integer x = 2162
integer width = 987
integer height = 224
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

type gb_2 from groupbox within w_sap_cuadratura_pagos
integer x = 1125
integer width = 1006
integer height = 224
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_fondo from statictext within w_sap_cuadratura_pagos
boolean visible = false
integer x = 1193
integer y = 1036
integer width = 1431
integer height = 212
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_sap_cuadratura_pagos
integer x = 41
integer y = 236
integer width = 3717
integer height = 1828
integer taborder = 100
string title = "none"
string dataobject = "dwe_sap_cuadratura_pagos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	is_lista		= 'I'		
end if
end event

event doubleclicked;string	ls_cod_caja,ls_descrip,ls_sociedad,ls_descrip_soc
datetime	ldt_fec_pago

if isvalid(w_sap_detalle_pagos_caja_2) then
	if il_row>0 then
		ls_cod_caja		= dw_lista.getitemstring(il_row,'cod_caja')
		ldt_fec_pago	= dw_lista.getitemdatetime(il_row,'fecha_pago')
		ls_sociedad		= dw_lista.getitemstring(il_row,'sociedad')
		if not isnull(ls_cod_caja) and ls_cod_caja<>'' and not isnull(ldt_fec_pago) then
			//w_sap_detalle_pagos_caja_2.ddplb_caja.reset()
			
			
			SELECT 		"SAP_SOCIEDAD"."DESCRIPCION"
			INTO			:ls_descrip_soc
			FROM 		"SAP_SOCIEDAD"  
			WHERE 		"SAP_SOCIEDAD"."ESTADO" = 'V'  and
							"SAP_SOCIEDAD"."CODIGO" = :ls_sociedad
			USING		sqlca;
			if isnull(ls_descrip_soc) then ls_descrip_soc = ''
			
			SELECT DISTINCT	"CODIGO_CAJAS"."GLS_CAJA"
			into		:ls_descrip
			FROM 	"CODIGO_CAJAS"  
			WHERE	"CODIGO_CAJAS"."COD_CAJA" = :ls_cod_caja 
			USING	sqlca;
			if isnull(ls_descrip) then ls_descrip=''
			
			w_sap_detalle_pagos_caja_2.tab_1.tabpage_4.ddplb_sociedad.text 		= (ls_sociedad + ' - ' +ls_descrip_soc)
			w_sap_detalle_pagos_caja_2.tab_1.tabpage_4.ddplb_caja.text 			= (ls_cod_caja + ' - ' +ls_descrip)
			w_sap_detalle_pagos_caja_2.tab_1.tabpage_4.em_1.text 					= string(ldt_fec_pago,'dd/mm/yyyy')
		end if
	end if
end if


end event

type gb_4 from groupbox within w_sap_cuadratura_pagos
integer x = 1207
integer y = 2068
integer width = 965
integer height = 156
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

