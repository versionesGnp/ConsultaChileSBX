forward
global type w_campanas_ventas from window
end type
type st_2 from statictext within w_campanas_ventas
end type
type dw_tipo_camp from datawindow within w_campanas_ventas
end type
type rb_jef from radiobutton within w_campanas_ventas
end type
type rb_age_sup from radiobutton within w_campanas_ventas
end type
type st_1 from statictext within w_campanas_ventas
end type
type dw_canal from datawindow within w_campanas_ventas
end type
type cb_grabar from commandbutton within w_campanas_ventas
end type
type cb_detalle from commandbutton within w_campanas_ventas
end type
type cb_clasif_hist from commandbutton within w_campanas_ventas
end type
type dw_parque from datawindow within w_campanas_ventas
end type
type pb_aceptar from picturebutton within w_campanas_ventas
end type
type cb_limpiar from commandbutton within w_campanas_ventas
end type
type cb_imprimir from commandbutton within w_campanas_ventas
end type
type cb_exportar from commandbutton within w_campanas_ventas
end type
type cb_filtrar from commandbutton within w_campanas_ventas
end type
type dw_cierre_venta from datawindow within w_campanas_ventas
end type
type dw_lista from datawindow within w_campanas_ventas
end type
type cb_cerrar from commandbutton within w_campanas_ventas
end type
type gb_3 from groupbox within w_campanas_ventas
end type
type gb_1 from groupbox within w_campanas_ventas
end type
end forward

global type w_campanas_ventas from window
integer width = 3497
integer height = 1904
boolean titlebar = true
string title = "Campañas Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
st_2 st_2
dw_tipo_camp dw_tipo_camp
rb_jef rb_jef
rb_age_sup rb_age_sup
st_1 st_1
dw_canal dw_canal
cb_grabar cb_grabar
cb_detalle cb_detalle
cb_clasif_hist cb_clasif_hist
dw_parque dw_parque
pb_aceptar pb_aceptar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
dw_cierre_venta dw_cierre_venta
dw_lista dw_lista
cb_cerrar cb_cerrar
gb_3 gb_3
gb_1 gb_1
end type
global w_campanas_ventas w_campanas_ventas

type variables
string	is_cargo,is_cod_cont='CA1'
long	il_mes,il_ano,il_row
end variables

forward prototypes
public subroutine wf_cumpl_jef (datetime adt_fec_fin)
end prototypes

public subroutine wf_cumpl_jef (datetime adt_fec_fin);string		ls_cod_jef,ls_nom_jef,ls_estado
long		ll_prod,ll_pres,ll_orden=0,ll_new,ll_cod_parque,ll_rut
double	ldb_porce,ldb_premio,ldb_bruto,ldb_ley_social
datetime	ldt_fec_ini

//wf_cumpl_jef(adt_fec_fin)


SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
INTO 		:ldt_fec_ini  
FROM		"CIERRE_VENTA"  
WHERE	"CIERRE_VENTA"."CIERRE_VENTA" = :adt_fec_fin
USING	sqlca;

DECLARE x1 CURSOR FOR
SELECT		"VISTA_CAMPANA_VTAS"."COD_JEF",
				count("CODIGO") AS PRODUCC,
				(	SELECT	sum("PRESUPUESTO"."CANTIDAD_VENTAS")  
    					FROM		"PRESUPUESTO"  
					WHERE 	( "PRESUPUESTO"."FECHA" = "VISTA_CAMPANA_VTAS"."CIERRE_VENTA" ) AND
								( "PRESUPUESTO"."UNIDAD_VENTAS" <> 0 ) AND
								( "PRESUPUESTO"."COD_JEFE" = "VISTA_CAMPANA_VTAS"."COD_JEF" )) AS PRESUP,
				ROUND((count("CODIGO") / (	SELECT	sum("PRESUPUESTO"."CANTIDAD_VENTAS")  
														FROM 	"PRESUPUESTO"  
														WHERE	( "PRESUPUESTO"."FECHA" = "VISTA_CAMPANA_VTAS"."CIERRE_VENTA" ) AND
																	( "PRESUPUESTO"."UNIDAD_VENTAS" <> 0 ) AND 
																	( "PRESUPUESTO"."COD_JEFE" = "VISTA_CAMPANA_VTAS"."COD_JEF" )) *100),2) AS PORCE
FROM			"VISTA_CAMPANA_VTAS"
WHERE 		("VISTA_CAMPANA_VTAS"."CODIGO" = 'O' OR "VISTA_CAMPANA_VTAS"."CODIGO" = 'A') and 
				("VISTA_CAMPANA_VTAS"."CANAL_JEF" = 'NF' OR "VISTA_CAMPANA_VTAS"."CANAL_JEF" = 'UG') AND
				"VISTA_CAMPANA_VTAS"."CANAL_AGE" <> 'NI' AND  
				"VISTA_CAMPANA_VTAS"."CIERRE_VENTA" = :adt_fec_fin AND
				( "VISTA_CAMPANA_VTAS"."CODIGO" = 'O' OR "VISTA_CAMPANA_VTAS"."CODIGO" = 'A' ) 
				//"VISTA_CAMPANA_VTAS"."PORCE_ING_CIERRE" >= 2.98 AND
				//"VISTA_CAMPANA_VTAS"."DOCTO_PEND" is null 
GROUP BY	"VISTA_CAMPANA_VTAS"."COD_JEF",
				"VISTA_CAMPANA_VTAS"."CIERRE_VENTA"
ORDER BY	ROUND((count("CODIGO") / (	SELECT	sum("PRESUPUESTO"."CANTIDAD_VENTAS")  
														FROM 	"PRESUPUESTO"  
														WHERE	( "PRESUPUESTO"."FECHA" = "VISTA_CAMPANA_VTAS"."CIERRE_VENTA" ) AND 
																	( "PRESUPUESTO"."UNIDAD_VENTAS" <> 0 ) AND  
																	( "PRESUPUESTO"."COD_JEFE" = "VISTA_CAMPANA_VTAS"."COD_JEF" )) *100),2) DESC																	
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
	fetch x1 INTO :ls_cod_jef,:ll_prod,:ll_pres,:ldb_porce;
		if not isnull(ls_cod_jef) and ls_cod_jef <> '' and not isnull(ll_prod) and ll_prod>0 and not isnull(ll_pres) and ll_pres>0 and not isnull(ldb_porce) and ldb_porce>0 then
			if ldb_porce>90 then
				dw_lista.Object.usuario.text 		= gs_user
				dw_lista.Object.titulo2.text 			= 'Período de Ventas desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' hasta '+string(adt_fec_fin,'dd/mm/yyyy')
				
				ldb_premio								= 500000
				ldb_bruto								= round((ldb_premio * 1.25),0)
				ldb_ley_social							= round((ldb_bruto * 0.20),0)
				SELECT	("NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO"),"ESTADO", "RUT",	"COD_PARQUE"  
				INTO 		:ls_nom_jef,:ls_estado,:ll_rut,:ll_cod_parque
				FROM 	"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jef
				USING	sqlca;
				ll_orden++
				if ll_orden=1 then
					ll_new								= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new)
					dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
					dw_lista.setitem(ll_new,"cod_jef",ls_cod_jef)
					dw_lista.setitem(ll_new,"monbre_jef",ls_nom_jef)
					dw_lista.setitem(ll_new,"rut_jef",ll_rut)
					dw_lista.setitem(ll_new,"estado",ls_estado)
					dw_lista.setitem(ll_new,"producc",ll_prod)
					dw_lista.setitem(ll_new,"presup",ll_pres)
					dw_lista.setitem(ll_new,"porce",ldb_porce)
					dw_lista.setitem(ll_new,"premio_bruto",ldb_bruto)
					dw_lista.setitem(ll_new,"imponible",ldb_ley_social)
					dw_lista.setitem(ll_new,"premio",ldb_premio)
					dw_lista.accepttext()
				end if
			end if
		end if
		setnull(ls_cod_jef);setnull(ll_prod);setnull(ll_pres);setnull(ldb_porce)
	LOOP
end if
close x1;
end subroutine

on w_campanas_ventas.create
this.st_2=create st_2
this.dw_tipo_camp=create dw_tipo_camp
this.rb_jef=create rb_jef
this.rb_age_sup=create rb_age_sup
this.st_1=create st_1
this.dw_canal=create dw_canal
this.cb_grabar=create cb_grabar
this.cb_detalle=create cb_detalle
this.cb_clasif_hist=create cb_clasif_hist
this.dw_parque=create dw_parque
this.pb_aceptar=create pb_aceptar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.dw_cierre_venta=create dw_cierre_venta
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.dw_tipo_camp,&
this.rb_jef,&
this.rb_age_sup,&
this.st_1,&
this.dw_canal,&
this.cb_grabar,&
this.cb_detalle,&
this.cb_clasif_hist,&
this.dw_parque,&
this.pb_aceptar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.dw_cierre_venta,&
this.dw_lista,&
this.cb_cerrar,&
this.gb_3,&
this.gb_1}
end on

on w_campanas_ventas.destroy
destroy(this.st_2)
destroy(this.dw_tipo_camp)
destroy(this.rb_jef)
destroy(this.rb_age_sup)
destroy(this.st_1)
destroy(this.dw_canal)
destroy(this.cb_grabar)
destroy(this.cb_detalle)
destroy(this.cb_clasif_hist)
destroy(this.dw_parque)
destroy(this.pb_aceptar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.dw_cierre_venta)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.gb_3)
destroy(this.gb_1)
end on

event open;connect using Trans_1;
connect using Trans_2;


gf_centrar(w_campanas_ventas)

dw_parque.dataobject					= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_cierre_venta.settransobject(sqlca)
dw_cierre_venta.getchild('cierre_ventas',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve(datetime(date(string('31/03/2015'))))=0 then
	idw_detalle4.insertrow(0)
end if
dw_cierre_venta.insertrow(0)
dw_lista.dataobject					= 'dwe_campana_venta'
dw_lista.settransobject(sqlca)

dw_canal.dataobject					= 'dwe_canal_campana'
dw_canal.settransobject(sqlca)
dw_canal.insertrow(0)

dw_tipo_camp.dataobject			= 'dwe_tipo_campana'
dw_tipo_camp.settransobject(sqlca)
dw_tipo_camp.insertrow(0)

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;

end event

type st_2 from statictext within w_campanas_ventas
integer x = 50
integer y = 52
integer width = 347
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Campaña"
boolean focusrectangle = false
end type

type dw_tipo_camp from datawindow within w_campanas_ventas
integer x = 41
integer y = 140
integer width = 571
integer height = 100
integer taborder = 30
string title = "none"
string dataobject = "dwe_tipo_campana"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//rb_age_sup.checked										= true
//rb_jef.enabled												= false
end event

type rb_jef from radiobutton within w_campanas_ventas
integer x = 873
integer y = 144
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jefe Ventas"
end type

event clicked;dw_canal.enabled		= false
dw_parque.enabled	= false
end event

type rb_age_sup from radiobutton within w_campanas_ventas
integer x = 873
integer y = 68
integer width = 553
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agentes y Supervisor"
boolean checked = true
end type

event clicked;dw_canal.enabled		= true
dw_parque.enabled	= true
end event

type st_1 from statictext within w_campanas_ventas
integer x = 1499
integer y = 152
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente Canal:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_canal from datawindow within w_campanas_ventas
integer x = 1856
integer y = 140
integer width = 667
integer height = 100
integer taborder = 30
string title = "none"
string dataobject = "dwe_canal_campana"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_canal

dw_canal.accepttext()
ls_canal												= dw_canal.getitemstring(1,'canal')	
if ls_canal='UG' then
	dw_parque.setitem(1,'parque',1)
	dw_canal.accepttext()
	dw_parque.enabled							= false
else
	dw_parque.insertrow(0)
	dw_parque.enabled							= true
end if 
end event

type cb_grabar from commandbutton within w_campanas_ventas
integer x = 32
integer y = 1636
integer width = 279
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string text = "Grabar"
end type

event clicked;string		ls_mes,ls_cod_age,ls_serie,ls_haber,ls_estado,ls_graba='S',ls_tipo_camp
long		ll_tot_reg,ll_count=0,ll_indi,ll_rut,ll_tot_pago,ll_cod_parque,ll_verif,ll_malos=0,ll_tipo_prem,ll_res,ll_graba=0,ll_nro_vtas,ll_mto_rep
datetime	ldt_fec_fin,ldt_fec_ini
double	ldb_premio

dw_lista.accepttext()

ls_serie							= ' '
ls_haber							= 'H'
ll_tipo_prem						= 20
ldt_fec_fin						= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
ll_cod_parque					= dw_parque.getitemnumber(1,'parque')
if isnull(ldt_fec_fin) then
	messagebox("Advertencia", "Debe Ingresar Cierre Ventas")
	dw_cierre_venta.setfocus()
	dw_cierre_venta.setcolumn('cierre_ventas')
	ls_graba						= 'N'
elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
	messagebox("Advertencia", "Debe Ingresar Parque")
	dw_parque.setfocus()
	dw_parque.setcolumn('parque')
	ls_graba						= 'N'
end if
if ls_graba='S' then
	ls_mes						= string(month(date(ldt_fec_fin)))
	SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
	INTO 		:ldt_fec_ini  
	FROM		"CIERRE_VENTA"  
	WHERE	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fec_fin
	USING	sqlca;
	
	ll_res							= MessageBox("Grabar","¿Desea Grabar Proceso Premio Campaña por Ventas?", Exclamation!, YesNo!, 2)
	if ll_res=1 then 
		ll_tot_reg				= dw_lista.rowcount()
		if ll_tot_reg > 0 then
			for ll_indi = 1 to ll_tot_reg
				
				if is_cargo='A' then
					ls_cod_age		= dw_lista.getitemstring(ll_indi,'cod_age')
					ll_rut				= dw_lista.getitemnumber(ll_indi,'rut_age')
					ldb_premio		= dw_lista.getitemnumber(ll_indi,'premio_bruto')
					ls_estado		= dw_lista.getitemstring(ll_indi,'estado_age')
					ll_mto_rep		= dw_lista.getitemnumber(ll_indi,'premio_rep')
					ll_nro_vtas		= dw_lista.getitemnumber(ll_indi,'ventas_age')
				elseif is_cargo='J' then
					ls_cod_age		= dw_lista.getitemstring(ll_indi,'cod_jef')
					ll_rut				= dw_lista.getitemnumber(ll_indi,'rut_jef')
					ldb_premio		= dw_lista.getitemnumber(ll_indi,'premio_bruto')
					ls_estado		= dw_lista.getitemstring(ll_indi,'estado')
					ll_mto_rep		= 0
					ll_nro_vtas		= dw_lista.getitemnumber(ll_indi,'producc')
				end if
				
				ls_tipo_camp		= dw_tipo_camp.getitemstring(1,'tipo_campana')
				if ls_tipo_camp='C' then
					is_cod_cont		= 'CA1'
				elseif ls_tipo_camp='D' then
					is_cod_cont		= 'CA2'
				end if
				
				
				SELECT	count("RES_COMI"."COD_AGE_SUP")  
				INTO 		:ll_verif  
				FROM 	"RES_COMI"  
				WHERE	"RES_COMI"."COD_AGE_SUP" = :ls_cod_age AND  
							"RES_COMI"."FECHA" = :ldt_fec_fin AND
							"RES_COMI"."COD_CONTABLE" = :is_cod_cont
				USING	sqlca;
				if isnull(ll_verif) then ll_verif=0
				if ll_verif=0 then
					if ldb_premio>0 then
						if f_graba_res_comi(ls_cod_age,ll_rut,0,is_cod_cont,ls_mes,ldt_fec_fin,0,ls_serie,0,0,0,ldb_premio,0,ls_haber,'','P',ls_estado,'',ll_cod_parque,ll_mto_rep,ll_nro_vtas)= -1 then
							ll_malos++
						else
							ll_count++
						end if
					end if
				end if
			next
		end if
		INSERT INTO "CIERRE_PAGOS_VENTAS"  
					( "FECHA_INICIO",	"FECHA_TERMINO",	"FECHA_PROCESO",	"TIPO_PREMIO",	"COD_PARQUE",	"USUARIO_CREA",	"TIPO_EMPLEADO" )  
		VALUES	( :ldt_fec_ini,		:ldt_fec_fin,				:gdt_fec_sistema,		:ll_tipo_prem,		:ll_cod_parque,		:gs_user,			:is_cargo )
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			ll_graba++
		else
			rollback using sqlca;
		end if
		if ll_graba=1 and ll_tot_reg=ll_count then
			messagebox("Grabar","Grabación Exitosa")
			dw_lista.reset()
		end if 
	end if
end if
end event

type cb_detalle from commandbutton within w_campanas_ventas
integer x = 1056
integer y = 1648
integer width = 370
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Ventas"
end type

event clicked;//string	ls_codigo,ls_string
//datetime	ldt_fecha_cierre
//
//dw_lista.accepttext()
//if dw_lista.rowcount() > 0 then
//	ldt_fecha_cierre			= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
//	ls_codigo					= dw_lista.getitemstring(il_row,'cod_age')
//	if not isnull(ls_codigo) and ls_codigo<>''  then
//		ls_string					= string(ldt_fecha_cierre,'dd/mm/yyyy')+'~t'+ls_codigo
//		if isvalid(w_premios_prod_mes_c_det) then close(w_premios_prod_mes_c_det)
//		OpenWithParm (w_premios_prod_mes_c_det,ls_string)
//	end if
//end if
end event

type cb_clasif_hist from commandbutton within w_campanas_ventas
integer x = 608
integer y = 1648
integer width = 448
integer height = 84
integer taborder = 80
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

dw_cierre_venta.accepttext()
dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ls_codigo						= dw_lista.getitemstring(il_row,'cod_age')
	ldt_fecha						= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
	if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fecha) then
		ls_string						= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')
		if isvalid(w_clasifica_historica) then close(w_clasifica_historica)
		OpenWithParm (w_clasifica_historica,ls_string)
	end if
end if
end event

type dw_parque from datawindow within w_campanas_ventas
integer x = 2537
integer y = 136
integer width = 745
integer height = 100
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type pb_aceptar from picturebutton within w_campanas_ventas
integer x = 3296
integer y = 116
integer width = 133
integer height = 116
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string		ls_canal,ls_cod_sup,ls_cod_age,ls_est_age,ls_est_sup,ls_nombre_age,ls_nombre_sup,ls_pasa='S',ls_insert,ls_tipo_camp
long		ll_cod_parque,ll_nro_vta_sup,ll_rut_sup,ll_new,ll_tot_reg,ll_orden=0,ll_nro_vta_age,ll_rut_age,ll_mes,ll_ano,ll_vtas_a,ll_x_adic,ll_prod_age_min,ll_prod_sup_min
datetime	ldt_fec_fin,ldt_fec_ini,ldt_fec_fin2,ldt_fec_20
double	ldb_prem_adic=0,ldb_prem_age,ldb_prem_sup,ldb_prem_rep,ldb_monto,ldb_premio,ldb_bruto,ldb_ley_social,ldb_prod_sup,ldb_porce_a

dw_lista.reset()
dw_parque.accepttext()
dw_cierre_venta.accepttext()
dw_canal.accepttext()
dw_tipo_camp.accepttext()

ls_tipo_camp													= dw_tipo_camp.getitemstring(1,'tipo_campana')
if isnull(ls_tipo_camp) then
	messagebox("Advertencia", "Debe Ingresar Cierre Ventas")
	dw_tipo_camp.setfocus()
	dw_tipo_camp.setcolumn('tipo_campana')
	ls_pasa													= 'N'
else
	if rb_jef.checked=true then
		is_cargo														= 'J'
		dw_lista.dataobject										= 'dwe_campana_venta_jef'
		dw_lista.settransobject(sqlca)
		ldt_fec_fin													= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
		if isnull(ldt_fec_fin) then
			messagebox("Advertencia", "Debe Ingresar Cierre Ventas")
			dw_cierre_venta.setfocus()
			dw_cierre_venta.setcolumn('cierre_ventas')
			ls_pasa													= 'N'
		end if
		if ls_pasa='S' then
			wf_cumpl_jef(ldt_fec_fin)
		end if
	elseif rb_age_sup.checked=true then
		is_cargo														= 'A'
		dw_lista.dataobject										= 'dwe_campana_venta'
		dw_lista.settransobject(sqlca)
		ll_cod_parque												= dw_parque.getitemnumber(1,'parque')
		ldt_fec_fin													= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
		ls_canal														= dw_canal.getitemstring(1,'canal')	
		if isnull(ldt_fec_fin) then
			messagebox("Advertencia", "Debe Ingresar Cierre Ventas")
			dw_cierre_venta.setfocus()
			dw_cierre_venta.setcolumn('cierre_ventas')
			ls_pasa													= 'N'
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia", "Debe Ingresar Parque")
			dw_parque.setfocus()
			dw_parque.setcolumn('parque')
			ls_pasa													= 'N'
		elseif isnull(ls_canal) or ls_canal='' then
			messagebox("Advertencia", "Debe Ingresar Canal Ventas")
			dw_parque.setfocus()
			dw_parque.setcolumn('canal')
			ls_pasa													= 'N'
		end if
		if ls_pasa = 'S' then
			SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
			INTO 		:ldt_fec_ini  
			FROM		"CIERRE_VENTA"  
			WHERE	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fec_fin
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ldt_fec_ini) then
					dw_lista.Object.usuario.text 				= gs_user
					if ls_tipo_camp= 'C' then
						dw_lista.Object.titulo2.text 				= 'Período de Ventas desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' hasta '+string(ldt_fec_fin,'dd/mm/yyyy')
					elseif ls_tipo_camp= 'D' then
						ll_mes										= month(date(ldt_fec_fin))
						ll_ano											= year(date(ldt_fec_fin))
						ldt_fec_20									= datetime(date(string('15/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))),time('00:00:00'))
						ldt_fec_fin2									= datetime(date(ldt_fec_20),time('23:59:59'))
						dw_lista.Object.titulo2.text 				= 'Ventas Ingresadas y Pagadas al '+string(ldt_fec_20,'dd/mm/yyyy')
					end if
				end if
			end if
			if ls_tipo_camp= 'C' and ll_cod_parque=11 then
				DECLARE x1 CURSOR FOR
				SELECT		"AGENTES_COORDINADOR"."COD_COORDINADOR" ,
								count("VISTA_CAMPANA_VTAS"."NUMERO"),
								sum("VISTA_CAMPANA_VTAS"."PRODUCC_TOTAL"),
								sum("VISTA_CAMPANA_VTAS"."CTAS_VTAS_A"),
								("AGENTES"."NOMBRE"||' '||"AGENTES"."A_PATERNO"||' '||"AGENTES"."A_MATERNO"),
								"AGENTES"."RUT",
								"AGENTES"."ESTADO"
				FROM			"VISTA_CAMPANA_VTAS","AGENTES_COORDINADOR","AGENTES"   
				WHERE		"VISTA_CAMPANA_VTAS"."COD_AGE" = "AGENTES_COORDINADOR"."COD_AGE" AND
								"AGENTES_COORDINADOR"."COD_COORDINADOR" = "AGENTES"."COD_AGE" AND
								"AGENTES_COORDINADOR"."ESTADO" = 'A' AND
								( "VISTA_CAMPANA_VTAS"."CODIGO" = 'O' OR "VISTA_CAMPANA_VTAS"."CODIGO" = 'A' ) AND
								"VISTA_CAMPANA_VTAS"."CANAL_SUP" = :ls_canal AND
								"VISTA_CAMPANA_VTAS"."CIERRE_VENTA" = :ldt_fec_fin and
								"VISTA_CAMPANA_VTAS"."PARQUE_SUP" = :ll_cod_parque and
								"VISTA_CAMPANA_VTAS"."PORCE_ING_CIERRE" >= 2.98 and
								"VISTA_CAMPANA_VTAS"."DOCTO_PEND" is null 
				GROUP BY	"AGENTES_COORDINADOR"."COD_COORDINADOR",
								("AGENTES"."NOMBRE"||' '||"AGENTES"."A_PATERNO"||' '||"AGENTES"."A_MATERNO"),
								"AGENTES"."RUT",
								"AGENTES"."ESTADO"
				ORDER BY	count("VISTA_CAMPANA_VTAS"."NUMERO") DESC,
								sum("VISTA_CAMPANA_VTAS"."PRODUCC_TOTAL") DESC
				USING		sqlca;	
			elseif ls_tipo_camp= 'D' and ll_cod_parque=11 then
				DECLARE x2 CURSOR FOR
				SELECT		"AGENTES_COORDINADOR"."COD_COORDINADOR" ,
								count("VISTA_CAMPANA_VTAS"."NUMERO"),
								sum("VISTA_CAMPANA_VTAS"."PRODUCC_TOTAL"),
								sum("VISTA_CAMPANA_VTAS"."CTAS_VTAS_A"),
								("AGENTES"."NOMBRE"||' '||"AGENTES"."A_PATERNO"||' '||"AGENTES"."A_MATERNO"),
								"AGENTES"."RUT",
								"AGENTES"."ESTADO"
				FROM			"VISTA_CAMPANA_VTAS","AGENTES_COORDINADOR","AGENTES"   
				WHERE		"VISTA_CAMPANA_VTAS"."COD_AGE" = "AGENTES_COORDINADOR"."COD_AGE" AND
								"AGENTES_COORDINADOR"."COD_COORDINADOR" = "AGENTES"."COD_AGE" AND
								"AGENTES_COORDINADOR"."ESTADO" = 'A' AND
								( "VISTA_CAMPANA_VTAS"."CODIGO" = 'O' OR "VISTA_CAMPANA_VTAS"."CODIGO" = 'A' ) AND
								"VISTA_CAMPANA_VTAS"."CANAL_SUP" = :ls_canal AND
								"VISTA_CAMPANA_VTAS"."CIERRE_VENTA" = :ldt_fec_fin and
								"VISTA_CAMPANA_VTAS"."PARQUE_SUP" = :ll_cod_parque and
								//"VISTA_CAMPANA_VTAS"."DOCTO_PEND" is null and
								"VISTA_CAMPANA_VTAS"."FECHA_RECEP" <= :ldt_fec_fin2 and
								"VISTA_CAMPANA_VTAS"."FEC_INGRESO" <= :ldt_fec_fin2
				GROUP BY	"AGENTES_COORDINADOR"."COD_COORDINADOR",
								("AGENTES"."NOMBRE"||' '||"AGENTES"."A_PATERNO"||' '||"AGENTES"."A_MATERNO"),
								"AGENTES"."RUT",
								"AGENTES"."ESTADO"
				ORDER BY	count("VISTA_CAMPANA_VTAS"."NUMERO") DESC,
								sum("VISTA_CAMPANA_VTAS"."PRODUCC_TOTAL") DESC
				USING		sqlca;	
			elseif ls_tipo_camp= 'C' and ll_cod_parque<>11 then	
				DECLARE x3 CURSOR FOR
				SELECT		"COD_SUP",
								count("VISTA_CAMPANA_VTAS"."NUMERO"),
								sum("VISTA_CAMPANA_VTAS"."PRODUCC_TOTAL"),
								sum("VISTA_CAMPANA_VTAS"."CTAS_VTAS_A"),
								("NOM_SUP"||' '||"APAT_SUP"||' '||"AMAT_SUP"),
								"RUT_SUP",
								"ESTADO_SUP"
				FROM			"VISTA_CAMPANA_VTAS"  
				WHERE		"VISTA_CAMPANA_VTAS"."CANAL_SUP" = :ls_canal  AND
								"VISTA_CAMPANA_VTAS"."CIERRE_VENTA" = :ldt_fec_fin and
								"VISTA_CAMPANA_VTAS"."PARQUE_SUP" = :ll_cod_parque and
								"VISTA_CAMPANA_VTAS"."PORCE_ING_CIERRE" >= 2.98 and
								( "VISTA_CAMPANA_VTAS"."CODIGO" = 'O' OR "VISTA_CAMPANA_VTAS"."CODIGO" = 'A' )  AND
								"VISTA_CAMPANA_VTAS"."DOCTO_PEND" is null 
				GROUP BY	"VISTA_CAMPANA_VTAS"."COD_SUP",
								("NOM_SUP"||' '||"APAT_SUP"||' '||"AMAT_SUP"),
								"VISTA_CAMPANA_VTAS"."RUT_SUP",
								"VISTA_CAMPANA_VTAS"."ESTADO_SUP"
				ORDER BY	count("VISTA_CAMPANA_VTAS"."NUMERO") DESC,
								sum("VISTA_CAMPANA_VTAS"."PRODUCC_TOTAL") DESC
				USING		sqlca;	
			elseif ls_tipo_camp= 'D' and ll_cod_parque<>11 then
				DECLARE x4 CURSOR FOR
				SELECT		"COD_SUP",
								count("VISTA_CAMPANA_VTAS"."NUMERO"),
								sum("VISTA_CAMPANA_VTAS"."PRODUCC_TOTAL"),
								sum("VISTA_CAMPANA_VTAS"."CTAS_VTAS_A"),
								("NOM_SUP"||' '||"APAT_SUP"||' '||"AMAT_SUP"),
								"RUT_SUP",
								"ESTADO_SUP"
				FROM			"VISTA_CAMPANA_VTAS"  
				WHERE		"VISTA_CAMPANA_VTAS"."CANAL_SUP" = :ls_canal  AND
								"VISTA_CAMPANA_VTAS"."CIERRE_VENTA" = :ldt_fec_fin and
								"VISTA_CAMPANA_VTAS"."PARQUE_SUP" = :ll_cod_parque and
								( "VISTA_CAMPANA_VTAS"."CODIGO" = 'O' OR "VISTA_CAMPANA_VTAS"."CODIGO" = 'A' ) AND
								"VISTA_CAMPANA_VTAS"."DOCTO_PEND" is null and
								"VISTA_CAMPANA_VTAS"."FECHA_RECEP" <= :ldt_fec_fin2 and
								"VISTA_CAMPANA_VTAS"."FEC_INGRESO" <= :ldt_fec_fin2
				GROUP BY	"VISTA_CAMPANA_VTAS"."COD_SUP",
								("NOM_SUP"||' '||"APAT_SUP"||' '||"AMAT_SUP"),
								"VISTA_CAMPANA_VTAS"."RUT_SUP",
								"VISTA_CAMPANA_VTAS"."ESTADO_SUP"
				ORDER BY	count("VISTA_CAMPANA_VTAS"."NUMERO") DESC,
								sum("VISTA_CAMPANA_VTAS"."PRODUCC_TOTAL") DESC
				USING		sqlca;	
			end if
			if ls_tipo_camp= 'C' and ll_cod_parque=11 then
				open x1;
			elseif ls_tipo_camp= 'D' and ll_cod_parque=11 then
				open x2;
			elseif ls_tipo_camp= 'C' and ll_cod_parque<>11 then
				open x3;
			elseif ls_tipo_camp= 'D' and ll_cod_parque<>11 then	
				open x4;
			end if
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					if ls_tipo_camp= 'C' and ll_cod_parque=11 then
						fetch x1 INTO	:ls_cod_sup,:ll_nro_vta_sup,	:ldb_prod_sup, :ll_vtas_a,	:ls_nombre_sup,:ll_rut_sup,:ls_est_sup; 
					elseif ls_tipo_camp= 'D' and ll_cod_parque=11 then
						fetch x2 INTO	:ls_cod_sup,:ll_nro_vta_sup,	:ldb_prod_sup,	:ll_vtas_a,	:ls_nombre_sup,:ll_rut_sup,:ls_est_sup; 
					elseif ls_tipo_camp= 'C' and ll_cod_parque<>11 then
						fetch x3 INTO	:ls_cod_sup,:ll_nro_vta_sup,	:ldb_prod_sup,	:ll_vtas_a,	:ls_nombre_sup,:ll_rut_sup,:ls_est_sup;
					elseif ls_tipo_camp= 'D' and ll_cod_parque<>11 then	
						fetch x4 INTO	:ls_cod_sup,:ll_nro_vta_sup,	:ldb_prod_sup,	:ll_vtas_a,	:ls_nombre_sup,:ll_rut_sup,:ls_est_sup;
					end if
					if not isnull(ls_cod_sup) and ls_cod_sup<>'' and not isnull(ll_nro_vta_sup) or ll_nro_vta_sup >0 then
						if ls_tipo_camp='C' then 
							ll_orden++
							if ll_orden=1 then
								SELECT	min("PREMIO_CAMPANA"."TRAMO_INI")  
								INTO		:ll_prod_age_min
								FROM 	"PREMIO_CAMPANA"  
								WHERE	( "PREMIO_CAMPANA"."CARGO" = 'A' ) AND  
											( "PREMIO_CAMPANA"."ESTADO" = 'V' ) AND  
											( "PREMIO_CAMPANA"."CANAL" = :ls_canal ) AND  
											( "PREMIO_CAMPANA"."FEC_VIGENCIA" = :ldt_fec_fin )
								USING	sqlca;
								if isnull(ll_prod_age_min) then ll_prod_age_min=0
								
								if ll_nro_vta_sup>=ll_prod_age_min then
									SELECT	"PREMIO_CAMPANA_CANAL"."PREMIO"
									INTO		:ldb_prem_adic
									FROM 	"PREMIO_CAMPANA_CANAL"  
									WHERE	"PREMIO_CAMPANA_CANAL"."COD_PARQUE" =:ll_cod_parque AND  
												"PREMIO_CAMPANA_CANAL"."CANAL" = :ls_canal AND  
												"PREMIO_CAMPANA_CANAL"."LUGAR" = :ll_orden AND  
												"PREMIO_CAMPANA_CANAL"."ESTADO" = 'V' AND
												"PREMIO_CAMPANA_CANAL"."FEC_VIGENCIA" = :ldt_fec_fin
									USING	Trans_1;
									if isnull(ldb_prem_adic) then ldb_prem_adic=0
									ls_insert						= 'S'	
								else
									ldb_prem_adic				= 0
									ls_insert						= 'N'	
								end if
							else
								ldb_prem_adic					= 0
								ls_insert							= 'N'	
							end if
						elseif ls_tipo_camp='D' then
							ldb_prem_adic						= 0
							ls_insert								= 'N'	
						end if

						SELECT	min("PREMIO_CAMPANA"."TRAMO_INI")  
						INTO		:ll_prod_sup_min
						FROM 	"PREMIO_CAMPANA"  
						WHERE	( "PREMIO_CAMPANA"."CARGO" = 'S' ) AND  
									( "PREMIO_CAMPANA"."ESTADO" = 'V' ) AND  
									( "PREMIO_CAMPANA"."CANAL" = :ls_canal ) AND  
									( "PREMIO_CAMPANA"."FEC_VIGENCIA" = :ldt_fec_fin )
						USING	sqlca;
						if isnull(ll_prod_sup_min) then ll_prod_sup_min=0
						
						if ll_nro_vta_sup>=ll_prod_sup_min then
							ls_insert								= 'S'	
						else
							ls_insert								= 'N'
						end if
						
//						ldb_porce_a							= ll_vtas_a / ll_nro_vta_sup * 100
//						if ldb_porce_a >= 48.00 then
//							ll_x_adic								= 2
//						else
//							ll_x_adic								= 1
//						end if


						if ls_tipo_camp='C' then
							if ll_nro_vta_sup>=ll_prod_age_min then 
								SELECT	"PREMIO"
								INTO		:ldb_prem_age
								FROM		"PREMIO_CAMPANA"  
								WHERE	"PREMIO_CAMPANA"."TRAMO_INI" <= :ll_nro_vta_sup AND  
											"PREMIO_CAMPANA"."TRAMO_FIN" > :ll_nro_vta_sup AND  
											"PREMIO_CAMPANA"."ESTADO" = 'V' AND
											"PREMIO_CAMPANA"."CARGO" = 'A' AND
											"PREMIO_CAMPANA"."FEC_VIGENCIA" = :ldt_fec_fin AND
											"PREMIO_CAMPANA"."CANAL" = :ls_canal
								USING	Trans_1;
							end if
							if ll_nro_vta_sup>=ll_prod_sup_min then 
								SELECT	"PREMIO_SUP"
								INTO		:ldb_prem_sup
								FROM		"PREMIO_CAMPANA"  
								WHERE	"PREMIO_CAMPANA"."TRAMO_INI" <= :ll_nro_vta_sup AND  
											"PREMIO_CAMPANA"."TRAMO_FIN" > :ll_nro_vta_sup AND  
											"PREMIO_CAMPANA"."ESTADO" = 'V' AND
											"PREMIO_CAMPANA"."CARGO" = 'S' AND
											"PREMIO_CAMPANA"."FEC_VIGENCIA" = :ldt_fec_fin AND
											"PREMIO_CAMPANA"."CANAL" = :ls_canal
								USING	Trans_1;
							end if
								
							if isnull(ldb_prem_age) then ldb_prem_age=0
							if isnull(ldb_prem_sup) then ldb_prem_sup=0
							
							ldb_prem_age					= ldb_prem_age * 1
							ldb_prem_sup					= ldb_prem_sup * 1
														
							ldb_bruto						= round((ldb_prem_sup * 1.25),0)
							ldb_ley_social					= round((ldb_bruto * 0.20),0)
							//ls_insert							= 'S'
							
							
						elseif ls_tipo_camp='D' and ll_nro_vta_sup>=15 then
							 SELECT	"PREMIO"
							INTO		:ldb_prem_age
							FROM		"PREMIO_CAMPANA"  
							WHERE	"PREMIO_CAMPANA"."TRAMO_INI" <= :ll_nro_vta_sup AND  
										"PREMIO_CAMPANA"."TRAMO_FIN" > :ll_nro_vta_sup AND  
										"PREMIO_CAMPANA"."ESTADO" = 'V' AND
										"PREMIO_CAMPANA"."CARGO" = 'A' AND
										"PREMIO_CAMPANA"."FEC_VIGENCIA" = :ldt_fec_20
							USING	Trans_1;
							if isnull(ldb_prem_age) then ldb_prem_age=0
							ls_insert								= 'S'
						end if
						
						ldb_prem_rep							= ldb_prem_adic+ldb_prem_age
						ldb_monto								= round(ldb_prem_rep / ll_nro_vta_sup,0)
						
						if ls_insert='S' then
							if ls_tipo_camp='C' then
								ll_new							= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new)
								dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
								dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
								dw_lista.setitem(ll_new,"monbre_sup",ls_nombre_sup)
								dw_lista.setitem(ll_new,"ventas_sup",ll_nro_vta_sup)
								dw_lista.setitem(ll_new,"producc_uf",ldb_prod_sup)
								//dw_lista.setitem(ll_new,"producc_uf",ldb_porce_a)
								
								dw_lista.setitem(ll_new,"rut_sup",ll_rut_sup)
								dw_lista.setitem(ll_new,"premio1",ldb_prem_age)
								dw_lista.setitem(ll_new,"premio2",ldb_prem_adic)
								//dw_lista.setitem(ll_new,"premio2",ll_vtas_a)
								dw_lista.setitem(ll_new,"premio_rep",ldb_prem_rep)
								dw_lista.setitem(ll_new,"monto",ldb_monto)
								dw_lista.setitem(ll_new,"cargo",'S')
								dw_lista.setitem(ll_new,"cod_age",ls_cod_sup)
								dw_lista.setitem(ll_new,"monbre_age",ls_nombre_sup)
								dw_lista.setitem(ll_new,"ventas_age",ll_nro_vta_sup)
								dw_lista.setitem(ll_new,"rut_age",ll_rut_sup)
								dw_lista.setitem(ll_new,"estado_age",ls_est_sup)
								if ls_est_sup='I' then
									ldb_prem_sup				= 0
								end if
								dw_lista.setitem(ll_new,"premio_bruto",ldb_bruto)
								dw_lista.setitem(ll_new,"imponible",ldb_ley_social)
								dw_lista.setitem(ll_new,"premio",ldb_prem_sup)
								dw_lista.accepttext()
								
								ldb_bruto						= 0
								ldb_ley_social					= 0
								ldb_prem_sup					= 0
							end if
							
							if ls_tipo_camp= 'C' and ll_cod_parque=11 then
								DECLARE x5 CURSOR FOR
								SELECT		"VISTA_CAMPANA_VTAS"."COD_AGE",
												count("VISTA_CAMPANA_VTAS"."NUMERO"),
												"VISTA_CAMPANA_VTAS"."RUT_AGE",
												"VISTA_CAMPANA_VTAS"."ESTADO_AGE",
												("VISTA_CAMPANA_VTAS"."NOM_AGE"||' '||"VISTA_CAMPANA_VTAS"."APAT_AGE"||' '||"VISTA_CAMPANA_VTAS"."AMAT_AGE")
								FROM			"VISTA_CAMPANA_VTAS","AGENTES_COORDINADOR"  
								WHERE		"VISTA_CAMPANA_VTAS"."COD_AGE" = "AGENTES_COORDINADOR"."COD_AGE" AND
												"AGENTES_COORDINADOR"."ESTADO" = 'A' AND
												"AGENTES_COORDINADOR"."COD_COORDINADOR" = :ls_cod_sup AND  
												"VISTA_CAMPANA_VTAS"."CIERRE_VENTA" = :ldt_fec_fin  AND
												"VISTA_CAMPANA_VTAS"."PORCE_ING_CIERRE" >= 2.98 and
												( "VISTA_CAMPANA_VTAS"."CODIGO" = 'O' OR "VISTA_CAMPANA_VTAS"."CODIGO" = 'A' ) AND
												"VISTA_CAMPANA_VTAS"."DOCTO_PEND" is null 
								GROUP BY	"VISTA_CAMPANA_VTAS"."COD_AGE",
												"VISTA_CAMPANA_VTAS"."RUT_AGE",   
												"VISTA_CAMPANA_VTAS"."ESTADO_AGE",
												("VISTA_CAMPANA_VTAS"."NOM_AGE"||' '||"VISTA_CAMPANA_VTAS"."APAT_AGE"||' '||"VISTA_CAMPANA_VTAS"."AMAT_AGE")
								USING		Trans_2;	
							elseif ls_tipo_camp= 'D' and ll_cod_parque=11 then
								DECLARE x6 CURSOR FOR
								SELECT		"VISTA_CAMPANA_VTAS"."COD_AGE",
												count("VISTA_CAMPANA_VTAS"."NUMERO"),
												"VISTA_CAMPANA_VTAS"."RUT_AGE",
												"VISTA_CAMPANA_VTAS"."ESTADO_AGE",
												("VISTA_CAMPANA_VTAS"."NOM_AGE"||' '||"VISTA_CAMPANA_VTAS"."APAT_AGE"||' '||"VISTA_CAMPANA_VTAS"."AMAT_AGE")
								FROM			"VISTA_CAMPANA_VTAS","AGENTES_COORDINADOR"  
								WHERE		"VISTA_CAMPANA_VTAS"."COD_AGE" = "AGENTES_COORDINADOR"."COD_AGE" AND
												"AGENTES_COORDINADOR"."ESTADO" = 'A' AND
												"AGENTES_COORDINADOR"."COD_COORDINADOR" = :ls_cod_sup AND  
												"VISTA_CAMPANA_VTAS"."CIERRE_VENTA" = :ldt_fec_fin  AND
												"VISTA_CAMPANA_VTAS"."DOCTO_PEND" is null and
												( "VISTA_CAMPANA_VTAS"."CODIGO" = 'O' OR "VISTA_CAMPANA_VTAS"."CODIGO" = 'A' ) AND
												"VISTA_CAMPANA_VTAS"."FECHA_RECEP" <= :ldt_fec_fin2 and
												"VISTA_CAMPANA_VTAS"."FEC_INGRESO" <= :ldt_fec_fin2
								GROUP BY	"VISTA_CAMPANA_VTAS"."COD_AGE",
												"VISTA_CAMPANA_VTAS"."RUT_AGE",   
												"VISTA_CAMPANA_VTAS"."ESTADO_AGE",
												("VISTA_CAMPANA_VTAS"."NOM_AGE"||' '||"VISTA_CAMPANA_VTAS"."APAT_AGE"||' '||"VISTA_CAMPANA_VTAS"."AMAT_AGE")
								USING		Trans_2;	
							elseif ls_tipo_camp= 'C' and ll_cod_parque<>11 then
								DECLARE x7 CURSOR FOR
								SELECT		"COD_AGE",
												count("NUMERO"),
												"RUT_AGE",
												"ESTADO_AGE",
												("NOM_AGE"||' '||"APAT_AGE"||' '||"AMAT_AGE")
								FROM			"VISTA_CAMPANA_VTAS"  
								WHERE		"VISTA_CAMPANA_VTAS"."COD_SUP" = :ls_cod_sup AND  
												"VISTA_CAMPANA_VTAS"."CIERRE_VENTA" = :ldt_fec_fin AND
												"VISTA_CAMPANA_VTAS"."PORCE_ING_CIERRE" >= 2.98 and
												( "VISTA_CAMPANA_VTAS"."CODIGO" = 'O' OR "VISTA_CAMPANA_VTAS"."CODIGO" = 'A' ) AND
												"VISTA_CAMPANA_VTAS"."DOCTO_PEND" is null 
								GROUP BY	"VISTA_CAMPANA_VTAS"."COD_AGE",
												"VISTA_CAMPANA_VTAS"."RUT_AGE",   
												"VISTA_CAMPANA_VTAS"."ESTADO_AGE",
												("NOM_AGE"||' '||"APAT_AGE"||' '||"AMAT_AGE")
								USING		Trans_2;	
							elseif ls_tipo_camp= 'D' and ll_cod_parque<>11 then
								DECLARE x8 CURSOR FOR
								SELECT		"COD_AGE",
												count("NUMERO"),
												"RUT_AGE",
												"ESTADO_AGE",
												("NOM_AGE"||' '||"APAT_AGE"||' '||"AMAT_AGE")
								FROM			"VISTA_CAMPANA_VTAS"  
								WHERE		"VISTA_CAMPANA_VTAS"."COD_SUP" = :ls_cod_sup AND  
												"VISTA_CAMPANA_VTAS"."CIERRE_VENTA" = :ldt_fec_fin AND
												( "VISTA_CAMPANA_VTAS"."CODIGO" = 'O' OR "VISTA_CAMPANA_VTAS"."CODIGO" = 'A' ) AND
												"VISTA_CAMPANA_VTAS"."DOCTO_PEND" is null and
												"VISTA_CAMPANA_VTAS"."FECHA_RECEP" <= :ldt_fec_fin2 and
												"VISTA_CAMPANA_VTAS"."FEC_INGRESO" <= :ldt_fec_fin2
								GROUP BY	"VISTA_CAMPANA_VTAS"."COD_AGE",
												"VISTA_CAMPANA_VTAS"."RUT_AGE",   
												"VISTA_CAMPANA_VTAS"."ESTADO_AGE",
												("NOM_AGE"||' '||"APAT_AGE"||' '||"AMAT_AGE")
								USING		Trans_2;	
							end if	
							if ls_tipo_camp= 'C' and ll_cod_parque=11 then
								open x5;
							elseif ls_tipo_camp= 'D' and ll_cod_parque=11 then
								open x6;
							elseif ls_tipo_camp= 'C' and ll_cod_parque<>11 then
								open x7;
							elseif ls_tipo_camp= 'D' and ll_cod_parque<>11 then	
								open x8;
							end if
							if Trans_2.sqlcode=0 then
								DO WHILE Trans_2.sqlcode=0
									if ls_tipo_camp= 'C' and ll_cod_parque=11 then
										fetch x5 INTO	:ls_cod_age,:ll_nro_vta_age,:ll_rut_age,:ls_est_age,:ls_nombre_age; 
									elseif ls_tipo_camp= 'D' and ll_cod_parque=11 then
										fetch x6 INTO	:ls_cod_age,:ll_nro_vta_age,:ll_rut_age,:ls_est_age,:ls_nombre_age;
									elseif ls_tipo_camp= 'C' and ll_cod_parque<>11 then
										fetch x7 INTO	:ls_cod_age,:ll_nro_vta_age,:ll_rut_age,:ls_est_age,:ls_nombre_age;
									elseif ls_tipo_camp= 'D' and ll_cod_parque<>11 then
										fetch x8 INTO	:ls_cod_age,:ll_nro_vta_age,:ll_rut_age,:ls_est_age,:ls_nombre_age;
									end if
									if not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ll_rut_age) and ll_rut_age >0 and not isnull(ls_est_age) and ls_est_age<>'' and not isnull(ls_nombre_age) and ls_nombre_age<>'' then 
										ldb_premio				= ldb_monto * ll_nro_vta_age
										ldb_bruto				= round((ldb_premio * 1.25),0)
										ldb_ley_social			= round((ldb_bruto * 0.20),0)
										
										ll_new					= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new)
										dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
										dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
										dw_lista.setitem(ll_new,"monbre_sup",ls_nombre_sup)
										dw_lista.setitem(ll_new,"ventas_sup",ll_nro_vta_sup)
										dw_lista.setitem(ll_new,"rut_sup",ll_rut_sup)
										dw_lista.setitem(ll_new,"premio1",ldb_prem_age)
										dw_lista.setitem(ll_new,"premio2",ldb_prem_adic)
										//dw_lista.setitem(ll_new,"premio2",ll_vtas_a)
										
										dw_lista.setitem(ll_new,"premio_rep",ldb_prem_rep)
										dw_lista.setitem(ll_new,"monto",ldb_monto)
										
										dw_lista.setitem(ll_new,"cargo",'A')
										dw_lista.setitem(ll_new,"cod_age",ls_cod_age)
										dw_lista.setitem(ll_new,"monbre_age",ls_nombre_age)
										dw_lista.setitem(ll_new,"ventas_age",ll_nro_vta_age)
										dw_lista.setitem(ll_new,"rut_age",ll_rut_age)
										dw_lista.setitem(ll_new,"estado_age",ls_est_age)
										
										dw_lista.setitem(ll_new,"premio_bruto",ldb_bruto)
										dw_lista.setitem(ll_new,"imponible",ldb_ley_social)
										dw_lista.setitem(ll_new,"premio",ldb_premio)
										dw_lista.accepttext()
									end if
									setnull(ls_cod_age);setnull(ll_nro_vta_age);setnull(ll_rut_age);setnull(ls_est_age);setnull(ls_nombre_age)
								LOOP
							end if
							if ls_tipo_camp= 'C' and ll_cod_parque=11 then
								close x5;
							elseif ls_tipo_camp= 'D' and ll_cod_parque=11 then
								close x6;
							elseif ls_tipo_camp= 'C' and ll_cod_parque<>11 then
								close x7;
							elseif ls_tipo_camp= 'D' and ll_cod_parque<>11 then	
								close x8;
							end if
						end if
					end if
					setnull(ls_cod_sup);setnull(ll_nro_vta_sup);setnull(ls_nombre_sup);setnull(ll_rut_sup);setnull(ls_est_sup)
				LOOP
			end if
			if ls_tipo_camp= 'C' and ll_cod_parque=11 then
				close x1;
			elseif ls_tipo_camp= 'D' and ll_cod_parque=11 then
				close x2;
			elseif ls_tipo_camp= 'C' and ll_cod_parque<>11 then
				close x3;
			elseif ls_tipo_camp= 'D' and ll_cod_parque<>11 then	
				close x4;
			end if
			ll_tot_reg										= dw_lista.rowcount()
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Datos")
			end if
		end if
	end if
end if
end event

type cb_limpiar from commandbutton within w_campanas_ventas
integer x = 2272
integer y = 1648
integer width = 238
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_campanas_ventas.triggerevent(open!)
end event

type cb_imprimir from commandbutton within w_campanas_ventas
integer x = 2656
integer y = 1648
integer width = 238
integer height = 84
integer taborder = 70
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

type cb_exportar from commandbutton within w_campanas_ventas
integer x = 1792
integer y = 1648
integer width = 238
integer height = 84
integer taborder = 60
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

type cb_filtrar from commandbutton within w_campanas_ventas
integer x = 2034
integer y = 1648
integer width = 238
integer height = 84
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
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type dw_cierre_venta from datawindow within w_campanas_ventas
integer x = 1509
integer y = 40
integer width = 841
integer height = 88
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

type dw_lista from datawindow within w_campanas_ventas
integer x = 32
integer y = 252
integer width = 3406
integer height = 1356
integer taborder = 10
string title = "none"
string dataobject = "dwe_campana_venta"
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

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type cb_cerrar from commandbutton within w_campanas_ventas
integer x = 3113
integer y = 1648
integer width = 315
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_campanas_ventas)
end event

type gb_3 from groupbox within w_campanas_ventas
integer x = 1769
integer y = 1600
integer width = 1157
integer height = 152
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_campanas_ventas
integer x = 846
integer y = 4
integer width = 626
integer height = 232
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Cargo"
end type

