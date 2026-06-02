forward
global type w_ver_pagare_digitacion from window
end type
type cb_detalle from commandbutton within w_ver_pagare_digitacion
end type
type cb_4 from commandbutton within w_ver_pagare_digitacion
end type
type dw_pagare from datawindow within w_ver_pagare_digitacion
end type
type cb_3 from commandbutton within w_ver_pagare_digitacion
end type
type cb_2 from commandbutton within w_ver_pagare_digitacion
end type
type cb_1 from commandbutton within w_ver_pagare_digitacion
end type
end forward

global type w_ver_pagare_digitacion from window
integer x = 1358
integer y = 1172
integer width = 2405
integer height = 1072
boolean titlebar = true
string title = "Ver Pagaré"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_detalle cb_detalle
cb_4 cb_4
dw_pagare dw_pagare
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_ver_pagare_digitacion w_ver_pagare_digitacion

type variables
integer 	fila,cont,elimina=0,suma=0,total=0
string		is_serie,is_mensaje,is_base
Double	il_numero

end variables

on w_ver_pagare_digitacion.create
this.cb_detalle=create cb_detalle
this.cb_4=create cb_4
this.dw_pagare=create dw_pagare
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_detalle,&
this.cb_4,&
this.dw_pagare,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_ver_pagare_digitacion.destroy
destroy(this.cb_detalle)
destroy(this.cb_4)
destroy(this.dw_pagare)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;gf_centrar(w_ver_pagare_digitacion)
dw_pagare.settransobject(sqlca)
is_serie		= substr(1,1,Message.StringParm)
il_numero 	= Double(substr(1,2,Message.StringParm))
is_mensaje	= substr(1,3,Message.StringParm)
is_base		= substr(1,4,Message.StringParm)
dw_pagare.retrieve(is_serie,il_numero)
cont 			= dw_pagare.rowcount()
end event

type cb_detalle from commandbutton within w_ver_pagare_digitacion
event ue_mousemove pbm_mousemove
integer x = 1358
integer y = 828
integer width = 347
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Control &Dcto."
end type

event clicked;String		ls_string,ls_serie
Long		ll_fila
Double	ll_numero

ll_fila		= dw_pagare.getrow()
if ll_fila>0 then
	ll_numero 	= dw_pagare.getitemnumber(ll_fila,'numero_p')
	ls_serie  	= dw_pagare.getitemstring(ll_fila,'serie_p')
	ls_string	= 'P'+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(gs_base) and gi_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type cb_4 from commandbutton within w_ver_pagare_digitacion
integer x = 695
integer y = 828
integer width = 325
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Insertar"
end type

event clicked;long		ll_new,ll_tot_reg,ll_indi
Double	ll_num_p
String		ls_serie_p,ls_estado,ls_pasa='S'
ll_tot_reg			= dw_pagare.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_serie_p	= dw_pagare.getitemstring(ll_indi,'serie_p')
		ll_num_p		= dw_pagare.getitemnumber(ll_indi,'numero_p')
		ls_estado	= dw_pagare.getitemstring(ll_indi,'estado')
		if isnull(ls_serie_p) or ls_serie_p='' then
			messagebox("Advertencia","Falta Ingresar Serie Pagaré Fila Nº "+string(ll_indi))
			dw_pagare.setfocus()
			dw_pagare.scrolltorow(ll_indi)
			dw_pagare.setcolumn('serie_p')
			ls_pasa	= 'N'
			exit
		elseif isnull(ll_num_p) or ll_num_p=0 then
			messagebox("Advertencia","Falta Ingresar Número Pagaré Fila Nº "+string(ll_indi))
			dw_pagare.setfocus()
			dw_pagare.scrolltorow(ll_indi)
			dw_pagare.setcolumn('numero_p')
			ls_pasa	= 'N'
			exit
		elseif isnull(ls_estado) or ls_estado='' then
			messagebox("Advertencia","Falta Ingresar Estado Fila Nº "+string(ll_indi))
			dw_pagare.setfocus()
			dw_pagare.scrolltorow(ll_indi)
			dw_pagare.setcolumn('estado')
			ls_pasa	= 'N'
			exit
		end if
	next
end if
if ls_pasa='S' then
	ll_new	= dw_pagare.insertrow(0)
	dw_pagare.scrolltorow(ll_new)
	dw_pagare.setitem(ll_new,'serie',is_serie)
	dw_pagare.setitem(ll_new,'numero',il_numero)
	dw_pagare.setitem(ll_new,'estado','V')
	dw_pagare.setitem(ll_new,'base','O')
	dw_pagare.accepttext()
	dw_pagare.setfocus()
	dw_pagare.scrolltorow(ll_new)
	dw_pagare.setcolumn('serie_p')
	suma ++
end if
end event

type dw_pagare from datawindow within w_ver_pagare_digitacion
integer x = 37
integer y = 40
integer width = 2309
integer height = 748
integer taborder = 10
string dataobject = "dw_ver_pagare_ingreso"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow()>0 then
	dw_pagare.SelectRow(0, false)
	dw_pagare.SelectRow(getrow(), TRUE)
end if
end event

event clicked;if row>0 then
	dw_pagare.SelectRow(0, false)
	dw_pagare.SelectRow(row, TRUE)
end if
end event

event itemchanged;String		ls_columna,ls_serie,ls_descrip,ls_null
Long		ll_estado,ll_null
Double	ll_numero
Setnull(ls_null);setnull(ll_null)

this.accepttext()
ls_columna	= dwo.name
if ls_columna='serie_p' or ls_columna='numero_p' then
	ls_serie		= dw_pagare.getitemstring(row,'serie_p')
	ll_numero	= dw_pagare.getitemnumber(row,'numero_p')
	if isnull(ls_serie) or ls_serie='' or ll_numero=0 then
		messagebox("Advertencia","No es Posible Ingresar Pagaré "+'P - '+ls_serie+ ' - '+string(ll_numero,"###,###,###,###,###")+' Inválido')
		this.setitem(row,'estado',ls_null)
		this.setitem(row,'serie_p',ls_null)
		this.setitem(row,'numero_p',ll_null)
		this.accepttext()
	end if
//	if ll_numero >= gi_prim_nro_P_cd then
//		if not isnull(ls_serie) and ls_serie<>'' and ll_numero>0 then
//			SELECT	"CD_FOLIO"."ULT_ESTADO"  
//			INTO 		:ll_estado  
//			FROM 		"CD_FOLIO"  
//			WHERE	 ( "CD_FOLIO"."BASE" = 'P' ) AND  
//					 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
//					 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
//			USING		sqlca;
//			if sqlca.sqlcode=0 then
//				SELECT	"CD_ESTADO"."DESCRIPCION"  
//				INTO 		:ls_descrip  
//				FROM 		"CD_ESTADO"  
//				WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   ;
//				if ll_estado<>9 then
//					messagebox("Advertencia","No es Posible Ingresar Pagaré "+'P - '+ls_serie+ ' - '+string(ll_numero,"###,###,###,###,###")+', por Encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
//					this.setitem(row,'estado',ls_null)
//					this.setitem(row,'serie_p',ls_null)
//					this.setitem(row,'numero_p',ll_null)
//					this.accepttext()
//				end if
//			else
//				messagebox("Advertencia","No es Posible Ingresar Pagaré "+'P - '+ls_serie+ ' - '+string(ll_numero,"###,###,###,###,###")+', debe existir Control de Documentación')
//				this.setitem(row,'estado',ls_null)
//				this.setitem(row,'serie_p',ls_null)
//				this.setitem(row,'numero_p',ll_null)
//				this.accepttext()
//			end if
//		end if
//	end if
end if
end event

type cb_3 from commandbutton within w_ver_pagare_digitacion
integer x = 366
integer y = 828
integer width = 325
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;long	ll_resp

if dw_pagare.rowcount()>0 then
	ll_resp	= MessageBox("Eliminar", "Está seguro de Eliminar Fila Nº "+string(dw_pagare.getrow())+", recuerde Actualizar los Cambios", &
				  Exclamation!, YesNo!, 2)
	IF ll_resp = 1 THEN
		dw_pagare.deleterow(dw_pagare.getrow())
		elimina ++
	END IF
end if
end event

type cb_2 from commandbutton within w_ver_pagare_digitacion
integer x = 37
integer y = 828
integer width = 325
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long 		numero_p,numero_o,oferta,ll_tot_reg,ll_nro_pagare,ll_nro_promesa,&
			i,numero,modifica,count,ll_count_reg,ll_estado_graba
string 	serie_p,serie_o,oferta_s,ls_serie_promesa,ls_serie_pagare,ls_estado,&
			ls_age,ls_sup,ls_jefe,ls_glosa,ls_memo,ls_ref

SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 		"TASA"  ;
dw_pagare.AcceptText()
if elimina = 0 then
	total	= (dw_pagare.rowcount() -  suma ) + 1
	ll_tot_reg	= dw_pagare.rowcount()
	if ll_tot_reg <> cont then
		for i = total to ll_tot_reg
			numero		= 0
			numero_p 	= dw_pagare.getitemnumber(i,'numero_p')
			serie_p  	= dw_pagare.getitemstring(i,'serie_p')
			ls_estado	= dw_pagare.getitemstring(i,'estado')
//			SELECT	"PAGARE_V"."SERIE_P","PAGARE_V"."NUMERO_P"  
//			INTO 		:serie_o,:numero_o
//			FROM 		"PAGARE_V"  
//			WHERE  ( "PAGARE_V"."NUMERO_P" = :numero_p )   ;
//			if (numero_o = numero_p and serie_o = serie_p) then
//				messagebox('Error','EL pagaré Nº: '+string(numero_p,'###,###,###,###')+', serie: '+serie_p+' ~r~n'+&
//							  'existe y no puede ser ingresado.',stopsign!)
//				dw_pagare.SelectRow(0, false)
//				dw_pagare.SelectRow(i, TRUE)
//				return
//			else
			if isnull(numero_p) or numero_p<=0 then
				messagebox("Advertencia","Número Pagaré Inválido")
				dw_pagare.setfocus()
				dw_pagare.scrolltorow(i)
				dw_pagare.setcolumn('numero_p')
				return
			elseif isnull(serie_p) or serie_p='' then
				messagebox("Advertencia","Serie Pagaré Inválido")
				dw_pagare.setfocus()
				dw_pagare.scrolltorow(i)
				dw_pagare.setcolumn('serie_p')
				return
			elseif isnull(ls_estado) or ls_estado='' then
				messagebox("Advertencia","Estado Inválido")
				dw_pagare.setfocus()
				dw_pagare.scrolltorow(i)
				dw_pagare.setcolumn('estado')
				return
			end if
//			end if
		next
	end if
end if
if dw_pagare.update()=1 then
	commit;
	suma 				= 0
	ll_tot_reg		= dw_pagare.rowcount()
	for i = 1 to ll_tot_reg
		numero_p 	= dw_pagare.getitemnumber(i,'numero_p')
		serie_p  	= dw_pagare.getitemstring(i,'serie_p')
		SELECT	COUNT("CD_FOLIO_DETALLE"."BASE")
		INTO 		:ll_count_reg
		FROM 		"CD_FOLIO_DETALLE"
		WHERE  ( "CD_FOLIO_DETALLE"."BASE" = 'P' ) AND
				 ( "CD_FOLIO_DETALLE"."NUMERO" = :numero_p ) AND
				 (( "CD_FOLIO_DETALLE"."ESTADO" = 11) or
				 ( "CD_FOLIO_DETALLE"."ESTADO" = 9))
		USING		sqlca;
		if ll_count_reg=1 then
			///////////////////////// Inicio Nuevo CD /////////////////////////////////
			ls_age					= ''
			ls_sup					= ''
			ls_jefe					= ''
			ll_estado_graba		= 11
			ls_glosa					= 'PAGARE DIGITADO'
			ls_memo					= '-'
			ls_ref					= '-'
			UPDATE	"CD_FOLIO"  
			SET 		"ULT_ESTADO" = :ll_estado_graba,   
						"ULT_FECHA_ESTADO" = :gdt_fec_sistema,   
						"ULT_GLOSA_ESTADO" = :ls_glosa,   
						"SERIE" = :serie_p,
						"ULT_MEMO" = :ls_memo,   
						"ULT_USUARIO_GESTION" = :gs_user,   
						"ULT_REFERENCIA_MEMO" = :ls_ref  
			WHERE	 ( "CD_FOLIO"."BASE" = 'P' ) AND  
					 ( "CD_FOLIO"."NUMERO" = :numero_p )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				INSERT INTO	"CD_FOLIO_DETALLE"  
							( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",			"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO" )  
				VALUES 	( 'P',		:serie_p,	:numero_p,	:gdt_fec_sistema,	:gs_user,   		:ll_estado_graba,	:gdt_fec_sistema,	:ls_glosa,	:ls_memo,	:ls_age,			:ls_sup,				:ls_jefe,			:ls_ref )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					UPDATE	"CD_FOLIO_DETALLE"  
					SET 		"SERIE" = :serie_p  
					WHERE  ( "CD_FOLIO_DETALLE"."BASE" = 'P' ) AND  
							 ( "CD_FOLIO_DETALLE"."NUMERO" = :numero_p )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				else
					rollback;
				end if
			else
				rollback;
			end if
			///////////////////////// Fin Nuevo CD /////////////////////////////////
		end if
	next
	messagebox('Grabar','Grabación Exitosa',information!)
	if isvalid(w_ingresar_oferta) then 
		if w_ingresar_oferta.st_pagare.italic=false then
			w_ingresar_oferta.st_pagare.italic	= true
			if gs_nueva_oferta='S' and is_mensaje='S' then 
				close(w_ver_pagare_digitacion)
				w_ingresar_oferta.cb_aceptar.setfocus()
				w_ingresar_oferta.cb_aceptar.triggerevent(clicked!)
			else
				w_ingresar_oferta.dw_oferta_v.setfocus()
				w_ingresar_oferta.dw_oferta_v.setcolumn('fecha')
				close(w_ver_pagare_digitacion)
			end if
		end if
	elseif isvalid(w_ingreso_derecho_especial) then
		if w_ingreso_derecho_especial.cb_pagare.italic=false then 
			w_ingreso_derecho_especial.cb_pagare.italic		= true
			ll_tot_reg	= dw_pagare.rowcount()
			for i = 1 to ll_tot_reg
				ll_nro_pagare											= dw_pagare.getitemnumber(i,'numero_p')
				ls_serie_pagare										= dw_pagare.getitemstring(i,'serie_p')
				ll_nro_promesa											= dw_pagare.getitemnumber(i,'numero')
				ls_serie_promesa										= dw_pagare.getitemstring(i,'serie')
				if is_serie=ls_serie_promesa and il_numero=ll_nro_promesa then
					w_ingreso_derecho_especial.dw_derecho.object.t_serie_pagare.text	= ls_serie_pagare
					w_ingreso_derecho_especial.dw_derecho.object.t_nro_pagare.text		= string(ll_nro_pagare,"###,###,###,###,###")
					exit
				end if
			next			
		end if
	end if
	if isvalid(w_ver_pagare_digitacion) then close(w_ver_pagare_digitacion)
else
	rollback;
	messagebox("Error","Error al Grabar "+sqlca.sqlerrtext)
end if
end event

type cb_1 from commandbutton within w_ver_pagare_digitacion
integer x = 2021
integer y = 828
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;integer	ret
IF dw_pagare.ModifiedCount( ) > 0 or dw_pagare.DeletedCount( ) > 0 THEN
	ret	= messagebox('Cambios','¿ Desea guardar los cambios ?',Exclamation!, YesNo!, 2)
	if ret = 1 then
		cb_2.TriggerEvent(clicked!)
	end if	
end if
close(w_ver_pagare_digitacion)
end event

