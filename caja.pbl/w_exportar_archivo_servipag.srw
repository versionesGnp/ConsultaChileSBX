forward
global type w_exportar_archivo_servipag from window
end type
type sle_nombre_sencillito from singlelineedit within w_exportar_archivo_servipag
end type
type sle_nombre_estado from singlelineedit within w_exportar_archivo_servipag
end type
type lb_aux from listbox within w_exportar_archivo_servipag
end type
type rb_dbf3 from radiobutton within w_exportar_archivo_servipag
end type
type rb_dbf2 from radiobutton within w_exportar_archivo_servipag
end type
type rb_dif from radiobutton within w_exportar_archivo_servipag
end type
type rb_wk1 from radiobutton within w_exportar_archivo_servipag
end type
type rb_wks from radiobutton within w_exportar_archivo_servipag
end type
type rb_sylk from radiobutton within w_exportar_archivo_servipag
end type
type rb_sql from radiobutton within w_exportar_archivo_servipag
end type
type rb_texto from radiobutton within w_exportar_archivo_servipag
end type
type rb_excel from radiobutton within w_exportar_archivo_servipag
end type
type cbx_encabezado from checkbox within w_exportar_archivo_servipag
end type
type st_directorio from statictext within w_exportar_archivo_servipag
end type
type cb_cancelar from commandbutton within w_exportar_archivo_servipag
end type
type cb_aceptar from commandbutton within w_exportar_archivo_servipag
end type
type sle_nombre from singlelineedit within w_exportar_archivo_servipag
end type
type st_1 from statictext within w_exportar_archivo_servipag
end type
type gb_formato from groupbox within w_exportar_archivo_servipag
end type
end forward

global type w_exportar_archivo_servipag from window
integer x = 594
integer y = 460
integer width = 1586
integer height = 876
boolean titlebar = true
string title = "Grabar Datos Como"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
sle_nombre_sencillito sle_nombre_sencillito
sle_nombre_estado sle_nombre_estado
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
global w_exportar_archivo_servipag w_exportar_archivo_servipag

type variables
datawindow dw_paso
SaveAsType TipoArchivo
STRING	is_fecha,is_fecha_estado,is_depto='I',is_fecha_sencillito
Date		idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_grabar_archivo_contable ()
end prototypes

public subroutine wf_grabar_archivo_contable ();Date		ld_fecha,ld_fecha_hoy
String		ls_caja,ls_empresa,archivo
Long		ll_row,ll_count
Datetime	ldt_fecha_hoy
Double	ldb_uf_dia

if isvalid(w_servipag) then
	ld_fecha		= date(w_servipag.tab_1.tabpage_1.em_desde.text)
	ll_row			= w_servipag.tab_1.tabpage_1.dw_lista.rowcount()
	Archivo		= trim(sle_nombre.Text)
	
	SELECT 	MAX("GESTION_CARTA_GENERA_ARCHIVO"."CORRELATIVO")  
	INTO 		:ll_count
	FROM 	"GESTION_CARTA_GENERA_ARCHIVO"  
	WHERE  ( "GESTION_CARTA_GENERA_ARCHIVO"."FECHA_PROCESO" = :ld_fecha ) AND  
			 ( "GESTION_CARTA_GENERA_ARCHIVO"."DEPARTAMENTO" = :is_depto ) 
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
	ld_fecha_hoy	= idt_fecha_hoy
	
	ldt_fecha_hoy	= datetime(date(w_servipag.tab_1.tabpage_1.em_desde.text),time('00:00:00'))

	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_dia
	FROM 	"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
	USING	sqlca;
	
	INSERT INTO "GESTION_CARTA_GENERA_ARCHIVO"  
				( "FECHA_CREA",   "CORRELATIVO", 	"FECHA_PROCESO",  "NOMBRE_ARCHIVO", "DEPARTAMENTO",   "CANTIDAD_REGISTRO",   	"USUARIO",		"UF_DIA" )  
	VALUES 	( :ld_fecha_hoy,	:ll_count,   			:ld_fecha,				:archivo,					:is_depto,				:ll_row,							:gs_user,		:ldb_uf_dia)
	Using		sqlca;
	if sqlca.sqlcode=0 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
		Close(w_exportar_archivo_servipag)
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
end if
end subroutine

event open;string 	fecha,ls_parque
Long		ll_pos
gf_centrar(w_exportar_archivo_servipag)
idt_fecha_hoy						= date(w_servipag.tab_1.tabpage_1.em_desde.text)
dw_paso 							= Message.PowerObjectParm
st_directorio.text					= gs_directorio_exe
lb_aux.DirList("*.DBF", 16, st_directorio)
rb_excel.Checked					= True
TipoArchivo 							= XLSX!
if isvalid(w_servipag) then
	sle_nombre_estado.visible	= true
	if gs_conexion	= "Parque El Prado" then
		is_fecha						= 'NOMPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
		is_fecha_estado			= 'ESTPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
		is_fecha_sencillito			= 'SENPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
	else
		is_fecha						= 'NOMFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
		is_fecha_estado			= 'ESTFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
		is_fecha_sencillito			= 'SENFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
	end if
	sle_nombre.Text 				= is_fecha+".XLSX"
	sle_nombre_estado.Text 	= is_fecha_estado+".XLSX"
	sle_nombre_sencillito.Text 	= is_fecha_sencillito+".XLSX"
else
	sle_nombre_estado.visible	= false
	sle_nombre.Text 				= "CAJA.XLSX"
end if
st_directorio.text					= gs_directorio_exe
end event

on w_exportar_archivo_servipag.create
this.sle_nombre_sencillito=create sle_nombre_sencillito
this.sle_nombre_estado=create sle_nombre_estado
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
this.Control[]={this.sle_nombre_sencillito,&
this.sle_nombre_estado,&
this.lb_aux,&
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

on w_exportar_archivo_servipag.destroy
destroy(this.sle_nombre_sencillito)
destroy(this.sle_nombre_estado)
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

type sle_nombre_sencillito from singlelineedit within w_exportar_archivo_servipag
integer x = 50
integer y = 316
integer width = 1047
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

type sle_nombre_estado from singlelineedit within w_exportar_archivo_servipag
integer x = 50
integer y = 220
integer width = 1047
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

type lb_aux from listbox within w_exportar_archivo_servipag
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

type rb_dbf3 from radiobutton within w_exportar_archivo_servipag
integer x = 745
integer y = 636
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

TipoArchivo 								= dBase3!
p 											= Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text 					= Upper(Mid(sle_nombre.Text, 1, p)) + "DBF"
	sle_nombre_estado.Text 		= Upper(Mid(sle_nombre_estado.Text, 1, p)) + "DBF"
	sle_nombre_sencillito.Text 		= Upper(Mid(sle_nombre_sencillito.Text, 1, p)) + "DBF"
Else
	if isvalid(w_servipag) then
		if gs_conexion	= "Parque El Prado" then
			is_fecha						= 'NOMPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_estado			= 'ESTPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_sencillito			= 'SENPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
		else
			is_fecha						= 'NOMFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_estado			= 'ESTFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_sencillito			= 'SENFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
		end if
		sle_nombre.Text 				= is_fecha+".DBF"
		sle_nombre_estado.Text		= is_fecha_estado+".DBF"
		sle_nombre_sencillito.Text 	= is_fecha_sencillito+".DBF"
	else
		sle_nombre.Text 				= "CAJA.DBF"
	end if
End If
st_directorio.text					= gs_directorio_exe
end event

type rb_dbf2 from radiobutton within w_exportar_archivo_servipag
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

type rb_dif from radiobutton within w_exportar_archivo_servipag
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

type rb_wk1 from radiobutton within w_exportar_archivo_servipag
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

type rb_wks from radiobutton within w_exportar_archivo_servipag
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

type rb_sylk from radiobutton within w_exportar_archivo_servipag
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

type rb_sql from radiobutton within w_exportar_archivo_servipag
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

type rb_texto from radiobutton within w_exportar_archivo_servipag
integer x = 425
integer y = 636
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

TipoArchivo 								= Text!
p 											= Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text					= Upper(Mid(sle_nombre.Text, 1, p)) + "TXT"
	sle_nombre_estado.Text			= Upper(Mid(sle_nombre_estado.Text, 1, p)) + "TXT"
	sle_nombre_sencillito.Text 		= Upper(Mid(sle_nombre_sencillito.Text, 1, p)) + "TXT"
Else
	if isvalid(w_servipag) then
		if gs_conexion	= "Parque El Prado" then
			is_fecha						= 'NOMPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_estado			= 'ESTPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_sencillito			= 'SENPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
		else
			is_fecha						= 'NOMFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_estado			= 'ESTFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_sencillito			= 'SENFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
		end if
		sle_nombre.Text 				= is_fecha+".TXT"
		sle_nombre_estado.Text 	= is_fecha_estado+".TXT"
		sle_nombre_sencillito.Text 	= is_fecha_sencillito+".TXT"
	else
		sle_nombre.Text 				= "CAJA.TXT"
	end if
End If
st_directorio.text					= gs_directorio_exe
end event

type rb_excel from radiobutton within w_exportar_archivo_servipag
integer x = 114
integer y = 636
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

TipoArchivo 								= XLSX!
p 											= Pos(sle_nombre.Text, ".", 1)
If p > 0 Then
	sle_nombre.Text 					= Upper(Mid(sle_nombre.Text, 1, p)) + "XLSX"
	sle_nombre_estado.Text 		= Upper(Mid(sle_nombre_estado.Text, 1, p)) + "XLSX"
	sle_nombre_sencillito.Text 		= Upper(Mid(sle_nombre_sencillito.Text, 1, p)) + "XLSX"
Else
	if isvalid(w_servipag) then
		if gs_conexion	= "Parque El Prado" then
			is_fecha						= 'NOMPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_estado			= 'ESTPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_sencillito			= 'SENPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
		else
			is_fecha						= 'NOMFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_estado			= 'ESTFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			is_fecha_sencillito			= 'SENFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
		end if
		sle_nombre.Text 				= is_fecha+".XLS"
		sle_nombre_estado.Text 	= is_fecha_estado+".XLSX"
		sle_nombre_sencillito.Text 	= is_fecha_sencillito+".XLSX"
	else
		sle_nombre.Text 				= "CAJA.XLSX"
	end if
End If
st_directorio.text					= gs_directorio_exe

end event

type cbx_encabezado from checkbox within w_exportar_archivo_servipag
integer x = 64
integer y = 800
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

type st_directorio from statictext within w_exportar_archivo_servipag
integer x = 50
integer y = 420
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

type cb_cancelar from commandbutton within w_exportar_archivo_servipag
integer x = 1189
integer y = 436
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

event clicked;Close(w_exportar_archivo_servipag)

end event

type cb_aceptar from commandbutton within w_exportar_archivo_servipag
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

event clicked;String 	Archivo,Archivo_estado,Archivo_sencillito
Long		Ret,p,Resp
SetPointer(HourGlass!)
st_directorio.text			= gs_directorio_exe
IF rb_excel.Checked = True THEN
	TipoArchivo 					= XLSX!
	p = Pos(sle_nombre.Text, ".", 1)
	If p > 0 Then
		sle_nombre.Text 					= Upper(Mid(sle_nombre.Text, 1, p)) + "XLSX"
	Else
		if isvalid(w_servipag) then
			if gs_conexion	= "Parque El Prado" then
				is_fecha						= 'NOMPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_estado			= 'ESTPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_sencillito			= 'SENPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			else
				is_fecha						= 'NOMFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_estado			= 'ESTFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_sencillito			= 'SENFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			end if
			sle_nombre.Text 				= is_fecha+".XLSX"
			sle_nombre_estado.Text 	= is_fecha+".XLSX"
			sle_nombre_sencillito.Text	= is_fecha+".XLSX"
		else
			sle_nombre.Text 				= "CAJA.XLSX"
		end if
	End If
ELSEIF rb_texto.Checked = True THEN
	TipoArchivo 								= Text!
	p 											= Pos(sle_nombre.Text, ".", 1)
	If p > 0 Then
		sle_nombre.Text 					= Upper(Mid(sle_nombre.Text, 1, p)) + "TXT"
	Else
		if isvalid(w_servipag) then
			if gs_conexion = "Parque El Prado" then
				is_fecha						= 'NOMPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_estado			= 'ESTPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_sencillito			= 'SENPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			else
				is_fecha						= 'NOMFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_estado			= 'ESTFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_sencillito			= 'SENFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			end if
			sle_nombre.Text 				= is_fecha+".TXT"
			sle_nombre_estado.Text 	= is_fecha_estado+".TXT"
			sle_nombre_sencillito.Text	= is_fecha_sencillito+".TXT"
		else
			sle_nombre.Text 				= "CAJA.TXT"
		end if
	End If
ELSEIF rb_dbf3.Checked = True THEN
	TipoArchivo 								= dBase3!
	p 											= Pos(sle_nombre.Text, ".", 1)
	If p > 0 Then
		sle_nombre.Text 					= Upper(Mid(sle_nombre.Text, 1, p)) + "DBF"
	Else
		if isvalid(w_servipag) then
			if gs_conexion = "Parque El Prado" then
				is_fecha						= 'NOMPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_estado			= 'ESTPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_sencillito			= 'SENPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			else
				is_fecha						= 'NOMFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_estado			= 'ESTFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
				is_fecha_sencillito			= 'SENFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")
			end if
			sle_nombre.Text 				= is_fecha+".DBF"
			sle_nombre_estado.Text 	= is_fecha_estado+".DBF"
			sle_nombre_sencillito.Text	= is_fecha_sencillito+".DBF"
		else
			sle_nombre.Text 				= "CAJA.DBF"
		end if
	End If	
END IF	
Archivo										= trim(sle_nombre.Text)
Archivo										= gs_directorio_exe+'\'+Archivo
Archivo_estado								= trim(sle_nombre_estado.Text)
Archivo_estado								= gs_directorio_exe+'\'+Archivo_estado
Archivo_sencillito							= trim(sle_nombre_sencillito.Text)
Archivo_sencillito							= gs_directorio_exe+'\'+Archivo_sencillito
If Trim(Archivo) = "" Then
	MessageBox("Nombre Inválido", "Debe especificar un Nombre de Archivo.", Exclamation!)
	Return
End If
If FileExists(Archivo) Then
	Ret 										= MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
	If Ret = 2 Then
		Close(Parent)
		Return
	else
		Resp 									= dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
		If Resp < 0  Then
			MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
		else
			w_servipag.dw_baestado.SaveAs( Archivo_estado,TipoArchivo, cbx_encabezado.Checked)
			w_servipag.dw_sencillito.SaveAs( Archivo_sencillito,TipoArchivo, cbx_encabezado.Checked)
			wf_grabar_archivo_contable()
		End If
	End If
else
	Resp 										= dw_paso.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
	If Resp < 0  Then
		MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
	else
		w_servipag.dw_baestado.SaveAs( Archivo_estado,TipoArchivo, cbx_encabezado.Checked)
		w_servipag.dw_sencillito.SaveAs( Archivo_sencillito,TipoArchivo, cbx_encabezado.Checked)
		wf_grabar_archivo_contable()
	End If	
End If
SetPointer(Arrow!)
end event

type sle_nombre from singlelineedit within w_exportar_archivo_servipag
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

type st_1 from statictext within w_exportar_archivo_servipag
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

type gb_formato from groupbox within w_exportar_archivo_servipag
integer x = 50
integer y = 528
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

