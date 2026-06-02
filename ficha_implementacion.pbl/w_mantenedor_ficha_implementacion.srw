forward
global type w_mantenedor_ficha_implementacion from window
end type
type dw_print_blanco2 from datawindow within w_mantenedor_ficha_implementacion
end type
type cb_1 from commandbutton within w_mantenedor_ficha_implementacion
end type
type dw_print_blanco1 from datawindow within w_mantenedor_ficha_implementacion
end type
type cb_buscar from commandbutton within w_mantenedor_ficha_implementacion
end type
type cb_limpiar from commandbutton within w_mantenedor_ficha_implementacion
end type
type dw_print from datawindow within w_mantenedor_ficha_implementacion
end type
type cb_imprimir from commandbutton within w_mantenedor_ficha_implementacion
end type
type cb_exportar from commandbutton within w_mantenedor_ficha_implementacion
end type
type cb_inactivar from commandbutton within w_mantenedor_ficha_implementacion
end type
type st_1 from statictext within w_mantenedor_ficha_implementacion
end type
type cb_cerrar from commandbutton within w_mantenedor_ficha_implementacion
end type
type cb_grabar from commandbutton within w_mantenedor_ficha_implementacion
end type
type tab_1 from tab within w_mantenedor_ficha_implementacion
end type
type tabpage_1 from userobject within tab_1
end type
type dw_antecedentes from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_antecedentes dw_antecedentes
end type
type tabpage_2 from userobject within tab_1
end type
type dw_inspeccion from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_inspeccion dw_inspeccion
end type
type tabpage_3 from userobject within tab_1
end type
type dw_fallecido from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_fallecido dw_fallecido
end type
type tab_1 from tab within w_mantenedor_ficha_implementacion
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type gb_1 from groupbox within w_mantenedor_ficha_implementacion
end type
type cb_nuevo from commandbutton within w_mantenedor_ficha_implementacion
end type
end forward

global type w_mantenedor_ficha_implementacion from window
integer width = 3355
integer height = 1960
boolean titlebar = true
string title = "Ingreso Ficha Implementación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_print_blanco2 dw_print_blanco2
cb_1 cb_1
dw_print_blanco1 dw_print_blanco1
cb_buscar cb_buscar
cb_limpiar cb_limpiar
dw_print dw_print
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_inactivar cb_inactivar
st_1 st_1
cb_cerrar cb_cerrar
cb_grabar cb_grabar
tab_1 tab_1
gb_1 gb_1
cb_nuevo cb_nuevo
end type
global w_mantenedor_ficha_implementacion w_mantenedor_ficha_implementacion

type variables
Long	il_cod_asistente,il_folio_condolencia, il_folio_encuesta,il_folio_implementacion
String	is_implementacion
datawindowchild			idw_detalle5,idw_detalle6,idw_detalle7
end variables

forward prototypes
public subroutine wf_nuevo_registro ()
public subroutine wf_retrieve_dw (long al_folio)
end prototypes

public subroutine wf_nuevo_registro ();Long		ll_cod_parque,ll_new,ll_new_detalle
String		ls_cod_grupo,ls_cod_item

tab_1.tabpage_1.dw_antecedentes.reset()
tab_1.tabpage_2.dw_inspeccion.reset()
Setnull(il_folio_encuesta);Setnull(il_folio_condolencia)
if gs_conexion = "Parque El Prado" then
	ll_cod_parque		= 1
else
	ll_cod_parque		= 11
end if
if idw_detalle2.retrieve(ll_cod_parque)=0 then
	idw_detalle2.insertrow(0)
end if

if idw_detalle3.retrieve('')=0 then
	idw_detalle3.insertrow(0)
end if

if idw_detalle4.retrieve(ll_cod_parque)=0 then
	idw_detalle4.insertrow(0)
end if

if idw_detalle5.retrieve(ll_cod_parque)=0 then
	idw_detalle5.insertrow(0)
end if

if idw_detalle7.retrieve(0,'',ll_cod_parque)=0 then
	idw_detalle7.insertrow(0)
end if

ll_new					= tab_1.tabpage_1.dw_antecedentes.insertrow(0)
tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'sw_nuevo','N')
tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'fecha_ingreso',gdt_fec_sistema)
tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'estado_reg','0')
tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'usuario_crea',gs_user)
tab_1.tabpage_1.dw_antecedentes.accepttext()

if idw_detalle6.retrieve(ll_cod_parque)=0 then
	idw_detalle6.insertrow(0)
end if
DECLARE x1 CURSOR FOR  
SELECT		"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO", 	"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" 
FROM 		"FICHA_IMPLEMENTACION_GRUPO",  	"FICHA_IMPLEMENTACION_ITEM"  
WHERE 	  ( "FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" = "FICHA_IMPLEMENTACION_ITEM"."CODIGO_GRUPO" ) and  
			  ( ( "FICHA_IMPLEMENTACION_ITEM"."COD_PARQUE" = :ll_cod_parque ) AND  
			  ( "FICHA_IMPLEMENTACION_ITEM"."APLICA" = 'S' ) AND  
			  ( "FICHA_IMPLEMENTACION_ITEM"."ESTADO_REG" = 'V' ) )   
ORDER BY 	"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" ASC,   
				"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" ASC  
USING	sqlca;
open x1;
if sqlca.sqlcode=0 then
	do while sqlca.sqlcode=0
		fetch x1 into :ls_cod_grupo, :ls_cod_item;
		if not isnull(ls_cod_grupo) and not isnull(ls_cod_item) then
			ll_new_detalle		= tab_1.tabpage_2.dw_inspeccion.insertrow(0)
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'codigo_grupo',ls_cod_grupo)
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'codigo_item',ls_cod_item)
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'usuario_modifica',gs_user)
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'fecha_modifica',gdt_fec_sistema)
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'sw_nuevo','S')
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'folio',0)
		end if
		Setnull(ls_cod_grupo); Setnull(ls_cod_item)
	loop
	tab_1.tabpage_2.dw_inspeccion.accepttext()
end if
close x1;
tab_1.tabpage_2.dw_inspeccion.GroupCalc()
tab_1.tabpage_2.dw_inspeccion.accepttext()

end subroutine

public subroutine wf_retrieve_dw (long al_folio);String		ls_base,ls_area,ls_tipo_fs,ls_sector,ls_sepultura,ls_serie,sw_editar= 'N',ls_estado_reg
Long		ll_cod_parque,ll_folio_fs,ll_permiso_usuario
datetime	ldt_fecha_sep
Double	ll_numero

if tab_1.tabpage_1.dw_antecedentes.retrieve(al_folio) > 0 then
	tab_1.tabpage_2.dw_inspeccion.retrieve(al_folio)
	ls_base					= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'base')
	ls_serie					= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'serie')
	ll_numero				= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'numero')
	ll_cod_parque			= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'cod_parque')
	ls_area					= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'area')
	ll_folio_fs				= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'folio_ficha_sepultacion')
	ls_tipo_fs				= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'tipo_ficha_sepultacion')
	il_folio_condolencia	= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'folio_condolencia')
	il_folio_encuesta		= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'folio_encuesta')
	ldt_fecha_sep			= tab_1.tabpage_1.dw_antecedentes.getitemdatetime(1,'fecha_ficha_sepultacion')
	ls_sector					= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'sector')
	ls_sepultura				= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'sepultura')
	ls_estado_reg			= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'estado_reg')
	
	
	tab_1.tabpage_3.dw_fallecido.retrieve(ldt_fecha_sep, ls_sector, ls_sepultura, ls_base, ls_serie, ll_numero)
	tab_1.tabpage_1.dw_antecedentes.setitem(1,'sw_nuevo','M')
	idw_detalle.retrieve(ls_base)
	idw_detalle2.retrieve(ll_cod_parque)
	idw_detalle3.retrieve(ls_area)
	idw_detalle4.retrieve(ll_cod_parque)
	idw_detalle5.retrieve(ll_cod_parque)
	idw_detalle7.retrieve(ll_folio_fs,ls_tipo_fs,ll_cod_parque)
	tab_1.SelectedTab = 1
	tab_1.tabpage_1.dw_antecedentes.setfocus()
	if ls_estado_reg = 'G' then
		SELECT 	count("SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD")
		INTO 		:ll_permiso_usuario  
		FROM 	"SOL_PERMISOS_USUARIO"  
		WHERE 	"SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user AND  
					"SOL_PERMISOS_USUARIO"."ESTADO" = 'A' AND
					"SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'FI'
		USING	sqlca;
		if ll_permiso_usuario > 0 then
			sw_editar = 'S'
		else
			sw_editar = 'N'
		end if
	else
		sw_editar = 'N'
	end if
	tab_1.tabpage_1.dw_antecedentes.setitem(1,'sw_editar',sw_editar)
end if
end subroutine

on w_mantenedor_ficha_implementacion.create
this.dw_print_blanco2=create dw_print_blanco2
this.cb_1=create cb_1
this.dw_print_blanco1=create dw_print_blanco1
this.cb_buscar=create cb_buscar
this.cb_limpiar=create cb_limpiar
this.dw_print=create dw_print
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_inactivar=create cb_inactivar
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.tab_1=create tab_1
this.gb_1=create gb_1
this.cb_nuevo=create cb_nuevo
this.Control[]={this.dw_print_blanco2,&
this.cb_1,&
this.dw_print_blanco1,&
this.cb_buscar,&
this.cb_limpiar,&
this.dw_print,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_inactivar,&
this.st_1,&
this.cb_cerrar,&
this.cb_grabar,&
this.tab_1,&
this.gb_1,&
this.cb_nuevo}
end on

on w_mantenedor_ficha_implementacion.destroy
destroy(this.dw_print_blanco2)
destroy(this.cb_1)
destroy(this.dw_print_blanco1)
destroy(this.cb_buscar)
destroy(this.cb_limpiar)
destroy(this.dw_print)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_inactivar)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.tab_1)
destroy(this.gb_1)
destroy(this.cb_nuevo)
end on

event open;Long		ll_new,ll_cod_parque,ll_new_detalle
String		ls_cod_grupo, ls_cod_item

gf_centrar(w_mantenedor_ficha_implementacion)
is_implementacion			= substr(1,1,Message.StringParm)
il_folio_implementacion	= Long(substr(1,2,Message.StringParm))

//if gs_depto = 'I' then
//	cb_inactivar.visible		= TRUE
//end if

SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;

tab_1.tabpage_1.dw_antecedentes.settransobject(sqlca)
tab_1.tabpage_2.dw_inspeccion.settransobject(sqlca)
tab_1.tabpage_3.dw_fallecido.settransobject(sqlca)
dw_print_blanco1.settransobject(sqlca)
dw_print_blanco2.settransobject(sqlca)
dw_print.settransobject(sqlca)
Setnull(il_folio_encuesta);Setnull(il_folio_condolencia)
tab_1.tabpage_1.dw_antecedentes.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('O')=0 then
	idw_detalle.insertrow(0)
end if

tab_1.tabpage_1.dw_antecedentes.getchild('area',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if gs_conexion = "Parque El Prado" then
	ll_cod_parque		= 1
else
	ll_cod_parque		= 11
end if
if idw_detalle2.retrieve(ll_cod_parque)=0 then
	idw_detalle2.insertrow(0)
end if

tab_1.tabpage_1.dw_antecedentes.getchild('sector',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve('')=0 then
	idw_detalle3.insertrow(0)
end if

tab_1.tabpage_1.dw_antecedentes.getchild('cod_asistente_1',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve(ll_cod_parque)=0 then
	idw_detalle4.insertrow(0)
end if

tab_1.tabpage_1.dw_antecedentes.getchild('cod_asistente_2',idw_detalle5)
idw_detalle5.settransobject(sqlca)
if idw_detalle5.retrieve(ll_cod_parque)=0 then
	idw_detalle5.insertrow(0)
end if

tab_1.tabpage_1.dw_antecedentes.getchild('fecha_ficha_sepultacion',idw_detalle7)
idw_detalle7.settransobject(sqlca)
if idw_detalle7.retrieve(0,'',ll_cod_parque)=0 then
	idw_detalle7.insertrow(0)
end if

ll_new		= tab_1.tabpage_1.dw_antecedentes.insertrow(0)
tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'sw_nuevo','N')
tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'fecha_ingreso',gdt_fec_sistema)
tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'estado_reg','0')
tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'sw_nuevo','N')
tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'usuario_crea',gs_user)
tab_1.tabpage_1.dw_antecedentes.accepttext()

tab_1.tabpage_2.dw_inspeccion.getchild('codigo_item_1',idw_detalle6)
idw_detalle6.settransobject(sqlca)
if idw_detalle6.retrieve(ll_cod_parque)=0 then
	idw_detalle6.insertrow(0)
end if
DECLARE x1 CURSOR FOR  
SELECT		"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO", 	"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" 
FROM 		"FICHA_IMPLEMENTACION_GRUPO",  	"FICHA_IMPLEMENTACION_ITEM"  
WHERE 	  ( "FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" = "FICHA_IMPLEMENTACION_ITEM"."CODIGO_GRUPO" ) and  
			  ( ( "FICHA_IMPLEMENTACION_ITEM"."COD_PARQUE" = :ll_cod_parque ) AND  
			  ( "FICHA_IMPLEMENTACION_ITEM"."APLICA" = 'S' ) AND  
			  ( "FICHA_IMPLEMENTACION_ITEM"."ESTADO_REG" = 'V' ) )   
ORDER BY 	"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" ASC,   
				"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" ASC  
USING	sqlca;
open x1;
if sqlca.sqlcode=0 then
	do while sqlca.sqlcode=0
		fetch x1 into :ls_cod_grupo, :ls_cod_item;
		if not isnull(ls_cod_grupo) and not isnull(ls_cod_item) then
			ll_new_detalle		= tab_1.tabpage_2.dw_inspeccion.insertrow(0)
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'codigo_grupo',ls_cod_grupo)
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'codigo_item',ls_cod_item)
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'usuario_modifica',gs_user)
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'fecha_modifica',gdt_fec_sistema)
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'sw_nuevo','N')
			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'folio',0)
		end if
		Setnull(ls_cod_grupo); Setnull(ls_cod_item)
	loop
	tab_1.tabpage_2.dw_inspeccion.accepttext()
end if
close x1;
tab_1.tabpage_2.dw_inspeccion.GroupCalc()
tab_1.tabpage_2.dw_inspeccion.accepttext()
if il_folio_implementacion=0 then
	tab_1.tabpage_1.dw_antecedentes.setitem(1,'sw_nuevo','N')
	tab_1.tabpage_1.dw_antecedentes.setfocus()
	tab_1.tabpage_1.dw_antecedentes.setcolumn('folio')
else
	if is_implementacion = 'N' then //Crear Nueva FI
		wf_retrieve_dw(il_folio_implementacion)
		tab_1.tabpage_1.dw_antecedentes.setitem(1,'sw_nuevo','N')
	elseif is_implementacion = 'M' then //Modificar FI
		wf_retrieve_dw(il_folio_implementacion)
		tab_1.tabpage_1.dw_antecedentes.setitem(1,'sw_nuevo','M')
	end if
end if
end event

type dw_print_blanco2 from datawindow within w_mantenedor_ficha_implementacion
boolean visible = false
integer x = 2482
integer y = 1856
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_print_fi_blanco_p2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_mantenedor_ficha_implementacion
integer x = 1595
integer y = 1724
integer width = 457
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir FI Blanco"
end type

event clicked;//dw_print_blanco1.object.datawindow.zoom        = 80
f_Print( dw_print_blanco1 )
dw_print_blanco2.print()
//dw_print_blanco1.object.datawindow.zoom        = 100

end event

type dw_print_blanco1 from datawindow within w_mantenedor_ficha_implementacion
boolean visible = false
integer x = 1733
integer y = 1852
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_print_fi_blanco_p1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_buscar from commandbutton within w_mantenedor_ficha_implementacion
integer x = 27
integer y = 1708
integer width = 320
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;if isvalid(w_lista_ficha_implementacion) then close(w_lista_ficha_implementacion)
open(w_lista_ficha_implementacion)
end event

type cb_limpiar from commandbutton within w_mantenedor_ficha_implementacion
integer x = 1070
integer y = 1708
integer width = 320
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpíar"
end type

event clicked;wf_nuevo_registro()
tab_1.tabpage_1.dw_antecedentes.setfocus()
tab_1.tabpage_1.dw_antecedentes.setcolumn('folio')
//Long		ll_cod_parque,ll_new,ll_new_detalle
//String		ls_cod_grupo,ls_cod_item
//
//
//tab_1.tabpage_1.dw_antecedentes.reset()
//tab_1.tabpage_2.dw_inspeccion.reset()
//Setnull(il_folio_encuesta);Setnull(il_folio_condolencia)
//if gs_conexion = "Parque El Prado" then
//	ll_cod_parque		= 1
//else
//	ll_cod_parque		= 11
//end if
//if idw_detalle2.retrieve(ll_cod_parque)=0 then
//	idw_detalle2.insertrow(0)
//end if
//
//if idw_detalle3.retrieve('')=0 then
//	idw_detalle3.insertrow(0)
//end if
//
//if idw_detalle4.retrieve(ll_cod_parque)=0 then
//	idw_detalle4.insertrow(0)
//end if
//
//if idw_detalle5.retrieve(ll_cod_parque)=0 then
//	idw_detalle5.insertrow(0)
//end if
//
//if idw_detalle7.retrieve(0,'',ll_cod_parque)=0 then
//	idw_detalle7.insertrow(0)
//end if
//
//ll_new							= tab_1.tabpage_1.dw_antecedentes.insertrow(0)
//tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'sw_nuevo','N')
//tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'fecha_ingreso',gdt_fec_sistema)
//tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'estado_reg','0')
//tab_1.tabpage_1.dw_antecedentes.setitem(ll_new,'usuario_crea',gs_user)
//tab_1.tabpage_1.dw_antecedentes.accepttext()
//
//if idw_detalle6.retrieve(ll_cod_parque)=0 then
//	idw_detalle6.insertrow(0)
//end if
//DECLARE x1 CURSOR FOR  
//SELECT		"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO", 	"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" 
//FROM 		"FICHA_IMPLEMENTACION_GRUPO",  	"FICHA_IMPLEMENTACION_ITEM"  
//WHERE 	  ( "FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" = "FICHA_IMPLEMENTACION_ITEM"."CODIGO_GRUPO" ) and  
//			  ( ( "FICHA_IMPLEMENTACION_ITEM"."COD_PARQUE" = :ll_cod_parque ) AND  
//			  ( "FICHA_IMPLEMENTACION_ITEM"."APLICA" = 'S' ) AND  
//			  ( "FICHA_IMPLEMENTACION_ITEM"."ESTADO_REG" = 'V' ) )   
//ORDER BY 	"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" ASC,   
//				"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" ASC  
//USING	sqlca;
//open x1;
//if sqlca.sqlcode=0 then
//	do while sqlca.sqlcode=0
//		fetch x1 into :ls_cod_grupo, :ls_cod_item;
//		if not isnull(ls_cod_grupo) and not isnull(ls_cod_item) then
//			ll_new_detalle		= tab_1.tabpage_2.dw_inspeccion.insertrow(0)
//			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'codigo_grupo',ls_cod_grupo)
//			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'codigo_item',ls_cod_item)
//			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'usuario_modifica',gs_user)
//			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'fecha_modifica',gdt_fec_sistema)
//			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'sw_nuevo','N')
//			tab_1.tabpage_2.dw_inspeccion.setitem(ll_new_detalle,'folio',0)
//		end if
//		Setnull(ls_cod_grupo); Setnull(ls_cod_item)
//	loop
//	tab_1.tabpage_2.dw_inspeccion.accepttext()
//end if
//close x1;
//tab_1.tabpage_2.dw_inspeccion.GroupCalc()
//tab_1.tabpage_2.dw_inspeccion.accepttext()
end event

type dw_print from datawindow within w_mantenedor_ficha_implementacion
boolean visible = false
integer x = 914
integer y = 1840
integer width = 690
integer height = 352
string title = "none"
string dataobject = "dw_imprimir_ficha_implementacion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_mantenedor_ficha_implementacion
integer x = 2519
integer y = 1716
integer width = 251
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Long		ll_folio,ll_indi,ll_tot_reg
String		ls_nom_ima

ll_folio													= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'folio')
if ll_folio > 0 then
	ll_tot_reg											= dw_print.retrieve(ll_folio)
	if ll_tot_reg > 0 then
		dw_print.object.datawindow.zoom        = 75
		f_Print( dw_print )
		dw_print.object.datawindow.zoom        = 100
	else
		messagebox("Advertencia","No registra Dato")
	end if
end if
end event

type cb_exportar from commandbutton within w_mantenedor_ficha_implementacion
integer x = 2240
integer y = 1716
integer width = 251
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;Long		ll_folio

datawindow dw_paso
ll_folio		= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'folio')
if dw_print.retrieve(ll_folio) > 0 then
	dw_paso	= dw_print
	if dw_print.rowcount() > 0 then f_DWToExcel( dw_paso )
else
	messagebox("Advertencia","No Registra Dato")
end if
end event

type cb_inactivar from commandbutton within w_mantenedor_ficha_implementacion
boolean visible = false
integer x = 722
integer y = 1708
integer width = 320
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Inactivar"
end type

event clicked;Long		ll_folio

ll_folio		= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'folio')
if ll_folio > 0 then
	tab_1.tabpage_1.dw_antecedentes.setitem(1,'estado_reg','I')
	tab_1.tabpage_1.dw_antecedentes.accepttext()
	messagebox("Inactivar","Ficha Implementación INACTIVA, Recuerde Grabar los Cambios")
end if
end event

type st_1 from statictext within w_mantenedor_ficha_implementacion
integer x = 46
integer y = 28
integer width = 3255
integer height = 108
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ficha Implementación"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_mantenedor_ficha_implementacion
integer x = 2953
integer y = 1708
integer width = 320
integer height = 112
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_mantenedor_ficha_implementacion)
end event

type cb_grabar from commandbutton within w_mantenedor_ficha_implementacion
integer x = 375
integer y = 1708
integer width = 320
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Long		ll_tot_reg, ll_indi, ll_resp, ll_cod_gestion, ll_folio, ll_cod_parque,ll_folio_ficha_sepultacion,ll_folio_condolencia,ll_folio_encuesta,ll_hora_inspec,ll_minutos_inspec,ll_permiso_usuario
Long		ll_sum_falta=0,ll_suma_ok=0
String		ls_hora,ls_tipo_ficha_sepultacion,ls_codigo_maestro,ls_estado_reg,ls_base,ls_serie,ls_area,ls_sector,ls_sepultura,ls_nombre_fallecido,ls_ap_paterno_fallecido,&
			ls_cod_asistente_1,ls_cod_asistente_2,ls_valida_fs,ls_hora_ins,sw_editar= 'N'
Double	ll_rut_titular,ll_numero,ll_rut_fallecido
Datetime	ldt_fecha_ficha_sepultacion,ldt_fecha_inspeccion,ldt_fecha_sep_aux

tab_1.tabpage_1.dw_antecedentes.accepttext()
tab_1.tabpage_2.dw_inspeccion.accepttext()
ll_cod_parque					= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'cod_parque')
ls_tipo_ficha_sepultacion		= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'tipo_ficha_sepultacion')
ll_folio_ficha_sepultacion		= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'folio_ficha_sepultacion')
ldt_fecha_ficha_sepultacion	= tab_1.tabpage_1.dw_antecedentes.getitemdatetime(1,'fecha_ficha_sepultacion')
if not isnull(ll_cod_parque) and not isnull(ls_tipo_ficha_sepultacion) and not isnull(ll_folio_ficha_sepultacion) and not isnull(ldt_fecha_ficha_sepultacion) then
	ls_valida_fs					= 'S'
	if ls_tipo_ficha_sepultacion = 'FS' then
		SELECT DISTINCT "FICHA_SEPULTACION"."FECHA_SEPULTACION"
		INTO					:ldt_fecha_sep_aux
		FROM 		"FICHA_SEPULTACION"  
		WHERE 	  ( "FICHA_SEPULTACION"."CORRELATIVO_FICHA" = :ll_folio_ficha_sepultacion ) AND ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha_ficha_sepultacion )  AND ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )
		GROUP BY 	"FICHA_SEPULTACION"."BASE",   
						"FICHA_SEPULTACION"."SERIE",   
						"FICHA_SEPULTACION"."NUMERO",   
						"FICHA_SEPULTACION"."FECHA_SEPULTACION",
						"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",   
						"FICHA_SEPULTACION"."AP_PATERNO_FALL",   
						"FICHA_SEPULTACION"."AP_MATERNO_FALL" ,
						"FICHA_SEPULTACION"."RUT_FALLECIDO" 
		ORDER BY 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" ASC 
		USING	sqlca;
		if sqlca.sqlcode<>0 then
			ls_valida_fs				= 'N'
			messagebox("Advertenia","No Existe Ficha Sepultación")
		end if
	elseif ls_tipo_ficha_sepultacion = 'FT' then
		SELECT 	"FICHA_TRASLADO"."FECHA_TRASLADO"
		INTO		:ldt_fecha_sep_aux
		FROM 	"FICHA_TRASLADO"  
		WHERE ( "FICHA_TRASLADO"."CORRELATIVO_FICHA" = :ll_folio_ficha_sepultacion ) AND  
				  ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fecha_ficha_sepultacion ) AND  
				  ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque ) AND  
				  ( "FICHA_TRASLADO"."TIPO_TRASLADO" = 'E' ) AND  
				  ( "FICHA_TRASLADO"."DESTINO_PARQUE" = 'E' ) AND  
				  ( "FICHA_TRASLADO"."SW_CONDOLENCIA" = 0 )   
		GROUP BY 	"FICHA_TRASLADO"."BASE_DESTINO",   
						"FICHA_TRASLADO"."SERIE_DESTINO",   
						"FICHA_TRASLADO"."NUMERO_DESTINO", 
						"FICHA_TRASLADO"."FECHA_TRASLADO",	
						"FICHA_TRASLADO"."NOMBRE_FALLECIDO",    
						"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",   
						"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL",   	
						"FICHA_TRASLADO"."RUT_FALLECIDO"
		USING	sqlca;
		if sqlca.sqlcode<>0 then
			ls_valida_fs				= 'N'
			messagebox("Advertenia","No Existe Ficha de Traslado")
		end if
	end if
	if ls_valida_fs = 'S' then
		ll_folio_condolencia			= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'folio_condolencia')
		ll_folio_encuesta				= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'folio_encuesta')
		ls_codigo_maestro				= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'codigo_maestro')
		ldt_fecha_inspeccion			= tab_1.tabpage_1.dw_antecedentes.getitemdatetime(1,'fecha_inspeccion')
		ll_hora_inspec					= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'hora_inspec')
		ll_minutos_inspec				= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'minutos_inspec')
		ls_hora							= string(ll_hora_inspec,'00')+':'+string(ll_minutos_inspec,'00')
		ls_estado_reg					= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'estado_reg')
		ll_rut_titular						= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'rut_titular')
		ls_base							= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'base')
		ls_serie							= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'serie')
		ll_numero						= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'numero')
		ls_area							= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'area')
		ls_sector							= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'sector')
		ls_sepultura						= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'sepultura')
		ll_rut_fallecido					= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'rut_fallecido')
		ls_nombre_fallecido			= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'nombre_fallecido')
		ls_ap_paterno_fallecido		= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'ap_paterno_fallecido')
		ls_cod_asistente_1			= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'cod_asistente_1')
		ls_cod_asistente_2			= tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'cod_asistente_2')
		//**buscar usuarios permitidos para modificar fichas ya gestionadas
			SELECT 	count("SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD")
			INTO 		:ll_permiso_usuario  
			FROM 	"SOL_PERMISOS_USUARIO"  
			WHERE 	"SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user AND  
						"SOL_PERMISOS_USUARIO"."ESTADO" = 'A' AND
						"SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'FI'
			USING	sqlca;
		//**
		//if ls_estado_reg = 'G' then
		if ls_estado_reg = 'G' and ll_permiso_usuario = 0 then
			messagebox("Advertencia","Ficha Implementación en Estado Gestionado, NO es posible realizar Cambios")
		else
			if isnull(ll_cod_parque) then
				messagebox("Advertencia","Recuerde Ingresar Parque")
				ll_sum_falta ++
			elseif isnull(ls_tipo_ficha_sepultacion) then
				messagebox("Advertencia","Recuerde Ingresar Tipo Ficha Sepultación")
				ll_sum_falta ++
			elseif isnull(ll_folio_ficha_sepultacion) then
				messagebox("Advertencia","Recuerde Ingresar Folio Ficha Sepultación")
				ll_sum_falta ++
			elseif isnull(ldt_fecha_ficha_sepultacion) then
				messagebox("Advertencia","Recuerde Ingresar Fecha Ficha Sepultación")
				ll_sum_falta ++
			elseif isnull(ll_folio_condolencia) then
				messagebox("Advertencia","Recuerde Ingresar Folio Condolencia")
				ll_sum_falta ++
//			elseif isnull(ll_folio_encuesta) then
//				messagebox("Advertencia","Recuerde Ingresar Folio Encuesta")
//				ll_sum_falta ++
			elseif isnull(ls_codigo_maestro) then
				messagebox("Advertencia","Recuerde Ingresar Maestro Condolencia")
				ll_sum_falta ++
			elseif isnull(ldt_fecha_inspeccion) then
				messagebox("Advertencia","Recuerde Ingresar Fecha Inspección")
				ll_sum_falta ++
			elseif isnull(ll_hora_inspec) then
				messagebox("Advertencia","Recuerde Ingresar Hora Inspección")
				ll_sum_falta ++
			elseif isnull(ll_minutos_inspec) then
				messagebox("Advertencia","Recuerde Ingresar Minuto Inspección")
				ll_sum_falta ++
			elseif isnull(ls_estado_reg) then
				messagebox("Advertencia","Recuerde Ingresar Estado Registro")
				ll_sum_falta ++
			elseif isnull(ll_rut_titular) then
				messagebox("Advertencia","Recuerde Ingresar Rut Titular")
				ll_sum_falta ++
			elseif isnull(ls_base) then
				messagebox("Advertencia","Recuerde Ingresar Base")
				ll_sum_falta ++
			elseif isnull(ls_serie) then
				messagebox("Advertencia","Recuerde Ingresar Serie")
				ll_sum_falta ++
			elseif isnull(ll_numero) then
				messagebox("Advertencia","Recuerde Ingresar Número Contrato")
				ll_sum_falta ++
			elseif isnull(ls_area) then
				messagebox("Advertencia","Recuerde Ingresar Area")
				ll_sum_falta ++
			elseif isnull(ls_sector) then
				messagebox("Advertencia","Recuerde Ingresar Sector")
				ll_sum_falta ++
			elseif isnull(ls_sepultura) then
				messagebox("Advertencia","Recuerde Ingresar Sepultura")
				ll_sum_falta ++
			elseif isnull(ll_rut_fallecido) then
				messagebox("Advertencia","Recuerde Ingresar Rut Fallecido")
				ll_sum_falta ++
			elseif isnull(ls_nombre_fallecido) then
				messagebox("Advertencia","Recuerde Ingresar Nombre Fallecido")
				ll_sum_falta ++
			elseif isnull(ls_ap_paterno_fallecido) then
				messagebox("Advertencia","Recuerde Ingresar Apellido Paterno Fallecido")
				ll_sum_falta ++
//			elseif isnull(ls_cod_asistente_1) then
//				messagebox("Advertencia","Recuerde Ingresar Asistente 1")
//				ll_sum_falta ++
//			elseif isnull(ls_cod_asistente_2) then
//				messagebox("Advertencia","Recuerde Ingresar Asistente 2")
//				ll_sum_falta ++
			end if
			ll_folio	= tab_1.tabpage_1.dw_antecedentes.getitemnumber(1,'folio')
			if ll_folio > 0 then
				ll_tot_reg				= tab_1.tabpage_2.dw_inspeccion.rowcount()
				for ll_indi = 1 to ll_tot_reg
					ll_cod_gestion		= tab_1.tabpage_2.dw_inspeccion.getitemnumber(ll_indi,'codigo_gestion')
					if not isnull(ll_cod_gestion) then
						ll_suma_ok ++
					end if
				next
				ll_indi					= ll_indi - 1
				if ll_suma_ok = ll_tot_reg and ll_sum_falta = 0 then
					ls_estado_reg	= 'G'
				elseif ll_suma_ok = ll_tot_reg and ll_sum_falta > 0 then
					ls_estado_reg	= 'P'
				elseif ll_suma_ok = 0 then
					ls_estado_reg	= '0'
				elseif ll_suma_ok <> ll_tot_reg and ll_suma_ok > 0 and ll_suma_ok < ll_tot_reg then
					ls_estado_reg	= 'P'
				end if
				if tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'estado_reg') <> 'I' then
					tab_1.tabpage_1.dw_antecedentes.setitem(1,'estado_reg',ls_estado_reg)
				end if
//				ls_hora				= string(tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'hora_inspec'),'00')+':'+ string(tab_1.tabpage_1.dw_antecedentes.getitemstring(1,'minutos_inspec'),'00')
				tab_1.tabpage_1.dw_antecedentes.setitem(1,'hora_inspeccion',ls_hora)
				tab_1.tabpage_1.dw_antecedentes.accepttext()
				if tab_1.tabpage_1.dw_antecedentes.update()=1 then
					commit;
					if tab_1.tabpage_2.dw_inspeccion.update()=1 then
						commit;
						ll_resp		= messagebox("Grabar","Grabación Exitosa, desea Limpiar Pantalla",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							cb_limpiar.triggerevent(clicked!)
						end if
						if isvalid(w_lista_ugn_maestro_condo_2) or isvalid(w_lista_ugn_maestro_condo_grupo) then close(w_mantenedor_ficha_implementacion)
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar Inspección SQL: "+sqlca.sqlerrtext)
					end if
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Antecedentes SQL: "+sqlca.sqlerrtext)
				end if
			end if
		end if
	end if
end if
end event

type tab_1 from tab within w_mantenedor_ficha_implementacion
integer x = 32
integer y = 152
integer width = 3282
integer height = 1516
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event selectionchanged;CHOOSE CASE tab_1.SelectedTab
	CASE 1 
		tab_1.tabpage_1.dw_antecedentes.setfocus()
		tab_1.tabpage_1.dw_antecedentes.setcolumn('folio')
		
	CASE 2 
		tab_1.tabpage_2.dw_inspeccion.setfocus()
END CHOOSE
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 3246
integer height = 1392
long backcolor = 67108864
string text = "Antecedentes"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_antecedentes dw_antecedentes
end type

on tabpage_1.create
this.dw_antecedentes=create dw_antecedentes
this.Control[]={this.dw_antecedentes}
end on

on tabpage_1.destroy
destroy(this.dw_antecedentes)
end on

type dw_antecedentes from datawindow within tabpage_1
integer x = 23
integer y = 40
integer width = 3182
integer height = 1312
integer taborder = 10
string title = "none"
string dataobject = "dw_implementacion_antecedentes"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_tipo_sepult,ls_base,	ls_serie,ls_fecha,ls_area,ls_tipo_fs,ls_sector,ls_sepultura,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_base_ret,ls_serie_ret,ls_area_ret,&
			ls_sector_ret,ls_sepultura_ret,ls_nom_fall_ret,ls_ap_pat_fall_ret,ls_ap_mat_fall_ret,ls_cod_1,ls_cod_2,ls_nulo,ls_usuario,ls_user_maestro
Long		ll_folio,ll_count,ll_resp,ll_ficha_sepult,ll_sw_condolencia,ll_cod_parque,ll_folio_fs,ll_rut_titular,ll_rut_fallecido,ll_rut_titular_ret,ll_numero_ret,ll_cod_parque_ret,&
			ll_rut_fallecido_ret,ll_grupo,ll_folio_condolencia,ll_nulo,ll_res,ll_folio_encuesta,ll_hora,ll_minuto
Datetime	ldt_fecha_sepult,ldt_fecha_sep_aux
Double	ll_numero

Setnull(ls_nulo);Setnull(ll_nulo)
Setnull(il_cod_asistente)
this.accepttext()
ls_columna			= dwo.name
choose case ls_columna
	case 'p_6'
		if dw_antecedentes.getitemstring(1,'estado_reg') <> 'G' and dw_antecedentes.getitemstring(1,'estado_reg') <> 'I' then
			ls_fecha					= string(date(dw_antecedentes.getitemdatetime(1,'fecha_inspeccion')))
			if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_antecedentes.setitem(1,'fecha_inspeccion',datetime(string(date(gdt_fec_sistema),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_antecedentes.setitem(1,'fecha_inspeccion',date(ls_fecha))
			END IF
			dw_antecedentes.setfocus()
			dw_antecedentes.setcolumn('fecha_inspeccion')
		end if
		
	case 'folio'
			ll_folio	= dw_antecedentes.getitemnumber(1,'folio')
			if ll_folio > 0 then
				SELECT  "FICHA_IMPLEMENTACION"."CODIGO_MAESTRO",  	count("FICHA_IMPLEMENTACION"."CODIGO_MAESTRO")
				INTO 		:ls_user_maestro,												:ll_count 
				FROM 	"FICHA_IMPLEMENTACION"  
				WHERE 	"FICHA_IMPLEMENTACION"."FOLIO" = :ll_folio
				GROUP BY "FICHA_IMPLEMENTACION"."CODIGO_MAESTRO"  
				USING	sqlca;
				if ll_count = 0 then
					messagebox("Advertencia","No Existe Ficha de Implementación N° "+string(ll_folio,'###,###,###,###,###'))
					cb_limpiar.triggerevent(clicked!)
					dw_antecedentes.setfocus()
				else
					if gs_depto='X' and ls_user_maestro = gs_user then
						wf_retrieve_dw(ll_folio)
					elseif gs_depto='X' and ls_user_maestro <> gs_user then
						messagebox("Advertencia","Existe Ficha de Implementación N° "+string(ll_folio,'###,###,###,###,###')+ " Corresponde Maestro Condolencia "+ls_user_maestro)
						cb_limpiar.triggerevent(clicked!)
						dw_antecedentes.setfocus()
					else
						wf_retrieve_dw(ll_folio)
					end if
				end if
			end if
	case 'tipo_ficha_sepultacion', 'folio_ficha_sepultacion', 'fecha_ficha_sepultacion','cod_parque'
		ls_tipo_sepult			= dw_antecedentes.getitemstring(1,'tipo_ficha_sepultacion')
		ll_ficha_sepult			= dw_antecedentes.getitemnumber(1,'folio_ficha_sepultacion')
		ldt_fecha_sepult		= dw_antecedentes.getitemdatetime(1,'fecha_ficha_sepultacion')
		ll_cod_parque			= dw_antecedentes.getitemnumber(1,'cod_parque')
		idw_detalle7.retrieve(ll_ficha_sepult,ls_tipo_sepult,ll_cod_parque)
		if ls_tipo_sepult = 'FS' then
			SELECT DISTINCT "FICHA_SEPULTACION"."BASE", 	"FICHA_SEPULTACION"."SERIE", 	"FICHA_SEPULTACION"."NUMERO", 	"FICHA_SEPULTACION"."FECHA_SEPULTACION", 	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",   "FICHA_SEPULTACION"."AP_PATERNO_FALL",   "FICHA_SEPULTACION"."AP_MATERNO_FALL",   "FICHA_SEPULTACION"."RUT_FALLECIDO",	COUNT("FICHA_SEPULTACION"."SW_CONDOLENCIA") AS COUNT  
			INTO					:ls_base,									:ls_serie,									:ll_numero,									:ldt_fecha_sep_aux,										:ls_nom_fall,												:ls_ap_pat_fall,											:ls_ap_mat_fall,										:ll_rut_fallecido,									:ll_sw_condolencia
			FROM 		"FICHA_SEPULTACION"  
			WHERE 	  ( "FICHA_SEPULTACION"."CORRELATIVO_FICHA" = :ll_ficha_sepult ) AND ( "FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha_sepult )  AND ( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque )
			GROUP BY 	"FICHA_SEPULTACION"."BASE",   
							"FICHA_SEPULTACION"."SERIE",   
							"FICHA_SEPULTACION"."NUMERO",   
							"FICHA_SEPULTACION"."FECHA_SEPULTACION",
							"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",   
							"FICHA_SEPULTACION"."AP_PATERNO_FALL",   
							"FICHA_SEPULTACION"."AP_MATERNO_FALL" ,
							"FICHA_SEPULTACION"."RUT_FALLECIDO" 
			ORDER BY 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" ASC 
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if ll_sw_condolencia <> 0 then
					messagebox("Advertenia","Ficha NO Registra Uso de Condolencia")
				end if
			else
				messagebox("Advertenia","No Existe Ficha Sepultación")
			end if
		elseif ls_tipo_sepult = 'FT' then
			SELECT 	"FICHA_TRASLADO"."BASE_DESTINO",   "FICHA_TRASLADO"."SERIE_DESTINO",   "FICHA_TRASLADO"."NUMERO_DESTINO", "FICHA_TRASLADO"."FECHA_TRASLADO",	"FICHA_TRASLADO"."NOMBRE_FALLECIDO",    "FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",    	"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL",   	"FICHA_TRASLADO"."RUT_FALLECIDO",		Count("FICHA_TRASLADO"."SW_CONDOLENCIA")
			INTO		:ls_base,											:ls_serie,											:ll_numero,											:ldt_fecha_sep_aux,								:ls_nom_fall,											:ls_ap_pat_fall,													:ls_ap_mat_fall,												:ll_rut_fallecido,									:ll_sw_condolencia
			FROM 	"FICHA_TRASLADO"  
			WHERE ( "FICHA_TRASLADO"."CORRELATIVO_FICHA" = :ll_folio ) AND  
					  ( "FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fecha_sepult ) AND  
					  ( "FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque ) AND  
					  ( "FICHA_TRASLADO"."TIPO_TRASLADO" = 'E' ) AND  
					  ( "FICHA_TRASLADO"."DESTINO_PARQUE" = 'E' ) AND  
					  ( "FICHA_TRASLADO"."SW_CONDOLENCIA" = 0 )   
			GROUP BY 	"FICHA_TRASLADO"."BASE_DESTINO",   
							"FICHA_TRASLADO"."SERIE_DESTINO",   
							"FICHA_TRASLADO"."NUMERO_DESTINO", 
							"FICHA_TRASLADO"."FECHA_TRASLADO",	
							"FICHA_TRASLADO"."NOMBRE_FALLECIDO",    
							"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",   
							"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL",   	
							"FICHA_TRASLADO"."RUT_FALLECIDO"
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if ll_sw_condolencia <> 0 then
					messagebox("Advertenia","Ficha NO Registra Uso de Condolencia")
				end if
			else
				messagebox("Advertenia","No Existe Ficha de Traslado")
			end if
		end if
		if ls_base='O' then
			SELECT 	"PAGO_OFERTA"."AREA",  	"PAGO_OFERTA"."SECTOR",  	"PAGO_OFERTA"."SEPULTURA"  
			INTO 		:ls_area,   						:ls_sector,   						:ls_sepultura
			FROM 	"OFERTA_V",  	"CADENA",  	"PAGO_OFERTA"  
			WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
						( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
						( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						( ( "CADENA"."CODIGO" = :ls_base ) AND  
						( "CADENA"."SERIE" = :ls_serie ) AND  
						( "CADENA"."NUMERO" = :ll_numero ) )   ;
		elseif ls_base='C' then
			SELECT 	"CONTRATO"."ZONA",  	"CONTRATO"."SECTOR",   	"CONTRATO"."SEPULTURA"  
			INTO 		:ls_area,   					:ls_sector,   					:ls_sepultura  
			FROM 	"CADENA",   	"CONTRATO"  
			WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
						( ( "CADENA"."CODIGO" = :ls_base ) AND  
						( "CADENA"."SERIE" = :ls_serie ) AND  
						( "CADENA"."NUMERO" = :ll_numero ) )   ;
		end if
		if not isnull(ls_tipo_sepult) and ls_tipo_sepult <> 'FS' and ls_tipo_sepult <> 'FT' and not isnull(ll_ficha_sepult) and ll_ficha_sepult > 0 and not isnull(ldt_fecha_sepult) then
			ll_rut_titular_ret			= dw_antecedentes.getitemnumber(1,'rut_titular')
			ls_base_ret					= dw_antecedentes.getitemstring(1,'base')
			ls_serie_ret					= dw_antecedentes.getitemstring(1,'serie')
			ll_numero_ret				= dw_antecedentes.getitemnumber(1,'numero')
			ll_cod_parque_ret			= dw_antecedentes.getitemnumber(1,'cod_parque')
			ls_area_ret					= dw_antecedentes.getitemstring(1,'area')
			ls_sector_ret				= dw_antecedentes.getitemstring(1,'sector')
			ls_sepultura_ret			= dw_antecedentes.getitemstring(1,'sepultura')
			ll_rut_fallecido_ret			= dw_antecedentes.getitemnumber(1,'rut_fallecido')
			ls_nom_fall_ret				= dw_antecedentes.getitemstring(1,'nombre_fallecido')
			ls_ap_pat_fall_ret			= dw_antecedentes.getitemstring(1,'ap_paterno_fallecido')
			ls_ap_mat_fall_ret			= dw_antecedentes.getitemstring(1,'ap_materno_fallecido')
			if isnull(ll_rut_titular_ret) then
				dw_antecedentes.setitem(1,'rut_titular',ll_rut_titular)
			end if
			if isnull(ls_base_ret) then
				dw_antecedentes.setitem(1,'base',ls_base)
			end if
			if isnull(ls_serie_ret) then
				dw_antecedentes.setitem(1,'serie',ls_serie)
			end if
			if isnull(ll_numero_ret) then
				dw_antecedentes.setitem(1,'numero',ll_numero)
			end if
			if isnull(ll_cod_parque_ret) then
				dw_antecedentes.setitem(1,'cod_parque',ll_cod_parque)
			end if
			if isnull(ls_area_ret) then
				dw_antecedentes.setitem(1,'area',ls_area)
			end if
			if isnull(ls_sector_ret) then
				dw_antecedentes.setitem(1,'sector',ls_sector)
			end if
			if isnull(ls_sepultura_ret) then
				dw_antecedentes.setitem(1,'sepultura',ls_sepultura)
			end if
			if isnull(ll_rut_fallecido_ret) then
				dw_antecedentes.setitem(1,'rut_fallecido',ll_rut_fallecido)
			end if
			if isnull(ls_nom_fall_ret) then
				dw_antecedentes.setitem(1,'nombre_fallecido',ls_nom_fall)
			end if
			if isnull(ls_ap_pat_fall_ret) then
				dw_antecedentes.setitem(1,'ap_paterno_fallecido',ls_ap_pat_fall)
			end if
			if isnull(ls_ap_mat_fall_ret) then
				dw_antecedentes.setitem(1,'ap_materno_fallecido',ls_ap_mat_fall)
			end if
			dw_antecedentes.accepttext()
		end if
		
	case 'folio_condolencia'
		ll_folio_condolencia		= dw_antecedentes.getitemnumber(1,'folio_condolencia')
		ls_base_ret					= dw_antecedentes.getitemstring(1,'base')
		ls_serie_ret					= dw_antecedentes.getitemstring(1,'serie')
		ll_numero_ret				= dw_antecedentes.getitemnumber(1,'numero')
		ll_cod_parque_ret			= dw_antecedentes.getitemnumber(1,'cod_parque')
		ll_rut_fallecido_ret			= dw_antecedentes.getitemnumber(1,'rut_fallecido')
		if not isnull(ls_base_ret) and not isnull(ls_serie_ret) and not isnull(ll_numero_ret) and not isnull(ll_cod_parque_ret) and not isnull(ll_rut_fallecido_ret) and &
			ll_rut_fallecido_ret > 0 and ll_cod_parque_ret > 0 and ll_numero_ret > 0 then
			SELECT		"UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO"  
			INTO 			:ll_grupo  
			FROM 	   "UGN_CLIENTE_ASIGNAR_FALLE"  
			WHERE 	( "UGN_CLIENTE_ASIGNAR_FALLE"."PARQUE" = :ll_cod_parque_ret ) AND  
						( "UGN_CLIENTE_ASIGNAR_FALLE"."RUT_FALLECIDO" = :ll_rut_fallecido_ret ) AND  
						( "UGN_CLIENTE_ASIGNAR_FALLE"."BASE" = :ls_base_ret ) AND  
						( "UGN_CLIENTE_ASIGNAR_FALLE"."SERIE" = :ls_serie_ret ) AND  
						( "UGN_CLIENTE_ASIGNAR_FALLE"."NUMERO" = :ll_numero_ret )   
			USING	sqlca;
			if sqlca.sqlcode <> 0 then
				messagebox("Advertencia","No Existe Folio Condolencia Asociado")
				dw_antecedentes.setitem(1,'folio_condolencia',ll_nulo)
			else
				if ll_folio_condolencia = ll_grupo then
					//Son iguales
				elseif ll_folio_condolencia <> ll_grupo and not isnull(ll_folio_condolencia) then
					ll_res		= messagebox("Advertencia","Numero Folio Condolencia es Distinto al que estaba Registrado, desea mantener el nuevo Folio",Exclamation!,YesNo!,2)
					if ll_res = 2 then
						dw_antecedentes.setitem(1,'folio_condolencia',il_folio_condolencia)
					end if
				else
					// il_folio_condolencia es nulo
				end if
			end if
			dw_antecedentes.accepttext()
		end if
	case 'folio_encuesta'
		ll_folio_encuesta			= dw_antecedentes.getitemnumber(1,'folio_encuesta')
		ls_base_ret					= dw_antecedentes.getitemstring(1,'base')
		ls_serie_ret					= dw_antecedentes.getitemstring(1,'serie')
		ll_numero_ret				= dw_antecedentes.getitemnumber(1,'numero')
		
		if not isnull(ls_base_ret) and not isnull(ls_serie_ret) and not isnull(ll_numero_ret) and ll_numero_ret > 0 then
			SELECT 	MAX("VISTA_ENCUESTA_LISTA"."FOLIO_ENCUESTA")
			INTO 		:ll_grupo  
			FROM 	"VISTA_ENCUESTA_LISTA"  
			WHERE 	( "VISTA_ENCUESTA_LISTA"."CODIGO" = :ls_base_ret ) AND  
						( "VISTA_ENCUESTA_LISTA"."SERIE" = :ls_serie_ret ) AND  
						( "VISTA_ENCUESTA_LISTA"."NUMERO" = :ll_numero_ret )
			USING	sqlca;
			if sqlca.sqlcode <> 0 then
				messagebox("Advertencia","No Existe Folio Encuesta Asociado")
				dw_antecedentes.setitem(1,'folio_encuesta',ll_nulo)
			else
				if ll_folio_encuesta = ll_grupo then
					//Son iguales
				elseif ll_folio_encuesta <> ll_grupo and not isnull(ll_folio_encuesta) then
					ll_res		= messagebox("Advertencia","Número Folio Encuesta es Distinto al que estaba Registrado, desea mantener el nuevo Folio",Exclamation!,YesNo!,2)
					if ll_res = 2 then
						dw_antecedentes.setitem(1,'folio_encuesta',il_folio_encuesta)
					end if
				else
					// il_folio_encuesta es nulo
				end if
			end if
			dw_antecedentes.accepttext()
		end if
		
	case 'codigo_maestro'
		
	case 'cod_asistente_1'
		ls_cod_1					= dw_antecedentes.getitemstring(1,'cod_asistente_1')
		ls_cod_2					= dw_antecedentes.getitemstring(1,'cod_asistente_2')
		if ls_cod_1 = ls_cod_2 then
			messagebox("Advertencia","No es posible Ingresar el mismo Asistente 1 y 2")
			il_cod_asistente	= 1
			dw_antecedentes.setitem(1,'cod_asistente_1',ls_nulo)
		end if
	case 'cod_asistente_2'
		ls_cod_1					= dw_antecedentes.getitemstring(1,'cod_asistente_1')
		ls_cod_2					= dw_antecedentes.getitemstring(1,'cod_asistente_2')
		if ls_cod_1 = ls_cod_2 then
			messagebox("Advertencia","No es posible Ingresar el mismo Asistente 1 y 2")
			il_cod_asistente	= 2
			dw_antecedentes.setitem(1,'cod_asistente_2',ls_nulo)
		end if
	case 'hora_inspec','minutos_inspec'
		ll_hora					= dw_antecedentes.getitemnumber(1,'hora_inspec')
		ll_minuto					= dw_antecedentes.getitemnumber(1,'minutos_inspec')
		if ll_hora > 0 and (ll_minuto=0 or isnull(ll_minuto)) then
			 ll_minuto			= 0
			 dw_antecedentes.setitem(1,'minutos_inspec',ll_minuto)
		end if
		
end choose
end event

event clicked;String		ls_columna,ls_fecha

this.accepttext()
ls_columna			= dwo.name
choose case ls_columna
	case 'p_1'
		if dw_antecedentes.getitemstring(1,'estado_reg') <> 'G' and dw_antecedentes.getitemstring(1,'estado_reg') <> 'I' then
			ls_fecha					= string(date(dw_antecedentes.getitemdatetime(1,'fecha_inspeccion')))
			if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_antecedentes.setitem(1,'fecha_inspeccion',datetime(string(date(gdt_fec_sistema),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_antecedentes.setitem(1,'fecha_inspeccion',date(ls_fecha))
			END IF
			dw_antecedentes.setfocus()
			dw_antecedentes.setcolumn('fecha_inspeccion')
		end if
end choose
end event

event itemfocuschanged;String		ls_cod_1,ls_cod_2,ls_nulo
ls_cod_1					= dw_antecedentes.getitemstring(1,'cod_asistente_1')
ls_cod_2					= dw_antecedentes.getitemstring(1,'cod_asistente_2')
if il_cod_asistente = 1 then
	if ls_cod_1 = ls_cod_2 then
		dw_antecedentes.setitem(1,'cod_asistente_1',ls_nulo)
	end if
elseif il_cod_asistente = 2 then
	dw_antecedentes.setitem(1,'cod_asistente_2',ls_nulo)
end if
dw_antecedentes.accepttext()
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 3246
integer height = 1392
long backcolor = 67108864
string text = "Inspección"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_inspeccion dw_inspeccion
end type

on tabpage_2.create
this.dw_inspeccion=create dw_inspeccion
this.Control[]={this.dw_inspeccion}
end on

on tabpage_2.destroy
destroy(this.dw_inspeccion)
end on

type dw_inspeccion from datawindow within tabpage_2
integer x = 23
integer y = 40
integer width = 3195
integer height = 1316
integer taborder = 10
string title = "none"
string dataobject = "dw_tree_detalle_implementacion"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 3246
integer height = 1392
long backcolor = 67108864
string text = "Fallecidos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_fallecido dw_fallecido
end type

on tabpage_3.create
this.dw_fallecido=create dw_fallecido
this.Control[]={this.dw_fallecido}
end on

on tabpage_3.destroy
destroy(this.dw_fallecido)
end on

type dw_fallecido from datawindow within tabpage_3
integer x = 23
integer y = 40
integer width = 3195
integer height = 1316
integer taborder = 20
string title = "none"
string dataobject = "dw_implementaion_fallecidos"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_mantenedor_ficha_implementacion
integer x = 2213
integer y = 1664
integer width = 585
integer height = 172
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_nuevo from commandbutton within w_mantenedor_ficha_implementacion
boolean visible = false
integer x = 370
integer y = 1708
integer width = 320
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Nuevo"
end type

event clicked;wf_nuevo_registro()
end event

