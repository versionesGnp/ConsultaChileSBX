forward
global type w_seguros_desgravamen from window
end type
type dw_exp_archivo from datawindow within w_seguros_desgravamen
end type
type cb_5 from commandbutton within w_seguros_desgravamen
end type
type tab_seguro from tab within w_seguros_desgravamen
end type
type tabpage_1 from userobject within tab_seguro
end type
type pb_buscar from picturebutton within tabpage_1
end type
type em_rut from editmask within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type cb_ver_detalle from commandbutton within tabpage_1
end type
type cb_exp_des from commandbutton within tabpage_1
end type
type cb_print_des from commandbutton within tabpage_1
end type
type cb_fil_des from commandbutton within tabpage_1
end type
type cb_ord_des from commandbutton within tabpage_1
end type
type dw_lista_seguro from datawindow within tabpage_1
end type
type gb_3 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_seguro
pb_buscar pb_buscar
em_rut em_rut
st_1 st_1
cb_ver_detalle cb_ver_detalle
cb_exp_des cb_exp_des
cb_print_des cb_print_des
cb_fil_des cb_fil_des
cb_ord_des cb_ord_des
dw_lista_seguro dw_lista_seguro
gb_3 gb_3
end type
type tabpage_2 from userobject within tab_seguro
end type
type pb_rut_rel from picturebutton within tabpage_2
end type
type em_rut_rel from editmask within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type st_no_rel from statictext within tabpage_2
end type
type cb_exp_rel from commandbutton within tabpage_2
end type
type cb_print_rel from commandbutton within tabpage_2
end type
type cb_fil_rel from commandbutton within tabpage_2
end type
type cb_ord_rel from commandbutton within tabpage_2
end type
type dw_lista_reliquida from datawindow within tabpage_2
end type
type gb_2 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_seguro
pb_rut_rel pb_rut_rel
em_rut_rel em_rut_rel
st_3 st_3
st_no_rel st_no_rel
cb_exp_rel cb_exp_rel
cb_print_rel cb_print_rel
cb_fil_rel cb_fil_rel
cb_ord_rel cb_ord_rel
dw_lista_reliquida dw_lista_reliquida
gb_2 gb_2
end type
type tabpage_3 from userobject within tab_seguro
end type
type pb_buscar_rut_18 from picturebutton within tabpage_3
end type
type st_4 from statictext within tabpage_3
end type
type em_rut_18 from editmask within tabpage_3
end type
type st_no_men18 from statictext within tabpage_3
end type
type cb_exp_menor18 from commandbutton within tabpage_3
end type
type cb_print_menor18 from commandbutton within tabpage_3
end type
type cb_fil_men18 from commandbutton within tabpage_3
end type
type cb_ord_men18 from commandbutton within tabpage_3
end type
type dw_lista_menores18 from datawindow within tabpage_3
end type
type gb_1 from groupbox within tabpage_3
end type
type tabpage_3 from userobject within tab_seguro
pb_buscar_rut_18 pb_buscar_rut_18
st_4 st_4
em_rut_18 em_rut_18
st_no_men18 st_no_men18
cb_exp_menor18 cb_exp_menor18
cb_print_menor18 cb_print_menor18
cb_fil_men18 cb_fil_men18
cb_ord_men18 cb_ord_men18
dw_lista_menores18 dw_lista_menores18
gb_1 gb_1
end type
type tab_seguro from tab within w_seguros_desgravamen
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type dw_parque from datawindow within w_seguros_desgravamen
end type
type st_16 from statictext within w_seguros_desgravamen
end type
type p_ini from picture within w_seguros_desgravamen
end type
type em_fec_ini from editmask within w_seguros_desgravamen
end type
type st_2 from statictext within w_seguros_desgravamen
end type
type cb_cerrar from commandbutton within w_seguros_desgravamen
end type
type cb_cargar from commandbutton within w_seguros_desgravamen
end type
end forward

global type w_seguros_desgravamen from window
integer width = 3310
integer height = 2076
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_exp_archivo dw_exp_archivo
cb_5 cb_5
tab_seguro tab_seguro
dw_parque dw_parque
st_16 st_16
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
cb_cerrar cb_cerrar
cb_cargar cb_cargar
end type
global w_seguros_desgravamen w_seguros_desgravamen

type variables
Date		idt_fecha_hoy
Double	idb_valor_uf,idb_tasa
Long		il_tipo_seguro
Datetime	idt_fec_ult_cierre

datawindow	dw_paso
end variables

forward prototypes
public subroutine wf_proceso_segundo_asegurado ()
public subroutine wf_proceso_renta_deceso ()
public subroutine wf_proceso_accidente ()
public subroutine wf_proceso_fallecimiento ()
end prototypes

public subroutine wf_proceso_segundo_asegurado ();Datetime	ldt_max_fec_proc,ldt_prox_cierre,ldt_fecha_cierre
Long		ll_mes_ult,ll_anno_ult,ll_resp,ll_cod_parque
String	ls_fecha
Double	ldb_tasa_seguro

ldt_fecha_cierre		= datetime(date(em_fec_ini.text),time('00:00:00'))
ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')

SELECT  "TIPO_SEGURO"."FACTOR_PRIMA" INTO :ldb_tasa_seguro FROM "TIPO_SEGURO" WHERE "TIPO_SEGURO"."CODIGO" = :il_tipo_seguro  ;

SELECT	MAX("SEGURO_PROCESO"."FECHA_CIERRE")  
INTO 		:ldt_max_fec_proc  
FROM 		"SEGURO_PROCESO"  
WHERE		"SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro AND
			"SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque;
if not isnull(ldt_max_fec_proc) then
	ll_mes_ult	= month(date(ldt_max_fec_proc))
	ll_anno_ult	= year(date(ldt_max_fec_proc))
	ll_mes_ult ++
	if ll_mes_ult>12 then
		ll_anno_ult ++
		ll_mes_ult	= 1
	end if
	if ll_mes_ult=1 or ll_mes_ult=3 or ll_mes_ult=5 or ll_mes_ult=7 or ll_mes_ult=8 or ll_mes_ult=10 or ll_mes_ult=12 then
		ls_fecha			= '31/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
	elseif ll_mes_ult=2 then
		if ll_anno_ult/4 = int(ll_anno_ult/4) then
			ls_fecha		= '29/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
		else
			ls_fecha		= '28/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
		end if
	elseif ll_mes_ult=4 or ll_mes_ult=6 or ll_mes_ult=9 or ll_mes_ult=11 then
		ls_fecha			= '30/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
	end if
	ldt_prox_cierre	= datetime(date(ls_fecha))
	if ldt_fecha_cierre = ldt_prox_cierre then
		DECLARE sp_proc_seguro_desg1 PROCEDURE FOR SP_PROCESO_SEGUNDO_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
		EXECUTE sp_proc_seguro_desg1;
		if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
			tab_seguro.tabpage_2.dw_lista_reliquida.reset()
			tab_seguro.tabpage_3.dw_lista_menores18.reset()
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
			tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
			tab_seguro.tabpage_2.st_no_rel.visible				= true
			tab_seguro.tabpage_3.st_no_men18.visible			= true
			messagebox("Advertencia","No Registra Dato")
		else
			if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
				tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
				tab_seguro.tabpage_2.st_no_rel.visible				= false
			else
				tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
				tab_seguro.tabpage_2.st_no_rel.visible				= true
			end if

			if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
				tab_seguro.tabpage_3.st_no_men18.visible			= false
				tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
			else
				tab_seguro.tabpage_3.st_no_men18.visible			= true
				tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
			end if
		end if
	else
		if ldt_max_fec_proc = ldt_fecha_cierre then
			ll_resp		= messagebox("Advertencia","Existe Proceso del "+string(ldt_fecha_cierre,'dd/mm/yyyy')+" desea Eliminar TODO y Volver Re-Procesar",Exclamation!,YesNo!,2)
			if ll_resp=1 then
				DELETE FROM   "SEGURO_PROCESO"  
				WHERE 		( "SEGURO_PROCESO"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
								( "SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque )  AND
								( "SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro )
				USING			sqlca;
				if sqlca.sqlcode=0 then
					commit;
					DELETE FROM	"SEGURO_SEGUNDO_DEF"  
					WHERE 	 ( "SEGURO_SEGUNDO_DEF"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
								 ( "SEGURO_SEGUNDO_DEF"."COD_PARQUE" = :ll_cod_parque )   
					USING			sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					DELETE FROM "SEGURO_SEGUNDO_DEF_LIQ"  
					WHERE 	 ( "SEGURO_SEGUNDO_DEF_LIQ"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
								 ( "SEGURO_SEGUNDO_DEF_LIQ"."COD_PARQUE" = :ll_cod_parque )   
					USING			sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					
					DECLARE sp_proc_seguro_desg2 PROCEDURE FOR SP_PROCESO_SEGUNDO_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
					EXECUTE sp_proc_seguro_desg2;
					if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
						tab_seguro.tabpage_2.dw_lista_reliquida.reset()
						tab_seguro.tabpage_3.dw_lista_menores18.reset()
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
						tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
						tab_seguro.tabpage_2.st_no_rel.visible				= true
						tab_seguro.tabpage_3.st_no_men18.visible			= true
						messagebox("Advertencia","No Registra Dato")
					else
						if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
							tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
							tab_seguro.tabpage_2.st_no_rel.visible				= false
						else
							tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
							tab_seguro.tabpage_2.st_no_rel.visible				= true
						end if
	
						if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
							tab_seguro.tabpage_3.st_no_men18.visible			= false
							tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
						else
							tab_seguro.tabpage_3.st_no_men18.visible			= true
							tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
						end if
					end if
				else
					rollback;
				end if
			else
				if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
					tab_seguro.tabpage_2.dw_lista_reliquida.reset()
					tab_seguro.tabpage_3.dw_lista_menores18.reset()
					if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
						tab_seguro.tabpage_2.st_no_rel.visible				= false
					else
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
						tab_seguro.tabpage_2.st_no_rel.visible				= true
					end if
					if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
						tab_seguro.tabpage_3.st_no_men18.visible			= false
						tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
					else
						tab_seguro.tabpage_3.st_no_men18.visible			= true
						tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
					end if
				end if
			end if

		elseif ldt_max_fec_proc < ldt_fecha_cierre then
			messagebox("Advertencia","No es Posible Procesar, Fecha Indicada es Menor al Ultimo Cierre ("+string(ldt_fecha_cierre,'dd/mm/yyyy')+")")
		elseif ldt_max_fec_proc > ldt_fecha_cierre then
			messagebox("Advertencia","No es Posible Procesar, Fecha Indicada es Mayor al Ultimo Cierre ("+string(ldt_fecha_cierre,'dd/mm/yyyy')+")")
		end if
	end if
else
	DECLARE sp_proc_seguro_desg3 PROCEDURE FOR SP_PROCESO_SEGUNDO_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
	EXECUTE sp_proc_seguro_desg3;
	if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
		tab_seguro.tabpage_2.dw_lista_reliquida.reset()
		tab_seguro.tabpage_3.dw_lista_menores18.reset()
		tab_seguro.tabpage_2.dw_lista_reliquida.visible		= false
		tab_seguro.tabpage_3.dw_lista_menores18.visible		= false
		tab_seguro.tabpage_2.st_no_rel.visible					= true
		tab_seguro.tabpage_3.st_no_men18.visible				= true
		messagebox("Advertencia","No Registra Dato")
	else
		if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
			tab_seguro.tabpage_2.st_no_rel.visible				= false
		else
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
			tab_seguro.tabpage_2.st_no_rel.visible				= true
		end if

		if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
			tab_seguro.tabpage_3.st_no_men18.visible			= false
			tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
		else
			tab_seguro.tabpage_3.st_no_men18.visible			= true
			tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
		end if
	end if
end if
end subroutine

public subroutine wf_proceso_renta_deceso ();Datetime	ldt_max_fec_proc,ldt_prox_cierre,ldt_fecha_cierre
Long		ll_mes_ult,ll_anno_ult,ll_resp,ll_cod_parque
String	ls_fecha
Double	ldb_tasa_seguro

ldt_fecha_cierre		= datetime(date(em_fec_ini.text),time('00:00:00'))
ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')

SELECT  "TIPO_SEGURO"."FACTOR_PRIMA" INTO :ldb_tasa_seguro FROM "TIPO_SEGURO" WHERE "TIPO_SEGURO"."CODIGO" = :il_tipo_seguro  ;

SELECT	MAX("SEGURO_PROCESO"."FECHA_CIERRE")  
INTO 		:ldt_max_fec_proc  
FROM 		"SEGURO_PROCESO"  
WHERE		"SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro AND
			"SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque;
if not isnull(ldt_max_fec_proc) then
	ll_mes_ult	= month(date(ldt_max_fec_proc))
	ll_anno_ult	= year(date(ldt_max_fec_proc))
	ll_mes_ult ++
	if ll_mes_ult>12 then
		ll_anno_ult ++
		ll_mes_ult	= 1
	end if
	if ll_mes_ult=1 or ll_mes_ult=3 or ll_mes_ult=5 or ll_mes_ult=7 or ll_mes_ult=8 or ll_mes_ult=10 or ll_mes_ult=12 then
		ls_fecha			= '31/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
	elseif ll_mes_ult=2 then
		if ll_anno_ult/4 = int(ll_anno_ult/4) then
			ls_fecha		= '29/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
		else
			ls_fecha		= '28/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
		end if
	elseif ll_mes_ult=4 or ll_mes_ult=6 or ll_mes_ult=9 or ll_mes_ult=11 then
		ls_fecha			= '30/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
	end if
	ldt_prox_cierre	= datetime(date(ls_fecha))
	if ldt_fecha_cierre = ldt_prox_cierre then
		DECLARE sp_proc_seguro_desg1 PROCEDURE FOR SP_PROCESO_RENTA_DEC_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
		EXECUTE sp_proc_seguro_desg1;
		if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
			tab_seguro.tabpage_2.dw_lista_reliquida.reset()
			tab_seguro.tabpage_3.dw_lista_menores18.reset()
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
			tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
			tab_seguro.tabpage_2.st_no_rel.visible				= true
			tab_seguro.tabpage_3.st_no_men18.visible			= true
			messagebox("Advertencia","No Registra Dato")
		else
			if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
				tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
				tab_seguro.tabpage_2.st_no_rel.visible				= false
			else
				tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
				tab_seguro.tabpage_2.st_no_rel.visible				= true
			end if

			if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
				tab_seguro.tabpage_3.st_no_men18.visible			= false
				tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
			else
				tab_seguro.tabpage_3.st_no_men18.visible			= true
				tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
			end if
		end if
	else
		if ldt_max_fec_proc = ldt_fecha_cierre then
			ll_resp		= messagebox("Advertencia","Existe Proceso del "+string(ldt_fecha_cierre,'dd/mm/yyyy')+" desea Eliminar TODO y Volver Re-Procesar",Exclamation!,YesNo!,2)
			if ll_resp=1 then
				DELETE FROM   "SEGURO_PROCESO"  
				WHERE 		( "SEGURO_PROCESO"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
								( "SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque )  AND
								( "SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro )
				USING			sqlca;
				if sqlca.sqlcode=0 then
					commit;
					DELETE FROM	"SEGURO_RENTA_DEC_DEF"  
					WHERE 	 ( "SEGURO_RENTA_DEC_DEF"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
								 ( "SEGURO_RENTA_DEC_DEF"."COD_PARQUE" = :ll_cod_parque )   
					USING			sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					
					DECLARE sp_proc_seguro_desg2 PROCEDURE FOR SP_PROCESO_RENTA_DEC_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
					EXECUTE sp_proc_seguro_desg2;
					if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
						tab_seguro.tabpage_2.dw_lista_reliquida.reset()
						tab_seguro.tabpage_3.dw_lista_menores18.reset()
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
						tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
						tab_seguro.tabpage_2.st_no_rel.visible				= true
						tab_seguro.tabpage_3.st_no_men18.visible			= true
						messagebox("Advertencia","No Registra Dato")
					else
						if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
							tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
							tab_seguro.tabpage_2.st_no_rel.visible				= false
						else
							tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
							tab_seguro.tabpage_2.st_no_rel.visible				= true
						end if
	
						if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
							tab_seguro.tabpage_3.st_no_men18.visible			= false
							tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
						else
							tab_seguro.tabpage_3.st_no_men18.visible			= true
							tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
						end if
					end if
				else
					rollback;
				end if
			else
				if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
					tab_seguro.tabpage_2.dw_lista_reliquida.reset()
					tab_seguro.tabpage_3.dw_lista_menores18.reset()
					if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
						tab_seguro.tabpage_2.st_no_rel.visible				= false
					else
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
						tab_seguro.tabpage_2.st_no_rel.visible				= true
					end if
					if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
						tab_seguro.tabpage_3.st_no_men18.visible			= false
						tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
					else
						tab_seguro.tabpage_3.st_no_men18.visible			= true
						tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
					end if
				end if
			end if

		elseif ldt_max_fec_proc < ldt_fecha_cierre then
			messagebox("Advertencia","No es Posible Procesar, Fecha Indicada es Menor al Ultimo Cierre ("+string(ldt_fecha_cierre,'dd/mm/yyyy')+")")
		elseif ldt_max_fec_proc > ldt_fecha_cierre then
			messagebox("Advertencia","No es Posible Procesar, Fecha Indicada es Mayor al Ultimo Cierre ("+string(ldt_fecha_cierre,'dd/mm/yyyy')+")")
		end if
	end if
else
	DECLARE sp_proc_seguro_desg3 PROCEDURE FOR SP_PROCESO_RENTA_DEC_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
	EXECUTE sp_proc_seguro_desg3;
	if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
		tab_seguro.tabpage_2.dw_lista_reliquida.reset()
		tab_seguro.tabpage_3.dw_lista_menores18.reset()
		tab_seguro.tabpage_2.dw_lista_reliquida.visible		= false
		tab_seguro.tabpage_3.dw_lista_menores18.visible		= false
		tab_seguro.tabpage_2.st_no_rel.visible					= true
		tab_seguro.tabpage_3.st_no_men18.visible				= true
		messagebox("Advertencia","No Registra Dato")
	else
		if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
			tab_seguro.tabpage_2.st_no_rel.visible				= false
		else
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
			tab_seguro.tabpage_2.st_no_rel.visible				= true
		end if

		if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
			tab_seguro.tabpage_3.st_no_men18.visible			= false
			tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
		else
			tab_seguro.tabpage_3.st_no_men18.visible			= true
			tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
		end if
	end if
end if
end subroutine

public subroutine wf_proceso_accidente ();Datetime	ldt_max_fec_proc,ldt_prox_cierre,ldt_fecha_cierre
Long		ll_mes_ult,ll_anno_ult,ll_resp,ll_cod_parque
String	ls_fecha
Double	ldb_tasa_seguro

ldt_fecha_cierre		= datetime(date(em_fec_ini.text),time('00:00:00'))
ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')

SELECT  "TIPO_SEGURO"."FACTOR_PRIMA" INTO :ldb_tasa_seguro FROM "TIPO_SEGURO" WHERE "TIPO_SEGURO"."CODIGO" = :il_tipo_seguro  ;

SELECT	MAX("SEGURO_PROCESO"."FECHA_CIERRE")  
INTO 		:ldt_max_fec_proc  
FROM 		"SEGURO_PROCESO"  
WHERE		"SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro AND
			"SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque;
if not isnull(ldt_max_fec_proc) then
	ll_mes_ult	= month(date(ldt_max_fec_proc))
	ll_anno_ult	= year(date(ldt_max_fec_proc))
	ll_mes_ult ++
	if ll_mes_ult>12 then
		ll_anno_ult ++
		ll_mes_ult	= 1
	end if
	if ll_mes_ult=1 or ll_mes_ult=3 or ll_mes_ult=5 or ll_mes_ult=7 or ll_mes_ult=8 or ll_mes_ult=10 or ll_mes_ult=12 then
		ls_fecha			= '31/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
	elseif ll_mes_ult=2 then
		if ll_anno_ult/4 = int(ll_anno_ult/4) then
			ls_fecha		= '29/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
		else
			ls_fecha		= '28/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
		end if
	elseif ll_mes_ult=4 or ll_mes_ult=6 or ll_mes_ult=9 or ll_mes_ult=11 then
		ls_fecha			= '30/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
	end if
	ldt_prox_cierre	= datetime(date(ls_fecha))
	if ldt_fecha_cierre = ldt_prox_cierre then
		DECLARE sp_proc_seguro_desg1 PROCEDURE FOR SP_PROCESO_ACCIDENTE_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
		EXECUTE sp_proc_seguro_desg1;
		if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
			tab_seguro.tabpage_2.dw_lista_reliquida.reset()
			tab_seguro.tabpage_3.dw_lista_menores18.reset()
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
			tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
			tab_seguro.tabpage_2.st_no_rel.visible				= true
			tab_seguro.tabpage_3.st_no_men18.visible			= true
			messagebox("Advertencia","No Registra Dato")
		else
			if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
				tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
				tab_seguro.tabpage_2.st_no_rel.visible				= false
			else
				tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
				tab_seguro.tabpage_2.st_no_rel.visible				= true
			end if

			if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
				tab_seguro.tabpage_3.st_no_men18.visible			= false
				tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
			else
				tab_seguro.tabpage_3.st_no_men18.visible			= true
				tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
			end if
		end if
	else
		if ldt_max_fec_proc = ldt_fecha_cierre then
			ll_resp		= messagebox("Advertencia","Existe Proceso del "+string(ldt_fecha_cierre,'dd/mm/yyyy')+" desea Eliminar TODO y Volver Re-Procesar",Exclamation!,YesNo!,2)
			if ll_resp=1 then
				DELETE FROM   "SEGURO_PROCESO"  
				WHERE 		( "SEGURO_PROCESO"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
								( "SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque )  AND
								( "SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro )
				USING			sqlca;
				if sqlca.sqlcode=0 then
					commit;
					DELETE FROM	"SEGURO_ACCIDENTE_DEF"  
					WHERE 	 ( "SEGURO_ACCIDENTE_DEF"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
								 ( "SEGURO_ACCIDENTE_DEF"."COD_PARQUE" = :ll_cod_parque )   
					USING			sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					
					DECLARE sp_proc_seguro_desg2 PROCEDURE FOR SP_PROCESO_ACCIDENTE_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
					EXECUTE sp_proc_seguro_desg2;
					if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
						tab_seguro.tabpage_2.dw_lista_reliquida.reset()
						tab_seguro.tabpage_3.dw_lista_menores18.reset()
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
						tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
						tab_seguro.tabpage_2.st_no_rel.visible				= true
						tab_seguro.tabpage_3.st_no_men18.visible			= true
						messagebox("Advertencia","No Registra Dato")
					else
						if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
							tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
							tab_seguro.tabpage_2.st_no_rel.visible				= false
						else
							tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
							tab_seguro.tabpage_2.st_no_rel.visible				= true
						end if
	
						if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
							tab_seguro.tabpage_3.st_no_men18.visible			= false
							tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
						else
							tab_seguro.tabpage_3.st_no_men18.visible			= true
							tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
						end if
					end if
				else
					rollback;
				end if
			else
				if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
					tab_seguro.tabpage_2.dw_lista_reliquida.reset()
					tab_seguro.tabpage_3.dw_lista_menores18.reset()
					if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
						tab_seguro.tabpage_2.st_no_rel.visible				= false
					else
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
						tab_seguro.tabpage_2.st_no_rel.visible				= true
					end if
					if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
						tab_seguro.tabpage_3.st_no_men18.visible			= false
						tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
					else
						tab_seguro.tabpage_3.st_no_men18.visible			= true
						tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
					end if
				end if
			end if

		elseif ldt_max_fec_proc < ldt_fecha_cierre then
			messagebox("Advertencia","No es Posible Procesar, Fecha Indicada es Menor al Ultimo Cierre ("+string(ldt_fecha_cierre,'dd/mm/yyyy')+")")
		elseif ldt_max_fec_proc > ldt_fecha_cierre then
			messagebox("Advertencia","No es Posible Procesar, Fecha Indicada es Mayor al Ultimo Cierre ("+string(ldt_fecha_cierre,'dd/mm/yyyy')+")")
		end if
	end if
else
	DECLARE sp_proc_seguro_desg3 PROCEDURE FOR SP_PROCESO_ACCIDENTE_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
	EXECUTE sp_proc_seguro_desg3;
	if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
		tab_seguro.tabpage_2.dw_lista_reliquida.reset()
		tab_seguro.tabpage_3.dw_lista_menores18.reset()
		tab_seguro.tabpage_2.dw_lista_reliquida.visible		= false
		tab_seguro.tabpage_3.dw_lista_menores18.visible		= false
		tab_seguro.tabpage_2.st_no_rel.visible					= true
		tab_seguro.tabpage_3.st_no_men18.visible				= true
		messagebox("Advertencia","No Registra Dato")
	else
		if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
			tab_seguro.tabpage_2.st_no_rel.visible				= false
		else
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
			tab_seguro.tabpage_2.st_no_rel.visible				= true
		end if

		if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
			tab_seguro.tabpage_3.st_no_men18.visible			= false
			tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
		else
			tab_seguro.tabpage_3.st_no_men18.visible			= true
			tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
		end if
	end if
end if
end subroutine

public subroutine wf_proceso_fallecimiento ();Datetime	ldt_max_fec_proc,ldt_prox_cierre,ldt_fecha_cierre
Long		ll_mes_ult,ll_anno_ult,ll_resp,ll_cod_parque
String	ls_fecha
Double	ldb_tasa_seguro

ldt_fecha_cierre		= datetime(date(em_fec_ini.text),time('00:00:00'))
ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')

SELECT  "TIPO_SEGURO"."FACTOR_PRIMA" INTO :ldb_tasa_seguro FROM "TIPO_SEGURO" WHERE "TIPO_SEGURO"."CODIGO" = :il_tipo_seguro  ;

SELECT	MAX("SEGURO_PROCESO"."FECHA_CIERRE")  
INTO 		:ldt_max_fec_proc  
FROM 		"SEGURO_PROCESO"  
WHERE		"SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro AND
			"SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque;
if not isnull(ldt_max_fec_proc) then
	ll_mes_ult	= month(date(ldt_max_fec_proc))
	ll_anno_ult	= year(date(ldt_max_fec_proc))
	ll_mes_ult ++
	if ll_mes_ult>12 then
		ll_anno_ult ++
		ll_mes_ult	= 1
	end if
	if ll_mes_ult=1 or ll_mes_ult=3 or ll_mes_ult=5 or ll_mes_ult=7 or ll_mes_ult=8 or ll_mes_ult=10 or ll_mes_ult=12 then
		ls_fecha			= '31/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
	elseif ll_mes_ult=2 then
		if ll_anno_ult/4 = int(ll_anno_ult/4) then
			ls_fecha		= '29/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
		else
			ls_fecha		= '28/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
		end if
	elseif ll_mes_ult=4 or ll_mes_ult=6 or ll_mes_ult=9 or ll_mes_ult=11 then
		ls_fecha			= '30/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
	end if
	ldt_prox_cierre	= datetime(date(ls_fecha))
	if ldt_fecha_cierre = ldt_prox_cierre then
		DECLARE sp_proc_seguro_desg1 PROCEDURE FOR SP_SEGURO_FALLECIMIENTO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
		EXECUTE sp_proc_seguro_desg1;
		if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)=0 then
			tab_seguro.tabpage_2.dw_lista_reliquida.reset()
			tab_seguro.tabpage_3.dw_lista_menores18.reset()
			tab_seguro.tabpage_2.dw_lista_reliquida.visible		= false
			tab_seguro.tabpage_3.dw_lista_menores18.visible		= false
			tab_seguro.tabpage_2.st_no_rel.visible					= true
			tab_seguro.tabpage_3.st_no_men18.visible				= true
			messagebox("Advertencia","No Registra Dato")
		else
			if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque, il_tipo_seguro)>0 then
				tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
				tab_seguro.tabpage_2.st_no_rel.visible				= false
			else
				tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
				tab_seguro.tabpage_2.st_no_rel.visible				= true
			end if

//			if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
//				tab_seguro.tabpage_3.st_no_men18.visible			= false
//				tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
//			else
				tab_seguro.tabpage_3.st_no_men18.visible			= true
				tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
//			end if
		end if
	else
		if ldt_max_fec_proc = ldt_fecha_cierre then
			ll_resp		= messagebox("Advertencia","Existe Proceso del "+string(ldt_fecha_cierre,'dd/mm/yyyy')+" desea Eliminar TODO y Volver Re-Procesar",Exclamation!,YesNo!,2)
			if ll_resp=1 then
				DELETE FROM   "SEGURO_PROCESO"  
				WHERE 		( "SEGURO_PROCESO"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
								( "SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque )  AND
								( "SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro ) 
				USING			sqlca;
				if sqlca.sqlcode=0 then
					commit;
					DELETE FROM	"SEGURO_FALLECIMIENTO"  
					WHERE 	 ( "SEGURO_FALLECIMIENTO"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
								 ( "SEGURO_FALLECIMIENTO"."COD_PARQUE" = :ll_cod_parque )   
					USING			sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
											
					DELETE FROM "SEGURO_DESG_DEF_LIQ"  
					WHERE 	 ( "SEGURO_DESG_DEF_LIQ"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
								 ( "SEGURO_DESG_DEF_LIQ"."COD_PARQUE" = :ll_cod_parque ) AND
								 ( "SEGURO_DESG_DEF_LIQ"."TIPO_SEGURO" = :il_tipo_seguro )
					USING			sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					
					DECLARE sp_proc_seguro_desg2 PROCEDURE FOR SP_SEGURO_FALLECIMIENTO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
					EXECUTE sp_proc_seguro_desg2;
					if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
						tab_seguro.tabpage_2.dw_lista_reliquida.reset()
						tab_seguro.tabpage_3.dw_lista_menores18.reset()
						tab_seguro.tabpage_2.dw_lista_reliquida.visible		= false
						tab_seguro.tabpage_3.dw_lista_menores18.visible		= false
						tab_seguro.tabpage_2.st_no_rel.visible					= true
						tab_seguro.tabpage_3.st_no_men18.visible				= true
						messagebox("Advertencia","No Registra Dato")
					else
						if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque, il_tipo_seguro)>0 then
							tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
							tab_seguro.tabpage_2.st_no_rel.visible				= false
						else
							tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
							tab_seguro.tabpage_2.st_no_rel.visible				= true
						end if
	
//						if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
//							tab_seguro.tabpage_3.st_no_men18.visible			= false
//							tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
//						else
							tab_seguro.tabpage_3.st_no_men18.visible			= true
							tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
//						end if
					end if
				else
					rollback;
				end if
			else
				if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
					tab_seguro.tabpage_2.dw_lista_reliquida.reset()
					tab_seguro.tabpage_3.dw_lista_menores18.reset()
					if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque, il_tipo_seguro)>0 then
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
						tab_seguro.tabpage_2.st_no_rel.visible				= false
					else
						tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
						tab_seguro.tabpage_2.st_no_rel.visible				= true
					end if
//					if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
//						tab_seguro.tabpage_3.st_no_men18.visible			= false
//						tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
//					else
						tab_seguro.tabpage_3.st_no_men18.visible			= true
						tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
//					end if
				end if
			end if

		elseif ldt_max_fec_proc < ldt_fecha_cierre then
			messagebox("Advertencia","No es Posible Procesar, Fecha Indicada es Menor al Ultimo Cierre ("+string(ldt_fecha_cierre,'dd/mm/yyyy')+")")
		elseif ldt_max_fec_proc > ldt_fecha_cierre then
			messagebox("Advertencia","No es Posible Procesar, Fecha Indicada es Mayor al Ultimo Cierre ("+string(ldt_fecha_cierre,'dd/mm/yyyy')+")")
		end if
	end if
else
	DECLARE sp_proc_seguro_falle PROCEDURE FOR SP_SEGURO_FALLECIMIENTO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
	EXECUTE sp_proc_seguro_falle;
	if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
		tab_seguro.tabpage_2.dw_lista_reliquida.reset()
		tab_seguro.tabpage_3.dw_lista_menores18.reset()
		tab_seguro.tabpage_2.dw_lista_reliquida.visible		= false
		tab_seguro.tabpage_3.dw_lista_menores18.visible		= false
		tab_seguro.tabpage_2.st_no_rel.visible					= true
		tab_seguro.tabpage_3.st_no_men18.visible				= true
		messagebox("Advertencia","No Registra Dato")
	else
		if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque, il_tipo_seguro)>0 then
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
			tab_seguro.tabpage_2.st_no_rel.visible				= false
		else
			tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
			tab_seguro.tabpage_2.st_no_rel.visible				= true
		end if

//		if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
//			tab_seguro.tabpage_3.st_no_men18.visible			= false
//			tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
//		else
			tab_seguro.tabpage_3.st_no_men18.visible			= true
			tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
//		end if
	end if
end if
end subroutine

on w_seguros_desgravamen.create
this.dw_exp_archivo=create dw_exp_archivo
this.cb_5=create cb_5
this.tab_seguro=create tab_seguro
this.dw_parque=create dw_parque
this.st_16=create st_16
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.cb_cargar=create cb_cargar
this.Control[]={this.dw_exp_archivo,&
this.cb_5,&
this.tab_seguro,&
this.dw_parque,&
this.st_16,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.cb_cerrar,&
this.cb_cargar}
end on

on w_seguros_desgravamen.destroy
destroy(this.dw_exp_archivo)
destroy(this.cb_5)
destroy(this.tab_seguro)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.cb_cargar)
end on

event open;String	ls_fecha,ls_descrip
Long		ll_mes,ll_anno,ll_count
Datetime	ldt_fecha_hoy,ldt_max_fec_proc

Connect using Trans_1;
il_tipo_seguro 	= long(Message.StringParm)
SELECT	COUNT("TIPO_SEGURO_PARQUE"."CODIGO_SEGURO")
INTO 		:ll_count  
FROM 	"TIPO_SEGURO_PARQUE"  
WHERE 	"TIPO_SEGURO_PARQUE"."CODIGO_SEGURO" = :il_tipo_seguro   ;
if ll_count>0 then
	gf_centrar(w_seguros_desgravamen)
	tab_seguro.tabpage_1.dw_lista_seguro.settransobject(sqlca)
	tab_seguro.tabpage_2.dw_lista_reliquida.settransobject(sqlca)
	tab_seguro.tabpage_3.dw_lista_menores18.settransobject(sqlca)
	tab_seguro.tabpage_2.st_no_rel.visible		= false
	tab_seguro.tabpage_3.st_no_men18.visible	= false
	SELECT	MAX("SEGURO_PROCESO"."FECHA_CIERRE")  
	INTO 		:ldt_max_fec_proc  
	FROM 		"SEGURO_PROCESO"  
	WHERE		"SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro;
	if not isnull(ldt_max_fec_proc) then
		ldt_fecha_hoy	= ldt_max_fec_proc
	else
		ldt_fecha_hoy	= gdt_fec_sistema
	end if
	idt_fecha_hoy		= date(gdt_fec_sistema)
	ll_mes				= long(mid(string(ldt_fecha_hoy),4,2))
	ll_anno				= long(mid(string(ldt_fecha_hoy),7,4))
	if ll_mes=1 or ll_mes=3 or ll_mes=5 or ll_mes=7 or ll_mes=8 or ll_mes=10 or ll_mes=12 then
		ls_fecha			= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	elseif ll_mes=2 then
		if ll_anno/4 = int(ll_anno/4) then
			ls_fecha		= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		else
			ls_fecha		= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		end if
	elseif ll_mes=4 or ll_mes=6 or ll_mes=9 or ll_mes=11 then
		ls_fecha			= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	end if
	em_fec_ini.text 	= ls_fecha
	idt_fec_ult_cierre= datetime(date(em_fec_ini.text),time('00:00:00'))
	dw_parque.settransobject(sqlca)
	dw_parque.getchild('cod_parque',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.retrieve(il_tipo_seguro)
	SELECT DISTINCT "TIPO_SEGURO_PARQUE"."DESCRIPCION"
	INTO 		:ls_descrip  
	FROM 	"TIPO_SEGURO_PARQUE"  
	WHERE 	"TIPO_SEGURO_PARQUE"."CODIGO_SEGURO" = :il_tipo_seguro   ;
	dw_parque.insertrow(0)
	if il_tipo_seguro=4 then //Seguro Desgravamen
		SELECT	"SEGURO_DESGRAVAMEN"."TASA"  
		INTO 		:idb_tasa
		FROM 	"SEGURO_DESGRAVAMEN"  
		WHERE 	"SEGURO_DESGRAVAMEN"."FECHA" = ( SELECT DISTINCT max( "SEGURO_DESGRAVAMEN"."FECHA") 
		FROM 	"SEGURO_DESGRAVAMEN" )  
		USING		sqlca;
		this.title																= ls_descrip+'                        Tasa: '+string(idb_tasa,'###,##0.0###')
		tab_seguro.tabpage_1.dw_lista_seguro.dataobject		= 'dw_proceso_cierre_seguro_desg_def'
		tab_seguro.tabpage_2.dw_lista_reliquida.dataobject		= 'dw_proceso_seguro_reliquida'
		tab_seguro.tabpage_3.dw_lista_menores18.dataobject	= 'dw_proceso_seguro_menor18'
		tab_seguro.tabpage_1.dw_lista_seguro.settransobject(sqlca)
		tab_seguro.tabpage_2.dw_lista_reliquida.settransobject(sqlca)
		tab_seguro.tabpage_3.dw_lista_menores18.settransobject(sqlca)
		
	elseif il_tipo_seguro=1 then //Seguro Renta y Deceso
		tab_seguro.tabpage_1.dw_lista_seguro.dataobject		= 'dw_proceso_cierre_seguro_renta_dec_def'
		tab_seguro.tabpage_3.dw_lista_menores18.dataobject	= 'dw_proceso_seguro_menor18'
		tab_seguro.tabpage_1.dw_lista_seguro.settransobject(sqlca)
		tab_seguro.tabpage_3.dw_lista_menores18.settransobject(sqlca)
		this.title																= ls_descrip
		tab_seguro.tabpage_2.visible	= false
		
	elseif il_tipo_seguro=2 then //Seguro Colectivo Accidente Personal
		tab_seguro.tabpage_1.dw_lista_seguro.dataobject		= 'dw_proceso_cierre_seguro_accidente_def'
		tab_seguro.tabpage_3.dw_lista_menores18.dataobject	= 'dw_proceso_seguro_menor18'
		tab_seguro.tabpage_1.dw_lista_seguro.settransobject(sqlca)
		tab_seguro.tabpage_3.dw_lista_menores18.settransobject(sqlca)
		this.title																= ls_descrip
		tab_seguro.tabpage_2.visible	= false
		
	elseif il_tipo_seguro=3 then //Seguro Sugundo Asegurado
		tab_seguro.tabpage_1.dw_lista_seguro.dataobject		= 'dw_proceso_cierre_seguro_aseg_def'
		tab_seguro.tabpage_2.dw_lista_reliquida.dataobject		= 'dw_proceso_seguro_aseg_reliquida'
		tab_seguro.tabpage_3.dw_lista_menores18.dataobject	= 'dw_proceso_seguro_menor18'
		tab_seguro.tabpage_1.dw_lista_seguro.settransobject(sqlca)
		tab_seguro.tabpage_2.dw_lista_reliquida.settransobject(sqlca)
		tab_seguro.tabpage_3.dw_lista_menores18.settransobject(sqlca)
		this.title																= ls_descrip
		
	elseif il_tipo_seguro=5 then //Seguro Cobertura Fallecimiento
		tab_seguro.tabpage_1.dw_lista_seguro.dataobject		= 'dw_proceso_cierre_seguro_fallecimiento'
		tab_seguro.tabpage_2.dw_lista_reliquida.dataobject		= 'dw_proceso_seguro_reliquida'
		tab_seguro.tabpage_3.dw_lista_menores18.dataobject	= 'dw_proceso_seguro_menor18'
		tab_seguro.tabpage_1.dw_lista_seguro.settransobject(sqlca)
		tab_seguro.tabpage_3.dw_lista_menores18.settransobject(sqlca)
		tab_seguro.tabpage_2.dw_lista_reliquida.settransobject(sqlca)
		this.title																= ls_descrip
		tab_seguro.tabpage_2.visible	= true
		tab_seguro.tabpage_3.visible	= false
		
	end if
else
	messagebox("Advertencia","Para este Tipo de Seguro NO es Posible Generar Proceso")
	close(w_seguros_desgravamen)
end if
end event

event close;Disconnect using Trans_1;
end event

type dw_exp_archivo from datawindow within w_seguros_desgravamen
boolean visible = false
integer x = 1070
integer y = 1884
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_envio_seguro_fallecimiento"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_seguros_desgravamen
integer x = 46
integer y = 1836
integer width = 526
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;Long		ll_fila
String	ls_ctto

Setnull(gs_base);Setnull(gs_serie);Setnull(gi_numero)
if tab_seguro.SelectedTab = 1 then
	ll_fila			= tab_seguro.tabpage_1.dw_lista_seguro.getrow()
	if ll_fila>0 and tab_seguro.tabpage_1.dw_lista_seguro.rowcount()>0 then
		ls_ctto		= trim(tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_fila,'nro_operacion'))
		gs_serie		= mid(ls_ctto,1,1)
		gi_numero	= Double(mid(ls_ctto,2))
		if gs_serie='L' then
			gs_base	= 'L'
		else
			gs_base	= 'O'
		end if
	end if
elseif tab_seguro.SelectedTab = 2 then
	ll_fila			= tab_seguro.tabpage_2.dw_lista_reliquida.getrow()
	if ll_fila>0 and tab_seguro.tabpage_2.dw_lista_reliquida.rowcount()>0 then
		ls_ctto		= trim(tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_fila,'nro_operacion'))
		gs_serie		= mid(ls_ctto,1,1)
		gi_numero	= Double(mid(ls_ctto,2))
		if gs_serie='L' then
			gs_base	= 'L'
		else
			gs_base	= 'O'
		end if
	end if
elseif tab_seguro.SelectedTab = 3 then
	ll_fila			= tab_seguro.tabpage_3.dw_lista_menores18.getrow()
	if ll_fila>0 and tab_seguro.tabpage_3.dw_lista_menores18.rowcount()>0 then
		ls_ctto		= trim(tab_seguro.tabpage_3.dw_lista_menores18.getitemstring(ll_fila,'nro_operacion'))
		gs_serie		= mid(ls_ctto,1,1)
		gi_numero	= Double(mid(ls_ctto,2))
		if gs_serie='L' then
			gs_base	= 'L'
		else
			gs_base	= 'O'
		end if
	end if
end if
if ll_fila > 0 and not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 then
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
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
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F","G"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria)
	END CHOOSE
end if
end event

type tab_seguro from tab within w_seguros_desgravamen
integer x = 27
integer y = 156
integer width = 3227
integer height = 1624
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_seguro.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_seguro.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_seguro
event create ( )
event destroy ( )
integer x = 18
integer y = 120
integer width = 3191
integer height = 1488
long backcolor = 67108864
string text = " Proceso Seguro"
long tabtextcolor = 33554432
string picturename = "Custom016!"
long picturemaskcolor = 536870912
pb_buscar pb_buscar
em_rut em_rut
st_1 st_1
cb_ver_detalle cb_ver_detalle
cb_exp_des cb_exp_des
cb_print_des cb_print_des
cb_fil_des cb_fil_des
cb_ord_des cb_ord_des
dw_lista_seguro dw_lista_seguro
gb_3 gb_3
end type

on tabpage_1.create
this.pb_buscar=create pb_buscar
this.em_rut=create em_rut
this.st_1=create st_1
this.cb_ver_detalle=create cb_ver_detalle
this.cb_exp_des=create cb_exp_des
this.cb_print_des=create cb_print_des
this.cb_fil_des=create cb_fil_des
this.cb_ord_des=create cb_ord_des
this.dw_lista_seguro=create dw_lista_seguro
this.gb_3=create gb_3
this.Control[]={this.pb_buscar,&
this.em_rut,&
this.st_1,&
this.cb_ver_detalle,&
this.cb_exp_des,&
this.cb_print_des,&
this.cb_fil_des,&
this.cb_ord_des,&
this.dw_lista_seguro,&
this.gb_3}
end on

on tabpage_1.destroy
destroy(this.pb_buscar)
destroy(this.em_rut)
destroy(this.st_1)
destroy(this.cb_ver_detalle)
destroy(this.cb_exp_des)
destroy(this.cb_print_des)
destroy(this.cb_fil_des)
destroy(this.cb_ord_des)
destroy(this.dw_lista_seguro)
destroy(this.gb_3)
end on

type pb_buscar from picturebutton within tabpage_1
integer x = 2336
integer y = 1352
integer width = 96
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.BMP"
alignment htextalign = left!
end type

event clicked;Long	ll_rut,ll_fila,ll_tot_reg

ll_rut		= long(em_rut.text)
ll_tot_reg	= tab_seguro.tabpage_1.dw_lista_seguro.rowcount()
if ll_rut>0 and ll_tot_reg>0 then
	ll_fila	= tab_seguro.tabpage_1.dw_lista_seguro.Find("rut = "+string(ll_rut), 1, ll_tot_reg)
	if ll_fila>0 then
		tab_seguro.tabpage_1.dw_lista_seguro.scrolltorow(ll_fila)
		tab_seguro.tabpage_1.dw_lista_seguro.setfocus()
	else
		messagebox("Advertencia","No Fue Encontrado Rut "+string(ll_rut,'###,###,###,###,###'))
	end if
end if
end event

type em_rut from editmask within tabpage_1
integer x = 1975
integer y = 1352
integer width = 352
integer height = 96
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if long(this.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type st_1 from statictext within tabpage_1
integer x = 1687
integer y = 1368
integer width = 270
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_ver_detalle from commandbutton within tabpage_1
integer x = 2647
integer y = 1332
integer width = 512
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Detalle Proceso"
end type

event clicked;Long		ll_cod_parque
date		ldt_fecha_cierre
String	ls_string

ldt_fecha_cierre		= date(em_fec_ini.text)
ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')
if not isnull(ldt_fecha_cierre) and ll_cod_parque>0 then
	ls_string			= string(ldt_fecha_cierre)+'~t'+string(ll_cod_parque)+'~t'+string(il_tipo_seguro)
	if isvalid(w_detalle_proceso_seguro_cierre) then close(w_detalle_proceso_seguro_cierre)
	openwithparm(w_detalle_proceso_seguro_cierre,ls_string)
end if
end event

type cb_exp_des from commandbutton within tabpage_1
integer x = 1015
integer y = 1344
integer width = 594
integer height = 96
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar Seguro"
end type

event clicked;string	ls_serie,ls_nulo,ls_base,ls_moneda,ls_nom_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_tipo_via_tit,ls_direc_tit,&
			ls_nro_tit,ls_depto_tit,ls_block_tit,ls_comuna_tit,ls_ciudad_tit,ls_sexo,ls_estado_tit,ls_email_tit,&
			ls_celular_tit,ls_fonop_tit,ls_dir_tit,ls_periodo,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_cod_parentesco,&
			ls_nom_benef,ls_descrip,ls_nom_adi,ls_dv_ben,ls_nom_campo_nom
long 		ll_indi,ll_cod_parque,ll_tot_reg,ll_new,ll_nulo,ll_rut,ll_cod_seg_det,ll_corr_benef,ll_corr_adic,&
			ll_plan,ll_estado_cliente,ll_rut_ben
datetime	ldt_fecha_cierre,ldt_nulo,ldt_fecha_nac
Double	ldb_porce,ll_numero,ll_nro_asegurado

Setnull(ldt_nulo);Setnull(ls_nulo);Setnull(ll_nulo)

ldt_fecha_cierre	= datetime(date(em_fec_ini.text),time('00:00:00'))
ll_cod_parque		= dw_parque.getitemnumber(1,'cod_parque')
if tab_seguro.tabpage_1.dw_lista_seguro.rowcount() > 0 then
	SetPointer(HourGlass!)
	
	if il_tipo_seguro=4 or il_tipo_seguro=3 then //Seguro Desgravamen y 2º Asegurado
		dw_exp_archivo.dataobject	= 'dwe_exportar_proceso_seg_4y3_reliq'
	elseif il_tipo_seguro=1 then //Seguro Renta y Deceso
		dw_exp_archivo.dataobject	= 'dwe_exportar_proceso_seg_1'
	elseif il_tipo_seguro=2 then //Seguro Colectivo Accidente Personal
		dw_exp_archivo.dataobject	= 'dwe_exportar_proceso_seg_2'
	elseif il_tipo_seguro=5 then //Seguro Fallecimiento
		dw_exp_archivo.dataobject	= 'dwe_envio_seguro_fallecimiento'
	end if
	dw_exp_archivo.settransobject(sqlca)
	dw_exp_archivo.reset()
	ll_tot_reg		= tab_seguro.tabpage_1.dw_lista_seguro.rowcount()
	for ll_indi = 1 to ll_tot_reg
		ls_serie		= mid(trim(tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'nro_operacion')),1,1)
		ll_numero	= Double(mid(trim(tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'nro_operacion')),2))
		if il_tipo_seguro=4 or il_tipo_seguro=3 then //Seguro Desgravamen y 2º Asegurado
			ll_new	= dw_exp_archivo.insertrow(0)
			dw_exp_archivo.setitem(ll_new,'fec_proc',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_proceso'))
			dw_exp_archivo.setitem(ll_new,'npol',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'nro_poliza'))
			dw_exp_archivo.setitem(ll_new,'rut',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'rut'))
			dw_exp_archivo.setitem(ll_new,'digito',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'dv'))
			dw_exp_archivo.setitem(ll_new,'nombre',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'nombre'))
			dw_exp_archivo.setitem(ll_new,'ap_pat',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'ap_paterno'))
			dw_exp_archivo.setitem(ll_new,'ap_mat',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'ap_materno'))
			dw_exp_archivo.setitem(ll_new,'fec_nac',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_nac'))
			dw_exp_archivo.setitem(ll_new,'sexo',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'sexo'))
			dw_exp_archivo.setitem(ll_new,'numope',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'nro_operacion'))
			dw_exp_archivo.setitem(ll_new,'tip_cred1',ls_nulo)
			dw_exp_archivo.setitem(ll_new,'fec_esc',ldt_nulo)
			dw_exp_archivo.setitem(ll_new,'fec_ini',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_contrato'))
			if tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'moneda')='1' then
				ls_moneda	= 'PESOS'
			else
				ls_moneda	= 'UF'
			end if
			dw_exp_archivo.setitem(ll_new,'moneda',ls_moneda)
			dw_exp_archivo.setitem(ll_new,'mon_ini',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'precio'))
			dw_exp_archivo.setitem(ll_new,'tasa',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'tasa_contrato'))
			dw_exp_archivo.setitem(ll_new,'sob_tcre',ll_nulo)
			dw_exp_archivo.setitem(ll_new,'fre_pag',ldt_nulo)
			dw_exp_archivo.setitem(ll_new,'totaldiv',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'plazo'))
			dw_exp_archivo.setitem(ll_new,'salinso',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'saldo_insoluto'))
			dw_exp_archivo.setitem(ll_new,'fec_ins',ldt_nulo)
			dw_exp_archivo.setitem(ll_new,'divcanc',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'ctas_pagadas'))
			dw_exp_archivo.setitem(ll_new,'tas_seg',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'tasa_seguro'))
			dw_exp_archivo.setitem(ll_new,'sob_tseg',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'sobre_tasa_seguro'))
			dw_exp_archivo.setitem(ll_new,'prima',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'prima'))
			dw_exp_archivo.setitem(ll_new,'prima_uf',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'prima_uf'))
			dw_exp_archivo.setitem(ll_new,'fecha_cierre',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_cierre'))
			dw_exp_archivo.setitem(ll_new,'uf_dia',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'uf_dia'))
			
		elseif il_tipo_seguro=1 then //Seguro Renta y Deceso
			ll_new	= dw_exp_archivo.insertrow(0)
			dw_exp_archivo.setitem(ll_new,'cod_parque',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'cod_parque'))
			dw_exp_archivo.setitem(ll_new,'codigo',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'base'))
			dw_exp_archivo.setitem(ll_new,'serie',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'serie'))
			dw_exp_archivo.setitem(ll_new,'numero',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'numero'))
			dw_exp_archivo.setitem(ll_new,'estado',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'seguro_proceso_estado_contrato'))
			dw_exp_archivo.setitem(ll_new,'estado_titular',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'seguro_proceso_estado_titular'))
			dw_exp_archivo.setitem(ll_new,'fecha_nac',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_nac'))
			dw_exp_archivo.setitem(ll_new,'rut',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'rut'))
			dw_exp_archivo.setitem(ll_new,'dv',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'dv'))
			dw_exp_archivo.setitem(ll_new,'nombre',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'nombre'))
			dw_exp_archivo.setitem(ll_new,'a_paterno',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'ap_paterno'))
			dw_exp_archivo.setitem(ll_new,'a_materno',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'ap_materno'))
			dw_exp_archivo.setitem(ll_new,'fecha',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_contrato'))
			dw_exp_archivo.setitem(ll_new,'sexo',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'sexo'))
			dw_exp_archivo.setitem(ll_new,'codigo_tipo_seguro',il_tipo_seguro)
			dw_exp_archivo.setitem(ll_new,'descripcion',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'tipo_seguro_descripcion'))
			dw_exp_archivo.setitem(ll_new,'estado',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'seguro_proceso_estado_factura'))
			dw_exp_archivo.setitem(ll_new,'fecha_cierre',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_cierre'))
			dw_exp_archivo.setitem(ll_new,'valor_uf',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'uf_dia'))
			dw_exp_archivo.setitem(ll_new,'mora',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'seguro_proceso_mora_cred'))
			dw_exp_archivo.setitem(ll_new,'prima_ps',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'prima'))
			dw_exp_archivo.setitem(ll_new,'prima_uf',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'prima_uf'))
			dw_exp_archivo.setitem(ll_new,'fecha_proceso',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_cierre'))
			dw_exp_archivo.setitem(ll_new,'uf_dia',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'uf_dia'))
			
		elseif il_tipo_seguro=2 then //Seguro Colectivo Accidente Personal
			ll_new	= dw_exp_archivo.insertrow(0)
			dw_exp_archivo.setitem(ll_new,'cod_parque',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'cod_parque'))
			dw_exp_archivo.setitem(ll_new,'codigo',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'base'))
			dw_exp_archivo.setitem(ll_new,'serie',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'serie'))
			dw_exp_archivo.setitem(ll_new,'numero',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'numero'))
			dw_exp_archivo.setitem(ll_new,'fecha',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_contrato'))
			dw_exp_archivo.setitem(ll_new,'rut',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'rut'))
			dw_exp_archivo.setitem(ll_new,'dv',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'dv'))
			dw_exp_archivo.setitem(ll_new,'nombre',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'nombre'))
			dw_exp_archivo.setitem(ll_new,'a_paterno',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'ap_paterno'))
			dw_exp_archivo.setitem(ll_new,'a_materno',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'ap_materno'))
			dw_exp_archivo.setitem(ll_new,'fecha_nac',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_nac'))
			dw_exp_archivo.setitem(ll_new,'sexo',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'sexo'))
			dw_exp_archivo.setitem(ll_new,'capital',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'saldo_insoluto'))
			dw_exp_archivo.setitem(ll_new,'prima_uf',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'prima_uf'))
			dw_exp_archivo.setitem(ll_new,'fecha_cierre',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_cierre'))
			dw_exp_archivo.setitem(ll_new,'uf_dia',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'uf_dia'))
			
		elseif il_tipo_seguro=5 then //Seguro Fallecimiento
			ll_corr_benef	= 0
			ll_corr_adic	= 0
			ls_base			= 'O'
			ll_rut			= tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'rut')
			ll_new			= dw_exp_archivo.insertrow(0)
			dw_exp_archivo.setitem(ll_new,'folio_propuesta',ll_numero)
			dw_exp_archivo.setitem(ll_new,'nombre_titular',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'nombre'))
			dw_exp_archivo.setitem(ll_new,'ap_paterno_titular',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'ap_paterno'))
			dw_exp_archivo.setitem(ll_new,'ap_materno_titular',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'ap_materno'))
			dw_exp_archivo.setitem(ll_new,'rut_titular',ll_rut)
			dw_exp_archivo.setitem(ll_new,'dv_titular',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'dv'))
			SELECT	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"COMUNA"."COMUNA",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE"."SEXO",	"CLIENTE"."ESTA_CIVIL",	"CLIENTE"."EMAIL",	"CLIENTE"."CELULAR",	"CLIENTE"."FONO_P"
			INTO 		:ls_tipo_via_tit,				:ls_direc_tit,					:ls_nro_tit,							:ls_depto_tit, 					:ls_block_tit,						:ls_comuna_tit,		:ls_ciudad_tit,				:ls_sexo,			:ls_estado_tit,			:ls_email_tit,			:ls_celular_tit,		:ls_fonop_tit  
			FROM		"CIUDAD",	"CLIENTE",	"COMUNA",	"TIPO_VIA"  
			WHERE  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
					 ( "CIUDAD"."CODIGO_CIUDAD" = "CLIENTE"."CIUDAD" ) and  
					 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
					 (("CLIENTE"."RUT" = :ll_rut ) )   
			USING		Trans_1;
			ls_dir_tit			= UPPER(ls_tipo_via_tit+' '+ls_direc_tit+' Nº '+ls_nro_tit)
			if not isnull(ls_depto_tit) and ls_depto_tit<>'' and ls_depto_tit<>'-' and ls_depto_tit<>' ' then
				ls_dir_tit		= UPPER(ls_dir_tit+' Depto: '+ls_depto_tit)
			end if
			if not isnull(ls_block_tit) and ls_block_tit<>'' and ls_block_tit<>'-' and ls_block_tit<>' ' then
				ls_dir_tit		= UPPER(ls_dir_tit+' Block: '+ls_block_tit)
			end if
			ll_plan				= 1
			ll_estado_cliente	= 1
			ls_periodo			= mid(em_fec_ini.text,4)
			dw_exp_archivo.setitem(ll_new,'direccion_particular',ls_dir_tit)
			dw_exp_archivo.setitem(ll_new,'comuna_particular',UPPER(ls_comuna_tit))
			dw_exp_archivo.setitem(ll_new,'ciudad_particular',UPPER(ls_ciudad_tit))
			dw_exp_archivo.setitem(ll_new,'fono_celular',ls_fonop_tit)
			dw_exp_archivo.setitem(ll_new,'email',ls_email_tit)
			dw_exp_archivo.setitem(ll_new,'fecha_nacimiento',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_nac'))
			dw_exp_archivo.setitem(ll_new,'sexo',tab_seguro.tabpage_1.dw_lista_seguro.getitemstring(ll_indi,'sexo'))
			dw_exp_archivo.setitem(ll_new,'estado_civil',ls_estado_tit)
			dw_exp_archivo.setitem(ll_new,'plan',ll_plan)
			dw_exp_archivo.setitem(ll_new,'fecha_inicio_cred',tab_seguro.tabpage_1.dw_lista_seguro.getitemdatetime(ll_indi,'fecha_contrato'))
			dw_exp_archivo.setitem(ll_new,'plazo',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'plazo'))
			dw_exp_archivo.setitem(ll_new,'nro_contrato',ll_numero)
			dw_exp_archivo.setitem(ll_new,'estado_cliente',ll_estado_cliente)
			dw_exp_archivo.setitem(ll_new,'valor_recaudado',tab_seguro.tabpage_1.dw_lista_seguro.getitemnumber(ll_indi,'prima_uf'))
			dw_exp_archivo.setitem(ll_new,'periodo_pago',ls_periodo)
			ls_moneda			= 'UF'
			dw_exp_archivo.setitem(ll_new,'moneda',ls_moneda)
			dw_exp_archivo.setitem(ll_new,'fecha_envio',ldt_fecha_cierre)
			
			DECLARE x1 CURSOR FOR  
			SELECT	"BENEFICIARIOS_SEGURO"."RUT",   
						"BENEFICIARIOS_SEGURO"."DV",   
						"BENEFICIARIOS_SEGURO"."NOMBRES",   
						"BENEFICIARIOS_SEGURO"."AP_PATERNO",   
						"BENEFICIARIOS_SEGURO"."AP_MATERNO",   
						"BENEFICIARIOS_SEGURO"."CODIGO_SEGURO_DETALLE",   
						"BENEFICIARIOS_SEGURO"."FECHA_NACIMIENTO",   
						"BENEFICIARIOS_SEGURO"."SEXO",   
						"BENEFICIARIOS_SEGURO"."PORCE_UF_DESIGNA",   
						"BENEFICIARIOS_SEGURO"."CODIGO_PARENTESCO"  
			FROM 		"BENEFICIARIOS_SEGURO",	"TIPO_VIA",	"CIUDAD", "COMUNA"  
			WHERE  ( "BENEFICIARIOS_SEGURO"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
					 ( "BENEFICIARIOS_SEGURO"."COMUNA_PARTICULAR" = "COMUNA"."CODIGO_COMUNA" ) and  
					 ( "BENEFICIARIOS_SEGURO"."CIUDAD_PARTICULAR" = "CIUDAD"."CODIGO_CIUDAD" ) and  
					 (("BENEFICIARIOS_SEGURO"."BASE" = :ls_base ) AND  
					 ( "BENEFICIARIOS_SEGURO"."SERIE" = :ls_serie ) AND  
				 	 ( "BENEFICIARIOS_SEGURO"."NUMERO" = :ll_numero ) AND  
					 ( "BENEFICIARIOS_SEGURO"."CODIGO_SEGURO" = 5 ) )  
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x1 into :ll_rut_ben, :ls_dv_ben, :ls_nom, :ls_ap_pat, :ls_ap_mat, :ll_cod_seg_det, :ldt_fecha_nac, :ls_sexo, :ldb_porce, :ls_cod_parentesco;
					if ll_rut_ben > 0 then
						if ll_cod_seg_det = 2 then
							ll_corr_benef ++
							ls_nom_benef			= ls_nom +' '+ ls_ap_pat +' '+ ls_ap_mat
							SELECT	"PARENTESCO"."PARENTESCO"  
							INTO 		:ls_descrip  
							FROM 		"PARENTESCO"  
							WHERE  ( "PARENTESCO"."CODIGO" = :ls_cod_parentesco ) AND  
									 ( "PARENTESCO"."COD_PARQUE" = 1 )   
							USING		Trans_1;
							if ll_corr_benef=1 then
								dw_exp_archivo.setitem(ll_new,'nombre_benef1',ls_nom_benef)
								dw_exp_archivo.setitem(ll_new,'parentesco_benef1',ls_descrip)
								dw_exp_archivo.setitem(ll_new,'porce_capital_benef1',ldb_porce)	
							elseif ll_corr_benef=2 then
								dw_exp_archivo.setitem(ll_new,'nombre_benef2',ls_nom_benef)
								dw_exp_archivo.setitem(ll_new,'parentesco_benef2',ls_descrip)
								dw_exp_archivo.setitem(ll_new,'porce_capital_benef2',ldb_porce)	
							elseif ll_corr_benef=3 then
								dw_exp_archivo.setitem(ll_new,'nombre_benef3',ls_nom_benef)
								dw_exp_archivo.setitem(ll_new,'parentesco_benef3',ls_descrip)
								dw_exp_archivo.setitem(ll_new,'porce_capital_benef3',ldb_porce)	
							end if
						elseif ll_cod_seg_det = 1 then
							ll_corr_adic ++
							ls_nom_adi				= ls_nom +' '+ ls_ap_pat +' '+ ls_ap_mat
							SELECT	"PARENTESCO"."PARENTESCO"  
							INTO 		:ls_descrip  
							FROM 		"PARENTESCO"  
							WHERE  ( "PARENTESCO"."CODIGO" = :ls_cod_parentesco ) AND  
									 ( "PARENTESCO"."COD_PARQUE" = 1 )   
							USING		Trans_1;
							if ll_corr_adic=1 then
								dw_exp_archivo.setitem(ll_new,'nombre_aseg_adicional1',ls_nom_adi)
								dw_exp_archivo.setitem(ll_new,'rut_aseg_adicional1',ll_rut_ben)
								dw_exp_archivo.setitem(ll_new,'dv_aseg_adicional1',ls_dv_ben)
								dw_exp_archivo.setitem(ll_new,'fecha_nac_aseg_adicional1',ldt_fecha_nac)
								dw_exp_archivo.setitem(ll_new,'parentesco_aseg_adicional1',ls_descrip)
							elseif ll_corr_adic=2 then
								dw_exp_archivo.setitem(ll_new,'nombre_aseg_adicional2',ls_nom_adi)
								dw_exp_archivo.setitem(ll_new,'rut_aseg_adicional2',ll_rut_ben)
								dw_exp_archivo.setitem(ll_new,'dv_aseg_adicional2',ls_dv_ben)
								dw_exp_archivo.setitem(ll_new,'fecha_nac_aseg_adicional2',ldt_fecha_nac)
								dw_exp_archivo.setitem(ll_new,'parentesco_aseg_adicional2',ls_descrip)
							elseif ll_corr_adic=3 then
								dw_exp_archivo.setitem(ll_new,'nombre_aseg_adicional3',ls_nom_adi)
								dw_exp_archivo.setitem(ll_new,'rut_aseg_adicional3',ll_rut_ben)
								dw_exp_archivo.setitem(ll_new,'dv_aseg_adicional3',ls_dv_ben)
								dw_exp_archivo.setitem(ll_new,'fecha_nac_aseg_adicional3',ldt_fecha_nac)
								dw_exp_archivo.setitem(ll_new,'parentesco_aseg_adicional3',ls_descrip)
							elseif ll_corr_adic=4 then
								dw_exp_archivo.setitem(ll_new,'nombre_aseg_adicional4',ls_nom_adi)
								dw_exp_archivo.setitem(ll_new,'rut_aseg_adicional4',ll_rut_ben)
								dw_exp_archivo.setitem(ll_new,'dv_aseg_adicional4',ls_dv_ben)
								dw_exp_archivo.setitem(ll_new,'fecha_nac_aseg_adicional4',ldt_fecha_nac)
								dw_exp_archivo.setitem(ll_new,'parentesco_aseg_adicional4',ls_descrip)
							elseif ll_corr_adic=5 then
								dw_exp_archivo.setitem(ll_new,'nombre_aseg_adicional5',ls_nom_adi)
								dw_exp_archivo.setitem(ll_new,'rut_aseg_adicional5',ll_rut_ben)
								dw_exp_archivo.setitem(ll_new,'dv_aseg_adicional5',ls_dv_ben)
								dw_exp_archivo.setitem(ll_new,'fecha_nac_aseg_adicional5',ldt_fecha_nac)
								dw_exp_archivo.setitem(ll_new,'parentesco_aseg_adicional5',ls_descrip)
							end if
						end if
					end if
					Setnull(ll_rut_ben);setnull(ls_cod_parentesco)
				LOOP
			end if
			close x1;
			dw_exp_archivo.setitem(ll_new,'nro_asegurado_adicional',ll_corr_adic)
		end if
	next
	dw_exp_archivo.accepttext()
	dw_paso 			= dw_exp_archivo
	dw_paso.accepttext()
	SetPointer(Arrow!)
//	openwithparm(w_exportar_seguro, dw_paso)
	f_DWToExcel( dw_paso )
else
	messagebox(gs_app_name,'No Registra Dato',information!)
end if
end event

type cb_print_des from commandbutton within tabpage_1
integer x = 658
integer y = 1344
integer width = 247
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if tab_seguro.tabpage_1.dw_lista_seguro.rowcount()>0 then
	f_Print( tab_seguro.tabpage_1.dw_lista_seguro )
end if
end event

type cb_fil_des from commandbutton within tabpage_1
integer x = 302
integer y = 1344
integer width = 247
integer height = 96
integer taborder = 60
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
tab_seguro.tabpage_1.dw_lista_seguro.SETfilter(NULO)
tab_seguro.tabpage_1.dw_lista_seguro.filter()
end event

type cb_ord_des from commandbutton within tabpage_1
integer x = 50
integer y = 1344
integer width = 247
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if tab_seguro.tabpage_1.dw_lista_seguro.rowcount() > 0 then
	string nulo
	setnull (nulo)
	tab_seguro.tabpage_1.dw_lista_seguro.SETSORT(NULO)
	tab_seguro.tabpage_1.dw_lista_seguro.SORT()
end if
end event

type dw_lista_seguro from datawindow within tabpage_1
integer x = 27
integer y = 48
integer width = 3131
integer height = 1240
integer taborder = 30
string title = "none"
string dataobject = "dw_proceso_cierre_seguro_desg_def"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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

type gb_3 from groupbox within tabpage_1
integer x = 27
integer y = 1296
integer width = 1605
integer height = 164
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_2 from userobject within tab_seguro
event create ( )
event destroy ( )
integer x = 18
integer y = 120
integer width = 3191
integer height = 1488
long backcolor = 67108864
string text = " Re-Liquidación"
long tabtextcolor = 33554432
string picturename = "Continue!"
long picturemaskcolor = 536870912
pb_rut_rel pb_rut_rel
em_rut_rel em_rut_rel
st_3 st_3
st_no_rel st_no_rel
cb_exp_rel cb_exp_rel
cb_print_rel cb_print_rel
cb_fil_rel cb_fil_rel
cb_ord_rel cb_ord_rel
dw_lista_reliquida dw_lista_reliquida
gb_2 gb_2
end type

on tabpage_2.create
this.pb_rut_rel=create pb_rut_rel
this.em_rut_rel=create em_rut_rel
this.st_3=create st_3
this.st_no_rel=create st_no_rel
this.cb_exp_rel=create cb_exp_rel
this.cb_print_rel=create cb_print_rel
this.cb_fil_rel=create cb_fil_rel
this.cb_ord_rel=create cb_ord_rel
this.dw_lista_reliquida=create dw_lista_reliquida
this.gb_2=create gb_2
this.Control[]={this.pb_rut_rel,&
this.em_rut_rel,&
this.st_3,&
this.st_no_rel,&
this.cb_exp_rel,&
this.cb_print_rel,&
this.cb_fil_rel,&
this.cb_ord_rel,&
this.dw_lista_reliquida,&
this.gb_2}
end on

on tabpage_2.destroy
destroy(this.pb_rut_rel)
destroy(this.em_rut_rel)
destroy(this.st_3)
destroy(this.st_no_rel)
destroy(this.cb_exp_rel)
destroy(this.cb_print_rel)
destroy(this.cb_fil_rel)
destroy(this.cb_ord_rel)
destroy(this.dw_lista_reliquida)
destroy(this.gb_2)
end on

type pb_rut_rel from picturebutton within tabpage_2
integer x = 2336
integer y = 1352
integer width = 96
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.bmp"
alignment htextalign = right!
end type

event clicked;Long	ll_rut,ll_fila,ll_tot_reg

ll_rut		= long(em_rut_rel.text)
ll_tot_reg	= tab_seguro.tabpage_2.dw_lista_reliquida.rowcount()
if ll_rut>0 and ll_tot_reg>0 then
	ll_fila	= tab_seguro.tabpage_2.dw_lista_reliquida.Find("rut = "+string(ll_rut), 1, ll_tot_reg)
	if ll_fila>0 then
		tab_seguro.tabpage_2.dw_lista_reliquida.scrolltorow(ll_fila)
		tab_seguro.tabpage_2.dw_lista_reliquida.setfocus()
	else
		messagebox("Advertencia","No Fue Encontrado Rut "+string(ll_rut,'###,###,###,###,###'))
	end if
end if
end event

type em_rut_rel from editmask within tabpage_2
integer x = 1975
integer y = 1352
integer width = 352
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if long(this.text)>0 then pb_rut_rel.triggerevent(clicked!)
end event

type st_3 from statictext within tabpage_2
integer x = 1687
integer y = 1368
integer width = 270
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_no_rel from statictext within tabpage_2
boolean visible = false
integer x = 27
integer y = 176
integer width = 3131
integer height = 896
integer textsize = -72
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
string text = "No Registra Dato"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_exp_rel from commandbutton within tabpage_2
integer x = 1015
integer y = 1344
integer width = 594
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar Re-Liquidación"
end type

event clicked;string	ls_serie,ls_nulo,ls_moneda,ls_base,ls_tipo_via_tit,ls_direc_tit,ls_nro_tit,ls_depto_tit,&
			ls_block_tit,ls_comuna_tit,ls_ciudad_tit,ls_estado_tit,ls_email_tit,ls_celular_tit,ls_nom_benef,&
			ls_fonop_tit,ls_dir_tit,ls_periodo,ls_dv_ben,ls_nom,ls_ap_pat,ls_ap_mat,ls_sexo,ls_cod_parentesco,&
			ls_descrip,ls_nom_adi
long 		ll_indi,ll_cod_parque,ll_tot_reg,ll_new,ll_nulo,ll_corr_benef,ll_corr_adic,ll_rut,&
			ll_plan,ll_estado_cliente,ll_rut_ben,ll_cod_seg_det
datetime	ldt_fecha_cierre,ldt_nulo,ldt_fecha_nac
Double	ldb_porce,ll_numero

Setnull(ldt_nulo);Setnull(ls_nulo);Setnull(ll_nulo)

ldt_fecha_cierre	= datetime(date(em_fec_ini.text),time('00:00:00'))
ll_cod_parque		= dw_parque.getitemnumber(1,'cod_parque')
if tab_seguro.tabpage_2.dw_lista_reliquida.rowcount() > 0 then
	SetPointer(HourGlass!)
	
	if il_tipo_seguro=4 or il_tipo_seguro=3 then //Seguro Desgravamen y 2º Asegurado
		dw_exp_archivo.dataobject	= 'dwe_exportar_proceso_seg_4y3_reliq'
	elseif il_tipo_seguro=1 then //Seguro Renta y Deceso
		dw_exp_archivo.dataobject	= 'dwe_exportar_proceso_seg_1'
	elseif il_tipo_seguro=2 then //Seguro Colectivo Accidente Personal
		dw_exp_archivo.dataobject	= 'dwe_exportar_proceso_seg_2'
	elseif il_tipo_seguro=5 then //Seguro Fallecimiento
		dw_exp_archivo.dataobject	= 'dwe_envio_seguro_fallecimiento'
	end if
	dw_exp_archivo.settransobject(sqlca)
	dw_exp_archivo.reset()
	ll_tot_reg		= tab_seguro.tabpage_2.dw_lista_reliquida.rowcount()
	for ll_indi = 1 to ll_tot_reg
		ls_serie		= mid(trim(tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'nro_operacion')),1,1)
		ll_numero	= Double(mid(trim(tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'nro_operacion')),2))
		if il_tipo_seguro=4 or il_tipo_seguro=3 then //Seguro Desgravamen y 2º Asegurado
			ll_new	= dw_exp_archivo.insertrow(0)
			dw_exp_archivo.setitem(ll_new,'fec_proc',tab_seguro.tabpage_2.dw_lista_reliquida.getitemdatetime(ll_indi,'fecha_proceso'))
			dw_exp_archivo.setitem(ll_new,'npol',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'nro_poliza'))
			dw_exp_archivo.setitem(ll_new,'rut',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'rut'))
			dw_exp_archivo.setitem(ll_new,'digito',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'dv'))
			dw_exp_archivo.setitem(ll_new,'nombre',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'nombre'))
			dw_exp_archivo.setitem(ll_new,'ap_pat',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'ap_paterno'))
			dw_exp_archivo.setitem(ll_new,'ap_mat',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'ap_materno'))
			dw_exp_archivo.setitem(ll_new,'fec_nac',tab_seguro.tabpage_2.dw_lista_reliquida.getitemdatetime(ll_indi,'fecha_nac'))
			dw_exp_archivo.setitem(ll_new,'sexo',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'sexo'))
			dw_exp_archivo.setitem(ll_new,'numope',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'nro_operacion'))
			dw_exp_archivo.setitem(ll_new,'tip_cred1',ls_nulo)
			dw_exp_archivo.setitem(ll_new,'fec_esc',ldt_nulo)
			dw_exp_archivo.setitem(ll_new,'fec_ini',tab_seguro.tabpage_2.dw_lista_reliquida.getitemdatetime(ll_indi,'fecha_contrato'))
			if tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'moneda')='1' then
				ls_moneda	= 'PESOS'
			else
				ls_moneda	= 'UF'
			end if
			dw_exp_archivo.setitem(ll_new,'moneda',ls_moneda)
			dw_exp_archivo.setitem(ll_new,'mon_ini',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'precio'))
			dw_exp_archivo.setitem(ll_new,'tasa',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'tasa_contrato'))
			dw_exp_archivo.setitem(ll_new,'sob_tcre',ll_nulo)
			dw_exp_archivo.setitem(ll_new,'fre_pag',ldt_nulo)
			dw_exp_archivo.setitem(ll_new,'totaldiv',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'plazo'))
			dw_exp_archivo.setitem(ll_new,'salinso',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'saldo_insoluto'))
			dw_exp_archivo.setitem(ll_new,'fec_ins',ldt_nulo)
			dw_exp_archivo.setitem(ll_new,'divcanc',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'ctas_pagadas'))
			dw_exp_archivo.setitem(ll_new,'tas_seg',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'tasa_seguro'))
			dw_exp_archivo.setitem(ll_new,'sob_tseg',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'sobre_tasa_seguro'))
			dw_exp_archivo.setitem(ll_new,'prima',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'prima'))
			dw_exp_archivo.setitem(ll_new,'prima_uf',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'prima_uf'))
			dw_exp_archivo.setitem(ll_new,'fecha_cierre',tab_seguro.tabpage_2.dw_lista_reliquida.getitemdatetime(ll_indi,'fecha_cierre'))
			dw_exp_archivo.setitem(ll_new,'uf_dia',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'uf_dia'))
			
		elseif il_tipo_seguro=5 then //Seguro Fallecimiento
			ll_corr_benef	= 0
			ll_corr_adic	= 0
			ls_base			= 'O'
			ll_rut			= tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'rut')
			ll_new			= dw_exp_archivo.insertrow(0)
			dw_exp_archivo.setitem(ll_new,'folio_propuesta',ll_numero)
			dw_exp_archivo.setitem(ll_new,'nombre_titular',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'nombre'))
			dw_exp_archivo.setitem(ll_new,'ap_paterno_titular',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'ap_paterno'))
			dw_exp_archivo.setitem(ll_new,'ap_materno_titular',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'ap_materno'))
			dw_exp_archivo.setitem(ll_new,'rut_titular',ll_rut)
			dw_exp_archivo.setitem(ll_new,'dv_titular',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'dv'))
			SELECT	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"COMUNA"."COMUNA",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE"."SEXO",	"CLIENTE"."ESTA_CIVIL",	"CLIENTE"."EMAIL",	"CLIENTE"."CELULAR",	"CLIENTE"."FONO_P"
			INTO 		:ls_tipo_via_tit,				:ls_direc_tit,					:ls_nro_tit,							:ls_depto_tit, 					:ls_block_tit,						:ls_comuna_tit,		:ls_ciudad_tit,				:ls_sexo,			:ls_estado_tit,			:ls_email_tit,			:ls_celular_tit,		:ls_fonop_tit  
			FROM		"CIUDAD",	"CLIENTE",	"COMUNA",	"TIPO_VIA"  
			WHERE  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
					 ( "CIUDAD"."CODIGO_CIUDAD" = "CLIENTE"."CIUDAD" ) and  
					 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
					 (("CLIENTE"."RUT" = :ll_rut ) )   
			USING		Trans_1;
			ls_dir_tit			= UPPER(ls_tipo_via_tit+' '+ls_direc_tit+' Nº '+ls_nro_tit)
			if not isnull(ls_depto_tit) and ls_depto_tit<>'' and ls_depto_tit<>'-' and ls_depto_tit<>' ' then
				ls_dir_tit		= UPPER(ls_dir_tit+' Depto: '+ls_depto_tit)
			end if
			if not isnull(ls_block_tit) and ls_block_tit<>'' and ls_block_tit<>'-' and ls_block_tit<>' ' then
				ls_dir_tit		= UPPER(ls_dir_tit+' Block: '+ls_block_tit)
			end if
			ll_plan				= 1
			ll_estado_cliente	= 1
			ls_periodo			= mid(em_fec_ini.text,4)
			dw_exp_archivo.setitem(ll_new,'direccion_particular',ls_dir_tit)
			dw_exp_archivo.setitem(ll_new,'comuna_particular',UPPER(ls_comuna_tit))
			dw_exp_archivo.setitem(ll_new,'ciudad_particular',UPPER(ls_ciudad_tit))
			dw_exp_archivo.setitem(ll_new,'fono_celular',ls_fonop_tit)
			dw_exp_archivo.setitem(ll_new,'email',ls_email_tit)
			dw_exp_archivo.setitem(ll_new,'fecha_nacimiento',tab_seguro.tabpage_2.dw_lista_reliquida.getitemdatetime(ll_indi,'fecha_nac'))
			dw_exp_archivo.setitem(ll_new,'sexo',tab_seguro.tabpage_2.dw_lista_reliquida.getitemstring(ll_indi,'sexo'))
			dw_exp_archivo.setitem(ll_new,'estado_civil',ls_estado_tit)
			dw_exp_archivo.setitem(ll_new,'plan',ll_plan)
			dw_exp_archivo.setitem(ll_new,'fecha_inicio_cred',tab_seguro.tabpage_2.dw_lista_reliquida.getitemdatetime(ll_indi,'fecha_contrato'))
			dw_exp_archivo.setitem(ll_new,'plazo',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'plazo'))
			dw_exp_archivo.setitem(ll_new,'nro_contrato',ll_numero)
			dw_exp_archivo.setitem(ll_new,'estado_cliente',ll_estado_cliente)
			dw_exp_archivo.setitem(ll_new,'valor_recaudado',tab_seguro.tabpage_2.dw_lista_reliquida.getitemnumber(ll_indi,'prima_uf'))
			dw_exp_archivo.setitem(ll_new,'periodo_pago',ls_periodo)
			ls_moneda	= 'UF'
			dw_exp_archivo.setitem(ll_new,'moneda',ls_moneda)
			dw_exp_archivo.setitem(ll_new,'fecha_envio',ldt_fecha_cierre)
			
			DECLARE x1 CURSOR FOR  
			SELECT	"BENEFICIARIOS_SEGURO"."RUT",   
						"BENEFICIARIOS_SEGURO"."DV",   
						"BENEFICIARIOS_SEGURO"."NOMBRES",   
						"BENEFICIARIOS_SEGURO"."AP_PATERNO",   
						"BENEFICIARIOS_SEGURO"."AP_MATERNO",   
						"BENEFICIARIOS_SEGURO"."CODIGO_SEGURO_DETALLE",   
						"BENEFICIARIOS_SEGURO"."FECHA_NACIMIENTO",   
						"BENEFICIARIOS_SEGURO"."SEXO",   
						"BENEFICIARIOS_SEGURO"."PORCE_UF_DESIGNA",   
						"BENEFICIARIOS_SEGURO"."CODIGO_PARENTESCO"  
			FROM 		"BENEFICIARIOS_SEGURO",	"TIPO_VIA",	"CIUDAD",	"COMUNA"  
			WHERE  ( "BENEFICIARIOS_SEGURO"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
					 ( "BENEFICIARIOS_SEGURO"."COMUNA_PARTICULAR" = "COMUNA"."CODIGO_COMUNA" ) and  
					 ( "BENEFICIARIOS_SEGURO"."CIUDAD_PARTICULAR" = "CIUDAD"."CODIGO_CIUDAD" ) and  
					 (("BENEFICIARIOS_SEGURO"."BASE" = :ls_base ) AND  
					 ( "BENEFICIARIOS_SEGURO"."SERIE" = :ls_serie ) AND  
				 	 ( "BENEFICIARIOS_SEGURO"."NUMERO" = :ll_numero ) AND  
					 ( "BENEFICIARIOS_SEGURO"."CODIGO_SEGURO" = 5 ) )  
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x1 into :ll_rut_ben, :ls_dv_ben, :ls_nom, :ls_ap_pat, :ls_ap_mat, :ll_cod_seg_det, :ldt_fecha_nac, :ls_sexo, :ldb_porce, :ls_cod_parentesco;
					if ll_rut_ben > 0 then
						if ll_cod_seg_det = 2 then
							ll_corr_benef ++
							ls_nom_benef			= ls_nom +' '+ ls_ap_pat +' '+ ls_ap_mat
							SELECT	"PARENTESCO"."PARENTESCO"  
							INTO 		:ls_descrip  
							FROM 		"PARENTESCO"  
							WHERE  ( "PARENTESCO"."CODIGO" = :ls_cod_parentesco ) AND  
									 ( "PARENTESCO"."COD_PARQUE" = 1 )   
							USING		Trans_1;
							dw_exp_archivo.setitem(ll_new,'nombre_benef'+string(ll_corr_benef),ls_nom_benef)
							dw_exp_archivo.setitem(ll_new,'parentesco_benef'+string(ll_corr_benef),ls_descrip)
							dw_exp_archivo.setitem(ll_new,'porce_capital_benef'+string(ll_corr_benef),ldb_porce)	
						elseif ll_cod_seg_det = 1 then
							ll_corr_adic ++
							ls_nom_adi				= ls_nom +' '+ ls_ap_pat +' '+ ls_ap_mat
							dw_exp_archivo.setitem(ll_new,'nombre_aseg_adicional'+string(ll_corr_adic),ls_nom_adi)
							dw_exp_archivo.setitem(ll_new,'rut_aseg_adicional'+string(ll_corr_adic),ll_rut_ben)
							dw_exp_archivo.setitem(ll_new,'dv_aseg_adicional'+string(ll_corr_adic),ls_dv_ben)
							dw_exp_archivo.setitem(ll_new,'fecha_nac_aseg_adicional'+string(ll_corr_adic),ldt_fecha_nac)
							dw_exp_archivo.setitem(ll_new,'parentesco_aseg_adicional'+string(ll_corr_adic),ls_descrip)
						end if
					end if
					Setnull(ll_rut_ben)
				LOOP
			end if
			close x1;
			dw_exp_archivo.setitem(ll_new,'nro_asegurado_adicional',ll_corr_adic)
			
		end if

	next
	dw_exp_archivo.accepttext()
	if il_tipo_seguro=4 or il_tipo_seguro=3 then 
		dw_paso 			= dw_exp_archivo
	else
		dw_paso 			= tab_seguro.tabpage_2.dw_lista_reliquida
	end if
	dw_paso.accepttext()
	SetPointer(HourGlass!)
	f_DWToExcel( dw_paso )
//	OpenWithParm(w_exportar_seguro, dw_paso)
else
	messagebox(gs_app_name,'No Registra Dato',information!)
end if
end event

type cb_print_rel from commandbutton within tabpage_2
integer x = 658
integer y = 1344
integer width = 247
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if tab_seguro.tabpage_2.dw_lista_reliquida.rowcount()>0 then
	f_Print( tab_seguro.tabpage_2.dw_lista_reliquida )
end if
end event

type cb_fil_rel from commandbutton within tabpage_2
integer x = 302
integer y = 1344
integer width = 247
integer height = 96
integer taborder = 60
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
tab_seguro.tabpage_2.dw_lista_reliquida.SETfilter(NULO)
tab_seguro.tabpage_2.dw_lista_reliquida.filter()
end event

type cb_ord_rel from commandbutton within tabpage_2
integer x = 50
integer y = 1344
integer width = 247
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if tab_seguro.tabpage_2.dw_lista_reliquida.rowcount() > 0 then
	string nulo
	setnull (nulo)
	tab_seguro.tabpage_2.dw_lista_reliquida.SETSORT(NULO)
	tab_seguro.tabpage_2.dw_lista_reliquida.SORT()
end if

end event

type dw_lista_reliquida from datawindow within tabpage_2
integer x = 27
integer y = 48
integer width = 3131
integer height = 1240
integer taborder = 40
string title = "none"
string dataobject = "dw_proceso_seguro_reliquida"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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

type gb_2 from groupbox within tabpage_2
integer x = 27
integer y = 1296
integer width = 1605
integer height = 164
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_3 from userobject within tab_seguro
integer x = 18
integer y = 120
integer width = 3191
integer height = 1488
long backcolor = 67108864
string text = " Menores de 18 Años"
long tabtextcolor = 33554432
string picturename = "Custom024!"
long picturemaskcolor = 536870912
pb_buscar_rut_18 pb_buscar_rut_18
st_4 st_4
em_rut_18 em_rut_18
st_no_men18 st_no_men18
cb_exp_menor18 cb_exp_menor18
cb_print_menor18 cb_print_menor18
cb_fil_men18 cb_fil_men18
cb_ord_men18 cb_ord_men18
dw_lista_menores18 dw_lista_menores18
gb_1 gb_1
end type

on tabpage_3.create
this.pb_buscar_rut_18=create pb_buscar_rut_18
this.st_4=create st_4
this.em_rut_18=create em_rut_18
this.st_no_men18=create st_no_men18
this.cb_exp_menor18=create cb_exp_menor18
this.cb_print_menor18=create cb_print_menor18
this.cb_fil_men18=create cb_fil_men18
this.cb_ord_men18=create cb_ord_men18
this.dw_lista_menores18=create dw_lista_menores18
this.gb_1=create gb_1
this.Control[]={this.pb_buscar_rut_18,&
this.st_4,&
this.em_rut_18,&
this.st_no_men18,&
this.cb_exp_menor18,&
this.cb_print_menor18,&
this.cb_fil_men18,&
this.cb_ord_men18,&
this.dw_lista_menores18,&
this.gb_1}
end on

on tabpage_3.destroy
destroy(this.pb_buscar_rut_18)
destroy(this.st_4)
destroy(this.em_rut_18)
destroy(this.st_no_men18)
destroy(this.cb_exp_menor18)
destroy(this.cb_print_menor18)
destroy(this.cb_fil_men18)
destroy(this.cb_ord_men18)
destroy(this.dw_lista_menores18)
destroy(this.gb_1)
end on

type pb_buscar_rut_18 from picturebutton within tabpage_3
integer x = 2336
integer y = 1352
integer width = 96
integer height = 92
integer taborder = 90
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_rut,ll_fila,ll_tot_reg

ll_rut		= long(em_rut_18.text)
ll_tot_reg	= tab_seguro.tabpage_3.dw_lista_menores18.rowcount()
if ll_rut>0 and ll_tot_reg>0 then
	ll_fila	= tab_seguro.tabpage_3.dw_lista_menores18.Find("rut = "+string(ll_rut), 1, ll_tot_reg)
	if ll_fila>0 then
		tab_seguro.tabpage_3.dw_lista_menores18.scrolltorow(ll_fila)
		tab_seguro.tabpage_3.dw_lista_menores18.setfocus()
	else
		messagebox("Advertencia","No Fue Encontrado Rut "+string(ll_rut,'###,###,###,###,###'))
	end if
end if
end event

type st_4 from statictext within tabpage_3
integer x = 1687
integer y = 1368
integer width = 270
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_rut_18 from editmask within tabpage_3
integer x = 1975
integer y = 1352
integer width = 352
integer height = 96
integer taborder = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if long(this.text)>0 then pb_buscar_rut_18.triggerevent(clicked!)
end event

type st_no_men18 from statictext within tabpage_3
integer x = 27
integer y = 176
integer width = 3131
integer height = 896
integer textsize = -72
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
string text = "No Registra Dato"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_exp_menor18 from commandbutton within tabpage_3
integer x = 1015
integer y = 1344
integer width = 594
integer height = 96
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar Lista"
end type

event clicked;if tab_seguro.tabpage_3.dw_lista_menores18.rowcount()>0 then
	dw_paso = tab_seguro.tabpage_3.dw_lista_menores18
	f_DWToExcel( dw_paso )
//	OpenWithParm(w_exportar_seguro, dw_paso)
end if
end event

type cb_print_menor18 from commandbutton within tabpage_3
integer x = 658
integer y = 1344
integer width = 247
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if tab_seguro.tabpage_3.dw_lista_menores18.rowcount()>0 then
	f_Print( tab_seguro.tabpage_3.dw_lista_menores18 )
end if
end event

type cb_fil_men18 from commandbutton within tabpage_3
integer x = 302
integer y = 1344
integer width = 247
integer height = 96
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
tab_seguro.tabpage_3.dw_lista_menores18.SETfilter(NULO)
tab_seguro.tabpage_3.dw_lista_menores18.filter()
end event

type cb_ord_men18 from commandbutton within tabpage_3
integer x = 50
integer y = 1344
integer width = 247
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if tab_seguro.tabpage_3.dw_lista_menores18.rowcount() > 0 then
	string nulo
	setnull (nulo)
	tab_seguro.tabpage_3.dw_lista_menores18.SETSORT(NULO)
	tab_seguro.tabpage_3.dw_lista_menores18.SORT()
end if
end event

type dw_lista_menores18 from datawindow within tabpage_3
integer x = 27
integer y = 48
integer width = 3131
integer height = 1240
integer taborder = 40
string title = "none"
string dataobject = "dw_proceso_seguro_menor18"
boolean livescroll = true
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

type gb_1 from groupbox within tabpage_3
integer x = 27
integer y = 1296
integer width = 1605
integer height = 164
integer taborder = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_parque from datawindow within w_seguros_desgravamen
integer x = 1339
integer y = 32
integer width = 594
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_lista_codigo_parque_seguro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.accepttext()
tab_seguro.tabpage_1.dw_lista_seguro.reset()
tab_seguro.tabpage_2.dw_lista_reliquida.reset()
tab_seguro.tabpage_3.dw_lista_menores18.reset()
end event

type st_16 from statictext within w_seguros_desgravamen
integer x = 1106
integer y = 40
integer width = 210
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_ini from picture within w_seguros_desgravamen
integer x = 965
integer y = 32
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string 	ls_fecha,fech
Long		ll_mes,ll_anno
datetime	ldt_fecha_cierre,ldt_max_fec_proc

if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text		= string(idt_fecha_hoy,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha 				= em_fec_ini.text
else
	ls_fecha 				= string(idt_fecha_hoy,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha or idt_fecha_hoy<>date(gdt_fec_sistema) THEN
	IF DATE(Message.StringParm)>idt_fecha_hoy THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor al día de Hoy.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		ll_mes				= long(mid(Message.StringParm,4,2))
		ll_anno				= long(mid(Message.StringParm,7,4))
		if ll_mes=1 or ll_mes=3 or ll_mes=5 or ll_mes=7 or ll_mes=8 or ll_mes=10 or ll_mes=12 then
			ls_fecha			= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		elseif ll_mes=2 then
			if ll_anno/4 = int(ll_anno/4) then
				ls_fecha			= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
			else
				ls_fecha			= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
			end if
		elseif ll_mes=4 or ll_mes=6 or ll_mes=9 or ll_mes=11 then
			ls_fecha			= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		end if
		em_fec_ini.text 	= ls_fecha
		tab_seguro.tabpage_1.dw_lista_seguro.reset()
		tab_seguro.tabpage_2.dw_lista_reliquida.reset()
		tab_seguro.tabpage_3.dw_lista_menores18.reset()
		SELECT	MAX("SEGURO_PROCESO"."FECHA_CIERRE")  
		INTO 		:ldt_max_fec_proc  
		FROM 		"SEGURO_PROCESO"  
		WHERE		"SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro;
		if not isnull(ldt_max_fec_proc) then
			ldt_fecha_cierre	= datetime(date(em_fec_ini.text),time('00:00:00'))
			if ldt_fecha_cierre < idt_fec_ult_cierre then
				messagebox("Advertencia","Fecha Seguro Ya Procesada")
				em_fec_ini.text	= string(idt_fec_ult_cierre,'dd/mm/yyyy')
				em_fec_ini.setfocus()
			end if
		end if
	end if	
END IF
end event

type em_fec_ini from editmask within w_seguros_desgravamen
integer x = 603
integer y = 32
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -10
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

event modified;String	ls_fecha
Long		ll_mes,ll_anno
datetime	ldt_fecha_cierre,ldt_max_fec_proc

ll_mes				= long(mid(this.text,4,2))
ll_anno				= long(mid(this.text,7,4))
if ll_mes=1 or ll_mes=3 or ll_mes=5 or ll_mes=7 or ll_mes=8 or ll_mes=10 or ll_mes=12 then
	ls_fecha			= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes=2 then
	if ll_anno/4 = int(ll_anno/4) then
		ls_fecha		= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	else
		ls_fecha		= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	end if
elseif ll_mes=4 or ll_mes=6 or ll_mes=9 or ll_mes=11 then
	ls_fecha			= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
end if
em_fec_ini.text 	= ls_fecha
tab_seguro.tabpage_1.dw_lista_seguro.reset()
tab_seguro.tabpage_2.dw_lista_reliquida.reset()
tab_seguro.tabpage_3.dw_lista_menores18.reset()
SELECT	MAX("SEGURO_PROCESO"."FECHA_CIERRE")  
INTO 		:ldt_max_fec_proc  
FROM 		"SEGURO_PROCESO"  
WHERE		"SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro;
if not isnull(ldt_max_fec_proc) then
	ldt_fecha_cierre	= datetime(date(em_fec_ini.text),time('00:00:00'))
	if ldt_fecha_cierre < idt_fec_ult_cierre then
		messagebox("Advertencia","Fecha Seguro Ya Procesada")
//		em_fec_ini.text	= string(idt_fec_ult_cierre,'dd/mm/yyyy')
//		em_fec_ini.setfocus()
	end if
end if
end event

type st_2 from statictext within w_seguros_desgravamen
integer x = 27
integer y = 40
integer width = 544
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_seguros_desgravamen
integer x = 2907
integer y = 1836
integer width = 347
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_seguros_desgravamen)
end event

type cb_cargar from commandbutton within w_seguros_desgravamen
integer x = 1993
integer y = 36
integer width = 453
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Procesar Seguro"
end type

event clicked;datetime	ldt_fecha_cierre,ldt_max_fec_proc,ldt_prox_cierre,ldt_fec_prox_cierre
Long		ll_cod_parque,ll_mes_ult,ll_anno_ult,ll_resp,ll_count_desg,ll_mes_proc,ll_mes_cierre
String	ls_fecha,ls_pasa
Double	ldb_tasa_seguro

ll_cod_parque					= dw_parque.getitemnumber(1,'cod_parque')
if not isnull(ldt_fecha_cierre) then
	ldt_fecha_cierre			= datetime(date(em_fec_ini.text),time('00:00:00'))
	SELECT	MAX("SEGURO_PROCESO"."FECHA_CIERRE")  
	INTO 		:ldt_max_fec_proc  
	FROM 	"SEGURO_PROCESO"  
	WHERE	"SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque  AND
				"SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro
	USING	sqlca;
	if isnull(ldt_max_fec_proc) then 
		ldt_max_fec_proc		= ldt_fecha_cierre
		idt_fec_ult_cierre		= ldt_fecha_cierre
	end if
	DECLARE sp_prox_cierre_seguro PROCEDURE FOR sp_prox_fecha_proceso( :ldt_max_fec_proc );
	EXECUTE sp_prox_cierre_seguro;
	if sqlca.sqlcode=0 then
		fetch sp_prox_cierre_seguro into :ldt_fec_prox_cierre ;
		close sp_prox_cierre_seguro;
	end if
	ll_mes_proc					= month(date(ldt_fec_prox_cierre))
	ll_mes_cierre				= month(date(ldt_fecha_cierre)) + 1
	if ll_mes_cierre=13 then ll_mes_cierre=1
	if ll_mes_cierre=14 then ll_mes_cierre=2
	if ldt_max_fec_proc > ldt_fecha_cierre and ll_mes_proc = ll_mes_cierre then
		messagebox("Advertencia","Fecha Indicada Inválida, Periodo Correspondiente es "+string(ldt_fec_prox_cierre,'dd/mm/yyyy'))
	else
		ls_pasa					= 'S'
		if il_tipo_seguro=3 then
			SELECT	COUNT("SEGURO_PROCESO"."FECHA_PROCESO")  
			INTO 		:ll_count_desg
			FROM 	"SEGURO_PROCESO"  
			WHERE  	( "SEGURO_PROCESO"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
					 	( "SEGURO_PROCESO"."TIPO_SEGURO" = 4 ) AND
					 	( "SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque )
			USING		sqlca;
			if ll_count_desg=0 or isnull(ll_count_desg) then ls_pasa	= 'N'
		end if
		if ls_pasa='S' then
			if ldt_fecha_cierre >= idt_fec_ult_cierre then
				ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')
				if not isnull(ldt_fecha_cierre) then
					if not isnull(ll_cod_parque) and ll_cod_parque > 0 then
						SetPointer(HourGlass!)
						SELECT "SEGURO_DESGRAVAMEN"."TASA"  INTO :ldb_tasa_seguro FROM "SEGURO_DESGRAVAMEN"  WHERE "SEGURO_DESGRAVAMEN"."COD" = 1 ;
						if il_tipo_seguro=4 then  //Proceso Seguro Desgravamen 
						
							SELECT	MAX("SEGURO_PROCESO"."FECHA_CIERRE")  
							INTO 		:ldt_max_fec_proc  
							FROM 	"SEGURO_PROCESO"  
							WHERE	"SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro AND
										"SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque  ;
							if not isnull(ldt_max_fec_proc) then
								ll_mes_ult	= month(date(ldt_max_fec_proc))
								ll_anno_ult	= year(date(ldt_max_fec_proc))
								ll_mes_ult ++
								if ll_mes_ult>12 then
									ll_anno_ult ++
									ll_mes_ult	= 1
								end if
								if ll_mes_ult=1 or ll_mes_ult=3 or ll_mes_ult=5 or ll_mes_ult=7 or ll_mes_ult=8 or ll_mes_ult=10 or ll_mes_ult=12 then
									ls_fecha			= '31/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
								elseif ll_mes_ult=2 then
									if ll_anno_ult/4 = int(ll_anno_ult/4) then
										ls_fecha		= '29/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
									else
										ls_fecha		= '28/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
									end if
								elseif ll_mes_ult=4 or ll_mes_ult=6 or ll_mes_ult=9 or ll_mes_ult=11 then
									ls_fecha			= '30/'+string(ll_mes_ult,'00')+'/'+string(ll_anno_ult,'0000')
								end if
								ldt_prox_cierre	= datetime(date(ls_fecha))
								if ldt_fecha_cierre = ldt_prox_cierre then
									ll_resp			= messagebox("Advertencia","Recuerde se Actualizará ESTADO y FECHA de Seguro Desgravamen por cada Contrato considerado en este Proceso, desea Continuar",Exclamation!,YesNo!,2)
									if ll_resp=1 then
										UPDATE	"OFERTA_V"  
										SET 		"ULT_FECHA_SEG" = null  
										WHERE 	"OFERTA_V"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
										USING	sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
										
										UPDATE	"PAGARE"  
										SET 		"ULT_FECHA_SEG" = null  
										WHERE 	"PAGARE"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
										
										UPDATE	"ANEXO_LIBERADOR"  
										SET 		"ULT_FECHA_SEG" = null  
										WHERE 	"ANEXO_LIBERADOR"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
										
										UPDATE	"ANEXO_AUMENTO"  
										SET 		"ULT_FECHA_SEG" = null  
										WHERE 	"ANEXO_AUMENTO"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
										
										UPDATE	"OFERTA_V"  
										SET 		"ESTADO_SEGURO" = 'N'  
										WHERE  ( "OFERTA_V"."ESTADO_SEGURO" = ' ' ) OR  
												 ( "OFERTA_V"."ESTADO_SEGURO" is null )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
										
										UPDATE	"PAGARE"  
										SET 		"ESTADO_SEGURO" = 'N'  
										WHERE  ( "PAGARE"."ESTADO_SEGURO" = ' ' ) OR  
												 ( "PAGARE"."ESTADO_SEGURO" is null )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
										
										UPDATE	"ANEXO_LIBERADOR"  
										SET 		"ESTADO_SEGURO" = 'N'  
										WHERE  ( "ANEXO_LIBERADOR"."ESTADO_SEGURO" = ' ' ) OR  
												 ( "ANEXO_LIBERADOR"."ESTADO_SEGURO" is null )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
	
										DECLARE sp_proc_anular_seguro1 PROCEDURE FOR SP_ANULAR_SEGURO( :idt_fecha_hoy, :ldt_fecha_cierre, :ll_cod_parque, :il_tipo_seguro );
										EXECUTE sp_proc_anular_seguro1;
										
										DECLARE sp_proc_seguro_desg1 PROCEDURE FOR SP_PROCESO_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
										EXECUTE sp_proc_seguro_desg1;
										if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
											tab_seguro.tabpage_2.dw_lista_reliquida.reset()
											tab_seguro.tabpage_3.dw_lista_menores18.reset()
											tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
											tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
											tab_seguro.tabpage_2.st_no_rel.visible				= true
											tab_seguro.tabpage_3.st_no_men18.visible			= true
											messagebox("Advertencia","No Registra Dato")
										else
											if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro) > 0 then
												tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
												tab_seguro.tabpage_2.st_no_rel.visible				= false
											else
												tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
												tab_seguro.tabpage_2.st_no_rel.visible				= true
											end if
						
											if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
												tab_seguro.tabpage_3.st_no_men18.visible			= false
												tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
											else
												tab_seguro.tabpage_3.st_no_men18.visible			= true
												tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
											end if
										end if
									end if
								else
									if ldt_max_fec_proc = ldt_fecha_cierre then
										ll_resp		= messagebox("Advertencia","Existe Proceso del "+string(ldt_fecha_cierre,'dd/mm/yyyy')+" desea Eliminar TODO y Volver a PROCESAR",Exclamation!,YesNo!,2)
										if ll_resp=1 then
											UPDATE	"OFERTA_V"  
											SET 		"ULT_FECHA_SEG" = null  
											WHERE 	"OFERTA_V"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
											UPDATE	"ANEXO_LIBERADOR"  
											SET 		"ULT_FECHA_SEG" = null  
											WHERE 	"ANEXO_LIBERADOR"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
											UPDATE	"ANEXO_AUMENTO"  
											SET 		"ULT_FECHA_SEG" = null  
											WHERE 	"ANEXO_AUMENTO"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
											UPDATE	"OFERTA_V"  
											SET 		"ESTADO_SEGURO" = 'N'  
											WHERE  ( "OFERTA_V"."ESTADO_SEGURO" = ' ' ) OR  
													 ( "OFERTA_V"."ESTADO_SEGURO" is null )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
											UPDATE	"ANEXO_LIBERADOR"  
											SET 		"ESTADO_SEGURO" = 'N'  
											WHERE  ( "ANEXO_LIBERADOR"."ESTADO_SEGURO" = ' ' ) OR  
													 ( "ANEXO_LIBERADOR"."ESTADO_SEGURO" is null )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
											UPDATE	"ANEXO_AUMENTO"  
											SET 		"ESTADO_SEGURO" = 'N'  
											WHERE  ( "ANEXO_AUMENTO"."ESTADO_SEGURO" = ' ' ) OR  
													 ( "ANEXO_AUMENTO"."ESTADO_SEGURO" is null )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
											UPDATE	"PAGARE"  
											SET 		"ULT_FECHA_SEG" = null  
											WHERE 	"PAGARE"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if

											UPDATE	"PAGARE"  
											SET 		"ESTADO_SEGURO" = 'N'  
											WHERE  ( "PAGARE"."ESTADO_SEGURO" = ' ' ) OR  
													 ( "PAGARE"."ESTADO_SEGURO" is null )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
											
											DELETE FROM   "SEGURO_PROCESO"  
											WHERE 		( "SEGURO_PROCESO"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
															( "SEGURO_PROCESO"."COD_PARQUE" = :ll_cod_parque )  AND
															( "SEGURO_PROCESO"."TIPO_SEGURO" = :il_tipo_seguro )
											USING			sqlca;
											if sqlca.sqlcode=0 then
												commit;
												DELETE FROM	"SEGURO_DESG_DEF"  
												WHERE 	 ( "SEGURO_DESG_DEF"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
															 ( "SEGURO_DESG_DEF"."COD_PARQUE" = :ll_cod_parque )   
												USING			sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
												DELETE FROM "SEGURO_DESG_DEF_LIQ"  
												WHERE 	 ( "SEGURO_DESG_DEF_LIQ"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
															 ( "SEGURO_DESG_DEF_LIQ"."COD_PARQUE" = :ll_cod_parque ) AND
															 ( "SEGURO_DESG_DEF_LIQ"."TIPO_SEGURO" = :il_tipo_seguro )
												USING			sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
												end if
	
												DECLARE sp_proc_anular_seguro2 PROCEDURE FOR SP_ANULAR_SEGURO( :idt_fecha_hoy, :ldt_fecha_cierre, :ll_cod_parque, :il_tipo_seguro );
												EXECUTE sp_proc_anular_seguro2;
												
												DECLARE sp_proc_seguro_desg2 PROCEDURE FOR SP_PROCESO_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
												EXECUTE sp_proc_seguro_desg2;
												if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
													tab_seguro.tabpage_2.dw_lista_reliquida.reset()
													tab_seguro.tabpage_3.dw_lista_menores18.reset()
													tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
													tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
													tab_seguro.tabpage_2.st_no_rel.visible				= true
													tab_seguro.tabpage_3.st_no_men18.visible			= true
													messagebox("Advertencia","No Registra Dato")
												else
													if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque, il_tipo_seguro)>0 then
														tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
														tab_seguro.tabpage_2.st_no_rel.visible				= false
													else
														tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
														tab_seguro.tabpage_2.st_no_rel.visible				= true
													end if
								
													if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
														tab_seguro.tabpage_3.st_no_men18.visible			= false
														tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
													else
														tab_seguro.tabpage_3.st_no_men18.visible			= true
														tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
													end if
												end if
											else
												rollback;
											end if
										else
											if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)>0 then
												tab_seguro.tabpage_2.dw_lista_reliquida.reset()
												tab_seguro.tabpage_3.dw_lista_menores18.reset()
												if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
													tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
													tab_seguro.tabpage_2.st_no_rel.visible				= false
												else
													tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
													tab_seguro.tabpage_2.st_no_rel.visible				= true
												end if
												if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
													tab_seguro.tabpage_3.st_no_men18.visible			= false
													tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
												else
													tab_seguro.tabpage_3.st_no_men18.visible			= true
													tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
												end if
											end if
										end if
					
									elseif ldt_max_fec_proc < ldt_fecha_cierre then
										messagebox("Advertencia","No es Posible Procesar, Fecha Indicada es Menor al Ultimo Cierre ("+string(ldt_fecha_cierre,'dd/mm/yyyy')+")")
									elseif ldt_max_fec_proc > ldt_fecha_cierre then
										messagebox("Advertencia","No es Posible Procesar, Fecha Indicada es Mayor al Ultimo Cierre ("+string(ldt_fecha_cierre,'dd/mm/yyyy')+")")
									end if
								end if
							else
								ll_resp			= messagebox("Advertencia","Recuerde se Actualizará ESTADO y FECHA de Seguro Desgravamen por cada Contrato considerado en este Proceso, desea Continuar",Exclamation!,YesNo!,2)
								if ll_resp=1 then
									UPDATE	"OFERTA_V"  
									SET 		"ULT_FECHA_SEG" = null  
									WHERE 	"OFERTA_V"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									
									UPDATE	"ANEXO_LIBERADOR"  
									SET 		"ULT_FECHA_SEG" = null  
									WHERE 	"ANEXO_LIBERADOR"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									
									UPDATE	"ANEXO_AUMENTO"  
									SET 		"ULT_FECHA_SEG" = null  
									WHERE 	"ANEXO_AUMENTO"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									
									UPDATE	"OFERTA_V"  
									SET 		"ESTADO_SEGURO" = 'N'  
									WHERE  ( "OFERTA_V"."ESTADO_SEGURO" = ' ' ) OR  
											 ( "OFERTA_V"."ESTADO_SEGURO" is null )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									
									UPDATE	"ANEXO_LIBERADOR"  
									SET 		"ESTADO_SEGURO" = 'N'  
									WHERE  ( "ANEXO_LIBERADOR"."ESTADO_SEGURO" = ' ' ) OR  
											 ( "ANEXO_LIBERADOR"."ESTADO_SEGURO" is null )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									
									UPDATE	"ANEXO_AUMENTO"  
									SET 		"ESTADO_SEGURO" = 'N'  
									WHERE  ( "ANEXO_AUMENTO"."ESTADO_SEGURO" = ' ' ) OR  
											 ( "ANEXO_AUMENTO"."ESTADO_SEGURO" is null )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									
									UPDATE	"PAGARE"  
									SET 		"ULT_FECHA_SEG" = null  
									WHERE 	"PAGARE"."ULT_FECHA_SEG" = TO_DATE('01-01-1900 00:00:00','DD-MM-YYYY HH24:MI:SS')   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if

									UPDATE	"PAGARE"  
									SET 		"ESTADO_SEGURO" = 'N'  
									WHERE  ( "PAGARE"."ESTADO_SEGURO" = ' ' ) OR  
											 ( "PAGARE"."ESTADO_SEGURO" is null )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
											
									DECLARE sp_proc_anular_seguro3 PROCEDURE FOR SP_ANULAR_SEGURO( :idt_fecha_hoy, :ldt_fecha_cierre, :ll_cod_parque, :il_tipo_seguro );
									EXECUTE sp_proc_anular_seguro3;
			
									DECLARE sp_proc_seguro_desg3 PROCEDURE FOR SP_PROCESO_SEGURO( :gs_user, :ldt_fecha_cierre, :idt_fecha_hoy, :ll_cod_parque, :il_tipo_seguro, :ldb_tasa_seguro);
									EXECUTE sp_proc_seguro_desg3;
									if tab_seguro.tabpage_1.dw_lista_seguro.retrieve(ldt_fecha_cierre, ll_cod_parque)=0 then
										tab_seguro.tabpage_2.dw_lista_reliquida.reset()
										tab_seguro.tabpage_3.dw_lista_menores18.reset()
										tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
										tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
										tab_seguro.tabpage_2.st_no_rel.visible				= true
										tab_seguro.tabpage_3.st_no_men18.visible			= true
										messagebox("Advertencia","No Registra Dato")
									else
										if tab_seguro.tabpage_2.dw_lista_reliquida.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
											tab_seguro.tabpage_2.dw_lista_reliquida.visible	= true
											tab_seguro.tabpage_2.st_no_rel.visible				= false
										else
											tab_seguro.tabpage_2.dw_lista_reliquida.visible	= false
											tab_seguro.tabpage_2.st_no_rel.visible				= true
										end if
						
										if tab_seguro.tabpage_3.dw_lista_menores18.retrieve(ldt_fecha_cierre, ll_cod_parque,il_tipo_seguro)>0 then
											tab_seguro.tabpage_3.st_no_men18.visible			= false
											tab_seguro.tabpage_3.dw_lista_menores18.visible	= true
										else
											tab_seguro.tabpage_3.st_no_men18.visible			= true
											tab_seguro.tabpage_3.dw_lista_menores18.visible	= false
										end if
									end if
								end if
							end if
							
						elseif il_tipo_seguro = 3 then //Segundo Asegurado
							wf_proceso_segundo_asegurado()
				
						elseif il_tipo_seguro = 2 then //Seguro Accidente
							wf_proceso_accidente()
							
						elseif il_tipo_seguro = 1 then //Seguro Renta y Deceso
							wf_proceso_renta_deceso()
						
						elseif il_tipo_seguro = 5 then //Seguro Renta y Deceso
							wf_proceso_fallecimiento()
				
						end if
						SetPointer(Arrow!)
					else
						Messagebox("Advertencia","Debe Seleccionar Parque")
						dw_parque.setfocus()
					end if
				else
					Messagebox("Advertencia","Fecha Inválida, recuerde No debe ser Mayor a la Fecha de Hoy")
					em_fec_ini.setfocus()
				end if
			else
				messagebox("Advertencia","Fecha Proceso Cierre Inválida")
				em_fec_ini.setfocus()
			end if
		else
			messagebox("Advertencia","Para Procesar 2º Asegurado, PRIMERO debe Procesar Seguro Desgravamen")
		end if
	end if
else
	Messagebox("Advertencia","Debe Seleccionar Parque")
	dw_parque.setfocus()
end if
end event

