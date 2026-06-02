forward
global type w_agenda_crematorio_individual from window
end type
type cb_grabar from commandbutton within w_agenda_crematorio_individual
end type
type cb_cerrar from commandbutton within w_agenda_crematorio_individual
end type
type dw_ingreso from datawindow within w_agenda_crematorio_individual
end type
end forward

global type w_agenda_crematorio_individual from window
integer width = 3886
integer height = 1536
boolean titlebar = true
string title = "Ingreso Agenda Crematorio"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_ingreso dw_ingreso
end type
global w_agenda_crematorio_individual w_agenda_crematorio_individual

type variables
datetime		idt_fecha
Long			il_hora_ini,il_min_ini,il_hora_fin,il_min_fin,il_parque
Double		il_rut_fall
String			is_tipo
end variables

on w_agenda_crematorio_individual.create
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.cb_grabar,&
this.cb_cerrar,&
this.dw_ingreso}
end on

on w_agenda_crematorio_individual.destroy
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_ingreso)
end on

event open;Long		ll_new
gf_centrar(w_agenda_crematorio_individual)
idt_fecha							= datetime(substr(1,1,Message.StringParm))
il_hora_ini						= long(substr(1,2,Message.StringParm))
il_min_ini						= long(substr(1,3,Message.StringParm))
il_hora_fin						= long(substr(1,4,Message.StringParm))
il_min_fin						= long(substr(1,5,Message.StringParm))
il_rut_fall							= long(substr(1,6,Message.StringParm))
is_tipo							= substr(1,7,Message.StringParm)
il_parque							= 142
if is_tipo='C' then	//Crematorio
	dw_ingreso.dataobject						= 'dw_fc_ingreso_agenda_crematorio'
	w_agenda_crematorio_individual.title		= 'Ingreso Agenda Manual Crematorio'
elseif is_tipo='I' then	//Capilla
	dw_ingreso.dataobject	= 'dw_fc_ingreso_agenda_capilla'
	w_agenda_crematorio_individual.title		= 'Ingreso Agenda Manual Capilla'
elseif is_tipo='P' then	//Pergola
	dw_ingreso.dataobject	= 'dw_fc_ingreso_agenda_pergola'
	w_agenda_crematorio_individual.title		= 'Ingreso Agenda Manual Pergola'
elseif is_tipo='V' or is_tipo='R' then	//Visualiza&Retiro Cenizas
	dw_ingreso.dataobject	= 'dw_fc_ingreso_agenda_visualiza'
	w_agenda_crematorio_individual.title		= 'Ingreso Agenda Manual Visualización'
end if
dw_ingreso.settransobject(sqlca)
if il_rut_fall > 0 then
	dw_ingreso.retrieve(il_rut_fall)
	dw_ingreso.Object.rut_titular.protect		= 1
	dw_ingreso.Object.rut_fallecido.protect	= 1
else
	ll_new		= dw_ingreso.insertrow(0)
	dw_ingreso.setitem(ll_new,'base','G')
	dw_ingreso.setitem(ll_new,'serie','I')
	dw_ingreso.setitem(ll_new,'numero',1)
	dw_ingreso.setitem(ll_new,'folio_crematorio',1)
	dw_ingreso.setitem(ll_new,'fecha_cremacion',idt_fecha)
	dw_ingreso.setitem(ll_new,'hora_cineracion',il_hora_ini)
	dw_ingreso.setitem(ll_new,'minuto_cineracion',il_min_ini)
	dw_ingreso.setitem(ll_new,'hora_cineracion_fin',il_hora_fin)
	dw_ingreso.setitem(ll_new,'minuto_cineracion_fin',il_min_fin)
	
	dw_ingreso.setitem(ll_new,'fecha_visualiza',idt_fecha)
	dw_ingreso.setitem(ll_new,'hora_ini_visualiza',il_hora_ini)
	dw_ingreso.setitem(ll_new,'minuto_ini_visualiza',il_min_ini)
	dw_ingreso.setitem(ll_new,'hora_fin_visualiza',il_hora_fin)
	dw_ingreso.setitem(ll_new,'minuto_fin_visualiza',il_min_fin)
	
	dw_ingreso.setitem(ll_new,'fecha_capilla',idt_fecha)
	dw_ingreso.setitem(ll_new,'hora_ini_capilla',il_hora_ini)
	dw_ingreso.setitem(ll_new,'minuto_ini_capilla',il_min_ini)
	dw_ingreso.setitem(ll_new,'hora_fin_capilla',il_hora_fin)
	dw_ingreso.setitem(ll_new,'minuto_fin_capilla',il_min_fin)
	
	dw_ingreso.setitem(ll_new,'fecha_pergola',idt_fecha)
	dw_ingreso.setitem(ll_new,'hora_ini_pergola',il_hora_ini)
	dw_ingreso.setitem(ll_new,'minuto_ini_pergola',il_min_ini)
	dw_ingreso.setitem(ll_new,'hora_fin_pergola',il_hora_fin)
	dw_ingreso.setitem(ll_new,'minuto_fin_pergola',il_min_fin)
	
	dw_ingreso.setitem(ll_new,'cod_parque',il_parque)
	dw_ingreso.setitem(ll_new,'ejecutivo',gs_user)
	dw_ingreso.setitem(ll_new,'estado_gestion',1)
	dw_ingreso.setitem(ll_new,'sw_orador',0)
	dw_ingreso.setitem(ll_new,'sw_covid',1)
	dw_ingreso.setitem(ll_new,'sw_protocolo',1)
	dw_ingreso.setitem(ll_new,'sw_orador',0)
	dw_ingreso.setitem(ll_new,'agenda_capilla','S')
	dw_ingreso.setitem(ll_new,'agenda_pergola','S')
	dw_ingreso.setitem(ll_new,'agenda_visualiza','S')
	dw_ingreso.setitem(ll_new,'agenda_externa','S')
	dw_ingreso.setitem(ll_new,'estado_reg','P')
end if
dw_ingreso.accepttext()
dw_ingreso.setfocus()

end event

type cb_grabar from commandbutton within w_agenda_crematorio_individual
integer x = 27
integer y = 1292
integer width = 320
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;String		ls_agenda_pergola,ls_agenda_capilla,ls_pasa='S'
Long		ll_rut_titular	,ll_rut_fallecido,ll_estado_gestion,ll_hora_ini_visualiza,ll_minuto_ini_visualiza,ll_hora_fin_visualiza,ll_minuto_fin_visualiza,&
			ll_cod_parque,ll_codigo_religion,ll_sw_orador,ll_sw_covid,ll_sw_protocolo,ll_hora_ini_capilla,ll_minuto_ini_capilla,ll_hora_fin_capilla,&
			ll_minuto_fin_capilla,ll_hora_ini_pergola,ll_minuto_ini_pergola,ll_hora_fin_pergola,ll_minuto_fin_pergola
String		ls_nombre_fallecido,ls_ap_paterno_fallecido,ls_ap_materno_fallecido,ls_observacion,ls_agenda_visualiza
datetime	ldt_fecha_defuncion,ldt_fecha_visualiza,ldt_fecha_capilla,ldt_fecha_pergola

ll_rut_titular					= dw_ingreso.getitemnumber(1,'rut_titular')
ll_rut_fallecido				= dw_ingreso.getitemnumber(1,'rut_fallecido')
ls_nombre_fallecido		= dw_ingreso.getitemstring(1,'nombre_fallecido')
ls_ap_paterno_fallecido	= dw_ingreso.getitemstring(1,'ap_paterno_fallecido')
ls_ap_materno_fallecido	= dw_ingreso.getitemstring(1,'ap_materno_fallecido')
ldt_fecha_defuncion		= dw_ingreso.getitemdatetime(1,'fecha_defuncion')
ll_estado_gestion			= dw_ingreso.getitemnumber(1,'estado_gestion')
ls_observacion				= dw_ingreso.getitemstring(1,'observacion')
ll_cod_parque				= dw_ingreso.getitemnumber(1,'cod_parque')
ll_codigo_religion			= dw_ingreso.getitemnumber(1,'codigo_religion')
ll_sw_orador				= dw_ingreso.getitemnumber(1,'sw_orador')
ll_sw_covid					= dw_ingreso.getitemnumber(1,'sw_covid')
ll_sw_protocolo				= dw_ingreso.getitemnumber(1,'sw_protocolo')
ls_agenda_visualiza		= dw_ingreso.getitemstring(1,'agenda_visualiza')
ldt_fecha_visualiza			= dw_ingreso.getitemdatetime(1,'fecha_visualiza')
ll_hora_ini_visualiza		= dw_ingreso.getitemnumber(1,'hora_ini_visualiza')
ll_minuto_ini_visualiza	= dw_ingreso.getitemnumber(1,'minuto_ini_visualiza')
ll_hora_fin_visualiza		= dw_ingreso.getitemnumber(1,'hora_fin_visualiza')
ll_minuto_fin_visualiza	= dw_ingreso.getitemnumber(1,'minuto_fin_visualiza')
ls_agenda_capilla			= dw_ingreso.getitemstring(1,'agenda_capilla')
ldt_fecha_capilla			= dw_ingreso.getitemdatetime(1,'fecha_capilla')
ll_hora_ini_capilla			= dw_ingreso.getitemnumber(1,'hora_ini_capilla')
ll_minuto_ini_capilla		= dw_ingreso.getitemnumber(1,'minuto_ini_capilla')
ll_hora_fin_capilla			= dw_ingreso.getitemnumber(1,'hora_fin_capilla')
ll_minuto_fin_capilla		= dw_ingreso.getitemnumber(1,'minuto_fin_capilla')
ls_agenda_pergola		= dw_ingreso.getitemstring(1,'agenda_pergola')
ldt_fecha_pergola			= dw_ingreso.getitemdatetime(1,'fecha_pergola')
ll_hora_ini_pergola		= dw_ingreso.getitemnumber(1,'hora_ini_pergola')
ll_minuto_ini_pergola		= dw_ingreso.getitemnumber(1,'minuto_ini_pergola')
ll_hora_fin_pergola		= dw_ingreso.getitemnumber(1,'hora_fin_pergola')
ll_minuto_fin_pergola		= dw_ingreso.getitemnumber(1,'minuto_fin_pergola')
if isnull(ll_rut_titular) then
	messagebox("Advertencia","Debe Ingresar Rut Titular")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('rut_titular')
	ls_pasa					='N'
elseif isnull(ll_rut_fallecido) then
	messagebox("Advertencia","Debe Ingresar Rut Fallecido")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('rut_fallecido')
	ls_pasa					='N'
elseif isnull(ls_nombre_fallecido) then
	messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('nombre_fallecido')
	ls_pasa					='N'
elseif isnull(ls_ap_paterno_fallecido) then
	messagebox("Advertencia","Debe Ingresar Apellido Paterno Fallecido")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('ap_paterno_fallecido')
	ls_pasa					='N'
elseif isnull(ls_ap_materno_fallecido) then
	messagebox("Advertencia","Debe Ingresar Apellido Materno Fallecido")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('ap_materno_fallecido')
	ls_pasa					='N'
elseif isnull(ldt_fecha_defuncion) then
	messagebox("Advertencia","Debe Ingresar fecha Defunción")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('fecha_defuncion')
	ls_pasa					='N'
elseif isnull(ll_estado_gestion) then
	messagebox("Advertencia","Debe Ingresar Estado Gestióm")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('estado_gestion')
	ls_pasa					='N'
elseif isnull(ls_observacion) then
	messagebox("Advertencia","Debe Ingresar Apellido Paterno Fallecido")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('paterno_fallecido')
	ls_pasa					='N'
elseif isnull(ll_cod_parque) then
	messagebox("Advertencia","Debe Ingresar Parque")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('cod_parque')
	ls_pasa					='N'
elseif isnull(ll_codigo_religion) then
	messagebox("Advertencia","Debe Ingresar Religión")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('codigo_religion')
	ls_pasa					='N'
elseif isnull(ll_sw_orador) then
	messagebox("Advertencia","Debe Ingresar Tipo Oración")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('sw_orador')
	ls_pasa					='N'
elseif isnull(ll_sw_covid) then
	messagebox("Advertencia","Debe Ingresar Confirmación Covid")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('sw_covid')
	ls_pasa					='N'
elseif isnull(ll_sw_protocolo) then
	messagebox("Advertencia","Debe Ingresar Protocolo Covid")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('sw_protocolo')
	ls_pasa					='N'
elseif isnull(ls_agenda_visualiza) then
	messagebox("Advertencia","Debe Ingresar Agenda Visualiza")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('agenda_visualiza')
	ls_pasa					='N'
elseif isnull(ldt_fecha_visualiza) and ls_agenda_visualiza='S' then
	messagebox("Advertencia","Debe Ingresar Fecha Visualiza")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('fecha_visualiza')
	ls_pasa					='N'
elseif isnull(ll_hora_ini_visualiza) and ls_agenda_visualiza='S' then
	messagebox("Advertencia","Debe Ingresar hora Inicio Visualiza")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('hora_ini_visualiza')
	ls_pasa					='N'
elseif isnull(ll_minuto_ini_visualiza) and ls_agenda_visualiza='S' then
	messagebox("Advertencia","Debe Ingresar Minuto Inicio Visualiza")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('minuto_ini_visualiza')
	ls_pasa					='N'
elseif isnull(ll_hora_fin_visualiza) and ls_agenda_visualiza='S' then
	messagebox("Advertencia","Debe Ingresar Hora Termino Visualiza")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('hora_fin_visualiza')
	ls_pasa					='N'
elseif isnull(ll_minuto_fin_visualiza) and ls_agenda_visualiza='S' then
	messagebox("Advertencia","Debe Ingresar Minuto Termino Visualiza")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('minuto_fin_visualiza')
	ls_pasa					='N'
elseif isnull(ls_agenda_capilla) then
	messagebox("Advertencia","Debe Ingresar Agenda Capilla")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('agenda_capilla')
	ls_pasa					='N'
elseif isnull(ldt_fecha_capilla) and ls_agenda_capilla='S' then
	messagebox("Advertencia","Debe Ingresar Fecha Capilla")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('fecha_capilla')
	ls_pasa					='N'
elseif isnull(ll_hora_ini_capilla) and ls_agenda_capilla='S' then
	messagebox("Advertencia","Debe Ingresar Hora Inicio Capilla")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('hora_ini_capilla')
	ls_pasa					='N'
elseif isnull(ll_minuto_ini_capilla) and ls_agenda_capilla='S' then
	messagebox("Advertencia","Debe Ingresar Minuto Inicio Capilla")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('minuto_ini_capilla')
	ls_pasa					='N'
elseif isnull(ll_hora_fin_capilla) and ls_agenda_capilla='S' then
	messagebox("Advertencia","Debe Ingresar Hora Termino Capilla")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('hora_fin_capilla')
	ls_pasa					='N'
elseif isnull(ll_minuto_fin_capilla) and ls_agenda_capilla='S' then
	messagebox("Advertencia","Debe Ingresar Minuto Termino Capilla")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('minuto_fin_capilla')
	ls_pasa					='N'
elseif isnull(ls_agenda_pergola) then
	messagebox("Advertencia","Debe Ingresar Agenda Pergola")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('agenda_pergola')
	ls_pasa					='N'
elseif isnull(ldt_fecha_pergola) and ls_agenda_pergola='S' then
	messagebox("Advertencia","Debe Ingresar Fecha Pergola")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('fecha_pergola')
	ls_pasa					='N'
elseif isnull(ll_hora_ini_pergola) and ls_agenda_pergola='S' then
	messagebox("Advertencia","Debe Ingresar Hora Inicio Pergola")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('hora_ini_pergola')
	ls_pasa					='N'
elseif isnull(ll_minuto_ini_pergola) and ls_agenda_pergola='S' then
	messagebox("Advertencia","Debe Ingresar Minuto Inicio Pergola")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('minuto_ini_pergola')
	ls_pasa					='N'
elseif isnull(ll_hora_fin_pergola) and ls_agenda_pergola='S' then
	messagebox("Advertencia","Debe Ingresar Hora Termino Pergola")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('hora_fin_pergola')
	ls_pasa					='N'
elseif isnull(ll_minuto_fin_pergola) and ls_agenda_pergola='S' then
	messagebox("Advertencia","Debe Ingresar Minuto Termino Pergola")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('minuto_fin_pergola')
	ls_pasa					='N'
end if
if ls_pasa='S' then
	if dw_ingreso.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
		if isvalid(w_lista_crematorio) then
			w_lista_crematorio.dw_parque.setitem(1,'cod_parque',142)
			w_lista_crematorio.pb_ok.triggerevent(clicked!)
			w_lista_crematorio.setfocus()
		end if
		close(w_agenda_crematorio_individual)
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Agenda Cremación SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_cerrar from commandbutton within w_agenda_crematorio_individual
integer x = 3502
integer y = 1268
integer width = 320
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_agenda_crematorio_individual)
end event

type dw_ingreso from datawindow within w_agenda_crematorio_individual
integer x = 14
integer y = 20
integer width = 3808
integer height = 1232
integer taborder = 10
string title = "none"
string dataobject = "dw_fc_ingreso_agenda_visualiza"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_ag_visualiza,ls_ag_capilla,ls_ag_pergola
datetime	ldt_fecha_visualiza,ldt_nulo,ldt_fecha_pergola,ldt_fecha_capilla
Date		ldt_dia_tope
Long		ll_hora_ini,ll_min_ini,ll_hora_fin_visualiza,ll_min_fin_visualiza,ll_hora_fin_capilla,ll_min_fin_capilla

Setnull(ldt_nulo)
dw_ingreso.accepttext()
ls_columna					= dwo.name
ldt_dia_tope					= RelativeDate ( date(gdt_fec_sistema) , 90)
if ls_columna='fecha_visualiza' then
	ldt_fecha_visualiza		= dw_ingreso.getitemdatetime(1,'fecha_visualiza')
	if ldt_fecha_visualiza < idt_fecha  and not isnull(ldt_fecha_visualiza) then
		messagebox("Advertencia","Fecha Invalida, Fecha Visualización no debe ser Menor a Fecha Cremación")
		dw_ingreso.setitem(1,'fecha_visualiza',ldt_nulo)
		dw_ingreso.accepttext()
	elseif date(ldt_fecha_visualiza) > (ldt_dia_tope)  and not isnull(ldt_fecha_visualiza) then
		messagebox("Advertencia","Fecha Invalida, Fecha Visualización no debe ser Mayor a "+string(ldt_dia_tope,'dd/mm/yyyy'))
		dw_ingreso.setitem(1,'fecha_visualiza',ldt_nulo)
		dw_ingreso.accepttext()
	end if
elseif ls_columna='fecha_pergola' then
	ldt_fecha_pergola		= dw_ingreso.getitemdatetime(1,'fecha_pergola')
	if ldt_fecha_visualiza > idt_fecha  and not isnull(ldt_fecha_pergola) then
		messagebox("Advertencia","Fecha Invalida, Fecha Pergola no debe ser Mayor a Fecha Cremación")
		dw_ingreso.setitem(1,'fecha_pergola',ldt_nulo)
		dw_ingreso.accepttext()
	end if
elseif ls_columna='fecha_capilla' then
	ldt_fecha_capilla		= dw_ingreso.getitemdatetime(1,'fecha_capilla')
	if ldt_fecha_capilla > idt_fecha  and not isnull(ldt_fecha_capilla) then
		messagebox("Advertencia","Fecha Invalida, Fecha Capilla no debe ser Mayor a Fecha Cremación")
		dw_ingreso.setitem(1,'fecha_capilla',ldt_nulo)
		dw_ingreso.accepttext()
	end if
elseif ls_columna='agenda_visualiza' or ls_columna='hora_ini_visualiza' or ls_columna='minuto_ini_visualiza' then
	ls_ag_visualiza			= dw_ingreso.getitemstring(1,'agenda_visualiza')
	if ls_ag_visualiza='S' then
		dw_ingreso.setitem(1,'hora_ini_visualiza',il_hora_ini)
		dw_ingreso.setitem(1,'minuto_ini_visualiza',il_min_ini)
		dw_ingreso.accepttext()
		ll_hora_ini							= dw_ingreso.getitemnumber(1,'hora_ini_visualiza')
		ll_min_ini							= dw_ingreso.getitemnumber(1,'minuto_ini_visualiza')
		if ll_hora_ini > 0 and ll_min_ini >= 0 then
			ll_hora_fin_visualiza			= il_hora_ini
			ll_min_fin_visualiza			= il_min_ini + 30
			if ll_min_fin_visualiza	>= 60 then
				ll_hora_fin_visualiza		= ll_hora_fin_visualiza + 1
				ll_min_fin_visualiza		= 0
			end if
			dw_ingreso.setitem(1,'hora_fin_visualiza',ll_hora_fin_visualiza)
			dw_ingreso.setitem(1,'minuto_fin_visualiza',ll_min_fin_visualiza)
		end if
	end if
elseif ls_columna='agenda_capilla' then
	ls_ag_capilla			= dw_ingreso.getitemstring(1,'agenda_capilla')
	dw_ingreso.setitem(1,'hora_ini_capilla',il_hora_ini)
	dw_ingreso.setitem(1,'minuto_ini_capilla',il_min_ini)
	dw_ingreso.accepttext()
	ll_hora_ini				= dw_ingreso.getitemnumber(1,'hora_ini_capilla')
	ll_min_ini				= dw_ingreso.getitemnumber(1,'minuto_ini_capilla')
	if ls_ag_capilla='S' then
		if ll_hora_ini > 0 and ll_min_ini >= 0 then
			ll_hora_fin_capilla				= ll_hora_ini + 1
			ll_min_fin_capilla				= ll_min_ini
			if ll_min_fin_capilla = 60 then ll_min_fin_capilla=0
			dw_ingreso.setitem(1,'hora_fin_capilla',ll_hora_fin_capilla)
			dw_ingreso.setitem(1,'minuto_fin_capilla',ll_min_fin_capilla)
		end if
	else
		dw_ingreso.setitem(1,'agenda_pergola','N')
		dw_ingreso.setitem(1,'hora_ini_pergola',0)
		dw_ingreso.setitem(1,'minuto_ini_pergola',0)
		dw_ingreso.setitem(1,'hora_fin_pergola',0)
		dw_ingreso.setitem(1,'minuto_fin_pergola',0)
	end if
elseif ls_columna='agenda_pergola' then
	ls_ag_pergola			= dw_ingreso.getitemstring(1,'agenda_pergola')
	dw_ingreso.setitem(1,'hora_ini_pergola',il_hora_ini)
	dw_ingreso.setitem(1,'minuto_ini_pergola',il_min_ini)
	dw_ingreso.accepttext()
	ll_hora_ini				= dw_ingreso.getitemnumber(1,'hora_ini_pergola')
	ll_min_ini				= dw_ingreso.getitemnumber(1,'minuto_ini_pergola')
	if ls_ag_pergola='S'  then
		if ll_hora_ini > 0 and ll_min_ini >= 0 then
			ll_hora_fin_capilla				= ll_hora_ini + 1
			ll_min_fin_capilla				= ll_min_ini
			if ll_min_fin_capilla = 60 then ll_min_fin_capilla=0
			dw_ingreso.setitem(1,'hora_fin_pergola',ll_hora_fin_capilla)
			dw_ingreso.setitem(1,'minuto_fin_pergola',ll_min_fin_capilla)
		end if
	else
		dw_ingreso.setitem(1,'agenda_capilla','N')
		dw_ingreso.setitem(1,'hora_ini_capilla',0)
		dw_ingreso.setitem(1,'minuto_ini_capilla',0)
		dw_ingreso.setitem(1,'hora_fin_capilla',0)
		dw_ingreso.setitem(1,'minuto_fin_capilla',0)
	end if
	
end if
dw_ingreso.accepttext()
end event

event itemfocuschanged;datetime		ldt_fecha_visualiza,ldt_nulo

Setnull(ldt_nulo)
dw_ingreso.accepttext()
ldt_fecha_visualiza		= dw_ingreso.getitemdatetime(1,'fecha_visualiza')
if ldt_fecha_visualiza < idt_fecha and not isnull(ldt_fecha_visualiza) then
//	messagebox("Advertencia","Fecha Invalida, Fecha Visualización no debe ser Menor a Fecha Cremación")
	dw_ingreso.setitem(1,'fecha_visualiza',ldt_nulo)
end if
dw_ingreso.accepttext()
end event

