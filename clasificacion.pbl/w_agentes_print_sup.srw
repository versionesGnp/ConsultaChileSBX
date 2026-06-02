forward
global type w_agentes_print_sup from window
end type
type dw_1 from uo_datawindow within w_agentes_print_sup
end type
type p_2 from picture within w_agentes_print_sup
end type
type pb_sigue from picturebutton within w_agentes_print_sup
end type
type p_3 from picture within w_agentes_print_sup
end type
type pb_antes from picturebutton within w_agentes_print_sup
end type
type st_registros from statictext within w_agentes_print_sup
end type
type p_7 from picture within w_agentes_print_sup
end type
type p_8 from picture within w_agentes_print_sup
end type
type cb_2 from commandbutton within w_agentes_print_sup
end type
type cb_1 from commandbutton within w_agentes_print_sup
end type
end forward

global type w_agentes_print_sup from window
integer x = 832
integer y = 360
integer width = 3584
integer height = 2040
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
dw_1 dw_1
p_2 p_2
pb_sigue pb_sigue
p_3 p_3
pb_antes pb_antes
st_registros st_registros
p_7 p_7
p_8 p_8
cb_2 cb_2
cb_1 cb_1
end type
global w_agentes_print_sup w_agentes_print_sup

type variables
datawindow dw_paso
end variables

on w_agentes_print_sup.create
this.dw_1=create dw_1
this.p_2=create p_2
this.pb_sigue=create pb_sigue
this.p_3=create p_3
this.pb_antes=create pb_antes
this.st_registros=create st_registros
this.p_7=create p_7
this.p_8=create p_8
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.p_2,&
this.pb_sigue,&
this.p_3,&
this.pb_antes,&
this.st_registros,&
this.p_7,&
this.p_8,&
this.cb_2,&
this.cb_1}
end on

on w_agentes_print_sup.destroy
destroy(this.dw_1)
destroy(this.p_2)
destroy(this.pb_sigue)
destroy(this.p_3)
destroy(this.pb_antes)
destroy(this.st_registros)
destroy(this.p_7)
destroy(this.p_8)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string ls_cod,canal,moneda,nombre,a_paterno,a_materno,cod_sup
long precio,uf,valor,pag_s,cuotas,ret
integer i
date fech,fecha
datetime prim

this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
title=gs_app_name
ls_cod = Message.StringParm
dw_1.settransobject(sqlca)
fech = date(gd_fecha_inicio)
fecha = date(gd_fecha_fin)
if dw_1.retrieve(fech,fecha,ls_cod) = 0 then
	messagebox(gs_app_name,'No existen datos.',stopsign!)
	close(w_agentes_print_sup)
else
   SELECT NOMBRE,A_PATERNO,A_MATERNO,COD_JEFE into :nombre,:a_paterno,:a_materno,:cod_sup from SUPERVISOR where cod_sup = :ls_cod;
	if isnull(a_materno) then a_materno = ''
	this.title = 'Supervisor Sr(a).: '+nombre+' '+a_paterno+' '+a_materno+' ( N° '+ls_cod+' ).'+'   '+'Código Supervisor :'+cod_sup
	for i = 1 to dw_1.rowcount()
		precio = dw_1.getitemnumber(i,'pago_oferta_precio')
		uf     = dw_1.getitemnumber(i,'pago_oferta_uf_dia')
		pag_s  = dw_1.getitemnumber(i,'oferta_v_cta_pag_s')
		cuotas = dw_1.getitemnumber(i,'pago_oferta_nro_cuotas')		
		moneda = dw_1.getitemstring(i,'pago_oferta_moneda')
//		canal  = dw_1.getitemstring(i,'meta_super_tipo_canal')
		prim   = dw_1.getitemdatetime(i,'pago_oferta_fecha_prim')
		ret = f_mora( prim , pag_s , cuotas ,fecha)
//		dw_1.setitem(i,'mora_1',ret)
		dw_1.setitem(i,'mora',ret)
//		if ret = 0 or ret = 1 then
//			dw_1.setitem(i,'mora',0)
//			dw_1.setitem(i,'porcentaje',0)
//		elseif ret >= 2 then
//			dw_1.setitem(i,'mora',ret)
//			if pag_s >=1 then
//				dw_1.setitem(i,'porcentaje',(ret/(pag_s+ret))*100)
//				dw_1.setitem(i,'porcentaje',(ret*100)/pag_s)		
//			elseif pag_s < 1 then
//				dw_1.setitem(i,'porcentaje',100)		
//			end if
//		end if
//		CHOOSE CASE canal 
//		CASE 'NI'
//			valor  = f_inserta_valor( precio , moneda , uf , canal )
//			dw_1.setitem(i,'uni',valor)
//		CASE 'PV'
//			valor  = f_inserta_valor( precio , moneda , uf , canal )
//			dw_1.setitem(i,'uni',valor)
//		CASE 'VD'
//			valor  = f_inserta_valor( precio , moneda , uf , canal )
//			dw_1.setitem(i,'uni',valor)
//		CASE ELSE
//			dw_1.setitem(i,'uni',0)
//		END CHOOSE
	next
	dw_1.HSplitScroll = true
end if

//dw_1.Object.DataWindow.HorizontalScrollSplit = dw_1.Object.pago_oferta_moneda_t.x
//dw_1.object.datawindow.print.Preview = true
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type dw_1 from uo_datawindow within w_agentes_print_sup
integer x = 32
integer y = 36
integer width = 3497
integer height = 1720
integer taborder = 10
string dataobject = "dw_ofertas_periodo_2_sup_x"
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;MenuHabilitado='1011001'
end event

event doubleclicked;call super::doubleclicked;gs_serie  = getitemstring(row,'oferta_v_serie')
gi_numero = getitemnumber(row,'oferta_v_nro_oferta')
gs_base	 = 'O'
gi_rut    = getitemnumber(row,'oferta_v_rut')
open(w_cuenta_corriente_oferta)
end event

event rowfocuschanged;call super::rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)
end event

type p_2 from picture within w_agentes_print_sup
event clicked pbm_bnclicked
integer x = 1019
integer y = 2020
integer width = 73
integer height = 60
string picturename = "c:antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type pb_sigue from picturebutton within w_agentes_print_sup
event clicked pbm_bnclicked
integer x = 1010
integer y = 2004
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollPriorPage( )
st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type p_3 from picture within w_agentes_print_sup
event clicked pbm_bnclicked
integer x = 1120
integer y = 2020
integer width = 73
integer height = 60
string picturename = "c:sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type pb_antes from picturebutton within w_agentes_print_sup
event clicked pbm_bnclicked
integer x = 1111
integer y = 2004
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollNextPage( ) 
st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type st_registros from statictext within w_agentes_print_sup
integer x = 37
integer y = 2004
integer width = 955
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type p_7 from picture within w_agentes_print_sup
event clicked pbm_bnclicked
integer x = 1015
integer y = 2008
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type p_8 from picture within w_agentes_print_sup
event clicked pbm_bnclicked
integer x = 1120
integer y = 2008
integer width = 73
integer height = 60
string picturename = "c:\desarrollo\comisiones\sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type cb_2 from commandbutton within w_agentes_print_sup
integer x = 3191
integer y = 1800
integer width = 338
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_agentes_print_sup)
end event

type cb_1 from commandbutton within w_agentes_print_sup
integer x = 2848
integer y = 1800
integer width = 338
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount()>0 then
//	dw_1.object.datawindow.print.Preview = true
	f_Print( dw_1 )
//	f_printdlg(dw_1,gstr_print,parent)
//	dw_1.object.datawindow.print.Preview = false	
end if	
end event

