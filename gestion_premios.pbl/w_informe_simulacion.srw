forward
global type w_informe_simulacion from window
end type
type pb_exportar from picturebutton within w_informe_simulacion
end type
type pb_ordenar from picturebutton within w_informe_simulacion
end type
type cb_diferencia from commandbutton within w_informe_simulacion
end type
type pb_filtrar from picturebutton within w_informe_simulacion
end type
type pb_imprimir from picturebutton within w_informe_simulacion
end type
type dw_lista from datawindow within w_informe_simulacion
end type
type cb_cerrar from commandbutton within w_informe_simulacion
end type
end forward

global type w_informe_simulacion from window
integer width = 3342
integer height = 2148
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_exportar pb_exportar
pb_ordenar pb_ordenar
cb_diferencia cb_diferencia
pb_filtrar pb_filtrar
pb_imprimir pb_imprimir
dw_lista dw_lista
cb_cerrar cb_cerrar
end type
global w_informe_simulacion w_informe_simulacion

type variables
String	is_filtro=''
end variables

on w_informe_simulacion.create
this.pb_exportar=create pb_exportar
this.pb_ordenar=create pb_ordenar
this.cb_diferencia=create cb_diferencia
this.pb_filtrar=create pb_filtrar
this.pb_imprimir=create pb_imprimir
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.Control[]={this.pb_exportar,&
this.pb_ordenar,&
this.cb_diferencia,&
this.pb_filtrar,&
this.pb_imprimir,&
this.dw_lista,&
this.cb_cerrar}
end on

on w_informe_simulacion.destroy
destroy(this.pb_exportar)
destroy(this.pb_ordenar)
destroy(this.cb_diferencia)
destroy(this.pb_filtrar)
destroy(this.pb_imprimir)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
end on

event open;Long		ll_tot_reg,ll_indi, ll_credito,c_correlativo
Double	ld_pie_porc,c_pie,c_primera,c_segunda,c_tercera,c_cuarta,c_quinta,&
			c_sexta,c_septima,c_octava,c_novena
String	ls_area, ls_tipo_cons, ls_tipo_ctto
gf_centrar(w_informe_simulacion)
gs_ventana	= 'w_informe_simulacion'
f_valida_objeto_1()
dw_lista.settransobject(sqlca)
SetPointer(HourGlass!)
ll_tot_reg	= dw_lista.retrieve()
for ll_indi = 1 to ll_tot_reg
	c_correlativo=0;c_pie=0;c_primera=0;c_segunda=0;c_tercera=0
	c_cuarta=0;c_quinta=0;c_sexta=0
	ls_tipo_ctto	= 'O'
	ls_area			= dw_lista.getitemstring(ll_indi,'pago_oferta_area')
	ls_tipo_cons	= dw_lista.getitemstring(ll_indi,'oferta_v_tipo_cons')
	ll_credito		= dw_lista.getitemnumber(ll_indi,'pago_oferta_nro_cuotas')
	ld_pie_porc		= double(dw_lista.getitemnumber(ll_indi,'porce_pie'))
	if (ls_tipo_ctto='O' or ls_tipo_ctto='L') then
		IF LL_CREDITO=1 THEN ld_pie_porc=100
		if ld_pie_porc < 10 then
			SELECT CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA, 	C_SEPTIMA, C_OCTAVA, C_NOVENA  AS PORCENTAJE  
			INTO :c_correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta, :c_septima,:c_octava,:c_novena
			FROM PORCENTAJE_COMISIONES  
			WHERE ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
					AREA = :ls_area AND T_CONS = :ls_tipo_cons AND ( CREDITO_MIN <= :ll_credito AND CREDITO >= :ll_credito )
					AND ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA ) > 0   ;
		elseif ld_pie_porc >= 10 then
			SELECT CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA,  C_SEPTIMA,  C_OCTAVA,  C_NOVENA  AS PORCENTAJE  
			INTO :c_correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta,	:c_septima, :c_octava, :c_novena 
			FROM PORCENTAJE_COMISIONES  
			WHERE ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
					AREA = :ls_area AND T_CONS = :ls_tipo_cons 
					AND ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA ) > 0   ;
		end if
		if sqlca.sqlcode = 0 then
			dw_lista.setitem(ll_indi,'correlativo',c_correlativo)
			dw_lista.setitem(ll_indi,'c_pie',c_pie)
			dw_lista.setitem(ll_indi,'c_primera',c_primera)
			dw_lista.setitem(ll_indi,'c_segunda',c_segunda)
			dw_lista.setitem(ll_indi,'c_tercera',c_tercera)
			dw_lista.setitem(ll_indi,'c_cuarta',c_cuarta)
			dw_lista.setitem(ll_indi,'c_quinta',c_quinta)
			dw_lista.setitem(ll_indi,'c_sexta',c_sexta)
			dw_lista.setitem(ll_indi,'c_septima',c_septima)
			dw_lista.setitem(ll_indi,'c_octava',c_octava)
			dw_lista.setitem(ll_indi,'c_novena',c_novena)
		else
			dw_lista.setitem(ll_indi,'correlativo',0)
			dw_lista.setitem(ll_indi,'c_pie',0)
			dw_lista.setitem(ll_indi,'c_primera',0)
			dw_lista.setitem(ll_indi,'c_segunda',0)
			dw_lista.setitem(ll_indi,'c_tercera',0)
			dw_lista.setitem(ll_indi,'c_cuarta',0)
			dw_lista.setitem(ll_indi,'c_quinta',0)
			dw_lista.setitem(ll_indi,'c_sexta',0)
			dw_lista.setitem(ll_indi,'c_septima',0)
			dw_lista.setitem(ll_indi,'c_octava',0)
			dw_lista.setitem(ll_indi,'c_novena',0)
		end if
	end if
next
if gs_conexion = "Parque El Prado" then
	dw_lista.object.t_titulo.text 			= 'Parque El Prado'
elseif gs_conexion = "Parque La Foresta" then
	dw_lista.object.t_titulo.text 			= 'Parque La Foresta'
elseif gs_conexion = "Parque Concepción" then
	dw_lista.object.t_titulo.text 			= 'Parque Concepción'
end if
dw_lista.object.t_usuario.text = gs_user
dw_lista.sort()
SetPointer(Arrow!)
end event

type pb_exportar from picturebutton within w_informe_simulacion
event ue_mousemove pbm_mousemove
integer x = 1317
integer y = 1856
integer width = 165
integer height = 148
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_ordenar from picturebutton within w_informe_simulacion
event ue_mousemove pbm_mousemove
integer x = 1486
integer y = 1856
integer width = 165
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_diferencia from commandbutton within w_informe_simulacion
integer x = 41
integer y = 1872
integer width = 334
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Diferencias"
end type

event clicked;if is_filtro = "suma_estado_cuotas=1" then
	is_filtro = "" 
else
	is_filtro	= "suma_estado_cuotas=1"
end if
dw_lista.SetFilter(is_filtro)
dw_lista.Filter( )
dw_lista.sort()
end event

type pb_filtrar from picturebutton within w_informe_simulacion
event ue_mousemove pbm_mousemove
integer x = 1655
integer y = 1856
integer width = 165
integer height = 148
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type pb_imprimir from picturebutton within w_informe_simulacion
event ue_mousemove pbm_mousemove
integer x = 1824
integer y = 1856
integer width = 165
integer height = 148
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false				
end if
end event

type dw_lista from datawindow within w_informe_simulacion
integer x = 41
integer y = 36
integer width = 3246
integer height = 1784
integer taborder = 10
string title = "none"
string dataobject = "dw_informe_simulacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;long	ll_row
ll_row	= this.getrow()
if ll_row > 0 then
	gi_numero 			= dw_lista.getitemnumber(ll_row,'comision_promesa_numero')
	gi_tipo_busqueda 	= 8
	Open(w_listado_contratos)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if

end event

type cb_cerrar from commandbutton within w_informe_simulacion
integer x = 2949
integer y = 1872
integer width = 334
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_simulacion)
end event

