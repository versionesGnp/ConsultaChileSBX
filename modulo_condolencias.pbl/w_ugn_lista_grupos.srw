forward
global type w_ugn_lista_grupos from window
end type
type cb_actualizar from commandbutton within w_ugn_lista_grupos
end type
type cb_eliminar from commandbutton within w_ugn_lista_grupos
end type
type cb_ordenar from commandbutton within w_ugn_lista_grupos
end type
type cb_filtrar from commandbutton within w_ugn_lista_grupos
end type
type cb_exportar from commandbutton within w_ugn_lista_grupos
end type
type cb_imprimir from commandbutton within w_ugn_lista_grupos
end type
type cb_limpiar from commandbutton within w_ugn_lista_grupos
end type
type p_2 from picture within w_ugn_lista_grupos
end type
type fec_fin_ugn from editmask within w_ugn_lista_grupos
end type
type st_2 from statictext within w_ugn_lista_grupos
end type
type p_1 from picture within w_ugn_lista_grupos
end type
type fec_ini_ugn from editmask within w_ugn_lista_grupos
end type
type st_1 from statictext within w_ugn_lista_grupos
end type
type pb_aceptar from picturebutton within w_ugn_lista_grupos
end type
type cb_cerrar from commandbutton within w_ugn_lista_grupos
end type
type st_parque from statictext within w_ugn_lista_grupos
end type
type dw_parque from datawindow within w_ugn_lista_grupos
end type
type dw_lista from datawindow within w_ugn_lista_grupos
end type
type gb_1 from groupbox within w_ugn_lista_grupos
end type
type gb_2 from groupbox within w_ugn_lista_grupos
end type
end forward

global type w_ugn_lista_grupos from window
integer width = 3529
integer height = 2180
boolean titlebar = true
string title = "Listado Grupos Prospectos UGN"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_actualizar cb_actualizar
cb_eliminar cb_eliminar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
p_2 p_2
fec_fin_ugn fec_fin_ugn
st_2 st_2
p_1 p_1
fec_ini_ugn fec_ini_ugn
st_1 st_1
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
st_parque st_parque
dw_parque dw_parque
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
end type
global w_ugn_lista_grupos w_ugn_lista_grupos

type variables
long il_row
end variables

on w_ugn_lista_grupos.create
this.cb_actualizar=create cb_actualizar
this.cb_eliminar=create cb_eliminar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.p_2=create p_2
this.fec_fin_ugn=create fec_fin_ugn
this.st_2=create st_2
this.p_1=create p_1
this.fec_ini_ugn=create fec_ini_ugn
this.st_1=create st_1
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.st_parque=create st_parque
this.dw_parque=create dw_parque
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_actualizar,&
this.cb_eliminar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_limpiar,&
this.p_2,&
this.fec_fin_ugn,&
this.st_2,&
this.p_1,&
this.fec_ini_ugn,&
this.st_1,&
this.pb_aceptar,&
this.cb_cerrar,&
this.st_parque,&
this.dw_parque,&
this.dw_lista,&
this.gb_1,&
this.gb_2}
end on

on w_ugn_lista_grupos.destroy
destroy(this.cb_actualizar)
destroy(this.cb_eliminar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.p_2)
destroy(this.fec_fin_ugn)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.fec_ini_ugn)
destroy(this.st_1)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.st_parque)
destroy(this.dw_parque)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;gf_centrar(w_ugn_lista_grupos)

dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)

fec_ini_ugn.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
fec_fin_ugn.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
end event

type cb_actualizar from commandbutton within w_ugn_lista_grupos
integer x = 1559
integer y = 1924
integer width = 270
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar"
end type

event clicked;Long		ll_grupo,ll_res
if dw_lista.rowcount() > 0 and il_row > 0 then
	ll_grupo	= dw_lista.getitemnumber(il_row,'grupo')
	if ll_grupo > 0 then
		ll_res	= messagebox("Eliminar","Está Seguro Actualizar Grupo N° "+string(ll_grupo,'###,###,###,###,##0'),Exclamation!,YesNo!,2)
		if ll_res=1 then OpenWithParm(w_actualizar_sup_agentes, string(ll_grupo))
		
	else
		messagebox("Advertencia","Debe Seleccionar Grupo a Actualizar")
	end if
end if
end event

type cb_eliminar from commandbutton within w_ugn_lista_grupos
integer x = 1906
integer y = 1924
integer width = 256
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar"
end type

event clicked;Long		ll_grupo,ll_res
if dw_lista.rowcount() > 0 and il_row > 0 then
	ll_grupo	= dw_lista.getitemnumber(il_row,'grupo')
	if ll_grupo > 0 then
		ll_res	= messagebox("Eliminar","Está Seguro Eliminar Grupo N° "+string(ll_grupo,'###,###,###,###,##0'),Exclamation!,YesNo!,2)
		if ll_res=1 then OpenWithParm(w_borrar_grupo_condolencia, string(ll_grupo))
		
	else
		messagebox("Advertencia","Debe Seleccionar Grupo a Eliminar")
	end if
end if
end event

type cb_ordenar from commandbutton within w_ugn_lista_grupos
event ue_mousemove pbm_dwnmousemove
integer x = 50
integer y = 1924
integer width = 247
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

type cb_filtrar from commandbutton within w_ugn_lista_grupos
event ue_mousemove pbm_mousemove
integer x = 302
integer y = 1924
integer width = 247
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_nulo

setnull(ls_nulo)
dw_lista.setfilter(ls_nulo)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_ugn_lista_grupos
event ue_mousemove pbm_mousemove
integer x = 553
integer y = 1924
integer width = 247
integer height = 92
integer taborder = 80
boolean bringtotop = true
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

type cb_imprimir from commandbutton within w_ugn_lista_grupos
event ue_mousemove pbm_mousemove
integer x = 800
integer y = 1924
integer width = 256
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom				= 85
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview	= false
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type cb_limpiar from commandbutton within w_ugn_lista_grupos
integer x = 1166
integer y = 1924
integer width = 256
integer height = 92
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
dw_parque.reset()
dw_parque.insertrow(0)
fec_ini_ugn.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
fec_fin_ugn.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')

end event

type p_2 from picture within w_ugn_lista_grupos
integer x = 1051
integer y = 48
integer width = 78
integer height = 80
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(fec_fin_ugn.text)=-1 then 
 fec_fin_ugn.text=string(today(),gs_formato_fecha)
 fec_fin_ugn.setfocus()
 return
end if 
if fec_fin_ugn.text<>'00/00/0000' then
 ls_fecha = fec_fin_ugn.text
else
 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
 IF DATE(Message.StringParm)>DATE(fec_fin_ugn.TEXT) THEN
  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
  fec_fin_ugn.setfocus()
  return
 else 
  fec_fin_ugn.text = Message.StringParm
 end if 
END IF
end event

type fec_fin_ugn from editmask within w_ugn_lista_grupos
integer x = 754
integer y = 48
integer width = 297
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type st_2 from statictext within w_ugn_lista_grupos
integer x = 645
integer y = 56
integer width = 105
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin:"
boolean focusrectangle = false
end type

type p_1 from picture within w_ugn_lista_grupos
integer x = 530
integer y = 48
integer width = 78
integer height = 80
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(fec_ini_ugn.text)=-1 then 
 fec_ini_ugn.text=string(today(),gs_formato_fecha)
 fec_ini_ugn.setfocus()
 return
end if 
if fec_ini_ugn.text<>'00/00/0000' then
 ls_fecha = fec_ini_ugn.text
else
 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
 IF DATE(Message.StringParm)>DATE(fec_ini_ugn.TEXT) THEN
  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
  fec_ini_ugn.setfocus()
  return
 else 
  fec_ini_ugn.text = Message.StringParm
 end if 
END IF
end event

type fec_ini_ugn from editmask within w_ugn_lista_grupos
integer x = 224
integer y = 52
integer width = 302
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type st_1 from statictext within w_ugn_lista_grupos
integer x = 59
integer y = 56
integer width = 160
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio:"
boolean focusrectangle = false
end type

type pb_aceptar from picturebutton within w_ugn_lista_grupos
integer x = 2267
integer y = 12
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;long		ll_parque
date		ld_fec_ini, ld_fec_fin
string	ls_usuario,ls_jefe_v

ld_fec_ini	= date(fec_ini_ugn.text)
ld_fec_fin	= date(fec_fin_ugn.text)
ll_parque	= dw_parque.getitemnumber(1,'parque')

SELECT "JEFE_VENTAS"."JEFE_VENTAS"  
INTO 	 :ls_jefe_v  
FROM 	 "JEFE_VENTAS"  
WHERE  "JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING  sqlca;
if not isnull(ls_jefe_v) and ls_jefe_v <> '' and ls_jefe_v <> 'JU2' then
	dw_lista.dataobject					= 'dw_listado_grupos_jefe_ventas'
	dw_lista.settransobject(SQLCA)
	if trim(fec_ini_ugn.text)='00/00/0000' or isnull(fec_ini_ugn.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		fec_ini_ugn.setfocus()
	else
		if trim(fec_fin_ugn.text)='00/00/0000' or isnull(fec_fin_ugn.text) then
			messagebox("Advertencia","Fecha Término Inválida")
			fec_fin_ugn.setfocus()
		else
			if not isnull(ll_parque) or ll_parque <> 0 then
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_parque,ls_jefe_v)=0 then
					messagebox("Advertencia","No Registran Datos")
				else
					dw_lista.object.t_rango_fechas.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
					dw_lista.setfocus()
				end if
			else
				messagebox("Advertencia","Falta ingresar Parque")
				dw_parque.setfocus()
			end if	
		end if
	end if
end if

SELECT "SUPERVISOR"."COD_SUP"  
INTO 	 :ls_usuario  
FROM 	 "SUPERVISOR"  
WHERE  "SUPERVISOR"."COD_SUP" = :gs_user  
USING	 sqlca;
if not isnull(ls_usuario) and ls_usuario <> '' then
	dw_lista.dataobject					= 'dw_listado_grupos_supervisor'
	dw_lista.settransobject(SQLCA)
	if trim(fec_ini_ugn.text)='00/00/0000' or isnull(fec_ini_ugn.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		fec_ini_ugn.setfocus()
	else
		if trim(fec_fin_ugn.text)='00/00/0000' or isnull(fec_fin_ugn.text) then
			messagebox("Advertencia","Fecha Término Inválida")
			fec_fin_ugn.setfocus()
		else
			if not isnull(ll_parque) or ll_parque <> 0 then
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_parque,ls_usuario)=0 then
					messagebox("Advertencia","No Registran Datos")
				else
					dw_lista.object.t_rango_fechas.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
					dw_lista.setfocus()
				end if
			else
				messagebox("Advertencia","Falta ingresar Parque")
				dw_parque.setfocus()
			end if	
		end if
	end if
elseif (isnull(ls_usuario) or ls_usuario ='') and (isnull(ls_jefe_v) or ls_jefe_v ='' or ls_jefe_v = 'JU2') then
	dw_lista.dataobject					= 'dw_listado_grupos'
	dw_lista.settransobject(SQLCA)
	if trim(fec_ini_ugn.text)='00/00/0000' or isnull(fec_ini_ugn.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		fec_ini_ugn.setfocus()
	else
		if trim(fec_fin_ugn.text)='00/00/0000' or isnull(fec_fin_ugn.text) then
			messagebox("Advertencia","Fecha Término Inválida")
			fec_fin_ugn.setfocus()
		else
			if not isnull(ll_parque) or ll_parque <> 0 then
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_parque)=0 then
					messagebox("Advertencia","No Registran Datos")
				else
					dw_lista.object.t_rango_fechas.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
					dw_lista.setfocus()
				end if
			else
				messagebox("Advertencia","Falta ingresar Parque")
				dw_parque.setfocus()
			end if	
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_ugn_lista_grupos
integer x = 3177
integer y = 1916
integer width = 302
integer height = 104
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ugn_lista_grupos)
end event

type st_parque from statictext within w_ugn_lista_grupos
integer x = 1202
integer y = 52
integer width = 201
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_ugn_lista_grupos
integer x = 1408
integer y = 36
integer width = 805
integer height = 100
integer taborder = 30
string title = "none"
string dataobject = "dwe_parque_condolencias"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_lista from datawindow within w_ugn_lista_grupos
integer x = 27
integer y = 196
integer width = 3451
integer height = 1668
integer taborder = 50
string title = "none"
string dataobject = "dw_listado_grupos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long		ll_grupo,ll_row
String	ls_tipo,ls_string

if row>0 then
	il_row			= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	ll_grupo			= this.getitemnumber(il_row,'grupo')
	ls_tipo			= this.getitemstring(il_row,'c_gestion')
	if ll_grupo > 0 then
		ls_string	= string(ll_grupo)+'~t'+ls_tipo
		if isvalid(w_ugn_lista_grupos_detalle) then close(w_ugn_lista_grupos_detalle)
		openwithparm(w_ugn_lista_grupos_detalle,ls_string)
	else
		dw_lista.reset()
	end if
end if
end event

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_1 from groupbox within w_ugn_lista_grupos
event ue_mousemove pbm_mousemove
integer x = 27
integer y = 1872
integer width = 1417
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_ugn_lista_grupos
integer x = 1541
integer y = 1872
integer width = 640
integer height = 168
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

