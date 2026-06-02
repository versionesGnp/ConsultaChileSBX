forward
global type w_listas_generadas_terreno from window
end type
type cb_1 from commandbutton within w_listas_generadas_terreno
end type
type dw_1 from datawindow within w_listas_generadas_terreno
end type
type cb_cerrar from commandbutton within w_listas_generadas_terreno
end type
type cb_anular from commandbutton within w_listas_generadas_terreno
end type
type cb_ordenar from commandbutton within w_listas_generadas_terreno
end type
type cb_filtrar from commandbutton within w_listas_generadas_terreno
end type
type cb_exportar from commandbutton within w_listas_generadas_terreno
end type
type cb_imprimir from commandbutton within w_listas_generadas_terreno
end type
type st_procesar from statictext within w_listas_generadas_terreno
end type
type pb_aceptar from picturebutton within w_listas_generadas_terreno
end type
type p_fin from picture within w_listas_generadas_terreno
end type
type em_fec_fin from editmask within w_listas_generadas_terreno
end type
type p_ini from picture within w_listas_generadas_terreno
end type
type st_2 from statictext within w_listas_generadas_terreno
end type
type em_fec_ini from editmask within w_listas_generadas_terreno
end type
type st_1 from statictext within w_listas_generadas_terreno
end type
type dw_lista from datawindow within w_listas_generadas_terreno
end type
type gb_1 from groupbox within w_listas_generadas_terreno
end type
end forward

global type w_listas_generadas_terreno from window
integer width = 3346
integer height = 1808
boolean titlebar = true
string title = "Listas Generadas para Gestión Cobranza"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
dw_1 dw_1
cb_cerrar cb_cerrar
cb_anular cb_anular
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
st_procesar st_procesar
pb_aceptar pb_aceptar
p_fin p_fin
em_fec_fin em_fec_fin
p_ini p_ini
st_2 st_2
em_fec_ini em_fec_ini
st_1 st_1
dw_lista dw_lista
gb_1 gb_1
end type
global w_listas_generadas_terreno w_listas_generadas_terreno

type variables
long	il_row
end variables

on w_listas_generadas_terreno.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.cb_cerrar=create cb_cerrar
this.cb_anular=create cb_anular
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.st_procesar=create st_procesar
this.pb_aceptar=create pb_aceptar
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.p_ini=create p_ini
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.dw_1,&
this.cb_cerrar,&
this.cb_anular,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.st_procesar,&
this.pb_aceptar,&
this.p_fin,&
this.em_fec_fin,&
this.p_ini,&
this.st_2,&
this.em_fec_ini,&
this.st_1,&
this.dw_lista,&
this.gb_1}
end on

on w_listas_generadas_terreno.destroy
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.cb_cerrar)
destroy(this.cb_anular)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.st_procesar)
destroy(this.pb_aceptar)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.p_ini)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event mousemove;st_procesar.visible			= false

end event

event open;date	ld_fec_ini, ld_fec_fin

SetPointer(HourGlass!)
dw_lista.dataobject = 'dw_lista_generadas_cobranza_terreno'
dw_1.SETTRANSOBJECT(SQLCA)
gf_centrar(w_listas_generadas_terreno)
dw_lista.settransobject(sqlca)
em_fec_ini.text		= string(today())
em_fec_fin.text		= string(today())
ld_fec_ini				= date(em_fec_ini.text)
ld_fec_fin				= date(em_fec_fin.text)
if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user)>0 then
	dw_lista.object.t_fecha.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
end if
if gs_depto='E' or gs_depto='I' then
	cb_anular.enabled	= true
else
	cb_anular.enabled	= false
end if
SetPointer(Arrow!)
end event

type cb_1 from commandbutton within w_listas_generadas_terreno
boolean visible = false
integer x = 2130
integer y = 1608
integer width = 174
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "ok"
end type

event clicked;LONG	LL_TOT_REG,LL_INDI
UPDATE "CADENA"  
SET "ASIGNACION_AT" = 'N'  ;
COMMIT;
LL_TOT_REG	= dw_1.RETRIEVE()
FOR LL_INDI=1 TO LL_TOT_REG
	dw_1.SETITEM(LL_INDI,'cadena_asignacion_at','S')
NEXT
dw_1.ACCEPTTEXT()
IF dw_1.UPDATE()=1 THEN
	COMMIT;
	MESSAGEBOX("GRABAR","GRABAR")
ELSE
	ROLLBACK;
	MESSAGEBOX("ERROR","ERROR")
END IF


end event

type dw_1 from datawindow within w_listas_generadas_terreno
boolean visible = false
integer x = 1687
integer y = 1580
integer width = 411
integer height = 432
integer taborder = 110
string title = "none"
string dataobject = "dw_grabar_cadena_at"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_listas_generadas_terreno
integer x = 2944
integer y = 1576
integer width = 343
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listas_generadas_terreno)
end event

type cb_anular from commandbutton within w_listas_generadas_terreno
integer x = 1202
integer y = 1576
integer width = 357
integer height = 92
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular Lista"
end type

event clicked;Long 		ll_resp,ll_codigo,ll_rut
string		ls_anular,ls_estado,ls_base,ls_serie
Datetime	ldt_fecha_asig
Date		ld_fecha_ori
Double	ll_numero

if il_row>0 then
	ls_anular	= 'A'
	ll_codigo		= dw_lista.getitemnumber(il_row,'at_lista_gestion_codigo_grupo')
	ls_estado	= dw_lista.getitemstring(il_row,'at_lista_gestion_estado_gestion_lista')
	if ls_estado ='P' then
		ll_resp	= MessageBox("Anular Lista", "Está seguro de Anular Lista Nº "+string(ll_codigo,"###,###,###,##0"), &
				Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			DECLARE	x1 CURSOR FOR  
			SELECT	"AT_GESTION"."RUT_CLIENTE",   
						"AT_GESTION"."FECHA_CREA",
						"AT_GESTION"."BASE",
						"AT_GESTION"."SERIE",
						"AT_GESTION"."NUMERO"
			FROM 	"AT_GESTION"  
			WHERE 	"AT_GESTION"."CODIGO_GRUPO" = :ll_codigo 
			USING		sqlca;
			open 		x1;
			do while sqlca.sqlcode=0 
				fetch x1 into :ll_rut, :ldt_fecha_asig, :ls_base, :ls_serie, :ll_numero;
				if not isnull(ll_rut) and ll_rut>0 then
					ld_fecha_ori	= date(gdt_fec_sistema)
					UPDATE	"CLIENTE"  
					SET 		"FECHA_PROX_LLAMADO" = :ld_fecha_ori,   
								"ASIGNADO_COBRANZA" = 'N'  
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						UPDATE	"CADENA"  
						SET 		"ASIGNACION_AT" = 'N'  
						WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					else
						rollback;
					end if
				end if
				setnull(ll_rut); setnull(ldt_fecha_asig)
			loop
			close x1;
			dw_lista.setitem(il_row,'at_lista_gestion_estado_gestion_lista','A')
			if dw_lista.update()=1 then
				commit;
				UPDATE	"AT_GESTION"  
				SET 		"ESTADO_GESTION" = 'A'  
				WHERE 	"AT_GESTION"."CODIGO_GRUPO" = :ll_codigo   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if

				messagebox("Anular","Anulación Exitosa")
			else
				rollback;
			end if
		END IF
	else
		if ls_estado='A' then
			ll_resp		= MessageBox("Eliminar Lista", "Lista Nº "+string(ll_codigo,"###,###,###,##0")+" está Anulada, desea Eliminarla", &
							  Exclamation!, YesNo!, 2)
			IF ll_resp = 1 THEN
				dw_lista.deleterow(il_row)
				if dw_lista.update()=1 then
					commit;
					// Eliminar Clientes Asignados Tabla Gestion_Cobranza	
					DELETE FROM 	"AT_GESTION"  
					WHERE 			"AT_GESTION"."CODIGO_GRUPO" = :ll_codigo
					USING				sqlca;
					if sqlca.sqlcode=0 then
						commit;
						messagebox("Eliminar","Eliminación Exitosa")
					else
						rollback;
					end if
				else
					rollback;
				end if
			END IF		  
		else
			messagebox("Advertencia","Para Anular Lista debe estar P-Pendiente")
		end if
	end if
end if
end event

type cb_ordenar from commandbutton within w_listas_generadas_terreno
event ue_mousemove pbm_dwnmousemove
integer x = 64
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_filtrar from commandbutton within w_listas_generadas_terreno
event ue_mousemove pbm_mousemove
integer x = 315
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;//string nulo
long		ll_filas
//setnull (nulo)
//dw_lista.SETfilter(NULO)
//dw_lista.filter()
//gs_formula 	= dw_lista.describe("datawindow.syntax")
//messagebox("",gs_formula)

long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto
string ls_texto
setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas		= dw_lista.rowcount()
gs_formula 	= dw_lista.describe("datawindow.syntax")
ll_largototal	= len(gs_formula)
ll_posini	= Pos(gs_formula, "filter") + 8
ll_posfin	= len("~nfilter~n")
ls_texto		= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto		= ll_posfin - ll_posini
gs_formula	= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula	= ''
end if

end event

type cb_exportar from commandbutton within w_listas_generadas_terreno
event ue_mousemove pbm_mousemove
integer x = 567
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_listas_generadas_terreno
event ue_mousemove pbm_mousemove
integer x = 859
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
//	f_printdlg(dw_lista,gstr_print,parent)
end if
end event

type st_procesar from statictext within w_listas_generadas_terreno
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1710
integer y = 148
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 31457278
string text = "Procesar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible			= false

end event

type pb_aceptar from picturebutton within w_listas_generadas_terreno
event ue_mousemove pbm_mousemove
integer x = 1755
integer y = 24
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
end type

event ue_mousemove;st_procesar.visible			= true
end event

event clicked;date	ld_fec_ini, ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user)=0 then
			messagebox("Advertencia","No registra dato")
		else
			dw_lista.object.t_fecha.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
		end if		
	end if
end if
end event

type p_fin from picture within w_listas_generadas_terreno
integer x = 1614
integer y = 40
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type em_fec_fin from editmask within w_listas_generadas_terreno
integer x = 1262
integer y = 40
integer width = 343
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type p_ini from picture within w_listas_generadas_terreno
integer x = 969
integer y = 40
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type st_2 from statictext within w_listas_generadas_terreno
integer x = 1079
integer y = 52
integer width = 160
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_listas_generadas_terreno
integer x = 617
integer y = 40
integer width = 343
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_1 from statictext within w_listas_generadas_terreno
integer x = 50
integer y = 52
integer width = 567
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha    desde:"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_listas_generadas_terreno
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 172
integer width = 3246
integer height = 1368
integer taborder = 40
string dataobject = "dw_lista_generadas_cobranza_terreno"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_procesar.visible			= false

end event

event clicked;String	ls_columna
ls_columna	= dwo.name

if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;string		ls_string,ls_tipo_gestion
long		ll_codigo

if row>0 then
	il_row					= row
	ll_codigo				= this.getitemnumber(il_row,'at_lista_gestion_codigo_grupo')
	ls_tipo_gestion		= this.getitemstring(il_row,'at_lista_gestion_tipo_cobranza')
	ls_string				= string(ll_codigo)+'~t'+ls_tipo_gestion
	OpenWithParm(w_detalle_lista_generada_gestion_terreno, ls_string)
end if
end event

type gb_1 from groupbox within w_listas_generadas_terreno
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1528
integer width = 1088
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

