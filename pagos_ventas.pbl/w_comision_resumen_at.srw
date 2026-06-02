forward
global type w_comision_resumen_at from window
end type
type cb_imprimir from commandbutton within w_comision_resumen_at
end type
type cb_cerrar from commandbutton within w_comision_resumen_at
end type
type dw_resumen from datawindow within w_comision_resumen_at
end type
end forward

global type w_comision_resumen_at from window
integer width = 3634
integer height = 2180
boolean titlebar = true
string title = "Resumen Comisión Ventas Ejecutivos Terreno"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_resumen dw_resumen
end type
global w_comision_resumen_at w_comision_resumen_at

on w_comision_resumen_at.create
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_resumen=create dw_resumen
this.Control[]={this.cb_imprimir,&
this.cb_cerrar,&
this.dw_resumen}
end on

on w_comision_resumen_at.destroy
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_resumen)
end on

event open;string		ls_codigo,ls_cod_cont,ls_decrip,ls_nombre,ls_a_pater,ls_a_mater,ls_tipo_comi,ls_tipo_cob,ls_base04,&
			ls_cod_con01,ls_cod_con02,ls_cod_con03,ls_cod_con04,ls_base01,ls_base02,ls_base03,ls_base05,ls_base06
long		ll_tot_reg,ll_cod_parque,ll_cta_vtas,ll_new,ll_rut
datetime	ldt_fecha_comision
double	ldb_sum_vtas,ldb_valor_uf,ldb_sum_ing

gf_centrar(w_comision_resumen_at)
dw_resumen.dataobject						= 'dw_comision_resumen_at'
dw_resumen.settransobject(sqlca)

ldt_fecha_comision							= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
ls_tipo_comi										= substr(1,2,Message.StringParm)
ls_tipo_cob										= substr(1,3,Message.StringParm)
dw_resumen.Object.usuario.text 			= gs_user
if ls_tipo_comi='A' then
	if ls_tipo_cob='N' then
		ls_cod_con01								= '069'
		ls_cod_con02								= '071'
		ls_cod_con03								= '076'
		ls_cod_con04								= '020'
		ls_base01									= 'O'
		ls_base02									= 'L'
		ls_base03									= 'A'
		ls_base04									= 'D'
		ls_base05									= 'U'
		ls_base06									= 'G'
	elseif ls_tipo_cob='C' then
		ls_cod_con01								= '007'
		ls_cod_con02								= 'P21'
		ls_base01									= 'O'
		ls_base02									= 'P'
		ls_base03									= 'C'
		ls_base04									= 'X'
		ls_base05									= 'X'
		ls_base06									= 'X'
	elseif ls_tipo_cob='E' then
		ls_cod_con01								= '007'
		ls_cod_con02								= 'P22'
		ls_base01									= 'O'
		ls_base02									= 'P'
		ls_base03									= 'X'
		ls_base04									= 'X'
		ls_base05									= 'X'
		ls_base06									= 'X'
	elseif ls_tipo_cob='M' then
		ls_cod_con01								= '007'
		ls_cod_con02								= 'P20'
		ls_base01									= 'O'
		ls_base02									= 'C'
		ls_base03									= 'X'
		ls_base04									= 'X'
		ls_base05									= 'X'
		ls_base06									= 'X'
	end if
elseif ls_tipo_comi='N' then
	ls_cod_con01									= '070'
	ls_cod_con02									= '072'
	ls_cod_con03									= '077'
	ls_base01										= 'O'
	ls_base02										= 'L'
	ls_base03										= 'X'
	ls_base04										= 'X'
	ls_base05										= 'U'
	ls_base06										= 'G'
end if
if ls_tipo_comi='A' then
	if ls_tipo_cob='N' then
		dw_resumen.Object.titulo02.text 		= "Resumen Bono Especial (Movilización) por Ventas"
	elseif ls_tipo_cob='C' then
		dw_resumen.Object.titulo02.text 		= "Resumen Premio Cartera Cobr. Crédito"
	elseif ls_tipo_cob='M' then
		dw_resumen.Object.titulo02.text 		= "Resumen Comisión y Premio Cartera Cobr. Mantención"
	elseif ls_tipo_cob='E' then
		dw_resumen.Object.titulo02.text 		= "Resumen Premio Cartera Cobr. Especial"	
	end if
	DECLARE x1 CURSOR FOR
	SELECT	distinct "CADENA"."COD_PARQUE",
				"RES_COMI"."COD_AGE_SUP",
				"RES_COMI"."COD_CONTABLE", 
				"CODIGO_CONTABLE"."DESCRIPCION",
				"RES_COMI"."VALOR_UF",
				"AGENTES"."RUT",
				"AGENTES"."NOMBRE",
				"AGENTES"."A_PATERNO",
				"AGENTES"."A_MATERNO",
				count("RES_COMI"."COD_CONTABLE"),   
				sum("RES_COMI"."TOTAL_PAGO"),   
				sum("RES_COMI"."MONT_AGE_SUP")   
	FROM		"RES_COMI","AGENTES","CODIGO_CONTABLE","CADENA","AT_GESTION"  
	WHERE 	"RES_COMI"."SERIE" ="CADENA"."SERIE" and  
				"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and
				"CADENA"."CODIGO" = "AT_GESTION"."BASE" and  
				"CADENA"."SERIE" = "AT_GESTION"."SERIE" and  
				"CADENA"."NUMERO" = "AT_GESTION"."NUMERO" and  
				"RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" and  
				"RES_COMI"."COD_CONTABLE" = "CODIGO_CONTABLE"."CODIGO" and  
				"RES_COMI"."FECHA" = :ldt_fecha_comision AND  
				"RES_COMI"."ESTADO_AGE_SUP" = 'A' AND
				"AT_GESTION"."TIPO_COBRANZA" = :ls_tipo_cob AND  
				("RES_COMI"."COD_CONTABLE" = :ls_cod_con01 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_con02 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_con03 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_con04 ) AND  
				("CADENA"."CODIGO" = :ls_base01 OR "CADENA"."CODIGO" = :ls_base02 OR "CADENA"."CODIGO" = :ls_base03 OR "CADENA"."CODIGO" = :ls_base04 OR "CADENA"."CODIGO" = :ls_base05 OR "CADENA"."CODIGO" = :ls_base06)
	GROUP BY "CADENA"."COD_PARQUE",
				"RES_COMI"."COD_CONTABLE",
				"RES_COMI"."COD_AGE_SUP",
				"CODIGO_CONTABLE"."DESCRIPCION",
				"RES_COMI"."VALOR_UF",
				"AGENTES"."RUT",
				"AGENTES"."NOMBRE",
				"AGENTES"."A_PATERNO",
				"AGENTES"."A_MATERNO"
	ORDER BY "CADENA"."COD_PARQUE",
				"RES_COMI"."COD_CONTABLE",
				"RES_COMI"."COD_AGE_SUP"
	USING		sqlca;			
elseif ls_tipo_comi='N' then
	dw_resumen.Object.titulo02.text 		= "Resumen Comisiones por Ventas Nuevas"
	DECLARE x2 CURSOR FOR
	SELECT	"CADENA"."COD_PARQUE",
				"RES_COMI"."COD_AGE_SUP",
				"RES_COMI"."COD_CONTABLE", 
				"CODIGO_CONTABLE"."DESCRIPCION",
				"RES_COMI"."VALOR_UF",
				"AGENTES"."RUT",
				"AGENTES"."NOMBRE",
				"AGENTES"."A_PATERNO",
				"AGENTES"."A_MATERNO",
				count("RES_COMI"."COD_CONTABLE"),   
				sum("RES_COMI"."TOTAL_PAGO") ,
				sum("RES_COMI"."MONT_AGE_SUP")
	FROM		"RES_COMI","AGENTES","CODIGO_CONTABLE","CADENA"  
	WHERE 	"RES_COMI"."BASE" = "CADENA"."CODIGO" and
				"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
				"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
				"RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" and  
				"RES_COMI"."COD_CONTABLE" = "CODIGO_CONTABLE"."CODIGO" and  
				"RES_COMI"."FECHA" = :ldt_fecha_comision AND  
				"RES_COMI"."ESTADO_AGE_SUP" = 'A' AND  
				("RES_COMI"."COD_CONTABLE" = :ls_cod_con01 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_con02 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_con03 ) AND  
				("CADENA"."CODIGO" = :ls_base01 OR "CADENA"."CODIGO" = :ls_base02 OR "CADENA"."CODIGO" = :ls_base03 OR "CADENA"."CODIGO" = :ls_base04 OR "CADENA"."CODIGO" = :ls_base05 OR "CADENA"."CODIGO" = :ls_base06)
	GROUP BY "CADENA"."COD_PARQUE",
				"RES_COMI"."COD_CONTABLE",
				"RES_COMI"."COD_AGE_SUP",
				"CODIGO_CONTABLE"."DESCRIPCION",
				"RES_COMI"."VALOR_UF",
				"AGENTES"."RUT",
				"AGENTES"."NOMBRE",
				"AGENTES"."A_PATERNO",
				"AGENTES"."A_MATERNO"
	ORDER BY "CADENA"."COD_PARQUE",
				"RES_COMI"."COD_CONTABLE",
				"RES_COMI"."COD_AGE_SUP"
	USING		sqlca;			
end if
if ls_tipo_comi = 'A' then
	open x1;
elseif ls_tipo_comi = 'N' then 
	open x2;
end if
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		if ls_tipo_comi = 'A' then
			fetch x1 INTO	:ll_cod_parque,:ls_codigo,:ls_cod_cont,:ls_decrip,:ldb_valor_uf,:ll_rut,:ls_nombre,:ls_a_pater,:ls_a_mater,:ll_cta_vtas,:ldb_sum_vtas,:ldb_sum_ing;
		elseif ls_tipo_comi = 'N' then 
			fetch x2 INTO	:ll_cod_parque,:ls_codigo,:ls_cod_cont,:ls_decrip,:ldb_valor_uf,:ll_rut,:ls_nombre,:ls_a_pater,:ls_a_mater,:ll_cta_vtas,:ldb_sum_vtas,:ldb_sum_ing;
		end if
		if not isnull(ll_cod_parque) or ll_cod_parque > 0 and not isnull(ls_codigo) or ls_codigo <> '' and not isnull(ls_cod_cont) or ls_cod_cont <> ''then
			ls_nombre							= ls_nombre+' '+ls_a_pater+' ' +ls_a_mater
			ll_new								= dw_resumen.insertrow(0)
			dw_resumen.scrolltorow(ll_new)
			dw_resumen.setitem(ll_new,"cod_parque",ll_cod_parque)
			dw_resumen.setitem(ll_new,"fecha",ldt_fecha_comision)
			dw_resumen.setitem(ll_new,"valor_uf",ldb_valor_uf)
			dw_resumen.setitem(ll_new,"codigo",ls_codigo)
			dw_resumen.setitem(ll_new,"cod_contab",ls_cod_cont)
			dw_resumen.setitem(ll_new,"descripcion",ls_decrip)
			dw_resumen.setitem(ll_new,"rut",ll_rut)
			dw_resumen.setitem(ll_new,"nombre",ls_nombre)
			dw_resumen.setitem(ll_new,"n_ventas",ll_cta_vtas)
			dw_resumen.setitem(ll_new,"total_pagos",ldb_sum_vtas)
			dw_resumen.setitem(ll_new,"mto_ing",ldb_sum_ing)
			dw_resumen.accepttext()
		end if
		setnull(ll_cod_parque);setnull(ll_cod_parque);setnull(ls_codigo);setnull(ls_cod_cont);setnull(ls_decrip);&
		setnull(ls_nombre);setnull(ls_a_pater);setnull(ls_a_mater);setnull(ll_cta_vtas);setnull(ldb_sum_vtas)
	LOOP
end if
ll_tot_reg										= dw_resumen.rowcount() 
if ls_tipo_comi = 'A' then
	close x1;
elseif ls_tipo_comi = 'N' then
	close x2;
end if
if ll_tot_reg=0 then
	messagebox("Advertencia","No registra dato")
	close(w_comision_resumen_at)
end if
end event

type cb_imprimir from commandbutton within w_comision_resumen_at
integer x = 2944
integer y = 1912
integer width = 315
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long		ll_res

if dw_resumen.rowcount() > 0 then
	ll_res			= MessageBox("Imprimir", "Desea Imprimir el Informe", Exclamation!, YesNo!, 2)
	if ll_res=1 then
		f_Print( dw_resumen )
	else
		messagebox('Advertencia','Proceso Cancelado')
	end if
else
	messagebox('Advertencia','No Registra Datos para Imprimir')
end if
end event

type cb_cerrar from commandbutton within w_comision_resumen_at
integer x = 3264
integer y = 1912
integer width = 315
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_resumen_at)
end event

type dw_resumen from datawindow within w_comision_resumen_at
integer x = 41
integer y = 36
integer width = 3534
integer height = 1856
integer taborder = 10
string title = "none"
string dataobject = "dw_comision_resumen_at"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

