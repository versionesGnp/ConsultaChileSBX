forward
global type w_cd_consulta_por_base_fecha from window
end type
type st_lista from statictext within w_cd_consulta_por_base_fecha
end type
type cb_mostrar_todo2 from commandbutton within w_cd_consulta_por_base_fecha
end type
type dw_estado from datawindow within w_cd_consulta_por_base_fecha
end type
type st_4 from statictext within w_cd_consulta_por_base_fecha
end type
type cb_cerrar from commandbutton within w_cd_consulta_por_base_fecha
end type
type cb_mostrar_todo from commandbutton within w_cd_consulta_por_base_fecha
end type
type cb_detalle from commandbutton within w_cd_consulta_por_base_fecha
end type
type cb_limpiar from commandbutton within w_cd_consulta_por_base_fecha
end type
type cb_imprimir from commandbutton within w_cd_consulta_por_base_fecha
end type
type cb_exportar from commandbutton within w_cd_consulta_por_base_fecha
end type
type cb_sort from commandbutton within w_cd_consulta_por_base_fecha
end type
type cb_filtrar from commandbutton within w_cd_consulta_por_base_fecha
end type
type dw_lista from datawindow within w_cd_consulta_por_base_fecha
end type
type pb_aceptar from picturebutton within w_cd_consulta_por_base_fecha
end type
type p_fec_estado_fin from picture within w_cd_consulta_por_base_fecha
end type
type em_fin from editmask within w_cd_consulta_por_base_fecha
end type
type st_2 from statictext within w_cd_consulta_por_base_fecha
end type
type p_fec_estado_ini from picture within w_cd_consulta_por_base_fecha
end type
type em_ini from editmask within w_cd_consulta_por_base_fecha
end type
type st_3 from statictext within w_cd_consulta_por_base_fecha
end type
type st_1 from statictext within w_cd_consulta_por_base_fecha
end type
type dw_base from datawindow within w_cd_consulta_por_base_fecha
end type
type gb_3 from groupbox within w_cd_consulta_por_base_fecha
end type
end forward

global type w_cd_consulta_por_base_fecha from window
integer width = 3104
integer height = 1844
boolean titlebar = true
string title = "Consultar por Tipo de Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_lista st_lista
cb_mostrar_todo2 cb_mostrar_todo2
dw_estado dw_estado
st_4 st_4
cb_cerrar cb_cerrar
cb_mostrar_todo cb_mostrar_todo
cb_detalle cb_detalle
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_sort cb_sort
cb_filtrar cb_filtrar
dw_lista dw_lista
pb_aceptar pb_aceptar
p_fec_estado_fin p_fec_estado_fin
em_fin em_fin
st_2 st_2
p_fec_estado_ini p_fec_estado_ini
em_ini em_ini
st_3 st_3
st_1 st_1
dw_base dw_base
gb_3 gb_3
end type
global w_cd_consulta_por_base_fecha w_cd_consulta_por_base_fecha

type variables
String	is_base,is_serie
Long		il_row
Double	il_numero
end variables

on w_cd_consulta_por_base_fecha.create
this.st_lista=create st_lista
this.cb_mostrar_todo2=create cb_mostrar_todo2
this.dw_estado=create dw_estado
this.st_4=create st_4
this.cb_cerrar=create cb_cerrar
this.cb_mostrar_todo=create cb_mostrar_todo
this.cb_detalle=create cb_detalle
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_sort=create cb_sort
this.cb_filtrar=create cb_filtrar
this.dw_lista=create dw_lista
this.pb_aceptar=create pb_aceptar
this.p_fec_estado_fin=create p_fec_estado_fin
this.em_fin=create em_fin
this.st_2=create st_2
this.p_fec_estado_ini=create p_fec_estado_ini
this.em_ini=create em_ini
this.st_3=create st_3
this.st_1=create st_1
this.dw_base=create dw_base
this.gb_3=create gb_3
this.Control[]={this.st_lista,&
this.cb_mostrar_todo2,&
this.dw_estado,&
this.st_4,&
this.cb_cerrar,&
this.cb_mostrar_todo,&
this.cb_detalle,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_sort,&
this.cb_filtrar,&
this.dw_lista,&
this.pb_aceptar,&
this.p_fec_estado_fin,&
this.em_fin,&
this.st_2,&
this.p_fec_estado_ini,&
this.em_ini,&
this.st_3,&
this.st_1,&
this.dw_base,&
this.gb_3}
end on

on w_cd_consulta_por_base_fecha.destroy
destroy(this.st_lista)
destroy(this.cb_mostrar_todo2)
destroy(this.dw_estado)
destroy(this.st_4)
destroy(this.cb_cerrar)
destroy(this.cb_mostrar_todo)
destroy(this.cb_detalle)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_sort)
destroy(this.cb_filtrar)
destroy(this.dw_lista)
destroy(this.pb_aceptar)
destroy(this.p_fec_estado_fin)
destroy(this.em_fin)
destroy(this.st_2)
destroy(this.p_fec_estado_ini)
destroy(this.em_ini)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.dw_base)
destroy(this.gb_3)
end on

event open;gf_centrar(w_cd_consulta_por_base_fecha)
dw_estado.settransobject(sqlca)
dw_estado.retrieve()
dw_base.settransobject(sqlca)
dw_base.insertrow(0)
if gs_depto= 'B' then
	dw_lista.dataobject			= 'dw_consulta_por_base_fecha_jefe'
elseif gs_depto= 'R' then
	dw_lista.dataobject			= 'dw_consulta_por_base_fecha_depto'
else
	dw_lista.dataobject			= 'dw_consulta_por_base_fecha'
end if
dw_lista.settransobject(sqlca)

w_cd_consulta_por_base_fecha.width	= 3127
em_ini.text		= string(today(),"dd/mm/yyyy")
em_fin.text		= string(today(),"dd/mm/yyyy")

end event

type st_lista from statictext within w_cd_consulta_por_base_fecha
integer x = 2290
integer y = 1568
integer width = 334
integer height = 128
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar Lista Estado"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;String	ls_string

if st_lista.text='Mostrar Lista Estado' then
	w_cd_consulta_por_base_fecha.width	= 3744
	st_lista.text					= 'NO Mostrar Lista Estado'
elseif st_lista.text='NO Mostrar Lista Estado' then
	w_cd_consulta_por_base_fecha.width	= 3127
	st_lista.text					= 'Mostrar Lista Estado'
	ls_string						= ''
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
end if
gf_centrar(w_cd_consulta_por_base_fecha)
end event

type cb_mostrar_todo2 from commandbutton within w_cd_consulta_por_base_fecha
integer x = 3150
integer y = 1580
integer width = 535
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Sacar Filtro Estado"
end type

event clicked;String	ls_string
ls_string	= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type dw_estado from datawindow within w_cd_consulta_por_base_fecha
integer x = 3122
integer y = 84
integer width = 576
integer height = 1448
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_estados_cd"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_codigo
String	ls_string
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_codigo					= this.getitemnumber(row,'codigo')
	ls_string					= 'ult_estado='+string(ll_codigo)
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	cb_mostrar_todo.enabled	= true
end if
end event

event doubleclicked;Long		ll_codigo
String	ls_string
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_codigo					= this.getitemnumber(row,'codigo')
	ls_string					= 'ult_estado='+string(ll_codigo)
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	cb_mostrar_todo.enabled	= true
end if
end event

event rowfocuschanged;Long		ll_codigo
String	ls_string
if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	ll_codigo					= this.getitemnumber(this.getrow(),'codigo')
	ls_string					= 'ult_estado='+string(ll_codigo)
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	cb_mostrar_todo.enabled	= true
end if
end event

type st_4 from statictext within w_cd_consulta_por_base_fecha
integer x = 3131
integer y = 16
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Estado"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_cd_consulta_por_base_fecha
event ue_mousemove pbm_mousemove
integer x = 2734
integer y = 1580
integer width = 315
integer height = 104
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_consulta_por_base_fecha)
end event

type cb_mostrar_todo from commandbutton within w_cd_consulta_por_base_fecha
event ue_mousemove pbm_mousemove
integer x = 1719
integer y = 1580
integer width = 457
integer height = 104
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sacar Filtro Estado"
end type

event clicked;String	ls_string
ls_string	= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type cb_detalle from commandbutton within w_cd_consulta_por_base_fecha
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1580
integer width = 375
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Gestión"
end type

event clicked;String	ls_string
if dw_lista.rowcount()>0 then
	is_base		= dw_lista.getitemstring(il_row,'base')
	is_serie		= dw_lista.getitemstring(il_row,'serie')
	il_numero	= dw_lista.getitemnumber(il_row,'numero')
	ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(is_base) and il_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type cb_limpiar from commandbutton within w_cd_consulta_por_base_fecha
event ue_mousemove pbm_mousemove
integer x = 462
integer y = 1596
integer width = 229
integer height = 80
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
em_ini.text					= string(today(),"dd/mm/yyyy")
em_fin.text					= string(today(),"dd/mm/yyyy")
dw_base.reset()
dw_base.insertrow(0)
dw_base.setfocus()
end event

type cb_imprimir from commandbutton within w_cd_consulta_por_base_fecha
event ue_mousemove pbm_mousemove
integer x = 713
integer y = 1596
integer width = 229
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_exportar from commandbutton within w_cd_consulta_por_base_fecha
event ue_mousemove pbm_mousemove
integer x = 965
integer y = 1596
integer width = 229
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_sort from commandbutton within w_cd_consulta_por_base_fecha
event ue_mousemove pbm_mousemove
integer x = 1198
integer y = 1596
integer width = 229
integer height = 80
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_filtrar from commandbutton within w_cd_consulta_por_base_fecha
event ue_mousemove pbm_mousemove
integer x = 1431
integer y = 1596
integer width = 229
integer height = 80
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type dw_lista from datawindow within w_cd_consulta_por_base_fecha
event ue_mousemove pbm_dwnmousemove
integer x = 37
integer y = 212
integer width = 3013
integer height = 1320
integer taborder = 50
string title = "none"
string dataobject = "dw_consulta_por_base_fecha_jefe"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
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

event doubleclicked;String		ls_serie_c,ls_base_c,ls_age,ls_sup,ls_jefe
Double	ll_numero_c
if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	CHOOSE CASE gs_base
		CASE "O","U" // Oferta/Columbario
			if gs_depto='K' or gs_depto='R' or gs_depto='B' then
				SELECT	"OFERTA_V"."COD_SUP",   
							"OFERTA_V"."COD_AGE",   
							"OFERTA_V"."COD_JEF"  
				INTO 		:ls_sup,   
							:ls_age,   
							:ls_jefe  
				FROM 	"OFERTA_V"  
				WHERE  	( "OFERTA_V"."SERIE" = :gs_serie ) AND  
						 	( "OFERTA_V"."NRO_OFERTA" = :gi_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if gs_depto='K' and ls_age=gs_user then
						if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
						Open(w_cuenta_corriente_oferta)
					elseif gs_depto='R' and ls_sup=gs_user then
						if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
						Open(w_cuenta_corriente_oferta)
					elseif gs_depto='B' and ls_jefe=gs_user then
						if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
						Open(w_cuenta_corriente_oferta)
					else
						messagebox("Advertencia","Nº Contrato NO está Asignado a su Codigo")
					end if
				end if
			else
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			end if
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F","G","V"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			SELECT	"PAGARE_V"."SERIE",   
						"PAGARE_V"."NUMERO",   
						"PAGARE_V"."BASE"  
			INTO 		:ls_serie_c,   
						:ll_numero_c,   
						:ls_base_c  
			FROM 		"PAGARE_V"  
			WHERE  ( "PAGARE_V"."SERIE_P" = :gs_serie ) AND  
					 ( "PAGARE_V"."NUMERO_P" = :gi_numero )   
			USING		sqlca; 
			if not isnull(ls_serie_c) and ls_serie_c<>'' and not isnull(ls_base_c) and ls_base_c<>'0' and ll_numero_c>0 then
				messagebox("Advertencia","Recuerde Pagaré seleccionado está Asociado al Contrato Nº "+ls_base_c+'-'+ls_serie_c+'-'+string(ll_numero_c,"###,###,###,###,###"))
			else
				messagebox("Advertencia","No Registra Datos Pagaré "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###"))
			end if
//			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
//			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" //Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
	END CHOOSE
end if
end event

type pb_aceptar from picturebutton within w_cd_consulta_por_base_fecha
integer x = 2528
integer y = 32
integer width = 178
integer height = 156
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;String	ls_base,ls_string
Datetime	ld_fec_ini,ld_fec_fin

ls_string	= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
dw_lista.reset()
ls_base		= dw_base.getitemstring(1,'base')
ld_fec_ini	= datetime(date(em_ini.text))
ld_fec_fin	= datetime(date(em_fin.text),time('23:59:59'))
if trim(em_ini.text)='00/00/0000' or isnull(em_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_ini.setfocus()
else
	if trim(em_fin.text)='00/00/0000' or isnull(em_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango Fecha Inválida")
			em_fin.setfocus()
		else
			if not isnull(ls_base) and ls_base<>'' then
				if gs_depto='R' or gs_depto='B' then
					if dw_lista.retrieve(ls_base,ld_fec_ini,ld_fec_fin,gs_user)=0 then
						messagebox("Advertencia","No Registra Movimiento Contrato Base: "+string(ls_base)+" en el Rango de Fecha Indicada")
						dw_base.setfocus()
					else
						dw_lista.object.t_fecha.text	= 'Consulta Contrato Base : '+string( ls_base)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
						dw_lista.setfocus()
					end if
				else
					if dw_lista.retrieve(ls_base,ld_fec_ini,ld_fec_fin)=0 then
						messagebox("Advertencia","No Registra Movimiento Contrato Base: "+string(ls_base)+" en el Rango de Fecha Indicada")
						dw_base.setfocus()
					else
						dw_lista.object.t_fecha.text	= 'Consulta Contrato Base : '+string( ls_base)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
						dw_lista.setfocus()
					end if
				end if
			end if
		end if
	end if
end if
end event

type p_fec_estado_fin from picture within w_cd_consulta_por_base_fecha
integer x = 2373
integer y = 64
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech,ls_base
Date		ld_fec_ini,ld_fec_fin
Long		ll_estado
dw_lista.reset()
if f_valida_fecha(em_fin.text)=-1 then 
	em_fin.text=string(today(),gs_formato_fecha)
	em_fin.setfocus()
	return
end if	
if em_fin.text<>'00/00/0000' then
	ls_fecha = em_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fin.setfocus()
		return
	else	
		em_fin.text = Message.StringParm
		ld_fec_ini	= date(em_ini.text)
		ld_fec_fin	= date(em_fin.text)
		ls_base		= trim(dw_base.getitemstring(1,'base'))
		if not isnull(ls_base) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
			pb_aceptar.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type em_fin from editmask within w_cd_consulta_por_base_fecha
integer x = 2007
integer y = 64
integer width = 361
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;String	ls_base
Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_ini.text)
ld_fec_fin	= date(em_fin.text)
ls_base		= trim(dw_base.getitemstring(1,'base'))
if not isnull(ls_base) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type st_2 from statictext within w_cd_consulta_por_base_fecha
integer x = 1819
integer y = 72
integer width = 178
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_fec_estado_ini from picture within w_cd_consulta_por_base_fecha
integer x = 1728
integer y = 64
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech,ls_base
Long		ll_estado
Date		ld_fec_ini,ld_fec_fin
dw_lista.reset()
if f_valida_fecha(em_ini.text)=-1 then 
	em_ini.text	= string(today(),gs_formato_fecha)
	em_ini.setfocus()
	return
end if	
if em_ini.text<>'00/00/0000' then
	ls_fecha = em_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_ini.setfocus()
		return
	else	
		em_ini.text = Message.StringParm
		dw_base.accepttext()
		ld_fec_ini	= date(em_ini.text)
		ld_fec_fin	= date(em_fin.text)
		ls_base		= trim(dw_base.getitemstring(1,'base'))
		if not isnull(ls_base) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
			pb_aceptar.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type em_ini from editmask within w_cd_consulta_por_base_fecha
integer x = 1362
integer y = 64
integer width = 361
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;String	ls_base
Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_ini.text)
ld_fec_fin	= date(em_fin.text)
ls_base		= trim(dw_base.getitemstring(1,'base'))
if not isnull(ls_base) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type st_3 from statictext within w_cd_consulta_por_base_fecha
integer x = 1179
integer y = 76
integer width = 165
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicial"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cd_consulta_por_base_fecha
integer x = 969
integer y = 40
integer width = 187
integer height = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_base from datawindow within w_cd_consulta_por_base_fecha
integer x = 41
integer y = 48
integer width = 832
integer height = 120
integer taborder = 10
string title = "none"
string dataobject = "dwe_tipo_base_cd"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_base
Date		ld_fec_ini,ld_fec_fin
dw_base.accepttext()
ld_fec_ini	= date(em_ini.text)
ld_fec_fin	= date(em_fin.text)
ls_base		= trim(dw_base.getitemstring(1,'base'))
if not isnull(ls_base) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type gb_3 from groupbox within w_cd_consulta_por_base_fecha
event ue_mousemove pbm_mousemove
integer x = 434
integer y = 1544
integer width = 1257
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

