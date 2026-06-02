forward
global type w_referidos from window
end type
type st_3 from statictext within w_referidos
end type
type dw_agente_referidos from datawindow within w_referidos
end type
type cb_imprimir_resumen from commandbutton within w_referidos
end type
type dw_resumen from datawindow within w_referidos
end type
type st_2 from statictext within w_referidos
end type
type cb_exportar from commandbutton within w_referidos
end type
type cb_2 from commandbutton within w_referidos
end type
type cb_3 from commandbutton within w_referidos
end type
type cb_4 from commandbutton within w_referidos
end type
type cb_limpiar from commandbutton within w_referidos
end type
type st_1 from statictext within w_referidos
end type
type em_rut from editmask within w_referidos
end type
type dw_referidos from datawindow within w_referidos
end type
type dw_agente from datawindow within w_referidos
end type
type cb_cerrar from commandbutton within w_referidos
end type
type st_rut from statictext within w_referidos
end type
type gb_2 from groupbox within w_referidos
end type
end forward

global type w_referidos from window
integer width = 3360
integer height = 2764
boolean titlebar = true
string title = "Referidos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_3 st_3
dw_agente_referidos dw_agente_referidos
cb_imprimir_resumen cb_imprimir_resumen
dw_resumen dw_resumen
st_2 st_2
cb_exportar cb_exportar
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_limpiar cb_limpiar
st_1 st_1
em_rut em_rut
dw_referidos dw_referidos
dw_agente dw_agente
cb_cerrar cb_cerrar
st_rut st_rut
gb_2 gb_2
end type
global w_referidos w_referidos

type variables
long il_row
end variables

on w_referidos.create
this.st_3=create st_3
this.dw_agente_referidos=create dw_agente_referidos
this.cb_imprimir_resumen=create cb_imprimir_resumen
this.dw_resumen=create dw_resumen
this.st_2=create st_2
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_limpiar=create cb_limpiar
this.st_1=create st_1
this.em_rut=create em_rut
this.dw_referidos=create dw_referidos
this.dw_agente=create dw_agente
this.cb_cerrar=create cb_cerrar
this.st_rut=create st_rut
this.gb_2=create gb_2
this.Control[]={this.st_3,&
this.dw_agente_referidos,&
this.cb_imprimir_resumen,&
this.dw_resumen,&
this.st_2,&
this.cb_exportar,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.cb_limpiar,&
this.st_1,&
this.em_rut,&
this.dw_referidos,&
this.dw_agente,&
this.cb_cerrar,&
this.st_rut,&
this.gb_2}
end on

on w_referidos.destroy
destroy(this.st_3)
destroy(this.dw_agente_referidos)
destroy(this.cb_imprimir_resumen)
destroy(this.dw_resumen)
destroy(this.st_2)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_limpiar)
destroy(this.st_1)
destroy(this.em_rut)
destroy(this.dw_referidos)
destroy(this.dw_agente)
destroy(this.cb_cerrar)
destroy(this.st_rut)
destroy(this.gb_2)
end on

event open;gf_centrar(w_referidos)
dw_agente.settransobject(sqlca)
dw_referidos.settransobject(sqlca)
dw_resumen.settransobject(sqlca)
dw_agente_referidos.getchild('cod_age',idw_detalle)
dw_agente_referidos.settransobject(sqlca)
idw_detalle.settransobject(sqlca)
dw_agente.insertrow(0)

end event

type st_3 from statictext within w_referidos
integer x = 2071
integer y = 164
integer width = 731
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente Posee 2 Codigos"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_agente_referidos from datawindow within w_referidos
integer x = 2802
integer y = 152
integer width = 384
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_agente_referido"
boolean border = false
end type

event itemchanged;long ll_rut
string ls_cod_age

dw_agente_referidos.accepttext()
//dw_agente_referidos.reset()
ls_cod_age = dw_agente_referidos.getitemstring(1,'cod_age')
ll_rut 	  = long(em_rut.text)
dw_agente.retrieve(ll_rut,ls_cod_age)
dw_resumen.retrieve(ll_rut,ls_cod_age)
dw_resumen.object.usuario.text	 = gs_user
if dw_referidos.retrieve(ll_rut,ls_cod_age) = 0 then
	messagebox('Advertencia','El Agente Ingresado NO Posee Ventas')
end if

end event

type cb_imprimir_resumen from commandbutton within w_referidos
integer x = 1719
integer y = 2512
integer width = 462
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir &Resumen"
end type

event clicked;if dw_resumen.rowcount() > 0 then 
	dw_resumen.object.datawindow.Print.Preview	= true
	dw_resumen.object.datawindow.zoom				= 100
	f_Print( dw_resumen )
//	f_printdlg(dw_resumen,gstr_print,parent)
	dw_resumen.object.datawindow.Print.Preview	= False
	dw_resumen.object.datawindow.zoom				= 100
end if
end event

type dw_resumen from datawindow within w_referidos
integer x = 320
integer y = 1288
integer width = 2601
integer height = 1204
integer taborder = 60
string title = "none"
string dataobject = "dw_listado_referidos_resumen"
end type

type st_2 from statictext within w_referidos
integer x = 992
integer y = 172
integer width = 745
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "(Ingrese Rut sin guión ni puntos)"
boolean focusrectangle = false
end type

type cb_exportar from commandbutton within w_referidos
integer x = 763
integer y = 2524
integer width = 242
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_referidos.rowcount() > 0 then
	f_DWToExcel( dw_referidos )
//	OpenWithParm(w_exportar, dw_referidos)
end if
end event

type cb_2 from commandbutton within w_referidos
integer x = 1010
integer y = 2524
integer width = 242
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_referidos.SETSORT(NULO)
dw_referidos.SORT()

end event

type cb_3 from commandbutton within w_referidos
integer x = 1257
integer y = 2524
integer width = 206
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_referidos.SETfilter(ls_texto)
dw_referidos.filter()
end event

type cb_4 from commandbutton within w_referidos
integer x = 2281
integer y = 2512
integer width = 462
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Detalle"
end type

event clicked;if dw_referidos.rowcount() > 0 then 
	dw_referidos.object.datawindow.Print.Preview	= true
	dw_referidos.object.datawindow.zoom				= 100
	f_Print( dw_referidos )
//	f_printdlg(dw_referidos,gstr_print,parent)
	dw_referidos.object.datawindow.Print.Preview	= False
	dw_referidos.object.datawindow.zoom				= 100
end if
end event

type cb_limpiar from commandbutton within w_referidos
integer x = 101
integer y = 2512
integer width = 352
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;em_rut.text = ''
dw_agente.reset()
dw_agente.insertrow(0)
dw_resumen.reset()
dw_referidos.reset()
dw_agente_referidos.reset()

end event

type st_1 from statictext within w_referidos
integer x = 1362
integer y = 16
integer width = 526
integer height = 104
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Referidos"
boolean focusrectangle = false
end type

type em_rut from editmask within w_referidos
integer x = 539
integer y = 160
integer width = 393
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

event modified;string	ls_cod_age,ls_nombre_agente,ls_ap_pat_agente,ls_ap_mat_agente,ls_cod_sup,ls_estado_age
date		ld_fecha_ingreso,ld_fecha_termino 
long 		ll_rut,ll_new,ll_count_age

st_3.visible						= false
dw_agente_referidos.visible	= false
ll_rut 								= long(em_rut.text)
SELECT	Count("AGENTES"."COD_AGE")
INTO		:ll_count_age
FROM	  	"AGENTES"
WHERE	  	"AGENTES"."RUT" = :ll_rut   
USING	  	sqlca;
if ll_count_age > 1 then
	idw_detalle.reset()
	if idw_detalle.retrieve(ll_rut)=0 then
		dw_agente_referidos.insertrow(0)
	else
		st_3.visible						= true
		dw_agente_referidos.visible	= true
	end if
	dw_agente_referidos.insertrow(0)

elseif ll_count_age = 1 then
	SELECT	"AGENTES"."COD_AGE"  
	INTO 		:ls_cod_age  
	FROM 		"AGENTES"  
	WHERE 	"AGENTES"."RUT" = :ll_rut   ;

	dw_agente.retrieve(ll_rut,ls_cod_age)
	dw_resumen.retrieve(ll_rut,ls_cod_age)
	dw_resumen.object.usuario.text	 = gs_user
	if dw_referidos.retrieve(ll_rut,ls_cod_age) = 0 then
		messagebox('Advertencia','El Agente Ingresado NO Posee Ventas')
	end if
else
	messagebox('Advertencia','Rut Ingresado No Corresponde a Ningun Agente')
	em_rut.text = '' 
end if
end event

type dw_referidos from datawindow within w_referidos
integer x = 101
integer y = 460
integer width = 3141
integer height = 800
integer taborder = 50
string title = "none"
string dataobject = "dw_listado_referidos"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type dw_agente from datawindow within w_referidos
integer x = 101
integer y = 264
integer width = 3141
integer height = 188
integer taborder = 30
string title = "none"
string dataobject = "dw_datos_agente"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar from commandbutton within w_referidos
integer x = 2857
integer y = 2512
integer width = 402
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_referidos)
end event

type st_rut from statictext within w_referidos
integer x = 133
integer y = 160
integer width = 366
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Rut"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_referidos
integer x = 741
integer y = 2476
integer width = 759
integer height = 156
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

