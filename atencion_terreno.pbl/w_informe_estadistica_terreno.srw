forward
global type w_informe_estadistica_terreno from window
end type
type st_help from statictext within w_informe_estadistica_terreno
end type
type dw_lista_estado from datawindow within w_informe_estadistica_terreno
end type
type pb_procesar from picturebutton within w_informe_estadistica_terreno
end type
type em_desde from editmask within w_informe_estadistica_terreno
end type
type p_2 from picture within w_informe_estadistica_terreno
end type
type p_1 from picture within w_informe_estadistica_terreno
end type
type em_final from editmask within w_informe_estadistica_terreno
end type
type st_2 from statictext within w_informe_estadistica_terreno
end type
type st_1 from statictext within w_informe_estadistica_terreno
end type
type cb_cerrar from commandbutton within w_informe_estadistica_terreno
end type
type dw_lista from datawindow within w_informe_estadistica_terreno
end type
type cb_imprimir from commandbutton within w_informe_estadistica_terreno
end type
type cb_exportar from commandbutton within w_informe_estadistica_terreno
end type
type cb_filtrar from commandbutton within w_informe_estadistica_terreno
end type
type cb_ordenar from commandbutton within w_informe_estadistica_terreno
end type
type gb_1 from groupbox within w_informe_estadistica_terreno
end type
type pb_2 from picturebutton within w_informe_estadistica_terreno
end type
type pb_3 from picturebutton within w_informe_estadistica_terreno
end type
type pb_4 from picturebutton within w_informe_estadistica_terreno
end type
type pb_5 from picturebutton within w_informe_estadistica_terreno
end type
type gb_2 from groupbox within w_informe_estadistica_terreno
end type
end forward

global type w_informe_estadistica_terreno from window
integer width = 3264
integer height = 1996
boolean titlebar = true
string title = "Cuadro Estadítico Atención en Terreno"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_help st_help
dw_lista_estado dw_lista_estado
pb_procesar pb_procesar
em_desde em_desde
p_2 p_2
p_1 p_1
em_final em_final
st_2 st_2
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
gb_1 gb_1
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
pb_5 pb_5
gb_2 gb_2
end type
global w_informe_estadistica_terreno w_informe_estadistica_terreno

type variables
Long		il_row
String	is_opcion
end variables

on w_informe_estadistica_terreno.create
this.st_help=create st_help
this.dw_lista_estado=create dw_lista_estado
this.pb_procesar=create pb_procesar
this.em_desde=create em_desde
this.p_2=create p_2
this.p_1=create p_1
this.em_final=create em_final
this.st_2=create st_2
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.gb_1=create gb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.pb_5=create pb_5
this.gb_2=create gb_2
this.Control[]={this.st_help,&
this.dw_lista_estado,&
this.pb_procesar,&
this.em_desde,&
this.p_2,&
this.p_1,&
this.em_final,&
this.st_2,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.gb_1,&
this.pb_2,&
this.pb_3,&
this.pb_4,&
this.pb_5,&
this.gb_2}
end on

on w_informe_estadistica_terreno.destroy
destroy(this.st_help)
destroy(this.dw_lista_estado)
destroy(this.pb_procesar)
destroy(this.em_desde)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.em_final)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.gb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.pb_5)
destroy(this.gb_2)
end on

event open;dw_lista.settransobject(sqlca)
em_desde.text	= string(gdt_fec_sistema,"dd/mm/yyyy")
em_final.text	= string(gdt_fec_sistema,"dd/mm/yyyy")
is_opcion	= Message.StringParm
CHOOSE CASE is_opcion
	CASE 'T' //Telefono
		dw_lista.dataobject					= 'dw_cuadro_estadistico_gestion_terreno'
		dw_lista_estado.dataobject			= 'dw_ayuda_lista_estado_cobranza'
		this.title									= 'Informe Estadístico por Fecha y Estado Cobranza Telefónico'
	CASE 'V' //Visita Terreno
		dw_lista.dataobject					= 'dw_cuadro_estadistico_visita_terreno'
		dw_lista_estado.dataobject			= 'dw_ayuda_lista_estado_at_cliente'
		this.title									= 'Informe Estadístico por Fecha y Estado Visita Terreno'
END CHOOSE	
w_informe_estadistica_terreno.width		= 2391
dw_lista.settransobject(sqlca)
dw_lista_estado.settransobject(sqlca)
dw_lista_estado.retrieve()
gf_centrar(w_informe_estadistica_terreno)
end event

type st_help from statictext within w_informe_estadistica_terreno
integer x = 1061
integer y = 1760
integer width = 448
integer height = 116
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 80269524
string text = "Mostrar Codigo Estado"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if this.text='Mostrar Codigo Estado' then
	w_informe_estadistica_terreno.width	= 3232
	this.text='No Mostrar Codigo Estado'
else
	w_informe_estadistica_terreno.width	= 2391
	this.text='Mostrar Codigo Estado'
end if
st_help.x		= 1033
st_help.y		= 1764
st_help.width	= 503
st_help.height	= 116
gf_centrar(w_informe_estadistica_terreno)

end event

type dw_lista_estado from datawindow within w_informe_estadistica_terreno
integer x = 2382
integer y = 168
integer width = 805
integer height = 1704
integer taborder = 50
string title = "none"
string dataobject = "dw_ayuda_lista_estado_envio_carta"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type pb_procesar from picturebutton within w_informe_estadistica_terreno
integer x = 1504
integer y = 24
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date		ld_fecha_ini,ld_fecha_fin
String	ls_usuario

SELECT	"SOL_PERMISOS_USUARIO"."USUARIO"  
INTO 		:ls_usuario  
FROM 		"SOL_PERMISOS_USUARIO"  
WHERE  ( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'AT' ) AND  
		 ( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
		 ( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' )   
USING		sqlca;
if sqlca.sqlcode=0 or gs_depto='I' then
	ls_usuario	= '%'
else
	ls_usuario	= gs_user
end if
ld_fecha_ini	= date(em_desde.text)
ld_fecha_fin	= date(em_final.text)
if ld_fecha_ini > ld_fecha_fin then
	Messagebox("Advertencia","Rango de Fecha Inválida")
	em_desde.setfocus()
else
	if dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,ls_usuario)=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

type em_desde from editmask within w_informe_estadistica_terreno
integer x = 361
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

type p_2 from picture within w_informe_estadistica_terreno
integer x = 1294
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

type p_1 from picture within w_informe_estadistica_terreno
integer x = 704
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

type em_final from editmask within w_informe_estadistica_terreno
integer x = 951
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

type st_2 from statictext within w_informe_estadistica_terreno
integer x = 795
integer y = 56
integer width = 155
integer height = 56
integer textsize = -8
integer weight = 700
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

type st_1 from statictext within w_informe_estadistica_terreno
integer x = 41
integer y = 56
integer width = 320
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Inicial:"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_informe_estadistica_terreno
integer x = 2057
integer y = 1780
integer width = 283
integer height = 92
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_estadistica_terreno)
end event

type dw_lista from datawindow within w_informe_estadistica_terreno
integer x = 32
integer y = 168
integer width = 2309
integer height = 1544
integer taborder = 40
string title = "none"
string dataobject = "dw_cuadro_estadistico_gestion_terreno"
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

event doubleclicked;String	ls_fecha,ls_string,ls_columna,ls_campo
Long		ll_cantidad

ls_columna	= dwo.name
if row>0 then 
	il_row		= row
	ls_fecha		= string(date(dw_lista.getitemdatetime(il_row,'compute_0015')))
	ll_cantidad	= dw_lista.getitemnumber(il_row,'grand_count_estado')
	ls_string	= ls_fecha+'~t'+is_opcion
	if ll_cantidad>0 then openwithparm(w_detalle_agrupacion_por_fecha_terreno,ls_string)
end if
ls_campo	= mid(ls_columna,1,9)
if ls_campo='compute_1' or ls_campo='compute_2' or ls_campo='compute_3' then
	if dw_lista.rowcount()>0 then 
		ls_string	= em_desde.text+'~t'+em_final.text+'~t'+is_opcion
		openwithparm(w_detalle_agrupacion_rango_fecha_terreno,ls_string)
	end if
end if
end event

type cb_imprimir from commandbutton within w_informe_estadistica_terreno
event ue_mousemove pbm_mousemove
integer x = 754
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
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
//	f_printdlg(dw_lista,gstr_print,w_informe_estadistica_terreno)
end if
end event

type cb_exportar from commandbutton within w_informe_estadistica_terreno
event ue_mousemove pbm_mousemove
integer x = 512
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
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_informe_estadistica_terreno
event ue_mousemove pbm_mousemove
integer x = 283
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
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_informe_estadistica_terreno
event ue_mousemove pbm_dwnmousemove
integer x = 55
integer y = 1772
integer width = 224
integer height = 92
integer taborder = 60
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

type gb_1 from groupbox within w_informe_estadistica_terreno
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

type pb_2 from picturebutton within w_informe_estadistica_terreno
event ue_mousemove pbm_mousemove
integer x = 1582
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 100
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

type pb_3 from picturebutton within w_informe_estadistica_terreno
event ue_mousemove pbm_mousemove
integer x = 1687
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 110
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

type pb_4 from picturebutton within w_informe_estadistica_terreno
event ue_mousemove pbm_mousemove
integer x = 1792
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 120
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

type pb_5 from picturebutton within w_informe_estadistica_terreno
event ue_mousemove pbm_mousemove
integer x = 1897
integer y = 1772
integer width = 101
integer height = 84
integer taborder = 130
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

type gb_2 from groupbox within w_informe_estadistica_terreno
event ue_mousemove pbm_mousemove
integer x = 1559
integer y = 1724
integer width = 462
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 1086902484
end type

