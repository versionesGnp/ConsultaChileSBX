forward
global type w_ingreso_cliente_tercero from window
end type
type pb_grabar from picturebutton within w_ingreso_cliente_tercero
end type
type pb_cerrar from picturebutton within w_ingreso_cliente_tercero
end type
type dw_clientes from datawindow within w_ingreso_cliente_tercero
end type
end forward

global type w_ingreso_cliente_tercero from window
integer width = 3118
integer height = 2176
boolean titlebar = true
string title = "Ingreso Cliente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
pb_grabar pb_grabar
pb_cerrar pb_cerrar
dw_clientes dw_clientes
end type
global w_ingreso_cliente_tercero w_ingreso_cliente_tercero

type variables
date		id_fecha_dia
String	is_opcion,is_dv,is_dv_aux
Long		il_rut,il_correlativo,il_rut_titular,il_rut_aux,il_tipo_cliente=3
end variables

on w_ingreso_cliente_tercero.create
this.pb_grabar=create pb_grabar
this.pb_cerrar=create pb_cerrar
this.dw_clientes=create dw_clientes
this.Control[]={this.pb_grabar,&
this.pb_cerrar,&
this.dw_clientes}
end on

on w_ingreso_cliente_tercero.destroy
destroy(this.pb_grabar)
destroy(this.pb_cerrar)
destroy(this.dw_clientes)
end on

event open;long		ll_fila,ll_rut_aux
String	ls_ciudad,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc,ls_comuna,&
			ls_fono,ls_dv  

Setnull(il_rut);SetNull(gi_rut_tercero)
gf_centrar(w_ingreso_cliente_tercero)
w_ingreso_cliente_tercero.title	= 'Ingreso Cliente                                 Parque: '+gs_nom_cod_parque
is_opcion 				= trim(substr(1,1,Message.StringParm))
il_correlativo			= long(trim(substr(1,2,Message.StringParm)))
id_fecha_dia			= date(gdt_fec_sistema)
if isvalid(w_repacta_mora_mantencion) then
	il_rut_aux			= gi_rut
	is_dv_aux			= gs_dv
	SELECT	"CLIENTE_DEUDOR_TERCERO"."RUT"
	INTO 		:ll_rut_aux
	FROM 	"CLIENTE_DEUDOR_TERCERO"  
	WHERE  ( "CLIENTE_DEUDOR_TERCERO"."BASE" = :gs_base ) AND  
			 ( "CLIENTE_DEUDOR_TERCERO"."SERIE" = :gs_serie ) AND  
			 ( "CLIENTE_DEUDOR_TERCERO"."NUMERO" = :gi_numero ) AND  
			 ( "CLIENTE_DEUDOR_TERCERO"."CORRELATIVO" = :il_correlativo )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if ll_rut_aux<>gi_rut then
			il_rut			= ll_rut_aux
		end if
	end if
else
	il_rut_titular			= gi_rut
	il_rut					= gi_rut
	is_dv					= gs_dv
end if
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
if is_opcion='N' then
	ll_fila				= dw_clientes.InsertRow(0)
	dw_clientes.SetItem(ll_fila, "estado_rut",0)
	dw_clientes.SetItem(ll_fila, "rut", il_rut)
	dw_clientes.SetItem(ll_fila, "tipo_cliente", il_tipo_cliente)
	dw_clientes.SetItem(ll_fila, "tipo", "O")
	dw_clientes.SetItem(ll_fila, "poblacion", "-")
	dw_clientes.SetItem(ll_fila, 'fecha_ingr',id_fecha_dia)
	dw_clientes.SetItem(ll_fila, "usuario", gs_user)
	dw_clientes.SetItem(ll_fila, 'estado_titular','0')
	dw_clientes.setitem(ll_fila, 'estado_cobranza','0')
	dw_clientes.SetItem(ll_fila, 'auto_propio','N')
	dw_clientes.SetItem(ll_fila, 'casa_propia','N')
elseif is_opcion='M' then
	dw_clientes.retrieve(il_rut)
	ls_ciudad	= dw_clientes.getitemstring(1,'ciudad')
	if not isnull(ls_ciudad) and ls_ciudad<>'' then
		idw_detalle.retrieve(ls_ciudad)
	end if
	ls_ciudad	= dw_clientes.getitemstring(1,'ciudad_comercial')
	if not isnull(ls_ciudad) and ls_ciudad<>'' then
		idw_detalle2.retrieve(ls_ciudad)
	end if
	ll_fila						= 1
	if isnull(dw_clientes.getitemstring(1, "usuario")) then dw_clientes.setitem(1, "usuario",gs_user)
	dw_clientes.SetItem(1, "estado_rut",1)
	pb_grabar.enabled	= true
end if
end event

event close;if isvalid(w_repacta_mora_mantencion) or isvalid(w_repacta_mora_mantencion_reprog) then
//	gi_rut	= il_rut_aux
//	gs_dv		= is_dv_aux
else
//	gi_rut	= il_rut
//	gs_dv		= is_dv
end if
end event

type pb_grabar from picturebutton within w_ingreso_cliente_tercero
integer x = 37
integer y = 1920
integer width = 293
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar"
boolean originalsize = true
end type

event clicked;String	ls_nombre,ls_ap_pat,ls_ap_mat,ls_dir_particular,ls_ciudad,&
			ls_comuna,ls_sexo,ls_esta_civil,ls_auto_propio,ls_casa_propia,ls_ciudad_real,&
			ls_dir_comercial,ls_ciudad_comercial,ls_comuna_comercial,ls_age_aux,ls_poblacion,&
			ls_sector,ls_fono_p,ls_domicilio_c,ls_fono_c,ls_tipo_via,ls_nro_part,ls_depto_part,&
			ls_block_part,ls_dv_aux,ls_nombre_aux,ls_ap_pat_aux,ls_ap_mat_aux,ls_dv
Datetime	ldt_fecha_nac,ldt_fecha_ingreso,ldt_fecha_ingr
Double	ld_valor_uf
Long		ll_avaluo_auto,ll_avaluo_casa,ll_total_rent,ll_grupo_f,ll_rut_aux,ll_rut,&
			ll_sw1=0,ll_sw2=0

dw_clientes.accepttext()
ll_rut						= dw_clientes.getitemnumber(1,'rut')
ls_dv						= dw_clientes.getitemstring(1,'dv')
gi_rut_tercero			= ll_rut
gs_dv						= ls_dv
ls_nombre				= dw_clientes.getitemstring(1,'nombre')
ls_ap_pat				= dw_clientes.getitemstring(1,'a_paterno')
ls_ap_mat				= dw_clientes.getitemstring(1,'a_materno')
ls_dir_particular		= dw_clientes.getitemstring(1,'direccion_p')
ls_poblacion				= dw_clientes.getitemstring(1,'poblacion')
ls_sector					= dw_clientes.getitemstring(1,'sector')
ls_ciudad					= dw_clientes.getitemstring(1,'ciudad')
ls_comuna				= dw_clientes.getitemstring(1,'comuna')
ls_fono_p				= dw_clientes.getitemstring(1,'fono_p')
ls_domicilio_c			= dw_clientes.getitemstring(1,'domicilio_c')
ls_fono_c				= dw_clientes.getitemstring(1,'fono_c')
ldt_fecha_ingr			= dw_clientes.getitemdatetime(1,'fecha_ingr')
ll_total_rent				= dw_clientes.getitemnumber(1,'total_rent')
ll_grupo_f				= dw_clientes.getitemnumber(1,'grupo_f')
ls_tipo_via				= dw_clientes.getitemstring(1,'tipo_via')
ls_nro_part				= dw_clientes.getitemstring(1,'numero_particular')
ls_depto_part			= dw_clientes.getitemstring(1,'depto_particular')
ls_block_part			= dw_clientes.getitemstring(1,'block_particular')
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
if isnull(dw_clientes.getitemstring(1,'direccion_p')) or dw_clientes.getitemstring(1,'direccion_p')='' 				then dw_clientes.setitem(1,'direccion_p','-')
if isnull(dw_clientes.getitemstring(1,'numero_particular')) or dw_clientes.getitemstring(1,'numero_particular')='' then dw_clientes.setitem(1,'numero_particular','-')
if isnull(dw_clientes.getitemstring(1,'depto_particular')) or dw_clientes.getitemstring(1,'depto_particular')=''	then dw_clientes.setitem(1,'depto_particular','-')
if isnull(dw_clientes.getitemstring(1,'block_particular')) or dw_clientes.getitemstring(1,'block_particular')=''	then dw_clientes.setitem(1,'block_particular','-')
if isnull(dw_clientes.getitemstring(1,'poblacion')) or dw_clientes.getitemstring(1,'poblacion')='' 					then dw_clientes.setitem(1,'poblacion','-')
if isnull(dw_clientes.getitemstring(1,'sector')) or dw_clientes.getitemstring(1,'sector')='' 							then dw_clientes.setitem(1,'sector','-')
if isnull(dw_clientes.getitemstring(1,'fono_p')) or dw_clientes.getitemstring(1,'fono_p')='' 							then dw_clientes.setitem(1,'fono_p','-')
if isnull(dw_clientes.getitemstring(1,'actividad')) or dw_clientes.getitemstring(1,'actividad')='' 					then dw_clientes.setitem(1,'actividad','-')
if isnull(dw_clientes.getitemstring(1,'empleador')) or dw_clientes.getitemstring(1,'empleador')='' 					then dw_clientes.setitem(1,'empleador','-')
if isnull(dw_clientes.getitemstring(1,'numero_comercial')) or dw_clientes.getitemstring(1,'numero_comercial')=''	then dw_clientes.setitem(1,'numero_comercial','-')
if isnull(dw_clientes.getitemstring(1,'fono_c')) or dw_clientes.getitemstring(1,'fono_c')='' 							then dw_clientes.setitem(1,'fono_c','-')
if isnull(dw_clientes.getitemstring(1,'nombre')) or dw_clientes.getitemstring(1,'nombre')='' 							then dw_clientes.setitem(1,'nombre','-')
if isnull(dw_clientes.getitemstring(1,'a_paterno')) or dw_clientes.getitemstring(1,'a_paterno')='' 					then dw_clientes.setitem(1,'a_paterno','-')
if isnull(dw_clientes.getitemstring(1,'a_materno')) or dw_clientes.getitemstring(1,'a_materno')='' 					then dw_clientes.setitem(1,'a_materno','-')
dw_clientes.accepttext()
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
elseif isnull(ls_dir_particular) or len(trim(ls_dir_particular))=0 then
	messagebox("Advertencia","Falta ingresar Dirección Particular del Cliente")
	dw_clientes.setitem(1,'direccion_p','-')
	dw_clientes.setfocus()
	dw_clientes.setcolumn('direccion_p')
elseif isnull(ls_tipo_via) or len(trim(ls_tipo_via))=0 then
	messagebox("Advertencia","Falta ingresar Tipo Via")
	dw_clientes.setitem(1,'tipo_via','-')
	dw_clientes.setfocus()
	dw_clientes.setcolumn('tipo_via')
elseif isnull(ls_nro_part) or len(trim(ls_nro_part))=0 then
	messagebox("Advertencia","Falta ingresar Numero Dirección Particular del Cliente")
	dw_clientes.setitem(1,'numero_particular','-')
	dw_clientes.setfocus()
	dw_clientes.setcolumn('numero_particular')
elseif isnull(ls_dir_comercial) or len(trim(ls_dir_comercial))=0 then
	messagebox("Advertencia","Falta ingresar Dirección Comercial del Cliente")
	dw_clientes.setitem(1,'domicilio_c','-')
	dw_clientes.setfocus()
	dw_clientes.setcolumn('domicilio_c')
elseif isnull(ls_ciudad) or len(trim(ls_ciudad))=0 then
	messagebox("Advertencia","Falta ingresar Ciudad del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('ciudad')
elseif isnull(ls_ciudad_comercial) or len(trim(ls_ciudad_comercial))=0 then
	messagebox("Advertencia","Falta ingresar Ciudad Comercial del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('ciudad_comercial')
elseif isnull(ls_comuna) or len(trim(ls_comuna))=0 then
	messagebox("Advertencia","Falta ingresar Comuna del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('comuna')
elseif isnull(ls_comuna_comercial) or len(trim(ls_comuna_comercial))=0 then
	messagebox("Advertencia","Falta ingresar Comuna Comercial del Cliente")
	dw_clientes.setfocus()
	dw_clientes.setcolumn('comuna_comercial')
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
else
	ls_ciudad			= dw_clientes.getitemstring(1,'ciudad')
	ls_comuna			= dw_clientes.getitemstring(1,'comuna')
	SELECT	"COMUNA"."CODIGO_CIUDAD"  
	INTO 		:ls_ciudad_real  
	FROM 		"COMUNA"  
	WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_comuna   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if ls_ciudad<>ls_ciudad_real then
			messagebox("Advertencia","Comuna seleccionada en Domicilio Particular NO corresponde a Región Seleccionada")
			dw_clientes.setfocus()
			dw_clientes.setcolumn('comuna')
			ll_sw1		= 1
		else
			ls_ciudad			= dw_clientes.getitemstring(1,'ciudad_comercial')
			ls_comuna			= dw_clientes.getitemstring(1,'comuna_comercial')
			if not isnull(ls_ciudad) or not isnull(ls_comuna) then
				SELECT	"COMUNA"."CODIGO_CIUDAD"  
				INTO 		:ls_ciudad_real  
				FROM 		"COMUNA"  
				WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_comuna   
				USING		sqlca;
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
			//////// Reprogramación de Mantención
			if isvalid(w_repacta_mora_mantencion) or isvalid(w_repacta_mora_mantencion_reprog) then
				if isvalid(w_repacta_mora_mantencion) then
					w_repacta_mora_mantencion.dw_detalle.object.t_titulo_1.text				= 'CLIENTE  '+string(ll_rut,"###,###,###,##0")+' - '+ls_dv+'     '+ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
				elseif isvalid(w_repacta_mora_mantencion_reprog) then
					w_repacta_mora_mantencion_reprog.dw_detalle.object.t_titulo_1.text	= 'CLIENTE  '+string(ll_rut,"###,###,###,##0")+' - '+ls_dv+'     '+ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
				end if
				SELECT	"CLIENTE_DEUDOR_TERCERO"."RUT",
							"CLIENTE_DEUDOR_TERCERO"."DV",
							"CLIENTE_DEUDOR_TERCERO"."NOMBRE",
							"CLIENTE_DEUDOR_TERCERO"."A_PATERNO",
							"CLIENTE_DEUDOR_TERCERO"."A_MATERNO"
				INTO 		:ll_rut_aux,
							:ls_dv_aux,
							:ls_nombre_aux,
							:ls_ap_pat_aux,
							:ls_ap_mat_aux
				FROM 		"CLIENTE_DEUDOR_TERCERO"  
				WHERE 	"CLIENTE_DEUDOR_TERCERO"."RUT" = :ll_rut   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					UPDATE	"CLIENTE_DEUDOR_TERCERO"  
					SET 		"RUT_TITULAR" = :gi_rut
					WHERE 	"CLIENTE_DEUDOR_TERCERO"."RUT" = :ll_rut   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					if isvalid(w_repacta_mora_mantencion) then
						w_repacta_mora_mantencion.cb_terceros.italic						= true
					elseif isvalid(w_repacta_mora_mantencion_reprog) then
						w_repacta_mora_mantencion_reprog.cb_terceros.italic			= true
					end if
					il_rut																			= ll_rut
					is_dv																				= gs_dv
					if isvalid(w_repacta_mora_mantencion) then
						w_repacta_mora_mantencion.st_cliente_tercero.text				= 'Reprograma No Titular:  '+string(ll_rut,"###,###,###,###,###")+'-'+ls_dv_aux+'     '+ls_nombre_aux+' '+ls_ap_pat_aux+' '+ls_ap_mat_aux
					elseif isvalid(w_repacta_mora_mantencion_reprog) then
						w_repacta_mora_mantencion_reprog.st_cliente_tercero.text		= 'Reprograma No Titular:  '+string(ll_rut,"###,###,###,###,###")+'-'+ls_dv_aux+'     '+ls_nombre_aux+' '+ls_ap_pat_aux+' '+ls_ap_mat_aux
					end if
					messagebox("Grabar","Grabación Exitosa")
				elseif sqlca.sqlcode=100 then
					INSERT INTO		"CLIENTE_DEUDOR_TERCERO"  
								(	"RUT",	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"DIRECCION_P",			"POBLACION",	"SECTOR",	"COMUNA",	"CIUDAD",	"FONO_P",	"SEXO",		"FECHA_NAC",		"ESTA_CIVIL",		"DOMICILIO_C",		"FONO_C",	"FECHA_INGR",		"TOTAL_RENT",		"GRUPO_F",		"DV",		"USUARIO",	"RUT_TITULAR",		"BASE",		"SERIE",		"NUMERO",	"CORRELATIVO",		"NUMERO_PARTICULAR",	"DEPTO_PARTICULAR",	"BLOCK_PARTICULAR" )
					VALUES 	( 	:ll_rut,	:ls_nombre,	:ls_ap_pat,		:ls_ap_mat,		:ls_dir_particular,	:ls_poblacion,	:ls_sector,	:ls_comuna,	:ls_ciudad,	:ls_fono_p,	:ls_sexo,	:ldt_fecha_nac,	:ls_esta_civil,	:ls_domicilio_c,	:ls_fono_c,	:ldt_fecha_ingr,	:ll_total_rent,	:ll_grupo_f,   :ls_dv,	:gs_user,	:gi_rut,				:gs_base,	:gs_serie,	:gi_numero,	:il_correlativo,	:ls_nro_part,			:ls_depto_part,		:ls_block_part )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						if isvalid(w_repacta_mora_mantencion) then
							w_repacta_mora_mantencion.cb_terceros.italic					= true
						elseif isvalid(w_repacta_mora_mantencion_reprog) then
							w_repacta_mora_mantencion_reprog.cb_terceros.italic		= true
						end if
						gi_rut_tercero																= ll_rut
						if isvalid(w_repacta_mora_mantencion) then
							w_repacta_mora_mantencion.st_cliente_tercero.text			= 'Reprograma No Titular:  '+string(ll_rut,"###,###,###,###,###")+'-'+ls_dv+'     '+ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
						elseif isvalid(w_repacta_mora_mantencion_reprog) then
							w_repacta_mora_mantencion_reprog.st_cliente_tercero.text	= 'Reprograma No Titular:  '+string(ll_rut,"###,###,###,###,###")+'-'+ls_dv+'     '+ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
						end if
						il_rut																		= gi_rut
						is_dv																			= gs_dv
						messagebox("Grabar","Grabación Exitosa")
					else
						rollback;
						messagebox("Error","Error al Grabar Cliente Deudor Tercero SQL: "+sqlca.sqlerrtext)
					end if
				elseif sqlca.sqlcode=-1 then
					messagebox("Error","Error al Grabar Cliente Deudor Tercero SQL: "+sqlca.sqlerrtext)
				end if
			end if
			close(w_ingreso_cliente_tercero)
		else
			rollback;
			messagebox("Error","Error al Grabar "+SQLCA.SQLErrText)
		end if	
	end if
end if
end event

type pb_cerrar from picturebutton within w_ingreso_cliente_tercero
integer x = 2734
integer y = 1920
integer width = 329
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
boolean originalsize = true
end type

event clicked;if isvalid(w_repacta_mora_mantencion) or isvalid(w_repacta_mora_mantencion_reprog) then
//	gi_rut	= il_rut_aux
//	gs_dv		= is_dv_aux
else
//	gi_rut	= il_rut
//	gs_dv		= is_dv
end if
setnull(gi_rut_tercero)
close(w_ingreso_cliente_tercero)
end event

type dw_clientes from datawindow within w_ingreso_cliente_tercero
integer x = 32
integer y = 32
integer width = 3035
integer height = 1856
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_nuevo_clientes_tercero"
boolean border = false
boolean livescroll = true
end type

event clicked;string	ls_columna,ls_fecha,ls_fono_p,ls_cel_p,ls_fono_c
long		ll_estado_rut,ll_fono_p_largo,ll_largo_cel,ll_fono_c_largo

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
		CASE 'fono_p'
			ls_fono_p	= dw_clientes.getitemstring(1,'fono_p')
			if not isnull(ls_fono_p) and ls_fono_p<>'' then
				ll_fono_p_largo	= len(ls_fono_p)
				if ll_fono_p_largo >9  and ls_fono_p <> '0' then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos, Ingrese solo números')
					dw_clientes.setitem(1,'fono_p','0')
				elseif	ll_fono_p_largo < 9 and ls_fono_p <> '0' then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos, Ingrese solo números')
					dw_clientes.setitem(1,'fono_p','0')
				else
					if Match(ls_fono_p, "[A-Z]") then
						messagebox('Advertencia','Ingrese solo números')
						dw_clientes.setitem(1,'fono_p','0')
					end if
				end if
			end if
		CASE 'celular'
			ls_cel_p	= dw_clientes.getitemstring(1,'celular')
			if not isnull(ls_cel_p) and ls_cel_p<>'' then
				ll_largo_cel	= len(ls_cel_p)
				if ll_largo_cel >9  and ls_cel_p <> '0' then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos, Ingrese solo números')
					dw_clientes.setitem(1,'celular','0')
				elseif	ll_largo_cel < 9 and ls_cel_p <> '0' then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos, Ingrese solo números')
					dw_clientes.setitem(1,'celular','0')
				else
					if Match(ls_cel_p, "[A-Z]") then
						messagebox('Advertencia','Ingrese solo números')
						dw_clientes.setitem(1,'celular','0')
					end if
				end if
			end if
		CASE 'fono_c'
			ls_fono_c	= dw_clientes.getitemstring(1,'fono_c')
			if not isnull(ls_fono_c) and ls_fono_c<>'' then
				ll_fono_c_largo	= len(ls_fono_c)
				if ll_fono_c_largo >9  and ls_fono_c <> '0' then
					messagebox('Advertencia','No puede Ingresar más de 9 Digitos, Ingrese solo números')
					dw_clientes.setitem(1,'fono_c','0')
				elseif	ll_fono_c_largo < 9 and ls_fono_c <> '0' then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos, Ingrese solo números')
					dw_clientes.setitem(1,'fono_c','0')
				else
					if Match(ls_fono_c, "[A-Z]") then
						messagebox('Advertencia','Ingrese solo números')
						dw_clientes.setitem(1,'fono_c','0')
					end if
				end if
			end if		
	END CHOOSE
end if
end event

event itemchanged;String	ls_ciudad,ls_columna,ls_null,ls_estado,ls_nom,ls_ap_pat,ls_ap_mat,ls_dv
Long		ll_avaluo,ll_fila,ll_rut

ls_columna		= dwo.name
dw_clientes.accepttext()
if dw_clientes.getrow()>0 then 
	if ls_columna='rut' or ls_columna='dv' then
		ls_dv			= trim(dw_clientes.getitemstring(1,'dv'))
		ll_rut		= dw_clientes.getitemnumber(1,'rut')
		if not isnull(ll_rut) and ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				messagebox('Error','El Rut no es valido',stopsign!)
				pb_grabar.enabled					= false
				dw_clientes.reset()
				ll_fila				= dw_clientes.InsertRow(0)
				dw_clientes.SetItem(ll_fila, "estado_rut",0)
				dw_clientes.SetItem(ll_fila, "rut", ll_rut)
				dw_clientes.SetItem(ll_fila, "tipo", "O")
				dw_clientes.SetItem(ll_fila, "poblacion", "-")
				dw_clientes.SetItem(ll_fila, 'fecha_ingr',id_fecha_dia)
				dw_clientes.SetItem(ll_fila, "usuario", gs_user)
				dw_clientes.SetItem(ll_fila, 'estado_titular','0')
				dw_clientes.setitem(ll_fila, 'estado_cobranza','0')
				dw_clientes.SetItem(ll_fila, 'auto_propio','N')
				dw_clientes.SetItem(ll_fila, 'casa_propia','N')
				dw_clientes.accepttext()
				dw_clientes.setfocus()
				if ls_columna='dv' then
					dw_clientes.setcolumn('dv')
				else
					dw_clientes.setcolumn('rut')
				end if
			else
				if dw_clientes.retrieve(ll_rut)>0 then
					pb_grabar.enabled					= true
					dw_clientes.SetItem(1, "estado_rut",1)
					dw_clientes.setcolumn('nombre')
				else
					pb_grabar.enabled					= true
					dw_clientes.reset()
					ll_fila				= dw_clientes.InsertRow(0)
					dw_clientes.SetItem(ll_fila, "estado_rut",1)
					dw_clientes.SetItem(ll_fila, "rut", ll_rut)
					dw_clientes.SetItem(ll_fila, "tipo", "O")
					dw_clientes.SetItem(ll_fila, "poblacion", "-")
					dw_clientes.SetItem(ll_fila, 'fecha_ingr',id_fecha_dia)
					dw_clientes.SetItem(ll_fila, "usuario", gs_user)
					dw_clientes.SetItem(ll_fila, 'estado_titular','0')
					dw_clientes.setitem(ll_fila, 'estado_cobranza','0')
					dw_clientes.SetItem(ll_fila, 'auto_propio','N')
					dw_clientes.SetItem(ll_fila, 'casa_propia','N')
					dw_clientes.SetItem(ll_fila, 'dv',ls_dv)
					dw_clientes.accepttext()
					dw_clientes.setfocus()
					dw_clientes.setcolumn('nombre')
				end if
			end if
		end if

	elseif ls_columna='ciudad' then
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

	elseif ls_columna='ciudad_comercial' then
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
	end if
end if
end event

