forward
global type w_exportar_carta_d8 from window
end type
type lb_aux from listbox within w_exportar_carta_d8
end type
type rb_dbf3 from radiobutton within w_exportar_carta_d8
end type
type rb_dbf2 from radiobutton within w_exportar_carta_d8
end type
type rb_dif from radiobutton within w_exportar_carta_d8
end type
type rb_wk1 from radiobutton within w_exportar_carta_d8
end type
type rb_wks from radiobutton within w_exportar_carta_d8
end type
type rb_sylk from radiobutton within w_exportar_carta_d8
end type
type rb_sql from radiobutton within w_exportar_carta_d8
end type
type rb_texto from radiobutton within w_exportar_carta_d8
end type
type rb_excel from radiobutton within w_exportar_carta_d8
end type
type cbx_encabezado from checkbox within w_exportar_carta_d8
end type
type st_directorio from statictext within w_exportar_carta_d8
end type
type cb_cancelar from commandbutton within w_exportar_carta_d8
end type
type cb_aceptar from commandbutton within w_exportar_carta_d8
end type
type sle_nombre from singlelineedit within w_exportar_carta_d8
end type
type st_1 from statictext within w_exportar_carta_d8
end type
type gb_formato from groupbox within w_exportar_carta_d8
end type
end forward

global type w_exportar_carta_d8 from window
integer x = 594
integer y = 460
integer width = 1623
integer height = 840
boolean titlebar = true
string title = "Grabar Datos Como"
boolean controlmenu = true
boolean minbox = true
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
global w_exportar_carta_d8 w_exportar_carta_d8

type variables
datawindow dw_paso
SaveAsType TipoArchivo
end variables

event open;string 	fecha,ls_usuario_asig,ls_cab,ls_parque
Long		ll_cod_parque

gf_centrar(w_exportar_carta_d8)
connect using Trans_1;
connect using Trans_2;
dw_paso 					= Message.PowerObjectParm
st_directorio.text			= gs_directorio_exe
lb_aux.DirList("*.DBF", 16, st_directorio)
rb_excel.Checked 			= True
TipoArchivo 					= XLSX!
ll_cod_parque				= w_asignar_envio_carta.dw_select.getitemnumber(1,'parque')
if ll_cod_parque=1 then
	ls_parque			= 'P'
elseif ll_cod_parque=102 then
	ls_parque			= 'M'
elseif ll_cod_parque=11 then
	ls_parque			= 'F'
end if
if w_imprimir_carta_cobranza.dw_carta.dataobject='dw_imprimir_gc_d' then
	ls_cab				= 'D_'+ls_parque
elseif w_imprimir_carta_cobranza.dw_carta.dataobject='dw_imprimir_gc_d8' then
	ls_cab				= 'D8_'+ls_parque
elseif w_imprimir_carta_cobranza.dw_carta.dataobject='dw_imprimir_gc_sicom1' then
	ls_cab				= 'SIC1_'+ls_parque
elseif w_imprimir_carta_cobranza.dw_carta.dataobject='dw_imprimir_gc_sicom2' then
	ls_cab				= 'SIC2_'+ls_parque
elseif w_imprimir_carta_cobranza.dw_carta.dataobject='dw_imprimir_gc_sicom3' then
	ls_cab				= 'SIC3_'+ls_parque
end if
sle_nombre.Text 		= ls_cab+'_'+string(day(today()),"00")+string(month(today()),"00")+string(year(today()),"0000")+".XLSX"
st_directorio.text		= gs_directorio_exe
end event

on w_exportar_carta_d8.create
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

on w_exportar_carta_d8.destroy
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

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type lb_aux from listbox within w_exportar_carta_d8
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

type rb_dbf3 from radiobutton within w_exportar_carta_d8
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

type rb_dbf2 from radiobutton within w_exportar_carta_d8
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

type rb_dif from radiobutton within w_exportar_carta_d8
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

type rb_wk1 from radiobutton within w_exportar_carta_d8
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

type rb_wks from radiobutton within w_exportar_carta_d8
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

type rb_sylk from radiobutton within w_exportar_carta_d8
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

type rb_sql from radiobutton within w_exportar_carta_d8
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

type rb_texto from radiobutton within w_exportar_carta_d8
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

type rb_excel from radiobutton within w_exportar_carta_d8
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

type cbx_encabezado from checkbox within w_exportar_carta_d8
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

type st_directorio from statictext within w_exportar_carta_d8
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

type cb_cancelar from commandbutton within w_exportar_carta_d8
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

event clicked;Close(w_exportar_carta_d8)

end event

type cb_aceptar from commandbutton within w_exportar_carta_d8
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

event clicked;String 	Archivo,ls_usuario_asignado,ls_carta,ls_base,ls_serie,ls_cod_envio,ls_estado_envio,&
			ls_clasif,ls_mensaje
Long		Ret,p,ll_count_reg,ll_count_usuario_asignado,ll_resp,ll_tot_reg,ll_corr_lista,&
			ll_max,ll_indi,ll_graba_1=0,ll_graba_2=0,ll_graba_3=0,ll_graba_4=0,ll_row,ll_count,&
			ll_rut,ll_mora_cred,ll_mora_mant,ll_cod_accion,ll_corr_max,ll_res_grabar,&
			suma_grupo
Date		ld_fecha
Datetime	ldt_fecha_hoy,ld_fecha_prox_envio,ldt_fec_fin
Double	ll_numero,ll_numero_aux

st_directorio.text			= gs_directorio_exe
if w_imprimir_carta_cobranza.dw_carta.dataobject='dw_imprimir_gc_d' then
	ls_clasif	= 'D'
elseif w_imprimir_carta_cobranza.dw_carta.dataobject='dw_imprimir_gc_d8' then
	ls_clasif	= 'D8'
elseif w_imprimir_carta_cobranza.dw_carta.dataobject='dw_imprimir_gc_sicom1' then
	ls_clasif	= 'SIC_1'
elseif w_imprimir_carta_cobranza.dw_carta.dataobject='dw_imprimir_gc_sicom2' then
	ls_clasif	= 'SIC_2'
elseif w_imprimir_carta_cobranza.dw_carta.dataobject='dw_imprimir_gc_sicom3' then
	ls_clasif	= 'SIC_3'
end if
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
		Close(Parent)
		Return
	End If
End If
if isvalid(w_imprimir_carta_cobranza) and isvalid(w_asignar_envio_carta) then
	if rb_excel.checked = true or rb_dbf3.checked = true then
//		Ret 						= w_imprimir_carta_cobranza.dw_carta.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
//		If Ret = 1 Then
//			Messagebox("Exportar","Exportación Exitosa")
//		else
//			MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
//		end if
//	else
		ls_estado_envio		= '0'
		ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
		ld_fecha					= date(gdt_fec_sistema)
		ld_fecha_prox_envio	= datetime(RelativeDate(date(gdt_fec_sistema), 200),time('00:00:00'))
		Ret 						= dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
		If Ret = 1  Then
			ll_resp				= messagebox("Exportar","Se Exportó Correctamente",Exclamation!,YesNo!,2)
			if ll_resp=1 then
				if w_imprimir_carta_cobranza.dw_carta.update()=1 then
					commit;
					SELECT	SYSDATE  
					INTO 		:gdt_fec_sistema  
					FROM 		"TASA"  ;
					SELECT DISTINCT "GC_TIPO_CARTA"."ACCION"  
					INTO 		:ll_cod_accion  
					FROM 		"GC_TIPO_CARTA"  
					WHERE 	"GC_TIPO_CARTA"."CLASIFICACION" = :ls_clasif  
					USING		sqlca;
					
					SELECT	Max("GC_LISTA_GESTION"."CODIGO_GRUPO")  
					INTO 		:ll_corr_lista  
					FROM 		"GC_LISTA_GESTION"  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if isnull(ll_corr_lista) then
							ll_corr_lista	= 1
						else
							ll_corr_lista ++
						end if
					else
						ll_corr_lista		= 1
					end if
					
					ls_carta			= 'Grupo Nº: '+string(ll_corr_lista)+', creado el día '+string(gdt_fec_sistema)+', Usuario: '+gs_user+', Total Carta(s): '+string(w_imprimir_carta_cobranza.dw_carta.rowcount())+' y Clasificación: '+ls_clasif
					INSERT INTO		"GC_LISTA_GESTION"  
									(	"CODIGO_GRUPO",	"FECHA_CREA",		"OBSERVACION",	"USUARIO_CREADOR",	"CLASIFICACION" )  
					VALUES 		( 	:ll_corr_lista,	:gdt_fec_sistema,	:ls_carta,		:gs_user,				:ls_clasif )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_graba_2	= 0
					else
						ll_graba_2 ++
					end if
					suma_grupo		= 0
					SELECT	MAX("CARTA_LOG"."CORRELATIVO")  
					INTO 		:ll_max  
					FROM 		"CARTA_LOG"  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_max ++
					else
						ll_max	= 1
					end if
					ll_tot_reg				= w_imprimir_carta_cobranza.dw_carta.rowcount()
					for ll_indi=1 to ll_tot_reg
						ls_base				= w_imprimir_carta_cobranza.dw_carta.getitemstring(ll_indi,'base')
						ls_serie				= w_imprimir_carta_cobranza.dw_carta.getitemstring(ll_indi,'serie')
						ll_numero			= w_imprimir_carta_cobranza.dw_carta.getitemnumber(ll_indi,'numero')
						ll_rut					= w_imprimir_carta_cobranza.dw_carta.getitemnumber(ll_indi,'rut_cliente')
						ls_cod_envio		= w_imprimir_carta_cobranza.dw_carta.getitemstring(ll_indi,'base')
						ll_mora_cred		= w_imprimir_carta_cobranza.dw_carta.getitemnumber(ll_indi,'mora_cred')
						ll_mora_mant		= w_imprimir_carta_cobranza.dw_carta.getitemnumber(ll_indi,'mora_mant')
						w_imprimir_carta_cobranza.dw_carta.setitem(ll_indi,'cod_grupo',ll_corr_lista)
						
						SELECT	"CARTA_LOG"."NUMERO"
						INTO 		:ll_numero_aux  
						FROM 		"CARTA_LOG"  
						WHERE  ( "CARTA_LOG"."BASE" = :ls_base ) AND  
								 ( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
								 ( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
								 ( "CARTA_LOG"."RUT" = :ll_rut ) AND  
								 ( "CARTA_LOG"."COD_ENVIO" = :ls_cod_envio ) AND  
								 ( "CARTA_LOG"."FECHA_CARTA" = :ldt_fecha_hoy ) AND  
								 ( "CARTA_LOG"."COD_ACCION" = :ll_cod_accion )   
						USING		Trans_2;
						if Trans_2.sqlcode=100 then
							suma_grupo ++
							INSERT INTO "CARTA_LOG"  
										( "BASE",   "SERIE",   "NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",   	"FECHA_CARTA",			"MORA",   		"COD_ACCION",   	"CORRELATIVO",   	"MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
							VALUES 	( :ls_base, :ls_serie, :ll_numero, :ll_rut, :ls_cod_envio, :ls_estado_envio,  :ldt_fecha_hoy,   	:ll_mora_cred, :ll_cod_accion,  	:ll_max,				:ll_mora_mant, :ls_clasif,			:gs_user )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								ll_graba_2	= 0
								UPDATE	"CLIENTE"  
								SET 		"ULT_COD_ENVIO_CARTA" = :ls_cod_envio,   
											"ULT_ESTADO_ENVIO_CARTA" = :ls_estado_envio,   
											"ULT_FECHA_ENVIO_CARTA" = :ldt_fecha_hoy,   
											"ULT_COD_ACCION_ENVIO_CARTA" = :ll_cod_accion,   
											"ULT_CLASIFICACION_ENVIO_CARTA" = :ls_clasif,
											"FECHA_PROX_ENVIO_CARTA" = :ld_fecha_prox_envio,
											"ESTADO_ENVIO_CARTA" = 'S'
								WHERE 	"CLIENTE"."RUT" = :ll_rut   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ll_graba_3	= 0
									if ls_clasif = 'SIC_1' or ls_clasif = 'SIC_2' or ls_clasif = 'SIC_3' then
										ll_graba_4	= 0
										if ls_clasif = 'SIC_1' or ls_clasif = 'SIC_2' then
											SELECT	MAX("MENSAJES"."CORRELATIVO")  
											INTO 		:ll_corr_max  
											FROM 		"MENSAJES"  
											USING		Trans_1;
											if not isnull(ll_corr_max) and ll_corr_max>0 then
												ll_corr_max ++
											else
												ll_corr_max	= 1
											end if
											ls_mensaje		= 'SITUACION ESPECIAL, SOLO DEBE SER ATENDIDO POR EL DPTO. ATENCION CLIENTE E INFORMADO A DPTO. DE COBRANZA.'
											ldt_fec_fin		= datetime(RelativeDate(date(ldt_fecha_hoy), 5000),time('00:00:00'))
											
											INSERT INTO "MENSAJES"  
														( "RUT",		"FECHA_CREACION",	"FECHA_FIN",	"AUTOR",		"MENSAJE",		"ESTADO",	"USUARIO_FIN",	"BASE",		"SERIE",		"NUMERO",	"CLASIFICACION_MENSAJE",	"SW_MENSAJE",	"CORRELATIVO",	"FECHA_GESTION",		"ESTADO_GESTION" )  
											VALUES 	( :ll_rut,	:ldt_fecha_hoy,	:ldt_fec_fin,	:gs_user,	:ls_mensaje,	'P',			null,				:ls_base,	:ls_serie,	:ll_numero,	null,								'C',				:ll_corr_max,	null,						'A' )  
											USING		Trans_1;
											if Trans_1.sqlcode=0 then
												commit using Trans_1;
											else
												rollback using Trans_1;
											end if
										end if
									else
										UPDATE	"CADENA"  
										SET 		"NRO_CARTA" = :ls_clasif,   
													"FECHA_CARTA" = :ldt_fecha_hoy,   
													"ESTADO_CARTA" = :ll_cod_accion  
										WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
												 ( "CADENA"."SERIE" = :ls_serie ) AND  
												 ( "CADENA"."NUMERO" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											ll_graba_4	= 0
										else
											ll_graba_4 ++
											exit
										end if
									end if
								else
									ll_graba_3 ++
									exit
								end if
								ll_max ++
							else
								ll_graba_2 ++
								exit
							end if
						end if
					next
				else
					rollback;
					ll_graba_1 ++
				end if
				
				ll_graba_3			= 0
				if ll_graba_1=0 and ll_graba_2=0 and ll_graba_3=0 and ll_graba_4=0 then
					commit;
					w_imprimir_carta_cobranza.dw_carta.accepttext()
					if w_imprimir_carta_cobranza.dw_carta.update()=1 then
						commit;
					else
						rollback;
					end if
					ld_fecha			= today()
					ll_row				= w_imprimir_carta_cobranza.dw_carta.rowcount()
					Archivo			= trim(sle_nombre.Text)
					Archivo			= gs_directorio_exe+'\'+Archivo
					SELECT 	MAX("GESTION_CARTA_GENERA_ARCHIVO"."CORRELATIVO")  
					INTO 		:ll_count
					FROM 		"GESTION_CARTA_GENERA_ARCHIVO"  
					WHERE  ( "GESTION_CARTA_GENERA_ARCHIVO"."FECHA_PROCESO" = :ld_fecha ) AND  
							 ( "GESTION_CARTA_GENERA_ARCHIVO"."DEPARTAMENTO" = :gs_depto ) 
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ll_count=0 or isnull(ll_count) then
							ll_count	= 1
						else
							ll_count ++
						end if
					else
						ll_count		= 1
					end if
					INSERT INTO "GESTION_CARTA_GENERA_ARCHIVO"  
								( "FECHA_CREA",   "CORRELATIVO", 	"FECHA_PROCESO",  "NOMBRE_ARCHIVO", "DEPARTAMENTO",   "CANTIDAD_REGISTRO",   	"USUARIO" )  
					VALUES 	( :ldt_fecha_hoy,	:ll_count,   			:ld_fecha,				:archivo,					:gs_depto,				:ll_row,							:gs_user)
					Using		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
					if suma_grupo=0 then
						DELETE FROM "GC_LISTA_GESTION"  
						WHERE 		"GC_LISTA_GESTION"."CODIGO_GRUPO" = :ll_corr_lista   
						USING			sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
					ll_res_grabar	= messagebox("Grabar","Grabación Exitosa, desea Cerrar Ventana Exportar y Limpiar Proceso",Exclamation!,YesNo!,2)
					if ll_res_grabar=1 then
						close(w_imprimir_carta_cobranza)
						w_asignar_envio_carta.cb_limpiar.triggerevent(clicked!)
						cb_cancelar.triggerevent(clicked!)
					end if
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
				end if
			end if
		else
			MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
		end if
	end if
else
	MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
end if
end event

type sle_nombre from singlelineedit within w_exportar_carta_d8
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

type st_1 from statictext within w_exportar_carta_d8
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

type gb_formato from groupbox within w_exportar_carta_d8
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

