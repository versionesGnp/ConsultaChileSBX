forward
global type w_procesos_cartas from window
end type
type dw_1 from uo_datawindow within w_procesos_cartas
end type
type uo_1 from uo_registros within w_procesos_cartas
end type
type st_2 from statictext within w_procesos_cartas
end type
type st_1 from statictext within w_procesos_cartas
end type
type ddlb_2 from dropdownlistbox within w_procesos_cartas
end type
type ddlb_1 from dropdownlistbox within w_procesos_cartas
end type
type cb_2 from commandbutton within w_procesos_cartas
end type
type cb_1 from commandbutton within w_procesos_cartas
end type
type gb_1 from groupbox within w_procesos_cartas
end type
end forward

global type w_procesos_cartas from window
integer width = 3822
integer height = 2440
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
event posevent pbm_custom01
dw_1 dw_1
uo_1 uo_1
st_2 st_2
st_1 st_1
ddlb_2 ddlb_2
ddlb_1 ddlb_1
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_procesos_cartas w_procesos_cartas

type variables
Date	idt_fecha_hoy
end variables

event posevent;//string sql
//
//dw_1.settransobject(sqlca)
//this.x = ( gl_width - this.width)/2
//this.y = ( gl_height - this.height)/2
//sql = "SELECT distinct CARTA_ACCION.ESTADO ||' - '|| CARTA_ACCION.GLOSA  as accion FROM CARTA_ACCION"
//f_ddlb_all_accion(ddlb_1,sql,'1')
//ddlb_1.SelectItem(1)
//ddlb_2.SelectItem(1)
//ddlb_1.triggerevent (selectionchanged!)
//ddlb_2.triggerevent (selectionchanged!)
end event

on w_procesos_cartas.create
this.dw_1=create dw_1
this.uo_1=create uo_1
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.uo_1,&
this.st_2,&
this.st_1,&
this.ddlb_2,&
this.ddlb_1,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_procesos_cartas.destroy
destroy(this.dw_1)
destroy(this.uo_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;string sql

idt_fecha_hoy	= date(gdt_fec_sistema)
dw_1.settransobject(sqlca)
gf_centrar(w_procesos_cartas)
sql = "SELECT distinct CARTA_ACCION.ESTADO ||' - '|| CARTA_ACCION.GLOSA  as accion FROM CARTA_ACCION"
f_ddlb_all_accion(ddlb_1,sql,'1')
ddlb_1.AddItem('[ Ninguno ]')
ddlb_1.SelectItem(ddlb_1.TotalItems())
ddlb_2.SelectItem(1)
ddlb_1.triggerevent (selectionchanged!)
ddlb_2.triggerevent (selectionchanged!)
end event

type dw_1 from uo_datawindow within w_procesos_cartas
integer x = 55
integer y = 336
integer width = 3703
integer height = 1828
integer taborder = 30
string dataobject = "dw_procesos_de_cartas"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;MenuHabilitado= '1011001'
end event

event rowfocuschanged;call super::rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)
end event

event doubleclicked;call super::doubleclicked;gi_numero 			= dw_1.getitemnumber(dw_1.getrow(),'carta_log_numero')
gi_tipo_busqueda 	= 8
Open(w_listado_contratos)
end event

type uo_1 from uo_registros within w_procesos_cartas
boolean visible = false
integer x = 1289
integer y = 972
integer taborder = 20
end type

on uo_1.destroy
call uo_registros::destroy
end on

type st_2 from statictext within w_procesos_cartas
integer x = 1070
integer y = 96
integer width = 677
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Clasificación"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_1 from statictext within w_procesos_cartas
integer x = 96
integer y = 96
integer width = 933
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Código Acción"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_procesos_cartas
integer x = 1070
integer y = 176
integer width = 677
integer height = 876
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;date     fecha
datetime fecha_fact,FECHA_PRIM,FECHA_M
string   glosa_1,glosa_2,carta_log_base,carta_log_serie,moneda,estado,descripcion
integer  largo,MORA,NRO_CUOTAS
double   cta_pag_s,cta_pag_m,valor_cta_m,valor_cta,valor_uf,mora_cta_fact,monto_mora_fact,carta_log_numero
long 	   carta_log_rut,carta_log_mora,monto_mora_cred_carta,&
		   carta_log_mora_mant,monto_mora_mant_carta,mora_cred_fact,monto_mora_mant_fact,&
			mora_cred_actual,monto_mora_cred_actual,mora_mant_actual,monto_mora_mant_actual,i

fecha = idt_fecha_hoy
SELECT DISTINCT max("FACTURA_OFERTA"."FECHA_CIERRE") INTO :fecha_fact FROM "FACTURA_OFERTA"  ;
if dw_1.retrieve(mid(ddlb_1.text,1,1),trim(ddlb_2.text),date(fecha_fact),fecha) > 0 then
	uo_1.visible = true
	uo_1.hpb_1.minposition = 0
	uo_1.hpb_1.maxposition = dw_1.rowcount()
	SELECT DISTINCT "PROCESO_CARTA"."GLOSA_REG","PROCESO_CARTA"."GLOSA_REG_REPROG","PROCESO_CARTA"."DESCRIPCION"  
	INTO :glosa_1, :glosa_2, :descripcion
	FROM "PROCESO_CARTA"  
	WHERE "PROCESO_CARTA"."CLASIFICACION" = :ddlb_2.text ;
	largo = len( trim( glosa_1 ) )
	if isnull( glosa_1 ) and isnull( glosa_2 ) then
//		mle_1.text = 'No Existe Información'
//		mle_2.text = 'No Existe Información'
//		mle_3.text = 'No Existe Información'
		dw_1.object.titulo_5.text = 'No Existe Información'
		dw_1.object.titulo_4.text = 'No Existe Información'
		dw_1.object.titulo_3.text = 'No Existe Información'
	else
		dw_1.object.titulo_5.text = 'Acción a seguir pago Contado o Cheque: '+glosa_1
		dw_1.object.titulo_4.text = 'Acción a seguir si reprograma: '+glosa_2
		dw_1.object.titulo_3.text = 'Descripción: '+descripcion
//		mle_1.text = glosa_1
//		mle_2.text = glosa_2
//		mle_3.text = descripcion
	end if
	SELECT "TAB_UF"."VALOR_UF" INTO :valor_uf FROM "TAB_UF" WHERE "TAB_UF"."FECHA_UF" = :fecha   ;
	for i = 1 to dw_1.rowcount()
		carta_log_base   = dw_1.getitemSTRING(i,'carta_log_base')
		carta_log_serie  = dw_1.getitemSTRING(i,'carta_log_serie')
		carta_log_numero = dw_1.getitemnumber(i,'carta_log_numero')
		carta_log_rut    = dw_1.getitemnumber(i,'carta_log_rut')
		if carta_log_base = 'O' or carta_log_base = 'C' then
		end if
		CHOOSE CASE carta_log_base
			CASE 'O'//Promesa*****************************************************************************
				SELECT "OFERTA_V"."CTA_PAG_S","OFERTA_V"."CTA_PAG_M","OFERTA_V"."VALOR_CUOTA_M",
						 "PAGO_OFERTA"."MONEDA","PAGO_OFERTA"."VALOR_CUOTA","PAGO_OFERTA"."FECHA_PRIM",
						 "PAGO_OFERTA"."NRO_CUOTAS","OFERTA_V"."FECHA_M"
				INTO :cta_pag_s,:cta_pag_m,:valor_cta_m,:moneda,:valor_cta,:FECHA_PRIM,:NRO_CUOTAS,:FECHA_M  
				FROM "OFERTA_V","PAGO_OFERTA"  
				WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						( "OFERTA_V"."SERIE" = :carta_log_serie AND "OFERTA_V"."NRO_OFERTA" = :carta_log_numero ) ;
				SELECT "CADENA"."ESTADO" INTO :estado  
				FROM "CADENA"  
				WHERE ( "CADENA"."CODIGO" = :carta_log_base ) AND ( "CADENA"."SERIE" = :carta_log_serie ) AND ( "CADENA"."NUMERO" = :carta_log_numero )   ;
				dw_1.setitem(i,'VALOR_CTA',valor_cta)
				dw_1.setitem(i,'MONEDA',INTEGER(moneda))
				if moneda = '1' then
					dw_1.setitem(i,'monto_mora_cred_carta',valor_cta*dw_1.getitemnumber(i,'carta_log_mora'))
					dw_1.setitem(i,'monto_mora_mant_carta',valor_cta_m*dw_1.getitemnumber(i,'carta_log_mora_mant'))
				else
					dw_1.setitem(i,'monto_mora_cred_carta',valor_cta   * dw_1.getitemnumber(i,'carta_log_mora')      * valor_uf)
					dw_1.setitem(i,'monto_mora_mant_carta',valor_cta_m * dw_1.getitemnumber(i,'carta_log_mora_mant') * valor_uf)
				end if
				mora = funcion_mora( fecha_prim , cta_pag_s , nro_cuotas,estado )
				if  mora <= 0 THEN
					mora = 0
				ELSE 
					if -daysafter(idt_fecha_hoy,funcion_venc( fecha_prim , cta_pag_s )) < 5 THEN
						mora = 0
					END IF
				END IF
				if moneda = '1' then
					dw_1.setitem(i,'mora_cred_actual',MORA)
					dw_1.setitem(i,'monto_mora_cred_actual',valor_cta * MORA)
				else
					dw_1.setitem(i,'mora_cred_actual',MORA)
					dw_1.setitem(i,'monto_mora_cred_actual',valor_cta * MORA * valor_uf)
				end if
				//---------------------------------------------------------------------------------------
				mora = f_mant(fecha_m   ,cta_pag_m)
				if mora <= 0 then
					mora = 0
				else
					if  -daysafter(idt_fecha_hoy,funcion_venc_ano( fecha_m  ,  cta_pag_m  )) <= 0 then
						mora = 0
					end if
				end if
				if moneda = '1' then
					dw_1.setitem(i,'mora_mant_actual',MORA)
					dw_1.setitem(i,'monto_mora_mant_actual',valor_cta_m * MORA)
				else
					dw_1.setitem(i,'mora_mant_actual',MORA)
					dw_1.setitem(i,'monto_mora_mant_actual',valor_cta_m * MORA * valor_uf)
				end if
				dw_1.setitem(i,'cta_pag_s',cta_pag_s)
				dw_1.setitem(i,'NRO_CUOTAS',NRO_CUOTAS)
				dw_1.setitem(i,'valor_cta_mant',valor_cta_m)
				dw_1.setitem(i,'ctas_periodo',f_ctas_pag_periodo( dw_1.getitemdatetime(i,'proceso_carta_fecha') , carta_log_base , carta_log_serie , carta_log_numero ))
				dw_1.setitem(i,'ctas_periodo_mant',f_ctas_pag_mant_periodo( dw_1.getitemdatetime(i,'proceso_carta_fecha') , carta_log_base , carta_log_serie , carta_log_numero ))
			CASE 'C'//Contrato I.S.A*****************************************************************************
				SELECT "CONTRATO"."CTA_PAG_LA"+"CONTRATO"."CTA_PAG_ISA" as cta_pag_s,"CONTRATO"."CTA_PAG_M",   
         	"CONTRATO"."VALOR_CUOTA_M","CONTRATO"."MONEDA","CONTRATO"."VALOR_CUO","CONTRATO"."FECHA_PRIM",   
         	"CONTRATO"."PLAZO","CONTRATO"."FECHA_M"  
				INTO :cta_pag_s,:cta_pag_m,:valor_cta_m,:moneda,:valor_cta,:FECHA_PRIM,:NRO_CUOTAS,:FECHA_M  
				FROM "CONTRATO"  
				WHERE ( "CONTRATO"."SERIE_C" = :carta_log_serie ) AND  
						( "CONTRATO"."NRO_CONTRATO" = :carta_log_numero )   ;
				SELECT "CADENA"."ESTADO" INTO :estado  
				FROM "CADENA"  
				WHERE ( "CADENA"."CODIGO" = :carta_log_base ) AND ( "CADENA"."SERIE" = :carta_log_serie ) AND ( "CADENA"."NUMERO" = :carta_log_numero )   ;
				dw_1.setitem(i,'VALOR_CTA',valor_cta)
				dw_1.setitem(i,'MONEDA',INTEGER(moneda))
				if moneda = '1' then
					dw_1.setitem(i,'monto_mora_cred_carta',valor_cta   * dw_1.getitemnumber(i,'carta_log_mora'))
					dw_1.setitem(i,'monto_mora_mant_carta',valor_cta_m * dw_1.getitemnumber(i,'carta_log_mora_mant'))
				else
					dw_1.setitem(i,'monto_mora_cred_carta',valor_cta   * dw_1.getitemnumber(i,'carta_log_mora')      * valor_uf)
					dw_1.setitem(i,'monto_mora_mant_carta',valor_cta_m * dw_1.getitemnumber(i,'carta_log_mora_mant') * valor_uf)
				end if
				mora = funcion_mora( fecha_prim , cta_pag_s , nro_cuotas, estado )
				if  mora <= 0 THEN
					mora = 0
				ELSE 
					if -daysafter(idt_fecha_hoy,funcion_venc( fecha_prim , cta_pag_s )) < 5 THEN
						mora = 0
					END IF
				END IF
				if moneda = '1' then
					dw_1.setitem(i,'mora_cred_actual',MORA)
					dw_1.setitem(i,'monto_mora_cred_actual',valor_cta * MORA)
				else
					dw_1.setitem(i,'mora_cred_actual',MORA)
					dw_1.setitem(i,'monto_mora_cred_actual',valor_cta * MORA * valor_uf)
				end if
				//---------------------------------------------------------------------------------------
				mora = f_mant(fecha_m   ,cta_pag_m)
				if mora <= 0 then
					mora = 0
				else
					if  -daysafter(idt_fecha_hoy,funcion_venc_ano( fecha_m  ,  cta_pag_m  )) <= 0 then
						mora = 0
					end if
				end if
				if moneda = '1' then
					dw_1.setitem(i,'mora_mant_actual',MORA)
					dw_1.setitem(i,'monto_mora_mant_actual',valor_cta_m * MORA)
				else
					dw_1.setitem(i,'mora_mant_actual',MORA)
					dw_1.setitem(i,'monto_mora_mant_actual',valor_cta_m * MORA * valor_uf)
				end if
				dw_1.setitem(i,'cta_pag_s',cta_pag_s)
				dw_1.setitem(i,'NRO_CUOTAS',NRO_CUOTAS)
				dw_1.setitem(i,'valor_cta_mant',valor_cta_m)
				dw_1.setitem(i,'ctas_periodo',f_ctas_pag_periodo( dw_1.getitemdatetime(i,'proceso_carta_fecha') , carta_log_base , carta_log_serie , carta_log_numero ))
				dw_1.setitem(i,'ctas_periodo_mant',f_ctas_pag_mant_periodo( dw_1.getitemdatetime(i,'proceso_carta_fecha') , carta_log_base , carta_log_serie , carta_log_numero ))
			CASE 'D'//Derecho Especial*****************************************************************************
				SELECT "DERECHO"."CTA_PAG_LA"+"DERECHO"."CTA_PAG_ISA" as CTA_PAG_S,"DERECHO"."VALOR_CUO",   
				       "DERECHO"."MONEDA","DERECHO"."FECHA_PRIM","DERECHO"."PLAZO"  
				INTO :cta_pag_s,:valor_cta,:moneda,:FECHA_PRIM,:NRO_CUOTAS   
				FROM "DERECHO"  
				WHERE ( "DERECHO"."SERIE_P" = :carta_log_serie ) AND ( "DERECHO"."NRO_PAGARE" = :carta_log_numero )   ;
				SELECT "CADENA"."ESTADO" INTO :estado  
				FROM "CADENA"  
				WHERE ( "CADENA"."CODIGO" = :carta_log_base ) AND ( "CADENA"."SERIE" = :carta_log_serie ) AND ( "CADENA"."NUMERO" = :carta_log_numero )   ;
				dw_1.setitem(i,'VALOR_CTA',valor_cta)
				dw_1.setitem(i,'MONEDA',INTEGER(moneda))
				if moneda = '1' then
					dw_1.setitem(i,'monto_mora_cred_carta',valor_cta*dw_1.getitemnumber(i,'carta_log_mora'))
				else
					dw_1.setitem(i,'monto_mora_cred_carta',valor_cta   * dw_1.getitemnumber(i,'carta_log_mora')      * valor_uf)
				end if
				mora = funcion_mora( fecha_prim , cta_pag_s , nro_cuotas, estado )
				if  mora <= 0 THEN
					mora = 0
				ELSE 
					if -daysafter(idt_fecha_hoy,funcion_venc( fecha_prim , cta_pag_s )) > 5 THEN
						mora = 0
					END IF
				END IF
				if moneda = '1' then
					dw_1.setitem(i,'mora_cred_actual',MORA)
					dw_1.setitem(i,'monto_mora_cred_actual',valor_cta * MORA)
				else
					dw_1.setitem(i,'mora_cred_actual',MORA)
					dw_1.setitem(i,'monto_mora_cred_actual',valor_cta * MORA * valor_uf)
				end if
				dw_1.setitem(i,'cta_pag_s',cta_pag_s)
				dw_1.setitem(i,'NRO_CUOTAS',NRO_CUOTAS)
				dw_1.setitem(i,'ctas_periodo',f_ctas_pag_periodo( dw_1.getitemdatetime(i,'proceso_carta_fecha') , carta_log_base , carta_log_serie , carta_log_numero ))
			CASE 'L'//Anexo Liberador*****************************************************************************
				SELECT "ANEXO_LIBERADOR"."CTA_PAG_M","PAGO_LIBERADOR"."VALOR_CUOTA","PAGO_LIBERADOR"."MONEDA",   
         	"PAGO_LIBERADOR"."FECHA_PRIM","PAGO_LIBERADOR"."NRO_CUOTAS"  
				INTO :cta_pag_s,:valor_cta,:moneda,:FECHA_PRIM,:NRO_CUOTAS  
				FROM "ANEXO_LIBERADOR","PAGO_LIBERADOR"  
				WHERE ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
						( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
						( ( "ANEXO_LIBERADOR"."SERIE_M" = :carta_log_serie ) AND  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :carta_log_numero ) )   ;
				SELECT "CADENA"."ESTADO" INTO :estado  
				FROM "CADENA"  
				WHERE ( "CADENA"."CODIGO" = :carta_log_base ) AND ( "CADENA"."SERIE" = :carta_log_serie ) AND ( "CADENA"."NUMERO" = :carta_log_numero )   ;
				dw_1.setitem(i,'VALOR_CTA',valor_cta)
				dw_1.setitem(i,'MONEDA',INTEGER(moneda))
				if moneda = '1' then
					dw_1.setitem(i,'monto_mora_cred_carta',valor_cta*dw_1.getitemnumber(i,'carta_log_mora'))
				else
					dw_1.setitem(i,'monto_mora_cred_carta',valor_cta   * dw_1.getitemnumber(i,'carta_log_mora')      * valor_uf)
				end if
				mora = funcion_mora( fecha_prim , cta_pag_s , nro_cuotas, estado )
				if  mora <= 0 THEN
					mora = 0
				ELSE 
					if -daysafter(idt_fecha_hoy,funcion_venc( fecha_prim , cta_pag_s )) < 5 THEN
						mora = 0
					END IF
				END IF
				if moneda = '1' then
					dw_1.setitem(i,'mora_cred_actual',MORA)
					dw_1.setitem(i,'monto_mora_cred_actual',valor_cta * MORA)
				else
					dw_1.setitem(i,'mora_cred_actual',MORA)
					dw_1.setitem(i,'monto_mora_cred_actual',valor_cta * MORA * valor_uf)
				end if
				dw_1.setitem(i,'cta_pag_s',cta_pag_s)
				dw_1.setitem(i,'NRO_CUOTAS',NRO_CUOTAS)
				dw_1.setitem(i,'ctas_periodo',f_ctas_pag_periodo( dw_1.getitemdatetime(i,'proceso_carta_fecha') , carta_log_base , carta_log_serie , carta_log_numero ))
			CASE 'P'//Pagare*****************************************************************************
				SELECT "PAGARE"."CTA_PAG_LA"+"PAGARE"."CTA_PAG_ISA" AS CTA_PAG_S,"PAGARE"."VALOR_CUO",   
				       "PAGARE"."MONEDA","PAGARE"."FECHA_PRIM","PAGARE"."PLAZO"  
				INTO :cta_pag_s,:valor_cta,:moneda,:FECHA_PRIM,:NRO_CUOTAS  
				FROM "PAGARE"  
				WHERE ( "PAGARE"."SERIE_P" = :carta_log_serie ) AND  
						( "PAGARE"."NRO_PAGARE" = :carta_log_numero )   ;
				SELECT "CADENA"."ESTADO" INTO :estado  
				FROM "CADENA"  
				WHERE ( "CADENA"."CODIGO" = :carta_log_base ) AND ( "CADENA"."SERIE" = :carta_log_serie ) AND ( "CADENA"."NUMERO" = :carta_log_numero )   ;
				dw_1.setitem(i,'VALOR_CTA',valor_cta)
				dw_1.setitem(i,'MONEDA',INTEGER(moneda))
				if moneda = '1' then
					dw_1.setitem(i,'monto_mora_cred_carta',valor_cta*dw_1.getitemnumber(i,'carta_log_mora'))
				else
					dw_1.setitem(i,'monto_mora_cred_carta',valor_cta   * dw_1.getitemnumber(i,'carta_log_mora')      * valor_uf)
				end if
				mora = funcion_mora( fecha_prim , cta_pag_s , nro_cuotas, estado )
				if  mora <= 0 THEN
					mora = 0
				ELSE 
					if -daysafter(idt_fecha_hoy,funcion_venc( fecha_prim , cta_pag_s )) < 5 THEN
						mora = 0
					END IF
				END IF
				if moneda = '1' then
					dw_1.setitem(i,'mora_cred_actual',MORA)
					dw_1.setitem(i,'monto_mora_cred_actual',valor_cta * MORA)
				else
					dw_1.setitem(i,'mora_cred_actual',MORA)
					dw_1.setitem(i,'monto_mora_cred_actual',valor_cta * MORA * valor_uf)
				end if
				dw_1.setitem(i,'cta_pag_s',cta_pag_s)
				dw_1.setitem(i,'NRO_CUOTAS',NRO_CUOTAS)
				dw_1.setitem(i,'ctas_periodo',f_ctas_pag_periodo( dw_1.getitemdatetime(i,'proceso_carta_fecha') , carta_log_base , carta_log_serie , carta_log_numero ))
		END CHOOSE
		uo_1.hpb_1.position = i
		uo_1.st_reg.text = 'Registro N° '+string(i,'###,###,###,##0')+' de '+string(dw_1.rowcount(),'###,###,###,##0')
		dw_1.setitem(i,'estado',estado)
	next
	uo_1.visible = false
	dw_1.object.titulo_1.text = 'Proceso de Carta ( '+gs_empresa+' )'
	dw_1.object.titulo_2.text = 'Código de Acción : '+ ddlb_1.text +'   Clasificación : '+ddlb_2.text
end if
end event

type ddlb_1 from dropdownlistbox within w_procesos_cartas
integer x = 96
integer y = 176
integer width = 933
integer height = 876
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string sql

sql = "  SELECT DISTINCT CLASIFICACION FROM PROCESO_CARTA WHERE COD_ACCION = " +mid(this.text,1,1)
if this.text <> '[ Ninguno ]' then
	f_ddlb_all_accion(ddlb_2,sql,'1')
	ddlb_2.addItem(' ')
	ddlb_2.SelectItem(1)
	ddlb_2.triggerevent (selectionchanged!)
else
//	mle_1.text = ''
//	mle_2.text = ''
	dw_1.reset()
	ddlb_2.reset()
end if
end event

type cb_2 from commandbutton within w_procesos_cartas
integer x = 3442
integer y = 2208
integer width = 315
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_procesos_cartas)
end event

type cb_1 from commandbutton within w_procesos_cartas
integer x = 55
integer y = 2208
integer width = 315
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;dw_1.print()
end event

type gb_1 from groupbox within w_procesos_cartas
integer x = 55
integer y = 28
integer width = 1723
integer height = 272
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
end type

