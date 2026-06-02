forward
global type w_informe_electronico_por_caja from window
end type
type cb_print from commandbutton within w_informe_electronico_por_caja
end type
type cbx_todas_cajas from checkbox within w_informe_electronico_por_caja
end type
type dw_empresa from datawindow within w_informe_electronico_por_caja
end type
type cb_todo from commandbutton within w_informe_electronico_por_caja
end type
type pb_ok from picturebutton within w_informe_electronico_por_caja
end type
type cb_cerrar from commandbutton within w_informe_electronico_por_caja
end type
type dw_caja from datawindow within w_informe_electronico_por_caja
end type
type dw_lista from datawindow within w_informe_electronico_por_caja
end type
end forward

global type w_informe_electronico_por_caja from window
integer width = 3241
integer height = 1568
boolean titlebar = true
string title = "Informe Boletas & Facturas Electrónicas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_print cb_print
cbx_todas_cajas cbx_todas_cajas
dw_empresa dw_empresa
cb_todo cb_todo
pb_ok pb_ok
cb_cerrar cb_cerrar
dw_caja dw_caja
dw_lista dw_lista
end type
global w_informe_electronico_por_caja w_informe_electronico_por_caja

type variables
String		is_caja
end variables

on w_informe_electronico_por_caja.create
this.cb_print=create cb_print
this.cbx_todas_cajas=create cbx_todas_cajas
this.dw_empresa=create dw_empresa
this.cb_todo=create cb_todo
this.pb_ok=create pb_ok
this.cb_cerrar=create cb_cerrar
this.dw_caja=create dw_caja
this.dw_lista=create dw_lista
this.Control[]={this.cb_print,&
this.cbx_todas_cajas,&
this.dw_empresa,&
this.cb_todo,&
this.pb_ok,&
this.cb_cerrar,&
this.dw_caja,&
this.dw_lista}
end on

on w_informe_electronico_por_caja.destroy
destroy(this.cb_print)
destroy(this.cbx_todas_cajas)
destroy(this.dw_empresa)
destroy(this.cb_todo)
destroy(this.pb_ok)
destroy(this.cb_cerrar)
destroy(this.dw_caja)
destroy(this.dw_lista)
end on

event open;Long		ll_parque,ll_new
String		ls_rut_empresa

gf_centrar(w_informe_electronico_por_caja)
is_caja							= Message.StringParm
dw_caja.settransobject(sqlca)
dw_lista.settransobject(sqlca)
dw_empresa.settransobject(sqlca)
ll_new							= dw_empresa.insertrow(0)

dw_caja.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque						= 1
else
	ll_parque						= 11
end if
//SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"  
//INTO 		:ls_rut_empresa  
//FROM 	"MEMBRETE_EMPRESA"  
//WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_parque   ;
//dw_empresa.setitem(ll_new,'rut_empresa',ls_rut_empresa)
//dw_empresa.accepttext()
//
//if dw_lista.retrieve(is_caja,ls_rut_empresa)=0 then
//	messagebox("Advertencia","No registra Dato")
//	close(w_informe_electronico_por_caja)
//else
//	if is_caja='%' then
//		cb_todo.visible			= true
//	else
//		dw_caja.setitem(1,'cod_caja',is_caja)
//		dw_caja.accepttext()
//		dw_caja.enabled		= false
//		pb_ok.enabled			= false
//		cb_todo.visible			= false
//	end if
//end if
end event

type cb_print from commandbutton within w_informe_electronico_por_caja
integer x = 1417
integer y = 1324
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then dw_lista.print()

end event

type cbx_todas_cajas from checkbox within w_informe_electronico_por_caja
integer x = 2537
integer y = 52
integer width = 645
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar Todas las Cajas"
end type

event clicked;Long		ll_new,ll_parque
String		ls_rut_empresa

dw_lista.reset()
if cbx_todas_cajas.checked=true  then
//	dw_caja.reset()
//	dw_empresa.reset()
//	dw_caja.insertrow(0)
//	ll_new							= dw_empresa.insertrow(0)
//	
//	if gs_conexion	= "Parque El Prado" then
//		ll_parque						= 1
//	else
//		ll_parque						= 11
//	end if
//	SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"  
//	INTO 		:ls_rut_empresa  
//	FROM 	"MEMBRETE_EMPRESA"  
//	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_parque   ;
//	dw_empresa.setitem(ll_new,'rut_empresa',ls_rut_empresa)
//	dw_empresa.accepttext()
//	
//	if dw_lista.retrieve(is_caja,ls_rut_empresa)=0 then
//		messagebox("Advertencia","No registra Dato")
//	else
//		if is_caja='%' then
//			cb_todo.visible			= true
//		else
//			dw_caja.setitem(1,'cod_caja',is_caja)
//			dw_caja.accepttext()
//			dw_caja.enabled		= false
//			pb_ok.enabled			= false
//			cb_todo.visible			= false
//		end if
//	end if
end if
end event

type dw_empresa from datawindow within w_informe_electronico_por_caja
integer x = 585
integer y = 44
integer width = 914
integer height = 100
integer taborder = 20
string title = "none"
string dataobject = "dwe_ingreo_empresa_electronico"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
dw_lista.reset()
end event

type cb_todo from commandbutton within w_informe_electronico_por_caja
integer x = 59
integer y = 1324
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mostrar Todo"
end type

event clicked;String		ls_rut_empresa

ls_rut_empresa		= dw_empresa.getitemstring(1,'rut_empresa')
if dw_lista.retrieve(is_caja,ls_rut_empresa)=0 then
	messagebox("Advertencia","No registra Dato")
end if
end event

type pb_ok from picturebutton within w_informe_electronico_por_caja
integer x = 1568
integer y = 24
integer width = 155
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
alignment htextalign = left!
end type

event clicked;String		ls_caja,ls_rut_empresa

dw_caja.accepttext()
dw_empresa.accepttext()
if cbx_todas_cajas.checked=true then
	ls_rut_empresa		= dw_empresa.getitemstring(1,'rut_empresa')
	if dw_lista.retrieve(is_caja,ls_rut_empresa)=0 then
		messagebox("Advertencia","No registra Dato")
	end if
else
	ls_caja				= dw_caja.getitemstring(1,'cod_caja')
	ls_rut_empresa		= dw_empresa.getitemstring(1,'rut_empresa')
	if not isnull(ls_caja) and not isnull(ls_rut_empresa) then
		if dw_lista.retrieve(ls_caja,ls_rut_empresa)=0 then
			messagebox("Advertencia","No registra Dato")
		end if
	else
		if isnull(ls_caja) then
			messagebox("Advertencia","Debe Seleccionar Caja")
			dw_caja.setfocus()
		elseif isnull(ls_rut_empresa) then
			messagebox("Advertencia","Debe Seleccionar Empresa")
			dw_empresa.setfocus()
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_informe_electronico_por_caja
integer x = 2821
integer y = 1324
integer width = 357
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_electronico_por_caja)
end event

type dw_caja from datawindow within w_informe_electronico_por_caja
integer x = 69
integer y = 44
integer width = 507
integer height = 88
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_caja_ip"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
cbx_todas_cajas.checked	= false
dw_lista.reset()
end event

type dw_lista from datawindow within w_informe_electronico_por_caja
integer x = 59
integer y = 184
integer width = 3118
integer height = 1116
integer taborder = 40
string title = "none"
string dataobject = "dw_agrupado_boletas_electronicas2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;String		ls_columna

if row > 0 then
	ls_columna		= dwo.name
//	messagebox("ls_columna",ls_columna)
end if
end event

