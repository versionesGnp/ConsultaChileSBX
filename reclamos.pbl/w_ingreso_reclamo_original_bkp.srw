forward
global type w_ingreso_reclamo_original_bkp from window
end type
type cb_ing_gestion from commandbutton within w_ingreso_reclamo_original_bkp
end type
type ddplb_contratos from dropdownpicturelistbox within w_ingreso_reclamo_original_bkp
end type
type cb_detalle_gestion from commandbutton within w_ingreso_reclamo_original_bkp
end type
type cb_fallecido from commandbutton within w_ingreso_reclamo_original_bkp
end type
type cb_ctacte from commandbutton within w_ingreso_reclamo_original_bkp
end type
type cb_print from commandbutton within w_ingreso_reclamo_original_bkp
end type
type cb_anular from commandbutton within w_ingreso_reclamo_original_bkp
end type
type cb_buscar from commandbutton within w_ingreso_reclamo_original_bkp
end type
type cb_limpiar from commandbutton within w_ingreso_reclamo_original_bkp
end type
type cb_cerrar from commandbutton within w_ingreso_reclamo_original_bkp
end type
type cb_grabar from commandbutton within w_ingreso_reclamo_original_bkp
end type
type dw_ingreso from datawindow within w_ingreso_reclamo_original_bkp
end type
end forward

global type w_ingreso_reclamo_original_bkp from window
integer width = 3771
integer height = 2144
boolean titlebar = true
string title = "Ingreso Solicitud Requerimiento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_ing_gestion cb_ing_gestion
ddplb_contratos ddplb_contratos
cb_detalle_gestion cb_detalle_gestion
cb_fallecido cb_fallecido
cb_ctacte cb_ctacte
cb_print cb_print
cb_anular cb_anular
cb_buscar cb_buscar
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_ingreso dw_ingreso
end type
global w_ingreso_reclamo_original_bkp w_ingreso_reclamo_original_bkp

type variables
datawindowchild			idw_detalle5,idw_detalle6,idw_detalle7,idw_detalle8
Long		il_veces, il_modif
end variables

forward prototypes
public function string wf_validar ()
end prototypes

public function string wf_validar ();Long		ll_reclamo,ll_cod_parque,ll_rut_titular,ll_cod_reclamo,ll_cod_asig,ll_rut_contacto,ll_ult_cod_gestion
String		ls_cod_solicitud	,ls_base,ls_serie,ls_area,ls_sector,ls_sepultura,ls_cod_gerencia,ls_usuario_asig,ls_depto_asig,ls_nom_contacto,&
			ls_ap_pat_contacto,ls_email,ls_fono_part,ls_fono_comer,ls_celular,ls_ult_glosa,ls_glosa,ls_pasa='S'
Datetime	ldt_ult_fecha
Double	ll_numero
dw_ingreso.accepttext()
ls_cod_solicitud			= dw_ingreso.getitemstring(1,'codigo_solicitud')
ll_cod_parque			= dw_ingreso.getitemnumber(1,'cod_parque')
ls_base					= dw_ingreso.getitemstring(1,'base')
ls_serie					= dw_ingreso.getitemstring(1,'serie')
ll_numero				= dw_ingreso.getitemnumber(1,'numero')
ll_rut_titular				= dw_ingreso.getitemnumber(1,'rut_titular')
ll_cod_reclamo			= dw_ingreso.getitemnumber(1,'codigo_reclamo')
ls_area					= dw_ingreso.getitemstring(1, 'area')
ls_sector					= dw_ingreso.getitemstring(1,'sector')
ls_sepultura				= dw_ingreso.getitemstring(1,'sepultura')
ls_cod_gerencia		= dw_ingreso.getitemstring(1,'cod_gerencia_asignado')
ls_usuario_asig			= dw_ingreso.getitemstring(1,'usuario_asignado')
ls_depto_asig			= dw_ingreso.getitemstring(1,'depto_asig')
ll_rut_contacto			= dw_ingreso.getitemnumber(1,'rut_contacto')
ls_nom_contacto		= dw_ingreso.getitemstring(1,'nombre_contacto')
ls_ap_pat_contacto	= dw_ingreso.getitemstring(1,'a_paterno_contacto')
ls_email					= dw_ingreso.getitemstring(1,'email')
ls_fono_part				= dw_ingreso.getitemstring(1,'fono_particular')
ls_fono_comer			= dw_ingreso.getitemstring(1,'fono_comercial')
ls_celular				= dw_ingreso.getitemstring(1,'celular')
ll_ult_cod_gestion		= dw_ingreso.getitemnumber(1,'ult_estado_gestion')
ls_ult_glosa				= dw_ingreso.getitemstring(1,'ult_glosa_gestion')
ldt_ult_fecha			= dw_ingreso.getitemdatetime(1,'ult_fecha_gestion')
if isnull(ls_cod_solicitud) then
	messagebox("Advertencia","Debe Seleccionar Solicitud")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('codigo_solicitud')
	ls_pasa				= 'N'
elseif isnull(ll_cod_parque) then
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('cod_parque')
	ls_pasa				= 'N'
elseif isnull(ls_base) then
	messagebox("Advertencia","Debe Seleccionar Base Contrato")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('base')
	ls_pasa				= 'N'
elseif isnull(ls_serie) then
	messagebox("Advertencia","Debe Seleccionar Serie Contrato")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('serie')
	ls_pasa				= 'N'
elseif isnull(ll_numero) then
	messagebox("Advertencia","Debe Ingresar Número Contrato")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('numero')
	ls_pasa				= 'N'
elseif isnull(ll_rut_titular) then
	messagebox("Advertencia","Debe Ingresar Rut Titular")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('rut_titular')
	ls_pasa				= 'N'
elseif isnull(ll_cod_reclamo) then
	messagebox("Advertencia","Debe Seleccionar Requerimiento")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('codigo_reclamo')
	ls_pasa				= 'N'
elseif isnull(ls_area) then
	messagebox("Advertencia","Debe Seleccionar Area Sepultura")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('area')
	ls_pasa				= 'N'
elseif isnull(ls_sector) then
	messagebox("Advertencia","Debe Seleccionar Sector Sepultura")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('sector')
	ls_pasa				= 'N'
elseif isnull(ls_sepultura) then
	messagebox("Advertencia","Debe Seleccionar Número Sepultura")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('sepultura')
	ls_pasa				= 'N'
elseif isnull(ls_depto_asig) then
	messagebox("Advertencia","Debe Seleccionar Departamento Asignado")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('depto_asig')
	ls_pasa				= 'N'
elseif isnull(ls_cod_gerencia) then
	messagebox("Advertencia","Debe Seleccionar Gerencia Asignada")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('cod_gerencia_asignado')
	ls_pasa				= 'N'
elseif isnull(ls_usuario_asig) then
	messagebox("Advertencia","Debe Seleccionar Usuario Asignado")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('usuario_asignado')
	ls_pasa				= 'N'
elseif isnull(ll_cod_asig) then
	messagebox("Advertencia","Debe Seleccionar Tipo Requerimiento")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('ll_cod_asig')
	ls_pasa				= 'N'
elseif isnull(ll_rut_contacto) then
	messagebox("Advertencia","Debe Ingresar Rut Contacto")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('rut_contacto')
	ls_pasa				= 'N'
elseif isnull(ls_nom_contacto) then
	messagebox("Advertencia","Debe Ingresar Nombre Contacto")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('nombre_contacto')
	ls_pasa				= 'N'
elseif isnull(ls_ap_pat_contacto) then
	messagebox("Advertencia","Debe Ingresar Apellido Paterno Contacto")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('a_paterno_contacto')
	ls_pasa				= 'N'
elseif isnull(ls_email) and isnull(ls_fono_part) and isnull(ls_fono_comer) and isnull(ls_celular) then
	messagebox("Advertencia","Debe Ingresar por lo Menos un Teléfono de Contacto")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('fono_particular')
	ls_pasa				= 'N'
elseif isnull(ls_ult_glosa) then
	messagebox("Advertencia","Debe Ingresar Observación")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('ult_glosa_gestion')
	ls_pasa				= 'N'
end if
RETURN ls_pasa
end function

on w_ingreso_reclamo_original_bkp.create
this.cb_ing_gestion=create cb_ing_gestion
this.ddplb_contratos=create ddplb_contratos
this.cb_detalle_gestion=create cb_detalle_gestion
this.cb_fallecido=create cb_fallecido
this.cb_ctacte=create cb_ctacte
this.cb_print=create cb_print
this.cb_anular=create cb_anular
this.cb_buscar=create cb_buscar
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.cb_ing_gestion,&
this.ddplb_contratos,&
this.cb_detalle_gestion,&
this.cb_fallecido,&
this.cb_ctacte,&
this.cb_print,&
this.cb_anular,&
this.cb_buscar,&
this.cb_limpiar,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_ingreso}
end on

on w_ingreso_reclamo_original_bkp.destroy
destroy(this.cb_ing_gestion)
destroy(this.ddplb_contratos)
destroy(this.cb_detalle_gestion)
destroy(this.cb_fallecido)
destroy(this.cb_ctacte)
destroy(this.cb_print)
destroy(this.cb_anular)
destroy(this.cb_buscar)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_ingreso)
end on

event open;Long		ll_new,ll_cod_parque

SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
gf_centrar(w_ingreso_reclamo)
dw_ingreso.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_cod_parque	= 11
elseif gs_conexion	= "Parque Concepción" then
	ll_cod_parque	= 801
end if
dw_ingreso.getchild('codigo_tipo_reclamo',idw_detalle8)  // DEPTO
idw_detalle8.settransobject(sqlca)
idw_detalle8.insertrow(0)

dw_ingreso.getchild('serie',idw_detalle6)  // base
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

dw_ingreso.getchild('codigo_reclamo',idw_detalle7)  // depto
idw_detalle7.settransobject(sqlca)
idw_detalle7.insertrow(0)

dw_ingreso.getchild('area',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve(ll_cod_parque)

dw_ingreso.getchild('sector',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.retrieve(ll_cod_parque)

dw_ingreso.getchild('sepultura',idw_detalle3)  //Parque y Sector
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

dw_ingreso.getchild('usuario_asignado',idw_detalle4)
idw_detalle4.settransobject(sqlca)
idw_detalle4.retrieve(gs_user,ll_cod_parque)

dw_ingreso.getchild('ult_estado_gestion',idw_detalle5)	// depto
idw_detalle5.settransobject(sqlca)
idw_detalle5.retrieve()

ll_new				= dw_ingreso.insertrow(0)
dw_ingreso.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
dw_ingreso.setitem(ll_new,'cod_parque',ll_cod_parque)
dw_ingreso.setitem(ll_new,'usuario_crea',gs_user)
dw_ingreso.setitem(ll_new,'ult_estado_gestion',0)
dw_ingreso.setitem(ll_new,'ult_fecha_gestion',date(gdt_fec_sistema))
dw_ingreso.setitem(ll_new,'cod_estado_reg','V')
dw_ingreso.setitem(ll_new,'depto_crea',gs_depto)
dw_ingreso.setitem(ll_new,'origen','0')
dw_ingreso.Modify ( "DataWindow.header.height=0")
dw_ingreso.Modify ( "DataWindow.footer.height=0")
dw_ingreso.object.t_estado.text	= ''
il_veces									= 0
il_modif									= 0
ddplb_contratos.reset()
dw_ingreso.accepttext()
dw_ingreso.setfocus()
end event

event close;setnull(gi_numero);Setnull(gs_base);setnull(gs_serie);setnull(gi_rut)
end event

type cb_ing_gestion from commandbutton within w_ingreso_reclamo_original_bkp
integer x = 2574
integer y = 1904
integer width = 411
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar Gestión"
end type

event clicked;Datetime		ldt_fec_fin,ldt_fecha_comp,ldt_fec_ini,ldt_nulo
Long			ll_tot_reg,ll_cod_parque,ll_indi,ll_nro_reclamo,ll_reclamo,ll_fila

Setnull(ldt_nulo)
if isvalid(w_administrar_reclamos) then close(w_administrar_reclamos)
open(w_administrar_reclamos)
ll_cod_parque																= dw_ingreso.getitemnumber(1,'cod_parque')
ll_reclamo																	= dw_ingreso.getitemnumber(1,'numero_reclamo')
if ll_cod_parque > 0 and ll_reclamo > 0 then
	w_administrar_reclamos.tab_1.SelectedTab					= 3
	w_administrar_reclamos.gb_periodo.visible						= true
	w_administrar_reclamos.st_desde.visible						= true
	w_administrar_reclamos.em_inicio.visible						= true
	w_administrar_reclamos.p_inicio.visible							= true
	w_administrar_reclamos.st_hasta.visible							= true
	w_administrar_reclamos.em_termino.visible					= true
	w_administrar_reclamos.p_termino.visible						= true
	w_administrar_reclamos.cb_detalle_gestion.visible			= true
	w_administrar_reclamos.cb_gestionar.enabled					= true
	w_administrar_reclamos.cb_anular.enabled						= true
	w_administrar_reclamos.dw_parque.setitem(1,'parque',1)
	ll_cod_parque															= w_administrar_reclamos.dw_parque.getitemnumber(1,'parque')
	if w_administrar_reclamos.tab_1.tabpage_3.rb_requerimiento.checked=true then
		w_administrar_reclamos.st_busqueda.text					= 'N° Requerimiento'
	elseif w_administrar_reclamos.tab_1.tabpage_3.rb_rut_contacto.checked=true then
		w_administrar_reclamos.st_busqueda.text					= 'Rut Contacto'
	end if
	ldt_fec_ini								= datetime(date(w_administrar_reclamos.em_inicio.text),time('00:00:00'))
	ldt_fec_fin								= datetime(date(w_administrar_reclamos.em_termino.text),time('23:59:59'))
	if ldt_fec_ini>ldt_fec_fin then
		messagebox("Advertencia","Fecha Inicio No Puede ser Mayor a Fecha Término")
	else
		ll_tot_reg							= f_nivel_codigo(ll_cod_parque,ldt_fec_ini,ldt_fec_fin)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos Asigandos")
		else
			for ll_indi=1 to ll_tot_reg
				ll_nro_reclamo				= w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.getitemnumber(ll_indi,'numero_reclamo')
				ldt_fecha_comp			= f_calcular_dias_reclamo( ll_nro_reclamo )
				if isnull(ldt_fecha_comp) or ldt_fecha_comp = datetime(date('01/01/1901'),time('00:00:00')) then
					w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.setitem(ll_indi,'c_fecha_compromiso',ldt_nulo)
				else
					w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.setitem(ll_indi,'c_fecha_compromiso',ldt_fecha_comp)
				end if
			next
			ll_fila								= w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.Find("numero_reclamo ="+string(ll_reclamo), 1, ll_tot_reg)
			if ll_fila > 0 then
				w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.scrolltorow(ll_fila)
			end if
			w_administrar_reclamos.tab_1.tabpage_3.dw_asigna_lista.accepttext()
		end if
	end if
end if
end event

type ddplb_contratos from dropdownpicturelistbox within w_ingreso_reclamo_original_bkp
integer x = 3150
integer y = 540
integer width = 553
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 27000831
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

event selectionchanged;String		ls_string,ls_base,ls_serie,ls_estado,ls_sector,ls_descrip,ls_depto,ls_area,ls_sepultura
Long		ll_rut,ll_cod_parque,ll_mora_cred,ll_mora_mant,ll_largo
Double	ll_numero
ls_string					= trim(ddplb_contratos.text)
if not isnull(ls_string) then
	if mid(ls_string,1,1) = '[' then
		ll_largo			= len(ls_string)
		ls_string			= mid(ls_string,1,(ll_largo - 2))
		ls_string			= mid(ls_string,3)
		ls_base			= mid(ls_string,1,1)
		ls_serie			= mid(ls_string,3,1)
		ll_numero		= Double(mid(ls_string,5))
	else
		ls_base			= mid(ls_string,1,1)
		ls_serie			= mid(ls_string,3,1)
		ll_numero		= Double(mid(ls_string,5))
	end if
	if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
		idw_detalle6.retrieve(ls_base)
		SELECT		"CADENA"."ESTADO" ,
						"CADENA"."RUT",
						"CADENA"."COD_PARQUE",
						"CADENA_MORA"."MORA_CRED",
						"CADENA_MORA"."MORA_MANT"
		INTO 			:ls_estado,
						:ll_rut,
						:ll_cod_parque,
						:ll_mora_cred,
						:ll_mora_mant
		FROM 		"CADENA",
						"CADENA_MORA"
		WHERE 	  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) AND  
					  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
					  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" )  AND
					  ( "CADENA"."CODIGO" = :ls_base ) AND  
					  ( "CADENA"."SERIE" = :ls_serie ) AND  
					  ( "CADENA"."NUMERO" = :ll_numero )  
		USING		sqlca;
		if sqlca.sqlcode= 0 then
			if ls_base='O' then
				SELECT	"PAGO_OFERTA"."SECTOR",
							"PAGO_OFERTA"."AREA",
							"PAGO_OFERTA"."SEPULTURA"
				INTO 		:ls_sector,
							:ls_area,
							:ls_sepultura
				FROM 	"OFERTA_V",   
							"PAGO_OFERTA",   
							"CADENA"  
				WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						  ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						  ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
						  ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
						  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
						  ( "CADENA"."SERIE" = :ls_serie ) AND  
						  ( "CADENA"."NUMERO" = :ll_numero ) )   
				USING	sqlca;

			elseif ls_base='C' then
				SELECT	"CONTRATO"."SECTOR",
							"CONTRATO"."ZONA",
							"CONTRATO"."SEPULTURA"
				INTO 		:ls_sector,
							:ls_area,
							:ls_sepultura
				FROM 	"CADENA",   
							"CONTRATO"  
				WHERE ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						  ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
						  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
						  ( "CADENA"."SERIE" = :ls_serie ) AND  
						  ( "CADENA"."NUMERO" = :ll_numero ) ) 
				USING	sqlca;
			end if
			
			idw_detalle.retrieve(ll_cod_parque)
			idw_detalle2.retrieve(ll_cod_parque)
			SELECT	"ESTADO"."NOMBRE_ESTADO"  
			INTO		:ls_descrip  
			FROM		"ESTADO"  
			WHERE	"ESTADO"."COD_ESTADO" = :ls_estado   ;
			ls_estado																= 'Estado Contrato:  '+ls_descrip
			dw_ingreso.object.t_estado.text			= ls_estado
			dw_ingreso.object.t_mora_cred.text		= 'Mora Crédito ('+string(ll_mora_cred,'###,##0')+')'
			dw_ingreso.object.t_mora_mant.text		= 'Mora Mantención ('+string(ll_mora_mant,'###,##0')+')'
			dw_ingreso.setitem(1,'base',ls_base)
			dw_ingreso.setitem(1,'serie',ls_serie)
			dw_ingreso.setitem(1,'numero',ll_numero)
			dw_ingreso.setitem(1,'area',ls_area)
			dw_ingreso.setitem(1,'sector',ls_sector)
			dw_ingreso.setitem(1,'sepultura',ls_sepultura)
			dw_ingreso.setitem(1,'cod_parque',ll_cod_parque)
			dw_ingreso.accepttext()
		end if
	else
		idw_detalle6.reset()
		idw_detalle6.insertrow(0)
	end if
	if ll_cod_parque > 0 then
		idw_detalle.retrieve(ll_cod_parque)
		idw_detalle2.retrieve(ll_cod_parque)
		if not isnull(ls_sector) then
			idw_detalle3.retrieve(ll_cod_parque,ls_sector)
		else
			idw_detalle3.reset()
			idw_detalle3.insertrow(0)
		end if
	else
		idw_detalle.reset()
		idw_detalle2.reset()
		idw_detalle3.reset()
		idw_detalle.insertrow(0)
		idw_detalle2.insertrow(0)
		idw_detalle3.insertrow(0)
	end if
	ls_depto				= gs_depto
	if not isnull(ls_depto) then
		idw_detalle7.retrieve(ls_depto)
		idw_detalle8.retrieve(ls_depto)
	else
		idw_detalle7.reset()
		idw_detalle8.reset()
		idw_detalle7.insertrow(0)
		idw_detalle8.insertrow(0)
	end if
	idw_detalle4.retrieve(gs_user,ll_cod_parque)
	idw_detalle5.retrieve()
	dw_ingreso.accepttext()
	dw_ingreso.setfocus()
end if
end event

type cb_detalle_gestion from commandbutton within w_ingreso_reclamo_original_bkp
integer x = 2153
integer y = 1904
integer width = 384
integer height = 100
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Gestión"
end type

event clicked;string	ls_string,ls_cod_solic
long	ll_num_reclamo

if dw_ingreso.rowcount() > 0 then
	ll_num_reclamo				= dw_ingreso.getitemnumber(1,'numero_reclamo')
	ls_cod_solic						= dw_ingreso.getitemstring(1,'codigo_solicitud')
	if not isnull(ll_num_reclamo) and ll_num_reclamo>0 then
		ls_string						= string(ll_num_reclamo)+'~t'+ls_cod_solic
		if isvalid(w_detalle_gestion) then close(w_detalle_gestion)
		OpenWithParm (w_detalle_gestion,ls_string)
	end if
end if
end event

type cb_fallecido from commandbutton within w_ingreso_reclamo_original_bkp
integer x = 1321
integer y = 1904
integer width = 416
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar Fellecido"
end type

event clicked;Long		ll_cod_parque
String		ls_cod_sol

ll_cod_parque		= dw_ingreso.getitemnumber(1,'cod_parque')
ls_cod_sol			= dw_ingreso.getitemstring(1,'codigo_solicitud')
if ll_cod_parque > 0 and not isnull(ls_cod_sol) then
	if isvalid(w_opcion_buscar_por_fallecido_requerimientos) then close(w_opcion_buscar_por_fallecido_requerimientos)
	open(w_opcion_buscar_por_fallecido_requerimientos)
end if
end event

type cb_ctacte from commandbutton within w_ingreso_reclamo_original_bkp
integer x = 1737
integer y = 1904
integer width = 416
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;Long		ll_rut_titular,ll_rut_cotizante
Double	ll_numero
String		ls_nom,ls_base,ls_serie

if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
if isvalid(w_listado_contratos) then close(w_listado_contratos)
ll_rut_titular					= dw_ingreso.getitemnumber(1,'rut_titular')
ls_base						= dw_ingreso.getitemstring(1,'base')
ls_serie						= dw_ingreso.getitemstring(1,'serie')
ll_numero					= dw_ingreso.getitemnumber(1,'numero')
SELECT	"CLIENTE"."NOMBRE"  
INTO 		:ls_nom  
FROM 	"CLIENTE"  
WHERE 	"CLIENTE"."RUT" = :ll_rut_titular   
USING	sqlca;
if sqlca.sqlcode=0 then
	gi_rut 					= ll_rut_titular
	gi_tipo_busqueda		= 1
	Open(w_listado_contratos)
else
	if ll_numero > 0 and not isnull(ls_base) and not isnull(ls_serie) then
		gi_numero			= ll_numero
		gs_base				= ls_base
		gs_serie				= ls_serie
		CHOOSE CASE gs_base
			CASE "O" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				Open(w_cuenta_corriente_funeraria)
		END CHOOSE
	end if
end if

end event

type cb_print from commandbutton within w_ingreso_reclamo_original_bkp
integer x = 1033
integer y = 1904
integer width = 251
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Long		ll_reclamo

ll_reclamo		= dw_ingreso.getitemnumber(1,'numero_reclamo')
if ll_reclamo > 0 then
	dw_ingreso.Modify ( "DataWindow.header.height=208")
	dw_ingreso.Modify ( "DataWindow.footer.height=600")
	dw_ingreso.Object.DataWindow.Zoom = 95
	f_Print( dw_ingreso )
	dw_ingreso.Object.DataWindow.Zoom = 100
	dw_ingreso.Modify ( "DataWindow.header.height=0")
	dw_ingreso.Modify ( "DataWindow.footer.height=0")
	
end if
end event

type cb_anular from commandbutton within w_ingreso_reclamo_original_bkp
integer x = 558
integer y = 1904
integer width = 233
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Anular"
end type

event clicked;Long		ll_res,ll_reclamo

ll_reclamo		= dw_ingreso.getitemnumber(1,'numero_reclamo')
if ll_reclamo > 0 then
	ll_res				= messagebox("Anular","Está Seguro(a) Anular Solicitud Requerimiento Nº "+string(ll_reclamo,'###,###,###,##0'),Exclamation!,YesNo!,2)
	if ll_res=1 then
		dw_ingreso.setitem(1,'cod_estado_reg','A')
		if dw_ingreso.update()=1 then
			commit;
			messagebox("Anular","Anulación Exitosa")
		else
			rollback;
			messagebox("Error Anular","Error al Anular Requerimiento SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_buscar from commandbutton within w_ingreso_reclamo_original_bkp
integer x = 320
integer y = 1904
integer width = 233
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;if isvalid(w_buscar_reclamos) then close(w_buscar_reclamos)
open(w_buscar_reclamos)
end event

type cb_limpiar from commandbutton within w_ingreso_reclamo_original_bkp
integer x = 795
integer y = 1904
integer width = 233
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		ll_new,ll_cod_parque

SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
dw_ingreso.reset()
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_cod_parque	= 11
elseif gs_conexion	= "Parque Concepción" then
	ll_cod_parque	= 801
end if
dw_ingreso.getchild('codigo_tipo_reclamo',idw_detalle8)  // depto
idw_detalle8.settransobject(sqlca)
idw_detalle8.insertrow(0)

dw_ingreso.getchild('serie',idw_detalle6)  // base
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

dw_ingreso.getchild('codigo_reclamo',idw_detalle7)  // depto
idw_detalle7.settransobject(sqlca)
idw_detalle7.insertrow(0)

dw_ingreso.getchild('area',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve(ll_cod_parque)

dw_ingreso.getchild('sector',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.retrieve(ll_cod_parque)

dw_ingreso.getchild('sepultura',idw_detalle3)  //Parque y Sector
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

dw_ingreso.getchild('usuario_asignado',idw_detalle4)
idw_detalle4.settransobject(sqlca)
idw_detalle4.retrieve(gs_user,9999)

dw_ingreso.getchild('ult_estado_gestion',idw_detalle5)	// depto
idw_detalle5.settransobject(sqlca)
idw_detalle5.retrieve()

ll_new										= dw_ingreso.insertrow(0)
dw_ingreso.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
dw_ingreso.setitem(ll_new,'cod_parque',ll_cod_parque)
dw_ingreso.setitem(ll_new,'usuario_crea',gs_user)
dw_ingreso.setitem(ll_new,'ult_estado_gestion',0)
dw_ingreso.setitem(ll_new,'ult_fecha_gestion',date(gdt_fec_sistema))
dw_ingreso.setitem(ll_new,'cod_estado_reg','V')
dw_ingreso.setitem(ll_new,'depto_crea',gs_depto)
dw_ingreso.setitem(ll_new,'origen','0')
dw_ingreso.Modify ( "DataWindow.header.height=0")
dw_ingreso.Modify ( "DataWindow.footer.height=0")
dw_ingreso.object.t_estado.text		= ''
dw_ingreso.object.t_mora_cred.text	= ''
dw_ingreso.object.t_mora_mant.text	= ''
il_veces										= 0
ddplb_contratos.reset()
dw_ingreso.accepttext()
dw_ingreso.setfocus()
end event

type cb_cerrar from commandbutton within w_ingreso_reclamo_original_bkp
integer x = 3387
integer y = 1904
integer width = 325
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_reclamo)
end event

type cb_grabar from commandbutton within w_ingreso_reclamo_original_bkp
integer x = 23
integer y = 1904
integer width = 261
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_reclamo,ll_cod_parque,ll_rut_titular,ll_cod_reclamo,ll_cod_asig,ll_rut_contacto,ll_ult_cod_gestion,ll_max,ll_res
String		ls_cod_solicitud	,ls_usuario_asig,ls_depto_asig,	ls_ult_glosa,ls_glosa,ls_pasa,ls_nom_contacto,ls_ap_pat_contacto,ls_email,ls_fono_part,&
			ls_fono_comer,ls_celular,ls_base,ls_serie,ls_area,ls_sepultura,ls_cod_gerencia,ls_ap_mat_contacto,ls_sector,ls_est_ctto,ls_mora_cred,ls_mora_mant,&
			ls_nivel
Datetime	ldt_nulo
Double	ll_numero
SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
Setnull(ldt_nulo)
dw_ingreso.accepttext()
ll_reclamo							= dw_ingreso.getitemnumber(1,'numero_reclamo')
if ll_reclamo > 0 then
	ls_pasa							= wf_validar()
	if ls_pasa='S' then
		ls_usuario_asig				= trim(dw_ingreso.getitemstring(1,'usuario_asignado'))
		ls_nom_contacto			= trim(dw_ingreso.getitemstring(1,'nombre_contacto'))
		ls_ap_pat_contacto		= trim(dw_ingreso.getitemstring(1,'a_paterno_contacto'))
		ls_email						= trim(dw_ingreso.getitemstring(1,'email'))
		ls_fono_part					= trim(dw_ingreso.getitemstring(1,'fono_particular'))
		ls_fono_comer				= trim(dw_ingreso.getitemstring(1,'fono_comercial'))
		ls_celular					= trim(dw_ingreso.getitemstring(1,'celular'))
		ls_ult_glosa					= trim(dw_ingreso.getitemstring(1,'ult_glosa_gestion'))
		ll_ult_cod_gestion			= dw_ingreso.getitemnumber(1,'ult_estado_gestion')
		if len(ls_nom_contacto) > 20 then
			ls_nom_contacto		= mid(ls_nom_contacto,1,20)
			dw_ingreso.setitem(1,'nombre_contacto',ls_nom_contacto)
		end if
		if len(ls_ap_pat_contacto) > 20 then
			ls_ap_pat_contacto	= mid(ls_ap_pat_contacto,1,20)
			dw_ingreso.setitem(1,'a_paterno_contacto',ls_ap_pat_contacto)
		end if
		if len(ls_email) > 25 then
			ls_email					= mid(ls_email,1,25)
			dw_ingreso.setitem(1,'email',ls_email)
		end if
		if len(ls_fono_part) > 25 then
			ls_fono_part				= mid(ls_fono_part,1,25)
			dw_ingreso.setitem(1,'fono_particular',ls_fono_part)
		end if
		if len(ls_fono_comer) > 25 then
			ls_fono_comer			= mid(ls_fono_comer,1,25)
			dw_ingreso.setitem(1,'fono_comercial',ls_fono_comer)
		end if
		if len(ls_celular) > 25 then
			ls_celular				= mid(ls_celular,1,25)
			dw_ingreso.setitem(1,'celular',ls_celular)
		end if
		if len(ls_ult_glosa) > 2000 then
			ls_ult_glosa				= mid(ls_ult_glosa,1,2000)
			dw_ingreso.setitem(1,'ult_glosa_gestion',ls_ult_glosa)
		end if
		dw_ingreso.setitem(1,'usuario_modif',gs_user)
		dw_ingreso.setitem(1,'fecha_modif',gdt_fec_sistema)
		if isnull(ls_email) then
			ls_email					= ''
		end if
		if isnull(ls_fono_part) then
			ls_fono_part				= ''
		end if
		if isnull(ls_fono_comer) then
			ls_fono_comer			= ''
		end if
		if isnull(ls_celular)then
			ls_celular				= ''
		end if
		if len(ls_email) < 2  and len(ls_fono_part) < 2  and len(ls_fono_comer) < 2 and len(ls_celular) < 2  then
			messagebox("Advertencia","Debe Ingresar por lo menos un dato de Contacto (Email - Fono Particular - Fono Comercial - Celular)")
			dw_ingreso.setcolumn('email')
			dw_ingreso.setfocus()
		else
			dw_ingreso.accepttext()
			if dw_ingreso.update()=1 then
				commit;
				ls_sector						= dw_ingreso.getitemstring(1,'sector')
				ls_sepultura					= dw_ingreso.getitemstring(1,'sepultura')
				ll_res							= messagebox("Grabar","Grabación Exitosa, desea Ingresar Nuevo Requerimiento a Sepultura "+ls_sector+'-'+ls_sepultura,Exclamation!,YesNo!,2)
				if ll_res=1 then
					ls_cod_solicitud			= dw_ingreso.getitemstring(1,'codigo_solicitud')
					ll_cod_parque			= dw_ingreso.getitemnumber(1,'cod_parque')
					ls_base					= dw_ingreso.getitemstring(1,'base')
					ls_serie					= dw_ingreso.getitemstring(1,'serie')
					ll_numero				= dw_ingreso.getitemnumber(1,'numero')
					ll_rut_titular				= dw_ingreso.getitemnumber(1,'rut_titular')
					ll_cod_reclamo			= dw_ingreso.getitemnumber(1,'codigo_reclamo')
					ls_area					= dw_ingreso.getitemstring(1, 'area')
					ls_cod_gerencia		= dw_ingreso.getitemstring(1,'cod_gerencia_asignado')
					ls_usuario_asig			= dw_ingreso.getitemstring(1,'usuario_asignado')
					ls_depto_asig			= dw_ingreso.getitemstring(1,'depto_asig')
					ll_rut_contacto			= dw_ingreso.getitemnumber(1,'rut_contacto')
					ls_nom_contacto		= dw_ingreso.getitemstring(1,'nombre_contacto')
					ls_ap_pat_contacto	= dw_ingreso.getitemstring(1,'a_paterno_contacto')
					ls_ap_mat_contacto	= dw_ingreso.getitemstring(1,'a_materno_contacto')
					ls_email					= dw_ingreso.getitemstring(1,'email')
					ls_fono_part				= dw_ingreso.getitemstring(1,'fono_particular')
					ls_fono_comer			= dw_ingreso.getitemstring(1,'fono_comercial')
					ls_celular				= dw_ingreso.getitemstring(1,'celular')
					ls_nivel					= dw_ingreso.getitemstring(1,'nivel')
					ls_est_ctto				= dw_ingreso.object.t_estado.text
					ls_mora_cred			= dw_ingreso.object.t_mora_cred.text
					ls_mora_mant			= dw_ingreso.object.t_mora_mant.text
					cb_limpiar.triggerevent(clicked!)
					dw_ingreso.setitem(1,'codigo_solicitud',ls_cod_solicitud)
					dw_ingreso.setitem(1,'cod_parque',ll_cod_parque)
					dw_ingreso.setitem(1,'base',ls_base)
					dw_ingreso.setitem(1,'serie',ls_serie)
					dw_ingreso.setitem(1,'numero',ll_numero)
					dw_ingreso.setitem(1,'rut_titular',ll_rut_titular)
//					dw_ingreso.setitem(1,'codigo_reclamo',ll_cod_reclamo)
					dw_ingreso.setitem(1, 'area',ls_area)
					dw_ingreso.setitem(1,'sector',ls_sector)
					dw_ingreso.setitem(1,'sepultura',ls_sepultura)
					dw_ingreso.setitem(1,'cod_gerencia_asignado',ls_cod_gerencia)
					dw_ingreso.setitem(1,'usuario_asignado',ls_usuario_asig)
					dw_ingreso.setitem(1,'depto_asig',ls_depto_asig)
					dw_ingreso.setitem(1,'rut_contacto',ll_rut_contacto)
					dw_ingreso.setitem(1,'nombre_contacto',ls_nom_contacto)
					dw_ingreso.setitem(1,'a_paterno_contacto',ls_ap_pat_contacto)
					dw_ingreso.setitem(1,'a_materno_contacto',ls_ap_mat_contacto)
					dw_ingreso.setitem(1,'email',ls_email)
					dw_ingreso.setitem(1,'fono_particular',ls_fono_part)
					dw_ingreso.setitem(1,'fono_comercial',ls_fono_comer)
					dw_ingreso.setitem(1,'celular',ls_celular)
					dw_ingreso.setitem(1,'nivel',ls_nivel)
					dw_ingreso.object.t_estado.text		= ls_est_ctto
					dw_ingreso.object.t_mora_cred.text	= ls_mora_cred
					dw_ingreso.object.t_mora_mant.text	= ls_mora_mant
					dw_ingreso.accepttext()
					dw_ingreso.setfocus()
					dw_ingreso.setcolumn('codigo_reclamo')
				else
//					cb_limpiar.triggerevent(clicked!)
				end if
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Requerimiento SQL: "+sqlca.sqlerrtext)
			end if	
		end if
	end if
else
	ls_pasa							= wf_validar()
	if ls_pasa='S' then
		ls_nom_contacto			= trim(dw_ingreso.getitemstring(1,'nombre_contacto'))
		ls_ap_pat_contacto		= trim(dw_ingreso.getitemstring(1,'a_paterno_contacto'))
		ls_email						= trim(dw_ingreso.getitemstring(1,'email'))
		ls_fono_part					= trim(dw_ingreso.getitemstring(1,'fono_particular'))
		ls_fono_comer				= trim(dw_ingreso.getitemstring(1,'fono_comercial'))
		ls_celular					= trim(dw_ingreso.getitemstring(1,'celular'))
		ls_ult_glosa					= trim(dw_ingreso.getitemstring(1,'ult_glosa_gestion'))
		if len(ls_nom_contacto) > 20 then
			ls_nom_contacto		= mid(ls_nom_contacto,1,20)
			dw_ingreso.setitem(1,'nombre_contacto',ls_nom_contacto)
		end if
		if len(ls_ap_pat_contacto) > 20 then
			ls_ap_pat_contacto	= mid(ls_ap_pat_contacto,1,20)
			dw_ingreso.setitem(1,'a_paterno_contacto',ls_ap_pat_contacto)
		end if
		if len(ls_email) > 25 then
			ls_email					= mid(ls_email,1,25)
			dw_ingreso.setitem(1,'email',ls_email)
		end if
		if len(ls_fono_part) > 25 then
			ls_fono_part				= mid(ls_fono_part,1,25)
			dw_ingreso.setitem(1,'fono_particular',ls_fono_part)
		end if
		if len(ls_fono_comer) > 25 then
			ls_fono_comer			= mid(ls_fono_comer,1,25)
			dw_ingreso.setitem(1,'fono_comercial',ls_fono_comer)
		end if
		if len(ls_celular) > 25 then
			ls_celular				= mid(ls_celular,1,25)
			dw_ingreso.setitem(1,'celular',ls_celular)
		end if
		if len(ls_ult_glosa) > 2000 then
			ls_ult_glosa				= mid(ls_ult_glosa,1,2000)
			dw_ingreso.setitem(1,'ult_glosa_gestion',ls_ult_glosa)
		end if
		if isnull(ls_email) then
			ls_email					= ''
		end if
		if isnull(ls_fono_part) then
			ls_fono_part				= ''
		end if
		if isnull(ls_fono_comer) then
			ls_fono_comer			= ''
		end if
		if isnull(ls_celular)then
			ls_celular				= ''
		end if
		ls_ult_glosa					= dw_ingreso.getitemstring(1,'ult_glosa_gestion')
		if len(ls_email) < 2  and len(ls_fono_part) < 2  and len(ls_fono_comer) < 2 and len(ls_celular) < 2  then
			messagebox("Advertencia","Debe Ingresar por lo menos un dato de Contacto (Email - Fono Particular - Fono Comercial - Celular)")
			dw_ingreso.setcolumn('email')
			dw_ingreso.setfocus()
		else
			SELECT	MAX("RECLAMO_SOLICITUD"."NUMERO_RECLAMO")
			INTO 		:ll_max  
			FROM 	"RECLAMO_SOLICITUD"  
			USING	sqlca;
			if ll_max > 0 then
				ll_max ++
			else
				ll_max					= 1
			end if
			dw_ingreso.setitem(1,'numero_reclamo',ll_max)
			dw_ingreso.setitem(1,'ult_fecha_gestion',gdt_fec_sistema)
			dw_ingreso.setitem(1,'glosa_reclamo_original',ls_ult_glosa)
			ll_ult_cod_gestion		= dw_ingreso.getitemnumber(1,'ult_estado_gestion')
			ls_usuario_asig			= dw_ingreso.getitemstring(1,'usuario_asignado')
			if ls_usuario_asig = gs_user and ll_ult_cod_gestion=4  then
				dw_ingreso.setitem(1,'nivel','3')
			else
				dw_ingreso.setitem(1,'nivel','2')
			end if
			dw_ingreso.accepttext()
			if dw_ingreso.update()=1 then
				commit;
				ls_cod_solicitud			= dw_ingreso.getitemstring(1,'codigo_solicitud')
				ll_cod_parque			= dw_ingreso.getitemnumber(1,'cod_parque')
				ll_rut_titular				= dw_ingreso.getitemnumber(1,'rut_titular')
				ll_cod_reclamo			= dw_ingreso.getitemnumber(1,'codigo_reclamo')
				ls_depto_asig			= dw_ingreso.getitemstring(1,'depto_asig')
				ll_rut_contacto			= dw_ingreso.getitemnumber(1,'rut_contacto')
				
				if ls_usuario_asig = gs_user and ll_ult_cod_gestion=4  then
					INSERT INTO 	  "RECLAMO_SOLICITUD_DETALLE"  
										( "NUMERO_RECLAMO",		"CODIGO_SOLICITUD",	"FECHA_CREA",	"USUARIO_CREA",		"CODIGO_GESTION",		"FECHA_GESTION",	"OBSERVACION",	"GLOSA_GESTION",	"RUT_CONTACTO",	"COD_PARQUE",	"USUARIO_ASIG",		"DEPTO_ASIG",		"NIVEL",		"FECHA_COMPROMISO" )  
					VALUES 			( :ll_max, 						:ls_cod_solicitud, 			:gdt_fec_sistema,	:gs_user,				2,								:gdt_fec_sistema,		:ls_ult_glosa,		:ls_ult_glosa,			:ll_rut_contacto, 		:ll_cod_parque, 	:ls_usuario_asig, 		:ls_depto_asig, 	'2',				:ldt_nulo)  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
				INSERT INTO 	  "RECLAMO_SOLICITUD_DETALLE"  
									( "NUMERO_RECLAMO",		"CODIGO_SOLICITUD",	"FECHA_CREA",	"USUARIO_CREA",		"CODIGO_GESTION",		"FECHA_GESTION",	"OBSERVACION",	"GLOSA_GESTION",	"RUT_CONTACTO",	"COD_PARQUE",	"USUARIO_ASIG",		"DEPTO_ASIG",		"NIVEL",		"FECHA_COMPROMISO" )  
				VALUES 			( :ll_max, 						:ls_cod_solicitud, 			:gdt_fec_sistema,	:gs_user,				:ll_ult_cod_gestion,		:gdt_fec_sistema,		:ls_ult_glosa,		:ls_ult_glosa,			:ll_rut_contacto, 		:ll_cod_parque, 	:ls_usuario_asig, 		:ls_depto_asig, 	'2',				:ldt_nulo)  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				ls_sector						= dw_ingreso.getitemstring(1,'sector')
				ls_sepultura					= dw_ingreso.getitemstring(1,'sepultura')
				ll_res							= messagebox("Grabar","Grabación Exitosa, desea Ingresar Nuevo Requerimiento a Sepultura "+ls_sector+'-'+ls_sepultura,Exclamation!,YesNo!,2)
				if ll_res=1 then
					ls_cod_solicitud			= dw_ingreso.getitemstring(1,'codigo_solicitud')
					ll_cod_parque			= dw_ingreso.getitemnumber(1,'cod_parque')
					ls_base					= dw_ingreso.getitemstring(1,'base')
					ls_serie					= dw_ingreso.getitemstring(1,'serie')
					ll_numero				= dw_ingreso.getitemnumber(1,'numero')
					ll_rut_titular				= dw_ingreso.getitemnumber(1,'rut_titular')
					ll_cod_reclamo			= dw_ingreso.getitemnumber(1,'codigo_reclamo')
					ls_area					= dw_ingreso.getitemstring(1, 'area')
					ls_cod_gerencia		= dw_ingreso.getitemstring(1,'cod_gerencia_asignado')
					ls_usuario_asig			= dw_ingreso.getitemstring(1,'usuario_asignado')
					ls_depto_asig			= dw_ingreso.getitemstring(1,'depto_asig')
					ll_rut_contacto			= dw_ingreso.getitemnumber(1,'rut_contacto')
					ls_nom_contacto		= dw_ingreso.getitemstring(1,'nombre_contacto')
					ls_ap_pat_contacto	= dw_ingreso.getitemstring(1,'a_paterno_contacto')
					ls_ap_mat_contacto	= dw_ingreso.getitemstring(1,'a_materno_contacto')
					ls_email					= dw_ingreso.getitemstring(1,'email')
					ls_fono_part				= dw_ingreso.getitemstring(1,'fono_particular')
					ls_fono_comer			= dw_ingreso.getitemstring(1,'fono_comercial')
					ls_celular				= dw_ingreso.getitemstring(1,'celular')
					ls_est_ctto				= dw_ingreso.object.t_estado.text
					ls_mora_cred			= dw_ingreso.object.t_mora_cred.text
					ls_mora_mant			= dw_ingreso.object.t_mora_mant.text
					cb_limpiar.triggerevent(clicked!)
					dw_ingreso.setitem(1,'codigo_solicitud',ls_cod_solicitud)
					dw_ingreso.setitem(1,'cod_parque',ll_cod_parque)
					dw_ingreso.setitem(1,'base',ls_base)
					dw_ingreso.setitem(1,'serie',ls_serie)
					dw_ingreso.setitem(1,'numero',ll_numero)
					dw_ingreso.setitem(1,'rut_titular',ll_rut_titular)
//					dw_ingreso.setitem(1,'codigo_reclamo',ll_cod_reclamo)
					dw_ingreso.setitem(1, 'area',ls_area)
					dw_ingreso.setitem(1,'sector',ls_sector)
					dw_ingreso.setitem(1,'sepultura',ls_sepultura)
					dw_ingreso.setitem(1,'cod_gerencia_asignado',ls_cod_gerencia)
					dw_ingreso.setitem(1,'usuario_asignado',ls_usuario_asig)
					dw_ingreso.setitem(1,'depto_asig',ls_depto_asig)
					dw_ingreso.setitem(1,'rut_contacto',ll_rut_contacto)
					dw_ingreso.setitem(1,'nombre_contacto',ls_nom_contacto)
					dw_ingreso.setitem(1,'a_paterno_contacto',ls_ap_pat_contacto)
					dw_ingreso.setitem(1,'a_materno_contacto',ls_ap_mat_contacto)
					dw_ingreso.setitem(1,'email',ls_email)
					dw_ingreso.setitem(1,'fono_particular',ls_fono_part)
					dw_ingreso.setitem(1,'fono_comercial',ls_fono_comer)
					dw_ingreso.setitem(1,'celular',ls_celular)
					dw_ingreso.setitem(1,'nivel',ls_nivel)
					dw_ingreso.object.t_estado.text		= ls_est_ctto
					dw_ingreso.object.t_mora_cred.text	= ls_mora_cred
					dw_ingreso.object.t_mora_mant.text	= ls_mora_mant
					dw_ingreso.accepttext()
					dw_ingreso.setfocus()
					dw_ingreso.setcolumn('codigo_reclamo')
				else
//					cb_limpiar.triggerevent(clicked!)
				end if
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Requerimiento SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
end if
end event

type dw_ingreso from datawindow within w_ingreso_reclamo_original_bkp
integer x = 23
integer y = 24
integer width = 3703
integer height = 1840
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_reclamo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_base,ls_depto,ls_sector,ls_cod_gerencia,ls_nulo,ls_serie,ls_estado,ls_nombre,ls_codigo_sol,ls_area,ls_sepultura,ls_descrip,&
			ls_usuario_asig,ls_depto_asig,ls_gerencia_asig,ls_anexo,ls_fono,ls_celular,ls_email,ls_ap_pat,ls_ap_mat,ls_fono_p,ls_fono_c,ls_nombre_usu,&
			ls_resto_nom,ls_nivel,ls_string
long		ll_cod_parque,ll_nulo,ll_estado,ll_rut,ll_mora_cred,ll_mora_mant,ll_cod_parque_usuario
Double	ll_numero
Setnull(ls_nulo);setnull(ll_nulo)
this.accepttext()
SELECT	"ENCARGADOS"."COD_PARQUE"  
INTO 		:ll_cod_parque_usuario
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;

ls_columna				= dwo.name
if ls_columna='cod_parque' then
	ll_cod_parque		= dw_ingreso.getitemnumber(1,'cod_parque')
	idw_detalle.retrieve(ll_cod_parque)
	idw_detalle2.retrieve(ll_cod_parque)
	if ll_cod_parque_usuario = 9999 then 
		idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario)
	else
		idw_detalle4.retrieve(gs_user,ll_cod_parque)
	end if
	
elseif ls_columna='base' or ls_columna='serie' or ls_columna='numero' then
	ls_base				= dw_ingreso.getitemstring(1,'base')
	ls_serie				= dw_ingreso.getitemstring(1,'serie')
	ll_numero			= dw_ingreso.getitemnumber(1,'numero')
	if not isnull(ls_base) then idw_detalle6.retrieve(ls_base)
	if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
		SELECT		"CADENA"."ESTADO" ,
						"CADENA"."RUT",
						"CADENA"."COD_PARQUE",
						"CADENA_MORA"."MORA_CRED",
						"CADENA_MORA"."MORA_MANT"
		INTO 			:ls_estado,
						:ll_rut,
						:ll_cod_parque,
						:ll_mora_cred,
						:ll_mora_mant
		FROM 		"CADENA",
						"CADENA_MORA"
		WHERE 	  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) AND  
					  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
					  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" )  AND
					  ( "CADENA"."CODIGO" = :ls_base ) AND  
					  ( "CADENA"."SERIE" = :ls_serie ) AND  
					  ( "CADENA"."NUMERO" = :ll_numero )  
		USING		sqlca;
		if sqlca.sqlcode<>0 then
			SELECT 		"CD_FOLIO"."ULT_ESTADO"  
			INTO 			:ll_estado  
			FROM 		"CD_FOLIO"  
			WHERE 	  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
						  ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						  ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				messagebox("Advertencia","No Existe Nº Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,##0'))
			end if
		else
			SELECT	"ESTADO"."NOMBRE_ESTADO"  
			INTO		:ls_descrip  
			FROM		"ESTADO"  
			WHERE	"ESTADO"."COD_ESTADO" = :ls_estado   ;
			ls_estado								= 'Estado Contrato:  '+ls_descrip
			dw_ingreso.object.t_estado.text	= ls_estado
			
			dw_ingreso.object.t_mora_cred.text	= 'Mora Crédito ('+string(ll_mora_cred,'###,##0')+')'
			dw_ingreso.object.t_mora_mant.text	= 'Mora Mantención ('+string(ll_mora_mant,'###,##0')+')'
			if ls_base='O' then
				SELECT 		"PAGO_OFERTA"."AREA", 	"PAGO_OFERTA"."SECTOR", 	"PAGO_OFERTA"."SEPULTURA"  
				INTO 			:ls_area, 						:ls_sector,  							:ls_sepultura  
				FROM 		"OFERTA_V", 	"CADENA", 	"PAGO_OFERTA"  
				WHERE 	  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
							  ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
							  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							  ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							  ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
							  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
							  ( "CADENA"."SERIE" = :ls_serie ) AND  
							  ( "CADENA"."NUMERO" = :ll_numero ) )  
				USING		sqlca;
			elseif ls_base='C' then
				SELECT	"CONTRATO"."ZONA", 	"CONTRATO"."SECTOR",  	"CONTRATO"."SEPULTURA"  
				INTO 		:ls_area,   					:ls_sector,   					:ls_sepultura  
				FROM 	"CADENA",  	"CONTRATO"  
				WHERE ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						  ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
						  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
						  ( "CADENA"."SERIE" = :ls_serie ) AND  
						  ( "CADENA"."NUMERO" = :ll_numero ) )  
				USING		sqlca;
			end if
			if sqlca.sqlcode=0 then
				idw_detalle.retrieve(ll_cod_parque)
				idw_detalle2.retrieve(ll_cod_parque)
				idw_detalle3.retrieve(ll_cod_parque,ls_sector)
				dw_ingreso.setitem(1,'area',ls_area)
				dw_ingreso.setitem(1,'sector',ls_sector)
				dw_ingreso.setitem(1,'sepultura',ls_sepultura)
			end if
			if ll_cod_parque_usuario = 9999 then 
				idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario)
			else
				idw_detalle4.retrieve(gs_user,ll_cod_parque)
			end if
			dw_ingreso.setitem(1,'rut_titular',ll_rut)
			dw_ingreso.setitem(1,'cod_parque',ll_cod_parque)
			dw_ingreso.setcolumn('depto_asig')
		end if
	end if
elseif ls_columna='usuario_asignado' then
	ls_usuario_asig			= dw_ingreso.getitemstring(1,'usuario_asignado')
	SELECT	"ENCARGADOS"."DEPTO",   
				"ENCARGADOS"."RECLAMO_COG_GEREN",
				"ENCARGADOS"."NIVEL_RECLAMO"
	INTO		:ls_depto_asig,   
				:ls_gerencia_asig,
				:ls_nivel
	FROM 	"ENCARGADOS"  
	WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_asig   
	USING	sqlca;
	il_modif ++
	idw_detalle8.retrieve(ls_depto_asig)
	idw_detalle7.retrieve(ls_depto_asig)
	dw_ingreso.setitem(1,'cod_gerencia_asignado',ls_gerencia_asig)
	dw_ingreso.setitem(1,'depto_asig',ls_depto_asig)
	dw_ingreso.setitem(1,'nivel',ls_nivel)
	if ls_usuario_asig = gs_user then
		dw_ingreso.setitem(1,'ult_estado_gestion',4)
	else
		dw_ingreso.setitem(1,'ult_estado_gestion',0)
	end if
	dw_ingreso.setitem(1,'codigo_reclamo',ll_nulo)
	dw_ingreso.accepttext()
elseif ls_columna='rut_titular' then
	ddplb_contratos.reset()
	ll_rut					= dw_ingreso.getitemnumber(1,'rut_titular')
	SELECT 		"CLIENTE"."NOMBRE"  
	INTO 			:ls_nombre  
	FROM 		"CLIENTE"  
	WHERE 		"CLIENTE"."RUT" = :ll_rut  
	USING		sqlca;
	if sqlca.sqlcode <> 0 then
		messagebox("Advertencia","Rut Cliente Inexistente")
		dw_ingreso.setitem(1,'rut_titular',ll_nulo)
	else
		DECLARE x1 CURSOR FOR  
		SELECT		"CADENA"."CODIGO",   
						"CADENA"."SERIE",   
						"CADENA"."NUMERO",
						"CADENA"."ESTADO"
		FROM 		"CADENA"  
		WHERE 		"CADENA"."RUT" = :ll_rut  
		ORDER BY	"CADENA"."NUMERO" ASC
		USING	sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			do while sqlca.sqlcode=0
				fetch x1 into :ls_base, :ls_serie, :ll_numero, :ls_estado;
				if not isnull(ll_numero) then
					if ls_estado='V' or ls_estado='C' then
						ls_string		= ls_base+'-'+ls_serie+'-'+string(ll_numero)
					else
						ls_string		= '[ '+ls_base+'-'+ls_serie+'-'+string(ll_numero)+' ]'
					end if
					ddplb_contratos.additem(ls_string)
				end if
				Setnull(ll_numero)
			loop
		end if
		close x1;
		ddplb_contratos.setfocus()
	end if

elseif ls_columna='depto_asig' then
	ls_depto				= dw_ingreso.getitemstring(1,'depto_asig')
	ll_cod_parque		= dw_ingreso.getitemnumber(1,'cod_parque')
	idw_detalle7.retrieve(ls_depto)
	idw_detalle8.retrieve(ls_depto)
	SELECT	"RECLAMO_NIVEL"."CODIGO_GERENCIA"  
	INTO 		:ls_cod_gerencia  
	FROM 	"RECLAMO_NIVEL"  
	WHERE ( "RECLAMO_NIVEL"."CODIGO_DEPTO" = :ls_depto ) AND  
			  ( "RECLAMO_NIVEL"."NIVEL" = '2' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if ll_cod_parque_usuario = 9999 then 
			idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario)
		else
			idw_detalle4.retrieve(gs_user,ll_cod_parque)
		end if
		dw_ingreso.setitem(1,'cod_gerencia_asignado',ls_cod_gerencia)
	else
		dw_ingreso.setitem(1,'cod_gerencia_asignado',ls_nulo)
	end if
elseif ls_columna='sector' then
	ll_cod_parque		= dw_ingreso.getitemnumber(1,'cod_parque')
	ls_sector				= dw_ingreso.getitemstring(1,'sector')
	idw_detalle3.retrieve(ll_cod_parque,ls_sector)
elseif ls_columna='cod_gerencia_asignado' then
	ll_cod_parque		= dw_ingreso.getitemnumber(1,'cod_parque')
	ls_cod_gerencia	= dw_ingreso.getitemstring(1,'cod_gerencia_asignado')
	if ll_cod_parque_usuario = 9999 then 
		idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario)
	else
		idw_detalle4.retrieve(gs_user,ll_cod_parque)
	end if
elseif ls_columna='codigo_solicitud' then
	ls_codigo_sol		= dw_ingreso.getitemstring(1,'codigo_solicitud')
	ls_depto				= dw_ingreso.getitemstring(1,'depto_asig')
	if ls_codigo_sol='4' then
		SELECT	"ENCARGADOS"."NOMBRE",		"ENCARGADOS"."ANEXOS",		"ENCARGADOS"."FONO",		"ENCARGADOS"."CELULAR",		"ENCARGADOS"."RUT",	"ENCARGADOS"."EMAIL" 
		INTO 		:ls_nombre,							:ls_anexo,							:ls_fono,							:ls_celular,							:ll_rut,						:ls_email
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			dw_ingreso.setitem(1,'rut_contacto',ll_rut)
			dw_ingreso.setitem(1,'rut_titular',ll_rut)
			if len(ls_nombre) > 20 then
				ls_nombre_usu	= mid(ls_nombre,1,20)
				ls_resto_nom	= mid(ls_nombre,20)
				if len(ls_resto_nom) > 20 then
					ls_ap_pat	= mid(ls_resto_nom,1,20)
					ls_resto_nom	= mid(ls_resto_nom,20)
					if len(ls_resto_nom) > 20 then
						ls_ap_mat	= mid(ls_resto_nom,1,20)
					else
						ls_ap_mat	= ls_resto_nom
					end if
				else
					ls_ap_mat			= '-'
				end if
			else
				ls_nombre_usu		= ls_nombre
				ls_ap_pat			= '-'
				ls_ap_mat			= '-'
			end if
		end if
		if isnull(ls_nombre_usu) then ls_nombre_usu='-'
		if isnull(ls_ap_pat) then ls_ap_pat='-'
		if isnull(ls_ap_mat) then ls_ap_mat='-'
		if isnull(ls_fono) then ls_fono='-'
		if isnull(ls_anexo) then 
			ls_anexo				= '-'
		else
			ls_anexo				= 'ANEXO - '+ls_anexo
		end if
		if isnull(ls_celular) then ls_celular='-'
		if isnull(ls_email) then ls_email='-'
		dw_ingreso.setitem(1,'nombre_contacto',ls_nombre_usu)
		dw_ingreso.setitem(1,'a_paterno_contacto',ls_ap_pat)
		dw_ingreso.setitem(1,'a_materno_contacto',ls_ap_mat)
		dw_ingreso.setitem(1,'fono_particular',ls_fono)
		dw_ingreso.setitem(1,'fono_comercial',ls_anexo)
		dw_ingreso.setitem(1,'celular',ls_celular)
		dw_ingreso.setitem(1,'email',ls_email)
		idw_detalle8.retrieve(ls_depto)
	elseif ls_codigo_sol='5' then
		idw_detalle8.retrieve(ls_codigo_sol)
		dw_ingreso.setitem(1,'rut_contacto',ll_nulo)
		dw_ingreso.setitem(1,'rut_titular',ll_nulo)
		dw_ingreso.setitem(1,'nombre_contacto',ls_nulo)
		dw_ingreso.setitem(1,'a_paterno_contacto',ls_nulo)
		dw_ingreso.setitem(1,'a_materno_contacto',ls_nulo)
		dw_ingreso.setitem(1,'fono_particular',ls_nulo)
		dw_ingreso.setitem(1,'fono_comercial',ls_nulo)
		dw_ingreso.setitem(1,'celular',ls_nulo)
		dw_ingreso.setitem(1,'email',ls_nulo)
	else
		dw_ingreso.setitem(1,'rut_contacto',ll_nulo)
		dw_ingreso.setitem(1,'rut_titular',ll_nulo)
		dw_ingreso.setitem(1,'nombre_contacto',ls_nulo)
		dw_ingreso.setitem(1,'a_paterno_contacto',ls_nulo)
		dw_ingreso.setitem(1,'a_materno_contacto',ls_nulo)
		dw_ingreso.setitem(1,'fono_particular',ls_nulo)
		dw_ingreso.setitem(1,'fono_comercial',ls_nulo)
		dw_ingreso.setitem(1,'celular',ls_nulo)
		dw_ingreso.setitem(1,'email',ls_nulo)
	end if
end if	
this.accepttext()
end event

event itemfocuschanged;String		ls_base,ls_serie,ls_estado,ls_nulo,ls_nombre,ls_codigo_sol,ls_pasa,ls_usuario_asigna
Long		ll_estado,ll_nulo,ll_rut,ll_count_reg,ll_max_reclamo,ll_res,ll_cod_parque_usuario
datetime	ldt_ult_gestion
Double	ll_numero

Setnull(ls_nulo);Setnull(ll_nulo)
dw_ingreso.accepttext()
SELECT	"ENCARGADOS"."COD_PARQUE"  
INTO 		:ll_cod_parque_usuario
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
ls_base				= dw_ingreso.getitemstring(1,'base')
ls_serie				= dw_ingreso.getitemstring(1,'serie')
ll_numero			= dw_ingreso.getitemnumber(1,'numero')
if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 and il_veces = 0 then
	SELECT	COUNT("RECLAMO_SOLICITUD"."BASE")
	INTO 		:ll_count_reg  
	FROM 	"RECLAMO_SOLICITUD"  
	WHERE ( "RECLAMO_SOLICITUD"."BASE" = :ls_base ) AND  
			  ( "RECLAMO_SOLICITUD"."SERIE" = :ls_serie ) AND  
			  ( "RECLAMO_SOLICITUD"."NUMERO" = :ll_numero ) AND  
			  ( "RECLAMO_SOLICITUD"."COD_ESTADO_REG" <> 'A' )   
	USING	sqlca;
	if ll_count_reg > 0 then
		SELECT	MAX("RECLAMO_SOLICITUD"."ULT_FECHA_GESTION") 
		INTO		:ldt_ult_gestion
		FROM 	"RECLAMO_SOLICITUD" 
		WHERE 	"RECLAMO_SOLICITUD"."BASE" = :ls_base  AND  
					"RECLAMO_SOLICITUD"."SERIE" = :ls_serie AND  
					"RECLAMO_SOLICITUD"."NUMERO" = :ll_numero AND  
					"RECLAMO_SOLICITUD"."COD_ESTADO_REG" <> 'A' 
		USING	sqlca;
		
		SELECT	MAX("RECLAMO_SOLICITUD"."NUMERO_RECLAMO")
		INTO 		:ll_max_reclamo  
		FROM 	"RECLAMO_SOLICITUD"  
		WHERE ( "RECLAMO_SOLICITUD"."BASE" = :ls_base ) AND  
				  ( "RECLAMO_SOLICITUD"."SERIE" = :ls_serie ) AND  
				  ( "RECLAMO_SOLICITUD"."NUMERO" = :ll_numero ) AND  
				  ( "RECLAMO_SOLICITUD"."COD_ESTADO_REG" <> 'A' ) AND  
				  ( "RECLAMO_SOLICITUD"."ULT_FECHA_GESTION" = :ldt_ult_gestion)   
		USING	sqlca;
		ll_res			= messagebox("Advertencia","Contrato N° "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,##0')+' Registra '+string(ll_count_reg)+' Solicitudes de Requerimiento, Ultima Gestión el '+string(ldt_ult_gestion,'dd/mm/yyyy') +' N° '+string(ll_max_reclamo,'###,###,###,##0')+', desea continuar el Ingresar',Exclamation!,YesNo!,2)
		if ll_res=1 then
			il_veces ++
			ls_pasa		= 'S'
		else
			ls_pasa		= 'N'
			cb_limpiar.triggerevent(clicked!)
		end if
	else
		ls_pasa		= 'S'
	end if
	if ls_pasa='S' then
		SELECT		"CADENA"."ESTADO"  
		INTO 			:ls_estado  
		FROM 		"CADENA"  
		WHERE 	  ( "CADENA"."CODIGO" = :ls_base ) AND  
					  ( "CADENA"."SERIE" = :ls_serie ) AND  
					  ( "CADENA"."NUMERO" = :ll_numero )  
		USING		sqlca;
		if sqlca.sqlcode<>0 then
			SELECT 		"CD_FOLIO"."ULT_ESTADO"  
			INTO 			:ll_estado  
			FROM 		"CD_FOLIO"  
			WHERE 	  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
						  ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						  ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				dw_ingreso.setitem(1,'numero',ll_nulo)
				dw_ingreso.accepttext()
				dw_ingreso.setcolumn('numero')
			end if
		end if
	end if
end if
ls_codigo_sol		= dw_ingreso.getitemstring(1,'codigo_solicitud')
if ls_codigo_sol <> '4' then
	ll_rut				= dw_ingreso.getitemnumber(1,'rut_titular')
	SELECT 		"CLIENTE"."NOMBRE"  
	INTO 			:ls_nombre  
	FROM 		"CLIENTE"  
	WHERE 		"CLIENTE"."RUT" = :ll_rut  
	USING		sqlca;
	if sqlca.sqlcode <> 0 then
		dw_ingreso.setitem(1,'rut_titular',ll_nulo)
	end if
end if
if il_modif > 0 then
	ls_usuario_asigna	= dw_ingreso.getitemstring(1,'usuario_asignado')
	dw_ingreso.setitem(1,'codigo_reclamo',ll_nulo)
	il_modif				= 0
end if
dw_ingreso.accepttext()
end event

event clicked;String		ls_columna,ls_nom,ls_ap_pat,ls_ap_mat,ls_fono_p,ls_fono_c,ls_email,ls_celular
Long		ll_rut

ls_columna					= dwo.name
if ls_columna='t_copiar' then
	ll_rut						= dw_ingreso.getitemnumber(1,'rut_titular')
	SELECT		"CLIENTE"."NOMBRE", 	"CLIENTE"."A_PATERNO", 	"CLIENTE"."A_MATERNO", 	"CLIENTE"."FONO_P", 	"CLIENTE"."FONO_C", 	"CLIENTE"."EMAIL", 	"CLIENTE"."CELULAR"  
	INTO 			:ls_nom,						:ls_ap_pat, 						:ls_ap_mat,  					:ls_fono_p, 					:ls_fono_c,					:ls_email, 				:ls_celular
	FROM 		"CLIENTE"  
	WHERE 		"CLIENTE"."RUT" = :ll_rut 
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if isnull(ls_email) or ls_email='' or len(ls_email)=0 then
			ls_email			= '-'
		end if
		if isnull(ls_fono_p) or ls_fono_p='' or len(ls_fono_p)=0  then
			ls_fono_p		= '-'
		end if
		if isnull(ls_fono_c) or ls_fono_c='' or len(ls_fono_c)=0  then
			ls_fono_c		= '-'
		end if
		if isnull(ls_celular) or ls_celular='' or len(ls_celular)=0  then
			ls_celular		= '-'
		end if
		dw_ingreso.setitem(1,'rut_contacto',ll_rut)
		dw_ingreso.setitem(1,'nombre_contacto',ls_nom)
		dw_ingreso.setitem(1,'a_paterno_contacto',ls_ap_pat)
		dw_ingreso.setitem(1,'a_materno_contacto',ls_ap_mat)
		dw_ingreso.setitem(1,'email',ls_email)
		dw_ingreso.setitem(1,'fono_particular',ls_fono_p)
		dw_ingreso.setitem(1,'fono_comercial',ls_fono_c)
		dw_ingreso.setitem(1,'celular',ls_celular)
	else
		messagebox("Advertencia","No Existe Cliente")
	end if
end if
end event

