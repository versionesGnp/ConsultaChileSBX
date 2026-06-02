forward
global type w_resumen_saldo_dv from window
end type
type dw_1 from datawindow within w_resumen_saldo_dv
end type
type cb_2 from commandbutton within w_resumen_saldo_dv
end type
type cb_1 from commandbutton within w_resumen_saldo_dv
end type
end forward

global type w_resumen_saldo_dv from window
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
global w_resumen_saldo_dv w_resumen_saldo_dv

on w_resumen_saldo_dv.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_resumen_saldo_dv.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string 	ls_fecha
date 		ld_fecha1
double 	ldb_saldo,ldb_saldocp,ldb_saldolp,ldb_capital,ldb_capitalcp,ldb_capitallp,ldb_interes,ldb_icp,ldb_ilp,ldb_gc,ldb_gccp,ldb_gclp,ldb_numero  
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = 'Resumen de Saldo'

if isvalid(w_imprime_saldo) then
	if w_imprime_saldo.dw_1.rowcount() > 0 then
		ld_fecha1 = date(Message.StringParm)
		dw_1.insertrow(0)
		SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
		INTO   :ldb_numero           ,:ldb_saldo          ,:ldb_saldocp     ,:ldb_saldolp     ,:ldb_capital    ,:ldb_capitalcp     ,:ldb_capitallp     ,:ldb_interes          ,:ldb_icp           ,:ldb_ilp           ,:ldb_gc     ,:ldb_gccp     ,:ldb_gclp  
		FROM FACTURA_OFERTA  
		WHERE ( ESTADO = 'S' ) and ( fecha_cierre =:ld_fecha1 ) and ( BASE = 'O' ) ;
		if sqlca.sqlcode <> 0 then 
			messagebox(gs_app_name,'No Existen datos.',stopsign!)
			close(w_resumen_saldo)
		else	
			dw_1.setitem(1,'saldo',ldb_saldo)
			dw_1.setitem(1,'saldocp',ldb_saldocp)
			dw_1.setitem(1,'saldolp',ldb_saldolp)
			dw_1.setitem(1,'capital',ldb_capital)
			dw_1.setitem(1,'capitalcp',ldb_capitalcp)
			dw_1.setitem(1,'capitallp',ldb_capitallp)
			dw_1.setitem(1,'i',ldb_interes)
			dw_1.setitem(1,'icp',ldb_icp)
			dw_1.setitem(1,'ilp',ldb_ilp)
			dw_1.setitem(1,'gc',ldb_gc)
			dw_1.setitem(1,'gccp',ldb_gccp)
			dw_1.setitem(1,'gclp',ldb_gclp)
			ls_fecha = Message.StringParm
			dw_1.object.titulo.text = "Saldos Ofertas"
			dw_1.object.fecha_cierre.text = "Fecha de Cierre : '"+ls_fecha+"'"
			dw_1.object.numero.text = "Cantidad de Ofertas calculadas : "+string(w_imprime_saldo.dw_1.getitemnumber(1,'numero_s'))
			dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
		END IF
	end if
//-------------------------------------------------------------------------
elseif isvalid(w_imprime_saldo_resciliadas) then
	ld_fecha1 = date(Message.StringParm)
	dw_1.insertrow(0)
	SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
	INTO   :ldb_numero           ,:ldb_saldo          ,:ldb_saldocp     ,:ldb_saldolp     ,:ldb_capital    ,:ldb_capitalcp     ,:ldb_capitallp     ,:ldb_interes          ,:ldb_icp           ,:ldb_ilp           ,:ldb_gc     ,:ldb_gccp     ,:ldb_gclp  
	FROM FACTURA_OFERTA  
	WHERE ( ESTADO = 'R' ) and ( fecha_cierre =:ld_fecha1 ) and ( BASE = 'O' ) ;
	if sqlca.sqlcode <> 0 then 
		messagebox(gs_app_name,'No Existen datos.',stopsign!)
		close(w_resumen_saldo)
	else	
		dw_1.setitem(1,'saldo',ldb_saldo)
		dw_1.setitem(1,'saldocp',ldb_saldocp)
		dw_1.setitem(1,'saldolp',ldb_saldolp)
		dw_1.setitem(1,'capital',ldb_capital)
		dw_1.setitem(1,'capitalcp',ldb_capitalcp)
		dw_1.setitem(1,'capitallp',ldb_capitallp)
		dw_1.setitem(1,'i',ldb_interes)
		dw_1.setitem(1,'icp',ldb_icp)
		dw_1.setitem(1,'ilp',ldb_ilp)
		dw_1.setitem(1,'gc',ldb_gc)
		dw_1.setitem(1,'gccp',ldb_gccp)
		dw_1.setitem(1,'gclp',ldb_gclp)
		ls_fecha = Message.StringParm
		dw_1.object.fecha_cierre.text = "Fecha de Cierre : '"+ls_fecha+"'"
		dw_1.object.titulo.text = "Ofertas Resciliadas"
		dw_1.object.numero.text = "Cantidad de Ofertas calculadas : "+string(ldb_numero)
		dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
	end if		
//-------------------------------------------------------------------------	
elseif isvalid(w_imprime_saldo_nueva) then
	if w_imprime_saldo_nueva.dw_1.rowcount() > 0 then
		ld_fecha1 = date(Message.StringParm)
		dw_1.insertrow(0)
		SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
		INTO   :ldb_numero           ,:ldb_saldo          ,:ldb_saldocp     ,:ldb_saldolp     ,:ldb_capital    ,:ldb_capitalcp     ,:ldb_capitallp     ,:ldb_interes          ,:ldb_icp           ,:ldb_ilp           ,:ldb_gc     ,:ldb_gccp     ,:ldb_gclp  
		FROM FACTURA_OFERTA  
		WHERE ( ESTADO = 'N' ) and ( fecha_cierre =:ld_fecha1 ) and ( BASE = 'O' ) ;
		if sqlca.sqlcode <> 0 then 
			messagebox(gs_app_name,'No Existen datos.',stopsign!)
			close(w_resumen_saldo)
		else	
			dw_1.setitem(1,'saldo',ldb_saldo)
			dw_1.setitem(1,'saldocp',ldb_saldocp)
			dw_1.setitem(1,'saldolp',ldb_saldolp)
			dw_1.setitem(1,'capital',ldb_capital)
			dw_1.setitem(1,'capitalcp',ldb_capitalcp)
			dw_1.setitem(1,'capitallp',ldb_capitallp)
			dw_1.setitem(1,'i',ldb_interes)
			dw_1.setitem(1,'icp',ldb_icp)
			dw_1.setitem(1,'ilp',ldb_ilp)
			dw_1.setitem(1,'gc',ldb_gc)
			dw_1.setitem(1,'gccp',ldb_gccp)
			dw_1.setitem(1,'gclp',ldb_gclp)
			ls_fecha = Message.StringParm
			dw_1.object.fecha_cierre.text = "Fecha de Cierre : '"+ls_fecha+"'"
			dw_1.object.titulo.text = "Ofertas Nuevas"
			dw_1.object.numero.text = "Cantidad de Ofertas calculadas : "+string(w_imprime_saldo_nueva.dw_1.getitemnumber(1,'numero_s'))
			dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
		END IF			
	end if
elseif isvalid(w_saldo_nuevo) then
	ld_fecha1 = date(Message.StringParm)
	dw_1.insertrow(0)
	SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
	INTO   :ldb_numero           ,:ldb_saldo          ,:ldb_saldocp     ,:ldb_saldolp     ,:ldb_capital    ,:ldb_capitalcp     ,:ldb_capitallp     ,:ldb_interes          ,:ldb_icp           ,:ldb_ilp           ,:ldb_gc     ,:ldb_gccp     ,:ldb_gclp  
	FROM FACTURA_OFERTA  
	WHERE (( ESTADO = 'N' ) OR ( ESTADO = 'S' )) and ( fecha_cierre =:ld_fecha1 ) and ( BASE = 'O' ) ;
	if sqlca.sqlcode <> 0 then 
		messagebox(gs_app_name,'No Existen datos.',stopsign!)
		close(w_resumen_saldo)
	else	
		dw_1.setitem(1,'saldo',ldb_saldo)
		dw_1.setitem(1,'saldocp',ldb_saldocp)
		dw_1.setitem(1,'saldolp',ldb_saldolp)
		dw_1.setitem(1,'capital',ldb_capital)
		dw_1.setitem(1,'capitalcp',ldb_capitalcp)
		dw_1.setitem(1,'capitallp',ldb_capitallp)
		dw_1.setitem(1,'i',ldb_interes)
		dw_1.setitem(1,'icp',ldb_icp)
		dw_1.setitem(1,'ilp',ldb_ilp)
		dw_1.setitem(1,'gc',ldb_gc)
		dw_1.setitem(1,'gccp',ldb_gccp)
		dw_1.setitem(1,'gclp',ldb_gclp)
		ls_fecha = Message.StringParm
		dw_1.object.fecha_cierre.text = "Fecha de Cierre : '"+ls_fecha+"'"
		dw_1.object.titulo.text = "Saldos y Ofertas Nuevas"
		dw_1.object.numero.text = "Cantidad de Ofertas calculadas : "+string(ldb_numero)
		dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
	end if	
elseif isvalid(w_imprime_saldo_p) then
	ld_fecha1 = date(Message.StringParm)
	dw_1.insertrow(0)
	SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
	INTO   :ldb_numero           ,:ldb_saldo          ,:ldb_saldocp     ,:ldb_saldolp     ,:ldb_capital    ,:ldb_capitalcp     ,:ldb_capitallp     ,:ldb_interes          ,:ldb_icp           ,:ldb_ilp           ,:ldb_gc     ,:ldb_gccp     ,:ldb_gclp  
	FROM FACTURA_OFERTA  
	WHERE ( ESTADO = 'V' ) and ( fecha_cierre =:ld_fecha1 ) and ( BASE = 'O' ) ;
	if sqlca.sqlcode <> 0 then 
		messagebox(gs_app_name,'No Existen datos.',stopsign!)
		close(w_resumen_saldo)
	else	
		dw_1.setitem(1,'saldo',ldb_saldo)
		dw_1.setitem(1,'saldocp',ldb_saldocp)
		dw_1.setitem(1,'saldolp',ldb_saldolp)
		dw_1.setitem(1,'capital',ldb_capital)
		dw_1.setitem(1,'capitalcp',ldb_capitalcp)
		dw_1.setitem(1,'capitallp',ldb_capitallp)
		dw_1.setitem(1,'i',ldb_interes)
		dw_1.setitem(1,'icp',ldb_icp)
		dw_1.setitem(1,'ilp',ldb_ilp)
		dw_1.setitem(1,'gc',ldb_gc)
		dw_1.setitem(1,'gccp',ldb_gccp)
		dw_1.setitem(1,'gclp',ldb_gclp)
		ls_fecha = Message.StringParm
		dw_1.object.fecha_cierre.text = "Fecha de Cierre : '"+ls_fecha+"'"
		dw_1.object.titulo.text = "Ofertas por Pagar"
		dw_1.object.numero.text = "Cantidad de Ofertas calculadas : "+string(ldb_numero)
		dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
	end if	
end if
end event

type dw_1 from datawindow within w_resumen_saldo_dv
integer x = 41
integer y = 32
integer width = 3008
integer height = 1992
integer taborder = 1
string dataobject = "dw_resumen_saldo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_resumen_saldo_dv
integer x = 2427
integer y = 2056
integer width = 306
integer height = 108
integer taborder = 10
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

type cb_1 from commandbutton within w_resumen_saldo_dv
integer x = 2738
integer y = 2056
integer width = 306
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_resumen_saldo_dv)
end event

