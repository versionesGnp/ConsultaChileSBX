forward
global type w_buscar_ficha from window
end type
type pb_buscar_fall from picturebutton within w_buscar_ficha
end type
type em_ap_pat_fall from editmask within w_buscar_ficha
end type
type st_3 from statictext within w_buscar_ficha
end type
type cb_datos_ctto from commandbutton within w_buscar_ficha
end type
type st_1 from statictext within w_buscar_ficha
end type
type em_sepult from editmask within w_buscar_ficha
end type
type pb_buscar from picturebutton within w_buscar_ficha
end type
type cb_modificar from commandbutton within w_buscar_ficha
end type
type cb_1 from commandbutton within w_buscar_ficha
end type
type cb_2 from commandbutton within w_buscar_ficha
end type
type cb_3 from commandbutton within w_buscar_ficha
end type
type cb_imprimir from commandbutton within w_buscar_ficha
end type
type cb_aceptar from commandbutton within w_buscar_ficha
end type
type cb_cerrar from commandbutton within w_buscar_ficha
end type
type dw_parque from datawindow within w_buscar_ficha
end type
type st_16 from statictext within w_buscar_ficha
end type
type pb_ok from picturebutton within w_buscar_ficha
end type
type st_2 from statictext within w_buscar_ficha
end type
type em_fec_ini from editmask within w_buscar_ficha
end type
type p_ini from picture within w_buscar_ficha
end type
type dw_lista from datawindow within w_buscar_ficha
end type
type gb_1 from groupbox within w_buscar_ficha
end type
end forward

global type w_buscar_ficha from window
integer width = 3625
integer height = 2096
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
pb_buscar_fall pb_buscar_fall
em_ap_pat_fall em_ap_pat_fall
st_3 st_3
cb_datos_ctto cb_datos_ctto
st_1 st_1
em_sepult em_sepult
pb_buscar pb_buscar
cb_modificar cb_modificar
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
dw_parque dw_parque
st_16 st_16
pb_ok pb_ok
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
dw_lista dw_lista
gb_1 gb_1
end type
global w_buscar_ficha w_buscar_ficha

type variables
String		is_opcion,is_usuario_esta,is_tipo_sep
Long		il_row
datawindowchild	idw_detalle5
end variables

on w_buscar_ficha.create
this.pb_buscar_fall=create pb_buscar_fall
this.em_ap_pat_fall=create em_ap_pat_fall
this.st_3=create st_3
this.cb_datos_ctto=create cb_datos_ctto
this.st_1=create st_1
this.em_sepult=create em_sepult
this.pb_buscar=create pb_buscar
this.cb_modificar=create cb_modificar
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_parque=create dw_parque
this.st_16=create st_16
this.pb_ok=create pb_ok
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.pb_buscar_fall,&
this.em_ap_pat_fall,&
this.st_3,&
this.cb_datos_ctto,&
this.st_1,&
this.em_sepult,&
this.pb_buscar,&
this.cb_modificar,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.cb_aceptar,&
this.cb_cerrar,&
this.dw_parque,&
this.st_16,&
this.pb_ok,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.dw_lista,&
this.gb_1}
end on

on w_buscar_ficha.destroy
destroy(this.pb_buscar_fall)
destroy(this.em_ap_pat_fall)
destroy(this.st_3)
destroy(this.cb_datos_ctto)
destroy(this.st_1)
destroy(this.em_sepult)
destroy(this.pb_buscar)
destroy(this.cb_modificar)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_parque,ll_count_usuario
Datetime	ld_fec_ini
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

gf_centrar(w_buscar_ficha)
SELECT	COUNT("FICHA_USUARIO_ESTADISTICO"."USUARIO")  
INTO 		:ll_count_usuario  
FROM 	"FICHA_USUARIO_ESTADISTICO"  
WHERE  ( "FICHA_USUARIO_ESTADISTICO"."ESTADO" = 'A' ) AND  
		 ( "FICHA_USUARIO_ESTADISTICO"."USUARIO" = :gs_user )   
USING		sqlca;
if ll_count_usuario=1 then
	is_usuario_esta		= 'S'
else
	is_usuario_esta		= 'N'
end if
if gs_solicitudes='2' or gs_depto='I' then
	cb_modificar.visible	= true
else
	cb_modificar.visible	= false
end if
cb_modificar.visible		= false
em_fec_ini.text				= string(relativedate(date(gdt_fec_sistema),-30),'dd/mm/yyyy')
is_opcion						= Message.StringParm
if is_opcion='FS' or is_opcion='CO' then //Ficha Sepultación
	if is_opcion='FS' then
		dw_lista.dataobject	= 'dw_lista_ficha_sepultacion'
		this.title					= 'Lista Ficha de Sepultación'
		is_tipo_sep				= 'SE'
	elseif is_opcion='CO' then
		dw_lista.dataobject	= 'dw_lista_ficha_sepultacion_co'
		this.title					= 'Lista Ficha Columbario'
		is_tipo_sep				= 'CO'
	end if
	cb_modificar.visible	= true
elseif is_opcion='GL' then //Solicitud Grabacion de Lapida
	dw_lista.dataobject	= 'dw_lista_ficha_grabacion_lapida'
	this.title					= 'Lista Solicitud de Grabación de Lápida'
elseif is_opcion='CS' then //Carta de Sepultación
	dw_lista.dataobject	= 'dw_lista_carta_sepultacion'
	this.title					= 'Lista Carta Autorizacion de Sepultación'
elseif is_opcion='FT' then //Ficha Traslado
	dw_lista.dataobject	= 'dw_lista_ficha_traslado'
	this.title					= 'Lista Ficha de Traslado'
	cb_modificar.visible	= true
elseif is_opcion='FR' then //Ficha Reducción
	dw_lista.dataobject	= 'dw_lista_ficha_reduccion'
	this.title				= 'Lista Ficha de Reducción'
	cb_modificar.visible	= true
elseif is_opcion='CT' then //Ficha Cadaver en Transito
	dw_lista.dataobject	= 'dw_lista_ficha_cadaver_en_transito'
	this.title				= 'Lista Ficha de Cadaver en Transito'
	cb_modificar.visible	= true
end if
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)

dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque				= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_parque				= 11
end if
dw_parque.setitem(1,'cod_parque',ll_parque)
dw_lista.getchild('codigo_parentesco',idw_detalle5)
idw_detalle5.settransobject(sqlca)
idw_detalle5.retrieve(ll_parque)

ld_fec_ini					= datetime(date(em_fec_ini.text),lt_ini)
dw_lista.retrieve(ld_fec_ini,ll_parque)
end event

type pb_buscar_fall from picturebutton within w_buscar_ficha
integer x = 3451
integer y = 28
integer width = 105
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fallecidos.bmp"
alignment htextalign = left!
end type

event clicked;long	ll_fila,ll_tot_reg

ll_tot_reg		= dw_lista.RowCount()
if ll_tot_reg > 0 then
	if is_opcion='FT' then
		ll_fila	= dw_lista.Find("apellido_paterno_fall = '"+trim(em_ap_pat_fall.text)+"'",1, ll_tot_reg)
	else
		ll_fila	= dw_lista.Find("ap_paterno_fall = '"+trim(em_ap_pat_fall.text)+"'",1, ll_tot_reg)
	end if
	if ll_fila > 0 then
		dw_lista.setfocus()
		dw_lista.scrolltorow(ll_fila)
	else
		messagebox("Advertencia","Apellido Paterno fallecido "+trim(em_ap_pat_fall.text)+" No fue encontrado")
	end if
end if


end event

type em_ap_pat_fall from editmask within w_buscar_ficha
integer x = 2706
integer y = 32
integer width = 736
integer height = 100
integer taborder = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if not isnull(em_ap_pat_fall.text) and em_ap_pat_fall.text<>'' then pb_buscar_fall.triggerevent(clicked!)
end event

type st_3 from statictext within w_buscar_ficha
integer x = 2258
integer y = 24
integer width = 421
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Apellido Paterno Fallecido"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_datos_ctto from commandbutton within w_buscar_ficha
integer x = 978
integer y = 1872
integer width = 283
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Datos Ctto"
end type

event clicked;gs_base			= dw_lista.GetItemString(1,'base')
gs_serie			= dw_lista.GetItemString(1,'serie')
gi_numero		= dw_lista.GetItemNumber(1,'numero')
gi_rut				= dw_lista.GetItemNumber(1,'rut_titular')
if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 and gi_rut>0 and  dw_lista.rowcount()>0 then
	CHOOSE CASE gs_base
		CASE "O", "U" // Oferta
			if isvalid(w_datos_contrato_oferta) then close(w_datos_contrato_oferta)
			Open(w_datos_contrato_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_datos_contrato_liberador) then close(w_datos_contrato_liberador)
			Open(w_datos_contrato_liberador)
		CASE "P" // Pagaré
			if isvalid(w_datos_contrato_pagare) then close(w_datos_contrato_pagare)
			Open(w_datos_contrato_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_datos_contrato_isa) then close(w_datos_contrato_isa)
			Open(w_datos_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_datos_contrato_derecho) then close(w_datos_contrato_derecho)
			Open(w_datos_contrato_derecho)	
		CASE "R" // Reprogramacion Cta. Mant.
			if isvalid(w_datos_contrato_reprogramacion_cta_mant) then close(w_datos_contrato_reprogramacion_cta_mant)
			open(w_datos_contrato_reprogramacion_cta_mant)
		CASE "A" // Aumento Capacidad
			if isvalid(w_datos_contrato_aumento_capacidad) then close(w_datos_contrato_aumento_capacidad)
			open(w_datos_contrato_aumento_capacidad)
	END CHOOSE
end if
end event

type st_1 from statictext within w_buscar_ficha
integer x = 2245
integer y = 1888
integer width = 416
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Sepultura"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_sepult from editmask within w_buscar_ficha
integer x = 2674
integer y = 1868
integer width = 439
integer height = 100
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if not isnull(em_sepult.text) and em_sepult.text<>'' then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_buscar_ficha
integer x = 3122
integer y = 1864
integer width = 105
integer height = 104
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar3.bmp"
alignment htextalign = left!
end type

event clicked;long	ll_fila,ll_tot_reg

ll_tot_reg		= dw_lista.RowCount()
if ll_tot_reg > 0 then
	if is_opcion='FT' then
		ll_fila	= dw_lista.Find("sepultura_origen = '"+trim(em_sepult.text)+"' or sepultura_destino = '"+trim(em_sepult.text)+"'",1, ll_tot_reg)
	else
		ll_fila	= dw_lista.Find("sepultura = '"+trim(em_sepult.text)+"'",1, ll_tot_reg)
	end if
	if ll_fila > 0 then
		dw_lista.setfocus()
		dw_lista.scrolltorow(ll_fila)
	else
		messagebox("Advertencia","Sepultura Nº "+trim(em_sepult.text)+" No fue encontrada")
	end if
end if

end event

type cb_modificar from commandbutton within w_buscar_ficha
integer x = 293
integer y = 1872
integer width = 677
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modificar Fecha Sepultación"
end type

event clicked;String	ls_string,ls_base,ls_serie,ls_sector,ls_sepultura,ls_nro_tecnico
Long		ll_row,ll_cod_parque,ll_capacidad,ll_corr_interno
date		ldt_fecha_sepult
Double	ll_numero

if isvalid(w_modificar_fecha_sepultacion) then close(w_modificar_fecha_sepultacion)
ll_row					= dw_lista.getrow()
if ll_row>0 then
	if is_opcion='FT' then
		ls_base				= dw_lista.getitemstring(ll_row,'base_origen')
		ls_serie				= dw_lista.getitemstring(ll_row,'serie_origen')
		ll_numero			= dw_lista.getitemnumber(ll_row,'numero_origen')
		ldt_fecha_sepult	= date(dw_lista.getitemdatetime(ll_row,'fecha_traslado'))
		ls_sector				= dw_lista.getitemstring(ll_row,'sector_origen')
		ls_sepultura			= dw_lista.getitemstring(ll_row,'sepultura_origen')
		ll_cod_parque		= dw_lista.getitemnumber(ll_row,'cod_parque')
		ll_capacidad			= dw_lista.getitemnumber(ll_row,'capacidad_destino')
		ls_nro_tecnico		= dw_lista.getitemstring(ll_row,'numero_tecnico_origen')
		ll_corr_interno		= dw_lista.getitemnumber(ll_row,'folio')
	elseif is_opcion='FS' or is_opcion='CO' then
		ls_base				= dw_lista.getitemstring(ll_row,'base')
		ls_serie				= dw_lista.getitemstring(ll_row,'serie')
		ll_numero			= dw_lista.getitemnumber(ll_row,'numero')
		ldt_fecha_sepult	= date(dw_lista.getitemdatetime(ll_row,'fecha_sepultacion'))
		ls_sector				= dw_lista.getitemstring(ll_row,'sector')
		ls_sepultura			= dw_lista.getitemstring(ll_row,'sepultura')
		ll_cod_parque		= dw_lista.getitemnumber(ll_row,'cod_parque')
		ll_capacidad			= dw_lista.getitemnumber(ll_row,'capacidad')
		ls_nro_tecnico		= dw_lista.getitemstring(ll_row,'numero_tecnico')
		ll_corr_interno		= dw_lista.getitemnumber(ll_row,'correlativo_interno')
	elseif is_opcion='FR' then
		ls_base				= dw_lista.getitemstring(ll_row,'base')
		ls_serie				= dw_lista.getitemstring(ll_row,'serie')
		ll_numero			= dw_lista.getitemnumber(ll_row,'numero')
		ldt_fecha_sepult	= date(dw_lista.getitemdatetime(ll_row,'fecha_sepultacion'))
		ls_sector				= dw_lista.getitemstring(ll_row,'sector')
		ls_sepultura			= dw_lista.getitemstring(ll_row,'sepultura')
		ll_cod_parque		= dw_lista.getitemnumber(ll_row,'cod_parque')
		ll_capacidad			= dw_lista.getitemnumber(ll_row,'capacidad')
		ls_nro_tecnico		= dw_lista.getitemstring(ll_row,'numero_tecnico')
		ll_corr_interno		= dw_lista.getitemnumber(ll_row,'correlativo_interno')
	elseif is_opcion='CT' then
		ls_base				= dw_lista.getitemstring(ll_row,'base')
		ls_serie				= dw_lista.getitemstring(ll_row,'serie')
		ll_numero			= dw_lista.getitemnumber(ll_row,'numero')
		ldt_fecha_sepult	= date(dw_lista.getitemdatetime(ll_row,'fecha_sepultacion'))
		ls_sector				= dw_lista.getitemstring(ll_row,'sector')
		ls_sepultura			= dw_lista.getitemstring(ll_row,'sepultura')
		ll_cod_parque		= dw_lista.getitemnumber(ll_row,'cod_parque')
		ll_capacidad			= dw_lista.getitemnumber(ll_row,'capacidad')
		ls_nro_tecnico		= dw_lista.getitemstring(ll_row,'numero_tecnico')
		ll_corr_interno		= dw_lista.getitemnumber(ll_row,'correlativo_interno')
	end if
	if isnull(ls_nro_tecnico) then ls_nro_tecnico=''
	if isnull(ls_base) then ls_base=''
	if isnull(ls_serie) then ls_serie=''
	if isnull(ls_sector) then ls_sector=''
	if isnull(ls_sepultura) then ls_sepultura=''
	if isnull(ll_numero) then ll_numero=0
	if isnull(ll_cod_parque) then ll_cod_parque=0
	if isnull(ll_capacidad) then ll_capacidad=0
	if isnull(ll_capacidad) then ll_capacidad=0
	if isnull(ll_corr_interno) then ll_corr_interno=0
	ls_string						= is_opcion+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ldt_fecha_sepult,'dd/mm/yyyy')+'~t'+ls_sector+'~t'+ls_sepultura+'~t'+string(ll_cod_parque)+'~t'+string(ll_capacidad)+'~t'+ls_nro_tecnico+'~t'+string(ll_corr_interno)
	openwithparm(w_modificar_fecha_sepultacion,ls_string)
else
	messagebox("Advertencia","Debe Seleccionar Ficha a Modificar")
end if
end event

type cb_1 from commandbutton within w_buscar_ficha
integer x = 1298
integer y = 1868
integer width = 229
integer height = 96
integer taborder = 80
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

type cb_2 from commandbutton within w_buscar_ficha
integer x = 1719
integer y = 1868
integer width = 219
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_buscar_ficha
integer x = 1527
integer y = 1868
integer width = 192
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_imprimir from commandbutton within w_buscar_ficha
integer x = 1938
integer y = 1868
integer width = 219
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
	if is_opcion='FS' or is_opcion='FT' or is_opcion='FR' or is_opcion='CT' then
		dw_lista.object.datawindow.zoom        = 52
	else
		dw_lista.object.datawindow.zoom        = 95
	end if
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview  = False
	dw_lista.object.datawindow.zoom           = 100
end if
end event

type cb_aceptar from commandbutton within w_buscar_ficha
integer x = 37
integer y = 1872
integer width = 247
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_cod_parque,ll_parque,ll_imagen,ll_cod_parque_des,ll_tot_reg,ll_indi,ll_reg,ll_capacidad,ll_cap_ori,ll_tot_reg_arancel,ll_indi_arancel,&
			ll_cap_des,ll_cod_parque_ori,ll_tot_reg_fall
String	ls_sector,ls_sepultura,ls_base,ls_serie,ls_ciu_fall,ls_ciu_tit,ls_nombre_archivo,ls_base_ori,&
			ls_base_des,ls_ciudad_ori,ls_ciudad_des,ls_sector_des,ls_nom_fall,ls_pat_fall,ls_tipo_cons,ls_tipo_cons_ori,&
			ls_tipo_cons_des,ls_serie_ori,ls_serie_des
datetime	ldt_fecha_sepult
Double	ll_numero,ll_numero_ori,ll_numero_des
datawindowchild	idw_detalle_55,idw_detalle6,idw_detalle7,idw_detalle8,idw_detalle9,idw_detalle10,idw_detalle11

il_row							= dw_lista.getrow()
if dw_lista.rowcount()>0 and il_row>0 then
	if isvalid(w_ingreso_ficha_sepultacion) then
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		ls_sector				= dw_lista.getitemstring(il_row,'sector')
		ls_sepultura			= dw_lista.getitemstring(il_row,'sepultura')
		ldt_fecha_sepult	= dw_lista.getitemdatetime(il_row,'fecha_sepultacion')
		ls_nom_fall			= dw_lista.getitemstring(il_row,'nombre_fallecido')//'nombre_fallecido')
		ls_pat_fall			= dw_lista.getitemstring(il_row,'ap_paterno_fall')//'apellido_paterno_fall')
		ll_capacidad			= dw_lista.getitemnumber(il_row,'capacidad')
		ll_tot_reg			= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_sepultacion.tab_1.tabpage_2.dw_ant_titular.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		ll_tot_reg_fall		= w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		ll_tot_reg_arancel	= w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		if ll_tot_reg_arancel > 0 then
			for ll_indi_arancel=1 to ll_tot_reg_arancel
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_1')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_1',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_2')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_2',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_3')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_3',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_4')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_4',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_5')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_5',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_6')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_6',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_1')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_1',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_2')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_2',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_3')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_3',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_4')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_4',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_5')) then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_5',1) 
				end if
				if isnull(w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_6')) then
				w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_6',1) 
				end if
			next 
			w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.accepttext()
		end if
		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.enabled		= true
		w_ingreso_ficha_sepultacion.tab_1.tabpage_2.dw_ant_titular.enabled		= true
		w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.enabled			= true
		w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.enabled		= true
		ll_parque		= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
		ls_sector		= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector')
		ls_base		= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'base')
		ls_ciu_fall	= w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.getitemstring(1,'codigo_ciudad_fall')
		ls_ciu_tit		= w_ingreso_ficha_sepultacion.tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
		ls_serie		= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'serie')
		ll_numero	= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'numero')
		if ls_base='O' or ls_base='U' then
			SELECT	"OFERTA_V"."TIPO_CONS"  
			INTO 		:ls_tipo_cons  
			FROM 	"OFERTA_V",   
						"CADENA"  
			WHERE  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
					 (("CADENA"."CODIGO" = :ls_base ) AND  
					 ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
					 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )   
			USING	sqlca;

		else
			ls_tipo_cons	= 'T'
		end if
		if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getchild('serie',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.retrieve(ls_base)

		w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.getchild('codigo_comuna_fall',idw_detalle_55)
		idw_detalle_55.settransobject(sqlca)
		idw_detalle_55.retrieve(ls_ciu_fall)

		w_ingreso_ficha_sepultacion.tab_1.tabpage_2.dw_ant_titular.getchild('codigo_comuna_titular',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.retrieve(ls_ciu_tit)

		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getchild('nivel',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then	idw_detalle2.insertrow(0)

		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getchild('sector',idw_detalle7)
		idw_detalle7.settransobject(sqlca)
		if is_tipo_sep='SE' or is_tipo_sep= 'CO' then
			idw_detalle7.retrieve(ll_parque,is_tipo_sep)
		else
			idw_detalle7.retrieve(ll_parque)
		end if
		w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getchild('codigo_parentesco',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		if gs_conexion	= "Parque El Prado" then
			idw_detalle4.retrieve(1,is_opcion)
		elseif gs_conexion = "Parque La Foresta" then
			idw_detalle4.retrieve(11,is_opcion)
		end if

		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura',idw_detalle8)
		idw_detalle8.settransobject(sqlca)
		idw_detalle8.retrieve(ll_parque,ls_sector)
		for ll_indi=1 to ll_tot_reg
			w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estado_reg','S')
			w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estadistico',is_usuario_esta)
		next
		
		for ll_indi=1 to ll_tot_reg_fall
			w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'c_estadistico',is_usuario_esta)
		next
		//w_ingreso_ficha_sepultacion.pb_fin.triggerevent(clicked!)
		
		ll_reg	= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.find("nombre_fallecido='"+ls_nom_fall+"' and ap_paterno_fall='"+ls_pat_fall+"'",1,ll_tot_reg)
		if ll_reg>0 then
			w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_reg)
			w_ingreso_ficha_sepultacion.tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_reg)
			w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_reg)
			w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_reg)
		end if
		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		close(w_buscar_ficha)
		
	elseif isvalid(w_ingreso_ficha_cadaver_transito) then
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		ls_sector				= dw_lista.getitemstring(il_row,'sector')
		ls_sepultura			= dw_lista.getitemstring(il_row,'sepultura')
		ldt_fecha_sepult	= dw_lista.getitemdatetime(il_row,'fecha_sepultacion')
		ls_nom_fall			= dw_lista.getitemstring(il_row,'nombre_fallecido')//'nombre_fallecido')
		ls_pat_fall			= dw_lista.getitemstring(il_row,'ap_paterno_fall')//'apellido_paterno_fall')
		ll_capacidad			= dw_lista.getitemnumber(il_row,'capacidad')
		ll_tot_reg			= w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_2.dw_ant_titular.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		ll_tot_reg_arancel	= w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		if ll_tot_reg_arancel > 0 then
			for ll_indi_arancel=1 to ll_tot_reg_arancel
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_1')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_1',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_2')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_2',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_3')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_3',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_4')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_4',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_5')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_5',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_6')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_6',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_1')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_1',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_2')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_2',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_3')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_3',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_4')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_4',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_5')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_5',1) 
				end if
				if isnull(w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_6')) then
					w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_6',1) 
				end if
			next 
			w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.accepttext()
		end if
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_2.dw_ant_titular.enabled		= true
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_1.dw_ant_fall.enabled		= true
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.enabled		= true
		ll_parque			= w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
		ls_sector			= w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector')
		ls_base			= w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'base')
		ls_serie			= w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'serie')
		ll_numero		= w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'numero')
		ls_ciu_fall		= w_ingreso_ficha_cadaver_transito.tab_1.tabpage_1.dw_ant_fall.getitemstring(1,'codigo_ciudad_fall')
		ls_ciu_tit			= w_ingreso_ficha_cadaver_transito.tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.getchild('serie',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.retrieve(ls_base)

		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_1.dw_ant_fall.getchild('codigo_comuna_fall',idw_detalle_55)
		idw_detalle_55.settransobject(sqlca)
		idw_detalle_55.retrieve(ls_ciu_fall)

		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_2.dw_ant_titular.getchild('codigo_comuna_titular',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.retrieve(ls_ciu_tit)

		if ls_base='O' or ls_base='U' then
			SELECT	"OFERTA_V"."TIPO_CONS"  
			INTO 		:ls_tipo_cons  
			FROM 	"OFERTA_V",   
						"CADENA"  
			WHERE  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
					 (("CADENA"."CODIGO" = :ls_base ) AND  
					 ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
					 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )   
			USING	sqlca;

		else
			ls_tipo_cons	= 'T'
		end if
		if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.getchild('nivel',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then	idw_detalle2.insertrow(0)

		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.getchild('sector',idw_detalle7)
		idw_detalle7.settransobject(sqlca)
		idw_detalle7.retrieve(ll_parque)
		
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.getchild('codigo_parentesco',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		if gs_conexion	= "Parque El Prado" then
			idw_detalle4.retrieve(1,is_opcion)
		elseif gs_conexion = "Parque La Foresta" then
			idw_detalle4.retrieve(11,is_opcion)
		end if
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura',idw_detalle8)
		idw_detalle8.settransobject(sqlca)
		idw_detalle8.retrieve(ll_parque,ls_sector)
		for ll_indi=1 to ll_tot_reg
			w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estado_reg','S')
			w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estadistico',is_usuario_esta)
		next
		//w_ingreso_ficha_sepultacion.pb_fin.triggerevent(clicked!)
		
		ll_reg	= w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.find("nombre_fallecido='"+ls_nom_fall+"' and ap_paterno_fall='"+ls_pat_fall+"'",1,ll_tot_reg)
		if ll_reg > 0 then
			w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_reg)
			w_ingreso_ficha_cadaver_transito.tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_reg)
			w_ingreso_ficha_cadaver_transito.tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_reg)
			w_ingreso_ficha_cadaver_transito.tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_reg)
		end if
//		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
		w_ingreso_ficha_cadaver_transito.tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		close(w_buscar_ficha)
		
	elseif isvalid(w_ingreso_ficha_reduccion) then
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		ls_sector				= dw_lista.getitemstring(il_row,'sector')
		ls_sepultura			= dw_lista.getitemstring(il_row,'sepultura')
		ldt_fecha_sepult	= dw_lista.getitemdatetime(il_row,'fecha_sepultacion')
		ls_nom_fall			= dw_lista.getitemstring(il_row,'nombre_fallecido')//'nombre_fallecido')
		ls_pat_fall			= dw_lista.getitemstring(il_row,'ap_paterno_fall')//'apellido_paterno_fall')
		ll_capacidad			= dw_lista.getitemnumber(il_row,'capacidad')
		ll_tot_reg			= w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_reduccion.tab_1.tabpage_2.dw_ant_titular.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_reduccion.tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		ll_tot_reg_arancel	= w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		if ll_tot_reg_arancel > 0 then
			for ll_indi_arancel=1 to ll_tot_reg_arancel
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_1')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_1',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_2')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_2',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_3')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_3',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_4')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_4',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_5')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_5',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_6')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_6',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_1')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_1',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_2')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_2',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_3')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_3',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_4')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_4',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_5')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_5',1) 
				end if
				if isnull(w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_6')) then
					w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_6',1) 
				end if
			next 
			w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.accepttext()
		end if
		w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
		w_ingreso_ficha_reduccion.tab_1.tabpage_2.dw_ant_titular.enabled		= true
		w_ingreso_ficha_reduccion.tab_1.tabpage_1.dw_ant_fall.enabled			= true
		w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.enabled		= true
		ll_parque		= w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
		ls_sector		= w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector')
		ls_base		= w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'base')
		ls_serie		= w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'serie')
		ll_numero	= w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'numero')
		ls_ciu_fall	= w_ingreso_ficha_reduccion.tab_1.tabpage_1.dw_ant_fall.getitemstring(1,'codigo_ciudad_fall')
		ls_ciu_tit		= w_ingreso_ficha_reduccion.tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
		w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.getchild('serie',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.retrieve(ls_base)

		w_ingreso_ficha_reduccion.tab_1.tabpage_1.dw_ant_fall.getchild('codigo_comuna_fall',idw_detalle_55)
		idw_detalle_55.settransobject(sqlca)
		idw_detalle_55.retrieve(ls_ciu_fall)

		w_ingreso_ficha_reduccion.tab_1.tabpage_2.dw_ant_titular.getchild('codigo_comuna_titular',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.retrieve(ls_ciu_tit)
		
		if ls_base='O' or ls_base='U' then
			SELECT	"OFERTA_V"."TIPO_CONS"  
			INTO 		:ls_tipo_cons  
			FROM 	"OFERTA_V",   
						"CADENA"  
			WHERE  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
					 (("CADENA"."CODIGO" = :ls_base ) AND  
					 ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
					 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero ) )   
			USING	sqlca;

		else
			ls_tipo_cons	= 'T'
		end if
		if isnull(ls_tipo_cons) or ls_tipo_cons='' then ls_tipo_cons = 'T'
		w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.getchild('nivel',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_capacidad,ll_cod_parque,ls_tipo_cons)=0 then	idw_detalle2.insertrow(0)

		w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.getchild('sector',idw_detalle7)
		idw_detalle7.settransobject(sqlca)
		idw_detalle7.retrieve(ll_parque)
		
		w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.getchild('codigo_parentesco',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		if gs_conexion	= "Parque El Prado" then
			idw_detalle4.retrieve(1,is_opcion)
		elseif gs_conexion = "Parque La Foresta" then
			idw_detalle4.retrieve(11,is_opcion)
		end if

		w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura',idw_detalle8)
		idw_detalle8.settransobject(sqlca)
		idw_detalle8.retrieve(ll_parque,ls_sector)
		for ll_indi=1 to ll_tot_reg
			w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estado_reg','S')
			w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estadistico',is_usuario_esta)
		next
		//w_ingreso_ficha_sepultacion.pb_fin.triggerevent(clicked!)
		
		ll_reg	= w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.find("nombre_fallecido='"+ls_nom_fall+"' and ap_paterno_fall='"+ls_pat_fall+"'",1,ll_tot_reg)
		if ll_reg>0 then
			w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_reg)
			w_ingreso_ficha_reduccion.tab_1.tabpage_2.dw_ant_titular.scrolltorow(ll_reg)
			w_ingreso_ficha_reduccion.tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_reg)
			w_ingreso_ficha_reduccion.tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_reg)
		end if
		w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
		w_ingreso_ficha_reduccion.tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		close(w_buscar_ficha)
	elseif isvalid(w_carta_sepultacion) then
		ls_sector				= dw_lista.getitemstring(il_row,'sector')
		ls_sepultura			= dw_lista.getitemstring(il_row,'sepultura')
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		ls_nom_fall			= dw_lista.getitemstring(il_row,'nombre_fallecido')
		ls_pat_fall			= dw_lista.getitemstring(il_row,'apellido_paterno_fall')
		
		ll_tot_reg			= w_carta_sepultacion.dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)
		if ll_tot_reg> 0 then
			for ll_indi=1 to ll_tot_reg
				w_carta_sepultacion.dw_lista.setitem(ll_indi,'c_estadistico',is_usuario_esta)
			next
		end if
		w_carta_sepultacion.dw_lista.accepttext()
		w_carta_sepultacion.dw_parque.reset()
		w_carta_sepultacion.dw_parque.insertrow(0)
		w_carta_sepultacion.dw_buscar.reset()
		w_carta_sepultacion.dw_buscar.getchild('sepultura',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.reset()
		idw_detalle6.insertrow(0)
		
		w_carta_sepultacion.dw_buscar.getchild('sector',idw_detalle5)
		idw_detalle5.reset()
		idw_detalle5.insertrow(0)
		w_carta_sepultacion.dw_buscar.insertrow(0)
		
		ll_reg	= w_carta_sepultacion.dw_lista.find("nombre_fallecido='"+ls_nom_fall+"' and apellido_paterno_fall='"+ls_pat_fall+"'",1,ll_tot_reg)
		if ll_reg>0 then
			w_carta_sepultacion.dw_lista.scrolltorow(ll_reg)
		end if
		w_carta_sepultacion.dw_lista.setfocus()
		close(w_buscar_ficha)
		
	elseif isvalid(w_solicitud_grabacion_lapida) then
		ls_sector				= dw_lista.getitemstring(il_row,'sector')
		ls_sepultura			= dw_lista.getitemstring(il_row,'sepultura')
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		ls_nom_fall			= dw_lista.getitemstring(il_row,'nombre_fallecido')
		ls_pat_fall			= dw_lista.getitemstring(il_row,'apellido_paterno_fall')
		ll_tot_reg			= w_solicitud_grabacion_lapida.dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				w_solicitud_grabacion_lapida.dw_lista.setitem(ll_indi,'c_estadistico',is_usuario_esta)
			next
			w_solicitud_grabacion_lapida.dw_lista.accepttext()
		end if
		ll_imagen			= dw_lista.getitemnumber(il_row,'codigo_imagen')
		SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
		INTO 		:ls_nombre_archivo  
		FROM 	"FICHA_CUNOS"  
		WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_imagen   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			w_solicitud_grabacion_lapida.dw_lista.object.p_1.Filename 	= ls_nombre_archivo
		else
			w_solicitud_grabacion_lapida.dw_lista.object.p_1.Filename 	= ''
		end if
		w_solicitud_grabacion_lapida.dw_parque.reset()
		w_solicitud_grabacion_lapida.dw_parque.insertrow(0)
		w_solicitud_grabacion_lapida.dw_buscar.reset()
		w_solicitud_grabacion_lapida.dw_buscar.getchild('sepultura',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.reset()
		idw_detalle6.insertrow(0)
		
		w_solicitud_grabacion_lapida.dw_buscar.getchild('sector',idw_detalle5)
		idw_detalle5.reset()
		idw_detalle5.insertrow(0)

		w_solicitud_grabacion_lapida.dw_buscar.insertrow(0)
		
		ll_reg	= w_solicitud_grabacion_lapida.dw_lista.find("nombre_fallecido='"+ls_nom_fall+"' and apellido_paterno_fall='"+ls_pat_fall+"'",1,ll_tot_reg)
		if ll_reg>0 then
			w_solicitud_grabacion_lapida.dw_buscar.scrolltorow(ll_reg)
		end if
		w_solicitud_grabacion_lapida.dw_lista.setfocus()
		close(w_buscar_ficha)
		
	elseif isvalid(w_ingreso_ficha_traslado) then
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		ls_sector				= dw_lista.getitemstring(il_row,'sector_origen')
		ls_sepultura			= dw_lista.getitemstring(il_row,'sepultura_origen')
		ldt_fecha_sepult	= dw_lista.getitemdatetime(il_row,'fecha_traslado')
		ls_base_ori			= dw_lista.getitemstring(il_row,'base_origen')
		ls_serie_ori			= dw_lista.getitemstring(il_row,'serie_origen')
		ll_numero_ori		= dw_lista.getitemnumber(il_row,'numero_origen')
		if ls_base_ori='O' or ls_base_ori='U' then
			SELECT	"OFERTA_V"."TIPO_CONS"  
			INTO 		:ls_tipo_cons_ori  
			FROM 	"CADENA",   
						"OFERTA_V"  
			WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = :ls_base_ori ) AND  
					 ( "OFERTA_V"."SERIE" = :ls_serie_ori ) AND  
					 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_ori ) )   
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				ls_tipo_cons_ori	= 'T'
			end if
		else
			ls_tipo_cons_ori		= 'T'
		end if
		if isnull(ls_tipo_cons_ori) or ls_tipo_cons_ori='' then ls_tipo_cons_ori = 'T'
		ll_cod_parque_des	= dw_lista.getitemnumber(il_row,'cod_parque_destino')
		ls_sector_des		= dw_lista.getitemstring(il_row,'sector_destino')
		ls_ciudad_ori		= dw_lista.getitemstring(il_row,'cod_ciudad_titular_origen')
		ls_ciudad_des		= dw_lista.getitemstring(il_row,'cod_ciudad_titular_destino')
		ls_nom_fall			= dw_lista.getitemstring(il_row,'nombre_fallecido')
		ls_pat_fall			= dw_lista.getitemstring(il_row,'apellido_paterno_fall')
		ll_cod_parque_ori	= dw_lista.getitemnumber(il_row,'cod_parque_origen')
		ls_base_des			= dw_lista.getitemstring(il_row,'base_destino')
		ls_serie_des			= dw_lista.getitemstring(il_row,'base_destino')
		ll_numero_des		= dw_lista.getitemnumber(il_row,'numero_destino')
		if ls_base_des='O' or ls_base_ori='U' then
			SELECT	"OFERTA_V"."TIPO_CONS"  
			INTO 		:ls_tipo_cons_des  
			FROM 	"CADENA",   
						"OFERTA_V"  
			WHERE  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = :ls_base_des ) AND  
					 ( "OFERTA_V"."SERIE" = :ls_serie_des ) AND  
					 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero_des ) )   
			USING	sqlca;
			if sqlca.sqlcode<>0 then
				ls_tipo_cons_des	= 'T'
			end if
		else
			ls_tipo_cons_des		= 'T'
		end if
		if isnull(ls_tipo_cons_des) or ls_tipo_cons_des='' then ls_tipo_cons_des = 'T'
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.enabled		= true
		w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.enabled			= true
		w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.enabled		= true
		ll_tot_reg			= w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		ll_tot_reg_fall		= w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		ll_tot_reg_arancel	= w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		for ll_indi=1 to ll_tot_reg
			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estado','S')
			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estadistico',is_usuario_esta)
			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'c_estadistico',is_usuario_esta)
			if w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.getitemnumber(ll_indi,'rut_fallecido')>0 then
				w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'c_estado','S')
			else
				w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'c_estado','N')
			end if
			w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'c_estado','S')
		next
		if ll_tot_reg > 0 then
			ll_cap_ori	= w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'capacidad_origen')
			ll_cap_des	= w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'capacidad_destino')
		end if
		if ll_tot_reg_arancel > 0 then
			for ll_indi_arancel=1 to ll_tot_reg_arancel
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_1')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_1',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_2')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_2',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_3')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_3',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_4')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_4',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_5')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_5',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_pago_6')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_pago_6',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_1')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_1',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_2')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_2',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_3')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_3',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_4')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_4',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_5')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_5',1) 
				end if
				if isnull(w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.getitemnumber(ll_indi_arancel,'sw_dscto_6')) then
					w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi_arancel,'sw_dscto_6',1) 
				end if
			next 
			w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.accepttext()
		end if
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.accepttext()
		w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.accepttext()
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('nivel_sepultura_origen',idw_detalle13)
		idw_detalle13.settransobject(sqlca)
		if idw_detalle13.retrieve(ll_cap_ori,ll_cod_parque_ori,ls_tipo_cons_ori)=0 then idw_detalle13.insertrow(0)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('nivel_sepultura_destino',idw_detalle14)
		idw_detalle14.settransobject(sqlca)
		if idw_detalle14.retrieve(ll_cap_des,ll_cod_parque_des,ls_tipo_cons_des)=0 then idw_detalle14.insertrow(0)

		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('serie_origen',idw_detalle_55)
		idw_detalle_55.settransobject(sqlca)
		idw_detalle_55.retrieve(ls_base_ori)

		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('serie_destino',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.retrieve(ls_base_des)

		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('sector_origen',idw_detalle7)
		idw_detalle7.settransobject(sqlca)
		idw_detalle7.retrieve(ll_cod_parque)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('sector_destino',idw_detalle8)
		idw_detalle8.settransobject(sqlca)
		idw_detalle8.retrieve(ll_cod_parque_des)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura_origen',idw_detalle9)
		idw_detalle9.settransobject(sqlca)
		idw_detalle9.retrieve(ll_cod_parque,ls_sector)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura_destino',idw_detalle10)
		idw_detalle10.settransobject(sqlca)
		idw_detalle10.retrieve(ll_cod_parque_des,ls_sector_des)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('cod_comuna_titular_origen',idw_detalle11)
		idw_detalle11.settransobject(sqlca)
		idw_detalle11.retrieve(ls_ciudad_ori)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('cod_comuna_titular_destino',idw_detalle12)
		idw_detalle12.settransobject(sqlca)
		idw_detalle12.retrieve(ls_ciudad_des)
		
		ll_reg	= w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.find("nombre_fallecido='"+ls_nom_fall+"' and apellido_paterno_fall='"+ls_pat_fall+"'",1,ll_tot_reg)
		if ll_reg>0 then
			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.scrolltorow(ll_reg)
			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.scrolltorow(ll_reg)
			w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.scrolltorow(ll_reg)
		end if
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora_fijada')
		close(w_buscar_ficha)
	end if
end if
end event

type cb_cerrar from commandbutton within w_buscar_ficha
integer x = 3301
integer y = 1872
integer width = 261
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_buscar_ficha)
end event

type dw_parque from datawindow within w_buscar_ficha
integer x = 1134
integer y = 40
integer width = 594
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.accepttext()
dw_lista.reset()
end event

type st_16 from statictext within w_buscar_ficha
integer x = 901
integer y = 48
integer width = 210
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_buscar_ficha
integer x = 1769
integer y = 20
integer width = 151
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Datetime	ld_fec_ini
Long		ll_cod_parque
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

ld_fec_ini	= datetime(date(em_fec_ini.text),lt_ini)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	if ll_cod_parque>0 then
		idw_detalle5.retrieve(ll_cod_parque)
		if dw_lista.retrieve(ld_fec_ini,ll_cod_parque)=0 then
			messagebox("Advertencia","No Registra Dato")
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Parque")
		dw_parque.setfocus()
	end if
end if
end event

type st_2 from statictext within w_buscar_ficha
integer x = 32
integer y = 48
integer width = 361
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_buscar_ficha
integer x = 421
integer y = 40
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type p_ini from picture within w_buscar_ficha
integer x = 782
integer y = 40
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fec_ini.text = Message.StringParm
END IF
end event

type dw_lista from datawindow within w_buscar_ficha
integer x = 37
integer y = 172
integer width = 3525
integer height = 1652
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_ficha_sepultacion_co"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna
if row>0 then
	il_row		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
else
	ls_columna	= dwo.name
	if ls_columna='t_rojo' or ls_columna='t_anulados' then
		dw_lista.SETfilter('estado_reg = "A"')
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra dato")
		end if
	elseif ls_columna='t_blanco' or ls_columna='t_pendientes' then
		if is_opcion='FS' then
			dw_lista.SETfilter('c_fecha_2="No" and estado_reg = "P" and today() <= fecha_sepultacion')
		elseif is_opcion='FT' then
			dw_lista.SETfilter('c_fecha_2="No" and estado_reg = "P" and today() <= fecha_traslado')
		elseif is_opcion='GL' then
			dw_lista.SETfilter('c_fecha_2="No" and estado_reg = "P" and today() <= fecha')
		elseif is_opcion='CS' then
			dw_lista.SETfilter('c_fecha_2="No" and estado_reg = "P" and today() <= fecha_sepultacion')
		elseif is_opcion='FR' then
			dw_lista.SETfilter('c_fecha_2="No" and estado_reg = "P" and today() <= fecha_sepultacion')
		elseif is_opcion='CT' then
			dw_lista.SETfilter('c_fecha_2="No" and estado_reg = "P" and today() <= fecha_sepultacion')
		end if
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra dato")
		end if
	elseif ls_columna='t_amarillo' or ls_columna='t_gestionados' then
		dw_lista.SETfilter('estado_reg = "G"')
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra dato")
		end if
	elseif ls_columna='t_verde' or ls_columna='t_vencer' then
		dw_lista.SETfilter('c_fecha_2="Si" and estado_reg="P"')
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra dato")
		end if
	elseif ls_columna='t_celeste' or ls_columna='t_vencidos' then
		if is_opcion='FS' then
			dw_lista.SETfilter('today() > fecha_sepultacion and c_fecha_2="No"')
		elseif is_opcion='FT' then
			dw_lista.SETfilter('today() > fecha_traslado and c_fecha_2="No"')
		elseif is_opcion='GL' then
			dw_lista.SETfilter('today() > fecha and c_fecha_2="No"')
		elseif is_opcion='CS' then
			dw_lista.SETfilter('today() > fecha_sepultacion and c_fecha_2="No"')
		elseif is_opcion='FR' then
			dw_lista.SETfilter('today() > fecha_sepultacion and c_fecha_2="No"')
		elseif is_opcion='CT' then
			dw_lista.SETfilter('today() > fecha_sepultacion and c_fecha_2="No"')
		end if
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra dato")
		end if
	elseif ls_columna='t_todo' then
		dw_lista.SETfilter('')
		dw_lista.filter()
	elseif ls_columna='t_condolencias' then
		dw_lista.SETfilter('sw_condolencia=0')
		dw_lista.filter()
	end if
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	cb_aceptar.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_buscar_ficha
integer x = 1275
integer y = 1816
integer width = 910
integer height = 172
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

