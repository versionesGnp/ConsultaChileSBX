forward
global type w_informe_grafico_ventas from window
end type
type p_4 from picture within w_informe_grafico_ventas
end type
type p_3 from picture within w_informe_grafico_ventas
end type
type dw_1 from datawindow within w_informe_grafico_ventas
end type
type cb_jefe_ven from commandbutton within w_informe_grafico_ventas
end type
type dw_2 from datawindow within w_informe_grafico_ventas
end type
type pb_consultar from picturebutton within w_informe_grafico_ventas
end type
type cb_anual from commandbutton within w_informe_grafico_ventas
end type
type cb_semestral from commandbutton within w_informe_grafico_ventas
end type
type cb_mes from commandbutton within w_informe_grafico_ventas
end type
type cb_limpiar from commandbutton within w_informe_grafico_ventas
end type
type st_2 from statictext within w_informe_grafico_ventas
end type
type em_fec_fin from editmask within w_informe_grafico_ventas
end type
type em_fec_ini from editmask within w_informe_grafico_ventas
end type
type cb_4 from commandbutton within w_informe_grafico_ventas
end type
type dw_detalle from datawindow within w_informe_grafico_ventas
end type
type st_1 from statictext within w_informe_grafico_ventas
end type
type gb_1 from groupbox within w_informe_grafico_ventas
end type
type gb_2 from groupbox within w_informe_grafico_ventas
end type
end forward

global type w_informe_grafico_ventas from window
integer width = 3794
integer height = 2544
boolean titlebar = true
string title = "Informe Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
p_4 p_4
p_3 p_3
dw_1 dw_1
cb_jefe_ven cb_jefe_ven
dw_2 dw_2
pb_consultar pb_consultar
cb_anual cb_anual
cb_semestral cb_semestral
cb_mes cb_mes
cb_limpiar cb_limpiar
st_2 st_2
em_fec_fin em_fec_fin
em_fec_ini em_fec_ini
cb_4 cb_4
dw_detalle dw_detalle
st_1 st_1
gb_1 gb_1
gb_2 gb_2
end type
global w_informe_grafico_ventas w_informe_grafico_ventas

on w_informe_grafico_ventas.create
this.p_4=create p_4
this.p_3=create p_3
this.dw_1=create dw_1
this.cb_jefe_ven=create cb_jefe_ven
this.dw_2=create dw_2
this.pb_consultar=create pb_consultar
this.cb_anual=create cb_anual
this.cb_semestral=create cb_semestral
this.cb_mes=create cb_mes
this.cb_limpiar=create cb_limpiar
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.em_fec_ini=create em_fec_ini
this.cb_4=create cb_4
this.dw_detalle=create dw_detalle
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.p_4,&
this.p_3,&
this.dw_1,&
this.cb_jefe_ven,&
this.dw_2,&
this.pb_consultar,&
this.cb_anual,&
this.cb_semestral,&
this.cb_mes,&
this.cb_limpiar,&
this.st_2,&
this.em_fec_fin,&
this.em_fec_ini,&
this.cb_4,&
this.dw_detalle,&
this.st_1,&
this.gb_1,&
this.gb_2}
end on

on w_informe_grafico_ventas.destroy
destroy(this.p_4)
destroy(this.p_3)
destroy(this.dw_1)
destroy(this.cb_jefe_ven)
destroy(this.dw_2)
destroy(this.pb_consultar)
destroy(this.cb_anual)
destroy(this.cb_semestral)
destroy(this.cb_mes)
destroy(this.cb_limpiar)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.em_fec_ini)
destroy(this.cb_4)
destroy(this.dw_detalle)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;String	ls_columna,ls_jefe,ls_supervisor

em_fec_ini.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
gf_centrar(w_informe_grafico_ventas)

dw_1.getchild('cod_jef',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve()=0 then
	idw_detalle2.insertrow(0)
end if
dw_1.getchild('cod_sup',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('')=0 then
	idw_detalle.insertrow(0)
end if
dw_1.insertrow(0)
dw_1.accepttext()



//dw_1.dataobject = 'dwe_jefe_supervisor'
//dw_1.settransobject(sqlca)
//dw_1.insertrow(0)



end event

type p_4 from picture within w_informe_grafico_ventas
integer x = 3461
integer y = 72
integer width = 78
integer height = 80
integer taborder = 50
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

type p_3 from picture within w_informe_grafico_ventas
integer x = 2935
integer y = 68
integer width = 78
integer height = 80
integer taborder = 30
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

type dw_1 from datawindow within w_informe_grafico_ventas
integer x = 23
integer y = 72
integer width = 2446
integer height = 88
integer taborder = 10
string title = "none"
string dataobject = "dwe_jefe_supervisor"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
long	ll_p

ll_p	= 0
Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'cod_jef'
		dw_1.accepttext()
		ls_jefe					= dw_1.getitemstring(1,'cod_jef')
		dw_1.getchild('cod_sup',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		dw_1.setitem(1,'cod_sup',ls_nulo)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ls_jefe)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_1.accepttext()
	CASE 'cod_sup'
		dw_1.accepttext()
END CHOOSE

ls_jefe			= dw_1.getitemstring(1,'cod_jef')

if not isnull(ls_jefe) and ls_jefe = '' then
	Messagebox("Error","Debe Seleccionar un Jefe De Ventas")
else
cb_mes.enabled 		= True
cb_semestral.enabled	= True
cb_anual.enabled	= True
end if








//
//String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
//long	ll_p
//
//ll_p	= 0
//Setnull(ls_nulo)
//ls_columna	= dwo.name
//CHOOSE CASE ls_columna
//	CASE 'jef_vent_or'
//		dw_jef_vent_or.accepttext()
//		ls_jefe					= dw_jef_vent_or.getitemstring(1,'jef_vent_or')
//		dw_jef_vent_or.getchild('sup_vent_or',idw_detalle)
//		idw_detalle.settransobject(sqlca)
//		idw_detalle.reset()
//		idw_detalle2.reset()
//		dw_jef_vent_or.setitem(1,'sup_vent_or',ls_nulo)
//		dw_jef_vent_or.setitem(1,'age_vent_or',ls_nulo)
//		if idw_detalle.retrieve(ls_jefe)=0 then
//			idw_detalle.insertrow(0)
//		end if
//		dw_jef_vent_or.accepttext()
//		
//	CASE 'sup_vent_or'
//		dw_jef_vent_or.accepttext()
//		ls_supervisor				= dw_jef_vent_or.getitemstring(1,'sup_vent_or')
//		dw_jef_vent_or.getchild('age_vent_or',idw_detalle2)
//		idw_detalle2.reset()
//		dw_jef_vent_or.setitem(1,'age_vent_or',ls_nulo)
//		idw_detalle2.settransobject(sqlca)
//		if idw_detalle2.retrieve(ls_supervisor)=0 then
//			idw_detalle2.insertrow(0)
//		end if
//		dw_jef_vent_or.accepttext()
//		
//	CASE 'age_vent_or'
//		dw_jef_vent_or.accepttext()
//END CHOOSE
//
end event

type cb_jefe_ven from commandbutton within w_informe_grafico_ventas
integer x = 1559
integer y = 2296
integer width = 302
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Volver"
end type

event clicked;if isvalid(w_jefe_ventras_graf) then close(w_jefe_ventras_graf)
 Open(w_jefe_ventras_graf)
 close(w_informe_grafico_ventas)
end event

type dw_2 from datawindow within w_informe_grafico_ventas
integer x = 18
integer y = 1228
integer width = 3712
integer height = 1008
string title = "none"
string dataobject = "dw_detalle_vent_jv"
borderstyle borderstyle = styleshadowbox!
end type

type pb_consultar from picturebutton within w_informe_grafico_ventas
integer x = 3566
integer y = 32
integer width = 155
integer height = 136
integer taborder = 60
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
string ls_cod_jef,ls_cod_sup,ls_base,ls_serie
long	ll_indi,ll_tot_reg,ll_rut
Double	ll_numero

ls_cod_jef			= dw_1.getitemstring(1,'cod_jef')
ls_cod_sup			= dw_1.getitemstring(1,'cod_sup')
if isnull(ls_cod_jef) then
	Messagebox("Error","Debe Seleccionar un Jefe De Ventas")	
else	
	ldt_fech_ini		= datetime(date(em_fec_ini.text),time('00:00:00'))
	ldt_fech_fin		= datetime(date(em_fec_fin.text),time('23:59:59'))	
	if ldt_fech_ini <= ldt_fech_fin then
		dw_detalle.settransobject(sqlca)
		if dw_detalle.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
			 	 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
				  dw_2.reset()
		else
			dw_2.settransobject(sqlca)
			if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
				
			else
			end if
		end if	
	else
		Messagebox("Error","Rango de Fechas Invalido")
end if
end if
end event

type cb_anual from commandbutton within w_informe_grafico_ventas
integer x = 654
integer y = 2296
integer width = 302
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Anual"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2,ls_cod_jef,ls_cod_sup
date fecha1,fecha2
long ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

ls_cod_jef			= dw_1.getitemstring(1,'cod_jef')
ls_cod_sup			= dw_1.getitemstring(1,'cod_sup')
ll_ano_actual			= year(date(gdt_fec_sistema))
ls_fech					= '01/01/'+string(ll_ano_actual,'0000')
ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
ls_fech2					= '31/12/'+string(ll_ano_actual,'0000')
ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))

if ldt_fech_ini <= ldt_fech_fin then	
	dw_1.settransobject(sqlca)
	
	if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin)=0 then
	    Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
		 dw_2.reset()
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

type cb_semestral from commandbutton within w_informe_grafico_ventas
integer x = 347
integer y = 2296
integer width = 302
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Semestral"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2,ls_cod_jef,ls_cod_sup
date fecha1,fecha2
long ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

ls_cod_jef			= dw_1.getitemstring(1,'cod_jef')
ls_cod_sup			= dw_1.getitemstring(1,'cod_sup')
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
		 dw_2.reset()
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

type cb_mes from commandbutton within w_informe_grafico_ventas
integer x = 41
integer y = 2296
integer width = 302
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Mensual"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2,ls_cod_jef,ls_cod_sup
date fecha1,fecha2
long ll_mes_actual,ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

ls_cod_jef			= dw_1.getitemstring(1,'cod_jef')
ls_cod_sup			= dw_1.getitemstring(1,'cod_sup')
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
		 dw_2.reset()
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

type cb_limpiar from commandbutton within w_informe_grafico_ventas
integer x = 1870
integer y = 2296
integer width = 302
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_detalle.reset()
dw_1.reset()
dw_2.reset()

cb_mes.enabled 		= False
cb_semestral.enabled	= False
cb_anual.enabled	= False

w_informe_grafico_ventas.triggerevent(open!)
end event

type st_2 from statictext within w_informe_grafico_ventas
integer x = 3031
integer y = 80
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
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_informe_grafico_ventas
integer x = 3141
integer y = 72
integer width = 302
integer height = 80
integer taborder = 40
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

type em_fec_ini from editmask within w_informe_grafico_ventas
integer x = 2633
integer y = 76
integer width = 302
integer height = 76
integer taborder = 20
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

type cb_4 from commandbutton within w_informe_grafico_ventas
integer x = 3365
integer y = 2288
integer width = 384
integer height = 100
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_grafico_ventas)
end event

type dw_detalle from datawindow within w_informe_grafico_ventas
integer x = 18
integer y = 196
integer width = 3703
integer height = 1008
string title = "none"
string dataobject = "dw_detalle_jv"
borderstyle borderstyle = styleshadowbox!
end type

type st_1 from statictext within w_informe_grafico_ventas
integer x = 2473
integer y = 80
integer width = 155
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
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_informe_grafico_ventas
integer x = 23
integer y = 2244
integer width = 955
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_informe_grafico_ventas
integer x = 1536
integer y = 2244
integer width = 658
integer height = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

