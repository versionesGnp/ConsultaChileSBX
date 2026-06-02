forward
global type w_exportar from window
end type
type lb_aux from listbox within w_exportar
end type
type rb_dbf3 from radiobutton within w_exportar
end type
type rb_dbf2 from radiobutton within w_exportar
end type
type rb_dif from radiobutton within w_exportar
end type
type rb_wk1 from radiobutton within w_exportar
end type
type rb_wks from radiobutton within w_exportar
end type
type rb_sylk from radiobutton within w_exportar
end type
type rb_sql from radiobutton within w_exportar
end type
type rb_texto from radiobutton within w_exportar
end type
type rb_excel from radiobutton within w_exportar
end type
type cbx_encabezado from checkbox within w_exportar
end type
type st_directorio from statictext within w_exportar
end type
type cb_cancelar from commandbutton within w_exportar
end type
type cb_aceptar from commandbutton within w_exportar
end type
type sle_nombre from singlelineedit within w_exportar
end type
type st_1 from statictext within w_exportar
end type
type gb_formato from groupbox within w_exportar
end type
end forward

global type w_exportar from window
integer x = 594
integer y = 460
integer width = 1595
integer height = 820
boolean titlebar = true
string title = "Grabar Datos Como"
boolean controlmenu = true
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
global w_exportar w_exportar

type variables
datawindow dw_paso
SaveAsType TipoArchivo
end variables

event open;string fecha,ls_usuario_asig

gf_centrar(w_exportar)
dw_paso 					= Message.PowerObjectParm
st_directorio.text			= gs_directorio_exe
lb_aux.DirList("*.DBF", 16, st_directorio)
rb_excel.Checked			= True
TipoArchivo 					= XLSX!
if isvalid(w_grabar_lista_gestion) then
	ls_usuario_asig			= trim(w_grabar_lista_gestion.dw_dato.getitemstring(1,'usuario_asignado'))
	sle_nombre.Text 		= ls_usuario_asig+"_"+string(gdt_fec_sistema,"ddmmyy")+".XLS"
else
	if dw_paso.dataobject = 'dwe_exportar_libro_venta_sii' then
		sle_nombre.Text 	= "ARCHIVO.TXT"
		rb_texto.checked	= true
	elseif dw_paso.dataobject = 'dwe_libro_venta_excel' then
		sle_nombre.Text 	= "ARCHIVO.XLS"
		rb_excel.checked	= true
	else
		sle_nombre.Text 	= "ARCHIVO.XLS"
	end if
end if
st_directorio.text			= gs_directorio_exe
end event

on w_exportar.create
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

on w_exportar.destroy
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

type lb_aux from listbox within w_exportar
boolean visible = false
integer x = 1083
integer y = 800
integer width = 503
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type rb_dbf3 from radiobutton within w_exportar
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

event clicked;Integer p

TipoArchivo = dBase3!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "DBF"
Else
	sle_nombre.Text = "ARCHIVO.DBF"
End If
st_directorio.text		= gs_directorio_exe
end event

type rb_dbf2 from radiobutton within w_exportar
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

type rb_dif from radiobutton within w_exportar
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

type rb_wk1 from radiobutton within w_exportar
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

type rb_wks from radiobutton within w_exportar
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

type rb_sylk from radiobutton within w_exportar
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

type rb_sql from radiobutton within w_exportar
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

type rb_texto from radiobutton within w_exportar
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

TipoArchivo = Text!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "TXT"
Else
	sle_nombre.Text = "ARCHIVO.TXT"
End If
st_directorio.text		= gs_directorio_exe
end event

type rb_excel from radiobutton within w_exportar
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

event clicked;Integer p

st_directorio.text			= gs_directorio_exe
TipoArchivo = XLSX!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "XLS"
Else
	sle_nombre.Text = "ARCHIVO.XLS"
End If
st_directorio.text		= gs_directorio_exe
end event

type cbx_encabezado from checkbox within w_exportar
integer x = 50
integer y = 624
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

type st_directorio from statictext within w_exportar
integer x = 50
integer y = 232
integer width = 1056
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

type cb_cancelar from commandbutton within w_exportar
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

event clicked;//CloseWithReturn(w_exportar, "cancelado")
Close(w_exportar)
end event

type cb_aceptar from commandbutton within w_exportar
integer x = 1184
integer y = 84
integer width = 329
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;String 	Archivo,ls_usuario_asignado
Long		Ret,p,ll_count_reg,ll_count_usuario_asignado,ll_resp,ll_tot_reg
Date		ld_fecha
st_directorio.text			= gs_directorio_exe
IF rb_excel.Checked = True THEN
	TipoArchivo = XLSX!
	p = Pos(sle_nombre.Text, ".", 1)
	If p > 0 Then
		sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "XLS"
	Else
		sle_nombre.Text = "ARCHIVO.XLS"
	End If
ELSEIF 	rb_texto.Checked = True THEN
	TipoArchivo = Text!
	p = Pos(sle_nombre.Text, ".", 1)
	If p > 0 Then
		sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "TXT"
	Else
		sle_nombre.Text = "ARCHIVO.TXT"
	End If
ELSEIF 	rb_dbf3.Checked = True THEN
	TipoArchivo = dBase3!
	p = Pos(sle_nombre.Text, ".", 1)
	If p > 0 Then
		sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "DBF"
	Else
		sle_nombre.Text = "ARCHIVO.DBF"
	End If	
END IF	
Archivo 		= sle_nombre.Text
Archivo		= gs_directorio_exe+'\'+Archivo
If Trim(Archivo) = "" Then
	MessageBox("Nombre Inválido", "Debe especificar un Nombre de Archivo.", Exclamation!)
	Return
End If
If FileExists(Archivo) Then
	Ret = MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
	If Ret = 2 Then
		Close(Parent)
		Return
	End If
End If
if isvalid(w_grabar_lista_gestion) then
	ld_fecha					= date(gdt_fec_sistema)
	ls_usuario_asignado	= w_grabar_lista_gestion.dw_dato.getitemstring(1,'usuario_asignado')
	if isvalid(w_general_cobranza_telefonica) then ll_tot_reg = w_general_cobranza_telefonica.dw_lista.rowcount()
	SELECT 	count("LOG_ARCHIVO_COBRANZA_EXTERNA"."CORRELATIVO")  
	INTO 		:ll_count_reg  
	FROM 		"LOG_ARCHIVO_COBRANZA_EXTERNA"  
	USING		sqlca;
	if not isnull(ll_count_reg) and ll_count_reg>0 then
		ll_count_reg ++
	else
		ll_count_reg	= 1
	end if
	SELECT	count("LOG_ARCHIVO_COBRANZA_EXTERNA"."CORRELATIVO")  
	INTO 		:ll_count_usuario_asignado  
	FROM 		"LOG_ARCHIVO_COBRANZA_EXTERNA"  
	WHERE  ( "LOG_ARCHIVO_COBRANZA_EXTERNA"."FECHA_CREA" = :ld_fecha ) AND  
			 ( "LOG_ARCHIVO_COBRANZA_EXTERNA"."USUARIO_ASIGNADOR" = :gs_user ) AND  
			 ( "LOG_ARCHIVO_COBRANZA_EXTERNA"."USUARIO_ASIGNADO" = :ls_usuario_asignado )   
	USING		sqlca;
	if ll_count_usuario_asignado>=1 then
		ll_resp	= messagebox("Advertencia","Recuerde hoy "+string(ld_fecha,"dd/mm/yyyy")+" Usted a Generado "+string(ll_count_usuario_asignado)+" Archivo(s) al Usuario Externo "+ls_usuario_asignado+", desea crear otro",Exclamation!,YesNo!,2)
		if ll_resp=1 then
			Ret = dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
			If Ret < 0  Then
				MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
			else
				//insertar registro en log	
				INSERT INTO		"LOG_ARCHIVO_COBRANZA_EXTERNA"  
								 ( "FECHA_CREA",  "CORRELATIVO",   "NOMBRE_ARCHIVO",   "USUARIO_ASIGNADOR",   "USUARIO_ASIGNADO",   	"CANTIDAD_REGISTRO" )  
						VALUES ( :ld_fecha,   	:ll_count_reg,   :Archivo, 			 :gs_user,   				:ls_usuario_asignado,   :ll_tot_reg )  
				USING				sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			End If	
		end if
	else
		Ret = dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
		If Ret < 0  Then
			MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
		else
			//insertar registro en log
			INSERT INTO		"LOG_ARCHIVO_COBRANZA_EXTERNA"  
							 ( "FECHA_CREA",  "CORRELATIVO",   "NOMBRE_ARCHIVO",   "USUARIO_ASIGNADOR",   "USUARIO_ASIGNADO",   	"CANTIDAD_REGISTRO" )  
					VALUES ( :ld_fecha,   	:ll_count_reg,   :Archivo, 			 :gs_user,   				:ls_usuario_asignado,   :ll_tot_reg )  
			USING				sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		End If	
	end if
	if isvalid(w_generar_lista_cliente_gestion_cobranza) then close(w_generar_lista_cliente_gestion_cobranza)
	if isvalid(w_grabar_lista_gestion) then close(w_grabar_lista_gestion)
else
	Ret = dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
	If Ret < 0  Then
		MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
	End If	
end if
Close(Parent)
end event

type sle_nombre from singlelineedit within w_exportar
integer x = 50
integer y = 128
integer width = 891
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_exportar
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

type gb_formato from groupbox within w_exportar
integer x = 50
integer y = 368
integer width = 1047
integer height = 236
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "&Formato Archivo"
end type

