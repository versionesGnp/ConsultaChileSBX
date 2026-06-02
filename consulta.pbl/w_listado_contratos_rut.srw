forward
global type w_listado_contratos_rut from window
end type
type cb_ben_seg_fun from commandbutton within w_listado_contratos_rut
end type
type cb_10 from commandbutton within w_listado_contratos_rut
end type
type cb_9 from commandbutton within w_listado_contratos_rut
end type
type cb_8 from commandbutton within w_listado_contratos_rut
end type
type dw_print from datawindow within w_listado_contratos_rut
end type
type cb_imprimir from commandbutton within w_listado_contratos_rut
end type
type dw_2 from datawindow within w_listado_contratos_rut
end type
type dw_1 from datawindow within w_listado_contratos_rut
end type
type cb_7 from commandbutton within w_listado_contratos_rut
end type
type cb_6 from commandbutton within w_listado_contratos_rut
end type
type cb_5 from commandbutton within w_listado_contratos_rut
end type
type cb_3 from commandbutton within w_listado_contratos_rut
end type
type cb_2 from commandbutton within w_listado_contratos_rut
end type
type cb_1 from commandbutton within w_listado_contratos_rut
end type
type cb_mensajes from commandbutton within w_listado_contratos_rut
end type
type cb_fallecidos from commandbutton within w_listado_contratos_rut
end type
type cb_datos_repacta from commandbutton within w_listado_contratos_rut
end type
type cb_beneficiarios from commandbutton within w_listado_contratos_rut
end type
type cb_datos_clientes from commandbutton within w_listado_contratos_rut
end type
type cb_datos_contrato from commandbutton within w_listado_contratos_rut
end type
type cb_cerrar from commandbutton within w_listado_contratos_rut
end type
type cb_ver_cuenta_corriente from commandbutton within w_listado_contratos_rut
end type
type gb_1 from groupbox within w_listado_contratos_rut
end type
type dw_listado_rut from datawindow within w_listado_contratos_rut
end type
end forward

global type w_listado_contratos_rut from window
integer x = 462
integer y = 412
integer width = 3131
integer height = 1696
boolean titlebar = true
string title = "Resultado Consulta_x Rut"
boolean controlmenu = true
boolean minbox = true
long backcolor = 77571519
cb_ben_seg_fun cb_ben_seg_fun
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
dw_print dw_print
cb_imprimir cb_imprimir
dw_2 dw_2
dw_1 dw_1
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_mensajes cb_mensajes
cb_fallecidos cb_fallecidos
cb_datos_repacta cb_datos_repacta
cb_beneficiarios cb_beneficiarios
cb_datos_clientes cb_datos_clientes
cb_datos_contrato cb_datos_contrato
cb_cerrar cb_cerrar
cb_ver_cuenta_corriente cb_ver_cuenta_corriente
gb_1 gb_1
dw_listado_rut dw_listado_rut
end type
global w_listado_contratos_rut w_listado_contratos_rut

type variables
Long	il_row4
end variables

on w_listado_contratos_rut.create
this.cb_ben_seg_fun=create cb_ben_seg_fun
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.dw_print=create dw_print
this.cb_imprimir=create cb_imprimir
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_mensajes=create cb_mensajes
this.cb_fallecidos=create cb_fallecidos
this.cb_datos_repacta=create cb_datos_repacta
this.cb_beneficiarios=create cb_beneficiarios
this.cb_datos_clientes=create cb_datos_clientes
this.cb_datos_contrato=create cb_datos_contrato
this.cb_cerrar=create cb_cerrar
this.cb_ver_cuenta_corriente=create cb_ver_cuenta_corriente
this.gb_1=create gb_1
this.dw_listado_rut=create dw_listado_rut
this.Control[]={this.cb_ben_seg_fun,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.dw_print,&
this.cb_imprimir,&
this.dw_2,&
this.dw_1,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_mensajes,&
this.cb_fallecidos,&
this.cb_datos_repacta,&
this.cb_beneficiarios,&
this.cb_datos_clientes,&
this.cb_datos_contrato,&
this.cb_cerrar,&
this.cb_ver_cuenta_corriente,&
this.gb_1,&
this.dw_listado_rut}
end on

on w_listado_contratos_rut.destroy
destroy(this.cb_ben_seg_fun)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.dw_print)
destroy(this.cb_imprimir)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_mensajes)
destroy(this.cb_fallecidos)
destroy(this.cb_datos_repacta)
destroy(this.cb_beneficiarios)
destroy(this.cb_datos_clientes)
destroy(this.cb_datos_contrato)
destroy(this.cb_cerrar)
destroy(this.cb_ver_cuenta_corriente)
destroy(this.gb_1)
destroy(this.dw_listado_rut)
end on

event open;long il_cant_datos
gf_centrar(w_listado_contratos_rut)
il_row4		= 0
gs_ventana	= 'w_listado_contratos_rut'
f_valida_objeto()
CHOOSE CASE gi_tipo_busqueda
	CASE 0 //Por número de contrato
		dw_listado_rut.DataObject	= 'd_cont_resultado_busqueda_x_num'
		dw_listado_rut.SetTransObject(SQLCA)
		dw_print.DataObject 			= 'd_cont_resultado_busqueda_x_num_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 					= dw_listado_rut.Retrieve(rutx)
		dw_print.Retrieve(rutx)
	CASE 1 //Por RUT
		dw_listado_rut.DataObject 	= 'd_cont_resultado_busqueda_x_rut'
		dw_listado_rut.SetTransObject(SQLCA)
		dw_print.DataObject 			= 'd_cont_resultado_busqueda_x_rut_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 					= dw_listado_rut.Retrieve(gi_rut)
		dw_print.Retrieve(gi_rut)
	CASE 2 //Por Apellido Paterno
		dw_listado_rut.DataObject 	= 'd_cont_resultado_busqueda_x_apaterno'
		dw_listado_rut.SetTransObject(SQLCA)
		dw_print.DataObject 			= 'd_cont_resultado_busqueda_x_apaterno_pri'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 					= dw_listado_rut.Retrieve(gs_apellido_paterno)
		dw_print.Retrieve(gs_apellido_paterno)
	CASE 4 //Por Fallecidos
		dw_listado_rut.DataObject 	= 'd_cont_resultado_busqueda_x_fallecido'
		dw_listado_rut.SetTransObject(SQLCA)
		dw_print.DataObject 			= 'd_cont_resultado_busqueda_x_fallecido_pr'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 					= dw_listado_rut.Retrieve(gi_rut, gs_nombres, gs_apellido_paterno, gs_apellido_materno, gs_sector, gs_sepultura)
		dw_print.Retrieve(gi_rut, gs_nombres, gs_apellido_paterno, gs_apellido_materno, gs_sector, gs_sepultura)
   CASE 5 //Por Ofertas /Ubicacion
		dw_listado_rut.DataObject 	= 'd_cont_resultado_busqueda_x_ub_oferta'
		dw_listado_rut.SetTransObject(SQLCA)
		dw_print.DataObject 			= 'd_cont_resultado_busqueda_x_ub_ofe_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 					= dw_listado_rut.Retrieve(gs_sector, gs_sepultura, gs_area)
		dw_print.Retrieve(gs_sector, gs_sepultura, gs_area)
	CASE 6 //Por Contratos /Ubicacion
		dw_listado_rut.DataObject 	= 'd_cont_resultado_busqueda_x_ub_contr'
		dw_listado_rut.SetTransObject(SQLCA)
		dw_print.DataObject 			= 'd_cont_resultado_busqueda_x_ub_con_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 					= dw_listado_rut.Retrieve(gs_sector, gs_sepultura,gs_area)
		dw_print.Retrieve(gs_sector, gs_sepultura,gs_area)
	CASE 7 //Por Contratos /numero tecnico
		dw_listado_rut.DataObject 	= 'd_cont_resultado_busqueda_x_ub_tecnico'
		dw_listado_rut.SetTransObject(SQLCA)
		dw_print.DataObject 			= 'd_cont_resultado_busqueda_x_ub_tec_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 					= dw_listado_rut.Retrieve(gi_tecnico)	
		dw_print.Retrieve(gi_tecnico)	
	CASE 8 //Por Contratos /numero contrato todos
		dw_listado_rut.DataObject 	= 'd_cont_resultado_busqueda_x_numero'
		dw_listado_rut.SetTransObject(SQLCA)
		dw_print.DataObject 			= 'd_cont_resultado_busqueda_x_numero_print'
		dw_print.SetTransObject(SQLCA)
		il_cant_datos 					= dw_listado_rut.Retrieve(gi_numero)			
		dw_print.Retrieve(gi_numero)	
END CHOOSE

IF il_cant_datos = 0 THEN
	MessageBox("Consulta", "No encontraron datos asociados a su consulta.")
	Close(w_listado_contratos_rut)
END IF
end event

type cb_ben_seg_fun from commandbutton within w_listado_contratos_rut
integer x = 1998
integer y = 1452
integer width = 498
integer height = 100
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Benef.Seg.Funerario"
end type

event clicked;String		ls_string
if il_row4>0 then
	gs_base 					= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 					= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 				= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 					= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	ls_string					= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if not isnull(gs_base) and gi_numero>0 then
		if isvalid(w_ingresar_benef_seguro_funeraria2) then close(w_ingresar_benef_seguro_funeraria2)
		openwithparm(w_ingresar_benef_seguro_funeraria2,ls_string)
	end if
end if
end event

type cb_10 from commandbutton within w_listado_contratos_rut
integer x = 1664
integer y = 1452
integer width = 329
integer height = 100
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Doc. General"
end type

event clicked;string		ls_dv,ls_base,ls_serie,ls_ctto
long 		ret,ll_res,ll_rut,ll_tipo_dctto,ll_parque,ll_res1,ll_res2
double	li_numero

if il_row4>0 then 
	ll_res					= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ll_rut				= dw_listado_rut.GetItemNumber(il_row4, 'cliente_rut')
		ls_dv				= dw_listado_rut.GetItemstring(il_row4, 'cliente_dv')
		ll_parque			= dw_listado_rut.GetItemNumber(il_row4, 'cadena_cod_parque')
		ls_base 			= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
		ls_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
		li_numero 		= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	//	ls_ctto			= ls_base+ls_serie+string(li_numero)
		ls_ctto			= ls_serie+string(li_numero)
		
		ll_res1	= messagebox("Pregunta","¿Desea Consultar Contrato Digitalizados?",Exclamation!,YesNo!,2) 
		if ll_res1	= 1 then
			Inet  iinet_base
			ret = GetContextService("Internet", iinet_base)
			if ret = -1 then
				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
				return
			end if
			if ll_parque > 0 then
				ret = iinet_base.HyperlinkToURL("http://10.0.22.71:8091/api/documentos/promesa/general?numero="+string(li_numero)+'&parque='+string(ll_parque) )	//	QA
//				ret = iinet_base.HyperlinkToURL("http://10.0.22.72:8090/api/documentos?base="+ls_base+'&serie='+ls_serie+'&numero='+string(li_numero)+'&parque='+string(ll_parque) )	PRODUCCION
			end if
			if ret = -1 then
				messagebox('No Existe','No existe Documentación Contrato '+ls_base+'-'+ls_serie+'-'+string(li_numero),stopsign!)
				return
			end if
		end if
	end if
end if	
end event

type cb_9 from commandbutton within w_listado_contratos_rut
integer x = 1321
integer y = 1452
integer width = 338
integer height = 100
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Doc. Contrato"
end type

event clicked;string	ls_dv,ls_base,ls_serie,ls_ctto
long ret,ll_res,ll_rut,ll_tipo_dctto,ll_parque,ll_res1,ll_res2
double	li_numero

if il_row4>0 then 
	ll_res					= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ll_rut				= dw_listado_rut.GetItemNumber(il_row4, 'cliente_rut')
		ls_dv				= dw_listado_rut.GetItemstring(il_row4, 'cliente_dv')
		ll_parque			= dw_listado_rut.GetItemNumber(il_row4, 'cadena_cod_parque')
		ls_base 			= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
		ls_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
		li_numero 		= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
//		ls_ctto			= ls_base+ls_serie+string(li_numero)
		ls_ctto			= ls_serie+string(li_numero)
		
		ll_res1	= messagebox("Pregunta","¿Desea Consultar Contrato Digitalizados?",Exclamation!,YesNo!,2) 
		if ll_res1	= 1 then
			Inet  iinet_base
			ret = GetContextService("Internet", iinet_base)
			if ret = -1 then
				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
				return
			end if
			if ll_parque > 0 then
//	http://10.0.22.56:8090/api/documentos?base=A&serie=A&numero=1&parque=1
				ret = iinet_base.HyperlinkToURL("http://10.0.22.71:8091/api/documentos?base="+ls_base+'&serie='+ls_serie+'&numero='+string(li_numero)+'&parque='+string(ll_parque) )
			end if
			if ret = -1 then
				messagebox('No Existe','No existe Documentación Contrato '+ls_base+'-'+ls_serie+'-'+string(li_numero),stopsign!)
				return
			end if
		end if
	end if
end if	
end event

type cb_8 from commandbutton within w_listado_contratos_rut
integer x = 882
integer y = 1452
integer width = 434
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Doc. Digitalizados"
end type

event clicked;string	ls_dv,ls_base,ls_serie,ls_ctto
long ret,ll_res,ll_rut,ll_tipo_dctto,ll_parque,ll_res1,ll_res2
double	li_numero

if il_row4>0 then 
	ll_res					= messagebox("Advertencia","Recuerde Desbloquear Ventana Emergente (pop-up) en su Navegador de Internet",Exclamation!,YesNo!,2)
	if ll_res=1 then
		ll_rut				= dw_listado_rut.GetItemNumber(il_row4, 'cliente_rut')
		ls_dv				= dw_listado_rut.GetItemstring(il_row4, 'cliente_dv')
		ll_parque			= dw_listado_rut.GetItemNumber(il_row4, 'cadena_cod_parque')
		ls_base 			= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
		ls_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
		li_numero 		= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
//		ls_ctto			= ls_base+ls_serie+string(li_numero)
		ls_ctto			= ls_serie+string(li_numero)
		
		ll_res1	= messagebox("Pregunta","¿Desea Consultar Documentos Digitalizados?",Exclamation!,YesNo!,2) 
		if ll_res1	= 1 then
			Inet  iinet_base
			ret = GetContextService("Internet", iinet_base)
			if ret = -1 then
				messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
				return
			end if
			ret = iinet_base.HyperlinkToURL("http://intra2.nuestrosparques.cl/documentos/getcontratos.php?rut="+string(ll_rut)+'-'+ls_dv+'&parque='+string(ll_parque)+'&ctto='+ls_ctto)
			if ret = -1 then
				messagebox('No Existe','No existe Documentación Digitalizada',stopsign!)
				return
			end if
		end if
	end if
end if	
end event

type dw_print from datawindow within w_listado_contratos_rut
boolean visible = false
integer x = 1760
integer y = 1664
integer width = 192
integer height = 144
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_listado_contratos_rut
boolean visible = false
integer x = 2802
integer y = 1708
integer width = 233
integer height = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_listado_rut.rowcount() > 0 then
	dw_print.object.t_titulo.text	= gs_conexion
	dw_print.print()
end if
end event

type dw_2 from datawindow within w_listado_contratos_rut
boolean visible = false
integer x = 1554
integer y = 1668
integer width = 192
integer height = 144
string dataobject = "d_listado_cuenta_cte_ch"
boolean livescroll = true
end type

type dw_1 from datawindow within w_listado_contratos_rut
event clicked pbm_dwnlbuttonclk
boolean visible = false
integer x = 923
integer y = 188
integer width = 1349
integer height = 844
integer taborder = 20
boolean titlebar = true
string title = "Información de Documentos"
string dataobject = "dw_estado_de_ch"
boolean controlmenu = true
boolean livescroll = true
end type

event clicked;visible = false
reset()
end event

type cb_7 from commandbutton within w_listado_contratos_rut
event clicked pbm_bnclicked
integer x = 411
integer y = 1452
integer width = 466
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuotas &Mantención"
end type

event clicked;if il_row4>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_boletas_cuotas) then close(w_boletas_cuotas)
		open(w_boletas_cuotas)
	end if
end if
end event

type cb_6 from commandbutton within w_listado_contratos_rut
event clicked pbm_bnclicked
integer x = 32
integer y = 1452
integer width = 375
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuotas Crédi&to"
end type

event clicked;if il_row4>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_repacta) then close(w_repacta)
		open(w_repacta)
	end if
end if
end event

type cb_5 from commandbutton within w_listado_contratos_rut
event clicked pbm_bnclicked
integer x = 2290
integer y = 1276
integer width = 293
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Dctos"
end type

event clicked;if il_row4>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_VER_CHEQUES) then close(w_VER_CHEQUES)
		Open(w_VER_CHEQUES)
	end if
end if
end event

type cb_3 from commandbutton within w_listado_contratos_rut
integer x = 2839
integer y = 1452
integer width = 201
integer height = 100
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtro"
end type

event clicked;string nulo
dw_1.visible = false
setnull (nulo)
dw_listado_rut.SETfilter(NULO)
dw_listado_rut.filter()
dw_print.filter()
end event

type cb_2 from commandbutton within w_listado_contratos_rut
boolean visible = false
integer x = 2569
integer y = 1708
integer width = 233
integer height = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;dw_1.visible = false
datawindow dw_paso
dw_paso	= dw_listado_rut
if dw_listado_rut.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_1 from commandbutton within w_listado_contratos_rut
integer x = 2629
integer y = 1452
integer width = 201
integer height = 100
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_listado_rut.rowcount()>0 then
	dw_1.visible = false
	setnull (nulo)
	dw_listado_rut.SETSORT(NULO)
	dw_listado_rut.SORT()
	dw_print.sort()
end if
end event

type cb_mensajes from commandbutton within w_listado_contratos_rut
integer x = 2034
integer y = 1276
integer width = 251
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Mensajes"
end type

event clicked;Long	ll_count
if il_row4>0 then
	gs_base 					= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 					= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 				= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 					= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if gi_rut>0 then 
			if isvalid(w_aviso_mensajes) then close(w_aviso_mensajes)
			SELECT	COUNT("MENSAJES"."FECHA_CREACION")  
			INTO 		:ll_count  
			FROM 		"MENSAJES"  
			WHERE  ( "MENSAJES"."RUT" = :gi_rut ) and
					 ( "MENSAJES"."ESTADO_GESTION" = 'A' ) AND
					 ( "MENSAJES"."SW_MENSAJE" = 'R' ) and
					 ( "MENSAJES"."FECHA_FIN" > :gdt_fec_sistema )
			USING		sqlca;
			if ll_count>0 then
				OpenWithParm(w_aviso_mensajes, "R")
			else
				SELECT	COUNT("MENSAJES"."FECHA_CREACION")  
				INTO 		:ll_count  
				FROM 		"MENSAJES"  
				WHERE  ( "MENSAJES"."BASE" = :gs_base ) and
						 ( "MENSAJES"."SERIE" = :gs_serie ) and
						 ( "MENSAJES"."NUMERO" = :gi_numero ) and
						 ( "MENSAJES"."ESTADO_GESTION" = 'A' ) AND
						 ( "MENSAJES"."SW_MENSAJE" = 'C' ) and
						 ( "MENSAJES"."FECHA_FIN" > :gdt_fec_sistema )
				USING		sqlca;
				if ll_count>0 then
					OpenWithParm(w_aviso_mensajes, "C")
				end if
			end if
		end if
	end if
end if
end event

type cb_fallecidos from commandbutton within w_listado_contratos_rut
integer x = 1774
integer y = 1276
integer width = 256
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Fallecidos"
end type

event clicked;if il_row4>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_listado_fallecidos) then close(w_listado_fallecidos)
		Open(w_listado_fallecidos)
	end if
end if
end event

type cb_datos_repacta from commandbutton within w_listado_contratos_rut
event clicked pbm_bnclicked
integer x = 704
integer y = 1276
integer width = 370
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Rep&actaciones"
end type

event clicked;if il_row4>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_listado_repacta) then close(w_listado_repacta)
				Open(w_listado_repacta)
			CASE "L" // Anexo Liberador
		//		Open(w_datos_contrato_liberador)
			CASE "A"
				if isvalid(w_listado_repacta_aumento_capacidad) then close(w_listado_repacta_aumento_capacidad)
				Open(w_listado_repacta_aumento_capacidad)
		END CHOOSE
	end if
end if

end event

type cb_beneficiarios from commandbutton within w_listado_contratos_rut
integer x = 1431
integer y = 1276
integer width = 338
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Beneficiarios"
end type

event clicked;if il_row4>0 then
	gs_base 					= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 					= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 				= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 					= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_listado_beneficiarios) then close(w_listado_beneficiarios)
				Open(w_listado_beneficiarios)
			CASE "C" // ISACRUZ
				if isvalid(w_listado_beneficiarios2) then close(w_listado_beneficiarios2)
				Open(w_listado_beneficiarios2)
		END CHOOSE
	end if
end if
end event

type cb_datos_clientes from commandbutton within w_listado_contratos_rut
integer x = 1079
integer y = 1276
integer width = 347
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Datos Clie&nte"
end type

event clicked;if il_row4>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		if isvalid(w_datos_cliente) then close(w_datos_cliente)
		Open(w_datos_cliente)
	end if
end if
end event

type cb_datos_contrato from commandbutton within w_listado_contratos_rut
integer x = 457
integer y = 1276
integer width = 242
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&ontrato"
end type

event clicked;if il_row4>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible 	= false
		CHOOSE CASE gs_base
			CASE "O","U","M" // Oferta
				if isvalid(w_datos_contrato_oferta) then close(w_datos_contrato_oferta)
				Open(w_datos_contrato_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_datos_contrato_liberador) then close(w_datos_contrato_liberador)
				Open(w_datos_contrato_liberador)
			CASE "P" // Pagaré
				if isvalid(w_datos_contrato_pagare) then close(w_datos_contrato_pagare)
				Open(w_datos_contrato_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_datos_contrato_isa) then close(w_datos_contrato_isa)
				Open(w_datos_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_datos_contrato_derecho) then close(w_datos_contrato_derecho)
				Open(w_datos_contrato_derecho)
			CASE "R" // Reprogramacion Cta. Mant.
				if isvalid(w_datos_contrato_reprogramacion_cta_mant) then close(w_datos_contrato_reprogramacion_cta_mant)
				open(w_datos_contrato_reprogramacion_cta_mant)
			CASE "A" // Aumento Capacidad
				if isvalid(w_datos_contrato_aumento_capacidad) then close(w_datos_contrato_aumento_capacidad)
				open(w_datos_contrato_aumento_capacidad)
		END CHOOSE
	end if
end if
end event

type cb_cerrar from commandbutton within w_listado_contratos_rut
integer x = 2766
integer y = 1276
integer width = 311
integer height = 100
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;//if isvalid(w_consultar_contato) then
//	IF gi_tipo_busqueda = 4 THEN
//		w_consultar_x_fallecido.em_rut.text = ""
//		w_consultar_x_fallecido.sle_nombres.text = ""
//		w_consultar_x_fallecido.sle_apaterno.text = ""
//		w_consultar_x_fallecido.sle_amaterno.text = ""
//		w_consultar_x_fallecido.sle_sector.text = ""
//		w_consultar_x_fallecido.sle_sepultura.text = ""
//	ELSE
//		IF gi_tipo_busqueda = 5 OR gi_tipo_busqueda = 6 THEN
//			w_consultar_x_sector.sle_sector.text = ""
//			w_consultar_x_sector.sle_sepultura.text = ""
//		ELSE
//			w_consultar_contato.sle_rut.text = ""
//			w_consultar_contato.sle_numero_contrato.text = ""
//			w_consultar_contato.sle_serie.text = ""
//		END IF
//	END IF
//end if
rutx = 0
IF ISVALID(w_consultar_contato) THEN
   w_consultar_contato.sle_numero.text = ""
END IF
Close(w_listado_contratos_rut)
end event

type cb_ver_cuenta_corriente from commandbutton within w_listado_contratos_rut
integer x = 32
integer y = 1276
integer width = 421
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&uenta Corriente"
end type

event clicked;if il_row4>0 then
	gs_base 				= dw_listado_rut.GetItemString(il_row4, "cadena_codigo")
	gs_serie 			= dw_listado_rut.GetItemString(il_row4, "cadena_serie")
	gi_numero 			= dw_listado_rut.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 				= dw_listado_rut.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta	= dw_listado_rut.GetItemNumber(il_row4, "cadena_cod_parque")
	gs_apellido_paterno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_paterno")
	gs_apellido_materno	= dw_listado_rut.GetItemString(il_row4, "cliente_a_materno")
	gs_nombres				= dw_listado_rut.GetItemString(il_row4, "cliente_nombre")
	gs_dv						= dw_listado_rut.GetItemString(il_row4, "cliente_dv")
	gs_estado				= dw_listado_rut.GetItemString(il_row4, "cadena_estado")
	if not isnull(gs_base) and gi_numero>0 then
		dw_1.visible	= false
		CHOOSE CASE gs_base
			CASE "O","U","M"// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" // Repactacion Cta Mant
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G","V"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	end if
end if
end event

type gb_1 from groupbox within w_listado_contratos_rut
integer x = 2597
integer y = 1388
integer width = 471
integer height = 192
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Utilitarios"
end type

type dw_listado_rut from datawindow within w_listado_contratos_rut
integer x = 32
integer y = 32
integer width = 3045
integer height = 1208
integer taborder = 10
boolean titlebar = true
string title = "Listado de Contratos por Rut"
string dataobject = "d_cont_resultado_busqueda_x_rut"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer protesto,prorrogado,cancelado,reemplazado,sin_proceso,i
string ls_res,ls_opera
IF row > 0 THEN
	il_row4									= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row4, TRUE)
	gs_base 									= This.GetItemString(il_row4, "cadena_codigo")
	gs_serie 									= This.GetItemString(il_row4, "cadena_serie")
	gi_numero 								= This.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 									= This.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta					= this.GetItemNumber(il_row4, "cadena_cod_parque")
	if gs_base='A' or gs_base='L' or gs_base='O' or gs_base='U' then
		cb_9.enabled						= true
		if gs_base='O' then
			cb_10.enabled					= true
			cb_10.visible					= true
		else
			cb_10.visible					= false
		end if
	else
		cb_9.enabled						= false
		cb_10.visible						= false
	end if
//	if gs_base='O' then
//		cb_beneficiarios.enabled		= true
//	elseif gs_base='C' then
//		if gs_digita='1' or gs_depto='I' then 
			cb_beneficiarios.enabled	= true
//		else
//			cb_beneficiarios.enabled	= false
//		end if
//	else
//		cb_beneficiarios.enabled		= false
//	end if
	cb_datos_clientes.enabled 			= TRUE
	cb_datos_contrato.enabled 			= TRUE
	cb_ver_cuenta_corriente.enabled 	= TRUE
	cb_datos_repacta.enabled 			= TRUE
//	cb_mensajes.enabled 					= TRUE
//	OPEN(w_ver_cheques)
//	for i = 1 to w_ver_cheques.dw_d_listado_cuenta_cte_ch.rowcount()
//		ls_res = w_ver_cheques.dw_d_listado_cuenta_cte_ch.getitemstring(i,'documentos_estado_ch')
//		if ls_res = 'P' then
//			protesto ++
//		elseif
//	next
	dw_2.settransobject (sqlca)
	if dw_2.retrieve(gs_serie,gi_numero,gs_base) > 0 then
		for i = 1 to dw_2.rowcount()
			if dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
				protesto ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'D' then
				prorrogado ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'C' then
				cancelado ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
				reemplazado ++
			end if
		next
		if protesto > 0 or prorrogado > 0 or cancelado > 0 or reemplazado > 0 then
			dw_1.visible = true
			dw_1.insertrow(0)
			dw_1.setitem(1,'protesto'   ,protesto)
			dw_1.setitem(1,'prorrogado' ,prorrogado)
			dw_1.setitem(1,'cancelado'  ,cancelado)
			dw_1.setitem(1,'reemplazado',reemplazado)
			dw_1.setitem(1,'sin_proceso',dw_2.rowcount() - reemplazado - cancelado - prorrogado - protesto)
			dw_1.setitem(1,'contrato',gs_serie+'-'+string(gi_numero,'###,###,###,###'))
		end if
	end if
	gs_ventana					= 'w_listado_contratos_rut'
	f_valida_objeto()
	cb_fallecidos.enabled 	= f_fallecido(gs_serie, gi_numero, gs_base) > 0
	cb_mensajes.enabled 		= f_mensajes(gi_rut) = 1
END IF
end event

event doubleclicked;if gs_base='A' or gs_base='L' then
	cb_9.enabled						= true
else
	cb_9.enabled						= false
end if
IF row >0 AND This.DataObject = 'd_cont_resultado_busqueda_x_fallecido' THEN
	gi_llave_f = This.GetItemNumber(row, "fallecidos_llave")
	if isvalid(w_datos_fallecimiento) then close(w_datos_fallecimiento)
	Open(w_datos_fallecimiento)
END IF
end event

event rowfocuschanged;integer protesto,prorrogado,cancelado,reemplazado,sin_proceso,i
string ls_res,ls_opera
IF this.getrow() > 0 THEN
	il_row4									= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row4, TRUE)
	gs_base 									= This.GetItemString(il_row4, "cadena_codigo")
	gs_serie 									= This.GetItemString(il_row4, "cadena_serie")
	gi_numero 								= This.GetItemNumber(il_row4, "cadena_numero")
	gi_rut 									= This.GetItemNumber(il_row4, "cliente_rut")
	gl_cod_parque_cta					= this.GetItemNumber(il_row4, "cadena_cod_parque")
	if gs_base='A' or gs_base='L' or gs_base='O' or gs_base='U' then
		cb_9.enabled						= true
		if gs_base='O' then
			cb_10.enabled					= true
			cb_10.visible					= true
		else
			cb_10.visible					= false
		end if
	else
		cb_9.enabled						= false
		cb_10.visible						= false
	end if
//	if gs_base='O' then
//		cb_beneficiarios.enabled		= true
//	elseif gs_base='C' then
//		if gs_digita='1' or gs_depto='I' then 
			cb_beneficiarios.enabled	= true
//		else
//			cb_beneficiarios.enabled	= false
//		end if
//	else
//		cb_beneficiarios.enabled		= false
//	end if
	cb_datos_clientes.enabled 			= TRUE
	cb_datos_contrato.enabled 			= TRUE
	cb_ver_cuenta_corriente.enabled 	= TRUE
	cb_datos_repacta.enabled 			= TRUE
//	cb_mensajes.enabled 					= TRUE
//	OPEN(w_ver_cheques)
//	for i = 1 to w_ver_cheques.dw_d_listado_cuenta_cte_ch.rowcount()
//		ls_res = w_ver_cheques.dw_d_listado_cuenta_cte_ch.getitemstring(i,'documentos_estado_ch')
//		if ls_res = 'P' then
//			protesto ++
//		elseif
//	next
	dw_2.settransobject (sqlca)
	if dw_2.retrieve(gs_serie,gi_numero,gs_base) > 0 then
		for i = 1 to dw_2.rowcount()
			if dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
				protesto ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'D' then
				prorrogado ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'C' then
				cancelado ++
			elseif dw_2.getitemstring(i,'documentos_estado_ch') = 'P' then
				reemplazado ++
			end if
		next
		if protesto > 0 or prorrogado > 0 or cancelado > 0 or reemplazado > 0 then
			dw_1.visible = true
			dw_1.insertrow(0)
			dw_1.setitem(1,'protesto'   ,protesto)
			dw_1.setitem(1,'prorrogado' ,prorrogado)
			dw_1.setitem(1,'cancelado'  ,cancelado)
			dw_1.setitem(1,'reemplazado',reemplazado)
			dw_1.setitem(1,'sin_proceso',dw_2.rowcount() - reemplazado - cancelado - prorrogado - protesto)
			dw_1.setitem(1,'contrato',gs_serie+'-'+string(gi_numero,'###,###,###,###'))
		end if
	end if
	gs_ventana					= 'w_listado_contratos_rut'
	f_valida_objeto()
	cb_fallecidos.enabled 	= f_fallecido(gs_serie, gi_numero, gs_base) > 0
	cb_mensajes.enabled 	= f_mensajes(gi_rut) = 1
END IF
end event

