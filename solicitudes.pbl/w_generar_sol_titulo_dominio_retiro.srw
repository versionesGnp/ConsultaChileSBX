forward
global type w_generar_sol_titulo_dominio_retiro from window
end type
type cb_procesar from commandbutton within w_generar_sol_titulo_dominio_retiro
end type
type sle_1 from uo_convierte_numero within w_generar_sol_titulo_dominio_retiro
end type
type cb_print from commandbutton within w_generar_sol_titulo_dominio_retiro
end type
type cb_ordenar from commandbutton within w_generar_sol_titulo_dominio_retiro
end type
type cb_exportar from commandbutton within w_generar_sol_titulo_dominio_retiro
end type
type cb_filtrar from commandbutton within w_generar_sol_titulo_dominio_retiro
end type
type cb_buscar from commandbutton within w_generar_sol_titulo_dominio_retiro
end type
type cb_generar from commandbutton within w_generar_sol_titulo_dominio_retiro
end type
type cb_cerrar from commandbutton within w_generar_sol_titulo_dominio_retiro
end type
type dw_lista from datawindow within w_generar_sol_titulo_dominio_retiro
end type
type gb_1 from groupbox within w_generar_sol_titulo_dominio_retiro
end type
end forward

global type w_generar_sol_titulo_dominio_retiro from window
integer width = 3616
integer height = 2136
boolean titlebar = true
string title = "Generar Solicitud Titulo de Dominio"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_procesar cb_procesar
sle_1 sle_1
cb_print cb_print
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_buscar cb_buscar
cb_generar cb_generar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_generar_sol_titulo_dominio_retiro w_generar_sol_titulo_dominio_retiro

type variables
Long	il_row
date	idt_fecha_hoy
end variables

forward prototypes
public function string wf_fecha_palabra (date ad_fecha)
end prototypes

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

on w_generar_sol_titulo_dominio_retiro.create
this.cb_procesar=create cb_procesar
this.sle_1=create sle_1
this.cb_print=create cb_print
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_buscar=create cb_buscar
this.cb_generar=create cb_generar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_procesar,&
this.sle_1,&
this.cb_print,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_buscar,&
this.cb_generar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_generar_sol_titulo_dominio_retiro.destroy
destroy(this.cb_procesar)
destroy(this.sle_1)
destroy(this.cb_print)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_buscar)
destroy(this.cb_generar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_tot_reg,ll_indi,ll_count_ch_inv
String		ls_base,ls_base_p,ls_serie,ls_serie_p,ls_estado
Double	ll_numero,ll_numero_p

gf_centrar(w_generar_sol_titulo_dominio_retiro)
dw_lista.settransobject(sqlca)
ll_tot_reg			= dw_lista.retrieve()
idt_fecha_hoy		= date(gdt_fec_sistema)
if ll_tot_reg > 0 then
	SetPointer(HourGlass!)
	for ll_indi = 1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'c_estado_reg',1)
		ls_base		= dw_lista.getitemstring(ll_indi,'base')
		ls_serie		= dw_lista.getitemstring(ll_indi,'serie')
		ll_numero	= dw_lista.getitemnumber(ll_indi,'numero')
		if ls_base='C' and ll_numero > 0 then
			SELECT   "PAGARE"."SERIE_P",   
						"PAGARE"."NRO_PAGARE"  
			INTO     :ls_serie_p,
						:ll_numero_p
			FROM     "CONTRATO",  "PAGARE",  "CADENA"  
			WHERE  ( "CONTRATO"."SERIE_C" = "PAGARE"."SERIE" ) and  
					 ( "CONTRATO"."NRO_CONTRATO" = "PAGARE"."NRO_OFERTA" ) and  
					 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
					 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero ) )   
			USING		sqlca;
			if ll_numero_p > 0 then
				SELECT   COUNT("DOCUMENTOS"."ESTADO_CH")
				INTO     :ll_count_ch_inv  
				FROM     "DOCUMENTOS",	"INGRESO"  
				WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
						 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
						 (("DOCUMENTOS"."COD_PAGO" = 'CH' ) AND  
						 ( "DOCUMENTOS"."ESTADO_CH" <> 'C' ) AND  
						 ( "INGRESO"."BASE" = 'P' ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie_p ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero_p ) AND
						 ( "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'I' ) )  ;
				if ll_count_ch_inv > 0 then
					ls_estado	= 'S'
				else
					ls_estado	= 'N'
				end if
			end if
		else
			ls_estado			= 'N'
		end if
		dw_lista.setitem(ll_indi,'c_cheque',ls_estado)
	next
	dw_lista.accepttext()
	dw_lista.SETfilter("c_cheque = 'N'")
	dw_lista.filter()
	dw_lista.accepttext()
	SetPointer(Arrow!)
else
	messagebox("Advertencia","No Registra Dato")
	close(w_generar_sol_titulo_dominio_retiro)
end if

end event

type cb_procesar from commandbutton within w_generar_sol_titulo_dominio_retiro
integer x = 32
integer y = 1840
integer width = 283
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Procesar"
end type

event clicked;dw_lista.accepttext()
dw_lista.SETfilter("c_cheque = 'N'")
dw_lista.filter()
dw_lista.accepttext()

end event

type sle_1 from uo_convierte_numero within w_generar_sol_titulo_dominio_retiro
boolean visible = false
integer x = 2848
integer y = 1848
integer width = 270
integer taborder = 0
boolean hideselection = false
end type

type cb_print from commandbutton within w_generar_sol_titulo_dominio_retiro
integer x = 1605
integer y = 1848
integer width = 261
integer height = 100
integer taborder = 40
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

type cb_ordenar from commandbutton within w_generar_sol_titulo_dominio_retiro
integer x = 1943
integer y = 1848
integer width = 251
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_generar_sol_titulo_dominio_retiro
integer x = 2199
integer y = 1848
integer width = 251
integer height = 100
integer taborder = 60
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

type cb_filtrar from commandbutton within w_generar_sol_titulo_dominio_retiro
integer x = 2455
integer y = 1848
integer width = 206
integer height = 100
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

type cb_buscar from commandbutton within w_generar_sol_titulo_dominio_retiro
integer x = 864
integer y = 1840
integer width = 361
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar * Rut"
end type

event clicked;gi_tipo_busqueda	= 1
gi_rut				= dw_lista.getitemnumber(il_row,'rut')
if isvalid(w_listado_contratos_rut) then close(w_listado_contratos_rut)
open(w_listado_contratos_rut)
end event

type cb_generar from commandbutton within w_generar_sol_titulo_dominio_retiro
integer x = 347
integer y = 1840
integer width = 485
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Generar Solicitud"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_fila,ll_estado,ll_rut,ll_capacidad,ll_total_pagado,&
			ll_cod_parque,ll_rut_gerente_operaciones,ll_correlativo,ll_total_renta,ll_grupo_f,ll_mora_mant,&
			ll_mora_cred,ll_count_reg,ll_corr,ll_linea,ll_count_sol_tit,ll_count_ok=0,ll_count_malos=0,ll_marcados,&
			ll_count_coprop,ll_resp
Double	ll_numero
String	ls_base,ls_serie,ls_sexo,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_nro_sepultura,&
			ls_sector,ls_area,ls_direccion_p,ls_nro_particular,ls_depto_particular,&
			ls_block_particular,ls_comuna,ls_ciudad,ls_poblacion,ls_estado_civil,ls_estado_cadena,&
			ls_tipo_via_titulo,ls_trato,ls_nombre_cliente,ls_tipo_construccion,ls_total_pagado_palabras,&
			ls_fecha_promesa_palabas,ls_estado_obs,ls_estado_contrato,ls_obs,ls_sector_p,ls_fono_p,&
			ls_domicilio_c,ls_fono_c,ls_estado_cob,ls_celular,ls_sepultado,ls_cod_agente,ls_cod_sup,ls_cod_jefe,&
			ls_est_ctto,ls_estado_cod,ls_tipo_via
datetime	ldt_fecha,ldt_fecha_promesa,ldt_fecha_mant,ldt_fecha_hoy,ldt_fec_nac,ldt_fecha_recil

ll_tot_reg					= dw_lista.rowcount()
if ll_tot_reg > 0 then
	SELECT	sysdate	INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
	ldt_fecha				= datetime(idt_fecha_hoy,now())
	ldt_fecha_hoy			= datetime(idt_fecha_hoy,time('00:00:00'))
	ll_fila					= dw_lista.Find("c_estado_reg = 0", 1, ll_tot_reg)
	if ll_fila > 0 then
		ll_resp				= messagebox("Advertencia","Está Seguro de Generar Solicitud(es)",Exclamation!,YesNo!,2)
		if ll_resp=1 then
			for ll_indi = ll_fila to ll_tot_reg
				ll_estado		= dw_lista.getitemnumber(ll_indi,'c_estado_reg')
				if ll_estado=0 then
					ls_base		= dw_lista.getitemstring(ll_indi,'base')
					ls_serie		= dw_lista.getitemstring(ll_indi,'serie')
					ll_numero	= dw_lista.getitemnumber(ll_indi,'numero')
					SELECT	COUNT("SOL_ESTATUS"."BASE")  
					INTO 		:ll_count_sol_tit  
					FROM 		"SOL_ESTATUS"  
					WHERE  ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
							 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
							 ( "SOL_ESTATUS"."NUMERO" = :ll_numero ) AND  
							 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '6' ) AND  
							 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' )   ;
					if isnull(ll_count_sol_tit) then ll_count_sol_tit=0
					
					if ll_count_sol_tit = 0 then
						SELECT	MAX("SOL_TIT_DOMINIO"."CORRELATIVO")
						INTO 		:ll_correlativo
						FROM 		"SOL_TIT_DOMINIO"  
						WHERE  ( "SOL_TIT_DOMINIO"."BASE" = :ls_base ) AND  
								 ( "SOL_TIT_DOMINIO"."SERIE" = :ls_serie ) AND  
								 ( "SOL_TIT_DOMINIO"."NUMERO" = :ll_numero )
						USING	sqlca;
						if ll_correlativo > 0 then
							ll_correlativo ++
						else
							ll_correlativo	= 1
						end if
						if ls_base='C' then
							UPDATE	"CADENA"  
							SET 		"ESTADO_TITULO" = 'E',
										"FECHA_TITULO" = :ldt_fecha_hoy
							WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
										( "CADENA"."SERIE" = :ls_serie ) AND  
										( "CADENA"."NUMERO" = :ll_numero )   
							Using		sqlca ;
							if sqlca.sqlcode=0 then
								commit;
								if ls_base='C' then
									SELECT	"CLIENTE"."SEXO",   	"CLIENTE"."RUT",  "CLIENTE"."DV",   "CLIENTE"."NOMBRE",  "CLIENTE"."A_PATERNO",  "CLIENTE"."A_MATERNO",  "CONTRATO"."SEPULTURA", "CONTRATO"."SECTOR", "CONTRATO"."ZONA",   "CONTRATO"."CAPACIDAD", "CONTRATO"."FECHA",  "CLIENTE"."DIRECCION_P",   "CLIENTE"."NUMERO_PARTICULAR",   "CLIENTE"."DEPTO_PARTICULAR", "CLIENTE"."BLOCK_PARTICULAR", "COMUNA"."CODIGO_COMUNA",  "CIUDAD"."CODIGO_CIUDAD",  "CLIENTE"."POBLACION",  "CLIENTE"."ESTA_CIVIL", "CONTRATO"."TOT_PAGADO",   "CADENA"."ESTADO",   "CADENA"."COD_PARQUE",  "GERENTE_OPERACIONES"."RUT",	"CONTRATO"."FECHA_M",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."SECTOR",	"CLIENTE"."FONO_P",	"CLIENTE"."FECHA_NAC",	"CLIENTE"."ESTA_CIVIL",	"CLIENTE"."DOMICILIO_C",	"CLIENTE"."FONO_C",	"CLIENTE"."TOTAL_RENT",	"CLIENTE"."GRUPO_F",	"CLIENTE"."ESTADO_COBRANZA",	sysdate,				"CADENA"."FECHA_RES",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED",	"CLIENTE"."CELULAR",	"CONTRATO"."AGENTE",	"CADENA"."ESTADO",	"CADENA"."ESTADO_CARTA",	"CLIENTE"."TIPO_VIA",	"CONTRATO"."FECHA"
									INTO 		:ls_sexo,				:ll_rut,				:ls_dv,				:ls_nom,					:ls_ap_pat,					:ls_ap_mat,					:ls_nro_sepultura,		:ls_sector,				:ls_area,				:ll_capacidad,				:ldt_fecha_promesa,	:ls_direccion_p,				:ls_nro_particular,					:ls_depto_particular,			:ls_block_particular,			:ls_comuna,						:ls_ciudad,						:ls_poblacion,				:ls_estado_civil,			:ll_total_pagado,				:ls_estado_cadena,	:ll_cod_parque,			:ll_rut_gerente_operaciones,	:ldt_fecha_mant,			:ls_tipo_via_titulo,			:ls_sector_p,			:ls_fono_p,				:ldt_fec_nac,				:ls_estado_civil,			:ls_domicilio_c,				:ls_fono_c,				:ll_total_renta,			:ll_grupo_f,			:ls_estado_cob,					:gdt_fec_sistema,	:ldt_fecha_recil,			:ll_mora_mant,					:ll_mora_cred,					:ls_celular,			:ls_cod_agente,		:ls_est_ctto,			:ls_estado_cod,				:ls_tipo_via,				:ldt_fecha_promesa
									FROM 		"CADENA",   "CIUDAD",   "CLIENTE",   "COMUNA",   "CONTRATO",   "GERENTE_OPERACIONES",	"TIPO_VIA",	"CADENA_MORA"  
									WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
											 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
											 ( "CONTRATO"."RUT" = "CLIENTE"."RUT" ) and  
											 ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and
											 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
											 ( "CLIENTE"."CIUDAD" = "CIUDAD"."CODIGO_CIUDAD" ) and  
											 ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
											 ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
											 ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
											 ( "CADENA"."CODIGO" = :ls_base ) AND  
											 ( "CADENA"."SERIE" = :ls_serie ) AND  
											 ( "CADENA"."NUMERO" = :ll_numero ) AND  
											 ( "GERENTE_OPERACIONES"."ESTADO" = 'A' )    
									USING		sqlca;
									if sqlca.sqlcode=0 then
										SELECT	COUNT("FALLECIDOS"."LLAVE")  
										INTO 		:ll_count_reg  
										FROM 		"FALLECIDOS"  
										WHERE  ( "FALLECIDOS"."BASE" = :ls_base ) AND  
												 ( "FALLECIDOS"."SS" = :ls_serie ) AND  
												 ( "FALLECIDOS"."CONTRATO" = :ll_numero )   AND
												( "FALLECIDOS"."ESTADO_REG" = 'A' ) 
										USING		sqlca;
										if ll_count_reg > 0 then
											ls_sepultado	= 'Si'
										else
											ls_sepultado	= 'No'
										end if
										SELECT	"AGENTES"."COD_SUP",	"SUPERVISOR"."COD_JEFE"  
										INTO		:ls_cod_sup,			:ls_cod_jefe  
										FROM 		"AGENTES",	"JEFE_VENTAS",	"SUPERVISOR"  
										WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
												 ( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
												 ( "AGENTES"."COD_AGE" = :ls_cod_agente )   ;
												 
										ls_obs		= 'Solicitud Titulo de Dominio Generarda el '+string(gdt_fec_sistema,'dd/mm/yyyy hh:mm')+' por el Usuario '+gs_user
										INSERT INTO "SOL_ESTATUS"  
													( "BASE",	"SERIE",		"NUMERO",	"CORRELATIVO",		"CODIGO_SOLICITUD",	"OBSERVACION",	"ESTADO_REG",	"RUT_CLIENTE" )  
										VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_correlativo,	'6',						:ls_obs,			'A',				:ll_rut )  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
											
											if isnull(ls_direccion_p) then ls_direccion_p=''
											if isnull(ls_poblacion) then ls_poblacion=''
											if isnull(ls_sector_p) then ls_sector_p='-'
											if isnull(ls_comuna) then ls_comuna='0'
											if isnull(ls_ciudad) then ls_ciudad='0'
											if isnull(ls_fono_p) then 
												ls_fono_p='-'
											end if
											if len(ls_fono_p) > 25 then
												ls_fono_p	= mid(ls_fono_p,1,25)
											end if
											if isnull(ls_estado_civil) then ls_estado_civil=''
											if isnull(ls_domicilio_c) then ls_domicilio_c=''
											if isnull(ls_fono_c) then 
												ls_fono_c=''
											end if
											if len(ls_fono_c) > 25 then
												ls_fono_c	= mid(ls_fono_c,1,25)
											end if
											if isnull(ll_total_renta) then ll_total_renta=0
											if isnull(ll_grupo_f) then ll_grupo_f=0
											if isnull(ls_estado_cob) then ls_estado_cob=''
											if isnull(ll_mora_mant) then ll_mora_mant=0
											if isnull(ll_mora_cred) then ll_mora_cred=0
											if isnull(ls_celular) then ls_celular=''
											if isnull(ls_area) then ls_area=''
											if isnull(ls_sector) then ls_sector=''
											if isnull(ls_nro_sepultura) then ls_nro_sepultura=''
											if isnull(ls_sepultado) then ls_sepultado=''
											if isnull(ll_capacidad) then ll_capacidad=0
											if isnull(ls_cod_agente) then ls_cod_agente=''
											if isnull(ls_cod_sup) then ls_cod_sup=''
											if isnull(ls_nom) then ls_nom=''
											if isnull(ls_ap_pat) then ls_ap_pat=''
											if isnull(ls_ap_mat) then ls_ap_mat=''
											if isnull(ls_direccion_p) then ls_direccion_p=''
											if isnull(ls_poblacion) then ls_poblacion=''
											if isnull(ls_sector_p) then ls_sector_p=''
											if isnull(ls_comuna) then ls_comuna='0'
											if isnull(ls_ciudad) then ls_ciudad='0'
											if isnull(ls_fono_p) then ls_fono_p=''
											if isnull(ls_domicilio_c) then ls_domicilio_c=''
											if isnull(ls_fono_c) then ls_fono_c=''
											if isnull(ll_total_renta) then ll_total_renta=0
											if isnull(ll_grupo_f) then ll_grupo_f=0
											if isnull(ls_estado_cod) then ls_estado_cod=''
											if isnull(ls_tipo_via) then ls_tipo_via='0'
											if isnull(ls_nro_particular) then ls_nro_particular='-'
											if isnull(ls_depto_particular) then ls_depto_particular=''
											if isnull(ls_block_particular) then ls_block_particular=''
											
											INSERT INTO "SOL_TIT_DOMINIO"  
														( "BASE",	"SERIE",		"NUMERO",	"CORRELATIVO",		"RUT_TITULAR",	"DIRECCION_P",		"POBLACION",	"SECTOR",		"COMUNA",	"CIUDAD",	"FONO_P",	"FECHA_NAC",	"ESTADO_CIVIL",	"DOMICILIO_C",		"FONO_C",	"TOTAL_RENTA",		"GRUPO_F",		"ESTADO_COB",		"FECHA_ACTUAL",	"FECHA_RESCIL",	"MORA_MANT",	"MORA_CREDITO",	"CELULAR",		"OTRO_FONO_P",		"OTRO_FONO_C",		"AREA_SEPULTURA",	"SECTOR_SEPULTURA",	"SEPULTURA",			"SEPULTADO",	"CAPACIDAD",	"CTTO_DEFINITIVO",	"TITULO_DOMINIO",		"NOTA",	"PRIORIDAD",	"EST_CARTA_SIMPLE",		"EST_CARTA_NOTARIAL",	"EST_FOTOCOPIA_CARNE",		"EST_POS_EFECTIVA",		"EST_OTRO_1",	"CUAL_OBS_1",	"EST_SIN_ANTECE",		"COD_AGENTE",		"COD_SUPER",	"USUARIO",				"ESTATUS_OPERACIONES",	"ESTATUS_INFORMATICA",	"DV",		"NOMBRE",	"AP_PATERNO",	"AP_MATERNO",	"MOD_ANT_CLIENTE",	"USUARIO_OPERA",	"FECHA_OPERA",		"USUARIO_INFOR",	"FECHA_INFOR",		"DIRECCION_P_ORIGINAL",	"POBLACION_ORIGINAL",	"SECTOR_ORIGINAL",	"COMUNA_ORIGINAL",	"CIUDAD_ORIGINAL",	"FONO_P_ORIGINAL",	"FECHA_NAC_ORIGINAL",	"ESTADO_CIVIL_ORIGINAL",	"DOMICILIO_C_ORIGINAL",	"FONO_C_ORIGINAL",	"TOTAL_RENTA_ORIGINAL",	"GRUPO_F_ORIGINAL",	"ESTADO_COD_ORIGINAL",	"ESTADO_CTTO_ORIGINAL",	"FECHA_RESCIL_ORIGINAL",	"TIPO_VIA",		"NUMERO_PARTICULAR",	"DEPTO_PARTICULAR",		"BLOCK_PARTICULAR",		"TIPO_VIA_ORIGINAL",	"NUMERO_PARTICULAR_ORIGINAL",	"DEPTO_PARTICULAR_ORIGINAL",	"BLOCK_PARTICULAR_ORIGINAL" )
											VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_correlativo,	:ll_rut,			:ls_direccion_p,	:ls_poblacion,	:ls_sector_p,	:ls_comuna,	:ls_ciudad,	:ls_fono_p,	:ldt_fec_nac,	:ls_estado_civil,	:ls_domicilio_c,	:ls_fono_c,	:ll_total_renta,	:ll_grupo_f,	:ls_estado_cob,	:ldt_fecha_hoy,	:ldt_fecha_recil,	:ll_mora_mant,	:ll_mora_cred,		:ls_celular,	'-',					'-',					:ls_area,			:ls_sector,				:ls_nro_sepultura,	:ls_sepultado,	:ll_capacidad,	0,							'P',						:ls_obs,	'N',				1,								1,								1,									1,								1,					null,				1,							:ls_cod_agente,	:ls_cod_sup,	:gs_nombre_usuario,	0,								0,								:ls_dv,	:ls_nom,		:ls_ap_pat,		:ls_ap_mat,		'N',						:gs_user,			:ldt_fecha_hoy,	:gs_user,			:ldt_fecha_hoy,	:ls_direccion_p,			:ls_poblacion,				:ls_sector_p,			:ls_comuna,				:ls_ciudad,				:ls_fono_p,				:ldt_fec_nac,				:ls_estado_civil,				:ls_domicilio_c,			:ls_fono_c,				:ll_total_renta,			:ll_grupo_f,			:ls_estado_cod,			:ls_est_ctto,				:ldt_fecha_recil,				:ls_tipo_via,	:ls_nro_particular,	:ls_depto_particular,	:ls_block_particular,	:ls_tipo_via,			:ls_nro_particular,				:ls_depto_particular,			:ls_block_particular    )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
												messagebox("Error Grabar","Error al Grabar SOL_TIT_DOMINIO SQL: "+sqlca.sqlerrtext)
											end if
										else
											rollback;
											messagebox("Error Grabar","Error al Grabar SOL_ESTATUS SQL: "+sqlca.sqlerrtext)
										end if
										if ls_sexo='M' then
											ls_trato						= 'Don'
										elseif ls_sexo='F' then
											ls_trato						= 'Doña'
										end if
										SELECT	MAX("PROCESO_TITULO_ISACRUZ"."CORRELATIVO")  
										INTO 		:ll_corr
										FROM 		"PROCESO_TITULO_ISACRUZ"  
										USING		sqlca;
										if ll_corr=0 OR isnull(ll_corr) then
											ll_corr 			= 1
										else
											ll_corr	++
										end if
										ls_nombre_cliente				= ls_nom+ ' ' +ls_ap_pat+ ' '+ls_ap_mat
										ls_tipo_construccion			= 'T'
										ls_total_pagado_palabras	= sle_1.uo_convertir_numero(string(ll_total_pagado))
										ls_fecha_promesa_palabas	= wf_fecha_palabra(date(ldt_fecha_promesa))
										
										INSERT INTO	  "PROCESO_TITULO_ISACRUZ"  
														( "CORRELATIVO",	"NRO_LIBRO",	"FOJA",		"ROLA",	"TRATO",		"RUT",	"DV",		"NOMBRE_CLIENTE",		"NRO_SEPULTURA",		"SECTOR",	"AREA",		"CAPACIDAD",	"TIPO_CONSTRUCCION",		"BASE",		"SERIE",		"NUMERO",	"FECHA_PROMESA",		"DIRECCION_P",		"NRO_PARTICULAR",		"DEPTO_PARTICULAR",		"BLOCK_PARTICULAR",		"COMUNA",	"CIUDAD",	"POBLACION",	"ESTADO_OBS",		"ESTADO_CIVIL",	"USUARIO",	"TOTAL_PAGADO",	"TOTAL_PAGADO_PALABRAS",	"ESTADO_CONTRATO",	"COD_PARQUE",		"FECHA_PROMESA_PALABRAS",	"RUT_GERENTE_OPERACIONES",		"FECHA_MANT",		"TIPO_VIA"	 ) 
										VALUES 		( :ll_corr,			0,					0,				0,			:ls_trato,	:ll_rut,	:ls_dv,	:ls_nombre_cliente,	:ls_nro_sepultura,	:ls_sector,	:ls_area,	:ll_capacidad,	:ls_tipo_construccion,	:ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha_promesa,	:ls_direccion_p,	:ls_nro_particular,	:ls_depto_particular,	:ls_block_particular,	:ls_comuna,	:ls_ciudad,	:ls_poblacion,	:ls_estado_obs,	:ls_estado_civil,	:gs_user,	:ll_total_pagado,	:ls_total_pagado_palabras,	:ls_estado_contrato,	:ll_cod_parque,	:ls_fecha_promesa_palabas,	:ll_rut_gerente_operaciones,	:ldt_fecha_mant,	:ls_tipo_via_titulo)  
										USING			sqlca;
										if sqlca.sqlcode=0 then
											commit;
											SELECT	COUNT("COPROP_ISACRUZ"."BASE")  
											INTO 		:ll_count_coprop  
											FROM 		"COPROP_ISACRUZ"  
											WHERE  ( "COPROP_ISACRUZ"."BASE" = :ls_base ) AND  
													 ( "COPROP_ISACRUZ"."SERIE" = :ls_serie ) AND  
													 ( "COPROP_ISACRUZ"."NUMERO" = :ll_numero )   
											USING		sqlca;
											if ll_count_coprop=0 or isnull(ll_count_coprop) then
												SELECT	MAX("COPROP_ISACRUZ"."LINEA")
												INTO 		:ll_linea  
												FROM 		"COPROP_ISACRUZ"  ;
												if ll_linea=0 or isnull(ll_linea) then
													ll_linea	= 1
												else
													ll_linea ++
												end if
												INSERT INTO "COPROP_ISACRUZ"  
															( "SERIE",		"NUMERO",	"LINEA",		"RUT",	"DV",		"NOMBRES",	"APATERNO",	"AMATERNO",	"BASE",		"ESTADO_HEREDERO" )  
												VALUES 	( :ls_serie,	:ll_numero,	:ll_linea,	:ll_rut,	:ls_dv,	:ls_nom,		:ls_ap_pat,	:ls_ap_mat,	:ls_base,	'N' )  
												USING	sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
													messagebox("Error Grabar","Error al Grabar COPROP_ISACRUZ SQL: "+sqlca.sqlerrtext)
												end if 
											end if
										else
											rollback;
											messagebox("Error Grabar","Error al Grabar PROCESO_TITULO_ISACRUZ SQL: "+sqlca.sqlerrtext)
										end if
									end if
								end if
								UPDATE	"CLIENTE"  
								SET 		"ESTADO_COBRANZA" = '0'  
								WHERE 	"CLIENTE"."RUT" = :ll_rut   
								USING		sqlca  ;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							else
								rollback;
							end if
							ll_count_ok ++
						end if
					else
						ll_count_malos ++
					end if
				end if
			next
		
			ll_marcados		= dw_lista.getitemnumber(1,'c_sumar_marcados')
			if ll_count_ok = ll_marcados then
				messagebox("Grabar","Grabación Exitosa")
			elseif ll_count_malos = ll_marcados then
				messagebox("Grabar","No es Posible Generar Solicitud Titulo de Dominio por Tener VIGENTES")
			elseif ll_count_malos > 0 and ll_count_ok > 0 then
				messagebox("Grabar","Solicitud Titulo de Dominio Generadas Correctamente "+string(ll_count_ok,'###,###,###,##0')+", No Generada(s) por Tener Vigentes "+string(ll_count_malos,'###,###,###,##0'))
			end if
			ll_tot_reg		= dw_lista.retrieve()
			if ll_tot_reg > 0 then
				for ll_indi = 1 to ll_tot_reg
					dw_lista.setitem(ll_indi,'c_estado_reg',1)
				next
				dw_lista.accepttext()
			else
				messagebox("Advertencia","No Registra Dato")
			end if
		end if
	else
		messagebox("Advertencia","Debe Seleccionar por lo menos UN Registro")
	end if
end if
end event

type cb_cerrar from commandbutton within w_generar_sol_titulo_dominio_retiro
integer x = 3195
integer y = 1840
integer width = 338
integer height = 112
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_generar_sol_titulo_dominio_retiro)
end event

type dw_lista from datawindow within w_generar_sol_titulo_dominio_retiro
integer x = 32
integer y = 40
integer width = 3502
integer height = 1752
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_estado_titulo_dominio_retiro"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna
Long		ll_tot_reg,ll_indi

ls_columna	= dwo.name
if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
else
	if ls_columna='t_marcar_todo' then
		ll_tot_reg	= dw_lista.rowcount()
		if ll_tot_reg > 0 then
			if dw_lista.object.t_marcar_todo.text = 'Marcar Todo' then
				for ll_indi = 1 to ll_tot_reg
					dw_lista.setitem(ll_indi,'c_estado_reg',0)
				next
				dw_lista.object.t_marcar_todo.text	= 'Desmarcar Todo'
			elseif dw_lista.object.t_marcar_todo.text = 'Desmarcar Todo' then
				for ll_indi = 1 to ll_tot_reg
					dw_lista.setitem(ll_indi,'c_estado_reg',1)
				next
				dw_lista.object.t_marcar_todo.text	= 'Marcar Todo'
			end if
			dw_lista.accepttext()
		end if
	end if
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type gb_1 from groupbox within w_generar_sol_titulo_dominio_retiro
integer x = 1582
integer y = 1796
integer width = 1106
integer height = 176
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

