forward
global type w_mantencion_fromulario_solicitudes2 from window
end type
type dw_print from datawindow within w_mantencion_fromulario_solicitudes2
end type
type dw_obs from datawindow within w_mantencion_fromulario_solicitudes2
end type
type cb_cerrar from commandbutton within w_mantencion_fromulario_solicitudes2
end type
type dw_reporte from datawindow within w_mantencion_fromulario_solicitudes2
end type
type cb_imprimir from commandbutton within w_mantencion_fromulario_solicitudes2
end type
type dw_ingreso_coprop from datawindow within w_mantencion_fromulario_solicitudes2
end type
end forward

global type w_mantencion_fromulario_solicitudes2 from window
integer width = 3625
integer height = 2260
boolean titlebar = true
string title = "Mantención de Formularios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_print dw_print
dw_obs dw_obs
cb_cerrar cb_cerrar
dw_reporte dw_reporte
cb_imprimir cb_imprimir
dw_ingreso_coprop dw_ingreso_coprop
end type
global w_mantencion_fromulario_solicitudes2 w_mantencion_fromulario_solicitudes2

type variables
String	is_base,is_serie,is_tipo_sol,is_estado, is_estado_cadena
Long		il_correlativo,il_nro_cta, il_cta_pag_s,il_row_coprop
datetime	ld_fecha_prim, ld_fecha_ult
date		id_fecha_res
Double	il_numero
end variables

forward prototypes
public subroutine wf_titulo_serena_gral ()
public subroutine wf_titulo_stgo_cvta ()
public subroutine wf_titulo_stgo_gral ()
public subroutine wf_titulo_serena_cvta ()
end prototypes

public subroutine wf_titulo_serena_gral ();dw_reporte.object.t_21.text='INMOBILIARIA PARQUE DE LA SERENA SpA'
dw_reporte.object.t_22.text='R.U.T.: 96.835.970-3'
dw_reporte.object.t_32.text='Explotación Cementerio'
dw_reporte.object.t_23.text='Dirección: Ruta 41 Sector Aeropuerto Camino Vicuña - Fono: 27 18 01 - Fax: 27 18 58'
dw_reporte.object.t_28.text=''
if is_tipo_sol='1' or is_tipo_sol='2' or is_tipo_sol='3' then
	dw_reporte.object.t_nota.text='NOTA:  Este documento NO acredita que la petición ha sido aceptada por INMOBILIARIA PARQUE DE LA SERENA SpA'
end if
end subroutine

public subroutine wf_titulo_stgo_cvta ();dw_reporte.object.t_21.text='INMOBILIARIA PARQUE LA FLORIDA SpA'
dw_reporte.object.t_22.text='R.U.T.: 96.844.000-4'
dw_reporte.object.t_23.text='Explotación Cementerio'
dw_reporte.object.t_24.text='Estado Nº 360, 2º piso - Fono: 380 57 00'
dw_reporte.object.t_25.text='Fax: 380 58 06 - Santiago Centro.'
dw_reporte.object.t_26.text='Av. Camilo Henriquez Nº 4673 - Fono: 267 00 01'
dw_reporte.object.t_20.text='Fax: 267 01 46 - Puente Alto.'
dw_reporte.object.t_27.text='CEMENTERIO PARQUE EL PRADO'
dw_reporte.object.t_18.text='P.P. INMOBILIARIA PARQUE LA FLORIDA SpA'
dw_reporte.object.t_2.text	='En Santiago, a'
dw_reporte.object.t_3.text	= 'entre  INMOBILIARIA  PARQUE  LA  FLORIDA  SpA  y  don,'
dw_reporte.object.t_18.text= 'P.P.INMOBILIARIA PARQUE LA FLORIDA SpA'
end subroutine

public subroutine wf_titulo_stgo_gral ();dw_reporte.object.t_21.text='INMOBILIARIA PARQUE LA FLORIDA SpA'
dw_reporte.object.t_22.text='R.U.T.: 96.844.000-4'
dw_reporte.object.t_32.text='Explotación Cementerio'
dw_reporte.object.t_23.text='Casa Matriz:  Estado Nº 360, 2º piso - Fono: 380 57 00  Fax: 380 58 06 - Santiago Centro.'
dw_reporte.object.t_28.text='Sucursal: Av. Camilo Henriquez Nº 4673 - Fono: 267 00 01  Fax: 267 01 46 - Puente Alto.'
if is_tipo_sol='1' or is_tipo_sol='2' or is_tipo_sol='3' then
	dw_reporte.object.t_nota.text='NOTA:  Este documento NO acredita que la petición ha sido aceptada por INMOBILIARIA PARQUE LA FLORIDA SpA'
end if
end subroutine

public subroutine wf_titulo_serena_cvta ();dw_reporte.object.t_21.text		='INMOBILIARIA PARQUE DE LA SERENA SpA'
dw_reporte.object.t_22.text		='R.U.T.: 96.835.970-3'
dw_reporte.object.t_23.text		='Explotación Cementerio'
dw_reporte.object.t_24.text		='Ruta 41 Sector Aeropuerto Camino Vicuña - Fono: 27 18 01'
dw_reporte.object.t_25.text		='Fax: 27 18 58 - La Serena.'
dw_reporte.object.t_29.text		= ''
dw_reporte.object.t_26.text		= ''
dw_reporte.object.t_20.text		= ''
dw_reporte.object.t_27.text		= 'CEMENTERIO PARQUE LA FORESTA'
dw_reporte.object.t_18.text		= 'P.P. INMOBILIARIA PARQUE DE LA SERENA SpA'
dw_reporte.object.t_2.text		= 'En Serena, a'
dw_reporte.object.t_3.text		= 'entre  INMOBILIARIA  PARQUE  LA  FORESTA SpA y  don,'
dw_reporte.object.t_18.text		= 'P.P.INMOBILIARIA PARQUE LA FORESTA SpA'
end subroutine

on w_mantencion_fromulario_solicitudes2.create
this.dw_print=create dw_print
this.dw_obs=create dw_obs
this.cb_cerrar=create cb_cerrar
this.dw_reporte=create dw_reporte
this.cb_imprimir=create cb_imprimir
this.dw_ingreso_coprop=create dw_ingreso_coprop
this.Control[]={this.dw_print,&
this.dw_obs,&
this.cb_cerrar,&
this.dw_reporte,&
this.cb_imprimir,&
this.dw_ingreso_coprop}
end on

on w_mantencion_fromulario_solicitudes2.destroy
destroy(this.dw_print)
destroy(this.dw_obs)
destroy(this.cb_cerrar)
destroy(this.dw_reporte)
destroy(this.cb_imprimir)
destroy(this.dw_ingreso_coprop)
end on

event open;String	ls_descrip

gf_centrar(w_mantencion_fromulario_solicitudes2)
dw_ingreso_coprop.visible	= false
is_base 							= trim(substr(1,1,Message.StringParm))
is_serie							= trim(substr(1,2,Message.StringParm))
il_numero						= Double(trim(substr(1,3,Message.StringParm)))
is_tipo_sol						= trim(substr(1,4,Message.StringParm))
il_correlativo					= long(trim(substr(1,5,Message.StringParm)))
is_estado						= trim(substr(1,6,Message.StringParm))
//is_estado_cadena			= trim(substr(1,7,Message.StringParm))
//id_fecha_res					= date(substr(1,8,Message.StringParm))
dw_obs.settransobject(sqlca)
dw_print.settransobject(sqlca)
SELECT "SOLICITUDES"."DESCRIPCION"  
INTO :ls_descrip  
FROM "SOLICITUDES"  
WHERE "SOLICITUDES"."CODIGO_SOLICITUD" = :is_tipo_sol   
Using	sqlca;
if sqlca.sqlcode=0 then
	w_mantencion_fromulario_solicitudes2.title	= ls_descrip
else
	w_mantencion_fromulario_solicitudes2.title	= 'Solicitudes'
end if
CHOOSE CASE is_tipo_sol
	CASE '1' // resciliacion por parte del cliente
		dw_reporte.dataobject	= 'dw_form_resciliacion_por_parte_cliente2'
	CASE '2' // resciliacion por reprogramacion
		dw_reporte.dataobject	= 'dw_form_resciliacion_por_reprogramacion2'
	CASE '3' // reactivacion
		dw_reporte.dataobject	= 'dw_form_reactivacion_ctto_resuelto2'
	CASE '4' // seguro desgravamen
		dw_reporte.dataobject	= 'dw_formulario_seguro_desgravamen2'
	CASE '5' // seguro desgravamen
		dw_reporte.dataobject	= 'dw_formulario_repacta_o_compraventa2'
	CASE '6' // titulo de dominio
		dw_reporte.dataobject	= 'dw_form_titulo_de_dominio2'
	CASE '7' // contrato definitivo
		dw_reporte.dataobject	= 'dw_form_contrato_definitivo2'
	CASE '8' // ENTREGA PAGARE
		dw_reporte.dataobject	= 'dw_form_entrega_de_pagare2'
	CASE '10' // TRANSFERENCIA
		dw_reporte.dataobject	= 'dw_form_transferencia2'
	CASE '11' // RESOLUCION
		dw_reporte.dataobject	= 'dw_form_solicitud_resolucion2'
	CASE '12'
		dw_reporte.dataobject	= 'dw_form_modifica_antece_cliente2'
	CASE '13'
		dw_reporte.dataobject	= 'dw_form_cambio_estado2'
	CASE '14'
		dw_reporte.dataobject	= 'dw_form_cambio_estado_titular2'
	CASE '15'
		dw_reporte.dataobject	= 'dw_form_seguro2'
	CASE '16'
		dw_reporte.dataobject	= 'dw_form_novacion2'
	CASE '17'
		dw_reporte.dataobject	= 'dw_form_copropietario_promesa2'
		dw_ingreso_coprop.settransobject(sqlca)
		dw_ingreso_coprop.visible							= true
		dw_ingreso_coprop.retrieve(is_base,is_serie,il_numero,il_correlativo)
	CASE '18'
		dw_reporte.dataobject	= 'dw_form_ultima_voluntad2'
	CASE '19'
		dw_reporte.dataobject	= 'dw_form_posesion_efectiva_2'
	CASE '20'
		dw_reporte.dataobject	= 'dw_form_mandato_pac2'
	CASE '21'
		dw_reporte.dataobject	= 'dw_form_mandato_pat2'	
	CASE '22'
		dw_reporte.dataobject	= 'dw_formulario_seguro_fallecimiento2'	
	CASE '23'
		dw_reporte.dataobject	= 'dw_form_cambio_en_demanda_2'	
	CASE '24'
		dw_reporte.dataobject	= 'dw_formulario_bono_fraternal_2'	
	CASE '25'
		dw_reporte.dataobject	= 'dw_formulario_mantencion_perpetua_2'		
	CASE ELSE
		messagebox("Advertencia","Falta Definir Formulario Solicitud")
		close(w_mantencion_fromulario_solicitudes2)
END CHOOSE
dw_reporte.settransobject(sqlca)
if is_estado="M" then
	if dw_reporte.dataobject='dw_form_modifica_antece_cliente2' then
		dw_reporte.retrieve(il_numero,il_correlativo)
		dw_reporte.setitem(1,'sw_ver',0)
//		dw_reporte.'sol_estatus_observacion'
	else
		dw_reporte.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
	end if
	dw_obs.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)
end if
dw_reporte.accepttext()
dw_reporte.setfocus()
gs_ventana					= 'w_mantencion_fromulario_solicitudes2'
f_valida_objeto()
end event

type dw_print from datawindow within w_mantencion_fromulario_solicitudes2
boolean visible = false
integer x = 475
integer y = 2028
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_form_copropietario_promesa_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_obs from datawindow within w_mantencion_fromulario_solicitudes2
integer x = 37
integer y = 1752
integer width = 3538
integer height = 264
integer taborder = 20
string title = "none"
string dataobject = "dw_muestra_obs"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar from commandbutton within w_mantencion_fromulario_solicitudes2
integer x = 3237
integer y = 2040
integer width = 329
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mantencion_fromulario_solicitudes2)
end event

type dw_reporte from datawindow within w_mantencion_fromulario_solicitudes2
integer x = 32
integer y = 28
integer width = 3534
integer height = 1692
integer taborder = 10
string dataobject = "dw_formulario_mantencion_perpetua_2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;return(1)
end event

event clicked;string	ls_columna,ls_string,ls_dv,ls_estado
Long		ll_rut
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'b_cliente'
		if dw_reporte.dataobject='dw_form_transferencia2' then
			ll_rut		= this.getitemnumber(1,'sol_transferencia_rut_titular')
			ls_dv			= this.getitemstring(1,'sol_transferencia_dv')
			ls_estado	= this.getitemstring(1,'sol_estatus_estado_reg')
			if ll_rut>0 then
				ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(ll_rut)+'~t'+string(il_correlativo)+'~t'+ls_dv+'~t'+'N'+'~t'+ls_estado
				openwithparm(w_ingreso_nuevo_beneficiario,ls_string)
			else
				messagebox("Advertencia","Cliente Original Inválido")
			end if
		elseif dw_reporte.dataobject='dw_form_novacion2' then
			ll_rut		= this.getitemnumber(1,'sol_novacion_rut_titular')
			ls_dv			= this.getitemstring(1,'sol_novacion_dv')
			ls_estado	= this.getitemstring(1,'sol_estatus_estado_reg')
			if ll_rut>0 then
				ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(ll_rut)+'~t'+string(il_correlativo)+'~t'+ls_dv+'~t'+'N'+'~t'+ls_estado
				openwithparm(w_ingreso_nuevo_beneficiario,ls_string)
			else
				messagebox("Advertencia","Cliente Original Inválido")
			end if
		elseif dw_reporte.dataobject='dw_form_posesion_efectiva_2' then
			ll_rut		= this.getitemnumber(1,'sol_pos_efec_rut_titular')
			ls_dv			= this.getitemstring(1,'sol_pos_efec_dv')
			ls_estado	= this.getitemstring(1,'sol_estatus_estado_reg')
			if ll_rut>0 then
				ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+string(ll_rut)+'~t'+string(il_correlativo)+'~t'+ls_dv+'~t'+'N'+'~t'+ls_estado
				openwithparm(w_ingreso_nuevo_beneficiario2,ls_string)
			else
				messagebox("Advertencia","Cliente Original Inválido")
			end if
		end if
END CHOOSE
end event

type cb_imprimir from commandbutton within w_mantencion_fromulario_solicitudes2
integer x = 32
integer y = 2040
integer width = 329
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_reporte.dataobject<>'dw_form_transferencia2' and dw_reporte.dataobject<>'dw_form_novacion2' and dw_reporte.dataobject<>'dw_form_copropietario_promesa2' and &
	dw_reporte.dataobject<>'dw_form_resciliacion_por_reprogramacion' then
	if dw_reporte.dataobject='dw_formulario_modifica_antece_cliente' then
		dw_reporte.setitem(1,'sw_ver',1)
		dw_reporte.accepttext()
	end if
	f_Print( dw_reporte )
	if dw_reporte.dataobject='dw_formulario_modifica_antece_cliente' then
		dw_reporte.setitem(1,'sw_ver',0)
		dw_reporte.accepttext()
	end if
else
	if dw_reporte.dataobject='dw_form_transferencia2' then
		dw_print.dataobject	= 'dwe_imprimir_transferencia'
		dw_print.settransobject(sqlca)
	elseif dw_reporte.dataobject='dw_form_novacion2' then
		dw_print.dataobject	= 'dwe_imprimir_novacion'
		dw_print.settransobject(sqlca)
	elseif dw_reporte.dataobject='dw_form_copropietario_promesa2' then
		dw_print.dataobject	= 'dw_form_copropietario_promesa_print'
		dw_print.settransobject(sqlca)
	elseif dw_reporte.dataobject='dw_form_resciliacion_por_reprogramacion' then
		dw_print.dataobject	= 'dw_print_resciliacion_por_reprogramacion'
		dw_print.settransobject(sqlca)
	end if
	if dw_print.retrieve(is_base,is_serie,il_numero,il_correlativo,is_tipo_sol)>0 then
		f_Print( dw_print )
		if dw_reporte.dataobject='dw_form_resciliacion_por_reprogramacion' then dw_reporte.print()
	end if
end if
end event

type dw_ingreso_coprop from datawindow within w_mantencion_fromulario_solicitudes2
boolean visible = false
integer x = 32
integer y = 1404
integer width = 3534
integer height = 596
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_form_cambio_en_demanda_2"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_pasa
Long		ll_new,ll_resp,ll_indi,ll_tot_reg,ll_rut

ls_columna						= dwo.name
if row>0 then
	il_row_coprop				= row
	dw_ingreso_coprop.SelectRow(0, FALSE)
	dw_ingreso_coprop.SelectRow(il_row_coprop, TRUE)
else
	CHOOSE CASE ls_columna
		CASE 't_insertar'
			ls_pasa				= 'S'
			ll_tot_reg			= dw_ingreso_coprop.rowcount()
			if ll_tot_reg=5 then
				messagebox("Advertencia","Solo es Posible Ingresar 5 Copropietario")
			else
				if ll_tot_reg>0 then
					for ll_indi=1 to ll_tot_reg
						ll_rut		= dw_ingreso_coprop.getitemnumber(ll_indi,'rut_coprop')
						ls_dv			= dw_ingreso_coprop.getitemstring(ll_indi,'dv_coprop')
						ls_nom		= dw_ingreso_coprop.getitemstring(ll_indi,'nombres_coprop')
						ls_ap_pat	= dw_ingreso_coprop.getitemstring(ll_indi,'ap_pat_coprop')
						ls_ap_mat	= dw_ingreso_coprop.getitemstring(ll_indi,'ap_mat_coprop')
						if ll_rut=0 or isnull(ll_rut) then
							messagebox("Advertencia","Debe Ingresar Rut en Fila Nº "+string(ll_indi))
							dw_ingreso_coprop.scrolltorow(ll_indi)
							dw_ingreso_coprop.setcolumn('rut_coprop')
							ls_pasa	= 'N'
						elseif ls_dv='' or isnull(ls_dv) then
							messagebox("Advertencia","Debe Ingresar Dv en Fila Nº "+string(ll_indi))
							dw_ingreso_coprop.scrolltorow(ll_indi)
							dw_ingreso_coprop.setcolumn('dv_coprop')
							ls_pasa	= 'N'
						elseif ls_nom='' or isnull(ls_nom) then
							messagebox("Advertencia","Debe Ingresar Nombre(s) en Fila Nº "+string(ll_indi))
							dw_ingreso_coprop.scrolltorow(ll_indi)
							dw_ingreso_coprop.setcolumn('nombres_coprop')
							ls_pasa	= 'N'
						elseif ls_ap_pat='' or isnull(ls_ap_pat) then
							messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila Nº "+string(ll_indi))
							dw_ingreso_coprop.scrolltorow(ll_indi)
							dw_ingreso_coprop.setcolumn('ap_pat_coprop')
							ls_pasa	= 'N'
						elseif ls_ap_mat='' or isnull(ls_ap_mat) then
							messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila Nº "+string(ll_indi))
							dw_ingreso_coprop.scrolltorow(ll_indi)
							dw_ingreso_coprop.setcolumn('ap_mat_coprop')
							ls_pasa	= 'N'
						end if
					next
				end if
				if ls_pasa='S' then
					ll_new				= dw_ingreso_coprop.insertrow(0)
					dw_ingreso_coprop.scrolltorow(ll_new)
					dw_ingreso_coprop.setitem(ll_new,'base',is_base)
					dw_ingreso_coprop.setitem(ll_new,'serie',is_serie)
					dw_ingreso_coprop.setitem(ll_new,'numero',il_numero)
					dw_ingreso_coprop.setitem(ll_new,'correlativo',il_correlativo)
					dw_ingreso_coprop.setitem(ll_new,'estado_reg','A')
					dw_ingreso_coprop.setcolumn('rut_coprop')
				end if
			end if
			
		CASE 't_eliminar'
			if dw_ingreso_coprop.rowcount()>0 then
				if il_row_coprop>0 then
					ll_resp	= messagebox("Eliminar","Está seguro de Eliminar CoPropietario",Exclamation!,YesNo!,2)
					if ll_resp=1 then
						dw_ingreso_coprop.deleterow(il_row_coprop)
						messagebox("Advertencia","Recuerde Grabar antes de Salir")
						if dw_ingreso_coprop.rowcount()>0 then
							dw_ingreso_coprop.scrolltorow(1)
							il_row_coprop	= 1
						end if
					end if
				end if
			end if
	END CHOOSE

end if
end event

event itemchanged;String	ls_columna,ls_dv_co
Long		ll_rut_co

dw_ingreso_coprop.accepttext()
ls_columna		= dwo.name
il_row_coprop	= row
if ls_columna='rut_coprop' then
	ll_rut_co	= dw_ingreso_coprop.getitemnumber(il_row_coprop,'rut_coprop')
	ls_dv_co		= dw_ingreso_coprop.getitemstring(il_row_coprop,'dv_coprop')
	if ll_rut_co>0 and isnull(ls_dv_co) or ls_dv_co<>'' then
		if String(ls_dv_co) <> String(gf_obtener_dv(ll_rut_co)) then
			messagebox('Error','El Rut no es valido',stopsign!)
			dw_ingreso_coprop.SetItem(il_row_coprop, "rut_coprop",0)
			dw_ingreso_coprop.SetItem(il_row_coprop, "dv_coprop",'')
			dw_ingreso_coprop.setfocus()
			dw_ingreso_coprop.setcolumn('rut_coprop')
		else
			dw_ingreso_coprop.setfocus()
			dw_ingreso_coprop.setcolumn('dv_coprop')
		end if
		dw_ingreso_coprop.accepttext()
	end if
elseif ls_columna='dv_coprop' then
	ll_rut_co	= dw_ingreso_coprop.getitemnumber(il_row_coprop,'rut_coprop')
	ls_dv_co		= dw_ingreso_coprop.getitemstring(il_row_coprop,'dv_coprop')
	if ll_rut_co>0 and isnull(ls_dv_co) or ls_dv_co<>'' then
		if String(ls_dv_co) <> String(gf_obtener_dv(ll_rut_co)) then
			messagebox('Error','El Rut no es valido',stopsign!)
			dw_ingreso_coprop.SetItem(il_row_coprop, "rut_coprop",0)
			dw_ingreso_coprop.SetItem(il_row_coprop, "dv_coprop",'')
			dw_ingreso_coprop.setfocus()
			dw_ingreso_coprop.setcolumn('rut_coprop')
		else
			dw_ingreso_coprop.setfocus()
			dw_ingreso_coprop.setcolumn('nombres_coprop')
		end if
		dw_ingreso_coprop.accepttext()
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row_coprop	= getrow()
	dw_ingreso_coprop.SelectRow(0, FALSE)
	dw_ingreso_coprop.SelectRow(il_row_coprop, TRUE)
end if
end event

