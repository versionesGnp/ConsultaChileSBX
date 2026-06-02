forward
global type w_rescomi_ventas from window
end type
type cb_filtrar from commandbutton within w_rescomi_ventas
end type
type cb_2 from commandbutton within w_rescomi_ventas
end type
type cb_1 from commandbutton within w_rescomi_ventas
end type
type dw_rescomi from datawindow within w_rescomi_ventas
end type
end forward

global type w_rescomi_ventas from window
integer width = 3026
integer height = 1732
boolean titlebar = true
string title = "Res-Comi por Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_2 cb_2
cb_1 cb_1
dw_rescomi dw_rescomi
end type
global w_rescomi_ventas w_rescomi_ventas

on w_rescomi_ventas.create
this.cb_filtrar=create cb_filtrar
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_rescomi=create dw_rescomi
this.Control[]={this.cb_filtrar,&
this.cb_2,&
this.cb_1,&
this.dw_rescomi}
end on

on w_rescomi_ventas.destroy
destroy(this.cb_filtrar)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_rescomi)
end on

event open;string		ls_base,ls_serie,ls_clasif
long		ll_tot_reg
Double	ldb_numero,ld_pie, ld_cta_1, ld_cta_2, ld_cta_3, ld_cta_4, ld_cta_5, ld_cta_6,&
			ld_cta_7, ld_cta_8, ld_cta_9,ldb_tot_comi
datetime	ldt_fecha_ini,ldt_fecha_fin

gf_centrar(w_rescomi_ventas)
ls_base									= substr(1,1,Message.StringParm)
ls_serie									= substr(1,2,Message.StringParm)
ldb_numero								= double(substr(1,3,Message.StringParm))
dw_rescomi.dataobject = 'dw_rescomi_ventas'
dw_rescomi.settransobject(sqlca)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
	ll_tot_reg							= dw_rescomi.retrieve(ls_base,ls_serie,ldb_numero)
	ldt_fecha_ini						= datetime(date(string('01-01-1997')),time('00:00:00'))
	if ls_base='O' then
		SELECT 	"CIERRE_VENTA","CLASIFICA_VENTA"  
    		INTO 		:gdt_fec_cierre,:ls_clasif  
    		FROM 	"OFERTA_V"  
   		WHERE 	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
         			( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
		USING	sqlca;
		ldt_fecha_fin						= datetime(date(string('28/02/2013')),time('00:00:00'))
	elseif ls_base='L' then
		SELECT 	"CIERRE_VENTA","CLASIFICA_VENTA"  
    		INTO 		:gdt_fec_cierre,:ls_clasif  
    		FROM 	"ANEXO_LIBERADOR"  
   		WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
         			( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
		USING	sqlca;
		ldt_fecha_fin						= datetime(date(string('30/04/2014')),time('00:00:00'))
	elseif ls_base='A' then
		SELECT 	"CIERRE_VENTA","CLASIFICA_VENTA"  
    		INTO 		:gdt_fec_cierre,:ls_clasif  
    		FROM 	"ANEXO_AUMENTO"  
   		WHERE 	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
         			( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
		USING	sqlca;	
		ldt_fecha_fin						= datetime(date(string('30/04/2014')),time('00:00:00'))
	end if
	dw_rescomi.object.t_clasif.text		= 'Clasif.Vta. '+ls_clasif
	if gdt_fec_cierre>= ldt_fecha_ini and gdt_fec_cierre< ldt_fecha_fin then
		SELECT	"C_PIE",	"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA"
		INTO 		:ld_pie,	:ld_cta_1,		:ld_cta_2,		:ld_cta_3,		:ld_cta_4,		:ld_cta_5,		:ld_cta_6,	:ld_cta_7,		:ld_cta_8,		:ld_cta_9
		FROM 	"COMISION_PROMESA"  
		WHERE	"COMISION_PROMESA"."BASE" = :ls_base AND  
					"COMISION_PROMESA"."SERIE" = :ls_serie AND  
					"COMISION_PROMESA"."NUMERO" = :ldb_numero
		Using		sqlca;
		if sqlca.sqlcode=0 then
			dw_rescomi.object.t_titulo.text		= 'Definición %   Pie: '+string(ld_pie,"###,##0.0")
			dw_rescomi.object.t_dev_age.text	= 'Cta.Nº 1: '+string(ld_cta_1,"###,##0.0")+'  Cta.Nº 2: '+string(ld_cta_2,"###,##0.0")+'  Cta.Nº 3: '+string(ld_cta_3,"###,##0.0")+'  Cta.Nº 4: '+string(ld_cta_4,"###,##0.0")+'  Cta.Nº 5: '+string(ld_cta_5,"###,##0.0")+'  Cta.Nº 6: '+string(ld_cta_6,"###,##0.0")+'  Cta.Nº 7: '+string(ld_cta_7,"###,##0.0")+'  Cta.Nº 8: '+string(ld_cta_8,"###,##0.0")+'  Cta.Nº 9: '+string(ld_cta_9,"###,##0.0")
		end if
	else
		SELECT	"PORCE_COMI",	"C_SEGUNDA",	"C_CUARTA",	"C_SEXTA",	"C_SEPTIMA"
		INTO		:ld_pie,				:ld_cta_2,		:ld_cta_4,		:ld_cta_6,	:ld_cta_7
		FROM		"COMISION_PERSISTENCIA"  
		WHERE	( "COMISION_PERSISTENCIA"."BASE" = :ls_base ) AND  
					( "COMISION_PERSISTENCIA"."SERIE" = :ls_serie ) AND  
					( "COMISION_PERSISTENCIA"."NUMERO" = :ldb_numero ) AND  
					( "COMISION_PERSISTENCIA"."CARGO" = 'A' )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			ldb_tot_comi							= ld_pie + ld_cta_2 + ld_cta_4 + ld_cta_6 + ld_cta_7
			dw_rescomi.object.t_dev_age.text	= 'Deveng. Agente       % Comis. '+string(ld_pie,"###,##0.0")+'    Cta.Nº 2: '+string(ld_cta_2,"###,##0.0")+'    Cta.Nº 4: '+string(ld_cta_4,"###,##0.0")+'    Cta.Nº 6: '+string(ld_cta_6,"###,##0.0")+'    Cta.Nº 7: '+string(ld_cta_7,"###,##0.0")+'    Total Pago. : '+string(ldb_tot_comi,"###,##0.0")
		end if
		SELECT	"PORCE_COMI",	"C_SEGUNDA",	"C_CUARTA",	"C_SEXTA",	"C_SEPTIMA"
		INTO		:ld_pie,				:ld_cta_2,		:ld_cta_4,		:ld_cta_6,	:ld_cta_7
		FROM		"COMISION_PERSISTENCIA"  
		WHERE	( "COMISION_PERSISTENCIA"."BASE" = :ls_base ) AND
					( "COMISION_PERSISTENCIA"."SERIE" = :ls_serie ) AND  
					( "COMISION_PERSISTENCIA"."NUMERO" = :ldb_numero ) AND  
					( "COMISION_PERSISTENCIA"."CARGO" = 'S' )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			ldb_tot_comi							= ld_pie + ld_cta_2 + ld_cta_4 + ld_cta_6 + ld_cta_7
			dw_rescomi.object.t_dev_sup.text	= 'Deveng. Supervisor % Comis. '+string(ld_pie,"###,##0.0")+'    Cta.Nº 2: '+string(ld_cta_2,"###,##0.0")+'    Cta.Nº 4: '+string(ld_cta_4,"###,##0.0")+'    Cta.Nº 6: '+string(ld_cta_6,"###,##0.0")+'    Cta.Nº 7: '+string(ld_cta_7,"###,##0.0")+'    Total Pago. : '+string(ldb_tot_comi,"###,##0.0")
		end if
		SELECT	"PORCE_COMI",	"C_SEGUNDA",	"C_CUARTA",	"C_SEXTA",	"C_SEPTIMA"
		INTO		:ld_pie,				:ld_cta_2,		:ld_cta_4,		:ld_cta_6,	:ld_cta_7
		FROM		"COMISION_PERSISTENCIA"  
		WHERE	( "COMISION_PERSISTENCIA"."BASE" = :ls_base ) AND
					( "COMISION_PERSISTENCIA"."SERIE" = :ls_serie ) AND  
					( "COMISION_PERSISTENCIA"."NUMERO" = :ldb_numero ) AND  
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
end if
end event

type cb_filtrar from commandbutton within w_rescomi_ventas
integer x = 1303
integer y = 1488
integer width = 306
integer height = 100
integer taborder = 40
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
dw_rescomi.SETfilter(NULO)
dw_rescomi.filter()
end event

type cb_2 from commandbutton within w_rescomi_ventas
integer x = 46
integer y = 1488
integer width = 306
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_rescomi.rowcount() > 0 then dw_rescomi.print()
end event

type cb_1 from commandbutton within w_rescomi_ventas
integer x = 2642
integer y = 1488
integer width = 325
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_rescomi_ventas)
end event

type dw_rescomi from datawindow within w_rescomi_ventas
integer x = 46
integer y = 44
integer width = 2921
integer height = 1408
integer taborder = 10
string dataobject = "dw_rescomi_ventas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

