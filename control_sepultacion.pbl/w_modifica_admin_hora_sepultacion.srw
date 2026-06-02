forward
global type w_modifica_admin_hora_sepultacion from window
end type
type cb_mantenedor from commandbutton within w_modifica_admin_hora_sepultacion
end type
type cb_limpiar from commandbutton within w_modifica_admin_hora_sepultacion
end type
type cb_cerrar from commandbutton within w_modifica_admin_hora_sepultacion
end type
type cb_grabar from commandbutton within w_modifica_admin_hora_sepultacion
end type
type dw_lista from datawindow within w_modifica_admin_hora_sepultacion
end type
type pb_ok from picturebutton within w_modifica_admin_hora_sepultacion
end type
type dw_buscar from datawindow within w_modifica_admin_hora_sepultacion
end type
end forward

global type w_modifica_admin_hora_sepultacion from window
integer width = 3282
integer height = 1356
boolean titlebar = true
string title = "Mantención Horario"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_mantenedor cb_mantenedor
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_lista dw_lista
pb_ok pb_ok
dw_buscar dw_buscar
end type
global w_modifica_admin_hora_sepultacion w_modifica_admin_hora_sepultacion

type variables
datawindowchild			idw_detalle5,idw_detalle6
end variables

on w_modifica_admin_hora_sepultacion.create
this.cb_mantenedor=create cb_mantenedor
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_lista=create dw_lista
this.pb_ok=create pb_ok
this.dw_buscar=create dw_buscar
this.Control[]={this.cb_mantenedor,&
this.cb_limpiar,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_lista,&
this.pb_ok,&
this.dw_buscar}
end on

on w_modifica_admin_hora_sepultacion.destroy
destroy(this.cb_mantenedor)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_lista)
destroy(this.pb_ok)
destroy(this.dw_buscar)
end on

event open;Long		ll_new
datetime	ldt_fecha_hoy

ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))
gf_centrar(w_modifica_admin_hora_sepultacion)
dw_buscar.settransobject(sqlca)
dw_lista.settransobject(sqlca)
dw_buscar.getchild('sepultura',idw_detalle6)
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

dw_buscar.getchild('sector',idw_detalle5)
idw_detalle5.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	idw_detalle5.retrieve(1)
elseif gs_conexion = "Parque La Foresta" then
	idw_detalle5.retrieve(11)
end if
ll_new	= dw_buscar.insertrow(0)
dw_buscar.setitem(ll_new,'fecha_sepult',ldt_fecha_hoy)
dw_buscar.setitem(ll_new,'tipo_ficha','FS')

dw_buscar.accepttext()
end event

type cb_mantenedor from commandbutton within w_modifica_admin_hora_sepultacion
integer x = 1445
integer y = 1120
integer width = 654
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Mantenedor de Tablas"
end type

event clicked;if isvalid(w_mantenedor_fune_diac_parques) then close(w_mantenedor_fune_diac_parques)
open(w_mantenedor_fune_diac_parques)
end event

type cb_limpiar from commandbutton within w_modifica_admin_hora_sepultacion
integer x = 969
integer y = 1120
integer width = 347
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long	ll_new
dw_buscar.reset()
dw_lista.reset()
dw_buscar.getchild('sepultura',idw_detalle6)
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

dw_buscar.getchild('sector',idw_detalle5)
idw_detalle5.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	idw_detalle5.retrieve(1)
elseif gs_conexion = "Parque La Foresta" then
	idw_detalle5.retrieve(11)
end if
ll_new	= dw_buscar.insertrow(0)
dw_buscar.setitem(ll_new,'fecha_sepult',today())
dw_buscar.setitem(ll_new,'tipo_ficha','FS')

dw_buscar.setfocus()
end event

type cb_cerrar from commandbutton within w_modifica_admin_hora_sepultacion
integer x = 2875
integer y = 1120
integer width = 347
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_modifica_admin_hora_sepultacion)
end event

type cb_grabar from commandbutton within w_modifica_admin_hora_sepultacion
integer x = 50
integer y = 1120
integer width = 347
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long	ll_new
if dw_lista.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
	dw_buscar.reset()
	dw_lista.reset()
	dw_buscar.getchild('sepultura',idw_detalle6)
	idw_detalle6.settransobject(sqlca)
	idw_detalle6.insertrow(0)
	
	dw_buscar.getchild('sector',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	if gs_conexion	= "Parque El Prado" then
		idw_detalle5.retrieve(1)
	elseif gs_conexion = "Parque La Foresta" then
		idw_detalle5.retrieve(11)
	end if
	ll_new	= dw_buscar.insertrow(0)
	dw_buscar.setitem(ll_new,'fecha_sepult',today())
	dw_buscar.setitem(ll_new,'tipo_ficha','FS')
	
	dw_buscar.setfocus()
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if
end event

type dw_lista from datawindow within w_modifica_admin_hora_sepultacion
integer x = 50
integer y = 316
integer width = 3173
integer height = 768
integer taborder = 30
string title = "none"
string dataobject = "dw_modifica_hora_ficha_sepultacion"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String	ls_columna,ls_sector,ls_sepultura
Long		ll_hora,ll_min,ll_cod_parque,ll_count_sep,ll_count_tras,ll_count_suma
Datetime	ldt_fecha

this.accepttext()
ls_columna			= dwo.name
if ls_columna='hora' then
	ll_hora			= this.getitemnumber(this.getrow(),'hora')
	this.setitem(this.getrow(),'hora_def',ll_hora)
	this.setitem(this.getrow(),'modif_adm','S')
end if
if ls_columna='minutos' then
	ll_min			= this.getitemnumber(this.getrow(),'minutos')
	this.setitem(this.getrow(),'minuto_def',ll_min)
	this.setitem(this.getrow(),'modif_adm','S')
end if
this.accepttext()
if dw_lista.dataobject	= 'dw_modifica_hora_ficha_sepultacion' then
	ll_hora			= this.getitemnumber(this.getrow(),'hora')
	ll_min			= this.getitemnumber(this.getrow(),'minutos')
elseif dw_lista.dataobject	= 'dw_modifica_hora_ficha_traslado' then
	ll_hora			= this.getitemnumber(this.getrow(),'hora_fijada')
	ll_min			= this.getitemnumber(this.getrow(),'minuto_fijada')
end if
if ll_hora>0 then
	ll_cod_parque	= dw_buscar.getitemnumber(1,'cod_parque')
	ls_sector		= dw_buscar.getitemstring(1,'sector')
	ls_sepultura	= dw_buscar.getitemstring(1,'sepultura')
	ldt_fecha		= dw_buscar.getitemdatetime(1,'fecha_sepult')
	SELECT	Count("FICHA_SEPULTACION"."CODIGO_EJECUTIVO")  
	INTO 		:ll_count_sep
	FROM 		"FICHA_SEPULTACION"  
	WHERE  ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha ) AND 
			 ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND 
			 ( "FICHA_SEPULTACION"."HORA_DEF" = :ll_hora ) AND  
			 ( "FICHA_SEPULTACION"."MINUTO_DEF" = :ll_min )   
	USING		sqlca;
	SELECT 	Count("FICHA_TRASLADO"."CODIGO_EJECUTIVO")  
	INTO		:ll_count_tras
	FROM 		"FICHA_TRASLADO"  
	WHERE  ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fecha ) AND  
			 ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque ) AND 
			 ( "FICHA_TRASLADO"."HORA_DEF" = :ll_hora ) AND  
			 ( "FICHA_TRASLADO"."MINUTO_DEF" = :ll_min )   
	USING		sqlca;
	if isnull(ll_count_sep) then ll_count_sep=0
	if isnull(ll_count_tras) then ll_count_tras=0
	ll_count_suma	= ll_count_sep + ll_count_tras
	if ll_count_suma>0 then
		messagebox("Advertencia","Recuerde hay "+string(ll_count_suma)+" Ficha(s) Asignada en este Horario")
	end if
end if
this.accepttext()
end event

type pb_ok from picturebutton within w_modifica_admin_hora_sepultacion
integer x = 2629
integer y = 80
integer width = 178
integer height = 156
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;String	ls_tipo_ficha,ls_sector,ls_sepultura
Long		ll_cod_parque
datetime	ldt_fecha

dw_buscar.accepttext()
ls_tipo_ficha	= dw_buscar.getitemstring(1,'tipo_ficha')
if ls_tipo_ficha='FS' then
	dw_lista.dataobject	= 'dw_modifica_hora_ficha_sepultacion'
elseif ls_tipo_ficha='FT' then
	dw_lista.dataobject	= 'dw_modifica_hora_ficha_traslado'
end if
dw_lista.settransobject(sqlca)
dw_lista.reset()
ls_tipo_ficha	= dw_buscar.getitemstring(1,'tipo_ficha')
ll_cod_parque	= dw_buscar.getitemnumber(1,'cod_parque')
ls_sector		= dw_buscar.getitemstring(1,'sector')
ls_sepultura	= dw_buscar.getitemstring(1,'sepultura')
ldt_fecha		= dw_buscar.getitemdatetime(1,'fecha_sepult')
if isnull(ls_tipo_ficha) or ls_tipo_ficha='' then
	messagebox("Advertencia","Debe Seleccionar Tipo Ficha")
	dw_buscar.setfocus()
	dw_buscar.setcolumn('tipo_ficha')
elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_buscar.setfocus()
	dw_buscar.setcolumn('cod_parque')
elseif isnull(ls_sector) or ls_sector='' then
	messagebox("Advertencia","Debe Seleccionar Sector")
	dw_buscar.setfocus()
	dw_buscar.setcolumn('sector')
elseif isnull(ls_sepultura) or ls_sepultura='' then
	messagebox("Advertencia","Debe Seleccionar Sepultura")
	dw_buscar.setfocus()
	dw_buscar.setcolumn('sepultura')
elseif isnull(ldt_fecha) then
	messagebox("Advertencia","Debe Ingresar Fecha")
	dw_buscar.setfocus()
	dw_buscar.setcolumn('fecha_sepult')
else
	if dw_lista.retrieve(ldt_fecha,ll_cod_parque,ls_sector,ls_sepultura)=0 then
		messagebox("Advertencia","No registra Dato")
	end if
end if
end event

type dw_buscar from datawindow within w_modifica_admin_hora_sepultacion
integer x = 23
integer y = 52
integer width = 2459
integer height = 216
integer taborder = 10
string title = "none"
string dataobject = "dwe_modifica_adm_hora"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_tipo_ficha,ls_sector
Long		ll_cod_parque

dw_lista.reset()
this.accepttext()
ls_columna	= dwo.name
if ls_columna='tipo_ficha' then
	ls_tipo_ficha	= dw_buscar.getitemstring(1,'tipo_ficha')
	if ls_tipo_ficha='FS' then
		dw_lista.dataobject	= 'dw_modifica_hora_ficha_sepultacion'
	elseif ls_tipo_ficha='FT' then
		dw_lista.dataobject	= 'dw_modifica_hora_ficha_traslado'
	end if
	dw_lista.settransobject(sqlca)
elseif ls_columna='cod_parque' then
	ll_cod_parque	= dw_buscar.getitemnumber(1,'cod_parque')
	idw_detalle5.retrieve(ll_cod_parque)
elseif ls_columna='sector' then
	ll_cod_parque	= dw_buscar.getitemnumber(1,'cod_parque')
	ls_sector		= dw_buscar.getitemstring(1,'sector')
	idw_detalle6.retrieve(ll_cod_parque,ls_sector)
end if
end event

event clicked;string	ls_columna,ls_fecha
ls_columna	= dwo.name
if ls_columna='p_1' then
	ls_fecha	= string(date(dw_buscar.getitemdatetime(1,'fecha_sepult')))
	if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
	if f_valida_fecha(ls_fecha)=-1 then 
		dw_buscar.setitem(1,'fecha_sepult',datetime(string(today(),gs_formato_fecha)))
		return
	end if
	OpenWithParm(w_calendar,ls_fecha)
	IF not isnull(Message.StringParm) THEN
		ls_fecha				= trim(Message.StringParm)
		dw_buscar.setitem(1,'fecha_sepult',date(ls_fecha))
	End if
end if
end event

