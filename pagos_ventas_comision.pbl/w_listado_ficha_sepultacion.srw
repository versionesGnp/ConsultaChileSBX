forward
global type w_listado_ficha_sepultacion from window
end type
type st_1 from statictext within w_listado_ficha_sepultacion
end type
type em_ctto from editmask within w_listado_ficha_sepultacion
end type
type pb_buscar from picturebutton within w_listado_ficha_sepultacion
end type
type cb_aceptar from commandbutton within w_listado_ficha_sepultacion
end type
type cb_imprimir from commandbutton within w_listado_ficha_sepultacion
end type
type cb_ordenar from commandbutton within w_listado_ficha_sepultacion
end type
type cb_exportar from commandbutton within w_listado_ficha_sepultacion
end type
type pb_aceptar from picturebutton within w_listado_ficha_sepultacion
end type
type p_termino from picture within w_listado_ficha_sepultacion
end type
type p_inicio from picture within w_listado_ficha_sepultacion
end type
type st_desde from statictext within w_listado_ficha_sepultacion
end type
type em_termino from editmask within w_listado_ficha_sepultacion
end type
type em_inicio from editmask within w_listado_ficha_sepultacion
end type
type st_hasta from statictext within w_listado_ficha_sepultacion
end type
type dw_lista from datawindow within w_listado_ficha_sepultacion
end type
type cb_cerrar from commandbutton within w_listado_ficha_sepultacion
end type
type gb_periodo from groupbox within w_listado_ficha_sepultacion
end type
type gb_1 from groupbox within w_listado_ficha_sepultacion
end type
end forward

global type w_listado_ficha_sepultacion from window
integer width = 3570
integer height = 2380
boolean titlebar = true
string title = "Ficha de Sepultación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_1 st_1
em_ctto em_ctto
pb_buscar pb_buscar
cb_aceptar cb_aceptar
cb_imprimir cb_imprimir
cb_ordenar cb_ordenar
cb_exportar cb_exportar
pb_aceptar pb_aceptar
p_termino p_termino
p_inicio p_inicio
st_desde st_desde
em_termino em_termino
em_inicio em_inicio
st_hasta st_hasta
dw_lista dw_lista
cb_cerrar cb_cerrar
gb_periodo gb_periodo
gb_1 gb_1
end type
global w_listado_ficha_sepultacion w_listado_ficha_sepultacion

type variables
Long	il_mes,il_ano,il_row
end variables

on w_listado_ficha_sepultacion.create
this.st_1=create st_1
this.em_ctto=create em_ctto
this.pb_buscar=create pb_buscar
this.cb_aceptar=create cb_aceptar
this.cb_imprimir=create cb_imprimir
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.pb_aceptar=create pb_aceptar
this.p_termino=create p_termino
this.p_inicio=create p_inicio
this.st_desde=create st_desde
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_hasta=create st_hasta
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.gb_periodo=create gb_periodo
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.em_ctto,&
this.pb_buscar,&
this.cb_aceptar,&
this.cb_imprimir,&
this.cb_ordenar,&
this.cb_exportar,&
this.pb_aceptar,&
this.p_termino,&
this.p_inicio,&
this.st_desde,&
this.em_termino,&
this.em_inicio,&
this.st_hasta,&
this.dw_lista,&
this.cb_cerrar,&
this.gb_periodo,&
this.gb_1}
end on

on w_listado_ficha_sepultacion.destroy
destroy(this.st_1)
destroy(this.em_ctto)
destroy(this.pb_buscar)
destroy(this.cb_aceptar)
destroy(this.cb_imprimir)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.pb_aceptar)
destroy(this.p_termino)
destroy(this.p_inicio)
destroy(this.st_desde)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_hasta)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.gb_periodo)
destroy(this.gb_1)
end on

event open;string	ls_fecha_ini
long 		ll_nulo,ll_mes_ini,ll_ano_ini
datetime	ldt_fecha_inicio,ldt_fecha_termino

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_listado_ficha_sepultacion)
em_termino.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
ldt_fecha_termino	= datetime(date(em_termino.text),time('00:00:00'))
ll_mes_ini			= month(date(gdt_fec_sistema))
ll_ano_ini			= year(date(gdt_fec_sistema))
ls_fecha_ini		= '01/'+ string(ll_mes_ini,'00')+ '/' +string(ll_ano_ini,'0000')
em_inicio.text		= string(ls_fecha_ini)
ldt_fecha_inicio	= datetime(date(em_inicio.text),time('00:00:00'))


end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type st_1 from statictext within w_listado_ficha_sepultacion
integer x = 1714
integer y = 2164
integer width = 503
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Nº Contrato:"
boolean focusrectangle = false
end type

type em_ctto from editmask within w_listado_ficha_sepultacion
integer x = 2226
integer y = 2152
integer width = 448
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if double(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_listado_ficha_sepultacion
integer x = 2679
integer y = 2152
integer width = 110
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string		ls_string
double	ldb_numero

ldb_numero	= double(em_ctto.text)
ll_tot_reg	= dw_lista.rowcount()
if ldb_numero>0 and ll_tot_reg>0 then
	ls_string	= "numero = "+string(ldb_numero)
	ll_fila = dw_lista.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.SelectRow(ll_fila, true)
	else
		messagebox("Advertencia","Nº Contrato No Existe en Lista")
		dw_lista.scrolltorow(1)
	end if
end if

end event

type cb_aceptar from commandbutton within w_listado_ficha_sepultacion
integer x = 37
integer y = 2156
integer width = 325
integer height = 84
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string	ls_nulo,ls_base,ls_serie,ls_nombre_tit,ls_a_paterno_tit,ls_a_materno_tit,ls_dv_tit,ls_direcc_tit,ls_direcc_num_tit,&
			ls_direcc_block_tit,ls_direcc_depto_tit,ls_ciudad_tit,ls_comuna_tit,ls_nombre_fall,ls_a_paterno_fall,ls_a_materno_fall,&
			ls_dv_fall,ls_sector,ls_sepult,ls_fono_tit,ls_estado_modif,ls_glosa,ls_glosa_detalle,ls_area,ls_tipo_sepult,ls_uso,&
			ls_tipo_const,ls_string
long		ll_nulo,ll_cod_funer,ll_cod_parque,ll_rut_tit,ll_rut_fall,ll_cod_estado,ll_capac,ll_consul_det,&
			ll_numero
datetime	ldt_nulo,ldt_fecha_ctto
double	ldb_contrato,ldb_valor_sepul


Setnull(ls_nulo);Setnull(ll_nulo);Setnull(ldt_nulo)
dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ls_base					= dw_lista.getitemstring(il_row,'base')
	ls_serie					= dw_lista.getitemstring(il_row,'serie')
	ldb_contrato				= dw_lista.getitemnumber(il_row,'numero')
	ll_cod_funer			= dw_lista.getitemnumber(il_row,'codigo_funeraria')
	ldt_fecha_ctto			= dw_lista.getitemdatetime(il_row,'fecha_contrato')
	ll_cod_parque			= dw_lista.getitemnumber(il_row,'cod_parque')
	ls_nombre_tit			= dw_lista.getitemstring(il_row,'nombre_titular')
	ls_a_paterno_tit		= dw_lista.getitemstring(il_row,'ap_paterno_titular')
	ls_a_materno_tit		= dw_lista.getitemstring(il_row,'ap_materno_titular')
	ll_rut_tit				= dw_lista.getitemnumber(il_row,'rut_titular')
	ls_dv_tit				= dw_lista.getitemstring(il_row,'dv_titular')
	ls_direcc_tit			= dw_lista.getitemstring(il_row,'direccion_titular')
	ls_direcc_num_tit		= dw_lista.getitemstring(il_row,'num_direccion_titular')
	ls_direcc_block_tit	= dw_lista.getitemstring(il_row,'block_direccion_titular')
	ls_direcc_depto_tit	= dw_lista.getitemstring(il_row,'depto_direccion_titular')
	ls_ciudad_tit			= dw_lista.getitemstring(il_row,'codigo_ciudad_titular')
	ls_comuna_tit			= dw_lista.getitemstring(il_row,'codigo_comuna_titular')
	ls_nombre_fall			= dw_lista.getitemstring(il_row,'nombre_fallecido')
	ls_a_paterno_fall		= dw_lista.getitemstring(il_row,'ap_paterno_fall')
	ls_a_materno_fall		= dw_lista.getitemstring(il_row,'ap_materno_fall')
	ll_rut_fall				= dw_lista.getitemnumber(il_row,'rut_fallecido')
	ls_dv_fall				= dw_lista.getitemstring(il_row,'dv_fallecido')
	ll_cod_estado			= 1
	ls_sector				= dw_lista.getitemstring(il_row,'sector')
	ls_sepult				= dw_lista.getitemstring(il_row,'sepultura')
	ls_fono_tit				= dw_lista.getitemstring(il_row,'fono_titular')
	ll_capac					= dw_lista.getitemnumber(il_row,'capacidad')
	ls_uso 					= 'NI'
	
//	SELECT	"BASE_PLANI"."AREA",	"BASE_PLANI"."TIPO_SEP"  
//	INTO 		:ls_area,				:ls_tipo_sepult
//	FROM 		"BASE_PLANI"  
//	WHERE		( "BASE_PLANI"."SECTOR" = :ls_sector ) AND  
//				( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque ) 
//	USING		sqlca;
//	if sqlca.sqlcode = 0 then
//	end if
//	SELECT	"LISTA_PRECIO"."T_CONST"  
//	INTO		:ls_tipo_const  
//	FROM		"LISTA_PRECIO"  
//	WHERE 	( "LISTA_PRECIO"."SECTOR" = :ls_area ) AND  
//				( "LISTA_PRECIO"."CAPACIDAD" = :ll_capac ) AND  
//				( "LISTA_PRECIO"."CANAL" = :ls_uso ) AND  
//				( "LISTA_PRECIO"."T_SEPULT" = :ls_tipo_sepult ) AND
//				( "LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque)
//	USING		sqlca;
//	if sqlca.sqlcode = 0 then
//	end if
//		
//	SELECT	"LISTA_PRECIO"."VALOR"   
//	INTO		:ldb_valor_sepul  
//	FROM		"LISTA_PRECIO"  
//	WHERE 	( "LISTA_PRECIO"."SECTOR" = :ls_sector ) AND  
//				( "LISTA_PRECIO"."CAPACIDAD" = :ll_capac ) AND  
//				( "LISTA_PRECIO"."CANAL" = :ls_uso ) AND  
//				( "LISTA_PRECIO"."T_CONST" = :ls_tipo_const ) AND  
//				( "LISTA_PRECIO"."T_SEPULT" = :ls_tipo_sepult ) AND
//				( "LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque)
//	USING		sqlca;
//	if sqlca.sqlcode = 0 then
//	end if
//	SELECT	"FUNERARIA_ESTADO"."GLOSA"
//	INTO		:ls_glosa
//	FROM		"FUNERARIA_ESTADO"  
//	WHERE		"FUNERARIA_ESTADO"."CODIGO" = :ll_cod_estado
//	USING		sqlca;
//	if sqlca.sqlcode = 0 then
//		ls_glosa_detalle		= 'SE CREA SOLICITUD USUARIO: '+ gs_user +', CON FECHA: '+string(gdt_fec_sistema,'dd/mm/yyyy')+', GLOSA: '+ls_glosa
//	end if
//	SELECT	COUNT("FUNERARIA_PAGO_COMISION"."NUMERO")
//	INTO		:ll_numero_consul					
//	FROM		"FUNERARIA_PAGO_COMISION"  
//	WHERE		( "FUNERARIA_PAGO_COMISION"."BASE" = :ls_base ) AND  
//				( "FUNERARIA_PAGO_COMISION"."SERIE" = :ls_serie ) AND  
//				( "FUNERARIA_PAGO_COMISION"."NUMERO" = :ll_contrato )
//	USING sqlca;
//	if isnull(ll_numero_consul) or ll_numero_consul=0 then
//		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ll_contrato>0 then
//			INSERT INTO	"FUNERARIA_PAGO_COMISION" 
//							( "FECHA_CREA",		"COD_FUNERARIA",	"FOLIO",		"NUMERO_DATO",	"COD_AGENTE",	"FECHA_CIERRE",	"BASE",		"SERIE",		"NUMERO",		"FECHA_CTTO",		"AREA",		"PRECIO_CTTO",		"MONEDA",	"UF_DIA",	"NOMBRE_REPRESENTANTE",	"A_PATERNO_REPRESENTANTE",	"A_MATERNO_REPRESENTANTE",	"RUT_REPRESENTANTE",	"DV_REPRESENTENTE",	"PORCE_COMISION",	"TOTAL_PAGO",	"DIRECCION_REPRESENTANTE",	"NUMERO_REPRESENTANTE",	"BLOCK_REPRESENTANTE",	"DEPTO_REPRESENTANTE",	"COMUNA_REPRESENTANTE",	"CIUDAD_REPRESENTANTE",	"NOMBRE_CONTACTO",	"A_PATERNO_CONTACTO",	"A_MATERNO_CONTACTO",	"FONO_CONTACTO",	"COD_PARQUE",		"NETO_COMISION",	"RETENCION",	"NOMBRE_TITULAR",	"A_PATERNO_TITULAR",	"A_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"DIRECCION_TITULAR",	"DIRECCION_NUMERO_TITULAR",	"DIRECCION_BLOCK_TITULAR",	"DIRECCION_DEPTO_TITULAR",	"NOMBRE_FALLECIDO",	"A_PATERNO_FALLECIDO",	"A_MATERNO_FALLECIDO",	"RUT_FALLECIDO",	"DV_FALLECIDO",	"COMUNA_TITULAR",	"CIUDAD_TITULAR",	"COD_ESTADO",		"PLANI_SECTOR",	"PLANI_SEPULTURA",	"MES_CIERRE",	"ANO_CIERRE",	"HORA_CIERRE",	"MINUTO_CIERRE",	"FONO_TITULAR",	"FONO_REPRESENT",	"FECHA_ESTADO",	"COD_SUPERVISOR",	"CAPACIDAD",	"USO",	"T_CONST",			"T_SEPULT",			"PRECIO_LISTA",	"PORCE_DESCTO",	"ESTADO" )  
//			VALUES 		( :gdt_fec_sistema,	:ll_cod_funer,		0,				0,					:ls_nulo,		:ldt_nulo,			:ls_base,	:ls_serie,	:ll_contrato,	:ldt_fecha_ctto,	:ls_area,	:ldb_valor_sepul,	:ls_nulo,	:ll_nulo,	:ls_nulo,					:ls_nulo,						:ls_nulo,						:ll_nulo,				:ls_nulo,				:ll_nulo,			:ll_nulo,		:ls_nulo,						:ls_nulo,					:ls_nulo,					:ls_nulo,					:ls_nulo,					:ls_nulo,					:ls_nulo,				:ls_nulo,					:ls_nulo,					:ls_nulo,			:ll_cod_parque,	:ll_nulo,			:ll_nulo,		:ls_nombre_tit,	:ls_a_paterno_tit,	:ls_a_materno_tit,	:ll_rut_tit,	:ls_dv_tit,		:ls_direcc_tit,		:ls_direcc_num_tit,				:ls_direcc_block_tit,		:ls_direcc_depto_tit,		:ls_nombre_fall,		:ls_a_paterno_fall,		:ls_a_materno_fall,		:ll_rut_fall,		:ls_dv_fall,		:ls_comuna_tit,	:ls_ciudad_tit,	:ll_cod_estado,	:ls_sector,			:ls_sepult,				:ll_nulo,		:ll_nulo,		:ll_nulo,		:ll_nulo,			:ls_fono_tit,		:ls_nulo,			:gdt_fec_sistema,	:ls_nulo,			:ll_capac,		:ls_uso,	:ls_tipo_const,	:ls_tipo_sepult,	:ldb_valor_sepul,	:ll_nulo,			:ll_cod_estado) ;
//			if Trans_1.sqlcode = 0 then
//				commit using Trans_1;
//				messagebox("Grabar","Grabación Exitosa")
//			else
//				rollback using Trans_1;
//				messagebox("Error Grabar","Error Grabar Funeraria Detalle SQL: "+Trans_1.sqlerrtext)
//			end if
//		end if
//	else
//		messagebox("Advertencia","Solicitud Pago Comisión Funeraria Ya Fue Creada")
//	end if
//	SELECT	COUNT("FUNERARIA_FOLIO_DETALLE"."NUMERO")
//	INTO		:ll_consul_det					
//	FROM		"FUNERARIA_FOLIO_DETALLE"  
//	WHERE		( "FUNERARIA_FOLIO_DETALLE"."BASE" = :ls_base ) AND  
//				( "FUNERARIA_FOLIO_DETALLE"."SERIE" = :ls_serie ) AND  
//				( "FUNERARIA_FOLIO_DETALLE"."NUMERO" = :ll_contrato ) AND
//				( "FUNERARIA_FOLIO_DETALLE"."ESTADO" = 1 )
//	USING sqlca;
//	if isnull(ll_consul_det) or ll_consul_det=0 then
//		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ll_contrato>0 then
//			INSERT INTO	"FUNERARIA_FOLIO_DETALLE"  
//							( "BASE",	"SERIE",		"NUMERO",		"FECHA_CREA",			"USUARIO_CREA",	"ESTADO",			"FECHA_ESTADO",	"GLOSA",					"COD_AGENTE",		"COD_SUPERVISOR",	"COD_PARQUE",		"ESTADO_MODIFICACION",	"MES_CIERRE",	"ANO_CIERRE",	"USUARIO_GESTOR" )  
//			VALUES 		( :ls_base,	:ls_serie,	:ll_contrato,	:gdt_fec_sistema,		:gs_user,			:ll_cod_estado,	:gdt_fec_sistema,	:ls_glosa_detalle,	:ls_nulo,			:ls_nulo,			:ll_cod_parque,	:ls_estado_modif,			:ll_nulo,		:ll_nulo,		:gs_user    ) ;
//			if Trans_1.sqlcode = 0 then
//				commit using Trans_1;
//			else
//				rollback using Trans_1;
//				messagebox("Error Grabar","Error Grabar Funeraria Detalle SQL: "+Trans_1.sqlerrtext)
//			end if
//		end if
//	end if
	
	
	
	
	if isvalid(w_solicitud_pago_funeraria) then close(w_solicitud_pago_funeraria)
	if isvalid(w_solicitud_gestion_funeraria) then
		w_solicitud_gestion_funeraria.dw_lista_solicitud.retrieve()
	end if
	dw_lista.accepttext()
	SetPointer(HourGlass!)
	ls_base				= dw_lista.getitemstring(il_row,'base')
	ls_serie				= dw_lista.getitemstring(il_row,'serie')
	ll_numero			= dw_lista.getitemnumber(il_row,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ll_numero>0 and dw_lista.dataobject='dw_lista_ficha_funeraria' then
		ls_string		= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
		OpenWithParm (w_solicitud_pago_funeraria,ls_string)
		w_solicitud_pago_funeraria.pb_aceptar.triggerevent(clicked!)
	end if
	SetPointer(Arrow!)
	close(w_listado_ficha_sepultacion)
end if
end event

type cb_imprimir from commandbutton within w_listado_ficha_sepultacion
event ue_mousemove pbm_mousemove
integer x = 1234
integer y = 2156
integer width = 256
integer height = 84
integer taborder = 100
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

type cb_ordenar from commandbutton within w_listado_ficha_sepultacion
integer x = 654
integer y = 2156
integer width = 256
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_listado_ficha_sepultacion
integer x = 910
integer y = 2156
integer width = 256
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type pb_aceptar from picturebutton within w_listado_ficha_sepultacion
integer x = 1358
integer y = 100
integer width = 142
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long		ll_tot_reg
datetime	ldt_fecha_inicio,ldt_fecha_termino

em_ctto.text		= ''
ldt_fecha_inicio	= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_termino	= datetime(date(em_termino.text),time('00:00:00'))
SetPointer(HourGlass!)
dw_lista.dataobject	= 'dw_lista_ficha_funeraria'
dw_lista.settransobject(sqlca)
ll_tot_reg				= dw_lista.retrieve(ldt_fecha_inicio,ldt_fecha_termino)
SetPointer(Arrow!)
end event

type p_termino from picture within w_listado_ficha_sepultacion
integer x = 1211
integer y = 112
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

type p_inicio from picture within w_listado_ficha_sepultacion
integer x = 608
integer y = 112
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

type st_desde from statictext within w_listado_ficha_sepultacion
integer x = 82
integer y = 124
integer width = 174
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type em_termino from editmask within w_listado_ficha_sepultacion
integer x = 859
integer y = 116
integer width = 347
integer height = 80
integer taborder = 20
integer textsize = -9
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

type em_inicio from editmask within w_listado_ficha_sepultacion
integer x = 256
integer y = 116
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -9
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

type st_hasta from statictext within w_listado_ficha_sepultacion
integer x = 709
integer y = 124
integer width = 155
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_listado_ficha_sepultacion
integer x = 37
integer y = 252
integer width = 3479
integer height = 1860
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_ficha_funeraria"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

end event

event doubleclicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	cb_aceptar.triggerevent(clicked!)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()
end event

type cb_cerrar from commandbutton within w_listado_ficha_sepultacion
integer x = 3209
integer y = 2156
integer width = 306
integer height = 84
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listado_ficha_sepultacion)
end event

type gb_periodo from groupbox within w_listado_ficha_sepultacion
integer x = 37
integer y = 24
integer width = 1298
integer height = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Período"
end type

type gb_1 from groupbox within w_listado_ficha_sepultacion
integer x = 626
integer y = 2104
integer width = 891
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

