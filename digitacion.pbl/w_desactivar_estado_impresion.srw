forward
global type w_desactivar_estado_impresion from window
end type
type dw_parque from datawindow within w_desactivar_estado_impresion
end type
type st_4 from statictext within w_desactivar_estado_impresion
end type
type cb_cerrar from commandbutton within w_desactivar_estado_impresion
end type
type cb_grabar from commandbutton within w_desactivar_estado_impresion
end type
type em_final from editmask within w_desactivar_estado_impresion
end type
type st_3 from statictext within w_desactivar_estado_impresion
end type
type em_inicio from editmask within w_desactivar_estado_impresion
end type
type st_2 from statictext within w_desactivar_estado_impresion
end type
type st_1 from statictext within w_desactivar_estado_impresion
end type
type ddlb_lista from dropdownlistbox within w_desactivar_estado_impresion
end type
end forward

global type w_desactivar_estado_impresion from window
integer width = 2080
integer height = 672
boolean titlebar = true
string title = "Desactivar Estado de Impresión"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_parque dw_parque
st_4 st_4
cb_cerrar cb_cerrar
cb_grabar cb_grabar
em_final em_final
st_3 st_3
em_inicio em_inicio
st_2 st_2
st_1 st_1
ddlb_lista ddlb_lista
end type
global w_desactivar_estado_impresion w_desactivar_estado_impresion

on w_desactivar_estado_impresion.create
this.dw_parque=create dw_parque
this.st_4=create st_4
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.em_final=create em_final
this.st_3=create st_3
this.em_inicio=create em_inicio
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_lista=create ddlb_lista
this.Control[]={this.dw_parque,&
this.st_4,&
this.cb_cerrar,&
this.cb_grabar,&
this.em_final,&
this.st_3,&
this.em_inicio,&
this.st_2,&
this.st_1,&
this.ddlb_lista}
end on

on w_desactivar_estado_impresion.destroy
destroy(this.dw_parque)
destroy(this.st_4)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.em_final)
destroy(this.st_3)
destroy(this.em_inicio)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_lista)
end on

event open;Long	ll_max
gf_centrar(w_desactivar_estado_impresion)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
SELECT	Max("PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO")  
INTO 		:ll_max  
FROM 		"PROCESO_TITULO_CTTO_DEFINITIVO"  ;
if isnull(ll_max) or ll_max=0 then ll_max=1
em_inicio.text	= string(ll_max)
em_final.text	= string(ll_max)
end event

type dw_parque from datawindow within w_desactivar_estado_impresion
integer x = 686
integer y = 284
integer width = 649
integer height = 104
integer taborder = 40
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within w_desactivar_estado_impresion
integer x = 160
integer y = 300
integer width = 489
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_desactivar_estado_impresion
integer x = 1696
integer y = 440
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_desactivar_estado_impresion)
end event

type cb_grabar from commandbutton within w_desactivar_estado_impresion
integer x = 41
integer y = 440
integer width = 823
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar Estado de Impresión"
end type

event clicked;String	ls_tipo
Long		ll_corr_ini,ll_corr_fin,ll_cod_parque,ll_count,ll_resta,ll_res

dw_parque.accepttext()
ls_tipo			= trim(ddlb_lista.text)
ll_corr_ini		= long(em_inicio.text)
ll_corr_fin		= long(em_final.text)
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if isnull(ls_tipo) or ls_tipo='' then
	messagebox("Advertencia","Debe Seleccionar Tipo Documento a Desactivar")
	ddlb_lista.setfocus()
elseif isnull(ll_corr_ini) or ll_corr_ini=0 then
	messagebox("Advertencia","Debe Ingresar Correlativo Inicial")
	em_inicio.setfocus()
elseif isnull(ll_corr_fin) or ll_corr_fin=0 then
	messagebox("Advertencia","Debe Ingresar Correlativo Final")
	em_final.setfocus()
elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
	messagebox("Advertencia","Debe Ingresar Parque")
	dw_parque.setfocus()
else
	ll_resta	= ll_corr_fin - ll_corr_ini
	ll_resta ++
	if ll_resta = 1 then
		ll_res	= messagebox("Advertencia","Está Seguro desactivar 1 Documento",Exclamation!,YesNo!,2)
	else
		ll_res	= messagebox("Advertencia","Está Seguro desactivar "+string(ll_resta,'###,###,###,###,###,###')+" Documentos",Exclamation!,YesNo!,2)
	end if
	if ll_corr_fin >= ll_corr_ini then
		if ll_res = 1 then
			SELECT	COUNT("PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO")  
			INTO 		:ll_count  
			FROM 		"PROCESO_TITULO_CTTO_DEFINITIVO"  
			WHERE  ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" >= :ll_corr_ini ) AND  
					 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" <= :ll_corr_fin ) AND  
					 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."COD_PARQUE" = :ll_cod_parque )   
			USING		sqlca;
			if ll_count>0 then
				CHOOSE CASE ls_tipo
					CASE 'Carta Aviso'
						UPDATE	"PROCESO_TITULO_CTTO_DEFINITIVO"  
						SET 		"ESTADO_AVISO_TITULO" = 'P'  
						WHERE  ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" >= :ll_corr_ini ) AND  
								 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" <= :ll_corr_fin ) AND
								 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."COD_PARQUE" = :	ll_cod_parque)
						USING		sqlca;
		
					CASE 'Titulo Dominio'
						UPDATE	"PROCESO_TITULO_CTTO_DEFINITIVO"  
						SET 		"ESTADO_PRINT_TITULO" = 'P'  
						WHERE  ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" >= :ll_corr_ini ) AND  
								 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" <= :ll_corr_fin ) AND
								 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."COD_PARQUE" = :	ll_cod_parque)
						USING		sqlca;
		
					CASE 'Contrato Definitivo'
						UPDATE	"PROCESO_TITULO_CTTO_DEFINITIVO"  
						SET 		"ESTADO_PRINT_CTTO_DEF" = 'P'  
						WHERE  ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" >= :ll_corr_ini ) AND  
								 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" <= :ll_corr_fin ) AND
								 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."COD_PARQUE" = :	ll_cod_parque)
						USING		sqlca;
		
					CASE 'Etiqueta'
						UPDATE	"PROCESO_TITULO_CTTO_DEFINITIVO"  
						SET 		"ESTADO_PRINT_ETIQUETA" = 'P'  
						WHERE  ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" >= :ll_corr_ini ) AND  
								 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" <= :ll_corr_fin ) AND
								 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."COD_PARQUE" = :	ll_cod_parque)  
						USING		sqlca;
		
					CASE 'Generar Libro Registro'
						UPDATE	"PROCESO_TITULO_CTTO_DEFINITIVO"  
						SET 		"ESTADO_GENERA_LIBRO" = 'P'  
						WHERE  ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" >= :ll_corr_ini ) AND  
								 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."CORRELATIVO" <= :ll_corr_fin ) AND
								 ( "PROCESO_TITULO_CTTO_DEFINITIVO"."COD_PARQUE" = :	ll_cod_parque)  
						USING		sqlca;
		
				END CHOOSE
				if sqlca.sqlcode=0 then
					commit;
					INSERT INTO "LOG_DESACTIVA_TITULO_CTTO"
								 ( "TIPO_DCTO",	"CORRELATIVO_INI",	"CORRELATIVO_FIN",	"COD_PARQUE",		"USUARIO")
					VALUES 	 ( :ls_tipo,		:ll_corr_ini,			:ll_corr_fin,			:ll_cod_parque,	:gs_user)  
					USING		sqlca	;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					messagebox("Grabar","Grabación Exitosa, Se ha Desactivado Correctamente")
					if w_informar_titulo_de_dominio.dw_lista.rowcount()>0 then
						w_informar_titulo_de_dominio.dw_lista.reset()
						w_informar_titulo_de_dominio.pb_aceptar.triggerevent(clicked!)
					end if
					cb_cerrar.triggerevent(clicked!)
				else
					rollback;
					messagebox("Error Grabar","Error al Desactivar SQL: "+sqlca.sqlerrtext)
				end if
			else
				messagebox("Advertencia","No Registra Datos a Modificar Estado")
				em_inicio.setfocus()
			end if
		end if
	else
		messagebox("Advertencia","Rango Correlativo Inválido, Rango Final debe ser Mayor o Igual al Rango Inicial")
		em_final.setfocus()
	end if
end if
end event

type em_final from editmask within w_desactivar_estado_impresion
integer x = 1504
integer y = 164
integer width = 512
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
boolean spin = true
end type

type st_3 from statictext within w_desactivar_estado_impresion
integer x = 1266
integer y = 180
integer width = 187
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
boolean focusrectangle = false
end type

type em_inicio from editmask within w_desactivar_estado_impresion
integer x = 686
integer y = 164
integer width = 512
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
boolean spin = true
end type

type st_2 from statictext within w_desactivar_estado_impresion
integer x = 50
integer y = 180
integer width = 599
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "CORRELATIVO Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_desactivar_estado_impresion
integer x = 160
integer y = 60
integer width = 489
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desactivar"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_lista from dropdownlistbox within w_desactivar_estado_impresion
integer x = 686
integer y = 44
integer width = 1330
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
string item[] = {"Carta Aviso","Titulo Dominio","Contrato Definitivo","Etiqueta","Generar Libro Registro"}
borderstyle borderstyle = stylelowered!
end type

