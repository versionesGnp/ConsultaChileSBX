forward
global type w_premios_calidad_cartera_agte from window
end type
type cb_detalle from commandbutton within w_premios_calidad_cartera_agte
end type
type cb_clasif_hist from commandbutton within w_premios_calidad_cartera_agte
end type
type cb_grabar from commandbutton within w_premios_calidad_cartera_agte
end type
type cb_limpiar from commandbutton within w_premios_calidad_cartera_agte
end type
type pb_aceptar from picturebutton within w_premios_calidad_cartera_agte
end type
type cb_cerrar from commandbutton within w_premios_calidad_cartera_agte
end type
type cb_imprimir from commandbutton within w_premios_calidad_cartera_agte
end type
type dw_lista from datawindow within w_premios_calidad_cartera_agte
end type
type dw_seleccion from datawindow within w_premios_calidad_cartera_agte
end type
type dw_fecha_cierre from datawindow within w_premios_calidad_cartera_agte
end type
type gb_1 from groupbox within w_premios_calidad_cartera_agte
end type
end forward

global type w_premios_calidad_cartera_agte from window
integer width = 3355
integer height = 1904
boolean titlebar = true
string title = "Calidad Cartera Agentes"
boolean controlmenu = true
long backcolor = 67108864
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
global w_premios_calidad_cartera_agte w_premios_calidad_cartera_agte

type variables
long il_row
end variables

on w_premios_calidad_cartera_agte.create
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
this.Control[]={this.cb_detalle,&
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

on w_premios_calidad_cartera_agte.destroy
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

event open;string	ls_nulo,ls_jefe,ls_codigo
long		ll_parque,ll_tot_reg
datetime	ldt_fecha
date		ld_fecha

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_premios_calidad_cartera_agte)
dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/10/2010'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)
ls_codigo									= substr(1,1,Message.StringParm)
ld_fecha										= date(substr(1,2,Message.StringParm))
ldt_fecha									= datetime(ld_fecha,time('00:00:00'))
if isnull(ls_codigo) or ls_codigo ='' then 
	if gl_proceso>=4 then
		if gs_conexion	= "Parque El Prado" then
			ll_parque													= 1
		elseif gs_conexion	= "Parque La Foresta" then
			ll_parque													= 11
		elseif gs_conexion	= "Parque Concepción" then
			ll_parque													= 801
		end if
		dw_seleccion.width											= 709
		pb_aceptar.x													= 905
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
		dw_seleccion.width											= 2203
		pb_aceptar.x													= 2405
		SELECT	"JEFE_VENTAS"."COD_PARQUE"  
		INTO 		:ll_parque  
		FROM 		"JEFE_VENTAS"  
		WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
		USING		 sqlca;
		if sqlca.sqlcode=0 then
			dw_seleccion.object.parque.protect					= 1
			dw_seleccion.object.jefe.protect						= 1
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
		dw_seleccion.width											= 2203
		pb_aceptar.x													= 2405
		SELECT	"SUPERVISOR"."COD_PARQUE",   
					"SUPERVISOR"."COD_JEFE"  
		INTO		:ll_parque,   
					:ls_jefe  
		FROM 		"SUPERVISOR"  
		WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
		USING		 sqlca;
		if sqlca.sqlcode=0 then
			dw_seleccion.object.parque.protect					= 1
			dw_seleccion.object.jefe.protect						= 1
			dw_seleccion.object.supervisor.protect				= 1
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
		close(w_premios_calidad_cartera_agte)
	end if
else
	dw_fecha_cierre.Reset()
	dw_fecha_cierre.settransobject(sqlca)
	dw_fecha_cierre.insertrow(0)
	dw_fecha_cierre.setitem(1,"cierre_ventas",ldt_fecha)
	
	dw_seleccion.width											= 2203
	pb_aceptar.x													= 2405
	SELECT	"SUPERVISOR"."COD_PARQUE",   
				"SUPERVISOR"."COD_JEFE"  
	INTO		:ll_parque,   
				:ls_jefe  
	FROM 		"SUPERVISOR"  
	WHERE 	"SUPERVISOR"."COD_SUP" = :ls_codigo
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		dw_seleccion.object.supervisor.protect				= 1
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
		dw_seleccion.setitem(1,'supervisor',ls_codigo)
	end if
	dw_lista.reset()
	dw_seleccion.accepttext()
	pb_aceptar.triggerevent(clicked!)

end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_detalle from commandbutton within w_premios_calidad_cartera_agte
integer x = 1381
integer y = 1652
integer width = 402
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Ventas"
end type

event clicked;string	ls_codigo,ls_string,ls_cod_contab,ls_cargo
datetime	ldt_fecha_cierre

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ldt_fecha_cierre			= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
	ls_codigo					= dw_lista.getitemstring(il_row,'cod_agte')
	ls_cod_contab				= dw_lista.getitemstring(il_row,'cod_haber')
	ls_cargo						= dw_lista.getitemstring(il_row,'cargo')
	if not isnull(ls_codigo) and ls_codigo<>''  then
		ls_string					= string(ldt_fecha_cierre,'dd/mm/yyyy')+'~t'+ls_codigo+'~t'+ls_cod_contab+'~t'+ls_cargo
		if isvalid(w_detalle_ventas_mensual) then close(w_detalle_ventas_mensual)
		OpenWithParm (w_detalle_ventas_mensual,ls_string)
	end if
end if
end event

type cb_clasif_hist from commandbutton within w_premios_calidad_cartera_agte
integer x = 814
integer y = 1652
integer width = 567
integer height = 96
integer taborder = 60
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

dw_fecha_cierre.accepttext()
dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	if dw_lista.dataobject			='dwe_premios_calidad_cartera_agte' and dw_lista.rowcount() > 0 then
		ls_codigo						= dw_lista.getitemstring(il_row,'cod_agte')
		ldt_fecha						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
	end if
	if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fecha) then
		ls_string						= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')
		if isvalid(w_clasifica_historica) then close(w_clasifica_historica)
		OpenWithParm (w_clasifica_historica,ls_string)
	end if
end if
end event

type cb_grabar from commandbutton within w_premios_calidad_cartera_agte
boolean visible = false
integer x = 32
integer y = 1652
integer width = 279
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_cod_contab,ls_haber,ls_estado_agte,ls_estado_premio,ls_codigo,ls_serie,ls_moneda,ls_tipo_empleado
long		ll_cod_parque,ll_tipo_premio,ll_mes,ll_res,ll_tot_reg,ll_indi,ll_rut,ll_tot_pagado,ll_premio,ll_malos,ll_cont
datetime	ldt_fecha_cierre,ldt_fecha_proceso,ldt_fecha_consul,ldt_fecha_cierre_ini
double	ldb_numero,ldb_valor_uf,ldb_porcentaje,ldb_porce_vta,ldb_precio

dw_seleccion.AcceptText()
dw_fecha_cierre.AcceptText()
ll_cod_parque												= dw_seleccion.getitemnumber(1,'parque')
ldt_fecha_cierre											= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ls_cod_contab												= 'P08'
ll_tipo_premio												= 8
ldt_fecha_proceso											= gdt_fec_sistema
ll_mes														= month(date(ldt_fecha_cierre))
ls_haber      												= 'H'
ls_estado_agte												= 'A'
ls_estado_premio											= 'P'
ls_tipo_empleado											= 'A'

SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
INTO 		:ldt_fecha_cierre_ini  
FROM 		"CIERRE_VENTA"  
WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
USING		sqlca;
if sqlca.sqlcode=0 then
end if
if ldt_fecha_cierre > ldt_fecha_proceso then
	messagebox("Grabar","No Puede Ejecutar el Proceso de Premio con Fecha :"+string(ldt_fecha_proceso,"dd/mm/yyyy"))
else
	SELECT	"VALOR_UF"  
	INTO		:ldb_valor_uf  
	FROM		"TAB_UF"  
	WHERE		 "TAB_UF"."FECHA_UF" = :ldt_fecha_cierre
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldb_valor_uf) or ldb_valor_uf > 0 then
			SELECT DISTINCT	"FECHA_TERMINO"
			INTO		:ldt_fecha_consul
			FROM		"CIERRE_PAGOS_VENTAS"
			WHERE		"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
						"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_cierre AND
						"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
						"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
			USING		sqlca;
			if sqlca.sqlcode = 0 then
				if not isnull(ldt_fecha_consul) then
					messagebox("Advertencia","Proceso Premio Calidad Cartera Agentes N.F. Fue Grabado con Fecha :"+string(ldt_fecha_cierre,"dd/mm/yyyy"))
				end if
			else
				ll_res	= MessageBox("Grabar","¿Desea Grabar Premio Calidad Cartera Agentes N.F.?", Exclamation!, YesNo!, 2)
				if ll_res = 1 then
					ll_tot_reg								= dw_lista.rowcount()											
					for ll_indi = 1 to ll_tot_reg
						ls_codigo							= dw_lista.getitemstring(ll_indi,'cod_agte')
						ll_rut								= dw_lista.getitemnumber(ll_indi,'rut')
						ll_tot_pagado						= 0
						ls_cod_contab						= dw_lista.getitemstring(ll_indi,'cod_haber')
						ldb_numero							= 0
						ls_serie								= ' '
						ldb_porcentaje						= 0
						ldb_porce_vta						= 0
						ldb_precio							= 0
						ll_premio							= dw_lista.getitemnumber(ll_indi,'premio')
						ls_moneda							= ''
						if f_graba_res_comi(ls_codigo,ll_rut,ll_tot_pagado,ls_cod_contab,string(ll_mes),ldt_fecha_cierre,ldb_numero,ls_serie,ldb_porcentaje,ldb_porce_vta,ldb_precio,ll_premio,ldb_valor_uf,ls_haber,ls_moneda,ls_estado_premio,ls_estado_agte,'O',ll_cod_parque,0,0)= -1 then
							ll_malos++
						else
							ll_cont++
						end if
					next
					INSERT INTO "CIERRE_PAGOS_VENTAS"  
									( "FECHA_INICIO",				"FECHA_TERMINO",		"FECHA_PROCESO",		"TIPO_PREMIO",		"COD_PARQUE",		"USUARIO_CREA",	"TIPO_EMPLEADO" )  
					VALUES		( :ldt_fecha_cierre_ini,	:ldt_fecha_cierre,	:ldt_fecha_proceso,	:ll_tipo_premio,	:ll_cod_parque,	:gs_user,			:ls_tipo_empleado )  ;
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

type cb_limpiar from commandbutton within w_premios_calidad_cartera_agte
integer x = 1979
integer y = 1652
integer width = 279
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_premios_calidad_cartera_agte.triggerevent(open!)
end event

type pb_aceptar from picturebutton within w_premios_calidad_cartera_agte
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

event clicked;string	ls_cod_agte,ls_nombre,ls_a_paterno,ls_a_materno,ls_estado,ls_cod_sup,ls_nombre_comp,ls_fecha_ini_03,&
			ls_fecha_ini_02,ls_fecha_ini_01,ls_clasif_hist_03,ls_clasif_hist_02,ls_clasif_hist_01,ls_cod_contab,&
			ls_jefe,ls_superv,ls_cargo,ls_decrip_premio
long		ll_cod_parque,ll_rut,ll_meta,ll_new,ll_mes_03,ll_ano_03,ll_mes_02,ll_ano_02,ll_mes_01,ll_ano_01,ll_antiguedad,&
			ll_tipo_premio,ll_premio,tot_reg
datetime	ldt_fecha_ing,ldt_fecha_cierre,ldt_fecha_03,ldt_fecha_ini_03,ldt_fecha_02,ldt_fecha_ini_02,ldt_fecha_01,&
			ldt_fecha_ini_01,ldt_fecha_cierre_ini,ldt_fecha_consul
double	ldb_producc

dw_seleccion.AcceptText()
dw_fecha_cierre.AcceptText()
dw_lista.Reset()
ll_cod_parque															= dw_seleccion.getitemnumber(1,'parque')
ldt_fecha_cierre														= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ls_jefe																	= dw_seleccion.getitemstring(1,'jefe')
ls_superv																= dw_seleccion.getitemstring(1,'supervisor')
ls_cod_contab															= 'P08'
ls_cargo																	= 'A'
SELECT	"COD_PREMIO",		"DESCRIPCION",			"PREMIO1"
INTO		:ll_tipo_premio,	:ls_decrip_premio,	:ll_premio
FROM		"PREMIO_TIPO"  
WHERE 	"PREMIO_TIPO"."COD_CONTAB" = :ls_cod_contab AND  
         	"PREMIO_TIPO"."CARGO" = :ls_cargo AND
			"PREMIO_TIPO"."PARQUE" = :ll_cod_parque
USING		sqlca;
dw_lista.dataobject													='dwe_premios_calidad_cartera_agte'
dw_lista.settransobject(sqlca)
dw_lista.object.usuario.text										= gs_user

if not isnull(ll_cod_parque) and ll_cod_parque > 0 and not isnull(ldt_fecha_cierre) then
	SELECT DISTINCT	"FECHA_TERMINO"
	INTO		:ldt_fecha_consul
	FROM		"CIERRE_PAGOS_VENTAS"
	WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
				"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_cierre AND
				"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
				"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_cargo
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		if not isnull(ldt_fecha_consul) then
			SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
			INTO 		:ldt_fecha_cierre_ini  
			FROM 	"CIERRE_VENTA"  
			WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
			USING	sqlca;
			if sqlca.sqlcode=0 then
			end if
			SELECT	MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")  
			INTO		:ldt_fecha_03  
			FROM		"CLASIFICA_HIST"  
			WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" <= :ldt_fecha_cierre
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.object.clasif_03_t.text					= string(ldt_fecha_03,'dd/mm/yy')
				ll_mes_03											= month(date(ldt_fecha_03))
				ll_ano_03											= year(date(ldt_fecha_03))
				ls_fecha_ini_03										= '01/'+ string(ll_mes_03,'00')+ '/' +string(ll_ano_03,'0000')
				ldt_fecha_ini_03									= datetime(date(ls_fecha_ini_03))
				ldt_fecha_02										= datetime(RelativeDate(date(ldt_fecha_ini_03), - 1))
				dw_lista.object.clasif_02_t.text					= string(ldt_fecha_02,'dd/mm/yy')
				ll_mes_02											= month(date(ldt_fecha_02))
				ll_ano_02											= year(date(ldt_fecha_02))
				ls_fecha_ini_02										= '01/'+ string(ll_mes_02,'00')+ '/' +string(ll_ano_02,'0000')
				ldt_fecha_ini_02									= datetime(date(ls_fecha_ini_02))
				ldt_fecha_01										= datetime(RelativeDate(date(ldt_fecha_ini_02), - 1))
				dw_lista.object.clasif_01_t.text					= string(ldt_fecha_01,'dd/mm/yy')
				ll_mes_01											= month(date(ldt_fecha_01))
				ll_ano_01											= year(date(ldt_fecha_01))
				ls_fecha_ini_01										= '01/'+ string(ll_mes_01,'00')+ '/' +string(ll_ano_01,'0000')
				ldt_fecha_ini_01									= datetime(date(ls_fecha_ini_01))
				dw_lista.object.titulo_1.text						= ls_decrip_premio 
			end if
			if not isnull(ls_jefe) and ls_jefe<> '' and isnull(ls_superv) then
				DECLARE x1 CURSOR FOR
				SELECT	"RES_COMI"."COD_AGE_SUP",	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"RES_COMI"."RUT",	"AGENTES"."FECHA_INI",	"AGENTES"."ESTADO",	"AGENTES"."META",	"RES_COMI"."TOTAL_PAGO",	"AGENTES"."COD_PARQUE"  
				FROM		"RES_COMI",  "AGENTES",	"SUPERVISOR"  
				WHERE 	( "RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" ) and  
         					( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
							( ( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab  ) AND  
							( "RES_COMI"."FECHA" = :ldt_fecha_cierre ) AND 
							( "AGENTES"."COD_PARQUE" =:ll_cod_parque ) AND
							( "AGENTES"."DEPTO" ='K' OR "AGENTES"."DEPTO" ='X') AND  
							( "SUPERVISOR"."COD_JEFE" = :ls_jefe ) )
				ORDER BY	"AGENTES"."FECHA_INI" ASC
				USING	Trans_1;
				open x1;
				if Trans_1.sqlcode=0 then
					DO WHILE Trans_1.sqlcode=0
						fetch x1 INTO	:ls_cod_agte,	:ls_nombre,	:ls_a_paterno,	:ls_a_materno,	:ll_rut,	:ldt_fecha_ing,	:ls_estado,	:ll_meta,	:ll_premio,	:ll_cod_parque  ;
							if not isnull(ls_cod_agte) and ls_cod_agte <> '' and not isnull(ll_rut) and ll_rut > 0 then
								ls_nombre_comp							= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
								ls_clasif_hist_03						= f_clasif_hist(ls_cod_agte,ldt_fecha_03)
								ls_clasif_hist_02						= f_clasif_hist(ls_cod_agte,ldt_fecha_02)
								ls_clasif_hist_01						= f_clasif_hist(ls_cod_agte,ldt_fecha_01)
								ldb_producc								= f_produc_cierre_agte_pro_lib_aum(ls_cod_agte,ldt_fecha_cierre)
								ll_new									= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new)
								dw_lista.setitem(ll_new,"cod_agte",ls_cod_agte)
								dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
								dw_lista.setitem(ll_new,"nombre",ls_nombre_comp)
								dw_lista.setitem(ll_new,"rut",ll_rut)
								dw_lista.setitem(ll_new,"fecha_ing",ldt_fecha_ing)
								dw_lista.setitem(ll_new,"estado",ls_estado)
								dw_lista.setitem(ll_new,"meta",ll_meta)
								dw_lista.setitem(ll_new,"clasif_03",ls_clasif_hist_03)
								dw_lista.setitem(ll_new,"clasif_02",ls_clasif_hist_02)
								dw_lista.setitem(ll_new,"clasif_01",ls_clasif_hist_01)
								dw_lista.setitem(ll_new,"producc",ldb_producc)
								dw_lista.setitem(ll_new,"premio",ll_premio)
								dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_cierre_ini)
								dw_lista.setitem(ll_new,"fecha_fin",ldt_fecha_cierre)
								dw_lista.setitem(ll_new,"parque",ll_cod_parque)
								dw_lista.setitem(ll_new,"cod_haber",ls_cod_contab)
								dw_lista.setitem(ll_new,"cargo",ls_cargo)
							end if
							setnull(ls_cod_agte);setnull(ll_rut)
						LOOP
					end if
				close x1;
				tot_reg													= dw_lista.RowCount()
				if tot_reg = 0 then
					messagebox("Advertencia","No Registra Premios Calidad Cartera Agentes N.F.")
					close(w_premios_calidad_cartera_agte)
				end if
			elseif not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_superv) and ls_superv<>'' then
				DECLARE x2 CURSOR FOR
				SELECT	"RES_COMI"."COD_AGE_SUP",	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"RES_COMI"."RUT",	"AGENTES"."FECHA_INI",	"AGENTES"."ESTADO",	"AGENTES"."META",	"RES_COMI"."TOTAL_PAGO",	"AGENTES"."COD_PARQUE"  
				FROM		"RES_COMI",  "AGENTES",	"SUPERVISOR"  
				WHERE 	( "RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" ) and  
							( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
							( ( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab  ) AND  
							( "RES_COMI"."FECHA" = :ldt_fecha_cierre ) AND  
							( "AGENTES"."COD_PARQUE" =:ll_cod_parque ) AND
							( "AGENTES"."DEPTO" ='K' OR "AGENTES"."DEPTO" ='X' ) AND
							( "AGENTES"."COD_SUP" = :ls_superv ) )
				ORDER BY	"AGENTES"."FECHA_INI" ASC
				USING	Trans_1;
				open x2;
				if Trans_1.sqlcode=0 then
					DO WHILE Trans_1.sqlcode=0
						fetch x2 INTO	:ls_cod_agte,	:ls_nombre,	:ls_a_paterno,	:ls_a_materno,	:ll_rut,	:ldt_fecha_ing,	:ls_estado,	:ll_meta,	:ll_premio,	:ll_cod_parque  ;
							if not isnull(ls_cod_agte) and ls_cod_agte <> '' and not isnull(ll_rut) and ll_rut > 0 then
								ls_nombre_comp							= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
								ls_clasif_hist_03						= f_clasif_hist(ls_cod_agte,ldt_fecha_03)
								ls_clasif_hist_02						= f_clasif_hist(ls_cod_agte,ldt_fecha_02)
								ls_clasif_hist_01						= f_clasif_hist(ls_cod_agte,ldt_fecha_01)
								ldb_producc								= f_produc_cierre_agte_pro_lib_aum(ls_cod_agte,ldt_fecha_cierre)
								ll_new									= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new)
								dw_lista.setitem(ll_new,"cod_agte",ls_cod_agte)
								dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
								dw_lista.setitem(ll_new,"nombre",ls_nombre_comp)
								dw_lista.setitem(ll_new,"rut",ll_rut)
								dw_lista.setitem(ll_new,"fecha_ing",ldt_fecha_ing)
								dw_lista.setitem(ll_new,"estado",ls_estado)
								dw_lista.setitem(ll_new,"meta",ll_meta)
								dw_lista.setitem(ll_new,"clasif_03",ls_clasif_hist_03)
								dw_lista.setitem(ll_new,"clasif_02",ls_clasif_hist_02)
								dw_lista.setitem(ll_new,"clasif_01",ls_clasif_hist_01)
								dw_lista.setitem(ll_new,"producc",ldb_producc)
								dw_lista.setitem(ll_new,"premio",ll_premio)
								dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_cierre_ini)
								dw_lista.setitem(ll_new,"fecha_fin",ldt_fecha_cierre)
								dw_lista.setitem(ll_new,"parque",ll_cod_parque)
								dw_lista.setitem(ll_new,"cod_haber",ls_cod_contab)
								dw_lista.setitem(ll_new,"cargo",ls_cargo)
							end if
							setnull(ls_cod_agte);setnull(ll_rut)
						LOOP
					end if
				close x2;
				tot_reg													= dw_lista.RowCount()
				if tot_reg = 0 then
					messagebox("Advertencia","No Registra Premios Calidad Cartera Agentes N.F.")
					close(w_premios_calidad_cartera_agte)
				end if
			else
				DECLARE x3 CURSOR FOR
				SELECT	"RES_COMI"."COD_AGE_SUP",	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"RES_COMI"."RUT",	"AGENTES"."FECHA_INI",	"AGENTES"."ESTADO",	"AGENTES"."META",	"RES_COMI"."TOTAL_PAGO",	"AGENTES"."COD_PARQUE"  
				FROM		"RES_COMI",  "AGENTES",	"SUPERVISOR"  
				WHERE 	( "RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" ) and  
							( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
							( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab  ) AND  
							( "RES_COMI"."FECHA" = :ldt_fecha_cierre ) AND 
							( "AGENTES"."DEPTO" ='K' or "AGENTES"."DEPTO" ='X' ) AND
							( "AGENTES"."COD_PARQUE" =:ll_cod_parque )  
				ORDER BY	"AGENTES"."FECHA_INI" ASC
				USING	Trans_1;
				open x3;
				if Trans_1.sqlcode=0 then
					DO WHILE Trans_1.sqlcode=0
						fetch x3 INTO	:ls_cod_agte,	:ls_nombre,	:ls_a_paterno,	:ls_a_materno,	:ll_rut,	:ldt_fecha_ing,	:ls_estado,	:ll_meta,	:ll_premio,	:ll_cod_parque  ;
							if not isnull(ls_cod_agte) and ls_cod_agte <> '' and not isnull(ll_rut) and ll_rut > 0 then
								ls_nombre_comp							= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
								ls_clasif_hist_03						= f_clasif_hist(ls_cod_agte,ldt_fecha_03)
								ls_clasif_hist_02						= f_clasif_hist(ls_cod_agte,ldt_fecha_02)
								ls_clasif_hist_01						= f_clasif_hist(ls_cod_agte,ldt_fecha_01)
								ldb_producc								= f_produc_cierre_agte_pro_lib_aum(ls_cod_agte,ldt_fecha_cierre)
								ll_new									= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new)
								dw_lista.setitem(ll_new,"cod_agte",ls_cod_agte)
								dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
								dw_lista.setitem(ll_new,"nombre",ls_nombre_comp)
								dw_lista.setitem(ll_new,"rut",ll_rut)
								dw_lista.setitem(ll_new,"fecha_ing",ldt_fecha_ing)
								dw_lista.setitem(ll_new,"estado",ls_estado)
								dw_lista.setitem(ll_new,"meta",ll_meta)
								dw_lista.setitem(ll_new,"clasif_03",ls_clasif_hist_03)
								dw_lista.setitem(ll_new,"clasif_02",ls_clasif_hist_02)
								dw_lista.setitem(ll_new,"clasif_01",ls_clasif_hist_01)
								dw_lista.setitem(ll_new,"producc",ldb_producc)
								dw_lista.setitem(ll_new,"premio",ll_premio)
								dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_cierre_ini)
								dw_lista.setitem(ll_new,"fecha_fin",ldt_fecha_cierre)
								dw_lista.setitem(ll_new,"parque",ll_cod_parque)
								dw_lista.setitem(ll_new,"cod_haber",ls_cod_contab)
								dw_lista.setitem(ll_new,"cargo",ls_cargo)
							end if
							setnull(ls_cod_agte);setnull(ll_rut)
						LOOP
					end if
				close x3;
				tot_reg													= dw_lista.RowCount()
				if tot_reg = 0 then
					messagebox("Advertencia","No Registra Premios Calidad Cartera Agentes N.F.")
					close(w_premios_calidad_cartera_agte)
				end if
			end if
		end if
	else
		if (gl_proceso = 3 or gl_proceso=2) and (gs_depto = 'B' or gs_depto = 'R') then
			messagebox("Advertencia","Proceso Premio Calidad Cartera Agentes N.F. Con Fecha  "+string(ldt_fecha_cierre,"dd/mm/yyyy")+"  No Ha Sido Creado")
		elseif gl_proceso >= 4 then
			cb_grabar.visible											= true
			SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
			INTO 		:ldt_fecha_cierre_ini  
			FROM 		"CIERRE_VENTA"  
			WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
			USING		sqlca;
			if sqlca.sqlcode=0 then
			end if
			SELECT	MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")  
			INTO		:ldt_fecha_03  
			FROM		"CLASIFICA_HIST"  
			WHERE		"CLASIFICA_HIST"."FECHA_CLASIFICA" <= :ldt_fecha_cierre
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.object.clasif_03_t.text					= string(ldt_fecha_03,'dd/mm/yy')
				ll_mes_03												= month(date(ldt_fecha_03))
				ll_ano_03												= year(date(ldt_fecha_03))
				ls_fecha_ini_03										= '01/'+ string(ll_mes_03,'00')+ '/' +string(ll_ano_03,'0000')
				ldt_fecha_ini_03										= datetime(date(ls_fecha_ini_03))
				ldt_fecha_02											= datetime(RelativeDate(date(ldt_fecha_ini_03), - 1))
				dw_lista.object.clasif_02_t.text					= string(ldt_fecha_02,'dd/mm/yy')
				ll_mes_02												= month(date(ldt_fecha_02))
				ll_ano_02												= year(date(ldt_fecha_02))
				ls_fecha_ini_02										= '01/'+ string(ll_mes_02,'00')+ '/' +string(ll_ano_02,'0000')
				ldt_fecha_ini_02										= datetime(date(ls_fecha_ini_02))
				ldt_fecha_01											= datetime(RelativeDate(date(ldt_fecha_ini_02), - 1))
				dw_lista.object.clasif_01_t.text					= string(ldt_fecha_01,'dd/mm/yy')
				ll_mes_01												= month(date(ldt_fecha_01))
				ll_ano_01												= year(date(ldt_fecha_01))
				ls_fecha_ini_01										= '01/'+ string(ll_mes_01,'00')+ '/' +string(ll_ano_01,'0000')
				ldt_fecha_ini_01										= datetime(date(ls_fecha_ini_01))
				dw_lista.object.titulo_1.text						= 'Proceso Cálculo Premio Calidad Cartera Agentes N.F.  ( Clasificación A )' 
			end if
			DECLARE x4 CURSOR FOR
			SELECT	"COD_AGE",	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"FECHA_INI",	"ESTADO",	"COD_SUP",	"RUT",	"META"  
			FROM		"AGENTES"  
			WHERE	( "AGENTES"."ESTADO" = 'A' ) AND  
						( "AGENTES"."CLASIFICACION" = 'A' ) AND  
						( "AGENTES"."COD_PARQUE" = :ll_cod_parque ) AND  
						//( "AGENTES"."CANAL" = 'NF' OR "AGENTES"."CANAL" = 'UG'  ) AND 
						( "AGENTES"."DEPTO" = 'K' or "AGENTES"."DEPTO" = 'X' )
			ORDER BY	"AGENTES"."FECHA_INI" ASC
			USING	Trans_1;
			open x4;
			if Trans_1.sqlcode=0 then
				DO WHILE Trans_1.sqlcode=0
					fetch x4 INTO :ls_cod_agte,	:ls_nombre,	:ls_a_paterno,	:ls_a_materno,	:ldt_fecha_ing,	:ls_estado,	:ls_cod_sup,	:ll_rut,	:ll_meta;
						if not isnull(ls_cod_agte) and ls_cod_agte <> '' and not isnull(ll_rut) and ll_rut > 0 then
							ls_nombre_comp								= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
							ls_clasif_hist_03							= f_clasif_hist(ls_cod_agte,ldt_fecha_03)
							ls_clasif_hist_02							= f_clasif_hist(ls_cod_agte,ldt_fecha_02)
							ls_clasif_hist_01							= f_clasif_hist(ls_cod_agte,ldt_fecha_01)
							ldb_producc									= f_produc_cierre_agte_pro_lib_aum(ls_cod_agte,ldt_fecha_cierre)
							ll_antiguedad 								= DaysAfter(date(ldt_fecha_ing), date(ldt_fecha_cierre))
							if ls_clasif_hist_03 = 'A' and ls_clasif_hist_02 = 'A' and ls_clasif_hist_01 = 'A' and ll_antiguedad >= 180 then
								if ldb_producc >= ll_meta then
									ll_new								= dw_lista.insertrow(0)
									dw_lista.scrolltorow(ll_new)
									dw_lista.setitem(ll_new,"cod_agte",ls_cod_agte)
									dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
									dw_lista.setitem(ll_new,"nombre",ls_nombre_comp)
									dw_lista.setitem(ll_new,"rut",ll_rut)
									dw_lista.setitem(ll_new,"fecha_ing",ldt_fecha_ing)
									dw_lista.setitem(ll_new,"estado",ls_estado)
									dw_lista.setitem(ll_new,"meta",ll_meta)
									dw_lista.setitem(ll_new,"clasif_03",ls_clasif_hist_03)
									dw_lista.setitem(ll_new,"clasif_02",ls_clasif_hist_02)
									dw_lista.setitem(ll_new,"clasif_01",ls_clasif_hist_01)
									dw_lista.setitem(ll_new,"producc",ldb_producc)
									dw_lista.setitem(ll_new,"premio",ll_premio)
									dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_cierre_ini)
									dw_lista.setitem(ll_new,"fecha_fin",ldt_fecha_cierre)
									dw_lista.setitem(ll_new,"parque",ll_cod_parque)
									dw_lista.setitem(ll_new,"cod_haber",ls_cod_contab)
									dw_lista.setitem(ll_new,"cargo",ls_cargo)
								end if
							end if
						end if
						setnull(ls_cod_agte);setnull(ll_rut)
					LOOP
				end if
			close x4;
			tot_reg														= dw_lista.RowCount()
			if tot_reg = 0 then
				messagebox("Advertencia","No Registra Premio Calidad Cartera Agentes N.F.")
			end if
		end if
	end if
else
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('parque')
	elseif isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('cierre_ventas')
	end if
end if
end event

type cb_cerrar from commandbutton within w_premios_calidad_cartera_agte
integer x = 3017
integer y = 1652
integer width = 279
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_premios_calidad_cartera_sup) then
	w_premios_calidad_cartera_sup.cb_limpiar.triggerevent(clicked!)
	w_premios_calidad_cartera_sup.pb_aceptar.triggerevent(clicked!)
end if
close(w_premios_calidad_cartera_agte)
end event

type cb_imprimir from commandbutton within w_premios_calidad_cartera_agte
integer x = 2258
integer y = 1652
integer width = 279
integer height = 96
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

type dw_lista from datawindow within w_premios_calidad_cartera_agte
integer x = 32
integer y = 228
integer width = 3264
integer height = 1396
integer taborder = 40
string title = "none"
string dataobject = "dwe_premios_calidad_cartera_agte"
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

event doubleclicked;if dw_lista.RowCount() > 0 then
	cb_detalle.triggerevent(clicked!)
end if

end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type dw_seleccion from datawindow within w_premios_calidad_cartera_agte
integer x = 183
integer y = 32
integer width = 2203
integer height = 192
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccion_opcion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
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

type dw_fecha_cierre from datawindow within w_premios_calidad_cartera_agte
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

type gb_1 from groupbox within w_premios_calidad_cartera_agte
integer x = 1957
integer y = 1604
integer width = 608
integer height = 164
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

