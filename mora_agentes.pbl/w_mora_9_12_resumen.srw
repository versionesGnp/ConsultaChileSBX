forward
global type w_mora_9_12_resumen from window
end type
type dw_seleccion from datawindow within w_mora_9_12_resumen
end type
type cb_detalle from commandbutton within w_mora_9_12_resumen
end type
type cbx_habilita from checkbox within w_mora_9_12_resumen
end type
type dw_detalle from datawindow within w_mora_9_12_resumen
end type
type dw_parque from datawindow within w_mora_9_12_resumen
end type
type cb_exportar from commandbutton within w_mora_9_12_resumen
end type
type pb_ok from picturebutton within w_mora_9_12_resumen
end type
type cb_imprimir from commandbutton within w_mora_9_12_resumen
end type
type cb_cerrar from commandbutton within w_mora_9_12_resumen
end type
type dw_lista from datawindow within w_mora_9_12_resumen
end type
type dw_fecha_cierre from datawindow within w_mora_9_12_resumen
end type
type gb_1 from groupbox within w_mora_9_12_resumen
end type
type gb_2 from groupbox within w_mora_9_12_resumen
end type
end forward

global type w_mora_9_12_resumen from window
integer width = 3886
integer height = 2540
boolean titlebar = true
string title = "Resumen Ingreso por Ejecutivo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_seleccion dw_seleccion
cb_detalle cb_detalle
cbx_habilita cbx_habilita
dw_detalle dw_detalle
dw_parque dw_parque
cb_exportar cb_exportar
pb_ok pb_ok
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
dw_fecha_cierre dw_fecha_cierre
gb_1 gb_1
gb_2 gb_2
end type
global w_mora_9_12_resumen w_mora_9_12_resumen

type variables
string	is_cargo
long	il_row
end variables

on w_mora_9_12_resumen.create
this.dw_seleccion=create dw_seleccion
this.cb_detalle=create cb_detalle
this.cbx_habilita=create cbx_habilita
this.dw_detalle=create dw_detalle
this.dw_parque=create dw_parque
this.cb_exportar=create cb_exportar
this.pb_ok=create pb_ok
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.dw_fecha_cierre=create dw_fecha_cierre
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_seleccion,&
this.cb_detalle,&
this.cbx_habilita,&
this.dw_detalle,&
this.dw_parque,&
this.cb_exportar,&
this.pb_ok,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.dw_fecha_cierre,&
this.gb_1,&
this.gb_2}
end on

on w_mora_9_12_resumen.destroy
destroy(this.dw_seleccion)
destroy(this.cb_detalle)
destroy(this.cbx_habilita)
destroy(this.dw_detalle)
destroy(this.dw_parque)
destroy(this.cb_exportar)
destroy(this.pb_ok)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.dw_fecha_cierre)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;string	ls_nulo
long	ll_parque,ll_nulo

setnull(ll_nulo);setnull(ls_nulo)
gf_centrar(w_mora_9_12_resumen)
dw_parque.dataobject								= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)

dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('fecha_cierre',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(datetime(date(string('01/01/2000'))))=0 then
	idw_detalle.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)

dw_lista.dataobject						= 'dw_9_12_informe'
dw_lista.settransobject(sqlca)
dw_detalle.dataobject					= 'dw_9_12_detalle'
dw_detalle.settransobject(sqlca)
dw_seleccion.dataobject					= 'dwe_seleccionar_cargo'
dw_seleccion.settransobject(sqlca)

if gs_conexion	= "Parque El Prado" then
	ll_parque									= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_parque									= 11
elseif gs_conexion	= "Parque Concepción" then
	ll_parque									= 801
end if
dw_seleccion.settransobject(sqlca)
dw_seleccion.getchild('jefe',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve()=0 then
	idw_detalle.insertrow(0)
end if
dw_seleccion.getchild('supervisor',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve()=0 then
	idw_detalle2.insertrow(0)
end if
dw_seleccion.getchild('agente',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve()=0 then
	idw_detalle3.insertrow(0)
end if
dw_seleccion.insertrow(0)
dw_seleccion.setitem(1,'jefe',ls_nulo)
dw_seleccion.setitem(1,'supervisor',ls_nulo)
dw_seleccion.setitem(1,'agente',ls_nulo)
dw_seleccion.accepttext()
end event

type dw_seleccion from datawindow within w_mora_9_12_resumen
integer x = 78
integer y = 2148
integer width = 1591
integer height = 264
integer taborder = 30
string title = "none"
string dataobject = "dwe_seleccionar_cargo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_nulo

Setnull(ls_nulo)
ls_columna								= dwo.name
CHOOSE CASE ls_columna
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		idw_detalle3.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve()=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		cb_detalle.text 					= 'Detalle Jefe Ventas'
		is_cargo							= 'J'
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
		dw_seleccion.getchild('agente',idw_detalle3)
		idw_detalle3.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve()=0 then
			idw_detalle3.insertrow(0)
		end if
		dw_seleccion.accepttext()
		cb_detalle.text 					= 'Detalle Supervisor'
		is_cargo							= 'S'
	CASE 'agente'
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.accepttext()
		dw_lista.reset()
		cb_detalle.text 					= 'Detalle Agente Ventas'
		is_cargo							= 'A'
END CHOOSE
end event

type cb_detalle from commandbutton within w_mora_9_12_resumen
integer x = 1710
integer y = 2108
integer width = 526
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Detalle Jefe Ventas"
end type

event clicked;string		ls_codigo,ls_filtro
long		ll_cod_parque,ll_tot_reg
datetime	ldt_fecha

dw_lista.reset()
dw_parque.accepttext()
dw_fecha_cierre.accepttext()
ll_cod_parque									= dw_parque.getitemnumber(1,'parque')
ldt_fecha											= dw_fecha_cierre.getitemdatetime(1,'fecha_cierre')
if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ldt_fecha) then
	if not isnull(is_cargo) then
		if is_cargo= 'J' then
			ls_codigo								= dw_seleccion.getitemstring(1,'jefe')
		elseif is_cargo= 'S' then
			ls_codigo								= dw_seleccion.getitemstring(1,'supervisor')
		elseif is_cargo= 'A' then
			ls_codigo								= dw_seleccion.getitemstring(1,'agente')
		end if
		if not isnull(ls_codigo) and ls_codigo<>'' then
			UPDATE	"MORA_9_12_FECHA"  
     		SET		"CARGO" = :is_cargo,   
         				"CODIGO" = :ls_codigo
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	end if
	dw_lista.dataobject						= 'dw_9_12_informe02'
	dw_lista.settransobject(sqlca)
	if not isnull(ls_codigo) and ls_codigo<>'' then
		ll_tot_reg								= dw_lista.retrieve(ldt_fecha,ll_cod_parque,ls_codigo)
		if ll_tot_reg>0 then
			dw_lista.object.usuario.text		= gs_user
		else
			messagebox("Advertencia","No Registra Datos")
		end if
		SetPointer(Arrow!)
	else
	end if
else
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_parque.setfocus()
		dw_parque.setcolumn('parque')
	elseif isnull(ldt_fecha) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('fecha_cierre')
	end if
end if
end event

type cbx_habilita from checkbox within w_mora_9_12_resumen
integer x = 462
integer y = 2072
integer width = 78
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

event clicked;string	ls_nulo

setnull(ls_nulo)
dw_seleccion.accepttext()
if cbx_habilita.checked= true then
	dw_seleccion.enabled			= true
	cb_detalle.enabled  			= true
	cb_detalle.text 					= 'Detalle Jefe Ventas'
	is_cargo							= 'J'
	dw_seleccion.settransobject(sqlca)
	dw_seleccion.getchild('jefe',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve()=0 then
		idw_detalle.insertrow(0)
	end if
	dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'agente',ls_nulo)
	dw_seleccion.accepttext()
else
	dw_seleccion.enabled			= false
	cb_detalle.enabled  			= true
	cb_detalle.text 					= 'Detalle Jefe Ventas'
end if

end event

type dw_detalle from datawindow within w_mora_9_12_resumen
integer x = 3977
integer y = 152
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
string dataobject = "dw_9_12_detalle"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_parque from datawindow within w_mora_9_12_resumen
integer x = 55
integer y = 32
integer width = 882
integer height = 100
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_nulo

setnull(ls_nulo)
dw_seleccion.settransobject(sqlca)
dw_seleccion.getchild('jefe',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve()=0 then
	idw_detalle.insertrow(0)
end if
dw_seleccion.insertrow(0)
dw_seleccion.setitem(1,'jefe',ls_nulo)
dw_seleccion.setitem(1,'supervisor',ls_nulo)
dw_seleccion.setitem(1,'agente',ls_nulo)
dw_seleccion.accepttext()
cbx_habilita.checked		= false
dw_seleccion.enabled		= false
cb_detalle.enabled  		= false
cb_detalle.text 				= 'Detalle Jefe Ventas'
dw_lista.reset()

end event

type cb_exportar from commandbutton within w_mora_9_12_resumen
integer x = 2743
integer y = 2120
integer width = 261
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;long	ll_tot_reg
datawindow dw_paso
dw_paso						= dw_detalle
if dw_lista.rowcount() > 0 then
	SetPointer(HourGlass!)	
	ll_tot_reg			= dw_detalle.retrieve()
	if ll_tot_reg>0 then
		f_DWToExcel( dw_paso )
	end if
	SetPointer(Arrow!)
end if
end event

type pb_ok from picturebutton within w_mora_9_12_resumen
event ue_mousemove pbm_mousemove
integer x = 1998
integer y = 12
integer width = 133
integer height = 116
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string		ls_nulo
long		ll_cod_parque,ll_tot_reg
datetime	ldt_fecha

setnull(ls_nulo)
dw_seleccion.setitem(1,'jefe',ls_nulo)
dw_seleccion.setitem(1,'supervisor',ls_nulo)
dw_seleccion.setitem(1,'agente',ls_nulo)
dw_seleccion.accepttext()
cbx_habilita.checked						= false
dw_seleccion.enabled						= false
cb_detalle.enabled  						= false
cb_detalle.text 								= 'Detalle Jefe Ventas'
dw_lista.reset()
dw_parque.accepttext()
dw_fecha_cierre.accepttext()
dw_lista.dataobject						= 'dw_9_12_informe'
dw_lista.settransobject(sqlca)
ll_cod_parque								= dw_parque.getitemnumber(1,'parque')
ldt_fecha										= dw_fecha_cierre.getitemdatetime(1,'fecha_cierre')
if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ldt_fecha) then
	SetPointer(HourGlass!)	
	DELETE FROM "MORA_9_12_FECHA"
	USING	sqlca;
	if sqlca.sqlcode=0 then
		commit;
		INSERT INTO "MORA_9_12_FECHA"  
         			( "FECHA",	"COD_PARQUE",	"CARGO",	"CODIGO" )  
  		VALUES	( :ldt_fecha,	:ll_cod_parque,		'J',				'' )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	else
		rollback;
	end if
	ll_tot_reg								= dw_lista.retrieve(ldt_fecha,ll_cod_parque)
	if ll_tot_reg>0 then
		dw_lista.object.usuario.text		= gs_user
	else
		messagebox("Advertencia","No Registra Datos")
	end if
	SetPointer(Arrow!)
else
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_parque.setfocus()
		dw_parque.setcolumn('parque')
	elseif isnull(ldt_fecha) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('fecha_cierre')
	end if
end if
end event

type cb_imprimir from commandbutton within w_mora_9_12_resumen
integer x = 3008
integer y = 2120
integer width = 261
integer height = 88
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

type cb_cerrar from commandbutton within w_mora_9_12_resumen
integer x = 3525
integer y = 2100
integer width = 306
integer height = 100
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mora_9_12_resumen)
end event

type dw_lista from datawindow within w_mora_9_12_resumen
integer x = 37
integer y = 148
integer width = 3794
integer height = 1912
integer taborder = 40
string title = "none"
string dataobject = "dw_9_12_informe_jef"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type dw_fecha_cierre from datawindow within w_mora_9_12_resumen
integer x = 983
integer y = 32
integer width = 969
integer height = 100
integer taborder = 20
string title = "none"
string dataobject = "dwe_cierre_factura"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_nulo

setnull(ls_nulo)
dw_seleccion.settransobject(sqlca)
dw_seleccion.getchild('jefe',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve()=0 then
	idw_detalle.insertrow(0)
end if
dw_seleccion.insertrow(0)
dw_seleccion.setitem(1,'jefe',ls_nulo)
dw_seleccion.setitem(1,'supervisor',ls_nulo)
dw_seleccion.setitem(1,'agente',ls_nulo)
dw_seleccion.accepttext()
cbx_habilita.checked		= false
dw_seleccion.enabled		= false
cb_detalle.enabled  		= false
cb_detalle.text 				= 'Detalle Jefe Ventas'
dw_lista.reset()

end event

type gb_1 from groupbox within w_mora_9_12_resumen
integer x = 69
integer y = 2076
integer width = 1614
integer height = 348
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Busqueda"
end type

type gb_2 from groupbox within w_mora_9_12_resumen
integer x = 2720
integer y = 2072
integer width = 576
integer height = 160
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

