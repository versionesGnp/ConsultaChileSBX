forward
global type w_cartera_morosa from window
end type
type rb_agente from radiobutton within w_cartera_morosa
end type
type rb_supervisor from radiobutton within w_cartera_morosa
end type
type rb_jefe from radiobutton within w_cartera_morosa
end type
type st_hasta from statictext within w_cartera_morosa
end type
type em_inicio from editmask within w_cartera_morosa
end type
type em_termino from editmask within w_cartera_morosa
end type
type st_desde from statictext within w_cartera_morosa
end type
type p_inicio from picture within w_cartera_morosa
end type
type p_termino from picture within w_cartera_morosa
end type
type cb_limpiar from commandbutton within w_cartera_morosa
end type
type dw_seleccion from datawindow within w_cartera_morosa
end type
type pb_aceptar from picturebutton within w_cartera_morosa
end type
type cb_1 from commandbutton within w_cartera_morosa
end type
type dw_lista from datawindow within w_cartera_morosa
end type
type gb_periodo from groupbox within w_cartera_morosa
end type
end forward

global type w_cartera_morosa from window
integer width = 3410
integer height = 2512
boolean titlebar = true
string title = "Cartera Morosa"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
rb_agente rb_agente
rb_supervisor rb_supervisor
rb_jefe rb_jefe
st_hasta st_hasta
em_inicio em_inicio
em_termino em_termino
st_desde st_desde
p_inicio p_inicio
p_termino p_termino
cb_limpiar cb_limpiar
dw_seleccion dw_seleccion
pb_aceptar pb_aceptar
cb_1 cb_1
dw_lista dw_lista
gb_periodo gb_periodo
end type
global w_cartera_morosa w_cartera_morosa

type variables
Long	il_mes,il_ano,il_row
end variables

on w_cartera_morosa.create
this.rb_agente=create rb_agente
this.rb_supervisor=create rb_supervisor
this.rb_jefe=create rb_jefe
this.st_hasta=create st_hasta
this.em_inicio=create em_inicio
this.em_termino=create em_termino
this.st_desde=create st_desde
this.p_inicio=create p_inicio
this.p_termino=create p_termino
this.cb_limpiar=create cb_limpiar
this.dw_seleccion=create dw_seleccion
this.pb_aceptar=create pb_aceptar
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.gb_periodo=create gb_periodo
this.Control[]={this.rb_agente,&
this.rb_supervisor,&
this.rb_jefe,&
this.st_hasta,&
this.em_inicio,&
this.em_termino,&
this.st_desde,&
this.p_inicio,&
this.p_termino,&
this.cb_limpiar,&
this.dw_seleccion,&
this.pb_aceptar,&
this.cb_1,&
this.dw_lista,&
this.gb_periodo}
end on

on w_cartera_morosa.destroy
destroy(this.rb_agente)
destroy(this.rb_supervisor)
destroy(this.rb_jefe)
destroy(this.st_hasta)
destroy(this.em_inicio)
destroy(this.em_termino)
destroy(this.st_desde)
destroy(this.p_inicio)
destroy(this.p_termino)
destroy(this.cb_limpiar)
destroy(this.dw_seleccion)
destroy(this.pb_aceptar)
destroy(this.cb_1)
destroy(this.dw_lista)
destroy(this.gb_periodo)
end on

event open;string	ls_nulo,ls_jefe,ls_fecha_inicio
long		ll_parque,ll_mes_inicio,ll_ano_inicio,ll_mes_inicio_nue,ll_ano_inicio_nue,ll_mes_inicio_nuevo,ll_ano_inicio_nuevo
datetime	ldt_fecha_termino,ldt_fecha_inicio

Setnull(ls_nulo)
gf_centrar(w_cartera_morosa)

SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM		"TASA"  
WHERE		"TASA"."LOOK" = 1   
USING		sqlca ;
			
em_termino.text												= string(gdt_fec_sistema,'dd/mm/yyyy')
ldt_fecha_termino												= datetime(date(em_termino.text),time('00:00:00'))

em_inicio.text 												= '01/'+string(month(RelativeDate(date(em_termino.text),- 180)),'00')+'/'+string(year(RelativeDate(date(em_termino.text),- 180)))
ldt_fecha_inicio												= datetime(date(em_inicio.text),time('00:00:00'))

if gl_proceso >= 4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque												= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque												= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque												= 801
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
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
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

elseif gl_proceso=2 then
	SELECT	"SUPERVISOR"."COD_PARQUE",   
        	 	"SUPERVISOR"."COD_JEFE"  
   INTO		:ll_parque,   
         	:ls_jefe  
   FROM 		"SUPERVISOR"  
   WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		dw_seleccion.object.supervisor.protect				= 1
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
	close(w_cartera_morosa)
end if

end event

type rb_agente from radiobutton within w_cartera_morosa
integer x = 4169
integer y = 344
integer width = 283
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente"
end type

type rb_supervisor from radiobutton within w_cartera_morosa
integer x = 4169
integer y = 252
integer width = 283
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Superv"
end type

type rb_jefe from radiobutton within w_cartera_morosa
integer x = 4169
integer y = 168
integer width = 283
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jefe"
end type

type st_hasta from statictext within w_cartera_morosa
integer x = 2725
integer y = 76
integer width = 192
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

type em_inicio from editmask within w_cartera_morosa
integer x = 2304
integer y = 144
integer width = 320
integer height = 80
integer taborder = 40
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
string displaydata = ""
end type

type em_termino from editmask within w_cartera_morosa
integer x = 2725
integer y = 144
integer width = 320
integer height = 80
integer taborder = 40
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

type st_desde from statictext within w_cartera_morosa
integer x = 2304
integer y = 76
integer width = 192
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type p_inicio from picture within w_cartera_morosa
integer x = 2629
integer y = 140
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	

if em_inicio.text<>'00/00/0000' then
	ls_fecha = em_inicio.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
END IF
dw_lista.reset()
end event

type p_termino from picture within w_cartera_morosa
integer x = 3049
integer y = 140
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha


if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
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
dw_lista.reset()
end event

type cb_limpiar from commandbutton within w_cartera_morosa
integer x = 41
integer y = 2272
integer width = 325
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_cartera_morosa.triggerevent(open!)
end event

type dw_seleccion from datawindow within w_cartera_morosa
integer x = 41
integer y = 64
integer width = 2208
integer height = 188
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccion_opcion_mora"
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
		idw_detalle3.reset()
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
		idw_detalle3.reset()
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

event itemfocuschanged;//String	ls_columna,ls_jefe,ls_supervisor,ls_agente
//Long		ll_parque
//
//ls_columna	= dwo.name
//if ls_columna<>'parque' 
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
//		dw_seleccion.getchild('jefe',idw_detalle)
//		idw_detalle.settransobject(sqlca)
//		if idw_detalle.retrieve(ll_parque)=0 then
//			idw_detalle.insertrow(0)
//		end if
//	CASE 'jefe'
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
//		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
//		dw_seleccion.getchild('supervisor',idw_detalle2)
//		idw_detalle2.settransobject(sqlca)
//		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
//			idw_detalle2.insertrow(0)
//		end if
//	CASE 'supervisor'
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
//		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
//		ls_supervisor			= dw_seleccion.getitemstring(1,'supervisor')
//		dw_seleccion.getchild('agente',idw_detalle3)
//		idw_detalle3.settransobject(sqlca)
//		if idw_detalle3.retrieve(ll_parque,ls_jefe,ls_supervisor)=0 then
//			idw_detalle3.insertrow(0)
//		end if
//	CASE 'agente'
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//
end event

type pb_aceptar from picturebutton within w_cartera_morosa
integer x = 3195
integer y = 140
integer width = 133
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_jefe,ls_supervisor,ls_agente,ls_fecha_inicio
long		ll_parque,ll_tot_reg,ll_indi
datetime	ldt_fecha_inicio,ldt_fecha_termino

dw_seleccion.accepttext()
SetPointer(HourGlass!)

ll_parque							= dw_seleccion.getitemnumber(1,'parque')
ls_jefe								= dw_seleccion.getitemstring(1,'jefe')
ls_supervisor						= dw_seleccion.getitemstring(1,'supervisor')
ldt_fecha_inicio					= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_termino					= datetime(date(em_termino.text),time('00:00:00'))

if not isnull(ll_parque) and isnull(ls_jefe) and isnull(ls_supervisor) and ll_parque>0 then
	dw_lista.dataobject	= 'dw_lista_jefe_venta_mora'
	dw_lista.settransobject(sqlca)
	ll_tot_reg						= dw_lista.retrieve(ll_parque)
	rb_jefe.checked				= true
	
elseif not isnull(ll_parque) and not isnull(ls_jefe) and isnull(ls_supervisor) and ll_parque>0 and ls_jefe<>'' then
	dw_lista.dataobject	= 'dw_lista_supervisor_mora'
	dw_lista.settransobject(sqlca)
	ll_tot_reg						= dw_lista.retrieve(ll_parque,ls_jefe)
	rb_supervisor.checked		= true

elseif not isnull(ll_parque) and not isnull(ls_jefe) and not isnull(ls_supervisor) and ll_parque>0 and ls_jefe<>'' and ls_jefe<>'' then
	dw_lista.dataobject	= 'dw_lista_agente_mora'
	dw_lista.settransobject(sqlca)
	ll_tot_reg						= dw_lista.retrieve(ll_parque,ls_supervisor)
	rb_agente.checked				= true
else
	if isnull(ll_parque) or ll_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('parque')
	end if
end if

SetPointer(Arrow!)
end event

type cb_1 from commandbutton within w_cartera_morosa
integer x = 3026
integer y = 2272
integer width = 315
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cartera_morosa)
end event

type dw_lista from datawindow within w_cartera_morosa
integer x = 41
integer y = 272
integer width = 3301
integer height = 1968
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_agente_mora"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

close(w_cuenta_corriente_oferta)
close(w_cuenta_corriente_liberador)

end event

event doubleclicked;string	ls_jefe,ls_supervisor,ls_agente,ls_string,ls_jefe_mora,ls_supervisor_mora,ls_agente_mora
long		ll_parque
datetime	ldt_fecha_inicio,ldt_fecha_termino

dw_seleccion.accepttext()
dw_lista.accepttext()
SetPointer(HourGlass!)

ll_parque					= dw_seleccion.getitemnumber(1,'parque')
ls_supervisor				= dw_seleccion.getitemstring(1,'supervisor')
ls_jefe						= dw_seleccion.getitemstring(1,'jefe')
ldt_fecha_inicio			= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_termino			= datetime(date(em_termino.text),time('00:00:00'))

if rb_jefe.checked = true then
	ls_jefe_mora			= dw_lista.getitemstring(row,'jefe_ventas')
	if isnull(ls_jefe) and isnull(ls_supervisor) and ll_parque>0 and dw_lista.dataobject='dw_lista_jefe_venta_mora' then
		ls_string			= ls_jefe_mora+'~t'+string(ldt_fecha_inicio,'dd/mm/yyyy')+'~t'+string(ldt_fecha_termino,'dd/mm/yyyy')
		OpenWithParm(w_detalle_mora_jefe, ls_string)
	end if
elseif rb_supervisor.checked = true then
	ls_supervisor_mora	= dw_lista.getitemstring(row,'supervisor_cod_sup')
	if not isnull(ls_jefe) and ls_jefe<>'' and isnull(ls_supervisor) and ll_parque>0 and dw_lista.dataobject='dw_lista_supervisor_mora' then
		ls_string			= ls_supervisor_mora+'~t'+string(ldt_fecha_inicio,'dd/mm/yyyy')+'~t'+string(ldt_fecha_termino,'dd/mm/yyyy')
		OpenWithParm(w_detalle_mora_supervisor, ls_string)
	end if
elseif rb_agente.checked = true then
	ls_agente_mora			= dw_lista.getitemstring(row,'agentes_cod_age')
	if not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_supervisor) and ls_supervisor<>'' and ll_parque>0 and dw_lista.dataobject='dw_lista_agente_mora' then
		ls_string			= ls_agente_mora+'~t'+string(ldt_fecha_inicio,'dd/mm/yyyy')+'~t'+string(ldt_fecha_termino,'dd/mm/yyyy')
		OpenWithParm(w_detalle_mora_agente, ls_string)
	end if
end if
SetPointer(Arrow!)
end event

type gb_periodo from groupbox within w_cartera_morosa
integer x = 2263
integer y = 12
integer width = 910
integer height = 240
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Período"
end type

