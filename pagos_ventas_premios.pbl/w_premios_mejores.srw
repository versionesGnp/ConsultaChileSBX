forward
global type w_premios_mejores from window
end type
type cb_actual_producc from commandbutton within w_premios_mejores
end type
type st_1 from statictext within w_premios_mejores
end type
type dw_mejores from datawindow within w_premios_mejores
end type
type p_termino from picture within w_premios_mejores
end type
type em_termino from editmask within w_premios_mejores
end type
type dw_tipo_premio from datawindow within w_premios_mejores
end type
type cb_detalle from commandbutton within w_premios_mejores
end type
type hpb_1 from hprogressbar within w_premios_mejores
end type
type st_porc from statictext within w_premios_mejores
end type
type st_fondo from statictext within w_premios_mejores
end type
type pb_aceptar from picturebutton within w_premios_mejores
end type
type cb_2 from commandbutton within w_premios_mejores
end type
type cb_imprimir from commandbutton within w_premios_mejores
end type
type dw_parque from datawindow within w_premios_mejores
end type
type dw_fecha_cierre from datawindow within w_premios_mejores
end type
type dw_cargo from datawindow within w_premios_mejores
end type
end forward

global type w_premios_mejores from window
integer width = 3360
integer height = 1904
boolean titlebar = true
string title = "Premio Mejores Agentes y Supervisores"
boolean controlmenu = true
long backcolor = 67108864
cb_actual_producc cb_actual_producc
st_1 st_1
dw_mejores dw_mejores
p_termino p_termino
em_termino em_termino
dw_tipo_premio dw_tipo_premio
cb_detalle cb_detalle
hpb_1 hpb_1
st_porc st_porc
st_fondo st_fondo
pb_aceptar pb_aceptar
cb_2 cb_2
cb_imprimir cb_imprimir
dw_parque dw_parque
dw_fecha_cierre dw_fecha_cierre
dw_cargo dw_cargo
end type
global w_premios_mejores w_premios_mejores

type variables
long il_row
end variables

forward prototypes
public subroutine wf_valida_periodo (datetime adt_fecha_fin, long al_tipo_premio)
public subroutine wf_calcula_lugar (long al_cod_parque_uni, string as_cargo, datetime adt_fecha_fin, datetime adt_fecha_calc, long al_tipo_premio)
end prototypes

public subroutine wf_valida_periodo (datetime adt_fecha_fin, long al_tipo_premio);string	ls_pasa
long		ll_periodo,ll_anno
datetime	ldt_nulo,ldt_fecha_ini

Setnull(ldt_nulo)
dw_fecha_cierre.accepttext()
dw_tipo_premio.accepttext()
ls_pasa											= 'N'
SELECT	"PERIODO",	"ANNO"  
INTO		:ll_periodo,	:ll_anno  
FROM 		"CIERRE_VENTA"  
WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :adt_fecha_fin
USING		sqlca;
if sqlca.sqlcode=0 then
	if (not isnull(ll_periodo) or ll_periodo>0) and (not isnull(ll_anno) and ll_anno>0) then
		if al_tipo_premio=5 then //mensual
			ll_periodo							= ll_periodo
			ll_anno								= ll_anno
			ls_pasa								= 'S'
		elseif al_tipo_premio=6 then //semestral
			if ll_periodo=6 or ll_periodo=12 then
				ll_periodo						= ll_periodo - 5
				ll_anno							= ll_anno
				ls_pasa							= 'S'
			else
				messagebox("Advertencia","No Puede Generar Premios Semestrales con fecha de Cierre :"+string(adt_fecha_fin,'dd/mm/yyyy'))
				dw_fecha_cierre.setitem(1,"fecha_fin",ldt_nulo)
			end if
		elseif al_tipo_premio=7 then //anual
			if ll_periodo=12 then
				ll_periodo						= ll_periodo - 11
				ll_anno							= ll_anno
				ls_pasa							= 'S'
			else
				messagebox("Advertencia","No Puede Generar Premios Anuales con fecha de Cierre :"+string(adt_fecha_fin,'dd/mm/yyyy'))
				dw_fecha_cierre.setitem(1,"fecha_fin",ldt_nulo)
			end if
		end if
		if ls_pasa = 'S' then
			SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
			INTO 		:ldt_fecha_ini  
			FROM 		"CIERRE_VENTA"  
			WHERE 	( "CIERRE_VENTA"."PERIODO" = :ll_periodo ) AND  
						( "CIERRE_VENTA"."ANNO" = :ll_anno )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ldt_fecha_ini) then
					dw_fecha_cierre.setitem(1,"fecha_ini",ldt_fecha_ini)
				end if
			end if
		else
			dw_fecha_cierre.setitem(1,"fecha_ini",ldt_nulo)
			dw_fecha_cierre.accepttext()
		end if
	end if
end if
end subroutine

public subroutine wf_calcula_lugar (long al_cod_parque_uni, string as_cargo, datetime adt_fecha_fin, datetime adt_fecha_calc, long al_tipo_premio);string	as_tipo_empleado,as_canal
long		ll_tot_reg,ll_indi,ll_lugar,ll_monto,ll_prem_pago,ll_tipo_premio
double	ldb_descto,ldb_producc1,ldb_producc2

dw_mejores.accepttext()
ll_tot_reg																= dw_mejores.rowcount()
if ll_tot_reg > 0 then
	dw_mejores.setitem(1,'lugar',1)
	ldb_descto															= 1
	dw_mejores.setitem(1,'descto',ldb_descto)
	for ll_indi=2 to ll_tot_reg
		if 1 <= ( ll_indi - 1 ) then
			ldb_producc1 												= round(dw_mejores.getitemnumber(ll_indi,'producc_real'),2)
			ldb_producc2 												= round(dw_mejores.getitemnumber(ll_indi - 1,'producc_real'),2)
			if ldb_producc1 = ldb_producc2 then
				ll_lugar 												= dw_mejores.getitemnumber(ll_indi - 1,'lugar')
				dw_mejores.setitem(ll_indi,'lugar',ll_lugar)
				ldb_descto												= 0.5
				dw_mejores.setitem(ll_indi,'descto',ldb_descto)
				dw_mejores.setitem(ll_indi - 1,'descto',ldb_descto)
			else
				ll_lugar 												= dw_mejores.getitemnumber(ll_indi - 1,'lugar') + 1
				dw_mejores.setitem(ll_indi,'lugar',ll_lugar)
				ldb_descto												= 1
				dw_mejores.setitem(ll_indi,'descto',ldb_descto)
			end if
		end if
	next
end if
if as_cargo = 'ANF' then
	as_tipo_empleado													= 'A'
	as_canal																= 'NF'
	dw_mejores.setFilter("canal = 'NF' and lugar <= 4")
	dw_mejores.filter()
elseif as_cargo = 'ANI' then
	as_tipo_empleado													= 'A'
	as_canal																= 'NI'
	dw_mejores.setFilter("canal = 'NI' and lugar <= 2")
	dw_mejores.filter()
elseif as_cargo = 'SNF' then
	as_tipo_empleado													= 'S'
	as_canal																= 'NF'
	dw_mejores.setFilter("canal = 'NF' and lugar <= 2")
	dw_mejores.filter()	
end if
dw_mejores.accepttext()
if al_tipo_premio=5 then //mensual
	ll_tipo_premio														= 2
elseif al_tipo_premio=6 then //semestral
	ll_tipo_premio														= 3	
elseif al_tipo_premio=7 then //anual
	ll_tipo_premio														= 4	
end if
ll_tot_reg																= dw_mejores.rowcount()
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ll_lugar 														= dw_mejores.getitemnumber(ll_indi,'lugar')
		ldb_descto														= dw_mejores.getitemnumber(ll_indi,'descto')
		SELECT	"MONTO"
		INTO		:ll_monto
		FROM		"PREMIOS_POR_CAJA_MEJORES"  
		WHERE		( "PREMIOS_POR_CAJA_MEJORES"."CODIGO" = :ll_lugar ) AND  
					( "PREMIOS_POR_CAJA_MEJORES"."CANAL" = :as_canal ) AND  
					( "PREMIOS_POR_CAJA_MEJORES"."PARQUE" = :al_cod_parque_uni ) AND  
					( "PREMIOS_POR_CAJA_MEJORES"."TIPO_EMPLEADO" = :as_tipo_empleado ) AND  
					( "PREMIOS_POR_CAJA_MEJORES"."PERIODO" = :ll_tipo_premio ) AND  
					( "PREMIOS_POR_CAJA_MEJORES"."ESTADO" = 'A' )
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ll_monto) and ll_monto > 0 then
				ll_prem_pago									= ll_monto * ldb_descto
			end if
			dw_mejores.setitem(ll_indi,"premio",ll_prem_pago)
		end if
	next
else
	messagebox("Advertencia","No Registra Datos")
end if
end subroutine

on w_premios_mejores.create
this.cb_actual_producc=create cb_actual_producc
this.st_1=create st_1
this.dw_mejores=create dw_mejores
this.p_termino=create p_termino
this.em_termino=create em_termino
this.dw_tipo_premio=create dw_tipo_premio
this.cb_detalle=create cb_detalle
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.pb_aceptar=create pb_aceptar
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.dw_parque=create dw_parque
this.dw_fecha_cierre=create dw_fecha_cierre
this.dw_cargo=create dw_cargo
this.Control[]={this.cb_actual_producc,&
this.st_1,&
this.dw_mejores,&
this.p_termino,&
this.em_termino,&
this.dw_tipo_premio,&
this.cb_detalle,&
this.hpb_1,&
this.st_porc,&
this.st_fondo,&
this.pb_aceptar,&
this.cb_2,&
this.cb_imprimir,&
this.dw_parque,&
this.dw_fecha_cierre,&
this.dw_cargo}
end on

on w_premios_mejores.destroy
destroy(this.cb_actual_producc)
destroy(this.st_1)
destroy(this.dw_mejores)
destroy(this.p_termino)
destroy(this.em_termino)
destroy(this.dw_tipo_premio)
destroy(this.cb_detalle)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.pb_aceptar)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.dw_parque)
destroy(this.dw_fecha_cierre)
destroy(this.dw_cargo)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_tot_reg

connect using Trans_1;
connect using Trans_2;

gf_centrar(w_premios_mejores)
em_termino.text										= string(gdt_fec_sistema,'dd/mm/yyyy')

if gl_proceso>=3 then
	if gs_depto='I' then
		cb_actual_producc.visible					= true
	end if
	
	dw_tipo_premio.dataobject						= 'dwe_tipo_premio_mejores'
	dw_tipo_premio.settransobject(sqlca)
	dw_tipo_premio.insertrow(0)
	dw_parque.dataobject								= 'dwe_seleccionar_parque'
	dw_parque.settransobject(sqlca)
	dw_parque.insertrow(0)
	dw_cargo.dataobject								= 'dwe_cargo'
	dw_cargo.settransobject(sqlca)
	dw_cargo.insertrow(0)
	dw_mejores.dataobject							= 'dw_mejores_gupos'
	dw_mejores.settransobject(sqlca)
	dw_fecha_cierre.settransobject(sqlca)
	dw_fecha_cierre.getchild('fecha_ini',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(datetime(date(string('01/10/2010'))))=0 then
		idw_detalle.insertrow(0)
	end if
	dw_fecha_cierre.settransobject(sqlca)
	dw_fecha_cierre.getchild('fecha_fin',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(datetime(date(string('01/10/2010'))))=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_fecha_cierre.insertrow(0)
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_premios_mejores)
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_actual_producc from commandbutton within w_premios_mejores
boolean visible = false
integer x = 3291
integer y = 120
integer width = 347
integer height = 96
integer taborder = 170
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;string	ls_base,ls_serie,ls_cod_age,ls_cod_sup,ls_estado,ls_canal,ls_descrip
long		ll_tipo_premio,ll_cod_parque,ll_mora_actual,ll_cta_pag_s,ll_nro_cuotas,&
			ll_mora,ll_indi,ll_tot_reg,ll_count,ll_parque_age,ll_parque_unidad,ll_resp,ll_parque_sup
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_nulo,ldt_fecha_calc,ldt_fecha_prim
double	ldb_numero,ldb_tot_porc,ldb_tot_porc_aux,ldb_producc,ldb_producc_real,ldb_persist,ldb_porce_mora

setnull(ldt_nulo)
dw_tipo_premio.accepttext()
dw_fecha_cierre.accepttext()
dw_parque.accepttext()
ll_tipo_premio										= dw_tipo_premio.getitemnumber(1,'tipo_premio')
ll_parque_unidad									= dw_parque.getitemnumber(1,'parque')
ldt_fecha_ini										= dw_fecha_cierre.getitemdatetime(1,'fecha_ini')
ldt_fecha_fin										= dw_fecha_cierre.getitemdatetime(1,'fecha_fin')
ldt_fecha_calc										= datetime(date(em_termino.text),time('00:00:00'))

SELECT	"COD_PREMIO",		"DESCRIPCION"
INTO		:ll_tipo_premio,	:ls_descrip
FROM		"PREMIO_TIPO"  
WHERE		"PREMIO_TIPO"."COD_PREMIO" = :ll_tipo_premio   
USING		sqlca;

SELECT	COUNT("PREMIOS_MEJOR_DETALLE"."BASE")
INTO		:ll_count
FROM		"PREMIOS_MEJOR_DETALLE"  
WHERE		( "PREMIOS_MEJOR_DETALLE"."TIPO_PREMIO" = :ll_tipo_premio ) AND  
         ( "PREMIOS_MEJOR_DETALLE"."FECHA_FIN" = :ldt_fecha_fin ) AND
			( "PREMIOS_MEJOR_DETALLE"."PARQUE_AGE" = :ll_parque_unidad )
USING		sqlca;
if sqlca.sqlcode=0 then
	if ll_count>0 then
		messagebox("Advertencia","Premios: "+ls_descrip+" Período finalizado con Fecha :"+string(ldt_fecha_fin,'dd/mm/yyyy')+" Se Encuentra Actualizado")
	else
		ll_resp										= 	MessageBox("Advertencia", 'Desea Crear Proceso Premios: '+ls_descrip, Exclamation!, YesNo!, 2)
		if ll_resp = 1 then										
			if (not isnull(ll_tipo_premio) or ll_tipo_premio>0) and not isnull(ldt_fecha_ini) and not isnull(ldt_fecha_fin) then
				wf_valida_periodo(ldt_fecha_fin,ll_tipo_premio)
				SetPointer(HourGlass!)
				st_fondo.visible								= true
				hpb_1.visible 									= true
				st_porc.visible 								= true
				ldb_tot_porc									= 0
				ldb_tot_porc_aux								= 0			
				hpb_1.Position									= ldb_tot_porc
				ll_indi											= 0
				SELECT	COUNT("BASE")
				INTO		:ll_tot_reg
				FROM		"VISTA_DETALLE_CIERRE_VTA"  
				WHERE 	( "VISTA_DETALLE_CIERRE_VTA"."CIERRE_VENTA" >= :ldt_fecha_ini ) AND  
							( "VISTA_DETALLE_CIERRE_VTA"."CIERRE_VENTA" <= :ldt_fecha_fin ) AND
							( "VISTA_DETALLE_CIERRE_VTA"."PARQUE_AGE" = :ll_parque_unidad )
				USING		sqlca;
				
				DECLARE x1 CURSOR FOR
				SELECT	"COD_PARQUE","BASE","SERIE","NRO_OFERTA","COD_AGE","COD_SUP","PRECIO_UF","ESTADO_CAD","CANAL","FECHA_PRIM","CTAS_PAG_S","MORA_CRED","NRO_CUOTAS","PARQUE_AGE","PARQUE_SUP" 
				FROM		"VISTA_DETALLE_CIERRE_VTA"  
				WHERE 	( "VISTA_DETALLE_CIERRE_VTA"."CIERRE_VENTA" >= :ldt_fecha_ini ) AND  
							( "VISTA_DETALLE_CIERRE_VTA"."CIERRE_VENTA" <= :ldt_fecha_fin ) AND
							( "VISTA_DETALLE_CIERRE_VTA"."PARQUE_AGE" = :ll_parque_unidad )
				USING	sqlca;
				open x1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x1 INTO	:ll_cod_parque,	:ls_base,	:ls_serie,	:ldb_numero,	:ls_cod_age,	:ls_cod_sup,	:ldb_producc,	:ls_estado,	:ls_canal,	:ldt_fecha_prim,	:ll_cta_pag_s,	:ll_mora,	:ll_nro_cuotas,	:ll_parque_age,	:ll_parque_sup; 
						if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
							if ls_base = 'O' then 
								ll_mora_actual					= f_mora_cierre_vtas(ls_base,ls_serie,ldb_numero,ll_cod_parque,ldt_fecha_calc) //mora_cierre
							else
								ldb_producc_real				= ldb_producc
							end if
							if ls_estado='A' or ls_estado='E' or ls_estado='F' or ls_estado='G' or ls_estado='R' or ls_estado='T' then
								ldb_producc_real				= 0
							elseif ls_estado='C' or ls_estado='D' or ls_estado='N' or ls_estado='P' or ls_estado='S' then
								ldb_producc_real				= ldb_producc
							elseif ls_estado='V' then
								if ll_mora_actual >= 2 then
									ldb_producc_real			= 0
								else
									ldb_producc_real			= ldb_producc
								end if
							end if
							
							
							INSERT INTO "PREMIOS_MEJOR_DETALLE"  
										( "COD_PARQUE_CAD",	"BASE",		"SERIE",		"NUMERO",	"COD_AGE",		"COD_SUP",		"PRODUCC",		"ESTADO",	"CANAL",		"FECHA_PRIM",		"CTAS_PAG_S",	"MORA_CRED",	"NRO_CUOTAS",		"MORA_CREDITO",	"PRODUCC_REAL",		"TIPO_PREMIO",		"FECHA_FIN",		"PARQUE_AGE",		"PARQUE_SUP",		"FECHA_CALC_MORA")  
							VALUES	( :ll_cod_parque,		:ls_base,	:ls_serie,	:ldb_numero,	:ls_cod_age,	:ls_cod_sup,	:ldb_producc,	:ls_estado,	:ls_canal,	:ldt_fecha_prim,	:ll_cta_pag_s,	:ll_mora,		:ll_nro_cuotas,	:ll_mora_actual,	:ldb_producc_real,	:ll_tipo_premio,	:ldt_fecha_fin,	:ll_parque_age,	:ll_parque_sup,	:ldt_fecha_calc)
							USING		Trans_2;  
							if Trans_2.sqlcode = 0 then
								commit using Trans_2;
								ll_indi							= ll_indi+1
							else
								rollback using Trans_2;
							end if
						end if
						
						setnull(ll_cod_parque);setnull(ls_base);setnull(ls_serie);setnull(ldb_numero);setnull(ls_cod_age);&
						setnull(ls_cod_sup);setnull(ldb_producc);setnull(ls_estado);setnull(ls_canal);setnull(ldt_fecha_prim);&
						setnull(ll_cta_pag_s);setnull(ll_mora);setnull(ll_nro_cuotas);setnull(ll_parque_age)
						if ldb_tot_porc <> ldb_tot_porc_aux then 
							st_porc.text						= string(ldb_tot_porc,'#0.##')+" %"
							ldb_tot_porc_aux					= ldb_tot_porc
						end if
						ldb_tot_porc							= (ll_indi / ll_tot_reg) * 100
						hpb_1.Position 						= ldb_tot_porc
					LOOP
				end if
				close x1;
				
				st_fondo.visible								= false
				hpb_1.visible 									= false
				st_porc.visible 								= false
				if ll_indi=ll_tot_reg then
					messagebox("Grabar","Grabación Exitosa")
				end if
				SetPointer(Arrow!)
			else
				if isnull(ll_tipo_premio) or ll_tipo_premio=0 then
					messagebox("Advertencia", "Debe Ingresar Tipo Premio")
					dw_tipo_premio.setfocus()
					dw_tipo_premio.setcolumn('tipo_premio')
				elseif isnull(ldt_fecha_ini) then
					messagebox("Advertencia", "Debe Ingresar Fecha Inicio")
					dw_fecha_cierre.setfocus()
					dw_fecha_cierre.setcolumn('fecha_ini')	
				elseif isnull(ldt_fecha_fin) then
					messagebox("Advertencia", "Debe Ingresar Fecha Término")
					dw_fecha_cierre.setfocus()
					dw_fecha_cierre.setcolumn('fecha_fin')
				end if
			end if
		end if
	end if
end if
end event

type st_1 from statictext within w_premios_mejores
integer x = 9
integer y = 148
integer width = 338
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Calculo"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_mejores from datawindow within w_premios_mejores
integer x = 32
integer y = 248
integer width = 3264
integer height = 1384
integer taborder = 50
string title = "none"
string dataobject = "dw_mejores_gupos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()
end event

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

type p_termino from picture within w_premios_mejores
integer x = 727
integer y = 132
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha

if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text					= string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha 							= em_termino.text
else
	ls_fecha 							= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
if Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
end if
	
end event

type em_termino from editmask within w_premios_mejores
integer x = 343
integer y = 136
integer width = 375
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;dw_mejores.reset()
end event

type dw_tipo_premio from datawindow within w_premios_mejores
integer x = 27
integer y = 36
integer width = 1221
integer height = 88
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_tipo_premio_mejores"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.reset()
dw_parque.insertrow(0)
dw_cargo.reset()
dw_cargo.insertrow(0)
dw_mejores.reset()
end event

type cb_detalle from commandbutton within w_premios_mejores
integer x = 32
integer y = 1664
integer width = 439
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Ventas"
end type

event clicked;string	ls_codigo,ls_cargo,ls_string
long		ll_cod_parque,ll_tipo_premio
datetime	ldt_fecha_ini,ldt_fecha_fin

dw_fecha_cierre.accepttext()
dw_mejores.accepttext()
if dw_mejores.rowcount() > 0 then
	ldt_fecha_fin			= dw_fecha_cierre.getitemdatetime(1,'fecha_fin')
	ll_cod_parque			= dw_parque.getitemnumber(1,'parque')
	ll_tipo_premio			= dw_tipo_premio.getitemnumber(1,'tipo_premio')
	ls_codigo				= dw_mejores.getitemstring(il_row,'codigo')
	ls_cargo					= dw_cargo.getitemstring(1,'cargo')
	if not isnull(ls_codigo) and ls_codigo<>''  then
		ls_string			= string(ldt_fecha_fin,'dd/mm/yyyy')+'~t'+string(ll_cod_parque)+'~t'+string(ll_tipo_premio)+'~t'+ls_codigo+'~t'+ls_cargo
		if isvalid(w_premios_mejores_detalle) then close(w_premios_mejores_detalle)
			OpenWithParm (w_premios_mejores_detalle,ls_string)
	end if
end if
end event

type hpb_1 from hprogressbar within w_premios_mejores
boolean visible = false
integer x = 1088
integer y = 992
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_premios_mejores
boolean visible = false
integer x = 1664
integer y = 920
integer width = 233
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fondo from statictext within w_premios_mejores
boolean visible = false
integer x = 1061
integer y = 896
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type pb_aceptar from picturebutton within w_premios_mejores
integer x = 3090
integer y = 104
integer width = 133
integer height = 116
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_cargo,ls_cod_age,ls_canal,ls_canal_v,ls_nombre,ls_a_pater,ls_a_mater,ls_nombre_compl,ls_estado
long	ll_cod_parque_uni,ll_tot_reg,ll_new,ll_parque,ll_rut,ll_tipo_premio
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_calc
double	ldb_persist,ldb_porce_mora,ldb_producc,ldb_producc_real,ldb_producc_mora,ldb_producc_efec

dw_mejores.reset()
dw_tipo_premio.accepttext()
dw_parque.accepttext()
dw_cargo.accepttext()
dw_fecha_cierre.accepttext()

ll_tipo_premio														= dw_tipo_premio.getitemnumber(1,'tipo_premio')
ll_cod_parque_uni													= dw_parque.getitemnumber(1,'parque')
ldt_fecha_ini														= dw_fecha_cierre.getitemdatetime(1,'fecha_ini')
ldt_fecha_fin														= dw_fecha_cierre.getitemdatetime(1,'fecha_fin')
ldt_fecha_calc														= datetime(date(em_termino.text),time('00:00:00'))
ls_cargo																= dw_cargo.getitemstring(1,'cargo')

if (not isnull(ll_tipo_premio) or ll_tipo_premio>0) and (not isnull(ll_cod_parque_uni) or ll_cod_parque_uni>0) and not isnull(ldt_fecha_ini) and not isnull(ldt_fecha_fin) and (not isnull(ls_cargo) or ls_cargo<>'') then
	if ls_cargo = 'ANF' then
		DECLARE x1 CURSOR FOR
		SELECT DISTINCT "PREMIOS_MEJOR_DETALLE"."COD_AGE", "AGENTES"."COD_PARQUE", "AGENTES"."CANAL", "AGENTES"."NOMBRE", "AGENTES"."A_PATERNO", "AGENTES"."A_MATERNO", "AGENTES"."RUT", "AGENTES"."ESTADO"    
		FROM	"PREMIOS_MEJOR_DETALLE", "AGENTES"  
		WHERE	"PREMIOS_MEJOR_DETALLE"."COD_AGE" = "AGENTES"."COD_AGE" and  
				"PREMIOS_MEJOR_DETALLE"."FECHA_FIN" = :ldt_fecha_fin and
				"AGENTES"."COD_PARQUE" = :ll_cod_parque_uni AND
				"AGENTES"."CANAL" = 'NF'   
		USING	sqlca;
	elseif ls_cargo = 'ANI' then
		DECLARE x2 CURSOR FOR
		SELECT DISTINCT "PREMIOS_MEJOR_DETALLE"."COD_AGE", "PREMIOS_MEJOR_DETALLE"."PARQUE_AGE", "AGENTES"."CANAL", "AGENTES"."NOMBRE", "AGENTES"."A_PATERNO", "AGENTES"."A_MATERNO", "AGENTES"."RUT", "AGENTES"."ESTADO"     
		FROM	"PREMIOS_MEJOR_DETALLE", "AGENTES"  
		WHERE	"PREMIOS_MEJOR_DETALLE"."COD_AGE" = "AGENTES"."COD_AGE" and
				"PREMIOS_MEJOR_DETALLE"."FECHA_FIN" = :ldt_fecha_fin and
				"PREMIOS_MEJOR_DETALLE"."PARQUE_AGE" = :ll_cod_parque_uni AND  
				"AGENTES"."CANAL" = 'NI'   
		USING	sqlca;
	elseif ls_cargo = 'SNF' then
		DECLARE x3 CURSOR FOR
		SELECT DISTINCT "PREMIOS_MEJOR_DETALLE"."COD_SUP", "PREMIOS_MEJOR_DETALLE"."PARQUE_SUP", "SUPERVISOR"."CANAL", "SUPERVISOR"."NOMBRE", "SUPERVISOR"."A_PATERNO", "SUPERVISOR"."A_MATERNO", "SUPERVISOR"."RUT", "SUPERVISOR"."ESTADO"     
		FROM	"PREMIOS_MEJOR_DETALLE", "SUPERVISOR"  
		WHERE	"PREMIOS_MEJOR_DETALLE"."COD_SUP" = "SUPERVISOR"."COD_SUP" and
				"PREMIOS_MEJOR_DETALLE"."FECHA_FIN" = :ldt_fecha_fin and	
				"PREMIOS_MEJOR_DETALLE"."PARQUE_SUP" = :ll_cod_parque_uni AND  
				"SUPERVISOR"."CANAL" = 'NF'   
		USING	sqlca;
	end if
	if ls_cargo = 'ANF' then
		open x1;
	elseif ls_cargo = 'ANI' then 
		open x2;
	elseif ls_cargo = 'SNF' then 
		open x3;	
	end if
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			if ls_cargo = 'ANF' then
				fetch x1 INTO	:ls_cod_age, :ll_parque, :ls_canal_v, :ls_nombre, :ls_a_pater, :ls_a_mater, :ll_rut, :ls_estado;	
			elseif ls_cargo = 'ANI' then 
				fetch x2 INTO	:ls_cod_age, :ll_parque, :ls_canal_v, :ls_nombre, :ls_a_pater, :ls_a_mater, :ll_rut, :ls_estado;
			elseif ls_cargo = 'SNF' then 
				fetch x3 INTO	:ls_cod_age, :ll_parque, :ls_canal_v, :ls_nombre, :ls_a_pater, :ls_a_mater, :ll_rut, :ls_estado;	
			end if
			if (not isnull(ls_cod_age) or ls_cod_age<>'') and (not isnull(ll_parque) or ll_parque>0) and (not isnull(ls_canal_v) or ls_canal_v<>'') then
				dw_mejores.Object.usuario.text 					= gs_user
				ls_nombre_compl										= ls_nombre+' '+ls_a_pater+' '+ls_a_mater
				ll_new													= dw_mejores.insertrow(0)
				dw_mejores.scrolltorow(ll_new)
				dw_mejores.setitem(ll_new,"codigo",ls_cod_age)
				dw_mejores.setitem(ll_new,"parque",ll_parque)
				dw_mejores.setitem(ll_new,"canal",ls_canal_v)
				dw_mejores.setitem(ll_new,"nombre",ls_nombre_compl)
				dw_mejores.setitem(ll_new,"rut",ll_rut)
				dw_mejores.setitem(ll_new,"estado",ls_estado)
				dw_mejores.setitem(ll_new,"cargo",ls_cargo)
				dw_mejores.setitem(ll_new,"tipo_premio",ll_tipo_premio)
				dw_mejores.setitem(ll_new,"fecha_ini",ldt_fecha_ini)
				dw_mejores.setitem(ll_new,"fecha_fin",ldt_fecha_fin)
				if ls_cargo = 'SNF' then
					if ll_cod_parque_uni=11 then
						SELECT SUM("PREMIOS_MEJOR_DETALLE"."PRODUCC"),SUM("PREMIOS_MEJOR_DETALLE"."PRODUCC_REAL")
						INTO	:ldb_producc,	:ldb_producc_real
						FROM	"PREMIOS_MEJOR_DETALLE", "FORESTA"."SUPERVISOR"  
						WHERE	"PREMIOS_MEJOR_DETALLE"."COD_SUP" = "FORESTA"."SUPERVISOR"."COD_SUP" and
								"PREMIOS_MEJOR_DETALLE"."FECHA_FIN" = :ldt_fecha_fin and
								"FORESTA"."SUPERVISOR"."COD_PARQUE" = :ll_cod_parque_uni AND  
								"FORESTA"."SUPERVISOR"."CANAL" = 'NF' AND
								"PREMIOS_MEJOR_DETALLE"."COD_SUP" = :ls_cod_age
						USING	Trans_1;
					else
						SELECT SUM("PREMIOS_MEJOR_DETALLE"."PRODUCC"),SUM("PREMIOS_MEJOR_DETALLE"."PRODUCC_REAL")
						INTO	:ldb_producc,	:ldb_producc_real
						FROM	"PREMIOS_MEJOR_DETALLE", "PRADO"."SUPERVISOR"  
						WHERE	"PREMIOS_MEJOR_DETALLE"."COD_SUP" = "PRADO"."SUPERVISOR"."COD_SUP" and
								"PREMIOS_MEJOR_DETALLE"."FECHA_FIN" = :ldt_fecha_fin and
								"PRADO"."SUPERVISOR"."COD_PARQUE" = :ll_cod_parque_uni AND  
								"PRADO"."SUPERVISOR"."CANAL" = 'NF' AND
								"PREMIOS_MEJOR_DETALLE"."COD_SUP" = :ls_cod_age
						USING	Trans_1;
					end if
					if Trans_1.sqlcode=0 then
						if not isnull(ldb_producc) or not isnull(ldb_producc_real) then
							ldb_producc_mora							= ldb_producc - ldb_producc_real
							ldb_porce_mora								= round(ldb_producc_mora / ldb_producc,4)
							ldb_producc_efec							= ldb_producc - ( ldb_producc * ldb_porce_mora)
						end if
					end if
				else
					if ls_cargo = 'ANF' then
						ls_canal											= 'NF'
					elseif ls_cargo = 'ANI' then
						ls_canal											= 'NI'
					elseif ls_cargo = 'SNF' then
						ls_canal											= 'NF'	
					end if
					if ll_cod_parque_uni=11 then
						SELECT SUM("PREMIOS_MEJOR_DETALLE"."PRODUCC"),SUM("PREMIOS_MEJOR_DETALLE"."PRODUCC_REAL")
						INTO	:ldb_producc,	:ldb_producc_real
						FROM	"PREMIOS_MEJOR_DETALLE", "FORESTA"."AGENTES"  
						WHERE	"PREMIOS_MEJOR_DETALLE"."COD_AGE" = "FORESTA"."AGENTES"."COD_AGE" and
								"PREMIOS_MEJOR_DETALLE"."FECHA_FIN" = :ldt_fecha_fin and
								"FORESTA"."AGENTES"."COD_PARQUE" = :ll_cod_parque_uni AND  
								"FORESTA"."AGENTES"."CANAL" = :ls_canal AND
								"PREMIOS_MEJOR_DETALLE"."COD_AGE" = :ls_cod_age
						USING	Trans_1;
					else
						SELECT SUM("PREMIOS_MEJOR_DETALLE"."PRODUCC"),SUM("PREMIOS_MEJOR_DETALLE"."PRODUCC_REAL")
						INTO	:ldb_producc,	:ldb_producc_real
						FROM	"PREMIOS_MEJOR_DETALLE", "PRADO"."AGENTES"  
						WHERE	"PREMIOS_MEJOR_DETALLE"."COD_AGE" = "PRADO"."AGENTES"."COD_AGE" and
								"PREMIOS_MEJOR_DETALLE"."FECHA_FIN" = :ldt_fecha_fin and
								"PRADO"."AGENTES"."COD_PARQUE" = :ll_cod_parque_uni AND  
								"PRADO"."AGENTES"."CANAL" = :ls_canal AND
								"PREMIOS_MEJOR_DETALLE"."COD_AGE" = :ls_cod_age
						USING	Trans_1;
					end if
					if Trans_1.sqlcode=0 then
						if not isnull(ldb_producc) or not isnull(ldb_producc_real) then
							ldb_producc_mora							= ldb_producc - ldb_producc_real
							ldb_porce_mora								= round(ldb_producc_mora / ldb_producc,4)
							ldb_producc_efec							= ldb_producc - ( ldb_producc * ldb_porce_mora)
						end if
					end if
				end if
				dw_mejores.setitem(ll_new,"porce_mora",ldb_porce_mora)
				dw_mejores.setitem(ll_new,"producc",ldb_producc)
				dw_mejores.setitem(ll_new,"producc_mora",ldb_producc_mora)
				dw_mejores.setitem(ll_new,"producc_real",ldb_producc_real)
				dw_mejores.setitem(ll_new,"producc_efec",ldb_producc_efec)
			end if
			setnull(ls_cod_age);setnull(ll_parque);setnull(ls_canal_v)
		LOOP
	end if
	if ls_cargo = 'ANF' then
		close x1;
	elseif ls_cargo = 'ANI' then
		close x2;
	elseif ls_cargo = 'SNF' then
		close x3;	
	end if
	dw_mejores.accepttext()
	dw_mejores.setsort("producc_efec D")
	dw_mejores.sort()
	dw_mejores.accepttext()
	wf_calcula_lugar(ll_cod_parque_uni,ls_cargo,ldt_fecha_fin,ldt_fecha_calc,ll_tipo_premio)
else
	if isnull(ll_tipo_premio) or ll_tipo_premio=0 then
		messagebox("Advertencia", "Debe Ingresar Tipo Premio")
		dw_tipo_premio.setfocus()
		dw_tipo_premio.setcolumn('tipo_premio')
	elseif isnull(ll_cod_parque_uni) or ll_cod_parque_uni=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_parque.setfocus()
		dw_parque.setcolumn('parque')
	elseif isnull(ls_cargo) or ls_cargo='' then
		messagebox("Advertencia", "Debe Ingresar Cargo Personal de Ventas")
		dw_cargo.setfocus()
		dw_cargo.setcolumn('cargo')	
	elseif isnull(ldt_fecha_ini) then
		messagebox("Advertencia", "Debe Ingresar Fecha Inicio")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('fecha_ini')	
	elseif isnull(ldt_fecha_fin) then
		messagebox("Advertencia", "Debe Ingresar Fecha Término")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('fecha_fin')
	end if
end if
end event

type cb_2 from commandbutton within w_premios_mejores
integer x = 3003
integer y = 1664
integer width = 293
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premios_mejores)
end event

type cb_imprimir from commandbutton within w_premios_mejores
integer x = 1568
integer y = 1664
integer width = 279
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_mejores.rowcount() >0 then 
	f_Print( dw_mejores )
end if
end event

type dw_parque from datawindow within w_premios_mejores
integer x = 1358
integer y = 32
integer width = 878
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_cargo.reset()
dw_cargo.insertrow(0)
dw_mejores.reset()
end event

type dw_fecha_cierre from datawindow within w_premios_mejores
integer x = 2249
integer y = 36
integer width = 837
integer height = 192
integer taborder = 10
string title = "none"
string dataobject = "dwe_cierre_ventas_periodos"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna
long		ll_periodo,ll_anno,ll_tipo_premio
datetime	ldt_fecha_fin,ldt_fecha_ini,ldt_nulo

dw_mejores.reset()
Setnull(ldt_nulo)
this.accepttext()
dw_tipo_premio.accepttext()
ls_columna	= dwo.name
if ls_columna = 'fecha_fin' then
	ldt_fecha_fin										= dw_fecha_cierre.getitemdatetime(1,'fecha_fin')
	ll_tipo_premio										= dw_tipo_premio.getitemnumber(1,'tipo_premio')
	if not isnull(ll_tipo_premio) and ll_tipo_premio>0 then
		wf_valida_periodo(ldt_fecha_fin,ll_tipo_premio)
	else
		if isnull(ll_tipo_premio) or ll_tipo_premio=0 then
			messagebox("Advertencia", "Debe Tipo Premio")
			dw_tipo_premio.setfocus()
			dw_tipo_premio.setcolumn('tipo_premio')
		end if
	end if
end if
end event

type dw_cargo from datawindow within w_premios_mejores
integer x = 1317
integer y = 128
integer width = 923
integer height = 108
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cargo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_mejores.reset()
end event

