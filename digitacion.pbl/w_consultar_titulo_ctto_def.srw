forward
global type w_consultar_titulo_ctto_def from window
end type
type st_5 from statictext within w_consultar_titulo_ctto_def
end type
type st_4 from statictext within w_consultar_titulo_ctto_def
end type
type em_numero from editmask within w_consultar_titulo_ctto_def
end type
type em_serie from editmask within w_consultar_titulo_ctto_def
end type
type em_base from editmask within w_consultar_titulo_ctto_def
end type
type cb_1 from commandbutton within w_consultar_titulo_ctto_def
end type
type sle_1 from uo_convierte_numero within w_consultar_titulo_ctto_def
end type
type rb_ambas from radiobutton within w_consultar_titulo_ctto_def
end type
type rb_contrato_definitivo from radiobutton within w_consultar_titulo_ctto_def
end type
type rb_titulo_dominio from radiobutton within w_consultar_titulo_ctto_def
end type
type dw_print_ctto_def from datawindow within w_consultar_titulo_ctto_def
end type
type dw_print_titulo from datawindow within w_consultar_titulo_ctto_def
end type
type cb_print_ccto_def from commandbutton within w_consultar_titulo_ctto_def
end type
type cb_print_titulo_dominio from commandbutton within w_consultar_titulo_ctto_def
end type
type cb_ctacte from commandbutton within w_consultar_titulo_ctto_def
end type
type cb_imprimir from commandbutton within w_consultar_titulo_ctto_def
end type
type cb_exportar from commandbutton within w_consultar_titulo_ctto_def
end type
type cb_ordenar from commandbutton within w_consultar_titulo_ctto_def
end type
type cb_filtrar from commandbutton within w_consultar_titulo_ctto_def
end type
type cb_cerrar from commandbutton within w_consultar_titulo_ctto_def
end type
type st_3 from statictext within w_consultar_titulo_ctto_def
end type
type rb_parque from radiobutton within w_consultar_titulo_ctto_def
end type
type rb_correlativo from radiobutton within w_consultar_titulo_ctto_def
end type
type rb_fecha from radiobutton within w_consultar_titulo_ctto_def
end type
type pb_aceptar from picturebutton within w_consultar_titulo_ctto_def
end type
type dw_parque from datawindow within w_consultar_titulo_ctto_def
end type
type st_16 from statictext within w_consultar_titulo_ctto_def
end type
type p_fin from picture within w_consultar_titulo_ctto_def
end type
type em_fec_fin from editmask within w_consultar_titulo_ctto_def
end type
type st_2 from statictext within w_consultar_titulo_ctto_def
end type
type p_ini from picture within w_consultar_titulo_ctto_def
end type
type em_fec_ini from editmask within w_consultar_titulo_ctto_def
end type
type st_1 from statictext within w_consultar_titulo_ctto_def
end type
type dw_lista from datawindow within w_consultar_titulo_ctto_def
end type
type gb_1 from groupbox within w_consultar_titulo_ctto_def
end type
type gb_2 from groupbox within w_consultar_titulo_ctto_def
end type
type gb_3 from groupbox within w_consultar_titulo_ctto_def
end type
end forward

global type w_consultar_titulo_ctto_def from window
integer width = 3264
integer height = 2064
boolean titlebar = true
string title = "Consultar Titulo & Contrato Definitivo"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
st_5 st_5
st_4 st_4
em_numero em_numero
em_serie em_serie
em_base em_base
cb_1 cb_1
sle_1 sle_1
rb_ambas rb_ambas
rb_contrato_definitivo rb_contrato_definitivo
rb_titulo_dominio rb_titulo_dominio
dw_print_ctto_def dw_print_ctto_def
dw_print_titulo dw_print_titulo
cb_print_ccto_def cb_print_ccto_def
cb_print_titulo_dominio cb_print_titulo_dominio
cb_ctacte cb_ctacte
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
st_3 st_3
rb_parque rb_parque
rb_correlativo rb_correlativo
rb_fecha rb_fecha
pb_aceptar pb_aceptar
dw_parque dw_parque
st_16 st_16
p_fin p_fin
em_fec_fin em_fec_fin
st_2 st_2
p_ini p_ini
em_fec_ini em_fec_ini
st_1 st_1
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_consultar_titulo_ctto_def w_consultar_titulo_ctto_def

type variables
Long		il_row
String	is_filtro
end variables

forward prototypes
public subroutine wf_imprimir_contrato_definitivo ()
public subroutine wf_actualizar_datos ()
public subroutine wf_imprimir_titulo_de_dominio ()
public function string wf_fecha_palabra (date ad_fecha)
end prototypes

public subroutine wf_imprimir_contrato_definitivo ();Long		ll_resp,ll_tot_reg,ll_indi,ll_cod_accion,ll_correlativo,ll_numero,ll_rut,ll_count_reg
String	ls_estado,ls_clasificacion,ls_estado_envio,ls_base,ls_serie,ls_glosa
Datetime	ldt_fecha
Date		ldt_fecha_hoy
Double	ll_int

dw_print_ctto_def.Modify("DataWindow.Print.Preview = 'True'")
f_Print( dw_print_ctto_def )
//dw_print_ctto_def.print()
dw_print_ctto_def.Modify("DataWindow.Print.Preview = 'False'")
ll_resp							= messagebox("Advertencia","Se Imprimió correctamente Contrato Definitivo",Exclamation!,YesNo!,2)
if ll_resp=1 then
	ldt_fecha_hoy				= date(gdt_fec_sistema)
	ll_tot_reg					= dw_lista.rowcount()
	if ll_tot_reg>0 then
		if rb_titulo_dominio.checked=true then
			ls_estado			= 'G_T1'
			ls_clasificacion	= 'T1'
			ll_cod_accion		= 8
			ls_estado_envio	= '0'
		elseif rb_contrato_definitivo.checked=true then
			ls_estado			= 'G_D1'
			ls_clasificacion	= 'D1'
			ll_cod_accion		= 8
			ls_estado_envio	= '0'
		elseif rb_ambas.checked=true then
			ls_estado			= 'G_TD'
			ls_clasificacion	= 'TD'
			ll_cod_accion		= 8
			ls_estado_envio	= '0'
		end if
		SELECT	MAX("CARTA_LOG"."CORRELATIVO")  
		INTO 		:ll_correlativo  
		FROM 		"CARTA_LOG"  
		USING		sqlca;
		if isnull(ll_correlativo) then ll_correlativo=0
		SELECT 	"TASA"."TASA_INT_P"  ,	sysdate
		INTO 		:ll_int,						:ldt_fecha
		FROM 		"TASA"  ;
		
		for ll_indi=1 to ll_tot_reg
			ls_base				= dw_lista.getitemstring(ll_indi,'base')
			ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
			ll_rut				= dw_lista.getitemnumber(ll_indi,'rut')
			ls_glosa				= 'Impresión Contrato Definitivo Contrato Nº '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' el día '+string(ldt_fecha_hoy)
			SELECT	Count("CARTA_LOG"."NUMERO")  
			INTO 		:ll_count_reg  
			FROM 		"CARTA_LOG"  
			WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
					 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
					 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
					 ( "CARTA_LOG"."COD_ACCION" = :ll_cod_accion ) AND  
					 ( TO_DATE(SUBSTR(TO_CHAR("CARTA_LOG"."FECHA_CARTA",'dd/mm/yyyy'),1,10)) = :ldt_fecha_hoy )   
			USING		trans_2;
			if ll_count_reg=0 or isnull(ll_count_reg) then
				dw_lista.setitem(ll_indi,'estado_print_ctto_def',ls_estado)
				dw_lista.setitem(ll_indi,'fecha_estado_print_ctto_def',ldt_fecha_hoy)
				ll_correlativo ++
				INSERT INTO "CARTA_LOG"  
							( "BASE",	"SERIE",		"NUMERO",		"RUT",	"COD_ENVIO",	"ESTADO_ENV",		"FECHA_CARTA",	"MORA",	"COD_ACCION",		"CORRELATIVO",		"MORA_MANT",	"CLASIFICACION",		"USUARIO" )  
				VALUES 	( :ls_base,	:ls_serie,	:ll_numero,		:ll_rut,	:ls_base,   	:ls_estado_envio,	:ldt_fecha,   	0,			:ll_cod_accion,	:ll_correlativo,  0,  				:ls_clasificacion,   :gs_user )  
				USING		trans_1;
				if trans_1.sqlcode=0 then
					commit using trans_1;
				else
					rollback using trans_1;
					messagebox("Error Grabar","Error al Grabar SQL: "+trans_1.sqlerrtext)
				end if
			end if
		next
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit using sqlca;
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if		
	end if
end if
end subroutine

public subroutine wf_actualizar_datos ();Long		ll_tot_reg,ll_indi,ll_numero,ll_tot_pagado
String	ls_base,ls_serie,ls_fec_comp,ls_tot_pag_pal
Date		ldt_fecha_promesa
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_base				= dw_lista.getitemstring(ll_indi,'base')
		ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
		ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
		ldt_fecha_promesa	= date(dw_lista.getitemdatetime(ll_indi,'fecha_promesa'))
		ls_fec_comp			= wf_fecha_palabra(ldt_fecha_promesa)
		ll_tot_pagado		= dw_lista.getitemnumber(ll_indi,'total_pagado')
		ls_tot_pag_pal		= sle_1.uo_convertir_numero(string(ll_tot_pagado))
		UPDATE	"PROCESO_TITULO_CTTO_DEFINITIVO"  
		SET 		"TOTAL_PAGADO_PALABRAS" = :ls_tot_pag_pal,   
					"FECHA_PROMESA_PALABRAS" = :ls_fec_comp  
		WHERE  ( "PROCESO_TITULO_CTTO_DEFINITIVO"."BASE" = :ls_base ) AND  
				 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."SERIE" = :ls_serie ) AND  
				 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."NUMERO" = :ll_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	next
end if
end subroutine

public subroutine wf_imprimir_titulo_de_dominio ();Long		ll_resp,ll_tot_reg,ll_indi,ll_cod_accion,ll_correlativo,ll_numero,ll_rut,ll_count_reg
String	ls_estado,ls_clasificacion,ls_estado_envio,ls_base,ls_serie,ls_glosa
datetime	ldt_fecha
Date		ldt_fecha_hoy
Double	ll_int


dw_print_titulo.Modify("DataWindow.Print.Preview = 'True'")
f_Print( dw_print_titulo )
dw_print_titulo.Modify("DataWindow.Print.Preview = 'False'")
ll_resp							= messagebox("Advertencia","Se Imprimió correctamente Título Dominio",Exclamation!,YesNo!,2)
if ll_resp=1 then
	ldt_fecha_hoy				= date(gdt_fec_sistema)
	ll_tot_reg					= dw_lista.rowcount()
	if ll_tot_reg>0 then
		if rb_titulo_dominio.checked=true then
			ls_estado			= 'G_T1'
			ls_clasificacion	= 'T1'
			ll_cod_accion		= 16
			ls_estado_envio	= '0'
		elseif rb_contrato_definitivo.checked=true then
			ls_estado			= 'G_D1'
			ls_clasificacion	= 'D1'
			ll_cod_accion		= 16
			ls_estado_envio	= '0'
		elseif rb_ambas.checked=true then
			ls_estado			= 'G_TD'
			ls_clasificacion	= 'TD'
			ll_cod_accion		= 16
			ls_estado_envio	= '0'
		end if
		SELECT	MAX("CARTA_LOG"."CORRELATIVO")  
		INTO 		:ll_correlativo  
		FROM 		"CARTA_LOG"  
		USING		sqlca;
		if isnull(ll_correlativo) then ll_correlativo=0
		SELECT 	"TASA"."TASA_INT_P"  ,	sysdate
		INTO 		:ll_int,						:ldt_fecha
		FROM 		"TASA"  ;
		
		for ll_indi=1 to ll_tot_reg
			ls_base				= dw_lista.getitemstring(ll_indi,'base')
			ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
			ll_rut					= dw_lista.getitemnumber(ll_indi,'rut')
			ls_glosa				= dw_lista.getitemstring(ll_indi,'glosa')
			SELECT	Count("CARTA_LOG"."NUMERO")  
			INTO 		:ll_count_reg  
			FROM 		"CARTA_LOG"  
			WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
					 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
					 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
					 ( "CARTA_LOG"."COD_ACCION" = :ll_cod_accion ) AND  
					 ( TO_DATE(SUBSTR(TO_CHAR("CARTA_LOG"."FECHA_CARTA",'dd/mm/yyyy'),1,10)) = :ldt_fecha_hoy )   
			USING		trans_2;
			if ll_count_reg=0 or isnull(ll_count_reg) then
				dw_lista.setitem(ll_indi,'estado_print_titulo',ls_estado)
				dw_lista.setitem(ll_indi,'fecha_estado_print_titulo',ldt_fecha_hoy)
				ll_correlativo ++
				INSERT INTO "CARTA_LOG"  
							( "BASE",	"SERIE",		"NUMERO",		"RUT",	"COD_ENVIO",	"ESTADO_ENV",		"FECHA_CARTA",	"MORA",	"COD_ACCION",		"CORRELATIVO",		"MORA_MANT",	"CLASIFICACION",		"USUARIO" )  
				VALUES 	( :ls_base,	:ls_serie,	:ll_numero,		:ll_rut,	:ls_base,   	:ls_estado_envio,	:ldt_fecha,   	0,			:ll_cod_accion,	:ll_correlativo,  0,  				:ls_clasificacion,   :gs_user )  
				USING		trans_1;
				if trans_1.sqlcode=0 then
					commit using trans_1;
				else
					rollback using trans_1;
					messagebox("Error Grabar","Error al Grabar SQL: "+trans_1.sqlerrtext)
				end if
			end if
		next
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit using sqlca;
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end subroutine

public function string wf_fecha_palabra (date ad_fecha);string	ls_fec_comp,ls_fecha
Long		ll_dia_fec,ll_mes_fec,ll_anno_fec
ls_fecha							= string(ad_fecha,"dd/mm/yyyy")
CHOOSE CASE UPPER(DayName(date(ls_fecha)))
	CASE 'LUNES','MONDAY'
		ls_fec_comp				= 'Lunes'
	CASE 'MARTES','TUESDAY'
		ls_fec_comp				= 'Martes'
	CASE 'MIERCOLES','WEDNESDAY'
		ls_fec_comp				= 'Miércoles'
	CASE 'JUEVES','THURSDAY'
		ls_fec_comp				= 'Jueves'
	CASE 'VIERNES','FRIDAY'
		ls_fec_comp				= 'Viernes'
	CASE 'SABADO','SATURDAY'
		ls_fec_comp				= 'Sábado'
	CASE 'DOMINGO','SUNDAY'
		ls_fec_comp				= 'Domingo'
END CHOOSE
ll_dia_fec						= day(ad_fecha)
ll_mes_fec						= month(ad_fecha)
ll_anno_fec						= year(ad_fecha)
if ll_mes_fec=1 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Enero de '+string(ll_anno_fec)
elseif ll_mes_fec=2 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Febrero de '+string(ll_anno_fec)
elseif ll_mes_fec=3 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Marzo de '+string(ll_anno_fec)
elseif ll_mes_fec=4 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Abril de '+string(ll_anno_fec)
elseif ll_mes_fec=5 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Mayo de '+string(ll_anno_fec)
elseif ll_mes_fec=6 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Junio de '+string(ll_anno_fec)
elseif ll_mes_fec=7 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Julio de '+string(ll_anno_fec)
elseif ll_mes_fec=8 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Agosto de '+string(ll_anno_fec)
elseif ll_mes_fec=9 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Septiembre de '+string(ll_anno_fec)
elseif ll_mes_fec=10 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Octubre de '+string(ll_anno_fec)
elseif ll_mes_fec=11 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Noviembre de '+string(ll_anno_fec)
elseif ll_mes_fec=12 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Diciembre de '+string(ll_anno_fec)
end if
Return ls_fec_comp
end function

on w_consultar_titulo_ctto_def.create
this.st_5=create st_5
this.st_4=create st_4
this.em_numero=create em_numero
this.em_serie=create em_serie
this.em_base=create em_base
this.cb_1=create cb_1
this.sle_1=create sle_1
this.rb_ambas=create rb_ambas
this.rb_contrato_definitivo=create rb_contrato_definitivo
this.rb_titulo_dominio=create rb_titulo_dominio
this.dw_print_ctto_def=create dw_print_ctto_def
this.dw_print_titulo=create dw_print_titulo
this.cb_print_ccto_def=create cb_print_ccto_def
this.cb_print_titulo_dominio=create cb_print_titulo_dominio
this.cb_ctacte=create cb_ctacte
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.st_3=create st_3
this.rb_parque=create rb_parque
this.rb_correlativo=create rb_correlativo
this.rb_fecha=create rb_fecha
this.pb_aceptar=create pb_aceptar
this.dw_parque=create dw_parque
this.st_16=create st_16
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.st_5,&
this.st_4,&
this.em_numero,&
this.em_serie,&
this.em_base,&
this.cb_1,&
this.sle_1,&
this.rb_ambas,&
this.rb_contrato_definitivo,&
this.rb_titulo_dominio,&
this.dw_print_ctto_def,&
this.dw_print_titulo,&
this.cb_print_ccto_def,&
this.cb_print_titulo_dominio,&
this.cb_ctacte,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_cerrar,&
this.st_3,&
this.rb_parque,&
this.rb_correlativo,&
this.rb_fecha,&
this.pb_aceptar,&
this.dw_parque,&
this.st_16,&
this.p_fin,&
this.em_fec_fin,&
this.st_2,&
this.p_ini,&
this.em_fec_ini,&
this.st_1,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_consultar_titulo_ctto_def.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.em_numero)
destroy(this.em_serie)
destroy(this.em_base)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.rb_ambas)
destroy(this.rb_contrato_definitivo)
destroy(this.rb_titulo_dominio)
destroy(this.dw_print_ctto_def)
destroy(this.dw_print_titulo)
destroy(this.cb_print_ccto_def)
destroy(this.cb_print_titulo_dominio)
destroy(this.cb_ctacte)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.st_3)
destroy(this.rb_parque)
destroy(this.rb_correlativo)
destroy(this.rb_fecha)
destroy(this.pb_aceptar)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;gf_centrar(w_consultar_titulo_ctto_def)
connect using Trans_1;
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
rb_parque.checked		= true
rb_ambas.checked			= true
rb_parque.triggerevent(clicked!)
end event

event close;disconnect using Trans_1;
end event

type st_5 from statictext within w_consultar_titulo_ctto_def
integer x = 1490
integer y = 368
integer width = 46
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "-"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_consultar_titulo_ctto_def
integer x = 1317
integer y = 368
integer width = 46
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "-"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_numero from editmask within w_consultar_titulo_ctto_def
integer x = 1536
integer y = 352
integer width = 407
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

type em_serie from editmask within w_consultar_titulo_ctto_def
integer x = 1362
integer y = 356
integer width = 123
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

type em_base from editmask within w_consultar_titulo_ctto_def
integer x = 1189
integer y = 356
integer width = 123
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

type cb_1 from commandbutton within w_consultar_titulo_ctto_def
integer x = 1061
integer y = 1812
integer width = 215
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Setup"
end type

event clicked;PrintSetup ( )
end event

type sle_1 from uo_convierte_numero within w_consultar_titulo_ctto_def
boolean visible = false
integer x = 1024
integer y = 1984
integer width = 494
integer taborder = 0
boolean hideselection = false
end type

type rb_ambas from radiobutton within w_consultar_titulo_ctto_def
integer x = 2126
integer y = 56
integer width = 338
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Ambas"
boolean checked = true
end type

event clicked;dw_lista.reset()
dw_print_titulo.reset()
dw_print_ctto_def.reset()
cb_print_ccto_def.enabled			= true
cb_print_titulo_dominio.enabled	= true
end event

type rb_contrato_definitivo from radiobutton within w_consultar_titulo_ctto_def
integer x = 1143
integer y = 56
integer width = 704
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Contrato Definitivo"
end type

event clicked;dw_lista.reset()
dw_print_titulo.reset()
dw_print_ctto_def.reset()
cb_print_ccto_def.enabled			= true
cb_print_titulo_dominio.enabled	= false

end event

type rb_titulo_dominio from radiobutton within w_consultar_titulo_ctto_def
integer x = 110
integer y = 56
integer width = 704
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Titulo de Dominio"
end type

event clicked;dw_lista.reset()
dw_print_titulo.reset()
dw_print_ctto_def.reset()
cb_print_ccto_def.enabled			= false
cb_print_titulo_dominio.enabled	= true
end event

type dw_print_ctto_def from datawindow within w_consultar_titulo_ctto_def
boolean visible = false
integer x = 2313
integer y = 1916
integer width = 283
integer height = 168
string dataobject = "dw_imprimir_cttos_definitivos_por_fecha"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_print_titulo from datawindow within w_consultar_titulo_ctto_def
boolean visible = false
integer x = 1893
integer y = 1916
integer width = 283
integer height = 168
boolean bringtotop = true
string dataobject = "dw_imprimir_titulo_de_dominio_por_sol_aum"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_print_ccto_def from commandbutton within w_consultar_titulo_ctto_def
integer x = 2231
integer y = 1812
integer width = 439
integer height = 92
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Contrato &Definitivo"
end type

event clicked;if dw_print_ctto_def.rowcount()>0 then 
	wf_imprimir_contrato_definitivo()
end if

end event

type cb_print_titulo_dominio from commandbutton within w_consultar_titulo_ctto_def
integer x = 1879
integer y = 1812
integer width = 334
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Título Dominio"
end type

event clicked;if dw_print_titulo.rowcount()>0 then 
	
	wf_imprimir_titulo_de_dominio()
end if

end event

type cb_ctacte from commandbutton within w_consultar_titulo_ctto_def
event ue_mousemove pbm_mousemove
integer x = 1321
integer y = 1812
integer width = 407
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuen&ta Corriente"
end type

event clicked;string param
if il_row > 0 then
	gs_base			= dw_lista.getitemstring(il_row,'base')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'numero')
	gi_rut			= dw_lista.getitemnumber(il_row,'rut')
	param     		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R" //Reprog. Mant
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
		CASE "F","G"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			OpenWithParm(w_cuenta_corriente_funeraria,param) 
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if
end event

type cb_imprimir from commandbutton within w_consultar_titulo_ctto_def
event ue_mousemove pbm_mousemove
integer x = 805
integer y = 1812
integer width = 238
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
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

type cb_exportar from commandbutton within w_consultar_titulo_ctto_def
event ue_mousemove pbm_mousemove
integer x = 306
integer y = 1812
integer width = 238
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar from commandbutton within w_consultar_titulo_ctto_def
event ue_mousemove pbm_dwnmousemove
integer x = 64
integer y = 1812
integer width = 238
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_filtrar from commandbutton within w_consultar_titulo_ctto_def
integer x = 549
integer y = 1812
integer width = 238
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string	ls_formula
long 		ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string 	ls_texto
setnull (is_filtro)
dw_lista.SETfilter(is_filtro)
dw_lista.filter()
ll_filas				= dw_lista.rowcount()
ls_formula 			= dw_lista.describe("datawindow.syntax")
ll_largototal		= len(ls_formula)
ll_posini			= Pos(ls_formula, "filter") + 8
ll_posfin			= len("~nfilter~n")
ls_texto				= mid(ls_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(ls_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto				= ll_posfin - ll_posini
ls_formula			= trim(mid(ls_formula,ll_posini,ll_resto))
if mid(ls_formula,1,2)='7;' then
	ls_formula		= ''
end if
dw_print_ctto_def.SETfilter(ls_formula)
dw_print_titulo.SETfilter(ls_formula)
dw_print_ctto_def.filter()
dw_print_titulo.filter()
is_filtro	= ls_formula

end event

type cb_cerrar from commandbutton within w_consultar_titulo_ctto_def
integer x = 2907
integer y = 1812
integer width = 274
integer height = 92
integer taborder = 170
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_consultar_titulo_ctto_def)
end event

type st_3 from statictext within w_consultar_titulo_ctto_def
integer x = 1065
integer y = 368
integer width = 105
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº:"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_parque from radiobutton within w_consultar_titulo_ctto_def
integer x = 2126
integer y = 268
integer width = 343
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
boolean checked = true
end type

event clicked;dw_lista.reset()
dw_print_titulo.reset()
dw_print_ctto_def.reset()
if this.checked=true then
	dw_lista.dataobject				= 'dw_consultar_titulo_dominio_ctto_def_par'
	dw_print_titulo.dataobject		= 'dw_imprimir_titulo_de_dominio_por_parque'
	dw_print_ctto_def.dataobject	= 'dw_imprimir_cttos_definitivos_por_parque'
	dw_lista.settransobject(sqlca)
	dw_print_titulo.settransobject(sqlca)
	dw_print_ctto_def.settransobject(sqlca)
	dw_parque.reset()
	dw_parque.insertrow(0)
	if gs_conexion	= "Parque El Prado" then
		dw_parque.setitem(1,'cod_parque',1)
	elseif gs_conexion = "Parque La Foresta" then
		dw_parque.setitem(1,'cod_parque',11)
	elseif gs_conexion = "Parque Santiago" then
		dw_parque.setitem(1,'cod_parque',103)
	elseif gs_conexion = "Parque Concepción" then
		dw_parque.setitem(1,'cod_parque',801)
	end if
	dw_parque.accepttext()
	dw_parque.enabled		= true
	dw_parque.setfocus()
end if
em_fec_ini.text			= ''
em_fec_fin.text			= ''
em_fec_ini.enabled		= false
em_fec_fin.enabled		= false
em_base.text				= ''
em_serie.text				= ''
em_numero.text				= ''
em_base.enabled			= false
em_serie.enabled			= false
em_numero.enabled			= false

end event

type rb_correlativo from radiobutton within w_consultar_titulo_ctto_def
integer x = 1143
integer y = 268
integer width = 677
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Contrato"
end type

event clicked;dw_lista.reset()
dw_print_titulo.reset()
dw_print_ctto_def.reset()
if this.checked=true then
	dw_lista.dataobject				= 'dw_consultar_titulo_dominio_ctto_def_cor'
//	dw_print_titulo.dataobject		= 'dw_imprimir_titulo_de_dominio_por_corr'
	dw_print_titulo.dataobject		= 'dw_imprimir_titulo_de_dominio_por_sol'
	dw_print_ctto_def.dataobject	= 'dw_imprimir_cttos_definitivos_por_corr'
	dw_lista.settransobject(sqlca)
	dw_print_titulo.settransobject(sqlca)
	dw_print_ctto_def.settransobject(sqlca)
	em_base.text		= ''
	em_serie.text		= ''
	em_numero.text		= ''
	em_base.enabled	= true
	em_serie.enabled	= true
	em_numero.enabled	= true
	em_base.setfocus()
end if
em_fec_ini.text			= ''
em_fec_fin.text			= ''
em_fec_ini.enabled		= false
em_fec_fin.enabled		= false
dw_parque.reset()
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(1,'cod_parque',1)
elseif gs_conexion = "Parque La Foresta" then
	dw_parque.setitem(1,'cod_parque',11)
elseif gs_conexion = "Parque Santiago" then
	dw_parque.setitem(1,'cod_parque',103)
elseif gs_conexion = "Parque Concepción" then
	dw_parque.setitem(1,'cod_parque',801)
end if
dw_parque.accepttext()
dw_parque.enabled			= false
end event

type rb_fecha from radiobutton within w_consultar_titulo_ctto_def
integer x = 110
integer y = 268
integer width = 457
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Rango Fecha"
end type

event clicked;dw_lista.reset()
dw_print_titulo.reset()
dw_print_ctto_def.reset()
if this.checked=true then
	dw_lista.dataobject				= 'dw_consultar_titulo_dominio_ctto_def'
	dw_print_titulo.dataobject		= 'dw_imprimir_titulo_de_dominio_por_fecha'
	dw_print_ctto_def.dataobject	= 'dw_imprimir_cttos_definitivos_por_fecha'
	dw_lista.settransobject(sqlca)
	dw_print_titulo.settransobject(sqlca)
	dw_print_ctto_def.settransobject(sqlca)
	em_fec_ini.text					= string(today(),"dd/mm/yyyy")
	em_fec_fin.text					= string(today(),"dd/mm/yyyy")
	em_fec_ini.enabled				= true
	em_fec_fin.enabled				= true
	em_fec_ini.setfocus()
end if
em_base.text							= ''
em_serie.text							= ''
em_numero.text							= ''
em_base.enabled						= false
em_serie.enabled						= false
em_numero.enabled						= false
dw_parque.reset()
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(1,'cod_parque',1)
elseif gs_conexion = "Parque La Foresta" then
	dw_parque.setitem(1,'cod_parque',11)
elseif gs_conexion = "Parque Santiago" then
	dw_parque.setitem(1,'cod_parque',103)
elseif gs_conexion = "Parque Concepción" then
	dw_parque.setitem(1,'cod_parque',801)
end if
dw_parque.accepttext()
dw_parque.enabled						= false
end event

type pb_aceptar from picturebutton within w_consultar_titulo_ctto_def
event ue_mousemove pbm_mousemove
integer x = 2967
integer y = 332
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
end type

event clicked;Date		ldt_fecha_promesa
Long		ll_tot_reg,ll_indi,ll_numero,ll_new,ll_count,ll_cod_accion,ll_tot_porc,ll_tot_porc_aux,&
			ll_cod_parque,ll_tot_pagado,ll_rut,ll_aum_capacidad,ll_aum_numero,ll_plazo,ll_ctas_pag,ll_saldo
String	ls_cod_jefe,ls_cod_sup,ls_cod_age,ls_base,ls_serie,ls_estado_env,ls_cod_envio,ls_clasif,&
			ls_fec_comp,ls_tot_pag_pal
Datetime	ldt_fecha,ld_fecha_pago,ld_fec_fin,ld_fec_ini

SetPointer(HourGlass!)
if rb_fecha.checked=true then
	dw_lista.reset()
	ld_fec_ini		= datetime(date(em_fec_ini.text),time('00:00:00'))
	ld_fec_fin		= datetime(date(em_fec_fin.text),time('23:59:59'))
	if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_fec_ini.setfocus()
	else
		if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
			messagebox("Advertencia","Fecha Término Inválida")
			em_fec_fin.setfocus()
		else
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
				messagebox("Advertencia","No registra dato")
			else
				wf_actualizar_datos()
				dw_print_titulo.retrieve(ld_fec_ini,ld_fec_fin)
				dw_print_ctto_def.retrieve(ld_fec_ini,ld_fec_fin)
			end if
		end if
	end if
elseif rb_correlativo.checked=true then
	dw_lista.reset()
	ls_base		= trim(em_base.text)
	ls_serie		= trim(em_serie.text)
	ll_numero	= long(em_numero.text)
	if em_base.text='' or isnull(em_numero.text) then
		messagebox("Advertencia","Debe Ingresar Base")
		em_base.setfocus()
	else
		if em_serie.text='' or isnull(em_serie.text) then
			messagebox("Advertencia","Debe Ingresar Serie")
			em_serie.setfocus()
		else
			if Double(em_numero.text)=0 or isnull(em_numero.text) then
				messagebox("Advertencia","Debe Ingresar Número")
				em_numero.setfocus()
			else
				if dw_lista.retrieve(ls_base,ls_serie,ll_numero)=0 then
					messagebox("Advertencia","No registra dato")
				else
					gl_cod_parque_cta	= dw_lista.getitemnumber(1,'cod_parque')
					ll_rut						= dw_lista.getitemnumber(1,'rut')
					SELECT 	"PAGO_AUMENTO"."CAPACIDAD","ANEXO_AUMENTO"."NRO_AUMENTO","PAGO_AUMENTO"."NRO_CUOTAS", "ANEXO_AUMENTO"."CTA_PAG_M"
					INTO 		:ll_aum_capacidad,:ll_aum_numero,:ll_plazo,:ll_ctas_pag
					FROM 	"ANEXO_AUMENTO",
								"PAGO_AUMENTO"
					WHERE 	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and
								"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
								"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
								"ANEXO_AUMENTO"."BASE" = :ls_base AND  
								"ANEXO_AUMENTO"."SERIE" = :ls_serie AND  
								"ANEXO_AUMENTO"."NRO_OFERTA" = :ll_numero AND  
								"ANEXO_AUMENTO"."RUT" = :ll_rut
					USING	sqlca;
					ll_saldo =  ll_plazo - ll_ctas_pag
					if isnull(ll_saldo) or ll_saldo < 0 then
						ll_saldo	= 0
					end if	
					if ll_aum_numero > 0 and ll_saldo = 0 then
						dw_print_titulo.dataobject = 'dw_imprimir_titulo_de_dominio_por_sol_aum'
						dw_print_titulo.settransobject(sqlca)
					end if	
					if gl_cod_parque_cta = 1 then
						dw_print_titulo.object.p_prado.visible	= true
						dw_print_titulo.object.p_canaan.visible	= false
						dw_print_titulo.object.p_manantial.visible	= false
						dw_print_titulo.object.p_santiago.visible	= false
						dw_print_titulo.object.p_foresta.visible	= false
					elseif gl_cod_parque_cta = 101 then
						dw_print_titulo.object.p_prado.visible	= false
						dw_print_titulo.object.p_canaan.visible	= true
						dw_print_titulo.object.p_manantial.visible	= false
						dw_print_titulo.object.p_santiago.visible	= false
						dw_print_titulo.object.p_foresta.visible	= false
					elseif gl_cod_parque_cta = 102 then
						dw_print_titulo.object.p_prado.visible	= false
						dw_print_titulo.object.p_canaan.visible	= false
						dw_print_titulo.object.p_manantial.visible	= true
						dw_print_titulo.object.p_santiago.visible	= false
						dw_print_titulo.object.p_foresta.visible	= false
					elseif gl_cod_parque_cta = 103 then
						dw_print_titulo.object.p_prado.visible	= false
						dw_print_titulo.object.p_canaan.visible	= false
						dw_print_titulo.object.p_manantial.visible	= false
						dw_print_titulo.object.p_santiago.visible	= true
						dw_print_titulo.object.p_foresta.visible	= false
					elseif gl_cod_parque_cta = 11 then
						dw_print_titulo.object.p_prado.visible	= false
						dw_print_titulo.object.p_canaan.visible	= false
						dw_print_titulo.object.p_manantial.visible	= false
						dw_print_titulo.object.p_santiago.visible	= false
						dw_print_titulo.object.p_foresta.visible	= true
					end if
					wf_actualizar_datos()
					dw_print_titulo.retrieve(ls_base,ls_serie,ll_numero)
					dw_print_ctto_def.retrieve(ls_base,ls_serie,ll_numero)
					if ll_aum_numero > 0 and ll_saldo = 0 then
						dw_print_titulo.setitem(1,'cap_aumento',ll_aum_capacidad)
						dw_print_titulo.setitem(1,'nro_aumento',ll_aum_numero)
						dw_print_titulo.accepttext()
					end if			
				end if
			end if
		end if
	end if
elseif rb_parque.checked=true then
	dw_lista.reset()
	dw_parque.accepttext()
	ll_cod_parque			= dw_parque.getitemnumber(1,'cod_parque')
	gl_cod_parque_cta	= ll_cod_parque
	if ll_cod_parque>0 then
		if dw_lista.retrieve(ll_cod_parque)=0 then
			messagebox("Advertencia","No registra dato")
		else
			wf_actualizar_datos()
			dw_print_titulo.retrieve(ll_cod_parque)
			dw_print_ctto_def.retrieve(ll_cod_parque)
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Parque")
		dw_parque.setfocus()
	end if
end if
SetPointer(arrow!)
end event

type dw_parque from datawindow within w_consultar_titulo_ctto_def
integer x = 2318
integer y = 356
integer width = 594
integer height = 104
integer taborder = 60
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
dw_parque.accepttext()
gl_cod_parque_cta	= dw_parque.getitemnumber(1,'cod_parque')
end event

type st_16 from statictext within w_consultar_titulo_ctto_def
integer x = 2135
integer y = 372
integer width = 169
integer height = 60
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

type p_fin from picture within w_consultar_titulo_ctto_def
integer x = 786
integer y = 460
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if rb_fecha.checked=true then
	dw_lista.reset()
	if f_valida_fecha(em_fec_fin.text)=-1 then 
		em_fec_fin.text=string(today(),gs_formato_fecha)
		em_fec_fin.setfocus()
		return
	end if	
	if em_fec_fin.text<>'00/00/0000' then
		ls_fecha = em_fec_fin.text
	else
		ls_fecha = string(today(),gs_formato_fecha)
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
end if
end event

type em_fec_fin from editmask within w_consultar_titulo_ctto_def
integer x = 475
integer y = 460
integer width = 306
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_consultar_titulo_ctto_def
integer x = 320
integer y = 472
integer width = 155
integer height = 64
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

type p_ini from picture within w_consultar_titulo_ctto_def
integer x = 786
integer y = 356
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string 	ls_fecha,fech
long 		uf

if rb_fecha.checked=true then
	dw_lista.reset()
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
end if
end event

type em_fec_ini from editmask within w_consultar_titulo_ctto_def
integer x = 475
integer y = 356
integer width = 306
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_1 from statictext within w_consultar_titulo_ctto_def
integer x = 133
integer y = 368
integer width = 338
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha desde:"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_consultar_titulo_ctto_def
integer x = 37
integer y = 596
integer width = 3145
integer height = 1168
integer taborder = 80
string title = "none"
string dataobject = "dw_consultar_titulo_dominio_ctto_def_cor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gl_cod_parque_cta	= this.getitemnumber(il_row,'cod_parque')
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row				= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gl_cod_parque_cta	= this.getitemnumber(il_row,'cod_parque')
end if
end event

type gb_1 from groupbox within w_consultar_titulo_ctto_def
integer x = 41
integer y = 192
integer width = 3141
integer height = 384
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selecione Opción de Busqueda"
end type

type gb_2 from groupbox within w_consultar_titulo_ctto_def
integer x = 37
integer y = 1760
integer width = 1266
integer height = 164
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within w_consultar_titulo_ctto_def
integer x = 41
integer width = 3141
integer height = 164
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

