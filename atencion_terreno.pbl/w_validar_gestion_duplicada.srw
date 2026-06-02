forward
global type w_validar_gestion_duplicada from window
end type
type cb_exportar from commandbutton within w_validar_gestion_duplicada
end type
type cb_filtrar from commandbutton within w_validar_gestion_duplicada
end type
type dw_lista from datawindow within w_validar_gestion_duplicada
end type
type cb_aceptar from commandbutton within w_validar_gestion_duplicada
end type
type cb_cerrar from commandbutton within w_validar_gestion_duplicada
end type
end forward

global type w_validar_gestion_duplicada from window
integer x = 832
integer y = 360
integer width = 1335
integer height = 1116
boolean titlebar = true
string title = "Creación Archivo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_exportar cb_exportar
cb_filtrar cb_filtrar
dw_lista dw_lista
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
end type
global w_validar_gestion_duplicada w_validar_gestion_duplicada

type variables
long	il_row
end variables

on w_validar_gestion_duplicada.create
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.dw_lista=create dw_lista
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_exportar,&
this.cb_filtrar,&
this.dw_lista,&
this.cb_aceptar,&
this.cb_cerrar}
end on

on w_validar_gestion_duplicada.destroy
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.dw_lista)
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
end on

event open;string ls_dia,ls_mes,ls_anno

connect using Trans_1;
gf_centrar(w_validar_gestion_duplicada)
dw_lista.dataobject		= 'dw_validad_duplic_atencion_log'
dw_lista.settransobject(sqlca)
dw_lista.retrieve()
end event

event close;disconnect using Trans_1;
end event

type cb_exportar from commandbutton within w_validar_gestion_duplicada
integer x = 626
integer y = 840
integer width = 251
integer height = 100
integer taborder = 70
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

type cb_filtrar from commandbutton within w_validar_gestion_duplicada
integer x = 379
integer y = 840
integer width = 251
integer height = 100
integer taborder = 70
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

type dw_lista from datawindow within w_validar_gestion_duplicada
integer x = 73
integer y = 44
integer width = 1152
integer height = 776
integer taborder = 50
string title = "none"
string dataobject = "dw_validad_duplic_atencion_log"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type cb_aceptar from commandbutton within w_validar_gestion_duplicada
integer x = 73
integer y = 840
integer width = 251
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;long ll_tot_reg,ll_indi,ll_rut,ll_cta
datetime	ldt_fecha,ldt_fec_select,ldt_new_fecha

dw_lista.accepttext()
ll_tot_reg			= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_rut				= dw_lista.getitemnumber(ll_indi,'rut')
	ldt_fecha			= dw_lista.getitemdatetime(ll_indi,'fecha')
	DECLARE x1 CURSOR FOR
	SELECT	ROWNUM,	"FECHA"  
   	FROM 	"ATENCION_LOG"  
  	WHERE 	( "ATENCION_LOG"."RUT" = :ll_rut ) AND  
         		( "ATENCION_LOG"."FECHA" = :ldt_fecha )
	USING	sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ll_cta,	:ldt_fec_select;
			if not isnull(ldt_fec_select) then
				if ll_cta = 1 then
					ldt_new_fecha						= ldt_fec_select
				end if
				if ldt_new_fecha = ldt_fec_select then
					ldt_new_fecha						= datetime((date(ldt_fec_select)),time('18:30:10'))
					UPDATE	"ATENCION_LOG"  
     				SET 		"FECHA" = :ldt_new_fecha  
   					WHERE	( "ATENCION_LOG"."RUT" = :ll_rut ) AND  
         						( "ATENCION_LOG"."FECHA" = :ldt_fec_select ) and
								ROWNUM = :ll_cta	
					USING	Trans_1;
					if Trans_1.sqlcode=0 then
						commit using Trans_1;
					else
						rollback using Trans_1;
					end if
				else
					ldt_new_fecha	 				= ldt_fec_select
				end if
			end if
			setnull(ldt_fec_select)
		LOOP
	end if
	close x1;
next
end event

type cb_cerrar from commandbutton within w_validar_gestion_duplicada
integer x = 974
integer y = 840
integer width = 251
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_validar_gestion_duplicada)
end event

