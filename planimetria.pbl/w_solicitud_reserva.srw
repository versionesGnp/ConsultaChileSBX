forward
global type w_solicitud_reserva from window
end type
type cb_6 from commandbutton within w_solicitud_reserva
end type
type cb_5 from commandbutton within w_solicitud_reserva
end type
type sle_1 from u_sle_rut within w_solicitud_reserva
end type
type cb_4 from commandbutton within w_solicitud_reserva
end type
type dw_3 from datawindow within w_solicitud_reserva
end type
type cb_3 from commandbutton within w_solicitud_reserva
end type
type cb_2 from commandbutton within w_solicitud_reserva
end type
type cb_1 from commandbutton within w_solicitud_reserva
end type
type dw_2 from datawindow within w_solicitud_reserva
end type
type dw_1 from datawindow within w_solicitud_reserva
end type
end forward

global type w_solicitud_reserva from window
integer width = 2647
integer height = 2616
boolean titlebar = true
string title = "Reserva de Sepultura"
boolean resizable = true
long backcolor = 67108864
cb_6 cb_6
cb_5 cb_5
sle_1 sle_1
cb_4 cb_4
dw_3 dw_3
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
end type
global w_solicitud_reserva w_solicitud_reserva

type variables
long corre
integer id_parque
end variables

on w_solicitud_reserva.create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.sle_1=create sle_1
this.cb_4=create cb_4
this.dw_3=create dw_3
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.cb_6,&
this.cb_5,&
this.sle_1,&
this.cb_4,&
this.dw_3,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_2,&
this.dw_1}
end on

on w_solicitud_reserva.destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.sle_1)
destroy(this.cb_4)
destroy(this.dw_3)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;string		estado,base,serie,status,base_fall,serie_fall,numero,sub_sector,ls_usuario,ls_nombre_age,serie_aux
long 		contrato,folio,ll_estado_res
datetime fecha_reserva
integer 	count_cont, count_prom,count
Double	numero_aux
DataWindowChild dw_child_estado_sep

gs_ventana				= 'w_solicitud_reserva'
f_valida_objeto()
id_parque 				= integer(w_plano_sector_parque.st_parque.text)
gl_cod_parque_cta	= id_parque
corre 						= long(Message.StringParm)
SELECT	"BLOQUEA_RESERVA"."USUARIO"  
INTO 		:ls_usuario  
FROM 	"BLOQUEA_RESERVA"  
WHERE  	( "BLOQUEA_RESERVA"."SECTOR"    = :GS_SECTOR ) AND  
       		( "BLOQUEA_RESERVA"."SEPULTURA" = :GS_SEPULTURA )   ;
if sqlca.sqlcode = 0 then
	ls_usuario 	= trim(ls_usuario)
	SELECT 	NOMBRE 
	INTO 		:ls_nombre_age 
	FROM 	ENCARGADOS 
	WHERE 	CODIGO_USUARIO = :ls_usuario   ;
	
	messagebox('Trabajando Registro','La sepultura Nº'+gs_sepultura+' del sector: '+&
	gs_sector+', se encuentra ocupada por el usuario '+ls_nombre_age,stopsign!)
	close(w_solicitud_reserva)
	return
else
	INSERT INTO "BLOQUEA_RESERVA"
				 	( "SECTOR"  ,"SEPULTURA"  ,"USUARIO" )  
	VALUES    	( :gs_sector,:gs_sepultura,:gs_user  )  ;
	if sqlca.sqlcode = 0 then
		commit;
	else
		rollback;
	end if
end if
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
w_plano_sector_parque.dw_plano_sector_parque.enabled = false

SELECT max(FOLIO_RESERVA) INTO :folio FROM RESERVA_SEPULTURA where ESTADO = 4 and SECTOR = :gs_sector and SEPULTURA= :gs_sepultura AND COD_PARQUE = :id_parque ;
//if isnull(corre) then
SELECT 	NUMERO,	BASE 
INTO 		:numero, 	:gs_base 
FROM 	INVENTARIO_PLANI       
WHERE 	( SECTOR = :gs_sector ) AND ( SEPULTURA = :gs_sepultura )  AND (COD_PARQUE = :id_parque) 
USING	sqlca;
if sqlca.sqlcode <> 0 then
	SELECT 	NUMERO,	BASE 
	INTO 		:numero,		:gs_base 
	FROM 	INVENTARIO_PLANI_CONST 
	WHERE 	( SECTOR = :gs_sector ) AND ( SEPULTURA = :gs_sepultura ) AND (COD_PARQUE = :id_parque);		//and ( CORRELATIVO = :corre ) 
end if

dw_1.GetChild('serie', idw_detalle)
idw_detalle.SetTransObject(SQLCA)
//idw_detalle.retrieve('O')
idw_detalle.retrieve(gs_base)
dw_1.GetChild('estado', dw_child_estado_sep)
dw_child_estado_sep.SetTransObject(SQLCA)
dw_child_estado_sep.Retrieve()
dw_child_estado_sep.setfilter('codigo <> 3 and codigo <> 2')
dw_child_estado_sep.filter()

if Double(numero) > 0 then//if count > 0 and long(numero) > 0 then
	serie_aux 		= ''
	numero_aux 	= 0
	SELECT	"OFERTA_V"."SERIE","OFERTA_V"."NRO_OFERTA" INTO :serie_aux,:numero_aux    
	FROM 	"CADENA","OFERTA_V","PAGO_OFERTA"  
	WHERE  ( "OFERTA_V"."SERIE"  = "PAGO_OFERTA"."SERIE" ) and  
			 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
			 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
			 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
			 (("CADENA"."CODIGO" = 'O' or "CADENA"."CODIGO" = 'U') AND  
			 ( "PAGO_OFERTA"."SECTOR"    = :gs_sector ) AND  
			 ( "PAGO_OFERTA"."SEPULTURA" = :gs_sepultura ) AND  
			 ( "CADENA"."COD_PARQUE"     = :id_parque ) )   ;
	if sqlca.sqlcode >= 0 then 
		messagebox('Sepultura Asignada','Esta sepultura se encuentra asignada a la Promesa '+serie_aux+' - '+string(numero),stopsign!)
	else
		SELECT	"CONTRATO"."SERIE_C","CONTRATO"."NRO_CONTRATO" INTO :serie_aux,:numero_aux   
		FROM 	"CADENA","CONTRATO"  
		WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
				 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
				 (("CADENA"."CODIGO" = 'C' ) AND  
				 ( "CONTRATO"."SECTOR" = :gs_sector ) AND  
				 ( "CONTRATO"."SEPULTURA" = :gs_sepultura ) AND  
				 ( "CADENA"."COD_PARQUE" = :id_parque ) )   ;
		if sqlca.sqlcode >= 0 then 
			messagebox('Sepultura Asignada','Esta sepultura se encuentra asignada al Contrato '+serie_aux+' - '+string(numero),stopsign!)
		end if
	end if
	close(w_solicitud_reserva)
	return
end if
//-----------------------------------valida asignación a Contrato-----------------------------------
SELECT	"RESERVA_SEPULTURA"."CORRE_INVENTARIO",	"RESERVA_SEPULTURA"."FOLIO_RESERVA",	"RESERVA_SEPULTURA"."ESTADO" 
INTO 		:corre,														:folio,														:ll_estado_res  
FROM 	"RESERVA_SEPULTURA"  
WHERE  	( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) AND  
		 	( "RESERVA_SEPULTURA"."SEPULTURA" = :gs_sepultura ) AND  
		 	( "RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque ) and		 
		 	( "RESERVA_SEPULTURA"."ESTADO" = 1 OR "RESERVA_SEPULTURA"."ESTADO" = 4);
//	( "RESERVA_SEPULTURA"."AREA" = :gs_area ) AND  		 
//		 ( "RESERVA_SEPULTURA"."CORRE_INVENTARIO" = :corre ) and		 
//		 ( "RESERVA_SEPULTURA"."ESTADO"           = 1 )  and 		 
if isnull(corre) then 
	corre				= 0
	folio				= 0
end if
if ll_estado_res=4 then
	messagebox("Advertencia","No es posible realizar esta Operación, es Reserva Técnica")
	close(w_solicitud_reserva)
else
	if dw_1.retrieve(folio,gs_sector,gs_sepultura,corre,id_parque) = 0 THEN
		this.height 	= 2616
		cb_1.visible 	= true
		cb_2.visible 	= true
		cb_4.visible 	= true
		cb_5.visible 	= false
		cb_6.visible 	= true
		gf_centrar(w_solicitud_reserva)
		count 			= count_cont + count_prom
		SELECT NUMERO INTO :numero FROM INVENTARIO_PLANI WHERE ( SECTOR = :gs_sector ) AND ( SEPULTURA = :gs_sepultura ) and (cod_parque = :id_parque )  ;
		if sqlca.sqlcode <> 0 then
			SELECT NUMERO INTO :numero FROM INVENTARIO_PLANI_CONST WHERE ( SECTOR = :gs_sector ) AND ( SEPULTURA = :gs_sepultura ) and ( CORRELATIVO = :corre )  and (cod_parque = :id_parque )  ;
		end if
		if ( not isnull(gs_sepultura) and gs_sepultura <> '') and( numero = '0' or numero = '10000000' ) then
			select distinct  sysdate into :fecha_reserva from agentes;
			dw_1.insertrow(0)
			if isvalid(w_reserva_directa) then
				dw_1.setitem(dw_1.rowcount(),'rut',gi_rut)
	//----------------------------------------------------------------------------------------------------------
				string dv, nombre,a_paterno,a_materno
				dv				= sle_1.calcula_dv(string(gi_rut))
				dw_1.setitem(1,'dv',dv)
				SELECT "CLIENTE"."NOMBRE","CLIENTE"."A_PATERNO","CLIENTE"."A_MATERNO" INTO :nombre,:a_paterno,:a_materno FROM "CLIENTE" WHERE "CLIENTE"."RUT" = :gi_rut ;
				if sqlca.sqlcode = 0 then
					dw_1.setitem(1,'nombre',nombre)
					dw_1.setitem(1,'a_paterno',a_paterno)
					dw_1.setitem(1,'a_materno',a_materno)
					dw_1.accepttext ()
				end if
	//----------------------------------------------------------------------------------------------------------			
				dw_1.setitem(dw_1.rowcount(),'area',gs_area)
				dw_1.setitem(dw_1.rowcount(),'base',gs_base)
				idw_detalle.retrieve(gs_base)
				dw_1.setitem(dw_1.rowcount(),'serie',gs_serie)
				dw_1.setitem(dw_1.rowcount(),'numero',gi_numero)
			else
//				dw_1.setitem(dw_1.rowcount(),'base','O')
				dw_1.setitem(dw_1.rowcount(),'base',gs_base)
				if id_parque=11 and gs_base='U' then
					dw_1.setitem(dw_1.rowcount(),'serie','O')
				elseif id_parque<>11 and gs_base='U' then
					dw_1.setitem(dw_1.rowcount(),'serie','U')
				else
					if id_parque = 1 then
						dw_1.setitem(dw_1.rowcount(),'serie','I')
					elseif id_parque = 11 then
						dw_1.setitem(dw_1.rowcount(),'serie','S')
					elseif id_parque = 103 then
						dw_1.setitem(dw_1.rowcount(),'serie','T')
					elseif id_parque = 101 then
						dw_1.setitem(dw_1.rowcount(),'serie','C')
					else
						dw_1.setitem(dw_1.rowcount(),'serie','I')
					end if
				end if
			end if
			dw_1.setitem(dw_1.rowcount(),'cod_agente','CA')
			dw_1.setitem(dw_1.rowcount(),'estado',1)
			dw_1.setitem(dw_1.rowcount(),'base',gs_base)
			idw_detalle.retrieve(gs_base)
			if id_parque<>11 and gs_base<>'U' then
				dw_1.setitem(dw_1.rowcount(),'serie','I')
			elseif id_parque=11 and gs_base<>'U' then
				dw_1.setitem(dw_1.rowcount(),'serie','S')
			elseif id_parque=11 and gs_base='U' then
				dw_1.setitem(dw_1.rowcount(),'serie','O')
			elseif id_parque<>11 and gs_base='U' then
				dw_1.setitem(dw_1.rowcount(),'serie','U')
			end if
			dw_1.object.t_4.text = 'Reserva de Sulpultura: '+gs_sepultura+' del Sector: '+gs_sector
			dw_1.setitem(dw_1.rowcount(),'reserva_sepultura_corre_inventario',0)
			dw_1.setitem(dw_1.rowcount(),'fecha',fecha_reserva)
			dw_1.setitem(dw_1.rowcount(),'sepultura',gs_sepultura)
			if isnull( dw_1.getitemnumber(dw_1.rowcount(),'estado')) then dw_1.setitem(dw_1.rowcount(),'estado',0)
			dw_1.setitem(dw_1.rowcount(),'sector',gs_sector)
			dw_1.setitem(dw_1.rowcount(),'area',gs_area)
			SELECT max("RESERVA_SEPULTURA"."FOLIO_RESERVA")+1 INTO :folio FROM "RESERVA_SEPULTURA"  ;
			if sqlca.sqlcode <> 0 or isnull(folio) then	folio = 1
			dw_1.setitem(dw_1.rowcount(),'folio_reserva',folio)
		elseif dw_1.rowcount() = 0 then
			close(w_solicitud_reserva)
			messagebox('No hay Datos','No existen datos asociados ',information!)
		end if
	else
		dw_1.object.t_4.text = 'Reserva de Sulpultura: '+gs_sepultura+' del Sector: '+gs_sector
		if dw_3.retrieve(gs_sector,gs_sepultura,0,id_parque) > 0 then
			dw_3.object.t_1.text = 'Historial de Reservas por Sepultura'
			this.height = 1252
			cb_1.visible = false
			cb_2.visible = false
			cb_4.visible = false
			cb_5.visible = true
			cb_6.visible = false
			gf_centrar(w_solicitud_reserva)
		else
			close(w_solicitud_reserva)
			messagebox('No hay Datos','No existen datos asociados ',information!)
		end if
	end if
end if
end event

event close;long 		i,folio,correlativo
Double	numero_cont

DELETE FROM "BLOQUEA_RESERVA"  
WHERE 	( "BLOQUEA_RESERVA"."SECTOR"    = :gs_sector )    AND  
      		( "BLOQUEA_RESERVA"."SEPULTURA" = :gs_sepultura ) AND  
      		( "BLOQUEA_RESERVA"."SEPULTURA" = :gs_user );
if sqlca.sqlcode = 0 then
	commit;
else
	rollback;
end if
w_plano_sector_parque.dw_plano_sector_parque.enabled	= true
if isvalid(w_sepul_const_m12) then
	for i = 1 to w_sepul_const_m12.dw_1.rowcount()
		numero_cont 	= w_sepul_const_m12.dw_1.getitemnumber(i,'numero')
		correlativo 		= w_sepul_const_m12.dw_1.getitemnumber(i,'correlativo')
		if numero_cont = 0 then
			SETNULL(folio)
			SELECT	FOLIO_RESERVA,	CORRE_INVENTARIO  
			INTO 		:FOLIO,			:CORRE   
			FROM 	RESERVA_SEPULTURA  
			WHERE  ( SECTOR = :GS_SECTOR ) AND ( SEPULTURA = :GS_SEPULTURA )   ;
			
			SELECT 	FOLIO_RESERVA 
			INTO 		:folio 
			FROM 	RESERVA_SEPULTURA 
			WHERE  ( SECTOR = :gs_sector ) AND ( SEPULTURA = :	gs_sepultura ) AND 
					 ( ESTADO = 1 ) and (COD_PARQUE = :id_parque);
					 
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
	w_sepul_const_m12.dw_1.accepttext ()
end if
setnull(gs_sepultura)
setnull(gi_numero)
setnull(gs_serie)
setnull(gs_base)
end event

type cb_6 from commandbutton within w_solicitud_reserva
integer x = 384
integer y = 952
integer width = 375
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ortografía"
end type

event clicked;dw_1.accepttext ()
if dw_1.getitemstring(1,'observacion') = "" or isnull(dw_1.getitemstring(1,'observacion')) then
	messagebox("AVISO","Debe ingresar palabras")
	dw_1.setfocus()
	return
else
	dw_1.setitem(1,'observacion',f_ortografia(dw_1.getitemstring(1,'observacion')))
end if


end event

type cb_5 from commandbutton within w_solicitud_reserva
integer x = 1861
integer y = 952
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_3.rowcount() > 0 then
	f_Print( dw_3 )
end if
end event

type sle_1 from u_sle_rut within w_solicitud_reserva
integer x = 1774
integer y = 2720
integer taborder = 0
end type

type cb_4 from commandbutton within w_solicitud_reserva
boolean visible = false
integer x = 1088
integer y = 2652
integer width = 498
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Plano"
end type

event clicked;//w_plano_sector_parque.wf_pinta_sector(w_plano_sector_parque.dw_plano_sector_parque)
if w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and &
	w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
	w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_manantial' then 
	w_plano_sector_parque.st_40.triggerevent( clicked!)
end if

end event

type dw_3 from datawindow within w_solicitud_reserva
integer x = 37
integer y = 44
integer width = 2523
integer height = 844
integer taborder = 10
string title = "none"
string dataobject = "dw_log_reserv_sepult_lista"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_solicitud_reserva
integer x = 2208
integer y = 952
integer width = 352
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;long i,folio
Double	numero_cont
w_plano_sector_parque.dw_plano_sector_parque.enabled = true
DELETE FROM "BLOQUEA_RESERVA"  
WHERE ( "BLOQUEA_RESERVA"."SECTOR"    = :gs_sector )    AND  
      ( "BLOQUEA_RESERVA"."SEPULTURA" = :gs_sepultura ) AND  
      ( "BLOQUEA_RESERVA"."SEPULTURA" = :gs_user );
if sqlca.sqlcode = 0 then
	commit;
else
	rollback;
end if
//------------------------------------------------------------------------------------------------------------
if isvalid(w_sepul_const_m12) then
	for i = 1 to w_sepul_const_m12.dw_1.rowcount()
		numero_cont = w_sepul_const_m12.dw_1.getitemnumber(i,'numero')
		if numero_cont = 0 then
			SELECT FOLIO_RESERVA INTO :folio FROM RESERVA_SEPULTURA 
			WHERE ( SECTOR = :gs_sector ) AND ( SEPULTURA = :	gs_sepultura ) AND 
			( ESTADO = 1 ) and ( "CORRE_INVENTARIO" = :i) and (COD_PARQUE =:id_parque);
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
//setnull(gs_sepultura)
//setnull(gi_numero)
//setnull(gs_serie)
//setnull(gs_base)
close(w_solicitud_reserva)
end event

type cb_2 from commandbutton within w_solicitud_reserva
boolean visible = false
integer x = 562
integer y = 2652
integer width = 498
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;integer  ret
long     correlativo,folio,rut,estado,count
string   observacion,cod_age,base,serie
datetime fecha,fecha_log
Double	numero
if dw_1.ModifiedCount() > 0 then
	estado 				= 1//dw_1.getitemnumber(1,'estado')
	if estado <> 2 then
		SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA  ;
		if isnull(correlativo) then correlativo = 1
		dw_1.accepttext ()
		folio         		= dw_1.getitemnumber(1,'folio_reserva')
		rut           		= dw_1.getitemnumber(1,'rut')
		numero        	= dw_1.getitemnumber(1,'numero')
		observacion   	= dw_1.getitemstring(1,'observacion')
		cod_age      	= dw_1.getitemstring(1,'cod_agente')
		base          		= dw_1.getitemstring(1,'base')
		serie         		= dw_1.getitemstring(1,'serie')
		fecha         		= dw_1.getitemdatetime(1,'fecha')
		dw_1.setitem(1,'estado',estado)
		dw_1.setitem(1,'reserva_sepultura_cod_parque',id_parque)
		SELECT 	count("RESERVA_SEPULTURA"."FOLIO_RESERVA")  
		INTO 		:count  
		FROM 	"RESERVA_SEPULTURA"  
		WHERE 	( "RESERVA_SEPULTURA"."BASE" = :base ) AND  
					( "RESERVA_SEPULTURA"."SERIE" = :serie ) AND  
					( "RESERVA_SEPULTURA"."NUMERO" = :numero )  and ( "RESERVA_SEPULTURA"."NUMERO" = 1 or "RESERVA_SEPULTURA"."NUMERO" = 3 ) and ( "RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque );
		if count > 0 then
			messagebox('Doble Reserva','Esta Promesa tiene una Reserva Activa',stopsign!)
			close(w_solicitud_reserva)
			return
		end if
		if not isnull(corre) then
			dw_1.setitem(1,'reserva_sepultura_corre_inventario',corre)
		end if
		select distinct sysdate into :fecha_log from agentes;
//		if MessageBox("Guardar Cambios", '¿ Desea Guardar los cambios ?', Question!, OKCancel!, 2) = 1 then
			ret = dw_1.update()
			if ret = 1 then
				commit;
				INSERT INTO "LOG_RESERVA_SEPULTURA"  
						 	( "CORRELATIVO",	"AREA"  ,		"SECTOR"  ,"SEPULTURA"  ,"BASE",	"SERIE",	"NUMERO",	"FOLIO_RESERVA","RUT",	"OBSERVACION",	"FECHA_RESERVA",	"ESTADO",		"COD_AGENTE",	"FECHA_LOG",	"USUARIO_LOG",	"CORRE_RESERVA",	"COD_PARQUE" )  
				VALUES 	( :correlativo ,		:gs_area,	:gs_sector,	:gs_sepultura,	:base ,	:serie ,	:numero ,	:folio         ,			:rut ,		:observacion ,		:fecha         ,			:estado       ,	:cod_age    ,		:fecha_log ,		:gs_user     ,		0        ,					:id_parque   )  ;
				if sqlca.sqlcode = 0 then
					commit;
					if dw_3.retrieve(gs_sector,gs_sepultura,0,id_parque) > 0 then
						dw_3.object.t_1.text = 'Historial de Reservas por Sepultura'
					end if
					messagebox('Grabación Exitosa','Se ha Guardado Exitosamente Registro. ',information!)
				else
					ROLLBACK;
					messagebox('Error al grabar.','Se ha Detectado un Error al Guardar Registro (Tabla : log_reserva_sepultura) ',information!)
				end if
			else
				ROLLBACK;
				messagebox('Error al grabar.','Se ha Detectado un Error al Guardar el Registro (Tabla : reserva_sepultura) ',information!)
			end if
//		end if
	else
		if MessageBox("Guardar Cambios", '¿ Desea Liberar la Sepultura ?', Question!, OKCancel!, 2) = 1 then
			
		end if
	end if
end if
end event

type cb_1 from commandbutton within w_solicitud_reserva
integer x = 37
integer y = 952
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;long	folio,ret,count_individual
String	ls_sucursal,ls_comuna,ls_parque

if MessageBox('Reserva De Sepultura', 'Al imprimir el formulario quedará Resevada la sepultura.', information!, OKCancel!, 2) = 1 then
	if dw_1.ModifiedCount()	> 0 then
		cb_2.triggerevent( clicked!)
		if not isvalid(w_sepul_const_m12) then	cb_4.triggerevent( clicked!)
		folio 								= dw_1.getitemnumber(1,'folio_reserva')
		if dw_2.retrieve(folio,gs_sector,gs_sepultura,id_parque) > 0 then
			SELECT	"MEMBRETE_EMPRESA"."SUCURSAL",   
						"MEMBRETE_EMPRESA"."COMUNA",   
						"MEMBRETE_EMPRESA"."PARQUE"  
			INTO 		:ls_sucursal,   
						:ls_comuna,   
						:ls_parque 
			FROM 	"MEMBRETE_EMPRESA"  
			WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :id_parque   ;

			dw_2.object.t_6.text 	= Upper(ls_sucursal)
			dw_2.object.t_7.text 	= Upper(ls_comuna)
			dw_2.object.t_10.text	='Aprobación Administrador Parque '+ls_parque
//			elseif id_parque = 11 then
//				dw_2.object.t_6.text		= Upper('Sucursal: Ruta 41 S/N, Sector Aeropuerto, Camino a Vicuña')
//				dw_2.object.t_7.text		= Upper('Fonos: 271 801 - 271 516 Fax: 271 858 La Serena.')
//				dw_2.object.t_10.text	='Aprobación Administrador Parque La Foresta.'
//			elseif id_parque = 102 then
//				dw_2.object.t_6.text 	= Upper('SUCURSAL: LOS AGRICULTORES 60 - FONOS: 743 24 36')
//				dw_2.object.t_7.text 	= Upper('FAX:  - MAIPU.')
//				dw_2.object.t_10.text	='Aprobación Administrador Parque El Manantial.'
//			elseif id_parque = 103 or id_parque = 105 then
//				dw_2.object.t_6.text		= Upper('SUCURSAL: CAMINO LA RINCONADA DEL SALTO 0516 - FONOS: 498 08 00')
//				dw_2.object.t_7.text		= Upper('FAX:  - HUECHURABA.')
//				dw_2.object.t_10.text	='Aprobación Administrador Parque Santiago.'
//			elseif id_parque = 801 then
//				dw_2.object.t_6.text		= Upper('SUCURSAL: AV. COSTANERA N° 2220 - FONOS: 285 1528 - 285 1535')
//				dw_2.object.t_7.text		= Upper('FAX:  - CONCEPCION.')
//				dw_2.object.t_10.text	='Aprobación Administrador Parque Concepción.'
//			end if
			SELECT 	count (1)  
			INTO 		:count_individual  
			FROM 	"INVENTARIO_PLANI_CONST"  
			WHERE  ( "INVENTARIO_PLANI_CONST"."SECTOR" = :gs_sector ) AND  
					 ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :gs_sepultura ) and
					 ( "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :id_parque ) ;
			if sqlca.sqlcode = 0 and count_individual > 0 then
//				dw_2.setitem(1,'inventario_plani_capacidad',1)
			end if 
			f_Print( dw_2 )
			dw_2.print()
//			f_printdlg(dw_2,gstr_print,parent)
			close(w_solicitud_reserva)
		end if
	else
		messagebox('No hay Modificaciones','No se ha hecho Ningún Tipo de Modificaciones',stopsign!)		
	end if
else
end if
end event

type dw_2 from datawindow within w_solicitud_reserva
integer x = 2816
integer y = 768
integer width = 411
integer height = 432
boolean titlebar = true
string title = "none"
string dataobject = "dw_solicitud_reserva_imprime"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type dw_1 from datawindow within w_solicitud_reserva
integer x = 37
integer y = 1128
integer width = 2523
integer height = 1288
integer taborder = 60
string title = "none"
string dataobject = "dw_solicitud_reserva"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string   dv,a_paterno,a_materno,nombre,rut,ls_base,ls_serie,cod,estado_cont,ls_nulo,sep
long     count,ll_capacidad
DATETIME fecha_prom
Double	ll_numero
setnull(sep);Setnull(ls_nulo)
accepttext ()
if dwo.name = 'rut' then
	rut 		= string(long(GetItemNumber(1, "rut")))
	dv 		= sle_1.calcula_dv(rut)
	setitem(1,'dv',dv)
	SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO"  
   INTO 		:nombre,					:a_paterno,					:a_materno  
   FROM 		"CLIENTE" WHERE "CLIENTE"."RUT" = :rut   ;
	if sqlca.sqlcode = 0 then
		if len(nombre) > 30 then nombre = mid(nombre,1,30)
		if len(a_paterno) > 20 then a_paterno = mid(a_paterno,1,20)
		if len(a_materno) > 20 then a_materno = mid(a_materno,1,20)
		setitem(1,'nombre',nombre)
		setitem(1,'a_paterno',a_paterno)
		setitem(1,'a_materno',a_materno)
		accepttext ()
	end if
elseif dwo.name = 'base' then
	ls_base	= GetItemstring(1, "base")
	this.setitem(1,'serie',ls_nulo)
	if not isnull(ls_base) then
		if idw_detalle.retrieve(ls_base) = 0 then
			idw_detalle.reset()
			idw_detalle.insertrow(0)
		end if
	else
		idw_detalle.reset()
		idw_detalle.insertrow(0)
	end if
elseif dwo.name = 'numero' then
	ll_numero	= GetItemNumber(1, "numero")
	ls_base		= GetItemstring(1, "base")
	ls_serie		= GetItemstring(1, "serie")
	if f_pertenece_parque(ls_base,ls_serie,ll_numero,id_parque) = false then
		messagebox('Otro Parque','Esta Promesa pertenece a otro Parque.',stopsign!)
	end if
	if ls_base = 'O' or ls_base='U' then
		SELECT 	"PAGO_OFERTA"."SEPULTURA"  
		INTO 		:sep  
		FROM 	"PAGO_OFERTA","OFERTA_V"  
		WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
				 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
				 (("PAGO_OFERTA"."SERIE" = :ls_serie ) AND  
				 ( "PAGO_OFERTA"."NRO_OFERTA" = :ll_numero ) )   ;
		if sqlca.sqlcode = 0 and sep <> '0' and not isnull(sep) then
			messagebox('Esta Asignada','Esta Promesa tiene una Asignación a Sepultura.',stopsign!)
			close(w_solicitud_reserva)
			return
		end if
	elseif ls_base = 'C' then
		SELECT	"CONTRATO"."SEPULTURA"  
		INTO 		:sep  
		FROM 	"CONTRATO"  
		WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
				 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   ;
		if sqlca.sqlcode = 0 and sep <> '0' and not isnull(sep) then
			messagebox('Esta Asignado','Este Contrato tiene una Asignación a Sepultura.',stopsign!)
			close(w_solicitud_reserva)
			return
		end if
	end if
	SELECT 	count("RESERVA_SEPULTURA"."FOLIO_RESERVA")  
	INTO 		:count  
	FROM 	"RESERVA_SEPULTURA"  
	WHERE  ( "RESERVA_SEPULTURA"."BASE" = :ls_base ) AND  
			 ( "RESERVA_SEPULTURA"."SERIE" = :ls_serie ) AND  
			 ( "RESERVA_SEPULTURA"."NUMERO" = :ll_numero ) AND 
			 ( "RESERVA_SEPULTURA"."ESTADO" = 1 )  ;
	if count > 0 then
		messagebox('Doble Reserva','Esta Promesa tiene una Reserva Activa',stopsign!)
		close(w_solicitud_reserva)
		return
	end if
	SELECT NUMERO,	ESTADO INTO :ll_numero,:estado_cont FROM CADENA WHERE ( CODIGO = :ls_base ) AND ( SERIE = :ls_serie ) AND ( NUMERO = :ll_numero )   ;
	if sqlca.sqlcode <> 0 then
		if ll_numero < 1 then
			messagebox('Contrato no Ingresado','El número del Contrato no puede ser menor a 1.',stopsign!)
			this.setitem(1,'numero',0)
			this.accepttext ()
			this.setfocus()
			this.setcolumn('numero')

		elseif ll_numero > 15000000 then
			messagebox('Contrato no Ingresado','El número del Contrato no puede exceder de 15.000.000.',stopsign!)
			this.setitem(1,'numero',0)
			this.setfocus()
			this.setcolumn('numero')
			this.accepttext ()
		end if
	else
		SELECT COD_AGE,FECHA INTO :cod,:fecha_prom FROM OFERTA_V WHERE ( SERIE = :ls_serie ) AND ( NRO_OFERTA = :ll_numero );
		if sqlca.sqlcode = 0 then
			this.setitem(1,'cod_agente',cod)
			this.setitem(1,'estado_cont',estado_cont)
			this.setitem(1,'reserva_sepultura_fecha_promesa',fecha_prom)
		end if
	end if
elseif dwo.name = 'reserva_sepultura_capacidad' then
	ll_capacidad	= this.getitemnumber(1,'reserva_sepultura_capacidad')
	if isnull(ll_capacidad) or ll_capacidad = 0 or ll_capacidad > 12 then
		messagebox("Advertencia","Capacidad Inválida")
		this.setitem(1,'reserva_sepultura_capacidad',0)
		this.setfocus()
		this.setcolumn('reserva_sepultura_capacidad')
		this.accepttext ()
	end if
end if
end event

