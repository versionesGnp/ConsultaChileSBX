forward
global type w_entregar_documento_tit_dom_ccto_def from window
end type
type cb_ctacte from commandbutton within w_entregar_documento_tit_dom_ccto_def
end type
type cb_5 from commandbutton within w_entregar_documento_tit_dom_ccto_def
end type
type cb_limpiar from commandbutton within w_entregar_documento_tit_dom_ccto_def
end type
type cb_grabar from commandbutton within w_entregar_documento_tit_dom_ccto_def
end type
type pb_ok from picturebutton within w_entregar_documento_tit_dom_ccto_def
end type
type em_numero from editmask within w_entregar_documento_tit_dom_ccto_def
end type
type st_3 from statictext within w_entregar_documento_tit_dom_ccto_def
end type
type ddlb_serie from dropdownlistbox within w_entregar_documento_tit_dom_ccto_def
end type
type st_2 from statictext within w_entregar_documento_tit_dom_ccto_def
end type
type ddlb_base from dropdownlistbox within w_entregar_documento_tit_dom_ccto_def
end type
type st_1 from statictext within w_entregar_documento_tit_dom_ccto_def
end type
type cb_cerrar from commandbutton within w_entregar_documento_tit_dom_ccto_def
end type
type dw_contrato from datawindow within w_entregar_documento_tit_dom_ccto_def
end type
end forward

global type w_entregar_documento_tit_dom_ccto_def from window
integer width = 2574
integer height = 1600
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_5 cb_5
cb_limpiar cb_limpiar
cb_grabar cb_grabar
pb_ok pb_ok
em_numero em_numero
st_3 st_3
ddlb_serie ddlb_serie
st_2 st_2
ddlb_base ddlb_base
st_1 st_1
cb_cerrar cb_cerrar
dw_contrato dw_contrato
end type
global w_entregar_documento_tit_dom_ccto_def w_entregar_documento_tit_dom_ccto_def

type variables
string	is_opcion
end variables

on w_entregar_documento_tit_dom_ccto_def.create
this.cb_ctacte=create cb_ctacte
this.cb_5=create cb_5
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.pb_ok=create pb_ok
this.em_numero=create em_numero
this.st_3=create st_3
this.ddlb_serie=create ddlb_serie
this.st_2=create st_2
this.ddlb_base=create ddlb_base
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_contrato=create dw_contrato
this.Control[]={this.cb_ctacte,&
this.cb_5,&
this.cb_limpiar,&
this.cb_grabar,&
this.pb_ok,&
this.em_numero,&
this.st_3,&
this.ddlb_serie,&
this.st_2,&
this.ddlb_base,&
this.st_1,&
this.cb_cerrar,&
this.dw_contrato}
end on

on w_entregar_documento_tit_dom_ccto_def.destroy
destroy(this.cb_ctacte)
destroy(this.cb_5)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.pb_ok)
destroy(this.em_numero)
destroy(this.st_3)
destroy(this.ddlb_serie)
destroy(this.st_2)
destroy(this.ddlb_base)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_contrato)
end on

event open;String	ls_base,ls_serie
gf_centrar(w_entregar_documento_tit_dom_ccto_def)
is_opcion						= Message.StringParm
if is_opcion='T' then
	w_entregar_documento_tit_dom_ccto_def.title	= 'Entregar Titulo de Dominio'
elseif is_opcion='C' then
	w_entregar_documento_tit_dom_ccto_def.title	= 'Entregar Contrato Definitivo'
end if
ddlb_base.text				= 'O'
dw_contrato.dataobject	= 'dw_datos_credito_promesa_cambio_estado'
dw_contrato.settransobject(sqlca)
ddlb_serie.reset()
ls_base						= mid(trim(ddlb_base.text),1,1)
DECLARE	x1 CURSOR FOR  
SELECT 	"TABLA_SERIES"."SERIE"  
FROM 	"TABLA_SERIES"  
WHERE 	"TABLA_SERIES"."BASE" = :ls_base   
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0 
		fetch x1 into :ls_serie;
		if not isnull(ls_serie) then
			ddlb_serie.AddItem(trim(ls_serie))
		end if
		setnull(ls_serie)
	LOOP
end if
close x1;
end event

type cb_ctacte from commandbutton within w_entregar_documento_tit_dom_ccto_def
event ue_mousemove pbm_mousemove
integer x = 859
integer y = 1324
integer width = 407
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuen&ta Corriente"
end type

event clicked;string param
if dw_contrato.rowcount()>0 then
	gs_base		= mid(trim(ddlb_base.text),1,1)
	gs_serie		= trim(ddlb_serie.text)
	gi_numero	= Double(em_numero.text)
	gi_rut		= dw_contrato.getitemnumber(1,'cliente_rut')
	param     	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R" //Reprog. Mant
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
		CASE "A" // Aumento Capacidad
			OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if
end event

type cb_5 from commandbutton within w_entregar_documento_tit_dom_ccto_def
integer x = 603
integer y = 1324
integer width = 251
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_contrato.rowcount() > 0 then
	gs_base		= mid(trim(ddlb_base.text),1,1)
	gs_serie		= trim(ddlb_serie.text)
	gi_numero	= Double(em_numero.text)
	gi_rut		= dw_contrato.getitemnumber(1,'cliente_rut')
	if gi_rut>0 and gi_numero>0 then 
		if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
		open(w_cobranza_historica)
	end if
end if
end event

type cb_limpiar from commandbutton within w_entregar_documento_tit_dom_ccto_def
integer x = 1563
integer y = 1324
integer width = 279
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String	ls_base,ls_serie
dw_contrato.reset()
ddlb_serie.reset()
em_numero.text	= ''
ls_base			= mid(ddlb_base.text,1,1)
DECLARE	x1 CURSOR FOR  
SELECT 	"TABLA_SERIES"."SERIE"  
FROM 		"TABLA_SERIES"  
WHERE 	"TABLA_SERIES"."BASE" = :ls_base   
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0 
		fetch x1 into :ls_serie;
		if not isnull(ls_serie) then
			ddlb_serie.AddItem(trim(ls_serie))
		end if
		setnull(ls_serie)
	LOOP
end if
close x1;
end event

type cb_grabar from commandbutton within w_entregar_documento_tit_dom_ccto_def
integer x = 32
integer y = 1324
integer width = 306
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_base,ls_serie,ls_estado,ls_glosa,ls_estado_tit
Long		ll_rut,ll_count_reg,ll_count
date		ldt_fecha_hoy
Double	ll_numero
if dw_contrato.rowcount()>0 then
	ls_base						= mid(trim(ddlb_base.text),1,1)
	ls_serie						= trim(ddlb_serie.text)
	ll_numero					= Double(em_numero.text)
	if not isnull(ls_base) and not isnull(ls_serie) and ll_numero>0 then
		ll_rut						= dw_contrato.getitemnumber(1,'cliente_rut')
		ldt_fecha_hoy			= date(gdt_fec_sistema)
		if is_opcion='T' then  //Actualizar Titulo de Dominio
			SELECT	"CADENA"."ESTADO_TITULO"  
			INTO 		:ls_estado_tit  
			FROM 		"CADENA"  
			WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) 
			USING		sqlca;
			if ls_estado_tit = 'I' then
				UPDATE	"CADENA"  
				SET 		"ESTADO_TITULO" = 'S',   
							"FECHA_TITULO" = :ldt_fecha_hoy  
				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					ls_estado		= '25'
					ls_glosa			= 'ENTREGA TITULO DE DOMINIO EL DIA '+string(ldt_fecha_hoy,"dd/mm/yyyy")+', USUARIO GESTOR '+gs_user
					INSERT INTO		"ATENCION_LOG"  
								( "RUT",		"ESTADO",	"FECHA",				"GLOSA",		"USUARIO",	"BASE",		"SERIE",		"NUMERO" )  
					VALUES	( :ll_rut,	:ls_estado,	:ldt_fecha_hoy,	:ls_glosa,	:gs_user,	:ls_base,	:ls_serie,	:ll_numero )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						messagebox("Grabar","Grabación Exitosa")
						cb_limpiar.triggerevent(clicked!)
					else
						rollback;
						messagebox("Error Grabar","Error al Insertar Registro en ATENCION_LOG SQL: "+sqlca.sqlerrtext)
					end if
				else
					rollback;
					messagebox("Error Grabar","Error al Actualizar Estado Título Entregado SQL: "+sqlca.sqlerrtext)
				end if
			else
				messagebox("Advertencia","Titulo de Dominio debe estar Impreso")
			end if
			
		elseif is_opcion='C' then //Actualizar Contrato Definitivo
			SELECT	COUNT("CARTA_LOG"."BASE")  
			INTO 		:ll_count_reg  
			FROM 		"CARTA_LOG"  
			WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
					 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
					 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
					 ( "CARTA_LOG"."COD_ACCION" = 8 )   ;
			if ll_count_reg > 0 then
				ls_glosa	= 'ENTREGA CONTRATO DEFINITIVO el día '+string(ldt_fecha_hoy)+', usuario gestor '+gs_user
				INSERT INTO   "ATENCION_LOG"  
								( "RUT",		"ESTADO",	"FECHA",				"GLOSA",		"USUARIO",	"BASE",		"SERIE",		"NUMERO" )  
				VALUES 		( :ll_rut,	'26',			:ldt_fecha_hoy,	:ls_glosa,	:gs_user,	:ls_base,	:ls_serie,	:ll_numero )  
				USING			sqlca;
				if sqlca.sqlcode=0 then
					commit;
					messagebox("Grabar","Grabación Exitosa")
					cb_limpiar.triggerevent(clicked!)
				else
					rollback;
					messagebox("Error Grabar","Error al Insertar Registro en ATENCION_LOG SQL: "+sqlca.sqlerrtext)
				end if
			else
				messagebox("Advertencia","Contrato Definitivo debe estar IMPRESO")
			end if
		end if
	else
		if isnull(ls_base) or ls_base='' then
			messagebox("Advertencia","Debe Seleccionar Base")
			ddlb_base.setfocus()
		elseif isnull(ls_serie) or ls_serie='' then
			messagebox("Advertencia","Debe Seleccionar Serie")
			ddlb_serie.setfocus()
		elseif isnull(ll_numero) or ll_numero=0 then
			messagebox("Advertencia","Debe Ingresar Número")
			em_numero.setfocus()
		end if
	end if
else
	messagebox("Advertencia","Debe Ingresar Promesa o Contrato IsaCruz Válido")
end if
end event

type pb_ok from picturebutton within w_entregar_documento_tit_dom_ccto_def
integer x = 2345
integer y = 20
integer width = 133
integer height = 116
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;String		ls_base,ls_serie,ls_estado_tit
Long		ll_count
Double	ll_numero

ls_base		= mid(trim(ddlb_base.text),1,1)
ls_serie		= trim(ddlb_serie.text)
ll_numero	= Double(em_numero.text)
if not isnull(ls_base) and not isnull(ls_serie) and ll_numero>0 then
	if is_opcion='T' then
//		SELECT	COUNT("CARTA_LOG"."BASE")  
//		INTO		:ll_count  
//		FROM		"CARTA_LOG"  
//		WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
//				 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
//				 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
//				 ( "CARTA_LOG"."COD_ACCION" = 16 )   
		SELECT	"CADENA"."ESTADO_TITULO"  
		INTO 		:ls_estado_tit  
		FROM 		"CADENA"  
		WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
				 ( "CADENA"."SERIE" = :ls_serie ) AND  
				 ( "CADENA"."NUMERO" = :ll_numero ) 
		USING		sqlca;
		if ls_estado_tit = 'I' then
			if ls_base='O' then
				dw_contrato.dataobject	= 'dw_datos_credito_promesa_cambio_estado'
				dw_contrato.settransobject(sqlca)
				if dw_contrato.retrieve(ls_serie,ll_numero)=0 then
					messagebox("Advertencia","No Registra Dato Promesa")
				end if
			elseif ls_base='C' then
				dw_contrato.dataobject	= 'dw_datos_cuenta_bl_cto_isa_cambio_estado'
				dw_contrato.settransobject(sqlca)
				if dw_contrato.retrieve(ls_serie,ll_numero)=0 then
					messagebox("Advertencia","No Registra Dato Contrato IsaCruz")
				end if
			end if
		else
			messagebox("Advertencia","Titulo de Dominio debe estar Impreso")
		end if
	elseif is_opcion='C' then
		SELECT	COUNT("CARTA_LOG"."BASE")  
		INTO 		:ll_count  
		FROM 	"CARTA_LOG"  
		WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
				 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
				 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
				 ( "CARTA_LOG"."COD_ACCION" = 8 )   ;
		if ll_count=0 then
			messagebox("Advertencia","Contrato Definitivo debe estar IMPRESO")
		else
			if ls_base='O' then
				dw_contrato.dataobject	= 'dw_datos_credito_promesa_cambio_estado'
				dw_contrato.settransobject(sqlca)
				if dw_contrato.retrieve(ls_serie,ll_numero)=0 then
					messagebox("Advertencia","No Registra Dato Promesa")
				end if
			elseif ls_base='C' then
				dw_contrato.dataobject	= 'dw_datos_cuenta_bl_cto_isa_cambio_estado'
				dw_contrato.settransobject(sqlca)
				if dw_contrato.retrieve(ls_serie,ll_numero)=0 then
					messagebox("Advertencia","No Registra Dato Contrato IsaCruz")
				end if
			end if
		end if
	end if
else
	if isnull(ls_base) or ls_base='' then
		messagebox("Advertencia","Debe Seleccionar Base")
		ddlb_base.setfocus()
	elseif isnull(ls_serie) or ls_serie='' then
		messagebox("Advertencia","Debe Seleccionar Serie")
		ddlb_serie.setfocus()
	elseif isnull(ll_numero) or ll_numero=0 then
		messagebox("Advertencia","Debe Ingresar Número")
		em_numero.setfocus()
	end if
end if
end event

type em_numero from editmask within w_entregar_documento_tit_dom_ccto_def
integer x = 1842
integer y = 32
integer width = 407
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;dw_contrato.reset()
if long(this.text) > 0 and not isnull(ddlb_base.text) and not isnull(ddlb_serie.text) then pb_ok.triggerevent(clicked!)
end event

type st_3 from statictext within w_entregar_documento_tit_dom_ccto_def
integer x = 1577
integer y = 44
integer width = 224
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_serie from dropdownlistbox within w_entregar_documento_tit_dom_ccto_def
integer x = 1271
integer y = 32
integer width = 270
integer height = 376
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_contrato.reset()
em_numero.text	= ''
end event

type st_2 from statictext within w_entregar_documento_tit_dom_ccto_def
integer x = 1097
integer y = 44
integer width = 165
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Serie"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_base from dropdownlistbox within w_entregar_documento_tit_dom_ccto_def
integer x = 197
integer y = 32
integer width = 837
integer height = 400
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
string item[] = {"O - Promesa","C - Contrato IsaCruz"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String	ls_base,ls_serie
dw_contrato.reset()
ddlb_serie.reset()
em_numero.text	= ''
ls_base	= mid(ddlb_base.text,1,1)
DECLARE	x1 CURSOR FOR  
SELECT 	"TABLA_SERIES"."SERIE"  
FROM 		"TABLA_SERIES"  
WHERE 	"TABLA_SERIES"."BASE" = :ls_base   
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0 
		fetch x1 into :ls_serie;
		if not isnull(ls_serie) then
			ddlb_serie.AddItem(trim(ls_serie))
		end if
		setnull(ls_serie)
	LOOP
end if
close x1;
end event

type st_1 from statictext within w_entregar_documento_tit_dom_ccto_def
integer x = 32
integer y = 44
integer width = 146
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_entregar_documento_tit_dom_ccto_def
integer x = 2144
integer y = 1324
integer width = 334
integer height = 96
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_entregar_documento_tit_dom_ccto_def)
end event

type dw_contrato from datawindow within w_entregar_documento_tit_dom_ccto_def
integer x = 27
integer y = 164
integer width = 2482
integer height = 1128
integer taborder = 50
string title = "none"
string dataobject = "dw_datos_cuenta_bl_cto_isa_cambio_estado"
boolean border = false
boolean livescroll = true
end type

