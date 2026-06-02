forward
global type w_comprobante_anticipo from window
end type
type cb_filtrar from commandbutton within w_comprobante_anticipo
end type
type cb_imprimir_resumen from commandbutton within w_comprobante_anticipo
end type
type dw_resumen from datawindow within w_comprobante_anticipo
end type
type dw_archivo from datawindow within w_comprobante_anticipo
end type
type cb_exporta from commandbutton within w_comprobante_anticipo
end type
type rb_todos from radiobutton within w_comprobante_anticipo
end type
type dw_codigo from datawindow within w_comprobante_anticipo
end type
type sle_1 from uo_convierte_numero within w_comprobante_anticipo
end type
type sle_2 from u_sle_rut within w_comprobante_anticipo
end type
type cb_imprimir from commandbutton within w_comprobante_anticipo
end type
type dw_lista from datawindow within w_comprobante_anticipo
end type
type cb_cerrar from commandbutton within w_comprobante_anticipo
end type
end forward

global type w_comprobante_anticipo from window
integer width = 3118
integer height = 1896
boolean titlebar = true
string title = "Comprobante de Anticipo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_filtrar cb_filtrar
cb_imprimir_resumen cb_imprimir_resumen
dw_resumen dw_resumen
dw_archivo dw_archivo
cb_exporta cb_exporta
rb_todos rb_todos
dw_codigo dw_codigo
sle_1 sle_1
sle_2 sle_2
cb_imprimir cb_imprimir
dw_lista dw_lista
cb_cerrar cb_cerrar
end type
global w_comprobante_anticipo w_comprobante_anticipo

type variables
Long	il_mes,il_ano,il_row
end variables

on w_comprobante_anticipo.create
this.cb_filtrar=create cb_filtrar
this.cb_imprimir_resumen=create cb_imprimir_resumen
this.dw_resumen=create dw_resumen
this.dw_archivo=create dw_archivo
this.cb_exporta=create cb_exporta
this.rb_todos=create rb_todos
this.dw_codigo=create dw_codigo
this.sle_1=create sle_1
this.sle_2=create sle_2
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_filtrar,&
this.cb_imprimir_resumen,&
this.dw_resumen,&
this.dw_archivo,&
this.cb_exporta,&
this.rb_todos,&
this.dw_codigo,&
this.sle_1,&
this.sle_2,&
this.cb_imprimir,&
this.dw_lista,&
this.cb_cerrar}
end on

on w_comprobante_anticipo.destroy
destroy(this.cb_filtrar)
destroy(this.cb_imprimir_resumen)
destroy(this.dw_resumen)
destroy(this.dw_archivo)
destroy(this.cb_exporta)
destroy(this.rb_todos)
destroy(this.dw_codigo)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
end on

event open;string		ls_cantidad,ls_mes_liq,ls_fecha_liq,ls_codigo,ls_nombre
long		ll_tot_reg,ll_indi,ll_pago_total,ll_mes,ll_ano,ll_mes_liq,ll_ano_liq,&
			ll_rut,ll_orden,ll_new
datetime	ldt_fecha_cierre

gf_centrar(w_comprobante_anticipo)
dw_lista.dataobject						= 'dw_comprobante_anticipo'
dw_lista.settransobject(sqlca)

dw_archivo.dataobject					= 'dwe_archivo_exp'
dw_archivo.settransobject(sqlca)

dw_resumen.dataobject					= 'dw_comprobante_resumen'
dw_resumen.settransobject(sqlca)

ldt_fecha_cierre							= datetime((date(substr(1,1,Message.StringParm))),time('00:00:00'))
gl_cod_parque								= long(substr(1,2,Message.StringParm))
gdt_fecha_res								= ldt_fecha_cierre

dw_codigo.getchild('codigo',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(ldt_fecha_cierre,gl_cod_parque)=0 then
	idw_detalle.insertrow(0)
end if
dw_codigo.insertrow(0)
ll_tot_reg									= dw_lista.retrieve(ldt_fecha_cierre,gl_cod_parque)
if ll_tot_reg > 0 then
	for ll_indi = 1 to ll_tot_reg
		ll_orden								= dw_lista.getitemnumber(ll_indi,'c_orden')
		ls_nombre							= dw_lista.getitemstring(ll_indi,'c_nombre')
		ls_codigo							= dw_lista.getitemstring(ll_indi,'res_comi_cod_age_sup')
		ll_pago_total						= dw_lista.getitemnumber(ll_indi,'res_comi_total_pago')
		ll_rut 								= dw_lista.getitemnumber(ll_indi,'agentes_rut')
		
		ll_new								= dw_resumen.insertrow(0)
		dw_resumen.scrolltorow(ll_new)
		dw_resumen.setitem(ll_new,"cod_parque",gl_cod_parque)
		dw_resumen.setitem(ll_new,"fecha_cierre",ldt_fecha_cierre)
		dw_resumen.setitem(ll_new,"orden",ll_orden)
		dw_resumen.setitem(ll_new,"codigo",ls_codigo)
		dw_resumen.setitem(ll_new,"rut",ll_rut)
		dw_resumen.setitem(ll_new,"nombre",ls_nombre)
		dw_resumen.setitem(ll_new,"monto",ll_pago_total)
		dw_resumen.accepttext()

		
		ls_cantidad 						= sle_1.uo_convertir_numero(string(ll_pago_total))
		dw_lista.setitem(ll_indi,'c_cantidad',Upper(ls_cantidad))
		ll_mes								= month(date(ldt_fecha_cierre))
		ll_ano								= year(date(ldt_fecha_cierre))
		if ll_mes>=7 then
			ll_mes_liq						= ll_mes - 6
			ll_ano_liq						= ll_ano + 1
		else
			ll_mes_liq						= ll_mes + 6
			ll_ano_liq						= ll_ano
		end if
		CHOOSE CASE ll_mes_liq
			CASE 1
				ls_mes_liq 					= 'Enero'
			CASE 2
				ls_mes_liq 					= 'Febrero'
			CASE 3
				ls_mes_liq 					= 'Marzo'
			CASE 4
				ls_mes_liq 					= 'Abril'
			CASE 5
				ls_mes_liq 					= 'Mayo'
			CASE 6
				ls_mes_liq 					= 'Junio'
			CASE 7
				ls_mes_liq 					= 'Julio'
			CASE 8
				ls_mes_liq 					= 'Agosto'
			CASE 9
				ls_mes_liq 					= 'Septiembre'
			CASE 10
				ls_mes_liq 					= 'Octubre'
			CASE 11
				ls_mes_liq 					= 'Noviembre'
			CASE 12
				ls_mes_liq 					= 'Diciembre'
		END CHOOSE
		ls_fecha_liq						= ls_mes_liq+' de '+string(ll_ano_liq)
		dw_lista.setitem(ll_indi,'c_mes_liq',ls_fecha_liq)
		if not isnull(ll_rut) then
			dw_lista.setitem(ll_indi,'c_dv',+' - '+sle_2.calcula_dv(string(ll_rut)))
		end if
	next
	dw_lista.accepttext()
	dw_lista.setsort("c_orden A,res_comi_total_pago D,res_comi_cod_age_sup A")
	dw_lista.sort()
	dw_lista.accepttext()
end if
end event

type cb_filtrar from commandbutton within w_comprobante_anticipo
integer x = 3241
integer y = 996
integer width = 238
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
dw_resumen.SETfilter(NULO)
dw_resumen.filter()
end event

type cb_imprimir_resumen from commandbutton within w_comprobante_anticipo
integer x = 1774
integer y = 1664
integer width = 549
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir &Resumen"
end type

event clicked;string	ls_filtro
long		ll_res_a,ll_res_s,ll_res_j

dw_resumen.accepttext()
if dw_resumen.rowcount() > 0 then
	
	ll_res_j			= MessageBox("Advertencia", 'Desea Imprimir Resumen por Jefe de Ventas', Exclamation!, YesNo!, 2)
	if ll_res_j = 1 then
		ls_filtro 									= "orden = 1 "
		dw_resumen.SetFilter(ls_filtro)
		dw_resumen.Filter( )
		if dw_resumen.rowcount() = 0 then
			messagebox("Advertencia","No Registra Pago Premio")
		else
			dw_resumen.accepttext()
			dw_resumen.setsort("monto D,codigo A")
			dw_resumen.sort()
			dw_resumen.accepttext()
			f_Print( dw_resumen )
		end if
	end if
	
	ll_res_s			= MessageBox("Advertencia", 'Desea Imprimir Resumen por Supervisor', Exclamation!, YesNo!, 2)
	if ll_res_s = 1 then
		ls_filtro 									= "orden = 2 "
		dw_resumen.SetFilter(ls_filtro)
		dw_resumen.Filter( )
		if dw_resumen.rowcount() = 0 then
			messagebox("Advertencia","No Registra Pago Premio")
		else
			dw_resumen.accepttext()
			dw_resumen.setsort("monto D,codigo A")
			dw_resumen.sort()
			dw_resumen.accepttext()
			f_Print( dw_resumen )
		end if
	end if
	
	ll_res_a			= MessageBox("Advertencia", 'Desea Imprimir Resumen por Agente', Exclamation!, YesNo!, 2)
	if ll_res_a = 1 then
		ls_filtro 									= "orden = 3 "
		dw_resumen.SetFilter(ls_filtro)
		dw_resumen.Filter( )
		if dw_resumen.rowcount() = 0 then
			messagebox("Advertencia","No Registra Pago Premio")
		else
			dw_resumen.accepttext()
			dw_resumen.setsort("monto D,codigo A")
			dw_resumen.sort()
			dw_resumen.accepttext()
			f_Print( dw_resumen )
		end if
	end if
end if

end event

type dw_resumen from datawindow within w_comprobante_anticipo
integer x = 3150
integer y = 128
integer width = 315
integer height = 276
integer taborder = 30
string title = "none"
string dataobject = "dw_comprobante_resumen"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_archivo from datawindow within w_comprobante_anticipo
boolean visible = false
integer x = 3154
integer y = 444
integer width = 411
integer height = 432
integer taborder = 20
string title = "none"
string dataobject = "dwe_archivo_exp"
boolean livescroll = true
end type

type cb_exporta from commandbutton within w_comprobante_anticipo
integer x = 1221
integer y = 1664
integer width = 549
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar Archivo"
end type

event clicked;integer	li_FileNum
string	ls_fecha,ls_haber,ls_nombre_arch,ls_nombre,ls_rut_exp,&
			ls_pago_exp,ls_string,ls_parque
long		ll_tot_reg,ll_res,ll_rut,ll_orden,ll_rut_cta,ll_pago_cta,ll_new,ll_indi
datetime	ldt_fecha
double	ldb_monto

ll_tot_reg							= dw_lista.rowcount()
if ll_tot_reg>0 then	
	if gl_cod_parque=1 then
		ls_parque					= 'PRADO'
	elseif gl_cod_parque=102 then
		ls_parque					= 'MANANTIAL'
	elseif gl_cod_parque=103 then
		ls_parque					= 'SANTIAGO'
	elseif gl_cod_parque=104 then
		ls_parque					= 'MEMORIAL_PARK'
	elseif gl_cod_parque=101 then
		ls_parque					= 'CANAAN'	
	elseif gl_cod_parque=11 then
		ls_parque					= 'FORESTA'	
	end if
	ls_fecha							= string(gdt_fecha_res,'dd/mm/yyyy')
	ls_haber							= 'H'
	ls_nombre_arch 				= '01_'+ls_parque+'_ANTICIPO_PREMIO_PRODUCCION_080'+'_'+mid(ls_fecha,1,2)+mid(ls_fecha,4,2)+mid(ls_fecha,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\Archivo\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then	
		for ll_indi = 1 to ll_tot_reg
			ll_rut 						= dw_lista.getitemnumber(ll_indi,'agentes_rut')
			ls_nombre				= dw_lista.getitemstring(ll_indi,'c_nombre')
			ldb_monto				= dw_lista.getitemnumber(ll_indi,'res_comi_total_pago')
			if not isnull(ll_rut) and ll_rut>0 and not isnull(ls_nombre) and ls_nombre<>'' then
				ll_rut_cta				= len(String(ll_rut))
				ls_rut_exp			= fill('0',10 - ll_rut_cta)+trim(string(ll_rut))
				ll_pago_cta			= len(string(round(ldb_monto,0)))
				ls_pago_exp			= fill(' ',12 - ll_pago_cta)+trim(string(round(ldb_monto,0)))
				ls_nombre			= string(ls_nombre)+fill(' ',(60 - len(string(ls_nombre))))
				ls_string 				= ls_rut_exp+ls_nombre+ls_pago_exp
				ll_new				= dw_archivo.insertrow(0)
				dw_archivo.scrolltorow(ll_new)
				dw_archivo.setitem(ll_new,"linea",ls_string)
			end if
		next
		dw_archivo.SaveAs( "C:\Archivo\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	end if
else 
	messagebox(gs_app_name,'No existen datos a traspasar; '+ls_parque+'_PREMIO_PRODUCCION',stopsign!)
end if	

end event

type rb_todos from radiobutton within w_comprobante_anticipo
integer x = 1495
integer y = 32
integer width = 293
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;string	ls_filtro

dw_codigo.reset()
dw_codigo.settransobject(sqlca)
dw_codigo.getchild('codigo',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(gdt_fecha_res,gl_cod_parque)=0 then
	idw_detalle.insertrow(0)
end if
dw_codigo.insertrow(0)

ls_filtro 									= ''
dw_lista.SetFilter(ls_filtro)
dw_lista.Filter( )	
end event

type dw_codigo from datawindow within w_comprobante_anticipo
integer x = 23
integer y = 24
integer width = 1408
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dwe_age_sup_res_comi"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_codigo,ls_filtro

dw_codigo.accepttext()
ls_codigo									= dw_codigo.getitemstring(1,'codigo')
ls_filtro 									= "res_comi_cod_age_sup = '"+ls_codigo+"'"
dw_lista.SetFilter(ls_filtro)
dw_lista.Filter( )	
dw_codigo.accepttext()
end event

event clicked;rb_todos.checked						= false
cb_imprimir_resumen.enabled		= false
end event

type sle_1 from uo_convierte_numero within w_comprobante_anticipo
boolean visible = false
integer x = 46
integer y = 1868
integer width = 494
integer height = 84
integer taborder = 30
boolean hideselection = false
end type

type sle_2 from u_sle_rut within w_comprobante_anticipo
boolean visible = false
integer x = 46
integer y = 1780
integer width = 494
integer taborder = 20
borderstyle borderstyle = stylebox!
end type

type cb_imprimir from commandbutton within w_comprobante_anticipo
integer x = 667
integer y = 1664
integer width = 549
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Comprobante"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type dw_lista from datawindow within w_comprobante_anticipo
integer x = 37
integer y = 124
integer width = 3008
integer height = 1504
integer taborder = 10
string title = "none"
string dataobject = "dw_comprobante_anticipo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_comprobante_anticipo
integer x = 2752
integer y = 1664
integer width = 297
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comprobante_anticipo)
end event

