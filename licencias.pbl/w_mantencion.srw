forward
global type w_mantencion from window
end type
type mdi_1 from mdiclient within w_mantencion
end type
type mditbb_1 from tabbedbar within w_mantencion
end type
type mdirbb_1 from ribbonbar within w_mantencion
end type
type pb_buscar_trabajador from picturebutton within w_mantencion
end type
type rb_jefe from radiobutton within w_mantencion
end type
type rb_supervisor from radiobutton within w_mantencion
end type
type rb_agente from radiobutton within w_mantencion
end type
type dw_datos from datawindow within w_mantencion
end type
end forward

global type w_mantencion from window
integer width = 3109
integer height = 2052
boolean titlebar = true
string menuname = "m_menu_mantencion"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = mdihelp!
long backcolor = 67108864
event ue_nuevo ( )
event ue_grabar ( )
event ue_eliminar ( )
event ue_imprimir ( )
event ue_cerrar ( )
event ue_buscar ( )
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
pb_buscar_trabajador pb_buscar_trabajador
rb_jefe rb_jefe
rb_supervisor rb_supervisor
rb_agente rb_agente
dw_datos dw_datos
end type
global w_mantencion w_mantencion

type variables
string 	is_columna='', is_ventana
long		il_grabar
end variables

forward prototypes
public subroutine wf_buscar_rut (long al_rut, string as_grupo)
public subroutine wf_limpiar_dw (string as_grupo)
public subroutine wf_limpiar_licencia ()
public subroutine wf_buscar_licencia (long al_rut, string as_licencia)
public subroutine wf_buscar_codigo (string as_codigo, string as_grupo)
end prototypes

event ue_nuevo;// nuevo
Int	ll_resp
if il_grabar = 1 and gs_codigo<>'' then
	ll_resp	= messagebox("Advertencia","Desea grabar Cambios",Exclamation!,YesNo!)
	if ll_resp = 1 then
		w_mantencion.triggerevent('ue_grabar')
	end if
end if
rb_agente.triggerevenT(clicked!)
rb_agente.checked	= true

end event

event ue_grabar;string	ls_codigo,ls_grupo,ls_nro_licencia, ls_dv_medico
Long		ll_rut_empleado, ll_dias,ll_rut_medico
Date		ld_fecha_ini,ld_fecha_fin
long		ll_sw,ll_estado_rut, ll_estado_rut_medico

dw_datos.accepttext()
ll_sw					= 0
ll_rut_empleado	= dw_datos.getitemnumber(1,'rut_empleado')
ls_codigo			= dw_datos.getitemstring(1,'codigo')
ls_grupo				= dw_datos.getitemstring(1,'grupo')
ls_nro_licencia	= dw_datos.getitemstring(1,'nro_licencia')
ld_fecha_ini		= date(dw_datos.getitemdatetime(1,'fecha_inicio_licencia'))
ld_fecha_fin		= date(dw_datos.getitemdatetime(1,'fecha_fin_licencia'))
ll_dias				= dw_datos.getitemnumber(1,'nro_dias')
ll_rut_medico		= dw_datos.getitemnumber(1,'rut_medico')
ls_dv_medico		= dw_datos.getitemstring(1,'dv_medico')
ll_estado_rut		= dw_datos.getitemnumber(1,'estado_rut')
ll_estado_rut_medico	= dw_datos.getitemnumber(1,'estado_rut_medico')

if ls_codigo<>'' or not isnull(ls_codigo) then
	if ll_estado_rut=0 and ll_estado_rut_medico=0 then
		messagebox("Advertencia","No tiene dato para Grabar")
		il_grabar	= 0
	elseif isnull(ll_rut_empleado) then
		messagebox("Advertencia","Debe ingresar Rut Empleado")
		ll_sw	= 1
		dw_datos.setfocus()
		dw_datos.setcolumn('rut_empleado')
	elseif isnull(ls_codigo) then
		messagebox("Advertencia","Debe ingresar Codigo Empleado")
		ll_sw	= 1
		dw_datos.setfocus()
		dw_datos.setcolumn('codigo')
	elseif isnull(ls_grupo) then
		messagebox("Advertencia","Debe debe seleccionar Cargo")
		ll_sw	= 1
		dw_datos.setfocus()
		dw_datos.setcolumn('grupo')
	elseif isnull(ls_nro_licencia) then
		messagebox("Advertencia","Debe ingresar Nº Licencia")
		ll_sw	= 1
		dw_datos.setfocus()
		dw_datos.setcolumn('nro_licencia')
	elseif isnull(ld_fecha_ini) then
		messagebox("Advertencia","Debe ingresar Fecha Inicio de Licencia")
		ll_sw	= 1
		dw_datos.setfocus()
		dw_datos.setcolumn('fecha_inicio_licencia')
	elseif isnull(ld_fecha_fin) then
		messagebox("Advertencia","Debe ingresar Fecha Término de Licencia")
		ll_sw	= 1
		dw_datos.setfocus()
		dw_datos.setcolumn('fecha_fin_licencia')
	elseif isnull(ll_dias) then
		messagebox("Advertencia","Debe ingresar Cantidad de Días")
		ll_sw	= 1
		dw_datos.setfocus()
		dw_datos.setcolumn('nro_dias')
	elseif isnull(ll_rut_medico) then
		messagebox("Advertencia","Debe ingresar Rut del Médico")
		ll_sw	= 1
		dw_datos.setfocus()
		dw_datos.setcolumn('rut_medico')
	elseif isnull(ls_dv_medico) then
		messagebox("Advertencia","Debe ingresar Rut del Médico")
		ll_sw	= 1
		dw_datos.setfocus()
		dw_datos.setcolumn('dv_medico')
	end if
	if ll_sw = 0 then
		if dw_datos.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			il_grabar	= 0
		else
			rollback;
			messagebox("Error","Error al Grabar")
		end if
		dw_datos.setfocus()
	end if
end if
end event

event ue_eliminar;// eliminar
Long	li_resp, ll_new
gs_codigo	= dw_datos.getitemstring(1,'codigo')
if gs_codigo <> '' and not isnull(gs_codigo) then
	li_resp = MessageBox("Adveretencia", "Está seguro de Eliminar Código "+gs_codigo,Exclamation!, YesNo!, 2)
	IF li_resp = 1 THEN
		dw_datos.deleterow(1)
		if dw_datos.update() = 1 then
			commit;
		else
			rollback;
		end if
		ll_new	= dw_datos.insertrow(0)
		dw_datos.scrolltorow(ll_new)
		dw_datos.setfocus()
	END IF
else
	messagebox("Advertencia","No tiene dato para Eliminar")
end if
end event

event ue_imprimir();// imprimir
gs_codigo	= dw_datos.getitemstring(1,'codigo')
if gs_codigo<>'' or not isnull(gs_codigo) then
	if dw_datos.rowcount() > 0 then
		if gs_codigo='' or isnull(gs_codigo) then
			messagebox("Advertencia","No tiene dato para Imprimir")
		else
			f_Print( dw_datos )
		end if
	end if
end if
end event

event ue_cerrar;close(w_mantencion)
end event

event ue_buscar;String	ls_codigo

dw_datos.accepttext()
ls_codigo	= dw_datos.getitemstring(1,'codigo')
if not isnull(ls_codigo) and ls_codigo<>'' then
	if isvalid(w_lista_licencias) then close(w_lista_licencias)
	OpenWithParm(w_lista_licencias, ls_codigo)
end if
end event

public subroutine wf_buscar_rut (long al_rut, string as_grupo);String	ls_cod_age, ls_nom_age, ls_a_pat_age, ls_a_mat_age, ls_cod_sup, ls_cod_jefe 
String	ls_nom_sup, ls_a_pat_sup, ls_a_mat_sup, ls_nom_jefe, ls_a_pat_jefe, ls_a_mat_jefe
Long		ll_rut_empleado

CHOOSE CASE as_grupo
	CASE "A" //agente
		SELECT DISTINCT "AGENTES"."COD_AGE",	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"AGENTES"."RUT",	"SUPERVISOR"."COD_SUP",	"JEFE_VENTAS"."JEFE_VENTAS"
		INTO 		:ls_cod_age,	:ls_nom_age,	:ls_a_pat_age,	:ls_a_mat_age,	:ll_rut_empleado,	:ls_cod_sup,	:ls_cod_jefe 
		FROM		"AGENTES","JEFE_VENTAS","SUPERVISOR"  
		WHERE	( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
					( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
					( ( "AGENTES"."RUT" = :al_rut ) )   
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			dw_datos.setitem(1,'codigo',ls_cod_age)
			dw_datos.setitem(1,'nombre_empleado',ls_nom_age)
			dw_datos.setitem(1,'a_paterno_empleado',ls_a_pat_age)
			dw_datos.setitem(1,'a_materno_empleado',ls_a_mat_age)
			dw_datos.setitem(1,'codigo_supervisor',ls_cod_sup)
			dw_datos.setitem(1,'codigo_jefe',ls_cod_jefe)
			dw_datos.setitem(1,'estado_rut',1)
			dw_datos.setcolumn('nro_licencia')
		else
			messagebox("Advertencia","Agente No Existe")
			wf_limpiar_dw(as_grupo)
			dw_datos.setcolumn('rut_empleado')
		end if

	CASE "S" //supervisor
	 	SELECT DISTINCT"SUPERVISOR"."COD_SUP",	"SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO",	"SUPERVISOR"."RUT",	"JEFE_VENTAS"."JEFE_VENTAS"  
		INTO 		:ls_cod_sup,	:ls_nom_sup,	:ls_a_pat_sup,	:ls_a_mat_sup,	:ll_rut_empleado,	:ls_cod_jefe  
		FROM 	"JEFE_VENTAS","SUPERVISOR"  
		WHERE	( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
					( ( "SUPERVISOR"."RUT" = :al_rut ) )  
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			dw_datos.setitem(1,'codigo',ls_cod_sup)
			dw_datos.setitem(1,'nombre_empleado',ls_nom_sup)
			dw_datos.setitem(1,'a_paterno_empleado',ls_a_pat_sup)
			dw_datos.setitem(1,'a_materno_empleado',ls_a_mat_sup)
			dw_datos.setitem(1,'codigo_jefe',ls_cod_jefe)
			dw_datos.setitem(1,'estado_rut',1)
			dw_datos.setcolumn('nro_licencia')
		else
			messagebox("Advertencia","Supervisor No Existe")
			wf_limpiar_dw(as_grupo)
			dw_datos.setcolumn('rut_empleado')
		end if

	CASE "J" //jefe venta
		SELECT DISTINCT "JEFE_VENTAS"."JEFE_VENTAS",	"JEFE_VENTAS"."NOMBRE",	"JEFE_VENTAS"."A_PATERNO",	"JEFE_VENTAS"."A_MATERNO",	"JEFE_VENTAS"."RUT"
		INTO 		:ls_cod_jefe,	:ls_nom_jefe,	:ls_a_pat_jefe,	:ls_a_mat_jefe,	:ll_rut_empleado 
		FROM 	"JEFE_VENTAS"  
		WHERE 	"JEFE_VENTAS"."RUT" = :al_rut   
		USING		sqlca;
		if sqlca.sqlcode = 0 then
			dw_datos.setitem(1,'codigo',ls_cod_jefe)
			dw_datos.setitem(1,'nombre_empleado',ls_nom_jefe)
			dw_datos.setitem(1,'a_paterno_empleado',ls_a_pat_jefe)
			dw_datos.setitem(1,'a_materno_empleado',ls_a_mat_jefe)
			dw_datos.setitem(1,'estado_rut',1)
			dw_datos.setcolumn('nro_licencia')
		else
			messagebox("Advertencia","Jefe Venta No Existe")
			wf_limpiar_dw(as_grupo)
			dw_datos.setcolumn('rut_empleado')
		end if
END CHOOSE
end subroutine

public subroutine wf_limpiar_dw (string as_grupo);long	ll_new
dw_datos.reset()
gs_codigo	= ''
ll_new		= dw_datos.insertrow(0)
dw_datos.scrolltorow(ll_new)
dw_datos.setitem(ll_new,'estado_rut',0)
dw_datos.setitem(ll_new,'estado_rut_medico',0)
dw_datos.setitem(ll_new,'estado_licencia',0)
dw_datos.setitem(ll_new,'grupo',as_grupo)
dw_datos.setitem(ll_new,'indicador_licencia','T')
dw_datos.setitem(ll_new,'fecha_crea',today())
dw_datos.setitem(ll_new,'fecha_inicio_licencia',today())
dw_datos.setitem(ll_new,'fecha_fin_licencia',today())
dw_datos.setitem(ll_new,'nro_dias',1)
dw_datos.accepttext()
dw_datos.setfocus()
end subroutine

public subroutine wf_limpiar_licencia ();string	ls_grupo_aux
long		ll_nulo_num
setnull(ls_grupo_aux)
setnull(ll_nulo_num)
dw_datos.scrolltorow(1)
dw_datos.setitem(1,'nro_licencia','')
dw_datos.setitem(1,'codigo_enfermedad','')
dw_datos.setitem(1,'glosa_enfermedad','')
dw_datos.setitem(1,'nro_dias',1)
dw_datos.setitem(1,'rut_medico',ll_nulo_num)
dw_datos.setitem(1,'dv_medico','')
dw_datos.setitem(1,'estado_rut_medico',0)
dw_datos.setitem(1,'nombre_medico','')
dw_datos.setitem(1,'a_paterno_medico','')
dw_datos.setitem(1,'a_materno_medico','')
dw_datos.setitem(1,'fecha_inicio_licencia',today())
dw_datos.setitem(1,'fecha_fin_licencia',today())
dw_datos.setfocus()
dw_datos.setcolumn('nro_licencia')
dw_datos.accepttext()
end subroutine

public subroutine wf_buscar_licencia (long al_rut, string as_licencia);string	ls_grupo_aux
long		ll_resp
SELECT	"LICENCIAS"."GRUPO"  
INTO 		:ls_grupo_aux  
FROM 		"LICENCIAS"  
WHERE 	( "LICENCIAS"."NRO_LICENCIA" = :as_licencia ) AND  
			( "LICENCIAS"."RUT_EMPLEADO" = :al_rut )   
USING		sqlca;
if sqlca.sqlcode = 0 then
	ll_resp	= MessageBox("Advertencia", 'Licencia Ya existente, desea mostrar datos',Exclamation!, YesNo!, 2)
	IF ll_resp = 1 THEN
		dw_datos.retrieve(as_licencia,al_rut)
		dw_datos.setitem(1,'estado_licencia',1)
		dw_datos.setitem(1,'estado_rut',1)
		dw_datos.setitem(1,'estado_rut_medico',1)
		dw_datos.setcolumn('nro_licencia')
	else
		wf_limpiar_licencia()
		dw_datos.setitem(1,'estado_licencia',0)
	END IF
else
	wf_limpiar_licencia()
	dw_datos.setitem(1,'estado_licencia',1)
end if
dw_datos.accepttext()
end subroutine

public subroutine wf_buscar_codigo (string as_codigo, string as_grupo);String	ls_cod_age, ls_nom_age, ls_a_pat_age, ls_a_mat_age, ls_cod_sup, ls_cod_jefe 
String	ls_nom_sup, ls_a_pat_sup, ls_a_mat_sup, ls_nom_jefe, ls_a_pat_jefe, ls_a_mat_jefe
Long		ll_rut_empleado

if as_grupo='A' THEN //AGENTE
	SELECT DISTINCT "AGENTES"."COD_AGE",	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"AGENTES"."RUT",	"SUPERVISOR"."COD_SUP",	"JEFE_VENTAS"."JEFE_VENTAS"	
	INTO 		:ls_cod_age,	:ls_nom_age,	:ls_a_pat_age,	:ls_a_mat_age,	:ll_rut_empleado,	:ls_cod_sup,	:ls_cod_jefe 
	FROM		"AGENTES","JEFE_VENTAS","SUPERVISOR"  
	WHERE	( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
				( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
				( ( "AGENTES"."COD_AGE" = :as_codigo ) )   
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		dw_datos.setitem(1,'rut_empleado',ll_rut_empleado)
		dw_datos.setitem(1,'nombre_empleado',ls_nom_age)
		dw_datos.setitem(1,'a_paterno_empleado',ls_a_pat_age)
		dw_datos.setitem(1,'a_materno_empleado',ls_a_mat_age)
		dw_datos.setitem(1,'codigo_supervisor',ls_cod_sup)
		dw_datos.setitem(1,'codigo_jefe',ls_cod_jefe)
		dw_datos.setitem(1,'estado_rut',1)
		dw_datos.setcolumn('nro_licencia')
	else
		messagebox("Advertencia","Agente No Existe")
		wf_limpiar_dw(as_grupo)
		dw_datos.setcolumn('codigo')
	end if

elseif as_grupo='S' THEN //SUPERVISOR
	SELECT 	DISTINCT "SUPERVISOR"."COD_SUP",	"SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO",	"SUPERVISOR"."RUT",	"JEFE_VENTAS"."JEFE_VENTAS"
	INTO	:ls_cod_sup,	:ls_nom_sup,	:ls_a_pat_sup,	:ls_a_mat_sup,	:ll_rut_empleado,	:ls_cod_jefe  
	FROM	"JEFE_VENTAS","SUPERVISOR"  
	WHERE	( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
				( ( "SUPERVISOR"."COD_SUP" = :as_codigo ) )  
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		dw_datos.setitem(1,'rut_empleado',ll_rut_empleado)
		dw_datos.setitem(1,'nombre_empleado',ls_nom_sup)
		dw_datos.setitem(1,'a_paterno_empleado',ls_a_pat_sup)
		dw_datos.setitem(1,'a_materno_empleado',ls_a_mat_sup)
		dw_datos.setitem(1,'codigo_jefe',ls_cod_jefe)
		dw_datos.setitem(1,'estado_rut',1)
		dw_datos.setcolumn('nro_licencia')
	else
		messagebox("Advertencia","Supervisor No Existe")
		wf_limpiar_dw(as_grupo)
		dw_datos.setcolumn('codigo')
	end if
elseif as_grupo='J' THEN // JEFE VENTA
	SELECT 	DISTINCT "JEFE_VENTAS"."JEFE_VENTAS",	"JEFE_VENTAS"."NOMBRE",	"JEFE_VENTAS"."A_PATERNO",	"JEFE_VENTAS"."A_MATERNO",	"JEFE_VENTAS"."RUT"
	INTO 		:ls_cod_jefe,	:ls_nom_jefe,	:ls_a_pat_jefe,	:ls_a_mat_jefe,	:ll_rut_empleado 
	FROM 	"JEFE_VENTAS"  
	WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :as_codigo   
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		dw_datos.setitem(1,'rut_empleado',ll_rut_empleado)
		dw_datos.setitem(1,'nombre_empleado',ls_nom_jefe)
		dw_datos.setitem(1,'a_paterno_empleado',ls_a_pat_jefe)
		dw_datos.setitem(1,'a_materno_empleado',ls_a_mat_jefe)
		dw_datos.setitem(1,'estado_rut',1)
		dw_datos.setcolumn('nro_licencia')
	else
		messagebox("Advertencia","Jefe Venta No Existe")
		wf_limpiar_dw(as_grupo)
		dw_datos.setcolumn('codigo')
	end if
end if
end subroutine

on w_mantencion.create
if this.MenuName = "m_menu_mantencion" then this.MenuID = create m_menu_mantencion
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.pb_buscar_trabajador=create pb_buscar_trabajador
this.rb_jefe=create rb_jefe
this.rb_supervisor=create rb_supervisor
this.rb_agente=create rb_agente
this.dw_datos=create dw_datos
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1,&
this.pb_buscar_trabajador,&
this.rb_jefe,&
this.rb_supervisor,&
this.rb_agente,&
this.dw_datos}
end on

on w_mantencion.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
destroy(this.pb_buscar_trabajador)
destroy(this.rb_jefe)
destroy(this.rb_supervisor)
destroy(this.rb_agente)
destroy(this.dw_datos)
end on

event open;string 	ls_opcion
il_grabar															= 0
m_menu_mantencion.m_ordenar.visible					= false
m_menu_mantencion.m_ordenar.ToolBaritemVisible	= false
m_menu_mantencion.m_filtrar.visible					= false
m_menu_mantencion.m_filtrar.ToolBaritemVisible	= false
m_menu_mantencion.m_exportar.visible				= false
m_menu_mantencion.m_exportar.ToolBaritemVisible	= false
gf_centrar(w_mantencion)
CHOOSE CASE gs_opcion
	CASE '1'
		this.title 													= 'Mantención Licencias Médicas'
		dw_datos.dataobject 									= 'dw_mantencion_licencias_medicas'
END CHOOSE
dw_datos.settransobject(sqlca)
rb_agente.triggerevenT(clicked!)
rb_agente.checked = true
if gs_conexion="Parque El Prado" then
	dw_datos.object.t_titulo.text = 'Parque El Prado'
elseif gs_conexion="Parque La Foresta" then
	dw_datos.object.t_titulo.text = 'Parque La Foresta'
elseif gs_conexion="Parque Concepción" then
	dw_datos.object.t_titulo.text = 'Parque Concepción'
end if
end event

type mdi_1 from mdiclient within w_mantencion
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_mantencion
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_mantencion
int X=0
int Y=0
int Width=0
int Height=596
end type

type pb_buscar_trabajador from picturebutton within w_mantencion
integer x = 91
integer y = 260
integer width = 192
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.BMP"
alignment htextalign = left!
end type

event clicked;openwithparm(w_lista_codigos,is_ventana)
end event

type rb_jefe from radiobutton within w_mantencion
integer x = 2688
integer y = 284
integer width = 270
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jefe"
end type

event clicked;is_ventana	= "J"
wf_limpiar_dw(is_ventana)
dw_datos.setcolumn('rut_empleado')
end event

type rb_supervisor from radiobutton within w_mantencion
integer x = 2395
integer y = 284
integer width = 270
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Superv"
end type

event clicked;is_ventana	= "S"
wf_limpiar_dw(is_ventana)
dw_datos.setcolumn('rut_empleado')
end event

type rb_agente from radiobutton within w_mantencion
integer x = 2103
integer y = 284
integer width = 270
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente"
end type

event clicked;is_ventana	= "A"
wf_limpiar_dw(is_ventana)
dw_datos.setcolumn('rut_empleado')
end event

type dw_datos from datawindow within w_mantencion
integer x = 32
integer y = 104
integer width = 3003
integer height = 1680
string dataobject = "dw_mantencion_licencias_medicas"
boolean border = false
boolean livescroll = true
end type

event clicked;String	ls_columna, ls_grupo
Long		ll_rut, ll_val, ll_val_lic, ll_dias
Date		ld_fecha, ld_fec_ini, ld_fec_fin
ls_columna	= dwo.name
ll_rut		= this.getitemnumber(1,'rut_empleado')
ll_val		= this.getitemnumber(1,'estado_rut')
ll_val_lic	= this.getitemnumber(1,'estado_licencia')
if ll_rut>0 and ll_val>0 and ll_val_lic>0 then
	CHOOSE CASE ls_columna
		CASE 'p_fec_ini'
			ld_fecha	= date(this.getitemdatetime(1,'fecha_inicio_licencia'))
			if f_valida_fecha(string(ld_fecha))=-1 then 
				this.setitem(1,'fecha_inicio_licencia',string(today(),gs_formato_fecha))
				return
			end if
			OpenWithParm(w_calendar,string(ld_fecha))
			IF not isnull(Message.StringParm) THEN
				this.setitem(1,'fecha_inicio_licencia',date(Message.StringParm))
				this.accepttext()
			END IF
			ld_fec_ini	= date(this.getitemdatetime(1,'fecha_inicio_licencia'))
			ld_fec_fin	= date(this.getitemdatetime(1,'fecha_fin_licencia'))
			if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then
				if ld_fec_ini > ld_fec_fin then
					messagebox("Advertencia","Rango de Fecha Incorrecto, Fecha inicio licencia es mayor a la fecha de término")
					this.setitem(1,'fecha_inicio_licencia',today())
					this.setfocus()
					this.setcolumn('fecha_inicio_licencia')
				else
					ll_dias	= DaysAfter(ld_fec_ini, ld_fec_fin)
					ll_dias++
					this.setitem(1,'nro_dias',ll_dias)
				end if
			end if

		CASE 'p_fec_fin'
			ld_fecha	= date(this.getitemdatetime(1,'fecha_fin_licencia'))
			if f_valida_fecha(string(ld_fecha))=-1 then 
				this.setitem(1,'fecha_fin_licencia',string(today(),gs_formato_fecha))
				return
			end if
			OpenWithParm(w_calendar,string(ld_fecha))
			IF not isnull(Message.StringParm) THEN
				this.setitem(1,'fecha_fin_licencia',date(Message.StringParm))
				this.accepttext()
			END IF
			ld_fec_ini	= date(this.getitemdatetime(1,'fecha_inicio_licencia'))
			ld_fec_fin	= date(this.getitemdatetime(1,'fecha_fin_licencia'))
			if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then
				if ld_fec_ini > ld_fec_fin then
					messagebox("Advertencia","Rango de Fecha Incorrecto, Fecha inicio licencia es mayor a la fecha de término")
					this.setitem(1,'fecha_fin_licencia',today())
					this.setfocus()
					this.setcolumn('fecha_fin_licencia')
				else
					ll_dias	= DaysAfter(ld_fec_ini, ld_fec_fin)
					ll_dias++
					this.setitem(1,'nro_dias',ll_dias)
				end if
			end if
	END CHOOSE
end if
end event

event itemchanged;Long		ll_rut_empleado, ll_dias, ll_new, ll_nro_dias, ll_resp
String	ls_codigo, ls_grupo, ls_licencia, ls_digito_v, ls_dv
String	ls_cod_age, ls_nom_age, ls_a_pat_age, ls_a_mat_age, ls_cod_sup, ls_cod_jefe
Date		ld_fec_ini, ld_fec_fin
is_columna	= dwo.name
this.accepttext()
il_grabar	= 1
CHOOSE CASE is_columna
	CASE 'rut_empleado'
		ll_rut_empleado	= this.getitemnumber(1,'rut_empleado')
		ls_grupo				= TRIM(this.getitemstring(1,'grupo'))
		wf_buscar_rut(ll_rut_empleado,ls_grupo)
		ls_licencia			= TRIM(this.getitemstring(1,'nro_licencia'))
		if ll_rut_empleado > 0 and not isnull(ls_licencia) then
			wf_buscar_licencia(ll_rut_empleado,ls_licencia)
		end if

	CASE 'codigo'
		gs_codigo			= TRIM(this.getitemstring(1,'codigo'))
		ls_grupo				= TRIM(this.getitemstring(1,'grupo'))
		wf_buscar_codigo(gs_codigo,ls_grupo)
		ll_rut_empleado	= this.getitemnumber(1,'rut_empleado')
		ls_licencia			= TRIM(this.getitemstring(1,'nro_licencia'))
		if ll_rut_empleado > 0 and not isnull(ls_licencia) then
			wf_buscar_licencia(ll_rut_empleado,ls_licencia)
		end if
		
	CASE 'nro_licencia'
		ls_licencia			= TRIM(this.getitemstring(1,'nro_licencia'))
		ll_rut_empleado	= this.getitemnumber(1,'rut_empleado')
		if ll_rut_empleado > 0 and not isnull(ls_licencia) then
			wf_buscar_licencia(ll_rut_empleado,ls_licencia)
		end if
		
	CASE 'fecha_inicio_licencia'
		ld_fec_ini			= date(this.getitemdatetime(1,'fecha_inicio_licencia'))
		ld_fec_fin			= date(this.getitemdatetime(1,'fecha_fin_licencia'))
		if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then
			if ld_fec_ini > ld_fec_fin then
				messagebox("Advertencia","Rango de Fecha Incorrecto, Fecha inicio licencia es mayor a la fecha de término")
				setnull(ld_fec_ini)
				this.setitem(1,'fecha_inicio_licencia',ld_fec_ini)
			else
				ll_dias	= DaysAfter(ld_fec_ini, ld_fec_fin)
				ll_dias++
				this.setitem(1,'nro_dias',ll_dias)
			end if
		end if
		
	CASE 'fecha_fin_licencia'
		ld_fec_ini			= date(this.getitemdatetime(1,'fecha_inicio_licencia'))
		ld_fec_fin			= date(this.getitemdatetime(1,'fecha_fin_licencia'))
		if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then
			if ld_fec_ini > ld_fec_fin then
				messagebox("Advertencia","Rango de Fecha Incorrecto, Fecha inicio licencia es mayor a la fecha de término")
				setnull(ld_fec_fin)
				this.setitem(1,'fecha_fin_licencia',ld_fec_ini)
			else
				ll_dias	= DaysAfter(ld_fec_ini, ld_fec_fin)
				ll_dias++
				this.setitem(1,'nro_dias',ll_dias)
			end if
		end if

	CASE 'rut_medico','dv_medico'
		this.setitem(1,'estado_rut_medico',1)

	CASE 'nro_dias'
		ld_fec_ini	= date(this.getitemdatetime(1,'fecha_inicio_licencia'))
		ll_nro_dias	= long(data)
		if not isnull(ld_fec_ini) and ll_nro_dias > 0 then
			ld_fec_fin	= RelativeDate(ld_fec_ini, (ll_nro_dias - 1))
			this.setitem(1,'fecha_fin_licencia',ld_fec_fin)
			this.accepttext()
		else
			ll_resp = MessageBox("Advertencia","Nº de días inválido, debe ser Mayor a 0",Exclamation!, OK!, 1)
			if ll_resp=1 then
				ll_nro_dias	= 1
				this.setitem(1,'fecha_fin_licencia',ld_fec_ini)
				this.setitem(1,'nro_dias',ll_nro_dias)
				this.accepttext()
				this.setfocus()
				this.setcolumn('nro_dias')
			end if
		end if
END CHOOSE


end event

event itemfocuschanged;long		ll_estado_lic, ll_nro_dias
string	ls_columna
date		ld_fec_ini
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'rut_medico','dv_medico'
		ld_fec_ini	= date(this.getitemdatetime(1,'fecha_inicio_licencia'))
		ll_nro_dias	= this.getitemnumber(1,'nro_dias')
		if isnull(ld_fec_ini) or ll_nro_dias <= 0 then
			ll_nro_dias	= 1
			this.setitem(1,'fecha_fin_licencia',ld_fec_ini)
			this.setitem(1,'nro_dias',ll_nro_dias)
			this.accepttext()
			this.setfocus()
			this.setcolumn('nro_dias')
		else
			ll_estado_lic	= this.getitemnumber(1,'estado_licencia')
			if ll_estado_lic=0 then
				this.setfocus()
				this.setcolumn('nro_licencia')
			end if			
		end if
		
	CASE 'nro_licencia'
		ll_estado_lic	= this.getitemnumber(1,'estado_rut')
		if ll_estado_lic=0 then
			this.setfocus()
			this.setcolumn('rut_empleado')
		end if
END CHOOSE

end event

