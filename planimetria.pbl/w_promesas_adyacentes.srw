forward
global type w_promesas_adyacentes from window
end type
type cb_3 from commandbutton within w_promesas_adyacentes
end type
type dw_2 from datawindow within w_promesas_adyacentes
end type
type cb_2 from commandbutton within w_promesas_adyacentes
end type
type cb_1 from commandbutton within w_promesas_adyacentes
end type
type dw_1 from datawindow within w_promesas_adyacentes
end type
end forward

global type w_promesas_adyacentes from window
integer width = 1847
integer height = 1336
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_3 cb_3
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_promesas_adyacentes w_promesas_adyacentes

on w_promesas_adyacentes.create
this.cb_3=create cb_3
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.dw_2,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_promesas_adyacentes.destroy
destroy(this.cb_3)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;string ls_sector,sep
integer count_sector,i,j

gf_centrar(w_promesas_adyacentes)

SELECT DISTINCT count(*) INTO :count_sector FROM PLANO_PARQUE WHERE SECTOR = :gs_sector ;
if sqlca.sqlcode = 0 and count_sector > 0 then //Tierra
	dw_1.dataobject = 'dw_plano_sector_parque1_1'
	else //Construida
		SELECT DISTINCT count(*) INTO :count_sector FROM PLANO_PARQUE_CONST WHERE SECTOR = :gs_sector ;
		if sqlca.sqlcode = 0 and count_sector > 0 then
			dw_1.dataobject = 'dw_plano_sector_parque2_2'
	end if
	if dw_2.retrieve(gs_sector) > 0 then
		for i = 1 to dw_2.rowcount()
			for j = 3 to 80
				sep = dw_2.getitemstring(i,'campo'+string(j))
				if sep = gs_sepultura then
					
				end if
			next
		next
	end if
end if
end event

type cb_3 from commandbutton within w_promesas_adyacentes
integer x = 750
integer y = 1040
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

type dw_2 from datawindow within w_promesas_adyacentes
integer x = 2089
integer y = 472
integer width = 411
integer height = 432
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_promesas_adyacentes
integer x = 1335
integer y = 1044
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_promesas_adyacentes)
end event

type cb_1 from commandbutton within w_promesas_adyacentes
integer x = 59
integer y = 1044
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type dw_1 from datawindow within w_promesas_adyacentes
integer x = 59
integer y = 52
integer width = 1678
integer height = 944
integer taborder = 10
string title = "none"
string dataobject = "dw_promesas_adyacentes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

