forward
global type w_asignacion_general from window
end type
type st_1 from statictext within w_asignacion_general
end type
type pb_7 from picturebutton within w_asignacion_general
end type
type pb_6 from picturebutton within w_asignacion_general
end type
type pb_5 from picturebutton within w_asignacion_general
end type
type pb_4 from picturebutton within w_asignacion_general
end type
type pb_3 from picturebutton within w_asignacion_general
end type
type pb_2 from picturebutton within w_asignacion_general
end type
type pb_1 from picturebutton within w_asignacion_general
end type
type dw_1 from datawindow within w_asignacion_general
end type
type gb_1 from groupbox within w_asignacion_general
end type
type dw_2 from datawindow within w_asignacion_general
end type
type gb_2 from groupbox within w_asignacion_general
end type
end forward

global type w_asignacion_general from window
integer width = 2971
integer height = 2432
boolean titlebar = true
string title = "Administración Gral. de la Planimetria sin Reserva Previa (Adm. Sistema.)."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_1 st_1
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
gb_1 gb_1
dw_2 dw_2
gb_2 gb_2
end type
global w_asignacion_general w_asignacion_general

type variables
integer ll_filas,ll_filas2
integer id_parque
end variables

forward prototypes
public function integer f_sector_cap_movil (integer parque, string sector)
end prototypes

public function integer f_sector_cap_movil (integer parque, string sector);integer count_cap
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

on w_asignacion_general.create
this.st_1=create st_1
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.dw_2=create dw_2
this.gb_2=create gb_2
this.Control[]={this.st_1,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_1,&
this.gb_1,&
this.dw_2,&
this.gb_2}
end on

on w_asignacion_general.destroy
destroy(this.st_1)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.dw_2)
destroy(this.gb_2)
end on

event open;gf_centrar(w_asignacion_general)
f_valida_objeto()
w_plano_sector_parque.dw_plano_sector_parque.enabled = false
id_parque = w_plano_sector_parque.id_parque
end event

event mousemove;st_1.visible = false
end event

type st_1 from statictext within w_asignacion_general
integer x = 2272
integer y = 2204
integer width = 347
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30867188
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type pb_7 from picturebutton within w_asignacion_general
event mousemove pbm_mousemove
integer x = 2697
integer y = 2168
integer width = 165
integer height = 144
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event mousemove;st_1.text 		= 'Cerrar'
st_1.visible 	= true
st_1.x 		= 2272
st_1.y 		= 2032
st_1.width 	= 347
end event

event clicked;st_1.visible = false
w_plano_sector_parque.dw_plano_sector_parque.enabled = true
close(w_asignacion_general)
end event

type pb_6 from picturebutton within w_asignacion_general
event mousemove pbm_mousemove
integer x = 270
integer y = 1884
integer width = 165
integer height = 144
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "delete.bmp"
alignment htextalign = left!
end type

event mousemove;st_1.text = 'Borrar'
st_1.visible = true
st_1.x = 370
st_1.y = 1712
st_1.width = 347
end event

event clicked;integer i,j

st_1.visible = false
dw_2.deleterow(ll_filas2)
if dw_2.rowcount() > 0 then
	for i = 1 to dw_2.rowcount()
		if dw_2.getitemstring(i,'observacion') = '¡ Error, No existe !' then j ++
		if j = 0 then
			pb_4.enabled = true
		elseif j > 0 then
			pb_4.enabled = false
		end if
	next
else
	pb_4.enabled = true
end if
end event

type pb_5 from picturebutton within w_asignacion_general
event mousemove pbm_mousemove
integer x = 59
integer y = 1884
integer width = 165
integer height = 144
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Insertar_on.bmp"
alignment htextalign = left!
end type

event mousemove;st_1.text = 'Insertar'
st_1.visible = true
st_1.x = 137
st_1.y = 1712
st_1.width = 347
end event

event clicked;Long		i,j,ll_new

st_1.visible 	= false
ll_new		= dw_2.insertrow(0)
dw_2.scrolltorow(ll_new)
dw_2.setfocus()
dw_2.setcolumn('base')
for i = 1 to dw_2.rowcount()
	if dw_2.getitemstring(i,'observacion') = '¡ Error, No existe !' then j ++
	if j = 0 then
		pb_4.enabled = true
	elseif j > 0 then
		pb_4.enabled = false
	end if
next
end event

type pb_4 from picturebutton within w_asignacion_general
event mousemove pbm_mousemove
integer x = 2693
integer y = 1884
integer width = 165
integer height = 144
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar.bmp"
string disabledname = "grabar_no.bmp"
alignment htextalign = left!
end type

event mousemove;st_1.text 			= 'Guardar Cambios'
st_1.visible 		= true
st_1.x 			= 2272
st_1.y 			= 1712
st_1.width 		= 560
end event

event clicked;integer  	estado,count_reg,ret,capacidad,i
long     	folio,correlativo,rut,ll_tot_reg
string   	sector,sepultura,base,serie,area,nro_tecnico,observacion,	cod_age,sepultura_nd,n_sep,sector_sep
datetime	fecha,fecha_log
Double	numero
st_1.visible 				= false
ll_tot_reg				= dw_2.rowcount()
if ll_tot_reg > 0 then
	if MessageBox("Guardar Cambios", '¿ Esta seguro que desea Liberar la Sepultura ?', Question!, OKCancel!, 2) = 1 then
		SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK"=1;
		for i = 1 to ll_tot_reg
			dw_1.accepttext ()
			sector      	= dw_2.getitemstring(i,'sector')
			sepultura   	= dw_2.getitemstring(i,'sepultura')
			base       	= dw_2.getitemstring(i,'base')
			serie       	= dw_2.getitemstring(i,'serie')
			numero      	= dw_2.getitemnumber(i,'numero')
			rut         		= dw_2.getitemnumber(i,'rut')
			observacion = dw_2.getitemstring(i,'observacion')
			if numero > 0 or (not isnull(numero)) then 
				if len(observacion) = 0 then
					messagebox('Observación','Debe llenar la observación con 50 caracteres como máximo.',information!)
					dw_1.setfocus()
					return
				end if
				//--------------------------------verificar--------------------------------
				select count(*) into :count_reg from PAGO_OFERTA WHERE ( SERIE = :serie ) AND ( NRO_OFERTA = :numero ) using sqlca;
				if count_reg > 0 then
					UPDATE 	"PAGO_OFERTA"  
					SET 		"SEPULTURA"   = '0',   
						 		"NRO_TECNICO" = null  
					WHERE 	( "PAGO_OFERTA"."SERIE"  = :serie ) AND  
								( "PAGO_OFERTA"."NRO_OFERTA" = :numero ) using sqlca;
					if sqlca.sqlcode = 0 then
						DELETE FROM RESERVA_SEPULTURA WHERE ( BASE = :gs_base ) AND ( SECTOR = :gs_serie ) AND ( NUMERO = :gi_numero ) AND COD_PARQUE = :id_parque  ;
						if sqlca.sqlcode = 0 then
							SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
							IF ISNULL(correlativo) THEN correlativo = 1
							INSERT INTO "LOG_RESERVA_SEPULTURA"  
									 		( "CORRELATIVO","AREA","SECTOR","SEPULTURA","BASE","SERIE",	"NUMERO","FOLIO_RESERVA",	"RUT","OBSERVACION",	"FECHA_RESERVA",		"ESTADO",	"COD_AGENTE",	"FECHA_LOG",		"USUARIO_LOG",	"COD_PARQUE" )  
							VALUES 		( :correlativo ,		:area ,:sector ,		:sepultura ,	:base ,	:serie ,	:numero ,	0              ,			:rut ,	:observacion ,		:gdt_fec_sistema     ,		6       ,		null    ,				:gdt_fec_sistema ,:gs_user         ,		:id_parque  )  
							using sqlca;
							if sqlca.sqlcode = 0 then  
								UPDATE "INVENTARIO_PLANI"  
								SET "BASE" = :base,   
									 "SERIE" = :serie,   
									 "NUMERO" = 0,   
									 "RUT" = 0,   
									 "OBSERVACIONES" = null,   
									 "LOG_USUARIO" = null,   
									 "FOLIO_ASIGNACION" = null  
								WHERE ( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura ) and ("INVENTARIO_PLANI"."COD_PARQUE" = :id_parque) using sqlca ;
								if sqlca.sqlcode = 0 then
									commit using sqlca;
									messagebox('Liberación','Liberación exitosa.',information!)
									if w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_manantial' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce' then 
										w_plano_sector_parque.st_40.triggerevent( clicked!)
									end if
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
						UPDATE	"CONTRATO"  
						SET 		"SEPULTURA"  = '0',   
							 		"NRO_TEC"    = null  
						WHERE ( "CONTRATO"."SERIE_C" = :serie ) AND  
								  ( "CONTRATO"."NRO_CONTRATO"  = :numero )  using sqlca ;
						if sqlca.sqlcode = 0 then
							commit using sqlca;
							SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
							IF ISNULL(correlativo) THEN correlativo = 1
							INSERT INTO "LOG_RESERVA_SEPULTURA"  
									 		( "CORRELATIVO","AREA",	"SECTOR",	"SEPULTURA",	"BASE",	"SERIE",	"NUMERO",	"FOLIO_RESERVA","RUT","OBSERVACION",	"FECHA_RESERVA",	"ESTADO",	"COD_AGENTE","FECHA_LOG",		"USUARIO_LOG",	"COD_PARQUE" )  
							VALUES 		( :correlativo ,		:area ,	:sector ,		:sepultura ,		:base ,	:serie ,	:numero ,	0              ,			:rut ,	:observacion ,		:gdt_fec_sistema     ,	6       ,		null        ,		:gdt_fec_sistema ,:gs_user     ,		:id_parque )  
							using sqlca;
							if sqlca.sqlcode = 0 then
								commit using sqlca;
								UPDATE "INVENTARIO_PLANI"  
								SET "BASE" = :base,   //null
									 "SERIE" = :serie,   //null
									 "NUMERO" = 0,   
									 "RUT" = 0,   
									 "OBSERVACIONES" = null,   
									 "LOG_USUARIO" = null,   
									 "FOLIO_ASIGNACION" = null  
								WHERE ( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura ) and ("INVENTARIO_PLANI"."COD_PARQUE" = :id_parque) using sqlca ;
								if sqlca.sqlcode = 0 then
									commit using sqlca;
									messagebox('Liberación','Liberación exitosa.',information!)
									if w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_manantial' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan' and &
										w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce' then  
										w_plano_sector_parque.st_40.triggerevent( clicked!)
									end if
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
							MessageBox("Error", "Favor dar aviso al Depto. de Informatica (03)",stopsign! )
						end if
					else
						MessageBox("Error", "(08) La promesa "+base+' - '+serie+' - '+string(numero,'###,###,###')+' No Existe.',stopsign! )
					end if
				end if
			end if
		next
	end if
end if
end event

type pb_3 from picturebutton within w_asignacion_general
event mousemove pbm_mousemove
integer x = 2693
integer y = 832
integer width = 165
integer height = 144
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar.bmp"
string disabledname = "grabar_no.bmp"
alignment htextalign = left!
end type

event mousemove;st_1.text 			= 'Guardar Cambios'
st_1.visible 		= true
st_1.x 			= 2272
st_1.y 			= 716
st_1.width 		= 560
end event

event clicked;integer  	i,estado,si_no,count_reg,ret,capacidad
long     	folio,correlativo,rut,count_sector,ll_tot_reg,ll_cap_res,ll_cap_ctto,ll_res
string   	sector,sepultura,base,serie,area,nro_tecnico,observacion,cod_age,sepultura_nd,n_sep,sector_sep
datetime	fecha,fecha_log,fecha_sys
Double	numero

st_1.visible		= false
ll_tot_reg		= dw_1.rowcount()
//------------------- Asignar Reserva a Sepultura-------------------
if ll_tot_reg > 0 then
	if MessageBox("Guardar Cambios", '¿ Desea Actualizar las Sepulturas ?', Question!, OKCancel!, 2) = 1 then
		for i = 1 to ll_tot_reg
			dw_1.accepttext ()
			setnull(folio)
			estado      	= 3
			area        	= dw_1.getitemstring(i,'area')
			sector      	= dw_1.getitemstring(i,'sector')
			sepultura  	= dw_1.getitemstring(i,'sepultura')
			base        	= dw_1.getitemstring(i,'base')
			serie       	= dw_1.getitemstring(i,'serie')
			numero      	= dw_1.getitemnumber(i,'numero')
			rut         		= dw_1.getitemnumber(i,'rut')
			observacion = dw_1.getitemstring(i,'observacion')
			ll_cap_res	= dw_1.getitemnumber(i,'capacidad')
			if f_pertenece_parque(base,serie,numero,id_parque) = false then
				messagebox('Otro Parque','Esta Promesa pertenece a otro Parque ( '+base+serie+'-'+string(numero)+' )',stopsign!)
				return
			end if
			if numero > 0 or (not isnull(numero)) then
				//--
				SELECT 	"INVENTARIO_PLANI"."SEPULTURA", "INVENTARIO_PLANI"."SECTOR"
				INTO 		:n_sep, :sector_sep
				FROM 	"INVENTARIO_PLANI"
				WHERE 	( "INVENTARIO_PLANI"."BASE" = :base ) AND
							( "INVENTARIO_PLANI"."SERIE" = :serie ) AND
							( "INVENTARIO_PLANI"."NUMERO" = :numero ) and
							( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) AND
							( "INVENTARIO_PLANI"."SEPULTURA" = :sector ) AND
							( "INVENTARIO_PLANI"."SECTOR" = :sepultura )
				using sqlca ;		
				//--
//				SELECT	"INVENTARIO_PLANI"."SEPULTURA",	"INVENTARIO_PLANI"."SECTOR"  
//				INTO 		:n_sep,									:sector_sep 
//				FROM 	"INVENTARIO_PLANI"  
//				WHERE  ( "INVENTARIO_PLANI"."BASE"   = :base ) AND  
//						 ( "INVENTARIO_PLANI"."SERIE"  = :serie ) AND  
//						 ( "INVENTARIO_PLANI"."NUMERO" = :numero ) and
//						 ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) using sqlca ;
				if sqlca.sqlcode = 0 then
					MessageBox("Contrato Asignado", ' El Contrato '+base+'-'+serie+'-'+string(numero,'###,###,###')+ ' esta asignado en el Sector: '+sector_sep+' y Sepultura: '+n_sep,Question!)
				end if
				SELECT distinct sysdate 
				INTO 		:fecha_sys 
				FROM 	"AGENTES" using sqlca ;
				
				SELECT 	CAPACIDAD,		NUMERO_TEC 
				INTO 		:capacidad,		:nro_tecnico 
				FROM 	INVENTARIO_PLANI 
				WHERE  	( SECTOR = :sector ) AND 
						 	( SEPULTURA = :sepultura ) and 	
						 	( COD_PARQUE = :id_parque)
				using 	sqlca ;
				//--------------------------------verificar--------------------------------
				select	count(*) 
				into 		:count_reg 
				from 		PAGO_OFERTA 
				WHERE  ( SERIE = :serie ) AND 
						 ( NRO_OFERTA = :numero ) 
				using 	sqlca;
				if count_reg > 0 then
					SELECT	"PAGO_OFERTA"."CAPACIDAD"  
					INTO 		:ll_cap_ctto  
					FROM 	"OFERTA_V",	"PAGO_OFERTA"  
					WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
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
								SET 		"CAPACIDAD" = :capacidad,   
											"AREA" = :area,   
											"SECTOR" = :sector,   
											"SEPULTURA" = :sepultura,   
											"NRO_TECNICO" = :nro_tecnico  
								WHERE  ( "PAGO_OFERTA"."SERIE" = :serie ) AND  
										 ( "PAGO_OFERTA"."NRO_OFERTA" = :numero ) using sqlca;
							else
								UPDATE	"PAGO_OFERTA"  
								SET 		"AREA" = :area,   
											"SECTOR" = :sector,   
											"SEPULTURA" = :sepultura,   
											"NRO_TECNICO" = :nro_tecnico  
								WHERE  ( "PAGO_OFERTA"."SERIE" = :serie ) AND  
										 ( "PAGO_OFERTA"."NRO_OFERTA" = :numero ) using sqlca;
							end if
							if sqlca.sqlcode = 0 then
								commit using sqlca;
								SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
								if isnull(correlativo) then correlativo = 1
								INSERT INTO   "LOG_RESERVA_SEPULTURA"  
												( "CORRELATIVO","AREA","SECTOR","SEPULTURA",	"BASE",	"SERIE",	"NUMERO",	"FOLIO_RESERVA","RUT",	"OBSERVACION",	"FECHA_RESERVA",	"ESTADO",	"COD_AGENTE",	"FECHA_LOG",	"USUARIO_LOG",	"COD_PARQUE" )  
								VALUES      ( :correlativo ,		:area ,:sector ,		:sepultura ,		:base ,	:serie ,	:numero ,	0              ,			:rut ,		:observacion ,		:fecha_sys     ,			3       ,		null    ,				:fecha_sys ,		:gs_user         ,	:id_parque   )  
								using sqlca;
								if sqlca.sqlcode = 0 then
									commit using sqlca;
									SELECT DISTINCT COUNT(1) INTO :count_sector FROM "INVENTARIO_PLANI_CONST" WHERE "INVENTARIO_PLANI_CONST"."SECTOR" = :sector and "INVENTARIO_PLANI_CONST"."SEPULTURA" = :SEPULTURA AND "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :id_parque;
									if count_sector = 0  then
										UPDATE "INVENTARIO_PLANI"  
										SET "BASE" = :base,   
											 "SERIE" = :serie,   
											 "NUMERO" = :numero,   
											 "RUT" = :rut,   
											 "OBSERVACIONES" = :observacion,   
											 "LOG_USUARIO" = :gs_user,   
											 "FOLIO_ASIGNACION" = :folio,
											 "CAPACIDAD" = :capacidad
										WHERE ( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura ) and ("INVENTARIO_PLANI"."COD_PARQUE" = :id_parque) using sqlca ;
										if sqlca.sqlcode = 0 then
											commit using sqlca;
											
											UPDATE 	"RESERVA_SEPULTURA"  
											SET 		"ESTADO" = 3 
											WHERE 	("RESERVA_SEPULTURA"."SECTOR" = :sector ) AND ( "RESERVA_SEPULTURA"."SEPULTURA" = :sepultura )  and ("RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque)  ;
											if sqlca.sqlcode = 0 then
												commit using sqlca;
												messagebox('Asignación','Asignación exitosa.',information!)
												if w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_manantial' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce'	then  
													w_plano_sector_parque.st_40.triggerevent( clicked!)
												end if
											else
												ROLLBACK using sqlca;
												MessageBox("Error", "Favor dar aviso al Depto. de Informatica (09)",stopsign! )
											end if
										else
											ROLLBACK using sqlca;
											MessageBox("Error", "Favor dar aviso al Depto. de Informatica (06)",stopsign! )
										end if
									elseif count_sector > 0  then
										UPDATE  "INVENTARIO_PLANI_CONST"  
										SET 	  "BASE" = :base,   
												  "SERIE" = :serie,   
												  "NUMERO" = :numero,   
												  "RUT" = :rut,   
												  "OBSERVACIONES" = :observacion,   
												  "LOG_USUARIO" = :gs_user,   
												  "FOLIO_ASIGNACION" = :folio  
										WHERE ( "INVENTARIO_PLANI_CONST"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :sepultura ) and ("INVENTARIO_PLANI_CONST"."COD_PARQUE" = :id_parque) using sqlca ;
										if sqlca.sqlcode = 0 then
											commit using sqlca;
											UPDATE 	"RESERVA_SEPULTURA"  
											SET 		"ESTADO" = 3  
											WHERE 	("RESERVA_SEPULTURA"."SECTOR" = :sector ) AND ( "RESERVA_SEPULTURA"."SEPULTURA" = :sepultura )  AND ("RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque)   ;
											if sqlca.sqlcode = 0 then
												commit using sqlca;
												messagebox('Asignación','Asignación exitosa.',information!)
												if w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_manantial' and & 
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan' and &
													w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce'	then 
													w_plano_sector_parque.st_40.triggerevent( clicked!)
												end if
											else
												ROLLBACK using sqlca;
												MessageBox("Error", "Favor dar aviso al Depto. de Informatica (09)",stopsign! )
											end if
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
								MessageBox("Error", "Favor dar aviso al Depto. de Informatica (07)",stopsign! )
							end if
						end if
					end if
				else
					SELECT count(SERIE_C) INTO :count_reg FROM CONTRATO WHERE SERIE_C = :serie AND NRO_CONTRATO = :numero ;
					if count_reg > 0 then
						SELECT	"CONTRATO"."CAPACIDAD"  
						INTO 		:ll_cap_ctto  
						FROM 	"CONTRATO"  
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
									UPDATE  "CONTRATO"  
									SET 	  	"SECTOR" = :sector,   
												"SEPULTURA"  = :sepultura,   
												"ZONA"       = :area, 
												"CAPACIDAD"  = :capacidad
									WHERE 	( "CONTRATO"."SERIE_C" = :serie ) AND  
												( "CONTRATO"."NRO_CONTRATO"  = :numero )  using sqlca ;
											
//									, 
//											  "NRO_TEC"    = :nro_tecnico  
								else
									UPDATE  "CONTRATO"  
									SET 	  	"SECTOR" = :sector,   
											 	"SEPULTURA"  = :sepultura,   
											  	"ZONA" = :area  
									WHERE ( "CONTRATO"."SERIE_C" = :serie ) AND  
											( "CONTRATO"."NRO_CONTRATO"  = :numero )  using sqlca ;
											
//									, 
//											  "NRO_TEC"    = :nro_tecnico
								end if
								if sqlca.sqlcode = 0 then
									commit using sqlca;
									SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
									if isnull(correlativo) then correlativo = 1
									INSERT INTO "LOG_RESERVA_SEPULTURA"  
											 		( "CORRELATIVO","AREA","SECTOR","SEPULTURA","BASE","SERIE","NUMERO","FOLIO_RESERVA","RUT","OBSERVACION","FECHA_RESERVA","ESTADO","COD_AGENTE","FECHA_LOG","USUARIO_LOG" ,"COD_PARQUE")  
									VALUES ( :correlativo ,:area ,:sector ,:sepultura ,:base ,:serie ,:numero ,0              ,:rut ,:observacion ,:fecha_sys         ,3       ,null    ,:fecha_sys ,:gs_user      ,:id_parque )  using sqlca;
									if sqlca.sqlcode = 0 then
										commit using sqlca;
										SELECT DISTINCT COUNT(1) INTO :count_sector FROM "INVENTARIO_PLANI_CONST" WHERE "INVENTARIO_PLANI_CONST"."SECTOR" = :sector and "INVENTARIO_PLANI_CONST"."SEPULTURA" = :SEPULTURA and "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :id_parque;
										if count_sector = 0  then
											UPDATE "INVENTARIO_PLANI"  
											SET "BASE" = :base,   
												 "SERIE" = :serie,   
												 "NUMERO" = :numero,   
												 "RUT" = :rut,   
												 "OBSERVACIONES" = :observacion,   
												 "LOG_USUARIO" = :gs_user,   
												 "FOLIO_ASIGNACION" = :folio,
												 "CAPACIDAD" = :capacidad
											WHERE ( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura ) AND ("INVENTARIO_PLANI"."COD_PARQUE" = :id_parque) using sqlca ;
											if sqlca.sqlcode = 0 then
												commit using sqlca;
												UPDATE 	"RESERVA_SEPULTURA"  
												SET 		"ESTADO" = 3  
												WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :sector ) AND ( "RESERVA_SEPULTURA"."SEPULTURA" = :sepultura )  AND ("RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque)  ;
												if sqlca.sqlcode = 0 then
													commit using sqlca;
													messagebox('Asignación','Asignación exitosa.',information!)
													if w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and &
														w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
														w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_manantial' and & 
														w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and &
														w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and &
														w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan' and &
														w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce'	then 
														w_plano_sector_parque.st_40.triggerevent( clicked!)
													end if
												else
													ROLLBACK using sqlca;
													MessageBox("Error", "Favor dar aviso al Depto. de Informatica (09)",stopsign! )
												end if
											else
												ROLLBACK using sqlca;
												MessageBox("Error", "Favor dar aviso al Depto. de Informatica (06)",stopsign! )
											end if
										elseif count_sector > 0  then
											UPDATE "INVENTARIO_PLANI_CONST"  
											SET "BASE" = :base,   
												 "SERIE" = :serie,   
												 "NUMERO" = :numero,   
												 "RUT" = :rut,   
												 "OBSERVACIONES" = :observacion,   
												 "LOG_USUARIO" = :gs_user,   
												 "FOLIO_ASIGNACION" = :folio  
											WHERE ( "INVENTARIO_PLANI_CONST"."SECTOR" = :sector ) AND ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :sepultura ) AND ("INVENTARIO_PLANI_CONST"."COD_PARQUE" = :id_parque) using sqlca ;
											if sqlca.sqlcode = 0 then
												commit using sqlca;
												UPDATE 	"RESERVA_SEPULTURA"  
												SET 		"ESTADO" = 3  
												WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :sector ) AND ( "RESERVA_SEPULTURA"."SEPULTURA" = :sepultura ) AND ("RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque)   ;
												if sqlca.sqlcode = 0 then
													commit using sqlca;
													messagebox('Asignación','Asignación exitosa.',information!)
													if w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and &
														w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' then 
														w_plano_sector_parque.st_40.triggerevent( clicked!)
													end if
												else
													ROLLBACK using sqlca;
													MessageBox("Error", "Favor dar aviso al Depto. de Informatica (09)",stopsign! )
												end if
											else
												ROLLBACK using sqlca;
												MessageBox("Error", "Favor dar aviso al Depto. de Informatica (06)",stopsign! )
											end if
										end if
									else
										ROLLBACK using sqlca;
										MessageBox("Error", "Favor dar aviso al Depto. de Informatica (02)",stopsign! )
									end if
								else
									ROLLBACK using sqlca;
									MessageBox("Error", "Favor dar aviso al Depto. de Informatica (05) "+sqlca.sqlerrtext,stopsign! )
								end if
							end if
						end if
					else
						MessageBox("Error", "(08) La promesa "+base+' - '+serie+' - '+string(numero,'###,###,###')+' No Existe.',stopsign! )
					end if
				end if
			end if
		next
	end if
end if
end event

type pb_2 from picturebutton within w_asignacion_general
event mousemove pbm_mousemove
integer x = 270
integer y = 832
integer width = 165
integer height = 144
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "delete.bmp"
alignment htextalign = left!
end type

event mousemove;st_1.text = 'Borrar'
st_1.visible = true
st_1.x = 370
st_1.y = 716
st_1.width = 347
end event

event clicked;integer i,j

st_1.visible = false
dw_1.deleterow(ll_filas)
if dw_1.rowcount() > 0 then
	for i = 1 to dw_1.rowcount()
		if dw_1.getitemstring(i,'observacion') = '¡ Error, No existe !' then j ++
		if j = 0 then
			pb_3.enabled = true
		elseif j > 0 then
			pb_3.enabled = false
		end if
	next
else
	pb_3.enabled = true	
end if
end event

type pb_1 from picturebutton within w_asignacion_general
event mousemove pbm_mousemove
integer x = 59
integer y = 832
integer width = 165
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Insertar_on.bmp"
alignment htextalign = left!
end type

event mousemove;st_1.text = 'Insertar'
st_1.visible = true
st_1.x = 137
st_1.y = 716
st_1.width = 347
end event

event clicked;Long		i,j,ll_new

st_1.visible 				= false
ll_new					= dw_1.insertrow(0)
dw_1.scrolltorow(ll_new)
dw_1.setfocus()
dw_1.setcolumn('base')
for i = 1 to dw_1.rowcount()
	if dw_1.getitemstring(i,'observacion') = '¡ Error, No existe !' then j ++
	if j = 0 then
		pb_3.enabled 	= true
	elseif j > 0 then
		pb_3.enabled 	= false
	end if
next
end event

type dw_1 from datawindow within w_asignacion_general
event mousemove pbm_dwnmousemove
integer x = 59
integer y = 108
integer width = 2798
integer height = 700
string title = "none"
string dataobject = "Dw_asignacion_general"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;st_1.visible = false
end event

event rowfocuschanged;IF rowcount() > 0 THEN
	ll_filas = getrow()
	SelectRow(0, FALSE)
	SelectRow(getrow(), TRUE)
END IF
end event

event clicked;ll_filas = row
end event

event itemchanged;string	base,serie,area,sector,sep,nulo,sepultura,ls_base,ls_serie,ls_area,ls_sector,ls_sepultura,&
			ls_observacion,ls_cod_age
long 		rut,rut_nulo,count_numero,ll_folio,ll_estado,ll_folio_reserva
integer	i,j
Double	numero,ll_numero_aux,ll_numero
//Datetime	ld_fecha,ld_fecha_log
//--------------------------------------dw_1--------------------------------------
accepttext ()
setnull(nulo)
setnull(rut_nulo)
setnull(sector)
IF rowcount() > 0 THEN
	ll_filas 			= row
	ls_base			= trim(dw_1.getitemstring(ll_filas,'base'))
	ls_serie			= trim(dw_1.getitemstring(ll_filas,'serie'))
	ll_numero		= dw_1.getitemnumber(ll_filas,'numero')
	ls_area			= trim(dw_1.getitemstring(ll_filas,'area'))
	ls_sector			= trim(dw_1.getitemstring(ll_filas,'sector'))
	ls_sepultura		= trim(dw_1.getitemstring(ll_filas,'sepultura'))
	ls_observacion	= trim(dw_1.getitemstring(ll_filas,'observacion'))
	ll_folio			= dw_1.getitemnumber(ll_filas,'foliio_reserva')
	ll_estado			= dw_1.getitemnumber(ll_filas,'estado')
//	ld_fecha			= dw_1.getitemdatetime(ll_filas,'fecha')
	ls_cod_age		= trim(dw_1.getitemstring(ll_filas,'cod_age'))
//	ld_fecha_log	= dw_1.getitemdatetime(ll_filas,'fecha_log')
	if dwo.name = 'sector' then
		sector	= getitemstring(ll_filas,'sector')
		SELECT count(1) into :count_numero FROM INVENTARIO_PLANI WHERE SECTOR = :sector  and cod_parque = :id_parque ;
		if count_numero=0 then
			messagebox('Advertencia','No Existe Sector '+sector)
			dw_1.deleterow(ll_filas)
			dw_1.insertrow(ll_filas)
			dw_1.scrolltorow(ll_filas)
			dw_1.setitem(ll_filas,'base',ls_base)
			dw_1.setitem(ll_filas,'serie',ls_serie)
			dw_1.setitem(ll_filas,'numero',ll_numero)
			dw_1.setitem(ll_filas,'area',ls_area)
			dw_1.setitem(ll_filas,'sepultura',ls_sepultura)
			dw_1.setitem(ll_filas,'observacion',ls_observacion)
			dw_1.setitem(ll_filas,'foliio_reserva',ll_folio)
			dw_1.setitem(ll_filas,'estado',ll_estado)
			dw_1.setitem(ll_filas,'cod_age',ls_cod_age)
			pb_3.enabled	= false
			dw_1.accepttext()
			dw_1.setcolumn('sector')
		end if
	end if
	if dwo.name = 'area' then
		area	= getitemstring(ll_filas,'area')
		SELECT count(1) into :count_numero FROM BASE_PLANI WHERE AREA = :area  and cod_parque = :id_parque ;
		if count_numero=0 then
			messagebox('Advertencia','No Existe Area '+area)
			dw_1.deleterow(ll_filas)
			dw_1.insertrow(ll_filas)
			dw_1.scrolltorow(ll_filas)
			dw_1.setitem(ll_filas,'base',ls_base)
			dw_1.setitem(ll_filas,'serie',ls_serie)
			dw_1.setitem(ll_filas,'numero',ll_numero)
			dw_1.setitem(ll_filas,'sector',ls_sector)
			dw_1.setitem(ll_filas,'sepultura',ls_sepultura)
			dw_1.setitem(ll_filas,'observacion',ls_observacion)
			dw_1.setitem(ll_filas,'foliio_reserva',ll_folio)
			dw_1.setitem(ll_filas,'estado',ll_estado)
			dw_1.setitem(ll_filas,'cod_age',ls_cod_age)
			pb_3.enabled	= false
			dw_1.accepttext()
			dw_1.setcolumn('area')
		end if
	end if
	if dwo.name = 'numero' then
		base   				= getitemstring(ll_filas,'base')
		serie  				= getitemstring(ll_filas,'serie')
		numero 				= Double(data)//getitemnumber(ll_filas,'numero')
		accepttext ()
		sepultura 			= getitemstring(ll_filas,'sepultura')
		SELECT count(1) into :count_numero FROM INVENTARIO_PLANI WHERE SECTOR = :gs_sector and  NUMERO = 10000000 and sepultura = :sepultura and cod_parque = :id_parque ;
      	if count_numero > 0 then
			setitem(ll_filas,'observacion','¡ Error, Sepultura Individual !')
			pb_3.enabled	= false
		else
			setitem(ll_filas,'observacion','Asignación de Sepultura')
			pb_3.enabled	= true
		end if
		if base = 'O' or base='U' then
			SELECT 	"PAGO_OFERTA"."AREA","PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"OFERTA_V"."RUT"  
			INTO 		:area,							:sector,								:sep,										:rut
			FROM 	"OFERTA_V","PAGO_OFERTA"  
			WHERE  ( "OFERTA_V"."SERIE"   = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA"    = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO"     = "PAGO_OFERTA"."FOLIO" ) and  
					 (("OFERTA_V"."SERIE"       = :serie ) AND  
					 ( "OFERTA_V"."NRO_OFERTA"  = :numero ) )   ;
		elseif base='C' then
			SELECT 	"CONTRATO"."ZONA",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA","CONTRATO"."RUT"  
			INTO 		:area,							:sector,						:sep,								:rut  
			FROM 	"CONTRATO"  
			WHERE ( "CONTRATO"."SERIE_C" = :serie ) AND  
					  ( "CONTRATO"."NRO_CONTRATO"  = :numero )   ;
		end if
		if sqlca.sqlcode=0 then
			if not isnull(area) and sector<>'0' and sep<>'0' then
				pb_3.enabled 	= false
				messagebox("Advertencia","Sepultura Ya Asignada, recuerde debe Liberar Sepultura")
				dw_1.setitem(ll_filas,'rut',rut_nulo)
				dw_1.setitem(ll_filas,'area',nulo)
				dw_1.setitem(ll_filas,'sector',nulo)
				dw_1.setitem(ll_filas,'sepultura',nulo)
				dw_1.setitem(ll_filas,'numero',rut_nulo)
				dw_1.accepttext()
				setitem(ll_filas,'observacion','Sepultura Ya Asignada, recuerde debe Liberar Sepultura')
				dw_1.setcolumn('numero')
			end if
		else
			pb_3.enabled 	= false
			messagebox("Advertencia","Contrato No Existe")
			dw_1.setitem(ll_filas,'rut',rut_nulo)
			dw_1.setitem(ll_filas,'area',nulo)
			dw_1.setitem(ll_filas,'sector',nulo)
			dw_1.setitem(ll_filas,'sepultura',nulo)
			dw_1.setitem(ll_filas,'numero',rut_nulo)
			dw_1.setitem(ll_filas,'observacion','Contrato No Existe')
			dw_1.accepttext()
			dw_1.setcolumn('numero')
		end if
		dw_1.accepttext()
	end if
	if dwo.name = 'sepultura' or dwo.name = 'sector' then
		sepultura 			= getitemstring(ll_filas,'sepultura')
		sector    				= getitemstring(ll_filas,'sector')
		if not isnull(sepultura) and not isnull(sector) then
			SELECT count(1) into :count_numero FROM INVENTARIO_PLANI WHERE SECTOR = :sector and sepultura = :sepultura  and cod_parque = :id_parque ;
				if count_numero = 0 then
				messagebox("Advertencia","Sepultura No Existe")
				dw_1.setitem(ll_filas,'observacion','Sepultura No Existe')
				pb_3.enabled 	= false
			else
				SELECT	"INVENTARIO_PLANI"."NUMERO"  
				INTO 		:ll_numero_aux  
				FROM 	"INVENTARIO_PLANI"  
				WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) AND  
						   ( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND  
						   ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura )   ;
				if ll_numero_aux > 0 then
					dw_1.setitem(ll_filas,'observacion','Sepultura Ya Asignada')
					messagebox("Advertencia","Sepultura Ya Asignada")
//					dw_1.setitem(ll_filas,'area',nulo)
//					dw_1.setitem(ll_filas,'sector',nulo)
//					dw_1.setitem(ll_filas,'sepultura',nulo)
//					dw_1.accepttext()
//					dw_1.setcolumn('area')
//					pb_3.enabled 		= false
				else
					SELECT	"RESERVA_SEPULTURA"."FOLIO_RESERVA"  
					INTO 		:ll_folio_reserva  
					FROM 	"RESERVA_SEPULTURA"  
					WHERE  ( "RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque ) AND  
							   ( "RESERVA_SEPULTURA"."SECTOR" = :sector ) AND  
							   ( "RESERVA_SEPULTURA"."SEPULTURA" = :sepultura ) AND  
							   ( "RESERVA_SEPULTURA"."ESTADO" = 1 )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						messagebox("Advertencia","Existe Reserva Vigente para Sepultura "+sector+'-'+sepultura+' Folio Reserva Nº '+string(ll_folio_reserva,'###,###,###,###,###'))
						dw_1.setitem(ll_filas,'observacion','Existe Reserva Vigente')
//						dw_1.setitem(ll_filas,'area',nulo)
//						dw_1.setitem(ll_filas,'sector',nulo)
//						dw_1.setitem(ll_filas,'sepultura',nulo)
//						dw_1.accepttext()
//						dw_1.setcolumn('area')
//						pb_3.enabled 	= false
					else
						pb_3.enabled 	= true
					end if
				end if
			end if
		end if
	end if
END IF
this.accepttext()
end event

event itemfocuschanged;Long		count_numero,rut,rut_nulo,ll_folio_reserva
String		base,serie,sepultura,area,sector,sep,nulo
Double	numero,ll_numero_aux
Setnull(rut_nulo);Setnull(nulo)
dw_1.accepttext()
ll_filas				= dw_1.getrow()
base   				= dw_1.getitemstring(ll_filas,'base')
serie  				= dw_1.getitemstring(ll_filas,'serie')
numero 				= dw_1.getitemnumber(ll_filas,'numero')
sepultura 			= dw_1.getitemstring(ll_filas,'sepultura')
sector    				= dw_1.getitemstring(ll_filas,'sector')
if not isnull(base) and not isnull(serie) and not isnull(numero) then
	SELECT count(1) into :count_numero FROM INVENTARIO_PLANI WHERE SECTOR = :gs_sector and  NUMERO = 10000000 and sepultura = :sepultura and cod_parque = :id_parque ;
		if count_numero > 0 then
		pb_3.enabled	= false
	else
		pb_3.enabled	= true
	end if
	if base = 'O' or base='U' then
		SELECT 	"PAGO_OFERTA"."AREA","PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"OFERTA_V"."RUT"  
		INTO 		:area,							:sector,								:sep,										:rut
		FROM 	"OFERTA_V","PAGO_OFERTA"  
		WHERE  ( "OFERTA_V"."SERIE"   = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA"    = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO"     = "PAGO_OFERTA"."FOLIO" ) and  
				 (("OFERTA_V"."SERIE"       = :serie ) AND  
				 ( "OFERTA_V"."NRO_OFERTA"  = :numero ) )   ;
	else
		SELECT 	"CONTRATO"."ZONA",	"CONTRATO"."SECTOR",	"CONTRATO"."SEPULTURA","CONTRATO"."RUT"  
		INTO 		:area,							:sector,						:sep,								:rut  
		FROM 	"CONTRATO"  
		WHERE ( "CONTRATO"."SERIE_C" = :serie ) AND  
				  ( "CONTRATO"."NRO_CONTRATO"  = :numero )   ;
	end if
	if sqlca.sqlcode = 0 then
		if not isnull(area) and sector<>'0' and sep<>'0' then
			pb_3.enabled 	= false
			dw_1.setitem(ll_filas,'rut',rut_nulo)
			dw_1.setitem(ll_filas,'area',nulo)
			dw_1.setitem(ll_filas,'sector',nulo)
			dw_1.setitem(ll_filas,'sepultura',nulo)
			dw_1.setitem(ll_filas,'numero',rut_nulo)
			dw_1.setitem(ll_filas,'observacion','Sepultura Ya Asignada, recuerde debe Liberar Sepultura')
			dw_1.accepttext()
			dw_1.setcolumn('numero')
		end if
	else
		pb_3.enabled 	= false
		dw_1.setitem(ll_filas,'rut',rut_nulo)
		dw_1.setitem(ll_filas,'area',nulo)
		dw_1.setitem(ll_filas,'sector',nulo)
		dw_1.setitem(ll_filas,'sepultura',nulo)
		dw_1.setitem(ll_filas,'numero',rut_nulo)
		dw_1.setitem(ll_filas,'observacion','Contrato No Existe')
		dw_1.accepttext()
		dw_1.setcolumn('numero')
	end if
	sepultura 				= dw_1.getitemstring(ll_filas,'sepultura')
	sector    					= dw_1.getitemstring(ll_filas,'sector')
	if not isnull(sepultura) and not isnull(sector) then
		SELECT count(1) into :count_numero FROM INVENTARIO_PLANI WHERE SECTOR = :sector and sepultura = :sepultura  and cod_parque = :id_parque ;
			if count_numero = 0 then
			dw_1.setitem(ll_filas,'observacion','Sepultura No Existe')
			pb_3.enabled 	= false
		else
			SELECT	"INVENTARIO_PLANI"."NUMERO"  
			INTO 		:ll_numero_aux  
			FROM 	"INVENTARIO_PLANI"  
			WHERE  ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) AND  
						( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND  
						( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura )   ;
			if ll_numero_aux > 0 then
				dw_1.setitem(ll_filas,'observacion','Sepultura Ya Asignada')
				dw_1.setitem(ll_filas,'area',nulo)
				dw_1.setitem(ll_filas,'sector',nulo)
				dw_1.setitem(ll_filas,'sepultura',nulo)
				dw_1.accepttext()
				dw_1.setcolumn('area')
				pb_3.enabled 		= false
			else
				SELECT	"RESERVA_SEPULTURA"."FOLIO_RESERVA"  
				INTO 		:ll_folio_reserva  
				FROM 	"RESERVA_SEPULTURA"  
				WHERE  ( "RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque ) AND  
							( "RESERVA_SEPULTURA"."SECTOR" = :sector ) AND  
							( "RESERVA_SEPULTURA"."SEPULTURA" = :sepultura ) AND  
							( "RESERVA_SEPULTURA"."ESTADO" = 1 )   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					dw_1.setitem(ll_filas,'observacion','Existe Reserva Vigente')
					dw_1.setitem(ll_filas,'area',nulo)
					dw_1.setitem(ll_filas,'sector',nulo)
					dw_1.setitem(ll_filas,'sepultura',nulo)
					dw_1.accepttext()
					dw_1.setcolumn('area')
					pb_3.enabled 	= false
				else
					pb_3.enabled 	= true
				end if
			end if
		end if
	end if
end if
dw_1.accepttext()
end event

type gb_1 from groupbox within w_asignacion_general
event mousemove pbm_mousemove
integer x = 27
integer y = 24
integer width = 2875
integer height = 1000
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Asignaciones"
end type

event mousemove;st_1.visible = false
end event

type dw_2 from datawindow within w_asignacion_general
event mousemove pbm_dwnmousemove
integer x = 59
integer y = 1152
integer width = 2798
integer height = 700
string title = "none"
string dataobject = "Dw_asignacion_general2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;st_1.visible = false
end event

event clicked;ll_filas = row
end event

event rowfocuschanged;string 	base,serie,area,sector,sep
long 		rut
Double	numero
IF rowcount() > 0 THEN
	ll_filas2 	= getrow()
	SelectRow(0, FALSE)
	SelectRow(ll_filas2, TRUE)
end if
end event

event editchanged;//string base,serie,area,sector,sep,nulo,sepultura
//long rut,rut_nulo,count_numero
//integer i,j
//Double	numero
////--------------------------------------dw_2--------------------------------------
//setnull(nulo)
//setnull(rut_nulo)
//
//IF rowcount() > 0 THEN
//	ll_filas2 		= row
//	if dwo.name = 'numero' then
//		base   	= getitemstring(ll_filas2,'base')
//		serie  	= getitemstring(ll_filas2,'serie')
//		numero 	= Double(data)//getitemnumber(ll_filas2,'numero')
//		accepttext ()
//		if base = 'O' or base='U' then
//			SELECT 	"PAGO_OFERTA"."AREA",	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"OFERTA_V"."RUT"  
//			INTO 		:area,								:sector,								:sep,										:rut
//			FROM 	"OFERTA_V","PAGO_OFERTA"  
//			WHERE 	( "OFERTA_V"."SERIE"   = "PAGO_OFERTA"."SERIE" ) and  
//						( "OFERTA_V"."NRO_OFERTA"    = "PAGO_OFERTA"."NRO_OFERTA" ) and  
//						( "OFERTA_V"."ULT_FOLIO"     = "PAGO_OFERTA"."FOLIO" ) and  
//						( ( "OFERTA_V"."SERIE"       = :serie ) AND  
//						(   "OFERTA_V"."NRO_OFERTA"  = :numero ) )   ;
//		else
//			SELECT 	"CONTRATO"."ZONA",	"CONTRATO"."SECTOR",		"CONTRATO"."SEPULTURA",	"CONTRATO"."RUT"  
//			INTO 		:area,							:sector,							:sep,									:rut  
//			FROM 	"CONTRATO"  
//			WHERE 	( "CONTRATO"."SERIE_C" = :serie ) AND  
//						( "CONTRATO"."NRO_CONTRATO"  = :numero )   ;
//		end if
//		if sqlca.sqlcode = 0 then
//			pb_4.enabled = true
//			setitem(ll_filas2,'rut',rut)
//			setitem(ll_filas2,'area',area)
//			setitem(ll_filas2,'sector',sector)
//			setitem(ll_filas2,'sepultura',sep)
//			setitem(ll_filas2,'observacion','Liberación de Sepultura')
//		else
//			pb_4.enabled = false
//			setitem(ll_filas2,'rut',rut_nulo)
//			setitem(ll_filas2,'area',nulo)
//			setitem(ll_filas2,'sector',nulo)
//			setitem(ll_filas2,'sepultura',nulo)
//			setitem(ll_filas2,'observacion','¡ Error, No existe !')
//		end if
//		sepultura 	= getitemstring(ll_filas,'sepultura')
//		sector    		= getitemstring(ll_filas,'sector')
//		SELECT count(1) into :count_numero FROM INVENTARIO_PLANI WHERE SECTOR = :sector and sepultura = :sepultura ;
//      if count_numero = 0 then
//			setitem(ll_filas2,'observacion','¡ Error, Sepultura No Existe !')
//		else
//			setitem(ll_filas2,'observacion','Liberación de Sepultura')
//		end if
//	end if
//END IF
//for i = 1 to rowcount()
//	if getitemstring(i,'observacion') = '¡ Error, No existe !' or getitemstring(i,'observacion') = '¡ Error, Sepultura No Existe !'  then j ++
//	if j = 0 then
//		pb_4.enabled = true
//	elseif j > 0 then
//		pb_4.enabled = false
//	end if
//next
end event

event itemchanged;string 	base,serie,area,sector,sep,nulo,sepultura
long 		rut,rut_nulo,count_numero
integer 	i,j
Double	numero
//--------------------------------------dw_2--------------------------------------
setnull(nulo)
setnull(rut_nulo)

IF rowcount() > 0 THEN
	ll_filas2 		= row
	if dwo.name = 'numero' then
		base   	= getitemstring(ll_filas2,'base')
		serie  	= getitemstring(ll_filas2,'serie')
		numero 	= Double(data)//getitemnumber(ll_filas2,'numero')
		accepttext ()
		if base = 'O' or base='U' then
			SELECT 	"PAGO_OFERTA"."AREA",	"PAGO_OFERTA"."SECTOR",	"PAGO_OFERTA"."SEPULTURA",	"OFERTA_V"."RUT"  
			INTO 		:area,								:sector,								:sep,										:rut
			FROM 	"OFERTA_V","PAGO_OFERTA"  
			WHERE 	( "OFERTA_V"."SERIE"   = "PAGO_OFERTA"."SERIE" ) and  
						( "OFERTA_V"."NRO_OFERTA"    = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						( "OFERTA_V"."ULT_FOLIO"     = "PAGO_OFERTA"."FOLIO" ) and  
						( ( "OFERTA_V"."SERIE"       = :serie ) AND  
						(   "OFERTA_V"."NRO_OFERTA"  = :numero ) )   ;
		else
			SELECT 	"CONTRATO"."ZONA",	"CONTRATO"."SECTOR",		"CONTRATO"."SEPULTURA",	"CONTRATO"."RUT"  
			INTO 		:area,							:sector,							:sep,									:rut  
			FROM 	"CONTRATO"  
			WHERE 	( "CONTRATO"."SERIE_C" = :serie ) AND  
						( "CONTRATO"."NRO_CONTRATO"  = :numero )   ;
		end if
		if sqlca.sqlcode = 0 then
			pb_4.enabled = true
			setitem(ll_filas2,'rut',rut)
			setitem(ll_filas2,'area',area)
			setitem(ll_filas2,'sector',sector)
			setitem(ll_filas2,'sepultura',sep)
			setitem(ll_filas2,'observacion','Liberación de Sepultura')
		else
			pb_4.enabled = false
			setitem(ll_filas2,'rut',rut_nulo)
			setitem(ll_filas2,'area',nulo)
			setitem(ll_filas2,'sector',nulo)
			setitem(ll_filas2,'sepultura',nulo)
			setitem(ll_filas2,'observacion','¡ Error, No existe !')
		end if
		sepultura 	= getitemstring(ll_filas,'sepultura')
		sector    		= getitemstring(ll_filas,'sector')
		SELECT count(1) into :count_numero FROM INVENTARIO_PLANI WHERE SECTOR = :sector and sepultura = :sepultura ;
      if count_numero = 0 then
			setitem(ll_filas2,'observacion','¡ Error, Sepultura No Existe !')
		else
			setitem(ll_filas2,'observacion','Liberación de Sepultura')
		end if
	end if
END IF
for i = 1 to rowcount()
	if getitemstring(i,'observacion') = '¡ Error, No existe !' or getitemstring(i,'observacion') = '¡ Error, Sepultura No Existe !'  then j ++
	if j = 0 then
		pb_4.enabled = true
	elseif j > 0 then
		pb_4.enabled = false
	end if
next
end event

type gb_2 from groupbox within w_asignacion_general
event mousemove pbm_mousemove
integer x = 27
integer y = 1072
integer width = 2875
integer height = 1000
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Libera Asignaciones"
end type

event mousemove;st_1.visible = false
end event

