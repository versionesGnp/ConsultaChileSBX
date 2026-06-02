forward
global type w_mantenedor_descuento_web from window
end type
type cb_marcar_todo from commandbutton within w_mantenedor_descuento_web
end type
type cb_eliminar_det from commandbutton within w_mantenedor_descuento_web
end type
type cb_exportar_existe from commandbutton within w_mantenedor_descuento_web
end type
type cb_filtrar_existe from commandbutton within w_mantenedor_descuento_web
end type
type cb_sort_existe from commandbutton within w_mantenedor_descuento_web
end type
type st_11 from statictext within w_mantenedor_descuento_web
end type
type em_buscar_ctto from editmask within w_mantenedor_descuento_web
end type
type pb_buscar from picturebutton within w_mantenedor_descuento_web
end type
type cb_ctacte from commandbutton within w_mantenedor_descuento_web
end type
type cb_limpiar_cab from commandbutton within w_mantenedor_descuento_web
end type
type cb_grabar_det from commandbutton within w_mantenedor_descuento_web
end type
type cb_importar from commandbutton within w_mantenedor_descuento_web
end type
type dw_detalle from datawindow within w_mantenedor_descuento_web
end type
type cb_eliminar from commandbutton within w_mantenedor_descuento_web
end type
type cb_limpiar from commandbutton within w_mantenedor_descuento_web
end type
type cb_cerrar from commandbutton within w_mantenedor_descuento_web
end type
type cb_grabar from commandbutton within w_mantenedor_descuento_web
end type
type cb_nuevo from commandbutton within w_mantenedor_descuento_web
end type
type dw_lista from datawindow within w_mantenedor_descuento_web
end type
type gb_1 from groupbox within w_mantenedor_descuento_web
end type
type gb_2 from groupbox within w_mantenedor_descuento_web
end type
type gb_3 from groupbox within w_mantenedor_descuento_web
end type
end forward

global type w_mantenedor_descuento_web from window
integer width = 3739
integer height = 1940
boolean titlebar = true
string title = "Mantenedor Tramo Descuentos Web"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_marcar_todo cb_marcar_todo
cb_eliminar_det cb_eliminar_det
cb_exportar_existe cb_exportar_existe
cb_filtrar_existe cb_filtrar_existe
cb_sort_existe cb_sort_existe
st_11 st_11
em_buscar_ctto em_buscar_ctto
pb_buscar pb_buscar
cb_ctacte cb_ctacte
cb_limpiar_cab cb_limpiar_cab
cb_grabar_det cb_grabar_det
cb_importar cb_importar
dw_detalle dw_detalle
cb_eliminar cb_eliminar
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
cb_grabar cb_grabar
cb_nuevo cb_nuevo
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_mantenedor_descuento_web w_mantenedor_descuento_web

type variables
Date		id_fecha_dia
String		is_error_det
Long		il_row
end variables

on w_mantenedor_descuento_web.create
this.cb_marcar_todo=create cb_marcar_todo
this.cb_eliminar_det=create cb_eliminar_det
this.cb_exportar_existe=create cb_exportar_existe
this.cb_filtrar_existe=create cb_filtrar_existe
this.cb_sort_existe=create cb_sort_existe
this.st_11=create st_11
this.em_buscar_ctto=create em_buscar_ctto
this.pb_buscar=create pb_buscar
this.cb_ctacte=create cb_ctacte
this.cb_limpiar_cab=create cb_limpiar_cab
this.cb_grabar_det=create cb_grabar_det
this.cb_importar=create cb_importar
this.dw_detalle=create dw_detalle
this.cb_eliminar=create cb_eliminar
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.cb_nuevo=create cb_nuevo
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_marcar_todo,&
this.cb_eliminar_det,&
this.cb_exportar_existe,&
this.cb_filtrar_existe,&
this.cb_sort_existe,&
this.st_11,&
this.em_buscar_ctto,&
this.pb_buscar,&
this.cb_ctacte,&
this.cb_limpiar_cab,&
this.cb_grabar_det,&
this.cb_importar,&
this.dw_detalle,&
this.cb_eliminar,&
this.cb_limpiar,&
this.cb_cerrar,&
this.cb_grabar,&
this.cb_nuevo,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_mantenedor_descuento_web.destroy
destroy(this.cb_marcar_todo)
destroy(this.cb_eliminar_det)
destroy(this.cb_exportar_existe)
destroy(this.cb_filtrar_existe)
destroy(this.cb_sort_existe)
destroy(this.st_11)
destroy(this.em_buscar_ctto)
destroy(this.pb_buscar)
destroy(this.cb_ctacte)
destroy(this.cb_limpiar_cab)
destroy(this.cb_grabar_det)
destroy(this.cb_importar)
destroy(this.dw_detalle)
destroy(this.cb_eliminar)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.cb_nuevo)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;Date		ldt_fecha_max
gf_centrar(w_mantenedor_descuento_web)
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
id_fecha_dia		= date(gdt_fec_sistema)
cb_grabar_det.enabled	= false
dw_lista.insertrow(0)
if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No registra Tramos Descuentos WEB")
	dw_lista.reset()
	dw_lista.insertrow(0)
end if
end event

type cb_marcar_todo from commandbutton within w_mantenedor_descuento_web
integer x = 462
integer y = 1692
integer width = 416
integer height = 100
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Marcar Todo"
end type

event clicked;Long		ll_tot_reg,ll_indi

ll_tot_reg						= dw_detalle.rowcount()
if ll_tot_reg > 0 then
	if cb_marcar_todo.text = 'Marcar Todo' then
		for ll_indi=1 to ll_tot_reg
			dw_detalle.setitem(ll_indi,'estado_eliminar',0)
		next
		cb_marcar_todo.text 		= 'Desmarcar Todo'
	elseif cb_marcar_todo.text = 'Desmarcar Todo' then
		for ll_indi=1 to ll_tot_reg
			dw_detalle.setitem(ll_indi,'estado_eliminar',1)
		next
		cb_marcar_todo.text 		= 'Marcar Todo'
	end if
end if
end event

type cb_eliminar_det from commandbutton within w_mantenedor_descuento_web
integer x = 3392
integer y = 1136
integer width = 242
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar"
end type

event clicked;long		ll_tot_reg,ll_fila,ll_res,ll_count_eli,ll_total_fila,ll_indi,ll_suma_ok,ll_tramo_ori,ll_tramo,ll_tramo_1
Double	ll_numero
String		ls_base, ls_Serie,ls_estado_reg
date		ldt_fec_ini_ori,ldt_fec_fin_ori
datetime	ldt_fec_ini_vig,ldt_fec_ini_fin

ll_suma_ok					= 0
ll_tot_reg					= dw_detalle.rowcount()
ll_count_eli	 				= dw_detalle.Find("estado_eliminar =0",1, ll_tot_reg)
if ll_count_eli > 0 then
	dw_detalle.SETfilter('estado_eliminar = 0')
	dw_detalle.filter()
	ll_total_fila				= dw_detalle.rowcount()
	if ll_total_fila > 0 then
		ll_tramo_1			= dw_detalle.getitemnumber(1,'codigo_tramo')
		if ll_tramo_1=11 then
			messagebox("Advertencia","No es Posible Eliminar Codigo 11 - Descuento Toku")
		else
			ll_res					= messagebox("Eliminar","Está Seguro de Eliminar Registros Seleccionados",Exclamation!,YesNo!,2)
			if ll_res=1 then
				
				for ll_fila = 1 to ll_total_fila
					ls_base			= dw_detalle.getitemstring(ll_fila,'base')
					ls_serie			= dw_detalle.getitemstring(ll_fila,'serie')
					ll_numero		= dw_detalle.getitemnumber(ll_fila,'numero')
					ll_tramo			= dw_detalle.getitemnumber(ll_fila,'codigo_tramo')
					ls_estado_reg	= dw_detalle.getitemstring(ll_fila,'estado_reg')
					ldt_fec_ini_vig	= dw_detalle.getitemdatetime(ll_fila,'fecha_vig_ini')
					ldt_fec_ini_fin	= dw_detalle.getitemdatetime(ll_fila,'fecha_vig_fin')
					if ll_tramo <> 11 then
						INSERT INTO "LOG_WEB_DESCUENTOS_DETALLE"  
									( "BASE",  	"SERIE",   	"NUMERO",   	"CODIGO_TRAMO",   	"USUARIO",   	"FECHA_CREA",   		"ESTADO_REG",   	"FECHA_VIG_INI",   	"FECHA_VIG_FIN",   	"C_USUMOD",   	"D_MODIFI" )  
						VALUES 	( :ls_base,  	:ls_serie,   	:ll_numero,   	:ll_tramo,   				:gs_user,   		:gdt_fec_sistema,   	:ls_estado_reg,   	:ldt_fec_ini_vig,   		:ldt_fec_ini_fin,   		:gs_user,   			:gdt_fec_sistema ) 
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if

						DELETE FROM "WEB_DESCUENTOS_DETALLE"  
						WHERE 	( "WEB_DESCUENTOS_DETALLE"."BASE" = :ls_base ) AND  
									( "WEB_DESCUENTOS_DETALLE"."SERIE" = :ls_serie ) AND  
									( "WEB_DESCUENTOS_DETALLE"."NUMERO" = :ll_numero )   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
			
							UPDATE 	  "CADENA"  
							SET 		  "CODIGO_TRAMO" = 0  
							WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
										( "CADENA"."SERIE" = :ls_serie ) AND  
										( "CADENA"."NUMERO" = :ll_numero )  
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
								ll_suma_ok ++
							else
								rollback;
							end if
						else
							rollback;
							messagebox("Error Eliminar","Eliminación presentó Error, SQL: "+sqlca.sqlerrtext)
						end if
					end if
				next
			end if
		end if
	end if
	if ll_suma_ok > 0 then
		messagebox("Eliminar","Eliminación Exitosa")
		cb_marcar_todo.text 		= 'Marcar Todo'
		dw_detalle.SETfilter('')
		dw_detalle.filter()
		ll_tramo_ori			= dw_lista.getitemnumber(dw_lista.getrow(),'codigo_tramo')
		ldt_fec_ini_ori		= date(dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_vigencia_ini'))
		ldt_fec_fin_ori		= date(dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_vigencia_fin'))
		ll_tot_reg			= dw_detalle.retrieve(ll_tramo_ori,ldt_fec_ini_ori,ldt_fec_fin_ori)
		if ll_tot_reg > 0 then
			for ll_indi = 1 to ll_tot_reg
				dw_detalle.setitem(ll_indi,'estado_eliminar',1)
			next
		end if
		dw_detalle.accepttext()
	end if
	dw_detalle.scrolltorow(1)
else
	messagebox("Advertencia","Debe seleccionar por lo menos un Registro a Eliminar")
	dw_detalle.setfocus()
end if
end event

type cb_exportar_existe from commandbutton within w_mantenedor_descuento_web
integer x = 1600
integer y = 1704
integer width = 251
integer height = 84
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	f_DWToExcel( dw_detalle)
end if
end event

type cb_filtrar_existe from commandbutton within w_mantenedor_descuento_web
integer x = 1349
integer y = 1704
integer width = 251
integer height = 84
integer taborder = 130
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
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type cb_sort_existe from commandbutton within w_mantenedor_descuento_web
integer x = 1097
integer y = 1704
integer width = 251
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETSORT(NULO)
dw_detalle.SORT()

end event

type st_11 from statictext within w_mantenedor_descuento_web
integer x = 2194
integer y = 1712
integer width = 389
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Contrato"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_buscar_ctto from editmask within w_mantenedor_descuento_web
integer x = 2610
integer y = 1692
integer width = 421
integer height = 100
integer taborder = 140
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

event modified;if long(this.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_mantenedor_descuento_web
integer x = 3045
integer y = 1684
integer width = 128
integer height = 112
integer taborder = 160
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;Long		ll_fila,ll_tot_reg
Double	ll_numero
ll_numero	= Double(em_buscar_ctto.text)
ll_tot_reg	= dw_detalle.rowcount()
ll_fila			= dw_detalle.Find("numero = "+string(ll_numero), 1, ll_tot_reg)
if ll_fila>0 then
	dw_detalle.scrolltorow(ll_fila)
end if
if ll_fila=0 then
	messagebox("Advertencia","No Existe Nº Contrato "+string(ll_numero,"###,###,###,###"))
end if
end event

type cb_ctacte from commandbutton within w_mantenedor_descuento_web
integer x = 37
integer y = 1692
integer width = 416
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;Long		ll_fila

ll_fila											= il_row
if ll_fila>0 and dw_detalle.rowcount()>0 then
	gs_base 									= dw_detalle.GetItemString(ll_fila, "base")
	gs_serie 									= dw_detalle.GetItemString(ll_fila, "serie")
	gi_numero 								= dw_detalle.GetItemNumber(ll_fila, "numero")
	SELECT 	"CADENA"."RUT",		"CADENA"."ESTADO",   	"CADENA"."COD_PARQUE",  	"CLIENTE"."NOMBRE",  	"CLIENTE"."A_PATERNO",  	"CLIENTE"."A_MATERNO",  	"CLIENTE"."DV"  
	INTO 		:gi_rut,					:gs_estado,   				:gl_cod_parque_cta,  				:gs_nombres,   			:gs_apellido_paterno,   		:gs_apellido_materno,   		:gs_dv  
	FROM 	"CADENA",   "CLIENTE"  
	WHERE ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
			  (  "CADENA"."CODIGO" = :gs_base ) AND  
			  ( "CADENA"."SERIE" = :gs_serie ) AND  
			  ( "CADENA"."NUMERO" = :gi_numero )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(gs_base) and gi_numero>0 then
			CHOOSE CASE gs_base
				CASE "O" 	// Oferta
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
				CASE "F"
					if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
					Open(w_cuenta_corriente_funeraria)
			END CHOOSE
		end if
	else
		messagebox("Advertencia","No Existe Contrato "+gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,###,##0'))
	end if
end if
end event

type cb_limpiar_cab from commandbutton within w_mantenedor_descuento_web
integer x = 3392
integer y = 424
integer width = 242
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long	ll_tramo_ori,ll_row
Date	ldt_fec_ini_ori,ldt_fec_fin_ori

dw_lista.reset()
dw_detalle.reset()
if dw_lista.retrieve() > 0 then
	dw_lista.scrolltorow(1)
	ll_row					= 1
	IF ll_row > 0 THEN
		ll_tramo_ori			= dw_lista.getitemnumber(ll_row,'codigo_tramo')
		ldt_fec_ini_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_ini'))
		ldt_fec_fin_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_fin'))
		if dw_detalle.retrieve(ll_tramo_ori,ldt_fec_ini_ori,ldt_fec_fin_ori) =0 then
			messagebox("Advertencia","No Registar Dato")
		end if
	end if
end if
end event

type cb_grabar_det from commandbutton within w_mantenedor_descuento_web
integer x = 3392
integer y = 912
integer width = 242
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;String		ls_base,ls_serie
Double	ll_numero
Long		ll_tot_reg,ll_indi,ll_tramo_dscto,ll_error,ll_cod_tramo

dw_detalle.accepttext()
ll_error						= 0
ll_tot_reg					= dw_detalle.rowcount()
if ll_tot_reg > 0 then
	for ll_indi = 1 to ll_tot_reg
		dw_detalle.setitem(ll_indi,'estado_eliminar',1)
	next
end if
if dw_detalle.update() = 1 then
	commit;
	ll_cod_tramo		= dw_lista.getitemnumber(dw_lista.getrow(),'codigo_tramo')

//	UPDATE 	"CADENA"  
//	SET 		"CODIGO_TRAMO" = 0  
//	WHERE 	"CADENA"."CODIGO_TRAMO" = :ll_cod_tramo 
//	USING	sqlca;
//	if sqlca.sqlcode=0 then
//		commit;
//	else
//		rollback;
//	end if

	ll_tot_reg			= dw_detalle.rowcount()
	for ll_indi=1 to ll_tot_reg
		ls_base			= dw_detalle.getitemstring(ll_indi,'base')
		ls_serie			= dw_detalle.getitemstring(ll_indi,'serie')
		ll_numero		= dw_detalle.getitemnumber(ll_indi,'numero')
		ll_tramo_dscto	= dw_detalle.getitemnumber(ll_indi,'codigo_tramo')
		UPDATE 	"CADENA"  
		SET 		"CODIGO_TRAMO" = :ll_tramo_dscto  
		WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
					( "CADENA"."SERIE" = :ls_serie ) AND  
					( "CADENA"."NUMERO" = :ll_numero )   AND 
					( "CODIGO_TRAMO" <> 11 )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
			messagebox("Error Grabar","Error Actualizar CADENA Codigo Descuento Contrato "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,##0'))
			ll_error ++
		end if
	next
//	DELETE FROM "WEB_DESCUENTOS_DETALLE"  
//	WHERE 	"WEB_DESCUENTOS_DETALLE"."ESTADO_REG" <> 'V'  
//	USING	sqlca;
//	if sqlca.sqlcode=0 then
//		commit;
//	else
//		rollback;
//	end if
	if ll_error > 0 then
		messagebox("Grabar","Se realiza Grabado Carga Descuento con "+string(ll_error,'###,###,###,##0')+" Error(es) ")
	else
		messagebox("Grabar","Grabación Exitosa")
		cb_grabar_det.enabled	= false
		
		cb_marcar_todo.text 		= 'Marcar Todo'
	end if
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL "+sqlca.sqlerrtext)
end if
end event

type cb_importar from commandbutton within w_mantenedor_descuento_web
integer x = 3392
integer y = 800
integer width = 242
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Importar"
end type

event clicked;string		ls_archivo,ls_base,ls_serie
Long		ll_fila,ll_tramo_ori,ll_fila_dw_ori,ll_tramo_det,ll_tot_reg,ll_count_ctto,ll_count_vig,ll_count_vig_toku
Double	ll_numero
String		ls_estado_ori
Date		ldt_fec_ini_ori,ldt_fec_fin_ori

is_error_det		= 'N'
SELECT sysdate  INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;

dw_detalle.reset()
dw_detalle.accepttext()
SetNull(ls_archivo)
dw_detalle.ImportFile(ls_archivo)
dw_detalle.accepttext()
//if is_error_det = 'S' then dw_detalle.reset()

ll_tot_reg				= dw_detalle.rowcount()
ll_fila_dw_ori			= dw_lista.getrow()
if ll_fila_dw_ori > 0 then
	cb_grabar_det.enabled	= true
	ll_tramo_ori			= dw_lista.getitemnumber(ll_fila_dw_ori,'codigo_tramo')
	ls_estado_ori		= dw_lista.getitemstring(ll_fila_dw_ori,'estado')
	ldt_fec_ini_ori		= date(dw_lista.getitemdatetime(ll_fila_dw_ori,'fecha_vigencia_ini'))
	ldt_fec_fin_ori		= date(dw_lista.getitemdatetime(ll_fila_dw_ori,'fecha_vigencia_fin'))
	if ll_tramo_ori >= 0 and ls_estado_ori = 'A' then
		for ll_fila=1 to ll_tot_reg
			ls_base		= dw_detalle.getitemstring(ll_fila,'base')
			ls_serie		= dw_detalle.getitemstring(ll_fila,'serie')
			ll_numero	= dw_detalle.getitemnumber(ll_fila,'numero')
			if ll_fila = 1 then
				ll_tramo_det	= dw_detalle.getitemnumber(ll_fila,'codigo_tramo')
				if ll_tramo_det <> ll_tramo_ori then
					messagebox("Advertencia","Error en Carga Detalle, Código Tramo NO Coincide con Cabecera Seleccionada")
					dw_detalle.reset()
					exit
				end if
			end if
			dw_detalle.setitem(ll_fila,'usuario',gs_user)
			dw_detalle.setitem(ll_fila,'fecha_crea',gdt_fec_sistema)
			SELECT 	Count("CADENA"."CODIGO" )
			INTO 		:ll_count_ctto  
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
						( "CADENA"."SERIE" = :ls_serie ) AND  
						( "CADENA"."NUMERO" = :ll_numero )   ;
			if ll_count_ctto > 0 then
				dw_detalle.setitem(ll_fila,'estado_reg','V')
				SELECT 	Count("WEB_DESCUENTOS_DETALLE"."BASE" ) 
				INTO 		:ll_count_vig  
				FROM 	"WEB_DESCUENTOS_DETALLE"  
				WHERE 	( ( "WEB_DESCUENTOS_DETALLE"."BASE" = :ls_base ) AND  
							( "WEB_DESCUENTOS_DETALLE"."SERIE" = :ls_serie ) AND  
							( "WEB_DESCUENTOS_DETALLE"."NUMERO" = :ll_numero ) AND  
							( "WEB_DESCUENTOS_DETALLE"."FECHA_VIG_INI" >= :ldt_fec_ini_ori ) AND  
							( "WEB_DESCUENTOS_DETALLE"."FECHA_VIG_FIN" <= :ldt_fec_fin_ori ) AND  
							( "WEB_DESCUENTOS_DETALLE"."ESTADO_REG" = 'V' ) ) ;
				if isnull(ll_count_vig) then ll_count_vig=0
				
				SELECT 	Count("WEB_DESCUENTOS_DETALLE"."BASE" ) 
				INTO 		:ll_count_vig_toku  
				FROM 	"WEB_DESCUENTOS_DETALLE"  		
				WHERE	( ( "WEB_DESCUENTOS_DETALLE"."BASE" = :ls_base ) AND  
							( "WEB_DESCUENTOS_DETALLE"."SERIE" = :ls_serie ) AND  
							( "WEB_DESCUENTOS_DETALLE"."NUMERO" = :ll_numero ) AND  
							( "WEB_DESCUENTOS_DETALLE"."ESTADO_REG" = 'V' ) AND
							( "WEB_DESCUENTOS_DETALLE"."CODIGO_TRAMO" = 11 ) )	;
							
				if isnull(ll_count_vig_toku) then ll_count_vig_toku=0
				if ll_count_vig > 0 then
					dw_detalle.setitem(ll_fila,'estado_reg','E')
				end if
				if ll_count_vig_toku > 0 then
					dw_detalle.setitem(ll_fila,'estado_reg','T')
				end if
			else
				dw_detalle.setitem(ll_fila,'estado_reg','N')
			end if
			
			dw_detalle.setitem(ll_fila,'fecha_vig_ini',ldt_fec_ini_ori)
			dw_detalle.setitem(ll_fila,'fecha_vig_fin',ldt_fec_fin_ori)
		next
		dw_detalle.accepttext()
	end if
end if
end event

type dw_detalle from datawindow within w_mantenedor_descuento_web
integer x = 27
integer y = 732
integer width = 3296
integer height = 928
integer taborder = 60
string title = "none"
string dataobject = "dw_tramo_descuento_detalle"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;il_row						= row
IF il_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;il_row						= this.getrow()
IF il_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if

end event

event rowfocuschanging;il_row						= this.getrow()
IF il_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if

end event

type cb_eliminar from commandbutton within w_mantenedor_descuento_web
boolean visible = false
integer x = 3392
integer y = 316
integer width = 242
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Inactivar"
end type

event clicked;//Long	ll_res,ll_fila,ll_tot_reg,ll_indi,ll_cod_tramo
//
//ll_fila						= dw_lista.getrow()
//if ll_fila > 0 then
//	ll_res					= messagebox("Eliminar","Está seguro de Inactivar Registro N° "+string(ll_fila),Exclamation!,YesNo!,2)
//	if ll_res=1 then
//		
//		ll_cod_tramo	= dw_lista.getitemnumber(dw_lista.getrow(),'codigo_tramo')
//		if ll_cod_tramo = 11 then
//			messagebox("Advertencia","Descuento Tramo 11 TOKU, No es Posible Inactivar")
//		else
//			dw_lista.setitem(ll_fila,'estado','I')
//			ll_tot_reg		= dw_detalle.rowcount()
//			for ll_indi=1 to ll_tot_reg
//				dw_detalle.setitem(ll_indi,'estado_reg','A')
//			next
//			dw_lista.accepttext()
//			dw_detalle.accepttext()
//			if dw_lista.update()=1 then
//				commit;
//			else
//				rollback;
//			end if
//			if dw_detalle.update()=1 then
//				commit;
//			else
//				rollback;
//			end if
//			UPDATE 	"CADENA"  
//			SET 		"CODIGO_TRAMO" = 0  
//			WHERE 	"CADENA"."CODIGO_TRAMO" = :ll_cod_tramo 
//			USING	sqlca;
//			if sqlca.sqlcode=0 then
//				commit;
//			else
//				rollback;
//			end if
//			messagebox("Inactivar","Inactivación Exitosa")
//		end if
//	end if
//end if
end event

type cb_limpiar from commandbutton within w_mantenedor_descuento_web
integer x = 3392
integer y = 1024
integer width = 242
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long	ll_tramo_ori,ll_row
Date	ldt_fec_ini_ori,ldt_fec_fin_ori

dw_detalle.reset()
ll_row					= dw_lista.getrow()
IF ll_row > 0 THEN
	ll_tramo_ori			= dw_lista.getitemnumber(ll_row,'codigo_tramo')
	ldt_fec_ini_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_ini'))
	ldt_fec_fin_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_fin'))
	if dw_detalle.retrieve(ll_tramo_ori,ldt_fec_ini_ori,ldt_fec_fin_ori) =0 then
		messagebox("Advertencia","No Registar Dato")
	end if
end if
cb_marcar_todo.text 	= 'Marcar Todo'
end event

type cb_cerrar from commandbutton within w_mantenedor_descuento_web
integer x = 3392
integer y = 1692
integer width = 242
integer height = 100
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_mantenedor_descuento_web)
end event

type cb_grabar from commandbutton within w_mantenedor_descuento_web
integer x = 3392
integer y = 208
integer width = 242
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;datetime		ldt_fecha_ini, ldt_fecha_fin
Double		ldb_valor,ll_
Long			ll_tot_reg,ll_indi,ll_cod_tramo,ll_count_error=0
String			ls_tipo_desc,ls_estado

ll_tot_reg			= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_cod_tramo	= dw_lista.getitemnumber(ll_indi,'codigo_tramo')
	ldb_valor			= Double(dw_lista.getitemnumber(ll_indi,'valor_descuento'))
	ls_tipo_desc		= dw_lista.getitemstring(ll_indi,'tipo_descuento')
	ls_estado		= dw_lista.getitemstring(ll_indi,'estado')
	ldt_fecha_ini	= dw_lista.getitemdatetime(ll_indi,'fecha_vigencia_ini')
	ldt_fecha_fin	= dw_lista.getitemdatetime(ll_indi,'fecha_vigencia_fin')
	if isnull( ll_cod_tramo ) then
		messagebox("Advertencia","Debe Ingresar Codigo Tramo")
		dw_lista.setfocus()
		dw_lista.setcolumn('valor_descuento')
		ll_count_error ++
		exit
	elseif isnull( ldb_valor ) or ldb_valor < 0 then
		messagebox("Advertencia","Debe Ingresar Valor Descuento")
		dw_lista.setfocus()
		dw_lista.setcolumn('valor_descuento')
		ll_count_error ++
		exit
	elseif isnull( ldt_fecha_ini ) then
		messagebox("Advertencia","Debe Ingresar Fecha Vigencia Inicial")
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_vigencia_ini')
		ll_count_error ++
		exit
	elseif isnull( ldt_fecha_fin ) then
		messagebox("Advertencia","Debe Ingresar Fecha Vigencia Final")
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_vigencia_fin')
		ll_count_error ++
		exit
	elseif ldt_fecha_ini > ldt_fecha_fin then
		messagebox("Advertencia","Rango Fecha Incorrecta, Fecha Inicial NO debe ser Mayor a Fecha Vigencia Final")
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_vigencia_fin')
		ll_count_error ++
		exit
//	else
//		dw_lista.setitem(ll_indi,'usuario',gs_user)
	end if
next
if ll_count_error=0 then
	if dw_lista.update() = 1 then
		commit;
		if ls_estado='I' then
			String		ls_base,ls_serie
			Double	ll_numero
			Long		ll_tramo_dscto,ll_error
			
			dw_detalle.accepttext()
			ll_error					= 0
			if dw_detalle.update()=1 then
				commit;
				ll_tot_reg			= dw_detalle.rowcount()
				for ll_indi=1 to ll_tot_reg
					ls_base			= dw_detalle.getitemstring(ll_indi,'base')
					ls_serie			= dw_detalle.getitemstring(ll_indi,'serie')
					ll_numero		= dw_detalle.getitemnumber(ll_indi,'numero')
					ll_tramo_dscto	= dw_detalle.getitemnumber(ll_indi,'codigo_tramo')
					UPDATE 	"CADENA"  
					SET 		"CODIGO_TRAMO" = 0  
					WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						messagebox("Error Grabar","Error Actualizar CADENA Codigo Descuento Contrato "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,##0'))
						ll_error ++
					end if
				next
				if ll_error > 0 then
					messagebox("Grabar","Se realiza Actualización de Anulación Descuento con "+string(ll_error,'###,###,###,##0')+" Errores ")
				else
					messagebox("Grabar","Grabación Exitosa")
				end if
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar SQL "+sqlca.sqlerrtext)
			end if
		end if
		
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Tramo Descuento Web SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_nuevo from commandbutton within w_mantenedor_descuento_web
integer x = 3392
integer y = 100
integer width = 242
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;Long		ll_new,ll_codigo_tramo
String		ls_fecha
Date		ldt_fecha

ll_new				= dw_lista.insertrow(0)
dw_lista.setitem(ll_new,'usuario',gs_user)
dw_lista.setitem(ll_new,'estado','A')
dw_lista.setitem(ll_new,'tipo_descuento','%')
dw_lista.ScrollToRow (ll_new)
dw_lista.setcolumn ('codigo_tramo')
dw_lista.accepttext()
end event

type dw_lista from datawindow within w_mantenedor_descuento_web
integer x = 27
integer y = 16
integer width = 3296
integer height = 672
integer taborder = 10
string title = "none"
string dataobject = "dw_mantenedor_web_tramo"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long	ll_tramo_ori,ll_row
Date	ldt_fec_ini_ori,ldt_fec_fin_ori

dw_lista.accepttext()
IF row > 0 THEN
	cb_grabar_det.enabled	= false
	ll_row					= dw_lista.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
	ll_tramo_ori			= dw_lista.getitemnumber(ll_row,'codigo_tramo')
	ldt_fec_ini_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_ini'))
	ldt_fec_fin_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_fin'))
	if dw_detalle.retrieve(ll_tramo_ori,ldt_fec_ini_ori,ldt_fec_fin_ori) =0 then
//		messagebox("Advertencia","No Registar Dato")
	end if
end if
end event

event rowfocuschanged;Long	ll_tramo_ori,ll_row
Date	ldt_fec_ini_ori,ldt_fec_fin_ori

dw_lista.accepttext()
ll_row						= dw_lista.getrow()
IF ll_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_row, TRUE)
	ll_tramo_ori			= dw_lista.getitemnumber(ll_row,'codigo_tramo')
	ldt_fec_ini_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_ini'))
	ldt_fec_fin_ori		= date(dw_lista.getitemdatetime(ll_row,'fecha_vigencia_fin'))
	if dw_detalle.retrieve(ll_tramo_ori,ldt_fec_ini_ori,ldt_fec_fin_ori) =0 then
//		messagebox("Advertencia","No Registar Dato")
	end if
end if
end event

event itemchanged;String		ls_columna
Long		ll_codigo,ll_indi,ll_tot_reg,ll_suma_dupli,ll_codigo_fila,ll_nulo

Setnull(ll_nulo)
dw_lista.accepttext()
ll_tot_reg					= dw_lista.rowcount()
ls_columna					= dwo.name
if ls_columna='codigo_tramo' then
	ll_codigo					= dw_lista.getitemnumber(dw_lista.getrow(),'codigo_tramo')
	dw_lista.setitem(dw_lista.getrow(),'fecha_modificacion',gdt_fec_sistema)
	dw_lista.setitem(dw_lista.getrow(),'usuario',gs_user)
	if not isnull(ll_codigo) then
		for ll_indi=1 to ll_tot_reg
			ll_codigo_fila	= dw_lista.getitemnumber(ll_indi,'codigo_tramo')
			if ll_codigo = ll_codigo_fila then ll_suma_dupli ++
		next
		if ll_suma_dupli > 1 then
			messagebox("Advertencia","Codigo Duplicado")
			dw_lista.setitem(dw_lista.getrow(),'codigo_tramo',ll_nulo)
			dw_lista.accepttext()
		end if
	end if
end if
dw_lista.accepttext()
end event

event itemfocuschanged;long		ll_codigo,ll_indi,ll_tot_reg,ll_codigo_fila,ll_nulo,ll_suma_dupli=0

dw_lista.accepttext()
Setnull(ll_nulo)
ll_tot_reg				= dw_lista.rowcount()
ll_codigo					= dw_lista.getitemnumber(dw_lista.getrow(),'codigo_tramo')
if not isnull(ll_codigo) then
	for ll_indi=1 to ll_tot_reg
		ll_codigo_fila	= dw_lista.getitemnumber(ll_indi,'codigo_tramo')
		if ll_codigo = ll_codigo_fila then ll_suma_dupli ++
	next
	if ll_suma_dupli > 1 then
		dw_lista.setitem(dw_lista.getrow(),'codigo_tramo',ll_nulo)
		dw_lista.accepttext()
	end if
end if
end event

type gb_1 from groupbox within w_mantenedor_descuento_web
integer x = 3360
integer y = 12
integer width = 306
integer height = 536
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Opciones"
end type

type gb_2 from groupbox within w_mantenedor_descuento_web
integer x = 3360
integer y = 712
integer width = 306
integer height = 552
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle"
end type

type gb_3 from groupbox within w_mantenedor_descuento_web
integer x = 1074
integer y = 1656
integer width = 809
integer height = 160
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

