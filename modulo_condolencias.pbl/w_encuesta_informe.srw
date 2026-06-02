forward
global type w_encuesta_informe from window
end type
type st_parque from statictext within w_encuesta_informe
end type
type dw_parque from datawindow within w_encuesta_informe
end type
type st_maestro from statictext within w_encuesta_informe
end type
type st_1 from statictext within w_encuesta_informe
end type
type dw_tipo from datawindow within w_encuesta_informe
end type
type dw_maestro from datawindow within w_encuesta_informe
end type
type cb_imprimir from commandbutton within w_encuesta_informe
end type
type pb_aceptar from picturebutton within w_encuesta_informe
end type
type p_termino from picture within w_encuesta_informe
end type
type p_inicio from picture within w_encuesta_informe
end type
type st_desde from statictext within w_encuesta_informe
end type
type em_termino from editmask within w_encuesta_informe
end type
type em_inicio from editmask within w_encuesta_informe
end type
type st_hasta from statictext within w_encuesta_informe
end type
type dw_lista from datawindow within w_encuesta_informe
end type
type cb_cerrar from commandbutton within w_encuesta_informe
end type
type gb_periodo from groupbox within w_encuesta_informe
end type
end forward

global type w_encuesta_informe from window
integer width = 3648
integer height = 2408
boolean titlebar = true
string title = "Lista Encuesta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_parque st_parque
dw_parque dw_parque
st_maestro st_maestro
st_1 st_1
dw_tipo dw_tipo
dw_maestro dw_maestro
cb_imprimir cb_imprimir
pb_aceptar pb_aceptar
p_termino p_termino
p_inicio p_inicio
st_desde st_desde
em_termino em_termino
em_inicio em_inicio
st_hasta st_hasta
dw_lista dw_lista
cb_cerrar cb_cerrar
gb_periodo gb_periodo
end type
global w_encuesta_informe w_encuesta_informe

type variables
Long	il_mes,il_ano,il_row
end variables

on w_encuesta_informe.create
this.st_parque=create st_parque
this.dw_parque=create dw_parque
this.st_maestro=create st_maestro
this.st_1=create st_1
this.dw_tipo=create dw_tipo
this.dw_maestro=create dw_maestro
this.cb_imprimir=create cb_imprimir
this.pb_aceptar=create pb_aceptar
this.p_termino=create p_termino
this.p_inicio=create p_inicio
this.st_desde=create st_desde
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_hasta=create st_hasta
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.gb_periodo=create gb_periodo
this.Control[]={this.st_parque,&
this.dw_parque,&
this.st_maestro,&
this.st_1,&
this.dw_tipo,&
this.dw_maestro,&
this.cb_imprimir,&
this.pb_aceptar,&
this.p_termino,&
this.p_inicio,&
this.st_desde,&
this.em_termino,&
this.em_inicio,&
this.st_hasta,&
this.dw_lista,&
this.cb_cerrar,&
this.gb_periodo}
end on

on w_encuesta_informe.destroy
destroy(this.st_parque)
destroy(this.dw_parque)
destroy(this.st_maestro)
destroy(this.st_1)
destroy(this.dw_tipo)
destroy(this.dw_maestro)
destroy(this.cb_imprimir)
destroy(this.pb_aceptar)
destroy(this.p_termino)
destroy(this.p_inicio)
destroy(this.st_desde)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_hasta)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.gb_periodo)
end on

event open;datetime	ldt_fec_ini,ldt_fec_fin

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_encuesta_informe)
dw_lista.settransobject(sqlca)
dw_maestro.settransobject(sqlca)
dw_maestro.insertrow(0)
dw_tipo.settransobject(sqlca)
dw_tipo.insertrow(0)

ldt_fec_ini			= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
ldt_fec_fin			= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
em_inicio.text		= string(ldt_fec_ini,'dd/mm/yyyy')
em_termino.text	= string(ldt_fec_fin,'dd/mm/yyyy')

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type st_parque from statictext within w_encuesta_informe
boolean visible = false
integer x = 2295
integer y = 64
integer width = 261
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Parque:"
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_encuesta_informe
boolean visible = false
integer x = 2295
integer y = 128
integer width = 585
integer height = 80
integer taborder = 10
string title = "none"
string dataobject = "dwe_encuesta_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type st_maestro from statictext within w_encuesta_informe
boolean visible = false
integer x = 2295
integer y = 64
integer width = 535
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Maestro Ceremonia:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_encuesta_informe
integer x = 1079
integer y = 64
integer width = 361
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Tipo Informe:"
boolean focusrectangle = false
end type

type dw_tipo from datawindow within w_encuesta_informe
integer x = 1061
integer y = 128
integer width = 1019
integer height = 80
integer taborder = 60
string title = "none"
string dataobject = "dwe_tipo_informe"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long	ll_tipo_inf

dw_lista.reset()
dw_parque.reset()
dw_maestro.reset()
dw_tipo.accepttext()
ll_tipo_inf									= dw_tipo.getitemnumber(1,'tipo_infor')	
if ll_tipo_inf=1 then
	st_parque.visible			= false
	dw_parque.visible			= false
	st_maestro.visible			= true
	dw_maestro.visible		= true
	dw_maestro.settransobject(sqlca)
	dw_maestro.insertrow(0)
elseif  ll_tipo_inf=2 or ll_tipo_inf=6 then
	dw_parque.settransobject(sqlca)
	dw_parque.insertrow(0)
	st_parque.visible			= true
	dw_parque.visible			= true
	st_maestro.visible			= false
	dw_maestro.visible		= false
else
	st_parque.visible			= false
	dw_parque.visible			= false
	st_maestro.visible			= false
	dw_maestro.visible		= false
end if

end event

type dw_maestro from datawindow within w_encuesta_informe
boolean visible = false
integer x = 2277
integer y = 128
integer width = 1202
integer height = 80
integer taborder = 50
string title = "none"
string dataobject = "dwe_maestro_ceremonia"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()

end event

type cb_imprimir from commandbutton within w_encuesta_informe
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 2156
integer width = 306
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type pb_aceptar from picturebutton within w_encuesta_informe
integer x = 2085
integer y = 88
integer width = 142
integer height = 120
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_maestro
long		ll_tipo_inf,ll_cod_parque,ll_tot_reg
datetime	ldt_fec_ini,ldt_fec_fin

dw_tipo.accepttext()
dw_maestro.accepttext()
dw_parque.accepttext()
ldt_fec_ini												= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fec_fin												= datetime(date(em_termino.text),time('00:00:00'))
ll_tipo_inf												= dw_tipo.getitemnumber(1,'tipo_infor')	
if isnull(ll_tipo_inf) or ll_tipo_inf=0 then
	messagebox("Advertencia","Debe Selecionar Tipo Informe")
	dw_tipo.setfocus()
	dw_tipo.setcolumn('tipo_infor')
else
	if not isnull(ldt_fec_ini) and not isnull(ldt_fec_fin) then
		if ldt_fec_ini>ldt_fec_fin then
			messagebox("Advertencia","Rango Fecha Invalido")
		else
			if ll_tipo_inf=1 then
				dw_lista.dataobject					= 'dw_encuesta_lista_inf_maestro_ba'
			elseif ll_tipo_inf=2 then
				dw_lista.dataobject					= 'dw_encuesta_lista_inf_nota_preg_ba'
			elseif ll_tipo_inf=3 then	
				dw_lista.dataobject					= 'dw_encuesta_lista_inf_nota_ba'
			elseif ll_tipo_inf=4 then	
				dw_lista.dataobject					= 'dw_encuesta_lista_inf_resp2_ba'
			elseif ll_tipo_inf=5 then	
				dw_lista.dataobject					= 'dw_encuesta_lista_inf_efec_ba'
			elseif ll_tipo_inf=6 then	
				dw_lista.dataobject					= 'dw_encuesta_lista_inf_parque_ba'
			elseif ll_tipo_inf=7 then		
				dw_lista.dataobject					= 'dw_encuesta_lista_inf_tot_ba'
			end if
			dw_lista.settransobject(sqlca)
			if ll_tipo_inf=1 then
				ls_maestro								= dw_maestro.getitemstring(1,'cod_maestro')
				if isnull(ls_maestro) or ls_maestro='' then
					messagebox("Advertencia","Debe Selecionar Maestro Ceremonia")
					dw_maestro.setfocus()
					dw_maestro.setcolumn('cod_maestro')
				else
					UPDATE	"ENCUESTA_INFOR_PARAMETRO"  
     				SET 		"FECHA_INI" = :ldt_fec_ini,   
         						"FECHA_FIN" = :ldt_fec_fin,   
         						"MAESTRO" = :ls_maestro  
   					WHERE "ENCUESTA_INFOR_PARAMETRO"."TIPO_INFOR" = 1
					USING	sqlca;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
					else
						rollback using sqlca;
					end if
				end if	
			elseif ll_tipo_inf=2 or ll_tipo_inf=6 then
				ll_cod_parque							= dw_parque.getitemnumber(1,'parque')
				if isnull(ll_cod_parque) or ll_cod_parque=0 then
					messagebox("Advertencia","Debe Selecionar Parque")
					dw_parque.setfocus()
					dw_parque.setcolumn('parque')
				else
					UPDATE	"ENCUESTA_INFOR_PARAMETRO"  
     				SET 		"FECHA_INI" = :ldt_fec_ini,   
         						"FECHA_FIN" = :ldt_fec_fin,   
         						"COD_PARQUE" = :ll_cod_parque  
   					WHERE	("ENCUESTA_INFOR_PARAMETRO"."TIPO_INFOR" = 2 OR "ENCUESTA_INFOR_PARAMETRO"."TIPO_INFOR" = 6)
					USING	sqlca;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
					else
						rollback using sqlca;
					end if
				end if
			else
				UPDATE	"ENCUESTA_INFOR_PARAMETRO"  
				SET 		"FECHA_INI" = :ldt_fec_ini,   
							"FECHA_FIN" = :ldt_fec_fin
				WHERE	("ENCUESTA_INFOR_PARAMETRO"."TIPO_INFOR" = 3 OR "ENCUESTA_INFOR_PARAMETRO"."TIPO_INFOR" = 4 OR "ENCUESTA_INFOR_PARAMETRO"."TIPO_INFOR" = 5 OR "ENCUESTA_INFOR_PARAMETRO"."TIPO_INFOR" = 7)
				USING	sqlca;
				if sqlca.sqlcode = 0 then
						commit using sqlca;
					else
						rollback using sqlca;
					end if
			end if
			ll_tot_reg									= dw_lista.retrieve(ll_tipo_inf)
			if ll_tot_reg>0 then
				dw_lista.object.usuario.text			= gs_user
			end if
		end if
	end if
end if
end event

type p_termino from picture within w_encuesta_informe
integer x = 901
integer y = 124
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha

dw_lista.reset()
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF
dw_lista.reset()
end event

type p_inicio from picture within w_encuesta_informe
integer x = 407
integer y = 124
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha

dw_lista.reset()
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	

if em_inicio.text<>'00/00/0000' then
	ls_fecha = em_inicio.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
END IF
dw_lista.reset()
end event

type st_desde from statictext within w_encuesta_informe
integer x = 155
integer y = 72
integer width = 187
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type em_termino from editmask within w_encuesta_informe
integer x = 549
integer y = 128
integer width = 347
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;dw_lista.reset()

end event

type em_inicio from editmask within w_encuesta_informe
integer x = 59
integer y = 128
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;dw_lista.reset()

end event

type st_hasta from statictext within w_encuesta_informe
integer x = 677
integer y = 72
integer width = 165
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_encuesta_informe
integer x = 37
integer y = 256
integer width = 3552
integer height = 1856
integer taborder = 60
string title = "none"
string dataobject = "dw_encuesta_lista_inf_parque_ba"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_encuesta_informe
integer x = 3282
integer y = 2156
integer width = 306
integer height = 96
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_encuesta_informe)
end event

type gb_periodo from groupbox within w_encuesta_informe
integer x = 37
integer y = 16
integer width = 969
integer height = 216
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Período"
end type

