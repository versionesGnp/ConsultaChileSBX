forward
global type w_jv_tortas_sup from window
end type
type cb_1 from commandbutton within w_jv_tortas_sup
end type
type p_4 from picture within w_jv_tortas_sup
end type
type p_3 from picture within w_jv_tortas_sup
end type
type dw_1 from datawindow within w_jv_tortas_sup
end type
type dw_3 from datawindow within w_jv_tortas_sup
end type
type dw_2 from datawindow within w_jv_tortas_sup
end type
type st_1 from statictext within w_jv_tortas_sup
end type
type cb_4 from commandbutton within w_jv_tortas_sup
end type
type em_fec_ini from editmask within w_jv_tortas_sup
end type
type em_fec_fin from editmask within w_jv_tortas_sup
end type
type st_2 from statictext within w_jv_tortas_sup
end type
type pb_consultar from picturebutton within w_jv_tortas_sup
end type
type cb_jefe_ven from commandbutton within w_jv_tortas_sup
end type
type cb_anual from commandbutton within w_jv_tortas_sup
end type
type cb_semestral from commandbutton within w_jv_tortas_sup
end type
type cb_mes from commandbutton within w_jv_tortas_sup
end type
type cb_limpiar from commandbutton within w_jv_tortas_sup
end type
type gb_1 from groupbox within w_jv_tortas_sup
end type
type gb_3 from groupbox within w_jv_tortas_sup
end type
end forward

global type w_jv_tortas_sup from window
integer width = 3982
integer height = 1788
boolean titlebar = true
string title = "Totas Supervisores"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
p_4 p_4
p_3 p_3
dw_1 dw_1
dw_3 dw_3
dw_2 dw_2
st_1 st_1
cb_4 cb_4
em_fec_ini em_fec_ini
em_fec_fin em_fec_fin
st_2 st_2
pb_consultar pb_consultar
cb_jefe_ven cb_jefe_ven
cb_anual cb_anual
cb_semestral cb_semestral
cb_mes cb_mes
cb_limpiar cb_limpiar
gb_1 gb_1
gb_3 gb_3
end type
global w_jv_tortas_sup w_jv_tortas_sup

on w_jv_tortas_sup.create
this.cb_1=create cb_1
this.p_4=create p_4
this.p_3=create p_3
this.dw_1=create dw_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.st_1=create st_1
this.cb_4=create cb_4
this.em_fec_ini=create em_fec_ini
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.pb_consultar=create pb_consultar
this.cb_jefe_ven=create cb_jefe_ven
this.cb_anual=create cb_anual
this.cb_semestral=create cb_semestral
this.cb_mes=create cb_mes
this.cb_limpiar=create cb_limpiar
this.gb_1=create gb_1
this.gb_3=create gb_3
this.Control[]={this.cb_1,&
this.p_4,&
this.p_3,&
this.dw_1,&
this.dw_3,&
this.dw_2,&
this.st_1,&
this.cb_4,&
this.em_fec_ini,&
this.em_fec_fin,&
this.st_2,&
this.pb_consultar,&
this.cb_jefe_ven,&
this.cb_anual,&
this.cb_semestral,&
this.cb_mes,&
this.cb_limpiar,&
this.gb_1,&
this.gb_3}
end on

on w_jv_tortas_sup.destroy
destroy(this.cb_1)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.dw_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.em_fec_ini)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.pb_consultar)
destroy(this.cb_jefe_ven)
destroy(this.cb_anual)
destroy(this.cb_semestral)
destroy(this.cb_mes)
destroy(this.cb_limpiar)
destroy(this.gb_1)
destroy(this.gb_3)
end on

event open;string ls_cod_jef
gf_centrar(w_jv_tortas_sup)
em_fec_ini.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
em_fec_fin.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')	
 
dw_1.getchild('cod_sup',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(gs_user)=0 then
	idw_detalle.insertrow(0)
end if
dw_1.insertrow(0)
dw_1.accepttext() 



end event

type cb_1 from commandbutton within w_jv_tortas_sup
integer x = 2688
integer y = 1528
integer width = 448
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Detalle Efectividad"
end type

event clicked;if isvalid(w_detalle_gestiones_jefe_v_2) then close(w_detalle_gestiones_jefe_v_2)
Open(w_detalle_gestiones_jefe_v_2)
close(w_jv_tortas_sup)

end event

type p_4 from picture within w_jv_tortas_sup
integer x = 3584
integer y = 60
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

type p_3 from picture within w_jv_tortas_sup
integer x = 3063
integer y = 60
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

type dw_1 from datawindow within w_jv_tortas_sup
integer x = 32
integer y = 60
integer width = 1381
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "dwe_jv_superv"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_superv
ls_superv			= dw_1.getitemstring(1,'cod_sup')

if not isnull(ls_superv) and ls_superv = '' then
	Messagebox("Error","Debe Seleccionar un Supervisor")
else
cb_mes.enabled 		= True
cb_semestral.enabled	= True
cb_anual.enabled	= True
end if	
end event

type dw_3 from datawindow within w_jv_tortas_sup
integer x = 1984
integer y = 208
integer width = 1920
integer height = 1232
string title = "none"
string dataobject = "dw_superv_gestion_graf"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type dw_2 from datawindow within w_jv_tortas_sup
integer x = 32
integer y = 208
integer width = 1920
integer height = 1232
string title = "none"
string dataobject = "dw_superv_vent_gra"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type st_1 from statictext within w_jv_tortas_sup
integer x = 2592
integer y = 72
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

type cb_4 from commandbutton within w_jv_tortas_sup
integer x = 3538
integer y = 1520
integer width = 384
integer height = 100
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_jv_tortas_sup)
end event

type em_fec_ini from editmask within w_jv_tortas_sup
integer x = 2761
integer y = 64
integer width = 302
integer height = 72
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_2.reset()
dw_3.reset()
end event

type em_fec_fin from editmask within w_jv_tortas_sup
integer x = 3269
integer y = 60
integer width = 311
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_2.reset()
dw_3.reset()
end event

type st_2 from statictext within w_jv_tortas_sup
integer x = 3168
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

type pb_consultar from picturebutton within w_jv_tortas_sup
integer x = 3735
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
string ls_cod_jef,ls_cod_sup

SELECT "JEFE_VENTAS"."JEFE_VENTAS"  
INTO	 :ls_cod_jef  
FROM 	 "JEFE_VENTAS"  
WHERE	 "JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING	 sqlca        ;

if sqlca.sqlcode=0 then

	//ls_cod_jef			= dw_1.getitemstring(1,'cod_jef')
	ls_cod_sup			= dw_1.getitemstring(1,'cod_sup')
		
		ldt_fech_ini		= datetime(date(em_fec_ini.text),time('00:00:00'))
		ldt_fech_fin		= datetime(date(em_fec_fin.text),time('23:59:59'))	
		if ldt_fech_ini <= ldt_fech_fin then
			dw_2.settransobject(sqlca)
			if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
					 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
					 dw_3.reset()
			else
				dw_3.settransobject(sqlca)
				if dw_3.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
				else
				end if
			end if	
		else
			Messagebox("Error","Rango de Fechas Invalido")
	end if
else
	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
end if	
end event

type cb_jefe_ven from commandbutton within w_jv_tortas_sup
integer x = 1979
integer y = 1528
integer width = 302
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Volver"
end type

event clicked;if isvalid(w_infome_general_grafico) then close(w_infome_general_grafico)
Open(w_infome_general_grafico)
close(w_jv_tortas_sup)


end event

type cb_anual from commandbutton within w_jv_tortas_sup
integer x = 663
integer y = 1528
integer width = 302
integer height = 84
integer taborder = 90
boolean bringtotop = true
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

SELECT "JEFE_VENTAS"."JEFE_VENTAS"  
INTO	 :ls_cod_jef  
FROM 	 "JEFE_VENTAS"  
WHERE	 "JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING	 sqlca        ;

if sqlca.sqlcode=0 then
	ls_cod_sup			= dw_1.getitemstring(1,'cod_sup')
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/01/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/12/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
	if ldt_fech_ini <= ldt_fech_fin then
			dw_2.settransobject(sqlca)
			if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
					 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
					 dw_3.reset()
			else
				dw_3.settransobject(sqlca)
				if dw_3.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
				else
				end if
			end if	
		else
			Messagebox("Error","Rango de Fechas Invalido")
	end if
else
	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
end if	
end event

type cb_semestral from commandbutton within w_jv_tortas_sup
integer x = 357
integer y = 1528
integer width = 302
integer height = 84
integer taborder = 80
boolean bringtotop = true
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

SELECT "JEFE_VENTAS"."JEFE_VENTAS"  
INTO	 :ls_cod_jef  
FROM 	 "JEFE_VENTAS"  
WHERE	 "JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING	 sqlca        ;

if sqlca.sqlcode=0 then
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
			dw_2.settransobject(sqlca)
			if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
					Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
					  dw_3.reset()
			else
				dw_3.settransobject(sqlca)
				if dw_3.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
				else
				end if
			end if	
		else
			Messagebox("Error","Rango de Fechas Invalido")
	end if
else
	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
end if	
end event

type cb_mes from commandbutton within w_jv_tortas_sup
integer x = 50
integer y = 1528
integer width = 302
integer height = 84
integer taborder = 70
boolean bringtotop = true
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

SELECT "JEFE_VENTAS"."JEFE_VENTAS"  
INTO	 :ls_cod_jef  
FROM 	 "JEFE_VENTAS"  
WHERE	 "JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING	 sqlca        ;

if sqlca.sqlcode=0 then
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
			dw_2.settransobject(sqlca)
			if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then
					 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
					  dw_3.reset()
			else
				dw_3.settransobject(sqlca)
				if dw_3.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup)=0 then			
				else
				end if
			end if	
		else
			Messagebox("Error","Rango de Fechas Invalido")
	end if
else
	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
end if	
end event

type cb_limpiar from commandbutton within w_jv_tortas_sup
integer x = 1673
integer y = 1528
integer width = 302
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

event clicked;dw_1.reset()
dw_2.reset()
dw_3.reset()
cb_mes.enabled 		= False
cb_semestral.enabled	= False
cb_anual.enabled	= False

w_jv_tortas_sup.triggerevent(open!)
end event

type gb_1 from groupbox within w_jv_tortas_sup
integer x = 32
integer y = 1476
integer width = 955
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

type gb_3 from groupbox within w_jv_tortas_sup
integer x = 1650
integer y = 1476
integer width = 654
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

