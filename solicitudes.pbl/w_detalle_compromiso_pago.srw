forward
global type w_detalle_compromiso_pago from window
end type
type cb_6 from commandbutton within w_detalle_compromiso_pago
end type
type cb_11 from commandbutton within w_detalle_compromiso_pago
end type
type cb_5 from commandbutton within w_detalle_compromiso_pago
end type
type cb_22 from commandbutton within w_detalle_compromiso_pago
end type
type cb_cerrar from commandbutton within w_detalle_compromiso_pago
end type
type cb_nuevo from commandbutton within w_detalle_compromiso_pago
end type
type cb_grabar from commandbutton within w_detalle_compromiso_pago
end type
type dw_lista from datawindow within w_detalle_compromiso_pago
end type
type gb_1 from groupbox within w_detalle_compromiso_pago
end type
end forward

global type w_detalle_compromiso_pago from window
integer width = 3525
integer height = 2132
boolean titlebar = true
string title = "Detalle Solicitud Compromiso Pago de Mantención"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_6 cb_6
cb_11 cb_11
cb_5 cb_5
cb_22 cb_22
cb_cerrar cb_cerrar
cb_nuevo cb_nuevo
cb_grabar cb_grabar
dw_lista dw_lista
gb_1 gb_1
end type
global w_detalle_compromiso_pago w_detalle_compromiso_pago

type variables
String		is_base,is_serie,is_dv,is_opcion,is_estado,is_nombre
Double	il_numero,il_rut,il_monto_pie,idb_uf_dia,idb_valor_cuota,idb_interes,idb_gasto
Long		il_correlativo,il_cuotas_pie,il_mora_original,il_ctas_pag_m,il_plazo
Datetime	idt_fecha_prim,idt_fecha_sol

end variables

event open;Long		ll_tot_reg,ll_indi,ll_cuotas_pag_m,ll_estatus_opera,ll_estatus_infor,ll_ctas_pag_m
String		ls_estatus_reg

gf_centrar(w_detalle_compromiso_pago)
dw_lista.settransobject(sqlca)
//idt_fecha_hoy	= date(gdt_fec_sistema)
is_base 						= trim(substr(1,1,Message.StringParm))
is_serie						= trim(substr(1,2,Message.StringParm))
il_numero					= Double(trim(substr(1,3,Message.StringParm)))
il_rut							= long(trim(substr(1,4,Message.StringParm)))
il_correlativo				= long(trim(substr(1,5,Message.StringParm)))
is_dv							= trim(substr(1,6,Message.StringParm))
is_opcion						= trim(substr(1,7,Message.StringParm))
is_estado					= trim(substr(1,8,Message.StringParm))
is_nombre					= trim(substr(1,9,Message.StringParm))

idt_fecha_prim				= datetime(trim(substr(1,10,Message.StringParm)))
il_cuotas_pie				= long(trim(substr(1,11,Message.StringParm)))
il_monto_pie				= double(trim(substr(1,12,Message.StringParm)))
idb_uf_dia					= double(trim(substr(1,13,Message.StringParm)))
idb_valor_cuota			= double(trim(substr(1,14,Message.StringParm)))
il_mora_original			= long(trim(substr(1,15,Message.StringParm)))
idb_interes					= double(trim(substr(1,16,Message.StringParm)))
idb_gasto					= double(trim(substr(1,17,Message.StringParm)))
il_ctas_pag_m				= double(trim(substr(1,18,Message.StringParm)))
il_plazo						= double(trim(substr(1,19,Message.StringParm)))
idt_fecha_sol				= datetime(trim(substr(1,20,Message.StringParm)))
il_ctas_pag_m				= f_retorna_ctas_pag_m(is_base,is_serie, il_numero)
ll_tot_reg					= dw_lista.retrieve(is_base,is_serie, il_numero, il_correlativo,idt_fecha_sol)
if ll_tot_reg = 0 then 
	cb_nuevo.visible		= false
	cb_nuevo.triggerevent(clicked!)
else
	cb_nuevo.visible		= false
	//if (   sol_compromiso_pago_estatus_operacion  =0 and       sol_compromiso_pago_estatus_informatica  =0 or (  sol_estatus_estado_reg  ='I'),1,0)
	SELECT 	"SOL_ESTATUS"."ESTADO_REG",	"SOL_COMPROMISO_PAGO"."ESTATUS_OPERACION",	"SOL_COMPROMISO_PAGO"."ESTATUS_INFORMATICA"  
	INTO		:ls_estatus_reg,						:ll_estatus_opera,													:ll_estatus_infor
	FROM 	"SOL_COMPROMISO_PAGO", 	"SOL_ESTATUS"  
	WHERE 	( "SOL_COMPROMISO_PAGO"."BASE" = "SOL_ESTATUS"."BASE" ) and  
				( "SOL_COMPROMISO_PAGO"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
				( "SOL_COMPROMISO_PAGO"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
				( "SOL_COMPROMISO_PAGO"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
				( ( "SOL_COMPROMISO_PAGO"."BASE" = :is_base ) AND  
				( "SOL_COMPROMISO_PAGO"."SERIE" = :is_serie ) AND  
				( "SOL_COMPROMISO_PAGO"."NUMERO" = :il_numero ) AND  
				( "SOL_COMPROMISO_PAGO"."CORRELATIVO" = :il_correlativo ) )   ;
	if ll_estatus_opera=0 and ll_estatus_infor=0 then
		cb_grabar.visible	= false
	elseif ls_estatus_reg = 'I' then
		cb_grabar.visible	= false
	else
		cb_grabar.visible	= true
	end if
//	for ll_indi=1 to ll_tot_reg
//		ll_cuotas_pag_m	= dw_lista.getitemnumber(ll_indi,'cuota_pag_m')
//		if ll_cuotas_pag_m <= il_ctas_pag_m then
//			dw_lista.setitem(ll_indi,'estado_pago','G')
//		end if
//	next
	if dw_lista.update() = 1 then
		commit;
	else
		rollback;
	end if
end if
dw_lista.accepttext()
w_detalle_compromiso_pago.setfocus()

end event

on w_detalle_compromiso_pago.create
this.cb_6=create cb_6
this.cb_11=create cb_11
this.cb_5=create cb_5
this.cb_22=create cb_22
this.cb_cerrar=create cb_cerrar
this.cb_nuevo=create cb_nuevo
this.cb_grabar=create cb_grabar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_6,&
this.cb_11,&
this.cb_5,&
this.cb_22,&
this.cb_cerrar,&
this.cb_nuevo,&
this.cb_grabar,&
this.dw_lista,&
this.gb_1}
end on

on w_detalle_compromiso_pago.destroy
destroy(this.cb_6)
destroy(this.cb_11)
destroy(this.cb_5)
destroy(this.cb_22)
destroy(this.cb_cerrar)
destroy(this.cb_nuevo)
destroy(this.cb_grabar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

type cb_6 from commandbutton within w_detalle_compromiso_pago
integer x = 1349
integer y = 1896
integer width = 251
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then dw_lista.print()
end event

type cb_11 from commandbutton within w_detalle_compromiso_pago
integer x = 1605
integer y = 1896
integer width = 251
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_5 from commandbutton within w_detalle_compromiso_pago
integer x = 1861
integer y = 1896
integer width = 251
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_22 from commandbutton within w_detalle_compromiso_pago
integer x = 2117
integer y = 1896
integer width = 251
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;SaveAsType TipoArchivo

datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_cerrar from commandbutton within w_detalle_compromiso_pago
integer x = 3122
integer y = 1892
integer width = 329
integer height = 108
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;Long	ll_count_reg

SELECT 	Count("SOL_COMPROMISO_PAGO_DET"."BASE")
INTO 		:ll_count_reg  
FROM 	"SOL_COMPROMISO_PAGO_DET"  
WHERE ( "SOL_COMPROMISO_PAGO_DET"."BASE" = :is_base ) AND  
		  ( "SOL_COMPROMISO_PAGO_DET"."SERIE" = :is_serie ) AND  
		  ( "SOL_COMPROMISO_PAGO_DET"."NUMERO" = :il_numero ) AND  
		  ( "SOL_COMPROMISO_PAGO_DET"."CORRELATIVO" = :il_correlativo )   ;
if ll_count_reg > 0 and dw_lista.rowcount() > 0  then
	close(w_detalle_compromiso_pago)
else
	messagebox("Advertencia","Para Salir debe Grabar Detalle Compromiso de Pago")
end if
end event

type cb_nuevo from commandbutton within w_detalle_compromiso_pago
boolean visible = false
integer x = 471
integer y = 1892
integer width = 329
integer height = 108
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;Long		ll_cuota,ll_indi,ll_new
String		ls_fecha
Datetime	ldt_fecha,ldt_fecha_venc

dw_lista.reset()
il_ctas_pag_m ++
ll_cuota				= 1
ldt_fecha_venc		= idt_fecha_prim
for ll_indi=1 to il_plazo
	ll_new			= dw_lista.insertrow(0)
	dw_lista.setitem(ll_new,'nro_cuota',ll_cuota)
	dw_lista.setitem(ll_new,'plazo', il_plazo)
	dw_lista.setitem(ll_new,'fecha_venc',ldt_fecha_venc)
	dw_lista.setitem(ll_new,'monto_cuota',idb_valor_cuota)
	dw_lista.setitem(ll_new,'valor_uf',idb_uf_dia)
	dw_lista.setitem(ll_new,'estado_pago','P')
	dw_lista.setitem(ll_new,'base',is_base)
	dw_lista.setitem(ll_new,'serie',is_serie)
	dw_lista.setitem(ll_new,'numero',il_numero)
	dw_lista.setitem(ll_new,'correlativo',il_correlativo)
	dw_lista.setitem(ll_new,'cuota_pag_m',il_ctas_pag_m)
	ll_cuota ++
	ls_fecha			= f_fecha_vcto_prim(ll_cuota ,  idt_fecha_prim  )
	ldt_fecha_venc	= datetime(date(ls_fecha),time('00:00:00'))
	il_ctas_pag_m ++
next
dw_lista.accepttext()
end event

type cb_grabar from commandbutton within w_detalle_compromiso_pago
integer x = 50
integer y = 1892
integer width = 329
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;if dw_lista.update() = 1 then
	commit;
	messagebox("Advertencia","Grabación Exitosa")
	if isvalid(w_mantencion_fromulario_solicitudes) then
		w_mantencion_fromulario_solicitudes.dw_reporte.object.b_detalle.font.italic		= true
	end if
//	cb_cerrar.triggerevent(clicked!)
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if
end event

type dw_lista from datawindow within w_detalle_compromiso_pago
integer x = 46
integer y = 56
integer width = 3406
integer height = 1796
integer taborder = 10
string title = "none"
string dataobject = "dw_sol_compromiso_pago_det"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieverow;dw_lista.setitem(row,'ctas_pag_m',il_ctas_pag_m)
end event

type gb_1 from groupbox within w_detalle_compromiso_pago
integer x = 1326
integer y = 1848
integer width = 1065
integer height = 168
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

