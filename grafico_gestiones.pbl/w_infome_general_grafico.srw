//objectcomments pantalla jefe ventas
forward
global type w_infome_general_grafico from window
end type
type cb_agentes from commandbutton within w_infome_general_grafico
end type
type cb_detalle from commandbutton within w_infome_general_grafico
end type
type p_4 from picture within w_infome_general_grafico
end type
type p_3 from picture within w_infome_general_grafico
end type
type cb_3 from commandbutton within w_infome_general_grafico
end type
type dw_2 from datawindow within w_infome_general_grafico
end type
type st_2 from statictext within w_infome_general_grafico
end type
type em_fec_fin from editmask within w_infome_general_grafico
end type
type em_fec_ini from editmask within w_infome_general_grafico
end type
type st_1 from statictext within w_infome_general_grafico
end type
type pb_consultar from picturebutton within w_infome_general_grafico
end type
type cb_1 from commandbutton within w_infome_general_grafico
end type
type cb_mensual from commandbutton within w_infome_general_grafico
end type
type cb_semestral from commandbutton within w_infome_general_grafico
end type
type cb_anual from commandbutton within w_infome_general_grafico
end type
type cb_limpiar from commandbutton within w_infome_general_grafico
end type
type dw_1 from datawindow within w_infome_general_grafico
end type
type gb_1 from groupbox within w_infome_general_grafico
end type
end forward

global type w_infome_general_grafico from window
integer width = 4155
integer height = 1804
boolean titlebar = true
string title = "Comparación Supervisores"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_agentes cb_agentes
cb_detalle cb_detalle
p_4 p_4
p_3 p_3
cb_3 cb_3
dw_2 dw_2
st_2 st_2
em_fec_fin em_fec_fin
em_fec_ini em_fec_ini
st_1 st_1
pb_consultar pb_consultar
cb_1 cb_1
cb_mensual cb_mensual
cb_semestral cb_semestral
cb_anual cb_anual
cb_limpiar cb_limpiar
dw_1 dw_1
gb_1 gb_1
end type
global w_infome_general_grafico w_infome_general_grafico

on w_infome_general_grafico.create
this.cb_agentes=create cb_agentes
this.cb_detalle=create cb_detalle
this.p_4=create p_4
this.p_3=create p_3
this.cb_3=create cb_3
this.dw_2=create dw_2
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.pb_consultar=create pb_consultar
this.cb_1=create cb_1
this.cb_mensual=create cb_mensual
this.cb_semestral=create cb_semestral
this.cb_anual=create cb_anual
this.cb_limpiar=create cb_limpiar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_agentes,&
this.cb_detalle,&
this.p_4,&
this.p_3,&
this.cb_3,&
this.dw_2,&
this.st_2,&
this.em_fec_fin,&
this.em_fec_ini,&
this.st_1,&
this.pb_consultar,&
this.cb_1,&
this.cb_mensual,&
this.cb_semestral,&
this.cb_anual,&
this.cb_limpiar,&
this.dw_1,&
this.gb_1}
end on

on w_infome_general_grafico.destroy
destroy(this.cb_agentes)
destroy(this.cb_detalle)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.cb_3)
destroy(this.dw_2)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.pb_consultar)
destroy(this.cb_1)
destroy(this.cb_mensual)
destroy(this.cb_semestral)
destroy(this.cb_anual)
destroy(this.cb_limpiar)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;//////Pantalla Inicial Jefe de Ventas////////


if gs_depto='I' or gs_depto='B' or gs_depto='X' then
		gf_centrar(w_infome_general_grafico)
		em_fec_ini.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
		em_fec_fin.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
else
	Messagebox("Error","Usted No Tiene Los Permisos Necesarios")
	close(w_infome_general_grafico)
end if	
end event

type cb_agentes from commandbutton within w_infome_general_grafico
integer x = 3758
integer y = 40
integer width = 343
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Agentes"
end type

event clicked;if isvalid(w_informe_por_agentes_graf_jv) then close(w_informe_por_agentes_graf_jv)
Open(w_informe_por_agentes_graf_jv)
close(w_infome_general_grafico)
end event

type cb_detalle from commandbutton within w_infome_general_grafico
integer x = 2793
integer y = 1552
integer width = 448
integer height = 84
integer taborder = 90
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
close(w_infome_general_grafico)

end event

type p_4 from picture within w_infome_general_grafico
integer x = 1083
integer y = 52
integer width = 78
integer height = 80
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

type p_3 from picture within w_infome_general_grafico
integer x = 539
integer y = 52
integer width = 78
integer height = 80
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

type cb_3 from commandbutton within w_infome_general_grafico
integer x = 3406
integer y = 40
integer width = 343
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supervisores"
end type

event clicked;if isvalid(w_jv_tortas_sup) then close(w_jv_tortas_sup)
Open(w_jv_tortas_sup)
close(w_infome_general_grafico)
end event

type dw_2 from datawindow within w_infome_general_grafico
integer x = 2066
integer y = 176
integer width = 2016
integer height = 1304
string title = "none"
string dataobject = "dw_jef_gestion_vs"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type st_2 from statictext within w_infome_general_grafico
integer x = 654
integer y = 60
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

type em_fec_fin from editmask within w_infome_general_grafico
integer x = 763
integer y = 52
integer width = 311
integer height = 80
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

event modified;dw_1.reset()
dw_2.reset()
end event

type em_fec_ini from editmask within w_infome_general_grafico
integer x = 233
integer y = 56
integer width = 302
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_1.reset()
dw_2.reset()
end event

type st_1 from statictext within w_infome_general_grafico
integer x = 37
integer y = 60
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
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_consultar from picturebutton within w_infome_general_grafico
integer x = 1248
integer y = 20
integer width = 142
integer height = 124
integer taborder = 30
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
string ls_cod_jef

SELECT 	"JEFE_VENTAS"."JEFE_VENTAS"  
INTO		:ls_cod_jef  
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
USING 	sqlca;
if sqlca.sqlcode=0 then

	ldt_fech_ini		= datetime(date(em_fec_ini.text),time('00:00:00'))
	ldt_fech_fin		= datetime(date(em_fec_fin.text),time('23:59:59'))	
	if ldt_fech_ini <= ldt_fech_fin then	
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef)=0 then
			 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
		else
			dw_2.settransobject(sqlca)
			if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef)=0 then
					
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

type cb_1 from commandbutton within w_infome_general_grafico
integer x = 3758
integer y = 1544
integer width = 343
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_infome_general_grafico)
end event

type cb_mensual from commandbutton within w_infome_general_grafico
integer x = 50
integer y = 1552
integer width = 288
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mensual"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2,ls_cod_jef
date fecha1,fecha2
long ll_mes_actual,ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

SELECT 	"JEFE_VENTAS"."JEFE_VENTAS"  
INTO		:ls_cod_jef  
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
USING 	sqlca;
if sqlca.sqlcode=0 then

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
		if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef)=0 then
			 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
		else
			dw_2.settransobject(sqlca)
			if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef)=0 then
					
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

type cb_semestral from commandbutton within w_infome_general_grafico
integer x = 343
integer y = 1552
integer width = 288
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Semestral"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2,ls_cod_jef
date fecha1,fecha2
long ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

SELECT 	"JEFE_VENTAS"."JEFE_VENTAS"  
INTO		:ls_cod_jef  
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
USING 	sqlca;
if sqlca.sqlcode=0 then	
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
		if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef)=0 then
			 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
			 dw_2.reset()
		else
			dw_2.settransobject(sqlca)
			if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef)=0 then
					
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

type cb_anual from commandbutton within w_infome_general_grafico
integer x = 635
integer y = 1552
integer width = 288
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Anual"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin
string ls_fech,ls_fech2,ls_cod_jef
date fecha1,fecha2
long ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

SELECT 	"JEFE_VENTAS"."JEFE_VENTAS"  
INTO		:ls_cod_jef  
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
USING 	sqlca;
if sqlca.sqlcode=0 then	
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/01/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/12/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
	
	if ldt_fech_ini <= ldt_fech_fin then	
		dw_1.settransobject(sqlca)
		
		if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef)=0 then
			 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
			 dw_2.reset()
		else
			dw_2.settransobject(sqlca)
			if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef)=0 then
					
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

type cb_limpiar from commandbutton within w_infome_general_grafico
integer x = 1760
integer y = 1552
integer width = 302
integer height = 84
integer taborder = 80
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

w_infome_general_grafico.triggerevent(open!)

end event

type dw_1 from datawindow within w_infome_general_grafico
integer x = 23
integer y = 176
integer width = 2016
integer height = 1304
string title = "none"
string dataobject = "dw_general"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type gb_1 from groupbox within w_infome_general_grafico
integer x = 27
integer y = 1504
integer width = 919
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

