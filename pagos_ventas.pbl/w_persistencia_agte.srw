forward
global type w_persistencia_agte from window
end type
type cb_detalle from commandbutton within w_persistencia_agte
end type
type dw_fecha_clasif from datawindow within w_persistencia_agte
end type
type dw_superv_venta from datawindow within w_persistencia_agte
end type
type cb_imprimir from commandbutton within w_persistencia_agte
end type
type pb_aceptar from picturebutton within w_persistencia_agte
end type
type cb_cerrar from commandbutton within w_persistencia_agte
end type
type dw_clasifica from datawindow within w_persistencia_agte
end type
end forward

global type w_persistencia_agte from window
integer width = 4005
integer height = 2156
boolean titlebar = true
string title = "Clasificación Agentes de Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_detalle cb_detalle
dw_fecha_clasif dw_fecha_clasif
dw_superv_venta dw_superv_venta
cb_imprimir cb_imprimir
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
dw_clasifica dw_clasifica
end type
global w_persistencia_agte w_persistencia_agte

type variables
long il_row
end variables

forward prototypes
public function string wf_clasif (string as_cargo, string as_codigo, datetime adt_fecha)
end prototypes

public function string wf_clasif (string as_cargo, string as_codigo, datetime adt_fecha);string	ls_clasif

//wf_clasif(as_cargo,as_codigo.adt_fecha)
if as_cargo='A' then
	SELECT	"TIPO_CLASIFICA"  
	INTO		:ls_clasif  
	FROM		"CLASIFICA_HIST"  
	WHERE 	( "CLASIFICA_HIST"."COD_AGE" = :as_codigo ) AND  
				( "CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fecha )
	USING	sqlca;
elseif as_cargo='S' then
	SELECT	"TIPO_CLASIFICA_SUP"  
	INTO		:ls_clasif  
	FROM		"CLASIFICA_HIST_SUP"  
	WHERE 	( "CLASIFICA_HIST_SUP"."COD_SUP" = :as_codigo ) AND  
				( "CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fecha )
	USING	sqlca;
end if
if isnull(ls_clasif) then ls_clasif=''
return ls_clasif
end function

on w_persistencia_agte.create
this.cb_detalle=create cb_detalle
this.dw_fecha_clasif=create dw_fecha_clasif
this.dw_superv_venta=create dw_superv_venta
this.cb_imprimir=create cb_imprimir
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_clasifica=create dw_clasifica
this.Control[]={this.cb_detalle,&
this.dw_fecha_clasif,&
this.dw_superv_venta,&
this.cb_imprimir,&
this.pb_aceptar,&
this.cb_cerrar,&
this.dw_clasifica}
end on

on w_persistencia_agte.destroy
destroy(this.cb_detalle)
destroy(this.dw_fecha_clasif)
destroy(this.dw_superv_venta)
destroy(this.cb_imprimir)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_clasifica)
end on

event open;string	ls_cod_sup
datetime	ldt_fecha_clas

connect using Trans_2;
gf_centrar(w_persistencia_agte)

ldt_fecha_clas									= datetime(date(substr(1,1,Message.StringParm)))
dw_fecha_clasif.dataobject					= 'dwe_lista_cierre_clasif'
dw_fecha_clasif.settransobject(sqlca)
dw_fecha_clasif.insertrow(0)
dw_fecha_clasif.setitem(1,'fecha_clasif',ldt_fecha_clas)
dw_fecha_clasif.accepttext()

dw_clasifica.dataobject						= 'dw_persistencia_agte'
dw_clasifica.settransobject(sqlca)
dw_clasifica.object.usuario.text				= gs_user

ls_cod_sup										= substr(1,2,Message.StringParm)
dw_superv_venta.dataobject				= 'dwe_superv_depto'
dw_superv_venta.settransobject(sqlca)
dw_superv_venta.insertrow(0)
dw_superv_venta.setitem(1,'cod_sup',ls_cod_sup)
dw_superv_venta.accepttext()
dw_superv_venta.Object.cod_sup.Protect=1
dw_superv_venta.enabled						= false
pb_aceptar.triggerevent(clicked!)

end event

event close;disconnect using Trans_2;
end event

type cb_detalle from commandbutton within w_persistencia_agte
integer x = 50
integer y = 1912
integer width = 585
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Ventas Agentes"
end type

event clicked;string	ls_codigo,ls_string,ls_cargo
double	ldb_numero
datetime	ldt_fecha_cierre

dw_fecha_clasif.AcceptText()
dw_clasifica.AcceptText()
if dw_clasifica.rowcount() > 0 then
	ldt_fecha_cierre			= dw_fecha_clasif.getitemdatetime(1,'fecha_clasif')
	ls_codigo						= dw_clasifica.getitemstring(il_row,'codigo')
	ldb_numero					= dw_clasifica.getitemnumber(il_row,'cant_pro')
	ls_cargo						= dw_clasifica.getitemstring(il_row,'cargo')
	
	if not isnull(ldt_fecha_cierre) and not isnull(ls_codigo) and not isnull(ls_cargo)  then
		ls_string													= ls_codigo+'~t'+string(ldt_fecha_cierre,'dd/mm/yyyy')+'~t'+ls_cargo
		if isvalid(w_persistencia_detalle) then close(w_persistencia_detalle)
			OpenWithParm(w_persistencia_detalle, ls_string)
	else
		messagebox("Advertencia","No Registra Datos")
	end if
end if
end event

type dw_fecha_clasif from datawindow within w_persistencia_agte
integer x = 69
integer y = 56
integer width = 951
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_cierre_clasif"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_clasifica.reset()
pb_aceptar.triggerevent(clicked!)
end event

type dw_superv_venta from datawindow within w_persistencia_agte
integer x = 1065
integer y = 52
integer width = 1646
integer height = 104
integer taborder = 20
string title = "none"
string dataobject = "dwe_superv_depto"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_clasifica.reset()
pb_aceptar.triggerevent(clicked!)
end event

type cb_imprimir from commandbutton within w_persistencia_agte
integer x = 1879
integer y = 1912
integer width = 274
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_clasifica.rowcount() > 0 then f_Print( dw_clasifica )
end event

type pb_aceptar from picturebutton within w_persistencia_agte
boolean visible = false
integer x = 2715
integer y = 40
integer width = 128
integer height = 104
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

event clicked;string		ls_cod_jefe,ls_cod_sup,ls_clasif,ls_nombre,ls_a_paterno,ls_a_materno,ls_nombre_compl,ll_vsp,ls_cargo,&
			ls_clas_12,ls_clas_11,ls_clas_10,ls_clas_9,ls_clas_8,ls_clas_7,ls_clas_6,ls_clas_5,ls_clas_4,ls_clas_3,ls_clas_2,ls_clas_1,ls_cod_agte,ls_clas_12_sup
long		ll_cod_parque,ll_mes,ll_ano,ll_new,ll_vsp_sup
datetime	ldt_fecha_12,ldt_fecha_ini_12,ldt_fecha_11,ldt_fecha_ini_11,ldt_fecha_10,ldt_fecha_ini_10,ldt_fecha_9,ldt_fecha_ini_9,&
			ldt_fecha_8,ldt_fecha_ini_8,ldt_fecha_7,ldt_fecha_ini_7,ldt_fecha_6,ldt_fecha_ini_6,ldt_fecha_5,ldt_fecha_ini_5,&
			ldt_fecha_4,ldt_fecha_ini_4,ldt_fecha_3,ldt_fecha_ini_3,ldt_fecha_2,ldt_fecha_ini_2,ldt_fecha_1,ldt_fecha_ini_1,&
			ldt_fecha_ini
double	ldb_porc,ldb_porc_sup,ldb_ctto,ldb_mora,ldb_ctto_sup,ldb_mora_sup

dw_fecha_clasif.accepttext()
dw_superv_venta.accepttext()

ldt_fecha_12															= dw_fecha_clasif.getitemdatetime(1,'fecha_clasif')
ls_cod_sup																= dw_superv_venta.getitemstring(1,'cod_sup')

if isnull(ldt_fecha_12) then
	messagebox("Advertencia","Debe Seleccionar Fecha Clasificación")
	dw_fecha_clasif.setfocus()
elseif  isnull(ls_cod_sup) and ls_cod_sup = '' then
	messagebox("Advertencia","Debe Seleccionar Jefe de Ventas")
	dw_superv_venta.setfocus()
else
	
	SELECT	"COD_JEFE",		"COD_PARQUE"  
	INTO 		:ls_cod_jefe,	:ll_cod_parque   
   	FROM		"SUPERVISOR"  
   	WHERE 	( "SUPERVISOR"."COD_SUP" = :ls_cod_sup )
	USING	sqlca;
	if isnull(ls_cod_jefe) then ls_cod_jefe=''
	if isnull(ll_cod_parque) then ll_cod_parque=0
	
	DECLARE x1 CURSOR FOR
	SELECT		"COD_AGE",	"FECHA_INI",	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"CARGO"
	FROM			"AGENTES"  
	WHERE		( "AGENTES"."COD_SUP" = :ls_cod_sup) AND
					( "AGENTES"."ESTADO" = 'A') and
					( "AGENTES"."PAGOS_VENTA" = 'S')
	ORDER BY 	"AGENTES"."FECHA_INI" ASC
	USING		Trans_2;
	open x1;
	if Trans_2.sqlcode=0 then
		DO WHILE Trans_2.sqlcode=0
		fetch x1 into :ls_cod_agte, :ldt_fecha_ini, :ls_nombre,	:ls_a_paterno,	:ls_a_materno, :ls_cargo;
			if not isnull(ls_cod_agte) and ls_cod_agte<>'' then
				ls_nombre_compl									= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
				ll_new												= dw_clasifica.insertrow(0)
				dw_clasifica.scrolltorow(ll_new)
				dw_clasifica.setitem(ll_new,'cod_parque', ll_cod_parque)
				dw_clasifica.setitem(ll_new,'jefe_vtas', ls_cod_jefe)
				dw_clasifica.setitem(ll_new,'cod_jefe', ls_cod_sup)
				dw_clasifica.setitem(ll_new,'codigo', ls_cod_agte)
				dw_clasifica.setitem(ll_new,'fecha_ini', ldt_fecha_ini)
				dw_clasifica.setitem(ll_new,'nombre', ls_nombre_compl)
				dw_clasifica.setitem(ll_new,'cargo', ls_cargo)
				
				SELECT to_date(add_months( to_date(:ldt_fecha_12), -1 )) INTO :ldt_fecha_11 FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_11), -1 )) INTO :ldt_fecha_10 FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_10), -1 )) INTO :ldt_fecha_9 FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_9), -1 )) INTO :ldt_fecha_8 FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_8), -1 )) INTO :ldt_fecha_7 FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_7), -1 )) INTO :ldt_fecha_6 FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_6), -1 )) INTO :ldt_fecha_5 FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_5), -1 )) INTO :ldt_fecha_4 FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_4), -1 )) INTO :ldt_fecha_3 FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_3), -1 )) INTO :ldt_fecha_2 FROM dual;
				SELECT to_date(add_months( to_date(:ldt_fecha_2), -1 )) INTO :ldt_fecha_1 FROM dual;
				
				dw_clasifica.object.mes12_t.text					= string(ldt_fecha_12,'dd/mm/yyyy')
				dw_clasifica.object.mes11_t.text					= string(ldt_fecha_11,'dd/mm/yy')
				dw_clasifica.object.mes10_t.text					= string(ldt_fecha_10,'dd/mm/yy')
				dw_clasifica.object.mes9_t.text						= string(ldt_fecha_9,'dd/mm/yy')
				dw_clasifica.object.mes8_t.text						= string(ldt_fecha_8,'dd/mm/yy')
				dw_clasifica.object.mes7_t.text						= string(ldt_fecha_7,'dd/mm/yy')
				dw_clasifica.object.mes6_t.text						= string(ldt_fecha_6,'dd/mm/yy')
				dw_clasifica.object.mes5_t.text						= string(ldt_fecha_5,'dd/mm/yy')
				dw_clasifica.object.mes4_t.text						= string(ldt_fecha_4,'dd/mm/yy')
				dw_clasifica.object.mes3_t.text						= string(ldt_fecha_3,'dd/mm/yy')
				dw_clasifica.object.mes2_t.text						= string(ldt_fecha_2,'dd/mm/yy')
				dw_clasifica.object.mes1_t.text						= string(ldt_fecha_1,'dd/mm/yy')
				
				ls_clas_11												= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_11)
				ls_clas_10												= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_10)
				ls_clas_9													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_9)
				ls_clas_8													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_8)
				ls_clas_7													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_7)
				ls_clas_6													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_6)
				ls_clas_5													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_5)
				ls_clas_4													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_4)
				ls_clas_3													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_3)
				ls_clas_2													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_2)
				ls_clas_1													= wf_clasif(ls_cargo,ls_cod_agte,ldt_fecha_1)
				
				dw_clasifica.setitem(ll_new,'mes11', ls_clas_11)
				dw_clasifica.setitem(ll_new,'mes10', ls_clas_10)
				dw_clasifica.setitem(ll_new,'mes9', ls_clas_9)
				dw_clasifica.setitem(ll_new,'mes8', ls_clas_8)
				dw_clasifica.setitem(ll_new,'mes7', ls_clas_7)
				dw_clasifica.setitem(ll_new,'mes6', ls_clas_6)
				dw_clasifica.setitem(ll_new,'mes5', ls_clas_5)
				dw_clasifica.setitem(ll_new,'mes4', ls_clas_4)
				dw_clasifica.setitem(ll_new,'mes3', ls_clas_3)
				dw_clasifica.setitem(ll_new,'mes2', ls_clas_2)
				dw_clasifica.setitem(ll_new,'mes1', ls_clas_1)
				
				SELECT	"CONTRATOS_CLASIFICA_SUP",	"MORA_CLASIFICA_SUP",	"TIPO_CLASIFICA_SUP",	"PORCE_CLASIFICA_SUP",	"VSP"  
				INTO		:ldb_ctto_sup,			:ldb_mora_sup,				:ls_clas_12_sup,			:ldb_porc_sup,				:ll_vsp_sup  
				FROM		"CLASIFICA_HIST_SUP"  
				WHERE 	( "CLASIFICA_HIST_SUP"."COD_SUP" = :ls_cod_sup ) AND  
							( "CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :ldt_fecha_12 )
				USING	sqlca;
				if sqlca.sqlcode=0 then
					dw_clasifica.object.titulo_2_t.text		= "Total Ventas :  "+string(ldb_ctto_sup,'###,###,##0.00')+"  -   Ventas en Mora : "+string(ldb_mora_sup,'###,###,##0.00')+"  -   Porcentaje : "+string(ldb_porc_sup,'###,###,##0.00')+" %"+"  -   Clasificación : "+(ls_clas_12_sup)
				end if
				
				SELECT	"CONTRATOS_CLASIFICA",	"MORA_CLASIFICA",	"TIPO_CLASIFICA",	"PORCE_CLASIFICA",	"VSP",	"TIPO_CLASIFICA"  
				INTO		:ldb_ctto,				:ldb_mora,			:ls_clas_12,		:ldb_porc,				:ll_vsp,	:ls_clasif  
				FROM		"CLASIFICA_HIST"  
				WHERE 	( "CLASIFICA_HIST"."COD_AGE" = :ls_cod_agte ) AND  
							( "CLASIFICA_HIST"."FECHA_CLASIFICA" = :ldt_fecha_12 )
				USING	sqlca;
				if isnull(ldb_ctto) then ldb_ctto=0
				if isnull(ldb_mora) then ldb_mora=0
				if isnull(ls_clas_12) then ls_clas_12=''
				if isnull(ldb_porc) then ldb_porc=0
				if isnull(ll_vsp) then ll_vsp=''
				if isnull(ls_clasif) then ls_clasif=''
				dw_clasifica.setitem(ll_new,'cant_pro',ldb_ctto)
				dw_clasifica.setitem(ll_new,'mora',ldb_mora)
				dw_clasifica.setitem(ll_new,'mes12',ls_clas_12)
				dw_clasifica.setitem(ll_new,'porc',ldb_porc)
				dw_clasifica.setitem(ll_new,'vsp',ll_vsp)
				dw_clasifica.setitem(ll_new,'clas_act', ls_clasif)
			end if
			Setnull(ls_cod_agte)
		LOOP
	end if
	close x1;
end if
end event

type cb_cerrar from commandbutton within w_persistencia_agte
integer x = 3666
integer y = 1912
integer width = 274
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_persistencia_agte)
end event

type dw_clasifica from datawindow within w_persistencia_agte
integer x = 50
integer y = 172
integer width = 3890
integer height = 1712
integer taborder = 40
string title = "none"
string dataobject = "dw_persistencia_agte"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;cb_detalle.triggerevent(clicked!)
end event

