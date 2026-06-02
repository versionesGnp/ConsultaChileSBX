forward
global type w_cuotas_pagare_bkp from window
end type
type dw_3 from datawindow within w_cuotas_pagare_bkp
end type
type rb_peso from radiobutton within w_cuotas_pagare_bkp
end type
type rb_uf from radiobutton within w_cuotas_pagare_bkp
end type
type cb_pagare from commandbutton within w_cuotas_pagare_bkp
end type
type cb_8 from commandbutton within w_cuotas_pagare_bkp
end type
type cb_7 from commandbutton within w_cuotas_pagare_bkp
end type
type cb_6 from commandbutton within w_cuotas_pagare_bkp
end type
type cb_5 from commandbutton within w_cuotas_pagare_bkp
end type
type cb_4 from commandbutton within w_cuotas_pagare_bkp
end type
type cb_3 from commandbutton within w_cuotas_pagare_bkp
end type
type dw_4 from datawindow within w_cuotas_pagare_bkp
end type
type dw_2 from datawindow within w_cuotas_pagare_bkp
end type
type cb_ver_cuenta from commandbutton within w_cuotas_pagare_bkp
end type
type cb_2 from commandbutton within w_cuotas_pagare_bkp
end type
type cb_1 from commandbutton within w_cuotas_pagare_bkp
end type
type dw_1 from datawindow within w_cuotas_pagare_bkp
end type
type ln_1 from line within w_cuotas_pagare_bkp
end type
type gb_1 from groupbox within w_cuotas_pagare_bkp
end type
end forward

global type w_cuotas_pagare_bkp from window
integer x = 183
integer y = 48
integer width = 3282
integer height = 2104
boolean titlebar = true
string title = "Reprogramar Pagaré"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_3 dw_3
rb_peso rb_peso
rb_uf rb_uf
cb_pagare cb_pagare
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
dw_4 dw_4
dw_2 dw_2
cb_ver_cuenta cb_ver_cuenta
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
ln_1 ln_1
gb_1 gb_1
end type
global w_cuotas_pagare_bkp w_cuotas_pagare_bkp

type variables
double 	id_vp,id_gto_cobranza,id_c_total_mora,id_vp_deuda,int_gc_mora_$,&
			int_gc_mora_uf,id_factor_gc,id_factor_gc_peso
Date		idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_dw ()
end prototypes

public subroutine wf_dw ();double pie,pie2


dw_1.setitem(1,'pie2',dw_1.getitemnumber(1,'pp'))
end subroutine

on w_cuotas_pagare_bkp.create
this.dw_3=create dw_3
this.rb_peso=create rb_peso
this.rb_uf=create rb_uf
this.cb_pagare=create cb_pagare
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_4=create dw_4
this.dw_2=create dw_2
this.cb_ver_cuenta=create cb_ver_cuenta
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.ln_1=create ln_1
this.gb_1=create gb_1
this.Control[]={this.dw_3,&
this.rb_peso,&
this.rb_uf,&
this.cb_pagare,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.dw_4,&
this.dw_2,&
this.cb_ver_cuenta,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.ln_1,&
this.gb_1}
end on

on w_cuotas_pagare_bkp.destroy
destroy(this.dw_3)
destroy(this.rb_peso)
destroy(this.rb_uf)
destroy(this.cb_pagare)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_4)
destroy(this.dw_2)
destroy(this.cb_ver_cuenta)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.ln_1)
destroy(this.gb_1)
end on

event open;double	nro,valor,valor_uf,factor,pesos,uf,id_im, id_gc, valor_cuota,&
			ld_gasto
string 	fecha,moneda
long 		dmora, mora_cobro,cuotas,a,cuota, i

idt_fecha_hoy		= date(gdt_fec_sistema)
gf_centrar(w_cuotas_pagare)
id_factor_gc		= f_factor_gasto_cobranza()
id_factor_gc_peso	= f_factor_gasto_cobranza_peso()
fecha 				= string(idt_fecha_hoy,gs_formato_fecha)
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_1.Retrieve(gs_serie,gi_numero)
dw_2.Retrieve(gs_serie,gi_numero)
gs_ventana			= 'w_cuotas_pagare'
f_valida_objeto()
dw_4.DataObject	= 'dw_uf'
dw_4.SetTransObject(SQLCA)
dw_4.Retrieve(date(fecha))
if dw_4.rowcount() > 0 then
	valor_uf			= dw_4.getitemnumber(1,'valor_uf')
	dw_1.setitem(1,'ufs',valor_uf)
	cuotas 			= nro//dw_1.getitemnumber(1,'nro_cuotas')
	dw_1.setitem(1,'int_cuota',id_factor_gc)
	moneda 			= dw_2.getitemstring(1,'pagare_moneda')
end if
if dw_1.rowcount() > 0 then
	dw_1.setitem(1,'pie',0)
	dw_1.setitem(1,'nro_cuotas',12)
	dw_1.setfocus()
	dw_1.AcceptText()
	cuotas 		= dw_1.getitemnumber(1,'nro_cuotas')
	select	factor_pesos,factor_uf into :pesos,:uf 
	from 		interes_cuotas 
	where 	nro_cuotas = :cuotas;
	dw_1.setitem(1,'interes_cuotas_factor_pesos',pesos)
	dw_1.setitem(1,'interes_cuotas_factor_uf',uf)
	valor_uf 			= dw_4.getitemnumber(1,'valor_uf')
	if dw_2.getitemnumber(1,'c_cuotas_pagadas') + dw_2.getitemnumber(1,'c_cuota_mora') >= dw_2.getitemnumber(1,'pagare_plazo') then
		valor_cuota 	= dw_1.GetItemNumber(1,"c_valor_cuota_pesos")
		cuota 			= dw_1.GetItemNumber(1,"c_cuota_mora")
		dmora 			= dw_2.GetItemNumber(1,"c_dias_mora")
		mora_cobro 		= 0
		for i=1 to cuota
			IF (dmora - (i - 1) * 30) > 5 THEN 
				mora_cobro = (dmora - (i - 1) * 30)
				id_im 	= id_im + gf_int_mora(dw_2.GetItemNumber(1,"c_tasa"), mora_cobro, valor_cuota )
				id_gc    = id_gc + Round(valor_cuota * id_factor_gc, 0)
			end if	
		next
		int_gc_mora_uf = round(((dw_1.getitemnumber(1,'c_total_mora') + id_im + id_gc) / valor_uf),4)
		int_gc_mora_$  = round((dw_1.getitemnumber(1,'c_total_mora') + id_im + id_gc),0)
		dw_1.setitem(1,'int_gc_mora_uf',int_gc_mora_uf)
		dw_1.setitem(1,'int_gc_mora_$',int_gc_mora_$)
	end if
	if moneda = '2' then //UF
		ld_gasto										= id_factor_gc
		dw_1.setitem(1,'tipo_calculo',0)
		dw_1.Object.pie2.TabSequence 			= 20
		dw_1.Object.pie.TabSequence 			= 0
		dw_1.Object.saldo22.TabSequence 		= 30
		dw_1.Object.saldo2.TabSequence 		= 0
		dw_1.Object.pie.Background.Color 	= RGB(255,255,0)
		dw_1.Object.saldo2.Background.Color = RGB(255,255,0)
		rb_peso.checked							= false
		rb_uf.checked								= true
	elseif moneda = '1' then //Peso
		ld_gasto										= id_factor_gc_peso
		dw_1.setitem(1,'tipo_calculo',1)		
		dw_1.Object.pie.TabSequence 			= 20
		dw_1.Object.pie2.TabSequence 			= 0
		dw_1.Object.saldo22.TabSequence 		= 0
		dw_1.Object.saldo2.TabSequence 		= 30
		dw_1.Object.pie2.Background.Color 	= RGB(255,255,0)
		dw_1.Object.saldo22.Background.Color= RGB(255,255,0)
		rb_peso.checked							= true
		rb_uf.checked								= false
	end if	
	dw_1.setitem(1,'int_cuota',ld_gasto)
	dw_1.accepttext ()
	FOR a=dw_1.rowcount() TO 2 step -1
		dw_1.deleterow(a)
	NEXT
else
	messagebox('No hay Datos','No existen datos del Pagare.',information!)
	close(w_cuotas_pagare)
end if
end event

type dw_3 from datawindow within w_cuotas_pagare_bkp
boolean visible = false
integer x = 2203
integer y = 1884
integer width = 494
integer height = 360
integer taborder = 40
boolean titlebar = true
string title = "none"
string dataobject = "d_encabezado_cuenta_cte_pagare_print"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
end type

type rb_peso from radiobutton within w_cuotas_pagare_bkp
integer x = 151
integer y = 1300
integer width = 475
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Calculo Pesos"
borderstyle borderstyle = stylelowered!
end type

event clicked;double 	factor,uf,pesos,pie,pp,ld_gasto
string 	oferta,tipo_moneda,ls_columna
long 		cuotas
dw_1.AcceptText()
cuotas 	= dw_1.getitemnumber(1,'nro_cuotas')
select	factor_pesos,factor_uf into :pesos,:uf 
from 		interes_cuotas 
where 	nro_cuotas = :cuotas;
dw_1.setitem(1,'interes_cuotas_factor_pesos',pesos)
dw_1.setitem(1,'interes_cuotas_factor_uf',uf)
dw_1.setitem(1,'int_cuota',id_factor_gc_peso)//factor
dw_1.setitem(1,'tipo_calculo',1)
dw_1.AcceptText()
end event

type rb_uf from radiobutton within w_cuotas_pagare_bkp
integer x = 151
integer y = 1224
integer width = 439
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Calculo U.F."
borderstyle borderstyle = stylelowered!
end type

event clicked;double 	factor,uf,pesos,pie,pp,ld_gasto
string 	oferta,tipo_moneda,ls_columna
long 		cuotas
dw_1.AcceptText()
cuotas 	= dw_1.getitemnumber(1,'nro_cuotas')
select	factor_pesos,factor_uf into :pesos,:uf 
from 		interes_cuotas 
where 	nro_cuotas = :cuotas;
dw_1.setitem(1,'interes_cuotas_factor_pesos',pesos)
dw_1.setitem(1,'interes_cuotas_factor_uf',uf)
dw_1.setitem(1,'int_cuota',id_factor_gc)//factor
dw_1.setitem(1,'tipo_calculo',0)
dw_1.AcceptText()
end event

type cb_pagare from commandbutton within w_cuotas_pagare_bkp
integer x = 1541
integer y = 2360
integer width = 357
integer height = 108
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Pagaré"
end type

event clicked;open(w_ver_pagare)
end event

type cb_8 from commandbutton within w_cuotas_pagare_bkp
integer x = 626
integer y = 2308
integer width = 357
integer height = 108
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fallecidos"
end type

event clicked;open(w_listado_fallecidos)
end event

type cb_7 from commandbutton within w_cuotas_pagare_bkp
integer x = 398
integer y = 1864
integer width = 338
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Datos Cliente"
end type

event clicked;open(w_datos_cliente)
end event

type cb_6 from commandbutton within w_cuotas_pagare_bkp
integer x = 55
integer y = 2244
integer width = 357
integer height = 108
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Repacta"
end type

event clicked;open(w_listado_repacta)
end event

type cb_5 from commandbutton within w_cuotas_pagare_bkp
integer x = 1225
integer y = 2320
integer width = 357
integer height = 108
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Beneficiarios"
end type

event clicked;open(w_listado_beneficiarios)
end event

type cb_4 from commandbutton within w_cuotas_pagare_bkp
integer x = 887
integer y = 2336
integer width = 357
integer height = 108
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Contrato"
end type

event clicked;open(w_datos_contrato_oferta)
end event

type cb_3 from commandbutton within w_cuotas_pagare_bkp
integer x = 55
integer y = 1864
integer width = 338
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Int.Cuota"
end type

event clicked;open(w_interes_cuota)
end event

type dw_4 from datawindow within w_cuotas_pagare_bkp
boolean visible = false
integer x = 1627
integer y = 1884
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

type dw_2 from datawindow within w_cuotas_pagare_bkp
integer x = 311
integer y = 68
integer width = 2633
integer height = 424
string dataobject = "d_datos_cuenta_ci_pagare_1"
boolean border = false
boolean livescroll = true
end type

type cb_ver_cuenta from commandbutton within w_cuotas_pagare_bkp
event clicked pbm_bnclicked
boolean visible = false
integer x = 55
integer y = 2072
integer width = 338
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cuenta Cte."
end type

event clicked;
IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho
			Open(w_cuenta_corriente_derecho)
	END CHOOSE
END IF
end event

type cb_2 from commandbutton within w_cuotas_pagare_bkp
integer x = 741
integer y = 1864
integer width = 338
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

event clicked;Long	 	cuotas, tipo_c, moneda, a, cuota, tipo,dmora, mora_cobro,i
double  	uf, pesos, i_uf, i_peso,id_im, id_gc, valor_cuota, valor_uf,pie,saldo
string 	oferta, mone

SetPointer(HourGlass!)
dw_3.SetTransObject(SQLCA)
cuota		= dw_1.getitemnumber(1,'nro_cuotas')
pie		= dw_1.getitemnumber(1,'pie')
saldo		= dw_1.getitemnumber(1,'saldo2')
tipo		= dw_1.getitemnumber(1,'tipo_calculo')
if not isnull(cuota) or cuota = 0 then
	if dw_3.Retrieve(gs_serie, gi_numero) > 0 then
		dw_3.setitem(1,'nro_cuotas',cuota)
		dw_3.setitem(1,'pie',pie)
		dw_3.setitem(1,'saldo2',saldo)
		dw_3.setitem(1,'tipo_calculo',tipo)
		valor_uf			= dw_4.getitemnumber(1,'valor_uf')
		dw_3.setitem(1,'ufs',valor_uf)
		dw_3.setitem(1,'int_cuota',dw_1.getitemnumber(1,'int_cuota'))
		dw_3.setitem(1,'nueva_cuota',dw_1.getitemnumber(1,'nueva_cuota'))
		dw_3.setitem(1,'nueva_cuota1',dw_1.getitemnumber(1,'nueva_cuota1'))
		dw_3.AcceptText()
		cuotas 	= dw_3.getitemnumber(1,'nro_cuotas')
		select factor_pesos,factor_uf into :pesos,:uf from interes_cuotas where nro_cuotas = :cuotas;
//		factor	= double(dw_1.GetItemNumber(1,"tasa_gasto_cob_mora"))
		if rb_uf.checked= true then
			dw_3.setitem(1,'int_cuota',id_factor_gc)
		elseif rb_peso.checked= true then
			dw_3.setitem(1,'int_cuota',id_factor_gc_peso)
		end if
		dw_3.setitem(1,'interes_cuotas_factor_pesos',pesos)
		dw_3.setitem(1,'interes_cuotas_factor_uf',uf)
		dw_3.setitem(1,'pie',dw_1.getitemnumber(1,'pie'))
		dw_3.setitem(1,'pie2',dw_1.getitemnumber(1,'pie2'))
		dw_3.setitem(1,'saldo2',dw_1.getitemnumber(1,'saldo2'))
		dw_3.setitem(1,'saldo22',dw_1.getitemnumber(1,'saldo22'))
		select interes_pesos,interes_uf into :i_peso,:i_uf from interes_cuotas where nro_cuotas = :cuotas;
		dw_3.object.tasapeso.text	= string(i_peso,'###,###,##0.0###')
		dw_3.object.tasauf.text 	= string(i_uf,'###,###,##0.0###')
		dw_3.object.usuario.text 	= gs_us
		FOR a=dw_3.rowcount() TO 2 step -1
			dw_3.deleterow(a)
		NEXT
		dw_3.setitem(1,'int_gc_mora_uf',int_gc_mora_uf)
		dw_3.setitem(1,'int_gc_mora_$',int_gc_mora_$)
		dw_3.AcceptText()
		dw_3.print()
	else
		messagebox('Error','No existen datos para esta oferta.',information!)
	end if	
else
	messagebox('Falta dato','Deeb ingresar el numero de cuotas.',information!)
end if
SetPointer(Arrow!)
end event

type cb_1 from commandbutton within w_cuotas_pagare_bkp
integer x = 2885
integer y = 1864
integer width = 338
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cuotas_pagare)
end event

type dw_1 from datawindow within w_cuotas_pagare_bkp
event keydown pbm_dwnkey
integer x = 119
integer y = 500
integer width = 3040
integer height = 1288
string dataobject = "d_encabezado_cuenta_cte_pagare_11"
boolean border = false
boolean livescroll = true
end type

event keydown;//integer 	pie,tipo_c,moneda
//
//AcceptText( )
//moneda = dw_1.getitemnumber(1,'tipo_calculo')
//if getcolumnname() = 'pie' then
//	if (Key = (KeyTab!) or Key = (KeyEnter!)) then
//		pie = getitemnumber(1,'pie')
//		if pie > 100 and moneda = 0 then
//		else
//			dw_1.setitem(1,'pie2',dw_1.getitemnumber(1,'pp'))
//		end if	
//	end if
//end if	
//if getcolumnname() = 'pie2' then
//	dw_1.setitem(1,'pie',dw_1.getitemnumber(1,'pp1'))
//elseif getcolumnname() = 'pie' then
//	dw_1.setitem(1,'pie2',dw_1.getitemnumber(1,'pp'))
//elseif getcolumnname() = 'saldo22' then
//	dw_1.setitem(1,'saldo2',dw_1.getitemnumber(1,'ss1'))
//elseif getcolumnname() = 'saldo2' then
//	dw_1.setitem(1,'saldo22',dw_1.getitemnumber(1,'ss'))
//end if	
end event

event itemchanged;Long	 	pie,tipo_c,moneda,cuotas
Double	ld_gasto,pesos,uf
String	ls_columna
dw_1.AcceptText()
ls_columna	= dwo.name
moneda 		= dw_1.getitemnumber(1,'tipo_calculo')
cuotas 		= dw_1.getitemnumber(1,'nro_cuotas')
select	factor_pesos,factor_uf into :pesos,:uf from interes_cuotas where 	nro_cuotas = :cuotas
Using		sqlca;
if sqlca.sqlcode=0 then
	dw_1.setitem(1,'interes_cuotas_factor_pesos',pesos)
	dw_1.setitem(1,'interes_cuotas_factor_uf',uf)
	if moneda=0 then // calculo UF
		dw_1.setitem(1,'int_cuota',id_factor_gc)//factor
		dw_1.setitem(1,'tipo_calculo',0)
	else
		dw_1.setitem(1,'int_cuota',id_factor_gc_peso)//factor
		dw_1.setitem(1,'tipo_calculo',1)
	end if
end if
dw_1.accepttext()
if ls_columna = 'pie' then
	pie = getitemnumber(1,'pie')
	if pie > 100 and moneda = 0 then
	else
		dw_1.setitem(1,'pie2',dw_1.getitemnumber(1,'pp'))
	end if	
elseif ls_columna = 'pie2' then
	dw_1.setitem(1,'pie',dw_1.getitemnumber(1,'pp1'))
elseif ls_columna = 'pie' then
	dw_1.setitem(1,'pie2',dw_1.getitemnumber(1,'pp'))
elseif ls_columna = 'saldo22' then
	dw_1.setitem(1,'saldo2',dw_1.getitemnumber(1,'ss1'))
elseif ls_columna = 'saldo2' then
	dw_1.setitem(1,'saldo22',dw_1.getitemnumber(1,'ss'))
end if	
dw_1.accepttext()
end event

event itemerror;return 0
end event

event dberror;return 0
end event

type ln_1 from line within w_cuotas_pagare_bkp
integer linethickness = 5
integer beginx = 585
integer beginy = 672
integer endx = 914
integer endy = 960
end type

type gb_1 from groupbox within w_cuotas_pagare_bkp
integer x = 50
integer width = 3173
integer height = 1824
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
borderstyle borderstyle = styleraised!
end type

