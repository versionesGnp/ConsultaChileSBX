forward
global type w_ingreso_solicitud_grabacion_lapida from window
end type
type dw_print from datawindow within w_ingreso_solicitud_grabacion_lapida
end type
type st_buscar from statictext within w_ingreso_solicitud_grabacion_lapida
end type
type cb_print from commandbutton within w_ingreso_solicitud_grabacion_lapida
end type
type cb_cerrar from commandbutton within w_ingreso_solicitud_grabacion_lapida
end type
type cb_grabar from commandbutton within w_ingreso_solicitud_grabacion_lapida
end type
type dw_ingreso from datawindow within w_ingreso_solicitud_grabacion_lapida
end type
end forward

global type w_ingreso_solicitud_grabacion_lapida from window
integer width = 2793
integer height = 2040
boolean titlebar = true
string title = "Crear Solicitud Grabación de Lápida"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_print dw_print
st_buscar st_buscar
cb_print cb_print
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_ingreso dw_ingreso
end type
global w_ingreso_solicitud_grabacion_lapida w_ingreso_solicitud_grabacion_lapida

on w_ingreso_solicitud_grabacion_lapida.create
this.dw_print=create dw_print
this.st_buscar=create st_buscar
this.cb_print=create cb_print
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.dw_print,&
this.st_buscar,&
this.cb_print,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_ingreso}
end on

on w_ingreso_solicitud_grabacion_lapida.destroy
destroy(this.dw_print)
destroy(this.st_buscar)
destroy(this.cb_print)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_ingreso)
end on

event open;String		ls_sector,ls_sepultura,ls_nro_tecnico,ls_ap_pat,ls_ap_mat,ls_nombre,ls_prim_sepult,ls_fecha,&
			ls_dv_titular,ls_base,ls_serie
Long		ll_cod_parque,ll_capacidad,ll_cod_imagen,ll_cod_relig,ll_new,ll_rut_titular
Double	ll_numero
Datetime	ldt_fecha,ldt_fecha_hoy

st_buscar.visible	= false
dw_print.settransobject(sqlca)
ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))
gf_centrar(w_ingreso_solicitud_grabacion_lapida)
dw_ingreso.settransobject(sqlca)
ls_sector		= substr(1,1,Message.StringParm)
ls_sepultura	= substr(1,2,Message.StringParm)
ll_cod_parque	= long(substr(1,3,Message.StringParm))
ls_nro_tecnico	= substr(1,4,Message.StringParm)
ll_capacidad	= long(substr(1,5,Message.StringParm))
ls_fecha			= substr(1,6,Message.StringParm)
ldt_fecha		= datetime(date(ls_fecha))
ls_ap_pat		= substr(1,7,Message.StringParm)
ls_ap_mat		= substr(1,8,Message.StringParm)
ls_nombre		= substr(1,9,Message.StringParm)
ls_prim_sepult	= substr(1,10,Message.StringParm)
ll_cod_imagen	= long(substr(1,11,Message.StringParm))
ll_cod_relig	= long(substr(1,12,Message.StringParm))
ll_rut_titular	= long(substr(1,13,Message.StringParm))
ls_dv_titular	= substr(1,14,Message.StringParm)
ls_base			= substr(1,15,Message.StringParm)
ls_serie			= substr(1,16,Message.StringParm)
ll_numero		= Double(substr(1,17,Message.StringParm))
ll_new			= dw_ingreso.insertrow(0)
dw_ingreso.setitem(ll_new,'sector',ls_sector)
dw_ingreso.setitem(ll_new,'sepultura',ls_sepultura)
dw_ingreso.setitem(ll_new,'cod_parque',ll_cod_parque)
dw_ingreso.setitem(ll_new,'numero_tecnico',ls_nro_tecnico)
dw_ingreso.setitem(ll_new,'capacidad',ll_capacidad)
dw_ingreso.setitem(ll_new,'fecha',ldt_fecha_hoy)
dw_ingreso.setitem(ll_new,'apellido_paterno_titular',ls_ap_pat)
dw_ingreso.setitem(ll_new,'apellido_materno_titular',ls_ap_mat)
dw_ingreso.setitem(ll_new,'nombre_titular',ls_nombre)
dw_ingreso.setitem(ll_new,'primera_sepultura',ls_prim_sepult)
dw_ingreso.setitem(ll_new,'codigo_imagen',ll_cod_imagen)
dw_ingreso.setitem(ll_new,'codigo_religion',ll_cod_relig)
dw_ingreso.setitem(ll_new,'rut_titular',ll_rut_titular)
dw_ingreso.setitem(ll_new,'dv_titular',ls_dv_titular)
dw_ingreso.setitem(ll_new,'base',ls_base)
dw_ingreso.setitem(ll_new,'serie',ls_serie)
dw_ingreso.setitem(ll_new,'numero',ll_numero)
dw_ingreso.setitem(ll_new,'grabacion_manual','S')
dw_ingreso.setitem(ll_new,'fecha_recepcion',ldt_fecha_hoy)
dw_ingreso.accepttext()
dw_ingreso.setfocus()
end event

type dw_print from datawindow within w_ingreso_solicitud_grabacion_lapida
boolean visible = false
integer x = 658
integer y = 1860
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_imprimir_grabacion_lapida"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_buscar from statictext within w_ingreso_solicitud_grabacion_lapida
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1010
integer y = 1076
integer width = 439
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28377087
string text = "Buscar Fallecido"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_buscar.visible	= false
end event

type cb_print from commandbutton within w_ingreso_solicitud_grabacion_lapida
integer x = 1230
integer y = 1788
integer width = 311
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Datetime	ldt_fecha
Long		ll_folio,ll_parque
String	ls_sector,ls_sepultura

ldt_fecha		= dw_ingreso.getitemdatetime(1,'fecha')
ll_folio			= dw_ingreso.getitemnumber(1,'folio')
ll_parque		= dw_ingreso.getitemnumber(1,'cod_parque')
ls_sector		= dw_ingreso.getitemstring(1,'sector')
ls_sepultura	= dw_ingreso.getitemstring(1,'sepultura')
if dw_print.retrieve(ls_sector,ls_sepultura,ll_parque,ldt_fecha,ll_folio)>0 then
	f_Print( dw_print )
else
	messagebox("Advertencia","Debe Grabar Antes de Imprimir Solicitud de Grabación de Lápida")
end if
end event

type cb_cerrar from commandbutton within w_ingreso_solicitud_grabacion_lapida
integer x = 2418
integer y = 1788
integer width = 306
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_solicitud_grabacion_lapida)
end event

type cb_grabar from commandbutton within w_ingreso_solicitud_grabacion_lapida
integer x = 37
integer y = 1788
integer width = 306
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_nombre,ls_ap_pat,ls_ap_mat,ls_nom_lap,ls_sector,ls_sepultura
Datetime	ldt_fec_nac,ldt_fec_fall,ldt_fec_sep,ldt_fec_def_lap,ldt_fec_nac_lap
Long		ll_count,ll_parque,ll_count_folio

ll_parque			= dw_ingreso.getitemnumber(1,'cod_parque')
ls_sector			= dw_ingreso.getitemstring(1,'sector')
ls_sepultura		= dw_ingreso.getitemstring(1,'sepultura')
ls_nombre			= dw_ingreso.getitemstring(1,'nombre_fallecido')
ls_ap_pat			= dw_ingreso.getitemstring(1,'apellido_paterno_fall')
ls_ap_mat			= dw_ingreso.getitemstring(1,'apellido_materno_fall')
ldt_fec_nac			= dw_ingreso.getitemdatetime(1,'fecha_nacimiento_fall')
ldt_fec_fall		= dw_ingreso.getitemdatetime(1,'fecha_fallecimiento')
ldt_fec_sep			= dw_ingreso.getitemdatetime(1,'fecha_sepultacion')
ls_nom_lap			= dw_ingreso.getitemstring(1,'nombre_fallecido_lapida')
ldt_fec_def_lap	= dw_ingreso.getitemdatetime(1,'fecha_defuncion_lapida')
ldt_fec_nac_lap	= dw_ingreso.getitemdatetime(1,'fecha_nacimiento_lapida')
if not isnull(ls_nombre) and ls_nombre<>'' and ls_nombre<>'-' and &
	not isnull(ls_ap_pat) and ls_ap_pat<>'' and ls_ap_pat<>'-' and &
	not isnull(ls_ap_mat) and ls_ap_mat<>'' and not isnull(ldt_fec_fall) and &
	not isnull(ldt_fec_sep) and not isnull(ldt_fec_nac) and not isnull(ls_nom_lap) and ls_nom_lap<>'' and &
	ls_nom_lap <> '-' and not isnull(ldt_fec_def_lap) and not isnull(ldt_fec_nac_lap) then
	
	SELECT	COUNT("FICHA_GRABACION_LAPIDA"."BASE")  
	INTO 		:ll_count_folio  
	FROM 		"FICHA_GRABACION_LAPIDA"  
	WHERE  ( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
			 ( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
			 ( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque ) AND  
			 ( "FICHA_GRABACION_LAPIDA"."FECHA_SEPULTACION" = (SELECT 	max("FICHA_GRABACION_LAPIDA"."FECHA_SEPULTACION") 
			 																	FROM 		"FICHA_GRABACION_LAPIDA" 
																				WHERE  ( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND 
																						 ( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND 
																						 ( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque ) ) )   ;
	if isnull(ll_count_folio) then ll_count_folio=0
	ll_count_folio ++
	
	SELECT 	MAX("FICHA_GRABACION_LAPIDA"."CORRELATIVO")  
	INTO 		:ll_count  
	FROM 		"FICHA_GRABACION_LAPIDA"  
	WHERE		"FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque
	USING		sqlca;
	if isnull(ll_count) then ll_count=0
	ll_count ++
	dw_ingreso.setitem(1,'correlativo',ll_count)
	dw_ingreso.setitem(1,'folio',ll_count_folio)
	dw_ingreso.accepttext()
	if dw_ingreso.update()=1 then
		commit;
		w_solicitud_grabacion_lapida.dw_lista.retrieve(ls_sector,ls_sepultura,ll_parque)
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Solicitud Grabación Manual SQL: "+sqlca.sqlerrtext)
	end if
else
	if isnull(ls_nombre) or ls_nombre='' or ls_nombre='-' then
		messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('nombre_fallecido')
	elseif isnull(ls_ap_pat) or ls_ap_pat='' or ls_ap_pat='-' then
		messagebox("Advertencia","Debe Ingresar Apellido Paterno Fallecido")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('apellido_paterno_fall')
	elseif isnull(ls_ap_mat) or ls_ap_mat='' then
		messagebox("Advertencia","Debe Ingresar Apellido Materno Fallecido")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('apellido_materno_fall')
	elseif isnull(ldt_fec_fall) then
		messagebox("Advertencia","Debe Ingresar Fecha Defunción")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('fecha_fallecimiento')
	elseif isnull(ldt_fec_sep) then
		messagebox("Advertencia","Debe Ingresar Fecha Sepultación")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('fecha_sepultacion')
	elseif isnull(ldt_fec_nac) then
		messagebox("Advertencia","Debe Ingresar Fecha Nacimiento")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('fecha_nacimiento_fall')
	elseif isnull(ls_nom_lap) or ls_nom_lap='' or ls_nom_lap='-' then
		messagebox("Advertencia","Debe Ingresar Nombre Fallecido Lápida")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('nombre_fallecido_lapida')
	elseif isnull(ldt_fec_def_lap) then
		messagebox("Advertencia","Debe Ingresar Fecha Defunción Lápida")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('fecha_defuncion_lapida')
	elseif isnull(ldt_fec_nac_lap) then
		messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Lápida")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('fecha_nacimiento_lapida')
	end if
end if
end event

type dw_ingreso from datawindow within w_ingreso_solicitud_grabacion_lapida
event ue_mousemove pbm_dwnmousemove
integer x = 27
integer y = 24
integer width = 2720
integer height = 1732
integer taborder = 10
string dataobject = "dw_ingreso_manual_sol_grabacion_lapida"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;String	ls_columna

ls_columna 				= dwo.name
if ls_columna='p_1' then
	st_buscar.visible	= true
else
	st_buscar.visible	= false
end if
end event

event clicked;String	ls_columna,ls_sector,ls_sepult,ls_string

ls_columna			= dwo.name
if ls_columna='p_1' then
	ls_sector		= dw_ingreso.getitemstring(1,'sector')
	ls_sepult		= dw_ingreso.getitemstring(1,'sepultura')
	if not isnull(ls_sector) and not isnull(ls_sepult) then
		ls_string	= ls_sector+'~t'+ls_sepult
		if isvalid(w_lista_fallecido_a_buscar) then close(w_lista_fallecido_a_buscar)
		openwithparm(w_lista_fallecido_a_buscar,ls_string)
	end if
end if
end event

event itemchanged;dwo.name
end event

