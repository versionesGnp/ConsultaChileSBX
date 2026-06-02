forward
global type w_comision_pagadas from window
end type
type rb_aumento from radiobutton within w_comision_pagadas
end type
type rb_liberador from radiobutton within w_comision_pagadas
end type
type rb_promesa from radiobutton within w_comision_pagadas
end type
type st_hasta from statictext within w_comision_pagadas
end type
type em_inicio from editmask within w_comision_pagadas
end type
type em_termino from editmask within w_comision_pagadas
end type
type st_desde from statictext within w_comision_pagadas
end type
type p_termino from picture within w_comision_pagadas
end type
type cb_ordenar from commandbutton within w_comision_pagadas
end type
type cb_limpiar from commandbutton within w_comision_pagadas
end type
type cb_imprimir from commandbutton within w_comision_pagadas
end type
type dw_seleccion from datawindow within w_comision_pagadas
end type
type cb_cta_cte from commandbutton within w_comision_pagadas
end type
type pb_aceptar from picturebutton within w_comision_pagadas
end type
type cb_cerrar from commandbutton within w_comision_pagadas
end type
type dw_comision from datawindow within w_comision_pagadas
end type
type gb_3 from groupbox within w_comision_pagadas
end type
type gb_periodo from groupbox within w_comision_pagadas
end type
type gb_tipo_contrato from groupbox within w_comision_pagadas
end type
end forward

global type w_comision_pagadas from window
integer width = 3982
integer height = 2268
boolean titlebar = true
string title = "Revisión Comisiones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
rb_aumento rb_aumento
rb_liberador rb_liberador
rb_promesa rb_promesa
st_hasta st_hasta
em_inicio em_inicio
em_termino em_termino
st_desde st_desde
p_termino p_termino
cb_ordenar cb_ordenar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
dw_seleccion dw_seleccion
cb_cta_cte cb_cta_cte
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
dw_comision dw_comision
gb_3 gb_3
gb_periodo gb_periodo
gb_tipo_contrato gb_tipo_contrato
end type
global w_comision_pagadas w_comision_pagadas

type variables
Long	il_mes,il_ano,il_row
end variables

on w_comision_pagadas.create
this.rb_aumento=create rb_aumento
this.rb_liberador=create rb_liberador
this.rb_promesa=create rb_promesa
this.st_hasta=create st_hasta
this.em_inicio=create em_inicio
this.em_termino=create em_termino
this.st_desde=create st_desde
this.p_termino=create p_termino
this.cb_ordenar=create cb_ordenar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.dw_seleccion=create dw_seleccion
this.cb_cta_cte=create cb_cta_cte
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_comision=create dw_comision
this.gb_3=create gb_3
this.gb_periodo=create gb_periodo
this.gb_tipo_contrato=create gb_tipo_contrato
this.Control[]={this.rb_aumento,&
this.rb_liberador,&
this.rb_promesa,&
this.st_hasta,&
this.em_inicio,&
this.em_termino,&
this.st_desde,&
this.p_termino,&
this.cb_ordenar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.dw_seleccion,&
this.cb_cta_cte,&
this.pb_aceptar,&
this.cb_cerrar,&
this.dw_comision,&
this.gb_3,&
this.gb_periodo,&
this.gb_tipo_contrato}
end on

on w_comision_pagadas.destroy
destroy(this.rb_aumento)
destroy(this.rb_liberador)
destroy(this.rb_promesa)
destroy(this.st_hasta)
destroy(this.em_inicio)
destroy(this.em_termino)
destroy(this.st_desde)
destroy(this.p_termino)
destroy(this.cb_ordenar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.dw_seleccion)
destroy(this.cb_cta_cte)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_comision)
destroy(this.gb_3)
destroy(this.gb_periodo)
destroy(this.gb_tipo_contrato)
end on

event open;string	ls_nulo,ls_fecha_comi_ant,ls_jefe
long		ll_nulo,ll_mes_comi,ll_ano_comi,ll_mes_comi_ant,ll_ano_comi_ant,ll_parque
datetime	ldt_fecha_comi,ldt_fecha_comi_ant

Setnull(ls_nulo);Setnull(ll_nulo)
gf_centrar(w_comision_pagadas)
dw_comision.settransobject(sqlca)
SELECT	MAX("RES_COMI"."FECHA") 
INTO		:ldt_fecha_comi  
FROM 		"RES_COMI"  
WHERE		(	"COD_CONTABLE" = '022' OR "COD_CONTABLE" = '023' OR "COD_CONTABLE" = '036' OR "COD_CONTABLE" = '037' OR "COD_CONTABLE" = '089' OR "COD_CONTABLE" = '090') 
USING		sqlca;
if sqlca.sqlcode = 0 then
	if not isnull(ldt_fecha_comi) then
		em_termino.text			= string(ldt_fecha_comi,'dd/mm/yyyy')
		ll_mes_comi					= month(date(ldt_fecha_comi))
		ll_ano_comi					= year(date(ldt_fecha_comi))
		if ll_mes_comi = 1 then
			ll_mes_comi_ant 		= ll_mes_comi + 11
			ll_ano_comi_ant 		= ll_ano_comi - 1
			ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
			em_inicio.text			= string(ls_fecha_comi_ant)
			ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
		else
			ll_mes_comi_ant 		= ll_mes_comi - 1
			ll_ano_comi_ant 		= ll_ano_comi
			ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
			em_inicio.text			= string(ls_fecha_comi_ant)
			ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
		end if
	end if
end if
if gl_proceso>=4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque	= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque	= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque	= 801
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
	dw_seleccion.getchild('agente',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve(ll_parque,'','')=0 then
		idw_detalle3.insertrow(0)
	end if
	dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'parque',ll_nulo)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	dw_seleccion.setitem(1,'agente',ls_nulo)
	dw_comision.reset()
	dw_seleccion.accepttext()
elseif gl_proceso=3 then
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect	= 1
		dw_seleccion.object.jefe.protect		= 1
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
		dw_seleccion.getchild('agente',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(ll_parque,gs_user,'')=0 then
			idw_detalle3.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',gs_user)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
	end if
	dw_comision.reset()
	dw_seleccion.accepttext()
elseif gl_proceso=2  then
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
		dw_seleccion.getchild('agente',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(ll_parque,ls_jefe,gs_user)=0 then
			idw_detalle3.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',ls_jefe)
		dw_seleccion.setitem(1,'supervisor',gs_user)
		dw_seleccion.setitem(1,'agente',ls_nulo)
	end if
	dw_comision.reset()
	dw_seleccion.accepttext()
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_comision_pagadas)
end if

end event

type rb_aumento from radiobutton within w_comision_pagadas
integer x = 59
integer y = 220
integer width = 576
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Aumento Capacidad."
end type

event clicked;dw_comision.reset()
end event

type rb_liberador from radiobutton within w_comision_pagadas
integer x = 59
integer y = 152
integer width = 576
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Liberador Mantención"
end type

event clicked;dw_comision.reset()
end event

type rb_promesa from radiobutton within w_comision_pagadas
integer x = 59
integer y = 84
integer width = 530
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Promesa Ventas"
boolean checked = true
end type

event clicked;dw_comision.reset()
end event

type st_hasta from statictext within w_comision_pagadas
integer x = 1147
integer y = 112
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

type em_inicio from editmask within w_comision_pagadas
integer x = 722
integer y = 180
integer width = 315
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
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type em_termino from editmask within w_comision_pagadas
integer x = 1051
integer y = 180
integer width = 315
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

event modified;string	ls_fecha_comi_ini
long		ll_mes_comi,ll_ano_comi,ll_mes_comi_ini,ll_ano_comi_ini
datetime	ldt_fecha_comi,ldt_fecha_comi_ini

dw_comision.reset()


ldt_fecha_comi		= datetime(date(em_termino.text),time('00:00:00'))

if not isnull(ldt_fecha_comi) then
	ll_mes_comi					= month(date(datetime(date(em_termino.text),time('00:00:00'))))
	ll_ano_comi					= year(date(datetime(date(em_termino.text),time('00:00:00'))))
	
	if ll_mes_comi = 1 then
		ll_mes_comi_ini 		= ll_mes_comi + 11
		ll_ano_comi_ini 		= ll_ano_comi - 1
		ls_fecha_comi_ini		= '16/'+ string(ll_mes_comi_ini,'00')+ '/' +string(ll_ano_comi_ini,'0000')
		em_inicio.text			= string(ls_fecha_comi_ini)
		ldt_fecha_comi_ini	= datetime(date(em_inicio.text),time('00:00:00'))
	else
		ll_mes_comi_ini 		= ll_mes_comi - 1
		ll_ano_comi_ini 		= ll_ano_comi
		ls_fecha_comi_ini		= '16/'+ string(ll_mes_comi_ini,'00')+ '/' +string(ll_ano_comi_ini,'0000')
		em_inicio.text			= string(ls_fecha_comi_ini)
		ldt_fecha_comi_ini	= datetime(date(em_inicio.text),time('00:00:00'))
	end if
end if

end event

type st_desde from statictext within w_comision_pagadas
integer x = 805
integer y = 116
integer width = 169
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

type p_termino from picture within w_comision_pagadas
integer x = 1376
integer y = 180
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,ls_fecha_comi_ant
long		ll_mes_comi,ll_ano_comi,ll_mes_comi_ant,ll_ano_comi_ant
datetime	ldt_fecha_comi,ldt_fecha_comi_ant

dw_comision.reset()
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
dw_comision.reset()

ldt_fecha_comi		= datetime(date(em_termino.text),time('00:00:00'))

if not isnull(ldt_fecha_comi) then
	ll_mes_comi					= month(date(ldt_fecha_comi))
	ll_ano_comi					= year(date(ldt_fecha_comi))
	if ll_mes_comi = 1 then
		ll_mes_comi_ant 		= ll_mes_comi + 11
		ll_ano_comi_ant 		= ll_ano_comi - 1
		ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
		em_inicio.text			= string(ls_fecha_comi_ant)
		ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
	else
		ll_mes_comi_ant 		= ll_mes_comi - 1
		ll_ano_comi_ant 		= ll_ano_comi
		ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
		em_inicio.text			= string(ls_fecha_comi_ant)
		ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
	end if
end if
end event

type cb_ordenar from commandbutton within w_comision_pagadas
integer x = 1545
integer y = 2024
integer width = 261
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_comision.rowcount() > 0 then
	setnull (nulo)
	dw_comision.SETSORT(NULO)
	dw_comision.SORT()
end if
end event

type cb_limpiar from commandbutton within w_comision_pagadas
integer x = 2190
integer y = 2024
integer width = 261
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_comision_pagadas.triggerevent(open!)
end event

type cb_imprimir from commandbutton within w_comision_pagadas
event ue_mousemove pbm_mousemove
integer x = 1806
integer y = 2024
integer width = 261
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_comision.rowcount()>0 then
	f_Print( dw_comision )
end if
end event

type dw_seleccion from datawindow within w_comision_pagadas
integer x = 1504
integer y = 48
integer width = 2286
integer height = 264
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_opciones"
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
		dw_comision.reset()
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
		dw_comision.reset()
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
		dw_comision.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		ls_supervisor			= dw_seleccion.getitemstring(1,'supervisor')
		dw_seleccion.getchild('agente',idw_detalle3)
		idw_detalle3.reset()
		dw_seleccion.setitem(1,'agente',ls_nulo)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(ll_parque,ls_jefe,ls_supervisor)=0 then
			idw_detalle3.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'agente'
		dw_seleccion.accepttext()
		dw_comision.reset()
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

type cb_cta_cte from commandbutton within w_comision_pagadas
integer x = 41
integer y = 2012
integer width = 457
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;if dw_comision.rowcount() > 0 then
	if il_row>0 then
		gs_base						= dw_comision.getitemstring(il_row,'cadena_codigo')
		gs_serie						= dw_comision.getitemstring(il_row,'res_comi_serie')
		gi_numero 					= dw_comision.getitemnumber(il_row,'res_comi_contrato')
		gi_rut						= dw_comision.getitemnumber(il_row,'cadena_rut')
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	end if
end if
end event

type pb_aceptar from picturebutton within w_comision_pagadas
integer x = 3794
integer y = 188
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

event clicked;string	ls_jefe,ls_superv,ls_agente,ls_filtro
long		ll_parque,ll_tot_reg
datetime	ldt_fecha_ini,ldt_fecha_term,ldt_fecha_comi

dw_comision.reset()
dw_seleccion.accepttext()
SetPointer(HourGlass!)
ll_parque														= dw_seleccion.getitemnumber(1,'parque')
ls_jefe														= dw_seleccion.getitemstring(1,'jefe')
ls_superv													= dw_seleccion.getitemstring(1,'supervisor')
ls_agente													= dw_seleccion.getitemstring(1,'agente')
ldt_fecha_ini												= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_term												= datetime(date(em_termino.text),time('00:00:00'))
SELECT	MAX("RES_COMI"."FECHA") 
INTO		:ldt_fecha_comi  
FROM 		"RES_COMI"  
WHERE		"RES_COMI"."FECHA" = :ldt_fecha_term AND
			(	"RES_COMI"."COD_CONTABLE" = '022' OR 
				"RES_COMI"."COD_CONTABLE" = '023' OR
				"RES_COMI"."COD_CONTABLE" = '036' OR
				"RES_COMI"."COD_CONTABLE" = '037' OR
				"RES_COMI"."COD_CONTABLE" = '066' OR
				"RES_COMI"."COD_CONTABLE" = '067' OR
				"RES_COMI"."COD_CONTABLE" = '068' OR
				"RES_COMI"."COD_CONTABLE" = '089' OR
				"RES_COMI"."COD_CONTABLE" = '090' OR
				"RES_COMI"."COD_CONTABLE" = '050' OR
				"RES_COMI"."COD_CONTABLE" = '028' OR
				"RES_COMI"."COD_CONTABLE" = '053' )
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldt_fecha_comi) then
		if not isnull(ll_parque) and ll_parque>0 and not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_superv) and ls_superv <>'' and not isnull (ls_agente) and ls_agente<>'' then
			if rb_promesa.checked 						= true then
				dw_comision.dataobject					='dw_comisiones_vtas_agtes_promesa'
				dw_comision.settransobject(sqlca)
				ll_tot_reg									= dw_comision.retrieve(ldt_fecha_term)
				dw_comision.object.usuario.text		= gs_user
				if dw_comision.rowcount() > 0 then
					ls_filtro 									= "agentes_cod_age = '"+ls_agente+"'"
					dw_comision.SetFilter(ls_filtro)
					dw_comision.Filter( )
					dw_comision.GroupCalc()
					dw_comision.SetRedraw(true)
					dw_comision.accepttext()
					ll_tot_reg								= dw_comision.rowcount()
					if ll_tot_reg=0 then
						messagebox('Advertencia','No Registra Comisión a Pago Por Promesa Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
					end if
				end if
			elseif rb_liberador.checked 					= true then
				dw_comision.dataobject					='dw_comisiones_vtas_agtes_liberador'
				dw_comision.settransobject(sqlca)
				ll_tot_reg									= dw_comision.retrieve(ldt_fecha_term)
				dw_comision.object.usuario.text		= gs_user
				if dw_comision.rowcount() > 0 then
					ls_filtro 									= "agentes_cod_age = '"+ls_agente+"'"
					dw_comision.SetFilter(ls_filtro)
					dw_comision.Filter( )
					dw_comision.GroupCalc()
					dw_comision.SetRedraw(true)
					dw_comision.accepttext()
					ll_tot_reg								= dw_comision.rowcount()
					if ll_tot_reg=0 then
						messagebox('Advertencia','No Registra Comisión a Pago Por Liberador Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
					end if
				end if
			elseif rb_aumento.checked 					= true then
				dw_comision.dataobject					='dw_comisiones_vtas_agtes_aumento'
				dw_comision.settransobject(sqlca)
				ll_tot_reg									= dw_comision.retrieve(ldt_fecha_term)
				dw_comision.object.usuario.text		= gs_user
				if dw_comision.rowcount() > 0 then
					ls_filtro 									= "agentes_cod_age = '"+ls_agente+"'"
					dw_comision.SetFilter(ls_filtro)
					dw_comision.Filter( )
					dw_comision.GroupCalc()
					dw_comision.SetRedraw(true)
					dw_comision.accepttext()
					ll_tot_reg								= dw_comision.rowcount()
					if ll_tot_reg=0 then
						messagebox('Advertencia','No Registra Comisión a Pago Por Liberador Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
					end if
				end if	
			end if
		elseif not isnull(ll_parque) and ll_parque>0 and not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_superv) and ls_superv <>'' and isnull (ls_agente) then
			if rb_promesa.checked 						= true then
				dw_comision.dataobject					='dw_comisiones_vtas_sup_promesa'
				dw_comision.settransobject(sqlca)
				ll_tot_reg									= dw_comision.retrieve(ldt_fecha_term)
				dw_comision.object.usuario.text		= gs_user
				if dw_comision.rowcount() > 0 then
					ls_filtro 									= "supervisor_cod_sup = '"+ls_superv+"'"
					dw_comision.SetFilter(ls_filtro)
					dw_comision.Filter( )
					dw_comision.GroupCalc()
					dw_comision.SetRedraw(true)
					dw_comision.accepttext()
					ll_tot_reg								= dw_comision.rowcount()
					if ll_tot_reg=0 then
						messagebox('Advertencia','No Registra Comisión a Pago Por Promesa Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
					end if
				end if
			elseif rb_liberador.checked 					= true then
				dw_comision.dataobject					='dw_comisiones_vtas_sup_liberador'
				dw_comision.settransobject(sqlca)
				ll_tot_reg									= dw_comision.retrieve(ldt_fecha_term)
				dw_comision.object.usuario.text		= gs_user
				if dw_comision.rowcount() > 0 then
					ls_filtro 									= "supervisor_cod_sup = '"+ls_superv+"'"
					dw_comision.SetFilter(ls_filtro)
					dw_comision.Filter( )
					dw_comision.GroupCalc()
					dw_comision.SetRedraw(true)
					dw_comision.accepttext()
					ll_tot_reg								= dw_comision.rowcount()
					if ll_tot_reg=0 then
						messagebox('Advertencia','No Registra Comisión a Pago Por Liberador Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
					end if
				end if
			elseif rb_aumento.checked 					= true then
				dw_comision.dataobject					='dw_comisiones_vtas_sup_aumento'
				dw_comision.settransobject(sqlca)
				ll_tot_reg									= dw_comision.retrieve(ldt_fecha_term)
				dw_comision.object.usuario.text		= gs_user
				if dw_comision.rowcount() > 0 then
					ls_filtro 									= "supervisor_cod_sup = '"+ls_superv+"'"
					dw_comision.SetFilter(ls_filtro)
					dw_comision.Filter( )
					dw_comision.GroupCalc()
					dw_comision.SetRedraw(true)
					dw_comision.accepttext()
					ll_tot_reg								= dw_comision.rowcount()
					if ll_tot_reg=0 then
						messagebox('Advertencia','No Registra Comisión a Pago Por Liberador Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
					end if
				end if	
			end if
		elseif not isnull(ll_parque) and ll_parque>0 and not isnull(ls_jefe) and ls_jefe<>'' and isnull(ls_superv) and isnull (ls_agente) then
			if rb_promesa.checked 						= true then
				dw_comision.dataobject					='dw_comisiones_vtas_jefe_promesa'
				dw_comision.settransobject(sqlca)
				ll_tot_reg									= dw_comision.retrieve(ldt_fecha_term)
				dw_comision.object.usuario.text		= gs_user
				if dw_comision.rowcount() > 0 then
					ls_filtro 								= "jefe_ventas_jefe_ventas = '"+ls_jefe+"'"
					dw_comision.SetFilter(ls_filtro)
					dw_comision.Filter( )
					dw_comision.GroupCalc()
					dw_comision.SetRedraw(true)
					dw_comision.accepttext()
					ll_tot_reg								= dw_comision.rowcount()
					if ll_tot_reg=0 then
						messagebox('Advertencia','No Registra Comisión a Pago Por Promesa Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
					end if
				end if
			elseif rb_liberador.checked 					= true then
				dw_comision.dataobject					='dw_comisiones_vtas_jefe_liberador'
				dw_comision.settransobject(sqlca)
				ll_tot_reg									= dw_comision.retrieve(ldt_fecha_term)
				dw_comision.object.usuario.text		= gs_user
				if dw_comision.rowcount() > 0 then
					ls_filtro 									= "jefe_ventas_jefe_ventas = '"+ls_jefe+"'"
					dw_comision.SetFilter(ls_filtro)
					dw_comision.Filter( )
					dw_comision.GroupCalc()
					dw_comision.SetRedraw(true)
					dw_comision.accepttext()
					ll_tot_reg								= dw_comision.rowcount()
					if ll_tot_reg=0 then
						messagebox('Advertencia','No Registra Comisión a Pago Por Liberador Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
					end if
				end if
			elseif rb_aumento.checked 					= true then
				dw_comision.dataobject					='dw_comisiones_vtas_jefe_aumento'
				dw_comision.settransobject(sqlca)
				ll_tot_reg									= dw_comision.retrieve(ldt_fecha_term)
				dw_comision.object.usuario.text		= gs_user
				if dw_comision.rowcount() > 0 then
					ls_filtro 									= "jefe_ventas_jefe_ventas = '"+ls_jefe+"'"
					dw_comision.SetFilter(ls_filtro)
					dw_comision.Filter( )
					dw_comision.GroupCalc()
					dw_comision.SetRedraw(true)
					dw_comision.accepttext()
					ll_tot_reg								= dw_comision.rowcount()
					if ll_tot_reg=0 then
						messagebox('Advertencia','No Registra Comisión a Pago Por Liberador Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
					end if
				end if	
			end if
		else
			if isnull(ll_parque) or ll_parque=0 then
				messagebox("Advertencia", "Debe Ingresar Parque")
				dw_seleccion.setfocus()
				dw_seleccion.setcolumn('parque')
			elseif isnull(ls_jefe) or ls_jefe='' then
				messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
				dw_seleccion.setfocus()
				dw_seleccion.setcolumn('jefe')
			end if
		end if
	else
		messagebox('Advertencia','No Existe Proceso de Comisiones Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
	end if
end if
end event

type cb_cerrar from commandbutton within w_comision_pagadas
integer x = 3611
integer y = 2012
integer width = 315
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_pagadas)
end event

type dw_comision from datawindow within w_comision_pagadas
integer x = 37
integer y = 336
integer width = 3890
integer height = 1632
integer taborder = 30
string title = "none"
string dataobject = "dw_comisiones_vtas_sup_liberador"
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

close(w_cuenta_corriente_oferta)
close(w_cuenta_corriente_liberador)

end event

event doubleclicked;if il_row>0 then
	cb_cta_cte.triggerevent(clicked!)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

close(w_cuenta_corriente_oferta)
close(w_cuenta_corriente_liberador)

end event

type gb_3 from groupbox within w_comision_pagadas
integer x = 1513
integer y = 1972
integer width = 974
integer height = 164
integer taborder = 40
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_periodo from groupbox within w_comision_pagadas
integer x = 699
integer y = 12
integer width = 786
integer height = 300
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Período"
end type

type gb_tipo_contrato from groupbox within w_comision_pagadas
integer x = 37
integer y = 12
integer width = 631
integer height = 300
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Tipo Contrato"
end type

