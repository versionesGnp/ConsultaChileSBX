forward
global type w_ingreso_manual_comisiones from window
end type
type cb_cta_cte from commandbutton within w_ingreso_manual_comisiones
end type
type cb_limpiar from commandbutton within w_ingreso_manual_comisiones
end type
type pb_imprimir from picturebutton within w_ingreso_manual_comisiones
end type
type pb_filtrar from picturebutton within w_ingreso_manual_comisiones
end type
type pb_ordenar from picturebutton within w_ingreso_manual_comisiones
end type
type pb_exportar from picturebutton within w_ingreso_manual_comisiones
end type
type pb_eliminar from picturebutton within w_ingreso_manual_comisiones
end type
type pb_nuevo from picturebutton within w_ingreso_manual_comisiones
end type
type pb_grabar from picturebutton within w_ingreso_manual_comisiones
end type
type pb_cerrar from picturebutton within w_ingreso_manual_comisiones
end type
type dw_lista from datawindow within w_ingreso_manual_comisiones
end type
type gb_1 from groupbox within w_ingreso_manual_comisiones
end type
end forward

global type w_ingreso_manual_comisiones from window
integer width = 3566
integer height = 1848
boolean titlebar = true
string title = "Ingreso Manual Comisiones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cta_cte cb_cta_cte
cb_limpiar cb_limpiar
pb_imprimir pb_imprimir
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_exportar pb_exportar
pb_eliminar pb_eliminar
pb_nuevo pb_nuevo
pb_grabar pb_grabar
pb_cerrar pb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_ingreso_manual_comisiones w_ingreso_manual_comisiones

on w_ingreso_manual_comisiones.create
this.cb_cta_cte=create cb_cta_cte
this.cb_limpiar=create cb_limpiar
this.pb_imprimir=create pb_imprimir
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_exportar=create pb_exportar
this.pb_eliminar=create pb_eliminar
this.pb_nuevo=create pb_nuevo
this.pb_grabar=create pb_grabar
this.pb_cerrar=create pb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_cta_cte,&
this.cb_limpiar,&
this.pb_imprimir,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_exportar,&
this.pb_eliminar,&
this.pb_nuevo,&
this.pb_grabar,&
this.pb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_ingreso_manual_comisiones.destroy
destroy(this.cb_cta_cte)
destroy(this.cb_limpiar)
destroy(this.pb_imprimir)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_exportar)
destroy(this.pb_eliminar)
destroy(this.pb_nuevo)
destroy(this.pb_grabar)
destroy(this.pb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_ingreso_manual_comisiones)
gs_ventana	= 'w_ingreso_manual_comisiones'
f_valida_objeto_1()
dw_lista.settransobject(sqlca)
dw_lista.object.t_titulo.text 	= gs_conexion
dw_lista.object.t_usuario.text	= gs_user
pb_nuevo.triggerevent(clicked!)
end event

type cb_cta_cte from commandbutton within w_ingreso_manual_comisiones
integer x = 1586
integer y = 1500
integer width = 389
integer height = 148
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Ctte."
end type

event clicked;if dw_lista.getrow() > 0 then
	gi_numero 			= dw_lista.getitemnumber(dw_lista.getrow(),'numero')
	gi_tipo_busqueda 	= 8
	Open(w_listado_contratos)
end if
end event

type cb_limpiar from commandbutton within w_ingreso_manual_comisiones
integer x = 690
integer y = 1500
integer width = 283
integer height = 148
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;long	ll_new
dw_lista.reset()
ll_new	= dw_lista.insertrow(0)
dw_lista.scrolltorow(ll_new)
dw_lista.setitem(ll_new,'estado_valor',0)
dw_lista.setitem(ll_new,'estado_grabar',0)
dw_lista.setfocus()
dw_lista.setcolumn('base')

end event

type pb_imprimir from picturebutton within w_ingreso_manual_comisiones
event ue_mousemove pbm_mousemove
integer x = 2757
integer y = 1504
integer width = 165
integer height = 148
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;long		ll_tot_reg
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg > 0 then
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false				
end if
end event

type pb_filtrar from picturebutton within w_ingreso_manual_comisiones
event ue_mousemove pbm_mousemove
integer x = 2587
integer y = 1504
integer width = 165
integer height = 148
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type pb_ordenar from picturebutton within w_ingreso_manual_comisiones
event ue_mousemove pbm_mousemove
integer x = 2418
integer y = 1504
integer width = 165
integer height = 148
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_exportar from picturebutton within w_ingreso_manual_comisiones
event ue_mousemove pbm_mousemove
integer x = 2249
integer y = 1504
integer width = 165
integer height = 148
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_eliminar from picturebutton within w_ingreso_manual_comisiones
integer x = 1193
integer y = 1500
integer width = 169
integer height = 148
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "delete.bmp"
string disabledname = "delete_no.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_base, ls_serie
Long		 ll_fila, ll_resp
Double	ll_numero
if dw_lista.rowcount() > 0 then
	ll_fila		= dw_lista.getrow()
	ls_base		= dw_lista.getitemstring(ll_fila,'base')
	ls_serie		= dw_lista.getitemstring(ll_fila,'serie')
	ll_numero	= dw_lista.getitemnumber(ll_fila,'numero')
	if ls_base='' or isnull(ls_base) or ls_serie='' or isnull(ls_serie) or ll_numero=0 or isnull(ll_numero) then
		dw_lista.deleterow(ll_fila)
	else
		ll_resp = MessageBox("Eliminar", "Está seguro Eliminar Base: "+ls_base+" , Serie: "+ls_serie+" , Número: "+string(ll_numero),	Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			dw_lista.deleterow(ll_fila)
			DELETE FROM "COMISION_PROMESA"  
			WHERE ( "COMISION_PROMESA"."BASE" = :ls_base ) AND  
					( "COMISION_PROMESA"."SERIE" = :ls_serie ) AND  
					( "COMISION_PROMESA"."NUMERO" = :ll_numero )   
			Using	sqlca  ;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		END IF		
	end if
	if dw_lista.rowcount() = 0 then
		pb_nuevo.triggerevent(clicked!)
	end if
end if
end event

type pb_nuevo from picturebutton within w_ingreso_manual_comisiones
integer x = 110
integer y = 1500
integer width = 169
integer height = 148
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "nuevo.bmp"
string disabledname = "nuevo_no.bmp"
alignment htextalign = left!
end type

event clicked;long	ll_new
ll_new	= dw_lista.insertrow(0)
dw_lista.scrolltorow(ll_new)
dw_lista.setitem(ll_new,'estado_valor',0)
dw_lista.setitem(ll_new,'estado_grabar',0)
dw_lista.setfocus()
dw_lista.setcolumn('base')
end event

type pb_grabar from picturebutton within w_ingreso_manual_comisiones
integer x = 283
integer y = 1500
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar.bmp"
string disabledname = "grabar_no.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_base,ls_serie
long		ll_tot_reg,ll_indi,ll_estado_grabar,ll_sum_graba=0
double	ldb_c_pie,ldb_c_pri,ldb_c_seg,ldb_c_ter,ldb_c_cua,ldb_c_qui,ldb_c_sex,ldb_c_sep,ldb_c_oct,ldb_c_nov,ll_numero

ll_tot_reg					= dw_lista.rowcount()
if ll_tot_reg > 0 then
	for ll_indi = 1 to ll_tot_reg
		ls_base				= dw_lista.getitemstring(ll_indi,'base')
		ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
		ll_numero			= dw_lista.getitemnumber(ll_indi,'numero')
		ldb_c_pie			= double(dw_lista.getitemnumber(ll_indi,'c_pie'))
		ldb_c_pri				= double(dw_lista.getitemnumber(ll_indi,'c_primera'))
		ldb_c_seg			= double(dw_lista.getitemnumber(ll_indi,'c_segunda'))
		ldb_c_ter			= double(dw_lista.getitemnumber(ll_indi,'c_tercera'))
		ldb_c_cua			= double(dw_lista.getitemnumber(ll_indi,'c_cuarta'))
		ldb_c_qui			= double(dw_lista.getitemnumber(ll_indi,'c_quinta'))
		ldb_c_sex			= double(dw_lista.getitemnumber(ll_indi,'c_sexta'))
		ldb_c_sep			= double(dw_lista.getitemnumber(ll_indi,'c_septima'))
		ldb_c_oct			= double(dw_lista.getitemnumber(ll_indi,'c_octava'))
		ldb_c_nov			= double(dw_lista.getitemnumber(ll_indi,'c_novena'))
		ll_estado_grabar	= dw_lista.getitemnumber(ll_indi,'estado_grabar')
		
		if (ldb_c_pie=0 or isnull(ldb_c_pie)) and (ldb_c_pri=0 or isnull(ldb_c_pri)) and (ldb_c_seg=0 or isnull(ldb_c_seg)) and &
			(ldb_c_ter=0 or isnull(ldb_c_ter)) and (ldb_c_cua=0 or isnull(ldb_c_cua)) and (ldb_c_qui=0 or isnull(ldb_c_qui)) and &
			(ldb_c_sex=0 or isnull(ldb_c_sex)) and (ldb_c_sep=0 or isnull(ldb_c_sep)) and (ldb_c_oct=0 or isnull(ldb_c_oct)) and &
			(ldb_c_nov=0 or isnull(ldb_c_nov)) then
			dw_lista.deleterow(ll_indi)
			ll_tot_reg		= ll_tot_reg - 1
			ll_indi			= ll_indi - 1
		else
			if ll_estado_grabar=1 then //update
				UPDATE "COMISION_PROMESA"  
				SET 	"BASE" 			= :ls_base,   
						"SERIE" 			= :ls_serie,   
						"NUMERO" 		= :ll_numero,   
						"C_PIE" 			= :ldb_c_pie,   
						"C_PRIMERA" 	= :ldb_c_pri,   
						"C_SEGUNDA" 	= :ldb_c_seg,   
						"C_TERCERA" 	= :ldb_c_ter,   
						"C_CUARTA" 		= :ldb_c_cua,   
						"C_QUINTA" 		= :ldb_c_qui,   
						"C_SEXTA" 		= :ldb_c_sex,
						"C_SEPTIMA"		= :ldb_c_sep,  
         			"C_OCTAVA"		= :ldb_c_oct,
						"C_NOVENA"		= :ldb_c_nov  
				WHERE "COMISION_PROMESA"."BASE" = :ls_base AND  
						"COMISION_PROMESA"."SERIE" = :ls_serie AND  
						"COMISION_PROMESA"."NUMERO" = :ll_numero   
				USING	sqlca ;
				if sqlca.sqlcode=0 then
					commit;
					ll_sum_graba ++
				else
					rollback;
				end if
			elseif ll_estado_grabar=2 then //insert
				INSERT INTO "COMISION_PROMESA"  
							( "BASE",	"SERIE",		"NUMERO",	"C_PIE",		"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA" )  
				VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ldb_c_pie, :ldb_c_pri,		:ldb_c_seg,		:ldb_c_ter,		:ldb_c_cua,	:ldb_c_qui,	:ldb_c_sex,	:ldb_c_sep,		:ldb_c_oct,	:ldb_c_nov )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					ll_sum_graba ++
				else
					rollback;
				end if
			end if
		end if
	next
	if ll_sum_graba > 0 then
		messagebox("Grabar","Grabación Exitosa")
	else
		messagebox("Advertencia","No Registró dato Válido para Grabar")
	end if
end if
end event

type pb_cerrar from picturebutton within w_ingreso_manual_comisiones
integer x = 3287
integer y = 1504
integer width = 169
integer height = 148
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_ingreso_manual_comisiones)
end event

type dw_lista from datawindow within w_ingreso_manual_comisiones
integer x = 59
integer y = 60
integer width = 3447
integer height = 1364
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_manual_comisiones"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;Long		 ll_fila,ll_cod_parque,ll_credito
Double	ll_cuota_pie, ll_cuota_1, ll_cuota_2, ll_cuota_3,ll_cuota_4, ll_cuota_5, ll_cuota_6, &
			ll_cuota_7, ll_cuota_8, ll_cuota_9,ll_precio, ll_pie, ld_pie_porc,ll_valor_cta,correlativo,&
			c_pie,c_primera,c_segunda,c_tercera,c_cuarta,c_quinta,c_sexta,c_septima,c_octava,c_novena,&
			ll_tot_por,ll_porce_venta,c_pie_aux,c_primera_aux,c_segunda_aux,c_tercera_aux,c_cuarta_aux,&
			c_quinta_aux,c_sexta_aux,c_septima_aux,c_octava_aux,c_novena_aux,ll_numero
String	ls_area, ls_forma_pago, ls_tipo_cons,ls_base, ls_serie, ls_columna
ls_columna	= dwo.name
ll_fila		= row
ll_tot_por	= this.getitemnumber(ll_fila,'tot_porcen')
ls_base		= this.getitemstring(ll_fila,'base')
ls_serie		= this.getitemstring(ll_fila,'serie')
ll_numero	= this.getitemnumber(ll_fila,'numero')
if isnull(ll_numero) and ls_columna='numero' then ll_numero = Double(data)//this.getitemnumber(ll_fila,'numero')
this.accepttext()
CHOOSE CASE ls_base
	CASE 'O'
		SELECT	"OFERTA_V"."PORCE_VENTA"
		INTO 		:ll_porce_venta
		FROM 		"CADENA",   
					"OFERTA_V",   
					"PAGO_OFERTA"  
		WHERE 	( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
					( "CADENA"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ESTATUS_COMISION" = '1') AND
					(( "CADENA"."ESTADO" = 'V' ) OR 
					( "CADENA"."ESTADO" = 'C' )) AND
					( ( "CADENA"."CODIGO" = :ls_base ) AND  
					( "CADENA"."SERIE" = :ls_serie ) AND  
					( "CADENA"."NUMERO" = :ll_numero ) ) 
		Using		sqlca;

	CASE 'A'
		SELECT	"ANEXO_AUMENTO"."PORCE_AGE"
		INTO 		:ll_porce_venta
		FROM 		"CADENA",   
					"ANEXO_AUMENTO",   
					"PAGO_AUMENTO"  
		WHERE 	( "PAGO_AUMENTO"."SERIE_M" = "ANEXO_AUMENTO"."SERIE_M" ) and  
					( "PAGO_AUMENTO"."NRO_AUMENTO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
					( "PAGO_AUMENTO"."FOLIO" = "ANEXO_AUMENTO"."ULT_FOLIO" ) and  
					( "CADENA"."SERIE" = "PAGO_AUMENTO"."SERIE_M" ) and  
					( "CADENA"."NUMERO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
					( "ANEXO_AUMENTO"."ESTATUS_COMISION" = '1') AND
					(( "CADENA"."ESTADO" = 'V' ) OR 
					( "CADENA"."ESTADO" = 'C' )) AND
					( ( "CADENA"."CODIGO" = :ls_base ) AND  
					( "CADENA"."SERIE" = :ls_serie ) AND  
					( "CADENA"."NUMERO" = :ll_numero ) ) 
		Using		sqlca;

	CASE 'L'
		SELECT	"ANEXO_LIBERADOR"."PORCE_AGE"
		INTO 		:ll_porce_venta
		FROM 		"ANEXO_LIBERADOR",   
					"CADENA",   
					"PAGO_LIBERADOR"  
		WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
					( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
					( "CADENA"."SERIE" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					( "ANEXO_LIBERADOR"."ESTATUS_COMISION" = '1') AND
					( "CADENA"."NUMERO" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
					(( "CADENA"."ESTADO" = 'V' ) OR 
					( "CADENA"."ESTADO" = 'C' )) AND
					( ( "CADENA"."CODIGO" = :ls_base ) AND  
					( "CADENA"."SERIE" = :ls_serie ) AND  
					( "CADENA"."NUMERO" = :ll_numero ) )   
		Using		sqlca;
END CHOOSE
CHOOSE CASE ls_columna
	CASE 'c_pie','c_primera','c_segunda','c_tercera','c_cuarta','c_quinta','c_sexta','c_septima','c_octava','c_novena'
		ll_tot_por	= this.getitemnumber(ll_fila,'tot_porcen')
		if ((ls_base='O' or ls_base='A') and ll_tot_por>ll_porce_venta) or (ls_base='L' and ll_tot_por>ll_porce_venta) then
			messagebox("Advertencia","La Suma Total % Sobrepasan al Tope Máximo de Comisión, serán cambiados a sus Valores Originales")
			CHOOSE CASE ls_base
				CASE 'O'
					SELECT	"PAGO_OFERTA"."AREA",   
								"OFERTA_V"."FORMA_PAGO",   
								"OFERTA_V"."TIPO_CONS",   
								"PAGO_OFERTA"."PRECIO",   
								"PAGO_OFERTA"."NRO_CUOTAS",   
								"PAGO_OFERTA"."VALOR_CUOTA",
								"PAGO_OFERTA"."PIE",
								"CADENA"."COD_PARQUE"
					INTO 		:ls_area,   
								:ls_forma_pago,   
								:ls_tipo_cons,   
								:ll_precio,   
								:ll_credito,   
								:ll_valor_cta,
								:ll_pie,
								:ll_cod_parque
					FROM 		"CADENA",   
								"OFERTA_V",   
								"PAGO_OFERTA"  
					WHERE 	( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
								( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
								( "CADENA"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								( "CADENA"."NUMERO" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								( "OFERTA_V"."ESTATUS_COMISION" = '1') AND
								(( "CADENA"."ESTADO" = 'V' ) OR 
								( "CADENA"."ESTADO" = 'C' )) AND
								( ( "CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) ) 
					Using		sqlca;
					if sqlca.sqlcode = 0 then
						if ll_precio>0 then
							if ll_pie = 0 and ll_credito = 1 then
								ld_pie_porc	= round(((ll_valor_cta * 100) / ll_precio),2)
							else
								ld_pie_porc	= round(((ll_pie * 100) / ll_precio),2)
							end if
						else
							ld_pie_porc		= 0
						end if
						setnull(C_PIE_AUX);setnull(C_PRIMERA_AUX);setnull(C_SEGUNDA_AUX);setnull(C_TERCERA_AUX)
						setnull(C_CUARTA_AUX);setnull(C_QUINTA_AUX);setnull(C_SEXTA_AUX)
						setnull(C_PIE);setnull(C_PRIMERA);setnull(C_SEGUNDA);setnull(C_TERCERA)
						setnull(C_CUARTA);setnull(C_QUINTA);setnull(C_SEXTA);setnull(C_SEPTIMA);setnull(C_OCTAVA);setnull(C_NOVENA)
						if ld_pie_porc < 10 then
							SELECT	CORRELATIVO ,	C_PIE ,		C_PRIMERA ,			C_SEGUNDA ,			C_TERCERA ,			C_CUARTA ,		C_QUINTA ,		C_SEXTA,			C_SEPTIMA,		C_OCTAVA,		C_NOVENA  	AS PORCENTAJE  
							INTO 		:correlativo,	:c_pie_aux,	:c_primera_aux,	:c_segunda_aux,	:c_tercera_aux,	:c_cuarta_aux,	:c_quinta_aux,	:c_sexta_aux,	:c_septima_aux,:c_octava_aux, :c_novena_aux
							FROM 		PORCENTAJE_COMISIONES  
							WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
										AREA = :ls_area AND T_CONS = :ls_tipo_cons AND ( CREDITO_MIN <= :ll_credito AND CREDITO >= :ll_credito ) AND
									 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0 and 
									 COD_PARQUE = :ll_cod_parque;
						elseif ld_pie_porc >= 10 then
							SELECT	CORRELATIVO ,	C_PIE ,		C_PRIMERA ,			C_SEGUNDA ,			C_TERCERA ,			C_CUARTA ,		C_QUINTA ,		C_SEXTA,			C_SEPTIMA,		C_OCTAVA,		C_NOVENA  	AS PORCENTAJE  
							INTO 		:correlativo,	:c_pie_aux,	:c_primera_aux,	:c_segunda_aux,	:c_tercera_aux,	:c_cuarta_aux,	:c_quinta_aux,	:c_sexta_aux,	:c_septima_aux,:c_octava_aux, :c_novena_aux
							FROM 		PORCENTAJE_COMISIONES  
							WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
										AREA = :ls_area AND T_CONS = :ls_tipo_cons AND
									 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0  and 
									 COD_PARQUE = :ll_cod_parque;
						end if
						if sqlca.sqlcode = 0 and not isnull(correlativo) then
							dw_lista.deleterow(ll_fila)
							ll_fila	= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_fila)
							dw_lista.setitem(ll_fila,'base',ls_base)
							dw_lista.setitem(ll_fila,'serie',ls_serie)
							dw_lista.setitem(ll_fila,'numero',ll_numero)
							dw_lista.setitem(ll_fila,'c_pie',c_pie_aux)
							dw_lista.setitem(ll_fila,'c_primera',c_primera_aux)
							dw_lista.setitem(ll_fila,'c_segunda',c_segunda_aux)
							dw_lista.setitem(ll_fila,'c_tercera',c_tercera_aux)
							dw_lista.setitem(ll_fila,'c_cuarta',c_cuarta_aux)
							dw_lista.setitem(ll_fila,'c_quinta',c_quinta_aux)
							dw_lista.setitem(ll_fila,'c_sexta',c_sexta_aux)
							dw_lista.setitem(ll_fila,'c_septima',c_septima_aux)
							dw_lista.setitem(ll_fila,'c_octava',c_octava_aux)
							dw_lista.setitem(ll_fila,'c_novena',c_novena_aux)
							dw_lista.setitem(ll_fila,'estado_valor',0)
							dw_lista.setitem(ll_fila,'estado_grabar',0)
							dw_lista.accepttext()
						else
							messagebox("Advertencia","No Registra Definición")
						end if
					else
						messagebox("Advertencia","No existe Promesa, el Estado es distino a Vgte./Cancel o Comisión Antigua")
						dw_lista.setitem(ll_fila,'estado_valor',1)
					end if

				CASE 'A'
					SELECT	"ANEXO_AUMENTO"."AREA",   
								"ANEXO_AUMENTO"."TIPO_SEPULT",   
								"PAGO_AUMENTO"."PRECIO",   
								"PAGO_AUMENTO"."NRO_CUOTAS",   
								"PAGO_AUMENTO"."VALOR_CUOTA",
								"PAGO_AUMENTO"."PIE",
								"CADENA"."COD_PARQUE"
					INTO 		:ls_area,   
								:ls_tipo_cons,   
								:ll_precio,   
								:ll_credito,   
								:ll_valor_cta,
								:ll_pie,
								:ll_cod_parque
					FROM 		"CADENA",   
								"ANEXO_AUMENTO",   
								"PAGO_AUMENTO"  
					WHERE 	( "PAGO_AUMENTO"."SERIE_M" = "ANEXO_AUMENTO"."SERIE_M" ) and  
								( "PAGO_AUMENTO"."NRO_AUMENTO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
								( "PAGO_AUMENTO"."FOLIO" = "ANEXO_AUMENTO"."ULT_FOLIO" ) and  
								( "CADENA"."SERIE" = "PAGO_AUMENTO"."SERIE_M" ) and  
								( "CADENA"."NUMERO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
								( "ANEXO_AUMENTO"."ESTATUS_COMISION" = '1') AND
								(( "CADENA"."ESTADO" = 'V' ) OR 
								( "CADENA"."ESTADO" = 'C' )) AND
								( ( "CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) ) 
					Using		sqlca;
					if sqlca.sqlcode = 0 then
						if ll_precio>0 then
							if ll_pie = 0 and ll_credito = 1 then
								ld_pie_porc	= round(((ll_valor_cta * 100) / ll_precio),2)
							else
								ld_pie_porc	= round(((ll_pie * 100) / ll_precio),2)
							end if
						else
							ld_pie_porc		= 0
						end if
						setnull(C_PIE_AUX);setnull(C_PRIMERA_AUX);setnull(C_SEGUNDA_AUX);setnull(C_TERCERA_AUX)
						setnull(C_CUARTA_AUX);setnull(C_QUINTA_AUX);setnull(C_SEXTA_AUX)
						setnull(C_PIE);setnull(C_PRIMERA);setnull(C_SEGUNDA);setnull(C_TERCERA)
						setnull(C_CUARTA);setnull(C_QUINTA);setnull(C_SEXTA);setnull(C_SEPTIMA);setnull(C_OCTAVA);setnull(C_NOVENA)
						if ld_pie_porc < 10 then
							SELECT	CORRELATIVO ,	C_PIE ,		C_PRIMERA ,			C_SEGUNDA ,			C_TERCERA ,			C_CUARTA ,		C_QUINTA ,		C_SEXTA,			C_SEPTIMA,		C_OCTAVA,		C_NOVENA  	AS PORCENTAJE  
							INTO 		:correlativo,	:c_pie_aux,	:c_primera_aux,	:c_segunda_aux,	:c_tercera_aux,	:c_cuarta_aux,	:c_quinta_aux,	:c_sexta_aux,  :c_septima_aux,:c_octava_aux, :c_novena_aux
							FROM 		PORCENTAJE_COMISIONES  
							WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
										AREA = :ls_area AND T_CONS = :ls_tipo_cons AND ( CREDITO_MIN <= :ll_credito AND CREDITO >= :ll_credito ) AND
									 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA ) > 0 and 
									 COD_PARQUE = :ll_cod_parque;
						elseif ld_pie_porc >= 10 then
							SELECT	CORRELATIVO ,	C_PIE ,		C_PRIMERA ,			C_SEGUNDA ,			C_TERCERA ,			C_CUARTA ,		C_QUINTA ,		C_SEXTA,			C_SEPTIMA,		C_OCTAVA,		C_NOVENA  	AS PORCENTAJE  
							INTO 		:correlativo,	:c_pie_aux,	:c_primera_aux,	:c_segunda_aux,	:c_tercera_aux,	:c_cuarta_aux,	:c_quinta_aux,	:c_sexta_aux,  :c_septima_aux,:c_octava_aux,  :c_novena_aux
							FROM 		PORCENTAJE_COMISIONES  
							WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
										AREA = :ls_area AND T_CONS = :ls_tipo_cons AND
									 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0  and 
									 COD_PARQUE = :ll_cod_parque;
						end if
						if sqlca.sqlcode = 0 and not isnull(correlativo) then
							dw_lista.deleterow(ll_fila)
							ll_fila	= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_fila)
							dw_lista.setitem(ll_fila,'base',ls_base)
							dw_lista.setitem(ll_fila,'serie',ls_serie)
							dw_lista.setitem(ll_fila,'numero',ll_numero)
							dw_lista.setitem(ll_fila,'c_pie',c_pie_aux)
							dw_lista.setitem(ll_fila,'c_primera',c_primera_aux)
							dw_lista.setitem(ll_fila,'c_segunda',c_segunda_aux)
							dw_lista.setitem(ll_fila,'c_tercera',c_tercera_aux)
							dw_lista.setitem(ll_fila,'c_cuarta',c_cuarta_aux)
							dw_lista.setitem(ll_fila,'c_quinta',c_quinta_aux)
							dw_lista.setitem(ll_fila,'c_sexta',c_sexta_aux)
							dw_lista.setitem(ll_fila,'c_septima',c_septima_aux)
							dw_lista.setitem(ll_fila,'c_octava',c_octava_aux)
							dw_lista.setitem(ll_fila,'c_novena',c_novena_aux)
							dw_lista.setitem(ll_fila,'estado_valor',0)
							dw_lista.setitem(ll_fila,'estado_grabar',0)
							dw_lista.accepttext()
						else
							messagebox("Advertencia","No Registra Definición")
						end if
					else
						messagebox("Advertencia","No existe Aumento Capacidad, el Estado es distino a Vgte./Cancel o Comisión Antigua")
						dw_lista.setitem(ll_fila,'estado_valor',1)
					end if

				CASE 'L'
					SELECT	"ANEXO_LIBERADOR"."FORMA_PAGO",   
								"PAGO_LIBERADOR"."PRECIO",   
								"PAGO_LIBERADOR"."NRO_CUOTAS",   
								"PAGO_LIBERADOR"."PIE",
								"CADENA"."COD_PARQUE",
								"PAGO_LIBERADOR"."VALOR_CUOTA"   
					INTO 		:ls_forma_pago,   
								:ll_precio,   
								:ll_credito,   
								:ll_pie,
								:ll_cod_parque,
								:ll_valor_cta
					FROM 		"ANEXO_LIBERADOR",   
								"CADENA",   
								"PAGO_LIBERADOR"  
					WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
								( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
								( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
								( "CADENA"."SERIE" = "PAGO_LIBERADOR"."SERIE_M" ) and  
								( "ANEXO_LIBERADOR"."ESTATUS_COMISION" = '1') AND
								( "CADENA"."NUMERO" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
								(( "CADENA"."ESTADO" = 'V' ) OR 
								( "CADENA"."ESTADO" = 'C' )) AND
								( ( "CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) )   
					Using		sqlca;
					if sqlca.sqlcode =0 then
						if ll_precio>0 then
							if ll_pie = 0 and ll_credito = 1 then
								ld_pie_porc	= round(((ll_valor_cta * 100) / ll_precio),2)
							else
								ld_pie_porc	= round(((ll_pie * 100) / ll_precio),2)
							end if
						else
							ld_pie_porc		= 0
						end if
						setnull(C_PIE_AUX);setnull(C_PRIMERA_AUX);setnull(C_SEGUNDA_AUX);setnull(C_TERCERA_AUX)
						setnull(C_CUARTA_AUX);setnull(C_QUINTA_AUX);setnull(C_SEXTA_AUX)
						setnull(C_PIE);setnull(C_PRIMERA);setnull(C_SEGUNDA);setnull(C_TERCERA)
						setnull(C_CUARTA);setnull(C_QUINTA);setnull(C_SEXTA);setnull(C_SEPTIMA);setnull(C_OCTAVA);setnull(C_NOVENA)
						if ld_pie_porc < 10 then
							SELECT	CORRELATIVO ,	C_PIE ,		C_PRIMERA ,			C_SEGUNDA ,			C_TERCERA ,			C_CUARTA ,		C_QUINTA ,		C_SEXTA,			C_SEPTIMA,		C_OCTAVA,		C_NOVENA  	AS PORCENTAJE  
							INTO 		:correlativo,	:c_pie_aux,	:c_primera_aux,	:c_segunda_aux,	:c_tercera_aux,	:c_cuarta_aux,	:c_quinta_aux,	:c_sexta_aux,	:c_septima_aux,:c_octava_aux,	:c_novena_aux
							FROM 		PORCENTAJE_COMISIONES  
							WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
										AREA = 'X' AND T_CONS = 'X' AND ( CREDITO_MIN <= :ll_credito AND CREDITO >= :ll_credito ) and
									 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA ) > 0  and
									 ( COD_PARQUE = :ll_cod_parque );
						elseif ld_pie_porc >= 10 then
							SELECT	CORRELATIVO ,	C_PIE ,		C_PRIMERA ,			C_SEGUNDA ,			C_TERCERA ,			C_CUARTA ,		C_QUINTA ,		C_SEXTA,			C_SEPTIMA,		C_OCTAVA,		C_NOVENA   	AS PORCENTAJE  
							INTO 		:correlativo,	:c_pie_aux,	:c_primera_aux,	:c_segunda_aux,	:c_tercera_aux,	:c_cuarta_aux,	:c_quinta_aux,	:c_sexta_aux,	:c_septima_aux,:c_octava_aux,	:c_novena_aux
							FROM 		PORCENTAJE_COMISIONES  
							WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
										AREA = 'X' AND T_CONS = 'X' and 
									 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0  and
									 ( COD_PARQUE = :ll_cod_parque );
						end if
						if sqlca.sqlcode = 0 and not isnull(correlativo) then
							dw_lista.deleterow(ll_fila)
							ll_fila	= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_fila)
							dw_lista.setitem(ll_fila,'base',ls_base)
							dw_lista.setitem(ll_fila,'serie',ls_serie)
							dw_lista.setitem(ll_fila,'numero',ll_numero)
							dw_lista.setitem(ll_fila,'c_pie',c_pie_aux)
							dw_lista.setitem(ll_fila,'c_primera',c_primera_aux)
							dw_lista.setitem(ll_fila,'c_segunda',c_segunda_aux)
							dw_lista.setitem(ll_fila,'c_tercera',c_tercera_aux)
							dw_lista.setitem(ll_fila,'c_cuarta',c_cuarta_aux)
							dw_lista.setitem(ll_fila,'c_quinta',c_quinta_aux)
							dw_lista.setitem(ll_fila,'c_sexta',c_sexta_aux)
							dw_lista.setitem(ll_fila,'c_septima',c_septima_aux)
							dw_lista.setitem(ll_fila,'c_octava',c_octava_aux)
							dw_lista.setitem(ll_fila,'c_novena',c_novena_aux)
							dw_lista.setitem(ll_fila,'estado_valor',0)
							dw_lista.setitem(ll_fila,'estado_grabar',0)
							dw_lista.accepttext()
						else
							messagebox("Advertencia","No Registra Definición")
						end if
					else
						dw_lista.setitem(ll_fila,'estado_valor',1)
						messagebox("Advertencia","No existe Liberador, el Estado es distino a Vgte./Cancel o Comisión Antigua")
					end if
			END CHOOSE
		end if

	CASE 'base','serie','numero'
		if (ls_base<>'' or not isnull(ls_base)) and (ls_serie<>'' or not isnull(ls_serie)) and ll_numero > 0 then
			dw_lista.setitem(ll_fila,'estado_valor',0)
			SELECT 	"COMISION_PROMESA"."C_PIE",   
						"COMISION_PROMESA"."C_PRIMERA",   
						"COMISION_PROMESA"."C_SEGUNDA",   
						"COMISION_PROMESA"."C_TERCERA",   
						"COMISION_PROMESA"."C_CUARTA",   
						"COMISION_PROMESA"."C_QUINTA",   
						"COMISION_PROMESA"."C_SEXTA",
						"COMISION_PROMESA"."C_SEPTIMA",   
						"COMISION_PROMESA"."C_OCTAVA",   
						"COMISION_PROMESA"."C_NOVENA"
			INTO 		:ll_cuota_pie,   
						:ll_cuota_1,   
						:ll_cuota_2,   
						:ll_cuota_3,   
						:ll_cuota_4,   
						:ll_cuota_5,   
						:ll_cuota_6,
						:ll_cuota_7,   
						:ll_cuota_8,   
						:ll_cuota_9  
			FROM 		"COMISION_PROMESA"  
			WHERE  ( "COMISION_PROMESA"."BASE" = :ls_base ) AND  
					 ( "COMISION_PROMESA"."SERIE" = :ls_serie ) AND  
					 ( "COMISION_PROMESA"."NUMERO" = :ll_numero )   
			Using		sqlca  ;
			if sqlca.sqlcode=0 then
				this.setitem(ll_fila,'estado_grabar',1)
				this.setitem(ll_fila,'c_pie',ll_cuota_pie)
				this.setitem(ll_fila,'c_primera',ll_cuota_1)
				this.setitem(ll_fila,'c_segunda',ll_cuota_2)
				this.setitem(ll_fila,'c_tercera',ll_cuota_3)
				this.setitem(ll_fila,'c_cuarta',ll_cuota_4)
				this.setitem(ll_fila,'c_quinta',ll_cuota_5)
				this.setitem(ll_fila,'c_sexta',ll_cuota_6)
				this.setitem(ll_fila,'c_septima',ll_cuota_7)
				this.setitem(ll_fila,'c_octava',ll_cuota_8)
				this.setitem(ll_fila,'c_novena',ll_cuota_9)
				this.accepttext()
			elseif sqlca.sqlcode=100 then
				messagebox("Advertencia","Ctto. NO existe en Tabla COMISION_PROMESA, se definirá automáticamente")
				CHOOSE CASE ls_base
					CASE 'O'
						SELECT	"PAGO_OFERTA"."AREA",   
									"OFERTA_V"."FORMA_PAGO",   
									"OFERTA_V"."TIPO_CONS",   
									"PAGO_OFERTA"."PRECIO",   
									"PAGO_OFERTA"."NRO_CUOTAS",   
									"PAGO_OFERTA"."VALOR_CUOTA",
									"PAGO_OFERTA"."PIE",
									"CADENA"."COD_PARQUE"
						INTO 		:ls_area,   
									:ls_forma_pago,   
									:ls_tipo_cons,   
									:ll_precio,   
									:ll_credito,   
									:ll_valor_cta,
									:ll_pie,
									:ll_cod_parque
						FROM 		"CADENA",   
									"OFERTA_V",   
									"PAGO_OFERTA"  
						WHERE 	( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
									( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
									( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
									( "CADENA"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
									( "CADENA"."NUMERO" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
									( "OFERTA_V"."ESTATUS_COMISION" = '1') AND
									(( "CADENA"."ESTADO" = 'V' ) OR 
									( "CADENA"."ESTADO" = 'C' )) AND
									( ( "CADENA"."CODIGO" = :ls_base ) AND  
									( "CADENA"."SERIE" = :ls_serie ) AND  
									( "CADENA"."NUMERO" = :ll_numero ) ) 
						Using		sqlca;
						if sqlca.sqlcode = 0 then
							if ll_precio>0 then
								if ll_pie = 0 and ll_credito = 1 then
									ld_pie_porc	= round(((ll_valor_cta * 100) / ll_precio),2)
								else
									ld_pie_porc	= round(((ll_pie * 100) / ll_precio),2)
								end if
							else
								ld_pie_porc		= 0
							end if
							setnull(C_PIE);setnull(C_PRIMERA);setnull(C_SEGUNDA);setnull(C_TERCERA)
							setnull(C_CUARTA);setnull(C_QUINTA);setnull(C_SEXTA);setnull(C_SEPTIMA);setnull(C_OCTAVA);setnull(C_NOVENA)
							if ld_pie_porc < 10 then
								SELECT	CORRELATIVO ,	C_PIE ,	C_PRIMERA ,	C_SEGUNDA ,	C_TERCERA ,	C_CUARTA ,	C_QUINTA ,	C_SEXTA,		C_SEPTIMA,		C_OCTAVA,		C_NOVENA  AS PORCENTAJE  
								INTO 		:correlativo,	:c_pie,	:c_primera,	:c_segunda,	:c_tercera,	:c_cuarta,	:c_quinta,	:c_sexta,	:c_septima,		:c_octava,		:c_novena
								FROM 		PORCENTAJE_COMISIONES  
								WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
											AREA = :ls_area AND T_CONS = :ls_tipo_cons AND ( CREDITO_MIN <= :ll_credito AND CREDITO >= :ll_credito ) AND
										 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA ) > 0 and 
										 COD_PARQUE = :ll_cod_parque;
							elseif ld_pie_porc >= 10 then
								SELECT	CORRELATIVO ,	C_PIE ,	C_PRIMERA ,	C_SEGUNDA ,	C_TERCERA ,	C_CUARTA ,	C_QUINTA ,	C_SEXTA,		C_SEPTIMA,		C_OCTAVA,		C_NOVENA  AS PORCENTAJE  
								INTO 		:correlativo,	:c_pie,	:c_primera,	:c_segunda,	:c_tercera,	:c_cuarta,	:c_quinta,	:c_sexta,	:c_septima,		:c_octava,		:c_novena
								FROM 		PORCENTAJE_COMISIONES  
								WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
											AREA = :ls_area AND T_CONS = :ls_tipo_cons AND
										 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA ) > 0  and 
										 COD_PARQUE = :ll_cod_parque;
							end if
							if sqlca.sqlcode = 0 and not isnull(correlativo) then
								dw_lista.setitem(ll_fila,'c_pie',c_pie)
								dw_lista.setitem(ll_fila,'c_primera',c_primera)
								dw_lista.setitem(ll_fila,'c_segunda',c_segunda)
								dw_lista.setitem(ll_fila,'c_tercera',c_tercera)
								dw_lista.setitem(ll_fila,'c_cuarta',c_cuarta)
								dw_lista.setitem(ll_fila,'c_quinta',c_quinta)
								dw_lista.setitem(ll_fila,'c_sexta',c_sexta)
								dw_lista.setitem(ll_fila,'c_septima',c_septima)
								dw_lista.setitem(ll_fila,'c_octava',c_octava)
								dw_lista.setitem(ll_fila,'c_novena',c_novena)
								dw_lista.setitem(ll_fila,'estado_grabar',2)
								dw_lista.accepttext()
							else
								messagebox("Advertencia","No Registra Definición")
							end if
						else
							messagebox("Advertencia","No existe Promesa, el Estado es distino a Vgte./Cancel o Comisión Antigua")
							dw_lista.setitem(ll_fila,'estado_valor',1)
						end if

					CASE 'A'
						SELECT	"ANEXO_AUMENTO"."AREA",   
									"ANEXO_AUMENTO"."TIPO_SEPULT",   
									"PAGO_AUMENTO"."PRECIO",   
									"PAGO_AUMENTO"."NRO_CUOTAS",   
									"PAGO_AUMENTO"."VALOR_CUOTA",
									"PAGO_AUMENTO"."PIE",
									"CADENA"."COD_PARQUE"
						INTO 		:ls_area,   
									:ls_tipo_cons,   
									:ll_precio,   
									:ll_credito,   
									:ll_valor_cta,
									:ll_pie,
									:ll_cod_parque
						FROM 		"CADENA",   
									"ANEXO_AUMENTO",   
									"PAGO_AUMENTO"  
						WHERE 	( "PAGO_AUMENTO"."SERIE_M" = "ANEXO_AUMENTO"."SERIE_M" ) and  
									( "PAGO_AUMENTO"."NRO_AUMENTO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
									( "PAGO_AUMENTO"."FOLIO" = "ANEXO_AUMENTO"."ULT_FOLIO" ) and  
									( "CADENA"."SERIE" = "PAGO_AUMENTO"."SERIE_M" ) and  
									( "CADENA"."NUMERO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
									( "ANEXO_AUMENTO"."ESTATUS_COMISION" = '1') AND
									(( "CADENA"."ESTADO" = 'V' ) OR 
									( "CADENA"."ESTADO" = 'C' )) AND
									( ( "CADENA"."CODIGO" = :ls_base ) AND  
									( "CADENA"."SERIE" = :ls_serie ) AND  
									( "CADENA"."NUMERO" = :ll_numero ) ) 
						Using		sqlca;
						if sqlca.sqlcode = 0 then
							if ll_precio>0 then
								if ll_pie = 0 and ll_credito = 1 then
									ld_pie_porc	= round(((ll_valor_cta * 100) / ll_precio),2)
								else
									ld_pie_porc	= round(((ll_pie * 100) / ll_precio),2)
								end if
							else
								ld_pie_porc		= 0
							end if
							setnull(C_PIE);setnull(C_PRIMERA);setnull(C_SEGUNDA);setnull(C_TERCERA)
							setnull(C_CUARTA);setnull(C_QUINTA);setnull(C_SEXTA);setnull(C_SEPTIMA);setnull(C_OCTAVA);setnull(C_NOVENA)
							if ld_pie_porc < 10 then
								SELECT	CORRELATIVO ,	C_PIE ,	C_PRIMERA ,	C_SEGUNDA ,	C_TERCERA ,	C_CUARTA ,	C_QUINTA ,	C_SEXTA,		C_SEPTIMA,		C_OCTAVA,		C_NOVENA  AS PORCENTAJE  
								INTO 		:correlativo,	:c_pie,	:c_primera,	:c_segunda,	:c_tercera,	:c_cuarta,	:c_quinta,	:c_sexta,	:c_septima,		:c_octava,		:c_novena
								FROM 		PORCENTAJE_COMISIONES  
								WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
											AREA = :ls_area AND T_CONS = :ls_tipo_cons AND ( CREDITO_MIN <= :ll_credito AND CREDITO >= :ll_credito ) AND
										 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA ) > 0 and 
										 COD_PARQUE = :ll_cod_parque;
							elseif ld_pie_porc >= 10 then
								SELECT	CORRELATIVO ,	C_PIE ,	C_PRIMERA ,	C_SEGUNDA ,	C_TERCERA ,	C_CUARTA ,	C_QUINTA ,	C_SEXTA,		C_SEPTIMA,		C_OCTAVA,		C_NOVENA  AS PORCENTAJE  
								INTO 		:correlativo,	:c_pie,	:c_primera,	:c_segunda,	:c_tercera,	:c_cuarta,	:c_quinta,	:c_sexta,	:c_septima,		:c_octava,		:c_novena
								FROM 		PORCENTAJE_COMISIONES  
								WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
											AREA = :ls_area AND T_CONS = :ls_tipo_cons AND
										 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0  and 
										 COD_PARQUE = :ll_cod_parque;
							end if
							if sqlca.sqlcode = 0 and not isnull(correlativo) then
								dw_lista.setitem(ll_fila,'c_pie',c_pie)
								dw_lista.setitem(ll_fila,'c_primera',c_primera)
								dw_lista.setitem(ll_fila,'c_segunda',c_segunda)
								dw_lista.setitem(ll_fila,'c_tercera',c_tercera)
								dw_lista.setitem(ll_fila,'c_cuarta',c_cuarta)
								dw_lista.setitem(ll_fila,'c_quinta',c_quinta)
								dw_lista.setitem(ll_fila,'c_sexta',c_sexta)
								dw_lista.setitem(ll_fila,'c_septima',c_septima)
								dw_lista.setitem(ll_fila,'c_octava',c_octava)
								dw_lista.setitem(ll_fila,'c_novena',c_novena)
								dw_lista.setitem(ll_fila,'estado_grabar',2)
								dw_lista.accepttext()
							else
								messagebox("Advertencia","No Registra Definición")
							end if
						else
							messagebox("Advertencia","No existe Aumento Capacidad, el Estado es distino a Vgte./Cancel o Comisión Antigua")
							dw_lista.setitem(ll_fila,'estado_valor',1)
						end if

					CASE 'L'
						SELECT	"ANEXO_LIBERADOR"."FORMA_PAGO",   
									"PAGO_LIBERADOR"."PRECIO",   
									"PAGO_LIBERADOR"."NRO_CUOTAS",   
									"PAGO_LIBERADOR"."PIE",
									"CADENA"."COD_PARQUE",
									"PAGO_LIBERADOR"."VALOR_CUOTA"   
						INTO 		:ls_forma_pago,   
									:ll_precio,   
									:ll_credito,   
									:ll_pie,
									:ll_cod_parque,
									:ll_valor_cta
						FROM 		"ANEXO_LIBERADOR",   
									"CADENA",   
									"PAGO_LIBERADOR"  
						WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
									( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
									( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
									( "CADENA"."SERIE" = "PAGO_LIBERADOR"."SERIE_M" ) and  
									( "ANEXO_LIBERADOR"."ESTATUS_COMISION" = '1') AND
									( "CADENA"."NUMERO" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
									(( "CADENA"."ESTADO" = 'V' ) OR 
									( "CADENA"."ESTADO" = 'C' )) AND
									( ( "CADENA"."CODIGO" = :ls_base ) AND  
									( "CADENA"."SERIE" = :ls_serie ) AND  
									( "CADENA"."NUMERO" = :ll_numero ) )   
						Using		sqlca;
						if sqlca.sqlcode =0 then
							if ll_precio>0 then
								if ll_pie = 0 and ll_credito = 1 then
									ld_pie_porc	= round(((ll_valor_cta * 100) / ll_precio),2)
								else
									ld_pie_porc	= round(((ll_pie * 100) / ll_precio),2)
								end if
							else
								ld_pie_porc		= 0
							end if
							setnull(C_PIE);setnull(C_PRIMERA);setnull(C_SEGUNDA);setnull(C_TERCERA)
							setnull(C_CUARTA);setnull(C_QUINTA);setnull(C_SEXTA);setnull(C_SEPTIMA);setnull(C_OCTAVA);setnull(C_NOVENA)
							if ld_pie_porc < 10 then
								SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA,	C_SEPTIMA,	C_OCTAVA,	C_NOVENA  AS PORCENTAJE  
								INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta,	:c_septima,	:c_octava,	:c_novena
								FROM 		PORCENTAJE_COMISIONES  
								WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
											AREA = 'X' AND T_CONS = 'X' AND ( CREDITO_MIN <= :ll_credito AND CREDITO >= :ll_credito ) and
										 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA ) > 0  and
										 ( COD_PARQUE = :ll_cod_parque );
							elseif ld_pie_porc >= 10 then
								SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA,	C_SEPTIMA,	C_OCTAVA,	C_NOVENA   AS PORCENTAJE  
								INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,	:c_septima,	:c_octava,	:c_novena
								FROM 		PORCENTAJE_COMISIONES  
								WHERE  ( PIE_MIN <= :ld_pie_porc AND  PIE_MAX >= :ld_pie_porc) AND  
											AREA = 'X' AND T_CONS = 'X' and 
										 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA ) > 0  and
										 ( COD_PARQUE = :ll_cod_parque );
							end if
							if sqlca.sqlcode = 0 and not isnull(correlativo) then
								dw_lista.setitem(ll_fila,'c_pie',c_pie)
								dw_lista.setitem(ll_fila,'c_primera',c_primera)
								dw_lista.setitem(ll_fila,'c_segunda',c_segunda)
								dw_lista.setitem(ll_fila,'c_tercera',c_tercera)
								dw_lista.setitem(ll_fila,'c_cuarta',c_cuarta)
								dw_lista.setitem(ll_fila,'c_quinta',c_quinta)
								dw_lista.setitem(ll_fila,'c_sexta',c_sexta)
								dw_lista.setitem(ll_fila,'c_septima',c_septima)
								dw_lista.setitem(ll_fila,'c_octava',c_octava)
								dw_lista.setitem(ll_fila,'c_novena',c_novena)
								dw_lista.setitem(ll_fila,'estado_grabar',2)
								dw_lista.accepttext()
							else
								messagebox("Advertencia","No Registra Definición")
							end if
						else
							dw_lista.setitem(ll_fila,'estado_valor',1)
							messagebox("Advertencia","No existe Liberador, el Estado es distino a Vgte./Cancel o Comisión Antigua")
						end if
				END CHOOSE
			end if
		end if
END CHOOSE
end event

type gb_1 from groupbox within w_ingreso_manual_comisiones
integer x = 59
integer y = 1432
integer width = 3447
integer height = 256
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

