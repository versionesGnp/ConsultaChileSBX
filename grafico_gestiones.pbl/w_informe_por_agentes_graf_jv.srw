forward
global type w_informe_por_agentes_graf_jv from window
end type
type dw_3 from datawindow within w_informe_por_agentes_graf_jv
end type
type p_4 from picture within w_informe_por_agentes_graf_jv
end type
type p_3 from picture within w_informe_por_agentes_graf_jv
end type
type cb_2 from commandbutton within w_informe_por_agentes_graf_jv
end type
type dw_1 from datawindow within w_informe_por_agentes_graf_jv
end type
type cb_1 from commandbutton within w_informe_por_agentes_graf_jv
end type
type pb_consultar from picturebutton within w_informe_por_agentes_graf_jv
end type
type st_1 from statictext within w_informe_por_agentes_graf_jv
end type
type em_fec_ini from editmask within w_informe_por_agentes_graf_jv
end type
type em_fec_fin from editmask within w_informe_por_agentes_graf_jv
end type
type st_2 from statictext within w_informe_por_agentes_graf_jv
end type
type dw_2 from datawindow within w_informe_por_agentes_graf_jv
end type
type gb_1 from groupbox within w_informe_por_agentes_graf_jv
end type
type cb_limpiar from commandbutton within w_informe_por_agentes_graf_jv
end type
type gb_2 from groupbox within w_informe_por_agentes_graf_jv
end type
type cb_anual from commandbutton within w_informe_por_agentes_graf_jv
end type
type cb_semestral from commandbutton within w_informe_por_agentes_graf_jv
end type
type cb_mensual from commandbutton within w_informe_por_agentes_graf_jv
end type
end forward

global type w_informe_por_agentes_graf_jv from window
integer width = 4507
integer height = 1728
boolean titlebar = true
string title = "Tortas Agentes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_3 dw_3
p_4 p_4
p_3 p_3
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
pb_consultar pb_consultar
st_1 st_1
em_fec_ini em_fec_ini
em_fec_fin em_fec_fin
st_2 st_2
dw_2 dw_2
gb_1 gb_1
cb_limpiar cb_limpiar
gb_2 gb_2
cb_anual cb_anual
cb_semestral cb_semestral
cb_mensual cb_mensual
end type
global w_informe_por_agentes_graf_jv w_informe_por_agentes_graf_jv

type variables
string is_cod_jef,is_cod_sup,is_cod_age
end variables

on w_informe_por_agentes_graf_jv.create
this.dw_3=create dw_3
this.p_4=create p_4
this.p_3=create p_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.pb_consultar=create pb_consultar
this.st_1=create st_1
this.em_fec_ini=create em_fec_ini
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.dw_2=create dw_2
this.gb_1=create gb_1
this.cb_limpiar=create cb_limpiar
this.gb_2=create gb_2
this.cb_anual=create cb_anual
this.cb_semestral=create cb_semestral
this.cb_mensual=create cb_mensual
this.Control[]={this.dw_3,&
this.p_4,&
this.p_3,&
this.cb_2,&
this.dw_1,&
this.cb_1,&
this.pb_consultar,&
this.st_1,&
this.em_fec_ini,&
this.em_fec_fin,&
this.st_2,&
this.dw_2,&
this.gb_1,&
this.cb_limpiar,&
this.gb_2,&
this.cb_anual,&
this.cb_semestral,&
this.cb_mensual}
end on

on w_informe_por_agentes_graf_jv.destroy
destroy(this.dw_3)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.pb_consultar)
destroy(this.st_1)
destroy(this.em_fec_ini)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.gb_1)
destroy(this.cb_limpiar)
destroy(this.gb_2)
destroy(this.cb_anual)
destroy(this.cb_semestral)
destroy(this.cb_mensual)
end on

event open;if gs_depto='I' or gs_depto='B' or gs_depto='X' then	 	
	gf_centrar(w_informe_por_agentes_graf_jv)
	
//	dw_3.getchild('cod_jef',idw_detalle)
//	idw_detalle.settransobject(sqlca)
//	if idw_detalle.retrieve() = 0 then
//		idw_detalle.insertrow(0)
//	end if
	dw_3.getchild('cod_sup',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(gs_user)=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_3.getchild('agente',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve(gs_user,'')=0 then
		idw_detalle3.insertrow(0)
	end if
	dw_3.insertrow(0)
//	dw_3.setitem(1,'cod_sup',ls_nulo)
//	dw_3.setitem(1,'cod_jef',ls_nulo)
//	dw_3.setitem(1,'agente',ls_nulo)
//	dw_3.accepttext()
	
//	dw_1.getchild('cod_jef',idw_detalle2)
//	idw_detalle2.settransobject(sqlca)
//	if idw_detalle2.retrieve()=0 then
//		idw_detalle2.insertrow(0)
//	end if
//	dw_1.getchild('cod_sup',idw_detalle)
//		idw_detalle.settransobject(sqlca)
//	if idw_detalle.retrieve('')=0 then
//		idw_detalle.insertrow(0)
//	end if
	dw_1.insertrow(0)
	dw_1.accepttext()
	em_fec_ini.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
	em_fec_fin.text			= string(gdt_fec_sistema,'dd/mm/yyyy')	
else
	Messagebox("Error","Usted No Tiene Los Permisos Para Ver Esta Pantalla")
	close(w_informe_por_agentes_graf_jv)
end if	


end event

type dw_3 from datawindow within w_informe_por_agentes_graf_jv
integer x = 32
integer y = 48
integer width = 2414
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_supervisor_agente"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
//	CASE 'cod_jef'
//		dw_3.accepttext()
//		ls_jefe					= dw_3.getitemstring(1,'cod_jef')
//		dw_3.getchild('cod_sup',idw_detalle2)
//		idw_detalle2.settransobject(sqlca)
//		idw_detalle2.reset()
//		idw_detalle3.reset()
//		dw_3.setitem(1,'cod_sup',ls_nulo)
//		dw_3.setitem(1,'agente',ls_nulo)
//		if idw_detalle2.retrieve(ls_jefe)=0 then
//			idw_detalle2.insertrow(0)
//		end if
//		dw_3.accepttext()
	CASE 'cod_sup'
		dw_3.accepttext()
	//	ls_jefe					= dw_3.getitemstring(1,'cod_jef')
		ls_supervisor			= dw_3.getitemstring(1,'cod_sup')
		dw_3.getchild('agente',idw_detalle3)
		idw_detalle3.reset()
		dw_3.setitem(1,'agente',ls_nulo)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(ls_supervisor)=0 then
			idw_detalle3.insertrow(0)
		end if
		dw_3.accepttext()
	CASE 'agente'
		dw_3.accepttext()
END CHOOSE
end event

type p_4 from picture within w_informe_por_agentes_graf_jv
integer x = 1024
integer y = 1484
integer width = 78
integer height = 80
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_fec_fin.text)='00/00/0000' or trim(em_fec_fin.text)='' or &
	isnull(trim(em_fec_fin.text)) then	
	
	em_fec_fin.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if trim(em_fec_fin.text)<>'00/00/0000' and not isnull(trim(em_fec_fin.text)) and &
	trim(em_fec_fin.text)<>'' then
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
//dw_informe_mc.reset()
em_fec_fin.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_fin.text = Message.StringParm

//string ls_fecha,fech
//long uf
//
//if f_valida_fecha(em_fec_fin.text)=-1 then 
//	em_fec_fin.text=string(today(),gs_formato_fecha)
//	em_fec_fin.setfocus()
// 	return
//end if 
//if em_fec_ini.text<>'00/00/0000' then
//	ls_fecha = em_fec_fin.text
//else
//	ls_fecha = string(today(),gs_formato_fecha)
//end if 
//OpenWithParm(w_calendar,ls_fecha)
//
//IF Message.StringParm <> ls_fecha THEN
//	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
// 		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
// 		em_fec_fin.setfocus()
// 		return
//	else 
//		em_fec_fin.text = Message.StringParm
//	end if 
//END IF
//em_fec_fin.text 		= Message.StringParm
//em_fec_ini.text	= string(RelativeDate(date(em_fec_fin.text), -150),"dd/mm/yyyy")
end event

type p_3 from picture within w_informe_por_agentes_graf_jv
integer x = 494
integer y = 1484
integer width = 78
integer height = 80
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_fec_ini.text)='00/00/0000' or trim(em_fec_ini.text)='' or &
	isnull(trim(em_fec_ini.text)) then	
	em_fec_ini.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if trim(em_fec_ini.text)<>'00/00/0000' and not isnull(trim(em_fec_ini.text)) and &
	trim(em_fec_ini.text)<>'' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
//dw_informe_mc.reset()
em_fec_ini.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini.text = Message.StringParm

//string ls_fecha,fech
//long uf
//
//if f_valida_fecha(em_fec_ini.text)=-1 then 
// em_fec_ini.text=string(today(),gs_formato_fecha)
// em_fec_ini.setfocus()
// return
//end if 
//if em_fec_ini.text<>'00/00/0000' then
// ls_fecha = em_fec_ini.text
//else
// ls_fecha = string(today(),gs_formato_fecha)
//end if 
//OpenWithParm(w_calendar,ls_fecha)
//
//IF Message.StringParm <> ls_fecha THEN
// IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
//  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
//  em_fec_ini.setfocus()
//  return
// else 
//  em_fec_ini.text = Message.StringParm
// end if 
//END IF
end event

type cb_2 from commandbutton within w_informe_por_agentes_graf_jv
integer x = 2729
integer y = 1488
integer width = 448
integer height = 88
integer taborder = 70
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
close(w_informe_por_agentes_graf_jv)
end event

type dw_1 from datawindow within w_informe_por_agentes_graf_jv
integer x = 18
integer y = 176
integer width = 2203
integer height = 1244
string title = "none"
string dataobject = "dw_agente_vent_graf"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type cb_1 from commandbutton within w_informe_por_agentes_graf_jv
integer x = 4146
integer y = 1484
integer width = 320
integer height = 100
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_por_agentes_graf_jv)
end event

type pb_consultar from picturebutton within w_informe_por_agentes_graf_jv
integer x = 1152
integer y = 1464
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
//string ls_cod_jef,ls_cod_sup
  
//ls_cod_jef = 'JV4'
//ls_cod_sup = '084'
//is_cod_jef											= dw_3.getitemstring(1,'cod_jef')
is_cod_sup											= dw_3.getitemstring(1,'cod_sup')
is_cod_age											= dw_3.getitemstring(1,'agente')
if isnull(is_cod_sup) then
	Messagebox("Error","Debe Seleccionar un Supervisor")	
else
	ldt_fech_ini		= datetime(date(em_fec_ini.text),time('00:00:00'))
	ldt_fech_fin		= datetime(date(em_fec_fin.text),time('23:59:59'))	
	if ldt_fech_ini <= ldt_fech_fin then	
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin,gs_user,is_cod_sup,is_cod_age)=0 then
			 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
			 dw_2.reset()
		else
			dw_2.settransobject(sqlca)
			if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,gs_user,is_cod_sup,is_cod_age)=0 then	
			else
			end if
		end if	
	else
		Messagebox("Error","Rango de Fechas Invalido")
	end if
end if	
end event

type st_1 from statictext within w_informe_por_agentes_graf_jv
integer x = 14
integer y = 1496
integer width = 165
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

type em_fec_ini from editmask within w_informe_por_agentes_graf_jv
integer x = 183
integer y = 1484
integer width = 297
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

type em_fec_fin from editmask within w_informe_por_agentes_graf_jv
integer x = 713
integer y = 1484
integer width = 306
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

type st_2 from statictext within w_informe_por_agentes_graf_jv
integer x = 603
integer y = 1496
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

type dw_2 from datawindow within w_informe_por_agentes_graf_jv
integer x = 2245
integer y = 176
integer width = 2203
integer height = 1244
string title = "none"
string dataobject = "dw_agente_gestion_graf"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type gb_1 from groupbox within w_informe_por_agentes_graf_jv
integer x = 1541
integer y = 1444
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

type cb_limpiar from commandbutton within w_informe_por_agentes_graf_jv
integer x = 3182
integer y = 1492
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
em_fec_ini.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
w_informe_por_agentes_graf_jv.triggerevent(open!)




end event

type gb_2 from groupbox within w_informe_por_agentes_graf_jv
integer x = 2711
integer y = 1444
integer width = 795
integer height = 152
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_anual from commandbutton within w_informe_por_agentes_graf_jv
integer x = 2144
integer y = 1492
integer width = 288
integer height = 84
integer taborder = 60
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

//is_cod_jef											= dw_3.getitemstring(1,'cod_jef')
is_cod_sup											= dw_3.getitemstring(1,'cod_sup')
is_cod_age											= dw_3.getitemstring(1,'agente')

//SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
//INTO 	 :ls_cod_jef,   			:ls_cod_sup  
//FROM 	 "SUPERVISOR"  
//WHERE  "SUPERVISOR"."COD_SUP" = :gs_user  
//USING	sqlca;
//if sqlca.sqlcode =0 then
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/01/'+string(ll_ano_actual,'0000')
	ldt_fech_ini				= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/12/'+string(ll_ano_actual,'0000')
	ldt_fech_fin				= datetime(date(ls_fech2),time('00:00:00'))
	if ldt_fech_ini <= ldt_fech_fin then
			dw_1.settransobject(sqlca)
			if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin,gs_user,is_cod_sup,is_cod_age)=0 then
					 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
					 dw_1.reset()
					 dw_2.reset()
			else
				dw_2.settransobject(sqlca)
				if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,gs_user,is_cod_sup,is_cod_age)=0 then
						
				else
				end if
			end if	
		else
			Messagebox("Error","Rango de Fechas Invalido")
	end if
//else
//	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
//end if	
end event

type cb_semestral from commandbutton within w_informe_por_agentes_graf_jv
integer x = 1851
integer y = 1492
integer width = 288
integer height = 84
integer taborder = 50
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

//is_cod_jef											= dw_3.getitemstring(1,'cod_jef')
is_cod_sup											= dw_3.getitemstring(1,'cod_sup')
is_cod_age											= dw_3.getitemstring(1,'agente')

//SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
//INTO 	 :ls_cod_jef,   			:ls_cod_sup  
//FROM 	 "SUPERVISOR"  
//WHERE  "SUPERVISOR"."COD_SUP" = :gs_user   
//USING	sqlca;
//if sqlca.sqlcode =0 then
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/01/'+string(ll_ano_actual,'0000')
	ldt_fech_ini				= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '30/06/'+string(ll_ano_actual,'0000')
	ldt_fech_fin				= datetime(date(ls_fech2),time('00:00:00'))
	if gdt_fec_sistema > ldt_fech_fin then
		ls_fech				= '01/07/'+string(ll_ano_actual,'0000')
		ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
		ls_fech2				= '31/12/'+string(ll_ano_actual,'0000')
		ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
	end if
	if ldt_fech_ini <= ldt_fech_fin then
			dw_1.settransobject(sqlca)
			if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin,gs_user,is_cod_sup,is_cod_age)=0 then
				Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
				 dw_1.reset()
				 dw_2.reset()
			else
				dw_2.settransobject(sqlca)
				if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,gs_user,is_cod_sup,is_cod_age)=0 then
				else
				end if
			end if	
		else
			Messagebox("Error","Rango de Fechas Invalido")
	end if
//else
//	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
//end if	
end event

type cb_mensual from commandbutton within w_informe_por_agentes_graf_jv
integer x = 1559
integer y = 1492
integer width = 288
integer height = 84
integer taborder = 40
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
string ls_fech,ls_fech2 //,ls_cod_jef,ls_cod_sup
date fecha1,fecha2
long ll_mes_actual,ll_ano_actual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

//is_cod_jef											= dw_3.getitemstring(1,'cod_jef')
is_cod_sup											= dw_3.getitemstring(1,'cod_sup')
is_cod_age											= dw_3.getitemstring(1,'agente')
 
//SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
//INTO 	 :ls_cod_jef,   			:ls_cod_sup  
//FROM 	 "SUPERVISOR"  
//WHERE  "SUPERVISOR"."COD_SUP" = :gs_user   
//USING	 sqlca;
//if sqlca.sqlcode =0 then
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
			if dw_1.retrieve(ldt_fech_ini,ldt_fech_fin,gs_user,is_cod_sup,is_cod_age)=0 then
					 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
					 dw_1.reset()
					 dw_2.reset()
			else
				dw_2.settransobject(sqlca)
				if dw_2.retrieve(ldt_fech_ini,ldt_fech_fin,gs_user,is_cod_sup,is_cod_age)=0 then
				else
				end if
			end if	
	else
		Messagebox("Error","Rango de Fechas Invalido")
	end if
//else	
//	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
//end if
end event

