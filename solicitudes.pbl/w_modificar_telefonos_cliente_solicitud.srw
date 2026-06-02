forward
global type w_modificar_telefonos_cliente_solicitud from window
end type
type cb_1 from commandbutton within w_modificar_telefonos_cliente_solicitud
end type
type cb_3 from commandbutton within w_modificar_telefonos_cliente_solicitud
end type
type cb_2 from commandbutton within w_modificar_telefonos_cliente_solicitud
end type
type cb_print from commandbutton within w_modificar_telefonos_cliente_solicitud
end type
type cb_anular from commandbutton within w_modificar_telefonos_cliente_solicitud
end type
type cb_ctacte from commandbutton within w_modificar_telefonos_cliente_solicitud
end type
type st_1 from statictext within w_modificar_telefonos_cliente_solicitud
end type
type cb_solicitud from commandbutton within w_modificar_telefonos_cliente_solicitud
end type
type cb_cerrar from commandbutton within w_modificar_telefonos_cliente_solicitud
end type
type dw_lista from datawindow within w_modificar_telefonos_cliente_solicitud
end type
type gb_1 from groupbox within w_modificar_telefonos_cliente_solicitud
end type
end forward

global type w_modificar_telefonos_cliente_solicitud from window
integer width = 3886
integer height = 2076
boolean titlebar = true
string title = "Actualizar Teléfonos Clientes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
cb_3 cb_3
cb_2 cb_2
cb_print cb_print
cb_anular cb_anular
cb_ctacte cb_ctacte
st_1 st_1
cb_solicitud cb_solicitud
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_modificar_telefonos_cliente_solicitud w_modificar_telefonos_cliente_solicitud

type variables
Long	il_row,il_cambia
end variables

on w_modificar_telefonos_cliente_solicitud.create
this.cb_1=create cb_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_print=create cb_print
this.cb_anular=create cb_anular
this.cb_ctacte=create cb_ctacte
this.st_1=create st_1
this.cb_solicitud=create cb_solicitud
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cb_3,&
this.cb_2,&
this.cb_print,&
this.cb_anular,&
this.cb_ctacte,&
this.st_1,&
this.cb_solicitud,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_modificar_telefonos_cliente_solicitud.destroy
destroy(this.cb_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_print)
destroy(this.cb_anular)
destroy(this.cb_ctacte)
destroy(this.st_1)
destroy(this.cb_solicitud)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long	ll_tot_reg,ll_indi

gf_centrar(w_modificar_telefonos_cliente_solicitud)
il_cambia		= 0
dw_lista.settransobject(sqlca)
ll_tot_reg	= dw_lista.retrieve()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_modificar_telefonos_cliente_solicitud)
else
	for ll_indi=1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'sw_grabar',1)
	next
	dw_lista.accepttext()
end if
end event

type cb_1 from commandbutton within w_modificar_telefonos_cliente_solicitud
integer x = 2190
integer y = 1840
integer width = 238
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_3 from commandbutton within w_modificar_telefonos_cliente_solicitud
integer x = 2432
integer y = 1840
integer width = 219
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_modificar_telefonos_cliente_solicitud
integer x = 2656
integer y = 1840
integer width = 219
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_print from commandbutton within w_modificar_telefonos_cliente_solicitud
integer x = 1874
integer y = 1840
integer width = 238
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.zoom				= 95
	f_Print( dw_lista )
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type cb_anular from commandbutton within w_modificar_telefonos_cliente_solicitud
integer x = 1198
integer y = 1840
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular"
end type

event clicked;Long	ll_row
if dw_lista.rowcount()>0 then
	ll_row	= dw_lista.getrow()
	if ll_row>0 then
		dw_lista.setitem(ll_row,'estado_reg','A')
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			messagebox("Anular","Anulación Exitosa")
		else
			rollback;
			messagebox("Error Anular","Error al Anular SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_ctacte from commandbutton within w_modificar_telefonos_cliente_solicitud
integer x = 567
integer y = 1840
integer width = 443
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.rowcount()=0 then il_row = 0
if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	gi_rut 		= dw_lista.getitemnumber(il_row,'rut')
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" //Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F","G"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria)
	END CHOOSE
end if
end event

type st_1 from statictext within w_modificar_telefonos_cliente_solicitud
integer x = 50
integer y = 36
integer width = 2341
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 80269524
string text = "Recuerde Antes de Grabar debe Verificar los Datos con el Cliente"
boolean focusrectangle = false
end type

type cb_solicitud from commandbutton within w_modificar_telefonos_cliente_solicitud
integer x = 32
integer y = 1840
integer width = 347
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_fila,ll_tot_reg,ll_indi,ll_sw,ll_rut,ll_graba
String	ls_fono_p,ls_celular,ls_fono_c,ls_dv

if il_cambia > 0 then
	if dw_lista.update()=1 then
		commit;
	else
		rollback;
		messagebox("Error Grabar","Error al Actualizar Nº Telefónicos SQL: "+sqlca.sqlerrtext)
	end if
end if
ll_tot_reg					= dw_lista.rowcount()
ll_graba						= 0
if ll_tot_reg > 0 then
	ll_fila					= dw_lista.Find("sw_grabar = 0", 1, ll_tot_reg)
	if ll_fila>0 then
		for ll_indi=ll_fila to ll_tot_reg
			ll_sw				= dw_lista.getitemnumber(ll_indi,'sw_grabar')
			if ll_sw=0 then
				ll_rut		= dw_lista.getitemnumber(ll_indi,'rut')
				ls_dv			= dw_lista.getitemstring(ll_indi,'dv')
				ls_fono_p	= dw_lista.getitemstring(ll_indi,'fono_nuevo')
				ls_celular	= dw_lista.getitemstring(ll_indi,'celular_nuevo')
				ls_fono_c	= dw_lista.getitemstring(ll_indi,'fono_comercial_nuevo')
				if (not isnull(ls_fono_p) and ls_fono_p<>'-' and ls_fono_p<>'') and &
					(not isnull(ls_celular) and ls_celular<>'-' and ls_celular<>'') and &
					(not isnull(ls_fono_c) and ls_fono_c<>'-' and ls_fono_c<>'') then
					UPDATE	"CLIENTE"  
					SET 		"FONO_P" = :ls_fono_p,   
								"FONO_C" = :ls_fono_c,   
								"CELULAR" = :ls_celular  
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING		sqlca;
				elseif (not isnull(ls_fono_p) and ls_fono_p<>'-' and ls_fono_p<>'') and &
					(isnull(ls_celular) or ls_celular='-' or ls_celular='') and &
					(isnull(ls_fono_c) or ls_fono_c='-' or ls_fono_c='') then
					UPDATE	"CLIENTE"  
					SET 		"FONO_P" = :ls_fono_p
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING		sqlca;
				elseif (not isnull(ls_fono_p) and ls_fono_p<>'-' and ls_fono_p<>'') and &
					(not isnull(ls_celular) and ls_celular<>'-' and ls_celular<>'') and &
					(isnull(ls_fono_c) or ls_fono_c='-' or ls_fono_c='') then
					UPDATE	"CLIENTE"  
					SET 		"FONO_P" = :ls_fono_p,
								"CELULAR" = :ls_celular
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING		sqlca;
				elseif (not isnull(ls_fono_p) and ls_fono_p<>'-' and ls_fono_p<>'') and &
					(isnull(ls_celular) or ls_celular='-' or ls_celular='') and &
					(not isnull(ls_fono_c) and ls_fono_c<>'-' and ls_fono_c<>'') then
					UPDATE	"CLIENTE"  
					SET 		"FONO_P" = :ls_fono_p,
								"FONO_C" = :ls_fono_c
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING		sqlca;
				elseif (isnull(ls_fono_p) or ls_fono_p='-' or ls_fono_p='') and &
					(not isnull(ls_celular) and ls_celular<>'-' and ls_celular<>'') and &
					(not isnull(ls_fono_c) and ls_fono_c<>'-' and ls_fono_c<>'') then
					UPDATE	"CLIENTE"  
					SET 		"CELULAR" = :ls_celular,
								"FONO_C" = :ls_fono_c
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING		sqlca;
				elseif (isnull(ls_fono_p) or ls_fono_p='-' or ls_fono_p='') and &
					(not isnull(ls_celular) and ls_celular<>'-' and ls_celular<>'') and &
					(isnull(ls_fono_c) or ls_fono_c='-' or ls_fono_c='') then
					UPDATE	"CLIENTE"  
					SET 		"CELULAR" = :ls_celular
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING		sqlca;
				elseif (isnull(ls_fono_p) or ls_fono_p='-' or ls_fono_p='') and &
					(isnull(ls_celular) or ls_celular='-' or ls_celular='') and &
					(not isnull(ls_fono_c) and ls_fono_c<>'-' and ls_fono_c<>'') then
					UPDATE	"CLIENTE"  
					SET 		"FONO_C" = :ls_fono_c
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					commit;
					ll_graba ++
					dw_lista.setitem(ll_indi,'estado_reg','M')
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Rut "+string(ll_rut,'###,###,###,###')+'-'+ls_dv+' SQL: '+sqlca.sqlerrtext)
				end if
			end if
		next
		if ll_graba>0 then
			if dw_lista.update()=1 then
				commit;
				for ll_indi=1 to ll_tot_reg
					dw_lista.setitem(ll_indi,'sw_grabar',1)
				next
				dw_lista.accepttext()
				messagebox("Grabar","Grabación Exitosa")
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		end if
	else
		messagebox("Advertencia","Debe Seleccionar por lo Menos UN Registro para Actualizar Teléfonos")
	end if
end if
end event

type cb_cerrar from commandbutton within w_modificar_telefonos_cliente_solicitud
integer x = 3474
integer y = 1840
integer width = 352
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

event clicked;close(w_modificar_telefonos_cliente_solicitud)
end event

type dw_lista from datawindow within w_modificar_telefonos_cliente_solicitud
integer x = 32
integer y = 124
integer width = 3794
integer height = 1668
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_modificacion_fono_solicitud"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event itemchanged;String	ls_columna

ls_columna	= dwo.name
if ls_columna='fono_nuevo' or ls_columna='fono_comercial_nuevo' or ls_columna='celular_nuevo' then
	il_cambia ++
end if
end event

type gb_1 from groupbox within w_modificar_telefonos_cliente_solicitud
integer x = 1847
integer y = 1792
integer width = 1056
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

