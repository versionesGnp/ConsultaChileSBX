forward
global type w_comision_ejec_terreno_asig_anular from window
end type
type cb_grabar from commandbutton within w_comision_ejec_terreno_asig_anular
end type
type cb_cerrar from commandbutton within w_comision_ejec_terreno_asig_anular
end type
type dw_detalle from datawindow within w_comision_ejec_terreno_asig_anular
end type
end forward

global type w_comision_ejec_terreno_asig_anular from window
integer width = 1728
integer height = 1108
boolean titlebar = true
string title = "Comisión Ejecutivo Terreno"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_comision_ejec_terreno_asig_anular w_comision_ejec_terreno_asig_anular

type variables
long il_row,il_fila
end variables

forward prototypes
public subroutine wf_cargar_resto (datetime adt_fecha_ini, datetime adt_fecha_fin, string as_serie, long al_numero)
public subroutine wf_actualizar (string fecha_cierre)
public function double wf_mto_min (string as_tipo_cobr)
end prototypes

public subroutine wf_cargar_resto (datetime adt_fecha_ini, datetime adt_fecha_fin, string as_serie, long al_numero);
end subroutine

public subroutine wf_actualizar (string fecha_cierre);
end subroutine

public function double wf_mto_min (string as_tipo_cobr);double	ldb_mto_min

//wf_mto_min(as_tipo_cobr)
SELECT	"MONTO_MIN"
INTO		:ldb_mto_min
FROM 	"AT_MONTO_MIN_COBRANZA"  
WHERE	"AT_MONTO_MIN_COBRANZA"."TIPO_COBRANZA" = :as_tipo_cobr AND  
			"AT_MONTO_MIN_COBRANZA"."ESTADO" = 'V'
USING	sqlca;
if isnull(ldb_mto_min) then ldb_mto_min=0
return ldb_mto_min
end function

on w_comision_ejec_terreno_asig_anular.create
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_grabar,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_comision_ejec_terreno_asig_anular.destroy
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;string		ls_base,ls_serie,ls_nulo,ls_estado_com,ls_tipo_gestion,ls_gestion
long		ll_tot_reg,ll_indi,ll_cod_grupo,ll_tipo_gestion
datetime	ldt_nulo,ldt_fech_ini,ldt_fech_fin
double	ldb_numero,ldb_monto

gf_centrar(w_comision_ejec_terreno_asig_anular)
dw_detalle.settransobject(sqlca)
setnull(ldt_nulo);setnull(ls_nulo)
if (gs_depto='O' or gs_depto= 'E' or gs_depto= 'I') and gl_proceso>=4 then
	ls_base									= substr(1,1,Message.StringParm)
	ls_serie									= substr(1,2,Message.StringParm)
	ldb_numero								= double(substr(1,3,Message.StringParm))
	ll_cod_grupo							= long(substr(1,4,Message.StringParm))
	ls_tipo_gestion							= substr(1,5,Message.StringParm)
	ldb_monto								= double(substr(1,6,Message.StringParm))
	ldt_fech_ini								= datetime(date(substr(1,7,Message.StringParm)),time('00:00:00'))
	ldt_fech_fin								= datetime(date(substr(1,8,Message.StringParm)),time('00:00:00'))
	il_fila										= long(substr(1,9,Message.StringParm))
	
	
	if ls_tipo_gestion='N' then
		ls_gestion							= 'N'
	else
		ls_gestion							= 'CM'
	end if
	
	dw_detalle.settransobject(sqlca)
	dw_detalle.getchild('at_gestion_tipo_gestion',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ls_gestion)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_detalle.settransobject(sqlca)
	dw_detalle.getchild('at_gestion_concepto',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ls_tipo_gestion)=0 then
		idw_detalle2.insertrow(0)
	end if
	
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		ll_tot_reg							= dw_detalle.retrieve(ls_base,ls_serie,ldb_numero,ls_tipo_gestion)
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ls_estado_com				= dw_detalle.getitemstring(ll_indi,'at_gestion_estado_comi')
				ll_tipo_gestion				= dw_detalle.getitemnumber(ll_indi,'at_gestion_tipo_gestion')
				if ls_gestion='CM' then
					dw_detalle.setitem(ll_indi,'at_gestion_monto',ldb_monto)
					dw_detalle.setitem(ll_indi,'at_gestion_fec_ini',ldt_fech_ini)
					dw_detalle.setitem(ll_indi,'at_gestion_fec_fin',ldt_fech_fin)
					dw_detalle.setitem(ll_indi,'at_gestion_estado_gestion','G')
				end if
				dw_detalle.setitem(ll_indi,'at_gestion_fecha_anula_comis',ldt_nulo)
				dw_detalle.setitem(ll_indi,'at_gestion_usuario_anula_comis',ls_nulo)
				dw_detalle.setitem(ll_indi,'grupo',ll_cod_grupo)
				dw_detalle.accepttext()
			next
		else
			messagebox("Advertencia","No Registra Datos")
		end if
	end if
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_comision_ejec_terreno_asig_anular)
end if
end event

type cb_grabar from commandbutton within w_comision_ejec_terreno_asig_anular
integer x = 119
integer y = 852
integer width = 357
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_base,ls_serie,ls_estado_comi,ls_descrip,ls_tipo_regul,ls_graba='N',ls_tipo_cob,ls_pasa='S'
long		ll_res,ll_tot_reg,ll_indi,ll_cod_grupo,ll_tipo_gestion,ll_res2
double	ldb_numero,ldb_mto_min,ldb_mto_ges

dw_detalle.accepttext()
ll_tot_reg							= dw_detalle.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_base						= dw_detalle.getitemstring(ll_indi,'at_gestion_base')
		ls_serie						= dw_detalle.getitemstring(ll_indi,'at_gestion_serie')
		ldb_numero					= dw_detalle.getitemnumber(ll_indi,'at_gestion_numero')
		ls_estado_comi				= dw_detalle.getitemstring(ll_indi,'at_gestion_estado_comi')
		ll_cod_grupo				= dw_detalle.getitemnumber(ll_indi,'grupo')
		ll_tipo_gestion				= dw_detalle.getitemnumber(ll_indi,'at_gestion_tipo_gestion')
		ls_tipo_regul				= dw_detalle.getitemstring(ll_indi,'at_gestion_concepto')
		ls_tipo_cob					= dw_detalle.getitemstring(ll_indi,'at_gestion_tipo_cobranza')
		SELECT	"CODIGO_ESTADO_COMI"."DESCRIPCION"
		INTO		:ls_descrip
		FROM		"CODIGO_ESTADO_COMI"  
		WHERE	"CODIGO_ESTADO_COMI"."ESTADO_COMI" = :ls_estado_comi
		USING	sqlca;
//		messagebox("Advertencia",'No Puede Modificar Estado Comisión a "'+ls_descrip+'"')
//		dw_detalle.setfocus()
//		dw_detalle.setcolumn('at_gestion_estado_comi')
		if not isnull(ls_estado_comi) and ls_estado_comi<>'' then
			if ls_estado_comi='X' then
				ll_res					= messageBox("Grabar","¿Desea Grabar Modificación Realizadas a la Gestión Ejecutivo Terreno?", Exclamation!, YesNo!, 2)
			else
				if ls_tipo_cob='N' then
					if not isnull(ll_tipo_gestion) and ll_tipo_gestion>0 then
						ll_res			= messageBox("Grabar","¿Desea Grabar Modificación Realizadas a la Gestión Ejecutivo Terreno?", Exclamation!, YesNo!, 2)
					else
						if isnull(ll_tipo_gestion) or ll_tipo_gestion=0 then
							messagebox("Advertencia",'Debe Modificar Tipo Gestión')
							dw_detalle.setfocus()
							dw_detalle.setcolumn('at_gestion_tipo_gestion')
						end if
					end if
				else		
					if not isnull(ll_tipo_gestion) and ll_tipo_gestion>0 and not isnull(ls_tipo_regul) and ls_tipo_regul<>'' then
						if ls_tipo_regul<>'ML' and ls_tipo_regul<>'MS' and ls_tipo_regul<>'ME' and ls_tipo_regul<>'MT'  and ls_tipo_regul<>'CS' and ls_tipo_regul<>'CE' and ls_tipo_regul<>'CT' and ls_tipo_regul<>'CL' then
							if isvalid(w_comision_ejecutivo_terreno_asig) then
								if w_comision_ejecutivo_terreno_asig.dw_comision.dataobject='dw_lista_comi_ag_at' and w_comision_ejecutivo_terreno_asig.dw_comision.rowcount() > 0 then
									ldb_mto_min			= w_comision_ejecutivo_terreno_asig.dw_comision.getitemnumber(il_fila,'mto_min')
									ldb_mto_ges			= w_comision_ejecutivo_terreno_asig.dw_comision.getitemnumber(il_fila,'at_gestion_monto')
																		
								elseif w_comision_ejecutivo_terreno_asig.dw_comision.dataobject='dw_lista_comi_ag_at_cobranza' and w_comision_ejecutivo_terreno_asig.dw_comision.rowcount() > 0 then
									ldb_mto_min			= wf_mto_min(ls_tipo_cob)
									ldb_mto_ges			= w_comision_ejecutivo_terreno_asig.dw_comision.getitemnumber(il_fila,'at_gestion_monto')
								end if
								if ldb_mto_ges<ldb_mto_min then
									ls_pasa				= 'N'		
								end if
							end if
						end if
						if ls_pasa='S' then
							ll_res							= messageBox("Grabar","¿Desea Grabar Modificación Realizadas a la Gestión Ejecutivo Terreno?", Exclamation!, YesNo!, 2)
						else
							ll_res2						=  MessageBox("Advertencia", '¿ Debe Modificar Criterios de Cobranza ?', Exclamation!, YesNo!, 2)
							if ll_res2=1 then
								w_comision_ejecutivo_terreno_asig.cb_criterio_cob.triggerevent(clicked!)
							end if
						end if
					else
						if isnull(ll_tipo_gestion) or ll_tipo_gestion=0 then
							messagebox("Advertencia",'Debe Modificar Tipo Gestión')
							dw_detalle.setfocus()
							dw_detalle.setcolumn('at_gestion_tipo_gestion')
						elseif isnull(ls_tipo_regul) or ls_tipo_regul='' then
							messagebox("Advertencia",'Debe Modificar Tipo Regularización')
							dw_detalle.setfocus()
							dw_detalle.setcolumn('at_gestion_concepto')
						end if
					end if
				end if
			end if
		else
			if isnull(ls_estado_comi) or ls_estado_comi='' then
				messagebox("Advertencia",'Debe Ingresar Estado Comisión')
				dw_detalle.setfocus()
				dw_detalle.setcolumn('at_gestion_tipo_gestion')
			end if
		end if
		if ll_res = 1 then
			if dw_detalle.update() = 1 then
				commit using sqlca;
				if ls_estado_comi='X' then
					if ls_base='O' then
						UPDATE	"OFERTA_V"  
						SET		"ESTADO_COMI_AT" = :ls_estado_comi  
						WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
									( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
						USING	sqlca;
					elseif ls_base='L' then
						UPDATE	"ANEXO_LIBERADOR"  
						SET 		"ESTADO_COMI_AT" = :ls_estado_comi  
						WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
									( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
						USING	sqlca;
					elseif ls_base='A' then
						UPDATE	"ANEXO_AUMENTO"  
						SET 		"ESTADO_COMI_AT" = :ls_estado_comi  
						WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
									( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
						USING	sqlca;	
					end if
					if sqlca.sqlcode=0 then
						commit using sqlca;
					else
						rollback using sqlca;
						messagebox("Error Grabar","Error al Grabar Estado Comisión: "+sqlca.sqlerrtext)
					end if
					if isvalid(w_detalle_lista_generada_gestion_terreno) then
						w_detalle_lista_generada_gestion_terreno.dw_lista.retrieve(ll_cod_grupo)
						w_detalle_lista_generada_gestion_terreno.dw_lista.setfocus()
					end if
				end if
				messagebox("Grabar","Grabación Exitosa")
				close(w_comision_ejec_terreno_asig_anular)
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Modificación Estado Comisión Ejecutivo Terreno: "+sqlca.sqlerrtext)
			end if
		end if
	next	
else
	messagebox("Advertencia","No Registra Datos")
end if
end event

type cb_cerrar from commandbutton within w_comision_ejec_terreno_asig_anular
integer x = 1230
integer y = 852
integer width = 357
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_ejec_terreno_asig_anular)
end event

type dw_detalle from datawindow within w_comision_ejec_terreno_asig_anular
integer x = 110
integer y = 116
integer width = 1509
integer height = 736
integer taborder = 40
string title = "none"
string dataobject = "dw_comision_ejec_terreno_asig_anular"
boolean border = false
end type

event itemchanged;string		ls_columna,ls_nulo,ls_estado_comi,ls_descrip
long		ll_tipo_gestion
datetime	ldt_nulo

setnull(ldt_nulo);setnull(ls_nulo)
dw_detalle.accepttext()
ls_columna								= dwo.name
if ls_columna = 'at_gestion_estado_comi' then
	ls_estado_comi						= dw_detalle.getitemstring(1,'at_gestion_estado_comi')
	if ls_estado_comi='X' or ls_estado_comi='N' then
		dw_detalle.setitem(1,'at_gestion_fecha_anula_comis',gdt_fec_sistema)
		dw_detalle.setitem(1,'at_gestion_usuario_anula_comis',gs_user)
		dw_detalle.setitem(1,'at_gestion_estado_gestion','G')
		dw_detalle.accepttext()
		cb_grabar.enabled				= true
	else
		SELECT	"CODIGO_ESTADO_COMI"."DESCRIPCION"
		INTO		:ls_descrip
		FROM		"CODIGO_ESTADO_COMI"  
		WHERE	"CODIGO_ESTADO_COMI"."ESTADO_COMI" = :ls_estado_comi
		USING	sqlca;
		messagebox("Advertencia",'No Puede Modificar Estado Comisión a "'+ls_descrip+'"')
		dw_detalle.setitem(1,'at_gestion_fecha_anula_comis',ldt_nulo)
		dw_detalle.setitem(1,'at_gestion_usuario_anula_comis',ls_nulo)
		dw_detalle.accepttext()
		cb_grabar.enabled				= false
	end if
elseif ls_columna = 'at_gestion_tipo_gestion' then
	ll_tipo_gestion						= dw_detalle.getitemnumber(1,'at_gestion_tipo_gestion')
	if not isnull(ll_tipo_gestion) and ll_tipo_gestion>0 then
		dw_detalle.setitem(1,'at_gestion_fecha_anula_comis',gdt_fec_sistema)
		dw_detalle.setitem(1,'at_gestion_usuario_anula_comis',gs_user)
		dw_detalle.setitem(1,'at_gestion_estado_gestion','G')
		dw_detalle.accepttext()
		cb_grabar.enabled				= true
	else
		messagebox("Advertencia",'Debe Ingresar Tipo Gestión')
		dw_detalle.setitem(1,'at_gestion_fecha_anula_comis',ldt_nulo)
		dw_detalle.setitem(1,'at_gestion_usuario_anula_comis',ls_nulo)
		dw_detalle.accepttext()
		cb_grabar.enabled				= false
	end if
end if
end event

