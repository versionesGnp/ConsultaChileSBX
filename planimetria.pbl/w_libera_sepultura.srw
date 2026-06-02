forward
global type w_libera_sepultura from window
end type
type cb_3 from commandbutton within w_libera_sepultura
end type
type dw_1 from datawindow within w_libera_sepultura
end type
type cb_2 from commandbutton within w_libera_sepultura
end type
type cb_1 from commandbutton within w_libera_sepultura
end type
end forward

global type w_libera_sepultura from window
integer width = 2267
integer height = 1536
boolean titlebar = true
string title = "Liberación de Sepulturas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_libera_sepultura w_libera_sepultura

type variables
integer id_parque
end variables

on w_libera_sepultura.create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_libera_sepultura.destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string	estado,base,serie,status,base_fall,serie_fall,sub_sector
long 		folio
datetime fecha_reserva
Double	numero,contrato
DataWindowChild dw_child_estado_sep

gf_centrar(w_libera_sepultura)
dw_1.settransobject(sqlca)
id_parque 															= integer(w_plano_sector_parque.st_parque.text)//Multiempresa 13-11-2006
gs_ventana 															= 'w_libera_sepultura'
f_valida_objeto()
w_plano_sector_parque.dw_plano_sector_parque.enabled 	= false
if dw_1.retrieve(gs_base,gs_serie,gi_numero,gs_sector,gs_sepultura,id_parque) > 0 then
	dw_1.setitem(1,'inventario_plani_observaciones','Liberación de Sepultura')
	dw_1.setitem(1,'c_usuario',gs_user)
	if  dw_1.getitemnumber(1,'inventario_plani_numero') = 10000000 then
		messagebox('Sepultura Colectiva','Esta es una Sepultura Colectiva',stopsign!)
		close(w_libera_sepultura)
	end if
else
	messagebox('Advertencia','Sepultura NO se Encuentra Asignada',stopsign!)
	w_plano_sector_parque.dw_plano_sector_parque.enabled = true
	close(w_libera_sepultura)
end if
end event

type cb_3 from commandbutton within w_libera_sepultura
integer x = 434
integer y = 1268
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ortografía"
end type

event clicked;dw_1.accepttext ()
if dw_1.getitemstring(1,'inventario_plani_observaciones') = "" or isnull(dw_1.getitemstring(1,'inventario_plani_observaciones')) then
	messagebox("AVISO","Debe ingresar palabras")
	dw_1.setfocus()
	return
else
	dw_1.setitem(1,'inventario_plani_observaciones',f_ortografia(dw_1.getitemstring(1,'inventario_plani_observaciones')))

end if

end event

type dw_1 from datawindow within w_libera_sepultura
integer x = 27
integer y = 24
integer width = 2203
integer height = 1200
integer taborder = 10
string title = "none"
string dataobject = "dw_sepultura_a_liberar"
boolean border = false
boolean livescroll = true
end type

type cb_2 from commandbutton within w_libera_sepultura
integer x = 1801
integer y = 1268
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;//if dw_1.ModifiedCount() > 0 then
//	w_plano_sector_parque.wf_pinta_sector(w_plano_sector_parque.dw_plano_sector_parque)
//end if
w_plano_sector_parque.dw_plano_sector_parque.enabled = true
close(w_libera_sepultura)
end event

type cb_1 from commandbutton within w_libera_sepultura
integer x = 27
integer y = 1268
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;integer  estado,count_reg,ret,capacidad
long     folio,correlativo,rut,count_fall
string   sector,sepultura,base,serie,area,nro_tecnico,observacion,cod_age,sepultura_nd,n_sep,sector_sep
datetime	fecha,fecha_log,fecha_sys
Double	numero
dw_1.accepttext()
if MessageBox("Guardar Cambios", '¿ Esta seguro que desea Liberar la Sepultura ?', Question!, OKCancel!, 2) = 1 then
	SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK"=1;
	sector      	= dw_1.getitemstring(1,'inventario_plani_sector')	//*
	sepultura   	= dw_1.getitemstring(1,'inventario_plani_sepultura')	//*
	base       	= dw_1.getitemstring(1,'inventario_plani_base')	//*
	serie      		= dw_1.getitemstring(1,'inventario_plani_serie')	//*
	numero    	= dw_1.getitemnumber(1,'inventario_plani_numero')	//*
	rut         		= dw_1.getitemnumber(1,'inventario_plani_rut')	//*
	observacion = dw_1.getitemstring(1,'inventario_plani_observaciones')	//*
	if len(observacion) = 0 then
		messagebox('Observación','Debe llenar la observación con 60 caracteres como máximo.',information!)
		dw_1.setfocus()
		return
	end if
	SELECT count(1)  into :count_fall FROM "FALLECIDOS" 
	WHERE 	( "FALLECIDOS"."BASE" = :base ) AND 
	     		( "FALLECIDOS"."SS" = :serie )  AND 
				  ( "FALLECIDOS"."ESTADO_REG" = 'A' )  AND 
				( "FALLECIDOS"."CONTRATO" = :numero ) ;
	if count_fall > 0 then 
		messagebox('Advertencia Fallecidos','El Contrato por Liberar, '+base+'-'+serie+'-'+string(numero,'###,###,###,###') +', Tiene '+string(count_fall)+' fallecido(s).',information!)
//		return
	end if
			
	//--------------------------------verificar--------------------------------
	select count(*) into :count_reg from PAGO_OFERTA WHERE ( SERIE = :serie ) AND ( NRO_OFERTA = :numero ) using sqlca;
	if count_reg > 0 then
		UPDATE 	"PAGO_OFERTA"  
		SET 		"SEPULTURA"   = 0,   
			 		"NRO_TECNICO" = null  
		WHERE 	( "PAGO_OFERTA"."SERIE" = :serie ) AND  
					( "PAGO_OFERTA"."NRO_OFERTA" = :numero ) using sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			DELETE FROM RESERVA_SEPULTURA WHERE ( BASE = :gs_base ) AND ( SECTOR = :gs_serie ) AND ( NUMERO = :gi_numero ) AND ( COD_PARQUE = :id_parque ) ;
			if sqlca.sqlcode = 0 then
				SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
				IF ISNULL(correlativo) THEN correlativo = 1
				INSERT INTO "LOG_RESERVA_SEPULTURA"  
						 	( "CORRELATIVO",	"AREA",	"SECTOR",	"SEPULTURA",	"BASE",	"SERIE",	"NUMERO",	"FOLIO_RESERVA",	"RUT",	"OBSERVACION",	"FECHA_RESERVA",	"ESTADO",	"COD_AGENTE",	"FECHA_LOG",		"USUARIO_LOG",	"COD_PARQUE" )  
				VALUES 	( :correlativo ,		:area ,	:sector ,		:sepultura ,		:base ,	:serie ,	:numero ,	:folio         ,				:rut ,		:observacion ,		:gdt_fec_sistema,	4,				:cod_age,		:gdt_fec_sistema,	:gs_user     ,	:id_parque   )  using sqlca;
				if sqlca.sqlcode = 0 then
					commit using sqlca;
					UPDATE "INVENTARIO_PLANI"  
					SET "BASE" = :base,   
						 "SERIE" = :serie,   
						 "NUMERO" = 0,   
						 "RUT" = 0,   
						 "OBSERVACIONES" = null,   
						 "LOG_USUARIO" = null,   
						 "FOLIO_ASIGNACION" = null  
					WHERE ( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura ) AND ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) using sqlca ;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
						messagebox('Liberación','Liberación exitosa.',information!)
						w_plano_sector_parque.st_40.triggerevent( clicked!)
						w_plano_sector_parque.dw_plano_sector_parque.enabled = true
						f_Print( dw_1 )
						close(w_libera_sepultura)
					else
						ROLLBACK using sqlca;
						MessageBox("Error", "Favor dar aviso al Depto. de Informatica (06)",stopsign! )
					end if
				else
					ROLLBACK using sqlca;
					MessageBox("Error", "Favor dar aviso al Depto. de Informatica (05)",stopsign! )
				end if
			else
				ROLLBACK using sqlca;
				MessageBox("Error", "Favor dar aviso al Depto. de Informatica (01)",stopsign! )
			end if
		else
			ROLLBACK using sqlca;
			MessageBox("Error", "Favor dar aviso al Depto. de Informatica (07)",stopsign! )
		end if
	else
		SELECT count(*) INTO :count_reg FROM CONTRATO WHERE ( SERIE_C = :serie ) AND ( NRO_CONTRATO = :numero )   ;
		if count_reg > 0 then
			UPDATE 	"CONTRATO"  
			SET 		"SEPULTURA" = 0,   
			    			"NRO_TEC" = null  
			WHERE  	( "CONTRATO"."SERIE_C" = :serie ) AND  
					 	( "CONTRATO"."NRO_CONTRATO"  = :numero )  using sqlca ;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
				IF ISNULL(correlativo) THEN correlativo = 1
				INSERT INTO "LOG_RESERVA_SEPULTURA"  
						 	( 	"CORRELATIVO",	"AREA",	"SECTOR",	"SEPULTURA",	"BASE",	"SERIE",	"NUMERO",	"FOLIO_RESERVA",	"RUT",	"OBSERVACION",	"FECHA_RESERVA",		"ESTADO",	"COD_AGENTE",	"FECHA_LOG",		"USUARIO_LOG",	"COD_PARQUE")  
				VALUES 	( 	:correlativo ,		:area ,	:sector ,		:sepultura ,		:base ,	:serie ,	:numero ,	:folio         ,				:rut ,		:observacion ,	:gdt_fec_sistema,		4       ,	:cod_age    ,	:gdt_fec_sistema ,:gs_user     ,	:id_parque  )  
				using sqlca;
				if sqlca.sqlcode = 0 then
					commit using sqlca;
					UPDATE 	"INVENTARIO_PLANI"  
					SET		"BASE" = :base,   
							 	"SERIE" = :serie,   
							 	"NUMERO" = 0,   
							 	"RUT" = 0,   
							 	"OBSERVACIONES" = null,   
							 	"LOG_USUARIO" = null,   
							 	"FOLIO_ASIGNACION" = null  
					WHERE ( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura ) AND ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) using sqlca ;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
						messagebox('Liberación','Liberación exitosa.',information!)
						w_plano_sector_parque.st_40.triggerevent( clicked!)
						w_plano_sector_parque.dw_plano_sector_parque.enabled = true
						f_Print( dw_1 )
						close(w_libera_sepultura)
					else
						ROLLBACK using sqlca;
						MessageBox("Error", "Favor dar aviso al Depto. de Informática (06)",stopsign! )
					end if
				else
					ROLLBACK using sqlca;
					MessageBox("Error", "Favor dar aviso al Depto. de Informática (05)",stopsign! )
				end if
			else
				ROLLBACK using sqlca;
				MessageBox("Error", "Favor dar aviso al Depto. de Informática (03)",stopsign! )
			end if
		else
			MessageBox("Error", "(08) La Promesa "+base+' - '+serie+' - '+string(numero,'###,###,###')+' No Existe.',stopsign! )
		end if
	end if
end if
end event

