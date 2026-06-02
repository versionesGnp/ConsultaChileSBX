forward
global type w_cd_consultas_bkp from window
end type
type st_ayuda from statictext within w_cd_consultas_bkp
end type
type cb_mostrar_todo from commandbutton within w_cd_consultas_bkp
end type
type dw_ayuda from datawindow within w_cd_consultas_bkp
end type
type st_hasta from statictext within w_cd_consultas_bkp
end type
type em_folio_fin from editmask within w_cd_consultas_bkp
end type
type cb_filtrar from commandbutton within w_cd_consultas_bkp
end type
type cb_sort from commandbutton within w_cd_consultas_bkp
end type
type cb_exportar from commandbutton within w_cd_consultas_bkp
end type
type cb_imprimir from commandbutton within w_cd_consultas_bkp
end type
type cb_limpiar from commandbutton within w_cd_consultas_bkp
end type
type pb_lupa from picturebutton within w_cd_consultas_bkp
end type
type st_folio from statictext within w_cd_consultas_bkp
end type
type cb_detalle from commandbutton within w_cd_consultas_bkp
end type
type rb_fecha_ult_estado from radiobutton within w_cd_consultas_bkp
end type
type rb_fecha_crea from radiobutton within w_cd_consultas_bkp
end type
type pb_aceptar from picturebutton within w_cd_consultas_bkp
end type
type p_fin from picture within w_cd_consultas_bkp
end type
type em_fec_fin from editmask within w_cd_consultas_bkp
end type
type st_21 from statictext within w_cd_consultas_bkp
end type
type p_ini from picture within w_cd_consultas_bkp
end type
type em_fec_ini from editmask within w_cd_consultas_bkp
end type
type st_11 from statictext within w_cd_consultas_bkp
end type
type cb_cerrar from commandbutton within w_cd_consultas_bkp
end type
type dw_lista from datawindow within w_cd_consultas_bkp
end type
type gb_1 from groupbox within w_cd_consultas_bkp
end type
type gb_3 from groupbox within w_cd_consultas_bkp
end type
type em_referencia from editmask within w_cd_consultas_bkp
end type
type em_codigo from editmask within w_cd_consultas_bkp
end type
type dwe_estado from datawindow within w_cd_consultas_bkp
end type
type em_folio from editmask within w_cd_consultas_bkp
end type
type gb_2 from groupbox within w_cd_consultas_bkp
end type
end forward

global type w_cd_consultas_bkp from window
integer width = 3287
integer height = 2112
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_mousemove ( )
st_ayuda st_ayuda
cb_mostrar_todo cb_mostrar_todo
dw_ayuda dw_ayuda
st_hasta st_hasta
em_folio_fin em_folio_fin
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
pb_lupa pb_lupa
st_folio st_folio
cb_detalle cb_detalle
rb_fecha_ult_estado rb_fecha_ult_estado
rb_fecha_crea rb_fecha_crea
pb_aceptar pb_aceptar
p_fin p_fin
em_fec_fin em_fec_fin
st_21 st_21
p_ini p_ini
em_fec_ini em_fec_ini
st_11 st_11
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
gb_3 gb_3
em_referencia em_referencia
em_codigo em_codigo
dwe_estado dwe_estado
em_folio em_folio
gb_2 gb_2
end type
global w_cd_consultas_bkp w_cd_consultas_bkp

type variables
String	is_opcion,is_base,is_serie
Long		il_row
Double	il_numero
end variables

event ue_mousemove;st_ayuda.visible	= false
end event

event open;Date	ld_fec_ini, ld_fec_fin
gf_centrar(w_cd_consultas)
dw_ayuda.settransobject(sqlca)
dw_ayuda.retrieve()
st_ayuda.visible							= false
is_opcion									= trim(substr(1,1,Message.StringParm))
st_folio.TextSize							= 19
CHOOSE CASE is_opcion
	CASE 'F' //Por Fecha
		st_folio.visible					= false
		em_referencia.visible			= false
		em_folio.visible					= false
		dwe_estado.visible				= false
		em_codigo.visible					= false
		pb_lupa.visible					= false
		st_hasta.visible					= false
		em_folio_fin.visible				= false
		gb_1.visible						= true
		st_11.visible						= true
		em_fec_ini.visible				= true
		p_ini.visible						= true
		st_21.visible						= true
		em_fec_fin.visible				= true
		p_fin.visible						= true
		gb_2.text							= 'Seleccione Opción'
		gb_2.width							= 791
		gb_2.visible						= true
		rb_fecha_crea.visible			= true
		rb_fecha_ult_estado.visible	= true
		rb_fecha_crea.checked			= true
		pb_aceptar.x						= 2286
		em_fec_ini.text					= string(today(),"dd/mm/yyyy")
		em_fec_fin.text					= string(today(),"dd/mm/yyyy")
		w_cd_consultas.title				= 'Consultar por Rango de Fecha'
		dw_lista.dataobject				= 'dw_consulta_rango_fecha_creacion'
		dw_lista.settransobject(sqlca)
		ld_fec_ini							= date(em_fec_ini.text)
		ld_fec_fin							= date(em_fec_fin.text)
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)>0 then dw_lista.scrolltorow(1)
		dw_lista.object.t_fecha.text	= 'Consulta por Rango Fecha Creación desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
		em_fec_ini.setfocus()
		
	CASE 'O' //Por Folio
		w_cd_consultas.title				= 'Consultar por Rango de Folio'
		dw_lista.dataobject				= 'dw_consulta_por_folio'
		dw_lista.settransobject(sqlca)
		em_referencia.visible			= false
		em_codigo.visible					= false
		pb_lupa.visible					= false
		dwe_estado.visible				= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		gb_2.visible						= true
		st_hasta.visible					= true
		em_folio_fin.visible				= true
		gb_2.text							= 'Ingrese Folio'
		gb_2.width							= 1755
		pb_aceptar.x						= 1833
		st_folio.visible					= true
		em_folio.text						= ''
		em_folio.visible					= true
		st_folio.TextSize					= 15
		st_hasta.TextSize					= 15
		st_folio.text						= 'Folio desde'
		em_folio.setfocus()

	CASE 'E' //Por Estado
		st_folio.text						= 'Estado'
		em_referencia.visible			= false
		em_codigo.visible					= false
		pb_lupa.visible					= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		st_hasta.visible					= false
		em_folio_fin.visible				= false
		dwe_estado.visible				= true
		pb_aceptar.x						= 1787
		gb_2.width							= 1691
		gb_2.text							= 'Seleccione Opcion'
		w_cd_consultas.title				= 'Consultar por Estado'
		dw_lista.dataobject				= 'dw_consulta_por_estado'
		dw_lista.settransobject(sqlca)
		dwe_estado.settransobject(sqlca)
		dwe_estado.insertrow(0)
		dwe_estado.setfocus()
		
	CASE 'A' //Por Agente
		st_folio.text						= 'Agente'
		w_cd_consultas.title				= 'Consultar por Agente'
		em_referencia.visible			= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		st_hasta.visible					= false
		em_folio_fin.visible				= false
		em_codigo.visible					= true
		pb_lupa.visible					= true
		pb_aceptar.x						= 1070
		gb_2.width							= 992
		gb_2.text							= 'Ingrese Codigo Agente'
		dw_lista.dataobject				= 'dw_consulta_por_agente'
		dw_lista.settransobject(sqlca)
		em_codigo.text						= ''
		em_codigo.setfocus()
		
	CASE 'S' //Por Supervisor
		w_cd_consultas.title				= 'Consultar por Supervisor'
		st_folio.text						= 'Supervisor'
		st_folio.TextSize					= 15
		em_referencia.visible			= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		st_hasta.visible					= false
		em_folio_fin.visible				= false
		em_codigo.visible					= true
		pb_lupa.visible					= true
		pb_aceptar.x						= 1070
		gb_2.width							= 992
		gb_2.text							= 'Ingrese Codigo Supervisor'
		dw_lista.dataobject				= 'dw_consulta_por_supervisor'
		dw_lista.settransobject(sqlca)
		em_codigo.text						= ''
		em_codigo.setfocus()

	CASE 'J' //Por Jefe de Venta
		w_cd_consultas.title				= 'Consultar por Jefe de Venta'
		st_folio.text						= 'Jefe Venta'
		st_folio.TextSize					= 15
		em_referencia.visible			= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		st_hasta.visible					= false
		em_folio_fin.visible				= false
		em_codigo.visible					= true
		pb_lupa.visible					= true
		pb_aceptar.x						= 1070
		gb_2.width							= 992
		gb_2.text							= 'Ingrese Codigo Jefe Venta'
		dw_lista.dataobject				= 'dw_consulta_por_jefe_venta'
		dw_lista.settransobject(sqlca)
		em_codigo.text						= ''
		em_codigo.setfocus()
		
	CASE 'R' //Referencia Memorandum
		w_cd_consultas.title				= 'Consultar por Referencia Memorandum'
		st_folio.text						= 'Referencia'
		st_folio.TextSize					= 15
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		em_codigo.visible					= false
		pb_lupa.visible					= false
		st_hasta.visible					= false
		em_folio_fin.visible				= false
		em_referencia.visible			= true
		pb_aceptar.x						= 2665
		gb_2.width							= 2592
		gb_2.text							= 'Ingrese Referencia Memorandum'
		dw_lista.dataobject				= 'dw_consulta_por_referencia_memorandum'
		dw_lista.settransobject(sqlca)
		
END CHOOSE
dw_lista.settransobject(sqlca)
end event

on w_cd_consultas_bkp.create
this.st_ayuda=create st_ayuda
this.cb_mostrar_todo=create cb_mostrar_todo
this.dw_ayuda=create dw_ayuda
this.st_hasta=create st_hasta
this.em_folio_fin=create em_folio_fin
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.pb_lupa=create pb_lupa
this.st_folio=create st_folio
this.cb_detalle=create cb_detalle
this.rb_fecha_ult_estado=create rb_fecha_ult_estado
this.rb_fecha_crea=create rb_fecha_crea
this.pb_aceptar=create pb_aceptar
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_21=create st_21
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_11=create st_11
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_3=create gb_3
this.em_referencia=create em_referencia
this.em_codigo=create em_codigo
this.dwe_estado=create dwe_estado
this.em_folio=create em_folio
this.gb_2=create gb_2
this.Control[]={this.st_ayuda,&
this.cb_mostrar_todo,&
this.dw_ayuda,&
this.st_hasta,&
this.em_folio_fin,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_limpiar,&
this.pb_lupa,&
this.st_folio,&
this.cb_detalle,&
this.rb_fecha_ult_estado,&
this.rb_fecha_crea,&
this.pb_aceptar,&
this.p_fin,&
this.em_fec_fin,&
this.st_21,&
this.p_ini,&
this.em_fec_ini,&
this.st_11,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.gb_3,&
this.em_referencia,&
this.em_codigo,&
this.dwe_estado,&
this.em_folio,&
this.gb_2}
end on

on w_cd_consultas_bkp.destroy
destroy(this.st_ayuda)
destroy(this.cb_mostrar_todo)
destroy(this.dw_ayuda)
destroy(this.st_hasta)
destroy(this.em_folio_fin)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.pb_lupa)
destroy(this.st_folio)
destroy(this.cb_detalle)
destroy(this.rb_fecha_ult_estado)
destroy(this.rb_fecha_crea)
destroy(this.pb_aceptar)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_21)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_11)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.em_referencia)
destroy(this.em_codigo)
destroy(this.dwe_estado)
destroy(this.em_folio)
destroy(this.gb_2)
end on

type st_ayuda from statictext within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 832
integer y = 1832
integer width = 1591
integer height = 64
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 15793151
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ayuda.visible	= false
end event

type cb_mostrar_todo from commandbutton within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 1970
integer y = 1884
integer width = 471
integer height = 104
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sacar Filtro Estado"
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;String	ls_string
ls_string	= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type dw_ayuda from datawindow within w_cd_consultas_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 37
integer y = 1700
integer width = 3182
integer height = 152
string title = "none"
string dataobject = "dw_lista_ayuda_estado_control"
boolean hscrollbar = true
boolean border = false
end type

event ue_mousemove;string	ls_columna,ls_descrip
long		ll_codigo
ls_columna						= dwo.name
st_ayuda.visible				= true
if ((ls_columna='codigo_1' or ls_columna='codigo_2' or ls_columna='codigo_3' or ls_columna='codigo_4' or &
	ls_columna='codigo_5' or ls_columna='codigo_6' or ls_columna='codigo_7' or ls_columna='codigo_8' or &
	ls_columna='codigo_9' or ls_columna='codigo_10' or ls_columna='codigo_11' or ls_columna='codigo_12' or &
	ls_columna='codigo_13' or ls_columna='codigo_14' or ls_columna='codigo_15' or ls_columna='codigo_16' or &
	ls_columna='codigo_17' or ls_columna='codigo_18' ) and row>0) then
	ll_codigo	= dw_ayuda.getitemnumber(row,ls_columna)
	SELECT	"CD_ESTADO"."DESCRIPCION"  
	INTO 		:ls_descrip  
	FROM 		"CD_ESTADO"  
	WHERE 	"CD_ESTADO"."CODIGO" = :ll_codigo   
	USING		sqlca;
	if sqlca.sqlcode=0 then 
		ls_descrip		= string(ll_codigo)+' - '+ls_descrip
		st_ayuda.text	= ls_descrip
	end if
end if
end event

event clicked;Long		ll_codigo
String	ls_string
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_codigo					= this.getitemnumber(row,'codigo')
	ls_string					= 'ult_estado='+string(ll_codigo)
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
end if
end event

type st_hasta from statictext within w_cd_consultas_bkp
integer x = 919
integer y = 108
integer width = 306
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_folio_fin from editmask within w_cd_consultas_bkp
integer x = 1248
integer y = 96
integer width = 485
integer height = 100
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;Long	ll_folio,ll_folio_fin
ll_folio			= Long(em_folio.text)
ll_folio_fin	= Long(em_folio_fin.text)
dw_lista.reset()
if not isnull(ll_folio) and ll_folio>0 and not isnull(ll_folio_fin) and ll_folio_fin>0 then 
	pb_aceptar.setfocus()
	if ll_folio <= ll_folio_fin then pb_aceptar.triggerevent(clicked!)
end if
end event

type cb_filtrar from commandbutton within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 1614
integer y = 1900
integer width = 229
integer height = 80
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_sort from commandbutton within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 1381
integer y = 1900
integer width = 229
integer height = 80
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 1147
integer y = 1900
integer width = 229
integer height = 80
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 864
integer y = 1900
integer width = 229
integer height = 80
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_limpiar from commandbutton within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 581
integer y = 1900
integer width = 229
integer height = 80
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;dw_lista.reset()
CHOOSE CASE is_opcion
	CASE 'F' //Por Fecha
		em_fec_ini.text					= string(today(),"dd/mm/yyyy")
		em_fec_fin.text					= string(today(),"dd/mm/yyyy")
		em_fec_ini.setfocus()
		
	CASE 'O' //Por Folio
		em_folio.text						= ''
		em_folio.setfocus()

	CASE 'E' //Por Estado
		dwe_estado.reset()
		dwe_estado.insertrow(0)
		dwe_estado.setfocus()
		
	CASE 'A' //Por Agente
		em_codigo.text						= ''
		em_codigo.setfocus()
		
	CASE 'S' //Por Supervisor
		em_codigo.text						= ''
		em_codigo.setfocus()

	CASE 'J' //Por Jefe de Venta
		em_codigo.text						= ''
		em_codigo.setfocus()

END CHOOSE
end event

type pb_lupa from picturebutton within w_cd_consultas_bkp
boolean visible = false
integer x = 850
integer y = 100
integer width = 114
integer height = 100
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.bmp"
end type

event clicked;openwithparm(w_lista_codigos,is_opcion)
end event

type st_folio from statictext within w_cd_consultas_bkp
integer x = 59
integer y = 108
integer width = 352
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_detalle from commandbutton within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1884
integer width = 416
integer height = 104
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Gestión"
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;String	ls_string

is_base		= dw_lista.getitemstring(il_row,'base')
is_serie		= dw_lista.getitemstring(il_row,'serie')
il_numero	= dw_lista.getitemnumber(il_row,'numero')
ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)
if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
if not isnull(is_base) and il_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end event

type rb_fecha_ult_estado from radiobutton within w_cd_consultas_bkp
boolean visible = false
integer x = 69
integer y = 160
integer width = 731
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Fecha Ultimo Estado"
end type

event clicked;dw_lista.reset()
end event

type rb_fecha_crea from radiobutton within w_cd_consultas_bkp
boolean visible = false
integer x = 69
integer y = 84
integer width = 654
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Fecha Creación"
end type

event clicked;dw_lista.reset()
end event

type pb_aceptar from picturebutton within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 1833
integer y = 72
integer width = 183
integer height = 156
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
end type

event clicked;Date		ld_fec_fin,ld_fec_ini
Long		ll_folio,ll_estado,ll_folio_fin
String	ls_codigo,ls_referencia
SetPointer(HourGlass!)
dw_lista.reset()
CHOOSE CASE is_opcion
	CASE 'F' //Por Fecha
		if rb_fecha_crea.checked=true then
			dw_lista.dataobject				= 'dw_consulta_rango_fecha_creacion'
		elseif rb_fecha_ult_estado.checked=true then
			dw_lista.dataobject				= 'dw_consulta_rango_fecha_ult_estado'
		end if
		dw_lista.Settransobject(sqlca)
		ld_fec_ini								= date(em_fec_ini.text)
		ld_fec_fin								= date(em_fec_fin.text)
		if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
			messagebox("Advertencia","Fecha Inicial Inválida")
			em_fec_ini.setfocus()
		else
			if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
				messagebox("Advertencia","Fecha Término Inválida")
				em_fec_fin.setfocus()
			else
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
					messagebox("Advertencia","No registra dato")
				else
					if rb_fecha_crea.checked=true then
						dw_lista.object.t_fecha.text	= 'Rango fecha Creación desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
					elseif rb_fecha_ult_estado.checked=true then
						dw_lista.object.t_fecha.text	= 'Rango Fecha Ultimo Estado desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
					end if
					dw_lista.scrolltorow(1)
				end if
			end if
		end if
	CASE 'O' //Por Folio
		ll_folio			= Long(em_folio.text)
		ll_folio_fin	= Long(em_folio_fin.text)
		if not isnull(ll_folio) and ll_folio>0 and not isnull(ll_folio_fin) and ll_folio_fin>0 then 
			if ll_folio > ll_folio_fin then
				messagebox("Advertencia","Rango Inválido")
				em_folio.setfocus()
			else
				if dw_lista.retrieve(ll_folio,ll_folio_fin)=0 then
					messagebox("Advertencia","No Registra Movimiento Folio Nº "+string(ll_folio,"###,###,###,###"))
					em_folio.text	= ''
					em_folio.setfocus()
				else
					if ll_folio=ll_folio_fin then
						dw_lista.object.t_fecha.text	= 'Consulta Folio Nº '+string( ll_folio ,"###,###,###,###")
					else
						dw_lista.object.t_fecha.text	= 'Consulta Folio desde Nº '+string( ll_folio ,"###,###,###,###")+' hasta Nº '+string( ll_folio_fin ,"###,###,###,###")
					end if
				end if
			end if
		end if

	CASE 'E' //Por Estado
		ll_estado	= dwe_estado.getitemnumber(1,'estado')
		if not isnull(ll_estado) and ll_estado>=0 then 
			if dw_lista.retrieve(ll_estado)=0 then
				messagebox("Advertencia","No Registra Movimiento Estado Codigo: "+string(ll_estado))
				dwe_estado.setfocus()
			else
				dw_lista.object.t_fecha.text	= 'Consulta Estado Codigo: '+string( ll_estado)
			end if
		end if

	CASE 'A' //Por Agente
		ls_codigo	= trim(em_codigo.text)
		if not isnull(ls_codigo) and ls_codigo<>'' then 
			if dw_lista.retrieve(ls_codigo)=0 then
				messagebox("Advertencia","No Registra Movimiento Agente Codigo: "+string(ls_codigo))
				em_codigo.setfocus()
			else
				dw_lista.object.t_fecha.text	= 'Consulta Agente Codigo: '+string(ls_codigo)
			end if
		end if

	CASE 'S' //Por Supervisor
		ls_codigo	= trim(em_codigo.text)
		if not isnull(ls_codigo) and ls_codigo<>'' then 
			if dw_lista.retrieve(ls_codigo)=0 then
				messagebox("Advertencia","No Registra Movimiento Supervisor Codigo: "+string(ls_codigo))
				em_codigo.setfocus()
			else
				dw_lista.object.t_fecha.text	= 'Consulta Supervisor Codigo: '+string(ls_codigo)
			end if
		end if

	CASE 'J' //Por Jefe de Venta
		ls_codigo	= trim(em_codigo.text)
		if not isnull(ls_codigo) and ls_codigo<>'' then 
			if dw_lista.retrieve(ls_codigo)=0 then
				messagebox("Advertencia","No Registra Movimiento Jefe Venta Codigo: "+string(ls_codigo))
				em_codigo.setfocus()
			else
				dw_lista.object.t_fecha.text	= 'Consulta Jefe Venta Codigo: '+string(ls_codigo)
			end if
		end if

	CASE 'R' //Por Refrencia Memorandum
		ls_codigo		= trim(em_referencia.text)
		ls_referencia	= trim(em_referencia.text)
		if not isnull(ls_codigo) and ls_codigo<>'' then 
			ls_codigo	= ls_codigo+'%'
			if dw_lista.retrieve(ls_codigo)=0 then
				messagebox("Advertencia","No Registra Memorandum Referencia: "+string(ls_referencia))
				em_codigo.setfocus()
			else
				dw_lista.object.t_fecha.text	= 'Consulta Memorandum Referencia: '+string(ls_referencia)
			end if
		end if

END CHOOSE
SetPointer(arrow!)
end event

type p_fin from picture within w_cd_consultas_bkp
boolean visible = false
integer x = 2112
integer y = 112
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf
dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type em_fec_fin from editmask within w_cd_consultas_bkp
boolean visible = false
integer x = 1733
integer y = 112
integer width = 370
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_21 from statictext within w_cd_consultas_bkp
boolean visible = false
integer x = 1568
integer y = 124
integer width = 169
integer height = 64
integer textsize = -9
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

type p_ini from picture within w_cd_consultas_bkp
boolean visible = false
integer x = 1472
integer y = 112
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf
dw_lista.reset()
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
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_cd_consultas_bkp
boolean visible = false
integer x = 1093
integer y = 112
integer width = 370
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_11 from statictext within w_cd_consultas_bkp
boolean visible = false
integer x = 887
integer y = 124
integer width = 187
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 2871
integer y = 1884
integer width = 347
integer height = 104
integer taborder = 180
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;close(w_cd_consultas)
end event

type dw_lista from datawindow within w_cd_consultas_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 37
integer y = 292
integer width = 3182
integer height = 1384
integer taborder = 100
string title = "none"
string dataobject = "dw_consulta_por_referencia_memorandum"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	is_base		= this.getitemstring(il_row,'base')
	is_serie		= this.getitemstring(il_row,'serie')
	il_numero	= this.getitemnumber(il_row,'numero')
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	is_base		= this.getitemstring(il_row,'base')
	is_serie		= this.getitemstring(il_row,'serie')
	il_numero	= this.getitemnumber(il_row,'numero')
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	is_base		= this.getitemstring(il_row,'base')
	is_serie		= this.getitemstring(il_row,'serie')
	il_numero	= this.getitemnumber(il_row,'numero')
	cb_detalle.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_cd_consultas_bkp
boolean visible = false
integer x = 864
integer y = 16
integer width = 1367
integer height = 236
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Rango de Fecha"
end type

type gb_3 from groupbox within w_cd_consultas_bkp
event ue_mousemove pbm_mousemove
integer x = 553
integer y = 1848
integer width = 1321
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

event ue_mousemove;st_ayuda.visible	= false
end event

type em_referencia from editmask within w_cd_consultas_bkp
boolean visible = false
integer x = 425
integer y = 96
integer width = 2158
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type em_codigo from editmask within w_cd_consultas_bkp
boolean visible = false
integer x = 421
integer y = 100
integer width = 416
integer height = 96
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
end type

event modified;dw_lista.reset()
end event

type dwe_estado from datawindow within w_cd_consultas_bkp
boolean visible = false
integer x = 411
integer y = 96
integer width = 1289
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_estado"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type em_folio from editmask within w_cd_consultas_bkp
integer x = 411
integer y = 96
integer width = 485
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;Long	ll_folio,ll_folio_fin
ll_folio			= Long(em_folio.text)
ll_folio_fin	= Long(em_folio_fin.text)
dw_lista.reset()
if not isnull(ll_folio) and ll_folio>0 and not isnull(ll_folio_fin) and ll_folio_fin>0 then 
	em_folio_fin.setfocus()
	if ll_folio <= ll_folio_fin then pb_aceptar.triggerevent(clicked!)
end if
end event

type gb_2 from groupbox within w_cd_consultas_bkp
integer x = 37
integer y = 16
integer width = 1755
integer height = 236
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

