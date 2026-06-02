forward
global type w_perfil_por_area from window
end type
type cb_eliminar_depto from commandbutton within w_perfil_por_area
end type
type cb_nuevo from commandbutton within w_perfil_por_area
end type
type cb_eliminar from commandbutton within w_perfil_por_area
end type
type cb_insertar from commandbutton within w_perfil_por_area
end type
type cb_ordenar_perfil from commandbutton within w_perfil_por_area
end type
type cb_exportar_perfil from commandbutton within w_perfil_por_area
end type
type cb_filtrar_perfil from commandbutton within w_perfil_por_area
end type
type cb_imprimir_perfil from commandbutton within w_perfil_por_area
end type
type cb_imprimir_area from commandbutton within w_perfil_por_area
end type
type cb_filtrar_area from commandbutton within w_perfil_por_area
end type
type cb_exportar_area from commandbutton within w_perfil_por_area
end type
type cb_ordenar_area from commandbutton within w_perfil_por_area
end type
type cb_grabar from commandbutton within w_perfil_por_area
end type
type cb_cerrar from commandbutton within w_perfil_por_area
end type
type dw_obj_depto from datawindow within w_perfil_por_area
end type
type dw_lista_area from datawindow within w_perfil_por_area
end type
type gb_1 from groupbox within w_perfil_por_area
end type
type gb_2 from groupbox within w_perfil_por_area
end type
end forward

global type w_perfil_por_area from window
integer width = 3195
integer height = 1940
boolean titlebar = true
string title = "Perfil por Departamento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_eliminar_depto cb_eliminar_depto
cb_nuevo cb_nuevo
cb_eliminar cb_eliminar
cb_insertar cb_insertar
cb_ordenar_perfil cb_ordenar_perfil
cb_exportar_perfil cb_exportar_perfil
cb_filtrar_perfil cb_filtrar_perfil
cb_imprimir_perfil cb_imprimir_perfil
cb_imprimir_area cb_imprimir_area
cb_filtrar_area cb_filtrar_area
cb_exportar_area cb_exportar_area
cb_ordenar_area cb_ordenar_area
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_obj_depto dw_obj_depto
dw_lista_area dw_lista_area
gb_1 gb_1
gb_2 gb_2
end type
global w_perfil_por_area w_perfil_por_area

type variables
long	il_row, il_codigo,il_row_obj
end variables

on w_perfil_por_area.create
this.cb_eliminar_depto=create cb_eliminar_depto
this.cb_nuevo=create cb_nuevo
this.cb_eliminar=create cb_eliminar
this.cb_insertar=create cb_insertar
this.cb_ordenar_perfil=create cb_ordenar_perfil
this.cb_exportar_perfil=create cb_exportar_perfil
this.cb_filtrar_perfil=create cb_filtrar_perfil
this.cb_imprimir_perfil=create cb_imprimir_perfil
this.cb_imprimir_area=create cb_imprimir_area
this.cb_filtrar_area=create cb_filtrar_area
this.cb_exportar_area=create cb_exportar_area
this.cb_ordenar_area=create cb_ordenar_area
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_obj_depto=create dw_obj_depto
this.dw_lista_area=create dw_lista_area
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_eliminar_depto,&
this.cb_nuevo,&
this.cb_eliminar,&
this.cb_insertar,&
this.cb_ordenar_perfil,&
this.cb_exportar_perfil,&
this.cb_filtrar_perfil,&
this.cb_imprimir_perfil,&
this.cb_imprimir_area,&
this.cb_filtrar_area,&
this.cb_exportar_area,&
this.cb_ordenar_area,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_obj_depto,&
this.dw_lista_area,&
this.gb_1,&
this.gb_2}
end on

on w_perfil_por_area.destroy
destroy(this.cb_eliminar_depto)
destroy(this.cb_nuevo)
destroy(this.cb_eliminar)
destroy(this.cb_insertar)
destroy(this.cb_ordenar_perfil)
destroy(this.cb_exportar_perfil)
destroy(this.cb_filtrar_perfil)
destroy(this.cb_imprimir_perfil)
destroy(this.cb_imprimir_area)
destroy(this.cb_filtrar_area)
destroy(this.cb_exportar_area)
destroy(this.cb_ordenar_area)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_obj_depto)
destroy(this.dw_lista_area)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;gf_centrar(w_perfil_por_area)
dw_lista_area.settransobject(sqlca)
dw_obj_depto.settransobject(sqlca)
if dw_lista_area.retrieve()>0 then
	dw_lista_area.scrolltorow(1)
	il_codigo	= dw_lista_area.getitemnumber(1,'codigo')
end if
dw_obj_depto.getchild('perfil_objeto_depto_correlativo_objeto',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_obj_depto.retrieve(il_codigo)
end event

type cb_eliminar_depto from commandbutton within w_perfil_por_area
integer x = 2816
integer y = 700
integer width = 279
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar"
end type

event clicked;Long	ll_resp
if il_row>0 then
	ll_resp	= messagebox("Eliminar","Está seguro de Eliminar Codigo Nº "+string(il_row),Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_lista_area.deleterow(il_row)
		messagebox("Eliminar","Eliminación Exitosa, recuerde antes de Salir debe GRABAR")
	end if
else
	messagebox("Advertencia","Debe Seleccionar Item en Lista de Departamento")
end if
end event

type cb_nuevo from commandbutton within w_perfil_por_area
integer x = 2816
integer y = 600
integer width = 279
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long	ll_new
ll_new	= dw_lista_area.insertrow(0)
dw_lista_area.scrolltorow(ll_new)
dw_lista_area.setfocus()
dw_lista_area.setcolumn('codigo')
end event

type cb_eliminar from commandbutton within w_perfil_por_area
integer x = 1339
integer y = 1716
integer width = 325
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Elimina&r"
end type

event clicked;long	ll_resp
if il_row_obj>0 then
	ll_resp = MessageBox("Advertencia", 'Está seguro de Eliminar registro Nº '+string(il_row_obj), &
			Exclamation!, YesNo!, 2)
	IF ll_resp = 1 THEN
		dw_obj_depto.deleterow(il_row_obj)
		if dw_obj_depto.update()=1 then
			commit;
		else
			rollback;
		end if
	END IF
end if
end event

type cb_insertar from commandbutton within w_perfil_por_area
integer x = 1010
integer y = 1716
integer width = 325
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "In&sertar"
end type

event clicked;string	ls_ventana,ls_tipo
long		ll_new,ll_resp,ll_max_reg,ll_tot_reg,ll_indi,ll_sw=0,ll_objeto
il_codigo	= dw_lista_area.getrow()
if il_codigo>0 or not isnull(il_codigo) then
	ll_tot_reg	= dw_obj_depto.rowcount()
	for ll_indi=1 to ll_tot_reg
		ls_ventana	= dw_obj_depto.getitemstring(ll_indi,'perfil_objeto_ventana')
		ls_tipo		= dw_obj_depto.getitemstring(ll_indi,'perfil_objeto_tipo')
		ll_objeto	= dw_obj_depto.getitemnumber(ll_indi,'perfil_objeto_depto_correlativo_objeto')
		if ls_ventana='' or ls_tipo='' or ll_objeto=0 or isnull(ls_ventana) or isnull(ls_tipo) or isnull(ll_objeto) then
			ll_sw	= 1
			if ls_ventana='' or isnull(ls_ventana) then
				messagebox("Advertencia","Debe seleccionar Ventana")
				dw_obj_depto.scrolltorow(ll_indi)
				dw_obj_depto.setcolumn('perfil_objeto_ventana')
				dw_obj_depto.setfocus()
			else
				if ls_tipo='' or isnull(ls_tipo) then
					messagebox("Advertencia","Debe seleccionar Tipo Objeto")
					dw_obj_depto.setcolumn('perfil_objeto_tipo')
					dw_obj_depto.setfocus()
				else
					if ll_objeto=0 or isnull(ll_objeto) then
						messagebox("Advertencia","Debe seleccionar Objeto")
						dw_obj_depto.setcolumn('perfil_objeto_depto_correlativo_objeto')
						dw_obj_depto.setfocus()
					end if
				end if
			end if
		end if
	next
	if ll_sw=0 then
//		SELECT 	MAX("PERFIL_OBJETO_DEPTO"."CODIGO_DEPTO")  
//		INTO 		:ll_max_reg  
//		FROM 		"PERFIL_OBJETO_DEPTO" 
//		USING		sqlca;
//		if sqlca.sqlcode=0 then
//			if isnull(ll_max_reg) or ll_max_reg=0 then
//				ll_max_reg	= 1
//			else
//				ll_max_reg++
//			end if
//		else
//			ll_max_reg	= 1
//		end if
		ll_new	= dw_obj_depto.insertrow(0)
		dw_obj_depto.scrolltorow(ll_new)
		dw_obj_depto.setcolumn('perfil_objeto_ventana')
		dw_obj_depto.setitem(ll_new,'perfil_objeto_depto_usuario_crea',gs_user)
		dw_obj_depto.setitem(ll_new,'perfil_objeto_depto_codigo_depto',il_codigo)
		dw_obj_depto.setfocus()
	end if
	
//		CASE 't_eliminar'
//			if il_row_obj>0 then
//				ll_resp = MessageBox("Advertencia", 'Está seguro de Eliminar registro Nº '+string(il_row_obj), &
//						Exclamation!, OKCancel!, 2)
//				IF ll_resp = 1 THEN
//					this.deleterow(il_row_obj)
//					if this.update()=1 then
//						commit;
//					else
//						rollback;
//					end if
//				END IF
//			end if
else
	messagebox("Advertencia","Debe Seleccionar Departamento")
end if


end event

type cb_ordenar_perfil from commandbutton within w_perfil_por_area
integer x = 2816
integer y = 928
integer width = 279
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Or&denar"
end type

event clicked;if dw_obj_depto.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_obj_depto.SETSORT(NULO)
	dw_obj_depto.SORT()
end if
end event

type cb_exportar_perfil from commandbutton within w_perfil_por_area
integer x = 2816
integer y = 1028
integer width = 279
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_obj_depto
if dw_obj_depto.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar_perfil from commandbutton within w_perfil_por_area
integer x = 2816
integer y = 1128
integer width = 279
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtr&ar"
end type

event clicked;string nulo
setnull (nulo)
dw_obj_depto.SETfilter(NULO)
dw_obj_depto.filter()
end event

type cb_imprimir_perfil from commandbutton within w_perfil_por_area
integer x = 2816
integer y = 1292
integer width = 279
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "I&mprimir"
end type

event clicked;if dw_obj_depto.rowcount() > 0 then
	f_Print( dw_obj_depto )
end if
end event

type cb_imprimir_area from commandbutton within w_perfil_por_area
integer x = 2816
integer y = 452
integer width = 279
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista_area.rowcount() > 0 then
	f_Print( dw_lista_area )
end if
end event

type cb_filtrar_area from commandbutton within w_perfil_por_area
integer x = 2816
integer y = 304
integer width = 279
integer height = 96
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
dw_lista_area.SETfilter(NULO)
dw_lista_area.filter()
end event

type cb_exportar_area from commandbutton within w_perfil_por_area
integer x = 2816
integer y = 204
integer width = 279
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista_area
if dw_lista_area.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar_area from commandbutton within w_perfil_por_area
integer x = 2816
integer y = 104
integer width = 279
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista_area.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista_area.SETSORT(NULO)
	dw_lista_area.SORT()
end if
end event

type cb_grabar from commandbutton within w_perfil_por_area
integer x = 50
integer y = 1716
integer width = 325
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long		ll_tot_reg,ll_indi,ll_codigo
String	ls_resp
if dw_lista_area.update()=1 then
	commit;
	if dw_obj_depto.update()=1 then
		commit;
		if isvalid(w_perfil_usuario.dw_lista_areas) then
			ll_tot_reg	= w_perfil_usuario.dw_lista_areas.retrieve()
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					ll_codigo	= w_perfil_usuario.dw_lista_areas.getitemnumber(ll_indi,'codigo')
					ls_resp		= f_buscar_perfil_depto(ll_codigo)
					if ls_resp='S' then
						w_perfil_usuario.dw_lista_areas.setitem(ll_indi,'func_perfil_depto','S')
					else
						w_perfil_usuario.dw_lista_areas.setitem(ll_indi,'func_perfil_depto','N')
					end if
				next
			end if
		end if
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error","Error al Grabar: "+sqlca.sqlerrtext)
	end if
else
	rollback;
	messagebox("Error","Error al Grabar: "+sqlca.sqlerrtext)
end if
end event

type cb_cerrar from commandbutton within w_perfil_por_area
integer x = 2802
integer y = 1716
integer width = 325
integer height = 96
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_perfil_por_area)
end event

type dw_obj_depto from datawindow within w_perfil_por_area
integer x = 50
integer y = 888
integer width = 2697
integer height = 780
integer taborder = 60
string title = "none"
string dataobject = "dw_objeto_asociado_a_departamento"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;string	ls_ventana, ls_tipo

if this.getrow()>0 then
	il_row_obj	= this.getrow()
	ls_ventana	= this.getitemstring(il_row_obj,'perfil_objeto_ventana')
	ls_tipo		= this.getitemstring(il_row_obj,'perfil_objeto_tipo')
	if not isnull(ls_tipo) and not isnull(ls_ventana) and ls_tipo<>'' and ls_ventana<>'' then
		if idw_detalle.retrieve(ls_tipo,ls_ventana)=0 then
			messagebox("Advertencia","No registra Objetos a seleccionar")
		end if
	end if
end if
end event

event itemchanged;string	ls_ventana, ls_tipo
Long		ll_objeto
dw_obj_depto.accepttext()
if dw_obj_depto.getrow() > 0 then
	il_row_obj	= dw_obj_depto.getrow()
	ls_ventana	= dw_obj_depto.getitemstring(il_row_obj,'perfil_objeto_ventana')
	ls_tipo		= dw_obj_depto.getitemstring(il_row_obj,'perfil_objeto_tipo')
	ll_objeto	= dw_obj_depto.getitemnumber(il_row_obj,'perfil_objeto_depto_correlativo_objeto')
	if ls_ventana<>'' and ls_tipo<>'' and ll_objeto>0 and not isnull(ls_ventana) and not isnull(ls_tipo) and not isnull(ll_objeto) then
		if dw_obj_depto.update()=1 then
			commit;
		else
			rollback;
		end if
	end if
end if
end event

event rowfocuschanged;if dw_obj_depto.getrow()>0 then 
	il_row_obj	= dw_obj_depto.getrow()
	dw_obj_depto.scrolltorow(il_row_obj)
end if
end event

event clicked;if row>0 then 
	il_row_obj	= row
	dw_obj_depto.scrolltorow(il_row_obj)
end if
end event

type dw_lista_area from datawindow within w_perfil_por_area
integer x = 50
integer y = 60
integer width = 2697
integer height = 780
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_areas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_nom
if row>0 then
	il_row		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	il_codigo	= this.getitemnumber(il_row,'codigo')
	ls_nom		= this.getitemstring(il_row,'departamento')
	dw_obj_depto.getchild('perfil_objeto_depto_correlativo_objeto',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.rowcount()=0 then
		idw_detalle.insertrow(0)
	end if
	if dw_obj_depto.retrieve(il_codigo)>0 then
		dw_obj_depto.scrolltorow(1)
	end if
	dw_obj_depto.object.t_titulo.text='Objetos Inabilitados para Departamento: '+ls_nom
end if
end event

event rowfocuschanged;string	ls_nom
if this.getrow()>0 then
	il_row		= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	il_codigo	= this.getitemnumber(il_row,'codigo')
	ls_nom		= this.getitemstring(il_row,'departamento')
	dw_obj_depto.getchild('perfil_objeto_depto_correlativo_objeto',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.rowcount()=0 then
		idw_detalle.insertrow(0)
	end if
	if dw_obj_depto.retrieve(il_codigo)>0 then
		dw_obj_depto.scrolltorow(1)
	end if
	dw_obj_depto.object.t_titulo.text='Objetos Inabilitados para Departamento: '+ls_nom
end if
end event

type gb_1 from groupbox within w_perfil_por_area
integer x = 2775
integer y = 860
integer width = 361
integer height = 812
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_perfil_por_area
integer x = 2775
integer y = 32
integer width = 361
integer height = 812
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

