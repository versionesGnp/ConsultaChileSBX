forward
global type w_ingreso_atencion_log from window
end type
type st_1 from statictext within w_ingreso_atencion_log
end type
type cb_cerrar from commandbutton within w_ingreso_atencion_log
end type
type cb_grabar from commandbutton within w_ingreso_atencion_log
end type
type dw_datos from datawindow within w_ingreso_atencion_log
end type
end forward

global type w_ingreso_atencion_log from window
integer width = 2715
integer height = 968
boolean titlebar = true
string title = "Observación Título Dominio"
long backcolor = 67108864
st_1 st_1
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_datos dw_datos
end type
global w_ingreso_atencion_log w_ingreso_atencion_log

type variables
long	il_rut_cliente
Date	idt_fecha_hoy
end variables

on w_ingreso_atencion_log.create
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_datos=create dw_datos
this.Control[]={this.st_1,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_datos}
end on

on w_ingreso_atencion_log.destroy
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_datos)
end on

event open;long		ll_new
String	ls_nombre,ls_pat,ls_mat

idt_fecha_hoy		= date(gdt_fec_sistema)
gf_centrar(w_ingreso_atencion_log)
il_rut_cliente		= long(substr(1,1,Message.StringParm))
dw_datos.settransobject(sqlca)
//if dw_datos.retrieve(gs_base,gs_serie,gi_numero)=0 then
	ll_new			= dw_datos.insertrow(0)
	dw_datos.scrolltorow(ll_new)
	dw_datos.setitem(ll_new,'rut',il_rut_cliente)
	dw_datos.setitem(ll_new,'base',gs_base)
	dw_datos.setitem(ll_new,'serie',gs_serie)
	dw_datos.setitem(ll_new,'numero',gi_numero)
	dw_datos.setitem(ll_new,'fecha',idt_fecha_hoy)
	dw_datos.setitem(ll_new,'usuario',gs_user)
	dw_datos.setitem(ll_new,'estado','6')
	SELECT	"CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO"  
	INTO 		:ls_nombre,   			 :ls_pat,   					:ls_mat  
	FROM 		"CLIENTE"  
	WHERE 	"CLIENTE"."RUT" = :il_rut_cliente   
	Using		sqlca ;
	if sqlca.sqlcode=0 then
		dw_datos.object.t_nombre.text	= trim(ls_pat)+' '+trim(ls_mat)+' '+trim(ls_nombre)
	end if
//end if
dw_datos.setfocus()
gs_ventana	= 'w_ingreso_atencion_log'
f_valida_objeto()
end event

type st_1 from statictext within w_ingreso_atencion_log
integer x = 50
integer y = 32
integer width = 626
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "Titulo Dominio"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_ingreso_atencion_log
integer x = 2263
integer y = 728
integer width = 361
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;long	ll_rut_aux
SELECT	"ATENCION_LOG"."RUT"  
INTO 		:ll_rut_aux  
FROM 		"ATENCION_LOG"  
WHERE  ( "ATENCION_LOG"."BASE" = :gs_base ) AND  
		 ( "ATENCION_LOG"."SERIE" = :gs_serie ) AND  
		 ( "ATENCION_LOG"."NUMERO" = :gi_numero )   
Using		sqlca;
if sqlca.sqlcode=100 then
	messagebox("Advertencia","Debe Grabar Datos antes de salir")
else
	close(w_ingreso_atencion_log)
end if
end event

type cb_grabar from commandbutton within w_ingreso_atencion_log
integer x = 59
integer y = 728
integer width = 361
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if dw_datos.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
	close(w_ingreso_atencion_log)
else
	rollback;
	messagebox("Error al Grabar","Error: "+sqlca.sqlerrtext)
end if
end event

type dw_datos from datawindow within w_ingreso_atencion_log
integer x = 37
integer y = 144
integer width = 2610
integer height = 552
integer taborder = 10
string dataobject = "dw_ingreso_datos_atencion_log"
boolean border = false
boolean livescroll = true
end type

