forward
global type w_cd_mantenedor_contrato from window
end type
type dw_glosa from datawindow within w_cd_mantenedor_contrato
end type
type cb_glosa from commandbutton within w_cd_mantenedor_contrato
end type
type st_ctto from statictext within w_cd_mantenedor_contrato
end type
type cb_imprimir from commandbutton within w_cd_mantenedor_contrato
end type
type cb_limpiar from commandbutton within w_cd_mantenedor_contrato
end type
type cb_cerrar from commandbutton within w_cd_mantenedor_contrato
end type
type dw_lista from datawindow within w_cd_mantenedor_contrato
end type
type dw_cod_modif from datawindow within w_cd_mantenedor_contrato
end type
type cb_grabar from commandbutton within w_cd_mantenedor_contrato
end type
type dw_cod_modif_det from datawindow within w_cd_mantenedor_contrato
end type
type gb_2 from groupbox within w_cd_mantenedor_contrato
end type
end forward

global type w_cd_mantenedor_contrato from window
integer width = 1586
integer height = 2292
boolean titlebar = true
string title = "Modificación Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_glosa dw_glosa
cb_glosa cb_glosa
st_ctto st_ctto
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
dw_lista dw_lista
dw_cod_modif dw_cod_modif
cb_grabar cb_grabar
dw_cod_modif_det dw_cod_modif_det
gb_2 gb_2
end type
global w_cd_mantenedor_contrato w_cd_mantenedor_contrato

type variables
string		is_base,is_serie,is_cerrar='S',is_graba='N',is_imprime='S',is_clicked,is_glosa
long 		il_row,il_fila
Double	il_numero
end variables

forward prototypes
public subroutine wf_lista_modif_ctto (integer al_cod_modif, integer al_cod_modif_det)
public subroutine wf_lista_modif_ctto_eliminar (integer al_cod_modif, integer al_cod_modif_det)
public subroutine wf_carga_datos (long al_codigo)
public subroutine wf_val_grabar ()
end prototypes

public subroutine wf_lista_modif_ctto (integer al_cod_modif, integer al_cod_modif_det);string	ls_columna,ls_descrip,ls_insert='S'
long	ll_tot_reg,ll_indi,ll_new,ll_cod_modif,ll_cod_modif_det

ll_tot_reg							= dw_lista.rowcount()
if ll_tot_reg > 0 then
	for ll_indi = 1 to ll_tot_reg
		ll_cod_modif				= dw_lista.getitemnumber(ll_indi,'codigo_modif')	
		ll_cod_modif_det			= dw_lista.getitemnumber(ll_indi,'codigo_detalle')	
		if ll_cod_modif = al_cod_modif and ll_cod_modif_det = al_cod_modif_det then
			ls_insert		= 'N'
		else
			ls_insert		= 'S'
		end if
	next
end if
if ls_insert = 'S' then
	ll_new							= dw_lista.insertrow(0)
	dw_lista.setitem(ll_new,'base',is_base)
	dw_lista.setitem(ll_new,'serie',is_serie)
	dw_lista.setitem(ll_new,'numero',il_numero)
	dw_lista.setitem(ll_new,'codigo_modif',al_cod_modif)
	dw_lista.setitem(ll_new,'codigo_detalle',al_cod_modif_det)
	dw_lista.setitem(ll_new,'estado','V')
	dw_lista.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
	dw_lista.setitem(ll_new,'usuario',gs_user)
	dw_lista.setitem(ll_new,'codigo_docto',25)
	dw_lista.accepttext()
end if
end subroutine

public subroutine wf_lista_modif_ctto_eliminar (integer al_cod_modif, integer al_cod_modif_det);long	ll_fila,ll_tot_reg

ll_tot_reg				= dw_lista.rowcount()
ll_fila						= dw_lista.Find("codigo_modif = "+string(al_cod_modif) +" and codigo_detalle = "+string(al_cod_modif_det),1,ll_tot_reg)
if ll_fila >0 then
	dw_lista.deleterow(ll_fila)
end if
end subroutine

public subroutine wf_carga_datos (long al_codigo);long	ll_tot_reg,ll_indi,ll_cod_det,ll_tot_reg2,ll_indi2,ll_cod2,ll_cod_det2

//wf_carga_datos(al_codigo)
ll_tot_reg							= dw_cod_modif_det.retrieve(al_codigo)
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ll_cod_det					= dw_cod_modif_det.getitemnumber(ll_indi,'codigo_detalle')
		ll_tot_reg2					= dw_lista.rowcount()
		if ll_tot_reg2>0 then
			for	ll_indi2=1 to ll_tot_reg2
				ll_cod2				= dw_lista.getitemnumber(ll_indi2,'codigo_modif')
				ll_cod_det2			= dw_lista.getitemnumber(ll_indi2,'codigo_detalle')
				if al_codigo=ll_cod2 and ll_cod_det=ll_cod_det2 then
					dw_cod_modif_det.setitem(ll_indi,'est_reg',1)
					dw_cod_modif_det.accepttext()
				end if
			next
		end if
	next
	dw_cod_modif_det.accepttext()
end if
end subroutine

public subroutine wf_val_grabar ();string	ls_pasa='S'
long	ll_tot_reg,ll_count,ll_res

dw_lista.accepttext()
SELECT	count("CD_MODIFICACION_CTTO"."BASE")  
INTO 		:ll_count  
FROM 	"CD_MODIFICACION_CTTO"  
WHERE	( "CD_MODIFICACION_CTTO"."BASE" = :is_base ) AND  
			( "CD_MODIFICACION_CTTO"."SERIE" = :is_serie ) AND  
			( "CD_MODIFICACION_CTTO"."NUMERO" = :il_numero ) AND  
			( "CD_MODIFICACION_CTTO"."ESTADO" = 'V' )
USING	sqlca;
if isnull(ll_count) then ll_count=0
ll_tot_reg						= dw_lista.rowcount()
if ll_tot_reg > 0 then
	if ll_count=0 then
		ll_res						= messagebox('Advertencia','Desea Grabar Contrato Ingresado',Exclamation!,YesNo!,2)
		if ll_res=1 then
			is_graba				= 'S'
			is_cerrar				= 'N'
			is_imprime			= 'N'
			cb_grabar.triggerevent(clicked!)
			dw_lista.retrieve(is_base,is_serie,il_numero)
		else
			is_imprime			= 'N'
		end if
	elseif ll_count>0 then
		if ll_tot_reg<>ll_count then
			ll_res					= messagebox('Advertencia','Desea Grabar Registros Modificados',Exclamation!,YesNo!,2)
			if ll_res=1 then
				is_graba			= 'S'
				is_cerrar			= 'N'
				is_imprime		= 'N'
				cb_grabar.triggerevent(clicked!)
				dw_lista.retrieve(is_base,is_serie,il_numero)
			else
				is_imprime		= 'N'
			end if
		end if
	end if
else
	is_imprime					= 'N'
end if
	
end subroutine

on w_cd_mantenedor_contrato.create
this.dw_glosa=create dw_glosa
this.cb_glosa=create cb_glosa
this.st_ctto=create st_ctto
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.dw_cod_modif=create dw_cod_modif
this.cb_grabar=create cb_grabar
this.dw_cod_modif_det=create dw_cod_modif_det
this.gb_2=create gb_2
this.Control[]={this.dw_glosa,&
this.cb_glosa,&
this.st_ctto,&
this.cb_imprimir,&
this.cb_limpiar,&
this.cb_cerrar,&
this.dw_lista,&
this.dw_cod_modif,&
this.cb_grabar,&
this.dw_cod_modif_det,&
this.gb_2}
end on

on w_cd_mantenedor_contrato.destroy
destroy(this.dw_glosa)
destroy(this.cb_glosa)
destroy(this.st_ctto)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.dw_cod_modif)
destroy(this.cb_grabar)
destroy(this.dw_cod_modif_det)
destroy(this.gb_2)
end on

event open;long	ll_tot_reg,ll_new,ll_cod_modif

w_cd_mantenedor_contrato.height		= 2000
gf_centrar(w_cd_mantenedor_contrato)

is_glosa											= ''	
if gl_proceso<=3 then
	cb_grabar.enabled							= false
	cb_limpiar.enabled						= false
	dw_cod_modif_det.enabled				= false
	dw_glosa.enabled							= false
end if
dw_cod_modif.getchild('cod_ctto',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve()=0 then
	idw_detalle.insertrow(0)
end if
dw_cod_modif_det.dataobject			= 'dw_cd_lista_codigo_det_modif'
dw_cod_modif_det.settransobject(sqlca)

ll_new										= dw_cod_modif.insertrow(0)
dw_cod_modif.setitem(ll_new,'cod_ctto',1)
dw_cod_modif.accepttext()
ll_cod_modif								= dw_cod_modif.getitemnumber(1,'cod_ctto')		
ll_tot_reg									= dw_cod_modif_det.retrieve(ll_cod_modif)
is_base										= trim(substr(1,1,Message.StringParm))
is_serie										= trim(substr(1,2,Message.StringParm))
il_numero									= Double(trim(substr(1,3,Message.StringParm)))
il_fila											= long(substr(1,4,Message.StringParm))
st_ctto.text									= string(is_base+'-'+is_serie+'-'+string(il_numero))

dw_lista.dataobject						= 'dw_cd_lista_modif'
dw_lista.settransobject(sqlca)
ll_tot_reg									= dw_lista.retrieve(is_base,is_serie,il_numero)
if ll_tot_reg>0 then
	wf_carga_datos(ll_cod_modif)
	dw_lista.object.user.text				= gs_user
	SELECT	"CD_FOLIO_DETALLE_EXCEPCION"."OBSERVACION"
	INTO		:is_glosa
   	FROM 	"CD_FOLIO_DETALLE_EXCEPCION"  
   	WHERE	( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :is_base ) AND  
         		( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :is_serie ) AND  
         		( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :il_numero ) AND  
         		( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_GRUPO_EXCEPCION" = 4 ) AND  
         		( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_EXCEPCION" = 25 ) and
				( "CD_FOLIO_DETALLE_EXCEPCION"."ESTADO" = 'V' )	
	USING	sqlca;
	if isnull(is_glosa) then is_glosa=''
	if is_glosa<>'' then
		cb_glosa.text								= '&Mostrar Glosa'
	else
		cb_glosa.text								= '&Ingresar Glosa'
	end if
end if
end event

type dw_glosa from datawindow within w_cd_mantenedor_contrato
boolean visible = false
integer x = 46
integer y = 1824
integer width = 1486
integer height = 288
integer taborder = 50
string title = "none"
string dataobject = "dwe_glosa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_glosa from commandbutton within w_cd_mantenedor_contrato
integer x = 343
integer y = 1708
integer width = 393
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ingresar Glosa"
end type

event clicked;
if cb_glosa.text='&Mostrar Glosa' or cb_glosa.text='&Ingresar Glosa' then
	w_cd_mantenedor_contrato.height	= 2300
	gf_centrar(w_cd_mantenedor_contrato)
	dw_glosa.visible							= true
	dw_glosa.dataobject						= 'dwe_glosa'
	dw_glosa.settransobject(sqlca)
	dw_glosa.insertrow(0)
	cb_glosa.text								= '&Cerrar Glosa'
	dw_glosa.setitem(1,'glosa',is_glosa)
	dw_glosa.accepttext()
elseif cb_glosa.text='&Cerrar Glosa' then
	w_cd_mantenedor_contrato.height	= 2010
	gf_centrar(w_cd_mantenedor_contrato)
	dw_glosa.visible							= false
	cb_glosa.text								= '&Mostrar Glosa'
end if
	
end event

type st_ctto from statictext within w_cd_mantenedor_contrato
integer x = 64
integer y = 16
integer width = 1321
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_imprimir from commandbutton within w_cd_mantenedor_contrato
integer x = 736
integer y = 1708
integer width = 247
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;is_clicked				= 'I'
wf_val_grabar()
if is_imprime='S' then
	f_Print( dw_lista )
end if



end event

type cb_limpiar from commandbutton within w_cd_mantenedor_contrato
integer x = 983
integer y = 1708
integer width = 247
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;long	ll_new,ll_cod_modif,ll_tot_reg

dw_cod_modif.reset()
dw_lista.reset()
dw_cod_modif.getchild('cod_ctto',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve()=0 then
	idw_detalle.insertrow(0)
end if
ll_new										= dw_cod_modif.insertrow(0)
dw_cod_modif.setitem(ll_new,'cod_ctto',1)
dw_cod_modif.accepttext()
ll_cod_modif								= dw_cod_modif.getitemnumber(1,'cod_ctto')		
ll_tot_reg									= dw_cod_modif_det.retrieve(ll_cod_modif)
ll_tot_reg									= dw_lista.retrieve(is_base,is_serie,il_numero)
if ll_tot_reg>0 then
	wf_carga_datos(ll_cod_modif)
	dw_lista.object.user.text				= gs_user
end if
end event

type cb_cerrar from commandbutton within w_cd_mantenedor_contrato
integer x = 1262
integer y = 1700
integer width = 270
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;is_clicked				= 'C'
wf_val_grabar()
if is_cerrar='S' then
	close(w_cd_mantenedor_contrato)
end if

end event

type dw_lista from datawindow within w_cd_mantenedor_contrato
integer x = 1586
integer y = 256
integer width = 2537
integer height = 1332
integer taborder = 20
string title = "none"
string dataobject = "dw_cd_lista_modif"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_cod_modif from datawindow within w_cd_mantenedor_contrato
integer x = 64
integer y = 188
integer width = 1152
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_cod_modif_cd"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long	ll_cod,ll_tot_reg,ll_indi,ll_cod_det,ll_tot_reg2,ll_indi2,ll_cod2,ll_cod_det2,ll_est_reg,ll_count=0

dw_cod_modif.accepttext()
dw_lista.accepttext()
ll_cod										= dw_cod_modif.getitemnumber(1,'cod_ctto')
if not isnull(ll_cod) and ll_cod>0 then
	wf_carga_datos(ll_cod)
	ll_tot_reg							= dw_cod_modif_det.rowcount()
	for ll_indi=1 to ll_tot_reg
		ll_est_reg						= dw_cod_modif_det.getitemnumber(ll_indi,'est_reg')
		if ll_est_reg = 1 then
			ll_count++
		end if	
	next
	if ll_count < ll_tot_reg then
		dw_cod_modif_det.object.t_clickear.text		= 'Marcar Todos'
	else
		dw_cod_modif_det.object.t_clickear.text		= 'Desmarcar Todos'
	end if
else
	if isnull(ll_cod) or ll_cod=0 then
		messagebox("Advertencia","Debe Seleccionar Registro")
	end if
end if
end event

type cb_grabar from commandbutton within w_cd_mantenedor_contrato
integer x = 46
integer y = 1700
integer width = 270
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string	ls_glosa
long ll_tot_reg,ll_res,ll_count

dw_lista.accepttext()
dw_glosa.accepttext()
ll_tot_reg						= dw_lista.rowcount()
if ll_tot_reg > 0 then
	ls_glosa						= dw_glosa.getitemstring(1,'glosa')				
	if is_graba='S' then
		ll_res						= 1
	elseif is_graba='N' then
		ll_res						= messagebox('Guardar','Desea Guardar Modificaciones',Exclamation!,YesNo!,2)
	end if
	if ll_res= 1 then
		if dw_lista.update() = 1 then
			commit;
			UPDATE	"CD_FOLIO_DETALLE_EXCEPCION"  
			SET 		"CD_FOLIO_DETALLE_EXCEPCION"."OBSERVACION" = :ls_glosa
			WHERE	( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :is_base ) AND  
						( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :is_serie ) AND  
						( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :il_numero ) AND  
						( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_GRUPO_EXCEPCION" = 4 ) AND
						( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_EXCEPCION" = 25 ) AND
						( "CD_FOLIO_DETALLE_EXCEPCION"."ESTADO" = 'V' )
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Detalle Excepción SQL: "+sqlca.sqlerrtext)
			end if
			messagebox("Grabar","Grabación Exitosa")
			is_cerrar				= 'S'	
			if is_clicked='I' then
				is_imprime		= 'S'
			end if
			if isvalid(w_ingreso_detalle_excepciones) then
				w_ingreso_detalle_excepciones.dw_lista_3.setitem(il_fila,'observacion',ls_glosa)
				w_ingreso_detalle_excepciones.dw_lista_3.accepttext()
			//	w_ingreso_detalle_excepciones.cb_grabar.triggerevent(clicked!)
			end if
			if is_graba = 'N' then
				if isvalid(w_ingreso_detalle_excepciones) then
					messagebox("Advertencia","No Olvide Grabar Modificación Contrato :"+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,##0'))
				end if
				close(w_cd_mantenedor_contrato)
			end if
		else
			rollback;
			messagebox('Error','Error al Grabar CD_MODIFICACION_CTTO SQL: '+sqlca.sqlerrtext)
		end if
	end if	
else
	ll_res						= messagebox('Guardar','Desea Guardar Modificaciones',Exclamation!,YesNo!,2)
	if ll_res=1 then
		if dw_lista.update() = 1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			is_cerrar				= 'S'	
			if is_clicked='I' then
				is_imprime		= 'S'
			end if
			if isvalid(w_ingreso_detalle_excepciones) or isvalid(w_consultar_documentos_pendientes) or isvalid(w_docto_pendiente_estructura)  then
				if isvalid(w_ingreso_detalle_excepciones) then 
					w_ingreso_detalle_excepciones.cb_eliminar.triggerevent(clicked!)
					w_ingreso_detalle_excepciones.dw_lista_3.accepttext()
				elseif isvalid(w_consultar_documentos_pendientes) then 
					w_consultar_documentos_pendientes.cb_eliminar.triggerevent(clicked!)
					w_consultar_documentos_pendientes.dw_lista.accepttext()
				elseif isvalid(w_docto_pendiente_estructura) then 
					messagebox("Adverencia","Desea Eliminar Registro Pendiente Modificación de Contrato")
				end if
				SELECT count("BASE")  
			 	INTO 		:ll_count  
				FROM		"CD_FOLIO_DETALLE_EXCEPCION"  
				WHERE 	( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :is_base ) AND  
							( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :is_serie ) AND  
							( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :il_numero ) AND 
							( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_GRUPO_EXCEPCION" = 4 ) AND
							( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_EXCEPCION" = 25 ) AND
							( "CD_FOLIO_DETALLE_EXCEPCION"."ESTADO" = 'V' )
				USING	sqlca;
				if isnull(ll_count) then ll_count=0
				if ll_count>0 then
					UPDATE	"CD_FOLIO_DETALLE_EXCEPCION"  
					SET 		"ESTADO" = 'I',
								"ESTADO_ENTREGA" = 'X', 
								"ESTADO_ENTREGA_OPERA" = 'X', 
								"USUARIO_ELIMINAR" = :gs_user  
					WHERE	( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :is_base ) AND  
								( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :is_serie ) AND  
								( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :il_numero ) AND  
								( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_GRUPO_EXCEPCION" = 4 ) AND
								( "CD_FOLIO_DETALLE_EXCEPCION"."CODIGO_EXCEPCION" = 25 ) AND
								( "CD_FOLIO_DETALLE_EXCEPCION"."ESTADO" = 'V' )
					USING	sqlca;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
					else
						rollback using sqlca;
						messagebox("Error Grabar","Error Grabar Detalle Excepción SQL: "+sqlca.sqlerrtext)
					end if
				end if
			end if
		end if
	end if
end if
end event

type dw_cod_modif_det from datawindow within w_cd_mantenedor_contrato
integer x = 46
integer y = 324
integer width = 1486
integer height = 1356
integer taborder = 10
string title = "none"
string dataobject = "dw_cd_lista_codigo_det_modif"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna
long	ll_tot_reg,ll_cod_modif,ll_cod_modif_det,ll_marca,ll_indi


dw_cod_modif_det.accepttext()
ls_columna 															= dwo.name
il_row																	= row
if ls_columna = 'est_reg' then
	if il_row > 0 then
		This.SelectRow(0, FALSE)
		This.SelectRow(il_row, TRUE)
		ll_tot_reg													= dw_cod_modif_det.rowcount()
		ll_cod_modif												= dw_cod_modif_det.getitemnumber(il_row,'codigo_modif')
		ll_cod_modif_det											= dw_cod_modif_det.getitemnumber(il_row,'codigo_detalle')
		ll_marca														= dw_cod_modif_det.getitemnumber(il_row,'est_reg')
		dw_cod_modif_det.accepttext()
		if ll_tot_reg>0 then
			if ll_marca=0 then
				wf_lista_modif_ctto(ll_cod_modif,ll_cod_modif_det)
			elseif ll_marca = 1 then
				wf_lista_modif_ctto_eliminar(ll_cod_modif,ll_cod_modif_det)
			end if	
		end if
	end if
elseif ls_columna='t_clickear' then
	ll_tot_reg													= dw_cod_modif_det.rowcount()
	if ll_tot_reg>0 then
		if dw_cod_modif_det.object.t_clickear.text	= 'Marcar Todos' then
			for ll_indi=1 to ll_tot_reg
				ll_cod_modif									= dw_cod_modif_det.getitemnumber(ll_indi,'codigo_modif')
				ll_cod_modif_det								= dw_cod_modif_det.getitemnumber(ll_indi,'codigo_detalle')
				dw_cod_modif_det.setitem(ll_indi,'est_reg',1)
				wf_lista_modif_ctto(ll_cod_modif,ll_cod_modif_det)
				dw_cod_modif_det.accepttext()
			next
			dw_cod_modif_det.object.t_clickear.text		= 'Desmarcar Todos'
		elseif dw_cod_modif_det.object.t_clickear.text	= 'Desmarcar Todos' then
			for ll_indi=1 to ll_tot_reg
				ll_cod_modif									= dw_cod_modif_det.getitemnumber(ll_indi,'codigo_modif')
				ll_cod_modif_det								= dw_cod_modif_det.getitemnumber(ll_indi,'codigo_detalle')
				dw_cod_modif_det.setitem(ll_indi,'est_reg',0)
				wf_lista_modif_ctto_eliminar(ll_cod_modif,ll_cod_modif_det)
				dw_cod_modif_det.accepttext()
			next
			dw_cod_modif_det.object.t_clickear.text		= 'Marcar Todos'
		end if
	end if
end if	
end event

event itemfocuschanged;if row > 0 then
	if getrow() > 0 then
		This.SelectRow(0, FALSE)
		This.SelectRow(getrow(), TRUE)
	end if
end if	
end event

type gb_2 from groupbox within w_cd_mantenedor_contrato
integer x = 50
integer y = 124
integer width = 1184
integer height = 184
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Codigo"
end type

