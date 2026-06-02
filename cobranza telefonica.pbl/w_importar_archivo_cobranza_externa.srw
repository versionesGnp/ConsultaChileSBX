forward
global type w_importar_archivo_cobranza_externa from window
end type
type cb_ctacte from commandbutton within w_importar_archivo_cobranza_externa
end type
type cb_historico from commandbutton within w_importar_archivo_cobranza_externa
end type
type cb_ordenar from commandbutton within w_importar_archivo_cobranza_externa
end type
type cb_filtrar from commandbutton within w_importar_archivo_cobranza_externa
end type
type cb_imprimir from commandbutton within w_importar_archivo_cobranza_externa
end type
type cb_cerrar from commandbutton within w_importar_archivo_cobranza_externa
end type
type cb_limpiar from commandbutton within w_importar_archivo_cobranza_externa
end type
type cb_grabar from commandbutton within w_importar_archivo_cobranza_externa
end type
type cb_importar from commandbutton within w_importar_archivo_cobranza_externa
end type
type dw_importar from datawindow within w_importar_archivo_cobranza_externa
end type
type gb_1 from groupbox within w_importar_archivo_cobranza_externa
end type
end forward

global type w_importar_archivo_cobranza_externa from window
integer width = 2825
integer height = 2052
boolean titlebar = true
string title = "Importar Archivo Cobranza Telefónica"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_historico cb_historico
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
cb_limpiar cb_limpiar
cb_grabar cb_grabar
cb_importar cb_importar
dw_importar dw_importar
gb_1 gb_1
end type
global w_importar_archivo_cobranza_externa w_importar_archivo_cobranza_externa

type variables
long	il_row
end variables

on w_importar_archivo_cobranza_externa.create
this.cb_ctacte=create cb_ctacte
this.cb_historico=create cb_historico
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.cb_importar=create cb_importar
this.dw_importar=create dw_importar
this.gb_1=create gb_1
this.Control[]={this.cb_ctacte,&
this.cb_historico,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.cb_limpiar,&
this.cb_grabar,&
this.cb_importar,&
this.dw_importar,&
this.gb_1}
end on

on w_importar_archivo_cobranza_externa.destroy
destroy(this.cb_ctacte)
destroy(this.cb_historico)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.cb_importar)
destroy(this.dw_importar)
destroy(this.gb_1)
end on

event open;long	ll_new
gf_centrar(w_importar_archivo_cobranza_externa)
dw_importar.settransobject(sqlca)
ll_new						= dw_importar.insertrow(0)
dw_importar.scrolltorow(ll_new)
dw_importar.setitem(ll_new,'estado_cob','0')
dw_importar.accepttext()
dw_importar.reset()
if gs_depto<>'G' then 
	cb_grabar.enabled		= true
	cb_importar.enabled	= true
else
	cb_grabar.enabled		= false
	cb_importar.enabled	= false
end if
end event

type cb_ctacte from commandbutton within w_importar_archivo_cobranza_externa
event ue_mousemove pbm_mousemove
integer x = 1879
integer y = 1784
integer width = 279
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Cte"
end type

event clicked;if il_row>0 then
	if isvalid(w_listado_contratos_rut) then close(w_listado_contratos_rut)
	gi_rut				= 	dw_importar.getitemnumber(il_row,'rut')
	gi_tipo_busqueda 	= 1
	open(w_listado_contratos_rut)
else
	messagebox("Adveretencia","Ud. debe seleccionar un Contrato")
end if
end event

type cb_historico from commandbutton within w_importar_archivo_cobranza_externa
event ue_mousemove pbm_dwnmousemove
integer x = 1115
integer y = 1784
integer width = 283
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_importar.getrow()>0 then
	gs_base			= dw_importar.getitemstring(il_row,'base')
	gs_serie			= dw_importar.getitemstring(il_row,'serie')
	gi_numero		= dw_importar.getitemnumber(il_row,'numero')
	gi_rut			= dw_importar.getitemnumber(il_row,'rut')
	open(w_cobranza_historica)
end if
end event

type cb_ordenar from commandbutton within w_importar_archivo_cobranza_externa
event ue_mousemove pbm_dwnmousemove
integer x = 338
integer y = 1784
integer width = 247
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_importar.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_importar.SETSORT(NULO)
	dw_importar.SORT()
end if
end event

type cb_filtrar from commandbutton within w_importar_archivo_cobranza_externa
event ue_mousemove pbm_mousemove
integer x = 590
integer y = 1784
integer width = 247
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

event clicked;long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string ls_texto
setnull (gs_formula)
dw_importar.SETfilter(gs_formula)
dw_importar.filter()
ll_filas		= dw_importar.rowcount()
gs_formula 	= dw_importar.describe("datawindow.syntax")
ll_largototal	= len(gs_formula)
ll_posini	= Pos(gs_formula, "filter") + 8
ll_posfin	= len("~nfilter~n")
ls_texto		= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto		= ll_posfin - ll_posini
gs_formula	= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula	= ''
end if

end event

type cb_imprimir from commandbutton within w_importar_archivo_cobranza_externa
event ue_mousemove pbm_mousemove
integer x = 841
integer y = 1784
integer width = 247
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_importar.rowcount()>0 then
	f_Print( dw_importar )
//	f_printdlg(dw_importar,gstr_print,parent)
end if
end event

type cb_cerrar from commandbutton within w_importar_archivo_cobranza_externa
integer x = 2469
integer y = 1784
integer width = 265
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_importar_archivo_cobranza_externa)
end event

type cb_limpiar from commandbutton within w_importar_archivo_cobranza_externa
integer x = 2185
integer y = 1784
integer width = 242
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_importar.reset()
end event

type cb_grabar from commandbutton within w_importar_archivo_cobranza_externa
integer x = 64
integer y = 1784
integer width = 247
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long		ll_tot_reg,ll_indi,ll_grupo,ll_rut,ll_sum_reg
String	ls_base,ls_serie,ls_est_cob,ls_glosa_cob,ls_estado_llamada,ls_usuario_asignado
Datetime	ldt_fecha,ldt_fec_prox_llamada
double	ldb_numero
SetPointer(HourGlass!)
ll_tot_reg	= dw_importar.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ll_grupo					= dw_importar.getitemnumber(ll_indi,'grupo')
		ls_base					= dw_importar.getitemstring(ll_indi,'base')
		ls_serie					= dw_importar.getitemstring(ll_indi,'serie')
		ldb_numero				= dw_importar.getitemnumber(ll_indi,'numero')
		ll_rut					= dw_importar.getitemnumber(ll_indi,'rut')
		ldt_fecha				= dw_importar.getitemdatetime(ll_indi,'fecha_cob')
		ls_est_cob				= dw_importar.getitemstring(ll_indi,'estado_cob')
		ls_glosa_cob			= dw_importar.getitemstring(ll_indi,'glosa_cob')
		ldt_fec_prox_llamada	= dw_importar.getitemdatetime(ll_indi,'fecha_prox_llamada')
		if ll_grupo>0 and not isnull(ll_grupo) and not isnull(ls_base) and not isnull(ls_serie) and &
			not isnull(ldb_numero) and ldb_numero>0 and ll_rut>0 then

			SELECT	"GESTION_COBRANZA"."ESTADO_LLAMADA",
						"GESTION_COBRANZA"."USUARIO_ASIGNADO"
			INTO 		:ls_estado_llamada,
						:ls_usuario_asignado
			FROM 		"GESTION_COBRANZA"  
			WHERE  ( "GESTION_COBRANZA"."BASE" = :ls_base ) AND  
					 ( "GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
					 ( "GESTION_COBRANZA"."NUMERO" = :ldb_numero ) AND  
					 ( "GESTION_COBRANZA"."RUT" = :ll_rut ) AND  
					 ( "GESTION_COBRANZA"."CODIGO_GRUPO" = :ll_grupo )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado_llamada='G' then
					messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ldb_numero)+", ya fue Gestionada Cobranza Telefónica") // por Usuario: "+ls_usuario_asignado)
				else
					UPDATE	"CLIENTE"  
					SET 		"ESTADO_COBRANZA" = :ls_est_cob,   
								"FECHA_COBRANZA"  = :ldt_fecha,   
								"GLOSA_COBRANZA"  = :ls_glosa_cob,  
								"USUARIO"         = :ls_usuario_asignado, 
								"FECHA_PROX_LLAMADO" = :ldt_fec_prox_llamada,
								"ASIGNADO_COBRANZA" = 'N'
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						UPDATE	"GESTION_COBRANZA"  
						SET 		"ESTADO_LLAMADA" = 'G'  
						WHERE  ( "GESTION_COBRANZA"."BASE" = :ls_base ) AND  
								 ( "GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
								 ( "GESTION_COBRANZA"."NUMERO" = :ldb_numero ) AND  
								 ( "GESTION_COBRANZA"."RUT" = :ll_rut ) AND  
								 ( "GESTION_COBRANZA"."CODIGO_GRUPO" = :ll_grupo )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							INSERT INTO "TELE_LOG"  
									 ( "RUT"  ,"ESTADO"  ,	"FECHA"   			,"GLOSA"    ,	"USUARIO"  ,				"BASE"  ,	"SERIE"  ,	"NUMERO" )  
							VALUES ( :ll_rut,:ls_est_cob,	:gdt_fec_sistema ,:ls_glosa_cob,	:ls_usuario_asignado  ,	:ls_base,	:ls_serie,	:ldb_numero)  ;
							if sqlca.sqlcode = 0 then
								commit;
								SELECT	count("GESTION_COBRANZA"."RUT")  
								INTO 		:ll_sum_reg  
								FROM 		"GESTION_COBRANZA"  
								WHERE  ( "GESTION_COBRANZA"."CODIGO_GRUPO" = :ll_grupo ) AND  
										 ( "GESTION_COBRANZA"."ESTADO_LLAMADA" = 'P' )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									if ll_sum_reg=0 then
										UPDATE	"GESTION_LISTA"  
										SET 		"ESTADO" = 'G'  
										WHERE 	"GESTION_LISTA"."CODIGO" = :ll_grupo   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
								end if
							else
								rollback;
							end if
						else
							rollback;
						end if
					else
						rollback;
					end if
				end if
			end if
		end if
		Setnull(ll_grupo);Setnull(ls_base);Setnull(ls_serie);Setnull(ldb_numero);Setnull(ll_rut)
		Setnull(ldt_fecha);Setnull(ls_est_cob);Setnull(ls_glosa_cob);Setnull(ldt_fec_prox_llamada)
	next
	messagebox("Grabar","Grabación Exitosa")
end if
SetPointer(Arrow!)
end event

type cb_importar from commandbutton within w_importar_archivo_cobranza_externa
integer x = 1426
integer y = 1784
integer width = 425
integer height = 92
integer taborder = 60
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Buscar Archivo"
end type

event clicked;string	ls_archivo
dw_importar.reset()
dw_importar.accepttext()
SetNull(ls_archivo)
dw_importar.ImportFile(ls_archivo)
dw_importar.accepttext()
end event

type dw_importar from datawindow within w_importar_archivo_cobranza_externa
integer x = 32
integer y = 36
integer width = 2743
integer height = 1692
integer taborder = 10
string dataobject = "dwe_importar_cobranza_externa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	cb_ctacte.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_importar_archivo_cobranza_externa
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1728
integer width = 2747
integer height = 176
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

