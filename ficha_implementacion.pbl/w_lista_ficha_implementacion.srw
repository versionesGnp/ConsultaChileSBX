forward
global type w_lista_ficha_implementacion from window
end type
type cb_print_detalle from commandbutton within w_lista_ficha_implementacion
end type
type st_todo from statictext within w_lista_ficha_implementacion
end type
type st_inactivo from statictext within w_lista_ficha_implementacion
end type
type st_inactivo_txt from statictext within w_lista_ficha_implementacion
end type
type st_gestionado_txt from statictext within w_lista_ficha_implementacion
end type
type st_gestionado from statictext within w_lista_ficha_implementacion
end type
type st_pendiente from statictext within w_lista_ficha_implementacion
end type
type st_pendiente_txt from statictext within w_lista_ficha_implementacion
end type
type st_inicial_txt from statictext within w_lista_ficha_implementacion
end type
type st_inicial from statictext within w_lista_ficha_implementacion
end type
type cb_1 from commandbutton within w_lista_ficha_implementacion
end type
type cb_2 from commandbutton within w_lista_ficha_implementacion
end type
type cb_3 from commandbutton within w_lista_ficha_implementacion
end type
type cb_imprimir from commandbutton within w_lista_ficha_implementacion
end type
type pb_ok from picturebutton within w_lista_ficha_implementacion
end type
type p_fin from picture within w_lista_ficha_implementacion
end type
type st_3 from statictext within w_lista_ficha_implementacion
end type
type p_ini from picture within w_lista_ficha_implementacion
end type
type em_fec_ini from editmask within w_lista_ficha_implementacion
end type
type st_2 from statictext within w_lista_ficha_implementacion
end type
type em_fec_fin from editmask within w_lista_ficha_implementacion
end type
type cb_cerrar from commandbutton within w_lista_ficha_implementacion
end type
type cb_aceptar from commandbutton within w_lista_ficha_implementacion
end type
type dw_lista from datawindow within w_lista_ficha_implementacion
end type
type gb_2 from groupbox within w_lista_ficha_implementacion
end type
end forward

global type w_lista_ficha_implementacion from window
integer width = 4160
integer height = 1784
boolean titlebar = true
string title = "Buscar Ficha de Implementación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_print_detalle cb_print_detalle
st_todo st_todo
st_inactivo st_inactivo
st_inactivo_txt st_inactivo_txt
st_gestionado_txt st_gestionado_txt
st_gestionado st_gestionado
st_pendiente st_pendiente
st_pendiente_txt st_pendiente_txt
st_inicial_txt st_inicial_txt
st_inicial st_inicial
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
pb_ok pb_ok
p_fin p_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
em_fec_fin em_fec_fin
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_lista dw_lista
gb_2 gb_2
end type
global w_lista_ficha_implementacion w_lista_ficha_implementacion

type variables
Long		il_row
end variables

on w_lista_ficha_implementacion.create
this.cb_print_detalle=create cb_print_detalle
this.st_todo=create st_todo
this.st_inactivo=create st_inactivo
this.st_inactivo_txt=create st_inactivo_txt
this.st_gestionado_txt=create st_gestionado_txt
this.st_gestionado=create st_gestionado
this.st_pendiente=create st_pendiente
this.st_pendiente_txt=create st_pendiente_txt
this.st_inicial_txt=create st_inicial_txt
this.st_inicial=create st_inicial
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.pb_ok=create pb_ok
this.p_fin=create p_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.cb_print_detalle,&
this.st_todo,&
this.st_inactivo,&
this.st_inactivo_txt,&
this.st_gestionado_txt,&
this.st_gestionado,&
this.st_pendiente,&
this.st_pendiente_txt,&
this.st_inicial_txt,&
this.st_inicial,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.pb_ok,&
this.p_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.em_fec_fin,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_lista,&
this.gb_2}
end on

on w_lista_ficha_implementacion.destroy
destroy(this.cb_print_detalle)
destroy(this.st_todo)
destroy(this.st_inactivo)
destroy(this.st_inactivo_txt)
destroy(this.st_gestionado_txt)
destroy(this.st_gestionado)
destroy(this.st_pendiente)
destroy(this.st_pendiente_txt)
destroy(this.st_inicial_txt)
destroy(this.st_inicial)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.pb_ok)
destroy(this.p_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;Long		ll_parque

gf_centrar(w_lista_ficha_implementacion)
dw_lista.settransobject(sqlca)
em_fec_ini.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
end event

type cb_print_detalle from commandbutton within w_lista_ficha_implementacion
integer x = 3342
integer y = 1556
integer width = 384
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir Detalle"
end type

type st_todo from statictext within w_lista_ficha_implementacion
integer x = 1902
integer y = 1568
integer width = 370
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar Todo"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;string ls_string

ls_string		= ""
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type st_inactivo from statictext within w_lista_ficha_implementacion
integer x = 1577
integer y = 1568
integer width = 114
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
string text = "I"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;string ls_string

ls_string		= "estado_reg = 'I'"
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type st_inactivo_txt from statictext within w_lista_ficha_implementacion
integer x = 1701
integer y = 1576
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inactivo"
boolean focusrectangle = false
end type

event clicked;string ls_string

ls_string		= "estado_reg = 'I'"
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type st_gestionado_txt from statictext within w_lista_ficha_implementacion
integer x = 1280
integer y = 1576
integer width = 261
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gestionado"
boolean focusrectangle = false
end type

event clicked;string ls_string

ls_string		= "estado_reg = 'G'"
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type st_gestionado from statictext within w_lista_ficha_implementacion
integer x = 1157
integer y = 1568
integer width = 114
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16776960
string text = "G"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;string ls_string

ls_string		= "estado_reg = 'G'"
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type st_pendiente from statictext within w_lista_ficha_implementacion
integer x = 777
integer y = 1568
integer width = 114
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
string text = "P"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;string ls_string

ls_string		= "estado_reg = 'P'"
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type st_pendiente_txt from statictext within w_lista_ficha_implementacion
integer x = 901
integer y = 1576
integer width = 224
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pendiente"
boolean focusrectangle = false
end type

event clicked;string ls_string

ls_string		= "estado_reg = 'P'"
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type st_inicial_txt from statictext within w_lista_ficha_implementacion
integer x = 608
integer y = 1576
integer width = 165
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicial"
boolean focusrectangle = false
end type

event clicked;string ls_string

ls_string		= "estado_reg = '0'"
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type st_inicial from statictext within w_lista_ficha_implementacion
integer x = 485
integer y = 1568
integer width = 114
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65280
string text = "0"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event clicked;string ls_string

ls_string		= "estado_reg = '0'"
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type cb_1 from commandbutton within w_lista_ficha_implementacion
integer x = 2318
integer y = 1556
integer width = 251
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

type cb_2 from commandbutton within w_lista_ficha_implementacion
integer x = 2789
integer y = 1556
integer width = 229
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

type cb_3 from commandbutton within w_lista_ficha_implementacion
integer x = 2574
integer y = 1556
integer width = 210
integer height = 96
integer taborder = 70
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

type cb_imprimir from commandbutton within w_lista_ficha_implementacion
integer x = 3054
integer y = 1556
integer width = 251
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.zoom        = 84
	f_Print( dw_lista )
	dw_lista.object.datawindow.zoom        = 100
end if
end event

type pb_ok from picturebutton within w_lista_ficha_implementacion
integer x = 1861
integer y = 24
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
string disabledname = "ok_no.bmp"
end type

event clicked;Datetime	ld_fec_ini,ld_fec_fin
Long		ll_tot_reg,ll_indi
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
String		ls_usuario,ls_cod_asistente_2,ls_nom_asis_2

if gs_depto <> 'X' then
	ls_usuario	= '%'
else
	ls_usuario	= gs_user
end if
ld_fec_ini		= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin		= datetime(date(em_fec_fin.text),lt_fin)
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
			ll_tot_reg	= dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_usuario)
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Dato")
			else
				for ll_indi=1 to ll_tot_reg
					ls_cod_asistente_2	= dw_lista.getitemstring(ll_indi,'cod_asistente_2')
					if not isnull(ls_cod_asistente_2) then
						SELECT 	"FICHA_IMPLEMENTACION_ASISTENTE"."NOMBRE_ASISTENTE"  
						INTO 		:ls_nom_asis_2  
						FROM 	"FICHA_IMPLEMENTACION_ASISTENTE"  
						WHERE 	"FICHA_IMPLEMENTACION_ASISTENTE"."CODIGO_ASISTENTE" = :ls_cod_asistente_2   ;
						dw_lista.setitem(ll_indi,'nombre_asistente_2',ls_nom_asis_2)
					end if
				next
				dw_lista.accepttext()
			end if
		end if
	end if
end if
end event

type p_fin from picture within w_lista_ficha_implementacion
integer x = 1632
integer y = 48
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
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

type st_3 from statictext within w_lista_ficha_implementacion
integer x = 1079
integer y = 56
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

type p_ini from picture within w_lista_ficha_implementacion
integer x = 969
integer y = 48
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
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_lista_ficha_implementacion
integer x = 608
integer y = 48
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

type st_2 from statictext within w_lista_ficha_implementacion
integer x = 32
integer y = 56
integer width = 544
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_lista_ficha_implementacion
integer x = 1271
integer y = 48
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

event modified;dw_lista.reset()
end event

type cb_cerrar from commandbutton within w_lista_ficha_implementacion
integer x = 3808
integer y = 1548
integer width = 293
integer height = 112
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_lista_ficha_implementacion)
end event

type cb_aceptar from commandbutton within w_lista_ficha_implementacion
integer x = 41
integer y = 1548
integer width = 288
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Long		ll_folio,ll_permiso_usuario
STRING	sw_editar
dw_lista.accepttext()
if isvalid(w_mantenedor_ficha_implementacion) and il_row > 0 then
	ll_folio		= dw_lista.getitemnumber(il_row,'folio')
	if ll_folio > 0 then
		w_mantenedor_ficha_implementacion.wf_retrieve_dw(ll_folio)
//		w_mantenedor_ficha_implementacion.tab_1.tabpage_1.dw_antecedentes.retrieve()
//		w_mantenedor_ficha_implementacion.tab_1.tabpage_2.dw_inspeccion.retrieve()
//		w_mantenedor_ficha_implementacion.tab_1.tabpage_1.setfocus()
		close(w_lista_ficha_implementacion)
	end if
end if
end event

type dw_lista from datawindow within w_lista_ficha_implementacion
integer x = 41
integer y = 188
integer width = 4059
integer height = 1320
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_ficha_implementacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row		= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row > 0 then cb_aceptar.triggerevent(clicked!)
end event

type gb_2 from groupbox within w_lista_ficha_implementacion
integer x = 443
integer y = 1504
integer width = 1851
integer height = 172
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

