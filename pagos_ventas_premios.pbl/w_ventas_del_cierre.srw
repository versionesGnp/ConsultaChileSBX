forward
global type w_ventas_del_cierre from window
end type
type cb_asocia_rut from commandbutton within w_ventas_del_cierre
end type
type cb_graba from commandbutton within w_ventas_del_cierre
end type
type cb_modif_control_doct from commandbutton within w_ventas_del_cierre
end type
type cb_ctrol_doc from commandbutton within w_ventas_del_cierre
end type
type cb_cta_cte from commandbutton within w_ventas_del_cierre
end type
type cb_u_fecha from commandbutton within w_ventas_del_cierre
end type
type cb_aum_lista from commandbutton within w_ventas_del_cierre
end type
type cb_exportar2 from commandbutton within w_ventas_del_cierre
end type
type cb_imprimir2 from commandbutton within w_ventas_del_cierre
end type
type dw_2 from datawindow within w_ventas_del_cierre
end type
type cb_16 from commandbutton within w_ventas_del_cierre
end type
type dw_pro from datawindow within w_ventas_del_cierre
end type
type p_2 from picture within w_ventas_del_cierre
end type
type em_2 from editmask within w_ventas_del_cierre
end type
type p_1 from picture within w_ventas_del_cierre
end type
type em_1 from editmask within w_ventas_del_cierre
end type
type cb_lib_lista from commandbutton within w_ventas_del_cierre
end type
type cb_pro_lista from commandbutton within w_ventas_del_cierre
end type
type cb_exportar1 from commandbutton within w_ventas_del_cierre
end type
type cb_filtrar from commandbutton within w_ventas_del_cierre
end type
type cb_ordenar from commandbutton within w_ventas_del_cierre
end type
type cb_cerrar from commandbutton within w_ventas_del_cierre
end type
type cb_imprimir from commandbutton within w_ventas_del_cierre
end type
type dw_1 from datawindow within w_ventas_del_cierre
end type
type gb_1 from groupbox within w_ventas_del_cierre
end type
type gb_2 from groupbox within w_ventas_del_cierre
end type
type dw_u_fecha from datawindow within w_ventas_del_cierre
end type
type cb_1 from commandbutton within w_ventas_del_cierre
end type
end forward

global type w_ventas_del_cierre from window
integer width = 5010
integer height = 1728
boolean titlebar = true
string title = "Proceso Cierre Comercial"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_asocia_rut cb_asocia_rut
cb_graba cb_graba
cb_modif_control_doct cb_modif_control_doct
cb_ctrol_doc cb_ctrol_doc
cb_cta_cte cb_cta_cte
cb_u_fecha cb_u_fecha
cb_aum_lista cb_aum_lista
cb_exportar2 cb_exportar2
cb_imprimir2 cb_imprimir2
dw_2 dw_2
cb_16 cb_16
dw_pro dw_pro
p_2 p_2
em_2 em_2
p_1 p_1
em_1 em_1
cb_lib_lista cb_lib_lista
cb_pro_lista cb_pro_lista
cb_exportar1 cb_exportar1
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
dw_u_fecha dw_u_fecha
cb_1 cb_1
end type
global w_ventas_del_cierre w_ventas_del_cierre

type variables
string is_dw,is_base
long	il_row1,il_row2
end variables

forward prototypes
protected subroutine wf_carga_datos (datetime adt_fec_ini, datetime adt_fec_fin, string as_base)
end prototypes

protected subroutine wf_carga_datos (datetime adt_fec_ini, datetime adt_fec_fin, string as_base);string		cadena_sql,ls_moneda,ls_base,ls_serie,ls_cod_age,ls_cd_estado,ls_estado,ls_cod_jef,ls_cod_sup
long		ll_tot_reg,ll_indi,ll_mes,ll_ano,ll_estado,ll_u_folio,ll_newrow_p
double	ldb_valor_uf,ldb_precio,ldb_precio_uf,ldb_numero,ldb_tot_pagado
datetime	ldt_u_fecha

//wf_carga_datos(adt_fec_ini,adt_fec_fin,ls_base)
ll_tot_reg							= dw_1.retrieve(date(adt_fec_ini),date(adt_fec_fin),as_base) 	
if ll_tot_reg=0  then
	messagebox("Advertencia","No Registra Ventas para Procesar Cierre Peíodo")
else
	ll_mes							= month(date(adt_fec_fin))
	ll_ano								= year(date(adt_fec_fin))
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_valor_uf  
	FROM		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :adt_fec_fin
	USING	sqlca;
	if isnull(ldb_valor_uf) then
		messagebox("Advertencia","Fecha Cierre No Registra Valor U.F.")
	else
		for	ll_indi=1 to ll_tot_reg
			ldb_precio					=  dw_1.getitemnumber(ll_indi,'pago_oferta_precio')
			ls_moneda					=  dw_1.getitemstring(ll_indi,'pago_oferta_moneda') 
			if ls_moneda='2' then
				ldb_precio_uf			= round(ldb_precio,2)	
			else
				ldb_precio_uf			= round(ldb_precio / ldb_valor_uf,2) 	
			end if
			dw_1.setitem(ll_indi,'precio_uf',ldb_precio_uf)
			dw_1.setitem(ll_indi,'oferta_v_cierre_venta',adt_fec_fin)
			dw_1.accepttext()
		next
		
		dw_1.object.t_2.text 			= gs_conexion
		dw_1.object.t_3.text 			= 'Cierre venta periodo del '+em_1.text+' hasta '+em_2.text
		cadena_sql =	'SELECT		CD_FOLIO.BASE, '+&
											'CD_FOLIO.SERIE, '+&
											'CD_FOLIO.NUMERO, '+&
											'CD_FOLIO.ULT_ESTADO, '+&
											'CD_FOLIO.COD_AGENTE, '+&
											'CD_FOLIO.COD_JEFE_VENTA, '+&
											'CD_FOLIO.COD_SUPERVISOR ' +&
							'FROM 		CD_FOLIO '+&
							"WHERE		CD_FOLIO.BASE = '"+as_base+"' AND "+&
											'( CD_FOLIO.ANO_CIERRE = '+string(ll_ano)+'  AND CD_FOLIO.MES_CIERRE = '+string(ll_mes)+' )    '+&
							'ORDER BY	CD_FOLIO.BASE ASC,   '+&
											'CD_FOLIO.SERIE ASC,   '+&
											'CD_FOLIO.NUMERO ASC  '
							
		PREPARE sqlsa FROM :cadena_sql;
		DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
		OPEN DYNAMIC dyn_cursor;  
		
		IF sqlca.sqlcode < 0 THEN
			MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext)
		END IF
		
		Do While sqlca.sqlcode = 0
			Fetch dyn_cursor into :ls_base,:ls_serie,:ldb_numero,:ll_estado,:ls_cod_age,:ls_cod_jef,:ls_cod_sup;
			If sqlca.sqlcode = 0 Then
				ll_newrow_p = dw_pro.insertrow(0)
				dw_pro.setitem(ll_newrow_p,'base',ls_base)
				dw_pro.setitem(ll_newrow_p,'serie',ls_serie)
				dw_pro.setitem(ll_newrow_p,'numero',ldb_numero)
				dw_pro.setitem(ll_newrow_p,'codigo',ll_estado)
				dw_pro.setitem(ll_newrow_p,'cod_age',ls_cod_age)
				dw_pro.setitem(ll_newrow_p,'cod_sup',ls_cod_sup)
				dw_pro.setitem(ll_newrow_p,'cod_jef',ls_cod_jef)
				
				dw_pro.setitem(ll_newrow_p,'fecha_cierre',adt_fec_fin)
				dw_pro.setitem(ll_newrow_p,'tot_pagado',ldb_tot_pagado)
				dw_pro.setitem(ll_newrow_p,'u_fecha',ldt_u_fecha)
				dw_pro.setitem(ll_newrow_p,'u_folio',ll_u_folio)
				dw_pro.setitem(ll_newrow_p,'codigo',ls_cd_estado)
				dw_pro.setitem(ll_newrow_p,'estado',ls_estado)
					
			ElseIf sqlca.sqlcode < 0 Then
				MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_ddlb_all()")
			Else
				Exit
			End If
		Loop
		Close dyn_cursor;
	end if
end if
end subroutine

event open;long		ll_mes,ll_ano
datetime	ldt_fec_cierre,ldt_fec_ini

connect using Trans_1;
gf_centrar(w_ventas_del_cierre)
dw_1.dataobject 					= 'dw_ventas_del_cierre'
dw_1.settransobject(sqlca)
dw_2.height							= 1204
SELECT	max("CIERRE_VENTA"."CIERRE_VENTA")
INTO		:ldt_fec_cierre
FROM 	"CIERRE_VENTA"
USING	sqlca;
SELECT to_date(add_months( to_date(:ldt_fec_cierre), 1 )) INTO :ldt_fec_cierre FROM dual;
ll_mes				= month(date(ldt_fec_cierre))
ll_ano					= year(date(ldt_fec_cierre))

ldt_fec_ini			= datetime(date(string('01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))),time('00:00:00'))
em_1.text 			= string(ldt_fec_ini,'dd-mm-yyyy')
em_2.text 			= string(ldt_fec_cierre,'dd-mm-yyyy')


end event

on w_ventas_del_cierre.create
this.cb_asocia_rut=create cb_asocia_rut
this.cb_graba=create cb_graba
this.cb_modif_control_doct=create cb_modif_control_doct
this.cb_ctrol_doc=create cb_ctrol_doc
this.cb_cta_cte=create cb_cta_cte
this.cb_u_fecha=create cb_u_fecha
this.cb_aum_lista=create cb_aum_lista
this.cb_exportar2=create cb_exportar2
this.cb_imprimir2=create cb_imprimir2
this.dw_2=create dw_2
this.cb_16=create cb_16
this.dw_pro=create dw_pro
this.p_2=create p_2
this.em_2=create em_2
this.p_1=create p_1
this.em_1=create em_1
this.cb_lib_lista=create cb_lib_lista
this.cb_pro_lista=create cb_pro_lista
this.cb_exportar1=create cb_exportar1
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_u_fecha=create dw_u_fecha
this.cb_1=create cb_1
this.Control[]={this.cb_asocia_rut,&
this.cb_graba,&
this.cb_modif_control_doct,&
this.cb_ctrol_doc,&
this.cb_cta_cte,&
this.cb_u_fecha,&
this.cb_aum_lista,&
this.cb_exportar2,&
this.cb_imprimir2,&
this.dw_2,&
this.cb_16,&
this.dw_pro,&
this.p_2,&
this.em_2,&
this.p_1,&
this.em_1,&
this.cb_lib_lista,&
this.cb_pro_lista,&
this.cb_exportar1,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_cerrar,&
this.cb_imprimir,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.dw_u_fecha,&
this.cb_1}
end on

on w_ventas_del_cierre.destroy
destroy(this.cb_asocia_rut)
destroy(this.cb_graba)
destroy(this.cb_modif_control_doct)
destroy(this.cb_ctrol_doc)
destroy(this.cb_cta_cte)
destroy(this.cb_u_fecha)
destroy(this.cb_aum_lista)
destroy(this.cb_exportar2)
destroy(this.cb_imprimir2)
destroy(this.dw_2)
destroy(this.cb_16)
destroy(this.dw_pro)
destroy(this.p_2)
destroy(this.em_2)
destroy(this.p_1)
destroy(this.em_1)
destroy(this.cb_lib_lista)
destroy(this.cb_pro_lista)
destroy(this.cb_exportar1)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_u_fecha)
destroy(this.cb_1)
end on

event close;disconnect using Trans_1;
end event

type cb_asocia_rut from commandbutton within w_ventas_del_cierre
integer x = 3127
integer y = 1280
integer width = 379
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&lación. * Rut"
end type

event clicked;string	ls_pasa='S'
long	ll_tot_reg

dw_1.accepttext()
dw_2.accepttext()

if is_dw='1' then
	ll_tot_reg	=  dw_1.rowcount()
elseif is_dw='2' then	
	ll_tot_reg	=  dw_2.rowcount()
end if
if ll_tot_reg>0 then
	if is_dw='1' then
		gs_base				= dw_1.getitemstring(il_row1,'cadena_codigo')
		gs_serie				= dw_1.getitemstring(il_row1,'cadena_serie')
		gi_numero			= dw_1.getitemnumber(il_row1,'cadena_numero')
		gi_rut					= dw_1.getitemnumber(il_row1,'cadena_rut')
	elseif is_dw='2' then
		gs_base				= dw_2.getitemstring(il_row2,'base')
		gs_serie				= dw_2.getitemstring(il_row2,'serie')
		gi_numero			= dw_2.getitemnumber(il_row2,'numero')
		SELECT	"CADENA"."RUT"
		INTO		:gi_rut
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )
		USING	sqlca;
		if isnull(gi_rut) then gi_rut=0
		if gi_rut=0 then
			messagebox("Advertencia","Contrato No Digitado")
			ls_pasa			= 'N'
		end if
	end if
	if ls_pasa='S' then
		gi_tipo_busqueda = 1
		open(w_listado_contratos)
	end if
end if
end event

type cb_graba from commandbutton within w_ventas_del_cierre
integer x = 2117
integer y = 1480
integer width = 581
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Grabar Cierre Ventas"
end type

event clicked;string		ls_base_dig,ls_serie_dig,ls_base_cd,ls_serie_cd,ls_age_dig,ls_sup_dig,ls_jef_dig,&
			ls_age_cd,ls_sup_cd,ls_jef_cd,ls_difer,ls_descrip
long		ll_res,ll_tot_reg1,ll_tot_reg2,ll_indi1,ll_indi2,ll_valida,ll_new,ldb_tot_vtas,ll_exis,ll_ano,ll_mes
double	ldb_num_dig,ldb_num_cd,ldb_tot_prod
datetime	ldt_fec_ini,ldt_fec_fin,ldt_ult_cierre,ldt_fec_cierre

ll_tot_reg1											= dw_1.rowcount()
ll_tot_reg2 											= dw_pro.rowcount()
if ll_tot_reg1=0 then
	messagebox("Advertencia","No Registra Ventas para Cerrar Proceso")
else
	if ll_tot_reg2=0 then
		messagebox("Advertencia","No Registra Ventas para Validar ventas a Cerrar")
	else
		for ll_indi1=1 to ll_tot_reg1
			ls_base_dig  						= dw_1.getitemstring(ll_indi1,'cadena_codigo')
			ls_serie_dig 						= dw_1.getitemstring(ll_indi1,'cadena_serie')
			ldb_num_dig  						= dw_1.getitemnumber(ll_indi1,'cadena_numero')
			ls_age_dig 	 						= dw_1.getitemstring(ll_indi1,'oferta_v_cod_age')
			ls_sup_dig 	 						= dw_1.getitemstring(ll_indi1,'oferta_v_cod_sup')
			ls_jef_dig 	 						= dw_1.getitemstring(ll_indi1,'oferta_v_cod_jef')
			ldt_fec_cierre 	 					= dw_1.getitemdatetime(ll_indi1,'oferta_v_cierre_venta')
			
			if ll_tot_reg2>0 then
				for ll_indi2=1 to ll_tot_reg2
					ll_valida		  				= dw_pro.getitemnumber(ll_indi2,'validacion')
					if ll_valida=0 then
						ls_base_cd  				= dw_pro.getitemstring(ll_indi2,'base')
						ls_serie_cd 				= dw_pro.getitemstring(ll_indi2,'serie')
						ldb_num_cd  			= dw_pro.getitemnumber(ll_indi2,'numero')
						
						if ls_base_dig=ls_base_cd and ls_serie_dig=ls_serie_cd and ldb_num_dig=ldb_num_cd then
							dw_pro.setitem(ll_indi2,'validacion',1)
							dw_pro.accepttext()
							ls_age_cd 	 		= dw_pro.getitemstring(ll_indi2,'cod_age')
							ls_sup_cd 	 		= dw_pro.getitemstring(ll_indi2,'cod_sup')
							ls_jef_cd 	 		= dw_pro.getitemstring(ll_indi2,'cod_jef')
							ll_indi2				= ll_tot_reg2 + 1 
							if ls_age_dig=ls_age_cd and ls_sup_dig=ls_sup_cd and ls_jef_dig=ls_jef_cd then
							else
								ls_difer			= 'Diferencias Codigo de Ventas'
								ll_new			= dw_2.insertrow(0)
								dw_2.setitem(ll_new,'base',ls_base_dig)
								dw_2.setitem(ll_new,'serie',ls_serie_dig)
								dw_2.setitem(ll_new,'numero',ldb_num_dig)
								dw_2.setitem(ll_new,'diferen',ls_difer)
								dw_2.accepttext()
							end if
						end if
					end if
				next
			end if
		next
		if dw_2.rowcount()=0 then
			if is_base='O' then
				ls_descrip						= 'Promesas'
			elseif  is_base='L' then
				ls_descrip						= 'Anexo Liberador'
			elseif  is_base='A' then
				ls_descrip						= 'Aumento Capacidad'	
			end if
			
			ll_res									= Messagebox("Advertencia",'No Existe Diferencias en Cantidad y Codigos de Ventas~r~n'+&
																							'Esta Seguro de Grabar Registros ',Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				SELECT	max("CIERRE_VENTA"."CIERRE_VENTA")
				INTO		:ldt_ult_cierre
				FROM 	"CIERRE_VENTA"
				WHERE	"CIERRE_VENTA"."CIERRE_VENTA" <= :ldt_fec_cierre
				USING	sqlca;
				ldt_fec_ini						= datetime((RelativeDate(date(ldt_ult_cierre),+ 1)),time('00:00:00'))
				SELECT to_date(add_months( to_date(:ldt_ult_cierre), 1 )) INTO :ldt_ult_cierre FROM dual;
				ldt_fec_fin						= datetime(date(em_2.text),time('00:00:00'))
				
				for ll_indi1=1 to ll_tot_reg1
					ls_base_dig  			= dw_1.getitemstring(ll_indi1,'cadena_codigo')
					ls_serie_dig 			= dw_1.getitemstring(ll_indi1,'cadena_serie')
					ldb_num_dig 			= dw_1.getitemnumber(ll_indi1,'cadena_numero')
					ldt_fec_cierre  			= dw_1.getitemdatetime(ll_indi1,'oferta_v_cierre_venta')
					if ls_base_dig='O' then
						UPDATE	"OFERTA_V"  
						SET 		"CIERRE_VENTA" = :ldt_fec_cierre  
						WHERE	( "OFERTA_V"."SERIE" = :ls_serie_dig ) AND  
									( "OFERTA_V"."NRO_OFERTA" = :ldb_num_dig )
						USING	sqlca;
					elseif ls_base_dig='L' then
						UPDATE	"ANEXO_LIBERADOR"  
						SET 		"CIERRE_VENTA" = :ldt_fec_cierre  
						WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie_dig ) AND  
									( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_num_dig )
						USING	sqlca;	
					elseif ls_base_dig='A' then
						UPDATE	"ANEXO_AUMENTO"  
						SET 		"CIERRE_VENTA" = :ldt_fec_cierre  
						WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie_dig ) AND  
									( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_num_dig )
						USING	sqlca;
					end if
					if sqlca.sqlcode = 0 then
						commit using sqlca;
					else
						rollback using sqlca;
						messagebox("Error Grabar","Error Grabar Cierre Ventas "+ls_descrip+" SQL: "+Trans_1.sqlerrtext)
					end if
				next
					
				ll_mes					= month(date(ldt_fec_fin))
				ll_ano						= year(date(ldt_fec_fin))
				ldb_tot_prod 			= dw_1.getitemnumber(1,'c_sum_uf')
				ldb_tot_vtas 			= dw_1.getitemnumber(1,'c_cta_vta')
					
				SELECT	count("CIERRE_VENTA"."CIERRE_VENTA")
				INTO		:ll_exis
				FROM 	"CIERRE_VENTA"
				WHERE	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fec_fin
				USING	sqlca;
				if isnull(ll_exis) then ll_exis=0
				if ll_exis>0 then
					if is_base='O' then
						UPDATE	"CIERRE_VENTA"  
						SET 		"PERIODO" = :ll_mes,   
									"ANNO" = :ll_ano,
									"PROMESA_UNIDAD" = :ldb_tot_vtas,   
									"PROMESA_UF" = :ldb_tot_prod
						WHERE	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fec_fin
						USING	Trans_1;
					elseif is_base='L' then
						UPDATE	"CIERRE_VENTA"  
						SET 		"PERIODO" = :ll_mes,   
									"ANNO" = :ll_ano,   
									"LIBERA_UNIDAD" = :ldb_tot_vtas,   
									"LIBERA_UF" = :ldb_tot_prod  
						WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fec_fin
						USING	Trans_1;
					elseif is_base='A' then
						UPDATE	"CIERRE_VENTA"  
						SET 		"PERIODO" = :ll_mes,   
									"ANNO" = :ll_ano,   
									"AUMENTO_UNIDAD" = :ldb_tot_vtas,   
									"AUMENTO_UF" = :ldb_tot_prod  
						WHERE	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fec_fin
						USING	Trans_1;
					end if
					if Trans_1.sqlcode = 0 then
						commit using Trans_1;
					else
						rollback using Trans_1;
						messagebox("Error Grabar","Error Grabar Cierre Ventas "+ls_descrip+" SQL: "+Trans_1.sqlerrtext)
					end if
				else
					if is_base='O' then
						INSERT INTO "CIERRE_VENTA"
									( "PERIODO",	"ANNO",	"CIERRE_VENTA",	"CIERRE_VENTA_INI",	"PROMESA_UNIDAD",	"PROMESA_UF",	"LIBERA_UNIDAD",	"LIBERA_UF",	"AUMENTO_UNIDAD",	"AUMENTO_UF",	"FEC_DOCTO_PENDIENTE" )  
						VALUES	( :ll_mes,		:ll_ano,	:ldt_fec_fin,			:ldt_fec_ini,				:ldb_tot_vtas,			:ldb_tot_prod,		0,						0,					0,							0,						null)
						USING	Trans_1;
					elseif is_base='L' then
						INSERT INTO "CIERRE_VENTA"
									( "PERIODO",	"ANNO",	"CIERRE_VENTA",	"CIERRE_VENTA_INI",	"PROMESA_UNIDAD",	"PROMESA_UF",	"LIBERA_UNIDAD",	"LIBERA_UF",	"AUMENTO_UNIDAD",	"AUMENTO_UF",	"FEC_DOCTO_PENDIENTE" )  
						VALUES	( :ll_mes,		:ll_ano,	:ldt_fec_fin,			:ldt_fec_ini,				0,							0,						:ldb_tot_vtas,		:ldb_tot_prod,	0,							0,						null)
						USING	Trans_1;
					elseif is_base='A' then
						INSERT INTO "CIERRE_VENTA"
									( "PERIODO",	"ANNO",	"CIERRE_VENTA",	"CIERRE_VENTA_INI",	"PROMESA_UNIDAD",	"PROMESA_UF",	"LIBERA_UNIDAD",	"LIBERA_UF",	"AUMENTO_UNIDAD",	"AUMENTO_UF",	"FEC_DOCTO_PENDIENTE" )  
						VALUES	( :ll_mes,		:ll_ano,	:ldt_fec_fin,			:ldt_fec_ini,				0,							0,						0,						0,					:ldb_tot_vtas,			:ldb_tot_prod,		null)
						USING	Trans_1;	
					end if
					if Trans_1.sqlcode = 0 then
						commit using Trans_1;
					else
						rollback using Trans_1;
						messagebox("Error Grabar","Error Grabar Cierre Ventas "+ls_descrip+" SQL: "+Trans_1.sqlerrtext)
					end if
				end if
				messagebox("Grabar","Grabación Exitosa")
				dw_1.reset()
				dw_2.reset()
				dw_pro.reset()
			end if
		end if
	end if
end if
end event

type cb_modif_control_doct from commandbutton within w_ventas_del_cierre
integer x = 3845
integer y = 1280
integer width = 434
integer height = 100
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Modif Ctrol Docto."
end type

event clicked;string		ls_base,ls_serie,ls_string,ls_modif
Double	ll_numero

if il_row2>0 and dw_2.rowcount() > 0 then
	ls_base		= dw_2.getitemstring(il_row2,'base')
	ls_serie		= dw_2.getitemstring(il_row2,'serie')
	ll_numero 	= dw_2.getitemnumber(il_row2,'numero')
	ls_modif		= 'M'
	gs_cerrar	= 'S'
	if not isnull(ls_base) and ll_numero>0 then
		ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+ls_modif
		if isvalid(w_modificar_control_documento) then close(w_modificar_control_documento)
	 	openwithparm(w_modificar_control_documento,ls_string)
	end if
end if
	
	
end event

type cb_ctrol_doc from commandbutton within w_ventas_del_cierre
integer x = 3502
integer y = 1280
integer width = 347
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Control Docto."
end type

event clicked;String		ls_string,ls_base,ls_serie
Double	ll_numero
if dw_2.rowcount()>0 then
	ls_base		= dw_2.getitemstring(il_row2,'base')
	ls_serie		= dw_2.getitemstring(il_row2,'serie')
	ll_numero	= dw_2.getitemnumber(il_row2,'numero')
	ls_string		= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(ls_base) and ll_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type cb_cta_cte from commandbutton within w_ventas_del_cierre
integer x = 2752
integer y = 1280
integer width = 379
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta. Corrie&nte"
end type

event clicked;string	ls_pasa='S'
long	ll_tot_reg

dw_1.accepttext()
dw_2.accepttext()

if is_dw='1' then
	ll_tot_reg	=  dw_1.rowcount()
elseif is_dw='2' then	
	ll_tot_reg	=  dw_2.rowcount()
end if
if ll_tot_reg>0 then
	if is_dw='1' then
		gs_base				= dw_1.getitemstring(il_row1,'cadena_codigo')
		gs_serie				= dw_1.getitemstring(il_row1,'cadena_serie')
		gi_numero			= dw_1.getitemnumber(il_row1,'cadena_numero')
		gi_rut					= dw_1.getitemnumber(il_row1,'cadena_rut')
	elseif is_dw='2' then
		gs_base				= dw_2.getitemstring(il_row2,'base')
		gs_serie				= dw_2.getitemstring(il_row2,'serie')
		gi_numero			= dw_2.getitemnumber(il_row2,'numero')
		SELECT	"CADENA"."RUT"
		INTO		:gi_rut
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )
		USING	sqlca;
		if isnull(gi_rut) then gi_rut=0
		if gi_rut=0 then
			messagebox("Advertencia","Contrato No Digitado")
			ls_pasa			= 'N'
		end if
	end if
	if ls_pasa='S' then
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	end if
end if
end event

type cb_u_fecha from commandbutton within w_ventas_del_cierre
integer x = 928
integer y = 1344
integer width = 512
integer height = 100
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza U_Fecha"
end type

event clicked;if isvalid(w_update_oferta_v) then close(w_update_oferta_v)
open(w_update_oferta_v)

end event

type cb_aum_lista from commandbutton within w_ventas_del_cierre
integer x = 2062
integer y = 1344
integer width = 293
integer height = 100
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aumento"
end type

event clicked;string		ls_pasa='S'
datetime	ldt_fec_ini,ldt_fec_fin

dw_2.reset()
dw_pro.reset()
cb_graba.enabled						= false
is_base									= 'A'
ldt_fec_ini								= datetime(date(em_1.text),time('00:00:00'))
ldt_fec_fin								= datetime(date(em_2.text),time('00:00:00'))
if isnull(ldt_fec_ini) then
	messagebox("Advertencia","Fecha Inicio Invalida")
	ls_pasa								= 'N'
elseif isnull(ldt_fec_fin) then
	messagebox("Advertencia","Fecha Término Invalida")
	ls_pasa								= 'N'
else
	if ldt_fec_ini>=ldt_fec_fin then
		messagebox("Advertencia","Rango Fecha Invalido")
		ls_pasa							= 'N'
	end if
end if
if ls_pasa='S' then
	wf_carga_datos(ldt_fec_ini,ldt_fec_fin,is_base)
end if

end event

type cb_exportar2 from commandbutton within w_ventas_del_cierre
integer x = 4485
integer y = 1272
integer width = 238
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_2
if dw_2.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir2 from commandbutton within w_ventas_del_cierre
integer x = 4718
integer y = 1272
integer width = 238
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_2.rowcount()>0 then
	f_Print( dw_2 )
end if
end event

type dw_2 from datawindow within w_ventas_del_cierre
integer x = 2743
integer y = 48
integer width = 2213
integer height = 1204
integer taborder = 20
string title = "none"
string dataobject = "dw_dif_inf_vta"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;is_dw				= '2'
if getrow()>0 then
	il_row2		= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row2, true)
end if
end event

event rowfocuschanged;is_dw				= '2'
if getrow()>0 then
	il_row2		= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row2, true)
end if
end event

event doubleclicked;string	ls_columna,ls_base,ls_serie,ls_string
long	ll_tot_reg,ll_fila
double	ldb_numero

dw_2.accepttext()
ls_columna = dwo.name
if ls_columna = 'u_fecha' then
	ls_base     						= dw_2.getitemstring(il_row2,'base')
	ls_serie    						= dw_2.getitemstring(il_row2,'serie')
	ldb_numero  					= dw_2.getitemnumber(il_row2,'numero')
	
	if ls_base='O' then
		dw_u_fecha.dataobject 	= 'dw_u_fecha_modif_ofe'
	elseif ls_base='L' then
		dw_u_fecha.dataobject 	= 'dw_u_fecha_modif_lib'
	elseif ls_base='A' then
		dw_u_fecha.dataobject 	= 'dw_u_fecha_modif_aum'
	end if
	dw_u_fecha.settransobject(sqlca)
	ll_tot_reg					= dw_u_fecha.retrieve(ls_base,ls_serie,ldb_numero)
	if ll_tot_reg>0 then
		dw_2.height				= 944
	end if
end if
end event

type cb_16 from commandbutton within w_ventas_del_cierre
integer x = 2386
integer y = 1344
integer width = 283
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Difencias"
end type

event clicked;long 		ll_indi,ll_found,ll_tot_teg,ll_tot_cd,ll_estado
string 	ls_base,ls_serie
double	ldb_numero
datetime	ldt_u_fecha

dw_2.reset()
ll_tot_teg									= dw_1.rowcount()
if ll_tot_teg > 0 then	
	ll_tot_cd								= dw_pro.rowcount()
	if ll_tot_cd > 0 then	
		for ll_indi = 1 to ll_tot_teg
			ls_base     					= dw_1.getitemstring(ll_indi,'cadena_codigo')
			ls_serie    					= dw_1.getitemstring(ll_indi,'cadena_serie')
			ldb_numero  				= dw_1.getitemnumber(ll_indi,'cadena_numero')
			
			ll_found 						= dw_pro.Find('numero = '+string (ldb_numero), 1, ll_tot_cd)
			if ll_found = 0 then
				dw_2.insertrow(0)
				dw_2.setitem(dw_2.rowcount(),'falta_inf',0)
				dw_2.setitem(dw_2.rowcount(),'falta_vta',1)
				dw_2.setitem(dw_2.rowcount(),'base',ls_base)
				dw_2.setitem(dw_2.rowcount(),'serie',ls_serie)
				dw_2.setitem(dw_2.rowcount(),'numero',ldb_numero)
			end if	
		next
	end if
	
	ll_tot_cd								= dw_pro.rowcount()
	if ll_tot_cd > 0 then
		for ll_indi = 1 to ll_tot_cd
			ls_base     					= dw_pro.getitemstring(ll_indi,'base')
			ls_serie    					= dw_pro.getitemstring(ll_indi,'serie')
			ldb_numero  				= dw_pro.getitemnumber(ll_indi,'numero')
			ll_estado		  				= dw_pro.getitemnumber(ll_indi,'codigo')
			if ll_estado=11 then
				if ls_base= 'O' then
					SELECT 	"OFERTA_V"."U_FECHA"  
					INTO 		:ldt_u_fecha  
					FROM 	"OFERTA_V"  
					WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
								( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
					USING	sqlca;
				elseif ls_base= 'L' then
					SELECT 	"ANEXO_LIBERADOR"."U_FECHA"  
					INTO 		:ldt_u_fecha  
					FROM 	"ANEXO_LIBERADOR"  
					WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
								( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
					USING	sqlca;
				elseif ls_base= 'A' then
					SELECT 	"ANEXO_AUMENTO"."U_FECHA"  
					INTO 		:ldt_u_fecha  
					FROM 	"ANEXO_AUMENTO"  
					WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
								( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
					USING	sqlca;	
				end if
			end if
			
			ll_found 						= dw_1.Find('cadena_numero = '+string (ldb_numero), 1, ll_tot_teg)
			if ll_found = 0 then
				dw_2.insertrow(0)
				dw_2.setitem(dw_2.rowcount(),'falta_inf',1)
				dw_2.setitem(dw_2.rowcount(),'falta_vta',0)
				dw_2.setitem(dw_2.rowcount(),'base',ls_base)
				dw_2.setitem(dw_2.rowcount(),'serie',ls_serie)
				dw_2.setitem(dw_2.rowcount(),'numero',ldb_numero)
				dw_2.setitem(dw_2.rowcount(),'estado',ll_estado)
				dw_2.setitem(dw_2.rowcount(),'u_fecha',ldt_u_fecha)
			end if	
		next
	end if
	if dw_2.rowcount()=0 then
		cb_graba.enabled				= true
	end if
end if
end event

type dw_pro from datawindow within w_ventas_del_cierre
integer x = 5024
integer y = 48
integer width = 1065
integer height = 528
integer taborder = 20
boolean titlebar = true
string title = "none"
string dataobject = "dw_ext_cierre_mes"
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

type p_2 from picture within w_ventas_del_cierre
integer x = 791
integer y = 1348
integer width = 87
integer height = 92
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_2.text)=-1 then 
	em_2.text=string(today(),gs_formato_fecha)
	em_2.setfocus()
	return
end if	
if em_2.text<>'00/00/0000' then
	ls_fecha = em_2.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(EM_1.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_2.setfocus()
		return
	else	
		em_2.text = Message.StringParm
	end if	
END IF
end event

type em_2 from editmask within w_ventas_del_cierre
integer x = 489
integer y = 1348
integer width = 302
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
string displaydata = "~r"
end type

type p_1 from picture within w_ventas_del_cierre
integer x = 384
integer y = 1348
integer width = 87
integer height = 92
string picturename = "boton.bmp"
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_1.text)=-1 then 
	em_1.text=string(today(),gs_formato_fecha)
	em_1.setfocus()
	return
end if	
if em_1.text<>'00/00/0000' then
	ls_fecha = em_1.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(EM_2.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_1.setfocus()
		return
	else	
		em_1.text = Message.StringParm
	end if	
END IF
end event

type em_1 from editmask within w_ventas_del_cierre
integer x = 82
integer y = 1348
integer width = 302
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
string displaydata = "~r"
end type

type cb_lib_lista from commandbutton within w_ventas_del_cierre
integer x = 1769
integer y = 1344
integer width = 293
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Liberador"
end type

event clicked;string		ls_pasa='S'
datetime	ldt_fec_ini,ldt_fec_fin

dw_2.reset()
dw_pro.reset()
cb_graba.enabled						= false
is_base									= 'L'
ldt_fec_ini								= datetime(date(em_1.text),time('00:00:00'))
ldt_fec_fin								= datetime(date(em_2.text),time('00:00:00'))
if isnull(ldt_fec_ini) then
	messagebox("Advertencia","Fecha Inicio Invalida")
	ls_pasa								= 'N'
elseif isnull(ldt_fec_fin) then
	messagebox("Advertencia","Fecha Término Invalida")
	ls_pasa								= 'N'
else
	if ldt_fec_ini>=ldt_fec_fin then
		messagebox("Advertencia","Rango Fecha Invalido")
		ls_pasa							= 'N'
	end if
end if
if ls_pasa='S' then
	wf_carga_datos(ldt_fec_ini,ldt_fec_fin,is_base)
end if

end event

type cb_pro_lista from commandbutton within w_ventas_del_cierre
integer x = 1477
integer y = 1344
integer width = 293
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Promesas"
end type

event clicked;string		ls_pasa='S'
datetime	ldt_fec_ini,ldt_fec_fin

dw_2.reset()
dw_pro.reset()
cb_graba.enabled						= false
is_base									= 'O'
ldt_fec_ini								= datetime(date(em_1.text),time('00:00:00'))
ldt_fec_fin								= datetime(date(em_2.text),time('00:00:00'))
if isnull(ldt_fec_ini) then
	messagebox("Advertencia","Fecha Inicio Invalida")
	ls_pasa								= 'N'
elseif isnull(ldt_fec_fin) then
	messagebox("Advertencia","Fecha Término Invalida")
	ls_pasa								= 'N'
else
	if ldt_fec_ini>=ldt_fec_fin then
		messagebox("Advertencia","Rango Fecha Invalido")
		ls_pasa							= 'N'
	end if
end if
if ls_pasa='S' then
	wf_carga_datos(ldt_fec_ini,ldt_fec_fin,is_base)
end if

end event

type cb_exportar1 from commandbutton within w_ventas_del_cierre
integer x = 773
integer y = 1480
integer width = 238
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;integer ret
string archivo

archivo = mid(em_2.text,1,2)+mid(em_2.text,4,2)+mid(em_2.text,7,4)
if gs_conexion = 'El Prado' then
	if is_base ='P' then
		archivo = "C:\cierre_prom"+archivo+"_P.xls"
	else
		archivo = "C:\cierre_lib"+archivo+"_P.xls"
	end if
else
	if is_base ='P' then
		archivo = "C:\cierre_"+archivo+"_F.xls"
	else
		archivo = "C:\cierre_lib"+archivo+"_F.xls"
	end if
end if
if FileExists(archivo) = true then
	if	messagebox('Archivo Existente','Desea Reeplazar el Archivo de respaldado '+archivo, information!, OKCancel!, 2) = 1 then
		FileDelete(archivo)
		ret = dw_1.SaveAs(archivo, Excel!, true)	
		if ret = 1 then
			messagebox('Archivo Excel','Archivo respaldado en '+archivo, information!)
		else
			messagebox('Error','Archivo NO Respaldado', information!)
		end if
	else
		ret = dw_1.SaveAs(archivo, Excel!, true)	
		if ret = 1 then
			messagebox('Archivo Excel','Archivo respaldado en '+archivo, information!)
		else
			messagebox('Error','Archivo NO Respaldado', information!)
		end if
	end if	
else
	ret = dw_1.SaveAs(archivo, Excel!, true)	
	if ret = 1 then
		messagebox('Archivo Excel','Archivo respaldado en '+archivo, information!)
	else
		messagebox('Error','Archivo NO Respaldado', information!)
	end if
end if
end event

type cb_filtrar from commandbutton within w_ventas_del_cierre
integer x = 535
integer y = 1480
integer width = 238
integer height = 92
integer taborder = 40
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
dw_1.GroupCalc()
dw_1.SetRedraw(true)
end event

type cb_ordenar from commandbutton within w_ventas_del_cierre
integer x = 293
integer y = 1480
integer width = 238
integer height = 92
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

type cb_cerrar from commandbutton within w_ventas_del_cierre
integer x = 4681
integer y = 1480
integer width = 274
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ventas_del_cierre)
end event

type cb_imprimir from commandbutton within w_ventas_del_cierre
integer x = 55
integer y = 1480
integer width = 238
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_1.rowcount()>0 then
	f_Print( dw_1 )
end if	
end event

type dw_1 from datawindow within w_ventas_del_cierre
integer x = 46
integer y = 48
integer width = 2683
integer height = 1204
integer taborder = 10
string dataobject = "dw_ventas_del_cierre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;is_dw				= '1'
if getrow()>0 then
	il_row1		= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row1, true)
end if
end event

event rowfocuschanged;is_dw				= '1'
if getrow()>0 then
	il_row1		= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row1, true)
end if
end event

type gb_1 from groupbox within w_ventas_del_cierre
integer x = 55
integer y = 1276
integer width = 850
integer height = 192
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Rango de Fecha"
end type

type gb_2 from groupbox within w_ventas_del_cierre
integer x = 1449
integer y = 1276
integer width = 1243
integer height = 192
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Revisión por Tipo de Contratos"
end type

type dw_u_fecha from datawindow within w_ventas_del_cierre
integer x = 2747
integer y = 1020
integer width = 1454
integer height = 208
integer taborder = 30
string title = "none"
string dataobject = "dw_u_fecha_modif_aum"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_ventas_del_cierre
integer x = 4215
integer y = 1116
integer width = 421
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar U.Fecha"
end type

event clicked;long	ll_res

ll_res		= Messagebox("Grabar",'Desea Grabar Modificación U. Fecha Contrato ',Exclamation!, YesNo!, 2)
if ll_res = 1 then
	if dw_u_fecha.update() = 1 then
		commit using sqlca;
		dw_2.height				= 1204
	else
		rollback using sqlca;
		messagebox("Error Grabar","Error Grabar U.Fecha Contrato SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

