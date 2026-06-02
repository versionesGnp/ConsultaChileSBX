forward
global type w_lista_ugn_maestro_condo_2 from window
end type
type rb_sin_condolencia from radiobutton within w_lista_ugn_maestro_condo_2
end type
type cb_borrar_grupo from commandbutton within w_lista_ugn_maestro_condo_2
end type
type cb_eliminar from commandbutton within w_lista_ugn_maestro_condo_2
end type
type cb_ctacte from commandbutton within w_lista_ugn_maestro_condo_2
end type
type st_6 from statictext within w_lista_ugn_maestro_condo_2
end type
type rb_convenio from radiobutton within w_lista_ugn_maestro_condo_2
end type
type rb_condolencia from radiobutton within w_lista_ugn_maestro_condo_2
end type
type st_5 from statictext within w_lista_ugn_maestro_condo_2
end type
type st_4 from statictext within w_lista_ugn_maestro_condo_2
end type
type cb_ordenar from commandbutton within w_lista_ugn_maestro_condo_2
end type
type cb_exportar from commandbutton within w_lista_ugn_maestro_condo_2
end type
type cb_filtrar from commandbutton within w_lista_ugn_maestro_condo_2
end type
type cb_limpiar from commandbutton within w_lista_ugn_maestro_condo_2
end type
type dw_ugn_lista_fallecidos from datawindow within w_lista_ugn_maestro_condo_2
end type
type pb_aceptar from picturebutton within w_lista_ugn_maestro_condo_2
end type
type st_1 from statictext within w_lista_ugn_maestro_condo_2
end type
type cb_grabar from commandbutton within w_lista_ugn_maestro_condo_2
end type
type cb_2 from commandbutton within w_lista_ugn_maestro_condo_2
end type
type dw_lista_ugn_mc from datawindow within w_lista_ugn_maestro_condo_2
end type
type cb_ingresar from commandbutton within w_lista_ugn_maestro_condo_2
end type
type gb_5 from groupbox within w_lista_ugn_maestro_condo_2
end type
type fec_fin_ugn_falle from editmask within w_lista_ugn_maestro_condo_2
end type
type p_2 from picture within w_lista_ugn_maestro_condo_2
end type
type st_2 from statictext within w_lista_ugn_maestro_condo_2
end type
type fec_ini_ugn_falle from editmask within w_lista_ugn_maestro_condo_2
end type
type p_1 from picture within w_lista_ugn_maestro_condo_2
end type
type gb_1 from groupbox within w_lista_ugn_maestro_condo_2
end type
type dw_parque from datawindow within w_lista_ugn_maestro_condo_2
end type
type dw_convenio from datawindow within w_lista_ugn_maestro_condo_2
end type
type gb_3 from groupbox within w_lista_ugn_maestro_condo_2
end type
type gb_2 from groupbox within w_lista_ugn_maestro_condo_2
end type
end forward

global type w_lista_ugn_maestro_condo_2 from window
integer width = 3461
integer height = 2772
boolean titlebar = true
string title = "Asignación  Prospectos "
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
rb_sin_condolencia rb_sin_condolencia
cb_borrar_grupo cb_borrar_grupo
cb_eliminar cb_eliminar
cb_ctacte cb_ctacte
st_6 st_6
rb_convenio rb_convenio
rb_condolencia rb_condolencia
st_5 st_5
st_4 st_4
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_limpiar cb_limpiar
dw_ugn_lista_fallecidos dw_ugn_lista_fallecidos
pb_aceptar pb_aceptar
st_1 st_1
cb_grabar cb_grabar
cb_2 cb_2
dw_lista_ugn_mc dw_lista_ugn_mc
cb_ingresar cb_ingresar
gb_5 gb_5
fec_fin_ugn_falle fec_fin_ugn_falle
p_2 p_2
st_2 st_2
fec_ini_ugn_falle fec_ini_ugn_falle
p_1 p_1
gb_1 gb_1
dw_parque dw_parque
dw_convenio dw_convenio
gb_3 gb_3
gb_2 gb_2
end type
global w_lista_ugn_maestro_condo_2 w_lista_ugn_maestro_condo_2

type variables
long		il_row,il_grupo,il_modif
String		is_modif
end variables

forward prototypes
public function long wf_grabar_ficha_implementacion (long al_grupo, long al_parque, string as_base, string as_serie, long al_numero, long al_rut_f, string as_nombre_f, string as_a_pat_f, string as_a_mat_f, datetime adt_fec_ingr, datetime adt_fec_sepul, string as_tipo_ficha, long al_folio_ficha, string as_codigo_maestro)
end prototypes

public function long wf_grabar_ficha_implementacion (long al_grupo, long al_parque, string as_base, string as_serie, long al_numero, long al_rut_f, string as_nombre_f, string as_a_pat_f, string as_a_mat_f, datetime adt_fec_ingr, datetime adt_fec_sepul, string as_tipo_ficha, long al_folio_ficha, string as_codigo_maestro);String			ls_area,ls_sector,ls_sepultura ,ls_cod_grupo,ls_cod_item
Long			ll_rut_titular,ll_max,ll_count_det,ll_fila,ll_cod_parque

dw_lista_ugn_mc.accepttext()
if as_base='O' then
	SELECT 	"OFERTA_V"."RUT", 	"PAGO_OFERTA"."AREA", 	"PAGO_OFERTA"."SECTOR", 	"PAGO_OFERTA"."SEPULTURA"  
	INTO 		:ll_rut_titular,   		:ls_area,   						:ls_sector,   						:ls_sepultura  
	FROM 	"OFERTA_V",   	"PAGO_OFERTA",   	"CADENA"  
	WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
			  ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			  ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
			  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
			  ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
			  ( ( "CADENA"."CODIGO" = :as_base ) AND  
			  ( "CADENA"."SERIE" = :as_serie ) AND  
			  ( "CADENA"."NUMERO" = :al_numero ) )   ;
elseif as_base='C' then
	SELECT	"CADENA"."RUT",		"CONTRATO"."ZONA", 	"CONTRATO"."SECTOR", 	"CONTRATO"."SEPULTURA"  
	INTO 		:ll_rut_titular,   		:ls_area,   					:ls_sector,   					:ls_sepultura  
	FROM 	"CADENA",   "CONTRATO"  
	WHERE ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
			  ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
			  ( ( "CADENA"."CODIGO" = :as_base ) AND  
			  ( "CADENA"."SERIE" = :as_serie ) AND  
			  ( "CADENA"."NUMERO" = :al_numero ) )   ;
end if
if isnull(ls_sector) or ls_sector='' then
	ll_fila				= dw_ugn_lista_fallecidos.getrow()
	ls_sector			= dw_ugn_lista_fallecidos.getitemstring(ll_fila,'sector')
	ls_sepultura		= dw_ugn_lista_fallecidos.getitemstring(ll_fila,'sepultura')
	ll_cod_parque	= dw_parque.getitemnumber(1,'parque')
	
	SELECT DISTINCT "BASE_PLANI"."AREA"  
	INTO					:ls_area
	FROM 	"BASE_PLANI"  
	WHERE ( "BASE_PLANI"."SECTOR" = :ls_sector ) AND  
			  ( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque )   ;
end if
SELECT 	"FICHA_IMPLEMENTACION"."FOLIO"
INTO 		:ll_max  
FROM 	"FICHA_IMPLEMENTACION"  
WHERE ( "FICHA_IMPLEMENTACION"."TIPO_FICHA_SEPULTACION" = :as_tipo_ficha ) AND  
		  ( "FICHA_IMPLEMENTACION"."FOLIO_FICHA_SEPULTACION" = :al_folio_ficha ) AND
		  ( "FICHA_IMPLEMENTACION"."RUT_FALLECIDO" = :al_rut_f ) 
USING	sqlca;
if sqlca.sqlcode <> 0 then
	SELECT 	MAX("FICHA_IMPLEMENTACION"."FOLIO")
	INTO 		:ll_max  
	FROM 	"FICHA_IMPLEMENTACION"  ;
	if isnull(ll_max) then ll_max=0
	ll_max ++

	INSERT INTO "FICHA_IMPLEMENTACION"  
					( "FOLIO",	"CODIGO_MAESTRO", 	"FECHA_INSPECCION", 	"HORA_INSPECCION",  	"COD_PARQUE", 	"AREA", 	"SECTOR", 	"SEPULTURA", 	"NOMBRE_FALLECIDO", 	"AP_PATERNO_FALLECIDO", 	"AP_MATERNO_FALLECIDO", 	"COD_ASISTENTE_1",  	"COD_ASISTENTE_2", 	"FECHA_INGRESO", 	"ESTADO_REG", 	"FECHA_SISTEMA", 	"TIPO_FICHA_SEPULTACION", 	"FOLIO_FICHA_SEPULTACION", 	"FECHA_FICHA_SEPULTACION", 	"FOLIO_CONDOLENCIA", 		"FOLIO_ENCUESTA", 	"RUT_FALLECIDO", 	"BASE",  		"SERIE", 		"NUMERO", 		"RUT_TITULAR", 	"USUARIO_CREA" )  
	VALUES 		( :ll_max, 	:as_codigo_maestro,   	null,   						null,   						:al_parque,  		:ls_area,:ls_sector, 	:ls_sepultura,   :as_nombre_f,   			:as_a_pat_f,   						:as_a_mat_f,   						null,   						null,   						:adt_fec_ingr,   		'0',   					:gdt_fec_sistema,   	:as_tipo_ficha,   					:al_folio_ficha,   						:adt_fec_sepul,   						:al_grupo,   						null,   					:al_rut_f,   				:as_base,   	:as_serie,   	:al_numero,   	:ll_rut_titular,   	:gs_user )  
	USING		sqlca;
	if sqlca.sqlcode=0 then
		commit;
		DECLARE x1 CURSOR FOR  
		SELECT		"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO", 	"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" 
		FROM 		"FICHA_IMPLEMENTACION_GRUPO",  	"FICHA_IMPLEMENTACION_ITEM"  
		WHERE 	  ( "FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" = "FICHA_IMPLEMENTACION_ITEM"."CODIGO_GRUPO" ) and  
					  ( ( "FICHA_IMPLEMENTACION_ITEM"."COD_PARQUE" = :al_parque ) AND  
					  ( "FICHA_IMPLEMENTACION_ITEM"."APLICA" = 'S' ) AND  
					  ( "FICHA_IMPLEMENTACION_ITEM"."ESTADO_REG" = 'V' ) )   
		ORDER BY 	"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" ASC,   
						"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" ASC  
		USING	Trans_1;
		open x1;
		if Trans_1.sqlcode=0 then
			do while Trans_1.sqlcode=0
				fetch x1 into :ls_cod_grupo, :ls_cod_item;
				if not isnull(ls_cod_grupo) and not isnull(ls_cod_item) then
					INSERT INTO "FICHA_IMPLEMENTACION_DETALLE"  
									( "FOLIO",	"CODIGO_ITEM", 	"CODIGO_GESTION", 	"OBSERVACION", 	"FECHA_MODIFICA",	"USUARIO_MODIFICA", 	"CODIGO_GRUPO" )  
					VALUES 		( :ll_max,  	:ls_cod_item, 		null,   					null,   				:gdt_fec_sistema,   	:gs_user,   					:ls_cod_grupo )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						messagebox("Error Grabar","Error Grabar Tabla FICHA_IMPLEMENTACION_DETALLE Sql: "+sqlca.sqlerrtext)
					end if
				end if
				Setnull(ls_cod_grupo); Setnull(ls_cod_item)
			loop
		end if
		close x1;
	else
		rollback;
		messagebox("Error Grabar","Error Grabar Tabla FICHA_IMPLEMENTACION Sql: "+sqlca.sqlerrtext)
	end if
else
	SELECT 	Count("FICHA_IMPLEMENTACION_DETALLE"."FOLIO")
	INTO 		:ll_count_det  
	FROM 	"FICHA_IMPLEMENTACION",  	"FICHA_IMPLEMENTACION_DETALLE"  
	WHERE ( "FICHA_IMPLEMENTACION"."FOLIO" = "FICHA_IMPLEMENTACION_DETALLE"."FOLIO" ) and  
			  ( "FICHA_IMPLEMENTACION"."TIPO_FICHA_SEPULTACION" = :as_tipo_ficha ) AND  
			  ( "FICHA_IMPLEMENTACION"."FOLIO_FICHA_SEPULTACION" = :al_folio_ficha ) AND
			  ( "FICHA_IMPLEMENTACION"."RUT_FALLECIDO" = :al_rut_f ) ;
	if ll_count_det = 0 then
		DECLARE x2 CURSOR FOR  
		SELECT		"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO", 	"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" 
		FROM 		"FICHA_IMPLEMENTACION_GRUPO",  	"FICHA_IMPLEMENTACION_ITEM"  
		WHERE 	  ( "FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" = "FICHA_IMPLEMENTACION_ITEM"."CODIGO_GRUPO" ) and  
					  ( ( "FICHA_IMPLEMENTACION_ITEM"."COD_PARQUE" = :al_parque ) AND  
					  ( "FICHA_IMPLEMENTACION_ITEM"."APLICA" = 'S' ) AND  
					  ( "FICHA_IMPLEMENTACION_ITEM"."ESTADO_REG" = 'V' ) )   
		ORDER BY 	"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" ASC,   
						"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" ASC  
		USING	Trans_1;
		open x2;
		if Trans_1.sqlcode=0 then
			do while Trans_1.sqlcode=0
				fetch x2 into :ls_cod_grupo, :ls_cod_item;
				if not isnull(ls_cod_grupo) and not isnull(ls_cod_item) then
					INSERT INTO "FICHA_IMPLEMENTACION_DETALLE"  
									( "FOLIO",	"CODIGO_ITEM", 	"CODIGO_GESTION", 	"OBSERVACION", 	"FECHA_MODIFICA",	"USUARIO_MODIFICA", 	"CODIGO_GRUPO" )  
					VALUES 		( :ll_max,  	:ls_cod_item, 		null,   					null,   				:gdt_fec_sistema,   	:gs_user,   					:ls_cod_grupo )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						messagebox("Error Grabar","Error Grabar Tabla FICHA_IMPLEMENTACION_DETALLE Sql: "+sqlca.sqlerrtext)
					end if
				end if
				Setnull(ls_cod_grupo); Setnull(ls_cod_item)
			loop
		end if
		close x2;
	end if
end if
Return ll_max
end function

on w_lista_ugn_maestro_condo_2.create
this.rb_sin_condolencia=create rb_sin_condolencia
this.cb_borrar_grupo=create cb_borrar_grupo
this.cb_eliminar=create cb_eliminar
this.cb_ctacte=create cb_ctacte
this.st_6=create st_6
this.rb_convenio=create rb_convenio
this.rb_condolencia=create rb_condolencia
this.st_5=create st_5
this.st_4=create st_4
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_limpiar=create cb_limpiar
this.dw_ugn_lista_fallecidos=create dw_ugn_lista_fallecidos
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.cb_2=create cb_2
this.dw_lista_ugn_mc=create dw_lista_ugn_mc
this.cb_ingresar=create cb_ingresar
this.gb_5=create gb_5
this.fec_fin_ugn_falle=create fec_fin_ugn_falle
this.p_2=create p_2
this.st_2=create st_2
this.fec_ini_ugn_falle=create fec_ini_ugn_falle
this.p_1=create p_1
this.gb_1=create gb_1
this.dw_parque=create dw_parque
this.dw_convenio=create dw_convenio
this.gb_3=create gb_3
this.gb_2=create gb_2
this.Control[]={this.rb_sin_condolencia,&
this.cb_borrar_grupo,&
this.cb_eliminar,&
this.cb_ctacte,&
this.st_6,&
this.rb_convenio,&
this.rb_condolencia,&
this.st_5,&
this.st_4,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_limpiar,&
this.dw_ugn_lista_fallecidos,&
this.pb_aceptar,&
this.st_1,&
this.cb_grabar,&
this.cb_2,&
this.dw_lista_ugn_mc,&
this.cb_ingresar,&
this.gb_5,&
this.fec_fin_ugn_falle,&
this.p_2,&
this.st_2,&
this.fec_ini_ugn_falle,&
this.p_1,&
this.gb_1,&
this.dw_parque,&
this.dw_convenio,&
this.gb_3,&
this.gb_2}
end on

on w_lista_ugn_maestro_condo_2.destroy
destroy(this.rb_sin_condolencia)
destroy(this.cb_borrar_grupo)
destroy(this.cb_eliminar)
destroy(this.cb_ctacte)
destroy(this.st_6)
destroy(this.rb_convenio)
destroy(this.rb_condolencia)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_limpiar)
destroy(this.dw_ugn_lista_fallecidos)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.cb_2)
destroy(this.dw_lista_ugn_mc)
destroy(this.cb_ingresar)
destroy(this.gb_5)
destroy(this.fec_fin_ugn_falle)
destroy(this.p_2)
destroy(this.st_2)
destroy(this.fec_ini_ugn_falle)
destroy(this.p_1)
destroy(this.gb_1)
destroy(this.dw_parque)
destroy(this.dw_convenio)
destroy(this.gb_3)
destroy(this.gb_2)
end on

event open;Long		ll_new,ll_nulo

CONNECT USING Trans_1; 
Setnull(ll_nulo)
is_modif										= 'N'
il_modif										= 0
cb_ingresar.enabled						= false
gf_centrar(w_lista_ugn_maestro_condo_2)
w_lista_ugn_maestro_condo_2.title	= 'Asignación  Prospectos                   Parque: '+gs_nom_cod_parque
dw_lista_ugn_mc.settransobject(sqlca)
dw_ugn_lista_fallecidos.dataobject	= 'dw_ugn_asigna_falle'
dw_ugn_lista_fallecidos.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_convenio.settransobject(sqlca)
dw_parque.insertrow(0)

dw_lista_ugn_mc.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.reset()
idw_detalle.insertrow(0)

dw_lista_ugn_mc.getchild('comuna_comercial',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.reset()
idw_detalle2.insertrow(0)
	
dw_convenio.insertrow(0)

if gs_user = 'PTORRE' or gs_user = 'JU2' or gs_depto = 'I' then 
	cb_exportar.enabled = true	
end if

if rb_condolencia.checked=true then
	cb_ctacte.visible						= false
	st_5.text								= '  Lista Fellacidos'
	dw_convenio.reset()
	ll_new									= dw_convenio.insertrow(0)
	dw_convenio.setitem(ll_new,'codigo',0)
	dw_convenio.accepttext()
	dw_convenio.visible					= false
	gb_2.visible							= false
	dw_parque.reset()
	dw_parque.insertrow(0)
	gb_3.visible							= true
	dw_parque.visible						= true
	fec_ini_ugn_falle.enabled			= true
	fec_fin_ugn_falle.enabled			= true
	fec_ini_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
	fec_fin_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
	st_4.visible							= true
	dw_lista_ugn_mc.visible				= true
	dw_ugn_lista_fallecidos.height	= 860
	dw_ugn_lista_fallecidos.reset()
	dw_lista_ugn_mc.reset()
	dw_parque.setfocus()
elseif rb_convenio.checked=true then
	cb_ctacte.visible						= true
	dw_convenio.reset()
	st_5.text								= '  Lista Convenios UGN'
	ll_new									= dw_convenio.insertrow(0)
	dw_convenio.setitem(ll_new,'codigo',0)
	dw_convenio.accepttext()
	gb_2.visible							= true
	dw_convenio.visible					= true
	dw_parque.reset()
	dw_parque.insertrow(0)
	dw_parque.visible						= false
	gb_3.visible							= false
	fec_ini_ugn_falle.enabled			= false
	fec_fin_ugn_falle.enabled			= false
	fec_ini_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
	fec_fin_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
	st_4.visible							= false
	dw_lista_ugn_mc.visible				= false
	dw_ugn_lista_fallecidos.height	= 1964
	dw_ugn_lista_fallecidos.reset()
	dw_lista_ugn_mc.reset()
	dw_convenio.setfocus()
end if
end event

event close;DISCONNECT USING Trans_1; 
end event

type rb_sin_condolencia from radiobutton within w_lista_ugn_maestro_condo_2
integer x = 1733
integer y = 32
integer width = 768
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sin Condolencia"
end type

event clicked;Long		ll_nulo,ll_new

Setnull(ll_nulo)
if rb_sin_condolencia.checked=true then
	cb_ctacte.visible						= false
	dw_ugn_lista_fallecidos.dataobject	= 'dw_ugn_asigna_falle_sin_condo'
	dw_ugn_lista_fallecidos.settransobject(sqlca)
	st_5.text								= '  Lista Fallacidos'
	dw_convenio.reset()
	ll_new									= dw_convenio.insertrow(0)
	dw_convenio.setitem(ll_new,'codigo',0)
	dw_convenio.accepttext()
	gb_2.visible							= false
	dw_convenio.visible					= false
	dw_parque.reset()
	dw_parque.insertrow(0)
	gb_3.visible							= true
	dw_parque.visible						= true
	fec_ini_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
	fec_fin_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
	st_4.visible							= true
	dw_lista_ugn_mc.visible				= true
	dw_ugn_lista_fallecidos.height	= 860
	dw_ugn_lista_fallecidos.reset()
	dw_lista_ugn_mc.reset()
	dw_parque.setfocus()
end if
end event

type cb_borrar_grupo from commandbutton within w_lista_ugn_maestro_condo_2
integer x = 3547
integer y = 216
integer width = 325
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Borrar Grupo"
end type

event clicked;Long 	ll_grupo

//ll_fila		= dw_lista_ugn_mc.getrow()
if ll_grupo > 0 then
//	ls_nombre	= dw_lista_ugn_mc.getitemstring(ll_fila,'nombre')
//	ls_ap_pat	= dw_lista_ugn_mc.getitemstring(ll_fila,'a_paterno')
	if MessageBox("Eliminar", "Desea Eliminar Grupo Nº "+string(ll_grupo,'###,###,###,###')+" ?", Question!, YesNo! ) = 1 then			
	end if	
end if	

end event

type cb_eliminar from commandbutton within w_lista_ugn_maestro_condo_2
integer x = 1669
integer y = 2524
integer width = 238
integer height = 80
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;String		ls_nombre,ls_ap_pat,ls_ap_mat,ls_fono_p,ls_celular
Long 		ll_fila

ll_fila		= dw_lista_ugn_mc.getrow()
if ll_fila > 0 then
	ls_nombre	= dw_lista_ugn_mc.getitemstring(ll_fila,'nombre')
	ls_ap_pat	= dw_lista_ugn_mc.getitemstring(ll_fila,'a_paterno')
//	ls_ap_mat	= dw_lista_ugn_mc.getitemstring(ll_fila,'a_materno')
//	ls_fono_p	= dw_lista_ugn_mc.getitemstring(ll_fila,'fono_p')
//	ls_celular	= dw_lista_ugn_mc.getitemstring(ll_fila,'celular')
	if not isnull(ls_nombre) and not isnull(ls_ap_pat) then
		if MessageBox("Eliminar", "Desea Eliminar Fila Nº "+string(ll_fila,'###,###,###,###')+" Nombre "+ls_nombre+" "+ls_ap_pat+" ?", Question!, YesNo! ) = 1 then			
			dw_lista_ugn_mc.DeleteRow(ll_fila)
		end if	
	else
		if MessageBox("Eliminar", "Desea Eliminar Fila Nº "+string(ll_fila,'###,###,###,###'), Question!, YesNo! ) = 1 then			
				dw_lista_ugn_mc.DeleteRow(ll_fila)
		end if
	end if	
end if	
end event

type cb_ctacte from commandbutton within w_lista_ugn_maestro_condo_2
integer x = 1097
integer y = 2516
integer width = 416
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuen&ta Corriente"
end type

event clicked;string ls_base,ls_serie,param
long 	 ll_rut
Double	ll_numero
if il_row > 0 and dw_ugn_lista_fallecidos.rowcount()>0 then
	gi_rut 		= dw_ugn_lista_fallecidos.GetItemNumber(il_row, "oferta_v_rut")
	gs_base		= dw_ugn_lista_fallecidos.getitemstring(il_row, "cadena_codigo")
	gs_serie		= dw_ugn_lista_fallecidos.getitemstring(il_row, "oferta_v_serie")
	gi_numero	= dw_ugn_lista_fallecidos.getitemnumber(il_row, "oferta_v_nro_oferta")
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	END CHOOSE
	close(w_aviso_mensajes)
	
else
	messagebox('Seleción','Debe Seleccionar un contrato.',information!)
end if

end event

type st_6 from statictext within w_lista_ugn_maestro_condo_2
integer y = 48
integer width = 361
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Origen"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_convenio from radiobutton within w_lista_ugn_maestro_condo_2
integer x = 1170
integer y = 32
integer width = 457
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 33554432
long backcolor = 67108864
string text = "UGN"
end type

event clicked;Long		ll_new,ll_nulo

Setnull(ll_nulo)
if rb_convenio.checked=true then
	cb_ctacte.visible							= true
	dw_ugn_lista_fallecidos.dataobject	= 'dw_lista_convenios_ugn_ventas'
	dw_ugn_lista_fallecidos.settransobject(sqlca)
	st_5.text									= '  Lista Convenios UGN'
	dw_convenio.reset()
	ll_new										= dw_convenio.insertrow(0)
	dw_convenio.setitem(ll_new,'codigo',0)
	dw_convenio.accepttext()
	gb_2.visible								= true
	dw_convenio.visible						= true
	dw_parque.reset()
	dw_parque.insertrow(0)
	gb_3.visible								= false
	dw_parque.visible							= false
	fec_ini_ugn_falle.text					= string(gdt_fec_sistema,'dd/mm/yyyy')
	fec_fin_ugn_falle.text					= string(gdt_fec_sistema,'dd/mm/yyyy')
	st_4.visible								= false
	dw_lista_ugn_mc.visible					= false
	dw_ugn_lista_fallecidos.height		= 1964
	dw_ugn_lista_fallecidos.reset()
	dw_lista_ugn_mc.reset()
	cb_ingresar.enabled						= false
	cb_grabar.enabled							= false
	dw_convenio.setfocus()
end if
end event

type rb_condolencia from radiobutton within w_lista_ugn_maestro_condo_2
integer x = 407
integer y = 32
integer width = 599
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 33554432
long backcolor = 67108864
string text = "Condolencia"
boolean checked = true
end type

event clicked;Long		ll_nulo,ll_new

Setnull(ll_nulo)
if rb_condolencia.checked=true then
	cb_ctacte.visible						= false
	dw_ugn_lista_fallecidos.dataobject	= 'dw_ugn_asigna_falle'
	dw_ugn_lista_fallecidos.settransobject(sqlca)
	st_5.text								= '  Lista Fallecidos'
	dw_convenio.reset()
	ll_new									= dw_convenio.insertrow(0)
	dw_convenio.setitem(ll_new,'codigo',0)
	dw_convenio.accepttext()
	gb_2.visible							= false
	dw_convenio.visible					= false
	dw_parque.reset()
	dw_parque.insertrow(0)
	gb_3.visible							= true
	dw_parque.visible						= true
	fec_ini_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
	fec_fin_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
	st_4.visible							= true
	dw_lista_ugn_mc.visible				= true
	dw_ugn_lista_fallecidos.height	= 860
	dw_ugn_lista_fallecidos.reset()
	dw_lista_ugn_mc.reset()
	dw_parque.setfocus()
end if
end event

type st_5 from statictext within w_lista_ugn_maestro_condo_2
integer x = 23
integer y = 412
integer width = 3392
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "  Lista Fallecidos"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_lista_ugn_maestro_condo_2
integer x = 23
integer y = 1376
integer width = 3392
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "  Ingreso Prospectos"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_ordenar from commandbutton within w_lista_ugn_maestro_condo_2
event ue_mousemove pbm_dwnmousemove
integer x = 1957
integer y = 2524
integer width = 247
integer height = 80
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista_ugn_mc.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista_ugn_mc.SETSORT(NULO)
	dw_lista_ugn_mc.SORT()
end if
end event

type cb_exportar from commandbutton within w_lista_ugn_maestro_condo_2
event ue_mousemove pbm_mousemove
integer x = 2208
integer y = 2524
integer width = 247
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista_ugn_mc
if dw_lista_ugn_mc.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_lista_ugn_maestro_condo_2
event ue_mousemove pbm_mousemove
integer x = 2459
integer y = 2524
integer width = 247
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_nulo

setnull(ls_nulo)
dw_lista_ugn_mc.setfilter(ls_nulo)
dw_lista_ugn_mc.filter()
end event

type cb_limpiar from commandbutton within w_lista_ugn_maestro_condo_2
integer x = 2757
integer y = 2524
integer width = 238
integer height = 80
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long	ll_new

is_modif										= 'N'
if rb_condolencia.checked=true then
	if MessageBox("Advertencia", "Recuerde al Limpiar se borrará Lista Fallecidos y Prospectos... Está Seguro", Question!, YesNo! ) = 1 then
		fec_ini_ugn_falle.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
		fec_fin_ugn_falle.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
		cb_grabar.enabled					= False
		cb_ingresar.enabled				= true
		dw_ugn_lista_fallecidos.reset()
		dw_parque.reset()
		dw_parque.insertrow(0)
		dw_lista_ugn_mc.reset()
	end if	
elseif rb_convenio.checked=true then
	if MessageBox("Advertencia", "Recuerde al Limpiar se borrará Lista Fallecidos y Prospectos... Está Seguro", Question!, YesNo! ) = 1 then
	dw_convenio.reset()
	ll_new									= dw_convenio.insertrow(0)
	dw_convenio.setitem(ll_new,'codigo',0)
	dw_convenio.accepttext()
	cb_grabar.enabled						= False
	cb_ingresar.enabled					= true
	fec_ini_ugn_falle.text				= string(gdt_fec_sistema, 'dd/mm/yyyy')
	fec_fin_ugn_falle.text				= string(gdt_fec_sistema, 'dd/mm/yyyy')
	dw_ugn_lista_fallecidos.reset()
	end if
end if
end event

type dw_ugn_lista_fallecidos from datawindow within w_lista_ugn_maestro_condo_2
integer x = 23
integer y = 500
integer width = 3392
integer height = 860
integer taborder = 60
string title = "Asignar Fallecidos"
string dataobject = "dw_ugn_asigna_falle_sin_condo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;datetime	ldt_fecha_sepult
String		ls_nom,ls_ap_pat, ls_base, ls_serie
Long		ll_cod_parque,ll_grupo,ll_count_ugn_cond
Double	ll_numero

cb_ingresar.enabled		= false
if row>0 then
	il_row						= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	cb_ingresar.enabled	= true
//	if rb_condolencia.checked=true then
		is_modif				= 'N'
		ldt_fecha_sepult	= this.getitemdatetime(il_row,'fecha_sepultacion')
		ls_nom				= this.getitemstring(il_row,'nombre_fallecido')
		ls_ap_pat			= this.getitemstring(il_row,'ap_paterno_fall')
		ll_cod_parque		= this.getitemnumber(il_row,'cod_parque')
		ls_base				= this.getitemstring(il_row,'base')
		ls_serie				= this.getitemstring(il_row,'serie')
		ll_numero			= this.getitemnumber(il_row,'numero')
		SELECT DISTINCT MAX("UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO")
		INTO 		:ll_grupo  
		FROM 	"UGN_CLIENTE_ASIGNAR_FALLE"  
		WHERE  ( "UGN_CLIENTE_ASIGNAR_FALLE"."PARQUE" = :ll_cod_parque ) AND  
				 ( "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
				 ( "UGN_CLIENTE_ASIGNAR_FALLE"."NOMBRE_FALLECIDO" = :ls_nom ) AND  
				 ( "UGN_CLIENTE_ASIGNAR_FALLE"."A_PATERNO_FALLECIDO" = :ls_ap_pat ) // agregar si el estado activo es A 
		USING		sqlca;
		if ll_grupo > 0 then // agregar condicion de estado activo distinto de Inactivo  
			dw_lista_ugn_mc.retrieve(ll_grupo)
			If MessageBox("Aviso", "Ya existen Datos, desea Ingresar Registros", Question!, YesNo!,2 ) = 1 then
				cb_ingresar.enabled		= true
				is_modif						= 'S'
				il_modif ++
				il_grupo						= ll_grupo
				cb_ingresar.TriggerEvent(Clicked!)
			else
				cb_ingresar.enabled		= false
				dw_lista_ugn_mc.reset()
				dw_ugn_lista_fallecidos.setfocus()
			end if
		else
			dw_lista_ugn_mc.reset()
			SELECT 	Count("UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO")
			INTO 		:ll_count_ugn_cond  
			FROM 	"UGN_CLIENTE_ASIGNAR_FALLE"  
			WHERE ( "UGN_CLIENTE_ASIGNAR_FALLE"."BASE" = :ls_base ) AND  
					  ( "UGN_CLIENTE_ASIGNAR_FALLE"."SERIE" = :ls_serie ) AND  
					  ( "UGN_CLIENTE_ASIGNAR_FALLE"."NUMERO" = :ll_numero ) AND  
					  ( "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
					  ( "UGN_CLIENTE_ASIGNAR_FALLE"."PARQUE" = :ll_cod_parque )   ;
			if ll_count_ugn_cond > 0 then
				messagebox("Advertencia","No es posible Ingresar Condolencia, Existe(n) " +string(ll_count_ugn_cond)+ " grupo(s) registrado(s) al mismo Servicio")
				cb_ingresar.enabled	= false
			else
				cb_ingresar.enabled	= true
			end if
		end if
//	end if
end if
end event

event rowfocuschanged;datetime	ldt_fecha_sepult
String	ls_nom,ls_ap_pat
Long		ll_cod_parque,ll_grupo

if getrow() > 0 then
	il_row					= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	if rb_condolencia.checked=true then
	//	is_modif				= 'N'
		ldt_fecha_sepult	= this.getitemdatetime(il_row,'fecha_sepultacion')
		ls_nom				= this.getitemstring(il_row,'nombre_fallecido')
		ls_ap_pat			= this.getitemstring(il_row,'ap_paterno_fall')
		ll_cod_parque		= this.getitemnumber(il_row,'cod_parque')
		SELECT DISTINCT "UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO"  
		INTO 		:ll_grupo  
		FROM 		"UGN_CLIENTE_ASIGNAR_FALLE"  
		WHERE  ( "UGN_CLIENTE_ASIGNAR_FALLE"."PARQUE" = :ll_cod_parque ) AND  
				 ( "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_SEPULTACION" = :ldt_fecha_sepult ) AND  
				 ( "UGN_CLIENTE_ASIGNAR_FALLE"."NOMBRE_FALLECIDO" = :ls_nom ) AND  
				 ( "UGN_CLIENTE_ASIGNAR_FALLE"."A_PATERNO_FALLECIDO" = :ls_ap_pat )   
		USING		sqlca;
		if ll_grupo > 0 then
//			dw_lista_ugn_mc.retrieve(ll_grupo)
//			If MessageBox("Aviso", "Fallecido ya Registra Prospectos Asociados, ¿Desea Ingresar Nuevos Prospectos?", Question!, YesNo! ) = 1 then
//				dw_lista_ugn_mc.reset()
//			else
//				cb_ingresar.enabled	= false
//				cb_grabar.enabled		= false
//				is_modif					= 'S'
//			end if
		else
//			dw_lista_ugn_mc.reset()
		end if
	end if
end if
end event

type pb_aceptar from picturebutton within w_lista_ugn_maestro_condo_2
integer x = 2345
integer y = 196
integer width = 169
integer height = 168
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;datetime ldt_fec_ini,ldt_fec_fin
string ls_pago_fin,ls_pago_ini,ls_asig_ini,ls_asig_fin,ls_usuario_asig,ls_tipo_mov
long ll_indi,ll_tot_reg,ll_parque,ll_convenio

dw_ugn_lista_fallecidos.reset()
//cb_ingresar.enabled		= true
SetPointer(HourGlass!)
dw_ugn_lista_fallecidos.reset()
dw_lista_ugn_mc.reset()
ldt_fec_ini						= datetime(date(fec_ini_ugn_falle.text),time('00:00:00'))
ldt_fec_fin						= datetime(date(fec_fin_ugn_falle.text),time('23:59:59'))
if rb_condolencia.checked=true then
	dw_ugn_lista_fallecidos.dataobject	= 'dw_ugn_asigna_falle'
	dw_ugn_lista_fallecidos.settransobject(sqlca)
	ll_parque					= dw_parque.getitemnumber(1,'parque')
	if ll_parque > 0 then
		if ldt_fec_ini <= ldt_fec_fin then
			if dw_ugn_lista_fallecidos.retrieve(ldt_fec_ini,ldt_fec_fin,ll_parque)=0 then
				messagebox("Advertencia","No Registra Dato")
			else
				//dw_ugn_lista_fallecidos.setfocus()
			end if
		else
			Messagebox("Advertencia","Fecha Inicial no Puede ser Mayor a la Final")
			fec_ini_ugn_falle.setfocus()
			end if
	else
		Messagebox("Advertencia","Debe Ingresar Parque")
			dw_parque.setfocus()
	end if
elseif rb_sin_condolencia.checked=true then
	dw_ugn_lista_fallecidos.dataobject	= 'dw_ugn_asigna_falle_sin_condo'
	dw_ugn_lista_fallecidos.settransobject(sqlca)
	ll_parque					= dw_parque.getitemnumber(1,'parque')
	if ll_parque > 0 then
		if ldt_fec_ini <= ldt_fec_fin then
			if dw_ugn_lista_fallecidos.retrieve(ldt_fec_ini,ldt_fec_fin,ll_parque)=0 then
				messagebox("Advertencia","No Registra Dato")
			else
				//dw_ugn_lista_fallecidos.setfocus()
			end if
		else
			Messagebox("Advertencia","Fecha Inicial no Puede ser Mayor a la Final")
			fec_ini_ugn_falle.setfocus()
			end if
	else
		Messagebox("Advertencia","Debe Ingresar Parque")
			dw_parque.setfocus()
	end if
elseif rb_convenio.checked=true then
	dw_ugn_lista_fallecidos.dataobject	= 'dw_ugn_asigna_falle'
	dw_ugn_lista_fallecidos.settransobject(sqlca)
	ll_convenio					= dw_convenio.getitemnumber(1,'codigo')
	if not isnull(ll_convenio) then
		if dw_ugn_lista_fallecidos.retrieve(ldt_fec_ini,ldt_fec_fin,ll_convenio)=0 then
			messagebox("Advertencia","No Registra Dato")
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Convenio")
		dw_convenio.setfocus()
	end if
end if

SetPointer(Arrow!)
end event

type st_1 from statictext within w_lista_ugn_maestro_condo_2
integer x = 1120
integer y = 256
integer width = 123
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_lista_ugn_maestro_condo_2
integer x = 549
integer y = 2516
integer width = 535
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar Asignación"
end type

event clicked;long		ll_rut,ll_cod_parque,ll_indi,ll_tot_reg,ll_row,ll_val_rut,ll_est_rut,ll_rut_val,ll_folio_ficha,ll_rut_fallecido_ret,ll_count_imp,ll_grupo_ret,ll_cod_parque_ret,&
			ll_implementacion,ll_res,ll_folio_ficha_ret
string 	ls_string,ls_dv,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_base,ls_serie,ls_nombre,	ls_ap_pat,ls_ap_mat,ls_fono_p,ls_celular,ls_fono_c,ls_email,ls_tipo_v,ls_direc_p,&
			ls_num_p,ls_depto_p,ls_block_p,ls_pobla,ls_sector,ls_ciudad_p,ls_comuna_p,ls_dirr_c,ls_num_c,ls_ciudad_c,ls_comuna_c,ls_pasa,ls_dv_val,ls_tipo_ficha,ls_sector_ret,&
			ls_sepultura_ret,ls_tipo_ficha_ret,ls_nombre_fallecido_ret,ls_ap_pat_fall_ret,ls_ap_mat_fall_ret,ls_base_ret,ls_serie_ret,ls_usuario_creador_ret,ls_codigo_maestro_ret,&
			ls_sector_sep,ls_sepultura_sep
Datetime	ldt_fecha_sepult,ldt_fecha_sepultura_ret,ldt_fecha_ingreso_ret
Double	ll_numero,ll_numero_ret,ll_rut_tit_sep

ll_tot_reg			= dw_lista_ugn_mc.rowcount()
dw_lista_ugn_mc.accepttext()
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ll_est_rut				= dw_lista_ugn_mc.getitemnumber(ll_indi,'estado_rut')
		ll_rut_val				= dw_lista_ugn_mc.getitemnumber(ll_indi,'rut')
		ls_dv_val				= dw_lista_ugn_mc.getitemstring(ll_indi,'dv')
		if ll_est_rut= 0 and not isnull(ll_rut_val) and not isnull(ls_dv_val) then
			ls_nombre		= dw_lista_ugn_mc.getitemstring(ll_indi,'nombre')
			ls_ap_pat		= dw_lista_ugn_mc.getitemstring(ll_indi,'a_paterno')
			ls_ap_mat		= dw_lista_ugn_mc.getitemstring(ll_indi,'a_materno')
			ls_fono_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'fono_p')
			ls_celular		= dw_lista_ugn_mc.getitemstring(ll_indi,'celular')
			ls_fono_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'fono_c')
			ls_email			= dw_lista_ugn_mc.getitemstring(ll_indi,'email')
			ls_tipo_v			= dw_lista_ugn_mc.getitemstring(ll_indi,'tipo_via')
			ls_direc_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'direccion_p')
			ls_num_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'numero_particular')
			ls_depto_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'depto_particular')
			ls_block_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'block_particular')
			ls_pobla			= dw_lista_ugn_mc.getitemstring(ll_indi,'poblacion')
			ls_sector			= dw_lista_ugn_mc.getitemstring(ll_indi,'sector')
			ls_ciudad_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'ciudad')
			ls_comuna_p	= dw_lista_ugn_mc.getitemstring(ll_indi,'comuna')
			ls_dirr_c			= dw_lista_ugn_mc.getitemstring(ll_indi,'domicilio_c')
			ls_num_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'numero_comercial')
			ls_ciudad_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'ciudad_comercial')
			ls_comuna_c	= dw_lista_ugn_mc.getitemstring(ll_indi,'comuna_comercial')
			dw_lista_ugn_mc.setitem(ll_indi,'correlativo',ll_indi)
			if isnull(ls_fono_c) then 
				ls_fono_c	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'fono_c',ls_fono_c)
			end if
			if isnull(ls_email) then 
				ls_email		= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'email',ls_email)
			end if
			if isnull(ls_tipo_v) then 
				ls_tipo_v	= '0'
				dw_lista_ugn_mc.setitem(ll_indi,'tipo_via',ls_tipo_v)
			end if
			if isnull(ls_direc_p) then 
				ls_direc_p	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'direccion_p',ls_direc_p)
			end if
			if isnull(ls_num_p) then 
				ls_num_p		= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'numero_particular',ls_num_p)
			end if
			if isnull(ls_depto_p) then 
				ls_depto_p	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'depto_particular',ls_depto_p)
			end if
			if isnull(ls_block_p) then 
				ls_block_p	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'block_particular',ls_block_p)
			end if
			if isnull(ls_pobla) then 
				ls_pobla		= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'poblacion',ls_pobla)
			end if
			if isnull(ls_sector) then 
				ls_sector	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'sector',ls_sector)
			end if
			if isnull(ls_ciudad_p) then 
				ls_ciudad_p	= '0'
				dw_lista_ugn_mc.setitem(ll_indi,'ciudad',ls_ciudad_p)
			end if
			if isnull(ls_comuna_p) then 
				ls_comuna_p	= '0'
				dw_lista_ugn_mc.setitem(ll_indi,'ciudad',ls_comuna_p)
			end if
			if isnull(ls_dirr_c) then 
				ls_dirr_c	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'domicilio_c',ls_dirr_c)
			end if
			if isnull(ls_num_c) then 
				ls_num_c		= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'numero_comercial',ls_num_c)
			end if
			if isnull(ls_ciudad_c) then 
				ls_ciudad_c	= '0'
				dw_lista_ugn_mc.setitem(ll_indi,'ciudad_comercial',ls_ciudad_c)
			end if
			if isnull(ls_comuna_c) then 
				ls_comuna_c	= '0'
				dw_lista_ugn_mc.setitem(ll_indi,'comuna_comercial',ls_comuna_c)
			end if
			if isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('nombre')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_pat) or ls_ap_pat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('a_paterno')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_mat) or ls_ap_mat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('a_materno')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fono_p) or ls_fono_p='' then
				messagebox("Advertencia","Debe Ingresar Fono Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('fono_p')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_celular) or ls_celular='' then
				messagebox("Advertencia","Debe Ingresar Celular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('celular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fono_c) or ls_fono_c='' then
				messagebox("Advertencia","Debe Ingresar Fono Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('fono_c')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_email) or ls_email='' then
				messagebox("Advertencia","Debe Ingresar Correo Electronico en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('email')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_tipo_v) or ls_tipo_v='' then
				messagebox("Advertencia","Debe Ingresar Tipo de Via en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('tipo_via')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_direc_p) or ls_direc_p='' then
				messagebox("Advertencia","Debe Ingresar Dirección Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('direccion_p')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_num_p) or ls_num_p='' then
				messagebox("Advertencia","Debe Ingresar Número Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('numero_particular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_depto_p) or ls_depto_p='' then
				messagebox("Advertencia","Debe Ingresar Departamento Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('depto_particular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_block_p) or ls_block_p='' then
				messagebox("Advertencia","Debe Ingresar Block Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('block_particular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_pobla) or ls_pobla='' then
				messagebox("Advertencia","Debe Ingresar Población Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('poblacion')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_sector) or ls_sector='' then
				messagebox("Advertencia","Debe Ingresar Sector Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('sector')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ciudad_p) or ls_ciudad_p='' then
				messagebox("Advertencia","Debe Ingresar Ciudad Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('ciudad')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_comuna_p) or ls_comuna_p='' then
				messagebox("Advertencia","Debe Ingresar Comuna Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('comuna')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_dirr_c) or ls_dirr_c='' then
				messagebox("Advertencia","Debe Ingresar Dirección Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('domicilio_c')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_num_c) or ls_num_c='' then
				messagebox("Advertencia","Debe Ingresar Número Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('numero_comercial')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ciudad_c) or ls_ciudad_c='' then
				messagebox("Advertencia","Debe Ingresar Ciudad Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('ciudad_comercial')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_comuna_c) or ls_comuna_c='' then
				messagebox("Advertencia","Debe Ingresar Ciudad Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('comuna_comercial')
				ls_pasa		= 'N'
				exit
			else
				dw_lista_ugn_mc.accepttext()
				ls_pasa = 'S'
			end if
			
		elseif ll_est_rut= 1  and isnull(ll_rut_val) and isnull(ls_dv_val) then
			ls_nombre					= dw_lista_ugn_mc.getitemstring(ll_indi,'nombre')
			ls_ap_pat					= dw_lista_ugn_mc.getitemstring(ll_indi,'a_paterno')
			ls_ap_mat					= dw_lista_ugn_mc.getitemstring(ll_indi,'a_materno')
			ls_fono_p					= dw_lista_ugn_mc.getitemstring(ll_indi,'fono_p')
			ls_celular					= dw_lista_ugn_mc.getitemstring(ll_indi,'celular')
			ls_fono_c					= dw_lista_ugn_mc.getitemstring(ll_indi,'fono_c')
			ls_email						= dw_lista_ugn_mc.getitemstring(ll_indi,'email')
			ls_tipo_v						= dw_lista_ugn_mc.getitemstring(ll_indi,'tipo_via')
			ls_direc_p					= dw_lista_ugn_mc.getitemstring(ll_indi,'direccion_p')
			ls_num_p					= dw_lista_ugn_mc.getitemstring(ll_indi,'numero_particular')
			ls_depto_p					= dw_lista_ugn_mc.getitemstring(ll_indi,'depto_particular')
			ls_block_p					= dw_lista_ugn_mc.getitemstring(ll_indi,'block_particular')
			ls_pobla						= dw_lista_ugn_mc.getitemstring(ll_indi,'poblacion')
			ls_sector						= dw_lista_ugn_mc.getitemstring(ll_indi,'sector')
			ls_ciudad_p					= dw_lista_ugn_mc.getitemstring(ll_indi,'ciudad')
			ls_comuna_p				= dw_lista_ugn_mc.getitemstring(ll_indi,'comuna')
			ls_dirr_c						= dw_lista_ugn_mc.getitemstring(ll_indi,'domicilio_c')
			ls_num_c					= dw_lista_ugn_mc.getitemstring(ll_indi,'numero_comercial')
			ls_ciudad_c					= dw_lista_ugn_mc.getitemstring(ll_indi,'ciudad_comercial')
			ls_comuna_c				= dw_lista_ugn_mc.getitemstring(ll_indi,'comuna_comercial')
			dw_lista_ugn_mc.setitem(ll_indi,'correlativo',ll_indi)
			if isnull(ls_fono_c) then 
				ls_fono_c	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'fono_c',ls_fono_c)
			end if
			if isnull(ls_email) then 
				ls_email		= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'email',ls_email)
			end if
			if isnull(ls_tipo_v) then 
				ls_tipo_v	= '0'
				dw_lista_ugn_mc.setitem(ll_indi,'tipo_via',ls_tipo_v)
			end if
			if isnull(ls_direc_p) then 
				ls_direc_p	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'direccion_p',ls_direc_p)
			end if
			if isnull(ls_num_p) then 
				ls_num_p		= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'numero_particular',ls_num_p)
			end if
			if isnull(ls_depto_p) then 
				ls_depto_p	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'depto_particular',ls_depto_p)
			end if
			if isnull(ls_block_p) then 
				ls_block_p	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'block_particular',ls_block_p)
			end if
			if isnull(ls_pobla) then 
				ls_pobla		= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'poblacion',ls_pobla)
			end if
			if isnull(ls_sector) then 
				ls_sector	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'sector',ls_sector)
			end if
			if isnull(ls_ciudad_p) then 
				ls_ciudad_p	= '0'
				dw_lista_ugn_mc.setitem(ll_indi,'ciudad',ls_ciudad_p)
			end if
			if isnull(ls_comuna_p) then 
				ls_comuna_p	= '0'
				dw_lista_ugn_mc.setitem(ll_indi,'ciudad',ls_comuna_p)
			end if
			if isnull(ls_dirr_c) then 
				ls_dirr_c	= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'domicilio_c',ls_dirr_c)
			end if
			if isnull(ls_num_c) then 
				ls_num_c		= '-'
				dw_lista_ugn_mc.setitem(ll_indi,'numero_comercial',ls_num_c)
			end if
			if isnull(ls_ciudad_c) then 
				ls_ciudad_c	= '0'
				dw_lista_ugn_mc.setitem(ll_indi,'ciudad_comercial',ls_ciudad_c)
			end if
			if isnull(ls_comuna_c) then 
				ls_comuna_c	= '0'
				dw_lista_ugn_mc.setitem(ll_indi,'comuna_comercial',ls_comuna_c)
			end if
			if isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('nombre')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_pat) or ls_ap_pat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('a_paterno')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_mat) or ls_ap_mat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('a_materno')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fono_p) or ls_fono_p='' then
				messagebox("Advertencia","Debe Ingresar Fono Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('fono_p')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_celular) or ls_celular='' then
				messagebox("Advertencia","Debe Ingresar Celular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('celular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fono_c) or ls_fono_c='' then
				messagebox("Advertencia","Debe Ingresar Fono Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('fono_c')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_email) or ls_email='' then
				messagebox("Advertencia","Debe Ingresar Correo Electronico en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('email')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_tipo_v) or ls_tipo_v='' then
				messagebox("Advertencia","Debe Ingresar Tipo de Via en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('tipo_via')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_direc_p) or ls_direc_p='' then
				messagebox("Advertencia","Debe Ingresar Dirección Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('direccion_p')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_num_p) or ls_num_p='' then
				messagebox("Advertencia","Debe Ingresar Número Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('numero_particular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_depto_p) or ls_depto_p='' then
				messagebox("Advertencia","Debe Ingresar Departamento Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('depto_particular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_block_p) or ls_block_p='' then
				messagebox("Advertencia","Debe Ingresar Block Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('block_particular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_pobla) or ls_pobla='' then
				messagebox("Advertencia","Debe Ingresar Población Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('poblacion')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_sector) or ls_sector='' then
				messagebox("Advertencia","Debe Ingresar Sector Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('sector')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ciudad_p) or ls_ciudad_p='' then
				messagebox("Advertencia","Debe Ingresar Ciudad Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('ciudad')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_comuna_p) or ls_comuna_p='' then
				messagebox("Advertencia","Debe Ingresar Comuna Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('comuna')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_dirr_c) or ls_dirr_c='' then
				messagebox("Advertencia","Debe Ingresar Dirección Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('domicilio_c')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_num_c) or ls_num_c='' then
				messagebox("Advertencia","Debe Ingresar Número Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('numero_comercial')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ciudad_c) or ls_ciudad_c='' then
				messagebox("Advertencia","Debe Ingresar Ciudad Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('ciudad_comercial')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_comuna_c) or ls_comuna_c='' then
				messagebox("Advertencia","Debe Ingresar Ciudad Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
				dw_lista_ugn_mc.setfocus()
				dw_lista_ugn_mc.scrolltorow(ll_indi)
				dw_lista_ugn_mc.setcolumn('comuna_comercial')
				ls_pasa		= 'N'
				exit
			else
				dw_lista_ugn_mc.accepttext()
				ls_pasa = 'S'
			end if
			
		elseif ll_est_rut= 0 and (isnull(ll_rut_val) or isnull(ls_dv_val)) then
			Messagebox("Error","El Rut Incompleto Fila Nº "+string(ll_indi,'###,###,##0'))
			close(w_lista_ugn_maestro_condo_grupo)
			dw_lista_ugn_mc.setfocus()
			dw_lista_ugn_mc.scrolltorow(ll_indi)
			dw_lista_ugn_mc.setcolumn('dv')
				
		elseif ll_est_rut= 1 and (not isnull(ll_rut_val) or not isnull(ls_dv_val)) then
			Messagebox("Advertencia","El Rut Invalido Fila Nº "+string(ll_indi,'###,###,##0'))
			close(w_lista_ugn_maestro_condo_grupo)
			dw_lista_ugn_mc.setfocus()
			dw_lista_ugn_mc.scrolltorow(ll_indi)
			dw_lista_ugn_mc.setcolumn('rut')
		end if	
	next
	if ls_pasa = 'S' then
		dw_lista_ugn_mc.accepttext()
		if is_modif	= 'S' then
			is_modif  = 'S'
			if dw_lista_ugn_mc.update()=1 then
				commit;
				ls_sector_ret				= dw_ugn_lista_fallecidos.getitemstring(dw_ugn_lista_fallecidos.getrow(),'sector')
				ls_sepultura_ret			= dw_ugn_lista_fallecidos.getitemstring(dw_ugn_lista_fallecidos.getrow(),'sepultura')
				ll_rut_fallecido_ret			= dw_ugn_lista_fallecidos.getitemnumber(dw_ugn_lista_fallecidos.getrow(),'rut_fallecido')
				ldt_fecha_sepultura_ret	= dw_ugn_lista_fallecidos.getitemdatetime(dw_ugn_lista_fallecidos.getrow(),'fecha_sepultacion')
				ls_tipo_ficha_ret			= dw_ugn_lista_fallecidos.getitemstring(dw_ugn_lista_fallecidos.getrow(),'c_tipo_ficha')
				ls_nombre_fallecido_ret	= dw_ugn_lista_fallecidos.getitemstring(dw_ugn_lista_fallecidos.getrow(),'nombre_fallecido')
				ls_ap_pat_fall_ret			= dw_ugn_lista_fallecidos.getitemstring(dw_ugn_lista_fallecidos.getrow(),'ap_paterno_fall')
				ls_ap_mat_fall_ret			= dw_ugn_lista_fallecidos.getitemstring(dw_ugn_lista_fallecidos.getrow(),'ap_materno_fall')
				ll_folio_ficha_ret			= dw_ugn_lista_fallecidos.getitemnumber(dw_ugn_lista_fallecidos.getrow(),'correlativo_ficha')
				ldt_fecha_ingreso_ret		= datetime(date(gdt_fec_sistema),time('00:00:00'))
				ls_base_ret					= dw_ugn_lista_fallecidos.getitemstring(dw_ugn_lista_fallecidos.getrow(),'base')
				ls_serie_ret					= dw_ugn_lista_fallecidos.getitemstring(dw_ugn_lista_fallecidos.getrow(),'serie')
				ll_numero_ret				= dw_ugn_lista_fallecidos.getitemnumber(dw_ugn_lista_fallecidos.getrow(),'numero')
				ll_cod_parque_ret			= dw_ugn_lista_fallecidos.getitemnumber(dw_ugn_lista_fallecidos.getrow(),'cod_parque')
				
				
				SELECT 	"FICHA_IMPLEMENTACION"."FOLIO",		"FICHA_IMPLEMENTACION"."FECHA_INGRESO",	"FICHA_IMPLEMENTACION"."USUARIO_CREA",	"FICHA_IMPLEMENTACION"."CODIGO_MAESTRO"
				INTO 		:ll_grupo_ret,									:ldt_fecha_ingreso_ret,									:ls_usuario_creador_ret,								:ls_codigo_maestro_ret
				FROM 	"FICHA_IMPLEMENTACION"  
				WHERE ( "FICHA_IMPLEMENTACION"."SECTOR" = :ls_sector_ret ) AND  
						  ( "FICHA_IMPLEMENTACION"."SEPULTURA" = :ls_sepultura_ret ) AND  
						  ( "FICHA_IMPLEMENTACION"."NOMBRE_FALLECIDO" = :ls_nombre_fallecido_ret ) AND  
						  ( "FICHA_IMPLEMENTACION"."AP_PATERNO_FALLECIDO" = :ls_ap_pat_fall_ret ) AND  
						  ( "FICHA_IMPLEMENTACION"."AP_MATERNO_FALLECIDO" = :ls_ap_mat_fall_ret ) AND  
						  ( "FICHA_IMPLEMENTACION"."TIPO_FICHA_SEPULTACION" = :ls_tipo_ficha_ret ) AND  
						  ( "FICHA_IMPLEMENTACION"."FOLIO_FICHA_SEPULTACION" = :ll_folio_ficha_ret ) AND  
						  ( "FICHA_IMPLEMENTACION"."FECHA_FICHA_SEPULTACION" = :ldt_fecha_sepultura_ret ) AND  
						  ( "FICHA_IMPLEMENTACION"."RUT_FALLECIDO" = :ll_rut_fallecido_ret )   
				USING	sqlca;
				if sqlca.sqlcode <> 0 then
					ll_implementacion	= wf_grabar_ficha_implementacion(ll_grupo_ret,ll_cod_parque_ret,ls_base_ret,ls_serie_ret,ll_numero_ret,ll_rut_fallecido_ret,ls_nombre_fallecido_ret,ls_ap_pat_fall_ret,ls_ap_mat_fall_ret,ldt_fecha_ingreso_ret,ldt_fecha_sepultura_ret,ls_tipo_ficha_ret,ll_folio_ficha_ret ,gs_user)	//ls_codigo_maestro_ret)
					ll_res			= messagebox("Grabar","Grabación Exitosa, desea ahora Ingresar Ficha Implemetación N° "+string(ll_implementacion,'###,###,###,###,##0'),Exclamation!,YesNo!,2)
					if ll_res=1 then
						ls_string	= 'M'+'~t'+string(ll_implementacion)
						if isvalid(w_mantenedor_ficha_implementacion) then close(w_mantenedor_ficha_implementacion)
						OpenWithParm(w_mantenedor_ficha_implementacion,ls_string)
					end if
				else
					messagebox("Grabar","Grabación Exitosa")
				end if
				il_modif	= 0
				ls_pasa 	= 'N'
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Cliente_UGN SQL: "+sqlca.sqlerrtext)
			end if
		else
			ll_row					= dw_ugn_lista_fallecidos.getrow()
			ll_rut					= dw_ugn_lista_fallecidos.getitemnumber(ll_row,'rut_fallecido')
			ls_dv					= dw_ugn_lista_fallecidos.getitemstring(ll_row,'dv_fallecido')
			ls_nom_fall			= dw_ugn_lista_fallecidos.getitemstring(ll_row,'nombre_fallecido')
			ls_ap_pat_fall		= dw_ugn_lista_fallecidos.getitemstring(ll_row,'ap_paterno_fall')
			ls_ap_mat_fall		= dw_ugn_lista_fallecidos.getitemstring(ll_row,'ap_materno_fall')
			ls_base				= dw_ugn_lista_fallecidos.getitemstring(ll_row,'base')
			ls_serie				= dw_ugn_lista_fallecidos.getitemstring(ll_row,'serie')
			ll_numero			= dw_ugn_lista_fallecidos.getitemnumber(ll_row,'numero')
			ldt_fecha_sepult	= dw_ugn_lista_fallecidos.getitemdatetime(ll_row,'fecha_sepultacion')
			ll_cod_parque		= dw_ugn_lista_fallecidos.getitemnumber(ll_row,'cod_parque')
			ls_tipo_ficha			= dw_ugn_lista_fallecidos.getitemstring(dw_ugn_lista_fallecidos.getrow(),'c_tipo_ficha')
			ll_folio_ficha			= dw_ugn_lista_fallecidos.getitemnumber(dw_ugn_lista_fallecidos.getrow(),'correlativo_ficha')
			ls_sector_sep		= dw_ugn_lista_fallecidos.getitemstring(ll_row,'sector')
			ls_sepultura_sep	= dw_ugn_lista_fallecidos.getitemstring(ll_row,'sepultura')
			ll_rut_tit_sep		= dw_ugn_lista_fallecidos.getitemnumber(ll_row,'rut_titular')
			ls_string				= string(ll_rut)+'~t'+ls_dv+'~t'+ls_nom_fall+'~t'+ls_ap_pat_fall+'~t'+ls_ap_mat_fall+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ldt_fecha_sepult,'dd/mm/yyyy')+'~t'+string(ll_cod_parque)+'~t'+ls_tipo_ficha+'~t'+string(ll_folio_ficha)+'~t'+ls_sector_sep+'~t'+ls_sepultura_sep+'~t'+string(ll_rut_tit_sep)
			if isvalid(w_lista_ugn_maestro_condo_grupo) then close(w_lista_ugn_maestro_condo_grupo)
			openwithparm(w_lista_ugn_maestro_condo_grupo,ls_string)
		end if
	end if
end if	
end event

type cb_2 from commandbutton within w_lista_ugn_maestro_condo_2
integer x = 3109
integer y = 2516
integer width = 306
integer height = 100
integer taborder = 160
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Long	ll_res,ll_tot_reg

ll_tot_reg	= dw_lista_ugn_mc.getrow()
if il_modif > 0 THEN
	ll_res	= messagebox('Advertencia','Desea Salir sin Grabar',Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		close(w_lista_ugn_maestro_condo_2)
	end if	
else
	close(w_lista_ugn_maestro_condo_2)
end if
end event

type dw_lista_ugn_mc from datawindow within w_lista_ugn_maestro_condo_2
integer x = 23
integer y = 1464
integer width = 3392
integer height = 1004
integer taborder = 70
string title = "none"
string dataobject = "dw_lista_ingreso_ugn_cliente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string 	ls_columna,ls_null,ls_dv,ls_ciudad,ls_nulo
long	 	ll_rut,ll_tot_reg,ll_fila,ll_est_rut,ll_nulo,ll_estado_rut
String	ls_nombre,ls_ap_pat,ls_pasa='S',ls_ap_mat,ls_fono_p,ls_celular,ls_fono_c,ls_email,&
			ls_tipo_v,ls_direc_p,ls_num_p,ls_block_p,ls_pobla,ls_sector,ls_ciudad_p,ls_comuna_p,&
			ls_dirr_c,ls_num_c,ls_ciudad_c,ls_depto_p,ls_comuna_c

dw_lista_ugn_mc.accepttext()
setnull(ls_nulo); setnull(ll_nulo)
ll_fila						= row
ls_columna				= dwo.name
il_modif ++
if row > 0 then
	if ls_columna='estado_rut' then
		ll_rut			= dw_lista_ugn_mc.getitemnumber(ll_fila,'rut')
		ls_dv			= dw_lista_ugn_mc.getitemstring(ll_fila,'dv')
		ll_est_rut	= long(data) //dw_lista_ugn_mc.getitemnumber(ll_fila,'estado_rut')
		if ll_rut > 0  and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) and ll_est_rut=0 then
				messagebox('Error','Rut Inválido',stopsign!)
				dw_lista_ugn_mc.setitem(ll_fila,'dv',ls_nulo)
				dw_lista_ugn_mc.accepttext()				
				dw_lista_ugn_mc.setcolumn('dv')
				dw_lista_ugn_mc.setfocus()
			elseif ll_est_rut= 1 and (not isnull(ll_rut) or not isnull(ls_dv)) then
				messagebox('Advertencia','No ha Marcado Validar Rut',stopsign!)
				dw_lista_ugn_mc.setcolumn('estado_rut')
				dw_lista_ugn_mc.setfocus()
			elseif ll_est_rut= 0 and (not isnull(ll_rut) and not isnull(ls_dv)) then
				if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) and ll_est_rut=0 then 
					messagebox('Error','Rut Inválido',stopsign!)
					dw_lista_ugn_mc.setitem(ll_fila,'dv',ls_nulo)
					dw_lista_ugn_mc.accepttext()				
					dw_lista_ugn_mc.setcolumn('dv')
					dw_lista_ugn_mc.setfocus()
				end if
				SELECT "UGN_CLIENTE"."NOMBRE","UGN_CLIENTE"."A_PATERNO","UGN_CLIENTE"."A_MATERNO","UGN_CLIENTE"."FONO_P","UGN_CLIENTE"."CELULAR","UGN_CLIENTE"."FONO_C","UGN_CLIENTE"."EMAIL","UGN_CLIENTE"."TIPO_VIA","UGN_CLIENTE"."DIRECCION_P","UGN_CLIENTE"."NUMERO_PARTICULAR","UGN_CLIENTE"."DEPTO_PARTICULAR","UGN_CLIENTE"."BLOCK_PARTICULAR","UGN_CLIENTE"."POBLACION","UGN_CLIENTE"."SECTOR","UGN_CLIENTE"."CIUDAD","UGN_CLIENTE"."COMUNA","UGN_CLIENTE"."DOMICILIO_C","UGN_CLIENTE"."NUMERO_COMERCIAL","UGN_CLIENTE"."CIUDAD_COMERCIAL","UGN_CLIENTE"."COMUNA_COMERCIAL"  
				INTO 	 :ls_nombre,   			:ls_ap_pat,   					:ls_ap_mat,   					:ls_fono_p,   				:ls_celular,  				:ls_fono_c,   				:ls_email,  			:ls_tipo_v,  				:ls_direc_p,   					:ls_num_p,   							:ls_depto_p,   						:ls_block_p,   						:ls_pobla,   					:ls_sector,   			:ls_ciudad_p,   			:ls_comuna_p,   			:ls_dirr_c,   					:ls_num_c,   							:ls_ciudad_c,   						:ls_comuna_c  
				FROM 	 "UGN_CLIENTE"
				WHERE  "UGN_CLIENTE"."RUT" = :ll_rut AND
					  	 "UGN_CLIENTE"."DV" = :ls_dv
				USING	sqlca;
				if	sqlca.sqlcode= 0 then
					if MessageBox("Atención", "Cliente ya Existe... Desea Ingresarlo", Question!, YesNo! ) = 1 then
						dw_lista_ugn_mc.setitem(ll_fila,'nombre',ls_nombre)
						dw_lista_ugn_mc.setitem(ll_fila,'a_paterno',ls_ap_pat)
						dw_lista_ugn_mc.setitem(ll_fila,'a_materno',ls_ap_mat)
						dw_lista_ugn_mc.setitem(ll_fila,'fono_p',ls_fono_p)
						dw_lista_ugn_mc.setitem(ll_fila,'celular',ls_celular)
						dw_lista_ugn_mc.setitem(ll_fila,'fono_c',ls_fono_c)
						dw_lista_ugn_mc.setitem(ll_fila,'email',ls_email)
						dw_lista_ugn_mc.setitem(ll_fila,'tipo_via',ls_tipo_v)
						dw_lista_ugn_mc.setitem(ll_fila,'direccion_p',ls_direc_p)
						dw_lista_ugn_mc.setitem(ll_fila,'numero_particular',ls_num_p)
						dw_lista_ugn_mc.setitem(ll_fila,'depto_particular',ls_depto_p)
						dw_lista_ugn_mc.setitem(ll_fila,'block_particular',ls_block_p)
						dw_lista_ugn_mc.setitem(ll_fila,'poblacion',ls_pobla)
						dw_lista_ugn_mc.setitem(ll_fila,'sector',ls_sector)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad',ls_ciudad_p)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad',ls_comuna_p)
						dw_lista_ugn_mc.setitem(ll_fila,'domicilio_c',ls_dirr_c)
						dw_lista_ugn_mc.setitem(ll_fila,'numero_comercial',ls_num_c)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad_comercial',ls_ciudad_c)
						dw_lista_ugn_mc.setitem(ll_fila,'comuna_comercial',ls_comuna_c)
					else
						dw_lista_ugn_mc.DeleteRow(ll_fila)
					end if	
				end if
			else
				SELECT "UGN_CLIENTE"."NOMBRE","UGN_CLIENTE"."A_PATERNO","UGN_CLIENTE"."A_MATERNO","UGN_CLIENTE"."FONO_P","UGN_CLIENTE"."CELULAR","UGN_CLIENTE"."FONO_C","UGN_CLIENTE"."EMAIL","UGN_CLIENTE"."TIPO_VIA","UGN_CLIENTE"."DIRECCION_P","UGN_CLIENTE"."NUMERO_PARTICULAR","UGN_CLIENTE"."DEPTO_PARTICULAR","UGN_CLIENTE"."BLOCK_PARTICULAR","UGN_CLIENTE"."POBLACION","UGN_CLIENTE"."SECTOR","UGN_CLIENTE"."CIUDAD","UGN_CLIENTE"."COMUNA","UGN_CLIENTE"."DOMICILIO_C","UGN_CLIENTE"."NUMERO_COMERCIAL","UGN_CLIENTE"."CIUDAD_COMERCIAL","UGN_CLIENTE"."COMUNA_COMERCIAL"  
				INTO 	 :ls_nombre,   			:ls_ap_pat,   					:ls_ap_mat,   					:ls_fono_p,   				:ls_celular,  				:ls_fono_c,   				:ls_email,  			:ls_tipo_v,  				:ls_direc_p,   					:ls_num_p,   							:ls_depto_p,   						:ls_block_p,   						:ls_pobla,   					:ls_sector,   			:ls_ciudad_p,   			:ls_comuna_p,   			:ls_dirr_c,   					:ls_num_c,   							:ls_ciudad_c,   						:ls_comuna_c  
				FROM 	 "UGN_CLIENTE"
				WHERE  "UGN_CLIENTE"."RUT" = :ll_rut AND
					  	 "UGN_CLIENTE"."DV" = :ls_dv
				USING	sqlca;
				if	sqlca.sqlcode= 0 then
					if MessageBox("Atención", "Cliente ya Existe... Desea Ingresarlo", Question!, YesNo! ) = 1 then
						dw_lista_ugn_mc.setitem(ll_fila,'nombre',ls_nombre)
						dw_lista_ugn_mc.setitem(ll_fila,'a_paterno',ls_ap_pat)
						dw_lista_ugn_mc.setitem(ll_fila,'a_materno',ls_ap_mat)
						dw_lista_ugn_mc.setitem(ll_fila,'fono_p',ls_fono_p)
						dw_lista_ugn_mc.setitem(ll_fila,'celular',ls_celular)
						dw_lista_ugn_mc.setitem(ll_fila,'fono_c',ls_fono_c)
						dw_lista_ugn_mc.setitem(ll_fila,'email',ls_email)
						dw_lista_ugn_mc.setitem(ll_fila,'tipo_via',ls_tipo_v)
						dw_lista_ugn_mc.setitem(ll_fila,'direccion_p',ls_direc_p)
						dw_lista_ugn_mc.setitem(ll_fila,'numero_particular',ls_num_p)
						dw_lista_ugn_mc.setitem(ll_fila,'depto_particular',ls_depto_p)
						dw_lista_ugn_mc.setitem(ll_fila,'block_particular',ls_block_p)
						dw_lista_ugn_mc.setitem(ll_fila,'poblacion',ls_pobla)
						dw_lista_ugn_mc.setitem(ll_fila,'sector',ls_sector)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad',ls_ciudad_p)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad',ls_comuna_p)
						dw_lista_ugn_mc.setitem(ll_fila,'domicilio_c',ls_dirr_c)
						dw_lista_ugn_mc.setitem(ll_fila,'numero_comercial',ls_num_c)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad_comercial',ls_ciudad_c)
						dw_lista_ugn_mc.setitem(ll_fila,'comuna_comercial',ls_comuna_c)
					else
						dw_lista_ugn_mc.DeleteRow(ll_fila)
					end if	
				end if
			end if
		end if
	elseif ls_columna='rut' or ls_columna='dv' then
		ll_rut		= dw_lista_ugn_mc.getitemnumber(ll_fila,'rut')
		ls_dv			= dw_lista_ugn_mc.getitemstring(ll_fila,'dv')
		ll_est_rut	= dw_lista_ugn_mc.getitemnumber(ll_fila,'estado_rut')
		if ll_rut > 0  and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) and ll_est_rut=0 then
				messagebox('Error','Rut Inválido',stopsign!)
				dw_lista_ugn_mc.setitem(ll_fila,'dv',ls_nulo)
				dw_lista_ugn_mc.accepttext()				
				dw_lista_ugn_mc.setcolumn('dv')
				dw_lista_ugn_mc.setfocus()
			elseif ll_est_rut= 1 and (not isnull(ll_rut) or not isnull(ls_dv)) then
				messagebox('Advertencia','No ha Marcado Validar Rut',stopsign!)
				dw_lista_ugn_mc.setcolumn('estado_rut')
				dw_lista_ugn_mc.setfocus()
			elseif ll_est_rut= 0 and (not isnull(ll_rut) and not isnull(ls_dv)) then
				if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) and ll_est_rut=0 then 
					messagebox('Error','Rut Inválido',stopsign!)
					dw_lista_ugn_mc.setitem(ll_fila,'dv',ls_nulo)
					dw_lista_ugn_mc.accepttext()				
					dw_lista_ugn_mc.setcolumn('dv')
					dw_lista_ugn_mc.setfocus()
				end if
				SELECT "UGN_CLIENTE"."NOMBRE","UGN_CLIENTE"."A_PATERNO","UGN_CLIENTE"."A_MATERNO","UGN_CLIENTE"."FONO_P","UGN_CLIENTE"."CELULAR","UGN_CLIENTE"."FONO_C","UGN_CLIENTE"."EMAIL","UGN_CLIENTE"."TIPO_VIA","UGN_CLIENTE"."DIRECCION_P","UGN_CLIENTE"."NUMERO_PARTICULAR","UGN_CLIENTE"."DEPTO_PARTICULAR","UGN_CLIENTE"."BLOCK_PARTICULAR","UGN_CLIENTE"."POBLACION","UGN_CLIENTE"."SECTOR","UGN_CLIENTE"."CIUDAD","UGN_CLIENTE"."COMUNA","UGN_CLIENTE"."DOMICILIO_C","UGN_CLIENTE"."NUMERO_COMERCIAL","UGN_CLIENTE"."CIUDAD_COMERCIAL","UGN_CLIENTE"."COMUNA_COMERCIAL"  
				INTO 	 :ls_nombre,   			:ls_ap_pat,   					:ls_ap_mat,   					:ls_fono_p,   				:ls_celular,  				:ls_fono_c,   				:ls_email,  			:ls_tipo_v,  				:ls_direc_p,   					:ls_num_p,   							:ls_depto_p,   						:ls_block_p,   						:ls_pobla,   					:ls_sector,   			:ls_ciudad_p,   			:ls_comuna_p,   			:ls_dirr_c,   					:ls_num_c,   							:ls_ciudad_c,   						:ls_comuna_c  
				FROM 	 "UGN_CLIENTE"
				WHERE  "UGN_CLIENTE"."RUT" = :ll_rut AND
					  	 "UGN_CLIENTE"."DV" = :ls_dv
				USING	sqlca;
				if	sqlca.sqlcode= 0 then
					if MessageBox("Atención", "Cliente ya Existe... Desea Ingresarlo", Question!, YesNo! ) = 1 then
						dw_lista_ugn_mc.setitem(ll_fila,'nombre',ls_nombre)
						dw_lista_ugn_mc.setitem(ll_fila,'a_paterno',ls_ap_pat)
						dw_lista_ugn_mc.setitem(ll_fila,'a_materno',ls_ap_mat)
						dw_lista_ugn_mc.setitem(ll_fila,'fono_p',ls_fono_p)
						dw_lista_ugn_mc.setitem(ll_fila,'celular',ls_celular)
						dw_lista_ugn_mc.setitem(ll_fila,'fono_c',ls_fono_c)
						dw_lista_ugn_mc.setitem(ll_fila,'email',ls_email)
						dw_lista_ugn_mc.setitem(ll_fila,'tipo_via',ls_tipo_v)
						dw_lista_ugn_mc.setitem(ll_fila,'direccion_p',ls_direc_p)
						dw_lista_ugn_mc.setitem(ll_fila,'numero_particular',ls_num_p)
						dw_lista_ugn_mc.setitem(ll_fila,'depto_particular',ls_depto_p)
						dw_lista_ugn_mc.setitem(ll_fila,'block_particular',ls_block_p)
						dw_lista_ugn_mc.setitem(ll_fila,'poblacion',ls_pobla)
						dw_lista_ugn_mc.setitem(ll_fila,'sector',ls_sector)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad',ls_ciudad_p)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad',ls_comuna_p)
						dw_lista_ugn_mc.setitem(ll_fila,'domicilio_c',ls_dirr_c)
						dw_lista_ugn_mc.setitem(ll_fila,'numero_comercial',ls_num_c)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad_comercial',ls_ciudad_c)
						dw_lista_ugn_mc.setitem(ll_fila,'comuna_comercial',ls_comuna_c)
					else
						dw_lista_ugn_mc.DeleteRow(ll_fila)
					end if	
				end if
			else
				SELECT "UGN_CLIENTE"."NOMBRE","UGN_CLIENTE"."A_PATERNO","UGN_CLIENTE"."A_MATERNO","UGN_CLIENTE"."FONO_P","UGN_CLIENTE"."CELULAR","UGN_CLIENTE"."FONO_C","UGN_CLIENTE"."EMAIL","UGN_CLIENTE"."TIPO_VIA","UGN_CLIENTE"."DIRECCION_P","UGN_CLIENTE"."NUMERO_PARTICULAR","UGN_CLIENTE"."DEPTO_PARTICULAR","UGN_CLIENTE"."BLOCK_PARTICULAR","UGN_CLIENTE"."POBLACION","UGN_CLIENTE"."SECTOR","UGN_CLIENTE"."CIUDAD","UGN_CLIENTE"."COMUNA","UGN_CLIENTE"."DOMICILIO_C","UGN_CLIENTE"."NUMERO_COMERCIAL","UGN_CLIENTE"."CIUDAD_COMERCIAL","UGN_CLIENTE"."COMUNA_COMERCIAL"  
				INTO 	 :ls_nombre,   			:ls_ap_pat,   					:ls_ap_mat,   					:ls_fono_p,   				:ls_celular,  				:ls_fono_c,   				:ls_email,  			:ls_tipo_v,  				:ls_direc_p,   					:ls_num_p,   							:ls_depto_p,   						:ls_block_p,   						:ls_pobla,   					:ls_sector,   			:ls_ciudad_p,   			:ls_comuna_p,   			:ls_dirr_c,   					:ls_num_c,   							:ls_ciudad_c,   						:ls_comuna_c  
				FROM 	 "UGN_CLIENTE"
				WHERE  "UGN_CLIENTE"."RUT" = :ll_rut AND
					  	 "UGN_CLIENTE"."DV" = :ls_dv
				USING	sqlca;
				if	sqlca.sqlcode= 0 then
					if MessageBox("Atención", "Cliente ya Existe... Desea Ingresarlo", Question!, YesNo! ) = 1 then
						dw_lista_ugn_mc.setitem(ll_fila,'nombre',ls_nombre)
						dw_lista_ugn_mc.setitem(ll_fila,'a_paterno',ls_ap_pat)
						dw_lista_ugn_mc.setitem(ll_fila,'a_materno',ls_ap_mat)
						dw_lista_ugn_mc.setitem(ll_fila,'fono_p',ls_fono_p)
						dw_lista_ugn_mc.setitem(ll_fila,'celular',ls_celular)
						dw_lista_ugn_mc.setitem(ll_fila,'fono_c',ls_fono_c)
						dw_lista_ugn_mc.setitem(ll_fila,'email',ls_email)
						dw_lista_ugn_mc.setitem(ll_fila,'tipo_via',ls_tipo_v)
						dw_lista_ugn_mc.setitem(ll_fila,'direccion_p',ls_direc_p)
						dw_lista_ugn_mc.setitem(ll_fila,'numero_particular',ls_num_p)
						dw_lista_ugn_mc.setitem(ll_fila,'depto_particular',ls_depto_p)
						dw_lista_ugn_mc.setitem(ll_fila,'block_particular',ls_block_p)
						dw_lista_ugn_mc.setitem(ll_fila,'poblacion',ls_pobla)
						dw_lista_ugn_mc.setitem(ll_fila,'sector',ls_sector)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad',ls_ciudad_p)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad',ls_comuna_p)
						dw_lista_ugn_mc.setitem(ll_fila,'domicilio_c',ls_dirr_c)
						dw_lista_ugn_mc.setitem(ll_fila,'numero_comercial',ls_num_c)
						dw_lista_ugn_mc.setitem(ll_fila,'ciudad_comercial',ls_ciudad_c)
						dw_lista_ugn_mc.setitem(ll_fila,'comuna_comercial',ls_comuna_c)
					else
						dw_lista_ugn_mc.DeleteRow(ll_fila)
					end if	
				end if
			end if
		end if
	elseif ls_columna='ciudad' then
		ls_ciudad	= dw_lista_ugn_mc.getitemstring(ll_fila,'ciudad')
		dw_lista_ugn_mc.setitem(ll_fila,'comuna',ls_nulo)
		dw_lista_ugn_mc.accepttext()
		idw_detalle.retrieve(ls_ciudad)
	
	elseif ls_columna='ciudad_comercial' then
		ls_ciudad	= dw_lista_ugn_mc.getitemstring(ll_fila,'ciudad_comercial')
		dw_lista_ugn_mc.setitem(ll_fila,'comuna_comercial',ls_nulo)
		dw_lista_ugn_mc.accepttext()
		idw_detalle2.retrieve(ls_ciudad)	
	end if
	dw_lista_ugn_mc.setcolumn('dv')
end if	
end event

event itemfocuschanged;string ls_columna,ls_null,ls_dv,ls_ciudad,ls_nulo,ls_ciudad_comerc
long	 ll_rut,ll_tot_reg,ll_fila,ll_est_rut,ll_nulo
String	ls_nombre,ls_ap_pat,ls_pasa='S',ls_ap_mat,ls_fono_p,ls_celular,ls_fono_c,ls_email,&
			ls_tipo_v,ls_direc_p,ls_num_p,ls_block_p,ls_pobla,ls_sector,ls_ciudad_p,ls_comuna_p,&
			ls_dirr_c,ls_num_c,ls_ciudad_c,ls_depto_p,ls_comuna_c

dw_lista_ugn_mc.accepttext()
setnull(ls_nulo);setnull(ll_nulo)
ll_fila				= row
ls_columna			= dwo.name
if row > 0 then
	if ls_columna<>'rut' and ls_columna<>'dv' then
		ll_rut			= dw_lista_ugn_mc.getitemnumber(ll_fila,'rut')
		ls_dv			= dw_lista_ugn_mc.getitemstring(ll_fila,'dv')
		ll_est_rut		= dw_lista_ugn_mc.getitemnumber(ll_fila,'estado_rut')
		if ll_rut > 0  and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) and ll_est_rut=0 then
				dw_lista_ugn_mc.setitem(ll_fila,'dv',ls_nulo)
				dw_lista_ugn_mc.accepttext()
				dw_lista_ugn_mc.setcolumn('dv')
				dw_lista_ugn_mc.setfocus()
			elseif ll_est_rut= 1 and (not isnull(ll_rut) or not isnull(ls_dv)) then
				dw_lista_ugn_mc.setcolumn('estado_rut')
				dw_lista_ugn_mc.setfocus()
			elseif ll_est_rut= 0 and (not isnull(ll_rut) and not isnull(ls_dv)) then
				if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) and ll_est_rut=0 then 
					messagebox('Error','Rut Inválido',stopsign!)
					dw_lista_ugn_mc.setitem(ll_fila,'dv',ls_nulo)
					dw_lista_ugn_mc.accepttext()				
					dw_lista_ugn_mc.setcolumn('dv')
					dw_lista_ugn_mc.setfocus()
				end if		
			end if
//			dw_lista_ugn_mc.setcolumn('dv')
		end if
	end if
end if	
end event

type cb_ingresar from commandbutton within w_lista_ugn_maestro_condo_2
integer x = 23
integer y = 2516
integer width = 512
integer height = 100
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Ingresar Prospectos"
end type

event clicked;Long		ll_new,ll_tot_reg,ll_indi,ll_grupo,ll_rut,ll_est_rut
String		ls_nombre,ls_ap_pat,ls_pasa='S',ls_ap_mat,ls_fono_p,ls_celular,ls_fono_c,ls_email,&
			ls_tipo_v,ls_direc_p,ls_num_p,ls_block_p,ls_pobla,ls_sector,ls_ciudad_p,ls_comuna_p,&
			ls_dirr_c,ls_num_c,ls_ciudad_c,ls_depto_p,ls_comuna_c,ls_dv

if rb_condolencia.checked=true or rb_sin_condolencia.checked=true then
	dw_lista_ugn_mc.accepttext()
	ll_tot_reg	= dw_lista_ugn_mc.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_rut			= dw_lista_ugn_mc.getitemnumber(ll_indi,'estado_rut')
			ll_rut			= dw_lista_ugn_mc.getitemnumber(ll_indi,'rut')
			ls_dv				= dw_lista_ugn_mc.getitemstring(ll_indi,'dv')
			if ll_rut > 0  and not isnull(ls_dv) then
				if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
					messagebox('Error','Rut Inválido en Fila Nº'+string(ll_indi,'###,###,##0'),stopsign!)
					cb_grabar.enabled				= false
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.setcolumn('dv')	
				end if
			end if
			if ll_est_rut= 0  and not isnull(ll_rut) and not isnull(ls_dv) then
				ls_nombre		= dw_lista_ugn_mc.getitemstring(ll_indi,'nombre')
				ls_ap_pat		= dw_lista_ugn_mc.getitemstring(ll_indi,'a_paterno')
				ls_ap_mat		= dw_lista_ugn_mc.getitemstring(ll_indi,'a_materno')
				ls_fono_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'fono_p')
				ls_celular		= dw_lista_ugn_mc.getitemstring(ll_indi,'celular')
				ls_fono_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'fono_c')
				ls_email			= dw_lista_ugn_mc.getitemstring(ll_indi,'email')
				ls_tipo_v			= dw_lista_ugn_mc.getitemstring(ll_indi,'tipo_via')
				ls_direc_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'direccion_p')
				ls_num_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'numero_particular')
				ls_depto_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'depto_particular')
				ls_block_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'block_particular')
				ls_pobla			= dw_lista_ugn_mc.getitemstring(ll_indi,'poblacion')
				ls_sector			= dw_lista_ugn_mc.getitemstring(ll_indi,'sector')
				ls_ciudad_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'ciudad')
				ls_comuna_p	= dw_lista_ugn_mc.getitemstring(ll_indi,'comuna')
				ls_dirr_c			= dw_lista_ugn_mc.getitemstring(ll_indi,'domicilio_c')
				ls_num_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'numero_comercial')
				ls_ciudad_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'ciudad_comercial')
				ls_comuna_c	= dw_lista_ugn_mc.getitemstring(ll_indi,'comuna_comercial')
				if isnull(ls_fono_c) then 
					ls_fono_c	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'fono_c',ls_fono_c)
				end if
				if isnull(ls_email) then 
					ls_email		= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'email',ls_email)
				end if
				if isnull(ls_tipo_v) then 
					ls_tipo_v	= '0'
					dw_lista_ugn_mc.setitem(ll_indi,'tipo_via',ls_tipo_v)
				end if
				if isnull(ls_direc_p) then 
					ls_direc_p	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'direccion_p',ls_direc_p)
				end if
				if isnull(ls_num_p) then 
					ls_num_p		= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'numero_particular',ls_num_p)
				end if
				if isnull(ls_depto_p) then 
					ls_depto_p	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'depto_particular',ls_depto_p)
				end if
				if isnull(ls_block_p) then 
					ls_block_p	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'block_particular',ls_block_p)
				end if
				if isnull(ls_pobla) then 
					ls_pobla		= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'poblacion',ls_pobla)
				end if
				if isnull(ls_sector) then 
					ls_sector	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'sector',ls_sector)
				end if
				if isnull(ls_ciudad_p) then 
					ls_ciudad_p	= '0'
					dw_lista_ugn_mc.setitem(ll_indi,'ciudad',ls_ciudad_p)
				end if
				if isnull(ls_comuna_p) then 
					ls_comuna_p	= '0'
					dw_lista_ugn_mc.setitem(ll_indi,'ciudad',ls_comuna_p)
				end if
				if isnull(ls_dirr_c) then 
					ls_dirr_c	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'domicilio_c',ls_dirr_c)
				end if
				if isnull(ls_num_c) then 
					ls_num_c		= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'numero_comercial',ls_num_c)
				end if
				if isnull(ls_ciudad_c) then 
					ls_ciudad_c	= '0'
					dw_lista_ugn_mc.setitem(ll_indi,'ciudad_comercial',ls_ciudad_c)
				end if
				if isnull(ls_comuna_c) then 
					ls_comuna_c	= '0'
					dw_lista_ugn_mc.setitem(ll_indi,'comuna_comercial',ls_comuna_c)
				end if
				dw_lista_ugn_mc.setitem(ll_indi,'grupo',ll_grupo)
				if isnull(ls_nombre) or ls_nombre='' then
					messagebox("Advertencia","Debe Ingresar Nombre en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('nombre')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_ap_pat) or ls_ap_pat='' then
					messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('a_paterno')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_ap_mat) or ls_ap_mat='' then
					messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('a_materno')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_fono_p) or ls_fono_p='' then
					messagebox("Advertencia","Debe Ingresar Fono Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('fono_p')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_celular) or ls_celular='' then
					messagebox("Advertencia","Debe Ingresar Celular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('celular')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_fono_c) or ls_fono_c='' then
					messagebox("Advertencia","Debe Ingresar Fono Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('fono_c')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_email) or ls_email='' then
					messagebox("Advertencia","Debe Ingresar Correo Electronico en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('email')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_tipo_v) or ls_tipo_v='' then
					messagebox("Advertencia","Debe Ingresar Tipo de Via en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('tipo_via')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_direc_p) or ls_direc_p='' then
					messagebox("Advertencia","Debe Ingresar Dirección Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('direccion_p')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_num_p) or ls_num_p='' then
					messagebox("Advertencia","Debe Ingresar Número Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('numero_particular')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_depto_p) or ls_depto_p='' then
					messagebox("Advertencia","Debe Ingresar Departamento Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('depto_particular')
					ls_pasa		= 'N'
					exit	
				elseif isnull(ls_block_p) or ls_block_p='' then
					messagebox("Advertencia","Debe Ingresar Block Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('block_particular')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_pobla) or ls_pobla='' then
					messagebox("Advertencia","Debe Ingresar Población Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('poblacion')
					ls_pasa		= 'N'
					exit		
				elseif isnull(ls_sector) or ls_sector='' then
					messagebox("Advertencia","Debe Ingresar Sector Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('sector')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_ciudad_p) or ls_ciudad_p='' then
					messagebox("Advertencia","Debe Ingresar Ciudad Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('ciudad')
					ls_pasa		= 'N'
					exit				
				elseif isnull(ls_comuna_p) or ls_comuna_p='' then
					messagebox("Advertencia","Debe Ingresar Comuna Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('comuna')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_dirr_c) or ls_dirr_c='' then
					messagebox("Advertencia","Debe Ingresar Dirección Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('domicilio_c')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_num_c) or ls_num_c='' then
					messagebox("Advertencia","Debe Ingresar Número Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('numero_comercial')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_ciudad_c) or ls_ciudad_c='' then
					messagebox("Advertencia","Debe Ingresar Ciudad Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('ciudad_comercial')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_comuna_c) or ls_comuna_c='' then
					messagebox("Advertencia","Debe Ingresar Ciudad Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('comuna_comercial')
					ls_pasa		= 'N'
					exit
				else
					dw_lista_ugn_mc.accepttext()
					ls_pasa = 'S'
				end if
			elseif ll_est_rut= 1 and isnull(ll_rut) and isnull(ls_dv) then
				ls_nombre		= dw_lista_ugn_mc.getitemstring(ll_indi,'nombre')
				ls_ap_pat		= dw_lista_ugn_mc.getitemstring(ll_indi,'a_paterno')
				ls_ap_mat		= dw_lista_ugn_mc.getitemstring(ll_indi,'a_materno')
				ls_fono_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'fono_p')
				ls_celular		= dw_lista_ugn_mc.getitemstring(ll_indi,'celular')
				ls_fono_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'fono_c')
				ls_email			= dw_lista_ugn_mc.getitemstring(ll_indi,'email')
				ls_tipo_v			= dw_lista_ugn_mc.getitemstring(ll_indi,'tipo_via')
				ls_direc_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'direccion_p')
				ls_num_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'numero_particular')
				ls_depto_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'depto_particular')
				ls_block_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'block_particular')
				ls_pobla			= dw_lista_ugn_mc.getitemstring(ll_indi,'poblacion')
				ls_sector			= dw_lista_ugn_mc.getitemstring(ll_indi,'sector')
				ls_ciudad_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'ciudad')
				ls_comuna_p	= dw_lista_ugn_mc.getitemstring(ll_indi,'comuna')
				ls_dirr_c			= dw_lista_ugn_mc.getitemstring(ll_indi,'domicilio_c')
				ls_num_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'numero_comercial')
				ls_ciudad_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'ciudad_comercial')
				ls_comuna_c	= dw_lista_ugn_mc.getitemstring(ll_indi,'comuna_comercial')
				if isnull(ls_fono_c) then 
					ls_fono_c	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'fono_c',ls_fono_c)
				end if
				if isnull(ls_email) then 
					ls_email		= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'email',ls_email)
				end if
				if isnull(ls_tipo_v) then 
					ls_tipo_v	= '0'
					dw_lista_ugn_mc.setitem(ll_indi,'tipo_via',ls_tipo_v)
				end if
				if isnull(ls_direc_p) then 
					ls_direc_p	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'direccion_p',ls_direc_p)
				end if
				if isnull(ls_num_p) then 
					ls_num_p		= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'numero_particular',ls_num_p)
				end if
				if isnull(ls_depto_p) then 
					ls_depto_p	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'depto_particular',ls_depto_p)
				end if
				if isnull(ls_block_p) then 
					ls_block_p	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'block_particular',ls_block_p)
				end if
				if isnull(ls_pobla) then 
					ls_pobla		= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'poblacion',ls_pobla)
				end if
				if isnull(ls_sector) then 
					ls_sector	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'sector',ls_sector)
				end if
				if isnull(ls_ciudad_p) then 
					ls_ciudad_p	= '0'
					dw_lista_ugn_mc.setitem(ll_indi,'ciudad',ls_ciudad_p)
				end if
				if isnull(ls_comuna_p) then 
					ls_comuna_p	= '0'
					dw_lista_ugn_mc.setitem(ll_indi,'ciudad',ls_comuna_p)
				end if
				if isnull(ls_dirr_c) then 
					ls_dirr_c	= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'domicilio_c',ls_dirr_c)
				end if
				if isnull(ls_num_c) then 
					ls_num_c		= '-'
					dw_lista_ugn_mc.setitem(ll_indi,'numero_comercial',ls_num_c)
				end if
				if isnull(ls_ciudad_c) then 
					ls_ciudad_c	= '0'
					dw_lista_ugn_mc.setitem(ll_indi,'ciudad_comercial',ls_ciudad_c)
				end if
				if isnull(ls_comuna_c) then 
					ls_comuna_c	= '0'
					dw_lista_ugn_mc.setitem(ll_indi,'comuna_comercial',ls_comuna_c)
				end if
				//dw_lista_ugn_mc.setitem(ll_indi,'grupo',ll_grupo)
				if isnull(ls_nombre) or ls_nombre='' then
					messagebox("Advertencia","Debe Ingresar Nombre en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('nombre')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_ap_pat) or ls_ap_pat='' then
					messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('a_paterno')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_ap_mat) or ls_ap_mat='' then
					messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('a_materno')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_fono_p) or ls_fono_p='' then
					messagebox("Advertencia","Debe Ingresar Fono Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('fono_p')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_celular) or ls_celular='' then
					messagebox("Advertencia","Debe Ingresar Celular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('celular')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_fono_c) or ls_fono_c='' then
					messagebox("Advertencia","Debe Ingresar Fono Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('fono_c')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_email) or ls_email='' then
					messagebox("Advertencia","Debe Ingresar Correo Electronico en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('email')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_tipo_v) or ls_tipo_v='' then
					messagebox("Advertencia","Debe Ingresar Tipo de Via en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('tipo_via')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_direc_p) or ls_direc_p='' then
					messagebox("Advertencia","Debe Ingresar Dirección Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('direccion_p')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_num_p) or ls_num_p='' then
					messagebox("Advertencia","Debe Ingresar Número Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('numero_particular')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_depto_p) or ls_depto_p='' then
					messagebox("Advertencia","Debe Ingresar Departamento Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('depto_particular')
					ls_pasa		= 'N'
					exit	
				elseif isnull(ls_block_p) or ls_block_p='' then
					messagebox("Advertencia","Debe Ingresar Block Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('block_particular')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_pobla) or ls_pobla='' then
					messagebox("Advertencia","Debe Ingresar Población Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('poblacion')
					ls_pasa		= 'N'
					exit		
				elseif isnull(ls_sector) or ls_sector='' then
					messagebox("Advertencia","Debe Ingresar Sector Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('sector')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_ciudad_p) or ls_ciudad_p='' then
					messagebox("Advertencia","Debe Ingresar Ciudad Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('ciudad')
					ls_pasa		= 'N'
					exit				
				elseif isnull(ls_comuna_p) or ls_comuna_p='' then
					messagebox("Advertencia","Debe Ingresar Comuna Particular en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('comuna')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_dirr_c) or ls_dirr_c='' then
					messagebox("Advertencia","Debe Ingresar Dirección Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('domicilio_c')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_num_c) or ls_num_c='' then
					messagebox("Advertencia","Debe Ingresar Número Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('numero_comercial')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_ciudad_c) or ls_ciudad_c='' then
					messagebox("Advertencia","Debe Ingresar Ciudad Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('ciudad_comercial')
					ls_pasa		= 'N'
					exit
				elseif isnull(ls_comuna_c) or ls_comuna_c='' then
					messagebox("Advertencia","Debe Ingresar Ciudad Comercial en Fila Nº "+string(ll_indi,'###,###,##0'))
					dw_lista_ugn_mc.setfocus()
					dw_lista_ugn_mc.scrolltorow(ll_indi)
					dw_lista_ugn_mc.setcolumn('comuna_comercial')
					ls_pasa		= 'N'
					exit
				else
					dw_lista_ugn_mc.accepttext()
					ls_pasa = 'S'
				end if
			end if	
		next
	end if
	if ls_pasa = 'S' then
		ll_new				= dw_lista_ugn_mc.insertrow(0)
		dw_lista_ugn_mc.scrolltorow(ll_new)
		dw_lista_ugn_mc.accepttext()
		dw_lista_ugn_mc.setfocus()
		dw_lista_ugn_mc.scrolltorow(ll_new)
		dw_lista_ugn_mc.setcolumn('nombre')
		if is_modif = 'S' then
			dw_lista_ugn_mc.setitem(ll_new,'grupo',il_grupo)
			dw_lista_ugn_mc.setitem(ll_new,'correlativo',ll_new)
		end if
		
		cb_grabar.enabled	= true
		
		dw_lista_ugn_mc.getchild('comuna',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle.insertrow(0)
		dw_lista_ugn_mc.getchild('comuna_comercial',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		idw_detalle2.insertrow(0)
		if not isnull(ls_ciudad_p) and ls_ciudad_p<>'' then
			idw_detalle.retrieve(ls_ciudad_p)
		elseif not isnull(ls_ciudad_c) and ls_ciudad_c<>'' then
			idw_detalle2.retrieve(ls_ciudad_c)
		end if
		dw_lista_ugn_mc.setitem(ll_new,'estado_rut',1)
		dw_lista_ugn_mc.accepttext()
		
	end if
else
	messagebox("Advertencia","Recuerde para Ingresar Prospectos debe Seleccionar Tipo ORIGEN CONDOLENCIA")
end if
end event

event losefocus;//Long		ll_new,ll_tot_reg,ll_indi,ll_grupo,ll_rut
//String	ls_nombre,ls_ap_pat,ls_pasa='S',ls_ap_mat,ls_fono_p,ls_celular,ls_fono_c,ls_email,&
//			ls_tipo_v,ls_direc_p,ls_num_p,ls_block_p,ls_pobla,ls_sector,ls_ciudad_p,ls_comuna_p,&
//			ls_dirr_c,ls_num_c,ls_ciudad_c,ls_depto_p,ls_comuna_c,ls_dv
//
//dw_lista_ugn_mc.accepttext()
//SELECT 	MAX("UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO")  
//INTO 		:ll_grupo  
//FROM 		"UGN_CLIENTE_ASIGNAR_FALLE"  
//USING 	sqlca;
//if sqlca.sqlcode = 0 then
//	if isnull(ll_grupo) then ll_grupo = 0
//	dw_lista_ugn_mc.setitem(1,'grupo',ll_grupo)
//else
//	messagebox("Error","No se Pudo Conectar")
//end if
//
//ll_tot_reg	= dw_lista_ugn_mc.rowcount()
//
//dw_lista_ugn_mc.setitem(ll_indi,'grupo',ll_grupo)
//
//if ll_tot_reg > 0 then
//	for ll_indi=1 to ll_tot_reg
//	ll_rut			= dw_lista_ugn_mc.getitemnumber(ll_indi,'rut')
//	ls_dv				= dw_lista_ugn_mc.getitemstring(ll_indi,'dv')
//	dw_lista_ugn_mc.setitem(ll_indi,'correlativo',ll_indi)
//		if ll_rut > 0  and not isnull(ls_dv) then
//			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
//				messagebox('Error','Rut Inválido en Fila Nº'+string(ll_indi,'###,###,##0'),stopsign!)
//				cb_grabar.enabled				= false
//				dw_lista_ugn_mc.setfocus()
//				dw_lista_ugn_mc.setcolumn('dv')
//			end if
//		end if
//		ls_nombre		= dw_lista_ugn_mc.getitemstring(ll_indi,'nombre')
//		ls_ap_pat		= dw_lista_ugn_mc.getitemstring(ll_indi,'a_paterno')
//		ls_ap_mat		= dw_lista_ugn_mc.getitemstring(ll_indi,'a_materno')
//		ls_fono_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'fono_p')
//		ls_celular		= dw_lista_ugn_mc.getitemstring(ll_indi,'celular')
//		ls_fono_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'fono_c')
//		ls_email			= dw_lista_ugn_mc.getitemstring(ll_indi,'email')
//		ls_tipo_v			= dw_lista_ugn_mc.getitemstring(ll_indi,'tipo_via')
//		ls_direc_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'direccion_p')
//		ls_num_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'numero_particular')
//		ls_depto_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'depto_particular')
//		ls_block_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'block_particular')
//		ls_pobla			= dw_lista_ugn_mc.getitemstring(ll_indi,'poblacion')
//		ls_sector			= dw_lista_ugn_mc.getitemstring(ll_indi,'sector')
//		ls_ciudad_p		= dw_lista_ugn_mc.getitemstring(ll_indi,'ciudad')
//		ls_comuna_p	= dw_lista_ugn_mc.getitemstring(ll_indi,'comuna')
//		ls_dirr_c			= dw_lista_ugn_mc.getitemstring(ll_indi,'domicilio_c')
//		ls_num_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'numero_comercial')
//		ls_ciudad_c		= dw_lista_ugn_mc.getitemstring(ll_indi,'ciudad_comercial')
//		ls_comuna_c	= dw_lista_ugn_mc.getitemstring(ll_indi,'comuna_comercial')
//		dw_lista_ugn_mc.setitem(ll_indi,'grupo',ll_grupo)
//	next
//end if
//if ls_pasa = 'S' then
//	
////	dw_lista_ugn_mc.setitem(ll_new,'usuario',gs_user)
////	dw_lista_ugn_mc.setitem(ll_new,'estado_rut',1)
//	dw_lista_ugn_mc.accepttext()
//	dw_lista_ugn_mc.setfocus()
//	dw_lista_ugn_mc.scrolltorow(ll_new)
//	dw_lista_ugn_mc.setcolumn('nombre')
//	cb_grabar.enabled	= true
//end if
end event

type gb_5 from groupbox within w_lista_ugn_maestro_condo_2
integer x = 1093
integer y = 156
integer width = 1211
integer height = 224
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango de Fechas"
end type

type fec_fin_ugn_falle from editmask within w_lista_ugn_maestro_condo_2
integer x = 1856
integer y = 248
integer width = 325
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type p_2 from picture within w_lista_ugn_maestro_condo_2
integer x = 2185
integer y = 248
integer width = 78
integer height = 80
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(fec_fin_ugn_falle.text)=-1 then 
	fec_fin_ugn_falle.text=string(today(),gs_formato_fecha)
	fec_fin_ugn_falle.setfocus()
	return
end if 
if fec_fin_ugn_falle.text<>'00/00/0000' then
	ls_fecha = fec_fin_ugn_falle.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(fec_fin_ugn_falle.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		fec_fin_ugn_falle.setfocus()
		return
	else 
		fec_fin_ugn_falle.text = Message.StringParm
	end if 
END IF
end event

type st_2 from statictext within w_lista_ugn_maestro_condo_2
integer x = 1687
integer y = 256
integer width = 137
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type fec_ini_ugn_falle from editmask within w_lista_ugn_maestro_condo_2
integer x = 1253
integer y = 248
integer width = 325
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type p_1 from picture within w_lista_ugn_maestro_condo_2
integer x = 1586
integer y = 248
integer width = 78
integer height = 80
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
long		uf

if f_valida_fecha(fec_ini_ugn_falle.text)=-1 then 
	fec_ini_ugn_falle.text=string(today(),gs_formato_fecha)
	fec_ini_ugn_falle.setfocus()
	return
end if 
if fec_ini_ugn_falle.text<>'00/00/0000' then
	ls_fecha = fec_ini_ugn_falle.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

if Message.StringParm <> ls_fecha THEN
	if DATE(Message.StringParm)>DATE(fec_ini_ugn_falle.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		fec_ini_ugn_falle.setfocus()
		return
	else 
		fec_ini_ugn_falle.text = Message.StringParm
	end if 
end if
end event

type gb_1 from groupbox within w_lista_ugn_maestro_condo_2
integer x = 1650
integer y = 2480
integer width = 1367
integer height = 148
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_parque from datawindow within w_lista_ugn_maestro_condo_2
integer x = 69
integer y = 240
integer width = 974
integer height = 100
integer taborder = 10
string title = "none"
string dataobject = "dwe_parque_condolencias"
boolean border = false
boolean livescroll = true
end type

type dw_convenio from datawindow within w_lista_ugn_maestro_condo_2
integer x = 64
integer y = 228
integer width = 965
integer height = 120
integer taborder = 20
string title = "none"
string dataobject = "dwe_seleccionar_convenio"
boolean border = false
boolean livescroll = true
end type

type gb_3 from groupbox within w_lista_ugn_maestro_condo_2
integer x = 27
integer y = 156
integer width = 1029
integer height = 224
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque ~"Condolencia~""
end type

type gb_2 from groupbox within w_lista_ugn_maestro_condo_2
integer x = 27
integer y = 156
integer width = 1029
integer height = 224
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado de Convenios UGN"
end type

