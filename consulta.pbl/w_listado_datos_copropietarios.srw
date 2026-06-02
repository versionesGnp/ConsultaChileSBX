forward
global type w_listado_datos_copropietarios from window
end type
type cb_volver from commandbutton within w_listado_datos_copropietarios
end type
type dw_2 from datawindow within w_listado_datos_copropietarios
end type
type dw_1 from datawindow within w_listado_datos_copropietarios
end type
type cb_7 from commandbutton within w_listado_datos_copropietarios
end type
type cb_6 from commandbutton within w_listado_datos_copropietarios
end type
type cb_5 from commandbutton within w_listado_datos_copropietarios
end type
type cb_4 from commandbutton within w_listado_datos_copropietarios
end type
type cb_3 from commandbutton within w_listado_datos_copropietarios
end type
type cb_2 from commandbutton within w_listado_datos_copropietarios
end type
type cb_1 from commandbutton within w_listado_datos_copropietarios
end type
type cb_mensajes from commandbutton within w_listado_datos_copropietarios
end type
type cb_fallecidos from commandbutton within w_listado_datos_copropietarios
end type
type cb_datos_repacta from commandbutton within w_listado_datos_copropietarios
end type
type cb_beneficiarios from commandbutton within w_listado_datos_copropietarios
end type
type cb_datos_clientes from commandbutton within w_listado_datos_copropietarios
end type
type cb_datos_contrato from commandbutton within w_listado_datos_copropietarios
end type
type cb_cerrar from commandbutton within w_listado_datos_copropietarios
end type
type cb_ver_cuenta_corriente from commandbutton within w_listado_datos_copropietarios
end type
type dw_listado from datawindow within w_listado_datos_copropietarios
end type
type gb_1 from groupbox within w_listado_datos_copropietarios
end type
end forward

global type w_listado_datos_copropietarios from window
string tag = "dw_listado_copropietario_isacruz"
integer x = 462
integer y = 412
integer width = 3090
integer height = 1496
boolean titlebar = true
string title = "Resultado Consulta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_volver cb_volver
dw_2 dw_2
dw_1 dw_1
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_mensajes cb_mensajes
cb_fallecidos cb_fallecidos
cb_datos_repacta cb_datos_repacta
cb_beneficiarios cb_beneficiarios
cb_datos_clientes cb_datos_clientes
cb_datos_contrato cb_datos_contrato
cb_cerrar cb_cerrar
cb_ver_cuenta_corriente cb_ver_cuenta_corriente
dw_listado dw_listado
gb_1 gb_1
end type
global w_listado_datos_copropietarios w_listado_datos_copropietarios

type variables
long il_cant_datos, il_fila, il_row5
datawindow dw_paso
end variables

forward prototypes
public subroutine wf_setea_dw_promesa (datawindow adw_listado)
public subroutine wf_setea_dw_todos (datawindow adw_listado)
public subroutine wf_busqueda_x_fallecido (ref string ls_sql_new, ref string ls_sql_old)
public subroutine wf_setea_dw_isacruz (datawindow adw_listado)
end prototypes

public subroutine wf_setea_dw_promesa (datawindow adw_listado);long ll_largo
if not isnull(gs_nombres) then gs_nombres	= gs_nombres+'%'
if not isnull(gs_apellido_paterno) then gs_apellido_paterno	= gs_apellido_paterno+'%'
if not isnull(gs_apellido_materno) then gs_apellido_materno	= gs_apellido_materno+'%'

if not isnull(gi_rut_buscar) and isnull(gs_nombres) and isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_promesa_rut'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos 			= adw_listado.Retrieve(gi_rut_buscar)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_promesa_nombre'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos 			= adw_listado.Retrieve(gs_nombres)
end if
if isnull(gi_rut_buscar) and isnull(gs_nombres) and not isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_promesa_paterno'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos 			= adw_listado.Retrieve(gs_apellido_paterno)
end if
if isnull(gi_rut_buscar) and isnull(gs_nombres) and isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_promesa_materno'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos 			= adw_listado.Retrieve(gs_apellido_materno)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and not isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_promesa_nom_pat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos 			= adw_listado.Retrieve(gs_nombres,gs_apellido_paterno)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_promesa_nom_mat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos 			= adw_listado.Retrieve(gs_nombres,gs_apellido_materno)
end if
if isnull(gi_rut_buscar) and isnull(gs_nombres) and not isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_promesa_pat_mat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos 			= adw_listado.Retrieve(gs_apellido_paterno,gs_apellido_materno)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and not isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_promesa_todo'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos 			= adw_listado.Retrieve(gs_nombres,gs_apellido_paterno,gs_apellido_materno)
end if
if isnull(gs_base) then gs_base = 'O'
if not isnull(gs_nombres) then 
	ll_largo 					= len(gs_nombres)
	gs_nombres				= mid(gs_nombres,1,(ll_largo - 1))
end if
if not isnull(gs_apellido_paterno) then 
	ll_largo 					= len(gs_apellido_paterno)
	gs_apellido_paterno	= mid(gs_apellido_paterno,1,(ll_largo - 1))
end if
if not isnull(gs_apellido_materno) then 
	ll_largo 					= len(gs_apellido_materno)
	gs_apellido_materno	= mid(gs_apellido_materno,1,(ll_largo - 1))
end if
end subroutine

public subroutine wf_setea_dw_todos (datawindow adw_listado);//long ll_largo
//if not isnull(gs_nombres) then gs_nombres	= gs_nombres+'%'
//if not isnull(gs_apellido_paterno) then gs_apellido_paterno	= gs_apellido_paterno+'%'
//if not isnull(gs_apellido_materno) then gs_apellido_materno	= gs_apellido_materno+'%'

if not isnull(gi_rut_buscar) and isnull(gs_nombres) and isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropieta_todos_rut'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gi_rut_buscar)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropieta_todos_nombre'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_nombres)
end if
if isnull(gi_rut_buscar) and isnull(gs_nombres) and not isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropieta_todos_ape_pat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_apellido_paterno)
end if
if isnull(gi_rut_buscar) and isnull(gs_nombres) and isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropieta_todos_ape_mat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_apellido_materno)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and not isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_todos_nombre_pat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_nombres,gs_apellido_paterno)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_todos_nombre_mat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_nombres,gs_apellido_materno)
end if
if isnull(gi_rut_buscar) and isnull(gs_nombres) and not isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_todos_ape_pat_mat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_apellido_paterno,gs_apellido_materno)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and not isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_todos_todos'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_nombres,gs_apellido_paterno,gs_apellido_materno)
end if
//gs_base = 'C'
//if not isnull(gs_nombres) then 
//	ll_largo 	= len(gs_nombres)
//	gs_nombres	= mid(gs_nombres,1,(ll_largo - 1))
//end if
//if not isnull(gs_apellido_paterno) then 
//	ll_largo 				= len(gs_apellido_paterno)
//	gs_apellido_paterno	= mid(gs_apellido_paterno,1,(ll_largo - 1))
//end if
//if not isnull(gs_apellido_materno) then 
//	ll_largo 				= len(gs_apellido_materno)
//	gs_apellido_materno	= mid(gs_apellido_materno,1,(ll_largo - 1))
//end if

end subroutine

public subroutine wf_busqueda_x_fallecido (ref string ls_sql_new, ref string ls_sql_old);if len(string(gi_rut)) > 0 then
ls_sql_new = ls_sql_old + ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and (  "FALLECIDOS"."RUT" = '+string(gi_rut)+'  )  '+&
								  'ORDER BY  "FALLECIDOS"."AP_PATERNO" ASC,         '+&
								  '			 "FALLECIDOS"."AP_MATERNO" ASC,         '+&
								  '			 "FALLECIDOS"."NOMBRES" ASC             '
end if
if len(gs_apellido_materno) > 0 and  len(gs_apellido_paterno) > 0 and  len(gs_nombres) > 0  and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//123
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' )  and		 "FALLECIDOS"."NOMBRES"    like '+"'"+gs_nombres+'%'+"'"+' AND  '+&
									'         "FALLECIDOS"."AP_PATERNO" like '+"'"+gs_apellido_paterno+'%'+"'"+' and  '+&
									'         "FALLECIDOS"."AP_MATERNO" like '+"'"+gs_apellido_materno+'%'+"'"+'  '+&
									'ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) > 0 and  len(gs_nombres) > 0  and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//12
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and		 "FALLECIDOS"."NOMBRES"    like '+"'"+gs_nombres+'%'+"'"+' AND  '+&
									'         "FALLECIDOS"."AP_PATERNO" like '+"'"+gs_apellido_paterno+'%'+"'"+' '+&
									'ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) = 0 and  len(gs_nombres) = 0  and len(gs_sector) > 0 and len(gs_sepultura) > 0 then//4
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."SECTOR" like '+"'"+gs_sector+"'"+' '+&
									' and     "FALLECIDOS"."N_SEP" like '+"'"+gs_sepultura+'%'+"'"+'  '+&
									'ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) = 0 and  len(gs_nombres) > 0  and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//1
ls_sql_new = ls_sql_old +  '	and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and 	 "FALLECIDOS"."NOMBRES" like '+"'"+gs_nombres+'%'+"'"+' '+&
									'ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES" ASC   '
end if
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) > 0 and  len(gs_nombres) = 0  and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//2
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."AP_PATERNO" like '+"'"+gs_apellido_paterno+'%'+"'"+'  '+&
									'ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) = 0 and  len(gs_nombres) = 0  and len(gs_sector) > 0 and len(gs_sepultura) = 0 then//4
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."SECTOR" like '+"'"+gs_sector+"'"+'  '+&
									'ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) = 0 and  len(gs_nombres) = 0  and len(gs_sector) = 0 and len(gs_sepultura) > 0 then//5
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."N_SEP" like '+"'"+gs_sepultura+'%'+"'"+'  '+&
									'ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
setnull(gi_tipo_busqueda)
setnull(gi_rut)
setnull(gs_apellido_paterno)
setnull(gs_apellido_materno)
setnull(gs_nombres)
setnull(gs_sector)
setnull(gs_sepultura)
end subroutine

public subroutine wf_setea_dw_isacruz (datawindow adw_listado);long ll_largo
if not isnull(gs_nombres) then gs_nombres	= gs_nombres+'%'
if not isnull(gs_apellido_paterno) then gs_apellido_paterno	= gs_apellido_paterno+'%'
if not isnull(gs_apellido_materno) then gs_apellido_materno	= gs_apellido_materno+'%'

if not isnull(gi_rut_buscar) and isnull(gs_nombres) and isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_isacruz_rut'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gi_rut_buscar)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_isacruz_nombre'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_nombres)
end if
if isnull(gi_rut_buscar) and isnull(gs_nombres) and not isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_isacruz_paterno'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_apellido_paterno)
end if
if isnull(gi_rut_buscar) and isnull(gs_nombres) and isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_isacruz_materno'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_apellido_materno)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and not isnull(gs_apellido_paterno) and isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_isacruz_nom_pat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_nombres,gs_apellido_paterno)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_isacruz_nom_mat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_nombres,gs_apellido_materno)
end if
if isnull(gi_rut_buscar) and isnull(gs_nombres) and not isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_isacruz_pat_mat'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_apellido_paterno,gs_apellido_materno)
end if
if isnull(gi_rut_buscar) and not isnull(gs_nombres) and not isnull(gs_apellido_paterno) and not isnull(gs_apellido_materno) then
	adw_listado.DataObject = 'dw_listado_copropietario_isacruz_todo'
	adw_listado.SetTransObject(SQLCA)
	il_cant_datos = adw_listado.Retrieve(gs_nombres,gs_apellido_paterno,gs_apellido_materno)
end if
gs_base = 'C'
if not isnull(gs_nombres) then 
	ll_largo 	= len(gs_nombres)
	gs_nombres	= mid(gs_nombres,1,(ll_largo - 1))
end if
if not isnull(gs_apellido_paterno) then 
	ll_largo 				= len(gs_apellido_paterno)
	gs_apellido_paterno	= mid(gs_apellido_paterno,1,(ll_largo - 1))
end if
if not isnull(gs_apellido_materno) then 
	ll_largo 				= len(gs_apellido_materno)
	gs_apellido_materno	= mid(gs_apellido_materno,1,(ll_largo - 1))
end if

end subroutine

on w_listado_datos_copropietarios.create
this.cb_volver=create cb_volver
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_mensajes=create cb_mensajes
this.cb_fallecidos=create cb_fallecidos
this.cb_datos_repacta=create cb_datos_repacta
this.cb_beneficiarios=create cb_beneficiarios
this.cb_datos_clientes=create cb_datos_clientes
this.cb_datos_contrato=create cb_datos_contrato
this.cb_cerrar=create cb_cerrar
this.cb_ver_cuenta_corriente=create cb_ver_cuenta_corriente
this.dw_listado=create dw_listado
this.gb_1=create gb_1
this.Control[]={this.cb_volver,&
this.dw_2,&
this.dw_1,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_mensajes,&
this.cb_fallecidos,&
this.cb_datos_repacta,&
this.cb_beneficiarios,&
this.cb_datos_clientes,&
this.cb_datos_contrato,&
this.cb_cerrar,&
this.cb_ver_cuenta_corriente,&
this.dw_listado,&
this.gb_1}
end on

on w_listado_datos_copropietarios.destroy
destroy(this.cb_volver)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_mensajes)
destroy(this.cb_fallecidos)
destroy(this.cb_datos_repacta)
destroy(this.cb_beneficiarios)
destroy(this.cb_datos_clientes)
destroy(this.cb_datos_contrato)
destroy(this.cb_cerrar)
destroy(this.cb_ver_cuenta_corriente)
destroy(this.dw_listado)
destroy(this.gb_1)
end on

event open;long 		ll_largo
STRING 	ls_sql_old,ls_sql_new
if gi_busqueda_cop=1 then w_listado_datos_copropietarios.title = 'Listado de Copropietarios Promesa'
if gi_busqueda_cop=2 then w_listado_datos_copropietarios.title = 'Listado de Copropietarios IsaCruz'
if gi_busqueda_cop=3 then w_listado_datos_copropietarios.title = 'Listado de Copropietarios Promesa / IsaCruz'
gf_centrar(w_listado_datos_copropietarios)
il_row5									= 0
cb_ver_cuenta_corriente.visible	= false
cb_datos_contrato.visible			= false
cb_datos_repacta.visible			= false
cb_datos_clientes.visible			= false
cb_beneficiarios.visible			= false
cb_fallecidos.visible				= false
cb_mensajes.visible					= false
//cb_4.visible							= false
cb_5.visible							= false
cb_6.visible							= false
cb_7.visible							= false
cb_volver.visible						= false
cb_cerrar.visible						= true
gs_ventana								= 'w_listado_datos_copropietarios'
f_valida_objeto()
if not isnull(gs_nombres) then gs_nombres	= gs_nombres+'%'
if not isnull(gs_apellido_paterno) then gs_apellido_paterno	= gs_apellido_paterno+'%'
if not isnull(gs_apellido_materno) then gs_apellido_materno	= gs_apellido_materno+'%'
CHOOSE CASE gi_busqueda_cop
	CASE 1 //Promesa
		wf_setea_dw_promesa(dw_listado)

	CASE 2 //IsaCruz
		wf_setea_dw_isacruz(dw_listado)
		
	CASE 3 // Todos
		wf_setea_dw_todos(dw_listado)
		
END CHOOSE
if not isnull(gs_nombres) then 
	ll_largo 	= len(gs_nombres)
	gs_nombres	= mid(gs_nombres,1,(ll_largo - 1))
end if
if not isnull(gs_apellido_paterno) then 
	ll_largo 				= len(gs_apellido_paterno)
	gs_apellido_paterno	= mid(gs_apellido_paterno,1,(ll_largo - 1))
end if
if not isnull(gs_apellido_materno) then 
	ll_largo 				= len(gs_apellido_materno)
	gs_apellido_materno	= mid(gs_apellido_materno,1,(ll_largo - 1))
end if
IF il_cant_datos = 0 THEN
	MessageBox("Consulta", "No encontraron datos asociados a su consulta.")
	Close(w_listado_datos_copropietarios)
END IF
end event

type cb_volver from commandbutton within w_listado_datos_copropietarios
integer x = 2679
integer y = 1108
integer width = 357
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Volver"
end type

event clicked;	if gi_busqueda_cop=1 then w_listado_datos_copropietarios.title = 'Listado de Copropietarios Promesa'
	if gi_busqueda_cop=2 then w_listado_datos_copropietarios.title = 'Listado de Copropietarios IsaCruz'
	if gi_busqueda_cop=3 then w_listado_datos_copropietarios.title = 'Listado de Copropietarios Promesa / IsaCruz'
	cb_ver_cuenta_corriente.visible	= false
	cb_datos_contrato.visible			= false
	cb_datos_repacta.visible			= false
	cb_datos_clientes.visible			= false
	cb_beneficiarios.visible			= false
	cb_fallecidos.visible				= false
	cb_mensajes.visible					= false
//	cb_4.visible							= false
	cb_5.visible							= false
	cb_6.visible							= false
	cb_7.visible							= false
	this.visible							= false
	cb_cerrar.visible						= true
	CHOOSE CASE gi_busqueda_cop
		CASE 1 //Promesa
			wf_setea_dw_promesa(dw_listado)
	
		CASE 2 //IsaCruz
			wf_setea_dw_isacruz(dw_listado)
			
		CASE 3 // Todos
			wf_setea_dw_todos(dw_listado)
	END CHOOSE
	dw_listado.scrolltorow(il_fila)
end event

type dw_2 from datawindow within w_listado_datos_copropietarios
boolean visible = false
integer x = 1824
integer y = 1224
integer width = 283
integer height = 148
boolean titlebar = true
string dataobject = "d_listado_cuenta_cte_ch"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_1 from datawindow within w_listado_datos_copropietarios
boolean visible = false
integer x = 827
integer y = 164
integer width = 1353
integer height = 792
integer taborder = 20
boolean titlebar = true
string title = "Información de Documentos"
string dataobject = "dw_estado_de_ch"
boolean controlmenu = true
boolean livescroll = true
end type

event clicked;visible = false
reset()
end event

type cb_7 from commandbutton within w_listado_datos_copropietarios
integer x = 896
integer y = 1260
integer width = 530
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuotas &Mantención"
end type

event clicked;if il_row5 > 0 then
	gs_base 				= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 			= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 			= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 				= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible = false
		if isvalid(w_boletas_cuotas) then close(w_boletas_cuotas)
		open(w_boletas_cuotas)
	end if
end if
end event

type cb_6 from commandbutton within w_listado_datos_copropietarios
integer x = 475
integer y = 1260
integer width = 416
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuo&tas Crédito"
end type

event clicked;if il_row5 > 0 then
	gs_base 				= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 			= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 			= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 				= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible = false
		if isvalid(w_repacta) then close(w_repacta)
		open(w_repacta)
	end if
end if
end event

type cb_5 from commandbutton within w_listado_datos_copropietarios
integer x = 46
integer y = 1260
integer width = 425
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "V&er Documentos"
end type

event clicked;if il_row5 > 0 then
	gs_base 				= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 			= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 			= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 				= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_VER_CHEQUES) then close(w_VER_CHEQUES)
		Open(w_VER_CHEQUES)
	end if
end if
end event

type cb_4 from commandbutton within w_listado_datos_copropietarios
boolean visible = false
integer x = 1513
integer y = 1260
integer width = 233
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Por &Rut"
end type

event clicked;if il_row5 > 0 then
	gs_base 				= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 			= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 			= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 				= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 and gi_rut>0 then
		dw_1.visible = false
		gi_tipo_busqueda = 1
		if isvalid(w_listado_contratos_rut) then close(w_listado_contratos_rut)
		open(w_listado_contratos_rut)
	end if
end if
end event

type cb_3 from commandbutton within w_listado_datos_copropietarios
integer x = 2546
integer y = 1260
integer width = 206
integer height = 96
integer taborder = 160
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "F&iltrar"
end type

event clicked;string nulo
dw_1.visible = false
setnull (nulo)
dw_listado.SETfilter(NULO)
dw_listado.filter()
end event

type cb_2 from commandbutton within w_listado_datos_copropietarios
boolean visible = false
integer x = 2757
integer y = 1260
integer width = 247
integer height = 96
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;dw_paso	= dw_listado
if dw_listado.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_1 from commandbutton within w_listado_datos_copropietarios
integer x = 2304
integer y = 1260
integer width = 238
integer height = 96
integer taborder = 150
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
dw_1.visible = false
if dw_listado.getrow() > 0 then
	setnull (nulo)
	dw_listado.SETSORT(NULO)
	dw_listado.SORT()
end if

end event

type cb_mensajes from commandbutton within w_listado_datos_copropietarios
integer x = 2016
integer y = 1108
integer width = 261
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Mensajes"
end type

event clicked;Long	ll_count
if il_row5 > 0 then
	gs_base 				= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 			= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 			= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 				= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible = false
		if gi_rut>0 then 
			if isvalid(w_aviso_mensajes) then close(w_aviso_mensajes)
			SELECT	COUNT("MENSAJES"."FECHA_CREACION")  
			INTO 		:ll_count  
			FROM 		"MENSAJES"  
			WHERE  ( "MENSAJES"."RUT" = :gi_rut ) and
					 ( "MENSAJES"."ESTADO_GESTION" = 'A' ) AND
					 ( "MENSAJES"."SW_MENSAJE" = 'R' ) and
					 ( "MENSAJES"."FECHA_FIN" > :gdt_fec_sistema )
			USING		sqlca;
			if ll_count>0 then
				OpenWithParm(w_aviso_mensajes, "R")
			else
				SELECT	COUNT("MENSAJES"."FECHA_CREACION")  
				INTO 		:ll_count  
				FROM 		"MENSAJES"  
				WHERE  ( "MENSAJES"."BASE" = :gs_base ) and
						 ( "MENSAJES"."SERIE" = :gs_serie ) and
						 ( "MENSAJES"."NUMERO" = :gi_numero ) and
						 ( "MENSAJES"."ESTADO_GESTION" = 'A' ) AND
						 ( "MENSAJES"."SW_MENSAJE" = 'C' ) and
						 ( "MENSAJES"."FECHA_FIN" > :gdt_fec_sistema )
				USING		sqlca;
				if ll_count>0 then
					OpenWithParm(w_aviso_mensajes, "C")
				end if
			end if
		end if
	end if
end if
end event

type cb_fallecidos from commandbutton within w_listado_datos_copropietarios
integer x = 1746
integer y = 1108
integer width = 270
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Fallecidos"
end type

event clicked;if il_row5 > 0 then
	gs_base 				= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 			= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 			= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 				= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible	= false
		if isvalid(w_listado_fallecidos) then close(w_listado_fallecidos)
		Open(w_listado_fallecidos)
	end if
end if
end event

type cb_datos_repacta from commandbutton within w_listado_datos_copropietarios
event clicked pbm_bnclicked
integer x = 741
integer y = 1108
integer width = 366
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Repactaciones"
end type

event clicked;if il_row5 > 0 then
	gs_base 					= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 					= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 				= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 					= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 		= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_listado_repacta) then close(w_listado_repacta)
				Open(w_listado_repacta)
			CASE "L" // Anexo Liberador
		//		Open(w_datos_contrato_liberador)
			CASE "A"
				if isvalid(w_listado_repacta_aumento_capacidad) then close(w_listado_repacta_aumento_capacidad)
				Open(w_listado_repacta_aumento_capacidad)
		END CHOOSE
	end if
end if	

end event

type cb_beneficiarios from commandbutton within w_listado_datos_copropietarios
integer x = 1422
integer y = 1108
integer width = 325
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Beneficiarios"
end type

event clicked;if il_row5 > 0 then
	gs_base 					= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 					= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 				= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 					= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 		= false
		CHOOSE CASE gs_base
			CASE "O","U" ,"M"// Oferta
				if isvalid(w_listado_beneficiarios) then close(w_listado_beneficiarios)
				Open(w_listado_beneficiarios)
			CASE "C" // ISACRUZ
				if isvalid(w_listado_beneficiarios2) then close(w_listado_beneficiarios2)
				Open(w_listado_beneficiarios2)
		END CHOOSE
	end if
end if
end event

type cb_datos_clientes from commandbutton within w_listado_datos_copropietarios
integer x = 1106
integer y = 1108
integer width = 315
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Datos Cliente"
end type

event clicked;if il_row5 > 0 then
	gs_base 				= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 			= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 			= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 				= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_datos_cliente) then close(w_datos_cliente)
		Open(w_datos_cliente)
	end if
end if
end event

type cb_datos_contrato from commandbutton within w_listado_datos_copropietarios
integer x = 475
integer y = 1108
integer width = 265
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&ontrato"
end type

event clicked;if il_row5 > 0 then
	gs_base 					= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 					= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 				= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 					= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 		= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_datos_contrato_oferta) then close(w_datos_contrato_oferta)
				Open(w_datos_contrato_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_datos_contrato_liberador) then close(w_datos_contrato_liberador)
				Open(w_datos_contrato_liberador)
			CASE "P" // Pagaré
				if isvalid(w_datos_contrato_pagare) then close(w_datos_contrato_pagare)
				Open(w_datos_contrato_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_datos_contrato_isa) then close(w_datos_contrato_isa)
				Open(w_datos_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_datos_contrato_derecho) then close(w_datos_contrato_derecho)
				Open(w_datos_contrato_derecho)
			CASE "R" // Reprogramacion Cta. Mant.
				if isvalid(w_datos_contrato_reprogramacion_cta_mant) then close(w_datos_contrato_reprogramacion_cta_mant)
				open(w_datos_contrato_reprogramacion_cta_mant)
			CASE "A" // Aumento Capacidad
				if isvalid(w_datos_contrato_aumento_capacidad) then close(w_datos_contrato_aumento_capacidad)
				open(w_datos_contrato_aumento_capacidad)
		END CHOOSE
	end if
end if	

end event

type cb_cerrar from commandbutton within w_listado_datos_copropietarios
integer x = 2679
integer y = 1108
integer width = 357
integer height = 100
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_consultar_copropietario) then
	IF gi_busqueda_cop = 1 or gi_busqueda_cop = 2 THEN
		w_consultar_copropietario.em_rut.text = ""
		w_consultar_copropietario.sle_nombres.text = ""
		w_consultar_copropietario.sle_apaterno.text = ""
		w_consultar_copropietario.sle_amaterno.text = ""
	end if
end if
setnull(gi_rut)
setnull(gs_nombres)
setnull(gs_apellido_paterno)
setnull(gs_apellido_materno)
Close(w_listado_datos_copropietarios)
end event

type cb_ver_cuenta_corriente from commandbutton within w_listado_datos_copropietarios
integer x = 46
integer y = 1108
integer width = 425
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&uenta Corriente"
end type

event clicked;if il_row5 > 0 then
	gs_base 					= dw_listado.GetItemString(il_row5, "cadena_codigo")
	gs_serie 					= dw_listado.GetItemString(il_row5, "cadena_serie")
	gi_numero 				= dw_listado.GetItemNumber(il_row5, "cadena_numero")
	gi_rut 					= dw_listado.GetItemNumber(il_row5, "cliente_rut")
	gl_cod_parque_cta	= dw_listado.GetItemNumber(il_row5, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 		= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R"
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	end if
end if	

end event

type dw_listado from datawindow within w_listado_datos_copropietarios
integer x = 32
integer y = 36
integer width = 3008
integer height = 1036
integer taborder = 10
boolean titlebar = true
string title = "Listado CoPropietarios"
string dataobject = "dw_listado_copropieta_todos_rut"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer 	protesto,prorrogado,cancelado,reemplazado,sin_proceso,i
string	ls_columna,ls_opera

ls_columna						= dwo.name
IF row > 0 THEN
	il_row5						= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row5, TRUE)
	if this.dataobject = 'd_cont_resultado_busqueda_x_rut_2' then
		gs_base 					= This.GetItemString(il_row5, "cadena_codigo")
		gs_serie 					= This.GetItemString(il_row5, "cadena_serie")
		gi_numero 				= This.GetItemNumber(il_row5, "cadena_numero")
		gi_rut 					= This.GetItemNumber(il_row5, "cliente_rut")
		gl_cod_parque_cta	= this.GetItemNumber(il_row5, "cadena_cod_parque")
//		if gs_base='O' then
//			cb_beneficiarios.enabled		= true
//		elseif gs_base='C' then
//			if gs_digita='1' or gs_depto='I' then 
				cb_beneficiarios.enabled	= true
//			else
//				cb_beneficiarios.enabled	= false
//			end if
//		else
//			cb_beneficiarios.enabled		= false
//		end if
		cb_datos_clientes.enabled 			= TRUE
		cb_datos_contrato.enabled 			= TRUE
		cb_ver_cuenta_corriente.enabled 	= TRUE
		cb_datos_repacta.enabled 			= TRUE
	//	cb_mensajes.enabled 					= TRUE
		dw_2.settransobject (sqlca)
		if dw_2.retrieve(gs_serie,gi_numero,gs_base) > 0 then
			for i = 1 to dw_2.rowcount()
				if dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
					protesto ++
				elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'D' then
					prorrogado ++
				elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'C' then
					cancelado ++
				elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
					reemplazado ++
				end if
			next
			if protesto > 0 or prorrogado > 0 or cancelado > 0 or reemplazado > 0 then
				dw_1.visible = true
				dw_1.insertrow(0)
				dw_1.setitem(1,'protesto'   ,protesto)
				dw_1.setitem(1,'prorrogado' ,prorrogado)
				dw_1.setitem(1,'cancelado'  ,cancelado)
				dw_1.setitem(1,'reemplazado',reemplazado)
				dw_1.setitem(1,'sin_proceso',dw_2.rowcount() - reemplazado - cancelado - prorrogado - protesto)
				dw_1.setitem(1,'contrato'   ,gs_serie+'-'+string(gi_numero,'###,###,###,###'))
			end if
		end if
		if gs_base = 'C' then
			cb_6.enabled = false
		else
			cb_6.enabled = true
		end if
		cb_fallecidos.enabled = f_fallecido(gs_serie, gi_numero, gs_base) > 0
		cb_mensajes.enabled = f_mensajes(gi_rut) = 1
	End if
	gs_ventana	= 'w_listado_datos_copropietarios'
	f_valida_objeto()
END IF
end event

event doubleclicked;long ll_rut
if il_row5 > 0 then
	if this.dataobject <> 'd_cont_resultado_busqueda_x_rut_2' then
		w_listado_datos_copropietarios.title	= 'Listado de Contratos'
		cb_ver_cuenta_corriente.visible	= true
		cb_datos_contrato.visible			= true
		cb_datos_repacta.visible			= true
		cb_datos_clientes.visible			= true
		cb_beneficiarios.visible			= true
		cb_fallecidos.visible				= true
		cb_mensajes.visible					= true
//		cb_4.visible							= true
		cb_5.visible							= true
		cb_6.visible							= true
		cb_7.visible							= true
		cb_volver.visible						= true
		cb_cerrar.visible						= false
//		if gs_base = 'O' then
			il_fila		= row
			gs_serie 	= This.GetItemString(row, "serie")
			gi_numero 	= This.GetItemNumber(row, "nro_oferta")
			gs_base		= this.getitemString(row, "cadena_codigo")
			gl_cod_parque_cta	= this.GetItemNumber(row, "cadena_cod_parque")
			select cadena.rut 
			into :gi_rut 
			from cadena 
			where cadena.codigo=:gs_base and cadena.serie=:gs_serie and cadena.numero= :gi_numero;

//		elseif gs_base = 'C' then
//			gs_serie 	= This.GetItemString(row, "serie")
//			gi_numero 	= This.GetItemNumber(row, "numero")
//			select cadena.rut 
//			into :gi_rut 
//			from cadena 
//			where cadena.codigo=:gs_base and cadena.serie=:gs_serie and cadena.numero= :gi_numero;
//		end if
		dw_listado.DataObject = 'd_cont_resultado_busqueda_x_rut_2'
		dw_listado.SetTransObject(SQLCA)
		if dw_listado.Retrieve(gi_rut) > 0 then
			this.scrolltorow(1)
		end if
	end if
end if
end event

event rowfocuschanged;integer protesto,prorrogado,cancelado,reemplazado,sin_proceso,i
string	ls_columna,ls_opera

IF this.getrow() > 0 THEN
	il_row5					= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row5, TRUE)
	if this.dataobject = 'd_cont_resultado_busqueda_x_rut_2' then
		gs_base 				= This.GetItemString(il_row5, "cadena_codigo")
		gs_serie 			= This.GetItemString(il_row5, "cadena_serie")
		gi_numero 			= This.GetItemNumber(il_row5, "cadena_numero")
		gi_rut 				= This.GetItemNumber(il_row5, "cliente_rut")
		gl_cod_parque_cta	= this.GetItemNumber(il_row5, "cadena_cod_parque")
//		if gs_base='O' then
//			cb_beneficiarios.enabled		= true
//		elseif gs_base='C' then
//			if gs_digita='1' or gs_depto='I' then 
				cb_beneficiarios.enabled	= true
//			else
//				cb_beneficiarios.enabled	= false
//			end if
//		else
//			cb_beneficiarios.enabled		= false
//		end if
		cb_datos_clientes.enabled 			= TRUE
		cb_datos_contrato.enabled 			= TRUE
		cb_ver_cuenta_corriente.enabled 	= TRUE
		cb_datos_repacta.enabled 			= TRUE
	//	cb_mensajes.enabled 					= TRUE
		dw_2.settransobject (sqlca)
		if dw_2.retrieve(gs_serie,gi_numero,gs_base) > 0 then
			for i = 1 to dw_2.rowcount()
				if dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
					protesto ++
				elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'D' then
					prorrogado ++
				elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'C' then
					cancelado ++
				elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
					reemplazado ++
				end if
			next
			if protesto > 0 or prorrogado > 0 or cancelado > 0 or reemplazado > 0 then
				dw_1.visible = true
				dw_1.insertrow(0)
				dw_1.setitem(1,'protesto'   ,protesto)
				dw_1.setitem(1,'prorrogado' ,prorrogado)
				dw_1.setitem(1,'cancelado'  ,cancelado)
				dw_1.setitem(1,'reemplazado',reemplazado)
				dw_1.setitem(1,'sin_proceso',dw_2.rowcount() - reemplazado - cancelado - prorrogado - protesto)
				dw_1.setitem(1,'contrato'   ,gs_serie+'-'+string(gi_numero,'###,###,###,###'))
			end if
		end if
		if gs_base = 'C' then
			cb_6.enabled = false
		else
			cb_6.enabled = true
		end if
		cb_fallecidos.enabled = f_fallecido(gs_serie, gi_numero, gs_base) > 0
		cb_mensajes.enabled = f_mensajes(gi_rut) = 1
	End if
	gs_ventana	= 'w_listado_datos_copropietarios'
	f_valida_objeto()
END IF
end event

type gb_1 from groupbox within w_listado_datos_copropietarios
integer x = 2272
integer y = 1204
integer width = 512
integer height = 176
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

