forward
global type w_listado_covid_19_enc from window
end type
type dw_primera_dosis_enc from datawindow within w_listado_covid_19_enc
end type
type st_1 from statictext within w_listado_covid_19_enc
end type
type pb_2 from picturebutton within w_listado_covid_19_enc
end type
type pb_3 from picturebutton within w_listado_covid_19_enc
end type
type st_2 from statictext within w_listado_covid_19_enc
end type
type dw_segunda_dosis_enc from datawindow within w_listado_covid_19_enc
end type
type pb_1 from picturebutton within w_listado_covid_19_enc
end type
type st_tipo_filtro from statictext within w_listado_covid_19_enc
end type
type dw_filtro from datawindow within w_listado_covid_19_enc
end type
type cb_cerrar from commandbutton within w_listado_covid_19_enc
end type
type cb_3 from commandbutton within w_listado_covid_19_enc
end type
type cb_2 from commandbutton within w_listado_covid_19_enc
end type
type cb_4 from commandbutton within w_listado_covid_19_enc
end type
type dw_lista from datawindow within w_listado_covid_19_enc
end type
type gb_1 from groupbox within w_listado_covid_19_enc
end type
type gb_2 from groupbox within w_listado_covid_19_enc
end type
end forward

global type w_listado_covid_19_enc from window
integer width = 3995
integer height = 1908
boolean titlebar = true
string title = "Listado Covid-19 Administrativos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_primera_dosis_enc dw_primera_dosis_enc
st_1 st_1
pb_2 pb_2
pb_3 pb_3
st_2 st_2
dw_segunda_dosis_enc dw_segunda_dosis_enc
pb_1 pb_1
st_tipo_filtro st_tipo_filtro
dw_filtro dw_filtro
cb_cerrar cb_cerrar
cb_3 cb_3
cb_2 cb_2
cb_4 cb_4
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
end type
global w_listado_covid_19_enc w_listado_covid_19_enc

on w_listado_covid_19_enc.create
this.dw_primera_dosis_enc=create dw_primera_dosis_enc
this.st_1=create st_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.st_2=create st_2
this.dw_segunda_dosis_enc=create dw_segunda_dosis_enc
this.pb_1=create pb_1
this.st_tipo_filtro=create st_tipo_filtro
this.dw_filtro=create dw_filtro
this.cb_cerrar=create cb_cerrar
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_4=create cb_4
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_primera_dosis_enc,&
this.st_1,&
this.pb_2,&
this.pb_3,&
this.st_2,&
this.dw_segunda_dosis_enc,&
this.pb_1,&
this.st_tipo_filtro,&
this.dw_filtro,&
this.cb_cerrar,&
this.cb_3,&
this.cb_2,&
this.cb_4,&
this.dw_lista,&
this.gb_1,&
this.gb_2}
end on

on w_listado_covid_19_enc.destroy
destroy(this.dw_primera_dosis_enc)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.dw_segunda_dosis_enc)
destroy(this.pb_1)
destroy(this.st_tipo_filtro)
destroy(this.dw_filtro)
destroy(this.cb_cerrar)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;gf_centrar(w_listado_covid_19_enc)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
dw_filtro.settransobject(sqlca)
dw_filtro.insertrow(0)
dw_primera_dosis_enc.settransobject(sqlca)
dw_primera_dosis_enc.insertrow(0)
dw_segunda_dosis_enc.settransobject(sqlca)
dw_segunda_dosis_enc.insertrow(0)
if dw_lista.retrieve() = 0 then
	dw_filtro.retrieve()
end if	
end event

type dw_primera_dosis_enc from datawindow within w_listado_covid_19_enc
integer x = 1445
integer y = 1660
integer width = 215
integer height = 84
integer taborder = 60
string title = "none"
string dataobject = "dwe_primera_dosis"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_listado_covid_19_enc
integer x = 1170
integer y = 1672
integer width = 279
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1ra Dosis"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_listado_covid_19_enc
integer x = 1655
integer y = 1652
integer width = 123
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "estado_cheques.bmp"
alignment htextalign = left!
end type

event clicked;string ls_string,ls_pasa = 'N'
long ll_cod_covid,ll_tot_reg,ll_indi

ll_tot_reg			= dw_primera_dosis_enc.rowcount()
if ll_tot_reg > 0 then
	ll_indi			= dw_primera_dosis_enc.getrow()
	ll_cod_covid	= dw_primera_dosis_enc.getitemnumber(ll_indi,'cod_primera_dosis')
	if ll_cod_covid = 0 or ll_cod_covid = 1 then
		ls_string			= "vacuna_primera_dosis = "+string(ll_cod_covid)
		ls_pasa			= 'S'
	end if
end if
if ls_pasa='S' then
	dw_lista.setfilter(ls_string)
	dw_lista.filter()
end if 
end event

type pb_3 from picturebutton within w_listado_covid_19_enc
integer x = 2304
integer y = 1652
integer width = 123
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "estado_cheques.bmp"
alignment htextalign = left!
end type

event clicked;string ls_string,ls_pasa = 'N'
long ll_cod_covid,ll_tot_reg,ll_indi

ll_tot_reg			= dw_segunda_dosis_enc.rowcount()
if ll_tot_reg > 0 then
	ll_indi			= dw_segunda_dosis_enc.getrow()
	ll_cod_covid	= dw_segunda_dosis_enc.getitemnumber(ll_indi,'cod_primera_dosis')
	if ll_cod_covid = 0 or ll_cod_covid = 1 then
		ls_string			= "vacuna_segunda_dosis = "+string(ll_cod_covid)
		ls_pasa			= 'S'
	end if
end if
if ls_pasa='S' then
	dw_lista.setfilter(ls_string)
	dw_lista.filter()
end if 
end event

type st_2 from statictext within w_listado_covid_19_enc
integer x = 1806
integer y = 1672
integer width = 288
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "2da Dosis"
boolean focusrectangle = false
end type

type dw_segunda_dosis_enc from datawindow within w_listado_covid_19_enc
integer x = 2089
integer y = 1660
integer width = 215
integer height = 84
integer taborder = 50
string title = "none"
string dataobject = "dwe_primera_dosis"
boolean border = false
boolean livescroll = true
end type

type pb_1 from picturebutton within w_listado_covid_19_enc
integer x = 1019
integer y = 1648
integer width = 123
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "estado_cheques.bmp"
alignment htextalign = left!
end type

event clicked;string ls_string,ls_pasa = 'N',ll_cod_covid
long ll_tot_reg,ll_indi

ll_tot_reg			= dw_filtro.rowcount()
if ll_tot_reg > 0 then
	ll_indi		=dw_filtro.getrow()
	ll_cod_covid = dw_filtro.getitemstring(ll_indi,'cod_covid')
	if not isnull(ll_cod_covid) or ll_cod_covid <> '' then
		ls_string			= "contagio_covid = "+string(ll_cod_covid)
		ls_pasa			= 'S'
	end if
end if
if ls_pasa='S' then
	dw_lista.setfilter(ls_string)
	dw_lista.filter()
end if 
end event

type st_tipo_filtro from statictext within w_listado_covid_19_enc
integer x = 27
integer y = 1668
integer width = 183
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar"
boolean focusrectangle = false
end type

type dw_filtro from datawindow within w_listado_covid_19_enc
integer x = 210
integer y = 1664
integer width = 809
integer height = 84
integer taborder = 60
string title = "none"
string dataobject = "dwe_lista_cod_covid"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//Long	ll_cod_covid
//dw_filtro.accepttext()
//dw_lista.reset()
//dw_lista.insertrow(0)
////ll_cod_covid	= this.getitemnumber(1,'cod_parque')
end event

type cb_cerrar from commandbutton within w_listado_covid_19_enc
integer x = 3634
integer y = 1656
integer width = 293
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listado_covid_19_enc)
end event

type cb_3 from commandbutton within w_listado_covid_19_enc
integer x = 3241
integer y = 1660
integer width = 229
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_2 from commandbutton within w_listado_covid_19_enc
integer x = 2994
integer y = 1660
integer width = 238
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type cb_4 from commandbutton within w_listado_covid_19_enc
integer x = 2761
integer y = 1660
integer width = 224
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setsort(nulo)
dw_lista.sort()




end event

type dw_lista from datawindow within w_listado_covid_19_enc
integer x = 37
integer y = 28
integer width = 3890
integer height = 1576
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_covid_encargados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row

if this.getrow()>0 then
	ll_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
end if
end event

event clicked;long ll_row

if this.getrow()>0 then
	ll_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
end if
end event

event doubleclicked;long ll_row,ll_rut

ll_row						= dw_lista.getrow()
if dw_lista.rowcount()>0 and ll_row>0 then
	if isvalid(w_ingreso_covid) then
		ll_rut		= dw_lista.getitemnumber(ll_row,'rut')
		if ll_rut > 0 then
			w_ingreso_covid.tab_1.tabpage_2.cb_limpiar.triggerEvent(Clicked!)
			w_ingreso_covid.tab_1.tabpage_1.em_rut.text = string(ll_rut)
			w_ingreso_covid.tab_1.tabpage_1.dw_encargados.retrieve(ll_rut)
			close(w_listado_covid_19_enc)	
		end if	
	end if
end if	
end event

type gb_1 from groupbox within w_listado_covid_19_enc
integer x = 2738
integer y = 1612
integer width = 754
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_listado_covid_19_enc
integer x = 9
integer y = 1596
integer width = 2469
integer height = 180
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

