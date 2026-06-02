forward
global type w_listado_agentes_gps from window
end type
type cb_imprimir from commandbutton within w_listado_agentes_gps
end type
type cb_limpiar from commandbutton within w_listado_agentes_gps
end type
type cb_ordenar from commandbutton within w_listado_agentes_gps
end type
type dw_3 from datawindow within w_listado_agentes_gps
end type
type st_hasta from statictext within w_listado_agentes_gps
end type
type em_inicio from editmask within w_listado_agentes_gps
end type
type em_termino from editmask within w_listado_agentes_gps
end type
type st_desde from statictext within w_listado_agentes_gps
end type
type p_termino from picture within w_listado_agentes_gps
end type
type pb_aceptar from picturebutton within w_listado_agentes_gps
end type
type cb_cerrar from commandbutton within w_listado_agentes_gps
end type
type dw_lista from datawindow within w_listado_agentes_gps
end type
type gb_periodo from groupbox within w_listado_agentes_gps
end type
type gb_1 from groupbox within w_listado_agentes_gps
end type
type gb_3 from groupbox within w_listado_agentes_gps
end type
end forward

global type w_listado_agentes_gps from window
integer width = 3205
integer height = 2136
boolean titlebar = true
string title = "GPS Prospectos Agente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
cb_ordenar cb_ordenar
dw_3 dw_3
st_hasta st_hasta
em_inicio em_inicio
em_termino em_termino
st_desde st_desde
p_termino p_termino
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_periodo gb_periodo
gb_1 gb_1
gb_3 gb_3
end type
global w_listado_agentes_gps w_listado_agentes_gps

on w_listado_agentes_gps.create
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.cb_ordenar=create cb_ordenar
this.dw_3=create dw_3
this.st_hasta=create st_hasta
this.em_inicio=create em_inicio
this.em_termino=create em_termino
this.st_desde=create st_desde
this.p_termino=create p_termino
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_periodo=create gb_periodo
this.gb_1=create gb_1
this.gb_3=create gb_3
this.Control[]={this.cb_imprimir,&
this.cb_limpiar,&
this.cb_ordenar,&
this.dw_3,&
this.st_hasta,&
this.em_inicio,&
this.em_termino,&
this.st_desde,&
this.p_termino,&
this.pb_aceptar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_periodo,&
this.gb_1,&
this.gb_3}
end on

on w_listado_agentes_gps.destroy
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.cb_ordenar)
destroy(this.dw_3)
destroy(this.st_hasta)
destroy(this.em_inicio)
destroy(this.em_termino)
destroy(this.st_desde)
destroy(this.p_termino)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_periodo)
destroy(this.gb_1)
destroy(this.gb_3)
end on

event open;string ls_nulo,ls_jefe
gf_centrar(w_listado_agentes_gps)

if gl_proceso>=4 then
	dw_3.getchild('cod_jef',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve() = 0 then
		idw_detalle.insertrow(0)
	end if
	dw_3.getchild('cod_sup',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve('')=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_3.getchild('agente',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve('',gs_user)=0 then
		idw_detalle3.insertrow(0)
	end if
	dw_3.insertrow(0)
elseif gl_proceso=3 then
	if sqlca.sqlcode=0 then
		dw_3.getchild('cod_jef',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve() = 0 then
			idw_detalle.insertrow(0)
		end if
		dw_3.getchild('cod_sup',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve('')=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_3.getchild('agente',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve('',gs_user)=0 then
			idw_detalle3.insertrow(0)
		end if
//		dw_3.object.jefe.protect		= 1
//		dw_3.getchild('cod_jefe',idw_detalle)
//		idw_detalle.settransobject(sqlca)
//		if idw_detalle.retrieve()=0 then
//			idw_detalle.insertrow(0)
//		end if
//		dw_3.getchild('cod_sup',idw_detalle2)
//		idw_detalle2.settransobject(sqlca)
//		if idw_detalle2.retrieve(gs_user)=0 then
//			idw_detalle2.insertrow(0)
//		end if
//		dw_3.getchild('agente',idw_detalle3)
//		idw_detalle3.settransobject(sqlca)
//		if idw_detalle3.retrieve(gs_user,'')=0 then
//			idw_detalle3.insertrow(0)
//		end if
//		dw_3.settransobject(sqlca)
//		dw_3.insertrow(0)
//		dw_3.setitem(1,'jefe',gs_user)
//		dw_3.setitem(1,'supervisor',ls_nulo)
//		dw_3.setitem(1,'agente',ls_nulo)
	end if
	dw_lista.reset()
	dw_3.accepttext()
//elseif gl_proceso=2  then
//	if sqlca.sqlcode=0 then
//	//	dw_3.object.parque.protect		= 1
//		dw_3.object.jefe.protect			= 1
//		dw_3.object.supervisor.protect	= 1
//		dw_3.getchild('jefe',idw_detalle)
//		idw_detalle.settransobject(sqlca)
//		if idw_detalle.retrieve()=0 then
//			idw_detalle.insertrow(0)
//		end if
//		dw_3.getchild('supervisor',idw_detalle2)
//		idw_detalle2.settransobject(sqlca)
//		if idw_detalle2.retrieve(ls_jefe)=0 then
//			idw_detalle2.insertrow(0)
//		end if
//		dw_3.getchild('agente',idw_detalle3)
//		idw_detalle3.settransobject(sqlca)
//		if idw_detalle3.retrieve(ls_jefe,gs_user)=0 then
//			idw_detalle3.insertrow(0)
//		end if
//		dw_3.settransobject(sqlca)
//		dw_3.insertrow(0)
////		dw_3.setitem(1,'parque',ll_parque)
//		dw_3.setitem(1,'jefe',ls_jefe)
//		dw_3.setitem(1,'supervisor',gs_user)
//		dw_3.setitem(1,'agente',ls_nulo)
//	end if
//	dw_lista.reset()
//	dw_3.accepttext()
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_listado_agentes_gps)
end if

dw_3.insertrow(0)
dw_lista.accepttext()
em_inicio.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
em_termino.text			= string(gdt_fec_sistema,'dd/mm/yyyy')	
end event

type cb_imprimir from commandbutton within w_listado_agentes_gps
event ue_mousemove pbm_mousemove
integer x = 1394
integer y = 1912
integer width = 261
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_limpiar from commandbutton within w_listado_agentes_gps
integer x = 1778
integer y = 1912
integer width = 261
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_listado_agentes_gps.triggerevent(open!)
end event

type cb_ordenar from commandbutton within w_listado_agentes_gps
integer x = 1134
integer y = 1912
integer width = 261
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type dw_3 from datawindow within w_listado_agentes_gps
integer x = 1399
integer y = 64
integer width = 1253
integer height = 232
integer taborder = 20
string title = "none"
string dataobject = "dwe_jefe_supervisor_agente_vert"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'cod_jef'
		dw_3.accepttext()
		ls_jefe					= dw_3.getitemstring(1,'cod_jef')
		dw_3.getchild('cod_sup',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		idw_detalle3.reset()
		dw_3.setitem(1,'cod_sup',ls_nulo)
		dw_3.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_3.accepttext()
	CASE 'cod_sup'
		dw_3.accepttext()
		ls_jefe					= dw_3.getitemstring(1,'cod_jef')
		ls_supervisor			= dw_3.getitemstring(1,'cod_sup')
		dw_3.getchild('agente',idw_detalle3)
		idw_detalle3.reset()
		dw_3.setitem(1,'agente',ls_nulo)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(ls_supervisor)=0 then
			idw_detalle3.insertrow(0)
		end if
		dw_3.accepttext()
	CASE 'agente'
		dw_3.accepttext()
END CHOOSE
end event

type st_hasta from statictext within w_listado_agentes_gps
integer x = 704
integer y = 80
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

type em_inicio from editmask within w_listado_agentes_gps
integer x = 247
integer y = 72
integer width = 334
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

type em_termino from editmask within w_listado_agentes_gps
integer x = 864
integer y = 72
integer width = 334
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

type st_desde from statictext within w_listado_agentes_gps
integer x = 78
integer y = 80
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

type p_termino from picture within w_listado_agentes_gps
integer x = 1202
integer y = 68
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,ls_fecha_ini
long		ll_mes,ll_ano
datetime	ldt_fecha_fin,ldt_fecha_ini

dw_lista.reset()
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

ldt_fecha_fin						= datetime(date(em_termino.text),time('00:00:00'))
ll_mes								= month(date(ldt_fecha_fin))
ll_ano								= year(date(ldt_fecha_fin))

ls_fecha_ini						= '01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000')
em_inicio.text						= string(ls_fecha_ini)
ldt_fecha_ini						= datetime(date(em_inicio.text),time('00:00:00'))

end event

type pb_aceptar from picturebutton within w_listado_agentes_gps
integer x = 2976
integer y = 168
integer width = 169
integer height = 148
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;//string	ls_base,ls_serie,ls_age_1,ls_age_2,ls_asig_canal,ls_canal_2
long		ll_tot_reg//,ll_indi,ll_count,ll_folio
datetime	ldt_fecha_ini,ldt_fecha_fin
//double	ldb_numero,ldb_pie_pact
//
dw_lista.reset()
ldt_fecha_ini								= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin								= datetime(date(em_termino.text),time('00:00:00'))
ll_tot_reg									= dw_lista.retrieve(ldt_fecha_ini,ldt_fecha_fin)
//if ll_tot_reg=0 then
//	messagebox("Advertencia","No Registra Datos")
//else
//	dw_lista.object.usuario.text		= gs_user
//	for ll_indi = 1 to ll_tot_reg
//		ls_base								= dw_lista.getitemstring(ll_indi,'cadena_codigo')
//		ls_serie								= dw_lista.getitemstring(ll_indi,'oferta_v_serie')
//		ldb_numero							= dw_lista.getitemnumber(ll_indi,'oferta_v_nro_oferta')
//		ls_age_1								= dw_lista.getitemstring(ll_indi,'oferta_v_cod_age')
//		ll_folio								= dw_lista.getitemnumber(ll_indi,'funeraria_pago_comision_folio')
//		ls_age_2								= dw_lista.getitemstring(ll_indi,'comision_compartida_cod_age_2')
//		ll_count								= 0
//		SELECT	"AGENTES"."CANAL"  
//    	INTO 		:ls_canal_2  
//    	FROM 		"AGENTES"  
//   	WHERE 	"AGENTES"."COD_AGE" = :ls_age_1
//		USING		sqlca;
//		if sqlca.sqlcode=0 then
//		end if
//		if ll_folio>0 and (ls_age_2='' or isnull(ls_age_2)) then
//			ls_asig_canal					= 'C.Funer'
//		elseif (isnull(ll_folio) or ll_folio=0 ) and (ls_age_2<>'' or not isnull(ls_age_2)) then
//			ls_asig_canal					= 'C.Compar'
//		else
//			if ls_canal_2='NF' then
//				ls_asig_canal				= 'C.Dir.NF'
//			else
//				ls_asig_canal				= 'C.Dir.NI'
//			end if
//		end if
//		dw_lista.setitem(ll_indi,"c_origen_venta",ls_asig_canal)
//		DECLARE x1 CURSOR FOR
//		SELECT	"DETALLE_PAGO_PIE"."MONTO_PIE_PAGADO_UF"  
//    	FROM		"DETALLE_PAGO_PIE"  
//   	WHERE		( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
//         		( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
//         		( "DETALLE_PAGO_PIE"."NUMERO" = :ldb_numero )
//		USING		sqlca;
//		open x1;
//		if sqlca.sqlcode=0 then
//			DO WHILE sqlca.sqlcode=0
//			fetch x1 INTO	:ldb_pie_pact;
//				if ldb_pie_pact > 0 and not isnull(ldb_pie_pact) then
//					ll_count++
//					if ll_count=1 then
//						dw_lista.setitem(ll_indi,"c_pie_1",ldb_pie_pact)
//					elseif ll_count=2 then
//						dw_lista.setitem(ll_indi,"c_pie_2",ldb_pie_pact)
//					elseif ll_count=3 then
//						dw_lista.setitem(ll_indi,"c_pie_3",ldb_pie_pact)
//					elseif ll_count=4 then
//						dw_lista.setitem(ll_indi,"c_pie_4",ldb_pie_pact)
//					end if
//				end if
//				setnull(ldb_pie_pact)
//			LOOP
//		end if
//		close x1;
//	next
//end if
end event

type cb_cerrar from commandbutton within w_listado_agentes_gps
integer x = 2862
integer y = 1900
integer width = 283
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_listado_agentes_gps)
end event

type dw_lista from datawindow within w_listado_agentes_gps
integer x = 46
integer y = 332
integer width = 3104
integer height = 1516
integer taborder = 10
string title = "none"
string dataobject = "dw_informe_gestiones_gps"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_periodo from groupbox within w_listado_agentes_gps
integer x = 41
integer y = 8
integer width = 1335
integer height = 180
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Periodo"
end type

type gb_1 from groupbox within w_listado_agentes_gps
integer x = 1381
integer y = 8
integer width = 1280
integer height = 308
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Agente"
end type

type gb_3 from groupbox within w_listado_agentes_gps
integer x = 1102
integer y = 1868
integer width = 974
integer height = 148
integer taborder = 50
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

