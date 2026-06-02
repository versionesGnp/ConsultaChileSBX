forward
global type w_solicitud_grabacion_lapida from window
end type
type cb_recep_lapida from commandbutton within w_solicitud_grabacion_lapida
end type
type cb_crear from commandbutton within w_solicitud_grabacion_lapida
end type
type dw_solicitud from datawindow within w_solicitud_grabacion_lapida
end type
type cb_2 from commandbutton within w_solicitud_grabacion_lapida
end type
type pb_fin from picturebutton within w_solicitud_grabacion_lapida
end type
type pb_antes from picturebutton within w_solicitud_grabacion_lapida
end type
type pb_sigue from picturebutton within w_solicitud_grabacion_lapida
end type
type pb_primer from picturebutton within w_solicitud_grabacion_lapida
end type
type dw_buscar from datawindow within w_solicitud_grabacion_lapida
end type
type dw_print from datawindow within w_solicitud_grabacion_lapida
end type
type cb_print from commandbutton within w_solicitud_grabacion_lapida
end type
type cb_limpiar from commandbutton within w_solicitud_grabacion_lapida
end type
type cb_nueva from commandbutton within w_solicitud_grabacion_lapida
end type
type pb_ok from picturebutton within w_solicitud_grabacion_lapida
end type
type dw_parque from datawindow within w_solicitud_grabacion_lapida
end type
type st_16 from statictext within w_solicitud_grabacion_lapida
end type
type cb_buscar from commandbutton within w_solicitud_grabacion_lapida
end type
type cb_1 from commandbutton within w_solicitud_grabacion_lapida
end type
type gb_2 from groupbox within w_solicitud_grabacion_lapida
end type
type dw_lista from datawindow within w_solicitud_grabacion_lapida
end type
type gb_1 from groupbox within w_solicitud_grabacion_lapida
end type
end forward

global type w_solicitud_grabacion_lapida from window
integer width = 3195
integer height = 2868
boolean titlebar = true
string title = "Solicitud de Grabación de Lapida"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_recep_lapida cb_recep_lapida
cb_crear cb_crear
dw_solicitud dw_solicitud
cb_2 cb_2
pb_fin pb_fin
pb_antes pb_antes
pb_sigue pb_sigue
pb_primer pb_primer
dw_buscar dw_buscar
dw_print dw_print
cb_print cb_print
cb_limpiar cb_limpiar
cb_nueva cb_nueva
pb_ok pb_ok
dw_parque dw_parque
st_16 st_16
cb_buscar cb_buscar
cb_1 cb_1
gb_2 gb_2
dw_lista dw_lista
gb_1 gb_1
end type
global w_solicitud_grabacion_lapida w_solicitud_grabacion_lapida

type variables
datawindowchild			idw_detalle5,idw_detalle6
long	il_sw
string	is_nombre
end variables

forward prototypes
public function string wf_valida_largo_nombre (long al_largo, string as_columna)
end prototypes

public function string wf_valida_largo_nombre (long al_largo, string as_columna);string ls_pasa='S'

if il_sw > 0 then
	if al_largo > 32 and as_columna='nombre_fallecido_lapida' then
		messagebox('Advertencia','No puede Ingresar más de 32 Caracteres en Nombre')
		dw_lista.setitem(1,'nombre_fallecido_lapida',is_nombre)
		dw_lista.setfocus()
		dw_lista.setcolumn('nombre_fallecido_lapida')
		ls_pasa	= 'N'
		il_sw		= 0
	end if	
	dw_lista.accepttext()
end if
return ls_pasa
end function

on w_solicitud_grabacion_lapida.create
this.cb_recep_lapida=create cb_recep_lapida
this.cb_crear=create cb_crear
this.dw_solicitud=create dw_solicitud
this.cb_2=create cb_2
this.pb_fin=create pb_fin
this.pb_antes=create pb_antes
this.pb_sigue=create pb_sigue
this.pb_primer=create pb_primer
this.dw_buscar=create dw_buscar
this.dw_print=create dw_print
this.cb_print=create cb_print
this.cb_limpiar=create cb_limpiar
this.cb_nueva=create cb_nueva
this.pb_ok=create pb_ok
this.dw_parque=create dw_parque
this.st_16=create st_16
this.cb_buscar=create cb_buscar
this.cb_1=create cb_1
this.gb_2=create gb_2
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_recep_lapida,&
this.cb_crear,&
this.dw_solicitud,&
this.cb_2,&
this.pb_fin,&
this.pb_antes,&
this.pb_sigue,&
this.pb_primer,&
this.dw_buscar,&
this.dw_print,&
this.cb_print,&
this.cb_limpiar,&
this.cb_nueva,&
this.pb_ok,&
this.dw_parque,&
this.st_16,&
this.cb_buscar,&
this.cb_1,&
this.gb_2,&
this.dw_lista,&
this.gb_1}
end on

on w_solicitud_grabacion_lapida.destroy
destroy(this.cb_recep_lapida)
destroy(this.cb_crear)
destroy(this.dw_solicitud)
destroy(this.cb_2)
destroy(this.pb_fin)
destroy(this.pb_antes)
destroy(this.pb_sigue)
destroy(this.pb_primer)
destroy(this.dw_buscar)
destroy(this.dw_print)
destroy(this.cb_print)
destroy(this.cb_limpiar)
destroy(this.cb_nueva)
destroy(this.pb_ok)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.cb_buscar)
destroy(this.cb_1)
destroy(this.gb_2)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long	ll_new
gf_centrar(w_solicitud_grabacion_lapida)
dw_parque.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_solicitud.settransobject(sqlca)
dw_parque.insertrow(0)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
dw_buscar.settransobject(sqlca)
dw_buscar.getchild('sepultura',idw_detalle6)
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

dw_buscar.getchild('sector',idw_detalle5)
idw_detalle5.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(1,'cod_parque',1)
	idw_detalle5.retrieve(1)
elseif gs_conexion = "Parque La Foresta" then
	dw_parque.setitem(1,'cod_parque',11)
	idw_detalle5.retrieve(11)
end if
ll_new		= dw_buscar.insertrow(0)
gs_ventana	= 'w_solicitud_grabacion_lapida'
f_valida_objeto2()
dw_buscar.accepttext()
end event

type cb_recep_lapida from commandbutton within w_solicitud_grabacion_lapida
integer x = 1806
integer y = 2612
integer width = 439
integer height = 112
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Instalación Lápida"
end type

event clicked;String		ls_sector,ls_sepultura,ls_string
Long		ll_correlativo

if isvalid(w_ingreso_fecha_lapida) then close(w_ingreso_fecha_lapida)
ls_sector			= dw_lista.getitemstring(dw_lista.getrow(),'sector')
ls_sepultura		= dw_lista.getitemstring(dw_lista.getrow(),'sepultura')
ll_correlativo	= dw_lista.getitemnumber(dw_lista.getrow(),'correlativo')
if not isnull(ls_sector) and not isnull(ls_sepultura) and ll_correlativo > 0 then
	ls_string		= ls_sector+'~t'+ls_sepultura+'~t'+string(ll_correlativo)
	OpenWithParm(w_ingreso_fecha_lapida, ls_string)
end if
end event

type cb_crear from commandbutton within w_solicitud_grabacion_lapida
integer x = 1426
integer y = 2612
integer width = 375
integer height = 112
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crear S&olicitud"
end type

event clicked;String	ls_sector,ls_sepultura,ls_nro_tecnico,ls_ap_pat,ls_ap_mat,ls_nombre,ls_prim_sepult,ls_string,&
			ls_dv_titular,ls_base,ls_serie
Long		ll_cod_parque,ll_capacidad,ll_cod_imagen,ll_cod_relig,ll_rut_titular,ll_count_fall
Date		ldt_fecha
Double	ll_numero
//ls_sector			= dw_lista.getitemstring(1,'sector')
//ls_sepultura		= dw_lista.getitemstring(1,'sepultura')
//ll_cod_parque		= dw_lista.getitemnumber(1,'cod_parque')
dw_buscar.accepttext()
dw_parque.accepttext()
ls_sector			= dw_buscar.getitemstring(1,'sector')
ls_sepultura		= dw_buscar.getitemstring(1,'sepultura')
ll_cod_parque		= dw_parque.getitemnumber(1,'cod_parque')
if ll_cod_parque>0 and not isnull(ls_sector) and not isnull(ls_sepultura) then
	SELECT	Count("FALLECIDOS"."LLAVE")  
	INTO 		:ll_count_fall  
	FROM 		"FALLECIDOS"  
	WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND  
			 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
			 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque )    AND
			 ( "FALLECIDOS"."ESTADO_REG" = 'A' )
	USING		sqlca;
	if ll_count_fall > 0 then
		SELECT	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"FALLECIDOS"."N_TEC",	"PAGO_OFERTA"."CAPACIDAD",	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO"
		INTO 		:ll_rut_titular,	:ls_dv_titular,	:ls_nombre,				:ls_ap_pat,					:ls_ap_mat,					:ls_nro_tecnico,			:ll_capacidad,					:ls_base,				:ls_serie,			:ll_numero
		FROM 		"FALLECIDOS",	"CADENA", 	"CLIENTE",	"PAGO_OFERTA",	"OFERTA_V"  
		WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 ( "FALLECIDOS"."BASE" = "CADENA"."CODIGO" ) and  
				 ( "FALLECIDOS"."SS" = "CADENA"."SERIE" ) and  
				 ( "FALLECIDOS"."CONTRATO" = "CADENA"."NUMERO" ) and  
				 ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
				 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 ( "CADENA"."CODIGO" = 'O' ) and
				 (("FALLECIDOS"."SECTOR" = :ls_sector ) AND  
				 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
				 ( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND
				 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque ) AND  
				 ( "FALLECIDOS"."LLAVE" = 	(	SELECT 	MAX("FALLECIDOS"."LLAVE") 
														FROM 		"FALLECIDOS" 
														WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND 
																 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND 
																 ( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND
																 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque ) ) ) )  
		UNION
		SELECT	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"FALLECIDOS"."N_TEC",	"CONTRATO"."CAPACIDAD",	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO"
		FROM 		"FALLECIDOS",	"CADENA", 	"CLIENTE",	"CONTRATO"  
		WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 ( "FALLECIDOS"."BASE" = "CADENA"."CODIGO" ) and  
				 ( "FALLECIDOS"."SS" = "CADENA"."SERIE" ) and  
				 ( "FALLECIDOS"."CONTRATO" = "CADENA"."NUMERO" ) and  
				 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
				 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
				 ( "CADENA"."CODIGO" = 'C' ) and
				 (("FALLECIDOS"."SECTOR" = :ls_sector ) AND  
				 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
				 ( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND
				 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque ) AND  
				 ( "FALLECIDOS"."LLAVE" = 	(	SELECT 	MAX("FALLECIDOS"."LLAVE") 
														FROM 		"FALLECIDOS" 
														WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND 
																 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND 
																 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque )  AND
																 ( "FALLECIDOS"."ESTADO_REG" = 'A' ) ) ) )  
		USING		sqlca;
		ls_prim_sepult	= 'N'
	else
		ls_nro_tecnico	= dw_lista.getitemstring(1,'numero_tecnico')
		ll_capacidad	= dw_lista.getitemnumber(1,'capacidad')
		ldt_fecha		= date(dw_lista.getitemdatetime(1,'fecha'))
		ls_ap_pat		= dw_lista.getitemstring(1,'apellido_paterno_titular')
		ls_ap_mat		= dw_lista.getitemstring(1,'apellido_materno_titular')
		ls_nombre		= dw_lista.getitemstring(1,'nombre_titular')
		ls_prim_sepult	= dw_lista.getitemstring(1,'primera_sepultura')
		ll_cod_imagen	= dw_lista.getitemnumber(1,'codigo_imagen')
		ll_cod_relig	= dw_lista.getitemnumber(1,'codigo_religion')
		ll_rut_titular	= dw_lista.getitemnumber(1,'rut_titular')
		ls_dv_titular	= dw_lista.getitemstring(1,'dv_titular')
		ls_base			= dw_lista.getitemstring(1,'base')
		ls_serie			= dw_lista.getitemstring(1,'serie')
		ll_numero		= dw_lista.getitemnumber(1,'numero')
	end if
	ls_string		= ls_sector+'~t'+ls_sepultura+'~t'+string(ll_cod_parque)+'~t'+ls_nro_tecnico+'~t'+string(ll_capacidad)+'~t'+string(ldt_fecha)+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_nombre+'~t'+ls_prim_sepult+'~t'+string(ll_cod_imagen)+'~t'+string(ll_cod_relig)+'~t'+string(ll_rut_titular)+'~t'+ls_dv_titular+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_ingreso_solicitud_grabacion_lapida) then close(w_ingreso_solicitud_grabacion_lapida)
	openwithparm(w_ingreso_solicitud_grabacion_lapida,ls_string)
else
	if isnull(ls_sector) then
		messagebox("Advertencia","Debe Ingresar Sector")
		dw_buscar.setcolumn('sector')
	elseif isnull(ls_sepultura) then
		messagebox("Advertencia","Debe Ingresar Sepultura")
		dw_buscar.setcolumn('sepultura')
	elseif ll_cod_parque=0 or isnull(ll_cod_parque) then
		messagebox("Advertencia","Debe Ingresar Parque")
		dw_parque.setfocus()
	end if
end if
end event

type dw_solicitud from datawindow within w_solicitud_grabacion_lapida
boolean visible = false
integer x = 745
integer y = 2752
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_imprimir_grabacion_lapida"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_solicitud_grabacion_lapida
integer x = 763
integer y = 2624
integer width = 407
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir &Solicitud"
end type

event clicked;Long		ll_corr,ll_parque,ll_imagen
String	ls_sector,ls_sepul,ls_nombre_archivo
Datetime	ldt_fecha

if dw_lista.rowcount() > 0 then 
	ll_corr		= dw_lista.getitemnumber(dw_lista.getrow(),'folio')
	ll_parque	= dw_lista.getitemnumber(dw_lista.getrow(),'cod_parque')
	ls_sector	= dw_lista.getitemstring(dw_lista.getrow(),'sector')
	ls_sepul		= dw_lista.getitemstring(dw_lista.getrow(),'sepultura')
	ldt_fecha	= dw_lista.getitemdatetime(dw_lista.getrow(),'fecha')
	ll_imagen	= dw_lista.getitemnumber(dw_lista.getrow(),'codigo_imagen')
	if not isnull(ls_sepul) and ll_parque>0 then
		if dw_solicitud.retrieve(ls_sector,ls_sepul,ll_parque,ldt_fecha,ll_corr)>0 then
			SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
			INTO 		:ls_nombre_archivo  
			FROM 		"FICHA_CUNOS"  
			WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_imagen   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_solicitud.object.p_1.Filename 	= ls_nombre_archivo
			else
				dw_solicitud.object.p_1.Filename 	= ''
			end if
			f_Print( dw_solicitud )
			dw_solicitud.print()
		else
			messagebox("Advertencia","No Registra Solicitud Grabación de Lápida")
		end if
	end if
end if

end event

type pb_fin from picturebutton within w_solicitud_grabacion_lapida
integer x = 2642
integer y = 2628
integer width = 114
integer height = 88
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount())
dw_lista.setfocus()
end event

type pb_antes from picturebutton within w_solicitud_grabacion_lapida
integer x = 2528
integer y = 2628
integer width = 114
integer height = 88
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollNextPage( )
dw_lista.setfocus()
end event

type pb_sigue from picturebutton within w_solicitud_grabacion_lapida
integer x = 2414
integer y = 2628
integer width = 114
integer height = 88
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollPriorPage( )
dw_lista.setfocus()
end event

type pb_primer from picturebutton within w_solicitud_grabacion_lapida
integer x = 2299
integer y = 2628
integer width = 114
integer height = 88
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
dw_lista.setfocus()
end event

type dw_buscar from datawindow within w_solicitud_grabacion_lapida
integer x = 864
integer y = 40
integer width = 1563
integer height = 104
integer taborder = 20
string title = "none"
string dataobject = "dwe_seleccionar_sector_sepultura"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_sector
Long		ll_cod_parque

this.accepttext()
dw_lista.reset()
dw_lista.insertrow(0)
ls_columna	= dwo.name
if ls_columna='cod_parque' then
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	idw_detalle5.retrieve(ll_cod_parque)
elseif ls_columna='sector' then
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	ls_sector		= dw_buscar.getitemstring(1,'sector')
	idw_detalle6.retrieve(ll_cod_parque,ls_sector)
end if
end event

type dw_print from datawindow within w_solicitud_grabacion_lapida
boolean visible = false
integer x = 1243
integer y = 2752
integer width = 411
integer height = 432
string dataobject = "dw_solicitud_grabacion_lapida_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_solicitud_grabacion_lapida
boolean visible = false
integer x = 1234
integer y = 2820
integer width = 238
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimir"
end type

event clicked;Long		ll_corr,ll_parque,ll_imagen
String	ls_sector,ls_sepul,ls_nombre_archivo
datetime	ldt_fecha

if dw_lista.rowcount() > 0 then 
	ll_corr			= dw_lista.getitemnumber(dw_lista.getrow(),'folio')
	ll_parque		= dw_lista.getitemnumber(dw_lista.getrow(),'cod_parque')
	ls_sector		= dw_lista.getitemstring(dw_lista.getrow(),'sector')
	ls_sepul			= dw_lista.getitemstring(dw_lista.getrow(),'sepultura')
	ldt_fecha		= dw_lista.getitemdatetime(dw_lista.getrow(),'fecha')
	dw_print.reset()
	if dw_print.retrieve(ls_sector,ls_sepul,ll_parque,ldt_fecha,ll_corr)>0 then
		ll_imagen	= dw_print.getitemnumber(1,'codigo_imagen')
		SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
		INTO 		:ls_nombre_archivo  
		FROM 		"FICHA_CUNOS"  
		WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_imagen   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_print.object.p_1.Filename 	= ls_nombre_archivo
		else
			dw_print.object.p_1.Filename 	= ''
		end if
		f_Print( dw_print )
		dw_print.print()
		dw_print.print()
	else
		messagebox("Advertencia","No registra Dato a Imprimir")
	end if
end if

end event

type cb_limpiar from commandbutton within w_solicitud_grabacion_lapida
integer x = 1179
integer y = 2624
integer width = 206
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		ll_resp,ll_new

ll_resp	= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then
	dw_parque.reset()
	dw_print.reset()
	dw_parque.insertrow(0)
	dw_lista.reset()
	dw_lista.insertrow(0)
	dw_buscar.reset()
	dw_buscar.getchild('sepultura',idw_detalle6)
	idw_detalle6.settransobject(sqlca)
	idw_detalle6.reset()
	idw_detalle6.insertrow(0)
	
	dw_buscar.getchild('sector',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	if gs_conexion	= "Parque El Prado" then
		dw_parque.setitem(1,'cod_parque',1)
		idw_detalle5.retrieve(1)
	elseif gs_conexion = "Parque La Foresta" then
		dw_parque.setitem(1,'cod_parque',11)
		idw_detalle5.retrieve(11)
	end if
	ll_new	= dw_buscar.insertrow(0)
	dw_buscar.accepttext()
end if
dw_parque.setfocus()
end event

type cb_nueva from commandbutton within w_solicitud_grabacion_lapida
integer x = 46
integer y = 2612
integer width = 265
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_nom_lap,ls_prim_sep,ls_tipo_con
Long		ll_imagen,ll_indi,ll_tot_reg
Datetime	ldt_fec_nac,ldt_fec_def

dw_lista.accepttext()
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg>0 then
	ls_nom_lap	= dw_lista.getitemstring(dw_lista.getrow(),'nombre_fallecido_lapida')
	ldt_fec_nac	= dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_nacimiento_lapida')
	ldt_fec_def	= dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_defuncion_lapida')
	ll_imagen	= dw_lista.getitemnumber(dw_lista.getrow(),'codigo_imagen')
	ls_prim_sep	= dw_lista.getitemstring(dw_lista.getrow(),'primera_sepultura')
	ls_tipo_con	= dw_lista.getitemstring(dw_lista.getrow(),'tipo_construccion')
	if isnull(ls_nom_lap) or ls_nom_lap='' or ls_nom_lap='-' then
		messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('nombre_fallecido_lapida')
	elseif isnull(ldt_fec_nac) then
		messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Fallecido")
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_nacimiento_lapida')
	elseif isnull(ldt_fec_def) then
		messagebox("Advertencia","Debe Ingresar Fecha Definción")
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_defuncion_lapida')
	elseif (ll_imagen=0 or isnull(ll_imagen)) and ls_prim_sep='S' then
		messagebox("Advertencia","Debe Ingresar Cuño Religioso")
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('codigo_imagen')
	elseif ls_prim_sep='' or isnull(ls_prim_sep) or ls_prim_sep='-' then
		messagebox("Advertencia","Debe Ingresar Opción de Sepultura")
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('primera_sepultura')
	elseif ls_tipo_con='' or isnull(ls_tipo_con) then
		messagebox("Advertencia","Debe Ingresar Tipo Construcción")
		dw_lista.scrolltorow(ll_indi)
		dw_lista.setfocus()
		dw_lista.setcolumn('tipo_construccion')
	else
		if dw_lista.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			if isvalid(w_mantenedor_estadistico) then 
				w_mantenedor_estadistico.setfocus()
				close(w_solicitud_grabacion_lapida)
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type pb_ok from picturebutton within w_solicitud_grabacion_lapida
integer x = 2487
integer y = 24
integer width = 160
integer height = 132
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;String	ls_sector,ls_sepultura,ls_nombre_archivo
Long		ll_cod_parque,ll_imagen,ll_fila

dw_lista.reset()
dw_lista.insertrow(0)
ls_sector		= dw_buscar.getitemstring(1,'sector')
ls_sepultura	= dw_buscar.getitemstring(1,'sepultura')
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if ll_cod_parque>0 then
	if ll_cod_parque=102 then
		dw_lista.dataobject	= 'dw_solicitud_grabacion_lapida_manantial'
	else
		dw_lista.dataobject	= 'dw_solicitud_grabacion_lapida'
	end if
//	if ll_cod_parque=102 or ll_cod_parque=11 or ll_cod_parque=103 then
//		dw_lista.dataobject	= 'dw_solicitud_grabacion_lapida_manantial'
//	else
//		dw_lista.dataobject	= 'dw_solicitud_grabacion_lapida'
//	end if
	dw_lista.settransobject(sqlca)
end if
if not isnull(ls_sector) and not isnull(ls_sepultura) and ll_cod_parque>0 then
	if dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)=0 then
		dw_lista.insertrow(0)
		messagebox("Advertencia","No Registra Dato")
	else
		ll_imagen	= dw_lista.getitemnumber(1,'codigo_imagen')
		SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
		INTO 		:ls_nombre_archivo  
		FROM 		"FICHA_CUNOS"  
		WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_imagen   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_lista.object.p_1.Filename 	= ls_nombre_archivo
		else
			dw_lista.object.p_1.Filename 	= ''
		end if
		ll_fila	= dw_lista.Find("estado_reg <> 'G'", 1, dw_lista.RowCount())
		if ll_fila > 0 then
			cb_nueva.enabled	= true
		else
			cb_nueva.enabled	= true
		end if
		dw_lista.scrolltorow(dw_lista.rowcount())
	end if
else
	if isnull(ls_sector) then
		messagebox("Advertencia","Debe Ingresar Sector")
		dw_buscar.setcolumn('sector')
	elseif isnull(ls_sepultura) then
		messagebox("Advertencia","Debe Ingresar Sepultura")
		dw_buscar.setcolumn('sepultura')
	elseif ll_cod_parque=0 or isnull(ll_cod_parque) then
		messagebox("Advertencia","Debe Ingresar Parque")
		dw_parque.setfocus()
	end if
end if
end event

type dw_parque from datawindow within w_solicitud_grabacion_lapida
integer x = 256
integer y = 44
integer width = 594
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long	ll_cod_parque
dw_parque.accepttext()
dw_lista.reset()
dw_lista.insertrow(0)
ll_cod_parque	= this.getitemnumber(1,'cod_parque')
idw_detalle5.retrieve(ll_cod_parque)
if ll_cod_parque=102 then
	dw_lista.dataobject	= 'dw_solicitud_grabacion_lapida_manantial'
else
	dw_lista.dataobject	= 'dw_solicitud_grabacion_lapida'
end if
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
end event

type st_16 from statictext within w_solicitud_grabacion_lapida
integer x = 23
integer y = 52
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

type cb_buscar from commandbutton within w_solicitud_grabacion_lapida
integer x = 315
integer y = 2612
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Solicitud"
end type

event clicked;if isvalid(w_buscar_ficha) then close(w_buscar_ficha)
OpenWithParm(w_buscar_ficha, "GL")
end event

type cb_1 from commandbutton within w_solicitud_grabacion_lapida
integer x = 2871
integer y = 2612
integer width = 261
integer height = 112
integer taborder = 150
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_solicitud_grabacion_lapida)
end event

type gb_2 from groupbox within w_solicitud_grabacion_lapida
integer x = 736
integer y = 2572
integer width = 672
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_lista from datawindow within w_solicitud_grabacion_lapida
integer x = 46
integer y = 192
integer width = 3077
integer height = 2380
integer taborder = 40
string title = "none"
string dataobject = "dw_solicitud_grabacion_lapida_manantial"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_nombre_archivo,ls_estado_instal,ls_nombre,ls_pasa_p
datetime	ldt_fecha_instal
Long		ll_imagen,ll_largo_nombre

this.accepttext()
ls_columna		= dwo.name
if ls_columna='codigo_imagen' then
	ll_imagen	= this.getitemnumber(this.getrow(),'codigo_imagen')
	SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
	INTO 		:ls_nombre_archivo  
	FROM 	"FICHA_CUNOS"  
	WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_imagen   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_lista.object.p_1.Filename 	= ls_nombre_archivo
	else
		dw_lista.object.p_1.Filename 	= ''
	end if
elseif ls_columna='estado_instalada' or ls_columna='fecha_instalada' then
	ls_estado_instal		= this.getitemstring(this.getrow(),'estado_instalada')
	ldt_fecha_instal			= this.getitemdatetime(this.getrow(),'fecha_instalada')
	if not isnull(ls_estado_instal) and not isnull(ldt_fecha_instal) then
		dw_lista.setitem(dw_lista.getrow(),'usuario_instalada',gs_user)
		dw_lista.accepttext()
	end if
	if not isnull(ls_estado_instal) and isnull(ldt_fecha_instal) then
		dw_lista.setitem(dw_lista.getrow(),'fecha_instalada',date(gdt_fec_sistema))
		dw_lista.setitem(dw_lista.getrow(),'usuario_instalada',gs_user)
		dw_lista.accepttext()
	end if
elseif ls_columna <> 'nombre_fallecido_lapida' then
	this.accepttext()
	ls_nombre					= dw_lista.getitemstring(1,'nombre_fallecido_lapida')
	is_nombre					= ls_nombre
	il_sw ++
	if ls_nombre <> '' and ls_nombre <> '-' then
		ll_largo_nombre		= len(ls_nombre)
		ls_pasa_p 				= wf_valida_largo_nombre(ll_largo_nombre,'nombre_fallecido_lapida')	
		if ls_pasa_p='N' then
			dw_lista.setitem(1,'nombre_fallecido_lapida',ls_nombre)
			dw_lista.setfocus()
			dw_lista.setcolumn('nombre_fallecido_lapida')
		end if
	end if
end if
dw_lista.accepttext()
end event

event clicked;String		ls_columna,ls_fecha,ls_estado_instal
datetime	ldt_fecha_instal

ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_2'
		if dw_lista.getitemnumber(dw_lista.getrow(),'rut_titular') > 0 and dw_lista.getitemstring(dw_lista.getrow(),'estado_reg')='P' then
			ls_fecha	= string(date(dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_recepcion')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_lista.setitem(dw_lista.getrow(),'fecha_recepcion',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_lista.setitem(dw_lista.getrow(),'fecha_recepcion',date(ls_fecha))
			End if
		end if
		
	CASE 'p_3'
		if dw_lista.getitemnumber(dw_lista.getrow(),'rut_titular') > 0 then
			ls_fecha	= string(date(dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_instalada')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_lista.setitem(dw_lista.getrow(),'fecha_instalada',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha					= trim(Message.StringParm)
				dw_lista.setitem(dw_lista.getrow(),'fecha_instalada',date(ls_fecha))
				ls_estado_instal		= this.getitemstring(this.getrow(),'estado_instalada')
				ldt_fecha_instal			= this.getitemdatetime(this.getrow(),'fecha_instalada')
				if not isnull(ls_estado_instal) and not isnull(ldt_fecha_instal) then
					dw_lista.setitem(dw_lista.getrow(),'usuario_instalada',gs_user)
					dw_lista.accepttext()
				end if
			End if
		end if	
END CHOOSE
dw_lista.accepttext()
end event

type gb_1 from groupbox within w_solicitud_grabacion_lapida
integer x = 2277
integer y = 2576
integer width = 503
integer height = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

