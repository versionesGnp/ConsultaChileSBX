forward
global type w_ingreso_tramo_masiva from window
end type
type hpb_1 from hprogressbar within w_ingreso_tramo_masiva
end type
type cb_cancelar from commandbutton within w_ingreso_tramo_masiva
end type
type cb_aceptar from commandbutton within w_ingreso_tramo_masiva
end type
type dw_tramos_nuevos from datawindow within w_ingreso_tramo_masiva
end type
type st_7 from statictext within w_ingreso_tramo_masiva
end type
type cb_importar from commandbutton within w_ingreso_tramo_masiva
end type
type st_1 from statictext within w_ingreso_tramo_masiva
end type
end forward

global type w_ingreso_tramo_masiva from window
integer width = 2711
integer height = 1804
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
hpb_1 hpb_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_tramos_nuevos dw_tramos_nuevos
st_7 st_7
cb_importar cb_importar
st_1 st_1
end type
global w_ingreso_tramo_masiva w_ingreso_tramo_masiva

type variables
long il_row
end variables

on w_ingreso_tramo_masiva.create
this.hpb_1=create hpb_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_tramos_nuevos=create dw_tramos_nuevos
this.st_7=create st_7
this.cb_importar=create cb_importar
this.st_1=create st_1
this.Control[]={this.hpb_1,&
this.cb_cancelar,&
this.cb_aceptar,&
this.dw_tramos_nuevos,&
this.st_7,&
this.cb_importar,&
this.st_1}
end on

on w_ingreso_tramo_masiva.destroy
destroy(this.hpb_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_tramos_nuevos)
destroy(this.st_7)
destroy(this.cb_importar)
destroy(this.st_1)
end on

event open;string 		ls_usua,ls_tipo_dscto
long			ll_cod_tramo,ll_codigo_tramo,ll_valor_dscto
datetime 	ld_fecha_ini,ld_fecha_fin

ll_cod_tramo		= Message.DoubleParm
hpb_1	.visible			= false

SELECT  "WEB_DESCUENTOS_TRAMO"."CODIGO_TRAMO",
			"WEB_DESCUENTOS_TRAMO"."VALOR_DESCUENTO",
			"WEB_DESCUENTOS_TRAMO"."TIPO_DESCUENTO",
			"WEB_DESCUENTOS_TRAMO"."FECHA_VIGENCIA_INI",
			"WEB_DESCUENTOS_TRAMO"."FECHA_VIGENCIA_FIN"
INTO 		:ll_codigo_tramo,
			:ll_valor_dscto,
			:ls_tipo_dscto,
			:ld_fecha_ini,
			:ld_fecha_fin
FROM 	"WEB_DESCUENTOS_TRAMO"
WHERE 	"WEB_DESCUENTOS_TRAMO"."CODIGO_TRAMO" =  :ll_cod_tramo;


/*sle_tramo.text 		= string(ll_codigo_tramo)
sle_dscto.text 		= string(ll_valor_dscto)
sle_t_dscto.text 	= string(ls_tipo_dscto)
sle_f_ini.text 		= string(date(ld_fecha_ini), "dd/mm/yyyy")
sle_f_fin.text 		= string(date(ld_fecha_fin), "dd/mm/yyyy")*/

end event

type hpb_1 from hprogressbar within w_ingreso_tramo_masiva
integer x = 855
integer y = 1588
integer width = 1106
integer height = 96
unsignedinteger maxposition = 100
integer setstep = 10
end type

type cb_cancelar from commandbutton within w_ingreso_tramo_masiva
integer x = 2363
integer y = 1588
integer width = 302
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;close(w_ingreso_tramo_masiva)
end event

type cb_aceptar from commandbutton within w_ingreso_tramo_masiva
integer x = 2007
integer y = 1588
integer width = 302
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;String ls_empresa,ls_contrato,ls_movimiento,ls_e_reg,ls_usuario,ls_base,ls_serie,ls_opcion,ls_commit,ls_mensaje
Long ll_tramo,ll_cantidad,ll_fila_dw_ori,ll_tot_reg,ll_numero,ll_fila,ldb_tot_porc
Date ld_inicio,ld_fin,fecha_actual

ll_tot_reg				= dw_tramos_nuevos.rowcount()
ll_fila_dw_ori			= dw_tramos_nuevos.getrow()
ls_empresa				= '01'
ls_opcion					= 'INS'
ls_commit				= '1'
fecha_actual 			= Today()

if messagebox("AGREGAR",'¿Desea agregar los contratos seleccionados?',Exclamation!,YesNo!,2) = 1 then
	hpb_1	.visible			= true
	SetPointer(HourGlass!)
	for ll_fila_dw_ori=1 to ll_tot_reg
		ls_base			= dw_tramos_nuevos.GetItemString(ll_fila_dw_ori,'base')
		ls_serie			= dw_tramos_nuevos.GetItemString(ll_fila_dw_ori,'serie')
		ll_numero		= dw_tramos_nuevos.GetItemNumber(ll_fila_dw_ori,'numero')
		ls_contrato 		= ls_base+ls_serie+string(ll_numero)
		ls_movimiento	= dw_tramos_nuevos.GetItemString(ll_fila_dw_ori,'c_codigo_mov')
		ll_cantidad		= dw_tramos_nuevos.GetItemNumber(ll_fila_dw_ori,'n_cantidad_det')
		ll_tramo			= Long(dw_tramos_nuevos.GetItemString(ll_fila_dw_ori,'c_codigo_trm'))
		ls_e_reg			= dw_tramos_nuevos.GetItemString(ll_fila_dw_ori,'c_codigo_reg')
		
		 SELECT "WEB_DESCUENTOS_TRAMO"."FECHA_VIGENCIA_INI",   
         			"WEB_DESCUENTOS_TRAMO"."FECHA_VIGENCIA_FIN"  
		 INTO 	:ld_inicio,   
					:ld_fin  
		 FROM 	"WEB_DESCUENTOS_TRAMO"  
		 WHERE 	( "WEB_DESCUENTOS_TRAMO"."CODIGO_TRAMO" = :ll_tramo ) AND  
					( "WEB_DESCUENTOS_TRAMO"."ESTADO" = 'A' )    ;
		
		ldb_tot_porc							= (ll_fila_dw_ori / ll_tot_reg) * 100
		hpb_1.Position 						= ldb_tot_porc
		
		DECLARE usp_mantencion PROCEDURE FOR SP_MASIVA_DESCUENTOS 
		( :ls_base,:ls_serie,:ll_numero, :ll_tramo, :gs_user, :ld_inicio, :ld_fin  )  
		Using sqlca;
		EXECUTE usp_mantencion;
		CLOSE usp_mantencion;
	NEXT
	CLOSE usp_mantencion;
	messagebox('MENSAJE','Contratos Autorizados con Exito')
	close(w_ingreso_tramo)
end if
CLOSE usp_mantencion;
if isvalid(w_ingreso_tramo_masiva) then close(w_ingreso_tramo_masiva)
open(w_ingreso_tramo_masiva)

end event

type dw_tramos_nuevos from datawindow within w_ingreso_tramo_masiva
integer x = 73
integer y = 292
integer width = 2583
integer height = 1264
integer taborder = 20
string title = "none"
string dataobject = "dw_registros_txt_masivo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;il_row						= row
IF il_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;il_row						= this.getrow()
IF il_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if

end event

event rowfocuschanging;il_row						= this.getrow()
IF il_row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if

end event

type st_7 from statictext within w_ingreso_tramo_masiva
integer x = 69
integer y = 172
integer width = 736
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Contratos Seleccionados"
boolean focusrectangle = false
end type

type cb_importar from commandbutton within w_ingreso_tramo_masiva
integer x = 2153
integer y = 84
integer width = 489
integer height = 124
integer taborder = 10
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Importar"
end type

event clicked;String		ls_archivo,ls_base,ls_serie,ls_codigo_tramos,ls_tramo_ori,ls_cad_base,ls_cad_serie,ls_contrato_ori,&
			ls_contrato_cli,ls_contrato_cad,ls_estado_ori,ls_wpa_base,ls_wpa_serie,ls_wpa_contrato,ls_wpa_estado_reg,&
			ls_tipo_mov,ls_cod_tramo,ls_cod_mov
Long		ll_fila,ll_tramo_ori,ll_fila_dw_ori,ll_tramo_det,ll_tot_reg,ll_count_ctto,ll_count_vig,ll_row,ll_cad_numero,&
			ll_wpa_numero,ll_cantidad_cuotas,ll_cant_det,ll_cantidad_mantencion
Double	ll_numero,ll_codigo_tramos,ldb_tot_porc
Date		ldt_fec_ini_ori,ldt_fec_fin_ori,ld_fecha_ini,ld_fecha_fin,ld_fecha_ini_tramo,ld_fecha_fin_tramo

dw_tramos_nuevos.reset()
dw_tramos_nuevos.accepttext()
SetNull(ls_archivo)
dw_tramos_nuevos.ImportFile(ls_archivo)
dw_tramos_nuevos.accepttext()

//ls_codigo_tramos 		= sle_tramo.text
//ld_fecha_ini				= date(sle_f_ini.text)
//ld_fecha_fin				= date(sle_f_fin.text)
ll_tot_reg				= dw_tramos_nuevos.rowcount()
ll_fila_dw_ori			= dw_tramos_nuevos.getrow()
hpb_1	.visible			= true

for ll_fila=1 to ll_tot_reg
	hpb_1	.visible			= true
	SetPointer(HourGlass!)
	ls_tramo_ori		= dw_tramos_nuevos.GetItemString(ll_fila,'c_codigo_trm')
	ldt_fec_ini_ori		= date(dw_tramos_nuevos.getitemdatetime(ll_fila,'d_ini_det'))
	ldt_fec_fin_ori		= date(dw_tramos_nuevos.getitemdatetime(ll_fila,'d_fin_det'))
	ls_base				= dw_tramos_nuevos.getitemString(ll_fila,'base')
	ls_serie				= dw_tramos_nuevos.getitemString(ll_fila,'serie')
	ll_numero			= dw_tramos_nuevos.getitemNumber(ll_fila,'numero')
	ll_cant_det			= dw_tramos_nuevos.getitemNumber(ll_fila,'n_cantidad_det')
	ls_tipo_mov			= dw_tramos_nuevos.getitemString(ll_fila,'c_codigo_mov')
	ls_contrato_ori		= ls_base+ls_serie+string(ll_numero)
	
	SELECT 	count(*) 
    	INTO 		:ll_cantidad_cuotas  
    	FROM 	"CUPONERAS_DETALLE"  
   	WHERE 	( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
         		( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
         		( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
         		( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND
				( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' );
	/*if ls_tipo_mov = 'E' then		
		if ll_cantidad_cuotas < ll_cant_det then
			messagebox('ERROR','La cantidad de cuotas de credito a ingresar supera las disponibles para el contrato: '+ls_contrato_ori)
			dw_tramos_nuevos.reset()
			EXIT
		end if
	end if*/
	SELECT 	count(*) 
    	INTO 		:ll_cantidad_mantencion
    	FROM 	"CUPONERAS_DETALLE"  
   	WHERE 	( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
         		( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
         		( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
         		( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND
				( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' );
	/*if ls_tipo_mov = 'F' then
		if ll_cantidad_mantencion < ll_cant_det then
			messagebox('ERROR','La cantidad de cuotas de mantencion a ingresar supera las disponibles para el contrato: '+ls_contrato_ori)
			dw_tramos_nuevos.reset()
			EXIT
		end if
	end if*/
	SELECT 		"CADENA"."CODIGO",
					"CADENA"."SERIE",
					"CADENA"."NUMERO"
	INTO			:ls_cad_base,
					:ls_cad_serie,
					:ll_cad_numero
	FROM 		"CADENA"
	WHERE 		( "CADENA"."CODIGO" 	= :ls_base  ) AND
					( "CADENA"."SERIE" 		= :ls_serie ) AND
					( "CADENA"."NUMERO" 	= :ll_numero ) AND
					( "CADENA"."ESTADO"	= 'V' OR "CADENA"."ESTADO"	= 'C')
	USING sqlca;
	
	/*if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if*/
	
	ls_contrato_cad = ls_cad_base+ls_cad_serie+string(ll_cad_numero)
	
	SELECT  "WEBPREAUTORIZADO"."BASE",
         		"WEBPREAUTORIZADO"."SERIE",
         		"WEBPREAUTORIZADO"."NUMERO",
				"WEBPREAUTORIZADO"."C_CODIGO_REG",
				"WEBPREAUTORIZADO"."C_CODIGO_TRM",
				"WEBPREAUTORIZADO"."C_CODIGO_MOV"
    	INTO 		:ls_wpa_base,
         		:ls_wpa_serie,
         		:ll_wpa_numero,
				:ls_wpa_estado_reg,
				:ls_cod_tramo,
				:ls_cod_mov
    FROM 	"WEBPREAUTORIZADO"  
   	WHERE 	( "WEBPREAUTORIZADO"."BASE" = :ls_base ) AND  
         		( "WEBPREAUTORIZADO"."SERIE" = :ls_serie ) AND  
         		( "WEBPREAUTORIZADO"."NUMERO" = :ll_numero ) AND
				("WEBPREAUTORIZADO"."C_CODIGO_REG" = 'V')
	USING sqlca;
	/*if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if*/

	ls_wpa_contrato = ls_wpa_base+ls_wpa_serie+string(ll_wpa_numero)
	
	//Fechas
	SELECT 	"WEB_DESCUENTOS_DETALLE"."FECHA_VIG_INI",   
         		"WEB_DESCUENTOS_DETALLE"."FECHA_VIG_FIN"
	INTO		:ld_fecha_ini_tramo,
				:ld_fecha_fin_tramo
   	FROM 	"WEB_DESCUENTOS_DETALLE"  
   	WHERE 	"WEB_DESCUENTOS_DETALLE"."CODIGO_TRAMO" =  :ls_tramo_ori
	USING sqlca;

	
	/*if ld_fecha_ini_tramo BETWEEN ld_fecha_ini_tramo AND ld_fecha_fin_tramo then
		messagebox('ERROR','')
	else 
		messagebox('ERROR','')
	end if*/
	
	if ls_contrato_ori <> ls_contrato_cad THEN
		messagebox('ERROR','El contrato '+ls_contrato_ori+' no existe o no esta digitado')
		dw_tramos_nuevos.reset()
		EXIT
	elseif ll_cant_det > 1  then
		messagebox('ERROR','La cantidad de cuotas es mayor a 1')
		dw_tramos_nuevos.reset()
		EXIT
	/*elseif ls_codigo_tramos <> ls_tramo_ori then 
		messagebox('ERROR','El tramo ingresado no coincide con el seleccionado')
		dw_tramos_nuevos.reset()
		close(w_ingreso_tramo)
		EXIT
	elseif ls_contrato_ori = ls_wpa_contrato and ls_cod_tramo <> ls_tramo_ori then
		messagebox('ERROR','El contrato '+ls_wpa_contrato+' ya tiene una preautorizacion vigente en otro tramo')
		dw_tramos_nuevos.reset()
		EXIT
	elseif	ls_contrato_ori = ls_wpa_contrato and ls_cod_mov = ls_tipo_mov then
		messagebox('ERROR','El contrato '+ls_wpa_contrato+' ya tiene un ingreso con el mismo movimiento')
		dw_tramos_nuevos.reset()
		EXIT
	/*elseif ls_contrato_ori = ls_wpa_contrato and ls_wpa_estado_reg = 'V' then
		messagebox('ERROR','El contrato '+ls_wpa_contrato+' ya tiene un ingreso con el mismo movimiento')
		dw_tramos_nuevos.reset()
		EXIT*/
	else*/
		//dw_tramos_nuevos.setitem(ll_fila,'d_ini_det',ld_fecha_ini)
		//dw_tramos_nuevos.setitem(ll_fila,'d_fin_det',ld_fecha_fin)
		//dw_tramos_nuevos.setitem(ll_fila,'c_codigo_reg','V')
	end if
	ldb_tot_porc							= (ll_fila / ll_tot_reg) * 100
	hpb_1.Position 						= ldb_tot_porc
next
SetPointer(Arrow!)
end event

type st_1 from statictext within w_ingreso_tramo_masiva
integer x = 69
integer y = 32
integer width = 1554
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agregar/Importar Contratos Para Tramo Web"
boolean focusrectangle = false
end type

