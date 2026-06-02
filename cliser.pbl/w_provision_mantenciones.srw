forward
global type w_provision_mantenciones from window
end type
type cb_detalle from commandbutton within w_provision_mantenciones
end type
type cb_exportar from commandbutton within w_provision_mantenciones
end type
type cb_impirmir from commandbutton within w_provision_mantenciones
end type
type cb_limpiar from commandbutton within w_provision_mantenciones
end type
type rb_100 from radiobutton within w_provision_mantenciones
end type
type rb_mayor_15 from radiobutton within w_provision_mantenciones
end type
type rb_menor_15 from radiobutton within w_provision_mantenciones
end type
type rb_contratos from radiobutton within w_provision_mantenciones
end type
type rb_promesas from radiobutton within w_provision_mantenciones
end type
type rb_si_falle from radiobutton within w_provision_mantenciones
end type
type dw_fech_cierre from datawindow within w_provision_mantenciones
end type
type dw_parque from datawindow within w_provision_mantenciones
end type
type cb_1 from commandbutton within w_provision_mantenciones
end type
type pb_aceptar from picturebutton within w_provision_mantenciones
end type
type dw_lista from datawindow within w_provision_mantenciones
end type
type gb_1 from groupbox within w_provision_mantenciones
end type
type gb_2 from groupbox within w_provision_mantenciones
end type
type gb_3 from groupbox within w_provision_mantenciones
end type
type rb_no_falle from radiobutton within w_provision_mantenciones
end type
type dw_porce from datawindow within w_provision_mantenciones
end type
type dw_escala from datawindow within w_provision_mantenciones
end type
end forward

global type w_provision_mantenciones from window
integer width = 2853
integer height = 2036
boolean titlebar = true
string title = "Provision Mantenciones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_detalle cb_detalle
cb_exportar cb_exportar
cb_impirmir cb_impirmir
cb_limpiar cb_limpiar
rb_100 rb_100
rb_mayor_15 rb_mayor_15
rb_menor_15 rb_menor_15
rb_contratos rb_contratos
rb_promesas rb_promesas
rb_si_falle rb_si_falle
dw_fech_cierre dw_fech_cierre
dw_parque dw_parque
cb_1 cb_1
pb_aceptar pb_aceptar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
rb_no_falle rb_no_falle
dw_porce dw_porce
dw_escala dw_escala
end type
global w_provision_mantenciones w_provision_mantenciones

type variables
long il_parque
string is_tipo_ctto,is_titulo
end variables

on w_provision_mantenciones.create
this.cb_detalle=create cb_detalle
this.cb_exportar=create cb_exportar
this.cb_impirmir=create cb_impirmir
this.cb_limpiar=create cb_limpiar
this.rb_100=create rb_100
this.rb_mayor_15=create rb_mayor_15
this.rb_menor_15=create rb_menor_15
this.rb_contratos=create rb_contratos
this.rb_promesas=create rb_promesas
this.rb_si_falle=create rb_si_falle
this.dw_fech_cierre=create dw_fech_cierre
this.dw_parque=create dw_parque
this.cb_1=create cb_1
this.pb_aceptar=create pb_aceptar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.rb_no_falle=create rb_no_falle
this.dw_porce=create dw_porce
this.dw_escala=create dw_escala
this.Control[]={this.cb_detalle,&
this.cb_exportar,&
this.cb_impirmir,&
this.cb_limpiar,&
this.rb_100,&
this.rb_mayor_15,&
this.rb_menor_15,&
this.rb_contratos,&
this.rb_promesas,&
this.rb_si_falle,&
this.dw_fech_cierre,&
this.dw_parque,&
this.cb_1,&
this.pb_aceptar,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.rb_no_falle,&
this.dw_porce,&
this.dw_escala}
end on

on w_provision_mantenciones.destroy
destroy(this.cb_detalle)
destroy(this.cb_exportar)
destroy(this.cb_impirmir)
destroy(this.cb_limpiar)
destroy(this.rb_100)
destroy(this.rb_mayor_15)
destroy(this.rb_menor_15)
destroy(this.rb_contratos)
destroy(this.rb_promesas)
destroy(this.rb_si_falle)
destroy(this.dw_fech_cierre)
destroy(this.dw_parque)
destroy(this.cb_1)
destroy(this.pb_aceptar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.rb_no_falle)
destroy(this.dw_porce)
destroy(this.dw_escala)
end on

event open;gf_centrar(w_provision_mantenciones)
Connect Using Trans_1;
Connect Using Trans_2;
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
//dw_porce.settransobject(sqlca)
//dw_porce.insertrow(0)
setnull(il_parque)
dw_escala.getchild('cod_sup',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('O','w_provision_mantenciones')=0 then
	idw_detalle.insertrow(0)
end if
dw_escala.insertrow(0)

dw_porce.getchild('escala',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve(1,'O')=0 then
	idw_detalle2.insertrow(0)
end if
dw_porce.insertrow(0)

dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
rb_promesas.triggerevent(clicked!)
dw_fech_cierre.settransobject(sqlca)
dw_fech_cierre.insertrow(0)

end event

event close;disconnect Using Trans_1;
disconnect Using Trans_2;
end event

type cb_detalle from commandbutton within w_provision_mantenciones
integer x = 709
integer y = 1812
integer width = 311
integer height = 112
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Detalle"
end type

event clicked;string	ls_string,ls_base
date	ld_fech_cierre
long	ll_porce_ini,ll_porce_fin,ll_cod_parque,ll_escala,ll_falle,ll_escala_porce

if rb_promesas.checked = true then
	ls_base = 'O'
elseif rb_contratos.checked = true then
	ls_base = 'C'
elseif rb_promesas.checked = false and 	rb_contratos.checked = false then
	messagebox("Advertencia","Debe Seleccionar Tipo de Contrato")
	rb_promesas.setfocus()
end if	
ll_cod_parque			= dw_parque.getitemnumber(1,'parque')
if isnull(ll_cod_parque) or ll_cod_parque = 0 then
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_parque.setfocus()
else
	ld_fech_cierre	= dw_fech_cierre.getitemdate(1,'fec_cierre')
	ll_escala_porce		= long(trim(dw_porce.getitemstring(1,'escala')))
	if isnull(ld_fech_cierre) or ld_fech_cierre = date('00/00/0000') then
		messagebox("Advertencia","Debe Seleccionar Fecha de Cierre")
		dw_fech_cierre.setfocus()
	else
		ll_escala			= dw_escala.getitemnumber(1,'cod_escala')
		if isnull(ll_escala) or ll_escala = 0 then
			messagebox("Advertencia","Debe Seleccionar Escala")
			dw_escala.setfocus()
		elseif isnull(ll_escala_porce) or ll_escala_porce = 0 then
			messagebox("Advertencia","Debe Seleccionar Porcentaje")
			dw_escala.setfocus()
		else
			SELECT 	"PROVISION_MANTENCIONES_ESCALA"."RANGO_DESDE","PROVISION_MANTENCIONES_ESCALA"."RANGO_HASTA"  
			INTO 		:ll_porce_ini,:ll_porce_fin  
			FROM 	"PROVISION_MANTENCIONES_ESCALA"  
			WHERE 	"PROVISION_MANTENCIONES_ESCALA"."PARQUE" = :il_parque AND  
						"PROVISION_MANTENCIONES_ESCALA"."TIPO_CTTO" = :ls_base AND  
						"PROVISION_MANTENCIONES_ESCALA"."ESCALA" = :ll_escala_porce
			USING sqlca;			
			if rb_no_falle.checked	= true then
				ll_falle	= 0	
			elseif 	rb_si_falle.checked = true then
				ll_falle	= 1
			end if	
		end if
	end if
end if
ls_string			= string(ld_fech_cierre)+'~t'+string(ll_cod_parque)+'~t'+ls_base+'~t'+string(ll_porce_ini)+'~t'+string(ll_porce_fin)+'~t'+string(ll_falle)+'~t'+is_titulo
if not isnull(ld_fech_cierre) and not isnull(ll_cod_parque) and not isnull(ls_base) then
	if isvalid(w_detalle_provision) then close(w_detalle_provision)
	openwithparm(w_detalle_provision,ls_string)
else
	messagebox("Advertencia","Debe Selecionar Datos")
end if
end event

type cb_exportar from commandbutton within w_provision_mantenciones
integer x = 370
integer y = 1812
integer width = 311
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_impirmir from commandbutton within w_provision_mantenciones
integer x = 32
integer y = 1812
integer width = 311
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Impirmir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type cb_limpiar from commandbutton within w_provision_mantenciones
integer x = 1253
integer y = 1812
integer width = 311
integer height = 112
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;setnull(il_parque)
dw_parque.reset()
dw_fech_cierre.reset()
dw_lista.reset()
dw_escala.reset()
dw_porce.reset()
dw_parque.insertrow(0)
dw_fech_cierre.insertrow(0)
dw_escala.insertrow(0)
dw_porce.insertrow(0)
rb_promesas.checked		= true
rb_no_falle.checked		= true
rb_menor_15.visible		= true
rb_menor_15.checked	= true
dw_lista.object.t_titulo.text = ''
dw_lista.object.t_empresa.text = ''
end event

type rb_100 from radiobutton within w_provision_mantenciones
integer x = 3730
integer y = 436
integer width = 210
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "100%"
end type

event clicked;dw_lista.reset()
dw_lista.object.t_titulo.text = ''
dw_lista.object.t_empresa.text = ''
end event

type rb_mayor_15 from radiobutton within w_provision_mantenciones
integer x = 3378
integer y = 436
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mayor 15%"
end type

event clicked;dw_lista.reset()
dw_lista.object.t_titulo.text = ''
dw_lista.object.t_empresa.text = ''
end event

type rb_menor_15 from radiobutton within w_provision_mantenciones
integer x = 3013
integer y = 436
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Menor 15%"
boolean checked = true
end type

event clicked;dw_lista.reset()
dw_lista.object.t_titulo.text = ''
dw_lista.object.t_empresa.text = ''
end event

type rb_contratos from radiobutton within w_provision_mantenciones
integer x = 841
integer y = 188
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contrato"
end type

event clicked;long ll_indi

setnull(il_parque)
dw_lista.reset()
dw_porce.reset()
dw_porce.insertrow(0)
dw_escala.reset()
dw_escala.insertrow(0)
dw_lista.object.t_titulo.text = ''
dw_lista.object.t_empresa.text = ''
ll_indi				= dw_parque.getrow()
il_parque			= dw_parque.getitemnumber(ll_indi,'parque')
dw_parque.accepttext()
dw_porce.accepttext()
if rb_promesas.checked = true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	is_tipo_ctto				= 'O'
	dw_porce.getchild('escala',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	dw_parque.accepttext()
	if idw_detalle.retrieve(is_tipo_ctto,'w_provision_mantenciones')=0 then
	end if
	if idw_detalle2.retrieve(il_parque,is_tipo_ctto)=0 then
	end if
elseif rb_contratos.checked= true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	is_tipo_ctto				= 'C'
	dw_porce.getchild('escala',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	dw_parque.accepttext()
	if idw_detalle.retrieve(is_tipo_ctto,'w_provision_mantenciones')=0 then
	end if
	if idw_detalle2.retrieve(il_parque,is_tipo_ctto)=0 then
	end if
end if

end event

type rb_promesas from radiobutton within w_provision_mantenciones
integer x = 841
integer y = 100
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Promesa"
boolean checked = true
end type

event clicked;long ll_indi

setnull(il_parque)
dw_lista.reset()
dw_porce.reset()
dw_porce.insertrow(0)
dw_escala.reset()
dw_escala.insertrow(0)
dw_lista.object.t_titulo.text = ''
dw_lista.object.t_empresa.text = ''
ll_indi				= dw_parque.getrow()
il_parque			= dw_parque.getitemnumber(ll_indi,'parque')
dw_parque.accepttext()
dw_porce.accepttext()
if rb_promesas.checked = true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	is_tipo_ctto				= 'O'
	dw_porce.getchild('escala',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	dw_parque.accepttext()
	if idw_detalle.retrieve(is_tipo_ctto,'w_provision_mantenciones')=0 then
	end if
	if idw_detalle2.retrieve(il_parque,is_tipo_ctto)=0 then
	end if
elseif rb_contratos.checked= true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	is_tipo_ctto				= 'C'
	dw_porce.getchild('escala',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	dw_parque.accepttext()
	if idw_detalle.retrieve(is_tipo_ctto,'w_provision_mantenciones')=0 then
	end if
	if idw_detalle2.retrieve(il_parque,is_tipo_ctto)=0 then
	end if
end if

end event

type rb_si_falle from radiobutton within w_provision_mantenciones
integer x = 1266
integer y = 184
integer width = 169
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Si"
end type

event clicked;dw_lista.reset()
dw_lista.object.t_titulo.text = ''
dw_lista.object.t_empresa.text = ''
end event

type dw_fech_cierre from datawindow within w_provision_mantenciones
integer x = 37
integer y = 188
integer width = 773
integer height = 96
integer taborder = 20
string title = "none"
string dataobject = "dwe_fec_cierre"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
dw_lista.object.t_titulo.text = ''
dw_lista.object.t_empresa.text = ''
end event

type dw_parque from datawindow within w_provision_mantenciones
integer x = 37
integer y = 88
integer width = 773
integer height = 96
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_parque_costos_ventas"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long ll_indi

setnull(il_parque)
dw_lista.reset()
dw_porce.reset()
dw_porce.insertrow(0)
dw_escala.reset()
dw_escala.insertrow(0)
dw_lista.object.t_titulo.text = ''
dw_lista.object.t_empresa.text = ''
ll_indi				= dw_parque.getrow()
il_parque			= dw_parque.getitemnumber(ll_indi,'parque')
dw_parque.accepttext()
dw_porce.accepttext()
if rb_promesas.checked = true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	is_tipo_ctto				= 'O'
	dw_porce.getchild('escala',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	dw_parque.accepttext()
	if idw_detalle.retrieve(is_tipo_ctto,'w_provision_mantenciones')=0 then
	end if
	if idw_detalle2.retrieve(il_parque,is_tipo_ctto)=0 then
	end if
elseif rb_contratos.checked= true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	is_tipo_ctto				= 'C'
	dw_porce.getchild('escala',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	dw_parque.accepttext()
	if idw_detalle.retrieve(is_tipo_ctto,'w_provision_mantenciones')=0 then
	end if
	if idw_detalle2.retrieve(il_parque,is_tipo_ctto)=0 then
	end if
end if

end event

event losefocus;long ll_indi

setnull(il_parque)
dw_lista.object.t_empresa.text = ''
ll_indi				= dw_parque.getrow()
il_parque			= dw_parque.getitemnumber(ll_indi,'parque')
dw_porce.reset()
dw_porce.insertrow(0)
dw_escala.reset()
dw_escala.insertrow(0)
dw_parque.accepttext()
dw_porce.accepttext()
if rb_promesas.checked = true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	is_tipo_ctto				= 'O'
	dw_porce.getchild('escala',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	dw_parque.accepttext()
	if idw_detalle.retrieve(is_tipo_ctto,'w_provision_mantenciones')=0 then
	end if
	if idw_detalle2.retrieve(il_parque,is_tipo_ctto)=0 then
	end if
elseif rb_contratos.checked= true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	is_tipo_ctto				= 'C'
	dw_porce.getchild('escala',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	dw_parque.accepttext()
	if idw_detalle.retrieve(is_tipo_ctto,'w_provision_mantenciones')=0 then
	end if
	if idw_detalle2.retrieve(il_parque,is_tipo_ctto)=0 then
	end if
end if
end event

type cb_1 from commandbutton within w_provision_mantenciones
integer x = 2469
integer y = 1812
integer width = 311
integer height = 112
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_provision_mantenciones)
end event

type pb_aceptar from picturebutton within w_provision_mantenciones
integer x = 2601
integer y = 128
integer width = 178
integer height = 156
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_base,ls_falle,ls_text_mora,ls_nombre_emp,ls_cod_emp,&
		ls_mora_desc,ls_meses_mora_desc,ls_porce_inconb_desc,ls_ctto,ls_porce
long	ll_porcen,ll_porcen_1,ll_porcen_2,ll_prom,ll_ctas_pag,ll_parque,ll_tot_rows,&
		ll_meses,ll_fec_resul,ll_mant_mes,ll_monto_m,ll_prov_incob,&
		ll_incob_porcen,ll_libera,ll_escala,ll_falle,ll_ctas_mora_ini,ll_ctas_mora_fin,&
		ll_porce_inconb,ll_new,ll_escala_porce
double	ll_ctas_mora_1,ll_ctas_mora_2	,ll_meses_mora_ini,ll_meses_mora_fin,ll_valor_mant
date 	ld_fech_cierre

dw_lista.reset()
setnull(is_titulo)
//ll_parque			= dw_parque.getitemnumber(1,'parque')
ll_parque			= il_parque
if isnull(ll_parque) or ll_parque = 0 then
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_parque.setfocus()
else
	ld_fech_cierre	= dw_fech_cierre.getitemdate(1,'fec_cierre')
	ll_escala_porce		= long(trim(dw_porce.getitemstring(1,'escala')))
	if isnull(ld_fech_cierre) or ld_fech_cierre = date('00/00/0000') then
		messagebox("Advertencia","Debe Seleccionar Fecha de Cierre")
		dw_fech_cierre.setfocus()
	elseif isnull(ll_escala_porce) or ll_escala_porce = 0 then
		messagebox("Advertencia","Debe Seleccionar Porcentaje")
		dw_porce.setfocus()
	else
		ll_escala			= dw_escala.getitemnumber(1,'cod_escala')
		if isnull(ll_escala) or ll_escala = 0 then
			messagebox("Advertencia","Debe Seleccionar Escala")
			dw_escala.setfocus()
		else
			if ll_parque <> 104 then
				if gs_conexion	= "Parque El Prado" then	
					ls_cod_emp			= '002'
					ls_nombre_emp	= 'Inmobiliaria Parque La Florida SpA'
				elseif gs_conexion	= "Parque La Foresta" then
					ls_cod_emp			= '001'
					ls_nombre_emp	= 'Inmobiliaria Parque La Serena SpA'
				elseif gs_conexion	= "Parque Concepción" then
					ls_cod_emp			= '003'
					ls_nombre_emp	= 'Parque Concepción SpA'
				end if
			else
				ls_nombre_emp = 'Memorial Park'
			end if
			if rb_promesas.checked = true then   // tipo contrato
				ls_base 			= 'O'
			elseif rb_contratos.checked = true then
				ls_base 			= 'C'
			else
				messagebox('Advertencia','Debe Seleccionar Tipo de Contrato')
				rb_promesas.setfocus()
			end if
			if rb_no_falle.checked = true then
				ll_falle			= 0
				ls_falle			= 'sin'
			elseif	rb_si_falle.checked = true then
				ll_falle			= 1
				ls_falle			= 'con'
			end if
	
			SELECT 	"PROVISION_MANTENCIONES_ESCALA"."GLOSA_ESCALA","PROVISION_MANTENCIONES_ESCALA"."RANGO_DESDE","PROVISION_MANTENCIONES_ESCALA"."RANGO_HASTA"  
			INTO 		:ls_porce,:ll_porcen_1,:ll_porcen_2  
			FROM 	"PROVISION_MANTENCIONES_ESCALA"  
			WHERE 	"PROVISION_MANTENCIONES_ESCALA"."PARQUE" = :il_parque AND  
						"PROVISION_MANTENCIONES_ESCALA"."TIPO_CTTO" = :ls_base AND  
						"PROVISION_MANTENCIONES_ESCALA"."ESCALA" = :ll_escala_porce
			USING sqlca;
			
			SELECT "TIPO_CONTRATO"."DESCRIPCION"  
			INTO 		:ls_ctto  
			FROM 	"TIPO_CONTRATO"  
			WHERE 	"TIPO_CONTRATO"."CODIGO" = :ls_base
			USING	sqlca;
			is_titulo			= ls_ctto+' '+ ls_falle+' Fallecidos y Porcentaje Pago '+ls_porce
			ll_ctas_pag	= 90 // filtro para liberadores		
			if ls_base = 'O' then
				DECLARE x1 CURSOR FOR
				SELECT	"ESCALA_PORCEN_CONTAB"."CTAS_MORA_INI",
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_FIN",
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_DESC",
							"ESCALA_PORCEN_CONTAB"."MESES_MORA_INI",
							"ESCALA_PORCEN_CONTAB"."MESES_MORA_FIN",
							"ESCALA_PORCEN_CONTAB"."MESES_MORA_DESC",
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD",
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD_DESC"
				FROM 	"ESCALA_PORCEN_CONTAB"
				WHERE 	( "ESCALA_PORCEN_CONTAB"."BASE" = :ls_base ) AND
							( "ESCALA_PORCEN_CONTAB"."COD_ESCALA" = :ll_escala )
				USING	Trans_2;
				open x1;
					DO WHILE Trans_2.sqlcode=0
					fetch x1 into :ll_ctas_mora_ini, :ll_ctas_mora_fin, :ls_mora_desc, :ll_meses_mora_ini, :ll_meses_mora_fin, :ls_meses_mora_desc, :ll_porce_inconb, :ls_porce_inconb_desc;
						if not isnull(ll_falle) and not isnull(ll_ctas_mora_ini) and not isnull(ll_ctas_mora_fin) and not isnull(ls_mora_desc) and not isnull(ll_meses_mora_ini) and not isnull(ll_meses_mora_fin) then
							if 	ll_falle = 0 then
								SELECT 	count("PROVISION_MANTENCIONES"."NUMERO"),sum("PROVISION_MANTENCIONES"."VALOR_MANT")
								INTO 		:ll_prom,:ll_valor_mant
								FROM 	"PROVISION_MANTENCIONES"
								WHERE 	"PROVISION_MANTENCIONES"."BASE" = :ls_base AND
											"PROVISION_MANTENCIONES"."PORCE_PAGO" >= :ll_porcen_1 AND
											"PROVISION_MANTENCIONES"."PORCE_PAGO" < :ll_porcen_2 AND
											"PROVISION_MANTENCIONES"."FECHA_CIERRE" = :ld_fech_cierre AND
											"PROVISION_MANTENCIONES"."FALLECIDO" = :ll_falle AND
											"PROVISION_MANTENCIONES"."COD_PARQUE" = :ll_parque  AND
											"PROVISION_MANTENCIONES"."MESES"	>= :ll_meses_mora_ini AND
											"PROVISION_MANTENCIONES"."MESES"	< :ll_meses_mora_fin AND
											"PROVISION_MANTENCIONES"."CTAS_MANT"	< :ll_ctas_pag
								USING 	sqlca;	
								SELECT 	count("PROVISION_MANTENCIONES"."NUMERO")
								INTO 		:ll_libera
								FROM 	"PROVISION_MANTENCIONES"
								WHERE 	"PROVISION_MANTENCIONES"."BASE" = :ls_base AND
											"PROVISION_MANTENCIONES"."PORCE_PAGO" >= :ll_porcen_1 AND
											"PROVISION_MANTENCIONES"."PORCE_PAGO" < :ll_porcen_2 AND
											"PROVISION_MANTENCIONES"."FECHA_CIERRE" = :ld_fech_cierre AND
											"PROVISION_MANTENCIONES"."FALLECIDO" = :ll_falle AND
											"PROVISION_MANTENCIONES"."COD_PARQUE" = :ll_parque AND
											"PROVISION_MANTENCIONES"."CTAS_MANT"	>= :ll_ctas_pag
								USING 	sqlca;
							elseif ll_falle = 1 then
								SELECT 	count("PROVISION_MANTENCIONES"."NUMERO"),sum("PROVISION_MANTENCIONES"."VALOR_MANT")
								INTO 		:ll_prom,:ll_valor_mant
								FROM 	"PROVISION_MANTENCIONES"
								WHERE 	"PROVISION_MANTENCIONES"."BASE" = :ls_base AND
											"PROVISION_MANTENCIONES"."PORCE_PAGO" >= :ll_porcen_1 AND
											"PROVISION_MANTENCIONES"."PORCE_PAGO" < :ll_porcen_2 AND
											"PROVISION_MANTENCIONES"."FECHA_CIERRE" = :ld_fech_cierre AND
											"PROVISION_MANTENCIONES"."FALLECIDO" >= :ll_falle AND
											"PROVISION_MANTENCIONES"."COD_PARQUE" = :ll_parque AND
											"PROVISION_MANTENCIONES"."MESES"	>= :ll_meses_mora_ini AND
											"PROVISION_MANTENCIONES"."MESES"	< :ll_meses_mora_fin AND
											"PROVISION_MANTENCIONES"."CTAS_MANT" < :ll_ctas_pag
								USING 	sqlca;
								SELECT 	count("PROVISION_MANTENCIONES"."NUMERO")
								INTO 		:ll_libera
								FROM 	"PROVISION_MANTENCIONES"
								WHERE 	"PROVISION_MANTENCIONES"."BASE" = :ls_base AND
											"PROVISION_MANTENCIONES"."PORCE_PAGO" >= :ll_porcen_1 AND
											"PROVISION_MANTENCIONES"."PORCE_PAGO" < :ll_porcen_2 AND
											"PROVISION_MANTENCIONES"."FECHA_CIERRE" = :ld_fech_cierre AND
											"PROVISION_MANTENCIONES"."FALLECIDO" >= :ll_falle AND
											"PROVISION_MANTENCIONES"."COD_PARQUE" = :ll_parque AND
											"PROVISION_MANTENCIONES"."CTAS_MANT"	>= :ll_ctas_pag
								USING 	sqlca;
							end if
							ll_prov_incob			= (ll_valor_mant/100)*ll_porce_inconb
							dw_lista.object.t_titulo.text = is_titulo
							dw_lista.object.t_empresa.text = ls_nombre_emp
							if isnull(ll_valor_mant) or ll_valor_mant = 0 then
								ll_valor_mant = 0
							end if
							if isnull(ll_prov_incob) or ll_prov_incob = 0 then
								ll_prov_incob = 0
							end if	
							ll_new													= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,'parque',ll_parque)
							dw_lista.setitem(ll_new,'fecha_cierre',ld_fech_cierre)
							dw_lista.setitem(ll_new,'promesas',ll_prom)
							dw_lista.setitem(ll_new,'mora',ls_meses_mora_desc)
							dw_lista.setitem(ll_new,'monto_mora',ll_valor_mant)
							dw_lista.setitem(ll_new,'porce_incob',ls_porce_inconb_desc)
							dw_lista.setitem(ll_new,'provision_incob',ll_prov_incob)
							dw_lista.setitem(ll_new,'liberador_text','liberadores')
							dw_lista.setitem(ll_new,'liberadores',ll_libera)
						end if
						/*setnull(ll_falle);*/setnull(ll_ctas_mora_ini);setnull(ll_ctas_mora_fin);setnull(ls_mora_desc);setnull(ll_meses_mora_ini);setnull(ll_meses_mora_fin)
					LOOP
				close x1;
			elseif	/*(ll_parque = 1 or ll_parque= 11 or ll_parque= 103 or ll_parque= 102 or ll_parque= 104) and*/ ls_base = 'C' then
				DECLARE x2 CURSOR FOR
				//SELECT 	"ESCALA_PORCEN_CONTAB"."FALLECIDOS",
				SELECT	"ESCALA_PORCEN_CONTAB"."CTAS_MORA_INI",
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_FIN",
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_DESC",
							"ESCALA_PORCEN_CONTAB"."MESES_MORA_INI",
							"ESCALA_PORCEN_CONTAB"."MESES_MORA_FIN",
							"ESCALA_PORCEN_CONTAB"."MESES_MORA_DESC",
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD",
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD_DESC"
				FROM 	"ESCALA_PORCEN_CONTAB"
				WHERE 	( "ESCALA_PORCEN_CONTAB"."BASE" = :ls_base ) AND
							( "ESCALA_PORCEN_CONTAB"."COD_ESCALA" = :ll_escala )
				USING	Trans_1;
				open x2;
					DO WHILE Trans_1.sqlcode=0
					fetch x2 into /*:ll_falle,*/:ll_ctas_mora_ini, :ll_ctas_mora_fin, :ls_mora_desc, :ll_meses_mora_ini, :ll_meses_mora_fin, :ls_meses_mora_desc, :ll_porce_inconb, :ls_porce_inconb_desc;
						if not isnull(ll_falle) and not isnull(ll_ctas_mora_ini) and not isnull(ll_ctas_mora_fin) and not isnull(ls_mora_desc) and not isnull(ll_meses_mora_ini) and not isnull(ll_meses_mora_fin) then
							if 	ll_falle = 0 then
								SELECT 	count("PROVISION_MANTENCIONES"."NUMERO"),sum("PROVISION_MANTENCIONES"."VALOR_MANT")
								INTO 		:ll_prom,:ll_valor_mant
								FROM 	"PROVISION_MANTENCIONES"
								WHERE 	"PROVISION_MANTENCIONES"."BASE" = :ls_base AND
										//	("PROVISION_MANTENCIONES"."ESTADO" = 'V' or "PROVISION_MANTENCIONES"."ESTADO" = 'T') AND
											"PROVISION_MANTENCIONES"."FECHA_CIERRE" = :ld_fech_cierre AND
											"PROVISION_MANTENCIONES"."FALLECIDO" = :ll_falle AND
											"PROVISION_MANTENCIONES"."COD_PARQUE" = :ll_parque AND
											"PROVISION_MANTENCIONES"."MESES"	>= :ll_meses_mora_ini AND
											"PROVISION_MANTENCIONES"."MESES"	< :ll_meses_mora_fin AND
											"PROVISION_MANTENCIONES"."CTAS_MANT"	< :ll_ctas_pag
								USING 	sqlca;
								SELECT 	count("PROVISION_MANTENCIONES"."NUMERO")
								INTO 		:ll_libera
								FROM 	"PROVISION_MANTENCIONES"
								WHERE 	"PROVISION_MANTENCIONES"."BASE" = :ls_base AND
										//	("PROVISION_MANTENCIONES"."ESTADO" = 'V' or "PROVISION_MANTENCIONES"."ESTADO" = 'T')AND
											"PROVISION_MANTENCIONES"."FECHA_CIERRE" = :ld_fech_cierre AND
											"PROVISION_MANTENCIONES"."FALLECIDO" = :ll_falle AND
											"PROVISION_MANTENCIONES"."COD_PARQUE" = :ll_parque AND
											"PROVISION_MANTENCIONES"."MESES"	< :ll_meses_mora_ini AND
											"PROVISION_MANTENCIONES"."CTAS_MANT"	>= :ll_ctas_pag
								USING 	sqlca;
							elseif ll_falle = 1 then
								SELECT 	count("PROVISION_MANTENCIONES"."NUMERO"),sum("PROVISION_MANTENCIONES"."VALOR_MANT")
								INTO 		:ll_prom,:ll_valor_mant
								FROM 	"PROVISION_MANTENCIONES"
								WHERE 	"PROVISION_MANTENCIONES"."BASE" = :ls_base AND
										//	("PROVISION_MANTENCIONES"."ESTADO" = 'V' or "PROVISION_MANTENCIONES"."ESTADO" = 'T') AND
											"PROVISION_MANTENCIONES"."FECHA_CIERRE" = :ld_fech_cierre AND
											"PROVISION_MANTENCIONES"."FALLECIDO" >= :ll_falle AND
											"PROVISION_MANTENCIONES"."COD_PARQUE" = :ll_parque AND
											"PROVISION_MANTENCIONES"."MESES"	>= :ll_meses_mora_ini AND
											"PROVISION_MANTENCIONES"."MESES"	< :ll_meses_mora_fin AND
											"PROVISION_MANTENCIONES"."CTAS_MANT"	< :ll_ctas_pag
								USING 	sqlca;
								SELECT 	count("PROVISION_MANTENCIONES"."NUMERO")
								INTO 		:ll_libera
								FROM 	"PROVISION_MANTENCIONES"
								WHERE 	"PROVISION_MANTENCIONES"."BASE" = :ls_base AND
										//	("PROVISION_MANTENCIONES"."ESTADO" = 'V' or "PROVISION_MANTENCIONES"."ESTADO" = 'T')AND
											"PROVISION_MANTENCIONES"."FECHA_CIERRE" = :ld_fech_cierre AND
											"PROVISION_MANTENCIONES"."FALLECIDO" >= :ll_falle AND
											"PROVISION_MANTENCIONES"."COD_PARQUE" = :ll_parque AND
											"PROVISION_MANTENCIONES"."MESES"	< :ll_meses_mora_ini AND
											"PROVISION_MANTENCIONES"."CTAS_MANT"	>= :ll_ctas_pag
								USING 	sqlca;
							end if
							ll_prov_incob			= (ll_valor_mant/100)*ll_porce_inconb
							dw_lista.object.t_titulo.text = is_titulo
							dw_lista.object.t_empresa.text = ls_nombre_emp
							if isnull(ll_valor_mant) or ll_valor_mant = 0 then
								ll_valor_mant = 0
							end if
							if isnull(ll_prov_incob) or ll_prov_incob = 0 then
								ll_prov_incob = 0
							end if
							ll_new													= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,'parque',ll_parque)
							dw_lista.setitem(ll_new,'fecha_cierre',ld_fech_cierre)
							dw_lista.setitem(ll_new,'promesas',ll_prom)
							dw_lista.setitem(ll_new,'mora',ls_meses_mora_desc)
							dw_lista.setitem(ll_new,'monto_mora',ll_valor_mant)
							dw_lista.setitem(ll_new,'porce_incob',ls_porce_inconb_desc)
							dw_lista.setitem(ll_new,'provision_incob',ll_prov_incob)
							dw_lista.setitem(ll_new,'liberador_text','liberadores')
							dw_lista.setitem(ll_new,'liberadores',ll_libera)
						end if
						/*setnull(ll_falle);*/setnull(ll_ctas_mora_ini);setnull(ll_ctas_mora_fin);setnull(ls_mora_desc);setnull(ll_meses_mora_ini);setnull(ll_meses_mora_fin)
					LOOP
				close x2;
			end if
		end if
	end if
end if
end event

type dw_lista from datawindow within w_provision_mantenciones
integer x = 37
integer y = 312
integer width = 2743
integer height = 1464
string title = "none"
string dataobject = "dwe_provi_mant_con_falle"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_provision_mantenciones
integer x = 1207
integer y = 28
integer width = 274
integer height = 256
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fallecido"
end type

type gb_2 from groupbox within w_provision_mantenciones
integer x = 818
integer y = 32
integer width = 384
integer height = 256
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo"
end type

type gb_3 from groupbox within w_provision_mantenciones
integer x = 1486
integer y = 32
integer width = 1088
integer height = 256
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Porcentaje y Escala"
end type

type rb_no_falle from radiobutton within w_provision_mantenciones
integer x = 1266
integer y = 96
integer width = 169
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "No"
boolean checked = true
end type

event clicked;dw_lista.reset()
dw_lista.object.t_titulo.text = ''
dw_lista.object.t_empresa.text = ''
end event

type dw_porce from datawindow within w_provision_mantenciones
integer x = 1518
integer y = 92
integer width = 1038
integer height = 92
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_escala_provicion_mant"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type dw_escala from datawindow within w_provision_mantenciones
integer x = 1605
integer y = 188
integer width = 951
integer height = 76
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_escala_contab"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

