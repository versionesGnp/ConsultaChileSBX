forward
global type w_informe_pagos_por_parque from window
end type
type ddlb_forma_pago from dropdownlistbox within w_informe_pagos_por_parque
end type
type st_17 from statictext within w_informe_pagos_por_parque
end type
type pb_procesar from picturebutton within w_informe_pagos_por_parque
end type
type dw_parque from datawindow within w_informe_pagos_por_parque
end type
type st_16 from statictext within w_informe_pagos_por_parque
end type
type p_2 from picture within w_informe_pagos_por_parque
end type
type em_final from editmask within w_informe_pagos_por_parque
end type
type st_2 from statictext within w_informe_pagos_por_parque
end type
type p_1 from picture within w_informe_pagos_por_parque
end type
type em_desde from editmask within w_informe_pagos_por_parque
end type
type st_1 from statictext within w_informe_pagos_por_parque
end type
type cb_cerrar from commandbutton within w_informe_pagos_por_parque
end type
type dw_lista from datawindow within w_informe_pagos_por_parque
end type
type cb_imprimir from commandbutton within w_informe_pagos_por_parque
end type
type cb_exportar from commandbutton within w_informe_pagos_por_parque
end type
type cb_filtrar from commandbutton within w_informe_pagos_por_parque
end type
type cb_ordenar from commandbutton within w_informe_pagos_por_parque
end type
type gb_1 from groupbox within w_informe_pagos_por_parque
end type
type pb_3 from picturebutton within w_informe_pagos_por_parque
end type
type pb_2 from picturebutton within w_informe_pagos_por_parque
end type
type pb_5 from picturebutton within w_informe_pagos_por_parque
end type
type pb_4 from picturebutton within w_informe_pagos_por_parque
end type
type gb_2 from groupbox within w_informe_pagos_por_parque
end type
end forward

global type w_informe_pagos_por_parque from window
integer width = 3003
integer height = 2052
boolean titlebar = true
string title = "Informe de Ingresos a Caja por Forma de Pago"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
ddlb_forma_pago ddlb_forma_pago
st_17 st_17
pb_procesar pb_procesar
dw_parque dw_parque
st_16 st_16
p_2 p_2
em_final em_final
st_2 st_2
p_1 p_1
em_desde em_desde
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
gb_1 gb_1
pb_3 pb_3
pb_2 pb_2
pb_5 pb_5
pb_4 pb_4
gb_2 gb_2
end type
global w_informe_pagos_por_parque w_informe_pagos_por_parque

type variables
Long	il_parque
end variables

on w_informe_pagos_por_parque.create
this.ddlb_forma_pago=create ddlb_forma_pago
this.st_17=create st_17
this.pb_procesar=create pb_procesar
this.dw_parque=create dw_parque
this.st_16=create st_16
this.p_2=create p_2
this.em_final=create em_final
this.st_2=create st_2
this.p_1=create p_1
this.em_desde=create em_desde
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.gb_1=create gb_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_5=create pb_5
this.pb_4=create pb_4
this.gb_2=create gb_2
this.Control[]={this.ddlb_forma_pago,&
this.st_17,&
this.pb_procesar,&
this.dw_parque,&
this.st_16,&
this.p_2,&
this.em_final,&
this.st_2,&
this.p_1,&
this.em_desde,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.gb_1,&
this.pb_3,&
this.pb_2,&
this.pb_5,&
this.pb_4,&
this.gb_2}
end on

on w_informe_pagos_por_parque.destroy
destroy(this.ddlb_forma_pago)
destroy(this.st_17)
destroy(this.pb_procesar)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.p_2)
destroy(this.em_final)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.em_desde)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.gb_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.gb_2)
end on

event open;gf_centrar(w_informe_pagos_por_parque)
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	il_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	il_parque	= 11
end if
dw_parque.setitem(1,'cod_parque',il_parque)
dw_parque.accepttext()
em_desde.text	= string(today(),"dd/mm/yyyy")
em_final.text	= string(today(),"dd/mm/yyyy")

end event

type ddlb_forma_pago from dropdownlistbox within w_informe_pagos_por_parque
integer x = 2395
integer y = 40
integer width = 325
integer height = 508
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
string item[] = {"EF","CH","TC","TD","Todas"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
end event

type st_17 from statictext within w_informe_pagos_por_parque
integer x = 2112
integer y = 56
integer width = 270
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Forma Pago"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_procesar from picturebutton within w_informe_pagos_por_parque
integer x = 2784
integer y = 24
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date		ld_fecha_ini,ld_fecha_fin
String	ls_cod_pago,ls_filtro,ls_descrip_parque
SetPointer(HourGlass!)
ld_fecha_ini	= date(em_desde.text)
ld_fecha_fin	= date(em_final.text)
ls_cod_pago		= trim(ddlb_forma_pago.text)
dw_parque.accepttext()
il_parque		= dw_parque.getitemnumber(1,'cod_parque')
if ld_fecha_ini > ld_fecha_fin then
	Messagebox("Advertencia","Rango de Fecha Inválida")
	em_desde.setfocus()
else
	if il_parque>0 then
		SELECT	"COD_PARQ"."NOMBRE"  
		INTO 		:ls_descrip_parque  
		FROM 		"COD_PARQ"  
		WHERE 	"COD_PARQ"."CODIGO" = :il_parque   ;
		if not isnull(ls_cod_pago) and ls_cod_pago<>'' then
			if ls_cod_pago='Todas' then ls_cod_pago='%'
			if dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,ls_cod_pago,il_parque)>0 then
				dw_lista.object.t_parque.text	= 'Parque '+ls_descrip_parque
			else
				messagebox("Advertencia","No Registra Dato")
			end if
		else
			messagebox("Advertencia","Debe Seleccionar Forma de Pago")
			ddlb_forma_pago.setfocus()
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Parque")
		dw_parque.setfocus()
	end if
end if
SetPointer(Arrow!)
end event

type dw_parque from datawindow within w_informe_pagos_por_parque
integer x = 1518
integer y = 36
integer width = 594
integer height = 104
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_descrip_parque
dw_lista.reset()
dw_parque.accepttext()
il_parque							= dw_parque.getitemnumber(1,'cod_parque')
SELECT	"COD_PARQ"."NOMBRE"  
INTO 		:ls_descrip_parque  
FROM 		"COD_PARQ"  
WHERE 	"COD_PARQ"."CODIGO" = :il_parque   ;
dw_lista.object.t_parque.text	= 'Parque '+ls_descrip_parque
end event

type st_16 from statictext within w_informe_pagos_por_parque
integer x = 1335
integer y = 56
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_2 from picture within w_informe_pagos_por_parque
integer x = 1234
integer y = 40
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_final.text)='00/00/0000' or trim(em_final.text)='' or &
	isnull(trim(em_final.text)) then	
	
	em_final.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_final.text)=-1 then 
	em_final.text=string(today(),gs_formato_fecha)
	em_final.setfocus()
	return
end if	
if trim(em_final.text)<>'00/00/0000' and not isnull(trim(em_final.text)) and &
	trim(em_final.text)<>'' then
	ls_fecha = em_final.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_final.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_final.text = Message.StringParm
end event

type em_final from editmask within w_informe_pagos_por_parque
integer x = 891
integer y = 40
integer width = 338
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_informe_pagos_por_parque
integer x = 745
integer y = 56
integer width = 155
integer height = 56
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

type p_1 from picture within w_informe_pagos_por_parque
integer x = 663
integer y = 40
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_desde.text)='00/00/0000' or trim(em_desde.text)='' or &
	isnull(trim(em_desde.text)) then	
	
	em_desde.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_desde.text)=-1 then 
	em_desde.text=string(today(),gs_formato_fecha)
	em_desde.setfocus()
	return
end if	
if trim(em_desde.text)<>'00/00/0000' and not isnull(trim(em_desde.text)) and &
	trim(em_desde.text)<>'' then
	ls_fecha = em_desde.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type em_desde from editmask within w_informe_pagos_por_parque
integer x = 320
integer y = 40
integer width = 338
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_1 from statictext within w_informe_pagos_por_parque
integer x = 27
integer y = 56
integer width = 288
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Inicial:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_informe_pagos_por_parque
integer x = 2587
integer y = 1768
integer width = 334
integer height = 100
integer taborder = 150
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_pagos_por_parque)
end event

type dw_lista from datawindow within w_informe_pagos_por_parque
integer x = 32
integer y = 168
integer width = 2894
integer height = 1556
integer taborder = 60
string dataobject = "dw_informe_de_pagos_por_forma_pago"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_informe_pagos_por_parque
event ue_mousemove pbm_mousemove
integer x = 754
integer y = 1772
integer width = 224
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_printdlg(dw_lista,gstr_print,w_informe_pagos_por_parque)
end if
end event

type cb_exportar from commandbutton within w_informe_pagos_por_parque
event ue_mousemove pbm_mousemove
integer x = 512
integer y = 1772
integer width = 224
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_informe_pagos_por_parque
event ue_mousemove pbm_mousemove
integer x = 283
integer y = 1772
integer width = 224
integer height = 92
integer taborder = 80
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

type cb_ordenar from commandbutton within w_informe_pagos_por_parque
event ue_mousemove pbm_dwnmousemove
integer x = 55
integer y = 1772
integer width = 224
integer height = 92
integer taborder = 70
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

type gb_1 from groupbox within w_informe_pagos_por_parque
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1724
integer width = 969
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type pb_3 from picturebutton within w_informe_pagos_por_parque
event ue_mousemove pbm_mousemove
integer x = 1595
integer y = 1776
integer width = 101
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollPriorPage( )
end event

type pb_2 from picturebutton within w_informe_pagos_por_parque
event ue_mousemove pbm_mousemove
integer x = 1490
integer y = 1776
integer width = 101
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
end event

type pb_5 from picturebutton within w_informe_pagos_por_parque
event ue_mousemove pbm_mousemove
integer x = 1806
integer y = 1776
integer width = 101
integer height = 84
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount() )
end event

type pb_4 from picturebutton within w_informe_pagos_por_parque
event ue_mousemove pbm_mousemove
integer x = 1701
integer y = 1776
integer width = 101
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollNextPage( )
end event

type gb_2 from groupbox within w_informe_pagos_por_parque
event ue_mousemove pbm_mousemove
integer x = 1467
integer y = 1728
integer width = 462
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

