forward
global type w_archivo_mantencion from window
end type
type hpb_1 from hprogressbar within w_archivo_mantencion
end type
type dw_2 from datawindow within w_archivo_mantencion
end type
type ddlb_1 from dropdownlistbox within w_archivo_mantencion
end type
type lb_1 from listbox within w_archivo_mantencion
end type
type st_1 from statictext within w_archivo_mantencion
end type
type cb_3 from commandbutton within w_archivo_mantencion
end type
type em_2 from editmask within w_archivo_mantencion
end type
type em_1 from editmask within w_archivo_mantencion
end type
type p_2 from picture within w_archivo_mantencion
end type
type p_1 from picture within w_archivo_mantencion
end type
type cb_2 from commandbutton within w_archivo_mantencion
end type
type cb_1 from commandbutton within w_archivo_mantencion
end type
type dw_1 from datawindow within w_archivo_mantencion
end type
type gb_1 from groupbox within w_archivo_mantencion
end type
end forward

global type w_archivo_mantencion from window
integer width = 1902
integer height = 1636
boolean titlebar = true
string title = "Exportar Archivo"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
hpb_1 hpb_1
dw_2 dw_2
ddlb_1 ddlb_1
lb_1 lb_1
st_1 st_1
cb_3 cb_3
em_2 em_2
em_1 em_1
p_2 p_2
p_1 p_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_archivo_mantencion w_archivo_mantencion

on w_archivo_mantencion.create
this.hpb_1=create hpb_1
this.dw_2=create dw_2
this.ddlb_1=create ddlb_1
this.lb_1=create lb_1
this.st_1=create st_1
this.cb_3=create cb_3
this.em_2=create em_2
this.em_1=create em_1
this.p_2=create p_2
this.p_1=create p_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.hpb_1,&
this.dw_2,&
this.ddlb_1,&
this.lb_1,&
this.st_1,&
this.cb_3,&
this.em_2,&
this.em_1,&
this.p_2,&
this.p_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_archivo_mantencion.destroy
destroy(this.hpb_1)
destroy(this.dw_2)
destroy(this.ddlb_1)
destroy(this.lb_1)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;gf_centrar(w_archivo_mantencion)

em_1.text = string(today (),'dd/mm/yyyy')
em_2.text = string(today (),'dd/mm/yyyy')
if gs_empresa = 'El Prado' then
	ddlb_1.additem ('Prado')
	ddlb_1.additem ('Manantial')
	ddlb_1.additem ('Santiago')
	ddlb_1.SelectItem("Prado", 0)
elseif gs_empresa = 'La Foresta' then
	ddlb_1.additem ('Foresta')
	ddlb_1.SelectItem("Foresta", 0)
elseif gs_empresa = 'Concepcion' then
	ddlb_1.additem ('Concepción')
	ddlb_1.SelectItem("Concepción", 0)
end if

end event

type hpb_1 from hprogressbar within w_archivo_mantencion
integer x = 1216
integer y = 852
integer width = 576
integer height = 80
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_2 from datawindow within w_archivo_mantencion
integer x = 2126
integer y = 316
integer width = 937
integer height = 600
integer taborder = 60
boolean titlebar = true
string title = "none"
string dataobject = "dw_archivo_aviso_mant"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type ddlb_1 from dropdownlistbox within w_archivo_mantencion
integer x = 1253
integer y = 80
integer width = 498
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type lb_1 from listbox within w_archivo_mantencion
integer x = 352
integer y = 1620
integer width = 457
integer height = 316
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_archivo_mantencion
integer x = 50
integer y = 1320
integer width = 1751
integer height = 96
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 255
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_archivo_mantencion
integer x = 1257
integer y = 708
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;integer i,Ret,li_ret
boolean lb_exist
string archivo,archivo_xls,nombre,direccion,poblacion,comuna,ciudad,&
       base,serie,numero_direccion,sector,block,depto, calle
long correlativo,ll_newrow
Double	numero
datetime fecha_emision
if dw_1.rowcount() > 0 then
	SaveAsType TipoArchivo,TipoArchivo_xls
	hpb_1.minposition = 0
	hpb_1.maxposition = dw_1.rowcount()
	hpb_1.setstep = 10
	for i = 1 to dw_1.rowcount()
		hpb_1.position = i
		base = dw_1.getitemstring(i,'cadena_codigo')
		serie = dw_1.getitemstring(i,'cadena_serie')
		numero = dw_1.getitemnumber(i,'cadena_numero')
		SELECT "CLIENTE"."NOMBRE"||' '||"CLIENTE"."A_PATERNO"||' '||"CLIENTE"."A_MATERNO" as nombre   ,
				 "CLIENTE"."DIRECCION_P",
				 "CLIENTE"."POBLACION"   ,
				 "COMUNA"."COMUNA"   ,
				 "CIUDAD"."CIUDAD"   ,
				 "CADENA"."CODIGO"   ,
				 "CADENA"."SERIE"   ,
				 "CADENA"."NUMERO"   ,
				 sysdate as fecha_emision ,
				 "CLIENTE"."NUMERO_PARTICULAR" ,
				 "CLIENTE"."SECTOR",   
         	 "CLIENTE"."BLOCK_PARTICULAR",   
	          "CLIENTE"."DEPTO_PARTICULAR"  ,
				 "TIPO_VIA"."DESCRIPCION"
		into :nombre,:direccion,:poblacion,:comuna,:ciudad,:base,:serie,:numero,:fecha_emision,:numero_direccion,:sector,:block,:depto,:calle 
		FROM "CADENA","CLIENTE","COMUNA","CIUDAD","TIPO_VIA" 
		WHERE ( "CADENA"."RUT"           = "CLIENTE"."RUT" ) and  
				( "CLIENTE"."COMUNA"       = "COMUNA"."CODIGO_COMUNA" ) and  
				( "COMUNA"."CODIGO_CIUDAD" = "CIUDAD"."CODIGO_CIUDAD" ) and  
				( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and 
				( ( "CADENA"."CODIGO"      = :base ) AND  
				( "CADENA"."SERIE"         = :serie ) AND  
				( "CADENA"."NUMERO"        = :numero )) ;
		if sqlca.sqlcode = 0 then
			correlativo = i
			ll_newrow = dw_2.InsertRow(0)
			dw_2.ScrollToRow(ll_newrow)
			if trim(block)     ='-' then 
				block     = ''
			else
				block     = 'Block: '+block
			end if
			if trim(depto)     ='-' then 
				depto     = ''
			else	
				depto     = 'Depto: '+depto
			end if
			if trim(poblacion) ='-' then poblacion = ''			
			dw_2.setitem(ll_newrow,'nombre',nombre)
			dw_2.setitem(ll_newrow,'direccion',calle+' '+direccion+' '+numero_direccion+' '+block+ ' '+depto)
			dw_2.setitem(ll_newrow,'poblacion',poblacion)
			dw_2.setitem(ll_newrow,'comuna',comuna)
			dw_2.setitem(ll_newrow,'ciudad',ciudad)
			dw_2.setitem(ll_newrow,'base',base)
			dw_2.setitem(ll_newrow,'serie',serie)
			dw_2.setitem(ll_newrow,'numero',numero)
			dw_2.setitem(ll_newrow,'fecha_emision',fecha_emision)
			dw_2.setitem(ll_newrow,'correlativo',correlativo)
			if ddlb_1.text = 'Prado' then
				dw_2.setitem(ll_newrow,'observacion','Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_P')
			elseif ddlb_1.text = 'Manantial' then
				dw_2.setitem(ll_newrow,'observacion','Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_M')
			elseif ddlb_1.text = 'Santiago' then
				dw_2.setitem(ll_newrow,'observacion','Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_S')
			elseif ddlb_1.text = 'Foresta' then
				dw_2.setitem(ll_newrow,'observacion','Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_F')
			elseif ddlb_1.text = 'Concepción' then
				dw_2.setitem(ll_newrow,'observacion','Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_C')
			end if
		end if
	next
	TipoArchivo = Text!
	if ddlb_1.text = 'Prado' then
		archivo     = '\Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_P.txt'
		archivo_xls = '\Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_P.xls'
	elseif ddlb_1.text = 'Manantial' then
		archivo     = '\Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_M.txt'
		archivo_xls = '\Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_M.xls'
	elseif ddlb_1.text = 'Santiago' then
		archivo     = '\Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_S.txt'
		archivo_xls = '\Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_S.xls'
	elseif ddlb_1.text = 'Foresta' then
		archivo     = '\Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_F.txt'
		archivo_xls = '\Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_F.xls'
	elseif ddlb_1.text = 'Concepción' then
		archivo     = '\Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_C.txt'
		archivo_xls = '\Av_Venc_'+mid(em_2.text,4,2)+'_'+mid(em_2.text,7,4)+'_C.xls'
	end if
	st_1.text = ''
	lb_1.DirList("*.DBF", 16, st_1)
	st_1.text = st_1.text+archivo
	if 1 = MessageBox("Desea Grabar", "¿ Desea Grabar el Archivo "+st_1.text+' ?', Question!, YesNo!) then
		lb_exist = FileExists(st_1.text)
		IF lb_exist THEN 
			li_ret = MessageBox("Existe Archivo", "Existe Archivo "+st_1.text+', ¿ Desea eliminarlo ?', Question!, YesNo!)
			if li_ret = 1 then 
				FileDelete(st_1.text)
				messagebox('Archivo Elmimando', 'El Archivo '+st_1.text+' fue eliminado', information!)
			end if
		end if
		Ret = dw_1.SaveAs( st_1.text,TipoArchivo,true)
		If Ret < 0  Then
			MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
		else
			MessageBox("Operación  Exitosa", "Fue posible Grabar el Contenido de la DataWindow en un Archivo llamado: "+st_1.text, Exclamation!)	
		End If
	end if
	TipoArchivo_xls = Excel!		
	st_1.text = ''
	lb_1.DirList("*.DBF", 16, st_1)
	st_1.text = st_1.text + archivo_xls
	if 1 = MessageBox("Desea Grabar", "¿ Desea Grabar el Archivo "+st_1.text+' ?', Question!, YesNo!) then
		lb_exist = FileExists(st_1.text)
		IF lb_exist THEN 
			li_ret = MessageBox("Existe Archivo", "Existe Archivo "+st_1.text+', ¿ Desea eliminarlo ?', Question!, YesNo!)
			if li_ret = 1 then 
				FileDelete(st_1.text)
				messagebox('Archivo Elmimando', 'El Archivo '+st_1.text+' fue eliminado', information!)
			end if
		end if
		Ret = dw_2.SaveAs( st_1.text,TipoArchivo_xls,true)
		If Ret < 0  Then
			MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
		else
			MessageBox("Operación  Exitosa", "Fue posible Grabar el Contenido de la DataWindow en un Archivo llamado: "+st_1.text, Exclamation!)	
		End If
	end if
else
end if
end event

type em_2 from editmask within w_archivo_mantencion
integer x = 1253
integer y = 316
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_1 from editmask within w_archivo_mantencion
integer x = 1253
integer y = 204
integer width = 402
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type p_2 from picture within w_archivo_mantencion
integer x = 1673
integer y = 328
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech,archivo
long uf

//archivo = '\Aviso_mant'+mid(em_2.text,1,2)+mid(em_2.text,4,2)+mid(em_2.text,7,4)+'.txt'
//st_1.text = st_1.text+archivo
dw_1.reset()
if f_valida_fecha(em_2.text)=-1 then 
	em_2.text=string(today(),gs_formato_fecha)
	em_2.setfocus()
	return
end if	
if em_2.text<>'00/00/0000' then
	ls_fecha = em_2.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_1.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_2.setfocus()
		return
	else	
		em_2.text = Message.StringParm
	end if	
END IF
end event

type p_1 from picture within w_archivo_mantencion
integer x = 1673
integer y = 208
integer width = 82
integer height = 88
boolean originalsize = true
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech,archivo
long uf

//archivo = '\Aviso_mant'+mid(em_2.text,1,2)+mid(em_2.text,4,2)+mid(em_2.text,7,4)+'.txt'
//st_1.text = st_1.text+archivo
dw_1.reset()
if f_valida_fecha(em_1.text)=-1 then 
	em_1.text=string(today(),gs_formato_fecha)
	em_1.setfocus()
	return
end if	
if em_1.text<>'00/00/0000' then
	ls_fecha = em_1.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_2.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha final debe ser mayor a la inicial.',stopsign!)
		em_1.setfocus()
		return
	else	
		em_1.text = Message.StringParm
	end if	
END IF
end event

type cb_2 from commandbutton within w_archivo_mantencion
integer x = 1257
integer y = 452
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;string archivo
dw_1.reset()
dw_1.settransobject(sqlca)
if ddlb_1.text = 'Prado' then
	dw_1.retrieve(date(em_1.text),date(em_2.text),1)
elseif ddlb_1.text = 'Manantial' then
	dw_1.retrieve(date(em_1.text),date(em_2.text),102)
elseif ddlb_1.text = 'Santiago' then
	dw_1.retrieve(date(em_1.text),date(em_2.text),103)
elseif ddlb_1.text = 'Foresta' then
	dw_1.retrieve(date(em_1.text),date(em_2.text),11)
elseif ddlb_1.text = 'Concepción' then
	dw_1.retrieve(date(em_1.text),date(em_2.text),801)
end if
hpb_1.position = 0
//archivo = '\Aviso_mant'+mid(em_2.text,1,2)+mid(em_2.text,4,2)+mid(em_2.text,7,4)+'.txt'
//st_1.text = st_1.text+archivo
end event

type cb_1 from commandbutton within w_archivo_mantencion
integer x = 1253
integer y = 1188
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_archivo_mantencion)
end event

type dw_1 from datawindow within w_archivo_mantencion
integer x = 46
integer y = 40
integer width = 1125
integer height = 1260
integer taborder = 10
string title = "none"
string dataobject = "dw_archivo_mantencion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_archivo_mantencion
integer x = 1216
integer y = 8
integer width = 576
integer height = 600
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 82042848
end type

