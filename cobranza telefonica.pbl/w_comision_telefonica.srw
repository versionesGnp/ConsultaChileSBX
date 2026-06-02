forward
global type w_comision_telefonica from window
end type
type st_cuenta from statictext within w_comision_telefonica
end type
type cb_actualiz from commandbutton within w_comision_telefonica
end type
type cb_resumen_comi from commandbutton within w_comision_telefonica
end type
type hpb_1 from hprogressbar within w_comision_telefonica
end type
type st_porc from statictext within w_comision_telefonica
end type
type cb_6 from commandbutton within w_comision_telefonica
end type
type cb_5 from commandbutton within w_comision_telefonica
end type
type cb_ctacte from commandbutton within w_comision_telefonica
end type
type cb_limpiar from commandbutton within w_comision_telefonica
end type
type cb_imprimir from commandbutton within w_comision_telefonica
end type
type cb_3 from commandbutton within w_comision_telefonica
end type
type cb_2 from commandbutton within w_comision_telefonica
end type
type cb_exportar from commandbutton within w_comision_telefonica
end type
type cb_imprimir_rr_hh from commandbutton within w_comision_telefonica
end type
type cb_grabar from commandbutton within w_comision_telefonica
end type
type cb_cerrar from commandbutton within w_comision_telefonica
end type
type gb_2 from groupbox within w_comision_telefonica
end type
type pb_ok from picturebutton within w_comision_telefonica
end type
type dw_seleccion from datawindow within w_comision_telefonica
end type
type st_fondo from statictext within w_comision_telefonica
end type
type dw_lista from datawindow within w_comision_telefonica
end type
end forward

global type w_comision_telefonica from window
integer width = 3470
integer height = 2148
boolean titlebar = true
string title = "Comisión Cobranza Telefónica"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_cuenta st_cuenta
cb_actualiz cb_actualiz
cb_resumen_comi cb_resumen_comi
hpb_1 hpb_1
st_porc st_porc
cb_6 cb_6
cb_5 cb_5
cb_ctacte cb_ctacte
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_3 cb_3
cb_2 cb_2
cb_exportar cb_exportar
cb_imprimir_rr_hh cb_imprimir_rr_hh
cb_grabar cb_grabar
cb_cerrar cb_cerrar
gb_2 gb_2
pb_ok pb_ok
dw_seleccion dw_seleccion
st_fondo st_fondo
dw_lista dw_lista
end type
global w_comision_telefonica w_comision_telefonica

type variables
string		is_graba='S',is_evento,is_pasa='S',is_age='S',is_cod_cont='C01'
long 		il_row
datetime	idt_fec_comi,idt_fec_fin,idt_fec_ini

end variables

forward prototypes
public subroutine wf_valida_fecha (datetime adt_fec_ini, datetime adt_fec_fin)
public function double wf_porc_comi (string as_cartera_cob, long al_indice_cob)
end prototypes

public subroutine wf_valida_fecha (datetime adt_fec_ini, datetime adt_fec_fin);long		ll_dif_dias,ll_dia,ll_mes,ll_ano,ll_mes_ini,ll_ano_ini,ll_cta
datetime	ldt_fec_proc

//wf_valida_fecha(adt_fec_ini,adt_fec_fin)

SELECT	COUNT("FECHA_FIN")  
INTO 		:ll_cta  
FROM		"COMISION_TELEFONICA"  
WHERE 	"COMISION_TELEFONICA"."FECHA_FIN" =:adt_fec_fin
USING	sqlca;
if isnull(ll_cta) then ll_cta=0
if ll_cta>0 then
	SELECT	"FECHA_INI",	"FECHA_FIN"  
	INTO 		:adt_fec_ini,		:adt_fec_fin  
	FROM 	"COMISION_TELEFONICA"  
	WHERE 	( "COMISION_TELEFONICA"."FECHA_FIN" = :adt_fec_fin ) AND  
				( "COMISION_TELEFONICA"."FECHA_CIERRE" = :adt_fec_fin)
	USING	sqlca;
else
	ll_dif_dias							= DaysAfter(date(adt_fec_ini), date(adt_fec_fin))
	ll_dia									= day(date(adt_fec_fin))
	ll_mes								= month(date(adt_fec_fin))
	ll_ano									= year(date(adt_fec_fin))
	ldt_fec_proc							= f_fecha_fin(ll_mes,ll_ano)
	if adt_fec_ini> gdt_fec_sistema then
		if is_evento='itenfocuschanged' then
		else
			messagebox("Advertencia",'Rango Fecha Invalido "Fecha Inicio No Puede Ser Mayor a Fecha Actual"')
		end if
		is_pasa							= 'N'
		is_graba							= 'N'
		cb_grabar.enabled				= false
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('fecha_fin')
		dw_lista.reset()
	else
		if adt_fec_ini>=adt_fec_fin then
			if is_evento='itenfocuschanged' then
			else
				messagebox("Advertencia",'Rango Fecha Invalido "Fecha Inicio No Puede Ser Mayor a Fecha Término de Proceso"')
			end if
			is_pasa							= 'N'
			is_graba							= 'N'
			cb_grabar.enabled				= false
			dw_seleccion.setfocus()
			dw_seleccion.setcolumn('fecha_fin')
			dw_lista.reset()
		else
			if ll_dif_dias>=50 then
				if is_evento='itenfocuschanged' then
				else
					messagebox("Advertencia",'Rango Fecha Invalido "Fecha Inicio No Puede Ser Mayor a Fecha Término de Proceso"')
				end if
				is_pasa							= 'N'
				is_graba							= 'N'
				cb_grabar.enabled				= false
				dw_seleccion.setfocus()
				dw_seleccion.setcolumn('fecha_fin')
				dw_lista.reset()
			else
				is_pasa							= 'S'
				is_graba							= 'S'
				cb_grabar.enabled				= true
			end if
		end if
	end if
end if
dw_seleccion.setitem(1,'fecha_ini',adt_fec_ini)
dw_seleccion.setitem(1,'fecha_fin',adt_fec_fin)
dw_seleccion.setitem(1,'fecha_cierre',adt_fec_fin)
dw_seleccion.accepttext()
	

end subroutine

public function double wf_porc_comi (string as_cartera_cob, long al_indice_cob);double	ldb_porc_comi
//wf_porc_comi(as_cartera_cob,as_indice_cob,as_base) 
SELECT "GESTION_PORCE_COMIS"."PORCE_COMI"
INTO		:ldb_porc_comi
FROM 	"GESTION_PORCE_COMIS"  
WHERE	"GESTION_PORCE_COMIS"."CARTERA_COBRANZA" = :as_cartera_cob AND  
      		"GESTION_PORCE_COMIS"."INDICE_CARTERA" = :al_indice_cob AND  
         	"GESTION_PORCE_COMIS"."ESTADO" = 'V' AND
			"GESTION_PORCE_COMIS"."FECHA_VIGENCIA" = (	SELECT 	min("GESTION_PORCE_COMIS"."FECHA_VIGENCIA")  
																				FROM 	"GESTION_PORCE_COMIS"  
																				WHERE	"GESTION_PORCE_COMIS"."CARTERA_COBRANZA" = :as_cartera_cob AND  
																							"GESTION_PORCE_COMIS"."INDICE_CARTERA" = :al_indice_cob AND
																							"GESTION_PORCE_COMIS"."ESTADO" = 'V' )
USING	Trans_4;
if isnull(ldb_porc_comi) then ldb_porc_comi=0
return ldb_porc_comi
end function

on w_comision_telefonica.create
this.st_cuenta=create st_cuenta
this.cb_actualiz=create cb_actualiz
this.cb_resumen_comi=create cb_resumen_comi
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_ctacte=create cb_ctacte
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_exportar=create cb_exportar
this.cb_imprimir_rr_hh=create cb_imprimir_rr_hh
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.gb_2=create gb_2
this.pb_ok=create pb_ok
this.dw_seleccion=create dw_seleccion
this.st_fondo=create st_fondo
this.dw_lista=create dw_lista
this.Control[]={this.st_cuenta,&
this.cb_actualiz,&
this.cb_resumen_comi,&
this.hpb_1,&
this.st_porc,&
this.cb_6,&
this.cb_5,&
this.cb_ctacte,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_3,&
this.cb_2,&
this.cb_exportar,&
this.cb_imprimir_rr_hh,&
this.cb_grabar,&
this.cb_cerrar,&
this.gb_2,&
this.pb_ok,&
this.dw_seleccion,&
this.st_fondo,&
this.dw_lista}
end on

on w_comision_telefonica.destroy
destroy(this.st_cuenta)
destroy(this.cb_actualiz)
destroy(this.cb_resumen_comi)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_ctacte)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_exportar)
destroy(this.cb_imprimir_rr_hh)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.gb_2)
destroy(this.pb_ok)
destroy(this.dw_seleccion)
destroy(this.st_fondo)
destroy(this.dw_lista)
end on

event open;string	ls_cod_age,ls_est_age
long	ll_new,ll_rut

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;

gf_centrar(w_comision_telefonica)
dw_seleccion.settransobject(sqlca)

SELECT 	"AGENTES"."COD_AGE",	"ENCARGADOS"."RUT",	"AGENTES"."ESTADO"
INTO 		:ls_cod_age,				:ll_rut,						:ls_est_age	 
FROM		"AGENTES","ENCARGADOS"  
WHERE	"AGENTES"."RUT" = "ENCARGADOS"."RUT" and  
			"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ll_rut) and ll_rut>0 then
		is_pasa						= 'S'
		ll_new						= dw_seleccion.insertrow(0)
		dw_seleccion.scrolltorow(ll_new)
		dw_seleccion.setitem(ll_new,'cod_ejecutivo',gs_user)
		dw_seleccion.setitem(ll_new,'cod_age',ls_cod_age)
		dw_seleccion.setitem(ll_new,'rut_age',ll_rut)
		dw_seleccion.setitem(ll_new,'estado_age',ls_est_age)
		dw_seleccion.object.cod_ejecutivo.protect		= 1
		cb_grabar.enabled			= false
	end if
else
	dw_seleccion.insertrow(0)
end if
dw_seleccion.accepttext()
if gl_proceso<=2 then
	cb_grabar.enabled				= false
	cb_actualiz.enabled			= false
end if

idt_fec_ini							= datetime(date(string('01/'+ string((month(date(gdt_fec_sistema))),'00')+ '/' +string((year(date(gdt_fec_sistema))),'0000'))),time('00:00:00'))
idt_fec_fin							= gdt_fec_sistema
dw_seleccion.setitem(1,'fecha_ini',idt_fec_ini)
dw_seleccion.setitem(1,'fecha_fin',idt_fec_fin)
dw_seleccion.accepttext()
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;


end event

type st_cuenta from statictext within w_comision_telefonica
boolean visible = false
integer x = 960
integer y = 1124
integer width = 1605
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean focusrectangle = false
end type

type cb_actualiz from commandbutton within w_comision_telefonica
integer x = 347
integer y = 1900
integer width = 512
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Est.Comi"
end type

event clicked;string		ls_codigo,ls_serie,ls_est_comi,ls_base,ls_usuario,ls_graba_det='S',ls_graba_ges='S',ls_graba_s_com='S',ls_est_comi_fin
long		ll_res,ll_tot_reg,ll_grupo,ll_graba=0
datetime	ldt_fec_fin
double	ldb_numero,ldb_tot_porc=0,ldb_tot_porc_aux=0
			
dw_seleccion.accepttext()
ldt_fec_fin										= datetime(date(dw_seleccion.getitemdatetime(1,'fecha_fin')),time('00:00:00'))
if not isnull(ldt_fec_fin) then
	ll_res											= MessageBox("Advertencia", '¿ Desea Actualizar Comisión Cobranza Telefónica ?', Exclamation!, YesNo!, 2)
	if ll_res=1 then
		SetPointer(HourGlass!)
		SELECT COUNT ("RES_COMI"."CONTRATO")
		INTO		:ll_tot_reg
		FROM		"COMISION_TELEFONICA_DETALLE","RES_COMI"
		WHERE	"COMISION_TELEFONICA_DETALLE"."BASE" = "RES_COMI"."BASE" AND
					"COMISION_TELEFONICA_DETALLE"."SERIE" = "RES_COMI"."SERIE" AND
					"COMISION_TELEFONICA_DETALLE"."NUMERO" = "RES_COMI"."CONTRATO" AND
					"COMISION_TELEFONICA_DETALLE"."COD_AGE" = "RES_COMI"."COD_AGE_SUP" AND
					"COMISION_TELEFONICA_DETALLE"."FECHA_CIERRE" ="RES_COMI"."FECHA" AND
					"COMISION_TELEFONICA_DETALLE"."FECHA_CIERRE" =:ldt_fec_fin AND
					"RES_COMI"."COD_CONTABLE" =:is_cod_cont
		USING	sqlca;
		if isnull(ll_tot_reg) then ll_tot_reg=0
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Comisión Cobranza Sin Actualizar")
		else
			st_fondo.visible							= true
			hpb_1.visible 							= true
			st_porc.visible 							= true
			hpb_1.Position							= ldb_tot_porc
			st_cuenta.visible						= true
			st_cuenta.text 							= 'Actualizando Comisiones Pagadas: Total Reg. '+string(ll_tot_reg,'###,###,##0')
			DECLARE x1 CURSOR FOR
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"COMISION_TELEFONICA_DETALLE"."SERIE",	"COMISION_TELEFONICA_DETALLE"."NUMERO",	"RES_COMI"."CODIGO_COM",	"COMISION_TELEFONICA_DETALLE"."BASE",	"COMISION_TELEFONICA_DETALLE"."COD_GRUPO",	"COMISION_TELEFONICA_DETALLE"."USUARIO"
			FROM		"COMISION_TELEFONICA_DETALLE","RES_COMI"
			WHERE	"COMISION_TELEFONICA_DETALLE"."BASE" = "RES_COMI"."BASE" AND
						"COMISION_TELEFONICA_DETALLE"."SERIE" = "RES_COMI"."SERIE" AND
						"COMISION_TELEFONICA_DETALLE"."NUMERO" = "RES_COMI"."CONTRATO" AND
						"COMISION_TELEFONICA_DETALLE"."COD_AGE" = "RES_COMI"."COD_AGE_SUP" AND
						"COMISION_TELEFONICA_DETALLE"."FECHA_CIERRE" ="RES_COMI"."FECHA" AND
						"COMISION_TELEFONICA_DETALLE"."FECHA_CIERRE" =:ldt_fec_fin AND
						"RES_COMI"."COD_CONTABLE" =:is_cod_cont
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ls_codigo,	:ls_serie,	:ldb_numero,	:ls_est_comi, :ls_base,:ll_grupo,:ls_usuario;
					if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
						UPDATE	"GESTION_COBRANZA"  
						SET		"ESTADO_COMI" = :ls_est_comi
						WHERE	( "GESTION_COBRANZA"."BASE" = :ls_base ) AND  
									( "GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
									( "GESTION_COBRANZA"."NUMERO" = :ldb_numero ) AND
									( "GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_usuario ) AND
									( "GESTION_COBRANZA"."CODIGO_GRUPO" = :ll_grupo )
						USING	Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
							ll_graba++	
						else
							rollback using Trans_1;
							messagebox("Error Grabar","Error Grabar Promesa "+ls_serie+'-'+string(ldb_numero))
						end if
					end if
					setnull(ls_codigo);setnull(ls_serie);setnull(ldb_numero);setnull(ls_est_comi);setnull(ll_grupo)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text					= string(ldb_tot_porc,'#0.0#')+" %"
						ldb_tot_porc_aux			= ldb_tot_porc
					end if
					ldb_tot_porc						= (ll_graba / ll_tot_reg) * 100
					hpb_1.Position 					= ldb_tot_porc
				LOOP
			end if
			close x1;
			ldb_tot_porc								= 0
			ldb_tot_porc_aux						= 0
			st_fondo.visible							= false
			hpb_1.visible 							= false
			st_porc.visible 							= false
			st_cuenta.visible						= false
			if ll_tot_reg<>ll_graba then
				ls_graba_det						= 'N'
			end if
		end if
		ll_graba									= 0
		SELECT	count("GESTION_LISTA"."CODIGO")
		INTO		:ll_tot_reg
		FROM 	"GESTION_LISTA"  
		WHERE	"GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" <= :ldt_fec_fin  and
					"GESTION_LISTA"."ESTADO"<>'G'
		USING	sqlca;
		if isnull(ll_tot_reg) then ll_tot_reg=0
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Grupo Para Actualizar")
		else
			st_fondo.visible							= true
			hpb_1.visible 							= true
			st_porc.visible 							= true
			hpb_1.Position							= ldb_tot_porc
			st_cuenta.visible						= true
			st_cuenta.text 							= 'Actualizando Grupos Asignados: Total Reg. '+string(ll_tot_reg,'###,###,##0')
			DECLARE x2 CURSOR FOR
			SELECT	"GESTION_LISTA"."CODIGO"
			FROM 	"GESTION_LISTA"  
			WHERE	"GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" <= :ldt_fec_fin and
						"GESTION_LISTA"."ESTADO"<>'G'		
			USING	sqlca;
			open x2;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x2 INTO	:ll_grupo;
					if not isnull(ll_grupo) and ll_grupo>0 then
						UPDATE "GESTION_LISTA"  
						SET 		"ESTADO" = 'G' 
						WHERE	"GESTION_LISTA"."CODIGO" = :ll_grupo
						USING	Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
						else
							rollback using Trans_1;
							messagebox("Error Grabar","Error Grabar Grupo "+ls_serie+'-'+string(ldb_numero))
						end if
					end if
					setnull(ll_grupo)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text					= string(ldb_tot_porc,'#0.0#')+" %"
						ldb_tot_porc_aux			= ldb_tot_porc
					end if
					ldb_tot_porc						= (ll_graba / ll_tot_reg) * 100
					hpb_1.Position 					= ldb_tot_porc
				LOOP
			end if
			close x2;
			ldb_tot_porc								= 0
			ldb_tot_porc_aux						= 0
			st_fondo.visible							= false
			hpb_1.visible 							= false
			st_porc.visible 							= false
			st_cuenta.visible						= false
			if ll_graba<>ll_tot_reg then
				ls_graba_ges						= 'N'
			end if
		end if
			
		ll_graba									= 0
		SELECT	COUNT("GESTION_COBRANZA"."BASE")
		INTO 		:ll_tot_reg
		FROM		"GESTION_COBRANZA"  
		WHERE	(("GESTION_COBRANZA"."FEC_TERMINO_ASIG" <=:ldt_fec_fin  AND
					"GESTION_COBRANZA"."ESTADO_GESTION" = 'P') OR 
					("GESTION_COBRANZA"."ESTADO_GESTION" = 'G' AND
					("GESTION_COBRANZA"."ESTADO_COMI" = 'S' OR "GESTION_COBRANZA"."ESTADO_COMI" = 'N')))
		USING	sqlca;
		if isnull(ll_tot_reg) then ll_tot_reg=0
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Comisiones Sin Actualizar")
		else
			st_fondo.visible							= true
			hpb_1.visible 							= true
			st_porc.visible 							= true
			hpb_1.Position							= ldb_tot_porc
			st_cuenta.visible						= true
			st_cuenta.text 							= 'Actualizando Estado Contratos Sin Ingresos: Total Reg. '+string(ll_tot_reg,'###,###,##0')
			DECLARE x3 CURSOR FOR
			SELECT	"GESTION_COBRANZA"."BASE",	"GESTION_COBRANZA"."SERIE",	"GESTION_COBRANZA"."NUMERO",	"GESTION_COBRANZA"."CODIGO_GRUPO",	"GESTION_COBRANZA"."ESTADO_COMI"
			FROM		"GESTION_COBRANZA"  
			WHERE	(("GESTION_COBRANZA"."FEC_TERMINO_ASIG" <=:ldt_fec_fin  AND
						"GESTION_COBRANZA"."ESTADO_GESTION" = 'P') OR 
						("GESTION_COBRANZA"."ESTADO_GESTION" = 'G' AND
						("GESTION_COBRANZA"."ESTADO_COMI" = 'S' OR "GESTION_COBRANZA"."ESTADO_COMI" = 'N')))
			USING	sqlca;
			open x3;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x3 INTO	:ls_base,	:ls_serie,	:ldb_numero,:ll_grupo,:ls_est_comi;
					if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 and not isnull(ll_grupo) and ll_grupo>0 then
						if ls_est_comi='N' or ls_est_comi='A' then
							ls_est_comi_fin			= 'A'
						elseif ls_est_comi='S' or ls_est_comi='P' then
							ls_est_comi_fin			= 'P'
						end if
						
						UPDATE  "GESTION_COBRANZA"   
						SET 		"ESTADO_COMI" = :ls_est_comi_fin,
									"ESTADO_GESTION" = 'G' 
						WHERE 	( "GESTION_COBRANZA"."BASE" = :ls_base ) AND  
									( "GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
									( "GESTION_COBRANZA"."NUMERO" = :ldb_numero ) AND  
									( "GESTION_COBRANZA"."CODIGO_GRUPO" = :ll_grupo ) 
						USING	Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
							ll_graba++					
						else
							rollback using Trans_1;
							messagebox("Error Grabar","Error Grabar Grupo "+ls_serie+'-'+string(ldb_numero))
						end if
					end if
					setnull(ls_base);setnull(ls_serie);setnull(ldb_numero);setnull(ll_grupo)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text					= string(ldb_tot_porc,'#0.0#')+" %"
						ldb_tot_porc_aux			= ldb_tot_porc
					end if
					ldb_tot_porc						= (ll_graba / ll_tot_reg) * 100
					hpb_1.Position 					= ldb_tot_porc
				LOOP
			end if
			close x3;
			ldb_tot_porc								= 0
			ldb_tot_porc_aux						= 0
			st_fondo.visible							= false
			hpb_1.visible 							= false
			st_porc.visible 							= false
			st_cuenta.visible						= false
			if ll_tot_reg<>ll_graba then
				ls_graba_s_com					= 'N'
			end if
			ll_graba									= 0
		end if
		UPDATE	"COMISION_TELEFONICA"  
		SET		"ESTADO_PROCESO" = 'A'  
		WHERE	"COMISION_TELEFONICA"."FECHA_CIERRE" <= :ldt_fec_fin and
					"COMISION_TELEFONICA"."ESTADO_PROCESO" = 'N'
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit using sqlca;
		else
			rollback using sqlca;
		end if
		if ls_graba_det='S' and ls_graba_ges='S' and ls_graba_s_com='S' then
			messagebox("Grabar",'Grabación Exitosa')
		end if					
		SetPointer(Arrow!)
	end if
end if
end event

type cb_resumen_comi from commandbutton within w_comision_telefonica
integer x = 997
integer y = 1896
integer width = 475
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Resumen Comisión"
end type

event clicked;string		ls_string
long		ll_cta
datetime	ldt_fec_fin

dw_seleccion.accepttext()
ldt_fec_fin					= datetime(date(dw_seleccion.getitemdatetime(1,'fecha_fin')),time('00:00:00'))
if isnull(ldt_fec_fin) then
	messagebox("Advertencia", "Debe Ingresar Tipo Gestión")
	dw_lista.setfocus()
	dw_lista.setcolumn('fecha_fin')
else
	SELECT	count("RES_COMI"."FECHA")  
	INTO 		:ll_cta	   
	FROM		"RES_COMI"  
	WHERE 	"RES_COMI"."COD_CONTABLE" = :is_cod_cont AND  
				"RES_COMI"."FECHA" = :ldt_fec_fin
	USING		sqlca;
	if isnull(ll_cta) then ll_cta=0
	if ll_cta>0 then
		ls_string				= string(ldt_fec_fin,'dd/mm/yyyy')
		OpenWithParm(w_comision_resumen_cob_tele, ls_string)
	else
		messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fec_fin,"dd/mm/yyyy"))
	end if
end if
end event

type hpb_1 from hprogressbar within w_comision_telefonica
boolean visible = false
integer x = 960
integer y = 1060
integer width = 1586
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_comision_telefonica
boolean visible = false
integer x = 1678
integer y = 988
integer width = 233
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_comision_telefonica
integer x = 3557
integer y = 536
integer width = 512
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Respal2010/2016"
end type

event clicked;//string		ls_codigo,ls_pasa='S',ls_base,ls_serie,ls_tipo_mov,ls_tipo_mov_g,ls_glosa,ls_estado_cob,ls_estado_proc,ls_cod_age,ls_cart_cob,ls_estado_comi
//long		ll_grupo,ll_res,ll_ctas_pag,ll_ctas_pag_m,ll_ctas_pag_pie,ll_ctas_sum,ll_new,ll_rut,&
//			ll_mora_cred,ll_mora_mant,ll_mora_pie,ll_tot_reg,ll_cta,ll_rut_age,ll_existe,ll_ind_cart
//datetime	ldt_fec_ini,ldt_fec_fin,ldt_fec_ini_asig,ldt_fec_fin_asig,ldt_fec_tel_log,ldt_fec_gest,ldt_fec_ini_max,ldt_fec_fin_max,ldt_fec_cierre
//double	ldb_porc_com,ldb_mto,ldb_mto_m,ldb_mto_pie,ldb_mto_sum
//double	ldb_numero,ldb_mto_dscto,ldb_mto_dif_ch,ldb_mto_int_rep,ldb_mto_g_ad,ldb_mto_int_seg,ldb_mto_gto_cob,ldb_mto_mora,&
//			ldb_mto_sum_g,ldb_mto_total,ldb_mto_pago,ldb_mto_comi,ldb_tot_ing,ldb_tot_porc=0,ldb_tot_porc_aux=0
//
//SetPointer(HourGlass!)
//dw_lista.reset()
//dw_seleccion.accepttext()
//is_evento					= 'proceso'
//ldt_fec_ini					= dw_seleccion.getitemdatetime(1,'fecha_ini')
//ldt_fec_fin					= datetime(date(dw_seleccion.getitemdatetime(1,'fecha_fin')),time('23:59:59'))
//ldt_fec_cierre				= datetime(date(ldt_fec_fin),time('00:00:00'))
//ls_codigo						= dw_seleccion.getitemstring(1,'cod_ejecutivo')
//ls_cod_age					= dw_seleccion.getitemstring(1,'cod_age')
//ll_rut_age					= dw_seleccion.getitemnumber(1,'rut_age')
//wf_valida_fecha(ldt_fec_ini,ldt_fec_cierre)
//if isnull(is_pasa) or is_pasa='N' then
//	messagebox("Advertencia","Debe Validar Fechas Informe Comisión")
//	dw_seleccion.setfocus()
//	dw_seleccion.setcolumn('fecha_fin')
//	ls_pasa					= 'N'
//elseif isnull(is_age) or is_age='N' then
//	messagebox("Advertencia","Usuario No Registra Codigo Agente  ¡ Debe Comunicar Al Área de Informática !")
//	dw_seleccion.setfocus()
//	dw_seleccion.setcolumn('fecha_ini')
//	ls_pasa					= 'N'
//elseif isnull(ldt_fec_ini) then
//	messagebox("Advertencia","Debe Ingresar Fecha Inicial")
//	dw_seleccion.setfocus()
//	dw_seleccion.setcolumn('fecha_ini')
//	ls_pasa					= 'N'
//elseif isnull(ldt_fec_fin) then
//	messagebox("Advertencia","Debe Ingresar Fecha Término")
//	dw_seleccion.setfocus()
//	dw_seleccion.setcolumn('fecha_fin')
//	ls_pasa					= 'N'
//elseif isnull(ls_codigo) or ls_codigo='' then
//	messagebox("Advertencia","Debe Ingresar Ejecutivo")
//	dw_seleccion.setfocus()
//	dw_seleccion.setcolumn('cod_ejecutivo')
//	ls_pasa					= 'N'
//end if
//
//if ls_pasa='S'  and is_pasa='S' then
//	SELECT	count("COD_AGE_SUP")
//   	INTO 		:ll_existe
//  	FROM 	"RES_COMI"  
//   	WHERE	"RES_COMI"."COD_AGE_SUP" = :ls_cod_age AND  
//         		"RES_COMI"."FECHA" = :ldt_fec_cierre AND
//				"RES_COMI"."COD_CONTABLE" = :is_cod_cont
//	USING	sqlca;
//	if isnull(ll_existe) then ll_existe=0
//	if ll_existe>0 then
//		SELECT	"FECHA_INI",		"FECHA_FIN"  
//		INTO 		:ldt_fec_ini_max,	:ldt_fec_fin_max  
//		FROM 	"COMISION_TELEFONICA"  
//		WHERE 	( "COMISION_TELEFONICA"."FECHA_FIN" = :ldt_fec_cierre ) AND  
//					( "COMISION_TELEFONICA"."FECHA_CIERRE" = :ldt_fec_cierre)
//		USING	sqlca;
//		dw_seleccion.setitem(1,'fecha_ini',ldt_fec_ini_max)
//		dw_seleccion.setitem(1,'fecha_fin',ldt_fec_fin_max)
//		dw_seleccion.accepttext()
//		cb_grabar.enabled									= false		
//		dw_lista.dataobject								='dw_comisiones_cod_telefonica'
//		dw_lista.settransobject(sqlca)
//		ll_tot_reg											= dw_lista.retrieve(ldt_fec_cierre,ls_cod_age)
//		if ll_tot_reg>0 then
//			dw_lista.object.usuario.text					= gs_user
//		end if
//	else
//		cb_grabar.enabled									= true
//		dw_lista.dataobject								='dw_comision_telefonica_detalle'
//		dw_lista.settransobject(sqlca)
//		SELECT	count("BASE")
//		INTO		:ll_cta	
//		FROM 	"VISTA_COMIS_COB_TEL"  
//		WHERE	"VISTA_COMIS_COB_TEL"."USUARIO_ASIGNADO" = :ls_codigo
//		USING	sqlca;
//		if ll_cta>0 then
//			st_fondo.visible									= true
//			hpb_1.visible 									= true
//			st_porc.visible 									= true
//			hpb_1.Position									= ldb_tot_porc
//			DECLARE xage CURSOR FOR
//			SELECT	"BASE",	"SERIE",	"NUMERO",	"FECHA_ASIGNACION",	"FEC_TERMINO_ASIG",	"FEC_TELE_LOG", "RUT",	"CARTERA_COBRANZA",	"INDICE_CARTERA",	"CODIGO"
//			FROM 	"VISTA_COMIS_COB_TEL"  
//			WHERE	"VISTA_COMIS_COB_TEL"."USUARIO_ASIGNADO" = :ls_codigo
//			//AND		("VISTA_COMIS_COB_TEL"."NUMERO" = 603010679 ) //OR "VISTA_COMIS_COB_TEL"."NUMERO"= 3615 OR "VISTA_COMIS_COB_TEL"."NUMERO"=4823)
//			USING	sqlca;
//			open xage;
//			if sqlca.sqlcode=0 then
//				DO WHILE sqlca.sqlcode=0
//					fetch xage INTO	:ls_base,	:ls_serie,	:ldb_numero, :ldt_fec_ini_asig, :ldt_fec_fin_asig,	:ldt_fec_tel_log, :ll_rut, :ls_cart_cob,	:ll_ind_cart,:ll_grupo;
//					if ldb_numero > 0 then
//						if not isnull(ldt_fec_tel_log) then 
//							ldt_fec_tel_log 			= datetime(date(ldt_fec_tel_log),time('00:00:00'))
//						else
//							ldt_fec_tel_log			= ldt_fec_ini  //FECHA_SISTEMA
//						end if
//						ldb_mto= 0;ll_ctas_pag=0;ldb_mto_m=0;ll_ctas_pag_m=0;ldb_mto_pie=0;ll_ctas_pag_pie=0
//						
//						DECLARE cur_01 CURSOR FOR  
//						SELECT	sum("INGRESO"."MONTO"), sum("INGRESO"."CUOTAS_PAG"), "INGRESO"."TIPO_MOV"
//						FROM 	"INGRESO"  
//						WHERE 	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									"INGRESO"."PAGO_HIST" = 'A' AND 
//									("INGRESO"."TIPO_COB" = 'CI' OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND 
//									("INGRESO"."TIPO_MOV" = 'E' or "INGRESO"."TIPO_MOV" = 'I' or "INGRESO"."TIPO_MOV" = 'K') 
//									
//						GROUP BY "INGRESO"."TIPO_MOV"
//						UNION
//						SELECT	sum("INGRESO"."MONTO"), sum("INGRESO"."CUOTAS_PAG"), "INGRESO"."TIPO_MOV"
//						FROM 	"INGRESO"  
//						WHERE 	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									"INGRESO"."TIPO_MOV" = 'F' AND
//									("INGRESO"."TIPO_COB" = 'CI' OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						GROUP BY "INGRESO"."TIPO_MOV"			
//						UNION					
//						SELECT	sum("INGRESO"."MONTO"), sum("INGRESO"."CUOTAS_PAG"), "INGRESO"."TIPO_MOV"
//						FROM 	"INGRESO"  
//						WHERE 	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									("INGRESO"."TIPO_COB" = 'CI' OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."TIPO_MOV" = 'A'
//						GROUP BY "INGRESO"."TIPO_MOV"
//						USING Trans_1;
//						if Trans_1.sqlcode=0 then
//							open cur_01;
//							do while Trans_1.sqlcode=0
//								fetch cur_01 into :ldb_mto_sum, :ll_ctas_sum, :ls_tipo_mov;
//								if not isnull(ls_tipo_mov) and not isnull(ldb_mto_sum) then
//									if ls_tipo_mov = 'E' or ls_tipo_mov = 'I' or ls_tipo_mov = 'K' then 
//										ldb_mto				= ldb_mto + ldb_mto_sum
//										ll_ctas_pag			= ll_ctas_pag + ll_ctas_sum
//									elseif ls_tipo_mov = 'F' then
//										ldb_mto_m			= ldb_mto_m + ldb_mto_sum
//										ll_ctas_pag_m		= ll_ctas_pag_m + ll_ctas_sum
//									elseif ls_tipo_mov = 'A' then
//										ldb_mto_pie			= ldb_mto_pie + ldb_mto_sum
//										ll_ctas_pag_pie		= ll_ctas_pag_pie + ll_ctas_sum
//									end if
//								end if
//								setnull(ldb_mto_sum);setnull(ls_tipo_mov);setnull(ll_ctas_sum)
//							loop
//							close cur_01;
//						end if
//						
//						ldb_mto_dscto=0;ldb_mto_dif_ch=0;ldb_mto_int_rep	=0;ldb_mto_g_ad=0;ldb_mto_int_seg=0;ldb_mto_gto_cob=0;ldb_mto_mora=0
//						
//						DECLARE x1 CURSOR FOR  
//						SELECT DISTINCT sum("INGRESO"."MONTO"),  'G' as t_mov
//						FROM		"INGRESO"  
//						WHERE	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									"INGRESO"."TIPO_MOV" = 'G' AND
//									( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						UNION
//						SELECT DISTINCT sum("INGRESO"."MONTO"), 'J' as t_mov
//						FROM 	"INGRESO"  
//						WHERE	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									"INGRESO"."TIPO_MOV" = 'J' AND
//									( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						UNION
//						SELECT DISTINCT sum("INGRESO"."MONTO"),  'P' as t_mov
//						FROM		"INGRESO"  
//						WHERE	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									"INGRESO"."TIPO_MOV" = 'P' AND
//									( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						UNION
//						SELECT DISTINCT sum("INGRESO"."MONTO"),  'R' as t_mov
//						FROM		"INGRESO"  
//						WHERE	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									"INGRESO"."TIPO_MOV" = 'R' AND
//									( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						UNION
//						SELECT DISTINCT sum("INGRESO"."MONTO"), '4' as t_mov
//						FROM 	"INGRESO"  
//						WHERE	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									"INGRESO"."TIPO_MOV" = '4' AND
//									( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						UNION
//						SELECT DISTINCT sum("INGRESO"."MONTO"), '6' as t_mov
//						FROM 	"INGRESO"  
//						WHERE	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									"INGRESO"."TIPO_MOV" = '6' AND
//									( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						UNION
//						SELECT DISTINCT sum("INGRESO"."MONTO"), '51' as t_mov
//						FROM 	"INGRESO"  
//						WHERE	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									("INGRESO"."TIPO_MOV" = 'L' AND "INGRESO"."CODIGO_OTRO" = '51') AND
//									( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						UNION
//						SELECT DISTINCT sum("INGRESO"."MONTO"), '1' as t_mov
//						FROM 	"INGRESO"  
//						WHERE	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									("INGRESO"."TIPO_MOV" = 'L' AND "INGRESO"."CODIGO_OTRO" = '1') AND
//									( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						UNION
//						SELECT DISTINCT sum("INGRESO"."MONTO"), '3' as t_mov
//						FROM 	"INGRESO"  
//						WHERE	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									("INGRESO"."TIPO_MOV" = 'L' AND "INGRESO"."CODIGO_OTRO" = '3') AND
//									( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						UNION
//						SELECT DISTINCT sum("INGRESO"."MONTO"), 'S' as t_mov
//						FROM 	"INGRESO"  
//						WHERE	"INGRESO"."BASE" = :ls_base and  
//									"INGRESO"."SERIE" = :ls_serie and  
//									"INGRESO"."CONTRATO" = :ldb_numero and  
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
//									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
//									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
//									"INGRESO"."TIPO_MOV" = 'S' AND
//									( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' ) AND
//									"INGRESO"."PAGO_HIST" = 'A'
//						USING	Trans_1;
//						if Trans_1.sqlcode=0 then
//							open x1;
//							do while Trans_1.sqlcode=0
//								fetch x1 into :ldb_mto_sum_g, :ls_tipo_mov_g;
//								if not isnull(ls_tipo_mov_g) and not isnull(ldb_mto_sum_g) then
//									if ls_tipo_mov_g = 'S' then
//										ldb_mto_dscto					= ldb_mto_dscto + ldb_mto_sum_g
//									elseif ls_tipo_mov_g = '3' then
//										ldb_mto_dif_ch					= ldb_mto_dif_ch + ldb_mto_sum_g
//									elseif ls_tipo_mov_g = '51' or ls_tipo_mov_g = '1' then
//										ldb_mto_int_rep				= ldb_mto_int_rep + ldb_mto_sum_g
//									elseif ls_tipo_mov_g = '6' then
//										ldb_mto_g_ad					= ldb_mto_g_ad + ldb_mto_sum_g
//									elseif ls_tipo_mov_g = '4' then
//										ldb_mto_int_seg				= ldb_mto_int_seg + ldb_mto_sum_g
//									elseif ls_tipo_mov_g = 'J' or ls_tipo_mov_g = 'R' then
//										ldb_mto_gto_cob				= ldb_mto_gto_cob + ldb_mto_sum_g
//									elseif ls_tipo_mov_g = 'G' or ls_tipo_mov_g = 'P' then
//										ldb_mto_mora					= ldb_mto_mora + ldb_mto_sum_g
//									end if
//								end if
//								setnull(ldb_mto_sum_g);setnull(ls_tipo_mov_g)
//							loop
//							close x1;
//						end if
//						if isnull(ldb_mto) then ldb_mto=0
//						if isnull(ldb_mto_m) then ldb_mto_m=0
//						if isnull(ldb_mto_mora) then ldb_mto_mora=0
//						if isnull(ldb_mto_gto_cob) then ldb_mto_gto_cob=0
//						if isnull(ldb_mto_dscto) then ldb_mto_dscto=0
//						if isnull(ldb_mto_pie) then ldb_mto_pie=0
//						if isnull(ldb_mto_g_ad) then ldb_mto_g_ad=0
//						if isnull(ldb_mto_int_rep) then ldb_mto_int_rep=0
//						if isnull(ldb_mto_dif_ch) then ldb_mto_dif_ch=0
//						if isnull(ll_ctas_pag) then ll_ctas_pag=0
//						if isnull(ll_ctas_pag_m) then ll_ctas_pag_m=0
//						if isnull(ll_ctas_pag_pie) then ll_ctas_pag_pie=0
//						if isnull(ldb_mto_int_seg) then ldb_mto_int_seg=0
//						ldb_mto_total								= ldb_mto + ldb_mto_m + ldb_mto_mora + ldb_mto_gto_cob + ldb_mto_dscto + ldb_mto_pie + ldb_mto_int_seg + ldb_mto_g_ad + ldb_mto_int_rep + ldb_mto_dif_ch
//						if ldb_mto_total<=0 then
//							ll_cta										= ll_cta - 1
//						else
//							if ll_cta>0 then
//								//if ldb_mto_total > 0 then   //ll_monto > 0 or ll_monto_m > 0 or ll_monto_pie > 0 then 
//								ls_estado_proc						= 'V'
//								ll_new								= dw_lista.insertrow(0)
//								dw_lista.scrolltorow(ll_new)
//								dw_lista.setitem(ll_new,'cod_grupo',ll_grupo)
//								dw_lista.setitem(ll_new,'base',ls_base)
//								dw_lista.setitem(ll_new,'serie',ls_serie)
//								dw_lista.setitem(ll_new,'numero',ldb_numero)
//								dw_lista.setitem(ll_new,'rut',ll_rut)
//								dw_lista.setitem(ll_new,'monto',ldb_mto)		
//								dw_lista.setitem(ll_new,'cta_pag',ll_ctas_pag)
//								dw_lista.setitem(ll_new,'fecha_cierre',ldt_fec_cierre)
//								dw_lista.setitem(ll_new,'comision_telefonica_detalle_monto_mant',ldb_mto_m)		
//								dw_lista.setitem(ll_new,'comision_telefonica_detalle_cta_pag_mant',ll_ctas_pag_m)
//								dw_lista.setitem(ll_new,'monto_pie',ldb_mto_pie)		
//								dw_lista.setitem(ll_new,'cta_pag_pie',ll_ctas_pag_pie)
//								dw_lista.setitem(ll_new,'monto_mora',ldb_mto_mora)		
//								dw_lista.setitem(ll_new,'monto_gasto_cob',ldb_mto_gto_cob)						
//								dw_lista.setitem(ll_new,'monto_descuento',ldb_mto_dscto)	
//								dw_lista.setitem(ll_new,'monto_seg',ldb_mto_int_seg)	
//								dw_lista.setitem(ll_new,'monto_g_adm',ldb_mto_g_ad)	
//								dw_lista.setitem(ll_new,'monto_int_rep',ldb_mto_int_rep)	
//								dw_lista.setitem(ll_new,'monto_dif_ch',ldb_mto_dif_ch)	
//								dw_lista.setitem(ll_new,'monto_tot',ldb_mto_total)
//								dw_lista.setitem(ll_new,'cartera_cobranza',ls_cart_cob)
//								dw_lista.setitem(ll_new,'indice_cartera',ll_ind_cart)
//								
//								ldb_porc_com								= wf_porc_comi(ls_cart_cob,ll_ind_cart) 
//								//ldb_porc_com								= 0.4 
//								
//								if ldt_fec_fin_asig=ldt_fec_cierre then
//									ls_estado_comi							= 'P'
//								elseif ldt_fec_fin_asig>ldt_fec_cierre then
//									ls_estado_comi							= 'S'
//								end if
//								dw_lista.setitem(ll_new,'porc_pago',ldb_porc_com)
//								dw_lista.setitem(ll_new,'estado_proceso',ls_estado_proc)
//								dw_lista.setitem(ll_new,'cod_age',ls_cod_age)
//								dw_lista.setitem(ll_new,'rut_age',ll_rut_age)
//								dw_lista.setitem(ll_new,'estado_comi',ls_estado_comi)
//								ldb_mto_comi								= round(ldb_mto_total * ldb_porc_com / 100 ,0)
//								dw_lista.setitem(ll_new,'monto_comi',ldb_mto_comi)
//								dw_lista.setitem(ll_new,'usuario',ls_codigo)
//								ldb_tot_ing									= ldb_tot_ing + ldb_mto_total
//								ldb_mto_pago								= ldb_mto_pago + ldb_mto_comi
//								if ls_codigo = 'SERBANC' then
//									SELECT	max("TELE_LOG"."FECHA")
//									INTO   	:ldt_fec_gest
//									FROM		"TELE_LOG"  
//									WHERE 	( "TELE_LOG"."BASE" = :ls_base ) AND  
//												( "TELE_LOG"."SERIE" = :ls_serie ) AND  
//												( "TELE_LOG"."NUMERO" = :ldb_numero ) AND  
//												( "TELE_LOG"."FECHA" >= :ldt_fec_ini ) AND  
//												( "TELE_LOG"."FECHA" <= :ldt_fec_fin ) AND  
//												( "TELE_LOG"."USUARIO" = :ls_codigo )   
//									USING		Trans_1;
//									if Trans_1.sqlcode=0 then
//										if not isnull(ldt_fec_gest) then
//											SELECT	"CADENA"."RUT",	"TELE_LOG"."GLOSA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	"TELE_LOG"."ESTADO"  
//											INTO   	:ll_rut,				:ls_glosa,				:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							:ls_estado_cob  					
//											FROM 	"TELE_LOG",	"CADENA",	"CADENA_MORA"  
//											WHERE 	( "TELE_LOG"."BASE" = "CADENA"."CODIGO" ) and  
//														( "TELE_LOG"."SERIE" = "CADENA"."SERIE" ) and  
//														( "TELE_LOG"."NUMERO" = "CADENA"."NUMERO" ) and  
//														( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
//														( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
//														( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
//														( ( "TELE_LOG"."BASE" = :ls_base ) AND  
//														( "TELE_LOG"."SERIE" = :ls_serie ) AND  
//														( "TELE_LOG"."NUMERO" = :ldb_numero ) AND  
//														( "TELE_LOG"."FECHA" = :ldt_fec_gest ) and  
//														( "TELE_LOG"."USUARIO" = :ls_codigo ) )
//											USING		Trans_2;
//										else
//											SELECT	"CADENA"."RUT",	"TELE_LOG"."GLOSA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	"TELE_LOG"."ESTADO"  
//												INTO   	:ll_rut,				:ls_glosa,				:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							:ls_estado_cob  					
//											FROM 		"TELE_LOG",	"CADENA",	"CADENA_MORA"  
//											WHERE 	( "TELE_LOG"."BASE" = "CADENA"."CODIGO" ) and  
//														( "TELE_LOG"."SERIE" = "CADENA"."SERIE" ) and  
//														( "TELE_LOG"."NUMERO" = "CADENA"."NUMERO" ) and  
//														( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
//														( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
//														( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
//														( ( "TELE_LOG"."BASE" = :ls_base ) AND  
//														( "TELE_LOG"."SERIE" = :ls_serie ) AND  
//														( "TELE_LOG"."NUMERO" = :ldb_numero ) AND  
//														( "TELE_LOG"."FECHA" = :ldt_fec_gest ) and  
//														( "TELE_LOG"."USUARIO" = :ls_codigo ) )
//											USING		Trans_2;
//										end if
//									end if
//								else
//									SELECT DISTINCT	max("FECHA_COBRANZA")
//									INTO   	:ldt_fec_gest
//									FROM  	"GESTION_COBRANZA"  
//									WHERE   ("GESTION_COBRANZA"."BASE" = :ls_base ) AND  
//											  ("GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
//											  ("GESTION_COBRANZA"."NUMERO" = :ldb_numero ) AND
//											  ("GESTION_COBRANZA"."FECHA_COBRANZA" >= :ldt_fec_ini ) AND
//											  ("GESTION_COBRANZA"."FECHA_COBRANZA" <= :ldt_fec_fin ) AND
//											  ("GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_codigo )
//									USING		Trans_1;
//									if Trans_1.sqlcode=0 then
//										if not isnull(ldt_fec_gest) then
//											SELECT DISTINCT "GESTION_COBRANZA"."RUT",	"GESTION_COBRANZA"."GLOSA_COBRANZA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	 "GESTION_COBRANZA"."ESTADO_COBRANZA"
//											INTO   			:ll_rut,									:ls_glosa,										:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							 :ls_estado_cob  					
//											FROM   "GESTION_COBRANZA",	"CADENA_MORA",	"GESTION_LISTA"
//											WHERE	("GESTION_COBRANZA"."BASE" = :ls_base ) AND  
//														("GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
//														("GESTION_COBRANZA"."NUMERO" = :ldb_numero )  and
//														("GESTION_COBRANZA"."BASE" = "CADENA_MORA"."BASE" ) AND  
//														("GESTION_COBRANZA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
//														("GESTION_COBRANZA"."NUMERO" = "CADENA_MORA"."NUMERO" )  and
//														("GESTION_LISTA"."CODIGO" = "GESTION_COBRANZA"."CODIGO_GRUPO" )  and
//														("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" >= :ldt_fec_ini ) AND
//														("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" <= :ldt_fec_fin ) AND
//														("GESTION_COBRANZA"."FECHA_COBRANZA" = :ldt_fec_gest ) AND
//														("GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_codigo )
//											USING	Trans_2;
//										else
//											SELECT DISTINCT "GESTION_COBRANZA"."RUT",	"GESTION_COBRANZA"."FECHA_COBRANZA",	"GESTION_COBRANZA"."GLOSA_COBRANZA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	 "GESTION_COBRANZA"."ESTADO_COBRANZA"
//											INTO   			:ll_rut,									:ldt_fec_gest,							:ls_glosa,										:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							 :ls_estado_cob  					
//											FROM   "GESTION_COBRANZA",	"CADENA_MORA",	"GESTION_LISTA"
//											WHERE	("GESTION_COBRANZA"."BASE" = :ls_base ) AND  
//														("GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
//														("GESTION_COBRANZA"."NUMERO" = :ldb_numero )  and
//														("GESTION_COBRANZA"."BASE" = "CADENA_MORA"."BASE" ) AND  
//														("GESTION_COBRANZA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
//														("GESTION_COBRANZA"."NUMERO" = "CADENA_MORA"."NUMERO" )  and
//														("GESTION_LISTA"."CODIGO" = "GESTION_COBRANZA"."CODIGO_GRUPO" )  and
//														("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" >= :ldt_fec_ini ) AND
//														("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" <= :ldt_fec_fin ) AND
//														("GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_codigo )
//											USING	Trans_2;
//										end if
//									end if
//								end if
//								dw_lista.setitem(ll_new,'rut',ll_rut)
//								dw_lista.setitem(ll_new,'glosa',ls_glosa)
//								dw_lista.setitem(ll_new,'mora_cred', ll_mora_cred)
//								dw_lista.setitem(ll_new,'mora_mant', ll_mora_mant)
//								dw_lista.setitem(ll_new,'mora_pie', ll_mora_pie)
//								dw_lista.setitem(ll_new,'fecha_ult_gestion', ldt_fec_gest)
//								dw_lista.setitem(ll_new,'cod_gestion_telefonica', ls_estado_cob)
//								dw_seleccion.setitem(1,'total_ingreso_caja',ldb_tot_ing)
//								dw_seleccion.accepttext()
//							end if
//						end if
//					end if
//					Setnull(ldb_numero);Setnull(ls_base);Setnull(ls_serie);Setnull(ldt_fec_ini_asig);Setnull(ldt_fec_fin_asig)
//					Setnull(ldb_mto);Setnull(ldb_mto_m);Setnull(ldb_mto_mora);Setnull(ldb_mto_gto_cob);Setnull(ldb_mto_dscto);Setnull(ldb_mto_pie)
//					Setnull(ldb_mto_g_ad);Setnull(ldb_mto_int_rep);Setnull(ldb_mto_dif_ch);Setnull(ldb_mto_int_seg);Setnull(ls_tipo_mov_g)
//					Setnull(ldb_mto_sum);Setnull(ls_tipo_mov);Setnull(ll_ctas_pag);Setnull(ll_ctas_pag_m);Setnull(ll_ctas_pag_pie)
//					Setnull(ll_rut);Setnull(ls_glosa);Setnull(ll_mora_cred);Setnull(ll_mora_mant);Setnull(ll_mora_pie);Setnull(ldt_fec_gest);Setnull(ls_estado_cob)
//					if ldb_tot_porc <> ldb_tot_porc_aux then 
//						st_porc.text											= string(ldb_tot_porc,'#0.0#')+" %"
//						ldb_tot_porc_aux									= ldb_tot_porc
//					end if
//					if ll_cta>0 then
//						ldb_tot_porc											= (ll_new / ll_cta) * 100
//					else
//						ldb_tot_porc											= 1 * 100
//					end if
//					hpb_1.Position 											= ldb_tot_porc
//					dw_lista.accepttext()
//				LOOP
//			end if
//			close xage;
//			dw_lista.accepttext()
//			ll_tot_reg														= dw_lista.RowCount()
//			dw_seleccion.setitem(1,'cantidad_ctto', ll_tot_reg)
//			dw_seleccion.setitem(1,'total_ingreso_caja',ldb_tot_ing)
//			dw_seleccion.setitem(1,'monto_pagar',ldb_mto_pago)
//			dw_seleccion.setitem(1,'fecha_crea',gdt_fec_sistema)
//			dw_seleccion.setitem(1,'fecha_cierre',ldt_fec_cierre)
//			dw_seleccion.setitem(1,'fecha_fin',ldt_fec_cierre)
//			st_fondo.visible													= false
//			hpb_1.visible 													= false
//			st_porc.visible 													= false
//		else
//			messagebox("Advertencia","No Registra Contratos Asignados")
//		end if
//	end if
//end if
//SetPointer(Arrow!)
end event

type cb_5 from commandbutton within w_comision_telefonica
boolean visible = false
integer x = 3561
integer y = 652
integer width = 402
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "RESPALDO2"
end type

event clicked;//string		ls_codigo,ls_pasa='S',ls_base,ls_serie,ls_tipo_mov,ls_tipo_mov_g,ls_glosa,ls_estado_cob
//long		ll_grupo,ll_res,ll_numero,ll_ctas_pag,ll_ctas_pag_m,ll_ctas_pag_pie,ll_ctas_sum,ll_new,ll_rut,&
//			ll_mora_cred,ll_mora_mant,ll_mora_pie,ll_tot_reg,ll_cta
//datetime	ldt_fec_ini,ldt_fec_fin,ldt_fec_ini_asig,ldt_fec_fin_asig,ldt_fec_tel_log,ldt_fec_gest
//double	ldb_porc_com,ldb_mto,ldb_mto_m,ldb_mto_pie,ldb_mto_sum
//double	ldb_mto_dscto,ldb_mto_dif_ch,ldb_mto_int_rep,ldb_mto_g_ad,ldb_mto_int_seg,ldb_mto_gto_cob,ldb_mto_mora,&
//			ldb_mto_sum_g,ldb_mto_total,ldb_tot_ing,ldb_mto_pago
//
//SetPointer(HourGlass!)
//dw_lista.reset()
//dw_seleccion.accepttext()
//ldt_fec_ini					= dw_seleccion.getitemdatetime(1,'fecha_ini')
//ldt_fec_fin					= datetime(date(dw_seleccion.getitemdatetime(1,'fecha_fin')),time('23:59:59'))
//ls_codigo						= dw_seleccion.getitemstring(1,'cod_ejecutivo')
//if isnull(ldt_fec_ini) then
//	messagebox("Advertencia","Debe Ingresar Fecha Inicial")
//	dw_seleccion.setfocus()
//	dw_seleccion.setcolumn('fecha_ini')
//	ls_pasa					= 'N'
//elseif isnull(ldt_fec_fin) then
//	messagebox("Advertencia","Debe Ingresar Fecha Término")
//	dw_seleccion.setfocus()
//	dw_seleccion.setcolumn('fecha_fin')
//	ls_pasa					= 'N'
//elseif isnull(ls_codigo) or ls_codigo='' then
//	messagebox("Advertencia","Debe Ingresar Ejecutivo")
//	dw_seleccion.setfocus()
//	dw_seleccion.setcolumn('cod_ejecutivo')
//	ls_pasa					= 'N'
//else
//	SELECT	"COMISION_TELEFONICA"."COD_GRUPO"
//	INTO 		:ll_grupo
//	FROM 	"COMISION_TELEFONICA"  
//	WHERE	( "COMISION_TELEFONICA"."COD_EJECUTIVO" = :ls_codigo ) AND  
//				( "COMISION_TELEFONICA"."FECHA_CIERRE" = :ldt_fec_fin )   
//	USING	sqlca;
//	if sqlca.sqlcode=0 then
//		ll_res						= messagebox("Advertencia","Proceso Cierre del "+string(ldt_fec_fin,'dd/mm/yyyy')+ " Ya Existe, desea Re-Procesar",Exclamation!,YesNo!,2)
//		if ll_res=1 then
//			DELETE FROM "COMISION_TELEFONICA"  
//			WHERE			"COMISION_TELEFONICA"."COD_GRUPO" = :ll_grupo   
//			USING			sqlca;
//			if sqlca.sqlcode=0 then
//				commit;
//				ls_pasa	= 'S'
//				DELETE FROM "COMISION_TELEFONICA_DETALLE"  
//				WHERE 		"COMISION_TELEFONICA_DETALLE"."COD_GRUPO" = :ll_grupo   
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					commit;
//				else
//					rollback;
//					messagebox("Error Eliminar","Error al Eliminar Detalle Proceso SQL "+sqlca.sqlerrtext)
//				end if
//			else
//				rollback;
//				messagebox("Error Eliminar","Error al Eliminar Proceso SQL "+sqlca.sqlerrtext)
//			end if
//		else
//			ls_pasa		= 'N'
//		end if
//	else
//		ls_pasa			= 'S'
//	end if
//	if ls_pasa='S' then
//		ldb_porc_com							= dw_seleccion.getitemnumber(1,'porcentaje')
//		DECLARE xage CURSOR FOR
//		SELECT DISTINCT "GESTION_COBRANZA"."BASE",	"GESTION_COBRANZA"."SERIE",	"GESTION_COBRANZA"."NUMERO",	"GESTION_LISTA"."FECHA",  "GESTION_LISTA"."FECHA_TERMINO_ASIGNACION"
//		FROM 	"TELE_LOG",	"GESTION_COBRANZA" , "GESTION_LISTA" 
//		WHERE ( "TELE_LOG"."BASE" = "GESTION_COBRANZA"."BASE" ) and  
//				( "TELE_LOG"."SERIE" = "GESTION_COBRANZA"."SERIE" ) and  
//				( "TELE_LOG"."NUMERO" = "GESTION_COBRANZA"."NUMERO" ) and  
//				( "GESTION_COBRANZA"."CODIGO_GRUPO" = "GESTION_LISTA"."CODIGO" ) AND
//				( "GESTION_LISTA"."ESTADO" = 'P'  )  AND
//				( "GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_codigo ) AND
//				( "TELE_LOG"."USUARIO" = :ls_codigo ) AND
//				( "TELE_LOG"."NUMERO" = 70310 ) and  
//				( "TELE_LOG"."ESTADO" = '0' OR "TELE_LOG"."ESTADO" = '1' OR "TELE_LOG"."ESTADO" = '2' OR "TELE_LOG"."ESTADO" = '11' OR "TELE_LOG"."ESTADO" = '24'  OR "TELE_LOG"."ESTADO" = '27') 
//		ORDER BY "GESTION_COBRANZA"."NUMERO" ASC
//		USING		sqlca;
//		open xage;
//		if sqlca.sqlcode=0 then
//			DO WHILE sqlca.sqlcode=0
//				fetch xage INTO	:ls_base,	:ls_serie,	:ll_numero, :ldt_fec_ini_asig, :ldt_fec_fin_asig;
//				if ll_numero > 0 then
//					SELECT	MIN("TELE_LOG"."FECHA")  
//					INTO 		:ldt_fec_tel_log  
//					FROM 	"TELE_LOG"  
//					WHERE  	( "TELE_LOG"."BASE" = :ls_base ) AND  
//							 	( "TELE_LOG"."SERIE" = :ls_serie ) AND  
//							 	( "TELE_LOG"."NUMERO" = :ll_numero ) AND  
//							 	( "TELE_LOG"."FECHA" >= :ldt_fec_ini_asig ) AND  
//							 	( "TELE_LOG"."FECHA" <= :ldt_fec_fin_asig ) AND
//							 	( "TELE_LOG"."USUARIO" = :ls_codigo )
//					USing		Trans_4;
//					if not isnull(ldt_fec_tel_log) then 
//						ldt_fec_tel_log 			= datetime(date(ldt_fec_tel_log),time('00:00:00'))
//					else
//						ldt_fec_tel_log			= ldt_fec_ini  //FECHA_SISTEMA
//					end if
//					ldb_mto= 0;ll_ctas_pag=0;ldb_mto_m=0;ll_ctas_pag_m=0;ldb_mto_pie=0;ll_ctas_pag_pie=0
//					DECLARE cur_01 CURSOR FOR  
//					SELECT	sum("INGRESO"."MONTO"), sum("INGRESO"."CUOTAS_PAG"), "INGRESO"."TIPO_MOV",	count("INGRESO"."BASE") 
//					FROM 	"INGRESO"  
//					WHERE 	(( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."FECHA_SISTEMA" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."FECHA_SISTEMA" <= :ldt_fec_fin ) AND
//								( "INGRESO"."FECHA_SISTEMA" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'E' or "INGRESO"."TIPO_MOV" = 'I' or "INGRESO"."TIPO_MOV" = 'K') AND
//								( "INGRESO"."TIPO_COB" = 'CI' OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )) OR
//								( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."SERVIPAG" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."SERVIPAG" <= :ldt_fec_fin ) AND
//								( "INGRESO"."SERVIPAG" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'E' or "INGRESO"."TIPO_MOV" = 'I' or "INGRESO"."TIPO_MOV" = 'K') AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )))
//					GROUP BY "INGRESO"."MONTO", "INGRESO"."CUOTAS_PAG", "INGRESO"."TIPO_MOV","INGRESO"."BASE"
//					UNION
//					SELECT	sum("INGRESO"."MONTO"), sum("INGRESO"."CUOTAS_PAG"), "INGRESO"."TIPO_MOV",	count("INGRESO"."BASE") 
//					FROM 	"INGRESO"  
//					WHERE 	(( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."FECHA_SISTEMA" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."FECHA_SISTEMA" <= :ldt_fec_fin ) AND
//								( "INGRESO"."FECHA_SISTEMA" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'F') AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )) OR
//								( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."SERVIPAG" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."SERVIPAG" <= :ldt_fec_fin ) AND
//								( "INGRESO"."SERVIPAG" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'F' ) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )))
//					GROUP BY "INGRESO"."MONTO", "INGRESO"."CUOTAS_PAG", "INGRESO"."TIPO_MOV"
//					UNION					
//					SELECT sum("INGRESO"."MONTO"),	count("INGRESO"."CUOTAS_PAG") ,"INGRESO"."TIPO_MOV",	count("INGRESO"."BASE") 
//					FROM 	"INGRESO"  
//					WHERE	(( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."FECHA_SISTEMA" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."FECHA_SISTEMA" <= :ldt_fec_fin ) AND
//								( "INGRESO"."FECHA_SISTEMA" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'A') AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )) OR
//								( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."SERVIPAG" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."SERVIPAG" <= :ldt_fec_fin ) AND
//								( "INGRESO"."SERVIPAG" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'A' ) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )))
//					GROUP BY "INGRESO"."MONTO", "INGRESO"."CUOTAS_PAG", "INGRESO"."TIPO_MOV","INGRESO"."BASE"
//					USING Trans_4;
//					if Trans_4.sqlcode=0 then
//						open cur_01;
//						do while Trans_4.sqlcode=0
//							fetch cur_01 into :ldb_mto_sum, :ll_ctas_sum, :ls_tipo_mov, :ll_cta ;
//							if not isnull(ls_tipo_mov) and not isnull(ldb_mto_sum) then
//								if ls_tipo_mov = 'E' or ls_tipo_mov = 'I' or ls_tipo_mov = 'K' then 
//									ldb_mto				= ldb_mto + ldb_mto_sum
//									ll_ctas_pag			= ll_ctas_pag + ll_ctas_sum
//								elseif ls_tipo_mov = 'F' then
//									ldb_mto_m			= ldb_mto_m + ldb_mto_sum
//									ll_ctas_pag_m		= ll_ctas_pag_m + ll_ctas_sum
//								elseif ls_tipo_mov = 'A' then
//									ldb_mto_pie			= ldb_mto_pie + ldb_mto_sum
//									ll_ctas_pag_pie		= ll_ctas_pag_pie + ll_ctas_sum
//								end if
//							end if
//							setnull(ldb_mto_sum);setnull(ls_tipo_mov);setnull(ll_ctas_sum)
//						loop
//						close cur_01;
//					end if
//					
//					ldb_mto_dscto=0;ldb_mto_dif_ch=0;ldb_mto_int_rep	=0;ldb_mto_g_ad=0;ldb_mto_int_seg=0;ldb_mto_gto_cob=0;ldb_mto_mora=0
//					
//					
//					//wf_ingreso(ls_base,ls_serie,ll_numero,adt_fec_ini,adt_fec_fin,adt_fec_log,as_tipo_mov1,as_tipo_mov2)
//					
//					
//					DECLARE x1 CURSOR FOR  
//					SELECT DISTINCT sum("INGRESO"."MONTO"),  'G' as t_mov
//					FROM		"INGRESO"  
//					WHERE	(( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."FECHA_SISTEMA" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."FECHA_SISTEMA" <= :ldt_fec_fin ) AND
//								( "INGRESO"."FECHA_SISTEMA" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'G') AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )) OR
//								( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."SERVIPAG" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."SERVIPAG" <= :ldt_fec_fin ) AND
//								( "INGRESO"."SERVIPAG" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'G' ) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )))
//					UNION
//					SELECT DISTINCT sum("INGRESO"."MONTO"), 'J' as t_mov
//					FROM 	"INGRESO"  
//					WHERE	(( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."FECHA_SISTEMA" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."FECHA_SISTEMA" <= :ldt_fec_fin ) AND
//								( "INGRESO"."FECHA_SISTEMA" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'J') AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )) OR
//								( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."SERVIPAG" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."SERVIPAG" <= :ldt_fec_fin ) AND
//								( "INGRESO"."SERVIPAG" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'J' ) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )))
//					UNION
//					SELECT DISTINCT sum("INGRESO"."MONTO"), '4' as t_mov
//					FROM 	"INGRESO"  
//					WHERE	(( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."FECHA_SISTEMA" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."FECHA_SISTEMA" <= :ldt_fec_fin ) AND
//								( "INGRESO"."FECHA_SISTEMA" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = '4') AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )) OR
//								( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."SERVIPAG" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."SERVIPAG" <= :ldt_fec_fin ) AND
//								( "INGRESO"."SERVIPAG" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = '4' ) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )))
//					UNION
//					SELECT DISTINCT sum("INGRESO"."MONTO"), '6' as t_mov
//					FROM 	"INGRESO"  
//					WHERE	(( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."FECHA_SISTEMA" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."FECHA_SISTEMA" <= :ldt_fec_fin ) AND
//								( "INGRESO"."FECHA_SISTEMA" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = '6') AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )) OR
//								( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."SERVIPAG" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."SERVIPAG" <= :ldt_fec_fin ) AND
//								( "INGRESO"."SERVIPAG" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = '6' ) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )))
//					UNION
//					SELECT DISTINCT sum("INGRESO"."MONTO"), '51' as t_mov
//					FROM 	"INGRESO"  
//					WHERE	(( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."FECHA_SISTEMA" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."FECHA_SISTEMA" <= :ldt_fec_fin ) AND
//								( "INGRESO"."FECHA_SISTEMA" >= :ldt_fec_tel_log ) and
//								(("INGRESO"."TIPO_MOV" = 'L' AND "INGRESO"."CODIGO_OTRO" = '51')) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )) OR
//								( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."SERVIPAG" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."SERVIPAG" <= :ldt_fec_fin ) AND
//								( "INGRESO"."SERVIPAG" >= :ldt_fec_tel_log ) and
//								(("INGRESO"."TIPO_MOV" = 'L' AND "INGRESO"."CODIGO_OTRO" = '51')) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )))
//					UNION
//					SELECT DISTINCT sum("INGRESO"."MONTO"), '3' as t_mov
//					FROM 	"INGRESO"  
//					WHERE	(( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."FECHA_SISTEMA" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."FECHA_SISTEMA" <= :ldt_fec_fin ) AND
//								( "INGRESO"."FECHA_SISTEMA" >= :ldt_fec_tel_log ) and
//								(("INGRESO"."TIPO_MOV" = 'L' AND "INGRESO"."CODIGO_OTRO" = '3')) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )) OR
//								( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."SERVIPAG" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."SERVIPAG" <= :ldt_fec_fin ) AND
//								( "INGRESO"."SERVIPAG" >= :ldt_fec_tel_log ) and
//								(("INGRESO"."TIPO_MOV" = 'L' AND "INGRESO"."CODIGO_OTRO" = '3')) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )))
//					UNION
//					SELECT DISTINCT sum("INGRESO"."MONTO"), 'S' as t_mov
//					FROM 	"INGRESO"  
//					WHERE	(( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."FECHA_SISTEMA" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."FECHA_SISTEMA" <= :ldt_fec_fin ) AND
//								( "INGRESO"."FECHA_SISTEMA" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'S') AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )) OR
//								( "INGRESO"."BASE" = :ls_base ) and  
//								( "INGRESO"."SERIE" = :ls_serie ) and  
//								( "INGRESO"."CONTRATO" = :ll_numero ) and  
//								(("INGRESO"."SERVIPAG" >= :ldt_fec_ini ) AND  
//								( "INGRESO"."SERVIPAG" <= :ldt_fec_fin ) AND
//								( "INGRESO"."SERVIPAG" >= :ldt_fec_tel_log ) and
//								( "INGRESO"."TIPO_MOV" = 'S' ) AND
//								( "INGRESO"."TIPO_COB" = 'CI'  OR "INGRESO"."TIPO_COB" = 'BE' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'C1' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'B0' OR "INGRESO"."TIPO_COB" = 'CC' )))
//					USING	Trans_4;
//					if Trans_4.sqlcode=0 then
//						open x1;
//						do while Trans_4.sqlcode=0
//							fetch x1 into :ldb_mto_sum_g, :ls_tipo_mov_g;
//							if not isnull(ls_tipo_mov_g) and not isnull(ldb_mto_sum_g) then
//								if ls_tipo_mov_g = 'S' then
//									ldb_mto_dscto					= ldb_mto_dscto + ldb_mto_sum_g
//								elseif ls_tipo_mov_g = '3' then
//									ldb_mto_dif_ch					= ldb_mto_dif_ch + ldb_mto_sum_g
//								elseif ls_tipo_mov_g = '51' then
//									ldb_mto_int_rep				= ldb_mto_int_rep + ldb_mto_sum_g
//								elseif ls_tipo_mov_g = '6' then
//									ldb_mto_g_ad					= ldb_mto_g_ad + ldb_mto_sum_g
//								elseif ls_tipo_mov_g = '4' then
//									ldb_mto_int_seg				= ldb_mto_int_seg + ldb_mto_sum_g
//								elseif ls_tipo_mov_g = 'J' then
//									ldb_mto_gto_cob				= ldb_mto_gto_cob + ldb_mto_sum_g
//								elseif ls_tipo_mov_g = 'G' then
//									ldb_mto_mora					= ldb_mto_mora + ldb_mto_sum_g
//								end if
//							end if
//							setnull(ldb_mto_sum_g);setnull(ls_tipo_mov_g)
//						loop
//						close x1;
//					end if
//					if isnull(ldb_mto) then ldb_mto=0
//					if isnull(ldb_mto_m) then ldb_mto_m=0
//					if isnull(ldb_mto_mora) then ldb_mto_mora=0
//					if isnull(ldb_mto_gto_cob) then ldb_mto_gto_cob=0
//					if isnull(ldb_mto_dscto) then ldb_mto_dscto=0
//					if isnull(ldb_mto_pie) then ldb_mto_pie=0
//					if isnull(ldb_mto_g_ad) then ldb_mto_g_ad=0
//					if isnull(ldb_mto_int_rep) then ldb_mto_int_rep=0
//					if isnull(ldb_mto_dif_ch) then ldb_mto_dif_ch=0
//					if isnull(ll_ctas_pag) then ll_ctas_pag=0
//					if isnull(ll_ctas_pag_m) then ll_ctas_pag_m=0
//					if isnull(ll_ctas_pag_pie) then ll_ctas_pag_pie=0
//					if isnull(ldb_mto_int_seg) then ldb_mto_int_seg=0
//					
//					ldb_mto_total							= ldb_mto + ldb_mto_m + ldb_mto_mora + ldb_mto_gto_cob + ldb_mto_dscto + ldb_mto_pie + ldb_mto_int_seg + ldb_mto_g_ad + ldb_mto_int_rep + ldb_mto_dif_ch
//					
//					if ldb_mto_total > 0 then   //ll_monto > 0 or ll_monto_m > 0 or ll_monto_pie > 0 then 
//						ll_new					= dw_lista.insertrow(0)
//						dw_lista.scrolltorow(ll_new)
//						dw_lista.setitem(ll_new,'base', ls_base)
//						dw_lista.setitem(ll_new,'serie', ls_serie)
//						dw_lista.setitem(ll_new,'numero', ll_numero)
//						dw_lista.setitem(ll_new,'monto', ldb_mto)		
//						dw_lista.setitem(ll_new,'cta_pag', ll_ctas_pag)
//						dw_lista.setitem(ll_new,'fecha_cierre',ldt_fec_fin)
//						dw_lista.setitem(ll_new,'comision_telefonica_detalle_monto_mant',ldb_mto_m)		
//						dw_lista.setitem(ll_new,'comision_telefonica_detalle_cta_pag_mant',ll_ctas_pag_m)
//						dw_lista.setitem(ll_new,'monto_pie',ldb_mto_pie)		
//						dw_lista.setitem(ll_new,'cta_pag_pie',ll_ctas_pag_pie)
//						dw_lista.setitem(ll_new,'monto_mora',ldb_mto_mora)		
//						dw_lista.setitem(ll_new,'monto_gasto_cob',ldb_mto_gto_cob)						
//						dw_lista.setitem(ll_new,'monto_descuento',ldb_mto_dscto)	
//						dw_lista.setitem(ll_new,'monto_seg',ldb_mto_int_seg)	
//						dw_lista.setitem(ll_new,'monto_g_adm',ldb_mto_g_ad)	
//						dw_lista.setitem(ll_new,'monto_int_rep',ldb_mto_int_rep)	
//						dw_lista.setitem(ll_new,'monto_dif_ch',ldb_mto_dif_ch)	
//						ldb_tot_ing								= ldb_tot_ing + ldb_mto_total
////						dw_comision_telefonica.setitem(1,'total_ingreso_caja',ll_tot_ingre_caja)
////						dw_comision_telefonica.accepttext()
//						if ls_codigo = 'SERBANC' then
//							SELECT	max("TELE_LOG"."FECHA")
//							INTO   	:ldt_fec_gest
//							FROM		"TELE_LOG"  
//							WHERE 	( "TELE_LOG"."BASE" = :ls_base ) AND  
//										( "TELE_LOG"."SERIE" = :ls_serie ) AND  
//										( "TELE_LOG"."NUMERO" = :ll_numero ) AND  
//										( "TELE_LOG"."FECHA" >= :ldt_fec_ini ) AND  
//										( "TELE_LOG"."FECHA" <= :ldt_fec_fin ) AND  
//										( "TELE_LOG"."USUARIO" = :ls_codigo )   
//							USING		Trans_1;
//							if Trans_1.sqlcode=0 then
//								if not isnull(ldt_fec_gest) then
//									SELECT	"CADENA"."RUT",	"TELE_LOG"."GLOSA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	"TELE_LOG"."ESTADO"  
//    									INTO   	:ll_rut,				:ls_glosa,				:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							:ls_estado_cob  					
//									FROM 		"TELE_LOG",	"CADENA",	"CADENA_MORA"  
//									WHERE 	( "TELE_LOG"."BASE" = "CADENA"."CODIGO" ) and  
//												( "TELE_LOG"."SERIE" = "CADENA"."SERIE" ) and  
//												( "TELE_LOG"."NUMERO" = "CADENA"."NUMERO" ) and  
//												( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
//												( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
//												( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
//												( ( "TELE_LOG"."BASE" = :ls_base ) AND  
//												( "TELE_LOG"."SERIE" = :ls_serie ) AND  
//												( "TELE_LOG"."NUMERO" = :ll_numero ) AND  
//												( "TELE_LOG"."FECHA" = :ldt_fec_gest ) and  
//												( "TELE_LOG"."USUARIO" = :ls_codigo ) )
//									USING		Trans_2;
//								else
//									SELECT	"CADENA"."RUT",	"TELE_LOG"."GLOSA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	"TELE_LOG"."ESTADO"  
//    									INTO   	:ll_rut,				:ls_glosa,				:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							:ls_estado_cob  					
//									FROM 		"TELE_LOG",	"CADENA",	"CADENA_MORA"  
//									WHERE 	( "TELE_LOG"."BASE" = "CADENA"."CODIGO" ) and  
//												( "TELE_LOG"."SERIE" = "CADENA"."SERIE" ) and  
//												( "TELE_LOG"."NUMERO" = "CADENA"."NUMERO" ) and  
//												( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
//												( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
//												( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
//												( ( "TELE_LOG"."BASE" = :ls_base ) AND  
//												( "TELE_LOG"."SERIE" = :ls_serie ) AND  
//												( "TELE_LOG"."NUMERO" = :ll_numero ) AND  
//												( "TELE_LOG"."FECHA" = :ldt_fec_gest ) and  
//												( "TELE_LOG"."USUARIO" = :ls_codigo ) )
//									USING		Trans_2;
//								end if
//							end if
//						else
//							SELECT DISTINCT	max("FECHA_COBRANZA")
//							INTO   	:ldt_fec_gest
//							FROM  	"GESTION_COBRANZA"  
//							WHERE   ("GESTION_COBRANZA"."BASE" = :ls_base ) AND  
//									  ("GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
//									  ("GESTION_COBRANZA"."NUMERO" = :ll_numero ) AND
//									  ("GESTION_COBRANZA"."FECHA_COBRANZA" >= :ldt_fec_ini ) AND
//									  ("GESTION_COBRANZA"."FECHA_COBRANZA" <= :ldt_fec_fin ) AND
//									  ("GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_codigo )
//							USING		Trans_1;
//							if Trans_1.sqlcode=0 then
//								if not isnull(ldt_fec_gest) then
//									SELECT DISTINCT "GESTION_COBRANZA"."RUT",	"GESTION_COBRANZA"."GLOSA_COBRANZA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	 "GESTION_COBRANZA"."ESTADO_COBRANZA"
//									INTO   			:ll_rut,									:ls_glosa,										:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							 :ls_estado_cob  					
//									FROM   "GESTION_COBRANZA",	"CADENA_MORA",	"GESTION_LISTA"
//									WHERE	("GESTION_COBRANZA"."BASE" = :ls_base ) AND  
//											("GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
//											("GESTION_COBRANZA"."NUMERO" = :ll_numero )  and
//											("GESTION_COBRANZA"."BASE" = "CADENA_MORA"."BASE" ) AND  
//											("GESTION_COBRANZA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
//											("GESTION_COBRANZA"."NUMERO" = "CADENA_MORA"."NUMERO" )  and
//											("GESTION_LISTA"."CODIGO" = "GESTION_COBRANZA"."CODIGO_GRUPO" )  and
//											("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" >= :ldt_fec_ini ) AND
//											("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" <= :ldt_fec_fin ) AND
//											("GESTION_COBRANZA"."FECHA_COBRANZA" = :ldt_fec_gest ) AND
//											("GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_codigo )
//									USING		Trans_2;
//								else
//									SELECT DISTINCT "GESTION_COBRANZA"."RUT",	"GESTION_COBRANZA"."FECHA_COBRANZA",	"GESTION_COBRANZA"."GLOSA_COBRANZA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	 "GESTION_COBRANZA"."ESTADO_COBRANZA"
//									INTO   			:ll_rut,									:ldt_fec_gest,							:ls_glosa,										:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							 :ls_estado_cob  					
//									FROM   "GESTION_COBRANZA",	"CADENA_MORA",	"GESTION_LISTA"
//									WHERE	("GESTION_COBRANZA"."BASE" = :ls_base ) AND  
//											("GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
//											("GESTION_COBRANZA"."NUMERO" = :ll_numero )  and
//											("GESTION_COBRANZA"."BASE" = "CADENA_MORA"."BASE" ) AND  
//											("GESTION_COBRANZA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
//											("GESTION_COBRANZA"."NUMERO" = "CADENA_MORA"."NUMERO" )  and
//											("GESTION_LISTA"."CODIGO" = "GESTION_COBRANZA"."CODIGO_GRUPO" )  and
//											("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" >= :ldt_fec_ini ) AND
//											("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" <= :ldt_fec_fin ) AND
//											("GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_codigo )
//									USING		Trans_2;
//								end if
//							end if
//						end if
//						dw_lista.setitem(ll_new,'rut',ll_rut)
//						dw_lista.setitem(ll_new,'glosa',ls_glosa)
//						dw_lista.setitem(ll_new,'mora_cred', ll_mora_cred)
//						dw_lista.setitem(ll_new,'mora_mant', ll_mora_mant)
//						dw_lista.setitem(ll_new,'mora_pie', ll_mora_pie)
//						dw_lista.setitem(ll_new,'fecha_ult_gestion', ldt_fec_gest)
//						dw_lista.setitem(ll_new,'cod_gestion_telefonica', ls_estado_cob)
//						dw_seleccion.setitem(1,'total_ingreso_caja',ldb_tot_ing)
//						dw_seleccion.accepttext()
//					end if
//				end if
//				Setnull(ll_numero);Setnull(ls_base);Setnull(ls_serie);Setnull(ldt_fec_ini_asig);Setnull(ldt_fec_fin_asig)
//				Setnull(ldb_mto);Setnull(ldb_mto_m);Setnull(ldb_mto_mora);Setnull(ldb_mto_gto_cob);Setnull(ldb_mto_dscto);Setnull(ldb_mto_pie)
//				Setnull(ldb_mto_g_ad);Setnull(ldb_mto_int_rep);Setnull(ldb_mto_dif_ch);Setnull(ldb_mto_int_seg);Setnull(ls_tipo_mov_g)
//				Setnull(ldb_mto_sum);Setnull(ls_tipo_mov);Setnull(ll_ctas_pag);Setnull(ll_ctas_pag_m);Setnull(ll_ctas_pag_pie)
//				Setnull(ll_rut);Setnull(ls_glosa);Setnull(ll_mora_cred);Setnull(ll_mora_mant);Setnull(ll_mora_pie);Setnull(ldt_fec_gest);Setnull(ls_estado_cob)
//			LOOP
//		end if
//		close xage;
//		dw_lista.accepttext()
//		ll_tot_reg															= dw_lista.RowCount()
//		dw_seleccion.setitem(1,'cantidad_ctto', ll_tot_reg)
//		dw_seleccion.setitem(1,'total_ingreso_caja',ldb_tot_ing)
//		
//		ldb_mto_pago														=	round(ldb_tot_ing * ldb_porc_com / 100 ,0)
//		dw_seleccion.setitem(1,'monto_pagar',ldb_mto_pago)
//	else
//		if dw_seleccion.retrieve(ll_grupo) > 0 then cb_imprimir_rr_hh.enabled = true
//		dw_lista.retrieve(ll_grupo)
//	end if
//end if
//SetPointer(Arrow!)
//
end event

type cb_ctacte from commandbutton within w_comision_telefonica
integer x = 1472
integer y = 1896
integer width = 416
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;double		ldb_numero

if il_row > 0 then
	ldb_numero				= dw_lista.getitemnumber(il_row,'numero')
	if ldb_numero>0 THEN
		gs_base 				= dw_lista.getitemstring(il_row,'base')
		gs_serie 				= dw_lista.getitemstring(il_row,'serie')
		gi_numero			= ldb_numero
		gi_rut 				= dw_lista.getitemnumber(il_row,'rut')
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
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	end if	
end if
end event

type cb_limpiar from commandbutton within w_comision_telefonica
integer x = 1943
integer y = 1908
integer width = 229
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_comision_telefonica.triggerevent(open!)
end event

type cb_imprimir from commandbutton within w_comision_telefonica
integer x = 2843
integer y = 1908
integer width = 229
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )


end event

type cb_3 from commandbutton within w_comision_telefonica
integer x = 2619
integer y = 1908
integer width = 229
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_comision_telefonica
integer x = 2391
integer y = 1908
integer width = 229
integer height = 84
integer taborder = 70
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

type cb_exportar from commandbutton within w_comision_telefonica
integer x = 2167
integer y = 1908
integer width = 229
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_DWToExcel( dw_lista )
end if
end event

type cb_imprimir_rr_hh from commandbutton within w_comision_telefonica
integer x = 718
integer y = 2120
integer width = 352
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Imprimir RR.HH."
end type

event clicked;string 	ls_memo, ls_cod_ejecutiva
Long		ll_grupo,ll_anno_memo

dw_seleccion.accepttext()
ls_memo						= dw_seleccion.getitemstring(1,'numero_memo')
ll_anno_memo				= dw_seleccion.getitemnumber(1,'anno_memo')
ls_cod_ejecutiva			= dw_seleccion.getitemstring(1,'cod_ejecutivo')
ll_grupo						= dw_seleccion.getitemnumber(1,'cod_grupo')

if isnull(ls_memo) or ls_memo='' then
	messagebox('Advertencia','Debe Ingresar Numero de Memorandum')
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('numero_memo')
elseif isnull(ll_anno_memo) or ll_anno_memo=0 then
	messagebox('Advertencia','Debe Ingresar Año Memorandum')
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('anno_memo')
else
	UPDATE	"COMISION_TELEFONICA"  
	SET		"NUMERO_MEMO" = :ls_memo,   
				"ANNO_MEMO" = :ll_anno_memo  
	WHERE	"COMISION_TELEFONICA"."COD_EJECUTIVO" = :ls_cod_ejecutiva   AND
				"COMISION_TELEFONICA"."COD_GRUPO" = :ll_grupo
	using		sqlca;
	if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if
	openwithparm(w_memo_comi_tel,string(ll_grupo)) 
end if


end event

type cb_grabar from commandbutton within w_comision_telefonica
integer x = 37
integer y = 1900
integer width = 311
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_base,ls_serie,ls_mes,ls_cod_agte,ls_est_comi,ls_est_agte,ls_pasa='S'
long		ll_tot_reg,ll_mes,ll_ano,ll_indi,ll_rut_agte,ll_cod_parque,ll_malos,ll_cont,ll_graba=0,ll_res,ll_cta
datetime	ldt_fec_fin,ldt_fec_proc,ldt_fec_ini
double	ldb_numero,ldb_tot_pag,ldb_porc_comi,ldb_mto_pag,ldb_valor_uf,ldb_tot_porc=0,ldb_tot_porc_aux=0

//gdt_fec_sistema									= datetime(date(string('03/04/2015')))						

dw_seleccion.accepttext()
ldt_fec_ini											= dw_seleccion.getitemdatetime(1,'fecha_ini')
ldt_fec_fin											= datetime(date(dw_seleccion.getitemdatetime(1,'fecha_fin')),time('00:00:00'))
ldb_porc_comi										= dw_seleccion.getitemnumber(1,'porcentaje')
ls_est_agte											= dw_seleccion.getitemstring(1,'estado_age')
wf_valida_fecha(ldt_fec_ini,ldt_fec_fin)
if isnull(ldt_fec_ini) then
	messagebox("Advertencia","Debe Ingresar Fecha Inicial")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('fecha_ini')
	ls_pasa					= 'N'
elseif isnull(ldt_fec_fin) then
	messagebox("Advertencia","Debe Ingresar Fecha Término")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('fecha_fin')
	ls_pasa					= 'N'
elseif isnull(ldb_porc_comi) or ldb_porc_comi=0 then
	messagebox("Advertencia","Debe Ingresar Porcentaje Comisión")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('porcentaje')
	ls_pasa					= 'N'
elseif isnull(ls_est_agte) or ls_est_agte='' then
	messagebox("Advertencia","Debe Validar Estado Cobrador")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('estado_age')
	ls_pasa					= 'N'	
end if
if ls_pasa='S' then
	ll_tot_reg												= dw_lista.rowcount()
	if ll_tot_reg>0 then
		if is_graba='S' then
			if not isnull(ldt_fec_fin) then
				SELECT	"TAB_UF"."VALOR_UF"  
				INTO		:ldb_valor_uf  
				FROM		"TAB_UF"  
				WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
				USING	sqlca;
				if isnull(ldb_valor_uf) then ldb_valor_uf=0 
				ll_mes										= month(date(ldt_fec_fin))
				ll_ano											= year(date(ldt_fec_fin))
				ls_mes										= string(ll_mes)
				ldt_fec_proc									= datetime((RelativeDate(date(ldt_fec_fin),2)),time('00:00:00'))
				if ldt_fec_proc<gdt_fec_sistema then
					ll_res										=  messageBox("Grabar","¿Desea Grabar Proceso Comisiones Ejecutivo?", Exclamation!, YesNo!, 2)
					if ll_res=1 then
						st_fondo.visible						= true
						hpb_1.visible 						= true
						st_porc.visible 						= true
						hpb_1.Position						= ldb_tot_porc
						for ll_indi = 1 to ll_tot_reg
							ls_base							= dw_lista.getitemstring(ll_indi,'base')
							ls_serie							= dw_lista.getitemstring(ll_indi,'serie')
							ldb_numero						= dw_lista.getitemnumber(ll_indi,'numero')
							ls_cod_agte						= dw_lista.getitemstring(ll_indi,'cod_age')
							ldb_tot_pag						= dw_lista.getitemnumber(ll_indi,'monto_tot')
							ldb_mto_pag					= dw_lista.getitemnumber(ll_indi,'monto_comi')
							ls_est_comi						= dw_lista.getitemstring(ll_indi,'estado_comi')
							ll_rut_agte						= dw_lista.getitemnumber(ll_indi,'rut_age')
							SELECT 	"CADENA"."COD_PARQUE"  
							INTO 		:ll_cod_parque  
							FROM 	"CADENA"  
							WHERE	"CADENA"."CODIGO" = :ls_base and  
										"CADENA"."SERIE" = :ls_serie and  
										"CADENA"."NUMERO" = :ldb_numero
							USING	sqlca;
							if isnull(ll_cod_parque) then ll_cod_parque=1 
							if f_graba_res_comi(ls_cod_agte,ll_rut_agte,ldb_tot_pag,is_cod_cont,ls_mes,ldt_fec_fin,ldb_numero,ls_serie,0,ldb_porc_comi,0,ldb_mto_pag,ldb_valor_uf,'H','',ls_est_comi,ls_est_agte,ls_base,ll_cod_parque,0,0)= -1 then
								ll_malos++
							else
								ll_cont++
							end if
							if ldb_tot_porc <> ldb_tot_porc_aux then 
								st_porc.text					= string(ldb_tot_porc,'#0.0#')+" %"
								ldb_tot_porc_aux			= ldb_tot_porc
							end if
							ldb_tot_porc						= (ll_indi / ll_tot_reg) * 100
							hpb_1.Position 					= ldb_tot_porc
							dw_lista.accepttext()
						next
						st_fondo.visible						= false
						hpb_1.visible 						= false
						st_porc.visible 						= false
						if ll_cont=ll_tot_reg then
							commit;
							ll_graba++
							if dw_lista.update()= 1 then
								commit;
								ll_graba++
								SELECT	count("COMISION_TELEFONICA"."FECHA_CIERRE")  
   								INTO 		:ll_cta  
								FROM 	"COMISION_TELEFONICA"  
								WHERE	"COMISION_TELEFONICA"."FECHA_CIERRE" = :ldt_fec_fin
								USING	sqlca;
								if isnull(ll_cta) then ll_cta=0
								if ll_cta=0 then
									if dw_seleccion.update()= 1 then
										commit;
										ll_graba++
									else
										rollback;
										messagebox("Error Grabar","Error al Grabar SELECCIÓN PERÍODO SQL: "+sqlca.sqlerrtext)
									end if
								else
									ll_graba++
								end if
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar COMISION INFORME DETALLE SQL: "+sqlca.sqlerrtext)
							end if
						else
							rollback;
							messagebox("Error Grabar","Error al Grabar RES_COMI DETALLE SQL: "+sqlca.sqlerrtext)
						end if
						if ll_graba=3 then		
							//cb_imprimir_rr_hh.enabled = true
							messagebox("Grabar","Grabación Exitosa")
							//idw_detalle.retrieve(ls_usuario)
						end if
					end if
				else
					messagebox("Advertencia","Debe Esperar Recaudación Externa")
				end if
			end if
		end if
	else
		messagebox("Advertencia","No Registra Datos")
	end if
end if
end event

type cb_cerrar from commandbutton within w_comision_telefonica
integer x = 3136
integer y = 1900
integer width = 279
integer height = 96
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_telefonica)
end event

type gb_2 from groupbox within w_comision_telefonica
integer x = 1915
integer y = 1856
integer width = 1179
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

type pb_ok from picturebutton within w_comision_telefonica
integer x = 3159
integer y = 32
integer width = 169
integer height = 148
integer taborder = 20
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

event clicked;string		ls_codigo,ls_pasa='S',ls_base,ls_serie,ls_tipo_mov,ls_tipo_mov_g,ls_glosa,ls_estado_cob,ls_estado_proc,ls_cod_age,ls_cart_cob,ls_estado_comi,ls_cod_otro
long		ll_grupo,ll_res,ll_ctas_pag,ll_ctas_pag_m,ll_ctas_pag_pie,ll_ctas_sum,ll_new,ll_rut,&
			ll_mora_cred,ll_mora_mant,ll_mora_pie,ll_tot_reg,ll_cta,ll_rut_age,ll_existe,ll_ind_cart
datetime	ldt_fec_ini,ldt_fec_fin,ldt_fec_ini_asig,ldt_fec_fin_asig,ldt_fec_tel_log,ldt_fec_gest,ldt_fec_ini_max,ldt_fec_fin_max,ldt_fec_cierre
double	ldb_porc_com,ldb_mto,ldb_mto_m,ldb_mto_pie,ldb_mto_sum
double	ldb_numero,ldb_mto_dscto,ldb_mto_dif_ch,ldb_mto_int_rep,ldb_mto_g_ad,ldb_mto_int_seg,ldb_mto_gto_cob,ldb_mto_mora,&
			ldb_mto_sum_g,ldb_mto_total,ldb_mto_pago,ldb_mto_comi,ldb_tot_ing,ldb_tot_porc=0,ldb_tot_porc_aux=0

SetPointer(HourGlass!)
dw_lista.reset()
dw_seleccion.accepttext()
is_evento					= 'proceso'
ldt_fec_ini					= dw_seleccion.getitemdatetime(1,'fecha_ini')
ldt_fec_fin					= datetime(date(dw_seleccion.getitemdatetime(1,'fecha_fin')),time('23:59:59'))
ldt_fec_cierre				= datetime(date(ldt_fec_fin),time('00:00:00'))
ls_codigo						= dw_seleccion.getitemstring(1,'cod_ejecutivo')
ls_cod_age					= dw_seleccion.getitemstring(1,'cod_age')
ll_rut_age					= dw_seleccion.getitemnumber(1,'rut_age')
wf_valida_fecha(ldt_fec_ini,ldt_fec_cierre)
if isnull(is_pasa) or is_pasa='N' then
	messagebox("Advertencia","Debe Validar Fechas Informe Comisión")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('fecha_fin')
	ls_pasa					= 'N'
elseif isnull(is_age) or is_age='N' then
	messagebox("Advertencia","Usuario No Registra Codigo Agente  ¡ Debe Comunicar Al Área de Informática !")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('fecha_ini')
	ls_pasa					= 'N'
elseif isnull(ldt_fec_ini) then
	messagebox("Advertencia","Debe Ingresar Fecha Inicial")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('fecha_ini')
	ls_pasa					= 'N'
elseif isnull(ldt_fec_fin) then
	messagebox("Advertencia","Debe Ingresar Fecha Término")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('fecha_fin')
	ls_pasa					= 'N'
elseif isnull(ls_codigo) or ls_codigo='' then
	messagebox("Advertencia","Debe Ingresar Ejecutivo")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('cod_ejecutivo')
	ls_pasa					= 'N'
end if

if ls_pasa='S'  and is_pasa='S' then
	SELECT	count("COD_AGE_SUP")
   	INTO 		:ll_existe
  	FROM 	"RES_COMI"  
   	WHERE	"RES_COMI"."COD_AGE_SUP" = :ls_cod_age AND  
         		"RES_COMI"."FECHA" = :ldt_fec_cierre AND
				"RES_COMI"."COD_CONTABLE" = :is_cod_cont
	USING	sqlca;
	if isnull(ll_existe) then ll_existe=0
	if ll_existe>0 then
		SELECT	"FECHA_INI",		"FECHA_FIN"  
		INTO 		:ldt_fec_ini_max,	:ldt_fec_fin_max  
		FROM 	"COMISION_TELEFONICA"  
		WHERE 	( "COMISION_TELEFONICA"."FECHA_FIN" = :ldt_fec_cierre ) AND  
					( "COMISION_TELEFONICA"."FECHA_CIERRE" = :ldt_fec_cierre)
		USING	sqlca;
		dw_seleccion.setitem(1,'fecha_ini',ldt_fec_ini_max)
		dw_seleccion.setitem(1,'fecha_fin',ldt_fec_fin_max)
		dw_seleccion.accepttext()
		cb_grabar.enabled									= false		
		dw_lista.dataobject								='dw_comisiones_cod_telefonica'
		dw_lista.settransobject(sqlca)
		ll_tot_reg											= dw_lista.retrieve(ldt_fec_cierre,ls_cod_age)
		if ll_tot_reg>0 then
			dw_lista.object.usuario.text					= gs_user
		end if
	else
		cb_grabar.enabled									= true
		dw_lista.dataobject								='dw_comision_telefonica_detalle'
		dw_lista.settransobject(sqlca)
		SELECT	count("BASE")
		INTO		:ll_cta	
		FROM 	"VISTA_COMIS_COB_TEL"  
		WHERE	"VISTA_COMIS_COB_TEL"."USUARIO_ASIGNADO" = :ls_codigo
		USING	sqlca;
		if ll_cta>0 then
			st_fondo.visible									= true
			hpb_1.visible 									= true
			st_porc.visible 									= true
			hpb_1.Position									= ldb_tot_porc
			
			DECLARE xage CURSOR FOR
			SELECT	"BASE",	"SERIE",	"NUMERO",	"FECHA_ASIGNACION",	"FEC_TERMINO_ASIG",	"FEC_TELE_LOG", "RUT",	"CARTERA_COBRANZA",	"INDICE_CARTERA",	"CODIGO"
			FROM 	"VISTA_COMIS_COB_TEL"  
			WHERE	"VISTA_COMIS_COB_TEL"."USUARIO_ASIGNADO" = :ls_codigo
			//AND		("VISTA_COMIS_COB_TEL"."NUMERO" = 33181 ) //OR "VISTA_COMIS_COB_TEL"."NUMERO"= 3615 OR "VISTA_COMIS_COB_TEL"."NUMERO"=4823)
			USING	sqlca;
			open xage;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch xage INTO	:ls_base,	:ls_serie,	:ldb_numero, :ldt_fec_ini_asig, :ldt_fec_fin_asig,	:ldt_fec_tel_log, :ll_rut, :ls_cart_cob,	:ll_ind_cart,:ll_grupo;
					if ldb_numero > 0 then
						if not isnull(ldt_fec_tel_log) then 
							ldt_fec_tel_log 			= datetime(date(ldt_fec_tel_log),time('00:00:00'))
						else
							ldt_fec_tel_log			= ldt_fec_ini  //FECHA_SISTEMA
						end if
						ldb_mto= 0;ll_ctas_pag=0;ldb_mto_m=0;ll_ctas_pag_m=0;ldb_mto_pie=0;ll_ctas_pag_pie=0
						ldb_mto_dscto=0;ldb_mto_dif_ch=0;ldb_mto_int_rep	=0;ldb_mto_g_ad=0;ldb_mto_int_seg=0;ldb_mto_gto_cob=0;ldb_mto_mora=0
						
						DECLARE cur_01 CURSOR FOR  
						SELECT	sum("INGRESO"."MONTO"), sum("INGRESO"."CUOTAS_PAG"), "INGRESO"."TIPO_MOV", "INGRESO"."CODIGO_OTRO"
						FROM		"INGRESO","AT_ING_CAJA_COD_MOV"  
						WHERE	"INGRESO"."TIPO_COB" = "AT_ING_CAJA_COD_MOV"."TIPO_COB" and
									"INGRESO"."TIPO_MOV" = "AT_ING_CAJA_COD_MOV"."TIPO_MOV" and
									"INGRESO"."CODIGO_OTRO" = "AT_ING_CAJA_COD_MOV"."CODIGO_OTRO" and
									 "AT_ING_CAJA_COD_MOV"."DEPTO_CARTERA" = 'C' and
									"INGRESO"."BASE" = :ls_base and  
									"INGRESO"."SERIE" = :ls_serie and  
									"INGRESO"."CONTRATO" = :ldb_numero and  
									"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini AND  
									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
									"INGRESO"."FECHA_PAGO" >= :ldt_fec_tel_log and
									"INGRESO"."PAGO_HIST" = 'A'
						GROUP BY	"INGRESO"."TIPO_MOV",
									 	"INGRESO"."CODIGO_OTRO"
						USING Trans_1;
						if Trans_1.sqlcode=0 then
							open cur_01;
							do while Trans_1.sqlcode=0
								fetch cur_01 into :ldb_mto_sum, :ll_ctas_sum, :ls_tipo_mov, :ls_cod_otro;
								if not isnull(ls_tipo_mov) and not isnull(ldb_mto_sum) then
									if ls_tipo_mov = 'E' or ls_tipo_mov = 'I' or ls_tipo_mov = 'K' or ls_tipo_mov = 'F' or ls_tipo_mov = 'A' then 
										if ls_tipo_mov = 'E' or ls_tipo_mov = 'I' or ls_tipo_mov = 'K' then 
											ldb_mto				= ldb_mto + ldb_mto_sum
											ll_ctas_pag			= ll_ctas_pag + ll_ctas_sum
										elseif ls_tipo_mov = 'F' then
											ldb_mto_m			= ldb_mto_m + ldb_mto_sum
											ll_ctas_pag_m		= ll_ctas_pag_m + ll_ctas_sum
										elseif ls_tipo_mov = 'A' then
											ldb_mto_pie			= ldb_mto_pie + ldb_mto_sum
											ll_ctas_pag_pie		= ll_ctas_pag_pie + ll_ctas_sum
										end if
									else
										ls_tipo_mov_g			= ls_tipo_mov
										ldb_mto_sum_g		= ldb_mto_sum	
										
										if ls_tipo_mov_g = 'G' or ls_tipo_mov_g = 'P' then
											ldb_mto_mora					= ldb_mto_mora + ldb_mto_sum_g
										elseif ls_tipo_mov_g = 'J' or ls_tipo_mov_g = 'R' then
											ldb_mto_gto_cob				= ldb_mto_gto_cob + ldb_mto_sum_g	
										elseif ls_tipo_mov_g = '4' then
											ldb_mto_int_seg				= ldb_mto_int_seg + ldb_mto_sum_g
										elseif ls_tipo_mov_g = '6' then
											ldb_mto_g_ad					= ldb_mto_g_ad + ldb_mto_sum_g
										elseif ls_tipo_mov_g = 'S' then
											ldb_mto_dscto					= ldb_mto_dscto + ldb_mto_sum_g
										elseif ls_tipo_mov_g = 'L' and (ls_cod_otro = '51' or ls_cod_otro= '1') then
											ldb_mto_int_rep				= ldb_mto_int_rep + ldb_mto_sum_g
										elseif ls_tipo_mov_g = 'L' and ls_cod_otro = '3' then
											ldb_mto_dif_ch					= ldb_mto_dif_ch + ldb_mto_sum_g
										end if
									end if
								end if
								setnull(ldb_mto_sum);setnull(ls_tipo_mov);setnull(ll_ctas_sum);setnull(ls_cod_otro);setnull(ldb_mto_sum_g);setnull(ls_tipo_mov_g)
							loop
							close cur_01;
						end if
						
						if isnull(ldb_mto) then ldb_mto=0
						if isnull(ldb_mto_m) then ldb_mto_m=0
						if isnull(ldb_mto_mora) then ldb_mto_mora=0
						if isnull(ldb_mto_gto_cob) then ldb_mto_gto_cob=0
						if isnull(ldb_mto_dscto) then ldb_mto_dscto=0
						if isnull(ldb_mto_pie) then ldb_mto_pie=0
						if isnull(ldb_mto_g_ad) then ldb_mto_g_ad=0
						if isnull(ldb_mto_int_rep) then ldb_mto_int_rep=0
						if isnull(ldb_mto_dif_ch) then ldb_mto_dif_ch=0
						if isnull(ll_ctas_pag) then ll_ctas_pag=0
						if isnull(ll_ctas_pag_m) then ll_ctas_pag_m=0
						if isnull(ll_ctas_pag_pie) then ll_ctas_pag_pie=0
						if isnull(ldb_mto_int_seg) then ldb_mto_int_seg=0
						
					
						ldb_mto_total								= ldb_mto + ldb_mto_m + ldb_mto_mora + ldb_mto_gto_cob + ldb_mto_dscto + ldb_mto_pie + ldb_mto_int_seg + ldb_mto_g_ad + ldb_mto_int_rep + ldb_mto_dif_ch
						if ldb_mto_total<=0 then
							ll_cta										= ll_cta - 1
						else
							if ll_cta>0 then
								//if ldb_mto_total > 0 then   //ll_monto > 0 or ll_monto_m > 0 or ll_monto_pie > 0 then 
								ls_estado_proc						= 'V'
								ll_new								= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new)
								dw_lista.setitem(ll_new,'cod_grupo',ll_grupo)
								dw_lista.setitem(ll_new,'base',ls_base)
								dw_lista.setitem(ll_new,'serie',ls_serie)
								dw_lista.setitem(ll_new,'numero',ldb_numero)
								dw_lista.setitem(ll_new,'rut',ll_rut)
								dw_lista.setitem(ll_new,'monto',ldb_mto)		
								dw_lista.setitem(ll_new,'cta_pag',ll_ctas_pag)
								dw_lista.setitem(ll_new,'fecha_cierre',ldt_fec_cierre)
								dw_lista.setitem(ll_new,'comision_telefonica_detalle_monto_mant',ldb_mto_m)		
								dw_lista.setitem(ll_new,'comision_telefonica_detalle_cta_pag_mant',ll_ctas_pag_m)
								dw_lista.setitem(ll_new,'monto_pie',ldb_mto_pie)		
								dw_lista.setitem(ll_new,'cta_pag_pie',ll_ctas_pag_pie)
								dw_lista.setitem(ll_new,'monto_mora',ldb_mto_mora)		
								dw_lista.setitem(ll_new,'monto_gasto_cob',ldb_mto_gto_cob)						
								dw_lista.setitem(ll_new,'monto_descuento',ldb_mto_dscto)	
								dw_lista.setitem(ll_new,'monto_seg',ldb_mto_int_seg)	
								dw_lista.setitem(ll_new,'monto_g_adm',ldb_mto_g_ad)	
								dw_lista.setitem(ll_new,'monto_int_rep',ldb_mto_int_rep)	
								dw_lista.setitem(ll_new,'monto_dif_ch',ldb_mto_dif_ch)	
								dw_lista.setitem(ll_new,'monto_tot',ldb_mto_total)
								dw_lista.setitem(ll_new,'cartera_cobranza',ls_cart_cob)
								dw_lista.setitem(ll_new,'indice_cartera',ll_ind_cart)
								
								ldb_porc_com								= wf_porc_comi(ls_cart_cob,ll_ind_cart) 
								//ldb_porc_com								= 0.4 
								
								if ldt_fec_fin_asig=ldt_fec_cierre then
									ls_estado_comi							= 'P'
								elseif ldt_fec_fin_asig>ldt_fec_cierre then
									ls_estado_comi							= 'S'
								end if
								dw_lista.setitem(ll_new,'porc_pago',ldb_porc_com)
								dw_lista.setitem(ll_new,'estado_proceso',ls_estado_proc)
								dw_lista.setitem(ll_new,'cod_age',ls_cod_age)
								dw_lista.setitem(ll_new,'rut_age',ll_rut_age)
								dw_lista.setitem(ll_new,'estado_comi',ls_estado_comi)
								ldb_mto_comi								= round(ldb_mto_total * ldb_porc_com / 100 ,0)
								dw_lista.setitem(ll_new,'monto_comi',ldb_mto_comi)
								dw_lista.setitem(ll_new,'usuario',ls_codigo)
								ldb_tot_ing									= ldb_tot_ing + ldb_mto_total
								ldb_mto_pago								= ldb_mto_pago + ldb_mto_comi
								if ls_codigo = 'SERBANC' then
									SELECT	max("TELE_LOG"."FECHA")
									INTO   	:ldt_fec_gest
									FROM		"TELE_LOG"  
									WHERE 	( "TELE_LOG"."BASE" = :ls_base ) AND  
												( "TELE_LOG"."SERIE" = :ls_serie ) AND  
												( "TELE_LOG"."NUMERO" = :ldb_numero ) AND  
												( "TELE_LOG"."FECHA" >= :ldt_fec_ini ) AND  
												( "TELE_LOG"."FECHA" <= :ldt_fec_fin ) AND  
												( "TELE_LOG"."USUARIO" = :ls_codigo )   
									USING		Trans_1;
									if Trans_1.sqlcode=0 then
										if not isnull(ldt_fec_gest) then
											SELECT	"CADENA"."RUT",	"TELE_LOG"."GLOSA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	"TELE_LOG"."ESTADO"  
											INTO   	:ll_rut,				:ls_glosa,				:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							:ls_estado_cob  					
											FROM 	"TELE_LOG",	"CADENA",	"CADENA_MORA"  
											WHERE 	( "TELE_LOG"."BASE" = "CADENA"."CODIGO" ) and  
														( "TELE_LOG"."SERIE" = "CADENA"."SERIE" ) and  
														( "TELE_LOG"."NUMERO" = "CADENA"."NUMERO" ) and  
														( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
														( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
														( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
														( ( "TELE_LOG"."BASE" = :ls_base ) AND  
														( "TELE_LOG"."SERIE" = :ls_serie ) AND  
														( "TELE_LOG"."NUMERO" = :ldb_numero ) AND  
														( "TELE_LOG"."FECHA" = :ldt_fec_gest ) and  
														( "TELE_LOG"."USUARIO" = :ls_codigo ) )
											USING		Trans_2;
										else
											SELECT	"CADENA"."RUT",	"TELE_LOG"."GLOSA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	"TELE_LOG"."ESTADO"  
												INTO   	:ll_rut,				:ls_glosa,				:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							:ls_estado_cob  					
											FROM 		"TELE_LOG",	"CADENA",	"CADENA_MORA"  
											WHERE 	( "TELE_LOG"."BASE" = "CADENA"."CODIGO" ) and  
														( "TELE_LOG"."SERIE" = "CADENA"."SERIE" ) and  
														( "TELE_LOG"."NUMERO" = "CADENA"."NUMERO" ) and  
														( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
														( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
														( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
														( ( "TELE_LOG"."BASE" = :ls_base ) AND  
														( "TELE_LOG"."SERIE" = :ls_serie ) AND  
														( "TELE_LOG"."NUMERO" = :ldb_numero ) AND  
														( "TELE_LOG"."FECHA" = :ldt_fec_gest ) and  
														( "TELE_LOG"."USUARIO" = :ls_codigo ) )
											USING		Trans_2;
										end if
									end if
								else
									SELECT DISTINCT	max("FECHA_COBRANZA")
									INTO   	:ldt_fec_gest
									FROM  	"GESTION_COBRANZA"  
									WHERE   ("GESTION_COBRANZA"."BASE" = :ls_base ) AND  
											  ("GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
											  ("GESTION_COBRANZA"."NUMERO" = :ldb_numero ) AND
											  ("GESTION_COBRANZA"."FECHA_COBRANZA" >= :ldt_fec_ini ) AND
											  ("GESTION_COBRANZA"."FECHA_COBRANZA" <= :ldt_fec_fin ) AND
											  ("GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_codigo )
									USING		Trans_1;
									if Trans_1.sqlcode=0 then
										if not isnull(ldt_fec_gest) then
											SELECT DISTINCT "GESTION_COBRANZA"."RUT",	"GESTION_COBRANZA"."GLOSA_COBRANZA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	 "GESTION_COBRANZA"."ESTADO_COBRANZA"
											INTO   			:ll_rut,									:ls_glosa,										:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							 :ls_estado_cob  					
											FROM   "GESTION_COBRANZA",	"CADENA_MORA",	"GESTION_LISTA"
											WHERE	("GESTION_COBRANZA"."BASE" = :ls_base ) AND  
														("GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
														("GESTION_COBRANZA"."NUMERO" = :ldb_numero )  and
														("GESTION_COBRANZA"."BASE" = "CADENA_MORA"."BASE" ) AND  
														("GESTION_COBRANZA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
														("GESTION_COBRANZA"."NUMERO" = "CADENA_MORA"."NUMERO" )  and
														("GESTION_LISTA"."CODIGO" = "GESTION_COBRANZA"."CODIGO_GRUPO" )  and
														("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" >= :ldt_fec_ini ) AND
														("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" <= :ldt_fec_fin ) AND
														("GESTION_COBRANZA"."FECHA_COBRANZA" = :ldt_fec_gest ) AND
														("GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_codigo )
											USING	Trans_2;
										else
											SELECT DISTINCT "GESTION_COBRANZA"."RUT",	"GESTION_COBRANZA"."FECHA_COBRANZA",	"GESTION_COBRANZA"."GLOSA_COBRANZA",	"CADENA_MORA"."MORA_CRED",	"CADENA_MORA"."MORA_MANT",	"CADENA_MORA"."MORA_CRED_PIE",	 "GESTION_COBRANZA"."ESTADO_COBRANZA"
											INTO   			:ll_rut,									:ldt_fec_gest,							:ls_glosa,										:ll_mora_cred,   				:ll_mora_mant,					:ll_mora_pie,							 :ls_estado_cob  					
											FROM   "GESTION_COBRANZA",	"CADENA_MORA",	"GESTION_LISTA"
											WHERE	("GESTION_COBRANZA"."BASE" = :ls_base ) AND  
														("GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
														("GESTION_COBRANZA"."NUMERO" = :ldb_numero )  and
														("GESTION_COBRANZA"."BASE" = "CADENA_MORA"."BASE" ) AND  
														("GESTION_COBRANZA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
														("GESTION_COBRANZA"."NUMERO" = "CADENA_MORA"."NUMERO" )  and
														("GESTION_LISTA"."CODIGO" = "GESTION_COBRANZA"."CODIGO_GRUPO" )  and
														("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" >= :ldt_fec_ini ) AND
														("GESTION_LISTA"."FECHA_TERMINO_ASIGNACION" <= :ldt_fec_fin ) AND
														("GESTION_COBRANZA"."USUARIO_ASIGNADO" = :ls_codigo )
											USING	Trans_2;
										end if
									end if
								end if
								dw_lista.setitem(ll_new,'rut',ll_rut)
								dw_lista.setitem(ll_new,'glosa',ls_glosa)
								dw_lista.setitem(ll_new,'mora_cred', ll_mora_cred)
								dw_lista.setitem(ll_new,'mora_mant', ll_mora_mant)
								dw_lista.setitem(ll_new,'mora_pie', ll_mora_pie)
								dw_lista.setitem(ll_new,'fecha_ult_gestion', ldt_fec_gest)
								dw_lista.setitem(ll_new,'cod_gestion_telefonica', ls_estado_cob)
								dw_seleccion.setitem(1,'total_ingreso_caja',ldb_tot_ing)
								dw_seleccion.accepttext()
							end if
						end if
					end if
					Setnull(ldb_numero);Setnull(ls_base);Setnull(ls_serie);Setnull(ldt_fec_ini_asig);Setnull(ldt_fec_fin_asig)
					Setnull(ldb_mto);Setnull(ldb_mto_m);Setnull(ldb_mto_mora);Setnull(ldb_mto_gto_cob);Setnull(ldb_mto_dscto);Setnull(ldb_mto_pie)
					Setnull(ldb_mto_g_ad);Setnull(ldb_mto_int_rep);Setnull(ldb_mto_dif_ch);Setnull(ldb_mto_int_seg);Setnull(ls_tipo_mov_g)
					Setnull(ldb_mto_sum);Setnull(ls_tipo_mov);Setnull(ll_ctas_pag);Setnull(ll_ctas_pag_m);Setnull(ll_ctas_pag_pie)
					Setnull(ll_rut);Setnull(ls_glosa);Setnull(ll_mora_cred);Setnull(ll_mora_mant);Setnull(ll_mora_pie);Setnull(ldt_fec_gest);Setnull(ls_estado_cob)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text											= string(ldb_tot_porc,'#0.0#')+" %"
						ldb_tot_porc_aux									= ldb_tot_porc
					end if
					if ll_cta>0 then
						ldb_tot_porc											= (ll_new / ll_cta) * 100
					else
						ldb_tot_porc											= 1 * 100
					end if
					hpb_1.Position 											= ldb_tot_porc
					dw_lista.accepttext()
				LOOP
			end if
			close xage;
			dw_lista.accepttext()
			ll_tot_reg														= dw_lista.RowCount()
			dw_seleccion.setitem(1,'cantidad_ctto', ll_tot_reg)
			dw_seleccion.setitem(1,'total_ingreso_caja',ldb_tot_ing)
			dw_seleccion.setitem(1,'monto_pagar',ldb_mto_pago)
			dw_seleccion.setitem(1,'fecha_crea',gdt_fec_sistema)
			dw_seleccion.setitem(1,'fecha_cierre',ldt_fec_cierre)
			dw_seleccion.setitem(1,'fecha_fin',ldt_fec_cierre)
			st_fondo.visible													= false
			hpb_1.visible 													= false
			st_porc.visible 													= false
		else
			messagebox("Advertencia","No Registra Contratos Asignados")
		end if
	end if
end if
SetPointer(Arrow!)
end event

type dw_seleccion from datawindow within w_comision_telefonica
integer x = 50
integer y = 32
integer width = 3077
integer height = 280
integer taborder = 10
string dataobject = "dw_comision_telefonica"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_fecha
datetime	ldt_fec_fin,ldt_fec_ini

dw_seleccion.accepttext()
ls_columna								= dwo.name
is_evento								= 'clicked'
if ls_columna = 'p_1' then
	ls_fecha								= string(date(dw_seleccion.getitemdatetime(dw_seleccion.getrow(),'fecha_ini')))
	if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
	if f_valida_fecha(ls_fecha)=-1 then 
		dw_seleccion.setitem(dw_seleccion.getrow(),'fecha_ini',datetime(string(today(),gs_formato_fecha)))
		return
	end if
	OpenWithParm(w_calendar,ls_fecha)
	IF not isnull(Message.StringParm) THEN
		ls_fecha							= trim(Message.StringParm)
		ldt_fec_ini						= datetime(date(ls_fecha))
		ldt_fec_fin						= dw_seleccion.getitemdatetime(1,'fecha_fin')
		wf_valida_fecha(ldt_fec_ini,ldt_fec_fin)
	end if
elseif ls_columna = 'p_2' then
	ls_fecha										= string(date(dw_seleccion.getitemdatetime(dw_seleccion.getrow(),'fecha_fin')))
	if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
	if f_valida_fecha(ls_fecha)=-1 then 
		dw_seleccion.setitem(dw_seleccion.getrow(),'fecha_fin',datetime(string(today(),gs_formato_fecha)))
		return
	end if
	OpenWithParm(w_calendar,ls_fecha)
	IF not isnull(Message.StringParm) THEN
		ls_fecha							= trim(Message.StringParm)
		ldt_fec_ini						= dw_seleccion.getitemdatetime(1,'fecha_ini')
		ldt_fec_fin						= datetime(date(ls_fecha))
		wf_valida_fecha(ldt_fec_ini,ldt_fec_fin)
	end if
end if
dw_seleccion.accepttext()

end event

event itemchanged;string		ls_columna,ls_cod_eje,ls_cod_age,ls_est_age
long		ll_rut
datetime	ldt_fec_ini,ldt_fec_fin
double	ldb_porc_com

dw_seleccion.accepttext()
ls_columna										= dwo.name
is_evento										= 'itenchanged'
ldt_fec_ini										= dw_seleccion.getItemdatetime(1,'fecha_ini')
ldt_fec_fin										= dw_seleccion.getItemdatetime(1,'fecha_fin')
if ls_columna='cod_ejecutivo' then
	dw_seleccion.setitem(1,'porcentaje',0)
	dw_seleccion.setitem(1,'monto_pagar',0)
	dw_seleccion.setitem(1,'total_ingreso_caja',0)
	dw_seleccion.setitem(1,'cantidad_ctto',0)
	dw_seleccion.setitem(1,'cod_age','')
	dw_seleccion.setitem(1,'rut_age',0)
	dw_seleccion.setitem(1,'estado_age','')
	ls_cod_eje								= dw_seleccion.getitemstring(1,'cod_ejecutivo')
	if not isnull(ls_cod_eje) then
		SELECT 	"AGENTES"."COD_AGE",	"ENCARGADOS"."RUT",	"AGENTES"."ESTADO"
		INTO 		:ls_cod_age,				:ll_rut,						:ls_est_age  
		FROM		"AGENTES","ENCARGADOS"  
		WHERE	"AGENTES"."RUT" = "ENCARGADOS"."RUT" and  
					"ENCARGADOS"."CODIGO_USUARIO" = :ls_cod_eje
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ll_rut) and ll_rut>0 then
				is_pasa						= 'S'
				dw_seleccion.setitem(1,'cod_age',ls_cod_age)
				dw_seleccion.setitem(1,'rut_age',ll_rut)
				dw_seleccion.setitem(1,'estado_age',ls_est_age)
			else
				messagebox("Advertencia","Usuario No Registra Codigo Agente  ¡ Debe Comunicar Al Área de Informática !")
				is_pasa						= 'N'
			end if
		else
			messagebox("Advertencia","Usuario No Registra Codigo Agente  ¡ Debe Comunicar Al Área de Informática !")
			is_pasa							= 'N'
		end if
		idw_detalle.reset()
		idw_detalle.retrieve(ls_cod_eje)
		SELECT	"ENCARGADOS"."COMISION_TELEFONICA"  
		INTO 		:ldb_porc_com  
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_cod_eje   
		USING	sqlca;
		if isnull(ldb_porc_com) then ldb_porc_com=0
		dw_seleccion.setitem(1,'porcentaje',ldb_porc_com)
		dw_seleccion.setitem(1,'fecha_cierre',ldt_fec_fin)
		dw_seleccion.setitem(1,'estado_proceso','V')
		dw_lista.reset()
	end if	
elseif ls_columna = 'fecha_ini' or ls_columna = 'fecha_fin' then
	dw_seleccion.setitem(1,'monto_pagar',0)
	dw_seleccion.setitem(1,'total_ingreso_caja',0)
	dw_seleccion.setitem(1,'cantidad_ctto',0)
	//wf_valida_fecha(ldt_fec_ini,ldt_fec_fin)
	dw_lista.reset()
end if	
dw_seleccion.accepttext()
end event

event itemfocuschanged;string		ls_columna,ls_cod_eje,ls_cod_age,ls_est_age
long		ll_rut
datetime	ldt_fec_ini,ldt_fec_fin
double	ldb_porc_com

dw_seleccion.accepttext()
ls_columna										= dwo.name
is_evento										= 'itenchanged'
ldt_fec_ini										= dw_seleccion.getItemdatetime(1,'fecha_ini')
ldt_fec_fin										= dw_seleccion.getItemdatetime(1,'fecha_fin')
if ls_columna='cod_ejecutivo' then
	dw_seleccion.setitem(1,'porcentaje',0)
	dw_seleccion.setitem(1,'monto_pagar',0)
	dw_seleccion.setitem(1,'total_ingreso_caja',0)
	dw_seleccion.setitem(1,'cantidad_ctto',0)
	dw_seleccion.setitem(1,'cod_age','')
	dw_seleccion.setitem(1,'rut_age',0)
	ls_cod_eje								= dw_seleccion.getitemstring(1,'cod_ejecutivo')
	if not isnull(ls_cod_eje) then
		SELECT 	"AGENTES"."COD_AGE",	"ENCARGADOS"."RUT",	"AGENTES"."ESTADO"
		INTO 		:ls_cod_age,				:ll_rut,						:ls_est_age	 
		FROM		"AGENTES","ENCARGADOS"  
		WHERE	"AGENTES"."RUT" = "ENCARGADOS"."RUT" and  
					"ENCARGADOS"."CODIGO_USUARIO" = :ls_cod_eje
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ll_rut) and ll_rut>0 then
				is_pasa						= 'S'
				dw_seleccion.setitem(1,'cod_age',ls_cod_age)
				dw_seleccion.setitem(1,'rut_age',ll_rut)
				dw_seleccion.setitem(1,'estado_age',ls_est_age)
			else
				is_pasa						= 'N'
			end if
		else
			is_pasa							= 'N'
		end if
		idw_detalle.reset()
		idw_detalle.retrieve(ls_cod_eje)
		SELECT	"ENCARGADOS"."COMISION_TELEFONICA"  
		INTO 		:ldb_porc_com  
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_cod_eje   
		USING	sqlca;
		if isnull(ldb_porc_com) then ldb_porc_com=0
		dw_seleccion.setitem(1,'porcentaje',ldb_porc_com)
		dw_seleccion.setitem(1,'fecha_cierre',ldt_fec_fin)
		dw_seleccion.setitem(1,'estado_proceso','V')
		dw_lista.reset()
	end if	
elseif ls_columna = 'fecha_ini' or ls_columna = 'fecha_fin' then
	dw_seleccion.setitem(1,'monto_pagar',0)
	dw_seleccion.setitem(1,'total_ingreso_caja',0)
	dw_seleccion.setitem(1,'cantidad_ctto',0)
	//wf_valida_fecha(ldt_fec_ini,ldt_fec_fin)
end if	
dw_seleccion.accepttext()
end event

type st_fondo from statictext within w_comision_telefonica
boolean visible = false
integer x = 933
integer y = 964
integer width = 1659
integer height = 256
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

type dw_lista from datawindow within w_comision_telefonica
integer x = 37
integer y = 328
integer width = 3378
integer height = 1528
integer taborder = 30
string dataobject = "dw_comisiones_cod_telefonica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event itemchanged;String ls_columna


end event

