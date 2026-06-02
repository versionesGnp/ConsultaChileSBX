forward
global type w_proceso_equifax from window
end type
type st_fin from statictext within w_proceso_equifax
end type
type st_ini from statictext within w_proceso_equifax
end type
type cb_cerrar from commandbutton within w_proceso_equifax
end type
type cb_todo from commandbutton within w_proceso_equifax
end type
type tab_1 from tab within w_proceso_equifax
end type
type tabpage_000 from userobject within tab_1
end type
type cb_imprimir from commandbutton within tabpage_000
end type
type cb_2 from commandbutton within tabpage_000
end type
type cb_3 from commandbutton within tabpage_000
end type
type cb_1 from commandbutton within tabpage_000
end type
type cb_000 from commandbutton within tabpage_000
end type
type dw_000 from datawindow within tabpage_000
end type
type tabpage_000 from userobject within tab_1
cb_imprimir cb_imprimir
cb_2 cb_2
cb_3 cb_3
cb_1 cb_1
cb_000 cb_000
dw_000 dw_000
end type
type tabpage_200 from userobject within tab_1
end type
type cb_7 from commandbutton within tabpage_200
end type
type cb_6 from commandbutton within tabpage_200
end type
type cb_5 from commandbutton within tabpage_200
end type
type cb_4 from commandbutton within tabpage_200
end type
type cb_200 from commandbutton within tabpage_200
end type
type dw_200 from datawindow within tabpage_200
end type
type tabpage_200 from userobject within tab_1
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_200 cb_200
dw_200 dw_200
end type
type tabpage_300 from userobject within tab_1
end type
type cb_11 from commandbutton within tabpage_300
end type
type cb_10 from commandbutton within tabpage_300
end type
type cb_9 from commandbutton within tabpage_300
end type
type cb_8 from commandbutton within tabpage_300
end type
type cb_300 from commandbutton within tabpage_300
end type
type dw_300 from datawindow within tabpage_300
end type
type tabpage_300 from userobject within tab_1
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_300 cb_300
dw_300 dw_300
end type
type tabpage_400 from userobject within tab_1
end type
type cb_15 from commandbutton within tabpage_400
end type
type cb_14 from commandbutton within tabpage_400
end type
type cb_13 from commandbutton within tabpage_400
end type
type cb_12 from commandbutton within tabpage_400
end type
type cb_400 from commandbutton within tabpage_400
end type
type dw_400 from datawindow within tabpage_400
end type
type tabpage_400 from userobject within tab_1
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_400 cb_400
dw_400 dw_400
end type
type tabpage_500 from userobject within tab_1
end type
type cb_19 from commandbutton within tabpage_500
end type
type cb_18 from commandbutton within tabpage_500
end type
type cb_17 from commandbutton within tabpage_500
end type
type cb_16 from commandbutton within tabpage_500
end type
type cb_500 from commandbutton within tabpage_500
end type
type dw_500 from datawindow within tabpage_500
end type
type tabpage_500 from userobject within tab_1
cb_19 cb_19
cb_18 cb_18
cb_17 cb_17
cb_16 cb_16
cb_500 cb_500
dw_500 dw_500
end type
type tabpage_900 from userobject within tab_1
end type
type cb_24 from commandbutton within tabpage_900
end type
type cb_23 from commandbutton within tabpage_900
end type
type cb_22 from commandbutton within tabpage_900
end type
type cb_21 from commandbutton within tabpage_900
end type
type cb_20 from commandbutton within tabpage_900
end type
type dw_900 from datawindow within tabpage_900
end type
type tabpage_900 from userobject within tab_1
cb_24 cb_24
cb_23 cb_23
cb_22 cb_22
cb_21 cb_21
cb_20 cb_20
dw_900 dw_900
end type
type tab_1 from tab within w_proceso_equifax
tabpage_000 tabpage_000
tabpage_200 tabpage_200
tabpage_300 tabpage_300
tabpage_400 tabpage_400
tabpage_500 tabpage_500
tabpage_900 tabpage_900
end type
end forward

global type w_proceso_equifax from window
integer width = 3502
integer height = 1892
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_fin st_fin
st_ini st_ini
cb_cerrar cb_cerrar
cb_todo cb_todo
tab_1 tab_1
end type
global w_proceso_equifax w_proceso_equifax

on w_proceso_equifax.create
this.st_fin=create st_fin
this.st_ini=create st_ini
this.cb_cerrar=create cb_cerrar
this.cb_todo=create cb_todo
this.tab_1=create tab_1
this.Control[]={this.st_fin,&
this.st_ini,&
this.cb_cerrar,&
this.cb_todo,&
this.tab_1}
end on

on w_proceso_equifax.destroy
destroy(this.st_fin)
destroy(this.st_ini)
destroy(this.cb_cerrar)
destroy(this.cb_todo)
destroy(this.tab_1)
end on

event open;
tab_1.tabpage_000.dw_000.settransobject(sqlca)
tab_1.tabpage_200.dw_200.settransobject(sqlca)
tab_1.tabpage_300.dw_300.settransobject(sqlca)
tab_1.tabpage_400.dw_400.settransobject(sqlca)
tab_1.tabpage_500.dw_500.settransobject(sqlca)
tab_1.tabpage_900.dw_900.settransobject(sqlca)
gf_centrar(w_proceso_equifax)
end event

type st_fin from statictext within w_proceso_equifax
integer x = 1856
integer y = 1644
integer width = 960
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_ini from statictext within w_proceso_equifax
integer x = 667
integer y = 1644
integer width = 960
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_proceso_equifax
integer x = 3095
integer y = 1640
integer width = 320
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_proceso_equifax)
end event

type cb_todo from commandbutton within w_proceso_equifax
integer x = 41
integer y = 1640
integer width = 402
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar TODO"
end type

event clicked;String				ls_nombre_archivo0,ls_nombre_archivo2,ls_nombre_archivo3,ls_nombre_archivo4,ls_nombre_archivo5,ls_nombre_archivo9
SaveAsType 	TipoArchivo
Long				ll_res2,ll_tot_reg

SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
st_ini.text					= 'Inicio '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm:ss')
SetPointer(HourGlass!)

DECLARE proc_carga_equifax PROCEDURE FOR SP_CARGA_EQUIFAX() ;
execute proc_carga_equifax;
	
ll_tot_reg					= tab_1.tabpage_000.dw_000.retrieve()
tab_1.tabpage_200.dw_200.retrieve()
tab_1.tabpage_300.dw_300.retrieve()
tab_1.tabpage_400.dw_400.retrieve()
tab_1.tabpage_500.dw_500.retrieve()
tab_1.tabpage_900.dw_900.retrieve()
if ll_tot_reg > 0 then
	ls_nombre_archivo0		= 'C:\mod_cp\consulta\'+'INTERFAZ_000'+string(gdt_fec_sistema,'ddmmyyyy')+'.txt'
	ls_nombre_archivo2		= 'C:\mod_cp\consulta\'+'INTERFAZ_200'+string(gdt_fec_sistema,'ddmmyyyy')+'.txt'
	ls_nombre_archivo3		= 'C:\mod_cp\consulta\'+'INTERFAZ_300'+string(gdt_fec_sistema,'ddmmyyyy')+'.txt'
	ls_nombre_archivo4		= 'C:\mod_cp\consulta\'+'INTERFAZ_400'+string(gdt_fec_sistema,'ddmmyyyy')+'.txt'
	ls_nombre_archivo5		= 'C:\mod_cp\consulta\'+'INTERFAZ_500'+string(gdt_fec_sistema,'ddmmyyyy')+'.txt'
	ls_nombre_archivo9		= 'C:\mod_cp\consulta\'+'INTERFAZ_900'+string(gdt_fec_sistema,'ddmmyyyy')+'.txt'
	TipoArchivo 					= Text!
	ll_res2						= tab_1.tabpage_000.dw_000.SaveAs( ls_nombre_archivo0,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
	ll_res2						= tab_1.tabpage_200.dw_200.SaveAs( ls_nombre_archivo2,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
	ll_res2						= tab_1.tabpage_300.dw_300.SaveAs( ls_nombre_archivo3,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
	ll_res2						= tab_1.tabpage_400.dw_400.SaveAs( ls_nombre_archivo4,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
	ll_res2						= tab_1.tabpage_500.dw_500.SaveAs( ls_nombre_archivo5,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
	ll_res2						= tab_1.tabpage_900.dw_900.SaveAs( ls_nombre_archivo9,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
end if
SetPointer(Arrow!)
SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
st_fin.text						= 'Término '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm:ss')
messagebox("Proceso","Término Proceso Cyber")
end event

type tab_1 from tab within w_proceso_equifax
integer x = 41
integer y = 40
integer width = 3383
integer height = 1560
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_000 tabpage_000
tabpage_200 tabpage_200
tabpage_300 tabpage_300
tabpage_400 tabpage_400
tabpage_500 tabpage_500
tabpage_900 tabpage_900
end type

on tab_1.create
this.tabpage_000=create tabpage_000
this.tabpage_200=create tabpage_200
this.tabpage_300=create tabpage_300
this.tabpage_400=create tabpage_400
this.tabpage_500=create tabpage_500
this.tabpage_900=create tabpage_900
this.Control[]={this.tabpage_000,&
this.tabpage_200,&
this.tabpage_300,&
this.tabpage_400,&
this.tabpage_500,&
this.tabpage_900}
end on

on tab_1.destroy
destroy(this.tabpage_000)
destroy(this.tabpage_200)
destroy(this.tabpage_300)
destroy(this.tabpage_400)
destroy(this.tabpage_500)
destroy(this.tabpage_900)
end on

type tabpage_000 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3346
integer height = 1432
long backcolor = 67108864
string text = "000"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_imprimir cb_imprimir
cb_2 cb_2
cb_3 cb_3
cb_1 cb_1
cb_000 cb_000
dw_000 dw_000
end type

on tabpage_000.create
this.cb_imprimir=create cb_imprimir
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_1=create cb_1
this.cb_000=create cb_000
this.dw_000=create dw_000
this.Control[]={this.cb_imprimir,&
this.cb_2,&
this.cb_3,&
this.cb_1,&
this.cb_000,&
this.dw_000}
end on

on tabpage_000.destroy
destroy(this.cb_imprimir)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.cb_000)
destroy(this.dw_000)
end on

type cb_imprimir from commandbutton within tabpage_000
boolean visible = false
integer x = 1915
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if tab_1.tabpage_000.dw_000.rowcount() > 0 then
	tab_1.tabpage_000.dw_000.print()
end if
end event

type cb_2 from commandbutton within tabpage_000
boolean visible = false
integer x = 1691
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= tab_1.tabpage_000.dw_000
if tab_1.tabpage_000.dw_000.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within tabpage_000
integer x = 1467
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo

setnull (nulo)
tab_1.tabpage_000.dw_000.SETfilter(NULO)
tab_1.tabpage_000.dw_000.filter()
end event

type cb_1 from commandbutton within tabpage_000
integer x = 1243
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if tab_1.tabpage_000.dw_000.rowcount() > 0 then
	setnull (nulo)
	tab_1.tabpage_000.dw_000.SETSORT(NULO)
	tab_1.tabpage_000.dw_000.SORT()
end if
end event

type cb_000 from commandbutton within tabpage_000
integer x = 27
integer y = 1296
integer width = 347
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;DECLARE proc_carga_equifax PROCEDURE FOR SP_CARGA_EQUIFAX() ;
execute proc_carga_equifax;
	
tab_1.tabpage_000.dw_000.retrieve()
end event

type dw_000 from datawindow within tabpage_000
integer x = 27
integer y = 40
integer width = 3296
integer height = 1224
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_equifax_000"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_200 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3346
integer height = 1432
long backcolor = 67108864
string text = "200"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_200 cb_200
dw_200 dw_200
end type

on tabpage_200.create
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_200=create cb_200
this.dw_200=create dw_200
this.Control[]={this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_200,&
this.dw_200}
end on

on tabpage_200.destroy
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_200)
destroy(this.dw_200)
end on

type cb_7 from commandbutton within tabpage_200
boolean visible = false
integer x = 1915
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if tab_1.tabpage_200.dw_200.rowcount() > 0 then
	tab_1.tabpage_200.dw_200.print()
end if
end event

type cb_6 from commandbutton within tabpage_200
boolean visible = false
integer x = 1691
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= tab_1.tabpage_200.dw_200
if tab_1.tabpage_200.dw_200.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_5 from commandbutton within tabpage_200
integer x = 1467
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo

setnull (nulo)
tab_1.tabpage_200.dw_200.SETfilter(NULO)
tab_1.tabpage_200.dw_200.filter()
end event

type cb_4 from commandbutton within tabpage_200
integer x = 1243
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if tab_1.tabpage_200.dw_200.rowcount() > 0 then
	setnull (nulo)
	tab_1.tabpage_200.dw_200.SETSORT(NULO)
	tab_1.tabpage_200.dw_200.SORT()
end if
end event

type cb_200 from commandbutton within tabpage_200
integer x = 27
integer y = 1296
integer width = 347
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;tab_1.tabpage_200.dw_200.retrieve()
end event

type dw_200 from datawindow within tabpage_200
integer x = 27
integer y = 40
integer width = 3296
integer height = 1224
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_equifax_200"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_300 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3346
integer height = 1432
long backcolor = 67108864
string text = "300"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_300 cb_300
dw_300 dw_300
end type

on tabpage_300.create
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_300=create cb_300
this.dw_300=create dw_300
this.Control[]={this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_300,&
this.dw_300}
end on

on tabpage_300.destroy
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_300)
destroy(this.dw_300)
end on

type cb_11 from commandbutton within tabpage_300
boolean visible = false
integer x = 1915
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if tab_1.tabpage_300.dw_300.rowcount() > 0 then
	tab_1.tabpage_300.dw_300.print()
end if
end event

type cb_10 from commandbutton within tabpage_300
boolean visible = false
integer x = 1691
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= tab_1.tabpage_300.dw_300
if tab_1.tabpage_300.dw_300.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_9 from commandbutton within tabpage_300
integer x = 1467
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo

setnull (nulo)
tab_1.tabpage_300.dw_300.SETfilter(NULO)
tab_1.tabpage_300.dw_300.filter()
end event

type cb_8 from commandbutton within tabpage_300
integer x = 1243
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 230
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if tab_1.tabpage_300.dw_300.rowcount() > 0 then
	setnull (nulo)
	tab_1.tabpage_300.dw_300.SETSORT(NULO)
	tab_1.tabpage_300.dw_300.SORT()
end if
end event

type cb_300 from commandbutton within tabpage_300
integer x = 27
integer y = 1296
integer width = 347
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;tab_1.tabpage_300.dw_300.retrieve()
end event

type dw_300 from datawindow within tabpage_300
integer x = 27
integer y = 40
integer width = 3296
integer height = 1224
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_equifax_300"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_400 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3346
integer height = 1432
long backcolor = 67108864
string text = "400"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_400 cb_400
dw_400 dw_400
end type

on tabpage_400.create
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_400=create cb_400
this.dw_400=create dw_400
this.Control[]={this.cb_15,&
this.cb_14,&
this.cb_13,&
this.cb_12,&
this.cb_400,&
this.dw_400}
end on

on tabpage_400.destroy
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_400)
destroy(this.dw_400)
end on

type cb_15 from commandbutton within tabpage_400
boolean visible = false
integer x = 1915
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if tab_1.tabpage_400.dw_400.rowcount() > 0 then
	tab_1.tabpage_400.dw_400.print()
end if
end event

type cb_14 from commandbutton within tabpage_400
boolean visible = false
integer x = 1691
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= tab_1.tabpage_400.dw_400
if tab_1.tabpage_400.dw_400.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_13 from commandbutton within tabpage_400
integer x = 1467
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo

setnull (nulo)
tab_1.tabpage_400.dw_400.SETfilter(NULO)
tab_1.tabpage_400.dw_400.filter()
end event

type cb_12 from commandbutton within tabpage_400
integer x = 1243
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 230
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if tab_1.tabpage_400.dw_400.rowcount() > 0 then
	setnull (nulo)
	tab_1.tabpage_400.dw_400.SETSORT(NULO)
	tab_1.tabpage_400.dw_400.SORT()
end if
end event

type cb_400 from commandbutton within tabpage_400
integer x = 27
integer y = 1296
integer width = 347
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;tab_1.tabpage_400.dw_400.retrieve()
end event

type dw_400 from datawindow within tabpage_400
integer x = 27
integer y = 40
integer width = 3296
integer height = 1224
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_equifax_400"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_500 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3346
integer height = 1432
long backcolor = 67108864
string text = "500"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_19 cb_19
cb_18 cb_18
cb_17 cb_17
cb_16 cb_16
cb_500 cb_500
dw_500 dw_500
end type

on tabpage_500.create
this.cb_19=create cb_19
this.cb_18=create cb_18
this.cb_17=create cb_17
this.cb_16=create cb_16
this.cb_500=create cb_500
this.dw_500=create dw_500
this.Control[]={this.cb_19,&
this.cb_18,&
this.cb_17,&
this.cb_16,&
this.cb_500,&
this.dw_500}
end on

on tabpage_500.destroy
destroy(this.cb_19)
destroy(this.cb_18)
destroy(this.cb_17)
destroy(this.cb_16)
destroy(this.cb_500)
destroy(this.dw_500)
end on

type cb_19 from commandbutton within tabpage_500
boolean visible = false
integer x = 1915
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if tab_1.tabpage_500.dw_500.rowcount() > 0 then
	tab_1.tabpage_500.dw_500.print()
end if
end event

type cb_18 from commandbutton within tabpage_500
boolean visible = false
integer x = 1691
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= tab_1.tabpage_500.dw_500
if tab_1.tabpage_500.dw_500.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_17 from commandbutton within tabpage_500
integer x = 1467
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo

setnull (nulo)
tab_1.tabpage_500.dw_500.SETfilter(NULO)
tab_1.tabpage_500.dw_500.filter()
end event

type cb_16 from commandbutton within tabpage_500
integer x = 1243
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 230
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if tab_1.tabpage_500.dw_500.rowcount() > 0 then
	setnull (nulo)
	tab_1.tabpage_500.dw_500.SETSORT(NULO)
	tab_1.tabpage_500.dw_500.SORT()
end if
end event

type cb_500 from commandbutton within tabpage_500
integer x = 27
integer y = 1296
integer width = 347
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;tab_1.tabpage_500.dw_500.retrieve()
end event

type dw_500 from datawindow within tabpage_500
integer x = 27
integer y = 40
integer width = 3296
integer height = 1224
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_equifax_500"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_900 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3346
integer height = 1432
long backcolor = 67108864
string text = "900"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_24 cb_24
cb_23 cb_23
cb_22 cb_22
cb_21 cb_21
cb_20 cb_20
dw_900 dw_900
end type

on tabpage_900.create
this.cb_24=create cb_24
this.cb_23=create cb_23
this.cb_22=create cb_22
this.cb_21=create cb_21
this.cb_20=create cb_20
this.dw_900=create dw_900
this.Control[]={this.cb_24,&
this.cb_23,&
this.cb_22,&
this.cb_21,&
this.cb_20,&
this.dw_900}
end on

on tabpage_900.destroy
destroy(this.cb_24)
destroy(this.cb_23)
destroy(this.cb_22)
destroy(this.cb_21)
destroy(this.cb_20)
destroy(this.dw_900)
end on

type cb_24 from commandbutton within tabpage_900
boolean visible = false
integer x = 1915
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if tab_1.tabpage_900.dw_900.rowcount() > 0 then
	tab_1.tabpage_900.dw_900.print()
end if
end event

type cb_23 from commandbutton within tabpage_900
boolean visible = false
integer x = 1691
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= tab_1.tabpage_900.dw_900
if tab_1.tabpage_900.dw_900.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_22 from commandbutton within tabpage_900
integer x = 1467
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo

setnull (nulo)
tab_1.tabpage_900.dw_900.SETfilter(NULO)
tab_1.tabpage_900.dw_900.filter()
end event

type cb_21 from commandbutton within tabpage_900
integer x = 1243
integer y = 1304
integer width = 219
integer height = 92
integer taborder = 230
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if tab_1.tabpage_900.dw_900.rowcount() > 0 then
	setnull (nulo)
	tab_1.tabpage_900.dw_900.SETSORT(NULO)
	tab_1.tabpage_900.dw_900.SORT()
end if
end event

type cb_20 from commandbutton within tabpage_900
integer x = 27
integer y = 1296
integer width = 347
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;tab_1.tabpage_900.dw_900.retrieve()
end event

type dw_900 from datawindow within tabpage_900
integer x = 27
integer y = 40
integer width = 3296
integer height = 1224
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_equifax_900"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

