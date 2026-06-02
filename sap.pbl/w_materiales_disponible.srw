forward
global type w_materiales_disponible from window
end type
type dw_lista from datawindow within w_materiales_disponible
end type
type cb_cerrar from commandbutton within w_materiales_disponible
end type
end forward

global type w_materiales_disponible from window
integer x = 832
integer y = 360
integer width = 2789
integer height = 1260
boolean titlebar = true
string title = "Disponibilidad Materiales SAP"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_lista dw_lista
cb_cerrar cb_cerrar
end type
global w_materiales_disponible w_materiales_disponible

type variables
long	il_row
end variables

on w_materiales_disponible.create
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.Control[]={this.dw_lista,&
this.cb_cerrar}
end on

on w_materiales_disponible.destroy
destroy(this.dw_lista)
destroy(this.cb_cerrar)
end on

event open;string ls_centro,ls_sociedad,ls_material,ls_anno,ls_tipo_material,ls_organiz
long	ll_cod_parque,ll_cantidad,ll_disponible,ll_new,ll_tot_reg
datetime	ldt_fec_ini,ldt_fec_fin

connect using Trans_1;
gf_centrar(w_materiales_disponible)
dw_lista.dataobject		= 'dwe_materiales_disponible'
dw_lista.settransobject(sqlca)


ls_tipo_material	= substr(1,1,Message.StringParm)
ldt_fec_ini			= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
ldt_fec_fin			= datetime(date(substr(1,3,Message.StringParm)),time('00:00:00'))


ls_anno				= string(year(date(ldt_fec_fin)))

if gs_conexion = "Parque El Prado" then
	ls_organiz		= 'SE02'
elseif gs_conexion = "Parque La Foresta" then
	ls_organiz		= 'SE03'
end if


if not isnull(ls_tipo_material) and ls_tipo_material<>'' then
	if ls_tipo_material	= 'SARCOFAGO' then
		DECLARE x1 CURSOR FOR
		SELECT		'SARCOFAGO_NORMAL',
						"INGRESO"."COD_PARQUE",   
						"VISTA_SAP_ESTRUCTURA_NEGOCIO"."CENTRO",   
						"VISTA_SAP_ESTRUCTURA_NEGOCIO"."SOCIEDAD",   
						count("INGRESO"."TIPO_MOV")
				
		FROM			"INGRESO","VISTA_SAP_ESTRUCTURA_NEGOCIO"  
		WHERE		"INGRESO"."COD_PARQUE" = "VISTA_SAP_ESTRUCTURA_NEGOCIO"."COD_PARQUE" and  
						"INGRESO"."TIPO_MOV" = 'M' AND  
						("INGRESO"."PAGO_HIST" = 'A' OR  "INGRESO"."PAGO_HIST" = 'N') AND  
						"INGRESO"."ESTADO_PAGO_SAP" = 99 AND
						"INGRESO"."ESTADO_SAP" <> 1 AND
						"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
						"INGRESO"."FECHA_PAGO" <=:ldt_fec_fin AND
						"VISTA_SAP_ESTRUCTURA_NEGOCIO"."ORGANIZ" = :ls_organiz AND  
						"VISTA_SAP_ESTRUCTURA_NEGOCIO"."DESCRIP_ALMACEN" = 'Sarcófagos'    
		GROUP BY	"INGRESO"."COD_PARQUE",   
						"VISTA_SAP_ESTRUCTURA_NEGOCIO"."CENTRO",   
						"VISTA_SAP_ESTRUCTURA_NEGOCIO"."SOCIEDAD"
		ORDER BY	"INGRESO"."COD_PARQUE"
		USING		sqlca;
	elseif ls_tipo_material	= 'UBS' then
		DECLARE x2 CURSOR FOR
		SELECT 		"SAP_CADENA"."CODIGO_MATERIAL_SAP",   
         				"FACTURA_OFERTA_INGRESO"."COD_PARQUE",   
         				"SAP_CADENA"."CENTRO",
						"VISTA_SAP_ESTRUCTURA_NEGOCIO"."SOCIEDAD",
						COUNT("SAP_CADENA"."CODIGO_MATERIAL_SAP")
    		FROM			"FACTURA_OFERTA_INGRESO","SAP_CADENA","SAP_FECHA_FACTURA","VISTA_SAP_ESTRUCTURA_NEGOCIO"  
  		WHERE		"FACTURA_OFERTA_INGRESO"."BASE" = "SAP_CADENA"."BASE" and  
         				"FACTURA_OFERTA_INGRESO"."SERIE" = "SAP_CADENA"."SERIE" and  
         				"FACTURA_OFERTA_INGRESO"."NUMERO" = "SAP_CADENA"."NUMERO" and  
         				"FACTURA_OFERTA_INGRESO"."ESTADO" = "SAP_FECHA_FACTURA"."ESTADO" and
						"FACTURA_OFERTA_INGRESO"."COD_PARQUE" = "VISTA_SAP_ESTRUCTURA_NEGOCIO"."COD_PARQUE" and  
		  				"FACTURA_OFERTA_INGRESO"."ESTADO" = 'N' AND  
         				"SAP_CADENA"."TIPO_DEUDA" = 'C' AND
						"SAP_CADENA"."ESTADO_SAP" <> 1 AND
						"VISTA_SAP_ESTRUCTURA_NEGOCIO"."ORGANIZ" = :ls_organiz AND  
						"VISTA_SAP_ESTRUCTURA_NEGOCIO"."DESCRIP_ALMACEN" = 'UBS' AND  
         				("FACTURA_OFERTA_INGRESO"."BASE" = 'C' OR "FACTURA_OFERTA_INGRESO"."BASE" = 'O')
		GROUP BY	"SAP_CADENA"."CODIGO_MATERIAL_SAP",   
         				"FACTURA_OFERTA_INGRESO"."COD_PARQUE",   
         				"SAP_CADENA"."CENTRO",
						"VISTA_SAP_ESTRUCTURA_NEGOCIO"."SOCIEDAD"
		ORDER BY	"SAP_CADENA"."CODIGO_MATERIAL_SAP",	
						"FACTURA_OFERTA_INGRESO"."COD_PARQUE"
		USING		sqlca;			
	end if
	if ls_tipo_material	= 'SARCOFAGO' then
		open x1;
	elseif ls_tipo_material	= 'UBS' then
		open x2;
	end if
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			if ls_tipo_material	= 'SARCOFAGO' then
				fetch x1 INTO :ls_material,:ll_cod_parque,:ls_centro,:ls_sociedad,:ll_cantidad;
			elseif ls_tipo_material	= 'UBS' then
				fetch x2 INTO :ls_material,:ll_cod_parque,:ls_centro,:ls_sociedad,:ll_cantidad;
			end if
			
			if not isnull (ls_material) and ls_material<>'' and not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_centro) and ls_centro<>'' and not isnull(ls_sociedad) and ls_sociedad<>'' then
				ll_disponible								= f_sap_material_sap(ls_centro,ls_anno,ls_material)
				ll_disponible								= ll_disponible + 0
				ll_new									= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_lista.setitem(ll_new,"centro",ls_centro)
				dw_lista.setitem(ll_new,"sociedad",ls_sociedad)
				dw_lista.setitem(ll_new,"material",ls_material)
				dw_lista.setitem(ll_new,"cantidad",ll_cantidad)
				dw_lista.setitem(ll_new,"disponible",ll_disponible)
				dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
				dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
				dw_lista.accepttext()
			end if
			setnull(ls_material);setnull(ll_cod_parque);setnull(ls_centro);setnull(ls_sociedad);setnull(ll_cantidad)
		LOOP
		ll_tot_reg										= dw_lista.rowcount()
		if ll_tot_reg=0 then
			close(w_materiales_disponible)
		end if
	end if
	
	if ls_tipo_material	= 'SARCOFAGO' then
		close x1;
	elseif ls_tipo_material	= 'UBS' then
		close x2;
	end if
end if
end event

event close;disconnect using Trans_1;
end event

type dw_lista from datawindow within w_materiales_disponible
integer x = 41
integer y = 68
integer width = 2697
integer height = 860
integer taborder = 50
string title = "none"
string dataobject = "dwe_materiales_disponible"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type cb_cerrar from commandbutton within w_materiales_disponible
integer x = 2510
integer y = 992
integer width = 251
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_materiales_disponible)
end event

