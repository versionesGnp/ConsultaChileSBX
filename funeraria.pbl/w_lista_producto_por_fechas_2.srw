forward
global type w_lista_producto_por_fechas_2 from window
end type
type st_1 from statictext within w_lista_producto_por_fechas_2
end type
type ddplb_base from dropdownpicturelistbox within w_lista_producto_por_fechas_2
end type
type cb_benef from commandbutton within w_lista_producto_por_fechas_2
end type
type cb_confirma from commandbutton within w_lista_producto_por_fechas_2
end type
type cb_imprimir from commandbutton within w_lista_producto_por_fechas_2
end type
type dw_orden from datawindow within w_lista_producto_por_fechas_2
end type
type em_numero from editmask within w_lista_producto_por_fechas_2
end type
type cb_elimina from commandbutton within w_lista_producto_por_fechas_2
end type
type cb_limpiar from commandbutton within w_lista_producto_por_fechas_2
end type
type cb_revision_ctto from commandbutton within w_lista_producto_por_fechas_2
end type
type cb_cta_corriente from commandbutton within w_lista_producto_por_fechas_2
end type
type cb_exportar from commandbutton within w_lista_producto_por_fechas_2
end type
type cb_ordenar from commandbutton within w_lista_producto_por_fechas_2
end type
type cb_filtrar from commandbutton within w_lista_producto_por_fechas_2
end type
type cb_cerrar from commandbutton within w_lista_producto_por_fechas_2
end type
type pb_aceptar from picturebutton within w_lista_producto_por_fechas_2
end type
type st_hasta from statictext within w_lista_producto_por_fechas_2
end type
type em_inicio from editmask within w_lista_producto_por_fechas_2
end type
type em_termino from editmask within w_lista_producto_por_fechas_2
end type
type st_desde from statictext within w_lista_producto_por_fechas_2
end type
type p_inicio from picture within w_lista_producto_por_fechas_2
end type
type p_termino from picture within w_lista_producto_por_fechas_2
end type
type gb_periodo from groupbox within w_lista_producto_por_fechas_2
end type
type gb_1 from groupbox within w_lista_producto_por_fechas_2
end type
type gb_2 from groupbox within w_lista_producto_por_fechas_2
end type
type dw_lista from datawindow within w_lista_producto_por_fechas_2
end type
end forward

global type w_lista_producto_por_fechas_2 from window
integer width = 4046
integer height = 2060
boolean titlebar = true
string title = "Listado Registros Funeraria Por Rango de Fechas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
ddplb_base ddplb_base
cb_benef cb_benef
cb_confirma cb_confirma
cb_imprimir cb_imprimir
dw_orden dw_orden
em_numero em_numero
cb_elimina cb_elimina
cb_limpiar cb_limpiar
cb_revision_ctto cb_revision_ctto
cb_cta_corriente cb_cta_corriente
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
pb_aceptar pb_aceptar
st_hasta st_hasta
em_inicio em_inicio
em_termino em_termino
st_desde st_desde
p_inicio p_inicio
p_termino p_termino
gb_periodo gb_periodo
gb_1 gb_1
gb_2 gb_2
dw_lista dw_lista
end type
global w_lista_producto_por_fechas_2 w_lista_producto_por_fechas_2

type variables
long il_row
end variables

on w_lista_producto_por_fechas_2.create
this.st_1=create st_1
this.ddplb_base=create ddplb_base
this.cb_benef=create cb_benef
this.cb_confirma=create cb_confirma
this.cb_imprimir=create cb_imprimir
this.dw_orden=create dw_orden
this.em_numero=create em_numero
this.cb_elimina=create cb_elimina
this.cb_limpiar=create cb_limpiar
this.cb_revision_ctto=create cb_revision_ctto
this.cb_cta_corriente=create cb_cta_corriente
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.pb_aceptar=create pb_aceptar
this.st_hasta=create st_hasta
this.em_inicio=create em_inicio
this.em_termino=create em_termino
this.st_desde=create st_desde
this.p_inicio=create p_inicio
this.p_termino=create p_termino
this.gb_periodo=create gb_periodo
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_lista=create dw_lista
this.Control[]={this.st_1,&
this.ddplb_base,&
this.cb_benef,&
this.cb_confirma,&
this.cb_imprimir,&
this.dw_orden,&
this.em_numero,&
this.cb_elimina,&
this.cb_limpiar,&
this.cb_revision_ctto,&
this.cb_cta_corriente,&
this.cb_exportar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_cerrar,&
this.pb_aceptar,&
this.st_hasta,&
this.em_inicio,&
this.em_termino,&
this.st_desde,&
this.p_inicio,&
this.p_termino,&
this.gb_periodo,&
this.gb_1,&
this.gb_2,&
this.dw_lista}
end on

on w_lista_producto_por_fechas_2.destroy
destroy(this.st_1)
destroy(this.ddplb_base)
destroy(this.cb_benef)
destroy(this.cb_confirma)
destroy(this.cb_imprimir)
destroy(this.dw_orden)
destroy(this.em_numero)
destroy(this.cb_elimina)
destroy(this.cb_limpiar)
destroy(this.cb_revision_ctto)
destroy(this.cb_cta_corriente)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.pb_aceptar)
destroy(this.st_hasta)
destroy(this.em_inicio)
destroy(this.em_termino)
destroy(this.st_desde)
destroy(this.p_inicio)
destroy(this.p_termino)
destroy(this.gb_periodo)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_lista)
end on

event open;date ldt_fec_fin,ldt_fec_ini

gf_centrar(w_lista_producto_por_fechas_2)

dw_lista.settransobject(sqlca)
dw_orden.settransobject(sqlca)
//dw_lista.insertrow(0)
em_termino.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
ldt_fec_fin						= date(em_termino.text)
em_inicio.text					= string('01/'+ string(month(date(gdt_fec_sistema)),'00')+ '/' +string(year(date(gdt_fec_sistema)),'0000'))
ldt_fec_ini						= date(em_inicio.text)

ddplb_base.reset()
ddplb_base.additem('G - Crematorio')
ddplb_base.additem('F - Funeraria')
ddplb_base.text	= 'F - Funeraria'

if gs_depto='I' or ( gs_depto = 'H' and gl_proceso > 0 ) then
	cb_elimina.visible			= true
end if
end event

type st_1 from statictext within w_lista_producto_por_fechas_2
integer x = 1358
integer y = 84
integer width = 165
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Base:"
boolean focusrectangle = false
end type

type ddplb_base from dropdownpicturelistbox within w_lista_producto_por_fechas_2
integer x = 1527
integer y = 64
integer width = 750
integer height = 376
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

event selectionchanged;dw_lista.reset()
end event

type cb_benef from commandbutton within w_lista_producto_por_fechas_2
integer x = 1929
integer y = 1812
integer width = 334
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Beneficiarios"
end type

event clicked;string		ls_string,ls_base,ls_serie
long		ll_tipo_benef,ll_capac,ll_cod_parque,ll_row
Double	ll_numero

dw_lista.accepttext()
if il_row > 0 and dw_lista.rowcount()>0 then
	ll_row														= dw_lista.getrow()
	ls_base													= dw_lista.getitemstring(ll_row,'base')
	ls_serie													= dw_lista.getitemstring(ll_row,'serie')
	ll_numero												= dw_lista.getitemnumber(ll_row,'numero')
	ll_tipo_benef											= dw_lista.getitemnumber(ll_row,'tipo_beneficiarios')
	ll_cod_parque											= dw_lista.getitemnumber(ll_row,'parque')
	ll_capac													= dw_lista.getitemnumber(ll_row,'capacidad')
	if not isnull(ll_tipo_benef) and ll_tipo_benef>0 then
		ls_string												= string(ll_tipo_benef)+'~t'+string(ll_cod_parque)+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_capac)
		openwithparm(w_producto_beneficiarios,ls_string)
	end if
end if
end event

type cb_confirma from commandbutton within w_lista_producto_por_fechas_2
integer x = 910
integer y = 1812
integer width = 366
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Datos Servicio"
end type

event clicked;string		ls_uso,ls_est_valida,ls_tipo_infor,ls_string,ls_base,ls_serie
long		ll_tipo_benef,ll_cant_benef,ll_tipo_servicio,ll_digitada,ll_cod_parque
Double	ll_numero

dw_lista.accepttext()
if il_row > 0 and dw_lista.rowcount()>0 then
	ls_base													= dw_lista.getitemstring(1,'base')
	ls_serie													= dw_lista.getitemstring(1,'serie')
	ll_numero												= dw_lista.getitemnumber(1,'numero')
	ls_est_valida											= 'D'
	ll_tipo_benef											= dw_lista.getitemnumber(1,'tipo_beneficiarios')
	ll_cant_benef											= dw_lista.getitemnumber(1,'capacidad')
	ll_tipo_servicio											= dw_lista.getitemnumber(1,'codigo_servicio')
	ll_cod_parque											= dw_lista.getitemnumber(1,'parque')
	ls_uso													= dw_lista.getitemstring(1,'uso')
	ls_tipo_infor												= 'S'
	
	if not isnull(ll_tipo_benef) and ll_tipo_benef>0 and not isnull(ll_cant_benef) and ll_cant_benef>0 and not isnull(ll_tipo_servicio) and ll_tipo_servicio>0 and not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_uso) and ls_uso<>'' then
		ls_string												= string(ll_tipo_benef)+'~t'+string(ll_cant_benef)+'~t'+string(ll_tipo_servicio)+'~t'+string(ll_cod_parque)+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+ls_uso+'~t'+ls_est_valida+'~t'+ls_tipo_infor
		openwithparm(w_tipo_servicio_detalle,ls_string)
	end if
end if
end event

type cb_imprimir from commandbutton within w_lista_producto_por_fechas_2
event ue_mousemove pbm_mousemove
integer x = 1275
integer y = 1812
integer width = 480
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Impr.Orden Venta."
end type

event clicked;string	ls_base,ls_serie
long	ll_row,ll_rut,ll_tot_reg
double ldb_numero

if il_row > 0 and dw_lista.rowcount()>0 then
	ll_row				= dw_lista.getrow()
	ls_base			= dw_lista.getitemstring(ll_row,'base')
	ls_serie			= dw_lista.getitemstring(ll_row,'serie')
	ldb_numero		= dw_lista.getitemnumber(ll_row,'numero')
	ll_rut				= dw_lista.getitemnumber(ll_row,'rut')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		ll_tot_reg		= dw_orden.retrieve(ll_rut,ls_base,ls_serie,ldb_numero)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registar Datos para Imprimir")
		else
			dw_orden.object.usuario.text							= gs_user
			f_Print( dw_orden )
		end if
	end if
end if
end event

type dw_orden from datawindow within w_lista_producto_por_fechas_2
integer x = 1531
integer y = 2008
integer width = 686
integer height = 400
integer taborder = 60
string title = "none"
string dataobject = "dwe_imprimir_orden_venta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_numero from editmask within w_lista_producto_por_fechas_2
boolean visible = false
integer x = 2848
integer y = 1812
integer width = 443
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###0"
string displaydata = "~r"
end type

type cb_elimina from commandbutton within w_lista_producto_por_fechas_2
boolean visible = false
integer x = 2405
integer y = 1812
integer width = 434
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar Funeraria"
end type

event clicked;string		ls_base,ls_serie,ls_nulo
long		ll_res,ll_existe_cad,ll_elimina=0
double	ldb_numero

setnull(ls_nulo)
if il_row > 0 and dw_lista.rowcount()>0 then
	//ls_base								= 'F'
	//ls_serie							= 'F'
	ls_base								= dw_lista.getitemstring(dw_lista.getrow(),'base')
	ls_serie								= dw_lista.getitemstring(dw_lista.getrow(),'serie')
	ldb_numero							= dw_lista.getitemnumber(dw_lista.getrow(),'numero')
	if ldb_numero = 0 then
		ll_res								= MessageBox("Eliminar","¿Desea Eliminar Folio Funeraria en Fila ?"+string(dw_lista.getrow()), Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			ldb_numero					= double(em_numero.text)
			em_numero.visible		= true
		end if
	else
		SELECT	COUNT("CADENA"."CODIGO")
		INTO		:ll_existe_cad
		FROM		"CADENA"
		WHERE	"CADENA"."CODIGO" = :gs_base AND
					"CADENA"."SERIE" = :gs_serie AND
					"CADENA"."NUMERO" = :gi_numero
		USING	sqlca;
		if isnull(ll_existe_cad) then ll_existe_cad=0
		if ll_existe_cad>0 then
			messagebox("Advertencia",'Contrato Registrado Se Encuentra Estado Digitado "No Puede Ser Eliminado"' )	
		else
			ll_res							= MessageBox("Advertencia","¿Folio Funeraria se Encuentra Bien Digitado?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				ll_elimina				= f_eliminar_funeraria(ls_base,ls_serie,ldb_numero)
				if ll_elimina=6 then
					messagebox("Eliminar","Contrato Funerario Eliminado")
					em_numero.text	= ls_nulo
				end if
			end if
		end if	
	end if
end if
end event

type cb_limpiar from commandbutton within w_lista_producto_por_fechas_2
integer x = 3045
integer y = 60
integer width = 219
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
ddplb_base.reset()
if dw_lista.rowcount() > 0 then dw_lista.reset()

end event

type cb_revision_ctto from commandbutton within w_lista_producto_por_fechas_2
integer x = 361
integer y = 1812
integer width = 338
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Revisión Ctto."
end type

event clicked;string 	ls_base,ls_serie,param,ls_dv,ls_moneda,ls_estado,ls_base_asoc,ls_uso
long 	 	ll_rut,ll_parque,ll_new,ll_count,ll_cod_seguro,ll_estado_reg,ll_reg,ll_row,ll_cod_parque
Double	ll_numero,ldb_suma,ldb_monto,lld_uf

if il_row > 0 and dw_lista.rowcount()>0 then
	ll_row				= dw_lista.getrow()
	ls_base			= dw_lista.getitemstring(ll_row,'base')
	ls_serie			= dw_lista.getitemstring(ll_row,'serie')
	ll_numero		= dw_lista.getitemnumber(ll_row,'numero')
	ll_rut				= dw_lista.getitemnumber(ll_row,'rut')
	ls_dv				= dw_lista.getitemstring(ll_row,'dv')
	ll_cod_parque	= dw_lista.getitemnumber(ll_row,'parque')
	ls_estado		= dw_lista.getitemstring(ll_row,'estado_revision')
	ls_uso			= dw_lista.getitemstring(ll_row,'uso')
	ls_moneda		= dw_lista.getitemstring(ll_row,'moneda')
	if isvalid(w_validar_promesa_operaciones) then close(w_validar_promesa_operaciones)
	open(w_validar_promesa_operaciones)
	if isvalid(w_validar_promesa_operaciones) then
		if ls_base='O' or ls_base='U' then
			w_validar_promesa_operaciones.dw_revision.dataobject	= 'dw_revision_contratos_promesa'
			w_validar_promesa_operaciones.dw_revision.settransobject(sqlca)
			w_validar_promesa_operaciones.dw_revision.getchild('area',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			if idw_detalle2.retrieve(ll_cod_parque)=0 then
				idw_detalle2.insertrow(0)
			end if
			ll_new																	= w_validar_promesa_operaciones.dw_revision.insertrow(0)
			w_validar_promesa_operaciones.dw_revision.setitem(ll_new,'pie',0)
		elseif ls_base='L' then
			ls_base_asoc															= dw_lista.getitemstring(ll_row,'revision_contratos_base_asoc')
			w_validar_promesa_operaciones.dw_revision.dataobject	= 'dw_revision_contratos_liberador'
			w_validar_promesa_operaciones.dw_revision.settransobject(sqlca)
			
			w_validar_promesa_operaciones.dw_revision.getchild('area',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			if idw_detalle2.retrieve(ll_cod_parque)=0 then
				idw_detalle2.insertrow(0)
			end if
			
			w_validar_promesa_operaciones.dw_revision.getchild('serie_asoc',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.retrieve(ls_base_asoc)=0 then
				idw_detalle.insertrow(0)
			end if
			
			ll_new																	= w_validar_promesa_operaciones.dw_revision.insertrow(0)
			w_validar_promesa_operaciones.dw_revision.setitem(ll_new,'pie',0)
		
		elseif ls_base='F' or ls_base='G' or ls_base='V' then
			w_validar_promesa_operaciones.dw_revision.dataobject	= 'dw_revision_contratos_producto'
			w_validar_promesa_operaciones.dw_revision.settransobject(sqlca)
			
			w_validar_promesa_operaciones.dw_revision.getchild('area',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			if idw_detalle2.retrieve(ll_cod_parque)=0 then
				idw_detalle2.insertrow(0)
			end if
			w_validar_promesa_operaciones.dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
			idw_detalle1.settransobject(sqlca)
			if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
				idw_detalle1.insertrow(0)
			end if
			w_validar_promesa_operaciones.dw_revision.getchild('codigo_servicio',idw_detalle3)
			idw_detalle3.settransobject(sqlca)
			if idw_detalle3.retrieve(ll_cod_parque,ls_uso,ls_serie,ls_moneda)=0 then
				idw_detalle3.insertrow(0)
			end if
			ll_new																	= w_validar_promesa_operaciones.dw_revision.insertrow(0)
		end if
		w_validar_promesa_operaciones.em_rut.text						= string(ll_rut,"###,###,###,###,###")
		w_validar_promesa_operaciones.em_dv.text						= trim(ls_dv)
		w_validar_promesa_operaciones.dw_base.setitem(1,'base',ls_base)
		w_validar_promesa_operaciones.wf_ddlb_serie(ls_base)
		w_validar_promesa_operaciones.ddlb_serie.text					= trim(ls_serie)
		w_validar_promesa_operaciones.em_numero.text					= string(ll_numero,"###,###,###,###,###")
		w_validar_promesa_operaciones.dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto)
		w_validar_promesa_operaciones.dw_lista_obs.retrieve(ll_rut,ls_base,ls_serie,ll_numero)
		w_validar_promesa_operaciones.dw_ctto_asoc.retrieve(ll_rut)
		w_validar_promesa_operaciones.dw_lista_rezagos.retrieve(ll_rut)
		SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),
						SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
		INTO			:ll_count,
						:ldb_suma
		FROM 		"SEGURO_ASOCIADOS"  
		WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
					  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
					  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
					  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
		if ll_count > 0 then
			DECLARE x1 CURSOR FOR  
			SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
							"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
							"SEGURO_ASOCIADOS"."ESTADO_REG"  
			FROM 		"SEGURO_ASOCIADOS"  
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				do while sqlca.sqlcode=0
					Fetch x1 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
					if not isnull(ll_cod_seguro) then
						if ll_estado_reg = 0 then
							ll_reg = w_validar_promesa_operaciones.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_validar_promesa_operaciones.dw_seguro.RowCount())
							if ll_reg > 0 then
								w_validar_promesa_operaciones.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
							end if
						end if
					end if
					setnull(ll_cod_seguro)
				loop
			end if
			close x1;
			w_validar_promesa_operaciones.dw_seguro.accepttext()
			if isnull(ldb_suma) then ldb_suma=0
			if ldb_suma > 0 then
				lld_uf			= w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'uf_fecha_ctto')
				ls_moneda	= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'moneda')
				if ls_moneda='1' then
					ldb_suma	= round(ldb_suma * lld_uf,4)
				end if
			end if
			w_validar_promesa_operaciones.dw_revision.setitem(1,'c_total_cuota',ldb_suma)
			w_validar_promesa_operaciones.dw_revision.accepttext()
		end if
		if ls_estado='V' then
			w_validar_promesa_operaciones.dw_seguro.enabled			= true
		else
			w_validar_promesa_operaciones.dw_seguro.enabled			= false
		end if
		
		if ls_base='V' then
			w_validar_promesa_operaciones.cb_ingreso_benef.visible	= false
		else
			w_validar_promesa_operaciones.cb_ingreso_benef.visible	= true
		end if
		
		if ls_base = 'F' or ls_base='G' or ls_base='V' then
			w_validar_promesa_operaciones.dw_seguro.visible			= false
			w_validar_promesa_operaciones.dw_base.enabled			= false
			w_validar_promesa_operaciones.ddlb_serie.enabled			= false
			w_validar_promesa_operaciones.em_numero.enabled		= false
			w_validar_promesa_operaciones.em_rut.enabled				= false
			w_validar_promesa_operaciones.em_dv.enabled				= false
			w_validar_promesa_operaciones.em_numero.triggerevent(modified!)
			w_validar_promesa_operaciones.em_numero.setfocus()
		//	cb_cerrar.triggerevent(clicked!)
		else
		
	//		w_validar_promesa_operaciones.em_numero.triggerevent(modified!)
			w_validar_promesa_operaciones.dw_revision.enabled		= true
			w_validar_promesa_operaciones.dw_base.enabled			= false
			w_validar_promesa_operaciones.ddlb_serie.enabled			= false
			w_validar_promesa_operaciones.em_numero.enabled		= false
			w_validar_promesa_operaciones.em_rut.enabled				= true
			w_validar_promesa_operaciones.em_dv.enabled				= true
			w_validar_promesa_operaciones.dw_revision.setfocus()
	//		cb_cerrar.triggerevent(clicked!)
		end if
	end if
end if
//if il_row > 0 and dw_lista.rowcount()>0 then
//	ll_rut 				= dw_lista.GetItemNumber(il_row, "rut")
//	ls_base			= dw_lista.getitemstring(il_row, "base")
//	ls_serie			= dw_lista.getitemstring(il_row, "serie")
//	ll_numero		= dw_lista.getitemnumber(il_row, "numero")
//	ls_dv				= dw_lista.getitemstring(il_row, "dv")
//	ll_parque			= dw_lista.getitemnumber(il_row, "parque")
//	ls_estado		= dw_lista.getitemstring(il_row,'estado_revision')
//	
//	if isvalid(w_validar_promesa_operaciones) then close(w_validar_promesa_operaciones)
//	open(w_validar_promesa_operaciones)
//	if isvalid(w_validar_promesa_operaciones) then
//		w_validar_promesa_operaciones.em_rut.text = string(gi_rut)
//		w_validar_promesa_operaciones.em_dv.text = string(ls_dv)
//		w_validar_promesa_operaciones.dw_base.setitem(1,'base',gs_base)
//		if gs_base = 'F' then
//			w_validar_promesa_operaciones.dw_revision.dataobject	= 'dw_revision_contratos_producto'
//			w_validar_promesa_operaciones.dw_revision.settransobject(sqlca)
//			
//			w_validar_promesa_operaciones.dw_revision.getchild('area',idw_detalle2)
//			idw_detalle2.settransobject(sqlca)
//			if idw_detalle2.retrieve(ll_parque)=0 then
//				idw_detalle2.insertrow(0)
//			end if
//			
//			w_validar_promesa_operaciones.dw_revision.getchild('codigo_servicio',idw_detalle3)
//			idw_detalle3.settransobject(sqlca)
//			if idw_detalle3.retrieve(ll_parque)=0 then
//				idw_detalle3.insertrow(0)
//			end if
//			ll_new																	= w_validar_promesa_operaciones.dw_revision.insertrow(0)
//		end if
//		w_validar_promesa_operaciones.em_rut.text						= string(ll_rut,"###,###,###,###,###")
//		w_validar_promesa_operaciones.em_dv.text						= trim(ls_dv)
//		w_validar_promesa_operaciones.dw_base.setitem(1,'base',ls_base)
//		w_validar_promesa_operaciones.wf_ddlb_serie(ls_base)
//		w_validar_promesa_operaciones.ddlb_serie.text					= trim(ls_serie)
//		w_validar_promesa_operaciones.em_numero.text					= string(ll_numero,"###,###,###,###,###")
//		w_validar_promesa_operaciones.dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto)
//		w_validar_promesa_operaciones.dw_lista_obs.retrieve(ll_rut,ls_base,ls_serie,ll_numero)
//		w_validar_promesa_operaciones.dw_ctto_asoc.retrieve(ll_rut)
//		w_validar_promesa_operaciones.dw_lista_rezagos.retrieve(ll_rut)
//		SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),
//						SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
//		INTO			:ll_count,
//						:ldb_suma
//		FROM 		"SEGURO_ASOCIADOS"  
//		WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
//					  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
//					  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
//					  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
//		if ll_count > 0 then
//			DECLARE x1 CURSOR FOR  
//			SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
//							"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
//							"SEGURO_ASOCIADOS"."ESTADO_REG"  
//			FROM 		"SEGURO_ASOCIADOS"  
//			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
//						  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
//						  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
//						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
//			USING		sqlca;
//			open x1;
//			if sqlca.sqlcode=0 then
//				do while sqlca.sqlcode=0
//					Fetch x1 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
//					if not isnull(ll_cod_seguro) then
//						if ll_estado_reg = 0 then
//							ll_reg = w_validar_promesa_operaciones.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_validar_promesa_operaciones.dw_seguro.RowCount())
//							if ll_reg > 0 then
//								w_validar_promesa_operaciones.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
//							end if
//						end if
//					end if
//					setnull(ll_cod_seguro)
//				loop
//			end if
//			close x1;
//			w_validar_promesa_operaciones.dw_seguro.accepttext()
//			if isnull(ldb_suma) then ldb_suma=0
//			if ldb_suma > 0 then
//				lld_uf			= w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'uf_fecha_ctto')
//				ls_moneda	= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'moneda')
//				if ls_moneda='1' then
//					ldb_suma	= round(ldb_suma * lld_uf,4)
//				end if
//			end if
//			w_validar_promesa_operaciones.dw_revision.setitem(1,'c_total_cuota',ldb_suma)
//			w_validar_promesa_operaciones.dw_revision.accepttext()
//		end if
//		if ls_estado='V' then
//			w_validar_promesa_operaciones.dw_seguro.enabled			= true
//		else
//			w_validar_promesa_operaciones.dw_seguro.enabled			= false
//		end if
//		if ls_base = 'F' then
//			w_validar_promesa_operaciones.dw_seguro.visible			= false
//			w_validar_promesa_operaciones.dw_base.enabled			= false
//			w_validar_promesa_operaciones.ddlb_serie.enabled			= false
//			w_validar_promesa_operaciones.em_numero.enabled		= false
//			w_validar_promesa_operaciones.em_rut.enabled				= false
//			w_validar_promesa_operaciones.em_dv.enabled				= false
//			w_validar_promesa_operaciones.em_numero.triggerevent(modified!)
//			w_validar_promesa_operaciones.em_numero.setfocus()
//		//	cb_cerrar.triggerevent(clicked!)
//		else
//		
//	//		w_validar_promesa_operaciones.em_numero.triggerevent(modified!)
//			w_validar_promesa_operaciones.dw_revision.enabled		= true
//			w_validar_promesa_operaciones.dw_base.enabled			= false
//			w_validar_promesa_operaciones.ddlb_serie.enabled			= false
//			w_validar_promesa_operaciones.em_numero.enabled		= false
//			w_validar_promesa_operaciones.em_rut.enabled				= true
//			w_validar_promesa_operaciones.em_dv.enabled				= true
//			w_validar_promesa_operaciones.dw_revision.setfocus()
//			//cb_cerrar.triggerevent(clicked!)
//		end if
////		w_validar_promesa_operaciones.wf_ddlb_serie(ls_base)
////		w_validar_promesa_operaciones.ddlb_serie.enabled = true
////		w_validar_promesa_operaciones.ddlb_serie.AddItem(gs_serie)
////		w_validar_promesa_operaciones.ddlb_serie.enabled = false
////		w_validar_promesa_operaciones.em_numero.text = string(gi_numero)
//	end if
//else
//	messagebox('Seleción','Debe Seleccionar un contrato.',information!)
//end if
//
//
end event

type cb_cta_corriente from commandbutton within w_lista_producto_por_fechas_2
integer x = 37
integer y = 1812
integer width = 329
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ta Corriente"
end type

event clicked;string ls_base,ls_serie,param
long 	 ll_rut
Double	ll_numero
if il_row > 0 and dw_lista.rowcount()>0 then
	gi_rut 		= dw_lista.GetItemNumber(il_row, "rut")
	gs_base		= dw_lista.getitemstring(il_row, "base")
	gs_serie		= dw_lista.getitemstring(il_row, "serie")
	gi_numero	= dw_lista.getitemnumber(il_row, "numero")
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
		CASE "F","G","V"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			OpenWithParm(w_cuenta_corriente_funeraria,param)	
	END CHOOSE
	//close(w_aviso_mensajes)
	
else
	messagebox('Seleción','Debe Seleccionar un contrato.',information!)
end if

end event

type cb_exportar from commandbutton within w_lista_producto_por_fechas_2
integer x = 3301
integer y = 60
integer width = 219
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_ordenar from commandbutton within w_lista_producto_por_fechas_2
integer x = 3735
integer y = 60
integer width = 219
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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

type cb_filtrar from commandbutton within w_lista_producto_por_fechas_2
integer x = 3515
integer y = 60
integer width = 219
integer height = 84
integer taborder = 40
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
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_cerrar from commandbutton within w_lista_producto_por_fechas_2
integer x = 3675
integer y = 1812
integer width = 306
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_lista_producto_por_fechas_2)
end event

type pb_aceptar from picturebutton within w_lista_producto_por_fechas_2
integer x = 2345
integer y = 32
integer width = 169
integer height = 148
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;long		ll_parque
datetime	ld_fec_ini, ld_fec_fin
string		ls_usuario,ls_jefe_v,ls_base,ls_descrip_base

ld_fec_ini	= datetime(date(em_inicio.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_termino.text),time('23:59:59'))
ls_base		= mid(ddplb_base.text,1,1)

if trim(em_inicio.text)='00/00/0000' or isnull(em_inicio.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_inicio.setfocus()
else
	if trim(em_termino.text)='00/00/0000' or isnull(em_termino.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_termino.setfocus()
	else	
		if isnull(ls_base) or ls_base='' then
			messagebox("Advertencia","Debe Ingresar Base del Contrato a Consulta")
			ddplb_base.setfocus()
		else
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_base)=0 then
				messagebox("Advertencia","No Registran Datos")
			else
				if ls_base='F' then
					ls_descrip_base			= 'Funeraria'
				elseif ls_base='G' then
					ls_descrip_base			= 'Crematorio'
				end if
				dw_lista.object.t_rango_fechas.text	= 'Listado Registros '+ls_descrip_base+' desde: '+string(ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
				dw_lista.setfocus()
			end if
		end if
	end if
end if


end event

type st_hasta from statictext within w_lista_producto_por_fechas_2
integer x = 677
integer y = 84
integer width = 165
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type em_inicio from editmask within w_lista_producto_por_fechas_2
integer x = 238
integer y = 76
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;dw_lista.reset()
end event

type em_termino from editmask within w_lista_producto_por_fechas_2
integer x = 841
integer y = 76
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;dw_lista.reset()
end event

type st_desde from statictext within w_lista_producto_por_fechas_2
integer x = 50
integer y = 84
integer width = 187
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type p_inicio from picture within w_lista_producto_por_fechas_2
integer x = 585
integer y = 72
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	

if em_inicio.text<>'00/00/0000' then
	ls_fecha = em_inicio.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
END IF
dw_lista.reset()
end event

type p_termino from picture within w_lista_producto_por_fechas_2
integer x = 1193
integer y = 72
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha

if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF
dw_lista.reset()
end event

type gb_periodo from groupbox within w_lista_producto_por_fechas_2
integer x = 37
integer y = 16
integer width = 1266
integer height = 164
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Período"
end type

type gb_1 from groupbox within w_lista_producto_por_fechas_2
integer x = 3022
integer y = 12
integer width = 955
integer height = 160
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_lista_producto_por_fechas_2
integer x = 896
integer y = 1772
integer width = 878
integer height = 160
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_lista from datawindow within w_lista_producto_por_fechas_2
integer x = 41
integer y = 204
integer width = 3941
integer height = 1572
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_producto_por_fechas_2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_columna

ls_columna					= dwo.name
if getrow() > 0 then
	il_row					= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	if ls_columna='t_verde' or ls_columna='t_texto_verde' then
		gs_formula			= "sw_activa_servicio=0"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()
	elseif ls_columna = 't_blanco' or ls_columna='t_texto_blanco' then	
		gs_formula			= "sw_activa_servicio=1"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()
	elseif ls_columna = 't_amarillo' or ls_columna='t_texto_amarillo' then	
		gs_formula			= "sw_activa_servicio=2"
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()	
	elseif ls_columna = 't_todo' then
		gs_formula			= ''
		dw_lista.SETfilter(gs_formula)
		dw_lista.filter()
		dw_lista.sort()
	end if	
end if	
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	il_row		= getrow()
end if
end event

event doubleclicked;if getrow()>0 then
	cb_cta_corriente.triggerEvent(clicked!)
end if
end event

