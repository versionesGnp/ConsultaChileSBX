forward
global type w_resumen_saldo_liberadores from window
end type
type dw_1 from datawindow within w_resumen_saldo_liberadores
end type
type cb_2 from commandbutton within w_resumen_saldo_liberadores
end type
type cb_1 from commandbutton within w_resumen_saldo_liberadores
end type
end forward

global type w_resumen_saldo_liberadores from window
integer x = 270
integer y = 48
integer width = 3131
integer height = 2296
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_resumen_saldo_liberadores w_resumen_saldo_liberadores

on w_resumen_saldo_liberadores.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_resumen_saldo_liberadores.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string fecha
date fecha1
double saldo,saldocp,saldolp,capital,capitalcp,capitallp,i,icp,ilp,gc,gccp,gclp,numero  
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = 'Resumen de Saldo'

if isvalid(w_imprime_saldo) then
	if w_imprime_saldo.dw_1.rowcount() > 0 then
		fecha1 = date(Message.StringParm)
		dw_1.insertrow(0)
		SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
    	INTO   :numero           ,:saldo          ,:saldocp     ,:saldolp     ,:capital    ,:capitalcp     ,:capitallp     ,:i          ,:icp           ,:ilp           ,:gc     ,:gccp     ,:gclp  
    	FROM FACTURA_OFERTA  
   	WHERE ( ESTADO = 'S' ) and ( fecha_cierre =:fecha1 ) and ( BASE = 'L' ) ;
		if sqlca.sqlcode <> 0 then 
			messagebox(gs_app_name,'No Existen datos.',stopsign!)
			close(w_resumen_saldo)
		else	
			dw_1.setitem(1,'saldo',    saldo)
			dw_1.setitem(1,'saldocp',  saldocp)
			dw_1.setitem(1,'saldolp',  saldolp)
			dw_1.setitem(1,'capital',  capital)
			dw_1.setitem(1,'capitalcp',capitalcp)
			dw_1.setitem(1,'capitallp',capitallp)
			dw_1.setitem(1,'i',        i)
			dw_1.setitem(1,'icp',      icp)
			dw_1.setitem(1,'ilp',      ilp)
			dw_1.setitem(1,'gc',       gc)
			dw_1.setitem(1,'gccp',     gccp)
			dw_1.setitem(1,'gclp',     gclp)
			fecha = Message.StringParm
			dw_1.object.fecha_cierre.text = "Fecha de Cierre : '"+fecha+"'"
			dw_1.object.numero.text = "Cantidad de Liberadores calculados : "+string(w_imprime_saldo.dw_1.getitemnumber(1,'numero_s'))
			dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
			dw_1.object.titulo.text = "Saldo de Liberadores"
		END IF
	end if
elseif isvalid(w_imprime_saldo_nueva) then
	if w_imprime_saldo_nueva.dw_1.rowcount() > 0 then
		fecha1 = date(Message.StringParm)
		dw_1.insertrow(0)
		SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
    	INTO   :numero           ,:saldo          ,:saldocp     ,:saldolp     ,:capital    ,:capitalcp     ,:capitallp     ,:i          ,:icp           ,:ilp           ,:gc     ,:gccp     ,:gclp  
    	FROM FACTURA_OFERTA  
   	WHERE ( ESTADO = 'N' ) and ( fecha_cierre =:fecha1 ) and ( BASE = 'L' ) ;
		if sqlca.sqlcode <> 0 then 
			messagebox(gs_app_name,'No Existen datos.',stopsign!)
			close(w_resumen_saldo)
		else	
			dw_1.setitem(1,'saldo',    saldo)
			dw_1.setitem(1,'saldocp',  saldocp)
			dw_1.setitem(1,'saldolp',  saldolp)
			dw_1.setitem(1,'capital',  capital)
			dw_1.setitem(1,'capitalcp',capitalcp)
			dw_1.setitem(1,'capitallp',capitallp)
			dw_1.setitem(1,'i',        i)
			dw_1.setitem(1,'icp',      icp)
			dw_1.setitem(1,'ilp',      ilp)
			dw_1.setitem(1,'gc',       gc)
			dw_1.setitem(1,'gccp',     gccp)
			dw_1.setitem(1,'gclp',     gclp)
			fecha = Message.StringParm
			dw_1.object.fecha_cierre.text = "Fecha de Cierre : '"+fecha+"'"
			dw_1.object.titulo.text = "Liberadores Nuevos"
			dw_1.object.numero.text = "Cantidad de Liberadores calculados : "+string(w_imprime_saldo_nueva.dw_1.getitemnumber(1,'numero_s'))
			dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
		END IF			
	end if
elseif isvalid(w_saldo_nuevo_liberadores) then
	fecha1 = date(Message.StringParm)
	dw_1.insertrow(0)
	SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
	INTO   :numero           ,:saldo          ,:saldocp     ,:saldolp     ,:capital    ,:capitalcp     ,:capitallp     ,:i          ,:icp           ,:ilp           ,:gc     ,:gccp     ,:gclp  
	FROM FACTURA_OFERTA  
	WHERE (( ESTADO = 'N' ) OR ( ESTADO = 'S' )) and ( fecha_cierre =:fecha1 ) and ( BASE = 'L' ) ;
	if sqlca.sqlcode <> 0 then 
		messagebox(gs_app_name,'No Existen datos.',stopsign!)
		close(w_resumen_saldo)
	else	
		dw_1.setitem(1,'saldo',    saldo)
		dw_1.setitem(1,'saldocp',  saldocp)
		dw_1.setitem(1,'saldolp',  saldolp)
		dw_1.setitem(1,'capital',  capital)
		dw_1.setitem(1,'capitalcp',capitalcp)
		dw_1.setitem(1,'capitallp',capitallp)
		dw_1.setitem(1,'i',        i)
		dw_1.setitem(1,'icp',      icp)
		dw_1.setitem(1,'ilp',      ilp)
		dw_1.setitem(1,'gc',       gc)
		dw_1.setitem(1,'gccp',     gccp)
		dw_1.setitem(1,'gclp',     gclp)
		fecha = Message.StringParm
		dw_1.object.fecha_cierre.text = "Fecha de Cierre : '"+fecha+"'"
		dw_1.object.titulo.text = "Saldo y Liberadores Nuevos"
		dw_1.object.numero.text = "Cantidad de Liberadores calculados : "+string(numero)
		dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
	end if	
end if
end event

type dw_1 from datawindow within w_resumen_saldo_liberadores
integer x = 41
integer y = 32
integer width = 3008
integer height = 1992
integer taborder = 10
string dataobject = "dw_resumen_saldo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_resumen_saldo_liberadores
integer x = 2427
integer y = 2056
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

type cb_1 from commandbutton within w_resumen_saldo_liberadores
integer x = 2738
integer y = 2056
integer width = 306
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_resumen_saldo_liberadores)
end event

