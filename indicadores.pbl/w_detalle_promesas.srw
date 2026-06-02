forward
global type w_detalle_promesas from window
end type
type cb_1 from commandbutton within w_detalle_promesas
end type
type cb_2 from commandbutton within w_detalle_promesas
end type
type cb_exportar from commandbutton within w_detalle_promesas
end type
type dw_muestra from datawindow within w_detalle_promesas
end type
type cb_cerrar from commandbutton within w_detalle_promesas
end type
end forward

global type w_detalle_promesas from window
integer width = 2921
integer height = 1604
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
cb_1 cb_1
cb_2 cb_2
cb_exportar cb_exportar
dw_muestra dw_muestra
cb_cerrar cb_cerrar
end type
global w_detalle_promesas w_detalle_promesas

type variables
datawindow	dw_paso
end variables

event open;String	ls_opcion, ls_string
long	ll_year, ll_count
date 	ld_fec_ini, ld_fec_fin
SetPointer(HourGlass!)
this.x 							= ( gl_width - this.width)/2
this.y 							= ( gl_height - this.height)/2
ls_opcion	= mid(Message.StringParm,1,1)
ll_year		= long(mid(Message.StringParm,2,4))
this.title	= 'Detalle Promesas Año '+string(ll_year)
ld_fec_ini	= date("01/01/"+string(ll_year))
if year(gd_fec_ran_fin)=ll_year then
	ld_fec_fin	= gd_fec_ran_fin
else
	ld_fec_fin	= date("31/12/"+string(ll_year))
end if
dw_muestra.settransobject(sqlca)
if dw_muestra.retrieve(ld_fec_ini,ld_fec_fin,gs_est_cons,gi_parque_select)=0 then
	messagebox("Advertencia","No registra datos")
	close(w_detalle_promesas)
else
	if ls_opcion = 'V' then
		if gl_cuo_digitada_desde = 0 and gl_cuo_digitada_hasta = 0 then
			ls_string	= 'cuotas_mora = 0'
		else
			if gl_cuo_digitada_desde > 0 and gl_cuo_digitada_hasta = 0 then
				ls_string	= 'cuotas_mora >= '+string(gl_cuo_digitada_desde)
			else		
				if gl_cuo_digitada_desde = 0 and gl_cuo_digitada_hasta > 0 then
					ls_string	= 'cuotas_mora <= '+string(gl_cuo_digitada_hasta)
				else
					if gl_cuo_digitada_desde >= 0 and gl_cuo_digitada_hasta >= gl_cuo_digitada_desde then
						ls_string	= 'cuotas_mora >= '+string(gl_cuo_digitada_desde)+' and cuotas_mora <= '+string(gl_cuo_digitada_hasta)
					end if
				end if
			end if
		end if
		dw_muestra.SetFilter(ls_string)
		dw_muestra.Filter( )
		if dw_muestra.rowcount() = 0 then
			messagebox("Advertencia","No registra dato")
			close(w_detalle_promesas)
		end if
	end if
end if
SetPointer(Arrow!)
end event

on w_detalle_promesas.create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_exportar=create cb_exportar
this.dw_muestra=create dw_muestra
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_1,&
this.cb_2,&
this.cb_exportar,&
this.dw_muestra,&
this.cb_cerrar}
end on

on w_detalle_promesas.destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_exportar)
destroy(this.dw_muestra)
destroy(this.cb_cerrar)
end on

type cb_1 from commandbutton within w_detalle_promesas
integer x = 41
integer y = 1368
integer width = 306
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_muestra.rowcount() > 0 then f_Print( dw_muestra )

end event

type cb_2 from commandbutton within w_detalle_promesas
integer x = 352
integer y = 1368
integer width = 306
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;String Orden
if dw_muestra.rowcount() > 0 then
	dw_paso = dw_muestra
	setnull(Orden)
	dw_paso.SetSort(Orden)
	dw_paso.Sort()
end if
end event

type cb_exportar from commandbutton within w_detalle_promesas
integer x = 663
integer y = 1368
integer width = 306
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_muestra.rowcount() > 0 then
	dw_paso = dw_muestra
	f_DWToExcel( dw_paso )
end if
end event

type dw_muestra from datawindow within w_detalle_promesas
integer x = 41
integer y = 44
integer width = 2816
integer height = 1276
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_clientes_promesas_segun_renta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	this.scrolltorow(row)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	this.scrolltorow(this.getrow())
end if
end event

event doubleclicked;gi_numero 			= dw_muestra.getitemnumber(dw_muestra.getrow(),'cadena_numero')
gi_rut				= dw_muestra.getitemnumber(dw_muestra.getrow(),'cadena_rut')
gi_tipo_busqueda 	= 8
gs_base				= 'O'
Open(w_listado_contratos)



end event

event retrieverow;String	ls_estado
long 		ll_cuo_mora,ld_cta_pag,ll_cuota_mora
datetime ldt_fec_prim

ldt_fec_prim	= this.getitemdatetime(row,'pago_oferta_fecha_prim')
ld_cta_pag		= this.getitemnumber(row,'oferta_v_cta_pag_s')
ll_cuota_mora	= this.getitemnumber(row,'pago_oferta_nro_cuotas')
ls_estado		= this.getitemstring(row,'cadena_estado')
ll_cuo_mora		= funcion_mora(ldt_fec_prim,ld_cta_pag,ll_cuota_mora,ls_estado)
this.setitem(row,'cuotas_mora',ll_cuo_mora)
end event

type cb_cerrar from commandbutton within w_detalle_promesas
integer x = 2528
integer y = 1368
integer width = 329
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

