forward
global type w_rescomi_por_vta from window
end type
type cb_ordenar from commandbutton within w_rescomi_por_vta
end type
type cb_filtrar from commandbutton within w_rescomi_por_vta
end type
type cb_2 from commandbutton within w_rescomi_por_vta
end type
type cb_cerrar from commandbutton within w_rescomi_por_vta
end type
type dw_rescomi from datawindow within w_rescomi_por_vta
end type
end forward

global type w_rescomi_por_vta from window
integer width = 2953
integer height = 1832
boolean titlebar = true
string title = "Res-Comi por Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_2 cb_2
cb_cerrar cb_cerrar
dw_rescomi dw_rescomi
end type
global w_rescomi_por_vta w_rescomi_por_vta

on w_rescomi_por_vta.create
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_2=create cb_2
this.cb_cerrar=create cb_cerrar
this.dw_rescomi=create dw_rescomi
this.Control[]={this.cb_ordenar,&
this.cb_filtrar,&
this.cb_2,&
this.cb_cerrar,&
this.dw_rescomi}
end on

on w_rescomi_por_vta.destroy
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_2)
destroy(this.cb_cerrar)
destroy(this.dw_rescomi)
end on

event open;string		ls_clasif
long		ll_tot_reg
Double	ld_pie, ld_cta_1, ld_cta_2, ld_cta_3, ld_cta_4, ld_cta_5, ld_cta_6,ld_cta_7, ld_cta_8, ld_cta_9,ldb_tot_comi
datetime	ldt_fecha_ini,ldt_fecha_fin
gf_centrar(w_rescomi_por_vta)
dw_rescomi.settransobject(sqlca)
gs_ventana	= 'w_rescomi_por_vta'
f_valida_objeto()

ll_tot_reg							= dw_rescomi.retrieve(gs_base,gs_serie,gi_numero)
ldt_fecha_ini						= datetime(date(string('01-01-1997')),time('00:00:00'))
if gs_base='O' then
	SELECT 	"CLASIFICA_VENTA"  
	INTO 		:ls_clasif  
	FROM 	"OFERTA_V"  
	WHERE 	( "OFERTA_V"."SERIE" = :gs_serie ) AND  
				( "OFERTA_V"."NRO_OFERTA" = :gi_numero )
	USING	sqlca;
	ldt_fecha_fin						= datetime(date(string('28/02/2013')),time('00:00:00'))
elseif gs_base='L' then
	SELECT 	"CLASIFICA_VENTA"  
	INTO 		:ls_clasif  
	FROM 	"ANEXO_LIBERADOR"  
	WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
				( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )
	USING	sqlca;
	ldt_fecha_fin						= datetime(date(string('30/04/2014')),time('00:00:00'))
elseif gs_base='A' then
	SELECT 	"CLASIFICA_VENTA"  
	INTO 		:ls_clasif  
	FROM 	"ANEXO_AUMENTO"  
	WHERE 	( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
				( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )
	USING	sqlca;	
	ldt_fecha_fin						= datetime(date(string('30/04/2014')),time('00:00:00'))
end if
dw_rescomi.object.t_clasif.text		= 'Clasif.Vta. '+ls_clasif
if gdt_fec_cierre>= ldt_fecha_ini and gdt_fec_cierre< ldt_fecha_fin then
	SELECT	"C_PIE",	"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA"
	INTO 		:ld_pie,	:ld_cta_1,		:ld_cta_2,		:ld_cta_3,		:ld_cta_4,		:ld_cta_5,		:ld_cta_6,	:ld_cta_7,		:ld_cta_8,		:ld_cta_9
	FROM 	"COMISION_PROMESA"  
	WHERE	"COMISION_PROMESA"."BASE" = :gs_base AND  
				"COMISION_PROMESA"."SERIE" = :gs_serie AND  
				"COMISION_PROMESA"."NUMERO" = :gi_numero
	Using		sqlca;
	if sqlca.sqlcode=0 then
		dw_rescomi.object.t_titulo.text		= 'Definición %   Pie: '+string(ld_pie,"###,##0.0")
		dw_rescomi.object.t_dev_age.text	= 'Cta.Nº 1: '+string(ld_cta_1,"###,##0.0")+'  Cta.Nº 2: '+string(ld_cta_2,"###,##0.0")+'  Cta.Nº 3: '+string(ld_cta_3,"###,##0.0")+'  Cta.Nº 4: '+string(ld_cta_4,"###,##0.0")+'  Cta.Nº 5: '+string(ld_cta_5,"###,##0.0")+'  Cta.Nº 6: '+string(ld_cta_6,"###,##0.0")+'  Cta.Nº 7: '+string(ld_cta_7,"###,##0.0")+'  Cta.Nº 8: '+string(ld_cta_8,"###,##0.0")+'  Cta.Nº 9: '+string(ld_cta_9,"###,##0.0")
	end if
else
	SELECT	"PORCE_COMI",	"C_SEGUNDA",	"C_CUARTA",	"C_SEXTA",	"C_SEPTIMA"
	INTO		:ld_pie,				:ld_cta_2,		:ld_cta_4,		:ld_cta_6,	:ld_cta_7
	FROM		"COMISION_PERSISTENCIA"  
	WHERE	( "COMISION_PERSISTENCIA"."BASE" = :gs_base ) AND  
				( "COMISION_PERSISTENCIA"."SERIE" = :gs_serie ) AND  
				( "COMISION_PERSISTENCIA"."NUMERO" = :gi_numero ) AND  
				( "COMISION_PERSISTENCIA"."CARGO" = 'A' )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		ldb_tot_comi							= ld_pie + ld_cta_2 + ld_cta_4 + ld_cta_6 + ld_cta_7
		dw_rescomi.object.t_dev_age.text	= 'Deveng. Agente       % Comis. '+string(ld_pie,"###,##0.0")+'    Cta.Nº 2: '+string(ld_cta_2,"###,##0.0")+'    Cta.Nº 4: '+string(ld_cta_4,"###,##0.0")+'    Cta.Nº 6: '+string(ld_cta_6,"###,##0.0")+'    Cta.Nº 7: '+string(ld_cta_7,"###,##0.0")+'    Total Pago. : '+string(ldb_tot_comi,"###,##0.0")
	end if
	SELECT	"PORCE_COMI",	"C_SEGUNDA",	"C_CUARTA",	"C_SEXTA",	"C_SEPTIMA"
	INTO		:ld_pie,				:ld_cta_2,		:ld_cta_4,		:ld_cta_6,	:ld_cta_7
	FROM		"COMISION_PERSISTENCIA"  
	WHERE	( "COMISION_PERSISTENCIA"."BASE" = :gs_base ) AND
				( "COMISION_PERSISTENCIA"."SERIE" = :gs_serie ) AND  
				( "COMISION_PERSISTENCIA"."NUMERO" = :gi_numero ) AND  
				( "COMISION_PERSISTENCIA"."CARGO" = 'S' )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		ldb_tot_comi							= ld_pie + ld_cta_2 + ld_cta_4 + ld_cta_6 + ld_cta_7
		dw_rescomi.object.t_dev_sup.text	= 'Deveng. Supervisor % Comis. '+string(ld_pie,"###,##0.0")+'    Cta.Nº 2: '+string(ld_cta_2,"###,##0.0")+'    Cta.Nº 4: '+string(ld_cta_4,"###,##0.0")+'    Cta.Nº 6: '+string(ld_cta_6,"###,##0.0")+'    Cta.Nº 7: '+string(ld_cta_7,"###,##0.0")+'    Total Pago. : '+string(ldb_tot_comi,"###,##0.0")
	end if
	SELECT	"PORCE_COMI",	"C_SEGUNDA",	"C_CUARTA",	"C_SEXTA",	"C_SEPTIMA"
	INTO		:ld_pie,				:ld_cta_2,		:ld_cta_4,		:ld_cta_6,	:ld_cta_7
	FROM		"COMISION_PERSISTENCIA"  
	WHERE	( "COMISION_PERSISTENCIA"."BASE" = :gs_base ) AND
				( "COMISION_PERSISTENCIA"."SERIE" = :gs_serie ) AND  
				( "COMISION_PERSISTENCIA"."NUMERO" = :gi_numero ) AND  
				( "COMISION_PERSISTENCIA"."CARGO" = 'J' )
	USING	sqlca;
	if sqlca.sqlcode=0 then
		ldb_tot_comi							= ld_pie + ld_cta_2 + ld_cta_4 + ld_cta_6 + ld_cta_7
		dw_rescomi.object.t_dev_jef.text	= 'Deveng. Jefe Venta % Comis. '+string(ld_pie,"###,##0.0")+'    Cta.Nº 2: '+string(ld_cta_2,"###,##0.0")+'    Cta.Nº 4: '+string(ld_cta_4,"###,##0.0")+'    Cta.Nº 6: '+string(ld_cta_6,"###,##0.0")+'    Cta.Nº 7: '+string(ld_cta_7,"###,##0.0")+'    Total Pago. : '+string(ldb_tot_comi,"###,##0.0")
	end if
end if
if ll_tot_reg=0 then
	messagebox("Advertencia","No registra Pagos")
end if
end event

type cb_ordenar from commandbutton within w_rescomi_por_vta
integer x = 1531
integer y = 1572
integer width = 306
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
Setnull (nulo)
dw_rescomi.setsort(nulo)
dw_rescomi.sort()
end event

type cb_filtrar from commandbutton within w_rescomi_por_vta
integer x = 1221
integer y = 1572
integer width = 306
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_rescomi.setfilter(nulo)
dw_rescomi.filter()
end event

type cb_2 from commandbutton within w_rescomi_por_vta
integer x = 46
integer y = 1572
integer width = 306
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_rescomi.rowcount()>0 then
	f_Print( dw_rescomi)
end if
end event

type cb_cerrar from commandbutton within w_rescomi_por_vta
integer x = 2569
integer y = 1572
integer width = 325
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_rescomi_por_vta)
end event

type dw_rescomi from datawindow within w_rescomi_por_vta
integer x = 46
integer y = 44
integer width = 2848
integer height = 1512
integer taborder = 10
string dataobject = "dw_rescomi_por_vta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

