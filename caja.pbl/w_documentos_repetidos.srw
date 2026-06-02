forward
global type w_documentos_repetidos from window
end type
type st_2 from statictext within w_documentos_repetidos
end type
type st_1 from statictext within w_documentos_repetidos
end type
type dw_2 from datawindow within w_documentos_repetidos
end type
type cb_3 from commandbutton within w_documentos_repetidos
end type
type cb_2 from commandbutton within w_documentos_repetidos
end type
type cb_1 from commandbutton within w_documentos_repetidos
end type
type dw_1 from datawindow within w_documentos_repetidos
end type
end forward

global type w_documentos_repetidos from window
integer width = 3017
integer height = 1432
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_2 st_2
st_1 st_1
dw_2 dw_2
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_documentos_repetidos w_documentos_repetidos

on w_documentos_repetidos.create
this.st_2=create st_2
this.st_1=create st_1
this.dw_2=create dw_2
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_2,&
this.st_1,&
this.dw_2,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_documentos_repetidos.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type st_2 from statictext within w_documentos_repetidos
integer x = 2533
integer y = 1116
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within w_documentos_repetidos
integer x = 2523
integer y = 752
integer width = 361
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_documentos_repetidos
integer x = 119
integer y = 608
integer width = 2350
integer height = 624
integer taborder = 50
string title = "none"
string dataobject = "dw_encuentra_rep"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_documentos_repetidos
integer x = 2514
integer y = 560
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_documentos_repetidos)
end event

type cb_2 from commandbutton within w_documentos_repetidos
integer x = 2514
integer y = 316
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;dw_1.print()
end event

type cb_1 from commandbutton within w_documentos_repetidos
integer x = 2514
integer y = 72
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;long i,folio,n_cheque,cod_banco,count,j
string tipo_cob,cod_pago
long folio_old,n_cheque_old,cod_banco_old
string tipo_cob_old,cod_pago_old

dw_2.settransobject(sqlca)
for i = 377 to 1503000
	dw_2.retrieve(i)
	if dw_2.rowcount() >= 1 then
		count = count + dw_2.rowcount()
		st_2.text = string(count,'###,###,###,###,##0')
	end if
	if dw_2.rowcount() > 1 then

		for j = 1 to dw_2.rowcount()
				folio = dw_2.getitemnumber(j,'folio')
				tipo_cob = dw_2.getitemstring(j,'tipo_cob')
				n_cheque = dw_2.getitemnumber(j,'n_cheque')
				cod_banco = dw_2.getitemnumber(j,'cod_banco')
				cod_pago = dw_2.getitemstring(j,'cod_pago')
			if j + 1 <= dw_2.rowcount() then
				folio_old = dw_2.getitemnumber(j + 1,'folio')
				tipo_cob_old = dw_2.getitemstring(j + 1,'tipo_cob')
				n_cheque_old = dw_2.getitemnumber(j + 1,'n_cheque')
				cod_banco_old = dw_2.getitemnumber(j + 1,'cod_banco')
				cod_pago_old = dw_2.getitemstring(j + 1,'cod_pago')
			else
				setnull(folio_old)
				setnull(tipo_cob_old)
				setnull(n_cheque_old)
				setnull(cod_banco_old)
				setnull(cod_pago_old)
			end if
			if (folio = folio_old) and (tipo_cob_old = tipo_cob) and (tipo_cob_old = tipo_cob) and &
				(n_cheque_old = n_cheque) and (cod_banco_old = cod_banco) and (cod_pago_old = cod_pago) then
				dw_1.insertrow(0)			
				dw_1.setitem(dw_1.rowcount(),'folio',folio)
				dw_1.setitem(dw_1.rowcount(),'tipo_cob' ,tipo_cob)
				dw_1.setitem(dw_1.rowcount(),'n_cheque' ,n_cheque)
				dw_1.setitem(dw_1.rowcount(),'cod_banco',cod_banco)
				dw_1.setitem(dw_1.rowcount(),'cod_pago' ,cod_pago)
			end if
		next
	end if
	st_1.text = string(i,'###,###,###,###,##0')
next
end event

type dw_1 from datawindow within w_documentos_repetidos
integer x = 119
integer y = 72
integer width = 2350
integer height = 480
integer taborder = 20
string title = "none"
string dataobject = "dw_documentos_repetido"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

