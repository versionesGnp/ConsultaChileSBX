forward
global type w_sol_carta_autoriza_grab_lapida from window
end type
type cb_graba_todo from commandbutton within w_sol_carta_autoriza_grab_lapida
end type
type dw_print_titular from datawindow within w_sol_carta_autoriza_grab_lapida
end type
type cb_imprimir from commandbutton within w_sol_carta_autoriza_grab_lapida
end type
type cb_cerrar from commandbutton within w_sol_carta_autoriza_grab_lapida
end type
type tab_1 from tab within w_sol_carta_autoriza_grab_lapida
end type
type tabpage_1 from userobject within tab_1
end type
type pb_fin from picturebutton within tabpage_1
end type
type pb_antes from picturebutton within tabpage_1
end type
type pb_sigue from picturebutton within tabpage_1
end type
type pb_primer from picturebutton within tabpage_1
end type
type cb_limpiar from commandbutton within tabpage_1
end type
type cb_buscar from commandbutton within tabpage_1
end type
type cb_grabar from commandbutton within tabpage_1
end type
type dw_lista from datawindow within tabpage_1
end type
type gb_1 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
pb_fin pb_fin
pb_antes pb_antes
pb_sigue pb_sigue
pb_primer pb_primer
cb_limpiar cb_limpiar
cb_buscar cb_buscar
cb_grabar cb_grabar
dw_lista dw_lista
gb_1 gb_1
end type
type tabpage_2 from userobject within tab_1
end type
type pb_4 from picturebutton within tabpage_2
end type
type pb_3 from picturebutton within tabpage_2
end type
type pb_2 from picturebutton within tabpage_2
end type
type pb_1 from picturebutton within tabpage_2
end type
type cb_recep_lapida from commandbutton within tabpage_2
end type
type cb_crear from commandbutton within tabpage_2
end type
type cb_2 from commandbutton within tabpage_2
end type
type cb_1 from commandbutton within tabpage_2
end type
type cb_nueva from commandbutton within tabpage_2
end type
type dw_lista_lapida from datawindow within tabpage_2
end type
type gb_2 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
cb_recep_lapida cb_recep_lapida
cb_crear cb_crear
cb_2 cb_2
cb_1 cb_1
cb_nueva cb_nueva
dw_lista_lapida dw_lista_lapida
gb_2 gb_2
end type
type tab_1 from tab within w_sol_carta_autoriza_grab_lapida
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type pb_ok from picturebutton within w_sol_carta_autoriza_grab_lapida
end type
type dw_parque from datawindow within w_sol_carta_autoriza_grab_lapida
end type
type st_16 from statictext within w_sol_carta_autoriza_grab_lapida
end type
type dw_buscar from datawindow within w_sol_carta_autoriza_grab_lapida
end type
end forward

global type w_sol_carta_autoriza_grab_lapida from window
integer width = 3506
integer height = 2916
boolean titlebar = true
string title = "Carta Autorizacion y Grabación de Lapida"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_graba_todo cb_graba_todo
dw_print_titular dw_print_titular
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
tab_1 tab_1
pb_ok pb_ok
dw_parque dw_parque
st_16 st_16
dw_buscar dw_buscar
end type
global w_sol_carta_autoriza_grab_lapida w_sol_carta_autoriza_grab_lapida

type variables
String	is_dv,is_nombre,is_ap_pat,is_ap_mat,is_tipo_via,is_direc,is_depto,is_block,is_sector_tit,&
			is_pob_tit,is_nro,is_fono_par,is_fono_com
Long		il_rut,il_modif,il_sw,il_modif_lapida
datawindowchild			idw_detalle5,idw_detalle6,idw_detalle7,idw_detalle8
end variables

forward prototypes
public function string wf_valida_largo_nombre (long al_largo, string as_columna)
end prototypes

public function string wf_valida_largo_nombre (long al_largo, string as_columna);string ls_pasa='S'

if il_sw > 0 then
	if al_largo > 32 and as_columna='nombre_fallecido_lapida' then
		messagebox('Advertencia','No puede Ingresar más de 32 Caracteres en Nombre')
		tab_1.tabpage_2.dw_lista_lapida.setitem(1,'nombre_fallecido_lapida',is_nombre)
		tab_1.tabpage_2.dw_lista_lapida.setfocus()
		tab_1.tabpage_2.dw_lista_lapida.setcolumn('nombre_fallecido_lapida')
		ls_pasa	= 'N'
		il_sw		= 0
	end if	
	tab_1.tabpage_2.dw_lista_lapida.accepttext()
end if
return ls_pasa
end function

on w_sol_carta_autoriza_grab_lapida.create
this.cb_graba_todo=create cb_graba_todo
this.dw_print_titular=create dw_print_titular
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.tab_1=create tab_1
this.pb_ok=create pb_ok
this.dw_parque=create dw_parque
this.st_16=create st_16
this.dw_buscar=create dw_buscar
this.Control[]={this.cb_graba_todo,&
this.dw_print_titular,&
this.cb_imprimir,&
this.cb_cerrar,&
this.tab_1,&
this.pb_ok,&
this.dw_parque,&
this.st_16,&
this.dw_buscar}
end on

on w_sol_carta_autoriza_grab_lapida.destroy
destroy(this.cb_graba_todo)
destroy(this.dw_print_titular)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.tab_1)
destroy(this.pb_ok)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.dw_buscar)
end on

event open;Long	ll_new
gf_centrar(w_sol_carta_autoriza_grab_lapida)
il_modif			= 0
il_modif_lapida	= 0
dw_print_titular.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_buscar.settransobject(sqlca)
dw_buscar.getchild('sepultura',idw_detalle6)
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

dw_buscar.getchild('sector',idw_detalle5)
idw_detalle5.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(1,'cod_parque',1)
	idw_detalle5.retrieve(1)
elseif gs_conexion = "Parque La Foresta" then
	dw_parque.setitem(1,'cod_parque',11)
	idw_detalle5.retrieve(11)
end if
ll_new		= dw_buscar.insertrow(0)
dw_buscar.accepttext()
tab_1.tabpage_1.dw_lista.settransobject(sqlca)
tab_1.tabpage_1.dw_lista.insertrow(0)
tab_1.tabpage_2.dw_lista_lapida.settransobject(sqlca)
tab_1.tabpage_2.dw_lista_lapida.insertrow(0)

//dw_print.settransobject(sqlca)
//dw_solicitud.settransobject(sqlca)



end event

type cb_graba_todo from commandbutton within w_sol_carta_autoriza_grab_lapida
integer x = 37
integer y = 2648
integer width = 343
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;String	ls_nom_lap,ls_prim_sep,ls_tipo_con,ls_pasa = 'S'
Long		ll_imagen,ll_indi,ll_tot_reg,ll_corr,ll_new,ll_new_lap
Datetime	ldt_fec_nac,ldt_fec_def

Long		ll_tipo_carta,ll_rut
String		ls_cod_parent,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_depto,&
			ls_block,ls_sector_tit,ls_pob_tit,ls_nro,ls_fono_p,ls_fono_c,ls_estado_r,ls_sector,ls_sepultura

tab_1.tabpage_1.dw_lista.accepttext()
ll_tot_reg			= tab_1.tabpage_1.dw_lista.rowcount()
if ll_tot_reg > 0 then
	ls_pasa				= 'S'
	for ll_indi=1 to ll_tot_reg
		ls_cod_parent	= tab_1.tabpage_1.dw_lista.Getitemstring(ll_indi,'cod_parentesco_autoriza')
		ll_rut				= tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'rut_titular')
		ls_dv				= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'dv_titular')
		ls_nombre		= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'nombre_titular')
		ls_ap_pat		= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'apellido_paterno_titular')
		ls_ap_mat		= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'apellido_materno_titular')
		ls_tipo_via		= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'tipo_via_titular')
		ls_direc			= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'direccion_titular')
		ls_nro				= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'numero_direccion_titular')
		ls_depto			= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'depto_direccion_titular')
		ls_block			= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'block_direccion_titular')
		ls_sector_tit		= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'sector_titular')
		ls_pob_tit		= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'poblacion_villa_titular')
		ls_fono_p		= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'fono_particular_titular')
		ls_fono_c		= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'fono_comercial_titular')
		ll_tipo_carta		= tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'tipo_formato_carta')
		ls_sector			= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'sector')
		ls_sepultura		= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'sepultura')
		ls_estado_r		= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'estado_reg')
		if ls_estado_r = 'P' then
			if isnull(ls_cod_parent) or ls_cod_parent='' then
				messagebox("Advertencia","Debe Seleccionar PARENTESCO en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('cod_parentesco_autoriza')
				ls_pasa		= 'N'
				exit
			elseif isnull(ll_tipo_carta) or ll_tipo_carta = 0 then
				messagebox("Advertencia","Debe Ingresar Tipo Carta en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('tipo_formato_carta')
				ls_pasa		= 'N'
				exit
			elseif isnull(ll_rut) or ll_rut=0 then
				messagebox("Advertencia","Debe Ingresar RUT en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('rut_titular')
				ls_pasa		= 'N'
				exit	
			elseif isnull(ls_dv) or ls_dv='' or ls_dv='-' then
				messagebox("Advertencia","Debe Ingresar DIGITO VERIFICADOR en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('dv_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_nombre) or ls_nombre='' or ls_nombre='-' then
				messagebox("Advertencia","Debe Ingresar NOMBRE en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('nombre_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_pat) or ls_ap_pat='' or ls_ap_pat='-' then
				messagebox("Advertencia","Debe Ingresar APELLIDO PATERNO en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('apellido_paterno_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_mat) or ls_ap_mat='' then
				messagebox("Advertencia","Debe Ingresar APELLIDO MATERNO en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('apellido_materno_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_tipo_via) or ls_tipo_via='' then
				messagebox("Advertencia","Debe Ingresar TIPO VIA en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('tipo_via_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_direc) or ls_direc='' then
				messagebox("Advertencia","Debe Ingresar DIRECCION en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('direccion_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_nro) or ls_nro='' then
				messagebox("Advertencia","Debe Ingresar NUMERO en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('numero_direccion_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_depto) or ls_depto='' then
				messagebox("Advertencia","Debe Ingresar DEPARTAMENTO en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('depto_direccion_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_block) or ls_block='' then
				messagebox("Advertencia","Debe Ingresar BLOCK en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('block_direccion_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_sector_tit) or ls_sector_tit='' then
				messagebox("Advertencia","Debe Ingresar SECTOR en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('sector_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_pob_tit) or ls_pob_tit='' then
				messagebox("Advertencia","Debe Ingresar POBLACION O VILLA en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('poblacion_villa_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fono_p) or ls_fono_p='' then
				messagebox("Advertencia","Debe Ingresar FONO PARTICULAR en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('fono_particular_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fono_c) or ls_fono_c='' then
				messagebox("Advertencia","Debe Ingresar FONO COMERCIAL en Carta Autorización Nº "+string(ll_indi))
				tab_1.tabpage_1.dw_lista.scrolltorow(ll_indi)
				tab_1.tabpage_1.dw_lista.setfocus()
				tab_1.tabpage_1.dw_lista.setcolumn('fono_comercial_titular')
				ls_pasa		= 'N'
				exit
			end if
		end if	
	next
	
	SELECT count("FICHA_CARTA_SEPULTACION"."CORRELATIVO")
	INTO		:ll_corr
   	FROM 	"FICHA_CARTA_SEPULTACION"  
   	WHERE 	( "FICHA_CARTA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
        			( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :ls_sepultura )
	USING	 sqlca;
	if isnull(ll_corr) or ll_corr <= 1 then
		ll_corr	= 1
	else
		ll_corr	= ll_corr
	end if
	if ls_pasa = 'S' then
		ll_new			= tab_1.tabpage_1.dw_lista.getrow()	
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'correlativo',ll_corr)
		if tab_1.tabpage_1.dw_lista.update()=1 then
			commit;		
			tab_1.tabpage_2.dw_lista_lapida.accepttext()
			ll_indi			= tab_1.tabpage_2.dw_lista_lapida.getrow()
			ll_tot_reg	= tab_1.tabpage_2.dw_lista_lapida.rowcount()
			if ll_tot_reg>0 then
				for ll_indi = 1 to ll_tot_reg
					ls_nom_lap	= tab_1.tabpage_2.dw_lista_lapida.getitemstring(ll_indi,'nombre_fallecido_lapida')
					ldt_fec_nac	= tab_1.tabpage_2.dw_lista_lapida.getitemdatetime(ll_indi,'fecha_nacimiento_lapida')
					ldt_fec_def	= tab_1.tabpage_2.dw_lista_lapida.getitemdatetime(ll_indi,'fecha_defuncion_lapida')
					ll_imagen	= tab_1.tabpage_2.dw_lista_lapida.getitemnumber(ll_indi,'codigo_imagen')
					ls_prim_sep	= tab_1.tabpage_2.dw_lista_lapida.getitemstring(ll_indi,'primera_sepultura')
					ls_tipo_con	= tab_1.tabpage_2.dw_lista_lapida.getitemstring(ll_indi,'tipo_construccion')
					if isnull(ls_nom_lap) or ls_nom_lap='' or ls_nom_lap='-' then
						messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
						tab_1.tabpage_2.dw_lista_lapida.scrolltorow(ll_indi)
						tab_1.tabpage_2.dw_lista_lapida.setfocus()
						tab_1.tabpage_2.dw_lista_lapida.setcolumn('nombre_fallecido_lapida')
						ls_pasa = 'N'
						exit
					elseif isnull(ldt_fec_nac) then
						messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Fallecido")
						tab_1.tabpage_2.dw_lista_lapida.scrolltorow(ll_indi)
						tab_1.tabpage_2.dw_lista_lapida.setfocus()
						tab_1.tabpage_2.dw_lista_lapida.setcolumn('fecha_nacimiento_lapida')
						ls_pasa = 'N'
						exit
					elseif isnull(ldt_fec_def) then
						messagebox("Advertencia","Debe Ingresar Fecha Definción")
						tab_1.tabpage_2.dw_lista_lapida.scrolltorow(ll_indi)
						tab_1.tabpage_2.dw_lista_lapida.setfocus()
						tab_1.tabpage_2.dw_lista_lapida.setcolumn('fecha_defuncion_lapida')
						ls_pasa = 'N'
						exit
					elseif (ll_imagen=0 or isnull(ll_imagen)) and ls_prim_sep='S' then
						messagebox("Advertencia","Debe Ingresar Cuño Religioso")
						tab_1.tabpage_2.dw_lista_lapida.scrolltorow(ll_indi)
						tab_1.tabpage_2.dw_lista_lapida.setfocus()
						tab_1.tabpage_2.dw_lista_lapida.setcolumn('codigo_imagen')
						ls_pasa = 'N'
						exit
					elseif ls_prim_sep='' or isnull(ls_prim_sep) or ls_prim_sep='-' then
						messagebox("Advertencia","Debe Ingresar Opción de Sepultura")
						tab_1.tabpage_2.dw_lista_lapida.scrolltorow(ll_indi)
						tab_1.tabpage_2.dw_lista_lapida.setfocus()
						tab_1.tabpage_2.dw_lista_lapida.setcolumn('primera_sepultura')
					elseif ls_tipo_con='' or isnull(ls_tipo_con) then
						messagebox("Advertencia","Debe Ingresar Tipo Construcción")
						tab_1.tabpage_2.dw_lista_lapida.scrolltorow(ll_indi)
						tab_1.tabpage_2.dw_lista_lapida.setfocus()
						tab_1.tabpage_2.dw_lista_lapida.setcolumn('tipo_construccion')
						ls_pasa = 'N'
						exit
					end if
				next
				if ls_pasa = 'S' then
					ll_new_lap		= tab_1.tabpage_2.dw_lista_lapida.getrow()
					tab_1.tabpage_2.dw_lista_lapida.Setitem(ll_new_lap,'folio',ll_corr)
					if tab_1.tabpage_2.dw_lista_lapida.update()=1 then
						commit;
						messagebox("Grabar","Grabación Exitosa")
						il_modif_lapida	= 0
			//			if isvalid(w_mantenedor_estadistico) then 
			//				w_mantenedor_estadistico.setfocus()
			//				close(w_solicitud_grabacion_lapida)
			//			end if
						if isvalid(w_mantenedor_estadistico) then close(w_sol_carta_autoriza_grab_lapida)
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
					end if		
				end if
			end if			
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Carta Autorización SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type dw_print_titular from datawindow within w_sol_carta_autoriza_grab_lapida
boolean visible = false
integer x = 818
integer y = 2744
integer width = 1033
integer height = 400
string title = "none"
string dataobject = "dw_solicitud_grabacion_lapida_print"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_sol_carta_autoriza_grab_lapida
integer x = 443
integer y = 2648
integer width = 343
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;long ll_tot_reg_carta, ll_tot_reg_lapida,ll_row_carta,ll_row_lapida,ll_corr,ll_parque,ll_imagen,ll_tot_fila,ll_cod_parque,ll_tipo_carta,ll_folio,ll_corr_2
String	ls_sector,ls_sepul,ls_nombre_archivo,ls_sepultura,ls_dw
Datetime	ldt_fecha,ldt_fecha_sepult

if il_modif_lapida > 0 then
	messagebox("Advertencia","Existen Cambios, debe Grabar antes de Imprimir")
else
	ll_tot_reg_carta		= tab_1.tabpage_1.dw_lista.rowcount()
	ll_tot_reg_lapida		= tab_1.tabpage_2.dw_lista_lapida.rowcount()
	if ll_tot_reg_lapida > 0 and ll_tot_reg_carta >0 then
		ll_row_carta			= tab_1.tabpage_1.dw_lista.getrow()
		ll_row_lapida		= tab_1.tabpage_2.dw_lista_lapida.getrow()
		ll_corr_2				= tab_1.tabpage_2.dw_lista_lapida.getitemnumber(tab_1.tabpage_2.dw_lista_lapida.getrow(),'correlativo')
		TRY
			ll_corr				= tab_1.tabpage_2.dw_lista_lapida.getitemnumber(tab_1.tabpage_1.dw_lista.getrow(),'folio')
		CATCH ( runtimeerror er )
  			 ll_corr				= tab_1.tabpage_1.dw_lista.getitemnumber(tab_1.tabpage_1.dw_lista.getrow(),'correlativo')
		END TRY
		ll_parque				= tab_1.tabpage_2.dw_lista_lapida.getitemnumber(tab_1.tabpage_2.dw_lista_lapida.getrow(),'cod_parque')
		ls_sector				= tab_1.tabpage_2.dw_lista_lapida.getitemstring(tab_1.tabpage_2.dw_lista_lapida.getrow(),'sector')
		ls_sepul				= tab_1.tabpage_2.dw_lista_lapida.getitemstring(tab_1.tabpage_2.dw_lista_lapida.getrow(),'sepultura')
		ldt_fecha				= tab_1.tabpage_2.dw_lista_lapida.getitemdatetime(tab_1.tabpage_2.dw_lista_lapida.getrow(),'fecha_sepultacion')
		ll_tipo_carta			= tab_1.tabpage_1.dw_lista.getitemnumber(tab_1.tabpage_1.dw_lista.getrow(),'tipo_formato_carta')
		SELECT max("FICHA_CARTA_SEPULTACION"."FOLIO")
		INTO	:ll_folio
		FROM "FICHA_GRABACION_LAPIDA","FICHA_CARTA_SEPULTACION","TIPO_VIA","FICHA_TRASLADO","MEMBRETE_EMPRESA"  
			WHERE ( ficha_carta_sepultacion.correlativo = ficha_traslado.folio (+)) and  
			( ficha_carta_sepultacion.base = ficha_traslado.base_origen (+)) and  
			( ficha_carta_sepultacion.serie = ficha_traslado.serie_origen (+)) and  
			( ficha_carta_sepultacion.numero = ficha_traslado.numero_origen (+)) and  
			( ficha_carta_sepultacion.fecha_sepultacion = ficha_traslado.fecha_traslado (+)) and  
			( ficha_carta_sepultacion.cod_parque = ficha_traslado.cod_parque (+)) and  
			( "FICHA_GRABACION_LAPIDA"."SECTOR" = "FICHA_CARTA_SEPULTACION"."SECTOR" ) and  
			( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = "FICHA_CARTA_SEPULTACION"."SEPULTURA" ) and  
			( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = "FICHA_CARTA_SEPULTACION"."COD_PARQUE" ) and  
			( "FICHA_CARTA_SEPULTACION"."TIPO_VIA_TITULAR" = "TIPO_VIA"."TIPO_VIA" ) and  
			( "FICHA_GRABACION_LAPIDA"."FOLIO" = "FICHA_CARTA_SEPULTACION"."CORRELATIVO" ) and  
			( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = "MEMBRETE_EMPRESA"."COD_PARQUE" ) and  
			("FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector AND  
			"FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepul AND  
			"FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque AND
			"FICHA_GRABACION_LAPIDA"."FECHA_SEPULTACION" = :ldt_fecha AND
			"FICHA_CARTA_SEPULTACION"."CORRELATIVO" = :ll_corr )
		USING sqlca;
		IF 	ll_folio = 0 then
			ll_folio			= tab_1.tabpage_2.dw_lista_lapida.getitemnumber(tab_1.tabpage_2.dw_lista_lapida.getrow(),'correlativo')
			SELECT max("FICHA_CARTA_SEPULTACION"."FOLIO")
			INTO	:ll_folio
			FROM "FICHA_GRABACION_LAPIDA","FICHA_CARTA_SEPULTACION","TIPO_VIA","FICHA_TRASLADO","MEMBRETE_EMPRESA"  
				WHERE   ( ficha_carta_sepultacion.correlativo = ficha_traslado.folio (+)) and  
						( ficha_carta_sepultacion.base = ficha_traslado.base_origen (+)) and  
						( ficha_carta_sepultacion.serie = ficha_traslado.serie_origen (+)) and  
						( ficha_carta_sepultacion.numero = ficha_traslado.numero_origen (+)) and  
						( ficha_carta_sepultacion.fecha_sepultacion = ficha_traslado.fecha_traslado (+)) and  
						( ficha_carta_sepultacion.cod_parque = ficha_traslado.cod_parque (+)) and  
						( "FICHA_GRABACION_LAPIDA"."SECTOR" = "FICHA_CARTA_SEPULTACION"."SECTOR" ) and  
						( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = "FICHA_CARTA_SEPULTACION"."SEPULTURA" ) and  
						( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = "FICHA_CARTA_SEPULTACION"."COD_PARQUE" ) and  
						( "FICHA_CARTA_SEPULTACION"."TIPO_VIA_TITULAR" = "TIPO_VIA"."TIPO_VIA" ) and  
						( "FICHA_GRABACION_LAPIDA"."FOLIO" = "FICHA_CARTA_SEPULTACION"."CORRELATIVO" ) and  
						( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = "MEMBRETE_EMPRESA"."COD_PARQUE" ) and  
						("FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector AND  
						"FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepul AND  
						"FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_parque AND
						"FICHA_GRABACION_LAPIDA"."FECHA_SEPULTACION" = :ldt_fecha and
						"FICHA_CARTA_SEPULTACION"."CORRELATIVO" = :ll_corr_2 )
						USING sqlca;
		END IF;
			if isnull(ll_folio) then ll_folio=1
			if ll_parque= 101 then
				SELECT 	"TIPO_CARTA_SOL_AUTORIZA_LAPIDA"."DW_PRINT"
				INTO		:ls_dw
				FROM 	"TIPO_CARTA_SOL_AUTORIZA_LAPIDA"  
				WHERE 	"TIPO_CARTA_SOL_AUTORIZA_LAPIDA"."CODIGO" = :ll_tipo_carta and
							"TIPO_CARTA_SOL_AUTORIZA_LAPIDA"."PARQUE" = :ll_parque ;
			else
				SELECT 	"TIPO_CARTA_SOL_AUTORIZA_LAPIDA"."DW_PRINT"
				INTO		:ls_dw
				FROM 	"TIPO_CARTA_SOL_AUTORIZA_LAPIDA"  
				WHERE 	"TIPO_CARTA_SOL_AUTORIZA_LAPIDA"."CODIGO" = :ll_tipo_carta and
							"TIPO_CARTA_SOL_AUTORIZA_LAPIDA"."PARQUE" <> 101 ;
			end if				
			if isnull(ls_dw) then 		
				dw_print_titular.dataobject = 'dw_solicitud_grabacion_lapida_print'
			else
				dw_print_titular.dataobject = ls_dw
			end if
			dw_print_titular.settransobject(sqlca)
			ll_tot_fila			= dw_print_titular.retrieve(ls_sector,ls_sepul,ll_parque,ldt_fecha,ll_folio)
			if dw_print_titular.rowcount() > 0 then 
				ll_imagen	= tab_1.tabpage_2.dw_lista_lapida.getitemnumber(tab_1.tabpage_2.dw_lista_lapida.getrow(),'codigo_imagen')
				SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
				INTO 		:ls_nombre_archivo  
				FROM 	"FICHA_CUNOS"  
				WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_imagen   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_print_titular.object.p_1.Filename 	= ls_nombre_archivo
				else
					dw_print_titular.object.p_1.Filename 	= ''
				end if
				f_Print( dw_print_titular )
				dw_print_titular.print()
			else
				messagebox("Advertencia","No Se pudo Imprimir")
			end if
	else
		if ll_tot_reg_carta = 0 then
			messagebox("Advertencia","No Registra Carta de Autorización de Sepultación")
		end if
	end if	
end if
end event

type cb_cerrar from commandbutton within w_sol_carta_autoriza_grab_lapida
integer x = 3072
integer y = 2648
integer width = 343
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_sol_carta_autoriza_grab_lapida)

end event

type tab_1 from tab within w_sol_carta_autoriza_grab_lapida
event create ( )
event destroy ( )
integer x = 32
integer y = 144
integer width = 3406
integer height = 2476
integer taborder = 40
integer textsize = -10
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
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3369
integer height = 2348
long backcolor = 67108864
string text = "Carta Autorización"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_fin pb_fin
pb_antes pb_antes
pb_sigue pb_sigue
pb_primer pb_primer
cb_limpiar cb_limpiar
cb_buscar cb_buscar
cb_grabar cb_grabar
dw_lista dw_lista
gb_1 gb_1
end type

on tabpage_1.create
this.pb_fin=create pb_fin
this.pb_antes=create pb_antes
this.pb_sigue=create pb_sigue
this.pb_primer=create pb_primer
this.cb_limpiar=create cb_limpiar
this.cb_buscar=create cb_buscar
this.cb_grabar=create cb_grabar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.pb_fin,&
this.pb_antes,&
this.pb_sigue,&
this.pb_primer,&
this.cb_limpiar,&
this.cb_buscar,&
this.cb_grabar,&
this.dw_lista,&
this.gb_1}
end on

on tabpage_1.destroy
destroy(this.pb_fin)
destroy(this.pb_antes)
destroy(this.pb_sigue)
destroy(this.pb_primer)
destroy(this.cb_limpiar)
destroy(this.cb_buscar)
destroy(this.cb_grabar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

type pb_fin from picturebutton within tabpage_1
integer x = 2537
integer y = 2196
integer width = 119
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount())
dw_lista.setfocus()
tab_1.tabpage_2.dw_lista_lapida.ScrollToRow(tab_1.tabpage_2.dw_lista_lapida.rowcount())
tab_1.tabpage_2.dw_lista_lapida.setfocus()

end event

type pb_antes from picturebutton within tabpage_1
integer x = 2423
integer y = 2196
integer width = 119
integer height = 88
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollNextPage( )
dw_lista.setfocus()
tab_1.tabpage_2.dw_lista_lapida.ScrollNextPage( )
tab_1.tabpage_2.dw_lista_lapida.setfocus()

end event

type pb_sigue from picturebutton within tabpage_1
integer x = 2299
integer y = 2196
integer width = 119
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollPriorPage( )
dw_lista.setfocus()
tab_1.tabpage_2.dw_lista_lapida.ScrollPriorPage( )
tab_1.tabpage_2.dw_lista_lapida.setfocus()

end event

type pb_primer from picturebutton within tabpage_1
integer x = 2176
integer y = 2196
integer width = 119
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
dw_lista.setfocus()
tab_1.tabpage_2.dw_lista_lapida.ScrollToRow(1)
tab_1.tabpage_2.dw_lista_lapida.setfocus()
end event

type cb_limpiar from commandbutton within tabpage_1
integer x = 1097
integer y = 2196
integer width = 302
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;string		ls_nulo,ls_est_reg
Long		ll_resp,ll_new,ll_new_lap

setnull(ls_nulo)
ll_new			= tab_1.tabpage_1.dw_lista.getrow()
ll_new_lap		= tab_1.tabpage_2.dw_lista_lapida.getrow()
ll_resp	= messagebox("ADVERTENCIA","Está seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then
	ls_est_reg					= tab_1.tabpage_1.dw_lista.getitemstring(ll_new,'estado_reg')
	if ls_est_reg <> 'G' then
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'rut_titular',ls_nulo)
	//	tab_1.tabpage_1.dw_lista.Setitem(ll_new,'dv_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'cod_parentesco_autoriza',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'nombre_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'apellido_paterno_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'apellido_materno_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'tipo_via_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'direccion_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'numero_direccion_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'depto_direccion_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'block_direccion_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'sector_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'poblacion_villa_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'fono_particular_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'fono_comercial_titular',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'ficha_sepultacion_rut_tercero',ls_nulo)
	//	tab_1.tabpage_1.dw_lista.Setitem(ll_new,'ficha_sepultacion_dv_tercero',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'ficha_sepultacion_nombre_tercero',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'ficha_sepultacion_ap_paterno_tercero',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'ficha_sepultacion_ap_materno_tercero',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'ficha_sepultacion_direccion_tercero',ls_nulo)
		tab_1.tabpage_1.dw_lista.Setitem(ll_new,'ficha_sepultacion_fono_tercero',ls_nulo)
		tab_1.tabpage_2.dw_lista_lapida.Setitem(ll_new_lap,'ficha_grabacion_lapida_familia',ls_nulo)
		tab_1.tabpage_2.dw_lista_lapida.Setitem(ll_new_lap,'nombre_fallecido_lapida',ls_nulo)
		tab_1.tabpage_2.dw_lista_lapida.Setitem(ll_new_lap,'ficha_grabacion_lapida_familia',ls_nulo)
		
	else
		messagebox("ADVERTENCIA","Carta Ya Gestionada, no es posible Limpiar Datos")
	end if	
//	dw_parque.reset()
//	//dw_print.reset()
//	dw_parque.insertrow(0)
//	dw_lista.reset()
//	dw_lista.insertrow(0)
//	dw_buscar.reset()
//	dw_buscar.getchild('sepultura',idw_detalle6)
//	idw_detalle6.settransobject(sqlca)
//	idw_detalle6.reset()
//	idw_detalle6.insertrow(0)
//	
//	dw_buscar.getchild('sector',idw_detalle5)
//	idw_detalle5.settransobject(sqlca)
//	if gs_conexion	= "Parque El Prado" then
//		dw_parque.setitem(1,'cod_parque',1)
//		idw_detalle5.retrieve(1)
//	elseif gs_conexion = "Parque La Foresta" then
//		dw_parque.setitem(1,'cod_parque',11)
//		idw_detalle5.retrieve(11)
//	end if
//	ll_new	= dw_buscar.insertrow(0)
//	dw_buscar.accepttext()
end if
tab_1.tabpage_1.dw_lista.setfocus()
end event

type cb_buscar from commandbutton within tabpage_1
boolean visible = false
integer x = 425
integer y = 2192
integer width = 443
integer height = 100
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Buscar Carta"
end type

event clicked;if isvalid(w_buscar_ficha) then close(w_buscar_ficha)
OpenWithParm(w_buscar_ficha, "CS")
end event

type cb_grabar from commandbutton within tabpage_1
boolean visible = false
integer x = 23
integer y = 2192
integer width = 311
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_indi,ll_tot_reg,ll_rut,ll_tipo_carta,ll_corr
String	ls_cod_parent,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_depto,&
			ls_block,ls_sector_tit,ls_pob_tit,ls_nro,ls_pasa,ls_fono_p,ls_fono_c,ls_estado_r,ls_sector,ls_sepultura

dw_lista.accepttext()
ll_tot_reg			= dw_lista.rowcount()
if ll_tot_reg > 0 then
	ls_pasa				= 'S'
	for ll_indi=1 to ll_tot_reg
		ls_cod_parent	= dw_lista.Getitemstring(ll_indi,'cod_parentesco_autoriza')
		ll_rut				= dw_lista.getitemnumber(ll_indi,'rut_titular')
		ls_dv				= dw_lista.getitemstring(ll_indi,'dv_titular')
		ls_nombre		= dw_lista.getitemstring(ll_indi,'nombre_titular')
		ls_ap_pat		= dw_lista.getitemstring(ll_indi,'apellido_paterno_titular')
		ls_ap_mat		= dw_lista.getitemstring(ll_indi,'apellido_materno_titular')
		ls_tipo_via		= dw_lista.getitemstring(ll_indi,'tipo_via_titular')
		ls_direc			= dw_lista.getitemstring(ll_indi,'direccion_titular')
		ls_nro				= dw_lista.getitemstring(ll_indi,'numero_direccion_titular')
		ls_depto			= dw_lista.getitemstring(ll_indi,'depto_direccion_titular')
		ls_block			= dw_lista.getitemstring(ll_indi,'block_direccion_titular')
		ls_sector_tit		= dw_lista.getitemstring(ll_indi,'sector_titular')
		ls_pob_tit		= dw_lista.getitemstring(ll_indi,'poblacion_villa_titular')
		ls_fono_p		= dw_lista.getitemstring(ll_indi,'fono_particular_titular')
		ls_fono_c		= dw_lista.getitemstring(ll_indi,'fono_comercial_titular')
		ll_tipo_carta		= dw_lista.getitemnumber(ll_indi,'tipo_formato_carta')
		ls_sector			= dw_lista.getitemstring(ll_indi,'sector')
		ls_sepultura		= dw_lista.getitemstring(ll_indi,'sepultura')
		ls_estado_r		= dw_lista.getitemstring(ll_indi,'estado_reg')
		
		if ls_estado_r = 'P' then
			if isnull(ls_cod_parent) or ls_cod_parent='' then
				messagebox("Advertencia","Debe Seleccionar PARENTESCO en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('cod_parentesco_autoriza')
				ls_pasa		= 'N'
				exit
			elseif isnull(ll_tipo_carta) or ll_tipo_carta = 0 then
				messagebox("Advertencia","Debe Ingresar Tipo Carta en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('tipo_formato_carta')
				ls_pasa		= 'N'
				exit
			elseif isnull(ll_rut) or ll_rut=0 then
				messagebox("Advertencia","Debe Ingresar RUT en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('rut_titular')
				ls_pasa		= 'N'
				exit	
			elseif isnull(ls_dv) or ls_dv='' or ls_dv='-' then
				messagebox("Advertencia","Debe Ingresar DIGITO VERIFICADOR en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('dv_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_nombre) or ls_nombre='' or ls_nombre='-' then
				messagebox("Advertencia","Debe Ingresar NOMBRE en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('nombre_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_pat) or ls_ap_pat='' or ls_ap_pat='-' then
				messagebox("Advertencia","Debe Ingresar APELLIDO PATERNO en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('apellido_paterno_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_mat) or ls_ap_mat='' then
				messagebox("Advertencia","Debe Ingresar APELLIDO MATERNO en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('apellido_materno_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_tipo_via) or ls_tipo_via='' then
				messagebox("Advertencia","Debe Ingresar TIPO VIA en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('tipo_via_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_direc) or ls_direc='' then
				messagebox("Advertencia","Debe Ingresar DIRECCION en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('direccion_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_nro) or ls_nro='' then
				messagebox("Advertencia","Debe Ingresar NUMERO en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('numero_direccion_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_depto) or ls_depto='' then
				messagebox("Advertencia","Debe Ingresar DEPARTAMENTO en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('depto_direccion_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_block) or ls_block='' then
				messagebox("Advertencia","Debe Ingresar BLOCK en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('block_direccion_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_sector_tit) or ls_sector_tit='' then
				messagebox("Advertencia","Debe Ingresar SECTOR en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('sector_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_pob_tit) or ls_pob_tit='' then
				messagebox("Advertencia","Debe Ingresar POBLACION O VILLA en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('poblacion_villa_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fono_p) or ls_fono_p='' then
				messagebox("Advertencia","Debe Ingresar FONO PARTICULAR en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('fono_particular_titular')
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fono_c) or ls_fono_c='' then
				messagebox("Advertencia","Debe Ingresar FONO COMERCIAL en Carta Autorización Nº "+string(ll_indi))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setfocus()
				dw_lista.setcolumn('fono_comercial_titular')
				ls_pasa		= 'N'
				exit
			end if
		end if	
	next
	if ls_pasa = 'S' then
		if dw_lista.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			if isvalid(w_mantenedor_estadistico) then close(w_carta_sepultacion)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Carta Autorización SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type dw_lista from datawindow within tabpage_1
integer x = 14
integer y = 44
integer width = 3355
integer height = 2080
integer taborder = 30
string title = "none"
string dataobject = "dw_ingreso_carta_autorizacion"
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_dv,ls_cod_pare,ls_nom,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,&
			ls_depto,ls_block,ls_sector,ls_pobl,ls_nro,ls_fono_part,ls_fono_com
Long		ll_indi,ll_tot_reg,ll_rut,ll_fila

ls_columna				= dwo.name
if ls_columna='t_copiar' then
//	if dw_lista.object.t_copiar.visible = true then
		ll_tot_reg		= dw_lista.rowcount()
		if ll_tot_reg > 1 then
			ll_fila		= row
			ll_rut		= dw_lista.getitemnumber(ll_fila,'rut_titular')
			ls_dv			= dw_lista.getitemstring(ll_fila,'dv_titular')
			ls_cod_pare	= dw_lista.getitemstring(ll_fila,'cod_parentesco_autoriza')
			ls_nom		= dw_lista.getitemstring(ll_fila,'nombre_titular')
			ls_ap_pat	= dw_lista.getitemstring(ll_fila,'apellido_paterno_titular')
			ls_ap_mat	= dw_lista.getitemstring(ll_fila,'apellido_materno_titular')
			ls_tipo_via	= dw_lista.getitemstring(ll_fila,'tipo_via_titular')
			ls_direc		= dw_lista.getitemstring(ll_fila,'direccion_titular')
			ls_nro		= dw_lista.getitemstring(ll_fila,'numero_direccion_titular')
			ls_depto		= dw_lista.getitemstring(ll_fila,'depto_direccion_titular')
			ls_block		= dw_lista.getitemstring(ll_fila,'block_direccion_titular')
			ls_sector	= dw_lista.getitemstring(ll_fila,'sector_titular')
			ls_pobl		= dw_lista.getitemstring(ll_fila,'poblacion_villa_titular')
			ls_fono_part= dw_lista.getitemstring(ll_fila,'fono_particular_titular')
			ls_fono_com	= dw_lista.getitemstring(ll_fila,'fono_comercial_titular')
			if ll_fila=ll_tot_reg then
				messagebox("Advertencia","No es Posible COPIAR, se encuentra Posicionado en el último Registro")
			else
				if ll_fila < ll_tot_reg then
					ll_fila ++
					il_modif ++
					for ll_indi=ll_fila to ll_tot_reg
						dw_lista.Setitem(ll_indi,'rut_titular',ll_rut)
						dw_lista.Setitem(ll_indi,'dv_titular',ls_dv)
						dw_lista.Setitem(ll_indi,'cod_parentesco_autoriza',ls_cod_pare)
						dw_lista.Setitem(ll_indi,'nombre_titular',ls_nom)
						dw_lista.Setitem(ll_indi,'apellido_paterno_titular',ls_ap_pat)
						dw_lista.Setitem(ll_indi,'apellido_materno_titular',ls_ap_mat)
						dw_lista.Setitem(ll_indi,'tipo_via_titular',ls_tipo_via)
						dw_lista.Setitem(ll_indi,'direccion_titular',ls_direc)
						dw_lista.Setitem(ll_indi,'numero_direccion_titular',ls_nro)
						dw_lista.Setitem(ll_indi,'depto_direccion_titular',ls_depto)
						dw_lista.Setitem(ll_indi,'block_direccion_titular',ls_block)
						dw_lista.Setitem(ll_indi,'sector_titular',ls_sector)
						dw_lista.Setitem(ll_indi,'poblacion_villa_titular',ls_pobl)
						dw_lista.Setitem(ll_indi,'fono_particular_titular',ls_fono_part)
						dw_lista.Setitem(ll_indi,'fono_comercial_titular',ls_fono_com)										
					next
				end if
			end if
		end if
//	end if
elseif  ls_columna='tipo_formato_carta_1' or ls_columna='tipo_formato_carta' then
	ll_tot_reg		= dw_lista.rowcount()
	if ll_tot_reg > 1 then
		dw_lista.Setitem(ll_indi,'tipo_via_titular','0')
		dw_lista.Setitem(ll_indi,'numero_direccion_titular','-')
		dw_lista.Setitem(ll_indi,'depto_direccion_titular','-')
		dw_lista.Setitem(ll_indi,'block_direccion_titular','-')
		dw_lista.Setitem(ll_indi,'sector_titular','-')
		dw_lista.Setitem(ll_indi,'poblacion_villa_titular','-')
		dw_lista.accepttext()
	end if	
end if
end event

event itemchanged;String	ls_columna,ls_dv,ls_cod_parentesco,ls_nulo,ls_sector,ls_sepultura,ls_dire_tit,ls_num_dire_tit,ls_depto_tit,ls_block_tit,ls_pobla_tit,ls_sector_dire_tit,ls_tipo_via_tit 
Long		ll_rut,ll_res,ll_nulo,ll_tipo_carta,ll_tipo_carta_1,ll_cod_parque,ll_scroll

this.accepttext()
il_modif ++
Setnull(ls_nulo);Setnull(ll_nulo)
ls_columna	= dwo.name
if ls_columna='rut_titular' or ls_columna='dv_titular' then
	ll_rut				= this.getitemnumber(this.getrow(),'rut_titular')
	ls_dv					= this.getitemstring(this.getrow(),'dv_titular')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
		else
			if ll_rut>0 and il_rut>0 then
				if ll_rut <> il_rut then
					ls_cod_parentesco	= this.Getitemstring(this.getrow(),'cod_parentesco_autoriza')
					if ls_cod_parentesco='19' then
						messagebox("Advertencia","Debe Seleccionar Parentesco quien Autoriza")
					end if
				else
					this.Setitem(this.getrow(),'rut_titular',il_rut)
					this.Setitem(this.getrow(),'dv_titular',is_dv)
					this.Setitem(this.getrow(),'nombre_titular',is_nombre)
					this.Setitem(this.getrow(),'apellido_paterno_titular',is_ap_pat)
					this.Setitem(this.getrow(),'apellido_materno_titular',is_ap_mat)
					this.Setitem(this.getrow(),'tipo_via_titular',is_tipo_via)
					this.Setitem(this.getrow(),'direccion_titular',is_direc)
					this.Setitem(this.getrow(),'numero_direccion_titular',is_nro)
					this.Setitem(this.getrow(),'depto_direccion_titular',is_depto)
					this.Setitem(this.getrow(),'block_direccion_titular',is_block)
					this.Setitem(this.getrow(),'sector_titular',is_sector_tit)
					this.Setitem(this.getrow(),'poblacion_villa_titular',is_pob_tit)
					this.Setitem(this.getrow(),'fono_particular_titular',is_fono_par)
					this.Setitem(this.getrow(),'fono_comercial_titular',is_fono_com)
				end if
			end if
		end if 
	end if
end if
if ls_columna='tipo_formato_carta_1' or ls_columna='tipo_formato_carta' then
//	ll_tot_reg		= dw_lista.rowcount()
	
	ll_tipo_carta		= dw_lista.getitemnumber(this.getrow(),'tipo_formato_carta')
	ll_tipo_carta_1		= dw_lista.getitemnumber(this.getrow(),'tipo_formato_carta_1')
		if ll_tipo_carta > 2 or ll_tipo_carta_1 > 2 then
			dw_lista.Setitem(this.getrow(),'tipo_via_titular','0')
			dw_lista.Setitem(this.getrow(),'numero_direccion_titular','-')
			dw_lista.Setitem(this.getrow(),'depto_direccion_titular','-')
			dw_lista.Setitem(this.getrow(),'block_direccion_titular','-')
			dw_lista.Setitem(this.getrow(),'sector_titular','-')
			dw_lista.Setitem(this.getrow(),'poblacion_villa_titular','-')
			//dw_lista.Setitem(this.getrow(),'fono_particular_titular','0')
			dw_lista.Setitem(this.getrow(),'fono_comercial_titular','0')
			dw_lista.accepttext()
		else
			ls_sector		= dw_buscar.getitemstring(1,'sector')
			ls_sepultura	= dw_buscar.getitemstring(1,'sepultura')
			ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
			if tab_1.tabpage_2.dw_lista_lapida.retrieve(ls_sector,ls_sepultura,ll_cod_parque)=0 then
				tab_1.tabpage_2.dw_lista_lapida.insertrow(0)
				messagebox("Advertencia","No Registra Dato Lapida")
			else
				SELECT "FICHA_SEPULTACION"."DIRECCION_TITULAR","FICHA_SEPULTACION"."NUM_DIRECCION_TITULAR", "FICHA_SEPULTACION"."DEPTO_DIRECCION_TITULAR","FICHA_SEPULTACION"."BLOCK_DIRECCION_TITULAR",  "FICHA_SEPULTACION"."POBLACION_VILLA_TITULAR", "FICHA_SEPULTACION"."SECTOR_TITULAR", "FICHA_SEPULTACION"."TIPO_VIA_TITULAR"  
    				INTO :ls_dire_tit, :ls_num_dire_tit, :ls_depto_tit, :ls_block_tit, :ls_pobla_tit, :ls_sector_dire_tit, :ls_tipo_via_tit  
    				FROM "FICHA_SEPULTACION"  
   				WHERE 	( "FICHA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
         					( "FICHA_SEPULTACION"."SEPULTURA" = :ls_sepultura ) AND  
         					( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) 
				USING	sqlca;
				if sqlca.sqlcode = 0 then
					this.Setitem(this.getrow(),'tipo_via_titular',ls_tipo_via_tit)
					this.Setitem(this.getrow(),'direccion_titular',ls_dire_tit)
					this.Setitem(this.getrow(),'numero_direccion_titular',ls_num_dire_tit)
					this.Setitem(this.getrow(),'depto_direccion_titular',ls_depto_tit)
					this.Setitem(this.getrow(),'block_direccion_titular',ls_block_tit)
					this.Setitem(this.getrow(),'sector_titular',ls_sector_dire_tit)
					this.Setitem(this.getrow(),'poblacion_villa_titular',ls_pobla_tit)
					dw_lista.accepttext()
				end if	
			end if	
			
//			this.Setitem(this.getrow(),'tipo_via_titular',is_tipo_via)
//			this.Setitem(this.getrow(),'direccion_titular',is_direc)
//			this.Setitem(this.getrow(),'numero_direccion_titular',is_nro)
//			this.Setitem(this.getrow(),'depto_direccion_titular',is_depto)
//			this.Setitem(this.getrow(),'block_direccion_titular',is_block)
//			this.Setitem(this.getrow(),'sector_titular',is_sector_tit)
//			this.Setitem(this.getrow(),'poblacion_villa_titular',is_pob_tit)
//			this.Setitem(this.getrow(),'fono_particular_titular',is_fono_par)
//			this.Setitem(this.getrow(),'fono_comercial_titular',is_fono_com)
		end if
end if	
if ls_columna='cod_parentesco_autoriza' then
	ls_cod_parentesco	= trim(data)
//	if ls_cod_parentesco='19' then
//		this.Setitem(this.getrow(),'rut_titular',il_rut)
//		this.Setitem(this.getrow(),'dv_titular',is_dv)
//		this.Setitem(this.getrow(),'nombre_titular',is_nombre)
//		this.Setitem(this.getrow(),'apellido_paterno_titular',is_ap_pat)
//		this.Setitem(this.getrow(),'apellido_materno_titular',is_ap_mat)
//		this.Setitem(this.getrow(),'tipo_via_titular',is_tipo_via)
//		this.Setitem(this.getrow(),'direccion_titular',is_direc)
//		this.Setitem(this.getrow(),'numero_direccion_titular',is_nro)
//		this.Setitem(this.getrow(),'depto_direccion_titular',is_depto)
//		this.Setitem(this.getrow(),'block_direccion_titular',is_block)
//		this.Setitem(this.getrow(),'sector_titular',is_sector_tit)
//		this.Setitem(this.getrow(),'poblacion_villa_titular',is_pob_tit)
//		this.Setitem(this.getrow(),'fono_particular_titular',is_fono_par)
//		this.Setitem(this.getrow(),'fono_comercial_titular',is_fono_com)
//		this.accepttext()
//	else
//		ll_res	= messagebox("Advertencia","En caso de NO ser Titular se debe Registra, desea Ingresar Antecedentes",Exclamation!,YesNo!,2)
//		if ll_res=1 then
//			this.Setitem(this.getrow(),'rut_titular',ll_nulo)
//			this.Setitem(this.getrow(),'dv_titular',ls_nulo)
//			this.Setitem(this.getrow(),'nombre_titular',ls_nulo)
//			this.Setitem(this.getrow(),'apellido_paterno_titular',ls_nulo)
//			this.Setitem(this.getrow(),'apellido_materno_titular',ls_nulo)
//			this.Setitem(this.getrow(),'tipo_via_titular',ls_nulo)
//			this.Setitem(this.getrow(),'direccion_titular',ls_nulo)
//			this.Setitem(this.getrow(),'numero_direccion_titular',ls_nulo)
//			this.Setitem(this.getrow(),'depto_direccion_titular',ls_nulo)
//			this.Setitem(this.getrow(),'block_direccion_titular',ls_nulo)
//			this.Setitem(this.getrow(),'sector_titular',ls_nulo)
//			this.Setitem(this.getrow(),'poblacion_villa_titular',ls_nulo)
//			this.Setitem(this.getrow(),'fono_particular_titular',ls_nulo)
//			this.Setitem(this.getrow(),'fono_comercial_titular',ls_nulo)
//			this.accepttext()
//		end if
//	end if
end if

ll_scroll			= dw_lista.getrow()
if ll_scroll > 0 then tab_1.tabpage_2.dw_lista_lapida.Scrolltorow(ll_scroll)
	
end event

event itemfocuschanged;String	ls_columna,ls_dv,ls_nulo,ls_cod_parentesco
Long		ll_rut

ls_columna					= dwo.name
if ls_columna<>'rut_titular' or ls_columna<>'dv_titular' then
	Setnull(ls_nulo)
	ll_rut					= this.getitemnumber(this.getrow(),'rut_titular')
	ls_dv						= this.getitemstring(this.getrow(),'dv_titular')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			this.Setitem(this.getrow(),'dv_titular',ls_nulo)
			this.setcolumn('dv_titular')
		else
			if ll_rut>0 and il_rut>0 then
				if ll_rut <> il_rut then
					ls_cod_parentesco	= this.Getitemstring(this.getrow(),'cod_parentesco_autoriza')
					if ls_cod_parentesco='19' then
						this.Setitem(this.getrow(),'cod_parentesco_autoriza',ls_nulo)
						this.setcolumn('cod_parentesco_autoriza')
					end if
				end if
				il_rut			= this.getitemnumber(this.getrow(),'rut_titular')
				is_dv				= this.getitemstring(this.getrow(),'dv_titular')
				is_nombre		= this.getitemstring(this.getrow(),'nombre_titular')
				is_ap_pat		= this.getitemstring(this.getrow(),'apellido_paterno_titular')
				is_ap_mat		= this.getitemstring(this.getrow(),'apellido_materno_titular')
				is_tipo_via		= this.getitemstring(this.getrow(),'tipo_via_titular')
				is_direc			= this.getitemstring(this.getrow(),'direccion_titular')
				is_nro			= this.getitemstring(this.getrow(),'numero_direccion_titular')
				is_depto			= this.getitemstring(this.getrow(),'depto_direccion_titular')
				is_block			= this.getitemstring(this.getrow(),'block_direccion_titular')
				is_sector_tit	= this.getitemstring(this.getrow(),'sector_titular')
				is_pob_tit		= this.getitemstring(this.getrow(),'poblacion_villa_titular')
				is_fono_par		= this.getitemstring(this.getrow(),'fono_particular_titular')
				is_fono_com		= this.getitemstring(this.getrow(),'fono_comercial_titular')
			end if
		end if 
	end if
end if
end event

type gb_1 from groupbox within tabpage_1
integer x = 2181
integer y = 2324
integer width = 553
integer height = 168
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3369
integer height = 2348
long backcolor = 67108864
string text = "Grabación Lapida"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
cb_recep_lapida cb_recep_lapida
cb_crear cb_crear
cb_2 cb_2
cb_1 cb_1
cb_nueva cb_nueva
dw_lista_lapida dw_lista_lapida
gb_2 gb_2
end type

on tabpage_2.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_recep_lapida=create cb_recep_lapida
this.cb_crear=create cb_crear
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_nueva=create cb_nueva
this.dw_lista_lapida=create dw_lista_lapida
this.gb_2=create gb_2
this.Control[]={this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.cb_recep_lapida,&
this.cb_crear,&
this.cb_2,&
this.cb_1,&
this.cb_nueva,&
this.dw_lista_lapida,&
this.gb_2}
end on

on tabpage_2.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_recep_lapida)
destroy(this.cb_crear)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_nueva)
destroy(this.dw_lista_lapida)
destroy(this.gb_2)
end on

type pb_4 from picturebutton within tabpage_2
integer x = 2350
integer y = 2236
integer width = 114
integer height = 88
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista_lapida.ScrollToRow(1)
dw_lista_lapida.setfocus()
tab_1.tabpage_1.dw_lista.ScrollToRow(1)
tab_1.tabpage_1.dw_lista.setfocus()

end event

type pb_3 from picturebutton within tabpage_2
integer x = 2464
integer y = 2236
integer width = 114
integer height = 88
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista_lapida.ScrollPriorPage( )
dw_lista_lapida.setfocus()
tab_1.tabpage_1.dw_lista.ScrollPriorPage( )
tab_1.tabpage_1.dw_lista.setfocus()
end event

type pb_2 from picturebutton within tabpage_2
integer x = 2574
integer y = 2236
integer width = 114
integer height = 88
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista_lapida.ScrollNextPage( )
dw_lista_lapida.setfocus()
tab_1.tabpage_1.dw_lista.ScrollNextPage( )
tab_1.tabpage_1.dw_lista.setfocus()

end event

type pb_1 from picturebutton within tabpage_2
integer x = 2693
integer y = 2236
integer width = 114
integer height = 88
integer taborder = 150
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista_lapida.ScrollToRow(dw_lista_lapida.rowcount())
dw_lista_lapida.setfocus()
tab_1.tabpage_1.dw_lista.ScrollToRow(tab_1.tabpage_1.dw_lista.rowcount())
tab_1.tabpage_1.dw_lista.setfocus()

end event

type cb_recep_lapida from commandbutton within tabpage_2
boolean visible = false
integer x = 1792
integer y = 2232
integer width = 439
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Instalación Lápida"
end type

event clicked;String		ls_sector,ls_sepultura,ls_string
Long		ll_correlativo

if isvalid(w_ingreso_fecha_lapida) then close(w_ingreso_fecha_lapida)
ls_sector			= dw_lista_lapida.getitemstring(dw_lista_lapida.getrow(),'sector')
ls_sepultura		= dw_lista_lapida.getitemstring(dw_lista_lapida.getrow(),'sepultura')
ll_correlativo	= dw_lista_lapida.getitemnumber(dw_lista_lapida.getrow(),'correlativo')
if not isnull(ls_sector) and not isnull(ls_sepultura) and ll_correlativo > 0 then
	ls_string		= ls_sector+'~t'+ls_sepultura+'~t'+string(ll_correlativo)
	OpenWithParm(w_ingreso_fecha_lapida, ls_string)
end if
end event

type cb_crear from commandbutton within tabpage_2
boolean visible = false
integer x = 1367
integer y = 2232
integer width = 375
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Crear S&olicitud"
end type

event clicked;String	ls_sector,ls_sepultura,ls_nro_tecnico,ls_ap_pat,ls_ap_mat,ls_nombre,ls_prim_sepult,ls_string,&
			ls_dv_titular,ls_base,ls_serie
Long		ll_cod_parque,ll_capacidad,ll_cod_imagen,ll_cod_relig,ll_rut_titular,ll_count_fall
Date		ldt_fecha
Double	ll_numero
//ls_sector			= dw_lista.getitemstring(1,'sector')
//ls_sepultura		= dw_lista.getitemstring(1,'sepultura')
//ll_cod_parque		= dw_lista.getitemnumber(1,'cod_parque')
dw_buscar.accepttext()
dw_parque.accepttext()
ls_sector			= dw_buscar.getitemstring(1,'sector')
ls_sepultura		= dw_buscar.getitemstring(1,'sepultura')
ll_cod_parque		= dw_parque.getitemnumber(1,'cod_parque')
if ll_cod_parque>0 and not isnull(ls_sector) and not isnull(ls_sepultura) then
	SELECT	Count("FALLECIDOS"."LLAVE")  
	INTO 		:ll_count_fall  
	FROM 		"FALLECIDOS"  
	WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND  
			 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
			 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque )    AND
			 ( "FALLECIDOS"."ESTADO_REG" = 'A' )
	USING		sqlca;
	if ll_count_fall > 0 then
		SELECT	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"FALLECIDOS"."N_TEC",	"PAGO_OFERTA"."CAPACIDAD",	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO"
		INTO 		:ll_rut_titular,	:ls_dv_titular,	:ls_nombre,				:ls_ap_pat,					:ls_ap_mat,					:ls_nro_tecnico,			:ll_capacidad,					:ls_base,				:ls_serie,			:ll_numero
		FROM 		"FALLECIDOS",	"CADENA", 	"CLIENTE",	"PAGO_OFERTA",	"OFERTA_V"  
		WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 ( "FALLECIDOS"."BASE" = "CADENA"."CODIGO" ) and  
				 ( "FALLECIDOS"."SS" = "CADENA"."SERIE" ) and  
				 ( "FALLECIDOS"."CONTRATO" = "CADENA"."NUMERO" ) and  
				( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND
				 ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
				 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 ( "CADENA"."CODIGO" = 'O' ) and
				 (("FALLECIDOS"."SECTOR" = :ls_sector ) AND  
				 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
				 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque ) AND  
				 ( "FALLECIDOS"."LLAVE" = 	(	SELECT 	MAX("FALLECIDOS"."LLAVE") 
														FROM 		"FALLECIDOS" 
														WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND 
																 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND 
													 			( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND
																 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque ) ) ) )  
		UNION
		SELECT	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"FALLECIDOS"."N_TEC",	"CONTRATO"."CAPACIDAD",	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO"
		FROM 		"FALLECIDOS",	"CADENA", 	"CLIENTE",	"CONTRATO"  
		WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
				 ( "FALLECIDOS"."BASE" = "CADENA"."CODIGO" ) and  
				 ( "FALLECIDOS"."SS" = "CADENA"."SERIE" ) and  
				 ( "FALLECIDOS"."CONTRATO" = "CADENA"."NUMERO" ) and  
				 ( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND
				 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
				 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
				 ( "CADENA"."CODIGO" = 'C' ) and
				 (("FALLECIDOS"."SECTOR" = :ls_sector ) AND  
				 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND  
				 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque ) AND  
				 ( "FALLECIDOS"."LLAVE" = 	(	SELECT 	MAX("FALLECIDOS"."LLAVE") 
														FROM 		"FALLECIDOS" 
														WHERE  ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND 
																	( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND
																 ( "FALLECIDOS"."N_SEP" = :ls_sepultura ) AND 
																 ( "FALLECIDOS"."COD_PARQUE" = :ll_cod_parque ) ) ) )  
		USING		sqlca;
		ls_prim_sepult	= 'N'
	else
		ls_nro_tecnico	= dw_lista_lapida.getitemstring(1,'numero_tecnico')
		ll_capacidad	= dw_lista_lapida.getitemnumber(1,'capacidad')
		ldt_fecha		= date(dw_lista_lapida.getitemdatetime(1,'fecha'))
		ls_ap_pat		= dw_lista_lapida.getitemstring(1,'apellido_paterno_titular')
		ls_ap_mat		= dw_lista_lapida.getitemstring(1,'apellido_materno_titular')
		ls_nombre		= dw_lista_lapida.getitemstring(1,'nombre_titular')
		ls_prim_sepult	= dw_lista_lapida.getitemstring(1,'primera_sepultura')
		ll_cod_imagen	= dw_lista_lapida.getitemnumber(1,'codigo_imagen')
		ll_cod_relig	= dw_lista_lapida.getitemnumber(1,'codigo_religion')
		ll_rut_titular	= dw_lista_lapida.getitemnumber(1,'rut_titular')
		ls_dv_titular	= dw_lista_lapida.getitemstring(1,'dv_titular')
		ls_base			= dw_lista_lapida.getitemstring(1,'base')
		ls_serie			= dw_lista_lapida.getitemstring(1,'serie')
		ll_numero		= dw_lista_lapida.getitemnumber(1,'numero')
	end if
	ls_string		= ls_sector+'~t'+ls_sepultura+'~t'+string(ll_cod_parque)+'~t'+ls_nro_tecnico+'~t'+string(ll_capacidad)+'~t'+string(ldt_fecha)+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_nombre+'~t'+ls_prim_sepult+'~t'+string(ll_cod_imagen)+'~t'+string(ll_cod_relig)+'~t'+string(ll_rut_titular)+'~t'+ls_dv_titular+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_ingreso_solicitud_grabacion_lapida) then close(w_ingreso_solicitud_grabacion_lapida)
	openwithparm(w_ingreso_solicitud_grabacion_lapida,ls_string)
else
	if isnull(ls_sector) then
		messagebox("Advertencia","Debe Ingresar Sector")
		dw_buscar.setcolumn('sector')
	elseif isnull(ls_sepultura) then
		messagebox("Advertencia","Debe Ingresar Sepultura")
		dw_buscar.setcolumn('sepultura')
	elseif ll_cod_parque=0 or isnull(ll_cod_parque) then
		messagebox("Advertencia","Debe Ingresar Parque")
		dw_parque.setfocus()
	end if
end if
end event

type cb_2 from commandbutton within tabpage_2
boolean visible = false
integer x = 942
integer y = 2232
integer width = 261
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Limpiar"
end type

event clicked;Long		ll_resp,ll_new

ll_resp	= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then
//	tab_1.tabpage_1
//	tab_1.tabpage_1.
//	tab_1.tabpage_2.
//	tab_1.tabpage_2.
	
//	dw_parque.reset()
////	dw_print.reset()
//	dw_parque.insertrow(0)
//	dw_lista_lapida.reset()
//	dw_lista_lapida.insertrow(0)
//	dw_buscar.reset()
//	dw_buscar.getchild('sepultura',idw_detalle6)
//	idw_detalle6.settransobject(sqlca)
//	idw_detalle6.reset()
//	idw_detalle6.insertrow(0)
//	
//	dw_buscar.getchild('sector',idw_detalle5)
//	idw_detalle5.settransobject(sqlca)
//	if gs_conexion	= "Parque El Prado" then
//		dw_parque.setitem(1,'cod_parque',1)
//		idw_detalle5.retrieve(1)
//	elseif gs_conexion = "Parque La Foresta" then
//		dw_parque.setitem(1,'cod_parque',11)
//		idw_detalle5.retrieve(11)
//	end if
//	ll_new	= dw_buscar.insertrow(0)
//	dw_buscar.accepttext()
end if
tab_1.tabpage_2.setfocus()
end event

type cb_1 from commandbutton within tabpage_2
boolean visible = false
integer x = 389
integer y = 2232
integer width = 393
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Buscar Solicitud"
end type

event clicked;if isvalid(w_buscar_ficha) then close(w_buscar_ficha)
OpenWithParm(w_buscar_ficha, "GL")
end event

type cb_nueva from commandbutton within tabpage_2
boolean visible = false
integer x = 27
integer y = 2232
integer width = 265
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_nom_lap,ls_prim_sep,ls_tipo_con,ls_pasa = 'S'
Long		ll_imagen,ll_indi,ll_tot_reg
Datetime	ldt_fec_nac,ldt_fec_def

dw_lista_lapida.accepttext()
ll_indi			= dw_lista_lapida.getrow()
ll_tot_reg	= dw_lista_lapida.rowcount()
if ll_tot_reg>0 then
	for ll_indi = 1 to ll_tot_reg
		ls_nom_lap	= dw_lista_lapida.getitemstring(dw_lista_lapida.getrow(),'nombre_fallecido_lapida')
		ldt_fec_nac	= dw_lista_lapida.getitemdatetime(dw_lista_lapida.getrow(),'fecha_nacimiento_lapida')
		ldt_fec_def	= dw_lista_lapida.getitemdatetime(dw_lista_lapida.getrow(),'fecha_defuncion_lapida')
		ll_imagen	= dw_lista_lapida.getitemnumber(dw_lista_lapida.getrow(),'codigo_imagen')
		ls_prim_sep	= dw_lista_lapida.getitemstring(dw_lista_lapida.getrow(),'primera_sepultura')
		ls_tipo_con	= dw_lista_lapida.getitemstring(dw_lista_lapida.getrow(),'tipo_construccion')
		if isnull(ls_nom_lap) or ls_nom_lap='' or ls_nom_lap='-' then
			messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
			dw_lista_lapida.scrolltorow(ll_indi)
			dw_lista_lapida.setfocus()
			dw_lista_lapida.setcolumn('nombre_fallecido_lapida')
			ls_pasa = 'N'
			exit
		elseif isnull(ldt_fec_nac) then
			messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Fallecido")
			dw_lista_lapida.scrolltorow(ll_indi)
			dw_lista_lapida.setfocus()
			dw_lista_lapida.setcolumn('fecha_nacimiento_lapida')
			ls_pasa = 'N'
			exit
		elseif isnull(ldt_fec_def) then
			messagebox("Advertencia","Debe Ingresar Fecha Definción")
			dw_lista_lapida.scrolltorow(ll_indi)
			dw_lista_lapida.setfocus()
			dw_lista_lapida.setcolumn('fecha_defuncion_lapida')
			ls_pasa = 'N'
			exit
		elseif (ll_imagen=0 or isnull(ll_imagen)) and ls_prim_sep='S' then
			messagebox("Advertencia","Debe Ingresar Cuño Religioso")
			dw_lista_lapida.scrolltorow(ll_indi)
			dw_lista_lapida.setfocus()
			dw_lista_lapida.setcolumn('codigo_imagen')
			ls_pasa = 'N'
			exit
		elseif ls_prim_sep='' or isnull(ls_prim_sep) or ls_prim_sep='-' then
			messagebox("Advertencia","Debe Ingresar Opción de Sepultura")
			dw_lista_lapida.scrolltorow(ll_indi)
			dw_lista_lapida.setfocus()
			dw_lista_lapida.setcolumn('primera_sepultura')
		elseif ls_tipo_con='' or isnull(ls_tipo_con) then
			messagebox("Advertencia","Debe Ingresar Tipo Construcción")
			dw_lista_lapida.scrolltorow(ll_indi)
			dw_lista_lapida.setfocus()
			dw_lista_lapida.setcolumn('tipo_construccion')
			ls_pasa = 'N'
			exit
		end if
	next
	if ls_pasa = 'S' then
		if dw_lista_lapida.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			il_modif_lapida	= 0
//			if isvalid(w_mantenedor_estadistico) then 
//				w_mantenedor_estadistico.setfocus()
//				close(w_solicitud_grabacion_lapida)
//			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if		
	end if
end if
end event

type dw_lista_lapida from datawindow within tabpage_2
integer x = 201
integer y = 64
integer width = 3077
integer height = 2124
integer taborder = 50
string title = "none"
string dataobject = "dw_solicitud_grabacion_lapida_manantial"
boolean vscrollbar = true
boolean border = false
end type

event clicked;String		ls_columna,ls_fecha,ls_estado_instal
datetime	ldt_fecha_instal

ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_2'
		if dw_lista_lapida.getitemnumber(dw_lista_lapida.getrow(),'rut_titular') > 0 and dw_lista_lapida.getitemstring(dw_lista_lapida.getrow(),'estado_reg')='P' then
			ls_fecha	= string(date(dw_lista_lapida.getitemdatetime(dw_lista_lapida.getrow(),'fecha_recepcion')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_lista_lapida.setitem(dw_lista_lapida.getrow(),'fecha_recepcion',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_lista_lapida.setitem(dw_lista_lapida.getrow(),'fecha_recepcion',date(ls_fecha))
			End if
		end if
		
	CASE 'p_3'
		if dw_lista_lapida.getitemnumber(dw_lista_lapida.getrow(),'rut_titular') > 0 then
			ls_fecha	= string(date(dw_lista_lapida.getitemdatetime(dw_lista_lapida.getrow(),'fecha_instalada')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_lista_lapida.setitem(dw_lista_lapida.getrow(),'fecha_instalada',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha					= trim(Message.StringParm)
				dw_lista_lapida.setitem(dw_lista_lapida.getrow(),'fecha_instalada',date(ls_fecha))
				ls_estado_instal		= this.getitemstring(this.getrow(),'estado_instalada')
				ldt_fecha_instal			= this.getitemdatetime(this.getrow(),'fecha_instalada')
				if not isnull(ls_estado_instal) and not isnull(ldt_fecha_instal) then
					dw_lista_lapida.setitem(dw_lista_lapida.getrow(),'usuario_instalada',gs_user)
					dw_lista_lapida.accepttext()
				end if
			End if
		end if	
END CHOOSE
dw_lista_lapida.accepttext()
end event

event itemchanged;String		ls_columna,ls_nombre_archivo,ls_estado_instal,ls_nombre,ls_pasa_p
datetime	ldt_fecha_instal
Long		ll_imagen,ll_largo_nombre

this.accepttext()
il_modif_lapida ++
ls_columna		= dwo.name
if ls_columna='codigo_imagen' then
	ll_imagen	= this.getitemnumber(this.getrow(),'codigo_imagen')
	SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
	INTO 		:ls_nombre_archivo  
	FROM 	"FICHA_CUNOS"  
	WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_imagen   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_lista_lapida.object.p_1.Filename 	= ls_nombre_archivo
	else
		dw_lista_lapida.object.p_1.Filename 	= ''
	end if
elseif ls_columna='estado_instalada' or ls_columna='fecha_instalada' then
	ls_estado_instal		= this.getitemstring(this.getrow(),'estado_instalada')
	ldt_fecha_instal			= this.getitemdatetime(this.getrow(),'fecha_instalada')
	if not isnull(ls_estado_instal) and not isnull(ldt_fecha_instal) then
		dw_lista_lapida.setitem(dw_lista_lapida.getrow(),'usuario_instalada',gs_user)
		dw_lista_lapida.accepttext()
	end if
	if not isnull(ls_estado_instal) and isnull(ldt_fecha_instal) then
		dw_lista_lapida.setitem(dw_lista_lapida.getrow(),'fecha_instalada',date(gdt_fec_sistema))
		dw_lista_lapida.setitem(dw_lista_lapida.getrow(),'usuario_instalada',gs_user)
		dw_lista_lapida.accepttext()
	end if
elseif ls_columna <> 'nombre_fallecido_lapida' then
	this.accepttext()
	ls_nombre					= dw_lista_lapida.getitemstring(1,'nombre_fallecido_lapida')
	is_nombre					= ls_nombre
	il_sw ++
	if ls_nombre <> '' and ls_nombre <> '-' then
		ll_largo_nombre		= len(ls_nombre)
	//	ls_pasa_p 				= wf_valida_largo_nombre(ll_largo_nombre,'nombre_fallecido_lapida')	
		if ls_pasa_p='N' then
			dw_lista_lapida.setitem(1,'nombre_fallecido_lapida',ls_nombre)
			dw_lista_lapida.setfocus()
			dw_lista_lapida.setcolumn('nombre_fallecido_lapida')
		end if
	end if
end if
dw_lista_lapida.accepttext()
end event

type gb_2 from groupbox within tabpage_2
integer x = 2327
integer y = 2184
integer width = 503
integer height = 160
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type pb_ok from picturebutton within w_sol_carta_autoriza_grab_lapida
integer x = 2501
integer y = 16
integer width = 146
integer height = 120
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;String	 ls_sector,ls_sepultura,ls_nombre_archivo
Long		ll_cod_parque,ll_fila,ll_cuno_ficha

tab_1.tabpage_1.dw_lista.reset()
tab_1.tabpage_1.dw_lista.insertrow(0)
tab_1.tabpage_2.dw_lista_lapida.reset()
tab_1.tabpage_2.dw_lista_lapida.insertrow(0)
ls_sector		= dw_buscar.getitemstring(1,'sector')
ls_sepultura	= dw_buscar.getitemstring(1,'sepultura')
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if not isnull(ls_sector) and not isnull(ls_sepultura) and ll_cod_parque>0 then
	if tab_1.tabpage_1.dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)=0 then
		tab_1.tabpage_1.dw_lista.insertrow(0)
		messagebox("Advertencia","No Registra Dato")
	else
		ll_fila	= tab_1.tabpage_1.dw_lista.Find("estado_reg <> 'G'", 1, tab_1.tabpage_1.dw_lista.RowCount())
		if ll_fila > 0 then
			tab_1.tabpage_1.cb_grabar.enabled	= true		
		else
			tab_1.tabpage_1.cb_grabar.enabled	= true
		end if
		tab_1.tabpage_1.dw_lista.scrolltorow(tab_1.tabpage_1.dw_lista.rowcount())
	end if
	if tab_1.tabpage_2.dw_lista_lapida.retrieve(ls_sector,ls_sepultura,ll_cod_parque)=0 then
		tab_1.tabpage_2.dw_lista_lapida.insertrow(0)
		messagebox("Advertencia","No Registra Dato Lapida")
	else
		tab_1.tabpage_2.dw_lista_lapida.scrolltorow(tab_1.tabpage_2.dw_lista_lapida.rowcount())
		ll_cuno_ficha										= tab_1.tabpage_2.dw_lista_lapida.getitemnumber(tab_1.tabpage_2.dw_lista_lapida.getrow(),'codigo_imagen')
		if ll_cuno_ficha > 0 then
			SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
			INTO 		:ls_nombre_archivo  
			FROM 	"FICHA_CUNOS"  
			WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_cuno_ficha   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				tab_1.tabpage_2.dw_lista_lapida.object.p_1.Filename 	= ls_nombre_archivo
			else
				tab_1.tabpage_2.dw_lista_lapida.object.p_1.Filename 	= ''
			end if
			
			ll_fila	= tab_1.tabpage_2.dw_lista_lapida.Find("estado_reg <> 'G'", 1, tab_1.tabpage_2.dw_lista_lapida.RowCount())
			if ll_fila > 0 then
				tab_1.tabpage_2.cb_nueva.enabled	= true
				
			else
				tab_1.tabpage_2.cb_nueva.enabled	= true
			end if
		elseif ll_cuno_ficha = 0 then
			tab_1.tabpage_2.dw_lista_lapida.scrolltorow(tab_1.tabpage_2.dw_lista_lapida.rowcount())
			SELECT "FICHA_GRABACION_LAPIDA"."CODIGO_IMAGEN"
			INTO :ll_cuno_ficha
			FROM "FICHA_GRABACION_LAPIDA"  
			WHERE 	( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
						( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
						( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_cod_parque ) AND
						(  "FICHA_GRABACION_LAPIDA"."CORRELATIVO" = ( SELECT MAX("FICHA_GRABACION_LAPIDA"."CORRELATIVO")
																							FROM "FICHA_GRABACION_LAPIDA"  
																							WHERE ( "FICHA_GRABACION_LAPIDA"."SECTOR" = :ls_sector ) AND  
																										( "FICHA_GRABACION_LAPIDA"."SEPULTURA" = :ls_sepultura ) AND  
																										( "FICHA_GRABACION_LAPIDA"."COD_PARQUE" = :ll_cod_parque ) AND
																										("FICHA_GRABACION_LAPIDA"."CODIGO_IMAGEN" > 0 AND "FICHA_GRABACION_LAPIDA"."CODIGO_IMAGEN" <> 99) 
																										)		)
			USING		sqlca;			
			tab_1.tabpage_2.dw_lista_lapida.setitem(tab_1.tabpage_2.dw_lista_lapida.rowcount(),'codigo_imagen',ll_cuno_ficha)
			
			SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
			INTO 		:ls_nombre_archivo  
			FROM 	"FICHA_CUNOS"  
			WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_cuno_ficha   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				tab_1.tabpage_2.dw_lista_lapida.object.p_1.Filename 	= ls_nombre_archivo
			else
				tab_1.tabpage_2.dw_lista_lapida.object.p_1.Filename 	= ''
			end if
		end if
		tab_1.tabpage_2.dw_lista_lapida.accepttext()		
	end if
else
	if isnull(ls_sector) then
		messagebox("Advertencia","Debe Ingresar Sector")
		dw_buscar.setcolumn('sector')
	elseif isnull(ls_sepultura) then
		messagebox("Advertencia","Debe Ingresar Sepultura")
		dw_buscar.setcolumn('sepultura')
	elseif ll_cod_parque=0 or isnull(ll_cod_parque) then
		messagebox("Advertencia","Debe Ingresar Parque")
		dw_parque.setfocus()
	end if
end if
end event

type dw_parque from datawindow within w_sol_carta_autoriza_grab_lapida
integer x = 256
integer y = 32
integer width = 594
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long	ll_cod_parque
dw_parque.accepttext()
tab_1.tabpage_1.dw_lista.reset()
tab_1.tabpage_1.dw_lista.insertrow(0)
ll_cod_parque	= this.getitemnumber(1,'cod_parque')
idw_detalle5.retrieve(ll_cod_parque)
end event

type st_16 from statictext within w_sol_carta_autoriza_grab_lapida
integer x = 23
integer y = 40
integer width = 210
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_buscar from datawindow within w_sol_carta_autoriza_grab_lapida
integer x = 864
integer y = 32
integer width = 1563
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_seleccionar_sector_sepultura"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_sector
Long		ll_cod_parque

this.accepttext()
tab_1.tabpage_1.dw_lista.reset()
tab_1.tabpage_1.dw_lista.insertrow(0)
ls_columna	= dwo.name
if ls_columna='cod_parque' then
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	idw_detalle5.retrieve(ll_cod_parque)
elseif ls_columna='sector' then
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	ls_sector		= dw_buscar.getitemstring(1,'sector')
	idw_detalle6.retrieve(ll_cod_parque,ls_sector)
end if
end event

