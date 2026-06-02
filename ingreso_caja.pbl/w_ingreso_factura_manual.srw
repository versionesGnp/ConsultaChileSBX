forward
global type w_ingreso_factura_manual from window
end type
type cb_buscar from commandbutton within w_ingreso_factura_manual
end type
type cb_limpiar from commandbutton within w_ingreso_factura_manual
end type
type cb_eliminar from commandbutton within w_ingreso_factura_manual
end type
type cb_grabar from commandbutton within w_ingreso_factura_manual
end type
type cb_nuevo from commandbutton within w_ingreso_factura_manual
end type
type cb_cerrar from commandbutton within w_ingreso_factura_manual
end type
type dw_ingreso from datawindow within w_ingreso_factura_manual
end type
type gb_1 from groupbox within w_ingreso_factura_manual
end type
end forward

global type w_ingreso_factura_manual from window
integer width = 2491
integer height = 1316
boolean titlebar = true
string title = "Ingreso Factura Manual"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_buscar cb_buscar
cb_limpiar cb_limpiar
cb_eliminar cb_eliminar
cb_grabar cb_grabar
cb_nuevo cb_nuevo
cb_cerrar cb_cerrar
dw_ingreso dw_ingreso
gb_1 gb_1
end type
global w_ingreso_factura_manual w_ingreso_factura_manual

type variables
Long	il_grupo
String	is_existe
end variables

on w_ingreso_factura_manual.create
this.cb_buscar=create cb_buscar
this.cb_limpiar=create cb_limpiar
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.cb_nuevo=create cb_nuevo
this.cb_cerrar=create cb_cerrar
this.dw_ingreso=create dw_ingreso
this.gb_1=create gb_1
this.Control[]={this.cb_buscar,&
this.cb_limpiar,&
this.cb_eliminar,&
this.cb_grabar,&
this.cb_nuevo,&
this.cb_cerrar,&
this.dw_ingreso,&
this.gb_1}
end on

on w_ingreso_factura_manual.destroy
destroy(this.cb_buscar)
destroy(this.cb_limpiar)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.cb_nuevo)
destroy(this.cb_cerrar)
destroy(this.dw_ingreso)
destroy(this.gb_1)
end on

event open;Long	ll_new

gf_centrar(w_ingreso_factura_manual)
SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

dw_ingreso.settransobject(sqlca)
ll_new	= dw_ingreso.insertrow(0)
SELECT	"FACTURAS"."GRUPO"
INTO 		:il_grupo  
FROM 		"FACTURAS"  
WHERE 	"FACTURAS"."ESTADO_REG" = 'P'   
USING		sqlca;
if sqlca.sqlcode=0 then 
	cb_limpiar.triggerevent(clicked!)
end if
dw_ingreso.accepttext()
	
end event

type cb_buscar from commandbutton within w_ingreso_factura_manual
integer x = 1138
integer y = 1088
integer width = 329
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;//if isvalid(w_listado_general_facturas_manuales) then close(w_listado_general_facturas_manuales)
//openwithparm(w_listado_general_facturas_manuales,string(il_grupo))
end event

type cb_limpiar from commandbutton within w_ingreso_factura_manual
integer x = 1513
integer y = 1088
integer width = 329
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		ll_new
String	ls_fecha

dw_ingreso.reset()
SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
ls_fecha	= string(gdt_fec_sistema,'yyyymmdd')
ll_new	= dw_ingreso.insertrow(0)
dw_ingreso.setitem(ll_new,'grupo',il_grupo)
dw_ingreso.setitem(ll_new,'estado_reg','P')
dw_ingreso.setitem(ll_new,'fecha_gestion',gdt_fec_sistema)
dw_ingreso.setitem(ll_new,'usuario_gestion',gs_user)
dw_ingreso.setitem(ll_new,'fecha_pago',ls_fecha)
dw_ingreso.setitem(ll_new,'c_existe','S')
is_existe		= 'N'
dw_ingreso.accepttext()
end event

type cb_eliminar from commandbutton within w_ingreso_factura_manual
integer x = 727
integer y = 1088
integer width = 329
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_factura,ll_rut,ll_res,ll_grupo,ll_correlativo
String	ls_est_reg,ls_nom_cli,ls_cod_control,ls_fecha_pago,ls_num_autoriza,ls_fono
Double	ldb_monto,ldb_iva,ldb_monto_bs,ldb_iva_bs

dw_ingreso.accepttext()
ll_grupo				= dw_ingreso.getitemnumber(1,'grupo')
ll_correlativo		= dw_ingreso.getitemnumber(1,'correlativo')
ll_factura				= dw_ingreso.getitemnumber(1,'nro_factura')
ls_est_reg			= dw_ingreso.getitemstring(1,'estado_reg')
ll_rut					= dw_ingreso.getitemnumber(1,'rut_cliente')
ls_nom_cli			= dw_ingreso.getitemstring(1,'nombre_cliente')
ls_cod_control		= dw_ingreso.getitemstring(1,'codigo_control')
ls_fecha_pago		= dw_ingreso.getitemstring(1,'fecha_pago')
ls_fono				= dw_ingreso.getitemstring(1,'fono_cliente')
ldb_monto			= double(dw_ingreso.getitemnumber(1,'monto'))
ldb_iva				= double(dw_ingreso.getitemnumber(1,'monto_iva'))
ldb_monto_bs		= double(dw_ingreso.getitemnumber(1,'monto_bs'))
ldb_iva_bs			= double(dw_ingreso.getitemnumber(1,'monto_iva_bs'))
ls_num_autoriza	= dw_ingreso.getitemstring(1,'numero_autorizacion')
if ll_factura > 0 and not isnull(ls_est_reg) and ll_rut > 0 and not isnull(ls_nom_cli) and &
	not isnull(ls_cod_control) and not isnull(ls_fecha_pago) and not isnull(ldb_monto) and &
	not isnull(ldb_monto) and not isnull(ls_num_autoriza) then
	
	ll_res	= messagebox("Eliminar","Está Seguro(a) de Eliminar Factura Nº "+string(ll_factura,'###,###,###,###,##0'),Exclamation!,YesNo!,2)
	if ll_res=1 then
		dw_ingreso.deleterow(1)
		if dw_ingreso.update()=1 then
			commit;
			messagebox("Eliminar","Eliminación Exitosa")
			cb_limpiar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Factura Nº "+string(ll_factura,'###,###,###,###,##0')+" SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_grabar from commandbutton within w_ingreso_factura_manual
integer x = 393
integer y = 1088
integer width = 329
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Double	ldb_monto,ldb_monto_bs,ldb_iva,ldb_iva_bs
Long		ll_factura,ll_rut,ll_max
String	ls_num_autoriza,ls_fono,ls_fecha_pago,ls_cod_control,ls_nom_cli,ls_est_reg,ls_pasa='N'

dw_ingreso.accepttext()
ll_factura				= dw_ingreso.getitemnumber(1,'nro_factura')
ls_est_reg			= dw_ingreso.getitemstring(1,'estado_reg')
ll_rut					= dw_ingreso.getitemnumber(1,'rut_cliente')
ls_nom_cli			= dw_ingreso.getitemstring(1,'nombre_cliente')
ls_cod_control		= dw_ingreso.getitemstring(1,'codigo_control')
ls_fecha_pago		= dw_ingreso.getitemstring(1,'fecha_pago')
ls_fono				= dw_ingreso.getitemstring(1,'fono_cliente')
ldb_monto			= double(dw_ingreso.getitemnumber(1,'monto'))
ldb_iva				= double(dw_ingreso.getitemnumber(1,'monto_iva'))
ldb_monto_bs		= double(dw_ingreso.getitemnumber(1,'monto_bs'))
ldb_iva_bs			= double(dw_ingreso.getitemnumber(1,'monto_iva_bs'))
ls_num_autoriza	= dw_ingreso.getitemstring(1,'numero_autorizacion')
if ll_factura > 0 then
	if ll_factura=0 or isnull(ll_factura) then
		messagebox("Advertencia","Debe Ingresar Nº Factura")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('nro_factura')
	elseif ls_est_reg='' or isnull(ls_est_reg) then
		messagebox("Advertencia","Debe Ingresar Estado")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('estado_reg')
//	elseif ll_rut=0 or isnull(ll_rut) then
//		messagebox("Advertencia","Debe Ingresar C.I. Cliente")
//		dw_ingreso.setfocus()
//		dw_ingreso.setcolumn('rut_cliente')
//	elseif ls_nom_cli='' or isnull(ls_nom_cli) then
//		messagebox("Advertencia","Debe Ingresar Nombre Cliente")
//		dw_ingreso.setfocus()
//		dw_ingreso.setcolumn('nombre_cliente')
//	elseif ls_cod_control='' or isnull(ls_cod_control) then
//		messagebox("Advertencia","Debe Ingresar Codigo Control")
//		dw_ingreso.setfocus()
//		dw_ingreso.setcolumn('codigo_control')
//	elseif ls_fecha_pago='' or isnull(ls_fecha_pago) then
//		messagebox("Advertencia","Debe Ingresar Fecha Pago")
//		dw_ingreso.setfocus()
//		dw_ingreso.setcolumn('fecha_pago')
//	elseif ldb_monto=0 or isnull(ldb_monto) then
//		messagebox("Advertencia","Debe Ingresar Monto US")
//		dw_ingreso.setfocus()
//		dw_ingreso.setcolumn('monto')
//	elseif ldb_iva=0 or isnull(ldb_iva) then
//		messagebox("Advertencia","Debe Ingresar Iva US")
//		dw_ingreso.setfocus()
//		dw_ingreso.setcolumn('monto_iva')
//	elseif ldb_monto_bs=0 or isnull(ldb_monto_bs) then
//		messagebox("Advertencia","Debe Ingresar Monto en Boliviano")
//		dw_ingreso.setfocus()
//		dw_ingreso.setcolumn('monto_bs')
//	elseif ldb_iva_bs=0 or isnull(ldb_iva_bs) then
//		messagebox("Advertencia","Debe Ingresar Iva en Boliviano")
//		dw_ingreso.setfocus()
//		dw_ingreso.setcolumn('monto_iva_bs')
	elseif ls_num_autoriza='' or isnull(ls_num_autoriza) then
		messagebox("Advertencia","Debe Ingresar Número Autorización")
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('numero_autorizacion')
	else
		ls_pasa		= 'S'
	end if
	if ls_pasa='S' then
		if is_existe = 'N' then
			SELECT	MAX("FACTURAS_DETALLE"."CORRELATIVO")  
			INTO 		:ll_max  
			FROM 		"FACTURAS_DETALLE"  
			USING		sqlca;
			if ll_max > 0 then
				ll_max ++
			else
				ll_max	= 1
			end if
			dw_ingreso.setitem(1,'correlativo',ll_max)
			dw_ingreso.setitem(1,'folio_comprobante',ll_factura)
			dw_ingreso.setitem(1,'tipo_cob_comprobante','BL')
		end if
		dw_ingreso.accepttext()
		if dw_ingreso.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			cb_limpiar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Factura Nº "+string(ll_factura,'###,###,###,###,##0')+" SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_nuevo from commandbutton within w_ingreso_factura_manual
integer x = 59
integer y = 1088
integer width = 329
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long		ll_new
String	ls_fecha

dw_ingreso.reset()
SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
ls_fecha		= string(gdt_fec_sistema,'yyyymmdd')
ll_new		= dw_ingreso.insertrow(0)
dw_ingreso.setitem(ll_new,'grupo',il_grupo)
dw_ingreso.setitem(ll_new,'estado_reg','P')
dw_ingreso.setitem(ll_new,'fecha_gestion',gdt_fec_sistema)
dw_ingreso.setitem(ll_new,'usuario_gestion',gs_user)
dw_ingreso.setitem(ll_new,'fecha_pago',ls_fecha)
dw_ingreso.setitem(ll_new,'c_existe','S')
is_existe		= 'N'
dw_ingreso.accepttext()

end event

type cb_cerrar from commandbutton within w_ingreso_factura_manual
integer x = 2030
integer y = 1088
integer width = 329
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_factura_manual)
end event

type dw_ingreso from datawindow within w_ingreso_factura_manual
integer x = 37
integer y = 32
integer width = 2395
integer height = 1012
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_facturas_manuales"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long		ll_factura, ll_grupo,ll_anno,ll_mes,ll_dia,ll_null,ll_res
String		ls_columna,ls_estado_reg,ls_estado, ls_existe, ls_fecha,ls_nro_autorizacion,ls_num_auto
Double	ldb_monto,ldb_monto_us,ldb_monto_iva_us,ldb_iva_us,ldb_iva_bs

Setnull(ll_null)
dw_ingreso.accepttext()
ls_columna	= dwo.name
if ls_columna='nro_factura' then
	dw_ingreso.setitem(1,'c_existe','S')
	dw_ingreso.accepttext()
	ll_factura		= dw_ingreso.getitemnumber(1,'nro_factura')
	ll_grupo		= dw_ingreso.getitemnumber(1,'grupo')
	ls_existe		= dw_ingreso.getitemstring(1,'c_existe')
	if ll_factura > 0 and ll_grupo > 0 and ls_existe<>'N' then
		SELECT	"FACTURAS_DETALLE"."ESTADO_REG",
					"FACTURAS"."NUMERO_AUTORIZACION"
		INTO 		:ls_estado_reg,
					:ls_nro_autorizacion
		FROM 	"FACTURAS",   
					"FACTURAS_DETALLE"  
		WHERE  ( "FACTURAS"."GRUPO" = "FACTURAS_DETALLE"."GRUPO" ) and  
				 ( "FACTURAS_DETALLE"."GRUPO" = :ll_grupo ) AND  
				 ( "FACTURAS_DETALLE"."NRO_FACTURA" = :ll_factura ) 
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ls_estado_reg='P' then
				ls_estado	= 'P - Pendiente'
			elseif ls_estado_reg='A' then
				ls_estado	= 'A - Anulado'
			elseif ls_estado_reg='G' then
				ls_estado	= 'G - Gestionado'
			end if
			ll_res				= messagebox("Advertencia","Factura Nº "+string(ll_factura,'###,###,###,###,##0')+" Ya Existe se encuentra en Estado: "+ls_estado+", desea Modificar Registro",Exclamation!,YesNo!,2)
			if ll_res=1 then
				if dw_ingreso.retrieve(ll_grupo,ll_factura)>0 then
					ls_num_auto	= dw_ingreso.getitemstring(1,'numero_autorizacion')
					if isnull(ls_num_auto) then dw_ingreso.setitem(1,'numero_autorizacion',ls_nro_autorizacion)
					dw_ingreso.accepttext()
				end if
				is_existe		= 'S'
			else
				dw_ingreso.setitem(1,'nro_factura',0)
				is_existe		= 'N'
			end if
		end if
	end if
	
elseif ls_columna='fecha_pago' then
	ls_fecha	= dw_ingreso.getitemstring(1,'fecha_pago')
	ll_anno	= long(mid(ls_fecha,1,4))
	ll_mes	= long(mid(ls_fecha,5,2))
	ll_dia	= long(mid(ls_fecha,7,2))
	if ll_anno < (year(date(gdt_fec_sistema)) - 2) then
		messagebox("Advertencia","Año Inválido, recuerde Formato debe ser Ingresado Año / Mes / Día")
		dw_ingreso.setcolumn('fecha_pago')
	elseif ll_mes < 1 and ll_mes > 12 then
		messagebox("Advertencia","Mes Inválido, recuerde Formato debe ser Ingresado Año / Mes / Día")
	elseif ll_dia < 1 and ll_dia > 31 then
		messagebox("Advertencia","Día Inválido, recuerde Formato debe ser Ingresado Año / Mes / Día")
	end if 
	
elseif ls_columna='monto' then
	ldb_monto		= dw_ingreso.getitemnumber(1,'monto') //monto en bs
//	ldb_iva_bs		= round(round(ldb_monto * gdb_iva,2) / 100,2)
	dw_ingreso.setitem(1,'monto_iva_bs',ldb_iva_bs)
	ldb_monto_us	= round(ldb_monto / round(1 / gd_uf_dia,2),2)
	dw_ingreso.setitem(1,'monto_bs',ldb_monto_us) //	monto en us.
//	ldb_iva_us		= round(round(ldb_monto_us * gdb_iva,2) / 100,2)
	dw_ingreso.setitem(1,'monto_iva',ldb_iva_us)
	
elseif ls_columna='estado_reg' then
	ls_estado_reg	= dw_ingreso.getitemstring(1,'estado_reg')
	if ls_estado_reg = 'A' then
		dw_ingreso.setitem(1,'nombre_cliente','ANULADO')
		dw_ingreso.setitem(1,'codigo_control','0')
		dw_ingreso.setitem(1,'rut_cliente',0)
		dw_ingreso.setitem(1,'monto',0)
		dw_ingreso.setitem(1,'monto_iva_bs',0)
		dw_ingreso.setitem(1,'monto_bs',0)
		dw_ingreso.setitem(1,'monto_iva',0)
//	else
//		dw_ingreso.setitem(1,'nombre_cliente','')
//		dw_ingreso.setitem(1,'codigo_control','')
//		dw_ingreso.setitem(1,'rut_cliente',ll_null)
	end if
end if
dw_ingreso.accepttext()
end event

event itemfocuschanged;Long		ll_factura, ll_grupo
String	ls_estado_reg, ls_existe

dw_ingreso.accepttext()
ll_factura		= dw_ingreso.getitemnumber(1,'nro_factura')
ll_grupo		= dw_ingreso.getitemnumber(1,'grupo')
ls_existe		= dw_ingreso.getitemstring(1,'c_existe')
if ll_factura > 0 and ll_grupo > 0 and ls_existe<>'N' then
	SELECT	"FACTURAS_DETALLE"."ESTADO_REG"
	INTO 		:ls_estado_reg  
	FROM 		"FACTURAS",   
				"FACTURAS_DETALLE"  
	WHERE  ( "FACTURAS"."GRUPO" = "FACTURAS_DETALLE"."GRUPO" ) and  
			 ( "FACTURAS_DETALLE"."GRUPO" = :ll_grupo ) AND  
			 ( "FACTURAS_DETALLE"."NRO_FACTURA" = :ll_factura ) 
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_ingreso.setitem(1,'nro_factura',0)
		dw_ingreso.setcolumn('nro_factura')
	end if
end if
dw_ingreso.accepttext()
end event

event clicked;String	ls_column,ls_fecha_ori,ls_fecha,ls_setea_fecha
Long		ll_factura

ls_column	= dwo.name
if ls_column='p_1' then
	ll_factura				= dw_ingreso.getitemnumber(1,'nro_factura')
	if ll_factura > 0 then
		ls_fecha_ori			= dw_ingreso.getitemstring(1,'fecha_pago')
		ls_fecha					= mid(ls_fecha_ori,7,2)+'/'+mid(ls_fecha_ori,5,2)+'/'+mid(ls_fecha_ori,1,4)
		if isnull(ls_fecha) then ls_fecha = string(gdt_fec_sistema,"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then
			ls_setea_fecha		= string(gdt_fec_sistema,'yyyymmdd')
			dw_ingreso.setitem(1,'fecha_pago',ls_setea_fecha)
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			ls_setea_fecha		= mid(ls_fecha,7,4)+mid(ls_fecha,4,2)+mid(ls_fecha,1,2)
			dw_ingreso.setitem(1,'fecha_pago',ls_setea_fecha)
		END IF
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('fecha_pago')
	end if
end if
end event

type gb_1 from groupbox within w_ingreso_factura_manual
integer x = 37
integer y = 1036
integer width = 1458
integer height = 176
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

