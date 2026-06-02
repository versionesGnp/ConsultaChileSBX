forward
global type w_mantenedor_fi_asistente from window
end type
type cb_imprimir from commandbutton within w_mantenedor_fi_asistente
end type
type cb_filtrar from commandbutton within w_mantenedor_fi_asistente
end type
type cb_exportar from commandbutton within w_mantenedor_fi_asistente
end type
type cb_ordenar from commandbutton within w_mantenedor_fi_asistente
end type
type cb_limpiar from commandbutton within w_mantenedor_fi_asistente
end type
type cb_inactivar from commandbutton within w_mantenedor_fi_asistente
end type
type cb_grabar from commandbutton within w_mantenedor_fi_asistente
end type
type cb_nuevo from commandbutton within w_mantenedor_fi_asistente
end type
type cb_cerrar from commandbutton within w_mantenedor_fi_asistente
end type
type pb_ok from picturebutton within w_mantenedor_fi_asistente
end type
type dw_parque from datawindow within w_mantenedor_fi_asistente
end type
type st_16 from statictext within w_mantenedor_fi_asistente
end type
type dw_mantenedor from datawindow within w_mantenedor_fi_asistente
end type
type gb_1 from groupbox within w_mantenedor_fi_asistente
end type
end forward

global type w_mantenedor_fi_asistente from window
integer width = 3150
integer height = 1676
boolean titlebar = true
string title = "Mantenedor Asistente Parque"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_imprimir cb_imprimir
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_limpiar cb_limpiar
cb_inactivar cb_inactivar
cb_grabar cb_grabar
cb_nuevo cb_nuevo
cb_cerrar cb_cerrar
pb_ok pb_ok
dw_parque dw_parque
st_16 st_16
dw_mantenedor dw_mantenedor
gb_1 gb_1
end type
global w_mantenedor_fi_asistente w_mantenedor_fi_asistente

type variables
String		is_nuevo='N'
Long		il_fila
end variables

on w_mantenedor_fi_asistente.create
this.cb_imprimir=create cb_imprimir
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_limpiar=create cb_limpiar
this.cb_inactivar=create cb_inactivar
this.cb_grabar=create cb_grabar
this.cb_nuevo=create cb_nuevo
this.cb_cerrar=create cb_cerrar
this.pb_ok=create pb_ok
this.dw_parque=create dw_parque
this.st_16=create st_16
this.dw_mantenedor=create dw_mantenedor
this.gb_1=create gb_1
this.Control[]={this.cb_imprimir,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_ordenar,&
this.cb_limpiar,&
this.cb_inactivar,&
this.cb_grabar,&
this.cb_nuevo,&
this.cb_cerrar,&
this.pb_ok,&
this.dw_parque,&
this.st_16,&
this.dw_mantenedor,&
this.gb_1}
end on

on w_mantenedor_fi_asistente.destroy
destroy(this.cb_imprimir)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_limpiar)
destroy(this.cb_inactivar)
destroy(this.cb_grabar)
destroy(this.cb_nuevo)
destroy(this.cb_cerrar)
destroy(this.pb_ok)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.dw_mantenedor)
destroy(this.gb_1)
end on

event open;Long		ll_parque

gf_centrar(w_mantenedor_fi_asistente)
dw_mantenedor.settransobject(sqlca)
dw_parque.settransobject(sqlca)

dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque				= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_parque				= 11
end if
dw_parque.setitem(1,'cod_parque',ll_parque)
dw_mantenedor.retrieve(ll_parque)
end event

type cb_imprimir from commandbutton within w_mantenedor_fi_asistente
integer x = 2395
integer y = 1408
integer width = 219
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_mantenedor.rowcount() > 0 then
	f_Print( dw_mantenedor )
end if
end event

type cb_filtrar from commandbutton within w_mantenedor_fi_asistente
integer x = 1765
integer y = 1408
integer width = 219
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_mantenedor.SETfilter(NULO)
dw_mantenedor.filter()
end event

type cb_exportar from commandbutton within w_mantenedor_fi_asistente
integer x = 1989
integer y = 1408
integer width = 219
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_mantenedor
if dw_mantenedor.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_ordenar from commandbutton within w_mantenedor_fi_asistente
integer x = 1522
integer y = 1408
integer width = 238
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_mantenedor.rowcount() > 0 then
	setnull (nulo)
	dw_mantenedor.SETSORT(NULO)
	dw_mantenedor.SORT()
end if
end event

type cb_limpiar from commandbutton within w_mantenedor_fi_asistente
integer x = 1038
integer y = 1408
integer width = 311
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_mantenedor.reset()
is_nuevo				= 'N'
end event

type cb_inactivar from commandbutton within w_mantenedor_fi_asistente
boolean visible = false
integer x = 704
integer y = 1408
integer width = 311
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Inactivar"
end type

event clicked;Long		ll_cod_parque, ll_fila

dw_mantenedor.accepttext()
dw_parque.accepttext()
ll_cod_parque		= dw_parque.getitemnumber(1,'cod_parque')
ll_fila					= dw_mantenedor.getrow()
if ll_cod_parque > 0 and ll_fila > 0 then
	dw_mantenedor.setitem(ll_fila,'estado_reg','I')
	dw_mantenedor.accepttext()
	messagebox("Inactivar","Asistente Inactivado, Recuerde Grabar Cambios")
end if
	
	
end event

type cb_grabar from commandbutton within w_mantenedor_fi_asistente
integer x = 370
integer y = 1408
integer width = 311
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Long		ll_new, ll_indi, ll_tot_reg,ll_cod_parque
String		ls_cod_asis,ls_nom_asis,ls_pasa

dw_mantenedor.accepttext()
dw_parque.accepttext()
ll_tot_reg			= dw_mantenedor.rowcount()
ll_cod_parque		= dw_parque.getitemnumber(1,'cod_parque')
if ll_cod_parque > 0 then
	ls_pasa				= 'S'
	if ll_tot_reg > 0 then
		for ll_indi = 1 to ll_tot_reg
			ls_cod_asis	= dw_mantenedor.getitemstring(ll_indi,'codigo_asistente')
			ls_nom_asis	= dw_mantenedor.getitemstring(ll_indi,'nombre_asistente')
			if isnull(ls_cod_asis) or ls_cod_asis='' then
				messagebox("Advertencia","Debe Ingresar Codigo Asistente en Fila "+string(ll_indi))
				dw_mantenedor.setfocus()
				dw_mantenedor.scrolltorow(ll_indi)
				dw_mantenedor.setcolumn('codigo_asistente')
				ls_pasa	= 'N'
				exit
			elseif isnull(ls_nom_asis) or ls_nom_asis='' then
				messagebox("Advertencia","Debe Ingresar Nombre Asistente en Fila "+string(ll_indi))
				dw_mantenedor.setfocus()
				dw_mantenedor.scrolltorow(ll_indi)
				dw_mantenedor.setcolumn('nombre_asistente')
				ls_pasa	= 'N'
				exit
			end if
		next
		if ls_pasa='S' then
			if dw_mantenedor.update()=1 then
				commit;
				messagebox("Grabar","Grabación Exitosa")
				is_nuevo				= 'N'
				pb_ok.triggerevent(clicked!)
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
end if
end event

type cb_nuevo from commandbutton within w_mantenedor_fi_asistente
integer x = 37
integer y = 1408
integer width = 311
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;Long		ll_new, ll_indi, ll_tot_reg,ll_cod_parque
String		ls_cod_asis,ls_nom_asis,ls_pasa

is_nuevo				= 'S'
dw_mantenedor.accepttext()
dw_parque.accepttext()
ll_tot_reg			= dw_mantenedor.rowcount()
ll_cod_parque		= dw_parque.getitemnumber(1,'cod_parque')
if ll_cod_parque > 0 then
	ls_pasa				= 'S'
	if ll_tot_reg > 0 then
		for ll_indi = 1 to ll_tot_reg
			ls_cod_asis	= dw_mantenedor.getitemstring(ll_indi,'codigo_asistente')
			ls_nom_asis	= dw_mantenedor.getitemstring(ll_indi,'nombre_asistente')
			if isnull(ls_cod_asis) then
				messagebox("Advertencia","Debe Ingresar Codigo Asistente en Fila "+string(ll_indi))
				dw_mantenedor.setfocus()
				dw_mantenedor.scrolltorow(ll_indi)
				dw_mantenedor.setcolumn('codigo_asistente')
				ls_pasa	= 'N'
				exit
			elseif isnull(ls_nom_asis) then
				messagebox("Advertencia","Debe Ingresar Nombre Asistente en Fila "+string(ll_indi))
				dw_mantenedor.setfocus()
				dw_mantenedor.scrolltorow(ll_indi)
				dw_mantenedor.setcolumn('nombre_asistente')
				ls_pasa	= 'N'
				exit
			end if
		next
		if ls_pasa='S' then
			ll_new				= dw_mantenedor.insertrow(0)
			dw_mantenedor.setfocus()
			dw_mantenedor.scrolltorow(ll_new)
			dw_mantenedor.setitem(ll_new,'cod_parque',ll_cod_parque)
			dw_mantenedor.setitem(ll_new,'estado_reg','A')
			dw_mantenedor.accepttext()
			dw_mantenedor.setcolumn('codigo_asistente')
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_mantenedor_fi_asistente
integer x = 2747
integer y = 1408
integer width = 311
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_mantenedor_fi_asistente)
end event

type pb_ok from picturebutton within w_mantenedor_fi_asistente
integer x = 1184
integer y = 20
integer width = 151
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Long		ll_cod_parque

ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
is_nuevo			= 'N'
if ll_cod_parque>0 then
	if dw_mantenedor.retrieve(ll_cod_parque)=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
else
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_parque.setfocus()
end if
end event

type dw_parque from datawindow within w_mantenedor_fi_asistente
integer x = 503
integer y = 40
integer width = 594
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.accepttext()
dw_mantenedor.reset()
pb_ok.triggerevent(clicked!)
end event

type st_16 from statictext within w_mantenedor_fi_asistente
integer x = 14
integer y = 56
integer width = 457
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Seleccione Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_mantenedor from datawindow within w_mantenedor_fi_asistente
integer x = 41
integer y = 200
integer width = 3017
integer height = 1156
integer taborder = 30
string title = "none"
string dataobject = "dw_mantenedor_asistente_implementacion"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String		ls_columna,ls_estado,ls_cod_asis,ls_nom_asis

dw_mantenedor.accepttext()
ls_columna			= dwo.name
if ls_columna='codigo_asistente' and is_nuevo = 'S' then
	il_fila				= this.getrow()
	ls_cod_asis		= dw_mantenedor.getitemstring(il_fila,'codigo_asistente')
	SELECT 	"FICHA_IMPLEMENTACION_ASISTENTE"."ESTADO_REG"  
	INTO 		:ls_estado  
	FROM 	"FICHA_IMPLEMENTACION_ASISTENTE"  
	WHERE 	"FICHA_IMPLEMENTACION_ASISTENTE"."CODIGO_ASISTENTE" = :ls_cod_asis   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		messagebox("Advertencia","Codigo Asistente ya Existe")
	end if

elseif ls_columna = 'nombre_asistente'  and is_nuevo = 'S' then
	il_fila				= this.getrow()
	ls_nom_asis		= dw_mantenedor.getitemstring(il_fila,'nombre_asistente')
	SELECT 	"FICHA_IMPLEMENTACION_ASISTENTE"."ESTADO_REG"  
	INTO 		:ls_estado  
	FROM 	"FICHA_IMPLEMENTACION_ASISTENTE"  
	WHERE 	"FICHA_IMPLEMENTACION_ASISTENTE"."NOMBRE_ASISTENTE" = :ls_nom_asis   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		messagebox("Advertencia","Nombre Asistente ya Existe")
	end if
end if
end event

event itemfocuschanged;String		ls_columna,ls_estado,ls_cod_asis,ls_nom_asis,ls_nulo

dw_mantenedor.accepttext()
Setnull(ls_nulo)
ls_columna			= dwo.name
if is_nuevo = 'S' then
	ls_cod_asis		= dw_mantenedor.getitemstring(il_fila,'codigo_asistente')
	if not isnull(ls_cod_asis) and ls_cod_asis <> '' then
		SELECT 	"FICHA_IMPLEMENTACION_ASISTENTE"."ESTADO_REG"  
		INTO 		:ls_estado  
		FROM 	"FICHA_IMPLEMENTACION_ASISTENTE"  
		WHERE 	"FICHA_IMPLEMENTACION_ASISTENTE"."CODIGO_ASISTENTE" = :ls_cod_asis   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			dw_mantenedor.setitem(il_fila,'codigo_asistente',ls_nulo)
			dw_mantenedor.accepttext()
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('codigo_asistente')
		end if
	end if

	ls_nom_asis		= dw_mantenedor.getitemstring(il_fila,'nombre_asistente')
	if not isnull(ls_nom_asis) and ls_nom_asis <> '' then
		SELECT 	"FICHA_IMPLEMENTACION_ASISTENTE"."ESTADO_REG"  
		INTO 		:ls_estado  
		FROM 	"FICHA_IMPLEMENTACION_ASISTENTE"  
		WHERE 	"FICHA_IMPLEMENTACION_ASISTENTE"."NOMBRE_ASISTENTE" = :ls_nom_asis   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			dw_mantenedor.setitem(il_fila,'nombre_asistente',ls_nulo)
			dw_mantenedor.accepttext()
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('nombre_asistente')
		end if
	end if
end if
end event

type gb_1 from groupbox within w_mantenedor_fi_asistente
integer x = 1495
integer y = 1356
integer width = 1147
integer height = 172
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

