forward
global type w_ingresar_nombre_bkp from window
end type
type dw_ingreso from datawindow within w_ingresar_nombre_bkp
end type
type cb_cancelar from commandbutton within w_ingresar_nombre_bkp
end type
type cb_aceptar from commandbutton within w_ingresar_nombre_bkp
end type
end forward

global type w_ingresar_nombre_bkp from window
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
global w_ingresar_nombre_bkp w_ingresar_nombre_bkp

type variables
Date	idt_fecha_hoy
end variables

on w_ingresar_nombre_bkp.create
this.dw_ingreso=create dw_ingreso
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.Control[]={this.dw_ingreso,&
this.cb_cancelar,&
this.cb_aceptar}
end on

on w_ingresar_nombre_bkp.destroy
destroy(this.dw_ingreso)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
end on

event open;Long		ll_new,ll_nulo
String		ls_nulo,ls_ciudad,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direccion,ls_comuna,ls_telefono,ls_cliente_sap  

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

type dw_ingreso from datawindow within w_ingresar_nombre_bkp
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
Long		ll_rut,ll_cod_parque,ll_tot_reg,ll_fila
Double	ll_numero

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
	ls_base			= dw_ingreso.getitemstring(1,'base')
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
			FROM 		"CADENA",
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
					dw_ingreso.setitem(1,'numero',0)
					dw_ingreso.accepttext()
					dw_ingreso.setfocus()
					dw_ingreso.setcolumn('numero')
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
//							 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
							 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
					USING		sqlca;
				else
					SELECT	"CD_FOLIO"."BASE"  
					INTO 		:ls_base_aux  
					FROM 	"CD_FOLIO"  
					WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
//							 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
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
Long		ll_nulo,ll_cod_parque,ll_rut,ll_tot_reg,ll_fila
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
	FROM 		"CADENA",
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
			dw_ingreso.setitem(1,'numero',0)
			dw_ingreso.accepttext()
			dw_ingreso.setfocus()
			dw_ingreso.setcolumn('numero')
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
//					 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
			USING		sqlca;
		else
			SELECT	"CD_FOLIO"."BASE"  
			INTO 		:ls_base_aux  
			FROM 	"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
//					 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
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

type cb_cancelar from commandbutton within w_ingresar_nombre_bkp
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
gs_contrato_rezago	= ""
setnull(gs_string_cli_rezago)
rollback using sqlca;
close(w_ingresar_nombre)
end event

type cb_aceptar from commandbutton within w_ingresar_nombre_bkp
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

event clicked;String		ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc,ls_ciudad,ls_comuna,ls_fono,ls_base,ls_serie,ls_base_aux,ls_estado,ls_pasa,ls_dv_aux,ls_moneda
Long		ll_rut,ll_cod_parque,ll_tot_reg,ll_fila
Double	ll_numero

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
	gl_cod_parque_rezago	= ll_cod_parque
	if ls_base='L' then
		//AND	 ( "CD_FOLIO"."COD_PARQUE" = :ll_cod_parque )
		SELECT	"CD_FOLIO"."BASE"  
		INTO 		:ls_base_aux  
		FROM 	"CD_FOLIO"  
		WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
//				   ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
				   ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
		USING		sqlca;
	else
		SELECT	"CD_FOLIO"."BASE"  
		INTO 		:ls_base_aux  
		FROM 	"CD_FOLIO"  
		WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
//					( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
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

