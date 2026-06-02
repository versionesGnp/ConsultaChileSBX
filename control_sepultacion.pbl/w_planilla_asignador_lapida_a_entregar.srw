forward
global type w_planilla_asignador_lapida_a_entregar from window
end type
type cb_print from commandbutton within w_planilla_asignador_lapida_a_entregar
end type
type cb_cerrar from commandbutton within w_planilla_asignador_lapida_a_entregar
end type
type dw_lista from datawindow within w_planilla_asignador_lapida_a_entregar
end type
type dw_parque from datawindow within w_planilla_asignador_lapida_a_entregar
end type
type st_16 from statictext within w_planilla_asignador_lapida_a_entregar
end type
type pb_ok from picturebutton within w_planilla_asignador_lapida_a_entregar
end type
type em_fec_fin from editmask within w_planilla_asignador_lapida_a_entregar
end type
type st_2 from statictext within w_planilla_asignador_lapida_a_entregar
end type
type em_fec_ini from editmask within w_planilla_asignador_lapida_a_entregar
end type
type p_ini from picture within w_planilla_asignador_lapida_a_entregar
end type
type st_3 from statictext within w_planilla_asignador_lapida_a_entregar
end type
type p_fin from picture within w_planilla_asignador_lapida_a_entregar
end type
end forward

global type w_planilla_asignador_lapida_a_entregar from window
integer width = 3781
integer height = 2040
boolean titlebar = true
string title = "Grabación Lápidas por Proveedores (Vencimiento en 15 días hábiles)"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_print cb_print
cb_cerrar cb_cerrar
dw_lista dw_lista
dw_parque dw_parque
st_16 st_16
pb_ok pb_ok
em_fec_fin em_fec_fin
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
st_3 st_3
p_fin p_fin
end type
global w_planilla_asignador_lapida_a_entregar w_planilla_asignador_lapida_a_entregar

on w_planilla_asignador_lapida_a_entregar.create
this.cb_print=create cb_print
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.dw_parque=create dw_parque
this.st_16=create st_16
this.pb_ok=create pb_ok
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.st_3=create st_3
this.p_fin=create p_fin
this.Control[]={this.cb_print,&
this.cb_cerrar,&
this.dw_lista,&
this.dw_parque,&
this.st_16,&
this.pb_ok,&
this.em_fec_fin,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.st_3,&
this.p_fin}
end on

on w_planilla_asignador_lapida_a_entregar.destroy
destroy(this.cb_print)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.pb_ok)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.st_3)
destroy(this.p_fin)
end on

event open;Long	ll_parque

gf_centrar(w_planilla_asignador_lapida_a_entregar)
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
em_fec_ini.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque		= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_parque		= 11
end if
dw_parque.setitem(1,'cod_parque',ll_parque)
dw_lista.object.datawindow.zoom				= 78
em_fec_ini.setfocus()
end event

type cb_print from commandbutton within w_planilla_asignador_lapida_a_entregar
integer x = 46
integer y = 1796
integer width = 361
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	dw_lista.object.t_nro5.visible				= false
	dw_lista.object.t_falta5.visible				= false
	dw_lista.object.t_nro4.visible				= false
	dw_lista.object.t_falta4.visible				= false
	dw_lista.object.t_nro3.visible				= false
	dw_lista.object.t_falta3.visible				= false
	dw_lista.object.t_nro2.visible				= false
	dw_lista.object.t_falta2.visible				= false
	dw_lista.object.t_nro1.visible				= false
	dw_lista.object.t_falta1.visible				= false
	dw_lista.object.t_nro_venc.visible			= false
	dw_lista.object.t_falta_venc.visible		= false
	dw_lista.object.t_mostrar_todo.visible		= false
	dw_lista.object.datawindow.zoom				= 100
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview	= false
	dw_lista.object.datawindow.zoom				= 78
	dw_lista.object.t_nro5.visible				= true
	dw_lista.object.t_falta5.visible				= true
	dw_lista.object.t_nro4.visible				= true
	dw_lista.object.t_falta4.visible				= true
	dw_lista.object.t_nro3.visible				= true
	dw_lista.object.t_falta3.visible				= true
	dw_lista.object.t_nro2.visible				= true
	dw_lista.object.t_falta2.visible				= true
	dw_lista.object.t_nro1.visible				= true
	dw_lista.object.t_falta1.visible				= true
	dw_lista.object.t_nro_venc.visible			= true
	dw_lista.object.t_falta_venc.visible		= true
	dw_lista.object.t_mostrar_todo.visible		= true
end if
end event

type cb_cerrar from commandbutton within w_planilla_asignador_lapida_a_entregar
integer x = 3351
integer y = 1796
integer width = 361
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_planilla_asignador_lapida_a_entregar)
end event

type dw_lista from datawindow within w_planilla_asignador_lapida_a_entregar
integer x = 46
integer y = 176
integer width = 3666
integer height = 1576
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_grabacion_lapida_por_proveedor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_filtro
ls_columna	= dwo.name
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
else
	if ls_columna='t_nro5' or ls_columna='t_falta5' then
		ls_filtro	= 'date(c_hoy) = date(c_fecha_5)'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_nro4' or ls_columna='t_falta4' then
		ls_filtro	= 'date(c_hoy) = date(c_fecha_4)'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_nro3' or ls_columna='t_falta3' then
		ls_filtro	= 'date(c_hoy) = date(c_fecha_3)'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_nro2' or ls_columna='t_falta2' then
		ls_filtro	= 'date(c_hoy) = date(c_fecha_2)'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_nro1' or ls_columna='t_falta1' then
		ls_filtro	= 'date(c_hoy) = date(c_fecha_1)'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_nro_venc' or ls_columna='t_falta_venc' then
		ls_filtro	= 'date(c_hoy)  >= date( c_fecha_15h)'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_mostrar_todo' then
		ls_filtro	= ''
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	end if
	dw_lista.sort()
	if dw_lista.rowcount()=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type dw_parque from datawindow within w_planilla_asignador_lapida_a_entregar
integer x = 2021
integer y = 40
integer width = 594
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.accepttext()
dw_lista.reset()
end event

type st_16 from statictext within w_planilla_asignador_lapida_a_entregar
integer x = 1787
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

type pb_ok from picturebutton within w_planilla_asignador_lapida_a_entregar
integer x = 2656
integer y = 20
integer width = 151
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;Datetime	ld_fec_ini,ld_fec_fin,ldt_fecha_def
Long		ll_cod_parque,ll_tot_reg,ll_indi,ll_max_llave
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
Date		ldt_fecha_hoy
String	ls_sector,ls_sepultura,ls_nom,ls_ap_pat,ls_ap_mat,ls_nom_ult,ls_ap_pat_ult,ls_ap_mat_ult,&
			ls_nom_comp_ult

ldt_fecha_hoy	= date(gdt_fec_sistema)
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
			ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
			if ll_cod_parque>0 then
				ll_tot_reg	= dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_cod_parque,gs_user,ldt_fecha_hoy)
				if ll_tot_reg = 0 then
					messagebox("Advertencia","No Registra Dato")
				else
					SetPointer(HourGlass!)
					for ll_indi = 1 to ll_tot_reg
						ls_sector		= dw_lista.getitemstring(ll_indi,'ficha_grabacion_lapida_sector')
						ls_sepultura	= dw_lista.getitemstring(ll_indi,'ficha_grabacion_lapida_sepultura')
						ldt_fecha_def	= dw_lista.getitemdatetime(ll_indi,'ficha_grabacion_lapida_fecha_defuncion_l')
						ls_nom			= dw_lista.getitemstring(ll_indi,'ficha_grabacion_lapida_nombre_fallecido')
						ls_ap_pat		= dw_lista.getitemstring(ll_indi,'ficha_grabacion_lapida_apellido_paterno_')
						ls_ap_mat		= dw_lista.getitemstring(ll_indi,'ficha_grabacion_lapida_apellido_materno_')
						SELECT	MAX("FALLECIDOS"."LLAVE")  
						INTO 		:ll_max_llave  
						FROM 		"FALLECIDOS"  
						WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND  
								 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
								 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque ) AND  
								 ( "FALLECIDOS"."NOMBRES" <> :ls_nom ) AND  
								 ( "FALLECIDOS"."AP_PATERNO" <> :ls_ap_pat ) AND  
								 ( "FALLECIDOS"."AP_MATERNO" <> :ls_ap_mat )    AND
					 			 ( "FALLECIDOS"."ESTADO_REG" = 'A' )
						USING		sqlca;
						if ll_max_llave>0 then
							SELECT	"FALLECIDOS"."NOMBRES",	"FALLECIDOS"."AP_PATERNO",	"FALLECIDOS"."AP_MATERNO"  
							INTO 		:ls_nom_ult,				:ls_ap_pat_ult,				:ls_ap_mat_ult  
							FROM 	"FALLECIDOS"  
							WHERE 	"FALLECIDOS"."LLAVE" = :ll_max_llave   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								ls_nom_comp_ult	= ls_nom_ult+' '+ls_ap_pat_ult+' '+ls_ap_mat_ult
								dw_lista.setitem(ll_indi,'ultimo_fall',ls_nom_comp_ult)
							end if
						end if
					next
					SetPointer(Arrow!)
					dw_lista.object.datawindow.zoom				= 78
				end if
			else
				messagebox("Advertencia","Debe Seleccionar Parque")
				dw_parque.setfocus()
			end if
		end if
	end if
end if
end event

type em_fec_fin from editmask within w_planilla_asignador_lapida_a_entregar
integer x = 1271
integer y = 40
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

type st_2 from statictext within w_planilla_asignador_lapida_a_entregar
integer x = 32
integer y = 48
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

type em_fec_ini from editmask within w_planilla_asignador_lapida_a_entregar
integer x = 608
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

type p_ini from picture within w_planilla_asignador_lapida_a_entregar
integer x = 969
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
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type st_3 from statictext within w_planilla_asignador_lapida_a_entregar
integer x = 1079
integer y = 48
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

type p_fin from picture within w_planilla_asignador_lapida_a_entregar
integer x = 1632
integer y = 40
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

