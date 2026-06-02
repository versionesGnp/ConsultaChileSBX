forward
global type w_comision_comp_asignacion from window
end type
type cb_eliminar from commandbutton within w_comision_comp_asignacion
end type
type dw_porcentaje from datawindow within w_comision_comp_asignacion
end type
type cb_limpiar from commandbutton within w_comision_comp_asignacion
end type
type cb_grabar from commandbutton within w_comision_comp_asignacion
end type
type cb_cerrar from commandbutton within w_comision_comp_asignacion
end type
type cb_imprimir from commandbutton within w_comision_comp_asignacion
end type
type dw_asignar from datawindow within w_comision_comp_asignacion
end type
type cb_mod_cod_vtas from commandbutton within w_comision_comp_asignacion
end type
end forward

global type w_comision_comp_asignacion from window
integer width = 2875
integer height = 1472
boolean titlebar = true
string title = "Comisiones Compartidas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_eliminar cb_eliminar
dw_porcentaje dw_porcentaje
cb_limpiar cb_limpiar
cb_grabar cb_grabar
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
dw_asignar dw_asignar
cb_mod_cod_vtas cb_mod_cod_vtas
end type
global w_comision_comp_asignacion w_comision_comp_asignacion

type variables
string		is_opcion,is_canal='NI',is_graba
long 		il_row,il_sw_pasa=0,il_tot_lista
end variables

forward prototypes
public function string wf_modf_cod_vtas (string as_base, string as_serie, double adb_numero)
end prototypes

public function string wf_modf_cod_vtas (string as_base, string as_serie, double adb_numero);string	ls_age_orig,ls_sup_orig,ls_jef_orig,ls_graba='S'
long	ll_graba=0

//wf_modf_cod_vtas(as_base,as_serie,adb_numero)
ls_age_orig											= dw_asignar.getitemstring(1,"oferta_v_cod_age")
ls_sup_orig											= dw_asignar.getitemstring(1,"oferta_v_cod_sup")
ls_jef_orig											= dw_asignar.getitemstring(1,"oferta_v_cod_jef")	
if as_base='O' then
	UPDATE	"OFERTA_V"  
	SET		"COD_AGE" = :ls_age_orig,
				"COD_SUP" = :ls_sup_orig,
				"COD_JEF" = :ls_jef_orig    
	WHERE	"OFERTA_V"."SERIE" = :as_serie AND  
				"OFERTA_V"."NRO_OFERTA" = :adb_numero
	USING	sqlca;
elseif as_base='L' then
	UPDATE	"ANEXO_LIBERADOR"  
	SET		"COD_AGENTE" = :ls_age_orig,
				"COD_SUPER" = :ls_sup_orig,
				"COD_JEF" = :ls_jef_orig    
	WHERE	"ANEXO_LIBERADOR"."SERIE_M" = :as_serie AND  
				"ANEXO_LIBERADOR"."NRO_LIBERADOR" = :adb_numero
	USING	sqlca;
elseif as_base='A' then
	UPDATE	"ANEXO_AUMENTO"  
	SET		"COD_AGENTE" = :ls_age_orig,
				"COD_SUPER" = :ls_sup_orig,
				"COD_JEF" = :ls_jef_orig    
	WHERE	"ANEXO_AUMENTO"."SERIE_M" = :as_serie AND  
				"ANEXO_AUMENTO"."NRO_AUMENTO" = :adb_numero
	USING	sqlca;
end if
if sqlca.sqlcode=0 then
	commit using sqlca;
else
	rollback using sqlca;
	ls_graba				= 'N'
	messagebox("Error Grabar","Error Grabar Promesa "+as_base+'-'+as_serie+'-'+string(adb_numero))
end if

return		ls_graba
end function

on w_comision_comp_asignacion.create
this.cb_eliminar=create cb_eliminar
this.dw_porcentaje=create dw_porcentaje
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.dw_asignar=create dw_asignar
this.cb_mod_cod_vtas=create cb_mod_cod_vtas
this.Control[]={this.cb_eliminar,&
this.dw_porcentaje,&
this.cb_limpiar,&
this.cb_grabar,&
this.cb_cerrar,&
this.cb_imprimir,&
this.dw_asignar,&
this.cb_mod_cod_vtas}
end on

on w_comision_comp_asignacion.destroy
destroy(this.cb_eliminar)
destroy(this.dw_porcentaje)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.dw_asignar)
destroy(this.cb_mod_cod_vtas)
end on

event open;string	ls_base,ls_serie,ls_orig_venta,ls_tipo_vta,ls_cod_age,ls_cod_sup,ls_cod_jef,ls_tipo_info
long		ll_tot_reg,ll_new,ll_tot_lista,ll_tipo_condol,ll_tipo_comis
double	ldb_numero,ldb_porce_age,ldb_porce_sup,ldb_porce_jef,ldb_factor_age_1,ldb_factor_age_2,ldb_factor_age_3,&
			ldb_porce_age_1,ldb_porce_age_2,ldb_porce_age_3,ldb_factor_sup_1,ldb_factor_jefe_1,ldb_porce_sup_1,ldb_porce_jef_1
			
connect using Trans_1;
ls_base														= substr(1,1,Message.StringParm)
ls_serie														= substr(1,2,Message.StringParm)
ldb_numero													= double(substr(1,3,Message.StringParm))
ls_orig_venta												= substr(1,4,Message.StringParm)
ls_tipo_info													= substr(1,5,Message.StringParm)

dw_asignar.object.oferta_v_cod_age.protect		= 1
dw_asignar.object.oferta_v_cod_sup.protect		= 1
dw_asignar.object.oferta_v_cod_jef.protect			= 1


dw_asignar.dataobject									= 'dw_comision_compar_asig'
dw_asignar.settransobject(sqlca)
dw_asignar.getchild('comision_compartida_tipo_condolencia',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(ls_orig_venta)=0 then
	idw_detalle.insertrow(0)
end if
dw_asignar.insertrow(0)
if ls_orig_venta = '5' then
	dw_asignar.object.gb_2.text						= 'Asignación Agente Canal Funeraria'
	w_comision_comp_asignacion.height				= 1300
	dw_asignar.height										= 936
	cb_grabar.y												= 960
	cb_mod_cod_vtas.y									= 960
	cb_eliminar.y											= 960
	cb_limpiar.y												= 960
	cb_imprimir.y											= 960
	cb_cerrar.y												= 960
elseif ls_orig_venta = '3' then
	dw_asignar.object.gb_2.text						= 'Asignación Agente Convenio'
	w_comision_comp_asignacion.height				= 1100
	dw_asignar.height										= 712
	cb_grabar.y												= 772
	cb_mod_cod_vtas.y									= 772
	cb_eliminar.y											= 772
	cb_limpiar.y												= 772
	cb_imprimir.y											= 772
	cb_cerrar.y												= 772
elseif ls_orig_venta = 'U' or ls_orig_venta = 'E' or ls_orig_venta = '6' then
	dw_asignar.object.gb_2.text						= 'Asignación Agente U.G.N.'
	w_comision_comp_asignacion.height				= 1300
	dw_asignar.height										= 936
	cb_grabar.y												= 960
	cb_mod_cod_vtas.y									= 960
	cb_eliminar.y											= 960
	cb_limpiar.y												= 960
	cb_imprimir.y											= 960
	cb_cerrar.y												= 960
elseif ls_orig_venta = 'C' then
	dw_asignar.object.gb_2.text						= 'Asignación Maestro Ceremonia' 
	dw_asignar.object.gb_3.text						= 'Asignación Agente U.G.N.'
	w_comision_comp_asignacion.height				= 1500
	dw_asignar.height										= 1148
	cb_grabar.y												= 1176
	cb_mod_cod_vtas.y									= 1176
	cb_eliminar.y											= 1176
	cb_limpiar.y												= 1176
	cb_imprimir.y											= 1176
	cb_cerrar.y												= 1176
else
	dw_asignar.object.gb_2.text						= 'Asignación Comisión Compartida'
	w_comision_comp_asignacion.height				= 1300
	dw_asignar.height										= 936
	cb_grabar.y												= 960
	cb_mod_cod_vtas.y									= 960
	cb_eliminar.y											= 960
	cb_limpiar.y												= 960
	cb_imprimir.y											= 960
	cb_cerrar.y												= 960
end if
gf_centrar(w_comision_comp_asignacion)
if (not isnull(ls_base) or ls_base<>'') and (not isnull(ls_serie) or ls_serie<>'') and (not isnull(ldb_numero) or ldb_numero >0) then
	il_tot_lista										= dw_asignar.retrieve(ls_base,ls_serie,ldb_numero)
	if il_tot_lista = 0 then
		SELECT	"COD_AGE",		"COD_SUP",		"COD_JEF",		"PORCE_VENTA",		"PORCE_SUP",		"PORCE_JEFE",		"TIPO_VENTA"    
		INTO		:ls_cod_age,	:ls_cod_sup,	:ls_cod_jef,	:ldb_porce_age,	:ldb_porce_sup,	:ldb_porce_jef,	:ls_tipo_vta  
		FROM		"OFERTA_V"  
		WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
					( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if (ls_orig_venta = 'C' or ls_orig_venta = 'U' or ls_orig_venta = '3' or ls_orig_venta = 'E' or ls_orig_venta = '6') and ll_tipo_comis>0 then
				dw_porcentaje.dataobject				= 'dw_comision_comp_porce_condol'
				dw_porcentaje.settransobject(sqlca)	
				ll_tot_reg									= dw_porcentaje.retrieve(ls_orig_venta,ll_tipo_comis)
			else
				dw_porcentaje.dataobject				= 'dw_comision_comp_porce_condol'
				//dw_porcentaje.dataobject				= 'dw_comision_comp_porce'
				dw_porcentaje.settransobject(sqlca)
				if is_canal ='NI' then
					ls_orig_venta							= '5'
				elseif is_canal ='NF' then
					ls_orig_venta							= 'X'
				end if
				ll_tot_reg									= dw_porcentaje.retrieve(ls_orig_venta,2)
			end if
			if ll_tot_reg>0 then
				ldb_factor_age_1							= dw_porcentaje.getitemnumber(1,'porce_age_1')
				ldb_factor_age_2							= dw_porcentaje.getitemnumber(1,'porce_age_2')
				ldb_factor_age_3							= dw_porcentaje.getitemnumber(1,'porce_age_3')
				ldb_porce_age_1							= ldb_porce_age * ldb_factor_age_1
				ldb_porce_age_2							= ldb_porce_age * ldb_factor_age_2
				ldb_porce_age_3							= ldb_porce_age * ldb_factor_age_3
				ldb_factor_sup_1							= dw_porcentaje.getitemnumber(1,'porce_sup_1')
				ldb_factor_jefe_1							= dw_porcentaje.getitemnumber(1,'porce_jefe_1')
				ldb_porce_sup_1							= ldb_porce_sup * ldb_factor_sup_1
				ldb_porce_jef_1							= ldb_porce_jef * ldb_factor_jefe_1
			else
				messagebox("Advertencia","No Existe Factor Calculo Comisión")
			end if
			ll_new											= dw_asignar.insertrow(0)
			dw_asignar.scrolltorow(ll_new)
			dw_asignar.setitem(ll_new,"usuario_crea",gs_user)
			dw_asignar.setitem(ll_new,"base",ls_base)
			dw_asignar.setitem(ll_new,"serie",ls_serie)
			dw_asignar.setitem(ll_new,"numero",ldb_numero)
			dw_asignar.setitem(ll_new,"codigo_tipo_vta",ls_tipo_vta)
			dw_asignar.setitem(ll_new,"comision_compartida_tipo_condolencia",ll_tipo_comis)
			dw_asignar.setitem(ll_new,"oferta_v_cod_age",ls_cod_age)
			dw_asignar.setitem(ll_new,"oferta_v_cod_sup",ls_cod_sup)
			dw_asignar.setitem(ll_new,"oferta_v_cod_jef",ls_cod_jef)
			dw_asignar.setitem(ll_new,"porce_age_orig",ldb_porce_age)
			dw_asignar.setitem(ll_new,"porce_sup_orig",ldb_porce_sup)
			dw_asignar.setitem(ll_new,"porce_jefe_orig",ldb_porce_jef)
			dw_asignar.setitem(ll_new,"porce_age_1",ldb_porce_age_1)
			dw_asignar.setitem(ll_new,"porce_age_2",ldb_porce_age_2)
			dw_asignar.setitem(ll_new,"porce_age_3",ldb_porce_age_3)
			dw_asignar.setitem(ll_new,"porce_sup_1",ldb_porce_sup_1)
			dw_asignar.setitem(ll_new,"porce_jefe_1",ldb_porce_jef_1)
			dw_asignar.accepttext()
		end if
	else
		ll_tipo_comis										= dw_asignar.getitemnumber(1,'comision_compartida_tipo_condolencia')
		if ll_tipo_comis = 1 then
			dw_asignar.object.gb_2.text				= 'Asignación Jefe Ventas U.G.N.' 
			w_comision_comp_asignacion.height		= 1100
			dw_asignar.height								= 712
			cb_grabar.y										= 772
			cb_mod_cod_vtas.y							= 772
			cb_eliminar.y									= 772
			cb_limpiar.y										= 772
			cb_imprimir.y									= 772
			cb_cerrar.y										= 772
		elseif ll_tipo_comis = 2 then
			if ls_orig_venta='U' or ls_orig_venta='E' or ls_orig_venta='6' then
				dw_asignar.object.gb_2.text			= 'Asignación Agente U.G.N.' 
			elseif ls_orig_venta='C' then
				dw_asignar.object.gb_2.text			= 'Asignación Agente U.G.N.' 
			elseif ls_orig_venta='3' then
				dw_asignar.object.gb_2.text			= 'Asignación Agente Convenio'
			elseif ls_orig_venta='5' then
				dw_asignar.object.gb_2.text			= 'Asignación Agente Canal Funeraria'
			elseif ls_orig_venta='X' then
				dw_asignar.object.gb_2.text			= 'Asignación Agente Comparte'	
			end if
			w_comision_comp_asignacion.height		= 1300
			dw_asignar.height								= 936
			cb_grabar.y										= 960
			cb_mod_cod_vtas.y							= 960
			cb_eliminar.y									= 960
			cb_limpiar.y										= 960
			cb_imprimir.y									= 960
			cb_cerrar.y										= 960
		elseif ll_tipo_comis = 3 or ll_tipo_comis = 4 then 
			dw_asignar.object.gb_2.text				= 'Asignación Maestro Ceremonia'
			dw_asignar.object.gb_3.text				= 'Asignación Agente U.G.N.'
			w_comision_comp_asignacion.height		= 1500
			dw_asignar.height								= 1148
			cb_grabar.y										= 1176
			cb_mod_cod_vtas.y							= 1176
			cb_eliminar.y									= 1176
			cb_limpiar.y										= 1176
			cb_imprimir.y									= 1176
			cb_cerrar.y										= 1176
		end if
		gf_centrar(w_comision_comp_asignacion)
		cb_grabar.enabled									= false
		cb_mod_cod_vtas.enabled						= false
		cb_limpiar.enabled								= false
	end if
	if ls_tipo_info='O' then
		cb_grabar.enabled									= false
		cb_mod_cod_vtas.enabled						= false
		cb_eliminar.enabled								= false
		cb_limpiar.enabled								= false
		dw_asignar.enabled								= false
	end if
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_eliminar from commandbutton within w_comision_comp_asignacion
integer x = 1413
integer y = 1172
integer width = 274
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;string	ls_base,ls_serie,ls_estado
long		ll_res,ll_cta
double	ldb_numero

ls_base					= dw_asignar.getitemstring(1,"base")   
ls_serie					= dw_asignar.getitemstring(1,"serie")   
ldb_numero				= dw_asignar.getitemnumber(1,"numero")   
ls_estado				= dw_asignar.getitemstring(1,"estado")

SELECT	count("RES_COMI"."SERIE")  
INTO		:ll_cta  
FROM		"RES_COMI"  
WHERE	"RES_COMI"."SERIE" = :ls_serie AND  
      		"RES_COMI"."CONTRATO" = :ldb_numero AND  
      		( "RES_COMI"."COD_CONTABLE" = '023' OR "RES_COMI"."COD_CONTABLE" = '037')
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_cta) and ll_cta>0 then
		messagebox("Advertencia","No Puede Eliminar Registro Existe Comisiones Pagadas")
	else
		ll_res			= messagebox("Eliminar",'Esta Seguro de Eliminar Registro', Exclamation!, YesNo!, 2)
		if ll_res=1 then
			UPDATE	"COMISION_COMPARTIDA"  
			SET		"ESTADO" = 'N',
						"FECHA_MODIFICA" = :gdt_fec_sistema  
			WHERE	( "COMISION_COMPARTIDA"."BASE" = :ls_base ) AND  
						( "COMISION_COMPARTIDA"."SERIE" = :ls_serie ) AND  
						( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero ) AND  
						( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				messagebox("Eliminar","Registro Eliminado Exitoso") 
			end if
		end if
		w_comision_comp_asignacion.triggerevent(open!)
		if isvalid(w_comision_compartida) then
			w_comision_compartida.pb_aceptar.triggerevent(clicked!)
		end if
	end if
end if

end event

type dw_porcentaje from datawindow within w_comision_comp_asignacion
integer x = 2917
integer y = 148
integer width = 1330
integer height = 228
integer taborder = 70
string title = "none"
string dataobject = "dw_comision_comp_porce_condol"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_limpiar from commandbutton within w_comision_comp_asignacion
integer x = 1966
integer y = 1172
integer width = 274
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;string	ls_nulo
long		ll_nulo
setnull(ls_nulo);setnull(ll_nulo)
dw_asignar.setcolumn('cod_age_2')
dw_asignar.setitem(1,'cod_age_2',ls_nulo)
dw_asignar.setitem(1,'cod_age_3',ls_nulo)
dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)

end event

type cb_grabar from commandbutton within w_comision_comp_asignacion
integer x = 41
integer y = 1172
integer width = 274
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_base,ls_serie,ls_origen,ls_cod_age_2,ls_cod_age_3,ls_cod_sup_2,ls_cod_sup_3,&
			ls_cod_jef_2,ls_cod_age_consul,ls_estado,ls_cod_age_consul_3,ls_valida,ls_depto,ls_depto2,ls_graba_mod='S'
long		ll_res,ll_tipo_comis
double	ldb_numero,ldb_porc_age_orig,ldb_porc_sup_orig,ldb_porc_jef_orig,ldb_porc_age_1,ldb_porc_age_2,ldb_porc_age_3,&
			ldb_porc_sup_1,ldb_porc_sup_2,ldb_porc_sup_3,ldb_porc_jef_1,ldb_porc_jef_2,ldb_porc_jef_3


ls_base													= dw_asignar.getitemstring(1,"base")   
ls_serie													= dw_asignar.getitemstring(1,"serie")   
ldb_numero												= dw_asignar.getitemnumber(1,"numero")   
ls_origen													= dw_asignar.getitemstring(1,"codigo_tipo_vta")
if ls_origen='3' or ls_origen='C' or ls_origen='U' or ls_origen='E' then
	ls_origen												= ls_origen
else
	ls_origen												= '5'
end if
ldb_porc_age_orig										= dw_asignar.getitemnumber(1,"porce_age_orig")   
ldb_porc_sup_orig										= dw_asignar.getitemnumber(1,"porce_sup_orig")   
ldb_porc_jef_orig										= dw_asignar.getitemnumber(1,"porce_jefe_orig")   
ldb_porc_age_1										= dw_asignar.getitemnumber(1,"porce_age_1")   
ldb_porc_sup_1										= dw_asignar.getitemnumber(1,"porce_sup_1")   
ldb_porc_jef_1											= dw_asignar.getitemnumber(1,"porce_jefe_1")   
ls_cod_age_2											= dw_asignar.getitemstring(1,"cod_age_2")   
ldb_porc_age_2										= dw_asignar.getitemnumber(1,"porce_age_2")   
ls_cod_sup_2											= dw_asignar.getitemstring(1,"cod_sup_2")   
ldb_porc_sup_2										= dw_asignar.getitemnumber(1,"porce_sup_2")   
ls_cod_jef_2											= dw_asignar.getitemstring(1,"cod_jefe_2")   
ldb_porc_jef_2											= dw_asignar.getitemnumber(1,"porce_jefe_2")   
ls_cod_age_3											= dw_asignar.getitemstring(1,"cod_age_3")   
ldb_porc_age_3										= dw_asignar.getitemnumber(1,"porce_age_3")
ls_estado												= 'V'
ll_tipo_comis											= dw_asignar.getitemnumber(1,"comision_compartida_tipo_condolencia")
if ls_origen = '5' then
	ls_depto												= 'M'
	ls_depto2											= 'K'
	if ll_tipo_comis = 2 then
		ls_valida											= '5N' //80-20
	elseif ll_tipo_comis = 0 then
		ls_valida											= 'OK'		
	end if
elseif ls_origen = 'U' or ls_origen = 'E' then
	ls_depto												= 'X'
	ls_depto2											= 'X'
	if ll_tipo_comis = 2 then
		ls_valida											= 'U2' //80-20
	elseif ll_tipo_comis = 3 then
		ls_valida											= 'U3' //50-20-30	
	elseif ll_tipo_comis = 0 then
		ls_valida											= 'ER'		
	end if
elseif ls_origen = '3' then
	ls_depto												= 'K'
	ls_depto2											= 'X'
	if ll_tipo_comis = 1 then
		ls_valida											= '31' //100-0
	elseif ll_tipo_comis = 2 then
		ls_valida											= '32' //80-20
	elseif ll_tipo_comis = 0 then
		ls_valida											= 'ER'		
	end if
elseif ls_origen = 'C' then
	ls_depto												= 'X'
	ls_depto2											= 'X'
	if ll_tipo_comis = 1 then
		ls_valida											= '31' //100-0
	elseif ll_tipo_comis = 2 then
		ls_valida											= 'C2' //80-20
	elseif ll_tipo_comis = 3 then
		ls_valida											= 'C3' //70-10-20
	elseif ll_tipo_comis = 4 then
		ls_valida											= 'C4' //50-20-30
	elseif ll_tipo_comis = 0 then
		ls_valida											= 'ER'		
	end if
end if
if ll_tipo_comis>0 then
	if ls_valida = 'ER' then
		if isnull(ll_tipo_comis) or ll_tipo_comis=0 then
			messagebox("Advertencia", "Debe Ingresar Tipo Comisión Compartida")
			dw_asignar.setfocus()
			dw_asignar.setcolumn('comision_compartida_tipo_condolencia')
		end if
	else
		if ls_valida = '31' then
			if (not isnull(ls_base) or ls_base<>'') and (not isnull(ls_serie) or ls_serie<>'') and (not isnull(ldb_numero) or ldb_numero>0) &
				and (not isnull(ldb_porc_age_orig) and ldb_porc_age_orig>0) and (not isnull(ldb_porc_sup_orig) and ldb_porc_sup_orig>0) and (not isnull(ldb_porc_jef_orig) and ldb_porc_jef_orig>0) &
				and (not isnull(ldb_porc_age_1) and ldb_porc_age_1>0) and (not isnull(ldb_porc_sup_1) and ldb_porc_sup_1>0) and (not isnull(ldb_porc_jef_1) and ldb_porc_jef_1>0) and ll_tipo_comis>0 &
				and not isnull(ls_cod_jef_2) and ls_cod_jef_2<>'' then
				ll_res											= MessageBox("Advertencia", 'Esta seguro de Grabar Registro', Exclamation!, YesNo!, 2)
				dw_asignar.setitem(1,'usuario_crea',gs_user)
				dw_asignar.setitem(1,'estado',ls_estado)
				dw_asignar.accepttext()
				if ll_res = 1 then
					if dw_asignar.update() = 1 then
						commit using sqlca;
						if is_graba='MC' then
							ls_graba_mod		= wf_modf_cod_vtas(ls_base,ls_serie,ldb_numero)
						end if
						if ls_graba_mod='S' then
							messagebox("Grabar","Grabación Exitosa")
							if isvalid(w_comision_compartida) then
								w_comision_compartida.pb_aceptar.triggerevent(clicked!)
							end if
							close(w_comision_comp_asignacion)
						end if
					else
						rollback using sqlca;
						messagebox("Error Grabar","Error Grabar Comisiones Comisión Compartidad Convenio: "+sqlca.sqlerrtext)
					end if
				else
					messagebox("Grabar","Proceso Cancelado")
				end if
			else
				if isnull(ls_base) or ls_base='' then
					messagebox("Advertencia", "No Registra Base Promesa")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('base')
				elseif isnull(ls_serie) or ls_serie='' then
					messagebox("Advertencia", "No Registra Serie Promesa")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('serie')
				elseif isnull(ldb_numero) or ldb_numero=0 then
					messagebox("Advertencia", "No Registra Numero de Promesa")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('numero')
				elseif isnull(ls_origen) or ls_origen='' then
					messagebox("Advertencia", "No Registra Origen Venta")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('codigo_tipo_vta')
				elseif isnull(ldb_porc_age_orig) or ldb_porc_age_orig=0 then
					messagebox("Advertencia", "No Registra Porcentaje Agente Ventas")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_age_orig')
				elseif isnull(ldb_porc_sup_orig) or ldb_porc_sup_orig=0 then
					messagebox("Advertencia", "No Registra Porcentaje Supervisor Ventas")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_sup_orig')
				elseif isnull(ldb_porc_jef_orig) or ldb_porc_jef_orig=0 then
					messagebox("Advertencia", "No Registra Porcentaje Jefe Ventas")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_jefe_orig')
				elseif isnull(ldb_porc_age_1) or ldb_porc_age_1=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Agente Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_age_1')
				elseif isnull(ldb_porc_sup_1) or ldb_porc_sup_1=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Supervisor Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_sup_1')
				elseif isnull(ldb_porc_jef_1) or ldb_porc_jef_1=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Supervisor Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_jefe_1')
				elseif isnull(ll_tipo_comis) or ll_tipo_comis=0 then
					messagebox("Advertencia", "Debe Ingresar Tipo Comisión Compartida")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('comision_compartida_tipo_condolencia')
				elseif isnull(ls_cod_jef_2) or ls_cod_jef_2='' then
					messagebox("Advertencia", "Debe Ingresar Jefe Ventas Convenio")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_jefe_2')	
				end if
			end if
		elseif ls_valida = '5N' or ls_valida = 'U2' or ls_valida = '32' or ls_valida = 'C2' or ls_valida = 'OK'  then
			if (not isnull(ls_base) or ls_base<>'') and (not isnull(ls_serie) or ls_serie<>'') and (not isnull(ldb_numero) and ldb_numero>0) &
				and (not isnull(ldb_porc_age_orig) and ldb_porc_age_orig>0) and (not isnull(ldb_porc_sup_orig) and ldb_porc_sup_orig>0) and (not isnull(ldb_porc_jef_orig) and ldb_porc_jef_orig>0) &
				and (not isnull(ldb_porc_age_1) and ldb_porc_age_1>0) and (not isnull(ldb_porc_sup_1) and ldb_porc_sup_1>0) and (not isnull(ldb_porc_jef_1) and ldb_porc_jef_1>0) &
				and (not isnull(ls_cod_age_2) and ls_cod_age_2<>'') and (not isnull(ldb_porc_age_2) and ldb_porc_age_2>0) &
				and (not isnull(ls_cod_sup_2) and ls_cod_sup_2<>'') and not isnull(ldb_porc_sup_2) &
				and (not isnull(ls_cod_jef_2) and ls_cod_jef_2<>'') and (not isnull(ldb_porc_jef_2) ) then
				SELECT	"AGENTES"."COD_AGE"  
				INTO		:ls_cod_age_consul  
				FROM		"AGENTES"  
				WHERE	( "AGENTES"."ESTADO" = 'A' ) AND  
							( "AGENTES"."DEPTO" = :ls_depto or "AGENTES"."DEPTO" = :ls_depto2) AND  
							( "AGENTES"."COD_AGE" = :ls_cod_age_2 )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ls_cod_age_consul) or ls_cod_age_consul<>'' then
						ll_res									= MessageBox("Advertencia", 'Esta seguro de Grabar Registro', Exclamation!, YesNo!, 2)
						dw_asignar.setitem(1,'usuario_crea',gs_user)
						dw_asignar.setitem(1,'estado',ls_estado)
						dw_asignar.accepttext()
						if ll_res = 1 then
							if dw_asignar.update() = 1 then
								commit using sqlca;
								if is_graba='MC' then
									ls_graba_mod		= wf_modf_cod_vtas(ls_base,ls_serie,ldb_numero)
								end if
								if ls_graba_mod='S' then
									messagebox("Grabar","Grabación Exitosa")
									if isvalid(w_comision_compartida) then
										w_comision_compartida.pb_aceptar.triggerevent(clicked!)
									end if
									close(w_comision_comp_asignacion)
								end if
							else
								rollback using sqlca;
								if ls_origen = '5' then
									messagebox("Error Grabar","Error Grabar Comisiones Comisión Compartidad Funeraria: "+sqlca.sqlerrtext)
								elseif ls_origen = 'U' then
									messagebox("Error Grabar","Error Grabar Comisiones Comisión Compartida U.G.N Web: "+sqlca.sqlerrtext)
								elseif ls_origen = '3' then
									messagebox("Error Grabar","Error Grabar Comisiones Comisión Compartida Convenio: "+sqlca.sqlerrtext)
								elseif ls_origen = 'C' then
									messagebox("Error Grabar","Error Grabar Comisiones Comisión Compartida Condolencia: "+sqlca.sqlerrtext)	
								end if
							end if
						else
							messagebox("Grabar","Proceso Cancelado")
						end if
					else
						if ls_origen = '5' then
							messagebox("Advertencia","Agente No Pertenece Canal Funerario")
						elseif ls_origen = 'U' or ls_origen = '3' or ls_origen = 'C' then
							messagebox("Advertencia","Agente No Pertenece Unidad Generadora de Negocios")
						end if
					end if
				end if
			else	
				if isnull(ls_base) or ls_base='' then
					messagebox("Advertencia", "No Registra Base Promesa")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('base')
				elseif isnull(ls_serie) or ls_serie='' then
					messagebox("Advertencia", "No Registra Serie Promesa")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('serie')
				elseif isnull(ldb_numero) or ldb_numero=0 then
					messagebox("Advertencia", "No Registra Numero de Promesa")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('numero')
				elseif isnull(ls_origen) or ls_origen='' then
					messagebox("Advertencia", "No Registra Origen Venta")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('codigo_tipo_vta')
				elseif isnull(ldb_porc_age_orig) or ldb_porc_age_orig=0 then
					messagebox("Advertencia", "No Registra Porcentaje Agente Ventas")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_age_orig')
				elseif isnull(ldb_porc_sup_orig) or ldb_porc_sup_orig=0 then
					messagebox("Advertencia", "No Registra Porcentaje Supervisor Ventas")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_sup_orig')
				elseif isnull(ldb_porc_jef_orig) or ldb_porc_jef_orig=0 then
					messagebox("Advertencia", "No Registra Porcentaje Jefe Ventas")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_jefe_orig')
				elseif isnull(ldb_porc_age_1) or ldb_porc_age_1=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Agente Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_age_1')
				elseif isnull(ldb_porc_sup_1) or ldb_porc_sup_1=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Supervisor Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_sup_1')
				elseif isnull(ldb_porc_jef_1) or ldb_porc_jef_1=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Supervisor Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_jefe_1')
				elseif isnull(ls_cod_age_2) or ls_cod_age_2='' then
					messagebox("Advertencia", "Debe Ingresar Código Agente Unidad Generadora de Negocios")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_age_2')
				elseif isnull(ldb_porc_age_2) or ldb_porc_age_2=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Agente Unidad Generadora de Negocios")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_age_2')		
				elseif isnull(ls_cod_sup_2) or ls_cod_sup_2='' then
					messagebox("Advertencia", "Debe Ingresar Código Supervisor Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_sup_2')
				elseif isnull(ldb_porc_sup_2) or ldb_porc_sup_2=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Supervisor Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_sup_2')	
				elseif isnull(ls_cod_jef_2) or ls_cod_jef_2='' then
					messagebox("Advertencia", "Debe Ingresar Código Jefe Unidad Generadora de Negocios")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_jef_2')
				elseif isnull(ldb_porc_jef_2) or ldb_porc_jef_2=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Jefe Unidad Generadora de Negocios")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_jef_2')
				end if	
			end if
		elseif ls_valida = 'U3' or ls_valida = 'C3' or ls_valida = 'C4' then
			if (not isnull(ls_base) or ls_base<>'') and (not isnull(ls_serie) or ls_serie<>'') and (not isnull(ldb_numero) and ldb_numero>0) &
				and (not isnull(ldb_porc_age_orig) and ldb_porc_age_orig>0) and (not isnull(ldb_porc_sup_orig) and ldb_porc_sup_orig>0) and (not isnull(ldb_porc_jef_orig) and ldb_porc_jef_orig>0) &
				and (not isnull(ldb_porc_age_1) and ldb_porc_age_1>0) and (not isnull(ldb_porc_sup_1) and ldb_porc_sup_1>0) and (not isnull(ldb_porc_jef_1) and ldb_porc_jef_1>0) &
				and (not isnull(ls_cod_age_2) and ls_cod_age_2<>'') and (not isnull(ldb_porc_age_2) and ldb_porc_age_2>0) &
				and (not isnull(ls_cod_sup_2) and ls_cod_sup_2<>'') and (not isnull(ldb_porc_sup_2) and ldb_porc_sup_2>0) &
				and (not isnull(ls_cod_jef_2) and ls_cod_jef_2<>'') and (not isnull(ldb_porc_jef_2) and ldb_porc_jef_2>0) & 
				and (not isnull(ls_cod_age_3) and ls_cod_age_3<>'') and (not isnull(ldb_porc_age_3) and ldb_porc_age_3>0) &
				and ll_tipo_comis>0 then
				SELECT	"AGENTES"."COD_AGE"  
				INTO		:ls_cod_age_consul  
				FROM		"AGENTES"  
				WHERE		( "AGENTES"."ESTADO" = 'A' ) AND  
							( "AGENTES"."DEPTO" = :ls_depto or "AGENTES"."DEPTO" = :ls_depto2) AND  
							( "AGENTES"."COD_AGE" = :ls_cod_age_2 )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ls_cod_age_consul) and ls_cod_age_consul<>'' then
						SELECT	"AGENTES"."COD_AGE"  
						INTO		:ls_cod_age_consul_3  
						FROM		"AGENTES"  
						WHERE		( "AGENTES"."ESTADO" = 'A' ) AND  
									( "AGENTES"."DEPTO" = :ls_depto  or "AGENTES"."DEPTO" = :ls_depto2) AND  
									( "AGENTES"."COD_AGE" = :ls_cod_age_3 )
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if not isnull(ls_cod_age_consul_3) and ls_cod_age_consul_3<>'' then
								ll_res									= MessageBox("Advertencia", 'Esta seguro de Grabar Registro', Exclamation!, YesNo!, 2)
								dw_asignar.setitem(1,'usuario_crea',gs_user)
								dw_asignar.setitem(1,'estado',ls_estado)
								dw_asignar.accepttext()
								if ll_res = 1 then
									if dw_asignar.update() = 1 then
										commit using sqlca;
										if is_graba='MC' then
											ls_graba_mod		= wf_modf_cod_vtas(ls_base,ls_serie,ldb_numero)
										end if
										if ls_graba_mod='S' then
											messagebox("Grabar","Grabación Exitosa")
											close(w_comision_comp_asignacion)
											if isvalid(w_comision_compartida) then
												w_comision_compartida.pb_aceptar.triggerevent(clicked!)
											end if
										end if
									else
										rollback using sqlca;
										messagebox("Error Grabar","Error Grabar Comisiones Comisión Compartida Condolencia: "+sqlca.sqlerrtext)
									end if
								else
									messagebox("Grabar","Proceso Cancelado")
								end if
							else
								messagebox("Advertencia","Agente No Pertenece U.G.N.")
							end if
						end if
					else
						messagebox("Advertencia","Agente No Pertenece U.G.N.")
					end if
				end if
			else
				if isnull(ls_base) or ls_base='' then
					messagebox("Advertencia", "No Registra Base Promesa")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('base')
				elseif isnull(ls_serie) or ls_serie='' then
					messagebox("Advertencia", "No Registra Serie Promesa")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('serie')
				elseif isnull(ldb_numero) or ldb_numero=0 then
					messagebox("Advertencia", "No Registra Numero de Promesa")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('numero')
				elseif isnull(ls_origen) or ls_origen='' then
					messagebox("Advertencia", "No Registra Origen Venta")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('codigo_tipo_vta')
				elseif isnull(ldb_porc_age_orig) or ldb_porc_age_orig=0 then
					messagebox("Advertencia", "No Registra Porcentaje Agente Ventas")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_age_orig')
				elseif isnull(ldb_porc_sup_orig) or ldb_porc_sup_orig=0 then
					messagebox("Advertencia", "No Registra Porcentaje Supervisor Ventas")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_sup_orig')
				elseif isnull(ldb_porc_jef_orig) or ldb_porc_jef_orig=0 then
					messagebox("Advertencia", "No Registra Porcentaje Jefe Ventas")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_jefe_orig')
				elseif isnull(ldb_porc_age_1) or ldb_porc_age_1=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Agente Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_age_1')
				elseif isnull(ldb_porc_sup_1) or ldb_porc_sup_1=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Supervisor Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_sup_1')
				elseif isnull(ldb_porc_jef_1) or ldb_porc_jef_1=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Supervisor Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_jefe_1')
				elseif isnull(ls_cod_age_2) or ls_cod_age_2='' then
					messagebox("Advertencia", "Debe Ingresar Código Agente Unidad Generadora de Negocios")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_age_2')
				elseif isnull(ldb_porc_age_2) or ldb_porc_age_2=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Agente Unidad Generadora de Negocios")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_age_2')		
				elseif isnull(ls_cod_sup_2) or ls_cod_sup_2='' then
					messagebox("Advertencia", "Debe Ingresar Código Supervisor Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_sup_2')
				elseif isnull(ldb_porc_sup_2) or ldb_porc_sup_2=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Supervisor Ventas N.F.")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_sup_2')	
				elseif isnull(ls_cod_jef_2) or ls_cod_jef_2='' then
					messagebox("Advertencia", "Debe Ingresar Código Jefe Unidad Generadora de Negocios")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_jef_2')
				elseif isnull(ldb_porc_jef_2) or ldb_porc_jef_2=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Jefe Unidad Generadora de Negocios")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_jef_2')
				elseif isnull(ls_cod_age_3) or ls_cod_age_3='' then
					messagebox("Advertencia", "Debe Ingresar Código Agente Unidad Generadora de Negocios")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_age_3')
				elseif isnull(ldb_porc_age_3) or ldb_porc_age_3=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Agente Unidad Generadora de Negocios")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('porce_age_3')
				elseif isnull(ll_tipo_comis) or ll_tipo_comis=0 then
					messagebox("Advertencia", "Debe Ingresar Tipo Comisión Compartida")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('comision_compartida_tipo_condolencia')
				end if
			end if
		end if
	end if
else
	if isnull(ll_tipo_comis) or ll_tipo_comis=0 then
		if is_graba='MC' then
			ls_graba_mod		= wf_modf_cod_vtas(ls_base,ls_serie,ldb_numero)
		end if
		if ls_graba_mod='S' then
			messagebox("Grabar","Grabación Exitosa")
			close(w_comision_comp_asignacion)
			if isvalid(w_comision_compartida) then
				w_comision_compartida.pb_aceptar.triggerevent(clicked!)
			end if
		else
			messagebox("Advertencia", "Debe Ingresar Tipo Comisión Compartida")
			dw_asignar.setfocus()
			dw_asignar.setcolumn('comision_compartida_tipo_condolencia')
		end if 
	end if
end if
end event

type cb_cerrar from commandbutton within w_comision_comp_asignacion
integer x = 2505
integer y = 1172
integer width = 274
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_comp_asignacion)
end event

type cb_imprimir from commandbutton within w_comision_comp_asignacion
integer x = 2235
integer y = 1172
integer width = 274
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_asignar.rowcount() >0 then 
	f_Print( dw_asignar )
end if
end event

type dw_asignar from datawindow within w_comision_comp_asignacion
integer x = 18
integer y = 12
integer width = 2779
integer height = 1136
integer taborder = 40
string title = "none"
string dataobject = "dw_comision_compar_asig"
boolean border = false
end type

event clicked;String	ls_opcion,ls_columna,ls_age,ls_sup,ls_age3

ls_columna	= dwo.name
if ls_columna='p_1' or ls_columna='p_2' or ls_columna='p_3' or ls_columna='p_4' or ls_columna='p_5' or ls_columna='p_6' or ls_columna='p_7' then
	ls_age					= this.getitemstring(1,'cod_age_2')
	ls_sup					= this.getitemstring(1,'cod_sup_2')
	ls_age3					= this.getitemstring(1,'cod_age_3')
	
	if ls_columna = 'p_1' or ls_columna = 'p_5' then
		ls_opcion				= 'A2'
	elseif ls_columna = 'p_2' or ls_columna = 'p_6' then
		ls_opcion				= 'S2'
	elseif ls_columna = 'p_3' or ls_columna = 'p_7' then
		ls_opcion				= 'J2'
	elseif ls_columna = 'p_4'	 then
		ls_opcion				= 'A3'
	end if
	is_opcion					= ls_opcion
	if ls_columna='p_1' or ls_columna='p_5' then openwithparm(w_lista_codigos,ls_opcion)
	if ls_columna='p_2' or ls_columna='p_6' then openwithparm(w_lista_codigos,ls_opcion)
	if ls_columna='p_3' or ls_columna='p_7' then openwithparm(w_lista_codigos,ls_opcion)
	if ls_columna='p_4' then openwithparm(w_lista_codigos,ls_opcion)
end if
end event

event itemchanged;string		ls_columna,ls_orig_venta,ls_age,ls_estado,ls_jefe,ls_sup,ls_nulo,ls_canal,ls_depto
long		ll_nulo,ll_tipo_comis,ll_tot_reg,ll_grupo
double	ldb_porce_sup_2,ldb_factor_sup_2,ldb_factor_jefe_2,ldb_porce_jefe_2,&
			ldb_por_orig_age,ldb_por_orig_sup,ldb_por_orig_jef,&
			ldb_fac_age_1,ldb_fac_age_2,ldb_fac_age_3,ldb_por_age_1,ldb_por_age_2,ldb_por_age_3,&
			ldb_fac_sup_1,ldb_fac_sup_2,ldb_fac_jef_1,ldb_fac_jef_2,ldb_por_sup_1,ldb_por_sup_2,&
			ldb_por_jef_1,ldb_por_jef_2

if il_tot_lista=0 then
	this.accepttext()
	setnull(ls_nulo);setnull(ll_nulo)
	ls_orig_venta													= dw_asignar.getitemstring(1,'codigo_tipo_vta')
	ll_tipo_comis													= dw_asignar.getitemnumber(1,'comision_compartida_tipo_condolencia')
	ls_columna														= dwo.name
	if (ls_orig_venta = 'U' or ls_orig_venta = 'C' or ls_orig_venta = '3' or ls_orig_venta = 'E' or ls_orig_venta = '6') and ll_tipo_comis>0 then
		dw_porcentaje.dataobject								= 'dw_comision_comp_porce_condol'
		dw_porcentaje.settransobject(sqlca)	
		ll_tot_reg													= dw_porcentaje.retrieve(ls_orig_venta,ll_tipo_comis)
	else
		dw_porcentaje.dataobject								= 'dw_comision_comp_porce_condol'
		//dw_porcentaje.dataobject								= 'dw_comision_comp_porce'
		dw_porcentaje.settransobject(sqlca)
		if is_canal ='NI' then
			ls_orig_venta											= '5'
		elseif is_canal ='NF' then
			ls_orig_venta											= 'X'
		end if
		ll_tot_reg													= dw_porcentaje.retrieve(ls_orig_venta,2)	
	end if
	
	if ls_columna = 'comision_compartida_tipo_condolencia' then
		dw_asignar.setcolumn('cod_age_2')
		dw_asignar.setitem(1,'cod_age_2',ls_nulo)
		dw_asignar.setitem(1,'cod_age_3',ls_nulo)
		dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
		dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
		if ll_tipo_comis = 1 then
			dw_asignar.object.gb_2.text					= 'Asignación Jefe Ventas U.G.N.' 
			w_comision_comp_asignacion.height			= 1100
			dw_asignar.height									= 712
			cb_grabar.y											= 772
			cb_mod_cod_vtas.y								= 772
			cb_eliminar.y										= 772
			cb_limpiar.y											= 772
			cb_imprimir.y										= 772
			cb_cerrar.y											= 772
		elseif ll_tipo_comis = 2 then
			if ls_orig_venta='U' or ls_orig_venta='E' or ls_orig_venta='6' then
				dw_asignar.object.gb_2.text				= 'Asignación Agente U.G.N.' 
			elseif ls_orig_venta='C' then
				dw_asignar.object.gb_2.text				= 'Asignación Agente U.G.N.' 
			elseif ls_orig_venta='3' then
				dw_asignar.object.gb_2.text				= 'Asignación Agente Convenio'
			elseif ls_orig_venta='5' then
				dw_asignar.object.gb_2.text				= 'Asignación Agente Canal Funeraria'
			elseif ls_orig_venta='X' then
				dw_asignar.object.gb_2.text				= 'Asignación Agente Comparte'	
			end if
			w_comision_comp_asignacion.height			= 1300
			dw_asignar.height									= 936
			cb_grabar.y											= 960
			cb_mod_cod_vtas.y								= 960
			cb_eliminar.y										= 960
			cb_limpiar.y											= 960
			cb_imprimir.y										= 960
			cb_cerrar.y											= 960
		elseif ll_tipo_comis = 3 or ll_tipo_comis = 4 then
			dw_asignar.object.gb_2.text					= 'Asignación Maestro Ceremonia'
			dw_asignar.object.gb_3.text					= 'Asignación Agente U.G.N.'
			w_comision_comp_asignacion.height			= 1500
			dw_asignar.height									= 1148
			cb_grabar.y											= 1176
			cb_mod_cod_vtas.y								= 1176
			cb_eliminar.y										= 1176
			cb_limpiar.y											= 1176
			cb_imprimir.y										= 1176
			cb_cerrar.y											= 1176
		end if
		gf_centrar(w_comision_comp_asignacion)
		ldb_por_orig_age										= dw_asignar.getitemnumber(1,'porce_age_orig')
		ldb_por_orig_sup										= dw_asignar.getitemnumber(1,'porce_sup_orig')
		ldb_por_orig_jef										= dw_asignar.getitemnumber(1,'porce_jefe_orig')
		ldb_fac_age_1											= dw_porcentaje.getitemnumber(1,'porce_age_1')
		ldb_fac_age_2											= dw_porcentaje.getitemnumber(1,'porce_age_2')
		ldb_fac_age_3											= dw_porcentaje.getitemnumber(1,'porce_age_3')
		ldb_por_age_1											= ldb_por_orig_age * ldb_fac_age_1
		ldb_por_age_2											= ldb_por_orig_age * ldb_fac_age_2
		ldb_por_age_3											= ldb_por_orig_age * ldb_fac_age_3
		ldb_fac_sup_1											= dw_porcentaje.getitemnumber(1,'porce_sup_1')
		ldb_fac_sup_2											= dw_porcentaje.getitemnumber(1,'porce_sup_2')
		ldb_fac_jef_1											= dw_porcentaje.getitemnumber(1,'porce_jefe_1')
		ldb_fac_jef_2											= dw_porcentaje.getitemnumber(1,'porce_jefe_2')
		ldb_por_sup_1											= ldb_por_orig_sup * ldb_fac_sup_1
		ldb_por_sup_2											= ldb_por_orig_sup * ldb_fac_sup_2
		ldb_por_jef_1											= ldb_por_orig_jef * ldb_fac_jef_1
		ldb_por_jef_2											= ldb_por_orig_jef * ldb_fac_jef_2
		if ll_tipo_comis=1 then //100
			dw_asignar.object.cod_age_2.protect			= 1
			dw_asignar.object.cod_sup_2.protect			= 1
			dw_asignar.object.cod_jefe_2.protect		= 0
			dw_asignar.object.cod_age_3.protect			= 1
			dw_asignar.object.p_1.visible					= false
			dw_asignar.object.p_2.visible					= false
			dw_asignar.object.p_3.visible					= true
			dw_asignar.object.p_4.visible					= false
		elseif ll_tipo_comis=2 then //80-20
			dw_asignar.object.cod_age_2.protect			= 0
			dw_asignar.object.cod_sup_2.protect			= 0
			dw_asignar.object.cod_jefe_2.protect		= 0
			dw_asignar.object.cod_age_3.protect			= 1
			dw_asignar.object.p_1.visible					= true
			dw_asignar.object.p_2.visible					= true
			dw_asignar.object.p_3.visible					= true
			dw_asignar.object.p_4.visible					= false
		elseif ll_tipo_comis=3 or ll_tipo_comis=4 then //70-10-20/50-20-30
			dw_asignar.object.cod_age_2.protect			= 0
			dw_asignar.object.cod_sup_2.protect			= 0
			dw_asignar.object.cod_jefe_2.protect		= 0
			dw_asignar.object.cod_age_3.protect			= 0
			dw_asignar.object.p_1.visible					= true
			dw_asignar.object.p_2.visible					= true
			dw_asignar.object.p_3.visible					= true
			dw_asignar.object.p_4.visible					= true
		end if
		dw_asignar.setitem(1,'porce_age_1',ldb_por_age_1)
		dw_asignar.setitem(1,'porce_sup_1',ldb_por_sup_1)
		dw_asignar.setitem(1,'porce_jefe_1',ldb_por_jef_1)
		dw_asignar.setitem(1,'cod_age_2',ls_nulo)
		dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
		dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
		dw_asignar.setitem(1,'cod_age_3',ls_nulo)
		dw_asignar.setitem(1,'porce_age_2',ldb_por_age_2)
		dw_asignar.setitem(1,'porce_sup_2',ldb_por_sup_2)
		dw_asignar.setitem(1,'porce_jefe_2',ldb_por_jef_2)
		dw_asignar.setitem(1,'porce_age_3',ldb_por_age_3)
	elseif ls_columna = 'oferta_v_cod_age' or  ls_columna = 'cod_age_2' then
		if  ls_columna = 'oferta_v_cod_age' then
			ls_age												= dw_asignar.getitemstring(1,'oferta_v_cod_age')
			ll_grupo												= 1
		elseif ls_columna = 'cod_age_2' then
			ls_age												= dw_asignar.getitemstring(1,'cod_age_2')
			ll_grupo												= 2
		end if
		
		ls_orig_venta											= dw_asignar.getitemstring(1,'codigo_tipo_vta')
		ldb_por_orig_age										= dw_asignar.getitemnumber(1,'porce_age_orig')
		ldb_por_orig_sup										= dw_asignar.getitemnumber(1,'porce_sup_orig')
		ldb_por_orig_jef										= dw_asignar.getitemnumber(1,'porce_jefe_orig')
		if not isnull(ls_age) and ls_age<>'' then
			SELECT	DISTINCT "AGENTES"."ESTADO",	"AGENTES"."COD_SUP",	"AGENTES"."DEPTO",	"SUPERVISOR"."COD_JEFE", 	"AGENTES"."CANAL"
			INTO 		:ls_estado,					:ls_sup,		 				:ls_depto,				:ls_jefe,								:is_canal
			FROM 	"AGENTES","SUPERVISOR","JEFE_VENTAS"
			WHERE	( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
						( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS") and
						( "AGENTES"."COD_AGE" = :ls_age )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='A' then
					if is_canal ='NI' then
						ls_orig_venta							= '5'
					elseif is_canal ='NF' then
						ls_orig_venta							= 'X'
					end if
					ll_tot_reg									= dw_porcentaje.retrieve(ls_orig_venta,2)	
					if ls_orig_venta = '5' then
						if ls_depto <> 'M' then
							messagebox("Advertencia","Agente "+ls_age+" No Pertenece Canal Funerario")
							dw_asignar.setfocus()
							dw_asignar.setcolumn('cod_age_2')
							dw_asignar.setitem(1,'cod_age_2',ls_nulo)
							dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
							dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
							dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
							dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
						else
							if not isnull(ls_sup) and ls_sup<>'' then
								if ll_grupo= 1 then
									dw_asignar.setitem(1,'oferta_v_cod_sup',ls_sup)
								else
									dw_asignar.setitem(1,'cod_sup_2',ls_sup)
									ldb_factor_sup_2				= dw_porcentaje.getitemnumber(1,'porce_sup_2')
									ldb_porce_sup_2				= ldb_por_orig_sup * ldb_factor_sup_2
									dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
								end if
							end if
							if not isnull(ls_jefe) and ls_jefe<>'' then
								if ll_grupo= 1 then
									dw_asignar.setitem(1,'oferta_v_cod_jef',ls_jefe)
								else
									dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
									ldb_factor_jefe_2				= dw_porcentaje.getitemnumber(1,'porce_jefe_2')
									ldb_porce_jefe_2				= ldb_por_orig_jef * ldb_factor_jefe_2
									dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
								end if
							end if
						end if
					elseif ls_orig_venta = 'U' or ls_orig_venta = 'C' or ls_orig_venta = 'E' or ls_orig_venta = '6' then
						if ls_depto <> 'X' then
							messagebox("Advertencia","Agente "+ls_age+" No Pertenece U.G.N.")
							dw_asignar.setfocus()
							dw_asignar.setcolumn('cod_age_2')
							dw_asignar.setitem(1,'cod_age_2',ls_nulo)
							dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
							dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
							dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
							dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
						else
							if not isnull(ls_sup) and ls_sup<>'' then
								if ll_grupo= 1 then
									dw_asignar.setitem(1,'oferta_v_cod_sup',ls_sup)
								else
									dw_asignar.setitem(1,'cod_sup_2',ls_sup)
									ldb_factor_sup_2				= dw_porcentaje.getitemnumber(1,'porce_sup_2')
									ldb_porce_sup_2				= ldb_por_orig_sup * ldb_factor_sup_2
									dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
								end if
							end if
							if not isnull(ls_jefe) and ls_jefe<>'' then
								if ll_grupo= 1 then
									dw_asignar.setitem(1,'oferta_v_cod_jef',ls_jefe)
								else
									dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
									ldb_factor_jefe_2				= dw_porcentaje.getitemnumber(1,'porce_jefe_2')
									ldb_porce_jefe_2				= ldb_por_orig_jef * ldb_factor_jefe_2
									dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
								end if
							end if
						end if
					else
						if not isnull(ls_sup) and ls_sup<>'' then
							if ll_grupo= 1 then
								dw_asignar.setitem(1,'oferta_v_cod_sup',ls_sup)
							else
								dw_asignar.setitem(1,'cod_sup_2',ls_sup)
								ldb_factor_sup_2					= dw_porcentaje.getitemnumber(1,'porce_sup_2')
								ldb_porce_sup_2					= ldb_por_orig_sup * ldb_factor_sup_2
								dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
							end if
						end if
						if not isnull(ls_jefe) and ls_jefe<>'' then
							if ll_grupo= 1 then
								dw_asignar.setitem(1,'oferta_v_cod_jef',ls_jefe)
							else
								dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
								ldb_factor_jefe_2					= dw_porcentaje.getitemnumber(1,'porce_jefe_2')
								ldb_porce_jefe_2					= ldb_por_orig_jef * ldb_factor_jefe_2
								dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
							end if
						end if
					end if
				else
					messagebox("Advertencia","Agente "+ls_age+" Inactivo")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_age_2')
					dw_asignar.setitem(1,'cod_age_2',ls_nulo)
					dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
					dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
					dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
					dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
					dw_asignar.accepttext()
				end if
			end if
		else
			messagebox("Advertencia","Agente "+ls_age+" No Registra Información ")
			dw_asignar.setfocus()
			dw_asignar.setcolumn('cod_age_2')
			dw_asignar.setitem(1,'cod_age_2',ls_nulo)
			dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
			dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
			dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
			dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
			dw_asignar.accepttext()
		end if
	elseif ls_columna = 'cod_sup_2' or ls_columna = 'oferta_v_cod_sup' then
		if  ls_columna = 'oferta_v_cod_sup' then
			ls_sup												= dw_asignar.getitemstring(1,'oferta_v_cod_sup')
			ll_grupo												= 1
		elseif ls_columna = 'cod_sup_2' then
			ls_sup												= dw_asignar.getitemstring(1,'cod_sup_2')
			ll_grupo												= 2
		end if
		ls_sup													= dw_asignar.getitemstring(1,'cod_sup_2')
		ldb_por_orig_age										= dw_asignar.getitemnumber(1,'porce_age_orig')
		ldb_por_orig_sup										= dw_asignar.getitemnumber(1,'porce_sup_orig')
		ldb_por_orig_jef										= dw_asignar.getitemnumber(1,'porce_jefe_orig')
		if not isnull(ls_sup) and ls_sup <>'' then
			SELECT	DISTINCT "SUPERVISOR"."ESTADO",	"SUPERVISOR"."CANAL",	"SUPERVISOR"."DEPTO",	"SUPERVISOR"."COD_SUP",	"SUPERVISOR"."COD_JEFE"
			INTO 		:ls_estado,					:ls_canal,					:ls_depto,					:ls_sup,		 				:ls_jefe
			FROM 	"SUPERVISOR","JEFE_VENTAS"
			WHERE	( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS") and 
						( "SUPERVISOR"."COD_SUP" = :ls_sup )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='A' then
					if ls_orig_venta = '5' then
						if ls_canal <> 'NI' then
							messagebox("Advertencia","Supervisor "+ls_sup+" No Pertenece Canal Funerario")
							dw_asignar.setfocus()
							dw_asignar.setcolumn('cod_sup_2')
							dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
							dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
							dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
							dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
						else
							if not isnull(ls_sup) and ls_sup<>'' then
								if ll_grupo=1 then
									dw_asignar.setitem(1,'oferta_v_cod_sup',ls_sup)
								else
									dw_asignar.setitem(1,'cod_sup_2',ls_sup)
									ldb_factor_sup_2				= dw_porcentaje.getitemnumber(1,'porce_sup_2')
									ldb_porce_sup_2				= ldb_por_orig_sup * ldb_factor_sup_2
									dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
								end if
							end if
							if not isnull(ls_jefe) and ls_jefe<>'' then
								if ll_grupo=1 then
									dw_asignar.setitem(1,'oferta_v_cod_jef',ls_jefe)
								else
									dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
									ldb_factor_jefe_2				= dw_porcentaje.getitemnumber(1,'porce_jefe_2')
									ldb_porce_jefe_2				= ldb_por_orig_jef * ldb_factor_jefe_2
									dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
								end if
							end if
						end if
					elseif ls_orig_venta = 'U' or ls_orig_venta = 'E' or ls_orig_venta = '6'  then
						if ls_depto <> 'X' then
							messagebox("Advertencia","Supervisor "+ls_sup+" No Pertenece U.G.N.")
							dw_asignar.setfocus()
							dw_asignar.setcolumn('cod_sup_2')
							dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
							dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
							dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
							dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
						else
							if not isnull(ls_sup) and ls_sup<>'' then
								if ll_grupo=1 then
									dw_asignar.setitem(1,'oferta_v_cod_sup',ls_sup)
								else
									dw_asignar.setitem(1,'cod_sup_2',ls_sup)
									ldb_factor_sup_2				= dw_porcentaje.getitemnumber(1,'porce_sup_2')
									ldb_porce_sup_2				= ldb_por_orig_sup * ldb_factor_sup_2
									dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
								end if
							end if
							if not isnull(ls_jefe) and ls_jefe<>'' then
								if ll_grupo=1 then
									dw_asignar.setitem(1,'oferta_v_cod_jef',ls_jefe)
								else
									dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
									ldb_factor_jefe_2				= dw_porcentaje.getitemnumber(1,'porce_jefe_2')
									ldb_porce_jefe_2				= ldb_por_orig_jef * ldb_factor_jefe_2
									dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
								end if
							end if
						end if
					elseif ls_orig_venta = '3' or ls_orig_venta = 'C2' or ls_orig_venta = 'C3' then
						SELECT DISTINCT 	"SUPERVISOR"."ESTADO",	"SUPERVISOR"."CANAL",	"SUPERVISOR"."DEPTO",	"SUPERVISOR"."COD_JEFE"
						INTO 		:ls_estado,					:ls_canal,					:ls_depto,					:ls_jefe
						FROM 		"SUPERVISOR","JEFE_VENTAS"
						WHERE		( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS") and 
										( "SUPERVISOR"."DEPTO" = 'X' ) and
										( "SUPERVISOR"."ESTADO" = 'A' ) 
						USING		sqlca;
						if sqlca.sqlcode = 0 then
							if not isnull(ls_sup) and ls_sup<>'' then
								if ll_grupo=1 then
									dw_asignar.setitem(1,'oferta_v_cod_sup',ls_sup)
								else
									dw_asignar.setitem(1,'cod_sup_2',ls_sup)
									ldb_factor_sup_2				= dw_porcentaje.getitemnumber(1,'porce_sup_2')
									ldb_porce_sup_2				= ldb_por_orig_sup * ldb_factor_sup_2
									dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
								end if
							end if
							if not isnull(ls_jefe) and ls_jefe<>'' then
								if ll_grupo=1 then
									dw_asignar.setitem(1,'oferta_v_cod_jef',ls_jefe)
								else
									dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
									ldb_factor_jefe_2				= dw_porcentaje.getitemnumber(1,'porce_jefe_2')
									ldb_porce_jefe_2				= ldb_por_orig_jef * ldb_factor_jefe_2
									dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
								end if
							end if
						end if
					end if
				else
					messagebox("Advertencia","Supervisor "+ls_sup+" Inactivo")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_sup_2')
					dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
					dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
					dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
					dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
					dw_asignar.accepttext()
				end if
			end if
		else
			messagebox("Advertencia","Supervisor "+ls_sup+" No Registra Información ")
			dw_asignar.setfocus()
			dw_asignar.setcolumn('cod_sup_2')
			dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
			dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
			dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
			dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
			dw_asignar.accepttext()
		end if
	elseif ls_columna = 'cod_age_3' then
		ls_age													= dw_asignar.getitemstring(1,'cod_age_3')
		ldb_por_orig_age										= dw_asignar.getitemnumber(1,'porce_age_orig')
		ldb_por_orig_sup										= dw_asignar.getitemnumber(1,'porce_sup_orig')
		ldb_por_orig_jef										= dw_asignar.getitemnumber(1,'porce_jefe_orig')
		if not isnull(ls_age) and ls_age<>'' then
			SELECT DISTINCT	"AGENTES"."ESTADO",	"AGENTES"."COD_SUP",	"AGENTES"."DEPTO",	"SUPERVISOR"."COD_JEFE"
			INTO 		:ls_estado,				:ls_sup,		 			:ls_depto,				:ls_jefe
			FROM 	"AGENTES","SUPERVISOR","JEFE_VENTAS"
			WHERE	( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
						( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS") and 
						( "AGENTES"."COD_AGE" = :ls_age )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado='A' then
					if ls_depto <> 'X' then
						messagebox("Advertencia","Agente "+ls_age+" No Pertenece U.G.N.")
						dw_asignar.setfocus()
						dw_asignar.setcolumn('cod_age_3')
						dw_asignar.setitem(1,'cod_age_3',ls_nulo)
						dw_asignar.accepttext()
					end if
				else
					messagebox("Advertencia","Agente "+ls_age+" Inactivo")
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_age_3')
					dw_asignar.setitem(1,'cod_age_3',ls_nulo)
					dw_asignar.accepttext()
				end if
			end if
		else
			messagebox("Advertencia","Agente "+ls_age+" No Registra Información ")
			dw_asignar.setfocus()
			dw_asignar.setcolumn('cod_age_3')
			dw_asignar.setitem(1,'cod_age_3',ls_nulo)
			dw_asignar.accepttext()
		end if
	end if
end if
end event

type cb_mod_cod_vtas from commandbutton within w_comision_comp_asignacion
integer x = 325
integer y = 1172
integer width = 503
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Modif. Cód.Ventas"
end type

event clicked;string	ls_nulo

setnull(ls_nulo)

dw_asignar.object.p_5.visible							= true
dw_asignar.object.p_6.visible							= true
dw_asignar.object.p_7.visible							= true


dw_asignar.setitem(1,"oferta_v_cod_age",ls_nulo)
dw_asignar.setitem(1,"oferta_v_cod_sup",ls_nulo)
dw_asignar.setitem(1,"oferta_v_cod_jef",ls_nulo)

dw_asignar.object.oferta_v_cod_age.protect		= 0
dw_asignar.object.oferta_v_cod_sup.protect		= 0
dw_asignar.object.oferta_v_cod_jef.protect			= 0


dw_asignar.setfocus()
dw_asignar.setcolumn('oferta_v_cod_age')
dw_asignar.accepttext()

is_graba														= 'MC'		//MODIFICA_CODIGO_VENTAS

end event

