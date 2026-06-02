forward
global type w_lista_soporte from window
end type
type em_fec_fin from editmask within w_lista_soporte
end type
type st_4 from statictext within w_lista_soporte
end type
type em_fec_ini from editmask within w_lista_soporte
end type
type p_ini from picture within w_lista_soporte
end type
type st_3 from statictext within w_lista_soporte
end type
type p_fin from picture within w_lista_soporte
end type
type pb_ok2 from picturebutton within w_lista_soporte
end type
type cb_imprimir from commandbutton within w_lista_soporte
end type
type cb_filtrar from commandbutton within w_lista_soporte
end type
type cb_ordenar from commandbutton within w_lista_soporte
end type
type cb_exportar from commandbutton within w_lista_soporte
end type
type st_2 from statictext within w_lista_soporte
end type
type em_nombre from editmask within w_lista_soporte
end type
type pb_1 from picturebutton within w_lista_soporte
end type
type dw_lista from datawindow within w_lista_soporte
end type
type cb_aceptar from commandbutton within w_lista_soporte
end type
type cb_cerrar from commandbutton within w_lista_soporte
end type
type gb_2 from groupbox within w_lista_soporte
end type
end forward

global type w_lista_soporte from window
integer width = 4896
integer height = 2180
boolean titlebar = true
string title = "Listado Soporte General"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
em_fec_fin em_fec_fin
st_4 st_4
em_fec_ini em_fec_ini
p_ini p_ini
st_3 st_3
p_fin p_fin
pb_ok2 pb_ok2
cb_imprimir cb_imprimir
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
st_2 st_2
em_nombre em_nombre
pb_1 pb_1
dw_lista dw_lista
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
gb_2 gb_2
end type
global w_lista_soporte w_lista_soporte

type variables
long il_row
end variables

on w_lista_soporte.create
this.em_fec_fin=create em_fec_fin
this.st_4=create st_4
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.st_3=create st_3
this.p_fin=create p_fin
this.pb_ok2=create pb_ok2
this.cb_imprimir=create cb_imprimir
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.st_2=create st_2
this.em_nombre=create em_nombre
this.pb_1=create pb_1
this.dw_lista=create dw_lista
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
this.gb_2=create gb_2
this.Control[]={this.em_fec_fin,&
this.st_4,&
this.em_fec_ini,&
this.p_ini,&
this.st_3,&
this.p_fin,&
this.pb_ok2,&
this.cb_imprimir,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_exportar,&
this.st_2,&
this.em_nombre,&
this.pb_1,&
this.dw_lista,&
this.cb_aceptar,&
this.cb_cerrar,&
this.gb_2}
end on

on w_lista_soporte.destroy
destroy(this.em_fec_fin)
destroy(this.st_4)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.st_3)
destroy(this.p_fin)
destroy(this.pb_ok2)
destroy(this.cb_imprimir)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.st_2)
destroy(this.em_nombre)
destroy(this.pb_1)
destroy(this.dw_lista)
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
destroy(this.gb_2)
end on

event open;long		ll_nivel
datetime	ld_fec_ini,ld_fec_fin
Time		lt_ini=time('00:00:00'),lt_fin=time('23:59:59')

gf_centrar(w_lista_soporte)
em_fec_ini.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text 	= string(gdt_fec_sistema,'dd/mm/yyyy')
ld_fec_ini			= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin			= datetime(date(em_fec_fin.text),lt_fin)
SELECT	"SOPORTE_NIVEL_USUARIO"."NIVEL"  
INTO 		:ll_nivel  
FROM 		"SOPORTE_NIVEL_USUARIO"  
WHERE  ( "SOPORTE_NIVEL_USUARIO"."USUARIO" = :gs_user ) AND  
		 ( "SOPORTE_NIVEL_USUARIO"."ESTADO_REG" = 'A' )   
USING		sqlca;
if ll_nivel = 1 then //Tecnicos
	dw_lista.dataobject = 'dw_lista_soporte_por_usuario'
	dw_lista.settransobject(sqlca)
	dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user,'S')
else // Tecnicos y supervisores
	dw_lista.dataobject = 'dw_lista_soporte'
	dw_lista.settransobject(sqlca)
	dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
end if
end event

event mousemove;//datetime	ld_fec_ini,ld_fec_fin
//Time		lt_ini=time('00:00:00'),lt_fin=time('23:59:59')
//
//ld_fec_ini						= datetime(date(em_fec_ini.text),lt_ini)
//ld_fec_fin						= datetime(date(em_fec_fin.text),lt_fin)
//if dw_lista.dataobject = 'dw_lista_soporte' then
//	dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
//elseif dw_lista.dataobject = 'dw_lista_soporte_por_usuario' then
//	dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user,'S')
//end if
end event

type em_fec_fin from editmask within w_lista_soporte
integer x = 1033
integer y = 52
integer width = 347
integer height = 80
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

type st_4 from statictext within w_lista_soporte
integer x = 55
integer y = 56
integer width = 352
integer height = 72
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

type em_fec_ini from editmask within w_lista_soporte
event ue_keypress pbm_keydown
integer x = 411
integer y = 52
integer width = 352
integer height = 80
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

type p_ini from picture within w_lista_soporte
integer x = 768
integer y = 52
integer width = 78
integer height = 80
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

type st_3 from statictext within w_lista_soporte
integer x = 846
integer y = 56
integer width = 169
integer height = 72
integer textsize = -9
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

type p_fin from picture within w_lista_soporte
integer x = 1390
integer y = 52
integer width = 78
integer height = 80
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

type pb_ok2 from picturebutton within w_lista_soporte
event ue_mousemove pbm_mousemove
integer x = 1595
integer y = 32
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
Time		lt_ini=time('00:00:00'),lt_fin=time('23:59:59')
string	ls_cod_agente,ls_superv,ls_agente,ls_estado_ot,ls_filtro

ld_fec_ini						= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin						= datetime(date(em_fec_fin.text),lt_fin)
ls_filtro						= ''
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
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
			if dw_lista.dataobject = 'dw_lista_soporte' then
				dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
			elseif dw_lista.dataobject = 'dw_lista_soporte_por_usuario' then
				dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user,'S')
			end if
			if dw_lista.rowcount() = 0 then
				messagebox("Advertencia","No Registra Dato")
			end if
		end if
	end if
end if
end event

type cb_imprimir from commandbutton within w_lista_soporte
integer x = 3525
integer y = 1900
integer width = 229
integer height = 84
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
	dw_lista.object.datawindow.Print.Preview	= true
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview	= False
end if
end event

type cb_filtrar from commandbutton within w_lista_soporte
integer x = 3314
integer y = 1900
integer width = 206
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_lista_soporte
integer x = 3067
integer y = 1900
integer width = 242
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_exportar from commandbutton within w_lista_soporte
integer x = 2821
integer y = 1900
integer width = 242
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_DWToExcel( dw_lista)
end if
end event

type st_2 from statictext within w_lista_soporte
integer x = 1061
integer y = 1916
integer width = 439
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar por Usuario"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_nombre from editmask within w_lista_soporte
integer x = 1522
integer y = 1896
integer width = 453
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type pb_1 from picturebutton within w_lista_soporte
integer x = 1989
integer y = 1888
integer width = 123
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar3.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_nombre
Long		ll_row,ll_largo
ls_nombre		= trim(em_nombre.text)

if not isnull(ls_nombre) and ls_nombre<>'' then
	ll_largo		= len(ls_nombre)
	ls_nombre	= "mid(usuario_contacto,1,"+string(ll_largo)+")="+"'"+ls_nombre+"'"
	ll_row 		= dw_lista.Find(ls_nombre, 1, dw_lista.RowCount() )
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
	ELSE
		MessageBox("Advertencia", "Información Inexistente")
	END IF
end if



end event

type dw_lista from datawindow within w_lista_soporte
integer x = 69
integer y = 184
integer width = 4727
integer height = 1576
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_soporte_por_usuario"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_filtro

ls_columna	= dwo.name
if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
else
	if ls_columna='t_celeste' or ls_columna='t_celeste_t' then
		ls_filtro	= 'estado_ot = "G"'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_rojo' or ls_columna='t_rojo_t' then
		ls_filtro	= 'estado_ot = "A"'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_amarillo' or ls_columna='t_amarillo_t' then
		ls_filtro	= 'estado_ot = "P"'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_blanco' or ls_columna='t_blanco_t' then
		ls_filtro	= 'estado_inicial = "S"'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	elseif ls_columna='t_todo' then
		ls_filtro	= ''
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
	end if
end if
end event

event doubleclicked;if row > 0 then 
	il_row	= row
	cb_aceptar.triggerevent(clicked!)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type cb_aceptar from commandbutton within w_lista_soporte
integer x = 69
integer y = 1892
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;long 		ll_correlativo,ll_codigo_atencion,ll_tot_reg,ll_indi,ll_tot_reg_mant,ll_cod,&
			ll_row
string 	ls_id_pc,ls_usuario_contacto,ls_depto,ls_observacion_ini,ls_estado_prioridad
datetime	ldt_fecha_ingreso,ldt_fecha_hoy

if il_row>0 then
	ll_correlativo			= dw_lista.GetitemNumber(il_row,'correlativo_ot')
	//ls_id_pc					= dw_lista.getitemstring(il_row,'id_pc')
	ldt_fecha_ingreso		= dw_lista.getitemdatetime(il_row,'fecha_ingreso')
	ls_usuario_contacto	= dw_lista.getitemstring(il_row,'usuario_contacto')
	ls_depto					= dw_lista.getitemstring(il_row,'depto')
	ll_codigo_atencion	= dw_lista.getitemnumber(il_row,'codigo_atencion')
	ls_observacion_ini	= dw_lista.getitemstring(il_row,'observacion_ini')
	ls_estado_prioridad	= dw_lista.getitemstring(il_row,'estado_prioridad')
	
	if isvalid(w_ingreso_soporte) then close(w_ingreso_soporte)
	open(w_ingreso_soporte)
	if w_ingreso_soporte.dw_ingreso_soporte.retrieve(ll_correlativo) > 0 then
		w_ingreso_soporte.dw_detalle_mantencion.retrieve(ll_correlativo)
		w_ingreso_soporte.dw_detalle_mantencion.setitem(1,'estado_cambio',0)
		ll_tot_reg				= w_ingreso_soporte.dw_soporte_mantencion.retrieve('H')
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				w_ingreso_soporte.dw_soporte_mantencion.setitem(ll_indi,'c_estado',1)
			next
			w_ingreso_soporte.dw_soporte_mantencion.accepttext()
			ll_tot_reg_mant	= w_ingreso_soporte.dw_detalle_mantencion.rowcount()
			if ll_tot_reg_mant > 0 then
				for ll_indi=1 to ll_tot_reg_mant
					ll_cod		= w_ingreso_soporte.dw_detalle_mantencion.getitemnumber(ll_indi,'codigo_des_mantencion')
					ll_row		= w_ingreso_soporte.dw_soporte_mantencion.Find("codigo = "+string(ll_cod), 1, w_ingreso_soporte.dw_soporte_mantencion.rowcount())
					if ll_row > 0 then
						w_ingreso_soporte.dw_soporte_mantencion.setitem(ll_row,'c_estado',0)
					end if
				next
			end if
		end if
		w_ingreso_soporte.dw_ingreso_soporte.object.correlativo_ot.protect		= 1
		//w_ingreso_soporte.dw_ingreso_soporte.object.id_pc.protect					= 0
		w_ingreso_soporte.dw_ingreso_soporte.object.fecha_ingreso.protect			= 1
		w_ingreso_soporte.dw_ingreso_soporte.object.usuario_contacto.protect		= 1
		//w_ingreso_soporte.dw_ingreso_soporte.object.depto.protect					= 1
		w_ingreso_soporte.dw_ingreso_soporte.object.codigo_atencion.protect		= 1
		w_ingreso_soporte.dw_ingreso_soporte.object.observacion_ini.protect		= 0
		w_ingreso_soporte.dw_ingreso_soporte.object.estado_prioridad.protect		= 1
		//w_ingreso_soporte.dw_ingreso_soporte.setitem(il_row,'usuario_soporte',gs_user)
		//w_ingreso_soporte.dw_ingreso_soporte.object.usuario_soporte.protect		= 1
		ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
		w_ingreso_soporte.dw_ingreso_soporte.setitem(w_ingreso_soporte.dw_ingreso_soporte.getrow(),'fecha_termino',ldt_fecha_hoy)
		w_ingreso_soporte.dw_ingreso_soporte.accepttext()
	end if
else 
	messagebox('Advertencia','Debe Seleccionar un Registro')
end if
end event

type cb_cerrar from commandbutton within w_lista_soporte
integer x = 4393
integer y = 1876
integer width = 402
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_soporte)
end event

type gb_2 from groupbox within w_lista_soporte
integer x = 2793
integer y = 1848
integer width = 987
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

