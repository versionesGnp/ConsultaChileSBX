forward
global type w_ingresar_contrato from window
end type
type cb_ver_cuenta from commandbutton within w_ingresar_contrato
end type
type p_1 from picture within w_ingresar_contrato
end type
type pb_buscar from picturebutton within w_ingresar_contrato
end type
type st_buscar from statictext within w_ingresar_contrato
end type
type dw_1 from datawindow within w_ingresar_contrato
end type
type cb_limpiar from picturebutton within w_ingresar_contrato
end type
type pb_print from picturebutton within w_ingresar_contrato
end type
type cb_borrar from picturebutton within w_ingresar_contrato
end type
type cb_insertar from picturebutton within w_ingresar_contrato
end type
type st_borrar_benef from statictext within w_ingresar_contrato
end type
type st_insert_benef from statictext within w_ingresar_contrato
end type
type cb_cerrar from picturebutton within w_ingresar_contrato
end type
type cb_aceptar from picturebutton within w_ingresar_contrato
end type
type dw_clientes from datawindow within w_ingresar_contrato
end type
type dw_beneficiarios from datawindow within w_ingresar_contrato
end type
type dw_ingreso_contrato from datawindow within w_ingresar_contrato
end type
type st_salir from statictext within w_ingresar_contrato
end type
type st_limpiar from statictext within w_ingresar_contrato
end type
type st_imprimir from statictext within w_ingresar_contrato
end type
type st_grabar from statictext within w_ingresar_contrato
end type
end forward

global type w_ingresar_contrato from window
integer x = 73
integer y = 48
integer width = 3447
integer height = 2456
boolean titlebar = true
string title = "Ingresar Contrato ISA"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_ver_cuenta cb_ver_cuenta
p_1 p_1
pb_buscar pb_buscar
st_buscar st_buscar
dw_1 dw_1
cb_limpiar cb_limpiar
pb_print pb_print
cb_borrar cb_borrar
cb_insertar cb_insertar
st_borrar_benef st_borrar_benef
st_insert_benef st_insert_benef
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_clientes dw_clientes
dw_beneficiarios dw_beneficiarios
dw_ingreso_contrato dw_ingreso_contrato
st_salir st_salir
st_limpiar st_limpiar
st_imprimir st_imprimir
st_grabar st_grabar
end type
global w_ingresar_contrato w_ingresar_contrato

type variables
Date	id_fecha_dia
Long	il_tipo_cliente=1,il_modif,il_modif_plazo,il_modif_fec
end variables

forward prototypes
public function double f_comision_age1 (string as_tipo_venta, string as_area, string as_uso)
public function double f_comision_sup1 (string as_area)
public function double f_comision_age2 (string as_tipo_sep, string as_area, integer an_capacidad, string as_uso)
public function integer f_tipo_contrato (string as_agente)
public subroutine wf_actualizar_contrato_isa ()
public subroutine wf_ingreso_nuevo_contrato_isa ()
public function boolean f_validar ()
public subroutine wf_log_contrato ()
public subroutine wf_limpiar ()
public function boolean f_cadena (integer ai_modo)
end prototypes

public function double f_comision_age1 (string as_tipo_venta, string as_area, string as_uso);double ld_porce_nf, ld_porce_ni

SELECT comisiones.porcent_nf,
	    comisiones.porcent_ni
INTO   :ld_porce_nf,
       :ld_porce_ni
FROM comisiones
WHERE (comisiones.tipo_venta = :as_tipo_venta) AND (comisiones.area_sepult = :as_area);

IF as_uso = "NF" THEN
	RETURN ld_porce_nf
ELSE
	RETURN ld_porce_ni
END IF

RETURN 0



end function

public function double f_comision_sup1 (string as_area);double ld_porce

SELECT comi_sup.com
INTO :ld_porce
FROM comi_sup
WHERE (comi_sup.area = :as_area);

RETURN ld_porce

end function

public function double f_comision_age2 (string as_tipo_sep, string as_area, integer an_capacidad, string as_uso);double ld_porce_nf, ld_porce_ni

SELECT "COMISIONES_INMOBI"."PORCE_NF",   
         "COMISIONES_INMOBI"."PORCE_NI"  
INTO   :ld_porce_nf,
       :ld_porce_ni
FROM "COMISIONES_INMOBI"  
WHERE ( "COMISIONES_INMOBI"."TIPO_SEP" = :as_tipo_sep ) AND  
      ( "COMISIONES_INMOBI"."AREA" = :as_area ) AND  
      ( "COMISIONES_INMOBI"."CAPACIDAD" = :an_capacidad );    

IF as_uso = "NF" THEN
	RETURN ld_porce_nf
ELSE
	RETURN ld_porce_ni
END IF

RETURN 0

end function

public function integer f_tipo_contrato (string as_agente);integer li_tipo_cont

SELECT "AGENTES"."TIPO_CONT"  
    INTO :li_tipo_cont
    FROM "AGENTES"  
   WHERE "AGENTES"."COD_AGE" = :as_agente;
	
RETURN li_tipo_cont


end function

public subroutine wf_actualizar_contrato_isa ();cb_aceptar.text 	= "Actualizar"
gi_rut 				= Long(dw_ingreso_contrato.GetItemNumber(1, "rut"))
if dw_clientes.retrieve(gi_rut)>0 then
	dw_ingreso_contrato.SetItem(1,"compute",upper(dw_clientes.GetItemstring(1,"dv")))
	dw_ingreso_contrato.setitem(1,'estado_rut',1)
else
	dw_ingreso_contrato.setitem(1,'estado_rut',0)
end if
dw_beneficiarios.retrieve(gs_serie,gi_numero)
end subroutine

public subroutine wf_ingreso_nuevo_contrato_isa ();long	ll_null
cb_aceptar.text 		= "Ingresar"
dw_beneficiarios.reset()
dw_ingreso_contrato.InsertRow(0)
dw_ingreso_contrato.SetItem(1, "serie_c", gs_serie)
dw_ingreso_contrato.SetItem(1, "nro_contrato", gi_numero)
dw_ingreso_contrato.SetItem(1, "fecha", id_fecha_dia)
dw_ingreso_contrato.SetItem(1, "rut", ll_null)
dw_ingreso_contrato.SetItem(1, "agente", gs_age)
dw_ingreso_contrato.SetItem(1, "valor_cuota_m", 0)
dw_ingreso_contrato.SetItem(1, "usuario", gs_user)
dw_ingreso_contrato.SetItem(1, "fechas_ingreso", id_fecha_dia)
dw_ingreso_contrato.setcolumn('serie')
end subroutine

public function boolean f_validar ();String	ls_moneda
Double	lld_kapital,lld_tasa,lld_valor_cuo,lld_valor_cuota_m,lld_pie

dw_ingreso_contrato.AcceptText()
dw_clientes.AcceptText()
ls_moneda	= dw_ingreso_contrato.getitemstring(1,'moneda')
lld_tasa		= double(dw_ingreso_contrato.getitemnumber(1,'tasa'))
if lld_tasa>100 then
	messagebox("Error","Valor Tasa Inválida")
	dw_ingreso_contrato.setfocus()
	dw_ingreso_contrato.setcolumn('tasa')
	RETURN FALSE
end if
if ls_moneda='2' then //uf
	lld_kapital				= double(dw_ingreso_contrato.getitemnumber(1,'kapital'))
	lld_valor_cuo			= double(dw_ingreso_contrato.getitemnumber(1,'valor_cuo'))
	lld_valor_cuota_m		= double(dw_ingreso_contrato.getitemnumber(1,'valor_cuota_m'))
	lld_pie					= double(dw_ingreso_contrato.getitemnumber(1,'pie'))
	if lld_kapital>=500 then 
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Precio)")
		dw_ingreso_contrato.setfocus()
		dw_ingreso_contrato.setcolumn('kapital')
		RETURN FALSE
	elseif lld_valor_cuo>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota)")
		dw_ingreso_contrato.setfocus()
		dw_ingreso_contrato.setcolumn('valor_cuo')
		RETURN FALSE
	elseif lld_valor_cuota_m>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota Mant.)")
		dw_ingreso_contrato.setfocus()
		dw_ingreso_contrato.setcolumn('valor_cuota_m')
		RETURN FALSE
	elseif lld_pie>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Pie)")
		dw_ingreso_contrato.setfocus()
		dw_ingreso_contrato.setcolumn('pie')
		RETURN FALSE
	end if
end if
IF IsNull(dw_ingreso_contrato.GetItemNumber(1, "rut")) THEN
	MessageBox("Error", "Debe ingresar el rut del cliente")
	dw_ingreso_contrato.setfocus()
	dw_ingreso_contrato.setcolumn('rut')
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "nombre")) THEN
	MessageBox("Error", "Debe ingresar nombre del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "a_paterno")) THEN
	MessageBox("Error", "Debe ingresar apellido paterno del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "a_materno")) THEN
	MessageBox("Error", "Debe ingresar apellido materno del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "direccion_p")) THEN
	MessageBox("Error", "Debe ingresar la dirección particular del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "comuna")) THEN
	MessageBox("Error", "Debe ingresar la comuna donde vive el cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "ciudad")) THEN
	MessageBox("Error", "Debe ingresar la ciudad donde vive el cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "sexo")) THEN
	MessageBox("Error", "Debe ingresar el sexo del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemDateTime(1, "fecha_nac")) THEN
	MessageBox("Error", "Debe ingresar la fecha de nacimiento del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "esta_civil")) THEN
	MessageBox("Error", "Debe ingresar el estado civil del cliente")
	RETURN FALSE
END IF
RETURN TRUE
end function

public subroutine wf_log_contrato ();String	ls_serie_c,ls_serie,ls_agente,ls_zona,ls_sector,ls_sepultura,ls_moneda,&
			ls_origen,ls_dueno
Long		ll_nro_contrato,ll_nro_pagare,ll_rut,ll_ubs,ll_parque,ll_nro_tec,&
			ll_capacidad,ll_plazo,ll_nro_resc,ll_cod_banco,ll_rut_aval,ll_cod_parque
Double	ll_kapital,ll_tasa,ll_valor_cuota_m,ll_pie,ll_valor_cuo
Datetime	ldt_fecha,ldt_fecha_ingreso,ldt_fecha_prim,ldt_fecha_ult,ldt_fec_restr,&
			ldt_la_primer_v,ldt_fecha_m,ldt_fecha_hoy
			
SELECT	sysdate  
INTO 		:gdt_fec_sistema
FROM 		"TASA"  ;
ldt_fecha_hoy		= gdt_fec_sistema
ls_serie_c			= dw_ingreso_contrato.getitemstring(1,'serie_c')
ls_serie				= dw_ingreso_contrato.getitemstring(1,'serie')
ls_agente			= dw_ingreso_contrato.getitemstring(1,'agente')
ls_zona				= dw_ingreso_contrato.getitemstring(1,'zona')
ls_sector			= dw_ingreso_contrato.getitemstring(1,'sector')
ls_sepultura		= dw_ingreso_contrato.getitemstring(1,'sepultura')
ls_moneda			= dw_ingreso_contrato.getitemstring(1,'moneda')
ls_origen			= dw_ingreso_contrato.getitemstring(1,'origen')
ls_dueno				= dw_ingreso_contrato.getitemstring(1,'dueno')

ll_nro_contrato	= dw_ingreso_contrato.getitemnumber(1,'nro_contrato')
ll_nro_pagare		= dw_ingreso_contrato.getitemnumber(1,'nro_pagare')
ll_rut				= dw_ingreso_contrato.getitemnumber(1,'rut')
ll_ubs				= dw_ingreso_contrato.getitemnumber(1,'ubs')
ll_parque			= dw_ingreso_contrato.getitemnumber(1,'parque')
ll_nro_tec			= dw_ingreso_contrato.getitemnumber(1,'nro_tec')
ll_capacidad		= dw_ingreso_contrato.getitemnumber(1,'capacidad')
ll_kapital			= dw_ingreso_contrato.getitemnumber(1,'kapital')
ll_plazo				= dw_ingreso_contrato.getitemnumber(1,'plazo')
ll_tasa				= dw_ingreso_contrato.getitemnumber(1,'tasa')
ll_valor_cuo		= dw_ingreso_contrato.getitemnumber(1,'valor_cuo')
ll_nro_resc			= dw_ingreso_contrato.getitemnumber(1,'nro_resc')
ll_cod_banco		= dw_ingreso_contrato.getitemnumber(1,'cod_banco')
ll_valor_cuota_m	= dw_ingreso_contrato.getitemnumber(1,'valor_cuota_m')
ll_pie				= dw_ingreso_contrato.getitemnumber(1,'pie')
ll_rut_aval			= dw_ingreso_contrato.getitemnumber(1,'rut_aval')
ll_cod_parque		= dw_ingreso_contrato.getitemnumber(1,'cadena_cod_parque')

ldt_fecha			= dw_ingreso_contrato.getitemdatetime(1,'fecha')
ldt_fecha_ingreso	= dw_ingreso_contrato.getitemdatetime(1,'fechas_ingreso')
ldt_fecha_prim		= dw_ingreso_contrato.getitemdatetime(1,'fecha_prim')
ldt_fecha_ult		= dw_ingreso_contrato.getitemdatetime(1,'fecha_ult')
ldt_fec_restr		= dw_ingreso_contrato.getitemdatetime(1,'fec_restr')
ldt_la_primer_v	= dw_ingreso_contrato.getitemdatetime(1,'la_primer_v')
ldt_fecha_m			= dw_ingreso_contrato.getitemdatetime(1,'fecha_m')

if isnull(ls_serie_c)			then ls_serie_c=' '
if isnull(ls_serie)				then ls_serie=' '
if isnull(ls_agente)				then ls_agente=' '
if isnull(ls_zona)				then ls_zona=' '
if isnull(ls_sector)				then ls_sector=' '
if isnull(ls_sepultura)			then ls_sepultura=' '
if isnull(ls_moneda)				then ls_moneda=' '
if isnull(ls_origen)				then ls_origen=' '
if isnull(ls_dueno)				then ls_dueno=' '
if isnull(ll_nro_contrato)		then ll_nro_contrato=0
if isnull(ll_nro_pagare) 		then ll_nro_pagare=0
if isnull(ll_rut) 				then ll_rut=0
if isnull(ll_ubs) 				then ll_ubs=0
if isnull(ll_parque) 			then ll_parque=0
if isnull(ll_nro_tec) 			then ll_nro_tec=0
if isnull(ll_capacidad) 		then ll_capacidad=0
if isnull(ll_plazo) 				then ll_plazo=0
if isnull(ll_nro_resc) 			then ll_nro_resc=0
if isnull(ll_cod_banco) 		then ll_cod_banco=0
if isnull(ll_rut_aval) 			then ll_rut_aval=0
if isnull(ll_kapital) 			then ll_kapital=0
if isnull(ll_tasa) 				then ll_tasa=0
if isnull(ll_valor_cuota_m)	then ll_valor_cuota_m=0
if isnull(ll_pie) 				then ll_pie=0
if isnull(ll_valor_cuo) 		then ll_valor_cuo=0
if isnull(ll_cod_parque) 		then ll_cod_parque=0
if isnull(ldt_fecha) 			then ldt_fecha=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_ingreso) 	then ldt_fecha_ingreso=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_prim) 		then ldt_fecha_prim=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_ult) 		then ldt_fecha_ult=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fec_restr) 		then ldt_fec_restr=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_la_primer_v) 	then ldt_la_primer_v=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_m) 			then ldt_fecha_m=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_hoy) 		then ldt_fecha_hoy=datetime(date("01/01/1900"),time("00:00:00"))

INSERT INTO "LOG_CONTRATO_ISA"  
			( "SERIE_C",   "NRO_CONTRATO",   "SERIE",   "NRO_PAGARE",   "RUT",   "FECHA",   "FECHA_CREA",   "USUARIO_CREA",   "AGENTE",   "UBS",   "PARQUE",   "ZONA",   "SECTOR",   "SEPULTURA",   "NRO_TEC",   "CAPACIDAD",   "FECHA_INGRESO",   "MONEDA",   "KAPITAL",   "PLAZO",   "TASA",   "VALOR_CUO",   "ORIGEN",   "FECHA_PRIM",   "FECHA_ULT",   "DUENO",   "FEC_RESTR",   "NRO_RESC",   "COD_BANCO",   "LA_PRIMER_V",   "VALOR_CUOTA_M",   "FECHA_M",   "PIE",   "RUT_AVAL",	"COD_PARQUE" )  
VALUES 	( :ls_serie_c, :ll_nro_contrato, :ls_serie, :ll_nro_pagare, :ll_rut, :ldt_fecha,:ldt_fecha_hoy, :gs_user,   		:ls_agente, :ll_ubs, :ll_parque, :ls_zona, :ls_sector, :ls_sepultura, :ll_nro_tec, :ll_capacidad, :ldt_fecha_ingreso,:ls_moneda, :ll_kapital, :ll_plazo, :ll_tasa, :ll_valor_cuo, :ls_origen, :ldt_fecha_prim,:ldt_fecha_ult,:ls_dueno, :ldt_fec_restr,:ll_nro_resc, :ll_cod_banco, :ldt_la_primer_v,:ll_valor_cuota_m, :ldt_fecha_m,:ll_pie, :ll_rut_aval,	:ll_cod_parque )  
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if


end subroutine

public subroutine wf_limpiar ();long	ll_null
cb_aceptar.text 		= "Ingresar"
dw_ingreso_contrato.reset()
dw_beneficiarios.reset()
dw_clientes.reset()
dw_ingreso_contrato.getchild('serie_c',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.retrieve('C')
end if
dw_ingreso_contrato.getchild('serie',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.retrieve('P')
end if
dw_ingreso_contrato.getchild('sector',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.rowcount()=0 then
	idw_detalle3.insertrow(0)
end if
dw_clientes.InsertRow(0)
dw_ingreso_contrato.InsertRow(0)
dw_ingreso_contrato.SetItem(1, "serie_c", gs_serie)
dw_ingreso_contrato.SetItem(1, "nro_contrato", gi_numero)
dw_ingreso_contrato.SetItem(1, "fecha", id_fecha_dia)
dw_ingreso_contrato.SetItem(1, "agente", gs_age)
dw_ingreso_contrato.SetItem(1, "rut", ll_null)
dw_ingreso_contrato.SetItem(1, "valor_cuota_m", 0)
dw_ingreso_contrato.SetItem(1, "usuario", gs_user)
dw_ingreso_contrato.SetItem(1, "fechas_ingreso", id_fecha_dia)
dw_ingreso_contrato.setfocus()
end subroutine

public function boolean f_cadena (integer ai_modo);string 	ls_barra,ls_agente

ls_barra 		= 'C' + gs_serie + String(gi_numero)
ls_agente		= dw_ingreso_contrato.getitemstring(1,'agente')
gl_cod_parque	= dw_ingreso_contrato.getitemnumber(1,'cadena_cod_parque')
if isnull(gl_cod_parque) or gl_cod_parque=0 then
	SELECT	"AGENTES"."COD_PARQUE"  
	INTO 		:gl_cod_parque  
	FROM 		"AGENTES"  
	WHERE 	"AGENTES"."COD_AGE" = :ls_agente   
	USING		sqlca;
	if sqlca.sqlcode<>0 then gl_cod_parque	= 0
end if
IF ai_modo = 0 THEN // Es un Insert
	INSERT INTO		cadena
					(  barra,		rut,  	codigo, 	serie, 		numero, 		estado, 	print,	est_cup,	nro_carta,	fecha_carta,	estado_carta,	fecha_act_estado,	cuota_cupon,	fecha_res,	a_demandar,	estado_contable,	estado_titulo,	fecha_titulo,	nro_carta_m,	fecha_carta_m,	estado_carta_m,	fecha_act_estado_m,	cod_parque)
	VALUES 		(	:ls_barra, :gi_rut,	'C',		:gs_serie,	:gi_numero,	'V',		'N',		'0',		'SC',			Null,				'0',				Null,					0,					Null,			'0',			'A',					'N',				Null,				'SC',				Null,				'0', 					Null,						:gl_cod_parque)
	USING		sqlca;
	RETURN (SQLCA.SQLCode <> -1)
ELSE
	// Update
	UPDATE	"CADENA"  
   SET 		"COD_PARQUE" = :gl_cod_parque 
   WHERE  ( "CADENA"."CODIGO" = 'C' ) AND  
          ( "CADENA"."SERIE" = :gs_serie ) AND  
          ( "CADENA"."NUMERO" = :gi_numero )   
	USING		sqlca;
	RETURN (SQLCA.SQLCode <> -1)
END IF
end function

on w_ingresar_contrato.create
this.cb_ver_cuenta=create cb_ver_cuenta
this.p_1=create p_1
this.pb_buscar=create pb_buscar
this.st_buscar=create st_buscar
this.dw_1=create dw_1
this.cb_limpiar=create cb_limpiar
this.pb_print=create pb_print
this.cb_borrar=create cb_borrar
this.cb_insertar=create cb_insertar
this.st_borrar_benef=create st_borrar_benef
this.st_insert_benef=create st_insert_benef
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_clientes=create dw_clientes
this.dw_beneficiarios=create dw_beneficiarios
this.dw_ingreso_contrato=create dw_ingreso_contrato
this.st_salir=create st_salir
this.st_limpiar=create st_limpiar
this.st_imprimir=create st_imprimir
this.st_grabar=create st_grabar
this.Control[]={this.cb_ver_cuenta,&
this.p_1,&
this.pb_buscar,&
this.st_buscar,&
this.dw_1,&
this.cb_limpiar,&
this.pb_print,&
this.cb_borrar,&
this.cb_insertar,&
this.st_borrar_benef,&
this.st_insert_benef,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_clientes,&
this.dw_beneficiarios,&
this.dw_ingreso_contrato,&
this.st_salir,&
this.st_limpiar,&
this.st_imprimir,&
this.st_grabar}
end on

on w_ingresar_contrato.destroy
destroy(this.cb_ver_cuenta)
destroy(this.p_1)
destroy(this.pb_buscar)
destroy(this.st_buscar)
destroy(this.dw_1)
destroy(this.cb_limpiar)
destroy(this.pb_print)
destroy(this.cb_borrar)
destroy(this.cb_insertar)
destroy(this.st_borrar_benef)
destroy(this.st_insert_benef)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_clientes)
destroy(this.dw_beneficiarios)
destroy(this.dw_ingreso_contrato)
destroy(this.st_salir)
destroy(this.st_limpiar)
destroy(this.st_imprimir)
destroy(this.st_grabar)
end on

event open;long 		ll_cant
String	ls_opcion_dig

gf_centrar(w_ingresar_contrato)
if gs_conexion = "Parque El Prado" then
	if gl_cod_parque=1 then
		p_1.picturename 	= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 	= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	else
		p_1.picturename 	= 'logo_e.bmp'
	end if
elseif gs_conexion = "Parque La Foresta" then
	p_1.picturename 	= 'logo_e_s.bmp'
elseif gs_conexion = "Parque Santiago" then
	p_1.picturename 	= 'logo_parque_stgo.bmp'
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 	= 'logo_parque_conce.jpg'
end if
SELECT	"ENCARGADOS"."DIGITACION"
INTO 		:ls_opcion_dig
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	if ls_opcion_dig='1' or ls_opcion_dig='3'then 
		cb_aceptar.enabled	= true
	elseif ls_opcion_dig='2' then
		cb_aceptar.enabled	= false
	else
		cb_aceptar.enabled	= false
	end if
end if
gs_base							= 'C'
id_fecha_dia					= date(gdt_fec_sistema)
SELECT 	"TAB_UF"."VALOR_UF"  
INTO 		:gd_uf_dia  
FROM 	"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha_dia;
IF gd_uf_dia = 0 or isnull(gd_uf_dia) THEN 
	messagebox("Advertencia","No se Registra U.F. del día "+string(id_fecha_dia))
	Open(w_mantenedor_uf)
end if
SELECT 	"TAB_UF"."VALOR_UF"  
INTO 		:gd_uf_dia
FROM 	"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha_dia
using		sqlca;
if sqlca.sqlcode<>0 then
	close(w_ingresar_contrato)
else
	dw_clientes.SetTransObject(SQLCA)
	dw_ingreso_contrato.SetTransObject(SQLCA)
	dw_beneficiarios.SetTransObject(SQLCA)
	dw_1.SetTransObject(SQLCA)
	
	dw_ingreso_contrato.getchild('serie_c',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.rowcount()=0 then
		idw_detalle.retrieve('C')
	end if
	dw_ingreso_contrato.getchild('serie',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.rowcount()=0 then
		idw_detalle2.retrieve('P')
	end if
	dw_ingreso_contrato.getchild('sector',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.rowcount()=0 then
		idw_detalle3.insertrow(0)
	end if
	cb_limpiar.triggerevent(clicked!)
	IF dw_ingreso_contrato.Retrieve(gs_serie,gi_numero) = 0 THEN
		wf_ingreso_nuevo_contrato_isa()
	ELSE
		wf_actualizar_contrato_isa()
	END IF
	ll_cant = dw_beneficiarios.Retrieve(gs_serie,gi_numero)
	dw_ingreso_contrato.setfocus()
	dw_ingreso_contrato.setcolumn('serie_c')
end if
end event

event mousemove;//st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
end event

type cb_ver_cuenta from commandbutton within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 2085
integer y = 2160
integer width = 539
integer height = 152
integer taborder = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "C&uenta corriente"
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

event clicked;IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
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
		CASE "F","G"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
END IF
end event

type p_1 from picture within w_ingresar_contrato
integer x = 23
integer y = 24
integer width = 261
integer height = 236
string picturename = "logo_e.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 1061
integer y = 2160
integer width = 174
integer height = 152
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.BMP"
string disabledname = "Buscar.BMP"
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible			= false
st_buscar.visible				= true
end event

event clicked;openwithparm(w_listado_contrato,'C')
end event

type st_buscar from statictext within w_ingresar_contrato
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1033
integer y = 2092
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Buscar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible			= false
st_buscar.visible				= false
end event

type dw_1 from datawindow within w_ingresar_contrato
boolean visible = false
integer x = 549
integer y = 2272
integer width = 411
integer height = 432
integer taborder = 70
string dataobject = "d_ingreso_contrato_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_limpiar from picturebutton within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 1573
integer y = 2160
integer width = 174
integer height = 152
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "trash.bmp"
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= true
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

event clicked;setnull(gs_serie);setnull(gi_numero);setnull(gs_base);setnull(gi_rut);setnull(gs_age)
setnull(gs_sup);setnull(gs_jefe);setnull(gl_cod_parque)
wf_limpiar()
end event

type pb_print from picturebutton within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 549
integer y = 2160
integer width = 174
integer height = 152
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Print.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= true
st_buscar.visible			= false
end event

event clicked;String	ls_serie
Long		ll_numero

ls_serie		= dw_ingreso_contrato.getitemstring(1,'serie_c')
ll_numero	= dw_ingreso_contrato.getitemnumber(1,'nro_contrato')
if not isnull(ls_serie) and ll_numero>0 then
	if dw_1.retrieve(ls_serie,ll_numero) > 0 then f_Print( dw_1 )
end if
end event

type cb_borrar from picturebutton within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 1019
integer y = 1904
integer width = 174
integer height = 152
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Borrar_on.bmp"
string disabledname = "Borrar_off.bmp"
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= true
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

event clicked;IF dw_beneficiarios.GetRow() > 0 and dw_beneficiarios.rowcount()>0 THEN
	dw_beneficiarios.DeleteRow(dw_beneficiarios.GetRow())
END IF
end event

type cb_insertar from picturebutton within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 1019
integer y = 1728
integer width = 174
integer height = 152
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Insertar_on.bmp"
string disabledname = "Insertar_off.bmp"
end type

event ue_mousemove;st_insert_benef.visible	= true
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

event clicked;long 		ll_fila, ll_contador,ll_tot_reg,ll_indi
String	ls_nombre,ls_a_pat,ls_a_mat,ls_sw_pasa='N'
if dw_ingreso_contrato.getitemnumber(1,'estado_contrato')=1 and dw_ingreso_contrato.getitemnumber(1,'estado_rut')=1 then
	ll_tot_reg				= dw_beneficiarios.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_nombre		= trim(dw_beneficiarios.getitemstring(ll_indi,'nombres'))
			ls_a_pat			= trim(dw_beneficiarios.getitemstring(ll_indi,'apaterno'))
			ls_a_mat			= trim(dw_beneficiarios.getitemstring(ll_indi,'amaterno'))
			if isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre Beneficiario en Fila Nº "+string(ll_indi))
				dw_beneficiarios.setfocus()
				dw_beneficiarios.scrolltorow(ll_indi)
				dw_beneficiarios.setcolumn('nombres')
				ls_sw_pasa	= 'S'
				ll_indi		= ll_tot_reg
			elseif isnull(ls_a_pat) or ls_a_pat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno Beneficiario en Fila Nº "+string(ll_indi))
				dw_beneficiarios.setfocus()
				dw_beneficiarios.scrolltorow(ll_indi)
				dw_beneficiarios.setcolumn('apaterno')
				ls_sw_pasa	= 'S'
				ll_indi		= ll_tot_reg
			elseif isnull(ls_a_mat) or ls_a_mat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno Beneficiario en Fila Nº "+string(ll_indi))
				dw_beneficiarios.setfocus()
				dw_beneficiarios.scrolltorow(ll_indi)
				dw_beneficiarios.setcolumn('amaterno')
				ls_sw_pasa	= 'S'
				ll_indi		= ll_tot_reg
			end if
		next
	end if
	if ls_sw_pasa='N' then	
		ll_fila		= dw_beneficiarios.InsertRow(0)
		dw_beneficiarios.setfocus()
		dw_beneficiarios.scrolltorow(ll_fila)
		ll_contador = 0
		dw_beneficiarios.SetItem(ll_fila, "serie", gs_serie)
		dw_beneficiarios.SetItem(ll_fila, "numero", gi_numero)
		dw_beneficiarios.SetItem(ll_fila, "linea", ll_contador)
		dw_beneficiarios.SetItem(ll_fila, "base", gs_base)
		dw_beneficiarios.setcolumn('nombres')
	end if
end if
end event

type st_borrar_benef from statictext within w_ingresar_contrato
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 864
integer y = 1836
integer width = 489
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Eliminar Beneficiario"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

type st_insert_benef from statictext within w_ingresar_contrato
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 864
integer y = 1660
integer width = 489
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Insertar Beneficiario"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

type cb_cerrar from picturebutton within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 3182
integer y = 2160
integer width = 174
integer height = 152
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= true
st_imprimir.visible		= false
st_buscar.visible			= false
end event

event clicked;close(w_ingresar_contrato)
end event

type cb_aceptar from picturebutton within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 2160
integer width = 174
integer height = 152
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar.bmp"
string disabledname = "grabar_no.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= true
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

event clicked;long 		ll_contador,rut_busca,rut,ll_tot_reg_ben,li_ret1, li_ret2,li_ret4, i,ll_estado_cd,&
			ll_estado_graba,ll_plazo,ll_rut,ll_cod_parque, ll_count_vig
double 	ld_porcent_age, ld_porcent_sup,ldb_valor_cuota,ldb_valor_cuota_mant
String	ls_depto_asignado,ls_glosa,ls_memo,ls_ref,ls_age,ls_sup,ls_jefe,ls_dv,ls_estado_cadena,&
			ls_moneda,ls_modif
Datetime	ldt_fecha_hoy,ldt_fecha_prim,ldt_fec_venc_mant


dw_ingreso_contrato.accepttext()
dw_beneficiarios.accepttext()
SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 		"TASA"  ;
if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 and gi_rut>0 then
	gl_cod_parque	= dw_ingreso_contrato.GetItemNumber(1,"cadena_cod_parque")
	if isnull(gl_cod_parque) or gl_cod_parque=0 then
		messagebox('Advertencia','Debe Ingresar Código Parque',stopsign!)
		dw_ingreso_contrato.setfocus()
		dw_ingreso_contrato.setcolumn('cadena_cod_parque')
		return
	end if
	if STRING(dw_ingreso_contrato.getitemstring(1,'compute')) <> STRING(gf_obtener_dv(long(dw_ingreso_contrato.GetItemNumber(1, "rut")))) then
		messagebox('Error','El Rut no es valido',stopsign!)
		dw_ingreso_contrato.setfocus()
		dw_ingreso_contrato.SetColumn('rut')
		return
	end if
	ldb_valor_cuota_mant	= dw_ingreso_contrato.getitemnumber(1,'valor_cuota_m')
	if isnull(ldb_valor_cuota_mant) or ldb_valor_cuota_mant=0 then
		messagebox('Error','Debe Ingresar Cuota Mantención',stopsign!)
		dw_ingreso_contrato.setfocus()
		dw_ingreso_contrato.SetColumn('valor_cuota_m')
		return
	end if
	ldt_fec_venc_mant		= dw_ingreso_contrato.getitemdatetime(1,'fecha_m')
	if isnull(ldt_fec_venc_mant) then
		messagebox('Error','Debe Ingresar Fecha Mantención',stopsign!)
		dw_ingreso_contrato.setfocus()
		dw_ingreso_contrato.SetColumn('fecha_m')
		return
	end if
	IF MessageBox("Grabar", "Desea Actualizar los datos ingresados ?", Question!, YesNo!,2) = 1 THEN		
		li_ret1 			= dw_ingreso_contrato.Update()
		ll_tot_reg_ben	= dw_beneficiarios.RowCount()
		FOR i=1 to ll_tot_reg_ben	
			IF dw_beneficiarios.GetItemNumber(i, "linea") = 0 THEN
				gf_contador_co_prop_isa(ll_contador)
				dw_beneficiarios.SetItem(i, "linea", (ll_contador + (i - 1)))
			END IF
		NEXT
		li_ret2			= dw_beneficiarios.Update()
		rut 				= dw_ingreso_contrato.getitemnumber(1,'rut')	
		IF li_ret1 = 1 AND li_ret2 = 1 THEN
			IF f_validar() THEN
				IF cb_aceptar.text = "Actualizar" THEN
					// Update
					IF Not(f_cadena(1)) THEN
						MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
						rollback using SQLCA;
						RETURN
					END IF
				ELSE
					// Insert
					IF Not(f_cadena(0)) THEN
						MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
						rollback using SQLCA;
						RETURN
					END IF
				END IF
			END IF	
			// grabar
			Commit using SQLCA;
			wf_log_contrato()
			UPDATE	"CLIENTE"  
			SET 		"ESTADO_COBRANZA" = '0'   
			WHERE 	"CLIENTE"."RUT" = :rut   
			USING		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			
			ll_plazo					= dw_ingreso_contrato.getitemnumber(1,'plazo')
			ll_rut					= dw_ingreso_contrato.getitemnumber(1,'rut')
			ldb_valor_cuota		= dw_ingreso_contrato.getitemnumber(1,'valor_cuo')
			ldt_fecha_prim			= dw_ingreso_contrato.getitemdatetime(1,'fecha_prim')
			ldt_fec_venc_mant		= dw_ingreso_contrato.getitemdatetime(1,'fecha_m')
			ldb_valor_cuota_mant	= dw_ingreso_contrato.getitemnumber(1,'valor_cuota_m')
			ls_dv						= dw_ingreso_contrato.getitemstring(1,'compute')
			ll_cod_parque			= dw_ingreso_contrato.getitemnumber(1,'cadena_cod_parque')
			ls_moneda				= dw_ingreso_contrato.getitemstring(1,'moneda')
			Setnull(ldb_valor_cuota);Setnull(ldt_fecha_prim)
			SELECT	"CADENA"."ESTADO"  
			INTO 		:ls_estado_cadena  
			FROM 		"CADENA"  
			WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
					 ( "CADENA"."SERIE" = :gs_serie ) AND  
					 ( "CADENA"."NUMERO" = :gi_numero )   
			USING		sqlca;
			if ls_estado_cadena='V' then
				SELECT	"CUPONERAS"."NUMERO"  
				INTO 		:ll_count_vig  
				FROM 		"CUPONERAS"  
				WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
						 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
						 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
						 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if il_modif > 1 or il_modif_fec > 1 or il_modif_plazo > 1 then
						if il_modif > 1 then
							ls_modif	= 'F'
						elseif il_modif_fec > 1 then
							ls_modif	= 'M'
						elseif il_modif_plazo > 1 then
							ls_modif	= 'P'
						end if
						SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
						INTO 		:ldt_fec_venc_mant  
						FROM 		"CADENA_MORA"  
						WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
								 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
								 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
						USING		sqlca;
						INSERT INTO "CUPONERAS_MODIFICA"  
									( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",		"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",		"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",		"MONEDA",	"TIPO_MODIFICACION" )
						VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_plazo,	:ll_rut,	:ls_dv,	:ldb_valor_cuota,		:ldb_valor_cuota_mant,	:ll_cod_parque,	:ldt_fecha_prim,	:ldt_fec_venc_mant,	:ls_moneda,	:ls_modif )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							DECLARE sp_nuevo_cadena_mora1 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
					      EXECUTE sp_nuevo_cadena_mora1;
							
							DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda, :ls_modif );
							EXECUTE sp_proc_modifica_cuponera;
						else
							rollback;
						end if
					end if
				elseif sqlca.sqlcode=100 then
					DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'N');
					EXECUTE sp_nuevo_cadena_mora;
					
					DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda );
					EXECUTE sp_proc_genera_cuponera;
				end if
			end if
			if messagebox("Grabar","Grabación Exitosa, desea ingresar otro Contrato IsaCruz", Question!, YesNo!, 2) = 1 THEN
				cb_limpiar.triggerevent(clicked!)
			else
				cb_aceptar.text 	= "Actualizar"
			END IF
		else
			rollback;
			messagebox("Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
		end if
	END IF
end if
end event

type dw_clientes from datawindow within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 444
integer width = 3355
integer height = 572
integer taborder = 50
string dataobject = "d_ingreso_clientes"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

event losefocus;//string ls_columna
//
//ls_columna = This.GetColumnName()
//
//If ls_columna = "grupo_f" THEN
//	dw_oferta_v.SetColumn("tipo_venta")
//END IF
end event

event doubleclicked;String	ls_string
gi_rut		= this.getitemnumber(1,'rut')
ls_string	= 'M'+'~t'+string(il_tipo_cliente)
if gi_rut>0 then openwithparm(w_ingreso_cliente,ls_string) 

end event

type dw_beneficiarios from datawindow within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 1285
integer y = 1660
integer width = 2080
integer height = 456
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_ingreso_co_prop_isa"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

type dw_ingreso_contrato from datawindow within w_ingresar_contrato
event ue_mousemove pbm_mousemove
integer x = 18
integer y = 24
integer width = 3378
integer height = 2116
integer taborder = 10
string dataobject = "d_ingreso_contrato"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

event itemchanged;long 		ll_cant, ll_fila,ll_resp,ll_dias_tope_def,ll_dias_inicio_def
Date		ld_fecha_prim,ld_fecha_min
string 	ls_columna,ls_dv,ls_serie,ls_area,ls_moneda,ls_agente,ls_string
Double	lld_kapital,lld_valor_cuo,lld_valor_cuota_m,lld_pie,lld_valor_uf,lld_tasa

SELECT	sysdate,	"TASA"."DIAS_TOPE_REPACTA",	"TASA"."DIAS_INICIO_REPACTA"  INTO :gdt_fec_sistema,	:ll_dias_tope_def,			:ll_dias_inicio_def
FROM 	"TASA"  ;

AcceptText()
ls_columna	= GetColumnName()
if ls_columna='serie' then
	ls_serie	= this.getitemstring(1,'serie')
	if len(ls_serie)=1 then this.setcolumn('nro_pagare')
end if
if ls_columna = 'cadena_cod_parque' then
	gl_cod_parque	= dw_ingreso_contrato.getitemnumber(1,'cadena_cod_parque')
	
end if
if ls_columna='agente' then
	ls_agente		= dw_ingreso_contrato.getitemstring(1,'agente')
	SELECT	"AGENTES"."COD_PARQUE"  
	INTO 		:gl_cod_parque  
	FROM 		"AGENTES"  
	WHERE 	"AGENTES"."COD_AGE" = :ls_agente   
	USING		sqlca;
	if sqlca.sqlcode<>0 then
		messagebox("Advertencia","No posee PARQUE Asociado, Verifique Código")
		dw_ingreso_contrato.setfocus()
		dw_ingreso_contrato.setcolumn('cadena_cod_parque')
	else
		dw_ingreso_contrato.setitem(1,'cadena_cod_parque',gl_cod_parque)
		dw_ingreso_contrato.accepttext()
	end if
end if
if ls_columna='fecha_prim' then
	ld_fecha_prim	= date(dw_ingreso_contrato.getitemdatetime(1,'fecha_prim'))
	ld_fecha_min	= RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1))
	if ld_fecha_prim < ld_fecha_min then
		messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
		dw_ingreso_contrato.setitem(1,'fecha_prim',date(gdt_fec_sistema))
		dw_ingreso_contrato.accepttext()
	end if
end if
if ls_columna= 'serie_c' or ls_columna='nro_contrato' then
	if ls_columna='serie_c' then
		ls_serie	= this.getitemstring(1,'serie_c')
		if len(ls_serie)=1 then this.setcolumn('nro_contrato')
	end if
	gs_base		= 'C'
	gs_serie		= this.getitemstring(1,'serie_c') 
	gi_numero	= this.getitemnumber(1,'nro_contrato')
	if not isnull(gs_serie) and not isnull(gi_numero) and gi_numero>0 then
		dw_beneficiarios.reset()
		if dw_ingreso_contrato.retrieve(gs_serie,gi_numero)>0 then
			cb_aceptar.text		= "Actualizar"
			gi_rut					= dw_ingreso_contrato.getitemnumber(1,'rut')
			dw_ingreso_contrato.setitem(1,'estado_contrato',1)
			if isnull(dw_ingreso_contrato.getitemstring(1,'usuario')) then dw_ingreso_contrato.setitem(1,'usuario',gs_user)
			wf_actualizar_contrato_isa()
		else
			dw_ingreso_contrato.insertrow(0)
			dw_ingreso_contrato.SetItem(1, "serie_c", gs_serie)
			dw_ingreso_contrato.SetItem(1, "nro_contrato", gi_numero)
			ll_resp 				= MessageBox("Advertencia", "Contrato IsaCruz NO Existe, desea Ingresarlo", &
									  Exclamation!, YesNo!, 2)
			IF ll_resp = 1 THEN
				dw_ingreso_contrato.reset()
				wf_ingreso_nuevo_contrato_isa()
				dw_ingreso_contrato.setitem(1,'estado_contrato',1)
				dw_ingreso_contrato.setfocus()
				dw_ingreso_contrato.setcolumn('serie')
			else
				dw_ingreso_contrato.setitem(1,'estado_contrato',0)
			end if
		end if
	end if
end if
IF ls_columna = "rut" THEN
	gi_rut	= Long(GetItemNumber(1, "rut"))
	ll_cant	= dw_clientes.Retrieve(gi_rut)
	IF ll_cant = 0 THEN
		dw_clientes.insertrow(0)
		ll_resp 				= MessageBox("Advertencia", "Cliente NO Existe, desea Ingresarlo", &
					  			  Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			ls_string	= 'N'+'~t'+string(il_tipo_cliente)
			if gi_rut>0 then openwithparm(w_ingreso_cliente,ls_string) 
		else
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('rut')
		END IF
	else
		ls_dv					= dw_clientes.getitemstring(1,'dv')
		dw_ingreso_contrato.setitem(1, 'compute', ls_dv)
		dw_ingreso_contrato.setitem(1,'estado_rut',1)
	end if 
end if
IF ls_columna = "compute" THEN
	if String(getitemstring(1,'compute')) <> String(gf_obtener_dv(long(GetItemNumber(1, "rut")))) then
		messagebox('Error','El Rut no es valido',stopsign!)
		this.setfocus()
		this.SetColumn('rut')
	end if
end if
if ls_columna='zona' then
	ls_area	= this.getitemstring(1,'zona')
	if not isnull(ls_area) and ls_area<>'' then
		dw_ingreso_contrato.getchild('sector',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		idw_detalle3.retrieve(ls_area)
	end if
end if
if ls_columna='kapital' or ls_columna='tasa' or ls_columna='valor_cuo' or ls_columna='valor_cuota_m' or ls_columna='pie' then
	ls_moneda	= this.getitemstring(1,'moneda')
	lld_tasa		= double(dw_ingreso_contrato.getitemnumber(1,'tasa'))
	if lld_tasa>100 then
		messagebox("Error","Valor Tasa Inválida")
		dw_ingreso_contrato.setfocus()
		dw_ingreso_contrato.setcolumn('tasa')
	end if
	if ls_moneda='2' then //uf
		lld_kapital				= double(dw_ingreso_contrato.getitemnumber(1,'kapital'))
		lld_valor_cuo			= double(dw_ingreso_contrato.getitemnumber(1,'valor_cuo'))
		lld_valor_cuota_m		= double(dw_ingreso_contrato.getitemnumber(1,'valor_cuota_m'))
		lld_pie					= double(dw_ingreso_contrato.getitemnumber(1,'pie'))
		if lld_kapital>=500 then 
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Precio)")
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('kapital')
		elseif lld_valor_cuo>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota)")
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('valor_cuo')
		elseif lld_valor_cuota_m>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota Mant.)")
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('valor_cuota_m')
		elseif lld_pie>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Pie)")
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('pie')
		end if
	end if
end if
if ls_columna='valor_cuota_m' then
	SELECT	COUNT("LOG_CONTRATO_ISA"."NRO_CONTRATO")  
	INTO 		:il_modif  
	FROM 		"LOG_CONTRATO_ISA"  
	WHERE  ( "LOG_CONTRATO_ISA"."SERIE_C" = :gs_serie ) AND  
			 ( "LOG_CONTRATO_ISA"."NRO_CONTRATO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='plazo' then
	SELECT	COUNT("LOG_CONTRATO_ISA"."NRO_CONTRATO")  
	INTO 		:il_modif_plazo  
	FROM 		"LOG_CONTRATO_ISA"  
	WHERE  ( "LOG_CONTRATO_ISA"."SERIE_C" = :gs_serie ) AND  
			 ( "LOG_CONTRATO_ISA"."NRO_CONTRATO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='fecha_m' then
	SELECT	COUNT("LOG_CONTRATO_ISA"."NRO_CONTRATO")  
	INTO 		:il_modif_fec  
	FROM 		"LOG_CONTRATO_ISA"  
	WHERE  ( "LOG_CONTRATO_ISA"."SERIE_C" = :gs_serie ) AND  
			 ( "LOG_CONTRATO_ISA"."NRO_CONTRATO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='moneda' then
	ls_moneda				= dw_ingreso_contrato.getitemstring(1,'moneda')
	lld_kapital				= double(dw_ingreso_contrato.getitemnumber(1,'kapital'))
	lld_tasa					= double(dw_ingreso_contrato.getitemnumber(1,'tasa'))
	lld_valor_cuo			= double(dw_ingreso_contrato.getitemnumber(1,'valor_cuo'))
	lld_valor_cuota_m		= double(dw_ingreso_contrato.getitemnumber(1,'valor_cuota_m'))
	lld_pie					= double(dw_ingreso_contrato.getitemnumber(1,'pie'))
//	gd_uf_dia
	if gd_uf_dia>0 then
		if ls_moneda='1' then //peso
			if lld_kapital<500 then 
				dw_ingreso_contrato.setitem(1,'kapital',(lld_kapital * gd_uf_dia))
			end if
			if lld_valor_cuo<500 then
				dw_ingreso_contrato.setitem(1,'valor_cuo',(lld_valor_cuo * gd_uf_dia))
			end if
			if lld_valor_cuota_m<500 then
				dw_ingreso_contrato.setitem(1,'valor_cuota_m',(lld_valor_cuota_m * gd_uf_dia))
			end if
			if lld_pie<500 then
				dw_ingreso_contrato.setitem(1,'pie',(lld_pie * gd_uf_dia))
			end if
		elseif ls_moneda='2' then //uf
			if lld_kapital>=500 then 
				dw_ingreso_contrato.setitem(1,'kapital',(lld_kapital / gd_uf_dia))
			end if
			if lld_valor_cuo>=500 then
				dw_ingreso_contrato.setitem(1,'valor_cuo',(lld_valor_cuo / gd_uf_dia))
			end if
			if lld_valor_cuota_m>=500 then
				dw_ingreso_contrato.setitem(1,'valor_cuota_m',(lld_valor_cuota_m / gd_uf_dia))
			end if
			if lld_pie>=500 then
				dw_ingreso_contrato.setitem(1,'pie',(lld_pie / gd_uf_dia))
			end if
		end if
		dw_ingreso_contrato.accepttext()
	end if
END IF
end event

event clicked;String	ls_columna,ls_fecha
Long		ll_estado_contrato,ll_estado_rut,ll_dias_tope_def,ll_dias_inicio_def
Date		ld_fecha_prim,ld_fecha_min
ls_columna	= dwo.name

SELECT	sysdate,	"TASA"."DIAS_TOPE_REPACTA",	"TASA"."DIAS_INICIO_REPACTA"  INTO :gdt_fec_sistema,	:ll_dias_tope_def,			:ll_dias_inicio_def
FROM 	"TASA"  ;

ll_estado_contrato	= this.getitemnumber(1,'estado_contrato')
ll_estado_rut			= this.getitemnumber(1,'estado_rut')
if ll_estado_contrato>0 and ll_estado_rut>0 then
	CHOOSE CASE ls_columna
		CASE 'p_2'
			ls_fecha					= string(date(dw_ingreso_contrato.getitemdatetime(1,'fecha')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ingreso_contrato.setitem(1,'fecha',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ingreso_contrato.setitem(1,'fecha',date(ls_fecha))
			END IF
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('fecha')
			
		CASE 'p_3'
			ls_fecha					= string(date(dw_ingreso_contrato.getitemdatetime(1,'fechas_ingreso')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ingreso_contrato.setitem(1,'fechas_ingreso',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ingreso_contrato.setitem(1,'fechas_ingreso',date(ls_fecha))
			END IF
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('fechas_ingreso')
			
		CASE 'p_4'
			ls_fecha					= string(date(dw_ingreso_contrato.getitemdatetime(1,'fec_restr')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ingreso_contrato.setitem(1,'fec_restr',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ingreso_contrato.setitem(1,'fec_restr',date(ls_fecha))
			END IF
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('fec_restr')
			
		CASE 'p_5'
			ls_fecha					= string(date(dw_ingreso_contrato.getitemdatetime(1,'la_primer_v')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ingreso_contrato.setitem(1,'la_primer_v',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ingreso_contrato.setitem(1,'la_primer_v',date(ls_fecha))
			END IF
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('la_primer_v')
			
		CASE 'p_6'
			ld_fecha_prim	= date(dw_ingreso_contrato.getitemdatetime(1,'fecha_prim'))
			ld_fecha_min	= RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1))
			if ld_fecha_prim < ld_fecha_min then
				messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
				dw_ingreso_contrato.setitem(1,'fecha_prim',date(gdt_fec_sistema))
				dw_ingreso_contrato.accepttext()
			else
				ls_fecha					= string(date(dw_ingreso_contrato.getitemdatetime(1,'fecha_prim')))
				if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_ingreso_contrato.setitem(1,'fecha_prim',datetime(string(id_fecha_dia,gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_ingreso_contrato.setitem(1,'fecha_prim',date(ls_fecha))
				END IF
				dw_ingreso_contrato.AcceptText()
				dw_ingreso_contrato.setfocus()
				dw_ingreso_contrato.setcolumn('fecha_prim')
			end if
		CASE 'p_7'
			ls_fecha					= string(date(dw_ingreso_contrato.getitemdatetime(1,'fecha_ult')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ingreso_contrato.setitem(1,'fecha_ult',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ingreso_contrato.setitem(1,'fecha_ult',date(ls_fecha))
			END IF
			dw_ingreso_contrato.AcceptText()
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('fecha_ult')
			
		CASE 'p_8'
			ls_fecha					= string(date(dw_ingreso_contrato.getitemdatetime(1,'fecha_m')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ingreso_contrato.setitem(1,'fecha_m',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ingreso_contrato.setitem(1,'fecha_m',date(ls_fecha))
			END IF
			dw_ingreso_contrato.AcceptText()
			dw_ingreso_contrato.setfocus()
			dw_ingreso_contrato.setcolumn('fecha_m')
	END CHOOSE
end if
end event

type st_salir from statictext within w_ingresar_contrato
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3173
integer y = 2092
integer width = 197
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Salir"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

type st_limpiar from statictext within w_ingresar_contrato
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1545
integer y = 2092
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Limpiar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

type st_imprimir from statictext within w_ingresar_contrato
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 521
integer y = 2092
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Imprimir"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

type st_grabar from statictext within w_ingresar_contrato
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 9
integer y = 2092
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Grabar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_insert_benef.visible	= false
st_borrar_benef.visible	= false
st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
end event

