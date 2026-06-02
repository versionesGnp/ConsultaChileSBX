forward
global type w_enviar_email_documento_eliminado from window
end type
type em_buscar from editmask within w_enviar_email_documento_eliminado
end type
type st_6 from statictext within w_enviar_email_documento_eliminado
end type
type em_asunto from editmask within w_enviar_email_documento_eliminado
end type
type em_copia from editmask within w_enviar_email_documento_eliminado
end type
type em_para from editmask within w_enviar_email_documento_eliminado
end type
type st_5 from statictext within w_enviar_email_documento_eliminado
end type
type st_4 from statictext within w_enviar_email_documento_eliminado
end type
type st_3 from statictext within w_enviar_email_documento_eliminado
end type
type st_2 from statictext within w_enviar_email_documento_eliminado
end type
type st_1 from statictext within w_enviar_email_documento_eliminado
end type
type pb_eliminar from picturebutton within w_enviar_email_documento_eliminado
end type
type pb_agregar from picturebutton within w_enviar_email_documento_eliminado
end type
type cb_enviar from commandbutton within w_enviar_email_documento_eliminado
end type
type cb_cerrar from commandbutton within w_enviar_email_documento_eliminado
end type
type dw_destinatarios from datawindow within w_enviar_email_documento_eliminado
end type
type dw_encargados from datawindow within w_enviar_email_documento_eliminado
end type
type gb_1 from groupbox within w_enviar_email_documento_eliminado
end type
type mle_texto from multilineedit within w_enviar_email_documento_eliminado
end type
type gb_2 from groupbox within w_enviar_email_documento_eliminado
end type
end forward

global type w_enviar_email_documento_eliminado from window
integer width = 2816
integer height = 2040
boolean titlebar = true
string title = "Envio Email Eliminación de Comprobante"
windowtype windowtype = response!
long backcolor = 67108864
em_buscar em_buscar
st_6 st_6
em_asunto em_asunto
em_copia em_copia
em_para em_para
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
pb_eliminar pb_eliminar
pb_agregar pb_agregar
cb_enviar cb_enviar
cb_cerrar cb_cerrar
dw_destinatarios dw_destinatarios
dw_encargados dw_encargados
gb_1 gb_1
mle_texto mle_texto
gb_2 gb_2
end type
global w_enviar_email_documento_eliminado w_enviar_email_documento_eliminado

type variables
Long			il_row_origen,il_row_destino
String		is_tipo_cob
Long			il_folio,il_sw=0
DragObject	control_dw,control_dw_1
end variables

on w_enviar_email_documento_eliminado.create
this.em_buscar=create em_buscar
this.st_6=create st_6
this.em_asunto=create em_asunto
this.em_copia=create em_copia
this.em_para=create em_para
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.pb_eliminar=create pb_eliminar
this.pb_agregar=create pb_agregar
this.cb_enviar=create cb_enviar
this.cb_cerrar=create cb_cerrar
this.dw_destinatarios=create dw_destinatarios
this.dw_encargados=create dw_encargados
this.gb_1=create gb_1
this.mle_texto=create mle_texto
this.gb_2=create gb_2
this.Control[]={this.em_buscar,&
this.st_6,&
this.em_asunto,&
this.em_copia,&
this.em_para,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.pb_eliminar,&
this.pb_agregar,&
this.cb_enviar,&
this.cb_cerrar,&
this.dw_destinatarios,&
this.dw_encargados,&
this.gb_1,&
this.mle_texto,&
this.gb_2}
end on

on w_enviar_email_documento_eliminado.destroy
destroy(this.em_buscar)
destroy(this.st_6)
destroy(this.em_asunto)
destroy(this.em_copia)
destroy(this.em_para)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_eliminar)
destroy(this.pb_agregar)
destroy(this.cb_enviar)
destroy(this.cb_cerrar)
destroy(this.dw_destinatarios)
destroy(this.dw_encargados)
destroy(this.gb_1)
destroy(this.mle_texto)
destroy(this.gb_2)
end on

event open;String	ls_asunto,ls_glosa,ls_nombre,ls_email,ls_usuario
Long		ll_new

gf_centrar(w_enviar_email_documento_eliminado)
ls_asunto			= trim(substr(1,1,Message.StringParm))
ls_glosa				= trim(substr(1,2,Message.StringParm))
is_tipo_cob			= trim(substr(1,3,Message.StringParm))
il_folio				= long(substr(1,4,Message.StringParm))
SELECT	"ENCARGADOS"."CODIGO_USUARIO",	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."EMAIL"  
INTO 		:ls_usuario,							:ls_nombre,   				:ls_email  
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = 'WAEDO'  AND
			"ENCARGADOS"."ESTADO" = 'A'
USING		sqlca;
if sqlca.sqlcode=0 then
	if ls_usuario=gs_user then
		messagebox("Advertencia","No es posible enviar Email a su Propio Usuario")
	else
		ll_new			= dw_destinatarios.insertrow(0)
		dw_destinatarios.scrolltorow(ll_new)
		dw_destinatarios.setitem(ll_new,'nombre',ls_nombre)
		dw_destinatarios.setitem(ll_new,'email',ls_email)
		dw_destinatarios.accepttext()
		em_para.text	= ls_email
	end if
end if
w_enviar_email_documento_eliminado.title	= 'Envio Email Eliminación de Comprobante '+is_tipo_cob+'-'+string(il_folio,"###,###,###,###,###")
em_asunto.text		= ls_asunto
mle_texto.text		= ls_glosa
dw_encargados.settransobject(sqlca)
dw_destinatarios.settransobject(sqlca)
//dw_encargados.retrieve(gs_depto)
dw_encargados.retrieve()
end event

type em_buscar from editmask within w_enviar_email_documento_eliminado
integer x = 283
integer y = 104
integer width = 965
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;string	ls_nombre
Long		ll_row,ll_largo
ls_nombre		= trim(em_buscar.text)

if not isnull(ls_nombre) and ls_nombre<>'' then
	ll_largo		= len(ls_nombre)
	ls_nombre	= "mid(nombre,1,"+string(ll_largo)+")="+"'"+ls_nombre+"'"
	ll_row 		= dw_encargados.Find(ls_nombre, 1, dw_encargados.RowCount() )
	IF ll_row > 0 THEN
		dw_encargados.ScrollToRow( ll_row )
	ELSE
		MessageBox("Advertencia", "Información Inexistente")
	END IF
end if
end event

type st_6 from statictext within w_enviar_email_documento_eliminado
integer x = 110
integer y = 120
integer width = 174
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar"
boolean focusrectangle = false
end type

type em_asunto from editmask within w_enviar_email_documento_eliminado
integer x = 288
integer y = 1208
integer width = 2423
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
textcase textcase = lower!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type em_copia from editmask within w_enviar_email_documento_eliminado
integer x = 288
integer y = 1064
integer width = 2423
integer height = 136
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
textcase textcase = lower!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type em_para from editmask within w_enviar_email_documento_eliminado
integer x = 288
integer y = 972
integer width = 2423
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
textcase textcase = lower!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type st_5 from statictext within w_enviar_email_documento_eliminado
integer x = 87
integer y = 1224
integer width = 197
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asunto:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_enviar_email_documento_eliminado
integer x = 87
integer y = 1076
integer width = 197
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "C.C..."
boolean focusrectangle = false
end type

type st_3 from statictext within w_enviar_email_documento_eliminado
integer x = 87
integer y = 984
integer width = 197
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Para..."
boolean focusrectangle = false
end type

type st_2 from statictext within w_enviar_email_documento_eliminado
integer x = 1554
integer y = 124
integer width = 1157
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Destinatarios"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_1 from statictext within w_enviar_email_documento_eliminado
integer x = 96
integer y = 208
integer width = 1157
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Lista Usuarios"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type pb_eliminar from picturebutton within w_enviar_email_documento_eliminado
integer x = 1312
integer y = 536
integer width = 187
integer height = 160
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "atras.jpg"
alignment htextalign = left!
end type

event clicked;String	ls_nombre,ls_email,ls_string
Long		ll_new,ll_tot_reg,ll_indi
if il_row_destino>0 then
	em_buscar.text					= ''
	dw_destinatarios.deleterow(il_row_destino)
	setnull(il_row_destino)
	ll_tot_reg						= dw_destinatarios.rowcount()
	dw_destinatarios.accepttext()
	if ll_tot_reg>0 then
		em_copia.text				= ''
		em_para.text				= ''
		if ll_tot_reg=1 then
			em_para.text			= dw_destinatarios.getitemstring(1,'email')
		else
			for ll_indi=1 to ll_tot_reg
				if ll_indi=1 then
					em_para.text	= dw_destinatarios.getitemstring(1,'email')
				else
					ls_email	= dw_destinatarios.getitemstring(ll_indi,'email')
					if ll_indi=2 then
						ls_string	= ls_email 
					else
						ls_string	= ls_string +';'+ ls_email 
					end if
				end if
			next
			em_copia.text	= ls_string
		end if
	else
		em_para.text		= ''
		em_copia.text		= ''
	end if
end if
end event

type pb_agregar from picturebutton within w_enviar_email_documento_eliminado
integer x = 1312
integer y = 284
integer width = 187
integer height = 160
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "adelante.jpg"
alignment htextalign = left!
end type

event clicked;String	ls_nombre,ls_email,ls_string,ls_usuario
Long		ll_new,ll_tot_reg,ll_indi,ll_fila
if il_row_origen>0 then
	em_buscar.text							= ''
	ls_usuario								= dw_encargados.getitemstring(il_row_origen,'codigo_usuario')
	if ls_usuario=gs_user then
		messagebox("Advertencia","No es posible enviar Email a su Propio Usuario")
	else
		ls_nombre							= dw_encargados.getitemstring(il_row_origen,'nombre')
		ls_email								= dw_encargados.getitemstring(il_row_origen,'email')
		ll_fila 								= dw_destinatarios.Find("email ='"+ls_email+"'",1, dw_destinatarios.RowCount())
		if ll_fila>0 then
			messagebox("Advertencia","Ya está seleccionado")
		else
			ll_new							= dw_destinatarios.insertrow(0)
			dw_destinatarios.scrolltorow(ll_new)
			dw_destinatarios.setitem(ll_new,'nombre',ls_nombre)
			dw_destinatarios.setitem(ll_new,'email',ls_email)
			setnull(il_row_origen)
			dw_destinatarios.accepttext()
			ll_tot_reg						= dw_destinatarios.rowcount()
			dw_destinatarios.accepttext()
			if ll_tot_reg>0 then
				em_copia.text				= ''
				em_para.text				= ''
				if ll_tot_reg=1 then
					em_para.text			= dw_destinatarios.getitemstring(1,'email')
				else
					for ll_indi=1 to ll_tot_reg
						if ll_indi=1 then
							em_para.text	= dw_destinatarios.getitemstring(1,'email')
						else		
							ls_email			= dw_destinatarios.getitemstring(ll_indi,'email')
							if ll_indi=2 then
								ls_string	= ls_email 
							else
								ls_string	= ls_string +';'+ ls_email 
							end if
						end if
					next
					em_copia.text			= ls_string
				end if
			else
				em_para.text				= ''
				em_copia.text				= ''
			end if
		end if
	end if
end if
end event

type cb_enviar from commandbutton within w_enviar_email_documento_eliminado
integer x = 41
integer y = 1812
integer width = 306
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enviar"
end type

event clicked;Long		ll_indi,ll_tot_reg,ll_new
String	ls_email,ls_asunto,ls_texto,ls_nombre,ls_string

il_sw			= 0
ll_tot_reg	= dw_destinatarios.rowcount()
if ll_tot_reg>0 then
	SELECT	"AVISO_DOC_ELIMINA_USUARIO_INFO"."EMAIL",
				"AVISO_DOC_ELIMINA_USUARIO_INFO"."NOMBRE"
	INTO 		:ls_email,
				:ls_nombre
	FROM 		"AVISO_DOC_ELIMINA_USUARIO_INFO"  
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ll_new	= dw_destinatarios.insertrow(0)
		dw_destinatarios.setitem(ll_new,'nombre',ls_nombre)
		dw_destinatarios.setitem(ll_new,'email',ls_email)
	end if
	dw_destinatarios.accepttext()
	setnull(il_row_origen)
	ll_tot_reg						= dw_destinatarios.rowcount()
	dw_destinatarios.accepttext()
	if ll_tot_reg>0 then
		il_sw ++
		em_copia.text				= ''
		em_para.text				= ''
		if ll_tot_reg=1 then
			em_para.text			= dw_destinatarios.getitemstring(1,'email')
		else
			for ll_indi=1 to ll_tot_reg
				if ll_indi=1 then
					em_para.text	= dw_destinatarios.getitemstring(1,'email')
				else		
					ls_email			= dw_destinatarios.getitemstring(ll_indi,'email')
					if ll_indi=2 then
						ls_string	= ls_email 
					else
						ls_string	= ls_string +';'+ ls_email 
					end if
				end if
			next
			em_copia.text			= ls_string
		end if
	else
		em_para.text				= ''
		em_copia.text				= ''
	end if
	ls_asunto					= trim(em_asunto.text)
	ls_texto						= trim(mle_texto.text)
	mailsession mses
	mailreturncode mret
	mailmessage mmsg
	mses							= create mailsession
	mret							= mses.maillogon(mailnewsession!)
	if mret <> mailReturnSuccess! then
		return
	end if
	for ll_indi=1 to ll_tot_reg
		ls_email	= dw_destinatarios.getitemstring(ll_indi,'email')
		mmsg.recipient[ll_indi].name	= ls_email
	next
	mmsg.subject				= ls_asunto
	mmsg.notetext				= ls_texto
	mses.mailsend(mmsg)
	if mret <> mailreturnsuccess! then
		return
	end if
	mses.maillogoff()
	destroy mses
	cb_cerrar.triggerevent(clicked!)
else
	messagebox("Advertencia","Debe Seleccionar Usuario para Envio Email")
	dw_encargados.setfocus()
end if
end event

type cb_cerrar from commandbutton within w_enviar_email_documento_eliminado
integer x = 2432
integer y = 1812
integer width = 334
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;if dw_destinatarios.rowcount()>0 and il_sw>0 then
	close(w_enviar_email_documento_eliminado)
else
	messagebox("Advertencia","Ud. debe Enviar Email de Eliminación de Comprobante")
end if
end event

type dw_destinatarios from datawindow within w_enviar_email_documento_eliminado
integer x = 1554
integer y = 196
integer width = 1157
integer height = 616
integer taborder = 50
string dragicon = "Hand!"
string title = "none"
string dataobject = "dwe_lista_usuarios_destinatarios"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_destino	= row
	dw_destinatarios.SelectRow(0, FALSE)
	dw_destinatarios.SelectRow(il_row_destino, TRUE)
	dw_destinatarios.Drag(Begin!)
end if
end event

event doubleclicked;if row>0 then
	il_row_destino	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_destino, TRUE)
	pb_eliminar.triggerevent(clicked!)
end if
end event

event dragdrop;String	ls_nombre,ls_email,ls_string
Long		ll_fila,ll_new,ll_tot_reg,ll_indi
ls_nombre							= dw_encargados.getitemstring(il_row_origen,'nombre')
ls_email								= dw_encargados.getitemstring(il_row_origen,'email')
ll_fila 								= dw_destinatarios.Find("email ='"+ls_email+"'",1, dw_destinatarios.RowCount())
if not isnull(ls_email) then
	if ll_fila>0 then
		messagebox("Advertencia","Ya está seleccionado")
		setnull(il_row_origen)
	else
		control_dw_1 = DraggedObject()
		if il_row_origen > 0 then //control_dw = dw_lista_areas and 
			ll_new						= dw_destinatarios.insertrow(0)
			dw_destinatarios.scrolltorow(ll_new)
			dw_destinatarios.setitem(ll_new,'nombre',ls_nombre)
			dw_destinatarios.setitem(ll_new,'email',ls_email)
			setnull(il_row_origen)
			dw_destinatarios.accepttext()
			ll_tot_reg					= dw_destinatarios.rowcount()
			dw_destinatarios.accepttext()
			if ll_tot_reg>0 then
				em_copia.text			= ''
				em_para.text			= ''
				if ll_tot_reg=1 then
					em_para.text			= dw_destinatarios.getitemstring(1,'email')
				else
					for ll_indi=1 to ll_tot_reg
						if ll_indi=1 then
							em_para.text	= dw_destinatarios.getitemstring(1,'email')
						else		
							ls_email			= dw_destinatarios.getitemstring(ll_indi,'email')
							if ll_indi=2 then
								ls_string	= ls_email 
							else
								ls_string	= ls_string +';'+ ls_email 
							end if
						end if
					next
					em_copia.text		= ls_string
				end if
			else
				em_para.text			= ''
				em_copia.text			= ''
			end if
		end if
	end if
end if
end event

type dw_encargados from datawindow within w_enviar_email_documento_eliminado
integer x = 91
integer y = 280
integer width = 1161
integer height = 532
integer taborder = 20
string dragicon = "Warning!"
string dataobject = "dw_lista_email_encargados_tesorerias"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_origen	= row
	dw_encargados.SelectRow(0, FALSE)
	dw_encargados.SelectRow(il_row_origen, TRUE)
	dw_encargados.Drag(Begin!)
end if
end event

event doubleclicked;if row>0 then
	il_row_origen	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_origen, TRUE)
	pb_agregar.triggerevent(clicked!)
end if
end event

event dragdrop;String	ls_nombre,ls_email,ls_string
Long		ll_new,ll_tot_reg,ll_indi
if il_row_destino>0 then
	control_dw 						= DraggedObject()
	dw_destinatarios.deleterow(il_row_destino)
	setnull(il_row_destino)
	ll_tot_reg						= dw_destinatarios.rowcount()
	dw_destinatarios.accepttext()
	if ll_tot_reg>0 then
		em_copia.text				= ''
		em_para.text				= ''
		if ll_tot_reg=1 then
			em_para.text			= dw_destinatarios.getitemstring(1,'email')
		else
			for ll_indi=1 to ll_tot_reg
				if ll_indi=1 then
					em_para.text	= dw_destinatarios.getitemstring(1,'email')
				else
					ls_email			= dw_destinatarios.getitemstring(ll_indi,'email')
					if ll_indi=2 then
						ls_string	= ls_email 
					else
						ls_string	= ls_string +';'+ ls_email 
					end if
				end if
			next
			em_copia.text		= ls_string
		end if
	else
		em_para.text			= ''
		em_copia.text			= ''
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row_origen	= getrow()
	dw_encargados.SelectRow(0, FALSE)
	dw_encargados.SelectRow(il_row_origen, TRUE)
end if
end event

type gb_1 from groupbox within w_enviar_email_documento_eliminado
integer x = 41
integer y = 32
integer width = 2725
integer height = 828
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Usuario"
borderstyle borderstyle = stylelowered!
end type

type mle_texto from multilineedit within w_enviar_email_documento_eliminado
integer x = 96
integer y = 1316
integer width = 2615
integer height = 400
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
boolean autovscroll = true
textcase textcase = upper!
integer limit = 1000
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type gb_2 from groupbox within w_enviar_email_documento_eliminado
integer x = 41
integer y = 880
integer width = 2725
integer height = 892
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mensaje"
borderstyle borderstyle = stylelowered!
end type

