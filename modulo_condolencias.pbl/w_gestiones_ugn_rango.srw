forward
global type w_gestiones_ugn_rango from window
end type
type cb_1 from commandbutton within w_gestiones_ugn_rango
end type
type rb_resumen from radiobutton within w_gestiones_ugn_rango
end type
type rb_detalle from radiobutton within w_gestiones_ugn_rango
end type
type dw_ejecutivos from datawindow within w_gestiones_ugn_rango
end type
type p_fin from picture within w_gestiones_ugn_rango
end type
type st_3 from statictext within w_gestiones_ugn_rango
end type
type p_ini from picture within w_gestiones_ugn_rango
end type
type em_fec_ini from editmask within w_gestiones_ugn_rango
end type
type st_2 from statictext within w_gestiones_ugn_rango
end type
type em_fec_fin from editmask within w_gestiones_ugn_rango
end type
type pb_ok from picturebutton within w_gestiones_ugn_rango
end type
type cb_imprimir from commandbutton within w_gestiones_ugn_rango
end type
type cb_exportar from commandbutton within w_gestiones_ugn_rango
end type
type cb_filtrar from commandbutton within w_gestiones_ugn_rango
end type
type cb_cerrar from commandbutton within w_gestiones_ugn_rango
end type
type gb_1 from groupbox within w_gestiones_ugn_rango
end type
type dw_lista from datawindow within w_gestiones_ugn_rango
end type
type gb_2 from groupbox within w_gestiones_ugn_rango
end type
end forward

global type w_gestiones_ugn_rango from window
integer width = 3616
integer height = 2124
boolean titlebar = true
string title = "Gestiones Por Ejecutivo Nuevos Canales"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
rb_resumen rb_resumen
rb_detalle rb_detalle
dw_ejecutivos dw_ejecutivos
p_fin p_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
em_fec_fin em_fec_fin
pb_ok pb_ok
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
gb_1 gb_1
dw_lista dw_lista
gb_2 gb_2
end type
global w_gestiones_ugn_rango w_gestiones_ugn_rango

type variables
long	il_row
end variables

on w_gestiones_ugn_rango.create
this.cb_1=create cb_1
this.rb_resumen=create rb_resumen
this.rb_detalle=create rb_detalle
this.dw_ejecutivos=create dw_ejecutivos
this.p_fin=create p_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.pb_ok=create pb_ok
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.cb_1,&
this.rb_resumen,&
this.rb_detalle,&
this.dw_ejecutivos,&
this.p_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.em_fec_fin,&
this.pb_ok,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_cerrar,&
this.gb_1,&
this.dw_lista,&
this.gb_2}
end on

on w_gestiones_ugn_rango.destroy
destroy(this.cb_1)
destroy(this.rb_resumen)
destroy(this.rb_detalle)
destroy(this.dw_ejecutivos)
destroy(this.p_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.pb_ok)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;gf_centrar(w_gestiones_ugn_rango)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
em_fec_ini.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')
dw_ejecutivos.settransobject(sqlca)
dw_ejecutivos.insertrow(0)

end event

type cb_1 from commandbutton within w_gestiones_ugn_rango
integer x = 2039
integer y = 1892
integer width = 256
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;em_fec_ini.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')
dw_lista.reset()
dw_ejecutivos.reset()
dw_ejecutivos.insertrow(0)
end event

type rb_resumen from radiobutton within w_gestiones_ugn_rango
integer x = 2875
integer y = 52
integer width = 361
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resumen"
end type

event clicked;pb_ok.triggerEvent(Clicked!) 
end event

type rb_detalle from radiobutton within w_gestiones_ugn_rango
integer x = 2597
integer y = 52
integer width = 270
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle"
boolean checked = true
end type

event clicked;pb_ok.triggerEvent(Clicked!) 
end event

type dw_ejecutivos from datawindow within w_gestiones_ugn_rango
integer x = 1577
integer y = 48
integer width = 960
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dwe_ejecutivos_ugn"
boolean border = false
boolean livescroll = true
end type

type p_fin from picture within w_gestiones_ugn_rango
integer x = 1435
integer y = 52
integer width = 78
integer height = 80
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
		dw_lista.reset()
	end if	
END IF
end event

type st_3 from statictext within w_gestiones_ugn_rango
integer x = 896
integer y = 56
integer width = 169
integer height = 72
integer textsize = -9
integer weight = 700
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

type p_ini from picture within w_gestiones_ugn_rango
integer x = 800
integer y = 52
integer width = 78
integer height = 80
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
		dw_lista.reset()
	end if	
END IF
end event

type em_fec_ini from editmask within w_gestiones_ugn_rango
integer x = 453
integer y = 52
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -9
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

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_gestiones_ugn_rango
integer x = 32
integer y = 56
integer width = 407
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fechas:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_gestiones_ugn_rango
integer x = 1079
integer y = 56
integer width = 347
integer height = 76
integer taborder = 20
integer textsize = -9
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

type pb_ok from picturebutton within w_gestiones_ugn_rango
integer x = 3406
integer y = 20
integer width = 155
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

event clicked;string		ls_usuario_mc,ls_nombre_falle,ls_ap_falle,ls_ejecutivo,ls_nombre
long		ll_cant_reg,ll_new,ll_prom,ll_prom_tot,ll_cant_fono_p,ll_cant_cel,ll_cant_serv,&
			ll_pond_reg,ll_pond_ser,ll_count_serv,ll_cant_restar
double	ll_nota_serv,ll_nota_mc,ll_nota_prom,ll_pond_nota,ll_ptje_tot
date		ld_fec_ini,ld_fec_fin

dw_lista.reset()
ls_ejecutivo			= dw_ejecutivos.getitemstring(1,'codigo')
if rb_detalle.checked = true then
	dw_lista.dataobject = 'dw_gestion_ejecutivos_ugn'
elseif rb_resumen.checked = true then
	dw_lista.dataobject = 'dw_gestion_ejecutivos_ugn_res'
end if
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	elseif isnull(ls_ejecutivo)	or ls_ejecutivo = '' then
		messagebox("Advertencia","Falta Seleccionar Ejecutivo")
		dw_ejecutivos.setfocus()
	else
		ld_fec_ini														= date(em_fec_ini.text)
		ld_fec_fin														= date(em_fec_fin.text)
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			SELECT 	"ENCARGADOS"."NOMBRE"  
			INTO 		:ls_nombre  
			FROM 	"ENCARGADOS"  
			WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_ejecutivo
			USING	sqlca;

			dw_lista.retrieve(ls_ejecutivo,ld_fec_ini,ld_fec_fin)
			dw_lista.object.t_rango_fechas.text					='Desde '+string(ld_fec_ini,'dd/mm/yyyy')+' al '+string( ld_fec_fin,'dd/mm/yyyy')
			dw_lista.object.t_agente.text							= ls_ejecutivo +' - '+ ls_nombre
		end if
	end if
end if
end event

type cb_imprimir from commandbutton within w_gestiones_ugn_rango
integer x = 41
integer y = 1896
integer width = 334
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_gestiones_ugn_rango
integer x = 1445
integer y = 1896
integer width = 256
integer height = 92
integer taborder = 50
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

type cb_filtrar from commandbutton within w_gestiones_ugn_rango
integer x = 1705
integer y = 1896
integer width = 256
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

type cb_cerrar from commandbutton within w_gestiones_ugn_rango
integer x = 3218
integer y = 1896
integer width = 334
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_gestiones_ugn_rango)
end event

type gb_1 from groupbox within w_gestiones_ugn_rango
integer x = 1413
integer y = 1840
integer width = 905
integer height = 168
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_lista from datawindow within w_gestiones_ugn_rango
integer x = 37
integer y = 188
integer width = 3525
integer height = 1640
integer taborder = 40
string title = "none"
string dataobject = "dw_gestion_ejecutivos_ugn"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)	
end if


end event

type gb_2 from groupbox within w_gestiones_ugn_rango
integer x = 2569
integer y = 4
integer width = 677
integer height = 136
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

