forward
global type w_exportar_seguro from window
end type
type lb_aux from listbox within w_exportar_seguro
end type
type rb_dbf3 from radiobutton within w_exportar_seguro
end type
type rb_dbf2 from radiobutton within w_exportar_seguro
end type
type rb_dif from radiobutton within w_exportar_seguro
end type
type rb_wk1 from radiobutton within w_exportar_seguro
end type
type rb_wks from radiobutton within w_exportar_seguro
end type
type rb_sylk from radiobutton within w_exportar_seguro
end type
type rb_sql from radiobutton within w_exportar_seguro
end type
type rb_texto from radiobutton within w_exportar_seguro
end type
type rb_excel from radiobutton within w_exportar_seguro
end type
type cbx_encabezado from checkbox within w_exportar_seguro
end type
type st_directorio from statictext within w_exportar_seguro
end type
type cb_cancelar from commandbutton within w_exportar_seguro
end type
type cb_aceptar from commandbutton within w_exportar_seguro
end type
type sle_nombre from singlelineedit within w_exportar_seguro
end type
type st_1 from statictext within w_exportar_seguro
end type
type gb_formato from groupbox within w_exportar_seguro
end type
end forward

global type w_exportar_seguro from window
integer x = 594
integer y = 460
integer width = 1623
integer height = 840
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
global w_exportar_seguro w_exportar_seguro

type variables
datawindow dw_paso
SaveAsType TipoArchivo
Long		il_tipo_seguro,il_cod_parque
end variables

event open;string	ls_parque,ls_seg

gf_centrar(w_exportar_seguro)
dw_paso 					= Message.PowerObjectParm
st_directorio.text			= gs_directorio_exe
if w_seguros_desgravamen.tab_seguro.tabpage_1.dw_lista_seguro.dataobject = 'dw_proceso_cierre_seguro_desg_def' then
	il_tipo_seguro		= 4
	if w_seguros_desgravamen.tab_seguro.SelectedTab=1 then
		ls_seg			= 'SD_'
	elseif w_seguros_desgravamen.tab_seguro.SelectedTab=2 then
		ls_seg			= 'SDL_'
	elseif w_seguros_desgravamen.tab_seguro.SelectedTab=3 then
		ls_seg			= 'SDM18_'
	end if
	
elseif w_seguros_desgravamen.tab_seguro.tabpage_1.dw_lista_seguro.dataobject = 'dw_proceso_cierre_seguro_renta_dec_def' then
	il_tipo_seguro		= 1
	if w_seguros_desgravamen.tab_seguro.SelectedTab=1 then
		ls_seg			= 'SR_'
	elseif w_seguros_desgravamen.tab_seguro.SelectedTab=3 then
		ls_seg			= 'SRM18_'
	end if
	
elseif w_seguros_desgravamen.tab_seguro.tabpage_1.dw_lista_seguro.dataobject = 'dw_proceso_cierre_seguro_accidente_def' then
	il_tipo_seguro		= 2
	if w_seguros_desgravamen.tab_seguro.SelectedTab=1 then
		ls_seg			= 'SA_'
	elseif w_seguros_desgravamen.tab_seguro.SelectedTab=3 then
		ls_seg			= 'SAM18_'
	end if
	
elseif w_seguros_desgravamen.tab_seguro.tabpage_1.dw_lista_seguro.dataobject = 'dw_proceso_cierre_seguro_aseg_def' then
	il_tipo_seguro		= 3
	if w_seguros_desgravamen.tab_seguro.SelectedTab=1 then
		ls_seg			= 'S2_'
	elseif w_seguros_desgravamen.tab_seguro.SelectedTab=2 then
		ls_seg			= 'S2L_'
	elseif w_seguros_desgravamen.tab_seguro.SelectedTab=3 then
		ls_seg			= 'S2M18_'
	end if
	
elseif w_seguros_desgravamen.tab_seguro.tabpage_1.dw_lista_seguro.dataobject = 'dw_proceso_cierre_seguro_fallecimiento' then
	il_tipo_seguro		= 5
	if w_seguros_desgravamen.tab_seguro.SelectedTab=1 then
		ls_seg			= 'SF_'
	end if
end if
lb_aux.DirList("*.DBF", 16, st_directorio)
rb_excel.Checked		= True
TipoArchivo 					= XLSX!
if isvalid(w_seguros_desgravamen) then
	il_cod_parque		= w_seguros_desgravamen.dw_parque.getitemnumber(1,'cod_parque')
	if il_cod_parque=1 then
		ls_parque		= ls_seg+'PP_'+mid(w_seguros_desgravamen.em_fec_ini.text,1,2)+mid(w_seguros_desgravamen.em_fec_ini.text,4,2)+mid(w_seguros_desgravamen.em_fec_ini.text,7,4)
	elseif il_cod_parque=102 then
		ls_parque		= ls_seg+'PM_'+mid(w_seguros_desgravamen.em_fec_ini.text,1,2)+mid(w_seguros_desgravamen.em_fec_ini.text,4,2)+mid(w_seguros_desgravamen.em_fec_ini.text,7,4)
	elseif il_cod_parque=11 then
		ls_parque		= ls_seg+'PF_'+mid(w_seguros_desgravamen.em_fec_ini.text,1,2)+mid(w_seguros_desgravamen.em_fec_ini.text,4,2)+mid(w_seguros_desgravamen.em_fec_ini.text,7,4)
	elseif il_cod_parque=103 then
		ls_parque		= ls_seg+'PS_'+mid(w_seguros_desgravamen.em_fec_ini.text,1,2)+mid(w_seguros_desgravamen.em_fec_ini.text,4,2)+mid(w_seguros_desgravamen.em_fec_ini.text,7,4)
	end if
	sle_nombre.Text 	= ls_parque+".XLSX"
else
	sle_nombre.Text 	= "ARCHIVO.XLSX"
end if
st_directorio.text			= gs_directorio_exe
end event

on w_exportar_seguro.create
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

on w_exportar_seguro.destroy
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

type lb_aux from listbox within w_exportar_seguro
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

type rb_dbf3 from radiobutton within w_exportar_seguro
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
st_directorio.text			= gs_directorio_exe

end event

type rb_dbf2 from radiobutton within w_exportar_seguro
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

type rb_dif from radiobutton within w_exportar_seguro
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

type rb_wk1 from radiobutton within w_exportar_seguro
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

type rb_wks from radiobutton within w_exportar_seguro
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

type rb_sylk from radiobutton within w_exportar_seguro
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

type rb_sql from radiobutton within w_exportar_seguro
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

type rb_texto from radiobutton within w_exportar_seguro
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
st_directorio.text			= gs_directorio_exe

end event

type rb_excel from radiobutton within w_exportar_seguro
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

TipoArchivo 					= XLSX!
p = Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "XLSX"
Else
	sle_nombre.Text = "ARCHIVO.XLSX"
End If
st_directorio.text			= gs_directorio_exe

end event

type cbx_encabezado from checkbox within w_exportar_seguro
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

type st_directorio from statictext within w_exportar_seguro
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

type cb_cancelar from commandbutton within w_exportar_seguro
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

event clicked;Close(w_exportar_seguro)
end event

type cb_aceptar from commandbutton within w_exportar_seguro
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
Long		Ret,p,ll_count_reg,ll_count_usuario_asignado,ll_resp,ll_tot_reg,ll_count
Date		ld_fecha

st_directorio.text			= gs_directorio_exe
IF rb_excel.Checked = True THEN
	TipoArchivo 					= XLSX!
	p = Pos(sle_nombre.Text, ".", 1)
	If p > 0 Then
		sle_nombre.Text = Upper(Mid(sle_nombre.Text, 1, p)) + "XLSX"
	Else
		sle_nombre.Text = "ARCHIVO.XLSX"
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
		Close(w_exportar_seguro)
		Return
	End If
End If
if isvalid(w_seguros_desgravamen) then
	ld_fecha					= date(w_seguros_desgravamen.em_fec_ini.text)
	if w_seguros_desgravamen.tab_seguro.SelectedTab=1 then
		ll_tot_reg = w_seguros_desgravamen.tab_seguro.tabpage_1.dw_lista_seguro.rowcount()
	elseif w_seguros_desgravamen.tab_seguro.SelectedTab=2 then
		ll_tot_reg = w_seguros_desgravamen.tab_seguro.tabpage_2.dw_lista_reliquida.rowcount()
	elseif w_seguros_desgravamen.tab_seguro.SelectedTab=3 then
		ll_tot_reg = w_seguros_desgravamen.tab_seguro.tabpage_3.dw_lista_menores18.rowcount()
	end if
	SELECT 	count("LOG_ARCHIVO_SEGURO"."CORRELATIVO")  
	INTO 		:ll_count_reg  
	FROM 		"LOG_ARCHIVO_SEGURO"  
	USING		sqlca;
	if not isnull(ll_count_reg) and ll_count_reg>0 then
		ll_count_reg ++
	else
		ll_count_reg	= 1
	end if
	SELECT	COUNT("SEGURO_PERIODO"."FECHA_CIERRE")  
	INTO 		:ll_count  
	FROM 		"SEGURO_PERIODO"  
	WHERE  ( "SEGURO_PERIODO"."FECHA_CIERRE" = :ld_fecha ) AND  
			 ( "SEGURO_PERIODO"."COD_PARQUE" = :il_cod_parque )   ;
	if ll_count>0 then
		UPDATE	"SEGURO_PERIODO"  
		SET 		"NOMBRE_ARCHIVO" = :Archivo,   
					"CANT_REGISTRO" = :ll_tot_reg,   
					"USUARIO" = :gs_user  
		WHERE  ( "SEGURO_PERIODO"."FECHA_CIERRE" = :ld_fecha ) AND  
				 ( "SEGURO_PERIODO"."COD_PARQUE" = :il_cod_parque )  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if

	else
		INSERT INTO "SEGURO_PERIODO"  
					( "FECHA_CIERRE",		"NOMBRE_ARCHIVO",	"USUARIO",	"COD_PARQUE",		"CANT_REGISTRO" )  
		VALUES 	( :ld_fecha,			:Archivo,			:gs_user,	:il_cod_parque,	:ll_tot_reg )  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	end if

	SELECT	count("LOG_ARCHIVO_SEGURO"."CORRELATIVO")  
	INTO 		:ll_count_usuario_asignado  
	FROM 		"LOG_ARCHIVO_SEGURO"  
	WHERE  ( "LOG_ARCHIVO_SEGURO"."FECHA_CREA" = :ld_fecha ) AND
			 ( "LOG_ARCHIVO_SEGURO"."TIPO_SEGURO" = :il_tipo_seguro ) AND
			 ( "LOG_ARCHIVO_SEGURO"."COD_PARQUE" = :il_cod_parque )
	USING		sqlca;
	if ll_count_usuario_asignado>=1 then
		ll_resp	= messagebox("Advertencia","Recuerde hoy "+string(ld_fecha,"dd/mm/yyyy")+" Usted a Generado "+string(ll_count_usuario_asignado)+", desea crear otro",Exclamation!,YesNo!,2)
		if ll_resp=1 then
			Ret = dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
			If Ret < 0  Then
				MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
			else
				//insertar registro en log	
				INSERT INTO "LOG_ARCHIVO_SEGURO"  
							( "FECHA_CIERRE",	"NOMBRE_ARCHIVO",	"TIPO_SEGURO",		"USUARIO_CREA",	"CANT_REG",		"CORRELATIVO",	"COD_PARQUE" )  
				VALUES 	( :ld_fecha,		:Archivo,			:il_tipo_seguro,	:gs_user,			:ll_tot_reg,	:ll_count_reg,	:il_cod_parque ) 
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar LOG_ARCHIVO_SEGURO SQL: "+sqlca.sqlerrtext)
				end if
			End If	
		end if
	else
		Ret = dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
		If Ret < 0  Then
			MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
		else
			//insertar registro en log
			INSERT INTO "LOG_ARCHIVO_SEGURO"  
						 ( "FECHA_CIERRE",	"NOMBRE_ARCHIVO",	"TIPO_SEGURO",		"USUARIO_CREA",	"CANT_REG",		"CORRELATIVO",	"COD_PARQUE" )  
			VALUES 	 ( :ld_fecha,			:Archivo,			:il_tipo_seguro,	:gs_user,			:ll_tot_reg,	:ll_count_reg,	:il_cod_parque ) 
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar LOG_ARCHIVO_SEGURO SQL: "+sqlca.sqlerrtext)
			end if
		End If	
	end if
else
	Ret = dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
	If Ret < 0  Then
		MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
	End If	
end if
Close(w_exportar_seguro)
end event

type sle_nombre from singlelineedit within w_exportar_seguro
integer x = 50
integer y = 128
integer width = 1042
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

type st_1 from statictext within w_exportar_seguro
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

type gb_formato from groupbox within w_exportar_seguro
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

