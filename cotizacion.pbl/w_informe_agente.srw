forward
global type w_informe_agente from window
end type
type cb_borrar from commandbutton within w_informe_agente
end type
type cb_limpiar from commandbutton within w_informe_agente
end type
type cb_grabar from commandbutton within w_informe_agente
end type
type st_2 from statictext within w_informe_agente
end type
type dw_agente from datawindow within w_informe_agente
end type
type dw_informe_agente from datawindow within w_informe_agente
end type
type cb_imprimir from commandbutton within w_informe_agente
end type
type cb_cerrar from commandbutton within w_informe_agente
end type
end forward

global type w_informe_agente from window
integer width = 3931
integer height = 2208
boolean titlebar = true
string title = "Informe Gestión Diaria Agente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_borrar cb_borrar
cb_limpiar cb_limpiar
cb_grabar cb_grabar
st_2 st_2
dw_agente dw_agente
dw_informe_agente dw_informe_agente
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
end type
global w_informe_agente w_informe_agente

on w_informe_agente.create
this.cb_borrar=create cb_borrar
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.st_2=create st_2
this.dw_agente=create dw_agente
this.dw_informe_agente=create dw_informe_agente
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_borrar,&
this.cb_limpiar,&
this.cb_grabar,&
this.st_2,&
this.dw_agente,&
this.dw_informe_agente,&
this.cb_imprimir,&
this.cb_cerrar}
end on

on w_informe_agente.destroy
destroy(this.cb_borrar)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.st_2)
destroy(this.dw_agente)
destroy(this.dw_informe_agente)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
end on

event open;string	ls_cod_sup, ls_nom_sup, ls_ap_pat_sup, ls_ap_mat_sup, ls_estado_reg
datetime	ldt_fecha_hoy
long		ll_new

gf_centrar(w_informe_agente)
dw_informe_agente.settransobject(sqlca)
dw_informe_agente.getchild('comuna_contacto',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

ll_new					= dw_informe_agente.insertrow(0)
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
dw_informe_agente.setitem(ll_new,'fecha_reporte',ldt_fecha_hoy)

ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
dw_informe_agente.setitem(ll_new,'fecha_prox_contacto',ldt_fecha_hoy)
cb_imprimir.enabled	= false
if gs_depto ='R'	or gs_depto ='B' or gs_user = 'SORTIZ' then
	SELECT	DISTINCT "SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO", "SUPERVISOR"."COD_SUP"
	INTO					:ls_nom_sup,				:ls_ap_pat_sup,				:ls_ap_mat_sup,			  :ls_cod_sup
	FROM 		"ENCARGADOS",         "SUPERVISOR"  
	WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = "SUPERVISOR"."COD_SUP" ) and  
			 (("ENCARGADOS"."ESTADO" = 'A' ) AND  
			 ( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) )   
	ORDER BY "SUPERVISOR"."COD_SUP" ASC
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_agente.dataobject			= 'dwe_seleccionar_agente_por_supervisor'
		dw_agente.settransobject(sqlca)
		dw_agente.getchild('agente',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ls_cod_sup)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_agente.insertrow(0)
		dw_informe_agente.accepttext()
	else
		SELECT	"JEFE_VENTAS"."NOMBRE"  
		INTO 		:ls_nom_sup  
		FROM 		"JEFE_VENTAS"  
		WHERE  ( "JEFE_VENTAS"."JEFE_VENTAS" = :gs_user ) AND  
				 ( "JEFE_VENTAS"."ESTADO" = 'A' )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_agente.dataobject = 'dwe_seleccionar_agente_por_jefe'
			dw_agente.settransobject(sqlca)
			dw_agente.getchild('agente',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.retrieve(gs_user)=0 then
				idw_detalle.insertrow(0)
			end if
			dw_agente.insertrow(0)
		else
			SELECT 	"ENCARGADOS"."NOMBRE"  
			INTO 		:ls_nom_sup  
			FROM 		"ENCARGADOS"  
			WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) AND  
					 ( "ENCARGADOS"."ESTADO" = 'A' )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_agente.dataobject = 'dwe_seleccionar_agente_todos'
				dw_agente.settransobject(sqlca)
				dw_agente.getchild('agente',idw_detalle)
				idw_detalle.settransobject(sqlca)
				if idw_detalle.retrieve()=0 then
					idw_detalle.insertrow(0)
				end if
				dw_agente.insertrow(0)
			end if
		end if
	end if
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_informe_agente)
end if
		
end event

type cb_borrar from commandbutton within w_informe_agente
integer x = 1975
integer y = 1932
integer width = 475
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular Informe"
end type

event clicked;string ls_nombre_contacto,ls_ap_pat_contacto,ls_agente
Long		ll_resp
datetime	ldt_fecha_hoy

ls_nombre_contacto		= dw_informe_agente.GetItemString(1,'nombre_contacto')
ls_ap_pat_contacto		= dw_informe_agente.GetItemString(1,'apellido_paterno_contacto')
ls_agente					= dw_agente.GetItemString(1,'agente')
if not isnull(ls_agente) or ls_agente='' or not isnull(ls_nombre_contacto) or ls_nombre_contacto='' or not isnull(ls_ap_pat_contacto) or ls_ap_pat_contacto='' then
	ll_resp = messagebox("Anular","Está Seguro de Anular Registro",Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_informe_agente.setitem(1,'estado_reg','I')
		dw_informe_agente.accepttext()
		messagebox("Advertencia","Recuerde Grabar los Cambios ANTES de Salir o Limpiar",Exclamation!,YesNo!,2)
	end if
end if
end event

type cb_limpiar from commandbutton within w_informe_agente
integer x = 1330
integer y = 1932
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;long		ll_resp
datetime	ldt_fecha_hoy
string ls_cod_sup,ls_cod_age,ls_nom_sup,ls_nom_age

ll_resp				= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then
	dw_informe_agente.reset()
	dw_agente.reset()
	dw_informe_agente.InsertRow(0)
	dw_agente.InsertRow(0)
	
	ls_cod_sup	= dw_informe_agente.GetItemString(1,'cod_sup')
	ls_cod_age	= dw_informe_agente.GetItemString(1,'cod_age')
	ls_nom_sup	= dw_informe_agente.GetItemString(1,'cod_sup_1')
	ls_nom_age	= dw_informe_agente.GetItemString(1,'cod_age_1')

	ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))
	dw_informe_agente.setitem(1,'fecha_reporte',ldt_fecha_hoy)
	dw_informe_agente.setitem(1,'fecha_prox_contacto',ldt_fecha_hoy)
	dw_informe_agente.setitem(1,'cod_sup',ls_cod_sup)
	dw_informe_agente.setitem(1,'cod_age',ls_cod_age)
	dw_informe_agente.setitem(1,'cod_sup_1',ls_nom_age)
	dw_informe_agente.setitem(1,'cod_age_1',ls_nom_sup)
	dw_informe_agente.accepttext()
	dw_agente.accepttext()
end if	
end event

type cb_grabar from commandbutton within w_informe_agente
integer x = 41
integer y = 1932
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_sw='S', ls_nombre_contacto,ls_ap_pat_contacto,ls_ap_mat_contacto,ls_fono_contacto,&
			ls_estado_gestion,ls_estado_general,ls_comuna_contacto,ls_ciudad_contacto,ls_tipo_via,&
			ls_direccion_contacto,ls_numero_contacto,ls_agente
long		ll_count, ret,ll_resp			
datetime ldt_fecha_reporte

ls_agente					= dw_agente.GetItemString(1,'agente')
if not isnull(ls_agente) or ls_agente='' then
	ls_nombre_contacto		= dw_informe_agente.GetItemString(1,'nombre_contacto')
	ls_ap_pat_contacto		= dw_informe_agente.GetItemString(1,'apellido_paterno_contacto')
	ls_fono_contacto			= dw_informe_agente.GetItemString(1,'fono_contacto')
	ls_estado_gestion			= dw_informe_agente.GetItemString(1,'estado_gestion')
	ls_tipo_via					= dw_informe_agente.GetItemString(1,'tipo_via')
	ls_direccion_contacto	= dw_informe_agente.GetItemString(1,'direccion_contacto')
	ls_numero_contacto		= dw_informe_agente.GetItemString(1,'numero_contacto')
	ls_estado_general			= dw_informe_agente.GetItemString(1,'estado_general')
	ldt_fecha_reporte			= dw_informe_agente.GetItemDatetime(1,'fecha_reporte')
	ls_comuna_contacto		= dw_informe_agente.getItemString(1,'comuna_contacto')
	ls_ciudad_contacto		= dw_informe_agente.getItemString(1,'ciudad_contacto')
	
	if isnull(ls_nombre_contacto) or ls_nombre_contacto='' then
		messagebox('Advertencia','Debe Ingresar NOMBRE CONTACTO')
		dw_informe_agente.setfocus()
		dw_informe_agente.setcolumn('nombre_contacto')
		ls_sw		= 'N'
		
	elseif isnull(ls_ap_pat_contacto) or ls_ap_pat_contacto='' then
		messagebox('Advertencia','Debe Ingresar APELLIDO PATERNO CONTACTO')
		dw_informe_agente.setfocus()
		dw_informe_agente.setcolumn('apellido_paterno_contacto')
		ls_sw		= 'N'
		
	elseif isnull(ls_comuna_contacto) or ls_comuna_contacto='' then
		messagebox('Advertencia','Debe Ingresar COMUNA CONTACTO')
		dw_informe_agente.setfocus()
		dw_informe_agente.setcolumn('comuna_contacto')
		ls_sw		= 'N'
	
	elseif isnull(ls_ciudad_contacto) or ls_ciudad_contacto='' then
		messagebox('Advertencia','Debe Ingresar CIUDAD CONTACTO')
		dw_informe_agente.setfocus()
		dw_informe_agente.setcolumn('ciudad_contacto')
		ls_sw		= 'N'
		
		
	elseif isnull(ldt_fecha_reporte) then
		messagebox('Advertencia','Debe Ingresar FECHA DE REPORTE')
		dw_informe_agente.setfocus()
		dw_informe_agente.setcolumn('fecha_reporte')
		ls_sw		= 'N'
		
	elseif isnull(ls_fono_contacto) or ls_fono_contacto='' then
		messagebox('Advertencia','Debe Ingresar FONO CONTACTO')
		dw_informe_agente.setfocus()
		dw_informe_agente.setcolumn('fono_contacto')
		ls_sw		= 'N'
		
	elseif isnull(ls_estado_gestion) or ls_estado_gestion='' then
		messagebox('Advertencia','Debe Ingresar ESTADO GESTIÓN')
		dw_informe_agente.setfocus()
		dw_informe_agente.setcolumn('estado_gestion')
		ls_sw		= 'N'
		
	elseif isnull(ls_estado_general) or ls_estado_general='' then
		messagebox('Advertencia','Debe Ingresar ESTADO GENERAL')
		dw_informe_agente.setfocus()
		dw_informe_agente.setcolumn('estado_general')
		ls_sw		= 'N'	
	elseif (isnull(ls_fono_contacto) or ls_fono_contacto='' and isnull(ls_tipo_via) or ls_tipo_via='' and isnull(ls_direccion_contacto) or ls_direccion_contacto='' and isnull(ls_numero_contacto) or ls_numero_contacto='') then
		messagebox('Advertencia','Debe Ingresar POR LO MENOS RUT O DIRECCION O FONO')
		dw_informe_agente.setfocus()
		dw_informe_agente.setcolumn('rut_contacto')
		ls_sw		= 'N'	
	end if
	if ls_sw='S' then
		dw_informe_agente.setitem(1,'nombre_contacto',ls_nombre_contacto)
		dw_informe_agente.setitem(1,'apellido_paterno_contacto',ls_ap_pat_contacto)
		dw_informe_agente.setitem(1,'fono_contacto',ls_fono_contacto)
		dw_informe_agente.setitem(1,'estado_gestion',ls_estado_gestion)
		dw_informe_agente.setitem(1,'estado_general',ls_estado_general)
		dw_informe_agente.setitem(1,'fecha_reporte',ldt_fecha_reporte)
		dw_informe_agente.setitem(1,'ciudad_contacto',ls_ciudad_contacto)
		dw_informe_agente.setitem(1,'comuna_contacto',ls_comuna_contacto)
		dw_informe_agente.setitem(1,'usuario_crea',gs_user)
		
		ret	= MessageBox('Actualizar', "Desea Grabar INFORME DIARIO AGENTE", Question!, YesNo!, 2)
		IF ret = 1 THEN
			SELECT	MAX("INFORME_AGENTE"."CORRELATIVO")  
			INTO 		:ll_count  
			FROM 		"INFORME_AGENTE"  
			USING		sqlca;
			if ll_count=0 or isnull(ll_count) then
				ll_count	= 1
			else
				ll_count ++
			end if
			if dw_informe_agente.getitemnumber(1,'correlativo')=0 or isnull(dw_informe_agente.getitemnumber(1,'correlativo')) then
				dw_informe_agente.setitem(1,'correlativo',ll_count)
			end if
			if isnull(dw_informe_agente.getitemstring(1,'estado_reg')) or dw_informe_agente.getitemstring(1,'estado_reg')='' then
				dw_informe_agente.setitem(1,'estado_reg','A')
			end if
			dw_informe_agente.accepttext()
			if dw_informe_agente.update()=1 then
				commit;
				cb_imprimir.enabled	= true
				ll_resp					= messagebox("Grabar","Grabación Exitosa, desea Limpiar Pantalla",Exclamation!,YesNo!,2)
				if ll_resp = 1 then
					dw_agente.reset()
					dw_informe_agente.reset()
					dw_agente.insertRow(0)
					dw_informe_agente.InsertRow(0)
					dw_informe_agente.setcolumn('cod_sup')
					dw_informe_agente.setcolumn('cod_age')
					dw_informe_agente.setitem(1,'fecha_reporte',ldt_fecha_reporte)
					if isvalid(w_busca_gestion_agente) then
						w_busca_gestion_agente.pb_ok2.triggerevent(clicked!)
						w_buscar_agendadas.pb_ok2.triggerevent(clicked!)
						close(w_informe_agente)
					end if
				end if	
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar INFORME AGENTE SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
end if		
	
end event

type st_2 from statictext within w_informe_agente
integer x = 50
integer y = 52
integer width = 567
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Agente"
boolean focusrectangle = false
end type

type dw_agente from datawindow within w_informe_agente
integer x = 631
integer y = 32
integer width = 1518
integer height = 112
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_agente_todos"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_cod_age,ls_cod_sup
datetime ldt_fecha_hoy 	
Long		ll_new_inf,ll_new_age,ll_new

This.accepttext()
dw_informe_agente.reset()
ll_new_inf		= dw_informe_agente.InsertRow(0)
ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))
ls_cod_age		= this.getitemstring(1,'agente')
dw_informe_agente.setitem(1,'fecha_prox_contacto',ldt_fecha_hoy)

if not isnull(ls_cod_age) and ls_cod_age<>'' then
	SELECT	"AGENTES"."COD_SUP"  
	INTO 		:ls_cod_sup  
	FROM 		"AGENTES"  
	WHERE 	"AGENTES"."COD_AGE" = :ls_cod_age   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_informe_agente.setitem(ll_new_inf,'cod_sup',ls_cod_sup)
		dw_informe_agente.setitem(ll_new_inf,'cod_age',ls_cod_age)
		dw_informe_agente.setitem(ll_new_inf,'fecha_reporte',ldt_fecha_hoy)
	else
		messagebox("Advertencia","No Existe Agente")
	end if
else
	messagebox("Advertencia","Debe Seleccionar Agente")
end if
dw_informe_agente.accepttext()
end event

type dw_informe_agente from datawindow within w_informe_agente
integer x = 41
integer y = 160
integer width = 3826
integer height = 1728
integer taborder = 20
string title = "none"
string dataobject = "dw_informe_agente"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String	ls_columna,ls_ciudad,ls_dv,ls_estado_gral,ls_estado,ls_cod_age,ls_cod_sup,ls_nombre,&
			ls_ap_pat,ls_direc,ls_nro,ls_fono
Datetime	ldt_fecha
long  	ll_rut,ll_new
date		ld_fecha_hoy,ld_fecha_7,ld_nulo

Setnull(ld_nulo)
this.accepttext()
ls_columna		= dwo.name
if ls_columna='ciudad_contacto' then
	ls_ciudad	= this.getitemstring(this.getrow(),'ciudad_contacto')
	idw_detalle3.retrieve(ls_ciudad)
elseif ls_columna='rut_contacto' or ls_columna='dv_contacto' then
	ll_rut				= this.getitemnumber(this.getrow(),'rut_contacto')
	ls_dv					= this.getitemstring(this.getrow(),'dv_contacto')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			dw_informe_agente.scrolltorow(ll_new)
			dw_informe_agente.setitem(ll_new,'rut_contacto',ll_rut)
			dw_informe_agente.setfocus()
			dw_informe_agente.setcolumn('dv_contacto')
		else
			SELECT	"INFORME_AGENTE"."COD_SUP",	"INFORME_AGENTE"."COD_AGE",	"INFORME_AGENTE"."FECHA_REPORTE"  
			INTO 		:ls_cod_age,						:ls_cod_sup,						:ldt_fecha  
			FROM 		"INFORME_AGENTE"  
			WHERE 	"INFORME_AGENTE"."RUT_CONTACTO" = :ll_rut  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				messagebox("Advertencia","Informe Ya Existe, por Supervisor: "+ls_cod_sup+" Agente: "+ls_cod_age+" el día "+string(ldt_fecha,'dd/mm/yyyy'))
			end if
		end if 
	end if
elseif ls_columna='estado_gestion' then	
	ls_estado_gral	= this.getitemstring(this.getrow(),'estado_gestion')
	SELECT	"INFORME_STATUS_REPORT"."ESTADO_GENERAL"  
	INTO 		:ls_estado  
	FROM 		"INFORME_STATUS_REPORT"  
	WHERE 	"INFORME_STATUS_REPORT"."CODIGO" = :ls_estado_gral   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		this.setitem(this.getrow(),'estado_general',ls_estado)
		this.accepttext()
		if ls_estado_gral='1' then
			dw_informe_agente.setitem(1,'fecha_prox_contacto',ld_nulo)
		else
			ld_fecha_hoy	= date(dw_informe_agente.getitemdatetime(1,'fecha_reporte'))
			ld_fecha_7		= relativedate(ld_fecha_hoy,7)
			dw_informe_agente.setitem(1,'fecha_prox_contacto',ld_fecha_7)
		end if
	end if
	this.accepttext()
elseif ls_columna='nombre_contacto' or ls_columna='apellido_paterno_contacto' then
	ls_nombre	= TRIM(dw_informe_agente.getitemstring(1,'nombre_contacto'))
	ls_ap_pat	= TRIM(dw_informe_agente.getitemstring(1,'apellido_paterno_contacto'))
	if not isnull(ls_nombre) and not isnull(ls_ap_pat) then
		SELECT	"INFORME_AGENTE"."COD_SUP",	"INFORME_AGENTE"."COD_AGE",	"INFORME_AGENTE"."FECHA_REPORTE"  
		INTO 		:ls_cod_age,						:ls_cod_sup,						:ldt_fecha  
		FROM 		"INFORME_AGENTE"  
		WHERE 	"INFORME_AGENTE"."NOMBRE_CONTACTO" = :ls_nombre  AND
					"INFORME_AGENTE"."APELLIDO_PATERNO_CONTACTO" = :ls_ap_pat
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","Informe Ya Existe, por Supervisor: "+ls_cod_sup+" Agente: "+ls_cod_age+" el día "+string(ldt_fecha,'dd/mm/yyyy'))
		end if
	end if
elseif ls_columna='direccion_contacto' or ls_columna='numero_contacto' then
	ls_direc	= TRIM(dw_informe_agente.getitemstring(1,'direccion_contacto'))
	ls_nro	= TRIM(dw_informe_agente.getitemstring(1,'numero_contacto'))
	if not isnull(ls_direc) and not isnull(ls_nro) then
		SELECT	"INFORME_AGENTE"."COD_SUP",	"INFORME_AGENTE"."COD_AGE",	"INFORME_AGENTE"."FECHA_REPORTE"  
		INTO 		:ls_cod_age,						:ls_cod_sup,						:ldt_fecha  
		FROM 		"INFORME_AGENTE"  
		WHERE 	"INFORME_AGENTE"."DIRECCION_CONTACTO" = :ls_direc  AND
					"INFORME_AGENTE"."NUMERO_CONTACTO" = :ls_nro
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","Informe Ya Existe, por Supervisor: "+ls_cod_sup+" Agente: "+ls_cod_age+" el día "+string(ldt_fecha,'dd/mm/yyyy'))
		end if
	end if
elseif ls_columna='fono_contacto'  then
	ls_fono	= TRIM(dw_informe_agente.getitemstring(1,'fono_contacto'))
	if not isnull(ls_fono)  then
		SELECT	"INFORME_AGENTE"."COD_SUP",	"INFORME_AGENTE"."COD_AGE",	"INFORME_AGENTE"."FECHA_REPORTE"  
		INTO 		:ls_cod_age,						:ls_cod_sup,						:ldt_fecha  
		FROM 		"INFORME_AGENTE"  
		WHERE 	"INFORME_AGENTE"."FONO_CONTACTO" = :ls_fono  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","Informe Ya Existe, por Supervisor: "+ls_cod_sup+" Agente: "+ls_cod_age+" el día "+string(ldt_fecha,'dd/mm/yyyy'))
		end if
	end if
end if
this.accepttext()
end event

event itemfocuschanged;String	ls_columna,ls_dv
Long		ll_rut

ls_columna	= dwo.name
if ls_columna<>'rut_contacto' and ls_columna<>'dv_contacto' then
	ll_rut				= this.getitemnumber(this.getrow(),'rut_contacto')
	ls_dv					= this.getitemstring(this.getrow(),'dv_contacto')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			this.setfocus()
			this.setcolumn('dv_contacto')
		end if 
	end if
end if
end event

event clicked;String	ls_estado,ls_columna,ls_fecha,ls_nom,ls_ap_pat,ls_ap_mat,ls_est_reg,ls_estado_gral
Datetime	ldt_fecha_rep
Date		ld_nulo,ld_fecha_hoy,ld_fecha_7

Setnull(ld_nulo)
ls_columna						= dwo.name
if ls_columna = 'p_3' then
	if dw_informe_agente.getitemdatetime(1,'c_fecha_30_dias') > dw_informe_agente.getitemdatetime(1,'fecha_prox_contacto') then
		ls_nom		= dw_informe_agente.getitemstring(1,'cod_age')
		ls_est_reg	= dw_informe_agente.getitemstring(1,'estado_reg')
		if not isnull(ls_nom) and (ls_est_reg = 'A' or isnull(ls_est_reg)) then
			ls_fecha	= string(date(dw_informe_agente.getitemdatetime(dw_informe_agente.getrow(),'fecha_reporte')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_informe_agente.setitem(dw_informe_agente.getrow(),'fecha_reporte',datetime(string(today(),gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_informe_agente.setitem(dw_informe_agente.getrow(),'fecha_reporte',date(ls_fecha))
				dw_informe_agente.accepttext()
				ls_estado_gral		= this.getitemstring(this.getrow(),'estado_gestion')
				if not isnull(ls_estado_gral) then
					SELECT	"INFORME_STATUS_REPORT"."ESTADO_GENERAL"  
					INTO 		:ls_estado  
					FROM 		"INFORME_STATUS_REPORT"  
					WHERE 	"INFORME_STATUS_REPORT"."CODIGO" = :ls_estado_gral   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						this.setitem(this.getrow(),'estado_general',ls_estado)
						this.accepttext()
						if ls_estado_gral='1' then
							dw_informe_agente.setitem(1,'fecha_prox_contacto',ld_nulo)
						else
							ld_fecha_hoy	= date(dw_informe_agente.getitemdatetime(1,'fecha_reporte'))
							ld_fecha_7		= relativedate(ld_fecha_hoy,7)
							dw_informe_agente.setitem(1,'fecha_prox_contacto',ld_fecha_7)
						end if
					end if
					this.accepttext()
				end if
			END IF
		end if
	end if
end if

if ls_columna = 'p_1' then
	if dw_informe_agente.getitemdatetime(1,'c_fecha_30_dias') > dw_informe_agente.getitemdatetime(1,'fecha_prox_contacto') then
		ls_nom		= dw_informe_agente.getitemstring(1,'nombre_contacto')
		ls_ap_pat	= dw_informe_agente.getitemstring(1,'apellido_paterno_contacto')
		ls_ap_mat	= dw_informe_agente.getitemstring(1,'apellido_materno_contacto')
		ls_est_reg	= dw_informe_agente.getitemstring(1,'estado_reg')
		if not isnull(ls_nom) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) and (ls_est_reg = 'A' or isnull(ls_est_reg)) then
			ls_fecha	= string(date(dw_informe_agente.getitemdatetime(dw_informe_agente.getrow(),'fecha_reporte')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_informe_agente.setitem(dw_informe_agente.getrow(),'fecha_prox_contacto',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_informe_agente.setitem(dw_informe_agente.getrow(),'fecha_prox_contacto',date(ls_fecha))
				dw_informe_agente.accepttext()
			END IF
		end if
	end if
end if

end event

type cb_imprimir from commandbutton within w_informe_agente
integer x = 686
integer y = 1932
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_informe_agente.rowcount() > 0 then 
	dw_informe_agente.object.datawindow.Print.Preview	= true
	dw_informe_agente.Modify("DataWindow.Header.Height=570")
	dw_informe_agente.object.datawindow.zoom				= 88
	f_Print( dw_informe_agente )
	dw_informe_agente.Modify("DataWindow.Header.Height=0")
	dw_informe_agente.object.datawindow.zoom				= 100
	dw_informe_agente.object.datawindow.Print.Preview	= False
end if


end event

type cb_cerrar from commandbutton within w_informe_agente
integer x = 3465
integer y = 1932
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_agente)
end event

