forward
global type w_comision_compartida from window
end type
type cb_infor_atc from commandbutton within w_comision_compartida
end type
type rb_nuevas from radiobutton within w_comision_compartida
end type
type rb_cierre from radiobutton within w_comision_compartida
end type
type cb_asig_comision from commandbutton within w_comision_compartida
end type
type rb_todas from radiobutton within w_comision_compartida
end type
type rb_funer from radiobutton within w_comision_compartida
end type
type em_ctto from editmask within w_comision_compartida
end type
type pb_buscar from picturebutton within w_comision_compartida
end type
type st_promesa from statictext within w_comision_compartida
end type
type rb_ugn from radiobutton within w_comision_compartida
end type
type cb_limpiar from commandbutton within w_comision_compartida
end type
type pb_aceptar from picturebutton within w_comision_compartida
end type
type cb_cerrar from commandbutton within w_comision_compartida
end type
type cb_imprimir from commandbutton within w_comision_compartida
end type
type dw_lista from datawindow within w_comision_compartida
end type
type dw_fecha_cierre from datawindow within w_comision_compartida
end type
type gb_2 from groupbox within w_comision_compartida
end type
type gb_3 from groupbox within w_comision_compartida
end type
end forward

global type w_comision_compartida from window
integer width = 3488
integer height = 2228
boolean titlebar = true
string title = "Comisiones Compartidas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_infor_atc cb_infor_atc
rb_nuevas rb_nuevas
rb_cierre rb_cierre
cb_asig_comision cb_asig_comision
rb_todas rb_todas
rb_funer rb_funer
em_ctto em_ctto
pb_buscar pb_buscar
st_promesa st_promesa
rb_ugn rb_ugn
cb_limpiar cb_limpiar
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
dw_lista dw_lista
dw_fecha_cierre dw_fecha_cierre
gb_2 gb_2
gb_3 gb_3
end type
global w_comision_compartida w_comision_compartida

type variables
string	is_opcion,is_base,is_serie,is_orig_venta,MenuHabilitado
long 		il_row,il_sw_pasa=0
end variables

on w_comision_compartida.create
this.cb_infor_atc=create cb_infor_atc
this.rb_nuevas=create rb_nuevas
this.rb_cierre=create rb_cierre
this.cb_asig_comision=create cb_asig_comision
this.rb_todas=create rb_todas
this.rb_funer=create rb_funer
this.em_ctto=create em_ctto
this.pb_buscar=create pb_buscar
this.st_promesa=create st_promesa
this.rb_ugn=create rb_ugn
this.cb_limpiar=create cb_limpiar
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.dw_fecha_cierre=create dw_fecha_cierre
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_infor_atc,&
this.rb_nuevas,&
this.rb_cierre,&
this.cb_asig_comision,&
this.rb_todas,&
this.rb_funer,&
this.em_ctto,&
this.pb_buscar,&
this.st_promesa,&
this.rb_ugn,&
this.cb_limpiar,&
this.pb_aceptar,&
this.cb_cerrar,&
this.cb_imprimir,&
this.dw_lista,&
this.dw_fecha_cierre,&
this.gb_2,&
this.gb_3}
end on

on w_comision_compartida.destroy
destroy(this.cb_infor_atc)
destroy(this.rb_nuevas)
destroy(this.rb_cierre)
destroy(this.cb_asig_comision)
destroy(this.rb_todas)
destroy(this.rb_funer)
destroy(this.em_ctto)
destroy(this.pb_buscar)
destroy(this.st_promesa)
destroy(this.rb_ugn)
destroy(this.cb_limpiar)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.dw_fecha_cierre)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_tot_reg

connect using Trans_1;
gf_centrar(w_comision_compartida)

if gl_proceso>=3 then
	if gs_depto = 'X' then
		cb_infor_atc.visible									= false
	end if
	dw_fecha_cierre.settransobject(sqlca)
	dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve(datetime(date(string('01/01/2010'))))=0 then
		idw_detalle3.insertrow(0)
	end if
	dw_fecha_cierre.insertrow(0)
	dw_lista.settransobject(sqlca)
else
	messagebox("Advertencia","Usuario No Autorizado Para Generar Comisión Compartida")
	close(w_comision_compartida)
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_infor_atc from commandbutton within w_comision_compartida
integer x = 850
integer y = 1988
integer width = 613
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "In&forme Atención Cliente"
end type

event clicked;string	ls_string
long		ll_tot_reg
datetime	ldt_fecha_fin

if dw_lista.RowCount()>0 then
	if dw_fecha_cierre.visible = true then
		ldt_fecha_fin							= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
	else
		ldt_fecha_fin							= gdt_fec_sistema
	end if
	ls_string									= string(ldt_fecha_fin,'dd/mm/yyyy')
	if isvalid(w_atencion_cliente_informe) then close(w_atencion_cliente_informe)
	OpenWithParm (w_atencion_cliente_informe,ls_string)
end if
end event

type rb_nuevas from radiobutton within w_comision_compartida
integer x = 1879
integer y = 76
integer width = 475
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Promesa Nuevas"
end type

event clicked;dw_lista.reset()
dw_fecha_cierre.visible		= false
end event

type rb_cierre from radiobutton within w_comision_compartida
integer x = 1362
integer y = 76
integer width = 503
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Cierre Ventas"
boolean checked = true
end type

event clicked;dw_lista.reset()
dw_fecha_cierre.visible		= true
end event

type cb_asig_comision from commandbutton within w_comision_compartida
integer x = 37
integer y = 1988
integer width = 503
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asignar Comisión"
end type

event clicked;string		ls_base,ls_serie,ls_orig_venta,ls_string,ls_estado_comi,ls_estado_contr,ls_tipo_info
double	ldb_numero

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ls_base							= dw_lista.getitemstring(il_row,'cadena_codigo')
	ls_serie							= dw_lista.getitemstring(il_row,'oferta_v_serie')
	ldb_numero						= dw_lista.getitemnumber(il_row,'oferta_v_nro_oferta')
	ls_estado_contr				= dw_lista.getitemstring(il_row,'cadena_estado')
	ls_orig_venta					= dw_lista.getitemstring(il_row,'oferta_v_tipo_venta')
	ls_estado_comi					= dw_lista.getitemstring(il_row,'oferta_v_estado_comi')
	ls_tipo_info						= 'L'
	if ls_orig_venta='3' or ls_orig_venta= 'C' or ls_orig_venta= 'U' or ls_orig_venta= 'E' or ls_orig_venta= '6' then
		ls_orig_venta				= ls_orig_venta		
	else
		ls_orig_venta				= '5'
	end if
	if ls_estado_contr='V' or ls_estado_contr='C' then
		if ls_orig_venta = '5' or ls_orig_venta = '3' or ls_orig_venta = 'C' or ls_orig_venta = 'U'  or ls_orig_venta= 'E' or ls_orig_venta= '6' then
			if (ls_orig_venta = '5' and (gs_depto='P' or gs_depto='I'  or gs_depto='Z' or gs_depto='2')) or ((ls_orig_venta = '3' or ls_orig_venta = 'C' or ls_orig_venta = 'U' or ls_orig_venta = 'E' or ls_orig_venta= '6') and (gs_depto='X' or gs_depto='I' or gs_depto='Z' or gs_depto='2'   )) then
				if ls_estado_comi<>'P' then
					if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
						ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+ls_orig_venta+'~t'+ls_tipo_info
						if isvalid(w_comision_comp_asignacion) then close(w_comision_comp_asignacion)
							OpenWithParm (w_comision_comp_asignacion,ls_string)
					end if
				else
					messagebox("Advertencia",'"Estado Comisión Pagada" No Genera Comisión Compartida')
				end if
			else
				messagebox("Advertencia",'"Usuario No Autorizado a Generar Comisión Compartida')
			end if
		else
			messagebox("Advertencia","Origen de Ventas No Corresponde Comisión Compartida")
		end if
	else
		messagebox("Advertencia","Estado Contrato No Genera Comisión Compartida")
	end if
end if
end event

type rb_todas from radiobutton within w_comision_compartida
integer x = 78
integer y = 76
integer width = 242
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todas"
boolean checked = true
end type

event clicked;string	ls_filtro

ls_filtro				= ""
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()

end event

type rb_funer from radiobutton within w_comision_compartida
integer x = 773
integer y = 76
integer width = 489
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ventas Funeraria"
end type

event clicked;string	ls_filtro

ls_filtro				= "oferta_v_tipo_venta = '5'"
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()

end event

type em_ctto from editmask within w_comision_compartida
integer x = 2606
integer y = 1988
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if double(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_comision_compartida
integer x = 2953
integer y = 1988
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string	ls_string
double	ldb_numero

ldb_numero						= double(em_ctto.text)
ll_tot_reg						= dw_lista.rowcount()
st_promesa.text 				= 'Nº Promesa'
if dw_lista.rowcount() > 0 then
	ls_string					= "oferta_v_nro_oferta = "+string(ldb_numero)
end if
if ldb_numero>0 and ll_tot_reg>0 then
	ll_fila 						= dw_lista.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.SelectRow(ll_fila, true)
	else
		messagebox("Advertencia","Nº Contrato No Existe en Lista")
		dw_lista.scrolltorow(1)
	end if
end if
end event

type st_promesa from statictext within w_comision_compartida
integer x = 2286
integer y = 2004
integer width = 311
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Promesa"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_ugn from radiobutton within w_comision_compartida
integer x = 347
integer y = 76
integer width = 411
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ventas U.G.N"
end type

event clicked;string	ls_filtro

ls_filtro				= "(oferta_v_tipo_venta = '3' or oferta_v_tipo_venta = '6' or oferta_v_tipo_venta = 'C' or oferta_v_tipo_venta = 'E' or oferta_v_tipo_venta = 'U' )"
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()

end event

type cb_limpiar from commandbutton within w_comision_compartida
integer x = 1467
integer y = 1988
integer width = 274
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_comision_compartida.triggerevent(open!)
end event

type pb_aceptar from picturebutton within w_comision_compartida
integer x = 3273
integer y = 44
integer width = 128
integer height = 116
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_base,ls_serie,ls_filtro,ls_nulo,ls_cod_age_2,ls_cod_age_3  
long		ll_tot_reg,ll_indi,ll_cta
datetime	ldt_fecha_cierre
double	ldb_numero

setnull(ls_nulo)
dw_lista.reset()
dw_fecha_cierre.accepttext()
ldt_fecha_cierre												= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')

if rb_cierre.checked=true then
	if not isnull(ldt_fecha_cierre) then
		dw_lista.dataobject									= 'dw_comision_compar_cierre'
		dw_lista.settransobject(sqlca)
		ll_tot_reg												= dw_lista.retrieve(ldt_fecha_cierre)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos")
		else
			for ll_indi=1 to ll_tot_reg
				ls_base											= dw_lista.getitemstring(ll_indi,'cadena_codigo')
				ls_serie											= dw_lista.getitemstring(ll_indi,'oferta_v_serie')
				ldb_numero										= dw_lista.getitemnumber(ll_indi,'oferta_v_nro_oferta')
				SELECT	count("BASE"),	"COD_AGE_2","COD_AGE_3"  
    				INTO		:ll_cta,	:ls_cod_age_2,	:ls_cod_age_3  
    				FROM		"COMISION_COMPARTIDA"  
				WHERE 	( "COMISION_COMPARTIDA"."BASE" = :ls_base ) AND  
							( "COMISION_COMPARTIDA"."SERIE" = :ls_serie ) AND  
							( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero ) AND  
							( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
				GROUP BY	"COD_AGE_2","COD_AGE_3" 			
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ll_cta) and ll_cta>0 then
						dw_lista.setitem(ll_indi,'c_marca',1)
						dw_lista.setitem(ll_indi,'c_age_2',ls_cod_age_2)
						dw_lista.setitem(ll_indi,'c_age_3',ls_cod_age_3)
					else
						dw_lista.setitem(ll_indi,'c_marca',0)
						dw_lista.setitem(ll_indi,'c_age_2',ls_nulo)
						dw_lista.setitem(ll_indi,'c_age_3',ls_nulo)
					end if
				end if
			next
			dw_lista.accepttext()
			if rb_todas.checked								= true then
				rb_todas.triggerevent(clicked!)
			elseif rb_ugn.checked								= true then
				rb_ugn.triggerevent(clicked!)
			elseif rb_funer.checked							= true then
				rb_funer.triggerevent(clicked!)
			end if
		end if
	else
		if isnull(ldt_fecha_cierre) then
			messagebox("Advertencia", "Debe Ingresar Fecha Cierre ventas")
			dw_fecha_cierre.setfocus()
			dw_fecha_cierre.setcolumn('cierre_ventas')
		end if
	end if
elseif rb_nuevas.checked=true then
	dw_lista.dataobject									= 'dw_comision_compar_nueva'
	dw_lista.settransobject(sqlca)
	ll_tot_reg												= dw_lista.retrieve()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Datos")
	else
		for ll_indi=1 to ll_tot_reg
			ls_base											= dw_lista.getitemstring(ll_indi,'cadena_codigo')
			ls_serie											= dw_lista.getitemstring(ll_indi,'oferta_v_serie')
			ldb_numero										= dw_lista.getitemnumber(ll_indi,'oferta_v_nro_oferta')
			SELECT	count("BASE"),	"COD_AGE_2","COD_AGE_3"  
   			INTO		:ll_cta,	:ls_cod_age_2,	:ls_cod_age_3  
    			FROM		"COMISION_COMPARTIDA"  
			WHERE 	( "COMISION_COMPARTIDA"."BASE" = :ls_base ) AND  
						( "COMISION_COMPARTIDA"."SERIE" = :ls_serie ) AND  
						( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero ) AND  
						( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
			GROUP BY	"COD_AGE_2","COD_AGE_3" 			
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ll_cta) and ll_cta>0 then
					dw_lista.setitem(ll_indi,'c_marca',1)
					dw_lista.setitem(ll_indi,'c_age_2',ls_cod_age_2)
					dw_lista.setitem(ll_indi,'c_age_3',ls_cod_age_3)
				else
					dw_lista.setitem(ll_indi,'c_marca',0)
					dw_lista.setitem(ll_indi,'c_age_2',ls_nulo)
					dw_lista.setitem(ll_indi,'c_age_3',ls_nulo)
				end if
			end if
		next
		dw_lista.accepttext()
		if rb_todas.checked								= true then
			rb_todas.triggerevent(clicked!)
		elseif rb_ugn.checked								= true then
			rb_ugn.triggerevent(clicked!)
		elseif rb_funer.checked							= true then
			rb_funer.triggerevent(clicked!)
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_comision_compartida
integer x = 3141
integer y = 1988
integer width = 297
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_compartida)
end event

type cb_imprimir from commandbutton within w_comision_compartida
integer x = 1746
integer y = 1988
integer width = 274
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() >0 then 
	f_Print( dw_lista )
end if
end event

type dw_lista from datawindow within w_comision_compartida
integer x = 37
integer y = 204
integer width = 3401
integer height = 1756
integer taborder = 40
string title = "none"
string dataobject = "dw_comision_compar_cierre"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rbuttondown;if dw_lista.rowcount() > 0 and il_row > 0 then
	gs_base													= this.getitemstring(il_row,'cadena_codigo')
	gs_serie													= this.getitemstring(il_row,'oferta_v_serie')
	gi_numero												= this.getitemnumber(il_row,'oferta_v_nro_oferta')

	m_comision_comp_popup Menu
	Menu 														= Create m_comision_comp_popup
	Menu.m_popup.m_cuentacorriente.Visible			= (Mid(MenuHabilitado, 1, 1) = "0")
	Menu.m_popup.m_pagosventas.Visible 				= (Mid(MenuHabilitado, 2, 1) = "0")
	Menu.m_popup.m_ordenar.Visible 					= (Mid(MenuHabilitado, 3, 1) = "0")
	Menu.m_popup.m_filtrar.Visible 					= (Mid(MenuHabilitado, 4, 1) = "0")
	Menu.m_popup.m_exportar.Visible 					= (Mid(MenuHabilitado, 5, 1) = "0")
	Menu.m_popup.PopMenu(This.X + PointerX(), This.Y + PointerY()-20)
end if

end event

event constructor;MenuHabilitado	= '00000'
end event

type dw_fecha_cierre from datawindow within w_comision_compartida
integer x = 2418
integer y = 76
integer width = 841
integer height = 96
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type gb_2 from groupbox within w_comision_compartida
integer x = 37
integer y = 8
integer width = 1257
integer height = 164
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Origen Ventas"
end type

type gb_3 from groupbox within w_comision_compartida
integer x = 1317
integer y = 8
integer width = 1074
integer height = 164
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Promesa"
end type

