forward
global type w_principal_bkp from window
end type
type mdi_1 from mdiclient within w_principal_bkp
end type
type mditbb_1 from tabbedbar within w_principal_bkp
end type
type mdirbb_1 from ribbonbar within w_principal_bkp
end type
type p_1 from picture within w_principal_bkp
end type
end forward

global type w_principal_bkp from window
integer x = 1102
integer y = 704
integer width = 4178
integer height = 2036
boolean titlebar = true
string title = "Consultas - Inmobiliaria"
string menuname = "m_menu_principal"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 79741120
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
p_1 p_1
end type
global w_principal_bkp w_principal_bkp

on w_principal_bkp.create
if this.MenuName = "m_menu_principal" then this.MenuID = create m_menu_principal
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.p_1=create p_1
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1,&
this.p_1}
end on

on w_principal_bkp.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
destroy(this.p_1)
end on

event open;String	ls_opcion_dig,ls_depto,ls_cod_aux,ls_canal
gf_centrar(w_principal)

SELECT	MIN("CD_FOLIO"."NUMERO")  
INTO 		:gi_prim_nro_O_cd  
FROM 		"CD_FOLIO"  
WHERE 	"CD_FOLIO"."BASE" = 'O'   ;
if isnull(gi_prim_nro_O_cd) then gi_prim_nro_O_cd=0
SELECT	MIN("CD_FOLIO"."NUMERO")  
INTO 		:gi_prim_nro_L_cd  
FROM 		"CD_FOLIO"  
WHERE 	"CD_FOLIO"."BASE" = 'L'   ;
if isnull(gi_prim_nro_L_cd) then gi_prim_nro_L_cd=0
SELECT	MIN("CD_FOLIO"."NUMERO")  
INTO 		:gi_prim_nro_P_cd  
FROM 		"CD_FOLIO"  
WHERE 	"CD_FOLIO"."BASE" = 'P'   ;
if isnull(gi_prim_nro_P_cd) then gi_prim_nro_P_cd=0
SELECT	MIN("CD_FOLIO"."NUMERO")  
INTO 		:gi_prim_nro_A_cd  
FROM 		"CD_FOLIO"  
WHERE 	"CD_FOLIO"."BASE" = 'A'   ;
if isnull(gi_prim_nro_A_cd) then gi_prim_nro_A_cd=0
SELECT	"ENCARGADOS"."DIGITACION"  , 	"ENCARGADOS"."DEPTO"
INTO 		:ls_opcion_dig,					:gs_depto
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
USING		sqlca;
gs_ventana	= 'w_principal'
//setenv NLS_LANG American_America.WE8ISO8859P1;
f_valida_objeto()
SELECT	"SUPERVISOR"."CANAL"  
INTO 		:ls_canal  
FROM 		"SUPERVISOR"  
WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	if ls_canal='NF' then
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_nf.visible	= true
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_ni.visible	= false
	elseif ls_canal='NI' then
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_ni.visible	= true
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_nf.visible	= false
	end if
end if
SELECT	"JEFE_VENTAS"."CANAL"  
INTO 		:ls_canal  
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	if ls_canal='NF' then
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_nf.visible	= true
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_ni.visible	= false
	elseif ls_canal='NI' then
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_ni.visible	= true
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_nf.visible	= false
	end if
end if
if gs_depto='I' or gs_depto='O' or gs_depto='F' or gs_depto='P' then 
	m_menu_principal.m_mensajes.visible															= true
	m_menu_principal.m_mensajes.m_crear.visible												= true
	m_menu_principal.m_mensajes.m_buscar.visible												= true
	if gs_depto='O' or gs_depto='P' or gs_depto='I' then
		m_menu_principal.m_consultas.m_util.m_validarcliente.visible					= true
	end if
else
	m_menu_principal.m_mensajes.visible															= false
	m_menu_principal.m_mensajes.m_crear.visible												= false
	m_menu_principal.m_mensajes.m_buscar.visible												= false
	m_menu_principal.m_consultas.m_util.m_validarcliente.visible						= false
end if
if gs_conexion = "Parque El Prado" then
	m_menu_principal.m_consultas.m_estadosolicitudes.m_titulodedominio0.visible	= true
else
	m_menu_principal.m_consultas.m_estadosolicitudes.m_titulodedominio0.visible	= false
end if
if gs_depto='I' then
	m_menu_principal.m_consultas.m_util.m_presupuesto.visible							= true
	m_menu_principal.m_consultas.m_util.m_-26.visible										= true
	m_menu_principal.m_consultas.m_util.m_actualizarwebpagos.visible					= true
else
	m_menu_principal.m_consultas.m_util.m_presupuesto.visible							= false
	m_menu_principal.m_consultas.m_util.m_-26.visible										= false
	m_menu_principal.m_consultas.m_util.m_actualizarwebpagos.visible					= false
end if
end event

event close;halt close
end event

type mdi_1 from mdiclient within w_principal_bkp
long BackColor=276856960
end type

type mditbb_1 from tabbedbar within w_principal_bkp
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_principal_bkp
int X=0
int Y=0
int Width=0
int Height=596
end type

type p_1 from picture within w_principal_bkp
integer width = 6185
integer height = 2960
string picturename = "navidad70.jpg"
boolean focusrectangle = false
end type

