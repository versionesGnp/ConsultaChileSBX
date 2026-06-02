forward
global type w_cuadra_boleta_depos from window
end type
type dw_boleta from datawindow within w_cuadra_boleta_depos
end type
type dw_lista from datawindow within w_cuadra_boleta_depos
end type
type cb_cerrar from commandbutton within w_cuadra_boleta_depos
end type
end forward

global type w_cuadra_boleta_depos from window
integer x = 832
integer y = 360
integer width = 2574
integer height = 2228
boolean titlebar = true
string title = "Cuadratura Documentos - Boletas Deposito"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_boleta dw_boleta
dw_lista dw_lista
cb_cerrar cb_cerrar
end type
global w_cuadra_boleta_depos w_cuadra_boleta_depos

type variables
long	il_row
end variables

on w_cuadra_boleta_depos.create
this.dw_boleta=create dw_boleta
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.Control[]={this.dw_boleta,&
this.dw_lista,&
this.cb_cerrar}
end on

on w_cuadra_boleta_depos.destroy
destroy(this.dw_boleta)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
end on

event open;string		ls_sociedad,ls_cod_caja,ls_cod_pago,ls_tipo_ch
long		ll_new,ll_tot_reg,ll_orden
datetime	ldt_fecha
double	ldb_monto,ldb_mto_bol,dif_monto,ldb_descto

connect using Trans_1;
gf_centrar(w_cuadra_boleta_depos)
dw_lista.dataobject		= 'dwe_sap_cuadra_boletas_depos'
dw_lista.settransobject(sqlca)

dw_boleta.dataobject		= 'dw_sap_cuadra_boletas_depos'
dw_boleta.settransobject(sqlca)

ls_cod_caja			= substr(1,1,Message.StringParm)
ldt_fecha				= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
ls_sociedad			= substr(1,3,Message.StringParm)


if not isnull(ls_sociedad) and ls_sociedad<>'' and not isnull(ls_cod_caja) and ls_cod_caja<>'' and not isnull(ldt_fecha) then
	DECLARE x1 CURSOR FOR
	SELECT	1,'EF', SUM(DOCUMENTOS.MONTO_UF) ,'' 
   	FROM  	DOCUMENTOS,SAP_SOCIEDAD
   	WHERE	DOCUMENTOS.FECHA_DEPOSITO = :ldt_fecha and
				DOCUMENTOS.COD_CAJA = :ls_cod_caja AND
				
				SAP_SOCIEDAD.CODIGO = F_SOCIEDAD_TIPO_COB("DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO") AND
				SAP_SOCIEDAD.CODIGO = :ls_sociedad AND
   	        		SAP_SOCIEDAD.ESTADO = 'V' AND  
     	        	DOCUMENTOS.COD_PAGO = 'EF'
              
   	UNION
    	SELECT	2,'CH', SUM(DOCUMENTOS.MONTO_UF) ,'1'
    	FROM     DOCUMENTOS,SAP_SOCIEDAD
    	WHERE   DOCUMENTOS.FECHA_PAGO >= DOCUMENTOS.FECHA_VENC AND
              	DOCUMENTOS.FECHA_DEPOSITO = :ldt_fecha and
              	DOCUMENTOS.COD_CAJA = :ls_cod_caja AND
              	SAP_SOCIEDAD.CODIGO = F_SOCIEDAD_TIPO_COB("DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO") AND
				SAP_SOCIEDAD.CODIGO = :ls_sociedad AND
              	DOCUMENTOS.COD_PAGO = 'CH'
					  
	UNION
    	SELECT	3,'CH', SUM(DOCUMENTOS.MONTO_UF) ,'2'
    	FROM     DOCUMENTOS,SAP_SOCIEDAD
    	WHERE   DOCUMENTOS.FECHA_PAGO < DOCUMENTOS.FECHA_VENC AND
              	DOCUMENTOS.FECHA_DEPOSITO = :ldt_fecha and
              	DOCUMENTOS.COD_CAJA = :ls_cod_caja AND
              	SAP_SOCIEDAD.CODIGO = F_SOCIEDAD_TIPO_COB("DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO") AND
				SAP_SOCIEDAD.CODIGO = :ls_sociedad AND
              	DOCUMENTOS.COD_PAGO = 'CH'
	
	UNION
	SELECT	4,'TD', SUM(DOCUMENTOS.MONTO_UF) ,''
    	FROM     DOCUMENTOS,SAP_SOCIEDAD
    	WHERE   DOCUMENTOS.FECHA_DEPOSITO = :ldt_fecha and
              	DOCUMENTOS.COD_CAJA = :ls_cod_caja AND
              	SAP_SOCIEDAD.CODIGO = F_SOCIEDAD_TIPO_COB("DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO") AND
				SAP_SOCIEDAD.CODIGO = :ls_sociedad AND
              	DOCUMENTOS.COD_PAGO = 'TD'	
	
	UNION
	SELECT	5,'TC', SUM(DOCUMENTOS.MONTO_UF) ,''
    	FROM     DOCUMENTOS,SAP_SOCIEDAD
    	WHERE   DOCUMENTOS.FECHA_DEPOSITO = :ldt_fecha and
              	DOCUMENTOS.COD_CAJA = :ls_cod_caja AND
              	SAP_SOCIEDAD.CODIGO = F_SOCIEDAD_TIPO_COB("DOCUMENTOS"."TIPO_COB","DOCUMENTOS"."FOLIO","DOCUMENTOS"."FECHA_DEPOSITO") AND
				SAP_SOCIEDAD.CODIGO = :ls_sociedad AND
              	DOCUMENTOS.COD_PAGO = 'TC'
					  
	ORDER BY	1				  
	USING	Trans_1;
	open x1;
	if Trans_1.sqlcode=0 then
		DO WHILE Trans_1.sqlcode=0
			fetch x1 INTO :ll_orden,:ls_cod_pago,:ldb_monto,:ls_tipo_ch;
			
			if not isnull (ls_cod_pago) and ls_cod_pago<>'' and not isnull(ldb_monto) and ldb_monto>0  then
				if (ls_cod_pago='EF' or (ls_cod_pago='CH' and ls_tipo_ch='1') )  then
					SELECT	SUM("MONTO")
					INTO		:ldb_mto_bol
					 FROM	"SAP_BOLETA_DEPOSITO"
					 WHERE	"SAP_BOLETA_DEPOSITO"."COD_PAGO" = :ls_cod_pago AND  
								"SAP_BOLETA_DEPOSITO"."FECHA_PAGO" = :ldt_fecha AND  
								"SAP_BOLETA_DEPOSITO"."COD_CAJA" = :ls_cod_caja  AND
								"SAP_BOLETA_DEPOSITO"."SOCIEDAD" = :ls_sociedad
					USING	sqlca;
					if isnull(ldb_mto_bol) then ldb_mto_bol=0
					dif_monto								= 	ldb_monto - ldb_mto_bol	
				else
					ldb_mto_bol								= 0
					dif_monto								= 0
				end if
				
				
				SELECT	SUM ("INGRESO"."MONTO" * -1)
				INTO		:ldb_descto
				FROM		"INGRESO","SAP_SOCIEDAD"  
				WHERE	"INGRESO"."FECHA_PAGO" = :ldt_fecha AND  
							"INGRESO"."COD_CAJA" = :ls_cod_caja AND  
							"INGRESO"."TIPO_MOV" = 'S' AND
							SAP_SOCIEDAD.CODIGO = F_SOCIEDAD_TIPO_COB("INGRESO"."TIPO_COB","INGRESO"."FOLIO","INGRESO"."FECHA_DEPOSITO") AND
							SAP_SOCIEDAD.CODIGO = :ls_sociedad
				USING	sqlca;
				
				ll_new									= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"sociedad",ls_sociedad)
				dw_lista.setitem(ll_new,"fecha",ldt_fecha)
				dw_lista.setitem(ll_new,"caja",ls_cod_caja)
				dw_lista.setitem(ll_new,"cod_pago",ls_cod_pago)
				dw_lista.setitem(ll_new,"tipo_cheque",ls_tipo_ch)
				dw_lista.setitem(ll_new,"monto",ldb_monto)
				dw_lista.setitem(ll_new,"monto_bol",ldb_mto_bol)
				dw_lista.setitem(ll_new,"dif_monto",dif_monto)
				dw_lista.setitem(ll_new,"descto",ldb_descto)
				dw_lista.accepttext()
			end if
			setnull(ls_cod_pago);setnull(ldb_monto)
		LOOP
	end if
	close x1;
	
	ll_tot_reg				= dw_boleta.retrieve(ls_cod_caja,ldt_fecha,ls_sociedad) 	
	if ll_tot_reg=0 then
		messagebox("Advertencia","No registra Boletas de Deposito")
	end if
end if
end event

event close;disconnect using Trans_1;
end event

type dw_boleta from datawindow within w_cuadra_boleta_depos
integer x = 37
integer y = 740
integer width = 2478
integer height = 1188
integer taborder = 60
string title = "none"
string dataobject = "dw_sap_cuadra_boletas_depos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_lista from datawindow within w_cuadra_boleta_depos
integer x = 37
integer y = 28
integer width = 2478
integer height = 696
integer taborder = 50
string title = "none"
string dataobject = "dwe_sap_cuadra_boletas_depos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type cb_cerrar from commandbutton within w_cuadra_boleta_depos
integer x = 2181
integer y = 1952
integer width = 334
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;disconnect using Trans_1;
close(w_cuadra_boleta_depos)
end event

