forward
global type w_prueba2 from window
end type
type cb_3 from commandbutton within w_prueba2
end type
type cb_2 from commandbutton within w_prueba2
end type
type dw_print from datawindow within w_prueba2
end type
type cb_1 from commandbutton within w_prueba2
end type
type dw_1 from datawindow within w_prueba2
end type
end forward

global type w_prueba2 from window
integer width = 3333
integer height = 2148
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
dw_print dw_print
cb_1 cb_1
dw_1 dw_1
end type
global w_prueba2 w_prueba2

type variables
String		is_tipo_carta
Long		il_folio,il_rut
end variables

event open;String		LS_DV_FALLECIDO,LS_NOMBRES_FALL,LS_APELLIDO_PATERNO_FALL,LS_APELLIDO_MATERNO_FALL,LS_NOMBRES_TIT,LS_APELLIDO_PATERNO_TIT,&
			LS_APELLIDO_MATERNO_TIT,LS_RUT_TITULAR,LS_DV_TITULAR,ls_dv,ls_nom
Long		LL_RUT_FALLECIDO,LL_EDAD_NUMERO,LL_NUMERO,ll_new
Datetime	LDT_FECHA_NACIMIENTO,LDT_FECHA_DEFUNCION
gf_centrar(w_prueba2)
is_tipo_carta        = substr(1,1, Message.StringParm)
il_folio        			= Long(substr(1,2, Message.StringParm))
il_rut            		= Long(substr(1,3, Message.StringParm))
if is_tipo_carta='C74' then
	dw_1.dataobject	= 'dw_prueba2'
	dw_1.settransobject(sqlca)
	SELECT "FC_FALLECIDO"."RUT_FALLECIDO",  
				"FC_FALLECIDO"."DV_FALLECIDO",  
				"FC_FALLECIDO"."NOMBRES",  
				"FC_FALLECIDO"."APELLIDO_PATERNO",  
				"FC_FALLECIDO"."APELLIDO_MATERNO",  
				"FC_FALLECIDO"."FECHA_NACIMIENTO",  
				"FC_TITULAR"."NOMBRES",  
				"FC_TITULAR"."APELLIDO_PATERNO",  
				"FC_TITULAR"."APELLIDO_MATERNO",  
				"FC_TITULAR"."RUT_TITULAR",  
				"FC_TITULAR"."DV_TITULAR",  
				"FC_FALLECIDO"."EDAD_NUMERO",  
				"FC_TITULAR"."NUMERO",  
				"FC_FALLECIDO"."FECHA_DEFUNCION"
	INTO :LL_RUT_FALLECIDO,
			:LS_DV_FALLECIDO,
			:LS_NOMBRES_FALL,
			:LS_APELLIDO_PATERNO_FALL,
			:LS_APELLIDO_MATERNO_FALL,
			:LDT_FECHA_NACIMIENTO,
			:LS_NOMBRES_TIT,
			:LS_APELLIDO_PATERNO_TIT,
			:LS_APELLIDO_MATERNO_TIT,
			:LS_RUT_TITULAR,
			:LS_DV_TITULAR,
			:LL_EDAD_NUMERO,
			:LL_NUMERO,
			:LDT_FECHA_DEFUNCION
	FROM "FC_CABECERA",  
			"FC_FALLECIDO",  
			"FC_TITULAR"
	WHERE ( "FC_TITULAR"."FOLIO_CREMATORIO" = "FC_CABECERA"."FOLIO_CREMATORIO" ) and
			( "FC_FALLECIDO"."FOLIO_CREMATORIO" = "FC_CABECERA"."FOLIO_CREMATORIO" ) and
			( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		ll_new		= dw_1.insertrow(0)
		dw_1.setitem(ll_new,'nombre_fallecido',LS_NOMBRES_FALL )
		dw_1.setitem(ll_new,'apellido_paterno_fallecido',LS_APELLIDO_PATERNO_FALL )
		dw_1.setitem(ll_new,'apellido_materno_fallecido',LS_APELLIDO_MATERNO_FALL )
		dw_1.setitem(ll_new,'folio_crematorio',il_folio )
		
	end if
elseif is_tipo_carta='EIE' then
	dw_1.dataobject	= 'dw_carta_extraccion_ie'
	dw_1.settransobject(sqlca)
	w_prueba2.title		= 'Carta Extracción Implantes Electrónicos'
	if dw_1.retrieve(il_folio) = 0 then
		SELECT	"FC_FALLECIDO"."RUT_FALLECIDO",
					"FC_FALLECIDO"."DV_FALLECIDO",
					"FC_FALLECIDO"."NOMBRES",
					"FC_FALLECIDO"."APELLIDO_PATERNO",
					"FC_FALLECIDO"."APELLIDO_MATERNO"
		INTO		:LL_RUT_FALLECIDO,
					:LS_DV_FALLECIDO,
					:LS_NOMBRES_FALL,
					:LS_APELLIDO_PATERNO_FALL,
					:LS_APELLIDO_MATERNO_FALL
		FROM 	"FC_CABECERA",	"FC_FALLECIDO"
		WHERE ( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and
				  ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio )
		USING	sqlca;
		if sqlca.sqlcode=0 then
			ll_new		= dw_1.insertrow(0)
			dw_1.setitem(ll_new,'numero_crematorio',il_folio )
			dw_1.setitem(ll_new,'nombre_fallecido',LS_NOMBRES_FALL )
			dw_1.setitem(ll_new,'ap_paterno_fallecido',LS_APELLIDO_PATERNO_FALL )
			dw_1.setitem(ll_new,'ap_materno_fallecido',LS_APELLIDO_MATERNO_FALL )
			dw_1.setitem(ll_new,'rut_fallecido',LL_RUT_FALLECIDO )
			dw_1.setitem(ll_new,'dv_fallecido',LS_DV_FALLECIDO )
			dw_1.setitem(ll_new,'fecha_extraccion',date(gdt_fec_sistema))
			dw_1.accepttext()
		end if
	end if
end if
dw_1.setfocus()
end event

on w_prueba2.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_print=create dw_print
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.dw_print,&
this.cb_1,&
this.dw_1}
end on

on w_prueba2.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_print)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_3 from commandbutton within w_prueba2
integer x = 2770
integer y = 1900
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_prueba2)
end event

type cb_2 from commandbutton within w_prueba2
integer x = 713
integer y = 1876
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if is_tipo_carta='EIE' then
	dw_print.dataobject	= 'dw_carta_extraccion_ie_print'
	dw_print.settransobject(sqlca)
	if dw_print.retrieve(il_folio) > 0 then 
		dw_print.print()
//		f_printdlg(dw_print,gstr_print,w_prueba2)
	end if
end if
end event

type dw_print from datawindow within w_prueba2
boolean visible = false
integer x = 1490
integer y = 1940
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_carta_extraccion_ie_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_prueba2
integer x = 55
integer y = 1868
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;if dw_1.update()=1 then
	commit;
	messagebox("Grabar","Grabacion Exitosa")
else
	rollback;
	messagebox("Error Grabar","Error al Grabar Carta SQL: "+sqlca.sqlerrtext)
end if
end event

type dw_1 from datawindow within w_prueba2
integer x = 27
integer y = 28
integer width = 3223
integer height = 1792
integer taborder = 10
string title = "none"
string dataobject = "dw_carta_extraccion_ie"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.accepttext()
end event

