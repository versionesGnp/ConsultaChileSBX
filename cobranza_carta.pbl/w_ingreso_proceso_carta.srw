forward
global type w_ingreso_proceso_carta from window
end type
type cb_grabar from commandbutton within w_ingreso_proceso_carta
end type
type dw_ingreso from datawindow within w_ingreso_proceso_carta
end type
end forward

global type w_ingreso_proceso_carta from window
integer width = 2528
integer height = 1276
boolean titlebar = true
string title = "Proceso Carta Descripción"
windowtype windowtype = response!
long backcolor = 67108864
cb_grabar cb_grabar
dw_ingreso dw_ingreso
end type
global w_ingreso_proceso_carta w_ingreso_proceso_carta

type variables

end variables

on w_ingreso_proceso_carta.create
this.cb_grabar=create cb_grabar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.cb_grabar,&
this.dw_ingreso}
end on

on w_ingreso_proceso_carta.destroy
destroy(this.cb_grabar)
destroy(this.dw_ingreso)
end on

event open;Long		ll_new,ll_cod_accion,ll_cant_cartas,ll_cod_parque
String	ls_clasif,ls_desc
Date		ld_fecha_hoy,ld_fecha
gf_centrar(w_ingreso_proceso_carta)
ll_cod_accion	= long(substr(1,1,Message.StringParm))
ll_cant_cartas	= long(substr(1,2,Message.StringParm))
ls_clasif		= substr(1,3,Message.StringParm)
ll_cod_parque	= long(substr(1,4,Message.StringParm))
ld_fecha_hoy	= date(gdt_fec_sistema)
dw_ingreso.settransobject(sqlca)
SELECT	"GC_TIPO_CARTA"."DESCRIPCION"  
INTO 		:ls_desc
FROM 		"GC_TIPO_CARTA"  
WHERE  ( "GC_TIPO_CARTA"."CLASIFICACION" = :ls_clasif ) AND  
		 ( "GC_TIPO_CARTA"."PARQUE" = :ll_cod_parque ) AND  
		 ( "GC_TIPO_CARTA"."ACCION" = :ll_cod_accion )   
USING		sqlca;
if sqlca.sqlcode=0 then
	SELECT	"PROCESO_CARTA"."FECHA"  
	INTO 		:ld_fecha  
	FROM 		"PROCESO_CARTA"  
	WHERE  ( "PROCESO_CARTA"."FECHA" = :ld_fecha_hoy ) AND  
			 ( "PROCESO_CARTA"."COD_ACCION" = :ll_cod_accion ) AND  
			 ( "PROCESO_CARTA"."CLASIFICACION" = :ls_clasif )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_ingreso.retrieve(ld_fecha_hoy,ll_cod_accion,ls_clasif)
	else
		ll_new	= dw_ingreso.insertrow(0)
		ls_desc	= string(ll_cant_cartas)+' Cartas de '+ls_desc
		dw_ingreso.setitem(ll_new,'fecha',ld_fecha_hoy)
		dw_ingreso.setitem(ll_new,'cod_accion',ll_cod_accion)
		dw_ingreso.setitem(ll_new,'clasificacion',ls_clasif)
		dw_ingreso.setitem(ll_new,'descripcion',ls_desc)
		dw_ingreso.accepttext()
	end if
	dw_ingreso.setfocus()
end if
end event

type cb_grabar from commandbutton within w_ingreso_proceso_carta
integer x = 41
integer y = 1024
integer width = 2432
integer height = 124
integer taborder = 30
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "G r a b a r"
end type

event clicked;dw_ingreso.accepttext()
if dw_ingreso.update()=1 then
	commit;
	close(w_ingreso_proceso_carta)
else
	rollback;
	messagebox("Error Grabar","No es posible Grabar Proceso Carta, Error SQL : "+sqlca.sqlerrtext)
	close(w_ingreso_proceso_carta)
end if
end event

type dw_ingreso from datawindow within w_ingreso_proceso_carta
integer x = 41
integer y = 36
integer width = 2455
integer height = 952
integer taborder = 10
string title = "none"
string dataobject = "dw_ingresar_proceso_carta"
boolean border = false
boolean livescroll = true
end type

