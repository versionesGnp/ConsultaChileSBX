forward
global type w_exporta_mecanizado_arch from window
end type
type lb_aux from listbox within w_exporta_mecanizado_arch
end type
type rb_dbf3 from radiobutton within w_exporta_mecanizado_arch
end type
type rb_dbf2 from radiobutton within w_exporta_mecanizado_arch
end type
type rb_dif from radiobutton within w_exporta_mecanizado_arch
end type
type rb_wk1 from radiobutton within w_exporta_mecanizado_arch
end type
type rb_wks from radiobutton within w_exporta_mecanizado_arch
end type
type rb_sylk from radiobutton within w_exporta_mecanizado_arch
end type
type rb_sql from radiobutton within w_exporta_mecanizado_arch
end type
type rb_texto from radiobutton within w_exporta_mecanizado_arch
end type
type rb_excel from radiobutton within w_exporta_mecanizado_arch
end type
type cbx_encabezado from checkbox within w_exporta_mecanizado_arch
end type
type st_directorio from statictext within w_exporta_mecanizado_arch
end type
type cb_cancelar from commandbutton within w_exporta_mecanizado_arch
end type
type cb_aceptar from commandbutton within w_exporta_mecanizado_arch
end type
type sle_nombre from singlelineedit within w_exporta_mecanizado_arch
end type
type st_1 from statictext within w_exporta_mecanizado_arch
end type
type gb_formato from groupbox within w_exporta_mecanizado_arch
end type
end forward

global type w_exporta_mecanizado_arch from window
integer x = 594
integer y = 460
integer width = 1600
integer height = 828
boolean titlebar = true
string title = "Grabar Datos Como"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
lb_aux lb_aux
rb_dbf3 rb_dbf3
rb_dbf2 rb_dbf2
rb_dif rb_dif
rb_wk1 rb_wk1
rb_wks rb_wks
rb_sylk rb_sylk
rb_sql rb_sql
rb_texto rb_texto
rb_excel rb_excel
cbx_encabezado cbx_encabezado
st_directorio st_directorio
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
sle_nombre sle_nombre
st_1 st_1
gb_formato gb_formato
end type
global w_exporta_mecanizado_arch w_exporta_mecanizado_arch

type variables
datawindow dw_paso
SaveAsType TipoArchivo
end variables

event open;string 	fecha,ls_parque,ls_obs,ls_fecha
Long		ll_pos,ll_cod_parque,ll_mes,ll_year

gf_centrar(w_exporta_mecanizado_arch)
dw_paso 					= Message.PowerObjectParm
lb_aux.DirList("*.DBF", 16, st_directorio)
rb_excel.Checked		= True
TipoArchivo 					= XLSX!
if isvalid(w_administrar_cuponera) then
	ll_mes				= month(today())
	ll_year				= year(today())
	if w_administrar_cuponera.tab_1.SelectedTab = 4 then
		ll_mes ++
		if ll_mes > 12 then 
			ll_mes	= 1
			ll_year ++
		end if
	end if
	ll_cod_parque		= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
	if ll_cod_parque=1 then ls_parque='P'
	if ll_cod_parque=102 then ls_parque='M'
	if ll_cod_parque=11 then ls_parque='F'
	ls_fecha				= 'AV_VENC_'+string(ll_mes,'00')+'_'+string(ll_year,'0000')+'_'+ls_parque
	sle_nombre.Text 	= ls_fecha+".XLSX"
else
	close(w_exporta_mecanizado_arch)
end if
end event

on w_exporta_mecanizado_arch.create
this.lb_aux=create lb_aux
this.rb_dbf3=create rb_dbf3
this.rb_dbf2=create rb_dbf2
this.rb_dif=create rb_dif
this.rb_wk1=create rb_wk1
this.rb_wks=create rb_wks
this.rb_sylk=create rb_sylk
this.rb_sql=create rb_sql
this.rb_texto=create rb_texto
this.rb_excel=create rb_excel
this.cbx_encabezado=create cbx_encabezado
this.st_directorio=create st_directorio
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.sle_nombre=create sle_nombre
this.st_1=create st_1
this.gb_formato=create gb_formato
this.Control[]={this.lb_aux,&
this.rb_dbf3,&
this.rb_dbf2,&
this.rb_dif,&
this.rb_wk1,&
this.rb_wks,&
this.rb_sylk,&
this.rb_sql,&
this.rb_texto,&
this.rb_excel,&
this.cbx_encabezado,&
this.st_directorio,&
this.cb_cancelar,&
this.cb_aceptar,&
this.sle_nombre,&
this.st_1,&
this.gb_formato}
end on

on w_exporta_mecanizado_arch.destroy
destroy(this.lb_aux)
destroy(this.rb_dbf3)
destroy(this.rb_dbf2)
destroy(this.rb_dif)
destroy(this.rb_wk1)
destroy(this.rb_wks)
destroy(this.rb_sylk)
destroy(this.rb_sql)
destroy(this.rb_texto)
destroy(this.rb_excel)
destroy(this.cbx_encabezado)
destroy(this.st_directorio)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.sle_nombre)
destroy(this.st_1)
destroy(this.gb_formato)
end on

type lb_aux from listbox within w_exporta_mecanizado_arch
boolean visible = false
integer x = 1083
integer y = 800
integer width = 503
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type rb_dbf3 from radiobutton within w_exporta_mecanizado_arch
integer x = 745
integer y = 476
integer width = 274
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "DBF&3"
end type

event clicked;Integer 	p
Long		ll_cod_parque,ll_mes,ll_year
String	ls_parque,ls_fecha

TipoArchivo = dBase3!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "DBF"
Else
	if isvalid(w_administrar_cuponera) then
		ll_mes				= month(today())
		ll_year				= year(today())
		if w_administrar_cuponera.tab_1.SelectedTab = 4 then
			ll_mes ++
			if ll_mes > 12 then 
				ll_mes	= 1
				ll_year ++
			end if
		end if
		ll_cod_parque		= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
		if ll_cod_parque=1 then ls_parque='P'
		if ll_cod_parque=102 then ls_parque='M'
		if ll_cod_parque=11 then ls_parque='F'
		ls_fecha				= 'AV_VENC_'+string(ll_mes,'00')+'_'+string(ll_year,'0000')+'_'+ls_parque
		sle_nombre.Text 	= ls_fecha+".DBF"
	end if
End If

end event

type rb_dbf2 from radiobutton within w_exporta_mecanizado_arch
boolean visible = false
integer x = 1554
integer y = 1124
integer width = 274
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "DBF&2"
end type

on clicked;Integer p

TipoArchivo = dBase2!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "DBF"
Else
	sle_nombre.Text = "ARCHIVO.DBF"
End If

end on

type rb_dif from radiobutton within w_exporta_mecanizado_arch
boolean visible = false
integer x = 1189
integer y = 1296
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "&DIF"
end type

event clicked;Integer p

TipoArchivo = Dif!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p))+ "DIF"
Else
	sle_nombre.Text = "ARCHIVO.DIF"
End If

end event

type rb_wk1 from radiobutton within w_exporta_mecanizado_arch
boolean visible = false
integer x = 1618
integer y = 1228
integer width = 256
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "WK&1"
end type

on clicked;Integer p

TipoArchivo = WK1!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "WK1"
Else
	sle_nombre.Text = "ARCHIVO.WK1"
End If

end on

type rb_wks from radiobutton within w_exporta_mecanizado_arch
boolean visible = false
integer x = 1166
integer y = 1120
integer width = 265
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "&WKS"
end type

on clicked;Integer p

TipoArchivo = WKS!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "WKS"
Else
	sle_nombre.Text = "ARCHIVO.WKS"
End If

end on

type rb_sylk from radiobutton within w_exporta_mecanizado_arch
boolean visible = false
integer x = 594
integer y = 996
integer width = 279
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "S&YLK"
end type

on clicked;Integer p

TipoArchivo = Sylk!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "SLK"
Else
	sle_nombre.Text = "ARCHIVO.SLK"
End If

end on

type rb_sql from radiobutton within w_exporta_mecanizado_arch
boolean visible = false
integer x = 1134
integer y = 1228
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "S&QL"
end type

on clicked;Integer p

TipoArchivo = SQLInsert!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "SQL"
Else
	sle_nombre.Text = "ARCHIVO.SQL"
End If

end on

type rb_texto from radiobutton within w_exporta_mecanizado_arch
integer x = 425
integer y = 476
integer width = 288
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "&Texto"
end type

event clicked;Integer p
String	ls_parque,ls_fecha
Long		ll_mes,ll_year,ll_cod_Parque

TipoArchivo = Text!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "TXT"
Else
	if isvalid(w_administrar_cuponera) then
		ll_mes				= month(today())
		ll_year				= year(today())
		if w_administrar_cuponera.tab_1.SelectedTab = 4 then
			ll_mes ++
			if ll_mes > 12 then 
				ll_mes	= 1
				ll_year ++
			end if
		end if
		ll_cod_parque		= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
		if ll_cod_parque=1 then ls_parque='P'
		if ll_cod_parque=102 then ls_parque='M'
		if ll_cod_parque=11 then ls_parque='F'
		ls_fecha				= 'AV_VENC_'+string(ll_mes,'00')+'_'+string(ll_year,'0000')+'_'+ls_parque
		sle_nombre.Text 	= ls_fecha+".TXT"
	end if
End If

end event

type rb_excel from radiobutton within w_exporta_mecanizado_arch
integer x = 114
integer y = 476
integer width = 283
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "&Excel"
boolean checked = true
end type

event clicked;Integer 	p
Long		ll_mes,ll_year,ll_cod_parque
String	ls_parque,ls_fecha

TipoArchivo 					= XLSX!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "XLSX"
Else
	if isvalid(w_administrar_cuponera) then
		ll_mes				= month(today())
		ll_year				= year(today())
		if w_administrar_cuponera.tab_1.SelectedTab = 4 then
			ll_mes ++
			if ll_mes > 12 then 
				ll_mes	= 1
				ll_year ++
			end if
		end if
		ll_cod_parque		= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
		if ll_cod_parque=1 then ls_parque='P'
		if ll_cod_parque=102 then ls_parque='M'
		if ll_cod_parque=11 then ls_parque='F'
		ls_fecha				= 'AV_VENC_'+string(ll_mes,'00')+'_'+string(ll_year,'0000')+'_'+ls_parque
		sle_nombre.Text 	= ls_fecha+".XLSX"
	end if
End If

end event

type cbx_encabezado from checkbox within w_exporta_mecanizado_arch
integer x = 64
integer y = 632
integer width = 640
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Incluir Encabezado"
end type

type st_directorio from statictext within w_exporta_mecanizado_arch
integer x = 50
integer y = 232
integer width = 910
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "c:\"
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_exporta_mecanizado_arch
integer x = 1189
integer y = 248
integer width = 329
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;Close(w_exporta_mecanizado_arch)

end event

type cb_aceptar from commandbutton within w_exporta_mecanizado_arch
integer x = 1184
integer y = 84
integer width = 329
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;String 	Archivo
Long		Ret,p,Resp,ll_mes,ll_year,ll_cod_parque
String	ls_parque,ls_fecha
if isvalid(w_administrar_cuponera) then
	IF rb_excel.Checked = True THEN
		TipoArchivo 					= XLSX!
		p = Pos(sle_nombre.Text, ".", 1)
		If p > 0 Then
			sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "XLSX"
		Else
			ll_mes				= month(today())
			ll_year				= year(today())
			if w_administrar_cuponera.tab_1.SelectedTab = 4 then
				ll_mes ++
				if ll_mes > 12 then 
					ll_mes	= 1
					ll_year ++
				end if
			end if
			ll_cod_parque		= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
			if ll_cod_parque=1 then ls_parque='P'
			if ll_cod_parque=102 then ls_parque='M'
			if ll_cod_parque=11 then ls_parque='F'
			ls_fecha				= 'AV_VENC_'+string(ll_mes,'00')+'_'+string(ll_year,'0000')+'_'+ls_parque
			sle_nombre.Text 	= ls_fecha+".XLSX"
		End If
	ELSEIF 	rb_texto.Checked = True THEN
		TipoArchivo = Text!
		p = Pos(sle_nombre.Text, ".", 1)
		If p > 0 Then
			sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "TXT"
		Else
			ll_mes				= month(today())
			ll_year				= year(today())
			if w_administrar_cuponera.tab_1.SelectedTab = 4 then
				ll_mes ++
				if ll_mes > 12 then 
					ll_mes	= 1
					ll_year ++
				end if
			end if
			ll_cod_parque		= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
			if ll_cod_parque=1 then ls_parque='P'
			if ll_cod_parque=102 then ls_parque='M'
			if ll_cod_parque=11 then ls_parque='F'
			ls_fecha				= 'AV_VENC_'+string(ll_mes,'00')+'_'+string(ll_year,'0000')+'_'+ls_parque
			sle_nombre.Text 	= ls_fecha+".TXT"
		End If
	ELSEIF 	rb_dbf3.Checked = True THEN
		TipoArchivo = dBase3!
		p = Pos(sle_nombre.Text, ".", 1)
		If p > 0 Then
			sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "DBF"
		Else
			ll_mes				= month(today())
			ll_year				= year(today())
			if w_administrar_cuponera.tab_1.SelectedTab = 4 then
				ll_mes ++
				if ll_mes > 12 then 
					ll_mes	= 1
					ll_year ++
				end if
			end if
			ll_cod_parque		= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
			if ll_cod_parque=1 then ls_parque='P'
			if ll_cod_parque=102 then ls_parque='M'
			if ll_cod_parque=11 then ls_parque='F'
			ls_fecha				= 'AV_VENC_'+string(ll_mes,'00')+'_'+string(ll_year,'0000')+'_'+ls_parque
			sle_nombre.Text 	= ls_fecha+".DBF"
		End If	
	END IF	
	Archivo		= trim(sle_nombre.Text)
	If Trim(Archivo) = "" Then
		MessageBox("Nombre Inválido", "Debe especificar un Nombre de Archivo.", Exclamation!)
		Return
	End If
	If FileExists(Archivo) Then
		Ret = MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
		If Ret = 2 Then
			Return
		else
			Resp = dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
			If Resp < 0  Then
				MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
			End If
		End If
	else
		Resp = dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
		If Resp < 0  Then
			MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
		End If	
	End If
	Close(w_exporta_mecanizado_arch)
end if
end event

type sle_nombre from singlelineedit within w_exporta_mecanizado_arch
integer x = 50
integer y = 128
integer width = 1047
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_exporta_mecanizado_arch
integer x = 50
integer y = 40
integer width = 613
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "&Grabar Filas Como :"
boolean focusrectangle = false
end type

type gb_formato from groupbox within w_exporta_mecanizado_arch
integer x = 50
integer y = 368
integer width = 1047
integer height = 236
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "&Formato Archivo"
end type

