forward
global type w_comision_ejecutivo_terreno from window
end type
type cb_ordenar from commandbutton within w_comision_ejecutivo_terreno
end type
type cb_pagos from commandbutton within w_comision_ejecutivo_terreno
end type
type st_promesa from statictext within w_comision_ejecutivo_terreno
end type
type pb_buscar from picturebutton within w_comision_ejecutivo_terreno
end type
type em_ctto from editmask within w_comision_ejecutivo_terreno
end type
type cb_limpiar from commandbutton within w_comision_ejecutivo_terreno
end type
type cb_resumen_comi from commandbutton within w_comision_ejecutivo_terreno
end type
type usuario_t from statictext within w_comision_ejecutivo_terreno
end type
type st_usuario from statictext within w_comision_ejecutivo_terreno
end type
type cb_grabar from commandbutton within w_comision_ejecutivo_terreno
end type
type cb_imprimir from commandbutton within w_comision_ejecutivo_terreno
end type
type cb_cta_cte from commandbutton within w_comision_ejecutivo_terreno
end type
type pb_aceptar from picturebutton within w_comision_ejecutivo_terreno
end type
type p_termino from picture within w_comision_ejecutivo_terreno
end type
type st_desde from statictext within w_comision_ejecutivo_terreno
end type
type em_termino from editmask within w_comision_ejecutivo_terreno
end type
type em_inicio from editmask within w_comision_ejecutivo_terreno
end type
type st_hasta from statictext within w_comision_ejecutivo_terreno
end type
type cb_cerrar from commandbutton within w_comision_ejecutivo_terreno
end type
type dw_comision from datawindow within w_comision_ejecutivo_terreno
end type
type gb_periodo from groupbox within w_comision_ejecutivo_terreno
end type
type dw_ejecutivo from datawindow within w_comision_ejecutivo_terreno
end type
type gb_1 from groupbox within w_comision_ejecutivo_terreno
end type
end forward

global type w_comision_ejecutivo_terreno from window
integer width = 3771
integer height = 2188
boolean titlebar = true
string title = "Comisiones Ventas Ejecutivo Terreno"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ordenar cb_ordenar
cb_pagos cb_pagos
st_promesa st_promesa
pb_buscar pb_buscar
em_ctto em_ctto
cb_limpiar cb_limpiar
cb_resumen_comi cb_resumen_comi
usuario_t usuario_t
st_usuario st_usuario
cb_grabar cb_grabar
cb_imprimir cb_imprimir
cb_cta_cte cb_cta_cte
pb_aceptar pb_aceptar
p_termino p_termino
st_desde st_desde
em_termino em_termino
em_inicio em_inicio
st_hasta st_hasta
cb_cerrar cb_cerrar
dw_comision dw_comision
gb_periodo gb_periodo
dw_ejecutivo dw_ejecutivo
gb_1 gb_1
end type
global w_comision_ejecutivo_terreno w_comision_ejecutivo_terreno

type variables
string	is_graba='N'
long il_row
end variables

forward prototypes
public subroutine wf_fechas (datetime adt_fecha)
end prototypes

public subroutine wf_fechas (datetime adt_fecha);long		ll_mes,ll_ano,ll_dia
datetime	ldt_fecha_ini,ldt_fecha_fin

//wf_fechas(adt_fecha)

ll_mes						= month(date(adt_fecha))
ll_ano							= year(date(adt_fecha))

if ll_mes=1 then
	ll_mes					= ll_mes + 11
	ll_ano						= ll_ano - 1
else
	ll_mes					= ll_mes - 1
end if

SELECT	"CIERRE_VENTA"."CIERRE_VENTA"
INTO		:ldt_fecha_fin
FROM 	"CIERRE_VENTA"  
WHERE	( "CIERRE_VENTA"."PERIODO" = :ll_mes ) AND  
         	( "CIERRE_VENTA"."ANNO" = :ll_ano )
USING	sqlca;
if isnull(ldt_fecha_fin) then
	ldt_fecha_fin			= f_fecha_fin(ll_mes,ll_ano)
end if

ldt_fecha_ini				= datetime(date(string( '01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))),time('00:00:00'))
em_inicio.text				= string(ldt_fecha_ini,'dd/mm/yyyy')
em_termino.text			= string(ldt_fecha_fin,'dd/mm/yyyy')
end subroutine

on w_comision_ejecutivo_terreno.create
this.cb_ordenar=create cb_ordenar
this.cb_pagos=create cb_pagos
this.st_promesa=create st_promesa
this.pb_buscar=create pb_buscar
this.em_ctto=create em_ctto
this.cb_limpiar=create cb_limpiar
this.cb_resumen_comi=create cb_resumen_comi
this.usuario_t=create usuario_t
this.st_usuario=create st_usuario
this.cb_grabar=create cb_grabar
this.cb_imprimir=create cb_imprimir
this.cb_cta_cte=create cb_cta_cte
this.pb_aceptar=create pb_aceptar
this.p_termino=create p_termino
this.st_desde=create st_desde
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_hasta=create st_hasta
this.cb_cerrar=create cb_cerrar
this.dw_comision=create dw_comision
this.gb_periodo=create gb_periodo
this.dw_ejecutivo=create dw_ejecutivo
this.gb_1=create gb_1
this.Control[]={this.cb_ordenar,&
this.cb_pagos,&
this.st_promesa,&
this.pb_buscar,&
this.em_ctto,&
this.cb_limpiar,&
this.cb_resumen_comi,&
this.usuario_t,&
this.st_usuario,&
this.cb_grabar,&
this.cb_imprimir,&
this.cb_cta_cte,&
this.pb_aceptar,&
this.p_termino,&
this.st_desde,&
this.em_termino,&
this.em_inicio,&
this.st_hasta,&
this.cb_cerrar,&
this.dw_comision,&
this.gb_periodo,&
this.dw_ejecutivo,&
this.gb_1}
end on

on w_comision_ejecutivo_terreno.destroy
destroy(this.cb_ordenar)
destroy(this.cb_pagos)
destroy(this.st_promesa)
destroy(this.pb_buscar)
destroy(this.em_ctto)
destroy(this.cb_limpiar)
destroy(this.cb_resumen_comi)
destroy(this.usuario_t)
destroy(this.st_usuario)
destroy(this.cb_grabar)
destroy(this.cb_imprimir)
destroy(this.cb_cta_cte)
destroy(this.pb_aceptar)
destroy(this.p_termino)
destroy(this.st_desde)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_hasta)
destroy(this.cb_cerrar)
destroy(this.dw_comision)
destroy(this.gb_periodo)
destroy(this.dw_ejecutivo)
destroy(this.gb_1)
end on

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

event open;connect using Trans_1;
connect using Trans_2;
connect using Trans_4;

gf_centrar(w_comision_ejecutivo_terreno)
dw_comision.dataobject				= 'dw_comision_vtas_nuevas'
dw_comision.settransobject(sqlca)
st_usuario.text							= string(gs_user)
wf_fechas(gdt_fec_sistema)

if gl_proceso = 4 then
	cb_grabar.visible					= false
	dw_comision.dataobject			= 'dw_comision_vtas_pagada'
	dw_comision.settransobject(sqlca)
elseif gl_proceso = 5 then
	cb_grabar.visible					= true
	dw_comision.dataobject			= 'dw_comision_vtas_pagada'
	dw_comision.settransobject(sqlca)	
elseif gl_proceso = 0 then
	dw_comision.dataobject			= 'dw_comision_vtas_pagada_ind'
	dw_comision.settransobject(sqlca)
	dw_ejecutivo.dataobject			= 'dwe_ejecutivo'
	dw_ejecutivo.settransobject(sqlca)
	dw_ejecutivo.getchild('ejecutivo',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(gs_user)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_ejecutivo.insertrow(0)
	dw_ejecutivo.setitem(1,'ejecutivo',	gs_user)
	dw_ejecutivo.accepttext()
	dw_ejecutivo.Object.ejecutivo.Protect=1
	dw_ejecutivo.visible				= true
	cb_grabar.visible					= false
	cb_resumen_comi.visible			= false
else
	messagebox("Advertencia"," Usuario No Autorizado")
	close(w_comision_ejecutivo_terreno)
end if
end event

type cb_ordenar from commandbutton within w_comision_ejecutivo_terreno
integer x = 1641
integer y = 1940
integer width = 251
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_comision.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_comision.SETSORT(NULO)
	dw_comision.SORT()
end if
end event

type cb_pagos from commandbutton within w_comision_ejecutivo_terreno
integer x = 850
integer y = 1940
integer width = 357
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pagos &Ventas"
end type

event clicked;string	ls_base,ls_serie,ls_string
double	ldb_numero

dw_comision.accepttext()
if dw_comision.dataobject='dw_comision_vtas_pagada' and dw_comision.rowcount() > 0 then
	ls_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
	ls_serie				= dw_comision.getitemstring(il_row,'oferta_v_serie')
	ldb_numero			= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
elseif dw_comision.dataobject='dw_comision_vtas_pagada_ind' and dw_comision.rowcount() > 0 then
	ls_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
	ls_serie				= dw_comision.getitemstring(il_row,'oferta_v_serie')
	ldb_numero			= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
elseif dw_comision.dataobject='dw_comision_vtas_nuevas' and dw_comision.rowcount() > 0 then
	ls_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
	ls_serie				= dw_comision.getitemstring(il_row,'oferta_v_serie')
	ldb_numero			= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
end if
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
	ls_string		= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
	if isvalid(w_rescomi_terreno) then close(w_rescomi_terreno)
	OpenWithParm (w_rescomi_terreno,ls_string)
end if
end event

type st_promesa from statictext within w_comision_ejecutivo_terreno
integer x = 2487
integer y = 1952
integer width = 457
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Nº Promesa"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_comision_ejecutivo_terreno
integer x = 3301
integer y = 1936
integer width = 101
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string		ls_string
double	ldb_numero

ldb_numero						= double(em_ctto.text)
ll_tot_reg						= dw_comision.rowcount()
st_promesa.text = 'Buscar Nº Promesa'
if dw_comision.rowcount() > 0 then
	ls_string				= "oferta_v_nro_oferta = "+string(ldb_numero)
end if
if ldb_numero>0 and ll_tot_reg>0 then
	ll_fila 					= dw_comision.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_comision.scrolltorow(ll_fila)
		dw_comision.SelectRow(ll_fila, true)
	else
		messagebox("Advertencia","Nº Contrato No Existe en Lista")
		dw_comision.scrolltorow(1)
	end if
end if
end event

type em_ctto from editmask within w_comision_ejecutivo_terreno
integer x = 2953
integer y = 1936
integer width = 343
integer height = 92
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if double(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type cb_limpiar from commandbutton within w_comision_ejecutivo_terreno
integer x = 2181
integer y = 1940
integer width = 229
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_ejecutivo.reset()
dw_ejecutivo.insertrow(0)
dw_comision.reset()

end event

type cb_resumen_comi from commandbutton within w_comision_ejecutivo_terreno
integer x = 50
integer y = 1940
integer width = 443
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Resumen Comis."
end type

event clicked;string	ls_string,ls_tipo_comi
long		ll_cta
datetime	ldt_fecha_comi

ldt_fecha_comi				= datetime(date(em_termino.text),time('00:00:00'))
ls_tipo_comi					= 'N'
SELECT	count("RES_COMI"."FECHA")  
INTO		:ll_cta  
FROM		"RES_COMI"  
WHERE	( "RES_COMI"."FECHA" = :ldt_fecha_comi ) AND  
			( "RES_COMI"."COD_CONTABLE" = '070' or "RES_COMI"."COD_CONTABLE" = '072' or "RES_COMI"."COD_CONTABLE" = '077' )
USING		sqlca;
if not isnull(ll_cta) and ll_cta>0 then
	ls_string				= string(ldt_fecha_comi,'dd/mm/yyyy')+'~t'+ls_tipo_comi
	OpenWithParm(w_comision_resumen_at, ls_string)
else
	messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fecha_comi,"dd/mm/yyyy"))
end if
end event

type usuario_t from statictext within w_comision_ejecutivo_terreno
boolean visible = false
integer x = 3141
integer y = 20
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Usuario:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_usuario from statictext within w_comision_ejecutivo_terreno
boolean visible = false
integer x = 3392
integer y = 20
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_comision_ejecutivo_terreno
integer x = 498
integer y = 1940
integer width = 288
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_haber,ls_est_com,ls_cod_age,ls_base,ls_serie,ls_cod_cont,ls_est_age,ls_mon
long		ll_dia,ll_mes,ll_ano,ll_tot_reg,ll_res,ll_indi,ll_rut,ll_tot_pag,ll_cod_parque,ll_malos,ll_cont,ll_ult_dia
datetime	ldt_fec_fin,ldt_fec_com
double	ldb_numero,ldb_valor_uf,ldb_porce_vta,ldb_precio,ldb_porce_ing,ldb_mto_com

ldt_fec_fin										= datetime(date(em_termino.text),time('00:00:00'))
ls_haber											= 'H'
ls_est_com										= 'P'
if is_graba<>'S' then
	messagebox("Advertencia","Debe Generar Proceso")
else
	if not isnull(ldt_fec_fin) then
		ll_dia											= day(date(ldt_fec_fin))
		ll_mes										= month(date(ldt_fec_fin))
		ll_ano											= year(date(ldt_fec_fin))	
		ll_ult_dia										= day(date( f_fecha_fin(ll_mes,ll_ano)))
		
		SELECT	"VALOR_UF"  
		INTO		:ldb_valor_uf  
		FROM		"TAB_UF"  
		WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
		USING	sqlca;
		if isnull(ldb_valor_uf) then ldb_valor_uf= 0
		if ldb_valor_uf=0 then
			messagebox("Advertencia","No Existe Valor U.F. del :"+string(ldt_fec_fin,"dd/mm/yyyy"))
		else
			if  ll_dia <> ll_ult_dia then
				messagebox("Advertencia","No Puede Ejecutar el Proceso de Comisiones con Fecha :"+string(ldt_fec_fin,"dd/mm/yyyy"))
			else
				SELECT	MAX("FECHA")  
				INTO 		:ldt_fec_com   
				FROM		"RES_COMI"  
				WHERE 	("RES_COMI"."COD_CONTABLE" = '070' OR "RES_COMI"."COD_CONTABLE" = '072' OR "RES_COMI"."COD_CONTABLE" = '077')
				USING	sqlca;
				if ldt_fec_fin = ldt_fec_com then
					messagebox("Advertencia","Proceso Comisiones del :"+string(ldt_fec_fin,"dd/mm/yyyy")+" Ya fue Grabado")
				else
					ll_tot_reg						= dw_comision.rowcount()
					if ll_tot_reg = 0 then
						messagebox("Advertencia","No Registra Datos Para Grabar")
					else
						ll_res							= MessageBox("Advertencia", '¿ Desea Actualizar en Tabla Res_comi ?', Exclamation!, YesNo!, 2)
						SetPointer(HourGlass!)
						if ll_res = 1 then
							for ll_indi	=1 to 	ll_tot_reg
								ls_cod_age			= dw_comision.getitemstring(ll_indi,'agentes_cod_age')							
								ll_rut					= dw_comision.getitemnumber(ll_indi,'agentes_rut')
								ls_base				= dw_comision.getitemstring(ll_indi,'cadena_codigo')	
								ls_serie				= dw_comision.getitemstring(ll_indi,'oferta_v_serie')	
								ldb_numero			= dw_comision.getitemnumber(ll_indi,'oferta_v_nro_oferta')
								ll_cod_parque		= dw_comision.getitemnumber(ll_indi,'cadena_cod_parque')
								ll_tot_pag			= f_tot_pag_prem_comi(ls_base,ls_serie,ldb_numero,ldt_fec_fin)
								ldb_porce_ing		= dw_comision.getitemnumber(ll_indi,'c_porce_ingreso')
								if ll_cod_parque = 102 then
									ls_cod_cont		= '072'
								elseif ll_cod_parque = 103 then
									ls_cod_cont		= '077'
								else
									ls_cod_cont		= '070'
								end if
								ls_est_age			= dw_comision.getitemstring(ll_indi,'agentes_estado')
								ldb_porce_vta		= dw_comision.getitemnumber(ll_indi,'oferta_v_porce_venta')
								ls_mon				= dw_comision.getitemstring(ll_indi,'pago_oferta_moneda')	
								ldb_precio			= dw_comision.getitemnumber(ll_indi,'pago_oferta_precio')
								ldb_mto_com		= dw_comision.getitemnumber(ll_indi,'c_total_pago')
								if f_graba_res_comi(ls_cod_age,ll_rut,ll_tot_pag,ls_cod_cont,string(ll_mes),ldt_fec_fin,ldb_numero,ls_serie,ldb_porce_ing,ldb_porce_vta,ldb_precio,ldb_mto_com,ldb_valor_uf,ls_haber,ls_mon,ls_est_com,ls_est_age,ls_base,ll_cod_parque,0,0)= -1 then
									ll_malos++
								else
									ll_cont++
								end if	
								UPDATE	"OFERTA_V"  
								SET		"ESTADO_COMI" = :ls_est_com,
											"FECHA_COM" = :ldt_fec_fin,
											"PORCE_VENTA" = :ldb_porce_vta
								WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
								USING	sqlca;
								if sqlca.sqlcode = 0 then
									commit using sqlca;
								else
									commit using sqlca;
								end if
							next
							messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_cont,'###,###,##0')+' registros grabados con exito~r~n'+&
										'y '+string(ll_malos,'###,###,##0')+' registros con problemas.',information!)
						end if
					end if
				end if
			end if
		end if
	end if
end if
end event

type cb_imprimir from commandbutton within w_comision_ejecutivo_terreno
integer x = 1897
integer y = 1940
integer width = 251
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_comision.rowcount() > 0 then f_Print( dw_comision )
end event

type cb_cta_cte from commandbutton within w_comision_ejecutivo_terreno
integer x = 1211
integer y = 1940
integer width = 425
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa

if dw_comision.rowcount() > 0 then
	if il_row>0 then
		gi_numero 					= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
		gs_base						= dw_comision.getitemstring(il_row,'cadena_codigo')
		gs_serie						= dw_comision.getitemstring(il_row,'oferta_v_serie')
		gi_rut						= dw_comision.getitemnumber(il_row,'cadena_rut')
		CHOOSE CASE gs_base
			CASE "O","U" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "F","G","V"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				Open(w_cuenta_corriente_funeraria)
		END CHOOSE
	end if
end if
end event

type pb_aceptar from picturebutton within w_comision_ejecutivo_terreno
integer x = 1280
integer y = 68
integer width = 137
integer height = 116
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string 	ls_ejecutivo,ls_moneda,ls_usuario,ls_base,ls_serie,ls_cod_cont_070,ls_cod_cont_072,ls_cod_cont_077,&
			ls_cod_contable,ls_cod_contab
long 		ll_tot_reg,ll_tot_pagado,ll_fila,ll_indi,ll_comision,ll_suma_monto,ll_fila_2,&
			ll_ef,ll_ch,ll_suma_ef,ll_suma_ch,ll_cod_parque,ll_comp_sist,ll_suma_comp_sist
datetime	ldt_fecha_ini,ldt_fecha_term,ldt_fecha_uf,ldt_fecha_res_comi,ldt_fecha_fin
double	ldb_numero,ldb_precio,ldb_valor_uf,ldb_porce_vta,ldb_precio_peso,ldb_porce_ing

dw_ejecutivo.accepttext()
ldt_fecha_ini												= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_term												= datetime(date(em_termino.text),time('00:00:00'))
ls_cod_cont_070											= '070'
ls_cod_cont_072											= '072'
ls_cod_cont_077											= '077'


SELECT	"FECHA_UF",		"VALOR_UF"  
INTO		:ldt_fecha_uf,	:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_term
USING		sqlca;
if sqlca.sqlcode=100 then
	if isnull(ldt_fecha_uf) and isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
		messagebox("Advertencia","No Existe Valor U.F. del :"+string(ldt_fecha_term,"dd/mm/yyyy"))
	end if
else
	SELECT DISTINCT "FECHA"  
	INTO 		:ldt_fecha_res_comi	   
	FROM		"RES_COMI"  
	WHERE 	( "RES_COMI"."COD_CONTABLE" = :ls_cod_cont_070  OR "RES_COMI"."COD_CONTABLE" = :ls_cod_cont_072 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_cont_077) AND  
				"RES_COMI"."FECHA" = :ldt_fecha_term 
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_res_comi) then
			if gl_proceso >= 4 then
				dw_comision.dataobject						= 'dw_comision_vtas_pagada'
				dw_comision.settransobject(sqlca)
				dw_comision.object.usuario.text			= gs_user
				ll_tot_reg										= dw_comision.retrieve(ldt_fecha_term)
				if ll_tot_reg = 0 then
					messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fecha_term,"dd/mm/yyyy"))
				end if
			elseif gl_proceso = 0 then
				ls_ejecutivo								= dw_ejecutivo.getitemstring(1,'ejecutivo')
				if not isnull(ls_ejecutivo) and ls_ejecutivo <>'' then
					dw_comision.dataobject					= 'dw_comision_vtas_pagada_ind'
					cb_grabar.enabled							= false
					cb_imprimir.enabled						= true
					dw_comision.settransobject(sqlca)
					ll_tot_reg									= dw_comision.retrieve(ldt_fecha_term,ls_ejecutivo)
					dw_comision.object.usuario.text		= gs_user
					if ll_tot_reg = 0 then
						messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fecha_fin,"dd/mm/yyyy"))
					end if
				else
					if isnull(ls_ejecutivo) or ls_ejecutivo='' then
						messagebox("Advertencia", "Debe Ingresar Ejecutivo Terreno")
						dw_ejecutivo.setfocus()
					end if
				end if
			end if
		end if
	else
		if gl_proceso >= 4 then
			is_graba											= 'S'
			dw_comision.dataobject						= 'dw_comision_vtas_nuevas'
			dw_comision.settransobject(sqlca)
			ll_tot_reg										= dw_comision.retrieve()
			ll_fila												= dw_comision.rowcount()
			dw_comision.object.fecha_comi.text		= string(ldt_fecha_term,"dd/mm/yyyy")
			dw_comision.object.usuario.text			= gs_user
			
			if ll_fila>0 then
				for ll_indi = 1 to ll_fila
					ls_base									= dw_comision.getitemstring(ll_indi,'cadena_codigo')
					ls_serie									= dw_comision.getitemstring(ll_indi,'oferta_v_serie')
					ldb_numero								= dw_comision.getitemnumber(ll_indi,'oferta_v_nro_oferta')
					ls_moneda								= dw_comision.getitemstring(ll_indi,'pago_oferta_moneda')
					ldb_precio								= dw_comision.getitemnumber(ll_indi,'pago_oferta_precio')
					ldb_porce_vta							= 3
					ll_cod_parque							= dw_comision.getitemnumber(ll_indi,'cadena_cod_parque')
					if ls_moneda = '2' then
						ldb_precio_peso					= Round(ldb_precio * ldb_valor_uf,0)
					//	ll_comision							= ldb_precio * ldb_valor_uf * ldb_porce_vta / 100
					elseif ls_moneda = '1' then
						ldb_precio_peso					= Round(ldb_precio,0)
					//	ll_comision							= ldb_precio * ldb_porce_vta / 100
					end if
					
					ll_tot_pagado							= f_tot_pag_prem_comi(ls_base,ls_serie,ldb_numero,ldt_fecha_term)
					ldb_porce_ing							= Round((ll_tot_pagado*100) / ldb_precio_peso,2)
					if ldb_porce_ing <= 10 then
						ldb_porce_vta						= ldb_porce_vta
					elseif ldb_porce_ing > 10 and ldb_porce_ing <= 15 then
						ldb_porce_vta						= ldb_porce_vta + 1
					elseif ldb_porce_ing > 15 then
						ldb_porce_vta						= ldb_porce_vta + 2
					end if
					ll_comision								= ldb_precio_peso * ldb_porce_vta / 100
					dw_comision.setitem(ll_indi,'c_valor_uf',ldb_valor_uf)
					if ll_cod_parque = 102 then
						ls_cod_contable = ls_cod_cont_072
					elseif ll_cod_parque = 103 then
						ls_cod_contable = ls_cod_cont_077
					else
						ls_cod_contable = ls_cod_cont_070
					end if
					dw_comision.setitem(ll_indi,'c_cod_contab',ls_cod_contable)
					dw_comision.setitem(ll_indi,'c_total_pagado',ll_tot_pagado)
					dw_comision.setitem(ll_indi,'c_porce_ingreso',ldb_porce_ing)
					dw_comision.setitem(ll_indi,'oferta_v_porce_venta',ldb_porce_vta)
					dw_comision.setitem(ll_indi,'c_total_pago',ll_comision)
					dw_comision.setitem(ll_indi,'c_estado_comi','P')
				next
				dw_comision.accepttext()
//				dw_comision.SetRedraw(false)
				dw_comision.setFilter( "c_porce_ingreso >= 6.98")
				dw_comision.filter()
				dw_comision.GroupCalc()
//				dw_comision.SetRedraw(true)
				dw_comision.accepttext()
				ll_fila_2									= dw_comision.rowcount()
				if ll_fila_2 = 0 then
					messagebox("Advertencia","No Registra Promesas a Pago")
				end if
				
				dw_comision.accepttext()
			else
				messagebox("Advertencia","No Registra Promesas a Pago")
			end if
		else
			messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fecha_term,"dd/mm/yyyy"))
		end if
	end if
end if
end event

type p_termino from picture within w_comision_ejecutivo_terreno
integer x = 1134
integer y = 76
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string		ls_fecha
long		ll_mes,ll_ano
datetime	ldt_fec_fin,ldt_fec_ini

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
dw_comision.reset()

ldt_fec_fin			= datetime(date(em_termino.text),time('00:00:00'))
if not isnull(ldt_fec_fin) then
	ll_mes			= month(date(datetime(date(em_termino.text),time('00:00:00'))))
	ll_ano				= year(date(datetime(date(em_termino.text),time('00:00:00'))))
	ldt_fec_ini		= datetime(date(string('16/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))),time('00:00:00'))
end if
end event

type st_desde from statictext within w_comision_ejecutivo_terreno
integer x = 96
integer y = 92
integer width = 169
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type em_termino from editmask within w_comision_ejecutivo_terreno
integer x = 809
integer y = 80
integer width = 320
integer height = 80
integer taborder = 20
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

event modified;long		ll_mes,ll_ano
datetime	ldt_fec_fin,ldt_fec_ini

dw_comision.reset()
dw_ejecutivo.reset()
dw_ejecutivo.insertrow(0)

ldt_fec_fin			= datetime(date(em_termino.text),time('00:00:00'))

if not isnull(ldt_fec_fin) then
	ll_mes			= month(date(datetime(date(em_termino.text),time('00:00:00'))))
	ll_ano				= year(date(datetime(date(em_termino.text),time('00:00:00'))))
	ldt_fec_ini		= datetime(date(string('16/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))),time('00:00:00'))
end if

end event

type em_inicio from editmask within w_comision_ejecutivo_terreno
integer x = 288
integer y = 80
integer width = 320
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_hasta from statictext within w_comision_ejecutivo_terreno
integer x = 640
integer y = 88
integer width = 155
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_comision_ejecutivo_terreno
integer x = 3433
integer y = 1932
integer width = 283
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_ejecutivo_terreno)
end event

type dw_comision from datawindow within w_comision_ejecutivo_terreno
integer x = 50
integer y = 204
integer width = 3666
integer height = 1688
integer taborder = 40
string title = "none"
string dataobject = "dw_comision_vtas_nuevas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;cb_cta_cte.triggerevent(clicked!)
end event

type gb_periodo from groupbox within w_comision_ejecutivo_terreno
integer x = 55
integer y = 16
integer width = 1198
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Período"
end type

type dw_ejecutivo from datawindow within w_comision_ejecutivo_terreno
boolean visible = false
integer x = 2231
integer y = 96
integer width = 1499
integer height = 104
integer taborder = 30
string title = "none"
string dataobject = "dwe_ejecutivo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_comision.reset()

end event

type gb_1 from groupbox within w_comision_ejecutivo_terreno
integer x = 832
integer y = 1888
integer width = 1605
integer height = 164
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

