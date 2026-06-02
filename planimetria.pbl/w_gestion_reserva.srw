forward
global type w_gestion_reserva from window
end type
type cb_1 from commandbutton within w_gestion_reserva
end type
type ddlb_1 from dropdownlistbox within w_gestion_reserva
end type
end forward

global type w_gestion_reserva from window
integer width = 1920
integer height = 816
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_1 cb_1
ddlb_1 ddlb_1
end type
global w_gestion_reserva w_gestion_reserva

event open;gf_centrar(w_resumenes_planimetria)
string sql
sql='SELECT DISTINCT "LOG_RESERVA_SEPULTURA"."USUARIO_LOG",                                     '+&
    '                "ENCARGADOS"."NOMBRE"                                                      '+&  
    'FROM            "ENCARGADOS",                                                              '+&
    '                "LOG_RESERVA_SEPULTURA"                                                    '+&
    'WHERE           "ENCARGADOS"."CODIGO_USUARIO" = "LOG_RESERVA_SEPULTURA"."USUARIO_LOG"  and '+&
    '                "LOG_RESERVA_SEPULTURA"."COD_PARQUE" = 102                                 '+&
    'ORDER BY        "ENCARGADOS"."NOMBRE" ASC                                                  '
f_ddlb_all(ddlb_1,sql)
end event

on w_gestion_reserva.create
this.cb_1=create cb_1
this.ddlb_1=create ddlb_1
this.Control[]={this.cb_1,&
this.ddlb_1}
end on

on w_gestion_reserva.destroy
destroy(this.cb_1)
destroy(this.ddlb_1)
end on

type cb_1 from commandbutton within w_gestion_reserva
integer x = 1339
integer y = 604
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;close(w_gestion_reserva)
end event

type ddlb_1 from dropdownlistbox within w_gestion_reserva
integer x = 101
integer y = 180
integer width = 1573
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

