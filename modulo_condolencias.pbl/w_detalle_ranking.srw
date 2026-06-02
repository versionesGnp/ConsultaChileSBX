forward
global type w_detalle_ranking from window
end type
type cb_exportar from commandbutton within w_detalle_ranking
end type
type cb_filtrar from commandbutton within w_detalle_ranking
end type
type cb_imprimir from commandbutton within w_detalle_ranking
end type
type cb_cerrar from commandbutton within w_detalle_ranking
end type
type dw_lista from datawindow within w_detalle_ranking
end type
type gb_1 from groupbox within w_detalle_ranking
end type
end forward

global type w_detalle_ranking from window
integer width = 3118
integer height = 1808
boolean titlebar = true
string title = "Detalle Ranking Condolencias"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_detalle_ranking w_detalle_ranking

on w_detalle_ranking.create
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.cb_filtrar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_detalle_ranking.destroy
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;string 	ls_maestro_c
long		ll_grupo,ll_indi,ll_corr,ll_tot_reg,ll_nota_mc,ll_nota_serv
date		ldt_fec_ini,ldt_fec_fin
gf_centrar(w_detalle_ranking)

dw_lista.settransobject(sqlca)
ldt_fec_ini			= DATE(substr(1,1,Message.StringParm))
ldt_fec_fin			= DATE(substr(1,2,Message.StringParm))
ls_maestro_c		= substr(1,3,Message.StringParm)
if dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin,ls_maestro_c) > 0 then
	ll_tot_reg				= dw_lista.rowcount()
	for ll_indi = 1 to ll_tot_reg
		ll_grupo			= dw_lista.getitemnumber(ll_indi,"ugn_cliente_grupo")
		ll_corr			= dw_lista.getitemnumber(ll_indi,"ugn_cliente_correlativo")
		if 	ll_grupo > 0 and ll_corr > 0 then
			SELECT 	"UGN_ENCUESTA_SERVICIO"."NOTA_SERVICIO","UGN_ENCUESTA_SERVICIO"."NOTA_MAESTRO_C"  
			INTO 		:ll_nota_serv,:ll_nota_mc  
			FROM 	"UGN_ENCUESTA_SERVICIO"  
			WHERE 	"UGN_ENCUESTA_SERVICIO"."GRUPO" = :ll_grupo AND  
						"UGN_ENCUESTA_SERVICIO"."CORRELATIVO" = :ll_corr
			USING	sqlca;
			if isnull(ll_nota_serv) or ll_nota_serv = 0 then 
				ll_nota_serv = 0
				ll_nota_mc	= 0
			end if	
			dw_lista.setitem(ll_indi,"nota_serv",ll_nota_serv)
			dw_lista.setitem(ll_indi,"nota_mc",ll_nota_mc)
		end if
		setnull(ll_nota_serv);setnull(ll_nota_mc);
	next	
end if

end event

type cb_exportar from commandbutton within w_detalle_ranking
integer x = 1294
integer y = 1588
integer width = 256
integer height = 92
integer taborder = 40
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

type cb_filtrar from commandbutton within w_detalle_ranking
integer x = 1554
integer y = 1588
integer width = 256
integer height = 92
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
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_imprimir from commandbutton within w_detalle_ranking
integer x = 37
integer y = 1588
integer width = 306
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

event clicked;if dw_lista.rowcount() > 0 then 
	f_Print( dw_lista )
end if
end event

type cb_cerrar from commandbutton within w_detalle_ranking
integer x = 2761
integer y = 1588
integer width = 306
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_detalle_ranking)
end event

type dw_lista from datawindow within w_detalle_ranking
integer x = 37
integer y = 32
integer width = 3031
integer height = 1492
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_ranking"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_detalle_ranking
integer x = 1275
integer y = 1540
integer width = 549
integer height = 156
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

