forward
global type w_mantenedor_uf from window
end type
type st_texto from statictext within w_mantenedor_uf
end type
type dw_mantenedor_uf from datawindow within w_mantenedor_uf
end type
type cb_cancelar from commandbutton within w_mantenedor_uf
end type
type cb_aceptar from commandbutton within w_mantenedor_uf
end type
type cb_borrar from commandbutton within w_mantenedor_uf
end type
type cb_insertar from commandbutton within w_mantenedor_uf
end type
type cb_ver_todo from commandbutton within w_mantenedor_uf
end type
type gb_1 from groupbox within w_mantenedor_uf
end type
type st_falta from multilineedit within w_mantenedor_uf
end type
end forward

global type w_mantenedor_uf from window
integer x = 1074
integer y = 484
integer width = 1938
integer height = 1392
boolean titlebar = true
string title = "Mantenedor U.F."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
st_texto st_texto
dw_mantenedor_uf dw_mantenedor_uf
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
cb_borrar cb_borrar
cb_insertar cb_insertar
cb_ver_todo cb_ver_todo
gb_1 gb_1
st_falta st_falta
end type
global w_mantenedor_uf w_mantenedor_uf

type variables
Datetime	ldt_fecha_max
end variables

on w_mantenedor_uf.create
this.st_texto=create st_texto
this.dw_mantenedor_uf=create dw_mantenedor_uf
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.cb_borrar=create cb_borrar
this.cb_insertar=create cb_insertar
this.cb_ver_todo=create cb_ver_todo
this.gb_1=create gb_1
this.st_falta=create st_falta
this.Control[]={this.st_texto,&
this.dw_mantenedor_uf,&
this.cb_cancelar,&
this.cb_aceptar,&
this.cb_borrar,&
this.cb_insertar,&
this.cb_ver_todo,&
this.gb_1,&
this.st_falta}
end on

on w_mantenedor_uf.destroy
destroy(this.st_texto)
destroy(this.dw_mantenedor_uf)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.cb_borrar)
destroy(this.cb_insertar)
destroy(this.cb_ver_todo)
destroy(this.gb_1)
destroy(this.st_falta)
end on

event open;Date		ld_fecha,ld_fecha_hoy,ld_fecha_aux,ld_fecha_aux2,ld_fecha_ini
Long		ll_new,ll_sw=0

if isvalid(w_ingreso2) then w_ingreso2.enabled		= false
st_falta.text			= ''
gf_centrar(w_mantenedor_uf)
SELECT	MAX("TAB_UF"."FECHA_UF")  
INTO 		:ldt_fecha_max  
FROM 		"TAB_UF"  
USING		sqlca;
ld_fecha_ini		= RelativeDate(date(ldt_fecha_max), 1)
if sqlca.sqlcode=0 then st_texto.text	= "Ultima U.F. registrada es con fecha del "+string(ldt_fecha_max,"dd/mm/yyyy")
ld_fecha	= RelativeDate(date(ldt_fecha_max), -5)
dw_mantenedor_uf.SetTransObject(SQLCA)
if ldt_fecha_max < fechasys then
	ld_fecha_hoy	= date(fechasys)
	st_falta.text	= 'Falta ingresar U.F. de hoy:  '+string(ld_fecha_hoy,"dd/mm/yyyy")
	ll_sw ++
end if
dw_mantenedor_uf.Retrieve(ld_fecha)
dw_mantenedor_uf.setsort("fecha_uf A")
dw_mantenedor_uf.sort()
dw_mantenedor_uf.setfocus()
dw_mantenedor_uf.scrolltorow(dw_mantenedor_uf.rowcount())
if ll_sw>0 then
	ld_fecha_aux	= date(ldt_fecha_max)
	DO WHILE ld_fecha_aux < ld_fecha_hoy
		ll_sw ++
		ld_fecha_aux2	= ld_fecha_aux
		ld_fecha_aux	= RelativeDate(ld_fecha_aux2, 1)
		ll_new			= dw_mantenedor_uf.insertrow(0)
		dw_mantenedor_uf.scrolltorow(ll_new)
		dw_mantenedor_uf.setfocus()
		dw_mantenedor_uf.setitem(ll_new,'fecha_uf',ld_fecha_aux)
		dw_mantenedor_uf.setcolumn('valor_uf')
		dw_mantenedor_uf.accepttext()
	LOOP
end if
if ll_sw > 2 then
	st_falta.text	= ''
	st_falta.text	= 'Falta ingresar U.F. desde el:  '+string(ld_fecha_ini,"dd/mm/yyyy") + ' al '+string(ld_fecha_hoy,"dd/mm/yyyy")
end if
gs_ventana	= 'w_mantenedor_uf'
f_valida_objeto()
end event

event close;if isvalid(w_ingreso2) then w_ingreso2.enabled	= true
end event

type st_texto from statictext within w_mantenedor_uf
integer x = 46
integer y = 32
integer width = 1810
integer height = 192
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type dw_mantenedor_uf from datawindow within w_mantenedor_uf
integer x = 46
integer y = 272
integer width = 1225
integer height = 784
integer taborder = 10
string dataobject = "d_mantenedor_uf"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String	ls_columna
this.accepttext()
//'fecha_uf'
end event

event losefocus;dw_mantenedor_uf.accepttext()
end event

type cb_cancelar from commandbutton within w_mantenedor_uf
integer x = 1381
integer y = 1108
integer width = 439
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_mantenedor_uf)
end event

type cb_aceptar from commandbutton within w_mantenedor_uf
integer x = 1381
integer y = 844
integer width = 439
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long 		filas,ll_tot_reg,ll_indi,ll_pasa=0
Date		ld_fecha,ld_fecha_dia
Double	lld_uf

ll_tot_reg				= dw_mantenedor_uf.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ld_fecha			= date(dw_mantenedor_uf.getitemdatetime(ll_indi,'fecha_uf'))
		lld_uf				= dw_mantenedor_uf.getitemnumber(ll_indi,'valor_uf')
		if isnull(ld_fecha) then
			messagebox("Advertencia","Fecha Inválida Fila Nº "+string(ll_indi))
			dw_mantenedor_uf.setfocus()
			dw_mantenedor_uf.scrolltorow(ll_indi)
			dw_mantenedor_uf.setcolumn('fecha_uf')
			ll_pasa ++
			exit
		elseif isnull(lld_uf) or lld_uf<=0 then
			messagebox("Advertencia","Valor U.F. Inválido Fila Nº "+string(ll_indi))
			dw_mantenedor_uf.setfocus()
			dw_mantenedor_uf.scrolltorow(ll_indi)
			dw_mantenedor_uf.setcolumn('valor_uf')
			ll_pasa ++
			exit
		end if
	next
end if
if ll_pasa=0 then
	filas					= dw_mantenedor_uf.Update()
	IF filas > 0 THEN
		messagebox("Grabar","Grabación Exitosa")
		Commit;
		ld_fecha_dia	= date(gdt_fec_sistema)
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:gd_uf_dia  
		FROM 	"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ld_fecha_dia   
		USING	sqlca;
		if gs_conexion = "Parque El Prado" then
			if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Prado / Manantial / Santiago )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
		elseif gs_conexion = "Parque La Foresta" then
			if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Foresta )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
		elseif gs_conexion = "Parque Concepción" then
			if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Foresta )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
		end if
		Close(w_mantenedor_uf)
	ELSE
		rollback;
	END IF
end if
end event

type cb_borrar from commandbutton within w_mantenedor_uf
integer x = 1381
integer y = 428
integer width = 439
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Date	ld_fecha
long	ll_resp
IF dw_mantenedor_uf.RowCount() > 0 THEN
	ld_fecha	= date(dw_mantenedor_uf.getitemdatetime(dw_mantenedor_uf.getrow(),'fecha_uf'))
	ll_resp	= MessageBox("Advertencia", "Está Seguro de Eliminar Fila Nº "+string(dw_mantenedor_uf.getrow(),"###,###,###,###"), &
				  Exclamation!, YesNo!, 2)
	IF ll_resp = 1 THEN
		dw_mantenedor_uf.DeleteRow(dw_mantenedor_uf.GetRow())
	END IF
END IF
end event

type cb_insertar from commandbutton within w_mantenedor_uf
integer x = 1381
integer y = 316
integer width = 439
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Insertar"
end type

event clicked;long		ll_indi,ll_tot_reg,ll_new,ll_pasa=0
Date		ld_fecha
Double	lld_uf

ll_tot_reg	= dw_mantenedor_uf.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ld_fecha	= date(dw_mantenedor_uf.getitemdatetime(ll_indi,'fecha_uf'))
		lld_uf	= dw_mantenedor_uf.getitemnumber(ll_indi,'valor_uf')
		if isnull(ld_fecha) then
			messagebox("Advertencia","Fecha Inválida Fila Nº "+string(ll_indi))
			dw_mantenedor_uf.setfocus()
			dw_mantenedor_uf.scrolltorow(ll_indi)
			dw_mantenedor_uf.setcolumn('fecha_uf')
			ll_pasa ++
			exit
		elseif isnull(lld_uf) or lld_uf<=0 then
			messagebox("Advertencia","Valor U.F. Inválido Fila Nº "+string(ll_indi))
			dw_mantenedor_uf.setfocus()
			dw_mantenedor_uf.scrolltorow(ll_indi)
			dw_mantenedor_uf.setcolumn('valor_uf')
			ll_pasa ++
			exit
		end if
	next
end if
if ll_pasa=0 then
	ll_new	= dw_mantenedor_uf.InsertRow(0)
	dw_mantenedor_uf.setfocus()
	dw_mantenedor_uf.scrolltorow(ll_new)
	dw_mantenedor_uf.setcolumn('fecha_uf')
end if
end event

type cb_ver_todo from commandbutton within w_mantenedor_uf
integer x = 1381
integer y = 636
integer width = 439
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Ver Todo"
end type

event clicked;Date		ld_fecha=date("01/01/1900")

if cb_ver_todo.text='Ver Todo' then
	dw_mantenedor_uf.Retrieve(ld_fecha)
	dw_mantenedor_uf.setsort("fecha_uf D")
	dw_mantenedor_uf.sort()
	cb_ver_todo.text	= 'Volver Inicio'
	dw_mantenedor_uf.setfocus()
else
	ld_fecha				= RelativeDate(date(ldt_fecha_max), -5)
	dw_mantenedor_uf.Retrieve(ld_fecha)
	dw_mantenedor_uf.setsort("fecha_uf A")
	cb_ver_todo.text	= 'Ver Todo'	
	dw_mantenedor_uf.sort()
end if
end event

type gb_1 from groupbox within w_mantenedor_uf
integer x = 1326
integer y = 244
integer width = 549
integer height = 1020
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_falta from multilineedit within w_mantenedor_uf
integer x = 46
integer y = 1076
integer width = 1225
integer height = 188
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
boolean border = false
alignment alignment = center!
boolean displayonly = true
boolean hideselection = false
end type

