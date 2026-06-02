forward
global type w_imprime_saldo_liberadores from window
end type
type dw_1 from uo_datawindow within w_imprime_saldo_liberadores
end type
type cb_3 from commandbutton within w_imprime_saldo_liberadores
end type
type p_9 from picture within w_imprime_saldo_liberadores
end type
type p_8 from picture within w_imprime_saldo_liberadores
end type
type p_7 from picture within w_imprime_saldo_liberadores
end type
type p_6 from picture within w_imprime_saldo_liberadores
end type
type pb_fin from picturebutton within w_imprime_saldo_liberadores
end type
type p_4 from picture within w_imprime_saldo_liberadores
end type
type pb_antes from picturebutton within w_imprime_saldo_liberadores
end type
type p_3 from picture within w_imprime_saldo_liberadores
end type
type pb_sigue from picturebutton within w_imprime_saldo_liberadores
end type
type p_2 from picture within w_imprime_saldo_liberadores
end type
type pb_primer from picturebutton within w_imprime_saldo_liberadores
end type
type p_1 from picture within w_imprime_saldo_liberadores
end type
type cbx_1 from checkbox within w_imprime_saldo_liberadores
end type
type cb_2 from commandbutton within w_imprime_saldo_liberadores
end type
type cb_1 from commandbutton within w_imprime_saldo_liberadores
end type
type gb_1 from groupbox within w_imprime_saldo_liberadores
end type
end forward

global type w_imprime_saldo_liberadores from window
integer x = 5
integer y = 4
integer width = 3666
integer height = 2400
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_1 dw_1
cb_3 cb_3
p_9 p_9
p_8 p_8
p_7 p_7
p_6 p_6
pb_fin pb_fin
p_4 p_4
pb_antes pb_antes
p_3 p_3
pb_sigue pb_sigue
p_2 p_2
pb_primer pb_primer
p_1 p_1
cbx_1 cbx_1
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_imprime_saldo_liberadores w_imprime_saldo_liberadores

type variables
datawindow dw_paso
end variables

forward prototypes
public subroutine wf_formato (integer moneda)
end prototypes

public subroutine wf_formato (integer moneda);dw_1.Object.saldo_total.Format    = '###,###,###,##0'
dw_1.Object.saldo_cp.Format       = '###,###,###,##0'
dw_1.Object.saldo_lp.Format       = '###,###,###,##0'
dw_1.Object.capital.Format        = '###,###,###,##0'
dw_1.Object.capital_cp.Format     = '###,###,###,##0'
dw_1.Object.capital_cp.Format     = '###,###,###,##0'
dw_1.Object.interes.Format        = '###,###,###,##0'
dw_1.Object.interes_cp.Format     = '###,###,###,##0'
dw_1.Object.interes_lp.Format     = '###,###,###,##0'
dw_1.Object.gc.Format             = '###,###,###,##0'
dw_1.Object.gc_cp.Format          = '###,###,###,##0'
dw_1.Object.gc_lp.Format          = '###,###,###,##0'
dw_1.Object.mora.Format           = '###,###,###,##0'
dw_1.Object.numero.Format         = '###,###,###,##0'
dw_1.Object.pie.Format 			    = '###,###,###,##0'
dw_1.Object.valor_cta.Format      = '###,###,###,##0'
dw_1.Object.facturado.Format      = '###,###,###,##0'

dw_1.Object.s_mora.Format         = '###,###,###,##0'
dw_1.Object.s_saldo_total.Format  = '###,###,###,##0'
dw_1.Object.s_saldo_12.Format     = '###,###,###,##0'
dw_1.Object.s_saldo_12_mas.Format = '###,###,###,##0'
dw_1.Object.s_k.Format            = '###,###,###,##0'
dw_1.Object.s_kcp.Format          = '###,###,###,##0'
dw_1.Object.s_klp.Format          = '###,###,###,##0'
dw_1.Object.s_i.Format            = '###,###,###,##0'
dw_1.Object.s_icp.Format          = '###,###,###,##0'
dw_1.Object.s_ilp.Format          = '###,###,###,##0'
dw_1.Object.s_gc.Format           = '###,###,###,##0'
dw_1.Object.s_gccp.Format         = '###,###,###,##0'
dw_1.Object.s_gclp.Format         = '###,###,###,##0'
dw_1.Object.s_ctas_pag.Format     = '###,###,###,##0'
dw_1.Object.s_plazo.Format        = '###,###,###,##0'
dw_1.Object.s_monto_mora.Format   = '###,###,###,##0'
dw_1.Object.s_numero.Format       = '###,###,###,##0'
dw_1.Object.s_pie.Format 			 = '###,###,###,##0'
dw_1.Object.s_valor_cta.Format    = '###,###,###,##0'
dw_1.Object.s_facturado.Format    = '###,###,###,##0'
end subroutine

event open;long   i
string moneda
date   fecha

this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name
fecha = date(Message.StringParm)
dw_1.settransobject(sqlca)
if dw_1.retrieve(fecha) > 0 then
	dw_1.object.datawindow.print.Preview = true
	dw_1.SetFilter("moneda = '1'")
	dw_1.Filter()
	dw_1.Setsort("serie A,numero A")
	dw_1.sort()
	dw_1.object.titulo.text = gs_empresa
	dw_1.object.tipo_moneda.text = 'Liberadores en Pesos ( $ )'
	cbx_1.text = 'Ofertas en Pesos ( $ )'
	wf_formato(1)
else
	messagebox(gs_app_name,'No Existen Saldos de Liberadores procesados,',stopsign!)
	close(w_imprime_saldo_liberadores)
end if	
end event

on w_imprime_saldo_liberadores.create
this.dw_1=create dw_1
this.cb_3=create cb_3
this.p_9=create p_9
this.p_8=create p_8
this.p_7=create p_7
this.p_6=create p_6
this.pb_fin=create pb_fin
this.p_4=create p_4
this.pb_antes=create pb_antes
this.p_3=create p_3
this.pb_sigue=create pb_sigue
this.p_2=create p_2
this.pb_primer=create pb_primer
this.p_1=create p_1
this.cbx_1=create cbx_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.cb_3,&
this.p_9,&
this.p_8,&
this.p_7,&
this.p_6,&
this.pb_fin,&
this.p_4,&
this.pb_antes,&
this.p_3,&
this.pb_sigue,&
this.p_2,&
this.pb_primer,&
this.p_1,&
this.cbx_1,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_imprime_saldo_liberadores.destroy
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.p_9)
destroy(this.p_8)
destroy(this.p_7)
destroy(this.p_6)
destroy(this.pb_fin)
destroy(this.p_4)
destroy(this.pb_antes)
destroy(this.p_3)
destroy(this.pb_sigue)
destroy(this.p_2)
destroy(this.pb_primer)
destroy(this.p_1)
destroy(this.cbx_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

type dw_1 from uo_datawindow within w_imprime_saldo_liberadores
integer x = 37
integer y = 24
integer width = 3557
integer height = 2136
string dataobject = "dw_oferta_saldo_liberadores"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;sql_original = this.GetSqlSelect()
MenuHabilitado = "1111101"
end event

event rowfocuschanged;call super::rowfocuschanged;//SelectRow(0, FALSE)
//SelectRow(getrow(), TRUE)
end event

type cb_3 from commandbutton within w_imprime_saldo_liberadores
integer x = 2885
integer y = 2188
integer width = 352
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Resumen"
end type

event clicked;dw_1.SetFilter("moneda = '2' or moneda = '1'")
dw_1.Filter()
dw_1.object.tipo_moneda.text = 'Ofertas en U.F. y Pesos'
OpenWithParm(w_resumen_saldo_liberadores_11, Message.StringParm)
if cbx_1.checked = true then
	cbx_1.text = 'Ofertas en Pesos ( $ )'
	dw_1.SetFilter("moneda = '1'")
	dw_1.Filter()
	dw_1.object.tipo_moneda.text = 'Liberadores en Pesos ( $ )'
	dw_1.Setsort("serie A,numero A")
else
	cbx_1.text = 'Liberadores en Unidades de Fomento ( U.F. )'
	dw_1.SetFilter("moneda = '2'")
	dw_1.Filter()
	dw_1.object.tipo_moneda.text = 'Liberadores en Unidades de Fomento ( U.F. )'
end if
dw_1.Setsort("serie A,numero A")
dw_1.sort()
wf_formato(1)
end event

type p_9 from picture within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1929
integer y = 2212
integer width = 73
integer height = 60
string picturename = "C:\Desarrollo\Chile\Consulta12\fin.bmp"
boolean focusrectangle = false
end type

event clicked;pb_fin.TriggerEvent(clicked!)
end event

type p_8 from picture within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1824
integer y = 2212
integer width = 73
integer height = 60
string picturename = "C:\Desarrollo\Chile\Consulta12\sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type p_7 from picture within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1723
integer y = 2212
integer width = 73
integer height = 60
string picturename = "C:\Desarrollo\Chile\Consulta12\antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type p_6 from picture within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1623
integer y = 2212
integer width = 73
integer height = 60
string picturename = "C:\Desarrollo\Chile\Consulta12\primer.bmp"
boolean focusrectangle = false
end type

event clicked;pb_primer.TriggerEvent(clicked!)
end event

type pb_fin from picturebutton within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1915
integer y = 2196
integer width = 96
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollToRow(dw_1.rowcount() ) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type p_4 from picture within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1925
integer y = 2212
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\fin.bmp"
boolean focusrectangle = false
end type

event clicked;pb_fin.TriggerEvent(clicked!)
end event

type pb_antes from picturebutton within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1815
integer y = 2196
integer width = 96
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollNextPage( ) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type p_3 from picture within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1824
integer y = 2212
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type pb_sigue from picturebutton within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1714
integer y = 2196
integer width = 96
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollPriorPage( )
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type p_2 from picture within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1728
integer y = 2212
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type pb_primer from picturebutton within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1614
integer y = 2196
integer width = 96
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollToRow(1) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type p_1 from picture within w_imprime_saldo_liberadores
event clicked pbm_bnclicked
integer x = 1623
integer y = 2212
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\primer.bmp"
boolean focusrectangle = false
end type

event clicked;pb_primer.TriggerEvent(clicked!)
end event

type cbx_1 from checkbox within w_imprime_saldo_liberadores
integer x = 55
integer y = 2204
integer width = 1527
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Liberadores en Unidades de Fomento ( U.F. )"
boolean checked = true
end type

event clicked;string moneda

if this.checked = true then
	this.text = 'Liberadores en Pesos ( $ )'
	dw_1.SetFilter("moneda = '1'")
	dw_1.Filter()
	dw_1.object.tipo_moneda.text = 'Liberadores en Pesos ( $ )'
	dw_1.Setsort("serie A,numero A")
else
	this.text = 'Liberadores en Unidades de Fomento ( U.F. )'
	dw_1.SetFilter("moneda = '2'")
	dw_1.Filter()
	dw_1.object.tipo_moneda.text = 'Liberadores en Unidades de Fomento ( U.F. )'
end if
dw_1.Setsort("serie A,numero A")
dw_1.sort()
wf_formato(1)
end event

type cb_2 from commandbutton within w_imprime_saldo_liberadores
integer x = 2523
integer y = 2188
integer width = 352
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type cb_1 from commandbutton within w_imprime_saldo_liberadores
integer x = 3246
integer y = 2188
integer width = 352
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_imprime_saldo_liberadores)
end event

type gb_1 from groupbox within w_imprime_saldo_liberadores
integer x = 37
integer y = 2156
integer width = 1568
integer height = 136
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

