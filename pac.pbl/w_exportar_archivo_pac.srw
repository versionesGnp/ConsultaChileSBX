forward
global type w_exportar_archivo_pac from window
end type
type sle_nombre_mant from singlelineedit within w_exportar_archivo_pac
end type
type lb_aux from listbox within w_exportar_archivo_pac
end type
type rb_dbf3 from radiobutton within w_exportar_archivo_pac
end type
type rb_texto from radiobutton within w_exportar_archivo_pac
end type
type rb_excel from radiobutton within w_exportar_archivo_pac
end type
type cbx_encabezado from checkbox within w_exportar_archivo_pac
end type
type st_directorio from statictext within w_exportar_archivo_pac
end type
type cb_cancelar from commandbutton within w_exportar_archivo_pac
end type
type cb_aceptar from commandbutton within w_exportar_archivo_pac
end type
type sle_nombre from singlelineedit within w_exportar_archivo_pac
end type
type st_1 from statictext within w_exportar_archivo_pac
end type
type gb_formato from groupbox within w_exportar_archivo_pac
end type
end forward

global type w_exportar_archivo_pac from window
integer x = 594
integer y = 460
integer width = 1947
integer height = 972
boolean titlebar = true
string title = "Grabar Datos Como"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
sle_nombre_mant sle_nombre_mant
lb_aux lb_aux
rb_dbf3 rb_dbf3
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
global w_exportar_archivo_pac w_exportar_archivo_pac

type variables
datawindow dw_paso
SaveAsType TipoArchivo
STRING	is_fecha,is_fecha_mant,is_depto='I'
Date		idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_grabar_archivo_contable ()
end prototypes

public subroutine wf_grabar_archivo_contable ();Date		ld_fecha,ld_fecha_hoy
String	ls_caja,ls_empresa,archivo
Long		ll_row,ll_count,ll_suma

if isvalid(w_envio_archivo_pac) then
	ll_suma			= 0
	ld_fecha			= idt_fecha_hoy
	ll_row			= w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()
	if ll_row>0 then
		Archivo			= trim(sle_nombre.Text)
		INSERT INTO "LOG_ENVIO_ARCHIVO_PAC"  
					( "NOMBRE_ARCHIVO",  "USUARIO",  "CANT_REGISTROS", "FECHA_PROCESO" )  
		VALUES 	( :Archivo, 			:gs_user,   :ll_row,   			:idt_fecha_hoy )  
		Using		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			ll_suma ++
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
	
	ll_row			= w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()
	if ll_row>0 then
		Archivo			= trim(sle_nombre_mant.Text)
		INSERT INTO "LOG_ENVIO_ARCHIVO_PAC"  
					( "NOMBRE_ARCHIVO",  "USUARIO",  "CANT_REGISTROS", "FECHA_PROCESO" )  
		VALUES 	( :Archivo, 			:gs_user,   :ll_row,   			:idt_fecha_hoy )  
		Using		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			ll_suma ++
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
	if ll_suma > 0 then
		if w_envio_archivo_pac.dw_pac_detalle.update() = 1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			w_envio_archivo_pac.cb_print.triggerevent(clicked!)
			w_envio_archivo_pac.cb_limpiar.triggerevent(clicked!)
			Close(w_exportar_archivo_pac)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Detalle PAC SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end subroutine

event open;string 	fecha,ls_parque
Long		ll_pos

sle_nombre.visible					= false
sle_nombre_mant.visible			= false
gf_centrar(w_exportar_archivo_pac)
idt_fecha_hoy						= date(gdt_fec_sistema)
lb_aux.DirList("*.DBF", 16, st_directorio)
st_directorio.text					= gs_directorio_exe
rb_excel.Checked					= True
TipoArchivo 							= XLSX!
if gs_conexion	= "Parque El Prado" then
	if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
		sle_nombre.visible			= true
		is_fecha						= 'BCIPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
	end if
	if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
		is_fecha_mant				= 'BCIPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
		sle_nombre_mant.visible	= true
	end if
elseif gs_conexion	= "Parque La Foresta" then
	if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
		sle_nombre.visible			= true
		is_fecha						= 'BCIFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
	end if
	if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
		sle_nombre_mant.visible	= true
		is_fecha_mant				= 'BCIFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
	end if
elseif gs_conexion	= "Parque Cocepción" then
	if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
		sle_nombre.visible		= true
		is_fecha						= 'BCICONCE'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
	end if
	if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
		sle_nombre_mant.visible	= true
		is_fecha_mant				= 'BCICONCE'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
	end if
end if
if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
	sle_nombre.Text 				= is_fecha+".XLSX"
end if
if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
	sle_nombre_mant.Text 		= is_fecha_mant+".XLSX"
end if
st_directorio.text					= gs_directorio_exe
end event

on w_exportar_archivo_pac.create
this.sle_nombre_mant=create sle_nombre_mant
this.lb_aux=create lb_aux
this.rb_dbf3=create rb_dbf3
this.rb_texto=create rb_texto
this.rb_excel=create rb_excel
this.cbx_encabezado=create cbx_encabezado
this.st_directorio=create st_directorio
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.sle_nombre=create sle_nombre
this.st_1=create st_1
this.gb_formato=create gb_formato
this.Control[]={this.sle_nombre_mant,&
this.lb_aux,&
this.rb_dbf3,&
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

on w_exportar_archivo_pac.destroy
destroy(this.sle_nombre_mant)
destroy(this.lb_aux)
destroy(this.rb_dbf3)
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

type sle_nombre_mant from singlelineedit within w_exportar_archivo_pac
integer x = 50
integer y = 232
integer width = 1440
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

type lb_aux from listbox within w_exportar_archivo_pac
boolean visible = false
integer x = 1554
integer y = 964
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

type rb_dbf3 from radiobutton within w_exportar_archivo_pac
integer x = 1504
integer y = 548
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

event clicked;if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
	sle_nombre.Text 			= is_fecha+".DBF"
end if
if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
	sle_nombre_mant.Text 	= is_fecha_mant+".DBF"
end if
st_directorio.text					= gs_directorio_exe
end event

type rb_texto from radiobutton within w_exportar_archivo_pac
integer x = 818
integer y = 548
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

event clicked;if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
	sle_nombre.Text 			= is_fecha+".TXT"
end if
if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
	sle_nombre_mant.Text 	= is_fecha_mant+".TXT"
end if
st_directorio.text					= gs_directorio_exe
end event

type rb_excel from radiobutton within w_exportar_archivo_pac
integer x = 114
integer y = 548
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

event clicked;if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
	sle_nombre.Text 			= is_fecha+".XLSX"
end if
if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
	sle_nombre_mant.Text 	= is_fecha_mant+".XLSX"
end if
st_directorio.text					= gs_directorio_exe
end event

type cbx_encabezado from checkbox within w_exportar_archivo_pac
integer x = 64
integer y = 724
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

type st_directorio from statictext within w_exportar_archivo_pac
integer x = 50
integer y = 332
integer width = 1435
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

type cb_cancelar from commandbutton within w_exportar_archivo_pac
integer x = 1545
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

event clicked;Close(w_exportar_archivo_pac)

end event

type cb_aceptar from commandbutton within w_exportar_archivo_pac
integer x = 1541
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
Long		Ret,p,Resp
SetPointer(HourGlass!)
IF rb_excel.Checked = True THEN
	TipoArchivo 					= XLSX!
	if gs_conexion	= "Parque El Prado" then
		if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
			is_fecha						= 'BCIPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
		end if
		if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
			is_fecha_mant				= 'BCIPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
		end if
	elseif gs_conexion = "Parque La Foresta" then
		if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
			is_fecha						= 'BCIFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
		end if
		if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
			is_fecha_mant				= 'BCIFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
		end if
	elseif gs_conexion = "Parque Concepción" then
		if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
			is_fecha						= 'BCICONCE'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
		end if
		if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
			is_fecha_mant				= 'BCICONCE'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
		end if
	end if
	if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
		sle_nombre.Text 				= is_fecha+".XLSX"
	end if
	if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
		sle_nombre_mant.Text 		= is_fecha_mant+".XLSX"
	end if

ELSEIF 	rb_texto.Checked = True THEN
	TipoArchivo = Text!
	if gs_conexion	= "Parque El Prado" then
		if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
			is_fecha						= 'BCIPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
		end if
		if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
			is_fecha_mant				= 'BCIPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
		end if
	elseif gs_conexion	= "Parque La Foresta" then
		if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
			is_fecha						= 'BCIFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
		end if
		if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
			is_fecha_mant				= 'BCIFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
		end if
	elseif gs_conexion	= "Parque Concepción" then
		if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
			is_fecha						= 'BCICONCE'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
		end if
		if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
			is_fecha_mant				= 'BCICONCE'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
		end if
	end if
	if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
		sle_nombre.Text 				= is_fecha+".TXT"
	end if
	if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
		sle_nombre_mant.Text 		= is_fecha_mant+".TXT"
	end if
	
ELSEIF 	rb_dbf3.Checked = True THEN
	TipoArchivo = dBase3!
	if gs_conexion	= "Parque El Prado" then
		if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
			is_fecha						= 'BCIPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
		end if
		if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
			is_fecha_mant				= 'BCIPRADO'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
		end if
	elseif gs_conexion = "Parque La Foresta" then
		if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
			is_fecha						= 'BCIFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
		end if
		if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
			is_fecha_mant				= 'BCIFORES'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
		end if
	elseif gs_conexion = "Parque Concepción" then
		if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
			is_fecha						= 'BCICONCE'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'E'
		end if
		if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
			is_fecha_mant				= 'BCICONCE'+string(year(idt_fecha_hoy),"0000")+string(month(idt_fecha_hoy),"00")+string(day(idt_fecha_hoy),"00")+'F'
		end if
	end if
	if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
		sle_nombre.Text 				= is_fecha+".DBF"
	end if
	if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
		sle_nombre_mant.Text 		= is_fecha_mant+".DBF"
	end if
END IF	
if w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount()>0 then
	Archivo		= trim(sle_nombre.Text)
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
		else
			Resp = w_envio_archivo_pac.dw_envio_archivo_pac_cred.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
			If Resp < 0  Then
				MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow Crédito en un Archivo.", Exclamation!)
//			else
//				wf_grabar_archivo_contable()
			End If
		End If
	else
		Resp = w_envio_archivo_pac.dw_envio_archivo_pac_cred.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
		If Resp < 0  Then
			MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow Crédito en un Archivo.", Exclamation!)
//		else
//			wf_grabar_archivo_contable()
		End If	
	End If
end if

if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount()>0 then
	Archivo		= trim(sle_nombre_mant.Text)
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
		else
			Resp = w_envio_archivo_pac.dw_envio_archivo_pac_mant.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
			If Resp < 0  Then
				MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow Mantención en un Archivo.", Exclamation!)
//			else
//				wf_grabar_archivo_contable()
			End If
		End If
	else
		Resp = w_envio_archivo_pac.dw_envio_archivo_pac_mant.SaveAs( Archivo,TipoArchivo, cbx_encabezado.Checked)
		If Resp < 0  Then
			MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow Mantención en un Archivo.", Exclamation!)
//		else
//			wf_grabar_archivo_contable()
		End If	
	End If
end if
if w_envio_archivo_pac.dw_envio_archivo_pac_mant.rowcount() > 0 or w_envio_archivo_pac.dw_envio_archivo_pac_cred.rowcount() > 0 then
	wf_grabar_archivo_contable()
end if
SetPointer(Arrow!)
close(w_exportar_archivo_pac)
end event

type sle_nombre from singlelineedit within w_exportar_archivo_pac
integer x = 50
integer y = 128
integer width = 1440
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

type st_1 from statictext within w_exportar_archivo_pac
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

type gb_formato from groupbox within w_exportar_archivo_pac
integer x = 50
integer y = 440
integer width = 1819
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

