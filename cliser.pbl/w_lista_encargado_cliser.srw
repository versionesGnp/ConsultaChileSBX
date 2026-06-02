forward
global type w_lista_encargado_cliser from window
end type
type cb_4 from commandbutton within w_lista_encargado_cliser
end type
type pb_ok from picturebutton within w_lista_encargado_cliser
end type
type em_fec_nac from editmask within w_lista_encargado_cliser
end type
type st_3 from statictext within w_lista_encargado_cliser
end type
type st_2 from statictext within w_lista_encargado_cliser
end type
type em_ap_pat from editmask within w_lista_encargado_cliser
end type
type st_1 from statictext within w_lista_encargado_cliser
end type
type em_rut from editmask within w_lista_encargado_cliser
end type
type rb_por_fec_nac from radiobutton within w_lista_encargado_cliser
end type
type rb_por_ap_pat from radiobutton within w_lista_encargado_cliser
end type
type rb_por_rut from radiobutton within w_lista_encargado_cliser
end type
type cb_1 from commandbutton within w_lista_encargado_cliser
end type
type cb_2 from commandbutton within w_lista_encargado_cliser
end type
type cb_3 from commandbutton within w_lista_encargado_cliser
end type
type cb_imprimir from commandbutton within w_lista_encargado_cliser
end type
type cb_cerrar from commandbutton within w_lista_encargado_cliser
end type
type dw_lista from datawindow within w_lista_encargado_cliser
end type
type gb_1 from groupbox within w_lista_encargado_cliser
end type
end forward

global type w_lista_encargado_cliser from window
integer width = 3013
integer height = 2008
boolean titlebar = true
string title = "Lista Encargados"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_4 cb_4
pb_ok pb_ok
em_fec_nac em_fec_nac
st_3 st_3
st_2 st_2
em_ap_pat em_ap_pat
st_1 st_1
em_rut em_rut
rb_por_fec_nac rb_por_fec_nac
rb_por_ap_pat rb_por_ap_pat
rb_por_rut rb_por_rut
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_lista_encargado_cliser w_lista_encargado_cliser

forward prototypes
public subroutine wf_limpiar ()
end prototypes

public subroutine wf_limpiar ();if rb_por_rut.checked=true then
	em_ap_pat.text			= ''
	em_ap_pat.enabled		= false
	em_fec_nac.text		= ''
	em_fec_nac.enabled	= false
	em_rut.text				= ''
	em_rut.enabled			= true
	em_rut.setfocus()
elseif rb_por_ap_pat.checked=true then
	em_ap_pat.text			= ''
	em_ap_pat.enabled		= true
	em_fec_nac.text		= ''
	em_fec_nac.enabled	= false
	em_rut.text				= ''
	em_rut.enabled			= false
	em_ap_pat.setfocus()
elseif rb_por_fec_nac.checked=true then
	em_ap_pat.text			= ''
	em_ap_pat.enabled		= false
	em_fec_nac.text		= ''
	em_fec_nac.enabled	= true
	em_rut.text				= ''
	em_rut.enabled			= false
	em_fec_nac.setfocus()
end if
end subroutine

on w_lista_encargado_cliser.create
this.cb_4=create cb_4
this.pb_ok=create pb_ok
this.em_fec_nac=create em_fec_nac
this.st_3=create st_3
this.st_2=create st_2
this.em_ap_pat=create em_ap_pat
this.st_1=create st_1
this.em_rut=create em_rut
this.rb_por_fec_nac=create rb_por_fec_nac
this.rb_por_ap_pat=create rb_por_ap_pat
this.rb_por_rut=create rb_por_rut
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_4,&
this.pb_ok,&
this.em_fec_nac,&
this.st_3,&
this.st_2,&
this.em_ap_pat,&
this.st_1,&
this.em_rut,&
this.rb_por_fec_nac,&
this.rb_por_ap_pat,&
this.rb_por_rut,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_lista_encargado_cliser.destroy
destroy(this.cb_4)
destroy(this.pb_ok)
destroy(this.em_fec_nac)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_ap_pat)
destroy(this.st_1)
destroy(this.em_rut)
destroy(this.rb_por_fec_nac)
destroy(this.rb_por_ap_pat)
destroy(this.rb_por_rut)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_lista_encargado_cliser)
dw_lista.settransobject(sqlca)
dw_lista.retrieve(today())
rb_por_rut.checked						= true
dw_lista.object.t_saludos.visible	= false
wf_limpiar()
end event

type cb_4 from commandbutton within w_lista_encargado_cliser
integer x = 1669
integer y = 1752
integer width = 498
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar Cumpleaños"
end type

event clicked;String	ls_string
if this.text='Filtrar Cumpleaños' then
	ls_string										= "day(fec_nacimt)="+string(day(today()))+" and month(fec_nacimt)="+string(month(today()))
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	this.text										= 'Mostrar Todo'
	if dw_lista.rowcount()>0 then
		dw_lista.object.t_saludos.visible	= true
	else
		dw_lista.object.t_saludos.visible	= false
	end if
else
	ls_string										= ""
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	dw_lista.object.t_saludos.visible		= false
	this.text										= 'Filtrar Cumpleaños'
end if
end event

type pb_ok from picturebutton within w_lista_encargado_cliser
integer x = 2693
integer y = 128
integer width = 178
integer height = 156
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;String	ls_string,ls_rut,ls_ap_pat,ls_fecha
long		ll_row,ll_dia,ll_mes,ll_largo
if rb_por_rut.checked=true then
	ls_string		= 'num_rut A'
	dw_lista.SETSORT(ls_string)
	dw_lista.SORT()
	if trim(em_rut.text)<>'' and long(em_rut.text)>0 then
		ls_rut		= trim(string(long(em_rut.text)))
		ll_largo		= len(ls_rut)
		ls_string	= "mid( string(num_rut),1,"+string(ll_largo)+")='"+ls_rut+"'"
		ll_row 		= dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
		IF ll_row > 0 THEN
			dw_lista.ScrollToRow( ll_row )
			dw_lista.setfocus()
		ELSE
			MessageBox("Advertencia", "Rut Inexistente")
			em_rut.text	= ''
		END IF
	end if
elseif rb_por_ap_pat.checked=true then
	ls_string	= 'nom_patern A, nom_matern A, nom_nombre A'
	dw_lista.SETSORT(ls_string)
	dw_lista.SORT()
	if trim(em_ap_pat.text)<>'' and not isnull(trim(em_ap_pat.text)) then
		ls_ap_pat	= UPPER(trim(em_ap_pat.text))
		ll_largo		= len(ls_ap_pat)
		ls_string	= "mid(UPPER(nom_patern),1,"+string(ll_largo)+")='"+ls_ap_pat+"'"
		ll_row 		= dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
		IF ll_row > 0 THEN
			dw_lista.ScrollToRow( ll_row )
			dw_lista.setfocus()
		ELSE
			MessageBox("Advertencia", "Apellido Paterno Inexistente")
			em_ap_pat.text	= ''
		END IF
	end if
elseif rb_por_fec_nac.checked=true then
	ls_string	= 'fec_nacimt A'
	dw_lista.SETSORT(ls_string)
	dw_lista.SORT()
	if trim(em_fec_nac.text)<>'' then
		ls_fecha		= trim(em_fec_nac.text)
		ll_dia		= long(mid(ls_fecha,1,2))
		ll_mes		= long(mid(ls_fecha,6,2))
		if ll_dia>0 and ll_mes>0 then
			ls_string	= "day(fec_nacimt)="+string(ll_dia)+" and month(fec_nacimt)="+string(ll_mes)
			ll_row 		= dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
			IF ll_row > 0 THEN
				dw_lista.ScrollToRow( ll_row )
				dw_lista.setfocus()
			ELSE
				MessageBox("Advertencia", "Fecha Nacimiento Inexistente")
				em_rut.text	= ''
			END IF
		end if
	end if
end if

end event

type em_fec_nac from editmask within w_lista_encargado_cliser
integer x = 2121
integer y = 192
integer width = 430
integer height = 96
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 33554431
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd / mm"
end type

event modified;if not isnull(trim(this.text)) and trim(this.text)<>'00/00' then pb_ok.triggerevent(clicked!)
end event

type st_3 from statictext within w_lista_encargado_cliser
integer x = 1911
integer y = 208
integer width = 178
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_lista_encargado_cliser
integer x = 773
integer y = 208
integer width = 279
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ap.Paterno"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_ap_pat from editmask within w_lista_encargado_cliser
integer x = 1079
integer y = 192
integer width = 768
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 33554431
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if not isnull(trim(this.text)) and trim(this.text)<>'' then pb_ok.triggerevent(clicked!)
end event

type st_1 from statictext within w_lista_encargado_cliser
integer x = 78
integer y = 208
integer width = 133
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_rut from editmask within w_lista_encargado_cliser
integer x = 229
integer y = 192
integer width = 430
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 33554431
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if long(this.text)>0 then pb_ok.triggerevent(clicked!)
end event

type rb_por_fec_nac from radiobutton within w_lista_encargado_cliser
integer x = 2039
integer y = 108
integer width = 581
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Nacimiento"
end type

event clicked;wf_limpiar()
end event

type rb_por_ap_pat from radiobutton within w_lista_encargado_cliser
integer x = 997
integer y = 108
integer width = 535
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Apellido Paterno"
end type

event clicked;wf_limpiar()
end event

type rb_por_rut from radiobutton within w_lista_encargado_cliser
integer x = 146
integer y = 108
integer width = 361
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut"
end type

event clicked;wf_limpiar()
end event

type cb_1 from commandbutton within w_lista_encargado_cliser
integer x = 41
integer y = 1752
integer width = 265
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
if dw_lista.rowcount() > 0 then
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_lista_encargado_cliser
integer x = 581
integer y = 1752
integer width = 265
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_lista_encargado_cliser
integer x = 311
integer y = 1752
integer width = 265
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_imprimir from commandbutton within w_lista_encargado_cliser
integer x = 1125
integer y = 1752
integer width = 265
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type cb_cerrar from commandbutton within w_lista_encargado_cliser
integer x = 2601
integer y = 1752
integer width = 347
integer height = 96
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_encargado_cliser)
end event

type dw_lista from datawindow within w_lista_encargado_cliser
integer x = 41
integer y = 368
integer width = 2907
integer height = 1336
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_tabla_encargado_cliser"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna
Long		ll_resp
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
ls_columna	= dwo.name
if ls_columna='t_saludos' then
	ll_resp	= MessageBox("Envia Saludos", "Desea Enviar Email de Saludos", Exclamation!, YesNo!, 2)
	if ll_resp=1 then
		open(w_enviar_email_saludos)
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event doubleclicked;String	ls_string
Long		ll_rut
if row>0 then
	ll_rut		= this.getitemnumber(row,'num_rut')
	ls_string	= string(ll_rut)
	if ll_rut>0 then openwithparm(w_cliser_ficha_encargado,ls_string)
end if
end event

type gb_1 from groupbox within w_lista_encargado_cliser
integer x = 41
integer y = 20
integer width = 2907
integer height = 304
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Por"
end type

