forward
global type w_detalle_gestiones_supervisor_2 from window
end type
type cb_mes from commandbutton within w_detalle_gestiones_supervisor_2
end type
type cb_semestral from commandbutton within w_detalle_gestiones_supervisor_2
end type
type cb_anual from commandbutton within w_detalle_gestiones_supervisor_2
end type
type cb_limpiar from commandbutton within w_detalle_gestiones_supervisor_2
end type
type cb_imprimir from commandbutton within w_detalle_gestiones_supervisor_2
end type
type cb_2 from commandbutton within w_detalle_gestiones_supervisor_2
end type
type cb_1 from commandbutton within w_detalle_gestiones_supervisor_2
end type
type dw_gestion_detalle from datawindow within w_detalle_gestiones_supervisor_2
end type
type p_4 from picture within w_detalle_gestiones_supervisor_2
end type
type p_3 from picture within w_detalle_gestiones_supervisor_2
end type
type st_1 from statictext within w_detalle_gestiones_supervisor_2
end type
type em_fec_ini from editmask within w_detalle_gestiones_supervisor_2
end type
type em_fec_fin from editmask within w_detalle_gestiones_supervisor_2
end type
type st_2 from statictext within w_detalle_gestiones_supervisor_2
end type
type pb_consultar from picturebutton within w_detalle_gestiones_supervisor_2
end type
type gb_1 from groupbox within w_detalle_gestiones_supervisor_2
end type
type gb_2 from groupbox within w_detalle_gestiones_supervisor_2
end type
end forward

global type w_detalle_gestiones_supervisor_2 from window
integer width = 3899
integer height = 2400
boolean titlebar = true
string title = "Detalle Efectividad Supervisor"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_mes cb_mes
cb_semestral cb_semestral
cb_anual cb_anual
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_2 cb_2
cb_1 cb_1
dw_gestion_detalle dw_gestion_detalle
p_4 p_4
p_3 p_3
st_1 st_1
em_fec_ini em_fec_ini
em_fec_fin em_fec_fin
st_2 st_2
pb_consultar pb_consultar
gb_1 gb_1
gb_2 gb_2
end type
global w_detalle_gestiones_supervisor_2 w_detalle_gestiones_supervisor_2

type variables
long il_row
end variables

on w_detalle_gestiones_supervisor_2.create
this.cb_mes=create cb_mes
this.cb_semestral=create cb_semestral
this.cb_anual=create cb_anual
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_gestion_detalle=create dw_gestion_detalle
this.p_4=create p_4
this.p_3=create p_3
this.st_1=create st_1
this.em_fec_ini=create em_fec_ini
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.pb_consultar=create pb_consultar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_mes,&
this.cb_semestral,&
this.cb_anual,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_2,&
this.cb_1,&
this.dw_gestion_detalle,&
this.p_4,&
this.p_3,&
this.st_1,&
this.em_fec_ini,&
this.em_fec_fin,&
this.st_2,&
this.pb_consultar,&
this.gb_1,&
this.gb_2}
end on

on w_detalle_gestiones_supervisor_2.destroy
destroy(this.cb_mes)
destroy(this.cb_semestral)
destroy(this.cb_anual)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_gestion_detalle)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.st_1)
destroy(this.em_fec_ini)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.pb_consultar)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;String	ls_columna,ls_jefe,ls_supervisor,ls_usuario

if gs_depto='I' or gs_depto='R'  then
		gf_centrar(w_detalle_gestiones_supervisor_2)
		em_fec_ini.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
		em_fec_fin.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
else
	Messagebox("Mensaje","Usted No Tiene Los Permisos Necesarios")
	close(w_detalle_gestiones_supervisor_2)
end if	
end event

type cb_mes from commandbutton within w_detalle_gestiones_supervisor_2
integer x = 41
integer y = 2148
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
string text = "Mensual"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin,ldt_fec_repor,ldt_fecha,ldt_fech_lim
string ls_fech,ls_fech2,ls_cod_jef,ls_cod_sup,ls_base,ls_serie,ls_valida,ls_fecha,ls_fech_st,ls_fech_aux
date fecha1,fecha2
long ll_ano_actual,ll_tot_reg,ll_indi,ll_rut,ll_mes_actual
Double	ll_numero

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
INTO 	 :ls_cod_jef,   			:ls_cod_sup  
FROM 	 "SUPERVISOR"  
WHERE  "SUPERVISOR"."COD_SUP" = :gs_user   
USING	 sqlca;
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
	
	if isnull(ls_cod_jef) then
		Messagebox("Error","Debe Seleccionar un Jefe De Ventas")	
	else		
		if ldt_fech_ini <= ldt_fech_fin then
			dw_gestion_detalle.settransobject(sqlca)
			ll_tot_reg									= dw_gestion_detalle.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup) 	
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					ll_rut								= dw_gestion_detalle.getitemnumber(ll_indi,'informe_agente_rut_contacto')
					ldt_fec_repor						= dw_gestion_detalle.getitemdatetime(ll_indi,'informe_agente_fecha_reporte')
					if ll_rut>0 then
						SELECT	"CADENA"."CODIGO","CADENA"."SERIE","CADENA"."NUMERO","OFERTA_V"."FECHA"  
						INTO		:ls_base,:ls_serie,:ll_numero,:ldt_fecha  
						FROM		"CADENA","OFERTA_V","PAGO_OFERTA"  
						WHERE ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								( ( "CADENA"."RUT" = :ll_rut ) )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							ls_fech_st					= string(ldt_fecha,'dd/mm/yyyy')
							ls_fech_aux 				= string(RelativeDate(date(ls_fech_st), -60),"dd/mm/yyyy")
							ldt_fech_lim				= datetime(date(ls_fech_aux),time('00:00:00'))
							if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ll_numero) and ll_numero>0  then
								if not isnull(ll_numero) and ll_numero>0 and ldt_fecha>=ldt_fec_repor and ldt_fech_lim<=ldt_fec_repor then
									ls_valida			= 'Gestión Efectiva'
									dw_gestion_detalle.setitem(ll_indi,"c_val_gestion",ls_valida)
								else
								//	ls_valida			= ''
								end if
								ls_fecha					= string(ldt_fecha,'dd/mm/yyyy')
								dw_gestion_detalle.setitem(ll_indi,"c_base",ls_base) 
								dw_gestion_detalle.setitem(ll_indi,"c_serie",ls_serie) 
								dw_gestion_detalle.setitem(ll_indi,"c_numero",ll_numero)
								dw_gestion_detalle.setitem(ll_indi,"c_fec_cont",ls_fecha)
								
								dw_gestion_detalle.accepttext()
							end if
						end if
					end if
				next
			else
				 Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
			end if
		else
			Messagebox("Error","Rango de Fechas Invalido")
	end if
	end if
else
	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
end if	

end event

type cb_semestral from commandbutton within w_detalle_gestiones_supervisor_2
integer x = 347
integer y = 2148
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
string text = "Semestral"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin,ldt_fec_repor,ldt_fecha,ldt_fech_lim
string ls_fech,ls_fech2,ls_cod_jef,ls_cod_sup,ls_base,ls_serie,ls_valida,ls_fecha,ls_fech_st,ls_fech_aux
date fecha1,fecha2
long ll_ano_actual,ll_tot_reg,ll_indi,ll_rut
Double	ll_numero

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
INTO 	 :ls_cod_jef,   			:ls_cod_sup  
FROM 	 "SUPERVISOR"  
WHERE  "SUPERVISOR"."COD_SUP" = :gs_user   
USING	 sqlca;
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
	
	if isnull(ls_cod_jef) then
		Messagebox("Error","Debe Seleccionar un Jefe De Ventas")	
	else	
		if ldt_fech_ini <= ldt_fech_fin then
			dw_gestion_detalle.settransobject(sqlca)
			ll_tot_reg									= dw_gestion_detalle.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup) 	
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					ll_rut								= dw_gestion_detalle.getitemnumber(ll_indi,'informe_agente_rut_contacto')
					ldt_fec_repor						= dw_gestion_detalle.getitemdatetime(ll_indi,'informe_agente_fecha_reporte')
					if ll_rut>0 then
						SELECT DISTINCT	"CADENA"."CODIGO","CADENA"."SERIE","CADENA"."NUMERO","OFERTA_V"."FECHA"  
						INTO		:ls_base,:ls_serie,:ll_numero,:ldt_fecha  
						FROM		"CADENA","OFERTA_V","PAGO_OFERTA"  
						WHERE ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								( ( "CADENA"."RUT" = :ll_rut ) )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							ls_fech_st					= string(ldt_fecha,'dd/mm/yyyy')
							ls_fech_aux 				= string(RelativeDate(date(ls_fech_st), -60),"dd/mm/yyyy")
							ldt_fech_lim				= datetime(date(ls_fech_aux),time('00:00:00'))
							if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ll_numero) and ll_numero>0 and ldt_fech_lim<=ldt_fec_repor then
								if not isnull(ll_numero) and ll_numero>0 and ldt_fecha>=ldt_fec_repor and ldt_fech_lim<=ldt_fec_repor then
									ls_valida			= 'Gestión Efectiva'
									dw_gestion_detalle.setitem(ll_indi,"c_val_gestion",ls_valida)
								else
								//	ls_valida			= ''
								end if
								ls_fecha					= string(ldt_fecha,'dd/mm/yyyy')
								dw_gestion_detalle.setitem(ll_indi,"c_base",ls_base) 
								dw_gestion_detalle.setitem(ll_indi,"c_serie",ls_serie) 
								dw_gestion_detalle.setitem(ll_indi,"c_numero",ll_numero)
								dw_gestion_detalle.setitem(ll_indi,"c_fec_cont",ls_fecha)	
								dw_gestion_detalle.accepttext()
							end if
						end if
					end if
				next
			else
				Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
			end if
		else
			Messagebox("Error","Rango de Fechas Invalido")
	end if
	end if
else
	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
end if	

end event

type cb_anual from commandbutton within w_detalle_gestiones_supervisor_2
integer x = 654
integer y = 2148
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
string text = "Anual"
end type

event clicked;datetime	ldt_fech_ini,ldt_fech_fin,ldt_fec_repor,ldt_fecha,ldt_fech_lim
string ls_fech,ls_fech2,ls_cod_jef,ls_cod_sup,ls_base,ls_serie,ls_valida,ls_fecha,ls_fech_st,ls_fech_aux
date fecha1,fecha2
long ll_ano_actual,ll_tot_reg,ll_indi,ll_rut
Double	ll_numero

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
INTO 	 :ls_cod_jef,   			:ls_cod_sup  
FROM 	 "SUPERVISOR"  
WHERE  "SUPERVISOR"."COD_SUP" = :gs_user   
USING	 sqlca;
if sqlca.sqlcode=0 then
	
	ll_ano_actual			= year(date(gdt_fec_sistema))
	ls_fech					= '01/01/'+string(ll_ano_actual,'0000')
	ldt_fech_ini			= datetime(date(ls_fech),time('00:00:00'))
	ls_fech2					= '31/12/'+string(ll_ano_actual,'0000')
	ldt_fech_fin			= datetime(date(ls_fech2),time('00:00:00'))
	
	if isnull(ls_cod_jef) then
		Messagebox("Error","Debe Seleccionar un Jefe De Ventas")	
	else	
		if ldt_fech_ini <= ldt_fech_fin then
			dw_gestion_detalle.settransobject(sqlca)
			ll_tot_reg									= dw_gestion_detalle.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup) 	
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					ll_rut								= dw_gestion_detalle.getitemnumber(ll_indi,'informe_agente_rut_contacto')
					ldt_fec_repor						= dw_gestion_detalle.getitemdatetime(ll_indi,'informe_agente_fecha_reporte')
					if ll_rut>0 then
						SELECT DISTINCT	"CADENA"."CODIGO","CADENA"."SERIE","CADENA"."NUMERO","OFERTA_V"."FECHA"  
						INTO		:ls_base,:ls_serie,:ll_numero,:ldt_fecha  
						FROM		"CADENA","OFERTA_V","PAGO_OFERTA"  
						WHERE ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								( ( "CADENA"."RUT" = :ll_rut ) )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							ls_fech_st					= string(ldt_fecha,'dd/mm/yyyy')
							ls_fech_aux 				= string(RelativeDate(date(ls_fech_st), -60),"dd/mm/yyyy")
							ldt_fech_lim				= datetime(date(ls_fech_aux),time('00:00:00'))
							if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ll_numero) and ll_numero>0 and ldt_fech_lim<=ldt_fec_repor then
								if not isnull(ll_numero) and ll_numero>0 and ldt_fecha>=ldt_fec_repor and ldt_fech_lim<=ldt_fec_repor then
									ls_valida			= 'Gestión Efectiva'
									dw_gestion_detalle.setitem(ll_indi,"c_val_gestion",ls_valida)
								else
									ls_valida			= ''
								end if
								ls_fecha					= string(ldt_fecha,'dd/mm/yyyy')
								dw_gestion_detalle.setitem(ll_indi,"c_base",ls_base) 
								dw_gestion_detalle.setitem(ll_indi,"c_serie",ls_serie) 
								dw_gestion_detalle.setitem(ll_indi,"c_numero",ll_numero)
								dw_gestion_detalle.setitem(ll_indi,"c_fec_cont",ls_fecha)
								dw_gestion_detalle.accepttext()
							end if
						end if
					end if
				next
			else
				Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
			end if
		else
			Messagebox("Error","Rango de Fechas Invalido")
	end if
	end if
else
	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
end if

end event

type cb_limpiar from commandbutton within w_detalle_gestiones_supervisor_2
integer x = 2546
integer y = 2148
integer width = 302
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_gestion_detalle.reset()

w_detalle_gestiones_supervisor_2.triggerevent(open!)
end event

type cb_imprimir from commandbutton within w_detalle_gestiones_supervisor_2
integer x = 2235
integer y = 2148
integer width = 302
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_gestion_detalle.rowcount() > 0 then
	dw_gestion_detalle.object.datawindow.Print.Preview	= true
	dw_gestion_detalle.object.datawindow.zoom				= 75
	f_Print( dw_gestion_detalle )
	dw_gestion_detalle.object.datawindow.Print.Preview	= false
	dw_gestion_detalle.object.datawindow.zoom				= 100
end if
end event

type cb_2 from commandbutton within w_detalle_gestiones_supervisor_2
integer x = 1303
integer y = 2148
integer width = 416
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;if dw_gestion_detalle.rowcount()>0 then
	gs_base		= dw_gestion_detalle.getitemstring(il_row,'c_base')
	gs_serie		= dw_gestion_detalle.getitemstring(il_row,'c_serie')
	gi_numero	= dw_gestion_detalle.getitemnumber(il_row,'c_numero')
	gi_rut		= dw_gestion_detalle.getitemnumber(il_row,'informe_agente_rut_contacto')
	IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 AND gi_rut > 0 THEN
		CHOOSE CASE gs_base 
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" // Derecho
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	else
		messagebox("Advertencia","Debe Seleccionar Contrato Valido")
	END IF
else
	messagebox("Advertencia","Debe Seleccionar Contrato")
end if
end event

type cb_1 from commandbutton within w_detalle_gestiones_supervisor_2
integer x = 3488
integer y = 2140
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

event clicked;close(w_detalle_gestiones_supervisor_2)
end event

type dw_gestion_detalle from datawindow within w_detalle_gestiones_supervisor_2
integer x = 27
integer y = 180
integer width = 3781
integer height = 1908
integer taborder = 60
string title = "none"
string dataobject = "dw_detalle_efectividad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type p_4 from picture within w_detalle_gestiones_supervisor_2
integer x = 3488
integer y = 60
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

type p_3 from picture within w_detalle_gestiones_supervisor_2
integer x = 2958
integer y = 56
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

type st_1 from statictext within w_detalle_gestiones_supervisor_2
integer x = 2482
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
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_detalle_gestiones_supervisor_2
integer x = 2651
integer y = 68
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

event modified;dw_gestion_detalle.reset()
end event

type em_fec_fin from editmask within w_detalle_gestiones_supervisor_2
integer x = 3177
integer y = 64
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_gestion_detalle.reset()
end event

type st_2 from statictext within w_detalle_gestiones_supervisor_2
integer x = 3067
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
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_consultar from picturebutton within w_detalle_gestiones_supervisor_2
integer x = 3643
integer y = 16
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

event clicked;datetime	ldt_fech_ini,ldt_fech_fin,ldt_fecha,ldt_fec_repor,ldt_fech_lim
string ls_cod_jef,ls_cod_sup,ls_base,ls_serie,ls_valida,ls_fecha,ls_fech_st,ls_fech_aux
long	ll_indi,ll_tot_reg,ll_rut,ll_rut_cliente,ll_count
Double	ll_numero

SELECT "SUPERVISOR"."COD_JEFE","SUPERVISOR"."COD_SUP"  
INTO 	 :ls_cod_jef,   			:ls_cod_sup  
FROM 	 "SUPERVISOR"  
WHERE  "SUPERVISOR"."COD_SUP" = :gs_user   
USING	 sqlca;
if sqlca.sqlcode=0 then
	if isnull(ls_cod_sup) then
		Messagebox("Error","Debe Seleccionar un Supervisor")	
	else	
		ldt_fech_ini									= datetime(date(em_fec_ini.text),time('00:00:00'))
		ldt_fech_fin									= datetime(date(em_fec_fin.text),time('23:59:59'))	
		if ldt_fech_ini <= ldt_fech_fin then
			dw_gestion_detalle.settransobject(sqlca)
			ll_tot_reg									= dw_gestion_detalle.retrieve(ldt_fech_ini,ldt_fech_fin,ls_cod_jef,ls_cod_sup) 	
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					ll_rut								= dw_gestion_detalle.getitemnumber(ll_indi,'informe_agente_rut_contacto')
					ldt_fec_repor						= dw_gestion_detalle.getitemdatetime(ll_indi,'informe_agente_fecha_reporte')
					if ll_rut>0 then				
						SELECT DISTINCT	"CADENA"."CODIGO","CADENA"."SERIE","CADENA"."NUMERO","OFERTA_V"."FECHA"  
						INTO		:ls_base,:ls_serie,:ll_numero,:ldt_fecha  
						FROM		"CADENA","OFERTA_V","PAGO_OFERTA"  
						WHERE ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and 
								("CADENA"."ESTADO" = 'V' ) and  
								( ( "CADENA"."RUT" = :ll_rut ) )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							ls_fech_st					= string(ldt_fecha,'dd/mm/yyyy')
							ls_fech_aux 				= string(RelativeDate(date(ls_fech_st), -60),"dd/mm/yyyy")
							ldt_fech_lim				= datetime(date(ls_fech_aux),time('00:00:00'))
							if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ll_numero) and ll_numero>0 and ldt_fech_lim<=ldt_fec_repor then
								if not isnull(ll_numero) and ll_numero>0 and ldt_fecha>=ldt_fec_repor and ldt_fech_lim<=ldt_fec_repor then
									ls_valida			= 'Gestión Efectiva'
									dw_gestion_detalle.setitem(ll_indi,"c_val_gestion",ls_valida)
								else
								//	ls_valida			= ''
								end if
								ls_fecha					= string(ldt_fecha,'dd/mm/yyyy')
								dw_gestion_detalle.setitem(ll_indi,"c_base",ls_base) 
								dw_gestion_detalle.setitem(ll_indi,"c_serie",ls_serie) 
								dw_gestion_detalle.setitem(ll_indi,"c_numero",ll_numero)
								dw_gestion_detalle.setitem(ll_indi,"c_fec_cont",ls_fecha)
								dw_gestion_detalle.accepttext()
							else	
							end if
						end if
						SELECT count("INFORME_AGENTE"."CORRELATIVO")
						INTO 		:ll_count  
						FROM 	"INFORME_AGENTE"  
						WHERE 	"INFORME_AGENTE"."RUT_CONTACTO" = :ll_rut
						USING	sqlca;
						if sqlca.sqlcode=0 then
							dw_gestion_detalle.setitem(ll_indi,"c_ciclo",ll_count)
						end if	
					end if
				next
			else
				Messagebox("Mensaje","No Se Puede Generar Gráfico, Aun No Existen Datos en el Rango Consultado")
			end if
		else
			Messagebox("Error","Rango de Fechas Invalido")
	end if
	end if
else
	Messagebox("Error","Error Leyendo Datos: "+sqlca.sqlerrtext)
end if
end event

type gb_1 from groupbox within w_detalle_gestiones_supervisor_2
integer x = 23
integer y = 2096
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

type gb_2 from groupbox within w_detalle_gestiones_supervisor_2
integer x = 2213
integer y = 2096
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

