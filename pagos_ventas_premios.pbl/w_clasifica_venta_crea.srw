forward
global type w_clasifica_venta_crea from window
end type
type cb_crea_proce_ing from commandbutton within w_clasifica_venta_crea
end type
type cb_docto_pendiente from commandbutton within w_clasifica_venta_crea
end type
type cb_limpiar from commandbutton within w_clasifica_venta_crea
end type
type cb_actualizar from commandbutton within w_clasifica_venta_crea
end type
type cb_cta_cte from commandbutton within w_clasifica_venta_crea
end type
type cb_imprimir from commandbutton within w_clasifica_venta_crea
end type
type cb_exportar from commandbutton within w_clasifica_venta_crea
end type
type cb_filtrar from commandbutton within w_clasifica_venta_crea
end type
type cb_ordenar from commandbutton within w_clasifica_venta_crea
end type
type dw_seleccion from datawindow within w_clasifica_venta_crea
end type
type dw_fecha_cierre from datawindow within w_clasifica_venta_crea
end type
type pb_aceptar from picturebutton within w_clasifica_venta_crea
end type
type dw_clasifica_venta from datawindow within w_clasifica_venta_crea
end type
type cb_cerrar from commandbutton within w_clasifica_venta_crea
end type
type gb_3 from groupbox within w_clasifica_venta_crea
end type
end forward

global type w_clasifica_venta_crea from window
integer width = 3712
integer height = 2200
boolean titlebar = true
string title = "Listado Clasificación Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_crea_proce_ing cb_crea_proce_ing
cb_docto_pendiente cb_docto_pendiente
cb_limpiar cb_limpiar
cb_actualizar cb_actualizar
cb_cta_cte cb_cta_cte
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
dw_seleccion dw_seleccion
dw_fecha_cierre dw_fecha_cierre
pb_aceptar pb_aceptar
dw_clasifica_venta dw_clasifica_venta
cb_cerrar cb_cerrar
gb_3 gb_3
end type
global w_clasifica_venta_crea w_clasifica_venta_crea

type variables
Long	il_mes,il_ano,il_row
end variables

forward prototypes
public function double wf_precio_uf (string as_base, string as_serie, double adb_numero)
end prototypes

public function double wf_precio_uf (string as_base, string as_serie, double adb_numero);double	ldb_precio_uf

SELECT	"PRECIO_UF"
INTO		:ldb_precio_uf
FROM 	"VISTA_PRODUCC_MENSUAL"
WHERE	"VISTA_PRODUCC_MENSUAL"."BASE" = :as_base AND
			"VISTA_PRODUCC_MENSUAL"."SERIE" = :as_serie AND
			"VISTA_PRODUCC_MENSUAL"."NUMERO" = :adb_numero
USING	sqlca;
if isnull(ldb_precio_uf) then ldb_precio_uf=0
Return ldb_precio_uf
end function

on w_clasifica_venta_crea.create
this.cb_crea_proce_ing=create cb_crea_proce_ing
this.cb_docto_pendiente=create cb_docto_pendiente
this.cb_limpiar=create cb_limpiar
this.cb_actualizar=create cb_actualizar
this.cb_cta_cte=create cb_cta_cte
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.dw_seleccion=create dw_seleccion
this.dw_fecha_cierre=create dw_fecha_cierre
this.pb_aceptar=create pb_aceptar
this.dw_clasifica_venta=create dw_clasifica_venta
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.Control[]={this.cb_crea_proce_ing,&
this.cb_docto_pendiente,&
this.cb_limpiar,&
this.cb_actualizar,&
this.cb_cta_cte,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.dw_seleccion,&
this.dw_fecha_cierre,&
this.pb_aceptar,&
this.dw_clasifica_venta,&
this.cb_cerrar,&
this.gb_3}
end on

on w_clasifica_venta_crea.destroy
destroy(this.cb_crea_proce_ing)
destroy(this.cb_docto_pendiente)
destroy(this.cb_limpiar)
destroy(this.cb_actualizar)
destroy(this.cb_cta_cte)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.dw_seleccion)
destroy(this.dw_fecha_cierre)
destroy(this.pb_aceptar)
destroy(this.dw_clasifica_venta)
destroy(this.cb_cerrar)
destroy(this.gb_3)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_tot_reg,ll_nulo

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;

gf_centrar(w_clasifica_venta_crea)
Setnull(ls_nulo);Setnull(ll_nulo)

dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve(datetime(date(string('01/01/2011'))))=0 then
	idw_detalle4.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)

dw_clasifica_venta.dataobject					= 'dwe_clasifica_venta_lista'
dw_clasifica_venta.settransobject(sqlca)
dw_clasifica_venta.object.usuario.text		= gs_user

if gl_proceso>=4 and (gs_depto='I' or gs_depto='V' or gs_depto='O' or gs_depto='Z' or gs_depto='2') then
	cb_actualizar.visible							= true
	cb_crea_proce_ing.visible					= true	
	if gs_conexion	= "Parque El Prado" then
		ll_parque	= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque	= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque	= 801
	end if
	dw_seleccion.settransobject(sqlca)
	dw_seleccion.getchild('jefe',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ll_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_seleccion.getchild('supervisor',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ll_parque,'')=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_seleccion.getchild('agente',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve(ll_parque,'','')=0 then
		idw_detalle3.insertrow(0)
	end if
	dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'parque',ll_nulo)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	dw_seleccion.setitem(1,'agente',ls_nulo)
	dw_clasifica_venta.reset()
	dw_seleccion.accepttext()
	
elseif gl_proceso=3 then
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect	= 1
		dw_seleccion.object.jefe.protect		= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,gs_user)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.getchild('agente',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(ll_parque,gs_user,'')=0 then
			idw_detalle3.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',gs_user)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
	end if
	dw_clasifica_venta.reset()
	dw_seleccion.accepttext()

elseif gl_proceso=2 then
	SELECT	"SUPERVISOR"."COD_PARQUE",   
        	 	"SUPERVISOR"."COD_JEFE"  
   INTO		:ll_parque,   
         	:ls_jefe  
   FROM 		"SUPERVISOR"  
   WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect		= 1
		dw_seleccion.object.jefe.protect			= 1
		dw_seleccion.object.supervisor.protect	= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.getchild('agente',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(ll_parque,ls_jefe,gs_user)=0 then
			idw_detalle3.insertrow(0)
		end if
		
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',ls_jefe)
		dw_seleccion.setitem(1,'supervisor',gs_user)
		dw_seleccion.setitem(1,'agente',ls_nulo)
	end if
	dw_clasifica_venta.reset()
	dw_seleccion.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_clasifica_venta_crea)
end if

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_crea_proce_ing from commandbutton within w_clasifica_venta_crea
integer x = 896
integer y = 1940
integer width = 439
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Porce Ingreso"
end type

event clicked;string		ls_base,ls_serie
long		ll_tot_reg,ll_indi,ll_graba=0
datetime	ldt_fec_cierre
double	ldb_numero,ldb_precio,ldb_monto,ldb_porce_cierre

SetPointer(HourGlass!)
dw_clasifica_venta.reset()
dw_fecha_cierre.accepttext()
ldt_fec_cierre										= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
dw_clasifica_venta.dataobject					= 'dw_clasifica_venta_crea'
dw_clasifica_venta.settransobject(sqlca)

if not isnull(ldt_fec_cierre) then
	ll_tot_reg										= dw_clasifica_venta.retrieve(ldt_fec_cierre)
	if ll_tot_reg > 0 then
		for ll_indi = 1 to ll_tot_reg
			ls_base									= dw_clasifica_venta.getitemstring(ll_indi,'codigo')
			ls_serie									= dw_clasifica_venta.getitemstring(ll_indi,'serie')
			ldb_numero								= dw_clasifica_venta.getitemnumber(ll_indi,'numero')
			ldb_precio								= dw_clasifica_venta.getitemnumber(ll_indi,'precio_peso')
			ldb_monto								= f_monto_ingr_cierre(ls_base,ls_serie,ldb_numero,ldt_fec_cierre)
			ldb_porce_cierre						= round((ldb_monto / ldb_precio) * 100,2)
			dw_clasifica_venta.setitem(ll_indi,"porce_ing_cierre",ldb_porce_cierre)
			if ls_base='O' then
				UPDATE	"OFERTA_V"  
				SET 		"PORCE_ING_CIERRE" = :ldb_porce_cierre  
				WHERE 	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
							( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )   
				USING	sqlca;
			elseif ls_base='L' then
				UPDATE	"ANEXO_LIBERADOR"  
				SET 		"PORCE_ING_CIERRE" = :ldb_porce_cierre  
				WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
							( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )   
				USING	sqlca;	
			elseif ls_base='A' then
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"PORCE_ING_CIERRE" = :ldb_porce_cierre  
				WHERE 	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
							( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )   
				USING	sqlca;		
			elseif ls_base='F' then
				UPDATE	"PRODUCTO_ANEXO"  
				SET 		"PORCE_ING_CIERRE" = :ldb_porce_cierre  
				WHERE 	( "PRODUCTO_ANEXO"."BASE" = :ls_base ) AND
							( "PRODUCTO_ANEXO"."SERIE" = :ls_serie ) AND  
							( "PRODUCTO_ANEXO"."NUMERO" = :ldb_numero )   
				USING	sqlca;
			end if
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				ll_graba++
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Porcentaje Ingreso SQL: "+sqlca.sqlerrtext)
			end if
		next
		if ll_graba=ll_tot_reg then
			messagebox("Graba","Grabación Exitosa")
			cb_crea_proce_ing.visible					= true
		end if
	else
		messagebox("Advertencia","No Registra Datos")
	end if
else
	if isnull(ldt_fec_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('cierre_ventas')
	end if
end if
SetPointer(Arrow!)
end event

type cb_docto_pendiente from commandbutton within w_clasifica_venta_crea
integer x = 462
integer y = 1940
integer width = 434
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Docto. Pendiente"
end type

event clicked;string	ls_string

dw_clasifica_venta.accepttext()
if dw_clasifica_venta.rowcount() > 0 then
	if dw_clasifica_venta.dataobject='dwe_clasifica_venta_lista' then
		gs_base			= dw_clasifica_venta.getitemstring(il_row,'base')
		gs_serie			= dw_clasifica_venta.getitemstring(il_row,'serie')
		gi_numero 		= dw_clasifica_venta.getitemnumber(il_row,'numero')
		gi_rut				= dw_clasifica_venta.getitemnumber(il_row,'rut')
	elseif dw_clasifica_venta.dataobject='dw_clasifica_venta_crea' then
		gs_base			= dw_clasifica_venta.getitemstring(il_row,'codigo')
		gs_serie			= dw_clasifica_venta.getitemstring(il_row,'serie')
		gi_numero 		= dw_clasifica_venta.getitemnumber(il_row,'numero')
		gi_rut				= dw_clasifica_venta.getitemnumber(il_row,'rut')
	end if
	if not isnull(gs_base) and gs_base<>'' and not isnull(gs_serie)  and gs_serie<>'' and not isnull(gi_numero) and gi_numero >0 then
		ls_string			= 'M'+'~t'+gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+gs_depto
		if isvalid(w_docto_pendiente_promesa) then close(w_docto_pendiente_promesa)
		OpenWithParm (w_docto_pendiente_promesa,ls_string)
	end if
end if


end event

type cb_limpiar from commandbutton within w_clasifica_venta_crea
integer x = 2985
integer y = 1940
integer width = 238
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

event clicked;w_clasifica_venta_crea.triggerevent(open!)
end event

type cb_actualizar from commandbutton within w_clasifica_venta_crea
integer x = 1339
integer y = 1940
integer width = 485
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasifica Ventas"
end type

event clicked;string	ls_base,ls_serie,ls_clas_promesa
long		ll_tot_reg,ll_indi,ll_graba=0
datetime	ldt_fecha_cierre
double	ldb_numero

SetPointer(HourGlass!)
dw_clasifica_venta.reset()
dw_fecha_cierre.accepttext()
ldt_fecha_cierre									= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
dw_clasifica_venta.dataobject					= 'dw_clasifica_venta_crea'
dw_clasifica_venta.settransobject(sqlca)

if not isnull(ldt_fecha_cierre) then
	ll_tot_reg										= dw_clasifica_venta.retrieve(ldt_fecha_cierre)
	if ll_tot_reg > 0 then
		for ll_indi = 1 to ll_tot_reg
			ls_base									= dw_clasifica_venta.getitemstring(ll_indi,'codigo')
			ls_serie									= dw_clasifica_venta.getitemstring(ll_indi,'serie')
			ldb_numero								= dw_clasifica_venta.getitemnumber(ll_indi,'numero')
			ls_clas_promesa						= f_clas_promesa(ls_base,ls_serie,ldb_numero)
			dw_clasifica_venta.setitem(ll_indi,"clasifica_venta",ls_clas_promesa)
			if ls_base='O' then
				UPDATE	"OFERTA_V"  
				SET 		"CLASIFICA_VENTA" = :ls_clas_promesa  
				WHERE 	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
							( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )   
				USING	sqlca;
			elseif ls_base='L' then
				UPDATE	"ANEXO_LIBERADOR"  
				SET 		"CLASIFICA_VENTA" = :ls_clas_promesa  
				WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
							( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )   
				USING	sqlca;	
			elseif ls_base='A' then
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"CLASIFICA_VENTA" = :ls_clas_promesa  
				WHERE 	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
							( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )   
				USING	sqlca;		
			elseif ls_base='F' then
				UPDATE	"PRODUCTO_ANEXO"  
				SET 		"CLASIFICA_VENTA" = :ls_clas_promesa  
				WHERE 	( "PRODUCTO_ANEXO"."BASE" = :ls_base ) AND
							( "PRODUCTO_ANEXO"."SERIE" = :ls_serie ) AND  
							( "PRODUCTO_ANEXO"."NUMERO" = :ldb_numero )   
				USING	sqlca;
			end if
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				ll_graba++
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Clasificación Promesa SQL: "+sqlca.sqlerrtext)
			end if
		next
		if ll_graba=ll_tot_reg then
			messagebox("Graba","Grabación Exitosa")
			cb_actualizar.visible						= true
		end if
	else
		messagebox("Advertencia","No Registra Datos")
	end if
else
	if isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('cierre_ventas')
	end if
end if
SetPointer(Arrow!)
		

end event

type cb_cta_cte from commandbutton within w_clasifica_venta_crea
integer x = 32
integer y = 1940
integer width = 425
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa

if dw_clasifica_venta.rowcount() > 0 then
	if il_row>0 then
		if dw_clasifica_venta.dataobject='dwe_clasifica_venta_lista' and dw_clasifica_venta.rowcount() > 0 then
			gs_base						= dw_clasifica_venta.getitemstring(il_row,'base')
			gs_serie						= dw_clasifica_venta.getitemstring(il_row,'serie')
			gi_numero 					= dw_clasifica_venta.getitemnumber(il_row,'numero')
			gi_rut							= dw_clasifica_venta.getitemnumber(il_row,'rut')
		elseif dw_clasifica_venta.dataobject='dw_clasifica_venta_crea' and dw_clasifica_venta.rowcount() > 0 then
			gs_base						= dw_clasifica_venta.getitemstring(il_row,'codigo')
			gs_serie						= dw_clasifica_venta.getitemstring(il_row,'serie')
			gi_numero 					= dw_clasifica_venta.getitemnumber(il_row,'numero')
			gi_rut							= dw_clasifica_venta.getitemnumber(il_row,'rut')
		end if
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	end if
end if
end event

type cb_imprimir from commandbutton within w_clasifica_venta_crea
integer x = 2747
integer y = 1940
integer width = 238
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_clasifica_venta.rowcount() > 0 then f_Print( dw_clasifica_venta )
end event

type cb_exportar from commandbutton within w_clasifica_venta_crea
integer x = 1979
integer y = 1940
integer width = 238
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_clasifica_venta
if dw_clasifica_venta.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_clasifica_venta_crea
integer x = 2222
integer y = 1940
integer width = 238
integer height = 84
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
dw_clasifica_venta.SETfilter(NULO)
dw_clasifica_venta.filter()
end event

type cb_ordenar from commandbutton within w_clasifica_venta_crea
integer x = 2464
integer y = 1940
integer width = 238
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_clasifica_venta.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_clasifica_venta.SETSORT(NULO)
	dw_clasifica_venta.SORT()
end if
end event

type dw_seleccion from datawindow within w_clasifica_venta_crea
integer x = 165
integer y = 36
integer width = 2286
integer height = 280
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_opciones"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_clasifica_venta.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		idw_detalle3.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_clasifica_venta.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		idw_detalle3.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_clasifica_venta.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		ls_supervisor			= dw_seleccion.getitemstring(1,'supervisor')
		dw_seleccion.getchild('agente',idw_detalle3)
		idw_detalle3.reset()
		dw_seleccion.setitem(1,'agente',ls_nulo)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(ll_parque,ls_jefe,ls_supervisor)=0 then
			idw_detalle3.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'agente'
		dw_seleccion.accepttext()
		dw_clasifica_venta.reset()
END CHOOSE
end event

type dw_fecha_cierre from datawindow within w_clasifica_venta_crea
integer x = 37
integer y = 124
integer width = 841
integer height = 100
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long		ll_cta_clas
datetime	ldt_fec_cierre
double	ldb_sum_porce

dw_fecha_cierre.accepttext()
ldt_fec_cierre								= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
if not isnull(ldt_fec_cierre) then
	SELECT	count("CLASIFICA_VENTA"),sum("PORCE_ING_CIERRE")
	INTO		:ll_cta_clas,	:ldb_sum_porce
	FROM		"VISTA_CLASIFICA_PROMESA"  
	WHERE	"VISTA_CLASIFICA_PROMESA"."CIERRE_VENTA" = :ldt_fec_cierre
	USING	sqlca;
	if isnull(ll_cta_clas) then ll_cta_clas=0
	if isnull(ldb_sum_porce) then ldb_sum_porce=0
	if ll_cta_clas=0 then
		cb_actualizar.visible				= true
	else
		cb_actualizar.visible				= false	
	end if
	if ldb_sum_porce=0 then
		cb_crea_proce_ing.visible		= true	
	else
		cb_crea_proce_ing.visible		= false	
	end if
end if



end event

type pb_aceptar from picturebutton within w_clasifica_venta_crea
integer x = 2459
integer y = 176
integer width = 133
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_jefe,ls_superv,ls_agente,ls_cargo,ls_base,ls_serie,ls_codigo,ls_forma_pago,&
			ls_clasif_promesa,ls_clasif,ls_periodo,ls_uso,ls_origen
long		ll_cod_parque,ll_plazo,ll_renta,ll_dicom,ll_new,ll_punto_ingr,ll_contr_ped,ll_cta_pat,&
			ll_punto_plazo,ll_punto_renta,ll_punto_dicom,ll_rut,ll_count_uso_nf,ll_count_uso_ni,ll_valor_pat
datetime	ldt_fecha_cierre,ldt_fecha_max_clas_vta,ldt_fecha_max_clasifica,ldt_fecha_ini
double	ldb_ingr,ldb_pondera_ingr,ldb_valor_vta_ingr,ldb_pondera_plazo,ldb_valor_vta_plazo,&
			ldb_pondera_renta,ldb_valor_vta_renta,ldb_pondera_dicom,ldb_valor_vta_dicom,&
			ldb_valor_total,ldb_precio_uf,ldb_numero

SetPointer(HourGlass!)
dw_clasifica_venta.reset()
dw_seleccion.accepttext()
dw_fecha_cierre.accepttext()
dw_clasifica_venta.dataobject		= 'dwe_clasifica_venta_lista'
dw_clasifica_venta.settransobject(sqlca)
ll_cod_parque							= dw_seleccion.getitemnumber(1,'parque')
ls_jefe									= dw_seleccion.getitemstring(1,'jefe')
ls_superv								= dw_seleccion.getitemstring(1,'supervisor')
ls_agente								= dw_seleccion.getitemstring(1,'agente')
ldt_fecha_cierre						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')

if not isnull(ldt_fecha_cierre) then
	if (not isnull(ll_cod_parque) or ll_cod_parque > 0) and (not isnull(ls_jefe) or ls_jefe<>'') and (not isnull(ls_superv) or ls_superv <> ''  ) and (not isnull(ls_agente) or ls_agente<>'') then
		ls_cargo														= 'A'
		DECLARE x1 CURSOR FOR	
		SELECT	"CODIGO","SERIE","NUMERO","COD_AGE","PORCE_ING_CIERRE","NRO_CUOTAS","TIPO_CLASIFICA_RENTA","DICOM_SCORE","CIERRE_VENTA","FORMA_PAGO","CLASIFICA_VENTA","RUT","USO","TIPO_VENTA"    	  
		FROM		"VISTA_CLASIFICA_PROMESA"
		WHERE 	( "VISTA_CLASIFICA_PROMESA"."COD_AGE" = :ls_agente ) and
					( "VISTA_CLASIFICA_PROMESA"."CIERRE_VENTA" = :ldt_fecha_cierre )
		USING		sqlca;
	elseif (not isnull(ll_cod_parque) or ll_cod_parque > 0) and (not isnull(ls_jefe) or ls_jefe<>'') and (not isnull(ls_superv) or ls_superv <> ''  ) and (isnull(ls_agente) or ls_agente='') then
		ls_cargo														= 'S'
		DECLARE x2 CURSOR FOR	
		SELECT	"CODIGO","SERIE","NUMERO","COD_SUP","PORCE_ING_CIERRE","NRO_CUOTAS","TIPO_CLASIFICA_RENTA","DICOM_SCORE","CIERRE_VENTA","FORMA_PAGO","CLASIFICA_VENTA","RUT","USO","TIPO_VENTA"    	    	  	  
		FROM		"VISTA_CLASIFICA_PROMESA"
		WHERE 	( "VISTA_CLASIFICA_PROMESA"."COD_SUP" = :ls_superv ) and
					( "VISTA_CLASIFICA_PROMESA"."CIERRE_VENTA" = :ldt_fecha_cierre )
		USING		sqlca;
	elseif (not isnull(ll_cod_parque) or ll_cod_parque > 0) and (not isnull(ls_jefe) or ls_jefe<>'') and (isnull(ls_superv) or ls_superv = ''  ) and (isnull(ls_agente) or ls_agente='') then
		ls_cargo														= 'J'
		DECLARE x3 CURSOR FOR	
		SELECT	"CODIGO","SERIE","NUMERO","COD_JEF","PORCE_ING_CIERRE","NRO_CUOTAS","TIPO_CLASIFICA_RENTA","DICOM_SCORE","CIERRE_VENTA","FORMA_PAGO","CLASIFICA_VENTA","RUT","USO","TIPO_VENTA"    	    	  	  
		FROM		"VISTA_CLASIFICA_PROMESA"
		WHERE 	( "VISTA_CLASIFICA_PROMESA"."COD_JEF" = :ls_jefe ) and
					( "VISTA_CLASIFICA_PROMESA"."CIERRE_VENTA" = :ldt_fecha_cierre )
					//AND ( "VISTA_CLASIFICA_PROMESA"."NUMERO" = 208748 )
		USING		sqlca;
	end if
	if ls_cargo = 'A' then
		open x1;
	elseif ls_cargo = 'S' then 
		open x2;
	elseif ls_cargo = 'J' then 
		open x3;	
	end if
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			if ls_cargo = 'A' then
				fetch x1 INTO	:ls_base,:ls_serie,:ldb_numero,:ls_codigo,:ldb_ingr,:ll_plazo,:ll_renta,:ll_dicom,:ldt_fecha_cierre,:ls_forma_pago,:ls_clasif_promesa,:ll_rut,:ls_uso,:ls_origen;	
			elseif ls_cargo = 'S' then 
				fetch x2 INTO	:ls_base,:ls_serie,:ldb_numero,:ls_codigo,:ldb_ingr,:ll_plazo,:ll_renta,:ll_dicom,:ldt_fecha_cierre,:ls_forma_pago,:ls_clasif_promesa,:ll_rut,:ls_uso,:ls_origen;
			elseif ls_cargo = 'J' then 
				fetch x3 INTO	:ls_base,:ls_serie,:ldb_numero,:ls_codigo,:ldb_ingr,:ll_plazo,:ll_renta,:ll_dicom,:ldt_fecha_cierre,:ls_forma_pago,:ls_clasif_promesa,:ll_rut,:ls_uso,:ls_origen;	
			end if
			if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero >0 then
				SELECT	MAX("FECHA")
				INTO 		:ldt_fecha_max_clas_vta  
				FROM		"CLASIFICA_VENTAS"  
				WHERE		( "CLASIFICA_VENTAS"."FECHA" <= :ldt_fecha_cierre )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ldt_fecha_max_clas_vta) then
					end if
				end if
				SELECT	"CIERRE_VENTA_INI"  
    				INTO 		:ldt_fecha_ini
    				FROM		"CIERRE_VENTA"  
   				WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ldt_fecha_ini) then
						ls_periodo										= 'Período de Ventas desde el '+string(ldt_fecha_ini,'dd/mm/yyyy')+' hasta el '+string(ldt_fecha_cierre,'dd/mm/yyyy')
					end if
				end if
				dw_clasifica_venta.object.cierre_ventas.text	= ls_periodo
				dw_clasifica_venta.object.usuario.text			= gs_user
				ll_new													= dw_clasifica_venta.insertrow(0)
				dw_clasifica_venta.scrolltorow(ll_new)
				dw_clasifica_venta.setitem(ll_new,"base",ls_base)
				dw_clasifica_venta.setitem(ll_new,"serie",ls_serie)
				dw_clasifica_venta.setitem(ll_new,"numero",ldb_numero)
				dw_clasifica_venta.setitem(ll_new,"rut",ll_rut)
				ldb_precio_uf											= Round(wf_precio_uf(ls_base,ls_serie,ldb_numero), 2)
				dw_clasifica_venta.setitem(ll_new,"precio_uf",ldb_precio_uf)
				dw_clasifica_venta.setitem(ll_new,"cargo",ls_cargo)
				dw_clasifica_venta.setitem(ll_new,"codigo",ls_codigo)
				dw_clasifica_venta.setitem(ll_new,"uso",ls_uso)
				dw_clasifica_venta.setitem(ll_new,"origen_vta",ls_origen)
				dw_clasifica_venta.setitem(ll_new,"forma_pago",ls_forma_pago)
				dw_clasifica_venta.setitem(ll_new,"porce_ingre",ldb_ingr)
				dw_clasifica_venta.setitem(ll_new,"plazo",ll_plazo)
				dw_clasifica_venta.setitem(ll_new,"renta",ll_renta)
				dw_clasifica_venta.setitem(ll_new,"dicom",ll_dicom)
				dw_clasifica_venta.setitem(ll_new,"clasif_promesa",ls_clasif_promesa)
				SELECT	"PUNTOS",			"PONDERA",				"VALOR_VENTA"  
				INTO 		:ll_punto_ingr,	:ldb_pondera_ingr,	:ldb_valor_vta_ingr  
				FROM		"CLASIFICA_VENTAS"  
				WHERE		( "CLASIFICA_VENTAS"."CODIGO" = 1 ) AND  
							( "CLASIFICA_VENTAS"."RANDO_INICIO" <= :ldb_ingr ) AND  
							( "CLASIFICA_VENTAS"."RANGO_FIN" > :ldb_ingr ) AND
							( "CLASIFICA_VENTAS"."FECHA" = :ldt_fecha_max_clas_vta ) 
				USING		Trans_1;
				if Trans_1.sqlcode=0 then
					ll_punto_ingr										= ll_punto_ingr
					ldb_pondera_ingr									= ldb_pondera_ingr
					ldb_valor_vta_ingr  								= ldb_valor_vta_ingr
				else
					ll_punto_ingr										= 0
					ldb_pondera_ingr									= 0
					ldb_valor_vta_ingr	  							= 0
				end if
				dw_clasifica_venta.setitem(ll_new,"puntos_ingr",ll_punto_ingr)
				dw_clasifica_venta.setitem(ll_new,"pondera_ing",ldb_pondera_ingr)
				dw_clasifica_venta.setitem(ll_new,"suma_ingr",ldb_valor_vta_ingr)
				SELECT	"PUNTOS",			"PONDERA",				"VALOR_VENTA"  
				INTO 		:ll_punto_plazo,	:ldb_pondera_plazo,	:ldb_valor_vta_plazo  
				FROM		"CLASIFICA_VENTAS"  
				WHERE		( "CLASIFICA_VENTAS"."CODIGO" = 2 ) AND  
							( "CLASIFICA_VENTAS"."RANDO_INICIO" < :ll_plazo ) AND  
							( "CLASIFICA_VENTAS"."RANGO_FIN" >= :ll_plazo ) AND
							( "CLASIFICA_VENTAS"."FECHA" = :ldt_fecha_max_clas_vta )
				USING		Trans_1;
				if Trans_1.sqlcode=0 then
					ll_punto_plazo										= ll_punto_plazo
					ldb_pondera_plazo									= ldb_pondera_plazo
					ldb_valor_vta_plazo  							= ldb_valor_vta_plazo
				else
					ll_punto_plazo										= 0
					ldb_pondera_plazo									= 0
					ldb_valor_vta_plazo  							= 0
				end if
				dw_clasifica_venta.setitem(ll_new,"puntos_plazo",ll_punto_plazo)
				dw_clasifica_venta.setitem(ll_new,"pondera_plazo",ldb_pondera_plazo)
				dw_clasifica_venta.setitem(ll_new,"suma_plazo",ldb_valor_vta_plazo)
				SELECT	"PUNTOS",			"PONDERA",				"VALOR_VENTA"  
				INTO 		:ll_punto_renta,	:ldb_pondera_renta,	:ldb_valor_vta_renta  
				FROM		"CLASIFICA_VENTAS"  
				WHERE		( "CLASIFICA_VENTAS"."CODIGO" = 3 ) AND  
							( "CLASIFICA_VENTAS"."RANDO_INICIO" = :ll_renta ) AND  
							( "CLASIFICA_VENTAS"."RANGO_FIN" = :ll_renta ) AND
							( "CLASIFICA_VENTAS"."FECHA" = :ldt_fecha_max_clas_vta )
				USING		Trans_1;
				if Trans_1.sqlcode=0 then
					ll_punto_renta										= ll_punto_renta
					ldb_pondera_renta									= ldb_pondera_renta
					ldb_valor_vta_renta  							= ldb_valor_vta_renta
				else
					ll_punto_renta										= 0
					ldb_pondera_renta									= 0
					ldb_valor_vta_renta  							= 0
				end if
				dw_clasifica_venta.setitem(ll_new,"puntos_renta",ll_punto_renta)
				dw_clasifica_venta.setitem(ll_new,"pondera_renta",ldb_pondera_renta)
				dw_clasifica_venta.setitem(ll_new,"suma_renta",ldb_valor_vta_renta)
				SELECT	"PUNTOS",			"PONDERA",				"VALOR_VENTA"  
				INTO 		:ll_punto_dicom,	:ldb_pondera_dicom,	:ldb_valor_vta_dicom  
				FROM		"CLASIFICA_VENTAS"  
				WHERE		( "CLASIFICA_VENTAS"."CODIGO" = 4 ) AND  
							( "CLASIFICA_VENTAS"."RANDO_INICIO" = :ll_dicom ) AND  
							( "CLASIFICA_VENTAS"."RANGO_FIN" = :ll_dicom ) AND
							( "CLASIFICA_VENTAS"."FECHA" = :ldt_fecha_max_clas_vta ) 
				USING		Trans_1;
				if Trans_1.sqlcode=0 then
					ll_punto_dicom										= ll_punto_dicom
					ldb_pondera_dicom									= ldb_pondera_dicom
					ldb_valor_vta_dicom  							= ldb_valor_vta_dicom
				else
					ll_punto_dicom										= 0
					ldb_pondera_dicom									= 0
					ldb_valor_vta_dicom  							= 0
				end if
				dw_clasifica_venta.setitem(ll_new,"puntos_dicom",ll_punto_dicom)
				dw_clasifica_venta.setitem(ll_new,"pondera_dicom",ldb_pondera_dicom)
				dw_clasifica_venta.setitem(ll_new,"suma_dicom",ldb_valor_vta_dicom)
				
				if ldt_fecha_cierre < datetime(date(string('31/08/2011'))) then
					ll_valor_pat							= 0
				else
					SELECT	count("SOL_ESTATUS"."BASE")  
					INTO		:ll_cta_pat  
					FROM		"SOL_PAT","SOL_ESTATUS"  
					WHERE 	"SOL_ESTATUS"."BASE" = "SOL_PAT"."BASE" and  
								"SOL_ESTATUS"."SERIE" = "SOL_PAT"."SERIE" and  
								"SOL_ESTATUS"."NUMERO" = "SOL_PAT"."NUMERO" and  
								"SOL_PAT"."BASE" = :ls_base AND  
								"SOL_PAT"."SERIE" = :ls_serie AND  
								"SOL_PAT"."NUMERO" = :ldb_numero AND  
								"SOL_PAT"."ESTATUS_OPERACION" = 0 AND  
								"SOL_PAT"."ESTATUS_OPERACION" = 0 AND  
								"SOL_ESTATUS"."CODIGO_SOLICITUD" = '21' AND  
								"SOL_ESTATUS"."ESTADO_REG" = 'A'
					USING	Trans_1;
					if isnull(ll_cta_pat) then ll_cta_pat=0
					if ll_cta_pat>0 then
						ll_valor_pat									= 1
					else
						ll_valor_pat									= 0
					end if
				end if
				dw_clasifica_venta.setitem(ll_new,"valor_pat",ll_valor_pat)
				dw_clasifica_venta.accepttext()
				ldb_valor_total										= Round(ldb_valor_vta_ingr + ldb_valor_vta_plazo + ldb_valor_vta_renta + ldb_valor_vta_dicom + ll_valor_pat,2)
				if ls_forma_pago = '1' or ls_forma_pago = '2' or ls_forma_pago = '3' or ls_forma_pago = '4' then
					SELECT	MAX("FECHA")  
					INTO 		:ldt_fecha_max_clasifica  
					FROM		"CLASIFICACION"  
					WHERE		( "CLASIFICACION"."FECHA" <= :ldt_fecha_cierre )
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						if not isnull(ldt_fecha_max_clasifica) then
							SELECT	"CLASIFICA"  
							INTO 		:ls_clasif  
							FROM		"CLASIFICACION"  
							WHERE	( "CLASIFICACION"."TIPO_CLASIFICA" = 2 ) AND  
										( "CLASIFICACION"."TRAMO_INICIO" <= :ldb_valor_total) AND  
										( "CLASIFICACION"."TRAMO_FIN" > :ldb_valor_total )	AND
										( "CLASIFICACION"."FECHA" = :ldt_fecha_max_clasifica )
							USING		Trans_2;
							if Trans_2.sqlcode=0 then
								if not isnull(ls_clasif) and ls_clasif <> '' then
									ls_clasif							= ls_clasif
								end if
							end if
						end if
					end if
				end if
				if ls_base='L' then
					ls_clasif											= 'C'
				end if
				ll_contr_ped											= f_docto_pend(ls_base,ls_serie,ldb_numero,ldt_fecha_cierre)
				if ldb_ingr>=9.98 then
					ls_clasif											= 'A'
				else
					if ll_contr_ped>0 then
						ls_clasif										= 'C'
					end if
				end if
				ls_clasif												= ls_clasif
				dw_clasifica_venta.setitem(ll_new,"doct_pend",ll_contr_ped)
				dw_clasifica_venta.setitem(ll_new,"valor_venta_tot",ldb_valor_total)
				dw_clasifica_venta.setitem(ll_new,"clasifica",ls_clasif)
			end if
			setnull(ls_base);setnull(ls_serie);setnull(ldb_numero);&
			setnull(ll_punto_ingr);setnull(ldb_pondera_ingr);setnull(ldb_valor_vta_ingr);&
			setnull(ll_punto_plazo);setnull(ldb_pondera_plazo);setnull(ldb_valor_vta_plazo);&
			setnull(ll_punto_renta);setnull(ldb_pondera_renta);setnull(ldb_valor_vta_renta);&
			setnull(ll_punto_dicom);setnull(ldb_pondera_dicom);setnull(ldb_valor_vta_dicom);&
			setnull(ldb_valor_total);setnull(ls_clasif);setnull(ll_valor_pat)
		LOOP
	end if
	if ls_cargo = 'A' then
		close x1;
	elseif ls_cargo = 'S' then
		close x2;
	elseif ls_cargo = 'J' then
		close x3;
	end if
	if dw_clasifica_venta.RowCount() = 0 then
		messagebox("Advertencia","No Registra Ventas")
	end if
else
	if isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('cierre_ventas')
	elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('parque')
	elseif isnull(ls_jefe) or ls_jefe='' then
		messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('jefe')
	end if
end if
SetPointer(Arrow!)
end event

type dw_clasifica_venta from datawindow within w_clasifica_venta_crea
integer x = 32
integer y = 324
integer width = 3625
integer height = 1580
integer taborder = 10
string title = "none"
string dataobject = "dwe_clasifica_venta_lista"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type cb_cerrar from commandbutton within w_clasifica_venta_crea
integer x = 3397
integer y = 1940
integer width = 261
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_clasifica_venta_crea)
end event

type gb_3 from groupbox within w_clasifica_venta_crea
integer x = 1957
integer y = 1892
integer width = 1294
integer height = 152
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

