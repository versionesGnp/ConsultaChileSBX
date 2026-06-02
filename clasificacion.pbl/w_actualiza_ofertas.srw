forward
global type w_actualiza_ofertas from window
end type
type cb_actualiza from commandbutton within w_actualiza_ofertas
end type
type gb_1 from groupbox within w_actualiza_ofertas
end type
end forward

global type w_actualiza_ofertas from window
integer x = 832
integer y = 360
integer width = 1691
integer height = 496
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
cb_actualiza cb_actualiza
gb_1 gb_1
end type
global w_actualiza_ofertas w_actualiza_ofertas

type variables
datetime fecha
end variables

on w_actualiza_ofertas.create
this.cb_actualiza=create cb_actualiza
this.gb_1=create gb_1
this.Control[]={this.cb_actualiza,&
this.gb_1}
end on

on w_actualiza_ofertas.destroy
destroy(this.cb_actualiza)
destroy(this.gb_1)
end on

event open;this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name

IF GS_USER = 'CHRIS' OR  GS_USER = 'CARLOS' OR  GS_USER = 'LEO' THEN
ELSE
	MESSAGEBOX('ERROR','USUARIO NO ESTA AUTORIZADO.',STOPSIGN!)
	CLOSE(w_actualiza_ofertas)
END IF

end event

type cb_actualiza from commandbutton within w_actualiza_ofertas
integer x = 155
integer y = 152
integer width = 1376
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "~'Actualizar~'"
end type

event clicked;integer ret,i
string fec,agente,clas_new
datawindow dw_paso
double mora,cant_pro,porc,vsp


fec = string(gd_fecha_fin,'dd-mm-yyyy')
dw_paso = Message.PowerObjectParm
if dw_paso.rowcount() > 0 then
	if gs_age_sup = 0 then
		ret = messagebox(gs_app_name,'¿ Esta seguro que desea actualizar ?~n~r~n~r~n~rLa Actualización cambiará de Clasificación a ~n~r'+&
		'todos los Agentes.',Question!,YesNoCancel! ,3)
		if ret = 1 then
			for i = 1 to dw_paso.rowcount()
				setpointer(HourGlass!)
				agente   = dw_paso.getitemstring(i,'agentes_cod_age')
				clas_new = dw_paso.getitemstring(i,'clas_new')
				mora     = dw_paso.getitemnumber(i,'mora')
				cant_pro = dw_paso.getitemnumber(i,'pagada')
				porc     = round(dw_paso.getitemnumber(i,'porc'),2)
				vsp      = dw_paso.getitemnumber(i,'vsp')
				UPDATE "AGENTES" SET "CLASIFICACION" = :clas_new,"VSP" = :vsp WHERE "AGENTES"."COD_AGE" = :agente ;
				if sqlca.sqlcode = 0 then
					INSERT INTO "CLASIFICA_HIST"  
							 ( "COD_AGE","FECHA_CLASIFICA","TIPO_CLASIFICA","MORA_CLASIFICA","CONTRATOS_CLASIFICA","PORCE_CLASIFICA","VSP" )  
					VALUES ( :agente  , :gd_fecha_fin   ,:clas_new       ,:mora           ,:cant_pro            ,:porc            ,:vsp  )  ;
					if sqlca.sqlcode = 0 then
						commit;
					else
						UPDATE "CLASIFICA_HIST"  
						  SET "COD_AGE" = :agente,   
								"FECHA_CLASIFICA" = :gd_fecha_fin,   
								"TIPO_CLASIFICA" = :clas_new,   
								"MORA_CLASIFICA" = :mora,   
								"CONTRATOS_CLASIFICA" = :cant_pro,   
								"PORCE_CLASIFICA" = :porc,   
								"VSP" = :vsp  
						WHERE ( "CLASIFICA_HIST"."COD_AGE" = :agente ) AND  
								( "CLASIFICA_HIST"."FECHA_CLASIFICA" = :gd_fecha_fin )   ;
						if sqlca.sqlcode = 0 then
							commit;
						else
							rollback;
							messagebox('Proceso','Se detectó fallo en Actualización.',information!)
						end if
					end if
				else
					rollback;
					messagebox('Proceso','Se detectó fallo en Actualización.',information!)
				end if
			next
			messagebox('Proceso','Actualización Terminada.',information!)
			close(w_actualiza_ofertas)
		elseif ret = 2 then
			close(w_actualiza_ofertas)
		end if
	else
		ret = messagebox(gs_app_name,'¿ Esta seguro que desea actualizar ?~n~r~n~r~n~rLa Actualización cambiará de Clasificación a ~n~r'+&
		'todos los Supervisores.',Question!,YesNoCancel! ,3)
		if ret = 1 then
			setpointer(HourGlass!)
			for i = 1 to dw_paso.rowcount()
				agente   = dw_paso.getitemstring(i,'supervisor_cod_sup')
				clas_new = dw_paso.getitemstring(i,'clas_new')
				mora     = dw_paso.getitemnumber(i,'mora')
				cant_pro = dw_paso.getitemnumber(i,'pagada')
				porc     = dw_paso.getitemnumber(i,'porc')
				vsp      = dw_paso.getitemnumber(i,'vsp')
				UPDATE "SUPERVISOR" SET "CLASIFICA"  = :clas_new,"VSP" = :vsp WHERE "SUPERVISOR"."COD_SUP" = :agente ;
				if sqlca.sqlcode = 0 then
					INSERT INTO "CLASIFICA_HIST_SUP"  
							 ( "COD_SUP","FECHA_CLASIFICA_SUP","TIPO_CLASIFICA_SUP","MORA_CLASIFICA_SUP","CONTRATOS_CLASIFICA_SUP","PORCE_CLASIFICA_SUP","VSP" )  
					VALUES ( :agente  , :gd_fecha_fin       ,:clas_new           ,:mora               ,:cant_pro                ,:porc                ,:vsp  )  ;
					if sqlca.sqlcode = 0 then
						commit;
					else
						rollback;
						messagebox('Proceso','Se detectó fallo en Actualización.',information!)
					end if
				else
					rollback;
					messagebox('Proceso','Se detectó fallo en Actualización.',information!)
				end if

			next
			messagebox('Proceso','Actualización Terminada.',information!)
			close(w_actualiza_ofertas)
		elseif ret = 2 then
			close(w_actualiza_ofertas)
		end if		
	end if
end if
end event

type gb_1 from groupbox within w_actualiza_ofertas
integer x = 96
integer y = 44
integer width = 1499
integer height = 296
integer taborder = 60
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 79741120
string text = "Actualización de Clasificación"
end type

