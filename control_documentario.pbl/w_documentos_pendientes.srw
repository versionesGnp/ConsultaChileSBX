forward
global type w_documentos_pendientes from window
end type
type cb_filtrar from commandbutton within w_documentos_pendientes
end type
type cb_sort from commandbutton within w_documentos_pendientes
end type
type cb_exportar from commandbutton within w_documentos_pendientes
end type
type cb_imprimir from commandbutton within w_documentos_pendientes
end type
type cb_limpiar from commandbutton within w_documentos_pendientes
end type
type cb_ctacte from commandbutton within w_documentos_pendientes
end type
type cb_1 from commandbutton within w_documentos_pendientes
end type
type pb_aceptar from picturebutton within w_documentos_pendientes
end type
type p_fin from picture within w_documentos_pendientes
end type
type em_fec_fin from editmask within w_documentos_pendientes
end type
type st_21 from statictext within w_documentos_pendientes
end type
type p_ini from picture within w_documentos_pendientes
end type
type em_fec_ini from editmask within w_documentos_pendientes
end type
type st_11 from statictext within w_documentos_pendientes
end type
type st_lista from statictext within w_documentos_pendientes
end type
type dw_estado from datawindow within w_documentos_pendientes
end type
type st_4 from statictext within w_documentos_pendientes
end type
type cb_mostrar_todo from commandbutton within w_documentos_pendientes
end type
type cb_cerrar from commandbutton within w_documentos_pendientes
end type
type dw_lista from datawindow within w_documentos_pendientes
end type
type gb_3 from groupbox within w_documentos_pendientes
end type
end forward

global type w_documentos_pendientes from window
integer width = 3003
integer height = 1936
boolean titlebar = true
string title = "Control Documentación Actual"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
cb_ctacte cb_ctacte
cb_1 cb_1
pb_aceptar pb_aceptar
p_fin p_fin
em_fec_fin em_fec_fin
st_21 st_21
p_ini p_ini
em_fec_ini em_fec_ini
st_11 st_11
st_lista st_lista
dw_estado dw_estado
st_4 st_4
cb_mostrar_todo cb_mostrar_todo
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_3 gb_3
end type
global w_documentos_pendientes w_documentos_pendientes

type variables
Long	il_row
end variables

on w_documentos_pendientes.create
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.cb_ctacte=create cb_ctacte
this.cb_1=create cb_1
this.pb_aceptar=create pb_aceptar
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_21=create st_21
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_11=create st_11
this.st_lista=create st_lista
this.dw_estado=create dw_estado
this.st_4=create st_4
this.cb_mostrar_todo=create cb_mostrar_todo
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_3=create gb_3
this.Control[]={this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_limpiar,&
this.cb_ctacte,&
this.cb_1,&
this.pb_aceptar,&
this.p_fin,&
this.em_fec_fin,&
this.st_21,&
this.p_ini,&
this.em_fec_ini,&
this.st_11,&
this.st_lista,&
this.dw_estado,&
this.st_4,&
this.cb_mostrar_todo,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_3}
end on

on w_documentos_pendientes.destroy
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.cb_ctacte)
destroy(this.cb_1)
destroy(this.pb_aceptar)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_21)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_11)
destroy(this.st_lista)
destroy(this.dw_estado)
destroy(this.st_4)
destroy(this.cb_mostrar_todo)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_3)
end on

event open;String	ls_descrip,ls_string
Datetime	ld_fec_ini,ld_fec_fin


dw_estado.settransobject(sqlca)
dw_estado.retrieve()
dw_lista.reset()
ls_string							= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
w_documentos_pendientes.width	= 3013
gf_centrar(w_documentos_pendientes)
st_lista.text						= 'Mostrar Lista Estado'
em_fec_ini.text					= string(today(),"dd/mm/yyyy")
em_fec_fin.text					= string(today(),"dd/mm/yyyy")
ld_fec_ini							= datetime(date(em_fec_ini.text))
ld_fec_fin							= datetime(date(em_fec_fin.text),time('23:59:59'))
SELECT	"ENCARGADOS"."DEPTO"  
INTO 		:gs_depto  
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
if gs_depto='B' then
	dw_lista.dataobject				= 'dw_lista_documentos_pendientes_depto_jef'
	dw_lista.settransobject(sqlca)
	if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user)>0 then
		dw_lista.object.t_titulo.text	= 'Control Documentación Fecha Estado desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
		dw_lista.scrolltorow(1)
	end if
elseif gs_depto='R' then
	dw_lista.dataobject				= 'dw_lista_documentos_pendientes_depto2'
	dw_lista.settransobject(sqlca)
	if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user)>0 then
		dw_lista.object.t_titulo.text	= 'Control Documentación Fecha Estado desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
		dw_lista.scrolltorow(1)
	end if
else
	dw_lista.dataobject				= 'dw_lista_documentos_pendientes_por_depto'
	dw_lista.settransobject(sqlca)
	if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)>0 then
		dw_lista.object.t_titulo.text	= 'Control Documentación Fecha Estado desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
		dw_lista.scrolltorow(1)
	end if
end if
end event

type cb_filtrar from commandbutton within w_documentos_pendientes
integer x = 1783
integer y = 1716
integer width = 229
integer height = 80
integer taborder = 110
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

type cb_sort from commandbutton within w_documentos_pendientes
integer x = 1550
integer y = 1716
integer width = 229
integer height = 80
integer taborder = 100
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

type cb_exportar from commandbutton within w_documentos_pendientes
integer x = 1317
integer y = 1716
integer width = 229
integer height = 80
integer taborder = 90
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

type cb_imprimir from commandbutton within w_documentos_pendientes
integer x = 1070
integer y = 1716
integer width = 229
integer height = 80
integer taborder = 80
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

type cb_limpiar from commandbutton within w_documentos_pendientes
integer x = 823
integer y = 1716
integer width = 229
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Setnull(il_row)
dw_lista.reset()
em_fec_ini.text	= string(today(),"dd/mm/yyyy")
em_fec_fin.text	= string(today(),"dd/mm/yyyy")
em_fec_ini.setfocus()
end event

type cb_ctacte from commandbutton within w_documentos_pendientes
integer x = 55
integer y = 1708
integer width = 448
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	CHOOSE CASE gs_base
		CASE "O","U" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
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
		CASE "F","G","V"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
end if
end event

type cb_1 from commandbutton within w_documentos_pendientes
integer x = 539
integer y = 1708
integer width = 238
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle"
end type

event clicked;String		ls_string,ls_base,ls_serie
Double	ll_numero
if dw_lista.rowcount()>0 then
	ls_base		= dw_lista.getitemstring(il_row,'base')
	ls_serie		= dw_lista.getitemstring(il_row,'serie')
	ll_numero	= dw_lista.getitemnumber(il_row,'numero')
	ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(ls_base) and ll_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type pb_aceptar from picturebutton within w_documentos_pendientes
integer x = 1481
integer y = 24
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;String	ls_string
Datetime	ld_fec_ini,ld_fec_fin
dw_lista.reset()
ls_string			= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
ld_fec_ini			= datetime(date(em_fec_ini.text))
ld_fec_fin			= datetime(date(em_fec_fin.text),time('23:59:59'))
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini > ld_fec_fin then
			messagebox("Advertencia","Rango Fecha Inválida")
			em_fec_fin.setfocus()
		else
			if gs_depto='B' then
				dw_lista.dataobject				= 'dw_lista_documentos_pendientes_depto_jef'
				dw_lista.settransobject(sqlca)
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user)=0 then
					messagebox("Advertencia","No registra dato")
				else
					dw_lista.object.t_titulo.text	= 'Control Documentación Fecha Estado desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
					dw_lista.scrolltorow(1)
				end if
			elseif gs_depto='R' then
				dw_lista.dataobject				= 'dw_lista_documentos_pendientes_depto2'
				dw_lista.settransobject(sqlca)
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user)=0 then
					messagebox("Advertencia","No registra dato")
				else
					dw_lista.object.t_titulo.text	= 'Control Documentación Fecha Estado desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
					dw_lista.scrolltorow(1)
				end if
			else
				dw_lista.dataobject				= 'dw_lista_documentos_pendientes_por_depto'
				dw_lista.settransobject(sqlca)
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
					messagebox("Advertencia","No registra dato")
				else
					dw_lista.object.t_titulo.text	= 'Control Documentación Fecha Estado desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
					dw_lista.scrolltorow(1)
				end if
			end if
		end if
	end if
end if
end event

type p_fin from picture within w_documentos_pendientes
integer x = 1371
integer y = 44
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech,ls_string
long 		uf
Datetime	ld_fec_ini,ld_fec_fin
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		dw_lista.reset()
		ls_string			= ''
		dw_lista.SETfilter(ls_string)
		dw_lista.filter()
		ld_fec_ini	= datetime(date(em_fec_ini.text))
		ld_fec_fin	= datetime(date(em_fec_fin.text),time('23:59:59'))
		pb_aceptar.triggerevent(clicked!)
		em_fec_fin.text 	= Message.StringParm
	end if	
END IF
end event

type em_fec_fin from editmask within w_documentos_pendientes
integer x = 992
integer y = 44
integer width = 370
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;String	ls_string
Datetime	ld_fec_ini,ld_fec_fin
dw_lista.reset()
ls_string	= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
ld_fec_ini	= datetime(date(em_fec_ini.text))
ld_fec_fin	= datetime(date(em_fec_fin.text),time('23:59:59'))
pb_aceptar.triggerevent(clicked!)

end event

type st_21 from statictext within w_documentos_pendientes
integer x = 827
integer y = 56
integer width = 169
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_ini from picture within w_documentos_pendientes
integer x = 731
integer y = 44
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string 	ls_fecha,fech,ls_string
long 		uf
Datetime	ld_fec_ini,ld_fec_fin
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text	= Message.StringParm
		dw_lista.reset()
		ls_string			= ''
		dw_lista.SETfilter(ls_string)
		dw_lista.filter()
		ld_fec_ini	= datetime(date(em_fec_ini.text))
		ld_fec_fin	= datetime(date(em_fec_fin.text),time('23:59:59'))
		pb_aceptar.triggerevent(clicked!)
	end if	
END IF
end event

type em_fec_ini from editmask within w_documentos_pendientes
integer x = 352
integer y = 44
integer width = 370
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;String	ls_string
Datetime	ld_fec_ini,ld_fec_fin
dw_lista.reset()
ls_string	= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
ld_fec_ini	= datetime(date(em_fec_ini.text))
ld_fec_fin	= datetime(date(em_fec_fin.text),time('23:59:59'))
pb_aceptar.triggerevent(clicked!)

end event

type st_11 from statictext within w_documentos_pendientes
integer x = 41
integer y = 32
integer width = 297
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_lista from statictext within w_documentos_pendientes
integer x = 2176
integer y = 1696
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
cb_mostrar_todo.enabled				= false
if st_lista.text='Mostrar Lista Estado' then
	w_documentos_pendientes.width	= 3712
	st_lista.text						= 'NO Mostrar Lista Estado'
elseif st_lista.text='NO Mostrar Lista Estado' then
	w_documentos_pendientes.width	= 3013
	st_lista.text						= 'Mostrar Lista Estado'
	ls_string							= ''
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
end if
gf_centrar(w_documentos_pendientes)
end event

type dw_estado from datawindow within w_documentos_pendientes
integer x = 3008
integer y = 180
integer width = 649
integer height = 1488
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

type st_4 from statictext within w_documentos_pendientes
integer x = 3008
integer y = 76
integer width = 402
integer height = 64
integer textsize = -10
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

type cb_mostrar_todo from commandbutton within w_documentos_pendientes
integer x = 3031
integer y = 1708
integer width = 603
integer height = 100
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

type cb_cerrar from commandbutton within w_documentos_pendientes
integer x = 2665
integer y = 1708
integer width = 283
integer height = 100
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_documentos_pendientes)
end event

type dw_lista from datawindow within w_documentos_pendientes
integer x = 46
integer y = 180
integer width = 2903
integer height = 1488
integer taborder = 40
string dataobject = "dw_lista_documentos_pendientes_depto2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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

event doubleclicked;String	ls_string,ls_depto,ls_descrip
Long		ll_estado
il_row	= row
if il_row>0 and dw_lista.rowcount()>0 then
	gi_numero 		= dw_lista.getitemnumber(il_row,'numero')
	gs_base			= dw_lista.getitemstring(il_row,'base')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_estado 		= dw_lista.getitemnumber(il_row,'ult_estado')
	SELECT	"CD_ESTADO"."GLOSA"  
	INTO 		:ls_descrip  
	FROM 		"CD_ESTADO"  
	WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   ;
	ls_depto			= dw_lista.getitemstring(il_row,'depto_asignado')
	if not isnull(gi_numero) and gi_numero>0 and not isnull(gs_base) and not isnull(gs_serie) then
		if ls_depto=gs_depto or gs_depto='I' or ll_estado=4 or ll_estado=5 or ll_estado=10 then
			if ll_estado>1 then
				if ll_estado=8 or ll_estado=100 or ll_estado=101 or ll_estado=102 or ll_estado=103 then
					messagebox("Advertencia","No es posible Ingresar Gestión Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
				elseif (gs_depto='V' or gs_depto='D') and ll_estado=10 then 
					messagebox("Advertencia","No es posible Ingresar Gestión Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
				elseif gs_depto='O' and ll_estado=5 then 
					messagebox("Advertencia","No es posible Ingresar Gestión Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
				elseif (gs_depto='V' and ll_estado=9) or (gs_depto='D' and ll_estado=9) or (gs_depto='V' and ll_estado=11) or (gs_depto='D' and ll_estado=11) or (gs_depto='V' and ll_estado=4) or (gs_depto='D' and ll_estado=4) then
					messagebox("Advertencia","No es posible Ingresar Gestión Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
				else
					ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
					if isvalid(w_cd_ingresar_control_documentacion) then close(w_cd_ingresar_control_documentacion)
					openwithparm(w_cd_ingresar_control_documentacion,ls_string)
				end if
			else
				messagebox("Advertencia","No es posible Ingresar Gestión, recuerde Estado Actual por lo menos debe estar en Código 2-Asignado Form.Ag.")
			end if
		elseif ll_estado=9 then
			messagebox("Advertencia","Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+", está Aceptado por Depto. Operaciones")
		else
			messagebox("Advertencia","Folio "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###")+", No está Asignado a su Departamento")
		end if
	end if
end if
end event

event rbuttondown;Long		ll_estado
String	ls_string,MenuHabilitado
if row>0 then
	m_control_documento_popup Menu
	Menu = Create m_control_documento_popup
//	Menu.m_popup.m_ingresargestiontelefonica.Visible 		= (Mid(MenuHabilitado, 1, 1) = "0")
	Menu.m_popup.PopMenu(This.X + PointerX(), This.Y + PointerY()-20)
end if
end event

type gb_3 from groupbox within w_documentos_pendientes
integer x = 800
integer y = 1664
integer width = 1239
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

