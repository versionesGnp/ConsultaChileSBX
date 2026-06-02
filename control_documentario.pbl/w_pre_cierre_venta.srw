forward
global type w_pre_cierre_venta from window
end type
type cb_asocia_rut from commandbutton within w_pre_cierre_venta
end type
type rb_todos from radiobutton within w_pre_cierre_venta
end type
type cb_digitacion from commandbutton within w_pre_cierre_venta
end type
type cb_valida from commandbutton within w_pre_cierre_venta
end type
type cb_grabar from commandbutton within w_pre_cierre_venta
end type
type cb_valida_cierre from commandbutton within w_pre_cierre_venta
end type
type cb_modif_control_doct from commandbutton within w_pre_cierre_venta
end type
type rb_jefe from radiobutton within w_pre_cierre_venta
end type
type rb_super from radiobutton within w_pre_cierre_venta
end type
type cb_ctrol_doc from commandbutton within w_pre_cierre_venta
end type
type cb_cta_cte from commandbutton within w_pre_cierre_venta
end type
type hpb_1 from hprogressbar within w_pre_cierre_venta
end type
type st_porc from statictext within w_pre_cierre_venta
end type
type pb_1 from picturebutton within w_pre_cierre_venta
end type
type dw_periodo from datawindow within w_pre_cierre_venta
end type
type cb_1 from commandbutton within w_pre_cierre_venta
end type
type cb_2 from commandbutton within w_pre_cierre_venta
end type
type cb_filtro from commandbutton within w_pre_cierre_venta
end type
type cb_imprimir from commandbutton within w_pre_cierre_venta
end type
type cb_cerrar from commandbutton within w_pre_cierre_venta
end type
type gb_1 from groupbox within w_pre_cierre_venta
end type
type ddlb_cargo from dropdownlistbox within w_pre_cierre_venta
end type
type gb_2 from groupbox within w_pre_cierre_venta
end type
type st_fondo from statictext within w_pre_cierre_venta
end type
type dw_lista from datawindow within w_pre_cierre_venta
end type
end forward

global type w_pre_cierre_venta from window
integer width = 4087
integer height = 2092
boolean titlebar = true
string title = "Pre-Cierre Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_asocia_rut cb_asocia_rut
rb_todos rb_todos
cb_digitacion cb_digitacion
cb_valida cb_valida
cb_grabar cb_grabar
cb_valida_cierre cb_valida_cierre
cb_modif_control_doct cb_modif_control_doct
rb_jefe rb_jefe
rb_super rb_super
cb_ctrol_doc cb_ctrol_doc
cb_cta_cte cb_cta_cte
hpb_1 hpb_1
st_porc st_porc
pb_1 pb_1
dw_periodo dw_periodo
cb_1 cb_1
cb_2 cb_2
cb_filtro cb_filtro
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
gb_1 gb_1
ddlb_cargo ddlb_cargo
gb_2 gb_2
st_fondo st_fondo
dw_lista dw_lista
end type
global w_pre_cierre_venta w_pre_cierre_venta

type variables
Long		il_mes,il_ano,il_row
string		is_infor
end variables

on w_pre_cierre_venta.create
this.cb_asocia_rut=create cb_asocia_rut
this.rb_todos=create rb_todos
this.cb_digitacion=create cb_digitacion
this.cb_valida=create cb_valida
this.cb_grabar=create cb_grabar
this.cb_valida_cierre=create cb_valida_cierre
this.cb_modif_control_doct=create cb_modif_control_doct
this.rb_jefe=create rb_jefe
this.rb_super=create rb_super
this.cb_ctrol_doc=create cb_ctrol_doc
this.cb_cta_cte=create cb_cta_cte
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.pb_1=create pb_1
this.dw_periodo=create dw_periodo
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_filtro=create cb_filtro
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.ddlb_cargo=create ddlb_cargo
this.gb_2=create gb_2
this.st_fondo=create st_fondo
this.dw_lista=create dw_lista
this.Control[]={this.cb_asocia_rut,&
this.rb_todos,&
this.cb_digitacion,&
this.cb_valida,&
this.cb_grabar,&
this.cb_valida_cierre,&
this.cb_modif_control_doct,&
this.rb_jefe,&
this.rb_super,&
this.cb_ctrol_doc,&
this.cb_cta_cte,&
this.hpb_1,&
this.st_porc,&
this.pb_1,&
this.dw_periodo,&
this.cb_1,&
this.cb_2,&
this.cb_filtro,&
this.cb_imprimir,&
this.cb_cerrar,&
this.gb_1,&
this.ddlb_cargo,&
this.gb_2,&
this.st_fondo,&
this.dw_lista}
end on

on w_pre_cierre_venta.destroy
destroy(this.cb_asocia_rut)
destroy(this.rb_todos)
destroy(this.cb_digitacion)
destroy(this.cb_valida)
destroy(this.cb_grabar)
destroy(this.cb_valida_cierre)
destroy(this.cb_modif_control_doct)
destroy(this.rb_jefe)
destroy(this.rb_super)
destroy(this.cb_ctrol_doc)
destroy(this.cb_cta_cte)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.pb_1)
destroy(this.dw_periodo)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_filtro)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.ddlb_cargo)
destroy(this.gb_2)
destroy(this.st_fondo)
destroy(this.dw_lista)
end on

event open;string	ls_cod_sup,ls_nomb,ls_a_mater,ls_a_pater,ls_string
Long	ll_new

gf_centrar(w_pre_cierre_venta)
dw_periodo.settransobject(sqlca)
dw_lista.settransobject(sqlca)
gs_cerrar									= 'N'					
if ( gs_depto='I' and gl_proceso=5 ) or (( gs_depto='O' or gs_depto='E') and gl_proceso=4 ) then
	cb_modif_control_doct.visible		= true
	cb_digitacion.visible					= true
	rb_todos.visible							= true
else
	cb_modif_control_doct.visible		= false
	cb_digitacion.visible					= false
	rb_todos.visible							= false
end if

il_row											= 0
ll_new										= dw_periodo.insertrow(0)
st_fondo.visible								= false
hpb_1.visible 								= false
st_porc.visible 								= false
SELECT DISTINCT MAX("CD_FOLIO"."ANO_CIERRE")
INTO 		:il_ano  
FROM 		"CD_FOLIO"  
USING		SQLCA;
if sqlca.sqlcode=0 then
	SELECT DISTINCT MAX("CD_FOLIO"."MES_CIERRE")
	INTO 		:il_mes  
	FROM 		"CD_FOLIO"  
	WHERE		"CD_FOLIO"."ANO_CIERRE" = :il_ano
	USING		SQLCA;
end if
if isnull(il_mes) or il_mes=0 then il_mes=month(date(gdt_fec_sistema))
if isnull(il_ano) or il_ano=0 then il_ano=year(date(gdt_fec_sistema))
dw_periodo.setitem(ll_new,'mes',il_mes)
dw_periodo.setitem(ll_new,'ano',il_ano)
if rb_super.checked=true then
	DECLARE	x1 CURSOR FOR
	SELECT distinct	"SUPERVISOR"."COD_SUP", "SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO"  
	FROM		"CD_FOLIO",	"SUPERVISOR"  
	WHERE	( "CD_FOLIO"."COD_SUPERVISOR" = "SUPERVISOR"."COD_SUP" ) AND
				( "CD_FOLIO"."MES_CIERRE" = :il_mes ) AND  
				( "CD_FOLIO"."ANO_CIERRE" = :il_ano )   
	ORDER BY	"SUPERVISOR"."COD_SUP"  ASC
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ls_cod_sup,	:ls_nomb,	:ls_a_pater,	:ls_a_mater;
			if not isnull(ls_cod_sup) and ls_cod_sup<>'' then
				ls_string           	= ls_cod_sup+'-'+ls_nomb+' '+ls_a_pater+' '+ls_a_mater;
				ddlb_cargo.AddItem(ls_string)
			end if
			Setnull(ls_cod_sup);Setnull(ls_nomb);Setnull(ls_a_pater);Setnull(ls_a_mater)
		LOOP
	end if
	close x1;
elseif rb_jefe.checked=true then
	DECLARE	x2 CURSOR FOR
	SELECT distinct	"JEFE_VENTAS"."JEFE_VENTAS", "JEFE_VENTAS"."NOMBRE",	"JEFE_VENTAS"."A_PATERNO",	"JEFE_VENTAS"."A_MATERNO"  
	FROM		"CD_FOLIO",	"JEFE_VENTAS"  
	WHERE	( "CD_FOLIO"."COD_JEFE_VENTA" = "JEFE_VENTAS"."JEFE_VENTAS" ) AND
				( "CD_FOLIO"."MES_CIERRE" = :il_mes ) AND  
				( "CD_FOLIO"."ANO_CIERRE" = :il_ano )   
	ORDER BY	"JEFE_VENTAS"."JEFE_VENTAS"  ASC
	USING		sqlca;
	open x2;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x2 INTO	:ls_cod_sup,	:ls_nomb,	:ls_a_pater,	:ls_a_mater;
			if not isnull(ls_cod_sup) and ls_cod_sup<>'' then
				ls_string           	= ls_cod_sup+'-'+ls_nomb+' '+ls_a_mater+' '+ls_a_pater;
				ddlb_cargo.AddItem(ls_string)
			end if
			Setnull(ls_cod_sup);Setnull(ls_nomb);Setnull(ls_a_pater);Setnull(ls_a_mater)
		LOOP
	end if
	close x2;	
end if
dw_periodo.accepttext()
dw_periodo.setfocus()
end event

type cb_asocia_rut from commandbutton within w_pre_cierre_venta
integer x = 384
integer y = 1816
integer width = 375
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&lación. * Rut"
end type

event clicked;dw_lista.accepttext()
if il_row>0 then
	if dw_lista.rowcount() > 0 then
		gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
		gs_base		= dw_lista.getitemstring(il_row,'base')
		gs_serie		= dw_lista.getitemstring(il_row,'serie')
		gi_rut 		= dw_lista.GetItemNumber(il_row, "revision_contratos_rut")
	end if
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if


end event

type rb_todos from radiobutton within w_pre_cierre_venta
integer x = 3410
integer y = 24
integer width = 265
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
end type

type cb_digitacion from commandbutton within w_pre_cierre_venta
integer x = 1563
integer y = 1816
integer width = 279
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Digitación"
end type

event clicked;string	ls_base

if il_row>0 and dw_lista.rowcount() > 0 then
	ls_base		= dw_lista.getitemstring(il_row,'base')
	if ls_base = 'O' or ls_base='U'  then
		if isvalid(w_ingresar_oferta) then close(w_ingresar_oferta)
		Open(w_ingresar_oferta)
	elseif ls_base = 'L' then
		if isvalid(w_ingresar_liberador) then close(w_ingresar_liberador)
		Open(w_ingresar_liberador)
	elseif ls_base = 'D' then
		if isvalid(w_ingresar_derecho) then close(w_ingresar_derecho)
		Open(w_ingresar_derecho)
	elseif ls_base = 'P' then
		if isvalid(w_ingresar_pagare) then close(w_ingresar_pagare)
		Open(w_ingresar_pagare)
	elseif ls_base = 'C' then
		if isvalid(w_ingresar_contrato) then close(w_ingresar_contrato)
		Open(w_ingresar_contrato)
	elseif ls_base = 'A' then
		if isvalid(w_ingresar_aumento_capacidad) then close(w_ingresar_aumento_capacidad)
		open(w_ingresar_aumento_capacidad)
	end if
end if


end event

type cb_valida from commandbutton within w_pre_cierre_venta
integer x = 2327
integer y = 1816
integer width = 375
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Validar Venta"
end type

event clicked;string		ls_base,ls_serie,ls_string,ls_descrip
long		ll_tot_reg,ll_estado_cd
Double	ll_numero

ll_tot_reg				= dw_lista.rowcount()							
if ll_tot_reg>0 then
	ls_base				= dw_lista.getitemstring(il_row,'base')
	ls_serie				= dw_lista.getitemstring(il_row,'serie')
	ll_numero			= dw_lista.getitemnumber(il_row,'numero')
	ll_estado_cd		= dw_lista.getitemnumber(il_row,'ult_estado')
	SELECT	"CD_ESTADO"."DESCRIPCION"  
   INTO		:ls_descrip  
   FROM		"CD_ESTADO"  
   WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado_cd
   USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ls_descrip) and ls_descrip<>'' then
			ls_descrip					= ls_descrip
		else
			ls_descrip					= ''
		end if
	else
		ls_descrip						= ''
	end if
	if ll_estado_cd=11 then
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>''and not isnull(ll_numero) and ll_numero>0 then
			ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
			if isvalid(w_pre_cierre_venta_indiv) then close(w_pre_cierre_venta_indiv)
				openwithparm(w_pre_cierre_venta_indiv,ls_string)
		end if
	else
		messagebox("Advertencia",'Estado '+string(ll_estado_cd)+' - '+ls_descrip+' No Permite Validad Venta')
	end if
end if
end event

type cb_grabar from commandbutton within w_pre_cierre_venta
integer x = 1957
integer y = 2096
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;long	ll_marca


ll_marca = dw_lista.Find("cd_folio_sw_vta = 0", 1, dw_lista.RowCount())
if ll_marca>0 then
	if dw_lista.update() = 1 then
		commit using sqlca;
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback using sqlca;
	end if
end if
end event

type cb_valida_cierre from commandbutton within w_pre_cierre_venta
integer x = 1952
integer y = 1816
integer width = 375
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cierre Ventas"
end type

event clicked;if isvalid(w_pre_cierre_valida_cierre) then close(w_pre_cierre_valida_cierre)
 open(w_pre_cierre_valida_cierre)
	
	
end event

type cb_modif_control_doct from commandbutton within w_pre_cierre_venta
integer x = 1106
integer y = 1816
integer width = 457
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Modif Ctrol Docto."
end type

event clicked;string		ls_base,ls_serie,ls_string,ls_modif
Double	ll_numero

if il_row>0 and dw_lista.rowcount() > 0 then
	ls_base		= dw_lista.getitemstring(il_row,'base')
	ls_serie		= dw_lista.getitemstring(il_row,'serie')
	ll_numero 	= dw_lista.getitemnumber(il_row,'numero')
	ls_modif		= 'M'
	gs_cerrar	= 'S'
	if not isnull(ls_base) and ll_numero>0 then
		ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+ls_modif
		if isvalid(w_modificar_control_documento) then close(w_modificar_control_documento)
	 	openwithparm(w_modificar_control_documento,ls_string)
	end if
end if
	
	
end event

type rb_jefe from radiobutton within w_pre_cierre_venta
integer x = 2784
integer y = 24
integer width = 517
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Por Jefe Venta"
end type

event clicked;string	ls_cod_sup,ls_nomb,ls_a_pater,ls_a_mater,ls_string
long		ll_mes,ll_ano

//dw_super.dataobject	= 'dwe_lista_periodo_jefe_venta'
//dw_super.settransobject(sqlca)
//dw_super.insertrow(0)
dw_lista.reset()
ddlb_cargo.reset()

dw_periodo.accepttext()
ll_mes	= dw_periodo.getitemnumber(1,'mes')
ll_ano	= dw_periodo.getitemnumber(1,'ano')

if rb_jefe.checked=true then
	DECLARE	x2 CURSOR FOR
	SELECT distinct	"JEFE_VENTAS"."JEFE_VENTAS", "JEFE_VENTAS"."NOMBRE",	"JEFE_VENTAS"."A_PATERNO",	"JEFE_VENTAS"."A_MATERNO"  
	FROM		"CD_FOLIO",	"JEFE_VENTAS"  
	WHERE		( "CD_FOLIO"."COD_JEFE_VENTA" = "JEFE_VENTAS"."JEFE_VENTAS" ) AND
				( "CD_FOLIO"."MES_CIERRE" = :ll_mes ) AND  
				( "CD_FOLIO"."ANO_CIERRE" = :ll_ano )   
	ORDER BY	"JEFE_VENTAS"."JEFE_VENTAS"  ASC
	USING		sqlca;
	open x2;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x2 INTO	:ls_cod_sup,	:ls_nomb,	:ls_a_pater,	:ls_a_mater;
			if not isnull(ls_cod_sup) and ls_cod_sup<>'' then
				ls_string           	= ls_cod_sup+'-'+ls_nomb+' '+ls_a_mater+' '+ls_a_pater;
				ddlb_cargo.AddItem(ls_string)
			end if
			Setnull(ls_cod_sup);Setnull(ls_nomb);Setnull(ls_a_pater);Setnull(ls_a_mater)
		LOOP
	end if
	close x2;
end if
end event

type rb_super from radiobutton within w_pre_cierre_venta
integer x = 2181
integer y = 24
integer width = 517
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Por Supervisor"
boolean checked = true
end type

event clicked;string	ls_cod_sup,ls_nomb,ls_a_pater,ls_a_mater,ls_string
long		ll_mes,ll_ano
//dw_super.dataobject	= 'dwe_lista_periodo_supervisor'
//dw_super.settransobject(sqlca)
//dw_super.insertrow(0)
dw_lista.reset()
ddlb_cargo.reset()

dw_periodo.accepttext()
ll_mes	= dw_periodo.getitemnumber(1,'mes')
ll_ano	= dw_periodo.getitemnumber(1,'ano')

if rb_super.checked=true then
	DECLARE	x1 CURSOR FOR
	SELECT distinct	"SUPERVISOR"."COD_SUP", "SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO"  
	FROM		"CD_FOLIO",	"SUPERVISOR"  
	WHERE		( "CD_FOLIO"."COD_SUPERVISOR" = "SUPERVISOR"."COD_SUP" ) AND
				( "CD_FOLIO"."MES_CIERRE" = :ll_mes ) AND  
				( "CD_FOLIO"."ANO_CIERRE" = :ll_ano )   
	ORDER BY	"SUPERVISOR"."COD_SUP"  ASC
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ls_cod_sup,	:ls_nomb,	:ls_a_pater,	:ls_a_mater;
			if not isnull(ls_cod_sup) and ls_cod_sup<>'' then
				ls_string           	= ls_cod_sup+'-'+ls_nomb+' '+ls_a_mater+' '+ls_a_pater;
				ddlb_cargo.AddItem(ls_string)
			end if
			Setnull(ls_cod_sup);Setnull(ls_nomb);Setnull(ls_a_pater);Setnull(ls_a_mater)
		LOOP
	end if
	close x1;
end if
end event

type cb_ctrol_doc from commandbutton within w_pre_cierre_venta
integer x = 759
integer y = 1816
integer width = 347
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Control Docto."
end type

event clicked;String	ls_string,ls_base,ls_serie
Double	ll_numero
if dw_lista.rowcount()>0 then
	ls_base		= dw_lista.getitemstring(il_row,'base')
	ls_serie		= dw_lista.getitemstring(il_row,'serie')
	ll_numero	= dw_lista.getitemnumber(il_row,'numero')
	ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(ls_base) and ll_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type cb_cta_cte from commandbutton within w_pre_cierre_venta
integer x = 32
integer y = 1816
integer width = 352
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta. Corriente"
end type

event clicked;if il_row>0 and dw_lista.rowcount() > 0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	gi_rut 		= dw_lista.GetItemNumber(il_row, "revision_contratos_rut")
	gs_dv			= dw_lista.GetItemString(il_row, "revision_contratos_dv")
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
		CASE "F","G","V"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
end if
end event

type hpb_1 from hprogressbar within w_pre_cierre_venta
boolean visible = false
integer x = 1230
integer y = 1016
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_pre_cierre_venta
boolean visible = false
integer x = 1787
integer y = 928
integer width = 233
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_pre_cierre_venta
integer x = 3717
integer y = 88
integer width = 165
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_mes,ll_ano,ll_indi,ll_tot_reg,ll_folio,ll_tot_porc,&
			ll_tot_porc_aux,ll_monto,ll_nulo,ll_pos,ll_estado
String		ls_tipo_cob,ls_base,ls_serie,ls_estado_ch,ls_nulo,ls_forma_pago,ls_string,&
			ls_supervisor,ls_busqueda,ls_cadena_estado,&
			ls_age_dg,ls_sup_dg,ls_jef_dg,ls_age_cd,ls_sup_cd,ls_jef_cd,ls_val_age,ls_val_sup,ls_val_jef 
Datetime	ldt_fec_venc_ch,ldt_fecha_pago,ldt_fecha_estado_ch,ldt_nulo,ldt_fecha_cierre
Double	ll_numero
SetPointer(HourGlass!)
Setnull(ll_nulo);Setnull(ls_nulo);Setnull(ldt_nulo)
dw_periodo.accepttext()
ll_mes									= dw_periodo.getitemnumber(1,'mes')
ll_ano										= dw_periodo.getitemnumber(1,'ano')
ls_busqueda                      			= ddlb_cargo.text
ll_pos                          				= POS (ls_busqueda,'-')
if ll_pos > 0 then ll_pos = ll_pos - 1
ls_supervisor                  			= trim(mid(ls_busqueda,1,ll_pos))
if rb_super.checked=true then
	dw_lista.dataobject				= 'dw_lista_pre_cierre_ventas'
	dw_lista.settransobject(sqlca)
elseif rb_jefe.checked=true then
	dw_lista.dataobject				= 'dw_lista_pre_cierre_ventas_jefe'
	dw_lista.settransobject(sqlca)
elseif rb_todos.checked=true then
	dw_lista.dataobject				= 'dw_lista_pre_cierre_ventas_todos'
	dw_lista.settransobject(sqlca)	
end if

if ll_mes>0 and ll_ano>0   then
	if rb_super.checked=true or rb_jefe.checked=true then
		if not isnull(ls_supervisor) and ls_supervisor<>'' then
			ll_tot_reg					= dw_lista.retrieve(ll_mes,ll_ano,ls_supervisor)
		else
			if rb_super.checked=true then
				messagebox("Advertencia","Debe Selección Supervisor")
			elseif rb_jefe.checked=true then
				messagebox("Advertencia","Debe Selección Jefe Ventas")
			end if
		end if
	else
		ll_tot_reg						= dw_lista.retrieve(ll_mes,ll_ano)
	end if
			
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Dato")
	else
		st_fondo.visible					= true
		hpb_1.visible 					= true
		st_porc.visible 					= true
		ll_tot_porc						= 0
		ll_tot_porc_aux					= 0			
		hpb_1.Position					= ll_tot_porc
		for ll_indi=1 to ll_tot_reg
			ls_base						= dw_lista.getitemstring(ll_indi,'base')
			ls_serie						= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero					= dw_lista.getitemnumber(ll_indi,'numero')
			ll_estado						= dw_lista.getitemnumber(ll_indi,'ult_estado')
			ls_age_cd					= dw_lista.getitemstring(ll_indi,'cod_agente')
			ls_sup_cd					= dw_lista.getitemstring(ll_indi,'cod_supervisor')
			ls_jef_cd						= dw_lista.getitemstring(ll_indi,'cod_jefe_venta')
			SELECT 	MIN("DOCUMENTOS"."FECHA_VENC")  
			INTO 		:ldt_fec_venc_ch  
			FROM 	"DOCUMENTOS","INGRESO","CLIENTE_REZAGO"  
			WHERE	( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
						( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
						( "INGRESO"."TIPO_COB" = "CLIENTE_REZAGO"."COD_PAGO" ) and  
						( "INGRESO"."FOLIO" = "CLIENTE_REZAGO"."FOLIO" ) and  
					 	( "INGRESO"."REZAGO" = 'S' ) AND  
					 	( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
					 	( "CLIENTE_REZAGO"."BASE" = :ls_base ) AND  
					 	( "CLIENTE_REZAGO"."SERIE" = :ls_serie ) AND  
					 	( "CLIENTE_REZAGO"."NUMERO" = :ll_numero ) AND  
					 	( "DOCUMENTOS"."COD_PAGO" = 'CH' )    
			USING	sqlca;
			if not isnull(ldt_fec_venc_ch) then //pago cheque en rezago
				SELECT 	"DOCUMENTOS"."FOLIO",	"DOCUMENTOS"."TIPO_COB",	"DOCUMENTOS"."FECHA_PAGO",	"DOCUMENTOS"."ESTADO_CH",	"DOCUMENTOS"."FECHA_ESTADO_CH",	"DOCUMENTOS"."MONTO",	"DOCUMENTOS"."COD_PAGO"
				INTO 		:ll_folio,					:ls_tipo_cob,					:ldt_fecha_pago,				:ls_estado_ch,					:ldt_fecha_estado_ch,				:ll_monto,					:ls_forma_pago
				FROM 		"DOCUMENTOS","INGRESO","CLIENTE_REZAGO"  
				WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
						 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
						 ( "INGRESO"."TIPO_COB" = "CLIENTE_REZAGO"."COD_PAGO" ) and  
						 ( "INGRESO"."FOLIO" = "CLIENTE_REZAGO"."FOLIO" ) and  
//						 ( "DOCUMENTOS"."TIPO_COB" = 'CI' OR "DOCUMENTOS"."TIPO_COB" = 'C0') AND 
						 ( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
						 ( "INGRESO"."REZAGO" = 'S' ) AND  
						 ( "CLIENTE_REZAGO"."BASE" = :ls_base ) AND  
						 ( "CLIENTE_REZAGO"."SERIE" = :ls_serie ) AND  
						 ( "CLIENTE_REZAGO"."NUMERO" = :ll_numero ) AND  
						 ( "DOCUMENTOS"."COD_PAGO" = 'CH' ) AND
						 ( "DOCUMENTOS"."FECHA_VENC" = :ldt_fec_venc_ch ) 
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_indi,'tiene_cheque','S')
					dw_lista.setitem(ll_indi,'tipo_cob',ls_tipo_cob)
					dw_lista.setitem(ll_indi,'folio',ll_folio)
					dw_lista.setitem(ll_indi,'fecha_pago',ldt_fecha_pago)
					dw_lista.setitem(ll_indi,'estado_cheque',ls_estado_ch)
					dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_fecha_estado_ch)
					dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_fec_venc_ch)
					dw_lista.setitem(ll_indi,'monto_pagado',ll_monto)
					dw_lista.setitem(ll_indi,'forma_pago',ls_forma_pago)
				else
					dw_lista.setitem(ll_indi,'tiene_cheque','S')
					dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
					dw_lista.setitem(ll_indi,'folio',ll_nulo)
					dw_lista.setitem(ll_indi,'fecha_pago',ldt_nulo)
					dw_lista.setitem(ll_indi,'estado_cheque',ls_nulo)
					dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_nulo)
					dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_nulo)
					dw_lista.setitem(ll_indi,'monto_pagado',ll_nulo)
					dw_lista.setitem(ll_indi,'forma_pago',ls_nulo)
				end if
			else
				SELECT 	MIN("DOCUMENTOS"."FECHA_VENC")  
				INTO 		:ldt_fec_venc_ch  
				FROM 		"DOCUMENTOS",   
							"INGRESO"  
				WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
						 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
						 ( "INGRESO"."REZAGO" <> 'S' ) AND 
						 ( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
						 ( "DOCUMENTOS"."COD_PAGO" = 'CH' ) AND 
						 ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if not isnull(ldt_fec_venc_ch) then //pago cheque en rezago
					SELECT 	"DOCUMENTOS"."FOLIO",	"DOCUMENTOS"."TIPO_COB",	"DOCUMENTOS"."FECHA_PAGO",	"DOCUMENTOS"."ESTADO_CH",	"DOCUMENTOS"."FECHA_ESTADO_CH",	"DOCUMENTOS"."MONTO",	"DOCUMENTOS"."COD_PAGO"
					INTO 		:ll_folio,					:ls_tipo_cob,					:ldt_fecha_pago,				:ls_estado_ch,					:ldt_fecha_estado_ch,				:ll_monto,					:ls_forma_pago
					FROM 		"DOCUMENTOS",   
								"INGRESO" 
					WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
							 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
							 ( "INGRESO"."REZAGO" <> 'S' ) AND  
							 ( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
							 ( "INGRESO"."BASE" = :ls_base ) AND  
							 ( "INGRESO"."SERIE" = :ls_serie ) AND  
							 ( "INGRESO"."CONTRATO" = :ll_numero ) AND  
							 ( "DOCUMENTOS"."COD_PAGO" = 'CH' ) AND
							 ( "DOCUMENTOS"."FECHA_VENC" = :ldt_fec_venc_ch )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_indi,'tiene_cheque','S')
						dw_lista.setitem(ll_indi,'tipo_cob',ls_tipo_cob)
						dw_lista.setitem(ll_indi,'folio',ll_folio)
						dw_lista.setitem(ll_indi,'fecha_pago',ldt_fecha_pago)
						dw_lista.setitem(ll_indi,'estado_cheque',ls_estado_ch)
						dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_fecha_estado_ch)
						dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_fec_venc_ch)
						dw_lista.setitem(ll_indi,'monto_pagado',ll_monto)
						dw_lista.setitem(ll_indi,'forma_pago',ls_forma_pago)
					else
						dw_lista.setitem(ll_indi,'tiene_cheque','S')
						dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
						dw_lista.setitem(ll_indi,'folio',ll_nulo)
						dw_lista.setitem(ll_indi,'fecha_pago',ldt_nulo)
						dw_lista.setitem(ll_indi,'estado_cheque',ls_nulo)
						dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_nulo)
						dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_nulo)
						dw_lista.setitem(ll_indi,'monto_pagado',ll_nulo)
					end if				
				else
					SELECT 	MIN("DOCUMENTOS"."FECHA_VENC")  
					INTO 		:ldt_fec_venc_ch  
					FROM 		"DOCUMENTOS",   
								"INGRESO",   
								"CLIENTE_REZAGO"  
					WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
							 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
							 ( "INGRESO"."TIPO_COB" = "CLIENTE_REZAGO"."COD_PAGO" ) and  
							 ( "INGRESO"."FOLIO" = "CLIENTE_REZAGO"."FOLIO" ) and  
							 ( "INGRESO"."REZAGO" = 'S' ) AND  
							 ( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
							 ( "CLIENTE_REZAGO"."BASE" = :ls_base ) AND  
							 ( "CLIENTE_REZAGO"."SERIE" = :ls_serie ) AND  
							 ( "CLIENTE_REZAGO"."NUMERO" = :ll_numero ) AND  
							 ( "DOCUMENTOS"."COD_PAGO" <> 'CH' )    
					USING		sqlca;
					if not isnull(ldt_fec_venc_ch) then //pago cheque en rezago
						SELECT 	"DOCUMENTOS"."FOLIO",	"DOCUMENTOS"."TIPO_COB",	"DOCUMENTOS"."FECHA_PAGO",	"DOCUMENTOS"."ESTADO_CH",	"DOCUMENTOS"."FECHA_ESTADO_CH",	"DOCUMENTOS"."MONTO",	"DOCUMENTOS"."COD_PAGO"
						INTO 		:ll_folio,					:ls_tipo_cob,					:ldt_fecha_pago,				:ls_estado_ch,					:ldt_fecha_estado_ch,				:ll_monto,					:ls_forma_pago
						FROM 		"DOCUMENTOS",   
									"INGRESO",   
									"CLIENTE_REZAGO"  
						WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
								 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
								 ( "INGRESO"."TIPO_COB" = "CLIENTE_REZAGO"."COD_PAGO" ) and  
								 ( "INGRESO"."FOLIO" = "CLIENTE_REZAGO"."FOLIO" ) and  
								 ( "INGRESO"."REZAGO" = 'S' ) AND  
								 ( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
								 ( "CLIENTE_REZAGO"."BASE" = :ls_base ) AND  
								 ( "CLIENTE_REZAGO"."SERIE" = :ls_serie ) AND  
								 ( "CLIENTE_REZAGO"."NUMERO" = :ll_numero ) AND  
								 ( "DOCUMENTOS"."COD_PAGO" <> 'CH' ) AND
								 ( "DOCUMENTOS"."FECHA_VENC" = :ldt_fec_venc_ch ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_lista.setitem(ll_indi,'tiene_cheque','N')
							dw_lista.setitem(ll_indi,'tipo_cob',ls_tipo_cob)
							dw_lista.setitem(ll_indi,'folio',ll_folio)
							dw_lista.setitem(ll_indi,'fecha_pago',ldt_fecha_pago)
							dw_lista.setitem(ll_indi,'monto_pagado',ll_monto)
							dw_lista.setitem(ll_indi,'forma_pago',ls_forma_pago)
						else
							dw_lista.setitem(ll_indi,'tiene_cheque','N')
							dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
							dw_lista.setitem(ll_indi,'folio',ll_nulo)
							dw_lista.setitem(ll_indi,'fecha_pago',ldt_nulo)
							dw_lista.setitem(ll_indi,'estado_cheque',ls_nulo)
							dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_nulo)
							dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_nulo)
							dw_lista.setitem(ll_indi,'monto_pagado',ll_nulo)
						end if
					else
						SELECT 	MIN("DOCUMENTOS"."FECHA_VENC")  
						INTO 		:ldt_fec_venc_ch  
						FROM 		"DOCUMENTOS",   
									"INGRESO"  
						WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
								 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
								 ( "INGRESO"."REZAGO" <> 'S' ) AND 
								 ( "DOCUMENTOS"."COD_PAGO" <> 'CH' ) AND 
								 ( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
								 ( "INGRESO"."BASE" = :ls_base ) AND  
								 ( "INGRESO"."SERIE" = :ls_serie ) AND  
								 ( "INGRESO"."CONTRATO" = :ll_numero )   
						USING		sqlca;
						if not isnull(ldt_fec_venc_ch) then //pago cheque en rezago
							SELECT 	"DOCUMENTOS"."FOLIO",	"DOCUMENTOS"."TIPO_COB",	"DOCUMENTOS"."FECHA_PAGO",	"DOCUMENTOS"."ESTADO_CH",	"DOCUMENTOS"."FECHA_ESTADO_CH",	"DOCUMENTOS"."MONTO",	"DOCUMENTOS"."COD_PAGO"
							INTO 		:ll_folio,					:ls_tipo_cob,					:ldt_fecha_pago,				:ls_estado_ch,					:ldt_fecha_estado_ch,				:ll_monto,					:ls_forma_pago
							FROM 		"DOCUMENTOS",   
										"INGRESO" 
							WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
									 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
									 ( "INGRESO"."REZAGO" <> 'S' ) AND  
									 ( "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'A') AND
									 ( "INGRESO"."BASE" = :ls_base ) AND  
									 ( "INGRESO"."SERIE" = :ls_serie ) AND  
									 ( "INGRESO"."CONTRATO" = :ll_numero ) AND  
									 ( "DOCUMENTOS"."COD_PAGO" <> 'CH' ) AND
									 ( "DOCUMENTOS"."FECHA_VENC" = :ldt_fec_venc_ch )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								dw_lista.setitem(ll_indi,'tiene_cheque','N')
								dw_lista.setitem(ll_indi,'tipo_cob',ls_tipo_cob)
								dw_lista.setitem(ll_indi,'folio',ll_folio)
								dw_lista.setitem(ll_indi,'fecha_pago',ldt_fecha_pago)
								dw_lista.setitem(ll_indi,'monto_pagado',ll_monto)
								dw_lista.setitem(ll_indi,'forma_pago',ls_forma_pago)
							else
								dw_lista.setitem(ll_indi,'tiene_cheque','N')
								dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
								dw_lista.setitem(ll_indi,'folio',ll_nulo)
								dw_lista.setitem(ll_indi,'fecha_pago',ldt_nulo)
								dw_lista.setitem(ll_indi,'estado_cheque',ls_nulo)
								dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_nulo)
								dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_nulo)
								dw_lista.setitem(ll_indi,'monto_pagado',ll_nulo)
							end if				
						else
							dw_lista.setitem(ll_indi,'tiene_cheque','N')
							dw_lista.setitem(ll_indi,'tipo_cob',ls_nulo)
							dw_lista.setitem(ll_indi,'folio',ll_nulo)
							dw_lista.setitem(ll_indi,'fecha_pago',ldt_nulo)
							dw_lista.setitem(ll_indi,'estado_cheque',ls_nulo)
							dw_lista.setitem(ll_indi,'fecha_estado_cheque',ldt_nulo)
							dw_lista.setitem(ll_indi,'fecha_venc_cheque',ldt_nulo)
							dw_lista.setitem(ll_indi,'monto_pagado',ll_nulo)
						end if
					end if
				end if
			end if
			if ll_estado=11 then
				if ls_base='O' or ls_base='U' then
					Setnull(ldt_fecha_cierre)
					SELECT	"OFERTA_V"."CIERRE_VENTA","CADENA"."ESTADO", "OFERTA_V"."COD_AGE", "OFERTA_V"."COD_SUP", "OFERTA_V"."COD_JEF"
					INTO 		:ldt_fecha_cierre,	:ls_cadena_estado,	:ls_age_dg,	:ls_sup_dg,	:ls_jef_dg    
					FROM		"OFERTA_V","CADENA"
					WHERE	( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
								( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
								(("CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
						dw_lista.setitem(ll_indi,'estado_contrato',ls_cadena_estado)
						dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
						if ls_age_cd=ls_age_dg then
							ls_val_age							= 'S'
						else
							ls_val_age							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_age',ls_val_age)
						dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
						if ls_sup_cd=ls_sup_dg then
							ls_val_sup							= 'S'
						else
							ls_val_sup							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_sup',ls_val_sup)
						dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
						if ls_jef_cd=ls_jef_dg then
							ls_val_jef							= 'S'
						else
							ls_val_jef							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_jef',ls_val_jef)
					else
						dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
						dw_lista.setitem(ll_indi,'estado_contrato',ls_cadena_estado)
						dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
						if ls_age_cd=ls_age_dg then
							ls_val_age							= 'S'
						else
							ls_val_age							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_age',ls_val_age)
						dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
						if ls_sup_cd=ls_sup_dg then
							ls_val_sup							= 'S'
						else
							ls_val_sup							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_sup',ls_val_sup)
						dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
						if ls_jef_cd=ls_jef_dg then
							ls_val_jef							= 'S'
						else
							ls_val_jef							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_jef',ls_val_jef)
					end if
				elseif ls_base='G' or ls_base='F' then
					//Tabla PRODUCTO
					Setnull(ldt_fecha_cierre)
					SELECT	"PRODUCTO_ANEXO"."CIERRE_VENTA","CADENA"."ESTADO", "PRODUCTO_ANEXO"."COD_AGENTE", "PRODUCTO_ANEXO"."COD_SUPER", "PRODUCTO_ANEXO"."COD_JEFE"  
					INTO 		:ldt_fecha_cierre,	:ls_cadena_estado,	:ls_age_dg,	:ls_sup_dg,	:ls_jef_dg       
					FROM 	"PRODUCTO_ANEXO","CADENA"
					WHERE	( "PRODUCTO_ANEXO"."SERIE" = "CADENA"."SERIE" ) and  
								( "PRODUCTO_ANEXO"."NUMERO" = "CADENA"."NUMERO" ) and  
								(("CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
						dw_lista.setitem(ll_indi,'estado_contrato',ls_cadena_estado)
						dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
						if ls_age_cd=ls_age_dg then
							ls_val_age							= 'S'
						else
							ls_val_age							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_age',ls_val_age)
						dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
						if ls_sup_cd=ls_sup_dg then
							ls_val_sup							= 'S'
						else
							ls_val_sup							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_sup',ls_val_sup)
						dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
						if ls_jef_cd=ls_jef_dg then
							ls_val_jef							= 'S'
						else
							ls_val_jef							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_jef',ls_val_jef)
					else
						dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
						dw_lista.setitem(ll_indi,'estado_contrato',ls_cadena_estado)
						dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
						if ls_age_cd=ls_age_dg then
							ls_val_age							= 'S'
						else
							ls_val_age							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_age',ls_val_age)
						dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
						if ls_sup_cd=ls_sup_dg then
							ls_val_sup							= 'S'
						else
							ls_val_sup							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_sup',ls_val_sup)
						dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
						if ls_jef_cd=ls_jef_dg then
							ls_val_jef							= 'S'
						else
							ls_val_jef							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_jef',ls_val_jef)
					end if
				elseif ls_base='L' then
					Setnull(ldt_fecha_cierre)
					SELECT	"ANEXO_LIBERADOR"."CIERRE_VENTA","CADENA"."ESTADO", "ANEXO_LIBERADOR"."COD_AGENTE", "ANEXO_LIBERADOR"."COD_SUPER", "ANEXO_LIBERADOR"."COD_JEF"  
					INTO 		:ldt_fecha_cierre,	:ls_cadena_estado,	:ls_age_dg,	:ls_sup_dg,	:ls_jef_dg       
					FROM 	"ANEXO_LIBERADOR","CADENA"
					WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
								( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
								(("CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
						dw_lista.setitem(ll_indi,'estado_contrato',ls_cadena_estado)
						dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
						if ls_age_cd=ls_age_dg then
							ls_val_age							= 'S'
						else
							ls_val_age							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_age',ls_val_age)
						dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
						if ls_sup_cd=ls_sup_dg then
							ls_val_sup							= 'S'
						else
							ls_val_sup							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_sup',ls_val_sup)
						dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
						if ls_jef_cd=ls_jef_dg then
							ls_val_jef							= 'S'
						else
							ls_val_jef							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_jef',ls_val_jef)
					else
						dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
						dw_lista.setitem(ll_indi,'estado_contrato',ls_cadena_estado)
						dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
						if ls_age_cd=ls_age_dg then
							ls_val_age							= 'S'
						else
							ls_val_age							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_age',ls_val_age)
						dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
						if ls_sup_cd=ls_sup_dg then
							ls_val_sup							= 'S'
						else
							ls_val_sup							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_sup',ls_val_sup)
						dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
						if ls_jef_cd=ls_jef_dg then
							ls_val_jef							= 'S'
						else
							ls_val_jef							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_jef',ls_val_jef)
					end if
				elseif ls_base='A' then
					Setnull(ldt_fecha_cierre)
					SELECT	"ANEXO_AUMENTO"."CIERRE_VENTA","CADENA"."ESTADO", "ANEXO_AUMENTO"."COD_AGENTE", "ANEXO_AUMENTO"."COD_SUPER", "ANEXO_AUMENTO"."COD_JEF"  
					INTO 		:ldt_fecha_cierre,	:ls_cadena_estado,	:ls_age_dg,	:ls_sup_dg,	:ls_jef_dg       
					FROM 	"ANEXO_AUMENTO","CADENA"
					WHERE	( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
								( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
							 	(("CADENA"."CODIGO" = :ls_base ) AND  
							 	( "CADENA"."SERIE" = :ls_serie ) AND  
							 	( "CADENA"."NUMERO" = :ll_numero ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
						dw_lista.setitem(ll_indi,'estado_contrato',ls_cadena_estado)
						dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
						if ls_age_cd=ls_age_dg then
							ls_val_age							= 'S'
						else
							ls_val_age							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_age',ls_val_age)
						dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
						if ls_sup_cd=ls_sup_dg then
							ls_val_sup							= 'S'
						else
							ls_val_sup							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_sup',ls_val_sup)
						dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
						if ls_jef_cd=ls_jef_dg then
							ls_val_jef							= 'S'
						else
							ls_val_jef							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_jef',ls_val_jef)
					else
						dw_lista.setitem(ll_indi,'fecha_cierre',string(ldt_fecha_cierre,'dd/mm/yyyy'))
						dw_lista.setitem(ll_indi,'estado_contrato',ls_cadena_estado)
						dw_lista.setitem(ll_indi,'cod_age',ls_age_dg)
						if ls_age_cd=ls_age_dg then
							ls_val_age							= 'S'
						else
							ls_val_age							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_age',ls_val_age)
						dw_lista.setitem(ll_indi,'cod_sup',ls_sup_dg)
						if ls_sup_cd=ls_sup_dg then
							ls_val_sup							= 'S'
						else
							ls_val_sup							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_sup',ls_val_sup)
						dw_lista.setitem(ll_indi,'cod_jef',ls_jef_dg)
						if ls_jef_cd=ls_jef_dg then
							ls_val_jef							= 'S'
						else
							ls_val_jef							= 'N'
						end if
						dw_lista.setitem(ll_indi,'dif_jef',ls_val_jef)
					end if 	
				else
					dw_lista.setitem(ll_indi,'mostrar','N')
				end if
			end if
			if ll_tot_porc <> ll_tot_porc_aux then 
				st_porc.text		= string(ll_tot_porc)+" %"
				ll_tot_porc_aux	= ll_tot_porc
			end if
			ll_tot_porc				= (ll_indi / ll_tot_reg) * 100
			hpb_1.Position 		= ll_tot_porc
			dw_lista.accepttext()
		next
		st_fondo.visible			= false
		hpb_1.visible 				= false
		st_porc.visible 			= false
	end if
else
	if isnull(ll_mes) or ll_mes=0 then
		messagebox("Advertencia","Debe Ingresar Mes")
		dw_periodo.setfocus()
		dw_periodo.setcolumn('mes')
	elseif isnull(ll_ano) or ll_ano=0 then
		messagebox("Advertencia","Debe Ingresar Año")
		dw_periodo.setfocus()
		dw_periodo.setcolumn('ano')
	elseif isnull(ls_supervisor) or ls_supervisor='' then
		if rb_super.checked=true then
			messagebox("Advertencia","Debe Ingresar Supervisor")
		elseif rb_jefe.checked=true then
			messagebox("Advertencia","Debe Ingresar Jefe Venta")
		end if
	end if
end if
SetPointer(Arrow!)
end event

type dw_periodo from datawindow within w_pre_cierre_venta
integer x = 64
integer y = 120
integer width = 1591
integer height = 112
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_periodo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
ddlb_cargo.reset()
this.accepttext()
end event

type cb_1 from commandbutton within w_pre_cierre_venta
integer x = 3013
integer y = 1824
integer width = 215
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_pre_cierre_venta
integer x = 3223
integer y = 1824
integer width = 215
integer height = 80
integer taborder = 60
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

type cb_filtro from commandbutton within w_pre_cierre_venta
integer x = 2802
integer y = 1824
integer width = 215
integer height = 80
integer taborder = 80
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

type cb_imprimir from commandbutton within w_pre_cierre_venta
integer x = 3438
integer y = 1824
integer width = 215
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type cb_cerrar from commandbutton within w_pre_cierre_venta
integer x = 3703
integer y = 1816
integer width = 329
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_pre_cierre_venta)
end event

type gb_1 from groupbox within w_pre_cierre_venta
integer x = 2784
integer y = 1780
integer width = 887
integer height = 144
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type ddlb_cargo from dropdownlistbox within w_pre_cierre_venta
integer x = 2171
integer y = 116
integer width = 1504
integer height = 536
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()

end event

type gb_2 from groupbox within w_pre_cierre_venta
integer x = 32
integer y = 28
integer width = 3872
integer height = 256
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Periodo de Cierre"
end type

type st_fondo from statictext within w_pre_cierre_venta
boolean visible = false
integer x = 1198
integer y = 904
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_pre_cierre_venta
integer x = 32
integer y = 296
integer width = 4000
integer height = 1472
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_pre_cierre_ventas_jefe"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_filtro

ls_columna														= dwo.name
if ls_columna='t_dif_age' then
	ls_filtro													= " dif_age ='N' "
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
elseif ls_columna='t_dif_sup' then
	ls_filtro													= " dif_sup ='N' "
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
elseif ls_columna='t_dif_jef' then
	ls_filtro													= " dif_jef ='N' "
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
elseif ls_columna='t_todos' then
	ls_filtro													= ""
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
elseif ls_columna='t_digit' then
	ls_filtro													= "ult_estado = 11 "
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
elseif ls_columna='t_no_digit' then
	ls_filtro													= "ult_estado <> 11 "
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
end if

this.accepttext()
	
	
	
end event

event rowfocuschanged;long	ll_estado

if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	if il_row>0 then
		ll_estado							= dw_lista.getitemnumber(il_row,'ult_estado')
		if ll_estado=11 then
			cb_cta_cte.enabled		= true			
		else
			cb_cta_cte.enabled		= false			
		end if
	end if
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	cb_cta_cte.triggerevent(clicked!)
end if
end event

