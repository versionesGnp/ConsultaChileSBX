forward
global type w_rezago_prom_pend_resumen from window
end type
type cb_imprimir from commandbutton within w_rezago_prom_pend_resumen
end type
type cb_2 from commandbutton within w_rezago_prom_pend_resumen
end type
type dw_lista from datawindow within w_rezago_prom_pend_resumen
end type
end forward

global type w_rezago_prom_pend_resumen from window
integer width = 2894
integer height = 2088
boolean titlebar = true
string title = "Resumen Rezagos"
boolean controlmenu = true
long backcolor = 67108864
event ue_calcular ( )
cb_imprimir cb_imprimir
cb_2 cb_2
dw_lista dw_lista
end type
global w_rezago_prom_pend_resumen w_rezago_prom_pend_resumen

type variables
long il_row
end variables

event ue_calcular;string	ls_cod_jefe,ls_nombre,ls_a_paterno,ls_a_materno,ls_nombre_jefe
long		ll_cuenta,ll_new
date		ld_fecha_pago
datetime	ldt_fecha_pago

ld_fecha_pago											= date(Message.StringParm)
ldt_fecha_pago											= datetime(ld_fecha_pago,time('00:00:00'))
dw_lista.dataobject									='dw_rezago_prom_pend_resumen'
dw_lista.settransobject(sqlca)

SetPointer(HourGlass!)
dw_lista.object.usuario.text						= gs_user
dw_lista.object.titulo2_t.text					= 'Pendiente hasta el '+string(ldt_fecha_pago,'dd/mm/yyyy')

DECLARE x1 CURSOR FOR
SELECT COUNT(*) AS PROMESAS,
		"SUPERVISOR"."COD_JEFE"||' - '||"JEFE_VENTAS"."NOMBRE"||' '||"JEFE_VENTAS"."A_PATERNO"||' '||"JEFE_VENTAS"."A_MATERNO" AS SUPERVISOR
FROM	"INGRESO", "CLIENTE_REZAGO", "CD_FOLIO", "CD_ESTADO", "AGENTES", "SUPERVISOR", "JEFE_VENTAS"  
WHERE	( "INGRESO"."RUT" = "CLIENTE_REZAGO"."RUT" ) and  
		( "INGRESO"."FOLIO" = "CLIENTE_REZAGO"."FOLIO" ) and  
		( "CLIENTE_REZAGO"."BASE" = "CD_FOLIO"."BASE" ) and  
		( "CLIENTE_REZAGO"."SERIE" = "CD_FOLIO"."SERIE" ) and  
		( "CLIENTE_REZAGO"."NUMERO" = "CD_FOLIO"."NUMERO" ) and  
		( "CD_FOLIO"."ULT_ESTADO" = "CD_ESTADO"."CODIGO" ) and  
		( "CD_FOLIO"."COD_AGENTE" = "AGENTES"."COD_AGE" ) and  
		( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
		( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
		( ( "INGRESO"."REZAGO" = 'S' ) AND  
		( "INGRESO"."PAGO_HIST" = 'A' ) AND  
		("INGRESO"."TIPO_MOV" = 'A' OR  
		"INGRESO"."TIPO_MOV" = 'E') AND  
		"CLIENTE_REZAGO"."BASE" = 'O' AND  
		"SUPERVISOR"."DEPTO" = 'R' AND  
		"INGRESO"."FECHA_PAGO" <= :ldt_fecha_pago ) 
GROUP BY "SUPERVISOR"."COD_JEFE"||' - '||"JEFE_VENTAS"."NOMBRE"||' '||"JEFE_VENTAS"."A_PATERNO"||' '||"JEFE_VENTAS"."A_MATERNO"
USING	sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
	fetch x1 INTO	:ll_cuenta, :ls_nombre_jefe;
		if not isnull(ls_nombre_jefe) and ls_nombre_jefe <> '' then
			ll_new									= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new)
			dw_lista.setitem(ll_new,"nombre_jefe",ls_nombre_jefe)
			if not isnull(ll_cuenta) and ll_cuenta>0 then
				ll_cuenta							= ll_cuenta
			else
				ll_cuenta							= 0
			end if
			dw_lista.setitem(ll_new,"total",ll_cuenta)
		end if
		setnull(ls_nombre_jefe)
	LOOP
end if
close x1;
if dw_lista.RowCount() = 0 then
	messagebox("Advertencia","No Registra Datos")
end if
SetPointer(Arrow!)
end event

on w_rezago_prom_pend_resumen.create
this.cb_imprimir=create cb_imprimir
this.cb_2=create cb_2
this.dw_lista=create dw_lista
this.Control[]={this.cb_imprimir,&
this.cb_2,&
this.dw_lista}
end on

on w_rezago_prom_pend_resumen.destroy
destroy(this.cb_imprimir)
destroy(this.cb_2)
destroy(this.dw_lista)
end on

event open;string	ls_cod_jefe,ls_nombre,ls_a_paterno,ls_a_materno,ls_nombre_jefe
long		ll_cuenta,ll_new
date		ld_fecha_pago
datetime	ldt_fecha_pago

connect using Trans_1;
gf_centrar(w_rezago_prom_pend_resumen)
ld_fecha_pago											= date(Message.StringParm)
ldt_fecha_pago											= datetime(ld_fecha_pago,time('00:00:00'))
dw_lista.dataobject									='dw_rezago_prom_pend_resumen'
dw_lista.settransobject(sqlca)
PostEvent('ue_calcular')

end event

event close;disconnect using Trans_1;
end event

type cb_imprimir from commandbutton within w_rezago_prom_pend_resumen
integer x = 37
integer y = 1828
integer width = 274
integer height = 96
integer taborder = 130
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

type cb_2 from commandbutton within w_rezago_prom_pend_resumen
integer x = 2560
integer y = 1828
integer width = 274
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_rezago_prom_pend_resumen)
end event

type dw_lista from datawindow within w_rezago_prom_pend_resumen
integer x = 37
integer y = 40
integer width = 2798
integer height = 1764
integer taborder = 40
string title = "none"
string dataobject = "dw_rezago_prom_pend_resumen"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

