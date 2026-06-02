forward
global type w_simulacion_comisiones from window
end type
type pb_exportar from picturebutton within w_simulacion_comisiones
end type
type pb_imprimir from picturebutton within w_simulacion_comisiones
end type
type pb_nuevo from picturebutton within w_simulacion_comisiones
end type
type pb_aceptar from picturebutton within w_simulacion_comisiones
end type
type pb_cerrar from picturebutton within w_simulacion_comisiones
end type
type dw_ingreso from datawindow within w_simulacion_comisiones
end type
end forward

global type w_simulacion_comisiones from window
integer width = 3246
integer height = 2192
boolean titlebar = true
string title = "Simulación Comisión"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_exportar pb_exportar
pb_imprimir pb_imprimir
pb_nuevo pb_nuevo
pb_aceptar pb_aceptar
pb_cerrar pb_cerrar
dw_ingreso dw_ingreso
end type
global w_simulacion_comisiones w_simulacion_comisiones

on w_simulacion_comisiones.create
this.pb_exportar=create pb_exportar
this.pb_imprimir=create pb_imprimir
this.pb_nuevo=create pb_nuevo
this.pb_aceptar=create pb_aceptar
this.pb_cerrar=create pb_cerrar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.pb_exportar,&
this.pb_imprimir,&
this.pb_nuevo,&
this.pb_aceptar,&
this.pb_cerrar,&
this.dw_ingreso}
end on

on w_simulacion_comisiones.destroy
destroy(this.pb_exportar)
destroy(this.pb_imprimir)
destroy(this.pb_nuevo)
destroy(this.pb_aceptar)
destroy(this.pb_cerrar)
destroy(this.dw_ingreso)
end on

event open;long	ll_new
gf_centrar(w_simulacion_comisiones)
gs_ventana	= 'w_simulacion_comisiones'
f_valida_objeto_1()
dw_ingreso.settransobject(sqlca)
ll_new	= dw_ingreso.insertrow(0)
dw_ingreso.scrolltorow(ll_new)
dw_ingreso.setitem(ll_new,'tipo_contrato','O')
dw_ingreso.setitem(ll_new,'area','A1')
dw_ingreso.setitem(ll_new,'tipo_construcion','T')
dw_ingreso.setitem(ll_new,'forma_pago','D')
dw_ingreso.setfocus()
end event

type pb_exportar from picturebutton within w_simulacion_comisiones
event ue_mousemove pbm_mousemove
integer x = 210
integer y = 1920
integer width = 169
integer height = 148
integer taborder = 30
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
dw_paso	= dw_ingreso
if dw_ingreso.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_imprimir from picturebutton within w_simulacion_comisiones
event ue_mousemove pbm_mousemove
integer x = 384
integer y = 1920
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;long		ll_tot_reg
ll_tot_reg	= dw_ingreso.rowcount()
if ll_tot_reg > 0 then
	dw_ingreso.object.datawindow.print.Preview = true
	f_Print( dw_ingreso )
	dw_ingreso.object.datawindow.print.Preview = false				
end if
end event

type pb_nuevo from picturebutton within w_simulacion_comisiones
integer x = 37
integer y = 1920
integer width = 169
integer height = 148
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "nuevo.bmp"
string disabledname = "nuevo_no.bmp"
alignment htextalign = left!
end type

event clicked;long	ll_new
dw_ingreso.reset()
ll_new	= dw_ingreso.insertrow(0)
dw_ingreso.scrolltorow(ll_new)
dw_ingreso.setitem(ll_new,'tipo_contrato','O')
dw_ingreso.setitem(ll_new,'area','A1')
dw_ingreso.setitem(ll_new,'tipo_construcion','T')
dw_ingreso.setitem(ll_new,'forma_pago','D')
dw_ingreso.setfocus()

end event

event getfocus;double	ll_precio_uf, ll_pie
dw_ingreso.accepttext()
ll_precio_uf	= double(dw_ingreso.getitemnumber(1,'precio_uf'))
ll_pie			= double(dw_ingreso.getitemnumber(1,'pie'))
if ll_precio_uf > 0 and ll_pie > 0 then
	if ll_pie > ll_precio_uf then
		dw_ingreso.setitem(1,'pie',ll_precio_uf)
		dw_ingreso.setfocus()
		dw_ingreso.accepttext()
		dw_ingreso.setcolumn('pie')
	end if
end if
end event

type pb_aceptar from picturebutton within w_simulacion_comisiones
integer x = 1527
integer y = 1920
integer width = 169
integer height = 148
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_tipo_ctto, ls_area, ls_tipo_cons
Double	ld_pie, cuota_pie, cuota_1, cuota_2, cuota_3, cuota_4, cuota_5, cuota_6
Long		ll_credito, ll_correlativo,ll_cod_parque
integer 	correlativo
double 	c_pie,c_primera,c_segunda,c_tercera,c_cuarta,c_quinta ,c_sexta ,porce_comi,&
			ld_precio_uf, ld_pie_porc,ld_monto_pie,ld_por_pie,c_septima,c_octava,c_novena

SetPointer(HourGlass!)
ll_cod_parque	= dw_ingreso.getitemnumber(1,'cod_parque')
ls_tipo_ctto	= dw_ingreso.getitemstring(1,'tipo_contrato')
ls_area			= dw_ingreso.getitemstring(1,'area')
ls_tipo_cons	= dw_ingreso.getitemstring(1,'tipo_construcion')
ll_credito		= dw_ingreso.getitemnumber(1,'credito')
ld_pie			= double(dw_ingreso.getitemnumber(1,'pie'))
ld_precio_uf	= double(dw_ingreso.getitemnumber(1,'precio_uf'))
ld_monto_pie	= double(dw_ingreso.getitemnumber(1,'monto_pie'))
ld_por_pie		= double(dw_ingreso.getitemnumber(1,'por_pie'))
if isnull(ld_por_pie) then ld_por_pie=0
if (ls_tipo_ctto='O' or ls_tipo_ctto='L' or ls_tipo_ctto='A') and ll_credito>0 and ld_precio_uf>0 and ll_cod_parque>0 then
	ld_pie_porc		= (ld_pie / ld_precio_uf) * 100
	if ls_tipo_ctto='O' or ls_tipo_ctto='A' then
		if ld_por_pie < 10 then
			SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA  ,C_SEPTIMA, C_OCTAVA, C_NOVENA, (C_PIE+C_PRIMERA+C_SEGUNDA+C_TERCERA+C_CUARTA+C_QUINTA+C_SEXTA+C_SEPTIMA+C_OCTAVA+C_NOVENA) AS PORCENTAJE  
			INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,:c_septima,:c_octava,:c_novena, :porce_comi 
			FROM 		PORCENTAJE_COMISIONES  
			WHERE  ( PIE_MIN <= :ld_por_pie AND  PIE_MAX >= :ld_por_pie) AND  
						AREA = :ls_area AND T_CONS = :ls_tipo_cons AND ( CREDITO_MIN <= :ll_credito AND CREDITO >= :ll_credito ) AND
					 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0 and 
					 COD_PARQUE = :ll_cod_parque;
		elseif ld_por_pie >= 10 then
			SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA  ,C_SEPTIMA, C_OCTAVA, C_NOVENA, (C_PIE+C_PRIMERA+C_SEGUNDA+C_TERCERA+C_CUARTA+C_QUINTA+C_SEXTA+C_SEPTIMA+C_OCTAVA+C_NOVENA) AS PORCENTAJE  
			INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,:c_septima,:c_octava,:c_novena,:porce_comi 
			FROM 		PORCENTAJE_COMISIONES  
			WHERE  ( PIE_MIN <= :ld_por_pie AND  PIE_MAX >= :ld_por_pie) AND  
						AREA = :ls_area AND T_CONS = :ls_tipo_cons AND
					 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0  and 
					 COD_PARQUE = :ll_cod_parque;
		end if
		if sqlca.sqlcode = 0 and not isnull(correlativo) then
			dw_ingreso.setitem(1,'correlativo',correlativo)
			dw_ingreso.setitem(1,'cuota_pie',c_pie)
			dw_ingreso.setitem(1,'cuota_1',c_primera)
			dw_ingreso.setitem(1,'cuota_2',c_segunda)
			dw_ingreso.setitem(1,'cuota_3',c_tercera)
			dw_ingreso.setitem(1,'cuota_4',c_cuarta)
			dw_ingreso.setitem(1,'cuota_5',c_quinta)
			dw_ingreso.setitem(1,'cuota_6',c_sexta)
			dw_ingreso.setitem(1,'cuota_7',c_septima)
			dw_ingreso.setitem(1,'cuota_8',c_octava)
			dw_ingreso.setitem(1,'cuota_9',c_novena)
		else
			messagebox("Advertencia","No Registra Definición")
		end if
	elseif ls_tipo_ctto='L' then
		if ld_por_pie < 10 then
			SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA  ,C_SEPTIMA, C_OCTAVA, C_NOVENA, (C_PIE+C_PRIMERA+C_SEGUNDA+C_TERCERA+C_CUARTA+C_QUINTA+C_SEXTA+C_SEPTIMA+C_OCTAVA+C_NOVENA) AS PORCENTAJE  
			INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,:c_septima,:c_octava,:c_novena,:porce_comi 
			FROM 		PORCENTAJE_COMISIONES  
			WHERE  ( PIE_MIN <= :ld_por_pie AND  PIE_MAX >= :ld_por_pie) AND  
						AREA = 'X' AND T_CONS = 'X' AND ( CREDITO_MIN <= :ll_credito AND CREDITO >= :ll_credito ) and
					 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA ) > 0  and
					 ( COD_PARQUE = :ll_cod_parque );
		elseif ld_por_pie >= 10 then
			SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA  ,C_SEPTIMA, C_OCTAVA, C_NOVENA, (C_PIE+C_PRIMERA+C_SEGUNDA+C_TERCERA+C_CUARTA+C_QUINTA+C_SEXTA+C_SEPTIMA+C_OCTAVA+C_NOVENA) AS PORCENTAJE  
			INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,:c_septima,:c_octava,:c_novena,:porce_comi 
			FROM 		PORCENTAJE_COMISIONES  
			WHERE  ( PIE_MIN <= :ld_por_pie AND  PIE_MAX >= :ld_por_pie) AND  
						AREA = 'X' AND T_CONS = 'X' and 
					 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA ) > 0  and
					 ( COD_PARQUE = :ll_cod_parque );
		end if
		if sqlca.sqlcode = 0 and not isnull(correlativo) then
			dw_ingreso.setitem(1,'correlativo',correlativo)
			dw_ingreso.setitem(1,'cuota_pie',c_pie)
			dw_ingreso.setitem(1,'cuota_1',c_primera)
			dw_ingreso.setitem(1,'cuota_2',c_segunda)
			dw_ingreso.setitem(1,'cuota_3',c_tercera)
			dw_ingreso.setitem(1,'cuota_4',c_cuarta)
			dw_ingreso.setitem(1,'cuota_5',c_quinta)
			dw_ingreso.setitem(1,'cuota_6',c_sexta)
			dw_ingreso.setitem(1,'cuota_7',c_septima)
			dw_ingreso.setitem(1,'cuota_8',c_octava)
			dw_ingreso.setitem(1,'cuota_9',c_novena)
		else
			messagebox("Advertencia","No Registra Definición")
		end if
	end if
else
	messagebox("Advertencia","Falta ingresar datos")
end if
SetPointer(Arrow!)
end event

type pb_cerrar from picturebutton within w_simulacion_comisiones
integer x = 3013
integer y = 1920
integer width = 169
integer height = 148
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_simulacion_comisiones)
end event

type dw_ingreso from datawindow within w_simulacion_comisiones
integer x = 37
integer y = 28
integer width = 3145
integer height = 1856
integer taborder = 10
string dataobject = "dwe_simulacion_comisiones"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	ls_columna, ls_forma_pago
long		ll_nulo,ll_resp
Double	ll_precio_uf, ll_pie
this.accepttext()
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'forma_pago'
		ls_forma_pago	= this.getitemstring(1,'forma_pago')
		if ls_forma_pago='C' then
			this.setitem(1,'credito',0)
		else
			this.setitem(1,'credito',1)
		end if
	CASE 'precio_uf','pie'
		ll_precio_uf	= double(this.getitemnumber(1,'precio_uf'))
		ll_pie			= double(this.getitemnumber(1,'pie'))
		if ll_precio_uf > 0 and ll_pie > 0 then
			if ll_pie > ll_precio_uf then
				ll_resp = MessageBox("Advertencia", "El Valor Cuota es Mayor al Precio Total",	Exclamation!, OK!)
				pb_nuevo.setfocus()
			end if
		end if

END CHOOSE
setnull(ll_nulo)
dw_ingreso.setitem(1,'correlativo',ll_nulo)
dw_ingreso.setitem(1,'cuota_pie',ll_nulo)
dw_ingreso.setitem(1,'cuota_1',ll_nulo)
dw_ingreso.setitem(1,'cuota_2',ll_nulo)
dw_ingreso.setitem(1,'cuota_3',ll_nulo)
dw_ingreso.setitem(1,'cuota_4',ll_nulo)
dw_ingreso.setitem(1,'cuota_5',ll_nulo)
dw_ingreso.setitem(1,'cuota_6',ll_nulo)
this.accepttext()
end event

