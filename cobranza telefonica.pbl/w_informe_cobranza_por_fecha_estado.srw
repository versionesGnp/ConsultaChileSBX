forward
global type w_informe_cobranza_por_fecha_estado from window
end type
type dw_ejecutivo from datawindow within w_informe_cobranza_por_fecha_estado
end type
type st_6 from statictext within w_informe_cobranza_por_fecha_estado
end type
type cb_imprimir from commandbutton within w_informe_cobranza_por_fecha_estado
end type
type cb_exportar from commandbutton within w_informe_cobranza_por_fecha_estado
end type
type cb_filtrar from commandbutton within w_informe_cobranza_por_fecha_estado
end type
type cb_ordenar from commandbutton within w_informe_cobranza_por_fecha_estado
end type
type st_3 from statictext within w_informe_cobranza_por_fecha_estado
end type
type ddlb_estado from dropdownlistbox within w_informe_cobranza_por_fecha_estado
end type
type cb_ctacte from commandbutton within w_informe_cobranza_por_fecha_estado
end type
type cb_cerrar from commandbutton within w_informe_cobranza_por_fecha_estado
end type
type pb_procesar from picturebutton within w_informe_cobranza_por_fecha_estado
end type
type p_2 from picture within w_informe_cobranza_por_fecha_estado
end type
type p_1 from picture within w_informe_cobranza_por_fecha_estado
end type
type em_final from editmask within w_informe_cobranza_por_fecha_estado
end type
type em_desde from editmask within w_informe_cobranza_por_fecha_estado
end type
type st_2 from statictext within w_informe_cobranza_por_fecha_estado
end type
type st_1 from statictext within w_informe_cobranza_por_fecha_estado
end type
type gb_1 from groupbox within w_informe_cobranza_por_fecha_estado
end type
type dw_lista from datawindow within w_informe_cobranza_por_fecha_estado
end type
end forward

global type w_informe_cobranza_por_fecha_estado from window
integer width = 3552
integer height = 1972
boolean titlebar = true
string title = "Informe Cobranza Telefónica por Rango de Fecha"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_ejecutivo dw_ejecutivo
st_6 st_6
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
st_3 st_3
ddlb_estado ddlb_estado
cb_ctacte cb_ctacte
cb_cerrar cb_cerrar
pb_procesar pb_procesar
p_2 p_2
p_1 p_1
em_final em_final
em_desde em_desde
st_2 st_2
st_1 st_1
gb_1 gb_1
dw_lista dw_lista
end type
global w_informe_cobranza_por_fecha_estado w_informe_cobranza_por_fecha_estado

type variables
Long	il_row
end variables

on w_informe_cobranza_por_fecha_estado.create
this.dw_ejecutivo=create dw_ejecutivo
this.st_6=create st_6
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.st_3=create st_3
this.ddlb_estado=create ddlb_estado
this.cb_ctacte=create cb_ctacte
this.cb_cerrar=create cb_cerrar
this.pb_procesar=create pb_procesar
this.p_2=create p_2
this.p_1=create p_1
this.em_final=create em_final
this.em_desde=create em_desde
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.dw_lista=create dw_lista
this.Control[]={this.dw_ejecutivo,&
this.st_6,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.st_3,&
this.ddlb_estado,&
this.cb_ctacte,&
this.cb_cerrar,&
this.pb_procesar,&
this.p_2,&
this.p_1,&
this.em_final,&
this.em_desde,&
this.st_2,&
this.st_1,&
this.gb_1,&
this.dw_lista}
end on

on w_informe_cobranza_por_fecha_estado.destroy
destroy(this.dw_ejecutivo)
destroy(this.st_6)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.st_3)
destroy(this.ddlb_estado)
destroy(this.cb_ctacte)
destroy(this.cb_cerrar)
destroy(this.pb_procesar)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.em_final)
destroy(this.em_desde)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.dw_lista)
end on

event open;String	ls_codigo,ls_glosa,ls_usuario
Long		ll_codigo

SetPointer(HourGlass!)
gf_centrar(w_informe_cobranza_por_fecha_estado)
dw_lista.settransobject(sqlca)
em_desde	.text	= string(today())
em_final.text	= string(today())
dw_ejecutivo.settransobject(sqlca)
dw_ejecutivo.insertrow(0)
SELECT DISTINCT "SOL_PERMISOS_USUARIO"."USUARIO"  
INTO		:ls_usuario  
FROM 		"SOL_PERMISOS_USUARIO"  
WHERE 	"SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user   
USING		sqlca;
if ls_usuario = gs_user then
	ls_usuario				= '%'
	dw_ejecutivo.enabled	= true
else
	ls_usuario				= gs_user
	dw_ejecutivo.setitem(1,'cod_usuario',ls_usuario)
	dw_ejecutivo.enabled	= false
end if
dw_ejecutivo.accepttext()
//pb_procesar.triggerevent(clicked!)

DECLARE x1 CURSOR FOR  
SELECT	"ESTADO_COBRANZA"."COD_ESATDO",   
			"ESTADO_COBRANZA"."GLOSA_ESTADO",   
			to_number("ESTADO_COBRANZA"."COD_ESATDO")  
FROM 		"ESTADO_COBRANZA"  
ORDER BY 3 ASC  
USING		sqlca;
open x1;
DO WHILE sqlca.sqlcode=0
	if sqlca.sqlcode=0 then
		fetch x1 into :ls_codigo,:ls_glosa,:ll_codigo;
		if not isnull(ls_codigo) then
			ddlb_estado.additem(ls_codigo+' - '+ls_glosa)
		end if
	end if
	setnull(ls_codigo);setnull(ls_glosa);setnull(ll_codigo)
LOOP
ddlb_estado.additem('T'+' - '+'TODAS')
close x1;
ddlb_estado.text	= 'T'
SetPointer(Arrow!)
end event

type dw_ejecutivo from datawindow within w_informe_cobranza_por_fecha_estado
integer x = 1513
integer y = 36
integer width = 599
integer height = 104
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_encargado_cobranza"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
dw_ejecutivo.accepttext()
end event

type st_6 from statictext within w_informe_cobranza_por_fecha_estado
integer x = 1294
integer y = 60
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Ejecutivo"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_imprimir from commandbutton within w_informe_cobranza_por_fecha_estado
event ue_mousemove pbm_mousemove
integer x = 2057
integer y = 1716
integer width = 242
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_informe_cobranza_por_fecha_estado
event ue_mousemove pbm_mousemove
integer x = 1705
integer y = 1716
integer width = 242
integer height = 92
integer taborder = 100
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

type cb_filtrar from commandbutton within w_informe_cobranza_por_fecha_estado
event ue_mousemove pbm_mousemove
integer x = 1458
integer y = 1716
integer width = 242
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string ls_texto
setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas		= dw_lista.rowcount()
gs_formula 	= dw_lista.describe("datawindow.syntax")
ll_largototal	= len(gs_formula)
ll_posini	= Pos(gs_formula, "filter") + 8
ll_posfin	= len("~nfilter~n")
ls_texto		= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto		= ll_posfin - ll_posini
gs_formula	= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula	= ''
end if

end event

type cb_ordenar from commandbutton within w_informe_cobranza_por_fecha_estado
event ue_mousemove pbm_dwnmousemove
integer x = 1211
integer y = 1716
integer width = 242
integer height = 92
integer taborder = 80
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

type st_3 from statictext within w_informe_cobranza_por_fecha_estado
integer x = 2117
integer y = 56
integer width = 297
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Cob.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_estado from dropdownlistbox within w_informe_cobranza_por_fecha_estado
integer x = 2423
integer y = 44
integer width = 887
integer height = 400
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
end event

type cb_ctacte from commandbutton within w_informe_cobranza_por_fecha_estado
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 32
integer y = 1712
integer width = 407
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string param
if il_row > 0 then
	gs_base		= dw_lista.getitemstring(il_row,'tele_log_base')
	gs_serie		= dw_lista.getitemstring(il_row,'tele_log_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'tele_log_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'tele_log_rut')
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if

end event

type cb_cerrar from commandbutton within w_informe_cobranza_por_fecha_estado
integer x = 3214
integer y = 1712
integer width = 288
integer height = 92
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_cobranza_por_fecha_estado)
end event

type pb_procesar from picturebutton within w_informe_cobranza_por_fecha_estado
integer x = 3360
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

event clicked;Datetime	ld_fecha_ini,ld_fecha_fin
String	ls_codigo,ls_usuario

ld_fecha_ini	= datetime(date(em_desde.text),time('00:00:00'))
ld_fecha_fin	= datetime(date(em_final.text),time('23:59:59'))
ls_usuario		= dw_ejecutivo.getitemstring(1,'cod_usuario')
if ld_fecha_ini > ld_fecha_fin then
	Messagebox("Advertencia","Rango de Fecha Inválida")
	em_desde.setfocus()
else
	ls_codigo	= trim(mid(ddlb_estado.text,1,2))
	if ls_codigo='T' then ls_codigo='%'
	if not isnull(ls_usuario) then
		dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,ls_codigo,ls_usuario)
	else
		Messagebox("Advertencia","Debe Seleccionar Ejecutivo")
		dw_ejecutivo.setfocus()
	end if
end if
end event

type p_2 from picture within w_informe_cobranza_por_fecha_estado
integer x = 1189
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
em_final.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_final.text = Message.StringParm
end event

type p_1 from picture within w_informe_cobranza_por_fecha_estado
integer x = 635
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
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type em_final from editmask within w_informe_cobranza_por_fecha_estado
integer x = 878
integer y = 44
integer width = 306
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type em_desde from editmask within w_informe_cobranza_por_fecha_estado
integer x = 325
integer y = 44
integer width = 306
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type st_2 from statictext within w_informe_cobranza_por_fecha_estado
integer x = 722
integer y = 56
integer width = 142
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
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_informe_cobranza_por_fecha_estado
integer x = 18
integer y = 56
integer width = 302
integer height = 64
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

type gb_1 from groupbox within w_informe_cobranza_por_fecha_estado
event ue_mousemove pbm_mousemove
integer x = 1189
integer y = 1668
integer width = 1138
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

type dw_lista from datawindow within w_informe_cobranza_por_fecha_estado
integer x = 32
integer y = 172
integer width = 3470
integer height = 1496
integer taborder = 60
string title = "none"
string dataobject = "dw_informe_por_fecha_estado_cobranza_2"
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

event doubleclicked;if row>0 then 
	il_row	= row
	cb_ctacte.triggerevent(clicked!)
end if
	
end event

