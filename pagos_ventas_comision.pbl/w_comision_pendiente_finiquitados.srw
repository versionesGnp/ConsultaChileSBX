forward
global type w_comision_pendiente_finiquitados from window
end type
type cb_asocia_rut from commandbutton within w_comision_pendiente_finiquitados
end type
type rb_pend from radiobutton within w_comision_pendiente_finiquitados
end type
type rb_pag from radiobutton within w_comision_pendiente_finiquitados
end type
type rb_jefe from radiobutton within w_comision_pendiente_finiquitados
end type
type rb_super from radiobutton within w_comision_pendiente_finiquitados
end type
type cb_3 from commandbutton within w_comision_pendiente_finiquitados
end type
type cb_2 from commandbutton within w_comision_pendiente_finiquitados
end type
type cb_limpiar from commandbutton within w_comision_pendiente_finiquitados
end type
type cb_imprimir from commandbutton within w_comision_pendiente_finiquitados
end type
type cb_cta_cte from commandbutton within w_comision_pendiente_finiquitados
end type
type fecha_comi from editmask within w_comision_pendiente_finiquitados
end type
type pb_aceptar from picturebutton within w_comision_pendiente_finiquitados
end type
type cb_cerrar from commandbutton within w_comision_pendiente_finiquitados
end type
type dw_lista from datawindow within w_comision_pendiente_finiquitados
end type
type gb_1 from groupbox within w_comision_pendiente_finiquitados
end type
type gb_3 from groupbox within w_comision_pendiente_finiquitados
end type
type rb_agte from radiobutton within w_comision_pendiente_finiquitados
end type
type gb_4 from groupbox within w_comision_pendiente_finiquitados
end type
type dw_inactivo from datawindow within w_comision_pendiente_finiquitados
end type
type gb_2 from groupbox within w_comision_pendiente_finiquitados
end type
end forward

global type w_comision_pendiente_finiquitados from window
integer width = 3854
integer height = 2508
boolean titlebar = true
string title = "Revisión Comisiones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_asocia_rut cb_asocia_rut
rb_pend rb_pend
rb_pag rb_pag
rb_jefe rb_jefe
rb_super rb_super
cb_3 cb_3
cb_2 cb_2
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_cta_cte cb_cta_cte
fecha_comi fecha_comi
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
gb_3 gb_3
rb_agte rb_agte
gb_4 gb_4
dw_inactivo dw_inactivo
gb_2 gb_2
end type
global w_comision_pendiente_finiquitados w_comision_pendiente_finiquitados

type variables
Long	il_mes,il_ano,il_row
end variables

forward prototypes
public function long wf_pago_post (datetime adt_fec_ini, datetime adt_fec_fin, string as_base, string as_serie, long al_numero, string as_tipo_mov)
public function double wf_deveng (string as_base, string as_serie, long al_numero, string as_estado_comi, long al_pie, long al_cta)
end prototypes

public function long wf_pago_post (datetime adt_fec_ini, datetime adt_fec_fin, string as_base, string as_serie, long al_numero, string as_tipo_mov);long	ll_cta_pagos
connect using Trans_4;
//wf_pago_post(ldt_fec_ini,ldt_fec_fin,ls_base,ls_serie,ll_numero,ls_tipo_mov)
SELECT	count("INGRESO"."BASE")  
INTO 		:ll_cta_pagos  
FROM		"INGRESO"
WHERE 	"INGRESO"."FECHA_PAGO" > :adt_fec_ini AND
			"INGRESO"."FECHA_PAGO" <= :adt_fec_fin AND  
			"INGRESO"."BASE" = :as_base AND  
			"INGRESO"."SERIE" = :as_serie AND  
			"INGRESO"."CONTRATO" = :al_numero AND  
			"INGRESO"."PAGO_HIST" = 'A' AND  
			"INGRESO"."TIPO_MOV" = :as_tipo_mov
USING		Trans_4;
if Trans_4.sqlcode=0 then
	if not isnull(ll_cta_pagos) and ll_cta_pagos>0 then
		ll_cta_pagos							= ll_cta_pagos
	else
		ll_cta_pagos							= 0
	end if
else
	ll_cta_pagos								= 0
end if
if isnull(ll_cta_pagos) then ll_cta_pagos = 0
Return ll_cta_pagos
disconnect using Trans_4;
end function

public function double wf_deveng (string as_base, string as_serie, long al_numero, string as_estado_comi, long al_pie, long al_cta);double	ldb_pie,ldb_cta_1,ldb_cta_2,ldb_cta_3,ldb_cta_4,ldb_cta_5,ldb_cta_6,ldb_cta_7,ldb_cta_8,ldb_cta_9,ldb_porce_pago   

//wf_deveng(as_base,as_serie,al_numero,as_estado_comi,al_pie,al_cta,adt_fec_cierre)
SELECT	"C_PIE",		"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA"  
INTO 		:ldb_pie,	:ldb_cta_1,		:ldb_cta_2,		:ldb_cta_3,		:ldb_cta_4,	:ldb_cta_5,	:ldb_cta_6,	:ldb_cta_7,		:ldb_cta_8,	:ldb_cta_9   
FROM		"COMISION_PROMESA"  
WHERE 	( "COMISION_PROMESA"."BASE" = :as_base ) AND  
			( "COMISION_PROMESA"."SERIE" = :as_serie ) AND  
			( "COMISION_PROMESA"."NUMERO" = :al_numero )
USING		sqlca;
if sqlca.sqlcode=0 then
	if isnull(ldb_pie) then
		ldb_pie			= 0
	else
		ldb_pie			= ldb_pie
	end if
	if isnull(ldb_cta_1) then
		ldb_cta_1		= 0
	else
		ldb_cta_1		= ldb_cta_1
	end if
	if isnull(ldb_cta_2) then
		ldb_cta_2		= 0
	else
		ldb_cta_2		= ldb_cta_2
	end if
	if isnull(ldb_cta_3) then
		ldb_cta_3		= 0
	else
		ldb_cta_3		= ldb_cta_3
	end if
	if isnull(ldb_cta_4) then
		ldb_cta_4		= 0
	else
		ldb_cta_4		= ldb_cta_4
	end if
	if isnull(ldb_cta_5) then
		ldb_cta_5		= 0
	else
		ldb_cta_5		= ldb_cta_5
	end if
	if isnull(ldb_cta_6) then
		ldb_cta_6		= 0
	else
		ldb_cta_6		= ldb_cta_6
	end if
	if isnull(ldb_cta_7) then
		ldb_cta_7		= 0
	else
		ldb_cta_7		= ldb_cta_7
	end if
	if isnull(ldb_cta_8) then
		ldb_cta_8		= 0
	else
		ldb_cta_8		= ldb_cta_8
	end if
	if isnull(ldb_cta_9) then
		ldb_cta_9		= 0
	else
		ldb_cta_9		= ldb_cta_9
	end if
end if
if as_estado_comi='N' then
	if al_pie=0  then
		if al_cta=0 then
			ldb_porce_pago			= ldb_pie
		elseif al_cta=1 then
			ldb_porce_pago			= ldb_pie + ldb_cta_1
		elseif al_cta=2 then
			ldb_porce_pago			= ldb_pie + ldb_cta_1 + ldb_cta_2
		elseif al_cta=3 then
			ldb_porce_pago			= ldb_pie + ldb_cta_1 + ldb_cta_2 + ldb_cta_3
		elseif al_cta=4 then
			ldb_porce_pago			= ldb_pie + ldb_cta_1 + ldb_cta_2 + ldb_cta_3 + ldb_cta_4
		elseif al_cta=5 then
			ldb_porce_pago			= ldb_pie + ldb_cta_1 + ldb_cta_2 + ldb_cta_3 + ldb_cta_4 + ldb_cta_5
		elseif al_cta=6 then
			ldb_porce_pago			= ldb_pie + ldb_cta_1 + ldb_cta_2 + ldb_cta_3 + ldb_cta_4 + ldb_cta_5 + ldb_cta_6
		elseif al_cta=7 then
			ldb_porce_pago			= ldb_pie + ldb_cta_1 + ldb_cta_2 + ldb_cta_3 + ldb_cta_4 + ldb_cta_5 + ldb_cta_6 + ldb_cta_7
		elseif al_cta=8 then
			ldb_porce_pago			= ldb_pie + ldb_cta_1 + ldb_cta_2 + ldb_cta_3 + ldb_cta_4 + ldb_cta_5 + ldb_cta_6 + ldb_cta_7 + ldb_cta_8
		elseif al_cta=9 then
			ldb_porce_pago			= ldb_pie + ldb_cta_1 + ldb_cta_2 + ldb_cta_3 + ldb_cta_4 + ldb_cta_5 + ldb_cta_6 + ldb_cta_7 + ldb_cta_8 + ldb_cta_9
		end if
	end if
elseif as_estado_comi='S' then
	if al_pie=0  then
		if al_cta=0 then
			ldb_porce_pago			= ldb_pie
		elseif al_cta=1 then
			ldb_porce_pago			= ldb_cta_1
		elseif al_cta=2 then
			ldb_porce_pago			= ldb_cta_2
		elseif al_cta=3 then
			ldb_porce_pago			= ldb_cta_3
		elseif al_cta=4 then
			ldb_porce_pago			= ldb_cta_4
		elseif al_cta=5 then
			ldb_porce_pago			= ldb_cta_5
		elseif al_cta=6 then
			ldb_porce_pago			= ldb_cta_6
		elseif al_cta=7 then
			ldb_porce_pago			= ldb_cta_7
		elseif al_cta=8 then
			ldb_porce_pago			= ldb_cta_8
		elseif al_cta=9 then
			ldb_porce_pago			= ldb_cta_9
		end if
	end if
end if
if isnull(ldb_porce_pago) then ldb_porce_pago = 0
Return ldb_porce_pago

end function

on w_comision_pendiente_finiquitados.create
this.cb_asocia_rut=create cb_asocia_rut
this.rb_pend=create rb_pend
this.rb_pag=create rb_pag
this.rb_jefe=create rb_jefe
this.rb_super=create rb_super
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_cta_cte=create cb_cta_cte
this.fecha_comi=create fecha_comi
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_3=create gb_3
this.rb_agte=create rb_agte
this.gb_4=create gb_4
this.dw_inactivo=create dw_inactivo
this.gb_2=create gb_2
this.Control[]={this.cb_asocia_rut,&
this.rb_pend,&
this.rb_pag,&
this.rb_jefe,&
this.rb_super,&
this.cb_3,&
this.cb_2,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_cta_cte,&
this.fecha_comi,&
this.pb_aceptar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.gb_3,&
this.rb_agte,&
this.gb_4,&
this.dw_inactivo,&
this.gb_2}
end on

on w_comision_pendiente_finiquitados.destroy
destroy(this.cb_asocia_rut)
destroy(this.rb_pend)
destroy(this.rb_pag)
destroy(this.rb_jefe)
destroy(this.rb_super)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_cta_cte)
destroy(this.fecha_comi)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.rb_agte)
destroy(this.gb_4)
destroy(this.dw_inactivo)
destroy(this.gb_2)
end on

event open;datetime	ldt_fecha_comi
connect using Trans_1;
connect using Trans_2;
connect using Trans_4;
gf_centrar(w_comision_pendiente_finiquitados)
dw_lista.dataobject							= 'dwe_comisiones_finiquitados'
dw_lista.settransobject(sqlca)
dw_inactivo.dataobject						= 'dwe_inactivos'
dw_inactivo.getchild('codigo',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('A')=0 then
	idw_detalle.insertrow(0)
end if
dw_inactivo.insertrow(0)

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_asocia_rut from commandbutton within w_comision_pendiente_finiquitados
integer x = 498
integer y = 2268
integer width = 384
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&lación * Rut"
end type

event clicked;if dw_lista.getrow() > 0 then 
	gi_rut = dw_lista.getitemnumber(dw_lista.getrow(),'rut_cliente')
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if
end event

type rb_pend from radiobutton within w_comision_pendiente_finiquitados
integer x = 64
integer y = 84
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
string text = "Pendientes"
boolean checked = true
end type

event clicked;dw_lista.reset()
end event

type rb_pag from radiobutton within w_comision_pendiente_finiquitados
integer x = 64
integer y = 152
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
string text = "Pagadas"
end type

event clicked;dw_lista.reset()
end event

type rb_jefe from radiobutton within w_comision_pendiente_finiquitados
integer x = 1431
integer y = 24
integer width = 475
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jefe de ventas"
end type

event clicked;dw_lista.reset()
dw_inactivo.reset()
dw_inactivo.getchild('codigo',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('J')=0 then
	idw_detalle.insertrow(0)
end if
dw_inactivo.insertrow(0)
end event

type rb_super from radiobutton within w_comision_pendiente_finiquitados
integer x = 974
integer y = 24
integer width = 389
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Supervisor"
end type

event clicked;dw_lista.reset()
dw_inactivo.reset()
dw_inactivo.getchild('codigo',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('S')=0 then
	idw_detalle.insertrow(0)
end if
dw_inactivo.insertrow(0)
end event

type cb_3 from commandbutton within w_comision_pendiente_finiquitados
integer x = 1650
integer y = 2268
integer width = 261
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_2 from commandbutton within w_comision_pendiente_finiquitados
integer x = 1390
integer y = 2268
integer width = 261
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_limpiar from commandbutton within w_comision_pendiente_finiquitados
integer x = 2418
integer y = 2268
integer width = 261
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_comision_pendiente_finiquitados.triggerevent(open!)
end event

type cb_imprimir from commandbutton within w_comision_pendiente_finiquitados
event ue_mousemove pbm_mousemove
integer x = 2034
integer y = 2268
integer width = 261
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then f_Print( dw_lista )

end event

type cb_cta_cte from commandbutton within w_comision_pendiente_finiquitados
integer x = 41
integer y = 2268
integer width = 453
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;if dw_lista.rowcount() > 0 then
	if il_row>0 then
		gi_numero 	= dw_lista.getitemnumber(il_row,'contrato')
		gs_base		= dw_lista.getitemstring(il_row,'base')
		gs_serie		= dw_lista.getitemstring(il_row,'serie')
		gi_rut 		= dw_lista.GetItemNumber(il_row, "rut_cliente")
		SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO"  
		INTO 		:gs_nombres,			:gs_apellido_paterno,	:gs_apellido_materno,	:gl_cod_parque_cta,		:gs_estado   
		FROM 		"CADENA",	"CLIENTE"  
		WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero ) AND  
				 ( "CADENA"."RUT" = :gi_rut ) )   
		USING		sqlca;
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
		END CHOOSE
	else
		messagebox("Advertencia","Debe listar Contrato y Seleccionar ")
	end if
end if
end event

type fecha_comi from editmask within w_comision_pendiente_finiquitados
integer x = 2135
integer y = 112
integer width = 416
integer height = 92
integer textsize = -9
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
string mask = "dd/mm/yyyy"
end type

type pb_aceptar from picturebutton within w_comision_pendiente_finiquitados
integer x = 2638
integer y = 100
integer width = 155
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_codigo,ls_cargo,ls_estado_comi,ls_base,ls_serie,ls_est_cad,&
			ls_uso,ls_moneda,ls_area,ls_desc_cargo,ls_nomb,ls_a_pater,ls_a_mater,&
			ls_mes_pag,ls_paga,ls_clas_vta
long		ll_rut_cli,ll_cod_parque_cont,ll_new,ll_rut_age,ll_mes_pag,&
			ll_nulo,ll_tot_reg,ll_cta_pact_pie,ll_pie_pend,ll_cta_pag_s,&
			ll_cta_pie_post,ll_cta_cta_post,ll_cod_parque_age
datetime	ldt_fec_ing,ldt_fec_ter,ldt_fecha_ult_com,ldt_nulo,ldt_fec_ult_proc,ldt_fec_cierre
double	ldb_numero,ldb_tot_pag,ldb_porce_vta,ldb_precio,ldb_suma_comi,ldb_suma_porce,&
			ldb_precio_peso,ldb_por_ing_caja,ldb_valor_uf,ldb_porce_pago,ldb_monto_a_pago  

setnull(ldt_nulo);setnull(ll_nulo)
dw_lista.reset()
dw_inactivo.accepttext()
if rb_agte.checked=true then
	ls_cargo										= 'A'
	ls_desc_cargo								= 'Agente'
elseif rb_super.checked=true then
	ls_cargo										= 'S'
	ls_desc_cargo								= 'Supervisor'
elseif rb_jefe.checked=true then
	ls_cargo										= 'J'
	ls_desc_cargo								= 'Jefe Ventas'
end if
ls_codigo	                     						= dw_inactivo.getitemstring(1,'codigo')
ldt_fec_ult_proc								= datetime(date(fecha_comi.text),time('00:00:00'))
SetPointer(HourGlass!)
if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fec_ult_proc) then
	if rb_pag.checked=true then
		dw_lista.dataobject					= 'dw_comisiones_finiquitados'
		dw_lista.settransobject(sqlca)
		ll_tot_reg								= dw_lista.retrieve(ls_codigo,ldt_fec_ult_proc)
		dw_lista.object.usuario.text			= gs_user
		if ll_tot_reg=0 then
			messagebox("Advertecia","No Registra Datos")
		end if
	elseif rb_pend.checked=true then
		dw_lista.dataobject					= 'dwe_comisiones_finiquitados'
		dw_lista.settransobject(sqlca)
		if ls_cargo='A' then
			DECLARE x1 CURSOR FOR
			SELECT		"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."ESTADO",	"CADENA"."RUT",	"CADENA"."COD_PARQUE",	"OFERTA_V"."USO",	"OFERTA_V"."PORCE_VENTA",	"PAGO_OFERTA"."PRECIO",	"PAGO_OFERTA"."MONEDA",	"PAGO_OFERTA"."AREA",	"OFERTA_V"."ESTADO_COMI",	"PAGO_OFERTA"."CTAS_PACTADAS_PIE",	"OFERTA_V"."CLASIFICA_VENTA","OFERTA_V"."CIERRE_VENTA" 
			FROM 		"CADENA","OFERTA_V","PAGO_OFERTA"  
			WHERE 		"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
							"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
							"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
							"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
							"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
							"OFERTA_V"."COD_AGE" = :ls_codigo
			ORDER BY	"OFERTA_V"."CIERRE_VENTA",
							"OFERTA_V"."ESTADO_COMI"
			USING		sqlca;
		elseif ls_cargo='S' then
			DECLARE x2 CURSOR FOR
			SELECT		"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."ESTADO",	"CADENA"."RUT",	"CADENA"."COD_PARQUE",	"OFERTA_V"."USO",	"OFERTA_V"."PORCE_SUP",	"PAGO_OFERTA"."PRECIO",	"PAGO_OFERTA"."MONEDA",	"PAGO_OFERTA"."AREA",	"OFERTA_V"."ESTADO_COMI_SUP",	"PAGO_OFERTA"."CTAS_PACTADAS_PIE",	"OFERTA_V"."CLASIFICA_VENTA","OFERTA_V"."CIERRE_VENTA"  
			FROM 		"CADENA","OFERTA_V","PAGO_OFERTA"  
			WHERE 		"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
							"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
							"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
							"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
							"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
							"OFERTA_V"."COD_SUP" = :ls_codigo
			ORDER BY 	"OFERTA_V"."CIERRE_VENTA",
							"OFERTA_V"."ESTADO_COMI_SUP"			
			USING		sqlca;
		elseif ls_cargo='J' then
			DECLARE x3 CURSOR FOR
			SELECT		"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."ESTADO",	"CADENA"."RUT",	"CADENA"."COD_PARQUE",	"OFERTA_V"."USO",	"OFERTA_V"."PORCE_JEFE",	"PAGO_OFERTA"."PRECIO",	"PAGO_OFERTA"."MONEDA",	"PAGO_OFERTA"."AREA",	"OFERTA_V"."ESTADO_COMI_JV",	"PAGO_OFERTA"."CTAS_PACTADAS_PIE",	"OFERTA_V"."CLASIFICA_VENTA","OFERTA_V"."CIERRE_VENTA" 
			FROM 		"CADENA","OFERTA_V","PAGO_OFERTA"  
			WHERE 		"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
							"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
							"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
							"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
							"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
							"OFERTA_V"."COD_JEF" = :ls_codigo
			ORDER BY	"OFERTA_V"."CIERRE_VENTA",
							"OFERTA_V"."ESTADO_COMI_JV"			
			USING		sqlca;
		end if
		if ls_cargo='A' then
			open x1;
		elseif ls_cargo='S' then
			open x2;
		elseif ls_cargo='J' then
			open x3;
		end if
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				if ls_cargo='A' then
					fetch x1 INTO	:ls_base,:ls_serie,:ldb_numero,:ls_est_cad,:ll_rut_cli,:ll_cod_parque_cont,:ls_uso,:ldb_porce_vta,:ldb_precio,:ls_moneda,:ls_area,:ls_estado_comi,:ll_cta_pact_pie,:ls_clas_vta, :ldt_fec_cierre;
				elseif ls_cargo='S' then
					fetch x2 INTO	:ls_base,:ls_serie,:ldb_numero,:ls_est_cad,:ll_rut_cli,:ll_cod_parque_cont,:ls_uso,:ldb_porce_vta,:ldb_precio,:ls_moneda,:ls_area,:ls_estado_comi,:ll_cta_pact_pie,:ls_clas_vta, :ldt_fec_cierre;
				elseif ls_cargo='J' then
					fetch x3 INTO	:ls_base,:ls_serie,:ldb_numero,:ls_est_cad,:ll_rut_cli,:ll_cod_parque_cont,:ls_uso,:ldb_porce_vta,:ldb_precio,:ls_moneda,:ls_area,:ls_estado_comi,:ll_cta_pact_pie,:ls_clas_vta, :ldt_fec_cierre;
				end if
				if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 and not isnull(ls_estado_comi) and ls_estado_comi<>'' and &
					not isnull(ls_est_cad) and ls_est_cad<>'' and not isnull(ll_rut_cli) and ll_rut_cli>0 and not isnull(ll_cod_parque_cont) and ll_cod_parque_cont>0 and &
					not isnull(ls_uso) and ls_uso<>'' and not isnull(ldb_precio) and ldb_precio>0 and not isnull(ls_moneda) and ls_moneda<>'' and not isnull(ls_area) and ls_area<>'' then
					SELECT	"AGENTES"."RUT",	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"AGENTES"."FECHA_INI",	"AGENTES"."FECHA_FIN",	"AGENTES"."COD_PARQUE"  
					INTO		:ll_rut_age,		:ls_nomb,				:ls_a_pater,				:ls_a_mater,				:ldt_fec_ing,				:ldt_fec_ter,				:ll_cod_parque_age 
					FROM		"AGENTES"  
					WHERE 	"AGENTES"."COD_AGE" = :ls_codigo AND  
								"AGENTES"."ESTADO" = 'I' AND  
								"AGENTES"."CARGO" = :ls_cargo
					UNION   
					SELECT	"SUPERVISOR"."RUT",	"SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO",	"SUPERVISOR"."FECHA_ING",	"SUPERVISOR"."FECHA_FIN",	"SUPERVISOR"."COD_PARQUE"  
					FROM		"SUPERVISOR"  
					WHERE 	"SUPERVISOR"."COD_SUP" = :ls_codigo AND  
								"SUPERVISOR"."ESTADO" = 'I' AND  
								"SUPERVISOR"."CARGO" = :ls_cargo
					UNION   
					SELECT	"JEFE_VENTAS"."RUT",	"JEFE_VENTAS"."NOMBRE",	"JEFE_VENTAS"."A_PATERNO",	"JEFE_VENTAS"."A_MATERNO",	"JEFE_VENTAS"."FECHA_ING" ,	"JEFE_VENTAS"."FECHA_FIN",	"JEFE_VENTAS"."COD_PARQUE"   
					FROM		"JEFE_VENTAS"  
					WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_codigo AND  
								"JEFE_VENTAS"."ESTADO" = 'I' AND  
								"JEFE_VENTAS"."CARGO" = :ls_cargo
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						if not isnull(ll_rut_age) and ll_rut_age>0 and not isnull(ls_nomb) and ls_nomb<>'' and not isnull(ls_a_pater) and ls_a_pater<>'' and not isnull(ls_a_mater) and ls_a_mater<>'' and not isnull(ldt_fec_ing)	and not isnull(ldt_fec_ter) then
							//ldt_fec_ter						= datetime(date(string('15/03/2013')))
							SELECT	sum("INGRESO"."MONTO")  
							INTO 		:ldb_tot_pag  
							FROM		"INGRESO"  
							WHERE 	"INGRESO"."FECHA_PAGO" <= :ldt_fec_ter AND  
										"INGRESO"."BASE" = :ls_base AND  
										"INGRESO"."SERIE" = :ls_serie AND  
										"INGRESO"."CONTRATO" = :ldb_numero AND  
										"INGRESO"."PAGO_HIST" = 'A' AND  
										( "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' )
							USING		Trans_2;
							if Trans_2.sqlcode=0 then
								if not isnull(ldb_tot_pag) and ldb_tot_pag>0 then
									ldb_tot_pag							= ldb_tot_pag
								else
									ldb_tot_pag							= 0
								end if
							else
								ldb_tot_pag								= 0
							end if
							SELECT	"TAB_UF"."VALOR_UF"  
    							INTO		:ldb_valor_uf  
    							FROM		"TAB_UF"  
   							WHERE		"TAB_UF"."FECHA_UF" = :ldt_fec_ter
							USING		Trans_2;
							if Trans_2.sqlcode=0 then
								if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
									ldb_valor_uf						= ldb_valor_uf
								else
									ldb_valor_uf						= 0
								end if
							else
								ldb_valor_uf							= 0
							end if
							SELECT	max("FECHA"),			sum("TOTAL_PAGO"),	sum("PORC_VENTA"), 	max("MES")   
							INTO		:ldt_fecha_ult_com,	:ldb_suma_comi,			:ldb_suma_porce,		:ls_mes_pag    
							FROM		"RES_COMI"  
							WHERE	"COD_AGE_SUP" = :ls_codigo AND
										"SERIE" = :ls_serie AND  
										"CONTRATO" = :ldb_numero AND  
										"FECHA" <= :ldt_fec_ter AND  
										("COD_CONTABLE" = '022' OR "COD_CONTABLE" = '023' OR "COD_CONTABLE" = '036' OR "COD_CONTABLE" = '037' OR "COD_CONTABLE" = '089' OR "COD_CONTABLE" = '090')
							USING		Trans_2;
							if Trans_2.sqlcode=0 then
								if not isnull(ldt_fecha_ult_com) and not isnull(ldb_suma_comi) and ldb_suma_comi>0 and not isnull(ldb_suma_porce) and ldb_suma_porce>0 and not isnull(ls_mes_pag) and ls_mes_pag<>'' then
									ldt_fecha_ult_com					= ldt_fecha_ult_com
									ldb_suma_comi						= ldb_suma_comi
									ldb_suma_porce					= ldb_suma_porce
									ll_mes_pag							= long(ls_mes_pag)
								else
									ldt_fecha_ult_com					= ldt_nulo
									ldb_suma_comi						= 0
									ldb_suma_porce					= 0
									ll_mes_pag							= long(0)
								end if
							end if
							
							dw_lista.object.usuario.text			= gs_user
							dw_lista.object.tituto_02.text		= 'Período Evaluado Comisiones Pendientes Desde: '+string(ldt_fec_ult_proc,'dd/mm/yyyy')+' Hasta: '+string(ldt_fec_ter,'dd/mm/yyyy')
							
							ll_new										= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,"cargo",ls_cargo)
							dw_lista.setitem(ll_new,"base",ls_base)
							dw_lista.setitem(ll_new,"serie",ls_serie)
							dw_lista.setitem(ll_new,"contrato",ldb_numero)
							dw_lista.setitem(ll_new,"estado_cad",ls_est_cad)
							dw_lista.setitem(ll_new,"rut_cliente",ll_rut_cli)
							dw_lista.setitem(ll_new,"cod_parque_contr",ll_cod_parque_cont)
							dw_lista.setitem(ll_new,"cod_parque_age",ll_cod_parque_cont)
							dw_lista.setitem(ll_new,"total_pagado",ldb_tot_pag)
							dw_lista.setitem(ll_new,"uso",ls_uso)
							dw_lista.setitem(ll_new,"porce_venta",ldb_porce_vta)
							dw_lista.setitem(ll_new,"precio",ldb_precio)
							dw_lista.setitem(ll_new,"moneda",ls_moneda)
							dw_lista.setitem(ll_new,"area",ls_area)
							dw_lista.setitem(ll_new,"estado_comi",ls_estado_comi)
							dw_lista.setitem(ll_new,"cod_age",ls_codigo)
							dw_lista.setitem(ll_new,"rut_age",ll_rut_age)
							dw_lista.setitem(ll_new,"nombre",ls_nomb)
							dw_lista.setitem(ll_new,"a_paterno",ls_a_pater)
							dw_lista.setitem(ll_new,"a_materno",ls_a_mater)
							dw_lista.setitem(ll_new,"fecha_ing",ldt_fec_ing)
							dw_lista.setitem(ll_new,"fecha_ter",ldt_fec_ter)
							dw_lista.setitem(ll_new,"fecha",ldt_fecha_ult_com)
							dw_lista.setitem(ll_new,"porce_pago",ldb_suma_porce)
							dw_lista.setitem(ll_new,"monto_comi",ldb_suma_comi)
							dw_lista.setitem(ll_new,"valor_uf",ldb_valor_uf)
							dw_lista.setitem(ll_new,"clas_vta",ls_clas_vta)
							dw_lista.setitem(ll_new,"ult_cta_paga",ll_mes_pag)
							dw_lista.setitem(ll_new,"cierre_venta",ldt_fec_cierre)
							ll_cta_pag_s								= wf_pago_post(ldt_fec_ing,ldt_fec_ter,ls_base,ls_serie,ldb_numero,'E')
							dw_lista.setitem(ll_new,"ctas_pag_s",ll_cta_pag_s)
							if ls_moneda='1' then
								ldb_precio_peso						= ldb_precio
							else
								ldb_precio_peso						= ldb_precio * ldb_valor_uf
							end if
							ldb_por_ing_caja							= ldb_tot_pag / ldb_precio_peso * 100
							dw_lista.setitem(ll_new,"porce_ing_caja",ldb_por_ing_caja)
							if ll_cta_pact_pie>0 then
								ll_pie_pend								= ll_cta_pact_pie - wf_pago_post(ldt_fec_ing,ldt_fec_ter,ls_base,ls_serie,ldb_numero,'A')
							else
								ll_pie_pend								= 0
							end if
							dw_lista.setitem(ll_new,"pie_pend",ll_pie_pend)
							if ls_est_cad= 'V' or ls_est_cad='C' then
								if ls_estado_comi='S' or ls_estado_comi='N' then
									ll_cta_pie_post						= wf_pago_post(ldt_fec_ult_proc,ldt_fec_ter,ls_base,ls_serie,ldb_numero,'A')
									ll_cta_cta_post						= wf_pago_post(ldt_fec_ult_proc,ldt_fec_ter,ls_base,ls_serie,ldb_numero,'E')
									dw_lista.setitem(ll_new,"post_pie",ll_cta_pie_post)
									dw_lista.setitem(ll_new,"post_cta",ll_cta_cta_post)
									if ldt_fec_cierre<=datetime(date(string('31/01/2013'))) then
										if ls_estado_comi='N' then
											ll_mes_pag							= 0
											if ls_cargo='A' then
												if ldb_por_ing_caja > 9.98 then
													ls_paga						= 'S'
												else
													if ll_pie_pend=0 then
														ls_paga					= 'S'
													else
														ls_paga					= 'N'
													end if
												end if
											end if
											if ls_paga='S' then
												ldb_porce_pago					= wf_deveng(ls_base,ls_serie,ldb_numero,ls_estado_comi,ll_pie_pend,ll_cta_pag_s)
												ldb_monto_a_pago				= ldb_precio_peso * ldb_porce_pago / 100
											else
												ldb_monto_a_pago				= 0
											end if
										elseif ls_estado_comi='S' then
											ll_mes_pag							= ll_mes_pag + ll_cta_cta_post
											if ll_cta_pie_post>0 or ll_cta_cta_post>0 then
												ls_paga								= 'S'
											else
												ls_paga								= 'N'
											end if
											if ls_paga='S' then
												ldb_porce_pago					= wf_deveng(ls_base,ls_serie,ldb_numero,ls_estado_comi,ll_pie_pend,ll_mes_pag)			
												ldb_monto_a_pago				= ldb_precio_peso * ldb_porce_pago / 100
											else
												ldb_monto_a_pago				= 0
											end if
										end if
									else
										if ls_estado_comi='N' then
											ldb_porce_pago						= ldb_porce_vta	
											ldb_monto_a_pago					= ldb_precio_peso * ldb_porce_pago / 100
										end if
									end if
								else
									ls_paga											= 'P'
									ldb_monto_a_pago							= 0
								end if
							else
								ls_paga												= 'N'
								ldb_monto_a_pago								= 0	
							end if
							dw_lista.setitem(ll_new,"paga_comi",ls_paga)
							dw_lista.setitem(ll_new,"monto_a_pago",ldb_monto_a_pago)
							dw_lista.accepttext()
						end if
					end if
				end if
				setnull(ls_base);setnull(ls_serie);setnull(ldb_numero);setnull(ls_est_cad);setnull(ll_rut_cli);setnull(ll_cod_parque_cont);&
				setnull(ldb_tot_pag);setnull(ls_uso);setnull(ldb_porce_vta);setnull(ldb_precio);setnull(ls_moneda);setnull(ls_area);&
				setnull(ls_estado_comi);setnull(ldb_porce_pago);setnull(ldb_monto_a_pago)
			LOOP
		end if
		if ls_cargo='A' then
			close x1;
		elseif ls_cargo='S' then
			close x2;
		elseif ls_cargo='J' then
			close x3;
		end if
	end if
else
	messagebox("Advertencia","Debe Seleccionar Código "+ls_desc_cargo)
end if
SetPointer(Arrow!)
end event

type cb_cerrar from commandbutton within w_comision_pendiente_finiquitados
integer x = 3543
integer y = 2268
integer width = 261
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_pendiente_finiquitados)
end event

type dw_lista from datawindow within w_comision_pendiente_finiquitados
integer x = 32
integer y = 256
integer width = 3771
integer height = 1968
integer taborder = 30
string title = "none"
string dataobject = "dwe_comisiones_finiquitados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()

close(w_cuenta_corriente_oferta)
close(w_cuenta_corriente_liberador)

end event

event doubleclicked;if il_row>0 then
		gi_numero 	= dw_lista.getitemnumber(il_row,'oferta_v_nro_oferta')
		gs_base		= dw_lista.getitemstring(il_row,'cadena_codigo')
		gs_serie		= dw_lista.getitemstring(il_row,'oferta_v_serie')
		gi_rut 		= dw_lista.GetItemNumber(il_row, "oferta_v_rut")
		SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO"  
		INTO 		:gs_nombres,			:gs_apellido_paterno,	:gs_apellido_materno,	:gl_cod_parque_cta,		:gs_estado   
		FROM 		"CADENA",	"CLIENTE"  
		WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero ) AND  
				 ( "CADENA"."RUT" = :gi_rut ) )   
		USING		sqlca;
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
		END CHOOSE
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

close(w_cuenta_corriente_oferta)
close(w_cuenta_corriente_liberador)

end event

type gb_1 from groupbox within w_comision_pendiente_finiquitados
integer x = 32
integer y = 28
integer width = 471
integer height = 212
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
string text = "Estado Comisión"
end type

type gb_3 from groupbox within w_comision_pendiente_finiquitados
integer x = 1358
integer y = 2216
integer width = 1358
integer height = 164
integer taborder = 40
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_agte from radiobutton within w_comision_pendiente_finiquitados
integer x = 567
integer y = 24
integer width = 329
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente"
boolean checked = true
end type

event clicked;dw_lista.reset()
dw_inactivo.reset()
dw_inactivo.getchild('codigo',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('A')=0 then
	idw_detalle.insertrow(0)
end if
dw_inactivo.insertrow(0)

end event

type gb_4 from groupbox within w_comision_pendiente_finiquitados
integer x = 2098
integer y = 32
integer width = 498
integer height = 212
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
string text = "Fec.Ult. Proceso:"
end type

type dw_inactivo from datawindow within w_comision_pendiente_finiquitados
integer x = 558
integer y = 108
integer width = 1504
integer height = 108
integer taborder = 30
string title = "none"
string dataobject = "dwe_inactivos"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_codigo
datetime	ldt_fecha_comi

dw_inactivo.accepttext()
ls_codigo						= dw_inactivo.getitemstring(1,'codigo')

SELECT	MAX("RES_COMI"."FECHA") 
INTO		:ldt_fecha_comi  
FROM 		"RES_COMI"  
WHERE		"COD_AGE_SUP" = :ls_codigo and
			( "COD_CONTABLE" = '022' OR "COD_CONTABLE" = '023' OR "COD_CONTABLE" = '036' OR "COD_CONTABLE" = '037' OR "COD_CONTABLE" = '089' OR "COD_CONTABLE" = '090')
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldt_fecha_comi) then
		fecha_comi.text		= string(ldt_fecha_comi,'dd/mm/yyyy')
	end if
end if
end event

type gb_2 from groupbox within w_comision_pendiente_finiquitados
integer x = 535
integer y = 28
integer width = 1536
integer height = 212
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

