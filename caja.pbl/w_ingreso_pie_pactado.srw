forward
global type w_ingreso_pie_pactado from window
end type
type dw_pago_pie from datawindow within w_ingreso_pie_pactado
end type
type st_4 from statictext within w_ingreso_pie_pactado
end type
type st_canal_nf from statictext within w_ingreso_pie_pactado
end type
type em_dias_cheque from editmask within w_ingreso_pie_pactado
end type
type rb_otra_fecha_ch from radiobutton within w_ingreso_pie_pactado
end type
type rb_ch_dia from radiobutton within w_ingreso_pie_pactado
end type
type pb_ok from picturebutton within w_ingreso_pie_pactado
end type
type em_total_pie from editmask within w_ingreso_pie_pactado
end type
type st_2 from statictext within w_ingreso_pie_pactado
end type
type cb_eliminar from commandbutton within w_ingreso_pie_pactado
end type
type cb_grabar from commandbutton within w_ingreso_pie_pactado
end type
type cb_limpiar from commandbutton within w_ingreso_pie_pactado
end type
type em_cuotas from editmask within w_ingreso_pie_pactado
end type
type st_1 from statictext within w_ingreso_pie_pactado
end type
type cb_cerrar from commandbutton within w_ingreso_pie_pactado
end type
type rb_ch_30_dias from radiobutton within w_ingreso_pie_pactado
end type
type st_16 from statictext within w_ingreso_pie_pactado
end type
type dw_lista from datawindow within w_ingreso_pie_pactado
end type
type st_canal from statictext within w_ingreso_pie_pactado
end type
type st_canal_ni from statictext within w_ingreso_pie_pactado
end type
end forward

global type w_ingreso_pie_pactado from window
integer width = 3255
integer height = 1388
boolean titlebar = true
string title = "Ingreso Pie Pactado"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
dw_pago_pie dw_pago_pie
st_4 st_4
st_canal_nf st_canal_nf
em_dias_cheque em_dias_cheque
rb_otra_fecha_ch rb_otra_fecha_ch
rb_ch_dia rb_ch_dia
pb_ok pb_ok
em_total_pie em_total_pie
st_2 st_2
cb_eliminar cb_eliminar
cb_grabar cb_grabar
cb_limpiar cb_limpiar
em_cuotas em_cuotas
st_1 st_1
cb_cerrar cb_cerrar
rb_ch_30_dias rb_ch_30_dias
st_16 st_16
dw_lista dw_lista
st_canal st_canal
st_canal_ni st_canal_ni
end type
global w_ingreso_pie_pactado w_ingreso_pie_pactado

type variables
String	is_base,is_serie,is_uso,is_estado,is_moneda
Long		il_row,il_mod_pie
Double	idb_pie
Date		idt_fecha_hoy
Double	il_numero
end variables

on w_ingreso_pie_pactado.create
this.dw_pago_pie=create dw_pago_pie
this.st_4=create st_4
this.st_canal_nf=create st_canal_nf
this.em_dias_cheque=create em_dias_cheque
this.rb_otra_fecha_ch=create rb_otra_fecha_ch
this.rb_ch_dia=create rb_ch_dia
this.pb_ok=create pb_ok
this.em_total_pie=create em_total_pie
this.st_2=create st_2
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.cb_limpiar=create cb_limpiar
this.em_cuotas=create em_cuotas
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.rb_ch_30_dias=create rb_ch_30_dias
this.st_16=create st_16
this.dw_lista=create dw_lista
this.st_canal=create st_canal
this.st_canal_ni=create st_canal_ni
this.Control[]={this.dw_pago_pie,&
this.st_4,&
this.st_canal_nf,&
this.em_dias_cheque,&
this.rb_otra_fecha_ch,&
this.rb_ch_dia,&
this.pb_ok,&
this.em_total_pie,&
this.st_2,&
this.cb_eliminar,&
this.cb_grabar,&
this.cb_limpiar,&
this.em_cuotas,&
this.st_1,&
this.cb_cerrar,&
this.rb_ch_30_dias,&
this.st_16,&
this.dw_lista,&
this.st_canal,&
this.st_canal_ni}
end on

on w_ingreso_pie_pactado.destroy
destroy(this.dw_pago_pie)
destroy(this.st_4)
destroy(this.st_canal_nf)
destroy(this.em_dias_cheque)
destroy(this.rb_otra_fecha_ch)
destroy(this.rb_ch_dia)
destroy(this.pb_ok)
destroy(this.em_total_pie)
destroy(this.st_2)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.cb_limpiar)
destroy(this.em_cuotas)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.rb_ch_30_dias)
destroy(this.st_16)
destroy(this.dw_lista)
destroy(this.st_canal)
destroy(this.st_canal_ni)
end on

event open;Long		ll_tot_reg,ll_indi,ll_suma
String	ls_estado
Double	ldb_monto_pie

idt_fecha_hoy								= date(gdt_fec_sistema)
dw_lista.settransobject(sqlca)
dw_pago_pie.settransobject(sqlca)
is_base 										= trim(substr(1,1,Message.StringParm))
is_serie										= trim(substr(1,2,Message.StringParm))
il_numero									= Double(substr(1,3,Message.StringParm))
idb_pie										= double(substr(1,4,Message.StringParm))
is_uso										= substr(1,5,Message.StringParm)
is_estado									= substr(1,6,Message.StringParm)
is_moneda									= substr(1,7,Message.StringParm)
if (is_base='F' or is_base='G' or is_base='V') and isvalid(w_ingresar_funeraria) then 
	is_estado='M'
	dw_lista.object.estado.protect		= 0
else
	dw_lista.object.estado.protect		= 1
end if
if is_estado='M' then
	ll_tot_reg								= dw_lista.retrieve(is_base,is_serie,il_numero,'S')
	w_ingreso_pie_pactado.height		= 1432
else
	if gs_depto='I' or gs_digita='1' then
		ll_tot_reg								= dw_lista.retrieve(is_base,is_serie,il_numero,'S')
	else
		ll_tot_reg								= dw_lista.retrieve(is_base,is_serie,il_numero,'N')
	end if
	if dw_pago_pie.retrieve(is_base,is_serie,il_numero)=0 then 
		w_ingreso_pie_pactado.height	= 1432
	else
		w_ingreso_pie_pactado.height	= 2052
	end if
end if
gf_centrar(w_ingreso_pie_pactado)
if is_estado='M' then
	st_canal.text							= is_uso
	if ll_tot_reg>0 then
		em_cuotas.text						= string(ll_tot_reg)
		ldb_monto_pie						= dw_lista.getitemnumber(1,'c_sum_pie')
		if ldb_monto_pie<>idb_pie then
			dw_lista.object.t_mensaje_pie.visible	= true
		else
			dw_lista.object.t_mensaje_pie.visible	= false
		end if
	else
		em_cuotas.text						= '2'
	end if
	em_total_pie.text						= substr(1,4,Message.StringParm)
	if is_uso='NI' then
		st_canal_ni.text						= is_uso
		st_canal_ni.visible					= true
		st_canal_nf.visible					= false
		st_canal.visible						= false
	elseif is_uso='NF' then
		st_canal_nf.text					= is_uso
		st_canal_nf.visible					= true
		st_canal_ni.visible					= false
		st_canal.visible						= false
	else
		st_canal_ni.visible					= false
		st_canal_nf.visible					= false
		st_canal.visible						= true
		st_canal.text						= 'XXX'
	end if
	rb_ch_dia.visible						= true
	rb_ch_30_dias.visible					= true
	rb_otra_fecha_ch.visible				= true
	st_16.visible								= true
	em_dias_cheque.visible				= true
	pb_ok.visible							= true
	cb_grabar.visible						= true
	cb_eliminar.visible						= true
	cb_limpiar.visible						= true
	for ll_indi=1 to ll_tot_reg
		ls_estado							= dw_lista.getitemstring(ll_indi,'estado')
		if ls_estado='C' then
			ll_suma ++
		end if
	next
	if ll_suma > 0  and not isvalid(w_ingresar_funeraria) then
		em_cuotas.enabled				= false
		cb_grabar.enabled					= false
		cb_eliminar.enabled				= false
		cb_limpiar.enabled				= false
		pb_ok.enabled						= false
	elseif isvalid(w_ingresar_funeraria) then
		em_cuotas.enabled				= true
		cb_grabar.enabled					= true
		cb_eliminar.enabled				= true
		cb_limpiar.enabled				= true
		pb_ok.enabled						= true
	end if
else
	rb_ch_dia.visible						= false
	rb_ch_30_dias.visible					= false
	rb_otra_fecha_ch.visible				= false
	st_16.visible								= false
	em_dias_cheque.visible				= false
	pb_ok.visible							= false
	if gs_depto='I' or gs_digita='1' then
		cb_grabar.enabled					= true
	else
		cb_grabar.visible					= false
	end if
	cb_eliminar.visible						= false
	cb_limpiar.visible						= false
	em_cuotas.enabled					= false
	if ll_tot_reg>0 then
		em_cuotas.text						= string(ll_tot_reg)
		is_uso								= dw_lista.getitemstring(1,'canal')
		em_total_pie.text					= string(dw_lista.getitemnumber(1,'c_sum_pie'),"###,###,###,##0.0###")
		if is_uso='NI' then
			st_canal_ni.text					= is_uso
			st_canal_ni.visible				= true
			st_canal_nf.visible				= false
			st_canal.visible					= false
		elseif is_uso='NF' then
			st_canal_nf.text				= is_uso
			st_canal_nf.visible				= true
			st_canal_ni.visible				= false
			st_canal.visible					= false
		else
			st_canal_ni.visible				= false
			st_canal_nf.visible				= false
			st_canal.visible					= true
			st_canal.text					= 'XXX'
		end if
		dw_lista.object.t_mensaje_pie.visible	= false
	else
		messagebox("Advertencia","No Registra Pie Pactado")
		close(w_ingreso_pie_pactado)
	end if
end if
end event

event close;cb_cerrar.triggerevent(clicked!)
end event

type dw_pago_pie from datawindow within w_ingreso_pie_pactado
integer x = 82
integer y = 1344
integer width = 3035
integer height = 672
integer taborder = 40
string title = "none"
string dataobject = "dw_detalle_pago_pie_pactado"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type st_4 from statictext within w_ingreso_pie_pactado
integer x = 2473
integer y = 68
integer width = 201
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Canal:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_canal_nf from statictext within w_ingreso_pie_pactado
integer x = 2693
integer y = 36
integer width = 402
integer height = 140
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_dias_cheque from editmask within w_ingreso_pie_pactado
integer x = 1957
integer y = 224
integer width = 187
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
end type

event modified;if this.text<>'' and not isnull(this.text) then
	if long(this.text)>50 then
		messagebox("Advertencia","Excedió en Días para el Primer Pago")
		this.text	= ''
	elseif long(this.text)<=0 then
		messagebox("Advertencia","Número Día inválido")
		this.text	= ''
	else
		if long(em_total_pie.text)>0 and long(em_cuotas.text)>0 then pb_ok.triggerevent(modified!)
	end if
	em_cuotas.setfocus()
end if
end event

type rb_otra_fecha_ch from radiobutton within w_ingreso_pie_pactado
integer x = 1783
integer y = 156
integer width = 357
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Otra Fecha"
end type

event clicked;em_dias_cheque.enabled	= true
dw_lista.reset()
em_dias_cheque.setfocus()

end event

type rb_ch_dia from radiobutton within w_ingreso_pie_pactado
integer x = 1783
integer y = 20
integer width = 357
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Al día"
boolean checked = true
end type

event clicked;em_dias_cheque.text		= ''
em_dias_cheque.enabled	= false
dw_lista.reset()
if long(em_cuotas.text)>0 and long(em_total_pie.text)>0 then pb_ok.triggerevent(modified!)
em_cuotas.setfocus()
end event

type pb_ok from picturebutton within w_ingreso_pie_pactado
integer x = 2231
integer y = 24
integer width = 178
integer height = 156
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;long		ll_cuotas,ll_indi,ll_new,ll_day,ll_month,ll_year,ll_dias
Double	ldb_monto_cuota,ldb_total_pie,ldb_cuota_ultima
Date		ld_fecha_cheque_prim
String	ls_fecha
ll_cuotas											= long(em_cuotas.text)
if ll_cuotas>1 and ll_cuotas<=10 then
	dw_lista.reset()
	ldb_monto_cuota							= round((idb_pie / ll_cuotas),4)
	if rb_ch_dia.checked=true then
		ld_fecha_cheque_prim				= idt_fecha_hoy
	elseif rb_ch_30_dias.checked=true then
		ll_day										= day(idt_fecha_hoy)
		ll_month									= month(idt_fecha_hoy)
		ll_year									= year(idt_fecha_hoy)
		if (ll_month=1 and ll_day>31) or (ll_month=3 and ll_day>31) or (ll_month=5 and ll_day>31) or &
			(ll_month=7 and ll_day>31) or (ll_month=8 and ll_day>31) or (ll_month=10 and ll_day>31) or &
			(ll_month=12 and ll_day>31) then
			ll_day									= 1
		elseif ll_month=2 and ll_day>28 then
			ll_day									= 1
		elseif (ll_month=4 and ll_day>30) or (ll_month=6 and ll_day>30) or (ll_month=9 and ll_day>30) or &
			(ll_month=11 and ll_day>30) then
			ll_day									= 1
		end if
		ll_month	++
		if ll_month>12 then
			ll_year ++
			ll_month								= 1
		end if
		ls_fecha									= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
		ld_fecha_cheque_prim	= date(ls_fecha)
	elseif rb_otra_fecha_ch.checked=true then
		ll_dias									= long(em_dias_cheque.text)
		ld_fecha_cheque_prim				= RelativeDate(idt_fecha_hoy, ll_dias)
	end if
	ld_fecha_cheque_prim					= date(datetime(ld_fecha_cheque_prim,time('00:00:00')))
	for ll_indi=1 to ll_cuotas
		ll_new									= dw_lista.insertrow(0)
		dw_lista.setitem(ll_new,'fecha_crea',datetime(date(gdt_fec_sistema),time('00:00:00')))
		dw_lista.setitem(ll_new,'numero_cuota',ll_indi)
		dw_lista.setitem(ll_new,'monto_cuota',ldb_monto_cuota)
		dw_lista.setitem(ll_new,'fecha_venc_cta',ld_fecha_cheque_prim)
		dw_lista.setitem(ll_new,'estado','P')
		dw_lista.setitem(ll_new,'base',is_base)
		dw_lista.setitem(ll_new,'serie',is_serie)
		dw_lista.setitem(ll_new,'numero',il_numero)
		dw_lista.setitem(ll_new,'canal',is_uso)
		dw_lista.setitem(ll_new,'moneda',is_moneda)
		ll_day										= day(ld_fecha_cheque_prim)// idt_fecha_hoy
		ll_month									= month(ld_fecha_cheque_prim)
		ll_year									= year(ld_fecha_cheque_prim)
		if (ll_month=1  and ll_day>=28)  then ll_day=28
		if (ll_month=2  and ll_day>=31)  then ll_day=31
		if (ll_month=3  and ll_day>=30)  then ll_day=30
		if (ll_month=4  and ll_day>=31)  then ll_day=31
		if (ll_month=5  and ll_day>=30)  then ll_day=30
		if (ll_month=6  and ll_day>=31)  then ll_day=31
		if (ll_month=7  and ll_day>=31)  then ll_day=31
		if (ll_month=8  and ll_day>=30)  then ll_day=30
		if (ll_month=9  and ll_day>=31)  then ll_day=31
		if (ll_month=10 and ll_day>=30)  then ll_day=30
		if (ll_month=11 and ll_day>=31)  then ll_day=31
		if (ll_month=12 and ll_day>=31)  then ll_day=31
		ll_month	++
		if ll_month>12 then
			ll_year ++
			ll_month									= 1
		end if
		ls_fecha										= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
		ld_fecha_cheque_prim					= date(ls_fecha)
	next
	ldb_total_pie									= double(dw_lista.getitemnumber(1,'c_sum_pie'))
	if idb_pie <> ldb_total_pie then
		ldb_total_pie								= idb_pie - ldb_total_pie
		ldb_cuota_ultima							= double(dw_lista.getitemnumber(dw_lista.rowcount(),'monto_cuota'))
		dw_lista.setitem(dw_lista.rowcount(),'monto_cuota',ldb_cuota_ultima + ldb_total_pie)
	end if
	dw_lista.object.t_mensaje_pie.visible		= false
	if dw_lista.rowcount() > 0 then 
		dw_lista.scrolltorow(1)
		if (is_base='F' or is_base='G' or is_base='V') and isvalid(w_ingresar_funeraria) then 
			dw_lista.object.estado.protect		= 0
		else
			dw_lista.object.estado.protect		= 1
		end if
	end if
	dw_lista.accepttext()
end if
end event

type em_total_pie from editmask within w_ingreso_pie_pactado
integer x = 379
integer y = 52
integer width = 393
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0.0###"
end type

type st_2 from statictext within w_ingreso_pie_pactado
integer x = 27
integer y = 68
integer width = 343
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Monto Total PIE"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_eliminar from commandbutton within w_ingreso_pie_pactado
integer x = 635
integer y = 1120
integer width = 311
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long	ll_resp
if il_row>0 then
	ll_resp	= messagebox("Eliminar","Está seguro de Eliminar Cuota Nº "+string(il_row)+", recuerde antes de salir debe Grabar",Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_lista.deleterow(il_row)
		dw_lista.accepttext()
	end if
end if
end event

type cb_grabar from commandbutton within w_ingreso_pie_pactado
integer x = 27
integer y = 1120
integer width = 311
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Double	ldb_total_pie,ldb_pie
Long		ll_ult_folio,ll_ctas_pactadas,ll_tot_reg,ll_indi,ll_indi_siguiente,ll_fila,ll_suma_c
String		ls_pasa,ls_estado
Date		ldt_fecha,ldt_fecha_despues,ldt_fecha_antes,ldt_fecha_hoy,ldt_nula

dw_lista.accepttext()
ll_suma_c							= 0
ls_pasa								= 'S'
Setnull(ldt_nula)
ldt_fecha_hoy						= date(gdt_fec_sistema)
ll_tot_reg							= dw_lista.rowcount()
if ll_tot_reg > 1 then
	for ll_indi=1 to ll_tot_reg
		ll_indi_siguiente			= ll_indi + 1
		ldt_fecha						= Date(dw_lista.getitemdatetime(ll_indi,'fecha_venc_cta'))
		ldt_fecha_antes			= RelativeDate(ldt_fecha_hoy,  - 300)
		ldt_fecha_despues			= RelativeDate(ldt_fecha_hoy,  100)
		if ldt_fecha < ldt_fecha_antes or ldt_fecha > ldt_fecha_despues then
			ls_pasa					= 'N'
			messagebox("Advertencia","Fecha de Vencimiento Inválida en Fila "+string(ll_fila))
			dw_lista.Setfocus()
			dw_lista.scrolltorow(ll_fila)
			dw_lista.setitem(ll_fila,'fecha_venc_cta',ldt_nula)
			dw_lista.accepttext()
			dw_lista.Setcolumn('fecha_venc_cta')
		elseif isnull(ldt_fecha) or ldt_fecha = date('00/00/0000') then
			ls_pasa					= 'N'
			messagebox("Advertencia","Debe Ingresar Fecha de Vencimiento en Fila "+string(ll_fila))
			dw_lista.Setfocus()
			dw_lista.scrolltorow(ll_fila)
			dw_lista.Setcolumn('fecha_venc_cta')
		elseif ll_indi_siguiente <= ll_tot_reg then
			ldt_fecha_despues		= Date(dw_lista.getitemdatetime(ll_indi_siguiente,'fecha_venc_cta'))
			if ldt_fecha > ldt_fecha_despues then
				ls_pasa				= 'N'
				messagebox("Advertencia","Fechas Ingresadas Inválidas, Fecha Vencimiento Cuota "+string(ll_indi)+" NO puede ser Mayor a Fecha Vencimiento Cuota "+string(ll_indi_siguiente))
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi_siguiente)
				dw_lista.setcolumn('fecha_venc_cta')
			end if
		end if
	next
end if
if ls_pasa='S' then
	ldb_total_pie					= round(double(dw_lista.getitemnumber(1,'c_sum_pie')),4)
	ldb_pie							= round(double(trim(em_total_pie.text)),4)
	if ldb_pie = ldb_total_pie then
		ll_ctas_pactadas			= long(em_cuotas.text)
		if isnull(ll_ctas_pactadas) then ll_ctas_pactadas=0
		if ll_ctas_pactadas = 0 then
			SELECT MAX( "DETALLE_PAGO_PIE"."NUMERO_CUOTA"  )
			INTO 		:ll_ctas_pactadas  
			FROM 	"DETALLE_PAGO_PIE"  
			WHERE 	( "DETALLE_PAGO_PIE"."BASE" = :is_base ) AND  
						( "DETALLE_PAGO_PIE"."SERIE" = :is_serie ) AND  
						( "DETALLE_PAGO_PIE"."NUMERO" = :il_numero )   ;
			if isnull(ll_ctas_pactadas) then ll_ctas_pactadas=0
		end if
		if dw_lista.update()=1 then
			commit;
			if is_base='O' or is_base='U' then
				SELECT	"PAGO_OFERTA"."FOLIO"  
				INTO 		:ll_ult_folio  
				FROM 	"OFERTA_V","PAGO_OFERTA",	"CADENA"  
				WHERE	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE"and  
							"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
							"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
							"OFERTA_V"."SERIE" = "CADENA"."SERIE" and  
							"OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" and  
							"CADENA"."CODIGO" = :is_base AND  
							"OFERTA_V"."SERIE" = :is_serie AND  
							"OFERTA_V"."NRO_OFERTA" = :il_numero   
				USING	sqlca;
			elseif is_base='F' or is_base='G' or is_base='V' then
				SELECT	"PRODUCTO_PAGO"."FOLIO"  
				INTO 		:ll_ult_folio  
				FROM 	"PRODUCTO_ANEXO","PRODUCTO_PAGO","CADENA"  
				WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
							"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE"and  
							"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
							"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and
							"PRODUCTO_ANEXO"."BASE" = "CADENA"."CODIGO" and  
							"PRODUCTO_ANEXO"."SERIE" = "CADENA"."SERIE" and  
							"PRODUCTO_ANEXO"."NUMERO" = "CADENA"."NUMERO" and  
							"CADENA"."CODIGO" = :is_base AND  
							"PRODUCTO_ANEXO"."SERIE" = :is_serie AND  
							"PRODUCTO_ANEXO"."NUMERO" = :il_numero   
				USING	sqlca;
			elseif is_base='A' then
				SELECT 	"PAGO_AUMENTO"."FOLIO"  
				INTO 		:ll_ult_folio  
				FROM 	"PAGO_AUMENTO",  "ANEXO_AUMENTO",   	"CADENA"  
				WHERE 	( "PAGO_AUMENTO"."SERIE_M" = "ANEXO_AUMENTO"."SERIE_M" ) and  
							( "PAGO_AUMENTO"."NRO_AUMENTO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
							( "PAGO_AUMENTO"."FOLIO" = "ANEXO_AUMENTO"."ULT_FOLIO" ) and  
							( "CADENA"."SERIE" = "PAGO_AUMENTO"."SERIE_M" ) and  
							( "CADENA"."NUMERO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
							( "CADENA"."CODIGO" = "PAGO_AUMENTO"."BASE" ) and  
							( ( "PAGO_AUMENTO"."BASE" = :is_base ) AND  
							( "PAGO_AUMENTO"."SERIE_M" = :is_serie ) AND  
							( "PAGO_AUMENTO"."NRO_AUMENTO" = :il_numero ) )  
				USING	sqlca;

			elseif is_base='L' then
				SELECT 	"PAGO_LIBERADOR"."FOLIO"  
				INTO 		:ll_ult_folio  
				FROM 	"ANEXO_LIBERADOR",   "CADENA",   "PAGO_LIBERADOR"  
				WHERE 	( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
							( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
							( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
							( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
							( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
							( "CADENA"."CODIGO" = "PAGO_LIBERADOR"."BASE" ) and  
							( ( "CADENA"."CODIGO" = :is_base ) AND  
							( "ANEXO_LIBERADOR"."SERIE_M" = :is_serie ) AND  
							( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :il_numero ) )
				USING	sqlca;
			end if
			if sqlca.sqlcode=0 then
				if (is_base='O' or is_base='U') and ll_ctas_pactadas > 0 then
					UPDATE	"PAGO_OFERTA"  
					SET 		"CTAS_PACTADAS_PIE" = :ll_ctas_pactadas   
					WHERE	"PAGO_OFERTA"."SERIE" = :is_serie AND  
								"PAGO_OFERTA"."NRO_OFERTA" = :il_numero AND  
								"PAGO_OFERTA"."FOLIO" = :ll_ult_folio  
					USING	sqlca;
				elseif ( is_base='F' or is_base='G' or is_base='V') and ll_ctas_pactadas > 0 then
					ll_tot_reg							= dw_lista.rowcount()
					if ll_tot_reg > 1 then
						for ll_indi=1 to ll_tot_reg
							ls_estado					= dw_lista.getitemstring(ll_indi,'estado')
							if ls_estado 	= 'C' then
								ll_suma_c ++
							end if
						next
					end if
					UPDATE	"PRODUCTO_PAGO"  
					SET 		"CTAS_PIE_PLAZO" = :ll_ctas_pactadas,
								"CTAS_PIE_PAGADAS" = :ll_suma_c
					WHERE	"PRODUCTO_PAGO"."SERIE" = :is_serie AND  
								"PRODUCTO_PAGO"."NUMERO" = :il_numero AND  
								"PRODUCTO_PAGO"."FOLIO" = :ll_ult_folio  
					USING	sqlca;
				elseif is_base='A' and ll_ctas_pactadas > 0 then
					UPDATE	"PAGO_AUMENTO"  
					SET 		"CTAS_PACTADAS_PIE" = :ll_ctas_pactadas   
					WHERE	"PAGO_AUMENTO"."SERIE_M" = :is_serie AND  
								"PAGO_AUMENTO"."NRO_AUMENTO" = :il_numero AND  
								"PAGO_AUMENTO"."FOLIO" = :ll_ult_folio  
					USING		sqlca;
				elseif is_base='L' and ll_ctas_pactadas > 0 then
					UPDATE	"PAGO_LIBERADOR"  
					SET 		"CTAS_PACTADAS_PIE" = :ll_ctas_pactadas   
					WHERE	"PAGO_LIBERADOR"."SERIE_M" = :is_serie AND  
								"PAGO_LIBERADOR"."NRO_LIBERADOR" = :il_numero AND  
								"PAGO_LIBERADOR"."FOLIO" = :ll_ult_folio  
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			end if
			messagebox("Grabar","Grabación Exitosa")
			cb_cerrar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	else
		messagebox("Advertencia","Valor Cuota Pie Incorrecta, no cuadra con Total: "+string(ldb_pie,"###,###,###,##0.0###") +" la suma de cuota(s) es: "+string(ldb_total_pie,"###,###,###,##0.0###"))
		dw_lista.setfocus()
	end if
end if
end event

type cb_limpiar from commandbutton within w_ingreso_pie_pactado
integer x = 1230
integer y = 1120
integer width = 325
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_lista.reset()
//em_total_pie.text	= ''
em_cuotas.text			= '2'
il_mod_pie				= 0
end event

type em_cuotas from editmask within w_ingreso_pie_pactado
integer x = 1376
integer y = 52
integer width = 288
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###"
boolean spin = true
end type

event modified;long		ll_cuotas,ll_indi,ll_new,ll_tot_reg,ll_suma=0,ll_resp
Double	ldb_monto_pie
String		ls_estado

il_mod_pie									= 0
ll_cuotas												= long(em_cuotas.text)
cb_grabar.enabled									= true
pb_ok.enabled										= true
if ll_cuotas > 1 and ll_cuotas <= 10 then
	ll_tot_reg										= dw_lista.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_estado								= dw_lista.getitemstring(ll_indi,'estado')
			if ls_estado='C' then
				ll_suma ++
			end if
		next
		if ll_suma=0 then
			ll_resp									= messagebox("Advertencia","Acepta Cambiar Modo de Pactar Pie, recuerde grabar cambios de la Promesa",Exclamation!,YesNo!,2)
			if ll_resp=1 then
				DELETE FROM   "DETALLE_PAGO_PIE"  
				WHERE 		( "DETALLE_PAGO_PIE"."BASE" = :is_base ) AND  
								( "DETALLE_PAGO_PIE"."SERIE" = :is_serie ) AND  
								( "DETALLE_PAGO_PIE"."NUMERO" = :il_numero )   
				USING	 sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				dw_lista.reset()
				pb_ok.setfocus()
				pb_ok.triggerevent(clicked!)
			else
				ldb_monto_pie						= dw_lista.getitemnumber(1,'c_sum_pie')
				em_total_pie.text					= string(ldb_monto_pie,"###,###,###,##0.0###")
				em_cuotas.text						= string(ll_tot_reg)
				
				if isvalid(w_ingresar_oferta) then
					w_ingresar_oferta.dw_oferta_v.Setitem(1,'pago_oferta_pie',ldb_monto_pie)
					w_ingresar_oferta.dw_oferta_v.accepttext()
				elseif isvalid(w_ingresar_funeraria) then
					w_ingresar_funeraria.dw_anexo_funeraria.Setitem(1,'producto_pago_pie',ldb_monto_pie)
					w_ingresar_funeraria.dw_anexo_funeraria.accepttext()
				end if
				
				cb_cerrar.triggerevent(clicked!)
			end if
		else
			if (is_base='F' or is_base='G' or is_base='V') and isvalid(w_ingresar_funeraria) then 
				cb_grabar.enabled		= true
				pb_ok.enabled			= true
			else
				messagebox("Advertencia","No es posible Cambiar Cuotas pactadas, ya existen Pagos Asociados")
				em_cuotas.text			= string(ll_tot_reg)
				cb_grabar.enabled		= false
				pb_ok.enabled			= false
			end if
		end if
	else
		dw_lista.reset()
		pb_ok.setfocus()
//		pb_ok.triggerevent(clicked!)
	end if
else
	messagebox("Advertencia","Se permite pactar 2 a 10 Cuotas")
	dw_lista.reset()
	em_cuotas.text					= '2'
	em_cuotas.setfocus()
end if
end event

type st_1 from statictext within w_ingreso_pie_pactado
integer x = 791
integer y = 68
integer width = 539
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Cuotas a Pactar PIE"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_ingreso_pie_pactado
integer x = 2830
integer y = 1120
integer width = 343
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Long		ll_count_pie,ll_res,ll_contar_reg

if (is_base='F' or is_base='G' or is_base='V') and isvalid(w_ingresar_funeraria) and is_estado='M' then
	SELECT 	Count("DETALLE_PAGO_PIE"."BASE")
	INTO 		:ll_count_pie  
	FROM 	"DETALLE_PAGO_PIE"  
	WHERE 	( "DETALLE_PAGO_PIE"."BASE" = :gs_base ) AND  
				( "DETALLE_PAGO_PIE"."SERIE" = :gs_serie ) AND  
				( "DETALLE_PAGO_PIE"."NUMERO" = :gi_numero )   ;
	if isnull(ll_count_pie) then ll_count_pie=0
	ll_contar_reg	= dw_lista.rowcount()
	if ll_count_pie = 0 and ll_contar_reg > 0 then
		ll_res			= messagebox("Advertencia","Desea Salir sin Grabar Detalle Pie Pactado",Exclamation!,YesNo!,2)
		if ll_res=1 then
			close(w_ingreso_pie_pactado)
		end if
	else
		close(w_ingreso_pie_pactado)
	end if
else
	close(w_ingreso_pie_pactado)
end if

end event

type rb_ch_30_dias from radiobutton within w_ingreso_pie_pactado
integer x = 1783
integer y = 88
integer width = 357
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "a 30 días"
end type

event clicked;em_dias_cheque.text		= ''
em_dias_cheque.enabled	= false
dw_lista.reset()
if long(em_cuotas.text)>0 and long(em_total_pie.text)>0 then pb_ok.triggerevent(modified!)
em_cuotas.setfocus()
end event

type st_16 from statictext within w_ingreso_pie_pactado
integer x = 1774
integer y = 236
integer width = 178
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Días"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_ingreso_pie_pactado
integer x = 27
integer y = 28
integer width = 3150
integer height = 1048
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_ingreso_detalle_pie"
boolean vscrollbar = true
boolean border = false
end type

event clicked;if row>0 then 
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then 
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event itemchanged;String		ls_columna,ls_tipo_cob,ls_caja,ls_usuario
Date		ldt_fecha,ldt_fecha_antes,ldt_fecha_despues,ldt_fecha_hoy,ldt_nula
datetime	ldt_fecha_pago
Long		ll_fila,ll_tot_reg,ll_indi,ll_indi_siguiente,ll_cuota_pie,ll_nro_reg,ll_count_a
Double	ll_folio,ll_monto

Setnull(ldt_nula)
this.accepttext()
ll_nro_reg									= 0
il_row											= row
ls_columna									= dwo.name
ldt_fecha_hoy								= date(gdt_fec_sistema)
if ls_columna='fecha_venc_cta' then
	ll_fila										= dw_lista.getrow()
	ldt_fecha									= Date(dw_lista.getitemdatetime(ll_fila,'fecha_venc_cta'))
	ldt_fecha_antes						= RelativeDate(ldt_fecha_hoy,  - 300)
	ldt_fecha_despues						= RelativeDate(ldt_fecha_hoy,  100)
	if ldt_fecha < ldt_fecha_antes or ldt_fecha > ldt_fecha_despues then
		messagebox("Advertencia","Fecha de Vencimiento Inválida en Fila "+string(ll_fila))
		dw_lista.Setfocus()
		dw_lista.scrolltorow(ll_fila)
		dw_lista.setitem(ll_fila,'fecha_venc_cta',ldt_nula)
		dw_lista.accepttext()
		dw_lista.Setcolumn('fecha_venc_cta')
	elseif isnull(ldt_fecha) or ldt_fecha = date('00/00/0000') then
		messagebox("Advertencia","Debe Ingresar Fecha de Vencimiento en Fila "+string(ll_fila))
		dw_lista.Setfocus()
		dw_lista.scrolltorow(ll_fila)
		dw_lista.Setcolumn('fecha_venc_cta')
	else
		ll_tot_reg							= dw_lista.rowcount()
		if ll_tot_reg > 1 then
			for ll_indi=1 to ll_tot_reg
				ll_indi_siguiente			= ll_indi + 1
				ldt_fecha						= Date(dw_lista.getitemdatetime(ll_indi,'fecha_venc_cta'))
				if ll_indi_siguiente <= ll_tot_reg then
					ldt_fecha_despues		= Date(dw_lista.getitemdatetime(ll_indi_siguiente,'fecha_venc_cta'))
					if ldt_fecha > ldt_fecha_despues then
						messagebox("Advertencia","Fechas Ingresadas Inválidas, Fecha Vencimiento Cuota "+string(ll_indi)+" NO puede ser Mayor a Fecha Vencimiento Cuota "+string(ll_indi_siguiente))
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi_siguiente)
						dw_lista.setcolumn('fecha_venc_cta')
					end if
				end if
			next
		end if
	end if
elseif ls_columna='estado' and isvalid(w_ingresar_funeraria) then
	ll_cuota_pie								= dw_lista.getitemnumber(row,'numero_cuota')
	if ll_cuota_pie > 0 then
		SELECT  count( "INGRESO"."TIPO_COB" )
		INTO		:ll_count_a
		FROM 	"INGRESO"  
		WHERE	( "INGRESO"."BASE" = :is_base ) AND  
					( "INGRESO"."SERIE" = :is_serie ) AND  
					( "INGRESO"."CONTRATO" = :il_numero ) AND  
					( "INGRESO"."PAGO_HIST" = 'A' ) AND  
					( "INGRESO"."TIPO_MOV" = 'A' )   
		using		sqlca;
		
		DECLARE x1 CURSOR FOR  
		SELECT  DISTINCT "INGRESO"."TIPO_COB", 		"INGRESO"."FOLIO",	"INGRESO"."FECHA_PAGO",	"INGRESO"."COD_CAJA",	sum("INGRESO"."MONTO") as MONTO  
		FROM 	"INGRESO"  
		WHERE	( "INGRESO"."BASE" = :is_base ) AND  
					( "INGRESO"."SERIE" = :is_serie ) AND  
					( "INGRESO"."CONTRATO" = :il_numero ) AND  
					( "INGRESO"."PAGO_HIST" = 'A' ) AND  
					( "INGRESO"."TIPO_MOV" = 'A' )   
		GROUP BY 	"INGRESO"."TIPO_COB",   
						"INGRESO"."FOLIO",   
						"INGRESO"."FECHA_PAGO",   
						"INGRESO"."COD_CAJA"
		ORDER BY 	"INGRESO"."FECHA_PAGO" ASC,   
						"INGRESO"."FOLIO" ASC  
		using		sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			do while sqlca.sqlcode=0
				Fetch x1 into :ls_tipo_cob, :ll_folio, :ldt_fecha_pago, :ls_caja, :ll_monto;	//, :ls_usuario;
				if not isnull(ll_folio) then
					ll_nro_reg ++
					if ll_nro_reg = ll_cuota_pie then
						dw_lista.setitem(ll_nro_reg,'tipo_cob',ls_tipo_cob)
						dw_lista.setitem(ll_nro_reg,'folio',ll_folio)
						dw_lista.setitem(ll_nro_reg,'fecha_pago',date(ldt_fecha_pago))
						dw_lista.setitem(ll_nro_reg,'caja',ls_caja)
						dw_lista.setitem(ll_nro_reg,'monto_pie_pagado_peso', ll_monto)
						dw_lista.setitem(ll_nro_reg,'usuario', gs_user)
						dw_lista.accepttext()
						exit
					end if
				end if
				setnull(ll_folio)
			loop
		end if
		close x1;
		if ll_cuota_pie > ll_count_a then
			messagebox("Advertencia","No es posible Cambiar Estado, No existe Pago")
			il_mod_pie ++
			dw_lista.setitem(il_row,'estado','P')
			dw_lista.accepttext()
			dw_lista.setcolumn('fecha_venc_cta')
			dw_lista.accepttext()
		end if
	end if
end if
dw_lista.accepttext()
end event

event itemfocuschanged;Date		ldt_fecha,ldt_fecha_antes,ldt_fecha_despues,ldt_fecha_hoy,ldt_nula
Long		ll_fila,ll_tot_reg,ll_indi,ll_indi_siguiente
String		ls_tipo_cob,ls_estado

//Setnull(ldt_nula)
dw_lista.accepttext()
ll_tot_reg									= dw_lista.rowcount()
if ll_tot_reg > 0 then
	ldt_fecha_hoy							= date(gdt_fec_sistema)
	ll_fila										= dw_lista.getrow()
	ldt_fecha									= Date(dw_lista.getitemdatetime(ll_fila,'fecha_venc_cta'))
	ldt_fecha_antes						= RelativeDate(ldt_fecha_hoy,  - 300)
	ldt_fecha_despues						= RelativeDate(ldt_fecha_hoy,  100)
	if ldt_fecha < ldt_fecha_antes or ldt_fecha > ldt_fecha_despues then
//		messagebox("Advertencia","Fecha de Vencimiento Inválida en Fila "+string(ll_fila))
//		dw_lista.setitem(ll_fila,'fecha_venc_cta',ldt_nula)
		dw_lista.accepttext()
		dw_lista.Setfocus()
		dw_lista.scrolltorow(ll_fila)
		dw_lista.Setcolumn('fecha_venc_cta')
	elseif isnull(ldt_fecha) or ldt_fecha = date('00/00/0000') then
//		messagebox("Advertencia","Debe Ingresar Fecha de Vencimiento en Fila "+string(ll_fila))
		dw_lista.Setfocus()
		dw_lista.scrolltorow(ll_fila)
		dw_lista.Setcolumn('fecha_venc_cta')
	else
		
		if ll_tot_reg > 1 then
			for ll_indi=1 to ll_tot_reg
				ll_indi_siguiente			= ll_indi + 1
				ldt_fecha						= Date(dw_lista.getitemdatetime(ll_indi,'fecha_venc_cta'))
				if ll_indi_siguiente <= ll_tot_reg then
					ldt_fecha_despues		= Date(dw_lista.getitemdatetime(ll_indi_siguiente,'fecha_venc_cta'))
					if ldt_fecha > ldt_fecha_despues then
//						messagebox("Advertencia","Fechas Ingresadas Inválidas, Fecha Vencimiento Cuota "+string(ll_indi)+" NO puede ser Mayor a Fecha Vencimiento Cuota "+string(ll_indi_siguiente))
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi_siguiente)
						dw_lista.setcolumn('fecha_venc_cta')
					end if
				end if
				ls_tipo_cob					= dw_lista.getitemstring(ll_indi,'tipo_cob')
				ls_estado					= dw_lista.getitemstring(ll_indi,'estado')
				if ( isnull(ls_tipo_cob) or ls_tipo_cob='' ) and ls_estado <> 'P' then
					dw_lista.setitem(ll_indi,'estado','P')
				end if
			next
		end if
	end if
//	messagebox("il_mod_pie / il_row",string(il_mod_pie)+' / '+string(il_row))
//	if il_mod_pie > 0 then
//		dw_lista.setitem(il_row,'estado','P')
//	end if
end if
dw_lista.accepttext()
end event

type st_canal from statictext within w_ingreso_pie_pactado
integer x = 2560
integer y = 36
integer width = 402
integer height = 140
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_canal_ni from statictext within w_ingreso_pie_pactado
integer x = 2560
integer y = 36
integer width = 402
integer height = 140
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

