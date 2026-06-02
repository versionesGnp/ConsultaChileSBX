forward
global type w_actualizar_sup_agentes from window
end type
type dw_lista from datawindow within w_actualizar_sup_agentes
end type
type pb_aceptar_fallecidos from picturebutton within w_actualizar_sup_agentes
end type
type st_inicio from statictext within w_actualizar_sup_agentes
end type
type fec_fin_ugn_falle from editmask within w_actualizar_sup_agentes
end type
type p_2 from picture within w_actualizar_sup_agentes
end type
type st_fin from statictext within w_actualizar_sup_agentes
end type
type fec_ini_ugn_falle from editmask within w_actualizar_sup_agentes
end type
type p_1 from picture within w_actualizar_sup_agentes
end type
type dw_parque from datawindow within w_actualizar_sup_agentes
end type
type cb_fallecidos from commandbutton within w_actualizar_sup_agentes
end type
type cb_agente from commandbutton within w_actualizar_sup_agentes
end type
type cb_actualizar from commandbutton within w_actualizar_sup_agentes
end type
type cb_supervisor from commandbutton within w_actualizar_sup_agentes
end type
type cb_cerrar from commandbutton within w_actualizar_sup_agentes
end type
type st_1 from statictext within w_actualizar_sup_agentes
end type
type sle_n_grupo from singlelineedit within w_actualizar_sup_agentes
end type
type pb_aceptar from picturebutton within w_actualizar_sup_agentes
end type
type gb_5 from groupbox within w_actualizar_sup_agentes
end type
type gb_3 from groupbox within w_actualizar_sup_agentes
end type
type dw_cambiar_datos from datawindow within w_actualizar_sup_agentes
end type
type mle_1 from multilineedit within w_actualizar_sup_agentes
end type
type gb_1 from groupbox within w_actualizar_sup_agentes
end type
type gb_2 from groupbox within w_actualizar_sup_agentes
end type
end forward

global type w_actualizar_sup_agentes from window
integer width = 2775
integer height = 2620
boolean titlebar = true
string title = "Actualizar Grupos Condolencias"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_lista dw_lista
pb_aceptar_fallecidos pb_aceptar_fallecidos
st_inicio st_inicio
fec_fin_ugn_falle fec_fin_ugn_falle
p_2 p_2
st_fin st_fin
fec_ini_ugn_falle fec_ini_ugn_falle
p_1 p_1
dw_parque dw_parque
cb_fallecidos cb_fallecidos
cb_agente cb_agente
cb_actualizar cb_actualizar
cb_supervisor cb_supervisor
cb_cerrar cb_cerrar
st_1 st_1
sle_n_grupo sle_n_grupo
pb_aceptar pb_aceptar
gb_5 gb_5
gb_3 gb_3
dw_cambiar_datos dw_cambiar_datos
mle_1 mle_1
gb_1 gb_1
gb_2 gb_2
end type
global w_actualizar_sup_agentes w_actualizar_sup_agentes

type variables
Long	il_grupo,il_row
end variables

on w_actualizar_sup_agentes.create
this.dw_lista=create dw_lista
this.pb_aceptar_fallecidos=create pb_aceptar_fallecidos
this.st_inicio=create st_inicio
this.fec_fin_ugn_falle=create fec_fin_ugn_falle
this.p_2=create p_2
this.st_fin=create st_fin
this.fec_ini_ugn_falle=create fec_ini_ugn_falle
this.p_1=create p_1
this.dw_parque=create dw_parque
this.cb_fallecidos=create cb_fallecidos
this.cb_agente=create cb_agente
this.cb_actualizar=create cb_actualizar
this.cb_supervisor=create cb_supervisor
this.cb_cerrar=create cb_cerrar
this.st_1=create st_1
this.sle_n_grupo=create sle_n_grupo
this.pb_aceptar=create pb_aceptar
this.gb_5=create gb_5
this.gb_3=create gb_3
this.dw_cambiar_datos=create dw_cambiar_datos
this.mle_1=create mle_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_lista,&
this.pb_aceptar_fallecidos,&
this.st_inicio,&
this.fec_fin_ugn_falle,&
this.p_2,&
this.st_fin,&
this.fec_ini_ugn_falle,&
this.p_1,&
this.dw_parque,&
this.cb_fallecidos,&
this.cb_agente,&
this.cb_actualizar,&
this.cb_supervisor,&
this.cb_cerrar,&
this.st_1,&
this.sle_n_grupo,&
this.pb_aceptar,&
this.gb_5,&
this.gb_3,&
this.dw_cambiar_datos,&
this.mle_1,&
this.gb_1,&
this.gb_2}
end on

on w_actualizar_sup_agentes.destroy
destroy(this.dw_lista)
destroy(this.pb_aceptar_fallecidos)
destroy(this.st_inicio)
destroy(this.fec_fin_ugn_falle)
destroy(this.p_2)
destroy(this.st_fin)
destroy(this.fec_ini_ugn_falle)
destroy(this.p_1)
destroy(this.dw_parque)
destroy(this.cb_fallecidos)
destroy(this.cb_agente)
destroy(this.cb_actualizar)
destroy(this.cb_supervisor)
destroy(this.cb_cerrar)
destroy(this.st_1)
destroy(this.sle_n_grupo)
destroy(this.pb_aceptar)
destroy(this.gb_5)
destroy(this.gb_3)
destroy(this.dw_cambiar_datos)
destroy(this.mle_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;gf_centrar(w_actualizar_sup_agentes)

dw_cambiar_datos.settransobject(sqlca)
//dw_cambiar_datos.insertrow(0)

dw_cambiar_datos.getchild('cod_age',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('')=0 then idw_detalle.insertrow(0)
dw_cambiar_datos.insertrow(0)
dw_cambiar_datos.accepttext()

dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)


fec_ini_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
fec_fin_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')

w_actualizar_sup_agentes.height	= 1230

cb_supervisor.x	= 41
cb_supervisor.y	= 952
cb_agente.x		= 288
cb_agente.y		= 952
cb_fallecidos.x	= 535
cb_fallecidos.y	= 952
cb_actualizar.x	= 1211
cb_actualizar.y	= 952
cb_cerrar.x		= 2386
cb_cerrar.y		= 952

gb_2.x			= 37
gb_2.y			= 1200
gb_3.x			= 64
gb_3.y			= 1252
gb_5.x			= 987
gb_5.y			= 1252
st_inicio.x		= 1015
st_inicio.y		= 1340
st_fin.x			= 1595
st_fin.y			= 1340
p_1.x				= 1481
p_1.y				= 1320
p_2.x				= 2080
p_2.y				= 1320
fec_ini_ugn_falle.x			= 1147
fec_ini_ugn_falle.y			= 1320
fec_fin_ugn_falle.x			= 1751
fec_fin_ugn_falle.y			= 1320
pb_aceptar_fallecidos.x	= 2235
pb_aceptar_fallecidos.y	= 1300
dw_parque.x	= 91
dw_parque.y	= 1316
dw_lista.x		= 59
dw_lista.y		= 1480


il_grupo			= Long(Message.StringParm)
sle_n_grupo.text	= String(il_grupo)
pb_aceptar.triggerevent(clicked!)


end event

type dw_lista from datawindow within w_actualizar_sup_agentes
integer x = 59
integer y = 1220
integer width = 2606
integer height = 1016
integer taborder = 80
string title = "none"
string dataobject = "dw_ugn_asigna_falle"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;datetime	ldt_fech_sepul
string	ls_nombre,ls_a_pater,ls_a_mater,ls_dv,ls_base,ls_serie
long ll_row,ll_rut
Double	ll_numero

ll_row = dw_lista.getrow()

if ll_row > 0 then
	ls_nombre	= dw_lista.getitemstring(ll_row,"nombre_fallecido")
	ls_a_pater	= dw_lista.getitemstring(ll_row,"ap_paterno_fall")
	ls_a_mater	= dw_lista.getitemstring(ll_row,"ap_materno_fall")
	ll_rut			= dw_lista.getitemnumber(ll_row,"rut_fallecido")
	ls_dv			= dw_lista.getitemstring(ll_row,"dv_fallecido")
	ls_base		= dw_lista.getitemstring(ll_row,"base")
	ls_serie		= dw_lista.getitemstring(ll_row,"serie")
	ll_numero	= dw_lista.getitemnumber(ll_row,"numero")
	
	dw_cambiar_datos.setitem(1,"nombre_fallecido",ls_nombre)
	dw_cambiar_datos.setitem(1,"a_paterno_fallecido",ls_a_pater)
	dw_cambiar_datos.setitem(1,"a_materno_fallecido",ls_a_mater)
	dw_cambiar_datos.setitem(1,"base",ls_base)
	dw_cambiar_datos.setitem(1,"serie",ls_serie)
	dw_cambiar_datos.setitem(1,"numero",ll_numero)
	dw_cambiar_datos.setitem(1,"rut_fallecido",ll_rut)
	dw_cambiar_datos.setitem(1,"dv",ls_dv)
end if	
end event

event itemchanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type pb_aceptar_fallecidos from picturebutton within w_actualizar_sup_agentes
integer x = 2235
integer y = 1040
integer width = 133
integer height = 120
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\Desarrollo_pb7\LUPA.BMP"
alignment htextalign = left!
end type

event clicked;datetime ldt_fec_ini,ldt_fec_fin
long		ll_parque

SetPointer(HourGlass!)
dw_lista.reset()
ldt_fec_ini						= datetime(date(fec_ini_ugn_falle.text),time('00:00:00'))
ldt_fec_fin						= datetime(date(fec_fin_ugn_falle.text),time('23:59:59'))

ll_parque					= dw_parque.getitemnumber(1,'parque')
if ll_parque > 0 then
	if ldt_fec_ini <= ldt_fec_fin then
		if dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin,ll_parque)=0 then
			messagebox("Advertencia","No Registra Dato")
		else
			dw_lista.setfocus()
		end if
	else
		Messagebox("Advertencia","Fecha Inicial no Puede ser Mayor a la Final")
		fec_ini_ugn_falle.setfocus()
	end if
else
	Messagebox("Advertencia","Debe Ingresar Parque")
		dw_parque.setfocus()
end if
SetPointer(Arrow!)
end event

type st_inicio from statictext within w_actualizar_sup_agentes
integer x = 1015
integer y = 1080
integer width = 123
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio"
alignment alignment = right!
boolean focusrectangle = false
end type

type fec_fin_ugn_falle from editmask within w_actualizar_sup_agentes
integer x = 1751
integer y = 1060
integer width = 325
integer height = 84
integer taborder = 60
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type p_2 from picture within w_actualizar_sup_agentes
integer x = 2080
integer y = 1060
integer width = 78
integer height = 80
integer taborder = 140
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(fec_fin_ugn_falle.text)=-1 then 
	fec_fin_ugn_falle.text=string(today(),gs_formato_fecha)
	fec_fin_ugn_falle.setfocus()
	return
end if 
if fec_fin_ugn_falle.text<>'00/00/0000' then
	ls_fecha = fec_fin_ugn_falle.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(fec_fin_ugn_falle.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		fec_fin_ugn_falle.setfocus()
		return
	else 
		fec_fin_ugn_falle.text = Message.StringParm
	end if 
END IF
end event

type st_fin from statictext within w_actualizar_sup_agentes
integer x = 1595
integer y = 1080
integer width = 137
integer height = 56
boolean bringtotop = true
integer textsize = -8
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

type fec_ini_ugn_falle from editmask within w_actualizar_sup_agentes
integer x = 1147
integer y = 1060
integer width = 325
integer height = 84
integer taborder = 50
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type p_1 from picture within w_actualizar_sup_agentes
integer x = 1481
integer y = 1060
integer width = 78
integer height = 80
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
long		uf

if f_valida_fecha(fec_ini_ugn_falle.text)=-1 then 
	fec_ini_ugn_falle.text=string(today(),gs_formato_fecha)
	fec_ini_ugn_falle.setfocus()
	return
end if 
if fec_ini_ugn_falle.text<>'00/00/0000' then
	ls_fecha = fec_ini_ugn_falle.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

if Message.StringParm <> ls_fecha THEN
	if DATE(Message.StringParm)>DATE(fec_ini_ugn_falle.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		fec_ini_ugn_falle.setfocus()
		return
	else 
		fec_ini_ugn_falle.text = Message.StringParm
	end if 
end if
end event

type dw_parque from datawindow within w_actualizar_sup_agentes
integer x = 91
integer y = 1056
integer width = 814
integer height = 100
integer taborder = 40
string title = "none"
string dataobject = "dwe_parque_condolencias"
boolean border = false
boolean livescroll = true
end type

type cb_fallecidos from commandbutton within w_actualizar_sup_agentes
integer x = 535
integer y = 2316
integer width = 265
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fallecidos"
end type

event clicked;w_actualizar_sup_agentes.height	= 2600
gf_centrar(w_actualizar_sup_agentes)
cb_supervisor.x	= 41
cb_supervisor.y	= 2324
cb_agente.x		= 288
cb_agente.y		= 2324
cb_fallecidos.x	= 535
cb_fallecidos.y	= 2324
cb_actualizar.x	= 1211
cb_actualizar.y	= 2324
cb_cerrar.x		= 2386
cb_cerrar.y		= 2324

gb_2.x			= 37
gb_2.y			= 940
gb_3.x			= 64
gb_3.y			= 992
gb_5.x			= 987
gb_5.y			= 992
st_inicio.x		= 1015
st_inicio.y		= 1080
st_fin.x			= 1595
st_fin.y			= 1080
p_1.x				= 1481
p_1.y				= 1060
p_2.x				= 2080
p_2.y				= 1060
fec_ini_ugn_falle.x			= 1147
fec_ini_ugn_falle.y			= 1060
fec_fin_ugn_falle.x			= 1751
fec_fin_ugn_falle.y			= 1060
pb_aceptar_fallecidos.x	= 2235
pb_aceptar_fallecidos.y	= 1040
dw_parque.x	= 91
dw_parque.y	= 1056
dw_lista.x		= 59
dw_lista.y		= 1220


end event

type cb_agente from commandbutton within w_actualizar_sup_agentes
integer x = 288
integer y = 2316
integer width = 233
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Agentes"
end type

event clicked;string ls_opcion

ls_opcion		= '3'
openwithparm(w_lista_codigos,ls_opcion)
end event

type cb_actualizar from commandbutton within w_actualizar_sup_agentes
integer x = 1211
integer y = 2316
integer width = 315
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualizar"
end type

event clicked;string		ls_cod_sup,ls_cod_age	
long		ll_parque,ll_cont_sup,ll_count_age,ll_num_grupo

ll_parque			= dw_cambiar_datos.getitemnumber(1,'parque')
ls_cod_sup		= dw_cambiar_datos.getitemstring(1,'cod_sup')
ls_cod_age		= dw_cambiar_datos.getitemstring(1,'cod_age')
ll_num_grupo	= long(sle_n_grupo.text)
dw_cambiar_datos.accepttext()
if ll_parque > 0 then
	if	not isnull(ls_cod_sup ) and ls_cod_sup <>'' then
		if not isnull(ls_cod_age ) and ls_cod_age <>'' then
			SELECT count("SUPERVISOR"."COD_SUP")  
			INTO 	   :ll_cont_sup  
    			FROM   "SUPERVISOR"  
   			WHERE "SUPERVISOR"."COD_SUP" = :ls_cod_sup and
					   "SUPERVISOR"."ESTADO" = 'A'
			USING   sqlca;
			if ll_cont_sup > 0 then
				SELECT 	count("AGENTES"."COD_AGE")  
				INTO 		:ll_count_age  
				FROM		 "AGENTES"  
				WHERE 	( "AGENTES"."COD_AGE" = :ls_cod_age ) AND  
							( "AGENTES"."ESTADO" = 'A' )   
				USING	sqlca;
				if ll_count_age > 0 then
					if dw_cambiar_datos.update()=1 then
						commit;
						messagebox("Grabar","Grabación Exitosa")
						dw_cambiar_datos.retrieve(ll_num_grupo)
						close(w_actualizar_sup_agentes)
					else
						rollback;
						messagebox("Error","Error al Grabar "+SQLCA.SQLErrText)
					end if	
				else
					messagebox ("Advertencia","Codigo Agente no Existe o No esta Activo")
				end if	
			else
				messagebox ("Advertencia","Codigo Supervisor no Existe o No esta Activo")
			end if	
		else
			messagebox ("Advertencia","Debe Ingresar Codigo de Agente")
		end if	
	else
		messagebox ("Advertencia","Debe Ingresar Codigo de Supervisor")
	end if
else 
	messagebox ("Advertencia","Debe Ingresar Parque")
end if	
end event

type cb_supervisor from commandbutton within w_actualizar_sup_agentes
integer x = 41
integer y = 2316
integer width = 233
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Superv"
end type

event clicked;string ls_opcion

ls_opcion		= '2'
openwithparm(w_lista_codigos,ls_opcion)
end event

type cb_cerrar from commandbutton within w_actualizar_sup_agentes
integer x = 2386
integer y = 2316
integer width = 306
integer height = 96
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_actualizar_sup_agentes)
end event

type st_1 from statictext within w_actualizar_sup_agentes
integer x = 55
integer y = 60
integer width = 448
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Nº Grupo"
boolean focusrectangle = false
end type

type sle_n_grupo from singlelineedit within w_actualizar_sup_agentes
integer x = 512
integer y = 40
integer width = 357
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type pb_aceptar from picturebutton within w_actualizar_sup_agentes
boolean visible = false
integer x = 987
integer y = 16
integer width = 165
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long	ll_num_grupo,ll_count_grupo

ll_num_grupo	= long(sle_n_grupo.text)

if not isnull(ll_num_grupo) and ll_num_grupo <> 0 then
	SELECT	 count("UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO")  
	INTO 		:ll_count_grupo  
	FROM 	"UGN_CLIENTE_ASIGNAR_FALLE"  
	WHERE	 "UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" = :ll_num_grupo
	USING	sqlca;
	if ll_count_grupo > 0 then
		dw_cambiar_datos.retrieve(ll_num_grupo)
	else
		messagebox("Advertencia","Nº de Grupo No Existe")
		dw_cambiar_datos.reset()
		dw_cambiar_datos.insertrow(0)
	end if	
else
	messagebox("Advertencia","No ha Ingresado un Numero de Grupo")
end if
end event

type gb_5 from groupbox within w_actualizar_sup_agentes
integer x = 987
integer y = 992
integer width = 1211
integer height = 204
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango de Fechas"
end type

type gb_3 from groupbox within w_actualizar_sup_agentes
integer x = 64
integer y = 992
integer width = 859
integer height = 204
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
end type

type dw_cambiar_datos from datawindow within w_actualizar_sup_agentes
integer x = 64
integer y = 248
integer width = 2597
integer height = 576
integer taborder = 30
string title = "none"
string dataobject = "dw_cambio_sup_agente"
boolean border = false
boolean livescroll = true
end type

event losefocus;string		ls_cod_sup,ls_cod_age	
long		ll_cont_sup,ll_count_age

ls_cod_sup		= dw_cambiar_datos.getitemstring(1,'cod_sup')
ls_cod_age		= dw_cambiar_datos.getitemstring(1,'cod_age')
dw_cambiar_datos.accepttext()
if not isnull(ls_cod_age ) and ls_cod_age <>'' then
	SELECT count("SUPERVISOR"."COD_SUP")  
	INTO 	   :ll_cont_sup  
    	FROM   "SUPERVISOR"  
   	WHERE "SUPERVISOR"."COD_SUP" = :ls_cod_sup and
			   "SUPERVISOR"."ESTADO" = 'A'
	USING   sqlca;
		if ll_cont_sup > 0 then
			SELECT 	count("AGENTES"."COD_AGE")  
			INTO 		:ll_count_age  
			FROM		 "AGENTES"  
			WHERE 	( "AGENTES"."COD_AGE" = :ls_cod_age ) AND  
						( "AGENTES"."ESTADO" = 'A' )   
			USING	sqlca;
			if ll_count_age > 0 then
			else
				messagebox ("Advertencia","Codigo Agente no Existe o No esta Activo")
			end if	
		end if
end if			
end event

event itemfocuschanged;string		ls_cod_sup,ls_cod_age	
long		ll_cont_sup,ll_count_age

ls_cod_sup		= dw_cambiar_datos.getitemstring(1,'cod_sup')
ls_cod_age		= dw_cambiar_datos.getitemstring(1,'cod_age')
dw_cambiar_datos.accepttext()
if not isnull(ls_cod_age ) and ls_cod_age <>'' then
	SELECT count("SUPERVISOR"."COD_SUP")  
	INTO 	   :ll_cont_sup  
    	FROM   "SUPERVISOR"  
   	WHERE "SUPERVISOR"."COD_SUP" = :ls_cod_sup and
			   "SUPERVISOR"."ESTADO" = 'A'
	USING   sqlca;
		if ll_cont_sup > 0 then
			SELECT 	count("AGENTES"."COD_AGE")  
			INTO 		:ll_count_age  
			FROM		 "AGENTES"  
			WHERE 	( "AGENTES"."COD_AGE" = :ls_cod_age ) AND  
						( "AGENTES"."ESTADO" = 'A' )   
			USING	sqlca;
			if ll_count_age > 0 then
			else
				messagebox ("Advertencia","Codigo Agente no Existe o No esta Activo")
			end if	
		end if
end if		
end event

event itemchanged;string ls_superv,ls_nulo,ls_columna

Setnull(ls_nulo)
ls_columna											= dwo.name
dw_cambiar_datos.accepttext()
if ls_columna = 'cod_sup' then
	dw_cambiar_datos.setitem(1,'cod_age',ls_nulo)
	dw_cambiar_datos.accepttext()
	ls_superv										= dw_cambiar_datos.getitemstring(1,'cod_sup')
	idw_detalle.retrieve(ls_superv)
END IF


end event

type mle_1 from multilineedit within w_actualizar_sup_agentes
integer x = 55
integer y = 244
integer width = 2610
integer height = 588
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_actualizar_sup_agentes
integer x = 41
integer y = 180
integer width = 2656
integer height = 696
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos Grupo"
end type

type gb_2 from groupbox within w_actualizar_sup_agentes
integer x = 37
integer y = 940
integer width = 2656
integer height = 1320
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista de Fallecidos"
end type

