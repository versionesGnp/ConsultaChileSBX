forward
global type w_produccion_por_periodo_bkp from window
end type
type st_mostrar_todo from statictext within w_produccion_por_periodo_bkp
end type
type pb_filtrar from picturebutton within w_produccion_por_periodo_bkp
end type
type pb_ordenar from picturebutton within w_produccion_por_periodo_bkp
end type
type pb_imprimir from picturebutton within w_produccion_por_periodo_bkp
end type
type pb_exportar from picturebutton within w_produccion_por_periodo_bkp
end type
type pb_aceptar from picturebutton within w_produccion_por_periodo_bkp
end type
type st_2 from statictext within w_produccion_por_periodo_bkp
end type
type em_fec_fin from editmask within w_produccion_por_periodo_bkp
end type
type p_fec_fin from picture within w_produccion_por_periodo_bkp
end type
type p_fec_ini from picture within w_produccion_por_periodo_bkp
end type
type em_fec_ini from editmask within w_produccion_por_periodo_bkp
end type
type st_1 from statictext within w_produccion_por_periodo_bkp
end type
type pb_salir from picturebutton within w_produccion_por_periodo_bkp
end type
type dw_lista from datawindow within w_produccion_por_periodo_bkp
end type
end forward

global type w_produccion_por_periodo_bkp from window
integer width = 2935
integer height = 2064
boolean titlebar = true
string title = "Producción de Ventas por Periodo Cierre Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_mostrar_todo st_mostrar_todo
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_aceptar pb_aceptar
st_2 st_2
em_fec_fin em_fec_fin
p_fec_fin p_fec_fin
p_fec_ini p_fec_ini
em_fec_ini em_fec_ini
st_1 st_1
pb_salir pb_salir
dw_lista dw_lista
end type
global w_produccion_por_periodo_bkp w_produccion_por_periodo_bkp

type variables
long	il_row
end variables

on w_produccion_por_periodo_bkp.create
this.st_mostrar_todo=create st_mostrar_todo
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_aceptar=create pb_aceptar
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.p_fec_fin=create p_fec_fin
this.p_fec_ini=create p_fec_ini
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.pb_salir=create pb_salir
this.dw_lista=create dw_lista
this.Control[]={this.st_mostrar_todo,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_aceptar,&
this.st_2,&
this.em_fec_fin,&
this.p_fec_fin,&
this.p_fec_ini,&
this.em_fec_ini,&
this.st_1,&
this.pb_salir,&
this.dw_lista}
end on

on w_produccion_por_periodo_bkp.destroy
destroy(this.st_mostrar_todo)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_aceptar)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.p_fec_fin)
destroy(this.p_fec_ini)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.pb_salir)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_produccion_por_periodo)
em_fec_ini.text		= string(today())
em_fec_fin.text		= string(today())
dw_lista.dataobject	= 'dw_lista_periodos_cierre_venta'
dw_lista.settransobject(sqlca)
if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No registra datos")
end if
end event

type st_mostrar_todo from statictext within w_produccion_por_periodo_bkp
integer x = 27
integer y = 60
integer width = 823
integer height = 108
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 79741120
string text = "Mostrar Todos los Periodos"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;dw_lista.dataobject	= 'dw_lista_periodos_cierre_venta'
dw_lista.settransobject(sqlca)
if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No registra datos")
end if
end event

type pb_filtrar from picturebutton within w_produccion_por_periodo_bkp
event ue_mousemove pbm_mousemove
integer x = 384
integer y = 1772
integer width = 165
integer height = 148
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
alignment htextalign = right!
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type pb_ordenar from picturebutton within w_produccion_por_periodo_bkp
event ue_mousemove pbm_mousemove
integer x = 210
integer y = 1772
integer width = 165
integer height = 148
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
alignment htextalign = right!
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_imprimir from picturebutton within w_produccion_por_periodo_bkp
event ue_mousemove pbm_mousemove
integer x = 558
integer y = 1772
integer width = 165
integer height = 148
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false	
end if
end event

type pb_exportar from picturebutton within w_produccion_por_periodo_bkp
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1772
integer width = 165
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
alignment htextalign = right!
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_aceptar from picturebutton within w_produccion_por_periodo_bkp
integer x = 2688
integer y = 32
integer width = 165
integer height = 148
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;dw_lista.dataobject	= 'dw_lista_periodos_cierre_venta_con_rango'
dw_lista.settransobject(sqlca)
gd_fecha_inicio = datetime(date(em_fec_ini.text),time('00:00:00'))
gd_fecha_fin	 = datetime(date(em_fec_fin.text),time('23:59:59'))


if gd_fecha_inicio <= gd_fecha_fin then
	if dw_lista.retrieve(gd_fecha_inicio,gd_fecha_fin)=0 then
		messagebox("Advertencia","No registra dato")
	end if
else
	messagebox("Advertencia","Rango fecha Incorrecta")
end if
end event

type st_2 from statictext within w_produccion_por_periodo_bkp
integer x = 2002
integer y = 72
integer width = 155
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_produccion_por_periodo_bkp
integer x = 2176
integer y = 60
integer width = 352
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type p_fec_fin from picture within w_produccion_por_periodo_bkp
integer x = 2542
integer y = 64
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type p_fec_ini from picture within w_produccion_por_periodo_bkp
integer x = 1897
integer y = 64
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_produccion_por_periodo_bkp
integer x = 1531
integer y = 60
integer width = 352
integer height = 88
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_1 from statictext within w_produccion_por_periodo_bkp
integer x = 1061
integer y = 72
integer width = 448
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Ingrese Periodo"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_salir from picturebutton within w_produccion_por_periodo_bkp
integer x = 2688
integer y = 1772
integer width = 165
integer height = 148
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_produccion_por_periodo)
end event

type dw_lista from datawindow within w_produccion_por_periodo_bkp
integer x = 37
integer y = 212
integer width = 2816
integer height = 1524
boolean bringtotop = true
string dataobject = "dw_lista_periodos_cierre_venta"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long	ll_estado
if row>0 then
	ll_estado	= this.getitemnumber(row,'estado')
	this.accepttext()
	if ll_estado = 0 or isnull(ll_estado) then
		this.setitem(row,'estado',1)
		This.SelectRow(row, TRUE)
	else
		this.setitem(row,'estado',0)
		This.SelectRow(row, FALSE)
	end if
end if
end event

event rowfocuschanged;//if this.getrow()>0 then
//	This.SelectRow(0, FALSE)
//	This.SelectRow(this.getrow(), TRUE)
//end if
end event

event doubleclicked;String	ls_string
Long		ll_mes, ll_year, ll_mes_buscar, ll_year_buscar
Date		ld_fec_cierre, ld_fec_cierre_ini  
Datetime	ldt_fecpaso
il_row	= this.getrow()
if il_row > 0 then
	ll_mes			= dw_lista.getitemnumber(il_row,'periodo')
	ll_year			= dw_lista.getitemnumber(il_row,'anno')
	ld_fec_cierre	= date(dw_lista.getitemdatetime(il_row,'cierre_venta'))
	ll_mes_buscar	= ll_mes
	ll_year_buscar	= ll_year
	if ll_mes_buscar = 1 then
		ll_mes_buscar	= 12
		ll_year_buscar	= ll_year_buscar - 1
	else
		ll_mes_buscar	= ll_mes_buscar - 1
	end if 
	if ll_mes_buscar > 0 and ll_year_buscar > 0 then
		SELECT 	"CIERRE_VENTA"."CIERRE_VENTA"  
		INTO 		:ldt_fecpaso
		FROM 		"CIERRE_VENTA"  
		WHERE 	( "CIERRE_VENTA"."PERIODO" = :ll_mes_buscar ) AND  
					( "CIERRE_VENTA"."ANNO" = :ll_year_buscar )   
		USING		sqlca ;
		if sqlca.sqlcode = 0 then
			ld_fec_cierre_ini	= date(ldt_fecpaso)
			ld_fec_cierre_ini	= RelativeDate(ld_fec_cierre_ini, 1)
			ls_string	= string(ld_fec_cierre_ini,'dd/mm/yyyy')+'~t'+string(ld_fec_cierre,'dd/mm/yyyy')+'~t'+string(ll_mes)+'~t'+string(ll_year)+'~t'+string(ld_fec_cierre)
		else
			ls_string	= trim(em_fec_ini.text)+'~t'+trim(em_fec_fin.text)+'~t'+string(ll_mes)+'~t'+string(ll_year)+'~t'+string(ld_fec_cierre)
		end if
	else
		ls_string		= trim(em_fec_ini.text)+'~t'+trim(em_fec_fin.text)+'~t'+string(ll_mes)+'~t'+string(ll_year)+'~t'+string(ld_fec_cierre)
	end if
	OpenWithParm(w_detalle_periodo_cierre_de_venta, ls_string)
end if
end event

