forward
global type w_resumen_total_liberadores from window
end type
type dw_1 from uo_datawindow within w_resumen_total_liberadores
end type
type cb_2 from commandbutton within w_resumen_total_liberadores
end type
type cb_1 from commandbutton within w_resumen_total_liberadores
end type
end forward

global type w_resumen_total_liberadores from window
integer x = 160
integer y = 188
integer width = 3346
integer height = 2024
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_resumen_total_liberadores w_resumen_total_liberadores

on w_resumen_total_liberadores.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_resumen_total_liberadores.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;date fecha
string c_fecha
double valor_uf
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name
fecha = date(Message.StringParm)
dw_1.settransobject(sqlca)
if dw_1.retrieve(fecha) > 0 then
   SELECT "TAB_UF"."VALOR_UF"  
   INTO :valor_uf  
   FROM "TAB_UF"  
   WHERE "TAB_UF"."FECHA_UF" = :fecha   ;
//	dw_1.object.datawindow.print.Preview = true
	c_fecha = ' de '+f_mes_2(fecha)+' de '+string(year(fecha))
	dw_1.object.titulo.text = 'Liberadores'+c_fecha+' ( Valor U.F. cierre : '+string(valor_uf,'###,###,###.###')+' ).'
	dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
else
	messagebox(gs_app_name,'No Existen Saldos de Liberadores procesados,',stopsign!)
	close(w_imprime_saldo)
end if	
end event

type dw_1 from uo_datawindow within w_resumen_total_liberadores
integer x = 64
integer y = 52
integer width = 3205
integer height = 1708
string dataobject = "dw_facturado_liberador"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_resumen_total_liberadores
integer x = 2651
integer y = 1792
integer width = 306
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type cb_1 from commandbutton within w_resumen_total_liberadores
integer x = 2967
integer y = 1792
integer width = 306
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_resumen_total_liberadores)
end event

