forward
global type w_prepago_pagare_bkp from window
end type
type cb_3 from commandbutton within w_prepago_pagare_bkp
end type
type dw_3 from datawindow within w_prepago_pagare_bkp
end type
type dw_4 from datawindow within w_prepago_pagare_bkp
end type
type dw_2 from datawindow within w_prepago_pagare_bkp
end type
type dw_1 from datawindow within w_prepago_pagare_bkp
end type
type cb_1 from commandbutton within w_prepago_pagare_bkp
end type
type gb_1 from groupbox within w_prepago_pagare_bkp
end type
end forward

global type w_prepago_pagare_bkp from window
integer x = 832
integer y = 360
integer width = 3301
integer height = 1828
boolean titlebar = true
string title = "Prepagos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_3 cb_3
dw_3 dw_3
dw_4 dw_4
dw_2 dw_2
dw_1 dw_1
cb_1 cb_1
gb_1 gb_1
end type
global w_prepago_pagare_bkp w_prepago_pagare_bkp

type variables
Double	id_factor_gc
Date		idt_fecha_hoy
end variables

on w_prepago_pagare_bkp.create
this.cb_3=create cb_3
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cb_3,&
this.dw_3,&
this.dw_4,&
this.dw_2,&
this.dw_1,&
this.cb_1,&
this.gb_1}
end on

on w_prepago_pagare_bkp.destroy
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;double  	nro,valor,valor_uf
string 	fecha,moneda
integer 	cuotas,cuota,i,dmora
long 		gc_cuota,id_gc

idt_fecha_hoy		= today()//date(gdt_fec_sistema)
dw_2.SetTransObject(SQLCA)
dw_2.Retrieve(gs_serie,gi_numero)
gf_centrar(w_prepago_pagare)
id_factor_gc		= f_factor_gasto_cobranza()
fecha 				= string(idt_fecha_hoy,gs_formato_fecha)
dw_1.SetTransObject(SQLCA)
dw_1.Retrieve(gs_serie,gi_numero)
dw_3.SetTransObject(SQLCA)
dw_3.Retrieve(gs_serie,gi_numero)
dw_3.setitem(1,'nro_cuotas',nro)
dw_3.setitem(1,'pie',valor)
dw_4.DataObject 	= 'dw_uf'
dw_4.SetTransObject(SQLCA)
dw_4.Retrieve(date(fecha))
gs_ventana			= 'w_prepago_pagare'
f_valida_objeto()
if dw_4.rowcount() > 0 then
	valor_uf 		= dw_4.getitemnumber(1,'valor_uf')
	dw_1.setitem(1,'ufs',valor_uf)
	dw_3.setitem(1,'ufs',valor_uf)
	cuotas 			= dw_1.getitemnumber(1,'nro_cuotas')
//	id_factor_gc	= double(dw_1.getitemnumber(1,'tasa_gasto_cob_mora'))
//	select factor_gc into :factor from interes_cuotas where nro_cuotas = :cuotas;
	dw_1.setitem(1,'int_cuota',id_factor_gc) //factor)
	dw_3.setitem(1,'int_cuota',id_factor_gc) //factor)
	moneda 			= dw_1.getitemstring(1,'pagare_moneda')
end if
dw_1.setitem(1,'pie',0)
dw_3.setitem(1,'pie',0)

cuota 				= dw_1.GetItemNumber(1,"c_cuota_mora")
dmora 				= dw_1.GetItemNumber(1,"c_dias_mora")
for i=1 to cuota
	IF (dmora - (i - 1) * 30) > 30 THEN 
		gc_cuota 	= Round(dw_1.GetItemNumber(1,"gc_cuotas"), 0)
		id_gc    	= id_gc + Round(gc_cuota * id_factor_gc, 0)
	end if
next
dw_1.setitem(1,'gastos_cobranza',id_gc)
dw_3.setitem(1,'gastos_cobranza',id_gc)
dw_3.setitem(1,'periodo',dw_1.GetItemNumber(1,"periodo"))
dw_3.setitem(1,'ufs',dw_1.GetItemNumber(1,"ufs"))
dw_1.setfocus()
end event

type cb_3 from commandbutton within w_prepago_pagare_bkp
integer x = 46
integer y = 1584
integer width = 311
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_3.rowcount() > 0 then
	dw_3.print()
else
	messagebox(gs_app_name,'No existen datos.',stopsign!)
end if	
end event

type dw_3 from datawindow within w_prepago_pagare_bkp
boolean visible = false
integer x = 1536
integer y = 1580
integer width = 494
integer height = 360
boolean titlebar = true
string dataobject = "d_encabezado_cuenta_cte_pagare_pre_print"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_4 from datawindow within w_prepago_pagare_bkp
boolean visible = false
integer x = 443
integer y = 1580
integer width = 494
integer height = 360
boolean titlebar = true
string dataobject = "dw_uf"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_2 from datawindow within w_prepago_pagare_bkp
integer x = 343
integer y = 100
integer width = 2757
integer height = 372
integer taborder = 10
string dataobject = "d_datos_cuenta_ci_pagare_1"
boolean border = false
boolean livescroll = true
end type

type dw_1 from datawindow within w_prepago_pagare_bkp
integer x = 119
integer y = 484
integer width = 3045
integer height = 932
integer taborder = 20
string dataobject = "d_encabezado_cuenta_cte_pagare_pre"
boolean border = false
boolean livescroll = true
end type

event itemchanged;integer interes,i
long gc_cuota,id_gc,cuota,dmora

AcceptText()
interes 				= getitemnumber(1,'s_g_m')
if interes = 1 then
	cuota 			= dw_1.GetItemNumber(1,"c_cuota_mora")
	dmora 			= dw_1.GetItemNumber(1,"c_dias_mora")
	for i=1 to cuota
		IF (dmora - (i - 1) * 30) > 30 THEN 
			gc_cuota = Round(dw_1.GetItemNumber(1,"gc_cuotas"), 0)
			id_gc    = id_gc + Round(gc_cuota * id_factor_gc, 0)
		end if	
	next
	dw_1.setitem(1,'gastos_cobranza',id_gc)
	dw_3.setitem(1,'gastos_cobranza',id_gc)
	dw_3.setitem(1,'s_g_m',0)
else
	dw_1.setitem(1,'gastos_cobranza',0)
	dw_1.setitem(1,'interes_mora',0)
	dw_3.setitem(1,'gastos_cobranza',0)
	dw_3.setitem(1,'interes_mora',0)
	dw_3.setitem(1,'s_g_m',1)
end if
end event

type cb_1 from commandbutton within w_prepago_pagare_bkp
integer x = 2875
integer y = 1584
integer width = 347
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

event clicked;close(w_prepago_pagare)
end event

type gb_1 from groupbox within w_prepago_pagare_bkp
integer x = 46
integer y = 40
integer width = 3177
integer height = 1500
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

