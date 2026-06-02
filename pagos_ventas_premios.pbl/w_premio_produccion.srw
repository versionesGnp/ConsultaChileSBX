forward
global type w_premio_produccion from window
end type
type cb_comprob_anticipo from commandbutton within w_premio_produccion
end type
type cb_politica from commandbutton within w_premio_produccion
end type
type cb_detalle from commandbutton within w_premio_produccion
end type
type cb_clasif_hist from commandbutton within w_premio_produccion
end type
type cb_grabar from commandbutton within w_premio_produccion
end type
type cb_limpiar from commandbutton within w_premio_produccion
end type
type pb_aceptar from picturebutton within w_premio_produccion
end type
type cb_cerrar from commandbutton within w_premio_produccion
end type
type cb_imprimir from commandbutton within w_premio_produccion
end type
type dw_lista from datawindow within w_premio_produccion
end type
type dw_seleccion from datawindow within w_premio_produccion
end type
type dw_fecha_cierre from datawindow within w_premio_produccion
end type
type gb_1 from groupbox within w_premio_produccion
end type
end forward

global type w_premio_produccion from window
integer width = 3355
integer height = 1904
boolean titlebar = true
string title = "Calidad Cartera Supervisores"
boolean controlmenu = true
long backcolor = 67108864
cb_comprob_anticipo cb_comprob_anticipo
cb_politica cb_politica
cb_detalle cb_detalle
cb_clasif_hist cb_clasif_hist
cb_grabar cb_grabar
cb_limpiar cb_limpiar
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
dw_lista dw_lista
dw_seleccion dw_seleccion
dw_fecha_cierre dw_fecha_cierre
gb_1 gb_1
end type
global w_premio_produccion w_premio_produccion

type variables
long il_row,idb_porc_ing
end variables

forward prototypes
public function long wf_rango (long al_mes, long al_cod_parque, double adb_producc)
public function double wf_producc (string as_cod_sup, datetime adt_fec_cierre, double adb_porc_ing, string as_tipo)
public function double wf_premio_uf (string as_clasif, double adb_porc_premio, long al_rango, long al_cod_parque)
public function double wf_prod_minima (long al_mes, long al_cod_parque)
end prototypes

public function long wf_rango (long al_mes, long al_cod_parque, double adb_producc);long	ll_rango,ll_mes_fin

//wf_rango(al_mes,al_cod_parque,adb_producc)
SELECT	"PREMIOS_MENSUALES_NF"."MES_FIN"  
INTO 		:ll_mes_fin  
FROM		"PREMIOS_MENSUALES_NF"  
WHERE  	( "PREMIOS_MENSUALES_NF"."MES_FIN" = :al_mes ) AND  
			( :adb_producc >= "PREMIOS_MENSUALES_NF"."RANGO_1" ) AND  
			( :adb_producc < "PREMIOS_MENSUALES_NF"."RANGO_2" )  AND
			( "PREMIOS_MENSUALES_NF"."PARQUE" = :al_cod_parque )
USING		sqlca;
if ll_mes_fin>0 then
	ll_rango							= 1
else
	SELECT	"PREMIOS_MENSUALES_NF"."MES_FIN"  
	INTO 		:ll_mes_fin  
	FROM 	"PREMIOS_MENSUALES_NF"  
	WHERE  	( "PREMIOS_MENSUALES_NF"."MES_FIN" = :al_mes ) AND  
				( :adb_producc >= "PREMIOS_MENSUALES_NF"."RANGO_3" ) AND  
				( :adb_producc < "PREMIOS_MENSUALES_NF"."RANGO_4" )  AND
				( "PREMIOS_MENSUALES_NF"."PARQUE" = :al_cod_parque )
	USING		sqlca;
	if ll_mes_fin>0 then
		ll_rango						= 2
	else
		SELECT	"PREMIOS_MENSUALES_NF"."MES_FIN"  
		INTO 		:ll_mes_fin  
		FROM		"PREMIOS_MENSUALES_NF"  
		WHERE	( "PREMIOS_MENSUALES_NF"."MES_FIN" = :al_mes ) AND  
					( :adb_producc >= "PREMIOS_MENSUALES_NF"."RANGO_5" ) AND  
					( :adb_producc < "PREMIOS_MENSUALES_NF"."RANGO_6" )  AND
					( "PREMIOS_MENSUALES_NF"."PARQUE" = :al_cod_parque )
		USING	sqlca;
		if ll_mes_fin>0 then
			ll_rango					= 3
		else
			SELECT	"PREMIOS_MENSUALES_NF"."MES_FIN"  
			INTO 		:ll_mes_fin  
			FROM 	"PREMIOS_MENSUALES_NF"  
			WHERE	( "PREMIOS_MENSUALES_NF"."MES_FIN" = :al_mes ) AND  
						( :adb_producc >= "PREMIOS_MENSUALES_NF"."RANGO_7" ) AND  
						( :adb_producc < "PREMIOS_MENSUALES_NF"."RANGO_8" )  AND
						( "PREMIOS_MENSUALES_NF"."PARQUE" = :al_cod_parque )
			USING		sqlca;
			if ll_mes_fin>0 then
				ll_rango				= 4
			else
				SELECT	"PREMIOS_MENSUALES_NF"."MES_FIN"  
				INTO 		:ll_mes_fin  
				FROM 	"PREMIOS_MENSUALES_NF"  
				WHERE	( "PREMIOS_MENSUALES_NF"."MES_FIN" = :al_mes ) AND  
							( :adb_producc >= "PREMIOS_MENSUALES_NF"."RANGO_9" ) AND  
							( :adb_producc < "PREMIOS_MENSUALES_NF"."RANGO_10" )  AND
							( "PREMIOS_MENSUALES_NF"."PARQUE" = :al_cod_parque )
				USING	sqlca;
				if ll_mes_fin>0 then
					ll_rango			= 5
				else
					SELECT	"PREMIOS_MENSUALES_NF"."MES_FIN"  
					INTO 		:ll_mes_fin  
					FROM 	"PREMIOS_MENSUALES_NF"  
					WHERE	( "PREMIOS_MENSUALES_NF"."MES_FIN" = :al_mes ) AND  
								( :adb_producc >= "PREMIOS_MENSUALES_NF"."RANGO_11" ) AND
								( "PREMIOS_MENSUALES_NF"."PARQUE" = :al_cod_parque )
					USING	sqlca;
					if ll_mes_fin>0 then
						ll_rango		= 6
					else
						ll_rango		= 0
					end if
				end if
			end if
		end if
	end if
end if
if isnull(ll_rango) or ll_rango=0 then ll_rango=0
Return ll_rango
end function

public function double wf_producc (string as_cod_sup, datetime adt_fec_cierre, double adb_porc_ing, string as_tipo);double	ldb_producc

//wf_producc_m(as_cod_sup,adt_fec_cierre,adb_porc_ing,as_tipo)

if as_tipo='S' then
	SELECT	SUM("PRECIO_UF")
	INTO		:ldb_producc
	FROM		"VISTA_PRODUCC_MENSUAL"  
	WHERE	"VISTA_PRODUCC_MENSUAL"."COD_SUP" = :as_cod_sup AND
				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" = :adt_fec_cierre AND
				("VISTA_PRODUCC_MENSUAL"."BASE" = 'O' OR "VISTA_PRODUCC_MENSUAL"."BASE" = 'A') AND
				"VISTA_PRODUCC_MENSUAL"."PORCE_ING_CIERRE" >= :adb_porc_ing
	USING	sqlca;
elseif as_tipo='N' then
	SELECT	SUM("PRECIO_UF")
	INTO		:ldb_producc
	FROM		"VISTA_PRODUCC_MENSUAL"  
	WHERE	"VISTA_PRODUCC_MENSUAL"."COD_SUP" = :as_cod_sup AND
				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" = :adt_fec_cierre AND
				("VISTA_PRODUCC_MENSUAL"."BASE" = 'O' OR "VISTA_PRODUCC_MENSUAL"."BASE" = 'A')
	USING	sqlca;
end if
if isnull(ldb_producc) or ldb_producc=0 then ldb_producc=0
return ldb_producc
end function

public function double wf_premio_uf (string as_clasif, double adb_porc_premio, long al_rango, long al_cod_parque);double	ldb_prem_uf

//wf_premio_uf(as_clasif,adb_porc_premio,al_rango,al_cod_parque)
if as_clasif='A' then
	SELECT	"PREMIOS_MENSUALES_NF_PORCE"."CLAS_A"  
	INTO 		:ldb_prem_uf  
	FROM 	"PREMIOS_MENSUALES_NF_PORCE"  
	WHERE	"PREMIOS_MENSUALES_NF_PORCE"."COD_PARQUE" = :al_cod_parque AND  
			 	:adb_porc_premio >= "PREMIOS_MENSUALES_NF_PORCE"."MIN_PORCE" AND  
			 	:adb_porc_premio < "PREMIOS_MENSUALES_NF_PORCE"."MAX_PORCE" AND  
			 	"PREMIOS_MENSUALES_NF_PORCE"."RANGO" = :al_rango
	USING		sqlca;
elseif as_clasif='B' then
	SELECT	"PREMIOS_MENSUALES_NF_PORCE"."CLAS_B"  
	INTO 		:ldb_prem_uf  
	FROM		"PREMIOS_MENSUALES_NF_PORCE"  
	WHERE	"PREMIOS_MENSUALES_NF_PORCE"."COD_PARQUE" = :al_cod_parque AND  
			 	:adb_porc_premio >= "PREMIOS_MENSUALES_NF_PORCE"."MIN_PORCE" AND  
			 	:adb_porc_premio < "PREMIOS_MENSUALES_NF_PORCE"."MAX_PORCE" AND  
			 	"PREMIOS_MENSUALES_NF_PORCE"."RANGO" = :al_rango
	USING		sqlca;
elseif as_clasif='C' then
	SELECT	"PREMIOS_MENSUALES_NF_PORCE"."CLAS_C"  
	INTO 		:ldb_prem_uf  
	FROM		"PREMIOS_MENSUALES_NF_PORCE"  
	WHERE	"PREMIOS_MENSUALES_NF_PORCE"."COD_PARQUE" = :al_cod_parque AND  
			 	:adb_porc_premio >= "PREMIOS_MENSUALES_NF_PORCE"."MIN_PORCE" AND  
			 	:adb_porc_premio < "PREMIOS_MENSUALES_NF_PORCE"."MAX_PORCE" AND  
			 	"PREMIOS_MENSUALES_NF_PORCE"."RANGO" = :al_rango
	USING		sqlca;
elseif as_clasif='D' then
	SELECT	"PREMIOS_MENSUALES_NF_PORCE"."CLAS_D"  
	INTO 		:ldb_prem_uf  
	FROM 	"PREMIOS_MENSUALES_NF_PORCE"  
	WHERE  	"PREMIOS_MENSUALES_NF_PORCE"."COD_PARQUE" = :al_cod_parque AND  
			 	:adb_porc_premio >= "PREMIOS_MENSUALES_NF_PORCE"."MIN_PORCE" AND  
			 	:adb_porc_premio < "PREMIOS_MENSUALES_NF_PORCE"."MAX_PORCE" AND  
			 	"PREMIOS_MENSUALES_NF_PORCE"."RANGO" = :al_rango
	USING	sqlca;
end if
if isnull(ldb_prem_uf) or ldb_prem_uf=0 then ldb_prem_uf = 0
Return ldb_prem_uf
end function

public function double wf_prod_minima (long al_mes, long al_cod_parque);double	ldb_producc

//wf_prod_minima(al_mes,al_cod_parque)
SELECT	"PREMIOS_MENSUALES_NF"."RANGO_1"  
INTO 		:ldb_producc 
FROM		"PREMIOS_MENSUALES_NF"  
WHERE  	( "PREMIOS_MENSUALES_NF"."MES_FIN" = :al_mes ) AND  
			( "PREMIOS_MENSUALES_NF"."PARQUE" = :al_cod_parque )
USING	sqlca;
if isnull(ldb_producc) then ldb_producc=0
return ldb_producc

end function

on w_premio_produccion.create
this.cb_comprob_anticipo=create cb_comprob_anticipo
this.cb_politica=create cb_politica
this.cb_detalle=create cb_detalle
this.cb_clasif_hist=create cb_clasif_hist
this.cb_grabar=create cb_grabar
this.cb_limpiar=create cb_limpiar
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.dw_seleccion=create dw_seleccion
this.dw_fecha_cierre=create dw_fecha_cierre
this.gb_1=create gb_1
this.Control[]={this.cb_comprob_anticipo,&
this.cb_politica,&
this.cb_detalle,&
this.cb_clasif_hist,&
this.cb_grabar,&
this.cb_limpiar,&
this.pb_aceptar,&
this.cb_cerrar,&
this.cb_imprimir,&
this.dw_lista,&
this.dw_seleccion,&
this.dw_fecha_cierre,&
this.gb_1}
end on

on w_premio_produccion.destroy
destroy(this.cb_comprob_anticipo)
destroy(this.cb_politica)
destroy(this.cb_detalle)
destroy(this.cb_clasif_hist)
destroy(this.cb_grabar)
destroy(this.cb_limpiar)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.dw_seleccion)
destroy(this.dw_fecha_cierre)
destroy(this.gb_1)
end on

event open;string		ls_nulo,ls_jefe
long		ll_parque,ll_tot_reg

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;

gf_centrar(w_premio_produccion)
dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/10/2010'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)

if gl_proceso>=4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque											= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque											= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque											= 801
	end if
	dw_seleccion.width								= 709
	pb_aceptar.x										= 905
	dw_seleccion.settransobject(sqlca)
	dw_seleccion.getchild('jefe',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ll_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_seleccion.getchild('supervisor',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ll_parque,'')=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	dw_lista.reset()
	dw_seleccion.accepttext()
	
elseif gl_proceso=3 then
	dw_seleccion.width								= 2203
	pb_aceptar.x										= 2405
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect		= 1
		dw_seleccion.object.jefe.protect			= 1
		dw_seleccion.object.supervisor.protect	= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,gs_user)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',gs_user)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		end if
	dw_lista.reset()
	dw_seleccion.accepttext()

elseif gl_proceso=2 then
	dw_seleccion.width								= 2203
	pb_aceptar.x										= 2405
	SELECT	"SUPERVISOR"."COD_PARQUE",   
        	 	"SUPERVISOR"."COD_JEFE"  
   INTO		:ll_parque,   
         	:ls_jefe  
   FROM 		"SUPERVISOR"  
   WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect		= 1
		dw_seleccion.object.jefe.protect			= 1
		dw_seleccion.object.supervisor.protect	= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',ls_jefe)
		dw_seleccion.setitem(1,'supervisor',gs_user)
	end if
	dw_lista.reset()
	dw_seleccion.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_premios_calidad_cartera_sup)
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_comprob_anticipo from commandbutton within w_premio_produccion
integer x = 1755
integer y = 1640
integer width = 389
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Compr. Premio "
end type

event clicked;string	ls_string
long		ll_cod_parque
datetime	ldt_fecha_cierre

dw_seleccion.accepttext()
dw_fecha_cierre.accepttext()
ldt_fecha_cierre			= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ll_cod_parque				= dw_seleccion.getitemnumber(1,'parque')
if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ldt_fecha_cierre) then
	ls_string					= string(ldt_fecha_cierre,'dd/mm/yyyy')+'~t'+string(ll_cod_parque)
	if isvalid(w_comprobante_anticipo) then close(w_comprobante_anticipo)
		OpenWithParm (w_comprobante_anticipo,ls_string)
	else
		if isnull(ldt_fecha_cierre) then
			messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
			dw_fecha_cierre.setfocus()
			dw_fecha_cierre.setcolumn('cierre_ventas')
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia", "Debe Ingresar Parque")
			dw_seleccion.setfocus()
			dw_seleccion.setcolumn('parque')
		end if
end if
end event

type cb_politica from commandbutton within w_premio_produccion
integer x = 1330
integer y = 1640
integer width = 425
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Politica Premios"
end type

event clicked;string	ls_cod_contab,ls_cargo,ls_decrip_premio,ls_string
long		ll_tipo_prem,ll_premio_a,ll_premio_b,ll_cod_parque

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ls_cod_contab		= dw_lista.getitemstring(il_row,'cod_contab')
	ls_cargo				= dw_lista.getitemstring(il_row,'cargo')
	ll_cod_parque		= dw_lista.getitemnumber(il_row,'parque')
	
	SELECT	"COD_PREMIO",	"DESCRIPCION",			"PREMIO1",		"PREMIO2"
	INTO		:ll_tipo_prem,	:ls_decrip_premio,	:ll_premio_a,	:ll_premio_b
	FROM		"PREMIO_TIPO"  
	WHERE 	"PREMIO_TIPO"."COD_CONTAB" = :ls_cod_contab AND  
				"PREMIO_TIPO"."CARGO" = :ls_cargo AND
				"PREMIO_TIPO"."PARQUE" = :ll_cod_parque
	USING		sqlca;
	if not isnull(ll_tipo_prem) and ll_tipo_prem>0 then
		ls_string				= string(ll_tipo_prem)+'~t'+ls_cod_contab+'~t'+ls_cargo+'~t'+string(ll_cod_parque)
		if isvalid(w_politica_premios) then close(w_politica_premios)
			OpenWithParm (w_politica_premios,ls_string)
		end if
end if
end event

type cb_detalle from commandbutton within w_premio_produccion
integer x = 905
integer y = 1640
integer width = 425
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Agentes"
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha_cierre,ldt_fecha_ini

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ldt_fecha_ini				= dw_lista.getitemdatetime(il_row,'fecha_ini')
	ldt_fecha_cierre			= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
	ls_codigo					= dw_lista.getitemstring(il_row,'cod_sup')
	if not isnull(ls_codigo) and ls_codigo<>''  then
		ls_string					= ls_codigo+'~t'+string(ldt_fecha_ini,'dd/mm/yyyy')+'~t'+string(ldt_fecha_cierre,'dd/mm/yyyy')
		if isvalid(w_detalle_calidad_cart_sup) then close(w_detalle_calidad_cart_sup)
		OpenWithParm (w_detalle_calidad_cart_sup,ls_string)
	end if
end if
end event

type cb_clasif_hist from commandbutton within w_premio_produccion
integer x = 448
integer y = 1640
integer width = 457
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasificación Hist."
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha

dw_fecha_cierre.accepttext()
dw_lista.accepttext()

if dw_lista.rowcount() > 0 then
	if dw_lista.dataobject			='dwe_premios_calidad_cartera_sup' and dw_lista.rowcount() > 0 then
		ls_codigo						= dw_lista.getitemstring(il_row,'cod_sup')
		ldt_fecha						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
	end if
	if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fecha) then
		ls_string						= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')
		if isvalid(w_clasifica_historica) then close(w_clasifica_historica)
		OpenWithParm (w_clasifica_historica,ls_string)
	end if
end if
end event

type cb_grabar from commandbutton within w_premio_produccion
integer x = 32
integer y = 1640
integer width = 274
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_cod_contab,ls_haber,ls_estado_agte,ls_estado_premio,ls_codigo,ls_serie,ls_moneda,ls_tipo_empleado,ls_cod_jefe,ls_cargo,ls_graba='S'
long		ll_cod_parque,ll_tipo_premio,ll_mes,ll_res,ll_tot_reg,ll_indi,ll_rut,ll_tot_pagado,ll_premio,ll_malos,ll_cont,ll_exis,ll_premio_jef
datetime	ldt_fec_cierre,ldt_fecha_proceso,ldt_fecha_consul,ldt_fecha_cierre_ini,ldt_fec_ing
double	ldb_numero,ldb_valor_uf,ldb_porcentaje,ldb_porce_vta,ldb_precio,ldb_producc

dw_seleccion.AcceptText()
dw_fecha_cierre.AcceptText()
ll_cod_parque												= dw_seleccion.getitemnumber(1,'parque')
ldt_fec_cierre											= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ls_cod_contab												= '080'
ll_tipo_premio												= 1
ldt_fecha_proceso											= gdt_fec_sistema
ll_mes														= month(date(ldt_fec_cierre))
ls_haber      												= 'H'
ls_estado_agte												= 'A'
ls_estado_premio											= 'P'
ls_tipo_empleado											= 'S'

SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
INTO 		:ldt_fecha_cierre_ini  
FROM 	"CIERRE_VENTA"  
WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fec_cierre
USING	sqlca;

if ldt_fec_cierre > ldt_fecha_proceso then
	messagebox("Grabar","No Puede Ejecutar el Proceso de Premio con Fecha :"+string(ldt_fecha_proceso,"dd/mm/yyyy"))
else
	SELECT	"VALOR_UF"  
	INTO		:ldb_valor_uf  
	FROM		"TAB_UF"  
	WHERE	 "TAB_UF"."FECHA_UF" = :ldt_fec_cierre
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldb_valor_uf) or ldb_valor_uf > 0 then
			SELECT DISTINCT	"FECHA_TERMINO"
			INTO		:ldt_fecha_consul
			FROM		"CIERRE_PAGOS_VENTAS"
			WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
						"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fec_cierre AND
						"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
						"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				if not isnull(ldt_fecha_consul) then
					messagebox("Advertencia","Proceso Premio Producción Supervisor N.F. Fue Grabado con Fecha :"+string(ldt_fec_cierre,"dd/mm/yyyy"))
				end if
			else
				ll_res									= MessageBox("Grabar","¿Desea Grabar Premio Calidad Cartera Supervisor N.F.?", Exclamation!, YesNo!, 2)
				if ll_res = 1 then
					ll_tot_reg						= dw_lista.rowcount()											
					for ll_indi = 1 to ll_tot_reg
						ls_codigo						= dw_lista.getitemstring(ll_indi,'cod_sup')
						ll_rut							= dw_lista.getitemnumber(ll_indi,'rut')
						ll_tot_pagado				= 0
						ls_cod_contab				= dw_lista.getitemstring(ll_indi,'cod_contab')
						ldb_numero					= 0
						ls_serie						= ' '
						ldb_porcentaje				= 0
						ldb_porce_vta				= 0
						ldb_precio					= 0
						ll_premio						= dw_lista.getitemnumber(ll_indi,'premio')
						ls_moneda					= ''
						ldb_producc					=  dw_lista.getitemnumber(ll_indi,'prod_total') 
						ldt_fec_ing					=  dw_lista.getitemdatetime(ll_indi,'fec_ing') 
						ls_cargo						= dw_lista.getitemstring(ll_indi,'cargo')
						if ls_cargo='A' then
							SELECT 	"PAGOS_VENTA"  
							INTO 		:ls_graba  
							FROM 	"AGENTES"  
							WHERE	( "AGENTES"."COD_AGE" = :ls_codigo ) AND  
										( "AGENTES"."CARGO" = :ls_cargo )
							USING	sqlca;
						elseif ls_cargo='S' then
							SELECT 	"PAGOS_VENTA"  
							INTO 		:ls_graba  
							FROM 	"SUPERVISOR"  
							WHERE	( "SUPERVISOR"."COD_SUP" = :ls_codigo ) AND  
										( "SUPERVISOR"."CARGO" = :ls_cargo )
							USING	sqlca;
						elseif ls_cargo='J' then
							SELECT 	"PAGOS_VENTA"  
							INTO 		:ls_graba  
							FROM 	"JEFE_VENTAS"  
							WHERE	( "JEFE_VENTAS"."JEFE_VENTAS" = :ls_codigo ) AND  
										( "JEFE_VENTAS"."CARGO" = :ls_cargo )
							USING	sqlca;	
						end if
						
						if ls_cargo='J' then
							SELECT	"TOTAL_PAGO"  
							INTO		:ll_premio_jef
							FROM		"RES_COMI"  
							WHERE	"RES_COMI"."COD_AGE_SUP" =:ls_codigo AND  
										"RES_COMI"."COD_CONTABLE" = :ls_cod_contab AND  
										"RES_COMI"."FECHA" = :ldt_fec_cierre
							USING	sqlca;
							if isnull(ll_premio_jef) then ll_premio_jef=0
							if ll_premio_jef=0 then
								ls_graba								= 'S'
							else
								ls_graba								= 'N'
								ll_premio			= ll_premio + ll_premio_jef
								UPDATE	"RES_COMI"  
     							SET 		"TOTAL_PAGO" = :ll_premio  
   								WHERE	"RES_COMI"."COD_AGE_SUP" =:ls_codigo AND  
											"RES_COMI"."COD_CONTABLE" = :ls_cod_contab AND  
											"RES_COMI"."FECHA" = :ldt_fec_cierre
								USING	sqlca;
								if sqlca.sqlcode = 0 then
									commit using sqlca;
								else
									rollback using sqlca;
								end if
							end if
						end if
						
						
						

						
						if ls_graba='S' then
							if f_graba_res_comi(ls_codigo,ll_rut,ll_tot_pagado,ls_cod_contab,string(ll_mes),ldt_fec_cierre,ldb_numero,ls_serie,ldb_porcentaje,ldb_porce_vta,ldb_precio,ll_premio,ldb_valor_uf,ls_haber,ls_moneda,ls_estado_premio,ls_estado_agte,'O',ll_cod_parque,0,0)= -1 then
								ll_malos++
							else
								ll_cont++
								SELECT	"SUPERVISOR"."COD_JEFE"
								INTO 		:ls_cod_jefe  
								FROM		"SUPERVISOR"  
								WHERE	"SUPERVISOR"."COD_SUP" = :ls_codigo
								USING	sqlca;
								SELECT	count("META_SUPER"."COD_SUP")
								INTO 		:ll_exis
								FROM		"META_SUPER"
								WHERE	"META_SUPER"."COD_SUP" = :ls_codigo
								USING	sqlca;
								if isnull(ll_exis) then ll_exis=0
								if ll_exis>0 then
									UPDATE "META_SUPER"  
									SET 		"TIPO_CANAL" = 'VD',   
												"ABONO" = :ldb_producc,   
												"TOTAL_UNIDAD" = 0,   
												"USUARIO" = :gs_user,   
												"FECHA" = :ldt_fec_cierre,   
												"JEFE_VENTA" = :ls_cod_jefe,   
												"MONTO_SUP" = 0,   
												"FECHA_INGRESO" = :ldt_fec_ing,   
												"TOTAL_TOTAL" = :ll_premio  
									WHERE	"META_SUPER"."COD_SUP" = :ls_codigo
									USING	sqlca;
									if sqlca.sqlcode = 0 then
										commit using sqlca;
									else
										rollback using sqlca;
									end if
								else
									INSERT INTO "META_SUPER"
												(	"COD_SUP",	"TIPO_CANAL",	"ABONO",		"TOTAL_UNIDAD",	"USUARIO",	"FECHA",			"JEFE_VENTA",	"MONTO_SUP",	"FECHA_INGRESO",	"TOTAL_TOTAL" )
									VALUES	(	:ls_codigo,	'VD',				:ldb_producc,	0,						:gs_user,	:ldt_fec_cierre,	:ls_cod_jefe,	0,					:ldt_fec_ing,				:ll_premio )
									USING	sqlca;
									if sqlca.sqlcode = 0 then
										commit using sqlca;
									else
										rollback using sqlca;
									end if
								end if
							end if
						end if
					next
					INSERT INTO "CIERRE_PAGOS_VENTAS"  
									( "FECHA_INICIO",			"FECHA_TERMINO",	"FECHA_PROCESO",	"TIPO_PREMIO",	"COD_PARQUE",	"USUARIO_CREA",	"TIPO_EMPLEADO" )  
					VALUES		( :ldt_fecha_cierre_ini,	:ldt_fec_cierre,			:ldt_fecha_proceso,	:ll_tipo_premio,	:ll_cod_parque,		:gs_user,			:ls_tipo_empleado ) ;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
					else
						rollback using sqlca;
					end if
					messagebox("Grabar","Proceso Grabación Exitoso")
					dw_lista.Reset()
				else
					messagebox("Grabar","Proceso de Grabación Cancelado")
				end if
			end if
		end if
	end if
end if
end event

type cb_limpiar from commandbutton within w_premio_produccion
integer x = 2304
integer y = 1640
integer width = 274
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_premios_calidad_cartera_sup.triggerevent(open!)
end event

type pb_aceptar from picturebutton within w_premio_produccion
integer x = 2405
integer y = 88
integer width = 133
integer height = 116
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string		ls_cod_jef,ls_cod_sup,ls_cod_cont,ls_cargo,ls_here,ls_clasif,ls_parque,ls_nombre,ls_apater,ls_amater,ls_canal,ls_cod_jef_aux,ls_nom_jef,ls_cargo_jef,ls_pago_vta
long		ll_cod_parque,ll_rut,ll_mes,ll_rango,ll_new,ll_cta=0,ll_rut_jef
datetime	ldt_fec_cierre,ldt_fec_ing,ldt_fecha_ini,ldt_fec_ing_jef
double	ldb_porc_ing,ldb_producc,ldb_prod_may,ldb_premio,ldb_porce_tab,ldb_valor_uf,ldb_prod_min,ldb_premio_jef,ldb_monto_jef,ldb_porce_jef

dw_seleccion.AcceptText()
dw_fecha_cierre.AcceptText()
dw_lista.Reset()
ll_cod_parque																= dw_seleccion.getitemnumber(1,'parque')
ldt_fec_cierre																= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ls_cod_jef																	= dw_seleccion.getitemstring(1,'jefe')
ls_cod_sup																	= dw_seleccion.getitemstring(1,'supervisor')
ls_cod_cont																	= '080'
ls_cargo																		= 'S'
if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ldt_fec_cierre) then
	if ll_cod_parque=11 then
		ls_pago_vta															= 'N'
	else
		ls_pago_vta															= 'S'
	end if
	
	SELECT	"COD_PARQ"."NOMBRE"  
    	INTO 		:ls_parque  
   	FROM 	"COD_PARQ"  
   	WHERE 	"COD_PARQ"."GRUPO" = 1 AND
				"COD_PARQ"."CODIGO" = :ll_cod_parque
	USING	sqlca;
	
	SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
	INTO 		:ldt_fecha_ini  
	FROM 	"CIERRE_VENTA"  
	WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fec_cierre
	USING	sqlca;
		
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO		:ldb_valor_uf  
	FROM		"TAB_UF"  
	WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_cierre
	USING	sqlca;
	
	if not isnull(ldt_fec_cierre) then
		dw_lista.object.usuario.text										= gs_user
		dw_lista.object.titulo_1.text										= 'Premio Producción Supervisores de Ventas'
		DECLARE x1 CURSOR FOR
		SELECT	"FECHA_ING","COD_SUP","RUT","NOMBRE","A_PATERNO","A_MATERNO","CANAL","COD_JEFE",
					(	CASE WHEN "SUPERVISOR"."COD_SUP" =	(	SELECT	DISTINCT "COD_SUP"  
																					FROM 	"SUPERVISOR_HEREDADO"  
																					WHERE	"SUPERVISOR_HEREDADO"."COD_SUP" = "SUPERVISOR"."COD_SUP" AND  
																								"SUPERVISOR_HEREDADO"."CORREL" = 1 AND
																								"SUPERVISOR_HEREDADO"."ESTADO" = 'V' ) THEN 'H' ELSE '' END) AS HEREDADO
		FROM		"SUPERVISOR"  
		WHERE	( "SUPERVISOR"."ESTADO" = 'A' ) AND  
					( "SUPERVISOR"."DEPTO" = 'R'  OR "SUPERVISOR"."DEPTO" = 'X' ) AND  
					( "SUPERVISOR"."CANAL" = 'NF' OR "SUPERVISOR"."CANAL" = 'UG') AND
					( "SUPERVISOR"."COD_PARQUE" =:ll_cod_parque ) AND
					(CASE WHEN "SUPERVISOR"."COD_PARQUE" = 11 AND "SUPERVISOR"."CANAL" = 'UG' THEN  'N' ELSE 'S' END ) = 'S' AND  
					( "SUPERVISOR"."PAGOS_VENTA" = :ls_pago_vta) AND
					( CASE WHEN "SUPERVISOR"."COD_SUP" = (	SELECT	"COD_SUP_HEREDADO"  
																				FROM 	"SUPERVISOR_HEREDADO"  
																				WHERE	"SUPERVISOR_HEREDADO"."COD_SUP_HEREDADO" = "SUPERVISOR"."COD_SUP" AND  
																							"SUPERVISOR_HEREDADO"."CORREL" = 1 AND
																							"SUPERVISOR_HEREDADO"."ESTADO" = 'V'  ) THEN 'I'  ELSE 'A' END) ='A'
		ORDER BY	"COD_JEFE","FECHA_ING" 
		USING	Trans_1;
		open x1;
		if Trans_1.sqlcode=0 then
			DO WHILE Trans_1.sqlcode=0
			fetch x1 INTO :ldt_fec_ing,:ls_cod_sup,:ll_rut,:ls_nombre,:ls_apater,:ls_amater,:ls_canal,:ls_cod_jef,:ls_here;
				if not isnull(ldt_fec_ing) and not isnull(ls_cod_sup) and ls_cod_sup<>'' and not isnull(ll_rut) and ll_rut>0 then
					ll_cta++
					if ll_cta= 1 then ls_cod_jef_aux=ls_cod_jef
					
					ls_nombre									= ls_nombre+' '+ls_apater+' '+ls_amater
					if ls_here	='H' then
						ldb_porc_ing							= 2.98
					else
						ldb_porc_ing							= 1.98
					end if
					ldb_producc									= wf_producc(ls_cod_sup,ldt_fec_cierre,0,'N')
					ldb_prod_may								= wf_producc(ls_cod_sup,ldt_fec_cierre,ldb_porc_ing,'S')
					ll_mes										= month(date(ldt_fec_cierre))		
					ls_clasif										= f_clasif_hist(ls_cod_sup,ldt_fec_cierre)
					if ldb_producc>0 then
						ldb_porce_tab							= round((ldb_prod_may/ldb_producc*100),2)
					else
						ldb_porce_tab							= 0
					end if
					if ls_canal='UG' then
						ll_cod_parque							= 102
					end if
					ll_rango										= wf_rango(ll_mes,ll_cod_parque,ldb_producc)
					ldb_prod_min								= wf_prod_minima(ll_mes,ll_cod_parque)
					if ll_rango>0 then
						ldb_premio								= wf_premio_uf(ls_clasif,ldb_porce_tab,ll_rango,ll_cod_parque)
						ldb_premio								= round(ldb_premio * ldb_valor_uf,0)
					else
						ldb_premio								= 0
					end if
					
					if ls_cod_jef_aux<>ls_cod_jef then
						SELECT	"NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO","RUT","CARGO","FECHA_ING"
									
						INTO		:ls_nom_jef,:ll_rut_jef,:ls_cargo_jef,:ldt_fec_ing_jef
						FROM 	"JEFE_VENTAS"  
						WHERE	( "JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jef_aux ) AND  
									( "JEFE_VENTAS"."PAGOS_VENTA" = 'S' ) AND  
									( "JEFE_VENTAS"."ESTADO" = 'A' )
						USING	sqlca;
						ldb_porce_jef							= 0.30
						ldb_premio_jef							= ldb_monto_jef * ldb_porce_jef
						
						ll_new									= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,"cod_sup",ls_cod_jef_aux)
						dw_lista.setitem(ll_new,"nombre",ls_nom_jef)
						dw_lista.setitem(ll_new,"cargo",ls_cargo_jef)
						dw_lista.setitem(ll_new,"fec_ing",ldt_fec_ing_jef)
						dw_lista.setitem(ll_new,"rut",ll_rut_jef)
						dw_lista.setitem(ll_new,"cod_contab",ls_cod_cont)
						dw_lista.setitem(ll_new,"porce_prem",(ldb_porce_jef * 100))
						dw_lista.setitem(ll_new,"premio",ldb_premio_jef)
						dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_ini)
						dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_cierre)
						dw_lista.setitem(ll_new,"parque",ls_parque)
						dw_lista.accepttext()
					end if
					ll_new										= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new)
					dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
					dw_lista.setitem(ll_new,"nombre",ls_nombre)
					dw_lista.setitem(ll_new,"cargo",ls_cargo)
					dw_lista.setitem(ll_new,"fec_ing",ldt_fec_ing)
					dw_lista.setitem(ll_new,"rut",ll_rut)
					dw_lista.setitem(ll_new,"cod_contab",ls_cod_cont)
					dw_lista.setitem(ll_new,"clasif",ls_clasif)
					dw_lista.setitem(ll_new,"porc_min",ldb_porc_ing)
					dw_lista.setitem(ll_new,"prod_total",ldb_producc)
					dw_lista.setitem(ll_new,"prod_may",ldb_prod_may)
					dw_lista.setitem(ll_new,"porce_prem",ldb_porce_tab)
					dw_lista.setitem(ll_new,"tramo",ll_rango)
					dw_lista.setitem(ll_new,"premio",ldb_premio)
					dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_ini)
					dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_cierre)
					dw_lista.setitem(ll_new,"prod_min",ldb_prod_min)
					dw_lista.setitem(ll_new,"parque",ls_parque)
					dw_lista.accepttext()
					if ls_cod_jef_aux=ls_cod_jef then
						ldb_monto_jef						= ldb_premio + ldb_monto_jef
					else
						ldb_monto_jef						= 0
						ldb_monto_jef						= ldb_premio + ldb_monto_jef
					end if
					ls_cod_jef_aux							= ls_cod_jef
				else
					SELECT	"NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO","RUT","CARGO","FECHA_ING"
								
					INTO		:ls_nom_jef,:ll_rut_jef,:ls_cargo_jef,:ldt_fec_ing_jef
					FROM 	"JEFE_VENTAS"  
					WHERE	( "JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jef_aux ) AND  
								( "JEFE_VENTAS"."PAGOS_VENTA" = 'S' ) AND  
								( "JEFE_VENTAS"."ESTADO" = 'A' )
					USING	sqlca;
					ldb_porce_jef							= 0.30
					ldb_premio_jef							= ldb_monto_jef * ldb_porce_jef
					
					ll_new									= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new)
					dw_lista.setitem(ll_new,"cod_sup",ls_cod_jef_aux)
					dw_lista.setitem(ll_new,"nombre",ls_nom_jef)
					dw_lista.setitem(ll_new,"cargo",ls_cargo_jef)
					dw_lista.setitem(ll_new,"fec_ing",ldt_fec_ing_jef)
					dw_lista.setitem(ll_new,"rut",ll_rut_jef)
					dw_lista.setitem(ll_new,"cod_contab",ls_cod_cont)
					dw_lista.setitem(ll_new,"porce_prem",(ldb_porce_jef * 100))
					dw_lista.setitem(ll_new,"premio",ldb_premio_jef)
					dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_ini)
					dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_cierre)
					dw_lista.setitem(ll_new,"parque",ls_parque)
					dw_lista.accepttext()
				end if
				setnull(ldt_fec_ing);setnull(ls_cod_sup);setnull(ll_rut);setnull(ls_cod_jef)
			LOOP
		end if
		close x1;
	else
		messagebox("Advertencia", "No Registra Valor U.F. con fecha: "+string(ldt_fec_cierre,'dd/mm/yyyy'))
	end if
else
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('parque')
	elseif isnull(ldt_fec_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('cierre_ventas')
	end if
end if
end event

type cb_cerrar from commandbutton within w_premio_produccion
integer x = 3026
integer y = 1640
integer width = 274
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premio_produccion)
end event

type cb_imprimir from commandbutton within w_premio_produccion
integer x = 2583
integer y = 1640
integer width = 274
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() >0 then 
	f_Print( dw_lista )
end if
end event

type dw_lista from datawindow within w_premio_produccion
integer x = 32
integer y = 228
integer width = 3269
integer height = 1368
integer taborder = 40
string title = "none"
string dataobject = "dwe_premios_produccion"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()
end event

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;string	ls_codigo,ls_string
datetime	ldt_fecha

ls_codigo					= dw_lista.getitemstring(il_row,'cod_sup')
ldt_fecha					= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ls_string					= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')

if isvalid(w_premios_calidad_cartera_agte) then close(w_premios_calidad_cartera_agte)
	OpenWithParm (w_premios_calidad_cartera_agte,ls_string)
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type dw_seleccion from datawindow within w_premio_produccion
integer x = 183
integer y = 32
integer width = 2203
integer height = 188
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccion_opcion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque
//double	idb_porc_ing

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque					= dw_seleccion.getitemnumber(1,'parque')
		SELECT	"COD_PARQ"."PORCE_CIERRE"  
		INTO 		:idb_porc_ing
		FROM		"COD_PARQ"  
		WHERE	"COD_PARQ"."CODIGO" = :ll_parque AND  
					"COD_PARQ"."GRUPO" = 1
		USING	sqlca;
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque					= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
END CHOOSE
end event

event itemfocuschanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
END CHOOSE
end event

type dw_fecha_cierre from datawindow within w_premio_produccion
integer x = 37
integer y = 120
integer width = 841
integer height = 100
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_premio_produccion
integer x = 2281
integer y = 1592
integer width = 603
integer height = 160
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

