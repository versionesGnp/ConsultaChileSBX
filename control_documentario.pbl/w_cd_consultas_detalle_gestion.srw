forward
global type w_cd_consultas_detalle_gestion from window
end type
type cb_print_execion from commandbutton within w_cd_consultas_detalle_gestion
end type
type st_lista from statictext within w_cd_consultas_detalle_gestion
end type
type dw_estado from datawindow within w_cd_consultas_detalle_gestion
end type
type st_4 from statictext within w_cd_consultas_detalle_gestion
end type
type cb_filtrar from commandbutton within w_cd_consultas_detalle_gestion
end type
type cb_sort from commandbutton within w_cd_consultas_detalle_gestion
end type
type cb_exportar from commandbutton within w_cd_consultas_detalle_gestion
end type
type cb_imprimir from commandbutton within w_cd_consultas_detalle_gestion
end type
type dw_lista from datawindow within w_cd_consultas_detalle_gestion
end type
type cb_cerrar from commandbutton within w_cd_consultas_detalle_gestion
end type
type dw_detalle from datawindow within w_cd_consultas_detalle_gestion
end type
type p_sin_detalle from picture within w_cd_consultas_detalle_gestion
end type
end forward

global type w_cd_consultas_detalle_gestion from window
integer width = 3502
integer height = 2156
boolean titlebar = true
string title = "Detalle Gestión Documentación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_print_execion cb_print_execion
st_lista st_lista
dw_estado dw_estado
st_4 st_4
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
dw_lista dw_lista
cb_cerrar cb_cerrar
dw_detalle dw_detalle
p_sin_detalle p_sin_detalle
end type
global w_cd_consultas_detalle_gestion w_cd_consultas_detalle_gestion

type variables
String	is_base,is_serie
Long		il_row
Double	il_numero
end variables

on w_cd_consultas_detalle_gestion.create
this.cb_print_execion=create cb_print_execion
this.st_lista=create st_lista
this.dw_estado=create dw_estado
this.st_4=create st_4
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.p_sin_detalle=create p_sin_detalle
this.Control[]={this.cb_print_execion,&
this.st_lista,&
this.dw_estado,&
this.st_4,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.dw_lista,&
this.cb_cerrar,&
this.dw_detalle,&
this.p_sin_detalle}
end on

on w_cd_consultas_detalle_gestion.destroy
destroy(this.cb_print_execion)
destroy(this.st_lista)
destroy(this.dw_estado)
destroy(this.st_4)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
destroy(this.p_sin_detalle)
end on

event open;w_cd_consultas_detalle_gestion.width	= 2857
gf_centrar(w_cd_consultas_detalle_gestion)
is_base											= trim(substr(1,1,Message.StringParm))
is_serie											= trim(substr(1,2,Message.StringParm))
il_numero										= Double(trim(substr(1,3,Message.StringParm)))
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_estado.settransobject(sqlca)
dw_estado.retrieve()
p_sin_detalle.visible						= false
if dw_lista.retrieve(is_base,is_serie,il_numero)=0 then
	p_sin_detalle.visible					= true
	messagebox("Advertencia","No Registra Movimientos Folio Nº "+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###"))
	close(w_cd_consultas_detalle_gestion)
else
	dw_lista.accepttext()
end if

end event

type cb_print_execion from commandbutton within w_cd_consultas_detalle_gestion
integer x = 1833
integer y = 1936
integer width = 462
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "I&mprimir Excepción"
end type

event clicked;Long		ll_estado_ant
string	ls_ref,ls_string,ls_memo
Datetime	ldt_fecha_crea
if dw_detalle.getitemnumber(1,'tipo_excepcion') > 0 then
	ls_ref			= dw_detalle.getitemstring(1,'referencia_memo')
	ls_memo			= dw_detalle.getitemstring(1,'memo')
	ldt_fecha_crea	= dw_detalle.getitemdatetime(1,'fecha_crea')
	ll_estado_ant	= dw_detalle.getitemnumber(1,'estado_asociado_excepcion')
	ls_string		= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+ls_ref+'~t'+string(ldt_fecha_crea)+'~t'+'M'+'~t'+ls_memo+'~t'+string(ll_estado_ant)
	OpenWithParm(w_ingreso_detalle_excepciones, ls_string)
end if
end event

type st_lista from statictext within w_cd_consultas_detalle_gestion
integer x = 50
integer y = 1924
integer width = 334
integer height = 128
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar Lista Estado"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;String	ls_string

if st_lista.text='Mostrar Lista Estado' then
	w_cd_consultas_detalle_gestion.width	= 3502
	st_lista.text					= 'NO Mostrar Lista Estado'
elseif st_lista.text='NO Mostrar Lista Estado' then
	w_cd_consultas_detalle_gestion.width	= 2857
	st_lista.text					= 'Mostrar Lista Estado'
	ls_string						= ''
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
end if
gf_centrar(w_cd_consultas_detalle_gestion)
end event

type dw_estado from datawindow within w_cd_consultas_detalle_gestion
integer x = 2871
integer y = 116
integer width = 576
integer height = 1908
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_estados_cd"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if

end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if

end event

type st_4 from statictext within w_cd_consultas_detalle_gestion
integer x = 2880
integer y = 32
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Estado"
boolean focusrectangle = false
end type

type cb_filtrar from commandbutton within w_cd_consultas_detalle_gestion
integer x = 2565
integer y = 680
integer width = 233
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_sort from commandbutton within w_cd_consultas_detalle_gestion
integer x = 2327
integer y = 680
integer width = 233
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_cd_consultas_detalle_gestion
integer x = 2089
integer y = 680
integer width = 233
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_cd_consultas_detalle_gestion
integer x = 1806
integer y = 680
integer width = 233
integer height = 84
integer taborder = 20
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
	dw_detalle.print()
end if

end event

type dw_lista from datawindow within w_cd_consultas_detalle_gestion
event ue_mousemove pbm_dwnmousemove
integer x = 41
integer y = 36
integer width = 2761
integer height = 608
integer taborder = 10
string title = "none"
string dataobject = "dw_consulta_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_estado,ll_excepcion
Datetime	ld_fecha_crea,ld_fecha_estado
if row>0 then
	il_row				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_estado			= this.getitemnumber(il_row,'estado')
	ld_fecha_estado	= this.getitemdatetime(il_row,'fecha_estado')
	ld_fecha_crea		= this.getitemdatetime(il_row,'fecha_crea')
	if dw_detalle.retrieve(is_base,is_serie,il_numero,ll_estado,ld_fecha_crea,ld_fecha_estado)=0 then 
		p_sin_detalle.visible	= true
	else
		ll_excepcion	= dw_detalle.getitemnumber(1,'tipo_excepcion')
		if ll_excepcion>0 then
			cb_print_execion.visible	= true
		else
			cb_print_execion.visible	= false
		end if
	END IF
end if
end event

event rowfocuschanged;Long		ll_estado,ll_excepcion
Datetime	ld_fecha_crea,ld_fecha_estado
if this.getrow()>0 then
	il_row				= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_estado			= this.getitemnumber(il_row,'estado')
	ld_fecha_estado	= this.getitemdatetime(il_row,'fecha_estado')
	ld_fecha_crea		= this.getitemdatetime(il_row,'fecha_crea')
	if dw_detalle.retrieve(is_base,is_serie,il_numero,ll_estado,ld_fecha_crea,ld_fecha_estado)=0 then 
		p_sin_detalle.visible	= true
	else
		ll_excepcion	= dw_detalle.getitemnumber(1,'tipo_excepcion')
		if ll_excepcion>0 then
			cb_print_execion.visible	= true
		else
			cb_print_execion.visible	= false
		end if
	END IF
end if
end event

type cb_cerrar from commandbutton within w_cd_consultas_detalle_gestion
event ue_mousemove pbm_mousemove
integer x = 2491
integer y = 1936
integer width = 306
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_consultas_detalle_gestion)
end event

type dw_detalle from datawindow within w_cd_consultas_detalle_gestion
event ue_mousemove pbm_dwnmousemove
integer x = 37
integer y = 708
integer width = 2779
integer height = 1212
integer taborder = 60
string dataobject = "dw_consulta_detalle_por_contrato"
boolean border = false
boolean livescroll = true
end type

event doubleclicked;Long		ll_estado_ant
string	ls_columna,ls_ref,ls_string,ls_memo
Datetime	ldt_fecha_crea
ls_columna					= dwo.name
if ls_columna='t_12' or ls_columna='t_13' or ls_columna='t_14' or ls_columna='t_15' or ls_columna='tipo_excepcion' or ls_columna='estado_asociado_excepcion' then
	if dw_detalle.getitemnumber(1,'tipo_excepcion') > 0 then
		ls_ref					= dw_detalle.getitemstring(1,'referencia_memo')
		ls_memo				= dw_detalle.getitemstring(1,'memo')
		ldt_fecha_crea		= dw_detalle.getitemdatetime(1,'fecha_crea')
		ll_estado_ant		= dw_detalle.getitemnumber(1,'estado_asociado_excepcion')
		ls_string				= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+ls_ref+'~t'+string(ldt_fecha_crea)+'~t'+'M'+'~t'+ls_memo+'~t'+string(ll_estado_ant)
		OpenWithParm(w_ingreso_detalle_excepciones, ls_string)
	end if
elseif ls_columna='t_10' or ls_columna='tipo_rechazo' or ls_columna='estado_t' or ls_columna='estado' then
	if dw_detalle.getitemnumber(1,'tipo_rechazo') > 0 then
		ls_memo				= dw_detalle.getitemstring(1,'glosa')
		ldt_fecha_crea		= dw_detalle.getitemdatetime(1,'fecha_crea')
		ls_string				= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(ldt_fecha_crea,"dd/mm/yyyy hh:mm:ss")+'~t'+'M'+'~t'+ls_memo
		OpenWithParm(w_ingreso_detalle_rechazo, ls_string)
	end if
end if
end event

type p_sin_detalle from picture within w_cd_consultas_detalle_gestion
integer x = 41
integer y = 792
integer width = 2761
integer height = 1104
string picturename = "sin_detalle.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

