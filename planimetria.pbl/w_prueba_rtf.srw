forward
global type w_prueba_rtf from window
end type
type cb_5 from commandbutton within w_prueba_rtf
end type
type cb_4 from commandbutton within w_prueba_rtf
end type
type cb_3 from commandbutton within w_prueba_rtf
end type
type cb_2 from commandbutton within w_prueba_rtf
end type
type rte_1 from richtextedit within w_prueba_rtf
end type
type cb_1 from commandbutton within w_prueba_rtf
end type
end forward

global type w_prueba_rtf from window
integer width = 3168
integer height = 1920
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
rte_1 rte_1
cb_1 cb_1
end type
global w_prueba_rtf w_prueba_rtf

type variables
DataStore ds_empinfo
end variables

on w_prueba_rtf.create
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.rte_1=create rte_1
this.cb_1=create cb_1
this.Control[]={this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.rte_1,&
this.cb_1}
end on

on w_prueba_rtf.destroy
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.rte_1)
destroy(this.cb_1)
end on

event open;gf_centrar(w_prueba_rtf)

//DataStore ds_empinfo

ds_empinfo = CREATE DataStore

ds_empinfo.DataObject = "dw_prueba_rtf"
//
//ds_empinfo.SetTransObject(SQLCA)
//
//ds_empinfo.Retrieve()
//
//rte_1.InsertDocument("c:\migracion7\consulta\archivo_rtf.rtf", TRUE, FileTypeRichText!)
rte_1.InsertDocument("c:\migracion7\\consulta\RESC_DEFINITIVA_MONUMENTO_SERENA.rtf", TRUE, FileTypeRichText!)
//rte_1.datasource(ds_empinfo)
//rte_1.inputfieldinsert('serie')
//
//rte_1.inputfieldinsert('nro_oferta')
end event

type cb_5 from commandbutton within w_prueba_rtf
integer x = 1353
integer y = 1540
integer width = 288
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "preview"
end type

event clicked; rte_1.preview(true)
end event

type cb_4 from commandbutton within w_prueba_rtf
integer x = 1819
integer y = 1548
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "print"
end type

event clicked;//if dw_detalle.rowcount() > 0 then
//	f_printdlg(rte_1,gstr_print,w_detalle_seguros_desgravamen)
//end if
rte_1.preview(false)
//copias, desde hasta, intercalar, caja dialogo
rte_1.print(1, "1-3", True, True)
end event

type cb_3 from commandbutton within w_prueba_rtf
integer x = 558
integer y = 1552
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

event clicked;ds_empinfo = CREATE DataStore

ds_empinfo.DataObject = "dw_prueba_rtf"

ds_empinfo.SetTransObject(SQLCA)

ds_empinfo.Retrieve()

rte_1.datasource(ds_empinfo)

rte_1.inputfieldinsert('nro_oferta')

end event

type cb_2 from commandbutton within w_prueba_rtf
integer x = 101
integer y = 1552
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;//DataStore ds_empinfo

ds_empinfo = CREATE DataStore

ds_empinfo.DataObject = "dw_prueba_rtf"

ds_empinfo.SetTransObject(SQLCA)

ds_empinfo.Retrieve()

rte_1.datasource(ds_empinfo)



rte_1.inputfieldinsert('serie')

//li_rtn = rte_1.InsertPicture("c:\windows\earth.bmp")


end event

type rte_1 from richtextedit within w_prueba_rtf
integer x = 64
integer y = 48
integer width = 2985
integer height = 1412
integer taborder = 30
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_pictureframe = true
boolean init_returnsvisible = true
boolean init_spacesvisible = true
boolean init_tabsvisible = true
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_prueba_rtf
integer x = 2487
integer y = 1552
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "cerrar"
end type

event clicked;close(w_prueba_rtf)
end event

