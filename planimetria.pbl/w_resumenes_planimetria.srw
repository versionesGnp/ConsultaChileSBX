forward
global type w_resumenes_planimetria from window
end type
type dw_producto from datawindow within w_resumenes_planimetria
end type
type dw_fecha_invent from datawindow within w_resumenes_planimetria
end type
type pb_4 from picturebutton within w_resumenes_planimetria
end type
type pb_3 from picturebutton within w_resumenes_planimetria
end type
type pb_2 from picturebutton within w_resumenes_planimetria
end type
type pb_1 from picturebutton within w_resumenes_planimetria
end type
type cbx_1 from checkbox within w_resumenes_planimetria
end type
type lb_1 from listbox within w_resumenes_planimetria
end type
type dw_2 from datawindow within w_resumenes_planimetria
end type
type cb_5 from commandbutton within w_resumenes_planimetria
end type
type st_1 from statictext within w_resumenes_planimetria
end type
type cb_4 from commandbutton within w_resumenes_planimetria
end type
type cb_3 from commandbutton within w_resumenes_planimetria
end type
type dw_1 from datawindow within w_resumenes_planimetria
end type
type cb_2 from commandbutton within w_resumenes_planimetria
end type
type cb_1 from commandbutton within w_resumenes_planimetria
end type
type gb_1 from groupbox within w_resumenes_planimetria
end type
end forward

global type w_resumenes_planimetria from window
integer width = 3986
integer height = 1912
boolean titlebar = true
string title = "Informes de Gestión de Planimetria"
long backcolor = 67108864
boolean clientedge = true
dw_producto dw_producto
dw_fecha_invent dw_fecha_invent
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
cbx_1 cbx_1
lb_1 lb_1
dw_2 dw_2
cb_5 cb_5
st_1 st_1
cb_4 cb_4
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_resumenes_planimetria w_resumenes_planimetria

type variables
integer id_parque
end variables

forward prototypes
public function integer wf_mensaje (ref datawindow dw_paso)
public function long f_inv_sepul (long al_parque, datetime adt_fecha_cierre)
end prototypes

public function integer wf_mensaje (ref datawindow dw_paso);if dw_paso.rowcount() = 0 then
	dw_paso.dataobject = 'dw_no_hay_datos'
//	messagebox('No hay Datos','No existen Información',information!)
end if
return 1

end function

public function long f_inv_sepul (long al_parque, datetime adt_fecha_cierre);string	ls_area
long	ll_ctto_nasig,ll_cant_cont,ll_cant_prom,ll_prom_nasig,ll_prom_falle,ll_cont_falle,ll_cant_castigo,ll_inventario,&
		ll_cant_areas,ll_sepul_dest_colec,ll_cont_aso_colec,ll_reser_tec,ll_total,ll_reser_tec_area
if gs_producto='SE' then
	SELECT 	count("CADENA"."NUMERO")  
	INTO 	 	:ll_ctto_nasig  
	FROM 	"CADENA","CONTRATO"  
	WHERE  	"CADENA"."SERIE" = "CONTRATO"."SERIE_C" and  
				"CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" and   
				"CADENA"."CODIGO" = 'C'  AND
				"CADENA"."COD_PARQUE" = :al_parque AND
				( "CADENA"."ESTADO" = 'C' OR  
				"CADENA"."ESTADO" = 'V' OR  
				"CADENA"."ESTADO" = 'T' OR  
				"CADENA"."ESTADO" = 'S' ) and
				"CONTRATO"."SEPULTURA" = '0'	;
	
	SELECT 	count("CADENA"."NUMERO")  
	INTO 	 	:ll_cant_cont  
	FROM 	"BASE_PLANI","CADENA","CONTRATO"  
	WHERE 	"CADENA"."SERIE" = "CONTRATO"."SERIE_C" and  
				"CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" and  
				"CONTRATO"."SECTOR" = "BASE_PLANI"."SECTOR" and  
				"CADENA"."COD_PARQUE" = "BASE_PLANI"."COD_PARQUE"  and
				"CADENA"."CODIGO" = 'C'  AND
				"CADENA"."COD_PARQUE" = :al_parque AND
				( "CADENA"."ESTADO" = 'C' OR  
				"CADENA"."ESTADO" = 'V' OR  
				"CADENA"."ESTADO" = 'T' OR  
				"CADENA"."ESTADO" = 'S' ) AND
				"CONTRATO"."SEPULTURA" > '0';
				
	 
	SELECT DISTINCT count( "CADENA"."NUMERO")
	INTO 		:ll_cant_prom
	FROM 	"BASE_PLANI","CADENA","FACTURA_OFERTA","OFERTA_V","PAGO_OFERTA"  
	WHERE  	"CADENA"."CODIGO" = "FACTURA_OFERTA"."BASE" and  
				"CADENA"."SERIE" = "FACTURA_OFERTA"."SERIE" and  
				"CADENA"."NUMERO" = "FACTURA_OFERTA"."NUMERO" and
				"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
				"BASE_PLANI"."SECTOR" = "PAGO_OFERTA"."SECTOR" and  
				"BASE_PLANI"."COD_PARQUE" = "CADENA"."COD_PARQUE"   and
				"CADENA"."CODIGO" = 'O' AND  
				"CADENA"."COD_PARQUE" = :al_parque AND
				"FACTURA_OFERTA"."FECHA_CIERRE" = :adt_fecha_cierre AND
				("FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S' ) and
				( "PAGO_OFERTA"."SEPULTURA" > '0' );
				
	SELECT 	count("CADENA"."NUMERO")
	INTO 	 	:ll_prom_nasig  
	FROM 	"CADENA","OFERTA_V","PAGO_OFERTA","FACTURA_OFERTA"  
	WHERE  	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
				"PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" and  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and
				"CADENA"."CODIGO" = "FACTURA_OFERTA"."BASE" and  
				"CADENA"."SERIE" = "FACTURA_OFERTA"."SERIE" and  
				"CADENA"."NUMERO" = "FACTURA_OFERTA"."NUMERO" and
				"CADENA"."CODIGO" = 'O' AND  
				"CADENA"."COD_PARQUE" = :al_parque AND
				"FACTURA_OFERTA"."FECHA_CIERRE" = :adt_fecha_cierre AND
				("FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S' ) AND
				( "PAGO_OFERTA"."SEPULTURA" = '0');
	
	SELECT 	Count("CADENA"."NUMERO")  
	INTO 	 	:ll_prom_falle  
	FROM	 	"CADENA","CADENA_MORA","OFERTA_V","PAGO_OFERTA"  
	WHERE  "CADENA"."SERIE" = "CADENA_MORA"."SERIE" and  
				"CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" and  
				"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
				"CADENA"."CODIGO" = 'O' AND  
				"CADENA"."COD_PARQUE" = :al_parque AND  
				"CADENA_MORA"."FALLECIDOS" > 0  AND  
				( "CADENA"."ESTADO" = 'N'  OR  
				"CADENA"."ESTADO" = 'R'  OR  
				"CADENA"."ESTADO" = 'P'  OR  
				"CADENA"."ESTADO" = 'D'  OR  
				"CADENA"."ESTADO" = 'A' ); 
	
	SELECT 	Count("CADENA"."NUMERO")   
	INTO 	 	:ll_cont_falle 
	FROM 	"BASE_PLANI","CADENA","CADENA_MORA","CONTRATO"  
	WHERE  	"CADENA"."CODIGO" = "CADENA_MORA"."BASE" and  
				"CADENA"."SERIE" = "CADENA_MORA"."SERIE" and  
				"CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" and  
				"CADENA"."SERIE" = "CONTRATO"."SERIE_C" and  
				"CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" and  
				"BASE_PLANI"."SECTOR" = "CONTRATO"."SECTOR" and  
				"CADENA"."COD_PARQUE" = "BASE_PLANI"."COD_PARQUE" and
				"CADENA"."CODIGO" = 'C' AND  
				"CADENA"."COD_PARQUE" = :al_parque AND  
				"CADENA_MORA"."FALLECIDOS" > 0 AND  
				( "CADENA"."ESTADO" = 'N' OR  
				"CADENA"."ESTADO" = 'R' OR  
				"CADENA"."ESTADO" = 'P' OR  
				"CADENA"."ESTADO" = 'D' OR  
				"CADENA"."ESTADO" = 'A' )  ;	
	
	SELECT 	Count("CADENA"."NUMERO")  
	INTO 		:ll_cant_castigo  
	FROM 	"CADENA"  
	WHERE  	"CADENA"."CODIGO" = 'O' AND 
				("CADENA"."ESTADO" = 'C' OR "CADENA"."ESTADO" = 'V') AND 
				"CADENA"."ESTADO_CONTABLE" = 'C' AND  "CADENA"."COD_PARQUE" = :al_parque;
	
	SELECT 	Count("INVENTARIO_PLANI"."SEPULTURA")
	INTO	 	:ll_inventario  
	FROM	 	"INVENTARIO_PLANI"
	WHERE  	"INVENTARIO_PLANI"."COD_PARQUE" = :al_parque and
				"INVENTARIO_PLANI"."BASE" <> 'U' AND
				"INVENTARIO_PLANI"."SECTOR" <> 'Z100';  // EXCLUYO INVENTARIO POR HABILITAR
	
	SELECT 	COUNT( DISTINCT  "FOSA_COMUN"."SEPULTURA")
	INTO	 	:ll_cant_areas
	FROM	 	"FOSA_COMUN"
	WHERE  	"FOSA_COMUN"."COD_PARQUE" = :al_parque AND
				"FOSA_COMUN"."BASE" <> 'U'; 
	
	SELECT 	count( Distinct  "PAGO_OFERTA"."SEPULTURA")
	INTO	 	:ll_sepul_dest_colec	
	FROM	 	"CADENA","OFERTA_V","PAGO_OFERTA"  
	WHERE 	"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and 
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and 
				"CADENA"."SERIE" = "OFERTA_V"."SERIE" and 
				"CADENA"."CODIGO" = 'O' AND	
				( "CADENA"."ESTADO" = 'C'  OR  "CADENA"."ESTADO" = 'V' ) AND 
				"OFERTA_V"."TIPO_SEPULT" = '4'  AND "CADENA"."COD_PARQUE" = :al_parque ;
	
	SELECT 	SUM (count( Distinct "PAGO_OFERTA"."NRO_OFERTA"))
	INTO	 	:ll_cont_aso_colec 
	FROM	 	"CADENA","OFERTA_V","PAGO_OFERTA"  
	WHERE 	"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and 
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and 
				"CADENA"."SERIE" = "OFERTA_V"."SERIE" and 
				"CADENA"."CODIGO" = 'O' AND	
				( "CADENA"."ESTADO" = 'C'  OR  "CADENA"."ESTADO" = 'V' ) AND 
				"OFERTA_V"."TIPO_SEPULT" = '4'  AND "CADENA"."COD_PARQUE" = :al_parque 
	GROUP BY "CADENA"."SERIE";
	if isnull(ll_cont_aso_colec) then ll_cont_aso_colec = 0
	ll_reser_tec				 	= 0
	ll_reser_tec_area			= 0
	//if al_parque = 102 then
		DECLARE x1 CURSOR FOR  
		SELECT 	DISTINCT "RESERVA_SEPULTURA"."AREA"   
		FROM 	"RESERVA_SEPULTURA"
		WHERE 	"RESERVA_SEPULTURA"."COD_PARQUE" = :al_parque AND
					"RESERVA_SEPULTURA"."BASE" <> 'U'
		USING	sqlca;
		if sqlca.sqlcode=0 then
			open x1;
			do while sqlca.sqlcode=0
				fetch x1 into :ls_area;
					if not isnull(ls_area) then
						SELECT 	Count(DISTINCT"RESERVA_SEPULTURA"."SEPULTURA")  
						INTO 		:ll_reser_tec_area  
						FROM  	"RESERVA_SEPULTURA"  
						WHERE 	("RESERVA_SEPULTURA"."ESTADO" = '4' OR
									"RESERVA_SEPULTURA"."ESTADO" = '5' OR
									"RESERVA_SEPULTURA"."ESTADO" = '7') AND
									"RESERVA_SEPULTURA"."AREA" = :ls_area AND
									"RESERVA_SEPULTURA"."COD_PARQUE" = :al_parque;
			
						ll_reser_tec	= ll_reser_tec_area + ll_reser_tec		
					end if
				Setnull(ls_area);
			loop
			close x1;
		end if	
	//else	
	//	SELECT 	Count(DISTINCT"RESERVA_SEPULTURA"."SEPULTURA")  
	//	INTO 		:ll_reser_tec  
	//	FROM  	"RESERVA_SEPULTURA"  
	//	WHERE 	("RESERVA_SEPULTURA"."ESTADO" = '4' OR
	//				"RESERVA_SEPULTURA"."ESTADO" = '5' OR
	//				"RESERVA_SEPULTURA"."ESTADO" = '7') AND 
	//				"RESERVA_SEPULTURA"."COD_PARQUE" = :al_parque;
	//end if				
elseif gs_producto='CO' then
	ll_ctto_nasig		= 0
//	SELECT 	count("CADENA"."NUMERO")  
//	INTO 	 	:ll_ctto_nasig  
//	FROM 	"CADENA","CONTRATO"  
//	WHERE  	"CADENA"."SERIE" = "CONTRATO"."SERIE_C" and  
//				"CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" and   
//				"CADENA"."CODIGO" = 'C'  AND
//				"CADENA"."COD_PARQUE" = :al_parque AND
//				( "CADENA"."ESTADO" = 'C' OR  
//				"CADENA"."ESTADO" = 'V' OR  
//				"CADENA"."ESTADO" = 'T' OR  
//				"CADENA"."ESTADO" = 'S' ) and
//				"CONTRATO"."SEPULTURA" = '0'	;
	ll_cant_cont		= 0
//	SELECT 	count("CADENA"."NUMERO")  
//	INTO 	 	:ll_cant_cont  
//	FROM 	"BASE_PLANI","CADENA","CONTRATO"  
//	WHERE 	"CADENA"."SERIE" = "CONTRATO"."SERIE_C" and  
//				"CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" and  
//				"CONTRATO"."SECTOR" = "BASE_PLANI"."SECTOR" and  
//				"CADENA"."COD_PARQUE" = "BASE_PLANI"."COD_PARQUE"  and
//				"CADENA"."CODIGO" = 'C'  AND
//				"CADENA"."COD_PARQUE" = :al_parque AND
//				( "CADENA"."ESTADO" = 'C' OR  
//				"CADENA"."ESTADO" = 'V' OR  
//				"CADENA"."ESTADO" = 'T' OR  
//				"CADENA"."ESTADO" = 'S' ) AND
//				"CONTRATO"."SEPULTURA" > '0';
				
	 
	SELECT DISTINCT count( "CADENA"."NUMERO")
	INTO 		:ll_cant_prom
	FROM 	"BASE_PLANI","CADENA","FACTURA_OFERTA","OFERTA_V","PAGO_OFERTA"  
	WHERE  	"CADENA"."CODIGO" = "FACTURA_OFERTA"."BASE" and  
				"CADENA"."SERIE" = "FACTURA_OFERTA"."SERIE" and  
				"CADENA"."NUMERO" = "FACTURA_OFERTA"."NUMERO" and
				"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
				"BASE_PLANI"."SECTOR" = "PAGO_OFERTA"."SECTOR" and  
				"BASE_PLANI"."COD_PARQUE" = "CADENA"."COD_PARQUE"   and
				"CADENA"."CODIGO" = 'U' AND  
				"CADENA"."COD_PARQUE" = :al_parque AND
				"FACTURA_OFERTA"."FECHA_CIERRE" = :adt_fecha_cierre AND
				("FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S' ) and
				( "PAGO_OFERTA"."SEPULTURA" > '0' );
				
	SELECT 	count("CADENA"."NUMERO")
	INTO 	 	:ll_prom_nasig  
	FROM 	"CADENA","OFERTA_V","PAGO_OFERTA","FACTURA_OFERTA"  
	WHERE  	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
				"PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" and  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and
				"CADENA"."CODIGO" = "FACTURA_OFERTA"."BASE" and  
				"CADENA"."SERIE" = "FACTURA_OFERTA"."SERIE" and  
				"CADENA"."NUMERO" = "FACTURA_OFERTA"."NUMERO" and
				"CADENA"."CODIGO" = 'U' AND  
				"CADENA"."COD_PARQUE" = :al_parque AND
				"FACTURA_OFERTA"."FECHA_CIERRE" = :adt_fecha_cierre AND
				("FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S' ) AND
				( "PAGO_OFERTA"."SEPULTURA" = '0');
	
	SELECT 	Count("CADENA"."NUMERO")  
	INTO 	 	:ll_prom_falle  
	FROM	 	"CADENA","CADENA_MORA","OFERTA_V","PAGO_OFERTA"  
	WHERE  "CADENA"."SERIE" = "CADENA_MORA"."SERIE" and  
				"CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" and  
				"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
				"CADENA"."CODIGO" = 'U' AND  
				"CADENA"."COD_PARQUE" = :al_parque AND  
				"CADENA_MORA"."FALLECIDOS" > 0  AND  
				( "CADENA"."ESTADO" = 'N'  OR  
				"CADENA"."ESTADO" = 'R'  OR  
				"CADENA"."ESTADO" = 'P'  OR  
				"CADENA"."ESTADO" = 'D'  OR  
				"CADENA"."ESTADO" = 'A' ); 
	
	ll_cont_falle		= 0
//	SELECT 	Count("CADENA"."NUMERO")   
//	INTO 	 	:ll_cont_falle 
//	FROM 	"BASE_PLANI","CADENA","CADENA_MORA","CONTRATO"  
//	WHERE  	"CADENA"."CODIGO" = "CADENA_MORA"."BASE" and  
//				"CADENA"."SERIE" = "CADENA_MORA"."SERIE" and  
//				"CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" and  
//				"CADENA"."SERIE" = "CONTRATO"."SERIE_C" and  
//				"CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" and  
//				"BASE_PLANI"."SECTOR" = "CONTRATO"."SECTOR" and  
//				"CADENA"."COD_PARQUE" = "BASE_PLANI"."COD_PARQUE" and
//				"CADENA"."CODIGO" = 'C' AND  
//				"CADENA"."COD_PARQUE" = :al_parque AND  
//				"CADENA_MORA"."FALLECIDOS" > 0 AND  
//				( "CADENA"."ESTADO" = 'N' OR  
//				"CADENA"."ESTADO" = 'R' OR  
//				"CADENA"."ESTADO" = 'P' OR  
//				"CADENA"."ESTADO" = 'D' OR  
//				"CADENA"."ESTADO" = 'A' )  ;	
	
	SELECT 	Count("CADENA"."NUMERO")  
	INTO 		:ll_cant_castigo  
	FROM 	"CADENA"  
	WHERE  	"CADENA"."CODIGO" = 'U' AND 
				("CADENA"."ESTADO" = 'C' OR "CADENA"."ESTADO" = 'V') AND 
				"CADENA"."ESTADO_CONTABLE" = 'C' AND  "CADENA"."COD_PARQUE" = :al_parque;
	
	SELECT 	Count("INVENTARIO_PLANI"."SEPULTURA")
	INTO	 	:ll_inventario  
	FROM	 	"INVENTARIO_PLANI"
	WHERE  	"INVENTARIO_PLANI"."COD_PARQUE" = :al_parque and
				"INVENTARIO_PLANI"."BASE" = 'U' and
				"INVENTARIO_PLANI"."SECTOR" <> 'Z100';  // EXCLUYO INVENTARIO POR HABILITAR
	
	SELECT 	COUNT( DISTINCT  "FOSA_COMUN"."SEPULTURA")
	INTO	 	:ll_cant_areas
	FROM	 	"FOSA_COMUN"
	WHERE  	"FOSA_COMUN"."COD_PARQUE" = :al_parque AND
				"FOSA_COMUN"."BASE" <> 'U' ; 
	
	SELECT 	count( Distinct  "PAGO_OFERTA"."SEPULTURA")
	INTO	 	:ll_sepul_dest_colec	
	FROM	 	"CADENA","OFERTA_V","PAGO_OFERTA"  
	WHERE 	"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and 
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and 
				"CADENA"."SERIE" = "OFERTA_V"."SERIE" and 
				"CADENA"."CODIGO" = 'U' AND	
				( "CADENA"."ESTADO" = 'C'  OR  "CADENA"."ESTADO" = 'V' ) AND 
				"OFERTA_V"."TIPO_SEPULT" = '4'  AND "CADENA"."COD_PARQUE" = :al_parque ;
	
	SELECT 	SUM (count( Distinct "PAGO_OFERTA"."NRO_OFERTA"))
	INTO	 	:ll_cont_aso_colec 
	FROM	 	"CADENA","OFERTA_V","PAGO_OFERTA"  
	WHERE 	"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and 
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and 
				"CADENA"."SERIE" = "OFERTA_V"."SERIE" and 
				"CADENA"."CODIGO" = 'U' AND	
				( "CADENA"."ESTADO" = 'C'  OR  "CADENA"."ESTADO" = 'V' ) AND 
				"OFERTA_V"."TIPO_SEPULT" = '4'  AND "CADENA"."COD_PARQUE" = :al_parque 
	GROUP BY "CADENA"."SERIE";
	if isnull(ll_cont_aso_colec) then ll_cont_aso_colec = 0
	ll_reser_tec				 	= 0
	ll_reser_tec_area			= 0
	//if al_parque = 102 then
		DECLARE x2 CURSOR FOR  
		SELECT 	DISTINCT "RESERVA_SEPULTURA"."AREA"   
		FROM 	"RESERVA_SEPULTURA"
		WHERE 	"RESERVA_SEPULTURA"."COD_PARQUE" = :al_parque AND
					"RESERVA_SEPULTURA"."BASE" = 'U'
		USING	sqlca;
		if sqlca.sqlcode=0 then
			open x2;
			do while sqlca.sqlcode=0
				fetch x2 into :ls_area;
					if not isnull(ls_area) then
						SELECT 	Count(DISTINCT"RESERVA_SEPULTURA"."SEPULTURA")  
						INTO 		:ll_reser_tec_area  
						FROM  	"RESERVA_SEPULTURA"  
						WHERE 	("RESERVA_SEPULTURA"."ESTADO" = '4' OR
									"RESERVA_SEPULTURA"."ESTADO" = '5' OR
									"RESERVA_SEPULTURA"."ESTADO" = '7') AND
									"RESERVA_SEPULTURA"."AREA" = :ls_area AND
									"RESERVA_SEPULTURA"."COD_PARQUE" = :al_parque;
			
						ll_reser_tec	= ll_reser_tec_area + ll_reser_tec		
					end if
				Setnull(ls_area);
			loop
			close x2;
		end if	
end if
if isnull(ll_ctto_nasig) then ll_ctto_nasig = 0
if isnull(ll_cant_cont) then ll_cant_cont = 0
if isnull(ll_cant_prom) then ll_cant_prom = 0
if isnull(ll_prom_nasig) then ll_prom_nasig = 0
if isnull(ll_prom_falle) then ll_prom_falle = 0
if isnull(ll_cont_falle) then ll_cont_falle = 0
if isnull(ll_cant_castigo) then ll_cant_castigo = 0
if isnull(ll_cant_areas) then ll_cant_areas = 0
if isnull(ll_sepul_dest_colec) then ll_sepul_dest_colec = 0
if isnull(ll_reser_tec) then ll_reser_tec = 0
if isnull(ll_cont_aso_colec) then ll_cont_aso_colec = 0

ll_total		= ll_ctto_nasig+ll_cant_cont+ll_cant_prom+ll_prom_nasig+ll_prom_falle+ll_cont_falle+ll_cant_castigo+ll_cant_areas+ll_sepul_dest_colec+ll_reser_tec
ll_total		= (ll_inventario +ll_cont_aso_colec) - ll_total

return ll_total
end function

on w_resumenes_planimetria.create
this.dw_producto=create dw_producto
this.dw_fecha_invent=create dw_fecha_invent
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cbx_1=create cbx_1
this.lb_1=create lb_1
this.dw_2=create dw_2
this.cb_5=create cb_5
this.st_1=create st_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.dw_producto,&
this.dw_fecha_invent,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.cbx_1,&
this.lb_1,&
this.dw_2,&
this.cb_5,&
this.st_1,&
this.cb_4,&
this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_resumenes_planimetria.destroy
destroy(this.dw_producto)
destroy(this.dw_fecha_invent)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cbx_1)
destroy(this.lb_1)
destroy(this.dw_2)
destroy(this.cb_5)
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;Long		ll_new_p

gf_centrar(w_resumenes_planimetria)
w_plano_sector_parque.dw_plano_sector_parque.enabled = false

id_parque = integer(w_plano_sector_parque.st_parque.text)
lb_1.reset()
lb_1.additem(' 1- Resumen Stock Parque.')
lb_1.additem(' 2- Disponibilidad para Venta.')
lb_1.additem(' -------------------------------------------------------')
lb_1.additem(' 4- Listado Gral. Reservas Vigentes.')
lb_1.additem(' 5- Listado Gral. Reservas Nulas.')
lb_1.additem(' 6- Promesas No Asignadas.')
lb_1.additem(' 7- Sep.Disponibles c/Fall.(Ver)')
lb_1.additem(' 8- Sep.Disponibles c/Cont.(Ver).')
lb_1.additem(' 9- Listado Reservas Hist. por Sector.')
if not isnull(gs_sector) then
	lb_1.additem('10- Listado Disp. en Terreno Sector: '+gs_sector+'.')
else
		lb_1.additem('10- Listado Disp. en Terreno.')
end if
lb_1.additem('11- Listado Disponibilidad Total')
lb_1.additem('12- Listado Fall s/Cont.')
lb_1.additem('13- Sepulturas Individuales.')
lb_1.additem('14- Stock Supult.Indiv.por Sectores y Nivel.')
lb_1.additem('15- Promesas Resciliadas c/Fall.')
lb_1.additem('16- Nulas por Dación en Pago.')
lb_1.additem('17- Disponibles por Area y capacidad.')
if gs_depto = 'I' and not isnull(gs_sector) then
	lb_1.additem('18- Gestión Reserva '+'Sector: '+gs_sector+'.')
else
	lb_1.additem('18- Gestión Reserva.')
end if
lb_1.additem('19- Informe Disponibles Venta.')
lb_1.additem('20- Informe Inventario Sepulturas.')
lb_1.additem('21- Informe Reservas Técnicas.')

dw_producto.settransobject(sqlca)
gs_producto					= 'SE'
ll_new_p						= dw_producto.insertrow(0)
dw_producto.setitem(ll_new_p,'cod_servicio',gs_producto)
dw_producto.visible		= true
end event

type dw_producto from datawindow within w_resumenes_planimetria
integer x = 50
integer y = 60
integer width = 1184
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_base_plani_producto"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_producto.accepttext()
gs_producto			= dw_producto.getitemstring(1,'cod_servicio')
dw_1.reset()
dw_1.accepttext()
dw_producto.accepttext()
end event

type dw_fecha_invent from datawindow within w_resumenes_planimetria
boolean visible = false
integer x = 2775
integer y = 1644
integer width = 457
integer height = 108
integer taborder = 20
string title = "none"
string dataobject = "dwe_fecha_cierre_venta"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	ls_parque,ls_area
long	ll_total,ll_rt_op,ll_rt_res,ll_rt_hab,ll_rt_mun,ll_rt_op_area,ll_rt_res_area,ll_rt_hab_area,ll_rt_mun_area
datetime ldt_fecha_invent

dw_fecha_invent.accepttext ()
ldt_fecha_invent						= dw_fecha_invent.getitemdatetime(1,'fecha')
if not isnull(ldt_fecha_invent) then
	UPDATE "MORA_9_12_FECHA"
	SET "FECHA" = :ldt_fecha_invent, "COD_PARQUE" = :id_parque
	USING sqlca;
	if sqlca.sqlcode = 0 then
		commit;		
		// ACA VOY
		if gs_producto = 'SE' then
			dw_1.dataobject 	= 'dwr_inventario_sepulturas_prado'
		elseif gs_producto='CO' then
			dw_1.dataobject 	= 'dwr_inventario_sepulturas_prado_co'
		end if
		dw_1.settransobject(sqlca)
		dw_1.retrieve()
		SELECT "COD_PARQ"."NOMBRE"
		INTO 		:ls_parque
		FROM 	"COD_PARQ"
		WHERE 	"COD_PARQ"."CODIGO" = :id_parque;
		
		DECLARE x1 CURSOR FOR  
		SELECT 	DISTINCT "RESERVA_SEPULTURA"."AREA"   
		FROM 	"RESERVA_SEPULTURA"
		WHERE 	"RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque
		USING	sqlca;
		ll_rt_op		= 0
		ll_rt_res		= 0
		ll_rt_hab		= 0
		ll_rt_mun	= 0
		if sqlca.sqlcode=0 then
			open x1;
			do while sqlca.sqlcode=0
				fetch x1 into :ls_area;
					if not isnull(ls_area) then
						SELECT 	Count(DISTINCT"RESERVA_SEPULTURA"."SEPULTURA")  
						INTO 		:ll_rt_op_area  
						FROM  	"RESERVA_SEPULTURA"  
						WHERE 	"RESERVA_SEPULTURA"."ESTADO" = '4' AND
									"RESERVA_SEPULTURA"."AREA" = :ls_area AND
									"RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque;
									  
						SELECT 	Count(DISTINCT"RESERVA_SEPULTURA"."SEPULTURA")  
						INTO 		:ll_rt_res_area  
						FROM  	"RESERVA_SEPULTURA"  
						WHERE 	"RESERVA_SEPULTURA"."ESTADO" = '5' AND 
									"RESERVA_SEPULTURA"."AREA" = :ls_area AND
									"RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque;			  
									  
						SELECT 	Count(DISTINCT"RESERVA_SEPULTURA"."SEPULTURA")  
						INTO 		:ll_rt_hab_area
						FROM  	"RESERVA_SEPULTURA"  
						WHERE 	"RESERVA_SEPULTURA"."ESTADO" = '6' AND
									"RESERVA_SEPULTURA"."AREA" = :ls_area AND
									"RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque;
									  
						SELECT 	Count(DISTINCT"RESERVA_SEPULTURA"."SEPULTURA")  
						INTO 		:ll_rt_mun_area
						FROM  	"RESERVA_SEPULTURA"  
						WHERE 	"RESERVA_SEPULTURA"."ESTADO" = '7' AND
									"RESERVA_SEPULTURA"."AREA" = :ls_area AND
									"RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque;			
						ll_rt_op		= ll_rt_op_area + ll_rt_op	
						ll_rt_res		= ll_rt_res_area + ll_rt_res
						ll_rt_hab		= ll_rt_hab_area + ll_rt_hab
						ll_rt_mun	= ll_rt_mun_area + ll_rt_mun
					end if
				Setnull(ls_area);
			loop
			close x1;
		end if	
		if isnull(ll_rt_op) then ll_rt_op = 0
		if isnull(ll_rt_res) then ll_rt_res = 0
		if isnull(ll_rt_hab) then ll_rt_hab = 0
		if isnull(ll_rt_mun) then ll_rt_mun = 0
		ll_total						= f_inv_sepul(id_parque,ldt_fecha_invent)
		dw_1.object.t_titulo.text	= 'INVENTARIO  DE SEPULTURAS AL '+ string(date(ldt_fecha_invent)) +' '+ls_parque
		dw_1.object.t_total.text	= string(ll_total,'###,###,###,##0')
		dw_1.object.t_tot_op.text	= string(ll_rt_op,'###,###,###,##0')
		dw_1.object.t_tot_res.text	= string(ll_rt_res,'###,###,###,##0')
		dw_1.object.t_tot_hab.text	= string(ll_rt_hab,'###,###,###,##0')
		dw_1.object.t_tot_mun.text	= string(ll_rt_mun,'###,###,###,##0')
	else
		rollback;
		Messagebox("Error","Error al Actualizar Tabla MORA_9_12_FECHA")
	end if
else
	Messagebox("Advertencia"," Debe Seleccionar Fecha")
	dw_fecha_invent.setfocus()
end if
end event

type pb_4 from picturebutton within w_resumenes_planimetria
integer x = 46
integer y = 1656
integer width = 101
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollToRow(1)
end event

type pb_3 from picturebutton within w_resumenes_planimetria
integer x = 146
integer y = 1656
integer width = 101
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Flec_iz.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollPriorPage( )
end event

type pb_2 from picturebutton within w_resumenes_planimetria
integer x = 347
integer y = 1656
integer width = 101
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollToRow(dw_1.rowcount())
end event

type pb_1 from picturebutton within w_resumenes_planimetria
integer x = 247
integer y = 1656
integer width = 101
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Flec_de.bmp"
alignment htextalign = left!
end type

event clicked;dw_1.ScrollNextPage( )
end event

type cbx_1 from checkbox within w_resumenes_planimetria
integer x = 2336
integer y = 1660
integer width = 384
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vista previa"
boolean lefttext = true
end type

event clicked;if checked = true then
	dw_1.object.datawindow.print.Preview = true
else
	dw_1.object.datawindow.print.Preview = false
end if
end event

type lb_1 from listbox within w_resumenes_planimetria
integer x = 2784
integer y = 152
integer width = 1115
integer height = 1460
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
integer tabstop[] = {0}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string 	select_string,ls_sector,ls_area,sep,area,tipo_sep,ls_descrip,base,serie,ls_string
integer 	i,j,count_reserv,count_fall
long 		count_por_asig,cap,count_reserva,asignadas,count_por_asig_cont,count_por_asig_tot
Double	numero
string 	tipo,ls_descrip_parque
long 		capacidad,count_dispo1,count_dispo2,count_dispo3,ll_count_reg,ll_count_ocupada,ll_count_disp,&
			ll_total_sep,ll_new,ll_pos

SetPointer(HourGlass!)
i = integer(mid(this.text(index),1,2))
dw_fecha_invent.visible = false
if isvalid(w_plano_sector_parque) then
	ll_pos						= pos(w_plano_sector_parque.ddlb_parque.text,'-')
	ls_descrip_parque		= trim(mid(w_plano_sector_parque.ddlb_parque.text,(ll_pos + 1)))
end if
CHOOSE CASE i
	CASE 1
		dw_1.dataobject ='dw_stock_por_sector_plani1'
		dw_2.dataobject ='dw_stock'
		dw_2.settransobject(sqlca)
		select_string = "	SELECT DISTINCT BASE_PLANI.AREA,INVENTARIO_PLANI.SECTOR,                "+&
							 " TIPO_SEPULTURA.TIPO_SEP,TIPO_SEPULTURA.DESCRIPCION,INVENTARIO_PLANI.CAPACIDAD "+&
							 "	FROM BASE_PLANI,INVENTARIO_PLANI,TIPO_SEPULTURA                         "+&
							 "	WHERE ( BASE_PLANI.TIPO_SEP = TIPO_SEPULTURA.TIPO_SEP ) and             "+&
							 "	( BASE_PLANI.SECTOR = INVENTARIO_PLANI.SECTOR )    and                  "+&
							 "	( BASE_PLANI.COD_PARQUE = INVENTARIO_PLANI.COD_PARQUE )  and            "+&
							 "	( BASE_PLANI.CODIGO_PRODUCTO = '"+gs_producto+"' )  and            "+&
							 "	( INVENTARIO_PLANI.COD_PARQUE = "+string(id_parque)+")                  "+&
							 "	ORDER BY TIPO_SEPULTURA.TIPO_SEP ASC,BASE_PLANI.AREA ASC,               "+&
							 " INVENTARIO_PLANI.CAPACIDAD ASC                                                "
							 
		PREPARE sqlsa FROM :select_string;
		
		DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
		OPEN DYNAMIC dyn_cursor;  
		IF sqlca.sqlcode < 0 THEN
			MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_ddlb_all()")
			Return -1
		END IF
		Do While sqlca.sqlcode = 0
			Fetch dyn_cursor into :ls_area,:ls_sector,:tipo_sep,:ls_descrip,:cap;
			If sqlca.sqlcode = 0 Then
				If sqlca.sqlcode = 0 Then
					ll_new	= dw_1.insertrow(0)
					dw_1.scrolltorow(ll_new)
					SELECT	COUNT("INVENTARIO_PLANI"."CORRELATIVO")  
					INTO 		:ll_count_ocupada
					FROM 		"INVENTARIO_PLANI"  
					WHERE  ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
							 ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) AND
							 ( "INVENTARIO_PLANI"."CAPACIDAD" = :cap ) AND
							 ( "INVENTARIO_PLANI"."NUMERO" > 0 )
					USING		sqlca;
					
					SELECT	COUNT("INVENTARIO_PLANI"."CORRELATIVO")  
					INTO 		:ll_count_reg  
					FROM 	"INVENTARIO_PLANI"  
					WHERE  ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND  
							 ( "INVENTARIO_PLANI"."CAPACIDAD" = :cap ) AND
							 ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) 
					USING		sqlca;
					ll_total_sep	= ll_count_reg
					ll_count_disp	= ll_count_reg - ll_count_ocupada
					dw_1.setitem(ll_new,'total_sep',ll_total_sep)
					dw_1.setitem(ll_new,'area',ls_area)
					dw_1.setitem(ll_new,'capacidad',cap)
					dw_1.setitem(ll_new,'sector'   ,ls_sector)
					dw_1.setitem(ll_new,'tipo_sep',string(tipo_sep)+'-'+ls_descrip)
					if dw_2.retrieve(ls_sector,id_parque,cap) > 0 then
						dw_1.setitem(ll_new,'sepultura',ll_count_disp - dw_2.getitemnumber(1,'compute_2'))
						dw_1.setitem(ll_new,'reserv'   ,dw_2.getitemnumber(1,'compute_2'))
					else
						dw_1.setitem(ll_new,'sepultura',ll_count_disp)
						dw_1.setitem(ll_new,'reserv'   ,0)
					end if
				end if
			ElseIf sqlca.sqlcode < 0 Then
				MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_ddlb_all()")
				Return -1
			Else
				Exit
			End If
		Loop
		Close dyn_cursor;
		dw_1.SetRedraw(false)
		dw_1.SetSort("area A, sector A, capacidad A")
		dw_1.Sort()
		dw_1.SetRedraw(true)
		if gs_producto='SE' then
			dw_1.object.t_1.text = 'Stock de Sepulturas por Sector ( '+ls_descrip_parque+' )'
		elseif gs_producto='CO' then
			dw_1.object.t_1.text = 'Stock de Columbario por Sector ( '+ls_descrip_parque+' )'
		end if
		dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario
		
	CASE 2
		dw_1.dataobject ='dw_dispon_inventario'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque,gs_producto) > 0 then
			for i = 1 to dw_1.rowcount()
				setnull(tipo_sep);setnull(area);setnull(cap)
				tipo_sep 		= dw_1.getitemstring(i,'tipo_sepultura_tipo_sep')
				area     		= dw_1.getitemstring(i,'base_plani_area_1') 
				cap      		= dw_1.getitemnumber(i,'inventario_plani_capacidad')
				//---------------------------por asignar------------------------------------
				SELECT  count(1) into :count_por_asig
				FROM 	  "OFERTA_V",	"CADENA",	"PAGO_OFERTA"  
				WHERE	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
						( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
						(("CADENA"."CODIGO" = 'O' or "CADENA"."CODIGO" = 'U') AND  
						( "CADENA"."ESTADO" = 'V' OR  
						  "CADENA"."ESTADO" = 'C') AND  
						  "PAGO_OFERTA"."SEPULTURA" = '0' AND  
						  "OFERTA_V"."TIPO_SEPULT" = :tipo_sep AND  
//						  "PAGO_OFERTA"."AREA" = :area AND  
						  "PAGO_OFERTA"."CAPACIDAD" = :cap  and
						  "CADENA"."COD_PARQUE" = :id_parque) ;
				count_por_asig_cont = 0
				if tipo_sep = '1' then
					SELECT	count(1)  into :count_por_asig_cont
					FROM 	"BASE_PLANI","CADENA","CONTRATO"  
					WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
							 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
							 ( "CONTRATO"."SECTOR" = "BASE_PLANI"."SECTOR" ) and  
							 (("CADENA"."CODIGO" = 'C' ) AND  
							 ( "CADENA"."ESTADO" = 'V' OR  
							   "CADENA"."ESTADO" = 'C') AND  
								"CONTRATO"."SEPULTURA" = '0' AND  
								"BASE_PLANI"."AREA" = :area AND  
								"BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto AND  
								"CONTRATO"."CAPACIDAD" = :cap and
								"CADENA"."COD_PARQUE" = :id_parque) ;
				end if
				//---------------------------Reservas------------------------------------
				SELECT	 count(1)  into :count_reserva
				FROM 		 "BASE_PLANI", "RESERVA_SEPULTURA"  
				WHERE   ( "BASE_PLANI"."COD_PARQUE" = "RESERVA_SEPULTURA"."COD_PARQUE") and 
						  ( "BASE_PLANI"."AREA" = "RESERVA_SEPULTURA"."AREA" ) and  
						  ( "BASE_PLANI"."SECTOR" = "RESERVA_SEPULTURA"."SECTOR" ) and  
						  (("RESERVA_SEPULTURA"."ESTADO" = 1 or "RESERVA_SEPULTURA"."ESTADO" = 4 ) AND  
						  ( "BASE_PLANI"."AREA" = :area ) AND  
						  ( "BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto ) AND  
						  ( "BASE_PLANI"."TIPO_SEP" = :tipo_sep ) AND  
						  ( "RESERVA_SEPULTURA"."CAPACIDAD" = :cap ) and ( "BASE_PLANI"."COD_PARQUE" = :id_parque )) ;
				//--------------------------Asignadas-------------------------------------
				SELECT	count(1)  into :asignadas
				FROM 		"BASE_PLANI","INVENTARIO_PLANI"  
				WHERE  ( "BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" ) and  
						 (("INVENTARIO_PLANI"."NUMERO" > 0 ) AND  
						 ( "BASE_PLANI"."TIPO_SEP" = :tipo_sep ) AND  
						 ( "BASE_PLANI"."AREA" = :area ) AND  
						 ( "BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto ) AND  
						 ( "INVENTARIO_PLANI"."CAPACIDAD" = :cap )) and 
						 ( "BASE_PLANI"."COD_PARQUE" = :id_parque ) and
						 ( "INVENTARIO_PLANI"."COD_PARQUE" =  "BASE_PLANI"."COD_PARQUE" ) and 
						 ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque );
				//---------------------------------------------------------------
				dw_1.setitem(i,'compute_0005',count_por_asig)
				dw_1.setitem(i,'compute_0007',count_reserva)
				dw_1.setitem(i,'compute_0008',asignadas)
				dw_1.setitem(i,'compute_0009',count_por_asig_cont)
				if gs_producto='SE' then
					dw_1.object.t_4.text = 'Cuadro Resumen Sepultura Inventario por Producto'
				elseif gs_producto='CO' then
					dw_1.object.t_4.text = 'Cuadro Resumen Columbario Inventario por Producto'
				end if
				dw_1.object.t_5.text = '( '+ls_descrip_parque+' ).'
			next
			dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario		
		end if		
	CASE 3
		dw_1.reset()
		/*--------------linea--------------*/
	CASE 4
		dw_1.dataobject ='dw_reservas_totales'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque,gs_producto) > 0 then
			dw_1.setfilter('estado = 1')
			dw_1.filter()
			if gs_producto='SE' then
				dw_1.object.t_1.text = 'Reservas Sepulturas Vigentes ( '+ls_descrip_parque+' ).'
			elseif gs_producto='CO' then
				dw_1.object.t_1.text = 'Reservas Columbario Vigentes ( '+ls_descrip_parque+' ).'
			end if
			dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario		
		end if
	CASE 5
		dw_1.dataobject ='dw_reservas_totales_nulas'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque,gs_producto) > 0 then
			dw_1.setfilter('estado = 2')
			dw_1.filter()
			if gs_producto='SE' then
				dw_1.object.t_1.text 	= 'Reservas Sepultura Nulas ( '+ls_descrip_parque+' ).'
			elseif gs_producto='CO' then
				dw_1.object.t_1.text 	= 'Reservas Columbario Nulas ( '+ls_descrip_parque+' ).'
			end if
			dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario		
		end if
	CASE 6
		dw_1.dataobject ='dw_promesas_no_asignadas'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque,gs_producto) > 0 then
			if gs_producto='SE' then
				dw_1.object.t_1.text 	= 'Promesas Sin Asignacón ( '+ls_descrip_parque+' ).'
			elseif gs_producto='CO' then
				dw_1.object.t_1.text 	= 'Columbarios Sin Asignacón ( '+ls_descrip_parque+' ).'
			end if
			dw_1.object.t_10.text 	= 'Usuario:'+gs_nom_comp_usuario		
		end if
	CASE 7
		dw_1.dataobject ='dw_disponble_con_fall'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque,gs_producto) > 0 then
			if gs_producto='SE' then
				dw_1.object.t_2.text 	= 'Stock de Sepulturas Disponibles c/fall.( '+ls_descrip_parque+' ).'
			elseif gs_producto='CO' then
				dw_1.object.t_2.text 	= 'Stock de Columbarios Disponibles c/fall.( '+ls_descrip_parque+' ).'
			end if
			dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario		
		end if
	CASE 8
		dw_1.dataobject ='dw_disponble_con_contrato'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque,gs_producto) > 0 then
			if gs_producto='SE' then
				dw_1.object.t_2.text 	= 'Stock de Sepulturas Disponibles c/Contratos por corregir.( '+ls_descrip_parque+' ).'
			elseif gs_producto='CO' then
				dw_1.object.t_2.text 	= 'Stock de Columbario Disponibles c/Contratos por corregir.( '+ls_descrip_parque+' ).'
			end if
			dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario		
		end if		
	CASE 9
		dw_1.dataobject ='dw_log_reservas'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque,gs_producto) > 0 then
			if gs_producto='SE' then
				dw_1.object.t_1.text = dw_1.object.t_1.text + ' Sepulturas ( '+ls_descrip_parque+' ).'
			elseif gs_producto='CO' then
				dw_1.object.t_1.text = dw_1.object.t_1.text + ' Columbario ( '+ls_descrip_parque+' ).'
			end if
			dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario		
		end if
	CASE 10
		dw_1.dataobject ='dw_formulario_reservas_terreno'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(gs_sector,id_parque,gs_producto) > 0 then
			for j = 1 to dw_1.rowcount()
				sep       = dw_1.getitemstring(j,'sepultura')
				SELECT	count(1)  into :count_reserv
				FROM 	"RESERVA_SEPULTURA"  
				WHERE  ( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) AND 
							( "RESERVA_SEPULTURA"."SEPULTURA" = :sep ) AND 
							( "RESERVA_SEPULTURA"."ESTADO" = 1 or "RESERVA_SEPULTURA"."ESTADO" = 4) ;
				if count_reserv > 0 then
					dw_1.DeleteRow(j)
					j --
				end if
			next
			if gs_producto='SE' then
				dw_1.object.t_9.text 	= dw_1.object.t_9.text + ' Sepulturas ( '+ls_descrip_parque+' ).'
			elseif gs_producto='CO' then
				dw_1.object.t_9.text 	= dw_1.object.t_9.text + ' Columbario ( '+ls_descrip_parque+' ).'
			end if
			dw_1.object.t_13.text = 'Usuario:'+gs_nom_comp_usuario		
		end if
	CASE 11
		dw_1.dataobject ='dw_formulario_reservas_total'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque,gs_producto) > 0 then
			if gs_producto='SE' then
				dw_1.object.t_9.text = dw_1.object.t_9.text + ' Sepulturas ( '+ls_descrip_parque+' ).'
			elseif gs_producto='CO' then
				dw_1.object.t_9.text = dw_1.object.t_9.text + ' Columbario ( '+ls_descrip_parque+' ).'
			end if
			dw_1.object.t_13.text = 'Usuario:'+gs_nom_comp_usuario	
		end if
	CASE 12
		if gs_producto='SE' then
			dw_1.dataobject 			= 'dw_fall_s_cont'
		elseif gs_producto='CO' then
			dw_1.dataobject 			= 'dw_fall_s_cont_co'
		end if
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque) > 0 then
			if gs_producto='SE' then
				dw_1.object.t_1.text 	= 'Fallecidos sin Contrato Sepultura ( '+ls_descrip_parque+' ).'
			elseif gs_producto='CO' then
				dw_1.object.t_1.text 	= 'Fallecidos sin Contrato Columbario ( '+ls_descrip_parque+' ).'
			end if
			dw_1.object.t_10.text 	= 'Usuario:'+gs_nom_comp_usuario		
		end if
	CASE 13
		if gs_producto='SE' then
			dw_1.dataobject 			= 'dw_individuales_informe'
		elseif gs_producto='CO' then
			dw_1.dataobject 			= 'dw_individuales_informe_co'
		end if
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque) > 0 then
			if gs_producto='SE' then
				dw_1.object.t_2.text 	= 'Fallecidos sin Contrato Sepultura ( '+ls_descrip_parque+' ).'
			elseif gs_producto='CO' then
				dw_1.object.t_2.text 	= 'Fallecidos sin Contrato Columbario ( '+ls_descrip_parque+' ).'
			end if
			dw_1.object.t_10.text 	= 'Usuario:'+gs_nom_comp_usuario		
		end if
	CASE 14
		if gs_producto='SE' then
			dw_1.dataobject 			= 'dw_disp_individuales_1'
		elseif gs_producto='CO' then
			dw_1.dataobject 			= 'dw_disp_individuales_1_co'
		end if
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque) > 0 then
			if gs_producto='SE' then
				dw_1.object.t_3.text	= 'Stock de Sepulturas Individuales'
			elseif gs_producto='CO' then
				dw_1.object.t_3.text	= 'Stock de Columbario Individuales'
			end if
			dw_1.object.t_4.text 		= 'Usuario:'+gs_nom_comp_usuario
		end if		
	CASE 15
		if gs_producto='SE' then
			dw_1.dataobject 			='dw_nulas_con_fall'
		elseif gs_producto='CO' then
			dw_1.dataobject 			='dw_nulas_con_fall_co'
		end if
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque) > 0 then
			if gs_producto='SE' then
				dw_1.object.t_4.text 	= 'Promesas Resueltas con Fallecidos'
			elseif gs_producto='CO' then
				dw_1.object.t_4.text 	= 'Columbarios Resueltas con Fallecidos'
			end if
			dw_1.object.t_5.text = 'por Sector ( '+ls_descrip_parque+' ).'
			dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario		
		end if
	CASE 16
		dw_1.dataobject ='dw_dacion_en_pago'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque,gs_producto) > 0 then
			dw_1.object.t_10.text = 'Usuario:'+gs_nom_comp_usuario		
			for i = 1 to dw_1.rowcount()
				base   = dw_1.getitemstring(i,'cadena_codigo')
				serie  = dw_1.getitemstring(i,'cadena_serie')
				numero = dw_1.getitemnumber(i,'cadena_numero')
				SELECT	count(1)  into :count_fall FROM "FALLECIDOS" 
				WHERE  	( "FALLECIDOS"."BASE" = :base ) AND 
				       		( "FALLECIDOS"."SS" = :serie )  AND 
						 	( "FALLECIDOS"."CONTRATO" = :numero ) AND
							( "FALLECIDOS"."ESTADO_REG" = 'A' )   ;
				if count_fall > 0 then 
					dw_1.setitem(i,'fallecido','Si')
				else
					dw_1.setitem(i,'fallecido','No')
				end if
			next
		end if
	CASE 17
		dw_1.dataobject ='dw_capacidades_por_sector'
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(id_parque,gs_producto) > 0 then
			for i = 1 to dw_1.rowcount()
				tipo      		= dw_1.getitemstring(i,'tipo')
				area      		= dw_1.getitemstring(i,'area')
				capacidad 	= dw_1.getitemnumber(i,'capacidad')
				//------------------------------disponibles------------------------------
				SELECT	count(1) INTO :count_dispo1 FROM "BASE_PLANI","INVENTARIO_PLANI"  
				WHERE  ( "BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" ) and  
						 ( "BASE_PLANI"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" ) and  
						 (("INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) AND  
						 ( "BASE_PLANI"."TIPO" = :tipo ) AND  
						 ( "BASE_PLANI"."AREA" = :area ) AND  
						 ( "BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto ) AND  
						 ( "INVENTARIO_PLANI"."CAPACIDAD" = :capacidad ) ) and
						 ( "INVENTARIO_PLANI"."NUMERO" =  0  ) ;
						
				SELECT	count(1) INTO :count_dispo2 FROM "BASE_PLANI","INVENTARIO_PLANI_CONST"  
				WHERE  ( "BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI_CONST"."SECTOR" ) and  
						 ( "BASE_PLANI"."COD_PARQUE" = "INVENTARIO_PLANI_CONST"."COD_PARQUE" ) and  
						 (("INVENTARIO_PLANI_CONST"."COD_PARQUE" = :id_parque ) AND  
						 ( "BASE_PLANI"."TIPO" = :tipo ) AND  
						 ( "BASE_PLANI"."AREA" = :area ) AND 
						 ( "BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto ) AND  
						 ( "INVENTARIO_PLANI_CONST"."CAPACIDAD" = :capacidad ) ) and
						 ( "INVENTARIO_PLANI_CONST"."NUMERO" =  0 ) ;
						
				if isnull(count_dispo1) then count_dispo1 = 0
				if isnull(count_dispo2) then count_dispo2 = 0
				count_dispo3 = count_dispo1 + count_dispo2
				//-------------------------------reservadas-------------------------------
				SELECT	count(1)  INTO :count_reserv
				FROM 	"BASE_PLANI","INVENTARIO_PLANI","RESERVA_SEPULTURA"  
				WHERE  ( "BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" ) and  
						 ( "BASE_PLANI"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" ) and  
						 ( "RESERVA_SEPULTURA"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" ) and  
						 ( "INVENTARIO_PLANI"."COD_PARQUE" = "RESERVA_SEPULTURA"."COD_PARQUE" ) and  
						 ( "INVENTARIO_PLANI"."SEPULTURA" = "RESERVA_SEPULTURA"."SEPULTURA" ) and  
						 (("RESERVA_SEPULTURA"."COD_PARQUE" = :id_parque ) AND  
						 ( "BASE_PLANI"."AREA" = :area ) AND  
						 ( "BASE_PLANI"."CAPACIDAD" = :capacidad ) AND  
						 ( "BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto ) AND  
						 ( "BASE_PLANI"."TIPO" = :tipo ) ) AND 
						 ( "RESERVA_SEPULTURA"."ESTADO" = 1 );
				dw_1.setitem(i,'disponible',count_dispo3)
				dw_1.setitem(i,'reservadas',count_reserv)
				if gs_producto='SE' then
					dw_1.object.t_5.text = 'Disponibilidad SEPULTURAS por Area y Capacidad'
				elseif gs_producto='CO' then
					dw_1.object.t_5.text = 'Disponibilidad COLUMBARIOS por Area y Capacidad'
				end if
				dw_1.object.t_6.text = '( '+ls_descrip_parque+' )'
				dw_1.object.t_8.text = 'Usuario:'+gs_nom_comp_usuario		
			next
		end if
	CASE 18
		if isnull(gs_sector) or gs_sector= "" then
			if gs_producto='SE' then
				dw_1.dataobject ='dw_gestion_reserva_1'
			elseif gs_producto='CO' then
				dw_1.dataobject ='dw_gestion_reserva_1_co'
			end if
			dw_1.settransobject(sqlca)
			if dw_1.retrieve(id_parque) > 0 then
				if gs_producto='SE' then
					dw_1.object.t_4.text	= 'Gestion SEPULTURAS'
				elseif gs_producto='SE' then
					dw_1.object.t_4.text	= 'Gestion COLUMBARIOS'
				end if
			end if
			
		else
			if gs_producto='SE' then
				dw_1.dataobject 			='dw_gestion_reserva'
			elseif gs_producto='CO' then
				dw_1.dataobject 			='dw_gestion_reserva_co'
			end if
			dw_1.settransobject(sqlca)
			if dw_1.retrieve(id_parque,gs_sector) > 0 then
				if gs_producto='SE' then
					dw_1.object.t_4.text	= 'Gestion SEPULTURAS'
				elseif gs_producto='SE' then
					dw_1.object.t_4.text	= 'Gestion COLUMBARIOS'
				end if
			end if
		end if

	CASE 19	
		dw_1.reset()
		if isvalid(w_plani_disp_vta) then close(w_plani_disp_vta)
		OpenWithParm(w_plani_disp_vta, string(id_parque))
		
	CASE 20
		dw_1.reset()
		dw_fecha_invent.visible = TRUE
		dw_fecha_invent.settransobject(sqlca)	
		dw_fecha_invent.getchild('fecha',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(id_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_fecha_invent.accepttext()
		dw_fecha_invent.insertrow(0)
	CASE 21
		dw_1.reset()
		if isvalid(w_inf_reserva_tec) then close(w_inf_reserva_tec)
		OpenWithParm(w_inf_reserva_tec, string(id_parque))
			//OpenWithParm(w_inf_reserva_tec, ls_string)	
	CASE ELSE
		dw_1.reset()
END CHOOSE
dw_1.accepttext ()
cbx_1.checked = false
wf_mensaje(dw_1)
SetPointer(Arrow!)
end event

type dw_2 from datawindow within w_resumenes_planimetria
boolean visible = false
integer x = 1938
integer y = 1724
integer width = 411
integer height = 432
integer taborder = 20
boolean titlebar = true
string title = "none"
string dataobject = "dw_stock"
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

type cb_5 from commandbutton within w_resumenes_planimetria
integer x = 1463
integer y = 1656
integer width = 288
integer height = 80
integer taborder = 30
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

type st_1 from statictext within w_resumenes_planimetria
integer x = 2784
integer y = 60
integer width = 1115
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selección Informes de Gestión Plani."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_resumenes_planimetria
integer x = 1115
integer y = 1652
integer width = 256
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;string nulo

setnull(nulo)

dw_1.setsort(nulo)
dw_1.sort()
end event

type cb_3 from commandbutton within w_resumenes_planimetria
integer x = 855
integer y = 1656
integer width = 256
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string nulo

setnull(nulo)

dw_1.setfilter(nulo)
dw_1.filter()
end event

type dw_1 from datawindow within w_resumenes_planimetria
integer x = 46
integer y = 184
integer width = 2674
integer height = 1436
integer taborder = 10
string title = "none"
string dataobject = "dw_promesas_no_asignadas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer fila
string columna
fila = row
if dataobject = 'dw_gestion_reserva' or   dataobject = 'dw_gestion_reserva_1' then
	columna = dwo.name
	if columna = 't_3' then
		open(w_reserva_encargados)
	end if
end if
end event

event rowfocuschanged;if rowcount() > 0 THEN
	if dw_1.dataobject='dw_inventario_sepulturas' then
	else
		SelectRow(0, FALSE)
		SelectRow(getrow(), TRUE)
	end if
end if
end event

type cb_2 from commandbutton within w_resumenes_planimetria
integer x = 3497
integer y = 1640
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

event clicked;w_plano_sector_parque.dw_plano_sector_parque.enabled = true
close(w_resumenes_planimetria)
end event

type cb_1 from commandbutton within w_resumenes_planimetria
integer x = 594
integer y = 1656
integer width = 256
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_1
if dw_1.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type gb_1 from groupbox within w_resumenes_planimetria
integer x = 571
integer y = 1608
integer width = 1202
integer height = 148
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

