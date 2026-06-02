forward
global type w_rezago_promesa_pend from window
end type
type cb_exportar from commandbutton within w_rezago_promesa_pend
end type
type p_termino from picture within w_rezago_promesa_pend
end type
type st_hasta from statictext within w_rezago_promesa_pend
end type
type cb_resumen from commandbutton within w_rezago_promesa_pend
end type
type cb_limpiar from commandbutton within w_rezago_promesa_pend
end type
type pb_aceptar from picturebutton within w_rezago_promesa_pend
end type
type cb_2 from commandbutton within w_rezago_promesa_pend
end type
type cb_imprimir from commandbutton within w_rezago_promesa_pend
end type
type dw_lista from datawindow within w_rezago_promesa_pend
end type
type gb_1 from groupbox within w_rezago_promesa_pend
end type
type em_termino from editmask within w_rezago_promesa_pend
end type
type dw_seleccion from datawindow within w_rezago_promesa_pend
end type
end forward

global type w_rezago_promesa_pend from window
integer width = 4037
integer height = 2204
boolean titlebar = true
string title = "Detalle Rezagos"
boolean controlmenu = true
long backcolor = 67108864
cb_exportar cb_exportar
p_termino p_termino
st_hasta st_hasta
cb_resumen cb_resumen
cb_limpiar cb_limpiar
pb_aceptar pb_aceptar
cb_2 cb_2
cb_imprimir cb_imprimir
dw_lista dw_lista
gb_1 gb_1
em_termino em_termino
dw_seleccion dw_seleccion
end type
global w_rezago_promesa_pend w_rezago_promesa_pend

type variables
long il_row
end variables

on w_rezago_promesa_pend.create
this.cb_exportar=create cb_exportar
this.p_termino=create p_termino
this.st_hasta=create st_hasta
this.cb_resumen=create cb_resumen
this.cb_limpiar=create cb_limpiar
this.pb_aceptar=create pb_aceptar
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.em_termino=create em_termino
this.dw_seleccion=create dw_seleccion
this.Control[]={this.cb_exportar,&
this.p_termino,&
this.st_hasta,&
this.cb_resumen,&
this.cb_limpiar,&
this.pb_aceptar,&
this.cb_2,&
this.cb_imprimir,&
this.dw_lista,&
this.gb_1,&
this.em_termino,&
this.dw_seleccion}
end on

on w_rezago_promesa_pend.destroy
destroy(this.cb_exportar)
destroy(this.p_termino)
destroy(this.st_hasta)
destroy(this.cb_resumen)
destroy(this.cb_limpiar)
destroy(this.pb_aceptar)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.em_termino)
destroy(this.dw_seleccion)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque

gf_centrar(w_rezago_promesa_pend)
dw_lista.dataobject									='dw_rezago_prom_pend_jefe'
dw_lista.settransobject(sqlca)
em_termino.text										= string(gdt_fec_sistema,'dd/mm/yyyy')

if gl_proceso >= 4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque										= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque										= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque										= 801
	end if
	dw_seleccion.settransobject(sqlca)
	dw_seleccion.getchild('jefe',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ll_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_seleccion.getchild('supervisor',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ll_parque,'')=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	dw_lista.reset()
	dw_seleccion.accepttext()
	
elseif gl_proceso=3 then
	cb_resumen.visible								= false
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect		= 1
		dw_seleccion.object.jefe.protect			= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,gs_user)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',gs_user)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		end if
	dw_lista.reset()
	dw_seleccion.accepttext()

elseif gl_proceso = 2 then
	cb_resumen.visible								= false
	SELECT	"SUPERVISOR"."COD_PARQUE",   
        	 	"SUPERVISOR"."COD_JEFE"  
   INTO		:ll_parque,   
         	:ls_jefe  
   FROM 		"SUPERVISOR"  
   WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect		= 1
		dw_seleccion.object.jefe.protect			= 1
		dw_seleccion.object.supervisor.protect	= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',ls_jefe)
		dw_seleccion.setitem(1,'supervisor',gs_user)
	end if
	dw_lista.reset()
	dw_seleccion.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_rezago_promesa_pend)
end if

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_exportar from commandbutton within w_rezago_promesa_pend
integer x = 1614
integer y = 1956
integer width = 274
integer height = 92
integer taborder = 150
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

type p_termino from picture within w_rezago_promesa_pend
integer x = 640
integer y = 124
integer width = 82
integer height = 80
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha

if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF
end event

event getfocus;dw_lista.reset()
end event

type st_hasta from statictext within w_rezago_promesa_pend
integer x = 64
integer y = 136
integer width = 155
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type cb_resumen from commandbutton within w_rezago_promesa_pend
integer x = 32
integer y = 1956
integer width = 334
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Resumen"
end type

event clicked;string	ls_string
datetime	ldt_fecha_pago

ldt_fecha_pago												= datetime(date(em_termino.text),time('00:00:00'))
if isnull(ldt_fecha_pago) then
	messagebox("Advertencia","No Registra Pago en Rezago")
else
	if not isnull(ldt_fecha_pago) then
		ls_string											= string(ldt_fecha_pago,'dd/mm/yyyy')
		if isvalid(w_rezago_prom_pend_resumen) then close(w_rezago_prom_pend_resumen)
			OpenWithParm(w_rezago_prom_pend_resumen, ls_string)
	end if
end if
end event

type cb_limpiar from commandbutton within w_rezago_promesa_pend
integer x = 1893
integer y = 1956
integer width = 274
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_rezago_promesa_pend.triggerevent(open!)
end event

type pb_aceptar from picturebutton within w_rezago_promesa_pend
integer x = 2258
integer y = 88
integer width = 133
integer height = 116
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_jefe,ls_superv
long		ll_cod_parque,ll_tot_reg
datetime	ldt_fecha_term

dw_lista.reset()
dw_seleccion.accepttext()
ll_cod_parque														= dw_seleccion.getitemnumber(1,'parque')
ls_jefe																= dw_seleccion.getitemstring(1,'jefe')
ls_superv															= dw_seleccion.getitemstring(1,'supervisor')
ldt_fecha_term														= datetime(date(em_termino.text),time('00:00:00'))

if (not isnull(ll_cod_parque) or ll_cod_parque > 0) and (not isnull(ls_jefe) or ls_jefe<>'') and (ls_superv = '' or isnull(ls_superv)) then
	dw_lista.dataobject											='dw_rezago_prom_pend_jefe'
	dw_lista.settransobject(sqlca)
	ll_tot_reg														= dw_lista.retrieve(ls_jefe,ldt_fecha_term)
	if ll_tot_reg > 0 then
		dw_lista.object.usuario.text								= gs_user
		dw_lista.object.titulo2_t.text								= 'Pendiente hasta el '+string(ldt_fecha_term,'dd/mm/yyyy')
	else
		messagebox("Advertencia","No Registra Datos")	
	end if
elseif (not isnull(ll_cod_parque) or ll_cod_parque > 0) and (not isnull(ls_jefe) or ls_jefe<>'') and (ls_superv <> '' or not isnull(ls_superv)) then
	dw_lista.dataobject											='dw_rezago_prom_pend_sup'
	dw_lista.settransobject(sqlca)
	ll_tot_reg														= dw_lista.retrieve(ls_superv,ldt_fecha_term)
	if ll_tot_reg > 0 then
		dw_lista.object.usuario.text								= gs_user
		dw_lista.object.titulo2_t.text							= 'Pendiente hasta el '+string(ldt_fecha_term,'dd/mm/yyyy')
	else
		messagebox("Advertencia","No Registra Datos")
	end if
else
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('parque')
	elseif isnull(ls_jefe) or ls_jefe='' then
		messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('jefe')
	end if
end if
end event

type cb_2 from commandbutton within w_rezago_promesa_pend
integer x = 3712
integer y = 1956
integer width = 274
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_rezago_promesa_pend)
end event

type cb_imprimir from commandbutton within w_rezago_promesa_pend
integer x = 2171
integer y = 1956
integer width = 274
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() >0 then 
	f_Print( dw_lista )
end if
end event

type dw_lista from datawindow within w_rezago_promesa_pend
integer x = 32
integer y = 224
integer width = 3954
integer height = 1696
integer taborder = 40
string title = "none"
string dataobject = "dw_rezago_prom_pend_jefe"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()
end event

event clicked;if getrow()>0 then
	il_row	= getrow()
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

type gb_1 from groupbox within w_rezago_promesa_pend
integer x = 1591
integer y = 1908
integer width = 878
integer height = 160
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type em_termino from editmask within w_rezago_promesa_pend
integer x = 233
integer y = 124
integer width = 407
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;dw_lista.reset()
end event

type dw_seleccion from datawindow within w_rezago_promesa_pend
integer x = 37
integer y = 28
integer width = 2208
integer height = 196
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccion_opcion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
END CHOOSE
end event

event itemfocuschanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
END CHOOSE
end event

