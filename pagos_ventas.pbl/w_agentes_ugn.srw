forward
global type w_agentes_ugn from window
end type
type cb_1 from commandbutton within w_agentes_ugn
end type
type cb_grabar from commandbutton within w_agentes_ugn
end type
type cb_limpiar from commandbutton within w_agentes_ugn
end type
type cb_2 from commandbutton within w_agentes_ugn
end type
type cb_imprimir from commandbutton within w_agentes_ugn
end type
type dw_lista from datawindow within w_agentes_ugn
end type
type gb_1 from groupbox within w_agentes_ugn
end type
end forward

global type w_agentes_ugn from window
integer width = 3822
integer height = 1888
boolean titlebar = true
string title = "Ingreso Caja Supervisores"
boolean controlmenu = true
long backcolor = 67108864
cb_1 cb_1
cb_grabar cb_grabar
cb_limpiar cb_limpiar
cb_2 cb_2
cb_imprimir cb_imprimir
dw_lista dw_lista
gb_1 gb_1
end type
global w_agentes_ugn w_agentes_ugn

type variables
long il_row
end variables

forward prototypes
public function long wf_tot_reg (datetime adt_fecha_act)
end prototypes

public function long wf_tot_reg (datetime adt_fecha_act);long	ll_tot_reg,ll_tot_reg_peso,ll_tot_reg_uf

//wf_tot_reg(adt_fecha_act)
SELECT	count("CADENA"."CODIGO")
INTO		:ll_tot_reg_peso
FROM		"CADENA","OFERTA_V","PAGO_OFERTA","SUPERVISOR"  
WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
			"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
			"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
			"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
			"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
			"OFERTA_V"."COD_SUP" = "SUPERVISOR"."COD_SUP" and  
			"CADENA"."CODIGO" = 'O' AND
			"CADENA"."SERIE" <> 'R' AND    
			("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
			"PAGO_OFERTA"."MONEDA" = '1' AND  
			"SUPERVISOR"."ESTADO" = 'A' AND  
			"SUPERVISOR"."CANAL" = 'NF' AND
			"CADENA"."PREMIO_ING_CAJA" = 1 AND
			//"OFERTA_V"."CIERRE_VENTA" <= :adt_fecha_act AND  
			ROUND(((	SELECT	SUM("INGRESO"."MONTO")  
						FROM 		"INGRESO"  
						WHERE 	"INGRESO"."BASE" = "CADENA"."CODIGO" AND  
									"INGRESO"."SERIE" = "CADENA"."SERIE" AND  
									"INGRESO"."CONTRATO" = "CADENA"."NUMERO" AND  
									("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E') AND  
									"INGRESO"."FECHA_PAGO" <= :adt_fecha_act) * 100) / (("PAGO_OFERTA"."NRO_CUOTAS" * "PAGO_OFERTA"."VALOR_CUOTA") + "PAGO_OFERTA"."PIE_PAGADO"),2) >= 15
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_tot_reg_peso) and ll_tot_reg_peso>0 then
		ll_tot_reg_peso		= ll_tot_reg_peso
	else
		ll_tot_reg_peso		= 0
	end if
else
	ll_tot_reg_peso			= 0
end if
	 
 
SELECT	count("CADENA"."CODIGO")
INTO		:ll_tot_reg_uf
FROM		"CADENA","OFERTA_V","PAGO_OFERTA","SUPERVISOR","TAB_UF"  
WHERE		"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
			"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
			"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
			"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
			"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
			"OFERTA_V"."COD_SUP" = "SUPERVISOR"."COD_SUP" and  
			"CADENA"."CODIGO" = 'O' AND
			"CADENA"."SERIE" <> 'R' AND    
			("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
			"PAGO_OFERTA"."MONEDA" = '2' AND  
			"SUPERVISOR"."ESTADO" = 'A' AND  
			"SUPERVISOR"."CANAL" = 'NF' AND
			"CADENA"."PREMIO_ING_CAJA" = 1 AND  
			//"OFERTA_V"."CIERRE_VENTA" <= :adt_fecha_act AND 
			"TAB_UF"."FECHA_UF" = :adt_fecha_act AND 
			ROUND((((SELECT	SUM("INGRESO"."MONTO")
						FROM 		"INGRESO"
						WHERE 	"INGRESO"."BASE" = "CADENA"."CODIGO" AND
									"INGRESO"."SERIE" = "CADENA"."SERIE" AND  
									"INGRESO"."CONTRATO" = "CADENA"."NUMERO" AND  
									("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E') AND  
									"INGRESO"."FECHA_PAGO" <= :adt_fecha_act) / "TAB_UF"."VALOR_UF") * 100) / (("PAGO_OFERTA"."NRO_CUOTAS" * "PAGO_OFERTA"."VALOR_CUOTA")+("PAGO_OFERTA"."PIE_PAGADO" / "TAB_UF"."VALOR_UF")),2) >= 15
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_tot_reg_uf) and ll_tot_reg_uf>0 then
		ll_tot_reg_uf			= ll_tot_reg_uf
	else
		ll_tot_reg_uf			= 0
	end if
else
	ll_tot_reg_uf				= 0
end if
ll_tot_reg						= ll_tot_reg_peso+ll_tot_reg_uf
if isnull(ll_tot_reg) then ll_tot_reg=0
return 		ll_tot_reg

end function

on w_agentes_ugn.create
this.cb_1=create cb_1
this.cb_grabar=create cb_grabar
this.cb_limpiar=create cb_limpiar
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cb_grabar,&
this.cb_limpiar,&
this.cb_2,&
this.cb_imprimir,&
this.dw_lista,&
this.gb_1}
end on

on w_agentes_ugn.destroy
destroy(this.cb_1)
destroy(this.cb_grabar)
destroy(this.cb_limpiar)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;string	ls_canal
long	ll_tot_reg

gf_centrar(w_agentes_ugn)
SELECT	"CANAL"  
INTO		:ls_canal
FROM 	"JEFE_VENTAS"  
WHERE 	( "JEFE_VENTAS"."JEFE_VENTAS" = :gs_user ) AND  
         	( "JEFE_VENTAS"."ESTADO" = 'A' )
USING	sqlca;
if isnull(ls_canal) then ls_canal=''

if gs_depto='I' or gs_depto='G' or gl_proceso>=4 or (gl_proceso=3 and gs_depto='B' and ls_canal='UG' )then
	ll_tot_reg				= dw_lista.retrieve()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Agentes Nuevos Canales")
	end if
else
	messagebox("Advertencia","Usuario No Autorizado")
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_1 from commandbutton within w_agentes_ugn
integer x = 32
integer y = 1644
integer width = 471
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar Agente"
end type

event clicked;dw_lista.accepttext()
dw_lista.insertrow(0)
end event

type cb_grabar from commandbutton within w_agentes_ugn
boolean visible = false
integer x = 530
integer y = 1648
integer width = 274
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

type cb_limpiar from commandbutton within w_agentes_ugn
integer x = 1637
integer y = 1644
integer width = 274
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

type cb_2 from commandbutton within w_agentes_ugn
integer x = 3474
integer y = 1644
integer width = 274
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_agentes_ugn)
end event

type cb_imprimir from commandbutton within w_agentes_ugn
integer x = 1915
integer y = 1644
integer width = 274
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

type dw_lista from datawindow within w_agentes_ugn
integer x = 32
integer y = 48
integer width = 3717
integer height = 1568
integer taborder = 40
string title = "none"
string dataobject = "dw_agentes_ugn"
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

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_1 from groupbox within w_agentes_ugn
integer x = 1614
integer y = 1596
integer width = 603
integer height = 164
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

