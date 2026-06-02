forward
global type w_listado_reservas from window
end type
type cb_marcar_todo from commandbutton within w_listado_reservas
end type
type cb_7 from commandbutton within w_listado_reservas
end type
type cb_6 from commandbutton within w_listado_reservas
end type
type cb_5 from commandbutton within w_listado_reservas
end type
type cb_4 from commandbutton within w_listado_reservas
end type
type cb_3 from commandbutton within w_listado_reservas
end type
type cb_2 from commandbutton within w_listado_reservas
end type
type cb_1 from commandbutton within w_listado_reservas
end type
type dw_1 from datawindow within w_listado_reservas
end type
type gb_1 from groupbox within w_listado_reservas
end type
end forward

global type w_listado_reservas from window
integer width = 3273
integer height = 1924
boolean titlebar = true
string title = "Listado de Reservas por Asignar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_marcar_todo cb_marcar_todo
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_listado_reservas w_listado_reservas

type variables
integer id_parque
end variables

forward prototypes
public function integer f_sector_cap_movil (integer parque, string sector)
end prototypes

public function integer f_sector_cap_movil (integer parque, string sector);integer 	count_cap
SELECT 	count(1)
into 		:count_cap
FROM 	"SECTOR_CAP_MOVIL"  
WHERE 	( "SECTOR_CAP_MOVIL"."PARQUE" = :parque ) AND  
			( "SECTOR_CAP_MOVIL"."SECTOR" = :sector ) ;
if sqlca.sqlcode = 0 and count_cap > 0 then
	return 1
else
	return 0
end if
	
end function

on w_listado_reservas.create
this.cb_marcar_todo=create cb_marcar_todo
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_marcar_todo,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_listado_reservas.destroy
destroy(this.cb_marcar_todo)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;Long		count_const,ll_tot_reg,ll_indi
gs_ventana = 'w_listado_reservas'
f_valida_objeto()

id_parque = integer(w_plano_sector_parque.st_parque.text)
SELECT 	count(1)  into :count_const
FROM 	"INVENTARIO_PLANI_CONST"  
WHERE 	("INVENTARIO_PLANI_CONST"."SECTOR" =: gs_sector) and ("INVENTARIO_PLANI_CONST"."COD_PARQUE" =: id_parque);
if count_const > 0 then
	cb_6.enabled = true
else
	cb_6.enabled = false
end if

gf_centrar(w_listado_reservas)
dw_1.settransobject(sqlca)
if dw_1.retrieve(gs_sector,id_parque) > 0 then
	ll_tot_reg		= dw_1.rowcount()
	for ll_indi=1 to ll_tot_reg
		dw_1.setitem(ll_indi,'estado_1',1)
	next
	dw_1.accepttext()
	dw_1.setfilter('estado=1 AND ( inventario_plani_const_numero =0 OR ISNULL( inventario_plani_const_numero ))')
	dw_1.filter()
else
//	messagebox('No existen registros','No hay Reservas de Sepulturas para el Sector '+gs_sector+'.',information!)
//	close(w_listado_reservas)
end if
end event

event close;w_plano_sector_parque.dw_plano_sector_parque.enabled = true
end event

type cb_marcar_todo from commandbutton within w_listado_reservas
integer x = 2258
integer y = 1668
integer width = 421
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Marcar Todo"
end type

event clicked;Long		ll_tot_reg,ll_indi

ll_tot_reg		= dw_1.rowcount()
if cb_marcar_todo.text = 'Marcar Todo' then
	for ll_indi=1 to ll_tot_reg
		dw_1.setitem(ll_indi,'estado_1',0)
	next
	cb_marcar_todo.text = 'Desmarcar Todo'
elseif cb_marcar_todo.text = 'Desmarcar Todo' then
	for ll_indi=1 to ll_tot_reg
		dw_1.setitem(ll_indi,'estado_1',1)
	next
	cb_marcar_todo.text = 'Marcar Todo'
end if
dw_1.accepttext()
end event

type cb_7 from commandbutton within w_listado_reservas
integer x = 1934
integer y = 1680
integer width = 270
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Simples"
end type

event clicked;Long		ll_tot_reg,ll_indi

dw_1.dataobject ='dw_listado_reservas_11'
dw_1.settransobject(sqlca)

if dw_1.retrieve(gs_sector,id_parque) > 0 then
	ll_tot_reg		= dw_1.rowcount()
	for ll_indi=1 to ll_tot_reg
		dw_1.setitem(ll_indi,'estado_1',1)
	next
	dw_1.accepttext()
	dw_1.setfilter('estado=1 AND ( inventario_plani_numero =0 OR ISNULL( inventario_plani_numero ))')
	dw_1.filter()
else
	messagebox('No existen registros','No hay Reservas de Sepulturas para el Sector '+gs_sector+'.',information!)

end if
end event

type cb_6 from commandbutton within w_listado_reservas
integer x = 1627
integer y = 1680
integer width = 297
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Individual"
end type

event clicked;Long		ll_tot_reg,ll_indi

dw_1.dataobject 	= 'dw_listado_reservas'
dw_1.settransobject(sqlca)

if dw_1.retrieve(gs_sector,id_parque) > 0 then
	ll_tot_reg		= dw_1.rowcount()
	for ll_indi=1 to ll_tot_reg
		dw_1.setitem(ll_indi,'estado_1',1)
	next
	dw_1.accepttext()
	dw_1.setfilter('estado=1 AND ( inventario_plani_const_numero =0 OR ISNULL( inventario_plani_const_numero ))')
	dw_1.filter()
else
	messagebox('No existen registros','No hay Reservas de Sepulturas para el Sector '+gs_sector+'.',information!)

end if
end event

type cb_5 from commandbutton within w_listado_reservas
integer x = 1152
integer y = 1668
integer width = 425
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Obs. Reserva"
end type

event clicked;open(w_cambia_obs_reserva)
if Message.StringParm = '1' then
	w_listado_reservas.triggerevent (open!)
end if
end event

type cb_4 from commandbutton within w_listado_reservas
integer x = 690
integer y = 1668
integer width = 457
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Liberar Reserva"
end type

event clicked;integer  	i,estado,si_no,count_reg,ret,capacidad
long    	folio,correlativo,rut
string   	sector,sepultura,base,serie,area,nro_tecnico,observacion,cod_age,sepultura_nd,n_sep,sector_sep
datetime	fecha,fecha_log,fecha_sys
Double	numero

//------------------- Liberar Reserva-------------------
if dw_1.rowcount() > 0 then
	if MessageBox("Guardar Cambios", '¿ Desea Liberar la Reserva ?', Question!, OKCancel!, 2) = 1 then
		for i = 1 to dw_1.rowcount()
			si_no     			= dw_1.getitemnumber(i,'estado_1')
			if si_no = 0 then
				folio       		= dw_1.getitemnumber(i,'folio_reserva')
				estado      	= dw_1.getitemnumber(i,'estado')
				area        	= dw_1.getitemstring(i,'area')
				sector     	= dw_1.getitemstring(i,'sector')
				sepultura   	= dw_1.getitemstring(i,'sepultura')
				base        	= dw_1.getitemstring(i,'base')
				serie       	= dw_1.getitemstring(i,'serie')
				numero      	= dw_1.getitemnumber(i,'numero')
				rut         		= dw_1.getitemnumber(i,'rut')
				observacion = dw_1.getitemstring(i,'observacion')
				fecha       	= dw_1.getitemdatetime(i,'fecha')
				cod_age     	= dw_1.getitemstring(i,'cod_agente')
				fecha_log   	= dw_1.getitemdatetime(i,'fecha')
				commit using sqlca;
				DELETE FROM   "BLOQUEA_RESERVA"  
				WHERE 		( "BLOQUEA_RESERVA"."SECTOR" = :sector ) AND  
								( "BLOQUEA_RESERVA"."SEPULTURA" = :sepultura )   
				USING			  sqlca;
				if sqlca.sqlcode = 0 then
					commit using sqlca;
				else
					rollback using sqlca;
				end if
				DELETE FROM   "RESERVA_SEPULTURA"  
				WHERE 		( "RESERVA_SEPULTURA"."FOLIO_RESERVA" = :folio ) AND  
								( "RESERVA_SEPULTURA"."SERIE" = :serie ) AND 
								( "RESERVA_SEPULTURA"."NUMERO" = :numero ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque ) ;
				if sqlca.sqlcode = 0 then
					commit using sqlca;
					SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
					if isnull(correlativo) then correlativo = correlativo + 1
					INSERT INTO "LOG_RESERVA_SEPULTURA"  
							 	( "CORRELATIVO",	"AREA",	"SECTOR",	"SEPULTURA",	"BASE",	"SERIE",	"NUMERO",	"FOLIO_RESERVA",	"RUT",	"OBSERVACION",	"FECHA_RESERVA","ESTADO","COD_AGENTE","FECHA_LOG","USUARIO_LOG" ,"COD_PARQUE")  
					VALUES 	( :correlativo ,		:area ,	:sector ,		:sepultura ,		:base ,	:serie ,	:numero ,	:folio         ,				:rut ,		:observacion ,		:fecha         ,2       ,:cod_age    ,:fecha_log ,:gs_user      ,:id_parque  )  using sqlca;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
					else
						ROLLBACK using sqlca;
						MessageBox("Error", "Favor dar aviso al Depto. de Informatica (01)",stopsign! )
					end if
				else
					ROLLBACK using sqlca;
					MessageBox("Error", "Favor dar aviso al Depto. de Informatica (07)",stopsign! )
				end if
			end if
		next
		if dw_1.retrieve(gs_sector,id_parque) > 0 then
			dw_1.setfilter('estado=1')
			dw_1.filter()
		else
			messagebox('No existen registros','No hay Reservas de Sepulturas para el Sector '+gs_sector+'.',information!)
		end if
		w_plano_sector_parque.st_40.triggerevent( clicked!)
	end if
end if
end event

type cb_3 from commandbutton within w_listado_reservas
integer x = 73
integer y = 1668
integer width = 334
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if	
end event

type cb_2 from commandbutton within w_listado_reservas
integer x = 2866
integer y = 1668
integer width = 347
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;w_plano_sector_parque.dw_plano_sector_parque.enabled = true
close(w_listado_reservas)
end event

type cb_1 from commandbutton within w_listado_reservas
integer x = 411
integer y = 1668
integer width = 274
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asignar"
end type

event clicked;integer  	i,estado,si_no,count_reg,ret,capacidad,count_sector
long     	folio,correlativo,rut,corr_const,ll_cap_res,ll_cap_ctto,ll_res
string   	sector,sepultura,base,serie, area,nro_tecnico,observacion,cod_age,sepultura_nd,n_sep,sector_sep
datetime	fecha,fecha_log,fecha_sys
Double	numero
//------------------- Asignar Reserva a Sepultura-------------------//
if dw_1.rowcount() > 0 then
	if MessageBox("Guardar Cambios", '¿ Desea Actualizar las Sepulturas ?', Question!, OKCancel!, 2) = 1 then
		for i = 1 to dw_1.rowcount()
			NextStep:
			si_no     				= dw_1.getitemnumber(i,'estado_1')
			if si_no = 0 then
				folio       			= dw_1.getitemnumber(i,'folio_reserva')
				estado      		= dw_1.getitemnumber(i,'estado')
				area        		= dw_1.getitemstring(i,'area')
				sector      		= dw_1.getitemstring(i,'sector')
				sepultura   		= dw_1.getitemstring(i,'sepultura')
				base        		= dw_1.getitemstring(i,'base')
				serie       		= dw_1.getitemstring(i,'serie')
				numero     		= dw_1.getitemnumber(i,'numero')
				rut         			= dw_1.getitemnumber(i,'rut')
				observacion 	= dw_1.getitemstring(i,'observacion')
				fecha       		= dw_1.getitemdatetime(i,'fecha')
				cod_age     		= dw_1.getitemstring(i,'cod_agente')
				fecha_log   		= dw_1.getitemdatetime(i,'fecha')
				ll_cap_res		= dw_1.getitemnumber(i,'reserva_sepultura_capacidad')
				
				SELECT sysdate 	INTO :gdt_fec_sistema 	FROM "TASA"  	WHERE "TASA"."LOOK" = 1   ;
				fecha_log		= gdt_fec_sistema
				fecha_sys		= gdt_fec_sistema
				setnull(corr_const)
				if dw_1.dataobject ='dw_listado_reservas' then
					corr_const  	= dw_1.getitemnumber(i,'inventario_plani_const_correlativo')
				end if
				if f_pertenece_parque(base,serie,numero,id_parque) = false then
					messagebox('Otro Parque','Esta Promesa pertenece a otro Parque ( '+base+serie+'-'+string(numero)+' )',stopsign!)
					return
				end if
				SELECT	"INVENTARIO_PLANI"."SEPULTURA",	"INVENTARIO_PLANI"."SECTOR"  
				INTO 		:n_sep,									:sector_sep 
				FROM 	"INVENTARIO_PLANI"  
				WHERE  ( "INVENTARIO_PLANI"."BASE"   = :base ) AND  
						 ( "INVENTARIO_PLANI"."SERIE"  = :serie ) AND  
						 ( "INVENTARIO_PLANI"."NUMERO" = :numero ) and
						 ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) using sqlca ;
				if sqlca.sqlcode = 0 then
					MessageBox("Contrato Asignado", ' El Contrato '+base+'-'+serie+'-'+string(numero,'###,###,###')+ ' esta asignado en el Sector: '+sector_sep+' y Sepultura: '+n_sep,Question!)
					i ++
					Goto NextStep
				end if
				
				SELECT CAPACIDAD,	NUMERO_TEC INTO :capacidad,:nro_tecnico FROM INVENTARIO_PLANI WHERE ( SECTOR = :sector ) AND ( SEPULTURA = :sepultura ) AND ( COD_PARQUE = :id_parque ) using sqlca ;
				//--------------------------------verificar--------------------------------
				select count(*) into :count_reg from PAGO_OFERTA WHERE ( SERIE = :serie ) AND ( NRO_OFERTA = :numero ) using sqlca;
				if count_reg > 0 then
					SELECT	"PAGO_OFERTA"."CAPACIDAD"  
					INTO		:ll_cap_ctto  
					FROM 	"OFERTA_V",	"PAGO_OFERTA"  
					WHERE  	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							 	( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							 	( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
							 	(("OFERTA_V"."SERIE" = :serie ) AND  
							 	( "OFERTA_V"."NRO_OFERTA" = :numero ) )   ;
							 
					ll_res	= 1
					if ll_cap_ctto=0 or isnull(ll_cap_ctto) then
						messagebox("Advertencia","Verificar Información Capacidad en 0")
					else
						if capacidad <> ll_cap_res or capacidad <> ll_cap_ctto then
							ll_res	= messagebox("Advertencia","Capacidad de Reserva es Distinta a Capacidad del Contrato o Sepultura, desea Actualizar",Exclamation!,YesNo!,2)
						end if
						if ll_res=1 then
							capacidad	= ll_cap_ctto
							if f_sector_cap_movil(id_parque, sector) = 0 then
								UPDATE 	"PAGO_OFERTA"  
								SET 		"CAPACIDAD"   = :capacidad,   
											"AREA"        = :area,   
											"SECTOR"      = :sector,   
											"SEPULTURA"   = :sepultura,   
											"NRO_TECNICO" = :nro_tecnico  
								WHERE  	( "PAGO_OFERTA"."SERIE"      = :serie ) AND  
										 	( "PAGO_OFERTA"."NRO_OFERTA" = :numero ) using sqlca;
							else
								UPDATE 	"PAGO_OFERTA"  
								SET 		"AREA"        = :area,   
											"SECTOR"      = :sector,   
											"SEPULTURA"   = :sepultura,   
											"NRO_TECNICO" = :nro_tecnico  
								WHERE  ( "PAGO_OFERTA"."SERIE"      = :serie ) AND  
										 ( "PAGO_OFERTA"."NRO_OFERTA" = :numero ) using sqlca;
							end if
							if sqlca.sqlcode = 0 then
								commit using sqlca;
								UPDATE 	"RESERVA_SEPULTURA"  
								SET 		"ESTADO" = 3  
								WHERE  ( "RESERVA_SEPULTURA"."FOLIO_RESERVA" = :FOLIO ) AND  
										 ( "RESERVA_SEPULTURA"."SECTOR"        = :SECTOR ) AND  
										 ( "RESERVA_SEPULTURA"."SEPULTURA"     = :sepultura ) and
										 ( "RESERVA_SEPULTURA"."COD_PARQUE"    = :id_parque ) using sqlca;
								if sqlca.sqlcode = 0 then
									commit using sqlca;
									SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
									if isnull(correlativo) then correlativo = correlativo + 1
									INSERT INTO   "LOG_RESERVA_SEPULTURA"  
													( "CORRELATIVO","AREA",	"SECTOR",	"SEPULTURA",	"BASE",	"SERIE",	"NUMERO",	"FOLIO_RESERVA","RUT",	"OBSERVACION",	"FECHA_RESERVA",	"ESTADO",	"COD_AGENTE",	"FECHA_LOG",	"USUARIO_LOG",	"COD_PARQUE" )  
									VALUES 		( :correlativo ,		:area ,	:sector ,		:sepultura ,		:base ,	:serie ,	:numero ,	:folio         ,			:rut ,		:observacion ,		:fecha         ,			3       ,		:cod_age    ,		:fecha_log ,		:gs_user     ,		:id_parque   )  
									using sqlca;
									if sqlca.sqlcode = 0 then
										commit using sqlca;
										if isnull(corr_const) then
											UPDATE	"INVENTARIO_PLANI"  
											SET 		"BASE" = :base,   
														"SERIE" = :serie,   
														"NUMERO" = :numero,   
														"RUT" = :rut,   
														"OBSERVACIONES" = :observacion,   
														"LOG_USUARIO" = :gs_user,   
														"FOLIO_ASIGNACION" = :folio,
														"CAPACIDAD" = :capacidad
											WHERE  ( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura ) and ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) using sqlca ;
											if sqlca.sqlcode = 0 then
												commit using sqlca;
											else
												ROLLBACK using sqlca;
												MessageBox("Error", "Favor dar aviso al Depto. de Informatica (06)",stopsign! )
											end if
										else//if count_sector > 0 then
											UPDATE  "INVENTARIO_PLANI_CONST"  
											SET 	  "BASE" = :base,   
													  "SERIE" = :serie,   
													  "NUMERO" = :numero,   
													  "RUT" = :rut,   
													  "OBSERVACIONES" = :observacion,   
													  "LOG_USUARIO" = :gs_user,   
													  "FOLIO_ASIGNACION" = :folio  
											WHERE ( "INVENTARIO_PLANI_CONST"."SECTOR"      = :sector ) AND 
													( "INVENTARIO_PLANI_CONST"."SEPULTURA"   = :sepultura ) AND 
													( "INVENTARIO_PLANI_CONST"."CORRELATIVO" = :corr_const ) and 
													( "INVENTARIO_PLANI_CONST"."COD_PARQUE"  = :id_parque ) using sqlca ;
											if sqlca.sqlcode = 0 then
												commit using sqlca;
											else
												ROLLBACK using sqlca;
												MessageBox("Error", "Favor dar aviso al Depto. de Informatica (06)",stopsign! )
											end if
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
						end if
					end if
				else
					SELECT count(SERIE_C) INTO :count_reg FROM CONTRATO WHERE SERIE_C = :serie AND NRO_CONTRATO = :numero ;
					if count_reg > 0 then
						SELECT	"CONTRATO"."CAPACIDAD"  
						INTO 		:ll_cap_ctto  
						FROM 		"CONTRATO"  
						WHERE  ( "CONTRATO"."SERIE_C" = :serie ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :numero )   ;
								 
						ll_res	= 1
						if ll_cap_ctto=0 or isnull(ll_cap_ctto) then
							messagebox("Advertencia","Verificar Información Capacidad en 0")
						else
							if capacidad <> ll_cap_res or capacidad <> ll_cap_ctto then
								ll_res	= messagebox("Advertencia","Capacidad de Reserva es Distinta a Capacidad del Contrato o Sepultura, desea Actualizar",Exclamation!,YesNo!,2)
							end if
							if ll_res=1 then
								capacidad	= ll_cap_ctto
	
								if f_sector_cap_movil(id_parque, sector) = 0 then
									UPDATE	"CONTRATO"  
										SET 	"SECTOR" = :sector,   
												"SEPULTURA"  = :sepultura,   
												"ZONA"       = :area, 
												"CAPACIDAD"  = :capacidad
									WHERE  ( "CONTRATO"."SERIE_C" = :serie ) AND  
											 ( "CONTRATO"."NRO_CONTRATO"  = :numero )  using sqlca ;
											 
											 
								//"NRO_TEC"    = :nro_tecnico  
								else
									UPDATE	"CONTRATO"  
									SET 		"SECTOR" = :sector,   
												"SEPULTURA"  = :sepultura,   
												"ZONA"       = :area 
									WHERE  ( "CONTRATO"."SERIE_C" = :serie ) AND  
											 ( "CONTRATO"."NRO_CONTRATO"  = :numero )  using sqlca ;
											 
								//"NRO_TEC"    = :nro_tecnico 
								end if
								if sqlca.sqlcode = 0 then
									commit using sqlca;
									UPDATE 	"RESERVA_SEPULTURA"  
									SET 		"ESTADO" = 3  
									WHERE  ( "RESERVA_SEPULTURA"."FOLIO_RESERVA" = :FOLIO ) AND  
											 ( "RESERVA_SEPULTURA"."SECTOR"        = :SECTOR ) AND  
											 ( "RESERVA_SEPULTURA"."SEPULTURA"     = :sepultura ) and
											 ( "RESERVA_SEPULTURA"."COD_PARQUE"    = :id_parque ) using sqlca ;
									if sqlca.sqlcode = 0 then
										commit using sqlca;
										SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
										INSERT INTO "LOG_RESERVA_SEPULTURA"  
												 	( "CORRELATIVO",		"AREA",	"SECTOR",	"SEPULTURA",	"BASE",	"SERIE",	"NUMERO",	"FOLIO_RESERVA",	"RUT",	"OBSERVACION",	"FECHA_RESERVA",	"ESTADO",	"COD_AGENTE",	"FECHA_LOG",	"USUARIO_LOG",	"COD_PARQUE"  )  
										VALUES 	( :correlativo ,			:area ,	:sector ,		:sepultura ,		:base ,	:serie ,	:numero ,	:folio         ,				:rut ,		:observacion ,		:fecha         ,			3       ,		:cod_age    ,		:fecha_log ,		:gs_user     ,		:id_parque )  
										using sqlca;
										if sqlca.sqlcode = 0 then
											commit using sqlca;
		//									SELECT DISTINCT COUNT(1) INTO :count_sector FROM "INVENTARIO_PLANI_CONST" WHERE "INVENTARIO_PLANI_CONST"."SECTOR" = :sector ;
		//									if count_sector = 0  then
											if isnull(corr_const) then
												UPDATE "INVENTARIO_PLANI"  
												SET "BASE" = :base,   
													 "SERIE" = :serie,   
													 "NUMERO" = :numero,   
													 "RUT" = :rut,   
													 "OBSERVACIONES" = :observacion,   
													 "LOG_USUARIO" = :gs_user,   
													 "FOLIO_ASIGNACION" = :folio,
													 "CAPACIDAD" = :capacidad
												WHERE ( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura )  AND ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque )using sqlca ;
												if sqlca.sqlcode = 0 then
													commit using sqlca;
												else
													ROLLBACK using sqlca;
													MessageBox("Error", "Favor dar aviso al Depto. de Informatica (06)",stopsign! )
												end if
											else//if count_sector > 0  then
												UPDATE "INVENTARIO_PLANI_CONST"  
												SET "BASE" = :base,   
													 "SERIE" = :serie,   
													 "NUMERO" = :numero,   
													 "RUT" = :rut,   
													 "OBSERVACIONES" = :observacion,   
													 "LOG_USUARIO" = :gs_user,   
													 "FOLIO_ASIGNACION" = :folio  
												WHERE ( "INVENTARIO_PLANI_CONST"."SECTOR"      = :sector ) AND 
														( "INVENTARIO_PLANI_CONST"."SEPULTURA"   = :sepultura ) AND 
														( "INVENTARIO_PLANI_CONST"."CORRELATIVO" = :corr_const ) and 
														( "INVENTARIO_PLANI_CONST"."COD_PARQUE"  = :id_parque )using sqlca ;
												if sqlca.sqlcode = 0 then
													commit using sqlca;
												else
													ROLLBACK using sqlca;
													MessageBox("Error", "Favor dar aviso al Depto. de Informatica (06)",stopsign! )
												end if
											end if
										else
											ROLLBACK using sqlca;
											MessageBox("Error", "Favor dar aviso al Depto. de Informatica (05)",stopsign! )
										end if
									else
										ROLLBACK using sqlca;
										MessageBox("Error", "Favor dar aviso al Depto. de Informatica (02)",stopsign! )
									end if
								else
									ROLLBACK using sqlca;
									MessageBox("Error", "Favor dar aviso al Depto. de Informatica (03)",stopsign! )
								end if
							end if
						end if
					else
						MessageBox("Error", "(08) La promesa "+base+' - '+serie+' - '+string(numero,'###,###,###')+' No Existe.',stopsign! )
					end if
				end if
	//-----------------------------------------------------------------
			end if
		next
		if dw_1.retrieve(gs_sector,id_parque) > 0 then
			dw_1.setfilter('estado=1')
			dw_1.filter()
		else
			messagebox('No existen registros','No hay Reservas de Sepulturas para el Sector '+gs_sector+'.',information!)
		end if
		w_plano_sector_parque.st_40.triggerevent( clicked!)
	end if
end if
end event

type dw_1 from datawindow within w_listado_reservas
integer x = 73
integer y = 56
integer width = 3141
integer height = 1548
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_reservas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow() > 0 then
	accepttext ()
	gs_base	    		= This.GetItemString(getrow(), "base")
	gs_serie     		= This.GetItemString(getrow(), "serie")
	gi_numero    	= This.GetItemNumber(getrow(), "numero")
	gs_sector    		= This.GetItemstring(getrow(), "sector")
	gs_sepultura 	= This.GetItemstring(getrow(), "sepultura")
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event clicked;if row > 0 then
	accepttext ()
	gs_base	    		= This.GetItemString(row, "base")
	gs_serie     		= This.GetItemString(row, "serie")
	gi_numero    	= This.GetItemNumber(row, "numero")
	gs_sector    		= This.GetItemstring(row, "sector")
	gs_sepultura 	= This.GetItemstring(row, "sepultura")
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;integer count

SELECT  	count(*) INTO :count  
FROM    	"CADENA"  
WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND 
			( "CADENA"."SERIE"  = :gs_serie ) AND 
			( "CADENA"."NUMERO" = :gi_numero )   ;

if sqlca.sqlcode = 0 and count > 0 then
	CHOOSE CASE gs_base
		CASE "O","U"	 // Oferta/columbario
			Open(w_datos_contrato_oferta)
		CASE "C" // Contrato ISA	
			Open(w_datos_contrato_isa)
	END CHOOSE
else
	messagebox('No existe','Este Contrato no exsite.',stopsign!)
end if

end event

type gb_1 from groupbox within w_listado_reservas
integer x = 1600
integer y = 1608
integer width = 631
integer height = 192
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ver Reservas"
end type

