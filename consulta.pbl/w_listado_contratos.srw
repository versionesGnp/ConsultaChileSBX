forward
global type w_listado_contratos from window
end type
type cb_ben_seg_fun from commandbutton within w_listado_contratos
end type
type cb_10 from commandbutton within w_listado_contratos
end type
type cb_9 from commandbutton within w_listado_contratos
end type
type cb_8 from commandbutton within w_listado_contratos
end type
type cb_ult_vol from commandbutton within w_listado_contratos
end type
type cb_herederos from commandbutton within w_listado_contratos
end type
type cb_mod_anteced from commandbutton within w_listado_contratos
end type
type dw_print from datawindow within w_listado_contratos
end type
type cb_imprimir from commandbutton within w_listado_contratos
end type
type dw_2 from datawindow within w_listado_contratos
end type
type dw_1 from datawindow within w_listado_contratos
end type
type cb_7 from commandbutton within w_listado_contratos
end type
type cb_6 from commandbutton within w_listado_contratos
end type
type cb_4 from commandbutton within w_listado_contratos
end type
type cb_3 from commandbutton within w_listado_contratos
end type
type cb_2 from commandbutton within w_listado_contratos
end type
type cb_1 from commandbutton within w_listado_contratos
end type
type cb_mensajes from commandbutton within w_listado_contratos
end type
type cb_fallecidos from commandbutton within w_listado_contratos
end type
type cb_datos_repacta from commandbutton within w_listado_contratos
end type
type cb_beneficiarios from commandbutton within w_listado_contratos
end type
type cb_datos_clientes from commandbutton within w_listado_contratos
end type
type cb_datos_contrato from commandbutton within w_listado_contratos
end type
type cb_cerrar from commandbutton within w_listado_contratos
end type
type cb_ver_cuenta_corriente from commandbutton within w_listado_contratos
end type
type gb_1 from groupbox within w_listado_contratos
end type
type cb_5 from commandbutton within w_listado_contratos
end type
type cb_asocia_contrato from commandbutton within w_listado_contratos
end type
type dw_listado from datawindow within w_listado_contratos
end type
end forward

global type w_listado_contratos from window
integer x = 462
integer y = 412
integer width = 3744
integer height = 1948
boolean titlebar = true
string title = "Resultado Consulta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_ben_seg_fun cb_ben_seg_fun
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_ult_vol cb_ult_vol
cb_herederos cb_herederos
cb_mod_anteced cb_mod_anteced
dw_print dw_print
cb_imprimir cb_imprimir
dw_2 dw_2
dw_1 dw_1
cb_7 cb_7
cb_6 cb_6
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
gb_1 gb_1
cb_5 cb_5
cb_asocia_contrato cb_asocia_contrato
dw_listado dw_listado
end type
global w_listado_contratos w_listado_contratos

type variables
Long	il_row2
end variables

forward prototypes
public subroutine wf_busqueda_x_fallecido (ref string ls_sql_new, ref string ls_sql_old)
end prototypes

public subroutine wf_busqueda_x_fallecido (ref string ls_sql_new, ref string ls_sql_old);if len(string(gi_rut)) > 0 then
ls_sql_new = ls_sql_old + '  and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and (  "FALLECIDOS"."RUT" = '+string(gi_rut)+'  )  '+&
								  ' ORDER BY  "FALLECIDOS"."AP_PATERNO" ASC,         '+&
								  '			 "FALLECIDOS"."AP_MATERNO" ASC,         '+&
								  '			 "FALLECIDOS"."NOMBRES" ASC             '
end if
if len(gs_apellido_materno) > 0 and  len(gs_apellido_paterno) > 0 and  len(gs_nombres) > 0  and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//123
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and		 "FALLECIDOS"."NOMBRES"    like '+"'"+gs_nombres+'%'+"'"+' AND  '+&
									'         "FALLECIDOS"."AP_PATERNO" like '+"'"+gs_apellido_paterno+'%'+"'"+' and  '+&
									'         "FALLECIDOS"."AP_MATERNO" like '+"'"+gs_apellido_materno+'%'+"'"+'  '+&
									' ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) > 0 and  len(gs_apellido_paterno) > 0 and  len(gs_nombres) = 0 and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//123
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."AP_PATERNO" like '+"'"+gs_apellido_paterno+'%'+"'"+' and  '+&
									'         "FALLECIDOS"."AP_MATERNO" like '+"'"+gs_apellido_materno+'%'+"'"+'  '+&
									' ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) > 0 and  len(gs_apellido_paterno) = 0 and  len(gs_nombres) > 0 and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//123
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."NOMBRES" like '+"'"+gs_nombres+'%'+"'"+' and  '+&
									'         "FALLECIDOS"."AP_MATERNO" like '+"'"+gs_apellido_materno+'%'+"'"+'  '+&
									' ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) > 0 and len(gs_apellido_paterno) = 0 and  len(gs_nombres) = 0 and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//123
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."AP_MATERNO" like '+"'"+gs_apellido_materno+'%'+"'"+'  '+&
									' ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if

if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) > 0 and  len(gs_nombres) > 0  and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//12
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and		 "FALLECIDOS"."NOMBRES"    like '+"'"+gs_nombres+'%'+"'"+' AND  '+&
									'         "FALLECIDOS"."AP_PATERNO" like '+"'"+gs_apellido_paterno+'%'+"'"+' '+&
									' ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) = 0 and  len(gs_nombres) = 0  and len(gs_sector) > 0 and len(gs_sepultura) > 0 then//4
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."SECTOR" like '+"'"+gs_sector+"'"+' '+&
									' and     "FALLECIDOS"."N_SEP" like '+"'"+gs_sepultura+'%'+"'"+'  '+&
									' ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) = 0 and  len(gs_nombres) > 0  and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//1
ls_sql_new = ls_sql_old +  '	and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and 	 "FALLECIDOS"."NOMBRES" like '+"'"+gs_nombres+'%'+"'"+' '+&
									' ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES" ASC   '
end if
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) > 0 and  len(gs_nombres) = 0  and len(gs_sector) = 0 and len(gs_sepultura) = 0 then//2
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."AP_PATERNO" like '+"'"+gs_apellido_paterno+'%'+"'"+'  '+&
									' ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if 
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) = 0 and  len(gs_nombres) = 0  and len(gs_sector) > 0 and len(gs_sepultura) = 0 then//4
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."SECTOR" like '+"'"+gs_sector+"'"+'  '+&
									' ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
									'			 "FALLECIDOS"."AP_MATERNO" ASC,   '+&
									'			 "FALLECIDOS"."NOMBRES"    ASC   '
end if
if len(gs_apellido_materno) = 0 and  len(gs_apellido_paterno) = 0 and  len(gs_nombres) = 0  and len(gs_sector) = 0 and len(gs_sepultura) > 0 then//5
ls_sql_new = ls_sql_old +  ' and ( "FALLECIDOS"."ESTADO_REG" = '+"'A'"+' ) and     "FALLECIDOS"."N_SEP" like '+"'"+gs_sepultura+'%'+"'"+'  '+&
									' ORDER BY "FALLECIDOS"."AP_PATERNO" ASC,   '+&
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

on w_listado_contratos.create
this.cb_ben_seg_fun=create cb_ben_seg_fun
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_ult_vol=create cb_ult_vol
this.cb_herederos=create cb_herederos
this.cb_mod_anteced=create cb_mod_anteced
this.dw_print=create dw_print
this.cb_imprimir=create cb_imprimir
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_7=create cb_7
this.cb_6=create cb_6
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
this.gb_1=create gb_1
this.cb_5=create cb_5
this.cb_asocia_contrato=create cb_asocia_contrato
this.dw_listado=create dw_listado
this.Control[]={this.cb_ben_seg_fun,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_ult_vol,&
this.cb_herederos,&
this.cb_mod_anteced,&
this.dw_print,&
this.cb_imprimir,&
this.dw_2,&
this.dw_1,&
this.cb_7,&
this.cb_6,&
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
this.gb_1,&
this.cb_5,&
this.cb_asocia_contrato,&
this.dw_listado}
end on

on w_listado_contratos.destroy
destroy(this.cb_ben_seg_fun)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_ult_vol)
destroy(this.cb_herederos)
destroy(this.cb_mod_anteced)
destroy(this.dw_print)
destroy(this.cb_imprimir)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_7)
destroy(this.cb_6)
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
destroy(this.gb_1)
destroy(this.cb_5)
destroy(this.cb_asocia_contrato)
destroy(this.dw_listado)
end on

event open;long il_cant_datos
STRING ls_sql_old,ls_sql_new
gf_centrar(w_listado_contratos)

gs_ventana	= 'w_listado_contratos'
f_valida_objeto()
il_row2		= 0
CHOOSE CASE gi_tipo_busqueda
	CASE 0 //Por número de contrato
		dw_listado.DataObject	= 'd_cont_resultado_busqueda_x_num'
		dw_listado.SetTransObject(SQLCA)
		dw_print.DataObject 		= 'd_cont_resultado_busqueda_x_num_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 				= dw_listado.Retrieve(rutx)
		dw_print.Retrieve(rutx)
	CASE 1 //Por RUT
		dw_listado.DataObject 	= 'd_cont_resultado_busqueda_x_rut'
		dw_listado.SetTransObject(SQLCA)
		dw_print.DataObject 		= 'd_cont_resultado_busqueda_x_rut_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 				= dw_listado.Retrieve(gi_rut)
		dw_print.Retrieve(gi_rut)
	CASE 2 //Por Apellido Paterno
		dw_listado.DataObject 	= 'd_cont_resultado_busqueda_x_apaterno'
		dw_listado.SetTransObject(SQLCA)
		dw_print.DataObject 		= 'd_cont_resultado_busqueda_x_apaterno_pri'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 				= dw_listado.Retrieve(gs_apellido_paterno)
		dw_print.Retrieve(gs_apellido_paterno)
	CASE 4 //Por Fallecidos
		dw_listado.DataObject 	= 'd_cont_resultado_busqueda_x_fallecido_1'
		dw_listado.SetTransObject(SQLCA)
		ls_sql_old 					= dw_listado.getsqlselect ()
		wf_busqueda_x_fallecido(ls_sql_new,ls_sql_old)
		dw_listado.setsqlselect (ls_sql_new)
		dw_listado.SetTransObject(SQLCA)
		il_cant_datos 				= dw_listado.Retrieve()
		if il_cant_datos>0 then
			setnull(ls_sql_new);setnull(ls_sql_old)
			// 4.2
			dw_print.DataObject 		= 'd_cont_resultado_busqueda_x_fall_1_print'
			dw_print.SetTransObject(SQLCA)
			ls_sql_old 					= dw_print.getsqlselect ()
			wf_busqueda_x_fallecido(ls_sql_new,ls_sql_old)
			dw_print.setsqlselect (ls_sql_new)
			dw_print.SetTransObject(SQLCA)
			dw_print.Retrieve()
		end if
		setnull(ls_sql_new);setnull(ls_sql_old)
   CASE 5 //Por Ofertas /Ubicacion
		dw_listado.DataObject 	= 'd_cont_resultado_busqueda_x_ub_oferta'
		dw_listado.SetTransObject(SQLCA)
		dw_print.DataObject 		= 'd_cont_resultado_busqueda_x_ub_ofe_print'
		dw_print.SetTransObject(SQLCA)
		if isnull(gs_sector) or gs_sector='' then gs_sector='%'
		if isnull(gs_sepultura) or gs_sepultura='' then gs_sepultura='%'
		if isnull(gs_area) or gs_area='' then gs_area='%'
		if isnull(gs_base_sepult) or gs_base_sepult='' then gs_base_sepult='%'
		
		il_cant_datos 				= dw_listado.Retrieve(gs_sector, gs_sepultura, gs_area,gs_base_sepult)
		dw_print.Retrieve(gs_sector, gs_sepultura, gs_area, gs_base_sepult)
	CASE 6 //Por Contratos /Ubicacion
		dw_listado.DataObject 	= 'd_cont_resultado_busqueda_x_ub_contr'
		dw_listado.SetTransObject(SQLCA)
		dw_print.DataObject 		= 'd_cont_resultado_busqueda_x_ub_con_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 				= dw_listado.Retrieve(gs_sector, gs_sepultura,gs_area)
		dw_print.Retrieve(gs_sector, gs_sepultura,gs_area)
	CASE 7 //Por Contratos /numero tecnico
		dw_listado.DataObject 	= 'd_cont_resultado_busqueda_x_ub_tecnico'
		dw_listado.SetTransObject(SQLCA)
		dw_print.DataObject 		= 'd_cont_resultado_busqueda_x_ub_tec_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 				= dw_listado.Retrieve(gi_tecnico)	
		dw_print.Retrieve(gi_tecnico)	
	CASE 8 //Por Contratos /numero contrato todos
		dw_listado.DataObject 	= 'd_cont_resultado_busqueda_x_numero'
		dw_listado.SetTransObject(SQLCA)
		dw_print.DataObject 		= 'd_cont_resultado_busqueda_x_numero_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 				= dw_listado.Retrieve(gi_numero)			
		dw_print.Retrieve(gi_numero)
	CASE 9 // POR SECTOR
		dw_listado.DataObject 	= 'd_cont_resultado_busqueda_x_ub_c_o'
		dw_listado.SetTransObject(SQLCA)
		dw_print.DataObject 		= 'd_cont_resultado_busqueda_x_ub_c_o_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 				= dw_listado.Retrieve(gs_sector)			
		dw_print.Retrieve(gs_sector)	
END CHOOSE
if gs_depto='I' or gs_depto='O' or gs_depto='P' or gs_depto='G' or gs_depto='S' then
	cb_ult_vol.enabled	= true
else
	cb_ult_vol.enabled	= false
end if
if (gs_depto='R') and (gi_tipo_busqueda=1 or gi_tipo_busqueda=2 or gi_tipo_busqueda=8) then
	dw_listado.SETfilter('vista_buscar_ejecutivos_ctto_cod_sup = "'+gs_user+'"')
	dw_listado.filter()
end if
if (gs_depto='B') and (gi_tipo_busqueda=1 or gi_tipo_busqueda=2 or gi_tipo_busqueda=8) then
	dw_listado.SETfilter('vista_buscar_ejecutivos_ctto_cod_jefe = "'+gs_user+'"')
	dw_listado.filter()
end if
if (gs_depto='K') and (gi_tipo_busqueda=1 or gi_tipo_busqueda=2 or gi_tipo_busqueda=8) then
	dw_listado.SETfilter('vista_buscar_ejecutivos_ctto_cod_age = "'+gs_user+'"')
	dw_listado.filter()
end if
IF il_cant_datos = 0 THEN
	MessageBox("Consulta", "No encontraron datos asociados a su consulta.")
	Close(w_listado_contratos)
END IF
end event

event close;if isvalid(w_plano_sector_parque) then w_plano_sector_parque.dw_plano_sector_parque.enabled	= true
end event

type cb_ben_seg_fun from commandbutton within w_listado_contratos
integer x = 2725
integer y = 1708
integer width = 498
integer height = 96
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Benef.Seg.Funerario"
end type

event clicked;String		ls_string
if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	ls_string									= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if not isnull(gs_base) and gi_numero>0 then
		if isvalid(w_ingresar_benef_seguro_funeraria2) then close(w_ingresar_benef_seguro_funeraria2)
		openwithparm(w_ingresar_benef_seguro_funeraria2,ls_string)
	end if
end if

end event

type cb_10 from commandbutton within w_listado_contratos
integer x = 2053
integer y = 1708
integer width = 325
integer height = 96
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Doc. General"
end type

event clicked;string	ls_dv,ls_base,ls_serie,ls_ctto
long ret,ll_res,ll_rut,ll_tipo_dctto,ll_parque,ll_res1,ll_res2
double	li_numero

if il_row2>0 then 
	ll_res					= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ll_rut				= dw_listado.GetItemNumber(il_row2, 'cliente_rut')
		ls_dv				= dw_listado.GetItemstring(il_row2, 'cliente_dv')
		ll_parque			= dw_listado.GetItemNumber(il_row2, 'cadena_cod_parque')
		ls_base 			= dw_listado.GetItemString(il_row2, "cadena_codigo")
		ls_serie 			= dw_listado.GetItemString(il_row2, "cadena_serie")
		li_numero 		= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	//	ls_ctto			= ls_base+ls_serie+string(li_numero)
		ls_ctto			= ls_serie+string(li_numero)
		
		ll_res1	= messagebox("Pregunta","¿Desea Consultar Contrato Digitalizados?",Exclamation!,YesNo!,2) 
		if ll_res1	= 1 then
			Inet  iinet_base
			ret = GetContextService("Internet", iinet_base)
			if ret = -1 then
				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
				return
			end if
			if ll_parque > 0 then
				ret = iinet_base.HyperlinkToURL("http://10.0.22.71:8091/api/documentos/promesa/general?numero="+string(li_numero)+'&parque='+string(ll_parque) )	//	QA
//				ret = iinet_base.HyperlinkToURL("http://10.0.22.72:8090/api/documentos?base="+ls_base+'&serie='+ls_serie+'&numero='+string(li_numero)+'&parque='+string(ll_parque) )	PRODUCCION
			end if
			if ret = -1 then
				messagebox('No Existe','No existe Documentación Contrato '+ls_base+'-'+ls_serie+'-'+string(li_numero),stopsign!)
				return
			end if
		end if
	end if
end if	
end event

type cb_9 from commandbutton within w_listado_contratos
integer x = 2382
integer y = 1708
integer width = 338
integer height = 96
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Doc. Contrato"
end type

event clicked;string	ls_dv,ls_base,ls_serie,ls_ctto
long ret,ll_res,ll_rut,ll_tipo_dctto,ll_parque,ll_res1,ll_res2
double	li_numero

if il_row2>0 then 
	ll_res					= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ll_rut				= dw_listado.GetItemNumber(il_row2, 'cliente_rut')
		ls_dv				= dw_listado.GetItemstring(il_row2, 'cliente_dv')
		ll_parque			= dw_listado.GetItemNumber(il_row2, 'cadena_cod_parque')
		ls_base 			= dw_listado.GetItemString(il_row2, "cadena_codigo")
		ls_serie 			= dw_listado.GetItemString(il_row2, "cadena_serie")
		li_numero 		= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	//	ls_ctto			= ls_base+ls_serie+string(li_numero)
		ls_ctto			= ls_serie+string(li_numero)
		
		ll_res1	= messagebox("Pregunta","¿Desea Consultar Contrato Digitalizados?",Exclamation!,YesNo!,2) 
		if ll_res1	= 1 then
			Inet  iinet_base
			ret = GetContextService("Internet", iinet_base)
			if ret = -1 then
				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
				return
			end if
			if ll_parque > 0 then
//	http://10.0.22.56:8090/api/documentos?base=A&serie=A&numero=1&parque=1
				ret = iinet_base.HyperlinkToURL("http://10.0.22.71:8091/api/documentos?base="+ls_base+'&serie='+ls_serie+'&numero='+string(li_numero)+'&parque='+string(ll_parque) )	//	QA
//				ret = iinet_base.HyperlinkToURL("http://10.0.22.72:8090/api/documentos?base="+ls_base+'&serie='+ls_serie+'&numero='+string(li_numero)+'&parque='+string(ll_parque) )	PRODUCCION
			end if
			if ret = -1 then
				messagebox('No Existe','No existe Documentación Contrato '+ls_base+'-'+ls_serie+'-'+string(li_numero),stopsign!)
				return
			end if
		end if
	end if
end if	
end event

type cb_8 from commandbutton within w_listado_contratos
integer x = 1381
integer y = 1708
integer width = 421
integer height = 96
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Doc. Digitalizados"
end type

event clicked;string	ls_dv,ls_base,ls_serie,ls_ctto
long ret,ll_res,ll_rut,ll_tipo_dctto,ll_parque,ll_res1,ll_res2
double	li_numero

if il_row2>0 then 
	ll_res					= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ll_rut				= dw_listado.GetItemNumber(il_row2, 'cliente_rut')
		ls_dv				= dw_listado.GetItemstring(il_row2, 'cliente_dv')
		ll_parque			= dw_listado.GetItemNumber(il_row2, 'cadena_cod_parque')
		ls_base 			= dw_listado.GetItemString(il_row2, "cadena_codigo")
		ls_serie 			= dw_listado.GetItemString(il_row2, "cadena_serie")
		li_numero 		= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	//	ls_ctto			= ls_base+ls_serie+string(li_numero)
		ls_ctto			= ls_serie+string(li_numero)
		
		ll_res1	= messagebox("Pregunta","¿Desea Consultar Documentos Digitalizados?",Exclamation!,YesNo!,2) 
		if ll_res1	= 1 then
			Inet  iinet_base
			ret = GetContextService("Internet", iinet_base)
			if ret = -1 then
				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
				return
			end if
			if ll_parque = 11 then
				ret = iinet_base.HyperlinkToURL("http://intra2.nuestrosparques.cl/documentos/getcontratos_foresta.php?rut="+string(ll_rut)+'-'+ls_dv+'&parque='+string(ll_parque)+'&ctto='+ls_ctto)
			else
				ret = iinet_base.HyperlinkToURL("http://intra2.nuestrosparques.cl/documentos/getcontratos.php?rut="+string(ll_rut)+'-'+ls_dv+'&parque='+string(ll_parque)+'&ctto='+ls_ctto)
			end if
			if ret = -1 then
				messagebox('No Existe','No existe Documentación Digitalizada',stopsign!)
				return
			end if
		end if
	end if
end if	
end event

type cb_ult_vol from commandbutton within w_listado_contratos
integer x = 2848
integer y = 1544
integer width = 366
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ultima &Voluntad"
end type

event clicked;String	ls_string

if gi_numero > 0 and gi_rut > 0 then
	ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)+'~t'+gs_apellido_paterno+'~t'+gs_apellido_materno+'~t'+gs_nombres+'~t'+gs_dv+'~t'+string(gl_cod_parque_cta)
	if isvalid(w_ficha_ultima_voluntad) then close(w_ficha_ultima_voluntad)
	openwithparm(w_ficha_ultima_voluntad,ls_string)
end if
end event

type cb_herederos from commandbutton within w_listado_contratos
integer x = 1632
integer y = 1544
integer width = 261
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Herederos"
end type

event clicked;if isvalid(w_herederos_promesas) then close(w_herederos_promesas)
open(w_herederos_promesas)
end event

type cb_mod_anteced from commandbutton within w_listado_contratos
integer x = 2149
integer y = 1544
integer width = 453
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Mod. An&tecedentes"
end type

event clicked;string	ls_string,ls_estado,ls_tipo_sol='12',ls_est_mod,ls_texto,ls_estado_reg
long		ll_count
if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		if il_row2 > 0 and gi_rut>0 then 
			SELECT	"CLIENTE"."ESTADO_TITULAR"  
			INTO 		:ls_estado  
			FROM 		"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :gi_rut   
			using		sqlca	  ;
			
			SELECT max("SOL_MOD_ANTECE"."CORRELATIVO")  
			INTO :ll_count  
			FROM "SOL_MOD_ANTECE"  
			WHERE "SOL_MOD_ANTECE"."RUT" = :gi_rut 
			USING		sqlca;
			if ll_count>0 and not isnull(ll_count) then
				ls_est_mod	= 'M'
				SELECT	 "SOL_ESTATUS"."ESTADO_REG"
				INTO 		 :ls_estado_reg  
				FROM 	 "SOL_ESTATUS"  
				WHERE  ( "SOL_ESTATUS"."NUMERO" = :gi_rut ) AND  
						   ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '12' )   
				Using		sqlca;
				if sqlca.sqlcode=100 then
					ls_texto	= 'Solicitud Cambio Antecedentes por Operaciones'+string(date(gdt_fec_sistema),"dd/mm/yyyy")
					INSERT INTO "SOL_ESTATUS"  
								( "BASE",  	"SERIE",   "NUMERO",   "CORRELATIVO",   "CODIGO_SOLICITUD",   	"OBSERVACION",  "ESTADO_REG",   "RUT_CLIENTE" )  
					VALUES 	( 'W',   		'W',   	 	 :gi_rut,    		:ll_count,   	 		'12',   				  		:ls_texto,  			'A',   			 		:gi_rut )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
			else
				ls_est_mod	= 'N'
				ll_count		= 1
			end if
			ls_string	= 'W'+'~t'+'W'+'~t'+string(gi_rut)+'~t'+ls_tipo_sol+'~t'+string(ll_count)+'~t'+ls_est_mod+'~t'+ls_estado+'~t'+string(date("00/00/0000"))
			if isvalid(w_mantencion_fromulario_solicitudes) then close(w_mantencion_fromulario_solicitudes)
			openwithparm(w_mantencion_fromulario_solicitudes,ls_string)
		//	open(w_modificar_antecedentes_cliente)
		else
			messagebox("Adveretencia","Ud. debe seleccionar un Contrato")
		end if
	end if
end if
end event

type dw_print from datawindow within w_listado_contratos
boolean visible = false
integer x = 2542
integer y = 1948
integer width = 174
integer height = 120
string title = "none"
string dataobject = "d_cont_resultado_busqueda_x_ub_con_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_listado_contratos
boolean visible = false
integer x = 3282
integer y = 1896
integer width = 219
integer height = 96
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_listado.rowcount() > 0 then
	dw_print.object.t_titulo.text	= gs_conexion
	dw_print.print()
end if
end event

type dw_2 from datawindow within w_listado_contratos
boolean visible = false
integer x = 2761
integer y = 1948
integer width = 174
integer height = 120
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

type dw_1 from datawindow within w_listado_contratos
boolean visible = false
integer x = 891
integer y = 280
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

type cb_7 from commandbutton within w_listado_contratos
integer x = 997
integer y = 1708
integer width = 379
integer height = 96
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta Ma&ntención"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 						= false
		if isvalid(w_boletas_cuotas) then close(w_boletas_cuotas)
		open(w_boletas_cuotas)
	end if
end if
end event

type cb_6 from commandbutton within w_listado_contratos
integer x = 640
integer y = 1708
integer width = 352
integer height = 96
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuo&tas Crédito"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 						= false
		if isvalid(w_repacta) then close(w_repacta)
		open(w_repacta)
	end if
end if
end event

type cb_4 from commandbutton within w_listado_contratos
integer x = 41
integer y = 1708
integer width = 247
integer height = 96
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Por &Rut"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 and gi_rut>0 then
		dw_1.visible 						= false
		gi_tipo_busqueda 					= 1
		if il_row2 > 0 then 
			gs_base_aux					= gs_base
			gs_serie_aux					= gs_serie
			gl_numero_aux					= gi_numero
			if isvalid(w_listado_contratos_rut) then close(w_listado_contratos_rut)
			open(w_listado_contratos_rut)
		else
			messagebox("Adveretencia","Ud. debe seleccionar un Contrato")
		end if
	end if
end if
end event

type cb_3 from commandbutton within w_listado_contratos
integer x = 3474
integer y = 1708
integer width = 169
integer height = 96
integer taborder = 240
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
dw_1.visible = false
setnull (nulo)
dw_listado.SETfilter(NULO)
dw_listado.filter()
dw_print.filter()
end event

type cb_2 from commandbutton within w_listado_contratos
boolean visible = false
integer x = 3058
integer y = 1896
integer width = 219
integer height = 96
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;dw_1.visible = false
datawindow dw_paso
dw_paso	= dw_listado
if dw_listado.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_1 from commandbutton within w_listado_contratos
integer x = 3301
integer y = 1708
integer width = 169
integer height = 96
integer taborder = 230
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_listado.rowcount() > 0 then
	dw_1.visible 	= false
	setnull (nulo)
	dw_listado.SETSORT(NULO)
	dw_listado.SORT()
	dw_print.sort()
end if
end event

type cb_mensajes from commandbutton within w_listado_contratos
integer x = 2606
integer y = 1544
integer width = 238
integer height = 96
integer taborder = 110
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
if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 						= false
		if gi_rut>0 then 
			if isvalid(w_aviso_mensajes) then close(w_aviso_mensajes)
			SELECT 	 COUNT("MENSAJES"."FECHA_CREACION")  
			INTO 		 :ll_count  
			FROM 	 "MENSAJES"  
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
				FROM 	"MENSAJES"  
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

type cb_fallecidos from commandbutton within w_listado_contratos
integer x = 1897
integer y = 1544
integer width = 247
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Fallecidos"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible = false
		if isvalid(w_listado_fallecidos) then close(w_listado_fallecidos)
		Open(w_listado_fallecidos)
	end if
end if
end event

type cb_datos_repacta from commandbutton within w_listado_contratos
event clicked pbm_bnclicked
integer x = 608
integer y = 1544
integer width = 366
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Repactaciones"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 						= false
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

type cb_beneficiarios from commandbutton within w_listado_contratos
integer x = 1307
integer y = 1544
integer width = 320
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Beneficiarios"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 						= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_listado_beneficiarios) then close(w_listado_beneficiarios)
				Open(w_listado_beneficiarios)
			CASE "C" // ISACRUZ
				if isvalid(w_listado_beneficiarios2) then close(w_listado_beneficiarios2)
				Open(w_listado_beneficiarios2)
			CASE ELSE
				messagebox("Advertencia","Solo Promesas y Contrato IsaCruz tienen Beneficiarios")
		END CHOOSE
	end if
end if
end event

type cb_datos_clientes from commandbutton within w_listado_contratos
integer x = 978
integer y = 1544
integer width = 325
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Datos Cliente"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 and gi_rut>0 then
		dw_1.visible 						= false
		if isvalid(w_datos_cliente) then close(w_datos_cliente)
		Open(w_datos_cliente)
	end if
end if
end event

type cb_datos_contrato from commandbutton within w_listado_contratos
integer x = 375
integer y = 1544
integer width = 229
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&ontrato"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 						= false
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
			CASE "F","G","V" // Anexo Funeraria
				if isvalid(w_datos_contrato_funeraria) then close(w_datos_contrato_funeraria)
				Open(w_datos_contrato_funeraria)
		END CHOOSE
	end if
end if

end event

type cb_cerrar from commandbutton within w_listado_contratos
integer x = 3415
integer y = 1544
integer width = 261
integer height = 96
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;IF gi_tipo_busqueda = 4 THEN
	if isvalid(w_consultar_x_fallecido) then
		w_consultar_x_fallecido.em_rut.text 				= ""
		w_consultar_x_fallecido.sle_nombres.text 			= ""
		w_consultar_x_fallecido.sle_apaterno.text 		= ""
		w_consultar_x_fallecido.sle_amaterno.text 		= ""
		w_consultar_x_fallecido.ddlb_sector.text 			= ""
	end if
ELSE
	IF gi_tipo_busqueda = 5 OR gi_tipo_busqueda = 6 THEN
		if isvalid(w_consultar_x_sector) then
			w_consultar_x_sector.ddlb_sector.text 			= ""
			w_consultar_x_sector.sle_sepultura.text 		= ""
		end if
	ELSE
		if isvalid(w_consultar_contato) then
			w_consultar_contato.sle_rut.text 				= ""
			w_consultar_contato.sle_numero_contrato.text = ""
			w_consultar_contato.sle_serie.text 				= ""
		end if
	END IF
END IF
if isvalid(w_consultar_contato) then w_consultar_contato.sle_numero.text = ""
if isvalid(w_listado_contratos) then rutx	= 0
Close(w_listado_contratos)
end event

type cb_ver_cuenta_corriente from commandbutton within w_listado_contratos
integer x = 41
integer y = 1544
integer width = 329
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&ta Corriente"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible						= false
		CHOOSE CASE gs_base
			CASE "O", "U","M"	// Oferta
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
			CASE "F","G","V"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				Open(w_cuenta_corriente_funeraria)
		END CHOOSE
	end if
end if
end event

type gb_1 from groupbox within w_listado_contratos
integer x = 3273
integer y = 1644
integer width = 393
integer height = 188
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Utilitarios"
end type

type cb_5 from commandbutton within w_listado_contratos
integer x = 1806
integer y = 1708
integer width = 242
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Dctos"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta						= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible = false
		if isvalid(w_VER_CHEQUES) then close(w_VER_CHEQUES)
		Open(w_VER_CHEQUES)
	end if
end if
end event

type cb_asocia_contrato from commandbutton within w_listado_contratos
integer x = 293
integer y = 1708
integer width = 343
integer height = 96
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asociar &x Ctto"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible = false
		if il_row2 > 0 then 
			if isvalid(w_listado_contratos_por_todas_las_tablas) then close(w_listado_contratos_por_todas_las_tablas)
			open(w_listado_contratos_por_todas_las_tablas)
		else
			messagebox("Adveretencia","Ud. debe seleccionar un Contrato")
		end if
	end if
end if
end event

type dw_listado from datawindow within w_listado_contratos
integer x = 41
integer y = 36
integer width = 3634
integer height = 1472
integer taborder = 10
boolean titlebar = true
string title = "Listado de Contratos"
string dataobject = "d_cont_resultado_busqueda_x_numero"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long	 	protesto,prorrogado,cancelado,reemplazado,sin_proceso,i,ll_count_heredero
String	ls_opera

IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	il_row2									= row
	gs_base 									= This.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= This.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= This.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= This.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= This.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= This.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= This.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= This.GetItemString(il_row2, "cliente_dv")
	gs_estado								= this.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= this.GetItemNumber(il_row2, "cadena_cod_parque")
	if gs_base='A' or gs_base='L' or gs_base='O' or gs_base='U' then
		cb_9.enabled						= true
		if gs_base='O' then
			cb_10.enabled					= true
			cb_10.visible					= true
		else
			cb_10.visible					= false
		end if
	else
		cb_9.enabled						= false
		cb_10.visible						= false
	end if
	cb_datos_clientes.enabled 			= TRUE
	cb_datos_contrato.enabled 			= TRUE
	cb_ver_cuenta_corriente.enabled 	= TRUE
	cb_datos_repacta.enabled 			= TRUE
	if gs_base='O' or gs_base='C' or gs_base='U' then
		cb_ult_vol.enabled					= true
	else
		cb_ult_vol.enabled					= false
	end if
	cb_beneficiarios.enabled				= true
	if gs_solicitudes='1' or gs_solicitudes='2' or gs_solicitudes='3' then	//operaciones 1/2/3
		cb_mod_anteced.enabled		= true
	else
		cb_mod_anteced.enabled		= false
	end if
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
			dw_1.visible 		= true
			dw_1.insertrow(0)
			dw_1.setitem(1,'protesto'   ,protesto)
			dw_1.setitem(1,'prorrogado' ,prorrogado)
			dw_1.setitem(1,'cancelado'  ,cancelado)
			dw_1.setitem(1,'reemplazado',reemplazado)
			dw_1.setitem(1,'sin_proceso',dw_2.rowcount() - reemplazado - cancelado - prorrogado - protesto)
			dw_1.setitem(1,'contrato',gs_serie+'-'+string(gi_numero,'###,###,###,###'))
		end if
	end if
	if gs_base = 'C' then
		cb_6.enabled 			= false
	else
		cb_6.enabled 			= true
	end if
	gs_ventana					= 'w_listado_contratos'
	f_valida_objeto()
	cb_fallecidos.enabled		= f_fallecido(gs_serie, gi_numero, gs_base) > 0
	cb_mensajes.enabled 	= f_mensajes(gi_rut) = 1
	SELECT	Count("SOL_COPROP"."BASE")
	INTO		:ll_count_heredero
	FROM 		"SOL_CLIENTE",	"SOL_COPROP"  
	WHERE  ( "SOL_COPROP"."BASE" = "SOL_CLIENTE"."BASE" ) and  
			 ( "SOL_COPROP"."SERIE" = "SOL_CLIENTE"."SERIE" ) and  
			 ( "SOL_COPROP"."NUMERO" = "SOL_CLIENTE"."NUMERO" ) and  
			 ( "SOL_COPROP"."RUT_CLIENTE" = "SOL_CLIENTE"."RUT_CLIENTE_ORI" ) and  
			 (("SOL_COPROP"."BASE" = :gs_base ) AND  
			 ( "SOL_COPROP"."SERIE" = :gs_serie ) AND  
			 ( "SOL_COPROP"."NUMERO" = :gi_numero ) AND  
			 ( "SOL_COPROP"."ESTADO_A_N" = 'N' ) AND  
			 ( "SOL_CLIENTE"."CORRELATIVO" = (	SELECT 	MAX("SOL_CLIENTE"."CORRELATIVO") 
			 												FROM 		"SOL_CLIENTE", "SOL_COPROP" 
															WHERE  ( "SOL_CLIENTE"."BASE" = "SOL_COPROP"."BASE" ) and 
																	 ( "SOL_CLIENTE"."SERIE" = "SOL_COPROP"."SERIE" ) and 
																	 ( "SOL_CLIENTE"."NUMERO" = "SOL_COPROP"."NUMERO" ) and 
																	 ( "SOL_CLIENTE"."RUT_CLIENTE_ORI" = "SOL_COPROP"."RUT_CLIENTE" ) and 
																	 ( ( "SOL_CLIENTE"."BASE" = :gs_base ) AND 
																	 ( "SOL_CLIENTE"."SERIE" = :gs_serie ) AND 
																	 ( "SOL_CLIENTE"."NUMERO" = :gi_numero ) AND 
																	 ( "SOL_COPROP"."ESTADO_A_N" = 'N' ) ) ) ) )  
	USING		sqlca;
	if isnull(ll_count_heredero) then ll_count_heredero=0
	if ll_count_heredero > 0 then
		cb_herederos.enabled	= true
	else
		cb_herederos.enabled	= false
	end if
END IF
end event

event doubleclicked;if gs_base='A' or gs_base='L' then
	cb_9.enabled						= true
else
	cb_9.enabled						= false
end if
IF row >0 AND This.DataObject = 'd_cont_resultado_busqueda_x_fallecido' THEN
	
	gi_llave_f = This.GetItemNumber(row, "fallecidos_llave")
	if isvalid(w_datos_fallecimiento) then close(w_datos_fallecimiento)
	Open(w_datos_fallecimiento)

END IF

end event

event rowfocuschanged;Long	 	protesto,prorrogado,cancelado,reemplazado,sin_proceso,i,ll_count_heredero
String	ls_opera

IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	il_row2									= this.getrow()
	gs_base 									= This.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= This.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= This.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= This.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= This.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= This.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= This.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= This.GetItemString(il_row2, "cliente_dv")
	gs_estado								= this.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= this.GetItemNumber(il_row2, "cadena_cod_parque")
	if gs_base='A' or gs_base='L' or gs_base='O' or gs_base='U' then
		cb_9.enabled						= true
		if gs_base='O' then
			cb_10.enabled					= true
			cb_10.visible					= true
		else
			cb_10.visible					= false
		end if
	else
		cb_9.enabled						= false
		cb_10.visible						= false
	end if
	cb_datos_clientes.enabled 			= TRUE
	cb_datos_contrato.enabled 			= TRUE
	cb_ver_cuenta_corriente.enabled 	= TRUE
	cb_datos_repacta.enabled 			= TRUE
	if gs_base='O' or gs_base='C' or gs_base='U' then
		cb_ult_vol.enabled					= true
	else
		cb_ult_vol.enabled					= false
	end if
	cb_beneficiarios.enabled				= true
	if gs_solicitudes='1' or gs_solicitudes='2' or gs_solicitudes='3' then	//operaciones 1/2/3
		cb_mod_anteced.enabled		= true
	else
		cb_mod_anteced.enabled		= false
	end if
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
			dw_1.visible 		= true
			dw_1.insertrow(0)
			dw_1.setitem(1,'protesto'   ,protesto)
			dw_1.setitem(1,'prorrogado' ,prorrogado)
			dw_1.setitem(1,'cancelado'  ,cancelado)
			dw_1.setitem(1,'reemplazado',reemplazado)
			dw_1.setitem(1,'sin_proceso',dw_2.rowcount() - reemplazado - cancelado - prorrogado - protesto)
			dw_1.setitem(1,'contrato',gs_serie+'-'+string(gi_numero,'###,###,###,###'))
		end if
	end if
	if gs_base = 'C' then
		cb_6.enabled 			= false
	else
		cb_6.enabled 			= true
	end if
	gs_ventana					= 'w_listado_contratos'
	f_valida_objeto()
	cb_fallecidos.enabled		= f_fallecido(gs_serie, gi_numero, gs_base) > 0
	cb_mensajes.enabled 	= f_mensajes(gi_rut) = 1
	SELECT	Count("SOL_COPROP"."BASE")
	INTO		:ll_count_heredero
	FROM 		"SOL_CLIENTE",	"SOL_COPROP"  
	WHERE  ( "SOL_COPROP"."BASE" = "SOL_CLIENTE"."BASE" ) and  
			 ( "SOL_COPROP"."SERIE" = "SOL_CLIENTE"."SERIE" ) and  
			 ( "SOL_COPROP"."NUMERO" = "SOL_CLIENTE"."NUMERO" ) and  
			 ( "SOL_COPROP"."RUT_CLIENTE" = "SOL_CLIENTE"."RUT_CLIENTE_ORI" ) and  
			 (("SOL_COPROP"."BASE" = :gs_base ) AND  
			 ( "SOL_COPROP"."SERIE" = :gs_serie ) AND  
			 ( "SOL_COPROP"."NUMERO" = :gi_numero ) AND  
			 ( "SOL_COPROP"."ESTADO_A_N" = 'N' ) AND  
			 ( "SOL_CLIENTE"."CORRELATIVO" = (	SELECT 	MAX("SOL_CLIENTE"."CORRELATIVO") 
			 												FROM 		"SOL_CLIENTE", "SOL_COPROP" 
															WHERE  ( "SOL_CLIENTE"."BASE" = "SOL_COPROP"."BASE" ) and 
																	 ( "SOL_CLIENTE"."SERIE" = "SOL_COPROP"."SERIE" ) and 
																	 ( "SOL_CLIENTE"."NUMERO" = "SOL_COPROP"."NUMERO" ) and 
																	 ( "SOL_CLIENTE"."RUT_CLIENTE_ORI" = "SOL_COPROP"."RUT_CLIENTE" ) and 
																	 ( ( "SOL_CLIENTE"."BASE" = :gs_base ) AND 
																	 ( "SOL_CLIENTE"."SERIE" = :gs_serie ) AND 
																	 ( "SOL_CLIENTE"."NUMERO" = :gi_numero ) AND 
																	 ( "SOL_COPROP"."ESTADO_A_N" = 'N' ) ) ) ) )  
	USING		sqlca;
	if isnull(ll_count_heredero) then ll_count_heredero=0
	if ll_count_heredero > 0 then
		cb_herederos.enabled	= true
	else
		cb_herederos.enabled	= false
	end if
END IF

end event

