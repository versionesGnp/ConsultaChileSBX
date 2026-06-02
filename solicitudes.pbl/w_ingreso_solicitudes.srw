forward
global type w_ingreso_solicitudes from window
end type
type st_3 from statictext within w_ingreso_solicitudes
end type
type cb_aceptar from commandbutton within w_ingreso_solicitudes
end type
type st_numero from statictext within w_ingreso_solicitudes
end type
type st_serie from statictext within w_ingreso_solicitudes
end type
type st_base from statictext within w_ingreso_solicitudes
end type
type st_5 from statictext within w_ingreso_solicitudes
end type
type st_4 from statictext within w_ingreso_solicitudes
end type
type st_2 from statictext within w_ingreso_solicitudes
end type
type st_nombre from statictext within w_ingreso_solicitudes
end type
type st_rut from statictext within w_ingreso_solicitudes
end type
type st_1 from statictext within w_ingreso_solicitudes
end type
type cb_cerrar from commandbutton within w_ingreso_solicitudes
end type
type dw_lista from datawindow within w_ingreso_solicitudes
end type
end forward

global type w_ingreso_solicitudes from window
integer width = 1833
integer height = 2084
boolean titlebar = true
string title = "Solicitudes ingresadas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_3 st_3
cb_aceptar cb_aceptar
st_numero st_numero
st_serie st_serie
st_base st_base
st_5 st_5
st_4 st_4
st_2 st_2
st_nombre st_nombre
st_rut st_rut
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_ingreso_solicitudes w_ingreso_solicitudes

type variables
string	is_base,is_serie,is_nombre,is_rut
Long		il_row
Double	il_numero
end variables

on w_ingreso_solicitudes.create
this.st_3=create st_3
this.cb_aceptar=create cb_aceptar
this.st_numero=create st_numero
this.st_serie=create st_serie
this.st_base=create st_base
this.st_5=create st_5
this.st_4=create st_4
this.st_2=create st_2
this.st_nombre=create st_nombre
this.st_rut=create st_rut
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.st_3,&
this.cb_aceptar,&
this.st_numero,&
this.st_serie,&
this.st_base,&
this.st_5,&
this.st_4,&
this.st_2,&
this.st_nombre,&
this.st_rut,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_ingreso_solicitudes.destroy
destroy(this.st_3)
destroy(this.cb_aceptar)
destroy(this.st_numero)
destroy(this.st_serie)
destroy(this.st_base)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.st_nombre)
destroy(this.st_rut)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;Long		ll_indi, ll_tot_reg, ll_cant_reg
String	ls_string,ls_tipo_sol

gf_centrar(w_ingreso_solicitudes)
is_base 								= substr(1,1,Message.StringParm)
is_serie								= substr(1,2,Message.StringParm)
il_numero							= Double(substr(1,3,Message.StringParm))
is_nombre							= substr(1,4,Message.StringParm)
is_rut									= substr(1,5,Message.StringParm)
st_rut.text							= is_rut
st_nombre.text						= is_nombre
st_base.text							= is_base
st_serie.text							= is_serie
st_numero.text						= string(il_numero,'###,###,###,###')
dw_lista.settransobject(sqlca)
ll_tot_reg							= dw_lista.retrieve()
if ll_tot_reg>13 then
	st_3.visible						= true
else
	st_3.visible						= false
end if
gs_ventana							= 'w_ingreso_solicitudes'
f_valida_objeto()
if ll_tot_reg>0 then
	w_ingreso_solicitudes.title	= 'Solicitudes ingresadas'
	CHOOSE CASE is_base
		CASE 'O','L','P','C','D','R','W','A','F','G','V'
			for ll_indi=1 to ll_tot_reg
				ls_tipo_sol	= dw_lista.getitemstring(ll_indi,'codigo_solicitud')
				SELECT	count("SOL_ESTATUS"."CORRELATIVO")  
				INTO 		:ll_cant_reg
				FROM 	"SOL_ESTATUS"  
				WHERE 	( "SOL_ESTATUS"."BASE" = :gs_base ) AND  
							( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
							( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
							( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol) 
				Using	sqlca;
				if ls_tipo_sol='12' then
					SELECT	count("SOL_ESTATUS"."CORRELATIVO")  
					INTO 		:ll_cant_reg  
					FROM 	"SOL_ESTATUS"
					WHERE (( "SOL_ESTATUS"."RUT_CLIENTE" = :gi_rut ) AND  
							   ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = :ls_tipo_sol ) );
				end if
				if sqlca.sqlcode=0 then
					if ll_cant_reg>0 then
						dw_lista.setitem(ll_indi,'estado',0)
						dw_lista.setitem(ll_indi,'cantidad',ll_cant_reg)
					else
						dw_lista.setitem(ll_indi,'estado',1)
						dw_lista.setitem(ll_indi,'cantidad',0)
					end if
				else
					dw_lista.setitem(ll_indi,'estado',1)
					dw_lista.setitem(ll_indi,'cantidad',0)
				end if
			next
	END CHOOSE
	dw_lista.accepttext()
else
	messagebox("Advertencia","No registra dato Tabla Solicitudes")
end if
end event

type st_3 from statictext within w_ingreso_solicitudes
boolean visible = false
integer x = 489
integer y = 1824
integer width = 827
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Presione Barra Movimiento Vertical"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_ingreso_solicitudes
integer x = 37
integer y = 1852
integer width = 302
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;String		ls_string, ls_cod_sol,ls_estado_ctto
long 		ll_estado,ll_cor_valida,ll_mora_mant,ll_cantidad
if il_row > 0 then
	if isvalid(w_detalle_solicitudes) then close(w_detalle_solicitudes)
	ls_cod_sol	= dw_lista.getitemstring(il_row,'codigo_solicitud')
	ll_estado		= dw_lista.getitemnumber(il_row,'estado')
	ll_cantidad	= dw_lista.getitemnumber(il_row,'cantidad')
	if ls_cod_sol='9' then
		messagebox("Advertencia","Solicitud No Definida")
	elseif ls_cod_sol='17' and is_base<>'O' then
		messagebox("Advertencia","No es Posible Generar Solicitud, Solo Promesas")
	elseif ls_cod_sol='3' and ll_estado = 1 then
		messagebox("Advertencia","Ya No es Posible Generar Solicitud")
	elseif ls_cod_sol='10' and ll_estado = 1 then
		messagebox("Advertencia","Ya No es Posible Generar Solicitud")
	elseif ls_cod_sol='13' and ll_estado = 1 and gs_base<>'G' and gs_base <> 'O' and gs_base <> 'C' then
		messagebox("Advertencia","Ya No es Posible Generar Solicitud")	
	elseif ls_cod_sol='16' and ll_estado = 1 then
		messagebox("Advertencia","Ya No es Posible Generar Solicitud")
//	elseif ls_cod_sol='23' and ll_estado = 1 then
//		messagebox("Advertencia","Ya No es Posible Generar Solicitud")
	elseif ls_cod_sol='26' and ll_estado = 1 then
		SELECT 	"PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO"
		INTO		:ll_cor_valida
		FROM		"PROCESO_TITULO_CTTO_DEFINITIVO"  
		WHERE 	( "PROCESO_TITULO_CTTO_DEFINITIVO"."BASE" = :is_base ) AND  
					( "PROCESO_TITULO_CTTO_DEFINITIVO"."SERIE" = :is_serie ) AND  
					( "PROCESO_TITULO_CTTO_DEFINITIVO"."NUMERO" = :il_numero );
		if ll_cor_valida >0 then
			ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+ls_cod_sol
			openwithparm(w_detalle_solicitudes,ls_string)
		else
			messagebox("Advertencia","No es Posible Generar Solicitud, Comunicarse con Normalización")
		end if	
	elseif ls_cod_sol='27' then
		SELECT 	"CADENA_MORA"."MORA_MANT",		"CADENA"."ESTADO"
		INTO 		:ll_mora_mant,								:ls_estado_ctto
		FROM 	"CADENA", 	"CADENA_MORA"  
		WHERE ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				  ( ( "CADENA"."CODIGO" = :is_base ) AND  
				  ( "CADENA"."SERIE" = :is_serie ) AND  
				  ( "CADENA"."NUMERO" = :il_numero ) )  
		USING	sqlca;
		if is_base <> 'O' and is_base <> 'C' then
			messagebox("Advertencia","No es Posible Generar Solicitud, Solo Promesas y Contrato IsaCruz")
		elseif ll_mora_mant = 0 and ll_cantidad=0 then
			messagebox("Advertencia","No es Posible Generar Solicitud, No Tiene Mora Mantención")
		elseif ls_estado_ctto<>'V' and ls_estado_ctto<>'C' then
			messagebox("Advertencia","No es Posible Generar Solicitud, Estado Contrato debe estar V-Vigente o C-Cancelado")
		else
			ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+ls_cod_sol
			openwithparm(w_detalle_solicitudes,ls_string)
		end if
	else
		if ls_cod_sol='12' then
			ls_string	= "W"+'~t'+"W"+'~t'+string(gi_rut)+'~t'+ls_cod_sol
		else
			ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+ls_cod_sol
		end if
		openwithparm(w_detalle_solicitudes,ls_string)
	end if
end if
end event

type st_numero from statictext within w_ingreso_solicitudes
integer x = 1285
integer y = 140
integer width = 489
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_serie from statictext within w_ingreso_solicitudes
integer x = 736
integer y = 140
integer width = 219
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_base from statictext within w_ingreso_solicitudes
integer x = 270
integer y = 140
integer width = 219
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ingreso_solicitudes
integer x = 1010
integer y = 148
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Número:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_ingreso_solicitudes
integer x = 526
integer y = 148
integer width = 183
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Serie:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ingreso_solicitudes
integer x = 18
integer y = 148
integer width = 224
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Base:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_nombre from statictext within w_ingreso_solicitudes
integer x = 718
integer y = 40
integer width = 1056
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_rut from statictext within w_ingreso_solicitudes
integer x = 270
integer y = 40
integer width = 407
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ingreso_solicitudes
integer x = 18
integer y = 48
integer width = 224
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Cliente:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_ingreso_solicitudes
integer x = 1467
integer y = 1852
integer width = 302
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_solicitudes)
end event

type dw_lista from datawindow within w_ingreso_solicitudes
integer x = 37
integer y = 264
integer width = 1733
integer height = 1560
integer taborder = 10
string dataobject = "dw_lista_seleccion_de_solicitudes"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	this.scrolltorow(il_row)
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if

end event

event rowfocuschanged;if this.getrow() > 0 then
	il_row	= this.getrow()
	this.scrolltorow(il_row)
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if

end event

event doubleclicked;if row > 0 then
	il_row	= row
	this.scrolltorow(il_row)
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	cb_aceptar.triggerevent(clicked!)
end if

end event

