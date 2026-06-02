forward
global type w_detalle_datos_cliente from window
end type
type cb_ctacte from commandbutton within w_detalle_datos_cliente
end type
type pb_primer from picturebutton within w_detalle_datos_cliente
end type
type pb_sigue from picturebutton within w_detalle_datos_cliente
end type
type pb_antes from picturebutton within w_detalle_datos_cliente
end type
type pb_fin from picturebutton within w_detalle_datos_cliente
end type
type cb_detalle_datos_log from commandbutton within w_detalle_datos_cliente
end type
type cb_anular from commandbutton within w_detalle_datos_cliente
end type
type cb_grabar from commandbutton within w_detalle_datos_cliente
end type
type cb_cerrar from commandbutton within w_detalle_datos_cliente
end type
type st_1 from statictext within w_detalle_datos_cliente
end type
type dw_detalle_datos from datawindow within w_detalle_datos_cliente
end type
type gb_1 from groupbox within w_detalle_datos_cliente
end type
end forward

global type w_detalle_datos_cliente from window
integer width = 2971
integer height = 1932
boolean titlebar = true
string title = "Detalle Datos Cliente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctacte cb_ctacte
pb_primer pb_primer
pb_sigue pb_sigue
pb_antes pb_antes
pb_fin pb_fin
cb_detalle_datos_log cb_detalle_datos_log
cb_anular cb_anular
cb_grabar cb_grabar
cb_cerrar cb_cerrar
st_1 st_1
dw_detalle_datos dw_detalle_datos
gb_1 gb_1
end type
global w_detalle_datos_cliente w_detalle_datos_cliente

on w_detalle_datos_cliente.create
this.cb_ctacte=create cb_ctacte
this.pb_primer=create pb_primer
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.pb_fin=create pb_fin
this.cb_detalle_datos_log=create cb_detalle_datos_log
this.cb_anular=create cb_anular
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.st_1=create st_1
this.dw_detalle_datos=create dw_detalle_datos
this.gb_1=create gb_1
this.Control[]={this.cb_ctacte,&
this.pb_primer,&
this.pb_sigue,&
this.pb_antes,&
this.pb_fin,&
this.cb_detalle_datos_log,&
this.cb_anular,&
this.cb_grabar,&
this.cb_cerrar,&
this.st_1,&
this.dw_detalle_datos,&
this.gb_1}
end on

on w_detalle_datos_cliente.destroy
destroy(this.cb_ctacte)
destroy(this.pb_primer)
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.pb_fin)
destroy(this.cb_detalle_datos_log)
destroy(this.cb_anular)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.st_1)
destroy(this.dw_detalle_datos)
destroy(this.gb_1)
end on

event open;Datetime ldt_fecha_hoy
String	ls_ciudad,ls_nro,ls_depto,ls_block,ls_villa,ls_sector,ls_telefono,ls_celular,ls_email
Long		ll_rut

ll_rut				= Long(Message.StringParm)
gf_centrar(w_detalle_datos_cliente)
dw_detalle_datos.settransobject(sqlca)

dw_detalle_datos.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.insertrow(0)
ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
if dw_detalle_datos.retrieve(ll_rut)>0 then
	dw_detalle_datos.setfocus()
	ls_ciudad				= dw_detalle_datos.getitemstring(1,'ciudad')
	dw_detalle_datos.getchild('comuna',idw_detalle)
	idw_detalle.retrieve(ls_ciudad)
	dw_detalle_datos.setitem(1,'fecha_actualiza',ldt_fecha_hoy)
	dw_detalle_datos.setitem(1,'usuario_valida',gs_user)
	ls_nro					= dw_detalle_datos.getitemstring(1,'nro')
	ls_depto					= dw_detalle_datos.getitemstring(1,'depto')
	ls_block					= dw_detalle_datos.getitemstring(1,'block')
	ls_villa					= dw_detalle_datos.getitemstring(1,'villa_poblacion')
	ls_sector				= dw_detalle_datos.getitemstring(1,'sector')
	ls_telefono				= dw_detalle_datos.getitemstring(1,'telefono')
	ls_celular				= dw_detalle_datos.getitemstring(1,'celular')
	ls_email					= dw_detalle_datos.getitemstring(1,'email')
	
	if isnull(ls_nro) or ls_nro='' then dw_detalle_datos.setitem(1,'nro','-')
	if isnull(ls_depto) or ls_depto='' then dw_detalle_datos.setitem(1,'depto','-')
	if isnull(ls_block) or ls_block='' then dw_detalle_datos.setitem(1,'block','-')
	if isnull(ls_villa) or ls_villa='' then dw_detalle_datos.setitem(1,'villa_poblacion','-')
	if isnull(ls_sector) or ls_sector='' then dw_detalle_datos.setitem(1,'sector','-')
	if isnull(ls_telefono) or ls_telefono='' then dw_detalle_datos.setitem(1,'telefono','-')
	if isnull(ls_celular) or ls_celular='' then dw_detalle_datos.setitem(1,'celular','-')
	if isnull(ls_email) or ls_email='' then 
		dw_detalle_datos.setitem(1,'email','-')
	else
		ls_email				= Upper(ls_email)
		dw_detalle_datos.setitem(1,'email',ls_email)
	end if
	
	if dw_detalle_datos.GetItemString(1,'estado_reg')='P' then
		cb_anular.enabled				= true
		cb_grabar.enabled				= true
		dw_detalle_datos.enabled	= true
	else
		cb_grabar.enabled				= false
		cb_anular.enabled				= false
		dw_detalle_datos.enabled	= false
	end if
else
	messagebox("Advertencia","No Registra Dato")
	close(w_detalle_datos_cliente)
end if
end event

type cb_ctacte from commandbutton within w_detalle_datos_cliente
integer x = 1344
integer y = 1672
integer width = 434
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corriente"
end type

event clicked;Long		ll_rut
Double	ll_numero

ll_numero				= dw_detalle_datos.getitemnumber(dw_detalle_datos.getrow(),'numero')
ll_rut						= dw_detalle_datos.getitemnumber(dw_detalle_datos.getrow(),'rut')
if ll_numero>0 THEN
	gs_base 				= dw_detalle_datos.getitemstring(dw_detalle_datos.getrow(),'base')
	gs_serie 				= dw_detalle_datos.getitemstring(dw_detalle_datos.getrow(),'serie')
	gi_numero			= ll_numero
	gi_tipo_busqueda	= 0
elseif ll_rut>0 then
	gi_rut 				= dw_detalle_datos.getitemnumber(dw_detalle_datos.getrow(),'rut')
	gi_tipo_busqueda 	= 1
end if
if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
Open(w_listado_contratos)
end event

type pb_primer from picturebutton within w_detalle_datos_cliente
integer x = 1883
integer y = 1684
integer width = 119
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_detalle_datos.ScrollToRow(1)
dw_detalle_datos.setfocus()
end event

type pb_sigue from picturebutton within w_detalle_datos_cliente
integer x = 2007
integer y = 1684
integer width = 119
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_detalle_datos.ScrollPriorPage( )
dw_detalle_datos.setfocus()
end event

type pb_antes from picturebutton within w_detalle_datos_cliente
integer x = 2130
integer y = 1684
integer width = 119
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_detalle_datos.ScrollNextPage( )
dw_detalle_datos.setfocus()
end event

type pb_fin from picturebutton within w_detalle_datos_cliente
integer x = 2254
integer y = 1684
integer width = 119
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_detalle_datos.ScrollToRow(dw_detalle_datos.rowcount())
dw_detalle_datos.setfocus()
end event

type cb_detalle_datos_log from commandbutton within w_detalle_datos_cliente
integer x = 731
integer y = 1672
integer width = 544
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ver Registro Anterior"
end type

event clicked;long ll_rut

ll_rut	= dw_detalle_datos.getitemnumber(dw_detalle_datos.getrow(),'rut')
if isvalid(w_detalle_datos_cliente_log) then close(w_detalle_datos_cliente_log)
OpenWithParm(w_detalle_datos_cliente_log,string(ll_rut))
		
end event

type cb_anular from commandbutton within w_detalle_datos_cliente
integer x = 448
integer y = 1672
integer width = 279
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Anular"
end type

event clicked;long ll_resp, ret

dw_detalle_datos.setitem(1,'estado_reg','A')

ret	= MessageBox('Actualizar', "Desea Anular Ingreso de Datos Cliente", Question!, YesNo!, 2)
	IF ret = 1 THEN
		if dw_detalle_datos.update()=1 then
			commit;
			ll_resp					= messagebox("Grabar","Grabación Exitosa",Exclamation!)
		else
			rollback;
			messagebox("Error Grabar","Error al Anular Ingreso de Datos Cliente "+sqlca.sqlerrtext)
		end if
	end if
	
				
end event

type cb_grabar from commandbutton within w_detalle_datos_cliente
integer x = 59
integer y = 1672
integer width = 315
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

event clicked;string	ls_direccion,ls_numero,ls_depto,ls_block,ls_comuna,ls_ciudad,ls_telefono,ls_celular,ls_email,&
			ls_dv,ls_direccion_ori,ls_villa_pob_ori,ls_sector_ori,ls_comuna_ori,ls_ciudad_ori,ls_telefono_ori, &
			ls_tipo_via_ori,ls_numero_ori,ls_depto_ori,ls_block_ori,ls_email_ori,ls_poblacion,ls_sector,&
			ls_tipo_via,ls_estado_cob
Long		ll_rut,ll_cod_parque_ori,ll_resp,ll_grabar1,ll_fila

	

SELECT sysdate  INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
dw_detalle_datos.accepttext()
ll_resp				= messagebox('Grabar','Desea Grabar Cambios',Exclamation!,YesNo!,2)
if ll_resp=1 then
	ll_grabar1				= 0
	dw_detalle_datos.setitem(1,'estado_reg','G')
	dw_detalle_datos.setitem(1,'usuario_valida',gs_user)
	dw_detalle_datos.setitem(1,'fecha_actualiza',gdt_fec_sistema)
	dw_detalle_datos.accepttext()
	if dw_detalle_datos.update() = 1 then
		commit;
		ll_grabar1 ++
		ll_rut				= dw_detalle_datos.GetItemNumber(1,'rut')
		ls_dv					= dw_detalle_datos.GetItemString(1,'dv')
		ls_direccion		= dw_detalle_datos.GetItemString(1,'direccion')
		ls_numero			= dw_detalle_datos.GetItemString(1,'nro')
		ls_depto				= dw_detalle_datos.GetItemString(1,'depto')
		ls_block 			= dw_detalle_datos.GetItemstring(1,'block')
		ls_comuna			= dw_detalle_datos.GetItemstring(1,'comuna')
		ls_ciudad			= dw_detalle_datos.GetItemstring(1,'ciudad')
		ls_telefono			= dw_detalle_datos.GetItemstring(1,'telefono')
		ls_celular			= dw_detalle_datos.GetItemstring(1,'celular')
		ls_email				= dw_detalle_datos.GetItemstring(1,'email')	
		ls_poblacion		= dw_detalle_datos.GetItemstring(1,'villa_poblacion')	
		ls_sector			= dw_detalle_datos.GetItemstring(1,'sector')	
		ls_tipo_via			= dw_detalle_datos.GetItemstring(1,'tipo_via')
		ls_estado_cob 		= '0'

		SELECT   "CLIENTE"."DIRECCION_P",	"CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P", "CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",   "CLIENTE"."DEPTO_PARTICULAR", "CLIENTE"."BLOCK_PARTICULAR",   "CLIENTE"."EMAIL"
		INTO 		:ls_direccion_ori,   		:ls_villa_pob_ori,   	 :ls_sector_ori,   	  :ls_comuna_ori,   		:ls_ciudad_ori,   	 :ls_telefono_ori, 	:ls_tipo_via_ori,			:ls_numero_ori,   					:ls_depto_ori,   					:ls_block_ori,  				 	  :ls_email_ori		
		FROM 		"CLIENTE"  
		WHERE  ( "CLIENTE"."RUT" = :ll_rut ) AND   
				 ( "CLIENTE"."DV" = :ls_dv )   
		USING	SQLCA ;
		if sqlca.sqlcode=0 then 
			SELECT DISTINCT "CADENA"."COD_PARQUE"  
			INTO 	  :ll_cod_parque_ori  
			FROM 	  "CADENA"  
			WHERE ( "CADENA"."RUT" = :ll_rut   AND
					( "CADENA"."ESTADO" = 'V' or "CADENA"."ESTADO" = 'C') and
					( "CADENA"."CODIGO" = 'O' or "CADENA"."CODIGO" = 'C'));

			INSERT INTO "LOG_WEB_ACTUALIZA_CLIENTE"  
					 ( "RUT",   "DV",   "TIPO_VIA",   		"DIRECCION",   	"NRO",   		"DEPTO",   		"BLOCK",   		"CIUDAD",   	"COMUNA",   		"TELEFONO",   		"EMAIL",   		"FECHA_CREA",   	"COD_PARQUE",   		"USUARIO_CREA",   "SECTOR",   		"VILLA_POBLACION" )  
			VALUES ( :ll_rut, :ls_dv, :ls_tipo_via_ori, 	:ls_direccion_ori,:ls_numero_ori,:ls_depto_ori, :ls_block_ori, :ls_ciudad_ori,:ls_comuna_ori,   :ls_telefono_ori, :ls_email_ori, :gdt_fec_sistema, :ll_cod_parque_ori,  :gs_user,   		:ls_sector_ori,   :ls_villa_pob_ori )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				ll_grabar1 ++
				UPDATE	"CLIENTE"  
				SET 		"DIRECCION_P" 			= :ls_direccion,   
							"POBLACION" 			= :ls_poblacion,   
							"SECTOR" 				= :ls_sector,   
							"COMUNA" 				= :ls_comuna,   
							"CIUDAD" 				= :ls_ciudad,   
							"FONO_P" 				= :ls_telefono,   
							"NUMERO_PARTICULAR" 	= :ls_numero,   
							"DEPTO_PARTICULAR" 	= :ls_depto,   
							"BLOCK_PARTICULAR" 	= :ls_block,   
							"TIPO_VIA" 				= :ls_tipo_via, 
							"ESTADO_COBRANZA"  	= :ls_estado_cob,
							"LAT_GEO" 				= 0,
							"LON_GEO" 				= 0,
							"STATUS_GEO"			= 0
				WHERE  ( "CLIENTE"."RUT"= :ll_rut ) AND  
						 ( "CLIENTE"."DV" = :ls_dv )      
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					ll_grabar1 ++
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Tabla CLIENTE SQL: "+sqlca.sqlerrtext)
				end if
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Tabla LOG_WEB_ACTUALIZA_CLIENTE SQL: "+sqlca.sqlerrtext)
			end if
		end if
		if ll_grabar1=3 then
			messagebox("Grabar","Grabación Exitosa")
			w_actualizar_datos_cliente.pb_ok2.triggerevent(clicked!)
			ll_fila	= w_actualizar_datos_cliente.dw_actualizar_datos.Find("rut = "+string(ll_rut),1, w_actualizar_datos_cliente.dw_actualizar_datos.RowCount())
			if ll_fila>0 then
				w_actualizar_datos_cliente.dw_actualizar_datos.scrolltorow(ll_fila)
			end if
			close(w_detalle_datos_cliente)
		end if
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Tabla ACTUALIZA CLIENTE SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_cerrar from commandbutton within w_detalle_datos_cliente
integer x = 2533
integer y = 1672
integer width = 361
integer height = 112
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_datos_cliente)
end event

type st_1 from statictext within w_detalle_datos_cliente
integer x = 55
integer y = 36
integer width = 1006
integer height = 100
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle Datos Cliente"
boolean focusrectangle = false
end type

type dw_detalle_datos from datawindow within w_detalle_datos_cliente
integer x = 55
integer y = 176
integer width = 2866
integer height = 1408
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lista_detalle_datos"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String ls_columna, ls_ciudad,ls_nulo

Setnull(ls_nulo)
this.accepttext()
ls_columna		= dwo.name
if ls_columna  = 'ciudad' then
	dw_detalle_datos.setitem(1,'comuna',ls_nulo)
	ls_ciudad	= dw_detalle_datos.getitemstring(1,'ciudad')
	idw_detalle.retrieve(ls_ciudad)
end if
dw_detalle_datos.accepttext()



end event

type gb_1 from groupbox within w_detalle_datos_cliente
integer x = 1851
integer y = 1628
integer width = 553
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

