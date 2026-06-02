forward
global type w_detalle_ventas from window
end type
type cb_todos from statictext within w_detalle_ventas
end type
type cb_reprog from statictext within w_detalle_ventas
end type
type cb_res_res from statictext within w_detalle_ventas
end type
type cb_vgte_mora from statictext within w_detalle_ventas
end type
type cb_vgte_vsp_mora from statictext within w_detalle_ventas
end type
type cb_can_vgte_dia from statictext within w_detalle_ventas
end type
type pb_filtrar from picturebutton within w_detalle_ventas
end type
type pb_ordenar from picturebutton within w_detalle_ventas
end type
type pb_imprimir from picturebutton within w_detalle_ventas
end type
type pb_exportar from picturebutton within w_detalle_ventas
end type
type pb_cerrar from picturebutton within w_detalle_ventas
end type
type dw_detalle from datawindow within w_detalle_ventas
end type
end forward

global type w_detalle_ventas from window
integer width = 3442
integer height = 1908
boolean titlebar = true
string title = "Detalle de Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_todos cb_todos
cb_reprog cb_reprog
cb_res_res cb_res_res
cb_vgte_mora cb_vgte_mora
cb_vgte_vsp_mora cb_vgte_vsp_mora
cb_can_vgte_dia cb_can_vgte_dia
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_cerrar pb_cerrar
dw_detalle dw_detalle
end type
global w_detalle_ventas w_detalle_ventas

on w_detalle_ventas.create
this.cb_todos=create cb_todos
this.cb_reprog=create cb_reprog
this.cb_res_res=create cb_res_res
this.cb_vgte_mora=create cb_vgte_mora
this.cb_vgte_vsp_mora=create cb_vgte_vsp_mora
this.cb_can_vgte_dia=create cb_can_vgte_dia
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_cerrar=create pb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_todos,&
this.cb_reprog,&
this.cb_res_res,&
this.cb_vgte_mora,&
this.cb_vgte_vsp_mora,&
this.cb_can_vgte_dia,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_cerrar,&
this.dw_detalle}
end on

on w_detalle_ventas.destroy
destroy(this.cb_todos)
destroy(this.cb_reprog)
destroy(this.cb_res_res)
destroy(this.cb_vgte_mora)
destroy(this.cb_vgte_vsp_mora)
destroy(this.cb_can_vgte_dia)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_cerrar)
destroy(this.dw_detalle)
end on

event open;Datetime	ldt_fec_ini, ldt_fec_fin
String	ls_codigo, ls_opcion, ls_fec_ini, ls_fec_fin
Long		ll_rut, ll_mes_ini,ll_anno_ini, ll_mes_fin, ll_anno_fin,ll_per_ini,ll_per_fin
gf_centrar(w_detalle_ventas)
ls_codigo	= substr(1,1,Message.StringParm)
ldt_fec_ini	= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
ldt_fec_fin	= datetime(date(substr(1,3,Message.StringParm)),time('00:00:00'))
ls_opcion	= substr(1,4,Message.StringParm)
CHOOSE CASE ls_opcion
	CASE '1'
		dw_detalle.dataobject	= 'dw_muestra_detalle_ventas_por_agente'
		dw_detalle.settransobject(sqlca)		
		if dw_detalle.retrieve(ldt_fec_ini, ldt_fec_fin,ls_codigo)=0 then
			messagebox("Advertencia","No registra dato")
			close(w_detalle_ventas)
		else
			cb_can_vgte_dia.visible		= true
			cb_vgte_vsp_mora.visible	= true
			cb_vgte_mora.visible			= true
			cb_res_res.visible				= true
			cb_reprog.visible				= true
			cb_todos.visible				= true
			dw_detalle.object.t_filtro.text	= ''
			if gs_conexion = "Parque El Prado" then
				dw_detalle.object.t_titulo.text	= 'El Prado / Manantial / Santiago'
			elseif gs_conexion = "Parque La Foresta" then
				dw_detalle.object.t_titulo.text	= 'El Foresta'
			elseif gs_conexion = "Parque Concepción" then
				dw_detalle.object.t_titulo.text	= 'Concepción'
			end if
		end if		
		
	CASE '2'
		dw_detalle.dataobject	= 'dw_detalle_remuneracion'
		dw_detalle.settransobject(sqlca)		
		ll_mes_ini	= long(mid(substr(1,2,Message.StringParm),4,2))
		ll_anno_ini	= long(mid(substr(1,2,Message.StringParm),7,4))
		ll_mes_fin	= long(mid(substr(1,3,Message.StringParm),4,2))
		ll_anno_fin	= long(mid(substr(1,3,Message.StringParm),7,4))
		cb_can_vgte_dia.visible		= false
		cb_vgte_vsp_mora.visible	= false
		cb_vgte_mora.visible			= false
		cb_res_res.visible			= false
		cb_reprog.visible				= false
		cb_todos.visible				= false
		if len(string(ll_mes_ini))=2 then
			ll_per_ini	= long(string(ll_anno_ini)+string(ll_mes_ini))	
		elseif len(string(ll_mes_ini))=1 then
			ll_per_ini	= long(string(ll_anno_ini)+'0'+string(ll_mes_ini))	
		end if
		if len(string(ll_mes_fin))=2 then
			ll_per_fin	= long(string(ll_anno_fin)+string(ll_mes_fin))	
		elseif len(string(ll_mes_fin))=1 then
			ll_per_fin	= long(string(ll_anno_fin)+'0'+string(ll_mes_fin))	
		end if
		
		SELECT	"AGENTES"."RUT"  
		INTO 		:ll_rut  
		FROM 		"AGENTES"  
		WHERE 	"AGENTES"."COD_AGE" = :ls_codigo   
		Using		sqlca ;
		if sqlca.sqlcode=0 then
			if dw_detalle.retrieve(ll_rut,ll_per_ini,ll_per_fin)=0 then
				messagebox("Advertencia","No registra dato")
				close(w_detalle_ventas)
			else
				if gs_conexion	= "Parque El Prado" then
					dw_detalle.object.t_titulo.text	= 'El Prado / Manantial / Santiago'
				elseif gs_conexion	= "Parque La Foresta" then
					dw_detalle.object.t_titulo.text	= 'El Foresta'
				elseif gs_conexion	= "Parque Concepción" then
					dw_detalle.object.t_titulo.text	= 'Concepción'
				end if
			end if		
		else
			messagebox("Advertencia","Rut Agente: "+string(ll_rut,'###,###,###,###') +'  No registra dato en Tabla Remuneración')
			close(w_detalle_ventas)
		end if
END CHOOSE
gs_ventana	= 'w_detalle_ventas'
f_valida_objeto_1()
end event

type cb_todos from statictext within w_detalle_ventas
integer x = 2382
integer y = 1728
integer width = 571
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar Todo"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;String	ls_filtro
cb_can_vgte_dia.textcolor	= rgb(0,0,0)
cb_vgte_vsp_mora.textcolor	= rgb(0,0,0)
cb_vgte_mora.textcolor		= rgb(0,0,0)
cb_res_res.textcolor			= rgb(0,0,0)
cb_reprog.textcolor			= rgb(0,0,0)
cb_todos.textcolor			= rgb(255,0,0)
ls_filtro						= ""
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
dw_detalle.sort()
dw_detalle.scrolltorow(1)
if dw_detalle.rowcount()=0 then messagebox("Advertencia","No registra datos")
dw_detalle.object.t_filtro.text	= ''

end event

type cb_reprog from statictext within w_detalle_ventas
integer x = 1614
integer y = 1728
integer width = 677
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Reprogramadas"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;String	ls_filtro
cb_can_vgte_dia.textcolor	= rgb(0,0,0)
cb_vgte_vsp_mora.textcolor	= rgb(0,0,0)
cb_vgte_mora.textcolor		= rgb(0,0,0)
cb_res_res.textcolor			= rgb(0,0,0)
cb_reprog.textcolor			= rgb(255,0,0)
cb_todos.textcolor			= rgb(0,0,0)
ls_filtro						= ""
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
ls_filtro						= "cadena_estado='P'"
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
dw_detalle.sort()
dw_detalle.scrolltorow(1)
dw_detalle.object.t_filtro.text	= 'Promesas Reprogramadas'
if dw_detalle.rowcount()=0 then messagebox("Advertencia","No registra Promesas Reprogramadas")

end event

type cb_res_res from statictext within w_detalle_ventas
integer x = 859
integer y = 1728
integer width = 681
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Resciliadas / Resueltas"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;String	ls_filtro
cb_can_vgte_dia.textcolor	= rgb(0,0,0)
cb_vgte_vsp_mora.textcolor	= rgb(0,0,0)
cb_vgte_mora.textcolor		= rgb(0,0,0)
cb_res_res.textcolor			= rgb(255,0,0)
cb_reprog.textcolor			= rgb(0,0,0)
cb_todos.textcolor			= rgb(0,0,0)
ls_filtro						= ""
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
ls_filtro						= "cadena_estado='R' or cadena_estado='N'"
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
dw_detalle.sort()
dw_detalle.scrolltorow(1)
dw_detalle.object.t_filtro.text	= 'Promesas Resciliadas / Resueltas'
if dw_detalle.rowcount()=0 then messagebox("Advertencia","No registra Promesas Resciliadas / Resueltas")

end event

type cb_vgte_mora from statictext within w_detalle_ventas
integer x = 2382
integer y = 1640
integer width = 571
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Vgtes. >= 2 Moras"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;String	ls_filtro
cb_can_vgte_dia.textcolor	= rgb(0,0,0)
cb_vgte_vsp_mora.textcolor	= rgb(0,0,0)
cb_vgte_mora.textcolor		= rgb(255,0,0)
cb_res_res.textcolor			= rgb(0,0,0)
cb_reprog.textcolor			= rgb(0,0,0)
cb_todos.textcolor			= rgb(0,0,0)
ls_filtro						= ""
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
ls_filtro						= "cadena_estado='V' and funcion_mora>=2 and oferta_v_cta_pag_s>0"
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
dw_detalle.sort()
dw_detalle.scrolltorow(1)
dw_detalle.object.t_filtro.text	= 'Promesas Vigentes >= 2 Moras'
if dw_detalle.rowcount()=0 then messagebox("Advertencia","No registra Promesas Vigentes >= 2 Moras")

end event

type cb_vgte_vsp_mora from statictext within w_detalle_ventas
integer x = 1614
integer y = 1640
integer width = 677
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Vgtes. VSP"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;String	ls_filtro
cb_can_vgte_dia.textcolor	= rgb(0,0,0)
cb_vgte_vsp_mora.textcolor	= rgb(255,0,0)
cb_vgte_mora.textcolor		= rgb(0,0,0)
cb_res_res.textcolor			= rgb(0,0,0)
cb_reprog.textcolor			= rgb(0,0,0)
cb_todos.textcolor			= rgb(0,0,0)
ls_filtro						= ""
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
ls_filtro						= "(cadena_estado='V' and funcion_mora>=2 and oferta_v_cta_pag_s=0)"
// or (cadena_estado='V' and funcion_mora=2 and pago_oferta_pie=0 and oferta_v_cta_pag_s=1)
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
dw_detalle.sort()
dw_detalle.scrolltorow(1)
dw_detalle.object.t_filtro.text	= 'Promesas Vigentes VSP'
if dw_detalle.rowcount()=0 then messagebox("Advertencia","No registra Promesas Vigentes VSP")

end event

type cb_can_vgte_dia from statictext within w_detalle_ventas
integer x = 859
integer y = 1640
integer width = 681
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 67108864
string text = "Cancel. / Vgtes. al día"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;String	ls_filtro
cb_can_vgte_dia.textcolor			= rgb(255,0,0)
cb_vgte_vsp_mora.textcolor			= rgb(0,0,0)
cb_vgte_mora.textcolor				= rgb(0,0,0)
cb_res_res.textcolor					= rgb(0,0,0)
cb_reprog.textcolor					= rgb(0,0,0)
cb_todos.textcolor					= rgb(0,0,0)
ls_filtro								= ""
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
ls_filtro								= "(cadena_estado='V' or cadena_estado='C') and funcion_mora<2"
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
dw_detalle.sort()
dw_detalle.scrolltorow(1)
dw_detalle.object.t_filtro.text	= 'Promesas Canceladas / Vgtes. al día'
if dw_detalle.rowcount()=0 then messagebox("Advertencia","No registra Promesas Canceladas / Vgtes. al día")

end event

type pb_filtrar from picturebutton within w_detalle_ventas
event ue_mousemove pbm_mousemove
integer x = 553
integer y = 1640
integer width = 169
integer height = 148
integer taborder = 50
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
dw_detalle.SETfilter(NULO)
dw_detalle.filter()
if dw_detalle.dataobject='' then
	dw_detalle.object.t_filtro.text	= 'dw_muestra_detalle_ventas_por_agente'
end if
end event

type pb_ordenar from picturebutton within w_detalle_ventas
event ue_mousemove pbm_mousemove
integer x = 379
integer y = 1640
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type pb_imprimir from picturebutton within w_detalle_ventas
event ue_mousemove pbm_mousemove
integer x = 206
integer y = 1640
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;if dw_detalle.rowcount() > 0 then 
	dw_detalle.object.datawindow.print.Preview = true
	f_Print( dw_detalle )
	dw_detalle.object.datawindow.print.Preview = false	
end if
end event

type pb_exportar from picturebutton within w_detalle_ventas
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1640
integer width = 169
integer height = 148
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_cerrar from picturebutton within w_detalle_ventas
integer x = 3218
integer y = 1640
integer width = 169
integer height = 148
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_detalle_ventas)
end event

type dw_detalle from datawindow within w_detalle_ventas
integer x = 32
integer y = 36
integer width = 3355
integer height = 1568
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_remuneracion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string tipo
string esta
if dw_detalle.dataobject = 'dw_muestra_detalle_ventas_por_agente' then
	gi_numero = dw_detalle.getitemnumber(dw_detalle.getrow(),'cadena_numero')
	gi_tipo_busqueda = 8
	Open(w_listado_contratos)
end if
end event

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if


end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if

end event

