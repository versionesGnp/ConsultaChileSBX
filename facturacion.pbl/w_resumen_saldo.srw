forward
global type w_resumen_saldo from window
end type
type dw_1 from datawindow within w_resumen_saldo
end type
type cb_2 from commandbutton within w_resumen_saldo
end type
type cb_1 from commandbutton within w_resumen_saldo
end type
end forward

global type w_resumen_saldo from window
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
global w_resumen_saldo w_resumen_saldo

on w_resumen_saldo.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_resumen_saldo.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string fecha
date fecha1
double saldo,saldocp,saldolp,capital,capitalcp,capitallp,i,icp,ilp,gc,gccp,gclp,numero  
double saldo1,saldocp1,saldolp1,capital1,capitalcp1,capitallp1,i1,icp1,ilp1,gc1,gccp1,gclp1,numero1  

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
   	WHERE ( ESTADO = 'S' ) and ( fecha_cierre =:fecha1 ) and ( BASE = 'O' ) ;
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
			dw_1.object.titulo.text = "Saldos Ofertas"
			dw_1.object.fecha_cierre.text = "Fecha de Cierre : '"+fecha+"'"
			dw_1.object.numero.text = "Cantidad de Ofertas calculadas : "+string(w_imprime_saldo.dw_1.getitemnumber(1,'numero_s'))
			dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
		END IF
	end if
//-------------------------------------------------------------------------
elseif isvalid(w_imprime_saldo_resciliadas) then
	fecha1 = date(Message.StringParm)
	dw_1.insertrow(0)
	SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
	INTO   :numero           ,:saldo          ,:saldocp     ,:saldolp     ,:capital    ,:capitalcp     ,:capitallp     ,:i          ,:icp           ,:ilp           ,:gc     ,:gccp     ,:gclp  
	FROM FACTURA_OFERTA  
	WHERE ( ESTADO = 'R' ) and ( fecha_cierre =:fecha1 ) and ( BASE = 'O' ) ;
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
		dw_1.object.titulo.text = "Ofertas Resciliadas"
		dw_1.object.numero.text = "Cantidad de Ofertas calculadas : "+string(numero)
		dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
	end if		
//-------------------------------------------------------------------------	
elseif isvalid(w_imprime_saldo_nueva) then
	if w_imprime_saldo_nueva.dw_1.rowcount() > 0 then
		fecha1 = date(Message.StringParm)
		dw_1.insertrow(0)
		SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
    	INTO   :numero           ,:saldo          ,:saldocp     ,:saldolp     ,:capital    ,:capitalcp     ,:capitallp     ,:i          ,:icp           ,:ilp           ,:gc     ,:gccp     ,:gclp  
    	FROM FACTURA_OFERTA  
   	WHERE ( ESTADO = 'N' ) and ( fecha_cierre =:fecha1 ) and ( BASE = 'O' ) ;
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
			dw_1.object.titulo.text = "Ofertas Nuevas"
			dw_1.object.numero.text = "Cantidad de Ofertas calculadas : "+string(w_imprime_saldo_nueva.dw_1.getitemnumber(1,'numero_s'))
			dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
		END IF			
	end if
elseif isvalid(w_saldo_nuevo) then
	fecha1 = date(Message.StringParm)
	dw_1.insertrow(0)
	SELECT count(saldo_total),sum(saldo_total),sum(saldo_cp),sum(saldo_lp),sum(capital),sum(capital_cp),sum(capital_lp),sum(interes),sum(interes_cp),sum(interes_lp),sum(gc) ,sum(gc_cp),sum(gc_lp)  
	INTO   :numero           ,:saldo          ,:saldocp     ,:saldolp     ,:capital    ,:capitalcp     ,:capitallp     ,:i          ,:icp           ,:ilp           ,:gc     ,:gccp     ,:gclp  
	FROM FACTURA_OFERTA  
	WHERE (( ESTADO = 'N' ) OR ( ESTADO = 'S' )) and ( fecha_cierre =:fecha1 ) and ( BASE = 'O' ) ;
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
		dw_1.object.titulo.text = "Saldos y Ofertas Nuevas"
		dw_1.object.numero.text = "Cantidad de Ofertas calculadas : "+string(numero)
		dw_1.object.titulo1.text = 'Facturación '+	gs_empresa
	end if	
	
elseif isvalid(w_imprime_saldo_dv) then
	fecha1 = date(Message.StringParm)
	dw_1.insertrow(0)
	SELECT count(FACTURA_OFERTA_DV.saldo_total),
			 sum(FACTURA_OFERTA_DV_M.saldo_total) - sum(FACTURA_OFERTA_DV.saldo_total),
			 sum(FACTURA_OFERTA_DV_M.saldo_cp)    - sum(FACTURA_OFERTA_DV.saldo_cp),
			 sum(FACTURA_OFERTA_DV_M.saldo_lp)    - sum(FACTURA_OFERTA_DV.saldo_lp),
			 sum(FACTURA_OFERTA_DV_M.capital)     - sum(FACTURA_OFERTA_DV.capital),
			 sum(FACTURA_OFERTA_DV_M.capital_cp)  - sum(FACTURA_OFERTA_DV.capital_cp),
			 sum(FACTURA_OFERTA_DV_M.capital_lp)  - sum(FACTURA_OFERTA_DV.capital_lp) ,
			 sum(FACTURA_OFERTA_DV_M.interes)     - sum(FACTURA_OFERTA_DV.interes),
			 sum(FACTURA_OFERTA_DV_M.interes_cp)  - sum(FACTURA_OFERTA_DV.interes_cp),
			 sum(FACTURA_OFERTA_DV_M.interes_lp)  - sum(FACTURA_OFERTA_DV.interes_lp),
			 sum(FACTURA_OFERTA_DV_M.gc)          - sum(FACTURA_OFERTA_DV.gc),
			 sum(FACTURA_OFERTA_DV_M.gc_cp)       - sum(FACTURA_OFERTA_DV.gc_cp),
			 sum(FACTURA_OFERTA_DV_M.gc_lp)       - sum(FACTURA_OFERTA_DV.gc_lp) 
	INTO   :numero     ,:saldo    ,
	       :saldocp    ,:saldolp  ,
			 :capital    ,:capitalcp,
			 :capitallp  ,:i        ,
			 :icp        ,:ilp      ,
			 :gc         ,:gccp     ,
			 :gclp  
	FROM FACTURA_OFERTA_DV,FACTURA_OFERTA_DV_M  
	WHERE FACTURA_OFERTA_DV.BASE   = FACTURA_OFERTA_DV_M.BASE AND 
         FACTURA_OFERTA_DV.SERIE  = FACTURA_OFERTA_DV_M.SERIE AND 
         FACTURA_OFERTA_DV.NUMERO = FACTURA_OFERTA_DV_M.NUMERO AND 
		   ( FACTURA_OFERTA_DV.fecha_cierre =:fecha1 ) and ( FACTURA_OFERTA_DV.BASE = 'O' ) ;
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
			dw_1.object.titulo.text = "Ofertas Devengadas"
			dw_1.object.numero.text = "Cantidad de Ofertas calculadas : "+string(numero)
			dw_1.object.titulo1.text = 'Facturación '+	gs_empresa			
	end if
end if
end event

type dw_1 from datawindow within w_resumen_saldo
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

type cb_2 from commandbutton within w_resumen_saldo
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

type cb_1 from commandbutton within w_resumen_saldo
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

event clicked;close(w_resumen_saldo)
end event

