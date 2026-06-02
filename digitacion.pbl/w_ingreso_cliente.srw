forward
global type w_ingreso_cliente from window
end type
type pb_grabar from picturebutton within w_ingreso_cliente
end type
type pb_cerrar from picturebutton within w_ingreso_cliente
end type
type dw_clientes from datawindow within w_ingreso_cliente
end type
end forward

global type w_ingreso_cliente from window
integer width = 3118
integer height = 2700
boolean titlebar = true
string title = "Ingreso Cliente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
pb_grabar pb_grabar
pb_cerrar pb_cerrar
dw_clientes dw_clientes
end type
global w_ingreso_cliente w_ingreso_cliente

type variables
date		id_fecha_dia
String		is_opcion,is_fono_particular,is_celular,is_fono_c
Long		il_tipo_cliente
end variables

on w_ingreso_cliente.create
this.pb_grabar=create pb_grabar
this.pb_cerrar=create pb_cerrar
this.dw_clientes=create dw_clientes
this.Control[]={this.pb_grabar,&
this.pb_cerrar,&
this.dw_clientes}
end on

on w_ingreso_cliente.destroy
destroy(this.pb_grabar)
destroy(this.pb_cerrar)
destroy(this.dw_clientes)
end on

event open;long		ll_fila
String		ls_ciudad,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc,ls_comuna,ls_base,ls_uso,ls_fono,ls_dv,ls_nom_new,ls_ap_pat_new,ls_ap_mat_new,ls_dir_part_new,&
			ls_comuna_part_new,ls_ciudad_part_new,ls_fono_part_new,ls_dv_new,ls_tipo_venta='1'

gf_centrar(w_ingreso_cliente)
w_ingreso_cliente.title	= 'Ingreso Cliente                                 Parque: '+gs_nom_cod_parque

is_opcion 					= trim(substr(1,1,Message.StringParm))
il_tipo_cliente				= Long(substr(1,2,Message.StringParm))
id_fecha_dia				= date(gdt_fec_sistema)

dw_clientes.SetTransObject(SQLCA)
dw_clientes.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_clientes.getchild('comuna_comercial',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.insertrow(0)
end if

if (isvalid(w_validar_promesa_operaciones) or isvalid(w_ingresar_funeraria)) then
	if isvalid(w_validar_promesa_operaciones) then
		ls_base			= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'base')
	elseif isvalid(w_ingresar_funeraria) then
		ls_base			= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_anexo_base')	//base
		ls_uso			= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_anexo_uso')
	elseif isvalid(w_ingresar_oferta) then
		ls_uso			= w_ingresar_oferta.dw_oferta_v.getitemstring(1,'uso')
	elseif isvalid(w_ingresar_contrato) then
		ls_uso			= w_ingresar_contrato.dw_ingreso_contrato.getitemstring(1,'contrato_uso')
	elseif isvalid(w_ingresar_aumento_capacidad) then
		ls_uso			= w_ingresar_aumento_capacidad.dw_aumento_capacidad.getitemstring(1,'anexo_aumento_uso')
	end if
	if isnull(ls_base) or ls_base='' then ls_base	=	'F'
	if ls_base = 'F' then
//		dw_clientes.object.ano_renta.visible			= false
//		dw_clientes.object.t_30.visible					= false
		ls_tipo_venta										= '5'
		ls_uso												= 'NI'
//		dw_clientes.object.uso.visible					= false
//		dw_clientes.object.t_32.visible					= false
	end if
end if
if isvalid(w_ingresar_oferta) then
	ls_uso													= w_ingresar_oferta.dw_oferta_v.getitemstring(1,'uso')
elseif isvalid(w_ingresar_contrato) then
	ls_uso													= w_ingresar_contrato.dw_ingreso_contrato.getitemstring(1,'contrato_uso')
elseif isvalid(w_ingresar_aumento_capacidad) then
	ls_uso													= w_ingresar_aumento_capacidad.dw_aumento_capacidad.getitemstring(1,'anexo_aumento_uso')
end if
if is_opcion='N' then
	ll_fila				= dw_clientes.InsertRow(0)
	dw_clientes.SetItem(ll_fila, "ano_renta",year(date(id_fecha_dia)))
	SELECT	"CLIENTE_REZAGO"."NOMBRE",   
				"CLIENTE_REZAGO"."AP_PATERNO",   
				"CLIENTE_REZAGO"."AP_MATERNO",   
				"CLIENTE_REZAGO"."DIRECCION_PART",   
				"CLIENTE_REZAGO"."COMUNA_PART",   
				"CLIENTE_REZAGO"."CIUDAD_PART",   
				"CLIENTE_REZAGO"."TELEFONO_PART",   
				"CLIENTE_REZAGO"."DV"  
	INTO 		:ls_nom_new,   
				:ls_ap_pat_new,   
				:ls_ap_mat_new,   
				:ls_dir_part_new,   
				:ls_comuna_part_new,   
				:ls_ciudad_part_new,   
				:ls_fono_part_new,   
				:ls_dv_new  
	FROM 		"CLIENTE_REZAGO"  
	WHERE  ( "CLIENTE_REZAGO"."RUT" = :gi_rut ) AND  
			 ( "CLIENTE_REZAGO"."FECHA_CREA" = ( SELECT	MAX("CLIENTE_REZAGO"."FECHA_CREA") 
			 												 FROM 	"CLIENTE_REZAGO" 
															 WHERE 	"CLIENTE_REZAGO"."RUT" = :gi_rut ) )   
	using		sqlca;
	if not isnull(ls_nom_new) and ls_nom_new<>'' and not isnull(ls_ap_pat_new) and ls_ap_pat_new<>'' then
		dw_clientes.SetItem(ll_fila, "estado_rut",1)
		dw_clientes.SetItem(ll_fila, "rut", gi_rut)
		dw_clientes.SetItem(ll_fila, "tipo_cliente", il_tipo_cliente)
		dw_clientes.SetItem(ll_fila, 'dv',ls_dv_new)
		dw_clientes.SetItem(ll_fila, 'fono_p',ls_fono_part_new)
		dw_clientes.SetItem(ll_fila,'celular','')
		dw_clientes.SetItem(ll_fila,'fono_c','')
		dw_clientes.SetItem(ll_fila, 'nombre',ls_nom_new)
		dw_clientes.SetItem(ll_fila, 'a_paterno',ls_ap_pat_new)
		dw_clientes.SetItem(ll_fila, 'a_materno',ls_ap_mat_new)
		dw_clientes.SetItem(ll_fila, "tipo", "O")
		dw_clientes.SetItem(ll_fila, "poblacion", "-")
		dw_clientes.SetItem(ll_fila, 'fecha_ingr',id_fecha_dia)
		dw_clientes.SetItem(ll_fila, "usuario", gs_user)
		dw_clientes.SetItem(ll_fila, 'estado_titular','0')
		dw_clientes.setitem(ll_fila, 'estado_cobranza','0')
		dw_clientes.SetItem(ll_fila, 'auto_propio','N')
		dw_clientes.SetItem(ll_fila, 'casa_propia','N')
		dw_clientes.setitem(ll_fila, 'tipo_clasifica_renta',0)
		dw_clientes.setitem(ll_fila,'tipo_venta',ls_tipo_venta)
		dw_clientes.setitem(ll_fila,'uso',ls_uso)
	else
		dw_clientes.SetItem(ll_fila, "estado_rut",0)
		dw_clientes.SetItem(ll_fila, "rut", gi_rut)
		dw_clientes.SetItem(ll_fila, "tipo", "O")
		dw_clientes.SetItem(ll_fila, "poblacion", "-")
		dw_clientes.SetItem(ll_fila, 'fecha_ingr',id_fecha_dia)
		dw_clientes.SetItem(ll_fila, "usuario", gs_user)
		dw_clientes.SetItem(ll_fila, 'estado_titular','0')
		dw_clientes.setitem(ll_fila, 'estado_cobranza','0')
		dw_clientes.SetItem(ll_fila, 'auto_propio','N')
		dw_clientes.SetItem(ll_fila, 'casa_propia','N')
		dw_clientes.setitem(ll_fila, 'tipo_clasifica_renta',0)
		dw_clientes.setitem(ll_fila,'tipo_venta',ls_tipo_venta)
		dw_clientes.setitem(ll_fila,'uso',ls_uso)
	end if
	is_fono_particular			= ls_fono_part_new
	is_celular					= ''
	is_fono_c					= ''
	pb_grabar.enabled		= true
elseif is_opcion='M' then
	dw_clientes.retrieve(gi_rut)
	ls_ciudad						= dw_clientes.getitemstring(1,'ciudad')
	is_fono_particular			= dw_clientes.getitemstring(1,'fono_p')
	is_celular					= dw_clientes.getitemstring(1,'celular')
	is_fono_c					= dw_clientes.getitemstring(1,'fono_c')
	if isnull(is_fono_particular) then is_fono_particular=''
	if isnull(is_celular) then is_celular=''
	if isnull(is_fono_c) then is_fono_c=''
	if not isnull(ls_ciudad) and ls_ciudad<>'' then
		idw_detalle.retrieve(ls_ciudad)
	end if
	ls_ciudad						= dw_clientes.getitemstring(1,'ciudad_comercial')
	if not isnull(ls_ciudad) and ls_ciudad<>'' then
		idw_detalle2.retrieve(ls_ciudad)
	end if
	ll_fila							= 1
	if isnull(dw_clientes.getitemstring(1, "usuario")) then dw_clientes.setitem(1, "usuario",gs_user)
	dw_clientes.SetItem(1, "estado_rut",1)
	pb_grabar.enabled		= true
end if
end event

event close;pb_cerrar.triggerevent(clicked!)
end event

type pb_grabar from picturebutton within w_ingreso_cliente
integer x = 37
integer y = 2460
integer width = 293
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar"
boolean originalsize = true
end type

event clicked;String		ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_dir_particular,ls_ciudad,ls_comuna,ls_sexo,ls_esta_civil,ls_auto_propio,ls_casa_propia,ls_ciudad_real,&
			ls_dir_comercial,ls_ciudad_comercial,ls_comuna_comercial,ls_age_aux,ls_tipo_via,ls_tipo_venta,ls_uso,ls_cod_age,ls_cod_sup,ls_cod_jefe,ls_descrip,ls_base
Datetime	ldt_fecha_nac,ldt_fecha_ingreso
Double	ld_valor_uf
Long		ll_avaluo_auto,ll_avaluo_casa,ll_estado,ll_anno,ll_sw1=0,ll_sw2=0,ll_fecha_control,ll_resp

dw_clientes.accepttext()
ls_dv						= dw_clientes.getitemstring(1,'dv')
ls_nombre				= dw_clientes.getitemstring(1,'nombre')
ls_ap_pat				= dw_clientes.getitemstring(1,'a_paterno')
ls_ap_mat				= dw_clientes.getitemstring(1,'a_materno')
ls_dir_particular		= dw_clientes.getitemstring(1,'direccion_p')
ls_tipo_via				= dw_clientes.getitemstring(1,'tipo_via')
ls_ciudad					= dw_clientes.getitemstring(1,'ciudad')
ls_comuna				= dw_clientes.getitemstring(1,'comuna')
ldt_fecha_nac			= dw_clientes.getitemdatetime(1,'fecha_nac')
ldt_fecha_ingreso		= dw_clientes.getitemdatetime(1,'fecha_ingr')
ls_sexo					= dw_clientes.getitemstring(1,'sexo')
ls_esta_civil				= dw_clientes.getitemstring(1,'esta_civil')
ls_auto_propio			= dw_clientes.getitemstring(1,'auto_propio')
ls_casa_propia			= dw_clientes.getitemstring(1,'casa_propia')
ll_avaluo_auto			= dw_clientes.getitemnumber(1,'avaluo_auto')
ll_avaluo_casa			= dw_clientes.getitemnumber(1,'avaluo_casa')
ls_dir_comercial		= dw_clientes.getitemstring(1,'domicilio_c')
ls_ciudad_comercial	= dw_clientes.getitemstring(1,'ciudad_comercial')
ls_comuna_comercial	= dw_clientes.getitemstring(1,'comuna_comercial')
ll_anno					= dw_clientes.getitemnumber(1,'ano_renta')
ls_tipo_venta			= dw_clientes.getitemstring(1,'tipo_venta')
ls_uso					= dw_clientes.getitemstring(1,'uso')
dw_clientes.setitem(1,'dv',trim(ls_dv))
dw_clientes.setitem(1,'nombre',trim(ls_nombre))
dw_clientes.setitem(1,'a_paterno',trim(ls_ap_pat))
dw_clientes.setitem(1,'a_materno',trim(ls_ap_mat))
dw_clientes.setitem(1,'direccion_p',trim(ls_dir_particular))
dw_clientes.setitem(1,'domicilio_c',trim(ls_dir_comercial))
dw_clientes.accepttext()
if isnull(dw_clientes.getitemstring(1,'numero_particular')) or dw_clientes.getitemstring(1,'numero_particular')=''	then dw_clientes.setitem(1,'numero_particular','-')
if isnull(dw_clientes.getitemstring(1,'depto_particular')) or dw_clientes.getitemstring(1,'depto_particular')=''		then dw_clientes.setitem(1,'depto_particular','-')
if isnull(dw_clientes.getitemstring(1,'block_particular')) or dw_clientes.getitemstring(1,'block_particular')=''			then dw_clientes.setitem(1,'block_particular','-')
if isnull(dw_clientes.getitemstring(1,'poblacion')) or dw_clientes.getitemstring(1,'poblacion')='' 						then dw_clientes.setitem(1,'poblacion','-')
if isnull(dw_clientes.getitemstring(1,'tipo_via')) or dw_clientes.getitemstring(1,'tipo_via')='' 							then dw_clientes.setitem(1,'tipo_via','-')
if isnull(dw_clientes.getitemstring(1,'sector')) or dw_clientes.getitemstring(1,'sector')='' 								then dw_clientes.setitem(1,'sector','-')
if isnull(dw_clientes.getitemstring(1,'fono_p')) or dw_clientes.getitemstring(1,'fono_p')='' 								then dw_clientes.setitem(1,'fono_p','')
if isnull(dw_clientes.getitemstring(1,'actividad')) or dw_clientes.getitemstring(1,'actividad')='' 							then dw_clientes.setitem(1,'actividad','-')
if isnull(dw_clientes.getitemstring(1,'empleador')) or dw_clientes.getitemstring(1,'empleador')='' 						then dw_clientes.setitem(1,'empleador','-')
if isnull(dw_clientes.getitemstring(1,'numero_comercial')) or dw_clientes.getitemstring(1,'numero_comercial')=''	then dw_clientes.setitem(1,'numero_comercial','-')
if isnull(dw_clientes.getitemstring(1,'fono_c')) or dw_clientes.getitemstring(1,'fono_c')='' 								then dw_clientes.setitem(1,'fono_c','')
if isnull(dw_clientes.getitemstring(1,'nombre')) or dw_clientes.getitemstring(1,'nombre')='' 							then dw_clientes.setitem(1,'nombre','-')
if isnull(dw_clientes.getitemstring(1,'a_paterno')) or dw_clientes.getitemstring(1,'a_paterno')='' 						then dw_clientes.setitem(1,'a_paterno','-')
if isnull(dw_clientes.getitemstring(1,'a_materno')) or dw_clientes.getitemstring(1,'a_materno')='' 					then dw_clientes.setitem(1,'a_materno','-')
dw_clientes.accepttext()

if (isvalid(w_validar_promesa_operaciones) or isvalid(w_ingresar_funeraria)) then
	if isvalid(w_validar_promesa_operaciones) then
		ls_base			= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'base')
	elseif isvalid(w_ingresar_funeraria) then
		ls_base			= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_anexo_base')
	end if
	if isnull(ls_base) or ls_base='' then
		ls_base			=	'F'
	end if
end if

if not isnull(ldt_fecha_nac) then
	ll_fecha_control	= DaysAfter(date(ldt_fecha_nac),date(gdt_fec_sistema))
	ll_fecha_control	= ll_fecha_control/365
end if	
if isnull(ls_dv) or len(trim(ls_dv))=0 then
	messagebox("Advertencia","Falta ingresar Dígito Verificador del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('dv')
elseif isnull(ls_nombre) or len(trim(ls_nombre))=0 then
	messagebox("Advertencia","Falta ingresar Nombre del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('nombre')
elseif isnull(ls_ap_pat) or len(trim(ls_ap_pat))=0 then
	messagebox("Advertencia","Falta ingresar Apellido Paterno del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('a_paterno')
elseif isnull(ls_ap_mat) or len(trim(ls_ap_mat))=0 then
	messagebox("Advertencia","Falta ingresar Apellido Materno del Cliente")
	dw_clientes.setitem(1,'a_materno','-')
	dw_clientes.setfocus()
	dw_clientes.setcolumn('a_materno')
elseif isnull(ls_tipo_via) or len(trim(ls_tipo_via))=0 then
	messagebox("Advertencia","Falta ingresar Tipo Via")
	dw_clientes.setitem(1,'tipo_via','-')
	dw_clientes.setfocus()
	dw_clientes.setcolumn('tipo_via')
elseif isnull(ls_dir_particular) or len(trim(ls_dir_particular))=0 then
	messagebox("Advertencia","Falta ingresar Dirección Particular del Cliente")
	dw_clientes.setitem(1,'direccion_p','-')
	dw_clientes.setfocus()
	dw_clientes.setcolumn('direccion_p')

elseif isnull(ls_ciudad) or len(trim(ls_ciudad))=0 then
	messagebox("Advertencia","Falta ingresar Ciudad del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('ciudad')

elseif isnull(ls_comuna) or len(trim(ls_comuna))=0 then
	messagebox("Advertencia","Falta ingresar Comuna del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('comuna')

elseif isnull(ldt_fecha_nac) then
	messagebox("Advertencia","Falta ingresar Fecha Nacimiento del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('fecha_nac')
elseif isnull(ldt_fecha_ingreso) then
	messagebox("Advertencia","Falta ingresar Fecha Ingreso del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('fecha_ingr')
elseif isnull(ls_sexo) or len(trim(ls_sexo))=0 then
	messagebox("Advertencia","Falta ingresar Sexo del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('sexo')
elseif isnull(ls_esta_civil) or len(trim(ls_esta_civil))=0 then
	messagebox("Advertencia","Falta ingresar Estado Civil del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('esta_civil')
elseif isnull(ll_anno) or ll_anno=0 then
	messagebox("Advertencia","Falta ingresar Año")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('ano_renta')
elseif isnull(ls_tipo_venta) or len(trim(ls_tipo_venta))=0 then
	messagebox("Advertencia","Falta ingresar Tipo Venta")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('tipo_venta')
elseif isnull(ls_uso) or len(trim(ls_uso))=0 then
	messagebox("Advertencia","Falta ingresar Uso")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('uso')
elseif ll_fecha_control < 18 then
	messagebox("Advertencia","Edad Menor a 18 Años")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('fecha_nac')

elseif (isnull(ls_comuna_comercial) or len(trim(ls_comuna_comercial))=0) and ls_base <> 'F' then
		messagebox("Advertencia","Falta ingresar Comuna Comercial del Cliente")
		dw_clientes.setfocus()
		dw_clientes.setcolumn('comuna_comercial')
elseif (isnull(ls_ciudad_comercial) or len(trim(ls_ciudad_comercial))=0) and ls_base <> 'F' then
	messagebox("Advertencia","Falta ingresar Ciudad Comercial del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('ciudad_comercial')
elseif (isnull(ls_dir_comercial) or len(trim(ls_dir_comercial))=0) and ls_base <> 'F' then
	messagebox("Advertencia","Falta ingresar Dirección Comercial del Cliente")
	dw_clientes.setitem(1,'domicilio_c','-')
	dw_clientes.setfocus()
	dw_clientes.setcolumn('domicilio_c')
else
	if ll_fecha_control > 99 then
		ll_resp	= messagebox("Advertencia","Edad Cliente es "+string(ll_fecha_control)+" Años ¿Es correcto?",Exclamation!,YesNo!,2)
	end if	
	if ll_fecha_control <= 99 or (ll_fecha_control >99 and ll_resp=1) then
		ls_ciudad						= dw_clientes.getitemstring(1,'ciudad')
		ls_comuna					= dw_clientes.getitemstring(1,'comuna')
		SELECT	"COMUNA"."CODIGO_CIUDAD"  
		INTO 		:ls_ciudad_real  
		FROM 	"COMUNA"  
		WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_comuna   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ls_ciudad<>ls_ciudad_real then
				messagebox("Advertencia","Comuna seleccionada en Domicilio Particular NO corresponde a Región Seleccionada")
				dw_clientes.setfocus()
				dw_clientes.setcolumn('comuna')
				ll_sw1				= 1
			else
				ls_ciudad				= dw_clientes.getitemstring(1,'ciudad_comercial')
				ls_comuna			= dw_clientes.getitemstring(1,'comuna_comercial')
				if not isnull(ls_ciudad) or not isnull(ls_comuna) then
					SELECT	"COMUNA"."CODIGO_CIUDAD"  
					INTO 		:ls_ciudad_real  
					FROM 	"COMUNA"  
					WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_comuna   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						if ls_ciudad<>ls_ciudad_real then
							messagebox("Advertencia","Comuna seleccionada en Domicilio Comercial NO corresponde a Región Seleccionada")
							dw_clientes.setfocus()
							dw_clientes.setcolumn('comuna_comercial')
							ll_sw2	= 1
						end if
					end if
				end if				
			end if
		end if
		if ll_sw1=0 and ll_sw2=0 then
			if ls_auto_propio='S' and (ll_avaluo_auto<=0 or isnull(ll_avaluo_auto)) then
				messagebox("Advertencia","Falta ingresar Avaluo Auto")
				dw_clientes.setfocus()
				dw_clientes.setcolumn('avaluo_auto')
			elseif ls_casa_propia='S' and (ll_avaluo_casa<=0 or isnull(ll_avaluo_casa)) then
				messagebox("Advertencia","Falta ingresar Avaluo Casa")
				dw_clientes.setfocus()
				dw_clientes.setcolumn('avaluo_casa')
			end if
			if ls_auto_propio='N' then dw_clientes.setitem(1,'avaluo_auto',0)
			if ls_casa_propia='N' then dw_clientes.setitem(1,'avaluo_casa',0)
			dw_clientes.accepttext()
			if dw_clientes.update()=1 then
				commit;
				messagebox("Grabar","Grabación Exitosa")
				//////// Promesa
				if isvalid(w_ingresar_oferta) then
					w_ingresar_oferta.dw_clientes.reset()
					w_ingresar_oferta.dw_clientes.Retrieve(gi_rut)
					w_ingresar_oferta.dw_clientes.SetItem(1, "rut", gi_rut)
					w_ingresar_oferta.dw_clientes.SetItem(1, "dv", trim(dw_clientes.getitemstring(1,'dv')))
					
					w_ingresar_oferta.dw_oferta_v.SetItem(1, "uso", ls_uso)
					w_ingresar_oferta.dw_oferta_v.SetItem(1, "tipo_venta", ls_tipo_venta)
					if is_opcion='N' then
						SELECT	"CD_FOLIO"."COD_AGENTE",   
									"CD_FOLIO"."COD_SUPERVISOR",   
									"CD_FOLIO"."COD_JEFE_VENTA"
						INTO 		:gs_age,   
									:gs_sup,   
									:gs_jefe
						FROM		"CD_FOLIO"  
						WHERE  ( "CD_FOLIO"."BASE" = :gs_base ) AND  
								 ( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
								 ( "CD_FOLIO"."NUMERO" = :gi_numero ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							w_ingresar_oferta.dw_agente.setitem(1,'agente',gs_age)
							w_ingresar_oferta.dw_supervisor.setitem(1,'supervisores',gs_sup)
							w_ingresar_oferta.dw_jefe.setitem(1,'jefes',gs_jefe)
						end if
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "compute", trim(dw_clientes.getitemstring(1,'dv')))
						w_ingresar_oferta.em_dv.text					= trim(dw_clientes.getitemstring(1,'dv'))
						w_ingresar_oferta.cb_aceptar.text 			= "Ingresar"
						w_ingresar_oferta.dw_oferta_v.setitem(1, 'rut',gi_rut)
						w_ingresar_oferta.dw_oferta_v.setitem(1, 'serie',gs_serie)
						w_ingresar_oferta.dw_oferta_v.setitem(1, 'nro_oferta',gi_numero)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "fecha", id_fecha_dia)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, 'fecha_ingreso',id_fecha_dia)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "usuario", gs_user)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "cod_age_ant", gs_age)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "cod_age", gs_age)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "cod_sup", gs_sup)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "cod_jef", gs_jefe)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "ult_folio", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "cod_emp", "0")
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "age_ant", "0")
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "tot_pagado", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "cta_pag_s", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "cta_pag_m", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "valor_cuota_m", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "abono_c", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "abono_m", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "tot_pagado_m", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "abono_d", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "titulo", "0")
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "estado_comi", "N")
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "estado_premio", "N")
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "usuario", gs_user)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "uf_cierre", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "total_com", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "por_ingre", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_ing", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "tipo_mant", "N")
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "nro_resc", "0")
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "estado", "0")
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_venta", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_ubicacion", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_adicional", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_manperpe", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_sup", 1)
						w_ingresar_oferta.dw_oferta_v.Object.rut_institucional.TabSequence	= 0
						w_ingresar_oferta.dw_oferta_v.Object.compute_0050.TabSequence 			= 0	
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_serie", gs_serie)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_nro_oferta", gi_numero)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_fecha", id_fecha_dia)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_folio", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_precio", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_pie", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_tasa", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_capacidad", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_valor_cuota", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_des_esp", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_nro_cuotas", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_modificado", gs_user)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_fecha_mod", id_fecha_dia)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_parque", gl_cod_parque)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_sector", "0")
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_derecho_lib", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_gastos_adm", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_factura", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_total_fact", 0)
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_carta_bienv", "N")
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_pie_pagado", 0)
						Select	tab_uf.valor_uf
						into		:ld_valor_uf
						from 		tab_uf
						where 	tab_uf.fecha_uf = :id_fecha_dia;
						w_ingresar_oferta.dw_oferta_v.SetItem(1, "pago_oferta_uf_dia", ld_valor_uf)
					//	w_ingresar_oferta.dw_beneficiarios.reset()
						if gs_nueva_oferta='S' then
							w_ingresar_oferta.dw_agente.enabled			= true
							w_ingresar_oferta.dw_supervisor.enabled		= true
							w_ingresar_oferta.dw_jefe.enabled				= true
							w_ingresar_oferta.dw_seguro.enabled			= true
							SELECT	"CADENA"."CODIGO"  
							INTO 		:ls_age_aux  
							FROM 		"CADENA"  
							WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
									 ( "CADENA"."SERIE" = :gs_serie ) AND  
									 ( "CADENA"."NUMERO" = :gi_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								w_ingresar_oferta.dw_oferta_v.setfocus()
							else
								w_ingresar_oferta.dw_agente.setfocus()
							end if
						else
							w_ingresar_oferta.dw_oferta_v.enabled			= true
							w_ingresar_oferta.dw_clientes.enabled			= true
							w_ingresar_oferta.dw_seguro.enabled			= true
						//	w_ingresar_oferta.dw_beneficiarios.enabled	= true
							w_ingresar_oferta.dw_oferta_v.setfocus()
						end if
					else
						w_ingresar_oferta.em_dv.text							= trim(dw_clientes.getitemstring(1,'dv'))
					end if
				end if
				//////// liberador
				if isvalid(w_ingresar_liberador) then
					w_ingresar_liberador.dw_clientes.reset()
					w_ingresar_liberador.dw_clientes.Retrieve(gi_rut)
					w_ingresar_liberador.dw_clientes.SetItem(1, "rut", gi_rut)
					w_ingresar_liberador.dw_clientes.SetItem(1, "dv", trim(dw_clientes.getitemstring(1,'dv')))
					w_ingresar_liberador.em_dv.text							= trim(dw_clientes.getitemstring(1,'dv'))
					if is_opcion='N' then
						SELECT	"CD_FOLIO"."COD_AGENTE",   
									"CD_FOLIO"."COD_SUPERVISOR",   
									"CD_FOLIO"."COD_JEFE_VENTA"
						INTO 		:gs_age,   
									:gs_sup,   
									:gs_jefe
						FROM		"CD_FOLIO"  
						WHERE  ( "CD_FOLIO"."BASE" = :gs_base ) AND  
								 ( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
								 ( "CD_FOLIO"."NUMERO" = :gi_numero ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							w_ingresar_liberador.dw_agente.setitem(1,'agente',gs_age)
							w_ingresar_liberador.dw_supervisor.setitem(1,'supervisores',gs_sup)
							w_ingresar_liberador.dw_jefe.setitem(1,'jefes',gs_jefe)
						end if
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "serie_m", gs_serie)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "nro_liberador", gi_numero)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "ult_folio", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "tot_pagado", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "cta_pag_m", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "abono_m", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "usuario", gs_user)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "fecha_ingreso", id_fecha_dia)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "uf_cierre", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "nro_resc", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "cod_agente", gs_age)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "cod_super", gs_sup)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "cod_jef", gs_jefe)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "estado_comi", "N")
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "estado_premio", "N")
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "total_com", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "por_ingre", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "porce_sup", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "porce_age", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, 'estado_rut',0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_serie_m", gs_serie)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_nro_liberador", gi_numero)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_fecha", id_fecha_dia)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_folio", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_precio", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_pie_pagado", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_pie", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_tasa", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_valor_cuota", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_nro_cuotas", 0)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_uf_dia", gd_uf_dia)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_modificado", gs_user)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_fecha_mod", id_fecha_dia)
						w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "pago_liberador_gastos_adm", 0)
					else
						w_ingresar_liberador.em_dv.text							= trim(dw_clientes.getitemstring(1,'dv'))
					end if
					if gs_nueva_oferta='S' then
						w_ingresar_liberador.dw_agente.enabled			= true
						w_ingresar_liberador.dw_supervisor.enabled		= true
						w_ingresar_liberador.dw_jefe.enabled				= true
						w_ingresar_liberador.dw_seguro.enabled			= true
						SELECT	"CADENA"."CODIGO"  
						INTO 		:ls_age_aux  
						FROM 		"CADENA"  
						WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
								 ( "CADENA"."SERIE" = :gs_serie ) AND  
								 ( "CADENA"."NUMERO" = :gi_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							w_ingresar_liberador.dw_anexo_liberador.setfocus()
						else
							w_ingresar_liberador.dw_agente.setfocus()
						end if
					else
						w_ingresar_liberador.dw_anexo_liberador.enabled	= true
						w_ingresar_liberador.dw_clientes.enabled			= true
						w_ingresar_liberador.dw_seguro.enabled			= true
						w_ingresar_liberador.dw_anexo_liberador.setfocus()
					end if
				end if
				//////// Aumento Capacidad
				if isvalid(w_ingresar_aumento_capacidad) then
					w_ingresar_aumento_capacidad.dw_clientes.reset()
					w_ingresar_aumento_capacidad.dw_clientes.Retrieve(gi_rut)
					w_ingresar_aumento_capacidad.dw_clientes.SetItem(1, "rut", gi_rut)
					w_ingresar_aumento_capacidad.dw_clientes.SetItem(1, "dv", trim(dw_clientes.getitemstring(1,'dv')))
					w_ingresar_aumento_capacidad.em_dv.text				= trim(dw_clientes.getitemstring(1,'dv'))
					if is_opcion='N' then
						SELECT	"CD_FOLIO"."COD_AGENTE",   
									"CD_FOLIO"."COD_SUPERVISOR",   
									"CD_FOLIO"."COD_JEFE_VENTA"
						INTO 		:gs_age,   
									:gs_sup,   
									:gs_jefe
						FROM		"CD_FOLIO"  
						WHERE  ( "CD_FOLIO"."BASE" = :gs_base ) AND  
								 ( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
								 ( "CD_FOLIO"."NUMERO" = :gi_numero ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							w_ingresar_aumento_capacidad.dw_agente.setitem(1,'agente',gs_age)
							w_ingresar_aumento_capacidad.dw_supervisor.setitem(1,'supervisores',gs_sup)
							w_ingresar_aumento_capacidad.dw_jefe.setitem(1,'jefes',gs_jefe)
						end if
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_serie_m", gs_serie)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_nro_aumento", gi_numero)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_ult_folio", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_tot_pagado", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_cta_pag_m", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_abono_m", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_usuario", gs_user)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_fecha_ingreso", id_fecha_dia)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_uf_cierre", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_nro_resc", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_agente", gs_age)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_super", gs_sup)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_jef", gs_jefe)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_estado_comi", "N")
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_estado_premio", "N")
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_total_com", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_por_ingre", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_sup", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_age", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, 'estado_rut',0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_serie_m", gs_serie)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_nro_aumento", gi_numero)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha", id_fecha_dia)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_folio", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_precio", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_pie_pagado", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_pie", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_tasa", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_valor_cuota", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_nro_cuotas", 0)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_uf_dia", gd_uf_dia)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_modificado", gs_user)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha_mod", id_fecha_dia)
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, "pago_aumento_gastos_adm", 0)
					else
						w_ingresar_aumento_capacidad.em_dv.text							= trim(dw_clientes.getitemstring(1,'dv'))
					end if
					if gs_nueva_oferta='S' then
						w_ingresar_aumento_capacidad.dw_agente.enabled				= true
						w_ingresar_aumento_capacidad.dw_supervisor.enabled			= true
						w_ingresar_aumento_capacidad.dw_jefe.enabled					= true
						w_ingresar_aumento_capacidad.dw_seguro.enabled				= true
						SELECT	"CADENA"."CODIGO"  
						INTO 		:ls_age_aux  
						FROM 		"CADENA"  
						WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
								 ( "CADENA"."SERIE" = :gs_serie ) AND  
								 ( "CADENA"."NUMERO" = :gi_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							w_ingresar_aumento_capacidad.dw_aumento_capacidad.setfocus()
						else
							w_ingresar_aumento_capacidad.dw_agente.setfocus()
						end if
					else
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.enabled	= true
						w_ingresar_aumento_capacidad.dw_clientes.enabled					= true
						w_ingresar_aumento_capacidad.dw_seguro.enabled					= true
						w_ingresar_aumento_capacidad.dw_aumento_capacidad.setfocus()
					end if
				end if
				//////// Derecho Especial
				if isvalid(w_ingresar_derecho) then
					w_ingresar_derecho.dw_clientes.reset()
					w_ingresar_derecho.dw_clientes.Retrieve(gi_rut)
					w_ingresar_derecho.dw_clientes.SetItem(1, "rut", gi_rut)
					w_ingresar_derecho.dw_clientes.SetItem(1, "dv", trim(dw_clientes.getitemstring(1,'dv')))
					w_ingresar_derecho.dw_derecho.setitem(1,'compute',dw_clientes.getitemstring(1,'dv'))
					if is_opcion='N' then
						w_ingresar_derecho.dw_derecho.setitem(1, 'estado_rut',1)
						w_ingresar_derecho.dw_derecho.SetItem(1, "base", gs_base)
						w_ingresar_derecho.dw_derecho.SetItem(1, "serie_p", gs_serie)
						w_ingresar_derecho.dw_derecho.SetItem(1, "nro_pagare", gi_numero)
						w_ingresar_derecho.dw_derecho.SetItem(1, "rut_aval", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "kapital", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "tasa", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "valor_cuo", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "plazo", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "tot_pagado", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "pie_pagado", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "cta_pag_la", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "cta_pag_isa", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "abono_pag", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "usuario", gs_user)
						w_ingresar_derecho.dw_derecho.SetItem(1, "fechas_ingreso", id_fecha_dia)
						w_ingresar_derecho.dw_derecho.SetItem(1, "fecha", id_fecha_dia)
						w_ingresar_derecho.dw_derecho.SetItem(1, "estado", "V")
						w_ingresar_derecho.dw_derecho.SetItem(1, "nro_resc", 0)
						w_ingresar_derecho.dw_derecho.SetItem(1, "parque", gs_cod_parque)
						w_ingresar_derecho.dw_derecho.SetItem(1, "pie", 0)
					end if
				end if
				// Pagare
				if isvalid(w_ingresar_pagare) then
					w_ingresar_pagare.dw_clientes.reset()
					w_ingresar_pagare.dw_clientes.Retrieve(gi_rut)
					w_ingresar_pagare.dw_clientes.SetItem(1, "rut", gi_rut)
					w_ingresar_pagare.dw_clientes.SetItem(1, "dv", trim(dw_clientes.getitemstring(1,'dv')))
					w_ingresar_pagare.dw_pagare.setitem(1,'compute',dw_clientes.getitemstring(1,'dv'))
					if is_opcion='N' then
						w_ingresar_pagare.dw_pagare.setitem(1, 'estado_rut',1)
						w_ingresar_pagare.dw_pagare.SetItem(1, "serie_p", gs_serie)
						w_ingresar_pagare.dw_pagare.SetItem(1, "nro_pagare", gi_numero)
						w_ingresar_pagare.dw_pagare.SetItem(1, "nro_oferta", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "rut_aval", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "kapital", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "tasa", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "valor_cuo", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "plazo", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "tot_pagado", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "pie_pagado", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "cta_pag_la", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "cta_pag_isa", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "abono_pag", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "usuario", gs_user)
						w_ingresar_pagare.dw_pagare.SetItem(1, "fechas_ingreso", id_fecha_dia)
						w_ingresar_pagare.dw_pagare.SetItem(1, "fecha", id_fecha_dia)
						w_ingresar_pagare.dw_pagare.SetItem(1, "estado", "V")
						w_ingresar_pagare.dw_pagare.SetItem(1, "nro_resc", 0)
						w_ingresar_pagare.dw_pagare.SetItem(1, "parque", gs_cod_parque)
						w_ingresar_pagare.dw_pagare.SetItem(1, "pie", 0)
					end if
				end if
				//Contrato Isa
				if isvalid(w_ingresar_contrato) then
					w_ingresar_contrato.dw_clientes.reset()
					w_ingresar_contrato.dw_clientes.Retrieve(gi_rut)
					w_ingresar_contrato.dw_clientes.SetItem(1, "rut", gi_rut)
					w_ingresar_contrato.dw_clientes.SetItem(1, "dv", trim(dw_clientes.getitemstring(1,'dv')))
					w_ingresar_contrato.dw_ingreso_contrato.setitem(1,'compute',dw_clientes.getitemstring(1,'dv'))
					if is_opcion='N' then
						w_ingresar_contrato.dw_ingreso_contrato.setitem(1, 'estado_rut',1)
						w_ingresar_contrato.dw_ingreso_contrato.SetItem(1, "serie_c", gs_serie)
						w_ingresar_contrato.dw_ingreso_contrato.SetItem(1, "nro_contrato", gi_numero)
						w_ingresar_contrato.dw_ingreso_contrato.SetItem(1, "fecha", id_fecha_dia)
						w_ingresar_contrato.dw_ingreso_contrato.SetItem(1, "rut", gi_rut)
						w_ingresar_contrato.dw_ingreso_contrato.SetItem(1, "agente", gs_age)
						w_ingresar_contrato.dw_ingreso_contrato.SetItem(1, "valor_cuota_m", 0)
						w_ingresar_contrato.dw_ingreso_contrato.SetItem(1, "usuario", gs_user)
					end if
				end if
				//////// Funeraria 				w_ingresar_funeraria.dw_anexo_funeraria
				if isvalid(w_ingresar_funeraria) then
					w_ingresar_funeraria.dw_clientes.reset()
					w_ingresar_funeraria.dw_clientes.Retrieve(gi_rut)
					w_ingresar_funeraria.dw_clientes.SetItem(1, "rut", gi_rut)
					w_ingresar_funeraria.dw_clientes.SetItem(1, "dv", trim(dw_clientes.getitemstring(1,'dv')))
					w_ingresar_funeraria.em_dv.text				= trim(dw_clientes.getitemstring(1,'dv'))
					if is_opcion='N' then
						SELECT	"CD_FOLIO"."COD_AGENTE",   
									"CD_FOLIO"."COD_SUPERVISOR",   
									"CD_FOLIO"."COD_JEFE_VENTA"
						INTO 		:gs_age,   
									:gs_sup,   
									:gs_jefe
						FROM		"CD_FOLIO"  
						WHERE  ( "CD_FOLIO"."BASE" = :gs_base ) AND  
								 ( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
								 ( "CD_FOLIO"."NUMERO" = :gi_numero ) 
						USING		sqlca;
						if sqlca.sqlcode=0 then
							w_ingresar_funeraria.dw_agente.setitem(1,'agente','')
							w_ingresar_funeraria.dw_supervisor.setitem(1,'supervisores','')
							w_ingresar_funeraria.dw_jefe.setitem(1,'jefes','')
						end if
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_base", gs_base)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_serie", gs_serie)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_numero", gi_numero)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_ult_folio", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_total_pagado", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_cuotas_pag", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_usuario_crea", gs_user)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_fecha_ingreso", id_fecha_dia)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_uf_cierre", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_nro_resc", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_cod_agente", gs_age)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_cod_super", gs_sup)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_cod_jefe", gs_jefe)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_estado_comi", "N")
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_estado_premio", "N")
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_total_com", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_porce_ingre", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_porce_sup", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_porce_age", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_anexo_porce_jefe", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, 'estado_rut',0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_serie", gs_serie)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_numero", gi_numero)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_fecha", id_fecha_dia)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_folio", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_precio", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_pie_pagado", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_pie", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_tasa", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_valor_cuota", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_plazo", 0)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_uf_dia", gd_uf_dia)
						//w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_modificado", gs_user)
						//w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_fecha_mod", id_fecha_dia)
						w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, "producto_pago_gasto_adm", 0)
					else
						w_ingresar_funeraria.em_dv.text							= trim(dw_clientes.getitemstring(1,'dv'))
					end if
					if gs_nueva_oferta='S' then
						w_ingresar_funeraria.dw_agente.enabled				= true
						w_ingresar_funeraria.dw_supervisor.enabled			= true
						w_ingresar_funeraria.dw_jefe.enabled					= true
						w_ingresar_funeraria.dw_seguro.enabled				= true
						SELECT	"CADENA"."CODIGO"  
						INTO 		:ls_age_aux  
						FROM 		"CADENA"  
						WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
								 ( "CADENA"."SERIE" = :gs_serie ) AND  
								 ( "CADENA"."NUMERO" = :gi_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							w_ingresar_funeraria.dw_anexo_funeraria.setfocus()
						else
							w_ingresar_funeraria.dw_agente.setfocus()
						end if
					else
						w_ingresar_funeraria.dw_anexo_funeraria.enabled		= true
						w_ingresar_funeraria.dw_clientes.enabled					= true
						w_ingresar_funeraria.dw_seguro.enabled					= true
						
						w_ingresar_funeraria.dw_anexo_funeraria.setfocus()
					end if
				end if
				
				///Fin
				if is_opcion='N' then
					if isvalid(w_ingresar_oferta) then
						w_ingresar_oferta.setfocus()
						w_ingresar_oferta.dw_agente.triggerevent(itemchanged!)
					elseif isvalid(w_ingresar_liberador) then
						w_ingresar_liberador.setfocus()
						w_ingresar_liberador.dw_agente.triggerevent(itemchanged!)
					elseif isvalid(w_ingresar_funeraria) then
						w_ingresar_funeraria.setfocus()
						w_ingresar_funeraria.dw_agente.triggerevent(itemchanged!)
					end if
				end if
				close(w_ingreso_cliente)
			else
				rollback;
				messagebox("Error","Error al Grabar "+SQLCA.SQLErrText)
			end if	
		end if
	elseif ll_resp = 0 and ll_fecha_control > 99 then
		dw_clientes.setfocus()
		dw_clientes.setcolumn('fecha_nac')
	end if
end if
end event

type pb_cerrar from picturebutton within w_ingreso_cliente
integer x = 2734
integer y = 2460
integer width = 329
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
boolean originalsize = true
end type

event clicked;string	ls_estado
SELECT	"CLIENTE"."ESTADO_TITULAR"  
INTO 		:ls_estado  
FROM 		"CLIENTE"  
WHERE 	"CLIENTE"."RUT" = :gi_rut
USING		sqlca;
if isvalid(w_ingresar_oferta) then
	if sqlca.sqlcode=0 then
		w_ingresar_oferta.em_rut.enabled	= false
		w_ingresar_oferta.em_dv.enabled	= false
		w_ingresar_oferta.setfocus()
	else
		w_ingresar_oferta.em_rut.text		= ''
		w_ingresar_oferta.em_dv.text		= ''
		w_ingresar_oferta.em_rut.enabled	= true
		w_ingresar_oferta.em_dv.enabled	= true
		w_ingresar_oferta.setfocus()
		w_ingresar_oferta.em_rut.setfocus()
	end if
end if
if isvalid(w_ingresar_aumento_capacidad) then
	if sqlca.sqlcode=0 then
		w_ingresar_aumento_capacidad.em_rut.enabled	= false
		w_ingresar_aumento_capacidad.em_dv.enabled	= false
		w_ingresar_aumento_capacidad.setfocus()
	else
		w_ingresar_aumento_capacidad.em_rut.text		= ''
		w_ingresar_aumento_capacidad.em_dv.text		= ''
		w_ingresar_aumento_capacidad.em_rut.enabled	= true
		w_ingresar_aumento_capacidad.em_dv.enabled	= true
		w_ingresar_aumento_capacidad.setfocus()
		w_ingresar_aumento_capacidad.em_rut.setfocus()
	end if
end if

SELECT	"ENCARGADOS"."DEPTO"
INTO		:gs_depto
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user;

close(w_ingreso_cliente)
end event

type dw_clientes from datawindow within w_ingreso_cliente
integer x = 32
integer y = 32
integer width = 3035
integer height = 2404
integer taborder = 10
string title = "none"
string dataobject = "d_ingreso_nuevo_clientes"
boolean border = false
boolean livescroll = true
end type

event clicked;string	ls_columna,ls_fecha
long		ll_estado_rut

ll_estado_rut	= this.getitemnumber(1,'estado_rut')
if ll_estado_rut=1 then
	ls_columna	= dwo.name
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ls_fecha	= string(date(dw_clientes.getitemdatetime(1,'fecha_nac')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_clientes.setitem(1,'fecha_nac',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_clientes.setitem(1,'fecha_nac',date(ls_fecha))
			END IF

		CASE 'p_2'
			ls_fecha	= string(date(dw_clientes.getitemdatetime(1,'fecha_ingr')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_clientes.setitem(1,'fecha_ingr',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_clientes.setitem(1,'fecha_ingr',date(ls_fecha))
			END IF

		CASE 'p_3'
			ls_fecha	= string(date(dw_clientes.getitemdatetime(1,'fecha_ingreso_trabajo')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_clientes.setitem(1,'fecha_ingreso_trabajo',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_clientes.setitem(1,'fecha_ingreso_trabajo',date(ls_fecha))
			END IF
	END CHOOSE
end if
end event

event itemchanged;String	ls_ciudad,ls_columna,ls_dv,ls_null,ls_estado,ls_fono_p,ls_cel_p,ls_fono_c,ls_base
Date		ld_null
Double	ld_valor_uf
Long		ll_null,ll_avaluo,ll_fono_p_largo,ll_largo_cel,ll_fono_c_largo


ls_columna		= dwo.name
dw_clientes.accepttext()
if dw_clientes.getrow()>0 then 
	CHOOSE CASE ls_columna
		CASE 'dv'
			SetNull(ld_null);SetNull(ls_null);SetNull(ll_null)
			ls_dv										= dw_clientes.getitemstring(1,'dv')
			if String(ls_dv) <> String(gf_obtener_dv(gi_rut)) then
				messagebox('Error','El Rut no es valido',stopsign!)
				pb_grabar.enabled					= false
				dw_clientes.SetItem(1, "estado_rut",0)
				dw_clientes.setfocus()
				dw_clientes.setcolumn('dv')
			else
				pb_grabar.enabled					= true
				dw_clientes.SetItem(1, "estado_rut",1)
				dw_clientes.setcolumn('nombre')
			end if

		CASE 'ciudad'
			ls_ciudad	= dw_clientes.getitemstring(1,'ciudad')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle.retrieve(ls_ciudad)
			end if
			if ls_ciudad='999' then
				dw_clientes.setitem(1,'comuna','999')
			end if
			if ls_ciudad='0' then
				dw_clientes.setitem(1,'comuna','0')
			end if

		CASE 'ciudad_comercial'
			ls_ciudad	= dw_clientes.getitemstring(1,'ciudad_comercial')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle2.retrieve(ls_ciudad)
			end if
			if ls_ciudad='999' then
				dw_clientes.setitem(1,'comuna_comercial','999')
			end if
			if ls_ciudad='0' then
				dw_clientes.setitem(1,'comuna_comercial','0')
			end if
		CASE 'fono_p'
			ls_fono_p					= dw_clientes.getitemstring(1,'fono_p')
			if not isnull(ls_fono_p) and ls_fono_p<>'' and ls_fono_p<>'-' then
				ll_fono_p_largo			= len(ls_fono_p)
				if ll_fono_p_largo > 9 then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos')
					dw_clientes.setitem(1,'fono_p',is_fono_particular)
				elseif	ll_fono_p_largo < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos')
					dw_clientes.setitem(1,'fono_p',is_fono_particular)
				else
					if Match(ls_fono_p, "[A-Z]+") then
						messagebox('Advertencia','Solo debe Ingresar Números')
						dw_clientes.setitem(1,'fono_p',is_fono_particular)
					end if
				end if
			end if
		CASE 'celular'
			ls_cel_p			= dw_clientes.getitemstring(1,'celular')
			if not isnull(ls_cel_p) and ls_cel_p<>'' and ls_cel_p<>'-' then
				ll_largo_cel	= len(ls_cel_p)
				if ll_largo_cel >9  then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos')
					dw_clientes.setitem(1,'celular',is_celular)
				elseif	ll_largo_cel < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos')
					dw_clientes.setitem(1,'celular',is_celular)
				else
					if Match(ls_cel_p, "[A-Z]+") then
						messagebox('Advertencia','Solo debe Ingresar Números')
						dw_clientes.setitem(1,'celular',is_celular)
					end if
				end if
			end if
		CASE 'fono_c'
			ls_fono_c		= dw_clientes.getitemstring(1,'fono_c')
			if not isnull(ls_fono_c) and ls_fono_c<>'' and ls_fono_c<>'-' then
				ll_fono_c_largo	= len(ls_fono_c)
				if ll_fono_c_largo >9  then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos')
					dw_clientes.setitem(1,'fono_c',is_fono_c)
				elseif	ll_fono_c_largo < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos')
					dw_clientes.setitem(1,'fono_c',is_fono_c)
				else
					if Match(ls_fono_c, "[A-Z]+") then
						messagebox('Advertencia','Solo debe Ingresar Números')
						dw_clientes.setitem(1,'fono_c',is_fono_c)
					end if
				end if
			end if	
	END CHOOSE
	if (isvalid(w_validar_promesa_operaciones) or isvalid(w_ingresar_funeraria)) then
		if isvalid(w_validar_promesa_operaciones) then
			ls_base			= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'base')
		elseif isvalid(w_ingresar_funeraria) then
			ls_base			= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_anexo_base')
		end if
		if isnull(ls_base) or ls_base='' then
			ls_base			=	'F'
		end if
		dw_clientes.setitem(1,'uso','NI')
		dw_clientes.object.uso.protect					= 1
	end if
	
end if
dw_clientes.accepttext()
end event

event dberror;return 1
end event

event itemfocuschanged;string	ls_columna,ls_fono_p,ls_cel,ls_fono_c
long	ll_fono_p_largo,ls_cel_largo,ll_fono_c_largo

dw_clientes.accepttext()
ls_columna		= dwo.name
if ls_columna <>  'fono_p' then
	ls_fono_p	= dw_clientes.getitemstring(1,'fono_p')
	if not isnull(ls_fono_p) and ls_fono_p<>'' and ls_fono_p<>'-' then
		ll_fono_p_largo				= len(ls_fono_p)
		if ll_fono_p_largo > 9  then
			dw_clientes.setitem(1,'fono_p',is_fono_particular)
		elseif	ll_fono_p_largo < 9  then
			dw_clientes.setitem(1,'fono_p',is_fono_particular)
		elseif ls_fono_p <> '0' then
			if Match(ls_fono_p, "[A-Z]+") then
				dw_clientes.setitem(1,'fono_p',is_fono_particular)
			end if
		end if
	end if
end if
if ls_columna <>  'celular' then
	ls_cel	= dw_clientes.getitemstring(1,'celular')
	if not isnull(ls_cel) and ls_cel<>'' and ls_cel<>'-' then
		ls_cel_largo				= len(ls_cel)
		if ls_cel_largo >9  then
			dw_clientes.setitem(1,'celular',is_celular)
		elseif	ls_cel_largo < 9  then
			dw_clientes.setitem(1,'celular',is_celular)
		elseif 	 ls_cel <> '0' then
			if Match(ls_cel, "[A-Z]+") then
				dw_clientes.setitem(1,'celular',is_celular)
			end if
		end if
	end if
end if
if ls_columna <>  'fono_c' then
	ls_fono_c	= dw_clientes.getitemstring(1,'fono_c')
	if not isnull(ls_fono_c)  and ls_fono_c <> '' and ls_fono_c <> '-' then
		ll_fono_c_largo				= len(ls_fono_c)
		if ll_fono_c_largo >9  then
			dw_clientes.setitem(1,'fono_c',is_fono_c)
		elseif	ll_fono_c_largo < 9  then
			dw_clientes.setitem(1,'fono_c',is_fono_c)
		elseif ls_fono_c <> '0' then
			if Match(ls_fono_c, "[A-Z]+") then
				dw_clientes.setitem(1,'fono_c',is_fono_c)
			end if
		end if
	end if
end if
dw_clientes.accepttext()
end event

