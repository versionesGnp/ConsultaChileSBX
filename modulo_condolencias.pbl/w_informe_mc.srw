forward
global type w_informe_mc from window
end type
type dw_lista_mc from datawindow within w_informe_mc
end type
type cb_imprimir from commandbutton within w_informe_mc
end type
type cb_limpiar from commandbutton within w_informe_mc
end type
type cb_exportar from commandbutton within w_informe_mc
end type
type cb_ordenar from commandbutton within w_informe_mc
end type
type cb_cerrar from commandbutton within w_informe_mc
end type
type cb_filtrar from commandbutton within w_informe_mc
end type
type pb_1 from picturebutton within w_informe_mc
end type
type p_2 from picture within w_informe_mc
end type
type em_hasta from editmask within w_informe_mc
end type
type st_2 from statictext within w_informe_mc
end type
type p_1 from picture within w_informe_mc
end type
type em_desde from editmask within w_informe_mc
end type
type st_1 from statictext within w_informe_mc
end type
type dw_informe_mc from datawindow within w_informe_mc
end type
end forward

global type w_informe_mc from window
integer width = 2638
integer height = 2236
boolean titlebar = true
string title = "Ingreso Prospectos por Maestro Ceremonias"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_lista_mc dw_lista_mc
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_cerrar cb_cerrar
cb_filtrar cb_filtrar
pb_1 pb_1
p_2 p_2
em_hasta em_hasta
st_2 st_2
p_1 p_1
em_desde em_desde
st_1 st_1
dw_informe_mc dw_informe_mc
end type
global w_informe_mc w_informe_mc

on w_informe_mc.create
this.dw_lista_mc=create dw_lista_mc
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_cerrar=create cb_cerrar
this.cb_filtrar=create cb_filtrar
this.pb_1=create pb_1
this.p_2=create p_2
this.em_hasta=create em_hasta
this.st_2=create st_2
this.p_1=create p_1
this.em_desde=create em_desde
this.st_1=create st_1
this.dw_informe_mc=create dw_informe_mc
this.Control[]={this.dw_lista_mc,&
this.cb_imprimir,&
this.cb_limpiar,&
this.cb_exportar,&
this.cb_ordenar,&
this.cb_cerrar,&
this.cb_filtrar,&
this.pb_1,&
this.p_2,&
this.em_hasta,&
this.st_2,&
this.p_1,&
this.em_desde,&
this.st_1,&
this.dw_informe_mc}
end on

on w_informe_mc.destroy
destroy(this.dw_lista_mc)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_cerrar)
destroy(this.cb_filtrar)
destroy(this.pb_1)
destroy(this.p_2)
destroy(this.em_hasta)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.em_desde)
destroy(this.st_1)
destroy(this.dw_informe_mc)
end on

event open;string		ls_nom_parque,ls_string
long		ll_cod_parque

gf_centrar(w_informe_mc)

dw_informe_mc.settransobject(sqlca)
dw_lista_mc.settransobject(sqlca)
dw_lista_mc.insertrow(0)

em_desde.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
em_hasta.text			= string(gdt_fec_sistema,'dd/mm/yyyy')

//ddlb_parque.reset()
//DECLARE x1 CURSOR FOR  
//SELECT 		"COD_PARQ"."CODIGO",   
//				"COD_PARQ"."NOMBRE"  
//FROM 		"COD_PARQ"  
//WHERE 		"COD_PARQ"."GRUPO" = 1   
//ORDER BY	"COD_PARQ"."CODIGO" ASC  
//USING		sqlca;
//Open x1;
//if sqlca.sqlcode=0 then
//	DO WHILE sqlca.sqlcode=0 
//		Fetch x1 into :ll_cod_parque, :ls_nom_parque;
//		if  not isnull(ll_cod_parque) and ll_cod_parque > 0 then
//			ls_string	= string(ll_cod_parque)+' - '+UPPER(ls_nom_parque)
//			ddlb_parque.additem(ls_string)
//		end if
//		Setnull(ll_cod_parque)
//	LOOP
//end if
//ls_string					= 'TODOS - TODOS'
//ddlb_parque.additem(ls_string)
//close x1;
end event

type dw_lista_mc from datawindow within w_informe_mc
integer x = 32
integer y = 60
integer width = 1015
integer height = 88
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_agentes_mc"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_informe_mc
integer x = 809
integer y = 1996
integer width = 256
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_informe_mc.rowcount()>0 then
	dw_informe_mc.object.datawindow.Print.Preview		= true
	dw_informe_mc.object.datawindow.zoom				= 80
	f_Print( dw_informe_mc )
	dw_informe_mc.object.datawindow.Print.Preview		= false
	dw_informe_mc.object.datawindow.zoom				= 100
end if
end event

type cb_limpiar from commandbutton within w_informe_mc
integer x = 1147
integer y = 1996
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_informe_mc.reset()
em_desde.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
em_hasta.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')

end event

type cb_exportar from commandbutton within w_informe_mc
integer x = 549
integer y = 1996
integer width = 256
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_informe_mc
if dw_informe_mc.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar from commandbutton within w_informe_mc
integer x = 288
integer y = 1996
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;if dw_informe_mc.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_informe_mc.SETSORT(NULO)
	dw_informe_mc.SORT()
end if
end event

type cb_cerrar from commandbutton within w_informe_mc
integer x = 2203
integer y = 2012
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_informe_mc)
end event

type cb_filtrar from commandbutton within w_informe_mc
integer x = 23
integer y = 1996
integer width = 256
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string ls_nulo
setnull(ls_nulo)
dw_informe_mc.setfilter(ls_nulo)
dw_informe_mc.filter()
end event

type pb_1 from picturebutton within w_informe_mc
integer x = 2309
integer y = 36
integer width = 146
integer height = 136
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;long		ll_parque,ll_pos
date		ld_fec_ini, ld_fec_fin
string		ls_usuario,ls_parque

ld_fec_ini	= date(em_desde.text)
ld_fec_fin	= date(em_hasta.text)

ls_usuario	= dw_lista_mc.getitemstring(1,'codigo')

//ll_pos			= Pos(trim(ddlb_parque.text), "-")
//ls_parque	= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
//if ls_parque = 'TODOS' then
//	dw_informe_mc.dataobject	= 'dw_listado_gestion_mc_todos'
//else
//	dw_informe_mc.dataobject	= 'dw_listado_gestion_mc'
//end if
//dw_informe_mc.settransobject(sqlca)
//ll_parque		= long(mid(ddlb_parque.text,1,(ll_pos - 1)))
//
if trim(em_desde.text)='00/00/0000' or isnull(em_desde.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_desde.setfocus()
else
	if trim(em_hasta.text)='00/00/0000' or isnull(em_hasta.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_hasta.setfocus()
	else
	//	if not isnull(ll_parque) and ll_parque <> 0 then
			if dw_informe_mc.retrieve(ls_usuario,ld_fec_ini,ld_fec_fin)=0 then
				messagebox("Advertencia","No Registran Datos")
			else
				dw_informe_mc.object.t_rango_fechas.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
				dw_informe_mc.setfocus()
			end if
	//	elseif ll_parque = 0 then
//			if dw_informe_mc.retrieve(ld_fec_ini,ld_fec_fin)=0 then
//				messagebox("Advertencia","No Registran Datos")
//			else
//				dw_informe_mc.object.t_rango_fechas.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
//				dw_informe_mc.setfocus()
//			end if
//		else
//			messagebox("Advertencia","Falta ingresar Parque")
//			ddlb_parque.setfocus()
//		end if	
	end if
end if
end event

type p_2 from picture within w_informe_mc
integer x = 2167
integer y = 60
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_hasta.text)='00/00/0000' or trim(em_hasta.text)='' or &
	isnull(trim(em_hasta.text)) then	
	
	em_hasta.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_hasta.text)=-1 then 
	em_hasta.text=string(today(),gs_formato_fecha)
	em_hasta.setfocus()
	return
end if	
if trim(em_hasta.text)<>'00/00/0000' and not isnull(trim(em_hasta.text)) and &
	trim(em_hasta.text)<>'' then
	ls_fecha = em_hasta.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_informe_mc.reset()
em_hasta.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_hasta.text = Message.StringParm
end event

type em_hasta from editmask within w_informe_mc
integer x = 1847
integer y = 60
integer width = 311
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
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

event modified;//dw_informe_mc.reset()
end event

type st_2 from statictext within w_informe_mc
integer x = 1673
integer y = 76
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
string text = "Hasta:"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within w_informe_mc
integer x = 1573
integer y = 60
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
dw_informe_mc.reset()
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type em_desde from editmask within w_informe_mc
integer x = 1253
integer y = 60
integer width = 311
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
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

event modified;//dw_informe_mc.reset()
end event

type st_1 from statictext within w_informe_mc
integer x = 1074
integer y = 76
integer width = 183
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde:"
boolean focusrectangle = false
end type

type dw_informe_mc from datawindow within w_informe_mc
integer x = 23
integer y = 204
integer width = 2560
integer height = 1764
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_gestion_mc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

