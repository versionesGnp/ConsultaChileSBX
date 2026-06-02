forward
global type w_sap from window
end type
type cb_1 from commandbutton within w_sap
end type
type st_1 from statictext within w_sap
end type
type dw_lista2 from datawindow within w_sap
end type
type cb_2 from commandbutton within w_sap
end type
type dw_lista from datawindow within w_sap
end type
end forward

global type w_sap from window
integer width = 3360
integer height = 2144
boolean titlebar = true
string title = "Creación Cliente SAP"
boolean controlmenu = true
long backcolor = 67108864
cb_1 cb_1
st_1 st_1
dw_lista2 dw_lista2
cb_2 cb_2
dw_lista dw_lista
end type
global w_sap w_sap

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

on w_sap.create
this.cb_1=create cb_1
this.st_1=create st_1
this.dw_lista2=create dw_lista2
this.cb_2=create cb_2
this.dw_lista=create dw_lista
this.Control[]={this.cb_1,&
this.st_1,&
this.dw_lista2,&
this.cb_2,&
this.dw_lista}
end on

on w_sap.destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.dw_lista2)
destroy(this.cb_2)
destroy(this.dw_lista)
end on

event open;string	ls_canal
long	ll_tot_reg,ll_tot_reg2

gf_centrar(w_sap)

dw_lista.dataobject	= 'dw_cliente_sap'
dw_lista.settransobject(sqlca)

dw_lista2.dataobject	= 'dw_cliente_sap_2'
dw_lista2.settransobject(sqlca)

ll_tot_reg		= dw_lista.retrieve()
ll_tot_reg2		= dw_lista2.retrieve()

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_1 from commandbutton within w_sap
integer x = 69
integer y = 1840
integer width = 274
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cargar"
end type

event clicked;long	ll_tot_reg2,ll_tot_reg

ll_tot_reg2		= dw_lista2.retrieve() 
ll_tot_reg		= dw_lista.retrieve() 
end event

type st_1 from statictext within w_sap
integer x = 37
integer y = 36
integer width = 937
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
string text = "Creación Cliente SAP"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_lista2 from datawindow within w_sap
integer x = 69
integer y = 1036
integer width = 3214
integer height = 768
integer taborder = 50
string title = "none"
string dataobject = "dw_cliente_sap_2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_sap
integer x = 3008
integer y = 1840
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

event clicked;close(w_sap)
end event

type dw_lista from datawindow within w_sap
integer x = 69
integer y = 192
integer width = 3214
integer height = 768
integer taborder = 40
string title = "none"
string dataobject = "dw_cliente_sap"
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

event doubleclicked;string	ls_columna,ls_prueba
long ret,ll_rut,ll_tot_reg,ll_tot_reg2
Inet  iinet_base
ret = GetContextService("Internet", iinet_base)


dw_lista.accepttext()
ls_columna	= dwo.name
if ls_columna = 'rut' then
	ll_rut			= dw_lista.getitemnumber(il_row,'rut')
end if


if ret = -1 then
	messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
	return
end if
ret 				= iinet_base.HyperlinkToURL("http://50.50.50.192/cargarclientesap.php?rut="+string(ll_rut))
ls_prueba		= string(ret)

if ret = -1 then
	messagebox('No Existe','No existe el plano del sector buscado.',stopsign!)
	return
end if





end event

