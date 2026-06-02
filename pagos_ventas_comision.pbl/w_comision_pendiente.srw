forward
global type w_comision_pendiente from window
end type
type cb_3 from commandbutton within w_comision_pendiente
end type
type cb_2 from commandbutton within w_comision_pendiente
end type
type cb_ordenar from commandbutton within w_comision_pendiente
end type
type cb_limpiar from commandbutton within w_comision_pendiente
end type
type nueva_fecha_comi from editmask within w_comision_pendiente
end type
type nuevo_comi_t from statictext within w_comision_pendiente
end type
type cb_imprimir from commandbutton within w_comision_pendiente
end type
type dw_seleccion from datawindow within w_comision_pendiente
end type
type cb_cta_cte from commandbutton within w_comision_pendiente
end type
type ultimo_comi_t from statictext within w_comision_pendiente
end type
type fecha_comi from editmask within w_comision_pendiente
end type
type pb_aceptar from picturebutton within w_comision_pendiente
end type
type cb_cerrar from commandbutton within w_comision_pendiente
end type
type dw_lista from datawindow within w_comision_pendiente
end type
type gb_1 from groupbox within w_comision_pendiente
end type
type gb_2 from groupbox within w_comision_pendiente
end type
type gb_3 from groupbox within w_comision_pendiente
end type
end forward

global type w_comision_pendiente from window
integer width = 3831
integer height = 2508
boolean titlebar = true
string title = "Revisión Comisiones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_3 cb_3
cb_2 cb_2
cb_ordenar cb_ordenar
cb_limpiar cb_limpiar
nueva_fecha_comi nueva_fecha_comi
nuevo_comi_t nuevo_comi_t
cb_imprimir cb_imprimir
dw_seleccion dw_seleccion
cb_cta_cte cb_cta_cte
ultimo_comi_t ultimo_comi_t
fecha_comi fecha_comi
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_comision_pendiente w_comision_pendiente

type variables
Long	il_mes,il_ano,il_row
end variables

on w_comision_pendiente.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_ordenar=create cb_ordenar
this.cb_limpiar=create cb_limpiar
this.nueva_fecha_comi=create nueva_fecha_comi
this.nuevo_comi_t=create nuevo_comi_t
this.cb_imprimir=create cb_imprimir
this.dw_seleccion=create dw_seleccion
this.cb_cta_cte=create cb_cta_cte
this.ultimo_comi_t=create ultimo_comi_t
this.fecha_comi=create fecha_comi
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_ordenar,&
this.cb_limpiar,&
this.nueva_fecha_comi,&
this.nuevo_comi_t,&
this.cb_imprimir,&
this.dw_seleccion,&
this.cb_cta_cte,&
this.ultimo_comi_t,&
this.fecha_comi,&
this.pb_aceptar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_comision_pendiente.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_ordenar)
destroy(this.cb_limpiar)
destroy(this.nueva_fecha_comi)
destroy(this.nuevo_comi_t)
destroy(this.cb_imprimir)
destroy(this.dw_seleccion)
destroy(this.cb_cta_cte)
destroy(this.ultimo_comi_t)
destroy(this.fecha_comi)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_fecha_comi,ls_fecha_comi_nue,ls_nulo
Long		ll_parque,ll_tot_reg,ll_mes_comi,ll_ano_comi,ll_mes_comi_nue,ll_ano_comi_nue,ll_nulo
datetime	ldt_ult_fecha_comi,ldt_fec_comi,ldt_fec_comi_nue,ldt_fecha_uf

Setnull(ls_nulo);Setnull(ll_nulo)
gf_centrar(w_comision_pendiente)

SELECT	MAX("RES_COMI"."FECHA") 
INTO		:ldt_ult_fecha_comi  
FROM 		"RES_COMI"  
WHERE		(	"RES_COMI"."COD_CONTABLE" = '022' OR  
       		"RES_COMI"."COD_CONTABLE" = '023' OR  
       		"RES_COMI"."COD_CONTABLE" = '036' OR  
       		"RES_COMI"."COD_CONTABLE" = '037')   ;

ll_mes_comi			= month(date(ldt_ult_fecha_comi))
ll_ano_comi			= year(date(ldt_ult_fecha_comi))

ls_fecha_comi		= '15/'+ string(ll_mes_comi,'00')+ '/' +string(ll_ano_comi,'0000')
fecha_comi.text	= string(ls_fecha_comi)
ldt_fec_comi		= datetime(date(fecha_comi.text),time('00:00:00'))

if ll_mes_comi = 12 then
	ll_mes_comi_nue = ll_mes_comi - 11
	ll_ano_comi_nue = ll_ano_comi + 1

	ls_fecha_comi_nue			= '15/'+ string(ll_mes_comi_nue,'00')+ '/' +string(ll_ano_comi_nue,'0000')
	nueva_fecha_comi.text	= string(ls_fecha_comi_nue)
	ldt_fec_comi_nue			= datetime(date(nueva_fecha_comi.text),time('00:00:00'))
else
	ll_mes_comi_nue = ll_mes_comi + 1
	ll_ano_comi_nue = ll_ano_comi

	ls_fecha_comi_nue			= '15/'+ string(ll_mes_comi_nue,'00')+ '/' +string(ll_ano_comi_nue,'0000')
	nueva_fecha_comi.text	= string(ls_fecha_comi_nue)
	ldt_fec_comi_nue			= datetime(date(nueva_fecha_comi.text),time('00:00:00'))
end if


if gl_proceso>=4 then
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
	dw_lista.reset()
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
	dw_lista.reset()
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
	dw_lista.reset()
	dw_seleccion.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_comision_pendiente)
end if

end event

type cb_3 from commandbutton within w_comision_pendiente
integer x = 1819
integer y = 2268
integer width = 261
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_2 from commandbutton within w_comision_pendiente
integer x = 1559
integer y = 2268
integer width = 261
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_ordenar from commandbutton within w_comision_pendiente
integer x = 1298
integer y = 2268
integer width = 261
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_limpiar from commandbutton within w_comision_pendiente
integer x = 2587
integer y = 2268
integer width = 261
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_comision_pendiente.triggerevent(open!)
end event

type nueva_fecha_comi from editmask within w_comision_pendiente
integer x = 558
integer y = 188
integer width = 379
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type nuevo_comi_t from statictext within w_comision_pendiente
integer x = 530
integer y = 52
integer width = 443
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
string text = "Fecha Próximo Calculo Comisión:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_imprimir from commandbutton within w_comision_pendiente
event ue_mousemove pbm_mousemove
integer x = 2203
integer y = 2268
integer width = 261
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type dw_seleccion from datawindow within w_comision_pendiente
integer x = 1038
integer y = 36
integer width = 2299
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
		dw_lista.reset()
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
		dw_lista.reset()
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
		dw_lista.reset()
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
		dw_lista.reset()
END CHOOSE
end event

event itemfocuschanged;//String	ls_columna,ls_jefe,ls_supervisor,ls_agente
//Long		ll_parque
//
//ls_columna	= dwo.name
//if ls_columna<>'parque' 
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
//		dw_seleccion.getchild('jefe',idw_detalle)
//		idw_detalle.settransobject(sqlca)
//		if idw_detalle.retrieve(ll_parque)=0 then
//			idw_detalle.insertrow(0)
//		end if
//	CASE 'jefe'
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
//		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
//		dw_seleccion.getchild('supervisor',idw_detalle2)
//		idw_detalle2.settransobject(sqlca)
//		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
//			idw_detalle2.insertrow(0)
//		end if
//	CASE 'supervisor'
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
//		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
//		ls_supervisor			= dw_seleccion.getitemstring(1,'supervisor')
//		dw_seleccion.getchild('agente',idw_detalle3)
//		idw_detalle3.settransobject(sqlca)
//		if idw_detalle3.retrieve(ll_parque,ls_jefe,ls_supervisor)=0 then
//			idw_detalle3.insertrow(0)
//		end if
//	CASE 'agente'
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//
end event

type cb_cta_cte from commandbutton within w_comision_pendiente
integer x = 41
integer y = 2268
integer width = 453
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;if dw_lista.rowcount() > 0 then
	if il_row>0 then
		gi_numero 	= dw_lista.getitemnumber(il_row,'oferta_v_nro_oferta')
		gs_base		= dw_lista.getitemstring(il_row,'cadena_codigo')
		gs_serie		= dw_lista.getitemstring(il_row,'oferta_v_serie')
		gi_rut 		= dw_lista.GetItemNumber(il_row, "oferta_v_rut")
		SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO"  
		INTO 		:gs_nombres,			:gs_apellido_paterno,	:gs_apellido_materno,	:gl_cod_parque_cta,		:gs_estado   
		FROM 		"CADENA",	"CLIENTE"  
		WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero ) AND  
				 ( "CADENA"."RUT" = :gi_rut ) )   
		USING		sqlca;
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
		END CHOOSE
	else
		messagebox("Advertencia","Debe listar Contrato y Seleccionar ")
	end if
end if
end event

type ultimo_comi_t from statictext within w_comision_pendiente
integer x = 73
integer y = 52
integer width = 384
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
string text = "Ultimo Proceso Comisión:"
alignment alignment = center!
boolean focusrectangle = false
end type

type fecha_comi from editmask within w_comision_pendiente
integer x = 78
integer y = 188
integer width = 379
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type pb_aceptar from picturebutton within w_comision_pendiente
integer x = 3346
integer y = 176
integer width = 133
integer height = 116
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

event clicked;string	ls_agente,ls_serie,ls_base,ls_jefe,ls_supervisor,ls_pasa='S'
long		ll_tot_reg,ll_parque,ll_indi
Double	ldb_numero,ldb_sum_porce,ldb_uf_cierre
datetime	ldt_fec_comi_nue

dw_seleccion.accepttext()
SetPointer(HourGlass!)
ll_parque										= dw_seleccion.getitemnumber(1,'parque')
ls_jefe											= dw_seleccion.getitemstring(1,'jefe')
ls_supervisor									= dw_seleccion.getitemstring(1,'supervisor')
ls_agente										= dw_seleccion.getitemstring(1,'agente')
ldt_fec_comi_nue								= datetime(date(nueva_fecha_comi.text),time('00:00:00'))

SELECT	"TAB_UF"."VALOR_UF"  
INTO		:ldb_uf_cierre  
FROM		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fec_comi_nue
USING		sqlca;
if sqlca.sqlcode<>0 then
	SELECT MAX("TAB_UF"."FECHA_UF") INTO :ldt_fec_comi_nue FROM "TAB_UF"     ;
end if

if not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_supervisor) and ls_supervisor<>'' and not isnull(ls_agente) and ls_agente<>'' then
	dw_lista.dataobject						= 'dw_comision_pendiente_agente'
	dw_lista.settransobject(sqlca)
	ll_tot_reg									= dw_lista.retrieve(ls_agente)
	dw_lista.object.usuario.text			= gs_user
	for ll_indi=1 to ll_tot_reg
		ls_serie		= dw_lista.getitemstring(ll_indi,'oferta_v_serie')
		ldb_numero	= dw_lista.getitemnumber(ll_indi,'oferta_v_nro_oferta')
		ls_base		= dw_lista.getitemstring(ll_indi,'cadena_codigo')
		SELECT	SUM("RES_COMI"."PORC_VENTA")  
		INTO 		:ldb_sum_porce  
		FROM 		"RES_COMI"  
		WHERE  ( "RES_COMI"."SERIE" = :ls_serie ) AND  
				 ( "RES_COMI"."CONTRATO" = :ldb_numero )  AND
				 ( "RES_COMI"."COD_AGE_SUP" = :ls_agente )  AND
				 ( "RES_COMI"."COD_CONTABLE" = '022' OR  
					"RES_COMI"."COD_CONTABLE" = '023' OR  
					"RES_COMI"."COD_CONTABLE" = '036' OR  
					"RES_COMI"."COD_CONTABLE" = '037')
		USING		sqlca;
		if ldb_sum_porce>0 then
			dw_lista.setitem(ll_indi,'c_porc_res_comi',ldb_sum_porce)
			
			if dw_lista.getitemnumber(ll_indi,'comision_promesa_c_pie') <= ldb_sum_porce and ldb_sum_porce>0 then
				dw_lista.setitem(ll_indi,'c_pag_pie',1)
				ldb_sum_porce	= ldb_sum_porce - dw_lista.getitemnumber(ll_indi,'comision_promesa_c_pie')
			end if
			
			if dw_lista.getitemnumber(ll_indi,'comision_promesa_c_primera') <= ldb_sum_porce and ldb_sum_porce>0 then
				dw_lista.setitem(ll_indi,'c_pag_cta_1',1)
				ldb_sum_porce	= ldb_sum_porce - dw_lista.getitemnumber(ll_indi,'comision_promesa_c_primera')
			end if
			if dw_lista.getitemnumber(ll_indi,'comision_promesa_c_segunda') <= ldb_sum_porce and ldb_sum_porce>0  then
				dw_lista.setitem(ll_indi,'c_pag_cta_2',1)
				ldb_sum_porce	= ldb_sum_porce - dw_lista.getitemnumber(ll_indi,'comision_promesa_c_segunda')
			end if
			if dw_lista.getitemnumber(ll_indi,'comision_promesa_c_tercera') <= ldb_sum_porce and ldb_sum_porce>0  then
				dw_lista.setitem(ll_indi,'c_pag_cta_3',1)
				ldb_sum_porce	= ldb_sum_porce - dw_lista.getitemnumber(ll_indi,'comision_promesa_c_tercera')
			end if
			if dw_lista.getitemnumber(ll_indi,'comision_promesa_c_cuarta') <= ldb_sum_porce and ldb_sum_porce>0  then
				dw_lista.setitem(ll_indi,'c_pag_cta_4',1)
				ldb_sum_porce	= ldb_sum_porce - dw_lista.getitemnumber(ll_indi,'comision_promesa_c_cuarta')
			end if
			if dw_lista.getitemnumber(ll_indi,'comision_promesa_c_quinta') <= ldb_sum_porce and ldb_sum_porce>0  then
				dw_lista.setitem(ll_indi,'c_pag_cta_5',1)
				ldb_sum_porce	= ldb_sum_porce - dw_lista.getitemnumber(ll_indi,'comision_promesa_c_quinta')
			end if
			if dw_lista.getitemnumber(ll_indi,'comision_promesa_c_sexta') <= ldb_sum_porce and ldb_sum_porce>0  then
				dw_lista.setitem(ll_indi,'c_pag_cta_6',1)
				ldb_sum_porce	= ldb_sum_porce - dw_lista.getitemnumber(ll_indi,'comision_promesa_c_sexta')
			end if
			if dw_lista.getitemnumber(ll_indi,'comision_promesa_c_septima') <= ldb_sum_porce and ldb_sum_porce>0  then
				dw_lista.setitem(ll_indi,'c_pag_cta_7',1)
				ldb_sum_porce	= ldb_sum_porce - dw_lista.getitemnumber(ll_indi,'comision_promesa_c_septima')
			end if
			if dw_lista.getitemnumber(ll_indi,'comision_promesa_c_octava') <= ldb_sum_porce and ldb_sum_porce>0  then
				dw_lista.setitem(ll_indi,'c_pag_cta_8',1)
				ldb_sum_porce	= ldb_sum_porce - dw_lista.getitemnumber(ll_indi,'comision_promesa_c_octava')
			end if
			if dw_lista.getitemnumber(ll_indi,'comision_promesa_c_novena') <= ldb_sum_porce and ldb_sum_porce>0  then
				dw_lista.setitem(ll_indi,'c_pag_cta_9',1)
				ldb_sum_porce	= ldb_sum_porce - dw_lista.getitemnumber(ll_indi,'comision_promesa_c_novena')
			end if
		end if
	next
elseif not isnull(ls_jefe) and not isnull(ls_supervisor) and ls_jefe<>'' and ls_supervisor<>'' and isnull(ls_agente) then
	dw_lista.dataobject	= 'dw_comision_pendiente_supervisor'
	dw_lista.settransobject(sqlca)
	ll_tot_reg				= dw_lista.retrieve(ls_supervisor,ldt_fec_comi_nue)
elseif not isnull(ls_jefe) and ls_jefe<>'' and isnull(ls_supervisor) and isnull(ls_agente) then
	dw_lista.dataobject	= 'dw_comision_pendiente_jefe_vtas'
	dw_lista.settransobject(sqlca)
	ll_tot_reg				= dw_lista.retrieve(ls_jefe,ldt_fec_comi_nue)
else
	if isnull(ll_parque) or ll_parque=0 then
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

type cb_cerrar from commandbutton within w_comision_pendiente
integer x = 3511
integer y = 2268
integer width = 261
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

event clicked;close(w_comision_pendiente)
end event

type dw_lista from datawindow within w_comision_pendiente
integer x = 37
integer y = 316
integer width = 3735
integer height = 1904
integer taborder = 30
string title = "none"
string dataobject = "dw_comision_pendiente_agente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()

close(w_cuenta_corriente_oferta)
close(w_cuenta_corriente_liberador)

end event

event doubleclicked;if il_row>0 then
		gi_numero 	= dw_lista.getitemnumber(il_row,'oferta_v_nro_oferta')
		gs_base		= dw_lista.getitemstring(il_row,'cadena_codigo')
		gs_serie		= dw_lista.getitemstring(il_row,'oferta_v_serie')
		gi_rut 		= dw_lista.GetItemNumber(il_row, "oferta_v_rut")
		SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO"  
		INTO 		:gs_nombres,			:gs_apellido_paterno,	:gs_apellido_materno,	:gl_cod_parque_cta,		:gs_estado   
		FROM 		"CADENA",	"CLIENTE"  
		WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 (("CADENA"."CODIGO" = :gs_base ) AND  
				 ( "CADENA"."SERIE" = :gs_serie ) AND  
				 ( "CADENA"."NUMERO" = :gi_numero ) AND  
				 ( "CADENA"."RUT" = :gi_rut ) )   
		USING		sqlca;
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
		END CHOOSE
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

close(w_cuenta_corriente_oferta)
close(w_cuenta_corriente_liberador)

end event

type gb_1 from groupbox within w_comision_pendiente
integer x = 37
integer y = 4
integer width = 462
integer height = 296
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
end type

type gb_2 from groupbox within w_comision_pendiente
integer x = 521
integer y = 4
integer width = 462
integer height = 296
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
end type

type gb_3 from groupbox within w_comision_pendiente
integer x = 1266
integer y = 2216
integer width = 1618
integer height = 164
integer taborder = 40
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

