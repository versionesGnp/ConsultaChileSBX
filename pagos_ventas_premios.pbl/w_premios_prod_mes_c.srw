forward
global type w_premios_prod_mes_c from window
end type
type cb_comprob_anticipo from commandbutton within w_premios_prod_mes_c
end type
type cb_grabar from commandbutton within w_premios_prod_mes_c
end type
type cb_detalle from commandbutton within w_premios_prod_mes_c
end type
type cb_clasif_hist from commandbutton within w_premios_prod_mes_c
end type
type cb_producc from commandbutton within w_premios_prod_mes_c
end type
type dw_parque from datawindow within w_premios_prod_mes_c
end type
type pb_aceptar from picturebutton within w_premios_prod_mes_c
end type
type cb_limpiar from commandbutton within w_premios_prod_mes_c
end type
type cb_imprimir from commandbutton within w_premios_prod_mes_c
end type
type cb_exportar from commandbutton within w_premios_prod_mes_c
end type
type cb_filtrar from commandbutton within w_premios_prod_mes_c
end type
type cb_ordenar from commandbutton within w_premios_prod_mes_c
end type
type dw_cierre_venta from datawindow within w_premios_prod_mes_c
end type
type dw_lista from datawindow within w_premios_prod_mes_c
end type
type cb_cerrar from commandbutton within w_premios_prod_mes_c
end type
type gb_3 from groupbox within w_premios_prod_mes_c
end type
end forward

global type w_premios_prod_mes_c from window
integer width = 3355
integer height = 1904
boolean titlebar = true
string title = "Premio Producción Venta ~"C~""
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_comprob_anticipo cb_comprob_anticipo
cb_grabar cb_grabar
cb_detalle cb_detalle
cb_clasif_hist cb_clasif_hist
cb_producc cb_producc
dw_parque dw_parque
pb_aceptar pb_aceptar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
dw_cierre_venta dw_cierre_venta
dw_lista dw_lista
cb_cerrar cb_cerrar
gb_3 gb_3
end type
global w_premios_prod_mes_c w_premios_prod_mes_c

type variables
Long	il_mes,il_ano,il_row
end variables

on w_premios_prod_mes_c.create
this.cb_comprob_anticipo=create cb_comprob_anticipo
this.cb_grabar=create cb_grabar
this.cb_detalle=create cb_detalle
this.cb_clasif_hist=create cb_clasif_hist
this.cb_producc=create cb_producc
this.dw_parque=create dw_parque
this.pb_aceptar=create pb_aceptar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.dw_cierre_venta=create dw_cierre_venta
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.Control[]={this.cb_comprob_anticipo,&
this.cb_grabar,&
this.cb_detalle,&
this.cb_clasif_hist,&
this.cb_producc,&
this.dw_parque,&
this.pb_aceptar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.dw_cierre_venta,&
this.dw_lista,&
this.cb_cerrar,&
this.gb_3}
end on

on w_premios_prod_mes_c.destroy
destroy(this.cb_comprob_anticipo)
destroy(this.cb_grabar)
destroy(this.cb_detalle)
destroy(this.cb_clasif_hist)
destroy(this.cb_producc)
destroy(this.dw_parque)
destroy(this.pb_aceptar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.dw_cierre_venta)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.gb_3)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_tot_reg,ll_nulo

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;

gf_centrar(w_premios_prod_mes_c)
Setnull(ls_nulo);Setnull(ll_nulo)
dw_parque.dataobject					= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_cierre_venta.settransobject(sqlca)
dw_cierre_venta.getchild('cierre_ventas',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve(datetime(date(string('28/02/2011'))))=0 then
	idw_detalle4.insertrow(0)
end if
dw_cierre_venta.insertrow(0)
dw_lista.dataobject					= 'dwe_premios_prod_mes_c'
dw_lista.settransobject(sqlca)

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_comprob_anticipo from commandbutton within w_premios_prod_mes_c
integer x = 1211
integer y = 1648
integer width = 457
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Comprob. Anticipo"
end type

event clicked;string	ls_string
long		ll_cod_parque
datetime	ldt_fecha_cierre

dw_parque.accepttext()
dw_cierre_venta.accepttext()
ldt_fecha_cierre			= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
ll_cod_parque				= dw_parque.getitemnumber(1,'parque')
if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ldt_fecha_cierre) then
	ls_string					= string(ldt_fecha_cierre,'dd/mm/yyyy')+'~t'+string(ll_cod_parque)
	if isvalid(w_comprobante_anticipo) then close(w_comprobante_anticipo)
		OpenWithParm (w_comprobante_anticipo,ls_string)
	else
		if isnull(ldt_fecha_cierre) then
			messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
			dw_cierre_venta.setfocus()
			dw_cierre_venta.setcolumn('cierre_ventas')
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia", "Debe Ingresar Parque")
			dw_parque.setfocus()
			dw_parque.setcolumn('parque')
		end if
end if
end event

type cb_grabar from commandbutton within w_premios_prod_mes_c
integer x = 32
integer y = 1648
integer width = 293
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string	ls_cod_age,ls_cod_contab,ls_serie,ls_haber,ls_mes
long		ll_tot_reg,ll_indi,ll_rut,ll_tot_pago,ll_count,ll_cod_parque,ll_verif
datetime	ldt_fecha

dw_lista.accepttext()
ll_tot_reg				= dw_lista.rowcount()
ldt_fecha				= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
ls_mes					= string(month(date(ldt_fecha)))
ll_count					= 0
if ll_tot_reg > 0 then
	for ll_indi = 1 to ll_tot_reg
		ls_cod_age		= dw_lista.getitemstring(ll_indi,'cod_age')
		ll_rut			= dw_lista.getitemnumber(ll_indi,'rut')
		ll_tot_pago		= dw_lista.getitemnumber(ll_indi,'premio_tot')
		ls_cod_contab	= '080'
		ls_serie			= ' '
		ls_haber			= 'H'
		ll_cod_parque	= dw_lista.getitemnumber(ll_indi,'cod_parque')
		SELECT	count("RES_COMI"."COD_AGE_SUP")  
		INTO 		:ll_verif  
		FROM 		"RES_COMI"  
		WHERE		( "RES_COMI"."COD_AGE_SUP" = :ls_cod_age ) AND  
					( "RES_COMI"."FECHA" = :ldt_fecha ) AND
					( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab)
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ll_verif) and ll_verif>0 then
				UPDATE	"RES_COMI"  
				SET 		"TOTAL_PAGO" = :ll_tot_pago  
				WHERE 	( "RES_COMI"."COD_AGE_SUP" = :ls_cod_age ) AND  
							( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
							( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
					ll_count		= ll_count+1
				else
					rollback using sqlca;
				end if
			else
				INSERT INTO "RES_COMI"  
							( "COD_AGE_SUP",	"RUT",	"COD_CONTABLE",	"MES",	"FECHA",		"CONTRATO",	"SERIE",		"TOTAL_PAGO",	"HABER",		"MONEDA",	"CODIGO_COM",	"ESTADO_AGE_SUP")  
				VALUES	( :ls_cod_age,		:ll_rut,	:ls_cod_contab,	:ls_mes,	:ldt_fecha,	0,				:ls_serie,	:ll_tot_pago,	:ls_haber,	'',			'',				'')
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
					ll_count		= ll_count+1
				else
					rollback using sqlca;
				end if
			end if
		else
			INSERT INTO "RES_COMI"  
						( "COD_AGE_SUP",	"RUT",	"COD_CONTABLE",	"MES",	"FECHA",		"CONTRATO",	"SERIE",		"TOTAL_PAGO",	"HABER",		"MONEDA",	"CODIGO_COM",	"ESTADO_AGE_SUP")  
			VALUES	( :ls_cod_age,		:ll_rut,	:ls_cod_contab,	:ls_mes,	:ldt_fecha,	0,				:ls_serie,	:ll_tot_pago,	:ls_haber,	'',			'',				'')
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit using sqlca;
				ll_count		= ll_count+1
			else
				rollback using sqlca;
			end if
		end if
	next
	if ll_tot_reg=ll_count then
		messagebox("Grabar","Grabación Exitosa")
		dw_lista.reset()
	else
		messagebox("Error","Error de Grabación")
	end if 
end if
end event

type cb_detalle from commandbutton within w_premios_prod_mes_c
integer x = 841
integer y = 1648
integer width = 370
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Ventas"
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha_cierre

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ldt_fecha_cierre			= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
	ls_codigo					= dw_lista.getitemstring(il_row,'cod_age')
	if not isnull(ls_codigo) and ls_codigo<>''  then
		ls_string					= string(ldt_fecha_cierre,'dd/mm/yyyy')+'~t'+ls_codigo
		if isvalid(w_premios_prod_mes_c_det) then close(w_premios_prod_mes_c_det)
		OpenWithParm (w_premios_prod_mes_c_det,ls_string)
	end if
end if
end event

type cb_clasif_hist from commandbutton within w_premios_prod_mes_c
integer x = 393
integer y = 1648
integer width = 448
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasificación Hist."
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha

dw_cierre_venta.accepttext()
dw_lista.accepttext()

if dw_lista.rowcount() > 0 then
	ls_codigo						= dw_lista.getitemstring(il_row,'cod_age')
	ldt_fecha						= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
	if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fecha) then
		ls_string						= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')
		if isvalid(w_clasifica_historica) then close(w_clasifica_historica)
		OpenWithParm (w_clasifica_historica,ls_string)
	end if
end if
end event

type cb_producc from commandbutton within w_premios_prod_mes_c
integer x = 2661
integer y = 80
integer width = 635
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza 8% Ventas ~'C~'"
end type

event clicked;string	ls_base,ls_serie,ls_moneda 
long		ll_count_1,ll_count_2,ll_verif_1,ll_verif_2,ll_tot_pag
datetime	ldt_fecha_cierre,ldt_fecha_ini_premio,ldt_fecha_producc
double	ldb_numero,ldb_valor_uf,ldb_precio,ldb_porce_pago

dw_lista.reset()
ldt_fecha_cierre									= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
ldt_fecha_ini_premio								= datetime(date(string('28/02/2011')))
ll_count_1											= 0
ll_count_2											= 0
ll_verif_1											= 0
ll_verif_2											= 0

if not isnull(ldt_fecha_cierre) then
	SELECT DISTINCT "OFERTA_V"."FECHA_PRODUCC"  
	INTO	:ldt_fecha_producc  
	FROM 	"OFERTA_V"  
	WHERE "OFERTA_V"."FECHA_PRODUCC" = :ldt_fecha_cierre 
	USING	sqlca;
		
	if ldt_fecha_cierre = ldt_fecha_producc then
		messagebox("Advertencia","Fecha Producción Esta Actualizada")
	else
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO		:ldb_valor_uf  
		FROM		"TAB_UF"  
		WHERE		"TAB_UF"."FECHA_UF" = :ldt_fecha_cierre   
		USING		sqlca;
		
		DECLARE x1 CURSOR FOR
		SELECT	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"PAGO_OFERTA"."MONEDA",	"PAGO_OFERTA"."PRECIO"  
		FROM		"CADENA",	"OFERTA_V",	"PAGO_OFERTA",	"AGENTES"   
		WHERE 	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and 
					"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and
					"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and
					"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and
					"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and
					"OFERTA_V"."COD_AGE" = "AGENTES"."COD_AGE" and
					"CADENA"."CODIGO" = 'O' AND
					"OFERTA_V"."CIERRE_VENTA" >= :ldt_fecha_ini_premio  and
					"OFERTA_V"."CLASIFICA_VENTA" = 'C' AND  
					"OFERTA_V"."FECHA_PRODUCC" is null AND
					( "AGENTES"."DEPTO" = 'M' OR "AGENTES"."DEPTO" = 'K')
		USING		sqlca;			
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
			fetch x1 INTO	:ls_base,	:ls_serie,	:ldb_numero,:ls_moneda,	:ldb_precio; 
				if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
					ll_tot_pag							= f_tot_pag_prem_comi(ls_base,ls_serie,ldb_numero,ldt_fecha_cierre)
					if ls_moneda='1' then
						ldb_porce_pago					= round(((ll_tot_pag / ldb_precio) * 100),4)
					else
						ldb_porce_pago					= round(((ll_tot_pag / ldb_valor_uf) * 100) / ldb_precio,4)
					end if
					if ldb_porce_pago >= 7.98 then
						ll_verif_1						= ll_count_1 + 1
						UPDATE	"OFERTA_V"  
						SET		"FECHA_PRODUCC" = :ldt_fecha_cierre  
						WHERE		( "OFERTA_V"."SERIE" = :ls_serie ) AND  
									( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )   
						USING		Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
							ll_verif_2					= ll_count_2 + 1
						else
							rollback using Trans_1;
						end if  
					end if
				end if
				ll_count_1									= ll_verif_1
				ll_count_2									= ll_verif_2
				setnull(ls_base);setnull(ls_serie);setnull(ldb_numero)
			LOOP
		end if
		close x1;
		if ll_verif_1 = ll_verif_2 then
			messagebox("Grabar","¡Grabación Exitosa! Total Registros Modificados :"+string(ll_verif_1))
		else
			messagebox("Error","Error Grabación Producción 'C' ")
		end if
	END IF
else
	if isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre Ventas")
		dw_cierre_venta.setfocus()
		dw_cierre_venta.setcolumn('cierre_ventas')	
	end if
end if
end event

type dw_parque from datawindow within w_premios_prod_mes_c
integer x = 46
integer y = 56
integer width = 878
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type pb_aceptar from picturebutton within w_premios_prod_mes_c
integer x = 1838
integer y = 36
integer width = 133
integer height = 116
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_cod_age,ls_clasif_age,ls_canal
long		ll_cod_parque,ll_new,ll_antic_a,ll_antic_b,ll_antic_c,ll_antic_d,ll_ant_prem_ab,&
			ll_ant_prem_tot,ll_tot_pago,ll_dif_pago,ll_tot_reg,ll_rut
datetime	ldt_fecha_cierre,ldt_fecha_ini_premio,ldt_fecha_ini
double	ldb_valor_uf,ldb_producc_ab,ldb_producc_c,ldb_producc_tot

dw_lista.reset()
dw_parque.accepttext()
dw_cierre_venta.accepttext()
ll_cod_parque										= dw_parque.getitemnumber(1,'parque')
ldt_fecha_cierre									= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
ldt_fecha_ini_premio								= datetime(date(string('28/02/2011')))
SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
INTO 		:ldt_fecha_ini  
FROM		"CIERRE_VENTA"  
WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldt_fecha_ini) then
		dw_lista.Object.usuario.text 			= gs_user
		dw_lista.Object.titulo2.text 			= 'Período de Ventas desde '+string(ldt_fecha_ini,'dd/mm/yyyy')+' hasta '+string(ldt_fecha_cierre,'dd/mm/yyyy')
	end if
end if
if (not isnull(ll_cod_parque) or ll_cod_parque>0) and not isnull(ldt_fecha_cierre) then
	DECLARE x1 CURSOR FOR
	SELECT DISTINCT "AGENTES"."COD_AGE",	"AGENTES"."CANAL",	"AGENTES"."RUT"			
  	FROM		"AGENTES",	"OFERTA_V"  
   WHERE		"OFERTA_V"."COD_AGE" = "AGENTES"."COD_AGE" and  
         	"OFERTA_V"."FECHA_PRODUCC" = :ldt_fecha_cierre AND
				"AGENTES"."COD_PARQUE" = :ll_cod_parque AND
				"AGENTES"."ESTADO" = 'A'
	USING		sqlca;			
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ls_cod_age,	:ls_canal, :ll_rut; 
			if (not isnull(ls_cod_age) or ls_cod_age<>'') and (not isnull(ls_canal) or ls_canal<>'') and (not isnull(ll_rut) or ll_rut >0) then
				ls_clasif_age						= f_clasif_hist(ls_cod_age,ldt_fecha_cierre)
				SELECT	SUM(CASE 
						  	WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO"
						  	WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN ROUND( ( "PAGO_OFERTA"."PRECIO"/"TAB_UF"."VALOR_UF") , 4 ) END)
				INTO		:ldb_producc_ab
				FROM    	"OFERTA_V",	"PAGO_OFERTA",	"TAB_UF",	"AGENTES"
				WHERE   	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
						  	"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
						  	"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
						  	"OFERTA_V"."CIERRE_VENTA" = "TAB_UF"."FECHA_UF" and  
						  	"OFERTA_V"."COD_AGE" = "AGENTES"."COD_AGE" and
						  	"OFERTA_V"."CLASIFICA_VENTA" <> 'C' AND
							"OFERTA_V"."CIERRE_VENTA" = :ldt_fecha_cierre AND
							"AGENTES"."COD_AGE" = :ls_cod_age
				USING		Trans_1;
				if Trans_1.sqlcode=0 then
					if not isnull(ldb_producc_ab) or ldb_producc_ab>0 then
						ldb_producc_ab				= ldb_producc_ab
					else
						ldb_producc_ab				= 0
					end if
				else
					ldb_producc_ab					= 0
				end if
				
				if ls_canal = 'NF' then
					SELECT	"ANTICIPO_A",	"ANTICIPO_B",	"ANTICIPO_C",	"ANTICIPO_D"
					INTO		:ll_antic_a,	:ll_antic_b,	:ll_antic_c,	:ll_antic_d
					FROM		"PREMIOS_AGENTES_NF"  
					WHERE 	( "PREMIOS_AGENTES_NF"."MIN" <= :ldb_producc_ab ) AND  
								( "PREMIOS_AGENTES_NF"."MAX" >= :ldb_producc_ab ) AND  
								( "PREMIOS_AGENTES_NF"."COD_PARQUE" = :ll_cod_parque )
					USING		Trans_1;
				elseif ls_canal = 'NI' then
					SELECT	"ANTICIPO_A",	"ANTICIPO_B",	"ANTICIPO_C",	"ANTICIPO_D"
					INTO		:ll_antic_a,	:ll_antic_b,	:ll_antic_c,	:ll_antic_d
					FROM		"PREMIOS_AGENTES"  
					WHERE 	( "PREMIOS_AGENTES"."MIN" <= :ldb_producc_ab ) AND  
								( "PREMIOS_AGENTES"."MAX" >= :ldb_producc_ab ) 
					USING		Trans_1;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_antic_a) and not isnull(ll_antic_b) and not isnull(ll_antic_c) and not isnull(ll_antic_d) then
						if ls_clasif_age = 'A' then
							ll_ant_prem_ab			= ll_antic_a
						elseif ls_clasif_age = 'B' then
							ll_ant_prem_ab			= ll_antic_b
						elseif ls_clasif_age = 'C' then
							ll_ant_prem_ab			= ll_antic_c
						elseif ls_clasif_age = 'D' then
							ll_ant_prem_ab			= ll_antic_d	
						end if
					else
						ll_antic_a					= 0
						ll_antic_b					= 0
						ll_antic_c					= 0	
						ll_antic_d					= 0
						ll_ant_prem_ab				= 0
					end if
				else
					ll_antic_a						= 0
					ll_antic_b						= 0
					ll_antic_c						= 0	
					ll_antic_d						= 0
					ll_ant_prem_ab					= 0	
				end if
							
				SELECT  	SUM(CASE 
						  	WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO"
						  	WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN ROUND( ( "PAGO_OFERTA"."PRECIO"/"TAB_UF"."VALOR_UF") , 4 ) END) 
				INTO		:ldb_producc_c		  
				FROM    	"OFERTA_V",	"PAGO_OFERTA",	"TAB_UF",	"AGENTES"
				WHERE   	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
						  	"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
						  	"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
						  	"OFERTA_V"."FECHA_PRODUCC" = "TAB_UF"."FECHA_UF" and  
						  	"OFERTA_V"."COD_AGE" = "AGENTES"."COD_AGE" and
						  	"OFERTA_V"."CLASIFICA_VENTA" = 'C' AND
							"OFERTA_V"."FECHA_PRODUCC" = :ldt_fecha_cierre AND
							"AGENTES"."COD_AGE" = :ls_cod_age
				USING		Trans_1;			
				if Trans_1.sqlcode=0 then
					if not isnull(ldb_producc_c) or ldb_producc_c>0 then
						ldb_producc_c				= ldb_producc_c
					else
						ldb_producc_c				= 0
					end if
				else
					ldb_producc_c					= 0
				end if
				ldb_producc_tot					= ldb_producc_ab + ldb_producc_c
				
				if ls_canal = 'NF' then
					SELECT	"ANTICIPO_A",	"ANTICIPO_B",	"ANTICIPO_C",	"ANTICIPO_D"
					INTO		:ll_antic_a,	:ll_antic_b,	:ll_antic_c,	:ll_antic_d
					FROM		"PREMIOS_AGENTES_NF"  
					WHERE 	( "PREMIOS_AGENTES_NF"."MIN" <= :ldb_producc_tot ) AND  
								( "PREMIOS_AGENTES_NF"."MAX" >= :ldb_producc_tot ) AND  
								( "PREMIOS_AGENTES_NF"."COD_PARQUE" = :ll_cod_parque )
					USING		Trans_1;
				elseif ls_canal = 'NI' then
					SELECT	"ANTICIPO_A",	"ANTICIPO_B",	"ANTICIPO_C",	"ANTICIPO_D"
					INTO		:ll_antic_a,	:ll_antic_b,	:ll_antic_c,	:ll_antic_d
					FROM		"PREMIOS_AGENTES"  
					WHERE 	( "PREMIOS_AGENTES"."MIN" <= :ldb_producc_tot ) AND  
								( "PREMIOS_AGENTES"."MAX" >= :ldb_producc_tot ) 
					USING		Trans_1;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_antic_a) and not isnull(ll_antic_b) and not isnull(ll_antic_c) and not isnull(ll_antic_d) then
						if ls_clasif_age = 'A' then
							ll_ant_prem_tot		= ll_antic_a
						elseif ls_clasif_age = 'B' then
							ll_ant_prem_tot		= ll_antic_b
						elseif ls_clasif_age = 'C' then
							ll_ant_prem_tot		= ll_antic_c
						elseif ls_clasif_age = 'D' then
							ll_ant_prem_tot		= ll_antic_d	
						end if
					else
						ll_antic_a					= 0
						ll_antic_b					= 0
						ll_antic_c					= 0	
						ll_antic_d					= 0
						ll_ant_prem_tot			= 0
					end if
				else
					ll_antic_a						= 0
					ll_antic_b						= 0
					ll_antic_c						= 0	
					ll_antic_d						= 0
					ll_ant_prem_tot				= 0	
				end if
				
				SELECT	"RES_COMI"."TOTAL_PAGO"  
    			INTO 		:ll_tot_pago  
    			FROM 		"RES_COMI"  
				WHERE		( "RES_COMI"."COD_AGE_SUP" = :ls_cod_age ) AND  
							( "RES_COMI"."FECHA" = :ldt_fecha_cierre ) AND
							( "RES_COMI"."COD_CONTABLE" = '080')
				USING		Trans_1;
				if Trans_1.sqlcode=0 then
					if not isnull(ll_tot_pago) or ll_tot_pago>0 then
						ll_tot_pago					= ll_tot_pago
					else
						ll_tot_pago					= 0
					end if
				else
					ll_tot_pago						= 0
				end if
				
				ll_dif_pago							= ll_ant_prem_tot - ll_tot_pago
				if ll_dif_pago>0 then
					ll_new							= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new)
					dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
					dw_lista.setitem(ll_new,"cod_age",ls_cod_age)
					dw_lista.setitem(ll_new,"rut",ll_rut)
					dw_lista.setitem(ll_new,"clasif",ls_clasif_age)
					dw_lista.setitem(ll_new,"canal",ls_canal)
					dw_lista.setitem(ll_new,"cierre_venta",ldt_fecha_cierre)
					dw_lista.setitem(ll_new,"producc_ab",ldb_producc_ab)
					dw_lista.setitem(ll_new,"premio_ab",ll_ant_prem_ab)
					dw_lista.setitem(ll_new,"producc_tot",ldb_producc_tot)
					dw_lista.setitem(ll_new,"premio_tot",ll_ant_prem_tot)
					dw_lista.setitem(ll_new,"tot_pago",ll_tot_pago)
					dw_lista.setitem(ll_new,"dif_pago",ll_dif_pago)
					dw_lista.AcceptText()
				end if
			end if
			setnull(ls_cod_age);setnull(ls_canal);setnull(ll_rut);&
			setnull(ll_antic_a);setnull(ll_antic_b);setnull(ll_antic_c);setnull(ll_antic_d)
		LOOP
	end if
	close x1;
	ll_tot_reg										= dw_lista.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Datos")
	end if
else
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_parque.setfocus()
		dw_parque.setcolumn('parque')
	elseif isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre Ventas")
		dw_cierre_venta.setfocus()
		dw_cierre_venta.setcolumn('cierre_ventas')	
	end if
end if
end event

type cb_limpiar from commandbutton within w_premios_prod_mes_c
integer x = 2711
integer y = 1648
integer width = 238
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_premios_prod_mes_c.triggerevent(open!)
end event

type cb_imprimir from commandbutton within w_premios_prod_mes_c
integer x = 2473
integer y = 1648
integer width = 238
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )
end event

type cb_exportar from commandbutton within w_premios_prod_mes_c
integer x = 1719
integer y = 1648
integer width = 238
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_premios_prod_mes_c
integer x = 1961
integer y = 1648
integer width = 238
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_premios_prod_mes_c
integer x = 2203
integer y = 1648
integer width = 238
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type dw_cierre_venta from datawindow within w_premios_prod_mes_c
integer x = 951
integer y = 60
integer width = 841
integer height = 100
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

type dw_lista from datawindow within w_premios_prod_mes_c
integer x = 32
integer y = 180
integer width = 3264
integer height = 1428
integer taborder = 10
string title = "none"
string dataobject = "dwe_premios_prod_mes_c"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type cb_cerrar from commandbutton within w_premios_prod_mes_c
integer x = 3031
integer y = 1648
integer width = 261
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premios_prod_mes_c)
end event

type gb_3 from groupbox within w_premios_prod_mes_c
integer x = 1696
integer y = 1600
integer width = 1280
integer height = 152
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

