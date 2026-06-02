forward
global type w_vista_presupuesto_bkp from window
end type
type cb_imprimir from commandbutton within w_vista_presupuesto_bkp
end type
type cb_cerrar from commandbutton within w_vista_presupuesto_bkp
end type
type dw_lista from datawindow within w_vista_presupuesto_bkp
end type
end forward

global type w_vista_presupuesto_bkp from window
integer width = 3643
integer height = 2536
boolean titlebar = true
string title = "Vista Previa Presupuesto"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_vista_presupuesto_bkp w_vista_presupuesto_bkp

type variables
String		is_empresa
Long		il_anno, il_mes,il_parque
end variables

forward prototypes
public subroutine wf_formato ()
end prototypes

public subroutine wf_formato ();dw_lista.object.sum_cod_grupo.format    							= '###,###,###,##0'
dw_lista.object.c_real_mes_group_1.format    						= '###,###,###,##0'
dw_lista.object.ppto_x_mes.format    								= '###,###,###,##0'
dw_lista.object.c_real_mes_group_2.format    						= '###,###,###,##0'
dw_lista.object.c_real_mes_group_3.format    						= '###,###,###,##0'
dw_lista.object.dv_prgdettot_mto_debito.format    				= '###,###,###,##0'
dw_lista.object.dv_prgdettot_mto_credto.format    				= '###,###,###,##0'
dw_lista.object.c_real_mes.format    									= '###,###,###,##0'
//dw_lista.object.c_real_mes_total.format    							= '###,###,###,##0'
dw_lista.object.c_c_difer_valor_group_1.format    				= '###,###,###,##0'
dw_lista.object.c_difer_valor.format    								= '###,###,###,##0'
dw_lista.object.c_porce_group1.format    							= '###,###,###,##0.00%'
dw_lista.object.c_porce_group2.format    							= '###,###,###,##0.00%'
dw_lista.object.c_tot_difer_porcen.format							= '###,###,###,##0.00%'
dw_lista.accepttext()




end subroutine

on w_vista_presupuesto_bkp.create
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_vista_presupuesto_bkp.destroy
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;String	ls_fecha,ls_descrip,ls_cod_mes,ls_ventana,ls_parque,ls_grupo
Long ll_ppto_mes,ll_row,ll_cod_grupo,ll_tot_reg,ll_indi,ll_ppto_x_mes,ll_cod_parque,ll_codigo_grupo,ll_sum_ppto_mes,ll_sum_tot_ppto,ll_sum_tot_real

gf_centrar(w_vista_presupuesto)
Connect Using Trans_3;

is_empresa						= substr(1,1,Message.StringParm)
il_mes							= Long(substr(1,2,Message.StringParm))
il_anno							= Long(substr(1,3,Message.StringParm))
il_parque							= Long(substr(1,4,Message.StringParm))
if il_parque=0 then
	dw_lista.dataobject		= 'dw_presupuesto_mes_tw_todos'
else
	dw_lista.dataobject		= 'dw_presupuesto_mes_tw'
end if
dw_lista.settransobject(Trans_3)
CHOOSE CASE il_mes
	CASE 1
		ls_fecha					= 'Enero'
		ls_cod_mes				= '01'
	CASE 2
		ls_fecha					= 'Febrero'
		ls_cod_mes				= '02'
	CASE 3
		ls_fecha					= 'Marzo'
		ls_cod_mes				= '03'
	CASE 4
		ls_fecha					= 'Abril'
		ls_cod_mes				= '04'
	CASE 5
		ls_fecha					= 'Mayo'
		ls_cod_mes				= '05'
	CASE 6
		ls_fecha					= 'Junio'
		ls_cod_mes				= '06'
	CASE 7
		ls_fecha					= 'Julio'
		ls_cod_mes				= '07'
	CASE 8
		ls_fecha					= 'Agosto'
		ls_cod_mes				= '08'
	CASE 9
		ls_fecha					= 'Septiembre'
		ls_cod_mes				= '09'
	CASE 10
		ls_fecha					= 'Octubre'
		ls_cod_mes				= '10'
	CASE 11
		ls_fecha					= 'Noviembre'
		ls_cod_mes				= '11'
	CASE 12
		ls_fecha					= 'Diciembre'
		ls_cod_mes				= '12'
END CHOOSE
ls_fecha							= ls_fecha + ' del '+string(il_anno,'0000')
w_vista_presupuesto.title	= 'Vista Previa Presupuesto Periodo de '+ ls_fecha
if il_parque=0 then
	ll_tot_reg					= dw_lista.retrieve(is_empresa,il_anno,ls_cod_mes)
else
	ll_tot_reg					= dw_lista.retrieve(is_empresa,il_anno,ls_cod_mes,il_parque)
end if
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_grupo					= dw_lista.getitemstring(ll_indi,'grupo')
		ll_codigo_grupo		= dw_lista.getitemnumber(ll_indi,'codigo_grupo')
		ll_cod_parque			= dw_lista.getitemnumber(ll_indi,'presupuesto_consulta_cod_parque')
		If il_parque=0 then
			SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES")
			INTO		:ll_ppto_x_mes
			FROM		"PRESUPUESTO_CONSULTA"
			WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
						(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
						(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
			USING	Trans_3;
		else
			SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES")
			INTO		:ll_ppto_x_mes
			FROM		"PRESUPUESTO_CONSULTA"
			WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
						(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
						(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
						(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
			USING	Trans_3;
		end if
		if Trans_3.sqlcode=0 then
			if not isnull(ll_ppto_x_mes) then
				ll_ppto_x_mes						= ll_ppto_x_mes
			else
				ll_ppto_x_mes						= 0
			end if
		else
			ll_ppto_x_mes							= 0
		end if
		
		If il_parque=0 then
			SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES")
			INTO		:ll_sum_ppto_mes
			FROM		"PRESUPUESTO_CONSULTA"
			WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
						(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
						(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						(	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO" = :ll_codigo_grupo )
			USING	Trans_3;			
		else
			SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES")
			INTO		:ll_sum_ppto_mes
			FROM		"PRESUPUESTO_CONSULTA"
			WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
						(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
						(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						(	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO" = :ll_codigo_grupo ) AND
						(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
			USING	Trans_3;		
		end if
		if Trans_3.sqlcode=0 then
			if not isnull(ll_sum_ppto_mes) then
				ll_sum_ppto_mes						= ll_sum_ppto_mes
			else
				ll_sum_ppto_mes						= 0
			end if
		else
			ll_sum_ppto_mes							= 0
		end if
		
		If il_parque=0 then
			SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES")//,sum("PRESUPUESTO_CONSULTA"."REAL_MES")
			INTO		:ll_sum_tot_ppto//,:ll_sum_tot_real
			FROM		"PRESUPUESTO_CONSULTA"
			WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
						(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
						(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )
			USING	Trans_3;			
		else
			SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES")//,sum("PRESUPUESTO_CONSULTA"."REAL_MES")
			INTO		:ll_sum_tot_ppto//,:ll_sum_tot_real
			FROM		"PRESUPUESTO_CONSULTA"
			WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
						(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
						(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
			USING	Trans_3;		
		end if
		if Trans_3.sqlcode=0 then
			if not isnull(ll_sum_tot_ppto) then
				ll_sum_tot_ppto						= ll_sum_tot_ppto
			else
				ll_sum_tot_ppto						= 0
			end if
			
			if not isnull(ll_sum_tot_real) then
				ll_sum_tot_real							= ll_sum_tot_real
			else
				ll_sum_tot_real							= 0
			end if
		else
			ll_sum_tot_ppto							= 0
			ll_sum_tot_real								= 0
		end if
		dw_lista.setitem(ll_indi,"ppto_x_mes",ll_ppto_x_mes)
		dw_lista.setitem(ll_indi,"sum_cod_grupo",ll_sum_ppto_mes)
		dw_lista.setitem(ll_indi,"sum_tot_ppto",ll_sum_tot_ppto)
//		dw_lista.setitem(ll_indi,"sum_tot_real",ll_sum_tot_real)
	next
else
	messagebox("Advertencia","No Registra Datos")
end if
dw_lista.ExpandLevel(1)
wf_formato()
dw_lista.accepttext()
end event

type cb_imprimir from commandbutton within w_vista_presupuesto_bkp
integer x = 37
integer y = 2280
integer width = 325
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom				= 65
	f_printdlg(dw_lista,gstr_print,w_vista_presupuesto)
	dw_lista.object.datawindow.Print.Preview	= false
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type cb_cerrar from commandbutton within w_vista_presupuesto_bkp
integer x = 3255
integer y = 2280
integer width = 325
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_vista_presupuesto)
end event

type dw_lista from datawindow within w_vista_presupuesto_bkp
integer x = 37
integer y = 36
integer width = 3543
integer height = 2200
integer taborder = 10
string title = "none"
string dataobject = "dw_presupuesto_mes_tw"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

