forward
global type w_codigo from window
end type
type em_folio_fin from editmask within w_codigo
end type
type st_14 from statictext within w_codigo
end type
type em_folio_ini from editmask within w_codigo
end type
type st_13 from statictext within w_codigo
end type
type cbx_existe from checkbox within w_codigo
end type
type em_folios from editmask within w_codigo
end type
type st_12 from statictext within w_codigo
end type
type st_11 from statictext within w_codigo
end type
type pb_ok from picturebutton within w_codigo
end type
type dw_dcto_electronico from datawindow within w_codigo
end type
type cb_11 from commandbutton within w_codigo
end type
type cb_22 from commandbutton within w_codigo
end type
type cb_33 from commandbutton within w_codigo
end type
type cb_imprimir from commandbutton within w_codigo
end type
type cb_borrar from commandbutton within w_codigo
end type
type cb_limpiar from commandbutton within w_codigo
end type
type cb_grabar from commandbutton within w_codigo
end type
type cb_eliminar from commandbutton within w_codigo
end type
type cb_detalle from commandbutton within w_codigo
end type
type dw_detalle from datawindow within w_codigo
end type
type cb_proceso from commandbutton within w_codigo
end type
type dw_proceso from datawindow within w_codigo
end type
type sle_llave_dosificacion from editmask within w_codigo
end type
type sle_monto from editmask within w_codigo
end type
type sle_fecha from editmask within w_codigo
end type
type sle_nit from editmask within w_codigo
end type
type sle_num_factura from editmask within w_codigo
end type
type sle_num_autorizacion from editmask within w_codigo
end type
type st_base64 from statictext within w_codigo
end type
type st_sumatoria_producto from statictext within w_codigo
end type
type st_cadena from statictext within w_codigo
end type
type st_verhoeff from statictext within w_codigo
end type
type st_10 from statictext within w_codigo
end type
type st_9 from statictext within w_codigo
end type
type st_8 from statictext within w_codigo
end type
type st_7 from statictext within w_codigo
end type
type st_4 from statictext within w_codigo
end type
type st_6 from statictext within w_codigo
end type
type st_5 from statictext within w_codigo
end type
type cb_2 from commandbutton within w_codigo
end type
type st_codigo_control from statictext within w_codigo
end type
type st_3 from statictext within w_codigo
end type
type st_2 from statictext within w_codigo
end type
type st_1 from statictext within w_codigo
end type
type cb_1 from commandbutton within w_codigo
end type
type gb_1 from groupbox within w_codigo
end type
type gb_2 from groupbox within w_codigo
end type
type gb_11 from groupbox within w_codigo
end type
type dw_caja from datawindow within w_codigo
end type
type gb_3 from groupbox within w_codigo
end type
end forward

global type w_codigo from window
integer x = 9
integer y = 12
integer width = 4018
integer height = 2568
boolean titlebar = true
string title = "Proceso Generación FACTURAS & BOLETAS"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
em_folio_fin em_folio_fin
st_14 st_14
em_folio_ini em_folio_ini
st_13 st_13
cbx_existe cbx_existe
em_folios em_folios
st_12 st_12
st_11 st_11
pb_ok pb_ok
dw_dcto_electronico dw_dcto_electronico
cb_11 cb_11
cb_22 cb_22
cb_33 cb_33
cb_imprimir cb_imprimir
cb_borrar cb_borrar
cb_limpiar cb_limpiar
cb_grabar cb_grabar
cb_eliminar cb_eliminar
cb_detalle cb_detalle
dw_detalle dw_detalle
cb_proceso cb_proceso
dw_proceso dw_proceso
sle_llave_dosificacion sle_llave_dosificacion
sle_monto sle_monto
sle_fecha sle_fecha
sle_nit sle_nit
sle_num_factura sle_num_factura
sle_num_autorizacion sle_num_autorizacion
st_base64 st_base64
st_sumatoria_producto st_sumatoria_producto
st_cadena st_cadena
st_verhoeff st_verhoeff
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_4 st_4
st_6 st_6
st_5 st_5
cb_2 cb_2
st_codigo_control st_codigo_control
st_3 st_3
st_2 st_2
st_1 st_1
cb_1 cb_1
gb_1 gb_1
gb_2 gb_2
gb_11 gb_11
dw_caja dw_caja
gb_3 gb_3
end type
global w_codigo w_codigo

on w_codigo.create
this.em_folio_fin=create em_folio_fin
this.st_14=create st_14
this.em_folio_ini=create em_folio_ini
this.st_13=create st_13
this.cbx_existe=create cbx_existe
this.em_folios=create em_folios
this.st_12=create st_12
this.st_11=create st_11
this.pb_ok=create pb_ok
this.dw_dcto_electronico=create dw_dcto_electronico
this.cb_11=create cb_11
this.cb_22=create cb_22
this.cb_33=create cb_33
this.cb_imprimir=create cb_imprimir
this.cb_borrar=create cb_borrar
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.cb_eliminar=create cb_eliminar
this.cb_detalle=create cb_detalle
this.dw_detalle=create dw_detalle
this.cb_proceso=create cb_proceso
this.dw_proceso=create dw_proceso
this.sle_llave_dosificacion=create sle_llave_dosificacion
this.sle_monto=create sle_monto
this.sle_fecha=create sle_fecha
this.sle_nit=create sle_nit
this.sle_num_factura=create sle_num_factura
this.sle_num_autorizacion=create sle_num_autorizacion
this.st_base64=create st_base64
this.st_sumatoria_producto=create st_sumatoria_producto
this.st_cadena=create st_cadena
this.st_verhoeff=create st_verhoeff
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_4=create st_4
this.st_6=create st_6
this.st_5=create st_5
this.cb_2=create cb_2
this.st_codigo_control=create st_codigo_control
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_11=create gb_11
this.dw_caja=create dw_caja
this.gb_3=create gb_3
this.Control[]={this.em_folio_fin,&
this.st_14,&
this.em_folio_ini,&
this.st_13,&
this.cbx_existe,&
this.em_folios,&
this.st_12,&
this.st_11,&
this.pb_ok,&
this.dw_dcto_electronico,&
this.cb_11,&
this.cb_22,&
this.cb_33,&
this.cb_imprimir,&
this.cb_borrar,&
this.cb_limpiar,&
this.cb_grabar,&
this.cb_eliminar,&
this.cb_detalle,&
this.dw_detalle,&
this.cb_proceso,&
this.dw_proceso,&
this.sle_llave_dosificacion,&
this.sle_monto,&
this.sle_fecha,&
this.sle_nit,&
this.sle_num_factura,&
this.sle_num_autorizacion,&
this.st_base64,&
this.st_sumatoria_producto,&
this.st_cadena,&
this.st_verhoeff,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_4,&
this.st_6,&
this.st_5,&
this.cb_2,&
this.st_codigo_control,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.gb_1,&
this.gb_2,&
this.gb_11,&
this.dw_caja,&
this.gb_3}
end on

on w_codigo.destroy
destroy(this.em_folio_fin)
destroy(this.st_14)
destroy(this.em_folio_ini)
destroy(this.st_13)
destroy(this.cbx_existe)
destroy(this.em_folios)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.pb_ok)
destroy(this.dw_dcto_electronico)
destroy(this.cb_11)
destroy(this.cb_22)
destroy(this.cb_33)
destroy(this.cb_imprimir)
destroy(this.cb_borrar)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.cb_eliminar)
destroy(this.cb_detalle)
destroy(this.dw_detalle)
destroy(this.cb_proceso)
destroy(this.dw_proceso)
destroy(this.sle_llave_dosificacion)
destroy(this.sle_monto)
destroy(this.sle_fecha)
destroy(this.sle_nit)
destroy(this.sle_num_factura)
destroy(this.sle_num_autorizacion)
destroy(this.st_base64)
destroy(this.st_sumatoria_producto)
destroy(this.st_cadena)
destroy(this.st_verhoeff)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_4)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.cb_2)
destroy(this.st_codigo_control)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_11)
destroy(this.dw_caja)
destroy(this.gb_3)
end on

event open;Long		ll_tot_reg,ll_indi

// Codigo para procesar el asunto

gf_centrar(w_codigo)
dw_proceso.settransobject(sqlca)
dw_dcto_electronico.settransobject(sqlca)
dw_dcto_electronico.insertrow(0)
dw_detalle.settransobject(sqlca)
dw_caja.settransobject(sqlca)
ll_tot_reg				= dw_caja.retrieve()
for ll_indi=1 to ll_tot_reg
	dw_caja.setitem(ll_indi,'sw_asig',1)
next
dw_caja.enabled		= false
em_folios.enabled		= false
cb_grabar.enabled		= false
dw_caja.accepttext()
//if dw_proceso.retrieve() > 0 then
//	dw_proceso.scrolltorow(dw_proceso.rowcount())
//	dw_proceso.setfocus()
//end if



end event

type em_folio_fin from editmask within w_codigo
integer x = 3520
integer y = 976
integer width = 343
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###"
end type

event modified;cb_grabar.enabled		= false
end event

type st_14 from statictext within w_codigo
integer x = 3191
integer y = 992
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Folio Final"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_folio_ini from editmask within w_codigo
integer x = 3520
integer y = 856
integer width = 343
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###"
end type

event modified;cb_grabar.enabled		= false
end event

type st_13 from statictext within w_codigo
integer x = 3191
integer y = 876
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Folio Inicial"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_existe from checkbox within w_codigo
integer x = 3159
integer y = 756
integer width = 786
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Según Cajas Seleccionadas"
end type

type em_folios from editmask within w_codigo
integer x = 2583
integer y = 48
integer width = 343
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###"
end type

event modified;cb_grabar.enabled		= false
end event

type st_12 from statictext within w_codigo
integer x = 2217
integer y = 68
integer width = 347
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Folios Asignar"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_11 from statictext within w_codigo
integer x = 2967
integer y = 60
integer width = 133
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cajas"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_codigo
integer x = 3781
integer y = 40
integer width = 178
integer height = 156
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok.bmp"
alignment htextalign = left!
end type

event clicked;String		ls_tipo_doc,ls_rut_emp,ls_caja
Long		ll_fila,ll_cant_folios,ll_max_cant

ls_tipo_doc					= dw_dcto_electronico.getitemstring(1,'tipo_doc')
ls_rut_emp					= dw_dcto_electronico.getitemstring(1,'rut_empresa')
ll_cant_folios				= long(em_folios.text)
cb_grabar.enabled			= false
if not isnull(ls_tipo_doc) and not isnull(ls_rut_emp) then
	SELECT DISTINCT "TCP_IP_CAJA"."CANT_FOLIO_ELECT"  
	INTO 		:ll_max_cant  
	FROM 	"TCP_IP_CAJA"  ;
	if ll_cant_folios > ll_max_cant then
		messagebox("Advertencia","Folios Asignar supera a lo que esta Definido "+string(ll_max_cant,'###,###,###,###,###'))
		em_folios.text			= ''
		em_folios.setfocus()
	else
		ll_fila						= dw_caja.Find( "sw_asig = 0 ", 1, dw_caja.RowCount())
		if ll_fila=0 then
			messagebox("Advertencia","Debe Seleccionar Caja para Asignar Folio")
			dw_caja.setfocus()
		else
			ll_fila					= dw_caja.Find( "sw_asig = 0 and ( cant_folio_elect = 0 or isnull(cant_folio_elect) ) ", 1, dw_caja.RowCount())
			if ll_fila > 0 then
				ls_caja			= dw_caja.getitemstring(ll_fila,'caja')
				messagebox("Advertencia","No Registra Cantidad de Folios Asignar en Caja "+ls_caja)
				dw_caja.setfocus()
				dw_caja.scrolltorow(ll_fila)
			else
				if dw_proceso.retrieve(ls_tipo_doc,ls_rut_emp)=0 then
					messagebox("Advertencia","No Registra Dato")
				end if
				if dw_caja.update()=1 then
					commit;
				else
					rollback;
				end if
			end if
		end if
	end if
else
	messagebox("Advertencia","Debe Seleccionar Tipo Documento Electrónico")
	dw_dcto_electronico.setfocus()
end if
end event

type dw_dcto_electronico from datawindow within w_codigo
integer x = 14
integer y = 48
integer width = 2222
integer height = 112
integer taborder = 10
string title = "none"
string dataobject = "dwe_ingreo_documento_electronico"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_tipo_doc,ls_rut_emp
Long		ll_fila

dw_dcto_electronico.accepttext()
dw_proceso.reset()
dw_detalle.reset()
cb_grabar.enabled			= false
ls_tipo_doc					= dw_dcto_electronico.getitemstring(1,'tipo_doc')
ls_rut_emp					= dw_dcto_electronico.getitemstring(1,'rut_empresa')
if not isnull(ls_tipo_doc) and not isnull(ls_rut_emp) then
	if dw_proceso.retrieve(ls_tipo_doc,ls_rut_emp) > 0 then
		ll_fila					= dw_proceso.Find( "estado = 'P' ", 1, dw_proceso.RowCount())
		if ll_fila>0 then dw_proceso.scrolltorow(ll_fila)
	end if
	dw_caja.enabled		= true
	em_folios.enabled		= True
	//pb_ok.triggerevent(clicked!)
end if
end event

type cb_11 from commandbutton within w_codigo
integer x = 2999
integer y = 1184
integer width = 261
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_detalle.rowcount() > 0 then
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.sort()
end if
end event

type cb_22 from commandbutton within w_codigo
integer x = 3488
integer y = 1184
integer width = 219
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_33 from commandbutton within w_codigo
integer x = 3264
integer y = 1184
integer width = 219
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type cb_imprimir from commandbutton within w_codigo
integer x = 3712
integer y = 1184
integer width = 219
integer height = 96
integer taborder = 140
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	if dw_detalle.rowcount() > 0 then f_Print( dw_detalle )
end if
end event

type cb_borrar from commandbutton within w_codigo
integer x = 2528
integer y = 1184
integer width = 302
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_res,ll_tot_reg,ll_fila,ll_grupo,ll_count_reg
String		ls_tipo_doc

ll_tot_reg			= dw_proceso.rowcount()
ll_fila					= dw_proceso.getrow()
if ll_tot_reg > 0 then
	ll_grupo			= dw_proceso.getitemnumber(ll_fila,'grupo')
	ls_tipo_doc		= dw_proceso.getitemstring(ll_fila,'tipo_documento')
	SELECT	Count("ELECTRONICA_FB_DETALLE"."GRUPO")  
	INTO 		:ll_count_reg  
	FROM 	"ELECTRONICA_FB_DETALLE"  
	WHERE 	"ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo   AND
				"ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tipo_doc
	USING		sqlca;
	if ll_count_reg > 0 then
		messagebox("Advertencia","No es posible Eliminar Grupo, Proceso Generación Realizada")
	else
		ll_res		= messagebox("Advertencia","Está seguro Eliminar Registro de la Lista",Exclamation!,YesNo!,2)
		if ll_res=1 then
			dw_proceso.deleterow(ll_fila)
			messagebox("Eliminar","Eliminación Exitosa, recuerde Grabar Cambios")
		end if
	end if
end if
end event

type cb_limpiar from commandbutton within w_codigo
integer x = 1883
integer y = 2324
integer width = 302
integer height = 112
integer taborder = 180
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		ll_tot_reg,ll_indi

dw_detalle.reset()
ll_tot_reg			= dw_caja.retrieve()
for ll_indi=1 to ll_tot_reg
	dw_caja.setitem(ll_indi,'sw_asig',1)
next
cb_grabar.enabled		= false
dw_caja.enabled		= false
em_folios.enabled		= false
dw_caja.accepttext()
end event

type cb_grabar from commandbutton within w_codigo
integer x = 768
integer y = 2324
integer width = 439
integer height = 112
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Grabar"
end type

event clicked;Long		ll_indi,ll_tot_reg,ll_grupo,ll_factura
String		ls_estado_reg,ls_pasa,ls_rut

dw_detalle.accepttext()
dw_proceso.accepttext()
ls_pasa						= 'S'
ll_tot_reg					= dw_detalle.rowcount()
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ll_grupo				= dw_detalle.getitemnumber(ll_indi,'grupo')
		ll_factura				= dw_detalle.getitemnumber(ll_indi,'nro_documento')
		ls_estado_reg		= dw_detalle.getitemstring(ll_indi,'estado_reg')
		ls_rut					= dw_proceso.getitemstring(ll_indi,'rut_empresa')
		if isnull(ll_grupo) or ll_grupo=0 or isnull(ll_factura) or ll_factura=0 or isnull(ls_estado_reg) or ls_estado_reg='' or isnull(ls_rut) then
			messagebox("Advertencia","No es posible realizar Proceso Detalle, falta Ingresar Datos en Fila Nº "+string(ll_indi))
			dw_detalle.scrolltorow(ll_indi)
			ls_pasa			= 'N'
			exit
		end if
	next
	if ls_pasa='S' then
		if dw_proceso.update()=1 then
			commit;
			if dw_detalle.update()=1 then
				commit;
				messagebox("Grabar","Grabación Exitosa")
				dw_detalle.reset()
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Detalle SQL: "+sqlca.sqlerrtext)
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Proceso SQL: "+sqlca.sqlerrtext)
		end if
	end if
else
	messagebox("Advertencia","No Registra Dato, debe Procesar antes de Grabar")
end if
end event

type cb_eliminar from commandbutton within w_codigo
integer x = 768
integer y = 1176
integer width = 439
integer height = 112
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular Periodo"
end type

event clicked;Long		ll_fila,ll_grupo,ll_res,ll_pos
String		ls_estado_reg, ls_tipo_doc

ll_fila					= dw_proceso.getrow()
if ll_fila > 0 and dw_detalle.rowcount() > 0 then
	ls_estado_reg	= dw_proceso.getitemstring(ll_fila,'estado')
	ll_grupo			= dw_proceso.getitemnumber(ll_fila,'grupo')
	ls_tipo_doc		= dw_proceso.getitemstring(ll_fila,'tipo_documento')
	ll_pos				= dw_detalle.Find("estado_reg = 'G'", 1, dw_detalle.RowCount())
	if ll_pos > 0 then
		messagebox("Advertencia","No es posible ANULAR Proceso, ya existen Pagos con Facturas")
	else
		if ll_grupo > 0 and ls_estado_reg = 'P' then
			ll_res		= messagebox("Anular","Está Seguro de Anular Grupo Nº "+string(ll_grupo,'###,###,###,##0'),Exclamation!,YesNo!,2)
			dw_proceso.setitem(ll_fila,'estado','A')
			dw_proceso.accepttext()
			if dw_proceso.update() = 1 then
				commit;
				UPDATE	"ELECTRONICA_FB_DETALLE"  
				SET 		"ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'A'  
				WHERE 	"ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo   AND
							"ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tipo_doc
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				messagebox("Anular","Anulación Exitosa")
			else
				rollback;
				messagebox("Error Anular","Error al Anular SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Recuerde Estado debe estar P-Pendiente para ser A-Anulado")
		end if
	end if
else
	messagebox("Advertencia","Recuerde, debe estar Grabado Proceso para ser Anulado")
end if
end event

type cb_detalle from commandbutton within w_codigo
integer x = 46
integer y = 2324
integer width = 398
integer height = 112
integer taborder = 160
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Procesar"
end type

event clicked;Long		ll_pos,ll_indi,ll_tot_reg,ll_grupo,ll_fac_ini,ll_fac_fin,ll_new,ll_max,ll_reg,ll_corr,ll_fila_proc,ll_tot_reg_caja,ll_fila,ll_folio_marcados,ll_folio_asignar,ll_sw_caja,ll_cant,ll_indi_caja,&
			ll_indi_marca,ll_ran_ini,ll_ran_fin,ll_calc_dif,ll_fila_prim,ll_count_reg_p,ll_res,sw_marcado
String		ls_autoriza,ls_nro_tramite,ls_llave,ls_tipo_doc,ls_rut,ls_caja,ls_estado_reg,ls_pasa,ls_rut_emp

dw_proceso.accepttext()
ls_tipo_doc						= dw_dcto_electronico.getitemstring(1,'tipo_doc')
ls_rut_emp						= dw_dcto_electronico.getitemstring(1,'rut_empresa')
cb_grabar.enabled				= false
if not isnull(ls_tipo_doc) and not isnull(ls_rut_emp) then
	if cbx_existe.checked=true then
		SetPointer(HourGlass!)
		ll_ran_ini					= long(em_folio_ini.text)
		ll_ran_fin					= long(em_folio_fin.text)
		ll_folio_marcados		= dw_caja.getitemnumber(1,'c_tot_cant')
		ll_tot_reg				= dw_detalle.rowcount()
		ll_calc_dif				= ll_ran_fin - ll_ran_ini
		if ll_folio_marcados <> ll_calc_dif then
			messagebox("Advertencia","No coinciden Folios Asignar con Cajas Seleccionadas")
			dw_caja.setfocus()
		elseif ll_folio_marcados = 0 or isnull(ll_folio_marcados) then
			messagebox("Advertencia","Debe Seleccionar Cajas")
			em_folio_fin.setfocus()
		elseif ll_ran_ini >= ll_ran_fin then
			messagebox("Advertencia","Rangos de Folios Inválidos")
			em_folio_fin.setfocus()
		elseif isnull(ll_ran_ini) or ll_ran_ini=0 then
			messagebox("Advertencia","Debe Ingresar Folio Inicial")
			em_folio_ini.setfocus()
		elseif isnull(ll_ran_fin) or ll_ran_fin=0 then
			messagebox("Advertencia","Debe Ingresar Folio Final")
			em_folio_fin.setfocus()
//		elseif ll_calc_dif > ll_tot_reg then
//			messagebox("Advertencia","Existe Diferencia Cantidad Documentos a Modificar con Rango de Folio Indicado")
//			em_folio_fin.setfocus()
		else
			ll_tot_reg_caja					= dw_caja.rowcount()
			ll_fila								= dw_caja.Find( "sw_asig = 0 ", 1, ll_tot_reg_caja)
			if ll_fila=0 then
				messagebox("Advertencia","Debe Seleccionar Caja para Asignar Folio")
				dw_caja.setfocus()
			else
				ll_grupo						= dw_proceso.getitemnumber(dw_proceso.getrow(),'grupo')
				ls_tipo_doc					= dw_dcto_electronico.getitemstring(1,'tipo_doc')
				SELECT		count("ELECTRONICA_FB_DETALLE"."GRUPO")
				INTO 			:ll_count_reg_p  
				FROM 		"ELECTRONICA_FB_DETALLE"  
				WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" =  :ll_grupo ) AND  
							  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tipo_doc ) AND  
							  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) AND  
							  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" >= :ll_ran_ini ) AND  
							  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" <= :ll_ran_fin )   ;
				if ll_count_reg_p > 0 then ll_count_reg_p = ll_count_reg_p - 1
				if ll_count_reg_p = ll_folio_marcados then
					ls_pasa		= 'S'
				elseif ll_count_reg_p = 0 then
					ls_pasa		= 'S'
				else
					ll_res			= messagebox("Advertencia","Existe Folios Utilizados, desea Continuar la Asignación",Exclamation!,YesNo!,2)
					if ll_res = 1 then
						ls_pasa	= 'S'
					else
						ls_pasa	= 'N'
					end if
				end if
				if ls_pasa='S' then
					sw_marcado				= 0
					em_folios.text				= string(ll_calc_dif)
					ll_folio_marcados			= dw_caja.getitemnumber(1,'c_tot_cant')
					ll_folio_asignar				= ll_calc_dif
					if ll_folio_marcados = ll_folio_asignar then
						ll_indi						= ll_fac_ini
						ll_fila_prim				= dw_detalle.Find( "nro_documento = "+string(ll_ran_ini), 1, ll_tot_reg)
						ll_tot_reg				= ll_fila_prim + ll_ran_fin
						ll_new					= ll_fila_prim
						for ll_indi_marca=1 to ll_tot_reg_caja
							ll_sw_caja			= dw_caja.getitemnumber(ll_indi_marca,'sw_asig')
							if ll_sw_caja = 0 then
								sw_marcado ++
								ls_caja			= dw_caja.getitemstring(ll_indi_marca,'caja')
								if sw_marcado=1 then
									ll_cant		= dw_caja.getitemnumber(ll_indi_marca,'cant_folio_elect') + 1
								else
									ll_cant		= dw_caja.getitemnumber(ll_indi_marca,'cant_folio_elect')
								end if
								if not isnull(ls_caja) and ll_cant > 0 then
									for ll_indi_caja=1 to ll_cant
										ls_estado_reg	= dw_detalle.getitemstring(ll_new,'estado_reg')
										if ls_estado_reg='P' then
											dw_detalle.setitem(ll_new,'cod_caja',ls_caja)
											dw_detalle.setitem(ll_new,'rut_empresa',ls_rut_emp)
										end if
										ll_new ++
									next
								end if
							end if
						next
						dw_detalle.accepttext()
						cb_grabar.enabled		= true
					else
						messagebox("Advertencia","No coinciden Folios Asignar con Cajas Seleccionadas")
						em_folios.setfocus()
					end if
				end if
			end if
		end if
		SetPointer(Arrow!)
	else
		dw_detalle.reset()
		if not isnull(ls_tipo_doc) then
			SetPointer(HourGlass!)
			ll_reg				= dw_proceso.RowCount()
			if ll_reg > 0 then
				ll_pos			= dw_proceso.Find("estado = 'P'", 1, ll_reg)
				ll_fila_proc	= dw_proceso.getrow()
				if ll_pos > 0 then
					dw_proceso.scrolltorow(ll_pos)
					if ll_fila_proc <> ll_pos then
						messagebox("Advertencia","Grupo Seleccionado NO corresponde al Proceso que desea Generar")
					end if
					SELECT	MAX("FACTURAS_DETALLE"."CORRELATIVO")  
					INTO 		:ll_max  
					FROM 	"FACTURAS_DETALLE"  
					USING	sqlca;
					if isnull(ll_max) or ll_max = 0 then ll_max=0
					ll_corr			= 0
					ll_grupo			= dw_proceso.getitemnumber(ll_pos,'grupo')
					ll_fac_ini			= dw_proceso.getitemnumber(ll_pos,'rango_inicio')
					ll_fac_fin			= dw_proceso.getitemnumber(ll_pos,'rango_termino')
					ls_autoriza		= dw_proceso.getitemstring(ll_pos,'autorizacion_sii')
					ls_nro_tramite	= dw_proceso.getitemstring(ll_pos,'codigo_sii')
					ls_rut				= dw_proceso.getitemstring(ll_pos,'rut_empresa')
					if ll_fac_ini > ll_fac_fin then
						messagebox("Advertencia","Nº Factura Inicial No debe ser Mayor al Nº Factura Término")
						dw_proceso.setfocus()
						dw_proceso.setcolumn('rango_termino')
					elseif isnull(ls_nro_tramite) or ls_nro_tramite='' then
						messagebox("Advertencia","Debe Ingresar Nº Tramite")
						dw_proceso.setfocus()
						dw_proceso.setcolumn('codigo_sii')
					elseif isnull(ls_autoriza) or ls_autoriza='' then
						messagebox("Advertencia","Debe Ingresar Nº Autorización")
						dw_proceso.setfocus()
						dw_proceso.setcolumn('autorizacion_sii')
					elseif isnull(ll_grupo) or ll_grupo=0 then
						messagebox("Advertencia","No se Generó Nº Grupo")
					elseif isnull(ls_rut) or ls_rut='' then
						messagebox("Advertencia","Debe Ingresar Rur Empresa")
						dw_proceso.setfocus()
						dw_proceso.setcolumn('rut_empresa')
					else
						ll_tot_reg_caja				= dw_caja.rowcount()
						ll_fila							= dw_caja.Find( "sw_asig = 0 ", 1, ll_tot_reg_caja)
						if ll_fila=0 then
							messagebox("Advertencia","Debe Seleccionar Caja para Asignar Folio")
							dw_caja.setfocus()
						else
							ll_folio_marcados			= dw_caja.getitemnumber(1,'c_tot_cant')
							ll_folio_asignar				= long(em_folios.text)
							if ll_folio_marcados = ll_folio_asignar then
								dw_proceso.setitem(dw_proceso.getrow(),'fecha_crea',gdt_fec_sistema)
								ll_indi						= ll_fac_ini
								for ll_indi_marca=1 to ll_tot_reg_caja
									ll_sw_caja			= dw_caja.getitemnumber(ll_indi_marca,'sw_asig')
									if ll_sw_caja = 0 then
										ls_caja			= dw_caja.getitemstring(ll_indi_marca,'caja')
										ll_cant			= dw_caja.getitemnumber(ll_indi_marca,'cant_folio_elect')
										if not isnull(ls_caja) and ll_cant > 0 then
											for ll_indi_caja=1 to ll_cant
												ll_corr	= ll_max + ll_indi
												ll_new	= dw_detalle.insertrow(0)
												dw_detalle.scrolltorow(ll_new)
												dw_detalle.setitem(ll_new,'grupo',ll_grupo)
												dw_detalle.setitem(ll_new,'nro_documento',ll_indi)
												dw_detalle.setitem(ll_new,'estado_reg','P')
												dw_detalle.setitem(ll_new,'tipo_documento',ls_tipo_doc)
												dw_detalle.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
												dw_detalle.setitem(ll_new,'cod_caja',ls_caja)
												dw_detalle.setitem(ll_new,'rut_empresa',ls_rut)
												ll_indi ++
											next
										end if
									end if
								next
		//						for ll_indi=ll_fac_ini to ll_fac_fin
		//						next
								dw_detalle.accepttext()
								cb_grabar.enabled		= true
							else
								messagebox("Advertencia","No coinciden Folios Asignar con Cajas Seleccionadas")
								em_folios.setfocus()
							end if
						end if
					end if
				end if
			end if
			SetPointer(Arrow!)
		end if
	end if
else
	messagebox("Advertencia","Debe Seleccionar Tipo Documento Electrónico")
	dw_dcto_electronico.setfocus()	
end if
end event

type dw_detalle from datawindow within w_codigo
integer x = 46
integer y = 1340
integer width = 3909
integer height = 948
integer taborder = 150
string title = "none"
string dataobject = "dw_lista_detalle_electrica_fb_por_grupo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event clicked;String		ls_columna

if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
else
	ls_columna		= dwo.name
	if ls_columna='t_pendiente' then
		dw_detalle.SETfilter('estado_reg="P"')
		dw_detalle.filter()
	elseif ls_columna='t_gestionado' then
		dw_detalle.SETfilter('estado_reg="G"')
		dw_detalle.filter()
	elseif ls_columna='t_anulado' then
		dw_detalle.SETfilter('estado_reg="A"')
		dw_detalle.filter()
	elseif ls_columna='t_todo' then
		dw_detalle.SETfilter('')
		dw_detalle.filter()
	end if
end if
end event

type cb_proceso from commandbutton within w_codigo
integer x = 50
integer y = 1176
integer width = 398
integer height = 112
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo Periodo"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_factura_ini,ll_factura_fin,ll_new,ll_max,ll_pos,ll_rango_doc,ll_doc_termino_ant,ll_rango_dias,ll_factura_tope,ll_grupo,&
			ll_count_reg,ll_cant_folios,ll_cant_folio,ll_folio_ini,ll_folio_fin,ll_cant_fol,ll_folio_marcados,ll_folio_asignar
datetime	ldt_fecha_limite,ldt_fecha_inicio,ldt_fec_termino_ant
String		ls_pasa,ls_nro_tramite,ls_llave,ls_tipo_doc,ls_rut,ls_rut_empresa,ls_pasa_fol='S'
Date		ldt_fecha_tope,ldt_fecha_hoy

cb_grabar.enabled				= false
Setnull(ldt_fecha_tope);Setnull(ldt_fecha_hoy);Setnull(ldt_fecha_limite)
SELECT 	sysdate,				"TASA"."RANGO_DOC_ELECTRONICO",	"TASA"."RANGO_DIAS_ELECTRONICO" 
INTO 		:gdt_fec_sistema,	:ll_rango_doc,									:ll_rango_dias
FROM		"TASA" 
WHERE 	"TASA"."LOOK" = 1   
USING	sqlca;
ldt_fecha_hoy					= date(gdt_fec_sistema)

ls_tipo_doc						= dw_dcto_electronico.getitemstring(1,'tipo_doc')
ls_rut_empresa					= dw_dcto_electronico.getitemstring(1,'rut_empresa')
ll_cant_folios					= long(em_folios.text)

//ll_cant_folio						= dw_caja.getitemnumber(1,'c_suma_ok')
//ll_folio_ini						= dw_proceso.getitemnumber(dw_proceso.getrow(),'rango_inicio')
//ll_folio_fin						= dw_proceso.getitemnumber(dw_proceso.getrow(),'rango_termino')
ll_rango_doc					= ll_cant_folios
ll_folio_marcados				= dw_caja.getitemnumber(1,'c_tot_cant')
ll_folio_asignar					= long(em_folios.text)
if ll_folio_marcados <> ll_folio_asignar then
	messagebox("Advertencia","Recuerde que Folios Asignar, debe ser IGUAL al Total # Cajas Seleccionadas")
	ls_pasa_fol					= 'N'
	dw_caja.setfocus()
end if

//if ll_folio_ini=1 then
//	ll_cant_fol					= ll_folio_fin + 1
//else
//	ll_cant_fol					= ll_folio_fin
//end if
//if (ll_cant_fol - ll_folio_ini) >= ll_cant_folio then
//	messagebox("Advertencia","Recuerde que Folios Asignar Caja NO debe ser mayor al Autorizado")
//	ls_pasa_fol					= 'N'
//	dw_caja.setfocus()
//end if
if ls_pasa_fol='S' then
	if not isnull(ls_tipo_doc) and ll_cant_folios > 0 then
		ll_tot_reg					= dw_proceso.rowcount()
		ls_pasa						= 'S'
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				ll_grupo				= dw_proceso.getitemnumber(ll_indi,'grupo')
				ldt_fecha_limite	= dw_proceso.getitemdatetime(ll_indi,'fecha_termino')
				ll_factura_ini		= dw_proceso.getitemnumber(ll_indi,'rango_inicio')
				ll_factura_fin		= dw_proceso.getitemnumber(ll_indi,'rango_termino')
				ls_nro_tramite		= dw_proceso.getitemstring(ll_indi,'codigo_sii')
				ls_llave				= dw_proceso.getitemstring(ll_indi,'autorizacion_sii')
				ls_rut					= dw_proceso.getitemstring(ll_indi,'rut_empresa')
				if isnull(ldt_fecha_limite) or isnull(ll_factura_ini) or ll_factura_ini=0 or isnull(ll_factura_fin) or ll_factura_fin=0 or &
					isnull(ls_nro_tramite) or ls_nro_tramite='' or isnull(ls_llave) or ls_llave='' or isnull(ls_rut) then
					messagebox("Advertencia","No es posible Generar Nuevo Proceso, falta Ingresar Datos en Fila Nº "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				else
					SELECT	Count("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO")
					INTO 		:ll_count_reg  
					FROM 	"ELECTRONICA_FB_DETALLE"  
					WHERE ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
							  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :ls_tipo_doc )   ;
					if ll_count_reg = 0 then
						messagebox("Advertencia","No es posible Generar Nuevo Proceso, Grupo N° "+string(ll_grupo,'###,###,###,###')+" No Registra Detalle Grabado")
						ls_pasa			= 'N'
						exit
					end if
				end if
			next
		end if
		if ls_pasa='S' then
			SELECT		MAX("ELECTRONICA_FB"."GRUPO")  
			INTO 			:ll_max  
			FROM 		"ELECTRONICA_FB" 
			WHERE		"ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tipo_doc
			USING		sqlca;
			if ll_max > 0 then
//				ll_max ++
			else
				ll_max						= 1
			end if
			
			SELECT	"ELECTRONICA_FB"."FECHA_TERMINO",   
						"ELECTRONICA_FB"."RANGO_TERMINO"  
			INTO 		:ldt_fec_termino_ant,   
						:ll_doc_termino_ant  
			FROM 	"ELECTRONICA_FB"  
			WHERE 	"ELECTRONICA_FB"."GRUPO" = (	SELECT		MAX("ELECTRONICA_FB"."GRUPO")  
																	FROM 		"ELECTRONICA_FB" 
																	WHERE		"ELECTRONICA_FB"."TIPO_DOCUMENTO" = :ls_tipo_doc)  
			USING	sqlca;
			if sqlca.sqlcode<>0 then
				ll_doc_termino_ant		= 0
			end if
	
			ll_pos								= dw_proceso.Find("rut_empresa='"+ls_rut_empresa +"' and estado = 'P' and tipo_documento = '"+ls_tipo_doc+"'", 1, ll_tot_reg)
			if ll_pos > 0 then
				dw_proceso.setitem(ll_pos,'estado','G')
				ldt_fecha_tope				= date(dw_proceso.getitemdatetime(ll_pos,'fecha_termino'))
				ll_factura_tope				= dw_proceso.getitemnumber(ll_pos,'rango_termino')
				dw_proceso.accepttext()
			end if
			dw_detalle.reset()
			ll_new							= dw_proceso.insertrow(0)
			dw_proceso.scrolltorow(ll_new)
			if isnull(ldt_fecha_tope) then
				ldt_fecha_limite			= datetime(relativedate(ldt_fecha_hoy,ll_rango_dias))
				ldt_fecha_inicio				= datetime(relativedate(ldt_fecha_hoy,1))
			else
				ldt_fecha_limite			= datetime(relativedate(ldt_fecha_tope,ll_rango_dias))
				ldt_fecha_inicio				= datetime(relativedate(ldt_fecha_tope,1))
			end if
			if isnull(ll_factura_tope) then ll_factura_tope=0
			ll_factura_tope ++
			dw_proceso.setitem(ll_new,'fecha_termino',ldt_fecha_limite)
			dw_proceso.setitem(ll_new,'fecha_inicio',ldt_fecha_inicio)
			dw_proceso.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
			dw_proceso.setitem(ll_new,'grupo',ll_max)
			dw_proceso.setitem(ll_new,'estado','P')
			dw_proceso.setitem(ll_new,'rango_inicio',ll_factura_tope)
			dw_proceso.setitem(ll_new,'rango_termino', (ll_factura_tope + ll_rango_doc ) )
//			dw_proceso.setitem(ll_new,'rango_termino', (ll_factura_tope + ll_rango_doc ) - 1)
			dw_proceso.setitem(ll_new,'usuario_crea',gs_user)
			dw_proceso.setitem(ll_new,'tipo_documento',ls_tipo_doc)
			dw_proceso.setitem(ll_new,'rut_empresa',ls_rut_empresa)
			dw_proceso.accepttext()
			dw_proceso.setfocus()
			dw_proceso.setcolumn('autorizacion_sii')
		end if
	else
		if isnull(ls_tipo_doc) then
			messagebox("Advertencia","Debe Seleccionar Documento Electrónico")
			dw_dcto_electronico.setfocus()
		elseif ll_cant_folios = 0 or isnull(ll_cant_folios) then
			messagebox("Advertencia","Debe Ingresar Folios Asignar")
			em_folios.setfocus()
		end if
	end if
end if
end event

type dw_proceso from datawindow within w_codigo
integer x = 37
integer y = 180
integer width = 3040
integer height = 940
integer taborder = 50
string dataobject = "dw_dosificacion_factura"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_grupo
String		ls_tipo_doc
if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_grupo			= dw_proceso.getitemnumber(row,'grupo')
	ls_tipo_doc		= dw_proceso.getitemstring(row,'tipo_documento')
	if ll_grupo > 0 and not isnull(ls_tipo_doc) then
		//dw_detalle.retrieve(ll_grupo,ls_tipo_doc)
	end if
end if
end event

event rowfocuschanged;Long		ll_grupo
String		ls_tipo_doc,ls_rut_emp

if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	ll_grupo			= dw_proceso.getitemnumber(getrow(),'grupo')
	ls_tipo_doc		= dw_proceso.getitemstring(getrow(),'tipo_documento')
	ls_rut_emp		= dw_dcto_electronico.getitemstring(1,'rut_empresa')
	if ll_grupo > 0 and not isnull(ls_tipo_doc) then
		dw_detalle.retrieve(ll_grupo,ls_tipo_doc,ls_rut_emp)
	end if
end if
end event

type sle_llave_dosificacion from editmask within w_codigo
integer x = 722
integer y = 3256
integer width = 2971
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type sle_monto from editmask within w_codigo
integer x = 722
integer y = 3116
integer width = 654
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type sle_fecha from editmask within w_codigo
integer x = 722
integer y = 2976
integer width = 654
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type sle_nit from editmask within w_codigo
integer x = 722
integer y = 2836
integer width = 654
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type sle_num_factura from editmask within w_codigo
integer x = 722
integer y = 2696
integer width = 654
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type sle_num_autorizacion from editmask within w_codigo
integer x = 722
integer y = 2556
integer width = 654
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type st_base64 from statictext within w_codigo
integer x = 763
integer y = 3712
integer width = 2921
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "####"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_sumatoria_producto from statictext within w_codigo
integer x = 763
integer y = 3640
integer width = 2926
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "####"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_cadena from statictext within w_codigo
integer x = 763
integer y = 3568
integer width = 2889
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "####"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_verhoeff from statictext within w_codigo
integer x = 763
integer y = 3496
integer width = 2921
integer height = 48
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "####"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_10 from statictext within w_codigo
integer x = 443
integer y = 3708
integer width = 288
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "BASE64"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_9 from statictext within w_codigo
integer x = 142
integer y = 3640
integer width = 590
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "SUMATORIA PRODUCTO"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_codigo
integer x = 443
integer y = 3572
integer width = 288
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "CADENA"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within w_codigo
integer x = 443
integer y = 3504
integer width = 288
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "VERHOEFF"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_codigo
integer x = 119
integer y = 3280
integer width = 567
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Llave de Dosificacion"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_codigo
integer x = 494
integer y = 3140
integer width = 187
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Monto"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_codigo
integer x = 480
integer y = 2996
integer width = 201
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_codigo
integer x = 3593
integer y = 2324
integer width = 361
integer height = 112
integer taborder = 190
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
close(w_codigo);
end event

type st_codigo_control from statictext within w_codigo
integer x = 1559
integer y = 2816
integer width = 1970
integer height = 124
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Impact"
long textcolor = 16711680
long backcolor = 67108864
string text = "---"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_codigo
integer x = 174
integer y = 2860
integer width = 507
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NIT / CI del Cliente"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_codigo
integer x = 160
integer y = 2720
integer width = 521
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Numero de Factura"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_codigo
integer x = 32
integer y = 2580
integer width = 649
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Numero de Autorizacion"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_codigo
integer x = 2391
integer y = 2992
integer width = 1111
integer height = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = ">> Traer Codigo  <<"
end type

event clicked;String	codigo_control,ls_aut,ls_fac,ls_nit,ls_fec,ls_mon,ls_llave;

//setnull(codigo_control);setnull(ls_aut);setnull(ls_fac);setnull(ls_nit);setnull(ls_fec)
//setnull(ls_mon);setnull(ls_llave)

ls_aut						= trim(sle_num_autorizacion.Text)
ls_fac						= trim(sle_num_factura.Text)
ls_nit						= trim(sle_nit.Text)
ls_fec						= trim(sle_fecha.Text)
ls_mon						= trim(sle_monto.Text)
ls_llave						= trim(sle_llave_dosificacion.Text)

//codigo_control 			= f_codigo_control(ls_aut, ls_fac, ls_nit, ls_fec, ls_mon, ls_llave);

st_codigo_control.Text	= codigo_control;


end event

type gb_1 from groupbox within w_codigo
integer x = 1445
integer y = 2688
integer width = 2117
integer height = 520
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Codigo de Control"
end type

type gb_2 from groupbox within w_codigo
integer x = 91
integer y = 3396
integer width = 3634
integer height = 436
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Calculos Previos"
end type

type gb_11 from groupbox within w_codigo
integer x = 2501
integer y = 1124
integer width = 1458
integer height = 188
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_caja from datawindow within w_codigo
integer x = 3127
integer y = 44
integer width = 613
integer height = 592
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lista_caja_asignar_bl_elect"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_codigo
integer x = 3127
integer y = 688
integer width = 832
integer height = 428
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asignación de Folios Existentes"
end type

