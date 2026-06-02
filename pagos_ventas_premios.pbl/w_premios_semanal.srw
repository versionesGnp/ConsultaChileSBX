forward
global type w_premios_semanal from window
end type
type cb_1 from commandbutton within w_premios_semanal
end type
type cb_res_comi from commandbutton within w_premios_semanal
end type
type cb_actualiza from commandbutton within w_premios_semanal
end type
type cb_filtrar from commandbutton within w_premios_semanal
end type
type cb_asocia_rut from commandbutton within w_premios_semanal
end type
type cb_mejores_ni from commandbutton within w_premios_semanal
end type
type cb_eliminar from commandbutton within w_premios_semanal
end type
type cb_mejores_nf from commandbutton within w_premios_semanal
end type
type cb_grabar from commandbutton within w_premios_semanal
end type
type st_valor_uf from statictext within w_premios_semanal
end type
type st_valor_uf_t from statictext within w_premios_semanal
end type
type dw_mejores_imprime from datawindow within w_premios_semanal
end type
type dw_ingreso_imprime from datawindow within w_premios_semanal
end type
type cb_detalle from commandbutton within w_premios_semanal
end type
type dw_premio_mejor from datawindow within w_premios_semanal
end type
type dw_parque from datawindow within w_premios_semanal
end type
type p_termino from picture within w_premios_semanal
end type
type em_ctto from editmask within w_premios_semanal
end type
type pb_buscar from picturebutton within w_premios_semanal
end type
type cb_pagos from commandbutton within w_premios_semanal
end type
type cb_limpiar from commandbutton within w_premios_semanal
end type
type cb_clasif_hist from commandbutton within w_premios_semanal
end type
type cb_imprimir from commandbutton within w_premios_semanal
end type
type cb_cta_cte from commandbutton within w_premios_semanal
end type
type pb_aceptar from picturebutton within w_premios_semanal
end type
type st_desde from statictext within w_premios_semanal
end type
type em_termino from editmask within w_premios_semanal
end type
type em_inicio from editmask within w_premios_semanal
end type
type st_hasta from statictext within w_premios_semanal
end type
type cb_cerrar from commandbutton within w_premios_semanal
end type
type dw_premio_caja from datawindow within w_premios_semanal
end type
type gb_periodo from groupbox within w_premios_semanal
end type
type gb_2 from groupbox within w_premios_semanal
end type
type gb_3 from groupbox within w_premios_semanal
end type
end forward

global type w_premios_semanal from window
integer width = 3680
integer height = 2264
boolean titlebar = true
string title = "Premios Semanales"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
cb_res_comi cb_res_comi
cb_actualiza cb_actualiza
cb_filtrar cb_filtrar
cb_asocia_rut cb_asocia_rut
cb_mejores_ni cb_mejores_ni
cb_eliminar cb_eliminar
cb_mejores_nf cb_mejores_nf
cb_grabar cb_grabar
st_valor_uf st_valor_uf
st_valor_uf_t st_valor_uf_t
dw_mejores_imprime dw_mejores_imprime
dw_ingreso_imprime dw_ingreso_imprime
cb_detalle cb_detalle
dw_premio_mejor dw_premio_mejor
dw_parque dw_parque
p_termino p_termino
em_ctto em_ctto
pb_buscar pb_buscar
cb_pagos cb_pagos
cb_limpiar cb_limpiar
cb_clasif_hist cb_clasif_hist
cb_imprimir cb_imprimir
cb_cta_cte cb_cta_cte
pb_aceptar pb_aceptar
st_desde st_desde
em_termino em_termino
em_inicio em_inicio
st_hasta st_hasta
cb_cerrar cb_cerrar
dw_premio_caja dw_premio_caja
gb_periodo gb_periodo
gb_2 gb_2
gb_3 gb_3
end type
global w_premios_semanal w_premios_semanal

type variables
string	is_canal='NF'
long il_row,il_row_caja,il_row_mejor,il_mto_min=5000,il_mto=0
datetime	idt_fecha_ini,idt_fecha_fin
end variables

forward prototypes
public function datetime wf_fec_recep (string as_base, string as_serie, long al_numero)
public function long wf_val_venta (string as_base, string as_serie, long al_numero)
public subroutine wf_rev_res_comi (datetime adt_fecha_fin)
public subroutine wf_mejores (long al_cod_parque, string as_tipo_empleado, datetime adt_fecha_fin, datetime adt_fecha_proceso)
end prototypes

public function datetime wf_fec_recep (string as_base, string as_serie, long al_numero);datetime	ldt_fec_recep,ldt_nulo

//wf_fec_recep(as_base,as_serie,al_numero)
setnull(ldt_nulo)
SELECT	MAX("CD_FOLIO_DETALLE"."FECHA_ESTADO")
INTO		:ldt_fec_recep
FROM		"CD_FOLIO_DETALLE"  
WHERE	( "CD_FOLIO_DETALLE"."BASE" = :as_base ) AND  
			( "CD_FOLIO_DETALLE"."SERIE" = :as_serie ) AND  
			( "CD_FOLIO_DETALLE"."NUMERO" = :al_numero ) AND
			( "CD_FOLIO_DETALLE"."ESTADO" = 3 )
USING	sqlca;
if isnull(ldt_fec_recep) then ldt_fec_recep=ldt_nulo
return	ldt_fec_recep
end function

public function long wf_val_venta (string as_base, string as_serie, long al_numero);long	ll_cta

//wf_val_venta(as_base,as_serie,al_numero)
SELECT	count("PROMESA_PREMIO"."NUMERO")
INTO		:ll_cta
FROM 	"PROMESA_PREMIO"  
WHERE	( "PROMESA_PREMIO"."BASE" = :as_base ) AND  
			( "PROMESA_PREMIO"."SERIE" = :as_serie ) AND  
			( "PROMESA_PREMIO"."NUMERO" = :al_numero )
USING 	sqlca;
if isnull(ll_cta) then ll_cta=0
return	ll_cta

end function

public subroutine wf_rev_res_comi (datetime adt_fecha_fin);double	ldb_sum_pro,ldb_sum_res

//wf_rev_res_comi(adt_fecha_fin)
SELECT 	sum("PROMESA_PREMIO"."MONTO"  )
INTO		:ldb_sum_pro
FROM 	"PROMESA_PREMIO"  
WHERE	"PROMESA_PREMIO"."FECHA" = :adt_fecha_fin
USING	sqlca;
if isnull(ldb_sum_pro) then ldb_sum_pro=0

SELECT	sum("RES_COMI"."TOTAL_PAGO")
INTO		:ldb_sum_res
FROM 	"RES_COMI"  
WHERE	"RES_COMI"."FECHA" = :adt_fecha_fin AND  
			("RES_COMI"."COD_CONTABLE" = '044' OR "RES_COMI"."COD_CONTABLE" = '045')
USING	sqlca;
if isnull(ldb_sum_res) then ldb_sum_res=0

if ldb_sum_pro<>ldb_sum_res then
	messagebox("Advertencia","Registra Premios Sin Actualizar Tabla Res_Comi")
	cb_res_comi.visible			= true
end if
end subroutine

public subroutine wf_mejores (long al_cod_parque, string as_tipo_empleado, datetime adt_fecha_fin, datetime adt_fecha_proceso);string		ls_canal,ls_cod_age,ls_canal_s,ls_clasif_hist
long		ll_lugar,ll_antig,ll_premio,ll_codigo,ll_new
datetime	ldt_fec_ing
double	ldb_prod_min,ldb_prod,ldb_descto,ldb_prod_aux=0

//wf_mejores(al_cod_parque,as_tipo_empleado,adt_fecha_fin,adt_fecha_proceso)
DECLARE x2 CURSOR FOR
SELECT DISTINCT	"USO"
FROM		"TIPO_USO"
USING	Trans_1;
open x2;
if Trans_1.sqlcode=0 then
	DO WHILE Trans_1.sqlcode=0
	fetch x2 INTO	:ls_canal;
		if not isnull(ls_canal) and ls_canal<>'' then
			ll_lugar											= 0
			SELECT DISTINCT	"PRODUCC_MIN" 
			INTO		:ldb_prod_min
			FROM		"PREMIOS_POR_CAJA_MEJORES"  
			WHERE	"PREMIOS_POR_CAJA_MEJORES"."CANAL" = :ls_canal AND  
						"PREMIOS_POR_CAJA_MEJORES"."PARQUE" = :al_cod_parque AND  
						"PREMIOS_POR_CAJA_MEJORES"."TIPO_EMPLEADO" = :as_tipo_empleado AND  
						"PREMIOS_POR_CAJA_MEJORES"."PERIODO" = '1' AND  
						"PREMIOS_POR_CAJA_MEJORES"."ESTADO" = 'A' 
			USING	sqlca;
			if isnull(ldb_prod_min) then ldb_prod_min=0
			
			DECLARE x1 CURSOR FOR
			SELECT		SUM("PREMIOS_SEMANA_PROC"."PRECIO_UF") AS_PRODUCC,"PREMIOS_SEMANA_PROC"."COD_AGE","PREMIOS_SEMANA_PROC"."CANAL","AGENTES"."FECHA_INI"
			FROM			"PREMIOS_SEMANA_PROC","AGENTES"
			WHERE		"PREMIOS_SEMANA_PROC"."COD_AGE" = "AGENTES"."COD_AGE" AND 
							"PREMIOS_SEMANA_PROC"."CANAL" = :ls_canal and
							"PREMIOS_SEMANA_PROC"."COD_PARQUE_AGE" = :al_cod_parque AND
							"PREMIOS_SEMANA_PROC"."CIERRE_VENTAS" IS NULL
			GROUP BY	"PREMIOS_SEMANA_PROC"."COD_AGE",
							"PREMIOS_SEMANA_PROC"."CANAL",
							"AGENTES"."FECHA_INI"
			ORDER BY	"PREMIOS_SEMANA_PROC"."CANAL" ASC,
							SUM("PREMIOS_SEMANA_PROC"."PRECIO_UF") DESC
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ldb_prod,	:ls_cod_age, :ls_canal_s,:ldt_fec_ing;
					if not isnull(ldb_prod) and ldb_prod>0 and not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ls_canal_s) and ls_canal_s<>'' then
						if ldb_prod >= ldb_prod_min then
							ls_clasif_hist					= f_clasif_hist(ls_cod_age,adt_fecha_fin)
							ll_antig							= DaysAfter(date(ldt_fec_ing), date(adt_fecha_fin))
							if ls_clasif_hist<>'D' then
								ll_lugar++
								ldb_descto					= 1
								if ldb_prod_aux=ldb_prod then
									ll_lugar					= ll_lugar - 1
									ldb_descto				= 0.5
								end if
								if (ls_canal='NF' and ll_lugar<=4) or (ls_canal='NI' and ll_lugar<=2) then
									SELECT	"MONTO", "CODIGO" 
									INTO		:ll_premio, :ll_codigo  
									FROM		"PREMIOS_POR_CAJA_MEJORES"  
									WHERE	( "PREMIOS_POR_CAJA_MEJORES"."CODIGO" = :ll_lugar ) AND  
												( "PREMIOS_POR_CAJA_MEJORES"."CANAL" = :ls_canal ) AND  
												( "PREMIOS_POR_CAJA_MEJORES"."PARQUE" = :al_cod_parque ) AND  
												( "PREMIOS_POR_CAJA_MEJORES"."TIPO_EMPLEADO" = :as_tipo_empleado ) AND  
												( "PREMIOS_POR_CAJA_MEJORES"."PERIODO" = '1' ) AND  
												( "PREMIOS_POR_CAJA_MEJORES"."ESTADO" = 'A' )
									USING	Trans_2;
									if isnull(ll_premio) then ll_premio=0
									if isnull(ll_codigo) then ll_codigo=0
									if ls_clasif_hist = 'A' and ll_antig >= 180 then
										ll_premio				= (ll_premio + (ll_premio * 0.25))* ldb_descto
									else
										ll_premio				= ll_premio * ldb_descto
									end if
									ll_new					= dw_premio_mejor.insertrow(0)
									dw_premio_mejor.scrolltorow(ll_new)
									dw_premio_mejor.setitem(ll_new,'lugar',ll_lugar)
									dw_premio_mejor.setitem(ll_new,"uso",ls_canal)
									dw_premio_mejor.setitem(ll_new,"codigo",ls_cod_age)
									dw_premio_mejor.setitem(ll_new,"ufs",ldb_prod)
									dw_premio_mejor.setitem(ll_new,"agente",'A')
									dw_premio_mejor.setitem(ll_new,"fecha",adt_fecha_fin)
									dw_premio_mejor.setitem(ll_new,"fecha_proceso",adt_fecha_proceso)
									dw_premio_mejor.setitem(ll_new,"parque",al_cod_parque)
									dw_premio_mejor.setitem(ll_new,"c_clasif",ls_clasif_hist)
									dw_premio_mejor.setitem(ll_new,"c_estado",'A')
									dw_premio_mejor.setitem(ll_new,'c_descto',ldb_descto)
									dw_premio_mejor.setitem(ll_new,"monto",ll_premio)
									dw_premio_mejor.setitem(ll_new,"c_cod_cont",'046')
									dw_premio_mejor.setitem(ll_new,"codigo_premio",ll_codigo)
									if ldb_descto<1 then
										dw_premio_mejor.setitem((ll_new - 1),'c_descto',ldb_descto)
										dw_premio_mejor.setitem((ll_new - 1),"monto",ll_premio)
									end if
									dw_premio_mejor.accepttext()
									ldb_prod_aux				= ldb_prod
								end if
							end if
						end if
					end if
					setnull(ldb_prod);setnull(ls_cod_age);setnull(ls_canal_s)
				LOOP
			end if
			close x1;
		end if
		setnull(ls_canal)
	LOOP
end if
close x2;
end subroutine

on w_premios_semanal.create
this.cb_1=create cb_1
this.cb_res_comi=create cb_res_comi
this.cb_actualiza=create cb_actualiza
this.cb_filtrar=create cb_filtrar
this.cb_asocia_rut=create cb_asocia_rut
this.cb_mejores_ni=create cb_mejores_ni
this.cb_eliminar=create cb_eliminar
this.cb_mejores_nf=create cb_mejores_nf
this.cb_grabar=create cb_grabar
this.st_valor_uf=create st_valor_uf
this.st_valor_uf_t=create st_valor_uf_t
this.dw_mejores_imprime=create dw_mejores_imprime
this.dw_ingreso_imprime=create dw_ingreso_imprime
this.cb_detalle=create cb_detalle
this.dw_premio_mejor=create dw_premio_mejor
this.dw_parque=create dw_parque
this.p_termino=create p_termino
this.em_ctto=create em_ctto
this.pb_buscar=create pb_buscar
this.cb_pagos=create cb_pagos
this.cb_limpiar=create cb_limpiar
this.cb_clasif_hist=create cb_clasif_hist
this.cb_imprimir=create cb_imprimir
this.cb_cta_cte=create cb_cta_cte
this.pb_aceptar=create pb_aceptar
this.st_desde=create st_desde
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_hasta=create st_hasta
this.cb_cerrar=create cb_cerrar
this.dw_premio_caja=create dw_premio_caja
this.gb_periodo=create gb_periodo
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_1,&
this.cb_res_comi,&
this.cb_actualiza,&
this.cb_filtrar,&
this.cb_asocia_rut,&
this.cb_mejores_ni,&
this.cb_eliminar,&
this.cb_mejores_nf,&
this.cb_grabar,&
this.st_valor_uf,&
this.st_valor_uf_t,&
this.dw_mejores_imprime,&
this.dw_ingreso_imprime,&
this.cb_detalle,&
this.dw_premio_mejor,&
this.dw_parque,&
this.p_termino,&
this.em_ctto,&
this.pb_buscar,&
this.cb_pagos,&
this.cb_limpiar,&
this.cb_clasif_hist,&
this.cb_imprimir,&
this.cb_cta_cte,&
this.pb_aceptar,&
this.st_desde,&
this.em_termino,&
this.em_inicio,&
this.st_hasta,&
this.cb_cerrar,&
this.dw_premio_caja,&
this.gb_periodo,&
this.gb_2,&
this.gb_3}
end on

on w_premios_semanal.destroy
destroy(this.cb_1)
destroy(this.cb_res_comi)
destroy(this.cb_actualiza)
destroy(this.cb_filtrar)
destroy(this.cb_asocia_rut)
destroy(this.cb_mejores_ni)
destroy(this.cb_eliminar)
destroy(this.cb_mejores_nf)
destroy(this.cb_grabar)
destroy(this.st_valor_uf)
destroy(this.st_valor_uf_t)
destroy(this.dw_mejores_imprime)
destroy(this.dw_ingreso_imprime)
destroy(this.cb_detalle)
destroy(this.dw_premio_mejor)
destroy(this.dw_parque)
destroy(this.p_termino)
destroy(this.em_ctto)
destroy(this.pb_buscar)
destroy(this.cb_pagos)
destroy(this.cb_limpiar)
destroy(this.cb_clasif_hist)
destroy(this.cb_imprimir)
destroy(this.cb_cta_cte)
destroy(this.pb_aceptar)
destroy(this.st_desde)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_hasta)
destroy(this.cb_cerrar)
destroy(this.dw_premio_caja)
destroy(this.gb_periodo)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

event open;long		ll_mes,ll_anno
datetime	ldt_fec_mensual,ldt_fecha_fin,ldt_new_fec,ldt_ult_fec

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;

//gdt_fec_sistema									= datetime(date(string('24/03/2015')))
gf_centrar(w_premios_semanal)
dw_premio_caja.settransobject(sqlca)
dw_premio_mejor.settransobject(sqlca)
dw_parque.dataobject							= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)

if (gl_proceso >=2 and gl_proceso <=3) then
	SELECT DISTINCT	MAX("FECHA_INICIO"),	MAX("FECHA_TERMINO")
	INTO		:idt_fecha_ini,:idt_fecha_fin
	FROM		"CIERRE_PAGOS_VENTAS"
	WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = 3
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		if not isnull(idt_fecha_ini) and not isnull(idt_fecha_fin) then
			em_inicio.text						= string(idt_fecha_ini,"dd/mm/yyyy")
			em_termino.text					= string(idt_fecha_fin,"dd/mm/yyyy")
			cb_grabar.enabled					= false
		end if
	end if
	ll_mes										= month(date(idt_fecha_ini))
	ll_anno										= year(date(idt_fecha_ini))
	ldt_fec_mensual							= f_fecha_fin(ll_mes,ll_anno)
	if ldt_fec_mensual >= idt_fecha_ini and ldt_fec_mensual <= idt_fecha_fin then
		cb_mejores_nf.enabled				= false
		cb_mejores_ni.enabled				= false
	else
		cb_mejores_nf.enabled				= true
		cb_mejores_ni.enabled				= true
	end if
elseif (gl_proceso = 5 and gs_depto = 'I') or (gl_proceso = 4 and gs_depto = 'D') then
	if gs_depto='I' then
		cb_eliminar.visible						= true
	end if
	SELECT DISTINCT	MAX("FECHA_TERMINO")
	INTO		:ldt_fecha_fin
	FROM		"CIERRE_PAGOS_VENTAS"
	WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = 3
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		if not isnull(ldt_fecha_fin) then
			ldt_new_fec							= datetime(RelativeDate(date(ldt_fecha_fin), 9),time('00:00:00'))
			if gdt_fec_sistema< ldt_new_fec then
				SELECT DISTINCT	MAX("FECHA_INICIO"),	MAX("FECHA_TERMINO")
				INTO		:idt_fecha_ini,:idt_fecha_fin
				FROM		"CIERRE_PAGOS_VENTAS"
				WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = 3
				USING	sqlca;
			else
				idt_fecha_ini					= datetime(RelativeDate(date(ldt_fecha_fin), + 1),time('00:00:00'))
				idt_fecha_fin					= datetime(RelativeDate(date(ldt_fecha_fin), + 7),time('00:00:00'))
				cb_grabar.enabled				= true
				cb_actualiza.visible			= true
			end if
			em_inicio.text						= string(idt_fecha_ini,"dd/mm/yyyy")
			em_termino.text					= string(idt_fecha_fin,"dd/mm/yyyy")
			wf_rev_res_comi(idt_fecha_fin)
			ll_mes								= month(date(idt_fecha_ini))
			ll_anno								= year(date(idt_fecha_ini))
			ldt_fec_mensual					= f_fecha_fin(ll_mes,ll_anno)
			if ldt_fec_mensual >= idt_fecha_ini and ldt_fec_mensual <= idt_fecha_fin then
				cb_mejores_nf.enabled		= false
				cb_mejores_ni.enabled		= false
			else
				cb_mejores_nf.enabled		= true
				cb_mejores_ni.enabled		= true
			end if
		end if
	end if
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_premios_semanal)
end if
end event

type cb_1 from commandbutton within w_premios_semanal
integer x = 3063
integer y = 1832
integer width = 507
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Archivo Remun."
end type

event clicked;if isvalid(w_sap_traspaso_arch_pagos) then close(w_sap_traspaso_arch_pagos)
open(w_sap_traspaso_arch_pagos)
end event

type cb_res_comi from commandbutton within w_premios_semanal
boolean visible = false
integer x = 325
integer y = 2020
integer width = 343
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Res_Comi"
end type

event clicked;string		ls_tipo_empleado,ls_cod_agte,ls_cod_contab,ls_base,ls_serie,ls_est_agte,&
			ls_moneda,ls_graba_res1='N',ls_clasif_hist
long		ll_cod_parque,ll_res,ll_tot_ing_caja,ll_indi,ll_tot_pag,ll_mes,ll_monto,ll_rut_agte,ll_malos=0,ll_cont=0,&
			ll_tot_mejor_semana,ll_tot_reg,ll_graba=0,ll_mto_fin,ll_precio_peso,ll_existe,ll_sum_pag
datetime	ldt_fec_ini,ldt_fec_fin,ldt_fecha
double	ldb_numero,ldb_porc_vta,ldb_porc,ldb_precio,ldb_valor_uf

dw_parque.accepttext()
dw_premio_caja.accepttext()
ldt_fec_ini														= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fec_fin														= datetime(date(em_termino.text),time('00:00:00'))
ll_cod_parque													= dw_parque.getitemnumber(1,'parque')
ls_tipo_empleado												= 'A'
if not isnull(ldt_fec_ini) and not isnull(ldt_fec_fin) and not isnull(ll_cod_parque) and ll_cod_parque>0 then
	ll_res															= MessageBox("Grabar","¿Desea Grabar Premio Ingreso Caja Semanal?", Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		//premio_caja
		dw_premio_caja.dataobject							= 'dw_premio_ing_caja_promesa_premio'
		dw_premio_caja.settransobject(sqlca)
		ll_tot_ing_caja											= dw_premio_caja.retrieve(ldt_fec_fin,ll_cod_parque)
		if ll_tot_ing_caja=0 then
			messagebox("Advertencia","No Registra Premio Ingreso Caja con Fecha: "+string(ldt_fec_fin,"dd/mm/yyyy"))	
		else
			if ll_tot_ing_caja>0 then
				for ll_indi = 1 to ll_tot_ing_caja
					ls_base										= dw_premio_caja.getitemstring(ll_indi,'base')
					ls_serie										= dw_premio_caja.getitemstring(ll_indi,'serie')
					ldb_numero									= dw_premio_caja.getitemnumber(ll_indi,'numero')
					ls_cod_agte									= dw_premio_caja.getitemstring(ll_indi,'oferta_v_cod_age')
					ldt_fecha										= dw_premio_caja.getitemdatetime(ll_indi,'fecha')
					ll_mes										= month(date(ldt_fecha))
					ldb_porc_vta								= 0
					ldb_porc										= dw_premio_caja.getitemnumber(ll_indi,'porcentaje')
					ldb_precio									= dw_premio_caja.getitemnumber(ll_indi,'pago_oferta_precio')										
					ll_monto										= dw_premio_caja.getitemnumber(ll_indi,'monto')
					ls_moneda									= dw_premio_caja.getitemstring(ll_indi,'pago_oferta_moneda')
					ll_mto_fin									= f_premio_ing_caja_porce2(ls_base,ls_serie,ldb_numero,ldt_fec_ini,ldt_fec_fin,1)
					if ll_mto_fin<=il_mto_min then
						il_mto										= f_premio_ing_caja_porce2(ls_base,ls_serie,ldb_numero,ldt_fec_ini,ldt_fec_fin,2)	
					end if
					ll_mto_fin									= ll_mto_fin + il_mto
					ll_tot_pag									= ll_mto_fin
					ll_mto_fin									= 0
					il_mto											= 0
					if ldb_porc < 98.5 then
						ls_cod_contab							= '045'
					else
						ls_cod_contab							= '044'
					end if
					
					SELECT	"AGENTES"."RUT","AGENTES"."ESTADO"  
					INTO 		:ll_rut_agte,	:ls_est_agte  
					FROM 	"AGENTES"  
					WHERE	( "AGENTES"."COD_AGE" = :ls_cod_agte ) AND ( "AGENTES"."ESTADO" = 'A' )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_rut_agte		= ll_rut_agte
					else
						ll_rut_agte		= 0
					end if
					SELECT	"TAB_UF"."VALOR_UF"  
					INTO		:ldb_valor_uf  
					FROM		"TAB_UF"  
					WHERE	"TAB_UF"."FECHA_UF" = :ldt_fecha
					USING	sqlca;
					if isnull(ldb_valor_uf) then ldb_valor_uf = 0
					
					SELECT 	count("COD_AGE_SUP"),sum("TOTAL_PAGO")  
					INTO 		:ll_existe,:ll_sum_pag
					FROM 	"RES_COMI"  
					WHERE	( "RES_COMI"."BASE" = :ls_base ) AND  
								( "RES_COMI"."SERIE" = :ls_serie ) AND  
								( "RES_COMI"."CONTRATO" = :ldb_numero ) AND
								( "RES_COMI"."COD_CONTABLE" = '044' OR "RES_COMI"."COD_CONTABLE" = '045' )
					USING 	sqlca;
					if isnull(ll_existe) then ll_existe=0
					if isnull(ll_sum_pag) then ll_sum_pag=0
					
					if ll_existe>0 and ( ll_sum_pag <> ll_monto) then
						DELETE FROM "RES_COMI"  
						WHERE	( "RES_COMI"."BASE" = :ls_base ) AND  
									( "RES_COMI"."SERIE" = :ls_serie ) AND  
									( "RES_COMI"."CONTRATO" = :ldb_numero ) and
									( "RES_COMI"."COD_CONTABLE" = '044' OR "RES_COMI"."COD_CONTABLE" = '045' )
						USING	sqlca;
					end if
					if f_graba_res_comi(ls_cod_agte,ll_rut_agte,ll_tot_pag,ls_cod_contab,string(ll_mes),ldt_fecha,ldb_numero,ls_serie,ldb_porc,ldb_porc_vta,ldb_precio,ll_monto,ldb_valor_uf,'H',ls_moneda,'P',ls_est_agte,ls_base,ll_cod_parque,0,0)= -1 then
						ll_malos++
					else
						ll_cont++
					end if	
				next
				if ll_cont=(ll_indi - 1) then
					ls_graba_res1								= 'S'
				end if
			end if
			if ls_graba_res1='S' then
				messagebox("Grabar","Grabación Ingreso Caja Semanal Exitoso")
				ll_graba++
			end if
		end if
	end if
	//premio_mejor
	ll_malos														= 0
	ll_cont														= 0
	ls_graba_res1												= 'N'
	ll_res															= MessageBox("Grabar","¿Desea Grabar Premio Mejores Semanal?", Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		dw_premio_mejor.dataobject						= 'dw_premio_mejor_promesa_lugar'
		dw_premio_mejor.settransobject(sqlca)
		ll_tot_mejor_semana									= dw_premio_mejor.retrieve(ldt_fec_fin,ll_cod_parque,is_canal)
		dw_premio_mejor.setFilter("uso = 'NF' and lugar <= 4")
		dw_premio_mejor.filter()
		ll_tot_mejor_semana									= dw_premio_mejor.rowcount()
		if ll_tot_mejor_semana=0 then
			messagebox("Advertencia","No Registra Premios Mejores Semanales")
			ls_graba_res1										= 'S'
		else
			for ll_indi = 1 to ll_tot_mejor_semana
				ls_cod_agte										= dw_premio_mejor.getitemstring(ll_indi,'codigo')
				ll_tot_pag										= 0
				ls_cod_contab									= '046'
				ldt_fecha											= dw_premio_mejor.getitemdatetime(ll_indi,'fecha')
				ll_mes											= month(date(ldt_fecha))
				ldb_numero										= 0
				ls_serie											= ' '
				ldb_porc_vta									= 0
				ldb_porc											= 0
				ldb_precio										= 0
				ll_monto											= dw_premio_mejor.getitemnumber(ll_indi,'monto')
				SELECT	"AGENTES"."RUT",	"AGENTES"."ESTADO"    
				INTO 		:ll_rut_agte,	:ls_est_agte  
				FROM 	"AGENTES"  
				WHERE	( "AGENTES"."COD_AGE" = :ls_cod_agte ) AND ( "AGENTES"."ESTADO" = 'A' )
				USING	sqlca;
				if sqlca.sqlcode=0 then
					ll_rut_agte		= ll_rut_agte
				else
					ll_rut_agte		= 0
				end if
				if f_graba_res_comi(ls_cod_agte,ll_rut_agte,ll_tot_pag,ls_cod_contab,string(ll_mes),ldt_fecha,0,ls_serie,0,0,0,ll_monto,0,'H','','P',ls_est_agte,'',ll_cod_parque,0,0)= -1 then
					ll_malos++
				else
					ll_cont++
				end if
			next
			if ll_cont = (ll_indi - 1) then
				ls_graba_res1									= 'S'
			end if
		end if
		if ls_graba_res1='S' then
			messagebox("Grabar","Grabación Mejores Semanal Exitoso")
			ll_graba++
		end if
		dw_ingreso_imprime.dataobject					= 'dw_premio_ing_caja_imprime'
		dw_ingreso_imprime.settransobject(sqlca)
		ll_tot_reg												= dw_ingreso_imprime.retrieve(ldt_fecha,ll_cod_parque)
		if ll_tot_reg>0 then
			dw_ingreso_imprime.Object.usuario.text		= gs_user
			for ll_indi=1 to ll_tot_reg
				ls_cod_agte										= dw_ingreso_imprime.getitemstring(ll_indi,'agentes_cod_age')
				ls_clasif_hist									= f_clasif_hist(ls_cod_agte,ldt_fec_fin)
				dw_ingreso_imprime.setitem(ll_indi,'c_clasif',ls_clasif_hist)
			next
			dw_ingreso_imprime.accepttext()
		end if 
		dw_mejores_imprime.dataobject					= 'dw_premio_mejores_imprime'
		dw_mejores_imprime.settransobject(sqlca)
		ll_tot_reg												= dw_mejores_imprime.retrieve(ldt_fec_fin,ll_cod_parque)
		if ll_tot_reg>0 then
			dw_mejores_imprime.Object.usuario.text	= gs_user
			for ll_indi=1 to ll_tot_reg
				ls_cod_agte										= dw_mejores_imprime.getitemstring(ll_indi,'promesa_lugar_codigo')
				ls_clasif_hist									= f_clasif_hist(ls_cod_agte,ldt_fec_fin)
				dw_mejores_imprime.setitem(ll_indi,'c_clasif',ls_clasif_hist)
			next
			dw_mejores_imprime.accepttext()
		end if
		if ll_graba=2 then
			cb_res_comi.visible								= false
			wf_rev_res_comi(ldt_fec_fin)
			
			
			
		end if
	end if
else
	if isnull(ldt_fec_ini) then
		messagebox("Advertencia","Debe Ingresar Fecha Inicio")
		em_inicio.setfocus()
	elseif isnull(ldt_fec_fin) then
		messagebox("Advertencia","Debe Ingresar Fecha Término")
		em_termino.setfocus()
	elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia","Debe Ingresar Parque")
		dw_parque.setfocus()
		dw_parque.accepttext()
	end if
end if
end event

type cb_actualiza from commandbutton within w_premios_semanal
boolean visible = false
integer x = 2121
integer y = 68
integer width = 526
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar Semana"
end type

event clicked;string		ls_base,ls_serie,ls_cod_age,ls_uso,ls_moneda,ls_estado,ls_forma_pago,ls_canal
long		ll_cod_parque,ll_capac,ll_rut,ll_parque_age,ll_precio_peso,ll_tot_reg,ll_graba=0,ll_mto_fin
datetime	ldt_fec_recep,ldt_fec_recep_fin,ldt_fec_fin,ldt_fec_ini,ldt_cierre_vta
double	ldb_numero,ldb_precio,ldb_precio_uf,ldb_valor_uf

ldt_fec_ini												= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fec_fin												= datetime(date(em_termino.text),time('00:00:00'))
ldt_fec_recep_fin										= datetime((RelativeDate(date(ldt_fec_fin),- 2)),time('18:30:00'))
if not isnull(ldt_fec_fin) then
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO		:ldb_valor_uf  
	FROM		"TAB_UF"  
	WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldb_valor_uf) then
			DELETE FROM "PREMIOS_SEMANA_PROC"
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
			else
				rollback using sqlca;
			end if
			SELECT	count("CODIGO")
			INTO		:ll_tot_reg
			FROM		"VISTA_PROMESA_PREMIO"
			USING	sqlca;
			if isnull(ll_tot_reg) then ll_tot_reg=0
			
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Ingreso de Ventas, Período Desde "+string(ldt_fec_ini,'dd/mm/yyyy')+' Hasta '+string(ldt_fec_fin,'dd/mm/yyyy'))
			else
				DECLARE x1 CURSOR FOR
				SELECT	"COD_PARQUE", "CODIGO", "SERIE", "NUMERO", "COD_AGE", "CAPACIDAD","USO", "PRECIO", "MONEDA", "ESTADO", "FORMA_PAGO", "RUT", "CANAL", "PARQUE_AGE", "CIERRE_VENTA"
				FROM 	"VISTA_PROMESA_PREMIO"
				USING	Trans_1;
				open x1;
				if Trans_1.sqlcode=0 then
					DO WHILE Trans_1.sqlcode=0
					fetch x1 INTO	:ll_cod_parque,	:ls_base,	:ls_serie,	:ldb_numero,	:ls_cod_age,	:ll_capac,	:ls_uso,	:ldb_precio,	:ls_moneda,	:ls_estado,	:ls_forma_pago,	:ll_rut,	:ls_canal,	:ll_parque_age,	:ldt_cierre_vta;
						if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and ldb_numero > 0 then
							if ls_moneda = '2' then
								ldb_precio_uf			= Round(ldb_precio,2)
							else
								ldb_precio_uf			= Round(ldb_precio / ldb_valor_uf,2)
							end if
							if ls_moneda = '1' then
								ll_precio_peso			= Round(ldb_precio,0)
							else
								ll_precio_peso			= Round(ldb_precio * ldb_valor_uf,0)
							end if
							ldt_fec_recep				= wf_fec_recep(ls_base,ls_serie,ldb_numero)
							if not isnull(ldt_fec_recep) then
								if ldt_fec_recep <= ldt_fec_recep_fin then
									ll_mto_fin			= f_premio_ing_caja_porce2(ls_base,ls_serie,ldb_numero,ldt_fec_ini,ldt_fec_fin,1)
									if ll_mto_fin<=il_mto_min then
										il_mto				= f_premio_ing_caja_porce2(ls_base,ls_serie,ldb_numero,ldt_fec_ini,ldt_fec_fin,2)	
									end if
									ll_mto_fin			= ll_mto_fin + il_mto
									if not isnull(ll_mto_fin) and ll_mto_fin>0 then
										if ll_mto_fin>il_mto_min then
											INSERT INTO "PREMIOS_SEMANA_PROC"  
														( "BASE",		"SERIE",	"NUMERO",	"COD_AGE",		"RUT_AGE",	"ESTADO_AGE",	"CIERRE_SEMANA",	"FORMA_PAGO",	"MONEDA",	"PRECIO",	"PRECIO_UF",	"CAPAC",		"USO",	"CANAL",		"COD_PARQUE_CTTO",	"COD_PARQUE_AGE",	"PRECIO_PESO",	"CIERRE_VENTAS"	 )  
											VALUES 	( :ls_base,	:ls_serie,	:ldb_numero,	:ls_cod_age,	:ll_rut,		:ls_estado,			:ldt_fec_fin,			:ls_forma_pago,	:ls_moneda,	:ldb_precio,	:ldb_precio_uf,	:ll_capac,	:ls_uso,	:ls_canal,	:ll_cod_parque,				:ll_parque_age,		:ll_precio_peso,	:ldt_cierre_vta )
											USING	Trans_2;  
											if Trans_2.sqlcode = 0 then
												commit using Trans_2;
												ll_graba++
											else
												rollback using Trans_2;
											end if
										else
											ll_tot_reg	= ll_tot_reg - 1
										end if
									else
										ll_tot_reg		= ll_tot_reg - 1
									end if
								else
									ll_tot_reg			= ll_tot_reg - 1
								end if
							else
								ll_tot_reg				= ll_tot_reg - 1
							end if
						end if
						setnull(ls_base);setnull(ls_serie);setnull(ldb_numero)
					LOOP
				end if
				close x1;
				if ll_graba=ll_tot_reg then
					messagebox("Advertencia","Carga Exitosa")
				end if
			end if
		else
			messagebox("Advertencia","No Registra U.F. Con Fecha "+string(ldt_fec_fin,'dd/mm/yyyy'))
		end if
	end if
	cb_actualiza.visible								= false
end if
	
	

end event

type cb_filtrar from commandbutton within w_premios_semanal
integer x = 1605
integer y = 2204
integer width = 238
integer height = 84
integer taborder = 110
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
dw_premio_caja.SETfilter(NULO)
dw_premio_caja.filter()
end event

type cb_asocia_rut from commandbutton within w_premios_semanal
integer x = 1504
integer y = 2020
integer width = 338
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asociar &x Rut"
end type

event clicked;if dw_premio_caja.getrow() > 0 then 
	gi_rut = dw_premio_caja.getitemnumber(dw_premio_caja.getrow(),'oferta_v_rut')
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if
end event

type cb_mejores_ni from commandbutton within w_premios_semanal
integer x = 3086
integer y = 1576
integer width = 480
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Mejor Agentes N.I"
end type

event clicked;string	ls_tipo_empleado,ls_agente,ls_clasif_hist,ls_canal,ls_filtro
long		ll_cod_parque,ll_tipo_prem_mejor,ll_tot_reg,ll_indi
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_proceso,ldt_fecha_term
double	ldb_valor_uf

is_canal																				= 'NI'
ldt_fecha_ini																		= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin																		= datetime(date(em_termino.text),time('00:00:00'))
ll_cod_parque																		= dw_parque.getitemnumber(1,'parque')
ldt_fecha_proceso																	= gdt_fec_sistema
ll_tipo_prem_mejor																= 4
ls_tipo_empleado																	= 'A'

dw_premio_mejor.reset()
dw_mejores_imprime.reset()
dw_premio_mejor.dataobject													= 'dw_premio_mejor_promesa_calculo'
dw_premio_mejor.settransobject(sqlca)
dw_premio_mejor.Object.usuario.text 										= gs_user
ls_canal										 										= 'NI'

SELECT	"TAB_UF"."VALOR_UF"  
INTO		:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE	"TAB_UF"."FECHA_UF" = :ldt_fecha_fin
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_valor_uf) and ldb_valor_uf > 0 then
		SELECT	"FECHA_TERMINO"
		INTO		:ldt_fecha_term
		FROM		"CIERRE_PAGOS_VENTAS"  
		WHERE	"CIERRE_PAGOS_VENTAS"."FECHA_INICIO" <= :ldt_fecha_fin AND  
					"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" >= :ldt_fecha_fin AND
					"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_prem_mejor AND
					"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
					"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
		USING		Trans_1;
		if Trans_1.sqlcode=0 then
			if not isnull(ldt_fecha_term) then
				dw_premio_mejor.dataobject									= 'dw_premio_mejor_promesa_lugar'
				dw_premio_mejor.settransobject(sqlca)
				ll_tot_reg															= dw_premio_mejor.retrieve(ldt_fecha_fin,ll_cod_parque,ls_canal)
				dw_premio_mejor.Object.usuario.text 						= gs_user
				dw_premio_mejor.setFilter("uso = 'NI' and lugar <= 2")
				dw_premio_mejor.filter()
				ll_tot_reg															= dw_premio_mejor.RowCount()
				if ll_tot_reg>0 then
					for ll_indi = 1 to ll_tot_reg
						ls_agente													= dw_premio_mejor.getitemstring(ll_indi,'codigo')
						ls_clasif_hist												= f_clasif_hist(ls_agente,ldt_fecha_fin)
						dw_premio_mejor.setitem(ll_indi,'c_clasif',ls_clasif_hist)
						dw_premio_mejor.setitem(ll_indi,'c_cod_haber','046')
					next
					dw_premio_mejor.accepttext()
					if gs_depto='R' or gs_depto='R' or gs_depto='X' then
						cb_imprimir.visible											= false
						cb_eliminar.visible											= false
						if gs_depto='R' then
							ls_filtro													= "agentes_cod_sup ='"+gs_user+"'"
						elseif gs_depto='B' then
							ls_filtro													= "supervisor_cod_jefe ='"+gs_user+"'"
						end if
						dw_premio_mejor.setfilter(ls_filtro)
						dw_premio_mejor.filter( )
						ll_tot_reg													= dw_premio_mejor.rowcount()
						if ll_tot_reg=0 then
							messagebox("Advertencia","Sus Agentes no Registran Premios Mejores Semanales")
						end if
					end if
				else
					messagebox("Advertencia","No Registra Premio Mejor Semanal con Fecha: "+string(ldt_fecha_fin,"dd/mm/yyyy"))
				end if
				dw_mejores_imprime.dataobject								= 'dw_premio_mejores_imprime'
				dw_mejores_imprime.settransobject(sqlca)
				ll_tot_reg															= dw_mejores_imprime.retrieve(ldt_fecha_fin,ll_cod_parque)
				dw_mejores_imprime.Object.usuario.text 					= gs_user
				for ll_indi=1 to ll_tot_reg
					ls_agente														= dw_mejores_imprime.getitemstring(ll_indi,'promesa_lugar_codigo')
					ls_clasif_hist													= f_clasif_hist(ls_agente,ldt_fecha_fin)
					dw_mejores_imprime.setitem(ll_indi,'c_clasif',ls_clasif_hist)
				next
				dw_mejores_imprime.accepttext()
			end if
		end if
	else
	end if
end if
end event

type cb_eliminar from commandbutton within w_premios_semanal
boolean visible = false
integer x = 3063
integer y = 1732
integer width = 507
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar Proceso"
end type

event clicked;string		ls_base,ls_serie,ls_estado_premio
long		ll_res,ll_graba=0,ll_act_ctto,ll_cta_ofe,ll_cta_aum,ll_tot_reg
datetime	ldt_fecha_fin,ldt_cierre_semana,ldt_fecha_term
double	ldb_numero

dw_parque.accepttext()
dw_premio_caja.reset()
dw_ingreso_imprime.reset()
dw_premio_mejor.reset()
dw_mejores_imprime.reset()
ldt_fecha_fin										= datetime(date(em_termino.text),time('00:00:00'))
if not isnull(ldt_fecha_fin) then
	SELECT	max("FECHA_TERMINO")
	INTO		:ldt_fecha_term
	FROM		"CIERRE_PAGOS_VENTAS"  
	WHERE	"CIERRE_PAGOS_VENTAS"."FECHA_INICIO" <= :ldt_fecha_fin AND  
				"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" >= :ldt_fecha_fin AND
				("CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = 3 or "CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = 4) AND
				"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = 'A'
	USING	sqlca;
	if not isnull(ldt_fecha_term) then
		ll_res												= MessageBox("Eliminar","¿Desea Eliminar Proceso Premio Semanal con Fecha :"+string(ldt_fecha_fin,"dd/mm/yyyy")+" ?", Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			DELETE FROM "RES_COMI"  
			WHERE	(	"RES_COMI"."FECHA" = :ldt_fecha_fin ) AND  
						(	"RES_COMI"."COD_CONTABLE" = '044' OR "RES_COMI"."COD_CONTABLE" = '045' OR "RES_COMI"."COD_CONTABLE" = '046')
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				ll_graba++
			else
				rollback using sqlca;
			end if
			DELETE FROM "PREMIOS_SEMANA_PROC"
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				ll_graba++
			else
				rollback using sqlca;
			end if
			DELETE FROM "PROMESA_LUGAR"  
			WHERE	( "PROMESA_LUGAR"."FECHA" = :ldt_fecha_fin )
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				ll_graba++
			else
				rollback using sqlca;
			end if
			DELETE FROM "PROMESA_PREMIO"  
			WHERE	( "PROMESA_PREMIO"."FECHA" = :ldt_fecha_fin)
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				ll_graba++
			else
				rollback using sqlca;
			end if
			DELETE FROM "CIERRE_PAGOS_VENTAS"  
			WHERE ( "CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin )
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				ll_graba++
			else
				rollback using sqlca;
			end if
			
			SELECT	count("CADENA"."CODIGO")
			INTO		:ll_cta_ofe
			FROM		"OFERTA_V",	"PAGO_OFERTA",	"CADENA"  
			WHERE 	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
						"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
						"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
						"PAGO_OFERTA"."SERIE" = "CADENA"."SERIE" and  
						"PAGO_OFERTA"."NRO_OFERTA" = "CADENA"."NUMERO" and  
						"CADENA"."CODIGO" = 'O' AND  
						"OFERTA_V"."ESTADO_PREMIO" = 'S' AND  
						"OFERTA_V"."CIERRE_VENTA_SEMANAL" = :ldt_fecha_fin
			USING	sqlca;
			SELECT	count("CADENA"."CODIGO")
			INTO		:ll_cta_aum
			FROM		"ANEXO_AUMENTO",	"PAGO_AUMENTO",	"CADENA"  
			WHERE 	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and  
						"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
						"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
						"PAGO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" and  
						"PAGO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" and  
						"CADENA"."CODIGO" = 'A' AND  
						"ANEXO_AUMENTO"."ESTADO_PREMIO" = 'S' AND  
						"ANEXO_AUMENTO"."CIERRE_VENTA_SEMANAL" = :ldt_fecha_fin
			USING	sqlca;
			if isnull(ll_cta_ofe) then ll_cta_ofe=0 
			if isnull(ll_cta_aum) then ll_cta_aum=0
			ll_tot_reg								= ll_cta_ofe + ll_cta_aum
			if ll_tot_reg>0 then
				DECLARE x1 CURSOR FOR  
				SELECT	"CADENA"."CODIGO",	"OFERTA_V"."SERIE",	"OFERTA_V"."NRO_OFERTA",	"OFERTA_V"."ESTADO_PREMIO",	"OFERTA_V"."CIERRE_VENTA_SEMANAL"  
				FROM		"OFERTA_V",	"PAGO_OFERTA",	"CADENA"  
				WHERE 	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
							"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
							"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
							"PAGO_OFERTA"."SERIE" = "CADENA"."SERIE" and  
							"PAGO_OFERTA"."NRO_OFERTA" = "CADENA"."NUMERO" and  
							"CADENA"."CODIGO" = 'O' AND  
							"OFERTA_V"."ESTADO_PREMIO" = 'S' AND  
							"OFERTA_V"."CIERRE_VENTA_SEMANAL" = :ldt_fecha_fin
				UNION
				SELECT	"CADENA"."CODIGO",	"ANEXO_AUMENTO"."SERIE_M",	"ANEXO_AUMENTO"."NRO_AUMENTO",	"ANEXO_AUMENTO"."ESTADO_PREMIO",	"ANEXO_AUMENTO"."CIERRE_VENTA_SEMANAL"  
				FROM		"ANEXO_AUMENTO",	"PAGO_AUMENTO",	"CADENA"  
				WHERE 	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and  
							"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
							"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
							"PAGO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" and  
							"PAGO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" and  
							"CADENA"."CODIGO" = 'A' AND  
							"ANEXO_AUMENTO"."ESTADO_PREMIO" = 'S' AND  
							"ANEXO_AUMENTO"."CIERRE_VENTA_SEMANAL" = :ldt_fecha_fin
				USING	sqlca;
				open x1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x1 INTO	:ls_base,	:ls_serie,	:ldb_numero,	:ls_estado_premio,	:ldt_cierre_semana;
						if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ldb_numero) and ldb_numero > 0 then
							if ls_base='O' then
								UPDATE	"OFERTA_V"  
								SET		"ESTADO_PREMIO" = 'N',   
											"CIERRE_VENTA_SEMANAL" = null  
								WHERE 	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
								USING	Trans_1;
							elseif ls_base='A' then
								UPDATE	"ANEXO_AUMENTO"  
								SET		"ESTADO_PREMIO" = 'N',   
											"CIERRE_VENTA_SEMANAL" = null  
								WHERE 	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
								USING	Trans_1;
							end if
							if Trans_1.sqlcode = 0 then
								commit using Trans_1;
								ll_act_ctto++
							else
								rollback using Trans_1;
							end if
						end if
						setnull(ls_base);setnull(ls_serie);setnull(ldb_numero)
					LOOP
				end if
				close x1;
				if ll_act_ctto=ll_tot_reg then
					ll_graba++
				end if
			end if
			if ll_graba=6 then
				MessageBox("Eliminar","Proceso de Eliminación Exitoso")
				w_premios_semanal.triggerevent(open!)
			end if
		else
			MessageBox("Eliminar","¿Proceso de Eliminación Cancelado?")
		end if
	else
		messagebox("Advertencia","No Existe Proceso con Fecha : "+string(ldt_fecha_fin,'dd/mm/yyyy'))
	end if
end if
end event

type cb_mejores_nf from commandbutton within w_premios_semanal
integer x = 3086
integer y = 1480
integer width = 480
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Mejor Agentes N.F"
end type

event clicked;string	ls_tipo_empleado,ls_agente,ls_clasif_hist,ls_canal,ls_filtro
long		ll_cod_parque,ll_tipo_prem_mejor,ll_tot_reg,ll_indi
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_proceso,ldt_fecha_term
double	ldb_valor_uf

is_canal																			= 'NF'
ldt_fecha_ini																	= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin																	= datetime(date(em_termino.text),time('00:00:00'))
ll_cod_parque																	= dw_parque.getitemnumber(1,'parque')
ldt_fecha_proceso																= gdt_fec_sistema
ll_tipo_prem_mejor															= 4
ls_tipo_empleado																= 'A'

dw_premio_mejor.reset()
dw_mejores_imprime.reset()
dw_premio_mejor.dataobject												= 'dw_premio_mejor_promesa_calculo'
dw_premio_mejor.settransobject(sqlca)
dw_premio_mejor.Object.usuario.text 									= gs_user
ls_canal										 									= 'NF'

SELECT	"TAB_UF"."VALOR_UF"  
INTO		:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE	"TAB_UF"."FECHA_UF" = :ldt_fecha_fin
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_valor_uf) and ldb_valor_uf > 0 then
		SELECT	"FECHA_TERMINO"
		INTO		:ldt_fecha_term
		FROM		"CIERRE_PAGOS_VENTAS"  
		WHERE	"CIERRE_PAGOS_VENTAS"."FECHA_INICIO" <= :ldt_fecha_fin AND  
					"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" >= :ldt_fecha_fin AND
					"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_prem_mejor AND
					"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
					"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
		USING	Trans_1;
		if Trans_1.sqlcode=0 then
			if not isnull(ldt_fecha_term) then
				dw_premio_mejor.dataobject								= 'dw_premio_mejor_promesa_lugar'
				dw_premio_mejor.settransobject(sqlca)
				ll_tot_reg														= dw_premio_mejor.retrieve(ldt_fecha_fin,ll_cod_parque,ls_canal)
				dw_premio_mejor.Object.usuario.text 					= gs_user
				dw_premio_mejor.setFilter("uso = 'NF' and lugar <= 4")
				dw_premio_mejor.filter()
				ll_tot_reg														= dw_premio_mejor.rowcount()
				if ll_tot_reg>0 then
					for ll_indi = 1 to ll_tot_reg
						ls_agente												= dw_premio_mejor.getitemstring(ll_indi,'codigo')
						ls_clasif_hist											= f_clasif_hist(ls_agente,ldt_fecha_fin)
						dw_premio_mejor.setitem(ll_indi,'c_clasif',ls_clasif_hist)
						dw_premio_mejor.setitem(ll_indi,'c_cod_haber','046')
					next
					dw_premio_mejor.accepttext()
					if gs_depto='B' or gs_depto='R' or gs_depto='X' then
						cb_imprimir.visible										= false
						cb_eliminar.visible										= false
						if gs_depto='R' then
							ls_filtro												= "agentes_cod_sup ='"+gs_user+"'"
						elseif gs_depto='B' then
							ls_filtro												= "supervisor_cod_jefe ='"+gs_user+"'"
						end if
						dw_premio_mejor.setfilter(ls_filtro)
						dw_premio_mejor.filter( )
						ll_tot_reg												= dw_premio_mejor.rowcount()
						if ll_tot_reg=0 then
							messagebox("Advertencia","Sus Agentes no Registran Premios Mejores Semanales")
						end if
					end if
				else
					messagebox("Advertencia","No Registra Premio Mejor Semanal con Fecha: "+string(ldt_fecha_fin,"dd/mm/yyyy"))
				end if
				dw_mejores_imprime.dataobject							= 'dw_premio_mejores_imprime'
				dw_mejores_imprime.settransobject(sqlca)
				ll_tot_reg														= dw_mejores_imprime.retrieve(ldt_fecha_fin,ll_cod_parque)
				dw_mejores_imprime.Object.usuario.text 				= gs_user
				for ll_indi=1 to ll_tot_reg
					ls_agente													= dw_mejores_imprime.getitemstring(ll_indi,'promesa_lugar_codigo')
					ls_clasif_hist												= f_clasif_hist(ls_agente,ldt_fecha_fin)
					dw_mejores_imprime.setitem(ll_indi,'c_clasif',ls_clasif_hist)
				next
				dw_mejores_imprime.accepttext()
			end if
		end if
	else
	end if
end if
end event

type cb_grabar from commandbutton within w_premios_semanal
integer x = 37
integer y = 2020
integer width = 279
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_base,ls_serie,ls_forma,ls_uso,ls_cod_contad,ls_cod_agte,ls_haber,ls_moneda,ls_estado_premio,ls_est_agte,ls_uso_mejor,&
			ls_codigo,ls_tipo_empleado,ls_graba_sem='N',ls_graba_ing='N',ls_graba_res1='N',ls_graba_per='N',ls_agente,ls_clasif_hist,ls_graba_mej='N'
long		ll_tot_reg,ll_indi,ll_monto,ll_cod_premio,ll_cod_parque,ll_rut_agte,ll_tot_pagado,ll_mes,ll_malos=0,ll_cont=0,ll_cta,&
			ll_res,ll_tipo_premio,ll_tot_mejor_semana,ll_lugar,ll_premio,ll_tot_ing_caja,ll_tipo_prem_ing_caja,ll_tipo_prem_mejor,ll_graba=0
datetime	ldt_fecha,ldt_fecha_ini,ldt_fecha_fin,ldt_cierre_semana,ldt_fecha_consul
double	ldb_numero,ldb_porcentaje,ldb_precio,ldb_porce_vta,ldb_valor_uf,ldb_producc

dw_parque.accepttext()
dw_premio_caja.accepttext()
ldt_fecha_ini														= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin														= datetime(date(em_termino.text),time('00:00:00'))
ll_cod_parque														= dw_parque.getitemnumber(1,'parque')
ll_tipo_prem_ing_caja											= 3
ll_tipo_prem_mejor												= 4
ls_tipo_empleado													= 'A'
ll_cont 																= 0
ls_estado_premio													= 'S'

SELECT DISTINCT	"FECHA_TERMINO"
INTO		:ldt_fecha_consul
FROM		"CIERRE_PAGOS_VENTAS"
WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_prem_ing_caja AND
			"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
			"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
			"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
USING		sqlca;
if sqlca.sqlcode = 0 then
	if not isnull(ldt_fecha_consul) then
		messagebox("Advertencia","Proceso Premio Ingreso Caja Semanal Fue Grabado con Fecha :"+string(ldt_fecha_fin,"dd/mm/yyyy"))
	end if
else
	ll_res																= MessageBox("Grabar","¿Desea Grabar Premio Ingreso Caja Semanal?", Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		INSERT INTO "CIERRE_PAGOS_VENTAS"  
						( "FECHA_INICIO",	"FECHA_TERMINO",	"FECHA_PROCESO",	"TIPO_PREMIO",			"COD_PARQUE",	"USUARIO_CREA",	"TIPO_EMPLEADO" )  
		VALUES		( :ldt_fecha_ini,	:ldt_fecha_fin,			:gdt_fec_sistema,		:ll_tipo_prem_ing_caja,	:ll_cod_parque,		:gs_user,			:ls_tipo_empleado )  ;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			ls_graba_per												= 'S'
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
			ll_cont ++
		end if
		
//		//cierre_semana
		SELECT	count("BASE")
		INTO		:ll_cta
		FROM		"PREMIOS_SEMANA_PROC"
		USING	sqlca;
		if isnull(ll_cta) then ll_cta=0
		DECLARE x1 CURSOR FOR  
		SELECT	"BASE",	"SERIE",	"NUMERO",	"CIERRE_SEMANA"  
		FROM		"PREMIOS_SEMANA_PROC"
		WHERE	"PREMIOS_SEMANA_PROC"."COD_PARQUE_AGE" = :ll_cod_parque
		USING	sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
			fetch x1 INTO	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_cierre_semana;
				if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
					if ls_base='O' then 
						UPDATE	"OFERTA_V"  
						SET		"ESTADO_PREMIO" = :ls_estado_premio,   
									"CIERRE_VENTA_SEMANAL" = :ldt_cierre_semana  
						WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
									( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
						USING	Trans_1;
					elseif ls_base='A' then 
						UPDATE	"ANEXO_AUMENTO"  
						SET		"ESTADO_PREMIO" = :ls_estado_premio,   
									"CIERRE_VENTA_SEMANAL" = :ldt_cierre_semana  
						WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
									( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
						USING	Trans_1;
					end if
					if Trans_1.sqlcode=0 then
						commit using Trans_1;
						ll_graba++
					else
						rollback using Trans_1;
						messagebox("Error Grabar","Error al Grabar SQL: "+Trans_1.sqlerrtext)
						ll_cont ++	
					end if
				end if
				setnull(ls_serie);setnull(ldb_numero)
			LOOP
		end if
		close x1;	
		if ll_cta=ll_graba then
			ls_graba_sem												= 'S'
		end if
		//premio_caja
		ll_tot_ing_caja													= dw_premio_caja.rowcount()
		if ll_tot_ing_caja>0 then
			if dw_premio_caja.update() = 1 then
				commit using sqlca;
				ls_graba_ing											= 'S'
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Premios Ingreso Caja SQL: "+sqlca.sqlerrtext)
				ll_cont++
			end if
			for ll_indi = 1 to ll_tot_ing_caja
				ls_cod_agte												= dw_premio_caja.getitemstring(ll_indi,'c_agente')
				ll_tot_pagado											= dw_premio_caja.getitemnumber(ll_indi,'c_monto')
				ls_cod_contad											= dw_premio_caja.getitemstring(ll_indi,'c_cod_cont')
				ll_mes													= month(date(ldt_fecha))
				ldt_fecha													= dw_premio_caja.getitemdatetime(ll_indi,'fecha')
				ldb_numero												= dw_premio_caja.getitemnumber(ll_indi,'numero')
				ls_base													= dw_premio_caja.getitemstring(ll_indi,'base')
				ls_serie													= dw_premio_caja.getitemstring(ll_indi,'serie')
				ldb_porce_vta											= 0
				ldb_porcentaje											= dw_premio_caja.getitemnumber(ll_indi,'porcentaje')
				ldb_precio												= dw_premio_caja.getitemnumber(ll_indi,'c_precio_pago_oferta')										
				ll_monto													= dw_premio_caja.getitemnumber(ll_indi,'monto')
				ls_haber													= 'H'
				ls_est_agte												= dw_premio_caja.getitemstring(ll_indi,'c_estado')
				ls_moneda												= dw_premio_caja.getitemstring(ll_indi,'c_moneda')
				SELECT	"AGENTES"."RUT"  
				INTO 		:ll_rut_agte  
				FROM 	"AGENTES"  
				WHERE	( "AGENTES"."COD_AGE" = :ls_cod_agte ) AND ( "AGENTES"."ESTADO" = 'A' )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_rut_agte		= ll_rut_agte
				else
					ll_rut_agte		= 0
				end if
				SELECT	"TAB_UF"."VALOR_UF"  
				INTO		:ldb_valor_uf  
				FROM		"TAB_UF"  
				WHERE	"TAB_UF"."FECHA_UF" = :ldt_fecha
				USING	sqlca;
				if isnull(ldb_valor_uf) then ldb_valor_uf = 0
				if f_graba_res_comi(ls_cod_agte,ll_rut_agte,ll_tot_pagado,ls_cod_contad,string(ll_mes),ldt_fecha,ldb_numero,ls_serie,ldb_porcentaje,ldb_porce_vta,ldb_precio,ll_monto,ldb_valor_uf,ls_haber,ls_moneda,'P',ls_est_agte,ls_base,ll_cod_parque,0,0)= -1 then
					ll_malos++
				else
					ll_cont++
				end if	
			next
			if ll_cont=(ll_indi - 1) then
				ls_graba_res1											= 'S'
			end if
			
		end if
		
		if ls_graba_sem='S' and ls_graba_ing='S' and ls_graba_res1='S' and ls_graba_per='S' then
			messagebox("Grabar","Grabación Ingreso Caja Semanal Exitoso")
		end if
	end if
end if

//premio_mejor
ll_malos																= 0
ll_cont																= 0
ls_graba_res1														= 'N'
ls_graba_per														= 'N'
SELECT DISTINCT	"FECHA_TERMINO"
INTO		:ldt_fecha_consul
FROM		"CIERRE_PAGOS_VENTAS"
WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_prem_mejor AND
			"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
			"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
			"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
USING		sqlca;
if sqlca.sqlcode = 0 then
	if not isnull(ldt_fecha_consul) then
		messagebox("Advertencia","Proceso Premio Mejores Semanal Fue Grabado con Fecha :"+string(ldt_fecha_fin,"dd/mm/yyyy"))
	end if
else
	ll_res																= MessageBox("Grabar","¿Desea Grabar Premio Mejores Semanal?", Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		INSERT INTO	"CIERRE_PAGOS_VENTAS"  
						( "FECHA_INICIO",	"FECHA_TERMINO",	"FECHA_PROCESO",	"TIPO_PREMIO",		"COD_PARQUE",	"USUARIO_CREA",	"TIPO_EMPLEADO" )  
		VALUES		( :ldt_fecha_ini,	:ldt_fecha_fin,			:gdt_fec_sistema,		:ll_tipo_prem_mejor,	:ll_cod_parque,		:gs_user,			:ls_tipo_empleado )  ;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			ls_graba_per												= 'S'
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
		
		ll_tot_mejor_semana										= dw_premio_mejor.rowcount()
		if ll_tot_mejor_semana>0 then
			if dw_premio_mejor.update() = 1 then
				commit using sqlca;
				ls_graba_mej										= 'S'
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Premios Mejores Agentes SQL: "+sqlca.sqlerrtext)
				ll_cont++
			end if
			for ll_indi = 1 to ll_tot_mejor_semana
				ls_codigo												= dw_premio_mejor.getitemstring(ll_indi,'codigo')
				ll_tot_pagado										= 0
				ls_cod_contad										= dw_premio_mejor.getitemstring(ll_indi,'c_cod_cont')
				ll_mes												= month(date(ldt_fecha))
				ldt_fecha												= dw_premio_mejor.getitemdatetime(ll_indi,'fecha')
				ldb_numero											= 0
				ls_serie												= ' '
				ldb_porce_vta										= 0
				ldb_porcentaje										= 0
				ldb_precio											= 0
				ll_premio												= dw_premio_mejor.getitemnumber(ll_indi,'monto')
				ls_haber												= 'H'
				ls_est_agte											= dw_premio_mejor.getitemstring(ll_indi,'c_estado')
				SELECT	"AGENTES"."RUT"  
				INTO 		:ll_rut_agte  
				FROM 	"AGENTES"  
				WHERE	( "AGENTES"."COD_AGE" = :ls_codigo ) AND ( "AGENTES"."ESTADO" = 'A' )
				USING	sqlca;
				if sqlca.sqlcode=0 then
					ll_rut_agte		= ll_rut_agte
				else
					ll_rut_agte		= 0
				end if
				if f_graba_res_comi(ls_codigo,ll_rut_agte,ll_tot_pagado,ls_cod_contad,string(ll_mes),ldt_fecha,0,ls_serie,0,0,0,ll_premio,0,ls_haber,'','P',ls_est_agte,'',ll_cod_parque,0,0)= -1 then
					ll_malos++
				else
					ll_cont++
				end if
			next
			if ll_cont = (ll_indi - 1) then
				ls_graba_res1											= 'S'
			end if
		end if
		
		if ls_graba_ing='S' and ls_graba_res1='S' and ls_graba_per='S' then
			messagebox("Grabar","Grabación Mejores Semanal Exitoso")
		end if
		dw_ingreso_imprime.dataobject							= 'dw_premio_ing_caja_imprime'
		dw_ingreso_imprime.settransobject(sqlca)
		ll_tot_reg														= dw_ingreso_imprime.retrieve(ldt_fecha,ll_cod_parque)
		if ll_tot_reg>0 then
			dw_ingreso_imprime.Object.usuario.text				= gs_user
			for ll_indi=1 to ll_tot_reg
				ls_agente												= dw_ingreso_imprime.getitemstring(ll_indi,'agentes_cod_age')
				ls_clasif_hist											= f_clasif_hist(ls_agente,ldt_fecha_fin)
				dw_ingreso_imprime.setitem(ll_indi,'c_clasif',ls_clasif_hist)
			next
			dw_ingreso_imprime.accepttext()
		end if 
		
		dw_mejores_imprime.dataobject							= 'dw_premio_mejores_imprime'
		dw_mejores_imprime.settransobject(sqlca)
		ll_tot_reg														= dw_mejores_imprime.retrieve(ldt_fecha_fin,ll_cod_parque)
		if ll_tot_reg>0 then
			dw_mejores_imprime.Object.usuario.text			= gs_user
			for ll_indi=1 to ll_tot_reg
				ls_agente												= dw_mejores_imprime.getitemstring(ll_indi,'promesa_lugar_codigo')
				ls_clasif_hist											= f_clasif_hist(ls_agente,ldt_fecha_fin)
				dw_mejores_imprime.setitem(ll_indi,'c_clasif',ls_clasif_hist)
			next
			dw_mejores_imprime.accepttext()
		end if 
	end if
end if
end event

type st_valor_uf from statictext within w_premios_semanal
integer x = 3250
integer y = 92
integer width = 347
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_valor_uf_t from statictext within w_premios_semanal
integer x = 2921
integer y = 108
integer width = 302
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Valor U.F. :"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_mejores_imprime from datawindow within w_premios_semanal
boolean visible = false
integer x = 3767
integer y = 432
integer width = 608
integer height = 368
integer taborder = 30
string title = "none"
string dataobject = "dw_premio_mejores_imprime"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_ingreso_imprime from datawindow within w_premios_semanal
boolean visible = false
integer x = 3767
integer y = 40
integer width = 608
integer height = 376
integer taborder = 100
string title = "none"
string dataobject = "dw_premio_ing_caja_imprime"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_detalle from commandbutton within w_premios_semanal
integer x = 1847
integer y = 2020
integer width = 361
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Ventas"
end type

event clicked;string	ls_codigo,ls_string,ls_detalle
datetime	ldt_fecha

dw_premio_mejor.accepttext()
if dw_premio_mejor.rowcount() > 0 then
	ldt_fecha					= datetime(date(em_termino.text),time('00:00:00'))
	ls_codigo					= dw_premio_mejor.getitemstring(il_row,'codigo')
end if

if dw_premio_mejor.dataobject='dw_premio_mejor_promesa_lugar' then
	ls_detalle					= 'H'
elseif dw_premio_mejor.dataobject='dw_premio_mejor_promesa_calculo' then
	ls_detalle					= 'A'
end if
	
if not isnull(ls_codigo) and ls_codigo<>''  then
	ls_string					= string(ldt_fecha,'dd/mm/yyyy')+'~t'+ls_codigo+'~t'+ls_detalle
	if isvalid(w_detalle_ventas_semanal) then close(w_detalle_ventas_semanal)
	OpenWithParm (w_detalle_ventas_semanal,ls_string)
end if
end event

type dw_premio_mejor from datawindow within w_premios_semanal
integer x = 37
integer y = 1176
integer width = 2976
integer height = 816
integer taborder = 30
string title = "none"
string dataobject = "dw_premio_mejor_promesa_calculo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;cb_pagos.enabled			= false
cb_cta_cte.enabled		= false
cb_asocia_rut.enabled	= false
cb_detalle.enabled		= true
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	il_row_caja		= 0
	il_row_mejor	= il_row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event clicked;if row>0 then
	il_row	= row
	il_row_caja		= 0
	il_row_mejor	= il_row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;cb_detalle.triggerevent(clicked!)
end event

type dw_parque from datawindow within w_premios_semanal
integer x = 1189
integer y = 68
integer width = 777
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long		ll_cod_parque,ll_mes,ll_anno,ll_dia
datetime	ldt_fecha_fin,ldt_fecha_ini,ldt_fecha_premio_mensual

dw_premio_caja.reset()
dw_premio_mejor.reset()
dw_ingreso_imprime.reset()
dw_mejores_imprime.reset()

ll_cod_parque							= long(data)
ldt_fecha_fin							= datetime(date(em_termino.text))
em_inicio.text							= string(RelativeDate((date(em_termino.text)), - 6),"dd/mm/yyyy")
ldt_fecha_ini							= datetime(date(em_inicio.text),time('00:00:00'))
ll_mes									= month(date(ldt_fecha_ini))
ll_anno									= year(date(ldt_fecha_ini))
ldt_fecha_premio_mensual			= f_fecha_fin(ll_mes,ll_anno)

if ldt_fecha_premio_mensual >= ldt_fecha_ini and ldt_fecha_premio_mensual <= ldt_fecha_fin then
	cb_mejores_nf.enabled			= false
	cb_mejores_ni.enabled			= false
else
	cb_mejores_nf.enabled			= true
	cb_mejores_ni.enabled			= true
	if ll_cod_parque = 1 then
		cb_mejores_ni.enabled		= true
	else
		cb_mejores_ni.enabled		= false
	end if
end if
end event

type p_termino from picture within w_premios_semanal
integer x = 1042
integer y = 64
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string		ls_fecha
long		ll_mes,ll_anno
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fec_mensual,ldt_ult_fec,ldt_fec_proceso

//gdt_fec_sistema					= datetime(date(string('24/03/2015')))	
dw_premio_caja.reset()
dw_premio_mejor.reset()
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text				= string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha 							= em_termino.text
else
	ls_fecha 							= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
if Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
	ldt_fecha_fin					= datetime(date(em_termino.text))
	if gs_depto='I' or gs_depto='D' then
		SELECT	max("FECHA_TERMINO")  
		INTO 		:ldt_ult_fec  
		FROM 	"CIERRE_PAGOS_VENTAS"
		USING	sqlca;
		ldt_fec_proceso				= datetime((RelativeDate(date(ldt_ult_fec),9)),time('00:00:00'))
		if ldt_fecha_fin>ldt_ult_fec and ldt_fec_proceso<=gdt_fec_sistema then
			cb_actualiza.visible		= true
		else
			cb_actualiza.visible		= false
		end if
		wf_rev_res_comi(ldt_fecha_fin)
	end if
	em_inicio.text						= string(RelativeDate((date(em_termino.text)), - 6),"dd/mm/yyyy")
	ldt_fecha_ini						= datetime(date(em_inicio.text),time('00:00:00'))
	ll_mes								= month(date(ldt_fecha_ini))
	ll_anno								= year(date(ldt_fecha_ini))
	ldt_fec_mensual					= f_fecha_fin(ll_mes,ll_anno)
	if ldt_fec_mensual >= ldt_fecha_ini and ldt_fec_mensual <= ldt_fecha_fin then
		cb_mejores_nf.enabled		= false
		cb_mejores_ni.enabled		= false
	else
		cb_mejores_nf.enabled		= true
		cb_mejores_ni.enabled		= true
	end if
end if
dw_premio_caja.reset()
end event

type em_ctto from editmask within w_premios_semanal
integer x = 3090
integer y = 1228
integer width = 352
integer height = 92
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if double(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_premios_semanal
integer x = 3447
integer y = 1228
integer width = 110
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string	ls_string
double	ldb_numero

ldb_numero						= double(em_ctto.text)
ll_tot_reg						= dw_premio_caja.rowcount()
if ll_tot_reg > 0 then
	ls_string					= "numero = "+string(ldb_numero)
	if ldb_numero>0 then
		ll_fila 					= dw_premio_caja.find(ls_string, 1, ll_tot_reg)
		if ll_fila>0 then
			dw_premio_caja.scrolltorow(ll_fila)
			dw_premio_caja.SelectRow(ll_fila, true)
		else
			messagebox("Advertencia","Nº Contrato No Existe en Lista")
			dw_premio_caja.scrolltorow(1)
		end if
	end if
else
	messagebox("Advertencia","No Existe Lista de Busqueda")
end if

end event

type cb_pagos from commandbutton within w_premios_semanal
integer x = 731
integer y = 2020
integer width = 352
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pagos &Ventas"
end type

event clicked;string		ls_base,ls_serie,ls_string
double	ldb_numero

if dw_premio_caja.rowcount() > 0 then
	ls_base					= dw_premio_caja.getitemstring(il_row,'base')
	ls_serie					= dw_premio_caja.getitemstring(il_row,'serie')
	ldb_numero				= dw_premio_caja.getitemnumber(il_row,'numero')
end if
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
	ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
	if isvalid(w_rescomi_premios) then close(w_rescomi_premios)
	OpenWithParm (w_rescomi_premios,ls_string)
end if
end event

type cb_limpiar from commandbutton within w_premios_semanal
integer x = 2779
integer y = 2020
integer width = 251
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_premio_caja.reset()
dw_ingreso_imprime.reset()
dw_premio_mejor.reset()
dw_mejores_imprime.reset()
em_ctto.text				= ''
end event

type cb_clasif_hist from commandbutton within w_premios_semanal
integer x = 2213
integer y = 2020
integer width = 530
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasificación Historica"
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha

dw_premio_caja.accepttext()
dw_premio_mejor.accepttext()

if il_row_caja > 0 and il_row_mejor = 0 and dw_premio_caja.rowcount() > 0 then
	if dw_premio_caja.dataobject			='dw_premio_ing_caja_promesa_calculo' and dw_premio_caja.rowcount() > 0 then
		ls_codigo								= dw_premio_caja.getitemstring(il_row,'c_agente')
		ldt_fecha								= dw_premio_caja.getitemdatetime(il_row,'fecha')
	elseif dw_premio_caja.dataobject 	='dw_premio_ing_caja_promesa_premio' and dw_premio_caja.rowcount() > 0 then
		ls_codigo								= dw_premio_caja.getitemstring(il_row,'oferta_v_cod_age')
		ldt_fecha								= dw_premio_caja.getitemdatetime(il_row,'fecha')
	end if
elseif il_row_caja = 0 and il_row_mejor > 0 and dw_premio_mejor.rowcount() > 0 then
	if dw_premio_mejor.dataobject 		='dw_premio_mejor_promesa_lugar' and dw_premio_mejor.rowcount() > 0 then
		ls_codigo								= dw_premio_mejor.getitemstring(il_row,'codigo')
		ldt_fecha								= dw_premio_mejor.getitemdatetime(il_row,'fecha')
	elseif dw_premio_mejor.dataobject	='dw_premio_mejor_promesa_calculo' and dw_premio_mejor.rowcount() > 0 then
		ls_codigo								= dw_premio_mejor.getitemstring(il_row,'codigo')
		ldt_fecha								= dw_premio_mejor.getitemdatetime(il_row,'fecha')
	end if
end if

if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fecha) then
	ls_string									= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')
	if isvalid(w_clasifica_historica) then close(w_clasifica_historica)
	OpenWithParm (w_clasifica_historica,ls_string)
end if
end event

type cb_imprimir from commandbutton within w_premios_semanal
integer x = 3035
integer y = 2020
integer width = 251
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long		ll_cod_parque
datetime	ldt_fecha_fin,ldt_fecha_consul

ldt_fecha_fin								= datetime(date(em_termino.text),time('00:00:00'))
ll_cod_parque								= dw_parque.getitemnumber(1,'parque')

SELECT DISTINCT	"FECHA_TERMINO"
INTO		:ldt_fecha_consul
FROM		"CIERRE_PAGOS_VENTAS"
WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = 3 AND
			"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
			"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque
USING		sqlca;
if sqlca.sqlcode = 0 then
	if not isnull(ldt_fecha_consul) then
		if dw_ingreso_imprime.rowcount() > 0 then f_Print( dw_ingreso_imprime )
	end if
else
	if dw_premio_caja.rowcount() > 0 then f_Print( dw_premio_caja )
end if
		
SELECT DISTINCT	"FECHA_TERMINO"
INTO		:ldt_fecha_consul
FROM		"CIERRE_PAGOS_VENTAS"
WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = 4 AND
			"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
			"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque
USING	sqlca;
if sqlca.sqlcode = 0 then
	if not isnull(ldt_fecha_consul) then
		if dw_mejores_imprime.rowcount() > 0 then f_Print( dw_mejores_imprime )
	end if
else
	if dw_premio_mejor.rowcount() > 0 then f_Print( dw_premio_mejor )
end if
end event

type cb_cta_cte from commandbutton within w_premios_semanal
integer x = 1088
integer y = 2020
integer width = 411
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa

dw_premio_caja.accepttext()
if dw_premio_caja.rowcount() > 0 then
	gs_base						= dw_premio_caja.getitemstring(il_row,'base')
	gs_serie						= dw_premio_caja.getitemstring(il_row,'serie')
	gi_numero					= dw_premio_caja.getitemnumber(il_row,'numero')
	gi_rut						= dw_premio_caja.getitemnumber(il_row,'oferta_v_rut')
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

type pb_aceptar from picturebutton within w_premios_semanal
integer x = 1947
integer y = 44
integer width = 128
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_tipo_empleado,ls_base,ls_serie,ls_moneda,ls_agente,ls_clasif_hist,ls_cod_age,ls_uso,ls_estado,&
			ls_forma_pago,ls_canal,ls_cod_contab,ls_filtro,ls_pasa='S'
long		ll_cod_parque,ll_tipo_prem_ing_caja,ll_tot_reg,ll_indi,ll_mto_fin,ll_precio_peso,ll_capac,&
			ll_rut,ll_porcentaje,ll_cod_premio,ll_premio,ll_monto_premio,ll_new,ll_existe
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_recep_fin,ldt_fecha_term,ldt_fecha_recep,ldt_fecha_proceso,ldt_nulo
double	ldb_numero,ldb_valor_uf,ldb_precio,ldb_porce,ldb_precio_uf,ldb_porce_consul,ldb_reduce,ldb_porce_ini

SetPointer(HourGlass!)
dw_parque.accepttext()
dw_premio_caja.reset()
dw_ingreso_imprime.reset()

setnull(ldt_nulo)
ldt_fecha_ini																		= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin																		= datetime(date(em_termino.text),time('00:00:00'))
ldt_fecha_recep_fin																= datetime((RelativeDate(date(ldt_fecha_fin),- 2)),time('18:30:00'))
ll_cod_parque																		= dw_parque.getitemnumber(1,'parque')
ll_tipo_prem_ing_caja															= 3
ls_tipo_empleado																	= 'A'
if isnull(ll_cod_parque) or ll_cod_parque = 0 then
	messagebox("Advertencia", "Debe Ingresar Parque")
	dw_parque.setfocus()
	ls_pasa																			= 'N'
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO		:ldb_valor_uf  
	FROM		"TAB_UF"  
	WHERE	"TAB_UF"."FECHA_UF" = :ldt_fecha_fin
	USING	sqlca;
	if isnull(ldb_valor_uf) then ldb_valor_uf=0
	if ldb_valor_uf = 0 then
		messagebox("Advertencia","No Existe Valor U.F. del :"+string(ldt_fecha_fin,"dd/mm/yyyy"))
		em_termino.setfocus()
		ls_pasa																		= 'N'
	end if
end if

if ls_pasa='S' then
	st_valor_uf.text																	= string(ldb_valor_uf,'###,###,###,###.00')
	SELECT	"FECHA_TERMINO"
	INTO		:ldt_fecha_term
	FROM		"CIERRE_PAGOS_VENTAS"  
	WHERE	"CIERRE_PAGOS_VENTAS"."FECHA_INICIO" <= :ldt_fecha_fin AND  
				"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" >= :ldt_fecha_fin AND
				"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_prem_ing_caja AND
				"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
				"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_term) then
			cb_grabar.enabled														= false
			dw_premio_caja.dataobject											= 'dw_premio_ing_caja_promesa_premio'
			dw_premio_caja.settransobject(sqlca)
			ll_tot_reg																= dw_premio_caja.retrieve(ldt_fecha_fin,ll_cod_parque)
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Premio Ingreso Caja con Fecha: "+string(ldt_fecha_fin,"dd/mm/yyyy"))	
			else
				if gs_depto='R' or gs_depto='B' or gs_depto='X' then
					cb_imprimir.visible												= false
					cb_eliminar.visible												= false
					if gs_depto='R' then
						ls_filtro														= "oferta_v_cod_sup ='"+gs_user+"'"
					elseif gs_depto='B' then
						ls_filtro														= "oferta_v_cod_jef ='"+gs_user+"'"
					end if
					dw_premio_caja.setfilter(ls_filtro)
					dw_premio_caja.filter( )
					ll_tot_reg														= dw_premio_caja.rowcount()
					if ll_tot_reg=0 then
						messagebox("Advertencia","Su Agentes a Cargo No Registran Premios Ingreso a Caja ")
					end if
				end if
				
				for ll_indi = 1 to ll_tot_reg
					ls_base															= dw_premio_caja.getitemstring(ll_indi,'base')
					ls_serie															= dw_premio_caja.getitemstring(ll_indi,'serie')
					ldb_numero														= dw_premio_caja.getitemnumber(ll_indi,'numero')
					ls_moneda														= dw_premio_caja.getitemstring(ll_indi,'pago_oferta_moneda')
					ldb_precio														= dw_premio_caja.getitemnumber(ll_indi,'pago_oferta_precio')
					ls_agente														= dw_premio_caja.getitemstring(ll_indi,'oferta_v_cod_age')
					ls_clasif_hist													= f_clasif_hist(ls_agente,ldt_fecha_fin)
					ll_mto_fin														= f_premio_ing_caja_porce2(ls_base,ls_serie,ldb_numero,ldt_fecha_ini,ldt_fecha_fin,1)
					if ll_mto_fin<=il_mto_min then
						il_mto															= f_premio_ing_caja_porce2(ls_base,ls_serie,ldb_numero,ldt_fecha_ini,ldt_fecha_fin,2)	
					end if
					ll_mto_fin														= ll_mto_fin + il_mto
					if ls_moneda = '1' then
						ll_precio_peso												= Round(ldb_precio,0)
					else
						ll_precio_peso												= Round(ldb_precio * ldb_valor_uf,0)
					end if
					ldb_porce														= Round(ll_mto_fin/ll_precio_peso*100,2)
					dw_premio_caja.setitem(ll_indi,'c_clasif',ls_clasif_hist)
					dw_premio_caja.setitem(ll_indi,'c_precio',ll_precio_peso)
					dw_premio_caja.setitem(ll_indi,'c_porcent',ldb_porce)
					dw_premio_caja.setitem(ll_indi,"c_monto",ll_mto_fin)
					dw_premio_caja.accepttext()
					ll_mto_fin														= 0
					il_mto																= 0
				next
			end if
			dw_ingreso_imprime.dataobject									= 'dw_premio_ing_caja_imprime'
			dw_ingreso_imprime.settransobject(sqlca)
			ll_tot_reg																= dw_ingreso_imprime.retrieve(ldt_fecha_fin,ll_cod_parque)
			dw_ingreso_imprime.Object.usuario.text 						= gs_user
			for ll_indi = 1 to ll_tot_reg
				ls_agente															= dw_ingreso_imprime.getitemstring(ll_indi,'agentes_cod_age')
				ls_clasif_hist														= f_clasif_hist(ls_agente,ldt_fecha_fin)
				dw_ingreso_imprime.setitem(ll_indi,'c_clasif',ls_clasif_hist)
			next
			dw_ingreso_imprime.accepttext()
		end if
	else
		if gl_proceso<=3 then
			messagebox("Advertencia","No Registra Premio Ingreso Caja con Fecha: "+string(ldt_fecha_fin,"dd/mm/yyyy"))	
		elseif (gl_proceso = 5 and gs_depto = 'I') or (gl_proceso = 4 and gs_depto = 'D') then
			cb_grabar.enabled															= true
			dw_premio_caja.dataobject												= 'dw_premio_ing_caja_promesa_calculo'
			dw_premio_caja.settransobject(sqlca)
			dw_premio_caja.Object.usuario.text 									= gs_user
			DECLARE x1 CURSOR FOR
			SELECT	"COD_PARQUE_CTTO",   "BASE",	"SERIE",	"NUMERO",	"COD_AGE",	"CAPAC",	"USO",	"PRECIO",	"MONEDA",	"ESTADO_AGE",	"FORMA_PAGO",	"RUT_AGE",	"CANAL",	"PRECIO_UF", "PRECIO_PESO"    
         	FROM		"PREMIOS_SEMANA_PROC"
			WHERE	"PREMIOS_SEMANA_PROC"."COD_PARQUE_CTTO" = :ll_cod_parque
			USING	Trans_1;
			open x1;
			if Trans_1.sqlcode=0 then
				DO WHILE Trans_1.sqlcode=0
				fetch x1 INTO	:ll_cod_parque,	:ls_base,	:ls_serie,	:ldb_numero,	:ls_cod_age,	:ll_capac,	:ls_uso,	:ldb_precio,	:ls_moneda,	:ls_estado,	:ls_forma_pago,	:ll_rut,	:ls_canal,	:ldb_precio_uf,	:ll_precio_peso;
					if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and ldb_numero > 0 then
						ldt_fecha_recep												= wf_fec_recep(ls_base,ls_serie,ldb_numero)
						if ldt_fecha_recep <= ldt_fecha_recep_fin then
							if ls_cod_age<>'CA' then
								ll_mto_fin												= f_premio_ing_caja_porce2(ls_base,ls_serie,ldb_numero,ldt_fecha_ini,ldt_fecha_fin,1)
								if ll_mto_fin<=il_mto_min then
									il_mto													= f_premio_ing_caja_porce2(ls_base,ls_serie,ldb_numero,ldt_fecha_ini,ldt_fecha_fin,2)	
								end if
								ll_mto_fin												= ll_mto_fin + il_mto
								if not isnull(ll_mto_fin) and ll_mto_fin>0 then
									if ll_mto_fin>il_mto_min then
										ll_existe											= wf_val_venta(ls_base,ls_serie,ldb_numero)
										if ll_existe=0 then
											ldb_porce									= Round(ll_mto_fin/ll_precio_peso*100,2)
											if ll_capac = 1 and ldb_porce <= 14.98 then
											else
												if (ls_uso = 'NI' and ldb_porce >= 14.85) or (ls_uso = 'NF' and ldb_porce >= 4.85) then
													if ls_uso = 'NI' then
														if ldb_porce >= 14.85 and ldb_porce < 98.5 then
															ll_porcentaje				= 15
															ldb_porce_consul			= 15
															ls_cod_contab				= '045'
														else
															ll_porcentaje				= 100
															ldb_porce_consul			= 98.5
															ls_cod_contab				= '044'
															if ls_forma_pago='2' then
																ls_forma_pago			= '3'
															end if
														end if
													elseif ls_uso = 'NF' then
														if ldb_porce >= 4.85 and ldb_porce < 9.85 then
															ll_porcentaje				= 5
															ldb_porce_consul			= 5
															ls_cod_contab				= '045'
														elseif ldb_porce >= 9.85 and ldb_porce < 14.85 then
															ll_porcentaje				= 10
															ldb_porce_consul			= 10
															ls_cod_contab				= '045'
														elseif ldb_porce >= 14.85 and ldb_porce < 98.5 then
															ll_porcentaje				= 15
															ldb_porce_consul			= 15
															ls_cod_contab				= '045'
														else
															ll_porcentaje				= 100
															ldb_porce_consul			= 98.5
															ls_cod_contab				= '044'
															if ls_forma_pago='2' then
																ls_forma_pago			= '3'
															end if
														end if
													end if
													if ldb_porce_consul = 98.5 then
														SELECT	"CODIGO",			"TOPE",		"REDUCE_D",		"PORCE_INI"
														INTO		:ll_cod_premio,	:ll_premio,	:ldb_reduce,	:ldb_porce_ini
														FROM		"PREMIOS_POR_CAJA"  
														WHERE	( "PREMIOS_POR_CAJA"."USO" = :ls_uso ) AND  
																	( "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque ) AND  
																	( "PREMIOS_POR_CAJA"."PORCE_INI" = :ldb_porce_consul ) AND
																	( "PREMIOS_POR_CAJA"."FORMA_PAGO" = :ls_forma_pago )
														USING	Trans_4;
													else
														SELECT	"CODIGO",			"TOPE",		"REDUCE_D",		"PORCE_INI"
														INTO		:ll_cod_premio,	:ll_premio,	:ldb_reduce,	:ldb_porce_ini
														FROM		"PREMIOS_POR_CAJA"  
														WHERE	( "PREMIOS_POR_CAJA"."USO" = :ls_uso ) AND  
																	( "PREMIOS_POR_CAJA"."PARQUE" = :ll_cod_parque ) AND  
																	( "PREMIOS_POR_CAJA"."PORCE_INI" = :ldb_porce_consul )
														USING	Trans_4;
													end if
													if Trans_4.sqlcode=0 then
														if not isnull(ll_cod_premio) and ll_cod_premio>=0 then
															ls_clasif_hist				= f_clasif_hist(ls_cod_age,ldt_fecha_fin)
															if ls_clasif_hist = 'D' and ll_capac = 1 then
																ll_monto_premio		= ll_premio * ldb_reduce * ldb_reduce
															elseif ls_clasif_hist = 'D' and ll_capac > 1 then
																ll_monto_premio		= ll_premio * ldb_reduce
															elseif ls_clasif_hist <> 'D' and ll_capac = 1 then
																ll_monto_premio		= ll_premio * ldb_reduce
															else
																ll_monto_premio		= ll_premio
															end if
															ldt_fecha_proceso			= gdt_fec_sistema
															ll_new						= dw_premio_caja.insertrow(0)
															dw_premio_caja.scrolltorow(ll_new)
															dw_premio_caja.setitem(ll_new,"base",ls_base)
															dw_premio_caja.setitem(ll_new,"serie",ls_serie)
															dw_premio_caja.setitem(ll_new,"numero",ldb_numero)
															dw_premio_caja.setitem(ll_new,"forma",ls_forma_pago)
															dw_premio_caja.setitem(ll_new,"uso",ls_uso)
															dw_premio_caja.setitem(ll_new,"fecha",ldt_fecha_fin)
															dw_premio_caja.setitem(ll_new,"monto",ll_monto_premio)
															dw_premio_caja.setitem(ll_new,"porcentaje",ll_porcentaje)
															dw_premio_caja.setitem(ll_new,"cod_premio",ll_cod_premio)
															dw_premio_caja.setitem(ll_new,"fecha_proceso",ldt_fecha_proceso)
															dw_premio_caja.setitem(ll_new,"c_monto",ll_mto_fin)
															dw_premio_caja.setitem(ll_new,"parque",ll_cod_parque)
															dw_premio_caja.setitem(ll_new,"c_agente",ls_cod_age)
															dw_premio_caja.setitem(ll_new,"c_capac",ll_capac)
															dw_premio_caja.setitem(ll_new,"c_estado",ls_estado)
															dw_premio_caja.setitem(ll_new,"c_clasif",ls_clasif_hist)
															dw_premio_caja.setitem(ll_new,"c_moneda",ls_moneda)
															dw_premio_caja.setitem(ll_new,"c_precio",ll_precio_peso)
															dw_premio_caja.setitem(ll_new,"c_precio_pago_oferta",ldb_precio)
															dw_premio_caja.setitem(ll_new,"c_porcent",ldb_porce)
															dw_premio_caja.setitem(ll_new,"c_cod_cont",ls_cod_contab)
															dw_premio_caja.accepttext()
														end if
													end if
												end if
											end if
										end if
									end if
								end if
							end if
						end if
					end if
					setnull(ls_base);setnull(ls_serie);setnull(ldb_numero)
					ll_mto_fin															= 0
					il_mto																	= 0
				LOOP
			end if
			close x1;
			dw_premio_caja.setsort("porcentaje D")
			dw_premio_caja.sort()
			dw_premio_caja.accepttext()
			if dw_premio_caja.rowcount() = 0 then
				messagebox("Advertencia","No Registra Premio Ingreso Caja con Fecha: "+string(ldt_fecha_fin,"dd/mm/yyyy"))
			end if
			wf_mejores(ll_cod_parque,ls_tipo_empleado,ldt_fecha_fin,ldt_fecha_proceso)
		end if
	end if
	SetPointer(Arrow!)
end if
end event

type st_desde from statictext within w_premios_semanal
integer x = 59
integer y = 80
integer width = 169
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Desde:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_termino from editmask within w_premios_semanal
integer x = 718
integer y = 68
integer width = 320
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;long		ll_mes,ll_anno,ll_dia,ll_cod_parque
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_premio_mensual,ldt_ult_fec

dw_premio_caja.reset()
dw_premio_mejor.reset()
em_inicio.text							= string(RelativeDate((date(em_termino.text)), - 6),"dd/mm/yyyy")
ldt_fecha_ini							= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin							= datetime(date(em_termino.text),time('00:00:00'))

SELECT	max("FECHA_TERMINO")  
INTO 		:ldt_ult_fec  
FROM 	"CIERRE_PAGOS_VENTAS"
USING	sqlca;
if ldt_fecha_fin>ldt_ult_fec then
	cb_actualiza.visible			= true
end if



ll_cod_parque							= dw_parque.getitemnumber(1,'parque')
ll_mes									= month(date(ldt_fecha_ini))
ll_anno									= year(date(ldt_fecha_ini))
if ll_mes = 2 then
	if int(ll_anno/4) = (ll_anno/4) then 
		ll_dia							= 29
	else
		ll_dia							= 28
	end if
elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
	ll_dia								= 30
else
	ll_dia								= 31
end if
ldt_fecha_premio_mensual			= datetime(date(string(ll_dia,'00')+'/'+ string(ll_mes,'00')+'/'+ string(ll_anno,'0000')),time('00:00:00'))
if ldt_fecha_premio_mensual >= ldt_fecha_ini and ldt_fecha_premio_mensual <= ldt_fecha_fin then
	cb_mejores_nf.enabled			= false
	cb_mejores_ni.enabled			= false
else
	cb_mejores_nf.enabled			= true
	cb_mejores_ni.enabled			= true
end if
end event

type em_inicio from editmask within w_premios_semanal
integer x = 233
integer y = 68
integer width = 320
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_hasta from statictext within w_premios_semanal
integer x = 571
integer y = 76
integer width = 155
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_premios_semanal
integer x = 3296
integer y = 2020
integer width = 302
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premios_semanal)
end event

type dw_premio_caja from datawindow within w_premios_semanal
integer x = 37
integer y = 192
integer width = 3561
integer height = 948
integer taborder = 40
string title = "none"
string dataobject = "dw_premio_ing_caja_promesa_premio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row			= getrow()
	il_row_caja		= il_row
	il_row_mejor	= 0
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;cb_cta_cte.triggerevent(clicked!)
end event

event getfocus;cb_pagos.enabled			= true
cb_cta_cte.enabled		= true
cb_asocia_rut.enabled	= true
cb_detalle.enabled		= false
end event

event clicked;if row>0 then
	il_row				= row
	il_row_caja		= il_row
	il_row_mejor	= 0
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_periodo from groupbox within w_premios_semanal
integer x = 37
integer y = 8
integer width = 1120
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Período"
end type

type gb_2 from groupbox within w_premios_semanal
integer x = 3049
integer y = 1404
integer width = 549
integer height = 296
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mejores Semanal"
end type

type gb_3 from groupbox within w_premios_semanal
integer x = 3049
integer y = 1148
integer width = 549
integer height = 212
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Busca Nº Promesa"
end type

