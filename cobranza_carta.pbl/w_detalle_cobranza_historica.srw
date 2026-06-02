forward
global type w_detalle_cobranza_historica from window
end type
type cb_cerrar from commandbutton within w_detalle_cobranza_historica
end type
type dw_detalle from datawindow within w_detalle_cobranza_historica
end type
end forward

global type w_detalle_cobranza_historica from window
integer width = 3159
integer height = 2220
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_detalle_cobranza_historica w_detalle_cobranza_historica

type variables
String		is_tipo,is_base,is_serie,is_estado
Long		il_rut
Datetime	idt_fecha
Double	il_numero
end variables

on w_detalle_cobranza_historica.create
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_cerrar,&
this.dw_detalle}
end on

on w_detalle_cobranza_historica.destroy
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;String	ls_fecha,lt_time
Date		ld_fecha

gf_centrar(w_detalle_cobranza_historica)
is_tipo 			= trim(substr(1,1,Message.StringParm))
if is_tipo='AP' then
	is_base		= trim(substr(1,2,Message.StringParm))
	is_serie		= trim(substr(1,3,Message.StringParm))
	il_numero	= Double(trim(substr(1,4,Message.StringParm)))
	is_estado	= trim(substr(1,5,Message.StringParm))
	ls_fecha		= trim(substr(1,6,Message.StringParm))
	ld_fecha		= date(mid(ls_fecha,1,10))
	lt_time		= mid(ls_fecha,12,8)
	idt_fecha	= Datetime(ld_fecha,time(lt_time))
	il_rut		= Long(trim(substr(1,7,Message.StringParm)))
	dw_detalle.dataobject	= 'dw_lista_detalle_atencion_log'
	this.title	= 'Detalle Atención Público Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###,###')
elseif is_tipo='AT' then
	is_base		= trim(substr(1,2,Message.StringParm))
	is_serie		= trim(substr(1,3,Message.StringParm))
	il_numero	= Double(trim(substr(1,4,Message.StringParm)))
	is_estado	= trim(substr(1,5,Message.StringParm))
	ls_fecha		= trim(substr(1,6,Message.StringParm))
	ld_fecha		= date(mid(ls_fecha,1,10))
	lt_time		= mid(ls_fecha,12,8)
	idt_fecha	= Datetime(ld_fecha,time(lt_time))
	il_rut		= Long(trim(substr(1,7,Message.StringParm)))
	dw_detalle.dataobject	= 'dw_lista_detalle_tele_log'
	this.title	= 'Detalle Gestión Telefónica Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###,###')
elseif is_tipo='PA' then
	is_base		= trim(substr(1,2,Message.StringParm))
	is_serie		= trim(substr(1,3,Message.StringParm))
	il_numero	= Double(trim(substr(1,4,Message.StringParm)))
	is_estado	= trim(substr(1,5,Message.StringParm))
	ls_fecha		= trim(substr(1,6,Message.StringParm))
	ld_fecha		= date(mid(ls_fecha,1,10))
	lt_time		= mid(ls_fecha,12,8)
	idt_fecha	= Datetime(ld_fecha,time(lt_time))
	il_rut		= Long(trim(substr(1,7,Message.StringParm)))
	dw_detalle.dataobject	= 'dw_lista_detalle_parque_cob_historica'
	this.title	= 'Detalle Gestión Parque Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###,###')
elseif is_tipo='TE' then
	is_base		= trim(substr(1,2,Message.StringParm))
	is_serie		= trim(substr(1,3,Message.StringParm))
	il_numero	= Double(trim(substr(1,4,Message.StringParm)))
	is_estado	= trim(substr(1,5,Message.StringParm))
	ls_fecha		= trim(substr(1,6,Message.StringParm))
	ld_fecha		= date(mid(ls_fecha,1,10))
	lt_time		= mid(ls_fecha,12,8)
	idt_fecha		= Datetime(ld_fecha,time(lt_time))
	il_rut			= Long(trim(substr(1,7,Message.StringParm)))
	dw_detalle.dataobject	= 'dw_lista_detalle_atencion_log'
	this.title		= 'Detalle Gestión Atención Terreno Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###,###')
end if
dw_detalle.Settransobject(sqlca)
if dw_detalle.retrieve(il_rut,is_estado,idt_fecha,is_base,is_serie,il_numero)=0 then
	messagebox("Avertencia","No Registra Dato")
	close(w_detalle_cobranza_historica)
end if
end event

type cb_cerrar from commandbutton within w_detalle_cobranza_historica
integer x = 2743
integer y = 1924
integer width = 306
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_cobranza_historica)
end event

type dw_detalle from datawindow within w_detalle_cobranza_historica
integer x = 41
integer y = 40
integer width = 3049
integer height = 1844
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_detalle_atencion_log"
boolean border = false
boolean livescroll = true
end type

