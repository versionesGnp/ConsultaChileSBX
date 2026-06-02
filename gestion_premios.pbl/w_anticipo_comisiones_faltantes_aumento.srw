forward
global type w_anticipo_comisiones_faltantes_aumento from window
end type
type dw_detalle from datawindow within w_anticipo_comisiones_faltantes_aumento
end type
type pb_filtrar from picturebutton within w_anticipo_comisiones_faltantes_aumento
end type
type pb_ordenar from picturebutton within w_anticipo_comisiones_faltantes_aumento
end type
type pb_imprimir from picturebutton within w_anticipo_comisiones_faltantes_aumento
end type
type pb_exportar from picturebutton within w_anticipo_comisiones_faltantes_aumento
end type
type pb_cerrar from picturebutton within w_anticipo_comisiones_faltantes_aumento
end type
type dw_lista from datawindow within w_anticipo_comisiones_faltantes_aumento
end type
end forward

global type w_anticipo_comisiones_faltantes_aumento from window
integer width = 3346
integer height = 2100
boolean titlebar = true
string title = "Comisiones Promesas Sin Definición"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_detalle dw_detalle
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_cerrar pb_cerrar
dw_lista dw_lista
end type
global w_anticipo_comisiones_faltantes_aumento w_anticipo_comisiones_faltantes_aumento

on w_anticipo_comisiones_faltantes_aumento.create
this.dw_detalle=create dw_detalle
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_cerrar=create pb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.dw_detalle,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_cerrar,&
this.dw_lista}
end on

on w_anticipo_comisiones_faltantes_aumento.destroy
destroy(this.dw_detalle)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_cerrar)
destroy(this.dw_lista)
end on

event open;long		ll_tot_reg, ll_indi, cta_pag_s, nro_cuotas, cta_pag_m
string	ls_codigo, ls_serie, ls_string
Long		ll_contrato, RET, ret1, ll_row, ll_new
Double	ll_count_porc,numero
Long 		cuenta, ret11, dias
datetime fecha_prim, fecha_man, fecha_vto
string 	base, serie, ls_cod_age
String		ls_base_aux, ls_serie_aux
Double	ll_numero_aux,ll_c_pie_aux, ll_c_primera_aux, ll_c_segunda_aux, ll_c_tercera_aux,&
			ll_c_cuarta_aux ,ll_c_quinta_aux, ll_c_sexta_aux
			
SetPointer(HourGlass!)
gf_centrar(w_anticipo_comisiones_faltantes_aumento)
gs_ventana	= 'w_anticipo_comisiones_faltantes_aumento'
f_valida_objeto_1()
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_lista.reset()
this.title	= 'Consulta Anticipo Comisiones Faltantes'
ll_tot_reg	= dw_detalle.retrieve()
for ll_indi = 1 to ll_tot_reg
	ls_cod_age	= dw_detalle.getitemstring(ll_indi,'anexo_aumento_cod_agente')
	fecha_prim	= dw_detalle.getitemdatetime(ll_indi,'pago_aumento_fecha_prim')
	cta_pag_s	= dw_detalle.getitemnumber(ll_indi,'anexo_aumento_cta_pag_m')
	nro_cuotas	= dw_detalle.getitemnumber(ll_indi,'pago_aumento_nro_cuotas')
	serie			= dw_detalle.getitemstring(ll_indi,'cadena_serie')
	numero		= dw_detalle.getitemnumber(ll_indi,'cadena_numero')
  	SELECT "COMISION_PROMESA"."BASE"  
   INTO :ls_base_aux  
   FROM "COMISION_PROMESA"  
   WHERE ( "COMISION_PROMESA"."BASE" = 'A' ) AND  
         ( "COMISION_PROMESA"."SERIE" = :serie ) AND  
         ( "COMISION_PROMESA"."NUMERO" = :numero )   
	Using	sqlca;
	if sqlca.sqlcode = 100 then
		ll_new	= dw_lista.insertrow(0)
		dw_lista.scrolltorow(ll_new)
		dw_lista.setitem(ll_new,'base','A')
		dw_lista.setitem(ll_new,'serie',serie)
		dw_lista.setitem(ll_new,'numero',numero)
		dw_lista.setitem(ll_new,'cuota_pie',0)
		dw_lista.setitem(ll_new,'primera_cuota',0)
		dw_lista.setitem(ll_new,'segunda_cuota',0)
		dw_lista.setitem(ll_new,'tercera_cuota',0)
		dw_lista.setitem(ll_new,'cuarta_cuota',0)
		dw_lista.setitem(ll_new,'quinta_cuota',0)
		dw_lista.setitem(ll_new,'sexta_cuota',0)
	end if
next
dw_lista.sort()
dw_lista.scrolltorow(1)
if dw_lista.rowcount() = 0 then
	messagebox("Advertencia","No Registra dato")
	close(w_anticipo_comisiones_faltantes_aumento)
else
	if gs_conexion = "Parque El Prado" then
		dw_lista.object.t_titulo.text 			= 'Parque El Prado'
	elseif gs_conexion = "Parque La Foresta" then
		dw_lista.object.t_titulo.text 			= 'Parque La Foresta'
	elseif gs_conexion = "Parque Concepción" then
		dw_lista.object.t_titulo.text 			= 'Parque Concepción'
	end if
	dw_lista.object.t_usuario.text	= gs_user
	dw_lista.sort()
end if
SetPointer(Arrow!)
end event

type dw_detalle from datawindow within w_anticipo_comisiones_faltantes_aumento
boolean visible = false
integer x = 1957
integer y = 1816
integer width = 375
integer height = 200
integer taborder = 60
string dataobject = "dw_lista_contratos_sin_agrupar_falta_aum"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_filtrar from picturebutton within w_anticipo_comisiones_faltantes_aumento
event ue_mousemove pbm_mousemove
integer x = 393
integer y = 1820
integer width = 165
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type pb_ordenar from picturebutton within w_anticipo_comisiones_faltantes_aumento
event ue_mousemove pbm_mousemove
integer x = 219
integer y = 1820
integer width = 165
integer height = 148
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_imprimir from picturebutton within w_anticipo_comisiones_faltantes_aumento
event ue_mousemove pbm_mousemove
integer x = 567
integer y = 1820
integer width = 165
integer height = 148
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;long		ll_tot_reg
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg > 0 then
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false				
end if
end event

type pb_exportar from picturebutton within w_anticipo_comisiones_faltantes_aumento
event ue_mousemove pbm_mousemove
integer x = 46
integer y = 1820
integer width = 165
integer height = 148
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_cerrar from picturebutton within w_anticipo_comisiones_faltantes_aumento
integer x = 3095
integer y = 1820
integer width = 165
integer height = 148
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_anticipo_comisiones_faltantes_aumento)
end event

type dw_lista from datawindow within w_anticipo_comisiones_faltantes_aumento
integer x = 41
integer y = 32
integer width = 3218
integer height = 1744
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_contratos_faltantes_aumento"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if dw_lista.getrow()>0 then
	gi_numero 			= dw_lista.getitemnumber(dw_lista.getrow(),'numero')
	gi_tipo_busqueda 	= 8
	Open(w_listado_contratos)
end if
end event

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if

end event

