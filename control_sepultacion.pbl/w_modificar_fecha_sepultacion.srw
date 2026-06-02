forward
global type w_modificar_fecha_sepultacion from window
end type
type cb_cerrar from commandbutton within w_modificar_fecha_sepultacion
end type
type cb_grabar from commandbutton within w_modificar_fecha_sepultacion
end type
type st_titulo from statictext within w_modificar_fecha_sepultacion
end type
type dw_modifica from datawindow within w_modificar_fecha_sepultacion
end type
end forward

global type w_modificar_fecha_sepultacion from window
integer width = 3040
integer height = 1420
boolean titlebar = true
string title = "Actualizar Fecha de Sepultación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_grabar cb_grabar
st_titulo st_titulo
dw_modifica dw_modifica
end type
global w_modificar_fecha_sepultacion w_modificar_fecha_sepultacion

type variables
String	is_opcion,is_base,is_serie,is_fecha,is_sector,is_sepultura,is_nro_tecnico
Long		il_cod_parque,il_capacidad,il_corr_interno
datetime	idt_fecha_sepult
Double	il_numero
end variables

on w_modificar_fecha_sepultacion.create
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.st_titulo=create st_titulo
this.dw_modifica=create dw_modifica
this.Control[]={this.cb_cerrar,&
this.cb_grabar,&
this.st_titulo,&
this.dw_modifica}
end on

on w_modificar_fecha_sepultacion.destroy
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.st_titulo)
destroy(this.dw_modifica)
end on

event open;String	ls_base_ori,ls_serie_ori,ls_sector_ori,ls_sepult_ori,ls_base_dest,ls_serie_dest,ls_sector_dest,&
			ls_sepult_dest
Long		ll_parque_ori,ll_parque_dest
Double	ll_numero_ori,ll_numero_dest

gf_centrar(w_modificar_fecha_sepultacion)
is_opcion			= substr(1,1,Message.StringParm)
is_base				= substr(1,2,Message.StringParm)
is_serie				= substr(1,3,Message.StringParm)
il_numero			= Double(substr(1,4,Message.StringParm))
is_fecha				= mid(substr(1,5,Message.StringParm),1,10)
idt_fecha_sepult	= datetime(date(is_fecha))
is_sector				= substr(1,6,Message.StringParm)
is_sepultura			= substr(1,7,Message.StringParm)
il_cod_parque		= long(substr(1,8,Message.StringParm))
il_capacidad			= long(substr(1,9,Message.StringParm))
is_nro_tecnico		= substr(1,10,Message.StringParm)
il_corr_interno		= long(substr(1,11,Message.StringParm))
if is_opcion='FS' or is_opcion='CO' then
	if is_opcion='FS' then
		st_titulo.text			= 'Ficha Sepultación Sector: '+is_sector+ ' Sepultura: '+is_sepultura+' Fecha Sepultura: '+string(idt_fecha_sepult,'dd/mm/yyyy') +' Nº Contrato: '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###')
	elseif is_opcion='FS' then
		st_titulo.text			= 'Ficha Columbario Sector: '+is_sector+ ' Sepultura: '+is_sepultura+' Fecha Sepultura: '+string(idt_fecha_sepult,'dd/mm/yyyy') +' Nº Contrato: '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###')
	end if
	dw_modifica.dataobject	= 'dw_modificar_fecha_sepultacion'
	dw_modifica.settransobject(sqlca)
	dw_modifica.retrieve(is_sector,is_sepultura,il_cod_parque,idt_fecha_sepult)
elseif is_opcion='FT' then
	st_titulo.text				= 'Ficha Traslado Sector: '+is_sector+ ' Sepultura: '+is_sepultura+' Fecha Sepultura: '+string(idt_fecha_sepult,'dd/mm/yyyy') +' Nº Contrato: '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###')
	dw_modifica.dataobject	= 'dw_modificar_fecha_traslado'
	dw_modifica.settransobject(sqlca)
	dw_modifica.retrieve(is_sector,is_sepultura,idt_fecha_sepult)
elseif is_opcion='FR' then
	st_titulo.text				= 'Ficha Reducción Sector: '+is_sector+ ' Sepultura: '+is_sepultura+' Fecha Reducción: '+string(idt_fecha_sepult,'dd/mm/yyyy') +' Nº Contrato: '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###')
	dw_modifica.dataobject	= 'dw_modificar_fecha_reduccion'
	dw_modifica.settransobject(sqlca)
	dw_modifica.retrieve(is_sector,is_sepultura,il_cod_parque,idt_fecha_sepult)
elseif is_opcion='CT' then
	st_titulo.text				= 'Ficha Cadaver en Transito Sector: '+is_sector+ ' Sepultura: '+is_sepultura+' Fecha Reducción: '+string(idt_fecha_sepult,'dd/mm/yyyy') +' Nº Contrato: '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###')
	dw_modifica.dataobject	= 'dw_modificar_fecha_cadaver_transito'
	dw_modifica.settransobject(sqlca)
	dw_modifica.retrieve(is_sector,is_sepultura,il_cod_parque,idt_fecha_sepult)
end if
if dw_modifica.rowcount()=0 then
	messagebox("Advertencia","No registra dato")
	close(w_modificar_fecha_sepultacion)
else
	if is_opcion='FT' then
		ls_base_ori		= dw_modifica.getitemstring(1,'base_origen')
		ls_serie_ori	= dw_modifica.getitemstring(1,'serie_origen')
		ll_numero_ori	= dw_modifica.getitemnumber(1,'numero_origen')
		ls_sector_ori	= dw_modifica.getitemstring(1,'sector_origen')
		ls_sepult_ori	= dw_modifica.getitemstring(1,'sepultura_origen')
		ll_parque_ori	= dw_modifica.getitemnumber(1,'cod_parque_origen')
		ls_base_dest	= dw_modifica.getitemstring(1,'base_destino')
		ls_serie_dest	= dw_modifica.getitemstring(1,'serie_destino')
		ll_numero_dest	= dw_modifica.getitemnumber(1,'numero_destino')
		ls_sector_dest	= dw_modifica.getitemstring(1,'sector_destino')
		ls_sepult_dest	= dw_modifica.getitemstring(1,'sepultura_destino')
		ll_parque_dest	= dw_modifica.getitemnumber(1,'cod_parque_destino')
		st_titulo.text	= 'Ficha Traslado Sector: '+is_sector+ ' Sepultura: '+is_sepultura+' Fecha Sepultura: '+string(idt_fecha_sepult,'dd/mm/yyyy') +' Nº Contrato: '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###')
		if ll_numero_dest>0 and (ll_numero_ori=0 or isnull(ll_numero_ori)) then
			st_titulo.text	= 'Ficha Traslado Sector: '+ls_sector_dest+ ' Sepultura: '+ls_sepult_dest+' Fecha Sepultura: '+string(idt_fecha_sepult,'dd/mm/yyyy') +' Nº Contrato: '+ls_base_dest+'-'+ls_serie_dest+'-'+string(ll_numero_dest,'###,###,###,###')
		end if
	end if
	dw_modifica.setfocus()
end if

end event

type cb_cerrar from commandbutton within w_modificar_fecha_sepultacion
integer x = 2615
integer y = 1160
integer width = 366
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_modificar_fecha_sepultacion)
end event

type cb_grabar from commandbutton within w_modificar_fecha_sepultacion
integer x = 37
integer y = 1160
integer width = 366
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Datetime	ldt_fecha
Long		ll_indi,ll_tot_reg,ll_error,ll_parque_ori,ll_parque_dest
String		ls_tipo_tras,ls_base_ori,ls_serie_ori,ls_sector_ori,ls_sepult_ori,ls_base_dest,&
			ls_serie_dest,ls_sector_dest,ls_sepult_dest,ls_asunto,ls_texto,email_de,ls_email_para,&
			ls_res
Double	ll_numero_ori,ll_numero_dest
dw_modifica.accepttext()
ll_tot_reg	= dw_modifica.rowcount()
ll_error		= 0
if ll_tot_reg>0 then
	if dw_modifica.dataobject = 'dw_modificar_fecha_sepultacion' then
		ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_sepultacion')
	elseif dw_modifica.dataobject	= 'dw_modificar_fecha_traslado' then
		ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_traslado')
	elseif dw_modifica.dataobject = 'dw_modificar_fecha_reduccion' then
		ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_sepultacion')
	elseif dw_modifica.dataobject = 'dw_modificar_fecha_cadaver_transito' then
		ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_sepultacion')
	end if
	if ldt_fecha <> idt_fecha_sepult and not isnull(ldt_fecha) then
		for ll_indi=1 to ll_tot_reg
			if dw_modifica.dataobject = 'dw_modificar_fecha_sepultacion' then
				ldt_fecha	= dw_modifica.getitemdatetime(ll_indi,'fecha_sepultacion')
			elseif dw_modifica.dataobject	= 'dw_modificar_fecha_traslado' then
				ldt_fecha	= dw_modifica.getitemdatetime(ll_indi,'fecha_traslado')
			elseif dw_modifica.dataobject = 'dw_modificar_fecha_reduccion' then
				ldt_fecha	= dw_modifica.getitemdatetime(ll_indi,'fecha_sepultacion')
			elseif dw_modifica.dataobject = 'dw_modificar_fecha_cadaver_transito' then
				ldt_fecha	= dw_modifica.getitemdatetime(ll_indi,'fecha_sepultacion')
			end if
			if isnull(ldt_fecha) then
				messagebox("Advertencia","Fecha Inválida en Fila Nº "+string(ll_indi))
				dw_modifica.scrolltorow(ll_indi)
				if dw_modifica.dataobject = 'dw_modificar_fecha_sepultacion' then
					dw_modifica.setcolumn('fecha_sepultacion')
				elseif dw_modifica.dataobject	= 'dw_modificar_fecha_traslado' then
					dw_modifica.setcolumn('fecha_traslado')
				elseif dw_modifica.dataobject = 'dw_modificar_fecha_reduccion' then
					dw_modifica.setcolumn('fecha_sepultacion')
				elseif dw_modifica.dataobject = 'dw_modificar_fecha_cadaver_transito' then
					dw_modifica.setcolumn('fecha_sepultacion')
				end if
				ll_error ++
				exit
			end if
		next
		if ll_error=0 then
			if dw_modifica.update()=1 then
				commit;
				if dw_modifica.dataobject = 'dw_modificar_fecha_sepultacion' then
					ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_sepultacion')
					UPDATE	"FICHA_SEPULTACION"  
					SET 		"FECHA_SEPULTACION" = :ldt_fecha  
					WHERE  ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :idt_fecha_sepult ) AND  
							 ( "FICHA_SEPULTACION"."BASE" = :is_base ) AND  
							 ( "FICHA_SEPULTACION"."SERIE" = :is_serie ) AND  
							 ( "FICHA_SEPULTACION"."NUMERO" = :il_numero ) AND  
							 ( "FICHA_SEPULTACION"."SECTOR" = :is_sector ) AND  
							 ( "FICHA_SEPULTACION"."SEPULTURA" = :is_sepultura ) AND  
							 ( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						UPDATE 	"FALLECIDOS"  
						SET 		"FEC_SEP" = :ldt_fecha  
						WHERE 	( "FALLECIDOS"."BASE" = :is_base ) AND  
									( "FALLECIDOS"."SS" = :is_serie ) AND  
									( "FALLECIDOS"."CONTRATO" = :il_numero ) AND  
									( "FALLECIDOS"."SECTOR" = :is_sector ) AND  
									( "FALLECIDOS"."N_SEP" = :is_sepultura )  AND
									( "FEC_SEP" = :idt_fecha_sepult ) AND  
							 		( "COD_PARQUE" = :il_cod_parque ) AND
									( "ESTADO_REG" = 'A' )
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit;
						else
							rollback;
						end if

						ls_asunto			= 'AVISO DE MODIFICACION FECHA DE SEPULTACION SECTOR: ' +is_sector+' SEPULTURA: '+is_sepultura
						ls_texto 				= 'Se Informa MODIFICACION Fecha de SEPULTACION del día '+string(idt_fecha_sepult,'dd/mm/yyyy')+' PARA el día '+string(ldt_fecha,'dd/mm/yyyy')+', del Contrato Asociado Nº: '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###,###')+', SECTOR: '+is_sector+' y SEPULTURA: '+is_sepultura+'.'
						ls_texto				= ls_texto+'         Atte.Depto.At.y Serv.al Cliente'
						SELECT	"ENCARGADOS"."EMAIL"  
						INTO 		:email_de  
						FROM 	"ENCARGADOS"  
						WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
						USING	sqlca;
						if isnull(email_de) or email_de='-' or email_de='' then
							email_de			= 'consulta@nuestrosparques.cl'
						end if
						SELECT 	"MEMBRETE_EMPRESA"."MAIL_SEPULTACION"  
						INTO 		:ls_email_para  
						FROM 	"MEMBRETE_EMPRESA"  
						WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :il_cod_parque
						USING	sqlca;	
						
						select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
						INTO 		:ls_res
						from 		DUAL;
						if ls_res='OK' then
							messagebox("Envio Email","Envio Email Exitoso")
						else
							messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
						end if
						
						UPDATE	"FICHA_CARTA_SEPULTACION"  
						SET 		"FECHA_SEPULTACION" = :ldt_fecha  
						WHERE  ( "FICHA_CARTA_SEPULTACION"."FECHA_SEPULTACION" = :idt_fecha_sepult ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."SECTOR" = :is_sector ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :is_sepultura ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."BASE" = :is_base ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."SERIE" = :is_serie ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."NUMERO" = :il_numero )   AND
								 ( "FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :il_cod_parque )
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error Grabar","Error al Grabar FICHA_CARTA_SEPULTACION SQL: "+sqlca.sqlerrtext)
						end if
						
						INSERT INTO "LOG_FICHA_MODIFICA_FECHA"  
									( "USUARIO_CREA",	"FECHA_MOD_ORIGINAL",	"FECHA_MOD_NUEVA",	"SECTOR",	"SEPULTURA",	"BASE",		"SERIE",		"NUMERO",	"COD_PARQUE" ) 
						VALUES 	( :gs_user,			:idt_fecha_sepult,		:ldt_fecha,				:is_sector,	:is_sepultura,	:is_base,	:is_serie,	:il_numero,	:il_cod_parque )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error Grabar","Error al Grabar LOG_FICHA_MODIFICA_FECHA SQL: "+sqlca.sqlerrtext)
						end if
						messagebox("Grabar","Modificación Fecha Sepultación Exitosa")
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar Fecha Sepultación SQL: "+sqlca.sqlerrtext)
					end if
				
				elseif dw_modifica.dataobject = 'dw_modificar_fecha_cadaver_transito' then
					ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_sepultacion')
					UPDATE	"FICHA_TRANSITO"  
					SET 		"FECHA_SEPULTACION" = :ldt_fecha  
					WHERE  ( "FICHA_TRANSITO"."FECHA_SEPULTACION" = :idt_fecha_sepult ) AND  
							 ( "FICHA_TRANSITO"."SECTOR" = :is_sector ) AND  
							 ( "FICHA_TRANSITO"."SEPULTURA" = :is_sepultura ) AND  
							 ( "FICHA_TRANSITO"."COD_PARQUE" = :il_cod_parque )   
					USING		sqlca;
//					 ( "FICHA_TRANSITO"."BASE" = :is_base ) AND  
//					 ( "FICHA_TRANSITO"."SERIE" = :is_serie ) AND  
//					 ( "FICHA_TRANSITO"."NUMERO" = :il_numero ) AND  
					if sqlca.sqlcode=0 then
						commit;
						UPDATE 	"FALLECIDOS"  
						SET 		"FEC_SEP" = :ldt_fecha  
						WHERE 	( "FALLECIDOS"."BASE" = :is_base ) AND  
									( "FALLECIDOS"."SS" = :is_serie ) AND  
									( "FALLECIDOS"."CONTRATO" = :il_numero ) AND  
									( "FALLECIDOS"."SECTOR" = :is_sector ) AND  
									( "FALLECIDOS"."N_SEP" = :is_sepultura )  AND
									( "FEC_SEP" = :idt_fecha_sepult ) AND  
							 		( "COD_PARQUE" = :il_cod_parque ) AND
									( "ESTADO_REG" = 'A' )
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit;
						else
							rollback;
						end if
						ls_asunto				= 'AVISO DE MODIFICACION FECHA DE TRAMITE CADAVER EN TRANSITO SECTOR: ' +is_sector+' SEPULTURA: '+is_sepultura
						ls_texto 				= 'Se Informa MODIFICACION Fecha de TRAMITE CADAVER EN TRANSITO del día '+string(idt_fecha_sepult,'dd/mm/yyyy')+' PARA el día '+string(ldt_fecha,'dd/mm/yyyy')+', del Contrato Asociado Nº: '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###,###')+', SECTOR: '+is_sector+' y SEPULTURA: '+is_sepultura+'.'
						ls_texto					= ls_texto+'         Atte.Depto.At.y Serv.al Cliente'
						SELECT	"ENCARGADOS"."EMAIL"  
						INTO 		:email_de  
						FROM 		"ENCARGADOS"  
						WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
						USING		sqlca;
						if isnull(email_de) or email_de='-' or email_de='' then
							email_de			= 'consulta@nuestrosparques.cl'
						end if
						
						SELECT 	"MEMBRETE_EMPRESA"."MAIL_SEPULTACION"  
						INTO 		:ls_email_para  
						FROM 	"MEMBRETE_EMPRESA"  
						WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :il_cod_parque
						USING	sqlca;	
						select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
						INTO 		:ls_res
						from 		DUAL;
						if ls_res='OK' then
							messagebox("Envio Email","Envio Email Exitoso")
						else
							messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
						end if
						
						messagebox("Grabar","Modificación Fecha Cadaver en Transito Exitosa")
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar Fecha Cadaver en Transito SQL: "+sqlca.sqlerrtext)
					end if
				
				elseif dw_modifica.dataobject = 'dw_modificar_fecha_reduccion' then
					ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_sepultacion')
					UPDATE	"FICHA_REDUCCION"  
					SET 		"FECHA_SEPULTACION" = :ldt_fecha  
					WHERE  ( "FICHA_REDUCCION"."FECHA_SEPULTACION" = :idt_fecha_sepult ) AND  
							 ( "FICHA_REDUCCION"."BASE" = :is_base ) AND  
							 ( "FICHA_REDUCCION"."SERIE" = :is_serie ) AND  
							 ( "FICHA_REDUCCION"."NUMERO" = :il_numero ) AND  
							 ( "FICHA_REDUCCION"."SECTOR" = :is_sector ) AND  
							 ( "FICHA_REDUCCION"."SEPULTURA" = :is_sepultura ) AND  
							 ( "FICHA_REDUCCION"."COD_PARQUE" = :il_cod_parque )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						UPDATE 	"FALLECIDOS"  
						SET 		"FEC_SEP" = :ldt_fecha  
						WHERE 	( "FALLECIDOS"."BASE" = :is_base ) AND  
									( "FALLECIDOS"."SS" = :is_serie ) AND  
									( "FALLECIDOS"."CONTRATO" = :il_numero ) AND  
									( "FALLECIDOS"."SECTOR" = :is_sector ) AND  
									( "FALLECIDOS"."N_SEP" = :is_sepultura )  AND
									( "FEC_SEP" = :idt_fecha_sepult ) AND  
							 		( "COD_PARQUE" = :il_cod_parque ) AND
									( "ESTADO_REG" = 'A' )
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit;
						else
							rollback;
						end if
						ls_asunto				= 'AVISO DE MODIFICACION FECHA DE REDUCCION SECTOR: ' +is_sector+' SEPULTURA: '+is_sepultura
						ls_texto 				= 'Se Informa MODIFICACION Fecha de REDUCCION del día '+string(idt_fecha_sepult,'dd/mm/yyyy')+' PARA el día '+string(ldt_fecha,'dd/mm/yyyy')+', del Contrato Asociado Nº: '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###,###')+', SECTOR: '+is_sector+' y SEPULTURA: '+is_sepultura+'.'
						ls_texto					= ls_texto+'         Atte.Depto.At.y Serv.al Cliente'
						SELECT	"ENCARGADOS"."EMAIL"  
						INTO 		:email_de  
						FROM 		"ENCARGADOS"  
						WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
						USING		sqlca;
						if isnull(email_de) or email_de='-' or email_de='' then
							email_de			= 'consulta@nuestrosparques.cl'
						end if
						
						SELECT 	"MEMBRETE_EMPRESA"."MAIL_SEPULTACION"  
						INTO 		:ls_email_para  
						FROM 	"MEMBRETE_EMPRESA"  
						WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :il_cod_parque
						USING	sqlca;	
						select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
						INTO 		:ls_res
						from 		DUAL;
						if ls_res='OK' then
							messagebox("Envio Email","Envio Email Exitoso")
						else
							messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
						end if
						
						messagebox("Grabar","Modificación Fecha Reducción Exitosa")
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar Fecha Reducción SQL: "+sqlca.sqlerrtext)
					end if
				elseif dw_modifica.dataobject	= 'dw_modificar_fecha_traslado' then
					ldt_fecha		= dw_modifica.getitemdatetime(1,'fecha_traslado')
					ls_tipo_tras	= dw_modifica.getitemstring(1,'tipo_traslado')
					ls_base_ori		= dw_modifica.getitemstring(1,'base_origen')
					ls_serie_ori	= dw_modifica.getitemstring(1,'serie_origen')
					ll_numero_ori	= dw_modifica.getitemnumber(1,'numero_origen')
					ls_sector_ori	= dw_modifica.getitemstring(1,'sector_origen')
					ls_sepult_ori	= dw_modifica.getitemstring(1,'sepultura_origen')
					ll_parque_ori	= dw_modifica.getitemnumber(1,'cod_parque_origen')
					ls_base_dest	= dw_modifica.getitemstring(1,'base_destino')
					ls_serie_dest	= dw_modifica.getitemstring(1,'serie_destino')
					ll_numero_dest	= dw_modifica.getitemnumber(1,'numero_destino')
					ls_sector_dest	= dw_modifica.getitemstring(1,'sector_destino')
					ls_sepult_dest	= dw_modifica.getitemstring(1,'sepultura_destino')
					ll_parque_dest	= dw_modifica.getitemnumber(1,'cod_parque_destino')
					UPDATE	"FICHA_TRASLADO"  
					SET 		"FECHA_TRASLADO" = :ldt_fecha  
					WHERE  (("FICHA_TRASLADO"."FECHA_TRASLADO" = :idt_fecha_sepult ) AND  
							 ( "FICHA_TRASLADO"."TIPO_TRASLADO" = :ls_tipo_tras ) AND
							 ( "FICHA_TRASLADO"."BASE_ORIGEN" = :is_base ) AND  
							 ( "FICHA_TRASLADO"."SERIE_ORIGEN" = :is_serie ) AND  
							 ( "FICHA_TRASLADO"."NUMERO_ORIGEN" = :il_numero ) AND  
							 ( "FICHA_TRASLADO"."SECTOR_ORIGEN" = :is_sector ) AND  
							 ( "FICHA_TRASLADO"."SEPULTURA_ORIGEN" = :is_sepultura )) OR
							 (("FICHA_TRASLADO"."FECHA_TRASLADO" = :idt_fecha_sepult ) AND  
							 ( "FICHA_TRASLADO"."TIPO_TRASLADO" = :ls_tipo_tras ) AND
							 ( "FICHA_TRASLADO"."BASE_DESTINO" = :is_base ) AND  
							 ( "FICHA_TRASLADO"."SERIE_DESTINO" = :is_serie ) AND  
							 ( "FICHA_TRASLADO"."NUMERO_DESTINO" = :il_numero ) AND  
							 ( "FICHA_TRASLADO"."SECTOR_DESTINO" = :is_sector ) AND  
							 ( "FICHA_TRASLADO"."SEPULTURA_DESTINO" = :is_sepultura ) )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						UPDATE 	"FALLECIDOS"  
						SET 		"FEC_SEP" = :ldt_fecha  
						WHERE 	( "FALLECIDOS"."BASE" = :is_base ) AND  
									( "FALLECIDOS"."SS" = :is_serie ) AND  
									( "FALLECIDOS"."CONTRATO" = :il_numero ) AND  
									( "FALLECIDOS"."SECTOR" = :is_sector ) AND  
									( "FALLECIDOS"."N_SEP" = :is_sepultura )  AND
									( "FEC_SEP" = :idt_fecha_sepult ) AND  
							 		( "COD_PARQUE" = :il_cod_parque ) AND
									( "ESTADO_REG" = 'A' )
						USING	sqlca;
						if sqlca.sqlcode = 0 then
							commit;
						else
							rollback;
						end if
						ls_asunto				= 'AVISO DE MODIFICACION FECHA DE TRASLADO SECTOR: ' +is_sector+' SEPULTURA: '+is_sepultura
						ls_texto 				= 'Se Informa MODIFICACION Fecha de TRASLADO del día '+string(idt_fecha_sepult,'dd/mm/yyyy')+' PARA el día '+string(ldt_fecha,'dd/mm/yyyy')+', del Contrato Asociado Nº: '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###,###')+', SECTOR: '+is_sector+' y SEPULTURA: '+is_sepultura+'.'
						ls_texto					= ls_texto+'         Atte.Depto.At.y Serv.al Cliente'
						SELECT	"ENCARGADOS"."EMAIL"  
						INTO 		:email_de  
						FROM 		"ENCARGADOS"  
						WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
						USING		sqlca;
						if isnull(email_de) or email_de='-' or email_de='' then
							email_de			= 'consulta@nuestrosparques.cl'
						end if
						
						SELECT 	"MEMBRETE_EMPRESA"."MAIL_SEPULTACION"  
						INTO 		:ls_email_para  
						FROM 	"MEMBRETE_EMPRESA"  
						WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :il_cod_parque
						USING	sqlca;	
						
						select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
						INTO 		:ls_res
						from 		DUAL;
						if ls_res='OK' then
							messagebox("Envio Email","Envio Email Exitoso")
						else
							messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
						end if
						
						UPDATE	"FICHA_CARTA_SEPULTACION"  
						SET 		"FECHA_SEPULTACION" = :ldt_fecha  
						WHERE  (("FICHA_CARTA_SEPULTACION"."FECHA_SEPULTACION" = :idt_fecha_sepult ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."SECTOR" = :is_sector ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :is_sepultura ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."BASE" = :is_base ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."SERIE" = :is_serie ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."NUMERO" = :il_numero )   AND
								 ( "FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :il_cod_parque )) OR
								 (("FICHA_CARTA_SEPULTACION"."FECHA_SEPULTACION" = :idt_fecha_sepult ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."SECTOR" = :ls_sector_dest ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :ls_sepult_dest ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."BASE" = :ls_base_dest ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."SERIE" = :ls_serie_dest ) AND  
								 ( "FICHA_CARTA_SEPULTACION"."NUMERO" = :ll_numero_dest )   AND
								 ( "FICHA_CARTA_SEPULTACION"."COD_PARQUE" = :ll_parque_dest ))
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error Grabar","Error al Grabar FICHA_CARTA_SEPULTACION SQL: "+sqlca.sqlerrtext)
						end if
						
						messagebox("Grabar","Modificación Fecha Traslado Exitosa")
						if ll_numero_dest>0 and (ll_numero_ori=0 or isnull(ll_numero_ori)) then
							is_sector			= ls_sector_dest
							is_sepultura		= ls_sepult_dest
							is_base			= ls_base_dest
							is_serie			= ls_serie_dest
							il_numero		= ll_numero_dest
							il_cod_parque	= ll_parque_dest
						end if
						INSERT INTO "LOG_FICHA_MODIFICA_FECHA"  
									( "USUARIO_CREA",	"FECHA_MOD_ORIGINAL",	"FECHA_MOD_NUEVA",	"SECTOR",	"SEPULTURA",	"BASE",		"SERIE",		"NUMERO",	"COD_PARQUE",		"SECTOR_DESTINO",		"SEPULTURA_DESTINO",		"BASE_DESTINO",	"SERIE_DESTINO",	"NUMERO_DESTINO",	"COD_PARQUE_DESTINO",	"TIPO_TRASLADO" ) 
						VALUES 	( :gs_user,			:idt_fecha_sepult,		:ldt_fecha,				:is_sector,	:is_sepultura,	:is_base,	:is_serie,	:il_numero,	:il_cod_parque,	:ls_sector_dest,		:ls_sepult_dest,			:ls_base_dest,		:ls_serie_dest,	:ll_numero_dest,	:ll_parque_dest,			:ls_tipo_tras )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error Grabar","Error al Grabar LOG_FICHA_MODIFICA_FECHA SQL: "+sqlca.sqlerrtext)
						end if
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar Fecha Traslado SQL: "+sqlca.sqlerrtext)
					end if
				end if
				if isvalid(w_buscar_ficha) then 
					w_buscar_ficha.pb_ok.triggerevent(clicked!)
					w_buscar_ficha.setfocus()
					close(w_modificar_fecha_sepultacion)
				end if
			else
				rollback;
				messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
			end if
		end if
	else
		messagebox("Advertencia","Recuerde que es Necesario Modificar Fecha Sepultación en Fila Nº 1")
	end if
end if
end event

type st_titulo from statictext within w_modificar_fecha_sepultacion
integer x = 50
integer y = 12
integer width = 2921
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ficha de Sepultación"
boolean focusrectangle = false
end type

type dw_modifica from datawindow within w_modificar_fecha_sepultacion
integer x = 37
integer y = 96
integer width = 2944
integer height = 1008
integer taborder = 10
string title = "none"
string dataobject = "dw_modificar_fecha_sepultacion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String	ls_columna
datetime	ldt_fecha
Long		ll_indi,ll_tot_reg

this.accepttext()
ll_tot_reg				= dw_modifica.rowcount()
ls_columna				= dwo.name
if ll_tot_reg>1 then
	if this.getrow() = 1 then
		if ls_columna='fecha_sepultacion' or ls_columna='fecha_traslado' then
			if dw_modifica.dataobject = 'dw_modificar_fecha_sepultacion' then
				ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_sepultacion')
			elseif dw_modifica.dataobject	= 'dw_modificar_fecha_traslado' then
				ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_traslado')
			elseif dw_modifica.dataobject = 'dw_modificar_fecha_reduccion' then
				ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_sepultacion')
			elseif dw_modifica.dataobject = 'dw_modificar_fecha_cadaver_transito' then
				ldt_fecha	= dw_modifica.getitemdatetime(1,'fecha_sepultacion')
			end if
			if not isnull(ldt_fecha) and ldt_fecha <> idt_fecha_sepult then
				for ll_indi=2 to ll_tot_reg
					if dw_modifica.dataobject = 'dw_modificar_fecha_sepultacion' then
						dw_modifica.setitem(ll_indi,'fecha_sepultacion',ldt_fecha)
					elseif dw_modifica.dataobject	= 'dw_modificar_fecha_traslado' then
						dw_modifica.setitem(ll_indi,'fecha_traslado',ldt_fecha)
					elseif dw_modifica.dataobject = 'dw_modificar_fecha_reduccion' then
						dw_modifica.setitem(ll_indi,'fecha_sepultacion',ldt_fecha)
					elseif dw_modifica.dataobject = 'dw_modificar_fecha_cadaver_transito' then
						dw_modifica.setitem(ll_indi,'fecha_sepultacion',ldt_fecha)
					end if
				next
				dw_modifica.accepttext()
			end if
		end if
	end if
end if
end event

