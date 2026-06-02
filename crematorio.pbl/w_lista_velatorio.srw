forward
global type w_lista_velatorio from window
end type
type pb_ok from picturebutton within w_lista_velatorio
end type
type st_16 from statictext within w_lista_velatorio
end type
type p_fin from picture within w_lista_velatorio
end type
type em_fec_fin from editmask within w_lista_velatorio
end type
type st_3 from statictext within w_lista_velatorio
end type
type p_ini from picture within w_lista_velatorio
end type
type em_fec_ini from editmask within w_lista_velatorio
end type
type st_2 from statictext within w_lista_velatorio
end type
type cb_cerrar from commandbutton within w_lista_velatorio
end type
type cb_agregar from commandbutton within w_lista_velatorio
end type
type cb_imprimir from commandbutton within w_lista_velatorio
end type
type cb_exportar from commandbutton within w_lista_velatorio
end type
type dw_lista from datawindow within w_lista_velatorio
end type
type gb_1 from groupbox within w_lista_velatorio
end type
type dw_parque from datawindow within w_lista_velatorio
end type
end forward

global type w_lista_velatorio from window
integer width = 4969
integer height = 2380
boolean titlebar = true
string title = "Calendario Velatorio"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_ok pb_ok
st_16 st_16
p_fin p_fin
em_fec_fin em_fec_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
cb_cerrar cb_cerrar
cb_agregar cb_agregar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
dw_lista dw_lista
gb_1 gb_1
dw_parque dw_parque
end type
global w_lista_velatorio w_lista_velatorio

type variables
Long		il_cod_parque,il_row,il_hora_ini,il_min_ini,il_hora_fin,il_min_fin,il_intervalo,il_veces,il_hora_ini_templo,il_min_ini_templo,il_hora_fin_templo,&
			il_min_fin_templo,il_intervalo_templo,il_veces_templo,il_hora,il_min
Double	il_numero
String	is_sector,is_sepultura,is_nombre,is_ap_pat,is_ap_mat,is_ejecutivo,is_obs,is_tipo_ficha,&
			is_base,is_serie, is_tipo
datetime	idt_fecha_sepult
end variables

on w_lista_velatorio.create
this.pb_ok=create pb_ok
this.st_16=create st_16
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.cb_agregar=create cb_agregar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.dw_parque=create dw_parque
this.Control[]={this.pb_ok,&
this.st_16,&
this.p_fin,&
this.em_fec_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.cb_cerrar,&
this.cb_agregar,&
this.cb_imprimir,&
this.cb_exportar,&
this.dw_lista,&
this.gb_1,&
this.dw_parque}
end on

on w_lista_velatorio.destroy
destroy(this.pb_ok)
destroy(this.st_16)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.cb_agregar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.dw_parque)
end on

event open;datetime		ldt_fecha_sepult,ldt_fecha_sepult_hasta
Long			ll_parque

ldt_fecha_sepult					= datetime(date(gdt_fec_sistema),time('00:00:00'))
ldt_fecha_sepult_hasta			= datetime(RelativeDate(date(ldt_fecha_sepult), 7)  )
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
em_fec_ini.text	= string(ldt_fecha_sepult,'dd/mm/yyyy')
em_fec_fin.text	= string(ldt_fecha_sepult_hasta,'dd/mm/yyyy')
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque		= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_parque		= 11
end if
dw_parque.setitem(1,'cod_parque',ll_parque)
dw_parque.accepttext()
gf_centrar(w_lista_velatorio)
pb_ok.triggerevent(clicked!)

end event

type pb_ok from picturebutton within w_lista_velatorio
integer x = 2249
integer y = 44
integer width = 151
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;String		ls_sector_f,ls_sepultura_f, ls_dv_fallecido_f,ls_nom_f,ls_pat_f,ls_mat_f,ls_tipo_f,ls_base_f,ls_serie_f,ls_tipo_ficha_f,ls_obs_f,ls_fecha,ls_parque,&
			ls_string
datetime	ldt_fecha_ini_f,ldt_fecha_fin_f,ldt_fec_sepulta_f,ldt_fecha_sepult_ini,ldt_fecha_sepult_hasta
Long		ll_hora_ini_f,ll_min_uni_f,ll_hora_fin_f, ll_minuto_fin_f,ll_sala_f,ll_numero_ficha_f,ll_nulo,ll_indi,ll_new,ll_tot_reg,ll_reg
Double	ll_rut_fallecido_f,ll_numero_f
Datetime	ld_fec_ini,ld_fec_fin,ldt_fecha_sepult
Long		ll_cod_parque
time		lt_ini=time('00:00:00'), lt_fin=time('00:00:00')

ld_fec_ini					= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin					= datetime(date(em_fec_fin.text),lt_fin)
ldt_fecha_sepult			= ld_fec_ini
ldt_fecha_sepult_hasta	= ld_fec_fin
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
			gl_cod_parque	= ll_cod_parque
			if ll_cod_parque > 0 then
				dw_lista.reset()
				dw_lista.setredraw(false)
				w_lista_velatorio.title			= 'Resumen de Uso Velatorio día '+string(ldt_fecha_sepult,'dd/mm/yyyy')
				dw_lista.object.t_titulo.text	= 'Resumen de Uso Velatorio día '+string(ldt_fecha_sepult,'dd/mm/yyyy')
				
				SELECT 	"COD_PARQ"."NOMBRE"  
				INTO 		:ls_parque  
				FROM 	"COD_PARQ"  
				WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
				USING	sqlca;	
				ls_parque						= 'Parque '+ls_parque
				dw_lista.object.t_parque.text	= ls_parque
			
			//	ll_hora								= il_hora_ini_templo
			//	ll_min									= il_min_ini_templo
				do while ld_fec_ini <= ld_fec_fin
					ll_new							= dw_lista.insertrow(0)
					dw_lista.setitem(ll_new,'fecha',ld_fec_ini)
					ld_fec_ini				= datetime(RelativeDate(date(ld_fec_ini), 1)  )
				loop
//				for ll_indi=1 to 7
//					ll_new							= dw_lista.insertrow(0)
//					dw_lista.setitem(ll_new,'fecha',ldt_fecha_sepult_ini)
//					idt_fecha_sepult				= datetime(RelativeDate(date(idt_fecha_sepult), 1)  )
//					ldt_fecha_sepult_ini			= idt_fecha_sepult
//				next
				ll_tot_reg							= dw_lista.rowcount()
				dw_lista.accepttext()
				DECLARE x1 CURSOR FOR 
				SELECT 		"FICHA_CONTROL_VELATORIO"."SECTOR",   "FICHA_CONTROL_VELATORIO"."SEPULTURA",   "FICHA_CONTROL_VELATORIO"."FECHA_USO_INI",   "FICHA_CONTROL_VELATORIO"."HORA_USO_INI",   "FICHA_CONTROL_VELATORIO"."MINUTO_USO_INI",   "FICHA_CONTROL_VELATORIO"."FECHA_USO_FIN",   "FICHA_CONTROL_VELATORIO"."HORA_USO_FIN",   "FICHA_CONTROL_VELATORIO"."MINUTO_USO_FIN",   "FICHA_CONTROL_VELATORIO"."RUT_FALLECIDO",   "FICHA_CONTROL_VELATORIO"."DV_FALLECIDO",   "FICHA_CONTROL_VELATORIO"."NOMBRE_FALLECIDO",   "FICHA_CONTROL_VELATORIO"."AP_PATERNO_FALLECIDO",   "FICHA_CONTROL_VELATORIO"."AP_MATERNO_FALLECIDO",   "FICHA_CONTROL_VELATORIO"."BASE",   "FICHA_CONTROL_VELATORIO"."SERIE",   "FICHA_CONTROL_VELATORIO"."NUMERO",   "FICHA_CONTROL_VELATORIO"."SALA_VELATORIO",   "FICHA_CONTROL_VELATORIO"."TIPO_FICHA",   "FICHA_CONTROL_VELATORIO"."NUMERO_FICHA",   "FICHA_CONTROL_VELATORIO"."OBSERVACION",   "FICHA_CONTROL_VELATORIO"."FECHA_SEPULTACION"  
				FROM 		"FICHA_CONTROL_VELATORIO"  
				WHERE 	  ( "FICHA_CONTROL_VELATORIO"."FECHA_SEPULTACION" >= :ldt_fecha_sepult ) AND  
							  ( "FICHA_CONTROL_VELATORIO"."FECHA_SEPULTACION" <= :ldt_fecha_sepult_hasta ) AND  
							  ( "FICHA_CONTROL_VELATORIO"."ESTADO_REG" = 'A' ) AND
							  ( "FICHA_CONTROL_VELATORIO"."COD_PARQUE" = :il_cod_parque )  
				ORDER BY "FICHA_CONTROL_VELATORIO"."FECHA_SEPULTACION" ASC,   
							"FICHA_CONTROL_VELATORIO"."FECHA_USO_INI" ASC,
							"FICHA_CONTROL_VELATORIO"."HORA_USO_INI" ASC,
							"FICHA_CONTROL_VELATORIO"."MINUTO_USO_INI" ASC
				USING		sqlca;
				open x1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						fetch x1 into :ls_sector_f,:ls_sepultura_f, :ldt_fecha_ini_f,:ll_hora_ini_f,:ll_min_uni_f,:ldt_fecha_fin_f, :ll_hora_fin_f, :ll_minuto_fin_f,:ll_rut_fallecido_f, :ls_dv_fallecido_f ,:ls_nom_f,:ls_pat_f,:ls_mat_f,:ls_base_f,:ls_serie_f,:ll_numero_f,:ll_sala_f, :ls_tipo_ficha_f, :ll_numero_ficha_f, :ls_obs_f, :ldt_fec_sepulta_f;
						if not isnull(ls_nom_f) then
							if ll_hora_ini_f > 0 then
								dw_lista.accepttext()
								ls_string	= 'fecha_sepultacion = date('+string(ldt_fec_sepulta_f,'dd/mm/yyyy')+')'
								ll_reg		= dw_lista.Find(ls_string, 1, ll_tot_reg)
		//						if ll_reg > 0  then
									dw_lista.setitem(ll_reg,'nombre',ls_nom_f)
									dw_lista.setitem(ll_reg,'ap_paterno',ls_pat_f)
									dw_lista.setitem(ll_reg,'ap_materno',ls_mat_f)
		//							if ls_tipo_f = 'FS' then
		//								SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  	"FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", 	"FICHA_SEPULTACION"."SW_TIPO_FICHA"  
		//    								INTO 		:ll_covid_19, 										:ll_protocolo_covid, 											:ll_ficha_telefonica  
		//    								FROM 	"FICHA_SEPULTACION"  
		//   								WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
		//         								  	( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
		//											( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
		//											( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque ) AND
		//											( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:idt_fecha_sepult )	;
		//							end if
									dw_lista.setitem(ll_reg,'sector',ls_sector_f)
									dw_lista.setitem(ll_reg,'sepultura',ls_sepultura_f)
									dw_lista.setitem(ll_reg,'observacion',ls_obs_f)
									dw_lista.setitem(ll_reg,'tipo_ficha',ls_tipo_f)
									dw_lista.setitem(ll_reg,'numero_ficha',ll_numero_ficha_f)
									dw_lista.setitem(ll_reg,'fecha_sepultacion',ldt_fec_sepulta_f)
									dw_lista.setitem(ll_reg,'cod_parque',ll_cod_parque)
									dw_lista.setitem(ll_reg,'base',ls_base_f)
									dw_lista.setitem(ll_reg,'serie',ls_serie_f)
									dw_lista.setitem(ll_reg,'numero',ll_numero_f)
									dw_lista.setitem(ll_reg,'sala_velatoria',ll_sala_f)
									dw_lista.setitem(ll_reg,'fecha_uso_ini',ldt_fecha_ini_f)
									dw_lista.setitem(ll_reg,'hora_uso_ini',ll_hora_ini_f)
									dw_lista.setitem(ll_reg,'minuto_uso_ini',ll_min_uni_f)
									
									dw_lista.setitem(ll_reg,'fecha_uso_fin',ldt_fecha_fin_f)
									dw_lista.setitem(ll_reg,'hora_uso_fin',ll_hora_fin_f)
									dw_lista.setitem(ll_reg,'minuto_uso_fin',ll_minuto_fin_f)
									
									dw_lista.setitem(ll_reg,'fecha_sepultacion_ini',ldt_fecha_sepult)
									dw_lista.setitem(ll_reg,'fecha_sepultacion_fin',ldt_fecha_sepult_hasta)
		//							if ls_tipo_f = 'FS' then
		//								dw_lista.setitem(ll_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
		//								dw_lista.setitem(ll_reg,'sw_protocolo',ll_protocolo_covid)
		//								dw_lista.setitem(ll_reg,'sw_covid',ll_covid_19)
		//							end if	
								
		//						end if
							end if
							ll_tot_reg				= dw_lista.rowcount()
						end if
						Setnull(ls_nom_f)
					LOOP
				end if
				close x1;
				dw_lista.accepttext()
				dw_lista.GROUPCALC() 
				dw_lista.setredraw(true)
			else
				messagebox("Advertencia","Debe Seleccionar Parque")
				dw_parque.setfocus()
			end if
		end if
	end if
end if
end event

type st_16 from statictext within w_lista_velatorio
integer x = 1431
integer y = 72
integer width = 187
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_fin from picture within w_lista_velatorio
integer x = 1335
integer y = 64
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
	end if	
END IF
end event

type em_fec_fin from editmask within w_lista_velatorio
integer x = 974
integer y = 64
integer width = 357
integer height = 88
integer taborder = 20
integer textsize = -8
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

type st_3 from statictext within w_lista_velatorio
integer x = 823
integer y = 72
integer width = 146
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_ini from picture within w_lista_velatorio
integer x = 731
integer y = 64
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
	end if	
END IF
end event

type em_fec_ini from editmask within w_lista_velatorio
integer x = 384
integer y = 64
integer width = 338
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_2 from statictext within w_lista_velatorio
integer x = 46
integer y = 72
integer width = 320
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_lista_velatorio
integer x = 4571
integer y = 2140
integer width = 302
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_velatorio)
end event

type cb_agregar from commandbutton within w_lista_velatorio
integer x = 41
integer y = 2132
integer width = 302
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Agregar"
end type

event clicked;String	ls_string,ls_nom
Long		ll_reg,ll_reg_hora,ll_tot_reg,ll_new,ll_min_new,ll_reg_hora_otra,ll_tot_reg_ant,ll_indi,&
			ll_hora_sel,ll_min_sel

if il_hora=0 or isnull(il_hora) then
	ls_nom			= dw_lista.getitemstring(il_row,'nombre')
	if isnull(ls_nom) or ls_nom='' then
		ll_hora_sel	= dw_lista.getitemnumber(il_row,'hora')
		ll_min_sel	= dw_lista.getitemnumber(il_row,'minuto')
		dw_lista.setitem(il_row,'nombre',is_nombre)
		dw_lista.setitem(il_row,'ap_paterno',is_ap_pat)
		dw_lista.setitem(il_row,'ap_materno',is_ap_mat)
		dw_lista.setitem(il_row,'sector',is_sector)
		dw_lista.setitem(il_row,'sepultura',is_sepultura)
		dw_lista.setitem(il_row,'ejecutivo',is_ejecutivo)
		dw_lista.setitem(il_row,'observacion',is_obs)
		dw_lista.setitem(il_row,'tipo_ficha',is_tipo_ficha)
		if isvalid(w_ingreso_ficha_sepultacion) then
			ll_tot_reg_ant	= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.rowcount()
			for ll_indi=1 to ll_tot_reg_ant
				if is_tipo = 'T' then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'hora_util_templo',ll_hora_sel)
					w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'minuto_util_templo',ll_min_sel)
				elseif is_tipo = 'V' then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'hora_util_capilla',ll_hora_sel)
					w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'minuto_util_capilla',ll_min_sel)
				else
					w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora',ll_hora_sel)
					w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minutos',ll_min_sel)
					
					w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_def',ll_hora_sel)
					w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_def',ll_min_sel)
				end if
			next
			messagebox("Advertencia","Recuerde Grabar Ficha de Sepultación, Se Actualizó Horario de Sepultación")
			w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setfocus()
			w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_ejecutivo')
			close(w_lista_funerales)
		elseif isvalid(w_ingreso_ficha_traslado) then
			ll_tot_reg_ant	= w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.rowcount()
			for ll_indi=1 to ll_tot_reg_ant
				w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_fijada',ll_hora_sel)
				w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_fijada',ll_min_sel)
				
				w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_def',ll_hora_sel)
				w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_def',ll_min_sel)
			next
			messagebox("Advertencia","Recuerde Grabar Ficha de Traslado, Se Actualizó Hora Fijada")
			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setfocus()
			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_ejecutivo')
			close(w_lista_funerales)
		end if
	else
		messagebox("Advertencia","No es Posible Asignar Hora Reservada")
	end if
elseif il_hora>0 then
	ll_tot_reg	= dw_lista.rowcount()
	ls_string		= "nombre='"+is_nombre+"' and ap_paterno='"+is_ap_pat+"' and ap_materno='"+is_ap_mat+"'"
	ll_reg			= dw_lista.Find(ls_string, 1, ll_tot_reg)
	if ll_reg>0 then
		messagebox("Advertencia","NO es posible Agregar Fallecido, Ya está Asignado")
	else
		ls_string	= "hora="+string(il_hora)+" and minuto="+string(il_min)
		ll_reg_hora	= dw_lista.Find(ls_string, 1, ll_tot_reg)
		if ll_reg_hora>0 then
			ls_nom	= dw_lista.getitemstring(ll_reg_hora,'nombre')
			if ls_nom='' or isnull(ls_nom) then
				dw_lista.setitem(ll_reg_hora,'nombre',is_nombre)
				dw_lista.setitem(ll_reg_hora,'ap_paterno',is_ap_pat)
				dw_lista.setitem(ll_reg_hora,'ap_materno',is_ap_mat)
				dw_lista.setitem(ll_reg_hora,'sector',is_sector)
				dw_lista.setitem(ll_reg_hora,'sepultura',is_sepultura)
				dw_lista.setitem(ll_reg_hora,'ejecutivo',is_ejecutivo)
				dw_lista.setitem(ll_reg_hora,'observacion',is_obs)
				dw_lista.setitem(ll_reg_hora,'tipo_ficha',is_tipo_ficha)
			else
				ll_new						= ll_reg_hora + 1
				dw_lista.insertrow(ll_new)
				ll_min_new					= il_min + 5
				ls_string					= "hora="+string(il_hora)+" and minuto="+string(ll_min_new)
				ll_reg_hora_otra	= dw_lista.Find(ls_string, 1, ll_tot_reg)
				if ll_reg_hora_otra>0 then
					ll_min_new				= il_min + 10
					ls_string				= "hora="+string(il_hora)+" and minuto="+string(ll_min_new)
					ll_reg_hora_otra		= dw_lista.Find(ls_string, 1, ll_tot_reg)
					if ll_reg_hora_otra>0 then
						ll_min_new			= il_min + 15
						ls_string			= "hora="+string(il_hora)+" and minuto="+string(ll_min_new)
						ll_reg_hora_otra	= dw_lista.Find(ls_string, 1, ll_tot_reg)
						if ll_reg_hora_otra>0 then
							ll_min_new			= il_min + 20
						end if
					end if
				end if
				dw_lista.setitem(ll_new,'hora',il_hora)
				dw_lista.setitem(ll_new,'minuto',ll_min_new)
				if isvalid(w_ingreso_ficha_sepultacion) then
					ll_tot_reg_ant	= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					for ll_indi=1 to ll_tot_reg_ant
						w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora',il_hora)
						w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minutos',ll_min_new)
						
						w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_def',il_hora)
						w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_def',ll_min_new)
					next
					messagebox("Advertencia","Recuerde Grabar Ficha de Sepultación, Se Actualizó Horario de Sepultación")
				elseif isvalid(w_ingreso_ficha_traslado) then
					ll_tot_reg_ant	= w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					for ll_indi=1 to ll_tot_reg_ant
						w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_fijada',il_hora)
						w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_fijada',ll_min_new)
						
						w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_def',il_hora)
						w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_def',ll_min_new)
					next
					messagebox("Advertencia","Recuerde Grabar Ficha de Traslado, Se Actualizó Hora Fijada")
				end if
				dw_lista.setitem(ll_new,'nombre',is_nombre)
				dw_lista.setitem(ll_new,'ap_paterno',is_ap_pat)
				dw_lista.setitem(ll_new,'ap_materno',is_ap_mat)
				dw_lista.setitem(ll_new,'sector',is_sector)
				dw_lista.setitem(ll_new,'sepultura',is_sepultura)
				dw_lista.setitem(ll_new,'ejecutivo',is_ejecutivo)
				dw_lista.setitem(ll_new,'observacion',is_obs)
				dw_lista.setitem(ll_new,'tipo_ficha',is_tipo_ficha)
			end if
		end if
		close(w_lista_funerales)
	end if
end if
end event

type cb_imprimir from commandbutton within w_lista_velatorio
integer x = 2085
integer y = 2140
integer width = 302
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.print.preview	= true
	dw_lista.object.datawindow.zoom				= 80
	f_Print( dw_lista )
	dw_lista.object.datawindow.zoom				= 100
	dw_lista.object.datawindow.print.preview	= false
end if

end event

type cb_exportar from commandbutton within w_lista_velatorio
integer x = 2414
integer y = 2140
integer width = 302
integer height = 92
integer taborder = 20
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

type dw_lista from datawindow within w_lista_velatorio
integer x = 41
integer y = 220
integer width = 4832
integer height = 1880
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_resumen_horario_velatorio"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_lista_velatorio
integer x = 2062
integer y = 2092
integer width = 681
integer height = 164
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_parque from datawindow within w_lista_velatorio
integer x = 1627
integer y = 64
integer width = 594
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.accepttext()
dw_lista.reset()
end event

