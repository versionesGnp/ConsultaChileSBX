forward
global type w_grabar_lista_gestion from window
end type
type dw_archivo from datawindow within w_grabar_lista_gestion
end type
type st_texto from statictext within w_grabar_lista_gestion
end type
type cb_exportar from commandbutton within w_grabar_lista_gestion
end type
type cb_cerrar from commandbutton within w_grabar_lista_gestion
end type
type cb_grabar from commandbutton within w_grabar_lista_gestion
end type
type dw_dato from datawindow within w_grabar_lista_gestion
end type
end forward

global type w_grabar_lista_gestion from window
integer width = 1952
integer height = 1236
boolean titlebar = true
string title = "Grabar Lista Gestión"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_archivo dw_archivo
st_texto st_texto
cb_exportar cb_exportar
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_dato dw_dato
end type
global w_grabar_lista_gestion w_grabar_lista_gestion

type variables
String	is_personal_interno
end variables

on w_grabar_lista_gestion.create
this.dw_archivo=create dw_archivo
this.st_texto=create st_texto
this.cb_exportar=create cb_exportar
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_dato=create dw_dato
this.Control[]={this.dw_archivo,&
this.st_texto,&
this.cb_exportar,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_dato}
end on

on w_grabar_lista_gestion.destroy
destroy(this.dw_archivo)
destroy(this.st_texto)
destroy(this.cb_exportar)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_dato)
end on

event open;string	ls_descrip
Long	ll_new,ll_cuotas
Date	ld_fecha,ldt_fec_prox_3_meses

gf_centrar(w_grabar_lista_gestion)
dw_archivo.settransobject(sqlca)
st_texto.text				= ''
ld_fecha					= date(gdt_fec_sistema)
CONNECT USING Trans_1;
CONNECT USING Trans_2;
dw_dato.settransobject(sqlca)
cb_exportar.enabled	= false
ll_new					= dw_dato.insertrow(0)
dw_dato.scrolltorow(ll_new)
dw_dato.setitem(ll_new,'usuario',gs_user)
dw_dato.setitem(ll_new,'fecha',ld_fecha)
dw_dato.setitem(ll_new,'estado','P')
ll_cuotas					= long(w_general_cobranza_telefonica.ddplb_permanencia.text)
DECLARE sp_prox_3_meses PROCEDURE FOR sp_calcular_3_meses( :ld_fecha, :ll_cuotas );
EXECUTE sp_prox_3_meses;
if sqlca.sqlcode=0 then
	fetch sp_prox_3_meses into :ldt_fec_prox_3_meses ;
	close sp_prox_3_meses;
end if

SELECT	"GESTION_PORCE_COMIS"."DESCRIPCION"  
INTO 		:ls_descrip  
FROM 	"GESTION_PORCE_COMIS"  
WHERE	( "GESTION_PORCE_COMIS"."CARTERA_COBRANZA" = :gs_cartera ) AND  
        		( "GESTION_PORCE_COMIS"."INDICE_CARTERA" = :gl_ind_cart ) AND  
         	( "GESTION_PORCE_COMIS"."ESTADO" = 'V' )
USING	sqlca;
if isnull(ls_descrip) then ls_descrip='' 
dw_dato.setitem(ll_new,'fecha_termino_asignacion',ldt_fec_prox_3_meses)
dw_dato.setitem(ll_new,'meses_permanencia',ll_cuotas)
dw_dato.setitem(ll_new,'cartera_cobranza',gs_cartera)
dw_dato.setitem(ll_new,'indice_cartera',gl_ind_cart)
dw_dato.object.t_descrip.text						= ls_descrip
dw_dato.accepttext()

end event

event close;if isvalid(w_general_cobranza_telefonica) then w_general_cobranza_telefonica.dw_lista.setfocus()
DISCONNECT USING Trans_1;
end event

type dw_archivo from datawindow within w_grabar_lista_gestion
boolean visible = false
integer x = 480
integer y = 1260
integer width = 782
integer height = 432
string dataobject = "dwe_genera_archivo_cobranza_externa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_texto from statictext within w_grabar_lista_gestion
integer x = 37
integer y = 992
integer width = 1806
integer height = 88
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 16711680
long backcolor = 80269524
string text = "Recuerde para Cobranza Telefónica Externa debe Generar Archivo"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_exportar from commandbutton within w_grabar_lista_gestion
boolean visible = false
integer x = 576
integer y = 860
integer width = 654
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Exportar Archivo Cobranza"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_grupo,ll_rut,ll_mora_cred,ll_dias_mora_cred,&
			ll_monto_total_mora_cred,ll_mora_mant,ll_dias_mora_mant,ll_monto_total_mora_mant,ll_new,&
			ll_cod_est_cob
String	ls_base,ls_serie,ls_estado_ult_cob,ls_descrip_est_ult_cob,ls_glosa_ult_cob
Date		ld_fecha_ult_cob,ld_fecha_prox_vcto_cred,ld_fecha_prox_llamada,&
			ld_fecha_prox_vcto_mant
String	ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc_part,ls_cod_ciudad,ls_ciudad,&
			ls_cod_comuna,ls_comuna,ls_fono_particular,ls_fono_comercial
double	ldb_numero

datawindow dw_paso
if isvalid(w_generar_lista_cliente_gestion_cobranza) then
	dw_archivo.reset()
	ll_tot_reg	= w_generar_lista_cliente_gestion_cobranza.dw_lista.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ll_grupo							= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'codigo_grupo')
			ll_rut							= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'rut')
			ls_base							= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'base')
			ls_serie							= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'serie')
			ldb_numero						= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'numero')
			ls_estado_ult_cob				= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'estado_cobranza')
			ll_cod_est_cob					= long(ls_estado_ult_cob)
			SELECT	"ESTADO_COBRANZA"."GLOSA_ESTADO"  
			INTO 		:ls_descrip_est_ult_cob  
			FROM 		"ESTADO_COBRANZA"  
			WHERE 	"ESTADO_COBRANZA"."COD_ESATDO" = :ll_cod_est_cob   
			USING		sqlca;
			ld_fecha_ult_cob				= date(w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemdatetime(ll_indi,'fecha_cobranza'))
			ls_glosa_ult_cob				= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'glosa_cobranza')
			ld_fecha_prox_llamada		= date(w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemdatetime(ll_indi,'fecha_prox_llamado'))
			ls_nombre						= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'nombre')
			ls_ap_pat						= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'a_paterno')
			ls_ap_mat						= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'a_materno')
			ls_direc_part					= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'direccion_p')
			ls_cod_ciudad					= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'codigo_ciudad')
			ls_ciudad						= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'ciudad')
			ls_cod_comuna					= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'codigo_comuna')
			ls_comuna						= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'comuna')
			ls_fono_particular			= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'fono_p')
			ls_fono_comercial				= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'fono_c')
			ll_mora_cred					= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'mora_cred')
			ll_dias_mora_cred				= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'dias_mora_cred')
			ld_fecha_prox_vcto_cred		= date(w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemdatetime(ll_indi,'fecha_venc_cred'))
			ll_monto_total_mora_cred	= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'total_mora_cred')
			ll_mora_mant					= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'mora_mant')
			ll_dias_mora_mant				= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'dias_mora_mant')
			ld_fecha_prox_vcto_mant		= date(w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemdatetime(ll_indi,'fecha_venc_mant'))
			ll_monto_total_mora_mant	= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'total_mora_mant')
			// setear fecha de hoy
			ll_new	= dw_archivo.insertrow(0)
			dw_archivo.scrolltorow(ll_new)
			dw_archivo.setitem(ll_new,'grupo',ll_grupo)
			dw_archivo.setitem(ll_new,'rut',ll_rut)
			dw_archivo.setitem(ll_new,'base',ls_base)
			dw_archivo.setitem(ll_new,'serie',ls_serie)
			dw_archivo.setitem(ll_new,'numero',ldb_numero)
			dw_archivo.setitem(ll_new,'estado_ultima_cobranza',ls_estado_ult_cob)
			dw_archivo.setitem(ll_new,'descripcion_estado_cobranza',ls_descrip_est_ult_cob)
			dw_archivo.setitem(ll_new,'fecha_ultima_cobranza',ld_fecha_ult_cob)
			dw_archivo.setitem(ll_new,'glosa_ultima_cobranza',ls_glosa_ult_cob)
			dw_archivo.setitem(ll_new,'fecha_prox_llamada',ld_fecha_prox_llamada)
			dw_archivo.setitem(ll_new,'nombre',ls_nombre)
			dw_archivo.setitem(ll_new,'apellido_paterno',ls_ap_pat)
			dw_archivo.setitem(ll_new,'apellido_materno',ls_ap_mat)
			dw_archivo.setitem(ll_new,'direccion_particular',ls_direc_part)
			dw_archivo.setitem(ll_new,'codigo_ciudad',ls_cod_ciudad)
			dw_archivo.setitem(ll_new,'ciudad',ls_ciudad)
			dw_archivo.setitem(ll_new,'codigo_comuna',ls_cod_comuna)
			dw_archivo.setitem(ll_new,'comuna',ls_comuna)
			dw_archivo.setitem(ll_new,'fono_particular',ls_fono_particular)
			dw_archivo.setitem(ll_new,'fono_comercial',ls_fono_comercial)
			dw_archivo.setitem(ll_new,'mora_credito',ll_mora_cred)
			dw_archivo.setitem(ll_new,'dias_mora_credito',ll_dias_mora_cred)
			dw_archivo.setitem(ll_new,'fecha_prox_vcto_credito',ld_fecha_prox_vcto_cred)
			dw_archivo.setitem(ll_new,'monto_total_mora_credito',ll_monto_total_mora_cred)
			dw_archivo.setitem(ll_new,'mora_mant',ll_mora_mant)
			dw_archivo.setitem(ll_new,'dias_mora_mant',ll_dias_mora_mant)
			dw_archivo.setitem(ll_new,'fecha_prox_vcto_mant',ld_fecha_prox_vcto_mant)
			dw_archivo.setitem(ll_new,'monto_total_mora_mant',ll_monto_total_mora_mant)
			dw_archivo.setitem(ll_new,'fecha_asignacion',date(gdt_fec_sistema))
		next
	end if
	dw_archivo.accepttext()
	dw_paso	= dw_archivo
	if dw_archivo.rowcount() > 0 then f_DWToExcel( dw_paso )
else
	messagebox("Advertencia","Debe Existir Lista de Cobranza Telefónica para Exportar")
end if

end event

type cb_cerrar from commandbutton within w_grabar_lista_gestion
integer x = 1499
integer y = 860
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_generar_lista_cliente_gestion_cobranza) then close(w_generar_lista_cliente_gestion_cobranza)
if isvalid(w_grabar_lista_gestion) then close(w_grabar_lista_gestion)
end event

type cb_grabar from commandbutton within w_grabar_lista_gestion
integer x = 37
integer y = 860
integer width = 320
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long		ll_max,ll_tot_reg,ll_indi,ll_rut_cliente,ll_dato_1,ll_dato_2,&
			ll_cod_parque
string	ls_base,ls_serie,ls_estado='P',ls_usuario_asig, ls_obs,ls_personal_interno
datetime	ldt_fec_prox_llam,ldt_fec_prox_3_meses
double	ldb_numero

SetPointer(HourGlass!)
ldt_fec_prox_3_meses			= dw_dato.getitemdatetime(1,'fecha_termino_asignacion')
if isvalid(w_generar_lista_cliente_gestion_cobranza) then
	dw_dato.accepttext()
	ls_usuario_asig					= dw_dato.getitemstring(1,'usuario_asignado')
	ls_obs							= dw_dato.getitemstring(1,'observacion')
	if ls_usuario_asig='' or isnull(ls_usuario_asig) then
		messagebox("Advertencia","Debe seleccionar Usuario")
		dw_dato.setfocus()
		dw_dato.setcolumn('usuario_asignado')
	else
		if ls_obs='' or isnull(ls_obs) then
			messagebox("Advertencia","Debe Ingresar Observación")
			dw_dato.setfocus()
			dw_dato.setcolumn('observacion')
		else
			SELECT 	MAX("GESTION_LISTA"."CODIGO")  
			INTO 		:ll_max  
			FROM 	"GESTION_LISTA"  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if isnull(ll_max) or ll_max=0 then
					ll_max				= 1
				else
					ll_max++
				end if
			else
				ll_max					= 1
			end if
			dw_dato.setitem(1,'codigo',ll_max)
			dw_dato.accepttext()
			if isvalid(w_generar_lista_cliente_gestion_cobranza) then
				w_generar_lista_cliente_gestion_cobranza.dw_lista.accepttext()
				ll_tot_reg							= w_generar_lista_cliente_gestion_cobranza.dw_lista.rowcount()
				for ll_indi=1 to ll_tot_reg
					ll_rut_cliente					= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'rut')
					ls_base							= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'base')
					ls_serie							= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemstring(ll_indi,'serie')
					ldb_numero						= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemnumber(ll_indi,'numero')
					ldt_fec_prox_llam				= w_generar_lista_cliente_gestion_cobranza.dw_lista.getitemdatetime(ll_indi,'fecha_prox_llamado')
					w_generar_lista_cliente_gestion_cobranza.dw_lista.setitem(ll_indi,'codigo_grupo',ll_max)
					w_generar_lista_cliente_gestion_cobranza.dw_lista.setitem(ll_indi,'fecha_asignacion',date(gdt_fec_sistema))
					w_generar_lista_cliente_gestion_cobranza.dw_lista.setitem(ll_indi,'estado_llamada','P')
					w_generar_lista_cliente_gestion_cobranza.dw_lista.setitem(ll_indi,'usuario_asignador',gs_user)
					w_generar_lista_cliente_gestion_cobranza.dw_lista.setitem(ll_indi,'usuario_asignado',ls_usuario_asig)
					w_generar_lista_cliente_gestion_cobranza.dw_lista.setitem(ll_indi,'gestion_cobranza_fec_termino_asig',ldt_fec_prox_3_meses)
					w_generar_lista_cliente_gestion_cobranza.dw_lista.accepttext()
					UPDATE 	"CLIENTE"  
					SET 		"ASIGNADO_COBRANZA" = 'S',
								"FECHA_PROX_LLAMADO" = :ldt_fec_prox_3_meses
					WHERE 	"CLIENTE"."RUT" = :ll_rut_cliente   
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						commit using Trans_1;
						UPDATE	"CADENA"  
						SET 		"ASIGNACION_AT" = 'S',
									"DEPTO_COB_ASIG" = 'C'
						WHERE	( "CADENA"."CODIGO" = :ls_base ) AND  
								 	( "CADENA"."SERIE" = :ls_serie ) AND  
								 	( "CADENA"."NUMERO" = :ldb_numero )   
						USING		Trans_2;
						if Trans_2.sqlcode=0 then
							commit using Trans_2;
						else
							rollback using Trans_2;
							messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
						end if
					else
						rollback using Trans_1;
						messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
					end if
				next
				w_generar_lista_cliente_gestion_cobranza.dw_lista.accepttext()
				if w_generar_lista_cliente_gestion_cobranza.dw_lista.update()=1 then
					commit;
					ll_cod_parque			= w_general_cobranza_telefonica.dw_parque.getitemnumber(1,'cod_parque')
					ll_tot_reg				= w_general_cobranza_telefonica.dw_lista.retrieve(date(gdt_fec_sistema),ll_cod_parque)
					if ll_tot_reg>0 then
						for ll_indi=1 to ll_tot_reg
							w_general_cobranza_telefonica.dw_lista.setitem(ll_indi,'est_reg',1)
						next
					end if
					if dw_dato.update() = 1 then
						commit;
						messagebox("Grabar","Grabación Exitosa")
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
					end if
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
				end if
				if is_personal_interno='S' then
					cb_cerrar.triggerevent(clicked!)
				else
					cb_exportar.enabled	= true
					cb_exportar.triggerevent(clicked!)
				end if
			else
				messagebox("Advertencia","Ventana Generar Lista Cliente Gestion Cobranza, se encuentra Cerrada")
			end if
		end if
	end if
end if
SetPointer(Arrow!)
end event

type dw_dato from datawindow within w_grabar_lista_gestion
integer x = 37
integer y = 44
integer width = 1824
integer height = 808
integer taborder = 10
string dataobject = "dw_grabar_lista_gestion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_usuario_asig,ls_columna
long		ll_resp

dw_dato.accepttext()
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'usuario_asignado'
		ls_usuario_asig	= dw_dato.getitemstring(1,'usuario_asignado')
		SELECT	"ENCARGADOS"."PERSONAL_INTERNO"  
		INTO 		:is_personal_interno  
		FROM 		"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_asig   
		Using		sqlca;
		if is_personal_interno='N' then
			st_texto.text	= 'Recuerde para Cobranza Telefónica Externa, debe Generar Archivo'
		else
			st_texto.text	= ''
		end if
END CHOOSE
end event

