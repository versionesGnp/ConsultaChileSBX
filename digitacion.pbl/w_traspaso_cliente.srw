forward
global type w_traspaso_cliente from window
end type
type cb_3 from commandbutton within w_traspaso_cliente
end type
type cb_2 from commandbutton within w_traspaso_cliente
end type
type st_2 from statictext within w_traspaso_cliente
end type
type st_1 from statictext within w_traspaso_cliente
end type
type dw_2 from datawindow within w_traspaso_cliente
end type
type dw_1 from datawindow within w_traspaso_cliente
end type
type cb_1 from commandbutton within w_traspaso_cliente
end type
end forward

global type w_traspaso_cliente from window
integer width = 2766
integer height = 1220
boolean titlebar = true
string title = "Traspaso Datos Tabla Cliente"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_3 cb_3
cb_2 cb_2
st_2 st_2
st_1 st_1
dw_2 dw_2
dw_1 dw_1
cb_1 cb_1
end type
global w_traspaso_cliente w_traspaso_cliente

event open;gf_centrar(w_traspaso_cliente)

end event

on w_traspaso_cliente.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_2=create st_2
this.st_1=create st_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.st_2,&
this.st_1,&
this.dw_2,&
this.dw_1,&
this.cb_1}
end on

on w_traspaso_cliente.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_1)
end on

type cb_3 from commandbutton within w_traspaso_cliente
integer x = 1390
integer y = 928
integer width = 453
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Proceso Ciudad"
end type

event clicked;long		ll_tot_reg,ll_indi,ll_largo
String	ls_ciudad,ls_codigo_ciudad
SetPointer(HourGlass!)
dw_2.settransobject(sqlca)
dw_2.retrieve()
ll_tot_reg	= dw_2.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_ciudad			= dw_2.getitemstring(ll_indi,'ciudad_paso_ciudad')
	ls_codigo_ciudad	= dw_2.getitemstring(ll_indi,'ciudad_paso_codigo_real')
	ll_largo				= len(ls_codigo_ciudad)
	ll_largo				= ll_largo - 1
	ls_codigo_ciudad	= mid(ls_codigo_ciudad,1,ll_largo)
	if not isnull(ls_codigo_ciudad) then
		UPDATE	"CLIENTE"  
		SET 		"CIUDAD" = :ls_codigo_ciudad
		WHERE 	"CLIENTE"."CIUDAD" = :ls_ciudad   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		UPDATE	"CLIENTE"  
		SET 		"CIUDAD_COMERCIAL" = :ls_codigo_ciudad  
		WHERE 	"CLIENTE"."CIUDAD_COMERCIAL" = :ls_ciudad   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		UPDATE	"SOL_MOD_ANTECE"  
		SET 		"CIUDAD_ORIGINAL" = :ls_codigo_ciudad   
		WHERE 	"SOL_MOD_ANTECE"."CIUDAD_ORIGINAL" = :ls_ciudad   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		UPDATE	"SOL_MOD_ANTECE"  
		SET 		"CIUDAD_NUEVA" = :ls_codigo_ciudad  
		WHERE 	"SOL_MOD_ANTECE"."CIUDAD_NUEVA" = :ls_ciudad   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		UPDATE	"CLIENTE_DEUDOR_TERCERO"  
		SET 		"CIUDAD" = :ls_codigo_ciudad  
		WHERE 	"CLIENTE_DEUDOR_TERCERO"."CIUDAD" = :ls_ciudad   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
next
SetPointer(Arrow!)
messagebox("Grabar CIUDAD","Traspaso Exitoso")

end event

type cb_2 from commandbutton within w_traspaso_cliente
integer x = 37
integer y = 928
integer width = 453
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Proceso Comuna"
end type

event clicked;long		ll_tot_reg,ll_indi
String	ls_comuna,ls_codigo_comuna
SetPointer(HourGlass!)
dw_1.settransobject(sqlca)
dw_1.retrieve()

ll_tot_reg	= dw_1.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_comuna			= dw_1.getitemstring(ll_indi,'comuna_paso_comuna')
	ls_codigo_comuna	= dw_1.getitemstring(ll_indi,'comuna_paso_codigo_real')
	if not isnull(ls_codigo_comuna) then
		UPDATE	"CLIENTE"  
		SET 		"COMUNA" = :ls_codigo_comuna
		WHERE 	"CLIENTE"."COMUNA" = :ls_comuna   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		UPDATE	"CLIENTE"  
		SET 		"COMUNA_COMERCIAL" = :ls_codigo_comuna  
		WHERE 	"CLIENTE"."COMUNA_COMERCIAL" = :ls_comuna   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		UPDATE	"SOL_MOD_ANTECE"  
		SET 		"COMUNA_ORIGINAL" = :ls_codigo_comuna   
		WHERE 	"SOL_MOD_ANTECE"."COMUNA_ORIGINAL" = :ls_comuna
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		UPDATE	"SOL_MOD_ANTECE"  
		SET 		"COMUNA_NUEVA" = :ls_codigo_comuna  
		WHERE 	"SOL_MOD_ANTECE"."COMUNA_NUEVA" = :ls_comuna   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		UPDATE	"CLIENTE_DEUDOR_TERCERO"  
		SET 		"COMUNA" = :ls_codigo_comuna  
		WHERE 	"CLIENTE_DEUDOR_TERCERO"."COMUNA" = :ls_comuna   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if
next
SetPointer(Arrow!)
messagebox("Grabar COMUNA","Traspaso Exitoso")

end event

type st_2 from statictext within w_traspaso_cliente
integer x = 1426
integer y = 24
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ciudad"
boolean focusrectangle = false
end type

type st_1 from statictext within w_traspaso_cliente
integer x = 73
integer y = 24
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comuna"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_traspaso_cliente
integer x = 1390
integer y = 96
integer width = 1280
integer height = 768
integer taborder = 30
string title = "none"
string dataobject = "dw_ciudad_paso"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_traspaso_cliente
integer x = 37
integer y = 96
integer width = 1280
integer height = 768
integer taborder = 10
string title = "none"
string dataobject = "dw_comuna_paso"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_traspaso_cliente
integer x = 2267
integer y = 928
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_traspaso_cliente)
end event

