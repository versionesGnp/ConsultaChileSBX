forward
global type w_reseumen_porcentaje from window
end type
type st_1 from statictext within w_reseumen_porcentaje
end type
type dw_2 from datawindow within w_reseumen_porcentaje
end type
type pb_2 from picturebutton within w_reseumen_porcentaje
end type
type pb_1 from picturebutton within w_reseumen_porcentaje
end type
type dw_1 from datawindow within w_reseumen_porcentaje
end type
end forward

global type w_reseumen_porcentaje from window
integer width = 2245
integer height = 2452
boolean titlebar = true
string title = "Resumen Sepulturas."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_1 st_1
dw_2 dw_2
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_reseumen_porcentaje w_reseumen_porcentaje

type variables
integer id_parque
end variables

on w_reseumen_porcentaje.create
this.st_1=create st_1
this.dw_2=create dw_2
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dw_2,&
this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_reseumen_porcentaje.destroy
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;double 	fallecidos,sepulturas,asignadas,disponibles,resultado,count_reserv,cant_inv_asig,cant_inv_no_asig,cant_inv_t,cant_fall
long 	 	CAP,por_asig,count_por_asig_tot,count_por_asig,count_por_asig_cont
string 	nombre_parque

id_parque 	= w_plano_sector_parque.id_parque
gf_centrar(w_reseumen_porcentaje)
f_valida_objeto()
SELECT 	"BASE_PLANI"."CODIGO_PRODUCTO"  
INTO 		:gs_producto  
FROM 	"BASE_PLANI"  
WHERE 	( "BASE_PLANI"."SECTOR" = :gs_sector ) AND  
			( "BASE_PLANI"."COD_PARQUE" = :id_parque )   ;

w_plano_sector_parque.dw_plano_sector_parque.enabled = false
if	w_plano_sector_parque.dw_plano_sector_parque.dataobject = 'dw_plano_sector_parque_retrieve' or &
	w_plano_sector_parque.dw_plano_sector_parque.dataobject = 'dw_plano_sector_parque_retrieve_paint' then
	SELECT 	distinct count(1) 
	INTO 		:fallecidos  
	FROM 	"FALLECIDOS" 
	WHERE 	( "FALLECIDOS"."SECTOR" = :gs_sector ) and ("FALLECIDOS"."COD_PARQUE" = :id_parque)  and ("FALLECIDOS"."ESTADO_REG" = 'A');
	
	SELECT 	count(1) 
	INTO 		:count_reserv 
	FROM 	"RESERVA_SEPULTURA" 
	WHERE 	( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND ( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) and ("RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque) ;
	
	SELECT 	count(1) INTO :asignadas   FROM "INVENTARIO_PLANI" WHERE "INVENTARIO_PLANI"."NUMERO" > 0 and ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) and ("INVENTARIO_PLANI"."COD_PARQUE" = :id_parque) ;
	
	SELECT 	count(1) INTO :sepulturas  FROM "INVENTARIO_PLANI" 	WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) and ("INVENTARIO_PLANI"."COD_PARQUE" = :id_parque)  ; 
	
	SELECT	count(1)  
	INTO 		:cant_inv_no_asig 
	FROM 	"INVENTARIO_PLANI"  
	WHERE 	( "INVENTARIO_PLANI"."NUMERO" = 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )  and ("INVENTARIO_PLANI"."COD_PARQUE" = :id_parque) ; 
	
	SELECT 	count(1)  
	INTO 		:cant_inv_t 
	FROM 	"INVENTARIO_PLANI"  
	WHERE 	( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) and ("INVENTARIO_PLANI"."COD_PARQUE" = :id_parque)  ; 
	
   	SELECT 	sum( "INVENTARIO_PLANI"."CAPACIDAD")  into :cap  FROM "INVENTARIO_PLANI"  WHERE "INVENTARIO_PLANI"."SECTOR" = :gs_sector  and ("INVENTARIO_PLANI"."COD_PARQUE" = :id_parque)   ;
	
	if gs_producto='SE' then
		SELECT 	count(1)  
		into 		:por_asig 
		FROM 	"CADENA", "OFERTA_V", "PAGO_OFERTA"  
		WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = 'O' ) AND  
					( "PAGO_OFERTA"."SEPULTURA" = '0' ) AND  
					( "PAGO_OFERTA"."SECTOR" = :gs_sector ) and 
					("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C')   and ("CADENA"."COD_PARQUE" = :id_parque)  ;
	elseif gs_producto='CO' then
		SELECT 	count(1)  
		into 		:por_asig 
		FROM 	"CADENA", "OFERTA_V", "PAGO_OFERTA"  
		WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = 'U' ) AND  
					( "PAGO_OFERTA"."SEPULTURA" = '0' ) AND  
					( "PAGO_OFERTA"."SECTOR" = :gs_sector ) and 
					("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C')   and ("CADENA"."COD_PARQUE" = :id_parque)  ;
	end if
	dw_2.settransobject(sqlca)
	if dw_2.retrieve(gs_sector)> 0 then
		cant_fall = dw_2.getitemnumber(1,'compute_1')
	else
		cant_fall = 0
	end if
//---------------------------------------------------------------------------------------------------------------------------------------------------	
	dw_1.object.t_2.text = 'Resumen de Planimetria ( '+'Sector: '+gs_sector+' )'
	
	SELECT "COD_PARQ"."NOMBRE" into :nombre_parque FROM "COD_PARQ"  WHERE "COD_PARQ"."CODIGO" = :id_parque  ;
	
	dw_1.object.t_3.text = 'Parque ' +nombre_parque
	
	dw_1.object.t_4.text = 'Sepulturas c/fall. '+string(fallecidos,'###,###,##0')+' ( '+string((fallecidos*100)/cap,'##0.00')+' % de Cap.)'//sepulturas
	                 // Total Sepulturas Parque
	dw_1.object.t_5.text = 'Total Sepulturas Sector'
	dw_1.object.t_6.text = string(sepulturas,'###,###,###,###')
	dw_1.object.t_7.text = string(100,'###.00')
	
	dw_1.insertrow(0)// Sepulturas Asignadas
	dw_1.setitem(dw_1.rowcount(),'sep','Sep. Asignadas')
	dw_1.setitem(dw_1.rowcount(),'numero',asignadas)
	dw_1.setitem(dw_1.rowcount(),'porc',double((asignadas*100)/sepulturas))
	dw_1.setitem(dw_1.rowcount(),'total',0)

	dw_1.insertrow(0)//Sepulturas Reservadas
	dw_1.setitem(dw_1.rowcount(),'sep','Sep. Reservadas')
	dw_1.setitem(dw_1.rowcount(),'numero',count_reserv)
	dw_1.setitem(dw_1.rowcount(),'porc',double((count_reserv*100)/sepulturas))
	dw_1.setitem(dw_1.rowcount(),'total',0)
	
	dw_1.insertrow(0)//Sepulturas Por Asignar
	dw_1.setitem(dw_1.rowcount(),'sep','Sep. por Asignar')
	dw_1.setitem(dw_1.rowcount(),'numero',por_asig)
	dw_1.setitem(dw_1.rowcount(),'porc',double((por_asig*100)/sepulturas))
	dw_1.setitem(dw_1.rowcount(),'total',0)
		
	dw_1.insertrow(0)// Sepulturas Disponibles
	dw_1.setitem(dw_1.rowcount(),'sep','Sep. Disponibles')
	dw_1.setitem(dw_1.rowcount(),'numero',sepulturas - (count_reserv + asignadas + por_asig))
	dw_1.setitem(dw_1.rowcount(),'porc',double(((sepulturas - (count_reserv + asignadas + por_asig)) * 100 ) / sepulturas))
	dw_1.setitem(dw_1.rowcount(),'total',(count_reserv + asignadas + por_asig) )
	dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario		
//---------------------------------------------------------------------------------------------------------------------------------------------------	
else
	if gs_producto='SE' then
		SELECT 	count(1) 
		INTO 		:count_reserv 
		FROM 	"RESERVA_SEPULTURA" 
		WHERE ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) and ( "RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque ) and ( "RESERVA_SEPULTURA"."BASE" <> 'U' );
		
		SELECT 	distinct count(1) 
		INTO 		:fallecidos  
		FROM 	"FALLECIDOS" 
		WHERE  ( "FALLECIDOS"."COD_PARQUE" = :id_parque and "FALLECIDOS"."BASE" <> 'U' and "FALLECIDOS"."ESTADO_REG" = 'A') ;
		
		SELECT 	count(1) INTO :disponibles FROM "INVENTARIO_PLANI" WHERE "INVENTARIO_PLANI"."NUMERO" = 0 AND "INVENTARIO_PLANI"."BASE" <>'U' AND ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) ;
		
		SELECT 	count(1) INTO :asignadas   FROM "INVENTARIO_PLANI" WHERE "INVENTARIO_PLANI"."NUMERO" > 0  AND "INVENTARIO_PLANI"."BASE" <>'U' AND ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) ;
		
		SELECT 	count(1) INTO :sepulturas  FROM "INVENTARIO_PLANI" WHERE ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque AND "INVENTARIO_PLANI"."BASE" <>'U' ) ;
		
		SELECT 	sum(CAPACIDAD) INTO :cap FROM "INVENTARIO_PLANI" WHERE ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque AND "INVENTARIO_PLANI"."BASE" <>'U' ) ; 
		
		SELECT 	sum( "INVENTARIO_PLANI"."CAPACIDAD")  into :cap  FROM "INVENTARIO_PLANI" WHERE ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque AND "INVENTARIO_PLANI"."BASE" <>'U' ) ;
		
		SELECT 	count(1)  
		into 		:por_asig 
		FROM 	"CADENA", "OFERTA_V",   "PAGO_OFERTA"  
			WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = 'O' ) AND  
					( "PAGO_OFERTA"."SEPULTURA" = '0' ) AND  
					("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C')  AND ( "CADENA"."COD_PARQUE" = :id_parque ) ;
		count_por_asig_cont = 0
		SELECT 	count(1)  
		into 		:count_por_asig_cont
		FROM 	"BASE_PLANI","CADENA","CONTRATO"  
		WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					( "CONTRATO"."SECTOR" = "BASE_PLANI"."SECTOR" ) and  
					( ( "CADENA"."CODIGO" = 'C' ) AND  
					("CADENA"."ESTADO" = 'V' OR  "CADENA"."ESTADO" = 'C') AND  
					"CONTRATO"."SEPULTURA" = '0'  ) AND ( "CADENA"."COD_PARQUE" = :id_parque ) ;
	elseif gs_producto='CO' then
		SELECT 	count(1) 
		INTO 		:count_reserv 
		FROM 	"RESERVA_SEPULTURA" 
		WHERE ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) and ( "RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque ) and ( "RESERVA_SEPULTURA"."BASE" = 'U' );
		
		SELECT 	distinct count(1) 
		INTO 		:fallecidos  
		FROM 	"FALLECIDOS" 
		WHERE  ( "FALLECIDOS"."COD_PARQUE" = :id_parque and "FALLECIDOS"."BASE" = 'U' and "FALLECIDOS"."ESTADO_REG" = 'A') ;
		
		SELECT 	count(1) INTO :disponibles FROM "INVENTARIO_PLANI" WHERE "INVENTARIO_PLANI"."NUMERO" = 0 AND "INVENTARIO_PLANI"."BASE" = 'U' AND ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) ;
		
		SELECT 	count(1) INTO :asignadas   FROM "INVENTARIO_PLANI" WHERE "INVENTARIO_PLANI"."NUMERO" > 0  AND "INVENTARIO_PLANI"."BASE" = 'U' AND ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) ;
		
		SELECT 	count(1) INTO :sepulturas  FROM "INVENTARIO_PLANI" WHERE ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque AND "INVENTARIO_PLANI"."BASE" = 'U' ) ;
		
		SELECT 	sum(CAPACIDAD) INTO :cap FROM "INVENTARIO_PLANI" WHERE ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque AND "INVENTARIO_PLANI"."BASE" = 'U' ) ; 
		
		SELECT 	sum( "INVENTARIO_PLANI"."CAPACIDAD")  into :cap  FROM "INVENTARIO_PLANI" WHERE ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque AND "INVENTARIO_PLANI"."BASE" = 'U' ) ;
		
		SELECT 	count(1)  
		into 		:por_asig 
		FROM 	"CADENA", "OFERTA_V",   "PAGO_OFERTA"  
		WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = 'U' ) AND  
					( "PAGO_OFERTA"."SEPULTURA" = '0' ) AND  
					("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C')  AND ( "CADENA"."COD_PARQUE" = :id_parque ) ;
		count_por_asig_cont = 0
//		SELECT 	count(1)  
//		into 		:count_por_asig_cont
//		FROM 	"BASE_PLANI","CADENA","CONTRATO"  
//		WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
//					( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
//					( "CONTRATO"."SECTOR" = "BASE_PLANI"."SECTOR" ) and  
//					( ( "CADENA"."CODIGO" = 'C' ) AND  
//					("CADENA"."ESTADO" = 'V' OR  "CADENA"."ESTADO" = 'C') AND  
//					"CONTRATO"."SEPULTURA" = '0'  ) AND ( "CADENA"."COD_PARQUE" = :id_parque ) ;
	end if
	dw_1.object.t_2.text = 'Resumen de Planimetria '
	
	SELECT "COD_PARQ"."NOMBRE" into :nombre_parque FROM "COD_PARQ"  WHERE "COD_PARQ"."CODIGO" = :id_parque  ;
	dw_1.object.t_3.text = 'Parque ' +nombre_parque
	
	dw_1.object.t_4.text = 'Sepulturas c/fall. '+string(fallecidos,'###,###,##0')+' ( '+string((fallecidos*100)/cap,'##0.00')+' % de Cap.)'//sepulturas
	                 // Total Sepulturas Parque
	dw_1.object.t_5.text = 'Total Sepulturas Parque'
	dw_1.object.t_6.text = string(sepulturas,'###,###,###,###')
	dw_1.object.t_7.text = string(double((sepulturas*100)/sepulturas),'###.00')
	
	dw_1.insertrow(0)// Sepulturas Asignadas
	dw_1.setitem(dw_1.rowcount(),'sep','Sep. Asignadas')
	dw_1.setitem(dw_1.rowcount(),'numero',asignadas)
	dw_1.setitem(dw_1.rowcount(),'porc',double((asignadas*100)/sepulturas))
	dw_1.setitem(dw_1.rowcount(),'total',0)

	dw_1.insertrow(0)//Sepulturas Reservadas
	dw_1.setitem(dw_1.rowcount(),'sep','Sep. Reservadas')
	dw_1.setitem(dw_1.rowcount(),'numero',count_reserv)
	dw_1.setitem(dw_1.rowcount(),'porc',double((count_reserv*100)/sepulturas))
	dw_1.setitem(dw_1.rowcount(),'total',0)
	
	dw_1.insertrow(0)//Sepulturas Por Asignar Pormesa
	dw_1.setitem(dw_1.rowcount(),'sep','Promesas por Asignar')
	dw_1.setitem(dw_1.rowcount(),'numero',por_asig)
	dw_1.setitem(dw_1.rowcount(),'porc',double((por_asig*100)/sepulturas))
	dw_1.setitem(dw_1.rowcount(),'total',0)
		
	dw_1.insertrow(0)//Sepulturas Por Asignar Contrato
	dw_1.setitem(dw_1.rowcount(),'sep','Contratos ISA por Asignar')
	dw_1.setitem(dw_1.rowcount(),'numero',count_por_asig_cont)
	dw_1.setitem(dw_1.rowcount(),'porc',double((count_por_asig_cont*100)/sepulturas))
	dw_1.setitem(dw_1.rowcount(),'total',0)
		
	dw_1.insertrow(0)// Sepulturas Disponibles
	dw_1.setitem(dw_1.rowcount(),'sep','Sep. Disponibles')
	dw_1.setitem(dw_1.rowcount(),'numero',sepulturas - (count_reserv + asignadas + por_asig + count_por_asig_cont))
	dw_1.setitem(dw_1.rowcount(),'porc',double(((sepulturas - (count_reserv + asignadas + por_asig + count_por_asig_cont)) * 100 ) / sepulturas))
	dw_1.setitem(dw_1.rowcount(),'total',(count_reserv + asignadas + por_asig + count_por_asig_cont) )
	dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario	
end if
end event

event mousemove;st_1.visible = false
end event

type st_1 from statictext within w_reseumen_porcentaje
integer x = 1637
integer y = 2120
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 30867188
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_reseumen_porcentaje
integer x = 2693
integer y = 384
integer width = 411
integer height = 432
integer taborder = 30
string title = "none"
string dataobject = "dw_cant_fall_resumen"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_2 from picturebutton within w_reseumen_porcentaje
event mousemove pbm_mousemove
integer x = 2066
integer y = 2064
integer width = 128
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Print.bmp"
alignment htextalign = left!
end type

event mousemove;st_1.text = 'Imprimir'
st_1.visible = true
st_1.x = 1655
st_1.y = 1992
end event

event clicked;st_1.visible = false
if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if

end event

type pb_1 from picturebutton within w_reseumen_porcentaje
event mousemove pbm_mousemove
integer x = 2062
integer y = 2188
integer width = 128
integer height = 104
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

event mousemove;st_1.text = 'Cerrar'
st_1.visible = true
st_1.x = 1637
st_1.y = 2120
end event

event clicked;st_1.visible = false
w_plano_sector_parque.dw_plano_sector_parque.enabled = true
close(w_reseumen_porcentaje)
end event

type dw_1 from datawindow within w_reseumen_porcentaje
event mousemove pbm_dwnmousemove
integer x = 50
integer y = 36
integer width = 1957
integer height = 2256
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_porcentaje_sep"
borderstyle borderstyle = stylelowered!
end type

event mousemove;st_1.visible = false
end event

