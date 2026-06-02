forward
global type w_docto_pendiente_estructura from window
end type
type cb_exportar from commandbutton within w_docto_pendiente_estructura
end type
type cb_glosa from commandbutton within w_docto_pendiente_estructura
end type
type dw_periodo from datawindow within w_docto_pendiente_estructura
end type
type rb_periodo from radiobutton within w_docto_pendiente_estructura
end type
type rb_cierre from radiobutton within w_docto_pendiente_estructura
end type
type cb_ingreso_docto_pend from commandbutton within w_docto_pendiente_estructura
end type
type dw_fecha_cierre from datawindow within w_docto_pendiente_estructura
end type
type cb_docto_pendiente from commandbutton within w_docto_pendiente_estructura
end type
type cb_ordenar from commandbutton within w_docto_pendiente_estructura
end type
type cb_limpiar from commandbutton within w_docto_pendiente_estructura
end type
type cb_imprimir from commandbutton within w_docto_pendiente_estructura
end type
type cb_cta_cte from commandbutton within w_docto_pendiente_estructura
end type
type pb_aceptar from picturebutton within w_docto_pendiente_estructura
end type
type cb_cerrar from commandbutton within w_docto_pendiente_estructura
end type
type dw_docto_pendiente from datawindow within w_docto_pendiente_estructura
end type
type gb_3 from groupbox within w_docto_pendiente_estructura
end type
type dw_seleccion from datawindow within w_docto_pendiente_estructura
end type
type gb_1 from groupbox within w_docto_pendiente_estructura
end type
type gb_seleccion from groupbox within w_docto_pendiente_estructura
end type
end forward

global type w_docto_pendiente_estructura from window
integer width = 3717
integer height = 2508
boolean titlebar = true
string title = "Documentos Pendientes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_exportar cb_exportar
cb_glosa cb_glosa
dw_periodo dw_periodo
rb_periodo rb_periodo
rb_cierre rb_cierre
cb_ingreso_docto_pend cb_ingreso_docto_pend
dw_fecha_cierre dw_fecha_cierre
cb_docto_pendiente cb_docto_pendiente
cb_ordenar cb_ordenar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_cta_cte cb_cta_cte
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
dw_docto_pendiente dw_docto_pendiente
gb_3 gb_3
dw_seleccion dw_seleccion
gb_1 gb_1
gb_seleccion gb_seleccion
end type
global w_docto_pendiente_estructura w_docto_pendiente_estructura

type variables
Long	il_mes,il_ano,il_row
end variables

on w_docto_pendiente_estructura.create
this.cb_exportar=create cb_exportar
this.cb_glosa=create cb_glosa
this.dw_periodo=create dw_periodo
this.rb_periodo=create rb_periodo
this.rb_cierre=create rb_cierre
this.cb_ingreso_docto_pend=create cb_ingreso_docto_pend
this.dw_fecha_cierre=create dw_fecha_cierre
this.cb_docto_pendiente=create cb_docto_pendiente
this.cb_ordenar=create cb_ordenar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_cta_cte=create cb_cta_cte
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_docto_pendiente=create dw_docto_pendiente
this.gb_3=create gb_3
this.dw_seleccion=create dw_seleccion
this.gb_1=create gb_1
this.gb_seleccion=create gb_seleccion
this.Control[]={this.cb_exportar,&
this.cb_glosa,&
this.dw_periodo,&
this.rb_periodo,&
this.rb_cierre,&
this.cb_ingreso_docto_pend,&
this.dw_fecha_cierre,&
this.cb_docto_pendiente,&
this.cb_ordenar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_cta_cte,&
this.pb_aceptar,&
this.cb_cerrar,&
this.dw_docto_pendiente,&
this.gb_3,&
this.dw_seleccion,&
this.gb_1,&
this.gb_seleccion}
end on

on w_docto_pendiente_estructura.destroy
destroy(this.cb_exportar)
destroy(this.cb_glosa)
destroy(this.dw_periodo)
destroy(this.rb_periodo)
destroy(this.rb_cierre)
destroy(this.cb_ingreso_docto_pend)
destroy(this.dw_fecha_cierre)
destroy(this.cb_docto_pendiente)
destroy(this.cb_ordenar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_cta_cte)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_docto_pendiente)
destroy(this.gb_3)
destroy(this.dw_seleccion)
destroy(this.gb_1)
destroy(this.gb_seleccion)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_mes_ini,ll_ano_ini
datetime	ldt_fecha_termino

gf_centrar(w_docto_pendiente_estructura)
dw_periodo.visible														= false
dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/10/2010'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)
dw_docto_pendiente.dataobject									='dw_docto_pendiente_estructura'
dw_docto_pendiente.settransobject(sqlca)
dw_periodo.dataobject												='dwe_lista_periodo_docto_pend'
dw_periodo.settransobject(sqlca)

if gl_proceso>=4 then
	cb_ingreso_docto_pend.visible								= true
	if gs_conexion	= "Parque El Prado" then
		ll_parque													= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque													= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque													= 801
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
	dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	dw_docto_pendiente.reset()
	dw_seleccion.accepttext()
	
elseif gl_proceso=3 then
	cb_ingreso_docto_pend.visible								= false
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
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
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',gs_user)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		end if
	dw_docto_pendiente.reset()
	dw_seleccion.accepttext()

elseif gl_proceso=2 then
	cb_ingreso_docto_pend.visible								= false
	SELECT	"SUPERVISOR"."COD_PARQUE",   
        	 	"SUPERVISOR"."COD_JEFE"  
   INTO		:ll_parque,   
         	:ls_jefe  
   FROM 		"SUPERVISOR"  
   WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		dw_seleccion.object.supervisor.protect				= 1
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
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',ls_jefe)
		dw_seleccion.setitem(1,'supervisor',gs_user)
	end if
	dw_docto_pendiente.reset()
	dw_seleccion.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_docto_pendiente_estructura)
end if

end event

type cb_exportar from commandbutton within w_docto_pendiente_estructura
integer x = 2094
integer y = 2260
integer width = 238
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_docto_pendiente
if dw_docto_pendiente.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_glosa from commandbutton within w_docto_pendiente_estructura
integer x = 1531
integer y = 2260
integer width = 434
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Glosa excepción"
end type

event clicked;string	ls_base,ls_serie,ls_string
long	ll_grupo,ll_codigo
double	ldb_numero

dw_docto_pendiente.accepttext()
if dw_docto_pendiente.rowcount() > 0 then
	ls_base				= dw_docto_pendiente.getitemstring(il_row,'cd_folio_detalle_excepcion_base')
	ls_serie				= dw_docto_pendiente.getitemstring(il_row,'cd_folio_detalle_excepcion_serie')
	ldb_numero			= dw_docto_pendiente.getitemnumber(il_row,'cd_folio_detalle_excepcion_numero')
	ll_grupo				= dw_docto_pendiente.getitemnumber(il_row,'cd_folio_detalle_excepcion_codigo_grupo_excepcion')
	ll_codigo				= dw_docto_pendiente.getitemnumber(il_row,'codigo_excepcion')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie)  and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero >0 then
		ls_string			= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(ll_grupo)+'~t'+string(ll_codigo)
		if isvalid(w_glosa_excepcion) then close(w_glosa_excepcion)
		OpenWithParm (w_glosa_excepcion,ls_string)
	end if
end if




end event

type dw_periodo from datawindow within w_docto_pendiente_estructura
integer x = 576
integer y = 144
integer width = 946
integer height = 96
integer taborder = 60
string title = "none"
string dataobject = "dwe_lista_periodo_docto_pend"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_docto_pendiente.reset()
end event

type rb_periodo from radiobutton within w_docto_pendiente_estructura
integer x = 78
integer y = 152
integer width = 443
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Período"
end type

event clicked;long	ll_new,ll_ano,ll_mes

dw_fecha_cierre.visible									= false
dw_periodo.visible											= true
ll_new														= dw_periodo.insertrow(0)

SELECT DISTINCT MAX("CD_FOLIO"."ANO_CIERRE")
INTO		:ll_ano  
FROM		"CD_FOLIO"  
USING	sqlca;
if sqlca.sqlcode=0 then
	SELECT DISTINCT MAX("CD_FOLIO"."MES_CIERRE")
	INTO 		:ll_mes  
	FROM		"CD_FOLIO"  
	WHERE	"CD_FOLIO"."ANO_CIERRE" = :ll_ano
	USING	sqlca;
end if
if isnull(ll_mes) or ll_mes=0 then ll_mes=month(date(gdt_fec_sistema))
if isnull(ll_ano) or ll_ano=0 then ll_ano=year(date(gdt_fec_sistema))
dw_periodo.setitem(ll_new,'mes',ll_mes)
dw_periodo.setitem(ll_new,'ano',ll_ano)
dw_periodo.accepttext()
dw_periodo.setfocus()
end event

type rb_cierre from radiobutton within w_docto_pendiente_estructura
integer x = 78
integer y = 76
integer width = 443
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cierre Ventas"
boolean checked = true
end type

event clicked;dw_fecha_cierre.visible									= true
dw_periodo.visible											= false
dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/10/2010'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)
end event

type cb_ingreso_docto_pend from commandbutton within w_docto_pendiente_estructura
boolean visible = false
integer x = 937
integer y = 2260
integer width = 594
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingreso Docto. Pendiente"
end type

event clicked;string	ls_string

gs_opcion_docto='I'
if isvalid(w_ingreso_detalle_excepciones) then close(w_ingreso_detalle_excepciones)
	OpenWithParm (w_ingreso_detalle_excepciones,ls_string)


end event

type dw_fecha_cierre from datawindow within w_docto_pendiente_estructura
integer x = 677
integer y = 148
integer width = 841
integer height = 100
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

event clicked;dw_docto_pendiente.reset()

end event

event itemchanged;dw_docto_pendiente.reset()

end event

type cb_docto_pendiente from commandbutton within w_docto_pendiente_estructura
integer x = 498
integer y = 2260
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

event clicked;string	ls_base,ls_serie,ls_string
double	ldb_numero

dw_docto_pendiente.accepttext()
if dw_docto_pendiente.rowcount() > 0 then
	ls_base				= dw_docto_pendiente.getitemstring(il_row,'cd_folio_detalle_excepcion_base')
	ls_serie				= dw_docto_pendiente.getitemstring(il_row,'cd_folio_detalle_excepcion_serie')
	ldb_numero			= dw_docto_pendiente.getitemnumber(il_row,'cd_folio_detalle_excepcion_numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie)  and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero >0 then
		ls_string		= 'M'+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+gs_depto
		if isvalid(w_docto_pendiente_promesa) then close(w_docto_pendiente_promesa)
		OpenWithParm (w_docto_pendiente_promesa,ls_string)
	end if
end if
end event

type cb_ordenar from commandbutton within w_docto_pendiente_estructura
integer x = 2331
integer y = 2260
integer width = 238
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_docto_pendiente.rowcount() > 0 then
	setnull (nulo)
	dw_docto_pendiente.SETSORT(NULO)
	dw_docto_pendiente.SORT()
end if
end event

type cb_limpiar from commandbutton within w_docto_pendiente_estructura
integer x = 2889
integer y = 2260
integer width = 238
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_docto_pendiente_estructura.triggerevent(open!)
end event

type cb_imprimir from commandbutton within w_docto_pendiente_estructura
event ue_mousemove pbm_mousemove
integer x = 2565
integer y = 2260
integer width = 238
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_docto_pendiente.rowcount()>0 then
	f_Print( dw_docto_pendiente )
end if
end event

type cb_cta_cte from commandbutton within w_docto_pendiente_estructura
integer x = 41
integer y = 2260
integer width = 453
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;if dw_docto_pendiente.rowcount() > 0 then
	if il_row>0 then
		gs_base				= dw_docto_pendiente.getitemstring(il_row,'cd_folio_detalle_excepcion_base')
		gs_serie				= dw_docto_pendiente.getitemstring(il_row,'cd_folio_detalle_excepcion_serie')
		gi_numero			= dw_docto_pendiente.getitemnumber(il_row,'cd_folio_detalle_excepcion_numero')
		if rb_cierre.checked=true then
			gi_rut				= dw_docto_pendiente.getitemnumber(il_row,'cadena_rut')	
		elseif rb_periodo.checked=true then
			gi_rut				= dw_docto_pendiente.getitemnumber(il_row,'revision_contratos_rut')
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

type pb_aceptar from picturebutton within w_docto_pendiente_estructura
integer x = 3072
integer y = 128
integer width = 151
integer height = 132
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_jefe,ls_superv,ls_nulo,ls_pasa,ls_codigo
long		ll_cod_parque,ll_tot_reg,ll_mes,ll_ano
datetime	ldt_fecha_cierre

dw_docto_pendiente.reset()
dw_seleccion.accepttext()
dw_fecha_cierre.accepttext()
dw_periodo.accepttext()
ll_cod_parque															= dw_seleccion.getitemnumber(1,'parque')
ls_jefe																	= dw_seleccion.getitemstring(1,'jefe')
ls_superv																= dw_seleccion.getitemstring(1,'supervisor')
ls_pasa																	= 'N'
if rb_cierre.checked=true then
	ldt_fecha_cierre													= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
	if not isnull(ldt_fecha_cierre) then
		if not isnull(ll_cod_parque) and ll_cod_parque > 0 and not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_superv) and ls_superv <>'' then
			dw_docto_pendiente.dataobject						='dw_docto_pendiente_estructura_sup'
			dw_docto_pendiente.settransobject(sqlca)
			ls_codigo														= ls_superv
			ls_pasa														= 'S'
		elseif not isnull(ll_cod_parque) and ll_cod_parque > 0 and not isnull(ls_jefe) and ls_jefe<>'' and (isnull(ls_superv) or ls_superv ='') then
			dw_docto_pendiente.dataobject						='dw_docto_pendiente_estructura_jef'
			dw_docto_pendiente.settransobject(sqlca)
			ls_codigo														= ls_jefe
			ls_pasa														= 'S'
		end if
		if ls_pasa = 'S' then
			ll_tot_reg													= dw_docto_pendiente.retrieve(ls_codigo,ldt_fecha_cierre)
			if ll_tot_reg > 0 then
				dw_docto_pendiente.object.usuario.text			= gs_user
				dw_docto_pendiente.object.titulo2_t.text			= 'Documentos Pendientes Cierre ventas Finalizado Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')
			else
				messagebox("Advertencia","No Registra Documentos Pendientes")
			end if
		else
			if isnull(ll_cod_parque) or ll_cod_parque=0 then
				messagebox("Advertencia", "Debe Ingresar Parque")
				dw_seleccion.setfocus()
				dw_seleccion.setcolumn('parque')
			elseif isnull(ls_jefe) or ls_jefe='' then
				messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
				dw_seleccion.setfocus()
				dw_seleccion.setcolumn('jefe')
			elseif isnull(ls_superv) or ls_superv='' then
				messagebox("Advertencia", "Debe Ingresar Supervisor de Ventas")
				dw_seleccion.setfocus()
				dw_seleccion.setcolumn('supervisor')
			end if
		end if
	else
		if isnull(ldt_fecha_cierre) then
			messagebox("Advertencia", "Debe Ingresar Fecha Cierre")
			dw_fecha_cierre.setfocus()
			dw_fecha_cierre.setcolumn('cierre_ventas')
		end if
	end if
elseif rb_periodo.checked=true then
	ll_mes																= dw_periodo.getitemnumber(1,'mes')
	ll_ano																	= dw_periodo.getitemnumber(1,'ano')
	if not isnull(ll_mes) and ll_mes>0 and not isnull(ll_ano) and ll_ano>0 then
		ldt_fecha_cierre												= f_fecha_fin(ll_mes,ll_ano)
		if not isnull(ll_cod_parque) and ll_cod_parque > 0 and not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_superv) and ls_superv <>'' then
			dw_docto_pendiente.dataobject						='dw_docto_pendiente_estructura_sup_per'
			dw_docto_pendiente.settransobject(sqlca)
			ls_codigo														= ls_superv
			ls_pasa														= 'S'
		elseif not isnull(ll_cod_parque) and ll_cod_parque > 0 and not isnull(ls_jefe) and ls_jefe<>'' and (isnull(ls_superv) or ls_superv ='') then
			dw_docto_pendiente.dataobject						='dw_docto_pendiente_estructura_jef_per'
			dw_docto_pendiente.settransobject(sqlca)
			ls_codigo														= ls_jefe
			ls_pasa														= 'S'
		end if
		if ls_pasa = 'S' then
			ll_tot_reg													= dw_docto_pendiente.retrieve(ls_codigo,ll_mes,ll_ano)
			if ll_tot_reg > 0 then
				dw_docto_pendiente.object.usuario.text			= gs_user
				dw_docto_pendiente.object.titulo2_t.text			= 'Documentos Pendientes Cierre ventas Finalizado Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')
			else
				messagebox("Advertencia","No Registra Documentos Pendientes")
			end if
		else
			if isnull(ll_cod_parque) or ll_cod_parque=0 then
				messagebox("Advertencia", "Debe Ingresar Parque")
				dw_seleccion.setfocus()
				dw_seleccion.setcolumn('parque')
			elseif isnull(ls_jefe) or ls_jefe='' then
				messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
				dw_seleccion.setfocus()
				dw_seleccion.setcolumn('jefe')
			elseif isnull(ls_superv) or ls_superv='' then
				messagebox("Advertencia", "Debe Ingresar Supervisor de Ventas")
				dw_seleccion.setfocus()
				dw_seleccion.setcolumn('supervisor')
			end if
		end if
	else
		if isnull(ll_mes) or ll_mes=0  then
			messagebox("Advertencia", "Debe Ingresar Mes Período")
			dw_periodo.setfocus()
			dw_periodo.setcolumn('mes')
		elseif isnull(ll_ano) or ll_ano=0  then
			messagebox("Advertencia", "Debe Ingresar Mes Período")
			dw_periodo.setfocus()
			dw_periodo.setcolumn('ano')
		end if
	end if
end if

end event

type cb_cerrar from commandbutton within w_docto_pendiente_estructura
integer x = 3397
integer y = 2260
integer width = 261
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_docto_pendiente_estructura)
end event

type dw_docto_pendiente from datawindow within w_docto_pendiente_estructura
integer x = 37
integer y = 292
integer width = 3621
integer height = 1936
integer taborder = 70
string title = "none"
string dataobject = "dw_docto_pendiente_estructura_jef_per"
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

event doubleclicked;string	ls_base,ls_serie,ls_string
long	ll_tot_reg,ll_excep,ll_mes,ll_ano
datetime	ldt_fec_fin
double	ldb_numero

ll_tot_reg						= 	dw_docto_pendiente.rowcount()
if ll_tot_reg>0 then
	ll_excep						= dw_docto_pendiente.getitemnumber(il_row,'codigo_excepcion')
	if ll_excep=25 then
		ls_base					= dw_docto_pendiente.getitemstring(il_row,'cd_folio_detalle_excepcion_base')
		ls_serie					= dw_docto_pendiente.getitemstring(il_row,'cd_folio_detalle_excepcion_serie')
		ldb_numero				= dw_docto_pendiente.getitemnumber(il_row,'cd_folio_detalle_excepcion_numero')
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
			SELECT	"MES_CIERRE",	"ANO_CIERRE"  
			INTO 		:ll_mes,			:ll_ano  
			FROM 	"CD_FOLIO"  
			WHERE 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
						( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						( "CD_FOLIO"."NUMERO" = :ldb_numero )
			USING	sqlca;
			if isnull(ll_mes) then ll_mes=0
			if isnull(ll_ano) then ll_ano=0
			if ll_mes>0 and ll_ano>0 then
				ldt_fec_fin			= f_fecha_fin(ll_mes,ll_ano)
				if ldt_fec_fin>=datetime(date(string('30/06/2014')),time('00:00:00')) then
					ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(il_row)
					if isvalid(w_cd_mantenedor_contrato) then close (w_cd_mantenedor_contrato)
					OpenWithparm(w_cd_mantenedor_contrato,ls_string)
				else
					messagebox("Advertencia","Contrato No Registra Detalle Modificación Contrato, Período Ventas "+string(ldt_fec_fin,'dd/mm/yyyy'))
				end if
			end if
		end if
	end if
end if
end event

event rowfocuschanged;long	ll_estado

if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	if il_row>0 then
		ll_estado							= dw_docto_pendiente.getitemnumber(il_row,'cd_folio_ult_estado')
		if ll_estado=11 then
			cb_cta_cte.enabled		= true			
		else
			cb_cta_cte.enabled		= false			
		end if
	end if
end if
end event

type gb_3 from groupbox within w_docto_pendiente_estructura
integer x = 2071
integer y = 2216
integer width = 1083
integer height = 152
integer taborder = 100
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_seleccion from datawindow within w_docto_pendiente_estructura
integer x = 823
integer y = 60
integer width = 2208
integer height = 196
integer taborder = 40
string title = "none"
string dataobject = "dwe_seleccion_opcion"
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
		dw_docto_pendiente.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_docto_pendiente.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_docto_pendiente.reset()
END CHOOSE
end event

event itemfocuschanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_docto_pendiente.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_docto_pendiente.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_docto_pendiente.reset()
END CHOOSE
end event

type gb_1 from groupbox within w_docto_pendiente_estructura
integer x = 32
integer y = 8
integer width = 498
integer height = 256
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Tipo Busqueda"
end type

type gb_seleccion from groupbox within w_docto_pendiente_estructura
integer x = 562
integer y = 8
integer width = 2487
integer height = 256
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Selección"
end type

