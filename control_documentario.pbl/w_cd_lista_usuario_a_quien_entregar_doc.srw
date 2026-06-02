forward
global type w_cd_lista_usuario_a_quien_entregar_doc from window
end type
type cb_aeptar from commandbutton within w_cd_lista_usuario_a_quien_entregar_doc
end type
type cb_cerrar from commandbutton within w_cd_lista_usuario_a_quien_entregar_doc
end type
type dw_lista from datawindow within w_cd_lista_usuario_a_quien_entregar_doc
end type
end forward

global type w_cd_lista_usuario_a_quien_entregar_doc from window
integer width = 2898
integer height = 1484
boolean titlebar = true
string title = "Lista de Usuarios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_aeptar cb_aeptar
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_cd_lista_usuario_a_quien_entregar_doc w_cd_lista_usuario_a_quien_entregar_doc

type variables
Long	il_row
end variables

on w_cd_lista_usuario_a_quien_entregar_doc.create
this.cb_aeptar=create cb_aeptar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_aeptar,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_cd_lista_usuario_a_quien_entregar_doc.destroy
destroy(this.cb_aeptar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;String		ls_depto

gf_centrar(w_cd_lista_usuario_a_quien_entregar_doc)
dw_lista.settransobject(sqlca)
ls_depto		= Message.StringParm
if isnull(ls_depto) or ls_depto='' then ls_depto='%'
dw_lista.retrieve(ls_depto)
//if gs_depto='V' or gs_depto='D' then
//	dw_lista.retrieve('O','P')
//else
//	dw_lista.retrieve('V','D')
//end if
end event

type cb_aeptar from commandbutton within w_cd_lista_usuario_a_quien_entregar_doc
integer x = 46
integer y = 1256
integer width = 320
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;String	ls_nombre_usuario
if il_row>0 and dw_lista.rowcount()>0 then
	gs_usuario_entregar															= dw_lista.getitemstring(il_row,'codigo_usuario')
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre_usuario  
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_usuario_entregar   
	USING		sqlca;
	if sqlca.sqlcode=0 then 
		if isvalid(w_cd_entrega_de_folios_a_departamento) then
			w_cd_entrega_de_folios_a_departamento.st_entregar_a.text	= ls_nombre_usuario
		end if
		if isvalid(w_cd_asignar_folio) then
			w_cd_asignar_folio.st_entregar_a.text							= ls_nombre_usuario
		end if
		cb_cerrar.triggerevent(clicked!)
	end if
end if
end event

type cb_cerrar from commandbutton within w_cd_lista_usuario_a_quien_entregar_doc
integer x = 2528
integer y = 1256
integer width = 320
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_lista_usuario_a_quien_entregar_doc)
end event

type dw_lista from datawindow within w_cd_lista_usuario_a_quien_entregar_doc
integer x = 46
integer y = 44
integer width = 2802
integer height = 1168
integer taborder = 10
string dataobject = "dw_lista_encargados_por_depto"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	cb_aeptar.triggerevent(clicked!)
end if
end event

