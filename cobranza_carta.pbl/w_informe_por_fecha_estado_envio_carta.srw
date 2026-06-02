forward
global type w_informe_por_fecha_estado_envio_carta from window
end type
type dw_parque from datawindow within w_informe_por_fecha_estado_envio_carta
end type
type st_16 from statictext within w_informe_por_fecha_estado_envio_carta
end type
type hpb_1 from hprogressbar within w_informe_por_fecha_estado_envio_carta
end type
type st_fondo from statictext within w_informe_por_fecha_estado_envio_carta
end type
type st_porc from statictext within w_informe_por_fecha_estado_envio_carta
end type
type cb_imprimir from commandbutton within w_informe_por_fecha_estado_envio_carta
end type
type cb_exportar from commandbutton within w_informe_por_fecha_estado_envio_carta
end type
type cb_filtrar from commandbutton within w_informe_por_fecha_estado_envio_carta
end type
type cb_ordenar from commandbutton within w_informe_por_fecha_estado_envio_carta
end type
type st_3 from statictext within w_informe_por_fecha_estado_envio_carta
end type
type ddlb_estado from dropdownlistbox within w_informe_por_fecha_estado_envio_carta
end type
type cb_ctacte from commandbutton within w_informe_por_fecha_estado_envio_carta
end type
type cb_cerrar from commandbutton within w_informe_por_fecha_estado_envio_carta
end type
type pb_procesar from picturebutton within w_informe_por_fecha_estado_envio_carta
end type
type p_2 from picture within w_informe_por_fecha_estado_envio_carta
end type
type p_1 from picture within w_informe_por_fecha_estado_envio_carta
end type
type em_final from editmask within w_informe_por_fecha_estado_envio_carta
end type
type em_desde from editmask within w_informe_por_fecha_estado_envio_carta
end type
type st_2 from statictext within w_informe_por_fecha_estado_envio_carta
end type
type st_1 from statictext within w_informe_por_fecha_estado_envio_carta
end type
type dw_lista from datawindow within w_informe_por_fecha_estado_envio_carta
end type
type gb_1 from groupbox within w_informe_por_fecha_estado_envio_carta
end type
end forward

global type w_informe_por_fecha_estado_envio_carta from window
integer width = 3744
integer height = 1928
boolean titlebar = true
string title = "Informe Cobranza Telefónica por Rango de Fecha"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_parque dw_parque
st_16 st_16
hpb_1 hpb_1
st_fondo st_fondo
st_porc st_porc
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
dw_lista dw_lista
gb_1 gb_1
end type
global w_informe_por_fecha_estado_envio_carta w_informe_por_fecha_estado_envio_carta

type variables
Long	il_row
end variables

on w_informe_por_fecha_estado_envio_carta.create
this.dw_parque=create dw_parque
this.st_16=create st_16
this.hpb_1=create hpb_1
this.st_fondo=create st_fondo
this.st_porc=create st_porc
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
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.dw_parque,&
this.st_16,&
this.hpb_1,&
this.st_fondo,&
this.st_porc,&
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
this.dw_lista,&
this.gb_1}
end on

on w_informe_por_fecha_estado_envio_carta.destroy
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.hpb_1)
destroy(this.st_fondo)
destroy(this.st_porc)
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
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;String	ls_codigo,ls_glosa
Long		ll_codigo,ll_cod_parque

SetPointer(HourGlass!)
gf_centrar(w_informe_por_fecha_estado_envio_carta)
dw_lista.settransobject(sqlca)
em_desde	.text		= string(date(gdt_fec_sistema))
em_final.text		= string(date(gdt_fec_sistema))
st_fondo.visible	= false
hpb_1.visible 		= false
st_porc.visible 	= false	
DECLARE x1 CURSOR FOR  
SELECT	"ESTADO_ENVIO"."CODIGO",   
			"ESTADO_ENVIO"."DESCRIPCION",   
			to_number("ESTADO_ENVIO"."CODIGO")  
FROM 		"ESTADO_ENVIO"  
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
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque	= 11
elseif gs_conexion = "Parque Concepción" then
	ll_cod_parque	= 801
end if
dw_parque.setitem(1,'cod_parque',ll_cod_parque)
dw_parque.accepttext()
pb_procesar.triggerevent(clicked!)
SetPointer(Arrow!)
end event

type dw_parque from datawindow within w_informe_por_fecha_estado_envio_carta
integer x = 1536
integer y = 40
integer width = 594
integer height = 104
integer taborder = 50
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
dw_parque.accepttext()
end event

type st_16 from statictext within w_informe_por_fecha_estado_envio_carta
integer x = 1353
integer y = 56
integer width = 169
integer height = 60
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

type hpb_1 from hprogressbar within w_informe_por_fecha_estado_envio_carta
boolean visible = false
integer x = 914
integer y = 1040
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_fondo from statictext within w_informe_por_fecha_estado_envio_carta
boolean visible = false
integer x = 882
integer y = 936
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_porc from statictext within w_informe_por_fecha_estado_envio_carta
boolean visible = false
integer x = 1454
integer y = 964
integer width = 233
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_imprimir from commandbutton within w_informe_por_fecha_estado_envio_carta
event ue_mousemove pbm_mousemove
integer x = 1915
integer y = 1712
integer width = 242
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
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_informe_por_fecha_estado_envio_carta
event ue_mousemove pbm_mousemove
integer x = 1563
integer y = 1712
integer width = 242
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

type cb_filtrar from commandbutton within w_informe_por_fecha_estado_envio_carta
event ue_mousemove pbm_mousemove
integer x = 1317
integer y = 1712
integer width = 242
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

type cb_ordenar from commandbutton within w_informe_por_fecha_estado_envio_carta
event ue_mousemove pbm_dwnmousemove
integer x = 1070
integer y = 1712
integer width = 242
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

type st_3 from statictext within w_informe_por_fecha_estado_envio_carta
integer x = 2162
integer y = 56
integer width = 416
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Cobranza"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_estado from dropdownlistbox within w_informe_por_fecha_estado_envio_carta
integer x = 2587
integer y = 44
integer width = 910
integer height = 400
integer taborder = 30
integer textsize = -9
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

type cb_ctacte from commandbutton within w_informe_por_fecha_estado_envio_carta
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1712
integer width = 411
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string ls_base,ls_serie,param
long 	 ll_rut
Double	ll_numero
if il_row > 0 and dw_lista.rowcount()>0 then
	gs_base		= dw_lista.getitemstring(il_row,'carta_log_base')
	gs_serie		= dw_lista.getitemstring(il_row,'carta_log_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'carta_log_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'carta_log_rut')
	param    	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
		CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				OpenWithParm(w_cuenta_corriente_funeraria,param) 
		CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if

end event

type cb_cerrar from commandbutton within w_informe_por_fecha_estado_envio_carta
integer x = 3401
integer y = 1712
integer width = 288
integer height = 92
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_por_fecha_estado_envio_carta)
end event

type pb_procesar from picturebutton within w_informe_por_fecha_estado_envio_carta
integer x = 3547
integer y = 24
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date		ld_fecha_ini,ld_fecha_fin
datetime	ldt_fecha
String		ls_codigo,ls_base,ls_serie
Long		ll_tot_reg,ll_indi,ll_rut,ll_monto,ll_tot_porc,ll_tot_porc_aux,ll_cod_parque
Double	ll_numero
ld_fecha_ini	= date(em_desde.text)
ld_fecha_fin	= date(em_final.text)
dw_parque.accepttext()
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if ld_fecha_ini > ld_fecha_fin then
	Messagebox("Advertencia","Rango de Fecha Inválida")
	em_desde.setfocus()
else
	if ll_cod_parque>0 then
		ls_codigo	= trim(mid(ddlb_estado.text,1,2))
		if ls_codigo='T' then ls_codigo='%'
		st_fondo.visible				= true
		hpb_1.visible 					= true
		st_porc.visible 				= true
		ll_tot_porc						= 0
		ll_tot_porc_aux				= 0
		ll_tot_reg	= dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,ls_codigo,ll_cod_parque)
		hpb_1.Position					= ll_tot_porc
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ll_rut		= dw_lista.getitemnumber(ll_indi,'carta_log_rut')
				ls_base		= dw_lista.getitemstring(ll_indi,'carta_log_base')
				ls_serie		= dw_lista.getitemstring(ll_indi,'carta_log_serie')
				ll_numero	= dw_lista.getitemnumber(ll_indi,'carta_log_numero')
				ldt_fecha		= dw_lista.getitemdatetime(ll_indi,'carta_log_fecha_carta')
//				ll_monto		= f_retorno_pago( ll_rut , ls_base , ls_serie , ll_numero , ldt_fecha )
//				dw_lista.setitem(ll_indi,'tot_monto_ing_caja_cred',ll_monto)
//				ll_monto		= f_retorno_pago_mant( ll_rut , ls_base , ls_serie , ll_numero , ldt_fecha )
//				dw_lista.setitem(ll_indi,'tot_monto_ing_caja_mant',ll_monto)
				if ll_tot_porc <> ll_tot_porc_aux then 
					st_porc.text		= string(ll_tot_porc)+" %"
					ll_tot_porc_aux	= ll_tot_porc
				end if
				ll_tot_porc				= (ll_indi / ll_tot_reg) * 100
				hpb_1.Position 		= ll_tot_porc
			next
			dw_lista.accepttext()
		end if
		st_fondo.visible				= false
		hpb_1.visible 					= false
		st_porc.visible 				= false	
	else
		messagebox("Advertencia","Debe Seleccionar Parque")
		dw_parque.setfocus()
	end if
end if
end event

type p_2 from picture within w_informe_por_fecha_estado_envio_carta
integer x = 1225
integer y = 44
integer width = 78
integer height = 80
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

type p_1 from picture within w_informe_por_fecha_estado_envio_carta
integer x = 640
integer y = 44
integer width = 78
integer height = 80
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

type em_final from editmask within w_informe_por_fecha_estado_envio_carta
integer x = 910
integer y = 44
integer width = 311
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

type em_desde from editmask within w_informe_por_fecha_estado_envio_carta
integer x = 325
integer y = 44
integer width = 311
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

type st_2 from statictext within w_informe_por_fecha_estado_envio_carta
integer x = 750
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
boolean focusrectangle = false
end type

type st_1 from statictext within w_informe_por_fecha_estado_envio_carta
integer x = 32
integer y = 56
integer width = 293
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
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_informe_por_fecha_estado_envio_carta
integer x = 32
integer y = 172
integer width = 3657
integer height = 1496
integer taborder = 50
string title = "none"
string dataobject = "dw_informe_por_fecha_envio_carta_2"
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

type gb_1 from groupbox within w_informe_por_fecha_estado_envio_carta
event ue_mousemove pbm_mousemove
integer x = 1047
integer y = 1664
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

