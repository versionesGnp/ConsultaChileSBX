forward
global type w_genera_deveng_comisiones from window
end type
type cb_estatus_comi from commandbutton within w_genera_deveng_comisiones
end type
type cb_cerrar from commandbutton within w_genera_deveng_comisiones
end type
type cb_borrar from commandbutton within w_genera_deveng_comisiones
end type
type cb_grabar from commandbutton within w_genera_deveng_comisiones
end type
type cb_calc_deveng from commandbutton within w_genera_deveng_comisiones
end type
type dw_detalle from datawindow within w_genera_deveng_comisiones
end type
type cb_cta_cte from commandbutton within w_genera_deveng_comisiones
end type
type cb_limpiar from commandbutton within w_genera_deveng_comisiones
end type
type pb_imprimir from picturebutton within w_genera_deveng_comisiones
end type
type pb_filtrar from picturebutton within w_genera_deveng_comisiones
end type
type pb_ordenar from picturebutton within w_genera_deveng_comisiones
end type
type pb_exportar from picturebutton within w_genera_deveng_comisiones
end type
type dw_lista from datawindow within w_genera_deveng_comisiones
end type
type gb_1 from groupbox within w_genera_deveng_comisiones
end type
end forward

global type w_genera_deveng_comisiones from window
integer width = 3707
integer height = 1816
boolean titlebar = true
string title = "Ingreso Manual Comisiones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_calcular ( )
cb_estatus_comi cb_estatus_comi
cb_cerrar cb_cerrar
cb_borrar cb_borrar
cb_grabar cb_grabar
cb_calc_deveng cb_calc_deveng
dw_detalle dw_detalle
cb_cta_cte cb_cta_cte
cb_limpiar cb_limpiar
pb_imprimir pb_imprimir
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_exportar pb_exportar
dw_lista dw_lista
gb_1 gb_1
end type
global w_genera_deveng_comisiones w_genera_deveng_comisiones

type variables
long il_row
end variables

forward prototypes
public function double wf_porce_venta (string as_base, string as_serie, long al_numero)
public subroutine wf_calculo ()
end prototypes

event ue_calcular();string		ls_base,ls_serie
long		ll_tot_reg,ll_indi,ll_existe,ll_new
double	ldb_numero

dw_lista.dataobject						= 'dw_genera_deveng_comisiones'
dw_lista.settransobject(sqlca)
ls_base										= substr(1,1,Message.StringParm)
gs_base										= ls_base
if ls_base = 'O' then
	dw_detalle.dataobject				= 'dw_lista_contratos_sin_agrupar_faltantes'
	dw_detalle.settransobject(sqlca)
elseif ls_base = 'L' then
	dw_detalle.dataobject				= 'dw_lista_contratos_sin_agrupar_falta_lib'
	dw_detalle.settransobject(sqlca)
elseif ls_base = 'A' then
	dw_detalle.dataobject				= 'dw_lista_contratos_sin_agrupar_falta_aum'
	dw_detalle.settransobject(sqlca)
end if
ll_tot_reg									= dw_detalle.retrieve()
if ll_tot_reg>0 then
	dw_lista.object.t_titulo.text 			= gs_conexion
	dw_lista.object.t_usuario.text		= gs_user
	SetPointer(HourGlass!)
	for ll_indi = 1 to ll_tot_reg
		ls_serie								= dw_detalle.getitemstring(ll_indi,'cadena_serie')
		ldb_numero							= dw_detalle.getitemnumber(ll_indi,'cadena_numero')
		SELECT	count("COMISION_PROMESA"."BASE")  
		INTO 		:ll_existe  
		FROM "COMISION_PROMESA"  
		WHERE ( "COMISION_PROMESA"."BASE" = :ls_base ) AND  
				( "COMISION_PROMESA"."SERIE" = :ls_serie ) AND  
				( "COMISION_PROMESA"."NUMERO" = :ldb_numero )    
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			if isnull(ll_existe) or ll_existe=0 then
				ll_new						= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,'base',ls_base)
				dw_lista.setitem(ll_new,'serie',ls_serie)
				dw_lista.setitem(ll_new,'numero',ldb_numero)
			end if
		end if
	next
	SetPointer(Arrow!)
else
	messagebox("Advertencia","No Registra Datos")
end if
end event

public function double wf_porce_venta (string as_base, string as_serie, long al_numero);double	ldb_porce_venta
//wf_porce_venta(as_base,as_serie,al_numero)
CHOOSE CASE as_base
	CASE 'O'
		SELECT	"OFERTA_V"."PORCE_VENTA"
		INTO 		:ldb_porce_venta
		FROM 		"CADENA",   
					"OFERTA_V",   
					"PAGO_OFERTA"  
		WHERE 	( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
					( "CADENA"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ESTATUS_COMISION" = '1') AND
					(( "CADENA"."ESTADO" = 'V' ) OR ( "CADENA"."ESTADO" = 'C' )) AND
					( ( "CADENA"."CODIGO" = :as_base ) AND  
					( "CADENA"."SERIE" = :as_serie ) AND  
					( "CADENA"."NUMERO" = :al_numero ) ) 
		Using		sqlca;

	CASE 'A'
		SELECT	"ANEXO_AUMENTO"."PORCE_AGE"
		INTO 		:ldb_porce_venta
		FROM 		"CADENA",   
					"ANEXO_AUMENTO",   
					"PAGO_AUMENTO"  
		WHERE 	( "PAGO_AUMENTO"."SERIE_M" = "ANEXO_AUMENTO"."SERIE_M" ) and  
					( "PAGO_AUMENTO"."NRO_AUMENTO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
					( "PAGO_AUMENTO"."FOLIO" = "ANEXO_AUMENTO"."ULT_FOLIO" ) and  
					( "CADENA"."SERIE" = "PAGO_AUMENTO"."SERIE_M" ) and  
					( "CADENA"."NUMERO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
					( "ANEXO_AUMENTO"."ESTATUS_COMISION" = '1') AND
					(( "CADENA"."ESTADO" = 'V' ) OR 
					( "CADENA"."ESTADO" = 'C' )) AND
					( ( "CADENA"."CODIGO" = :as_base ) AND  
					( "CADENA"."SERIE" = :as_serie ) AND  
					( "CADENA"."NUMERO" = :al_numero ) ) 
		Using		sqlca;

	CASE 'L'
		SELECT	"ANEXO_LIBERADOR"."PORCE_AGE"
		INTO 		:ldb_porce_venta
		FROM 		"ANEXO_LIBERADOR",   
					"CADENA",   
					"PAGO_LIBERADOR"  
		WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
					( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
					( "CADENA"."SERIE" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					( "ANEXO_LIBERADOR"."ESTATUS_COMISION" = '1') AND
					( "CADENA"."NUMERO" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
					(( "CADENA"."ESTADO" = 'V' ) OR 
					( "CADENA"."ESTADO" = 'C' )) AND
					( ( "CADENA"."CODIGO" = :as_base ) AND  
					( "CADENA"."SERIE" = :as_serie ) AND  
					( "CADENA"."NUMERO" = :al_numero ) )   
		Using		sqlca;
END CHOOSE
if isnull(ldb_porce_venta) then ldb_porce_venta=0
Return ldb_porce_venta
end function

public subroutine wf_calculo ();string		ls_base,ls_serie
long		ll_tot_reg,ll_indi,ll_existe,ll_new
double	ldb_numero

dw_lista.dataobject						= 'dw_genera_deveng_comisiones'
dw_lista.settransobject(sqlca)
ls_base										= substr(1,1,Message.StringParm)
gs_base										= ls_base
if ls_base = 'O' then
	dw_detalle.dataobject				= 'dw_lista_contratos_sin_agrupar_faltantes'
	dw_detalle.settransobject(sqlca)
elseif ls_base = 'L' then
	dw_detalle.dataobject				= 'dw_lista_contratos_sin_agrupar_falta_lib'
	dw_detalle.settransobject(sqlca)
elseif ls_base = 'A' then
	dw_detalle.dataobject				= 'dw_lista_contratos_sin_agrupar_falta_aum'
	dw_detalle.settransobject(sqlca)
end if
ll_tot_reg									= dw_detalle.retrieve()
if ll_tot_reg>0 then
	dw_lista.object.t_titulo.text 			= gs_conexion
	dw_lista.object.t_usuario.text		= gs_user
	SetPointer(HourGlass!)
	for ll_indi = 1 to ll_tot_reg
		ls_serie								= dw_detalle.getitemstring(ll_indi,'cadena_serie')
		ldb_numero							= dw_detalle.getitemnumber(ll_indi,'cadena_numero')
		SELECT	count("COMISION_PROMESA"."BASE")  
		INTO 		:ll_existe  
		FROM "COMISION_PROMESA"  
		WHERE ( "COMISION_PROMESA"."BASE" = :ls_base ) AND  
				( "COMISION_PROMESA"."SERIE" = :ls_serie ) AND  
				( "COMISION_PROMESA"."NUMERO" = :ldb_numero )    
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			if isnull(ll_existe) or ll_existe=0 then
				ll_new						= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,'base',ls_base)
				dw_lista.setitem(ll_new,'serie',ls_serie)
				dw_lista.setitem(ll_new,'numero',ldb_numero)
			end if
		end if
	next
	SetPointer(Arrow!)
else
	messagebox("Advertencia","No Registra Datos")
end if
end subroutine

on w_genera_deveng_comisiones.create
this.cb_estatus_comi=create cb_estatus_comi
this.cb_cerrar=create cb_cerrar
this.cb_borrar=create cb_borrar
this.cb_grabar=create cb_grabar
this.cb_calc_deveng=create cb_calc_deveng
this.dw_detalle=create dw_detalle
this.cb_cta_cte=create cb_cta_cte
this.cb_limpiar=create cb_limpiar
this.pb_imprimir=create pb_imprimir
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_exportar=create pb_exportar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_estatus_comi,&
this.cb_cerrar,&
this.cb_borrar,&
this.cb_grabar,&
this.cb_calc_deveng,&
this.dw_detalle,&
this.cb_cta_cte,&
this.cb_limpiar,&
this.pb_imprimir,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_exportar,&
this.dw_lista,&
this.gb_1}
end on

on w_genera_deveng_comisiones.destroy
destroy(this.cb_estatus_comi)
destroy(this.cb_cerrar)
destroy(this.cb_borrar)
destroy(this.cb_grabar)
destroy(this.cb_calc_deveng)
destroy(this.dw_detalle)
destroy(this.cb_cta_cte)
destroy(this.cb_limpiar)
destroy(this.pb_imprimir)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_exportar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_genera_deveng_comisiones)
wf_calculo()

end event

type cb_estatus_comi from commandbutton within w_genera_deveng_comisiones
integer x = 1239
integer y = 1504
integer width = 421
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Estatus Comis."
end type

event clicked;string	ls_canal,ls_status
long		ll_tot_reg,ll_indi,ll_estado

if gs_base='O' then
	dw_lista.dataobject				= 'dw_modifica_estatus_comi'
	dw_lista.settransobject(sqlca)
elseif gs_base='L' then
	dw_lista.dataobject				= 'dw_modifica_estatus_comi_lib'
	dw_lista.settransobject(sqlca)
end if

ll_tot_reg								= dw_lista.retrieve()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Dato")
else
	for ll_indi=1 to ll_tot_reg
		ls_canal							= dw_lista.getitemstring(ll_indi,'agentes_canal')
		ll_estado							= dw_lista.getitemnumber(ll_indi,'c_ok')
		if ls_canal='NF' then
			ls_status 					= '1'
		else
			ls_status 					= '0'
		end if
		if gs_base='O' then
			dw_lista.setitem(ll_indi,'oferta_v_estatus_comision',ls_status)
		elseif gs_base='L' then
			dw_lista.setitem(ll_indi,'anexo_liberador_estatus_comision',ls_status)
		end if
		if (ls_canal='NF' and ls_status='1') or (ls_canal='NI' and ls_status='0') then
			dw_lista.setitem(ll_indi,'c_ok',1)
		else
			dw_lista.setitem(ll_indi,'c_ok',0)
		end if
	next
	dw_lista.accepttext()
end if
	
end event

type cb_cerrar from commandbutton within w_genera_deveng_comisiones
integer x = 3310
integer y = 1504
integer width = 293
integer height = 108
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_genera_deveng_comisiones)
end event

type cb_borrar from commandbutton within w_genera_deveng_comisiones
integer x = 370
integer y = 1504
integer width = 375
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Borrar Regist."
end type

event clicked;long	ll_new
dw_lista.reset()
ll_new	= dw_lista.insertrow(0)
dw_lista.scrolltorow(ll_new)
dw_lista.setitem(ll_new,'estado_valor',0)
dw_lista.setitem(ll_new,'estado_grabar',0)
dw_lista.setfocus()
dw_lista.setcolumn('base')

end event

type cb_grabar from commandbutton within w_genera_deveng_comisiones
integer x = 73
integer y = 1504
integer width = 297
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_base,ls_serie
long		ll_tot_reg,ll_indi,ll_estado_grabar,ll_sum_graba=0,ll_res
double	ldb_numero,ldb_c_pie,ldb_c_pri,ldb_c_seg,ldb_c_ter,ldb_c_cua,ldb_c_qui,ldb_c_sex,ldb_c_sep,ldb_c_oct,ldb_c_nov

ll_tot_reg							= dw_lista.rowcount()
if ll_tot_reg > 0 then
	SetPointer(HourGlass!)
	if dw_lista.dataobject='dw_modifica_estatus_comi' or dw_lista.dataobject='dw_modifica_estatus_comi_lib' then
		ll_res							= MessageBox("Advertencia", 'Desea Grabar Estatus Comisión', Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			if dw_lista.update() = 1 then
				commit using sqlca;
				messagebox("Grabar","Grabación Exitosa")
				dw_lista.reset()
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Estatus Comisión: "+sqlca.sqlerrtext)
			end if
		end if
	elseif dw_lista.dataobject='dw_genera_deveng_comisiones' then
		ll_res					= MessageBox("Advertencia", 'Desea Grabar Devengamiento Contratos', Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			for ll_indi = 1 to ll_tot_reg
				ls_base				= dw_lista.getitemstring(ll_indi,'base')
				ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
				ldb_numero			= dw_lista.getitemnumber(ll_indi,'numero')
				ldb_c_pie			= double(dw_lista.getitemnumber(ll_indi,'c_pie'))
				ldb_c_pri				= double(dw_lista.getitemnumber(ll_indi,'c_primera'))
				ldb_c_seg			= double(dw_lista.getitemnumber(ll_indi,'c_segunda'))
				ldb_c_ter				= double(dw_lista.getitemnumber(ll_indi,'c_tercera'))
				ldb_c_cua			= double(dw_lista.getitemnumber(ll_indi,'c_cuarta'))
				ldb_c_qui			= double(dw_lista.getitemnumber(ll_indi,'c_quinta'))
				ldb_c_sex			= double(dw_lista.getitemnumber(ll_indi,'c_sexta'))
				ldb_c_sep			= double(dw_lista.getitemnumber(ll_indi,'c_septima'))
				ldb_c_oct			= double(dw_lista.getitemnumber(ll_indi,'c_octava'))
				ldb_c_nov			= double(dw_lista.getitemnumber(ll_indi,'c_novena'))
				ll_estado_grabar	= dw_lista.getitemnumber(ll_indi,'estado_grabar')
				
				if (ldb_c_pie=0 or isnull(ldb_c_pie)) and (ldb_c_pri=0 or isnull(ldb_c_pri)) and (ldb_c_seg=0 or isnull(ldb_c_seg)) and &
					(ldb_c_ter=0 or isnull(ldb_c_ter)) and (ldb_c_cua=0 or isnull(ldb_c_cua)) and (ldb_c_qui=0 or isnull(ldb_c_qui)) and &
					(ldb_c_sex=0 or isnull(ldb_c_sex)) and (ldb_c_sep=0 or isnull(ldb_c_sep)) and (ldb_c_oct=0 or isnull(ldb_c_oct)) and &
					(ldb_c_nov=0 or isnull(ldb_c_nov)) then
					dw_lista.deleterow(ll_indi)
					ll_tot_reg		= ll_tot_reg - 1
					ll_indi			= ll_indi - 1
				else
					if ll_estado_grabar=1 then //update
						UPDATE "COMISION_PROMESA"  
						SET 	"BASE" 			= :ls_base,   
								"SERIE" 			= :ls_serie,   
								"NUMERO" 		= :ldb_numero,   
								"C_PIE" 			= :ldb_c_pie,   
								"C_PRIMERA" 	= :ldb_c_pri,   
								"C_SEGUNDA" 	= :ldb_c_seg,   
								"C_TERCERA" 	= :ldb_c_ter,   
								"C_CUARTA" 	= :ldb_c_cua,   
								"C_QUINTA" 	= :ldb_c_qui,   
								"C_SEXTA" 		= :ldb_c_sex,
								"C_SEPTIMA"	= :ldb_c_sep,  
								"C_OCTAVA"	= :ldb_c_oct,
								"C_NOVENA"	= :ldb_c_nov  
						WHERE "COMISION_PROMESA"."BASE" = :ls_base AND  
								"COMISION_PROMESA"."SERIE" = :ls_serie AND  
								"COMISION_PROMESA"."NUMERO" = :ldb_numero   
						USING	sqlca ;
						if sqlca.sqlcode=0 then
							commit;
							ll_sum_graba ++
						else
							rollback;
						end if
					elseif ll_estado_grabar=2 then //insert
						INSERT INTO "COMISION_PROMESA"  
									( "BASE",	"SERIE",		"NUMERO",	"C_PIE",		"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA" )  
						VALUES 	( :ls_base,	:ls_serie,	:ldb_numero,	:ldb_c_pie, :ldb_c_pri,		:ldb_c_seg,		:ldb_c_ter,		:ldb_c_cua,	:ldb_c_qui,	:ldb_c_sex,	:ldb_c_sep,		:ldb_c_oct,	:ldb_c_nov )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_sum_graba ++
						else
							rollback;
						end if
					end if
				end if
			next
			if ll_sum_graba > 0 then
				messagebox("Grabar","Grabación Exitosa")
				dw_lista.reset()
			else
				messagebox("Advertencia","No Registró dato Válido para Grabar")
			end if
		end if
	end if
	SetPointer(Arrow!)
end if
end event

type cb_calc_deveng from commandbutton within w_genera_deveng_comisiones
integer x = 1664
integer y = 1504
integer width = 411
integer height = 108
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Calculo Deveng."
end type

event clicked;String		ls_area,ls_forma_pago,ls_tipo_cons,ls_base,ls_serie
Long		ll_indi,ll_cod_parque,ll_plazo,ll_tot_reg,ll_correl
Double	ldb_numero,ldb_cta_pie,ldb_cta_1,ldb_cta_2,ldb_cta_3,ldb_cta_4,ldb_cta_5,ldb_cta_6,ldb_cta_7,ldb_cta_8,ldb_cta_9,&
			ldb_precio,ldb_pie,ldb_pie_porc,ldb_valor_cta,ldb_tot_por,ldb_porce_venta,&
			ldb_c_pie,ldb_c_pri,ldb_c_seg,ldb_c_ter,ldb_c_cua,ldb_c_qui,ldb_c_sex,ldb_c_sep,ldb_c_oct,ldb_c_nov,&
			ldb_c_pie_aux,ldb_c_pri_aux,ldb_c_seg_aux,ldb_c_ter_aux,ldb_c_cua_aux,ldb_c_qui_aux,ldb_c_sex_aux,&
			ldb_c_sep_aux,ldb_c_oct_aux,ldb_c_nov_aux

SetPointer(HourGlass!)
wf_calculo()
ll_tot_reg								= dw_lista.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ldb_tot_por						= dw_lista.getitemnumber(ll_indi,'tot_porcen')
		ls_base							= dw_lista.getitemstring(ll_indi,'base')
		ls_serie							= dw_lista.getitemstring(ll_indi,'serie')
		ldb_numero						= dw_lista.getitemnumber(ll_indi,'numero')
		if (ls_base<>'' or not isnull(ls_base)) and (ls_serie<>'' or not isnull(ls_serie)) and ldb_numero > 0 then
			dw_lista.setitem(ll_indi,'estado_valor',0)
			SELECT	"C_PIE",			"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA"
			INTO 		:ldb_cta_pie,	:ldb_cta_1,		:ldb_cta_2,		:ldb_cta_3,		:ldb_cta_4,	:ldb_cta_5,	:ldb_cta_6,	:ldb_cta_7,		:ldb_cta_8,	:ldb_cta_9  
			FROM 	"COMISION_PROMESA"  
			WHERE	"COMISION_PROMESA"."BASE" = :ls_base AND  
					 	"COMISION_PROMESA"."SERIE" = :ls_serie AND  
					 	"COMISION_PROMESA"."NUMERO" = :ldb_numero   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_indi,'estado_grabar',1)
				dw_lista.setitem(ll_indi,'c_pie',ldb_cta_pie)
				dw_lista.setitem(ll_indi,'c_primera',ldb_cta_1)
				dw_lista.setitem(ll_indi,'c_segunda',ldb_cta_2)
				dw_lista.setitem(ll_indi,'c_tercera',ldb_cta_3)
				dw_lista.setitem(ll_indi,'c_cuarta',ldb_cta_4)
				dw_lista.setitem(ll_indi,'c_quinta',ldb_cta_5)
				dw_lista.setitem(ll_indi,'c_sexta',ldb_cta_6)
				dw_lista.setitem(ll_indi,'c_septima',ldb_cta_7)
				dw_lista.setitem(ll_indi,'c_octava',ldb_cta_8)
				dw_lista.setitem(ll_indi,'c_novena',ldb_cta_9)
				dw_lista.accepttext()
			elseif sqlca.sqlcode=100 then
				//messagebox("Advertencia","Ctto. NO existe en Tabla COMISION_PROMESA, se definirá automáticamente")
				CHOOSE CASE ls_base
					CASE 'O'
						SELECT	"PAGO_OFERTA"."AREA",	"OFERTA_V"."FORMA_PAGO",	"OFERTA_V"."TIPO_CONS",	"PAGO_OFERTA"."PRECIO",	"PAGO_OFERTA"."NRO_CUOTAS",	"PAGO_OFERTA"."VALOR_CUOTA",	"PAGO_OFERTA"."PIE",	"CADENA"."COD_PARQUE"
						INTO 		:ls_area,					:ls_forma_pago,				:ls_tipo_cons,				:ldb_precio,				:ll_plazo,							:ldb_valor_cta,					:ldb_pie,				:ll_cod_parque
						FROM 		"CADENA","OFERTA_V","PAGO_OFERTA"  
						WHERE 	"PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" and  
									"PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" and  
									"PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" and  
									"CADENA"."SERIE" = "PAGO_OFERTA"."SERIE" and  
									"CADENA"."NUMERO" = "PAGO_OFERTA"."NRO_OFERTA" and  
									"OFERTA_V"."ESTATUS_COMISION" = '1' AND
									( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C' ) AND
									"CADENA"."CODIGO" = :ls_base AND  
									"CADENA"."SERIE" = :ls_serie AND  
									"CADENA"."NUMERO" = :ldb_numero 
						USING		sqlca;
					CASE 'A'
						SELECT	"ANEXO_AUMENTO"."AREA",	"ANEXO_AUMENTO"."FORMA_PAGO",	"ANEXO_AUMENTO"."TIPO_SEPULT",	"PAGO_AUMENTO"."PRECIO",	"PAGO_AUMENTO"."NRO_CUOTAS",	"PAGO_AUMENTO"."VALOR_CUOTA",	"PAGO_AUMENTO"."PIE",	"CADENA"."COD_PARQUE"
						INTO 		:ls_area,					:ls_forma_pago						:ls_tipo_cons,							:ldb_precio,					:ll_plazo,							:ldb_valor_cta,					:ldb_pie,					:ll_cod_parque
						FROM 		"CADENA","ANEXO_AUMENTO","PAGO_AUMENTO"  
						WHERE 	"PAGO_AUMENTO"."SERIE_M" = "ANEXO_AUMENTO"."SERIE_M" and  
									"PAGO_AUMENTO"."NRO_AUMENTO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
									"PAGO_AUMENTO"."FOLIO" = "ANEXO_AUMENTO"."ULT_FOLIO" and  
									"CADENA"."SERIE" = "PAGO_AUMENTO"."SERIE_M" and  
									"CADENA"."NUMERO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
									"ANEXO_AUMENTO"."ESTATUS_COMISION" = '1' AND
									( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C' ) AND
									"CADENA"."CODIGO" = :ls_base AND  
									"CADENA"."SERIE" = :ls_serie AND  
									"CADENA"."NUMERO" = :ldb_numero 
						USING		sqlca;
					CASE 'L'
						SELECT	'X',			"ANEXO_LIBERADOR"."FORMA_PAGO",	'X',				"PAGO_LIBERADOR"."PRECIO",	"PAGO_LIBERADOR"."NRO_CUOTAS",	"PAGO_LIBERADOR"."PIE",	"CADENA"."COD_PARQUE",	"PAGO_LIBERADOR"."VALOR_CUOTA"   
						INTO 		:ls_area,	:ls_forma_pago,						:ls_tipo_cons,	:ldb_precio,					:ll_plazo,								:ldb_pie,					:ll_cod_parque,			:ldb_valor_cta
						FROM 		"ANEXO_LIBERADOR","CADENA","PAGO_LIBERADOR"  
						WHERE		"ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" and  
									"ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" and  
									"ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" and  
									"CADENA"."SERIE" = "PAGO_LIBERADOR"."SERIE_M" and  
									"ANEXO_LIBERADOR"."ESTATUS_COMISION" = '1' AND
									"CADENA"."NUMERO" = "PAGO_LIBERADOR"."NRO_LIBERADOR" and  
									( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C' ) AND
									"CADENA"."CODIGO" = :ls_base AND  
									"CADENA"."SERIE" = :ls_serie AND  
									"CADENA"."NUMERO" = :ldb_numero   
						USING		sqlca;
				END CHOOSE	
				if sqlca.sqlcode = 0 then
					if ldb_precio>0 then
						if ldb_pie = 0 and ll_plazo = 1 then
							ldb_pie_porc	= round(((ldb_valor_cta * 100) / ldb_precio),2)
						else
							ldb_pie_porc	= round(((ldb_pie * 100) / ldb_precio),2)
						end if
					else
						ldb_pie_porc		= 0
					end if
					setnull(ldb_c_pie);setnull(ldb_c_pri);setnull(ldb_c_seg);setnull(ldb_c_ter);setnull(ldb_c_cua);&
					setnull(ldb_c_qui);setnull(ldb_c_sex);setnull(ldb_c_sep);setnull(ldb_c_oct);setnull(ldb_c_nov)
					if ldb_pie_porc < 10 then
						SELECT	"CORRELATIVO",	"C_PIE",		"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA"  	AS PORCENTAJE    
						INTO 		:ll_correl,		:ldb_c_pie,	:ldb_c_pri,		:ldb_c_seg,		:ldb_c_ter,		:ldb_c_cua,	:ldb_c_qui,	:ldb_c_sex,	:ldb_c_sep,		:ldb_c_oct,	:ldb_c_nov
						FROM 		"PORCENTAJE_COMISIONES"  
						WHERE  	( "PIE_MIN" <= :ldb_pie_porc AND "PIE_MAX" >= :ldb_pie_porc) AND  
									"AREA" = :ls_area AND
									"T_CONS" = :ls_tipo_cons AND
									( "CREDITO_MIN" <= :ll_plazo AND "CREDITO" >= :ll_plazo ) AND
									( "C_PIE"+"C_PRIMERA"+"C_SEGUNDA"+"C_TERCERA"+"C_CUARTA"+"C_QUINTA"+"C_SEXTA"+"C_SEPTIMA"+"C_OCTAVA"+"C_NOVENA" ) > 0 and 
									"COD_PARQUE" = :ll_cod_parque
						USING		sqlca;
					elseif ldb_pie_porc >= 10 then
						SELECT	"CORRELATIVO",	"C_PIE",		"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA"  	AS PORCENTAJE    
						INTO 		:ll_correl,		:ldb_c_pie,	:ldb_c_pri,		:ldb_c_seg,		:ldb_c_ter,		:ldb_c_cua,	:ldb_c_qui,	:ldb_c_sex,	:ldb_c_sep,		:ldb_c_oct,	:ldb_c_nov
						FROM 		"PORCENTAJE_COMISIONES"  
						WHERE		( "PIE_MIN" <= :ldb_pie_porc AND "PIE_MAX" >= :ldb_pie_porc) AND  
									"AREA" = :ls_area AND
									"T_CONS" = :ls_tipo_cons AND
									( "C_PIE"+"C_PRIMERA"+"C_SEGUNDA"+"C_TERCERA"+"C_CUARTA"+"C_QUINTA"+"C_SEXTA"+"C_SEPTIMA"+"C_OCTAVA"+"C_NOVENA" ) > 0 and 
									"COD_PARQUE" = :ll_cod_parque
						USING		sqlca;
					end if
					if sqlca.sqlcode = 0 and not isnull(ll_correl) then
						dw_lista.setitem(ll_indi,'c_pie',ldb_c_pie)
						dw_lista.setitem(ll_indi,'c_primera',ldb_c_pri)
						dw_lista.setitem(ll_indi,'c_segunda',ldb_c_seg)
						dw_lista.setitem(ll_indi,'c_tercera',ldb_c_ter)
						dw_lista.setitem(ll_indi,'c_cuarta',ldb_c_cua)
						dw_lista.setitem(ll_indi,'c_quinta',ldb_c_qui)
						dw_lista.setitem(ll_indi,'c_sexta',ldb_c_sex)
						dw_lista.setitem(ll_indi,'c_septima',ldb_c_sep)
						dw_lista.setitem(ll_indi,'c_octava',ldb_c_oct)
						dw_lista.setitem(ll_indi,'c_novena',ldb_c_nov)
						dw_lista.setitem(ll_indi,'estado_grabar',2)
						dw_lista.accepttext()
					else
						messagebox("Advertencia","No Registra Definición")
					end if
				else
					messagebox("Advertencia","No existe Promesa, el Estado es distino a Vgte./Cancel o Comisión Antigua")
					dw_lista.setitem(ll_indi,'estado_valor',1)
				end if
				
				ldb_porce_venta			= wf_porce_venta(ls_base,ls_serie,ldb_numero)
				ldb_tot_por					= dw_lista.getitemnumber(ll_indi,'tot_porcen')
//				if ((ls_base='O' or ls_base='A') and ldb_tot_por>ldb_porce_venta) or (ls_base='L' and ldb_tot_por>ldb_porce_venta) then
//					messagebox("Advertencia","La Suma Total % Sobrepasan al Tope Máximo de Comisión, serán cambiados a sus Valores Originales")
//					CHOOSE CASE ls_base
//						CASE 'O'
//							SELECT	"PAGO_OFERTA"."AREA",	"OFERTA_V"."FORMA_PAGO",	"OFERTA_V"."TIPO_CONS",	"PAGO_OFERTA"."PRECIO",	"PAGO_OFERTA"."NRO_CUOTAS",	"PAGO_OFERTA"."VALOR_CUOTA",	"PAGO_OFERTA"."PIE",	"CADENA"."COD_PARQUE"	
//							INTO 		:ls_area,					:ls_forma_pago,				:ls_tipo_cons,				:ldb_precio,				:ll_plazo,							:ldb_valor_cta,					:ldb_pie,				:ll_cod_parque
//							FROM 		"CADENA","OFERTA_V","PAGO_OFERTA"  
//							WHERE 	"PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" and  
//										"PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" and  
//										"PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" and  
//										"CADENA"."SERIE" = "PAGO_OFERTA"."SERIE" and  
//										"CADENA"."NUMERO" = "PAGO_OFERTA"."NRO_OFERTA" and  
//										"OFERTA_V"."ESTATUS_COMISION" = '1' AND
//										( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C' ) AND
//										"CADENA"."CODIGO" = :ls_base AND  
//										"CADENA"."SERIE" = :ls_serie AND  
//										"CADENA"."NUMERO" = :ll_numero
//							USING		sqlca;
//						CASE 'A'
//							SELECT	"ANEXO_AUMENTO"."AREA",	"ANEXO_AUMENTO"."FORMA_PAGO",	"ANEXO_AUMENTO"."TIPO_SEPULT",	"PAGO_AUMENTO"."PRECIO",	"PAGO_AUMENTO"."NRO_CUOTAS",	"PAGO_AUMENTO"."VALOR_CUOTA",	"PAGO_AUMENTO"."PIE",	"CADENA"."COD_PARQUE"	
//							INTO 		:ls_area,					:ls_forma_pago,					:ls_tipo_cons,							:ldb_precio,					:ll_plazo,							:ldb_valor_cta,					:ldb_pie,					:ll_cod_parque					
//							FROM 		"CADENA","ANEXO_AUMENTO","PAGO_AUMENTO"  
//							WHERE 	"PAGO_AUMENTO"."SERIE_M" = "ANEXO_AUMENTO"."SERIE_M" and  
//										"PAGO_AUMENTO"."NRO_AUMENTO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
//										"PAGO_AUMENTO"."FOLIO" = "ANEXO_AUMENTO"."ULT_FOLIO" and  
//										"CADENA"."SERIE" = "PAGO_AUMENTO"."SERIE_M" and  
//										"CADENA"."NUMERO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
//										"ANEXO_AUMENTO"."ESTATUS_COMISION" = '1' AND
//										( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND
//										"CADENA"."CODIGO" = :ls_base AND  
//										"CADENA"."SERIE" = :ls_serie AND  
//										"CADENA"."NUMERO" = :ll_numero 
//							USING		sqlca;
//						CASE 'L'	
//							SELECT	'X',			"ANEXO_LIBERADOR"."FORMA_PAGO",	'X',				"PAGO_LIBERADOR"."PRECIO",	"PAGO_LIBERADOR"."NRO_CUOTAS",	"PAGO_LIBERADOR"."PIE",	"CADENA"."COD_PARQUE",	"PAGO_LIBERADOR"."VALOR_CUOTA"   
//							INTO 		:ls_area,	:ls_forma_pago,						:ls_tipo_cons,	:ldb_precio,					:ll_plazo,								:ldb_pie,					:ll_cod_parque,			:ldb_valor_cta
//							FROM 		"ANEXO_LIBERADOR","CADENA","PAGO_LIBERADOR"  
//							WHERE 	"ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" and  
//										"ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" and  
//										"ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" and  
//										"CADENA"."SERIE" = "PAGO_LIBERADOR"."SERIE_M" and  
//										"ANEXO_LIBERADOR"."ESTATUS_COMISION" = '1' AND
//										"CADENA"."NUMERO" = "PAGO_LIBERADOR"."NRO_LIBERADOR" and  
//										( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND
//										"CADENA"."CODIGO" = :ls_base AND  
//										"CADENA"."SERIE" = :ls_serie AND  
//										"CADENA"."NUMERO" = :ll_numero   
//							USING		sqlca;
//					END CHOOSE	
//					if sqlca.sqlcode = 0 then
//						if ldb_precio>0 then
//							if ldb_pie = 0 and ll_plazo = 1 then
//								ldb_pie_porc	= round(((ldb_valor_cta * 100) / ldb_precio),2)
//							else
//								ldb_pie_porc	= round(((ldb_pie * 100) / ldb_precio),2)
//							end if
//						else
//							ldb_pie_porc		= 0
//						end if
//						setnull(ldb_c_pie_aux);setnull(ldb_c_pri_aux);setnull(ldb_c_seg_aux);setnull(ldb_c_ter_aux);setnull(ldb_c_cua_aux);&
//						setnull(ldb_c_qui_aux);setnull(ldb_c_sex_aux);setnull(ldb_c_sep_aux);setnull(ldb_c_oct_aux);setnull(ldb_c_nov_aux);&
//						setnull(ldb_c_pie);setnull(ldb_c_pri);setnull(ldb_c_seg);setnull(ldb_c_ter);setnull(ldb_c_cua);&
//						setnull(ldb_c_qui);setnull(ldb_c_sex);setnull(ldb_c_sep);setnull(ldb_c_oct);setnull(ldb_c_nov);&
//						if ldb_pie_porc < 10 then
//							SELECT	"CORRELATIVO",	"C_PIE",				"C_PRIMERA",		"C_SEGUNDA",		"C_TERCERA",		"C_CUARTA",			"C_QUINTA",			"C_SEXTA",			"C_SEPTIMA",		"C_OCTAVA",			"C_NOVENA"  	AS PORCENTAJE  
//							INTO 		:ll_correl,		:ldb_c_pie_aux,	:ldb_c_pri_aux,	:ldb_c_seg_aux,	:ldb_c_ter_aux,	:ldb_c_cua_aux,	:ldb_c_qui_aux,	:ldb_c_sex_aux,	:ldb_c_sep_aux,	:ldb_c_oct_aux,	:ldb_c_nov_aux
//							FROM 		"PORCENTAJE_COMISIONES"  
//							WHERE  	( "PIE_MIN" <= :ldb_pie_porc AND  "PIE_MAX" >= :ldb_pie_porc) AND  
//										"AREA" = :ls_area AND
//										"T_CONS" = :ls_tipo_cons AND
//										( "CREDITO_MIN" <= :ll_plazo AND "CREDITO" >= :ll_plazo ) AND
//										( "C_PIE"+"C_PRIMERA"+"C_SEGUNDA"+"C_TERCERA"+"C_CUARTA"+"C_QUINTA"+"C_SEXTA"+"C_SEPTIMA"+"C_OCTAVA"+"C_NOVENA" ) > 0 and 
//										"COD_PARQUE" = :ll_cod_parque
//							USING		sqlca;
//						elseif ldb_pie_porc >= 10 then
//							SELECT	"CORRELATIVO",	"C_PIE",				"C_PRIMERA",		"C_SEGUNDA",		"C_TERCERA",		"C_CUARTA",			"C_QUINTA",			"C_SEXTA",			"C_SEPTIMA",		"C_OCTAVA",			"C_NOVENA"  	AS PORCENTAJE  
//							INTO 		:ll_correl,		:ldb_c_pie_aux,	:ldb_c_pri_aux,	:ldb_c_seg_aux,	:ldb_c_ter_aux,	:ldb_c_cua_aux,	:ldb_c_qui_aux,	:ldb_c_sex_aux,	:ldb_c_sep_aux,	:ldb_c_oct_aux,	:ldb_c_nov_aux
//							FROM 		"PORCENTAJE_COMISIONES"  
//							WHERE		( "PIE_MIN" <= :ldb_pie_porc AND "PIE_MAX" >= :ldb_pie_porc) AND  
//										"AREA" = :ls_area AND
//										"T_CONS" = :ls_tipo_cons AND
//										( "C_PIE"+"C_PRIMERA"+"C_SEGUNDA"+"C_TERCERA"+"C_CUARTA"+"C_QUINTA"+"C_SEXTA"+"C_SEPTIMA"+"C_OCTAVA"+"C_NOVENA" ) > 0 and 
//										"COD_PARQUE" = :ll_cod_parque
//							USING		sqlca;
//						end if
//						if sqlca.sqlcode = 0 and not isnull(ll_correl) then
//							dw_lista.deleterow(ll_indi)
//							ll_indi							= dw_lista.insertrow(0)
//							dw_lista.scrolltorow(ll_indi)
//							dw_lista.setitem(ll_indi,'base',ls_base)
//							dw_lista.setitem(ll_indi,'serie',ls_serie)
//							dw_lista.setitem(ll_indi,'numero',ll_numero)
//							dw_lista.setitem(ll_indi,'c_pie',ldb_c_pie_aux)
//							dw_lista.setitem(ll_indi,'c_primera',ldb_c_pri_aux)
//							dw_lista.setitem(ll_indi,'c_segunda',ldb_c_seg_aux)
//							dw_lista.setitem(ll_indi,'c_tercera',ldb_c_ter_aux)
//							dw_lista.setitem(ll_indi,'c_cuarta',ldb_c_cua_aux)
//							dw_lista.setitem(ll_indi,'c_quinta',ldb_c_qui_aux)
//							dw_lista.setitem(ll_indi,'c_sexta',ldb_c_sex_aux)
//							dw_lista.setitem(ll_indi,'c_septima',ldb_c_sep_aux)
//							dw_lista.setitem(ll_indi,'c_octava',ldb_c_oct_aux)
//							dw_lista.setitem(ll_indi,'c_novena',ldb_c_nov_aux)
//							dw_lista.setitem(ll_indi,'estado_valor',0)
//							dw_lista.setitem(ll_indi,'estado_grabar',0)
//							dw_lista.accepttext()
//						else
//							messagebox("Advertencia","No Registra Definición")
//						end if
//					else
//						messagebox("Advertencia","No existe Promesa, el Estado es distino a Vgte./Cancel o Comisión Antigua")
//						dw_lista.setitem(ll_indi,'estado_valor',1)
//					end if
//				end if
			end if
		else
			if isnull(ls_base) or ls_base='' then
				messagebox("Advertencia", "Debe Ingresar Base Contrato")
				dw_lista.setfocus()
				dw_lista.setcolumn('base')
			elseif isnull(ls_serie) or ls_serie='' then
				messagebox("Advertencia", "Debe Ingresar Serie Contrato")
				dw_lista.setfocus()
				dw_lista.setcolumn('serie')
			elseif isnull(ldb_numero) or ldb_numero=0 then
				messagebox("Advertencia", "Debe Ingresar Número Contrato")
				dw_lista.setfocus()
				dw_lista.setcolumn('numero')
			end if
		end if
	next
else
	messagebox("Advertencia","No Registra Datos")
end if
SetPointer(Arrow!)
end event

type dw_detalle from datawindow within w_genera_deveng_comisiones
boolean visible = false
integer x = 3739
integer y = 60
integer width = 631
integer height = 556
integer taborder = 110
string title = "none"
string dataobject = "dw_lista_contratos_sin_agrupar_faltantes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cta_cte from commandbutton within w_genera_deveng_comisiones
integer x = 2075
integer y = 1504
integer width = 416
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;if dw_lista.getrow() > 0 then
	gi_numero 			= dw_lista.getitemnumber(dw_lista.getrow(),'numero')
	gi_tipo_busqueda 	= 8
	Open(w_listado_contratos)
end if
end event

type cb_limpiar from commandbutton within w_genera_deveng_comisiones
integer x = 745
integer y = 1504
integer width = 279
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_genera_deveng_comisiones.triggerevent(open!)
end event

type pb_imprimir from picturebutton within w_genera_deveng_comisiones
event ue_mousemove pbm_mousemove
integer x = 3099
integer y = 1484
integer width = 165
integer height = 148
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;long		ll_tot_reg
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg > 0 then
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false				
end if
end event

type pb_filtrar from picturebutton within w_genera_deveng_comisiones
event ue_mousemove pbm_mousemove
integer x = 2930
integer y = 1484
integer width = 165
integer height = 148
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type pb_ordenar from picturebutton within w_genera_deveng_comisiones
event ue_mousemove pbm_mousemove
integer x = 2761
integer y = 1484
integer width = 165
integer height = 148
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_exportar from picturebutton within w_genera_deveng_comisiones
event ue_mousemove pbm_mousemove
integer x = 2592
integer y = 1484
integer width = 165
integer height = 148
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type dw_lista from datawindow within w_genera_deveng_comisiones
integer x = 37
integer y = 60
integer width = 3616
integer height = 1380
integer taborder = 10
string title = "none"
string dataobject = "dw_modifica_estatus_comi_lib"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_1 from groupbox within w_genera_deveng_comisiones
integer x = 37
integer y = 1432
integer width = 3616
integer height = 232
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

