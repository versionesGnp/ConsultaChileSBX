forward
global type w_reportes_licencias_medicas from window
end type
type dw_exportar from datawindow within w_reportes_licencias_medicas
end type
type cb_tempo from commandbutton within w_reportes_licencias_medicas
end type
type p_fec_fin from picture within w_reportes_licencias_medicas
end type
type p_fec_ini from picture within w_reportes_licencias_medicas
end type
type em_dias_fin from editmask within w_reportes_licencias_medicas
end type
type st_4 from statictext within w_reportes_licencias_medicas
end type
type pb_print from picturebutton within w_reportes_licencias_medicas
end type
type pb_filtrar from picturebutton within w_reportes_licencias_medicas
end type
type pb_ordenar from picturebutton within w_reportes_licencias_medicas
end type
type pb_exportar from picturebutton within w_reportes_licencias_medicas
end type
type pb_aceptar from picturebutton within w_reportes_licencias_medicas
end type
type em_hasta from editmask within w_reportes_licencias_medicas
end type
type st_3 from statictext within w_reportes_licencias_medicas
end type
type em_desde from editmask within w_reportes_licencias_medicas
end type
type st_2 from statictext within w_reportes_licencias_medicas
end type
type em_codigo from editmask within w_reportes_licencias_medicas
end type
type st_1 from statictext within w_reportes_licencias_medicas
end type
type pb_cerrar from picturebutton within w_reportes_licencias_medicas
end type
type dw_lista from datawindow within w_reportes_licencias_medicas
end type
type dw_lista_empleado from datawindow within w_reportes_licencias_medicas
end type
type em_rut from editmask within w_reportes_licencias_medicas
end type
end forward

global type w_reportes_licencias_medicas from window
integer width = 3438
integer height = 2352
boolean titlebar = true
string title = "Detalle Licencias Médicas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_exportar dw_exportar
cb_tempo cb_tempo
p_fec_fin p_fec_fin
p_fec_ini p_fec_ini
em_dias_fin em_dias_fin
st_4 st_4
pb_print pb_print
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_exportar pb_exportar
pb_aceptar pb_aceptar
em_hasta em_hasta
st_3 st_3
em_desde em_desde
st_2 st_2
em_codigo em_codigo
st_1 st_1
pb_cerrar pb_cerrar
dw_lista dw_lista
dw_lista_empleado dw_lista_empleado
em_rut em_rut
end type
global w_reportes_licencias_medicas w_reportes_licencias_medicas

type variables
string		is_opcion
datawindow	dw_paso
end variables

forward prototypes
public subroutine wf_llenar_titulo ()
end prototypes

public subroutine wf_llenar_titulo ();if gs_conexion="Parque El Prado" then
	dw_lista.object.t_titulo.text = 'Parque El Prado'
elseif gs_conexion="Parque La Foresta" then
	dw_lista.object.t_titulo.text = 'Parque La Foresta'
elseif gs_conexion="Parque Concepción" then
	dw_lista.object.t_titulo.text = 'Parque Concepción'
end if
end subroutine

on w_reportes_licencias_medicas.create
this.dw_exportar=create dw_exportar
this.cb_tempo=create cb_tempo
this.p_fec_fin=create p_fec_fin
this.p_fec_ini=create p_fec_ini
this.em_dias_fin=create em_dias_fin
this.st_4=create st_4
this.pb_print=create pb_print
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_exportar=create pb_exportar
this.pb_aceptar=create pb_aceptar
this.em_hasta=create em_hasta
this.st_3=create st_3
this.em_desde=create em_desde
this.st_2=create st_2
this.em_codigo=create em_codigo
this.st_1=create st_1
this.pb_cerrar=create pb_cerrar
this.dw_lista=create dw_lista
this.dw_lista_empleado=create dw_lista_empleado
this.em_rut=create em_rut
this.Control[]={this.dw_exportar,&
this.cb_tempo,&
this.p_fec_fin,&
this.p_fec_ini,&
this.em_dias_fin,&
this.st_4,&
this.pb_print,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_exportar,&
this.pb_aceptar,&
this.em_hasta,&
this.st_3,&
this.em_desde,&
this.st_2,&
this.em_codigo,&
this.st_1,&
this.pb_cerrar,&
this.dw_lista,&
this.dw_lista_empleado,&
this.em_rut}
end on

on w_reportes_licencias_medicas.destroy
destroy(this.dw_exportar)
destroy(this.cb_tempo)
destroy(this.p_fec_fin)
destroy(this.p_fec_ini)
destroy(this.em_dias_fin)
destroy(this.st_4)
destroy(this.pb_print)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_exportar)
destroy(this.pb_aceptar)
destroy(this.em_hasta)
destroy(this.st_3)
destroy(this.em_desde)
destroy(this.st_2)
destroy(this.em_codigo)
destroy(this.st_1)
destroy(this.pb_cerrar)
destroy(this.dw_lista)
destroy(this.dw_lista_empleado)
destroy(this.em_rut)
end on

event open;long	ll_new
gf_centrar(w_reportes_licencias_medicas)
is_opcion											= message.stringparm
dw_exportar.settransobject(sqlca)
em_rut.text										= ''
em_codigo.text									= ''
em_desde.text									= string(today(),'dd/mm/yyyy')
em_hasta.text									= string(today(),'dd/mm/yyyy')
cb_tempo.enabled								= false
CHOOSE CASE is_opcion
	CASE '1'
		st_1.text									= 'Código Jefe'
		dw_lista_empleado.visible			= true
		dw_lista_empleado.dataobject		= 'dwe_lista_codigo_jefes'
		dw_lista_empleado.settransobject(sqlca)
		em_rut.visible							= false
		em_codigo.visible						= false
		st_4.visible								= false
		em_dias_fin.visible					= false
		dw_lista.dataobject					= 'dw_print_por_empleado_del_jefe'
		this.title									= 'Informe Licencias Médicas de Empleados por Jefe Venta'
		ll_new									= dw_lista_empleado.insertrow(0)
		dw_lista_empleado.scrolltorow(ll_new)
		dw_lista_empleado.setfocus()
		dw_lista_empleado.setcolumn('codigo_jefe')
	CASE '2'
		st_1.text									= 'Código Empleado'
		dw_lista_empleado.visible			= true
		dw_lista_empleado.dataobject		= 'dwe_por_empleado'
		dw_lista_empleado.settransobject(sqlca)
		em_rut.visible							= false
		em_codigo.visible						= false
		st_4.visible								= false
		em_dias_fin.visible					= false
		dw_lista.dataobject					= 'dw_print_por_empleado'
		this.title									= 'Informe Licencias Médicas por Empleados'
		ll_new									= dw_lista_empleado.insertrow(0)
		dw_lista_empleado.scrolltorow(ll_new)
		dw_lista_empleado.setfocus()
		dw_lista_empleado.setcolumn('codigo_empleado')
	CASE '3'
		st_1.text									= 'Rut Médico'
		dw_lista.dataobject					= 'dw_print_por_medico'
		dw_lista_empleado.dataobject		= 'dwe_medicos'
		dw_lista_empleado.settransobject(sqlca)
		em_rut.visible							= false
		em_codigo.visible						= false
		st_4.visible								= false
		em_dias_fin.visible					= false
		dw_lista_empleado.visible			= true
		this.title									= 'Informe Licencias Médicas por Médico'
		ll_new									= dw_lista_empleado.insertrow(0)
		dw_lista_empleado.scrolltorow(ll_new)
		dw_lista_empleado.setfocus()
		dw_lista_empleado.setcolumn('rut_medico')
	CASE '4'
		st_1.text									= 'Rango Día'
		dw_lista.dataobject					= 'dw_print_por_licencias_nro_dias_tomados'
		dw_lista_empleado.visible			= false
		st_4.visible								= true
		em_dias_fin.visible					= true
		em_rut.visible							= true
		em_codigo.visible						= false
		this.title									= 'Informe Licencias Médicas por Cantidad de días tomados'
		em_rut.setfocus()
	CASE '5'
		cb_tempo.enabled						= true
		st_1.visible								= false
		dw_lista.dataobject					= 'dw_print_por_licencias_fecha'
		dw_lista_empleado.visible			= false
		st_4.visible								= false
		em_dias_fin.visible					= false
		em_rut.visible							= false
		em_codigo.visible						= false
		this.title									= 'Informe Licencias Médicas por Rango de Fecha'
		em_desde.setfocus()
END CHOOSE
dw_lista.settransobject(sqlca)
end event

type dw_exportar from datawindow within w_reportes_licencias_medicas
boolean visible = false
integer x = 1115
integer y = 2096
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_exportar_licencias_linea"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_tempo from commandbutton within w_reportes_licencias_medicas
integer x = 1650
integer y = 2020
integer width = 690
integer height = 148
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar Archivo Tempo"
end type

event clicked;long		ll_tot_reg,ll_indi,ll_rut,ll_dia,ll_mes,ll_ano,ll_new,ll_largo,ll_resto
string	ls_exp_tempo,ls_rut,ls_dia_ini,ls_mes_ini,ls_ano_ini,ls_dia_fin,ls_mes_fin,ls_ano_fin,&
			ls_tipo_anotacion, ls_codigo_horario,ls_operacion,ls_filtro,ls_linea
date		ld_fecha_ini,ld_fecha_fin

ls_filtro	= "exportado_tempo = '"+'N'+"'"
dw_lista.SetFilter(ls_filtro)
dw_lista.Filter()
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_exp_tempo		= dw_lista.getitemstring(ll_indi,'exportado_tempo')
		if ls_exp_tempo='N' then
			ld_fecha_ini		= date(dw_lista.getitemdatetime(ll_indi,'fecha_inicio_licencia'))
			ld_fecha_fin		= date(dw_lista.getitemdatetime(ll_indi,'fecha_fin_licencia'))
			ll_rut				= dw_lista.getitemnumber(ll_indi,'rut_empleado')
			ll_largo				= len(string(ll_rut))
			ll_resto				= 20 - ll_largo
			if ll_resto>0 then
				ls_rut			= Fill(" ", ll_resto)+string(ll_rut)
			else
				ls_rut			= string(ll_rut)
			end if
			ll_dia				= day(ld_fecha_ini)
			ll_mes				= month(ld_fecha_ini)
			ll_ano				= year(ld_fecha_ini)
			if len(string(ll_dia)) = 1 then 
				ls_dia_ini		= '0'+string(ll_dia)
			else
				ls_dia_ini		= string(ll_dia)
			end if
			if len(string(ll_mes)) = 1 then 
				ls_mes_ini		= '0'+string(ll_mes)
			else
				ls_mes_ini		= string(ll_mes)
			end if
			ls_ano_ini			= mid(string(ll_ano),3,2)
			
			ll_dia				= day(ld_fecha_fin)
			ll_mes				= month(ld_fecha_fin)
			ll_ano				= year(ld_fecha_fin)
			if len(string(ll_dia)) = 1 then 
				ls_dia_fin		= '0'+string(ll_dia)
			else
				ls_dia_fin		= string(ll_dia)
			end if
			if len(string(ll_mes)) = 1 then 
				ls_mes_fin		= '0'+string(ll_mes)
			else
				ls_mes_fin		= string(ll_mes)
			end if
			ls_ano_fin			= mid(string(ll_ano),3,2)
			ls_tipo_anotacion	= 'I'
			ls_codigo_horario	= '    3'
			ls_operacion		= 'A'
			ll_new				= dw_exportar.insertrow(0)
			dw_exportar.scrolltorow(ll_new)
//			dw_exportar.setitem(ll_new,'identificador',ls_rut)
//			dw_exportar.setitem(ll_new,'dia_inicial',ls_dia_ini)
//			dw_exportar.setitem(ll_new,'mes_inicial',ls_mes_ini)
//			dw_exportar.setitem(ll_new,'ano_inicial',ls_ano_ini)
//			dw_exportar.setitem(ll_new,'dia_final',ls_dia_fin)
//			dw_exportar.setitem(ll_new,'mes_final',ls_mes_fin)
//			dw_exportar.setitem(ll_new,'ano_final',ls_ano_fin)
//			dw_exportar.setitem(ll_new,'tipo_anotacion',ls_tipo_anotacion)
//			dw_exportar.setitem(ll_new,'codigo_horario',ls_codigo_horario)
//			dw_exportar.setitem(ll_new,'opracion',ls_operacion)
			ls_linea				= ls_rut+ls_dia_ini+ls_mes_ini+ls_ano_ini+ls_dia_fin+ls_mes_fin+ls_ano_fin+ls_tipo_anotacion+ls_codigo_horario+ls_operacion
			dw_exportar.setitem(ll_new,'linea',ls_linea)
		end if
	next
	dw_exportar.accepttext()
	dw_paso	= dw_exportar
//	OpenWithParm(w_exportar_licencia, dw_paso)
	f_DWToExcel( dw_paso )
else
	messagebox("Advertencia","No Registra Licencias Médicas Nuevas a Exportar al Sistema TEMPO")
	ls_filtro	= ""
	dw_lista.SetFilter(ls_filtro)
	dw_lista.Filter()
end if
end event

type p_fec_fin from picture within w_reportes_licencias_medicas
integer x = 2885
integer y = 56
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;date	ld_fecha
ld_fecha	= date(em_hasta.text)
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_hasta.text	= string(today(),gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_hasta.text	= Message.StringParm
END IF
end event

type p_fec_ini from picture within w_reportes_licencias_medicas
integer x = 2240
integer y = 60
integer width = 78
integer height = 88
boolean originalsize = true
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;date	ld_fecha
ld_fecha	= date(em_desde.text)
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_desde.text	= string(today(),gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_desde.text	= Message.StringParm
END IF
end event

type em_dias_fin from editmask within w_reportes_licencias_medicas
integer x = 987
integer y = 56
integer width = 329
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###"
end type

type st_4 from statictext within w_reportes_licencias_medicas
integer x = 791
integer y = 72
integer width = 187
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_print from picturebutton within w_reportes_licencias_medicas
integer x = 571
integer y = 2020
integer width = 169
integer height = 148
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Print.bmp"
alignment htextalign = left!
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
else
	messagebox("Advertencia","No tiene dato para Imprimir")
end if
end event

type pb_filtrar from picturebutton within w_reportes_licencias_medicas
integer x = 224
integer y = 2020
integer width = 169
integer height = 148
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "exportar.bmp"
alignment htextalign = left!
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type pb_ordenar from picturebutton within w_reportes_licencias_medicas
integer x = 398
integer y = 2020
integer width = 169
integer height = 148
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
alignment htextalign = left!
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()
end event

type pb_exportar from picturebutton within w_reportes_licencias_medicas
integer x = 50
integer y = 2020
integer width = 169
integer height = 148
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
alignment htextalign = left!
end type

event clicked;dw_paso	= dw_lista
f_DWToExcel( dw_paso )
end event

type pb_aceptar from picturebutton within w_reportes_licencias_medicas
integer x = 3109
integer y = 28
integer width = 178
integer height = 156
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
end type

event clicked;string	ls_codigo
Long		ll_rut, ll_dia_ini, ll_dia_fin
date		ld_fec_ini, ld_fec_fin
ld_fec_ini	= date(em_desde.text)
ld_fec_fin	= date(em_hasta.text)
dw_lista_empleado.accepttext()
if ld_fec_ini > ld_fec_fin then
	messagebox("Advertencia","Rango Fecha Incorrecta")
else
	CHOOSE CASE is_opcion
		CASE '1' //jefe
			ls_codigo	= trim(dw_lista_empleado.getitemstring(1,'codigo_jefe'))
			if ls_codigo <> '' or isnull(ls_codigo) then
				if dw_lista.retrieve(ls_codigo,ld_fec_ini,ld_fec_fin)=0 then
					messagebox("Advertencia","No registra dato")
				else
					wf_llenar_titulo()
				end if
			else
				messagebox("Advertencia","Debe ingresar Código")
			end if
		CASE '2' //empleado
			ls_codigo	= trim(dw_lista_empleado.getitemstring(1,'codigo_empleado'))
			if ls_codigo <> '' or isnull(ls_codigo) then
				if dw_lista.retrieve(ls_codigo,ld_fec_ini,ld_fec_fin)=0 then
					messagebox("Advertencia","No registra dato")
				else
					wf_llenar_titulo()
				end if
			else 
				messagebox("Advertencia","Debe ingresar Código")
			end if
		CASE '3' //medico
			ll_rut	= dw_lista_empleado.getitemNumber(1,'rut_medico')
			if ll_rut > 0 then
				if dw_lista.retrieve(ll_rut,ld_fec_ini,ld_fec_fin)=0 then
					messagebox("Advertencia","No registra dato")
				else
					wf_llenar_titulo()
				end if
			else
				messagebox("Advertencia","Debe ingresar Rut")
			end if
			
		CASE '4' //Rango de dias
			ll_dia_ini		= long(em_rut.text)
			ll_dia_fin		= long(em_dias_fin.text)
			if ll_dia_ini > 0 and ll_dia_fin > 0 then
				if ll_dia_ini > ll_dia_fin then
					messagebox("Advertencia","Rango de días incorrecto")
				else
					if dw_lista.retrieve(ll_dia_ini,ll_dia_fin,ld_fec_ini,ld_fec_fin)=0 then
						messagebox("Advertencia","No registra dato")
					else
						wf_llenar_titulo()
					end if
				end if
			else
				messagebox("Advertencia","Debe ingresar Rango de días")
			end if
			
		CASE '5' //Rango de fecha
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
				messagebox("Advertencia","No registra dato")
			else
				wf_llenar_titulo()
			end if
	END CHOOSE
end if
end event

type em_hasta from editmask within w_reportes_licencias_medicas
integer x = 2542
integer y = 56
integer width = 329
integer height = 88
integer taborder = 60
integer textsize = -8
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

type st_3 from statictext within w_reportes_licencias_medicas
integer x = 2345
integer y = 72
integer width = 183
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_desde from editmask within w_reportes_licencias_medicas
integer x = 1897
integer y = 56
integer width = 329
integer height = 88
integer taborder = 50
integer textsize = -8
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

type st_2 from statictext within w_reportes_licencias_medicas
integer x = 1477
integer y = 72
integer width = 370
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_codigo from editmask within w_reportes_licencias_medicas
integer x = 443
integer y = 56
integer width = 329
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
end type

type st_1 from statictext within w_reportes_licencias_medicas
integer x = 32
integer y = 68
integer width = 361
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Código"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_cerrar from picturebutton within w_reportes_licencias_medicas
integer x = 3209
integer y = 2024
integer width = 174
integer height = 152
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_reportes_licencias_medicas)
end event

type dw_lista from datawindow within w_reportes_licencias_medicas
integer x = 46
integer y = 204
integer width = 3333
integer height = 1784
string dataobject = "dw_print_por_empleado_del_jefe"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_lista_empleado from datawindow within w_reportes_licencias_medicas
integer x = 407
integer y = 52
integer width = 1024
integer height = 100
integer taborder = 30
string dataobject = "dwe_lista_codigo_jefes"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type em_rut from editmask within w_reportes_licencias_medicas
integer x = 443
integer y = 56
integer width = 329
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###"
end type

