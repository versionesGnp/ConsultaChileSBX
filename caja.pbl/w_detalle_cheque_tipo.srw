forward
global type w_detalle_cheque_tipo from window
end type
type cb_exportar from commandbutton within w_detalle_cheque_tipo
end type
type dw_cajas from datawindow within w_detalle_cheque_tipo
end type
type st_2 from statictext within w_detalle_cheque_tipo
end type
type p_1 from picture within w_detalle_cheque_tipo
end type
type cb_3 from commandbutton within w_detalle_cheque_tipo
end type
type st_1 from statictext within w_detalle_cheque_tipo
end type
type em_1 from editmask within w_detalle_cheque_tipo
end type
type cb_2 from commandbutton within w_detalle_cheque_tipo
end type
type cb_1 from commandbutton within w_detalle_cheque_tipo
end type
type cb_elim from commandbutton within w_detalle_cheque_tipo
end type
type dw_1 from datawindow within w_detalle_cheque_tipo
end type
end forward

global type w_detalle_cheque_tipo from window
integer y = 436
integer width = 3360
integer height = 1824
boolean titlebar = true
string title = "Ventas Dia Caja"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_exportar cb_exportar
dw_cajas dw_cajas
st_2 st_2
p_1 p_1
cb_3 cb_3
st_1 st_1
em_1 em_1
cb_2 cb_2
cb_1 cb_1
cb_elim cb_elim
dw_1 dw_1
end type
global w_detalle_cheque_tipo w_detalle_cheque_tipo

event close;//int ver
//string fecha1,fecha2
//date fecha3
//double folio_aux
//string select_string
//date pupi
//
//ver=messagebox("Mensaje","Desea borrar los registros del día ",information!,yesno!,2)
//
//if ver = 1 then
// 	pupi=date(em_1.text)      
//	fecha3 = date(String(pupi,'dd/mm/yyyy'))
//   DELETE FROM "INGRE"  
//   WHERE ( "INGRE"."FECHA_PAGO" = :fecha3 )  AND  ( "INGRE"."COD_CAJA" = :gs_caja) AND  ( "INGRE"."REZAGO" = ' ' or "INGRE"."REZAGO" = '') ;
//	CHOOSE CASE sqlca.sqlcode
//		CASE 0
//			messagebox('bien1','bien')
//			commit;
//		CASE 100
//			messagebox('no1','no')
//		CASE -1
//			messagebox('Error1',sqlca.SQLErrText	,information!)		
//	END CHOOSE	
//
//
//   DELETE FROM "DOC_COB"  
//   WHERE ( "DOC_COB"."FECHA_PAGO" = :fecha3 )   AND  ( "DOC_COB"."COD_CAJA" = :gs_caja) AND ( "DOC_COB"."REZAGO"= ' ' or "DOC_COB"."REZAGO" = '') ;
//	CHOOSE CASE sqlca.sqlcode
//	CASE 0
//		messagebox('bien2','bien')
//		commit;
//	CASE 100
//		messagebox('no2','no')
//	CASE -1
//		messagebox('Error2',sqlca.SQLErrText	,information!)		
//END CHOOSE
//end if		  
//
end event

event open;LONG 		VER,er1
string 	mod_string,texto_dw,rc
datawindowchild dw_tipo_doc,dw_tipo_total,dw_tipo_pago,dw_detalle_cheque
datetime fecha_aux

gf_centrar(w_detalle_cheque_tipo)
DW_1.SETtRANSOBJECT(SQLCA)
fecha_aux	= datetime(today())
em_1.text 	= String(Today(), "dd/mm/yyyy")
if gs_depto='T' or gs_depto='I' or gs_depto='C' then
	dw_cajas.visible	= true
	dw_cajas.settransobject(sqlca)
	dw_cajas.insertrow(0)
	dw_cajas.setfocus()
else
	dw_cajas.visible	= false
	em_1.setfocus()
end if
end event

on w_detalle_cheque_tipo.create
this.cb_exportar=create cb_exportar
this.dw_cajas=create dw_cajas
this.st_2=create st_2
this.p_1=create p_1
this.cb_3=create cb_3
this.st_1=create st_1
this.em_1=create em_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_elim=create cb_elim
this.dw_1=create dw_1
this.Control[]={this.cb_exportar,&
this.dw_cajas,&
this.st_2,&
this.p_1,&
this.cb_3,&
this.st_1,&
this.em_1,&
this.cb_2,&
this.cb_1,&
this.cb_elim,&
this.dw_1}
end on

on w_detalle_cheque_tipo.destroy
destroy(this.cb_exportar)
destroy(this.dw_cajas)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_elim)
destroy(this.dw_1)
end on

type cb_exportar from commandbutton within w_detalle_cheque_tipo
integer x = 946
integer y = 1596
integer width = 352
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_1
if dw_1.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type dw_cajas from datawindow within w_detalle_cheque_tipo
integer x = 507
integer y = 220
integer width = 480
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_de_cajas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_1.reset()

end event

type st_2 from statictext within w_detalle_cheque_tipo
integer x = 402
integer y = 24
integer width = 1632
integer height = 152
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Detalle Cheque al Dia"
boolean focusrectangle = false
end type

type p_1 from picture within w_detalle_cheque_tipo
integer x = 32
integer y = 32
integer width = 352
integer height = 324
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_detalle_cheque_tipo
integer x = 1989
integer y = 220
integer width = 347
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&onsultar"
end type

event clicked;long 		ver
DATE 		MIAR
STRING 	ls_caja,COMPA='O'

MIAR 				= DATE(EM_1.TEXT)
if dw_cajas.visible= true then
	ls_caja		= dw_cajas.getitemstring(1,'caja')
	if not isnull(ls_caja) then
		DW_1.RETRIEVE(ls_caja, miar,ls_caja)
	else
		messagebox("Advertencia","Debe Seleccionar CAJA")
		dw_cajas.setfocus()
	end if
else
	if DW_1.RETRIEVE(gs_caja, miar,gs_caja)=0 then
		MESSAGEBOX("Informacion","No Registra Dato")
	end if
end if
end event

type st_1 from statictext within w_detalle_cheque_tipo
integer x = 1024
integer y = 236
integer width = 453
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha de Caja :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_1 from editmask within w_detalle_cheque_tipo
integer x = 1490
integer y = 224
integer width = 443
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
string displaydata = "~b"
double increment = 1
end type

event modified;dw_1.reset()
end event

type cb_2 from commandbutton within w_detalle_cheque_tipo
integer x = 2953
integer y = 1600
integer width = 352
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

on clicked;close(parent)
end on

type cb_1 from commandbutton within w_detalle_cheque_tipo
integer x = 32
integer y = 1600
integer width = 352
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then f_printdlg(dw_1,gstr_print,w_detalle_cheque_tipo)
end event

type cb_elim from commandbutton within w_detalle_cheque_tipo
boolean visible = false
integer x = 1518
integer y = 1596
integer width = 306
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Elimina"
boolean cancel = true
end type

event clicked;int ver
dw_1.deleterow(dw_1.getrow())
ver=dw_1.update()
if ver < 1 then
	rollback using sqlca;
else
	commit;
end if
end event

type dw_1 from datawindow within w_detalle_cheque_tipo
integer x = 32
integer y = 384
integer width = 3273
integer height = 1184
integer taborder = 40
string dataobject = "detalle_cheque_tipo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

