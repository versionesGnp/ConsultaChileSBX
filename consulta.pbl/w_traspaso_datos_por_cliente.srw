forward
global type w_traspaso_datos_por_cliente from window
end type
type st_1 from statictext within w_traspaso_datos_por_cliente
end type
type cb_2 from commandbutton within w_traspaso_datos_por_cliente
end type
type cb_1 from commandbutton within w_traspaso_datos_por_cliente
end type
type dw_lista from datawindow within w_traspaso_datos_por_cliente
end type
end forward

global type w_traspaso_datos_por_cliente from window
integer width = 814
integer height = 796
boolean titlebar = true
string title = "Actualizar Estados por Cliente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_lista dw_lista
end type
global w_traspaso_datos_por_cliente w_traspaso_datos_por_cliente

on w_traspaso_datos_por_cliente.create
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.Control[]={this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_lista}
end on

on w_traspaso_datos_por_cliente.destroy
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_lista)
end on

event open;dw_lista.settransobject(sqlca)
gf_centrar(w_traspaso_datos_por_cliente)
SetPointer(HourGlass!)
dw_lista.retrieve()
SetPointer(Arrow!)
end event

type st_1 from statictext within w_traspaso_datos_por_cliente
integer x = 41
integer y = 620
integer width = 699
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_traspaso_datos_por_cliente
integer x = 485
integer y = 496
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_traspaso_datos_por_cliente)
end event

type cb_1 from commandbutton within w_traspaso_datos_por_cliente
integer x = 46
integer y = 496
integer width = 256
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_rut,ll_cod_accion_carta,ll_indi,ll_tot_reg,ll_count
String	ls_cod_envio_carta,ls_estado_env_carta,ls_clasif_carta,ls_estado_tele_log,&
			ls_glosa_tele_log,ls_estado_pub,ls_glosa_pub,ls_estado_postventa,ls_glosa_postventa
Datetime	ldt_fecha_carta,ldt_fecha_tele_log,ldt_fecha_pub,ldt_fecha_postventa

SetPointer(HourGlass!)
ll_tot_reg		= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_rut		= dw_lista.getitemnumber(ll_indi,'rut')
	st_1.text	= string(ll_indi,"###,###,###,###,##0")
	if ll_rut>0 then 
		SELECT  COUNT("CARTA_LOG"."COD_ENVIO")  
		INTO    :ll_count
		FROM    "CARTA_LOG"  
		WHERE ( "CARTA_LOG"."RUT" = :ll_rut ) AND  
				( "CARTA_LOG"."FECHA_CARTA" = ( 	SELECT MAX("CARTA_LOG"."FECHA_CARTA") 
															FROM   "CARTA_LOG" 
															WHERE  "CARTA_LOG"."RUT" = :ll_rut  ))   ;
		if ll_count>0 then
			SELECT  "CARTA_LOG"."COD_ENVIO",   
					  "CARTA_LOG"."ESTADO_ENV",   
					  "CARTA_LOG"."FECHA_CARTA",   
					  "CARTA_LOG"."COD_ACCION",   
					  "CARTA_LOG"."CLASIFICACION"  
		  	INTO    :ls_cod_envio_carta,
					  :ls_estado_env_carta,
					  :ldt_fecha_carta,
					  :ll_cod_accion_carta,
					  :ls_clasif_carta
		  	FROM    "CARTA_LOG"  
		  	WHERE ( "CARTA_LOG"."RUT" = :ll_rut ) AND  
				   ( "CARTA_LOG"."FECHA_CARTA" = ( SELECT MAX("CARTA_LOG"."FECHA_CARTA") 
															  FROM   "CARTA_LOG" 
															  WHERE  "CARTA_LOG"."RUT" = :ll_rut  ))   ;
		  if ls_cod_envio_carta<>'' and ls_clasif_carta<>'' then
			  UPDATE  "CLIENTE"  
			  SET     "ULT_COD_ENVIO_CARTA" = :ls_cod_envio_carta,   
						 "ULT_ESTADO_ENVIO_CARTA" = :ls_estado_env_carta,   
						 "ULT_FECHA_ENVIO_CARTA" = :ldt_fecha_carta,   
						 "ULT_COD_ACCION_ENVIO_CARTA" = :ll_cod_accion_carta,   
						 "ULT_CLASIFICACION_ENVIO_CARTA" = :ls_clasif_carta  
			  WHERE   "CLIENTE"."RUT" = :ll_rut   ;
			  if sqlca.sqlcode=0 then
				  commit;
			  else
				 rollback;
			  end if
		  end if
	  end if
	  ll_count	= 0
	  SELECT  count("TELE_LOG"."ESTADO")   
	  INTO    :ll_count
	  FROM    "TELE_LOG"  
	  WHERE ( "TELE_LOG"."RUT" = :ll_rut ) AND  
			  ( "TELE_LOG"."FECHA" = ( SELECT MAX("TELE_LOG"."FECHA") 
												FROM "TELE_LOG" 
												WHERE "TELE_LOG"."RUT" = :ll_rut  ) ) ;
	  if ll_count>0 then
		  SELECT  "TELE_LOG"."ESTADO",   
					 "TELE_LOG"."FECHA",   
					 "TELE_LOG"."GLOSA"  
		  INTO    :ls_estado_tele_log,
					 :ldt_fecha_tele_log,
					 :ls_glosa_tele_log
		  FROM    "TELE_LOG"  
		  WHERE ( "TELE_LOG"."RUT" = :ll_rut ) AND  
				  ( "TELE_LOG"."FECHA" = ( SELECT MAX("TELE_LOG"."FECHA") 
													FROM "TELE_LOG" 
													WHERE "TELE_LOG"."RUT" = :ll_rut  ) ) ;
		  if ls_estado_tele_log <> '' and ls_glosa_tele_log <> '' then
			  UPDATE  "CLIENTE"  
			  SET     "ESTADO_COBRANZA" = :ls_estado_tele_log,   
						 "FECHA_COBRANZA" = :ldt_fecha_tele_log,   
						 "GLOSA_COBRANZA" = :ls_glosa_tele_log  
			  WHERE   "CLIENTE"."RUT" = :ll_rut   ;
			  if sqlca.sqlcode=0 then
				  commit;
			  else
				  rollback;
			  end if
		  end if
	  end if
	  ll_count	=0
	  
	  SELECT  count("ATENCION_LOG"."ESTADO")
	  INTO    :ll_count
	  FROM    "ATENCION_LOG"  
	  WHERE ( "ATENCION_LOG"."RUT" = :ll_rut ) AND  
			  ( "ATENCION_LOG"."FECHA" = ( SELECT MAX("ATENCION_LOG"."FECHA") 
													 FROM "ATENCION_LOG" 
													 WHERE "ATENCION_LOG"."RUT" = :ll_rut  ) ) ;
	  if ll_count>0 then
		  SELECT  "ATENCION_LOG"."ESTADO",   
					 "ATENCION_LOG"."FECHA",   
					 "ATENCION_LOG"."GLOSA"  
		  INTO    :ls_estado_pub,
					 :ldt_fecha_pub,
					 :ls_glosa_pub
		  FROM    "ATENCION_LOG"  
		  WHERE ( "ATENCION_LOG"."RUT" = :ll_rut ) AND  
				  ( "ATENCION_LOG"."FECHA" = ( SELECT MAX("ATENCION_LOG"."FECHA") 
														 FROM "ATENCION_LOG" 
														 WHERE "ATENCION_LOG"."RUT" = :ll_rut  ) ) ;
		  if ls_estado_pub<>'' and ls_glosa_pub<>'' then
			  UPDATE   "CLIENTE"  
			  SET      "ULT_ESTADO_PUB" = :ls_estado_pub,   
						  "ULT_GLOSA_PUB" = :ls_glosa_pub,   
						  "ULT_FECHA_PUB" = :ldt_fecha_pub  
			  WHERE    "CLIENTE"."RUT" = :ll_rut   ;
			  if sqlca.sqlcode=0 then
				  commit;
			  else
				  rollback;
			  end if
		  end if
	  end if
	  
	  ll_count	= 0
	  SELECT  count("TELE_LOG_POST_VENTA"."ESTADO")
	  INTO    :ll_count
	  FROM    "TELE_LOG_POST_VENTA"  
	  WHERE ( "TELE_LOG_POST_VENTA"."RUT" = :ll_rut ) AND  
			  ( "TELE_LOG_POST_VENTA"."FECHA" = ( SELECT MAX("TELE_LOG_POST_VENTA"."FECHA") 
															  FROM "TELE_LOG_POST_VENTA" 
															  WHERE "TELE_LOG_POST_VENTA"."RUT" = :ll_rut  ) );
	  if ll_count>0 then
		  SELECT  "TELE_LOG_POST_VENTA"."ESTADO",   
					 "TELE_LOG_POST_VENTA"."FECHA",   
					 "TELE_LOG_POST_VENTA"."GLOSA"  
		  INTO    :ls_estado_postventa,
					 :ldt_fecha_postventa,
					 :ls_glosa_postventa
		  FROM    "TELE_LOG_POST_VENTA"  
		  WHERE ( "TELE_LOG_POST_VENTA"."RUT" = :ll_rut ) AND  
				  ( "TELE_LOG_POST_VENTA"."FECHA" = ( SELECT MAX("TELE_LOG_POST_VENTA"."FECHA") 
																  FROM "TELE_LOG_POST_VENTA" 
																  WHERE "TELE_LOG_POST_VENTA"."RUT" = :ll_rut  ) );
		  if ls_estado_postventa<>'' and ls_glosa_postventa<>'' then
			  UPDATE   "CLIENTE"  
			  SET      "ESTADO_COB_PROSTVENTA" = :ls_estado_postventa,   
						  "FECHA_COB_POSTVENTA" = :ldt_fecha_postventa,   
						  "GLOSA_COB_POSTVENTA" = :ls_glosa_postventa  
			  WHERE    "CLIENTE"."RUT" = :ll_rut  ;
			  if sqlca.sqlcode=0 then
				  commit;
			  else
				  rollback;
			  end if
		  end if
	  end if
	end if
next
messagebox("Grabar","Gabración Exitosa")
SetPointer(Arrow!)
end event

type dw_lista from datawindow within w_traspaso_datos_por_cliente
integer x = 41
integer y = 36
integer width = 699
integer height = 432
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_rut_cliente"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

