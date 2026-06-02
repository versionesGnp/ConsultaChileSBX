forward
global type w_detalle_grafico_supervisor from window
end type
type p_4 from picture within w_detalle_grafico_supervisor
end type
type p_3 from picture within w_detalle_grafico_supervisor
end type
type st_1 from statictext within w_detalle_grafico_supervisor
end type
type dw_venta_grafico from datawindow within w_detalle_grafico_supervisor
end type
type cb_4 from commandbutton within w_detalle_grafico_supervisor
end type
type em_fec_ini from editmask within w_detalle_grafico_supervisor
end type
type em_fec_fin from editmask within w_detalle_grafico_supervisor
end type
type st_2 from statictext within w_detalle_grafico_supervisor
end type
type pb_consultar from picturebutton within w_detalle_grafico_supervisor
end type
type dw_2 from datawindow within w_detalle_grafico_supervisor
end type
type cb_jefe_ven from commandbutton within w_detalle_grafico_supervisor
end type
type gb_1 from groupbox within w_detalle_grafico_supervisor
end type
type gb_2 from groupbox within w_detalle_grafico_supervisor
end type
type cb_mes from commandbutton within w_detalle_grafico_supervisor
end type
type cb_semestral from commandbutton within w_detalle_grafico_supervisor
end type
type cb_anual from commandbutton within w_detalle_grafico_supervisor
end type
type cb_limpiar from commandbutton within w_detalle_grafico_supervisor
end type
end forward

global type w_detalle_grafico_supervisor from window
integer width = 3657
integer height = 2420
boolean titlebar = true
string title = "Agentes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
p_4 p_4
p_3 p_3
st_1 st_1
dw_venta_grafico dw_venta_grafico
cb_4 cb_4
em_fec_ini em_fec_ini
em_fec_fin em_fec_fin
st_2 st_2
pb_consultar pb_consultar
dw_2 dw_2
cb_jefe_ven cb_jefe_ven
gb_1 gb_1
gb_2 gb_2
cb_mes cb_mes
cb_semestral cb_semestral
cb_anual cb_anual
cb_limpiar cb_limpiar
end type
global w_detalle_grafico_supervisor w_detalle_grafico_supervisor

on w_detalle_grafico_supervisor.create
this.p_4=create p_4
this.p_3=create p_3
this.st_1=create st_1
this.dw_venta_grafico=create dw_venta_grafico
this.cb_4=create cb_4
this.em_fec_ini=create em_fec_ini
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.pb_consultar=create pb_consultar
this.dw_2=create dw_2
this.cb_jefe_ven=create cb_jefe_ven
this.gb_1=create gb_1
this.gb_2=create gb_2
this.cb_mes=create cb_mes
this.cb_semestral=create cb_semestral
this.cb_anual=create cb_anual
this.cb_limpiar=create cb_limpiar
this.Control[]={this.p_4,&
this.p_3,&
this.st_1,&
this.dw_venta_grafico,&
this.cb_4,&
this.em_fec_ini,&
this.em_fec_fin,&
this.st_2,&
this.pb_consultar,&
this.dw_2,&
this.cb_jefe_ven,&
this.gb_1,&
this.gb_2,&
this.cb_mes,&
this.cb_semestral,&
this.cb_anual,&
this.cb_limpiar}
end on

on w_detalle_grafico_supervisor.destroy
destroy(this.p_4)
destroy(this.p_3)
destroy(this.st_1)
destroy(this.dw_venta_grafico)
destroy(this.cb_4)
destroy(this.em_fec_ini)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.pb_consultar)
destroy(this.dw_2)
destroy(this.cb_jefe_ven)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.cb_mes)
destroy(this.cb_semestral)
destroy(this.cb_anual)
destroy(this.cb_limpiar)
end on

event open;gf_centrar(w_detalle_grafico_supervisor)
em_fec_ini.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
end event

type p_4 from picture within w_detalle_grafico_supervisor
integer x = 969
integer y = 2152
integer width = 78
integer height = 88
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

type p_3 from picture within w_detalle_grafico_supervisor
integer x = 475
integer y = 2152
integer width = 78
integer height = 88
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

type st_1 from statictext within w_detalle_grafico_supervisor
integer x = 9
integer y = 2168
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
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_venta_grafico from datawindow within w_detalle_grafico_supervisor
integer x = 14
integer y = 44
integer width = 3575
integer height = 1008
string title = "none"
string dataobject = "dw_detalle_jv"
borderstyle borderstyle = styleshadowbox!
end type

type cb_4 from commandbutton within w_detalle_grafico_supervisor
integer x = 3328
integer y = 2152
integer width = 288
integer height = 100
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_grafico_supervisor)
end event

type em_fec_ini from editmask within w_detalle_grafico_supervisor
integer x = 174
integer y = 2160
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
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_venta_grafico.reset()
dw_2.reset()
end event

type em_fec_fin from editmask within w_detalle_grafico_supervisor
integer x = 667
integer y = 2156
integer width = 302
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
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_venta_grafico.reset()
dw_2.reset()
end event

type st_2 from statictext within w_detalle_grafico_supervisor
integer x = 567
integer y = 2168
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

type pb_consultar from picturebutton within w_detalle_grafico_supervisor
integer x = 1115
integer y = 2128
integer width = 155
integer height = 136
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
string ls_cod_jef,ls_cod_sup

SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
INTO 	 :ls_cod_jef,   			:ls_cod_sup  
FROM 	 "SUPERVISOR"  
WHERE  "SUPERVISOR"."COD_SUP" = :gs_user
USING 	sqlca;
if sqlca.sqlcode =0 then
	//ls_cod_jef			= dw_1.getitemstring(1,'cod_jef')
	//ls_cod_sup			= dw_1.getitemstring(1,'cod_sup')
	if isnull(ls_cod_jef) then
		Messagebox("Error","Debe Seleccionar un Jefe De Ventas")	
	else	
		ldt_fech_ini		= datetime(date(em_fec_ini.text),time('00:00:00'))
		ldt_fech_fin		= datetime(date(em_fec_fin.text),time('23:59:59'))	
		if ldt_fech_ini <= ldt_fech_fin then
			dw_venta_grafico.settransobject(sqlca)
			if dw_venta_grafico.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
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
else
	Messagebox("Error","Error Leyendo Datos")
end if	
end event

type dw_2 from datawindow within w_detalle_grafico_supervisor
integer x = 18
integer y = 1076
integer width = 3575
integer height = 1008
string title = "none"
string dataobject = "dw_detalle_vent_jv"
borderstyle borderstyle = styleshadowbox!
end type

type cb_jefe_ven from commandbutton within w_detalle_grafico_supervisor
integer x = 2523
integer y = 2160
integer width = 270
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Volver"
end type

event clicked;if isvalid(w_informe_supervisores) then close(w_informe_supervisores)
 Open(w_informe_supervisores)
 close(w_detalle_grafico_supervisor)
end event

type gb_1 from groupbox within w_detalle_grafico_supervisor
integer x = 1440
integer y = 2116
integer width = 923
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_detalle_grafico_supervisor
integer x = 2505
integer y = 2116
integer width = 585
integer height = 152
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

type cb_mes from commandbutton within w_detalle_grafico_supervisor
integer x = 1454
integer y = 2160
integer width = 293
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mensual"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2,ls_cod_jef,ls_cod_sup
date fecha1,fecha2
long ll_mes_actual,ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
INTO 	 :ls_cod_jef,   			:ls_cod_sup  
FROM 	 "SUPERVISOR"  
WHERE  "SUPERVISOR"."COD_SUP" = :gs_user
USING 	sqlca;
if sqlca.sqlcode =0 then
		//ls_cod_jef			= dw_1.getitemstring(1,'cod_jef')
		//ls_cod_sup			= dw_1.getitemstring(1,'cod_sup')
		em_fec_ini.text			= '00/00/0000'
		em_fec_fin.text			= '00/00/0000'

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
			dw_venta_grafico.settransobject(sqlca)
			if dw_venta_grafico.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
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
else
	Messagebox("Error","Error Leyendo Datos")
end if		
end event

type cb_semestral from commandbutton within w_detalle_grafico_supervisor
integer x = 1751
integer y = 2160
integer width = 293
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Semestral"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2,ls_cod_jef,ls_cod_sup
date fecha1,fecha2
long ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
INTO 	 :ls_cod_jef,   			:ls_cod_sup  
FROM 	 "SUPERVISOR"  
WHERE  "SUPERVISOR"."COD_SUP" = :gs_user
USING 	sqlca;
if sqlca.sqlcode =0 then

	//ls_cod_jef			= dw_1.getitemstring(1,'cod_jef')
	//ls_cod_sup			= dw_1.getitemstring(1,'cod_sup')
	em_fec_ini.text			= '00/00/0000'
	em_fec_fin.text			= '00/00/0000'
	
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
			dw_venta_grafico.settransobject(sqlca)
			if dw_venta_grafico.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
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
else
	Messagebox("Error","Error Leyendo Datos")
end if	
end event

type cb_anual from commandbutton within w_detalle_grafico_supervisor
integer x = 2048
integer y = 2160
integer width = 293
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Anual"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2,ls_cod_jef,ls_cod_sup
date fecha1,fecha2
long ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
INTO 	 :ls_cod_jef,   			:ls_cod_sup  
FROM 	 "SUPERVISOR"  
WHERE  "SUPERVISOR"."COD_SUP" = :gs_user
USING 	sqlca;
if sqlca.sqlcode =0 then
	//ls_cod_jef			= dw_1.getitemstring(1,'cod_jef')
	//ls_cod_sup			= dw_1.getitemstring(1,'cod_sup')

	em_fec_ini.text			= '00/00/0000'
	em_fec_fin.text			= '00/00/0000'
	
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/01/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/12/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
	
	if ldt_fech_ini <= ldt_fech_fin then
			dw_venta_grafico.settransobject(sqlca)
			if dw_venta_grafico.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
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
else
	Messagebox("Error","Error Leyendo Datos")
end if	
end event

type cb_limpiar from commandbutton within w_detalle_grafico_supervisor
integer x = 2798
integer y = 2160
integer width = 270
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_venta_grafico.reset()
dw_2.reset()
em_fec_ini.text = string('00/00/0000')
em_fec_fin.text = string('00/00/0000')

//cb_mes.enabled 		= False
//cb_semestral.enabled	= False
//cb_anual.enabled	= False

w_detalle_grafico_supervisor.triggerevent(open!)
end event

