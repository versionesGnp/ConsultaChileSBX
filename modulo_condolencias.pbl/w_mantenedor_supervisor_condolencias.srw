forward
global type w_mantenedor_supervisor_condolencias from window
end type
type cb_cerrar from commandbutton within w_mantenedor_supervisor_condolencias
end type
type cb_grabar from commandbutton within w_mantenedor_supervisor_condolencias
end type
type dw_ingreso_cliente_condolencias from datawindow within w_mantenedor_supervisor_condolencias
end type
end forward

global type w_mantenedor_supervisor_condolencias from window
integer width = 3104
integer height = 2404
boolean titlebar = true
string title = "Ingreso Cliente Completo UGN"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_ingreso_cliente_condolencias dw_ingreso_cliente_condolencias
end type
global w_mantenedor_supervisor_condolencias w_mantenedor_supervisor_condolencias

type variables
date		id_fecha_dia
String	is_opcion

end variables

on w_mantenedor_supervisor_condolencias.create
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_ingreso_cliente_condolencias=create dw_ingreso_cliente_condolencias
this.Control[]={this.cb_cerrar,&
this.cb_grabar,&
this.dw_ingreso_cliente_condolencias}
end on

on w_mantenedor_supervisor_condolencias.destroy
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_ingreso_cliente_condolencias)
end on

event open;long ll_fila,ll_reg_ing,ll_grupo,ll_correlativo,ll_ciudad

if gs_depto = 'R' or gs_depto = 'I' or gs_depto = 'X' then
	gf_centrar(w_mantenedor_supervisor_condolencias)
	w_mantenedor_supervisor_condolencias.title	= 'Ingreso Completo Prospecto MC                   Parque: '+gs_nom_cod_parque
	dw_ingreso_cliente_condolencias.settransobject(sqlca)
	id_fecha_dia					= date(gdt_fec_sistema)
	dw_ingreso_cliente_condolencias.SetTransObject(SQLCA)
	dw_ingreso_cliente_condolencias.getchild('comuna',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.insertrow(0)
	dw_ingreso_cliente_condolencias.getchild('comuna_comercial',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	idw_detalle2.insertrow(0)
	ll_fila							= dw_ingreso_cliente_condolencias.InsertRow(0)
	dw_ingreso_cliente_condolencias.SetItem(ll_fila, "fecha_ingreso_trabajo",id_fecha_dia)
	dw_ingreso_cliente_condolencias.SetItem(ll_fila, "fecha_nac",id_fecha_dia)	
	dw_ingreso_cliente_condolencias.insertrow(0)
	if isvalid(w_ingreso_individual_ugn) then
		ll_reg_ing					= w_ingreso_individual_ugn.dw_lista.getrow()
		ll_grupo						= w_ingreso_individual_ugn.dw_lista.GetItemNumber(ll_reg_ing,'ugn_cliente_grupo')
		ll_correlativo				= w_ingreso_individual_ugn.dw_lista.GetItemNumber(ll_reg_ing,'ugn_cliente_correlativo')
		if dw_ingreso_cliente_condolencias.retrieve(ll_grupo,ll_correlativo) > 0 then
			dw_ingreso_cliente_condolencias.setitem(1,'estado_rut',0)
			dw_ingreso_cliente_condolencias.accepttext()
			cb_grabar.enabled		= true
			dw_ingreso_cliente_condolencias.setfocus()
		end if
	end if
else
	Messagebox("Advertencia","Usted no tiene Acceso a Esta Aplicación")
	close(w_mantenedor_supervisor_condolencias)
end if

end event

type cb_cerrar from commandbutton within w_mantenedor_supervisor_condolencias
integer x = 2752
integer y = 2132
integer width = 302
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_mantenedor_supervisor_condolencias)
end event

type cb_grabar from commandbutton within w_mantenedor_supervisor_condolencias
integer x = 32
integer y = 2128
integer width = 302
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar"
end type

event clicked;String	ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_dir_particular,ls_ciudad,&
			ls_comuna,ls_sexo,ls_esta_civil,ls_auto_propio,ls_casa_propia,ls_ciudad_real,&
			ls_dir_comercial,ls_ciudad_comercial,ls_comuna_comercial,ls_age_aux,ls_tipo_via
Datetime	ldt_fecha_nac,ldt_fecha_ingreso
Double	ld_valor_uf
Long		ll_avaluo_auto,ll_avaluo_casa,ll_sw1=0,ll_sw2=0
String	ls_cod_age,ls_cod_sup,ls_cod_jefe,ls_descrip
Long		ll_estado,ll_rut,ll_comparar_rut

dw_ingreso_cliente_condolencias.accepttext()
ls_dv						= dw_ingreso_cliente_condolencias.getitemstring(1,'dv')
ls_nombre				= dw_ingreso_cliente_condolencias.getitemstring(1,'nombre')
ls_ap_pat				= dw_ingreso_cliente_condolencias.getitemstring(1,'a_paterno')
ls_ap_mat				= dw_ingreso_cliente_condolencias.getitemstring(1,'a_materno')
ls_dir_particular		= dw_ingreso_cliente_condolencias.getitemstring(1,'direccion_p')
ls_tipo_via				= dw_ingreso_cliente_condolencias.getitemstring(1,'tipo_via')
ls_ciudad				= dw_ingreso_cliente_condolencias.getitemstring(1,'ciudad')
ls_comuna				= dw_ingreso_cliente_condolencias.getitemstring(1,'comuna')
ldt_fecha_nac			= dw_ingreso_cliente_condolencias.getitemdatetime(1,'fecha_nac')
ls_sexo					= dw_ingreso_cliente_condolencias.getitemstring(1,'sexo')
ls_esta_civil			= dw_ingreso_cliente_condolencias.getitemstring(1,'esta_civil')
ls_auto_propio			= dw_ingreso_cliente_condolencias.getitemstring(1,'auto_propio')
ls_casa_propia			= dw_ingreso_cliente_condolencias.getitemstring(1,'casa_propia')
ll_avaluo_auto			= dw_ingreso_cliente_condolencias.getitemnumber(1,'avaluo_auto')
ll_avaluo_casa			= dw_ingreso_cliente_condolencias.getitemnumber(1,'avaluo_casa')
ls_dir_comercial		= dw_ingreso_cliente_condolencias.getitemstring(1,'domicilio_c')
ls_ciudad_comercial	= dw_ingreso_cliente_condolencias.getitemstring(1,'ciudad_comercial')
ls_comuna_comercial	= dw_ingreso_cliente_condolencias.getitemstring(1,'comuna_comercial')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'numero_particular')) or dw_ingreso_cliente_condolencias.getitemstring(1,'numero_particular')='' then dw_ingreso_cliente_condolencias.setitem(1,'numero_particular','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'depto_particular')) or dw_ingreso_cliente_condolencias.getitemstring(1,'depto_particular')=''	then dw_ingreso_cliente_condolencias.setitem(1,'depto_particular','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'block_particular')) or dw_ingreso_cliente_condolencias.getitemstring(1,'block_particular')=''	then dw_ingreso_cliente_condolencias.setitem(1,'block_particular','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'poblacion')) or dw_ingreso_cliente_condolencias.getitemstring(1,'poblacion')='' 					then dw_ingreso_cliente_condolencias.setitem(1,'poblacion','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'tipo_via')) or dw_ingreso_cliente_condolencias.getitemstring(1,'tipo_via')='' 						then dw_ingreso_cliente_condolencias.setitem(1,'tipo_via','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'sector')) or dw_ingreso_cliente_condolencias.getitemstring(1,'sector')='' 							then dw_ingreso_cliente_condolencias.setitem(1,'sector','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'fono_p')) or dw_ingreso_cliente_condolencias.getitemstring(1,'fono_p')='' 							then dw_ingreso_cliente_condolencias.setitem(1,'fono_p','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'actividad')) or dw_ingreso_cliente_condolencias.getitemstring(1,'actividad')='' 					then dw_ingreso_cliente_condolencias.setitem(1,'actividad','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'empleador')) or dw_ingreso_cliente_condolencias.getitemstring(1,'empleador')='' 					then dw_ingreso_cliente_condolencias.setitem(1,'empleador','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'numero_comercial')) or dw_ingreso_cliente_condolencias.getitemstring(1,'numero_comercial')=''	then dw_ingreso_cliente_condolencias.setitem(1,'numero_comercial','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'fono_c')) or dw_ingreso_cliente_condolencias.getitemstring(1,'fono_c')='' 							then dw_ingreso_cliente_condolencias.setitem(1,'fono_c','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'nombre')) or dw_ingreso_cliente_condolencias.getitemstring(1,'nombre')='' 							then dw_ingreso_cliente_condolencias.setitem(1,'nombre','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'a_paterno')) or dw_ingreso_cliente_condolencias.getitemstring(1,'a_paterno')='' 					then dw_ingreso_cliente_condolencias.setitem(1,'a_paterno','-')
if isnull(dw_ingreso_cliente_condolencias.getitemstring(1,'a_materno')) or dw_ingreso_cliente_condolencias.getitemstring(1,'a_materno')='' 					then dw_ingreso_cliente_condolencias.setitem(1,'a_materno','-')
dw_ingreso_cliente_condolencias.accepttext()
if isnull(ls_dv) or len(trim(ls_dv))=0 then
	messagebox("Advertencia","Falta ingresar Dígito Verificador del Cliente")
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('dv')
elseif isnull(ls_nombre) or len(trim(ls_nombre))=0 then
	messagebox("Advertencia","Falta ingresar Nombre del Cliente")
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('nombre')
elseif isnull(ls_ap_pat) or len(trim(ls_ap_pat))=0 then
	messagebox("Advertencia","Falta ingresar Apellido Paterno del Cliente")
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('a_paterno')
elseif isnull(ls_ap_mat) or len(trim(ls_ap_mat))=0 then
	messagebox("Advertencia","Falta ingresar Apellido Materno del Cliente")
	dw_ingreso_cliente_condolencias.setitem(1,'a_materno','-')
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('a_materno')
elseif isnull(ls_tipo_via) or len(trim(ls_tipo_via))=0 then
	messagebox("Advertencia","Falta ingresar Tipo Via")
	dw_ingreso_cliente_condolencias.setitem(1,'tipo_via','-')
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('tipo_via')
elseif isnull(ls_dir_particular) or len(trim(ls_dir_particular))=0 then
	messagebox("Advertencia","Falta ingresar Dirección Particular del Cliente")
	dw_ingreso_cliente_condolencias.setitem(1,'direccion_p','-')
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('direccion_p')
elseif isnull(ls_dir_comercial) or len(trim(ls_dir_comercial))=0 then
	messagebox("Advertencia","Falta ingresar Dirección Comercial del Cliente")
	dw_ingreso_cliente_condolencias.setitem(1,'domicilio_c','-')
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('domicilio_c')
elseif isnull(ls_ciudad) or len(trim(ls_ciudad))=0 then
	messagebox("Advertencia","Falta ingresar Ciudad del Cliente")
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('ciudad')
elseif isnull(ls_ciudad_comercial) or len(trim(ls_ciudad_comercial))=0 then
	messagebox("Advertencia","Falta ingresar Ciudad Comercial del Cliente")
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('ciudad_comercial')
elseif isnull(ls_comuna) or len(trim(ls_comuna))=0 then
	messagebox("Advertencia","Falta ingresar Comuna del Cliente")
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('comuna')
elseif isnull(ls_comuna_comercial) or len(trim(ls_comuna_comercial))=0 then
	messagebox("Advertencia","Falta ingresar Comuna Comercial del Cliente")
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('comuna_comercial')
elseif isnull(ldt_fecha_nac) then
	messagebox("Advertencia","Falta ingresar Fecha Nacimiento del Cliente")
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('fecha_nac')
elseif isnull(ls_sexo) or len(trim(ls_sexo))=0 then
	messagebox("Advertencia","Falta ingresar Sexo del Cliente")
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('sexo')
elseif isnull(ls_esta_civil) or len(trim(ls_esta_civil))=0 then
	messagebox("Advertencia","Falta ingresar Estado Civil del Cliente")
	dw_ingreso_cliente_condolencias.setfocus()
	dw_ingreso_cliente_condolencias.setcolumn('esta_civil')
else
	ls_ciudad			= dw_ingreso_cliente_condolencias.getitemstring(1,'ciudad')
	ls_comuna			= dw_ingreso_cliente_condolencias.getitemstring(1,'comuna')
	SELECT	"COMUNA"."CODIGO_CIUDAD"  
	INTO 		:ls_ciudad_real  
	FROM 		"COMUNA"  
	WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_comuna   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if ls_ciudad<>ls_ciudad_real then
			messagebox("Advertencia","Comuna seleccionada en Domicilio Particular NO corresponde a Región Seleccionada")
			dw_ingreso_cliente_condolencias.setfocus()
			dw_ingreso_cliente_condolencias.setcolumn('comuna')
			ll_sw1		= 1
		else
			ls_ciudad			= dw_ingreso_cliente_condolencias.getitemstring(1,'ciudad_comercial')
			ls_comuna			= dw_ingreso_cliente_condolencias.getitemstring(1,'comuna_comercial')
			if not isnull(ls_ciudad) or not isnull(ls_comuna) then
				SELECT	"COMUNA"."CODIGO_CIUDAD"  
				INTO 		:ls_ciudad_real  
				FROM 		"COMUNA"  
				WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_comuna   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if ls_ciudad<>ls_ciudad_real then
						messagebox("Advertencia","Comuna seleccionada en Domicilio Comercial NO corresponde a Región Seleccionada")
						dw_ingreso_cliente_condolencias.setfocus()
						dw_ingreso_cliente_condolencias.setcolumn('comuna_comercial')
						ll_sw2	= 1
					end if
				end if
			end if				
		end if
	end if
	if ll_sw1=0 and ll_sw2=0 then
		if ls_auto_propio='S' and (ll_avaluo_auto<=0 or isnull(ll_avaluo_auto)) then
			messagebox("Advertencia","Falta ingresar Avaluo Auto")
			dw_ingreso_cliente_condolencias.setfocus()
			dw_ingreso_cliente_condolencias.setcolumn('avaluo_auto')
		elseif ls_casa_propia='S' and (ll_avaluo_casa<=0 or isnull(ll_avaluo_casa)) then
			messagebox("Advertencia","Falta ingresar Avaluo Casa")
			dw_ingreso_cliente_condolencias.setfocus()
			dw_ingreso_cliente_condolencias.setcolumn('avaluo_casa')
		end if
		if ls_auto_propio='N' then dw_ingreso_cliente_condolencias.setitem(1,'avaluo_auto',0)
		if ls_casa_propia='N' then dw_ingreso_cliente_condolencias.setitem(1,'avaluo_casa',0)
		dw_ingreso_cliente_condolencias.accepttext()
		if dw_ingreso_cliente_condolencias.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback;
			messagebox("Error","Error al Grabar "+SQLCA.SQLErrText)
		end if	
	end if
end if

end event

type dw_ingreso_cliente_condolencias from datawindow within w_mantenedor_supervisor_condolencias
integer x = 23
integer y = 32
integer width = 3054
integer height = 2068
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_nuevo_cliente_condolencia"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_fecha
long		ll_estado_rut

ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_1'
		ls_fecha	= string(date(dw_ingreso_cliente_condolencias.getitemdatetime(1,'fecha_nac')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_ingreso_cliente_condolencias.setitem(1,'fecha_nac',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_ingreso_cliente_condolencias.setitem(1,'fecha_nac',date(ls_fecha))
		END IF

	CASE 'p_2'
		ls_fecha	= string(date(dw_ingreso_cliente_condolencias.getitemdatetime(1,'fecha_ingr')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_ingreso_cliente_condolencias.setitem(1,'fecha_ingr',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_ingreso_cliente_condolencias.setitem(1,'fecha_ingr',date(ls_fecha))
		END IF

	CASE 'p_3'
		ls_fecha	= string(date(dw_ingreso_cliente_condolencias.getitemdatetime(1,'fecha_ingreso_trabajo')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_ingreso_cliente_condolencias.setitem(1,'fecha_ingreso_trabajo',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_ingreso_cliente_condolencias.setitem(1,'fecha_ingreso_trabajo',date(ls_fecha))
		END IF
END CHOOSE
end event

event itemchanged;String	ls_ciudad,ls_columna,ls_dv,ls_null,ls_estado,ls_nombre,ls_a_paterno,ls_a_materno,ls_dire,&
			ls_poblacion,ls_sector,ls_comuna,ls_fono_p,ls_usuario,ls_num_p,ls_depto_p,ls_block_p,&
			ls_tipo_v,ls_email,ls_celular,ls_nulo
Date		ld_null
Long		ll_null,ll_rut

ls_columna								= dwo.name
setnull(ls_nulo)
dw_ingreso_cliente_condolencias.accepttext()
if dw_ingreso_cliente_condolencias.getrow()>0 then
	ll_rut								= dw_ingreso_cliente_condolencias.getitemnumber(1,"rut")								
	cb_grabar.enabled					= true
	CHOOSE CASE ls_columna
		CASE 'dv'
			ls_dv										= dw_ingreso_cliente_condolencias.getitemstring(1,'dv')
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				messagebox('Error','El Rut no es valido',stopsign!)
				dw_ingreso_cliente_condolencias.setitem(1,'dv',ls_nulo)
				dw_ingreso_cliente_condolencias.accepttext()
				cb_grabar.enabled					= false
			//	dw_ingreso_cliente_condolencias.SetItem(1, "estado_rut",0)
				dw_ingreso_cliente_condolencias.setcolumn('dv')
				dw_ingreso_cliente_condolencias.setfocus()
			else
			//	dw_ingreso_cliente_condolencias.SetItem(1, "estado_rut",1)
				dw_ingreso_cliente_condolencias.setcolumn('nombre')
				
				SELECT 	"UGN_CLIENTE"."NOMBRE","UGN_CLIENTE"."A_PATERNO","UGN_CLIENTE"."A_MATERNO","UGN_CLIENTE"."DIRECCION_P","UGN_CLIENTE"."POBLACION","UGN_CLIENTE"."SECTOR","UGN_CLIENTE"."COMUNA","UGN_CLIENTE"."CIUDAD","UGN_CLIENTE"."FONO_P","UGN_CLIENTE"."NUMERO_PARTICULAR","UGN_CLIENTE"."DEPTO_PARTICULAR","UGN_CLIENTE"."BLOCK_PARTICULAR","UGN_CLIENTE"."TIPO_VIA","UGN_CLIENTE"."EMAIL","UGN_CLIENTE"."CELULAR"
				INTO 		:ls_nombre,  				:ls_a_paterno,  				:ls_a_materno,   				:ls_dire,   				:ls_poblacion,  				:ls_sector,  				:ls_comuna,   				:ls_ciudad,  				:ls_fono_p,   		:ls_num_p,  							:ls_depto_p,  							:ls_block_p,  							:ls_tipo_v,  				:ls_email,				:ls_celular
				FROM 		"UGN_CLIENTE"  
				WHERE 	"UGN_CLIENTE"."RUT" = :ll_rut
				Using		sqlca;
				if sqlca.sqlcode=0 then	
					dw_ingreso_cliente_condolencias.setitem(1,"nombre",ls_nombre)
					dw_ingreso_cliente_condolencias.setitem(1,"a_paterno",ls_a_paterno)
					dw_ingreso_cliente_condolencias.setitem(1,"a_materno",ls_a_materno)
					dw_ingreso_cliente_condolencias.setitem(1,"direccion_p",ls_dire)
					dw_ingreso_cliente_condolencias.setitem(1,"poblacion",ls_poblacion)
					dw_ingreso_cliente_condolencias.setitem(1,"sector",ls_sector)
					dw_ingreso_cliente_condolencias.setitem(1,"comuna",ls_comuna)
					dw_ingreso_cliente_condolencias.setitem(1,"ciudad",ls_ciudad)
					dw_ingreso_cliente_condolencias.setitem(1,"numero_particular",ls_num_p)
					dw_ingreso_cliente_condolencias.setitem(1,"depto_particular",ls_depto_p)
					dw_ingreso_cliente_condolencias.setitem(1,"block_particular",ls_block_p)
					dw_ingreso_cliente_condolencias.setitem(1,"tipo_via",ls_tipo_v)
					dw_ingreso_cliente_condolencias.setitem(1,"email",ls_email)
					dw_ingreso_cliente_condolencias.setitem(1,"fono_p",ls_fono_p)
					dw_ingreso_cliente_condolencias.setitem(1,'celular',ls_celular)
				end if
			end if
			
		CASE 'ciudad' 
			ls_ciudad	= dw_ingreso_cliente_condolencias.getitemstring(1,'ciudad')
			dw_ingreso_cliente_condolencias.setitem(1,'comuna',ls_nulo)
			dw_ingreso_cliente_condolencias.accepttext()
			idw_detalle.retrieve(ls_ciudad)
			
		CASE 'ciudad_comercial' 
			ls_ciudad	= dw_ingreso_cliente_condolencias.getitemstring(1,'ciudad_comercial')
			dw_ingreso_cliente_condolencias.setitem(1,'comuna_comercial',ls_nulo)
			dw_ingreso_cliente_condolencias.accepttext()
			idw_detalle2.retrieve(ls_ciudad)	
		
	END CHOOSE
end if


end event

event itemfocuschanged;Long		ll_nulo,ll_fila,ll_rut,ll_est_rut
String 	ls_nulo,ls_columna,ls_dv

dw_ingreso_cliente_condolencias.accepttext()
setnull(ls_nulo);setnull(ll_nulo)
ll_fila				= row
ls_columna			= dwo.name
if row > 0 then
	if ls_columna<>'rut' and ls_columna<>'dv' then
		ll_rut		= dw_ingreso_cliente_condolencias.getitemnumber(ll_fila,'rut')
		ls_dv			= dw_ingreso_cliente_condolencias.getitemstring(ll_fila,'dv')
		ll_est_rut	= dw_ingreso_cliente_condolencias.getitemnumber(ll_fila,'estado_rut')
		if ll_rut > 0  and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) and ll_est_rut=0 then
				dw_ingreso_cliente_condolencias.setitem(ll_fila,'dv',ls_nulo)
				dw_ingreso_cliente_condolencias.accepttext()
				dw_ingreso_cliente_condolencias.setcolumn('dv')
				dw_ingreso_cliente_condolencias.setfocus()
			elseif ll_est_rut= 1 and (not isnull(ll_rut) or not isnull(ls_dv)) then
				dw_ingreso_cliente_condolencias.setcolumn('estado_rut')
				dw_ingreso_cliente_condolencias.setfocus()
			elseif ll_est_rut= 0 and (not isnull(ll_rut) and not isnull(ls_dv)) then
				if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) and ll_est_rut=0 then 
					messagebox('Error','Rut Inválido',stopsign!)
					dw_ingreso_cliente_condolencias.setitem(ll_fila,'dv',ls_nulo)
					dw_ingreso_cliente_condolencias.accepttext()				
					dw_ingreso_cliente_condolencias.setcolumn('dv')
					dw_ingreso_cliente_condolencias.setfocus()
				end if		
			end if
		end if
	end if
end if	
end event

