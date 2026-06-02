//objectcomments Pantalla Gerente
forward
global type w_jefe_ventras_graf from window
end type
type cb_5 from commandbutton within w_jefe_ventras_graf
end type
type cb_2 from commandbutton within w_jefe_ventras_graf
end type
type cb_buscar_rut from commandbutton within w_jefe_ventras_graf
end type
type p_4 from picture within w_jefe_ventras_graf
end type
type p_3 from picture within w_jefe_ventras_graf
end type
type cb_4 from commandbutton within w_jefe_ventras_graf
end type
type cb_3 from commandbutton within w_jefe_ventras_graf
end type
type dw_2 from datawindow within w_jefe_ventras_graf
end type
type cb_gventas from commandbutton within w_jefe_ventras_graf
end type
type cb_limpiar from commandbutton within w_jefe_ventras_graf
end type
type pb_consultar from picturebutton within w_jefe_ventras_graf
end type
type st_1 from statictext within w_jefe_ventras_graf
end type
type em_fec_ini from editmask within w_jefe_ventras_graf
end type
type em_fec_fin from editmask within w_jefe_ventras_graf
end type
type st_2 from statictext within w_jefe_ventras_graf
end type
type cb_anual from commandbutton within w_jefe_ventras_graf
end type
type cb_semestal from commandbutton within w_jefe_ventras_graf
end type
type cb_mensual from commandbutton within w_jefe_ventras_graf
end type
type cb_1 from commandbutton within w_jefe_ventras_graf
end type
type dw_1 from datawindow within w_jefe_ventras_graf
end type
type gb_1 from groupbox within w_jefe_ventras_graf
end type
type gb_3 from groupbox within w_jefe_ventras_graf
end type
type gb_2 from groupbox within w_jefe_ventras_graf
end type
end forward

global type w_jefe_ventras_graf from window
integer width = 4229
integer height = 1776
boolean titlebar = true
string title = "Comparativa Jefe de Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_5 cb_5
cb_2 cb_2
cb_buscar_rut cb_buscar_rut
p_4 p_4
p_3 p_3
cb_4 cb_4
cb_3 cb_3
dw_2 dw_2
cb_gventas cb_gventas
cb_limpiar cb_limpiar
pb_consultar pb_consultar
st_1 st_1
em_fec_ini em_fec_ini
em_fec_fin em_fec_fin
st_2 st_2
cb_anual cb_anual
cb_semestal cb_semestal
cb_mensual cb_mensual
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
gb_3 gb_3
gb_2 gb_2
end type
global w_jefe_ventras_graf w_jefe_ventras_graf

on w_jefe_ventras_graf.create
this.cb_5=create cb_5
this.cb_2=create cb_2
this.cb_buscar_rut=create cb_buscar_rut
this.p_4=create p_4
this.p_3=create p_3
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_2=create dw_2
this.cb_gventas=create cb_gventas
this.cb_limpiar=create cb_limpiar
this.pb_consultar=create pb_consultar
this.st_1=create st_1
this.em_fec_ini=create em_fec_ini
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.cb_anual=create cb_anual
this.cb_semestal=create cb_semestal
this.cb_mensual=create cb_mensual
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.Control[]={this.cb_5,&
this.cb_2,&
this.cb_buscar_rut,&
this.p_4,&
this.p_3,&
this.cb_4,&
this.cb_3,&
this.dw_2,&
this.cb_gventas,&
this.cb_limpiar,&
this.pb_consultar,&
this.st_1,&
this.em_fec_ini,&
this.em_fec_fin,&
this.st_2,&
this.cb_anual,&
this.cb_semestal,&
this.cb_mensual,&
this.cb_1,&
this.dw_1,&
this.gb_1,&
this.gb_3,&
this.gb_2}
end on

on w_jefe_ventras_graf.destroy
destroy(this.cb_5)
destroy(this.cb_2)
destroy(this.cb_buscar_rut)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_2)
destroy(this.cb_gventas)
destroy(this.cb_limpiar)
destroy(this.pb_consultar)
destroy(this.st_1)
destroy(this.em_fec_ini)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.cb_anual)
destroy(this.cb_semestal)
destroy(this.cb_mensual)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_2)
end on

event open;////Pantallla Inicial Gerente/////

if gs_depto='I' or gs_depto='G' then
	gf_centrar(w_jefe_ventras_graf)
	em_fec_ini.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
	em_fec_fin.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
else
	Messagebox("Mensaje","Usted No Tiene Los Permisos Necesarios")
	close(w_jefe_ventras_graf)
end if	



end event

type cb_5 from commandbutton within w_jefe_ventras_graf
integer x = 2816
integer y = 52
integer width = 334
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Agente"
end type

event clicked;if isvalid(w_informe_por_agentes_graf) then close(w_informe_por_agentes_graf)
Open(w_informe_por_agentes_graf)
close(w_jefe_ventras_graf)
end event

type cb_2 from commandbutton within w_jefe_ventras_graf
integer x = 2985
integer y = 1528
integer width = 448
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Detalle Efectividad"
end type

event clicked;if isvalid(w_detalle_gestiones_2) then close(w_detalle_gestiones_2)
Open(w_detalle_gestiones_2)
close(w_jefe_ventras_graf)

end event

type cb_buscar_rut from commandbutton within w_jefe_ventras_graf
integer x = 2651
integer y = 1528
integer width = 329
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar Rut"
end type

event clicked;if isvalid(dw_infor_age_buscar_rut) then close(dw_infor_age_buscar_rut)
Open(dw_infor_age_buscar_rut)
close(w_jefe_ventras_graf)

end event

type p_4 from picture within w_jefe_ventras_graf
integer x = 1102
integer y = 60
integer width = 78
integer height = 80
integer taborder = 40
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_fin.text)=-1 then 
 em_fec_fin.text=string(today(),gs_formato_fecha)
 em_fec_fin.setfocus()
 return
end if 
if em_fec_ini.text<>'00/00/0000' then
 ls_fecha = em_fec_fin.text
else
 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
 IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
  em_fec_fin.setfocus()
  return
 else 
  em_fec_fin.text = Message.StringParm
 end if 
END IF
end event

type p_3 from picture within w_jefe_ventras_graf
integer x = 553
integer y = 60
integer width = 78
integer height = 80
integer taborder = 20
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

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

type cb_4 from commandbutton within w_jefe_ventras_graf
integer x = 2473
integer y = 52
integer width = 343
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supervisores"
end type

event clicked;if isvalid(w_gerente_tortas_sup) then close(w_gerente_tortas_sup)
Open(w_gerente_tortas_sup)
close(w_jefe_ventras_graf)
end event

type cb_3 from commandbutton within w_jefe_ventras_graf
integer x = 2149
integer y = 52
integer width = 325
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Jefe Ventas"
end type

event clicked;if isvalid(w_gerente_tortas_jv) then close(w_gerente_tortas_jv)
Open(w_gerente_tortas_jv)
close(w_jefe_ventras_graf)
end event

type dw_2 from datawindow within w_jefe_ventras_graf
integer x = 2117
integer y = 204
integer width = 2048
integer height = 1244
string title = "none"
string dataobject = "dw_info_jefe_graf"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type cb_gventas from commandbutton within w_jefe_ventras_graf
integer x = 3753
integer y = 52
integer width = 402
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Detalle Grafico"
end type

event clicked;if isvalid(w_informe_grafico_ventas) then close(w_informe_grafico_ventas)
Open(w_informe_grafico_ventas)
close(w_jefe_ventras_graf)
end event

type cb_limpiar from commandbutton within w_jefe_ventras_graf
integer x = 1947
integer y = 1524
integer width = 302
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_1.reset()
dw_2.reset()
em_fec_ini.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
w_jefe_ventras_graf.triggerevent(open!)

end event

type pb_consultar from picturebutton within w_jefe_ventras_graf
integer x = 1266
integer y = 40
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_jefven
	
ldt_fech_ini		= datetime(date(em_fec_ini.text),time('00:00:00'))
ldt_fech_fin		= datetime(date(em_fec_fin.text),time('23:59:59'))
	
if ldt_fech_ini <= ldt_fech_fin then	
	dw_1.settransobject(sqlca)
	
	if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin)=0 then
	    Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
	else
		dw_2.settransobject(sqlca)
		if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin)=0 then
	   	
		else
		end if
	end if	
else
	Messagebox("Error","Rango de Fechas Invalido")
end if

end event

type st_1 from statictext within w_jefe_ventras_graf
integer x = 55
integer y = 72
integer width = 169
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

type em_fec_ini from editmask within w_jefe_ventras_graf
integer x = 229
integer y = 64
integer width = 306
integer height = 76
integer taborder = 10
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_1.reset()
dw_2.reset()
end event

type em_fec_fin from editmask within w_jefe_ventras_graf
integer x = 773
integer y = 60
integer width = 311
integer height = 80
integer taborder = 30
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_1.reset()
dw_2.reset()
end event

type st_2 from statictext within w_jefe_ventras_graf
integer x = 663
integer y = 72
integer width = 105
integer height = 56
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

type cb_anual from commandbutton within w_jefe_ventras_graf
integer x = 640
integer y = 1524
integer width = 288
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Anual"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2
date fecha1,fecha2
long ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

ll_ano_actual			= year(date(gdt_fec_sistema))
ls_fech					= '01/01/'+string(ll_ano_actual,'0000')
ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
ls_fech2					= '31/12/'+string(ll_ano_actual,'0000')
ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))

if ldt_fech_ini <= ldt_fech_fin then	
	dw_1.settransobject(sqlca)
	if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin)=0 then
	    Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
	else
		dw_2.settransobject(sqlca)
		if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin)=0 then
		else
		end if
	end if	
else
	Messagebox("Error","Rango de Fechas Invalido")
end if
end event

type cb_semestal from commandbutton within w_jefe_ventras_graf
integer x = 347
integer y = 1524
integer width = 288
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Semestral"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2
date fecha1,fecha2
long ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

ll_ano_actual			= year(date(gdt_fec_sistema))
ls_fech					= '01/01/'+string(ll_ano_actual,'0000')
ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
ls_fech2					= '30/06/'+string(ll_ano_actual,'0000')
ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))

if gdt_fec_sistema > ldt_fech_fin then
	ls_fech					= '01/07/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/12/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
end if
if ldt_fech_ini <= ldt_fech_fin then	
	dw_1.settransobject(sqlca)
	if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin)=0 then
	    Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
	else
		dw_2.settransobject(sqlca)
		if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin)=0 then	
		else
		end if
	end if	
else
	Messagebox("Error","Rango de Fechas Invalido")
end if
end event

type cb_mensual from commandbutton within w_jefe_ventras_graf
integer x = 55
integer y = 1524
integer width = 288
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mensual"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2
date fecha1,fecha2
long ll_mes_actual,ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

ll_mes_actual			= month(date(gdt_fec_sistema))
CHOOSE CASE ll_mes_actual		
CASE 01 
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/01/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/01/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 02
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/02/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '29/02/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 03
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/03/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/03/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 04 
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/04/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '30/04/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 05
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/05/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/05/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 06
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/06/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '30/06/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 07
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/07/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/07/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 08
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/08/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/08/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 09
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/09/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '30/09/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 10
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/10/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/10/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 11
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/11/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '30/11/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
CASE 12
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/12/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/12/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))		
END CHOOSE	

if ldt_fech_ini <= ldt_fech_fin then	
	dw_1.settransobject(sqlca)
	if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin)=0 then
	    Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
	else
		dw_2.settransobject(sqlca)
		if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin)=0 then
	   		
		else
	
		end if
	end if	
else
	Messagebox("Error","Rango de Fechas Invalido")
end if
end event

type cb_1 from commandbutton within w_jefe_ventras_graf
integer x = 3863
integer y = 1516
integer width = 320
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_jefe_ventras_graf)
end event

type dw_1 from datawindow within w_jefe_ventras_graf
integer x = 37
integer y = 204
integer width = 2048
integer height = 1244
string title = "none"
string dataobject = "dw_informe_agente_gestiones"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type gb_1 from groupbox within w_jefe_ventras_graf
integer x = 37
integer y = 1480
integer width = 914
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within w_jefe_ventras_graf
integer x = 2130
integer y = 8
integer width = 1051
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_jefe_ventras_graf
integer x = 2629
integer y = 1480
integer width = 818
integer height = 152
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

