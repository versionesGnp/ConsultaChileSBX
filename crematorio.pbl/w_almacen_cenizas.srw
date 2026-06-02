forward
global type w_almacen_cenizas from window
end type
type st_5 from statictext within w_almacen_cenizas
end type
type st_8 from statictext within w_almacen_cenizas
end type
type em_refresco from editmask within w_almacen_cenizas
end type
type cb_6 from commandbutton within w_almacen_cenizas
end type
type cb_5 from commandbutton within w_almacen_cenizas
end type
type st_7 from statictext within w_almacen_cenizas
end type
type st_6 from statictext within w_almacen_cenizas
end type
type cb_4 from commandbutton within w_almacen_cenizas
end type
type cb_2 from commandbutton within w_almacen_cenizas
end type
type st_rango_fechas_6 from statictext within w_almacen_cenizas
end type
type dw_lista_estado_6 from datawindow within w_almacen_cenizas
end type
type st_rango_fechas from statictext within w_almacen_cenizas
end type
type cb_1 from commandbutton within w_almacen_cenizas
end type
type cb_3 from commandbutton within w_almacen_cenizas
end type
type st_help from statictext within w_almacen_cenizas
end type
type cb_ctacte from commandbutton within w_almacen_cenizas
end type
type cb_desocupar from commandbutton within w_almacen_cenizas
end type
type st_4 from statictext within w_almacen_cenizas
end type
type st_3 from statictext within w_almacen_cenizas
end type
type st_2 from statictext within w_almacen_cenizas
end type
type st_1 from statictext within w_almacen_cenizas
end type
type cb_asignar from commandbutton within w_almacen_cenizas
end type
type cb_cerrar from commandbutton within w_almacen_cenizas
end type
type dw_lista from datawindow within w_almacen_cenizas
end type
type st_titulo from statictext within w_almacen_cenizas
end type
type dw_detalle from datawindow within w_almacen_cenizas
end type
type gb_1 from groupbox within w_almacen_cenizas
end type
type gb_2 from groupbox within w_almacen_cenizas
end type
end forward

global type w_almacen_cenizas from window
integer width = 6199
integer height = 2628
boolean titlebar = true
string title = "Asignación casilla cenizas crematorio"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_5 st_5
st_8 st_8
em_refresco em_refresco
cb_6 cb_6
cb_5 cb_5
st_7 st_7
st_6 st_6
cb_4 cb_4
cb_2 cb_2
st_rango_fechas_6 st_rango_fechas_6
dw_lista_estado_6 dw_lista_estado_6
st_rango_fechas st_rango_fechas
cb_1 cb_1
cb_3 cb_3
st_help st_help
cb_ctacte cb_ctacte
cb_desocupar cb_desocupar
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_asignar cb_asignar
cb_cerrar cb_cerrar
dw_lista dw_lista
st_titulo st_titulo
dw_detalle dw_detalle
gb_1 gb_1
gb_2 gb_2
end type
global w_almacen_cenizas w_almacen_cenizas

type variables
Long	il_fila,il_primer

date ld_rango_anterior, ld_fecha_proceso
end variables

forward prototypes
public subroutine wf_registra_log (string p_actividad, integer p_nivel)
end prototypes

public subroutine wf_registra_log (string p_actividad, integer p_nivel);//------------------------------------------------------------------------------------------------
// VHFB -- REGISTRO DE LOG ACTIVIDAD EN GESTION DE ASIGNACION DE CENIZAS
//------------------------------------------------------------------------------------------------
string ls_dv,ls_base,ls_serie,ls_nombre,ls_ap_paterno,ls_ap_materno
long ll_rut, ll_numero, ll_correlativo
datetime ld_fec_ing


ll_rut              = dw_detalle.GETITEMNUMBER(p_nivel,'RUT_FALLECIDO')
ls_dv              = dw_detalle.GETITEMstring(p_nivel,'DV')
ls_base          = dw_detalle.GETITEMstring(p_nivel,'BASE')
ls_serie          = dw_detalle.GETITEMstring(p_nivel,'SERIE')
ll_numero       = dw_detalle.GETITEMNUMBER(p_nivel,'NUMERO')
ld_fec_ing       = dw_detalle.GETITEMdatetime(p_nivel,'FECHA_INGRESO_ALMACEN')
ls_nombre       = dw_detalle.GETITEMstring(p_nivel,'NOMBRE_FALLECIDO')
ls_ap_paterno  = dw_detalle.GETITEMstring(p_nivel,'AP_PATERNO_FALLECIDO')
ls_ap_materno = dw_detalle.GETITEMstring(p_nivel,'AP_MATERNO_FALLECIDO')


select max(correlativo) into :ll_correlativo from ALMACEN_CENIZAS_LOG;

if ll_correlativo = 0 OR ISNULL(ll_correlativo) then
	ll_correlativo = 1
ELSE 
	ll_correlativo++
end if 

INSERT INTO ALMACEN_CENIZAS_LOG 
		(CORRELATIVO,
		FECHA_LOG,
		NIVELES,
		RUT_FALLECIDO,
		DV,
		BASE,
		SERIE,
		NUMERO,
		FECHA_INGRESO_ALMACEN,
		FECHA_SALIDA_ALMACEN,
		NOMBRE_FALLECIDO,
		AP_PATERNO_FALLECIDO,
		AP_MATERNO_FALLECIDO,
		ACTIVIDAD,
		USUARIO)
VALUES 
		(:ll_correlativo,
		SYSDATE,
		:p_nivel,
		:ll_rut,
		:ls_dv,
		:ls_base,
		:ls_serie,
		:ll_numero,
		:ld_fec_ing,
		:ld_fec_ing,
		:ls_nombre,
		:ls_ap_paterno,
		:ls_ap_materno,
		:p_actividad,
		:gs_codigo_usuario)
USING		sqlca ;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if





end subroutine

on w_almacen_cenizas.create
this.st_5=create st_5
this.st_8=create st_8
this.em_refresco=create em_refresco
this.cb_6=create cb_6
this.cb_5=create cb_5
this.st_7=create st_7
this.st_6=create st_6
this.cb_4=create cb_4
this.cb_2=create cb_2
this.st_rango_fechas_6=create st_rango_fechas_6
this.dw_lista_estado_6=create dw_lista_estado_6
this.st_rango_fechas=create st_rango_fechas
this.cb_1=create cb_1
this.cb_3=create cb_3
this.st_help=create st_help
this.cb_ctacte=create cb_ctacte
this.cb_desocupar=create cb_desocupar
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_asignar=create cb_asignar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.st_titulo=create st_titulo
this.dw_detalle=create dw_detalle
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_5,&
this.st_8,&
this.em_refresco,&
this.cb_6,&
this.cb_5,&
this.st_7,&
this.st_6,&
this.cb_4,&
this.cb_2,&
this.st_rango_fechas_6,&
this.dw_lista_estado_6,&
this.st_rango_fechas,&
this.cb_1,&
this.cb_3,&
this.st_help,&
this.cb_ctacte,&
this.cb_desocupar,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_asignar,&
this.cb_cerrar,&
this.dw_lista,&
this.st_titulo,&
this.dw_detalle,&
this.gb_1,&
this.gb_2}
end on

on w_almacen_cenizas.destroy
destroy(this.st_5)
destroy(this.st_8)
destroy(this.em_refresco)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.st_rango_fechas_6)
destroy(this.dw_lista_estado_6)
destroy(this.st_rango_fechas)
destroy(this.cb_1)
destroy(this.cb_3)
destroy(this.st_help)
destroy(this.cb_ctacte)
destroy(this.cb_desocupar)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_asignar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.st_titulo)
destroy(this.dw_detalle)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;
gf_centrar(W_ALMACEN_CENIZAS)

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
				
					wf_registra_log('Anfora de Casilla N° : ' + string(t) + ' fue entregada a cliente.' ,t)
					
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

type st_5 from statictext within w_almacen_cenizas
integer x = 2770
integer y = 2416
integer width = 567
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

type st_8 from statictext within w_almacen_cenizas
integer x = 3666
integer y = 2416
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

type em_refresco from editmask within w_almacen_cenizas
integer x = 3383
integer y = 2396
integer width = 247
integer height = 104
integer taborder = 70
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

type cb_6 from commandbutton within w_almacen_cenizas
integer x = 4114
integer y = 2392
integer width = 343
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aplicar"
end type

event clicked;timer(integer(em_refresco.text))

messagebox("Información","Tiempo de refresco fue ajustado a " + em_refresco.text + ' segundos',Information!)



end event

type cb_5 from commandbutton within w_almacen_cenizas
event ue_mousemove pbm_mousemove
integer x = 1285
integer y = 2412
integer width = 553
integer height = 108
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consulta Log"
end type

event clicked;if isvalid(w_almacen_cenizas_log) then close(w_almacen_cenizas_log)
open(w_almacen_cenizas_log)
end event

type st_7 from statictext within w_almacen_cenizas
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

type st_6 from statictext within w_almacen_cenizas
integer x = 87
integer y = 144
integer width = 649
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

type cb_4 from commandbutton within w_almacen_cenizas
integer x = 338
integer y = 1168
integer width = 219
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_almacen_cenizas
integer x = 96
integer y = 1168
integer width = 238
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type st_rango_fechas_6 from statictext within w_almacen_cenizas
integer x = 1024
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

type dw_lista_estado_6 from datawindow within w_almacen_cenizas
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1300
integer width = 2158
integer height = 848
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_cremaciones_estado_6"
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

type st_rango_fechas from statictext within w_almacen_cenizas
integer x = 745
integer y = 144
integer width = 1431
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

type cb_1 from commandbutton within w_almacen_cenizas
integer x = 101
integer y = 2204
integer width = 238
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista_estado_6.rowcount() > 0 then
	setnull (nulo)
	dw_lista_estado_6.SETSORT(NULO)
	dw_lista_estado_6.SORT()
end if
end event

type cb_3 from commandbutton within w_almacen_cenizas
integer x = 343
integer y = 2204
integer width = 219
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista_estado_6.SETfilter(NULO)
dw_lista_estado_6.filter()
end event

type st_help from statictext within w_almacen_cenizas
event ue_mousemove pbm_mousemove
integer x = 2235
integer y = 100
integer width = 3872
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

type cb_ctacte from commandbutton within w_almacen_cenizas
event ue_mousemove pbm_mousemove
integer x = 4375
integer y = 2196
integer width = 530
integer height = 108
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;Long	ll_fila
integer li_nivel, t 

ll_fila			= dw_detalle.getrow()

if ll_fila > 0 then
	gi_numero 	= dw_detalle.getitemnumber(ll_fila,'numero')
	gs_base		= dw_detalle.getitemstring(ll_fila,'base')
	gs_serie		= dw_detalle.getitemstring(ll_fila,'serie')
	if	gi_numero > 0 then

		gi_numero 	= dw_detalle.getitemnumber(ll_fila,'numero')
		gs_base		= dw_detalle.getitemstring(ll_fila,'base')
		gs_serie		= dw_detalle.getitemstring(ll_fila,'serie')
		
		if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
		
		open(w_cuenta_corriente_funeraria)
	else
		
		messagebox("Advertencia","La casilla a consultar esta vacia.")
		
	end if 
	
end if
end event

type cb_desocupar from commandbutton within w_almacen_cenizas
event ue_mousemove pbm_mousemove
integer x = 677
integer y = 2412
integer width = 553
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Desocupar Casilla"
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;String	    ls_nivel,ls_estado_reg,ls_nulo,ls_nivel_fosa,ls_area_fosa,ls_sector_fosa,ls_sepult_fosa,	ls_base_fosa,ls_serie_fosa,ls_base,ls_serie,ls_area,ls_sector,ls_sepultura
STRING  ls_dv, ls_nom_fall, ls_ap_pat_fall, ls_ap_mat_fall	
Long		ll_nulo,ll_parque_fosa,ll_corr_fosa,ll_res,ll_indi,ll_tot_reg,&
			ll_suma,ll_suma_g,ll_row,ll_cod_parque,ll_llave
Datetime	ldt_nulo,ldt_fecha_hoy
Double	ll_numero,ll_numero_fosa,ll_rut_fallecido


if il_fila>0 then
	
	ls_nivel = string(il_fila)
	
	Setnull(ls_nulo);Setnull(ll_nulo);Setnull(ldt_nulo)
	
	ll_rut_fallecido				= dw_detalle.getitemnumber(il_fila,'rut_fallecido')
	
	if ll_rut_fallecido > 0  then
		ll_res						= messagebox("Advertencia","Está Seguro Desocupar Casilla N° : "+ls_nivel,Exclamation!,YesNo!,2)
		if ll_res=1 then
			if il_fila > 0 then
				
					wf_registra_log('Retira anfora de Casilla N° : ' + ls_nivel,integer(ls_nivel))	
					
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
							 ( "ALMACEN_CENIZAS"."NIVELES" = :il_fila )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_detalle.accepttext()
						commit;
						dw_detalle.retrieve()
						dw_lista.retrieve(ld_fecha_proceso)
						dw_lista_estado_6.retrieve(ld_fecha_proceso)
						
						messagebox("Desocupar Casilla","Desocupación Exitosa Casilla N° : " + ls_nivel)
						

						
					else
						rollback;
						messagebox("Error Desocupación Casilla","Error al Desocupar Casilla N° : " + ls_nivel+" SQL: "+sqlca.sqlerrtext)
					end if
			end if
		END IF 
	else
		messagebox("Advertencia","Debe Seleccionar Casilla Ocupada")
	end if
end if
end event

type st_4 from statictext within w_almacen_cenizas
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

type st_3 from statictext within w_almacen_cenizas
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

type st_2 from statictext within w_almacen_cenizas
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

type st_1 from statictext within w_almacen_cenizas
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

type cb_asignar from commandbutton within w_almacen_cenizas
event ue_mousemove pbm_mousemove
integer x = 178
integer y = 2412
integer width = 457
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ocupar Casilla"
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;Long		ll_fila,ll_indi,ll_tot_reg,ll_suma,ll_res,ll_numero,ll_rut_fallecido,ll_num_folio
String	ls_estado_reg,ls_string,li_niveles,ls_base,ls_serie,ls_dv,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall
integer t, li_nivel

if dw_lista.rowcount() = 0 then
	messagebox("Advertencia","No existen fallecidos a asignar.")
	return
end if 

if dw_lista.getrow() = 0 then
	messagebox("Advertencia","Debe Seleccionar un fallecido a asignar.")
	return
end if 

if dw_detalle.rowcount() = 0 then
	messagebox("Advertencia","No existen definción de casilleros.")
	return
end if 

li_nivel = 0
for t = 1 to 50 
	 if dw_detalle.IsSelected(t) then
		 li_nivel = t 
		 exit
	 end if 
next
if li_nivel = 0 then
	messagebox("Advertencia","Debe Seleccionar un casillero a ocupar.")
	return
end if 

il_fila = dw_lista.getrow()

ls_base				= dw_lista.getitemstring(il_fila,'fc_cabecera_base')
ls_serie				= dw_lista.getitemstring(il_fila,'fc_cabecera_serie')
ll_numero			= dw_lista.getitemnumber(il_fila,'fc_cabecera_numero')
ll_rut_fallecido		= dw_lista.getitemnumber(il_fila,'fc_fallecido_rut_fallecido')
ls_dv       			= dw_lista.getitemstring(il_fila,'fc_fallecido_dv_fallecido')
ls_nom_fall			= dw_lista.getitemstring(il_fila,'fc_fallecido_nombres')
ls_ap_pat_fall		= dw_lista.getitemstring(il_fila,'fc_fallecido_apellido_paterno')
ls_ap_mat_fall		= dw_lista.getitemstring(il_fila,'fc_fallecido_apellido_materno')
ls_ap_mat_fall		= dw_lista.getitemstring(il_fila,'fc_fallecido_apellido_materno')
ll_num_folio		= dw_lista.getitemnumber(il_fila,'fc_cabecera_folio_crematorio')





UPDATE	"ALMACEN_CENIZAS"  
SET 	"ALMACEN_CENIZAS"."RUT_FALLECIDO" = :ll_rut_fallecido,
		 "ALMACEN_CENIZAS"."DV" = :ls_dv,
		 "ALMACEN_CENIZAS"."BASE" =:ls_base,
		 "ALMACEN_CENIZAS"."SERIE" = :ls_serie,
		 "ALMACEN_CENIZAS"."NUMERO" = :ll_numero,
		 "ALMACEN_CENIZAS"."FECHA_INGRESO_ALMACEN" = :gdt_fec_sistema,
		 "ALMACEN_CENIZAS"."NOMBRE_FALLECIDO" = :ls_nom_fall,
		 "ALMACEN_CENIZAS"."AP_PATERNO_FALLECIDO" = :ls_ap_pat_fall,
		 "ALMACEN_CENIZAS"."AP_MATERNO_FALLECIDO" = :ls_ap_mat_fall,
		 "ALMACEN_CENIZAS"."NUMERO_FOLIO" = :ll_num_folio
WHERE 
		 ( "ALMACEN_CENIZAS"."NIVELES" = :li_nivel )   
USING		sqlca;
if sqlca.sqlcode=0 then
	dw_detalle.accepttext()
	commit;
	dw_detalle.retrieve()
	dw_lista.retrieve(ld_fecha_proceso)
	dw_lista_estado_6.retrieve(ld_fecha_proceso)
	messagebox("Asignación Casilla","Asignación Exitosa Casilla N° : " + string(li_nivel) + ' ' + ' para fallecido : ' + trim(ls_nom_fall)  + ' ' + trim(ls_ap_pat_fall) + ' ' + trim(ls_ap_mat_fall)  )
	
	wf_registra_log('Ingreso de anfora a Casilla N° : ' + string(li_nivel),li_nivel)
	
else
	rollback;
	messagebox("Error Asignación Casilla","Error al Asignación Casilla N° : " + string(li_nivel)+" SQL: "+sqlca.sqlerrtext)
end if




end event

type cb_cerrar from commandbutton within w_almacen_cenizas
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

event clicked;close(W_ALMACEN_CENIZAS)
end event

type dw_lista from datawindow within w_almacen_cenizas
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 100
integer width = 2158
integer height = 996
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

type st_titulo from statictext within w_almacen_cenizas
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

type dw_detalle from datawindow within w_almacen_cenizas
event ue_mousemove pbm_dwnmousemove
event timer ( )
integer x = 2226
integer y = 276
integer width = 3881
integer height = 2060
integer taborder = 40
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

event clicked;String	ls_nivel,ls_estado_reg,ls_columna,ls_est_reg_prox,ls_pasa,ls_est_reg_ini,ls_area,ls_sector,&
			ls_sepultura,ls_serie_fosa,ls_nulo,ls_nivel_fosa,ls_area_fosa,ls_sector_fosa,ls_sepult_fosa,&
			ls_base_fosa,ls_base,ls_serie, ls_dv,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall
Long		ll_suma_a,ll_res,ll_nulo,ll_tot_reg,ll_parque_fosa,ll_suma,ll_suma_g,ll_indi,&
			ll_corr_fosa,ll_row,ll_cod_parque,ll_tot_reg_det,ll_fila_det ,ll_rut_fallecido
Datetime	ldt_nulo
Double	ll_numero_fosa,ll_numero

ls_pasa					= 'S'
il_fila						= row
ls_columna				= dwo.name

 if dw_detalle.IsSelected(il_fila) then
	This.SelectRow(il_fila, false)
 end if 

if il_fila > 0  then
	ll_rut_fallecido		= dw_detalle.getitemnumber(il_fila,'rut_fallecido')
	
	if ll_rut_fallecido = 0 or isnull(ll_rut_fallecido) then
		This.SelectRow(0, FALSE)
		This.SelectRow(il_fila, TRUE)
	end if
	
	if ll_rut_fallecido >0  then
		messagebox("Advertencia","Casilla Ya Utilizada, Recuerde si desea Liberar Casilla debe Presionar Botón DESOCUPAR Casilla")
		This.SelectRow(il_fila, false)
	end if
	dw_detalle.accepttext()
end if
end event

type gb_1 from groupbox within w_almacen_cenizas
integer x = 37
integer y = 1116
integer width = 2158
integer height = 172
integer taborder = 50
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_almacen_cenizas
integer x = 41
integer y = 2152
integer width = 2158
integer height = 172
integer taborder = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

