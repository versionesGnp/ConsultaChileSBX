forward
global type w_liquida_premio from window
end type
type rb_jefe from radiobutton within w_liquida_premio
end type
type rb_superv from radiobutton within w_liquida_premio
end type
type rb_agente from radiobutton within w_liquida_premio
end type
type dw_parque from datawindow within w_liquida_premio
end type
type cb_clasif_hist from commandbutton within w_liquida_premio
end type
type cb_filtrar from commandbutton within w_liquida_premio
end type
type hpb_1 from hprogressbar within w_liquida_premio
end type
type st_porc from statictext within w_liquida_premio
end type
type st_fondo from statictext within w_liquida_premio
end type
type cb_grabar from commandbutton within w_liquida_premio
end type
type cb_cta_cte from commandbutton within w_liquida_premio
end type
type cb_limpiar from commandbutton within w_liquida_premio
end type
type dw_lista_premio from datawindow within w_liquida_premio
end type
type pb_aceptar from picturebutton within w_liquida_premio
end type
type cb_exportar from commandbutton within w_liquida_premio
end type
type cb_2 from commandbutton within w_liquida_premio
end type
type cb_imprimir from commandbutton within w_liquida_premio
end type
type dw_lista from datawindow within w_liquida_premio
end type
type dw_fecha_cierre from datawindow within w_liquida_premio
end type
type gb_1 from groupbox within w_liquida_premio
end type
type gb_2 from groupbox within w_liquida_premio
end type
end forward

global type w_liquida_premio from window
integer width = 3483
integer height = 2200
boolean titlebar = true
string title = "Ingreso Caja Supervisores"
boolean controlmenu = true
long backcolor = 67108864
rb_jefe rb_jefe
rb_superv rb_superv
rb_agente rb_agente
dw_parque dw_parque
cb_clasif_hist cb_clasif_hist
cb_filtrar cb_filtrar
hpb_1 hpb_1
st_porc st_porc
st_fondo st_fondo
cb_grabar cb_grabar
cb_cta_cte cb_cta_cte
cb_limpiar cb_limpiar
dw_lista_premio dw_lista_premio
pb_aceptar pb_aceptar
cb_exportar cb_exportar
cb_2 cb_2
cb_imprimir cb_imprimir
dw_lista dw_lista
dw_fecha_cierre dw_fecha_cierre
gb_1 gb_1
gb_2 gb_2
end type
global w_liquida_premio w_liquida_premio

type variables
long il_row
end variables

on w_liquida_premio.create
this.rb_jefe=create rb_jefe
this.rb_superv=create rb_superv
this.rb_agente=create rb_agente
this.dw_parque=create dw_parque
this.cb_clasif_hist=create cb_clasif_hist
this.cb_filtrar=create cb_filtrar
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.cb_grabar=create cb_grabar
this.cb_cta_cte=create cb_cta_cte
this.cb_limpiar=create cb_limpiar
this.dw_lista_premio=create dw_lista_premio
this.pb_aceptar=create pb_aceptar
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.dw_fecha_cierre=create dw_fecha_cierre
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.rb_jefe,&
this.rb_superv,&
this.rb_agente,&
this.dw_parque,&
this.cb_clasif_hist,&
this.cb_filtrar,&
this.hpb_1,&
this.st_porc,&
this.st_fondo,&
this.cb_grabar,&
this.cb_cta_cte,&
this.cb_limpiar,&
this.dw_lista_premio,&
this.pb_aceptar,&
this.cb_exportar,&
this.cb_2,&
this.cb_imprimir,&
this.dw_lista,&
this.dw_fecha_cierre,&
this.gb_1,&
this.gb_2}
end on

on w_liquida_premio.destroy
destroy(this.rb_jefe)
destroy(this.rb_superv)
destroy(this.rb_agente)
destroy(this.dw_parque)
destroy(this.cb_clasif_hist)
destroy(this.cb_filtrar)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.cb_grabar)
destroy(this.cb_cta_cte)
destroy(this.cb_limpiar)
destroy(this.dw_lista_premio)
destroy(this.pb_aceptar)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.dw_fecha_cierre)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_tot_reg

connect using Trans_1;
connect using Trans_2;

gf_centrar(w_liquida_premio)

dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/10/2010'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)

if gl_proceso>=4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque													= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque													= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque													= 801
	end if
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_premios_sup_uno_x_cien_pagos)
end if

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type rb_jefe from radiobutton within w_liquida_premio
integer x = 846
integer y = 112
integer width = 421
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jefe Ventas"
end type

type rb_superv from radiobutton within w_liquida_premio
integer x = 448
integer y = 112
integer width = 434
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Supervisor"
end type

type rb_agente from radiobutton within w_liquida_premio
integer x = 114
integer y = 112
integer width = 434
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agentes"
end type

type dw_parque from datawindow within w_liquida_premio
integer x = 2167
integer y = 120
integer width = 878
integer height = 100
integer taborder = 30
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

type cb_clasif_hist from commandbutton within w_liquida_premio
integer x = 1147
integer y = 1964
integer width = 562
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasificación Historica"
end type

event clicked;//string	ls_codigo,ls_string
//datetime	ldt_fecha
//
//dw_fecha_cierre.accepttext()
//dw_lista.accepttext()
//
//if dw_lista.dataobject			='dw_premios_sup_uno_x_cien_group_res' and dw_lista.rowcount() > 0 then
//	ls_codigo						= dw_lista.getitemstring(il_row,'cod_sup')
//	ldt_fecha						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
//elseif dw_lista.dataobject		='dw_premios_sup_uno_x_cien_pagos' and dw_lista.rowcount() > 0 then
//	ls_codigo						= dw_lista.getitemstring(il_row,'supervisor_cod_sup')
//	ldt_fecha						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
//elseif dw_lista.dataobject		='dw_premios_sup_uno_x_cien_detalle' and dw_lista.rowcount() > 0 then
//	ls_codigo						= dw_lista.getitemstring(il_row,'cod_age_sup')
//	ldt_fecha						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
//end if
//if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fecha) then
//	ls_string						= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')
//	if isvalid(w_clasifica_historica) then close(w_clasifica_historica)
//	OpenWithParm (w_clasifica_historica,ls_string)
//end if
end event

type cb_filtrar from commandbutton within w_liquida_premio
integer x = 3529
integer y = 524
integer width = 334
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista_premio.SETfilter(NULO)
dw_lista_premio.filter()
end event

type hpb_1 from hprogressbar within w_liquida_premio
boolean visible = false
integer x = 1088
integer y = 1060
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_liquida_premio
boolean visible = false
integer x = 1664
integer y = 988
integer width = 233
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fondo from statictext within w_liquida_premio
boolean visible = false
integer x = 1061
integer y = 964
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_liquida_premio
integer x = 32
integer y = 1964
integer width = 274
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;//string	ls_haber,ls_estado_sup,ls_fecha_prem,ls_codigo,ls_cod_contad,ls_serie,ls_moneda,ls_estado_premio,ls_tipo_empleado
//long		ll_ano,ll_mes,ll_res,ll_tot_reg,ll_indi,ll_rut,ll_tot_pagado,ll_numero,ll_malos,ll_cont,ll_tot_porc,&
//			ll_tot_porc_aux,ll_acumul,ll_ctas_pag,ll_cod_parque,ll_tipo_premio
//datetime	ldt_fecha_fin,ldt_fecha_proceso,ldt_fecha_prem,ldt_fecha_consul,ldt_fecha_ini
//double	ldb_valor_uf,ldb_porcentaje,ldb_porce_vta,ldb_precio,ldb_premio
//
//dw_seleccion.AcceptText()
//dw_fecha_cierre.AcceptText()
//ldt_fecha_ini														= datetime(date(em_inicio.text),time('00:00:00'))
//ldt_fecha_fin														= datetime(date(em_termino.text),time('00:00:00'))
//ldt_fecha_proceso													= gdt_fec_sistema
//ll_mes																= month(date(ldt_fecha_fin))
//ll_ano																= year(date(ldt_fecha_fin))
//ls_haber      														= 'H'
//ls_estado_sup 														= 'A'
//ls_fecha_prem														= '17/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000')
//ldt_fecha_prem														= datetime(date(ls_fecha_prem),time('00:00:00'))
//ls_estado_premio													= 'P'
//ll_cod_parque														= dw_seleccion.getitemnumber(1,'parque')
//ll_tipo_premio														= 9
//ls_tipo_empleado													= 'S'	
//if ldt_fecha_prem > ldt_fecha_proceso then
//	messagebox("Grabar","No Puede Ejecutar el Proceso de Premio con Fecha :"+string(ldt_fecha_proceso,"dd/mm/yyyy"))
//else
//	SELECT	"VALOR_UF"  
//	INTO		:ldb_valor_uf  
//	FROM		"TAB_UF"  
//	WHERE		 "TAB_UF"."FECHA_UF" = :ldt_fecha_fin
//	USING		sqlca;
//	if sqlca.sqlcode=0 then
//		if not isnull(ldb_valor_uf) or ldb_valor_uf > 0 then
//			SELECT DISTINCT	"FECHA_TERMINO"
//			INTO		:ldt_fecha_consul
//			FROM		"CIERRE_PAGOS_VENTAS"
//			WHERE		"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
//						"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
//						"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
//						"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
//			USING		sqlca;
//			if sqlca.sqlcode = 0 then
//				if not isnull(ldt_fecha_consul) then
//					messagebox("Advertencia","Proceso Premio Ingreso Caja Supervisores Fue Grabado con Fecha :"+string(ldt_fecha_fin,"dd/mm/yyyy"))
//				end if
//			else
//				ll_res	= MessageBox("Grabar","¿Desea Grabar Proceso Premio Ingreso Caja Supervisores?", Exclamation!, YesNo!, 2)
//				if ll_res = 1 then
//					SetPointer(HourGlass!)
//					st_fondo.visible							= true
//					hpb_1.visible 								= true
//					st_porc.visible 							= true
//					ll_tot_porc									= 0
//					ll_tot_porc_aux							= 0			
//					hpb_1.Position								= ll_tot_porc
//					ll_tot_reg									= dw_lista_premio.rowcount()											
//					for ll_indi = 1 to ll_tot_reg
//						ll_acumul								= dw_lista_premio.getitemnumber(ll_indi,'c_acumul')
//						if ll_acumul = 1 then
//							ls_codigo							= dw_lista_premio.getitemstring(ll_indi,'supervisor_cod_sup')
//							ll_rut								= dw_lista_premio.getitemnumber(ll_indi,'supervisor_rut')
//							ll_tot_pagado						= dw_lista_premio.getitemnumber(ll_indi,'c_tot_ingreso_caja')
//							ls_cod_contad						= dw_lista_premio.getitemstring(ll_indi,'c_cod_haber')
//							ll_numero							= dw_lista_premio.getitemnumber(ll_indi,'ingreso_contrato')
//							ls_serie								= dw_lista_premio.getitemstring(ll_indi,'ingreso_serie')
//							ldb_porcentaje						= 15
//							ldb_porce_vta						= dw_lista_premio.getitemnumber(ll_indi,'c_porc_pago')
//							ldb_precio							= dw_lista_premio.getitemnumber(ll_indi,'pago_oferta_precio')
//							ldb_premio							= round(dw_lista_premio.getitemnumber(ll_indi,'c_total_premio'),0)
//							ls_moneda							= dw_lista_premio.getitemstring(ll_indi,'pago_oferta_moneda')
//							if f_graba_res_comi(ls_codigo,ll_rut,ll_tot_pagado,ls_cod_contad,string(ll_mes),ldt_fecha_fin,ll_numero,ls_serie,ldb_porcentaje,ldb_porce_vta,ldb_precio,ldb_premio,ldb_valor_uf,ls_haber,ls_moneda,ls_estado_premio,ls_estado_sup)= -1 then
//								ll_malos++
//							else
//								ll_cont++
//							end if
//						end if
//						if ll_tot_porc <> ll_tot_porc_aux then 
//							st_porc.text						= string(ll_tot_porc)+" %"
//							ll_tot_porc_aux					= ll_tot_porc
//						end if
//						ll_tot_porc								= (ll_indi / ll_tot_reg) * 100
//						hpb_1.Position 						= ll_tot_porc
//					next
//					INSERT INTO "CIERRE_PAGOS_VENTAS"  
//									( "FECHA_INICIO",	"FECHA_TERMINO",	"FECHA_PROCESO",		"TIPO_PREMIO",		"COD_PARQUE",		"USUARIO_CREA",	"TIPO_EMPLEADO" )  
//					VALUES		( :ldt_fecha_ini,	:ldt_fecha_fin,	:ldt_fecha_proceso,	:ll_tipo_premio,	:ll_cod_parque,	:gs_user,			:ls_tipo_empleado )  ;
//					if sqlca.sqlcode = 0 then
//						commit using sqlca;
//					else
//						rollback using sqlca;
//					end if
//					st_fondo.visible							= false
//					hpb_1.visible 								= false
//					st_porc.visible 							= false
//					SetPointer(Arrow!)
//					messagebox("Grabar","Proceso Grabación Exitoso")
//					dw_lista.Reset()
//					dw_lista_premio.Reset()
//				else
//					messagebox("Grabar","Proceso de grabación Cancelado")
//				end if
//			end if
//		end if
//	end if
//end if
end event

type cb_cta_cte from commandbutton within w_liquida_premio
integer x = 1714
integer y = 1964
integer width = 425
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;//string	ls_base,ls_serie
//long		ll_numero
//
//dw_lista.accepttext()
//if dw_lista.dataobject='dw_premios_sup_uno_x_cien_detalle' and dw_lista.rowcount() > 0 then
//	gs_base				= dw_lista.getitemstring(il_row,'cadena_codigo')
//	gs_serie				= dw_lista.getitemstring(il_row,'serie')
//	gi_numero			= dw_lista.getitemnumber(il_row,'contrato')
//	CHOOSE CASE gs_base
//		CASE "O" // Oferta
//			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
//			Open(w_cuenta_corriente_oferta)
//		CASE "L" // Anexo Liberador
//			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
//			Open(w_cuenta_corriente_liberador)
//		CASE "A" // Aumento Capacidad
//			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
//			Open(w_cuenta_corriente_aumento_capacidad)
//		CASE "P" // Pagaré
//			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
//			Open(w_cuenta_corriente_pagare)
//		CASE "C" // Contrato ISA	
//			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
//			Open(w_cuenta_corriente_contrato_isa)
//		CASE "D" // Derecho Especial
//			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
//			Open(w_cuenta_corriente_derecho)
//		CASE "R" //Repactación Ctas.Mantencion
//			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
//			Open(w_cuenta_corriente_repactar_cta_mant)
//	END CHOOSE
//end if
end event

type cb_limpiar from commandbutton within w_liquida_premio
integer x = 2281
integer y = 1964
integer width = 274
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_premios_sup_uno_x_cien_pagos.triggerevent(open!)
end event

type dw_lista_premio from datawindow within w_liquida_premio
integer x = 3529
integer y = 228
integer width = 334
integer height = 276
integer taborder = 50
string title = "none"
string dataobject = "dw_premios_sup_uno_x_cien_total"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_aceptar from picturebutton within w_liquida_premio
integer x = 3072
integer y = 104
integer width = 133
integer height = 116
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;//string	ls_jefe,ls_superv,ls_parque,ls_codigo,ls_clasif_hist,ls_cod_sup,ls_estado,ls_nombre,ls_a_pater,ls_a_mater,ls_nombre_comp,&
//			ls_cod_contab,ls_tipo_empleado
//long		ll_cod_parque,ll_tot_reg,ll_indi,ll_rut,ll_new,ll_tipo_premio,ll_tot_premio
//datetime	ldt_fecha_cierre,ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_consul,ldt_fecha_ing
//
//dw_lista.reset()
//dw_lista_premio.reset()
//dw_seleccion.accepttext()
//dw_fecha_cierre.accepttext()
//ll_cod_parque														= dw_seleccion.getitemnumber(1,'parque')
//ls_jefe																= dw_seleccion.getitemstring(1,'jefe')
//ls_superv															= dw_seleccion.getitemstring(1,'supervisor')
//ldt_fecha_cierre													= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
//ldt_fecha_ini														= datetime(date(em_inicio.text),time('00:00:00'))
//ldt_fecha_fin														= datetime(date(em_termino.text),time('00:00:00'))
//ls_cod_contab														= 'P09'
//ll_tipo_premio														= 9
//ls_tipo_empleado													= 'S'
//SELECT DISTINCT	"FECHA_TERMINO"
//INTO		:ldt_fecha_consul
//FROM		"CIERRE_PAGOS_VENTAS"
//WHERE		"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
//			"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
//			"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
//			"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_tipo_empleado
//USING		sqlca;
//if sqlca.sqlcode = 0 then
//	if not isnull(ldt_fecha_consul) then
//		if not isnull(ll_cod_parque) and ll_cod_parque > 0 and not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ldt_fecha_cierre) and isnull(ls_superv) then
//			cb_cta_cte.enabled									= false
//			cb_imprimir.enabled									= true
//			cb_grabar.enabled										= false
//			dw_lista.dataobject									='dw_premios_sup_uno_x_cien_group_res'
//			dw_lista.settransobject(sqlca)
//			dw_lista.object.usuario.text						= gs_user
//			DECLARE x1 CURSOR FOR
//			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."RUT",	"SUPERVISOR"."ESTADO",	"SUPERVISOR"."FECHA_ING",	"SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO"  
//    		FROM "RES_COMI",  "SUPERVISOR"  
//   		WHERE ( "RES_COMI"."COD_AGE_SUP" = "SUPERVISOR"."COD_SUP" ) and
//					( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab ) AND
//					( "SUPERVISOR"."COD_PARQUE" = :ll_cod_parque ) and  
//      		   ( "RES_COMI"."FECHA" = :ldt_fecha_fin )
//			ORDER BY	"SUPERVISOR"."FECHA_ING" ASC
//			USING	Trans_1;
//			open x1;
//				if Trans_1.sqlcode=0 then
//					DO WHILE Trans_1.sqlcode=0
//					fetch x1 INTO	:ls_cod_sup,	:ll_rut,	:ls_estado,	:ldt_fecha_ing,	:ls_nombre,	:ls_a_pater,	:ls_a_mater;
//						if not isnull(ls_cod_sup) and ls_cod_sup <> '' and not isnull(ll_rut) and ll_rut > 0 and not isnull(ls_estado) and ls_estado<>'' then
//							ls_nombre_comp							= ls_nombre+' '+ls_a_pater+' '+ls_a_mater
//							ll_new									= dw_lista.insertrow(0)
//							dw_lista.scrolltorow(ll_new)
//							dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
//							dw_lista.setitem(ll_new,"rut",ll_rut)
//							dw_lista.setitem(ll_new,"nombre",ls_nombre_comp)
//							dw_lista.setitem(ll_new,"estado",ls_estado)
//							ls_clasif_hist							= f_clasif_hist(ls_cod_sup,ldt_fecha_fin)
//							dw_lista.setitem(ll_new,"clasif",ls_clasif_hist)
//							SELECT	SUM("RES_COMI"."TOTAL_PAGO")  
//    						INTO		:ll_total_pago  
//   						FROM		"RES_COMI"  
//   						WHERE		( "RES_COMI"."COD_AGE_SUP" = :ls_cod_sup ) AND  
//         							( "RES_COMI"."FECHA" = :ldt_fecha_fin ) AND  
//         							( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab )
//							USING		Trans_2;
//							if Trans_2.sqlcode = 0 then
//								if not isnull(ll_total_pago) and ll_total_pago > 0 then
//									ll_tot_premio					= ll_total_pago
//								else
//									ll_tot_premio					= 0
//								end if
//							end if
//							dw_lista.setitem(ll_new,"premio",ll_tot_premio)
//							dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_ini)
//							dw_lista.setitem(ll_new,"fecha_fin",ldt_fecha_fin)
//						end if
//						setnull(ls_cod_sup);setnull(ll_rut);setnull(ls_estado)
//					LOOP
//				end if
//			close x1;
//			ll_tot_reg												= dw_lista.RowCount()
//			if ll_tot_reg=0 then 
//				messagebox("Advertencia","No Registra datos")
//			end if
//		elseif not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_superv) and ls_superv<>'' and not isnull(ldt_fecha_cierre) then
//			cb_cta_cte.enabled									= true
//			cb_imprimir.enabled									= true
//			cb_grabar.enabled										= false
//			dw_lista.dataobject									='dw_premios_sup_uno_x_cien_detalle'
//			dw_lista.settransobject(sqlca)
//			ll_tot_reg												= dw_lista.retrieve(ldt_fecha_fin,ls_superv)
//			dw_lista.object.usuario.text						= gs_user
//			for ll_indi = 1 to ll_tot_reg
//				ls_codigo											= dw_lista.getitemstring(ll_indi,'cod_age_sup')
//				ls_clasif_hist										= f_clasif_hist(ls_codigo,ldt_fecha_fin)
//				dw_lista.setitem(ll_indi,"c_clasif",ls_clasif_hist)
//			next
//			if ll_tot_reg=0 then 
//				messagebox("Advertencia","No Registra datos")
//			end if
//		else
//			if isnull(ldt_fecha_cierre) then
//				messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
//				dw_fecha_cierre.setfocus()
//				dw_fecha_cierre.setcolumn('cierre_ventas')
//			elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
//				messagebox("Advertencia", "Debe Ingresar Parque")
//				dw_seleccion.setfocus()
//				dw_seleccion.setcolumn('parque')
//			elseif isnull(ls_jefe) or ls_jefe='' then
//				messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
//				dw_seleccion.setfocus()
//				dw_seleccion.setcolumn('jefe')
//			end if
//		end if
//	end if
//else
//	if (gl_proceso = 1 and gs_depto = 'I') or (gl_proceso = 0 and gs_depto = 'D') then
//		if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ldt_fecha_cierre) then
//			dw_lista_premio.dataobject							='dw_premios_sup_uno_x_cien_total'
//			dw_lista_premio.settransobject(sqlca)
//			ll_tot_reg												= dw_lista_premio.retrieve(ldt_fecha_ini,ldt_fecha_fin,ll_cod_parque)
//		end if
//		SELECT	"COD_PARQ"."NOMBRE"  
//		INTO 		:ls_parque  
//		FROM 		"COD_PARQ"  
//		WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque ;
//		if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ldt_fecha_cierre) and isnull(ls_superv) then
//			cb_cta_cte.enabled									= false
//			cb_imprimir.enabled									= false
//			cb_grabar.enabled										= true
//			dw_lista.dataobject									='dw_premios_sup_uno_x_cien_pagos'
//			dw_lista.settransobject(sqlca)
//			ll_tot_reg												= dw_lista.retrieve(ldt_fecha_ini,ldt_fecha_fin,ll_cod_parque,ls_jefe)
//			dw_lista.object.t_parque_t.text					= ls_parque
//			dw_lista.object.usuario.text						= gs_user
//			for ll_indi = 1 to ll_tot_reg
//				ls_codigo											= dw_lista.getitemstring(ll_indi,'supervisor_cod_sup')
//				ls_clasif_hist										= f_clasif_hist(ls_codigo,ldt_fecha_fin)
//				dw_lista.setitem(ll_indi,"c_clasif",ls_clasif_hist)
//			next
//			if ll_tot_reg=0 then 
//				messagebox("Advertencia","No Registra datos")
//			end if
//		elseif not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_superv) and ls_superv<>'' and not isnull(ldt_fecha_cierre) then
//			messagebox("Advertencia","El Proceso Premio Ingreso Caja Supervisores Debe Ser Grabado")	
//		else
//			if isnull(ldt_fecha_cierre) then
//				messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
//				dw_fecha_cierre.setfocus()
//				dw_fecha_cierre.setcolumn('cierre_ventas')
//			elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
//				messagebox("Advertencia", "Debe Ingresar Parque")
//				dw_seleccion.setfocus()
//				dw_seleccion.setcolumn('parque')
//			elseif isnull(ls_jefe) or ls_jefe='' then
//				messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
//				dw_seleccion.setfocus()
//				dw_seleccion.setcolumn('jefe')
//			end if
//		end if
//	else
//		messagebox("Advertencia", "Proceso Premio Ingreso Caja Supervisores No Esta Creado")
//	end if
//end if
end event

type cb_exportar from commandbutton within w_liquida_premio
integer x = 3529
integer y = 624
integer width = 334
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;Datawindow	dw_paso
if dw_lista_premio.rowcount()>0 then
	dw_lista_premio.accepttext()
	dw_paso				= dw_lista_premio
	f_DWToExcel( dw_paso )
end if
end event

type cb_2 from commandbutton within w_liquida_premio
integer x = 3154
integer y = 1964
integer width = 274
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_liquida_premio)
end event

type cb_imprimir from commandbutton within w_liquida_premio
integer x = 2560
integer y = 1964
integer width = 274
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;//long		ll_tipo_premio,ll_cod_parque
//datetime	ldt_fecha_consul,ldt_fecha_fin
//
//ll_cod_parque								= dw_seleccion.getitemnumber(1,'parque')
//ldt_fecha_fin								= datetime(date(em_termino.text),time('00:00:00'))
//ll_tipo_premio								= 9
//SELECT DISTINCT	"FECHA_TERMINO"
//INTO		:ldt_fecha_consul
//FROM		"CIERRE_PAGOS_VENTAS"
//WHERE		"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
//			"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
//			"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque
//USING		sqlca;
//if sqlca.sqlcode = 0 then
//	if not isnull(ldt_fecha_consul) then
//		if dw_lista.rowcount() >0 then 
//			f_printdlg(dw_lista,gstr_print,w_premios_sup_uno_x_cien_pagos)
//		end if
//	end if
//else
//	messagebox("Advertencia","Debe Grabar El Proceso de Premio Ingreso Caja Supervisor")
//end if
end event

type dw_lista from datawindow within w_liquida_premio
integer x = 32
integer y = 240
integer width = 3397
integer height = 1684
integer taborder = 40
string title = "none"
string dataobject = "dw_premios_sup_uno_x_cien_group_res"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()
end event

event clicked;//if getrow()>0 then
//	il_row	= getrow()
//	This.SelectRow(0, false)
//	This.SelectRow(il_row, true)
//end if
end event

event doubleclicked;//string	ls_superv,ls_string
//datetime	ldt_fecha_ini,ldt_fecha_fin
//
//ldt_fecha_ini							= datetime(date(em_inicio.text),time('00:00:00'))
//ldt_fecha_fin							= datetime(date(em_termino.text),time('00:00:00'))
//
//if dw_lista.dataobject				='dw_premios_sup_uno_x_cien_group_res' and dw_lista.rowcount() > 0 then
//	ls_superv							= this.getitemstring(row,'cod_sup')
//	ls_string							= ls_superv+'~t'+string(ldt_fecha_fin,'dd/mm/yyyy')
//	OpenWithParm(w_premios_sup_uno_x_cien_detalle, ls_string)
//elseif dw_lista.dataobject			='dw_premios_sup_uno_x_cien_detalle' and dw_lista.rowcount() > 0 then
//	cb_cta_cte.triggerevent(clicked!)
//else
//	messagebox("Advertencia","El Proceso Premio Ingreso Caja Supervisores Debe Ser Grabado")
//end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type dw_fecha_cierre from datawindow within w_liquida_premio
integer x = 1312
integer y = 128
integer width = 841
integer height = 96
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//string	ls_fecha_comi,ls_fecha_comi_ant,ls_columna
//long		ll_mes,ll_ano,ll_mes_comi_ant,ll_ano_comi_ant
//datetime	ldt_fecha_cierre,ldt_fecha_comi,ldt_fecha_comi_ant
//
//dw_lista.reset()
//dw_fecha_cierre.AcceptText()
//ls_columna	= dwo.name
//CHOOSE CASE ls_columna
//	CASE 'cierre_ventas'
//		ldt_fecha_cierre			= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
//		ll_mes						= month(date(ldt_fecha_cierre))
//		ll_ano						= year(date(ldt_fecha_cierre))
//		
//		ls_fecha_comi				= '15/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000')
//		em_termino.text				= string(ls_fecha_comi)
//		ldt_fecha_comi				= datetime(date(em_termino.text),time('00:00:00'))
//		
//		if ll_mes = 1 then
//			ll_mes_comi_ant 		= ll_mes + 11
//			ll_ano_comi_ant 		= ll_ano - 1
//			ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
//			em_inicio.text			= string(ls_fecha_comi_ant)
//			ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
//		else
//			ll_mes_comi_ant 		= ll_mes - 1
//			ll_ano_comi_ant 		= ll_ano
//			ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
//			em_inicio.text			= string(ls_fecha_comi_ant)
//			ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
//		end if
//END CHOOSE
end event

event clicked;//string	ls_fecha_comi,ls_fecha_comi_ant
//long		ll_mes,ll_ano,ll_mes_comi_ant,ll_ano_comi_ant
//datetime	ldt_fecha_cierre,ldt_fecha_comi,ldt_fecha_comi_ant
//
//dw_lista.reset()
//ldt_fecha_cierre			= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
//ll_mes						= month(date(ldt_fecha_cierre))
//ll_ano						= year(date(ldt_fecha_cierre))
//
//ls_fecha_comi				= '15/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000')
//em_termino.text			= string(ls_fecha_comi,'dd/mm/yyyy')
//ldt_fecha_comi				= datetime(date(em_termino.text),time('00:00:00'))
//
//if ll_mes = 1 then
//	ll_mes_comi_ant 		= ll_mes + 11
//	ll_ano_comi_ant 		= ll_ano - 1
//	ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
//	em_inicio.text			= string(ls_fecha_comi_ant)
//	ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
//else
//	ll_mes_comi_ant 		= ll_mes - 1
//	ll_ano_comi_ant 		= ll_ano
//	ls_fecha_comi_ant		= '16/'+ string(ll_mes_comi_ant,'00')+ '/' +string(ll_ano_comi_ant,'0000')
//	em_inicio.text			= string(ls_fecha_comi_ant)
//	ldt_fecha_comi_ant	= datetime(date(em_inicio.text),time('00:00:00'))
//end if
end event

type gb_1 from groupbox within w_liquida_premio
integer x = 2258
integer y = 1916
integer width = 603
integer height = 152
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_liquida_premio
integer x = 55
integer y = 36
integer width = 1225
integer height = 180
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Empleado"
end type

