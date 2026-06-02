forward
global type w_docto_pendiente_informe from window
end type
type cb_1 from commandbutton within w_docto_pendiente_informe
end type
type rb_i_cierre from radiobutton within w_docto_pendiente_informe
end type
type rb_i_fecha from radiobutton within w_docto_pendiente_informe
end type
type dw_tipo from datawindow within w_docto_pendiente_informe
end type
type dw_periodo from datawindow within w_docto_pendiente_informe
end type
type cb_ordenar from commandbutton within w_docto_pendiente_informe
end type
type cb_limpiar from commandbutton within w_docto_pendiente_informe
end type
type cb_imprimir from commandbutton within w_docto_pendiente_informe
end type
type pb_aceptar from picturebutton within w_docto_pendiente_informe
end type
type cb_cerrar from commandbutton within w_docto_pendiente_informe
end type
type dw_docto_pendiente from datawindow within w_docto_pendiente_informe
end type
type gb_3 from groupbox within w_docto_pendiente_informe
end type
type gb_1 from groupbox within w_docto_pendiente_informe
end type
type gb_estado from groupbox within w_docto_pendiente_informe
end type
type gb_4 from groupbox within w_docto_pendiente_informe
end type
end forward

global type w_docto_pendiente_informe from window
integer width = 3712
integer height = 2512
boolean titlebar = true
string title = "Informes Excepciones por Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_1 cb_1
rb_i_cierre rb_i_cierre
rb_i_fecha rb_i_fecha
dw_tipo dw_tipo
dw_periodo dw_periodo
cb_ordenar cb_ordenar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
dw_docto_pendiente dw_docto_pendiente
gb_3 gb_3
gb_1 gb_1
gb_estado gb_estado
gb_4 gb_4
end type
global w_docto_pendiente_informe w_docto_pendiente_informe

type variables
Long	il_mes,il_ano,il_row
end variables

on w_docto_pendiente_informe.create
this.cb_1=create cb_1
this.rb_i_cierre=create rb_i_cierre
this.rb_i_fecha=create rb_i_fecha
this.dw_tipo=create dw_tipo
this.dw_periodo=create dw_periodo
this.cb_ordenar=create cb_ordenar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_docto_pendiente=create dw_docto_pendiente
this.gb_3=create gb_3
this.gb_1=create gb_1
this.gb_estado=create gb_estado
this.gb_4=create gb_4
this.Control[]={this.cb_1,&
this.rb_i_cierre,&
this.rb_i_fecha,&
this.dw_tipo,&
this.dw_periodo,&
this.cb_ordenar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.pb_aceptar,&
this.cb_cerrar,&
this.dw_docto_pendiente,&
this.gb_3,&
this.gb_1,&
this.gb_estado,&
this.gb_4}
end on

on w_docto_pendiente_informe.destroy
destroy(this.cb_1)
destroy(this.rb_i_cierre)
destroy(this.rb_i_fecha)
destroy(this.dw_tipo)
destroy(this.dw_periodo)
destroy(this.cb_ordenar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_docto_pendiente)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.gb_estado)
destroy(this.gb_4)
end on

event open;	long	ll_new,ll_ano,ll_mes

gf_centrar(w_docto_pendiente_informe)

dw_tipo.dataobject										='dwe_tipo_informe_docto_pend'
dw_tipo.settransobject(sqlca)
dw_tipo.insertrow(0)
													

if gl_proceso>=4 then
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
	if isnull(ll_mes) or ll_mes=0 then ll_mes	=month(date(gdt_fec_sistema))
	if isnull(ll_ano) or ll_ano=0 then ll_ano =year(date(gdt_fec_sistema))
	dw_periodo.dataobject						='dwe_periodo_infor_docto'
	dw_periodo.settransobject(sqlca)
	ll_new											= dw_periodo.insertrow(0)
	dw_periodo.scrolltorow(ll_new)
	dw_periodo.setitem(ll_new,'mes_ini',ll_mes)
	dw_periodo.setitem(ll_new,'anno_ini',ll_ano)
	dw_periodo.setitem(ll_new,'mes_fin',ll_mes)
	dw_periodo.setitem(ll_new,'anno_fin',ll_ano)
	dw_periodo.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso Informe Documentos Pendientes")
	close(w_docto_pendiente_informe)
end if
end event

type cb_1 from commandbutton within w_docto_pendiente_informe
integer x = 37
integer y = 2260
integer width = 279
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Detalle"
end type

event clicked;long	ll_mes_ini,ll_ano_ini,ll_mes_fin,ll_ano_fin,ll_tipo
string	ls_periodo,ls_string

ll_tipo															= dw_tipo.getitemnumber(1,'tipo_infor')
ll_mes_ini													= dw_periodo.getitemnumber(1,'mes_ini')
ll_ano_ini													= dw_periodo.getitemnumber(1,'anno_ini')
ll_mes_fin													= dw_periodo.getitemnumber(1,'mes_fin')
ll_ano_fin													= dw_periodo.getitemnumber(1,'anno_fin')
if rb_i_fecha.checked=true then
	ls_periodo												= 'F'
elseif rb_i_cierre.checked=true then
	ls_periodo												= 'C'
end if

if not isnull(ll_tipo) and ll_tipo>0 and not isnull(ll_mes_ini) and ll_mes_ini>0 and not isnull(ll_ano_ini) and ll_ano_ini>0 and not isnull(ll_mes_fin) and ll_mes_fin>0 and not isnull(ll_ano_fin) and ll_ano_fin>0 then
	ls_string													= string(ll_tipo)+'~t'+string(ll_mes_ini)+'~t'+string(ll_ano_ini)+'~t'+string(ll_mes_fin)+'~t'+string(ll_ano_fin)+'~t'+ls_periodo
	OpenWithParm(w_docto_pendiente_infor_detalle, ls_string)
end if
end event

type rb_i_cierre from radiobutton within w_docto_pendiente_informe
integer x = 1033
integer y = 160
integer width = 466
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Al Cierre Período"
end type

event clicked;dw_docto_pendiente.reset()
end event

type rb_i_fecha from radiobutton within w_docto_pendiente_informe
integer x = 1033
integer y = 84
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "A la Fecha"
boolean checked = true
end type

event clicked;dw_docto_pendiente.reset()
end event

type dw_tipo from datawindow within w_docto_pendiente_informe
integer x = 69
integer y = 60
integer width = 891
integer height = 176
integer taborder = 70
string title = "none"
string dataobject = "dwe_tipo_informe_docto_pend"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long	ll_tipo

dw_docto_pendiente.reset()
dw_tipo.accepttext()
ll_tipo									= dw_tipo.getitemnumber(1,'tipo_infor')
if ll_tipo=4 then
	gb_estado.enabled			= true
	rb_i_fecha.enabled			= true
	rb_i_cierre.enabled			= true
else
	gb_estado.enabled			= false
	rb_i_fecha.enabled			= false
	rb_i_cierre.enabled			= false
end if

end event

type dw_periodo from datawindow within w_docto_pendiente_informe
integer x = 1545
integer y = 60
integer width = 1883
integer height = 164
integer taborder = 70
string title = "none"
string dataobject = "dwe_periodo_infor_docto"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_docto_pendiente.reset()
end event

type cb_ordenar from commandbutton within w_docto_pendiente_informe
integer x = 1335
integer y = 2260
integer width = 261
integer height = 88
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

type cb_limpiar from commandbutton within w_docto_pendiente_informe
integer x = 1979
integer y = 2260
integer width = 261
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_docto_pendiente_informe.triggerevent(open!)
end event

type cb_imprimir from commandbutton within w_docto_pendiente_informe
event ue_mousemove pbm_mousemove
integer x = 1595
integer y = 2260
integer width = 261
integer height = 88
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
//	f_printdlg(dw_docto_pendiente,gstr_print,parent)
end if
end event

type pb_aceptar from picturebutton within w_docto_pendiente_informe
integer x = 3470
integer y = 120
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
alignment htextalign = left!
end type

event clicked;long	ll_tipo,ll_tot_reg,ll_mes_ini,ll_ano_ini,ll_mes_fin,ll_ano_fin,ll_dias
datetime	ldt_fec_ini,ldt_fec_fin

dw_docto_pendiente.reset()
//
//dw_docto_pendiente.object.titulo2_t.text			= 'Documentos Pendientes Cierre ventas Finalizado Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')
dw_tipo.accepttext()
dw_periodo.accepttext()
ll_tipo															= dw_tipo.getitemnumber(1,'tipo_infor')
ll_mes_ini													= dw_periodo.getitemnumber(1,'mes_ini')
ll_ano_ini													= dw_periodo.getitemnumber(1,'anno_ini')
ll_mes_fin													= dw_periodo.getitemnumber(1,'mes_fin')
ll_ano_fin													= dw_periodo.getitemnumber(1,'anno_fin')
if not isnull(ll_tipo) and ll_tipo>0 and not isnull(ll_mes_ini) and ll_mes_ini>0 and not isnull(ll_ano_ini) and ll_ano_ini>0 and not isnull(ll_mes_fin) and ll_mes_fin>0 and not isnull(ll_ano_fin) and ll_ano_fin>0 then
	ldt_fec_ini												= f_fecha_fin(ll_mes_ini,ll_ano_ini)
	ldt_fec_fin												= f_fecha_fin(ll_mes_fin,ll_ano_fin)
	if ldt_fec_ini>ldt_fec_fin then
		messagebox("Advertencia","Período Inicial No Puede Ser Mayor al Período Final")
	else
		ll_dias												= DaysAfter(date(ldt_fec_ini), date(ldt_fec_fin))
		if ll_dias>=123 then
			messagebox("Advertencia",'Perído Ingresado No Puede Ser Mayor a 4 Meses~r~n'+&
												'             Formato Informe. ',information!)
		else
			if ll_tipo=1 then
				dw_docto_pendiente.dataobject			='dw_informe_docto_pendiente'
			elseif ll_tipo=2 then
				dw_docto_pendiente.dataobject			='dw_informe_docto_pendiente_tipo'
			elseif ll_tipo=3 then
				dw_docto_pendiente.dataobject			='dw_informe_docto_pendiente_detalle'
			elseif ll_tipo=4 then
				if rb_i_fecha.checked=true then
					dw_docto_pendiente.dataobject		='dw_informe_docto_pend_estado_ent'
				elseif rb_i_cierre.checked=true then
					dw_docto_pendiente.dataobject		='dw_informe_docto_pend_estado_ent_cierre'
				end if
			elseif ll_tipo=5 then
				dw_docto_pendiente.dataobject			='dw_informe_excepcion_x_ctto'
			end if
			dw_docto_pendiente.settransobject(sqlca)
			ll_tot_reg											= dw_docto_pendiente.retrieve(ll_mes_ini,ll_ano_ini,ll_mes_fin,ll_ano_fin)
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Datos")
			else
				dw_docto_pendiente.object.usuario.text	= gs_user
			end if
		end if
	end if
else
	if isnull(ll_tipo) or ll_tipo=0 then
		messagebox("Advertencia", "Debe Ingresar Tipo Informe")
		dw_tipo.setfocus()
		dw_tipo.setcolumn('tipo_infor')
	elseif isnull(ll_mes_ini) or ll_mes_ini=0 then
		messagebox("Advertencia", "Debe Ingresar Mes Inicio Informe")
		dw_periodo.setfocus()
		dw_periodo.setcolumn('mes_ini')
	elseif isnull(ll_ano_ini) or ll_ano_ini=0 then
		messagebox("Advertencia", "Debe Ingresar Año Inicio Informe")
		dw_periodo.setfocus()
		dw_periodo.setcolumn('anno_ini')
	elseif isnull(ll_mes_fin) or ll_mes_fin=0 then
		messagebox("Advertencia", "Debe Ingresar Mes Término Informe")
		dw_periodo.setfocus()
		dw_periodo.setcolumn('mes_fin')
	elseif isnull(ll_ano_fin) or ll_ano_fin=0 then
		messagebox("Advertencia", "Debe Ingresar Año Término Informe")
		dw_periodo.setfocus()
		dw_periodo.setcolumn('anno_fin')		
	end if
end if
end event

type cb_cerrar from commandbutton within w_docto_pendiente_informe
integer x = 3378
integer y = 2260
integer width = 279
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_docto_pendiente_informe)
end event

type dw_docto_pendiente from datawindow within w_docto_pendiente_informe
integer x = 37
integer y = 284
integer width = 3621
integer height = 1944
integer taborder = 70
string title = "none"
string dataobject = "dw_informe_docto_pend_estado_ent_cierre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//if row>0 then
//	il_row	= row
//	This.SelectRow(0, false)
//	This.SelectRow(il_row, true)
//end if
//
//this.accepttext()
//
//close(w_cuenta_corriente_oferta)
//close(w_cuenta_corriente_liberador)
//
end event

event doubleclicked;//if dw_docto_pendiente.RowCount() > 0 then
//	cb_cta_cte.triggerevent(clicked!)
//end if
//
end event

event rowfocuschanged;//long	ll_estado
//
//if getrow()>0 then
//	il_row	= getrow()
//	This.SelectRow(0, FALSE)
//	This.SelectRow(il_row, TRUE)
//	if il_row>0 then
//		ll_estado							= dw_docto_pendiente.getitemnumber(il_row,'cd_folio_ult_estado')
//		if ll_estado=11 then
//			cb_cta_cte.enabled		= true			
//		else
//			cb_cta_cte.enabled		= false			
//		end if
//	end if
//end if
end event

type gb_3 from groupbox within w_docto_pendiente_informe
integer x = 1317
integer y = 2216
integer width = 946
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

type gb_1 from groupbox within w_docto_pendiente_informe
integer x = 1531
integer y = 8
integer width = 1915
integer height = 244
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Períodos"
end type

type gb_estado from groupbox within w_docto_pendiente_informe
integer x = 1015
integer y = 8
integer width = 494
integer height = 244
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Estado Entrega"
end type

type gb_4 from groupbox within w_docto_pendiente_informe
integer x = 37
integer y = 8
integer width = 951
integer height = 244
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

