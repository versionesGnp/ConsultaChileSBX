forward
global type w_grabar_pago_repactacion from window
end type
type st_cliente from statictext within w_grabar_pago_repactacion
end type
type cb_cerrar from commandbutton within w_grabar_pago_repactacion
end type
type cb_grabar from commandbutton within w_grabar_pago_repactacion
end type
type dw_dato from datawindow within w_grabar_pago_repactacion
end type
end forward

global type w_grabar_pago_repactacion from window
integer width = 2446
integer height = 1536
boolean titlebar = true
string title = "Pago Cuota Repactación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_cliente st_cliente
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_dato dw_dato
end type
global w_grabar_pago_repactacion w_grabar_pago_repactacion

type variables
String	is_base,is_serie,is_opcion, is_string, is_estado
Long		il_nro_ctas,il_corr,il_monto,il_tot_reg, il_row,il_valor_cta,il_ctas_pag
Date		id_fecha_prox_pago,idt_fecha_hoy
Double	il_numero
end variables

on w_grabar_pago_repactacion.create
this.st_cliente=create st_cliente
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_dato=create dw_dato
this.Control[]={this.st_cliente,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_dato}
end on

on w_grabar_pago_repactacion.destroy
destroy(this.st_cliente)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_dato)
end on

event open;long	ll_new,ll_cta_pac  
gf_centrar(w_grabar_pago_repactacion)
dw_dato.settransobject(sqlca)
idt_fecha_hoy			= date(gdt_fec_sistema)
is_string				= Message.StringParm
is_base 					= substr(1,1,Message.StringParm)
is_serie					= substr(1,2,Message.StringParm)
il_numero				= Double(substr(1,3,Message.StringParm))
il_monto					= Long(substr(1,4,Message.StringParm))
st_cliente.text		= trim(substr(1,5,Message.StringParm))
il_nro_ctas				= long(substr(1,6,Message.StringParm))
is_opcion				= substr(1,7,Message.StringParm)
il_valor_cta			= long(substr(1,8,Message.StringParm)) 
il_ctas_pag				= long(substr(1,9,Message.StringParm))
il_corr					= long(substr(1,10,Message.StringParm))
if is_opcion='C' then 
	cb_grabar.enabled	= false
	dw_dato.enabled	= false
	if dw_dato.retrieve('R',is_serie,il_numero,il_corr)=0 then
		messagebox("Advertencia","No Registra Dato")
		close(w_grabar_pago_repactacion)
	else
		dw_dato.accepttext()
		dw_dato.setfocus()
	end if
elseif is_opcion='P' then 
	SELECT "REPACTA_MANTENCION"."CUOTAS_PACTADAS"  
   INTO :ll_cta_pac  
   FROM "REPACTA_MANTENCION"  
   WHERE ( "REPACTA_MANTENCION"."BASE" = 'R' ) AND  
         ( "REPACTA_MANTENCION"."SERIE" = :is_serie ) AND  
         ( "REPACTA_MANTENCION"."NUMERO" = :il_numero ) AND  
         ( "REPACTA_MANTENCION"."CORRELATIVO" = :il_corr )   
   using	sqlca ;
	cb_grabar.enabled	= true
	dw_dato.enabled	= true
	ll_new	= dw_dato.insertrow(0)
	dw_dato.scrolltorow(ll_new)
	dw_dato.setitem(ll_new,'base','R')
	dw_dato.setitem(ll_new,'serie',is_serie)
	dw_dato.setitem(ll_new,'numero',il_numero)
	dw_dato.setitem(ll_new,'correlativo',il_ctas_pag)
	dw_dato.setitem(ll_new,'fecha_pago',idt_fecha_hoy)
	dw_dato.setitem(ll_new,'estado','C')
	dw_dato.setitem(ll_new,'usuario',gs_user)
	dw_dato.setitem(ll_new,'estado','N')
	dw_dato.setitem(ll_new,'monto',il_valor_cta)
	dw_dato.setitem(ll_new,'nro_ctas_a_pagar',1)
	dw_dato.setitem(ll_new,'repacta_mantencion_cuotas_pactadas',ll_cta_pac)
	dw_dato.accepttext()
	dw_dato.setfocus()
end if
gs_ventana			= 'w_grabar_pago_repactacion'
f_valida_objeto()
end event

type st_cliente from statictext within w_grabar_pago_repactacion
integer x = 64
integer y = 28
integer width = 2272
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_grabar_pago_repactacion
integer x = 2075
integer y = 1292
integer width = 283
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_grabar_pago_repactacion)
end event

type cb_grabar from commandbutton within w_grabar_pago_repactacion
integer x = 37
integer y = 1292
integer width = 283
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_cuotas_pag, ll_ctas,ll_ctas_pactadas
String	ls_est
if is_opcion = 'P' and dw_dato.rowcount() > 0 then
	dw_dato.setitem(1,'estado','V')
	SELECT "REPACTA_MANTENCION"."CUOTAS_PACTADAS",   "REPACTA_MANTENCION"."CTAS_PAGADAS"  
	INTO 	:ll_ctas_pactadas,								 :ll_cuotas_pag  
	FROM "REPACTA_MANTENCION"  
	WHERE ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :is_base ) AND  
			( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :is_serie ) AND  
			( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :il_numero )   
	Using	sqlca ;
	if sqlca.sqlcode=0 then
		ll_ctas			= dw_dato.getitemnumber(1,'nro_ctas_a_pagar')
		ll_cuotas_pag	= ll_cuotas_pag + ll_ctas
		dw_dato.setitem(1,'correlativo',ll_cuotas_pag)
		if ll_ctas_pactadas = ll_cuotas_pag then
			ls_est		= 'C'
		else
			ls_est		= 'V'
		end if
		UPDATE "REPACTA_MANTENCION"  
		SET 	"CTAS_PAGADAS" = :ll_cuotas_pag,   
				"ESTADO_PAGO" = :ls_est  
		WHERE ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :is_base ) AND  
				( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :is_serie ) AND  
				( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :il_numero )   
		Using	sqlca ;
		if sqlca.sqlcode=0 then
			commit;
			w_detalle_repactacion_por_contrato.dw_lista.retrieve(is_base,is_serie,il_numero)
		else
			rollback;
		end if
	end if
	if dw_dato.update()=1 then
		commit;
		w_pago_repactacion.dw_pago.retrieve('R',is_serie,il_numero)
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error","Error al Grabar")
	end if
end if
end event

type dw_dato from datawindow within w_grabar_pago_repactacion
integer x = 37
integer y = 152
integer width = 2327
integer height = 1120
integer taborder = 10
string dataobject = "dw_grabar_pago_detalle_repactacion"
boolean border = false
boolean livescroll = true
end type

event clicked;date		ld_fecha
string	ls_columna
ls_columna	= dwo.name
if is_opcion='P' then 
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ld_fecha	= date(this.getitemdatetime(1,'fecha_pago'))
			if f_valida_fecha(string(ld_fecha))=-1 then 
				this.setitem(1,'fecha_pago',string(idt_fecha_hoy,gs_formato_fecha))
				return
			end if
			OpenWithParm(w_calendar,string(ld_fecha))
			IF not isnull(Message.StringParm) THEN
				this.setitem(1,'fecha_pago',date(Message.StringParm))
				this.accepttext()
			END IF
	END CHOOSE
end if
end event

