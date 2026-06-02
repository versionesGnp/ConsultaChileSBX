forward
global type w_comision_ejecutivo_terreno_asig from window
end type
type dw_1 from datawindow within w_comision_ejecutivo_terreno_asig
end type
type cb_criterio_cob from commandbutton within w_comision_ejecutivo_terreno_asig
end type
type cb_asocia_rut from commandbutton within w_comision_ejecutivo_terreno_asig
end type
type dw_tipo_gestion from datawindow within w_comision_ejecutivo_terreno_asig
end type
type st_exportar from statictext within w_comision_ejecutivo_terreno_asig
end type
type pb_exportar from picturebutton within w_comision_ejecutivo_terreno_asig
end type
type st_filtrar from statictext within w_comision_ejecutivo_terreno_asig
end type
type pb_filtrar from picturebutton within w_comision_ejecutivo_terreno_asig
end type
type rb_admist from radiobutton within w_comision_ejecutivo_terreno_asig
end type
type cb_modif_pago from commandbutton within w_comision_ejecutivo_terreno_asig
end type
type cb_actualiza from commandbutton within w_comision_ejecutivo_terreno_asig
end type
type hpb_1 from hprogressbar within w_comision_ejecutivo_terreno_asig
end type
type dw_ejecutivo from datawindow within w_comision_ejecutivo_terreno_asig
end type
type em_ctto from editmask within w_comision_ejecutivo_terreno_asig
end type
type pb_buscar from picturebutton within w_comision_ejecutivo_terreno_asig
end type
type st_promesa from statictext within w_comision_ejecutivo_terreno_asig
end type
type cb_pagos from commandbutton within w_comision_ejecutivo_terreno_asig
end type
type cb_resumen_comi from commandbutton within w_comision_ejecutivo_terreno_asig
end type
type usuario_t from statictext within w_comision_ejecutivo_terreno_asig
end type
type st_usuario from statictext within w_comision_ejecutivo_terreno_asig
end type
type cb_grabar from commandbutton within w_comision_ejecutivo_terreno_asig
end type
type cb_cta_cte from commandbutton within w_comision_ejecutivo_terreno_asig
end type
type pb_aceptar from picturebutton within w_comision_ejecutivo_terreno_asig
end type
type p_termino from picture within w_comision_ejecutivo_terreno_asig
end type
type em_termino from editmask within w_comision_ejecutivo_terreno_asig
end type
type cb_cerrar from commandbutton within w_comision_ejecutivo_terreno_asig
end type
type gb_periodo from groupbox within w_comision_ejecutivo_terreno_asig
end type
type st_porc from statictext within w_comision_ejecutivo_terreno_asig
end type
type st_fondo from statictext within w_comision_ejecutivo_terreno_asig
end type
type gb_1 from groupbox within w_comision_ejecutivo_terreno_asig
end type
type st_cobranza from statictext within w_comision_ejecutivo_terreno_asig
end type
type st_imprimir from statictext within w_comision_ejecutivo_terreno_asig
end type
type st_ordenar from statictext within w_comision_ejecutivo_terreno_asig
end type
type pb_ordenar from picturebutton within w_comision_ejecutivo_terreno_asig
end type
type pb_imprimir from picturebutton within w_comision_ejecutivo_terreno_asig
end type
type cb_cobranza from picturebutton within w_comision_ejecutivo_terreno_asig
end type
type gb_2 from groupbox within w_comision_ejecutivo_terreno_asig
end type
type gb_3 from groupbox within w_comision_ejecutivo_terreno_asig
end type
type dw_comision from datawindow within w_comision_ejecutivo_terreno_asig
end type
end forward

global type w_comision_ejecutivo_terreno_asig from window
integer width = 4037
integer height = 2168
boolean titlebar = true
string title = "Comisiones Ventas Asignadas Ejecutivo Terreno"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_1 dw_1
cb_criterio_cob cb_criterio_cob
cb_asocia_rut cb_asocia_rut
dw_tipo_gestion dw_tipo_gestion
st_exportar st_exportar
pb_exportar pb_exportar
st_filtrar st_filtrar
pb_filtrar pb_filtrar
rb_admist rb_admist
cb_modif_pago cb_modif_pago
cb_actualiza cb_actualiza
hpb_1 hpb_1
dw_ejecutivo dw_ejecutivo
em_ctto em_ctto
pb_buscar pb_buscar
st_promesa st_promesa
cb_pagos cb_pagos
cb_resumen_comi cb_resumen_comi
usuario_t usuario_t
st_usuario st_usuario
cb_grabar cb_grabar
cb_cta_cte cb_cta_cte
pb_aceptar pb_aceptar
p_termino p_termino
em_termino em_termino
cb_cerrar cb_cerrar
gb_periodo gb_periodo
st_porc st_porc
st_fondo st_fondo
gb_1 gb_1
st_cobranza st_cobranza
st_imprimir st_imprimir
st_ordenar st_ordenar
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
cb_cobranza cb_cobranza
gb_2 gb_2
gb_3 gb_3
dw_comision dw_comision
end type
global w_comision_ejecutivo_terreno_asig w_comision_ejecutivo_terreno_asig

type variables
long 		il_row
string		is_actualiz='N',is_cod_con01,is_cod_con02,is_grupo_cob
datetime	idt_fec_ini,idt_fec_fin
datawindowchild	idw_detalle5,idw_detalle6
end variables

forward prototypes
public subroutine wf_cargar_resto ()
public subroutine wf_actualizar ()
public function double wf_pago_comi (long al_cod_pago, string as_tipo_cob, double adb_valor_uf)
public function double wf_mto_min (string as_tipo_cobr)
public subroutine wf_fechas (string as_tipo_cobranza, datetime adt_fec_fin)
end prototypes

public subroutine wf_cargar_resto ();
end subroutine

public subroutine wf_actualizar ();
end subroutine

public function double wf_pago_comi (long al_cod_pago, string as_tipo_cob, double adb_valor_uf);string		ls_moneda
double	ldb_comis

//wf_pago_comi(al_cod_pago,as_tipo_cob,as_valor_uf)


SELECT	"AT_COMIS_PREMIO"."VALOR","AT_COMIS_PREMIO"."MONEDA"  
INTO		:ldb_comis,	:ls_moneda
FROM 	"AT_COMIS_PREMIO"  
WHERE	"AT_COMIS_PREMIO"."COD_PAGO" = :al_cod_pago AND  
			"AT_COMIS_PREMIO"."ESTADO" = 'V' AND  
			"AT_COMIS_PREMIO"."TIPO_GESTION" =:as_tipo_cob
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_comis) and ldb_comis>0 and not isnull(ls_moneda) and ls_moneda<>'' then
		if al_cod_pago=4 then
			ldb_comis								= ldb_comis
		else
			if ls_moneda='1' then
				ldb_comis							= ldb_comis
			elseif ls_moneda='2' then
				ldb_comis							= ldb_comis * adb_valor_uf
			end if
		end if
	end if
end if
if isnull(ldb_comis) then ldb_comis=0
return ldb_comis
end function

public function double wf_mto_min (string as_tipo_cobr);double	ldb_mto_min

//wf_mto_min(as_tipo_cobr)
SELECT	"MONTO_MIN"
INTO		:ldb_mto_min
FROM 	"AT_MONTO_MIN_COBRANZA"  
WHERE	"AT_MONTO_MIN_COBRANZA"."TIPO_COBRANZA" = :as_tipo_cobr AND  
			"AT_MONTO_MIN_COBRANZA"."ESTADO" = 'V'
USING	sqlca;
if isnull(ldb_mto_min) then ldb_mto_min=0
return ldb_mto_min
end function

public subroutine wf_fechas (string as_tipo_cobranza, datetime adt_fec_fin);long		ll_mes,ll_ano,ll_cta,ll_existe
datetime	ldt_fec_comi,ldt_fec_ini,ldt_fec_ant,ldt_fec_fin

//wf_fechas(as_tipo_cobranza,adt_fec_fin)

if not isnull(as_tipo_cobranza) and as_tipo_cobranza<>'' then
	SELECT MAX("RES_COMI"."FECHA")
	INTO		:ldt_fec_comi
	FROM		"RES_COMI"  
	WHERE	("RES_COMI"."COD_CONTABLE" = :is_cod_con01 or "RES_COMI"."COD_CONTABLE" = :is_cod_con02)
	USING	sqlca;
	
	SELECT MAX("RES_COMI"."FECHA")
	INTO		:ldt_fec_ant
	FROM		"RES_COMI"  
	WHERE	("RES_COMI"."COD_CONTABLE" = :is_cod_con01 or "RES_COMI"."COD_CONTABLE" = :is_cod_con02) and
				"RES_COMI"."FECHA" < :adt_fec_fin
	USING	sqlca;
	ldt_fec_ini									= datetime((RelativeDate(date(ldt_fec_ant), + 1)),time('00:00:00'))
	
	if adt_fec_fin <= ldt_fec_comi then
		SELECT count("RES_COMI"."SERIE")
		INTO		:ll_existe
		FROM		"RES_COMI"  
		WHERE	("RES_COMI"."COD_CONTABLE" = :is_cod_con01 or "RES_COMI"."COD_CONTABLE" = :is_cod_con02) AND
					"RES_COMI"."FECHA" = :adt_fec_fin
		USING	sqlca;
		if isnull(ll_existe) then ll_existe=0
		if ll_existe=0 then
			if as_tipo_cobranza='N' then
				cb_criterio_cob.enabled					= false
				messagebox("Advertencia","No Existe Proceso Bono Colación con Fecha :"+string(adt_fec_fin,'dd/mm/yyyy'))
			else
				cb_criterio_cob.enabled					= true
				messagebox("Advertencia","No Existe Proceso Comisión con Fecha :"+string(adt_fec_fin,'dd/mm/yyyy'))
			end if
			ll_mes											= month(date(adt_fec_fin))
			ll_ano												= year(date(adt_fec_fin))
			if as_tipo_cobranza='N' then
				ldt_fec_fin									= datetime(date(string('24/'+string(ll_mes,'00')+'/'+string(ll_ano,'0000'))),time('00:00:00'))
			else
				ldt_fec_fin									= f_fecha_fin(ll_mes,ll_ano)
			end if
			adt_fec_fin										= ldt_fec_fin
		end if
	else
		ll_mes												= month(date(ldt_fec_comi))
		ll_ano													= year(date(ldt_fec_comi))
		if ll_mes=12 then
			ll_mes			 								= ll_mes - 11
			ll_ano				 								= ll_ano + 1
		else
			ll_mes			 								= ll_mes + 1
			ll_ano				 								= ll_ano
		end if
		if as_tipo_cobranza='N' then
			ldt_fec_fin										= datetime(date(string('24/'+string(ll_mes,'00')+'/'+string(ll_ano,'0000'))),time('00:00:00'))
		else
			ldt_fec_fin										= f_fecha_fin(ll_mes,ll_ano)
		end if
		if ldt_fec_fin<>adt_fec_fin then
			if as_tipo_cobranza='N' then
				messagebox("Advertencia","Proceso Bono Colación Debe Ser Creado con Fecha :"+string(ldt_fec_fin,'dd/mm/yyyy'))
			else
				messagebox("Advertencia","Proceso Comisión Debe Ser Creado con Fecha :"+string(ldt_fec_fin,'dd/mm/yyyy'))
			end if
			adt_fec_fin										= ldt_fec_fin
		end if
	end if
	em_termino.text										= string(adt_fec_fin,'dd/mm/yyyy')
end if

idt_fec_ini													= ldt_fec_ini
idt_fec_fin													= adt_fec_fin


SELECT	COUNT("AT_GESTION"."BASE" )
INTO		:ll_cta
FROM 	"AT_GESTION","RES_COMI"  
WHERE	"AT_GESTION"."BASE" = "RES_COMI"."BASE" and  
     		"AT_GESTION"."SERIE" = "RES_COMI"."SERIE" and  
         	"AT_GESTION"."NUMERO" = "RES_COMI"."CONTRATO" and  
         	"AT_GESTION"."FEC_FIN" = "RES_COMI"."FECHA" and
			"AT_GESTION"."ESTADO_COMI" <> 'P' AND 
			"RES_COMI"."CODIGO_COM" = 'P' AND 
         	"AT_GESTION"."TIPO_COBRANZA" = :as_tipo_cobranza AND  
         	( "RES_COMI"."COD_CONTABLE" = :is_cod_con01 or "RES_COMI"."COD_CONTABLE" = :is_cod_con02 ) AND  
         	"RES_COMI"."FECHA" = :adt_fec_fin
USING	sqlca;
if isnull(ll_cta) then ll_cta=0
if ll_cta>0 then
	cb_actualiza.enabled									= true
else
	cb_actualiza.enabled									= true
end if
			
end subroutine

on w_comision_ejecutivo_terreno_asig.create
this.dw_1=create dw_1
this.cb_criterio_cob=create cb_criterio_cob
this.cb_asocia_rut=create cb_asocia_rut
this.dw_tipo_gestion=create dw_tipo_gestion
this.st_exportar=create st_exportar
this.pb_exportar=create pb_exportar
this.st_filtrar=create st_filtrar
this.pb_filtrar=create pb_filtrar
this.rb_admist=create rb_admist
this.cb_modif_pago=create cb_modif_pago
this.cb_actualiza=create cb_actualiza
this.hpb_1=create hpb_1
this.dw_ejecutivo=create dw_ejecutivo
this.em_ctto=create em_ctto
this.pb_buscar=create pb_buscar
this.st_promesa=create st_promesa
this.cb_pagos=create cb_pagos
this.cb_resumen_comi=create cb_resumen_comi
this.usuario_t=create usuario_t
this.st_usuario=create st_usuario
this.cb_grabar=create cb_grabar
this.cb_cta_cte=create cb_cta_cte
this.pb_aceptar=create pb_aceptar
this.p_termino=create p_termino
this.em_termino=create em_termino
this.cb_cerrar=create cb_cerrar
this.gb_periodo=create gb_periodo
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.gb_1=create gb_1
this.st_cobranza=create st_cobranza
this.st_imprimir=create st_imprimir
this.st_ordenar=create st_ordenar
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.cb_cobranza=create cb_cobranza
this.gb_2=create gb_2
this.gb_3=create gb_3
this.dw_comision=create dw_comision
this.Control[]={this.dw_1,&
this.cb_criterio_cob,&
this.cb_asocia_rut,&
this.dw_tipo_gestion,&
this.st_exportar,&
this.pb_exportar,&
this.st_filtrar,&
this.pb_filtrar,&
this.rb_admist,&
this.cb_modif_pago,&
this.cb_actualiza,&
this.hpb_1,&
this.dw_ejecutivo,&
this.em_ctto,&
this.pb_buscar,&
this.st_promesa,&
this.cb_pagos,&
this.cb_resumen_comi,&
this.usuario_t,&
this.st_usuario,&
this.cb_grabar,&
this.cb_cta_cte,&
this.pb_aceptar,&
this.p_termino,&
this.em_termino,&
this.cb_cerrar,&
this.gb_periodo,&
this.st_porc,&
this.st_fondo,&
this.gb_1,&
this.st_cobranza,&
this.st_imprimir,&
this.st_ordenar,&
this.pb_ordenar,&
this.pb_imprimir,&
this.cb_cobranza,&
this.gb_2,&
this.gb_3,&
this.dw_comision}
end on

on w_comision_ejecutivo_terreno_asig.destroy
destroy(this.dw_1)
destroy(this.cb_criterio_cob)
destroy(this.cb_asocia_rut)
destroy(this.dw_tipo_gestion)
destroy(this.st_exportar)
destroy(this.pb_exportar)
destroy(this.st_filtrar)
destroy(this.pb_filtrar)
destroy(this.rb_admist)
destroy(this.cb_modif_pago)
destroy(this.cb_actualiza)
destroy(this.hpb_1)
destroy(this.dw_ejecutivo)
destroy(this.em_ctto)
destroy(this.pb_buscar)
destroy(this.st_promesa)
destroy(this.cb_pagos)
destroy(this.cb_resumen_comi)
destroy(this.usuario_t)
destroy(this.st_usuario)
destroy(this.cb_grabar)
destroy(this.cb_cta_cte)
destroy(this.pb_aceptar)
destroy(this.p_termino)
destroy(this.em_termino)
destroy(this.cb_cerrar)
destroy(this.gb_periodo)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.gb_1)
destroy(this.st_cobranza)
destroy(this.st_imprimir)
destroy(this.st_ordenar)
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.cb_cobranza)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.dw_comision)
end on

event open;string		ls_cod_cont,ls_tipo_usuario
long		ll_mes,ll_ano,ll_new
datetime	ldt_fec_comi

connect using Trans_1;
gf_centrar(w_comision_ejecutivo_terreno_asig)

if gs_depto='E' then
	ls_cod_cont												= '007'
else
	ls_cod_cont												= '020'
end if
SELECT	"TIPO_COBRANZA_TERRENO"
INTO 		:gs_tipo_cob
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
USING	sqlca;    

if gs_tipo_cob='C' or gs_tipo_cob='M' or gs_tipo_cob='E' or gs_tipo_cob='J' then
	is_grupo_cob													= 'C'
elseif gs_tipo_cob='N' then
	is_grupo_cob													= 'N'
end if


if gs_tipo_cob = 'N' then
	is_cod_con01													= '020'
	is_cod_con02													= '020'
elseif gs_tipo_cob = 'M' then
	is_cod_con01													= '007'
	is_cod_con02													= 'P20'
elseif gs_tipo_cob = 'C' then
	is_cod_con01													= '007'
	is_cod_con02													= 'P21'	
elseif gs_tipo_cob = 'E' then
	is_cod_con01													= '007'
	is_cod_con02												= 'P22'		
end if


if (isnull(gs_tipo_cob) or gs_tipo_cob='' ) and gl_proceso>=5 then
	dw_tipo_gestion.dataobject									= 'dwe_tipo_gestion_ejec_todos'
	dw_tipo_gestion.settransobject(sqlca)
	dw_tipo_gestion.getchild('tipo_gestion',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	if idw_detalle5.retrieve()=0 then
		idw_detalle5.insertrow(0)
	end if
	dw_tipo_gestion.insertrow(0)


elseif (isnull(gs_tipo_cob) or gs_tipo_cob='' ) and  gl_proceso=4 then
	if  gs_depto= 'E' then
		is_grupo_cob												= 'C'
	elseif gs_depto= 'O' then
		is_grupo_cob												= 'N'
	end if
	dw_tipo_gestion.dataobject									= 'dwe_tipo_gestion_ejec'
	dw_tipo_gestion.settransobject(sqlca)
	dw_tipo_gestion.getchild('tipo_gestion',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	if idw_detalle5.retrieve(is_grupo_cob)=0 then
		idw_detalle5.insertrow(0)
	end if
	dw_tipo_gestion.insertrow(0)
else
	dw_tipo_gestion.dataobject									= 'dwe_tipo_gestion_ejec'
	dw_tipo_gestion.settransobject(sqlca)
	dw_tipo_gestion.getchild('tipo_gestion',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	if idw_detalle5.retrieve(is_grupo_cob)=0 then
		idw_detalle5.insertrow(0)
	end if
	dw_tipo_gestion.insertrow(0)
	dw_tipo_gestion.setitem(1,'tipo_gestion',gs_tipo_cob)
	dw_tipo_gestion.object.tipo_gestion.protect			= 1
	dw_tipo_gestion.accepttext()
end if


SELECT MAX("RES_COMI"."FECHA")
INTO		:ldt_fec_comi
FROM		"RES_COMI"  
WHERE	"RES_COMI"."COD_CONTABLE" = :ls_cod_cont
USING	sqlca;
if gl_proceso >= 4 then
	
	
	
	rb_admist.visible										= true
	ll_mes													= month(date(ldt_fec_comi))
	ll_ano														= year(date(ldt_fec_comi))
	if ll_mes = 12 then
		ll_mes			 									= ll_mes - 11
		ll_ano				 									= ll_ano + 1
	else
		ll_mes												= ll_mes + 1
		ll_ano													= ll_ano
	end if
	em_termino.text										= string(date(f_fecha_fin(ll_mes,ll_ano)),'dd/mm/yyyy')
	cb_resumen_comi.visible								= true
	cb_actualiza.visible									= true
elseif gl_proceso = 0 then
	em_termino.text										=  string(ldt_fec_comi,'dd/mm/yyyy')
	dw_comision.dataobject								= 'dw_comision_asignada_pagada_ind'
	dw_comision.settransobject(sqlca)
	
	dw_ejecutivo.dataobject								= 'dwe_ejecutivo'
	dw_ejecutivo.settransobject(sqlca)
	dw_ejecutivo.getchild('ejecutivo',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(gs_user)=0 then
		idw_detalle.insertrow(0)
	end if
	
	
	dw_ejecutivo.insertrow(0)
	dw_ejecutivo.setitem(1,'ejecutivo',gs_user)
	dw_ejecutivo.accepttext()
	dw_ejecutivo.Object.ejecutivo.Protect				= 1
	dw_ejecutivo.visible									= true
	pb_imprimir.enabled									= true
	cb_resumen_comi.enabled							= false
	cb_grabar.enabled										= false
	cb_modif_pago.enabled								= false
	rb_admist.visible										= false
	cb_criterio_cob.enabled								= false
else
	messagebox("Advertencia"," Usuario No Autorizado")
	close(w_comision_ejecutivo_terreno_asig)
end if
end event

event close;disconnect using Trans_1;
end event

type dw_1 from datawindow within w_comision_ejecutivo_terreno_asig
integer x = 4064
integer y = 640
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
string dataobject = "dw_resumen_cobranza"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_criterio_cob from commandbutton within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_dwnmousemove
integer x = 2080
integer y = 1788
integer width = 512
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modif.Criterio.Cob"
end type

event clicked;string	ls_base,ls_serie,ls_string,ls_tipo_cob
double	ldb_numero
datetime	ldt_fec_ini,ldt_fec_fin

if (dw_comision.dataobject='dw_lista_comi_ag_at_administ' or dw_comision.dataobject='dw_lista_comi_ag_at_cobranza' )and dw_comision.rowcount() > 0 then
	ls_tipo_cob						= dw_comision.getitemstring(il_row,'at_gestion_tipo_cobranza')
	ls_base							= dw_comision.getitemstring(il_row,'cadena_codigo')
	ls_serie							= dw_comision.getitemstring(il_row,'cadena_serie')
	ldb_numero						= dw_comision.getitemnumber(il_row,'cadena_numero')
	ldt_fec_ini						= dw_comision.getitemdatetime(il_row,'at_gestion_fec_ini')
	ldt_fec_fin						= datetime(date(em_termino.text),time('00:00:00'))
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
		ls_string						= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(il_row)+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')+'~t'+ls_tipo_cob
		if isvalid(w_criterio_cobranza) then close(w_criterio_cobranza)
		OpenWithParm (w_criterio_cobranza,ls_string)
	end if
else
	messagebox("Advertencia","Opción No Valida para Modificar Criterios Cobranza Terreno")
end if
end event

type cb_asocia_rut from commandbutton within w_comision_ejecutivo_terreno_asig
integer x = 416
integer y = 1788
integer width = 375
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&lación. * Rut"
end type

event clicked;dw_comision.accepttext()
if il_row>0 then
	if (dw_comision.dataobject='dw_comision_asignada_pagada' or dw_comision.dataobject='dw_comision_asignada_pagada_ind' or dw_comision.dataobject='dw_comision_asignada_pagada_indi' ) and dw_comision.rowcount() > 0 then
		gs_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
		gs_serie				= dw_comision.getitemstring(il_row,'oferta_v_serie')
		gi_numero			= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
		gi_rut					= dw_comision.getitemnumber(il_row,'cadena_rut')
	elseif (dw_comision.dataobject='dw_lista_comi_ag_at' or dw_comision.dataobject='dw_lista_comi_ag_at_administ' or dw_comision.dataobject='dw_lista_comi_ag_at_cobranza' or dw_comision.dataobject='dw_comision_asignada_pagada_cob' or dw_comision.dataobject='dw_comision_asignada_pagada_cob_indi' ) and dw_comision.rowcount() > 0 then
		gs_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
		gs_serie				= dw_comision.getitemstring(il_row,'cadena_serie')
		gi_numero			= dw_comision.getitemnumber(il_row,'cadena_numero')
		gi_rut					= dw_comision.getitemnumber(il_row,'cliente_rut')
	end if
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if


end event

type dw_tipo_gestion from datawindow within w_comision_ejecutivo_terreno_asig
integer x = 1737
integer y = 76
integer width = 695
integer height = 84
integer taborder = 30
string title = "none"
string dataobject = "dwe_tipo_gestion_ejec_todos"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string		ls_tipo_cob,ls_cod_contab1,ls_cod_contab2
long		ll_mes,ll_ano,ll_cta
datetime	ldt_fec_comi,ldt_fec_fin

dw_comision.reset()
dw_tipo_gestion.accepttext()

gs_tipo_cob										= dw_tipo_gestion.getitemstring(1,'tipo_gestion')
if gs_tipo_cob='C' or gs_tipo_cob='M' or gs_tipo_cob='E' or gs_tipo_cob='J' then
	is_grupo_cob								= 'C'
elseif gs_tipo_cob='N' then
	is_grupo_cob								= 'N'
end if


ldt_fec_fin										= datetime(date(em_termino.text),time('00:00:00'))

if gs_tipo_cob = 'N' then
	is_cod_con01								= '020'
	is_cod_con02								= '020'
elseif gs_tipo_cob = 'M' then
	is_cod_con01								= '007'
	is_cod_con02								= 'P20'
elseif gs_tipo_cob = 'C' then
	is_cod_con01								= '007'
	is_cod_con02								= 'P21'	
elseif gs_tipo_cob = 'E' then
	is_cod_con01								= '007'
	is_cod_con02								= 'P22'		
end if
wf_fechas(gs_tipo_cob,ldt_fec_fin)






end event

type st_exportar from statictext within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1001
integer y = 172
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Exportar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_cobranza.visible	= false
st_exportar.visible		= true
st_ordenar.visible		= false
st_filtrar.visible			= false
st_imprimir.visible		= false
end event

type pb_exportar from picturebutton within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_mousemove
integer x = 1001
integer y = 52
integer width = 151
integer height = 128
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_cobranza.visible	= false
st_exportar.visible		= true
st_ordenar.visible		= false
st_filtrar.visible			= false
st_imprimir.visible		= false
end event

event clicked;datawindow	dw_paso
dw_paso	= dw_comision
if dw_comision.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type st_filtrar from statictext within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1317
integer y = 172
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Filtrar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_cobranza.visible	= false
st_exportar.visible		= false
st_ordenar.visible		= false
st_filtrar.visible			= true
st_imprimir.visible		= false

end event

type pb_filtrar from picturebutton within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_mousemove
integer x = 1317
integer y = 52
integer width = 151
integer height = 128
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_cobranza.visible	= false
st_exportar.visible		= false
st_ordenar.visible		= false
st_filtrar.visible			= true
st_imprimir.visible		= false
end event

event clicked;string nulo
setnull (nulo)
dw_comision.SETfilter(NULO)
dw_comision.filter()

end event

type rb_admist from radiobutton within w_comision_ejecutivo_terreno_asig
boolean visible = false
integer x = 2510
integer y = 108
integer width = 640
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Administra Contratos"
end type

event clicked;string		ls_tipo_cobr,ls_tipo_gestion,ls_base,ls_serie,ls_pasa='S'
long		ll_tot_reg,ll_indi
double	ldb_numero,ldb_ing_caja,ldb_mto_min,ldb_tot_porc=0,ldb_tot_porc_aux=0	


dw_tipo_gestion.accepttext()
is_actualiz											= 'N' 
ls_tipo_cobr											= dw_tipo_gestion.getitemstring(1,'tipo_gestion')

if not isnull(ls_tipo_cobr) and ls_tipo_cobr<>'' then
	if ls_tipo_cobr='N' then
		ls_tipo_gestion								= 'N'
		cb_criterio_cob.enabled					= false
	else
		ls_tipo_gestion								= 'CM'
		cb_criterio_cob.enabled					= true
	end if
	dw_comision.dataobject						= 'dw_lista_comi_ag_at_administ'
	dw_comision.settransobject(sqlca)
	dw_comision.getchild('at_gestion_tipo_cobranza',idw_detalle6)
	idw_detalle6.settransobject(sqlca)
	if idw_detalle6.retrieve(ls_tipo_cobr)=0 then
		idw_detalle6.insertrow(0)
	end if
	
	cb_modif_pago.enabled						= true
	cb_grabar.enabled								= false
	pb_imprimir.enabled							= false
	cb_actualiza.enabled							= true
	ll_tot_reg										= dw_comision.retrieve(ls_tipo_cobr)
	if ll_tot_reg > 0 then
		SetPointer(HourGlass!)
		st_fondo.visible								= true
		hpb_1.visible 								= true
		st_porc.visible 								= true
		hpb_1.Position								= ldb_tot_porc
		if ls_tipo_cobr='C' or ls_tipo_cobr='M' or ls_tipo_cobr='E' then
			ldb_mto_min							= wf_mto_min(ls_tipo_cobr)
			for ll_indi=1 to ll_tot_reg
				ls_base								= dw_comision.getitemstring(ll_indi,'cadena_codigo')
				ls_serie								= dw_comision.getitemstring(ll_indi,'cadena_serie')
				ldb_numero							= dw_comision.getitemnumber(ll_indi,'cadena_numero')
				dw_comision.setitem(ll_indi,"mto_min",ldb_mto_min)
				dw_comision.accepttext()
				ldb_ing_caja						= f_ing_caja_cob_terreno(ls_base,ls_serie,ldb_numero,idt_fec_ini,idt_fec_fin,ls_tipo_cobr)
				if ldb_ing_caja<ldb_mto_min then
					ls_pasa							= 'N'	
				end if
				dw_comision.setitem(ll_indi,"at_gestion_fec_ini",idt_fec_ini)
				dw_comision.setitem(ll_indi,"at_gestion_fec_fin",idt_fec_fin)
				dw_comision.setitem(ll_indi,"at_gestion_monto",ldb_ing_caja)
				dw_comision.setitem(ll_indi,"pasa",ls_pasa)
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					st_porc.text						= string(ldb_tot_porc,'#0.##')+" %"
					ldb_tot_porc_aux				= ldb_tot_porc
				end if
				ldb_tot_porc							= (ll_indi / ll_tot_reg) * 100
				hpb_1.Position 						= ldb_tot_porc
				dw_comision.accepttext()
			next
		end if
		st_fondo.visible								= false
		hpb_1.visible 								= false
		st_porc.visible 								= false
		SetPointer(Arrow!)
	else
		messagebox("Advertencia","No Registra Datos")
	end if
else
	if isnull(ls_tipo_cobr) or ls_tipo_cobr='' then
		messagebox("Advertencia","Debe Seleccionar Tipo Gestión")
		dw_tipo_gestion.setfocus()
		dw_tipo_gestion.setcolumn('tipo_gestion')
	end if
end if
end event

type cb_modif_pago from commandbutton within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_dwnmousemove
integer x = 1559
integer y = 1788
integer width = 517
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modif.Pago.Comis."
end type

event clicked;string		ls_base,ls_serie,ls_string,ls_tipo_gestion,ls_pasa='S'
long		ll_cod_grupo,ll_res
double	ldb_numero,ldb_mto_min=0,ldb_monto
datetime	ldt_fec_ini,ldt_fec_fin

dw_comision.accepttext()
if il_row>0 then
	ls_tipo_gestion							= dw_tipo_gestion.getitemstring(1,'tipo_gestion')
	if not isnull(ls_tipo_gestion) and ls_tipo_gestion<>'' then
		if (dw_comision.dataobject='dw_lista_comi_ag_at' or  dw_comision.dataobject='dw_lista_comi_ag_at_administ' or  dw_comision.dataobject='dw_lista_comi_ag_at_cobranza') and dw_comision.rowcount() > 0 then
			ls_base							= dw_comision.getitemstring(il_row,'cadena_codigo')
			ls_serie							= dw_comision.getitemstring(il_row,'cadena_serie')
			ldb_numero						= dw_comision.getitemnumber(il_row,'cadena_numero')
			ll_cod_grupo					= dw_comision.getitemnumber(il_row,'at_gestion_codigo_grupo')
			if dw_comision.dataobject='dw_lista_comi_ag_at_administ' and dw_comision.rowcount() > 0 then
				if ls_tipo_gestion='C' or ls_tipo_gestion='M' or ls_tipo_gestion='E' then
					ls_pasa					= dw_comision.getitemstring(il_row,'pasa')
					ldb_monto				= dw_comision.getitemnumber(il_row,'at_gestion_monto')
					ldt_fec_ini				= dw_comision.getitemdatetime(il_row,'at_gestion_fec_ini')
					ldt_fec_fin				= dw_comision.getitemdatetime(il_row,'at_gestion_fec_fin')
					ldb_mto_min			= dw_comision.getitemnumber(il_row,'mto_min')
					ls_pasa					= 'S'
				end if
			end if
		end if
		if ls_pasa='S' then
			if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
				ls_string						= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(ll_cod_grupo)+'~t'+ls_tipo_gestion+'~t'+string(ldb_monto)+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')+'~t'+string(il_row)
				if isvalid(w_comision_ejec_terreno_asig_anular) then close(w_comision_ejec_terreno_asig_anular)
				OpenWithParm (w_comision_ejec_terreno_asig_anular,ls_string)
			end if
		end if
	else
		if isnull(ls_tipo_gestion) or ls_tipo_gestion='' then
			messagebox("Advertencia","Debe Seleccionar Tipo Gestión")
			dw_tipo_gestion.setfocus()
			dw_tipo_gestion.setcolumn('tipo_gestion')
		end if
		dw_tipo_gestion.accepttext()
	end if
end if
end event

type cb_actualiza from commandbutton within w_comision_ejecutivo_terreno_asig
boolean visible = false
integer x = 347
integer y = 1916
integer width = 311
integer height = 104
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;string		ls_serie,ls_cod_age,ls_estado_comi,ls_tipo_cob,ls_pasa='S',ls_base
long		ll_res,ll_tot_reg,ll_graba=0,ll_malos=0,ll_contr=0,ll_indi
datetime	ldt_fec_comi
double	ldb_contrato,ldb_tot_porc=0,ldb_tot_porc_aux=0

dw_tipo_gestion.accepttext()
dw_comision.accepttext()
ls_tipo_cob											= dw_tipo_gestion.getitemstring(1,'tipo_gestion')
ldt_fec_comi										= datetime(date(em_termino.text),time('00:00:00'))
if is_actualiz='N' then	
	messagebox("Advertencia","Lista No Valida para Generar Actualización")
else
	if isnull(ls_tipo_cob) or ls_tipo_cob='' then
		ls_pasa										= 'N'
		messagebox("Advertencia", "Debe Ingresar Tipo Gestión")
		dw_tipo_gestion.setfocus()
	elseif isnull(ldt_fec_comi) then
		ls_pasa										= 'N'
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre Proceso")
		em_termino.setfocus()
	end if
	if ls_pasa='S' then
		ll_tot_reg									= dw_comision.rowcount()
		if ll_tot_reg > 0 then
			setpointer(HourGlass!)
			ll_res										=  MessageBox("Advertencia", '¿ Desea Actualizar Bono Ejecutivo Terreno ?', Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				st_fondo.visible						= true
				hpb_1.visible 						= true
				st_porc.visible 						= true
				hpb_1.Position						= ldb_tot_porc
				for ll_indi=1 to ll_tot_reg
					if ls_tipo_cob='N' then
						ls_base						= dw_comision.getitemstring(ll_indi,'cadena_codigo')
						ls_serie						= dw_comision.getitemstring(ll_indi,'oferta_v_serie')
						ldb_contrato					= dw_comision.getitemnumber(ll_indi,'oferta_v_nro_oferta')
						ls_cod_age					= dw_comision.getitemstring(ll_indi,'agentes_cod_age')
						ls_estado_comi				= dw_comision.getitemstring(ll_indi,'res_comi_codigo_com')
					else
						ls_base						= dw_comision.getitemstring(ll_indi,'cadena_codigo')
						ls_serie						= dw_comision.getitemstring(ll_indi,'cadena_serie')
						ldb_contrato					= dw_comision.getitemnumber(ll_indi,'cadena_numero')
						ls_cod_age					= dw_comision.getitemstring(ll_indi,'agentes_cod_age')
						ls_estado_comi				= dw_comision.getitemstring(ll_indi,'res_comi_codigo_com')
					end if
					if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_contrato) and ldb_contrato>0 and not isnull(ls_cod_age) and ls_cod_age<>'' then
						UPDATE	"AT_GESTION"  
						SET		"ESTADO_COMI" = :ls_estado_comi  
						WHERE	( "AT_GESTION"."SERIE" = :ls_serie ) AND  
									( "AT_GESTION"."NUMERO" = :ldb_contrato ) and
									( "AT_GESTION"."TIPO_COBRANZA" = :ls_tipo_cob )
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit using sqlca;
							ll_graba++
						else
							rollback using sqlca;
							ll_malos++
						end if
						
						if ls_tipo_cob='C' or ls_tipo_cob='M' or ls_tipo_cob='E' then  
							UPDATE	"CADENA"  
							SET 		"DEPTO_COB_ASIG" = NULL  
							WHERE	( "CADENA"."CODIGO" = :ls_base ) AND  
										( "CADENA"."SERIE" = :ls_serie ) AND  
										( "CADENA"."NUMERO" = :ldb_contrato ) 
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
								ll_graba++
							else
								rollback;
							end if
						end if
						
						if ls_tipo_cob='N' then
							if ls_serie='L' then
								UPDATE	"ANEXO_LIBERADOR"  
								SET		"ESTADO_COMI_AT" = :ls_estado_comi  
								WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_contrato )
								USING	sqlca;
							elseif ls_serie='O' then
								UPDATE	"OFERTA_V"  
								SET		"ESTADO_COMI_AT" = :ls_estado_comi  
								WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ldb_contrato )
								USING	sqlca;
							elseif ls_serie='L' then
								UPDATE	"ANEXO_AUMENTO"  
								SET		"ESTADO_COMI_AT" = :ls_estado_comi  
								WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_contrato )
								USING	sqlca;
							end if
							if sqlca.sqlcode = 0 then
								commit using sqlca;
								ll_contr++
							else
								rollback using sqlca;
							end if
						end if
						if ldb_tot_porc <> ldb_tot_porc_aux then 
							st_porc.text								= string(ldb_tot_porc,'#0.##')+" %"
							ldb_tot_porc_aux						= ldb_tot_porc
						end if
						ldb_tot_porc									= (ll_graba / ll_tot_reg) * 100
						hpb_1.Position 								= ldb_tot_porc
						dw_comision.accepttext()
					end if
				next
				if ll_graba=ll_tot_reg and ll_tot_reg= ll_contr then
					messagebox("Grabar","Grabación Existosa")
				end if
				messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_graba,'###,###,##0')+' registros grabados con exito~r~n'+&
															'y '+string(ll_malos,'###,###,##0')+' registros con problemas.',information!)
				st_fondo.visible									= false
				hpb_1.visible 									= false
				st_porc.visible 									= false
			end if
		else
			messagebox("Advertencia","No Registra Datos para Actualizar")	
		end if
	end if
end if
end event

type hpb_1 from hprogressbar within w_comision_ejecutivo_terreno_asig
boolean visible = false
integer x = 1335
integer y = 916
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type dw_ejecutivo from datawindow within w_comision_ejecutivo_terreno_asig
boolean visible = false
integer x = 2469
integer y = 92
integer width = 1499
integer height = 100
integer taborder = 20
string title = "none"
string dataobject = "dwe_ejecutivo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_comision.reset()

end event

type em_ctto from editmask within w_comision_ejecutivo_terreno_asig
integer x = 3127
integer y = 1804
integer width = 489
integer height = 88
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

type pb_buscar from picturebutton within w_comision_ejecutivo_terreno_asig
integer x = 3625
integer y = 1804
integer width = 101
integer height = 88
integer taborder = 90
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

ldb_numero							= double(em_ctto.text)
ll_tot_reg							= dw_comision.rowcount()
if (dw_comision.dataobject='dw_comision_asignada_pagada' or dw_comision.dataobject='dw_comision_asignada_pagada_ind' or dw_comision.dataobject='dw_comision_asignada_pagada_indi' ) and dw_comision.rowcount() > 0 then
	ls_string							= "oferta_v_nro_oferta = "+string(ldb_numero)
elseif (dw_comision.dataobject='dw_lista_comi_ag_at' or dw_comision.dataobject='dw_lista_comi_ag_at_administ' or dw_comision.dataobject='dw_lista_comi_ag_at_cobranza' or dw_comision.dataobject='dw_comision_asignada_pagada_cob' or dw_comision.dataobject='dw_comision_asignada_pagada_cob_indi' ) and dw_comision.rowcount() > 0 then
	if st_promesa.text = 'Buscar Nº Promesa' then
		ls_string						= "cadena_numero = "+string(ldb_numero)
	elseif st_promesa.text = 'Buscar Rut Cliente' then
		ls_string						= "cliente_rut = "+string(ldb_numero)
	end if
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

type st_promesa from statictext within w_comision_ejecutivo_terreno_asig
integer x = 2661
integer y = 1804
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

type cb_pagos from commandbutton within w_comision_ejecutivo_terreno_asig
integer x = 795
integer y = 1788
integer width = 347
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

event clicked;string		ls_base,ls_serie,ls_string
double	ldb_numero

dw_comision.accepttext()
if il_row>0 then
	if (dw_comision.dataobject='dw_comision_asignada_pagada' or dw_comision.dataobject='dw_comision_asignada_pagada_ind' or dw_comision.dataobject='dw_comision_asignada_pagada_indi' ) and dw_comision.rowcount() > 0 then
		ls_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
		ls_serie				= dw_comision.getitemstring(il_row,'oferta_v_serie')
		ldb_numero			= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
	elseif (dw_comision.dataobject='dw_lista_comi_ag_at' or dw_comision.dataobject='dw_lista_comi_ag_at_administ' or dw_comision.dataobject='dw_lista_comi_ag_at_cobranza' or dw_comision.dataobject='dw_comision_asignada_pagada_cob' or dw_comision.dataobject='dw_comision_asignada_pagada_cob_indi' ) and dw_comision.rowcount() > 0 then
		ls_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
		ls_serie				= dw_comision.getitemstring(il_row,'cadena_serie')
		ldb_numero			= dw_comision.getitemnumber(il_row,'cadena_numero')
	end if
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
		ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
		if isvalid(w_rescomi_terreno) then close(w_rescomi_terreno)
		OpenWithParm (w_rescomi_terreno,ls_string)
	end if
end if
end event

type cb_resumen_comi from commandbutton within w_comision_ejecutivo_terreno_asig
integer x = 1147
integer y = 1788
integer width = 411
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Resumen.Comis."
end type

event clicked;string	ls_string,ls_tipo_comi,ls_tipo_cob
long		ll_cta
datetime	ldt_fecha_comi

ldt_fecha_comi				= datetime(date(em_termino.text),time('00:00:00'))
ls_tipo_comi					= 'A'
ls_tipo_cob					= dw_tipo_gestion.getitemstring(1,'tipo_gestion')
if isnull(ls_tipo_cob) or ls_tipo_cob='' then
	messagebox("Advertencia", "Debe Ingresar Tipo Gestión")
	dw_tipo_gestion.setfocus()
else
	if ls_tipo_cob='N' then
		SELECT	count("RES_COMI"."FECHA")  
		INTO 		:ll_cta	   
		FROM		"RES_COMI"  
		WHERE 	( "RES_COMI"."COD_CONTABLE" = '069' OR "RES_COMI"."COD_CONTABLE" = '071' OR "RES_COMI"."COD_CONTABLE" = '076' OR "RES_COMI"."COD_CONTABLE" = '020') AND  
					( "RES_COMI"."FECHA" = :ldt_fecha_comi )
		USING		sqlca;
	elseif ls_tipo_cob='M' then
		SELECT 	count("RES_COMI"."FECHA")  
		INTO 		:ll_cta	   
		FROM		"RES_COMI"  
		WHERE 	( "RES_COMI"."COD_CONTABLE" = 'P20' or  "RES_COMI"."COD_CONTABLE" = '007' ) AND  
					( "RES_COMI"."FECHA" = :ldt_fecha_comi )
		USING		sqlca;
	elseif ls_tipo_cob='C' then
		SELECT 	count("RES_COMI"."FECHA")  
		INTO 		:ll_cta	   
		FROM		"RES_COMI"  
		WHERE 	( "RES_COMI"."COD_CONTABLE" = 'P21' ) AND  
					( "RES_COMI"."FECHA" = :ldt_fecha_comi )
		USING		sqlca;	
	elseif ls_tipo_cob='E' then
		SELECT 	count("RES_COMI"."FECHA")  
		INTO 		:ll_cta	   
		FROM		"RES_COMI"  
		WHERE 	( "RES_COMI"."COD_CONTABLE" = 'P22' ) AND  
					( "RES_COMI"."FECHA" = :ldt_fecha_comi )
		USING		sqlca;		
	end if
	if not isnull(ll_cta) and ll_cta>0 then
		ls_string				= string(ldt_fecha_comi,'dd/mm/yyyy')+'~t'+ls_tipo_comi+'~t'+ls_tipo_cob
		OpenWithParm(w_comision_resumen_at, ls_string)
	else
		messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fecha_comi,"dd/mm/yyyy"))
	end if
end if
end event

type usuario_t from statictext within w_comision_ejecutivo_terreno_asig
boolean visible = false
integer x = 2967
integer y = 24
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

type st_usuario from statictext within w_comision_ejecutivo_terreno_asig
boolean visible = false
integer x = 3342
integer y = 24
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

type cb_grabar from commandbutton within w_comision_ejecutivo_terreno_asig
integer x = 50
integer y = 1916
integer width = 297
integer height = 104
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_cod,ls_serie,ls_base,ls_mon,ls_cod_com,ls_tipo_cob,ls_pasa='S'
long		ll_dia,ll_mes,ll_ano,ll_tot_reg,ll_res,ll_indi,ll_rut,ll_cod_parque,ll_malos=0,ll_cont=0,ll_ult_dia,ll_mes_ini
datetime	ldt_fec_comi,ldt_fec_res_comi,ldt_fec_ini
double	ldb_numero,ldb_valor_uf,ldb_precio,ldb_tot_pag,ldb_por_ing,ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_porc_comi,ldb_ingreso

dw_tipo_gestion.accepttext()
ls_tipo_cob												= dw_tipo_gestion.getitemstring(1,'tipo_gestion')
ldt_fec_comi											= datetime(date(em_termino.text),time('00:00:00'))
ll_dia														= day(date(ldt_fec_comi))
ll_mes													= month(date(ldt_fec_comi))
ll_ano														= year(date(ldt_fec_comi))

if isnull(ls_tipo_cob) or ls_tipo_cob='' then
	ls_pasa												= 'N'
	messagebox("Advertencia", "Debe Ingresar Tipo Gestión")
	dw_tipo_gestion.setfocus()
elseif isnull(ldt_fec_comi) then
	ls_pasa												= 'N'
	messagebox("Advertencia", "Debe Ingresar Fecha Cierre Proceso")
	em_termino.setfocus()
end if

if ls_pasa='S' then
	ll_ult_dia												= day(date( f_fecha_fin(ll_mes,ll_ano)))
	if ls_tipo_cob='N' and ll_dia<>24 then
		ls_pasa											= 'N'
		messagebox("Advertencia","No Puede Ejecutar el Proceso de Comisiones con Fecha :"+string(ldt_fec_comi,"dd/mm/yyyy"))
	elseif ls_tipo_cob<>'N' and ll_dia<>ll_ult_dia then
		ls_pasa											= 'N'
		messagebox("Advertencia","No Puede Ejecutar el Proceso de Comisiones con Fecha :"+string(ldt_fec_comi,"dd/mm/yyyy"))
	end if
	
	SELECT	"VALOR_UF"  
	INTO		:ldb_valor_uf  
	FROM		"TAB_UF"  
	WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_comi
	USING	sqlca;
	if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
		ls_pasa											= 'N'
		messagebox("Advertencia","No Existe Valor U.F. del :"+string(ldt_fec_comi,"dd/mm/yyyy"))
		em_termino.setfocus()
	end if
end if
if ls_pasa='S' then
	SELECT	MAX("FECHA")  
	INTO 		:ldt_fec_res_comi	   
	FROM		"RES_COMI"  
	WHERE 	("RES_COMI"."COD_CONTABLE" = :is_cod_con02)
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if ldt_fec_comi = ldt_fec_res_comi then
			messagebox("Advertencia","Proceso Comisiones del :"+string(ldt_fec_comi,"dd/mm/yyyy")+" Ya fue Grabado")
			ls_pasa										= 'N'
		end if
	end if
end if
if ls_pasa='S' then
	setpointer(HourGlass!)
	ll_tot_reg									= dw_comision.rowcount()
	if ll_tot_reg > 0 then
		if ls_tipo_cob = 'N' then
			ll_res									=  MessageBox("Advertencia", '¿ Desea Actualizar Bono Ejecutivo Terreno ?', Exclamation!, YesNo!, 2)
		else
			ll_res									=  MessageBox("Advertencia", '¿ Desea Comisión y Premios por Cobranza Ejecutivo Terreno ?', Exclamation!, YesNo!, 2)
		end if
		if ll_res = 1 then
			st_fondo.visible						= true
			hpb_1.visible 						= true
			st_porc.visible 						= true
			hpb_1.Position						= ldb_tot_porc
			for ll_indi = 1 to ll_tot_reg
				ls_cod							= dw_comision.getitemstring(ll_indi,'at_gestion_usuario_asignado')
				ll_rut								= dw_comision.getitemnumber(ll_indi,'agentes_rut')
				ls_base							= dw_comision.getitemstring(ll_indi,'cadena_codigo')
				ls_serie							= dw_comision.getitemstring(ll_indi,'cadena_serie')
				ldb_numero						= dw_comision.getitemnumber(ll_indi,'cadena_numero')
				ll_cod_parque					= dw_comision.getitemnumber(ll_indi,'cadena_cod_parque')
				ls_cod_com 						= 'P'
				if ls_tipo_cob = 'C' or ls_tipo_cob = 'M' or ls_tipo_cob = 'E' then
					ldb_ingreso					= dw_comision.getitemnumber(ll_indi,'at_gestion_monto')
				end if
				
				if ls_base='O' then
					SELECT	"PAGO_OFERTA"."PRECIO","PAGO_OFERTA"."MONEDA","OFERTA_V"."TOT_PAGADO"
					INTO		:ldb_precio,						:ls_mon,							:ldb_tot_pag
					FROM		"OFERTA_V","PAGO_OFERTA"  
					WHERE	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
								"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
								"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
								"OFERTA_V"."SERIE" = :ls_serie AND  
								"OFERTA_V"."NRO_OFERTA" = :ldb_numero
					USING	sqlca;
				elseif ls_base='L' then
					SELECT	"PAGO_LIBERADOR"."PRECIO",	"PAGO_LIBERADOR"."MONEDA","ANEXO_LIBERADOR"."TOT_PAGADO"
					INTO		:ldb_precio,							:ls_mon,								:ldb_tot_pag
   					FROM		"ANEXO_LIBERADOR","PAGO_LIBERADOR"  
  					WHERE	"ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" and  
        							"ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" and  
        							"ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" and  
        							"ANEXO_LIBERADOR"."SERIE_M" = :ls_serie AND  
        							"ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero
					USING	sqlca;	
				elseif ls_base='A' then
					SELECT	"PAGO_AUMENTO"."PRECIO",	"PAGO_AUMENTO"."MONEDA","ANEXO_AUMENTO"."TOT_PAGADO"
					INTO		:ldb_precio,							:ls_mon,								:ldb_tot_pag
   					FROM		"ANEXO_AUMENTO","PAGO_AUMENTO"  
  					WHERE	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and  
        							"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
        							"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
        							"ANEXO_AUMENTO"."SERIE_M" = :ls_serie AND  
        							"ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero
					USING	sqlca;	
				elseif ls_base='P' then
					SELECT	"PAGARE"."KAPITAL",	"PAGARE"."MONEDA",	"PAGARE"."TOT_PAGADO"
					INTO		:ldb_precio,				:ls_mon,					:ldb_tot_pag
   					FROM		"PAGARE" 
  					WHERE	"PAGARE"."SERIE_P" = :ls_serie AND  
        							"PAGARE"."NRO_PAGARE" = :ldb_numero
					USING	sqlca;
				elseif ls_base='C' then
					SELECT	"CONTRATO"."KAPITAL",	"CONTRATO"."MONEDA",	"CONTRATO"."TOT_PAGADO"
					INTO		:ldb_precio,					:ls_mon,							:ldb_tot_pag
   					FROM		"CONTRATO" 
  					WHERE	"CONTRATO"."SERIE_C" = :ls_serie AND  
        							"CONTRATO"."NRO_CONTRATO" = :ldb_numero
					USING	sqlca;			
				end if
				if isnull(ldb_precio) then ldb_precio=0
				if isnull(ls_mon) then ls_mon=''
				if isnull(ldb_tot_pag) then ldb_tot_pag=0
				
				if ls_mon='1' then
					if ldb_precio=0 then
						ldb_por_ing					= 0
					else
						ldb_por_ing					= ldb_tot_pag/ldb_precio*100
					end if
				else
					if ldb_precio=0 then
						ldb_por_ing					= 0
					else
						ldb_por_ing					= ldb_tot_pag/(ldb_precio*ldb_valor_uf)*100
					end if
				end if
				ll_total_pago						= dw_comision.getitemnumber(ll_indi,'monto_comi')
				if ls_tipo_cob='N' then
					if ll_mes = 1 then
						ll_mes_ini		 			= ll_mes + 11
						ll_ano				 			= ll_ano - 1
					else
						ll_mes_ini			 		= ll_mes - 1
						ll_ano				 			= ll_ano
					end if
					ldt_fec_ini						= datetime(date(string('25/'+string(ll_mes_ini,'00')+'/'+string(ll_ano,'0000'))),time('00:00:00'))
					ldb_ingreso						= ldb_tot_pag
					ldb_porc_comi					= 0
					UPDATE	"AT_GESTION"  
     				SET 		"FEC_INI" = :ldt_fec_ini,   
         						"FEC_FIN" = :ldt_fec_comi,   
         						"MONTO" = :ldb_ingreso  
					WHERE	( "AT_GESTION"."BASE" = :ls_base ) AND  
								( "AT_GESTION"."SERIE" = :ls_serie ) AND  
								( "AT_GESTION"."NUMERO" = :ldb_numero ) AND  
								( "AT_GESTION"."TIPO_COBRANZA" = 'N' )
					USING	Trans_1;
					if Trans_1.sqlcode=0 then
						commit using Trans_1;
					else
						rollback using Trans_1;
					end if
				else
					ldb_ingreso						= ldb_ingreso
					ldb_porc_comi					= round((dw_comision.getitemnumber(ll_indi,'porc_comi') *100),1)
				end if
				if ll_total_pago>0 then
					if f_graba_res_comi(ls_cod,ll_rut,ldb_ingreso,is_cod_con01,string(ll_mes),ldt_fec_comi,ldb_numero,ls_serie,ldb_por_ing,ldb_porc_comi,ldb_precio,ll_total_pago,ldb_valor_uf,'H',ls_mon,ls_cod_com,'A',ls_base,ll_cod_parque,0,0)=-1 then
						ll_malos++
					else
						ll_cont++
					end if
				end if
				if ls_tipo_cob='M' or ls_tipo_cob='C'  or ls_tipo_cob='E' then
					ldb_ingreso						= 0
					ldb_porc_comi					= 0
					ll_total_pago					= dw_comision.getitemnumber(ll_indi,'monto_premio')
					if ll_total_pago>0 then
						if f_graba_res_comi(ls_cod,ll_rut,ldb_ingreso,is_cod_con02,string(ll_mes),ldt_fec_comi,ldb_numero,ls_serie,ldb_por_ing,ldb_porc_comi,ldb_precio,ll_total_pago,ldb_valor_uf,'H',ls_mon,ls_cod_com,'A',ls_base,ll_cod_parque,0,0)=-1 then
							ll_malos++
						else
							ll_cont++
						end if
					end if
				end if
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					st_porc.text						= string(ldb_tot_porc,'#0.##')+" %"
					ldb_tot_porc_aux				= ldb_tot_porc
				end if
				ldb_tot_porc							= (ll_indi / ll_tot_reg) * 100
				hpb_1.Position 						= ldb_tot_porc
				dw_comision.accepttext()
			next
			st_fondo.visible							= false
			hpb_1.visible 							= false
			st_porc.visible 							= false
			messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_cont,'###,###,##0')+' registros grabados con exito~r~n'+&
										'y '+string(ll_malos,'###,###,##0')+' registros con problemas.',information!)
		end if
		dw_comision.reset()
	else
		messagebox(gs_app_name,'No Existen Datos Para Grabar.',information!)
	end if
	//cb_actualiza.triggerevent(clicked!)
	setpointer(Arrow!)
end if
end event

type cb_cta_cte from commandbutton within w_comision_ejecutivo_terreno_asig
integer x = 73
integer y = 1788
integer width = 338
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta. Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa


dw_comision.accepttext()
if il_row>0 then
	if (dw_comision.dataobject='dw_comision_asignada_pagada' or dw_comision.dataobject='dw_comision_asignada_pagada_ind' or dw_comision.dataobject='dw_comision_asignada_pagada_indi' ) and dw_comision.rowcount() > 0 then
		gs_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
		gs_serie				= dw_comision.getitemstring(il_row,'oferta_v_serie')
		gi_numero			= dw_comision.getitemnumber(il_row,'oferta_v_nro_oferta')
		gi_rut				= dw_comision.getitemnumber(il_row,'cadena_rut')
	elseif (dw_comision.dataobject='dw_lista_comi_ag_at' or dw_comision.dataobject='dw_lista_comi_ag_at_administ' or dw_comision.dataobject='dw_lista_comi_ag_at_cobranza' or dw_comision.dataobject='dw_comision_asignada_pagada_cob' or dw_comision.dataobject='dw_comision_asignada_pagada_cob_indi' ) and dw_comision.rowcount() > 0 then
		gs_base				= dw_comision.getitemstring(il_row,'cadena_codigo')
		gs_serie				= dw_comision.getitemstring(il_row,'cadena_serie')
		gi_numero			= dw_comision.getitemnumber(il_row,'cadena_numero')
		gi_rut				= dw_comision.getitemnumber(il_row,'cliente_rut')
	end if
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
end event

type pb_aceptar from picturebutton within w_comision_ejecutivo_terreno_asig
integer x = 526
integer y = 64
integer width = 137
integer height = 116
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_cod_age,ls_est_gest,ls_est_comi,ls_tipo_cob,ls_base,ls_serie,ls_tipo_regul
long		ll_tot_reg,ll_indi,ll_cta
datetime	ldt_fec_comi,ldt_fec_fin
double	ldb_numero,ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_valor_uf,ldb_premio,ldb_comis,ldb_mto_comis,ldb_ing_caja

SetPointer(HourGlass!)
dw_comision.reset()
st_promesa.text 												= 'Buscar Nº Promesa'
rb_admist.checked												= false
dw_tipo_gestion.accepttext()

ldt_fec_fin														= datetime(date(em_termino.text),time('00:00:00'))

SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_valor_uf  
FROM 	"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
USING	sqlca;
if isnull(ldb_valor_uf) then
	messagebox("Advertencia","No Registra Valor U.F. con Fecha :"+string(ldt_fec_fin,'dd/mm/yyyy'))
else
	ls_tipo_cob													= dw_tipo_gestion.getitemstring(1,'tipo_gestion')
	
	if isnull(ls_tipo_cob) or ls_tipo_cob='' then
		if isnull(ls_tipo_cob) or ls_tipo_cob='' then
			messagebox("Advertencia", "Debe Ingresar Tipo Gestión")
			dw_tipo_gestion.setfocus()
		end if
	else
		//wf_fechas(ls_tipo_cob,ldt_fec_fin)
		
		SELECT DISTINCT "FECHA"  
		INTO 		:ldt_fec_comi	   
		FROM		"RES_COMI"  
		WHERE 	( "RES_COMI"."COD_CONTABLE" = :is_cod_con02  ) AND  
					( "RES_COMI"."FECHA" = :ldt_fec_fin )
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ldt_fec_comi) then
				if gl_proceso >= 4 then
					is_actualiz										= 'S'	
					if ls_tipo_cob='N' then
						dw_comision.dataobject					= 'dw_comision_asignada_pagada'
						dw_comision.settransobject(sqlca)
						ll_tot_reg									= dw_comision.retrieve(ldt_fec_fin,ls_tipo_cob,is_cod_con01,is_cod_con02)
					else
						dw_comision.dataobject					= 'dw_comision_asignada_pagada_cob'
						dw_comision.settransobject(sqlca)
						ll_tot_reg									= dw_comision.retrieve(ldt_fec_fin,ls_tipo_cob)
					end if
					
					cb_modif_pago.enabled						= false
					cb_grabar.enabled								= false
					pb_imprimir.enabled							= true
					if ll_tot_reg = 0 then
						messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fec_fin,"dd/mm/yyyy"))
					else
						dw_comision.object.usuario.text		= gs_user
					end if
				elseif gl_proceso = 0 then
					is_actualiz										= 'N' 
					ls_cod_age										= dw_ejecutivo.getitemstring(1,'ejecutivo')
					if not isnull(ls_cod_age) and ls_cod_age <>'' then
						if ls_tipo_cob='N' then
							dw_comision.dataobject				= 'dw_comision_asignada_pagada_indi'
						else
							dw_comision.dataobject				= 'dw_comision_asignada_pagada_cob_indi'
						end if
						dw_comision.settransobject(sqlca)
						ll_tot_reg									= dw_comision.retrieve(ldt_fec_fin,ls_tipo_cob,ls_cod_age)
						pb_imprimir.enabled						= true
						pb_filtrar.enabled							= true
						cb_modif_pago.enabled					= false
						cb_grabar.enabled							= false
						cb_criterio_cob.enabled					= false
						dw_comision.settransobject(sqlca)
						dw_comision.object.usuario.text		= gs_user
						if ll_tot_reg = 0 then
							messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fec_fin,"dd/mm/yyyy"))
						end if
					else
						if isnull(ls_cod_age) or ls_cod_age='' then
							messagebox("Advertencia", "Debe Ingresar Ejecutivo Terreno")
							dw_ejecutivo.setfocus()
						end if
					end if
				end if
			end if
		else
			SetPointer(HourGlass!)
			if gl_proceso >= 4 or gl_proceso=0 then
				is_actualiz											= 'N'	
				if ls_tipo_cob='N' then
					dw_comision.dataobject						= 'dw_lista_comi_ag_at'
				else
					dw_comision.dataobject						= 'dw_lista_comi_ag_at_cobranza'
					dw_comision.settransobject(sqlca)
					dw_comision.getchild('at_gestion_concepto',idw_detalle2)
					idw_detalle2.settransobject(sqlca)
					if idw_detalle2.retrieve(ls_tipo_cob)=0 then
						idw_detalle2.insertrow(0)
					end if
					dw_comision.insertrow(0)
				end if
				dw_comision.settransobject(sqlca)
				dw_comision.object.usuario.text				= gs_user
				cb_modif_pago.enabled							= true
				cb_grabar.enabled									= true
				pb_imprimir.enabled								= false
				st_fondo.visible										= true
				hpb_1.visible 										= true
				st_porc.visible 										= true
				hpb_1.Position										= ldb_tot_porc
				ll_tot_reg											= dw_comision.retrieve(ldt_fec_fin,ls_tipo_cob)
				if ll_tot_reg>0 then
					for ll_indi=1 to ll_tot_reg
						if ls_tipo_cob='N' then
							ls_cod_age								= dw_comision.getitemstring(ll_indi,'at_gestion_usuario_asignado')
							ls_est_gest								= dw_comision.getitemstring(ll_indi,'at_gestion_estado_gestion')
							ls_est_comi								= dw_comision.getitemstring(ll_indi,'at_gestion_estado_comi')
							ldb_comis								= round(wf_pago_comi(1,ls_tipo_cob,ldb_valor_uf),0)
							dw_comision.setitem(ll_indi,"monto_comi",ldb_comis)
						else
							ls_base									= dw_comision.getitemstring(ll_indi,'cadena_codigo')
							ls_serie									= dw_comision.getitemstring(ll_indi,'cadena_serie')
							ldb_numero								= dw_comision.getitemnumber(ll_indi,'cadena_numero')
							ldb_ing_caja							= dw_comision.getitemnumber(ll_indi,'at_gestion_monto')
							ls_tipo_regul							= dw_comision.getitemstring(ll_indi,'at_gestion_concepto')
							if ls_tipo_cob='M' then
								ldb_premio							= round(wf_pago_comi(3,ls_tipo_cob,ldb_valor_uf),0)
								ldb_comis							= wf_pago_comi(4,ls_tipo_cob,ldb_valor_uf)
								ldb_mto_comis						= round((ldb_ing_caja * ldb_comis),0)
								if ls_tipo_regul='ML' or ls_tipo_regul='MS' or ls_tipo_regul='ME' or ls_tipo_regul='MT' then
									ldb_premio						= round((ldb_valor_uf),0)
									ldb_mto_comis					= 0
								end if
							elseif ls_tipo_cob='C' or ls_tipo_cob='E'  then
								ldb_premio							= round(wf_pago_comi(3,ls_tipo_cob,ldb_valor_uf),0)
								ldb_comis							= wf_pago_comi(4,ls_tipo_cob,ldb_valor_uf)
								ldb_mto_comis						= round((ldb_ing_caja * ldb_comis),0)
								if ls_tipo_regul='CS' or ls_tipo_regul='CE' or ls_tipo_regul='CT' or ls_tipo_regul='CL' or ls_tipo_regul='EL'  then
									ldb_premio						= round((ldb_valor_uf),0)
									ldb_mto_comis					= 0
								end if
							end if
							dw_comision.setitem(ll_indi,"porc_comi",ldb_comis)
							dw_comision.setitem(ll_indi,"monto_comi",ldb_mto_comis)
							dw_comision.setitem(ll_indi,"monto_premio",ldb_premio)
						end if
						dw_comision.accepttext()
						if ldb_tot_porc <> ldb_tot_porc_aux then 
							st_porc.text								= string(ldb_tot_porc,'#0.##')+" %"
							ldb_tot_porc_aux						= ldb_tot_porc
						end if
						ldb_tot_porc									= (ll_indi / ll_tot_reg) * 100
						hpb_1.Position 								= ldb_tot_porc
						dw_comision.accepttext()
					next
				end if
				if gl_proceso=0 then
					dw_comision.setFilter( "at_gestion_usuario_asignado ='"+gs_user+"'")
					dw_comision.filter()
					dw_comision.accepttext()
					cb_modif_pago.enabled						= false
					cb_grabar.enabled								= false
					pb_imprimir.enabled							= false
					cb_criterio_cob.enabled						= false
					pb_filtrar.enabled								= false
				end if
				st_fondo.visible										= false
				hpb_1.visible 										= false
				st_porc.visible 										= false
				SetPointer(Arrow!)
			else
				messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fec_fin,"dd/mm/yyyy"))
			end if
		end if
	end if
end if

end event

type p_termino from picture within w_comision_ejecutivo_terreno_asig
integer x = 402
integer y = 72
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string		ls_fecha,ls_tipo_cob
long		ll_mes,ll_ano,ll_cta
datetime	ldt_fec_comi,ldt_fec_fin

dw_tipo_gestion.accepttext()
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



end event

type em_termino from editmask within w_comision_ejecutivo_terreno_asig
integer x = 82
integer y = 76
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

event modified;dw_comision.reset()

end event

type cb_cerrar from commandbutton within w_comision_ejecutivo_terreno_asig
integer x = 3689
integer y = 1916
integer width = 283
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_ejecutivo_terreno_asig)
end event

type gb_periodo from groupbox within w_comision_ejecutivo_terreno_asig
integer x = 55
integer y = 12
integer width = 457
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Período Cierre"
end type

type st_porc from statictext within w_comision_ejecutivo_terreno_asig
boolean visible = false
integer x = 1911
integer y = 844
integer width = 233
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fondo from statictext within w_comision_ejecutivo_terreno_asig
boolean visible = false
integer x = 1303
integer y = 800
integer width = 1440
integer height = 204
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

type gb_1 from groupbox within w_comision_ejecutivo_terreno_asig
integer x = 46
integer y = 1732
integer width = 2587
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

type st_cobranza from statictext within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 814
integer y = 172
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Cobranza"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_cobranza.visible	= true
st_exportar.visible		= false
st_ordenar.visible		= false
st_filtrar.visible			= false
st_imprimir.visible		= false
end event

type st_imprimir from statictext within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1472
integer y = 172
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Imprimir"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_cobranza.visible	= false
st_exportar.visible		= false
st_ordenar.visible		= false
st_filtrar.visible			= false
st_imprimir.visible		= true
end event

type st_ordenar from statictext within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1161
integer y = 172
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Ordenar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_cobranza.visible	= false
st_exportar.visible		= false
st_ordenar.visible		= true
st_filtrar.visible			= false
st_imprimir.visible		= false
end event

type pb_ordenar from picturebutton within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_mousemove
integer x = 1161
integer y = 52
integer width = 151
integer height = 128
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_cobranza.visible	= false
st_exportar.visible		= false
st_ordenar.visible		= true
st_filtrar.visible			= false
st_imprimir.visible		= false

end event

event clicked;if dw_comision.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_comision.SETSORT(NULO)
	dw_comision.SORT()
end if
end event

type pb_imprimir from picturebutton within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_mousemove
integer x = 1472
integer y = 52
integer width = 151
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event ue_mousemove;st_cobranza.visible	= false
st_exportar.visible		= false
st_ordenar.visible		= false
st_filtrar.visible			= false
st_imprimir.visible		= true

end event

event clicked;if dw_comision.rowcount() > 0 then f_Print( dw_comision)
end event

type cb_cobranza from picturebutton within w_comision_ejecutivo_terreno_asig
event ue_mousemove pbm_mousemove
integer x = 814
integer y = 52
integer width = 151
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cobranza_gral.bmp"
string disabledname = "cobranza_gral_no.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_cobranza.visible	= true
st_exportar.visible		= false
st_ordenar.visible		= false
st_filtrar.visible			= false
st_imprimir.visible		= false

end event

event clicked;string		ls_string,ls_ap_paterno,ls_ap_materno,ls_nombre,ls_dv,ls_estado
long		ll_rut,ll_cod_parque

dw_comision.accepttext()
if il_row>0 then
	if (dw_comision.dataobject='dw_comision_asignada_pagada' or dw_comision.dataobject='dw_comision_asignada_pagada_ind') and dw_comision.rowcount() > 0 then
		gs_base 					= dw_comision.getItemstring(il_row, "cadena_codigo")
		gs_serie 					= dw_comision.getItemstring(il_row, "oferta_v_serie")
		gi_numero 				= dw_comision.getItemnumber(il_row, "oferta_v_nro_oferta")
		gi_rut 					= dw_comision.getItemnumber(il_row, "cadena_rut")
		gs_apellido_paterno	= dw_comision.getItemstring(il_row, "cliente_a_paterno")
		gs_apellido_materno	= dw_comision.getItemstring(il_row, "cliente_a_materno")
		gs_nombres				= dw_comision.getItemstring(il_row, "cliente_nombre")
		gs_dv						= dw_comision.getItemstring(il_row, "cliente_dv")
		gs_estado				= dw_comision.getItemstring(il_row, "cadena_estado")
		gl_cod_parque_cta	= dw_comision.getItemnumber(il_row, "cadena_cod_parque")
	elseif (dw_comision.dataobject='dw_lista_comi_ag_at' or dw_comision.dataobject='dw_lista_comi_ag_at_administ' or dw_comision.dataobject='dw_lista_comi_ag_at_cobranza') and dw_comision.rowcount() > 0 then
		gs_base 					= dw_comision.getItemstring(il_row, "cadena_codigo")
		gs_serie 					= dw_comision.getItemstring(il_row, "cadena_serie")
		gi_numero 				= dw_comision.getItemnumber(il_row, "cadena_numero")
		gi_rut						= dw_comision.getItemnumber(il_row, "cliente_rut")
		gs_apellido_paterno	= dw_comision.getItemstring(il_row, "cliente_a_paterno")
		gs_apellido_materno	= dw_comision.getItemstring(il_row, "cliente_a_materno")
		gs_nombres				= dw_comision.getItemstring(il_row, "cliente_nombre")
		gs_dv						= dw_comision.getItemstring(il_row, "cliente_dv")
		gs_estado				= dw_comision.getItemstring(il_row, "cadena_estado")
		gl_cod_parque_cta	= dw_comision.getItemnumber(il_row, "cadena_cod_parque")
	end if
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if

end event

type gb_2 from groupbox within w_comision_ejecutivo_terreno_asig
integer x = 795
integer y = 4
integer width = 855
integer height = 196
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
end type

type gb_3 from groupbox within w_comision_ejecutivo_terreno_asig
integer x = 1723
integer y = 4
integer width = 718
integer height = 192
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Tipo Gestión"
end type

type dw_comision from datawindow within w_comision_ejecutivo_terreno_asig
integer x = 50
integer y = 204
integer width = 3931
integer height = 1516
integer taborder = 40
string title = "none"
string dataobject = "dw_comision_asignada_pagada"
boolean hscrollbar = true
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

event clicked;string	ls_columna,ls_campo_ord,ls_filtro
ls_columna				= dwo.name
if ls_columna='contrato_t' then
	ls_campo_ord		= 'cadena_numero'
	em_ctto.text		= ''
	dw_comision.Object.contrato_t.border=5
	dw_comision.Object.rut_t.border=6
	dw_comision.SETSORT(ls_campo_ord)
	dw_comision.SORT()
	st_promesa.text		= 'Buscar Nº Promesa'
elseif ls_columna='rut_t' then
	ls_campo_ord			= 'cliente_rut'
	em_ctto.text				= ''
	dw_comision.Object.rut_t.border=5
	dw_comision.Object.contrato_t.border=6
	dw_comision.SETSORT(ls_campo_ord)
	dw_comision.SORT()
	st_promesa.text	= 'Buscar Rut Cliente'
elseif ls_columna='todos_t' or ls_columna='color_sin_t' or ls_columna='color_gest_t' then
	if ls_columna='todos_t' then
		ls_filtro				= ''
	elseif ls_columna='color_sin_t' then
		ls_filtro				= "at_gestion_estado_gestion <> 'G'"
	elseif ls_columna='color_gest_t' then
		ls_filtro				= "at_gestion_estado_gestion = 'G'"
	end if
	dw_comision.SetFilter(ls_filtro)
	dw_comision.Filter( )
end if
end event

