forward
global type w_comision_resumen_cob_tele from window
end type
type cb_imprimir from commandbutton within w_comision_resumen_cob_tele
end type
type cb_cerrar from commandbutton within w_comision_resumen_cob_tele
end type
type dw_resumen from datawindow within w_comision_resumen_cob_tele
end type
end forward

global type w_comision_resumen_cob_tele from window
integer width = 3634
integer height = 2180
boolean titlebar = true
string title = "Resumen Comisión Ejecutivos Cobranza Telefonica"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_resumen dw_resumen
end type
global w_comision_resumen_cob_tele w_comision_resumen_cob_tele

on w_comision_resumen_cob_tele.create
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_resumen=create dw_resumen
this.Control[]={this.cb_imprimir,&
this.cb_cerrar,&
this.dw_resumen}
end on

on w_comision_resumen_cob_tele.destroy
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_resumen)
end on

event open;string		ls_cod_cont,ls_codigo,ls_decrip,ls_nombre,ls_a_pater,ls_a_mater
long		ll_cod_parque,ll_rut,ll_cta_vtas,ll_new,ll_tot_reg
datetime	ldt_fec_comi
double	ldb_valor_uf,ldb_sum_vtas,ldb_sum_ing

gf_centrar(w_comision_resumen_cob_tele)
dw_resumen.dataobject						= 'dw_comision_resumen_cod_tele'
dw_resumen.settransobject(sqlca)
ldt_fec_comi									= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
dw_resumen.object.usuario.text 			= gs_user
ls_cod_cont										= 'C01'
if not isnull(ldt_fec_comi) then
	dw_resumen.Object.titulo02.text 		= "Resumen Comisiones Cobranza Telefónica"
	DECLARE x1 CURSOR FOR
	SELECT	distinct //"CADENA"."COD_PARQUE",
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
	FROM		"RES_COMI","AGENTES","CODIGO_CONTABLE","CADENA" 
	WHERE 	"RES_COMI"."BASE" ="CADENA"."CODIGO" and  
				"RES_COMI"."SERIE" ="CADENA"."SERIE" and  
				"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and
				"RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" and  
				"RES_COMI"."COD_CONTABLE" = "CODIGO_CONTABLE"."CODIGO" and  
				"RES_COMI"."FECHA" = :ldt_fec_comi AND  
				"RES_COMI"."ESTADO_AGE_SUP" = 'A' AND
				"RES_COMI"."COD_CONTABLE" = :ls_cod_cont
	GROUP BY //"CADENA"."COD_PARQUE",
				"RES_COMI"."COD_CONTABLE",
				"RES_COMI"."COD_AGE_SUP",
				"CODIGO_CONTABLE"."DESCRIPCION",
				"RES_COMI"."VALOR_UF",
				"AGENTES"."RUT",
				"AGENTES"."NOMBRE",
				"AGENTES"."A_PATERNO",
				"AGENTES"."A_MATERNO"
	ORDER BY //"CADENA"."COD_PARQUE",
				"RES_COMI"."COD_CONTABLE",
				"RES_COMI"."COD_AGE_SUP"
	USING	sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ls_codigo,:ls_cod_cont,:ls_decrip,:ldb_valor_uf,:ll_rut,:ls_nombre,:ls_a_pater,:ls_a_mater,:ll_cta_vtas,:ldb_sum_vtas,:ldb_sum_ing;
			if not isnull(ll_cod_parque) or ll_cod_parque > 0 and not isnull(ls_codigo) or ls_codigo <> '' and not isnull(ls_cod_cont) or ls_cod_cont <> ''then
				ls_nombre							= ls_nombre+' '+ls_a_pater+' ' +ls_a_mater
				ll_new								= dw_resumen.insertrow(0)
				dw_resumen.scrolltorow(ll_new)
				dw_resumen.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_resumen.setitem(ll_new,"fecha",ldt_fec_comi)
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
	close x1;
	ll_tot_reg										= dw_resumen.rowcount() 
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Datos")
		close(w_comision_resumen_cob_tele)
	end if
end if
end event

type cb_imprimir from commandbutton within w_comision_resumen_cob_tele
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
	ll_res			= MessageBox("Imprimir", "Desea Imprimir Informe", Exclamation!, YesNo!, 2)
	if ll_res=1 then
		f_Print( dw_resumen )
//		f_printdlg(dw_resumen,gstr_print,parent)
	else
		messagebox('Advertencia','Proceso Cancelado')
	end if
else
	messagebox('Advertencia','No Registra Datos para Imprimir')
end if
end event

type cb_cerrar from commandbutton within w_comision_resumen_cob_tele
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

event clicked;close(w_comision_resumen_cob_tele)
end event

type dw_resumen from datawindow within w_comision_resumen_cob_tele
integer x = 41
integer y = 36
integer width = 3534
integer height = 1856
integer taborder = 10
string title = "none"
string dataobject = "dw_comision_resumen_cod_tele"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

