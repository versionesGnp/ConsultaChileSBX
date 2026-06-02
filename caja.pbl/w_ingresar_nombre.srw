forward
global type w_ingresar_nombre from window
end type
type dw_ingreso from datawindow within w_ingresar_nombre
end type
type cb_cancelar from commandbutton within w_ingresar_nombre
end type
type cb_aceptar from commandbutton within w_ingresar_nombre
end type
end forward

global type w_ingresar_nombre from window
integer x = 832
integer y = 360
integer width = 2213
integer height = 1744
boolean titlebar = true
string title = "Antecedentes Cliente en Rezago"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
dw_ingreso dw_ingreso
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
end type
global w_ingresar_nombre w_ingresar_nombre

type variables
Date	idt_fecha_hoy
end variables

on w_ingresar_nombre.create
this.dw_ingreso=create dw_ingreso
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.Control[]={this.dw_ingreso,&
this.cb_cancelar,&
this.cb_aceptar}
end on

on w_ingresar_nombre.destroy
destroy(this.dw_ingreso)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
end on

event open;Long		ll_new,ll_nulo
String		ls_nulo,ls_ciudad,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direccion,ls_comuna,ls_telefono,ls_cliente_sap  

Connect using Trans_1;
Connect using Trans_7;
idt_fecha_hoy		= date(gdt_fec_sistema)
SetNull(ll_nulo);SetNull(ls_nulo)
gf_centrar(w_ingresar_nombre)
dw_ingreso.SetTransObject(SQLCA)
dw_ingreso.getchild('comuna_part',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
SELECT DISTINCT	"CLIENTE_REZAGO"."DV",   	"CLIENTE_REZAGO"."NOMBRE",   	"CLIENTE_REZAGO"."AP_PATERNO",   	"CLIENTE_REZAGO"."AP_MATERNO",   	"CLIENTE_REZAGO"."DIRECCION_PART",   	"CLIENTE_REZAGO"."COMUNA_PART",   	"CLIENTE_REZAGO"."CIUDAD_PART",   	"CLIENTE_REZAGO"."TELEFONO_PART",   	"CLIENTE_REZAGO"."NRO_CLIENTE_SAP"  
INTO 					:ls_dv,   							:ls_nombre,   							:ls_ap_pat,   									:ls_ap_mat,   									:ls_direccion,   										:ls_comuna,   									:ls_ciudad,   									:ls_telefono,   										:ls_cliente_sap  
FROM 	"CLIENTE_REZAGO"  
WHERE 	"CLIENTE_REZAGO"."RUT" = :gi_rut AND
			"CLIENTE_REZAGO"."FECHA_CREA" = ( SELECT MAX("CLIENTE_REZAGO"."FECHA_CREA") FROM "CLIENTE_REZAGO" WHERE "CLIENTE_REZAGO"."RUT" = :gi_rut) 
USING 	sqlca;
if sqlca.sqlcode <> 0 then
	ls_nombre	= ''
	ls_ap_pat	= ''
	ls_ap_mat	= ''
	ls_direccion	= ''
	ls_comuna	= '0'
	ls_ciudad		= '0'
	ls_telefono	= ''  
end if
ll_new	= dw_ingreso.insertrow(0)
dw_ingreso.setitem(ll_new,'fecha_crea',idt_fecha_hoy)
dw_ingreso.setitem(ll_new,'usuario',gs_user)
dw_ingreso.setitem(ll_new,'rut',gi_rut)
dw_ingreso.setitem(ll_new,'dv',string(gf_obtener_dv(gi_rut)))
if gl_cod_parque > 0 then dw_ingreso.setitem(ll_new,'cod_parque',gl_cod_parque)
dw_ingreso.setitem(ll_new,'estado_rut',1)
dw_ingreso.setitem(ll_new,'nombre',ls_nombre)
dw_ingreso.setitem(ll_new,'ap_paterno',ls_ap_pat)
dw_ingreso.setitem(ll_new,'ap_materno',ls_ap_mat)
dw_ingreso.setitem(ll_new,'telefono_part',ls_telefono)
dw_ingreso.setitem(ll_new,'direccion_part',ls_direccion)
dw_ingreso.setitem(ll_new,'ciudad_part',ls_ciudad)
dw_ingreso.setitem(ll_new,'comuna_part',ls_comuna)
dw_ingreso.setitem(ll_new,'base','')
dw_ingreso.setitem(ll_new,'serie','')
dw_ingreso.setitem(ll_new,'numero',0)
dw_ingreso.setitem(dw_ingreso.getrow(),'estado_rut',1)

idw_detalle.retrieve(ls_ciudad)

dw_ingreso.accepttext()
dw_ingreso.setfocus()
dw_ingreso.setcolumn('rut')
end event

event close;//Disconnect using Trans_1;
//Disconnect using Trans_2;
end event

type dw_ingreso from datawindow within w_ingresar_nombre
integer x = 37
integer y = 36
integer width = 2121
integer height = 1428
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_cliente_rezago"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string		ls_columna,ls_ciudad,ls_dv,ls_base,ls_serie,ls_dv_aux,ls_estado,ls_base_aux
Long		ll_rut,ll_cod_parque,ll_tot_reg,ll_fila,ll_fila_f,ll_tot_reg_ci
Double	ll_numero,ll_monto_total

This.accepttext()
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'ciudad_part'
		ls_ciudad	= dw_ingreso.getitemstring(1,'ciudad_part')
		if not isnull(ls_ciudad) and ls_ciudad<>'' then
			dw_ingreso.getchild('comuna_part',idw_detalle)
			idw_detalle.settransobject(sqlca)
			idw_detalle.retrieve(ls_ciudad)
		end if
	CASE 'dv'
		ls_dv			= dw_ingreso.getitemstring(1,'dv')
		if String(ls_dv) <> String(gf_obtener_dv(gi_rut)) then
			messagebox('Error','El Rut no es valido',stopsign!)
			cb_aceptar.enabled	= false
			dw_ingreso.SetItem(1, "estado_rut",0)
			dw_ingreso.setfocus()
			dw_ingreso.setcolumn('dv')
		else
			cb_aceptar.enabled	= true
			dw_ingreso.SetItem(1, "estado_rut",1)
			dw_ingreso.setcolumn('nombre')
		end if
END CHOOSE
if ls_columna='base' or ls_columna='serie' or ls_columna='numero' then
	ls_base					= dw_ingreso.getitemstring(1,'base')
	if isvalid(w_ingreso2) then
		if w_ingreso2.tab_ingreso.SelectedTab=2 then
			ll_tot_reg_ci		= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
			if ls_base='M' and gs_rezago='S' and ll_tot_reg_ci > 0 and (isnull(gl_sw_mp) or gl_sw_mp = 1 or gl_codigo_mp = 0 or isnull(gl_codigo_mp)) then
				messagebox("Advertencia","No Seleccionó Codigo Servicio Multiproducto")
				dw_ingreso.setitem(1,'numero',0)
				dw_ingreso.setitem(1,'base','')
				dw_ingreso.setitem(1,'serie','')
				dw_ingreso.accepttext()
				dw_ingreso.setfocus()
				dw_ingreso.setcolumn('base')
			end if
		elseif w_ingreso2.tab_ingreso.SelectedTab=3 then
			ll_tot_reg		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
			if ll_tot_reg > 0 then 
				if ls_base = 'L' or ls_base='F' or ls_base='G' then
					ll_fila 		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='D'", 1, ll_tot_reg)
					if ll_fila=0 and (gs_tipo_cobro='BA' or gs_tipo_cobro='FA') then
						messagebox("Advertencia","Contrato Debe Considerar Item IVA ")
						dw_ingreso.setitem(1,'numero',0)
						dw_ingreso.setitem(1,'base','')
						dw_ingreso.setitem(1,'serie','')
						dw_ingreso.accepttext()
						dw_ingreso.setfocus()
						dw_ingreso.setcolumn('base')
					elseif ls_base='F' or ls_base='G' then
						ll_monto_total		= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'c_total')
						if gs_tipo_cobro = 'BE' and ll_monto_total > 1 then
							if ls_base='F' then
								messagebox("Advertencia","Contrato FUNERARIA debe Generar Boleta Afecta")
							elseif ls_base='G' then
								messagebox("Advertencia","Contrato CREMATORIO debe Generar Boleta Afecta")
							end if
							dw_ingreso.setitem(1,'numero',0)
							dw_ingreso.setitem(1,'base','')
							dw_ingreso.setitem(1,'serie','')
							dw_ingreso.accepttext()
							dw_ingreso.setfocus()
							dw_ingreso.setcolumn('base')
						end if
					end if
				elseif ls_base <> 'L' then
					ll_fila_f	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='F' or tipo_cob ='M' ", 1, ll_tot_reg)
					if ll_fila_f > 0 then
						ll_fila 		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='D'", 1, ll_tot_reg)
						if ll_fila = 0 and (gs_tipo_cobro='BA' or gs_tipo_cobro='FA') then
							messagebox("Advertencia","Contrato Debe Considerar Item IVA ")
							dw_ingreso.setitem(1,'numero',0)
							dw_ingreso.setitem(1,'base','')
							dw_ingreso.setitem(1,'serie','')
							dw_ingreso.accepttext()
							dw_ingreso.setfocus()
							dw_ingreso.setcolumn('base')
						end if
					else
						ll_fila 		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='D'", 1, ll_tot_reg)
						if ll_fila > 0 and gs_tipo_cobro<>'BA' and gs_tipo_cobro<>'FA' then
							messagebox("Advertencia","Contrato NO Debe Considerar Item IVA ")
							dw_ingreso.setitem(1,'numero',0)
							dw_ingreso.setitem(1,'base','')
							dw_ingreso.setitem(1,'serie','')
							dw_ingreso.accepttext()
							dw_ingreso.setfocus()
							dw_ingreso.setcolumn('base')
						elseif ls_base='F' or ls_base='G' then
							ll_monto_total		= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'c_total')
							if gs_tipo_cobro = 'BE' and ll_monto_total > 1 then
								if ls_base='F' then
									messagebox("Advertencia","Contrato FUNERARIA debe Generar Boleta Afecta")
								elseif ls_base='G' then
									messagebox("Advertencia","Contrato CREMATORIO debe Generar Boleta Afecta")
								end if
								dw_ingreso.setitem(1,'numero',0)
								dw_ingreso.setitem(1,'base','')
								dw_ingreso.setitem(1,'serie','')
								dw_ingreso.accepttext()
								dw_ingreso.setfocus()
								dw_ingreso.setcolumn('base')
							end if
						end if
					end if
				end if
			end if
		end if
	end if
	ls_serie			= dw_ingreso.getitemstring(1,'serie')
	ll_numero		= dw_ingreso.getitemnumber(1,'numero')
	ll_cod_parque	= dw_ingreso.getitemnumber(1,'cod_parque')
	if ls_base = 'B' and ls_columna='base' and (w_ingreso2.tab_ingreso.SelectedTab=2 or w_ingreso2.tab_ingreso.SelectedTab=3) then
		messagebox("Advertencia","Recuerde No es Posible generar Factura a este Tipo Producto")
		dw_ingreso.setitem(1,'numero',0)
		dw_ingreso.setitem(1,'base','')
		dw_ingreso.setitem(1,'serie','')
		dw_ingreso.accepttext()
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('base')
	else
		if not isnull(ls_base) and not isnull(ls_serie) and ll_numero>0 then
			SELECT	"CADENA"."RUT",  
						"CLIENTE"."DV",
						"CADENA"."ESTADO"
			INTO 		:ll_rut,
						:ls_dv_aux,
						:ls_estado
			FROM 	"CADENA",
						"CLIENTE"
			WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) AND  
					 ( "CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) AND
					 ( "CADENA"."COD_PARQUE" = :ll_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if w_ingreso2.tab_ingreso.SelectedTab=2 then
					ll_tot_reg	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
					if ll_tot_reg > 0 then ll_fila = w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob ='E' or tipo_cob='F' or tipo_cob='A'", 1, ll_tot_reg)
				elseif w_ingreso2.tab_ingreso.SelectedTab=3 then
					ll_tot_reg	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
					if ll_tot_reg > 0 then ll_fila = w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='E' or tipo_cob='F' or tipo_cob='A'", 1, ll_tot_reg)
				end if
				if ls_estado = 'V' or ls_estado = 'C' or ls_estado = 'S' or ls_estado='T' then
					messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+" Ya Existe está en Estado '"+ls_estado+"', el R.U.T. del Cliente Asociado es: "+string(ll_rut,"###,###,###,###")+'-'+ls_dv_aux)
//					dw_ingreso.setitem(1,'numero',0)
//					dw_ingreso.accepttext()
//					dw_ingreso.setfocus()
//					dw_ingreso.setcolumn('numero')
				elseif ll_fila > 0 then
					messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+" Ya Existe está en Estado '"+ls_estado+"', el R.U.T. del Cliente Asociado es: "+string(ll_rut,"###,###,###,###")+'-'+ls_dv_aux+'   ( No es posible Ingresar Pago E-Cuota, F-Mantención o A-Pie )')
					dw_ingreso.setitem(1,'numero',0)
					dw_ingreso.accepttext()
					dw_ingreso.setfocus()
					dw_ingreso.setcolumn('numero')
				end if
			else
				if ls_base='L' then
					SELECT	"CD_FOLIO"."BASE"  
					INTO 		:ls_base_aux  
					FROM 	"CD_FOLIO"  
					WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
							 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
							 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
					USING		sqlca;
				else
					SELECT	"CD_FOLIO"."BASE"  
					INTO 		:ls_base_aux  
					FROM 	"CD_FOLIO"  
					WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
							 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
							 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
					USING		sqlca;
				end if
				if sqlca.sqlcode <> 0 then
					messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+" No Existe en Control Documentario")
					dw_ingreso.setitem(1,'numero',0)
					dw_ingreso.accepttext()
					dw_ingreso.setfocus()
					dw_ingreso.setcolumn('numero')
				end if
			end if
		end if
	end if
end if
This.accepttext()
end event

event itemfocuschanged;String		ls_base,ls_nulo,ls_serie,ls_base_aux,ls_dv_aux,ls_estado
Long		ll_nulo,ll_cod_parque,ll_rut,ll_tot_reg,ll_fila,ll_fila_f,ll_monto_total,ll_tot_reg_ci
Double	ll_numero

this.accepttext()
Setnull(ls_nulo);Setnull(ll_nulo)
//ls_base			= dw_ingreso.getitemstring(1,'base')
//if ls_base  'F' and (w_ingreso2.tab_ingreso.SelectedTab=2 or w_ingreso2.tab_ingreso.SelectedTab=3) then
//	dw_ingreso.setitem(1,'base',ls_nulo)
//	dw_ingreso.setitem(1,'serie',ls_nulo)
//	dw_ingreso.setitem(1,'numero',ll_nulo)
//	dw_ingreso.Setcolumn('base')
//	dw_ingreso.accepttext()
//end if
ls_base			= dw_ingreso.getitemstring(1,'base')
if w_ingreso2.tab_ingreso.SelectedTab=2 then
	ll_tot_reg_ci		= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
	if ls_base='M' and gs_rezago='S' and ll_tot_reg_ci > 0 and (isnull(gl_sw_mp) or gl_sw_mp = 1 or gl_codigo_mp = 0 or isnull(gl_codigo_mp)) then
//		messagebox("Advertencia","No Seleccionó Codigo Servicio Multiproducto")
		dw_ingreso.setitem(1,'numero',0)
		dw_ingreso.setitem(1,'base','')
		dw_ingreso.setitem(1,'serie','')
		dw_ingreso.accepttext()
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('base')
	end if
end if

ll_tot_reg		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
if ll_tot_reg > 0 then 
	if ls_base='L' then
		ll_fila 		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='D'", 1, ll_tot_reg)
		if ll_fila=0 and (gs_tipo_cobro='BA' or gs_tipo_cobro='FA') then
			dw_ingreso.setitem(1,'numero',0)
			dw_ingreso.setitem(1,'base','')
			dw_ingreso.setitem(1,'serie','')
			dw_ingreso.accepttext()
			dw_ingreso.setfocus()
			dw_ingreso.setcolumn('base')
		end if
		
	elseif ls_base <> 'L' then
		ll_fila_f	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='F' or tipo_cob ='M' ", 1, ll_tot_reg)
		if ll_fila_f > 0 and (gs_tipo_cobro='BA' or gs_tipo_cobro='FA') then
			ll_fila 		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='D'", 1, ll_tot_reg)
			if ll_fila=0 and (gs_tipo_cobro='BA' or gs_tipo_cobro='FA') then
				dw_ingreso.setitem(1,'numero',0)
				dw_ingreso.setitem(1,'base','')
				dw_ingreso.setitem(1,'serie','')
				dw_ingreso.accepttext()
				dw_ingreso.setfocus()
				dw_ingreso.setcolumn('base')
			end if
		else
			ll_fila 		= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='D'", 1, ll_tot_reg)
			if ll_fila > 0 and gs_tipo_cobro<>'BA' and gs_tipo_cobro<>'FA' then
				dw_ingreso.setitem(1,'numero',0)
				dw_ingreso.setitem(1,'base','')
				dw_ingreso.setitem(1,'serie','')
				dw_ingreso.accepttext()
				dw_ingreso.setfocus()
				dw_ingreso.setcolumn('base')
			elseif ls_base='F' or ls_base='G' then
				ll_monto_total		= w_ingreso2.tab_ingreso.tp_be.dw_gastos_be.getitemnumber(1,'c_total')
				if gs_tipo_cobro = 'BE' and ll_monto_total > 1 then
					dw_ingreso.setitem(1,'numero',0)
					dw_ingreso.setitem(1,'base','')
					dw_ingreso.setitem(1,'serie','')
					dw_ingreso.accepttext()
					dw_ingreso.setfocus()
					dw_ingreso.setcolumn('base')
				end if
			end if
		end if
	end if
end if
ls_serie			= dw_ingreso.getitemstring(1,'serie')
ll_numero		= dw_ingreso.getitemnumber(1,'numero')
ll_cod_parque	= dw_ingreso.getitemnumber(1,'cod_parque')
if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
	SELECT	"CADENA"."RUT",  
				"CLIENTE"."DV",
				"CADENA"."ESTADO"
	INTO 		:ll_rut,
				:ls_dv_aux,
				:ls_estado
	FROM 	"CADENA",
				"CLIENTE"
	WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) AND  
			 ( "CADENA"."CODIGO" = :ls_base ) AND  
			 ( "CADENA"."SERIE" = :ls_serie ) AND  
			 ( "CADENA"."NUMERO" = :ll_numero ) AND
			 ( "CADENA"."COD_PARQUE" = :ll_cod_parque )
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if w_ingreso2.tab_ingreso.SelectedTab=2 then
			ll_tot_reg	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
			if ll_tot_reg > 0 then ll_fila = w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob ='E' or tipo_cob='F' or tipo_cob='A'", 1, ll_tot_reg)
		elseif w_ingreso2.tab_ingreso.SelectedTab=3 then
			ll_tot_reg	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
			if ll_tot_reg > 0 then ll_fila = w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='E' or tipo_cob='F' or tipo_cob='A'", 1, ll_tot_reg)
		end if
		if ls_estado = 'V' or ls_estado = 'C' or ls_estado = 'S' or ls_estado='T' then
//			dw_ingreso.setitem(1,'numero',0)
//			dw_ingreso.accepttext()
//			dw_ingreso.setfocus()
//			dw_ingreso.setcolumn('numero')
		elseif ll_fila > 0 then
			dw_ingreso.setitem(1,'numero',0)
			dw_ingreso.accepttext()
			dw_ingreso.setfocus()
			dw_ingreso.setcolumn('numero')
		end if
	else
		if ls_base='L' then
			SELECT	"CD_FOLIO"."BASE"  
			INTO 		:ls_base_aux  
			FROM 	"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
					 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
			USING		sqlca;
		else
			SELECT	"CD_FOLIO"."BASE"  
			INTO 		:ls_base_aux  
			FROM 	"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
					 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
			USING		sqlca;
		end if
		if sqlca.sqlcode <> 0 then
			dw_ingreso.setitem(1,'numero',0)
			dw_ingreso.accepttext()
			dw_ingreso.setfocus()
			dw_ingreso.setcolumn('numero')
		end if
	end if
end if
dw_ingreso.accepttext()
end event

type cb_cancelar from commandbutton within w_ingresar_nombre
integer x = 1783
integer y = 1492
integer width = 357
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;gs_nombre_completo 	= ""
gs_contrato_rezago		= ""
setnull(gs_string_cli_rezago)
rollback using sqlca;
close(w_ingresar_nombre)
end event

type cb_aceptar from commandbutton within w_ingresar_nombre
integer x = 50
integer y = 1484
integer width = 357
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String		ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc,ls_ciudad,ls_comuna,ls_fono,ls_base,ls_serie,ls_base_aux,ls_estado,ls_pasa,ls_dv_aux,ls_moneda,ls_base_mpdet,ls_ctto,ls_serie_det,&
			ls_tipo_cob_det,ls_tipo_mov
Long		ll_rut,ll_cod_parque,ll_tot_reg,ll_fila,ll_fila_det,ll_parque_det,ll_tot_reg_serv,ll_indi_serv,ll_insert_mp
Double	ll_numero,ll_cupon_det,ll_cupon_mp,ll_monto_ctto,ll_folio_mp,ll_cod_servicio,ll_monto_ctto_det
date		ld_fecha_crea

ld_fecha_crea			= date(gdt_fec_sistema)
ll_insert_mp				= 0
Setnull(gs_contrato_rezago)
dw_ingreso.accepttext()
ll_rut						= dw_ingreso.getitemnumber(1,'rut')
ls_dv						= dw_ingreso.getitemstring(1,'dv')
ls_nombre				= dw_ingreso.getitemstring(1,'nombre')
ls_ap_pat				= dw_ingreso.getitemstring(1,'ap_paterno')
ls_ap_mat				= dw_ingreso.getitemstring(1,'ap_materno')
ls_direc					= dw_ingreso.getitemstring(1,'direccion_part')
ls_ciudad					= dw_ingreso.getitemstring(1,'ciudad_part')
ls_comuna				= dw_ingreso.getitemstring(1,'comuna_part')
ls_fono					= dw_ingreso.getitemstring(1,'telefono_part')
ls_base					= dw_ingreso.getitemstring(1,'base')
ls_serie					= dw_ingreso.getitemstring(1,'serie')
ll_numero				= dw_ingreso.getitemnumber(1,'numero')
ll_cod_parque			= dw_ingreso.getitemnumber(1,'cod_parque')
ls_moneda				= dw_ingreso.getitemstring(1,'moneda')
ls_pasa					= 'S'
if isvalid(w_ingreso2) then
	if w_ingreso2.tab_ingreso.SelectedTab = 1 then	// Cupon
		
	elseif w_ingreso2.tab_ingreso.SelectedTab =  2 then	// CI
		if ls_base='F' then
			messagebox("Advertencia","No es posible Generar Boleta a "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###')+", por ser Producto FUNERARIA")
			ls_pasa		= 'N'
		end if
	elseif w_ingreso2.tab_ingreso.SelectedTab =  4 then	//Factura
		if ls_base<>'F' then
			messagebox("Advertencia","No es posible Generar Factura a "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###')+", recuerde solo Producto FUNERARIA")
			ls_pasa		= 'N'
		end if
	elseif w_ingreso2.tab_ingreso.SelectedTab =  5 then	// Factura Carga
		
	end if
end if
if isnull(ls_nombre) or ls_nombre='' then
	messagebox("Advertencia","Debe ingresar Nombre")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('nombre')
	ls_pasa				= 'N'
elseif isnull(ls_moneda) or ls_moneda='' then
	messagebox("Advertencia","Debe ingresar Moneda Contrato")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('moneda')
	ls_pasa				= 'N'
elseif isnull(ls_ap_pat) or ls_ap_pat='' then
	messagebox("Advertencia","Debe ingresar Apellido Paterno")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('ap_paterno')
	ls_pasa				= 'N'
elseif isnull(ls_fono) or ls_fono='' then
	messagebox("Advertencia","Debe ingresar Teléfono")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('telefono_part')
	ls_pasa				= 'N'
elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
	messagebox("Advertencia","Debe ingresar Parque")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('cod_parque')
	ls_pasa				= 'N'
elseif isnull(ls_base) or ls_base='' then
	messagebox("Advertencia","Debe ingresar Base del Contrato")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('base')
	ls_pasa				= 'N'
elseif isnull(ls_serie) or ls_serie='' then
	messagebox("Advertencia","Debe ingresar Serie del Contrato")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('serie')
	ls_pasa				= 'N'
elseif isnull(ll_numero) or ll_numero=0 then
	messagebox("Advertencia","Debe ingresar Número del Contrato")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('numero')
	ls_pasa				= 'N'
elseif isnull(ls_direc) or ls_direc='' then
	messagebox("Advertencia","Debe ingresar Dirección")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('direccion_part')
	ls_pasa				= 'N'
elseif isnull(ls_ciudad) or ls_ciudad='' then
	messagebox("Advertencia","Debe ingresar Ciudad")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('ciudad_part')
	ls_pasa				= 'N'
elseif isnull(ls_comuna) or ls_comuna='' then
	messagebox("Advertencia","Debe ingresar Comuna")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('comuna_part')
	ls_pasa				= 'N'
end if
if ls_pasa = 'S' then
	if ls_base='F' or ls_base='G' then
		ll_tot_reg_serv			= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
		if ll_tot_reg_serv > 0 then
			SELECT 	"REVISION_CONTRATOS"."CODIGO_SERVICIO"  
			INTO 		:ll_cod_servicio  
			FROM 	"REVISION_CONTRATOS"  
			WHERE 	( "REVISION_CONTRATOS"."BASE" = :ls_base ) AND  
						( "REVISION_CONTRATOS"."SERIE" = :ls_serie ) AND  
						( "REVISION_CONTRATOS"."NUMERO" = :ll_numero )   ;
			if isnull(ll_cod_servicio) then ll_cod_servicio=0
			for ll_indi_serv=1 to ll_tot_reg_serv
				w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.setitem(ll_indi_serv,'cod_servicio',ll_cod_servicio)
			next
			w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.accepttext()
		end if
	end if
	gl_cod_parque_rezago	= ll_cod_parque
	if ls_base='L' then
		//AND	 ( "CD_FOLIO"."COD_PARQUE" = :ll_cod_parque )
		SELECT	"CD_FOLIO"."BASE"  
		INTO 		:ls_base_aux  
		FROM 	"CD_FOLIO"  
		WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
				   ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
				   ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
		USING		sqlca;
	else
		SELECT	"CD_FOLIO"."BASE"  
		INTO 		:ls_base_aux  
		FROM 	"CD_FOLIO"  
		WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
					( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
				    ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
		USING		sqlca;
	end if
	if sqlca.sqlcode=0 then
		if isnull(ll_rut) 	then		ll_rut			= 0
		if isnull(ls_dv) 		then	ls_dv			= ''
		if isnull(ls_nombre) then	ls_nombre	= ''
		if isnull(ls_ap_pat) then	ls_ap_pat	= ''
		if isnull(ls_ap_mat) then	ls_ap_mat	= ''
		if isnull(ls_direc) 	then	ls_direc		= '-'
		if isnull(ls_ciudad) then	ls_ciudad		= '0'
		if isnull(ls_comuna) then	ls_comuna	= '0'
		if isnull(ls_fono) 	then	ls_fono		= '-'
		if isnull(ls_base) 	then	ls_base		= ''
		if isnull(ls_serie) 	then	ls_serie		= ''
		if isnull(ll_numero) then	ll_numero	= 0
		if isnull(ll_cod_parque) then	ll_cod_parque	= 0
		gs_string_cli_rezago	= string(ll_rut)+'~t'+ls_dv+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+&
									  ls_direc+'~t'+ls_ciudad+'~t'+ls_comuna+'~t'+ls_fono+'~t'+ls_base+'~t'+ls_serie+'~t'+&
									  string(ll_numero)+'~t'+string(ll_cod_parque)+'~t'+ls_moneda
		gs_nombre_completo = ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat + " Teléfono: " +ls_fono
		gs_contrato_rezago 	= ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")
		gs_moneda_rezago	= ls_moneda
		if ls_base='M' and gs_rezago='S' then
			DECLARE x3 CURSOR FOR  
			SELECT 	"MPPRODUCTODET"."BASE"
			FROM 	"MPPRODUCTO",   	"MPPRODUCTODET"  
			WHERE 	( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" ) and  
						( "MPPRODUCTO"."CODIGOMP" = :gl_codigo_mp )   
			USING	Trans_1;
			open x3;
			if Trans_1.sqlcode=0 then
				do while Trans_1.sqlcode=0
					fetch x3 into :ls_base_mpdet;
					if not isnull(ls_base_mpdet) then
						ll_fila_det				= w_forma_pago2.dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mpdet+"'",1,w_forma_pago2.dw_multiproducto.rowcount())
						if ll_fila_det > 0 then
							ls_ctto				= w_forma_pago2.dw_multiproducto.getitemstring(ll_fila_det,'contrato')
							ls_serie_det			= mid(ls_ctto,2,1)
							ll_cupon_det		= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'nro_cupon')
							ll_cupon_mp		= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'mpnro_cupon')
							ls_tipo_cob_det		= w_forma_pago2.dw_multiproducto.getitemstring(ll_fila_det,'tipodoc')
							ls_tipo_mov			= w_forma_pago2.dw_multiproducto.getitemstring(ll_fila_det,'tipo_mov')
							ll_monto_ctto		= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'totalcto')
							ll_monto_ctto_det	= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'c_sum_porctto_peso')
							if ls_base_mpdet='G' then
								ll_parque_det	= 150
							else
								ll_parque_det	= ll_cod_parque
							end if
							if ls_base='M' and ll_insert_mp=0 then
								INSERT INTO "CLIENTE_REZAGO"  
											( "RUT",  	"BASE",   	"SERIE",   	"NUMERO",   	"NOMBRE",   	"AP_PATERNO",   	"AP_MATERNO",   	"DIRECCION_PART",   	"COMUNA_PART",   	"CIUDAD_PART",   	"TELEFONO_PART",   	"FECHA_CREA",   	"USUARIO",   	"DV",   	"COD_PAGO",   	"FOLIO",   		"FECHA_PAGO",   	"ESTADO",   	"CAJA",   	"COD_PARQUE",   	"MONEDA"   	 )  
								VALUES ( :ll_rut,   	:ls_base,		:ls_serie,		:ll_numero,   	:ls_nombre,   	:ls_ap_pat,   		:ls_ap_mat,   		:ls_direc,   					:ls_comuna,   			:ls_ciudad,   			:ls_fono,   				:ld_fecha_crea,   	:gs_user,   		:ls_dv,    'CX',   				:ll_cupon_mp, 	:ld_fecha_crea,   	'A',   				:gs_caja,   	:ll_cod_parque,   	:ls_moneda ) 
								USING	Trans_7 ;
								if Trans_7.sqlcode=0 then
									commit using Trans_7;
								else
									rollback using Trans_7;
								end if
								
								INSERT INTO "CUPONERAS_DETALLE_WEB"  
											( "BASE",  	"SERIE",   	"NUMERO",   	"NRO_CUPON",   	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"BASE_ASOC",   	"SERIE_ASOC",   	"NUMERO_ASOC",   	"TIPO_MONEDA",   	"CODIGO_DSCTO_FUNERARIA",   	"PIE_PACTADO",   	"USUARIO_CREA",   		"USUARIO_MODIFICA",   	"FECHA_MODIFICA",   	"COD_CAJA",   	"CUPON_ORIGINAL" )  
								VALUES 	( :ls_base, 	:ls_serie,   	:ll_numero,   	:ll_cupon_mp,   	:ll_rut,   	1,   					:ld_fecha_crea,   	'V',   								:ls_tipo_mov,   'CX',   					:ll_cupon_mp,   	:ld_fecha_crea,  	:ll_monto_ctto,   						:ll_monto_ctto,   				0,										0,   										1,   						:ls_dv,   	null,   				null,   				null,   					'1',   						null,   									null,   				:gs_user,   					null,   							null,   						:gs_caja,   		null )  
								USING	Trans_7 ;
								if Trans_7.sqlcode=0 then
									commit using Trans_7;
								else
									rollback using Trans_7;
								end if
								ll_insert_mp ++
							end if
							
							INSERT INTO "CLIENTE_REZAGO"  
										( "RUT",  	"BASE",   			"SERIE",   		"NUMERO",   	"NOMBRE",   	"AP_PATERNO",   	"AP_MATERNO",   	"DIRECCION_PART",   	"COMUNA_PART",   	"CIUDAD_PART",   	"TELEFONO_PART",   	"FECHA_CREA",   	"USUARIO",   	"DV",   	"COD_PAGO",   	"FOLIO",   		"FECHA_PAGO",   	"ESTADO",   	"CAJA",   	"COD_PARQUE",   	"MONEDA"   	 )  
							VALUES ( :ll_rut,   	:ls_base_mpdet,	:ls_serie_det,	:ll_numero,   	:ls_nombre,   	:ls_ap_pat,   		:ls_ap_mat,   		:ls_direc,   					:ls_comuna,   			:ls_ciudad,   			:ls_fono,   				:ld_fecha_crea,   	:gs_user,   		:ls_dv,   :ls_tipo_cob_det,   :ll_cupon_det, 	:ld_fecha_crea,   	'A',   				:gs_caja,   	:ll_parque_det,   	:ls_moneda ) 
							USING	Trans_7 ;
							if Trans_7.sqlcode=0 then
								commit using Trans_7;
							else
								rollback using Trans_7;
							end if
							
							INSERT INTO "CUPONERAS_DETALLE_WEB"  
										( "BASE",  				"SERIE",   			"NUMERO",   	"NRO_CUPON",   	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"BASE_ASOC",   	"SERIE_ASOC",   	"NUMERO_ASOC",   	"TIPO_MONEDA",   	"CODIGO_DSCTO_FUNERARIA",   	"PIE_PACTADO",   	"USUARIO_CREA",   		"USUARIO_MODIFICA",   	"FECHA_MODIFICA",   	"COD_CAJA",   	"CUPON_ORIGINAL" )  
							VALUES 	( :ls_base_mpdet, 	:ls_serie_det,   	:ll_numero,   	:ll_cupon_det,   	:ll_rut,   	1,   					:ld_fecha_crea,   	'V',   								:ls_tipo_mov,   :ls_tipo_cob_det,   	:ll_cupon_det,   	:ld_fecha_crea,  	:ll_monto_ctto_det,   					:ll_monto_ctto_det,   				0,										0,   										1,   						:ls_dv,   	null,   				null,   				null,   					'1',   						null,   									null,   				:gs_user,   					null,   							null,   						:gs_caja,   		null )  
							USING	Trans_7 ;
							if Trans_7.sqlcode=0 then
								commit using Trans_7;
							else
								rollback using Trans_7;
							end if
							UPDATE 	"CUPONERAS_DETALLE_WEB"  
							SET 		"NUMERO" = :ll_numero  
							WHERE 	( "CUPONERAS_DETALLE_WEB"."BASE" = :ls_base_mpdet ) AND  
										( "CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :ll_cupon_det ) AND  
//										( "CUPONERAS_DETALLE_WEB"."TIPO_COB_PAGO" = :ls_tipo_cob_det ) AND  
//										( "CUPONERAS_DETALLE_WEB"."FOLIO_PAGO" = :ll_cupon_det ) //AND  
										( "CUPONERAS_DETALLE_WEB"."RUT" = :ll_rut )  
							USING	Trans_7 ;
							if Trans_7.sqlcode=0 then
								commit using Trans_7;
							else
								rollback using Trans_7;
							end if
						end if
					end if			
					Setnull(ls_base_mpdet)
				loop
			end if
			close x3;		
		end if
									
		close(w_ingresar_nombre)	
	else
		SELECT	"CADENA"."ESTADO"  
		INTO 		:ls_estado  
		FROM 	"CADENA"  
		WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
				   ( "CADENA"."SERIE" = :ls_serie ) AND  
				   ( "CADENA"."NUMERO" = :ll_numero ) AND
				   ( "CADENA"."COD_PARQUE" = :ll_cod_parque )
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if w_ingreso2.tab_ingreso.SelectedTab=2 then
				ll_tot_reg	= w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.rowcount()
				if ll_tot_reg > 0 then ll_fila = w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.Find("tipo_cob ='E' or tipo_cob='F' or tipo_cob='A'", 1, ll_tot_reg)
			elseif w_ingreso2.tab_ingreso.SelectedTab=3 then
				ll_tot_reg	= w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.rowcount()
				if ll_tot_reg > 0 then ll_fila = w_ingreso2.tab_ingreso.tp_be.dw_detalle_be.Find("tipo_cob ='E' or tipo_cob='F' or tipo_cob='A'", 1, ll_tot_reg)
			end if
			if ls_estado <> 'V' and ls_estado <> 'C' and ls_estado <> 'S' and ls_estado <> 'T'  then
				if isnull(ll_rut) 			then	ll_rut			= 0
				if isnull(ls_dv) 			then	ls_dv			= ''
				if isnull(ls_nombre) 	then	ls_nombre	= ''
				if isnull(ls_ap_pat) 	then	ls_ap_pat	= ''
				if isnull(ls_ap_mat) 	then	ls_ap_mat	= ''
				if isnull(ls_direc) 		then	ls_direc		= '-'
				if isnull(ls_ciudad) 		then	ls_ciudad		= '0'
				if isnull(ls_comuna) 	then	ls_comuna	= '0'
				if isnull(ls_fono) 		then	ls_fono		= '-'
				if isnull(ls_base) 		then	ls_base		= ''
				if isnull(ls_serie) 		then	ls_serie		= ''
				if isnull(ll_numero) 	then	ll_numero	= 0
				if isnull(ll_cod_parque) then	ll_cod_parque	= 0
				gs_string_cli_rezago	= string(ll_rut)+'~t'+ls_dv+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+&
											  ls_direc+'~t'+ls_ciudad+'~t'+ls_comuna+'~t'+ls_fono+'~t'+ls_base+'~t'+ls_serie+'~t'+&
											  string(ll_numero)+'~t'+string(ll_cod_parque)+'~t'+ls_moneda
				gs_nombre_completo = ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat + " Teléfono: " +ls_fono
				gs_contrato_rezago 	= ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")
				gs_moneda_rezago	= ls_moneda
				if ls_base='M' and gs_rezago='S' then
					DECLARE x4 CURSOR FOR  
					SELECT 	"MPPRODUCTODET"."BASE"
					FROM 	"MPPRODUCTO",   	"MPPRODUCTODET"  
					WHERE 	( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" ) and  
								( "MPPRODUCTO"."CODIGOMP" = :gl_codigo_mp )   
					USING	Trans_1;
					open x4;
					if Trans_1.sqlcode=0 then
						do while Trans_1.sqlcode=0
							fetch x4 into :ls_base_mpdet;
							if not isnull(ls_base_mpdet) then
								ll_fila_det				= w_forma_pago2.dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mpdet+"'",1,w_forma_pago2.dw_multiproducto.rowcount())
								if ll_fila_det > 0 then
									ls_ctto				= w_forma_pago2.dw_multiproducto.getitemstring(ll_fila_det,'contrato')
									ls_serie_det			= mid(ls_ctto,2,1)
									ll_cupon_det		= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'nro_cupon')
									ll_cupon_mp		= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'mpnro_cupon')
									ls_tipo_cob_det		= w_forma_pago2.dw_multiproducto.getitemstring(ll_fila_det,'tipodoc')
									ls_tipo_mov			= w_forma_pago2.dw_multiproducto.getitemstring(ll_fila_det,'tipo_mov')
									ll_monto_ctto		= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'totalcto')
									ll_monto_ctto_det	= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'c_sum_porctto_peso')
									if ls_base_mpdet='G' then
										ll_parque_det	= 150
									else
										ll_parque_det	= ll_cod_parque
									end if
									if ls_base='M' and ll_insert_mp=0 then
										INSERT INTO "CLIENTE_REZAGO"  
													( "RUT",  	"BASE",   	"SERIE",   	"NUMERO",   	"NOMBRE",   	"AP_PATERNO",   	"AP_MATERNO",   	"DIRECCION_PART",   	"COMUNA_PART",   	"CIUDAD_PART",   	"TELEFONO_PART",   	"FECHA_CREA",   	"USUARIO",   	"DV",   	"COD_PAGO",   	"FOLIO",   		"FECHA_PAGO",   	"ESTADO",   	"CAJA",   	"COD_PARQUE",   	"MONEDA"   	 )  
										VALUES ( :ll_rut,   	:ls_base,		:ls_serie,		:ll_numero,   	:ls_nombre,   	:ls_ap_pat,   		:ls_ap_mat,   		:ls_direc,   					:ls_comuna,   			:ls_ciudad,   			:ls_fono,   				:ld_fecha_crea,   	:gs_user,   		:ls_dv,    'CX',   				:ll_cupon_mp, 	:ld_fecha_crea,   	'A',   				:gs_caja,   	:ll_cod_parque,   	:ls_moneda ) 
										USING	Trans_7 ;
										if Trans_7.sqlcode=0 then
											commit using Trans_7;
										else
											rollback using Trans_7;
										end if
										
										INSERT INTO "CUPONERAS_DETALLE_WEB"  
													( "BASE",  	"SERIE",   	"NUMERO",   	"NRO_CUPON",   	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"BASE_ASOC",   	"SERIE_ASOC",   	"NUMERO_ASOC",   	"TIPO_MONEDA",   	"CODIGO_DSCTO_FUNERARIA",   	"PIE_PACTADO",   	"USUARIO_CREA",   		"USUARIO_MODIFICA",   	"FECHA_MODIFICA",   	"COD_CAJA",   	"CUPON_ORIGINAL" )  
										VALUES 	( :ls_base, 	:ls_serie,   	:ll_numero,   	:ll_cupon_mp,   	:ll_rut,   	1,   					:ld_fecha_crea,   	'V',   								:ls_tipo_mov,   'CX',   					:ll_folio_mp,   		:ld_fecha_crea,  	:ll_monto_ctto,   						:ll_monto_ctto,   				0,										0,   										1,   						:ls_dv,   	null,   				null,   				null,   					'1',   						null,   									null,   				:gs_user,   					null,   							null,   						:gs_caja,   		null )  
										USING	Trans_7 ;
										if Trans_7.sqlcode=0 then
											commit using Trans_7;
										else
											rollback using Trans_7;
										end if
										ll_insert_mp ++
									end if
									
									INSERT INTO "CLIENTE_REZAGO"  
												( "RUT",  	"BASE",   			"SERIE",   		"NUMERO",   	"NOMBRE",   	"AP_PATERNO",   	"AP_MATERNO",   	"DIRECCION_PART",   	"COMUNA_PART",   	"CIUDAD_PART",   	"TELEFONO_PART",   	"FECHA_CREA",   	"USUARIO",   	"DV",   	"COD_PAGO",   	"FOLIO",   		"FECHA_PAGO",   	"ESTADO",   	"CAJA",   	"COD_PARQUE",   	"MONEDA"   	 )  
									VALUES ( :ll_rut,   	:ls_base_mpdet,	:ls_serie_det,	:ll_numero,   	:ls_nombre,   	:ls_ap_pat,   		:ls_ap_mat,   		:ls_direc,   					:ls_comuna,   			:ls_ciudad,   			:ls_fono,   				:ld_fecha_crea,   	:gs_user,   		:ls_dv,   :ls_tipo_cob_det,   :ll_cupon_det, 	:ld_fecha_crea,   	'A',   				:gs_caja,   	:ll_parque_det,   	:ls_moneda ) 
									USING	Trans_7 ;
									if Trans_7.sqlcode=0 then
										commit using Trans_7;
									else
										rollback using Trans_7;
									end if
									
									INSERT INTO "CUPONERAS_DETALLE_WEB"  
												( "BASE",  				"SERIE",   			"NUMERO",   	"NRO_CUPON",   	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"BASE_ASOC",   	"SERIE_ASOC",   	"NUMERO_ASOC",   	"TIPO_MONEDA",   	"CODIGO_DSCTO_FUNERARIA",   	"PIE_PACTADO",   	"USUARIO_CREA",   		"USUARIO_MODIFICA",   	"FECHA_MODIFICA",   	"COD_CAJA",   	"CUPON_ORIGINAL" )  
									VALUES 	( :ls_base_mpdet, 	:ls_serie_det,   	:ll_numero,   	:ll_cupon_det,   	:ll_rut,   	1,   					:ld_fecha_crea,   	'V',   								:ls_tipo_mov,   :ls_tipo_cob_det,   	:ll_cupon_det,   	:ld_fecha_crea,  	:ll_monto_ctto_det,   					:ll_monto_ctto_det,   				0,										0,   										1,   						:ls_dv,   	null,   				null,   				null,   					'1',   						null,   									null,   				:gs_user,   					null,   							null,   						:gs_caja,   		null )  
									USING	Trans_7 ;
									if Trans_7.sqlcode=0 then
										commit using Trans_7;
									else
										rollback using Trans_7;
									end if
									
									UPDATE 	"CUPONERAS_DETALLE_WEB"  
									SET 		"NUMERO" = :ll_numero  
									WHERE 	( "CUPONERAS_DETALLE_WEB"."BASE" = :ls_base_mpdet ) AND  
												( "CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :ll_cupon_det ) AND  
		//										( "CUPONERAS_DETALLE_WEB"."TIPO_COB_PAGO" = :ls_tipo_cob_det ) AND  
		//										( "CUPONERAS_DETALLE_WEB"."FOLIO_PAGO" = :ll_cupon_det ) //AND  
												( "CUPONERAS_DETALLE_WEB"."RUT" = :ll_rut )  
									USING	Trans_7 ;
									if Trans_7.sqlcode=0 then
										commit using Trans_7;
									else
										rollback using Trans_7;
									end if
								end if
							end if			
						loop
					end if
					close x4;		
				end if
				close(w_ingresar_nombre)
			elseif ll_fila > 0 then
				if isnull(ll_rut) 			then	ll_rut			= 0
				if isnull(ls_dv) 			then	ls_dv			= ''
				if isnull(ls_nombre) 	then	ls_nombre	= ''
				if isnull(ls_ap_pat) 	then	ls_ap_pat	= ''
				if isnull(ls_ap_mat) 	then	ls_ap_mat	= ''
				if isnull(ls_direc) 		then	ls_direc		= '-'
				if isnull(ls_ciudad) 		then	ls_ciudad		= '0'
				if isnull(ls_comuna) 	then	ls_comuna	= '0'
				if isnull(ls_fono) 		then	ls_fono		= '-'
				if isnull(ls_base) 		then	ls_base		= ''
				if isnull(ls_serie) 		then	ls_serie		= ''
				if isnull(ll_numero) 	then	ll_numero	= 0
				if isnull(ll_cod_parque) then	ll_cod_parque	= 0
				gs_string_cli_rezago	= string(ll_rut)+'~t'+ls_dv+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+&
											  ls_direc+'~t'+ls_ciudad+'~t'+ls_comuna+'~t'+ls_fono+'~t'+ls_base+'~t'+ls_serie+'~t'+&
											  string(ll_numero)+'~t'+string(ll_cod_parque)+'~t'+ls_moneda
				gs_nombre_completo = ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat + " Teléfono: " +ls_fono
				gs_contrato_rezago 	= ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")
				gs_moneda_rezago	= ls_moneda
				if ls_base='M' and gs_rezago='S' then
					DECLARE x5 CURSOR FOR  
					SELECT 	"MPPRODUCTODET"."BASE"
					FROM 	"MPPRODUCTO",   	"MPPRODUCTODET"  
					WHERE 	( "MPPRODUCTO"."CODIGOMP" = "MPPRODUCTODET"."CODIGOMP" ) and  
								( "MPPRODUCTO"."CODIGOMP" = :gl_codigo_mp )   
					USING	Trans_1;
					open x5;
					if Trans_1.sqlcode=0 then
						do while Trans_1.sqlcode=0
							fetch x5 into :ls_base_mpdet;
							if not isnull(ls_base_mpdet) then
								ll_fila_det			= w_forma_pago2.dw_multiproducto.find("mid(contrato,1,1)='"+ls_base_mpdet+"'",1,w_forma_pago2.dw_multiproducto.rowcount())
								if ll_fila_det > 0 then
									ls_ctto			= w_forma_pago2.dw_multiproducto.getitemstring(ll_fila_det,'contrato')
									ls_serie_det		= mid(ls_ctto,2,1)
									ll_cupon_det	= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'nro_cupon')
									ll_cupon_mp	= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'mpnro_cupon')
									ls_tipo_cob_det	= w_forma_pago2.dw_multiproducto.getitemstring(ll_fila_det,'tipodoc')
									ls_tipo_mov		= w_forma_pago2.dw_multiproducto.getitemstring(ll_fila_det,'tipo_mov')
									ll_monto_ctto	= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'totalcto')
									ll_monto_ctto_det	= w_forma_pago2.dw_multiproducto.getitemnumber(ll_fila_det,'c_sum_porctto_peso')
									if ls_base_mpdet='G' then
										ll_parque_det	= 150
									else
										ll_parque_det	= ll_cod_parque
									end if
									if ls_base='M' and ll_insert_mp=0 then
										INSERT INTO "CLIENTE_REZAGO"  
													( "RUT",  	"BASE",   	"SERIE",   	"NUMERO",   	"NOMBRE",   	"AP_PATERNO",   	"AP_MATERNO",   	"DIRECCION_PART",   	"COMUNA_PART",   	"CIUDAD_PART",   	"TELEFONO_PART",   	"FECHA_CREA",   	"USUARIO",   	"DV",   	"COD_PAGO",   	"FOLIO",   		"FECHA_PAGO",   	"ESTADO",   	"CAJA",   	"COD_PARQUE",   	"MONEDA"   	 )  
										VALUES ( :ll_rut,   	:ls_base,		:ls_serie,		:ll_numero,   	:ls_nombre,   	:ls_ap_pat,   		:ls_ap_mat,   		:ls_direc,   					:ls_comuna,   			:ls_ciudad,   			:ls_fono,   				:ld_fecha_crea,   	:gs_user,   		:ls_dv,    'CX',   				:ll_cupon_mp, 	:ld_fecha_crea,   	'A',   				:gs_caja,   	:ll_cod_parque,   	:ls_moneda ) 
										USING	Trans_7 ;
										if Trans_7.sqlcode=0 then
											commit using Trans_7;
										else
											rollback using Trans_7;
										end if
										
										INSERT INTO "CUPONERAS_DETALLE_WEB"  
													( "BASE",  	"SERIE",   	"NUMERO",   	"NRO_CUPON",   	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"BASE_ASOC",   	"SERIE_ASOC",   	"NUMERO_ASOC",   	"TIPO_MONEDA",   	"CODIGO_DSCTO_FUNERARIA",   	"PIE_PACTADO",   	"USUARIO_CREA",   		"USUARIO_MODIFICA",   	"FECHA_MODIFICA",   	"COD_CAJA",   	"CUPON_ORIGINAL" )  
										VALUES 	( :ls_base, 	:ls_serie,   	:ll_numero,   	:ll_cupon_mp,   	:ll_rut,   	1,   					:ld_fecha_crea,   	'V',   								:ls_tipo_mov,   'CX',   					:ll_folio_mp,   		:ld_fecha_crea,  	:ll_monto_ctto,   						:ll_monto_ctto,   				0,										0,   										1,   						:ls_dv,   	null,   				null,   				null,   					'1',   						null,   									null,   				:gs_user,   					null,   							null,   						:gs_caja,   		null )  
										USING	Trans_7 ;
										if Trans_7.sqlcode=0 then
											commit using Trans_7;
										else
											rollback using Trans_7;
										end if
										ll_insert_mp ++
									end if
									
									INSERT INTO "CLIENTE_REZAGO"  
												( "RUT",  	"BASE",   			"SERIE",   		"NUMERO",   	"NOMBRE",   	"AP_PATERNO",   	"AP_MATERNO",   	"DIRECCION_PART",   	"COMUNA_PART",   	"CIUDAD_PART",   	"TELEFONO_PART",   	"FECHA_CREA",   	"USUARIO",   	"DV",   	"COD_PAGO",   	"FOLIO",   		"FECHA_PAGO",   	"ESTADO",   	"CAJA",   	"COD_PARQUE",   	"MONEDA"   	 )  
									VALUES ( :ll_rut,   	:ls_base_mpdet,	:ls_serie_det,	:ll_numero,   	:ls_nombre,   	:ls_ap_pat,   		:ls_ap_mat,   		:ls_direc,   					:ls_comuna,   			:ls_ciudad,   			:ls_fono,   				:ld_fecha_crea,   	:gs_user,   		:ls_dv,   :ls_tipo_cob_det,   :ll_cupon_det, 	:ld_fecha_crea,   	'A',   				:gs_caja,   	:ll_parque_det,   	:ls_moneda ) 
									USING	Trans_7 ;
									if Trans_7.sqlcode=0 then
										commit using Trans_7;
									else
										rollback using Trans_7;
									end if
									
									INSERT INTO "CUPONERAS_DETALLE_WEB"  
												( "BASE",  				"SERIE",   			"NUMERO",   	"NRO_CUPON",   	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"BASE_ASOC",   	"SERIE_ASOC",   	"NUMERO_ASOC",   	"TIPO_MONEDA",   	"CODIGO_DSCTO_FUNERARIA",   	"PIE_PACTADO",   	"USUARIO_CREA",   		"USUARIO_MODIFICA",   	"FECHA_MODIFICA",   	"COD_CAJA",   	"CUPON_ORIGINAL" )  
									VALUES 	( :ls_base_mpdet, 	:ls_serie_det,   	:ll_numero,   	:ll_cupon_det,   	:ll_rut,   	1,   					:ld_fecha_crea,   	'V',   								:ls_tipo_mov,   :ls_tipo_cob_det,   	:ll_cupon_det,   	:ld_fecha_crea,  	:ll_monto_ctto_det,   					:ll_monto_ctto_det,   				0,										0,   										1,   						:ls_dv,   	null,   				null,   				null,   					'1',   						null,   									null,   				:gs_user,   					null,   							null,   						:gs_caja,   		null )  
									USING	Trans_7 ;
									if Trans_7.sqlcode=0 then
										commit using Trans_7;
									else
										rollback using Trans_7;
									end if
									
									UPDATE 	"CUPONERAS_DETALLE_WEB"  
									SET 		"NUMERO" = :ll_numero  
									WHERE 	( "CUPONERAS_DETALLE_WEB"."BASE" = :ls_base_mpdet ) AND  
												( "CUPONERAS_DETALLE_WEB"."NRO_CUPON" = :ll_cupon_det ) AND  
		//										( "CUPONERAS_DETALLE_WEB"."TIPO_COB_PAGO" = :ls_tipo_cob_det ) AND  
		//										( "CUPONERAS_DETALLE_WEB"."FOLIO_PAGO" = :ll_cupon_det ) //AND  
												( "CUPONERAS_DETALLE_WEB"."RUT" = :ll_rut )  
									USING	Trans_7 ;
									if Trans_7.sqlcode=0 then
										commit using Trans_7;
									else
										rollback using Trans_7;
									end if
								end if
							end if		
							Setnull(ls_base_mpdet)
						loop
					end if
					close x5;		
				end if
				close(w_ingresar_nombre)
			else
				messagebox("Advertencia","Contrato Asociado NO válido, Estado actual "+ls_estado)
				dw_ingreso.setfocus()
				dw_ingreso.setcolumn('numero')
			end if
		else
			messagebox("Advertencia","Contrato Asociado NO válido")
			dw_ingreso.setfocus()
			dw_ingreso.setcolumn('numero')
		end if
	end if
end if
end event

event getfocus;//String	ls_base,ls_serie,ls_dv_aux
//Long		ll_numero,ll_rut
//
//ls_base		= dw_ingreso.getitemstring(1,'base')
//ls_serie		= dw_ingreso.getitemstring(1,'serie')
//ll_numero	= dw_ingreso.getitemnumber(1,'numero')
//if not isnull(ls_base) and not isnull(ls_serie) and ll_numero>0 then
//	SELECT	"CADENA"."RUT",  
//				"CLIENTE"."DV"
//	INTO 		:ll_rut,
//				:ls_dv_aux
//	FROM 		"CADENA",
//				"CLIENTE"
//	WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) AND  
//			 ( "CADENA"."CODIGO" = :ls_base ) AND  
//			 ( "CADENA"."SERIE" = :ls_serie ) AND  
//			 ( "CADENA"."NUMERO" = :ll_numero )   
//	USING		sqlca;
//	if sqlca.sqlcode=0 then
//		dw_ingreso.setitem(1,'numero',0)
//		dw_ingreso.accepttext()
//		dw_ingreso.setfocus()
//		dw_ingreso.setcolumn('numero')
//	end if
//end if
end event

