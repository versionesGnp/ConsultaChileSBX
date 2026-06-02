forward
global type w_cd_anular_masivo from window
end type
type cb_ctrol_doc from commandbutton within w_cd_anular_masivo
end type
type pb_aceptar from picturebutton within w_cd_anular_masivo
end type
type cb_anular from commandbutton within w_cd_anular_masivo
end type
type dw_base_serie from datawindow within w_cd_anular_masivo
end type
type cb_filtrar from commandbutton within w_cd_anular_masivo
end type
type cb_sort from commandbutton within w_cd_anular_masivo
end type
type cb_exportar from commandbutton within w_cd_anular_masivo
end type
type cb_imprimir from commandbutton within w_cd_anular_masivo
end type
type cb_limpiar from commandbutton within w_cd_anular_masivo
end type
type cb_grabar from commandbutton within w_cd_anular_masivo
end type
type em_final from editmask within w_cd_anular_masivo
end type
type st_2 from statictext within w_cd_anular_masivo
end type
type em_inicial from editmask within w_cd_anular_masivo
end type
type st_1 from statictext within w_cd_anular_masivo
end type
type cb_cerrar from commandbutton within w_cd_anular_masivo
end type
type dw_lista from datawindow within w_cd_anular_masivo
end type
type gb_2 from groupbox within w_cd_anular_masivo
end type
type gb_1 from groupbox within w_cd_anular_masivo
end type
end forward

global type w_cd_anular_masivo from window
integer width = 3520
integer height = 1764
boolean titlebar = true
string title = "Anulación Masiva de Contrato"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_ctrol_doc cb_ctrol_doc
pb_aceptar pb_aceptar
cb_anular cb_anular
dw_base_serie dw_base_serie
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
cb_grabar cb_grabar
em_final em_final
st_2 st_2
em_inicial em_inicial
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_2 gb_2
gb_1 gb_1
end type
global w_cd_anular_masivo w_cd_anular_masivo

type variables
Long		il_row
String		is_filtro
datawindowchild			idw_detalle5

end variables

event open;gf_centrar(w_cd_anular_masivo)
dw_lista.settransobject(sqlca)
if gs_depto='I' or gs_depto='O' or gs_depto='E' or gs_depto='L' or gs_depto='V' then
	dw_base_serie.getchild('base',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve()=0 then
		idw_detalle.insertrow(0)
	end if
	dw_base_serie.getchild('serie',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve('O')=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_base_serie.insertrow(0)
	dw_base_serie.accepttext()
	dw_base_serie.setfocus()
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_cd_anular_masivo)
end if
end event

on w_cd_anular_masivo.create
this.cb_ctrol_doc=create cb_ctrol_doc
this.pb_aceptar=create pb_aceptar
this.cb_anular=create cb_anular
this.dw_base_serie=create dw_base_serie
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.em_final=create em_final
this.st_2=create st_2
this.em_inicial=create em_inicial
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_ctrol_doc,&
this.pb_aceptar,&
this.cb_anular,&
this.dw_base_serie,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_limpiar,&
this.cb_grabar,&
this.em_final,&
this.st_2,&
this.em_inicial,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_2,&
this.gb_1}
end on

on w_cd_anular_masivo.destroy
destroy(this.cb_ctrol_doc)
destroy(this.pb_aceptar)
destroy(this.cb_anular)
destroy(this.dw_base_serie)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.em_final)
destroy(this.st_2)
destroy(this.em_inicial)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type cb_ctrol_doc from commandbutton within w_cd_anular_masivo
integer x = 942
integer y = 1444
integer width = 347
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Control Docto."
end type

event clicked;String		ls_string,ls_base,ls_serie
Double	ll_numero
if dw_lista.rowcount()>0 then
	ls_base		= dw_lista.getitemstring(il_row,'base')
	ls_serie		= dw_lista.getitemstring(il_row,'serie')
	ll_numero	= dw_lista.getitemnumber(il_row,'numero')
	ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(ls_base) and ll_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type pb_aceptar from picturebutton within w_cd_anular_masivo
integer x = 2363
integer y = 92
integer width = 174
integer height = 144
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_base,ls_serie
long	ll_folio_ini,ll_folio_fin,ll_tot_reg,ll_indi,ll_tot_folio,ll_nulo

SetPointer(HourGlass!)
dw_lista.reset()
dw_base_serie.accepttext()
setnull(ll_nulo)
ls_base									= dw_base_serie.getitemstring(1,'base')
ls_serie									= dw_base_serie.getitemstring(1,'serie')
ll_folio_ini								= long(em_inicial.text)
ll_folio_fin								= long(em_final.text)
if not isnull(ls_base) and not isnull(ls_serie) and ll_folio_ini>0 and ll_folio_fin>0 then
	if ll_folio_ini > ll_folio_fin then
		messagebox("Advertencia","Rango de Folio Inválido")
		dw_lista.reset()
		em_final.setfocus()
		em_final.text					= string(ll_nulo) 	
	else
		ll_tot_reg						= dw_lista.retrieve(ll_folio_ini,ll_folio_fin,ls_base,ls_serie)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos")
		else
			ll_tot_folio					= ll_folio_fin - (ll_folio_ini - 1) 	
			if ll_tot_reg<>ll_tot_folio then
				messagebox("Advertencia","Total Folios a Consultar Diferente a Total Lista")
				messagebox("Advertencia",'Folios Distintos a Estado:~r~n'+&
													'0-ESTADO INICIAL~r~n'+&
													'1-ENTREGAR CONTRATO ADMIN.VENTA~r~n'+&
													'2-ASIGNADO CONTRATO AGENTE / SUPERVISOR~r~n'+&
													'20-ENTREGAR CONTRATO ATENCION TERRENO~r~n'+&
													'21-ENTREGAR CONTRATO ADMIN.VENTA')
			end if
		end if
	end if
else
	if isnull(ls_base) or ls_base='' then
		messagebox("Advertencia","Base Inválida")
		dw_base_serie.setfocus()
		dw_base_serie.setcolumn('base')
	elseif isnull(ls_serie) or ls_serie='' then
		messagebox("Advertencia","Serie Inválida")
		dw_base_serie.setfocus()
		dw_base_serie.setcolumn('serie')	
	elseif isnull(ll_folio_ini) or ll_folio_ini=0 then
		messagebox("Advertencia","Folio Rango Inicial Inválido")
		em_inicial.setfocus()
	elseif isnull(ll_folio_fin) or ll_folio_fin=0 then
		messagebox("Advertencia","Folio Rango Final Inválido")
		em_final.setfocus()
	end if
	dw_lista.reset()
end if
SetPointer(Arrow!)
end event

type cb_anular from commandbutton within w_cd_anular_masivo
integer x = 50
integer y = 1436
integer width = 343
integer height = 108
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular"
end type

event clicked;string	ls_glosa,ls_base,ls_serie,ls_nombre_entregar,ls_memo,ls_ref_memo
long	ll_tot_reg,ll_res,ll_indi,ll_mes,ll_ano,ll_estado
Double	ll_numero

SetPointer(HourGlass!)
dw_lista.accepttext()
SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM		"TASA"  ;
ll_tot_reg						= dw_lista.rowcount()
if ll_tot_reg>0 then
	ll_res							= messagebox("Advertencia","Desea Anular Contratos", Question!, YesNo!)
	if ll_res=1 then
		ll_mes					= 0
		ll_ano						= year(date(gdt_fec_sistema))
		if gs_depto='O' or gs_depto='I' then
			ll_estado				= 100
		elseif gs_depto='V' then
			ll_estado				= 102
		elseif gs_depto='E' then
			ll_estado				= 104	
		elseif gs_depto='L' then
			ll_estado				= 106
		end if
		SELECT	"ENCARGADOS"."NOMBRE"  
		INTO 		:ls_nombre_entregar  
		FROM 	"ENCARGADOS"  
		WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :gs_usuario_entregar   
		USING	sqlca;
		for ll_indi=1 to ll_tot_reg
			ls_base					= dw_lista.getitemstring(ll_indi,'base')
			ls_serie					= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero				= dw_lista.getitemnumber(ll_indi,'numero')
			ls_memo					= dw_lista.getitemstring(ll_indi,'ult_memo')
			ls_ref_memo			= dw_lista.getitemstring(ll_indi,'ult_referencia_memo')
			SELECT	"CD_ESTADO"."GLOSA"  
			INTO 		:ls_glosa  
			FROM 	"CD_ESTADO"  
			WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_glosa				= ls_glosa+' EL DIA '+string(date(gdt_fec_sistema),"dd/mm/yyyy")+', FOLIO Nº '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")
			end if	
			dw_lista.setitem(ll_indi,'fecha_crea',gdt_fec_sistema)
			dw_lista.setitem(ll_indi,'usuario_crea',gs_user)
			dw_lista.setitem(ll_indi,'ult_estado',ll_estado)
			dw_lista.setitem(ll_indi,'ult_fecha_estado',gdt_fec_sistema)
			dw_lista.setitem(ll_indi,'ult_glosa_estado',ls_glosa)
			dw_lista.setitem(ll_indi,'ult_memo',ls_memo)
			dw_lista.setitem(ll_indi,'ult_usuario_gestion',gs_user)
			dw_lista.setitem(ll_indi,'ult_referencia_memo',ls_ref_memo)
			dw_lista.setitem(ll_indi,'mes_cierre',ll_mes)
			dw_lista.setitem(ll_indi,'ano_cierre',ll_ano)
			dw_lista.accepttext()
		next
	end if
else
	messagebox("Advertencia","No Registra Folio Para Anular")
end if
SetPointer(Arrow!)
end event

type dw_base_serie from datawindow within w_cd_anular_masivo
integer x = 110
integer y = 120
integer width = 850
integer height = 116
integer taborder = 10
string title = "none"
string dataobject = "dwe_base_serie"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_base

this.accepttext()
ls_columna				= dwo.name
if ls_columna='base' then	
	ls_base				= dw_base_serie.getitemstring(1,'base')
	dw_base_serie.getchild('serie',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ls_base)=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_base_serie.accepttext()
end if
end event

type cb_filtrar from commandbutton within w_cd_anular_masivo
integer x = 1902
integer y = 1440
integer width = 233
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_sort from commandbutton within w_cd_anular_masivo
integer x = 1664
integer y = 1440
integer width = 233
integer height = 96
integer taborder = 100
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

type cb_exportar from commandbutton within w_cd_anular_masivo
integer x = 1426
integer y = 1440
integer width = 233
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_cd_anular_masivo
integer x = 2514
integer y = 1440
integer width = 261
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_limpiar from commandbutton within w_cd_anular_masivo
integer x = 2254
integer y = 1440
integer width = 261
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		ll_parque
dw_base_serie.reset()
em_inicial.text									= ''
em_final.text									= ''
dw_lista.reset()
dw_base_serie.setfocus()
if gs_conexion	= "Parque El Prado" then
	ll_parque				= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_parque				= 11
elseif gs_conexion	= "Parque Concepción" then
	ll_parque				= 801
end if
dw_base_serie.getchild('serie',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve('O')=0 then
	idw_detalle2.insertrow(0)
end if
dw_base_serie.insertrow(0)
dw_base_serie.accepttext()
end event

type cb_grabar from commandbutton within w_cd_anular_masivo
integer x = 407
integer y = 1436
integer width = 343
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_base,ls_serie,ls_glosa,ls_memo,ls_estado_reg,ls_ref_memo,ls_usuario_entregar,&
			ls_cod_age,ls_cod_sup,ls_cod_jef,ls_usuario
long		ll_tot_reg,ll_indi,ll_cod_parque,ll_estado,ll_mes,ll_ano,ll_res,ll_res2,ll_graba
Double	ll_numero
datetime	ldt_fec_crea

SetPointer(HourGlass!)
dw_lista.accepttext()
ll_tot_reg						= dw_lista.rowcount()
if ll_tot_reg>0 then
	ll_res							= messagebox("Advertencia","Desea Grabar Modificaciones Contratos", Question!, YesNo!)
	if ll_res=1 then
		if dw_lista.update()=1 then
			commit using sqlca;
			for ll_indi=1 to ll_tot_reg
				ls_base					= dw_lista.getitemstring(ll_indi,'base')
				ls_serie					= dw_lista.getitemstring(ll_indi,'serie')
				ll_numero				= dw_lista.getitemnumber(ll_indi,'numero')
				ldt_fec_crea				= dw_lista.getitemdatetime(ll_indi,'fecha_crea')
				ls_usuario				= dw_lista.getitemstring(ll_indi,'usuario_crea')
				ll_estado					= dw_lista.getitemnumber(ll_indi,'ult_estado')
				ls_glosa					= dw_lista.getitemstring(ll_indi,'ult_glosa_estado')
				ls_memo					= dw_lista.getitemstring(ll_indi,'ult_memo')
				ls_cod_age				= dw_lista.getitemstring(ll_indi,'cod_agente')
				ls_cod_sup				= dw_lista.getitemstring(ll_indi,'cod_supervisor')
				ls_cod_jef				= dw_lista.getitemstring(ll_indi,'cod_jefe_venta')
				ls_ref_memo			= dw_lista.getitemstring(ll_indi,'ult_referencia_memo')
				ls_usuario_entregar	= ''
				ll_cod_parque			= dw_lista.getitemnumber(ll_indi,'cod_parque')
				ll_mes					= dw_lista.getitemnumber(ll_indi,'mes_cierre')
				ll_ano						= dw_lista.getitemnumber(ll_indi,'ano_cierre')
				ls_estado_reg			= dw_lista.getitemstring(ll_indi,'estado_reg')
				INSERT INTO "CD_FOLIO_DETALLE"  
							( "BASE",		"SERIE",	"NUMERO",	"FECHA_CREA",	"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM",	"COD_PARQUE",	"MES_CIERRE",	"ANO_CIERRE" )  
				VALUES	( :ls_base,	:ls_serie,	:ll_numero,	:ldt_fec_crea,		:ls_usuario,   		:ll_estado, 	:ldt_fec_crea,		:ls_glosa,	:ls_memo,	:ls_cod_age,		:ls_cod_sup,			:ls_cod_jef,				:ls_ref_memo,				'NO EXISTE',						:ll_cod_parque,		:ll_mes,			:ll_ano	 ) 	
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit using sqlca;
					ll_graba++	
				else
					rollback using sqlca;
					messagebox("Error","Error al Grabar Contrato : "+ls_base+'-'+ls_serie+'-'+string(ll_numero)+sqlca.sqlerrtext)
				end if
			next
			if ll_tot_reg=ll_graba then
				ll_res2					= messagebox("Grabar","GRABACION EXITOSA, desea Limpiar Pantalla",Exclamation!, YesNo!, 2)
				if ll_res2=1 then cb_limpiar.triggerevent(clicked!)
			end if
		else
			rollback using sqlca;
			messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
else
	messagebox("Advertencia","No Registra Folio Nuevo para Grabar")
end if
SetPointer(Arrow!)
end event

type em_final from editmask within w_cd_anular_masivo
event ue_mousemove pbm_mousemove
integer x = 1883
integer y = 128
integer width = 434
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
boolean spin = true
end type

event modified;Long		ll_folio_ini,ll_folio_fin
String		ls_base,ls_serie

ll_folio_ini			= long(em_inicial.text)
ll_folio_fin			= long(em_final.text)
ls_base				= dw_base_serie.getitemstring(1,'base')
ls_serie				= dw_base_serie.getitemstring(1,'serie')
if not isnull(ls_base) and not isnull(ls_serie) and ll_folio_ini>0 and ll_folio_fin>0 then pb_aceptar.triggerevent(clicked!)
end event

type st_2 from statictext within w_cd_anular_masivo
event ue_mousemove pbm_mousemove
integer x = 1691
integer y = 148
integer width = 160
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_inicial from editmask within w_cd_anular_masivo
event ue_mousemove pbm_mousemove
integer x = 1189
integer y = 128
integer width = 434
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
boolean spin = true
end type

event modified;Long		ll_folio_ini,ll_folio_fin, ll_max_folio,ll_res,ll_nulo
String		ls_base,ls_serie

ll_folio_ini			= long(em_inicial.text)
ll_folio_fin			= long(em_final.text)
ls_base				= dw_base_serie.getitemstring(1,'base')
ls_serie				= dw_base_serie.getitemstring(1,'serie')
if not isnull(ls_base) and not isnull(ls_serie) and ll_folio_ini>0 and ll_folio_fin>0 then pb_aceptar.triggerevent(clicked!)
end event

type st_1 from statictext within w_cd_anular_masivo
event ue_mousemove pbm_mousemove
integer x = 997
integer y = 148
integer width = 183
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_cd_anular_masivo
integer x = 3077
integer y = 1436
integer width = 343
integer height = 108
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_anular_masivo)
end event

type dw_lista from datawindow within w_cd_anular_masivo
event ue_mousemove pbm_dwnmousemove
integer x = 41
integer y = 288
integer width = 3374
integer height = 1116
integer taborder = 50
string dataobject = "dw_anular_masivo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;String	ls_columna
ls_columna	= dwo.name
if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	//cb_cta_cte.triggerevent(clicked!)
end if
end event

type gb_2 from groupbox within w_cd_anular_masivo
event ue_mousemove pbm_mousemove
integer x = 46
integer y = 28
integer width = 2546
integer height = 240
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Folio a Generar"
end type

type gb_1 from groupbox within w_cd_anular_masivo
integer x = 1403
integer y = 1392
integer width = 1399
integer height = 172
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

