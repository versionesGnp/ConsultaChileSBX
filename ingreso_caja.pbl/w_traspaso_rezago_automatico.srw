forward
global type w_traspaso_rezago_automatico from window
end type
type cb_1 from commandbutton within w_traspaso_rezago_automatico
end type
type cb_cerrar from commandbutton within w_traspaso_rezago_automatico
end type
type dw_lista from datawindow within w_traspaso_rezago_automatico
end type
end forward

global type w_traspaso_rezago_automatico from window
integer width = 4009
integer height = 2024
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
event ue_cargar pbm_custom01
cb_1 cb_1
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_traspaso_rezago_automatico w_traspaso_rezago_automatico

type variables
Long	il_row
end variables

event ue_cargar;Long		ll_tot_reg, ll_indi,ll_monto_cancel,ll_monto_pie
String	ls_base,ls_serie,ls_tipo_mov
Double	ldb_valor_cuota,ldb_monto,ll_numero

ll_tot_reg					= dw_lista.retrieve()
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ls_base				= dw_lista.getitemstring(ll_indi,'cliente_rezago_base')
		ls_serie				= dw_lista.getitemstring(ll_indi,'cliente_rezago_serie')
		ll_numero			= dw_lista.getitemnumber(ll_indi,'cliente_rezago_numero')
		ls_tipo_mov			= dw_lista.getitemstring(ll_indi,'ingreso_tipo_mov')
		ll_monto_cancel	= dw_lista.getitemnumber(ll_indi,'ingreso_monto')
		ll_monto_pie		= dw_lista.getitemnumber(ll_indi,'c_valor_cta_pie_peso')
		if ls_tipo_mov = 'A' and ll_monto_cancel <> ll_monto_pie then
			SELECT	"DETALLE_PAGO_PIE"."MONTO_CUOTA"  
			INTO 		:ldb_monto  
			FROM 		"DETALLE_PAGO_PIE"  
			WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
					 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
					 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero ) AND  
					 ( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) AND  
					 ( "DETALLE_PAGO_PIE"."NUMERO_CUOTA" = (	SELECT 	MIN("DETALLE_PAGO_PIE"."NUMERO_CUOTA") 
																			FROM		"DETALLE_PAGO_PIE" 
																			WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND 
																					 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND 
																					 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero ) AND 
																					 ( "DETALLE_PAGO_PIE"."ESTADO" = 'P' ) ) )   
			USING		sqlca;
			
			//FALTA VALIDAR

		end if
	next
end if
end event

on w_traspaso_rezago_automatico.create
this.cb_1=create cb_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_1,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_traspaso_rezago_automatico.destroy
destroy(this.cb_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_traspaso_rezago_automatico)
dw_lista.settransobject(sqlca)

if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No Registra Rezago")
	close(w_traspaso_rezago_automatico)
end if
end event

type cb_1 from commandbutton within w_traspaso_rezago_automatico
integer x = 27
integer y = 1744
integer width = 288
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

type cb_cerrar from commandbutton within w_traspaso_rezago_automatico
integer x = 3611
integer y = 1744
integer width = 325
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_traspaso_rezago_automatico)
end event

type dw_lista from datawindow within w_traspaso_rezago_automatico
integer x = 41
integer y = 48
integer width = 3895
integer height = 1648
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_rezago_traspaso_automatico"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

