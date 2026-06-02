forward
global type w_buscar_bitacora from window
end type
type st_1 from statictext within w_buscar_bitacora
end type
type em_sepult from editmask within w_buscar_bitacora
end type
type pb_buscar from picturebutton within w_buscar_bitacora
end type
type cb_1 from commandbutton within w_buscar_bitacora
end type
type cb_2 from commandbutton within w_buscar_bitacora
end type
type cb_3 from commandbutton within w_buscar_bitacora
end type
type cb_imprimir from commandbutton within w_buscar_bitacora
end type
type cb_aceptar from commandbutton within w_buscar_bitacora
end type
type cb_cerrar from commandbutton within w_buscar_bitacora
end type
type dw_parque from datawindow within w_buscar_bitacora
end type
type st_16 from statictext within w_buscar_bitacora
end type
type pb_ok from picturebutton within w_buscar_bitacora
end type
type st_2 from statictext within w_buscar_bitacora
end type
type em_fec_ini from editmask within w_buscar_bitacora
end type
type p_ini from picture within w_buscar_bitacora
end type
type dw_lista from datawindow within w_buscar_bitacora
end type
type gb_1 from groupbox within w_buscar_bitacora
end type
end forward

global type w_buscar_bitacora from window
integer width = 3625
integer height = 2096
boolean titlebar = true
string title = "Listado Bitacora de Funerales"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_1 st_1
em_sepult em_sepult
pb_buscar pb_buscar
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
dw_parque dw_parque
st_16 st_16
pb_ok pb_ok
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
dw_lista dw_lista
gb_1 gb_1
end type
global w_buscar_bitacora w_buscar_bitacora

type variables
String		is_opcion,is_usuario_esta
Long		il_row
datawindowchild	idw_detalle5
end variables

on w_buscar_bitacora.create
this.st_1=create st_1
this.em_sepult=create em_sepult
this.pb_buscar=create pb_buscar
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_parque=create dw_parque
this.st_16=create st_16
this.pb_ok=create pb_ok
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.em_sepult,&
this.pb_buscar,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.cb_aceptar,&
this.cb_cerrar,&
this.dw_parque,&
this.st_16,&
this.pb_ok,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.dw_lista,&
this.gb_1}
end on

on w_buscar_bitacora.destroy
destroy(this.st_1)
destroy(this.em_sepult)
destroy(this.pb_buscar)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_parque,ll_count_usuario
//Datetime	ld_fec_ini,ld_fec_fin
Date		ld_fec_ini,ld_fec_fin
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

gf_centrar(w_buscar_bitacora)
em_fec_ini.text			= string(relativedate(date(gdt_fec_sistema),-30),'dd/mm/yyyy')

dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)

dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque				= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_parque				= 11
end if
dw_parque.setitem(1,'cod_parque',ll_parque)
//dw_lista.getchild('codigo_parentesco',idw_detalle5)
//idw_detalle5.settransobject(sqlca)
//idw_detalle5.retrieve(ll_parque)

//ld_fec_ini					= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_ini					= date(em_fec_ini.text)
ld_fec_fin					= date(gdt_fec_sistema)
//dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_parque)
dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
end event

type st_1 from statictext within w_buscar_bitacora
boolean visible = false
integer x = 2245
integer y = 1888
integer width = 416
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Buscar Sepultura"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_sepult from editmask within w_buscar_bitacora
boolean visible = false
integer x = 2674
integer y = 1868
integer width = 439
integer height = 100
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if not isnull(em_sepult.text) and em_sepult.text<>'' then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_buscar_bitacora
boolean visible = false
integer x = 3122
integer y = 1864
integer width = 105
integer height = 104
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "buscar3.bmp"
alignment htextalign = left!
end type

event clicked;long	ll_fila,ll_tot_reg

ll_tot_reg		= dw_lista.RowCount()
if ll_tot_reg > 0 then
//	ll_fila	= dw_lista.Find("sepultura = '"+trim(em_sepult.text)+"'",1, ll_tot_reg)
	if ll_fila > 0 then
		dw_lista.setfocus()
		dw_lista.scrolltorow(ll_fila)
	else
		messagebox("Advertencia","Sepultura Nº "+trim(em_sepult.text)+" No fue encontrada")
	end if
end if

end event

type cb_1 from commandbutton within w_buscar_bitacora
integer x = 1298
integer y = 1868
integer width = 229
integer height = 96
integer taborder = 80
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

type cb_2 from commandbutton within w_buscar_bitacora
integer x = 1719
integer y = 1868
integer width = 219
integer height = 96
integer taborder = 100
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

type cb_3 from commandbutton within w_buscar_bitacora
integer x = 1527
integer y = 1868
integer width = 192
integer height = 96
integer taborder = 90
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

type cb_imprimir from commandbutton within w_buscar_bitacora
integer x = 1938
integer y = 1868
integer width = 219
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
//	dw_lista.object.datawindow.zoom        = 95
//	f_printdlg(dw_lista,gstr_print,w_buscar_ficha)
	dw_lista.object.datawindow.Print.Preview  = False
//	dw_lista.object.datawindow.zoom           = 100
end if
end event

type cb_aceptar from commandbutton within w_buscar_bitacora
integer x = 37
integer y = 1872
integer width = 247
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_cod_parque,ll_parque,ll_rut_cliente,ll_rut_fall
String		ls_base,ls_serie,ls_nom_titular,ls_pat_tit,ls_mat_tit,ls_nom_fall,ls_pat_fall,ls_mat_fall,ls_dv_cliente,ls_dv_fall,ls_string,ls_cod_agente
datetime	ldt_fecha_sepult
Double	ll_numero,ll_numero_ori,ll_numero_des

il_row							= dw_lista.getrow()
if dw_lista.rowcount()>0 and il_row>0 then
//		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		ls_base				= dw_lista.getitemstring(il_row,'producto_anexo_base')
		ls_serie				= dw_lista.getitemstring(il_row,'producto_anexo_serie')
		ll_numero			= dw_lista.getitemnumber(il_row,'producto_anexo_numero')
		ll_rut_cliente		= dw_lista.getitemnumber(il_row,'cliente_rut')
		ls_dv_cliente		= dw_lista.getitemstring(il_row,'cliente_dv')
		ll_rut_fall				= dw_lista.getitemnumber(il_row,'producto_beneficiario_rut')
		ls_dv_fall				= dw_lista.getitemstring(il_row,'producto_beneficiario_dv')
		ls_cod_agente		= dw_lista.getitemstring(il_row,'producto_anexo_cod_agente')
//		ls_nom_fall			= dw_lista.getitemstring(il_row,'producto_beneficiario_nombre')
//		ls_pat_fall			= dw_lista.getitemstring(il_row,'producto_beneficiario_a_paterno')
//		ls_mat_fall			= dw_lista.getitemstring(il_row,'producto_beneficiario_a_materno')
//		ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_rut_cliente)+'~t'+ls_dv_cliente+'~t'+& 
//								 ls_nom_titular+'~t'+ls_pat_tit+'~t'+ls_mat_tit+'~t'+string(ll_rut_fall)+ls_dv_fall+ls_nom_fall+ls_pat_fall+ls_mat_fall
		ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_rut_cliente)+'~t'+ls_cod_agente+'~t'+string(ll_rut_fall)
		
//		string(ll_rut_fall)+ls_dv_fall+ls_nom_fall+ls_pat_fall+ls_mat_fall
		if isvalid(w_ingreso_bitacora) then close (w_ingreso_bitacora)
		openwithparm (w_ingreso_bitacora,ls_string)		
end if
end event

type cb_cerrar from commandbutton within w_buscar_bitacora
integer x = 3301
integer y = 1872
integer width = 261
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_buscar_bitacora)
end event

type dw_parque from datawindow within w_buscar_bitacora
boolean visible = false
integer x = 1541
integer y = 40
integer width = 594
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.accepttext()
dw_lista.reset()
end event

type st_16 from statictext within w_buscar_bitacora
boolean visible = false
integer x = 1307
integer y = 48
integer width = 210
integer height = 72
integer textsize = -10
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

type pb_ok from picturebutton within w_buscar_bitacora
integer x = 896
integer y = 20
integer width = 151
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;//Datetime	ld_fec_ini,ld_fec_fin
Date		ld_fec_ini,ld_fec_fin
Long		ll_cod_parque
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

//ld_fec_ini	= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(gdt_fec_sistema)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
//	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
//	if ll_cod_parque>0 then
//		idw_detalle5.retrieve(ll_cod_parque)
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
			messagebox("Advertencia","No Registra Dato")
		end if
//	else
//		messagebox("Advertencia","Debe Seleccionar Parque")
//		dw_parque.setfocus()
//	end if
end if
end event

type st_2 from statictext within w_buscar_bitacora
integer x = 32
integer y = 48
integer width = 361
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_buscar_bitacora
integer x = 421
integer y = 40
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type p_ini from picture within w_buscar_bitacora
integer x = 782
integer y = 40
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fec_ini.text = Message.StringParm
END IF
end event

type dw_lista from datawindow within w_buscar_bitacora
integer x = 37
integer y = 172
integer width = 3525
integer height = 1640
integer taborder = 40
string title = "none"
string dataobject = "dw_listado_bitacora"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna
if row>0 then
	il_row		= row
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
	cb_aceptar.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_buscar_bitacora
integer x = 1275
integer y = 1816
integer width = 910
integer height = 172
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

