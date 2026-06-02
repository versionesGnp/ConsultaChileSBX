forward
global type w_cd_consultar_folios_no_registrados from window
end type
type hpb_1 from hprogressbar within w_cd_consultar_folios_no_registrados
end type
type st_tot_reg from statictext within w_cd_consultar_folios_no_registrados
end type
type pb_aceptar from picturebutton within w_cd_consultar_folios_no_registrados
end type
type ddlb_ctto from dropdownlistbox within w_cd_consultar_folios_no_registrados
end type
type st_1 from statictext within w_cd_consultar_folios_no_registrados
end type
type cb_limpiar from commandbutton within w_cd_consultar_folios_no_registrados
end type
type cb_imprimir from commandbutton within w_cd_consultar_folios_no_registrados
end type
type cb_exportar from commandbutton within w_cd_consultar_folios_no_registrados
end type
type cb_cerrar from commandbutton within w_cd_consultar_folios_no_registrados
end type
type gb_3 from groupbox within w_cd_consultar_folios_no_registrados
end type
type st_2 from statictext within w_cd_consultar_folios_no_registrados
end type
type st_porc from statictext within w_cd_consultar_folios_no_registrados
end type
type st_fondo from statictext within w_cd_consultar_folios_no_registrados
end type
type dw_lista from datawindow within w_cd_consultar_folios_no_registrados
end type
end forward

global type w_cd_consultar_folios_no_registrados from window
integer width = 3374
integer height = 1740
boolean titlebar = true
string title = "Folios NO Registrados en B.D."
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
hpb_1 hpb_1
st_tot_reg st_tot_reg
pb_aceptar pb_aceptar
ddlb_ctto ddlb_ctto
st_1 st_1
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_cerrar cb_cerrar
gb_3 gb_3
st_2 st_2
st_porc st_porc
st_fondo st_fondo
dw_lista dw_lista
end type
global w_cd_consultar_folios_no_registrados w_cd_consultar_folios_no_registrados

on w_cd_consultar_folios_no_registrados.create
this.hpb_1=create hpb_1
this.st_tot_reg=create st_tot_reg
this.pb_aceptar=create pb_aceptar
this.ddlb_ctto=create ddlb_ctto
this.st_1=create st_1
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.st_2=create st_2
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.dw_lista=create dw_lista
this.Control[]={this.hpb_1,&
this.st_tot_reg,&
this.pb_aceptar,&
this.ddlb_ctto,&
this.st_1,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_cerrar,&
this.gb_3,&
this.st_2,&
this.st_porc,&
this.st_fondo,&
this.dw_lista}
end on

on w_cd_consultar_folios_no_registrados.destroy
destroy(this.hpb_1)
destroy(this.st_tot_reg)
destroy(this.pb_aceptar)
destroy(this.ddlb_ctto)
destroy(this.st_1)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_cerrar)
destroy(this.gb_3)
destroy(this.st_2)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.dw_lista)
end on

event open;String	ls_codigo, ls_descrip,ls_ctto
gf_centrar(w_cd_consultar_folios_no_registrados)
dw_lista.settransobject(sqlca)
DECLARE x1 CURSOR FOR  
SELECT	"CD_TIPO_CONTRATO"."CODIGO",   
			"CD_TIPO_CONTRATO"."DESCRIPCION"  
FROM 		"CD_TIPO_CONTRATO"  
ORDER BY "CD_TIPO_CONTRATO"."CODIGO" ASC  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_codigo, :ls_descrip;
		if not isnull(ls_codigo) and not isnull(ls_descrip) then
			ls_ctto	= ls_codigo+' - '+ls_descrip
			ddlb_ctto.additem(ls_ctto)
			Setnull(ls_codigo);setnull(ls_descrip)
		end if
	LOOP
end if
close x1;
st_tot_reg.text	= 'Total de Registros:  '+string(dw_lista.rowcount(),"###,###,###,###,###,##0")
st_fondo.visible	= false
hpb_1.visible 		= false
st_porc.visible 	= false
end event

type hpb_1 from hprogressbar within w_cd_consultar_folios_no_registrados
boolean visible = false
integer x = 965
integer y = 944
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_tot_reg from statictext within w_cd_consultar_folios_no_registrados
integer x = 855
integer y = 1504
integer width = 2112
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 80269524
string text = "Total de ANEXO LIBERADOR No Registrados en B.D.:  0"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_aceptar from picturebutton within w_cd_consultar_folios_no_registrados
integer x = 2043
integer y = 28
integer width = 178
integer height = 156
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_min_folio,ll_max_folio,ll_indi,ll_new,ll_tot_porc,&
			ll_tot_porc_aux,ll_tot_reg
String		ls_base,ls_descrip
Double	ll_num_aux

SetPointer(HourGlass!)
ls_base	= mid(trim(ddlb_ctto.text),1,1)
if ls_base='O' then
	st_2.text	= 'Promesas NO Registradas'
elseif ls_base='L' then
	st_2.text	= 'Anexo Liberadores NO Registradas'
elseif ls_base='A' then
	st_2.text	= 'Aumento Capacidad NO Registradas'
elseif ls_base='P' then
	st_2.text	= 'Pagares NO Registrados'
elseif ls_base='U' then
	st_2.text	= 'Columbario NO Registrados'
end if
if not isnull(ls_base) and ls_base<>'' then
	dw_lista.reset()
	SELECT	MIN("CD_FOLIO"."NUMERO")  
	INTO 		:ll_min_folio  
	FROM 		"CD_FOLIO"  
	WHERE 	"CD_FOLIO"."BASE" = :ls_base   
	Using		sqlca;
	if ll_min_folio>0 then
		SELECT	MAX("CD_FOLIO"."NUMERO")  
		INTO 		:ll_max_folio  
		FROM 		"CD_FOLIO"  
		WHERE 	"CD_FOLIO"."BASE" = :ls_base   
		Using		sqlca;
		if ll_max_folio>0 then
			SELECT	"CD_TIPO_CONTRATO"."DESCRIPCION"  
			INTO 		:ls_descrip  
			FROM 		"CD_TIPO_CONTRATO"  
			WHERE 	"CD_TIPO_CONTRATO"."CODIGO" = :ls_base ;
			st_fondo.visible				= true
			hpb_1.visible 					= true
			st_porc.visible 				= true
			ll_tot_porc						= 0
			ll_tot_porc_aux				= 0			
			ll_tot_reg						= ll_max_folio - ll_min_folio
			hpb_1.Position					= ll_tot_porc
			for ll_indi=ll_min_folio to ll_max_folio
				SELECT	"CD_FOLIO"."NUMERO"  
				INTO 		:ll_num_aux  
				FROM 		"CD_FOLIO"  
				WHERE 	"CD_FOLIO"."BASE" = :ls_base and 
							"CD_FOLIO"."NUMERO" = :ll_indi  
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					ll_new	= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new)
					dw_lista.setitem(ll_new,'numero',ll_indi)
					dw_lista.setitem(ll_new,'base',ls_base)
				end if
				if ll_tot_porc <> ll_tot_porc_aux then 
					st_porc.text		= string(ll_tot_porc)+" %"
					ll_tot_porc_aux	= ll_tot_porc
				end if
				ll_tot_porc				= (ll_indi / ll_tot_reg) * 100
				hpb_1.Position 		= ll_tot_porc
				dw_lista.accepttext()
			next
			st_fondo.visible			= false
			hpb_1.visible 				= false
			st_porc.visible 			= false
			dw_lista.accepttext()
			ll_tot_reg					= dw_lista.rowcount()
			if ll_tot_reg=0 or ll_tot_reg=1 then
				st_tot_reg.text		= 'Total de '+ls_descrip+' No Registrado en B.D.:  '+string(ll_tot_reg,"###,###,###,###,###,##0")
			elseif ll_tot_reg>1 then
				st_tot_reg.text		= 'Total de '+ls_descrip+' No Registrados en B.D.:  '+string(ll_tot_reg,"###,###,###,###,###,##0")
			end if
			if ll_tot_reg=0 then 
				messagebox("Advertencia","No se detectó Anomalías en "+ls_descrip)
			else
				dw_lista.Scrolltorow(1)
			end if
		end if
	end if
else
	messagebox("Advertencia","Debe Seleccionar Base")
	ddlb_ctto.setfocus()
end if
SetPointer(Arrow!)
end event

type ddlb_ctto from dropdownlistbox within w_cd_consultar_folios_no_registrados
integer x = 261
integer y = 56
integer width = 1714
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
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String	ls_base

ls_base	= mid(trim(ddlb_ctto.text),1,1)
if not isnull(ls_base) and ls_base<>'' then pb_aceptar.triggerevent(clicked!)
end event

type st_1 from statictext within w_cd_consultar_folios_no_registrados
integer x = 55
integer y = 64
integer width = 155
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base"
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within w_cd_consultar_folios_no_registrados
event ue_mousemove pbm_mousemove
integer x = 69
integer y = 1500
integer width = 229
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_lista.reset()
st_2.text			= 'Folios NO Registrados'
st_tot_reg.text	= 'Total de Registros:  '+string(dw_lista.rowcount(),"###,###,###,###,###,##0")
end event

type cb_imprimir from commandbutton within w_cd_consultar_folios_no_registrados
event ue_mousemove pbm_mousemove
integer x = 320
integer y = 1500
integer width = 229
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_exportar from commandbutton within w_cd_consultar_folios_no_registrados
event ue_mousemove pbm_mousemove
integer x = 571
integer y = 1500
integer width = 229
integer height = 80
integer taborder = 30
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

type cb_cerrar from commandbutton within w_cd_consultar_folios_no_registrados
integer x = 3031
integer y = 1492
integer width = 274
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_consultar_folios_no_registrados)
end event

type gb_3 from groupbox within w_cd_consultar_folios_no_registrados
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1448
integer width = 791
integer height = 156
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_2 from statictext within w_cd_consultar_folios_no_registrados
integer x = 46
integer y = 188
integer width = 3259
integer height = 128
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Folios NO Registrados"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_porc from statictext within w_cd_consultar_folios_no_registrados
boolean visible = false
integer x = 1536
integer y = 868
integer width = 233
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fondo from statictext within w_cd_consultar_folios_no_registrados
boolean visible = false
integer x = 937
integer y = 840
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_cd_consultar_folios_no_registrados
integer x = 46
integer y = 328
integer width = 3259
integer height = 1116
integer taborder = 10
string title = "none"
string dataobject = "dwe_consulta_folios_no_registrados"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

