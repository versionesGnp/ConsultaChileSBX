forward
global type consulta_caja from window
end type
type cb_deposito from commandbutton within consulta_caja
end type
type ddlb_parque from dropdownlistbox within consulta_caja
end type
type st_5 from statictext within consulta_caja
end type
type dw_cajas from datawindow within consulta_caja
end type
type st_2 from statictext within consulta_caja
end type
type cb_3 from commandbutton within consulta_caja
end type
type st_1 from statictext within consulta_caja
end type
type em_1 from editmask within consulta_caja
end type
type cb_2 from commandbutton within consulta_caja
end type
type cb_1 from commandbutton within consulta_caja
end type
type cb_elim from commandbutton within consulta_caja
end type
type dw_1 from datawindow within consulta_caja
end type
end forward

global type consulta_caja from window
integer y = 436
integer width = 3694
integer height = 2400
boolean titlebar = true
string title = "Ventas Dia Caja"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_deposito cb_deposito
ddlb_parque ddlb_parque
st_5 st_5
dw_cajas dw_cajas
st_2 st_2
cb_3 cb_3
st_1 st_1
em_1 em_1
cb_2 cb_2
cb_1 cb_1
cb_elim cb_elim
dw_1 dw_1
end type
global consulta_caja consulta_caja

event open;LONG 		VER,er1,ll_codigo
string 	mod_string,texto_dw,rc,ls_descrip_parque,ls_parque
datawindowchild dw_tipo_doc,dw_tipo_total,dw_tipo_pago,dw_detalle_cheque
datetime fecha_aux

gf_centrar(consulta_caja)
DW_1.SETtRANSOBJECT(SQLCA)
fecha_aux				= datetime(today())
em_1.text 				= String(Today(), "dd/mm/yyyy")
if gs_depto='T' or gs_depto='I' or gs_depto='C' then
	dw_cajas.visible	= true
	dw_cajas.settransobject(sqlca)
	dw_cajas.insertrow(0)
	dw_cajas.setfocus()
else
	dw_cajas.visible	= false
	em_1.setfocus()
end if
ddlb_parque.reset()
DECLARE	x3 CURSOR FOR  
SELECT 	"COD_PARQ"."CODIGO",   
			"COD_PARQ"."NOMBRE"  
FROM 		"COD_PARQ"  
WHERE 	"COD_PARQ"."GRUPO" = 1 and "COD_PARQ"."CODIGO" <> 9999
USING		sqlca;
open x3;
DO WHILE sqlca.sqlcode=0
	fetch x3 into :ll_codigo, :ls_descrip_parque;
	if not isnull(ll_codigo) and ll_codigo>0 then
		ls_parque	= string(ll_codigo)+' - '+ls_descrip_parque
		ddlb_parque.additem(ls_parque)
	end if
	setnull(ll_codigo);setnull(ls_descrip_parque);setnull(ls_parque)
LOOP
close x3;
if gs_conexion	= "Parque El Prado" then
	ddlb_parque.additem('9999 - TODAS')
	ddlb_parque.text	= '9999 - TODAS'
end if
end event

on consulta_caja.create
this.cb_deposito=create cb_deposito
this.ddlb_parque=create ddlb_parque
this.st_5=create st_5
this.dw_cajas=create dw_cajas
this.st_2=create st_2
this.cb_3=create cb_3
this.st_1=create st_1
this.em_1=create em_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_elim=create cb_elim
this.dw_1=create dw_1
this.Control[]={this.cb_deposito,&
this.ddlb_parque,&
this.st_5,&
this.dw_cajas,&
this.st_2,&
this.cb_3,&
this.st_1,&
this.em_1,&
this.cb_2,&
this.cb_1,&
this.cb_elim,&
this.dw_1}
end on

on consulta_caja.destroy
destroy(this.cb_deposito)
destroy(this.ddlb_parque)
destroy(this.st_5)
destroy(this.dw_cajas)
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_elim)
destroy(this.dw_1)
end on

type cb_deposito from commandbutton within consulta_caja
integer x = 1531
integer y = 2132
integer width = 617
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingreso Depositos"
end type

event clicked;String		ls_caja,ls_cod_parque,ls_string
Date		ldt_fecha
Long		ll_pos,ll_cod_parque

if dw_cajas.visible= true then
	ls_caja			= dw_cajas.getitemstring(1,'caja')
else
	ls_caja			= gs_caja
end if
ldt_fecha				= date(em_1.text)
ll_pos					= pos(ddlb_parque.text,'-')
ls_cod_parque		= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
ll_cod_parque		= long(ls_cod_parque)
ls_string			    	= ls_caja+'~t'+string(ldt_fecha,'dd/mm/yyyy')+'~t'+string(ll_cod_parque)
Select sysdate into :gdt_fec_sistema from dual;

if not isnull(ls_string) then
	if isvalid(w_ingreso_boletas_depositos) then close(w_ingreso_boletas_depositos)
	OpenWithParm(w_ingreso_boletas_depositos,ls_string)
else
	messagebox("Advertencia","Falta Seleccionar datos")
end if
end event

type ddlb_parque from dropdownlistbox within consulta_caja
integer x = 2574
integer y = 44
integer width = 590
integer height = 376
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//Long		ll_pos,ll_cod_parque
//String	ls_cod_parque
//ll_pos					= pos(ddlb_parque.text,'-')
//ls_cod_parque			= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
//ll_cod_parque			= long(ls_cod_parque)
dw_1.reset()
end event

type st_5 from statictext within consulta_caja
integer x = 2368
integer y = 52
integer width = 192
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_cajas from datawindow within consulta_caja
integer x = 960
integer y = 40
integer width = 489
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_de_cajas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_caja
dw_1.reset()
ls_caja							= dw_cajas.getitemstring(1,'caja')
DW_1.OBJECT.NRO_CAJA.TEXT	= ls_caja
end event

type st_2 from statictext within consulta_caja
integer x = 37
integer y = 28
integer width = 855
integer height = 120
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Cuadratura de Caja Diaria"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within consulta_caja
integer x = 3273
integer y = 36
integer width = 370
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&onsultar"
end type

event clicked;long 		ver,ll_pos,ll_cod_parque,ll_count_reg
DATE 		MIAR
STRING 	ls_cod_parque,ls_caja,COMPA

MIAR 												= DATE(EM_1.TEXT)
if dw_cajas.visible= true then
	ls_caja										= dw_cajas.getitemstring(1,'caja')
	ll_pos											= pos(ddlb_parque.text,'-')
	ls_cod_parque								= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
	ll_cod_parque								= long(ls_cod_parque)
	if ll_cod_parque=1 then
		COMPA									= 'O'
	elseif ll_cod_parque=102 then
		COMPA									= 'M'
	elseif ll_cod_parque=11 then
		COMPA									= 'F'
	elseif ll_cod_parque=103 then
		COMPA									= 'S'
	elseif ll_cod_parque=801 then
		COMPA									= 'C'
	end if
	if not isnull(ls_caja) and ll_cod_parque>0 then
		if ll_cod_parque=9999 or ll_cod_parque=11 or ll_cod_parque=103 then
			dw_1.dataobject					= 'dw_muestra'
		else
			dw_1.dataobject					= 'dw_muestra_parque'
		end if
		dw_1.settransobject(sqlca)
		VER										= DW_1.RETRIEVE(compa,ls_caja, miar,'99',ll_cod_parque)
		DW_1.OBJECT.NRO_CAJA.TEXT	= ls_caja
		SELECT 	Count("SAP_BOLETA_DEPOSITO"."COD_CAJA")
		INTO 		:ll_count_reg  
		FROM 	"SAP_BOLETA_DEPOSITO"  
		WHERE ( "SAP_BOLETA_DEPOSITO"."COD_CAJA" = :ls_caja ) AND  
				  ( "SAP_BOLETA_DEPOSITO"."FECHA_PAGO" = :miar )   ;
		if ll_count_reg > 0 then
			cb_deposito.italic					= True
		else
			cb_deposito.italic					= False
		end if
	else
		if isnull(ls_caja) then
			messagebox("Advertencia","Debe Seleccionar CAJA")
			dw_cajas.setfocus()
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia","Debe Seleccionar Parque")
			ddlb_parque.setfocus()
		end if
	end if
else
	ll_pos											= pos(ddlb_parque.text,'-')
	ls_cod_parque								= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
	ll_cod_parque								= long(ls_cod_parque)
	if ll_cod_parque=1 then
		COMPA									= 'O'
	elseif ll_cod_parque=102 then
		COMPA									= 'M'
	elseif ll_cod_parque=11 then
		COMPA									= 'F'
	elseif ll_cod_parque=103 then
		COMPA									= 'S'
	elseif ll_cod_parque=801 then
		COMPA									= 'C'
	end if
	if not isnull(gs_caja) and ll_cod_parque>0 then
		if ll_cod_parque=9999 then
			dw_1.dataobject					= 'dw_muestra'
		else
			dw_1.dataobject					= 'dw_muestra_parque'
		end if
		dw_1.settransobject(sqlca)
		VER										= DW_1.RETRIEVE(compa,gs_caja, miar,'99',ll_cod_parque)
		DW_1.OBJECT.NRO_CAJA.TEXT	= GS_CAJA
	else
		if isnull(gs_caja) then
			messagebox("Advertencia","CAJA Inválida")
			dw_cajas.setfocus()
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia","Debe Seleccionar Parque")
			ddlb_parque.setfocus()
		end if
	end if
end if
IF VER < 1 THEN
	MESSAGEBOX("Informacion","No Existen Pagos")
	dw_1.enabled								= false
	return
end if

end event

type st_1 from statictext within consulta_caja
integer x = 1490
integer y = 52
integer width = 366
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha de Caja :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_1 from editmask within consulta_caja
integer x = 1865
integer y = 40
integer width = 439
integer height = 96
integer taborder = 20
integer textsize = -10
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
boolean autoskip = true
boolean spin = true
string displaydata = "~b"
double increment = 1
end type

event modified;dw_1.reset()
end event

type cb_2 from commandbutton within consulta_caja
integer x = 3269
integer y = 2132
integer width = 375
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

on clicked;close(parent)
end on

type cb_1 from commandbutton within consulta_caja
integer x = 32
integer y = 2132
integer width = 375
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;String		ls_caja,ls_sociedad
Date		ldt_fecha
Long		ll_count_caja,ll_monto_ef_nofun,ll_monto_ch_nofun,ll_count_ch_nofun,ll_monto_ef_sifun,ll_monto_ch_sifun,ll_count_ch_sifun,&
			ll_bol_ef_nofun,ll_bol_ch_nofun,ll_bol_ef_sifun,ll_bol_ch_sifun

ls_caja				= dw_cajas.getitemstring(1,'caja')
ldt_fecha				= date(em_1.text)
if gs_conexion	= "Parque El Prado" then
	ls_sociedad		= 'CL02'
else
	ls_sociedad		= 'CL03'
end if
SELECT 	Count("CODIGO_CAJAS"."COD_CAJA")
INTO 		:ll_count_caja  
FROM 	"CODIGO_CAJAS"  
WHERE 	( "CODIGO_CAJAS"."EFECTO_FLUJO" = 'S' ) AND  
			( "CODIGO_CAJAS"."TIPO_CAJA" = 'P' ) AND  
			( "CODIGO_CAJAS"."COD_CAJA" = :ls_caja )   ;
if ll_count_caja > 0 then
//	if ls_sociedad <> 'CL04' then
		SELECT	SUM( "DOCUMENTOS"."MONTO" )
		INTO		:ll_monto_ef_nofun
		FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."COD_PAGO" = 'EF' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
					"DOCUMENTOS"."COD_CAJA" = :ls_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha AND
				 (( "DOCUMENTOS"."TIPO_COB" = 'BE' OR "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "DOCUMENTOS"."TIPO_COB" = 'FE') and "DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ) ;
//				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI' ) ;



//		SELECT	SUM( "DOCUMENTOS"."MONTO" )
//		INTO		:ll_monto_ef_nofun
//		FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
//		WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
//					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
//					"DOCUMENTOS"."COD_PAGO" = 'EF' AND
//					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
//					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
//					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
////					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
//					"DOCUMENTOS"."COD_CAJA" = :ls_caja AND
//					"DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha AND
//				 (( "DOCUMENTOS"."TIPO_COB" = 'BE' OR "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "DOCUMENTOS"."TIPO_COB" = 'FE') and "DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ) ;
////				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI' ) ;
//
//		SELECT	SUM( "DOCUMENTOS"."MONTO" )
//		INTO		:ll_monto_ef_nofun
//		FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
//		WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
//					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
//					"DOCUMENTOS"."COD_PAGO" = 'EF' AND
//					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
//					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
//					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"DOCUMENTOS"."COD_CAJA" = :ls_caja AND
//					"DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha AND
//					(( "DOCUMENTOS"."TIPO_COB" = 'BE' OR "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "DOCUMENTOS"."TIPO_COB" = 'FE') and "DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ) ;
				 // (( "DOCUMENTOS"."TIPO_COB" = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'BE' OR "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "DOCUMENTOS"."TIPO_COB" = 'FE') and "DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ) ;
//		tab_1.tabpage_1.st_total_efectivo.text	= 'Total Ingreso Efectivo $ '+string(il_monto_ef,'###,###,###,###,##0')
		
		
		SELECT	SUM( "DOCUMENTOS"."MONTO" )
		INTO		:ll_monto_ch_nofun
		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
					"DOCUMENTOS"."COD_CAJA" = :ls_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha AND
				  (( "DOCUMENTOS"."TIPO_COB" = 'BE' OR "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "DOCUMENTOS"."TIPO_COB" = 'FE') and "DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ) ;
//				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI' );
		
		
		
//		SELECT	SUM( "DOCUMENTOS"."MONTO" )
//		INTO		:ll_monto_ch_nofun
//		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
//		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
//					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
//					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
//					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
//					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
//					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
//					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
////					"VISTA_SAP_FOLIOS_CAJA"."BASE" <> 'F' AND
//					"DOCUMENTOS"."COD_CAJA" = :ls_caja AND
//					"DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha AND
//				  (( "DOCUMENTOS"."TIPO_COB" = 'BE' OR "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "DOCUMENTOS"."TIPO_COB" = 'FE') and "DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ) ;
////				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BE' OR "DOCUMENTOS"."TIPO_COB_AUX" = 'CI' );
		
		
//		SELECT	SUM( "DOCUMENTOS"."MONTO" )
//		INTO		:ll_monto_ch_nofun
//		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
//		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
//					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
//					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
//					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
//					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
//					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
//					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"DOCUMENTOS"."COD_CAJA" = :ls_caja AND
//					"DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha AND
//				  (( "DOCUMENTOS"."TIPO_COB" = 'BE' OR "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'CU' OR "DOCUMENTOS"."TIPO_COB" = 'BA' OR "DOCUMENTOS"."TIPO_COB" = 'FA' OR "DOCUMENTOS"."TIPO_COB" = 'FE') and "DOCUMENTOS"."TIPO_COB_AUX" <> 'BA' ) ;
		
//		tab_1.tabpage_2.st_total_cheque.text		= 'Total Ingreso Cheque al día $ '+string(il_monto_ch,'###,###,###,###,##0')
//	else


		SELECT	SUM( "DOCUMENTOS"."MONTO" )
		INTO		:ll_monto_ef_sifun
		FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."COD_PAGO" = 'EF' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
					"DOCUMENTOS"."COD_CAJA" = :ls_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha AND
				  (( "DOCUMENTOS"."TIPO_COB" = 'BA' or "DOCUMENTOS"."TIPO_COB" = 'FA' or "DOCUMENTOS"."TIPO_COB" = 'CU') and "DOCUMENTOS"."TIPO_COB_AUX" = 'BA') ;
//				 	("DOCUMENTOS"."TIPO_COB_AUX" = 'BA' or "DOCUMENTOS"."TIPO_COB_AUX" = 'FA' or "DOCUMENTOS"."TIPO_COB_AUX" = 'FE' or "VISTA_SAP_FOLIOS_CAJA"."BASE" = 'F') ;

//		SELECT	SUM( "DOCUMENTOS"."MONTO" )
//		INTO		:ll_monto_ef_sifun
//		FROM 	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
//		WHERE 	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
//					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
//					"DOCUMENTOS"."COD_PAGO" = 'EF' AND
//					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
//					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
//					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"DOCUMENTOS"."COD_CAJA" = :ls_caja AND
//					"DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha AND
//				  ( "DOCUMENTOS"."TIPO_COB_AUX" = 'BA') ;
//		tab_1.tabpage_1.st_total_efectivo.text	= 'Total Ingreso Efectivo $ '+string(il_monto_ef,'###,###,###,###,##0')
		
		SELECT	SUM( "DOCUMENTOS"."MONTO" )
		INTO		:ll_monto_ch_sifun
		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
					"DOCUMENTOS"."COD_CAJA" = :ls_caja AND
					"DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha AND
					(("DOCUMENTOS"."TIPO_COB" = 'BA' or "DOCUMENTOS"."TIPO_COB" = 'FA' or "DOCUMENTOS"."TIPO_COB" = 'CU')  and "DOCUMENTOS"."TIPO_COB_AUX" = 'BA') ;
		
		
		
//		SELECT	SUM( "DOCUMENTOS"."MONTO" )
//		INTO		:ll_monto_ch_sifun
//		FROM   	"DOCUMENTOS" , "CODIGO_CAJAS", "VISTA_SAP_FOLIOS_CAJA"
//		WHERE  	"DOCUMENTOS"."COD_CAJA" = "CODIGO_CAJAS"."COD_CAJA" AND
//					"CODIGO_CAJAS"."EFECTO_FLUJO" = 'S'  AND
//					"DOCUMENTOS"."FECHA_PAGO" >=  "DOCUMENTOS"."FECHA_VENC" AND
//					"DOCUMENTOS"."COD_PAGO" = 'CH' AND
//					"DOCUMENTOS"."TIPO_COB" = "VISTA_SAP_FOLIOS_CAJA"."TIPO_COB" AND
//					"DOCUMENTOS"."FOLIO" = "VISTA_SAP_FOLIOS_CAJA"."FOLIO" AND
//					"DOCUMENTOS"."FECHA_PAGO" = "VISTA_SAP_FOLIOS_CAJA"."FECHA_PAGO" AND
//					"DOCUMENTOS"."COD_CAJA" = :ls_caja AND
//					"DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha AND
//					("DOCUMENTOS"."TIPO_COB_AUX" = 'BA') ;
//				  (("DOCUMENTOS"."TIPO_COB" = 'CU' or "DOCUMENTOS"."TIPO_COB" = 'BA' or "DOCUMENTOS"."TIPO_COB" = 'FA') and "DOCUMENTOS"."TIPO_COB_AUX" = 'BA') ;
		
//		tab_1.tabpage_2.st_total_cheque.text		= 'Total Ingreso Cheque al día $ '+string(il_monto_ch,'###,###,###,###,##0')
		if isnull(ll_monto_ef_nofun) then ll_monto_ef_nofun=0
		if isnull(ll_monto_ch_nofun) then ll_monto_ch_nofun=0
		if isnull(ll_monto_ef_sifun) then ll_monto_ef_sifun=0
		if isnull(ll_monto_ch_sifun) then ll_monto_ch_sifun=0
		
		if ll_monto_ef_nofun > 0 then
			SELECT	sum( "SAP_BOLETA_DEPOSITO"."MONTO"  )
			INTO 		:ll_bol_ef_nofun  
			FROM 	"SAP_BOLETA_DEPOSITO"  
			WHERE ( "SAP_BOLETA_DEPOSITO"."COD_CAJA" = :ls_caja ) AND  
						( "SAP_BOLETA_DEPOSITO"."FECHA_PAGO" = :ldt_fecha ) AND  
						( "SAP_BOLETA_DEPOSITO"."SOCIEDAD" = :ls_sociedad ) AND  
						( "SAP_BOLETA_DEPOSITO"."COD_PAGO" = 'EF' )   ;
			
		end if
		if ll_monto_ch_nofun > 0 then
			SELECT	SUM( "SAP_BOLETA_DEPOSITO"."MONTO"  )
			INTO 		:ll_bol_ch_nofun  
			FROM 	"SAP_BOLETA_DEPOSITO"  
			WHERE ( "SAP_BOLETA_DEPOSITO"."COD_CAJA" = :ls_caja ) AND  
						( "SAP_BOLETA_DEPOSITO"."FECHA_PAGO" = :ldt_fecha ) AND  
						( "SAP_BOLETA_DEPOSITO"."SOCIEDAD" = :ls_sociedad ) AND  
						( "SAP_BOLETA_DEPOSITO"."COD_PAGO" = 'CH' )   ;

		end if
		if ll_monto_ef_sifun > 0 then
			SELECT	SUM( "SAP_BOLETA_DEPOSITO"."MONTO"  )
			INTO 		:ll_bol_ef_sifun  
			FROM 	"SAP_BOLETA_DEPOSITO"  
			WHERE ( "SAP_BOLETA_DEPOSITO"."COD_CAJA" = :ls_caja ) AND  
						( "SAP_BOLETA_DEPOSITO"."FECHA_PAGO" = :ldt_fecha ) AND  
						( "SAP_BOLETA_DEPOSITO"."SOCIEDAD" = 'CL04' ) AND  
						( "SAP_BOLETA_DEPOSITO"."COD_PAGO" = 'EF' )   ;
			
		end if
		
		if ll_monto_ch_sifun > 0 then
			SELECT	SUM( "SAP_BOLETA_DEPOSITO"."MONTO"  )
			INTO 		:ll_bol_ch_sifun  
			FROM 	"SAP_BOLETA_DEPOSITO"  
			WHERE ( "SAP_BOLETA_DEPOSITO"."COD_CAJA" = :ls_caja ) AND  
						( "SAP_BOLETA_DEPOSITO"."FECHA_PAGO" = :ldt_fecha ) AND  
						( "SAP_BOLETA_DEPOSITO"."SOCIEDAD" = 'CL04' ) AND  
						( "SAP_BOLETA_DEPOSITO"."COD_PAGO" = 'CH' )   ;
			
		end if
		if isnull(ll_bol_ef_sifun) then ll_bol_ef_sifun=0
		if isnull(ll_bol_ef_nofun) then ll_bol_ef_nofun=0
		if isnull(ll_bol_ef_nofun) then ll_bol_ef_nofun=0
		if isnull(ll_bol_ch_sifun) then ll_bol_ch_sifun=0
		if ll_monto_ef_nofun <> ll_bol_ef_nofun then
			if  ll_monto_ef_nofun <> ll_bol_ef_nofun and ll_bol_ef_nofun > 0 then
				messagebox("Advertencia","Existe Diferencia Montos en Ingreso de Boleta Deposito Efectivo Inmobiliaria")
			else
				messagebox("Advertencia","Debe Ingresar Boleta Deposito Efectivo Inmobiliaria")
			end if
		elseif ll_monto_ch_nofun <> ll_bol_ch_nofun then
			if ll_monto_ch_nofun <> ll_bol_ch_nofun and ll_bol_ch_nofun > 0 then
				messagebox("Advertencia","Existe Diferencia Montos en Ingreso de Boleta Deposito Cheques al día Inmobiliaria")
			else
				messagebox("Advertencia","Debe Ingresar Boleta Deposito Cheques al día Inmobiliaria")
			end if
		elseif ll_monto_ef_sifun <> ll_bol_ef_sifun then
			if ll_monto_ef_sifun <> ll_bol_ef_sifun and ll_bol_ef_sifun > 0  then
				messagebox("Advertencia","Existe Diferencia Montos en Ingreso de Boleta Deposito Efectivo Funeraria")
			else
				messagebox("Advertencia","Debe Ingresar Boleta Deposito Efectivo Funeraria")
			end if
		elseif ll_monto_ch_sifun <> ll_bol_ch_sifun then
			if ll_monto_ch_sifun <> ll_bol_ch_sifun and ll_bol_ch_sifun > 0 then
				messagebox("Advertencia","Existe Diferencia Montos en Ingreso de Boleta Deposito Cheques al día Funeraria")
			else
				messagebox("Advertencia","Debe Ingresar Boleta Deposito Cheques al día Funeraria")
			end if
		else
			if dw_1.rowcount() > 0 then 
				printsetup()
				dw_1.print()
			end if
		end if
//	end if
//end if
else
	if dw_1.rowcount() > 0 then 
		printsetup()
		dw_1.print()
	end if//	f_printdlg(dw_1,gstr_print,consulta_caja)
end if
end event

type cb_elim from commandbutton within consulta_caja
boolean visible = false
integer x = 2249
integer y = 944
integer width = 265
integer height = 124
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Elimina"
boolean cancel = true
end type

on clicked;int ver
dw_1.deleterow(dw_1.getrow())
ver=dw_1.update()
if ver < 1 then
	messagebox("","ok")
	rollback using sqlca;
else
	commit;
end if
end on

type dw_1 from datawindow within consulta_caja
integer x = 32
integer y = 184
integer width = 3611
integer height = 1908
integer taborder = 50
string dataobject = "dw_muestra"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

