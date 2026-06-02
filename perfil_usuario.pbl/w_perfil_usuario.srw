forward
global type w_perfil_usuario from window
end type
type st_eliminar_todo from statictext within w_perfil_usuario
end type
type cb_crea_usuario from commandbutton within w_perfil_usuario
end type
type cb_calculo_mora from commandbutton within w_perfil_usuario
end type
type st_eliminar from statictext within w_perfil_usuario
end type
type st_insertar from statictext within w_perfil_usuario
end type
type dw_lista_areas from datawindow within w_perfil_usuario
end type
type cb_perfil_por_area from commandbutton within w_perfil_usuario
end type
type em_usuario from editmask within w_perfil_usuario
end type
type st_1 from statictext within w_perfil_usuario
end type
type cb_ordenar2 from commandbutton within w_perfil_usuario
end type
type cb_filtrar2 from commandbutton within w_perfil_usuario
end type
type cb_exportar2 from commandbutton within w_perfil_usuario
end type
type cb_imprimir2 from commandbutton within w_perfil_usuario
end type
type cb_imprimir from commandbutton within w_perfil_usuario
end type
type cb_exportar from commandbutton within w_perfil_usuario
end type
type cb_filtrar from commandbutton within w_perfil_usuario
end type
type cb_ordenar from commandbutton within w_perfil_usuario
end type
type cb_cerrar from commandbutton within w_perfil_usuario
end type
type cb_grabar from commandbutton within w_perfil_usuario
end type
type dw_encargados from datawindow within w_perfil_usuario
end type
type dw_lista_obj from datawindow within w_perfil_usuario
end type
end forward

global type w_perfil_usuario from window
integer width = 2766
integer height = 2084
boolean titlebar = true
string title = "Perfil de Usuario"
boolean minbox = true
long backcolor = 67108864
st_eliminar_todo st_eliminar_todo
cb_crea_usuario cb_crea_usuario
cb_calculo_mora cb_calculo_mora
st_eliminar st_eliminar
st_insertar st_insertar
dw_lista_areas dw_lista_areas
cb_perfil_por_area cb_perfil_por_area
em_usuario em_usuario
st_1 st_1
cb_ordenar2 cb_ordenar2
cb_filtrar2 cb_filtrar2
cb_exportar2 cb_exportar2
cb_imprimir2 cb_imprimir2
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_encargados dw_encargados
dw_lista_obj dw_lista_obj
end type
global w_perfil_usuario w_perfil_usuario

type variables
long		il_row,il_row_obj,il_row_depto
string	is_usuario
//DataWindowChild idw_detalle
DragObject control_dw
end variables

on w_perfil_usuario.create
this.st_eliminar_todo=create st_eliminar_todo
this.cb_crea_usuario=create cb_crea_usuario
this.cb_calculo_mora=create cb_calculo_mora
this.st_eliminar=create st_eliminar
this.st_insertar=create st_insertar
this.dw_lista_areas=create dw_lista_areas
this.cb_perfil_por_area=create cb_perfil_por_area
this.em_usuario=create em_usuario
this.st_1=create st_1
this.cb_ordenar2=create cb_ordenar2
this.cb_filtrar2=create cb_filtrar2
this.cb_exportar2=create cb_exportar2
this.cb_imprimir2=create cb_imprimir2
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_encargados=create dw_encargados
this.dw_lista_obj=create dw_lista_obj
this.Control[]={this.st_eliminar_todo,&
this.cb_crea_usuario,&
this.cb_calculo_mora,&
this.st_eliminar,&
this.st_insertar,&
this.dw_lista_areas,&
this.cb_perfil_por_area,&
this.em_usuario,&
this.st_1,&
this.cb_ordenar2,&
this.cb_filtrar2,&
this.cb_exportar2,&
this.cb_imprimir2,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_encargados,&
this.dw_lista_obj}
end on

on w_perfil_usuario.destroy
destroy(this.st_eliminar_todo)
destroy(this.cb_crea_usuario)
destroy(this.cb_calculo_mora)
destroy(this.st_eliminar)
destroy(this.st_insertar)
destroy(this.dw_lista_areas)
destroy(this.cb_perfil_por_area)
destroy(this.em_usuario)
destroy(this.st_1)
destroy(this.cb_ordenar2)
destroy(this.cb_filtrar2)
destroy(this.cb_exportar2)
destroy(this.cb_imprimir2)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_encargados)
destroy(this.dw_lista_obj)
end on

event open;String	ls_usuario, ls_ventana, ls_tipo,ls_resp,ls_depto
Long		ll_tot_reg,ll_indi,ll_codigo
gf_centrar(w_perfil_usuario)
gs_ventana		= 'w_perfil_usuario'
f_valida_objeto()
dw_encargados.settransobject(sqlca)
dw_lista_obj.settransobject(sqlca)
dw_lista_areas.settransobject(sqlca)
dw_lista_obj.getchild('perfil_usuario_correlativo_objeto',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
if dw_encargados.retrieve()>0 then
	dw_encargados.scrolltorow(1)
	ls_usuario	= dw_encargados.getitemstring(1,'codigo_usuario')
	dw_lista_obj.retrieve(ls_usuario)
end if
ll_tot_reg	= dw_lista_areas.retrieve()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ll_codigo	= dw_lista_areas.getitemnumber(ll_indi,'codigo')
		ls_resp		= f_buscar_perfil_depto(ll_codigo)
		if ls_resp='S' then
			dw_lista_areas.setitem(ll_indi,'func_perfil_depto','S')
		else
			dw_lista_areas.setitem(ll_indi,'func_perfil_depto','N')
		end if
	next
end if
if gs_conexion	= "Parque El Prado" then
	dw_encargados.object.t_parque.text	= 'Parque El Prado'
	dw_lista_obj.object.t_parque.text	= 'Parque El Prado'
elseif gs_conexion	= "Parque La Foresta" then
	dw_encargados.object.t_parque.text	= 'Parque La Foresta'
	dw_lista_obj.object.t_parque.text	= 'Parque La Foresta'
elseif gs_conexion	= "Parque Concepción" then
	dw_encargados.object.t_parque.text	= 'Parque Concepción'
	dw_lista_obj.object.t_parque.text	= 'Parque Concepción'
end if
SELECT	"ENCARGADOS"."DEPTO"  
INTO 		:ls_depto  
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
USING		SQLCA;
if sqlca.sqlcode=0 then
	if trim(ls_depto)='I' then
		cb_crea_usuario.enabled	= true
	else
		cb_crea_usuario.enabled	= false
	end if
else
	cb_crea_usuario.enabled	= false
end if
end event

type st_eliminar_todo from statictext within w_perfil_usuario
integer x = 2062
integer y = 1744
integer width = 453
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Eliminar Todo"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;string	ls_columna,ls_ventana,ls_tipo,ls_nombre
long		ll_new,ll_resp,ll_max_reg,ll_tot_reg,ll_indi,ll_sw=0,ll_objeto

if trim(em_usuario.text)<>'' and not isnull(trim(em_usuario.text)) then
	is_usuario	= trim(em_usuario.text)
end if
SELECT	"ENCARGADOS"."NOMBRE"  
INTO 		:ls_nombre  
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario
USING		sqlca;
if sqlca.sqlcode=0 then
	il_row_obj	= dw_lista_obj.rowcount()
	if il_row_obj>0 then
		ll_resp = MessageBox("Advertencia", 'Está seguro de Eliminar Todos los Registro del Perfil Usuario: '+is_usuario,Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			for ll_indi=1 to il_row_obj
				dw_lista_obj.deleterow(1)
				if dw_lista_obj.update()=1 then
					commit;
				else
					rollback;
				end if
				if dw_lista_obj.rowcount()=0 then
					exit
				end if
			next
		END IF
	end if
else
	messagebox("Advertencia","Usuario NO Existe")
end if
end event

type cb_crea_usuario from commandbutton within w_perfil_usuario
integer x = 1170
integer y = 28
integer width = 366
integer height = 80
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Usuario"
end type

event clicked;//open(w_crear_usuario)
open(w_encargados)
end event

type cb_calculo_mora from commandbutton within w_perfil_usuario
integer x = 1874
integer y = 1864
integer width = 389
integer height = 100
integer taborder = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Calculo Mora"
end type

event clicked;open(w_calculo_moras_archivo)
end event

type st_eliminar from statictext within w_perfil_usuario
integer x = 1371
integer y = 1744
integer width = 453
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Eliminar"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;string	ls_columna,ls_ventana,ls_tipo,ls_nombre
long		ll_new,ll_resp,ll_max_reg,ll_tot_reg,ll_indi,ll_sw=0,ll_objeto

if trim(em_usuario.text)<>'' and not isnull(trim(em_usuario.text)) then
	is_usuario	= trim(em_usuario.text)
end if
SELECT	"ENCARGADOS"."NOMBRE"  
INTO 		:ls_nombre  
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario
USING		sqlca;
if sqlca.sqlcode=0 then
	il_row_obj	= dw_lista_obj.getrow()
	if il_row_obj>0 then
		ll_resp = MessageBox("Advertencia", 'Está seguro de Eliminar registro Nº '+string(il_row_obj), &
				Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			dw_lista_obj.deleterow(il_row_obj)
			if dw_lista_obj.update()=1 then
				commit;
			else
				rollback;
			end if
		END IF
	end if
else
	messagebox("Advertencia","Usuario NO Existe")
end if
end event

type st_insertar from statictext within w_perfil_usuario
integer x = 695
integer y = 1744
integer width = 439
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Insertar"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;string	ls_ventana,ls_tipo,ls_nombre
long		ll_new,ll_resp,ll_max_reg,ll_tot_reg,ll_indi,ll_sw=0,ll_objeto

if trim(em_usuario.text)<>'' and not isnull(trim(em_usuario.text)) then
	is_usuario	= trim(em_usuario.text)
end if
SELECT	"ENCARGADOS"."NOMBRE"  
INTO 		:ls_nombre  
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario
USING		sqlca;
if sqlca.sqlcode=0 then
	il_row_obj	= dw_lista_obj.getrow()
	ll_tot_reg	= dw_lista_obj.rowcount()
	for ll_indi=1 to ll_tot_reg
		ls_ventana	= dw_lista_obj.getitemstring(ll_indi,'perfil_objeto_ventana')
		ls_tipo		= dw_lista_obj.getitemstring(ll_indi,'perfil_objeto_tipo')
		ll_objeto	= dw_lista_obj.getitemnumber(ll_indi,'perfil_usuario_correlativo_objeto')
		if ls_ventana='' or ls_tipo='' or ll_objeto=0 or isnull(ls_ventana) or isnull(ls_tipo) or isnull(ll_objeto) then
			ll_sw	= 1
			if ls_ventana='' or isnull(ls_ventana) then
				messagebox("Advertencia","Debe seleccionar Ventana")
				dw_lista_obj.scrolltorow(ll_indi)
				dw_lista_obj.setcolumn('perfil_objeto_ventana')
				dw_lista_obj.setfocus()
			else
				if ls_tipo='' or isnull(ls_tipo) then
					messagebox("Advertencia","Debe seleccionar Tipo Objeto")
					dw_lista_obj.setcolumn('perfil_objeto_tipo')
					dw_lista_obj.setfocus()
				else
					if ll_objeto=0 or isnull(ll_objeto) then
						messagebox("Advertencia","Debe seleccionar Objeto")
						dw_lista_obj.setcolumn('perfil_usuario_correlativo_objeto')
						dw_lista_obj.setfocus()
					end if
				end if
			end if
		end if
	next
	if ll_sw=0 then
		SELECT 	MAX("PERFIL_USUARIO"."CORRELATIVO")
		INTO 		:ll_max_reg  
		FROM 		"PERFIL_USUARIO"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ll_max_reg) or ll_max_reg=0 then
				ll_max_reg	= 1
			else
				ll_max_reg++
			end if
		else
			ll_max_reg	= 1
		end if
		ll_new	= dw_lista_obj.insertrow(0)
		dw_lista_obj.scrolltorow(ll_new)
		dw_lista_obj.setcolumn('perfil_objeto_ventana')
		dw_lista_obj.setitem(ll_new,'perfil_usuario_usuario',is_usuario)
		dw_lista_obj.setitem(ll_new,'perfil_usuario_correlativo',ll_max_reg)
		dw_lista_obj.setfocus()
		dw_lista_obj.setcolumn('perfil_objeto_ventana')
	end if
else
	messagebox("Advertencia","Usuario NO Existe")
end if
end event

type dw_lista_areas from datawindow within w_perfil_usuario
integer x = 1810
integer y = 136
integer width = 896
integer height = 836
integer taborder = 80
string dragicon = "Exclamation!"
string title = "none"
string dataobject = "dw_lista_areas_2"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_depto	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_depto, TRUE)
	this.Drag(Begin!)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row_depto	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_depto, TRUE)
end if
end event

type cb_perfil_por_area from commandbutton within w_perfil_usuario
integer x = 1431
integer y = 1864
integer width = 384
integer height = 100
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Perfil * Depto."
end type

event clicked;open(w_perfil_por_area)
end event

type em_usuario from editmask within w_perfil_usuario
integer x = 443
integer y = 20
integer width = 571
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!"
end type

event modified;STRING	ls_string
long		ll_row,ll_largo
if trim(em_usuario.text)<>'' then
	is_usuario				= trim(em_usuario.text)
	ll_largo					= len(is_usuario)
	ls_string				= "mid(codigo_usuario,1,"+string(ll_largo)+")='"+trim(em_usuario.text)+"'"
	ll_row 					= dw_encargados.Find(ls_string, 1, dw_encargados.RowCount() )
	IF ll_row > 0 THEN
		dw_encargados.ScrollToRow( ll_row )
		dw_encargados.setfocus()
	ELSE
		MessageBox("Advertencia", "Usuario Inexistente")
		em_usuario.text	= ''
	END IF
end if
end event

type st_1 from statictext within w_perfil_usuario
integer x = 64
integer y = 32
integer width = 379
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Usuario:"
boolean focusrectangle = false
end type

type cb_ordenar2 from commandbutton within w_perfil_usuario
integer x = 425
integer y = 1864
integer width = 233
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista_obj.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista_obj.SETSORT(NULO)
	dw_lista_obj.SORT()
end if
end event

type cb_filtrar2 from commandbutton within w_perfil_usuario
integer x = 663
integer y = 1864
integer width = 233
integer height = 100
integer taborder = 120
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
dw_lista_obj.SETfilter(NULO)
dw_lista_obj.filter()
end event

type cb_exportar2 from commandbutton within w_perfil_usuario
integer x = 901
integer y = 1864
integer width = 233
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista_obj
if dw_lista_obj.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir2 from commandbutton within w_perfil_usuario
integer x = 1138
integer y = 1864
integer width = 233
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista_obj.rowcount() > 0 then
	f_Print( dw_lista_obj )
end if
end event

type cb_imprimir from commandbutton within w_perfil_usuario
integer x = 2459
integer y = 28
integer width = 247
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_encargados.rowcount() > 0 then
	f_Print( dw_encargados )
end if
end event

type cb_exportar from commandbutton within w_perfil_usuario
integer x = 2235
integer y = 28
integer width = 219
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_encargados
if dw_encargados.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_perfil_usuario
integer x = 2011
integer y = 28
integer width = 219
integer height = 80
integer taborder = 30
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
dw_encargados.SETfilter(NULO)
dw_encargados.filter()
end event

type cb_ordenar from commandbutton within w_perfil_usuario
integer x = 1787
integer y = 28
integer width = 219
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_encargados.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_encargados.SETSORT(NULO)
	dw_encargados.SORT()
end if
end event

type cb_cerrar from commandbutton within w_perfil_usuario
integer x = 2382
integer y = 1864
integer width = 325
integer height = 100
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;if em_usuario.enabled=false then
	messagebox("Advertencia","Usuario Nuevo, debe asignar Perfil")
else
	close(w_perfil_usuario)
end if
end event

type cb_grabar from commandbutton within w_perfil_usuario
integer x = 41
integer y = 1864
integer width = 325
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_depto

if trim(em_usuario.text)<>'' and not isnull(trim(em_usuario.text)) then
	is_usuario	= trim(em_usuario.text)
end if
SELECT	"ENCARGADOS"."DEPTO"  
INTO 		:ls_depto  
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario   
USING		sqlca;
if sqlca.sqlcode=0 then
	if ls_depto='I' then em_usuario.enabled = true
end if
if em_usuario.enabled = false then
	if not isnull(em_usuario.text) and dw_lista_obj.rowcount()>0 then
		if dw_lista_obj.update()=1 then
			commit;
			gs_ventana				= 'w_principal'
			f_valida_objeto_auto()
			messagebox("Grabar","Grabación Exitosa")
			em_usuario.enabled	= true
		else
			rollback;
			messagebox("Advertencia","Error al Grabar: "+sqlca.sqlerrtext)
		end if
	else
		messagebox("Advertencia","Debe Asignar Perfil")
	end if
elseif em_usuario.enabled = true then
	if dw_lista_obj.update()=1 then
		commit;
		//gs_ventana	= 'w_perfil_usuario'
		gs_ventana	= 'w_principal'
		f_valida_objeto_auto()
		messagebox("Grabar","Grabación Exitosa")
		em_usuario.enabled	= true
	else
		rollback;
		messagebox("Advertencia","Error al Grabar: "+sqlca.sqlerrtext)
	end if
end if
end event

type dw_encargados from datawindow within w_perfil_usuario
integer x = 41
integer y = 136
integer width = 1714
integer height = 836
integer taborder = 70
string title = "none"
string dataobject = "dw_lista_encargados_perfil"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_usuario
if em_usuario.enabled=true then
	if row>0 then
		il_row				= row
		This.SelectRow(0, FALSE)
		This.SelectRow(il_row, TRUE)
		is_usuario			= trim(dw_encargados.getitemstring(il_row,'codigo_usuario'))
		if is_usuario<>trim(em_usuario.text) and trim(em_usuario.text)<>'' then em_usuario.text = ''
		dw_lista_obj.getchild('perfil_usuario_correlativo_objeto',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
		dw_lista_obj.retrieve(is_usuario)
		dw_lista_obj.object.t_titulo.text='Objetos Inabilitados para Usuario: '+is_usuario
	end if
end if
end event

event rowfocuschanged;Long	ll_largo
if em_usuario.enabled=true then
	if this.getrow()>0 then
		il_row				= this.getrow()
		This.SelectRow(0, FALSE)
		This.SelectRow(il_row, TRUE)
		is_usuario			= dw_encargados.getitemstring(il_row,'codigo_usuario')
		ll_largo				= len(trim(em_usuario.text))
		if mid(is_usuario,1,ll_largo)<>trim(em_usuario.text) and trim(em_usuario.text)<>'' then em_usuario.text = ''
		dw_lista_obj.getchild('perfil_usuario_correlativo_objeto',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
		dw_lista_obj.retrieve(is_usuario)
		dw_lista_obj.object.t_titulo.text='Objetos Inabilitados para Usuario: '+is_usuario
	end if
end if
end event

type dw_lista_obj from datawindow within w_perfil_usuario
integer x = 41
integer y = 1024
integer width = 2665
integer height = 796
integer taborder = 90
string dataobject = "dw_lista_por_usuario_perfil_objetos"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_obj	= row
	dw_lista_obj.scrolltorow(il_row_obj)
end if
end event

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
dw_lista_obj.accepttext()
if dw_lista_obj.getrow() > 0 then
	il_row_obj	= dw_lista_obj.getrow()
	ls_ventana	= dw_lista_obj.getitemstring(il_row_obj,'perfil_objeto_ventana')
	ls_tipo		= dw_lista_obj.getitemstring(il_row_obj,'perfil_objeto_tipo')
	ll_objeto	= dw_lista_obj.getitemnumber(il_row_obj,'perfil_usuario_correlativo_objeto')
	if ls_ventana<>'' and ls_tipo<>'' and ll_objeto>0 and not isnull(ls_ventana) and not isnull(ls_tipo) and not isnull(ll_objeto) then
		if dw_lista_obj.update()=1 then
			commit;
		else
			rollback;
		end if
	end if
end if
end event

event rowfocuschanged;string	ls_ventana, ls_tipo
if dw_lista_obj.getrow()>0 then 
	il_row_obj	= dw_lista_obj.getrow()
	dw_lista_obj.scrolltorow(il_row_obj)
	ls_ventana	= dw_lista_obj.getitemstring(il_row_obj,'perfil_objeto_ventana')
	ls_tipo		= dw_lista_obj.getitemstring(il_row_obj,'perfil_objeto_tipo')
	if not isnull(ls_tipo) and not isnull(ls_ventana) and ls_tipo<>'' and ls_ventana<>'' then
		idw_detalle.retrieve(ls_tipo,ls_ventana)
	end if
end if
end event

event dragdrop;Long		ll_codigo,ll_corr_obj,ll_max_reg,ll_new,ll_acepta,ll_corr=0,ll_cod_obj=0
Long		ll_indi, ll_tot_reg
String	ls_func, ls_tipo, ls_ventana

if trim(em_usuario.text)<>'' and not isnull(trim(em_usuario.text)) then
	is_usuario	= trim(em_usuario.text)
end if
control_dw = DraggedObject()
if il_row_depto > 0 then //control_dw = dw_lista_areas and 
	if em_usuario.enabled=true and (trim(em_usuario.text)='' or isnull(em_usuario.text)) then
		is_usuario	= trim(dw_encargados.getitemstring(il_row,'codigo_usuario'))
	end if
	ll_codigo	= dw_lista_areas.getitemnumber(il_row_depto,'codigo')
	ls_func		= dw_lista_areas.getitemstring(il_row_depto,'func_perfil_depto')
	if ls_func='S' then
		ll_acepta	= messagebox("Advertencia","Está Seguro de Asignar Perfil Depto. "+dw_lista_areas.getitemstring(dw_lista_areas.getrow(),'departamento')+", recuerde será eliminado Perfil Anterior",exclamation!,YesNo!)
		if ll_acepta=1 then
			ll_tot_reg	= dw_lista_obj.rowcount()
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					dw_lista_obj.deleterow(1)
				next
				if dw_lista_obj.update()=1 then
					commit;
				else
					rollback;
				end if
			end if
			SELECT 	MAX("PERFIL_USUARIO"."CORRELATIVO")  
			INTO 		:ll_max_reg  
			FROM 		"PERFIL_USUARIO"  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if isnull(ll_max_reg) or ll_max_reg=0 then
					ll_max_reg	= 1
				else
					ll_max_reg++
				end if
			else
				ll_max_reg	= 1
			end if
			DECLARE x1 CURSOR FOR  
			SELECT	"PERFIL_OBJETO_DEPTO"."CORRELATIVO_OBJETO",   
						"PERFIL_OBJETO"."TIPO",   
						"PERFIL_OBJETO"."VENTANA"  
			FROM 		"PERFIL_OBJETO_DEPTO",   
						"PERFIL_OBJETO"  
			WHERE  ( "PERFIL_OBJETO_DEPTO"."CORRELATIVO_OBJETO" = "PERFIL_OBJETO"."CORRELARIVO" ) and  
					 ( "PERFIL_OBJETO"."APLICACION" = 1 ) AND
					 (("PERFIL_OBJETO_DEPTO"."CODIGO_DEPTO" = :ll_codigo ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				open x1;
				DO WHILE sqlca.sqlcode=0
					setnull(ll_corr_obj);setnull(ls_tipo);setnull(ls_ventana)
					fetch x1 into :ll_corr_obj, :ls_tipo, :ls_ventana;
					if ll_corr_obj>0 and not isnull(ls_tipo) and not isnull(ls_ventana) then
						ll_new	= dw_lista_obj.insertrow(0)
						dw_lista_obj.scrolltorow(ll_new)
						dw_lista_obj.setitem(ll_new,'perfil_objeto_ventana',ls_ventana)
						dw_lista_obj.setitem(ll_new,'perfil_objeto_tipo',ls_tipo)
						dw_lista_obj.setitem(ll_new,'perfil_usuario_correlativo',ll_max_reg)
						dw_lista_obj.setitem(ll_new,'perfil_usuario_correlativo_objeto',ll_corr_obj)
						dw_lista_obj.setitem(ll_new,'perfil_usuario_usuario',is_usuario)
						dw_lista_obj.accepttext()
						ll_max_reg++
					end if
				LOOP
				close x1;
				if dw_lista_obj.update()=1 then
					commit;
				else
					rollback;
				end if
			end if
		end if
	else
		messagebox("Advertencia","Departamento Seleccionado NO tiene Perfil de Usuario")
	end if
end if
end event

