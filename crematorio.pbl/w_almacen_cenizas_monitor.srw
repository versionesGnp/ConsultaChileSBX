forward
global type w_almacen_cenizas_monitor from window
end type
type cb_1 from commandbutton within w_almacen_cenizas_monitor
end type
type em_refresco from editmask within w_almacen_cenizas_monitor
end type
type st_8 from statictext within w_almacen_cenizas_monitor
end type
type st_5 from statictext within w_almacen_cenizas_monitor
end type
type st_7 from statictext within w_almacen_cenizas_monitor
end type
type st_6 from statictext within w_almacen_cenizas_monitor
end type
type st_rango_fechas_6 from statictext within w_almacen_cenizas_monitor
end type
type dw_lista_estado_6 from datawindow within w_almacen_cenizas_monitor
end type
type st_rango_fechas from statictext within w_almacen_cenizas_monitor
end type
type st_help from statictext within w_almacen_cenizas_monitor
end type
type st_4 from statictext within w_almacen_cenizas_monitor
end type
type st_3 from statictext within w_almacen_cenizas_monitor
end type
type st_2 from statictext within w_almacen_cenizas_monitor
end type
type st_1 from statictext within w_almacen_cenizas_monitor
end type
type cb_cerrar from commandbutton within w_almacen_cenizas_monitor
end type
type dw_lista from datawindow within w_almacen_cenizas_monitor
end type
type st_titulo from statictext within w_almacen_cenizas_monitor
end type
type dw_detalle from datawindow within w_almacen_cenizas_monitor
end type
end forward

global type w_almacen_cenizas_monitor from window
integer width = 6199
integer height = 2628
boolean titlebar = true
string title = "Monitor casilla cenizas crematorio"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowstate windowstate = maximized!
long backcolor = 67108864
boolean center = true
cb_1 cb_1
em_refresco em_refresco
st_8 st_8
st_5 st_5
st_7 st_7
st_6 st_6
st_rango_fechas_6 st_rango_fechas_6
dw_lista_estado_6 dw_lista_estado_6
st_rango_fechas st_rango_fechas
st_help st_help
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
st_titulo st_titulo
dw_detalle dw_detalle
end type
global w_almacen_cenizas_monitor w_almacen_cenizas_monitor

type variables
Long	il_fila,il_primer

date ld_rango_anterior, ld_fecha_proceso
end variables

on w_almacen_cenizas_monitor.create
this.cb_1=create cb_1
this.em_refresco=create em_refresco
this.st_8=create st_8
this.st_5=create st_5
this.st_7=create st_7
this.st_6=create st_6
this.st_rango_fechas_6=create st_rango_fechas_6
this.dw_lista_estado_6=create dw_lista_estado_6
this.st_rango_fechas=create st_rango_fechas
this.st_help=create st_help
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.st_titulo=create st_titulo
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_1,&
this.em_refresco,&
this.st_8,&
this.st_5,&
this.st_7,&
this.st_6,&
this.st_rango_fechas_6,&
this.dw_lista_estado_6,&
this.st_rango_fechas,&
this.st_help,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.st_titulo,&
this.dw_detalle}
end on

on w_almacen_cenizas_monitor.destroy
destroy(this.cb_1)
destroy(this.em_refresco)
destroy(this.st_8)
destroy(this.st_5)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_rango_fechas_6)
destroy(this.dw_lista_estado_6)
destroy(this.st_rango_fechas)
destroy(this.st_help)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.st_titulo)
destroy(this.dw_detalle)
end on

event open;
gf_centrar(W_ALMACEN_CENIZAS_monitor)

ld_fecha_proceso = date(gdt_fec_sistema)

//----------------------------------------------------------
//                   ACTIVAR !!!
//----------------------------------------------------------
ld_fecha_proceso = date(gdt_fec_sistema)
//ld_fecha_proceso = date('16/01/2024')
//----------------------------------------------------------
integer li_DIAS

SELECT 	DIAS_RANGO_CREMA		INTO :li_DIAS	FROM tasa;

select to_date(:ld_fecha_proceso) - :li_DIAS into :ld_rango_anterior from dual;

st_rango_fechas.text = trim(st_rango_fechas.text) + ' ' +string( ld_rango_anterior) + ' al ' + string(date(ld_fecha_proceso))
st_rango_fechas_6.text = trim(st_rango_fechas_6.text) + ' ' +string( ld_rango_anterior) + ' al ' + string(date(ld_fecha_proceso))

dw_lista.settransobject(sqlca)
dw_lista.retrieve(ld_fecha_proceso)

dw_lista_estado_6.settransobject(sqlca)
dw_lista_estado_6.retrieve(ld_fecha_proceso)

dw_detalle.settransobject(sqlca)
dw_detalle.retrieve()


em_refresco.text = '10'

timer(integer(em_refresco.text))
end event

event mousemove;st_help.text		= ' '
end event

event timer;LONG ll_rut_estado_6, ll_rut_estado
integer li_found, T , LI_ESTADO

String	    ls_nulo
Long		ll_nulo
Datetime	ldt_nulo

Setnull(ls_nulo);Setnull(ll_nulo);Setnull(ldt_nulo)



FOR T = 1 TO dw_detalle.ROWCOUNT()
	
	ll_rut_estado = dw_detalle.GETITEMNUMBER(T,'RUT_FALLECIDO')
	
	IF ISNULL(ll_rut_estado) = FALSE THEN
		
			SELECT  "FC_CABECERA"."ESTADO_GESTION" into :LI_ESTADO
			FROM "FC_CABECERA"
			WHERE  "FC_CABECERA"."RUT_FALLECIDO" = :ll_rut_estado;
		
			if LI_ESTADO = 6 then				
					UPDATE	"ALMACEN_CENIZAS"  
					SET 	"ALMACEN_CENIZAS"."RUT_FALLECIDO" = :ll_nulo,
							 "ALMACEN_CENIZAS"."DV" = :ls_nulo,
							 "ALMACEN_CENIZAS"."BASE" =:ls_nulo,
							 "ALMACEN_CENIZAS"."SERIE" = :ls_nulo,
							 "ALMACEN_CENIZAS"."NUMERO" = :ll_nulo,
							 "ALMACEN_CENIZAS"."FECHA_INGRESO_ALMACEN" = :ldt_nulo,
							 "ALMACEN_CENIZAS"."FECHA_SALIDA_ALMACEN" = :ldt_nulo,
							 "ALMACEN_CENIZAS"."NOMBRE_FALLECIDO" = :ls_nulo,
							 "ALMACEN_CENIZAS"."AP_PATERNO_FALLECIDO" = :ls_nulo,
							 "ALMACEN_CENIZAS"."AP_MATERNO_FALLECIDO" = :ls_nulo
					WHERE 
							 ( "ALMACEN_CENIZAS"."RUT_FALLECIDO" = :ll_rut_estado )   
					USING		sqlca;
			end if 

	END IF 

NEXT

Commit;

dw_detalle.retrieve()
dw_lista.retrieve(ld_fecha_proceso)
dw_lista_estado_6.retrieve(ld_fecha_proceso)



	
//-------------------------------------------------------------------------
end event

type cb_1 from commandbutton within w_almacen_cenizas_monitor
integer x = 1435
integer y = 2372
integer width = 343
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aplicar"
end type

event clicked;timer(integer(em_refresco.text))
messagebox("Información","Tiempo de refresco fue ajustado a " + em_refresco.text + ' segundos', Information!)
end event

type em_refresco from editmask within w_almacen_cenizas_monitor
integer x = 704
integer y = 2376
integer width = 247
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
double increment = 1
string minmax = "0~~"
end type

type st_8 from statictext within w_almacen_cenizas_monitor
integer x = 987
integer y = 2396
integer width = 439
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "en segundos"
boolean focusrectangle = false
end type

type st_5 from statictext within w_almacen_cenizas_monitor
integer x = 91
integer y = 2400
integer width = 562
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Tiempo de Refresco"
boolean focusrectangle = false
end type

type st_7 from statictext within w_almacen_cenizas_monitor
integer x = 91
integer y = 1352
integer width = 928
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Fallecidos en Anfora Entregada"
boolean focusrectangle = false
end type

type st_6 from statictext within w_almacen_cenizas_monitor
integer x = 87
integer y = 144
integer width = 631
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Fallecidos en Anfora"
boolean focusrectangle = false
end type

type st_rango_fechas_6 from statictext within w_almacen_cenizas_monitor
integer x = 1029
integer y = 1352
integer width = 1143
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Rango : "
boolean focusrectangle = false
end type

type dw_lista_estado_6 from datawindow within w_almacen_cenizas_monitor
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1300
integer width = 2158
integer height = 1028
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_cremaciones_estado_6"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;//
//if row > 0 then
//	This.SelectRow(0, false)
//	This.SelectRow(row, true)
//end if

end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if

//Long		ll_fila,ll_cod_parque
//String	ls_area,ls_sector,ls_sepultura
//
//ll_fila	= this.getrow()
//if ll_fila>0 then
//	This.SelectRow(0, FALSE)
//	This.SelectRow(ll_fila, TRUE)
//	ll_cod_parque	= dw_lista.getitemnumber(ll_fila,'cod_parque')
//	ls_area			= dw_lista.getitemstring(ll_fila,'area')
//	ls_sector		= dw_lista.getitemstring(ll_fila,'sector')
//	ls_sepultura	= dw_lista.getitemstring(ll_fila,'sepultura')
//	if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
//		if dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura)>0 then
//			st_titulo.text	= 'Distribución Fosa Común Area: '+ls_area+' Sector: '+ls_sector+' Sepultura: '+ls_sepultura
//		end if
//	end if
//end if
end event

type st_rango_fechas from statictext within w_almacen_cenizas_monitor
integer x = 750
integer y = 144
integer width = 1417
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Rango : "
boolean focusrectangle = false
end type

type st_help from statictext within w_almacen_cenizas_monitor
event ue_mousemove pbm_mousemove
integer x = 2226
integer y = 100
integer width = 3881
integer height = 160
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "MS Serif"
long backcolor = 80269524
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type st_4 from statictext within w_almacen_cenizas_monitor
event ue_mousemove pbm_mousemove
integer x = 3991
integer y = 2220
integer width = 407
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Disponible"
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type st_3 from statictext within w_almacen_cenizas_monitor
event ue_mousemove pbm_mousemove
integer x = 3863
integer y = 2216
integer width = 105
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type st_2 from statictext within w_almacen_cenizas_monitor
event ue_mousemove pbm_mousemove
integer x = 3401
integer y = 2220
integer width = 407
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Ocupado"
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type st_1 from statictext within w_almacen_cenizas_monitor
event ue_mousemove pbm_mousemove
integer x = 3273
integer y = 2216
integer width = 105
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 65535
long backcolor = 65535
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type cb_cerrar from commandbutton within w_almacen_cenizas_monitor
event ue_mousemove pbm_mousemove
integer x = 5646
integer y = 2396
integer width = 347
integer height = 108
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;close(W_ALMACEN_CENIZAS_MONITOR)
end event

type dw_lista from datawindow within w_almacen_cenizas_monitor
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 100
integer width = 2158
integer height = 1168
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_cremaciones"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;
if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
//Long		ll_cod_parque
//String	ls_area,ls_sector,ls_sepultura
//if row > 0 then
//	This.SelectRow(0, FALSE)
//	This.SelectRow(row, TRUE)
//	ll_cod_parque	= dw_lista.getitemnumber(row,'cod_parque')
//	ls_area			= dw_lista.getitemstring(row,'area')
//	ls_sector		= dw_lista.getitemstring(row,'sector')
//	ls_sepultura	= dw_lista.getitemstring(row,'sepultura')
//	if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
//		if dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura)>0 then
//			st_titulo.text	= 'Distribución Fosa Común Area: '+ls_area+' Sector: '+ls_sector+' Sepultura: '+ls_sepultura
//		end if
//	end if
//end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if

//Long		ll_fila,ll_cod_parque
//String	ls_area,ls_sector,ls_sepultura
//
//ll_fila	= this.getrow()
//if ll_fila>0 then
//	This.SelectRow(0, FALSE)
//	This.SelectRow(ll_fila, TRUE)
//	ll_cod_parque	= dw_lista.getitemnumber(ll_fila,'cod_parque')
//	ls_area			= dw_lista.getitemstring(ll_fila,'area')
//	ls_sector		= dw_lista.getitemstring(ll_fila,'sector')
//	ls_sepultura	= dw_lista.getitemstring(ll_fila,'sepultura')
//	if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
//		if dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura)>0 then
//			st_titulo.text	= 'Distribución Fosa Común Area: '+ls_area+' Sector: '+ls_sector+' Sepultura: '+ls_sepultura
//		end if
//	end if
//end if
end event

type st_titulo from statictext within w_almacen_cenizas_monitor
event ue_mousemove pbm_mousemove
integer x = 3264
integer y = 312
integer width = 2450
integer height = 112
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Distribución Cenizas "
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type dw_detalle from datawindow within w_almacen_cenizas_monitor
event ue_mousemove pbm_dwnmousemove
event timer ( )
integer x = 2222
integer y = 276
integer width = 3886
integer height = 2060
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lista_grilla_almacen_cenizas"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;string		ls_columna,ls_base,ls_serie,ls_nivel,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_estado_reg,ls_dv, ls_fec_ing_cre, ls_hor_ing_cre, ls_min_ing_cre, ls_num_folio
Long		ll_row,ll_llavem ,ll_rut_fallecido
Double	ll_numero
ls_columna				= dwo.name
if row > 1 or ls_columna='niveles' or ls_columna='base' or ls_columna='serie' or ls_columna='numero' then
	ll_row				= row
	ls_base				= dw_detalle.getitemstring(ll_row,'base')
	ls_serie				= dw_detalle.getitemstring(ll_row,'serie')
	ll_numero			= dw_detalle.getitemnumber(ll_row,'numero')
	ls_nivel				= STRING(dw_detalle.getitemnumber(ll_row,'niveles'))
	ll_rut_fallecido		= dw_detalle.getitemnumber(ll_row,'rut_fallecido')
	ls_dv       			= dw_detalle.getitemstring(ll_row,'dv')
	ls_nom_fall			= dw_detalle.getitemstring(ll_row,'nombre_fallecido')
	ls_ap_pat_fall		= dw_detalle.getitemstring(ll_row,'ap_paterno_fallecido')
	ls_ap_mat_fall		= dw_detalle.getitemstring(ll_row,'ap_materno_fallecido')
	 ls_fec_ing_cre     = string(date(dw_detalle.getitemdatetime(ll_row,'fc_cabecera_FECHA_INGRESO_CINERARIO')))
	 ls_hor_ing_cre     = string(dw_detalle.getitemnumber(ll_row,'fc_cabecera_hora_INGRESO_CINERARIO'))
	 ls_min_ing_cre    = string(dw_detalle.getitemnumber(ll_row,'fc_cabecera_minuto_INGRESO_CINERARIO'))
	  ls_num_folio       = string(dw_detalle.getitemnumber(ll_row,'almacen_cenizas_numero_folio'))
	
	if ll_rut_fallecido>0 then
		st_help.text	= 'Casilla OCUPADA, N° :  '+ls_nivel+'  Nº Contrato: '+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,###')+',  Fallecido Rut Nº:  '+string(ll_rut_fallecido,"###,###,###,###,###")+'-'+ ls_dv + ' Nombre Fallecido '+left(ls_nom_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall , 30) &
		                     + ' Fecha cremación : ' + ls_fec_ing_cre +' a las ' + ls_hor_ing_cre +':' + ls_min_ing_cre + ' N° Folio : ' + ls_num_folio
	else
		st_help.text	= 'Casilla DISPONIBLE,  N° :  '+ls_nivel+'  DISPONIBLE'
	end if
end if
end event

event timer();//LONG ll_rut_estado_6
//integer li_found
//
//String	    ls_nulo
//Long		ll_nulo
//Datetime	ldt_nulo
//
//Setnull(ls_nulo);Setnull(ll_nulo);Setnull(ldt_nulo)
//
//
////--------------------------------------------------------------------------
////  vhfb -- inicio -- validamos si hay cambio de estado a 6 
////--------------------------------------------------------------------------
//	
//DECLARE C_ESTADO_6 CURSOR   FOR 
//  SELECT "FC_CABECERA"."RUT_FALLECIDO"
//    FROM "FC_CABECERA"
//   WHERE "FC_CABECERA"."ESTADO_GESTION" =  5 AND 
//          exists (SELECT 1 FROM "ALMACEN_CENIZAS" where "ALMACEN_CENIZAS"."RUT_FALLECIDO" = "FC_CABECERA"."RUT_FALLECIDO");
//OPEN C_ESTADO_6;	
//		
//DO WHILE sqlca.sqlcode=0
//	
//	  FETCH C_ESTADO_6 INTO :ll_rut_estado_6;
//	  li_found = dw_detalle.find('rut_fallecido = ' + string(ll_rut_estado_6),1,30)
//	  if li_found >0 then
//			UPDATE	"ALMACEN_CENIZAS"  
//			SET 	"ALMACEN_CENIZAS"."RUT_FALLECIDO" = :ll_nulo,
//					 "ALMACEN_CENIZAS"."DV" = :ls_nulo,
//					 "ALMACEN_CENIZAS"."BASE" =:ls_nulo,
//					 "ALMACEN_CENIZAS"."SERIE" = :ls_nulo,
//					 "ALMACEN_CENIZAS"."NUMERO" = :ll_nulo,
//					 "ALMACEN_CENIZAS"."FECHA_INGRESO_ALMACEN" = :ldt_nulo,
//					 "ALMACEN_CENIZAS"."FECHA_SALIDA_ALMACEN" = :ldt_nulo,
//					 "ALMACEN_CENIZAS"."NOMBRE_FALLECIDO" = :ls_nulo,
//					 "ALMACEN_CENIZAS"."AP_PATERNO_FALLECIDO" = :ls_nulo,
//					 "ALMACEN_CENIZAS"."AP_MATERNO_FALLECIDO" = :ls_nulo
//			WHERE 
//					 ( "ALMACEN_CENIZAS"."NIVELES" = :li_found )   
//			USING		sqlca;
//			if sqlca.sqlcode=0 then
//				dw_detalle.accepttext()
//				commit;
//			else
//				rollback;
//			end if	  
//	end if 
//	  
//LOOP
//CLOSE C_ESTADO_6;
//Commit;
//
//
//dw_detalle.retrieve()
//dw_lista.retrieve(ld_fecha_proceso)
//	
////-------------------------------------------------------------------------
end event

event clicked;//String	ls_nivel,ls_estado_reg,ls_columna,ls_est_reg_prox,ls_pasa,ls_est_reg_ini,ls_area,ls_sector,&
//			ls_sepultura,ls_serie_fosa,ls_nulo,ls_nivel_fosa,ls_area_fosa,ls_sector_fosa,ls_sepult_fosa,&
//			ls_base_fosa,ls_base,ls_serie, ls_dv,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall
//Long		ll_suma_a,ll_res,ll_nulo,ll_tot_reg,ll_parque_fosa,ll_suma,ll_suma_g,ll_indi,&
//			ll_corr_fosa,ll_row,ll_cod_parque,ll_tot_reg_det,ll_fila_det ,ll_rut_fallecido
//Datetime	ldt_nulo
//Double	ll_numero_fosa,ll_numero
//
//ls_pasa					= 'S'
//il_fila						= row
//ls_columna				= dwo.name
//
// if dw_detalle.IsSelected(il_fila) then
//	This.SelectRow(il_fila, false)
// end if 
//
//if il_fila > 0  then
//	ll_rut_fallecido		= dw_detalle.getitemnumber(il_fila,'rut_fallecido')
//	
//	if ll_rut_fallecido = 0 or isnull(ll_rut_fallecido) then
//		This.SelectRow(0, FALSE)
//		This.SelectRow(il_fila, TRUE)
//	end if
//	
//	if ll_rut_fallecido >0  then
//		messagebox("Advertencia","Casilla Ya Utilizada, Recuerde si desea Liberar Casilla debe Presionar Botón DESOCUPAR Casilla")
//		This.SelectRow(il_fila, false)
//	end if
//	dw_detalle.accepttext()
//end if
end event

