forward
global type w_administrar_usuario from window
end type
type cb_crear from commandbutton within w_administrar_usuario
end type
type cb_nuevo from commandbutton within w_administrar_usuario
end type
type cb_imprimir from commandbutton within w_administrar_usuario
end type
type cb_eliminar from commandbutton within w_administrar_usuario
end type
type cb_grabar from commandbutton within w_administrar_usuario
end type
type cb_cerrar from commandbutton within w_administrar_usuario
end type
type dw_usuario from datawindow within w_administrar_usuario
end type
end forward

global type w_administrar_usuario from window
integer width = 3529
integer height = 1488
boolean titlebar = true
string title = "Administrar Usuario"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_crear cb_crear
cb_nuevo cb_nuevo
cb_imprimir cb_imprimir
cb_eliminar cb_eliminar
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_usuario dw_usuario
end type
global w_administrar_usuario w_administrar_usuario

type variables
Date	idt_fecha_hoy
end variables

on w_administrar_usuario.create
this.cb_crear=create cb_crear
this.cb_nuevo=create cb_nuevo
this.cb_imprimir=create cb_imprimir
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_usuario=create dw_usuario
this.Control[]={this.cb_crear,&
this.cb_nuevo,&
this.cb_imprimir,&
this.cb_eliminar,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_usuario}
end on

on w_administrar_usuario.destroy
destroy(this.cb_crear)
destroy(this.cb_nuevo)
destroy(this.cb_imprimir)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_usuario)
end on

event open;Long	ll_tot_reg, ll_indi
gf_centrar(w_administrar_usuario)
idt_fecha_hoy	= date(gdt_fec_sistema)
dw_usuario.settransobject(sqlca)
ll_tot_reg	= dw_usuario.retrieve()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		dw_usuario.setitem(ll_indi,'check',1)
	next
	dw_usuario.accepttext()
end if
SELECT	"ENCARGADOS"."SOLICITUDES"  
INTO 		:gs_opera  
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
USING		sqlca;
if gs_opera='3' then
	cb_nuevo.visible	= true
else
	cb_nuevo.visible	= false
end if

end event

type cb_crear from commandbutton within w_administrar_usuario
integer x = 37
integer y = 1248
integer width = 329
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

type cb_nuevo from commandbutton within w_administrar_usuario
boolean visible = false
integer x = 2135
integer y = 1248
integer width = 448
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cre&ar Usuario"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_new
String	ls_usuario,ls_usuario_aux
Date		ld_fin_year
ld_fin_year	= date(string('31/12/'+string(year(idt_fecha_hoy))))
ll_tot_reg	= dw_usuario.rowcount()
if ll_tot_reg>0 then
	open(w_crear_usuario)
	for ll_indi=1 to ll_tot_reg
		if dw_usuario.getitemnumber(ll_indi,'check')=0 then
			ls_usuario	= dw_usuario.getitemstring(ll_indi,'usuario')
			SELECT	"ENCARGADOS"."CODIGO_USUARIO"  
			INTO 		:ls_usuario_aux  
			FROM 		"ENCARGADOS"  
			WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				messagebox("Advertencia","Nombre Usuario "+ls_usuario+" YA Existe")
			elseif sqlca.sqlcode=100 then
				ll_new	= w_crear_usuario.dw_ingreso.insertrow(0)
				w_crear_usuario.dw_ingreso.scrolltorow(ll_new)
				w_crear_usuario.dw_ingreso.setitem(ll_new,'codigo_usuario',dw_usuario.getitemstring(ll_indi,'codigo_usuario'))
				w_crear_usuario.dw_ingreso.setitem(ll_new,'nombre',dw_usuario.getitemstring(ll_indi,'nombre'))
				w_crear_usuario.dw_ingreso.setitem(ll_new,'acceso',dw_usuario.getitemstring(ll_indi,'acceso'))
				w_crear_usuario.dw_ingreso.setitem(ll_new,'depto',dw_usuario.getitemstring(ll_indi,'depto'))
				w_crear_usuario.dw_ingreso.setitem(ll_new,'company',dw_usuario.getitemstring(ll_indi,'company'))
				w_crear_usuario.dw_ingreso.setitem(ll_new,'fecha_termino',ld_fin_year)
			end if
		end if
	next
	if w_crear_usuario.dw_ingreso.rowcount()>0 then
		w_crear_usuario.dw_ingreso.scrolltorow(1)
		w_crear_usuario.dw_ingreso.setfocus()
	end if
	dw_usuario.accepttext()
end if
end event

type cb_imprimir from commandbutton within w_administrar_usuario
integer x = 704
integer y = 1248
integer width = 329
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

type cb_eliminar from commandbutton within w_administrar_usuario
integer x = 370
integer y = 1248
integer width = 329
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

type cb_grabar from commandbutton within w_administrar_usuario
integer x = 1801
integer y = 1248
integer width = 329
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

type cb_cerrar from commandbutton within w_administrar_usuario
integer x = 3145
integer y = 1248
integer width = 329
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_administrar_usuario)
end event

type dw_usuario from datawindow within w_administrar_usuario
integer x = 37
integer y = 32
integer width = 3438
integer height = 1184
integer taborder = 10
string dataobject = "dw_solicitud_crear_usuario"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

