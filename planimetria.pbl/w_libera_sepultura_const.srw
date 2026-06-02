forward
global type w_libera_sepultura_const from window
end type
type cb_3 from commandbutton within w_libera_sepultura_const
end type
type dw_1 from datawindow within w_libera_sepultura_const
end type
type cb_2 from commandbutton within w_libera_sepultura_const
end type
type cb_1 from commandbutton within w_libera_sepultura_const
end type
end forward

global type w_libera_sepultura_const from window
integer width = 2002
integer height = 1288
boolean titlebar = true
string title = "Liberación de Sepulturas"
long backcolor = 67108864
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_libera_sepultura_const w_libera_sepultura_const

type variables
LONG CORRE
integer id_parque
end variables

on w_libera_sepultura_const.create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_libera_sepultura_const.destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string 		estado,base,serie,status,base_fall,serie_fall,numero,sub_sector
long 			folio
datetime 	fecha_reserva
DataWindowChild dw_child_estado_sep
Double		contrato
id_parque 	= w_plano_sector_parque.id_parque
corre 			= long(Message.StringParm)
w_plano_sector_parque.dw_plano_sector_parque.enabled = false

gf_centrar(w_libera_sepultura_const)
dw_1.settransobject(sqlca)
if dw_1.retrieve(gs_base,gs_serie,gi_numero,gs_sector,gs_sepultura,id_parque) > 0 then
	if  dw_1.getitemnumber(1,'inventario_plani_const_numero') = 10000000 then
		messagebox('Sepultura Colectiva','Esta es una Sepultura Colectiva',stopsign!)
		close(w_libera_sepultura_const)
	end if
else
	close(w_libera_sepultura_const)
end if
end event

event close;//w_plano_sector_parque.wf_pinta_sector(w_plano_sector_parque.dw_plano_sector_parque)
end event

type cb_3 from commandbutton within w_libera_sepultura_const
integer x = 475
integer y = 1020
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ortografía"
end type

event clicked;dw_1.accepttext ()
if dw_1.getitemstring(1,'inventario_plani_const_observaciones') = "" or &
  	isnull(dw_1.getitemstring(1,'inventario_plani_const_observaciones')) then
	messagebox("AVISO","Debe ingresar palabras")
	dw_1.setfocus()
	return
else
	dw_1.setitem(1,'inventario_plani_const_observaciones',f_ortografia(dw_1.getitemstring(1,'inventario_plani_const_observaciones')))
end if

end event

type dw_1 from datawindow within w_libera_sepultura_const
integer x = 69
integer y = 56
integer width = 1838
integer height = 908
integer taborder = 10
string title = "none"
string dataobject = "dw_sepultura_a_liberar_const"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_libera_sepultura_const
integer x = 1504
integer y = 1020
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;long i,folio
Double	numero_cont
w_plano_sector_parque.dw_plano_sector_parque.enabled = true
//------------------------------------------------------------------------------------------------------------
if isvalid(w_sepul_const_m12) then
	for i = 1 to w_sepul_const_m12.dw_1.rowcount()
		numero_cont = w_sepul_const_m12.dw_1.getitemnumber(i,'numero')
		if numero_cont = 0 then
			SELECT FOLIO_RESERVA INTO :folio FROM RESERVA_SEPULTURA 
			WHERE ( SECTOR = :gs_sector ) AND ( SEPULTURA = :	gs_sepultura ) AND 
			( ESTADO = 1 ) and ( "CORRE_INVENTARIO" = :i) ;
			if not isnull(folio) and folio > 0 then
				w_sepul_const_m12.dw_1.setitem(i,'campo',3)// naranja
			else
				w_sepul_const_m12.dw_1.setitem(i,'campo',2)//azul
			end if
		else
			w_sepul_const_m12.dw_1.setitem(i,'campo',1)//verde
		end if
		setnull(folio)
	next
end if
//------------------------------------------------------------------------------------------------------------
close(w_libera_sepultura_const)
end event

type cb_1 from commandbutton within w_libera_sepultura_const
integer x = 69
integer y = 1020
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;integer  estado,count_reg,ret,capacidad
long     folio,correlativo,rut,i
string   sector,sepultura,base,serie,area,nro_tecnico,observacion,cod_age,sepultura_nd,n_sep,sector_sep
datetime	fecha,fecha_log,fecha_sys
Double	numero,numero_cont
if MessageBox("Guardar Cambios", '¿ Esta seguro que desea Liberar la Sepultura ?', Question!, OKCancel!, 2) = 1 then
	sector      		= dw_1.getitemstring(1,'inventario_plani_const_sector')				//*
	sepultura   		= dw_1.getitemstring(1,'inventario_plani_const_sepultura')			//*
	base        		= dw_1.getitemstring(1,'inventario_plani_const_base')				//*
	serie       		= dw_1.getitemstring(1,'inventario_plani_const_serie')				//*
	numero      		= dw_1.getitemnumber(1,'inventario_plani_const_numero')			//*
	rut         			= dw_1.getitemnumber(1,'inventario_plani_const_rut')				//*
	observacion 	= dw_1.getitemstring(1,'inventario_plani_const_observaciones')	//*
	if len(observacion) = 0 then
		messagebox('Observación','Debe llenar la observacion con 60 caracteres como maximo.',information!)
		dw_1.setfocus()
		return
	end if
	SELECT distinct sysdate INTO :fecha_sys FROM "AGENTES" using sqlca ;
	//--------------------------------verificar--------------------------------
	select count(*) into :count_reg from PAGO_OFERTA WHERE ( SERIE = :serie ) AND ( NRO_OFERTA = :numero ) using sqlca;
	if count_reg > 0 then
		UPDATE 	"PAGO_OFERTA"  
		SET 		"SEPULTURA"   = 0,   
			 		"NRO_TECNICO" = null  
		WHERE 	( "PAGO_OFERTA"."SERIE"      = :serie ) AND  
					( "PAGO_OFERTA"."NRO_OFERTA" = :numero ) using sqlca;
		if sqlca.sqlcode = 0 then
			DELETE FROM RESERVA_SEPULTURA WHERE ( BASE = :gs_base ) AND ( SECTOR = :gs_serie ) AND ( NUMERO = :gi_numero ) AND ( COD_PARQUE = :id_parque ) ;
			if sqlca.sqlcode = 0 then
				SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
				IF ISNULL(correlativo) THEN correlativo = 1
				INSERT INTO "LOG_RESERVA_SEPULTURA"  
						 ( "CORRELATIVO",	"AREA",	"SECTOR",	"SEPULTURA",	"BASE",	"SERIE",	"NUMERO",	"FOLIO_RESERVA",	"RUT",	"OBSERVACION",	"FECHA_RESERVA","ESTADO","COD_AGENTE","FECHA_LOG","USUARIO_LOG","COD_PARQUE" )  
				VALUES ( :correlativo ,		:area ,	:sector ,		:sepultura ,		:base ,	:serie ,	:numero ,	:folio         ,				:rut ,		:observacion ,		:fecha         ,4       ,:cod_age    ,:fecha_log ,:gs_user     ,:id_parque   )  using sqlca;
				if sqlca.sqlcode = 0 then
					UPDATE 	"INVENTARIO_PLANI_CONST"  
					SET 		"BASE" = :base,   
								 "SERIE" = :serie,   
								 "NUMERO" = 0,   
								 "RUT" = 0,   
								 "OBSERVACIONES" = null,   
								 "LOG_USUARIO" = null,   
								 "FOLIO_ASIGNACION" = null  
					WHERE 	( "INVENTARIO_PLANI_CONST"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :sepultura ) and 
								( "INVENTARIO_PLANI_CONST"."CORRELATIVO" = :CORRE ) and ( "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :id_parque ) using sqlca ;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
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
			SET 		"SEPULTURA"  = 0,   
			    			"NRO_TEC"    = null  
			WHERE 	( "CONTRATO"."SERIE_C" = :serie ) AND  
						( "CONTRATO"."NRO_CONTRATO"  = :numero )  using sqlca ;
			if sqlca.sqlcode = 0 then
				DELETE FROM RESERVA_SEPULTURA WHERE ( BASE = :gs_base ) AND ( SECTOR = :gs_serie ) AND ( NUMERO = :gi_numero ) AND (CORRE_INVENTARIO = :CORRE )  AND ( COD_PARQUE = :id_parque ) ;
				if sqlca.sqlcode = 0 then				
					SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
					IF ISNULL(correlativo) THEN correlativo = 1
					INSERT INTO "LOG_RESERVA_SEPULTURA"  
							 	( "CORRELATIVO","AREA","SECTOR","SEPULTURA","BASE","SERIE","NUMERO","FOLIO_RESERVA","RUT","OBSERVACION","FECHA_RESERVA","ESTADO","COD_AGENTE","FECHA_LOG","USUARIO_LOG", "COD_PARQUE" )  
					VALUES 	( :correlativo ,:area ,:sector ,:sepultura ,:base ,:serie ,:numero ,:folio         ,:rut ,:observacion ,:fecha         ,4       ,:cod_age    ,:fecha_log ,:gs_user     , :id_parque    )  using sqlca;
					if sqlca.sqlcode = 0 then
						UPDATE "INVENTARIO_PLANI_CONST"  
						SET 		"BASE" = null,   
									 "SERIE" = null,   
									 "NUMERO" = 0,   
									 "RUT" = 0,   
									 "OBSERVACIONES" = null,   
									 "LOG_USUARIO" = null,   
									 "FOLIO_ASIGNACION" = null  
						WHERE 	( "INVENTARIO_PLANI_CONST"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :sepultura ) AND 
									( "INVENTARIO_PLANI_CONST"."CORRELATIVO" = :CORRE )  AND ( "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :id_parque ) using sqlca ;
						if sqlca.sqlcode = 0 then
							commit using sqlca;
						else
							ROLLBACK using sqlca;
							MessageBox("Error", "Favor dar aviso al Depto. de Informatica (06)",stopsign! )
						end if
					else
						ROLLBACK using sqlca;
						MessageBox("Error", "Favor dar aviso al Depto. de Informatica (05)",stopsign! )
					end if
				END IF
			else
				ROLLBACK using sqlca;
				MessageBox("Error", "Favor dar aviso al Depto. de Informatica (03)",stopsign! )
			end if
		else
			MessageBox("Error", "(08) La promesa "+base+' - '+serie+' - '+string(numero,'###,###,###')+' No Existe.',stopsign! )
		end if
	end if
end if

if isvalid(w_sepul_const_m12) then
	for i = 1 to w_sepul_const_m12.dw_1.rowcount()
		numero_cont 	= w_sepul_const_m12.dw_1.getitemnumber(i,'numero')
		correlativo 		= w_sepul_const_m12.dw_1.getitemnumber(i,'correlativo')
		if numero_cont = 0 then
			SETNULL(folio)
			SELECT 	FOLIO_RESERVA,	CORRE_INVENTARIO  
			INTO 		:FOLIO,				:CORRE   
			FROM 	RESERVA_SEPULTURA  
			WHERE 	( SECTOR = :GS_SECTOR ) AND ( SEPULTURA = :GS_SEPULTURA ) AND 
						( "RESERVA_SEPULTURA"."CORRE_INVENTARIO" = :correlativo ) AND   
						( ESTADO = 1 ) and (COD_PARQUE = :id_parque );
			if not isnull(folio) and folio > 0 AND correlativo = CORRE then
				w_sepul_const_m12.dw_1.setitem(i,'campo',3)// naranja
			else
				w_sepul_const_m12.dw_1.setitem(i,'campo',2)//azul
			end if
		else
			w_sepul_const_m12.dw_1.setitem(i,'campo',1)//verde
		end if
		setnull(folio)
	next
end if
end event

