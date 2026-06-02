forward
global type w_tipo_servicio_detalle_bk2 from window
end type
type dw_beneficiarios from datawindow within w_tipo_servicio_detalle_bk2
end type
type cb_1 from commandbutton within w_tipo_servicio_detalle_bk2
end type
type dw_venta from datawindow within w_tipo_servicio_detalle_bk2
end type
type dw_detalle from datawindow within w_tipo_servicio_detalle_bk2
end type
type cb_ingreso_reg from commandbutton within w_tipo_servicio_detalle_bk2
end type
type cb_detalle from commandbutton within w_tipo_servicio_detalle_bk2
end type
type dw_lista from datawindow within w_tipo_servicio_detalle_bk2
end type
type dw_tipo_servicio from datawindow within w_tipo_servicio_detalle_bk2
end type
type cb_grabar from commandbutton within w_tipo_servicio_detalle_bk2
end type
type cb_cerrar from commandbutton within w_tipo_servicio_detalle_bk2
end type
type gb_1 from groupbox within w_tipo_servicio_detalle_bk2
end type
end forward

global type w_tipo_servicio_detalle_bk2 from window
integer x = 832
integer y = 360
integer width = 2720
integer height = 2040
boolean titlebar = true
string title = "Tipo Servicio Detalle"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
event ue_calcular ( )
dw_beneficiarios dw_beneficiarios
cb_1 cb_1
dw_venta dw_venta
dw_detalle dw_detalle
cb_ingreso_reg cb_ingreso_reg
cb_detalle cb_detalle
dw_lista dw_lista
dw_tipo_servicio dw_tipo_servicio
cb_grabar cb_grabar
cb_cerrar cb_cerrar
gb_1 gb_1
end type
global w_tipo_servicio_detalle_bk2 w_tipo_servicio_detalle_bk2

type variables
string		is_base,is_serie,is_uso,is_est_valida,is_tipo_infor
long 		il_row, il_row_selec,il_row_vta,il_cod_parque,il_cod_serv,il_tipo_benef,il_cant_benef
Double	il_numero
end variables

forward prototypes
public subroutine wf_porc (long al_cod_det, long al_cta, string as_tipo_dw)
public subroutine wf_actua_porce ()
public subroutine wf_cargar_datos (string as_tipo_carga)
public subroutine wf_grabar (string as_moneda, long al_cod_serv, double adb_precio, long al_capac, long al_tipo_benef)
end prototypes

event ue_calcular();long	ll_tot_lista,ll_cod_ser,ll_res,ll_tot_reg,ll_indi,ll_cta,ll_cod_serv_tab,ll_cant_benef,ll_tipo_benef

if not isnull(il_tipo_benef) and not isnull(il_cant_benef) and not isnull(il_cod_serv) and il_cod_serv>0 and not isnull(il_cod_parque) and il_cod_parque>0 then
	if is_tipo_infor='O' then
		dw_detalle.visible														= false
		dw_lista.height															= 1408
		cb_grabar.enabled														= false
	end if
	if il_cod_serv=99 then
		dw_lista.dataobject = 'dw_servicio_detalle_seleccion'
		dw_lista.settransobject(sqlca)
		dw_detalle.visible														= true
	else
		dw_lista.dataobject = 'dw_servicio_detalle'
		dw_lista.settransobject(sqlca)
		dw_detalle.visible														= false
		dw_lista.height															= 1408
	end if
	dw_tipo_servicio.getchild('cod_servicio',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(il_cod_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_tipo_servicio.insertrow(0)
	dw_tipo_servicio.setitem(1,'cod_servicio',il_cod_serv)
	dw_tipo_servicio.accepttext()
	
	dw_beneficiarios.insertrow(0)
	dw_beneficiarios.setitem(1,'tipo_benef',il_tipo_benef)
	dw_beneficiarios.setitem(1,'cant_benef',il_cant_benef)
	dw_beneficiarios.accepttext()
	
	ll_tot_lista																	= dw_venta.retrieve(is_base,is_serie,il_numero,is_est_valida)
	if ll_tot_lista>0 then
		ll_cod_ser																= dw_venta.getitemnumber(1,'cod_servicio')
		ll_tipo_benef															= dw_venta.getitemnumber(1,'tipo_beneficiario')
		ll_cant_benef															= dw_venta.getitemnumber(1,'capacidad')
		if ll_cod_ser=il_cod_serv and ll_cant_benef=il_cant_benef and ll_tipo_benef=il_tipo_benef then
			wf_cargar_datos('A') 												// Import datos venta asociada
			dw_tipo_servicio.object.cod_servicio.protect				= 1
		else
			messagebox("Advertencia","Tipo Servicio No Coincide con Registro Guardado")
			ll_res																	= MessageBox("Advertencia",'Desea Mostar Registro Guardado',Exclamation!, YesNo!,2)
			if ll_res=1 then
				il_cod_serv														= dw_venta.getitemnumber(1,'cod_servicio')
				il_tipo_benef													= dw_venta.getitemnumber(1,'tipo_beneficiario')
				il_cant_benef													= dw_venta.getitemnumber(1,'capacidad')
				dw_tipo_servicio.setitem(1,'cod_servicio',il_cod_serv)
				dw_beneficiarios.setitem(1,'tipo_benef',il_tipo_benef)
				dw_beneficiarios.setitem(1,'cant_benef',il_cant_benef)
				dw_tipo_servicio.accepttext()
				dw_beneficiarios.accepttext()
				wf_cargar_datos('A') 											// Import datos venta asociada
				dw_tipo_servicio.object.cod_servicio.protect			= 1
				//cb_grabar.enabled												= false
			else
				ll_res																= MessageBox("Advertencia",'Desea Genera Nueva Compra',Exclamation!, YesNo!,2)
				if ll_res=1 then
					if il_cod_serv=99 then
						dw_venta.reset()
						dw_tipo_servicio.object.cod_servicio.protect	= 1
						ll_tot_reg												= dw_lista.retrieve(99,is_uso)
						if ll_tot_reg>0 then
							for ll_indi=1 to ll_tot_reg
								dw_lista.setitem(ll_indi,'marca',0)
							next
						end if
					else
						dw_tipo_servicio.object.cod_servicio.protect	= 1
						ll_tot_reg												= dw_lista.retrieve(il_tipo_benef,il_cant_benef,il_cod_serv,is_uso)
						if ll_tot_reg>0 then
							for ll_indi=1 to ll_tot_reg
								dw_lista.setitem(ll_indi,'marca',1)
							next
							dw_lista.object.marca.protect					= 1
							SELECT	count("PRODUCTO_ANEXO"."BASE")
							INTO		:ll_cta	
							FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
							WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
										"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
										"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
										"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
										"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
										"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
										"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
							USING	sqlca;
							if sqlca.sqlcode=0 then
								if  not isnull(ll_cta) and ll_cta>0 then
									SELECT	"PRODUCTO_PAGO"."CODIGO_SERVICIO"  
									INTO		:ll_cod_serv_tab	
									FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
									WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
												"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
												"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
												"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
												"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
												"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
												"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
									USING	sqlca;
									if il_cod_serv<> ll_cod_serv_tab then
										cb_grabar.enabled						= true
									else
										cb_grabar.enabled						= false
									end if
								else
									cb_grabar.enabled							= true
								end if
							else
								cb_grabar.enabled								= true
							end if
						end if
						wf_cargar_datos('L')
					end if
				end if
			end if
		end if
	else
		ll_res																= MessageBox("Advertencia",'Desea Genera Nueva Compra',Exclamation!, YesNo!,2)
		if ll_res=1 then
			if il_cod_serv=99 then
				dw_venta.reset()
				dw_tipo_servicio.object.cod_servicio.protect	= 1
				ll_tot_reg												= dw_lista.retrieve(99,is_uso)
				if ll_tot_reg>0 then
					for ll_indi=1 to ll_tot_reg
						dw_lista.setitem(ll_indi,'marca',0)
					next
				end if
			else
				dw_tipo_servicio.object.cod_servicio.protect	= 1
				ll_tot_reg												= dw_lista.retrieve(il_tipo_benef,il_cant_benef,il_cod_serv,is_uso)
				if ll_tot_reg>0 then
					for ll_indi=1 to ll_tot_reg
						dw_lista.setitem(ll_indi,'marca',1)
					next
					dw_lista.object.marca.protect					= 1
					SELECT	count("PRODUCTO_ANEXO"."BASE")
					INTO		:ll_cta	
					FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
					WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
								"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
								"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
								"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
								"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
								"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
								"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
					USING	sqlca;
					if sqlca.sqlcode=0 then
						if  not isnull(ll_cta) and ll_cta>0 then
							SELECT	"PRODUCTO_PAGO"."CODIGO_SERVICIO"  
							INTO		:ll_cod_serv_tab	
							FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
							WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
										"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
										"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
										"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
										"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
										"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
										"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
							USING	sqlca;
							if il_cod_serv<> ll_cod_serv_tab then
								cb_grabar.enabled						= true
							else
								cb_grabar.enabled						= false
							end if
						else
							cb_grabar.enabled							= true
						end if
					else
						cb_grabar.enabled								= true
					end if
				end if
				wf_cargar_datos('L')
			end if
		end if
	end if
end if
end event

public subroutine wf_porc (long al_cod_det, long al_cta, string as_tipo_dw);long		ll_indi,ll_marca,ll_tot_reg
double	ldb_porce,ldb_sum_porc,ldb_dif_porc

//wf_porc(al_cod_det,al_cta,as_tipo_dw)
dw_lista.accepttext()
if al_cod_det=1 then
	ldb_porce								= dw_detalle.getitemnumber(il_row_selec,'porce_valor')
	dw_lista.setitem(il_row,'porce_descuento',ldb_porce)
else
	ldb_porce								= round((0.4 / al_cta),4)
	ll_tot_reg								= dw_lista.rowcount()
	for ll_indi=2 to ll_tot_reg
		ll_marca								= dw_lista.getitemnumber(ll_indi,'marca')
		if ll_marca=1 then
			ldb_sum_porc					= ldb_sum_porc + ldb_porce
			dw_lista.setitem(ll_indi,'porce_descuento',ldb_porce)
		else
			dw_lista.setitem(ll_indi,'porce_descuento',0)
		end if
	next
	ldb_dif_porc								= round((0.4 - ldb_sum_porc),4)
	if ldb_dif_porc<>0 then
		if ldb_dif_porc>0 then
			ldb_porce						= ldb_porce + ldb_dif_porc
			dw_lista.setitem(2,'porce_descuento',ldb_porce)
		elseif ldb_dif_porc<0 then
			ldb_porce						= ldb_porce + ldb_dif_porc
			if as_tipo_dw='D' then
				dw_lista.setitem((al_cta+1),'porce_descuento',ldb_porce)
			elseif as_tipo_dw='L' then
				dw_lista.setitem((al_cta),'porce_descuento',ldb_porce)
			end if
		end if
	end if
end if
dw_lista.accepttext()
end subroutine

public subroutine wf_actua_porce ();long		ll_tot_reg,ll_indi,ll_cod_serv,ll_cod_det,ll_tot_reg2,ll_indi2,ll_cod_serv2,ll_cod_det2
double	ldb_porce

dw_lista.accepttext()
dw_venta.accepttext()
ll_tot_reg							= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_cod_serv						= dw_lista.getitemnumber(ll_indi,'codigo_servicio')
	ll_cod_det						= dw_lista.getitemnumber(ll_indi,'codigo_detalle')
	ldb_porce						= dw_lista.getitemnumber(ll_indi,'porce_descuento')
	ll_tot_reg2						= dw_venta.rowcount()
	for ll_indi2=1 to ll_tot_reg2
		ll_cod_serv2					= dw_venta.getitemnumber(ll_indi2,'cod_servicio')
		ll_cod_det2					= dw_venta.getitemnumber(ll_indi2,'cod_detalle')
		if ll_cod_serv=ll_cod_serv2 and ll_cod_det=ll_cod_det2 then
			dw_venta.setitem(ll_indi2,'porce_pago',ldb_porce)
			dw_venta.accepttext()
		end if
	next
next
end subroutine

public subroutine wf_cargar_datos (string as_tipo_carga);string		ls_desc_serv,ls_moneda,ls_glo_tipo_serv,ls_estado,ls_glo_serv_det,ls_glo_det_final,ls_uso
long		ll_indi,ll_cod_serv,ll_cod_det,ll_tot_reg,ll_new,ll_cod_det_final,ll_tot_reg2,ll_indi2,ll_cod_serv2,ll_cod_det2,ll_cod_det_tot
double	ldb_valor,ldb_porc_pago
datetime	ldt_fec_vig,ldt_fec_crea

SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 	"TASA"  ;
if as_tipo_carga='L' then
	dw_venta.reset()
	dw_lista.accepttext()
	ll_tot_reg												= dw_lista.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ll_cod_serv										= dw_lista.getitemnumber(ll_indi,'codigo_servicio')
			ls_desc_serv									= dw_lista.getitemstring(ll_indi,'descripcion')
			ll_cod_det										= dw_lista.getitemnumber(ll_indi,'codigo_detalle')
			ldb_valor											= dw_lista.getitemnumber(ll_indi,'producto_lista_precio_valor')
			ls_moneda										= dw_lista.getitemstring(ll_indi,'moneda')
			ls_estado										= dw_lista.getitemstring(ll_indi,'estado_registro')
			ldt_fec_vig										= dw_lista.getitemdatetime(ll_indi,'fecha_vigencia')
			ls_uso											= dw_lista.getitemstring(ll_indi,'producto_lista_precio_uso')
			SELECT	"DESCRIPCION"  
			INTO		:ls_glo_tipo_serv  
			FROM		"PRODUCTO_TIPO_SERVICIO"  
			WHERE	( "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" = :ll_cod_serv ) AND  
						( "PRODUCTO_TIPO_SERVICIO"."ESTADO_REGISTRO" = :ls_estado ) AND  
						( "PRODUCTO_TIPO_SERVICIO"."FECHA_VIGENCIA" <= :gdt_fec_sistema ) AND  
						( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = :il_cod_parque )
			USING	sqlca;
			SELECT	"PRODUCTO_TIPO_SERVICIO_DETA"."DESCRIPCION"  
			INTO		:ls_glo_serv_det  
			FROM		"PRODUCTO_TIPO_SERVICIO_DETA"  
			WHERE	( "PRODUCTO_TIPO_SERVICIO_DETA"."CODIGO_SERVICIO" = :ll_cod_serv ) AND  
						( "PRODUCTO_TIPO_SERVICIO_DETA"."CODIGO_DETALLE" = :ll_cod_det ) AND  
						( "PRODUCTO_TIPO_SERVICIO_DETA"."FECHA_VIGENCIA" <= :gdt_fec_sistema ) AND  
						( "PRODUCTO_TIPO_SERVICIO_DETA"."ESTADO_REGISTRO" = :ls_estado )
			USING	sqlca;
			SELECT	"PRODUCTO_DETALLE_FINAL"."DESCRIPCION"  
			INTO 		:ls_glo_det_final  
			FROM		"PRODUCTO_DETALLE_FINAL"  
			WHERE	( "PRODUCTO_DETALLE_FINAL"."COD_SERVICIO" = :ll_cod_serv ) AND  
						( "PRODUCTO_DETALLE_FINAL"."COD_DETALLE" = :ll_cod_det ) AND  
						( "PRODUCTO_DETALLE_FINAL"."COD_DETALLE_FINAL" = :ll_cod_det_tot ) AND  
						( "PRODUCTO_DETALLE_FINAL"."ESTADO" = :ls_estado ) AND  
						( "PRODUCTO_DETALLE_FINAL"."FECHA_VIGENCIA" <= :gdt_fec_sistema )
			USING	sqlca;
			ll_new											= dw_venta.insertrow(0)
			dw_venta.object.usuario.text				= gs_user
			dw_venta.scrolltorow(ll_new)
			dw_venta.setitem(ll_indi,'base',is_base)
			dw_venta.setitem(ll_indi,'serie',is_serie)
			dw_venta.setitem(ll_indi,'numero',il_numero)
			dw_venta.setitem(ll_indi,'cod_servicio',ll_cod_serv)
			dw_venta.setitem(ll_indi,'glosa_servicio',ls_glo_tipo_serv)
			dw_venta.setitem(ll_indi,'cod_detalle',ll_cod_det)
			dw_venta.setitem(ll_indi,'glosa_detalle',ls_glo_serv_det)
			dw_venta.setitem(ll_indi,'fecha_crea',gdt_fec_sistema)
			dw_venta.setitem(ll_indi,'cod_detalle_final',ll_cod_det_tot)
			dw_venta.setitem(ll_indi,'glosa_detalle_final',ls_glo_det_final)
			dw_venta.setitem(ll_indi,'valor_producto',ldb_valor)
			//dw_venta.setitem(ll_indi,'porce_pago',ldb_porc_pago)
			dw_venta.setitem(ll_indi,'estado',is_est_valida)
			dw_venta.setitem(ll_indi,'fecha_vigencia',ldt_fec_vig)
			dw_venta.setitem(ll_indi,'uso',is_uso)
			dw_venta.setitem(ll_indi,'capacidad',il_cant_benef)
			dw_venta.setitem(ll_indi,'tipo_beneficiario',il_tipo_benef)
			dw_venta.accepttext()
		next
	end if
elseif as_tipo_carga='A' then
	dw_venta.accepttext()
	ll_tot_reg																= dw_lista.retrieve(il_tipo_benef,il_cant_benef,il_cod_serv,is_uso)
	if ll_tot_reg>0 then
		dw_venta.object.usuario.text									= gs_user
		for ll_indi=1 to ll_tot_reg
			ll_cod_serv														= dw_lista.getitemnumber(ll_indi,'codigo_servicio')
			ll_cod_det														= dw_lista.getitemnumber(ll_indi,'codigo_detalle')
			ll_tot_reg2														= dw_venta.rowcount()
			if ll_tot_reg2>0 then
				for ll_indi2=1 to ll_tot_reg2
					ll_cod_serv2												= dw_venta.getitemnumber(ll_indi2,'cod_servicio')
					ll_cod_det2												= dw_venta.getitemnumber(ll_indi2,'cod_detalle')
					ldb_valor													= dw_venta.getitemnumber(ll_indi2,'valor_producto')
					ldb_porc_pago											= dw_venta.getitemnumber(ll_indi2,'porce_pago')
					ls_uso													= dw_venta.getitemstring(ll_indi2,'uso')
					dw_venta.setitem(ll_indi2,'fecha_crea',gdt_fec_sistema)
					if ll_cod_serv=ll_cod_serv2 and ll_cod_det=ll_cod_det2 then
						dw_tipo_servicio.setitem(1,'cod_servicio',ll_cod_serv2)
						dw_tipo_servicio.accepttext()
						dw_lista.setitem(ll_indi,'marca',1)
						dw_lista.setitem(ll_indi,'producto_lista_precio_valor',ldb_valor)
						//dw_lista.setitem(ll_indi,'porce_descuento',ldb_porc_pago)
						dw_lista.setitem(ll_indi,'producto_lista_precio_uso',ls_uso)
						dw_lista.object.producto_lista_precio_valor.protect					= 1
						//dw_lista.object.porce_descuento.protect		= 1
						dw_lista.accepttext()
					end if
				next
			end if
		next
	end if
end if
end subroutine

public subroutine wf_grabar (string as_moneda, long al_cod_serv, double adb_precio, long al_capac, long al_tipo_benef);string		ls_mon_orig,ls_forma_pag,ls_estado_vta
long		ll_nro_cta,ll_gto_peso,ll_tot_reg,ll_indi
double	ldb_pie,ldb_valor_uf,ldb_gtos_adm,ldb_int_uf,ldb_int_peso,ldb_gto_uf,ldb_interes,ldb_nulo,ldb_valor_cta,ldb_precio

//wf_grabar(as_moneda,al_cod_serv,adb_precio)
setnull(ldb_nulo)
ll_tot_reg									= dw_venta.rowcount()
if isvalid(w_ingresar_funeraria) then
	ls_estado_vta							= 'D' // DIGITACION
elseif isvalid(w_validar_promesa_operaciones) then
	ls_estado_vta							= 'R' //REVISION
end if
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		dw_venta.setitem(ll_indi,'estado',ls_estado_vta)
		dw_venta.accepttext()
	next
end if
if dw_venta.update() = 1 then
	commit using sqlca;
	if isvalid(w_ingresar_funeraria) then
		ls_mon_orig							= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
		ldb_pie								= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie'))
		ldb_valor_uf							= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_uf_dia'))
		ll_nro_cta							= long(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo'))
		ldb_gtos_adm						= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_gasto_adm'))
		ls_forma_pag						= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')
		ldb_valor_cta						= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota'))
		ldb_precio							= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio'))
		SELECT	"INTERES_UF",	"INTERES_PESOS"  
		INTO 		:ldb_int_uf,		:ldb_int_peso  
		FROM 	"INTERES_CUOTAS"  
		WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_nro_cta   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ldb_int_uf) then ldb_int_uf=0
			if isnull(ldb_int_peso) then ldb_int_peso=0
		end if
		SELECT	"TASA_UF",	"TASA_PESO"  
		INTO 		:ldb_gto_uf,	:ll_gto_peso  
		FROM 	"TASA_GASTOS_ADM"  
		WHERE 	"TASA_GASTOS_ADM"."CODIGO" = 1   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ldb_gto_uf) then ldb_gto_uf=0
			if isnull(ll_gto_peso) then ll_gto_peso=0
		end if
		if as_moneda='1' then
			ldb_interes						= ldb_int_peso
			ldb_gtos_adm					= ll_nro_cta * ll_gto_peso
		elseif as_moneda='2' then
			ldb_interes						= ldb_int_uf
			ldb_gtos_adm					= ll_nro_cta * ldb_gto_uf
		end if
		
		if ls_mon_orig='1' then
			ldb_pie							= ldb_pie / ldb_valor_uf
			ldb_valor_cta					= ldb_valor_cta / ldb_valor_uf
		elseif ls_mon_orig='2' then
			ldb_pie							= ldb_pie
			ldb_valor_cta					= ldb_valor_cta
		end if
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',al_cod_serv)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_moneda',as_moneda)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_pie)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_precio',adb_precio)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_interes)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',ldb_gtos_adm)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_capacidad',al_capac)
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_beneficiarios',al_tipo_benef)
		
		if adb_precio<>ldb_precio then
			ldb_valor_cta					= 0
		end if
		w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',ldb_valor_cta)
		w_ingresar_funeraria.dw_anexo_funeraria.accepttext()
	elseif isvalid(w_validar_promesa_operaciones) then
		ls_mon_orig							= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'moneda')
		ldb_pie								= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'pie'))
		ldb_valor_uf							= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'uf_fecha_ctto'))
		ll_nro_cta							= long(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'plazo'))
		ldb_gtos_adm						= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'gasto_adm'))
		ls_forma_pag						= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'forma_pago')
		ldb_valor_cta						= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'c_suma_val_cuota'))
		ldb_precio							= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'precio_contrato'))
		SELECT	"INTERES_UF",	"INTERES_PESOS"  
		INTO 		:ldb_int_uf,		:ldb_int_peso  
		FROM 	"INTERES_CUOTAS"  
		WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_nro_cta   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ldb_int_uf) then ldb_int_uf=0
			if isnull(ldb_int_peso) then ldb_int_peso=0
		end if
		SELECT	"TASA_UF",	"TASA_PESO"  
		INTO 		:ldb_gto_uf,	:ll_gto_peso  
		FROM 	"TASA_GASTOS_ADM"  
		WHERE 	"TASA_GASTOS_ADM"."CODIGO" = 1   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ldb_gto_uf) then ldb_gto_uf=0
			if isnull(ll_gto_peso) then ll_gto_peso=0
		end if
		if as_moneda='1' then
			ldb_interes						= ldb_int_peso
			ldb_gtos_adm					= ll_nro_cta * ll_gto_peso
		elseif as_moneda='2' then
			ldb_interes						= ldb_int_uf
			ldb_gtos_adm					= ll_nro_cta * ldb_gto_uf
		end if
		
		if ls_mon_orig='1' then
			ldb_pie							= ldb_pie / ldb_valor_uf
			ldb_valor_cta					= ldb_valor_cta / ldb_valor_uf
		elseif ls_mon_orig='2' then
			ldb_pie							= ldb_pie
			ldb_valor_cta					= ldb_valor_cta
		end if
		w_validar_promesa_operaciones.dw_revision.setitem(1,'codigo_servicio',al_cod_serv)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'moneda',as_moneda)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'pie',ldb_pie)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'precio',adb_precio)
		//w_validar_promesa_operaciones.dw_revision.setitem(1,'producto_pago_tasa_base',ldb_interes)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'gasto_adm',ldb_gtos_adm)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'capacidad',al_capac)
		w_validar_promesa_operaciones.dw_revision.setitem(1,'tipo_beneficiarios',al_tipo_benef)
		if adb_precio<>ldb_precio then
			ldb_valor_cta					= 0
		end if
		w_validar_promesa_operaciones.dw_revision.setitem(1,'valor_cuota',ldb_valor_cta)
		w_validar_promesa_operaciones.dw_revision.accepttext()
	end if
	messagebox("Grabar","Grabación Exitosa")
	messagebox("Advertencia","No Olvide Grabar Modificaciones Al Registro Servicio Funerario")
	dw_venta.reset()
else
	rollback using sqlca;
	messagebox("Error Grabar","Error Grabar Servicio Funerarios: "+sqlca.sqlerrtext)
end if
end subroutine

on w_tipo_servicio_detalle_bk2.create
this.dw_beneficiarios=create dw_beneficiarios
this.cb_1=create cb_1
this.dw_venta=create dw_venta
this.dw_detalle=create dw_detalle
this.cb_ingreso_reg=create cb_ingreso_reg
this.cb_detalle=create cb_detalle
this.dw_lista=create dw_lista
this.dw_tipo_servicio=create dw_tipo_servicio
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.Control[]={this.dw_beneficiarios,&
this.cb_1,&
this.dw_venta,&
this.dw_detalle,&
this.cb_ingreso_reg,&
this.cb_detalle,&
this.dw_lista,&
this.dw_tipo_servicio,&
this.cb_grabar,&
this.cb_cerrar,&
this.gb_1}
end on

on w_tipo_servicio_detalle_bk2.destroy
destroy(this.dw_beneficiarios)
destroy(this.cb_1)
destroy(this.dw_venta)
destroy(this.dw_detalle)
destroy(this.cb_ingreso_reg)
destroy(this.cb_detalle)
destroy(this.dw_lista)
destroy(this.dw_tipo_servicio)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.gb_1)
end on

event open;STRING		ls_pppp

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_tipo_servicio_detalle)
il_tipo_benef		= long(substr(1,1,message.stringparm))
il_cant_benef		= long(substr(1,2,message.stringparm))
il_cod_serv			= long(substr(1,3,message.stringparm))
il_cod_parque		= long(substr(1,4,message.stringparm))
is_base				= substr(1,5,message.stringparm)
is_serie				= substr(1,6,message.stringparm)
il_numero			= Double(substr(1,7,message.stringparm))
is_uso				= substr(1,8,message.stringparm)
is_est_valida		= substr(1,9,message.stringparm)
is_tipo_infor			= substr(1,10,message.stringparm)

dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_venta.settransobject(sqlca)
dw_beneficiarios.settransobject(sqlca)
PostEvent('ue_calcular')

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type dw_beneficiarios from datawindow within w_tipo_servicio_detalle_bk2
integer x = 1006
integer y = 96
integer width = 1600
integer height = 88
integer taborder = 10
string title = "none"
string dataobject = "dwe_beneficiario"
boolean border = false
boolean livescroll = true
end type

type cb_1 from commandbutton within w_tipo_servicio_detalle_bk2
integer x = 1408
integer y = 1792
integer width = 274
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_venta.rowcount() >0 then 
	f_Print( dw_venta )
end if
end event

type dw_venta from datawindow within w_tipo_servicio_detalle_bk2
integer x = 2729
integer y = 136
integer width = 2670
integer height = 1588
integer taborder = 40
string title = "none"
string dataobject = "dw_venta_asociada"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_detalle from datawindow within w_tipo_servicio_detalle_bk2
integer x = 55
integer y = 1124
integer width = 2587
integer height = 632
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_producto_final"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string		ls_moneda,ls_estado,ls_columna,ls_elimina='N'
long		ll_cod_serv,ll_cod_det,ll_cod_det_tot,ll_marca,ll_indi,ll_tot_reg,ll_tot_reg2,ll_indi2,ll_cod_serv_vta,ll_cod_det_vta,ll_cta,ll_tot_lista,ll_indi_lista,ll_marca2,ll_fila
datetime	ldt_fec_vig
double	ldb_precio,ldb_porce,ldb_sum_porc=0,ldb_dif_porc

this.accepttext()
ls_columna											= dwo.name
if row>0 then
	ll_tot_reg										= dw_detalle.rowcount()
	il_row_selec										= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_selec, TRUE)
	if ls_columna='marca' then
		ll_cod_serv									= dw_detalle.getitemnumber(il_row_selec,'cod_servicio')
		ll_cod_det									= dw_detalle.getitemnumber(il_row_selec,'cod_detalle')
		ll_cod_det_tot								= dw_detalle.getitemnumber(il_row_selec,'cod_detalle_final')
		ls_moneda									= dw_detalle.getitemstring(il_row_selec,'moneda')
		ldb_precio									= dw_detalle.getitemnumber(il_row_selec,'valor')
		ls_estado									= dw_detalle.getitemstring(il_row_selec,'estado')
		ll_marca										= dw_detalle.getitemnumber(il_row_selec,'marca')
		ldt_fec_vig									= dw_detalle.getitemdatetime(il_row_selec,'fecha_vigencia')
		for ll_indi=1 to ll_tot_reg
			dw_detalle.setitem(ll_indi,'marca',0)
		next
		dw_detalle.setitem(il_row_selec,'marca',1)
		dw_lista.setitem(il_row,'marca',1)	
		dw_lista.setitem(il_row,'codigo_detalle',ll_cod_det_tot)
		dw_lista.setitem(il_row,'valor',ldb_precio)
		dw_lista.accepttext()
		ll_cta											= dw_lista.getitemnumber(1,'c_cta')
		wf_porc(ll_cod_det,ll_cta,'D')
		dw_detalle.accepttext()
		ll_fila 											= long(data)
		if ll_fila = 0 then
			for ll_indi=1 to ll_tot_reg
				dw_detalle.setitem(ll_indi,'marca',0)
			next
			dw_lista.setitem(il_row,'marca',0)	
			dw_lista.setitem(il_row,'codigo_detalle',0)	
			dw_lista.setitem(il_row,'valor',0)
					
			dw_lista.accepttext()
			ll_cta										= dw_lista.getitemnumber(1,'c_cta')
			if ll_cta>0 then
				wf_porc(ll_cod_det,ll_cta,'D')
			else
				dw_lista.setitem(il_row,'porce_descuento',0)
			end if
			ll_tot_reg2								= dw_venta.rowcount()
			for ll_indi2=1 to ll_tot_reg2
				ll_cod_serv_vta						= dw_venta.getitemnumber(ll_indi2,'cod_servicio')
				ll_cod_det_vta						= dw_venta.getitemnumber(ll_indi2,'cod_detalle')
				if ll_cod_serv=ll_cod_serv_vta and ll_cod_det=ll_cod_det_vta then
					ls_elimina						= 'S'
					if ls_elimina='S' then
						dw_venta.deleterow(ll_indi2)
						dw_venta.accepttext()
						ll_tot_reg2					= dw_venta.rowcount()
						ll_indi2						= ll_indi2 - 1
					end if
				end if
			next
		end if
		dw_detalle.accepttext()
		cb_ingreso_reg.triggerevent(clicked!)
	end if
end if
end event

event clicked;if row>0 then
	il_row_selec						= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_selec, TRUE)
end if
end event

type cb_ingreso_reg from commandbutton within w_tipo_servicio_detalle_bk2
boolean visible = false
integer x = 50
integer y = 1984
integer width = 274
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ingresar Detalle"
end type

event clicked;string		ls_estado,ls_moneda,ls_pasa='N',ls_glo_tipo_serv,ls_glo_serv_det,ls_glo_det_final
long		ll_tot_reg,ll_indi,ll_cod_serv,ll_new,ll_cod_det,ll_cod_det_tot,ll_marca,ll_cod_serv_vta,&
			ll_cod_det_vta,ll_cod_det_tot_vta,ll_cod_serv_val,ll_cod_det_val,ll_indi1,ll_tot_reg1,ll_existe=0
datetime	ldt_fec_vig
double	ldb_precio,ldb_porce

dw_detalle.accepttext()
dw_venta.accepttext()
if il_row_selec>0 then
	ll_marca									= dw_detalle.getitemnumber(il_row_selec,'marca')
	if ll_marca=0 then
		messagebox("Advertencia","Debe Marcar el Codigo Servicio Elegido")
	else
		ll_cod_serv							= dw_detalle.getitemnumber(il_row_selec,'cod_servicio')
		ll_cod_det							= dw_detalle.getitemnumber(il_row_selec,'cod_detalle')
		ll_cod_det_tot						= dw_detalle.getitemnumber(il_row_selec,'cod_detalle_final')
		ls_moneda							= dw_detalle.getitemstring(il_row_selec,'moneda')
		ldb_precio							= dw_detalle.getitemnumber(il_row_selec,'valor')
		ls_estado							= dw_detalle.getitemstring(il_row_selec,'estado')
		ldt_fec_vig							= dw_detalle.getitemdatetime(il_row_selec,'fecha_vigencia')
		SELECT	"DESCRIPCION"  
		INTO		:ls_glo_tipo_serv  
		FROM		"PRODUCTO_TIPO_SERVICIO"  
		WHERE	( "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" = :ll_cod_serv ) AND  
					( "PRODUCTO_TIPO_SERVICIO"."ESTADO_REGISTRO" = :ls_estado ) AND  
					( "PRODUCTO_TIPO_SERVICIO"."FECHA_VIGENCIA" <= :gdt_fec_sistema ) AND  
					( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = :il_cod_parque )
		USING	sqlca;
		SELECT	"PRODUCTO_TIPO_SERVICIO_DETA"."DESCRIPCION"  
		INTO		:ls_glo_serv_det  
		FROM		"PRODUCTO_TIPO_SERVICIO_DETA"  
		WHERE	( "PRODUCTO_TIPO_SERVICIO_DETA"."CODIGO_SERVICIO" = :ll_cod_serv ) AND  
					( "PRODUCTO_TIPO_SERVICIO_DETA"."CODIGO_DETALLE" = :ll_cod_det ) AND  
					( "PRODUCTO_TIPO_SERVICIO_DETA"."FECHA_VIGENCIA" <= :gdt_fec_sistema ) AND  
					( "PRODUCTO_TIPO_SERVICIO_DETA"."ESTADO_REGISTRO" = :ls_estado )
		USING	sqlca;
		SELECT	"PRODUCTO_DETALLE_FINAL"."DESCRIPCION"  
		INTO 		:ls_glo_det_final  
		FROM		"PRODUCTO_DETALLE_FINAL"  
		WHERE	( "PRODUCTO_DETALLE_FINAL"."COD_SERVICIO" = :ll_cod_serv ) AND  
					( "PRODUCTO_DETALLE_FINAL"."COD_DETALLE" = :ll_cod_det ) AND  
					( "PRODUCTO_DETALLE_FINAL"."COD_DETALLE_FINAL" = :ll_cod_det_tot ) AND  
					( "PRODUCTO_DETALLE_FINAL"."ESTADO" = :ls_estado ) AND  
					( "PRODUCTO_DETALLE_FINAL"."FECHA_VIGENCIA" <= :gdt_fec_sistema )
		USING	sqlca;
		
		ll_tot_reg							= dw_venta.rowcount() 
		if  ll_tot_reg = 0 then
			ls_pasa							= 'S'
		else
			for ll_indi=1 to ll_tot_reg
				ll_cod_serv_vta				= dw_venta.getitemnumber(ll_indi,'cod_servicio')
				ll_cod_det_vta				= dw_venta.getitemnumber(ll_indi,'cod_detalle')
				ll_cod_det_tot_vta			= dw_venta.getitemnumber(ll_indi,'cod_detalle_final')
				if ll_cod_serv=ll_cod_serv_vta and ll_cod_det=ll_cod_det_vta and ll_cod_det_tot=ll_cod_det_tot_vta then
					ls_pasa					= 'N'
					messagebox("Advertencia","Detalle Servicio se Encuentra Asignado")
				elseif ll_cod_serv=ll_cod_serv_vta and ll_cod_det=ll_cod_det_vta and (ll_cod_det_tot<>ll_cod_det_tot_vta) then
					ls_pasa					= 'M'
					dw_venta.setitem(ll_indi,'glosa_detalle',ls_glo_serv_det)
					dw_venta.setitem(ll_indi,'cod_detalle_final',ll_cod_det_tot)
					dw_venta.setitem(ll_indi,'glosa_detalle_final',ls_glo_det_final)
					dw_venta.setitem(ll_indi,'fecha_crea',gdt_fec_sistema)
					dw_venta.setitem(ll_indi,'valor_producto',ldb_precio)
					dw_venta.setitem(ll_indi,'estado',ls_estado)
					dw_venta.setitem(ll_indi,'fecha_vigencia',ldt_fec_vig)
					dw_venta.setitem(ll_indi,'uso',is_uso)
					dw_venta.accepttext()
					ll_tot_reg				= ll_indi
				else
					ls_pasa					= 'S'
				end if
			next
		end if
		if ls_pasa='S' then
			ll_new							= dw_venta.insertrow(0)
			dw_venta.scrolltorow(ll_new)
			dw_venta.setitem(ll_new,'base',is_base)
			dw_venta.setitem(ll_new,'serie',is_serie)
			dw_venta.setitem(ll_new,'numero',il_numero)
			dw_venta.setitem(ll_new,'cod_servicio',ll_cod_serv)
			dw_venta.setitem(ll_new,'glosa_servicio',ls_glo_tipo_serv)
			dw_venta.setitem(ll_new,'cod_detalle',ll_cod_det)
			dw_venta.setitem(ll_new,'glosa_detalle',ls_glo_serv_det)
			dw_venta.setitem(ll_new,'cod_detalle_final',ll_cod_det_tot)
			dw_venta.setitem(ll_new,'glosa_detalle_final',ls_glo_det_final)
			dw_venta.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
			dw_venta.setitem(ll_new,'valor_producto',ldb_precio)
			dw_venta.setitem(ll_new,'porce_pago',ldb_porce)
			dw_venta.setitem(ll_new,'estado',ls_estado)
			dw_venta.setitem(ll_new,'fecha_vigencia',ldt_fec_vig)
			dw_venta.accepttext()
		end if
	end if
end if
wf_actua_porce()
end event

type cb_detalle from commandbutton within w_tipo_servicio_detalle_bk2
boolean visible = false
integer x = 1129
integer y = 1792
integer width = 274
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle"
end type

event clicked;long	ll_cod_servicio,ll_cod_detalle

dw_lista.accepttext()
ll_cod_servicio				= dw_lista.getitemnumber(il_row,'codigo_servicio')
ll_cod_detalle				= dw_lista.getitemnumber(il_row,'codigo_detalle')
if ll_cod_servicio<>6 then
else
end if

end event

type dw_lista from datawindow within w_tipo_servicio_detalle_bk2
integer x = 55
integer y = 236
integer width = 2587
integer height = 860
integer taborder = 20
string title = "none"
string dataobject = "dw_servicio_detalle_seleccion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_carga
long	ll_codigo,ll_cod_det,ll_tot_reg,ll_cod_serv,ll_tot_reg2,ll_indi2,ll_cod_serv_vta,ll_cod_det_vta,ll_cod_det_tot_vta,&
		ll_tot_reg3,ll_indi3,ll_cod_serv_det,ll_cod_det_det,ll_cod_det_tot_det

this.accepttext()
dw_tipo_servicio.accepttext()
il_row														= row
This.SelectRow(0, FALSE)
This.SelectRow(il_row, TRUE)
if row>0 then
	ll_codigo												= dw_tipo_servicio.getitemnumber(1,'cod_servicio')
	ll_cod_serv											= dw_lista.getitemnumber(il_row,'codigo_servicio')
	ll_cod_det											= dw_lista.getitemnumber(il_row,'codigo_detalle')
	dw_detalle.dataobject							= 'dw_lista_producto_final'
	dw_detalle.settransobject(sqlca)
	ll_tot_reg											= dw_detalle.retrieve(ll_cod_serv,ll_cod_det)
	if ll_codigo=99 then
		ll_tot_reg2										= dw_venta.rowcount()
		for ll_indi2=1 to ll_tot_reg2
			ll_cod_serv_vta								= dw_venta.getitemnumber(ll_indi2,'cod_servicio')
			ll_cod_det_vta								= dw_venta.getitemnumber(ll_indi2,'cod_detalle')
			ll_cod_det_tot_vta							= dw_venta.getitemnumber(ll_indi2,'cod_detalle_final')
			if ll_cod_serv=ll_cod_serv_vta and ll_cod_det=ll_cod_det_vta then
				ll_tot_reg3								= dw_detalle.rowcount()
				if ll_tot_reg3>0 then
					for ll_indi3=1 to ll_tot_reg3
						ll_cod_serv_det					= dw_detalle.getitemnumber(ll_indi3,'cod_servicio')
						ll_cod_det_det					= dw_detalle.getitemnumber(ll_indi3,'cod_detalle')
						ll_cod_det_tot_det				= dw_detalle.getitemnumber(ll_indi3,'cod_detalle_final')
						if ll_cod_serv_vta=ll_cod_serv_det and ll_cod_det_vta=ll_cod_det_det and ll_cod_det_tot_vta=ll_cod_det_tot_det then
							ls_carga						= 'S'
						else
							ls_carga						= 'N'
						end if
						if ls_carga='S' then
							dw_detalle.setitem(ll_indi3,'marca',1)
							dw_detalle.accepttext()
						end if
					next
				end if
			end if
		next
	else
		dw_lista.object.marca.protect				= 1
		dw_detalle.setitem(1,'marca',1)
		dw_detalle.accepttext()
		dw_detalle.object.marca.protect			= 1
	end if
end if
end event

event itemchanged;string	ls_columna,ls_elimina='N',ls_carga='N'
long	ll_codigo,ll_cod_det,ll_tot_reg,ll_cod_serv,ll_indi,ll_indi2,ll_tot_reg2,ll_cod_serv_vta,ll_cod_det_vta,&
		ll_cod_det_tot_vta,ll_tot_reg3,ll_indi3,ll_cod_serv_det,ll_cod_det_det,ll_cod_det_tot_det,ll_cta,ll_fila

this.accepttext()
dw_tipo_servicio.accepttext()
ll_codigo															= dw_tipo_servicio.getitemnumber(1,'cod_servicio')
if ll_codigo=99 then
	ls_columna													= dwo.name
	if row>0 then
		il_row														= row
		This.SelectRow(0, FALSE)
		This.SelectRow(il_row, TRUE)
		if ls_columna='marca' then
			ll_cod_serv											= dw_lista.getitemnumber(il_row,'codigo_servicio')
			ll_cod_det											= dw_lista.getitemnumber(il_row,'codigo_detalle')
			dw_detalle.dataobject							= 'dw_lista_producto_final'
			dw_detalle.settransobject(sqlca)
			ll_tot_reg											= dw_detalle.retrieve(ll_cod_serv,ll_cod_det)
			ll_fila 													= long(data)
			if ll_fila=0 then
				for ll_indi=1 to ll_tot_reg
					dw_detalle.setitem(ll_indi,'marca',0)
				next
				dw_lista.setitem(il_row,'valor',0)
				dw_lista.setitem(il_row,'marca',0)
				dw_lista.accepttext()
				ll_cta												= dw_lista.getitemnumber(1,'c_cta')
				if ll_cta>0 then
					wf_porc(ll_cod_det,ll_cta,'L')
				else
					dw_lista.setitem(il_row,'porce_descuento',0)	
				end if
				ll_tot_reg2										= dw_venta.rowcount()
				for ll_indi2=1 to ll_tot_reg2
					ll_cod_serv_vta								= dw_venta.getitemnumber(ll_indi2,'cod_servicio')
					ll_cod_det_vta								= dw_venta.getitemnumber(ll_indi2,'cod_detalle')
					if ll_cod_serv=ll_cod_serv_vta and ll_cod_det=ll_cod_det_vta then
						ls_elimina								= 'S'
						if ls_elimina='S' then
							dw_venta.deleterow(ll_indi2)
							dw_venta.accepttext()
							ll_tot_reg2							= dw_venta.rowcount()
							ll_indi2								= ll_indi2 - 1
						end if
					end if
				next
			end if
		end if
	end if
	wf_actua_porce()
end if
end event

type dw_tipo_servicio from datawindow within w_tipo_servicio_detalle_bk2
integer x = 78
integer y = 92
integer width = 923
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_tipo_servicio"
boolean border = false
boolean livescroll = true
end type

type cb_grabar from commandbutton within w_tipo_servicio_detalle_bk2
integer x = 55
integer y = 1784
integer width = 297
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_moneda,ls_gls_serv_c,ls_gls_det,ls_estado_c,ls_uso_c
long		ll_res,ll_cod_servicio,ll_serv_lista,ll_serv_vta,ll_cta,ll_tot_reg,&
			ll_cod_serv_c,ll_cod_det_c,ll_graba=0,ll_cant_benef,ll_tipo_benef,ll_capc_c,ll_tipo_benef_c
double	ldb_precio,ldb_sum_valor,ldb_porc_valor,ldb_porce,ldb_valor_c,ldb_por_pag_c
datetime	ldt_fec_cre_c,ldt_fec_vig_c	

SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 	"TASA";

dw_lista.accepttext()
ll_cod_servicio									= dw_tipo_servicio.getitemnumber(1,'cod_servicio')
ll_cant_benef									= dw_beneficiarios.getitemnumber(1,'cant_benef')
ll_tipo_benef									= dw_beneficiarios.getitemnumber(1,'tipo_benef')
ll_serv_lista										= dw_lista.getitemnumber(1,'codigo_servicio')
ldb_precio										= dw_lista.getitemnumber(1,'c_sum_valor')
//ldb_porce										= dw_lista.getitemnumber(1,'c_porce_valor')
ls_moneda										= dw_lista.getitemstring(1,'moneda')
ll_serv_vta										= dw_venta.getitemnumber(1,'cod_servicio')
ldb_sum_valor									= dw_venta.getitemnumber(1,'c_sum_valor') 
ldb_porc_valor									= dw_venta.getitemnumber(1,'c_porce_valor')
ll_tot_reg										= dw_venta.getitemnumber(1,'c_cta')
if ll_tot_reg>0 then
	if ll_serv_lista=ll_serv_vta then
		SELECT	count("PRODUCTO_VENTA_ASOCIADA"."BASE")  
		INTO 		:ll_cta  
		FROM 	"PRODUCTO_VENTA_ASOCIADA"  
		WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :is_base ) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :is_serie ) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :il_numero ) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'R' OR "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'D' )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ll_cta) and ll_cta>0 then
				messagebox("Advertencia","Existe Un Producto Asociado al Contrato en Revisión o Digitado: "+is_base+'-'+is_serie+'-'+string(il_numero))
				ll_res								= MessageBox("Grabar", 'Desea Grabar Modificaciones Servicio Funerario', Exclamation!, YesNo!, 2)
				if ll_res=1 then
					DECLARE x1 CURSOR FOR
					SELECT	"COD_SERVICIO",	"GLOSA_SERVICIO",	"COD_DETALLE",	"GLOSA_DETALLE",	"FECHA_CREA",	"VALOR_PRODUCTO",	"PORCE_PAGO",	"ESTADO",		"FECHA_VIGENCIA",	"USO",	"CAPACIDAD",	"TIPO_BENEFICIARIO"
					FROM		"PRODUCTO_VENTA_ASOCIADA"  
   					WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :is_base ) AND  
         						( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :is_serie ) AND  
         						( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :il_numero )
					USING	sqlca;
					open x1;
					if sqlca.sqlcode=0 then
						DO WHILE sqlca.sqlcode=0
						fetch x1 INTO	:ll_cod_serv_c,:ls_gls_serv_c,:ll_cod_det_c,:ls_gls_det,:ldt_fec_cre_c,:ldb_valor_c,:ldb_por_pag_c,:ls_estado_c,:ldt_fec_vig_c,:ls_uso_c,:ll_capc_c,:ll_tipo_benef_c;
							if not isnull(ll_cod_serv_c) and ll_cod_serv_c>0 and not isnull(ll_cod_det_c) and ll_cod_det_c>0 then
								INSERT INTO "LOG_PRODUCTO_VENTA_ASOCIADA"  
											( "BASE",		"SERIE",	"NUMERO",	"COD_SERVICIO",	"GLOSA_SERVICIO",	"COD_DETALLE",	"GLOSA_DETALLE",	"COD_DETALLE_FINAL",	"GLOSA_DETALLE_FINAL",	"FECHA_CREA",	"VALOR_PRODUCTO",	"PORCE_PAGO",	"ESTADO",		"FECHA_VIGENCIA",	"FECHA_ELIMINA",	"USUARIO_ELIMINA",	"USO",		"CAPACIDAD",	"TIPO_BENEFICIARIO" )  
								VALUES	( :is_base,	:is_serie,	:il_numero,	:ll_cod_serv_c,		:ls_gls_serv_c,			:ll_cod_det_c,		:ls_gls_det,				0,								'-',									:ldt_fec_cre_c,		:ldb_valor_c,			:ldb_por_pag_c,	:ls_estado_c,	:ldt_fec_vig_c,			:gdt_fec_sistema,	:gs_user,				:ls_uso_c,	:ll_capc_c,		:ll_tipo_benef_c )
								USING	Trans_1;
								if Trans_1.sqlcode=0 then
									commit using Trans_1;
									ll_graba++
								else
									rollback using Trans_1;
									messagebox("Error Grabar","Error Grabar Funeraria Detalle SQL: "+Trans_1.sqlerrtext)
								end if
							end if
							setnull(ll_cod_serv_c);setnull(ls_gls_serv_c);setnull(ll_cod_det_c);setnull(ls_gls_det);
							setnull(ldb_valor_c);setnull(ldb_por_pag_c);setnull(ls_estado_c);setnull(ldt_fec_vig_c)
						LOOP
					end if
					close x1;
					if ll_graba=ll_cta then
						wf_grabar(ls_moneda,ll_cod_servicio,ldb_precio,ll_cant_benef,ll_tipo_benef)
						DELETE FROM "PRODUCTO_VENTA_ASOCIADA"  
						WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :is_base ) AND  
									( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :is_serie ) AND  
									( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :il_numero ) AND
									( "PRODUCTO_VENTA_ASOCIADA"."FECHA_CREA" = :ldt_fec_cre_c)
						USING	Trans_2;
						if Trans_2.sqlcode=0 then
							commit using Trans_2;
						else
							rollback using Trans_2;
						end if
						close(w_tipo_servicio_detalle)
					end if
				end if
			else
				ll_res									= MessageBox("Grabar",'Desea Grabar Opciones Servicio Funerario', Exclamation!, YesNo!, 2)
				if ll_res=1 then
					wf_grabar(ls_moneda,ll_cod_servicio,ldb_precio,ll_cant_benef,ll_tipo_benef)
					close(w_tipo_servicio_detalle)
				end if
			end if
		else
			ll_res										= MessageBox("Grabar",'Desea Grabar Opciones Servicio Funerario', Exclamation!, YesNo!, 2)
			if ll_res=1 then
				wf_grabar(ls_moneda,ll_cod_servicio,ldb_precio,ll_cant_benef,ll_tipo_benef)
				close(w_tipo_servicio_detalle)
			end if
		end if
	end if
else
	messagebox("Advertencia","No Registra Datos Para Grabar")
end if
end event

type cb_cerrar from commandbutton within w_tipo_servicio_detalle_bk2
integer x = 2345
integer y = 1784
integer width = 297
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;long		ll_cod_serv,ll_tot_reg,ll_cod_serv_dig,ll_res,ll_cod_servicio,ll_nulo
double	ldb_precio,ldb_precio_dig

if is_tipo_infor='O' then
	close(w_tipo_servicio_detalle)
else
	setnull(ll_nulo)
	dw_lista.accepttext()
	gl_cod_servicio						= ll_nulo								
	ll_tot_reg							= dw_lista.rowcount()
	if ll_tot_reg>0 then
		ll_cod_serv						= dw_lista.getitemnumber(1,'codigo_servicio')
		ldb_precio						= dw_lista.getitemnumber(1,'c_sum_valor')
		if isvalid(w_ingresar_funeraria) then
			ll_cod_serv_dig				= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_codigo_servicio'))
			ldb_precio_dig				= double(w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio'))
		elseif isvalid(w_validar_promesa_operaciones) then
			ll_cod_serv_dig				= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'codigo_servicio'))
			ldb_precio_dig				= double(w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'precio_contrato'))
		end if
		if ll_cod_serv=ll_cod_serv_dig and ldb_precio=ldb_precio_dig then
			close(w_tipo_servicio_detalle)
		else
			ll_res							= MessageBox("Adventecia", 'Diferencia En Codigo de Servicio y Precio~r~n'+& 
																	'Desea Grabar Modificaciones Servicio Funerario', Exclamation!, YesNo!, 2)
			if ll_res=1 then
				cb_grabar.triggerevent(clicked!)
				close(w_tipo_servicio_detalle)
			else
				if isvalid(w_ingresar_funeraria) then
					w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',gl_cod_servicio)
				elseif isvalid(w_validar_promesa_operaciones) then
					w_validar_promesa_operaciones.dw_revision.setitem(1,'codigo_servicio',gl_cod_servicio)
				end if
				close(w_tipo_servicio_detalle)
			end if
		end if
	end if
end if
end event

type gb_1 from groupbox within w_tipo_servicio_detalle_bk2
integer x = 55
integer y = 20
integer width = 2587
integer height = 196
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Beneficiarios"
end type

