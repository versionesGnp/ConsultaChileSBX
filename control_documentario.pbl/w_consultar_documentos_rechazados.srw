forward
global type w_consultar_documentos_rechazados from window
end type
type pb_ok from picturebutton within w_consultar_documentos_rechazados
end type
type p_fin from picture within w_consultar_documentos_rechazados
end type
type em_fec_fin from editmask within w_consultar_documentos_rechazados
end type
type st_3 from statictext within w_consultar_documentos_rechazados
end type
type p_ini from picture within w_consultar_documentos_rechazados
end type
type em_fec_ini from editmask within w_consultar_documentos_rechazados
end type
type st_2 from statictext within w_consultar_documentos_rechazados
end type
type cb_grabar from commandbutton within w_consultar_documentos_rechazados
end type
type cb_1 from commandbutton within w_consultar_documentos_rechazados
end type
type cb_2 from commandbutton within w_consultar_documentos_rechazados
end type
type cb_3 from commandbutton within w_consultar_documentos_rechazados
end type
type cb_imprimir from commandbutton within w_consultar_documentos_rechazados
end type
type cb_cerrar from commandbutton within w_consultar_documentos_rechazados
end type
type dw_lista from datawindow within w_consultar_documentos_rechazados
end type
end forward

global type w_consultar_documentos_rechazados from window
integer width = 3429
integer height = 1928
boolean titlebar = true
string title = "Consultar Documentos Pendientes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_ok pb_ok
p_fin p_fin
em_fec_fin em_fec_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
cb_grabar cb_grabar
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_consultar_documentos_rechazados w_consultar_documentos_rechazados

on w_consultar_documentos_rechazados.create
this.pb_ok=create pb_ok
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_grabar=create cb_grabar
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.pb_ok,&
this.p_fin,&
this.em_fec_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.cb_grabar,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_consultar_documentos_rechazados.destroy
destroy(this.pb_ok)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_grabar)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_consultar_documentos_rechazados)
em_fec_ini.text			= string(today(),"dd/mm/yyyy")
em_fec_fin.text			= string(today(),"dd/mm/yyyy")

if gs_depto='V' or gs_depto='I' or gs_depto='E' then
	cb_grabar.visible		= true
	cb_1.enabled			= true
	cb_3.enabled			= true
	cb_2.enabled			= true
	cb_imprimir.enabled	= true
else
	cb_grabar.visible		= false
	cb_1.enabled			= false
	cb_3.enabled			= false
	cb_2.enabled			= false
	cb_imprimir.enabled	= false
end if
dw_lista.settransobject(sqlca)

end event

type pb_ok from picturebutton within w_consultar_documentos_rechazados
integer x = 1742
integer y = 28
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date	ld_fec_ini,ld_fec_fin
ld_fec_ini						= date(em_fec_ini.text)
ld_fec_fin						= date(em_fec_fin.text)
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
			if gs_depto='B' then
				dw_lista.dataobject		= 'dw_lista_documentos_rechazados_jefe'
				dw_lista.settransobject(sqlca)
				if dw_lista.retrieve(gs_depto,ld_fec_ini,ld_fec_fin,gs_user)=0 then messagebox("Advertencia","No Registra Dato")
			elseif gs_depto='R' then
				dw_lista.dataobject		= 'dw_lista_documentos_rechazados_depto'
				dw_lista.settransobject(sqlca)
				if dw_lista.retrieve(gs_depto,ld_fec_ini,ld_fec_fin,gs_user)=0 then messagebox("Advertencia","No Registra Dato")
			else
				dw_lista.dataobject		= 'dw_lista_documentos_rechazados'
				dw_lista.settransobject(sqlca)
				if dw_lista.retrieve(gs_depto,ld_fec_ini,ld_fec_fin)=0 then messagebox("Advertencia","No Registra Dato")
			end if
		end if
	end if
end if
end event

type p_fin from picture within w_consultar_documentos_rechazados
integer x = 1595
integer y = 56
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
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

type em_fec_fin from editmask within w_consultar_documentos_rechazados
integer x = 1234
integer y = 56
integer width = 357
integer height = 88
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

type st_3 from statictext within w_consultar_documentos_rechazados
integer x = 1042
integer y = 72
integer width = 160
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
alignment alignment = right!
boolean focusrectangle = false
end type

type p_ini from picture within w_consultar_documentos_rechazados
integer x = 928
integer y = 56
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
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

type em_fec_ini from editmask within w_consultar_documentos_rechazados
integer x = 567
integer y = 56
integer width = 357
integer height = 88
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

type st_2 from statictext within w_consultar_documentos_rechazados
integer x = 46
integer y = 72
integer width = 498
integer height = 56
integer textsize = -8
integer weight = 700
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

type cb_grabar from commandbutton within w_consultar_documentos_rechazados
integer x = 46
integer y = 1672
integer width = 334
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if dw_lista.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if
end event

type cb_1 from commandbutton within w_consultar_documentos_rechazados
integer x = 1225
integer y = 1672
integer width = 219
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_consultar_documentos_rechazados
integer x = 1673
integer y = 1672
integer width = 219
integer height = 100
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

type cb_3 from commandbutton within w_consultar_documentos_rechazados
integer x = 1449
integer y = 1672
integer width = 219
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_imprimir from commandbutton within w_consultar_documentos_rechazados
integer x = 1897
integer y = 1672
integer width = 219
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )
end event

type cb_cerrar from commandbutton within w_consultar_documentos_rechazados
integer x = 3031
integer y = 1672
integer width = 334
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_consultar_documentos_rechazados)
end event

type dw_lista from datawindow within w_consultar_documentos_rechazados
integer x = 46
integer y = 204
integer width = 3319
integer height = 1424
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_documentos_rechazados_jefe"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	ls_columna,ls_estado
Long		ll_row
date		ld_fecha

setnull(ld_fecha)
ls_columna	= dwo.name
ll_row		= this.getrow()
if ls_columna='estado_entrega' then
	ls_estado	= trim(data)
	if ls_estado='R' then
		if isnull(this.getitemdatetime(ll_row,'fecha_recepcion_documento')) then
			dw_lista.setitem(ll_row,'fecha_recepcion_documento',date(gdt_fec_sistema))
			dw_lista.accepttext()
		end if
	else
		dw_lista.setitem(ll_row,'fecha_recepcion_documento',ld_fecha)
		dw_lista.accepttext()
	end if
end if
end event

event clicked;string	ls_columna,ls_filtro

ls_columna				= dwo.name
if row=0 then
	CHOOSE CASE ls_columna
		CASE 't_pendiente'
			ls_filtro	= 'estado_entrega<>"R"'
		CASE 't_recepcionado'
			ls_filtro	= 'estado_entrega="R"'
		CASE 't_blanco'
			ls_filtro	= 'color="BLANCO"'
		CASE 't_rojo'
			ls_filtro	= 'color="ROJO"'
		CASE 't_amarillo'
			ls_filtro	= 'color="AMARILLO"'
		CASE 't_todo'
			ls_filtro	= ''
	END CHOOSE
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	dw_lista.SORT()
	if dw_lista.rowcount()=0 then messagebox("Advertencia","No Registra Dato")
else
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	this.scrolltorow(row)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	this.scrolltorow(this.getrow())
end if
end event

