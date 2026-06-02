forward
global type w_buscar_mensajes from window
end type
type cb_limpiar from commandbutton within w_buscar_mensajes
end type
type cb_1 from commandbutton within w_buscar_mensajes
end type
type cb_2 from commandbutton within w_buscar_mensajes
end type
type cb_3 from commandbutton within w_buscar_mensajes
end type
type p_ctto from picture within w_buscar_mensajes
end type
type em_nro_ctto from editmask within w_buscar_mensajes
end type
type st_4 from statictext within w_buscar_mensajes
end type
type p_rut from picture within w_buscar_mensajes
end type
type em_rut from editmask within w_buscar_mensajes
end type
type st_1 from statictext within w_buscar_mensajes
end type
type pb_ok2 from picturebutton within w_buscar_mensajes
end type
type cb_imprimir from commandbutton within w_buscar_mensajes
end type
type p_fin from picture within w_buscar_mensajes
end type
type st_3 from statictext within w_buscar_mensajes
end type
type p_ini from picture within w_buscar_mensajes
end type
type em_fec_ini from editmask within w_buscar_mensajes
end type
type st_2 from statictext within w_buscar_mensajes
end type
type em_fec_fin from editmask within w_buscar_mensajes
end type
type cb_cerrar from commandbutton within w_buscar_mensajes
end type
type cb_aceptar from commandbutton within w_buscar_mensajes
end type
type dw_lista from datawindow within w_buscar_mensajes
end type
type gb_1 from groupbox within w_buscar_mensajes
end type
end forward

global type w_buscar_mensajes from window
integer width = 4192
integer height = 2080
boolean titlebar = true
string title = "Buscar Mensaje"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_limpiar cb_limpiar
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
p_ctto p_ctto
em_nro_ctto em_nro_ctto
st_4 st_4
p_rut p_rut
em_rut em_rut
st_1 st_1
pb_ok2 pb_ok2
cb_imprimir cb_imprimir
p_fin p_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
em_fec_fin em_fec_fin
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_lista dw_lista
gb_1 gb_1
end type
global w_buscar_mensajes w_buscar_mensajes

on w_buscar_mensajes.create
this.cb_limpiar=create cb_limpiar
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.p_ctto=create p_ctto
this.em_nro_ctto=create em_nro_ctto
this.st_4=create st_4
this.p_rut=create p_rut
this.em_rut=create em_rut
this.st_1=create st_1
this.pb_ok2=create pb_ok2
this.cb_imprimir=create cb_imprimir
this.p_fin=create p_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_limpiar,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.p_ctto,&
this.em_nro_ctto,&
this.st_4,&
this.p_rut,&
this.em_rut,&
this.st_1,&
this.pb_ok2,&
this.cb_imprimir,&
this.p_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.em_fec_fin,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_lista,&
this.gb_1}
end on

on w_buscar_mensajes.destroy
destroy(this.cb_limpiar)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.p_ctto)
destroy(this.em_nro_ctto)
destroy(this.st_4)
destroy(this.p_rut)
destroy(this.em_rut)
destroy(this.st_1)
destroy(this.pb_ok2)
destroy(this.cb_imprimir)
destroy(this.p_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;datetime		ld_fec_ini,ld_fec_fin
gf_centrar(w_buscar_mensajes)
dw_lista.settransobject(sqlca)
em_fec_ini.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
ld_fec_ini			= datetime(date(gdt_fec_sistema),time('00:00:00'))
ld_fec_fin			= datetime(date(gdt_fec_sistema),time('23:59:59'))
dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
end event

type cb_limpiar from commandbutton within w_buscar_mensajes
integer x = 1330
integer y = 1804
integer width = 233
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_lista.reset()
em_fec_ini.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
em_rut.text			= ''
em_nro_ctto.text	= ''
pb_ok2.triggerevent(clicked!)
end event

type cb_1 from commandbutton within w_buscar_mensajes
integer x = 430
integer y = 1804
integer width = 229
integer height = 96
integer taborder = 60
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

type cb_2 from commandbutton within w_buscar_mensajes
integer x = 869
integer y = 1804
integer width = 219
integer height = 96
integer taborder = 80
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

type cb_3 from commandbutton within w_buscar_mensajes
integer x = 663
integer y = 1804
integer width = 201
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
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

type p_ctto from picture within w_buscar_mensajes
integer x = 3474
integer y = 1800
integer width = 91
integer height = 88
string picturename = "buscar3.bmp"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Long	ll_ctto,ll_fila,ll_tot_reg

ll_ctto			= long(em_nro_ctto.text)
if ll_ctto>0 then
	ll_tot_reg	= dw_lista.rowcount()
	ll_fila		= dw_lista.Find("numero = " +string(ll_ctto),1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.setfocus()
	else
		messagebox("Advertencia","No Existe Nº Contrato ")
	end if

else
	messagebox("Advertencia","Debe Ingresar Nº Contrato")
	em_rut.setfocus()
end if
end event

type em_nro_ctto from editmask within w_buscar_mensajes
integer x = 3081
integer y = 1796
integer width = 389
integer height = 96
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event losefocus;if long(this.text)>0 then em_rut.text	= ''
end event

event modified;Long	ll_ctto
ll_ctto	= long(this.text)
if ll_ctto>0 then
	p_ctto.triggerevent(clicked!)
end if
end event

type st_4 from statictext within w_buscar_mensajes
integer x = 2574
integer y = 1816
integer width = 489
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Nº Contrato"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_rut from picture within w_buscar_mensajes
integer x = 2432
integer y = 1800
integer width = 91
integer height = 88
string picturename = "buscar3.bmp"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Long	ll_rut,ll_fila,ll_tot_reg

ll_rut			= long(em_rut.text)
if ll_rut>0 then
	ll_tot_reg	= dw_lista.rowcount()
	ll_fila		= dw_lista.Find("rut = " +string(ll_rut),1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.setfocus()
	else
		messagebox("Advertencia","No Existe Rut ")
	end if

else
	messagebox("Advertencia","Debe Ingresar Rut")
	em_rut.setfocus()
end if
end event

type em_rut from editmask within w_buscar_mensajes
integer x = 1979
integer y = 1796
integer width = 448
integer height = 96
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;Long	ll_rut
ll_rut	= long(this.text)
if ll_rut>0 then
	p_rut.triggerevent(clicked!)
end if
end event

event losefocus;if long(this.text)>0 then em_nro_ctto.text	= ''
end event

type st_1 from statictext within w_buscar_mensajes
integer x = 1641
integer y = 1812
integer width = 320
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar RUT"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_ok2 from picturebutton within w_buscar_mensajes
event ue_mousemove pbm_mousemove
integer x = 1577
integer y = 44
integer width = 151
integer height = 124
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;datetime	ld_fec_ini,ld_fec_fin
Long		ll_corre,ll_tot_reg
Time		lt_ini=time('00:00:00'),lt_fin=time('23:59:59')

dw_lista.reset()

ld_fec_ini										= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin										= datetime(date(em_fec_fin.text),lt_fin)

if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			ll_tot_reg	= dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Dato")
			end if
		end if
	end if
end if
end event

type cb_imprimir from commandbutton within w_buscar_mensajes
integer x = 1093
integer y = 1804
integer width = 233
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom				= 95
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview	= False
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type p_fin from picture within w_buscar_mensajes
integer x = 1454
integer y = 64
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;dw_lista.reset()
string ls_fecha,fech

if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type st_3 from statictext within w_buscar_mensajes
integer x = 910
integer y = 72
integer width = 169
integer height = 72
integer textsize = -10
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

type p_ini from picture within w_buscar_mensajes
integer x = 823
integer y = 64
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;dw_lista.reset()
string ls_fecha,fech

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
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_buscar_mensajes
event ue_keypress pbm_keydown
integer x = 462
integer y = 64
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

event modified;//dw_lista.reset()

end event

type st_2 from statictext within w_buscar_mensajes
integer x = 78
integer y = 72
integer width = 366
integer height = 72
integer textsize = -10
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

type em_fec_fin from editmask within w_buscar_mensajes
integer x = 1093
integer y = 64
integer width = 357
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

event modified;//dw_lista.reset()

end event

type cb_cerrar from commandbutton within w_buscar_mensajes
integer x = 3694
integer y = 1788
integer width = 402
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_buscar_mensajes)
end event

type cb_aceptar from commandbutton within w_buscar_mensajes
integer x = 46
integer y = 1788
integer width = 306
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long	ll_corr,ll_rut_aux
if dw_lista.rowcount()>0 and dw_lista.getrow()>0 then
	ll_corr	= dw_lista.getitemnumber(dw_lista.getrow(),'correlativo')
	if ll_corr>0 then
		SELECT	"MENSAJES"."RUT"  
		INTO 		:ll_rut_aux  
		FROM 		"MENSAJES"  
		WHERE 	"MENSAJES"."CORRELATIVO" = :ll_corr   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isvalid(w_crear_mensajes) then 
				open(w_crear_mensajes)
				if w_crear_mensajes.dw_mensajes.retrieve(ll_corr)>0 then
					w_crear_mensajes.dw_mensajes.setfocus()
					w_crear_mensajes.wf_muestra_porcentaje(1)			// vhfb
				end if
			else
				if w_crear_mensajes.dw_mensajes.retrieve(ll_corr)>0 then
					w_crear_mensajes.dw_mensajes.setfocus()
					w_crear_mensajes.wf_muestra_porcentaje(1)			// vhfb
					close(w_buscar_mensajes)
				end if
			end if
								
			// VHFB - inicio - para los casos antiguos que no presentan valor en campo aplica_a, por defecto se asiga N
			string ls_aplica 
			w_crear_mensajes.dw_mensajes.accepttext ()
			ls_aplica			= w_crear_mensajes.dw_mensajes.getitemstring(1,'mensajes_aplica_a')
			if isnull(ls_aplica) then
					w_crear_mensajes.dw_mensajes.setitem(1,'mensajes_aplica_a','N')
			end if 
			// VHFB - termino	
			
		else
			messagebox("Advertencia","No Registra Dato")
		end if
	end if
end if
end event

type dw_lista from datawindow within w_buscar_mensajes
integer x = 46
integer y = 216
integer width = 4050
integer height = 1536
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_mensajes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event doubleclicked;Long	ll_corr
if dw_lista.rowcount()>0 and dw_lista.getrow()>0 then
	ll_corr	= dw_lista.getitemnumber(dw_lista.getrow(),'correlativo')
	if ll_corr>0 then cb_aceptar.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_buscar_mensajes
integer x = 402
integer y = 1744
integer width = 1202
integer height = 188
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

