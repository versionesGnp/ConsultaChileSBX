forward
global type w_sap_cargas from window
end type
type cb_exportar from commandbutton within w_sap_cargas
end type
type cb_materiales from commandbutton within w_sap_cargas
end type
type cb_ventas from commandbutton within w_sap_cargas
end type
type cbx_xml_cliente from checkbox within w_sap_cargas
end type
type cb_20 from commandbutton within w_sap_cargas
end type
type cb_19 from commandbutton within w_sap_cargas
end type
type cbx_xml from checkbox within w_sap_cargas
end type
type cb_18 from commandbutton within w_sap_cargas
end type
type cb_15 from commandbutton within w_sap_cargas
end type
type cb_17 from commandbutton within w_sap_cargas
end type
type dw_vista_sap from datawindow within w_sap_cargas
end type
type cb_16 from commandbutton within w_sap_cargas
end type
type cb_14 from commandbutton within w_sap_cargas
end type
type cb_act_ctto from commandbutton within w_sap_cargas
end type
type cb_act_cliente from commandbutton within w_sap_cargas
end type
type cb_13 from commandbutton within w_sap_cargas
end type
type cb_carga_masivas from commandbutton within w_sap_cargas
end type
type cb_12 from commandbutton within w_sap_cargas
end type
type cb_10 from commandbutton within w_sap_cargas
end type
type cb_9 from commandbutton within w_sap_cargas
end type
type hpb_1 from hprogressbar within w_sap_cargas
end type
type cb_8 from commandbutton within w_sap_cargas
end type
type cb_7 from commandbutton within w_sap_cargas
end type
type rb_4 from radiobutton within w_sap_cargas
end type
type rb_3 from radiobutton within w_sap_cargas
end type
type rb_2 from radiobutton within w_sap_cargas
end type
type rb_1 from radiobutton within w_sap_cargas
end type
type cb_6 from commandbutton within w_sap_cargas
end type
type cb_5 from commandbutton within w_sap_cargas
end type
type cb_4 from commandbutton within w_sap_cargas
end type
type cb_3 from commandbutton within w_sap_cargas
end type
type cb_ctto from commandbutton within w_sap_cargas
end type
type cb_1 from commandbutton within w_sap_cargas
end type
type cb_rescil_ctto from commandbutton within w_sap_cargas
end type
type cb_modif_ctto from commandbutton within w_sap_cargas
end type
type cb_ordenar from commandbutton within w_sap_cargas
end type
type cb_amplia from commandbutton within w_sap_cargas
end type
type cb_asocia_rut from commandbutton within w_sap_cargas
end type
type cb_filtrar from commandbutton within w_sap_cargas
end type
type cb_cta_cte from commandbutton within w_sap_cargas
end type
type cb_crea_ctto from commandbutton within w_sap_cargas
end type
type cb_2 from commandbutton within w_sap_cargas
end type
type gb_1 from groupbox within w_sap_cargas
end type
type st_fondo from statictext within w_sap_cargas
end type
type dw_cliente from datawindow within w_sap_cargas
end type
type dw_contrato from datawindow within w_sap_cargas
end type
type gb_2 from groupbox within w_sap_cargas
end type
type gb_3 from groupbox within w_sap_cargas
end type
end forward

global type w_sap_cargas from window
integer width = 4320
integer height = 2128
boolean titlebar = true
string title = "Creación Cliente SAP"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_exportar cb_exportar
cb_materiales cb_materiales
cb_ventas cb_ventas
cbx_xml_cliente cbx_xml_cliente
cb_20 cb_20
cb_19 cb_19
cbx_xml cbx_xml
cb_18 cb_18
cb_15 cb_15
cb_17 cb_17
dw_vista_sap dw_vista_sap
cb_16 cb_16
cb_14 cb_14
cb_act_ctto cb_act_ctto
cb_act_cliente cb_act_cliente
cb_13 cb_13
cb_carga_masivas cb_carga_masivas
cb_12 cb_12
cb_10 cb_10
cb_9 cb_9
hpb_1 hpb_1
cb_8 cb_8
cb_7 cb_7
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_ctto cb_ctto
cb_1 cb_1
cb_rescil_ctto cb_rescil_ctto
cb_modif_ctto cb_modif_ctto
cb_ordenar cb_ordenar
cb_amplia cb_amplia
cb_asocia_rut cb_asocia_rut
cb_filtrar cb_filtrar
cb_cta_cte cb_cta_cte
cb_crea_ctto cb_crea_ctto
cb_2 cb_2
gb_1 gb_1
st_fondo st_fondo
dw_cliente dw_cliente
dw_contrato dw_contrato
gb_2 gb_2
gb_3 gb_3
end type
global w_sap_cargas w_sap_cargas

type variables
string	is_obsev_tot,is_filtro,is_xml
long	il_row,il_row_cli
end variables

on w_sap_cargas.create
this.cb_exportar=create cb_exportar
this.cb_materiales=create cb_materiales
this.cb_ventas=create cb_ventas
this.cbx_xml_cliente=create cbx_xml_cliente
this.cb_20=create cb_20
this.cb_19=create cb_19
this.cbx_xml=create cbx_xml
this.cb_18=create cb_18
this.cb_15=create cb_15
this.cb_17=create cb_17
this.dw_vista_sap=create dw_vista_sap
this.cb_16=create cb_16
this.cb_14=create cb_14
this.cb_act_ctto=create cb_act_ctto
this.cb_act_cliente=create cb_act_cliente
this.cb_13=create cb_13
this.cb_carga_masivas=create cb_carga_masivas
this.cb_12=create cb_12
this.cb_10=create cb_10
this.cb_9=create cb_9
this.hpb_1=create hpb_1
this.cb_8=create cb_8
this.cb_7=create cb_7
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_ctto=create cb_ctto
this.cb_1=create cb_1
this.cb_rescil_ctto=create cb_rescil_ctto
this.cb_modif_ctto=create cb_modif_ctto
this.cb_ordenar=create cb_ordenar
this.cb_amplia=create cb_amplia
this.cb_asocia_rut=create cb_asocia_rut
this.cb_filtrar=create cb_filtrar
this.cb_cta_cte=create cb_cta_cte
this.cb_crea_ctto=create cb_crea_ctto
this.cb_2=create cb_2
this.gb_1=create gb_1
this.st_fondo=create st_fondo
this.dw_cliente=create dw_cliente
this.dw_contrato=create dw_contrato
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_exportar,&
this.cb_materiales,&
this.cb_ventas,&
this.cbx_xml_cliente,&
this.cb_20,&
this.cb_19,&
this.cbx_xml,&
this.cb_18,&
this.cb_15,&
this.cb_17,&
this.dw_vista_sap,&
this.cb_16,&
this.cb_14,&
this.cb_act_ctto,&
this.cb_act_cliente,&
this.cb_13,&
this.cb_carga_masivas,&
this.cb_12,&
this.cb_10,&
this.cb_9,&
this.hpb_1,&
this.cb_8,&
this.cb_7,&
this.rb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_ctto,&
this.cb_1,&
this.cb_rescil_ctto,&
this.cb_modif_ctto,&
this.cb_ordenar,&
this.cb_amplia,&
this.cb_asocia_rut,&
this.cb_filtrar,&
this.cb_cta_cte,&
this.cb_crea_ctto,&
this.cb_2,&
this.gb_1,&
this.st_fondo,&
this.dw_cliente,&
this.dw_contrato,&
this.gb_2,&
this.gb_3}
end on

on w_sap_cargas.destroy
destroy(this.cb_exportar)
destroy(this.cb_materiales)
destroy(this.cb_ventas)
destroy(this.cbx_xml_cliente)
destroy(this.cb_20)
destroy(this.cb_19)
destroy(this.cbx_xml)
destroy(this.cb_18)
destroy(this.cb_15)
destroy(this.cb_17)
destroy(this.dw_vista_sap)
destroy(this.cb_16)
destroy(this.cb_14)
destroy(this.cb_act_ctto)
destroy(this.cb_act_cliente)
destroy(this.cb_13)
destroy(this.cb_carga_masivas)
destroy(this.cb_12)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.hpb_1)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_ctto)
destroy(this.cb_1)
destroy(this.cb_rescil_ctto)
destroy(this.cb_modif_ctto)
destroy(this.cb_ordenar)
destroy(this.cb_amplia)
destroy(this.cb_asocia_rut)
destroy(this.cb_filtrar)
destroy(this.cb_cta_cte)
destroy(this.cb_crea_ctto)
destroy(this.cb_2)
destroy(this.gb_1)
destroy(this.st_fondo)
destroy(this.dw_cliente)
destroy(this.dw_contrato)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;double	ldb_tot_porc=0
connect using Trans_hana;
connect using Trans_1;
connect using Trans_2;

gf_centrar(w_sap_cargas)
if gs_depto='I' then
	cb_act_cliente.visible				= true
else
	cb_act_cliente.visible				= false
end if
dw_cliente.dataobject					= 'dw_sap_z001_carga_cliente'
dw_cliente.settransobject(sqlca)

dw_contrato.dataobject				= 'dw_sap_contrato_pend_carga'
dw_contrato.settransobject(sqlca)

is_xml									= 'si'

if gs_user='MARCOS' then
	cb_carga_masivas.visible		= true
end if
hpb_1.Position							= ldb_tot_porc

DECLARE SP_SAP_ACTUAL_TIPO_DEUDA PROCEDURE FOR SP_SAP_ACTUAL_TIPO_DEUDA();
EXECUTE SP_SAP_ACTUAL_TIPO_DEUDA;



end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_hana;


end event

type cb_exportar from commandbutton within w_sap_cargas
integer x = 3223
integer y = 1888
integer width = 229
integer height = 84
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_contrato
if dw_contrato.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_materiales from commandbutton within w_sap_cargas
integer x = 1961
integer y = 1880
integer width = 402
integer height = 100
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Disp. Materiales"
end type

event clicked;string		ls_material,ls_string
long		ll_tot_reg
datetime	ldt_fec_ini,ldt_fec_fin

dw_contrato.accepttext()
ll_tot_reg								= dw_contrato.rowcount()
if dw_contrato.dataobject='dw_sap_contrato_creados' and ll_tot_reg > 0 then
	ls_material			= 'UBS'
	ldt_fec_fin			= dw_contrato.getitemdatetime(1,'fecha_factura')
	ldt_fec_ini			= datetime(date('01'+'/'+ string((month(date(ldt_fec_fin))),'00')+'/'+ string(( year(date(ldt_fec_fin))),'0000')),time('00:00:00'))
	
	if not isnull(ldt_fec_ini) and not isnull(ldt_fec_fin) then
		ls_string				= ls_material+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')
		OpenWithParm(w_materiales_disponible, ls_string)
	else
		if isnull(ldt_fec_ini) then
			messagebox("Advertencia", "Debe Ingresar Fecha Inicio")
		elseif isnull(ldt_fec_fin) then
			messagebox("Advertencia", "Debe Ingresar Fecha Término")
		end if
	end if
else
	messagebox("Advertencia","No Registra Contratos para Integrar")
end if
end event

type cb_ventas from commandbutton within w_sap_cargas
integer x = 910
integer y = 2148
integer width = 343
integer height = 100
integer taborder = 220
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Estruc.Vtas"
end type

event clicked;string	ls_cod_age,ls_cod_sup,ls_cod_jef,ls_cargo,ls_codigo,ls_base,ls_tipo_deuda
long	ll_tot_reg,ll_indi,ll_estado

if dw_contrato.dataobject	= 'dw_sap_contrato_creados' then
	ll_tot_reg					= dw_contrato.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_base				= 	dw_contrato.getitemstring(ll_indi,'base')
			ls_tipo_deuda		= 	dw_contrato.getitemstring(ll_indi,'tipo_deuda')
			if (ls_base='A' or ls_base='L' or ls_base='O') and ls_tipo_deuda='C' then
				ls_cod_age			= dw_contrato.getitemstring(ll_indi,'sap_ctto_01_cabec_cod_age')
				ls_cargo				= 'A'
				ls_codigo				= f_sap_tabla_vtas_cargo(ls_cargo,ls_cod_age)
				if ls_codigo=ls_cod_age then
					ll_estado			= 1
				else
					ll_estado			= 0
				end if
				dw_contrato.setitem(ll_indi,'val_age',ll_estado)
				
				ls_cod_sup			= dw_contrato.getitemstring(ll_indi,'sap_ctto_01_cabec_cod_sup')
				ls_cargo				= 'S'
				ls_codigo				= f_sap_tabla_vtas_cargo(ls_cargo,ls_cod_sup)
				if ls_codigo=ls_cod_sup then
					ll_estado			= 1
				else
					ll_estado			= 0
				end if
				dw_contrato.setitem(ll_indi,'val_sup',ll_estado)
				
				ls_cod_jef			= dw_contrato.getitemstring(ll_indi,'sap_ctto_01_cabec_cod_jef')
				ls_cargo				= 'J'
				ls_codigo				= f_sap_tabla_vtas_cargo(ls_cargo,ls_cod_jef)
				if ls_codigo=ls_cod_jef then
					ll_estado			= 1
				else
					ll_estado			= 0
				end if
				dw_contrato.setitem(ll_indi,'val_jef',ll_estado)
				dw_contrato.accepttext()
			end if
		next
	else
		Messagebox("Advertencia","No Registra Contratos para Validar Estructura de Ventas")
	end if
	
else
	Messagebox("Advertencia","No Puede Validar Estructura de Ventas Sin Lista Contratos")
end if
end event

type cbx_xml_cliente from checkbox within w_sap_cargas
integer x = 46
integer y = 948
integer width = 421
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Revisión XML"
end type

event clicked;if cbx_xml.checked= true then
	is_xml					= 'no'
elseif cbx_xml.checked= false then
	is_xml					= 'si'
end if
end event

type cb_20 from commandbutton within w_sap_cargas
integer x = 526
integer y = 1880
integer width = 443
integer height = 100
integer taborder = 220
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Listar Contratos"
end type

event clicked;long	ll_tot_reg

dw_contrato.dataobject		= 'dw_sap_contrato_creados'
dw_contrato.settransobject(sqlca)
ll_tot_reg						= dw_contrato.retrieve()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Contratos Desarrollados Para Envio a SAP")
	cb_crea_ctto.enabled		= false
else
	cb_crea_ctto.enabled		= true
end if
end event

type cb_19 from commandbutton within w_sap_cargas
integer x = 4370
integer y = 1712
integer width = 530
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Factura Rep.Mant."
end type

event clicked;datetime	ldt_fec_ult_fact

SELECT	MAX("FECHA_CIERRE")  
INTO 		:ldt_fec_ult_fact  
FROM		"FACTURA_OFERTA"
USING	sqlca;

DECLARE factura_repact_mant PROCEDURE FOR  FAC_OFERTA_INGRE_REP_MANT(:ldt_fec_ult_fact);
EXECUTE factura_repact_mant;

end event

type cbx_xml from checkbox within w_sap_cargas
integer x = 23
integer y = 1736
integer width = 421
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Revisión XML"
end type

event clicked;if cbx_xml.checked= true then
	is_xml					= 'no'
elseif cbx_xml.checked= false then
	is_xml					= 'si'
end if
end event

type cb_18 from commandbutton within w_sap_cargas
integer x = 4507
integer y = 1532
integer width = 471
integer height = 100
integer taborder = 170
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crear Ctto SAP"
end type

event clicked;string		ls_base,ls_serie,ls_tipo_deuda,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ls_tipo_cob,ls_forma_pago,ls_centro,ls_rev,&
			ls_centro_benef,ls_cod_mat_sap,ls_almacen,ls_sector,ls_sepult,ls_nro_tecnico,ls_fecha,ls_moneda,ls_clasif,ls_cod_jef,&
			ls_cod_sup,ls_cod_age,ls_area,ls_grupo_imput,ls_nro_ctto_sap,ls_ctto_asociado,ls_ctto_serv,ls_nro_cliente,ls_ok,&
			ls_folio_consul,ls_consul_nro_sap,ls_carga,ls_tipo_carga, ls_pasa='N',ls_nulo
long		ret,ll_tot_reg,ll_fila,ll_res,ll_indi,ll_folio,ll_ctas_pact,ll_periodo_m,ll_cta_pag_s,ll_plazo,ll_posic_ubs,ll_estado_pie,ll_cod_parque,ll_ctas_ingre,&
			ll_mora_recon,ll_fallec,ll_capac,ll_graba,ll_no_graba=0,ll_plazo_dc,ll_estado,ll_existe,ll_cta,ll_estado_cab,ll_estado_ubs,ll_estado_cta
double	ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_numero,ldb_pie,ldb_pie_pag,ldb_cuota_m,ldb_tasa,ldb_rut,ldb_precio_dc,ldb_pie_dc,ldb_tasa_dc,ldb_val_cta_dc,ldb_gto_adm_dc,ldb_rut_aval
datetime	ldt_fecha_ctto,ldt_fec_pie,ldt_fecha_m,ldt_fec_prim_dc,ldt_fec_factura,ldt_nulo

Inet  iinet_base
ret = GetContextService("Internet", iinet_base)

setnull(ls_nulo);setnull(ldt_nulo)
dw_contrato.accepttext()
ll_tot_reg									= dw_contrato.rowcount()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Cliente par Carga SAP")
else
	ll_fila 										= dw_contrato.Find("estado_reg = 1",1, ll_tot_reg)
	if ll_fila=0 then 
		messagebox("Advertencia","Debe Seleccionar Clientes para Traspaso A SAP")
	else
		ll_res									= MessageBox("Advertencia","¿Desea Generar Traspaso de Contratos a SAP?", Exclamation!, YesNo!, 2)
		if ll_res=1 then
			SELECT	max("FACTURA_OFERTA"."FECHA_CIERRE")  
    			INTO 		:ldt_fec_factura  
    			FROM		"FACTURA_OFERTA"  
   			WHERE	"FACTURA_OFERTA"."FECHA_CIERRE" = to_date('31/12/2015','dd/mm/yyyy') AND  
         				("FACTURA_OFERTA"."ESTADO" = 'N' OR  "FACTURA_OFERTA"."ESTADO" = 'S')
			USING	sqlca;

			
			dw_contrato.accepttext()
			dw_contrato.setFilter( "estado_reg = 1")
			dw_contrato.filter()
			dw_contrato.accepttext()
			ll_tot_reg						= dw_contrato.rowcount()
			SetPointer(HourGlass!)
			hpb_1.Position					= ldb_tot_porc
			
			for	ll_indi=1 to ll_tot_reg
				is_obsev_tot					= ''
				ls_nro_cliente				= dw_contrato.getitemstring(ll_indi,'nro_cliente_sap')
				ls_base						= dw_contrato.getitemstring(ll_indi,'base')
				ls_serie						= dw_contrato.getitemstring(ll_indi,'serie')
				ldb_numero					= dw_contrato.getitemnumber(ll_indi,'numero')
				ls_tipo_deuda				= dw_contrato.getitemstring(ll_indi,'tipo_deuda')
				
				ls_tipo_ctto					= dw_contrato.getitemstring(ll_indi,'tipo_ctto')
				ls_organiz					= dw_contrato.getitemstring(ll_indi,'organiz')
				ls_origen_vta				= dw_contrato.getitemstring(ll_indi,'origen_venta')
				ls_uso						= dw_contrato.getitemstring(ll_indi,'uso')
				
				ldt_fecha_ctto				= dw_contrato.getitemdatetime(ll_indi,'fecha_ctto')
				ll_folio						= dw_contrato.getitemnumber(ll_indi,'folio_coprob')
				ls_tipo_cob					= dw_contrato.getitemstring(ll_indi,'tipo_cob')
				
				ldb_pie						= dw_contrato.getitemnumber(ll_indi,'pie')
				ldb_pie_pag					= dw_contrato.getitemnumber(ll_indi,'pie_pagado')
				
				ll_ctas_pact					= dw_contrato.getitemnumber(ll_indi,'ctas_pactadas_pie')
				ldt_fec_pie					= dw_contrato.getitemdatetime(ll_indi,'fecha_pie')
				ldb_rut_aval					= dw_contrato.getitemnumber(ll_indi,'rut_aval')
				ldb_cuota_m				= dw_contrato.getitemnumber(ll_indi,'valor_cuota_m')
				ldt_fecha_m					= dw_contrato.getitemdatetime(ll_indi,'fecha_m')
				ll_periodo_m				= dw_contrato.getitemnumber(ll_indi,'perio_mant')
				ll_cta_pag_s					= dw_contrato.getitemnumber(ll_indi,'cta_pag_s')
				//ll_cta_pag_s					= 0
				ldb_rut						= dw_contrato.getitemnumber(ll_indi,'rut')
				ls_forma_pago				= dw_contrato.getitemstring(ll_indi,'forma_pago')
				ls_centro						= dw_contrato.getitemstring(ll_indi,'centro')
				ls_centro_benef			= dw_contrato.getitemstring(ll_indi,'centro_benef')
				ls_cod_mat_sap			= dw_contrato.getitemstring(ll_indi,'codigo_material_sap')
				ls_almacen					= dw_contrato.getitemstring(ll_indi,'almacen')
				ls_sector						= dw_contrato.getitemstring(ll_indi,'sector')
				ls_sepult						= dw_contrato.getitemstring(ll_indi,'sepultura')
				ls_nro_tecnico				= dw_contrato.getitemstring(ll_indi,'nro_tecnico')
				ll_plazo						= dw_contrato.getitemnumber(ll_indi,'nro_cuotas')
				ldb_tasa						= dw_contrato.getitemnumber(ll_indi,'tasa_ctto')
				ll_posic_ubs					= dw_contrato.getitemnumber(ll_indi,'nro_posic_ubs')
				ll_mora_recon				= dw_contrato.getitemnumber(ll_indi,'mora_mant_recon')
				
				ls_fecha						= dw_contrato.getitemstring(ll_indi,'fecha')
				ls_moneda					= dw_contrato.getitemstring(ll_indi,'moneda')
				ls_clasif						= dw_contrato.getitemstring(ll_indi,'clasifica_venta')
				ll_fallec						= dw_contrato.getitemnumber(ll_indi,'fallecidos')
				ls_cod_jef					= dw_contrato.getitemstring(ll_indi,'cod_jef')
				ls_cod_sup					= dw_contrato.getitemstring(ll_indi,'cod_sup')
				ls_cod_age					= dw_contrato.getitemstring(ll_indi,'cod_age')
				ls_area						= dw_contrato.getitemstring(ll_indi,'area')
				ll_capac						= dw_contrato.getitemnumber(ll_indi,'capacidad')
				ls_grupo_imput				= dw_contrato.getitemstring(ll_indi,'grupo_imputacion')
				ls_nro_ctto_sap			= dw_contrato.getitemstring(ll_indi,'nro_ctto_sap')
				ls_ctto_asociado			= dw_contrato.getitemstring(ll_indi,'ctto_asociado')
				ls_folio_consul				= ls_base+ls_serie+string(ldb_numero)
				ls_tipo_carga				= dw_contrato.getitemstring(ll_indi,'tipo_carga')
				gl_cod_parque				= dw_contrato.getitemnumber(ll_indi,'cod_parque')
				
				ls_consul_nro_sap			= f_vista_ctto_sap(gs_mandatario,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ls_folio_consul,ls_tipo_deuda,string(ll_folio))
				ls_consul_nro_sap			= ''
				if isnull(ls_consul_nro_sap) or ls_consul_nro_sap='' then
					ll_existe					= f_sap_cadena(ls_tipo_deuda,ls_base,ls_serie,ldb_numero,ll_folio)
					//ll_existe					= 0
					if ll_existe=0 then
						if ls_tipo_deuda='M' then
							SELECT 	sum("INGRESO"."CUOTAS_PAG")  
							INTO		:ll_ctas_ingre
							FROM		"INGRESO"  
							WHERE	"INGRESO"."BASE" = :ls_base AND  
										"INGRESO"."SERIE" = :ls_serie AND  
										"INGRESO"."CONTRATO" = :ldb_numero AND
										"INGRESO"."FECHA_PAGO" > :ldt_fec_factura AND  
										"INGRESO"."TIPO_MOV" = 'F' AND  
										"INGRESO"."PAGO_HIST" = 'A' 
							USING	sqlca;
							if isnull(ll_ctas_ingre) then ll_ctas_ingre=0
						elseif ls_tipo_deuda='C'  and ls_base='R' then
							SELECT 	sum("INGRESO"."CUOTAS_PAG")  
							INTO		:ll_ctas_ingre
							FROM		"INGRESO"  
							WHERE	"INGRESO"."BASE" = :ls_base AND  
										"INGRESO"."SERIE" = :ls_serie AND  
										"INGRESO"."CONTRATO" = :ldb_numero AND
										"INGRESO"."FECHA_PAGO" > :ldt_fec_factura AND  
										"INGRESO"."PAGO_HIST" = 'A' 
							USING	sqlca;
							if isnull(ll_ctas_ingre) then ll_ctas_ingre=0
						end if
							
						if ll_ctas_ingre>0 then
							ll_cta_pag_s			= ll_cta_pag_s - ll_ctas_ingre
							
							DECLARE funcion_vencim PROCEDURE FOR  F_RETORNA_VCTO_MANT31122015(:ls_base,:ls_serie,:ldb_numero,:ls_tipo_deuda);
							EXECUTE funcion_vencim;
							if sqlca.sqlcode=0 then
								fetch funcion_vencim into :ldt_fecha_m ;
								close funcion_vencim;
							end if
							
//							SELECT 	add_months(to_date(:ldt_fecha_m), - (:ll_periodo_m * :ll_ctas_ingre))
//							INTO		:ldt_fecha_m
//							FROM 	dual;
												
							DECLARE funcion_mora PROCEDURE FOR  F_RETORNA_MORA_MANT31122015(:ls_base,:ls_serie,:ldb_numero,:ls_tipo_deuda);
							EXECUTE funcion_mora;
							if sqlca.sqlcode=0 then
								fetch funcion_mora into :ll_mora_recon ;
								close funcion_mora;
							end if
						end if
						
						//ls_carga				= f_insert_reg_sap(ls_tipo_deuda,ls_base,ls_serie,ldb_numero,ll_folio,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ldt_fecha_ctto,ldb_pie,ll_ctas_pact,ldt_fec_pie,ldb_rut_aval,ldb_cuota_m,ldt_fecha_m,ll_periodo_m,ll_cta_pag_s,ldb_rut,ls_forma_pago,ls_centro,ls_centro_benef,ls_cod_mat_sap,ls_almacen,ls_sector,ls_sepult,ls_nro_tecnico,ll_plazo,ldb_tasa,ll_posic_ubs,ldb_pie_pag,ll_mora_recon,ls_nro_cliente,ls_fecha,ls_moneda,ls_clasif,ll_fallec,ls_cod_jef,ls_cod_sup,ls_cod_age,ls_area,ll_capac,ls_grupo_imput,ls_nro_ctto_sap,ls_ctto_asociado,ls_ctto_serv,ls_tipo_cob,ls_tipo_carga)
						ll_estado_cab		= f_sap_ctto_01_cabec(ls_base,ls_serie,ldb_numero,ls_tipo_deuda,ll_folio,ldt_nulo)
						ll_estado_ubs		= f_sap_ctto_03_ubs(ls_base,ls_serie,ldb_numero,ls_tipo_deuda,ll_folio,ldt_nulo)
						ll_estado_pie		= f_sap_ctto_04_pie(ls_base,ls_serie,ldb_numero,ls_tipo_deuda)
//						ll_estado_cta		= f_sap_ctto_05_cuota(ls_base,ls_serie,ldb_numero,ls_tipo_deuda)
					else
						f_reg_x_segundo('CTTO',2000000)
						SELECT	SYSDATE
						INTO 		:gdt_fec_sistema
						FROM		"TASA"  
						WHERE	"TASA"."LOOK" = 1   
						USING	sqlca;
							
						if ret = -1 then
							messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
							return
						end if
						if gs_sap_conex='P' then
							if gl_cod_parque=104 then
								ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/contrato.php?conexion=N")
							elseif gl_cod_parque=11 then
								ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/contrato.php?conexion=F")
							else
								ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/contrato.php?conexion=P")
							end if
						elseif gs_sap_conex='Q' then
							if gl_cod_parque=104 then
								ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/contrato.php?conexion=QN")
							elseif gl_cod_parque=11 then
								ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/contrato.php?conexion=QF")
							else
								ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/contrato.php?conexion=QP")
							end if
						elseif gs_sap_conex='R' then
							if gl_cod_parque=104 then
								ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/contrato.php?conexion=RN")
							elseif gl_cod_parque=11 then
					//			ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/contrato.php?conexion=RF&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar=no" )
							else
					//			ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/contrato.php?conexion=RP&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar=no")
							end if	
						end if
						UPDATE "SAP_CADENA"  
						SET 		"FECHA_SAP" = :gdt_fec_sistema
						WHERE	( "SAP_CADENA"."BASE" = :ls_base ) AND  
									( "SAP_CADENA"."SERIE" = :ls_serie ) AND  
									( "SAP_CADENA"."NUMERO" = :ldb_numero ) AND  
									( "SAP_CADENA"."TIPO_DEUDA" = :ls_tipo_deuda )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit using sqlca;
						else
							rollback using sqlca;
						end if
					end if
				end if
			next
		end if
	end if
end if
end event

type cb_15 from commandbutton within w_sap_cargas
integer x = 1518
integer y = 2044
integer width = 402
integer height = 100
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Corrige Pie"
end type

event clicked;string		ls_base,ls_serie
long		ll_pag_mant,ll_pactadas_pie,ll_pagadas_pie,ll_detalle_pie,ll_folio
double	ldb_numero,ldb_pie
datetime	ldt_fec_ult_fact


SELECT	"SAP_FECHA_FACTURA"."FECHA_FACTURA"  
INTO		:ldt_fec_ult_fact  
FROM 	"SAP_FECHA_FACTURA"  
WHERE	"SAP_FECHA_FACTURA"."ESTADO" = 'N'
USING	sqlca;

DECLARE x1 CURSOR FOR
SELECT	"BASE",	"SERIE",	"NUMERO"
FROM		"FACTURA_OFERTA_INGRESO"  
WHERE	"FACTURA_OFERTA_INGRESO"."ESTADO" = 'N' 
USING	sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ls_base,:ls_serie,:ldb_numero ;
		if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ldb_numero) and ldb_numero>0  then
			SELECT	count("NUMERO_CUOTA")  
    			INTO		:ll_detalle_pie  
    			FROM		"DETALLE_PAGO_PIE"  
   			WHERE	"DETALLE_PAGO_PIE"."BASE" = :ls_base AND  
						"DETALLE_PAGO_PIE"."SERIE" = :ls_serie AND  
						"DETALLE_PAGO_PIE"."NUMERO" = :ldb_numero
			USING	Trans_1;
			if isnull(ll_detalle_pie) then ll_detalle_pie=0
			
			if ls_base= 'O' then
				SELECT	"PAGO_OFERTA"."CTAS_PACTADAS_PIE",  "PAGO_OFERTA"."PIE",	"OFERTA_V"."ULT_FOLIO"  
    				INTO		:ll_pactadas_pie, 									:ldb_pie,						:ll_folio 
    				FROM		"OFERTA_V","PAGO_OFERTA"  
   				WHERE	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
							"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
							"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
							"OFERTA_V"."SERIE" = :ls_serie AND  
							"OFERTA_V"."NRO_OFERTA" = :ldb_numero
				USING	Trans_1;
				if isnull(ll_pactadas_pie) then ll_pactadas_pie=0
				if isnull(ldb_pie) then ldb_pie=0
			elseif ls_base= 'A' then
				SELECT	"PAGO_AUMENTO"."CTAS_PACTADAS_PIE",	"PAGO_AUMENTO"."PIE",		"ANEXO_AUMENTO"."ULT_FOLIO"    
    				INTO		:ll_pactadas_pie, 										:ldb_pie,							:ll_folio    
    				FROM		"ANEXO_AUMENTO","PAGO_AUMENTO"  
   				WHERE	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and  
							"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
							"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
							"ANEXO_AUMENTO"."SERIE_M" = :ls_serie AND  
							"ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero
				USING	Trans_1;
				if isnull(ll_pactadas_pie) then ll_pactadas_pie=0
				if isnull(ldb_pie) then ldb_pie=0
			elseif ls_base= 'L' then
				SELECT	"PAGO_LIBERADOR"."CTAS_PACTADAS_PIE",	"PAGO_LIBERADOR"."PIE",	"ANEXO_LIBERADOR"."ULT_FOLIO"		    
    				INTO		:ll_pactadas_pie,										:ldb_pie,							:ll_folio      
    				FROM		"ANEXO_LIBERADOR","PAGO_LIBERADOR"  
   				WHERE	"ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" and  
							"ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" and  
							"ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" and  
							"ANEXO_LIBERADOR"."SERIE_M" = :ls_serie AND  
							"ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero
				USING	Trans_1;
				if isnull(ll_pactadas_pie) then ll_pactadas_pie=0
				if isnull(ldb_pie) then ldb_pie=0
			elseif ls_base= 'D' then
				SELECT	0,						"PIE",		0
    				INTO 		:ll_pactadas_pie,	:ldb_pie,	:ll_folio     
    				FROM		"DERECHO"  
   				WHERE 	"DERECHO"."SERIE_P" = :ls_serie AND  
         					"DERECHO"."NRO_PAGARE" = :ldb_numero
				USING	Trans_1;
				if isnull(ll_pactadas_pie) then ll_pactadas_pie=0
				if isnull(ldb_pie) then ldb_pie=0
			elseif ls_base= 'R'  then
				SELECT	0,						"PIE",  	0
    				INTO 		:ll_pactadas_pie,	:ldb_pie,	:ll_folio  
    				FROM		"REPACTA_MANTENCION"  
   				WHERE 	"REPACTA_MANTENCION"."BASE" = :ls_base AND	
							"REPACTA_MANTENCION"."SERIE" = :ls_serie AND  
         					"REPACTA_MANTENCION"."NUMERO" = :ldb_numero
				USING	Trans_1;
				if isnull(ll_pactadas_pie) then ll_pactadas_pie=0
				if isnull(ldb_pie) then ldb_pie=0
			end if
			
			if ll_detalle_pie<>ll_pactadas_pie then
				ll_pactadas_pie				= ll_detalle_pie
				if ls_base= 'O' then
					UPDATE	"PAGO_OFERTA"
     				SET		"CTAS_PACTADAS_PIE" = :ll_pactadas_pie
					WHERE	"PAGO_OFERTA"."SERIE" = :ls_serie AND  
								"PAGO_OFERTA"."NRO_OFERTA" = :ldb_numero AND
								 "PAGO_OFERTA"."FOLIO" =:ll_folio
					USING	Trans_1;
				elseif ls_base= 'A' then
					UPDATE	"PAGO_AUMENTO"
     				SET		"CTAS_PACTADAS_PIE" = :ll_pactadas_pie
					WHERE	"PAGO_AUMENTO"."SERIE_M" = :ls_serie AND  
								"PAGO_AUMENTO"."NRO_AUMENTO" = :ldb_numero AND
								 "PAGO_AUMENTO"."FOLIO" = :ll_folio
					USING	Trans_1;
				elseif ls_base= 'L' then
					UPDATE	"PAGO_LIBERADOR"
     				SET		"CTAS_PACTADAS_PIE" = :ll_pactadas_pie
					WHERE	"PAGO_LIBERADOR"."SERIE_M" = :ls_serie AND  
								"PAGO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero AND
								 "PAGO_LIBERADOR"."FOLIO" = :ll_folio
					USING	Trans_1;
				end if
				if Trans_1.sqlcode=0 then
					commit using Trans_1;
				else
					rollback using Trans_1;
				end if
			end if
			
			if ldb_pie>0 and ll_pactadas_pie=0 then
				ll_pactadas_pie				= 1
			elseif isnull(ldb_pie) or ldb_pie=0 then
				ll_pactadas_pie				= 0
			end if	
			
			SELECT	COUNT("INGRESO"."CUOTAS_PAG")
    			INTO		:ll_pagadas_pie  
    			FROM		"INGRESO"  
   			WHERE	"INGRESO"."BASE" = :ls_base AND  
         				"INGRESO"."SERIE" = :ls_serie AND  
         				"INGRESO"."CONTRATO" = :ldb_numero AND
						"INGRESO"."FECHA_PAGO" <= :ldt_fec_ult_fact AND  	
         				("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'Q') AND  
         				"INGRESO"."PAGO_HIST" = 'A'
			USING	Trans_1;
			if isnull(ll_pagadas_pie) then ll_pagadas_pie=0
			SELECT	SUM("INGRESO"."CUOTAS_PAG")  
    			INTO		:ll_pag_mant  
    			FROM		"INGRESO"  
   			WHERE	"INGRESO"."BASE" = :ls_base AND  
         				"INGRESO"."SERIE" = :ls_serie AND  
         				"INGRESO"."CONTRATO" = :ldb_numero AND
						"INGRESO"."FECHA_PAGO" <= :ldt_fec_ult_fact AND 
         				"INGRESO"."TIPO_MOV" = 'F' AND  
         				"INGRESO"."PAGO_HIST" = 'A'
			USING	Trans_1;
			if isnull(ll_pag_mant) then ll_pag_mant=0
			
			UPDATE	"FACTURA_OFERTA_INGRESO"  
     		SET		"CTAS_PACTADAS_PIE" = :ll_pactadas_pie,   
         				"CTAS_PAGADAS_PIE" = :ll_pagadas_pie,   
         				"CTAS_PAG_MANT" = :ll_pag_mant  
   			WHERE	"FACTURA_OFERTA_INGRESO"."BASE" = :ls_base AND  
         				"FACTURA_OFERTA_INGRESO"."SERIE" = :ls_serie AND  
         				"FACTURA_OFERTA_INGRESO"."NUMERO" = :ldb_numero AND  
        					"FACTURA_OFERTA_INGRESO"."ESTADO" = 'N'
			USING	Trans_1;
			if Trans_1.sqlcode=0 then
				commit using Trans_1;
			else
				rollback using Trans_1;
			end if
		end if
		setnull(ls_base);setnull(ls_serie);setnull(ldb_numero)
	LOOP
end if
close x1;
end event

type cb_17 from commandbutton within w_sap_cargas
integer x = 3913
integer y = 944
integer width = 343
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;string		ls_nro_ctto_sap,ls_organiz_vtas,ls_origen_vtas,ls_uso,ls_nro_cliente_sap,ls_folio_consul,ls_centro_benef,ls_grupo_impt,&
			ls_fec_ctto,ls_moneda,ls_grupo_impta,ls_centro,ls_almacen,ls_sector,ls_sepultura,ls_nro_tecnico,ls_tipo_ctto,ls_base,ls_serie,ls_dia,ls_mes,ls_ano
long		ll_tot_reg,ll_indi
datetime	ldt_fecha_ctto
double	ldb_tasa_interes,ldb_numero,ldb_tot_porc=0,ldb_tot_porc_aux=0


dw_vista_sap.dataobject			= 'dw_sap_vista_contratos_sap'
dw_vista_sap.settransobject(Trans_hana)

ls_tipo_ctto							= 'ZCM1'
ll_tot_reg							= dw_vista_sap.retrieve(gs_mandatario,ls_tipo_ctto)
if ll_tot_reg>0 then
	SetPointer(HourGlass!)
	hpb_1.Position					= ldb_tot_porc
	for	ll_indi=1 to ll_tot_reg
		ls_nro_ctto_sap			= dw_vista_sap.getitemstring(ll_indi,'num_contrato')   
		ls_organiz_vtas				= dw_vista_sap.getitemstring(ll_indi,'org_ventas')   
		ls_origen_vtas				= dw_vista_sap.getitemstring(ll_indi,'origen_vta')   
		ls_uso						= dw_vista_sap.getitemstring(ll_indi,'uso')   
		ls_nro_cliente_sap			= dw_vista_sap.getitemstring(ll_indi,'cliente_sap')   
		ls_folio_consul				= dw_vista_sap.getitemstring(ll_indi,'folio_consulta')   
		ls_fec_ctto					= dw_vista_sap.getitemstring(ll_indi,'fecha_contrato')   
		ls_moneda					= dw_vista_sap.getitemstring(ll_indi,'moneda')   
		ls_grupo_impta				= dw_vista_sap.getitemstring(ll_indi,'grupo_imputacion')   
		ls_centro						= dw_vista_sap.getitemstring(ll_indi,'centro')   
		ls_almacen					= dw_vista_sap.getitemstring(ll_indi,'almacen')   
		ls_sector						= dw_vista_sap.getitemstring(ll_indi,'sector')   
		ls_sepultura					= dw_vista_sap.getitemstring(ll_indi,'cod_sepultura')   
		ls_nro_tecnico				= dw_vista_sap.getitemstring(ll_indi,'num_tecnico')   
		ldb_tasa_interes			= dw_vista_sap.getitemnumber(ll_indi,'tasa_interes')   
		ls_centro_benef			= dw_vista_sap.getitemstring(ll_indi,'centro_benef')
		
		
		ls_dia							= trim(mid(ls_fec_ctto,7,2))
		ls_mes						= trim(mid(ls_fec_ctto,5,2))
		ls_ano						= trim(mid(ls_fec_ctto,1,4))
		
		ldt_fecha_ctto				= datetime(date( trim(mid(ls_fec_ctto,7,2))+'/'+ trim(mid(ls_fec_ctto,5,2))+'/'+trim(mid(ls_fec_ctto,1,4)) ),time('00:00:00'))
		
		ls_base						= trim(mid(ls_folio_consul,1,1))
		ls_serie						= trim(mid(ls_folio_consul,2,1))
		ldb_numero					= double(trim(mid(ls_folio_consul,3,25)))
		
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
			INSERT INTO "SAP_CARGA_VISTA_CONTRATO_SAP"  
						( "BASE",		"SERIE",	"NUMERO",		"MANDTE",			"NRO_CONTRATO_SAP",	"TIPO_CONTRATO",	"ORGANIZACION",	"ORIGEN_VENTA",	"USO",	"NRO_CLIENTE_SAP",	"FOLIO_CONSULTA",	"FECHA_CONTRATO",	"MONEDA",	"GRUPO_IMPUTACION",	"CENTRO",	"ALMACEN",		"SECTOR",	"SEPULTURA",	"NRO_TECNICO",	"TASA",				"CENTRO_BENEFICIO")  
			VALUES	( :ls_base,	:ls_serie,	:ldb_numero,	:gs_mandatario,	:ls_nro_ctto_sap,			:ls_tipo_ctto,			:ls_organiz_vtas,	:ls_origen_vtas,	:ls_uso,	:ls_nro_cliente_sap,	:ls_folio_consul,		:ldt_fecha_ctto,			:ls_moneda,	:ls_grupo_impt,			:ls_centro,	:ls_almacen,	:ls_sector,	:ls_sepultura,	:ls_nro_tecnico,	:ldb_tasa_interes,	:ls_centro_benef)
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
			else
				rollback using sqlca;
			end if
		end if
		if ldb_tot_porc <> ldb_tot_porc_aux then 
			ldb_tot_porc_aux		= ldb_tot_porc
		end if
		ldb_tot_porc					= (ll_indi / ll_tot_reg) * 100
		hpb_1.Position 				= ldb_tot_porc
		dw_cliente.accepttext()
	next
end if	
	
	
end event

type dw_vista_sap from datawindow within w_sap_cargas
integer x = 4512
integer y = 704
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_sap_vista_contratos_sap"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_16 from commandbutton within w_sap_cargas
boolean visible = false
integer x = 4517
integer y = 68
integer width = 457
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Carga Clientes"
end type

event clicked;string		ls_tipo_cliente,ls_nro_sap,ls_dv,ls_sociedad,ls_organ_vta,ls_uso,ls_origen_vta,ls_grupo_cta,ls_rut
long		ll_tot_reg,ll_fila,ll_res,ll_indi,ll_graba=0,ll_no_graba,ll_estado
double	ldb_rut,ldb_tot_porc=0,ldb_tot_porc_aux=0

dw_cliente.accepttext()
ll_tot_reg										= dw_cliente.rowcount()
if ll_tot_reg>0 then
	ll_fila 											= dw_cliente.Find("estado_reg = 1",1, ll_tot_reg)
	if ll_fila=0 then 
		messagebox("Advertencia","Debe Seleccionar Clientes para Traspaso A SAP")
	else
		ll_res										= MessageBox("Advertencia","¿Desea Generar Traspaso de Clientes a SAP?", Exclamation!, YesNo!, 2)
		if ll_res=1 then
			dw_cliente.accepttext()
			dw_cliente.setFilter( "estado_reg = 1")
			dw_cliente.filter()
			dw_cliente.accepttext()
			ll_tot_reg							= dw_cliente.rowcount()
			SetPointer(HourGlass!)
			if ll_tot_reg>0 then
				hpb_1.Position					= ldb_tot_porc
				for	ll_indi=1 to ll_tot_reg
					ldb_rut						= dw_cliente.getitemnumber(ll_indi,'rut')
//					UPDATE	"CLIENTE"  
//					SET 		"ESTADO_SAP" = 3 	
//					WHERE	"CLIENTE"."RUT" = :ldb_rut
//					USING	sqlca;
//					if sqlca.sqlcode=0 then
//						commit using sqlca;
//						ll_graba++
//					else
//						rollback using sqlca;
//						ll_no_graba++
//					end if
					ldb_tot_porc					= (ll_indi / ll_tot_reg) * 100
					hpb_1.Position 				= ldb_tot_porc
					dw_cliente.accepttext()
				next
				dw_cliente.accepttext()
				DECLARE SP_SAP_CARGA_CLIENTE PROCEDURE FOR "SP_SAP_CARGA_CLIENTE"(:gs_mandatario, 'C',:gs_user);
				execute SP_SAP_CARGA_CLIENTE;
				
				dw_cliente.dataobject		= 'dw_numero_cliente_ampliacion'
				dw_cliente.settransobject(sqlca)
				ll_tot_reg					= dw_cliente.retrieve()
				if ll_tot_reg>0 then
					hpb_1.Position			= ldb_tot_porc
					for	ll_indi=1 to ll_tot_reg
						dw_cliente.setitem(ll_indi,'estado_reg',0)
						dw_cliente.accepttext()
						ldb_tot_porc			= (ll_indi / ll_tot_reg) * 100
						hpb_1.Position 		= ldb_tot_porc
					next
					dw_cliente.object.t_marca.text		= 'Desmarcar Todos'
					dw_cliente.accepttext()
				end if
			end if
			SetPointer(Arrow!)
		end if
	end if
end if
end event

type cb_14 from commandbutton within w_sap_cargas
integer x = 4512
integer y = 1380
integer width = 457
integer height = 112
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Des.Posiciones"
end type

event clicked;string		ls_base,ls_serie,ls_tipo_deuda,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ls_tipo_cob,ls_forma_pago,ls_centro,ls_rev,&
			ls_centro_benef,ls_cod_mat_sap,ls_almacen,ls_sector,ls_sepult,ls_nro_tecnico,ls_fecha,ls_moneda,ls_clasif,ls_cod_jef,&
			ls_cod_sup,ls_cod_age,ls_area,ls_grupo_imput,ls_nro_ctto_sap,ls_ctto_asociado,ls_ctto_serv,ls_nro_cliente,ls_ok,&
			ls_folio_consul,ls_consul_nro_sap,ls_carga,ls_tipo_carga, ls_pasa='N',ls_nulo,ls_elimina
long		ret,ll_tot_reg,ll_fila,ll_res,ll_indi,ll_folio,ll_ctas_pact,ll_periodo_m,ll_cta_pag_s,ll_plazo,ll_posic_ubs,ll_estado_pie,&
			ll_mora_recon,ll_fallec,ll_capac,ll_graba,ll_no_graba=0,ll_plazo_dc,ll_estado,ll_existe,ll_cta,ll_estado_cab,ll_estado_ubs,ll_estado_cta
double	ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_numero,ldb_pie,ldb_pie_pag,ldb_cuota_m,ldb_tasa,ldb_rut,ldb_precio_dc,ldb_pie_dc,ldb_tasa_dc,ldb_val_cta_dc,ldb_gto_adm_dc,ldb_rut_aval
datetime	ldt_fecha_ctto,ldt_fec_pie,ldt_fecha_m,ldt_fec_prim_dc,ldt_nulo

setnull(ls_nulo);setnull(ldt_nulo)
dw_contrato.accepttext()
ll_tot_reg									= dw_contrato.rowcount()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Cliente par Carga SAP")
else
	ll_fila 										= dw_contrato.Find("estado_reg = 1",1, ll_tot_reg)
	if ll_fila=0 then 
		messagebox("Advertencia","Debe Seleccionar Clientes para Traspaso A SAP")
	else
		ll_res									= MessageBox("Advertencia","¿Desea Generar Traspaso de Contratos a SAP?", Exclamation!, YesNo!, 2)
		if ll_res=1 then
			dw_contrato.accepttext()
			dw_contrato.setFilter( "estado_reg = 1")
			dw_contrato.filter()
			dw_contrato.accepttext()
			ll_tot_reg						= dw_contrato.rowcount()
			SetPointer(HourGlass!)
			hpb_1.Position					= ldb_tot_porc
			
			for	ll_indi=1 to ll_tot_reg
				is_obsev_tot					= ''
				ls_nro_cliente				= dw_contrato.getitemstring(ll_indi,'nro_cliente_sap')
				ls_base						= dw_contrato.getitemstring(ll_indi,'base')
				ls_serie						= dw_contrato.getitemstring(ll_indi,'serie')
				ldb_numero					= dw_contrato.getitemnumber(ll_indi,'numero')
				ls_tipo_deuda				= dw_contrato.getitemstring(ll_indi,'tipo_deuda')
				
				ls_tipo_ctto					= dw_contrato.getitemstring(ll_indi,'tipo_ctto')
				ls_organiz					= dw_contrato.getitemstring(ll_indi,'organiz')
				ls_origen_vta				= dw_contrato.getitemstring(ll_indi,'origen_venta')
				ls_uso						= dw_contrato.getitemstring(ll_indi,'uso')
				
				ldt_fecha_ctto				= dw_contrato.getitemdatetime(ll_indi,'fecha_ctto')
				ll_folio						= dw_contrato.getitemnumber(ll_indi,'folio_coprob')
				ls_tipo_cob					= dw_contrato.getitemstring(ll_indi,'tipo_cob')
				
				ldb_pie						= dw_contrato.getitemnumber(ll_indi,'pie')
				ldb_pie_pag					= dw_contrato.getitemnumber(ll_indi,'pie_pagado')
				
				ll_ctas_pact					= dw_contrato.getitemnumber(ll_indi,'ctas_pactadas_pie')
				ldt_fec_pie					= dw_contrato.getitemdatetime(ll_indi,'fecha_pie')
				ldb_rut_aval					= dw_contrato.getitemnumber(ll_indi,'rut_aval')
				ldb_cuota_m				= dw_contrato.getitemnumber(ll_indi,'valor_cuota_m')
				ldt_fecha_m					= dw_contrato.getitemdatetime(ll_indi,'fecha_m')
				ll_periodo_m				= dw_contrato.getitemnumber(ll_indi,'perio_mant')
				ll_cta_pag_s					= dw_contrato.getitemnumber(ll_indi,'cta_pag_s')
				ldb_rut						= dw_contrato.getitemnumber(ll_indi,'rut')
				ls_forma_pago				= dw_contrato.getitemstring(ll_indi,'forma_pago')
				ls_centro						= dw_contrato.getitemstring(ll_indi,'centro')
				ls_centro_benef			= dw_contrato.getitemstring(ll_indi,'centro_benef')
				ls_cod_mat_sap			= dw_contrato.getitemstring(ll_indi,'codigo_material_sap')
				ls_almacen					= dw_contrato.getitemstring(ll_indi,'almacen')
				ls_sector						= dw_contrato.getitemstring(ll_indi,'sector')
				ls_sepult						= dw_contrato.getitemstring(ll_indi,'sepultura')
				ls_nro_tecnico				= dw_contrato.getitemstring(ll_indi,'nro_tecnico')
				ll_plazo						= dw_contrato.getitemnumber(ll_indi,'nro_cuotas')
				ldb_tasa						= dw_contrato.getitemnumber(ll_indi,'tasa_ctto')
				ll_posic_ubs					= dw_contrato.getitemnumber(ll_indi,'nro_posic_ubs')
				ll_mora_recon				= dw_contrato.getitemnumber(ll_indi,'mora_mant_recon')
				
				ls_fecha						= dw_contrato.getitemstring(ll_indi,'fecha')
				ls_moneda					= dw_contrato.getitemstring(ll_indi,'moneda')
				ls_clasif						= dw_contrato.getitemstring(ll_indi,'clasifica_venta')
				ll_fallec						= dw_contrato.getitemnumber(ll_indi,'fallecidos')
				ls_cod_jef					= dw_contrato.getitemstring(ll_indi,'cod_jef')
				ls_cod_sup					= dw_contrato.getitemstring(ll_indi,'cod_sup')
				ls_cod_age					= dw_contrato.getitemstring(ll_indi,'cod_age')
				ls_area						= dw_contrato.getitemstring(ll_indi,'area')
				ll_capac						= dw_contrato.getitemnumber(ll_indi,'capacidad')
				ls_grupo_imput				= dw_contrato.getitemstring(ll_indi,'grupo_imputacion')
				ls_nro_ctto_sap			= dw_contrato.getitemstring(ll_indi,'nro_ctto_sap')
				ls_ctto_asociado			= dw_contrato.getitemstring(ll_indi,'ctto_asociado')
				ls_folio_consul				= ls_base+ls_serie+string(ldb_numero)
				ls_tipo_carga				= dw_contrato.getitemstring(ll_indi,'tipo_carga')
				
				ls_consul_nro_sap			= f_vista_ctto_sap(gs_mandatario,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ls_folio_consul,ls_tipo_deuda,string(0))
				if isnull(ls_consul_nro_sap) or ls_consul_nro_sap='' then
					ls_elimina				= 'S'
					if ls_elimina='S' then
						DELETE FROM	"DESARROLLO_CUOTA"  
						WHERE	 ( "DESARROLLO_CUOTA"."BASE" = :ls_base ) AND  
										( "DESARROLLO_CUOTA"."SERIE" = :ls_serie ) AND  
										( "DESARROLLO_CUOTA"."NUMERO" = :ldb_numero )
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit using sqlca;
						else
							rollback using sqlca;
						end if
						DELETE FROM "SAP_CADENA"  
						WHERE	"SAP_CADENA"."BASE" = :ls_base AND  
									"SAP_CADENA"."SERIE" = :ls_serie AND  
									"SAP_CADENA"."NUMERO" = :ldb_numero AND  
									"SAP_CADENA"."TIPO_DEUDA" = :ls_tipo_deuda
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit using sqlca;
						else
							rollback using sqlca;
						end if
						DELETE FROM "SAP_CTTO_01_CABEC"  
						WHERE	"SAP_CTTO_01_CABEC"."BASE" = :ls_base AND  
									"SAP_CTTO_01_CABEC"."SERIE" = :ls_serie AND  
									"SAP_CTTO_01_CABEC"."NUMERO" = :ldb_numero AND  
									"SAP_CTTO_01_CABEC"."TIPO_DEUDA" = :ls_tipo_deuda
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit using sqlca;
						else
							rollback using sqlca;
						end if
						DELETE FROM "SAP_CTTO_03_UBS"  
						WHERE	"SAP_CTTO_03_UBS"."BASE" = :ls_base AND  
									"SAP_CTTO_03_UBS"."SERIE" = :ls_serie AND  
									"SAP_CTTO_03_UBS"."NUMERO" = :ldb_numero AND  
									"SAP_CTTO_03_UBS"."TIPO_DEUDA" = :ls_tipo_deuda
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit using sqlca;
						else
							rollback using sqlca;
						end if
						DELETE FROM "SAP_CTTO_04_PIE"  
						WHERE	"SAP_CTTO_04_PIE"."BASE" = :ls_base AND  
									"SAP_CTTO_04_PIE"."SERIE" = :ls_serie AND  
									"SAP_CTTO_04_PIE"."NUMERO" = :ldb_numero AND  
									"SAP_CTTO_04_PIE"."TIPO_DEUDA" = :ls_tipo_deuda
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit using sqlca;
						else
							rollback using sqlca;
						end if
						DELETE FROM "SAP_CTTO_05_CUOTA"  
						WHERE	"SAP_CTTO_05_CUOTA"."BASE" = :ls_base AND  
									"SAP_CTTO_05_CUOTA"."SERIE" = :ls_serie AND  
									"SAP_CTTO_05_CUOTA"."NUMERO" = :ldb_numero AND  
									"SAP_CTTO_05_CUOTA"."TIPO_DEUDA" = :ls_tipo_deuda
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit using sqlca;
						else
							rollback using sqlca;
						end if
					end if
					if ls_tipo_deuda='C' and (ls_base='O' or ls_base='L' or ls_base='A' or ls_base='R' or ls_base='D' or ls_base='P')  then
						if (ls_tipo_deuda='C' or ls_tipo_deuda='E') and ls_base<>'C'  then
							f_desarrollo_cta(ls_base,ls_serie,ldb_numero)
						end if
					end if
//					ls_carga				= f_insert_reg_sap(ls_tipo_deuda,ls_base,ls_serie,ldb_numero,ll_folio,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ldt_fecha_ctto,ldb_pie,ll_ctas_pact,ldt_fec_pie,ldb_rut_aval,ldb_cuota_m,ldt_fecha_m,ll_periodo_m,ll_cta_pag_s,ldb_rut,ls_forma_pago,ls_centro,ls_centro_benef,ls_cod_mat_sap,ls_almacen,ls_sector,ls_sepult,ls_nro_tecnico,ll_plazo,ldb_tasa,ll_posic_ubs,ldb_pie_pag,ll_mora_recon,ls_nro_cliente,ls_fecha,ls_moneda,ls_clasif,ll_fallec,ls_cod_jef,ls_cod_sup,ls_cod_age,ls_area,ll_capac,ls_grupo_imput,ls_nro_ctto_sap,ls_ctto_asociado,ls_ctto_serv,ls_tipo_cob,ls_tipo_carga)
					ll_estado_cab		= f_sap_ctto_01_cabec(ls_base,ls_serie,ldb_numero,ls_tipo_deuda,ll_folio,ldt_nulo)
					ll_estado_ubs		= f_sap_ctto_03_ubs(ls_base,ls_serie,ldb_numero,ls_tipo_deuda,ll_folio,ldt_nulo)
					ll_estado_pie		= f_sap_ctto_04_pie(ls_base,ls_serie,ldb_numero,ls_tipo_deuda)
				//	ll_estado_cta		= f_sap_ctto_05_cuota(ls_base,ls_serie,ldb_numero,ls_tipo_deuda)
					UPDATE	"SAP_CADENA"  
					SET 		"ESTADO_SAP" = 3
					WHERE	"SAP_CADENA"."BASE" = :ls_base AND
								"SAP_CADENA"."SERIE" = :ls_serie AND
								"SAP_CADENA"."NUMERO" = :ldb_numero AND
								"SAP_CADENA"."TIPO_DEUDA" = :ls_tipo_deuda
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit using sqlca;
						ll_graba++	
					else
						rollback using sqlca;
					end if
				end if
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					ldb_tot_porc_aux		= ldb_tot_porc
				end if
				ldb_tot_porc					= (ll_indi / ll_tot_reg) * 100
				dw_cliente.accepttext()
			next
			dw_contrato.reset()
			SetPointer(Arrow!)
			messagebox("Grabar",'Proceso Terminado :~r~n'+string(ll_graba,'###,###,##0')+' Grabados Tabla SAP Cadena~r~n'+&
										'y '+string(ll_no_graba,'###,###,##0')+' No Grabados Tabla SAP Cadena.',information!)
		end if
	end if
end if
end event

type cb_act_ctto from commandbutton within w_sap_cargas
integer x = 1486
integer y = 1880
integer width = 480
integer height = 100
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar Ctto SAP"
end type

event clicked;Long		ll_rut,ll_estado,ll_tot_reg,ll_graba
String		ls_base, ls_serie, ls_tipo_deuda, ls_tipo, ls_tipo_ctto, ls_organizacion, ls_tipo_venta, ls_uso,ls_folio_consul,ls_consul_nro_sap
double	ldb_tot_porc=0,ldb_tot_porc_aux=0,ll_cttos=0,ldb_numero

SELECT 	count("SAP_CADENA"."BASE")
INTO		:ll_tot_reg
FROM 	"SAP_CADENA"  
WHERE 	"SAP_CADENA"."ESTADO_SAP" >1 AND 
			"SAP_CADENA"."NRO_CONTRATO_SAP" is Null    
USING	sqlca ;
if isnull(ll_tot_reg) then ll_tot_reg=0
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Contratos para Actualizar")
else
	SetPointer(HourGlass!)
	ll_graba							= 0
	hpb_1.Position					= ldb_tot_porc
	DECLARE x1 CURSOR FOR  
	SELECT "SAP_CADENA"."BASE",   
				"SAP_CADENA"."SERIE",   
				"SAP_CADENA"."NUMERO",   
				"SAP_CADENA"."TIPO_DEUDA",   
				"SAP_CADENA"."TIPO_CONTRATO",   
				"SAP_CADENA"."ORGANIZACION",   
				"SAP_CADENA"."TIPO_VENTA",   
				"SAP_CADENA"."USO"  
	FROM 	"SAP_CADENA"  
	WHERE 	"SAP_CADENA"."ESTADO_SAP" >1 AND 
				//"SAP_CADENA"."TIPO_DEUDA" = 'C' AND 
				"SAP_CADENA"."NRO_CONTRATO_SAP" is Null    
	USING	Trans_1 ;
	open x1;
	if Trans_1.sqlcode=0 then
		do while Trans_1.sqlcode=0
		fetch x1 into :ls_base, :ls_serie, :ldb_numero, :ls_tipo_deuda, :ls_tipo_ctto, :ls_organizacion, :ls_tipo_venta, :ls_uso;
			if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>''  and not isnull(ldb_numero) and ldb_numero>0 and not isnull(ls_tipo_deuda) and ls_tipo_deuda<>'' then
				ls_folio_consul				= ls_base+ls_serie+string(ldb_numero)
				ls_consul_nro_sap			= f_vista_ctto_sap(gs_mandatario,ls_tipo_ctto,ls_organizacion,ls_tipo_venta,ls_uso,ls_folio_consul,ls_tipo_deuda,string(0))
				if not isnull(ls_consul_nro_sap) and ls_consul_nro_sap<>'' then
					ll_estado					= f_sap_ctto_creado(ls_base,ls_serie,ldb_numero,ls_consul_nro_sap,ls_tipo_deuda)
					if ll_estado=1 then
						ll_graba++
						if ls_tipo_deuda='C' then
							UPDATE	"CADENA"  
							SET		"ESTADO_SAP_CRED" = 1
							WHERE	"CADENA"."CODIGO" = :ls_base AND  
										"CADENA"."SERIE" = :ls_serie AND  
										"CADENA"."NUMERO" = :ldb_numero AND  
										"CADENA"."SAP_CRED" = 'C'
							USING	Trans_2;
						elseif ls_tipo_deuda='E' then
							UPDATE	"CADENA"  
							SET		"ESTADO_SAP_CRED" = 1
							WHERE	"CADENA"."CODIGO" = :ls_base AND  
										"CADENA"."SERIE" = :ls_serie AND  
										"CADENA"."NUMERO" = :ldb_numero AND  
										"CADENA"."SAP_CRED" = 'E'
							USING	Trans_2;	
						elseif ls_tipo_deuda='M' then
							UPDATE	"CADENA"  
							SET		"ESTADO_SAP_MANT" = 1  
							WHERE	"CADENA"."CODIGO" = :ls_base AND  
										"CADENA"."SERIE" = :ls_serie AND  
										"CADENA"."NUMERO" = :ldb_numero AND  
										"CADENA"."SAP_MANT" = 'M'
							USING	Trans_2;
						end if
						if Trans_2.sqlcode=0 then
							commit using Trans_2;
							ll_graba++
						else
							rollback using Trans_2;
						end if
					end if	
				end if
			end if
			setnull(ls_base);setnull(ls_serie);setnull(ldb_numero);setnull(ls_tipo_deuda);setnull(ls_tipo_ctto);setnull(ls_organizacion);setnull(ls_tipo_venta);setnull(ls_uso)
			if ldb_tot_porc <> ldb_tot_porc_aux then 
				ldb_tot_porc_aux							= ldb_tot_porc
			end if
			ldb_tot_porc										= ((ll_graba / 2) / ll_tot_reg) * 100
			hpb_1.Position 									= ldb_tot_porc
			dw_cliente.accepttext()
		loop	
	end if
	close x1;
end if
end event

type cb_act_cliente from commandbutton within w_sap_cargas
integer x = 1001
integer y = 940
integer width = 526
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Cliente SAP"
end type

event clicked;Long		ll_tot_reg,ll_graba,ll_no_graba,ll_estado,ll_tot_nro_sap,ll_tot_gen,ll_tot_act,ll_tot_act2
String		ls_mandante, ls_grupo, ls_sociedad, ls_organizacion, ls_origen, ls_uso, ls_tipo_cliente, ls_dv,&
			ls_rut, ls_nro_sap,ls_tipo_carga,ls_nro_cliente
double	ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_rut


SELECT 	count("SAP_AMPLIACION_CLIENTE"."RUT")
INTO		:ll_tot_nro_sap
FROM 	"SAP_AMPLIACION_CLIENTE"
WHERE	(("SAP_AMPLIACION_CLIENTE"."ESTADO_SAP" = 2 AND "SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP" IS NULL) OR
			("SAP_AMPLIACION_CLIENTE"."ESTADO_SAP" = 3 AND "SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP" IS NOT NULL))
USING	sqlca;
if isnull(ll_tot_nro_sap) then ll_tot_nro_sap=0

SELECT 	count("SAP_AMPLIACION_CLIENTE"."RUT")
INTO		:ll_tot_reg
FROM 	"SAP_AMPLIACION_CLIENTE"
WHERE	("SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP" IS NULL AND "SAP_AMPLIACION_CLIENTE"."ESTADO_SAP"=3) 
USING	sqlca;
if isnull(ll_tot_reg) then ll_tot_reg=0

SELECT	count(DISTINCT	"SAP_AMPLIACION_CLIENTE"."RUT")
INTO		:ll_tot_act
FROM		"SAP_AMPLIACION_CLIENTE","CLIENTE_REZAGO","CLIENTE"
WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = "CLIENTE_REZAGO"."RUT" AND
			"SAP_AMPLIACION_CLIENTE"."RUT" = "CLIENTE"."RUT" AND
			("SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP" IS NOT NULL AND "SAP_AMPLIACION_CLIENTE"."ESTADO_SAP"=1) AND
			"CLIENTE_REZAGO"."NRO_CLIENTE_SAP" IS NOT NULL AND 
			"CLIENTE"."NRO_CLIENTE_SAP" IS NULL
USING	sqlca;
if isnull(ll_tot_act) then ll_tot_act=0

SELECT	count(DISTINCT	"SAP_AMPLIACION_CLIENTE"."RUT")
INTO		:ll_tot_act2
FROM		"SAP_AMPLIACION_CLIENTE","CLIENTE_REZAGO","CLIENTE"
WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = "CLIENTE_REZAGO"."RUT" AND
			"SAP_AMPLIACION_CLIENTE"."RUT" = "CLIENTE"."RUT" AND
			("SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP" IS NOT NULL AND "SAP_AMPLIACION_CLIENTE"."ESTADO_SAP"=1) AND
			"CLIENTE"."NRO_CLIENTE_SAP" IS NOT NULL AND 
			"CLIENTE_REZAGO"."NRO_CLIENTE_SAP" IS NULL
USING	sqlca;
if isnull(ll_tot_act2) then ll_tot_act2=0


ll_tot_gen				= ll_tot_nro_sap + ll_tot_reg + ll_tot_act + ll_tot_act2

if ll_tot_gen=0 then
	messagebox("Advertencia","No Registra Clientes para Actualizar")
else
	SetPointer(HourGlass!)
	hpb_1.Position					= ldb_tot_porc
	DECLARE x1 CURSOR FOR
	SELECT	"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE",   
         		"SAP_AMPLIACION_CLIENTE"."RUT",   
   				"SAP_AMPLIACION_CLIENTE"."MANDT",   
         		"SAP_AMPLIACION_CLIENTE"."GRUPO_CUENTA",   
         		"SAP_AMPLIACION_CLIENTE"."SOCIEDAD",   
         		"SAP_AMPLIACION_CLIENTE"."ORGANIZACION",   
         		"SAP_AMPLIACION_CLIENTE"."ORIGEN_VENTA",   
         		"SAP_AMPLIACION_CLIENTE"."USO",
				"SAP_AMPLIACION_CLIENTE"."ESTADO_SAP",
				"SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP"
	FROM		"SAP_AMPLIACION_CLIENTE"
   	WHERE	(("SAP_AMPLIACION_CLIENTE"."ESTADO_SAP" = 2 AND "SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP" IS NULL) OR
				("SAP_AMPLIACION_CLIENTE"."ESTADO_SAP" = 3 AND "SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP" IS NOT NULL))
				//AND "SAP_AMPLIACION_CLIENTE"."RUT" = 11317252
	UNION
	SELECT	"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE",   
         		"SAP_AMPLIACION_CLIENTE"."RUT",   
   				"SAP_AMPLIACION_CLIENTE"."MANDT",   
         		"SAP_AMPLIACION_CLIENTE"."GRUPO_CUENTA",   
         		"SAP_AMPLIACION_CLIENTE"."SOCIEDAD",   
         		"SAP_AMPLIACION_CLIENTE"."ORGANIZACION",   
         		"SAP_AMPLIACION_CLIENTE"."ORIGEN_VENTA",   
         		"SAP_AMPLIACION_CLIENTE"."USO",
				"SAP_AMPLIACION_CLIENTE"."ESTADO_SAP",
				"SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP"
	FROM		"SAP_AMPLIACION_CLIENTE"
   	WHERE	("SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP" IS NULL AND "SAP_AMPLIACION_CLIENTE"."ESTADO_SAP"=3)
				//AND "SAP_AMPLIACION_CLIENTE"."RUT" = 11317252
	UNION
	SELECT DISTINCT	"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE",   
				"SAP_AMPLIACION_CLIENTE"."RUT",   
				"SAP_AMPLIACION_CLIENTE"."MANDT",   
				"SAP_AMPLIACION_CLIENTE"."GRUPO_CUENTA",   
				"SAP_AMPLIACION_CLIENTE"."SOCIEDAD",   
				"SAP_AMPLIACION_CLIENTE"."ORGANIZACION",   
				"SAP_AMPLIACION_CLIENTE"."ORIGEN_VENTA",   
				"SAP_AMPLIACION_CLIENTE"."USO",
				"SAP_AMPLIACION_CLIENTE"."ESTADO_SAP",
				"SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP"
	FROM		"SAP_AMPLIACION_CLIENTE","CLIENTE_REZAGO","CLIENTE"
	WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = "CLIENTE_REZAGO"."RUT" AND
				"SAP_AMPLIACION_CLIENTE"."RUT" = "CLIENTE"."RUT" AND
				("SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP" IS NOT NULL AND "SAP_AMPLIACION_CLIENTE"."ESTADO_SAP"=1) AND
				"CLIENTE_REZAGO"."NRO_CLIENTE_SAP" IS NOT NULL AND 
				"CLIENTE"."NRO_CLIENTE_SAP" IS NULL
				//AND "SAP_AMPLIACION_CLIENTE"."RUT" = 11317252
	UNION
	SELECT DISTINCT	"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE",   
				"SAP_AMPLIACION_CLIENTE"."RUT",   
				"SAP_AMPLIACION_CLIENTE"."MANDT",   
				"SAP_AMPLIACION_CLIENTE"."GRUPO_CUENTA",   
				"SAP_AMPLIACION_CLIENTE"."SOCIEDAD",   
				"SAP_AMPLIACION_CLIENTE"."ORGANIZACION",   
				"SAP_AMPLIACION_CLIENTE"."ORIGEN_VENTA",   
				"SAP_AMPLIACION_CLIENTE"."USO",
				"SAP_AMPLIACION_CLIENTE"."ESTADO_SAP",
				"SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP"
	FROM		"SAP_AMPLIACION_CLIENTE","CLIENTE_REZAGO","CLIENTE"
	WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = "CLIENTE_REZAGO"."RUT" AND
				"SAP_AMPLIACION_CLIENTE"."RUT" = "CLIENTE"."RUT" AND
				("SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP" IS NOT NULL AND "SAP_AMPLIACION_CLIENTE"."ESTADO_SAP"=1) AND
				"CLIENTE"."NRO_CLIENTE_SAP" IS NOT NULL AND 
				"CLIENTE_REZAGO"."NRO_CLIENTE_SAP" IS NULL	
				//AND "SAP_AMPLIACION_CLIENTE"."RUT" = 11317252
	ORDER BY 9 ASC, 10 ASC
	USING	sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			fetch x1 into :ls_tipo_cliente, :ldb_rut, :ls_mandante, :ls_grupo, :ls_sociedad, :ls_organizacion, :ls_origen, :ls_uso, :ll_estado,:ls_nro_cliente;
			if not isnull(ls_tipo_cliente) and ls_tipo_cliente<>'' and not isnull(ldb_rut) and ldb_rut>0 and not isnull(ls_mandante) and ls_mandante<>'' and not isnull(ls_sociedad) and ls_sociedad<>''  then
				
				if gl_cod_parque=104 then
//					if isnull(ls_dv_registro) then
//						ls_dv_registro			= ''
//					end if
//					if isnull(ls_dv_anexo) then
//						ls_dv_anexo			= ''
//					end if
//					ls_rut						= string(ldb_rut)+ls_dv_registro+ls_dv_anexo
				else
					ls_dv						= string(gf_obtener_dv(ldb_rut))
					ls_rut						= string(ldb_rut)+'-'+ls_dv
				end if
				
				ls_nro_sap					= f_vista_cliente_sap(ls_grupo,ls_sociedad,ls_organizacion,ls_uso,ls_origen,ls_rut)
				if not isnull(ls_nro_sap) and ls_nro_sap<>'' then
					UPDATE	"CLIENTE"  
					SET 		"ESTADO_SAP" = 1,   
								"NRO_CLIENTE_SAP" = :ls_nro_sap  
					WHERE	"CLIENTE"."RUT" = :ldb_rut
					USING	Trans_1;
					if Trans_1.sqlcode=0 then
						commit using Trans_1;
					else
						rollback using Trans_1;
					end if
					
					UPDATE	"CLIENTE_REZAGO"  
					SET 		"ESTADO_SAP" = 1,   
								"NRO_CLIENTE_SAP" = :ls_nro_sap
					WHERE	"CLIENTE_REZAGO"."RUT" = :ldb_rut
					USING	Trans_1;
					if Trans_1.sqlcode=0 then
						commit using Trans_1;
					else
						rollback using Trans_1;
					end if
					
					UPDATE	"SAP_AMPLIACION_CLIENTE"  
					SET		"NRO_CLIENTE_SAP" = :ls_nro_sap
					WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
								"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario 
					USING	Trans_1;
					if Trans_1.sqlcode=0 then
						commit using Trans_1;
					else
						rollback using Trans_1;
					end if
					
					UPDATE	"SAP_AMPLIACION_CLIENTE"  
					SET		"ESTADO_SAP" = 1
					WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
								"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario AND  
								"SAP_AMPLIACION_CLIENTE"."GRUPO_CUENTA" = :ls_grupo AND
								"SAP_AMPLIACION_CLIENTE"."SOCIEDAD" = :ls_sociedad AND
								"SAP_AMPLIACION_CLIENTE"."ORGANIZACION" = :ls_organizacion AND
								"SAP_AMPLIACION_CLIENTE"."ORIGEN_VENTA" = :ls_origen AND
								"SAP_AMPLIACION_CLIENTE"."USO" = :ls_uso 
					USING	Trans_1;
					if Trans_1.sqlcode=0 then
						commit using Trans_1;
						ll_graba++
					else
						rollback using Trans_1;
						ll_no_graba++
					end if
				end if
			end if
			Setnull(ls_tipo_cliente);Setnull(ldb_rut);Setnull(ls_mandante);Setnull(ls_grupo);Setnull(ls_sociedad);Setnull(ls_organizacion);Setnull(ls_origen);Setnull(ls_uso);setnull(ll_estado);setnull(ls_nro_cliente);setnull(ls_nro_cliente)
			
			if ldb_tot_porc <> ldb_tot_porc_aux then 
				ldb_tot_porc_aux							= ldb_tot_porc
			end if
			ldb_tot_porc										= ((ll_graba ) / ll_tot_gen) * 100
			hpb_1.Position 									= ldb_tot_porc
			dw_cliente.accepttext()
		loop
	end if
	close x1;
	
	dw_cliente.reset()
	SetPointer(Arrow!)
	messagebox("Grabar",'Proceso Terminado :~r~n'+string(ll_graba,'###,###,##0')+' Clientes Grabados con Exito en SAP~r~n'+&
				''+string(ll_no_graba,'###,###,##0')+' Clientes No Actualizados en SAP.',information!)
	hpb_1.Position 											= 0
	dw_cliente.accepttext()
	
end if
end event

type cb_13 from commandbutton within w_sap_cargas
integer x = 4544
integer y = 468
integer width = 411
integer height = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crear Cliente"
end type

event clicked;//string		ls_dv,ls_grupo_cta,ls_sociedad,ls_tipo_vta,ls_uso,ls_origen_vta,ls_string,ls_moneda,ls_pais,ls_amplia,ls_nro_sap,ls_actualiz,ls_tipo_cliente,ls_tipo_c,ls_tipo_a
//long 		ll_tot_reg,ll_fila,ll_res,ll_indi,ll_ano,ll_cta,ll_graba=0,ll_no_graba=0,ll_estado,ll_existe
//double	ldb_rut,ldb_tot_porc=0,ldb_tot_porc_aux=0
//
//dw_cliente.accepttext()
//ll_tot_reg									= dw_cliente.rowcount()
//if ll_tot_reg=0 then
//	messagebox("Advertencia","No Registra Cliente par Carga SAP")
//else
//	ll_fila 										= dw_cliente.Find("estado_reg = 1",1, ll_tot_reg)
//	if ll_fila=0 then 
//		messagebox("Advertencia","Debe Seleccionar Clientes para Traspaso A SAP")
//	else
//		ll_res									= MessageBox("Advertencia","¿Desea Generar Traspaso de Clientes a SAP?", Exclamation!, YesNo!, 2)
//		if ll_res=1 then
//			dw_cliente.accepttext()
//			dw_cliente.setFilter( "estado_reg = 1")
//			dw_cliente.filter()
//			dw_cliente.accepttext()
//			ll_tot_reg				= dw_cliente.rowcount()
//			SetPointer(HourGlass!)
//			st_fondo.visible					= true
//			st_cuenta.visible				= true
//			hpb_1.visible 					= true
//			st_porc.visible 					= true
//			hpb_1.Position					= ldb_tot_porc
//			
//			for	ll_indi=1 to ll_tot_reg
//				ldb_rut						= dw_cliente.getitemnumber(ll_indi,'rut')
//				ls_dv							= dw_cliente.getitemstring(ll_indi,'dv')
//				ls_grupo_cta				= dw_cliente.getitemstring(ll_indi,'grupo_cta')
//				ls_sociedad					= dw_cliente.getitemstring(ll_indi,'sociedad')
//				ls_tipo_vta					= dw_cliente.getitemstring(ll_indi,'organ_venta')
//				ls_uso						= dw_cliente.getitemstring(ll_indi,'uso')
//				ls_origen_vta				= dw_cliente.getitemstring(ll_indi,'tipo_venta')
//				ll_ano							= dw_cliente.getitemnumber(ll_indi,'ano_renta')
//				ls_moneda					= dw_cliente.getitemstring(ll_indi,'uwaer')
//				ls_pais						= dw_cliente.getitemstring(ll_indi,'pais')
//								
//				if not isnull(ldb_rut) and ldb_rut>0 and not isnull(ls_dv) and ls_dv<>'' then
//					ls_string					= trim(trim(string(ldb_rut))+'-'+ls_dv)
//					
//					ll_existe					= f_existe_ora(ldb_rut)
//					if ll_existe= 0 then
//						ls_tipo_cliente		= 'C'
//					elseif ll_existe= 1 then
//						SELECT	distinct "SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE"
//						INTO		:ls_tipo_cliente
//						FROM		"SAP_AMPLIACION_CLIENTE"
//						WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
//									"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario and
//									"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE" = 'C'
//						USING	sqlca;
//						if sqlca.sqlcode=0 then
//							ls_tipo_cliente		= 'C'
//							SELECT	distinct "SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE"
//							INTO		:ls_tipo_a
//							FROM		"SAP_AMPLIACION_CLIENTE"
//							WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
//										"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario and
//										"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE" = 'A'
//							USING	sqlca;
//							if sqlca.sqlcode=0 then
//								UPDATE	"SAP_AMPLIACION_CLIENTE"  
//								SET		"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE" =:ls_tipo_cliente
//								WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
//											"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario 
//								USING	sqlca;
//								if sqlca.sqlcode=0 then
//									commit using sqlca;
//								else
//									rollback using sqlca;
//								end if
//							else
//								ls_tipo_cliente		= 'A'
//							end  if
//						end if		
//					else		
//						ls_tipo_cliente		= 'A'
//					end if
//					
//					ll_cta						= f_tipo_cliente(ls_grupo_cta,ls_sociedad,ls_tipo_vta,ls_uso,ls_origen_vta,ldb_rut)
//					if ll_cta =0 then
//						f_amplia_cliente(ls_string,ls_grupo_cta,ls_sociedad,ls_tipo_vta,ls_uso,ls_origen_vta,ls_moneda,ll_ano,ls_pais,ls_tipo_cliente)
//					end if
//					
//					if is_tipo	= 'R' then
//						ls_nro_sap				= f_existe_sap(ls_string)
//						if not isnull(ls_nro_sap) and ls_nro_sap<>'' then
//							ll_estado				= 1
//						else
//							ll_estado				= 3
//						end if
//						UPDATE	"CLIENTE"  
//						SET 		"ESTADO_SAP" = :ll_estado,   
//									"FECHA_SAP" = :gdt_fec_sistema,   
//									"NRO_CLIENTE_SAP" = :ls_nro_sap  
//						WHERE	"CLIENTE"."RUT" = :ldb_rut
//						USING	sqlca;
//						if sqlca.sqlcode=0 then
//							commit using sqlca;
//						else
//							rollback using sqlca;
//						end if
//							
//						UPDATE	"SAP_AMPLIACION_CLIENTE"  
//						SET		"ESTADO_SAP" =1,   
//									"NRO_CLIENTE_SAP" = :ls_nro_sap,
//									"TIPO_CLIENTE" = :ls_tipo_cliente
//						WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
//									"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario AND  
//									"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE" = :ls_tipo_cliente
//						USING	sqlca;
//						if sqlca.sqlcode=0 then
//							commit using sqlca;
//						else
//							rollback using sqlca;
//						end if
//					elseif is_tipo	= 'C' then
//						ls_nro_sap				= f_vista_cliente_sap(ls_grupo_cta,ls_sociedad,ls_tipo_vta,ls_uso,ls_origen_vta,ls_string)
//						if isnull(ls_nro_sap) or ls_nro_sap='' then
//							f_direccion_url(ls_tipo_cliente,ldb_rut)
//						else
//							if ls_tipo_cliente='C' then
//								ls_nro_sap				= f_existe_sap(ls_string)
//								if not isnull(ls_nro_sap) and ls_nro_sap<>'' then
//									ll_estado				= 1
//								else
//									ll_estado				= 3
//								end if
//									
//								UPDATE	"CLIENTE"  
//								SET 		"ESTADO_SAP" =:ll_estado,   
//											"FECHA_SAP" = :gdt_fec_sistema,   
//											"NRO_CLIENTE_SAP" = :ls_nro_sap  
//								WHERE	"CLIENTE"."RUT" = :ldb_rut
//								USING	sqlca;
//								if sqlca.sqlcode=0 then
//									commit using sqlca;
//								else
//									rollback using sqlca;
//								end if
//								UPDATE	"SAP_AMPLIACION_CLIENTE"  
//								SET		"ESTADO_SAP" =1,   
//											"NRO_CLIENTE_SAP" = :ls_nro_sap,
//											"TIPO_CLIENTE" = :ls_tipo_cliente
//								WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
//											"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario AND  
//											"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE" = :ls_tipo_cliente
//								USING	sqlca;
//								if sqlca.sqlcode=0 then
//									commit using sqlca;
//								else
//									rollback using sqlca;
//								end if
//							elseif ls_tipo_cliente='A' then
//								ls_nro_sap				= f_vista_cliente_sap(ls_grupo_cta,ls_sociedad,ls_tipo_vta,ls_uso,ls_origen_vta,ls_string)
//								if not isnull(ls_nro_sap) and ls_nro_sap<>'' then
//									ll_estado				= 1
//								else
//									ll_estado				= 3
//								end if
//								UPDATE	"SAP_AMPLIACION_CLIENTE"  
//								SET		"ESTADO_SAP" =:ll_estado,   
//											"NRO_CLIENTE_SAP" = :ls_nro_sap
//								WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
//											"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario AND  
//											"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE" = :ls_tipo_cliente AND
//											"SAP_AMPLIACION_CLIENTE"."GRUPO_CUENTA" = :ls_grupo_cta AND
//											"SAP_AMPLIACION_CLIENTE"."SOCIEDAD" = :ls_sociedad AND
//											"SAP_AMPLIACION_CLIENTE"."ORGANIZACION" = :ls_tipo_vta AND
//											"SAP_AMPLIACION_CLIENTE"."ORIGEN_VENTA" = :ls_origen_vta AND
//											"SAP_AMPLIACION_CLIENTE"."USO" = :ls_uso 
//								USING	sqlca;
//								if sqlca.sqlcode=0 then
//									commit using sqlca;
//								else
//									rollback using sqlca;
//								end if
//							end if
//						end if
//					end if
//				end if 
//				setnull(ls_nro_sap)
//				if ldb_tot_porc <> ldb_tot_porc_aux then 
//					st_porc.text									= string(ldb_tot_porc,'#0.00')+" %"
//					ldb_tot_porc_aux							= ldb_tot_porc
//				end if
//				
//				ldb_tot_porc										= (ll_indi / ll_tot_reg) * 100
//				hpb_1.Position 									= ldb_tot_porc
//				st_cuenta.text 									= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+' Reg. Cálculados '+string(ll_indi,'###,###,###')+' ( '+string((ll_indi*100)/ll_tot_reg,'#0.00')+'% )'+' Seg por Reg.: '+string(15) 
//				dw_cliente.accepttext()
//			next
//			dw_cliente.accepttext()
//			
//			st_fondo.visible										= false
//			st_cuenta.visible									= false
//			hpb_1.visible 										= false
//			st_porc.visible 										= false
//			SetPointer(Arrow!)
//			messagebox("Grabar",'Proceso Terminado :~r~n'+string(ll_graba,'###,###,##0')+' Clientes Grabados con Exito en SAP~r~n'+&
//										'y '+string(ll_no_graba,'###,###,##0')+' Clientes No Grabados en SAP.',information!)
//		end if
//	end if
//end if
end event

type cb_carga_masivas from commandbutton within w_sap_cargas
boolean visible = false
integer x = 23
integer y = 356
integer width = 457
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Carga Clientes"
end type

event clicked;string		ls_grupo_cta,ls_sociedad,ls_organ_vta,ls_origen_vta,ls_uso,ls_tipo_carga,ls_tipo_cliente,ls_dv,ls_moneda,ls_pais,ls_nro_cliente_sap,ls_dv_registro,ls_dv_anexo
long		ll_tot_reg,ll_fila,ll_res,ll_indi,ll_existe,ll_estado,ll_graba=0,ll_ano_renta,ll_boleta
double	ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_rut

dw_cliente.accepttext()
ll_tot_reg										= dw_cliente.rowcount()
if ll_tot_reg=0 then
	dw_cliente.dataobject						= 'dw_numero_cliente_ampliacion'
	dw_cliente.settransobject(sqlca)
	ll_tot_reg									= dw_cliente.retrieve('C')	
	dw_cliente.accepttext()
else
	ll_fila 											= dw_cliente.Find("estado_reg = 1",1, ll_tot_reg)
	if ll_fila=0 then 
		messagebox("Advertencia","Debe Seleccionar Clientes para Traspaso A SAP")
	else
		ll_res										= MessageBox("Advertencia","¿Desea Generar Traspaso de Clientes a SAP?", Exclamation!, YesNo!, 2)
		if ll_res=1 then
			dw_cliente.accepttext()
			dw_cliente.setFilter( "estado_reg = 1")
			dw_cliente.filter()
			dw_cliente.accepttext()
			ll_tot_reg							= dw_cliente.rowcount()
			SetPointer(HourGlass!)
			if ll_tot_reg>0 then
				hpb_1.Position					= ldb_tot_porc
				for	ll_indi=1 to ll_tot_reg
					ldb_rut						= dw_cliente.getitemnumber(ll_indi,'rut')
					ls_dv							= dw_cliente.getitemstring(ll_indi,'dv')
					ls_grupo_cta				= dw_cliente.getitemstring(ll_indi,'grupo_cta')
					ls_sociedad					= dw_cliente.getitemstring(ll_indi,'sociedad')
					ls_organ_vta				= dw_cliente.getitemstring(ll_indi,'organ_venta')
					ls_origen_vta				= dw_cliente.getitemstring(ll_indi,'tipo_venta')
					ls_uso						= dw_cliente.getitemstring(ll_indi,'uso')
					ls_tipo_carga				= dw_cliente.getitemstring(ll_indi,'tipo')
					ls_moneda					= dw_cliente.getitemstring(ll_indi,'uwaer')
					ll_ano_renta					= dw_cliente.getitemnumber(ll_indi,'ano_renta')
					ls_pais						= dw_cliente.getitemstring(ll_indi,'pais')
					ls_nro_cliente_sap			= dw_cliente.getitemstring(ll_indi,'nro_cliente_sap')
					ll_boleta						= dw_cliente.getitemnumber(ll_indi,'folio')
					if gl_cod_parque=104 then
						ls_dv_registro			= dw_cliente.getitemstring(ll_indi,'dv_registro')
						ls_dv_anexo				= dw_cliente.getitemstring(ll_indi,'dv_anexo')
					end if
					
					SELECT	count("SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE")
					INTO		:ll_existe
					FROM		"SAP_AMPLIACION_CLIENTE"
					WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" =:ldb_rut AND  
								"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario
					USING	sqlca;
					if isnull(ll_existe) then ll_existe=0
					if ll_existe=0 then
						ls_tipo_cliente			= 'C'
						ll_estado					= 2
					else
						SELECT	DISTINCT "SAP_AMPLIACION_CLIENTE"."NRO_CLIENTE_SAP"
						INTO		:ls_nro_cliente_sap
						FROM		"SAP_AMPLIACION_CLIENTE"
						WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" =:ldb_rut AND  
									"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario
						USING	sqlca;
						ls_tipo_cliente			= 'A'
						ll_estado					= 3	
        				end if
					
					SELECT	count("SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE")
					INTO		:ll_existe
					FROM		"SAP_AMPLIACION_CLIENTE"
					WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
								"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario AND  
								"SAP_AMPLIACION_CLIENTE"."GRUPO_CUENTA" = :ls_grupo_cta AND  
								"SAP_AMPLIACION_CLIENTE"."SOCIEDAD" = :ls_sociedad AND  
								"SAP_AMPLIACION_CLIENTE"."ORGANIZACION" = :ls_organ_vta AND  
								"SAP_AMPLIACION_CLIENTE"."ORIGEN_VENTA" = :ls_origen_vta AND  
								"SAP_AMPLIACION_CLIENTE"."USO" = :ls_uso
					USING	sqlca;
					if isnull(ll_existe) then ll_existe=0
        				if ll_existe=0 then
						INSERT INTO "SAP_AMPLIACION_CLIENTE"  
									("RUT",		"MANDT",			"GRUPO_CUENTA",	"SOCIEDAD",	"ORGANIZACION",	"ESTADO_SAP",	"FECHA_SAP",	"NRO_CLIENTE_SAP",	"FECHA_CREACION",	"RUT_DV",	"ORIGEN_VENTA",	"USO",	"TIPO_CLIENTE",	"MONEDA",		"ANO_RENTA",	"PAIS",   "USUARIO_CREADOR")  
						VALUES	(:ldb_rut,	:gs_mandatario,	:ls_grupo_cta,			:ls_sociedad,	:ls_organ_vta,		:ll_estado,			null,				 :ls_nro_cliente_sap,	:gdt_fec_sistema,		:ls_dv,		:ls_origen_vta,		:ls_uso,	:ls_tipo_cliente,	:ls_moneda,		:ll_ano_renta,	:ls_pais,  :gs_user)
						USING	Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
							if ls_tipo_cliente= 'C' then
								if gl_cod_parque=104 then
									f_amplia_cliente(string(ldb_rut),ls_grupo_cta,'BO21','SE21',ls_uso,ls_origen_vta,ls_moneda,ll_ano_renta,ls_pais,'A',ls_dv_registro,ls_dv_anexo)
								end if
								
								UPDATE	"CLIENTE_REZAGO"  
								SET 		"ESTADO_SAP" = 2
								WHERE	"CLIENTE_REZAGO"."RUT" = :ldb_rut and
											"CLIENTE_REZAGO"."FOLIO" = :ll_boleta
								USING	sqlca;
								if sqlca.sqlcode=0 then
									commit using sqlca;
								else
									rollback using sqlca;
								end if
								
								UPDATE	"CLIENTE"  
								SET 		"ESTADO_SAP" = 2
								WHERE	"CLIENTE"."RUT" = :ldb_rut
								USING	sqlca;
								if sqlca.sqlcode=0 then
									commit using sqlca;
								else
									rollback using sqlca;
								end if
							end if
						else
							rollback using Trans_1;
						end if
					end if
					ldb_tot_porc					= (ll_indi / ll_tot_reg) * 100
					hpb_1.Position 				= ldb_tot_porc
					dw_cliente.accepttext()
				next
				dw_cliente.dataobject				= 'dw_numero_cliente_ampliacion'
				dw_cliente.settransobject(sqlca)
				ll_tot_reg							= dw_cliente.retrieve()	
				dw_cliente.accepttext()
			end if
			SetPointer(Arrow!)
		end if
	end if
end if
end event

type cb_12 from commandbutton within w_sap_cargas
integer x = 4526
integer y = 352
integer width = 457
integer height = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Amplia Clientes"
end type

event clicked;//string	ls_nulo
//
//setnull(ls_nulo)
//cb_crea_ctto.enabled						= false
//cb_modif_ctto.enabled					= false
//cb_rescil_ctto.enabled					= false
//
//dw_cliente.dataobject	= 'dw_sap_z001_carga_cliente_amplia'
//dw_cliente.settransobject(sqlca)
//dw_cliente.retrieve('C')
//is_tipo										= 'A'
//
end event

type cb_10 from commandbutton within w_sap_cargas
integer x = 530
integer y = 940
integer width = 462
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crear Clientes"
end type

event clicked;string		ls_tipo_cliente,ls_nro_sap,ls_dv,ls_sociedad,ls_organ_vta,ls_uso,ls_origen_vta,ls_grupo_cta,ls_rut,ls_moneda,ls_pais,ls_organizacion,ls_tipo_carga,ls_xml
long		ll_tot_reg,ll_fila,ll_res,ll_indi,ll_graba=0,ll_no_graba,ll_estado,ll_ano
double	ldb_rut,ldb_tot_porc=0,ldb_tot_porc_aux=0

dw_cliente.accepttext()
ll_tot_reg							= dw_cliente.rowcount()
ll_fila 									= dw_cliente.Find("estado_reg = 1",1, ll_tot_reg)
if ll_fila=0 then 
	messagebox("Advertencia","Debe Seleccionar Clientes para Traspaso A SAP")
else
	ll_res										= MessageBox("Advertencia","¿Desea Generar Traspaso de Clientes a SAP?", Exclamation!, YesNo!, 2)
	if ll_res=1 then
		dw_cliente.accepttext()
		dw_cliente.setFilter( "estado_reg = 1")
		dw_cliente.filter()
		dw_cliente.accepttext()
		ll_tot_reg						= dw_cliente.rowcount()
		SetPointer(HourGlass!)
		if ll_tot_reg>0 then
			hpb_1.Position				= ldb_tot_porc
			for	ll_indi=1 to ll_tot_reg
				ldb_rut					= dw_cliente.getitemnumber(ll_indi,'rut')
				ls_dv						= dw_cliente.getitemstring(ll_indi,'rut_dv')
				ls_grupo_cta			= dw_cliente.getitemstring(ll_indi,'grupo_cuenta')
				ls_sociedad				= dw_cliente.getitemstring(ll_indi,'sociedad')
				ls_organizacion			= dw_cliente.getitemstring(ll_indi,'organizacion')
				ls_uso					= dw_cliente.getitemstring(ll_indi,'uso')
				ls_origen_vta			= dw_cliente.getitemstring(ll_indi,'origen_venta')
				ll_ano						= dw_cliente.getitemnumber(ll_indi,'ano_renta')
				ls_moneda				= dw_cliente.getitemstring(ll_indi,'moneda')
				ls_pais					= dw_cliente.getitemstring(ll_indi,'pais')
				ls_tipo_cliente			= dw_cliente.getitemstring(ll_indi,'tipo_cliente')
				ls_tipo_carga			= dw_cliente.getitemstring(ll_indi,'tipo')
								
				if not isnull(ldb_rut) and ldb_rut>0 then
					ls_rut					= string(ldb_rut)+'-'+ls_dv
					ls_nro_sap			= f_vista_cliente_sap(ls_grupo_cta,ls_sociedad,ls_organizacion,ls_uso,ls_origen_vta,ls_rut)
					SELECT	SYSDATE
					INTO 		:gdt_fec_sistema
					FROM		"TASA"  
					WHERE	"TASA"."LOOK" = 1   
					USING	Trans_2;
					if ls_tipo_cliente = 'C' then
						if ls_tipo_carga='CC' then
							UPDATE	"CLIENTE"  
							SET 		"FECHA_SAP" = :gdt_fec_sistema  
							WHERE	"CLIENTE"."RUT" = :ldb_rut
							USING	sqlca;
						elseif ls_tipo_carga='CR' then
							UPDATE	"CLIENTE_REZAGO"  
							SET 		"FECHA_SAP" = :gdt_fec_sistema  
							WHERE	"CLIENTE_REZAGO"."RUT" = :ldb_rut 
							USING	sqlca;
						end if
						if sqlca.sqlcode=0 then
							commit using sqlca;
						else
							rollback using sqlca;
						end if
					end if
					
					UPDATE	"SAP_AMPLIACION_CLIENTE"  
					SET		"FECHA_SAP" = :gdt_fec_sistema
					WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
								"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario AND  
								"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE" = :ls_tipo_cliente AND
								"SAP_AMPLIACION_CLIENTE"."GRUPO_CUENTA" = :ls_grupo_cta AND
								"SAP_AMPLIACION_CLIENTE"."SOCIEDAD" = :ls_sociedad AND
								"SAP_AMPLIACION_CLIENTE"."ORGANIZACION" = :ls_organizacion AND
								"SAP_AMPLIACION_CLIENTE"."ORIGEN_VENTA" = :ls_origen_vta AND
								"SAP_AMPLIACION_CLIENTE"."USO" = :ls_uso and
								"SAP_AMPLIACION_CLIENTE"."TIPO_CLIENTE" = :ls_tipo_cliente 								
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit using sqlca;
					else
						rollback using sqlca;
					end if
					
					if cbx_xml_cliente.checked= true then
						ls_xml					= 'no'
					elseif cbx_xml_cliente.checked= false then
						ls_xml					= 'si'
					end if
					
					if isnull(ls_nro_sap) or ls_nro_sap='' then
						f_direccion_url(ls_tipo_cliente,ldb_rut,ls_xml)
					end if
				end if
			next
			dw_cliente.reset()
		end if
	end if
end if




end event

type cb_9 from commandbutton within w_sap_cargas
integer x = 4544
integer y = 584
integer width = 421
integer height = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Resp_mensaje"
end type

event clicked;//SELECT 	"SAP_GRUPO_CUENTA"."CODIGO"||'-'||"SAP_GRUPO_CUENTA"."DESCRIPCION"
//						INTO		:ls_des_grupo_cta
//						FROM 	"SAP_GRUPO_CUENTA"  
//						WHERE	"SAP_GRUPO_CUENTA"."CODIGO" =:ls_grupo_cta AND
//									"SAP_GRUPO_CUENTA"."ESTADO" = 'V'
//						USING	sqlca;
//						if isnull(ls_des_grupo_cta) then ls_des_grupo_cta=''
//						
//						SELECT	"SAP_SOCIEDAD"."CODIGO"||'-'||"SAP_SOCIEDAD"."DESCRIPCION"
//						INTO		:ls_des_sociedad
//						FROM 	"SAP_SOCIEDAD"  
//						WHERE	"SAP_SOCIEDAD"."CODIGO" = :ls_sociedad and
//									"SAP_SOCIEDAD"."ESTADO" = 'V'
//						USING	sqlca;
//						if isnull(ls_des_sociedad) then ls_des_sociedad=''    
//						
//						SELECT 	"SAP_ORGANIZACION_VENTA"."CODIGO"||'-'||"SAP_ORGANIZACION_VENTA"."DESCRIPCION"
//						INTO		:ls_des_tipo_vta
//						FROM 	"SAP_ORGANIZACION_VENTA"  
//						WHERE  "SAP_ORGANIZACION_VENTA"."CODIGO"= :ls_tipo_vta AND
//									"SAP_ORGANIZACION_VENTA"."ESTADO" = 'V' 
//						USING	sqlca;
//						if isnull(ls_des_tipo_vta) then ls_des_tipo_vta=''
//						
//						SELECT	"TIPO_VENTA"."CODIGO_SAP"||'-'||MAX("TIPO_VENTA"."DESCRIPCION")
//						INTO		:ls_des_origen	
//						FROM 	"TIPO_VENTA" 
//						WHERE	"TIPO_VENTA"."CODIGO_SAP"  = :ls_origen_vta
//						GROUP BY "TIPO_VENTA"."CODIGO_SAP"
//						USING	sqlca;
//						if isnull(ls_des_origen) then ls_des_origen=''

//	messagebox("Advertencia","Rut: "+ls_string+" Mandante: "+gs_mandatario+" Grupo Cuenta: "+ls_des_grupo_cta+" Para la Sociedad: "+ls_des_sociedad+" Tipo Venta. "+ls_des_tipo_vta+" Uso: "+ls_uso+" Origen Ventas: "+ls_des_origen+' ~r~n'+&
						//					'Se Encuentra Credor En SAP ',information!)
end event

type hpb_1 from hprogressbar within w_sap_cargas
integer x = 69
integer y = 72
integer width = 631
integer height = 48
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type cb_8 from commandbutton within w_sap_cargas
integer x = 23
integer y = 1212
integer width = 457
integer height = 112
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Desa.Cuotas"
end type

event clicked;string		ls_base,ls_serie,ls_tipo_deuda,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ls_tipo_cob,ls_forma_pago,ls_centro,ls_rev,&
			ls_centro_benef,ls_cod_mat_sap,ls_almacen,ls_sector,ls_sepult,ls_nro_tecnico,ls_fecha,ls_moneda,ls_clasif,ls_cod_jef,&
			ls_cod_sup,ls_cod_age,ls_area,ls_grupo_imput,ls_nro_ctto_sap,ls_ctto_asociado,ls_ctto_serv,ls_nro_cliente,ls_ok,&
			ls_folio_consul,ls_consul_nro_sap,ls_carga,ls_tipo_carga, ls_pasa='N',ls_nulo,ls_estado_fact,ls_cargo,ls_codigo
long		ret,ll_tot_reg,ll_fila,ll_res,ll_indi,ll_folio,ll_ctas_pact,ll_periodo_m,ll_cta_pag_s,ll_plazo,ll_posic_ubs,ll_estado_pie,ll_cod_parque,ll_ctas_pag_mant,ll_estado_cad,&
			ll_mora_recon,ll_fallec,ll_capac,ll_graba,ll_no_graba=0,ll_plazo_dc,ll_estado,ll_existe,ll_cta,ll_estado_cab,ll_estado_ubs,ll_estado_cta,ll_ctas_pag_post,ll_val_age,ll_val_sup,ll_val_jef
double	ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_numero,ldb_pie,ldb_pie_pag,ldb_cuota_m,ldb_tasa,ldb_rut,ldb_precio_dc,ldb_pie_dc,ldb_tasa_dc,&
			ldb_val_cta_dc,ldb_gto_adm_dc,ldb_rut_aval,ldb_porc_pago
datetime	ldt_fecha_ctto,ldt_fec_pie,ldt_fecha_m,ldt_fec_prim_dc,ldt_fec_cierre,ldt_fec_factura,ldt_fec_prim_fact,ldt_fecha_recon,ldt_nulo

Inet  iinet_base
ret = GetContextService("Internet", iinet_base)

setnull(ls_nulo);setnull(ldt_nulo)
dw_contrato.accepttext()
ll_tot_reg									= dw_contrato.rowcount()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Cliente par Carga SAP")
else
	ll_fila 										= dw_contrato.Find("estado_reg = 1",1, ll_tot_reg)
	if ll_fila=0 then 
		messagebox("Advertencia","Debe Seleccionar Clientes para Traspaso A SAP")
	else
		ll_res									= MessageBox("Advertencia","¿Desea Generar Traspaso de Contratos a SAP?", Exclamation!, YesNo!, 2)
		if ll_res=1 then
			
			dw_contrato.accepttext()
			dw_contrato.setFilter( "estado_reg = 1")
			dw_contrato.filter()
			dw_contrato.accepttext()
			ll_tot_reg						= dw_contrato.rowcount()
			SetPointer(HourGlass!)
			hpb_1.Position					= ldb_tot_porc
			
			for	ll_indi=1 to ll_tot_reg
				is_obsev_tot					= ''
				ls_nro_cliente				= dw_contrato.getitemstring(ll_indi,'nro_cliente_sap')
				ls_base						= dw_contrato.getitemstring(ll_indi,'base')
				ls_serie						= dw_contrato.getitemstring(ll_indi,'serie')
				ldb_numero					= dw_contrato.getitemnumber(ll_indi,'numero')
				ls_tipo_deuda				= dw_contrato.getitemstring(ll_indi,'tipo_deuda')
				
				ls_tipo_ctto					= dw_contrato.getitemstring(ll_indi,'tipo_ctto')
				ls_organiz					= dw_contrato.getitemstring(ll_indi,'organiz')
				ls_origen_vta				= dw_contrato.getitemstring(ll_indi,'origen_venta')
				ls_uso						= dw_contrato.getitemstring(ll_indi,'uso')
				
				ldt_fecha_ctto				= dw_contrato.getitemdatetime(ll_indi,'fecha_ctto')
				ll_folio						= dw_contrato.getitemnumber(ll_indi,'folio_coprob')
				ls_tipo_cob					= dw_contrato.getitemstring(ll_indi,'tipo_cob')
				
				ldb_pie						= dw_contrato.getitemnumber(ll_indi,'pie')
				ldb_pie_pag					= dw_contrato.getitemnumber(ll_indi,'pie_pagado')
				
				ll_ctas_pact					= dw_contrato.getitemnumber(ll_indi,'ctas_pactadas_pie')
				ldt_fec_pie					= dw_contrato.getitemdatetime(ll_indi,'fecha_pie')
				ldb_rut_aval					= dw_contrato.getitemnumber(ll_indi,'rut_aval')
				ldb_cuota_m				= dw_contrato.getitemnumber(ll_indi,'valor_cuota_m')
				ldt_fecha_m					= dw_contrato.getitemdatetime(ll_indi,'fecha_m')
				ll_periodo_m				= dw_contrato.getitemnumber(ll_indi,'perio_mant')
				ll_cta_pag_s					= dw_contrato.getitemnumber(ll_indi,'cta_pag_s')
				ldb_rut						= dw_contrato.getitemnumber(ll_indi,'rut')
				ls_forma_pago				= dw_contrato.getitemstring(ll_indi,'forma_pago')
				ls_centro						= dw_contrato.getitemstring(ll_indi,'centro')
				ls_centro_benef			= dw_contrato.getitemstring(ll_indi,'centro_benef')
				ls_cod_mat_sap			= dw_contrato.getitemstring(ll_indi,'codigo_material_sap')
				ls_almacen					= dw_contrato.getitemstring(ll_indi,'almacen')
				ls_sector						= dw_contrato.getitemstring(ll_indi,'sector')
				ls_sepult						= dw_contrato.getitemstring(ll_indi,'sepultura')
				ls_nro_tecnico				= dw_contrato.getitemstring(ll_indi,'nro_tecnico')
				ll_plazo						= dw_contrato.getitemnumber(ll_indi,'nro_cuotas')
				ldb_tasa						= dw_contrato.getitemnumber(ll_indi,'tasa_ctto')
				ll_posic_ubs					= dw_contrato.getitemnumber(ll_indi,'nro_posic_ubs')
				ll_mora_recon				= dw_contrato.getitemnumber(ll_indi,'mora_mant_recon')
				
				ls_fecha						= dw_contrato.getitemstring(ll_indi,'fecha')
				ls_moneda					= dw_contrato.getitemstring(ll_indi,'moneda')
				ls_clasif						= dw_contrato.getitemstring(ll_indi,'clasifica_venta')
				ll_fallec						= dw_contrato.getitemnumber(ll_indi,'fallecidos')
				
				ls_cod_age					= dw_contrato.getitemstring(ll_indi,'cod_age')
				ls_cargo						= 'A'
				ls_codigo						= f_sap_tabla_vtas_cargo(ls_cargo,ls_cod_age)
				if ls_codigo=ls_cod_age then
					ll_val_age				= 1
				else
					ll_val_age				= 0
				end if
				
				ls_cod_sup					= dw_contrato.getitemstring(ll_indi,'cod_sup')
				ls_cargo						= 'S'
				ls_codigo						= f_sap_tabla_vtas_cargo(ls_cargo,ls_cod_sup)
				if ls_codigo=ls_cod_sup then
					ll_val_sup				= 1
				else
					ll_val_sup				= 0
				end if
				
				ls_cod_jef					= dw_contrato.getitemstring(ll_indi,'cod_jef')
				ls_cargo						= 'J'
				ls_codigo						= f_sap_tabla_vtas_cargo(ls_cargo,ls_cod_jef)
				if ls_codigo=ls_cod_jef then
					ll_val_jef					= 1
				else
					ll_val_jef					= 0
				end if
				
				ls_area						= dw_contrato.getitemstring(ll_indi,'area')
				ll_capac						= dw_contrato.getitemnumber(ll_indi,'capacidad')
				ls_grupo_imput				= dw_contrato.getitemstring(ll_indi,'grupo_imputacion')
				ls_nro_ctto_sap			= dw_contrato.getitemstring(ll_indi,'nro_ctto_sap')
				ls_ctto_asociado			= dw_contrato.getitemstring(ll_indi,'ctto_asociado')
				ls_folio_consul				= ls_base+ls_serie+string(ldb_numero)
				ls_tipo_carga				= dw_contrato.getitemstring(ll_indi,'tipo_carga')
				if ls_tipo_carga='S' then
					ls_tipo_carga			= 'H'
				end if
				gl_cod_parque				= dw_contrato.getitemnumber(ll_indi,'cod_parque')
				ldb_porc_pago				= dw_contrato.getitemnumber(ll_indi,'porcentaje_pago')
				ldt_fec_cierre				= dw_contrato.getitemdatetime(ll_indi,'fecha_cierre')
				
				ls_consul_nro_sap			= f_vista_ctto_sap(gs_mandatario,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ls_folio_consul,ls_tipo_deuda,string(ll_folio))
	//			if not isnull(ls_consul_nro_sap) and ls_consul_nro_sap<>'' then	
	//				ll_existe					= 0
				if isnull(ls_consul_nro_sap) or ls_consul_nro_sap='' then
					ll_existe					= f_sap_cadena(ls_tipo_deuda,ls_base,ls_serie,ldb_numero,ll_folio)
					if ll_existe=0 then
						if ls_tipo_deuda='M' then
							SELECT	"CADENA"."FECHA_PRIM_FACTURA"  
    							INTO 		:ldt_fec_prim_fact  
    							FROM 	"CADENA"  
   							WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
         								( "CADENA"."SERIE" = :ls_serie ) AND  
         								( "CADENA"."NUMERO" = :ldb_numero )
							USING	sqlca;
							if isnull(ldt_fec_prim_fact) then ldt_fec_prim_fact = ldt_fec_cierre

							if ldt_fec_prim_fact= ldt_fec_cierre then
								ls_estado_fact			= 'N' 
								ls_grupo_imput			= 'M1'
							else
								
								SELECT	MAX("FECHA_FACTURA")
								INTO 		:ldt_fec_factura
								FROM		"SAP_FECHA_FACTURA"
								WHERE 	"SAP_FECHA_FACTURA"."ESTADO" = 'S'
								USING sqlca ;
								
								SELECT	"FACTURA_OFERTA"."PORCENTAJE_PAGO"
								INTO		:ldb_porc_pago
								FROM 	"FACTURA_OFERTA"  
								WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
											"FACTURA_OFERTA"."SERIE" = :ls_serie AND  
											"FACTURA_OFERTA"."NUMERO" = :ldb_numero AND  
											"FACTURA_OFERTA"."FECHA_CIERRE" = :ldt_fec_factura AND
											( "FACTURA_OFERTA"."ESTADO" = 'N' OR  "FACTURA_OFERTA"."ESTADO" = 'S')
								USING	sqlca;
								if isnull(ldb_porc_pago) then ldb_porc_pago=0
								
								ls_estado_fact			= 'H'
								if gl_cod_parque=101 and ldb_porc_pago>=25 then
									ls_grupo_imput		= 'M2'
								elseif gl_cod_parque<>101 and ldb_porc_pago>=15 then
									ls_grupo_imput		= 'M2'
								end if
								
								
//								ldt_fecha_recon		= datetime((RelativeDate(date(string('25/04/2016')),- 1)),time('18:30:00'))
//								
//								if not isnull(ldt_fecha_recon) then
//									ldt_fec_factura			= ldt_fecha_recon
//								end if
								
								SELECT  sum( "INGRESO"."CUOTAS_PAG")
								INTO    	:ll_ctas_pag_post
								FROM    	"INGRESO"  
								WHERE	( "INGRESO"."BASE" = :ls_base ) AND  
											( "INGRESO"."SERIE" = :ls_serie ) AND  
											( "INGRESO"."CONTRATO" = :ldb_numero ) AND  
											( "INGRESO"."TIPO_MOV" = 'F' ) AND  
											( "INGRESO"."PAGO_HIST" = 'A' )  AND 
											( "INGRESO"."FECHA_PAGO" > :ldt_fec_factura)
								USING	sqlca;
								if isnull(ll_ctas_pag_post) then ll_ctas_pag_post=0
								if ll_ctas_pag_post>0 then
									ll_mora_recon				= ll_mora_recon + ll_ctas_pag_post
									ll_cta_pag_s					= ll_cta_pag_s - ll_ctas_pag_post
										UPDATE	"FACTURA_OFERTA_INGRESO"  
									  	SET		"CTAS_PAG_MANT" = :ll_cta_pag_s  
										WHERE	"FACTURA_OFERTA_INGRESO"."BASE" = :ls_base AND  
													"FACTURA_OFERTA_INGRESO"."SERIE" = :ls_serie AND  
													"FACTURA_OFERTA_INGRESO"."NUMERO" = :ldb_numero
										USING	sqlca;
										if sqlca.sqlcode=0 then
											commit using sqlca;
										else
											rollback using sqlca;
										end if
								end if
								DECLARE sp_vencim PROCEDURE FOR  F_SAP_VCTO_MANTEN(:ls_base,:ls_serie,:ldb_numero);
								EXECUTE sp_vencim;
								if sqlca.sqlcode=0 then
									fetch sp_vencim into :ldt_fecha_m;
									close sp_vencim;						
								end if
							end if
						end if
						
						DECLARE sap_cadena PROCEDURE FOR F_SAP_CARGA_SAP_CADENA(:ls_tipo_deuda,:ls_base,:ls_serie,:ldb_numero,:ll_folio,:ls_tipo_ctto,:ls_organiz,:ls_origen_vta,:ls_uso,:ldt_fecha_ctto,:ldb_pie,:ll_ctas_pact,:ldt_fec_pie,:ldb_rut_aval,:ldb_cuota_m,:ldt_fecha_m,:ll_periodo_m,:ll_cta_pag_s,:ldb_rut,:ls_forma_pago,:ls_centro,:ls_centro_benef,:ls_cod_mat_sap,:ls_almacen,:ls_sector,:ls_sepult,:ls_nro_tecnico,:ll_plazo,:ldb_tasa,:ll_posic_ubs,:ldb_pie_pag,:ll_mora_recon,:ls_nro_cliente,:ls_fecha,:ls_moneda,:ls_clasif,:ll_fallec,:ls_cod_jef,:ls_cod_sup,:ls_cod_age,:ls_area,:ll_capac,:ls_grupo_imput,:ls_nro_ctto_sap,:ls_ctto_asociado,:ls_ctto_serv,:ls_tipo_cob,:ls_tipo_carga,:gl_cod_parque,:ldb_porc_pago,:gs_user,:ldt_fec_cierre,:ll_val_age,:ll_val_sup,:ll_val_jef);
						EXECUTE sap_cadena;
						if sqlca.sqlcode=0 then
						fetch sap_cadena into :ll_estado_cad;
						close sap_cadena;
						end if
						
						//ls_carga				= f_insert_reg_sap(ls_tipo_deuda,ls_base,ls_serie,ldb_numero,ll_folio,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ldt_fecha_ctto,ldb_pie,ll_ctas_pact,ldt_fec_pie,ldb_rut_aval,ldb_cuota_m,ldt_fecha_m,ll_periodo_m,ll_cta_pag_s,ldb_rut,ls_forma_pago,ls_centro,ls_centro_benef,ls_cod_mat_sap,ls_almacen,ls_sector,ls_sepult,ls_nro_tecnico,ll_plazo,ldb_tasa,ll_posic_ubs,ldb_pie_pag,ll_mora_recon,ls_nro_cliente,ls_fecha,ls_moneda,ls_clasif,ll_fallec,ls_cod_jef,ls_cod_sup,ls_cod_age,ls_area,ll_capac,ls_grupo_imput,ls_nro_ctto_sap,ls_ctto_asociado,ls_ctto_serv,ls_tipo_cob,ls_tipo_carga)
						ll_estado_cab		= f_sap_ctto_01_cabec(ls_base,ls_serie,ldb_numero,ls_tipo_deuda,ll_folio,ldt_nulo)
						ll_estado_ubs		= f_sap_ctto_03_ubs(ls_base,ls_serie,ldb_numero,ls_tipo_deuda,ll_folio,ldt_nulo)
						ll_estado_pie		= f_sap_ctto_04_pie(ls_base,ls_serie,ldb_numero,ls_tipo_deuda)
						
						
						DECLARE sap_ctto_05_cta PROCEDURE FOR F_SAP_CARGA_CTTO_05(:ls_base,:ls_serie,:ldb_numero,:ls_tipo_deuda,:ll_mora_recon); 
						EXECUTE sap_ctto_05_cta;
						if sqlca.sqlcode=0 then
						fetch sap_ctto_05_cta into :ll_estado_cta;
						close sap_ctto_05_cta;
						end if
						
						
					end if
				end if
			next
		end if
	end if
end if
end event

type cb_7 from commandbutton within w_sap_cargas
integer x = 3397
integer y = 948
integer width = 229
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_cliente.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_cliente.SETSORT(NULO)
	dw_cliente.SORT()
end if
end event

type rb_4 from radiobutton within w_sap_cargas
integer x = 3703
integer y = 96
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
string text = "Todos"
end type

event clicked;string	ls_filtro

ls_filtro 			= "porcentaje_pago >= 0" 
dw_cliente.SetFilter(ls_filtro)
dw_cliente.Filter( )

dw_contrato.SetFilter(ls_filtro)
dw_contrato.Filter( )
end event

type rb_3 from radiobutton within w_sap_cargas
integer x = 2999
integer y = 96
integer width = 677
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Porce. Pago Menor 15%"
end type

event clicked;string	ls_filtro

ls_filtro 			= "porcentaje_pago < 15" 
dw_cliente.SetFilter(ls_filtro)
dw_cliente.Filter( )

dw_contrato.SetFilter(ls_filtro)
dw_contrato.Filter( )
end event

type rb_2 from radiobutton within w_sap_cargas
integer x = 2286
integer y = 96
integer width = 658
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Porce. Pago Mayor 15%"
end type

event clicked;string	ls_filtro

ls_filtro 			= "porcentaje_pago >= 15 and porcentaje_pago < 100" 
dw_cliente.SetFilter(ls_filtro)
dw_cliente.Filter( )

dw_contrato.SetFilter(ls_filtro)
dw_contrato.Filter( )
end event

type rb_1 from radiobutton within w_sap_cargas
integer x = 1719
integer y = 96
integer width = 594
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Porce. Pago 100%"
boolean checked = true
end type

event clicked;string	ls_filtro

ls_filtro 			= "porcentaje_pago >= 100" 
dw_cliente.SetFilter(ls_filtro)
dw_cliente.Filter( )

dw_contrato.SetFilter(ls_filtro)
dw_contrato.Filter( )
end event

type cb_6 from commandbutton within w_sap_cargas
integer x = 23
integer y = 1608
integer width = 457
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rescil Contratos"
end type

event clicked;cb_crea_ctto.enabled			= false
cb_modif_ctto.enabled		= false
cb_rescil_ctto.enabled		= true

DECLARE SP_SAP_ACTUAL_TIPO_DEUDA PROCEDURE FOR SP_SAP_ACTUAL_TIPO_DEUDA();
EXECUTE SP_SAP_ACTUAL_TIPO_DEUDA;

dw_contrato.dataobject		= 'dw_sap_rescil_contrato'
dw_contrato.settransobject(sqlca)
dw_contrato.retrieve()

end event

type cb_5 from commandbutton within w_sap_cargas
integer x = 23
integer y = 1496
integer width = 457
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modif Contratos"
end type

event clicked;cb_crea_ctto.enabled			= false
cb_modif_ctto.enabled		= true
cb_rescil_ctto.enabled		= false

DECLARE SP_SAP_ACTUAL_TIPO_DEUDA PROCEDURE FOR SP_SAP_ACTUAL_TIPO_DEUDA();
EXECUTE SP_SAP_ACTUAL_TIPO_DEUDA;

dw_contrato.dataobject				= 'dw_sap_modificacion_ctto'
dw_contrato.settransobject(sqlca)
dw_contrato.retrieve()

end event

type cb_4 from commandbutton within w_sap_cargas
integer x = 23
integer y = 240
integer width = 457
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Lista Clientes"
end type

event clicked;long	ll_tot_reg

dw_cliente.dataobject						= 'dw_sap_z001_carga_cliente'
dw_cliente.settransobject(sqlca)
ll_tot_reg									= dw_cliente.retrieve()	
end event

type cb_3 from commandbutton within w_sap_cargas
integer x = 23
integer y = 1376
integer width = 457
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Carga Servicios"
end type

event clicked;cb_crea_ctto.enabled			= true
cb_modif_ctto.enabled		= false
cb_rescil_ctto.enabled		= false

DECLARE SP_SAP_ACTUAL_TIPO_DEUDA PROCEDURE FOR SP_SAP_ACTUAL_TIPO_DEUDA();
EXECUTE SP_SAP_ACTUAL_TIPO_DEUDA;

dw_contrato.dataobject		= 'dw_sap_contrato_servicio_carga'
dw_contrato.settransobject(sqlca)
dw_contrato.retrieve()

end event

type cb_ctto from commandbutton within w_sap_cargas
integer x = 23
integer y = 1104
integer width = 457
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Lista Contratos"
end type

event clicked;cb_crea_ctto.enabled			= true
cb_modif_ctto.enabled		= false
cb_rescil_ctto.enabled		= false

DECLARE SP_SAP_ACTUAL_TIPO_DEUDA PROCEDURE FOR SP_SAP_ACTUAL_TIPO_DEUDA();
EXECUTE SP_SAP_ACTUAL_TIPO_DEUDA;

dw_contrato.dataobject		= 'dw_sap_contrato_carga'
dw_contrato.settransobject(sqlca)
dw_contrato.retrieve()

end event

type cb_1 from commandbutton within w_sap_cargas
integer x = 3630
integer y = 948
integer width = 229
integer height = 84
integer taborder = 70
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
dw_cliente.SETfilter(NULO)
dw_cliente.filter()
end event

type cb_rescil_ctto from commandbutton within w_sap_cargas
integer x = 2277
integer y = 2208
integer width = 361
integer height = 100
integer taborder = 180
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rescil. Cttos"
end type

event clicked;string		ls_base,ls_serie,ls_folio_consulta
long		ret,ll_tot_reg,ll_fila,ll_res,ll_indi,ll_ok,ll_graba=0
double	ldb_numero

Inet  iinet_base
ret = GetContextService("Internet", iinet_base)

dw_contrato.accepttext()
ll_tot_reg									= dw_contrato.rowcount()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Contratos a Resciliar en SAP")
else
	ll_fila 										= dw_contrato.Find("estado_reg = 1",1, ll_tot_reg)
	if ll_fila=0 then 
		messagebox("Advertencia","Debe Seleccionar Contratos Resciliar en SAP")
	else
		ll_res									= MessageBox("Advertencia","¿Desea Generar Resciliación de Contrato?", Exclamation!, YesNo!, 2)
		if ll_res=1 then
			dw_contrato.accepttext()
			dw_contrato.setFilter( "estado_reg = 1")
			dw_contrato.filter()
			dw_contrato.accepttext()
			ll_tot_reg						= dw_contrato.rowcount()
			SetPointer(HourGlass!)
//			st_fondo.visible					= true
//			st_cuenta.visible				= true
//			hpb_1.visible 					= true
//			st_porc.visible 					= true
//			hpb_1.Position					= ldb_tot_porc
			
			for	ll_indi=1 to ll_tot_reg
				ls_base						= dw_contrato.getitemstring(ll_indi,'cadena_codigo')
				ls_serie						= dw_contrato.getitemstring(ll_indi,'cadena_serie')
				ldb_numero					= dw_contrato.getitemnumber(ll_indi,'cadena_numero')
				ls_folio_consulta			= ls_base+ls_serie+string(ldb_numero)
				UPDATE	"CADENA"  
     			SET		"STATUS_MODIF_SAP" = 2
   				WHERE	( "CADENA"."CODIGO" = :ls_base ) AND  
        						( "CADENA"."SERIE" = :ls_serie ) AND  
         					( "CADENA"."NUMERO" = :ldb_numero )
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
					UPDATE	"SAP_CADENA"  
					SET		"STATUS_MODIF_SAP" = 1
					WHERE	"SAP_CADENA"."BASE" = :ls_base AND  
								"SAP_CADENA"."SERIE" = :ls_serie AND  
								"SAP_CADENA"."NUMERO" = :ldb_numero AND
								"SAP_CADENA"."ESTADO" = 'V'
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit using sqlca;
					else
						rollback using sqlca;
					end if
				else
					rollback using sqlca;
				end if
				
				if ret = -1 then
					messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
					return
				end if
				
				if gs_sap_conex='P' then
					if gl_cod_parque=104 then
						ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/reciliacion.php?cod="+ls_folio_consulta+"&conexion=N")
					elseif gl_cod_parque=11 then
						ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/reciliacion.php?cod="+ls_folio_consulta+"&conexion=F")
					else
						ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/reciliacion.php?cod="+ls_folio_consulta+"&conexion=P")
					end if
				elseif gs_sap_conex='Q' then
					if gl_cod_parque=104 then
						ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/reciliacion2.php?cod="+ls_folio_consulta+"&conexion=QN")
					elseif gl_cod_parque=11 then
						ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/reciliacion2.php?cod="+ls_folio_consulta+"&conexion=QF")
					else
						ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/reciliacion2.php?cod="+ls_folio_consulta+"&conexion=QP")
					end if
				elseif gs_sap_conex='R' then
					if gl_cod_parque=104 then
						ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/reciliacion2.php?cod="+ls_folio_consulta+"&conexion=RN")
					elseif gl_cod_parque=11 then
						ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/reciliacion2.php?cod="+ls_folio_consulta+"&conexion=RF")
					else
						ret 				= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/reciliacion2.php?cod="+ls_folio_consulta+"&conexion=RP")
					end if	
				end if
				
				 f_tiempo('RESC','')
			
				UPDATE	"CADENA"  
				SET		"STATUS_MODIF_SAP" = 1
				WHERE	( "CADENA"."CODIGO" = :ls_base ) AND  
							( "CADENA"."SERIE" = :ls_serie ) AND  
							( "CADENA"."NUMERO" = :ldb_numero )
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
					UPDATE	"SAP_CADENA"  
					SET		"STATUS_MODIF_SAP" = 1
					WHERE	"SAP_CADENA"."BASE" = :ls_base AND  
								"SAP_CADENA"."SERIE" = :ls_serie AND  
								"SAP_CADENA"."NUMERO" = :ldb_numero AND
								"SAP_CADENA"."ESTADO" = 'V'
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit using sqlca;
						ll_graba++

					else
						rollback using sqlca;
					end if
				else
					rollback using sqlca;
				end if
			next
			if ll_tot_reg=ll_graba then
				messagebox("Advertencia","Modificación Existosa")
				ll_tot_reg							= dw_contrato.retrieve()
			end if
		end if
	end if
end if
end event

type cb_modif_ctto from commandbutton within w_sap_cargas
integer x = 1815
integer y = 2216
integer width = 443
integer height = 100
integer taborder = 170
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modif. Ctto. SAP"
end type

event clicked;string		ls_base,ls_serie,ls_folio_consulta,ls_ok,ls_tipo_deuda,ls_nro_sap
long		ret,ll_tot_reg,ll_fila,ll_res,ll_indi
double	ldb_numero

Inet  iinet_base
ret = GetContextService("Internet", iinet_base)

dw_contrato.accepttext()
ll_tot_reg									= dw_contrato.rowcount()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Contratos a Modificar")
else
	ll_fila 										= dw_contrato.Find("estado_reg = 1",1, ll_tot_reg)
	if ll_fila=0 then 
		messagebox("Advertencia","Debe Seleccionar Contratos a Modificar")
	else
		ll_res									= MessageBox("Advertencia","¿Desea Generar Modificación de Contrato?", Exclamation!, YesNo!, 2)
		if ll_res=1 then
			dw_contrato.accepttext()
			dw_contrato.setFilter( "estado_reg = 1")
			dw_contrato.filter()
			dw_contrato.accepttext()
			ll_tot_reg						= dw_contrato.rowcount()
			SetPointer(HourGlass!)
//			st_fondo.visible					= true
//			st_cuenta.visible				= true
//			hpb_1.visible 					= true
//			st_porc.visible 					= true
//			hpb_1.Position					= ldb_tot_porc
			
			for	ll_indi=1 to ll_tot_reg
				ls_base						= dw_contrato.getitemstring(ll_indi,'cadena_codigo')
				ls_serie						= dw_contrato.getitemstring(ll_indi,'cadena_serie')
				ldb_numero					= dw_contrato.getitemnumber(ll_indi,'cadena_numero')
				ls_tipo_deuda				= dw_contrato.getitemstring(ll_indi,'sap_cadena_tipo_deuda')
				ls_nro_sap					= dw_contrato.getitemstring(ll_indi,'sap_cadena_nro_contrato_sap')
				ls_folio_consulta			= ls_base+ls_serie+string(ldb_numero)
				UPDATE	"SAP_CADENA"  
     			SET		"STATUS_MODIF_SAP" = 2
   				WHERE	"SAP_CADENA"."BASE" = :ls_base AND  
        						"SAP_CADENA"."SERIE" = :ls_serie AND  
         					"SAP_CADENA"."NUMERO" = :ldb_numero AND
							"SAP_CADENA"."TIPO_DEUDA" = :ls_tipo_deuda AND
							"SAP_CADENA"."NRO_CONTRATO_SAP" = :ls_nro_sap AND
							"SAP_CADENA"."ESTADO" = 'V'
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
				else
					rollback using sqlca;
				end if
				
				if ret = -1 then
					messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
					return
				end if
				
				if gs_sap_conex='P' then
					if gl_cod_parque=104 then
						ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/modificacioncontrato.php?conexion=N")
					elseif gl_cod_parque=11 then
						ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/modificacioncontrato.php?conexion=F")
					else
						ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/modificacioncontrato.php?conexion=P")
					end if
				elseif gs_sap_conex='Q' then
					if gl_cod_parque=104 then
						ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/modificacioncontrato.php?conexion=QN")
					elseif gl_cod_parque=11 then
						ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/modificacioncontrato.php?conexion=QF")
					else
						ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/nusoap/modificacioncontrato.php?conexion=QP")
					end if
				end if
				
				//ls_ok							= f_tiempo('CTTO','')
				if ls_ok='S' then
					UPDATE	"SAP_CADENA"  
					SET		"STATUS_MODIF_SAP" = 1
					WHERE	"SAP_CADENA"."BASE" = :ls_base AND  
								"SAP_CADENA"."SERIE" = :ls_serie AND  
								"SAP_CADENA"."NUMERO" = :ldb_numero AND
								"SAP_CADENA"."TIPO_DEUDA" = :ls_tipo_deuda AND
								"SAP_CADENA"."NRO_CONTRATO_SAP" = :ls_nro_sap AND
								"SAP_CADENA"."ESTADO" = 'V'
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit using sqlca;
						messagebox("Advertencia","Modificación Existosa")
						ll_tot_reg							= dw_contrato.retrieve()
					else
						rollback using sqlca;
					end if
				end if
			next
		end if
	end if
end if
end event

type cb_ordenar from commandbutton within w_sap_cargas
integer x = 3451
integer y = 1888
integer width = 229
integer height = 84
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_contrato.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_contrato.SETSORT(NULO)
	dw_contrato.SORT()
end if
end event

type cb_amplia from commandbutton within w_sap_cargas
integer x = 4507
integer y = 236
integer width = 457
integer height = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crea Ampliación"
end type

event clicked;//string		ls_dv,ls_grupo_cta,ls_sociedad,ls_tipo_vta,ls_uso,ls_origen_vta,ls_string,ls_moneda,ls_pais,ls_amplia,ls_nro_sap,ls_actualiz
//long 		ret,ll_tot_reg,ll_fila,ll_res,ll_indi,ll_ano,ll_cta,ll_graba=0,ll_no_graba=0,ll_estado
//double	ldb_rut,ldb_tot_porc=0,ldb_tot_porc_aux=0
//
//Inet  iinet_base
//ret = GetContextService("Internet", iinet_base)
//
//
//dw_cliente.dataobject	= 'dw_sap_z001_envio_cliente'
//dw_cliente.settransobject(sqlca)
//dw_cliente.retrieve()
//
//
//dw_cliente.accepttext()
//
//ll_tot_reg									= dw_cliente.rowcount()
//if ll_tot_reg=0 then
//	messagebox("Advertencia","No Registra Cliente par Carga SAP")
//else
//	ll_fila 										= dw_cliente.Find("estado_reg = 1",1, ll_tot_reg)
//	if ll_fila=0 then 
//		messagebox("Advertencia","Debe Seleccionar Clientes para Traspaso A SAP")
//	else
//		ll_res									= MessageBox("Advertencia","¿Desea Generar Traspaso de Clientes a SAP?", Exclamation!, YesNo!, 2)
//		if ll_res=1 then
//			dw_cliente.accepttext()
//			dw_cliente.setFilter( "estado_reg = 1")
//			dw_cliente.filter()
//			dw_cliente.accepttext()
//			ll_tot_reg				= dw_cliente.rowcount()
//			SetPointer(HourGlass!)
//			st_fondo.visible					= true
//			st_cuenta.visible				= true
//			hpb_1.visible 					= true
//			st_porc.visible 					= true
//			hpb_1.Position					= ldb_tot_porc
//			
//			for	ll_indi=1 to ll_tot_reg
//				ldb_rut						= dw_cliente.getitemnumber(ll_indi,'rut')
//				ls_dv							= dw_cliente.getitemstring(ll_indi,'dv')
//				ls_grupo_cta				= dw_cliente.getitemstring(ll_indi,'grupo_cta')
//				ls_sociedad					= dw_cliente.getitemstring(ll_indi,'sociedad')
//				ls_tipo_vta					= dw_cliente.getitemstring(ll_indi,'organ_venta')
//				ls_uso						= dw_cliente.getitemstring(ll_indi,'uso')
//				ls_origen_vta				= dw_cliente.getitemstring(ll_indi,'tipo_venta')
//				ll_ano							= dw_cliente.getitemnumber(ll_indi,'ano_renta')
//				ls_moneda					= dw_cliente.getitemstring(ll_indi,'uwaer')
//				ls_pais						= dw_cliente.getitemstring(ll_indi,'pais')
//								
//				if not isnull(ldb_rut) and ldb_rut>0 and not isnull(ls_dv) and ls_dv<>'' then
//					ls_string					= trim(trim(string(ldb_rut))+'-'+ls_dv)
//					ls_nro_sap				= f_vista_cliente_sap(ls_grupo_cta,ls_sociedad,ls_tipo_vta,ls_uso,ls_origen_vta,ls_string)
//					if isnull(ls_nro_sap) or ls_nro_sap='' then
//						ll_estado					= 3
//					else
//						ll_estado					= 1
//					end if
//					UPDATE	"SAP_AMPLIACION_CLIENTE"  
//					SET		"ESTADO_SAP" =1,
//								"NRO_CLIENTE_SAP" = :ls_nro_sap  
//					WHERE	"SAP_AMPLIACION_CLIENTE"."RUT" = :ldb_rut AND  
//								"SAP_AMPLIACION_CLIENTE"."MANDT" = :gs_mandatario AND  
//								"SAP_AMPLIACION_CLIENTE"."GRUPO_CUENTA" = :ls_grupo_cta AND  
//								"SAP_AMPLIACION_CLIENTE"."SOCIEDAD" = :ls_sociedad AND  
//								"SAP_AMPLIACION_CLIENTE"."ORGANIZACION" = :ls_tipo_vta AND  
//								"SAP_AMPLIACION_CLIENTE"."ORIGEN_VENTA" = :ls_origen_vta AND  
//								"SAP_AMPLIACION_CLIENTE"."USO" = :ls_uso
//					USING	sqlca;
//					if sqlca.sqlcode=0 then
//						commit using sqlca;
//					else
//						rollback using sqlca;
//					end if
//				else
//					if ret = -1 then
//						messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
//						return
//					end if
//					if is_tipo='A' then
//						if gs_sap_conex='P' then
//							if gl_cod_parque=104 then
//								ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/z0013.php?conexion=N")
//							elseif gl_cod_parque=11 then
//								ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/z0013.php?conexion=F")
//							else
//								ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/z0013.php?conexion=P")
//							end if
//						elseif gs_sap_conex='Q' then
//							if gl_cod_parque=104 then
//								ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/z0013.php?conexion=QN")
//							elseif gl_cod_parque=11 then
//								ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/z0013.php?conexion=QF")
//							else
//								ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/z0013.php?conexion=QP")
//							end if
//						elseif gs_sap_conex='R' then
//							if gl_cod_parque=104 then
//								ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/z0013.php?conexion=RN")
//							elseif gl_cod_parque=11 then
//								ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/z0013.php?conexion=RF&rut="+string(ldb_rut)+"")
//							else
//								ret 					= iinet_base.HyperlinkToURL("http://172.30.2.9/z0013.php?conexion=RP&rut="+string(ldb_rut)+"")
//							end if	
//						end if
//						ll_cta							= f_reg_x_segundo('CLIE',1100000)
//					end if
//				end if
//				setnull(ls_nro_sap)
//				if ldb_tot_porc <> ldb_tot_porc_aux then 
//					st_porc.text									= string(ldb_tot_porc,'#0.00')+" %"
//					ldb_tot_porc_aux							= ldb_tot_porc
//				end if
//				
//				ldb_tot_porc										= (ll_indi / ll_tot_reg) * 100
//				hpb_1.Position 									= ldb_tot_porc
//				st_cuenta.text 									= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+' Reg. Cálculados '+string(ll_indi,'###,###,###')+' ( '+string((ll_indi*100)/ll_tot_reg,'#0.00')+'% )'+' Seg por Reg.: '+string(15) 
//				dw_cliente.accepttext()
//			next
//			dw_cliente.accepttext()
//			
//			st_fondo.visible										= false
//			st_cuenta.visible									= false
//			hpb_1.visible 										= false
//			st_porc.visible 										= false
//			SetPointer(Arrow!)
//			messagebox("Grabar",'Proceso Terminado :~r~n'+string(ll_graba,'###,###,##0')+' Clientes Grabados con Exito en SAP~r~n'+&
//										'y '+string(ll_no_graba,'###,###,##0')+' Clientes No Grabados en SAP.',information!)
//		end if
//	end if
//end if
end event

type cb_asocia_rut from commandbutton within w_sap_cargas
integer x = 2770
integer y = 1880
integer width = 366
integer height = 100
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&lación. * Rut"
end type

event clicked;if ( dw_contrato.dataobject ='dw_sap_contrato_pend_carga' or dw_contrato.dataobject ='dw_sap_contrato_servicio_carga') and dw_contrato.rowcount() > 0 then
	gi_rut 				= dw_contrato.getitemnumber(il_row,'rut')
	gi_tipo_busqueda 			= 1
	open(w_listado_contratos)
elseif ( dw_contrato.dataobject ='dw_sap_modificacion_ctto' or dw_contrato.dataobject ='dw_sap_rescil_contrato') and dw_contrato.rowcount() > 0 then
	gi_rut 				= dw_contrato.getitemnumber(il_row,'cadena_rut')
	gi_tipo_busqueda 			= 1
	open(w_listado_contratos)
end if



end event

type cb_filtrar from commandbutton within w_sap_cargas
integer x = 3680
integer y = 1888
integer width = 229
integer height = 84
integer taborder = 220
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_contrato.SETfilter(NULO)
dw_contrato.filter()
end event

type cb_cta_cte from commandbutton within w_sap_cargas
integer x = 2432
integer y = 1880
integer width = 338
integer height = 100
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta. Corrie&nte"
end type

event clicked;dw_contrato.accepttext()
if dw_contrato.rowcount() > 0 then
	if ( dw_contrato.dataobject ='dw_sap_contrato_carga' or dw_contrato.dataobject ='dw_sap_contrato_pend_carga' or dw_contrato.dataobject ='dw_sap_contrato_servicio_carga') and dw_contrato.rowcount() > 0 then
		gs_base				= dw_contrato.getitemstring(il_row,'base')
		gs_serie				= dw_contrato.getitemstring(il_row,'serie')
		gi_numero			= dw_contrato.getitemnumber(il_row,'numero')
		gi_rut 				= dw_contrato.getitemnumber(il_row,'rut')
	elseif ( dw_contrato.dataobject ='dw_sap_modificacion_ctto' or dw_contrato.dataobject ='dw_sap_rescil_contrato') and dw_contrato.rowcount() > 0 then
		gs_base				= dw_contrato.getitemstring(il_row,'cadena_codigo')
		gs_serie				= dw_contrato.getitemstring(il_row,'cadena_serie')
		gi_numero			= dw_contrato.getitemnumber(il_row,'cadena_numero')
		gi_rut 				= dw_contrato.getitemnumber(il_row,'cadena_rut')
	end if
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" //Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
	END CHOOSE
end if
end event

type cb_crea_ctto from commandbutton within w_sap_cargas
integer x = 1074
integer y = 1880
integer width = 411
integer height = 100
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Crear Ctto SAP"
end type

event clicked;string		ls_base,ls_serie,ls_nulo,ls_consul_nro_sap,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ls_folio_consul,ls_tipo_deuda
long		ret,ll_tot_reg,ll_fila,ll_res,ll_indi
double	ldb_tot_porc,ldb_numero

Inet  iinet_base
ret = GetContextService("Internet", iinet_base)

setnull(ls_nulo)
dw_contrato.accepttext()
ll_tot_reg									= dw_contrato.rowcount()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Cliente par Carga SAP")
else
	ll_fila 										= dw_contrato.Find("estado_reg = 1",1, ll_tot_reg)
	if ll_fila=0 then 
		messagebox("Advertencia","Debe Seleccionar Clientes para Traspaso A SAP")
	else
		ll_res									= MessageBox("Advertencia","¿Desea Generar Traspaso de Contratos a SAP?", Exclamation!, YesNo!, 2)
		if ll_res=1 then
			dw_contrato.accepttext()
			dw_contrato.setFilter( "estado_reg = 1")
			dw_contrato.filter()
			dw_contrato.accepttext()
			ll_tot_reg						= dw_contrato.rowcount()
			SetPointer(HourGlass!)
			hpb_1.Position					= ldb_tot_porc
			
			for	ll_indi=1 to ll_tot_reg
				ls_base						= dw_contrato.getitemstring(ll_indi,'base')
				ls_serie						= dw_contrato.getitemstring(ll_indi,'serie')
				ldb_numero					= dw_contrato.getitemnumber(ll_indi,'numero')
				ls_tipo_deuda				= dw_contrato.getitemstring(ll_indi,'tipo_deuda')
				
				ls_tipo_ctto					= dw_contrato.getitemstring(ll_indi,'tipo_contrato')
				ls_organiz					= dw_contrato.getitemstring(ll_indi,'organizacion')
				ls_origen_vta				= dw_contrato.getitemstring(ll_indi,'tipo_venta')
				ls_uso						= dw_contrato.getitemstring(ll_indi,'uso')
				ls_folio_consul				= ls_base+ls_serie+string(ldb_numero,'#########')+'-'+string(gl_cod_parque)
				
				ls_consul_nro_sap			= f_vista_ctto_sap(gs_mandatario,ls_tipo_ctto,ls_organiz,ls_origen_vta,ls_uso,ls_folio_consul,ls_tipo_deuda,string(0))
				if isnull(ls_consul_nro_sap) or ls_consul_nro_sap='' then
					f_reg_x_segundo('CTTO',4000000)
					SELECT	SYSDATE
					INTO 		:gdt_fec_sistema
					FROM		"TASA"  
					WHERE	"TASA"."LOOK" = 1   
					USING	sqlca;
						
					if ret = -1 then
						messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
						return
					end if
					if gs_sap_conex='P' then
						if gl_cod_parque=104 then
							ret 				= iinet_base.HyperlinkToURL("http://172.30.2.78/nusoap/contrato.php?conexion=N&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar="+is_xml+"" )
						elseif gl_cod_parque=11 then
							ret 				= iinet_base.HyperlinkToURL("http://172.30.2.78/nusoap/contrato.php?conexion=F&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar="+is_xml+"")
						else
							ret 				=  iinet_base.HyperlinkToURL("http://172.30.2.78/nusoap/contrato.php?conexion=P&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar="+is_xml+"")
						end if
					elseif gs_sap_conex='Q' then
						if gl_cod_parque=104 then
							ret 				= iinet_base.HyperlinkToURL("http://172.30.2.78/nusoap/contrato.php?conexion=QN&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar="+is_xml+"" )
						elseif gl_cod_parque=11 then
							ret 				= iinet_base.HyperlinkToURL("http://172.30.2.78/nusoap/contrato.php?conexion=QF&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar="+is_xml+"")
						else
							ret 				= iinet_base.HyperlinkToURL("http://172.30.2.78/nusoap/contrato.php?conexion=QP&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar="+is_xml+"")
						end if
					elseif gs_sap_conex='R' then
						if gl_cod_parque=104 then
							ret 				= iinet_base.HyperlinkToURL("http://172.30.2.78/nusoap/contrato.php?conexion=RN&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar="+is_xml+"" )
						elseif gl_cod_parque=11 then
							ret 				= iinet_base.HyperlinkToURL("http://172.30.2.78/nusoap/contrato.php?conexion=RF&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar="+is_xml+"" )
						else
							ret 				= iinet_base.HyperlinkToURL("http://172.30.2.78/nusoap/contrato.php?conexion=RP&contrato="+ls_base+ls_serie+string(ldb_numero)+"&tipo="+ls_tipo_deuda+"&cerrar="+is_xml+"")
						end if	
					end if
					UPDATE "SAP_CADENA"  
					SET 		"FECHA_SAP" = :gdt_fec_sistema
					WHERE	( "SAP_CADENA"."BASE" = :ls_base ) AND  
								( "SAP_CADENA"."SERIE" = :ls_serie ) AND  
								( "SAP_CADENA"."NUMERO" = :ldb_numero ) AND  
								( "SAP_CADENA"."TIPO_DEUDA" = :ls_tipo_deuda )
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit using sqlca;
					else
						rollback using sqlca;
					end if
				end if
			next
		end if
	end if
end if
end event

type cb_2 from commandbutton within w_sap_cargas
integer x = 3936
integer y = 1880
integer width = 293
integer height = 100
integer taborder = 230
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_sap_cargas)
end event

type gb_1 from groupbox within w_sap_cargas
integer x = 1646
integer y = 8
integer width = 2482
integer height = 200
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Porcentaje de Pago"
end type

type st_fondo from statictext within w_sap_cargas
integer x = 37
integer y = 36
integer width = 699
integer height = 120
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
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cliente from datawindow within w_sap_cargas
integer x = 530
integer y = 224
integer width = 3707
integer height = 680
integer taborder = 30
string title = "none"
string dataobject = "dw_numero_cliente_ampliacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_marca
long	ll_tot_reg,ll_indi

ls_columna 											= dwo.name
ll_tot_reg											= dw_cliente.rowcount()
if ll_tot_reg>0 then
	if ls_columna = 't_marca' then
		ls_marca										= dw_cliente.object.t_marca.text
		if ls_marca='Marcar Todos' then
			for ll_indi=1 to ll_tot_reg
				dw_cliente.setitem(ll_indi,'estado_reg',1)
				//dw_cliente.SelectRow(ll_indi, TRUE)
				dw_cliente.accepttext()
			next
			dw_cliente.object.t_marca.text		= 'Desmarcar Todos'
		elseif ls_marca='Desmarcar Todos' then
			for ll_indi=1 to ll_tot_reg
				dw_cliente.setitem(ll_indi,'estado_reg',0)
				//dw_cliente.SelectRow(ll_indi, FALSE)
				dw_cliente.accepttext()
			next
			dw_cliente.object.t_marca.text		= 'Marcar Todos'
		end if
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row_cli	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row_cli, true)
end if
end event

type dw_contrato from datawindow within w_sap_cargas
integer x = 530
integer y = 1096
integer width = 3698
integer height = 760
integer taborder = 130
string title = "none"
string dataobject = "dw_sap_contrato_creados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_marca,ls_base,ls_tipo_deuda
long	ll_tot_reg,ll_indi,ll_estado_age,ll_estado_sup,ll_estado_jef,ll_estado

ls_columna 								= dwo.name
ll_tot_reg								= dw_contrato.rowcount()
if ll_tot_reg>0 then
	if ls_columna = 't_marca' then
		ls_marca							= dw_contrato.object.t_marca.text
		if ls_marca='Marcar Todos' then
			for ll_indi=1 to ll_tot_reg
				if dw_contrato.dataobject	= 'dw_sap_contrato_creados' then
					ls_base					= 	dw_contrato.getitemstring(ll_indi,'base')
					ls_tipo_deuda			= 	dw_contrato.getitemstring(ll_indi,'tipo_deuda')
					if (ls_base='A' or ls_base='L' or ls_base='O') and ls_tipo_deuda='C' then
						ll_estado_age		= dw_contrato.getitemnumber(ll_indi,'sap_cadena_val_age')
						ll_estado_sup		= dw_contrato.getitemnumber(ll_indi,'sap_cadena_val_sup')
						ll_estado_jef		= dw_contrato.getitemnumber(ll_indi,'sap_cadena_val_jef')
						ll_estado				= 	ll_estado_age + ll_estado_sup - ll_estado_jef
						if ll_estado=1 then
							dw_contrato.setitem(ll_indi,'estado_reg',1)
						else
							dw_contrato.setitem(ll_indi,'estado_reg',0)
						end if
					else
						dw_contrato.setitem(ll_indi,'estado_reg',1)
					end if
				else
					dw_contrato.setitem(ll_indi,'estado_reg',1)
				end if
			next
				dw_contrato.accepttext()
				dw_contrato.object.t_marca.text		= 'Desmarcar Todos'
		elseif ls_marca='Desmarcar Todos' then
			for ll_indi=1 to ll_tot_reg
				dw_contrato.setitem(ll_indi,'estado_reg',0)
				//dw_cliente.SelectRow(ll_indi, FALSE)
				dw_contrato.accepttext()
				dw_contrato.object.t_marca.text		= 'Marcar Todos'
			next
		end if
	elseif ls_columna='estado_reg' then
		if dw_contrato.dataobject	= 'dw_sap_contrato_creados' then
			ls_base						= 	dw_contrato.getitemstring(il_row,'base')
			ls_tipo_deuda				= 	dw_contrato.getitemstring(il_row,'tipo_deuda')
			if (ls_base='A' or ls_base='L' or ls_base='O') and ls_tipo_deuda='C' then
				ll_estado_age			= dw_contrato.getitemnumber(il_row,'sap_cadena_val_age')
				ll_estado_sup			= dw_contrato.getitemnumber(il_row,'sap_cadena_val_sup')
				ll_estado_jef			= dw_contrato.getitemnumber(il_row,'sap_cadena_val_jef')
				ll_estado					= 	ll_estado_age + ll_estado_sup - ll_estado_jef
				if ll_estado=1 then
					dw_contrato.setitem(ll_indi,'estado_reg',0)
				else
					dw_contrato.setitem(ll_indi,'estado_reg',1)
				end if
			end if
		end if
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_2 from groupbox within w_sap_cargas
integer x = 3374
integer y = 900
integer width = 512
integer height = 148
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
end type

type gb_3 from groupbox within w_sap_cargas
integer x = 3205
integer y = 1848
integer width = 718
integer height = 140
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
end type

