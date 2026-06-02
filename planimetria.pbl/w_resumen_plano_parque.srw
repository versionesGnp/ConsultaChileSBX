forward
global type w_resumen_plano_parque from window
end type
type dw_1 from datawindow within w_resumen_plano_parque
end type
type cb_2 from commandbutton within w_resumen_plano_parque
end type
type cb_1 from commandbutton within w_resumen_plano_parque
end type
end forward

global type w_resumen_plano_parque from window
integer width = 2245
integer height = 1572
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_resumen_plano_parque w_resumen_plano_parque

on w_resumen_plano_parque.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_resumen_plano_parque.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;long asignadas,no_asignadas,total


gf_centrar(w_resumen_plano_parque)
dw_1.insertrow(0)
dw_1.setitem(dw_1.rowcount(),'item','No Asignadas')
SELECT count("INVENTARIO_PLANI"."CORRELATIVO") into :no_asignadas FROM "INVENTARIO_PLANI" 
WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) AND ( "INVENTARIO_PLANI"."NUMERO" = 0 ) ;
dw_1.setitem(dw_1.rowcount(),'cantidad',no_asignadas)
dw_1.insertrow(0)
dw_1.setitem(dw_1.rowcount(),'item','Asignadas')
SELECT count("INVENTARIO_PLANI"."CORRELATIVO") into :asignadas FROM "INVENTARIO_PLANI" 
WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) AND ( "INVENTARIO_PLANI"."NUMERO" > 0 ) ;
dw_1.setitem(dw_1.rowcount(),'cantidad',asignadas)
dw_1.insertrow(0)
dw_1.setitem(dw_1.rowcount(),'item','Total')
SELECT count("INVENTARIO_PLANI"."CORRELATIVO") into :total FROM "INVENTARIO_PLANI" 
WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )  ;
dw_1.setitem(dw_1.rowcount(),'cantidad',total)

dw_1.insertrow(0)
dw_1.insertrow(0)



end event

type dw_1 from datawindow within w_resumen_plano_parque
integer x = 59
integer y = 60
integer width = 2103
integer height = 1204
integer taborder = 10
string title = "none"
string dataobject = "dw_resumen_plano_parque"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_resumen_plano_parque
integer x = 1842
integer y = 1316
integer width = 320
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_resumen_plano_parque)
end event

type cb_1 from commandbutton within w_resumen_plano_parque
integer x = 59
integer y = 1316
integer width = 320
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

