forward
global type w_lista_inv_plani from window
end type
type cb_8 from commandbutton within w_lista_inv_plani
end type
type dw_2 from datawindow within w_lista_inv_plani
end type
type ddlb_1 from dropdownlistbox within w_lista_inv_plani
end type
type cb_2 from commandbutton within w_lista_inv_plani
end type
type cb_1 from commandbutton within w_lista_inv_plani
end type
type dw_1 from datawindow within w_lista_inv_plani
end type
type gb_1 from groupbox within w_lista_inv_plani
end type
type gb_2 from groupbox within w_lista_inv_plani
end type
end forward

global type w_lista_inv_plani from window
integer width = 2720
integer height = 2844
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_8 cb_8
dw_2 dw_2
ddlb_1 ddlb_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_lista_inv_plani w_lista_inv_plani

type variables
integer id_parque// variable de instancia
end variables

on w_lista_inv_plani.create
this.cb_8=create cb_8
this.dw_2=create dw_2
this.ddlb_1=create ddlb_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_8,&
this.dw_2,&
this.ddlb_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_lista_inv_plani.destroy
destroy(this.cb_8)
destroy(this.dw_2)
destroy(this.ddlb_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;string 	ls_sql
long 		cantidad

id_parque = integer(w_plano_sector_parque.st_parque.text)//Multiempresa 13-11-2006
gf_centrar(w_lista_inv_plani)

this.title = 'Listado de Sector '+gs_sector
ls_sql = ' SELECT DISTINCT "INVENTARIO_PLANI"."SUB_SECTOR" FROM "INVENTARIO_PLANI"'+&
			' WHERE "INVENTARIO_PLANI"."SECTOR" ='+"'"+gs_sector+"'" +" and " +&
		   ' "INVENTARIO_PLANI"."COD_PARQUE" ='+string(id_parque)+&
			' ORDER BY "INVENTARIO_PLANI"."SUB_SECTOR" ASC'
f_ddlb_all(ddlb_1,ls_sql)
ddlb_1.AddItem('Todos')
ddlb_1.SelectItem("Todos", 1)
if gs_sector = '2ND82II' or gs_sector = '2ND82I' then
	dw_1.dataobject 		= 'dw_lista_inv_plani_nd_t'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(gs_sector,id_parque)
else
	dw_1.dataobject 		= 'dw_lista_inv_plani'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(gs_sector,id_parque)
end if
if dw_1.rowcount() > 0 then
	dw_2.reset()
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','No Aginados: ')
	cantidad 					= dw_1.getitemnumber(1,'compute_11')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','Asignados: ')
	cantidad 					= dw_1.getitemnumber(1,'compute_12')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','Total de Registros: ')
	cantidad 					= dw_1.getitemnumber(1,'compute_10')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.insertrow(0)
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','Sepultados: ')
	cantidad 					= dw_1.getitemnumber(1,'compute_13')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','No Aginados con fallecidos: ')
	cantidad 					= dw_1.getitemnumber(1,'compute_14')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','Asignados  con fallecidos: ')
	cantidad 					= dw_1.getitemnumber(1,'compute_15')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.object.t_1.text 	= w_lista_inv_plani.title	
else
	close(w_lista_inv_plani)
end if
end event

event close;w_plano_sector_parque.dw_plano_sector_parque.enabled = true
end event

type cb_8 from commandbutton within w_lista_inv_plani
integer x = 2171
integer y = 1880
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_2.rowcount() > 0 then
	f_Print( dw_2 )
end if
end event

type dw_2 from datawindow within w_lista_inv_plani
integer x = 91
integer y = 1880
integer width = 2057
integer height = 800
integer taborder = 50
string title = "none"
string dataobject = "dw_resumen_plano_parque"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_1 from dropdownlistbox within w_lista_inv_plani
integer x = 494
integer y = 1700
integer width = 585
integer height = 400
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;long cantidad

if gs_sector = '2ND82II' or gs_sector = '2ND82I' then
	if this.text = 'Todos' then
		dw_1.dataobject = 'dw_lista_inv_plani_nd_t'
		dw_1.settransobject(sqlca)
		dw_1.retrieve(gs_sector)
		if dw_1.retrieve(gs_sector) > 0 then
			w_lista_inv_plani.title = 'Listado de Sector: '+gs_sector 
		end if
	else
		dw_1.dataobject = 'dw_lista_inv_plani_nd'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(trim(this.text)) > 0 then
			w_lista_inv_plani.title = 'Listado de Sector: '+gs_sector +' y Sub Sector: '+trim(this.text)
		end if
	end if
end if

if dw_1.rowcount() > 0 then
	dw_2.reset()
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','No Aginados: ')
	cantidad = dw_1.getitemnumber(1,'compute_11')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','Asignados: ')
	cantidad = dw_1.getitemnumber(1,'compute_12')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','Total de Registros: ')
	cantidad = dw_1.getitemnumber(1,'compute_10')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.insertrow(0)
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','Sepultados: ')
	cantidad = dw_1.getitemnumber(1,'compute_13')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','No Aginados con fallecidos: ')
	cantidad = dw_1.getitemnumber(1,'compute_14')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.insertrow(0)
	dw_2.setitem(dw_2.rowcount(),'item','Asignados  con fallecidos: ')
	cantidad = dw_1.getitemnumber(1,'compute_15')
	dw_2.setitem(dw_2.rowcount(),'cantidad',cantidad)
	dw_2.object.t_1.text = w_lista_inv_plani.title	
end if
end event

type cb_2 from commandbutton within w_lista_inv_plani
integer x = 46
integer y = 1692
integer width = 402
integer height = 112
integer taborder = 30
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

type cb_1 from commandbutton within w_lista_inv_plani
integer x = 2171
integer y = 1692
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_inv_plani)
end event

type dw_1 from datawindow within w_lista_inv_plani
integer x = 46
integer y = 40
integer width = 2583
integer height = 1616
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_inv_plani"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;integer il_row

if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_lista_inv_plani
integer x = 46
integer y = 1828
integer width = 2569
integer height = 884
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resumen"
end type

type gb_2 from groupbox within w_lista_inv_plani
integer x = 462
integer y = 1652
integer width = 645
integer height = 172
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sub-Sector"
end type

