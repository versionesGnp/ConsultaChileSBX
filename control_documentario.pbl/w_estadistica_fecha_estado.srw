forward
global type w_estadistica_fecha_estado from window
end type
type cb_cta_cte from commandbutton within w_estadistica_fecha_estado
end type
type cb_mostrar_resumen from commandbutton within w_estadistica_fecha_estado
end type
type cb_limpiar from commandbutton within w_estadistica_fecha_estado
end type
type cb_imprimir from commandbutton within w_estadistica_fecha_estado
end type
type cb_exportar from commandbutton within w_estadistica_fecha_estado
end type
type cb_sort from commandbutton within w_estadistica_fecha_estado
end type
type cb_filtrar from commandbutton within w_estadistica_fecha_estado
end type
type cb_mostrar_grafico from commandbutton within w_estadistica_fecha_estado
end type
type st_1 from statictext within w_estadistica_fecha_estado
end type
type st_3 from statictext within w_estadistica_fecha_estado
end type
type em_ini from editmask within w_estadistica_fecha_estado
end type
type p_fec_estado_ini from picture within w_estadistica_fecha_estado
end type
type st_2 from statictext within w_estadistica_fecha_estado
end type
type em_fin from editmask within w_estadistica_fecha_estado
end type
type p_fec_estado_fin from picture within w_estadistica_fecha_estado
end type
type pb_aceptar from picturebutton within w_estadistica_fecha_estado
end type
type cb_cerrar from commandbutton within w_estadistica_fecha_estado
end type
type gb_3 from groupbox within w_estadistica_fecha_estado
end type
type dw_lista from datawindow within w_estadistica_fecha_estado
end type
type dw_grafico from datawindow within w_estadistica_fecha_estado
end type
type dw_resumen from datawindow within w_estadistica_fecha_estado
end type
end forward

global type w_estadistica_fecha_estado from window
integer width = 2999
integer height = 1824
boolean titlebar = true
string title = "Estadistica por Rango de Fecha"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cta_cte cb_cta_cte
cb_mostrar_resumen cb_mostrar_resumen
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_sort cb_sort
cb_filtrar cb_filtrar
cb_mostrar_grafico cb_mostrar_grafico
st_1 st_1
st_3 st_3
em_ini em_ini
p_fec_estado_ini p_fec_estado_ini
st_2 st_2
em_fin em_fin
p_fec_estado_fin p_fec_estado_fin
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
gb_3 gb_3
dw_lista dw_lista
dw_grafico dw_grafico
dw_resumen dw_resumen
end type
global w_estadistica_fecha_estado w_estadistica_fecha_estado

type variables
Long	il_row
end variables

on w_estadistica_fecha_estado.create
this.cb_cta_cte=create cb_cta_cte
this.cb_mostrar_resumen=create cb_mostrar_resumen
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_sort=create cb_sort
this.cb_filtrar=create cb_filtrar
this.cb_mostrar_grafico=create cb_mostrar_grafico
this.st_1=create st_1
this.st_3=create st_3
this.em_ini=create em_ini
this.p_fec_estado_ini=create p_fec_estado_ini
this.st_2=create st_2
this.em_fin=create em_fin
this.p_fec_estado_fin=create p_fec_estado_fin
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.dw_lista=create dw_lista
this.dw_grafico=create dw_grafico
this.dw_resumen=create dw_resumen
this.Control[]={this.cb_cta_cte,&
this.cb_mostrar_resumen,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_sort,&
this.cb_filtrar,&
this.cb_mostrar_grafico,&
this.st_1,&
this.st_3,&
this.em_ini,&
this.p_fec_estado_ini,&
this.st_2,&
this.em_fin,&
this.p_fec_estado_fin,&
this.pb_aceptar,&
this.cb_cerrar,&
this.gb_3,&
this.dw_lista,&
this.dw_grafico,&
this.dw_resumen}
end on

on w_estadistica_fecha_estado.destroy
destroy(this.cb_cta_cte)
destroy(this.cb_mostrar_resumen)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_sort)
destroy(this.cb_filtrar)
destroy(this.cb_mostrar_grafico)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.em_ini)
destroy(this.p_fec_estado_ini)
destroy(this.st_2)
destroy(this.em_fin)
destroy(this.p_fec_estado_fin)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.gb_3)
destroy(this.dw_lista)
destroy(this.dw_grafico)
destroy(this.dw_resumen)
end on

event open;Datetime	ld_fec_ini,ld_fec_fin

gf_centrar(w_estadistica_fecha_estado)
em_ini.text						= string(today())
em_fin.text						= string(today())
//ld_fec_ini						= datetime(date(em_ini.text))
//ld_fec_fin						= datetime(date(em_fin.text),time('23:59:59'))
if gs_depto='B' then
	dw_resumen.dataobject	= 'dw_lista_por_ult_fecha_estado_res_jefe'
	dw_resumen.settransobject(sqlca)
	dw_grafico.dataobject	= 'dw_lista_por_ult_fecha_estado_graf_jefe'
	dw_grafico.settransobject(sqlca)
	dw_lista.dataobject		= 'dw_lista_por_ult_fecha_estado_jefe'
	dw_lista.settransobject(sqlca)
elseif gs_depto='R' then
	dw_resumen.dataobject	= 'dw_lista_por_ult_fecha_estado_res_depto'
	dw_resumen.settransobject(sqlca)
	dw_grafico.dataobject	= 'dw_lista_por_ult_fecha_estado_graf_depto'
	dw_grafico.settransobject(sqlca)
	dw_lista.dataobject		= 'dw_lista_por_ult_fecha_estado_depto'
	dw_lista.settransobject(sqlca)
else
	dw_resumen.dataobject	= 'dw_lista_por_ult_fecha_estado_resumen'
	dw_resumen.settransobject(sqlca)
	dw_grafico.dataobject	= 'dw_lista_por_ult_fecha_estado_grafico'
	dw_grafico.settransobject(sqlca)
	dw_lista.dataobject		= 'dw_lista_por_ult_fecha_estado'
	dw_lista.settransobject(sqlca)
end if
dw_grafico.visible			= false
dw_resumen.visible			= false
dw_lista.visible				= true
//em_ini.setfocus()
end event

type cb_cta_cte from commandbutton within w_estadistica_fecha_estado
integer x = 919
integer y = 1556
integer width = 325
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ct&a.Corriente"
end type

event clicked;String	ls_serie_c,ls_base_c,ls_age,ls_sup,ls_jefe
Double	ll_numero_c
if dw_lista.visible=true then
	if il_row>0 then
		gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
		gs_base		= dw_lista.getitemstring(il_row,'base')
		gs_serie		= dw_lista.getitemstring(il_row,'serie')
		CHOOSE CASE gs_base
			CASE "O","U" // Oferta
				if gs_depto='K' or gs_depto='R' or gs_depto='B' then
					SELECT	"OFERTA_V"."COD_SUP",   
								"OFERTA_V"."COD_AGE",   
								"OFERTA_V"."COD_JEF"  
					INTO 		:ls_sup,   
								:ls_age,   
								:ls_jefe  
					FROM 	"OFERTA_V"  
					WHERE  ( "OFERTA_V"."SERIE" = :gs_serie ) AND  
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
			CASE "F","G","V"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	end if
else
	messagebox("Advertencia","Para mostrar Cuenta Corriente debe estar Visible Lista Detalle de Contratos")
end if
end event

type cb_mostrar_resumen from commandbutton within w_estadistica_fecha_estado
integer x = 462
integer y = 1556
integer width = 430
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mostrar Resumen"
end type

event clicked;if dw_grafico.rowcount()>0 then
	if cb_mostrar_resumen.text='Mostrar Resumen' then
		dw_lista.visible			= false
		dw_resumen.visible		= true
		dw_grafico.visible		= false
		cb_mostrar_resumen.text	= 'No Mostrar Resumen'
	else
		dw_lista.visible			= true
		dw_grafico.visible		= false
		dw_resumen.visible		= false
		cb_mostrar_resumen.text	= 'Mostrar Resumen'
	end if
	cb_mostrar_grafico.text		= 'Mostrar Gráfico'
end if
end event

type cb_limpiar from commandbutton within w_estadistica_fecha_estado
event ue_mousemove pbm_mousemove
integer x = 1289
integer y = 1564
integer width = 229
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String	ls_formula=''
dw_lista.Setfilter(ls_formula)
dw_grafico.Setfilter(ls_formula)
dw_resumen.Setfilter(ls_formula)
dw_lista.filter()
dw_grafico.filter()
dw_resumen.filter()
dw_lista.reset()
dw_grafico.reset()
dw_resumen.reset()
cb_mostrar_grafico.text	= 'Mostrar Gráfico'
cb_mostrar_resumen.text	= 'Mostrar Resumen'
dw_lista.visible			= true
dw_grafico.visible		= false
dw_resumen.visible		= false
em_ini.text					= string(today(),"dd/mm/yyyy")
em_fin.text					= string(today(),"dd/mm/yyyy")
pb_aceptar.setfocus()

end event

type cb_imprimir from commandbutton within w_estadistica_fecha_estado
event ue_mousemove pbm_mousemove
integer x = 1545
integer y = 1564
integer width = 229
integer height = 80
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	if dw_lista.visible=true then	f_Print( dw_lista )
	if dw_grafico.visible=true then	f_Print( dw_grafico )		//f_printdlg(dw_grafico,gstr_print,w_estadistica_fecha_estado)
	if dw_resumen.visible=true then	f_Print( dw_resumen )	//f_printdlg(dw_resumen,gstr_print,w_estadistica_fecha_estado)
end if

end event

type cb_exportar from commandbutton within w_estadistica_fecha_estado
event ue_mousemove pbm_mousemove
integer x = 1801
integer y = 1564
integer width = 229
integer height = 80
integer taborder = 120
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

type cb_sort from commandbutton within w_estadistica_fecha_estado
event ue_mousemove pbm_mousemove
integer x = 2034
integer y = 1564
integer width = 229
integer height = 80
integer taborder = 130
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

type cb_filtrar from commandbutton within w_estadistica_fecha_estado
event ue_mousemove pbm_mousemove
integer x = 2267
integer y = 1564
integer width = 229
integer height = 80
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string	nulo,ls_texto,ls_formula
Long		ll_largototal,ll_posini,ll_filas,ll_posfin,ll_indi,ll_resto
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
ll_filas				= dw_lista.rowcount()
ls_formula 			= dw_lista.describe("datawindow.syntax")
ll_largototal		= len(ls_formula)
ll_posini			= Pos(ls_formula, "filter") + 8
ll_posfin			= len("~nfilter~n")
ls_texto				= mid(ls_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(ls_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto				= ll_posfin - ll_posini
ls_formula			= trim(mid(ls_formula,ll_posini,ll_resto))
if mid(ls_formula,1,2)='7;' then
	ls_formula		= ''
end if
dw_grafico.Setfilter(ls_formula)
dw_resumen.Setfilter(ls_formula)
dw_grafico.filter()
dw_resumen.filter()
end event

type cb_mostrar_grafico from commandbutton within w_estadistica_fecha_estado
integer x = 50
integer y = 1556
integer width = 384
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mostrar Gráfico"
end type

event clicked;if dw_grafico.rowcount()>0 then
	if cb_mostrar_grafico.text='Mostrar Gráfico' then
		dw_lista.visible			= false
		dw_resumen.visible		= false
		dw_grafico.visible		= true
		cb_mostrar_grafico.text	= 'No Mostrar Gráfico'
	else
		dw_lista.visible			= true
		dw_grafico.visible		= false
		dw_resumen.visible		= false
		cb_mostrar_grafico.text	= 'Mostrar Gráfico'
	end if
	cb_mostrar_resumen.text	= 'Mostrar Resumen'
end if
end event

type st_1 from statictext within w_estadistica_fecha_estado
integer x = 50
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

type st_3 from statictext within w_estadistica_fecha_estado
integer x = 261
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

type em_ini from editmask within w_estadistica_fecha_estado
integer x = 443
integer y = 64
integer width = 361
integer height = 88
integer taborder = 10
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

event modified;Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_ini.text)
ld_fec_fin	= date(em_fin.text)
if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type p_fec_estado_ini from picture within w_estadistica_fecha_estado
integer x = 809
integer y = 64
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
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
		ld_fec_ini	= date(em_ini.text)
		ld_fec_fin	= date(em_fin.text)
		if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
			pb_aceptar.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type st_2 from statictext within w_estadistica_fecha_estado
integer x = 901
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

type em_fin from editmask within w_estadistica_fecha_estado
integer x = 1088
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

event modified;Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_ini.text)
ld_fec_fin	= date(em_fin.text)
if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type p_fec_estado_fin from picture within w_estadistica_fecha_estado
integer x = 1454
integer y = 64
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
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
	IF DATE(Message.StringParm)<DATE(em_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fin.setfocus()
		return
	else	
		em_fin.text = Message.StringParm
		ld_fec_ini	= date(em_ini.text)
		ld_fec_fin	= date(em_fin.text)
		if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
			pb_aceptar.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type pb_aceptar from picturebutton within w_estadistica_fecha_estado
integer x = 1609
integer y = 32
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;String	ls_string
Datetime	ld_fec_ini,ld_fec_fin

ls_string	= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
dw_lista.reset()
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
			if gs_depto= 'R' or gs_depto= 'B' then
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user)=0 then
					dw_grafico.reset()
					messagebox("Advertencia","No Registra Movimiento en el Rango de Fecha Indicada")
					em_ini.setfocus()
				else
					dw_grafico.retrieve(ld_fec_ini,ld_fec_fin,gs_user)
					dw_resumen.retrieve(ld_fec_ini,ld_fec_fin,gs_user)
					dw_lista.object.t_titulo.text	= 'Estadística por Estado y Rango de Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
					dw_lista.setfocus()
				end if
			else
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
					dw_grafico.reset()
					messagebox("Advertencia","No Registra Movimiento en el Rango de Fecha Indicada")
					em_ini.setfocus()
				else
					dw_grafico.retrieve(ld_fec_ini,ld_fec_fin)
					dw_resumen.retrieve(ld_fec_ini,ld_fec_fin)
					dw_lista.object.t_titulo.text	= 'Estadística por Estado y Rango de Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
					dw_lista.setfocus()
				end if
				
			end if
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_estadistica_fecha_estado
integer x = 2610
integer y = 1556
integer width = 311
integer height = 100
integer taborder = 150
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_estadistica_fecha_estado)
end event

type gb_3 from groupbox within w_estadistica_fecha_estado
event ue_mousemove pbm_mousemove
integer x = 1262
integer y = 1512
integer width = 1266
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

type dw_lista from datawindow within w_estadistica_fecha_estado
integer x = 50
integer y = 208
integer width = 2871
integer height = 1304
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_por_ult_fecha_estado_res_jefe"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;String	ls_string,ls_base,ls_serie
Double	ll_numero
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ls_base		= dw_lista.getitemstring(row,'base')
	ls_serie		= dw_lista.getitemstring(row,'serie')
	ll_numero	= dw_lista.getitemnumber(row,'numero')
	ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(ls_base) and ll_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

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

type dw_grafico from datawindow within w_estadistica_fecha_estado
integer x = 50
integer y = 208
integer width = 2894
integer height = 1304
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_por_ult_fecha_estado_graf_depto"
boolean border = false
boolean livescroll = true
end type

type dw_resumen from datawindow within w_estadistica_fecha_estado
integer x = 50
integer y = 208
integer width = 2871
integer height = 1304
integer taborder = 100
string title = "none"
string dataobject = "dw_lista_por_ult_fecha_estado_res_depto"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

