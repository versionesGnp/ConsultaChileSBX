forward
global type w_ranking_condolencias from window
end type
type p_fin from picture within w_ranking_condolencias
end type
type st_3 from statictext within w_ranking_condolencias
end type
type p_ini from picture within w_ranking_condolencias
end type
type em_fec_ini from editmask within w_ranking_condolencias
end type
type st_2 from statictext within w_ranking_condolencias
end type
type em_fec_fin from editmask within w_ranking_condolencias
end type
type pb_ok from picturebutton within w_ranking_condolencias
end type
type cb_imprimir from commandbutton within w_ranking_condolencias
end type
type cb_exportar from commandbutton within w_ranking_condolencias
end type
type cb_filtrar from commandbutton within w_ranking_condolencias
end type
type cb_cerrar from commandbutton within w_ranking_condolencias
end type
type gb_1 from groupbox within w_ranking_condolencias
end type
type dw_lista from datawindow within w_ranking_condolencias
end type
end forward

global type w_ranking_condolencias from window
integer width = 3616
integer height = 2088
boolean titlebar = true
string title = "Informe Encuesta Servicio Maestro Condolencias"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
p_fin p_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
em_fec_fin em_fec_fin
pb_ok pb_ok
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
gb_1 gb_1
dw_lista dw_lista
end type
global w_ranking_condolencias w_ranking_condolencias

type variables
long	il_row
end variables

on w_ranking_condolencias.create
this.p_fin=create p_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.pb_ok=create pb_ok
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.dw_lista=create dw_lista
this.Control[]={this.p_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.em_fec_fin,&
this.pb_ok,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_cerrar,&
this.gb_1,&
this.dw_lista}
end on

on w_ranking_condolencias.destroy
destroy(this.p_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.pb_ok)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_ranking_condolencias)
dw_lista.dataobject			= 'dwe_ranking_condolencias'
dw_lista.settransobject(sqlca)
em_fec_ini.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')

end event

type p_fin from picture within w_ranking_condolencias
integer x = 1486
integer y = 32
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
		dw_lista.reset()
	end if	
END IF
end event

type st_3 from statictext within w_ranking_condolencias
integer x = 933
integer y = 40
integer width = 169
integer height = 72
integer textsize = -10
integer weight = 700
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

type p_ini from picture within w_ranking_condolencias
integer x = 846
integer y = 32
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
		dw_lista.reset()
	end if	
END IF
end event

type em_fec_ini from editmask within w_ranking_condolencias
integer x = 485
integer y = 32
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_ranking_condolencias
integer x = 32
integer y = 40
integer width = 439
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fechas:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_ranking_condolencias
integer x = 1125
integer y = 32
integer width = 357
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type pb_ok from picturebutton within w_ranking_condolencias
integer x = 1618
integer y = 12
integer width = 137
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string		ls_usuario_mc,ls_nombre_falle,ls_ap_falle
long		ll_cant_reg,ll_new,ll_prom,ll_prom_tot,ll_cant_fono_p,ll_cant_cel,ll_cant_serv,&
			ll_pond_reg,ll_pond_ser,ll_count_serv,ll_cant_restar
double	ll_nota_serv,ll_nota_mc,ll_nota_prom,ll_pond_nota,ll_ptje_tot
datetime	ldt_fec_ini,ldt_fec_fin

dw_lista.reset()
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		ldt_fec_ini														= datetime(date(em_fec_ini.text),time('00:00:00'))
		ldt_fec_fin														= datetime(date(em_fec_fin.text),time('00:00:00'))
		if ldt_fec_ini>ldt_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			dw_lista.object.usuario.text								= gs_user
			dw_lista.object.titulo_t.text								='Período del '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string( ldt_fec_fin,'dd/mm/yyyy')
			DECLARE x1 CURSOR FOR
			SELECT DISTINCT	"UGN_CLIENTE_ASIGNAR_FALLE"."USUARIO_CREADOR"  
			FROM 	"ENCARGADOS",   
						"UGN_CLIENTE_ASIGNAR_FALLE"  
			WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = "UGN_CLIENTE_ASIGNAR_FALLE"."USUARIO_CREADOR" and
						"UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" >= :ldt_fec_ini AND  
						"UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" <= :ldt_fec_fin
			USING	sqlca;			
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ls_usuario_mc;
					if not isnull(ls_usuario_mc) and ls_usuario_mc<>'' then
						dw_lista.object.usuario.text				= gs_user
						SELECT DISTINCT	count("UGN_CLIENTE_ASIGNAR_FALLE"."RUT_FALLECIDO")
						INTO		:ll_cant_serv
						FROM 	"UGN_CLIENTE_ASIGNAR_FALLE"  
						WHERE   "UGN_CLIENTE_ASIGNAR_FALLE"."USUARIO_CREADOR" = :ls_usuario_mc AND  
									"UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_SEPULTACION" >= :ldt_fec_ini AND 
									"UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_SEPULTACION" <= :ldt_fec_fin
						USING	sqlca;
						
						SELECT 	count("UGN_CLIENTE"."FONO_P")
						INTO		:ll_cant_fono_p
						FROM 	"UGN_CLIENTE","UGN_CLIENTE_ASIGNAR_FALLE"  
						WHERE   "UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" = "UGN_CLIENTE"."GRUPO" and  
									"UGN_CLIENTE_ASIGNAR_FALLE"."USUARIO_CREADOR" = :ls_usuario_mc  AND  
									"UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" >= :ldt_fec_ini AND  
									"UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" <= :ldt_fec_fin and
									length("UGN_CLIENTE"."FONO_P")>=5
						USING	sqlca;

						SELECT 	count("UGN_CLIENTE"."CELULAR")
						INTO		:ll_cant_cel
						FROM 	"UGN_CLIENTE","UGN_CLIENTE_ASIGNAR_FALLE"  
						WHERE   "UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" = "UGN_CLIENTE"."GRUPO" and  
									"UGN_CLIENTE_ASIGNAR_FALLE"."USUARIO_CREADOR" = :ls_usuario_mc  AND  
									"UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" >= :ldt_fec_ini AND  
									"UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" <= :ldt_fec_fin and
									length("UGN_CLIENTE"."CELULAR")>=5
						USING	sqlca;
						
						SELECT 	count("UGN_CLIENTE"."FONO_P")
						INTO		:ll_cant_restar
						FROM 	"UGN_CLIENTE","UGN_CLIENTE_ASIGNAR_FALLE"  
						WHERE   "UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" = "UGN_CLIENTE"."GRUPO" and  
									"UGN_CLIENTE_ASIGNAR_FALLE"."USUARIO_CREADOR" = :ls_usuario_mc  AND  
									"UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" >= :ldt_fec_ini AND  
									"UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" <= :ldt_fec_fin and
									length("UGN_CLIENTE"."FONO_P")>=5 and
									length("UGN_CLIENTE"."CELULAR")>=5
						USING	sqlca;
						
						SELECT count("UGN_ENCUESTA_SERVICIO"."NOTA_SERVICIO")
						 INTO    :ll_count_serv  
						 FROM  "UGN_ENCUESTA_SERVICIO","UGN_CLIENTE","UGN_CLIENTE_ASIGNAR_FALLE"  
						WHERE "UGN_ENCUESTA_SERVICIO"."GRUPO" = "UGN_CLIENTE"."GRUPO" and  
								  "UGN_ENCUESTA_SERVICIO"."CORRELATIVO" = "UGN_CLIENTE"."CORRELATIVO" and  
								  "UGN_CLIENTE"."GRUPO" = "UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" and  
								  "UGN_CLIENTE_ASIGNAR_FALLE"."USUARIO_CREADOR" = :ls_usuario_mc AND  
								  "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" >= :ldt_fec_ini AND  
								  "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" <= :ldt_fec_fin AND  
								  "UGN_ENCUESTA_SERVICIO"."NOTA_SERVICIO" > 0 
						USING sqlca;
						
						SELECT sum("UGN_ENCUESTA_SERVICIO"."NOTA_SERVICIO"),sum("UGN_ENCUESTA_SERVICIO"."NOTA_MAESTRO_C")
						 INTO    :ll_nota_serv,:ll_nota_mc  
						 FROM  "UGN_ENCUESTA_SERVICIO","UGN_CLIENTE","UGN_CLIENTE_ASIGNAR_FALLE"  
						WHERE "UGN_ENCUESTA_SERVICIO"."GRUPO" = "UGN_CLIENTE"."GRUPO" and  
								  "UGN_ENCUESTA_SERVICIO"."CORRELATIVO" = "UGN_CLIENTE"."CORRELATIVO" and  
								  "UGN_CLIENTE"."GRUPO" = "UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" and  
								  "UGN_CLIENTE_ASIGNAR_FALLE"."USUARIO_CREADOR" = :ls_usuario_mc AND  
								  "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" >= :ldt_fec_ini AND  
								  "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_INGRESO" <= :ldt_fec_fin AND  
								  "UGN_ENCUESTA_SERVICIO"."NOTA_SERVICIO" > 0  AND  
								  "UGN_ENCUESTA_SERVICIO"."NOTA_MAESTRO_C" > 0 
						USING sqlca;
						ll_cant_reg		= ll_cant_fono_p + ll_cant_cel
						ll_cant_reg		= ll_cant_reg - ll_cant_restar
						ll_pond_ser		= round((ll_cant_serv*10) *0.2,2)
						ll_pond_reg		= round(ll_cant_reg*0.4,2)
						
						ll_new										= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,"maestro_c",ls_usuario_mc)
						dw_lista.setitem(ll_new,"cant_serv",ll_cant_serv)
						dw_lista.setitem(ll_new,"cant_reg",ll_cant_reg)
						dw_lista.setitem(ll_new,"pond_serv",ll_pond_ser)
						dw_lista.setitem(ll_new,"pond_reg",ll_pond_reg)
						if ll_nota_serv > 0 and ll_nota_mc > 0 then
							ll_nota_prom	= round(((ll_nota_serv+ll_nota_mc)/ll_count_serv)/2,2)
							dw_lista.setitem(ll_new,"prom_nota",ll_nota_prom)
						else
							dw_lista.setitem(ll_new,"prom_nota",0)
						end if	
						ll_pond_nota	= (ll_nota_prom*100)*0.4
						dw_lista.setitem(ll_new,"pond_nota",ll_pond_nota)
						ll_ptje_tot		= ll_pond_nota+ll_pond_ser+ll_pond_reg
						dw_lista.setitem(ll_new,"puntaje_total",ll_ptje_tot)
					end if
					setnull(ls_usuario_mc)
				LOOP
			end if
			close x1;
		end if
	end if
end if

end event

type cb_imprimir from commandbutton within w_ranking_condolencias
integer x = 2034
integer y = 1852
integer width = 256
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_ranking_condolencias
integer x = 1445
integer y = 1852
integer width = 256
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_ranking_condolencias
integer x = 1705
integer y = 1852
integer width = 256
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_cerrar from commandbutton within w_ranking_condolencias
integer x = 3218
integer y = 1852
integer width = 334
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ranking_condolencias)
end event

type gb_1 from groupbox within w_ranking_condolencias
integer x = 1413
integer y = 1792
integer width = 905
integer height = 168
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_lista from datawindow within w_ranking_condolencias
integer x = 32
integer y = 148
integer width = 3525
integer height = 1640
integer taborder = 40
string title = "none"
string dataobject = "dwe_ranking_condolencias"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)	
end if


end event

event doubleclicked;string 	ls_string,ls_maestro_c
long		ll_grupo
datetime	ldt_fec_ini,ldt_fec_fin
if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	ls_maestro_c		= dw_lista.getitemstring(il_row,'maestro_c')
	ldt_fec_ini			= datetime(date(em_fec_ini.text),time('00:00:00'))
	ldt_fec_fin			= datetime(date(em_fec_fin.text),time('00:00:00'))
	if isnull(ls_maestro_c) or ls_maestro_c = ''  then
		dw_lista.reset()
	else
		ls_string	= string(ldt_fec_ini)+'~t'+string(ldt_fec_fin)+'~t'+ls_maestro_c
		if isvalid(w_detalle_ranking) then close(w_detalle_ranking)
		openwithparm(w_detalle_ranking,ls_string)
	end if
end if


end event

