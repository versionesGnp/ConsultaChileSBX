forward
global type w_mensaje_atencion_parque from window
end type
type cb_cerrar from commandbutton within w_mensaje_atencion_parque
end type
type cb_grabar from commandbutton within w_mensaje_atencion_parque
end type
type dw_ingreso from datawindow within w_mensaje_atencion_parque
end type
end forward

global type w_mensaje_atencion_parque from window
integer width = 2702
integer height = 1624
boolean titlebar = true
string title = "Gestión Administración Parque"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_ingreso dw_ingreso
end type
global w_mensaje_atencion_parque w_mensaje_atencion_parque

on w_mensaje_atencion_parque.create
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.cb_cerrar,&
this.cb_grabar,&
this.dw_ingreso}
end on

on w_mensaje_atencion_parque.destroy
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_ingreso)
end on

event open;Long		ll_new
String		ls_area,ls_sector,ls_sepultura,ls_base,ls_serie
Double	ll_numero
SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

gf_centrar(w_mensaje_atencion_parque)
dw_ingreso.settransobject(sqlca)
ll_new	= dw_ingreso.insertrow(0)
dw_ingreso.setitem(ll_new,'usuario',gs_user)
dw_ingreso.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
dw_ingreso.setitem(ll_new,'fecha_estado',date(gdt_fec_sistema))
dw_ingreso.setitem(ll_new,'base',gs_base)
dw_ingreso.setitem(ll_new,'serie',gs_serie)
dw_ingreso.setitem(ll_new,'numero',gi_numero)
dw_ingreso.setitem(ll_new,'rut',gi_rut)
if gs_base='C' then
	SELECT	"CONTRATO"."ZONA",   
				"CONTRATO"."SECTOR",   
				"CONTRATO"."SEPULTURA"  
	INTO 		:ls_area,   
				:ls_sector,   
				:ls_sepultura  
	FROM 	"CONTRATO",   
				"CADENA"  
	WHERE  ( "CONTRATO"."SERIE_C" = "CADENA"."SERIE" ) and  
			 ( "CONTRATO"."NRO_CONTRATO" = "CADENA"."NUMERO" ) and  
			 (("CADENA"."CODIGO" = :gs_base ) AND  
			 ( "CADENA"."SERIE" = :gs_serie ) AND  
			 ( "CADENA"."NUMERO" = :gi_numero ) )  
	USING	sqlca;

elseif gs_base='O' or gs_base='U' then
	SELECT	"PAGO_OFERTA"."AREA",   
				"PAGO_OFERTA"."SECTOR",   
				"PAGO_OFERTA"."SEPULTURA"  
	INTO 		:ls_area,   
				:ls_sector,   
				:ls_sepultura  
	FROM 	"CADENA",   
				"OFERTA_V",   
				"PAGO_OFERTA"  
	WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
			 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
			 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
			 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
			 (("CADENA"."CODIGO" = :gs_base ) AND  
			 ( "CADENA"."SERIE" = :gs_serie ) AND  
			 ( "CADENA"."NUMERO" = :gi_numero ) )   
	USING	sqlca;
	
elseif gs_base='A' then
	SELECT	"ANEXO_AUMENTO"."BASE",   
				"ANEXO_AUMENTO"."SERIE",   
				"ANEXO_AUMENTO"."NRO_OFERTA"  
	INTO 		:ls_base,   
				:ls_serie,   
				:ll_numero  
	FROM 	"ANEXO_AUMENTO",   
				"CADENA",   
				"PAGO_AUMENTO"  
	WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
			 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
			 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
			 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
			 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
			 (( "CADENA"."CODIGO" = :gs_base ) AND  
			 ( "CADENA"."SERIE" = :gs_serie ) AND  
			 ( "CADENA"."NUMERO" = :gi_numero ) )  
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if ll_numero > 0 then
			if ls_base='C' then
				SELECT	"CONTRATO"."ZONA",   
							"CONTRATO"."SECTOR",   
							"CONTRATO"."SEPULTURA"  
				INTO 		:ls_area,   
							:ls_sector,   
							:ls_sepultura  
				FROM 		"CONTRATO",   
							"CADENA"  
				WHERE  ( "CONTRATO"."SERIE_C" = "CADENA"."SERIE" ) and  
						 ( "CONTRATO"."NRO_CONTRATO" = "CADENA"."NUMERO" ) and  
						 (("CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero ) )  
				USING		sqlca;
			
			elseif ls_base='O' or ls_base='U' then
				SELECT	"PAGO_OFERTA"."AREA",   
							"PAGO_OFERTA"."SECTOR",   
							"PAGO_OFERTA"."SEPULTURA"  
				INTO 		:ls_area,   
							:ls_sector,   
							:ls_sepultura  
				FROM 		"CADENA",   
							"OFERTA_V",   
							"PAGO_OFERTA"  
				WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
						 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						 (("CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero ) )   
				USING		sqlca;
			end if
		end if
	end if
end if
if not isnull(ls_area) 		then dw_ingreso.setitem(ll_new,'area',ls_area)
if not isnull(ls_sector) 	then dw_ingreso.setitem(ll_new,'sector',ls_sector)
if not isnull(ls_sepultura) then dw_ingreso.setitem(ll_new,'sepultura',ls_sepultura)
dw_ingreso.accepttext()
end event

type cb_cerrar from commandbutton within w_mensaje_atencion_parque
integer x = 2363
integer y = 1368
integer width = 283
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mensaje_atencion_parque)
end event

type cb_grabar from commandbutton within w_mensaje_atencion_parque
integer x = 46
integer y = 1368
integer width = 283
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_estado,ls_obs
Datetime	ldt_fecha
Long		ll_tot_reg

dw_ingreso.accepttext()
ls_estado	= dw_ingreso.getitemstring(1,'estado')
ldt_fecha		= dw_ingreso.getitemdatetime(1,'fecha_estado')
ls_obs		= dw_ingreso.getitemstring(1,'observacion')
if isnull(ls_estado) or ls_estado='' then
	messagebox("Advertencia","Debe Ingresar Estado")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('estado')
elseif isnull(ldt_fecha) then
	messagebox("Advertencia","Debe Ingresar Fecha Gestión")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('fecha_estado')
elseif isnull(ls_obs) or ls_obs='' or ls_obs='-' then
	messagebox("Advertencia","Debe Ingresar Observación")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('observacion')
else
	if dw_ingreso.update()=1 then
		commit;
		if isvalid(w_cobranza_historica) then
			if w_cobranza_historica.tab_1.tabpage_6.dw_parque.dataobject	= 'dw_lista_detalle_atencion_parque' then
				ll_tot_reg	= w_cobranza_historica.tab_1.tabpage_6.dw_parque.retrieve(gi_rut)
			else
				w_cobranza_historica.tab_1.tabpage_6.dw_parque.dataobject	= 'dw_lista_detalle_atencion_parque'
				w_cobranza_historica.tab_1.tabpage_6.dw_parque.settransobject(sqlca)
				ll_tot_reg	= w_cobranza_historica.tab_1.tabpage_6.dw_parque.retrieve(gi_rut)
			end if
		end if
		messagebox("Grabar","Grabación Exitosa")
		close(w_mensaje_atencion_parque)
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Observación Parque SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type dw_ingreso from datawindow within w_mensaje_atencion_parque
integer x = 37
integer y = 32
integer width = 2629
integer height = 1308
integer taborder = 10
string dataobject = "dw_ingreso_atencion_parque"
boolean border = false
boolean livescroll = true
end type

event clicked;string ls_columna,ls_fecha,fech

ls_columna		= dwo.name
if ls_columna='p_1' then
	ls_fecha					= string(date(dw_ingreso.getitemdatetime(1,'fecha_estado')))
	if isnull(ls_fecha) then ls_fecha = string(gdt_fec_sistema,"dd/mm/yyyy")
	if f_valida_fecha(ls_fecha)=-1 then 
		dw_ingreso.setitem(1,'fecha_estado',datetime(string(gdt_fec_sistema,gs_formato_fecha)))
		return
	end if
	OpenWithParm(w_calendar,ls_fecha)
	IF not isnull(Message.StringParm) THEN
		ls_fecha				= trim(Message.StringParm)
		dw_ingreso.setitem(1,'fecha_estado',date(ls_fecha))
	END IF
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('fecha_estado')
end if
end event

