forward
global type w_detalle_sepultura from window
end type
type cb_4 from commandbutton within w_detalle_sepultura
end type
type cb_3 from commandbutton within w_detalle_sepultura
end type
type dw_1 from datawindow within w_detalle_sepultura
end type
type cb_2 from commandbutton within w_detalle_sepultura
end type
type cb_1 from commandbutton within w_detalle_sepultura
end type
end forward

global type w_detalle_sepultura from window
integer width = 2085
integer height = 2100
boolean titlebar = true
string title = "Detalle de Sepultura"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_4 cb_4
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_detalle_sepultura w_detalle_sepultura

type variables
integer id_parque
end variables

on w_detalle_sepultura.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_detalle_sepultura.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;integer capacidad,fallecidos
string tipo,estado,nombre,direccion,telefonos,observaciones,sub_sector,sep,nro_tec,nombre_parque

id_parque = w_plano_sector_parque.id_parque//Multiempresa 13-11-2006
gs_ventana = 'w_detalle_sepultura'
f_valida_objeto()
if gi_numero >= 10000000 then
	messagebox('Sepult.Colectiva','Esta es una sepultura colectiva',stopsign!)
	close (w_detalle_sepultura)
	return
END IF
if gi_numero < 10000000  or isnull(gi_numero) then
	gf_centrar(w_detalle_sepultura)
	dw_1.insertrow(0)
	dw_1.setitem(1,'area',gs_area)
	dw_1.setitem(1,'sector',gs_sector)
	dw_1.setitem(1,'sepultura',gs_sepultura)
	dw_1.setitem(1,'rut',string(gi_rut,'###,###,###,##0'))
	dw_1.setitem(1,'contrato',gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,##0'))
	SELECT 	"COD_PARQ"."NOMBRE" 
	into 		:nombre_parque 
	FROM 	"COD_PARQ"  
	WHERE 	"COD_PARQ"."CODIGO" = :id_parque  ;
	dw_1.object.t_2.text = dw_1.object.t_2.text+' ( '+nombre_parque+' )'
	SELECT	"CADENA"."ESTADO"  
	INTO 		:estado  
	FROM 	"CADENA"  
	WHERE  	( "CADENA"."CODIGO" = :gs_base ) AND  
			 	( "CADENA"."SERIE"  = :gs_serie ) AND  
			 	( "CADENA"."NUMERO" = :gi_numero ) and 
			 	( "CADENA"."COD_PARQUE" = :id_parque ) ;
	dw_1.setitem(1,'estado',estado)
	
	SELECT	"INVENTARIO_PLANI"."CAPACIDAD"  
	INTO 		:capacidad  
	FROM 	"INVENTARIO_PLANI"  
	WHERE  	( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) AND  
			 	( "INVENTARIO_PLANI"."SEPULTURA" = :gs_sepultura ) AND  
			 	( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque )   ;
	dw_1.setitem(1,'capacidad',capacidad)
	SELECT 	"BASE_PLANI"."TIPO" 
	INTO 		:tipo 
	FROM 	"BASE_PLANI" 
	WHERE 	"BASE_PLANI"."SECTOR" = :gs_sector AND 
			 	( "BASE_PLANI"."COD_PARQUE" = :id_parque ) ;
	dw_1.setitem(1,'tipo_const',tipo)
	SELECT 	"CLIENTE"."NOMBRE"||' '||"CLIENTE"."A_PATERNO"||' '||"CLIENTE"."A_MATERNO", 
				"DIRECCION_P"||' '||"CLIENTE"."POBLACION"||' '||"COMUNA"."COMUNA" ,
			 	"CLIENTE"."FONO_P"
	INTO 		:nombre,
				:direccion,
				:telefonos  
	FROM  	"CLIENTE","COMUNA"  
	WHERE 	"CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" AND 
		   		"CLIENTE"."RUT" = :gi_rut   ;
	dw_1.setitem(1,'nombre',nombre)
	dw_1.setitem(1,'direccion',direccion)
	dw_1.setitem(1,'telefonos',telefonos)
	SELECT	"INVENTARIO_PLANI"."OBSERVACIONES",
				"INVENTARIO_PLANI"."SUB_SECTOR",
				"INVENTARIO_PLANI"."NUMERO_TEC"  
	INTO 		:observaciones,
				:sub_sector,
				:nro_tec   
	FROM 	"INVENTARIO_PLANI"  
	WHERE  	( "INVENTARIO_PLANI"."SECTOR"    = :gs_sector ) AND  
			 	( "INVENTARIO_PLANI"."SEPULTURA" = :gs_sepultura )   AND 
			 	( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) ;
			 
	dw_1.setitem(1,'observacion',observaciones)
	dw_1.setitem(1,'sub_sector',sub_sector)
	dw_1.setitem(1,'nro_tec',nro_tec)
	SELECT 	count("FALLECIDOS"."LLAVE")  
	INTO 		:fallecidos  
	FROM 	"FALLECIDOS"  
	WHERE 	( "FALLECIDOS"."SECTOR" = :gs_sector ) AND  
				( "FALLECIDOS"."N_SEP" = :gs_sepultura ) AND 
				( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND 
				( "FALLECIDOS"."COD_PARQUE" = :id_parque ) ;
	if sqlca.sqlcode <> 0  then
		sep 				= gs_sepultura
		gs_sepultura 	= mid( gs_sepultura , 1 , len ( gs_sepultura ) -2 )
		SELECT 	count("FALLECIDOS"."LLAVE")  
		INTO 		:fallecidos  
		FROM 	"FALLECIDOS"  
		WHERE 	( "FALLECIDOS"."SECTOR" = :sub_sector ) AND  
					( "FALLECIDOS"."N_SEP" = :gs_sepultura ) AND
					( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND 
					( "FALLECIDOS"."COD_PARQUE" = :id_parque ) ;
		gs_sepultura = sep
	end if
	if isnull(fallecidos) then fallecidos = 0 
	dw_1.setitem(1,'fallecidos',fallecidos)
end if
end event

event close;setnull(gs_base)
setnull(gs_serie)
setnull(gi_numero)
setnull(gi_rut)
setnull(gs_sepultura)
w_plano_sector_parque.dw_plano_sector_parque.enabled = true
end event

type cb_4 from commandbutton within w_detalle_sepultura
integer x = 974
integer y = 1812
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
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

type cb_3 from commandbutton within w_detalle_sepultura
integer x = 475
integer y = 1812
integer width = 494
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modifica.Observ."
end type

event clicked;integer  	i,estado,si_no,count_reg,ret,capacidad
long     	folio,correlativo,rut
string   	sector,sepultura,base,serie, area,nro_tecnico,observacion,cod_age,sepultura_nd,n_sep,sector_sep
datetime	fecha,fecha_log,fecha_sys
Double	numero
if MessageBox("Modificar Observación", '¿ Desea Modificar la Observación ?', Exclamation!, OKCancel!, 2) = 1 then
	SELECT distinct sysdate INTO :fecha_sys FROM "AGENTES" using sqlca ;
	dw_1.accepttext ()
	if isnull(numero) then 
		estado 	= 0
	else
		estado 	= 1
	end if
	area        	= dw_1.getitemstring(1,'area')
	sector      	= dw_1.getitemstring(1,'sector')
	sepultura   	= dw_1.getitemstring(1,'sepultura')
	base        	= gs_base
	serie       	= gs_serie
	numero      	= gi_numero
	rut         		= gi_rut
	fecha       	= fecha_sys
	fecha_log   	= fecha_sys
	observacion = dw_1.getitemstring(1,'observacion')
	if isnull(numero) or numero = 0 then 
		estado = 0
	else
		estado = 1
	end if
	UPDATE 	"INVENTARIO_PLANI"  
	SET 		"OBSERVACIONES" = :observacion  
	WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) AND ( "INVENTARIO_PLANI"."SEPULTURA" = :gs_sepultura ) and ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) ;
	if sqlca.sqlcode = 0 then
		SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA ;
		if isnull(correlativo) or correlativo < 0 then correlativo = 1
		INSERT INTO "LOG_RESERVA_SEPULTURA"  
				 	( "CORRELATIVO",	"AREA",	"SECTOR",	"SEPULTURA",	"BASE",	"SERIE",	"NUMERO",	"FOLIO_RESERVA",	"RUT",	"OBSERVACION",	"FECHA_RESERVA","ESTADO","COD_AGENTE","FECHA_LOG","USUARIO_LOG","COD_PARQUE" )  
		VALUES 	( :correlativo ,		:area ,	:sector ,		:sepultura ,		:base ,	:serie ,	:numero ,	0              ,				:rut ,		:observacion ,		:fecha         ,:estado ,null    ,:fecha_log ,:gs_user         ,:id_parque)  ;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
		else
			ROLLBACK using sqlca;
			MessageBox("Error", "Favor dar aviso al Depto. de Informatica (02)",stopsign! )
		end if
	else
		ROLLBACK using sqlca;
		MessageBox("Error", "Favor dar aviso al Depto. de Informatica (01)",stopsign! )
	end if
end if
end event

type dw_1 from datawindow within w_detalle_sepultura
integer x = 69
integer y = 60
integer width = 1906
integer height = 1716
integer taborder = 10
string title = "none"
string dataobject = "dw_sepulturas_imprimir"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_detalle_sepultura
integer x = 1573
integer y = 1812
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_detalle_sepultura)
end event

type cb_1 from commandbutton within w_detalle_sepultura
integer x = 69
integer y = 1812
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
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

