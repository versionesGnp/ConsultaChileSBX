forward
global type w_promesas_lib from window
end type
type cb_1 from commandbutton within w_promesas_lib
end type
type st_1 from statictext within w_promesas_lib
end type
type dw_1 from datawindow within w_promesas_lib
end type
type cb_graba from commandbutton within w_promesas_lib
end type
type cb_busca from commandbutton within w_promesas_lib
end type
type cb_cerrar from commandbutton within w_promesas_lib
end type
type cb_elimina from commandbutton within w_promesas_lib
end type
end forward

global type w_promesas_lib from window
integer x = 832
integer y = 360
integer width = 1655
integer height = 1276
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_1 cb_1
st_1 st_1
dw_1 dw_1
cb_graba cb_graba
cb_busca cb_busca
cb_cerrar cb_cerrar
cb_elimina cb_elimina
end type
global w_promesas_lib w_promesas_lib

type variables


//DECLARE SP_AGENTES  PROCEDURE FOR SP1;
end variables

event open;gf_centrar(w_promesas_lib)
this.title = gs_app_name
dw_1.settransobject (sqlca)
if dw_1.retrieve() > 0 then
	st_1.text = string(dw_1.rowcount(),'###,###,###,###')+' Reg.'
	cb_elimina.enabled	= true
//	cb_busca.enabled 		= false
else
	cb_busca.enabled 		= true
	cb_elimina.enabled 	= false
end if
gs_ventana		= 'w_promesas_lib'
f_valida_objeto()
end event

on w_promesas_lib.create
this.cb_1=create cb_1
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_graba=create cb_graba
this.cb_busca=create cb_busca
this.cb_cerrar=create cb_cerrar
this.cb_elimina=create cb_elimina
this.Control[]={this.cb_1,&
this.st_1,&
this.dw_1,&
this.cb_graba,&
this.cb_busca,&
this.cb_cerrar,&
this.cb_elimina}
end on

on w_promesas_lib.destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_graba)
destroy(this.cb_busca)
destroy(this.cb_cerrar)
destroy(this.cb_elimina)
end on

type cb_1 from commandbutton within w_promesas_lib
boolean visible = false
integer x = 1303
integer y = 580
integer width = 247
integer height = 108
integer taborder = 31
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;
 DECLARE sp_1 PROCEDURE FOR PRADO.SP_ESTADO  ;
 
end event

type st_1 from statictext within w_promesas_lib
integer x = 1129
integer y = 392
integer width = 453
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 80269524
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_promesas_lib
integer x = 46
integer y = 28
integer width = 992
integer height = 1116
integer taborder = 10
string dataobject = "dw_muestra_etiquetas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)
end event

type cb_graba from commandbutton within w_promesas_lib
integer x = 1129
integer y = 256
integer width = 453
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Grabar Reg."
end type

event clicked;dw_1.update()
commit;
this.enabled 			= false
cb_elimina.enabled 	= true
gs_ventana		= 'w_promesas_lib'
f_valida_objeto()
end event

type cb_busca from commandbutton within w_promesas_lib
integer x = 1129
integer y = 144
integer width = 453
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Buscar Archivo"
end type

event clicked;string null_str
integer i
SetNull(null_str)

dw_1.ImportFile(null_str)
st_1.text = string(dw_1.rowcount(),'###,###,###,###')+' Reg.'
dw_1.accepttext ()
if dw_1.rowcount() > 0 then
	for i = 1 to dw_1.rowcount()
		dw_1.setitem(i,'correlativo',i)
	next
	cb_elimina.enabled	= true
	this.enabled 			= false
	cb_graba.enabled 		= true
end if
gs_ventana		= 'w_promesas_lib'
f_valida_objeto()
end event

type cb_cerrar from commandbutton within w_promesas_lib
integer x = 1129
integer y = 1036
integer width = 453
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_promesas_lib)
end event

type cb_elimina from commandbutton within w_promesas_lib
integer x = 1129
integer y = 32
integer width = 453
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar Reg."
end type

event clicked;integer i
string  serie
Double    numero

if dw_1.rowcount() > 0 then
	for i = 1 to dw_1.rowcount()
		serie  = dw_1.getitemstring(i,'serie')
		numero = dw_1.getitemnumber(i,'numero')
		DELETE FROM "ETIQUETAS"  
	   WHERE ( "ETIQUETAS"."SERIE" = :serie ) AND  
            ( "ETIQUETAS"."NUMERO" = :numero )   ;
		if sqlca.sqlcode <> 0 then
			dw_1.deleterow(i)
		end if
	next
	cb_busca.enabled 	= true
	this.enabled 		= false
	cb_graba.enabled 	= false
	dw_1.retrieve()
else
	messagebox('No hay Registros','No hay Registros para eliminar',stopsign!)
	this.enabled 		= false
end if
gs_ventana		= 'w_promesas_lib'
f_valida_objeto()
end event

