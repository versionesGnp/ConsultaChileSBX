forward
global type w_mantenedor_pac from window
end type
type st_help from statictext within w_mantenedor_pac
end type
type cb_eliminar from commandbutton within w_mantenedor_pac
end type
type cb_grabar from commandbutton within w_mantenedor_pac
end type
type em_fec_ini from editmask within w_mantenedor_pac
end type
type cb_proceso from picturebutton within w_mantenedor_pac
end type
type st_2 from statictext within w_mantenedor_pac
end type
type p_1 from picture within w_mantenedor_pac
end type
type p_2 from picture within w_mantenedor_pac
end type
type st_3 from statictext within w_mantenedor_pac
end type
type em_fec_fin from editmask within w_mantenedor_pac
end type
type cb_cerrar from commandbutton within w_mantenedor_pac
end type
type dw_lista from datawindow within w_mantenedor_pac
end type
end forward

global type w_mantenedor_pac from window
integer width = 3410
integer height = 1792
boolean titlebar = true
string title = "Mantenedor Detalle Envio PAC"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_help st_help
cb_eliminar cb_eliminar
cb_grabar cb_grabar
em_fec_ini em_fec_ini
cb_proceso cb_proceso
st_2 st_2
p_1 p_1
p_2 p_2
st_3 st_3
em_fec_fin em_fec_fin
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_mantenedor_pac w_mantenedor_pac

type variables
Long	il_row
end variables

on w_mantenedor_pac.create
this.st_help=create st_help
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.em_fec_ini=create em_fec_ini
this.cb_proceso=create cb_proceso
this.st_2=create st_2
this.p_1=create p_1
this.p_2=create p_2
this.st_3=create st_3
this.em_fec_fin=create em_fec_fin
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.st_help,&
this.cb_eliminar,&
this.cb_grabar,&
this.em_fec_ini,&
this.cb_proceso,&
this.st_2,&
this.p_1,&
this.p_2,&
this.st_3,&
this.em_fec_fin,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_mantenedor_pac.destroy
destroy(this.st_help)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.em_fec_ini)
destroy(this.cb_proceso)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.p_2)
destroy(this.st_3)
destroy(this.em_fec_fin)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;date	ld_fec_ini,ld_fec_fin

gf_centrar(w_mantenedor_pac)
dw_lista.settransobject(sqlca)
em_fec_ini.text	= w_envio_archivo_pac.tab_1.tabpage_1.em_fec_ini.text
em_fec_fin.text	= w_envio_archivo_pac.tab_1.tabpage_1.em_fec_fin.text
ld_fec_ini			= date(em_fec_ini.text)
ld_fec_fin			= date(em_fec_fin.text)
dw_lista.retrieve(ld_fec_ini,ld_fec_fin)

end event

event mousemove;st_help.visible	= false
end event

type st_help from statictext within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 2153
integer y = 56
integer width = 1193
integer height = 128
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28377087
string text = "Antes de Presionar Copiar Código OE, debe Ingresar el Nº Orden de Envio en la Fila Inicial que desee"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_help.visible	= false
end event

type cb_eliminar from commandbutton within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 1513
integer y = 1556
integer width = 357
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;Long		ll_cupon,ll_res
String	ls_base,ls_serie
datetime	ldt_fecha_pago
Double	ll_numero

if il_row > 0 then
	ls_base			= dw_lista.getitemstring(il_row,'base')
	ls_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_numero		= dw_lista.getitemnumber(il_row,'numero')
	ldt_fecha_pago	= dw_lista.getitemdatetime(il_row,'fecha_pago')
	ll_cupon			= dw_lista.getitemnumber(il_row,'cupon')
	ll_res			= messagebox("Eliminar","Está seguro de Eliminar Registro Nº "+string(il_row,'###,###,##0')+ "Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,###,##0')+" Nº Cupón "+string(ll_cupon)+ " Fecha de Pago "+string(ldt_fecha_pago,'dd/mm/yyyy'),Exclamation!,YesNo!,2)
	if ll_res = 1 then
		dw_lista.deleterow(il_row)
		if dw_lista.update() =1 then
			commit;
			messagebox("Eliminar","Eliminación Exitosa")
		else
			rollback;
			messagebox("Error Eliminar","Error al Eliminar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_grabar from commandbutton within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1556
integer width = 357
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;if dw_lista.update() =1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if
end event

type em_fec_ini from editmask within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 416
integer y = 44
integer width = 398
integer height = 88
integer taborder = 10
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event ue_mousemove;st_help.visible	= false
end event

event modified;dw_lista.reset()
date		ld_fec_ini,ld_fec_fin,ld_fecha,ld_fecha_proc
Long		ll_tot_reg

ld_fec_ini				= date(em_fec_ini.text)
ld_fec_fin				= date(em_fec_fin.text)
if ld_fec_fin < ld_fec_ini then
	ld_fecha				= date(em_fec_ini.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
end if
end event

type cb_proceso from picturebutton within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 1783
integer y = 24
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = " "
string picturename = "ok.bmp"
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;date		ld_fec_ini,ld_fec_fin,ld_fecha,ld_fecha_proc
Long		ll_tot_reg

ld_fec_ini					= date(em_fec_ini.text)
ld_fec_fin					= date(em_fec_fin.text)
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	ll_tot_reg				= dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

type st_2 from statictext within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 56
integer width = 357
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_help.visible	= false
end event

type p_1 from picture within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 823
integer y = 44
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;String	ls_fecha

dw_lista.reset()
if trim(em_fec_ini.text)='00/00/0000' or trim(em_fec_ini.text)='' or &
	isnull(trim(em_fec_ini.text)) then	
	
	em_fec_ini.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if trim(em_fec_ini.text)<>'00/00/0000' and not isnull(trim(em_fec_ini.text)) and &
	trim(em_fec_ini.text)<>'' then
	
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_ini.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini.text = Message.StringParm

end event

type p_2 from picture within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 1673
integer y = 44
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;String	ls_fecha
datetime	ld_fecha_fin,ld_fec_ini,ld_fec_fin
Double	ldb_uf_fin
date		ld_fecha,ld_fecha_proc

dw_lista.reset()
if trim(em_fec_fin.text)='00/00/0000' or trim(em_fec_fin.text)='' or &
	isnull(trim(em_fec_fin.text)) then	
	
	em_fec_fin.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if trim(em_fec_fin.text)<>'00/00/0000' and not isnull(trim(em_fec_fin.text)) and &
	trim(em_fec_fin.text)<>'' then
	
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_fin.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_fin.text = Message.StringParm

ld_fec_ini	= datetime(date(em_fec_ini.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			em_fec_fin.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type st_3 from statictext within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 914
integer y = 56
integer width = 329
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_help.visible	= false
end event

type em_fec_fin from editmask within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 1266
integer y = 44
integer width = 398
integer height = 88
integer taborder = 20
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event ue_mousemove;st_help.visible	= false
end event

event modified;datetime	ld_fec_ini,ld_fec_fin
Date		ld_fecha,ld_fecha_proc
Double	ldb_uf_fin

//dw_lista.reset()
ld_fec_ini	= datetime(date(em_fec_ini.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			em_fec_fin.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 2994
integer y = 1556
integer width = 357
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;close(w_mantenedor_pac)
end event

type dw_lista from datawindow within w_mantenedor_pac
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 184
integer width = 3319
integer height = 1336
integer taborder = 40
string title = "none"
string dataobject = "dw_mantenedor_pac_detalle"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_help.visible	= true
end event

event clicked;String	ls_columna,ls_oe,ls_oe_copiar
Long		ll_tot_reg,ll_indi

ls_columna	= dwo.name
if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
else
	if ls_columna='t_copiar' then
		Setnull(ls_oe_copiar)
		ll_tot_reg	= dw_lista.rowcount()
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				ls_oe	= dw_lista.getitemstring(ll_indi,'codigo_oe_bci')
				if not isnull(ls_oe) and ls_oe<>'' and isnull(ls_oe_copiar) then
					ls_oe_copiar	= ls_oe
				end if
				if not isnull(ls_oe_copiar) and isnull(ls_oe) then
					dw_lista.setitem(ll_indi,'codigo_oe_bci',ls_oe_copiar)
				end if
			next
			dw_lista.accepttext()
		end if
	end if
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

