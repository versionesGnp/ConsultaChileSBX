forward
global type w_mora_cliente from window
end type
type cb_4 from commandbutton within w_mora_cliente
end type
type cb_3 from commandbutton within w_mora_cliente
end type
type pb_fin from picturebutton within w_mora_cliente
end type
type pb_antes from picturebutton within w_mora_cliente
end type
type pb_sigue from picturebutton within w_mora_cliente
end type
type cb_2 from commandbutton within w_mora_cliente
end type
type cb_1 from commandbutton within w_mora_cliente
end type
type pb_primer from picturebutton within w_mora_cliente
end type
type dw_1 from uo_datawindow within w_mora_cliente
end type
type gb_1 from groupbox within w_mora_cliente
end type
end forward

global type w_mora_cliente from window
integer width = 3872
integer height = 2196
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_4 cb_4
cb_3 cb_3
pb_fin pb_fin
pb_antes pb_antes
pb_sigue pb_sigue
cb_2 cb_2
cb_1 cb_1
pb_primer pb_primer
dw_1 dw_1
gb_1 gb_1
end type
global w_mora_cliente w_mora_cliente

type variables
Long	 ll_fila
datawindow	dw_paso
end variables

event open;string 	sup,ls_canal
Long	 	i,ll_tot_reg

gf_centrar(w_mora_cliente)
this.title				= gs_app_name
sup 						= trim(Message.StringParm)
SELECT 	"SUPERVISOR"."CANAL"  
INTO 		:ls_canal  
FROM 		"SUPERVISOR"  
WHERE 	"SUPERVISOR"."COD_SUP" = :sup   ;
if ls_canal = 'NI' then
	dw_1.dataobject 	= 'dw_mora_promesas_036'
else
	dw_1.dataobject 	= 'dw_mora_promesas'
end if
dw_1.settransobject(sqlca)
if dw_1.retrieve(sup,cod_jefe,gi_parque) = 0 then
	messagebox('No hay Datos','No Existen Datos Registrados',stopsign!)
	close(w_mora_cliente)
else
	ll_tot_reg			= dw_1.rowcount()
	for i = 1 to ll_tot_reg
		if dw_1.dataobject = 'dw_mora_promesas' then
			dw_1.setitem(i,'dias_mora',dw_1.getitemnumber(i,'c_dias_mora'))
		end if
		dw_1.accepttext()
	next
	dw_1.setfilter('c_cuotas_mora >= 1 and c_cuotas_mora < 2')
	dw_1.filter()
	dw_1.accepttext()
	if dw_1.rowcount()=0 then
		messagebox('No hay Datos','No Registra 1 a 2 Cuotas en Mora',stopsign!)
		close(w_mora_cliente)
	end if
end if
end event

on w_mora_cliente.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.pb_fin=create pb_fin
this.pb_antes=create pb_antes
this.pb_sigue=create pb_sigue
this.cb_2=create cb_2
this.cb_1=create cb_1
this.pb_primer=create pb_primer
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.pb_fin,&
this.pb_antes,&
this.pb_sigue,&
this.cb_2,&
this.cb_1,&
this.pb_primer,&
this.dw_1,&
this.gb_1}
end on

on w_mora_cliente.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.pb_fin)
destroy(this.pb_antes)
destroy(this.pb_sigue)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.pb_primer)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type cb_4 from commandbutton within w_mora_cliente
integer x = 1449
integer y = 1952
integer width = 489
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asoc.Contrato * Rut "
end type

event clicked;if dw_1.rowcount()>0 then
	gs_base 									= dw_1.GetItemString(ll_fila, "cadena_codigo")
	gs_serie 								= dw_1.GetItemString(ll_fila, "cadena_serie")
	gi_numero 								= dw_1.GetItemNumber(ll_fila, "cadena_numero")
	gi_rut 									= dw_1.GetItemNumber(ll_fila, "cliente_rut")
	gs_apellido_paterno					= dw_1.GetItemString(ll_fila, "cliente_a_paterno")
	gs_apellido_materno					= dw_1.GetItemString(ll_fila, "cliente_a_materno")
	gs_nombres								= dw_1.GetItemString(ll_fila, "cliente_nombre")
	gs_dv										= dw_1.GetItemString(ll_fila, "cliente_dv")
	gs_estado								= dw_1.GetItemString(ll_fila, "cadena_estado")
	gl_cod_parque_cta						= dw_1.GetItemNumber(ll_fila, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		if ll_fila > 0 then 
			if isvalid(w_listado_contratos_por_todas_las_tablas) then close(w_listado_contratos_por_todas_las_tablas)
			open(w_listado_contratos_por_todas_las_tablas)
		else
			messagebox("Adveretencia","Ud. debe seleccionar un Contrato")
		end if
	end if
end if
end event

type cb_3 from commandbutton within w_mora_cliente
integer x = 1033
integer y = 1952
integer width = 411
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Contratos * &Rut"
end type

event clicked;if dw_1.rowcount()>0 then
	gs_base 									= dw_1.GetItemString(ll_fila, "cadena_codigo")
	gs_serie 								= dw_1.GetItemString(ll_fila, "cadena_serie")
	gi_numero 								= dw_1.GetItemNumber(ll_fila, "cadena_numero")
	gi_rut 									= dw_1.GetItemNumber(ll_fila, "cliente_rut")
	gs_apellido_paterno					= dw_1.GetItemString(ll_fila, "cliente_a_paterno")
	gs_apellido_materno					= dw_1.GetItemString(ll_fila, "cliente_a_materno")
	gs_nombres								= dw_1.GetItemString(ll_fila, "cliente_nombre")
	gs_dv										= dw_1.GetItemString(ll_fila, "cliente_dv")
	gs_estado								= dw_1.GetItemString(ll_fila, "cadena_estado")
	gl_cod_parque_cta						= dw_1.GetItemNumber(ll_fila, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 and gi_rut>0 then
		gi_tipo_busqueda 					= 1
		if ll_fila > 0 then 
			gs_base_aux						= gs_base
			gs_serie_aux					= gs_serie
			gl_numero_aux					= gi_numero
			if isvalid(w_listado_contratos_rut) then close(w_listado_contratos_rut)
			open(w_listado_contratos_rut)
		else
			messagebox("Adveretencia","Ud. debe seleccionar un Contrato")
		end if
	end if
end if
end event

type pb_fin from picturebutton within w_mora_cliente
integer x = 2857
integer y = 1960
integer width = 119
integer height = 88
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollToRow(dw_1.rowcount() )
end event

type pb_antes from picturebutton within w_mora_cliente
integer x = 2734
integer y = 1960
integer width = 119
integer height = 88
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollNextPage( ) 
end event

type pb_sigue from picturebutton within w_mora_cliente
integer x = 2610
integer y = 1960
integer width = 119
integer height = 88
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollPriorPage( )
end event

type cb_2 from commandbutton within w_mora_cliente
integer x = 3465
integer y = 1952
integer width = 334
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mora_cliente)
end event

type cb_1 from commandbutton within w_mora_cliente
integer x = 46
integer y = 1952
integer width = 288
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type pb_primer from picturebutton within w_mora_cliente
integer x = 2487
integer y = 1960
integer width = 119
integer height = 88
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollToRow(1)
end event

type dw_1 from uo_datawindow within w_mora_cliente
integer x = 46
integer y = 40
integer width = 3753
integer height = 1872
integer taborder = 10
string dataobject = "dw_mora_promesas_036"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;MenuHabilitado='0011101'
end event

event rbuttondown;call super::rbuttondown;dw_paso = dw_1
//st_1.text = 'Total Reg. '+string(dw_1.rowcount(),'###,###,###,###,###')
end event

event rowfocuschanged;call super::rowfocuschanged;if this.getrow()>0 then
	ll_fila = this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_fila, TRUE)
end if
end event

event clicked;call super::clicked;if row>0 then
	ll_fila = row
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_fila, TRUE)
end if
end event

type gb_1 from groupbox within w_mora_cliente
integer x = 2455
integer y = 1904
integer width = 553
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

