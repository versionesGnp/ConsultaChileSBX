forward
global type w_analisis_cliente_promesas from window
end type
type em_nro_cuotas_hasta from editmask within w_analisis_cliente_promesas
end type
type st_hasta from statictext within w_analisis_cliente_promesas
end type
type cb_proceso_bkp from commandbutton within w_analisis_cliente_promesas
end type
type em_nro_cuotas from editmask within w_analisis_cliente_promesas
end type
type st_cuotas from statictext within w_analisis_cliente_promesas
end type
type st_todos from statictext within w_analisis_cliente_promesas
end type
type st_reprogramadas from statictext within w_analisis_cliente_promesas
end type
type st_resueltas from statictext within w_analisis_cliente_promesas
end type
type st_resciliadas from statictext within w_analisis_cliente_promesas
end type
type st_cancelado from statictext within w_analisis_cliente_promesas
end type
type st_vigente from statictext within w_analisis_cliente_promesas
end type
type rb_edad from radiobutton within w_analisis_cliente_promesas
end type
type rb_renta from radiobutton within w_analisis_cliente_promesas
end type
type cb_exportar from commandbutton within w_analisis_cliente_promesas
end type
type cb_2 from commandbutton within w_analisis_cliente_promesas
end type
type cb_1 from commandbutton within w_analisis_cliente_promesas
end type
type cb_proceso from commandbutton within w_analisis_cliente_promesas
end type
type pb_calend2 from picturebutton within w_analisis_cliente_promesas
end type
type pb_calend from picturebutton within w_analisis_cliente_promesas
end type
type em_termino from editmask within w_analisis_cliente_promesas
end type
type em_inicio from editmask within w_analisis_cliente_promesas
end type
type st_termino from statictext within w_analisis_cliente_promesas
end type
type st_1 from statictext within w_analisis_cliente_promesas
end type
type cb_cerrar from commandbutton within w_analisis_cliente_promesas
end type
type gb_1 from groupbox within w_analisis_cliente_promesas
end type
type st_2 from statictext within w_analisis_cliente_promesas
end type
type st_porcen from statictext within w_analisis_cliente_promesas
end type
type hpb_1 from hprogressbar within w_analisis_cliente_promesas
end type
type dw_muestra_edad from datawindow within w_analisis_cliente_promesas
end type
type dw_muestra_renta from datawindow within w_analisis_cliente_promesas
end type
end forward

global type w_analisis_cliente_promesas from window
integer width = 3497
integer height = 1920
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
em_nro_cuotas_hasta em_nro_cuotas_hasta
st_hasta st_hasta
cb_proceso_bkp cb_proceso_bkp
em_nro_cuotas em_nro_cuotas
st_cuotas st_cuotas
st_todos st_todos
st_reprogramadas st_reprogramadas
st_resueltas st_resueltas
st_resciliadas st_resciliadas
st_cancelado st_cancelado
st_vigente st_vigente
rb_edad rb_edad
rb_renta rb_renta
cb_exportar cb_exportar
cb_2 cb_2
cb_1 cb_1
cb_proceso cb_proceso
pb_calend2 pb_calend2
pb_calend pb_calend
em_termino em_termino
em_inicio em_inicio
st_termino st_termino
st_1 st_1
cb_cerrar cb_cerrar
gb_1 gb_1
st_2 st_2
st_porcen st_porcen
hpb_1 hpb_1
dw_muestra_edad dw_muestra_edad
dw_muestra_renta dw_muestra_renta
end type
global w_analisis_cliente_promesas w_analisis_cliente_promesas

type variables
date		id_fecha_ini, id_fecha_fin, id_fecha_mov, id_fecha_nac,idt_fecha_hoy
datetime	idt_fec_paso_mov, idt_fec_paso_nac, idt_fecha_paso_prim
Long		il_renta, il_cont_0_200, il_cont_201_300, il_cont_301_400, il_cont_401_500,&
			il_cont_501_600, il_cont_601_700, il_cont_701_800, il_cont_801_900,&
			il_cont_901_1000, il_cont_may_1000, il_edad, il_cuo_digitada_desde, il_cuo_digitada_hasta,&
			il_edad_0_30, il_edad_31_40, il_edad_41_50, il_edad_51_60, il_edad_61_70,&
			il_edad_may_70, il_cuotas_mora, il_cta_pag_s, il_sw, il_year_aux
String	is_estado, is_est_cons

end variables

forward prototypes
public subroutine wf_calculo_renta (long al_renta)
public subroutine wf_calculo_edad (long al_edad)
public subroutine wf_valida_vigente ()
end prototypes

public subroutine wf_calculo_renta (long al_renta);if al_renta >=0 and al_renta <= 200 then
	il_cont_0_200++
elseif al_renta >=201 and al_renta <= 300 then
	il_cont_201_300++
elseif al_renta >=301 and al_renta <= 400 then
	il_cont_301_400++
elseif al_renta >=401 and al_renta <= 500 then
	il_cont_401_500++
elseif al_renta >=501 and al_renta <= 600 then
	il_cont_501_600++
elseif al_renta >=601 and al_renta <= 700 then
	il_cont_601_700++
elseif al_renta >=701 and al_renta <= 800 then
	il_cont_701_800++
elseif al_renta >=801 and al_renta <= 900 then
	il_cont_801_900++
elseif al_renta >=901 and al_renta <= 1000 then
	il_cont_901_1000++
elseif al_renta >=1001 then
	il_cont_may_1000++
end if
end subroutine

public subroutine wf_calculo_edad (long al_edad);if al_edad >=0 and al_edad <= 30 then
	il_edad_0_30++
elseif al_edad >=31 and al_edad <= 40 then
	il_edad_31_40++
elseif al_edad >=41 and al_edad <= 50 then
	il_edad_41_50++
elseif al_edad >=51 and al_edad <= 60 then
	il_edad_51_60++
elseif al_edad >=61 and al_edad <= 70 then
	il_edad_61_70++
elseif al_edad > 70 then
	il_edad_may_70++
end if
end subroutine

public subroutine wf_valida_vigente ();Long ll_year_mov, ll_new, ll_new_2
ll_year_mov	= long(year(id_fecha_mov))
if il_sw = 0 and ll_year_mov <> il_year_aux then
	il_sw = 1
else
	// calculo de Renta
	il_renta	= il_renta / 1000
	wf_calculo_renta(il_renta)
	// Calculo de edad
	il_edad	= year(idt_fecha_hoy) - year(id_fecha_nac)
	if month(idt_fecha_hoy) < month(id_fecha_nac) then
		il_edad++
	elseif (month(idt_fecha_hoy) = month(id_fecha_nac)) and (day(idt_fecha_hoy) >= day(id_fecha_nac))then
		il_edad++
	end if
	wf_calculo_edad(il_edad)
end if
if ll_year_mov	<> il_year_aux then
	ll_new	= dw_muestra_renta.insertrow(0)
	ll_new_2	= dw_muestra_edad.insertrow(0)
	dw_muestra_renta.setitem(ll_new,'year',il_year_aux)
	dw_muestra_renta.setitem(ll_new,'rango_0_200',il_cont_0_200)
	dw_muestra_renta.setitem(ll_new,'rango_201_300',il_cont_201_300)
	dw_muestra_renta.setitem(ll_new,'rango_301_400',il_cont_301_400)
	dw_muestra_renta.setitem(ll_new,'rango_401_500',il_cont_401_500)
	dw_muestra_renta.setitem(ll_new,'rango_501_600',il_cont_501_600)
	dw_muestra_renta.setitem(ll_new,'rango_601_700',il_cont_601_700)
	dw_muestra_renta.setitem(ll_new,'rango_701_800',il_cont_701_800)
	dw_muestra_renta.setitem(ll_new,'rango_801_900',il_cont_801_900)
	dw_muestra_renta.setitem(ll_new,'rango_901_1000',il_cont_901_1000)
	dw_muestra_renta.setitem(ll_new,'rango_may_1000',il_cont_may_1000)
	dw_muestra_edad.setitem(ll_new_2,'year',il_year_aux)
	dw_muestra_edad.setitem(ll_new_2,'rango_0_30',il_edad_0_30)
	dw_muestra_edad.setitem(ll_new_2,'rango_31_40',il_edad_31_40)
	dw_muestra_edad.setitem(ll_new_2,'rango_41_50',il_edad_41_50)
	dw_muestra_edad.setitem(ll_new_2,'rango_51_60',il_edad_51_60)
	dw_muestra_edad.setitem(ll_new_2,'rango_61_70',il_edad_61_70)
	dw_muestra_edad.setitem(ll_new_2,'rango_mayor_70',il_edad_may_70)
	il_year_aux	= ll_year_mov
	il_cont_0_200=0; il_cont_201_300=0; il_cont_301_400=0; il_cont_401_500=0
	il_cont_501_600=0; il_cont_601_700=0; il_cont_701_800=0; il_cont_801_900=0
	il_cont_901_1000=0; il_cont_may_1000=0; il_edad_0_30=0; il_edad_31_40=0
	il_edad_41_50=0;il_edad_51_60=0; il_edad_61_70=0; il_edad_may_70=0
end if
end subroutine

on w_analisis_cliente_promesas.create
this.em_nro_cuotas_hasta=create em_nro_cuotas_hasta
this.st_hasta=create st_hasta
this.cb_proceso_bkp=create cb_proceso_bkp
this.em_nro_cuotas=create em_nro_cuotas
this.st_cuotas=create st_cuotas
this.st_todos=create st_todos
this.st_reprogramadas=create st_reprogramadas
this.st_resueltas=create st_resueltas
this.st_resciliadas=create st_resciliadas
this.st_cancelado=create st_cancelado
this.st_vigente=create st_vigente
this.rb_edad=create rb_edad
this.rb_renta=create rb_renta
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_proceso=create cb_proceso
this.pb_calend2=create pb_calend2
this.pb_calend=create pb_calend
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_termino=create st_termino
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.st_2=create st_2
this.st_porcen=create st_porcen
this.hpb_1=create hpb_1
this.dw_muestra_edad=create dw_muestra_edad
this.dw_muestra_renta=create dw_muestra_renta
this.Control[]={this.em_nro_cuotas_hasta,&
this.st_hasta,&
this.cb_proceso_bkp,&
this.em_nro_cuotas,&
this.st_cuotas,&
this.st_todos,&
this.st_reprogramadas,&
this.st_resueltas,&
this.st_resciliadas,&
this.st_cancelado,&
this.st_vigente,&
this.rb_edad,&
this.rb_renta,&
this.cb_exportar,&
this.cb_2,&
this.cb_1,&
this.cb_proceso,&
this.pb_calend2,&
this.pb_calend,&
this.em_termino,&
this.em_inicio,&
this.st_termino,&
this.st_1,&
this.cb_cerrar,&
this.gb_1,&
this.st_2,&
this.st_porcen,&
this.hpb_1,&
this.dw_muestra_edad,&
this.dw_muestra_renta}
end on

on w_analisis_cliente_promesas.destroy
destroy(this.em_nro_cuotas_hasta)
destroy(this.st_hasta)
destroy(this.cb_proceso_bkp)
destroy(this.em_nro_cuotas)
destroy(this.st_cuotas)
destroy(this.st_todos)
destroy(this.st_reprogramadas)
destroy(this.st_resueltas)
destroy(this.st_resciliadas)
destroy(this.st_cancelado)
destroy(this.st_vigente)
destroy(this.rb_edad)
destroy(this.rb_renta)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_proceso)
destroy(this.pb_calend2)
destroy(this.pb_calend)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_termino)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.st_2)
destroy(this.st_porcen)
destroy(this.hpb_1)
destroy(this.dw_muestra_edad)
destroy(this.dw_muestra_renta)
end on

event open;if gi_tipo_analisis = 1 then this.title = 'Clientes de Promesas según Renta en Miles de Pesos'
if gi_tipo_analisis = 2 then this.title = 'Clientes de Promesas según Edad'
gf_centrar(w_analisis_cliente_promesas)
idt_fecha_hoy					= date(gdt_fec_sistema)
em_inicio.text					= string(idt_fecha_hoy)
em_termino.text				= string(idt_fecha_hoy)
dw_muestra_edad.settransobject(sqlca)
dw_muestra_renta.settransobject(sqlca)
dw_muestra_edad.visible		= false
st_cuotas.visible				= false
em_nro_cuotas.visible		= false
st_hasta.visible				= false
em_nro_cuotas_hasta.visible= false
dw_muestra_renta.visible	= true
st_todos.visible				= true
st_vigente.visible			= true
st_cancelado.visible			= true
st_resciliadas.visible		= true
st_resueltas.visible			= true
st_reprogramadas.visible	= true


if gi_parque_select = 1 then
	dw_muestra_renta.object.t_titulo.text	= 'PARQUE EL PRADO'
	dw_muestra_edad.object.t_titulo.text 	= 'PARQUE EL PRADO'
elseif gi_parque_select = 102 then
	dw_muestra_renta.object.t_titulo.text 	= 'PARQUE EL MANANTIAL'
	dw_muestra_edad.object.t_titulo.text	= 'PARQUE EL MANANTIAL'
elseif gi_parque_select = 11 then
	dw_muestra_renta.object.t_titulo.text 	= 'PARQUE LA FORESTA'
	dw_muestra_edad.object.t_titulo.text	= 'PARQUE LA FORESTA'
elseif gi_parque_select = 801 then
	dw_muestra_renta.object.t_titulo.text 	= 'PARQUE CONCEPCION'
	dw_muestra_edad.object.t_titulo.text	= 'PARQUE CONCEPCION'
end if


//if gs_empresa = 'El Prado' then
//	dw_muestra_renta.object.t_titulo.text	= 'PARQUE EL PRADO'
//	dw_muestra_edad.object.t_titulo.text 	= 'PARQUE EL PRADO'
//else

//end if
dw_muestra_renta.object.t_usuario.text 	= gs_user
dw_muestra_edad.object.t_usuario.text 		= gs_user
dw_muestra_renta.object.t_fecha.text 		= string(idt_fecha_hoy)
dw_muestra_edad.object.t_fecha.text 		= string(idt_fecha_hoy)
is_est_cons						= '%'
st_todos.textcolor			= rgb(255,0,0)
st_vigente.textcolor			= rgb(0,0,128)
st_cancelado.textcolor		= rgb(0,0,128)
st_resciliadas.textcolor	= rgb(0,0,128)
st_resueltas.textcolor		= rgb(0,0,128)
st_reprogramadas.textcolor	= rgb(0,0,128)
end event

type em_nro_cuotas_hasta from editmask within w_analisis_cliente_promesas
boolean visible = false
integer x = 2633
integer y = 52
integer width = 247
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####0"
end type

event modified;il_cuo_digitada_hasta		= long(this.text)
if il_cuo_digitada_hasta <= 0 then this.text = '0'
if il_cuo_digitada_hasta <> 0 then
	if il_cuo_digitada_hasta < il_cuo_digitada_desde then
		messagebox("Advertencia","Rango de Cuota Invalida")
		il_cuo_digitada_hasta	= 0
		il_cuo_digitada_desde	= 0
		em_nro_cuotas_hasta.text= ''
		em_nro_cuotas.text		= ''
	end if
end if
end event

type st_hasta from statictext within w_analisis_cliente_promesas
boolean visible = false
integer x = 2446
integer y = 60
integer width = 151
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 82042848
string text = "Hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_proceso_bkp from commandbutton within w_analisis_cliente_promesas
boolean visible = false
integer x = 3013
integer y = 44
integer width = 96
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Proceso"
end type

event clicked;//long		ll_year_mov, ll_year_aux, ll_new, ll_count, ll_uno=0, ll_valor
//long 		ll_cuo_mora
//String	ls_select
//il_cont_0_200=0; il_cont_201_300=0; il_cont_301_400=0; il_cont_401_500=0
//il_cont_501_600=0; il_cont_601_700=0; il_cont_701_800=0; il_cont_801_900=0
//il_cont_901_1000=0; il_cont_may_1000=0; il_edad_0_30=0; il_edad_31_40=0
//il_edad_41_50=0;il_edad_51_60=0; il_edad_61_70=0; il_edad_may_70=0
//id_fecha_ini	= date(em_inicio.text)
//id_fecha_fin	= date(em_termino.text)
//gd_fec_ran_fin	= date(id_fecha_fin)
//if isnull(il_cuo_digitada) or il_cuo_digitada <= 0 then il_cuo_digitada=0
//if id_fecha_ini >= id_fecha_fin then
//	messagebox("Error","Rango de Fecha Incorrecta")
//else
//	SetPointer(HourGlass!)
//	st_2.visible		= true
//	hpb_1.visible		= true
//	st_porcen.visible	= true
//	st_porcen.text		= '0 %'
//	dw_muestra_edad.reset()
//	dw_muestra_renta.reset()
//	gs_est_cons			= is_est_cons
//	CHOOSE CASE is_est_cons
//		CASE 'V'
//			if il_cuo_digitada=0 or il_cuo_digitada=1 then
//				dw_muestra_renta.object.t_titulo_2.text	= 'Contratos Vigentes con <= a '+STRING(il_cuo_digitada)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//				dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Vigentes con <= a '+STRING(il_cuo_digitada)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//			end if
//		CASE '%'
//			dw_muestra_renta.object.t_titulo_2.text	= 'Todos los Estados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//			dw_muestra_edad.object.t_titulo_2.text 	= 'Todos los Estados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//		CASE 'C'
//			dw_muestra_renta.object.t_titulo_2.text 	= 'Contratos Cancelados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//			dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Cancelados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//		CASE 'N'
//			dw_muestra_renta.object.t_titulo_2.text	= 'Contratos Resciliados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//			dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Resciliados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//		CASE 'R'
//			dw_muestra_renta.object.t_titulo_2.text 	= 'Contratos Resueltos, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//			dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Resueltos, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//		CASE 'P'
//			dw_muestra_renta.object.t_titulo_2.text	= 'Contratos Nulas por Reprogramación, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//			dw_muestra_edad.object.t_titulo_2.text		= 'Contratos Nulas por Reprogramación, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
//	END CHOOSE
//	SELECT count(CADENA.NUMERO) INTO :ll_count FROM CLIENTE, OFERTA_V, PAGO_OFERTA, CADENA WHERE  (OFERTA_V.SERIE = PAGO_OFERTA.SERIE) and (OFERTA_V.NRO_OFERTA = PAGO_OFERTA.NRO_OFERTA) and (OFERTA_V.ULT_FOLIO = PAGO_OFERTA.FOLIO) and (OFERTA_V.SERIE = CADENA.SERIE) and (OFERTA_V.NRO_OFERTA = CADENA.NUMERO) and (CLIENTE.RUT = OFERTA_V.RUT) and (OFERTA_V.FECHA >= :id_fecha_ini AND OFERTA_V.FECHA <= :id_fecha_fin) AND CLIENTE.RUT < 40000000 AND CADENA.CODIGO = 'O' and CADENA.ESTADO like :is_est_cons Using sqlca;
//	ls_select = 'SELECT CLIENTE.TOTAL_RENT,'+&
//					 '	OFERTA_V.FECHA,'+&
//					 ' CADENA.ESTADO,'+&
//					 ' CLIENTE.FECHA_NAC,'+&
//					 ' PAGO_OFERTA.FECHA_PRIM,'+&
//					 ' PAGO_OFERTA.NRO_CUOTAS,'+&
//					 ' OFERTA_V.CTA_PAG_S'+&
//					 ' FROM CLIENTE, '+&
//					 ' OFERTA_V, '+&
//					 ' PAGO_OFERTA, '+&
//					 ' CADENA'+&
//					 ' WHERE (OFERTA_V.SERIE = PAGO_OFERTA.SERIE) and '+&
//					 ' (OFERTA_V.NRO_OFERTA = PAGO_OFERTA.NRO_OFERTA) and'+&
//					 ' (OFERTA_V.ULT_FOLIO = PAGO_OFERTA.FOLIO) and'+&
//					 ' (OFERTA_V.SERIE = CADENA.SERIE) and'+&
//					 ' (OFERTA_V.NRO_OFERTA = CADENA.NUMERO) and'+&
//					 ' (CLIENTE.RUT = OFERTA_V.RUT) and'+&
//					 " (OFERTA_V.FECHA >= to_date('"+string(id_fecha_ini)+"','dd/mm/yyyy') AND"+&
//					 " OFERTA_V.FECHA <= to_date('"+string(id_fecha_fin)+"','dd/mm/yyyy')) AND"+&
//					 ' (CLIENTE.RUT < 40000000) AND'+&
//					 " (CADENA.CODIGO = 'O') and"+&
//					 " (CADENA.ESTADO like '"+is_est_cons+"')"+&
//					 ' Order By OFERTA_V.FECHA desc '
//	PREPARE sqlsa FROM :ls_select;
//	DECLARE c1 DYNAMIC CURSOR FOR sqlsa;
//	OPEN DYNAMIC c1; 
//	Fetch c1 into :il_renta,:idt_fec_paso_mov,:is_estado,:idt_fec_paso_nac,:idt_fecha_paso_prim,:il_cuotas_mora,:il_cta_pag_s;
//	
//	id_fecha_mov	= date(idt_fec_paso_mov)
//	id_fecha_nac	= date(idt_fec_paso_nac)
//	ll_year_aux	= long(year(id_fecha_mov))
//	CHOOSE CASE sqlca.sqlcode
//		CASE 0
//			hpb_1.MinPosition = 1
//			hpb_1.MaxPosition = ll_count
//			hpb_1.Position 	= 0
//			DO WHILE sqlca.sqlcode = 0
//				ll_uno++
//				ll_valor			= round((ll_uno / ll_count) * 100,0)
//				if Mod(ll_valor, 5) = 0 then
//					st_porcen.text = string(ll_valor) + ' %'
//					//if string(ll_valor) <> st_porcen.text then 
//				end if
//				if is_est_cons = 'V' then
//					ll_cuo_mora	= funcion_mora(idt_fecha_paso_prim,il_cta_pag_s,il_cuotas_mora,idt_fecha_hoy)
//					if ll_cuo_mora <= il_cuo_digitada then
//						ll_year_mov	= long(year(id_fecha_mov))
//						// calculo de Renta
//						il_renta	= il_renta / 1000
//						wf_calculo_renta(il_renta)
//						// Calculo de edad
//						il_edad	= year(idt_fecha_hoy) - year(id_fecha_nac)
//						if month(idt_fecha_hoy) < month(id_fecha_nac) then
//							il_edad++
//						elseif (month(idt_fecha_hoy) = month(id_fecha_nac)) and (day(idt_fecha_hoy) >= day(id_fecha_nac))then
//							il_edad++
//						end if
//						wf_calculo_edad(il_edad)
//						if ll_year_mov	<> ll_year_aux then
//							ll_new	= dw_muestra_renta.insertrow(0)
//							ll_new	= dw_muestra_edad.insertrow(0)
//							dw_muestra_renta.setitem(ll_new,'year',ll_year_aux)
//							dw_muestra_renta.setitem(ll_new,'rango_0_200',il_cont_0_200)
//							dw_muestra_renta.setitem(ll_new,'rango_201_300',il_cont_201_300)
//							dw_muestra_renta.setitem(ll_new,'rango_301_400',il_cont_301_400)
//							dw_muestra_renta.setitem(ll_new,'rango_401_500',il_cont_401_500)
//							dw_muestra_renta.setitem(ll_new,'rango_501_600',il_cont_501_600)
//							dw_muestra_renta.setitem(ll_new,'rango_601_700',il_cont_601_700)
//							dw_muestra_renta.setitem(ll_new,'rango_701_800',il_cont_701_800)
//							dw_muestra_renta.setitem(ll_new,'rango_801_900',il_cont_801_900)
//							dw_muestra_renta.setitem(ll_new,'rango_901_1000',il_cont_901_1000)
//							dw_muestra_renta.setitem(ll_new,'rango_may_1000',il_cont_may_1000)
//							dw_muestra_edad.setitem(ll_new,'year',ll_year_aux)
//							dw_muestra_edad.setitem(ll_new,'rango_0_30',il_edad_0_30)
//							dw_muestra_edad.setitem(ll_new,'rango_31_40',il_edad_31_40)
//							dw_muestra_edad.setitem(ll_new,'rango_41_50',il_edad_41_50)
//							dw_muestra_edad.setitem(ll_new,'rango_51_60',il_edad_51_60)
//							dw_muestra_edad.setitem(ll_new,'rango_61_70',il_edad_61_70)
//							dw_muestra_edad.setitem(ll_new,'rango_mayor_70',il_edad_may_70)
//							ll_year_aux	= ll_year_mov
//							il_cont_0_200=0; il_cont_201_300=0; il_cont_301_400=0; il_cont_401_500=0
//							il_cont_501_600=0; il_cont_601_700=0; il_cont_701_800=0; il_cont_801_900=0
//							il_cont_901_1000=0; il_cont_may_1000=0; il_edad_0_30=0; il_edad_31_40=0
//							il_edad_41_50=0;il_edad_51_60=0; il_edad_61_70=0; il_edad_may_70=0
//						end if
//					end if
//				elseif is_est_cons = 'C' or is_est_cons = 'N' or is_est_cons = 'P' or is_est_cons = 'R' or is_est_cons = '%' then
//					ll_year_mov	= long(year(id_fecha_mov))
//					// calculo de Renta
//					il_renta	= il_renta / 1000
//					wf_calculo_renta(il_renta)
//					// Calculo de edad
//					il_edad	= year(idt_fecha_hoy) - year(id_fecha_nac)
//					if month(idt_fecha_hoy) < month(id_fecha_nac) then
//						il_edad++
//					elseif (month(idt_fecha_hoy) = month(id_fecha_nac)) and (day(idt_fecha_hoy) >= day(id_fecha_nac))then
//						il_edad++
//					end if
//					wf_calculo_edad(il_edad)
//					if ll_year_mov	<> ll_year_aux then
//						ll_new	= dw_muestra_renta.insertrow(0)
//						ll_new	= dw_muestra_edad.insertrow(0)
//						dw_muestra_renta.setitem(ll_new,'year',ll_year_aux)
//						dw_muestra_renta.setitem(ll_new,'rango_0_200',il_cont_0_200)
//						dw_muestra_renta.setitem(ll_new,'rango_201_300',il_cont_201_300)
//						dw_muestra_renta.setitem(ll_new,'rango_301_400',il_cont_301_400)
//						dw_muestra_renta.setitem(ll_new,'rango_401_500',il_cont_401_500)
//						dw_muestra_renta.setitem(ll_new,'rango_501_600',il_cont_501_600)
//						dw_muestra_renta.setitem(ll_new,'rango_601_700',il_cont_601_700)
//						dw_muestra_renta.setitem(ll_new,'rango_701_800',il_cont_701_800)
//						dw_muestra_renta.setitem(ll_new,'rango_801_900',il_cont_801_900)
//						dw_muestra_renta.setitem(ll_new,'rango_901_1000',il_cont_901_1000)
//						dw_muestra_renta.setitem(ll_new,'rango_may_1000',il_cont_may_1000)
//						dw_muestra_edad.setitem(ll_new,'year',ll_year_aux)
//						dw_muestra_edad.setitem(ll_new,'rango_0_30',il_edad_0_30)
//						dw_muestra_edad.setitem(ll_new,'rango_31_40',il_edad_31_40)
//						dw_muestra_edad.setitem(ll_new,'rango_41_50',il_edad_41_50)
//						dw_muestra_edad.setitem(ll_new,'rango_51_60',il_edad_51_60)
//						dw_muestra_edad.setitem(ll_new,'rango_61_70',il_edad_61_70)
//						dw_muestra_edad.setitem(ll_new,'rango_mayor_70',il_edad_may_70)
//						ll_year_aux	= ll_year_mov
//						il_cont_0_200=0; il_cont_201_300=0; il_cont_301_400=0; il_cont_401_500=0
//						il_cont_501_600=0; il_cont_601_700=0; il_cont_701_800=0; il_cont_801_900=0
//						il_cont_901_1000=0; il_cont_may_1000=0; il_edad_0_30=0; il_edad_31_40=0
//						il_edad_41_50=0;il_edad_51_60=0; il_edad_61_70=0; il_edad_may_70=0
//					end if
//				end if
//				Fetch c1 into :il_renta,:idt_fec_paso_mov,:is_estado,:idt_fec_paso_nac,:idt_fecha_paso_prim,:il_cuotas_mora,:il_cta_pag_s;
//				id_fecha_mov	= date(idt_fec_paso_mov)
//				id_fecha_nac	= date(idt_fec_paso_nac)
//				hpb_1.Position = ll_uno
//			LOOP
//			ll_new	= dw_muestra_renta.insertrow(0)
//			ll_new	= dw_muestra_edad.insertrow(0)
//			dw_muestra_renta.setitem(ll_new,'year',ll_year_aux)
//			dw_muestra_renta.setitem(ll_new,'rango_0_200',il_cont_0_200)
//			dw_muestra_renta.setitem(ll_new,'rango_201_300',il_cont_201_300)
//			dw_muestra_renta.setitem(ll_new,'rango_301_400',il_cont_301_400)
//			dw_muestra_renta.setitem(ll_new,'rango_401_500',il_cont_401_500)
//			dw_muestra_renta.setitem(ll_new,'rango_501_600',il_cont_501_600)
//			dw_muestra_renta.setitem(ll_new,'rango_601_700',il_cont_601_700)
//			dw_muestra_renta.setitem(ll_new,'rango_701_800',il_cont_701_800)
//			dw_muestra_renta.setitem(ll_new,'rango_801_900',il_cont_801_900)
//			dw_muestra_renta.setitem(ll_new,'rango_901_1000',il_cont_901_1000)
//			dw_muestra_renta.setitem(ll_new,'rango_may_1000',il_cont_may_1000)
//			dw_muestra_edad.setitem(ll_new,'year',ll_year_aux)
//			dw_muestra_edad.setitem(ll_new,'rango_0_30',il_edad_0_30)
//			dw_muestra_edad.setitem(ll_new,'rango_31_40',il_edad_31_40)
//			dw_muestra_edad.setitem(ll_new,'rango_41_50',il_edad_41_50)
//			dw_muestra_edad.setitem(ll_new,'rango_51_60',il_edad_51_60)
//			dw_muestra_edad.setitem(ll_new,'rango_61_70',il_edad_61_70)
//			dw_muestra_edad.setitem(ll_new,'rango_mayor_70',il_edad_may_70)
//			if rb_renta.checked = true then dw_muestra_renta.setfocus()
//			if rb_edad.checked = true then dw_muestra_edad.setfocus()
//
//		CASE -1
//			MessageBox("SQL error", "Error: " + SQLCA.SQLErrText)
//
//		CASE ELSE
//			Messagebox("Advertencia","No registra datos")
//
//	END CHOOSE
//	close c1;
//	SetPointer(Arrow!)
//	hpb_1.visible		= false
//	st_2.visible		= false
//	st_porcen.visible	= false
//end if
end event

type em_nro_cuotas from editmask within w_analisis_cliente_promesas
boolean visible = false
integer x = 2162
integer y = 52
integer width = 247
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####0"
end type

event modified;il_cuo_digitada_desde	= long(this.text)
if il_cuo_digitada_desde <= 0 then this.text = '0'

end event

type st_cuotas from statictext within w_analisis_cliente_promesas
boolean visible = false
integer x = 1586
integer y = 36
integer width = 558
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 82042848
string text = "Ingrese Nº de Cuotas en Mora a Consultar"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_todos from statictext within w_analisis_cliente_promesas
integer x = 96
integer y = 1476
integer width = 311
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 16777215
string text = "Todos"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if em_inicio.text <> '' and em_termino.text <> '' then
	em_nro_cuotas.text			= ''
	em_nro_cuotas_hasta.text	= ''
	is_est_cons						= ''
	is_est_cons						= '%'
//	st_todos.visible				= false
	st_cuotas.visible				= false
	em_nro_cuotas.visible		= false
	em_nro_cuotas_hasta.visible= false
	st_hasta.visible				= false
	st_todos.textcolor			= rgb(255,0,0)
	st_vigente.textcolor			= rgb(0,0,128)
	st_cancelado.textcolor		= rgb(0,0,128)
	st_resciliadas.textcolor	= rgb(0,0,128)
	st_resueltas.textcolor		= rgb(0,0,128)
	st_reprogramadas.textcolor	= rgb(0,0,128)
	cb_proceso.triggerevent(clicked!)
end if
end event

type st_reprogramadas from statictext within w_analisis_cliente_promesas
integer x = 2542
integer y = 1476
integer width = 782
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 16777215
string text = "Nulas por Reprogramación"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if em_inicio.text <> '' and em_termino.text <> '' then
	em_nro_cuotas.text			= ''
	em_nro_cuotas_hasta.text	= ''
	is_est_cons						= ''
	is_est_cons						= 'P'
	st_cuotas.visible				= false
	em_nro_cuotas.visible		= false
	em_nro_cuotas_hasta.visible= false
	st_hasta.visible				= false
	st_todos.textcolor			= rgb(0,0,128)
	st_vigente.textcolor			= rgb(0,0,128)
	st_cancelado.textcolor		= rgb(0,0,128)
	st_resciliadas.textcolor	= rgb(0,0,128)
	st_resueltas.textcolor		= rgb(0,0,128)
	st_reprogramadas.textcolor	= rgb(255,0,0)
	cb_proceso.triggerevent(clicked!)
end if
end event

type st_resueltas from statictext within w_analisis_cliente_promesas
integer x = 2057
integer y = 1476
integer width = 480
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 16777215
string text = "Resueltas"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if em_inicio.text <> '' and em_termino.text <> '' then
	em_nro_cuotas.text			= ''
	em_nro_cuotas_hasta.text	= ''
	is_est_cons						= ''
	is_est_cons						= 'R'
//	st_todos.visible				= false
	st_cuotas.visible				= false
	em_nro_cuotas.visible		= false
	em_nro_cuotas_hasta.visible= false
	st_hasta.visible				= false
	st_todos.textcolor			= rgb(0,0,128)
	st_vigente.textcolor			= rgb(0,0,128)
	st_cancelado.textcolor		= rgb(0,0,128)
	st_resciliadas.textcolor	= rgb(0,0,128)
	st_resueltas.textcolor		= rgb(255,0,0)
	st_reprogramadas.textcolor	= rgb(0,0,128)
	cb_proceso.triggerevent(clicked!)
end if
end event

type st_resciliadas from statictext within w_analisis_cliente_promesas
integer x = 1582
integer y = 1476
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 16777215
string text = "Resciliadas"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if em_inicio.text <> '' and em_termino.text <> '' then
	em_nro_cuotas.text			= ''
	em_nro_cuotas_hasta.text	= ''
	is_est_cons						= ''
	is_est_cons						= 'N'
//	st_todos.visible				= false
	st_cuotas.visible				= false
	em_nro_cuotas.visible		= false
	em_nro_cuotas_hasta.visible= false
	st_hasta.visible				= false
	st_todos.textcolor			= rgb(0,0,128)
	st_vigente.textcolor			= rgb(0,0,128)
	st_cancelado.textcolor		= rgb(0,0,128)
	st_resciliadas.textcolor	= rgb(255,0,0)
	st_resueltas.textcolor		= rgb(0,0,128)
	st_reprogramadas.textcolor	= rgb(0,0,128)
	cb_proceso.triggerevent(clicked!)
end if
end event

type st_cancelado from statictext within w_analisis_cliente_promesas
integer x = 1047
integer y = 1476
integer width = 530
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 16777215
string text = "Canceladas"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if em_inicio.text <> '' and em_termino.text <> '' then
	em_nro_cuotas.text			= ''
	em_nro_cuotas_hasta.text	= ''
	is_est_cons						= ''
	is_est_cons						= 'C'
//	st_todos.visible				= true
	st_cuotas.visible				= false
	em_nro_cuotas.visible		= false
	em_nro_cuotas_hasta.visible= false
	st_hasta.visible				= false
	st_todos.textcolor			= rgb(0,0,128)
	st_vigente.textcolor			= rgb(0,0,128)
	st_cancelado.textcolor		= rgb(255,0,0)
	st_resciliadas.textcolor	= rgb(0,0,128)
	st_resueltas.textcolor		= rgb(0,0,128)
	st_reprogramadas.textcolor	= rgb(0,0,128)
	cb_proceso.triggerevent(clicked!)
end if
end event

type st_vigente from statictext within w_analisis_cliente_promesas
integer x = 411
integer y = 1476
integer width = 631
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 16777215
string text = "Vigente con Moras"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if em_inicio.text <> '' and em_termino.text <> '' then
	dw_muestra_edad.reset()
	dw_muestra_renta.reset()
	em_nro_cuotas.text			= ''
	em_nro_cuotas_hasta.text	= ''
	is_est_cons						= ''
	is_est_cons						= 'V'
//	st_todos.visible				= true
	st_cuotas.visible				= true
	em_nro_cuotas.visible		= true
	em_nro_cuotas_hasta.visible= true
	st_hasta.visible				= true
	st_todos.textcolor			= rgb(0,0,128)
	st_vigente.textcolor			= rgb(255,0,0)
	st_cancelado.textcolor		= rgb(0,0,128)
	st_resciliadas.textcolor	= rgb(0,0,128)
	st_resueltas.textcolor		= rgb(0,0,128)
	st_reprogramadas.textcolor	= rgb(0,0,128)
	em_nro_cuotas.setfocus()
end if
end event

type rb_edad from radiobutton within w_analisis_cliente_promesas
integer x = 1705
integer y = 1700
integer width = 480
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 82042848
string text = "Según Edad"
end type

event clicked;dw_muestra_edad.visible 	= true
dw_muestra_renta.visible	= false
st_todos.visible				= true
st_vigente.visible			= true
st_cancelado.visible			= true
st_resciliadas.visible		= true
st_resueltas.visible			= true
st_reprogramadas.visible	= true
dw_muestra_edad.setfocus()
end event

type rb_renta from radiobutton within w_analisis_cliente_promesas
integer x = 1115
integer y = 1700
integer width = 507
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 82042848
string text = "Según Renta"
boolean checked = true
end type

event clicked;dw_muestra_edad.visible 	= false
dw_muestra_renta.visible	= true
st_todos.visible				= true
st_vigente.visible			= true
st_cancelado.visible			= true
st_resciliadas.visible		= true
st_resueltas.visible			= true
st_reprogramadas.visible	= true
dw_muestra_renta.setfocus()
end event

type cb_exportar from commandbutton within w_analisis_cliente_promesas
integer x = 677
integer y = 1680
integer width = 306
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow	dw_paso
if dw_muestra_renta.rowcount() > 0 then
	if rb_renta.checked = true then dw_paso = dw_muestra_renta
	if rb_edad.checked = true then dw_paso = dw_muestra_edad
	f_DWToExcel( dw_paso )
end if
end event

type cb_2 from commandbutton within w_analisis_cliente_promesas
integer x = 366
integer y = 1680
integer width = 306
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;String Orden
datawindow	dw_paso
if dw_muestra_renta.rowcount() > 0 then
	if rb_renta.checked = true then 
		dw_paso = dw_muestra_renta
	end if
	if rb_edad.checked = true then 
		dw_paso = dw_muestra_edad
	end if
	setnull(Orden)
	dw_paso.SetSort(Orden)
	dw_paso.Sort()
end if
end event

type cb_1 from commandbutton within w_analisis_cliente_promesas
integer x = 55
integer y = 1680
integer width = 306
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_muestra_renta.rowcount() > 0 then
	if rb_edad.checked = true then
		if dw_muestra_edad.rowcount() > 0 then
			f_Print( dw_muestra_edad )
		end if
	else
		if dw_muestra_renta.rowcount() > 0 then
			f_Print( dw_muestra_renta )
		end if
	end if
end if
end event

type cb_proceso from commandbutton within w_analisis_cliente_promesas
integer x = 3127
integer y = 44
integer width = 306
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Proceso"
end type

event clicked;long		ll_year_mov, ll_new, ll_new_2, ll_count, ll_uno=0, ll_valor
long 		ll_cuo_mora
String	ls_select
il_cont_0_200=0; il_cont_201_300=0; il_cont_301_400=0; il_cont_401_500=0
il_cont_501_600=0; il_cont_601_700=0; il_cont_701_800=0; il_cont_801_900=0
il_cont_901_1000=0; il_cont_may_1000=0; il_edad_0_30=0; il_edad_31_40=0
il_edad_41_50=0;il_edad_51_60=0; il_edad_61_70=0; il_edad_may_70=0
id_fecha_ini	= date(em_inicio.text)
id_fecha_fin	= date(em_termino.text)
gd_fec_ran_fin	= date(id_fecha_fin)
il_sw				= 0
if is_est_cons = 'V' and il_cuo_digitada_desde > 0 and il_cuo_digitada_hasta > 0 &
	and il_cuo_digitada_hasta < il_cuo_digitada_desde then
	messagebox("Error","Rango de Cuotas Invalido")
else
	if id_fecha_ini >= id_fecha_fin then
		messagebox("Error","Rango de Fecha Incorrecta")
	else
		SetPointer(HourGlass!)
		st_2.visible		= true
		hpb_1.visible		= true
		st_porcen.visible	= true
		st_porcen.text		= '0 %'
		dw_muestra_edad.reset()
		dw_muestra_renta.reset()
		gs_est_cons			= is_est_cons
		CHOOSE CASE is_est_cons
			CASE 'V'
				if il_cuo_digitada_desde = 0 and il_cuo_digitada_hasta = 0 then
					dw_muestra_renta.object.t_titulo_2.text	= 'Contratos Vigentes con '+STRING(il_cuo_digitada_desde)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
					dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Vigentes con '+STRING(il_cuo_digitada_desde)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
				else
					if il_cuo_digitada_desde > 0 and il_cuo_digitada_hasta = 0 then
						dw_muestra_renta.object.t_titulo_2.text	= 'Contratos Vigentes con >= de '+STRING(il_cuo_digitada_desde)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
						dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Vigentes con >= de '+STRING(il_cuo_digitada_desde)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
					else
						if il_cuo_digitada_desde = 0 and il_cuo_digitada_hasta > 0 then
							dw_muestra_renta.object.t_titulo_2.text	= 'Contratos Vigentes con <= de '+STRING(il_cuo_digitada_hasta)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
							dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Vigentes con <= de '+STRING(il_cuo_digitada_hasta)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
						else
							if il_cuo_digitada_desde >= 0 and il_cuo_digitada_hasta >= il_cuo_digitada_desde then
								if il_cuo_digitada_desde = il_cuo_digitada_hasta then
									dw_muestra_renta.object.t_titulo_2.text	= 'Contratos Vigentes con '+STRING(il_cuo_digitada_desde)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
									dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Vigentes con '+STRING(il_cuo_digitada_desde)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)					
								else
									dw_muestra_renta.object.t_titulo_2.text	= 'Contratos Vigentes con >= '+STRING(il_cuo_digitada_desde)+' hasta <= '+string(il_cuo_digitada_hasta)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
									dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Vigentes con >= '+STRING(il_cuo_digitada_desde)+' hasta <= '+string(il_cuo_digitada_hasta)+' cuota(s) en mora(s), Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)					
								end if
							end if
						end if
					end if
				end if
				
			CASE '%'
				dw_muestra_renta.object.t_titulo_2.text	= 'Todos los Estados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
				dw_muestra_edad.object.t_titulo_2.text 	= 'Todos los Estados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
			CASE 'C'
				dw_muestra_renta.object.t_titulo_2.text 	= 'Contratos Cancelados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
				dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Cancelados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
			CASE 'N'
				dw_muestra_renta.object.t_titulo_2.text	= 'Contratos Resciliados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
				dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Resciliados, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
			CASE 'R'
				dw_muestra_renta.object.t_titulo_2.text 	= 'Contratos Resueltos, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
				dw_muestra_edad.object.t_titulo_2.text 	= 'Contratos Resueltos, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
			CASE 'P'
				dw_muestra_renta.object.t_titulo_2.text	= 'Contratos Nulas por Reprogramación, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
				dw_muestra_edad.object.t_titulo_2.text		= 'Contratos Nulas por Reprogramación, Rango Fecha: '+string(id_fecha_ini)+ ' al '+string(id_fecha_fin)
		END CHOOSE
		SELECT count(CADENA.NUMERO) INTO :ll_count FROM CLIENTE, OFERTA_V, PAGO_OFERTA, CADENA WHERE  (OFERTA_V.SERIE = PAGO_OFERTA.SERIE) and (OFERTA_V.NRO_OFERTA = PAGO_OFERTA.NRO_OFERTA) and (OFERTA_V.ULT_FOLIO = PAGO_OFERTA.FOLIO) and (OFERTA_V.SERIE = CADENA.SERIE) and (OFERTA_V.NRO_OFERTA = CADENA.NUMERO) and (CLIENTE.RUT = OFERTA_V.RUT) and (OFERTA_V.FECHA >= :id_fecha_ini AND OFERTA_V.FECHA <= :id_fecha_fin) AND CLIENTE.RUT < 40000000 AND CADENA.CODIGO = 'O' and CADENA.ESTADO like :is_est_cons  AND CADENA.COD_PARQUE = :gi_parque_select Using sqlca;
		ls_select = 'SELECT CLIENTE.TOTAL_RENT,'+&
						 '	OFERTA_V.FECHA,'+&
						 ' CADENA.ESTADO,'+&
						 ' CLIENTE.FECHA_NAC,'+&
						 ' PAGO_OFERTA.FECHA_PRIM,'+&
						 ' PAGO_OFERTA.NRO_CUOTAS,'+&
						 ' OFERTA_V.CTA_PAG_S'+&
						 ' FROM CLIENTE, '+&
						 ' OFERTA_V, '+&
						 ' PAGO_OFERTA, '+&
						 ' CADENA'+&
						 ' WHERE (OFERTA_V.SERIE = PAGO_OFERTA.SERIE) and '+&
						 ' (OFERTA_V.NRO_OFERTA = PAGO_OFERTA.NRO_OFERTA) and'+&
						 ' (OFERTA_V.ULT_FOLIO = PAGO_OFERTA.FOLIO) and'+&
						 ' (OFERTA_V.SERIE = CADENA.SERIE) and'+&
						 ' (OFERTA_V.NRO_OFERTA = CADENA.NUMERO) and'+&
						 ' (CLIENTE.RUT = OFERTA_V.RUT) and'+&
						 " (OFERTA_V.FECHA >= to_date('"+string(id_fecha_ini)+"','dd/mm/yyyy') AND"+&
						 " OFERTA_V.FECHA <= to_date('"+string(id_fecha_fin)+"','dd/mm/yyyy')) AND"+&
						 ' (CLIENTE.RUT < 40000000) AND'+&
						 " (CADENA.CODIGO = 'O') and"+&
						 " (CADENA.ESTADO like '"+is_est_cons+"') and "+&
						 ' (CADENA.COD_PARQUE = '+string(gi_parque_select )+' ) '+&
						 ' Order By OFERTA_V.FECHA desc '
		PREPARE sqlsa FROM :ls_select;
		DECLARE c1 DYNAMIC CURSOR FOR sqlsa;
		OPEN DYNAMIC c1; 
		Fetch c1 into :il_renta,:idt_fec_paso_mov,:is_estado,:idt_fec_paso_nac,:idt_fecha_paso_prim,:il_cuotas_mora,:il_cta_pag_s;
		
		id_fecha_mov	= date(idt_fec_paso_mov)
		id_fecha_nac	= date(idt_fec_paso_nac)
		il_year_aux	= long(year(id_fecha_mov))
		CHOOSE CASE sqlca.sqlcode
			CASE 0
				hpb_1.MinPosition = 1
				hpb_1.MaxPosition = ll_count
				hpb_1.Position 	= 0
				DO WHILE sqlca.sqlcode = 0
					ll_uno++
					ll_valor			= round((ll_uno / ll_count) * 100,0)
					if string(ll_valor)+' %' <> st_porcen.text then st_porcen.text = string(ll_valor) + ' %'
					if is_est_cons = 'V' then
//						ll_cuo_mora	= funcion_mora(idt_fecha_paso_prim,il_cta_pag_s,il_cuotas_mora,idt_fecha_hoy)
						ll_cuo_mora	= funcion_mora(idt_fecha_paso_prim,il_cta_pag_s,il_cuotas_mora,is_estado)
						if il_cuo_digitada_desde = 0 and il_cuo_digitada_hasta = 0 then
							if ll_cuo_mora = 0 then	wf_valida_vigente()
						else
							if il_cuo_digitada_desde > 0 and il_cuo_digitada_hasta = 0 then
								if ll_cuo_mora >= il_cuo_digitada_desde then wf_valida_vigente()
							else
								if il_cuo_digitada_desde = 0 and il_cuo_digitada_hasta > 0 then
									if ll_cuo_mora <= il_cuo_digitada_hasta then wf_valida_vigente()
								else
									if il_cuo_digitada_desde >= 0 and il_cuo_digitada_hasta >= il_cuo_digitada_desde then
										if ll_cuo_mora >= il_cuo_digitada_desde and ll_cuo_mora <= il_cuo_digitada_hasta then wf_valida_vigente()
									end if
								end if
							end if
						end if
					elseif is_est_cons = 'C' or is_est_cons = 'N' or is_est_cons = 'P' or is_est_cons = 'R' or is_est_cons = '%' then
						ll_year_mov	= long(year(id_fecha_mov))
						if il_sw = 0 and ll_year_mov <> il_year_aux then
							il_sw = 1
						else
							// calculo de Renta
							il_renta	= il_renta / 1000
							wf_calculo_renta(il_renta)
							// Calculo de edad
							il_edad	= year(idt_fecha_hoy) - year(id_fecha_nac)
							if month(idt_fecha_hoy) < month(id_fecha_nac) then
								il_edad++
							elseif (month(idt_fecha_hoy) = month(id_fecha_nac)) and (day(idt_fecha_hoy) >= day(id_fecha_nac))then
								il_edad++
							end if
							wf_calculo_edad(il_edad)
						end if
						if ll_year_mov	<> il_year_aux then
							ll_new	= dw_muestra_renta.insertrow(0)
							ll_new_2	= dw_muestra_edad.insertrow(0)
							dw_muestra_renta.setitem(ll_new,'year',il_year_aux)
							dw_muestra_renta.setitem(ll_new,'rango_0_200',il_cont_0_200)
							dw_muestra_renta.setitem(ll_new,'rango_201_300',il_cont_201_300)
							dw_muestra_renta.setitem(ll_new,'rango_301_400',il_cont_301_400)
							dw_muestra_renta.setitem(ll_new,'rango_401_500',il_cont_401_500)
							dw_muestra_renta.setitem(ll_new,'rango_501_600',il_cont_501_600)
							dw_muestra_renta.setitem(ll_new,'rango_601_700',il_cont_601_700)
							dw_muestra_renta.setitem(ll_new,'rango_701_800',il_cont_701_800)
							dw_muestra_renta.setitem(ll_new,'rango_801_900',il_cont_801_900)
							dw_muestra_renta.setitem(ll_new,'rango_901_1000',il_cont_901_1000)
							dw_muestra_renta.setitem(ll_new,'rango_may_1000',il_cont_may_1000)
							dw_muestra_edad.setitem(ll_new_2,'year',il_year_aux)
							dw_muestra_edad.setitem(ll_new_2,'rango_0_30',il_edad_0_30)
							dw_muestra_edad.setitem(ll_new_2,'rango_31_40',il_edad_31_40)
							dw_muestra_edad.setitem(ll_new_2,'rango_41_50',il_edad_41_50)
							dw_muestra_edad.setitem(ll_new_2,'rango_51_60',il_edad_51_60)
							dw_muestra_edad.setitem(ll_new_2,'rango_61_70',il_edad_61_70)
							dw_muestra_edad.setitem(ll_new_2,'rango_mayor_70',il_edad_may_70)
							il_year_aux	= ll_year_mov
							il_cont_0_200=0; il_cont_201_300=0; il_cont_301_400=0; il_cont_401_500=0
							il_cont_501_600=0; il_cont_601_700=0; il_cont_701_800=0; il_cont_801_900=0
							il_cont_901_1000=0; il_cont_may_1000=0; il_edad_0_30=0; il_edad_31_40=0
							il_edad_41_50=0;il_edad_51_60=0; il_edad_61_70=0; il_edad_may_70=0
						end if
					end if
					Fetch c1 into :il_renta,:idt_fec_paso_mov,:is_estado,:idt_fec_paso_nac,:idt_fecha_paso_prim,:il_cuotas_mora,:il_cta_pag_s;
					id_fecha_mov	= date(idt_fec_paso_mov)
					id_fecha_nac	= date(idt_fec_paso_nac)
					hpb_1.Position = ll_uno
				LOOP
				////////////////
				if is_est_cons = 'V' then
					ll_cuo_mora	= funcion_mora(idt_fecha_paso_prim,il_cta_pag_s,il_cuotas_mora,is_estado) //,idt_fecha_hoy
					if il_cuo_digitada_desde = 0 and il_cuo_digitada_hasta = 0 then
							if ll_cuo_mora = 0 then	wf_valida_vigente()
						else
							if il_cuo_digitada_desde > 0 and il_cuo_digitada_hasta = 0 then
								if ll_cuo_mora >= il_cuo_digitada_desde then wf_valida_vigente()
							else
								if il_cuo_digitada_desde = 0 and il_cuo_digitada_hasta > 0 then
									if ll_cuo_mora <= il_cuo_digitada_hasta then wf_valida_vigente()
								else
									if il_cuo_digitada_desde >= 0 and il_cuo_digitada_hasta >= il_cuo_digitada_desde then
										if ll_cuo_mora >= il_cuo_digitada_desde and ll_cuo_mora <= il_cuo_digitada_hasta then wf_valida_vigente()
									end if
								end if
							end if
						end if
				elseif is_est_cons = 'C' or is_est_cons = 'N' or is_est_cons = 'P' or is_est_cons = 'R' or is_est_cons = '%' then
					ll_year_mov	= long(year(id_fecha_mov))
					// calculo de Renta
					il_renta	= il_renta / 1000
					wf_calculo_renta(il_renta)
					// Calculo de edad
					il_edad	= year(idt_fecha_hoy) - year(id_fecha_nac)
					if month(idt_fecha_hoy) < month(id_fecha_nac) then
						il_edad++
					elseif (month(idt_fecha_hoy) = month(id_fecha_nac)) and (day(idt_fecha_hoy) >= day(id_fecha_nac))then
						il_edad++
					end if
					wf_calculo_edad(il_edad)

				/////////////////
					ll_new	= dw_muestra_renta.insertrow(0)
					ll_new_2	= dw_muestra_edad.insertrow(0)
					dw_muestra_renta.setitem(ll_new,'year',il_year_aux)
					dw_muestra_renta.setitem(ll_new,'rango_0_200',il_cont_0_200)
					dw_muestra_renta.setitem(ll_new,'rango_201_300',il_cont_201_300)
					dw_muestra_renta.setitem(ll_new,'rango_301_400',il_cont_301_400)
					dw_muestra_renta.setitem(ll_new,'rango_401_500',il_cont_401_500)
					dw_muestra_renta.setitem(ll_new,'rango_501_600',il_cont_501_600)
					dw_muestra_renta.setitem(ll_new,'rango_601_700',il_cont_601_700)
					dw_muestra_renta.setitem(ll_new,'rango_701_800',il_cont_701_800)
					dw_muestra_renta.setitem(ll_new,'rango_801_900',il_cont_801_900)
					dw_muestra_renta.setitem(ll_new,'rango_901_1000',il_cont_901_1000)
					dw_muestra_renta.setitem(ll_new,'rango_may_1000',il_cont_may_1000)
					dw_muestra_edad.setitem(ll_new_2,'year',il_year_aux)
					dw_muestra_edad.setitem(ll_new_2,'rango_0_30',il_edad_0_30)
					dw_muestra_edad.setitem(ll_new_2,'rango_31_40',il_edad_31_40)
					dw_muestra_edad.setitem(ll_new_2,'rango_41_50',il_edad_41_50)
					dw_muestra_edad.setitem(ll_new_2,'rango_51_60',il_edad_51_60)
					dw_muestra_edad.setitem(ll_new_2,'rango_61_70',il_edad_61_70)
					dw_muestra_edad.setitem(ll_new_2,'rango_mayor_70',il_edad_may_70)
				end if
				if rb_renta.checked = true then dw_muestra_renta.setfocus()
				if rb_edad.checked = true then dw_muestra_edad.setfocus()
	
			CASE -1
				MessageBox("SQL error", "Error: " + SQLCA.SQLErrText)
	
			CASE ELSE
				Messagebox("Advertencia","No registra datos")
	
		END CHOOSE
		close c1;
		SetPointer(Arrow!)
		hpb_1.visible		= false
		st_2.visible		= false
		st_porcen.visible	= false
	end if
end if
end event

type pb_calend2 from picturebutton within w_analisis_cliente_promesas
integer x = 1381
integer y = 52
integer width = 91
integer height = 88
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "boton_calendario.bmp"
alignment htextalign = right!
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(idt_fecha_hoy,gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(idt_fecha_hoy,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
end if
end event

type pb_calend from picturebutton within w_analisis_cliente_promesas
integer x = 613
integer y = 52
integer width = 91
integer height = 88
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "boton_calendario.bmp"
alignment htextalign = right!
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(idt_fecha_hoy,gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if em_inicio.text <> '00/00/0000' then
	ls_fecha = em_inicio.text
else
	ls_fecha = string(idt_fecha_hoy,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
end if
end event

type em_termino from editmask within w_analisis_cliente_promesas
integer x = 1029
integer y = 52
integer width = 343
integer height = 88
integer taborder = 20
integer textsize = -9
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_inicio from editmask within w_analisis_cliente_promesas
integer x = 261
integer y = 52
integer width = 343
integer height = 88
integer taborder = 10
integer textsize = -9
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_termino from statictext within w_analisis_cliente_promesas
integer x = 759
integer y = 36
integer width = 256
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 82042848
string text = "Fecha Término"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_analisis_cliente_promesas
integer x = 55
integer y = 36
integer width = 178
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 82042848
string text = "Fecha Inicio"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_analisis_cliente_promesas
integer x = 3127
integer y = 1680
integer width = 306
integer height = 100
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

type gb_1 from groupbox within w_analisis_cliente_promesas
integer x = 1051
integer y = 1640
integer width = 1161
integer height = 156
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 82042848
end type

type st_2 from statictext within w_analisis_cliente_promesas
boolean visible = false
integer x = 1070
integer y = 856
integer width = 1358
integer height = 264
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_porcen from statictext within w_analisis_cliente_promesas
boolean visible = false
integer x = 1577
integer y = 904
integer width = 343
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_analisis_cliente_promesas
boolean visible = false
integer x = 1134
integer y = 992
integer width = 1225
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_muestra_edad from datawindow within w_analisis_cliente_promesas
integer x = 55
integer y = 188
integer width = 3378
integer height = 1436
integer taborder = 60
string dataobject = "dw_external_promesas_segun_edad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	this.scrolltorow(row)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	this.scrolltorow(this.getrow())
end if
end event

event doubleclicked;long ll_year
ll_year						= dw_muestra_edad.getitemnumber(this.getrow(),'year')
gl_cuo_digitada_desde	= il_cuo_digitada_desde
gl_cuo_digitada_hasta	= il_cuo_digitada_hasta
OpenWithParm(w_detalle_promesas, is_est_cons+string(ll_year))
end event

type dw_muestra_renta from datawindow within w_analisis_cliente_promesas
integer x = 55
integer y = 188
integer width = 3378
integer height = 1436
integer taborder = 50
string dataobject = "dw_external_promesas_segun_renta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	this.scrolltorow(row)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	this.scrolltorow(this.getrow())
end if
end event

event doubleclicked;long ll_year
ll_year						= dw_muestra_renta.getitemnumber(this.getrow(),'year')
gl_cuo_digitada_desde	= il_cuo_digitada_desde
gl_cuo_digitada_hasta	= il_cuo_digitada_hasta
OpenWithParm(w_detalle_promesas, is_est_cons+string(ll_year))




end event

