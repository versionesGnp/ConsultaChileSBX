forward
global type w_ingreso_bl_nulas from window
end type
type cbx_1 from checkbox within w_ingreso_bl_nulas
end type
type cerrar from commandbutton within w_ingreso_bl_nulas
end type
type dw_1 from datawindow within w_ingreso_bl_nulas
end type
type cb_3 from commandbutton within w_ingreso_bl_nulas
end type
type cb_2 from commandbutton within w_ingreso_bl_nulas
end type
type cb_1 from commandbutton within w_ingreso_bl_nulas
end type
type gb_1 from groupbox within w_ingreso_bl_nulas
end type
end forward

global type w_ingreso_bl_nulas from window
integer width = 1147
integer height = 520
boolean titlebar = true
string title = "Ingreso de Boletas Nulas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cbx_1 cbx_1
cerrar cerrar
dw_1 dw_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_ingreso_bl_nulas w_ingreso_bl_nulas

type variables
integer il_fila,il_auto
end variables

on w_ingreso_bl_nulas.create
this.cbx_1=create cbx_1
this.cerrar=create cerrar
this.dw_1=create dw_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cbx_1,&
this.cerrar,&
this.dw_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_ingreso_bl_nulas.destroy
destroy(this.cbx_1)
destroy(this.cerrar)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;gf_centrar(w_ingreso_bl_nulas)
integer	i
date 		dt_hoy
dw_1.settransobject(sqlca)
dt_hoy	= today ()
dw_1.insertrow(0)
if dw_1.rowcount() >= 1 then
	dw_1.setitem( dw_1.rowcount() , 'tipo_mov' , 'W' )
	dw_1.setitem( dw_1.rowcount() , 'tipo_cob' , 'BL' )
	dw_1.setitem( dw_1.rowcount() , 'serie' , 'N' )
	dw_1.setitem( dw_1.rowcount() , 'contrato' , 0 )
	dw_1.setitem( dw_1.rowcount() , 'tipo_cob' , 'BL' )
	dw_1.setitem( dw_1.rowcount() , 'pago_hist' , 'A' )
	dw_1.setitem( dw_1.rowcount() , 'Base' , 'O' )
	dw_1.setitem( dw_1.rowcount() , 'rut' , 99 )
	dw_1.setitem( dw_1.rowcount() , 'cod_caja' , gs_caja )
	dw_1.setitem( dw_1.rowcount() , 'usuario' , gs_nombre_usuario )
	dw_1.setitem( dw_1.rowcount() , 'fecha_venc' , dt_hoy )
	dw_1.setitem( dw_1.rowcount() , 'fecha_pago' , dt_hoy )
	dw_1.setitem( dw_1.rowcount() , 'monto' , 0 )
	dw_1.setitem( dw_1.rowcount() , 'codigo_otro','0')
	if cbx_1.checked = true then
		if isnull(dw_1.getitemnumber(1,'folio')) then
			dw_1.setitem( dw_1.rowcount() , 'folio' , 1 )
			dw_1.accepttext ()
		elseif dw_1.getitemnumber(dw_1.rowcount() - 1,'folio') >= 1 then
			dw_1.setitem( dw_1.rowcount() , 'folio' , dw_1.getitemnumber(dw_1.rowcount() - 1,'folio') + 1 )
			dw_1.accepttext ()
		end if
	end if
end if
end event

type cbx_1 from checkbox within w_ingreso_bl_nulas
boolean visible = false
integer x = 439
integer y = 640
integer width = 622
integer height = 128
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Enumeración automática"
boolean checked = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long nulo,i

dw_1.accepttext ()
setnull(nulo)
if this.checked = false then
	for i = 1 to dw_1.rowcount()
		dw_1.setitem(i,'folio',nulo)
	next
elseif  this.checked = true then
	if isnull(dw_1.getitemnumber(1,'folio')) then
		for i = 1 to dw_1.rowcount()
			dw_1.setitem(i,'folio',i)
		next
	else
		for i = 2 to dw_1.rowcount()
			dw_1.setitem(i,'folio',dw_1.getitemnumber(i - 1,'folio') + 1)
		next
	end if
end if
dw_1.accepttext ()
end event

type cerrar from commandbutton within w_ingreso_bl_nulas
integer x = 686
integer y = 248
integer width = 347
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ingreso_bl_nulas)
end event

type dw_1 from datawindow within w_ingreso_bl_nulas
integer x = 91
integer y = 84
integer width = 558
integer height = 192
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_bl_nulas"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event clicked;il_fila = row
end event

event rowfocuschanged;This.SelectRow(0, FALSE)
This.SelectRow(getrow(), TRUE)
end event

event dberror;return (1)

end event

event losefocus;dw_1.accepttext ()
end event

event constructor;return 1
end event

event itemerror;return(1)
end event

type cb_3 from commandbutton within w_ingreso_bl_nulas
boolean visible = false
integer x = 37
integer y = 704
integer width = 347
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Borra Fila"
end type

event clicked;dw_1.deleterow(il_fila)
end event

type cb_2 from commandbutton within w_ingreso_bl_nulas
integer x = 686
integer y = 92
integer width = 347
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;long 	ret,i,folio
long	ll_tot_reg

dw_1.accepttext ()
ll_tot_reg	= dw_1.rowcount()
for i = 1 to ll_tot_reg
	if isnull(dw_1.getitemnumber(i,'folio')) then
		MessageBox("Falta N° de Folio", "No se puede ingresar Boleta Nula por que falta N° de Folio.",information!)
		dw_1.ScrollToRow(i)
		dw_1.setfocus()
		dw_1.setcolumn('folio')
		return
	end if
next
folio = dw_1.getitemnumber(1,'folio')
SELECT FOLIO INTO :folio FROM INGRESO WHERE ( FOLIO = :folio ) AND ( TIPO_COB = 'BL' OR TIPO_COB = 'B0') ;
if sqlca.sqlcode = 0 then
	MessageBox("Existe Folio", "El Folio de Boleta N°"+string(folio,'###,###,###,###')+" existe",information!)
	return
end if
ret	= MessageBox("Grabar", "Desea Grabar la Boletas Nulas",Question!, YesNoCancel! , 3)
if ret = 1 then
	if dw_1.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
		MessageBox("SQL error", SQLCA.SQLErrText)
	end if
elseif ret = 2 then
	close(w_ingreso_bl_nulas)
	else//	no hace nada
end if
end event

type cb_1 from commandbutton within w_ingreso_bl_nulas
boolean visible = false
integer x = 37
integer y = 608
integer width = 347
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Inserta Fila"
end type

event clicked;//integer i
//date dt_hoy
//
//dw_1.settransobject(sqlca)
//dt_hoy = today ()
//dw_1.insertrow(0)
//if dw_1.rowcount() >= 1 then
//	dw_1.setitem( dw_1.rowcount() , 'tipo_mov' , 'W' )
//	dw_1.setitem( dw_1.rowcount() , 'tipo_cob' , 'BL' )
//	dw_1.setitem( dw_1.rowcount() , 'serie' , 'N' )
//	dw_1.setitem( dw_1.rowcount() , 'contrato' , 0 )
//	dw_1.setitem( dw_1.rowcount() , 'tipo_cob' , 'BL' )
//	dw_1.setitem( dw_1.rowcount() , 'pago_hist' , 'A' )
//	dw_1.setitem( dw_1.rowcount() , 'Base' , 'O' )
//	dw_1.setitem( dw_1.rowcount() , 'rut' , 99 )
//	dw_1.setitem( dw_1.rowcount() , 'cod_caja' , gs_caja )
//	dw_1.setitem( dw_1.rowcount() , 'usuario' , gs_nombre_usuario )
//	dw_1.setitem( dw_1.rowcount() , 'fecha_venc' , dt_hoy )
//	dw_1.setitem( dw_1.rowcount() , 'fecha_pago' , dt_hoy )
//	dw_1.setitem( dw_1.rowcount() , 'monto' , 0 )
//	if cbx_1.checked = true then
//		if isnull(dw_1.getitemnumber(1,'folio')) then
//			dw_1.setitem( dw_1.rowcount() , 'folio' , 1 )
//			dw_1.accepttext ()
//		elseif dw_1.getitemnumber(dw_1.rowcount() - 1,'folio') >= 1 then
//			dw_1.setitem( dw_1.rowcount() , 'folio' , dw_1.getitemnumber(dw_1.rowcount() - 1,'folio') + 1 )
//			dw_1.accepttext ()
//		end if
//	end if
//end if
//
end event

type gb_1 from groupbox within w_ingreso_bl_nulas
integer x = 37
integer y = 8
integer width = 1061
integer height = 384
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

