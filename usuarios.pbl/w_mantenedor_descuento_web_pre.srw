forward
global type w_mantenedor_descuento_web_pre from window
end type
type cb_carga_masiva from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_2 from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_1 from commandbutton within w_mantenedor_descuento_web_pre
end type
type st_1 from statictext within w_mantenedor_descuento_web_pre
end type
type cb_eliminar_det from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_exportar_existe from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_filtrar_existe from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_sort_existe from commandbutton within w_mantenedor_descuento_web_pre
end type
type st_11 from statictext within w_mantenedor_descuento_web_pre
end type
type em_buscar_ctto from editmask within w_mantenedor_descuento_web_pre
end type
type pb_buscar from picturebutton within w_mantenedor_descuento_web_pre
end type
type cb_limpiar_cab from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_importar from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_eliminar from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_limpiar from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_cerrar from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_grabar from commandbutton within w_mantenedor_descuento_web_pre
end type
type cb_nuevo from commandbutton within w_mantenedor_descuento_web_pre
end type
type dw_lista from datawindow within w_mantenedor_descuento_web_pre
end type
type gb_1 from groupbox within w_mantenedor_descuento_web_pre
end type
type gb_2 from groupbox within w_mantenedor_descuento_web_pre
end type
type gb_3 from groupbox within w_mantenedor_descuento_web_pre
end type
type dw_detalle from datawindow within w_mantenedor_descuento_web_pre
end type
end forward

global type w_mantenedor_descuento_web_pre from window
integer width = 3858
integer height = 2052
boolean titlebar = true
string title = "Mantenedor Tramo Descuentos Web"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_carga_masiva cb_carga_masiva
cb_2 cb_2
cb_1 cb_1
st_1 st_1
cb_eliminar_det cb_eliminar_det
cb_exportar_existe cb_exportar_existe
cb_filtrar_existe cb_filtrar_existe
cb_sort_existe cb_sort_existe
st_11 st_11
em_buscar_ctto em_buscar_ctto
pb_buscar pb_buscar
cb_limpiar_cab cb_limpiar_cab
cb_importar cb_importar
cb_eliminar cb_eliminar
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
cb_grabar cb_grabar
cb_nuevo cb_nuevo
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
dw_detalle dw_detalle
end type
global w_mantenedor_descuento_web_pre w_mantenedor_descuento_web_pre

type variables
Date		id_fecha_dia
String		is_error_det
Long		il_row
end variables

on w_mantenedor_descuento_web_pre.create
this.cb_carga_masiva=create cb_carga_masiva
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_eliminar_det=create cb_eliminar_det
this.cb_exportar_existe=create cb_exportar_existe
this.cb_filtrar_existe=create cb_filtrar_existe
this.cb_sort_existe=create cb_sort_existe
this.st_11=create st_11
this.em_buscar_ctto=create em_buscar_ctto
this.pb_buscar=create pb_buscar
this.cb_limpiar_cab=create cb_limpiar_cab
this.cb_importar=create cb_importar
this.cb_eliminar=create cb_eliminar
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.cb_nuevo=create cb_nuevo
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_carga_masiva,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.cb_eliminar_det,&
this.cb_exportar_existe,&
this.cb_filtrar_existe,&
this.cb_sort_existe,&
this.st_11,&
this.em_buscar_ctto,&
this.pb_buscar,&
this.cb_limpiar_cab,&
this.cb_importar,&
this.cb_eliminar,&
this.cb_limpiar,&
this.cb_cerrar,&
this.cb_grabar,&
this.cb_nuevo,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.dw_detalle}
end on

on w_mantenedor_descuento_web_pre.destroy
destroy(this.cb_carga_masiva)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_eliminar_det)
destroy(this.cb_exportar_existe)
destroy(this.cb_filtrar_existe)
destroy(this.cb_sort_existe)
destroy(this.st_11)
destroy(this.em_buscar_ctto)
destroy(this.pb_buscar)
destroy(this.cb_limpiar_cab)
destroy(this.cb_importar)
destroy(this.cb_eliminar)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.cb_nuevo)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.dw_detalle)
end on

event open;Date		ldt_fecha_max
gf_centrar(w_mantenedor_descuento_web_pre)
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
id_fecha_dia		= date(gdt_fec_sistema) 
//cb_grabar_det.enabled	= false
dw_lista.insertrow(0) 
if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No registra Tramos Descuentos WEB")
	dw_lista.reset()
	dw_lista.insertrow(0)
end if
end event

type cb_carga_masiva from commandbutton within w_mantenedor_descuento_web_pre
boolean visible = false
integer x = 3387
integer y = 1592
integer width = 434
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "CARGA_MASIVA"
end type

event clicked;String			ls_archivo,ls_base,ls_serie,ls_codigo_tramos,ls_estado_tramo
Long			ll_fila,ll_tramo_ori,ll_fila_dw_ori,ll_tramo_det,ll_tot_reg,ll_count_ctto,ll_count_vig,ll_row
Double		l_numero,ll_codigo_tramos
String			ls_estado_ori
Datetime		ldt_fec_ini_ori,ldt_fec_fin_ori

ll_fila_dw_ori			= dw_lista.getrow()
if ll_fila_dw_ori > 0 then
//	cb_grabar_det.enabled	= true
	ll_codigo_tramos			= dw_lista.GetItemNumber(ll_fila_dw_ori,'codigo_tramo')
	ldt_fec_ini_ori				= dw_lista.GetItemDatetime(ll_fila_dw_ori,'fecha_vigencia_ini')
	ldt_fec_fin_ori				= dw_lista.GetItemDatetime(ll_fila_dw_ori,'fecha_vigencia_fin')
	ls_estado_tramo			= dw_lista.GetItemString(ll_fila_dw_ori,'estado')
	
	OpenWithParm(w_ingreso_tramo_masiva, ll_codigo_tramos)
	close(w_mantenedor_descuento_web_pre)
	/*if date(ldt_fec_fin_ori) < today() then
		messagebox('ADVERTENCIA','La fecha del tramo ya expiro')
	elseif ls_estado_tramo <> 'A' then
		messagebox('ADVERTENCIA','El tramo se encuentra inactivo')
	else
		OpenWithParm(w_ingreso_tramo_masiva, ll_codigo_tramos)
		close(w_mantenedor_descuento_web_pre)
	end if*/
end if

end event

type cb_2 from commandbutton within w_mantenedor_descuento_web_pre
integer x = 3387
integer y = 1348
integer width = 421
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Autorizar Todo"
end type

event clicked;String		ls_archivo,ls_base,ls_serie,ls_codigo_tramos,ls_empresa,ls_tipo_moneda,ls_cod_mov,ls_registro,ls_usuario,&
			ls_commit,ls_contrato,ls_mensaje,ls_tramo,ls_cod,ls_estado,ls_msg
Long		ll_fila,ll_fila_dw_ori,ll_cantidad,ll_promo,ll_numero,ll_codigo_tramos,ll_tot_reg
Date		ldt_fec_ini_ori,ldt_fec_fin_ori,ld_fecha_actual

ll_tot_reg				= dw_detalle.rowcount( )
ls_empresa 				= '01'
ls_commit 				= '1'
ld_fecha_actual 		= Today()

if ls_tipo_moneda = 'UF' then
	ls_tipo_moneda = '2'
else
	ls_tipo_moneda = '1'
end if

//if ll_tot_reg > 0 then
FOR ll_fila = 1 TO ll_tot_reg
	SetPointer(HourGlass!)
	ls_tramo				= dw_detalle.GetItemString(ll_fila,'C_CODIGO_TRM')
	ls_base				= dw_detalle.GetItemString(ll_fila,'base')
	ls_serie				= dw_detalle.GetItemString(ll_fila,'serie')
	ll_numero			= dw_detalle.GetItemNumber(ll_fila,'numero')
	ls_contrato 			= trim(ls_base+ls_serie+string(ll_numero))
	ll_promo				= dw_detalle.GetItemNumber(ll_fila,'n_promocion_det')
	ls_cod_mov			= dw_detalle.GetItemString(ll_fila,'c_codigo_mov')
	ll_cantidad			= dw_detalle.GetItemNumber(ll_fila,'n_cantidad_det')
	ls_registro			= dw_detalle.GetItemString(ll_fila,'c_codigo_reg')
	ls_usuario			= dw_detalle.GetItemString(ll_fila,'c_codigo_usu')
	
	//messagebox('MENSAJE',ls_empresa+'-'+ls_tramo+'-'+ls_contrato+'-'+string(ll_promo)+'-'+ls_cod_mov+'-'+ls_tipo_moneda+'-'+string(ll_cantidad)+'-'+ls_registro+'-'+ls_usuario)

	/*DECLARE usp_mantencion PROCEDURE FOR USP_CTO_TRAMO_AUTORIZA_MANT_2 
	( :ls_empresa,:ls_tramo,:ls_contrato, :ll_promo,:ls_cod_mov,:ls_tipo_moneda,:ll_cantidad, :ls_registro,:ls_usuario,:ls_commit )  
	Using sqlca;*/
	
	DECLARE usp_mantencion PROCEDURE FOR SP_MASIVA_DESCUENTOS 
	( :ls_base,:ls_serie,:ll_numero, :ls_tramo )  
	Using sqlca;
	
	EXECUTE usp_mantencion;
	/*if sqlca.sqlcode = 0 then
		UPDATE 	"LOG_DESCUENTOS"  
		SET 		"USUARIO_AUTORIZA" = :ls_usuario,   
					"FECHA_AUTORIZA" = :ld_fecha_actual  
		WHERE 	( "LOG_DESCUENTOS"."BASE" = :ls_base ) AND  
					( "LOG_DESCUENTOS"."SERIE" = :ls_serie ) AND  
					( "LOG_DESCUENTOS"."NUMERO" = :ll_numero );*/
	//FETCH usp_mantencion INTO :ls_cod, :ls_estado, :ls_msg;
		//messagebox('ERROR',ls_estado)
		//messagebox('ERROR',ls_msg)
	CLOSE usp_mantencion;
	//end if*/
	//sleep(1.5)
NEXT
SetPointer(Arrow!)
//end if
if isvalid(w_mantenedor_descuento_web_pre) then close(w_mantenedor_descuento_web_pre)
open(w_mantenedor_descuento_web_pre)
	
end event

type cb_1 from commandbutton within w_mantenedor_descuento_web_pre
integer x = 3387
integer y = 916
integer width = 421
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Autorizar"
boolean cancel = true
end type

event clicked;String		ls_archivo,ls_base,ls_serie,ls_codigo_tramos,ls_empresa,ls_tipo_moneda,ls_cod_mov,ls_registro,ls_usuario,&
			ls_commit,ls_contrato,ls_mensaje,ls_tramo,ls_cod,ls_estado,ls_msg
Long		ll_fila,ll_fila_dw_ori,ll_cantidad,ll_promo,ll_numero,ll_codigo_tramos
Date		ldt_fec_ini_ori,ldt_fec_fin_ori,ld_fecha_actual

ll_fila_dw_ori			= dw_detalle.getrow()
ls_empresa 				= '01'
ls_commit 				= '1'
ld_fecha_actual			= Today()
if ls_tipo_moneda = 'UF' then
	ls_tipo_moneda = '2'
else
	ls_tipo_moneda = '1'
end if

if ll_fila_dw_ori > 0 then
	SetPointer(HourGlass!)
	//messagebox('estado',ll_fila_dw_ori)
	ls_tramo				= dw_detalle.GetItemString(ll_fila_dw_ori,'C_CODIGO_TRM')
	ls_base				= dw_detalle.GetItemString(ll_fila_dw_ori,'base')
	ls_serie				= dw_detalle.GetItemString(ll_fila_dw_ori,'serie')
	ll_numero			= dw_detalle.GetItemNumber(ll_fila_dw_ori,'numero')
	ls_contrato 			= trim(ls_base+ls_serie+string(ll_numero))
	ll_promo				= dw_detalle.GetItemNumber(ll_fila_dw_ori,'n_promocion_det')
	ls_cod_mov			= dw_detalle.GetItemString(ll_fila_dw_ori,'c_codigo_mov')
	ll_cantidad			= dw_detalle.GetItemNumber(ll_fila_dw_ori,'n_cantidad_det')
	ls_registro			= dw_detalle.GetItemString(ll_fila_dw_ori,'c_codigo_reg')
	ls_usuario			= dw_detalle.GetItemString(ll_fila_dw_ori,'c_codigo_usu')
end if

//DECLARE usp_mantencion PROCEDURE FOR USP_CTO_TRAMO_AUTORIZA_MANT_2
DECLARE usp_mantencion PROCEDURE FOR USP_CTO_TRAMO_AUTORIZA_MANT
( :ls_empresa,:ls_tramo,:ls_contrato, :ll_promo,:ls_cod_mov,:ls_tipo_moneda,:ll_cantidad, :ls_registro,:ls_usuario,:ls_commit )  
Using sqlca;

EXECUTE usp_mantencion;
if sqlca.sqlcode = 0 then
	UPDATE 	"LOG_DESCUENTOS"  
	SET 		"USUARIO_AUTORIZA" 	= :ls_usuario,   
				"FECHA_AUTORIZA" 		= :ld_fecha_actual  
	WHERE 	( "LOG_DESCUENTOS"."BASE" 		= :ls_base ) AND  
				( "LOG_DESCUENTOS"."SERIE" 	= :ls_serie ) AND  
				( "LOG_DESCUENTOS"."NUMERO" = :ll_numero )    ;
	
	FETCH usp_mantencion INTO :ls_cod, :ls_estado, :ls_msg;
		messagebox('ERROR',ls_msg)
	CLOSE usp_mantencion;
end if
SetPointer(Arrow!)
if isvalid(w_mantenedor_descuento_web_pre) then close(w_mantenedor_descuento_web_pre)
open(w_mantenedor_descuento_web_pre)	
	
end event

type st_1 from statictext within w_mantenedor_descuento_web_pre
integer x = 1285
integer y = 32
integer width = 997
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pre Autorizados"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_eliminar_det from commandbutton within w_mantenedor_descuento_web_pre
integer x = 3387
integer y = 1240
integer width = 421
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Anular"
end type

event clicked;String ls_empresa,ls_contrato,ls_movimiento,ls_e_reg,ls_usuario,ls_base,ls_serie,ls_opcion,ls_commit,ls_mensaje,ls_cod,ls_estado,ls_msg
Long ll_tramo,ll_cantidad,ll_fila_dw_ori,ll_tot_reg,ll_numero,ll_fila
Date ld_inicio,ld_fin,ld_fecha_actual

ll_tot_reg				= dw_detalle.rowcount()
ll_fila_dw_ori			= dw_detalle.getrow()
ls_empresa				= '01'
ls_opcion					= 'DEL'
ls_commit				= '0'
ld_fecha_actual			= Today()

if ll_fila_dw_ori > 0 then
	SetPointer(HourGlass!)
	ls_base			= dw_detalle.GetItemString(ll_fila_dw_ori,'base')
	ls_serie			= dw_detalle.GetItemString(ll_fila_dw_ori,'serie')
	ll_numero		= dw_detalle.GetItemNumber(ll_fila_dw_ori,'numero')
	ls_contrato 		= ls_base+ls_serie+string(ll_numero)
	ls_movimiento	= dw_detalle.GetItemString(ll_fila_dw_ori,'c_codigo_mov')
	ll_cantidad		= dw_detalle.GetItemNumber(ll_fila_dw_ori,'n_cantidad_det')
		SELECT 	"WEBPREAUTORIZADO"."C_CODIGO_TRM"  
     	INTO 		:ll_tramo  
    		FROM 	"WEBPREAUTORIZADO"  
   		WHERE 	"WEBPREAUTORIZADO"."C_CODIGO_CTO" =   :ls_contrato
		USING sqlca;
	if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if
	//ll_tramo			= Long(dw_lista.GetItemString(ll_fila_dw_ori,'codigo_tramo'))
	//messagebox('MSJ',ll_tramo)
	ld_inicio			= Date(dw_detalle.getitemdatetime(ll_fila_dw_ori,'d_ini_det'))
	ld_fin				= Date(dw_detalle.getitemdatetime(ll_fila_dw_ori,'d_fin_det'))
	ls_e_reg			= dw_detalle.GetItemString(ll_fila_dw_ori,'c_codigo_reg')
end if

//DECLARE usp_mantencion PROCEDURE FOR usp_tramo_preautoriza_mant_2  
DECLARE usp_mantencion PROCEDURE FOR usp_tramo_preautoriza_mant
(  
		asEmp		=> :ls_empresa,
		anTrm 		=> :ll_tramo,
		asCto			=> :ls_contrato,
		anCan		=> :ll_cantidad,
		asMov		=> :ls_movimiento,
		adIni			=> :ld_inicio,
		adFin			=> :ld_fin,
		asReg			=> :ls_e_reg,
		asUsu			=> :gs_user,
		asOpc			=> :ls_opcion,
		asCommit	=> :ls_commit
)  
Using sqlca;

EXECUTE usp_mantencion;

if sqlca.sqlcode = 0 then
	FETCH usp_mantencion INTO :ls_cod, :ls_estado, :ls_msg ;
	messagebox('ERROR',ls_msg)
	CLOSE usp_mantencion;
end if
SetPointer(Arrow!)
if isvalid(w_mantenedor_descuento_web_pre) then close(w_mantenedor_descuento_web_pre)
open(w_mantenedor_descuento_web_pre)




end event

type cb_exportar_existe from commandbutton within w_mantenedor_descuento_web_pre
integer x = 553
integer y = 1848
integer width = 251
integer height = 84
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	f_DWToExcel( dw_detalle)
end if
end event

type cb_filtrar_existe from commandbutton within w_mantenedor_descuento_web_pre
integer x = 302
integer y = 1848
integer width = 251
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type cb_sort_existe from commandbutton within w_mantenedor_descuento_web_pre
integer x = 50
integer y = 1848
integer width = 251
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETSORT(NULO)
dw_detalle.SORT()

end event

type st_11 from statictext within w_mantenedor_descuento_web_pre
integer x = 2194
integer y = 1852
integer width = 389
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Contrato"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_buscar_ctto from editmask within w_mantenedor_descuento_web_pre
integer x = 2610
integer y = 1832
integer width = 421
integer height = 100
integer taborder = 140
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

event modified;if long(this.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_mantenedor_descuento_web_pre
integer x = 3045
integer y = 1824
integer width = 128
integer height = 112
integer taborder = 160
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;Long		ll_fila,ll_tot_reg
Double	ll_numero
ll_numero	= Double(em_buscar_ctto.text)
ll_tot_reg	= dw_detalle.rowcount()
ll_fila			= dw_detalle.Find("numero = "+string(ll_numero), 1, ll_tot_reg)
if ll_fila>0 then
	dw_detalle.scrolltorow(ll_fila)
end if
if ll_fila=0 then
	messagebox("Advertencia","No Existe Nº Contrato "+string(ll_numero,"###,###,###,###"))
end if
end event

type cb_limpiar_cab from commandbutton within w_mantenedor_descuento_web_pre
integer x = 3392
integer y = 564
integer width = 421
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long	ll_tramo_ori,ll_row
Date	ldt_fec_ini_ori,ldt_fec_fin_ori

dw_lista.reset()
dw_detalle.reset()
if dw_lista.retrieve() > 0 then
	dw_lista.scrolltorow(1)
	ll_row					= 1
	IF ll_row > 0 THEN
		ll_tramo_ori			= dw_lista.getitemnumber(ll_row,'codigo_tramo')
		ldt_fec_ini_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_ini'))
		ldt_fec_fin_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_fin'))
		//if dw_detalle.retrieve(ll_tramo_ori,ldt_fec_ini_ori,ldt_fec_fin_ori) =0 then
			//messagebox("Advertencia","No Registar Dato")
		//end if
	end if
end if
end event

type cb_importar from commandbutton within w_mantenedor_descuento_web_pre
integer x = 3387
integer y = 1024
integer width = 421
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Importar"
boolean cancel = true
end type

event clicked;String		ls_archivo,ls_base,ls_serie,ls_codigo_tramos,ls_estado_tramo
Long		ll_fila,ll_tramo_ori,ll_fila_dw_ori,ll_tramo_det,ll_tot_reg,ll_count_ctto,ll_count_vig,ll_row
Double	ll_numero,ll_codigo_tramos
String		ls_estado_ori
Datetime		ldt_fec_ini_ori,ldt_fec_fin_ori

ll_fila_dw_ori			= dw_lista.getrow()
if ll_fila_dw_ori > 0 then
//	cb_grabar_det.enabled	= true
	ll_codigo_tramos			= dw_lista.GetItemNumber(ll_fila_dw_ori,'codigo_tramo')
	ldt_fec_ini_ori				= dw_lista.GetItemDatetime(ll_fila_dw_ori,'fecha_vigencia_ini')
	ldt_fec_fin_ori				= dw_lista.GetItemDatetime(ll_fila_dw_ori,'fecha_vigencia_fin')
	ls_estado_tramo			= dw_lista.GetItemString(ll_fila_dw_ori,'estado')
	
	if date(ldt_fec_fin_ori) < today() then
		messagebox('ADVERTENCIA','La fecha del tramo ya expiro')
	elseif ls_estado_tramo <> 'A' then
		messagebox('ADVERTENCIA','El tramo se encuentra inactivo')
	else
		OpenWithParm(w_ingreso_tramo, ll_codigo_tramos)
		close(w_mantenedor_descuento_web_pre)
	end if
end if

end event

type cb_eliminar from commandbutton within w_mantenedor_descuento_web_pre
integer x = 3392
integer y = 456
integer width = 421
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Inactivar"
end type

event clicked;Long	ll_res,ll_fila,ll_tot_reg,ll_indi,ll_cod_tramo

ll_fila						= dw_lista.getrow()
if ll_fila > 0 then
	ll_res					= messagebox("Eliminar","Está seguro de Inactivar Registro N° "+string(ll_fila),Exclamation!,YesNo!,2)
	if ll_res=1 then
		dw_lista.setitem(ll_fila,'estado','I')
		ll_cod_tramo	= dw_lista.getitemnumber(dw_lista.getrow(),'codigo_tramo')
		ll_tot_reg		= dw_detalle.rowcount()
		for ll_indi=1 to ll_tot_reg
			dw_detalle.setitem(ll_indi,'estado_reg','A')
		next
		dw_lista.accepttext()
		dw_detalle.accepttext()
		if dw_lista.update()=1 then
			commit;
		else
			rollback;
		end if
		if dw_detalle.update()=1 then
			commit;
		else
			rollback;
		end if
		UPDATE 	"CADENA"  
		SET 		"CODIGO_TRAMO" = 0  
		WHERE 	"CADENA"."CODIGO_TRAMO" = :ll_cod_tramo 
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		messagebox("Inactivar","Inactivación Exitosa")
	end if
end if
end event

type cb_limpiar from commandbutton within w_mantenedor_descuento_web_pre
integer x = 3387
integer y = 1132
integer width = 421
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long	ll_tramo_ori,ll_row
Date	ldt_fec_ini_ori,ldt_fec_fin_ori

dw_detalle.reset()
ll_row					= dw_lista.getrow()
IF ll_row > 0 THEN
	ll_tramo_ori			= dw_lista.getitemnumber(ll_row,'codigo_tramo')
	ldt_fec_ini_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_ini'))
	ldt_fec_fin_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_fin'))
	if dw_detalle.retrieve(ll_tramo_ori,ldt_fec_ini_ori,ldt_fec_fin_ori) =0 then
		messagebox("Advertencia","No Registar Dato")
	end if
end if
//cb_marcar_todo.text 	= 'Marcar Todo'
end event

type cb_cerrar from commandbutton within w_mantenedor_descuento_web_pre
integer x = 3392
integer y = 1832
integer width = 421
integer height = 100
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_mantenedor_descuento_web_pre)
end event

type cb_grabar from commandbutton within w_mantenedor_descuento_web_pre
integer x = 3392
integer y = 348
integer width = 421
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;datetime		ldt_fecha_ini, ldt_fecha_fin
Double		ldb_valor,ll_
Long			ll_tot_reg,ll_indi,ll_cod_tramo,ll_count_error=0
String			ls_tipo_desc,ls_estado

ll_tot_reg			= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_cod_tramo	= dw_lista.getitemnumber(ll_indi,'codigo_tramo')
	ldb_valor			= Double(dw_lista.getitemnumber(ll_indi,'valor_descuento'))
	ls_tipo_desc		= dw_lista.getitemstring(ll_indi,'tipo_descuento')
	ls_estado		= dw_lista.getitemstring(ll_indi,'estado')
	ldt_fecha_ini	= dw_lista.getitemdatetime(ll_indi,'fecha_vigencia_ini')
	ldt_fecha_fin	= dw_lista.getitemdatetime(ll_indi,'fecha_vigencia_fin')
	if isnull( ll_cod_tramo ) then
		messagebox("Advertencia","Debe Ingresar Codigo Tramo")
		dw_lista.setfocus()
		dw_lista.setcolumn('valor_descuento')
		ll_count_error ++
		exit
	elseif isnull( ldb_valor ) or ldb_valor < 0 then
		messagebox("Advertencia","Debe Ingresar Valor Descuento")
		dw_lista.setfocus()
		dw_lista.setcolumn('valor_descuento')
		ll_count_error ++
		exit
	elseif isnull( ldt_fecha_ini ) then
		messagebox("Advertencia","Debe Ingresar Fecha Vigencia Inicial")
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_vigencia_ini')
		ll_count_error ++
		exit
	elseif isnull( ldt_fecha_fin ) then
		messagebox("Advertencia","Debe Ingresar Fecha Vigencia Final")
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_vigencia_fin')
		ll_count_error ++
		exit
	elseif ldt_fecha_ini > ldt_fecha_fin then
		messagebox("Advertencia","Rango Fecha Incorrecta, Fecha Inicial NO debe ser Mayor a Fecha Vigencia Final")
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_vigencia_fin')
		ll_count_error ++
		exit
//	else
//		dw_lista.setitem(ll_indi,'usuario',gs_user)
	end if
next
if ll_count_error=0 then
	if dw_lista.update() = 1 then
		commit;
		if ls_estado='I' then
			String		ls_base,ls_serie
			Double	ll_numero
			Long		ll_tramo_dscto,ll_error
			
			dw_detalle.accepttext()
			ll_error					= 0
			if dw_detalle.update()=1 then
				commit;
				ll_tot_reg			= dw_detalle.rowcount()
				for ll_indi=1 to ll_tot_reg
					ls_base			= dw_detalle.getitemstring(ll_indi,'base')
					ls_serie			= dw_detalle.getitemstring(ll_indi,'serie')
					ll_numero		= dw_detalle.getitemnumber(ll_indi,'numero')
					ll_tramo_dscto	= dw_detalle.getitemnumber(ll_indi,'codigo_tramo')
					UPDATE 	"CADENA"  
					SET 		"CODIGO_TRAMO" = 0  
					WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						messagebox("Error Grabar","Error Actualizar CADENA Codigo Descuento Contrato "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,##0'))
						ll_error ++
					end if
				next
				if ll_error > 0 then
					messagebox("Grabar","Se realiza Actualización de Anulación Descuento con "+string(ll_error,'###,###,###,##0')+" Errores ")
				else
					messagebox("Grabar","Grabación Exitosa")
				end if
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar SQL "+sqlca.sqlerrtext)
			end if
		end if
		
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Tramo Descuento Web SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_nuevo from commandbutton within w_mantenedor_descuento_web_pre
integer x = 3392
integer y = 240
integer width = 421
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;Long		ll_new,ll_codigo_tramo
String		ls_fecha
Date		ldt_fecha

ll_new				= dw_lista.insertrow(0)
dw_lista.setitem(ll_new,'usuario',gs_user)
dw_lista.setitem(ll_new,'estado','A')
dw_lista.setitem(ll_new,'tipo_descuento','%')
dw_lista.ScrollToRow (ll_new)
dw_lista.setcolumn ('codigo_tramo')
dw_lista.accepttext()
end event

type dw_lista from datawindow within w_mantenedor_descuento_web_pre
integer x = 27
integer y = 156
integer width = 3296
integer height = 672
integer taborder = 10
string title = "none"
string dataobject = "dw_mantenedor_web_tramo"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long	ll_tramo_ori,ll_row
Date	ldt_fec_ini_ori,ldt_fec_fin_ori
String ls_tramo_ori
IF row > 0 THEN
//	cb_grabar_det.enabled	= false
	ll_row							= dw_lista.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
	ll_tramo_ori					= dw_lista.getitemnumber(ll_row,'codigo_tramo')
	ls_tramo_ori				= string(ll_tramo_ori)
	ldt_fec_ini_ori				= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_ini'))
	ldt_fec_fin_ori				= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_fin'))
	if dw_detalle.retrieve(ls_tramo_ori,ldt_fec_ini_ori,ldt_fec_fin_ori) =0 then
//		messagebox("Advertencia","No Registar Dato")
	end if
end if
end event

event rowfocuschanged;Long	ll_tramo_ori,ll_row
Date	ldt_fec_ini_ori,ldt_fec_fin_ori
String ls_tramo_ori
ll_row						= dw_lista.getrow()
IF ll_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
	ll_tramo_ori			= dw_lista.getitemnumber(ll_row,'codigo_tramo')
	ls_tramo_ori		= string(ll_tramo_ori)
	ldt_fec_ini_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_ini'))
	ldt_fec_fin_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_fin'))
	if dw_detalle.retrieve(ls_tramo_ori,ldt_fec_ini_ori,ldt_fec_fin_ori) =0 then
//		messagebox("Advertencia","No Registar Dato")
	end if
end if
end event

event itemchanged;String		ls_columna
Long		ll_codigo,ll_indi,ll_tot_reg,ll_suma_dupli,ll_codigo_fila,ll_nulo

Setnull(ll_nulo)
dw_lista.accepttext()
ll_tot_reg					= dw_lista.rowcount()
ls_columna					= dwo.name
if ls_columna='codigo_tramo' then
	ll_codigo					= dw_lista.getitemnumber(dw_lista.getrow(),'codigo_tramo')
	dw_lista.setitem(dw_lista.getrow(),'fecha_modificacion',gdt_fec_sistema)
	dw_lista.setitem(dw_lista.getrow(),'usuario',gs_user)
	if not isnull(ll_codigo) then
		for ll_indi=1 to ll_tot_reg
			ll_codigo_fila	= dw_lista.getitemnumber(ll_indi,'codigo_tramo')
			if ll_codigo = ll_codigo_fila then ll_suma_dupli ++
		next
		if ll_suma_dupli > 1 then
			messagebox("Advertencia","Codigo Duplicado")
			dw_lista.setitem(dw_lista.getrow(),'codigo_tramo',ll_nulo)
			dw_lista.accepttext()
		end if
	end if
end if
dw_lista.accepttext()
end event

event itemfocuschanged;long		ll_codigo,ll_indi,ll_tot_reg,ll_codigo_fila,ll_nulo,ll_suma_dupli=0

Setnull(ll_nulo)
ll_tot_reg				= dw_lista.rowcount()
ll_codigo					= dw_lista.getitemnumber(dw_lista.getrow(),'codigo_tramo')
if not isnull(ll_codigo) then
	for ll_indi=1 to ll_tot_reg
		ll_codigo_fila	= dw_lista.getitemnumber(ll_indi,'codigo_tramo')
		if ll_codigo = ll_codigo_fila then ll_suma_dupli ++
	next
	if ll_suma_dupli > 1 then
		dw_lista.setitem(dw_lista.getrow(),'codigo_tramo',ll_nulo)
		dw_lista.accepttext()
	end if
end if
end event

type gb_1 from groupbox within w_mantenedor_descuento_web_pre
integer x = 3360
integer y = 152
integer width = 462
integer height = 536
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Opciones"
end type

type gb_2 from groupbox within w_mantenedor_descuento_web_pre
integer x = 3360
integer y = 852
integer width = 475
integer height = 612
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Opciones"
end type

type gb_3 from groupbox within w_mantenedor_descuento_web_pre
integer x = 27
integer y = 1800
integer width = 809
integer height = 160
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_detalle from datawindow within w_mantenedor_descuento_web_pre
integer x = 27
integer y = 876
integer width = 3296
integer height = 920
integer taborder = 60
string title = "none"
string dataobject = "dw_contrato_preautorizados_pre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;il_row						= row
IF il_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;il_row						= this.getrow()
IF il_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if

end event

event rowfocuschanging;il_row						= this.getrow()
IF il_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if

end event

