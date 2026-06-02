forward
global type w_ingresar_derecho from window
end type
type pb_2 from picturebutton within w_ingresar_derecho
end type
type dw_seguro from datawindow within w_ingresar_derecho
end type
type cb_ver_cuenta from commandbutton within w_ingresar_derecho
end type
type p_1 from picture within w_ingresar_derecho
end type
type st_buscar from statictext within w_ingresar_derecho
end type
type pb_buscar from picturebutton within w_ingresar_derecho
end type
type dw_1 from datawindow within w_ingresar_derecho
end type
type st_imprimir from statictext within w_ingresar_derecho
end type
type st_limpiar from statictext within w_ingresar_derecho
end type
type pb_limpiar from picturebutton within w_ingresar_derecho
end type
type pb_print from picturebutton within w_ingresar_derecho
end type
type st_salir from statictext within w_ingresar_derecho
end type
type st_grabar from statictext within w_ingresar_derecho
end type
type cb_cerrar from picturebutton within w_ingresar_derecho
end type
type cb_aceptar from picturebutton within w_ingresar_derecho
end type
type dw_clientes from datawindow within w_ingresar_derecho
end type
type st_seg_fune from statictext within w_ingresar_derecho
end type
type dw_derecho from datawindow within w_ingresar_derecho
end type
end forward

global type w_ingresar_derecho from window
integer x = 73
integer y = 48
integer width = 3442
integer height = 1984
boolean titlebar = true
string title = "Ingresar Derecho Especial de Sepultación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
pb_2 pb_2
dw_seguro dw_seguro
cb_ver_cuenta cb_ver_cuenta
p_1 p_1
st_buscar st_buscar
pb_buscar pb_buscar
dw_1 dw_1
st_imprimir st_imprimir
st_limpiar st_limpiar
pb_limpiar pb_limpiar
pb_print pb_print
st_salir st_salir
st_grabar st_grabar
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_clientes dw_clientes
st_seg_fune st_seg_fune
dw_derecho dw_derecho
end type
global w_ingresar_derecho w_ingresar_derecho

type variables
Date		id_fecha_dia
Long		il_tipo_cliente=1,il_modif,il_modif_plazo,il_modif_fec,il_estado,il_cod_seguro
String		is_error_cod
end variables

forward prototypes
public function double f_comision_age1 (string as_tipo_venta, string as_area, string as_uso)
public function double f_comision_sup1 (string as_area)
public subroutine wf_limpiar ()
public subroutine wf_mostrar_derecho_especial ()
public subroutine wf_nuevo_derecho_especial ()
public function boolean f_validar ()
public subroutine wf_log_derecho ()
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

public subroutine wf_limpiar ();Long		ll_tot_reg,ll_indi

dw_clientes.reset()
dw_clientes.insertrow(0)
dw_derecho.reset()
wf_nuevo_derecho_especial()
dw_seguro.reset()
if gs_conexion = "Parque El Prado" then
	ll_tot_reg	= dw_seguro.retrieve(1,'D')
elseif gs_conexion = "Parque La Foresta" then
	ll_tot_reg			= dw_seguro.retrieve(11,'D')
elseif gs_conexion = "Parque Concepción" then
	ll_tot_reg			= dw_seguro.retrieve(801,'D')
end if
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_seguro.setitem(ll_indi,'c_estado_reg',1)
	next
	dw_seguro.accepttext()
end if
dw_seguro.enabled			= false
dw_derecho.setfocus()
dw_derecho.setcolumn('serie_p')
end subroutine

public subroutine wf_mostrar_derecho_especial ();Long		ll_count,ll_cod_seguro,ll_estado_reg,ll_reg
Double	ldb_monto

cb_aceptar.text = "Actualizar"
gi_rut = Long(dw_derecho.GetItemNumber(1, "rut"))
dw_derecho.setitem(1,'estado_rut',1)
dw_derecho.setitem(1,'estado_pagare',1)
dw_derecho.setitem(1,'estado_contrato',1)
if dw_derecho.getitemnumber(1,'nro_resc') = 99 then
	cb_aceptar.enabled			= false
else
	cb_aceptar.enabled			= true
end if
if dw_clientes.Retrieve(gi_rut)>0 then dw_derecho.SetItem(1,"compute",upper(dw_clientes.GetItemstring(1,"dv")))
SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO")
INTO			:ll_count
FROM 		"SEGURO_ASOCIADOS"  
WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
			  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
			  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
			  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
if ll_count > 0 then
	DECLARE x1 CURSOR FOR  
	SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
					"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
					"SEGURO_ASOCIADOS"."ESTADO_REG"  
	FROM 		"SEGURO_ASOCIADOS"  
	WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
				  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
				  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			Fetch x1 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
			if not isnull(ll_cod_seguro) then
				if ll_estado_reg = 0 then
					ll_reg = dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, dw_seguro.RowCount())
					if ll_reg > 0 then
						dw_seguro.setitem(ll_reg,'c_estado_reg',0)
					end if
				end if
			end if
			setnull(ll_cod_seguro)
		loop
	end if
	close x1;
	dw_seguro.accepttext()
end if
dw_seguro.enabled				= true
//idw_detalle.retrieve('O')
//idw_detalle2.retrieve('D')
end subroutine

public subroutine wf_nuevo_derecho_especial ();string	ls_null
Long		ll_null
cb_aceptar.text = "Ingresar"
dw_derecho.InsertRow(0)
gs_base				= 'D'
dw_derecho.setitem(1,'estado_rut',0)
dw_derecho.setitem(1,'estado_pagare',0)
dw_derecho.SetItem(1, "base", gs_base)
dw_derecho.SetItem(1, "serie_p", gs_serie)
dw_derecho.SetItem(1, "nro_pagare", gi_numero)
dw_derecho.SetItem(1, "serie", ls_null)
idw_detalle.retrieve('O')
idw_detalle2.retrieve('D')
dw_derecho.SetItem(1, "nro_oferta", ll_null)
dw_derecho.SetItem(1, "rut_aval", 0)
dw_derecho.SetItem(1, "rut", ll_null)
dw_derecho.SetItem(1, "kapital", 0)
dw_derecho.SetItem(1, "tasa", 0)
dw_derecho.SetItem(1, "valor_cuo", 0)
//dw_derecho.SetItem(1, "fecha_prim", ld_null)
//dw_derecho.SetItem(1, "fecha_ult", ld_null)
dw_derecho.SetItem(1, "plazo", 0)
dw_derecho.SetItem(1, "tot_pagado", 0)
dw_derecho.SetItem(1, "pie_pagado", 0)
dw_derecho.SetItem(1, "cta_pag_la", 0)
dw_derecho.SetItem(1, "cta_pag_isa", 0)
dw_derecho.SetItem(1, "abono_pag", 0)
dw_derecho.SetItem(1, "usuario", gs_user)
dw_derecho.SetItem(1, "fechas_ingreso", id_fecha_dia)
dw_derecho.SetItem(1, "fecha", id_fecha_dia)
dw_derecho.SetItem(1, "estado", "V")
dw_derecho.SetItem(1, "nro_resc", 0)
dw_derecho.SetItem(1, "parque", gs_cod_parque)
dw_derecho.SetItem(1, "dueno", ls_null)
dw_derecho.SetItem(1, "origen", ls_null)
dw_derecho.SetItem(1, "moneda", ls_null)
dw_derecho.SetItem(1, "sector", ls_null)
dw_derecho.SetItem(1, "sepultura", ls_null)
dw_derecho.SetItem(1, "pie", 0)
dw_derecho.accepttext()
end subroutine

public function boolean f_validar ();String		ls_moneda
Double	lld_kapital,lld_tasa,lld_valor_cuo,lld_pie
Long		ll_res

dw_derecho.AcceptText()
dw_clientes.AcceptText()

ls_moneda	= dw_derecho.getitemstring(1,'moneda')
lld_tasa		= double(dw_derecho.getitemnumber(1,'tasa'))
if lld_tasa>100 then
	messagebox("Error","Valor Tasa Inválida")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('tasa')
	RETURN FALSE
end if
if ls_moneda='2' then //uf
	lld_kapital				= double(dw_derecho.getitemnumber(1,'kapital'))
	lld_valor_cuo			= double(dw_derecho.getitemnumber(1,'valor_cuo'))
	lld_pie					= double(dw_derecho.getitemnumber(1,'pie'))
	if lld_kapital>=500 then 
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Precio)")
		dw_derecho.setfocus()
		dw_derecho.setcolumn('kapital')
		RETURN FALSE
	elseif lld_valor_cuo>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota)")
		dw_derecho.setfocus()
		dw_derecho.setcolumn('valor_cuo')
		RETURN FALSE
	elseif lld_pie>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Pie)")
		dw_derecho.setfocus()
		dw_derecho.setcolumn('pie')
		RETURN FALSE
	end if
end if
IF IsNull(dw_derecho.GetItemNumber(1, "rut")) THEN
	MessageBox("Error", "Debe ingresar el rut del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_derecho.GetItemString(1, "serie")) THEN
	MessageBox("Error", "Debe ingresar la serie del contrato asociado")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('serie')
	RETURN FALSE
END IF
IF IsNull(dw_derecho.GetItemNumber(1, "nro_oferta")) THEN
	MessageBox("Error", "Debe ingresar el número del contrato asociado")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('nro_oferta')
	RETURN FALSE
END IF
IF IsNull(dw_derecho.GetItemString(1, "moneda")) THEN
	MessageBox("Error", "Debe ingresar el tipo de moneda")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('moneda')
	RETURN FALSE
END IF
IF (dw_derecho.GetItemNumber(1, "kapital"))=0 THEN
	MessageBox("Error", "Debe ingresar el Capital")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('kapital')
	RETURN FALSE
END IF
IF (dw_derecho.GetItemNumber(1, "tasa"))=0 and (dw_derecho.GetItemNumber(1, "plazo"))>1 THEN
	ll_res		= MessageBox("Error", "Debe ingresar el interes, desea ingresar en '0'",Exclamation!,YesNo!,2)
	if ll_res <> 1 then
		dw_derecho.setfocus()
		dw_derecho.setcolumn('tasa')
		RETURN FALSE
	end if
END IF
IF (dw_derecho.GetItemNumber(1, "valor_cuo"))=0 THEN
	MessageBox("Error", "Debe ingresar el valor de la cuota")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('valor_cuo')
	RETURN FALSE
END IF
IF (dw_derecho.GetItemNumber(1, "plazo"))=0 THEN
	MessageBox("Error", "Debe ingresar Nº Cuotas")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('plazo')
	RETURN FALSE
END IF
IF IsNull(dw_derecho.GetItemDateTime(1, "fecha_prim")) THEN
	MessageBox("Error", "Debe ingresar la fecha del Primer Vencimiento")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('fecha_prim')
	RETURN FALSE
END IF
IF IsNull(dw_derecho.GetItemDateTime(1, "fecha_ult")) THEN
	MessageBox("Error", "Debe ingresar la fecha del último Vencimiento")
	dw_derecho.setfocus()
	dw_derecho.setcolumn('fecha_ult')
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

public subroutine wf_log_derecho ();String	ls_serie_p,ls_serie,ls_moneda
Long		ll_nro_pagare,ll_nro_oferta,ll_rut,ll_cod_parque
Double	ll_kapital,ll_plazo,ll_tasa,ll_valor_cuo,ll_pie
Datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_ult,ldt_fecha_hoy
			
SELECT	sysdate  
INTO 		:gdt_fec_sistema
FROM 		"TASA"  ;
ldt_fecha_hoy		= gdt_fec_sistema
ls_serie_p			= dw_derecho.getitemstring(1,'serie_p')
ls_serie				= dw_derecho.getitemstring(1,'serie')
ls_moneda			= dw_derecho.getitemstring(1,'moneda')

ll_nro_pagare		= dw_derecho.getitemnumber(1,'nro_pagare')
ll_nro_oferta		= dw_derecho.getitemnumber(1,'nro_oferta')
ll_rut				= dw_derecho.getitemnumber(1,'rut')
ll_kapital			= dw_derecho.getitemnumber(1,'kapital')
ll_plazo				= dw_derecho.getitemnumber(1,'plazo')
ll_tasa				= dw_derecho.getitemnumber(1,'tasa')
ll_valor_cuo		= dw_derecho.getitemnumber(1,'valor_cuo')
ll_pie				= dw_derecho.getitemnumber(1,'pie')
ll_cod_parque		= dw_derecho.getitemnumber(1,'cadena_cod_parque')

ldt_fecha			= dw_derecho.getitemdatetime(1,'fecha')
ldt_fecha_prim		= dw_derecho.getitemdatetime(1,'fecha_prim')
ldt_fecha_ult		= dw_derecho.getitemdatetime(1,'fecha_ult')

if isnull(ls_serie_p) 		then ls_serie_p=' '
if isnull(ls_serie) 			then ls_serie=' '
if isnull(ls_moneda) 		then ls_moneda=' '
if isnull(ll_nro_pagare) 	then ll_nro_pagare=0
if isnull(ll_nro_oferta) 	then ll_nro_oferta=0
if isnull(ll_rut) 			then ll_rut=0
if isnull(ll_kapital) 		then ll_kapital=0
if isnull(ll_plazo) 			then ll_plazo=0
if isnull(ll_tasa) 			then ll_tasa=0
if isnull(ll_valor_cuo) 	then ll_valor_cuo=0
if isnull(ll_pie) 			then ll_pie=0
if isnull(ll_cod_parque)	then ll_cod_parque=0
if isnull(ldt_fecha) 		then ldt_fecha=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_prim) 	then ldt_fecha_prim=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_ult) 	then ldt_fecha_ult=datetime(date("01/01/1900"),time("00:00:00"))

INSERT INTO "LOG_DERECHO_ESPECIAL"  
			( "SERIE_P",   "NRO_PAGARE",   "RUT",   "SERIE",   "NRO_OFERTA",   "FECHA",   "USUARIO_CREA",   "FECHA_CREA",   "MONEDA",   "PLAZO",   "PIE",   "VALOR_CUO",   "FECHA_PRIM",   "KAPITAL",   "TASA",   "FECHA_ULT",	"COD_PARQUE" )  
VALUES	( :ls_serie_p, :ll_nro_pagare, :ll_rut, :ls_serie, :ll_nro_oferta, :ldt_fecha,:gs_user,   		:ldt_fecha_hoy, :ls_moneda, :ll_plazo, :ll_pie, :ll_valor_cuo, :ldt_fecha_prim,:ll_kapital, :ll_tasa, :ldt_fecha_ult,:ll_cod_parque )  
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
end subroutine

public function boolean f_cadena (integer ai_modo);string 	ls_barra,ls_agente,ls_serie_asoc
Datetime	ldt_fecha
Long		ll_nro_asoc

ls_barra		= 'D' + gs_serie + String(gi_numero)
Setnull(ldt_fecha)
gl_cod_parque	= dw_derecho.getitemnumber(1,'cadena_cod_parque')
ls_serie_asoc	= dw_derecho.getitemstring(1,'serie')
ll_nro_asoc		= dw_derecho.getitemnumber(1,'nro_oferta')
if isnull(gl_cod_parque) or gl_cod_parque=0 then
	SELECT	"OFERTA_V"."COD_AGE"  
	INTO 		:ls_agente  
	FROM 		"OFERTA_V"  
	WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_asoc ) AND  
			 ( "OFERTA_V"."NRO_OFERTA" = :ll_nro_asoc )   ;
			 
	SELECT	"AGENTES"."COD_PARQUE"  
	INTO 		:gl_cod_parque  
	FROM 		"AGENTES"  
	WHERE 	"AGENTES"."COD_AGE" = :ls_agente   
	USING		sqlca;
	if sqlca.sqlcode<>0 then gl_cod_parque	= 0
end if
IF ai_modo = 0 THEN // Es un Insert
	INSERT INTO "CADENA"
				("BARRA",	"RUT",  "CODIGO", 	"SERIE", 	"NUMERO", 	"ESTADO", "PRINT",	"EST_CUP",	"NRO_CARTA",	"FECHA_CARTA",	"ESTADO_CARTA",	"FECHA_ACT_ESTADO",	"CUOTA_CUPON",	"FECHA_RES",	"A_DEMANDAR",	"ESTADO_CONTABLE",	"ESTADO_TITULO",	"FECHA_TITULO",	"NRO_CARTA_M",	"FECHA_CARTA_M",	"ESTADO_CARTA_M",	"FECHA_ACT_ESTADO_M", "COBRAN_C",	"COD_PARQUE")
	VALUES 	(:ls_barra, :gi_rut,	:gs_base,	:gs_serie,	:gi_numero,	'V',		 'N',			'0',			'SC',				:ldt_fecha,		'0',					:ldt_fecha,				0,					:ldt_fecha,		'0',				'A',						'N',					:ldt_fecha,			'SC',				:ldt_fecha,			'0', 					:ldt_fecha,				 '',				:gl_cod_parque);
	RETURN (SQLCA.SQLCode <> -1)
ELSE
	// Update
	UPDATE	"CADENA"  
   SET 		"COD_PARQUE" = :gl_cod_parque  
   WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
          ( "CADENA"."SERIE" = :gs_serie ) AND  
          ( "CADENA"."NUMERO" = :gi_numero )   ;
	RETURN (SQLCA.SQLCode <> -1)
END IF
end function

on w_ingresar_derecho.create
this.pb_2=create pb_2
this.dw_seguro=create dw_seguro
this.cb_ver_cuenta=create cb_ver_cuenta
this.p_1=create p_1
this.st_buscar=create st_buscar
this.pb_buscar=create pb_buscar
this.dw_1=create dw_1
this.st_imprimir=create st_imprimir
this.st_limpiar=create st_limpiar
this.pb_limpiar=create pb_limpiar
this.pb_print=create pb_print
this.st_salir=create st_salir
this.st_grabar=create st_grabar
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_clientes=create dw_clientes
this.st_seg_fune=create st_seg_fune
this.dw_derecho=create dw_derecho
this.Control[]={this.pb_2,&
this.dw_seguro,&
this.cb_ver_cuenta,&
this.p_1,&
this.st_buscar,&
this.pb_buscar,&
this.dw_1,&
this.st_imprimir,&
this.st_limpiar,&
this.pb_limpiar,&
this.pb_print,&
this.st_salir,&
this.st_grabar,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_clientes,&
this.st_seg_fune,&
this.dw_derecho}
end on

on w_ingresar_derecho.destroy
destroy(this.pb_2)
destroy(this.dw_seguro)
destroy(this.cb_ver_cuenta)
destroy(this.p_1)
destroy(this.st_buscar)
destroy(this.pb_buscar)
destroy(this.dw_1)
destroy(this.st_imprimir)
destroy(this.st_limpiar)
destroy(this.pb_limpiar)
destroy(this.pb_print)
destroy(this.st_salir)
destroy(this.st_grabar)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_clientes)
destroy(this.st_seg_fune)
destroy(this.dw_derecho)
end on

event open;String		ls_opcion_dig
Long		ll_tot_reg,ll_indi

setnull(gs_base);setnull(gs_serie);setnull(gi_numero)
gf_centrar(w_ingresar_derecho)
dw_seguro.SetTransObject(SQLCA)
if gs_conexion = "Parque El Prado" then
	ll_tot_reg	= dw_seguro.retrieve(1,'D')
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
	ll_tot_reg			= dw_seguro.retrieve(11,'D')
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 	= 'logo_parque_conce.bmp'
	ll_tot_reg			= dw_seguro.retrieve(801,'D')
end if
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_seguro.setitem(ll_indi,'c_estado_reg',1)
	next
	dw_seguro.accepttext()
end if
dw_seguro.enabled			= false
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
id_fecha_dia		= date(gdt_fec_sistema)
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
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha_dia
using		sqlca;
if sqlca.sqlcode<>0 then
	close(w_ingresar_derecho)
else
	gs_base				= 'D'
	dw_1.SetTransObject(SQLCA)
	dw_clientes.SetTransObject(SQLCA)
	dw_derecho.SetTransObject(SQLCA)
	dw_derecho.getchild('serie',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.rowcount()=0 then
		idw_detalle.retrieve('O')
	end if
	dw_derecho.getchild('serie_p',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.rowcount()=0 then
		idw_detalle2.retrieve('D')
	end if
	dw_clientes.insertrow(0)
	if dw_derecho.Retrieve(gs_serie,gi_numero)=0 then
		wf_nuevo_derecho_especial()
	else
		wf_mostrar_derecho_especial()
	end if
end if
end event

event mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

type pb_2 from picturebutton within w_ingresar_derecho
event ue_mousemove pbm_mousemove
integer x = 987
integer y = 1696
integer width = 174
integer height = 152
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Contabilidad (o).BMP"
string disabledname = "Contabilidad (o)_no.bmp"
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= true
end event

event clicked;String		ls_string
Long		ll_existe

gs_serie		= dw_derecho.getitemstring(1,'serie_p')
gi_numero	= dw_derecho.getitemnumber(1,'nro_pagare')
gs_base		= 'D'
ls_string		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
ll_existe		= dw_seguro.find('(codigo=10 or codigo=11 or codigo=12) and c_estado_reg=0',1,dw_seguro.rowcount())
if ll_existe > 0 and gi_numero > 0 then
	if isvalid(w_ingresar_benef_seguro_funeraria) then close(w_ingresar_benef_seguro_funeraria)
	openwithparm(w_ingresar_benef_seguro_funeraria,ls_string)
else
	messagebox("Advertencia","Debe estar Seleccionado Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
end if

end event

type dw_seguro from datawindow within w_ingresar_derecho
integer x = 2505
integer y = 32
integer width = 859
integer height = 720
integer taborder = 20
string dataobject = "dw_lista_seguro_seleccion_ctto"
boolean vscrollbar = true
boolean border = false
end type

event itemchanged;String		ls_forma_pago,ls_moneda,ls_columna
Long		ll_fila,ll_estado,ll_codigo,ll_existe

is_error_cod				= 'N'
dw_seguro.accepttext()
ls_columna					= dwo.name
if ls_columna='c_estado_reg' then
	ll_fila						= dw_seguro.getrow()
	if ll_fila > 0 then
		ll_estado				= Long(data)
		il_estado				= ll_estado
		if ll_estado = 0 then
			ll_codigo			= dw_seguro.getitemnumber(ll_fila,'codigo')
			il_cod_seguro	= ll_codigo
			if ll_codigo=10 then
				ll_existe	= dw_seguro.find('(codigo=11 or codigo=12) and c_estado_reg=0',1,dw_seguro.rowcount())
				if ll_existe > 0 then
					messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.event ue_validar_codigo()
					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
					dw_seguro.accepttext()
					dw_seguro.setcolumn('factor_prima')
					is_error_cod	= 'S'
				end if
			elseif ll_codigo=11 then
				ll_existe		= dw_seguro.find('(codigo=10 or codigo=12) and c_estado_reg=0',1,dw_seguro.rowcount())
				if ll_existe > 0 then
					messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.event ue_validar_codigo()
					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
					dw_seguro.accepttext()
					dw_seguro.setcolumn('factor_prima')
					is_error_cod	= 'S'
				end if
			elseif ll_codigo=12 then
				ll_existe		= dw_seguro.find('(codigo=10 or codigo=11) and c_estado_reg=0',1,dw_seguro.rowcount())
				if ll_existe > 0 then
					messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.event ue_validar_codigo()
					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
					dw_seguro.accepttext()
					dw_seguro.setcolumn('factor_prima')
					is_error_cod	= 'S'
				end if
			end if
		end if
	end if
	dw_seguro.accepttext()
end if
end event

event itemfocuschanged;Long		ll_fila,ll_estado,ll_codigo,ll_existe,ll_tot_reg,ll_indi,ll_cod_reg

dw_seguro.accepttext()
if gi_numero > 0 and il_cod_seguro > 0 then
	ll_tot_reg					= dw_seguro.rowcount()
	ll_fila							= dw_seguro.getrow()
	if ll_fila > 0 then
		ll_estado					= il_estado		//dw_seguro.getitemnumber(ll_fila,'c_estado_reg')
		if is_error_cod = 'S' then	// ll_estado = 0 
			ll_codigo				= il_cod_seguro
			if ll_codigo=10 then
				ll_existe			= dw_seguro.find('(codigo=11 or codigo=12) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=10 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			elseif ll_codigo=11 then
				ll_existe	= dw_seguro.find('(codigo=10 or codigo=12) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=11 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			elseif ll_codigo=12 then
				ll_existe	= dw_seguro.find('(codigo=10 or codigo=11) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=12 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			end if
		end if
	end if
	dw_seguro.accepttext()
end if
end event

event losefocus;Long		ll_fila,ll_estado,ll_codigo,ll_existe,ll_tot_reg,ll_indi,ll_cod_reg

dw_seguro.accepttext()
if gi_numero > 0 and il_cod_seguro > 0 then
	ll_tot_reg					= dw_seguro.rowcount()
	ll_fila							= dw_seguro.getrow()
	if ll_fila > 0 then
		ll_estado					= il_estado		//dw_seguro.getitemnumber(ll_fila,'c_estado_reg')
		if is_error_cod = 'S' then	// ll_estado = 0 
			ll_codigo				= il_cod_seguro
			if ll_codigo=10 then
				ll_existe			= dw_seguro.find('(codigo=11 or codigo=12) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=10 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			elseif ll_codigo=11 then
				ll_existe	= dw_seguro.find('(codigo=10 or codigo=12) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=11 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			elseif ll_codigo=12 then
				ll_existe	= dw_seguro.find('(codigo=10 or codigo=11) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=12 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			end if
		end if
	end if
	dw_seguro.accepttext()
end if
end event

type cb_ver_cuenta from commandbutton within w_ingresar_derecho
event ue_mousemove pbm_mousemove
integer x = 2085
integer y = 1696
integer width = 539
integer height = 152
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "C&uenta corriente"
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
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

type p_1 from picture within w_ingresar_derecho
boolean visible = false
integer x = 96
integer y = 460
integer width = 219
integer height = 180
boolean enabled = false
string picturename = "logo_e.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_buscar from statictext within w_ingresar_derecho
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 722
integer y = 1632
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

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

type pb_buscar from picturebutton within w_ingresar_derecho
event ue_mousemove pbm_mousemove
integer x = 750
integer y = 1696
integer width = 174
integer height = 152
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.BMP"
string disabledname = "Buscar.BMP"
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= true
st_seg_fune.visible		= false
end event

event clicked;if isvalid(w_listado_contrato) then close(w_listado_contrato)
openwithparm(w_listado_contrato,'D')
end event

type dw_1 from datawindow within w_ingresar_derecho
boolean visible = false
integer x = 1513
integer y = 1764
integer width = 411
integer height = 432
string dataobject = "d_ingreso_derecho_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_imprimir from statictext within w_ingresar_derecho
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 247
integer y = 1632
integer width = 233
integer height = 64
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

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

type st_limpiar from statictext within w_ingresar_derecho
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 485
integer y = 1632
integer width = 233
integer height = 64
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

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

type pb_limpiar from picturebutton within w_ingresar_derecho
event ue_mousemove pbm_mousemove
integer x = 512
integer y = 1696
integer width = 174
integer height = 152
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "trash.bmp"
end type

event ue_mousemove;st_limpiar.visible			= true
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

event clicked;setnull(gs_base);setnull(gs_serie);setnull(gi_numero);setnull(gl_cod_parque)
gs_base			= 'D'
wf_limpiar()

end event

type pb_print from picturebutton within w_ingresar_derecho
event ue_mousemove pbm_mousemove
integer x = 274
integer y = 1696
integer width = 174
integer height = 152
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Print.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= true
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

event clicked;String		ls_serie
Double	ll_numero

ls_serie		= dw_derecho.getitemstring(1,'serie_p') //	trim(em_serie.text)
ll_numero	= dw_derecho.getitemnumber(1,'nro_pagare')//  long(trim(em_numero.text))
if not isnull(ls_serie) and ll_numero>0 then
	if dw_1.retrieve(ls_serie,ll_numero) > 0 then 
		f_Print( dw_1 )
	END IF
end if
end event

type st_salir from statictext within w_ingresar_derecho
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3191
integer y = 1632
integer width = 197
integer height = 64
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

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

type st_grabar from statictext within w_ingresar_derecho
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 18
integer y = 1632
integer width = 233
integer height = 64
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

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

type cb_cerrar from picturebutton within w_ingresar_derecho
event ue_mousemove pbm_mousemove
integer x = 3200
integer y = 1696
integer width = 174
integer height = 152
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= true
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

event clicked;close(w_ingresar_derecho)
end event

type cb_aceptar from picturebutton within w_ingresar_derecho
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1696
integer width = 174
integer height = 152
integer taborder = 40
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

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= true
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

event clicked;long		rut,li_ret1,ll_estado_graba,ll_estado_cd,ll_plazo,ll_rut,ll_cod_parque,ll_count_vig,ll_tot_reg,ll_indi,ll_est_reg,ll_codigo,ll_count
String		ls_depto_asignado,ls_age,ls_sup,ls_jefe,ls_glosa,ls_memo,ls_ref,ls_dv,ls_estado_cadena,ls_moneda,ls_modif,ls_forma_pago
Datetime	ldt_fecha_hoy,ldt_fecha_prim,ldt_fec_venc_mant
Double	ldb_valor_cuota,ldb_valor_cuota_mant,ldb_valor_pie,ldb_precio,ldb_calculo,ldb_monto,ld_saldo_finan,ldb_tasa,ldb_gastos_adm,ldb_tasa_int_cta,ldb_tasa_cta

SELECT	sysdate INTO 	:gdt_fec_sistema FROM 	"TASA"  ;
if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 and gi_rut>0 then
	if String(dw_derecho.getitemstring(1,'compute')) <> String(gf_obtener_dv(long(dw_derecho.GetItemNumber(1, "rut")))) then
		messagebox('Error','El Rut no es valido',stopsign!)
		dw_derecho.setfocus()
		dw_derecho.SetColumn('rut')
		return
	end if
	ldb_gastos_adm		= 0
	ll_plazo					= dw_derecho.getitemnumber(1,'plazo')
	ldb_valor_cuota		= dw_derecho.getitemnumber(1,'valor_cuo')
	ldb_valor_pie			= dw_derecho.getitemnumber(1,'pie')
	ldb_precio				= dw_derecho.getitemnumber(1,'kapital')
	ld_saldo_finan			= ldb_precio - ldb_valor_pie
	ldb_calculo				= ldb_valor_pie + (ll_plazo * ldb_valor_cuota)
	if ldb_precio > ldb_calculo + 1000 then
		messagebox("Advertencia","Valor Cuota Inválida, debe revisar Plazo, Valor Cuota, Valor Pie o Precio")
		dw_derecho.setfocus()
		dw_derecho.setcolumn('valor_cuo')
		return
	end if
	IF MessageBox("Derecho Especial", "Desea Actualizar los datos ingresados", Question!, YesNo!) = 1 THEN
		ldb_tasa				= f_tasa(ll_plazo,ldb_valor_cuota,ld_saldo_finan)
		if ldb_tasa <= 0.0001 then
			ldb_tasa						= 0.0001
			ldb_tasa_cta				= 0.0001
		else
			 ldb_tasa						= ldb_tasa
			 ldb_tasa_cta				= ldb_tasa / 100
		end if
		dw_derecho.setitem(1,'derecho_tasa_interes_cuota',ldb_tasa_cta)
		dw_derecho.accepttext()
		li_ret1 				= dw_derecho.Update()
		rut 					= dw_derecho.getitemnumber(1,'rut')
		ldb_tasa_int_cta	= dw_derecho.getitemnumber(1,'derecho_tasa_interes_cuota')
		IF li_ret1 = 1 THEN
			IF f_validar() THEN
				IF cb_aceptar.text = "Actualizar" THEN
					// Update cadena
					IF Not(f_cadena(1)) THEN
						MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
						rollback using SQLCA;
						RETURN
					END IF
				ELSE
					// Insert cadena
					IF Not(f_cadena(0)) THEN
						MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
						rollback using SQLCA;
						RETURN
					END IF
				END IF
			END IF			
			Commit using SQLCA;
			wf_log_derecho()
			UPDATE	"CLIENTE"  
			SET 		"ESTADO_COBRANZA" = '0'   
			WHERE 	"CLIENTE"."RUT" = :rut   
			USING		sqlca ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			ll_plazo					= dw_derecho.getitemnumber(1,'plazo')
			ll_rut						= dw_derecho.getitemnumber(1,'rut')
			ldb_valor_cuota		= dw_derecho.getitemnumber(1,'valor_cuo')
			ldt_fecha_prim			= dw_derecho.getitemdatetime(1,'fecha_prim')
			SetNull(ldt_fec_venc_mant);SetNull(ldb_valor_cuota_mant)
			ls_dv						= dw_derecho.getitemstring(1,'compute')
			ll_cod_parque			= dw_derecho.getitemnumber(1,'cadena_cod_parque')
			ls_moneda				= dw_derecho.getitemstring(1,'moneda')
			ls_forma_pago			= dw_derecho.getitemstring(1,'derecho_forma_pago')
			SELECT	"CADENA"."ESTADO"  
			INTO 		:ls_estado_cadena  
			FROM 	"CADENA"  
			WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
					   ( "CADENA"."SERIE" = :gs_serie ) AND  
					   ( "CADENA"."NUMERO" = :gi_numero )   
			USING		sqlca;
			if ls_estado_cadena='V' then
				SELECT	"CUPONERAS"."NUMERO"  
				INTO 		:ll_count_vig  
				FROM 	"CUPONERAS"  
				WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
						 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
						 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
						 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if il_modif > 1 or il_modif_fec > 1 or il_modif_plazo > 1 then
						if il_modif > 1 then
							ls_modif	= 'E'
						elseif il_modif_fec > 1 then
							ls_modif	= 'C'
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
							DECLARE sp_nuevo_cadena_mora2 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
							EXECUTE sp_nuevo_cadena_mora2;
							
							DECLARE sp_proc_modifica_cuponera PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda, :ls_modif );
							EXECUTE sp_proc_modifica_cuponera;
							
							DECLARE SP_DESARROLLO_CUOTA2 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :ldb_precio, :ldb_valor_pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gastos_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_int_cta);
							EXECUTE SP_DESARROLLO_CUOTA2;
						else
							rollback;
						end if
					end if
				elseif sqlca.sqlcode=100 then
					DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'N');
					EXECUTE sp_nuevo_cadena_mora;
					
					DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda );
					EXECUTE sp_proc_genera_cuponera;
					
					DECLARE SP_DESARROLLO_CUOTA PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :ldb_precio, :ldb_valor_pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gastos_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_int_cta);
					EXECUTE SP_DESARROLLO_CUOTA;
				end if
			end if
			UPDATE		"SEGURO_ASOCIADOS"  
			SET 			"ESTADO_SEGURO" = 'I',
							"ESTADO_REG" = 1
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				ll_tot_reg		= dw_seguro.rowcount()
				for ll_indi=1 to ll_tot_reg
					ll_est_reg	= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
					ll_codigo		= dw_seguro.getitemnumber(ll_indi,'codigo')
					if ls_moneda='1' then
						SELECT	"TIPO_SEGURO"."FACTOR_PESO"  
						INTO 		:ldb_monto  
						FROM 	"TIPO_SEGURO"  
						WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo 
						USING	sqlca;
					elseif ls_moneda='2' then
						SELECT	"TIPO_SEGURO"."FACTOR_PRIMA"  
						INTO 		:ldb_monto  
						FROM 	"TIPO_SEGURO"  
						WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo 
						USING	sqlca;
					end if
//					ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
					if ll_est_reg = 0 then
						SELECT		Count("SEGURO_ASOCIADOS"."BASE")
						INTO 			:ll_count  
						FROM 		"SEGURO_ASOCIADOS"  
						WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
									  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
									  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
									  ( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo )  
						USING		sqlca;
						if ll_count > 0 then
							UPDATE		"SEGURO_ASOCIADOS"  
							SET 			"ESTADO_SEGURO" = 'A',
											"ESTADO_REG" = 0,
											"MONTO_PRIMA" = :ldb_monto,
											"MONEDA" = :ls_moneda
							WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
										  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
										  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
										  ( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo ) 
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							elseif sqlca.sqlcode=100 then
								INSERT INTO "SEGURO_ASOCIADOS"  
											( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
								VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A',						:ls_moneda,	:ls_forma_pago )  
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
									messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
								end if
							else
								rollback;
								messagebox("Error Grabar","Error UPDATE SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
							end if
						else
							INSERT INTO "SEGURO_ASOCIADOS"  
										( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
							VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A',						:ls_moneda,	:ls_forma_pago )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
							end if
						end if

					end if
				next
			else
				rollback;
				ll_tot_reg		= dw_seguro.rowcount()
				for ll_indi=1 to ll_tot_reg
					ll_est_reg	= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
					ll_codigo		= dw_seguro.getitemnumber(ll_indi,'codigo')
					if ls_moneda='1' then
						SELECT	"TIPO_SEGURO"."FACTOR_PESO"  
						INTO 		:ldb_monto  
						FROM 	"TIPO_SEGURO"  
						WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo 
						USING	sqlca;
					elseif ls_moneda='2' then
						SELECT	"TIPO_SEGURO"."FACTOR_PRIMA"  
						INTO 		:ldb_monto  
						FROM 	"TIPO_SEGURO"  
						WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo 
						USING	sqlca;
					end if
//					ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
					if ll_est_reg = 0 then
						INSERT INTO "SEGURO_ASOCIADOS"  
									( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
						VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A',						:ls_moneda,	:ls_forma_pago )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
						end if
					end if
				next
			end if
			if messagebox("Grabar","Grabación Exitosa, desea ingresar otro Derecho Especial", Question!, YesNo!, 2) = 1 THEN
				pb_limpiar.triggerevent(clicked!)
			else
				cb_aceptar.text = "Actualizar"
			END IF
		ELSE
			Rollback using SQLCA;
			MessageBox("Error Grabar","Error SQL: "+ SQLCA.SQLErrText, Information!)
		END IF
	END IF
end if
end event

type dw_clientes from datawindow within w_ingresar_derecho
event ue_mousemove pbm_mousemove
integer x = 27
integer y = 768
integer width = 3369
integer height = 528
integer taborder = 30
string dataobject = "d_ingreso_clientes"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

event doubleclicked;String	ls_string
gi_rut		= this.getitemnumber(1,'rut')
ls_string	= 'M'+'~t'+string(il_tipo_cliente)
if gi_rut>0 then openwithparm(w_ingreso_cliente,ls_string) 
end event

type st_seg_fune from statictext within w_ingresar_derecho
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 645
integer y = 1632
integer width = 859
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Ingresar Beneficios Seguro Funeraria"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

type dw_derecho from datawindow within w_ingresar_derecho
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 24
integer width = 3346
integer height = 1636
integer taborder = 10
string dataobject = "d_ingreso_derecho"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_seg_fune.visible		= false
end event

event itemchanged;long 		ll_fila, ll_nro_contrato, ll_nro,ll_resp,ll_nro_cuotas,ll_rut,ll_plazo_rev,ll_cod_parque_rev,ll_tot_reg,ll_indi,ll_dias_tope_def,ll_dias_inicio_def
string 	ls_columna, ls_base_contrato, ls_serie_contrato, ls_null,ls_fecha,ls_serie_p,ls_serie2,ls_moneda,ls_agente,ls_string,ls_base_aux,ls_moneda_rev,ls_forma_pago_rev,&
			ls_area_rev,ls_base_asoc,ls_serie_asoc
datetime	ld_null,ldt_fecha_prim,ldt_fecha_ctto_rev,ldt_fecha_prim_rev
Date		ld_fecha_prim,ld_fecha_min
Double	lld_kapital,lld_tasa,lld_valor_cuo,lld_pie,ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,ldb_valor_cuota_rev,ldb_precio_ctto_rev,&
			ldb_factor_cuota_rev,ldb_int_peso,ldb_int_uf,ll_numero_p,ll_numero_asoc

SetNull(ls_Null)
SetNull(ld_null)
THIS.AcceptText()
SELECT	sysdate,	"TASA"."DIAS_TOPE_REPACTA",	"TASA"."DIAS_INICIO_REPACTA"  INTO :gdt_fec_sistema,	:ll_dias_tope_def,			:ll_dias_inicio_def
FROM 	"TASA"  ;

ls_columna = GetColumnName()

IF ls_columna = 'rut' THEN
	gi_rut 		= Long(GetItemNumber(1, "rut"))
	if dw_clientes.Retrieve(gi_rut)=0 then
		dw_clientes.InsertRow(0)
		ll_resp 					= MessageBox("Advertencia", "Cliente NO Existe, desea Ingresarlo", Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			ls_string	= 'N'+'~t'+string(il_tipo_cliente)
			if gi_rut>0 then openwithparm(w_ingreso_cliente,ls_string) 
		else
			this.setcolumn('rut')
			dw_derecho.setitem(1,'estado_rut',0)
		END IF
	else
		dw_derecho.setitem(1,'estado_rut',1)
		dw_derecho.setitem(1,'compute',dw_clientes.getitemstring(1,'dv'))
	END IF
end if
if ls_columna = 'cadena_cod_parque' then
	gl_cod_parque	= dw_derecho.getitemnumber(1,'cadena_cod_parque')
	ll_tot_reg		= dw_seguro.retrieve(gl_cod_parque,'D')
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			dw_seguro.setitem(ll_indi,'c_estado_reg',1)
		next
		dw_seguro.accepttext()
	end if
	
end if
IF ls_columna = "fecha_prim" THEN
	ld_fecha_prim	= date(dw_derecho.getitemdatetime(1,'fecha_prim'))
	ld_fecha_min	= RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1))
	if ld_fecha_prim < ld_fecha_min then
		messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
		dw_derecho.setitem(1,'fecha_prim',date(gdt_fec_sistema))
		dw_derecho.accepttext()
	end if
end if
if ls_columna='serie_p' or ls_columna='nro_pagare' then// or ls_columna='rut'
	ls_serie_p		= this.getitemstring(1,'serie_p')
	ll_numero_p		= this.getitemnumber(1,'nro_pagare')
	gs_serie			= ls_serie_p
	gi_numero		= ll_numero_p
	if not isnull(ls_serie_p) and not isnull(ll_numero_p) and ll_numero_p>0 then
		SELECT	"CADENA"."SERIE" 
		INTO 		:ls_serie2
		FROM 		"CADENA"  
		WHERE  ( "CADENA"."SERIE" = :ls_serie_p) AND
				 ( "CADENA"."NUMERO" = :ll_numero_p ) AND
				 ( "CADENA"."CODIGO" = 'D' )
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if dw_derecho.retrieve(ls_serie_p,ll_numero_p)>0 then
				if isnull(dw_derecho.getitemstring(1,'usuario')) or dw_derecho.getitemstring(1,'usuario')='' then dw_derecho.setitem(1,'usuario',gs_user)
				dw_derecho.setitem(1,'estado_pagare',1)
				wf_mostrar_derecho_especial()
			else
				pb_limpiar.triggerevent(clicked!)
				dw_derecho.setitem(1,'estado_pagare',0)
			end if
			dw_derecho.setcolumn('nro_pagare')
		ELSE
			ll_resp	= MessageBox("Advertencia", "Derecho Especial Nº: D-"+ls_serie_p+'-'+string(ll_numero_p,"###,###,###,###")+' No Existe, desea Ingresarlo', Exclamation!, YesNo!, 2)
			IF ll_resp = 1 THEN
				dw_seguro.enabled	= true
				gi_numero				= ll_numero_p
				gs_serie 					= ls_serie_p
				gs_base 					= "D"
				dw_clientes.reset()
				dw_clientes.insertrow(0)
				dw_derecho.reset()
				wf_nuevo_derecho_especial()
				dw_derecho.setitem(1,'estado_pagare',1)
				dw_derecho.setitem(1,'serie_p',gs_serie)
				dw_derecho.setitem(1,'nro_pagare',gi_numero)
//				dw_derecho.setitem(1,'base',gs_base)
				SELECT	"CADENA"."CODIGO"  
				INTO 		:ls_base_aux  
				FROM 		"CADENA"  
				WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
						 ( "CADENA"."SERIE" = :gs_serie ) AND  
						 ( "CADENA"."NUMERO" = :gi_numero )   
				USING		sqlca;
				if sqlca.sqlcode=100 then
					SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC"
					INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc
					FROM 		"REVISION_CONTRATOS"  
					WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
							 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
							 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) AND
							 ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
					USING		sqlca;
					if sqlca.sqlcode=0 then
//						dw_derecho.SetItem(1,'base',ls_base_asoc)
						dw_derecho.SetItem(1,'serie',ls_serie_asoc)
						dw_derecho.SetItem(1,'nro_oferta',ll_numero_asoc)
						dw_derecho.SetItem(1,'fecha',ldt_fecha_ctto_rev)
						dw_derecho.SetItem(1,'moneda',ls_moneda_rev)
						dw_derecho.SetItem(1,'derecho_forma_pago',ls_forma_pago_rev)
						dw_derecho.SetItem(1,'pie',ldb_pie_rev)
						dw_derecho.SetItem(1,'plazo',ll_plazo_rev)
						dw_derecho.SetItem(1,'valor_cuo',ldb_valor_cuota_rev)
						dw_derecho.SetItem(1,'kapital',ldb_precio_ctto_rev)
						dw_derecho.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
						dw_derecho.SetItem(1,'fecha_prim',ldt_fecha_prim_rev)
						if not isnull(ldt_fecha_prim_rev) and not isnull(ll_plazo_rev) and ll_plazo_rev>0 then
							ls_fecha			= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
							if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
								dw_derecho.setitem(1,'fecha_ult',date(ls_fecha))
							end if
						end if
						SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
						INTO 		:ldb_int_peso,								:ldb_int_uf
						FROM 		"INTERES_CUOTAS"  
						WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if dw_derecho.getitemstring(1,'derecho_forma_pago')='1' then
								ldb_int_peso	= 0
								ldb_int_uf		= 0
							end if
							if ls_moneda_rev='1' then //peso
								dw_derecho.setitem(1,'tasa',ldb_int_peso)
							elseif ls_moneda_rev='2' then //UF
								dw_derecho.setitem(1,'tasa',ldb_int_uf)
							end if
						end if
//						ls_base_contrato 					= dw_derecho.getitemstring(1,'base')
						ls_serie_contrato 				= dw_derecho.getitemstring(1,'serie')
						ll_nro								= dw_derecho.getitemnumber(1,'nro_oferta')
						if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
							dw_derecho.getchild('serie',idw_detalle)
							idw_detalle.settransobject(sqlca)
							idw_detalle.retrieve(ls_base_contrato)
						end if
						if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
							SELECT	"CADENA"."RUT"
							INTO 		:ll_rut
							FROM 		"CADENA"
							WHERE   ("CADENA"."CODIGO" = :ls_base_contrato) and 
									  ("CADENA"."SERIE" = :ls_serie_contrato) and
									  ("CADENA"."NUMERO" = :ll_nro) 
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if gi_rut>0 then
									if gi_rut = ll_rut then
										dw_derecho.setitem(1,'estado_contrato',0)
										cb_aceptar.enabled	= true
										dw_seguro.enabled	= true
									else
										ll_resp	= messagebox("Advertencia","Derecho Especial Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
													  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
													  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
													  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
										if ll_resp=1 then
											dw_derecho.setitem(1,'estado_contrato',0)
											cb_aceptar.enabled	= true
											dw_seguro.enabled	= true
										else
											dw_derecho.setitem(1,'estado_contrato',1)
											cb_aceptar.enabled	= false
											dw_seguro.enabled	= false
										end if
									end if
								end if
							else
								MessageBox("Derecho Especial" , "No Existe el Contrato Asociado")	
								dw_derecho.setitem(1,'estado_contrato',1)
								cb_aceptar.enabled	= false
								dw_seguro.enabled	= false
							end if
						end if
					end if
				end if
				dw_derecho.setfocus()
				dw_derecho.setcolumn('rut')
			ELSE
				pb_limpiar.triggerevent(clicked!)
			END IF
		END IF
	end if
end if
IF ls_columna = "compute" THEN
	if String(getitemstring(1,'compute')) <> String(gf_obtener_dv(long(GetItemNumber(1, "rut")))) then
		messagebox('Error','El Rut no es valido',stopsign!)
		cb_aceptar.setfocus()
		this.setfocus()
		this.SetColumn('rut')
	end if
end if
if ls_columna= 'fecha_prim' then
	ldt_fecha_prim	= dw_derecho.getitemdatetime(1,'fecha_prim')
	ll_nro_cuotas	= dw_derecho.getitemnumber(1,'plazo')
	if not isnull(ldt_fecha_prim) and not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 then
		ls_fecha			= f_fecha_vcto_prim(  ll_nro_cuotas ,  ldt_fecha_prim  )
		if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
			dw_derecho.setitem(1,'fecha_ult',date(ls_fecha))
		end if
	end if
end if
IF ls_columna = "nro_oferta" or ls_columna='serie' THEN
	ls_base_contrato 	= "O"
	ls_serie_contrato = GetItemString(1,"serie")
	ll_nro 				= GetItemNumber(1,"nro_oferta")
	if not isnull(ls_serie_contrato) and ll_nro>0 then
		SELECT 	"CADENA"."NUMERO"
		INTO 		:ll_nro_contrato
		FROM 		"CADENA"
		WHERE  ( "CADENA"."CODIGO" = :ls_base_contrato) and 
				 ( "CADENA"."SERIE" = :ls_serie_contrato) and
				 ( "CADENA"."NUMERO" = :ll_nro);
		IF ll_nro <> ll_nro_contrato THEN
			MessageBox("Derecho Especial" , "No existe Promesa Nº: "+ls_base_contrato+'-'+ls_serie_contrato+'-'+string(ll_nro,"###,###,###,###"))	
			this.setitem(1,'estado_contrato',0)
			cb_aceptar.enabled	= false
			dw_seguro.enabled	= false
		ELSE
			this.setitem(1,'estado_contrato',1)
			cb_aceptar.enabled	= true
			dw_seguro.enabled	= true
			SELECT	"OFERTA_V"."COD_AGE"  
			INTO 		:ls_agente  
			FROM 		"OFERTA_V"  
			WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_contrato ) AND  
					 ( "OFERTA_V"."NRO_OFERTA" = :ll_nro )   ;
					 
			SELECT	"AGENTES"."COD_PARQUE"  
			INTO 		:gl_cod_parque  
			FROM 		"AGENTES"  
			WHERE 	"AGENTES"."COD_AGE" = :ls_agente   
			USING		sqlca;
			if sqlca.sqlcode=0 then dw_derecho.setitem(1,'cadena_cod_parque',gl_cod_parque)
		END IF
	end if
END IF

//IF ls_columna = "fecha_ingreso" THEN
//	dw_derecho.SetItem(1 , "uf_dia", gf_uf( String(GetItemDateTime(1, "fecha_ingreso"),"dd/mm/yyyy") ) )
//	dw_derecho.AcceptText()
//END IF

if ls_columna='kapital' or ls_columna='tasa' or ls_columna='valor_cuo' or ls_columna='valor_cuota_m' or ls_columna='pie' then
	ls_moneda	= this.getitemstring(1,'moneda')
	lld_tasa		= double(dw_derecho.getitemnumber(1,'tasa'))
	if lld_tasa>100 then
		messagebox("Error","Valor Tasa Inválida")
		dw_derecho.setfocus()
		dw_derecho.setcolumn('tasa')
	end if
	if ls_moneda='2' then //uf
		lld_kapital				= double(dw_derecho.getitemnumber(1,'kapital'))
		lld_valor_cuo			= double(dw_derecho.getitemnumber(1,'valor_cuo'))
		lld_pie					= double(dw_derecho.getitemnumber(1,'pie'))
		if lld_kapital>=500 then 
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Precio)")
			dw_derecho.setfocus()
			dw_derecho.setcolumn('kapital')
		elseif lld_valor_cuo>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota)")
			dw_derecho.setfocus()
			dw_derecho.setcolumn('valor_cuo')
		elseif lld_pie>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Pie)")
			dw_derecho.setfocus()
			dw_derecho.setcolumn('pie')
		end if
	end if
end if
if ls_columna='valor_cuo' then
	SELECT	COUNT("LOG_DERECHO_ESPECIAL"."NRO_PAGARE")  
	INTO 		:il_modif  
	FROM 		"LOG_DERECHO_ESPECIAL"  
	WHERE  ( "LOG_DERECHO_ESPECIAL"."SERIE_P" = :gs_serie ) AND  
			 ( "LOG_DERECHO_ESPECIAL"."NRO_PAGARE" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='plazo' then
	SELECT	COUNT("LOG_DERECHO_ESPECIAL"."NRO_PAGARE")  
	INTO 		:il_modif_plazo  
	FROM 		"LOG_DERECHO_ESPECIAL"  
	WHERE  ( "LOG_DERECHO_ESPECIAL"."SERIE_P" = :gs_serie ) AND  
			 ( "LOG_DERECHO_ESPECIAL"."NRO_PAGARE" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='fecha_prim' then
	SELECT	COUNT("LOG_DERECHO_ESPECIAL"."NRO_PAGARE")  
	INTO 		:il_modif_fec  
	FROM 		"LOG_DERECHO_ESPECIAL"  
	WHERE  ( "LOG_DERECHO_ESPECIAL"."SERIE_P" = :gs_serie ) AND  
			 ( "LOG_DERECHO_ESPECIAL"."NRO_PAGARE" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='moneda' then
	ls_moneda				= dw_derecho.getitemstring(1,'moneda')
	lld_kapital				= double(dw_derecho.getitemnumber(1,'kapital'))
	lld_tasa					= double(dw_derecho.getitemnumber(1,'tasa'))
	lld_valor_cuo			= double(dw_derecho.getitemnumber(1,'valor_cuo'))
	lld_pie					= double(dw_derecho.getitemnumber(1,'pie'))
//	gd_uf_dia
	if gd_uf_dia>0 then
		if ls_moneda='1' then //peso
			if lld_kapital<500 then 
				dw_derecho.setitem(1,'kapital',long((lld_kapital * gd_uf_dia)))
			end if
			if lld_valor_cuo<500 then
				dw_derecho.setitem(1,'valor_cuo',long((lld_valor_cuo * gd_uf_dia)))
			end if
			if lld_pie<500 then
				dw_derecho.setitem(1,'pie',long((lld_pie * gd_uf_dia)))
			end if
		elseif ls_moneda='2' then //uf
			if lld_kapital>=500 then 
				dw_derecho.setitem(1,'kapital',(lld_kapital / gd_uf_dia))
			end if
			if lld_valor_cuo>=500 then
				dw_derecho.setitem(1,'valor_cuo',(lld_valor_cuo / gd_uf_dia))
			end if
			if lld_pie>=500 then
				dw_derecho.setitem(1,'pie',(lld_pie / gd_uf_dia))
			end if
		end if
		dw_derecho.accepttext()
	end if
END IF
end event

event clicked;string	ls_columna,ls_fecha
Datetime	ldt_fecha_prim
Date		ld_fecha_prim,ld_fecha_min
Long		ll_nro_cuotas,ll_dias_tope_def,ll_dias_inicio_def

SELECT	sysdate,	"TASA"."DIAS_TOPE_REPACTA",	"TASA"."DIAS_INICIO_REPACTA"  INTO :gdt_fec_sistema,	:ll_dias_tope_def,			:ll_dias_inicio_def
FROM 	"TASA"  ;

ls_columna	= dwo.name
if dw_derecho.getitemnumber(1,'estado_rut')=1 and dw_derecho.getitemnumber(1,'estado_contrato')=1 and dw_derecho.getitemnumber(1,'estado_pagare')=1 then
	CHOOSE CASE ls_columna
		CASE 'p_2'
			ls_fecha					= string(date(dw_derecho.getitemdatetime(1,'fecha')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_derecho.setitem(1,'fecha',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_derecho.setitem(1,'fecha',date(ls_fecha))
			END IF
//			this.accepttext()
//			dw_derecho.SetItem(1,'uf_dia', gf_uf( String(GetItemDateTime(1, "fecha"),"dd/mm/yyyy") ) )
//			dw_derecho.AcceptText()		
			dw_derecho.setcolumn('fecha')
			
		CASE 'p_3'
			ld_fecha_prim	= date(dw_derecho.getitemdatetime(1,'fecha_prim'))
			ld_fecha_min	= RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1))
			if ld_fecha_prim < ld_fecha_min then
				messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
				dw_derecho.setitem(1,'fecha_prim',date(gdt_fec_sistema))
				dw_derecho.accepttext()
			else
				ls_fecha					= string(date(dw_derecho.getitemdatetime(1,'fecha_prim')))
				if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_derecho.setitem(1,'fecha_prim',datetime(string(id_fecha_dia,gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_derecho.setitem(1,'fecha_prim',date(ls_fecha))
				END IF
				dw_derecho.setcolumn('fecha_prim')
				this.accepttext()
				ldt_fecha_prim	= dw_derecho.getitemdatetime(1,'fecha_prim')
				ll_nro_cuotas	= dw_derecho.getitemnumber(1,'plazo')
				if not isnull(ldt_fecha_prim) and not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 then
					ls_fecha			= f_fecha_vcto_prim(  ll_nro_cuotas ,  ldt_fecha_prim  )
					if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
						dw_derecho.setitem(1,'fecha_ult',date(ls_fecha))
					end if
				end if
			end if
		CASE 'p_4'
			ls_fecha					= string(date(dw_derecho.getitemdatetime(1,'fecha_ult')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_derecho.setitem(1,'fecha_ult',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_derecho.setitem(1,'fecha_ult',date(ls_fecha))
			END IF
			dw_derecho.setcolumn('fecha_ult')
	END CHOOSE
end if
end event

