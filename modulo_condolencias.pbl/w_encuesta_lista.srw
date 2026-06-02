forward
global type w_encuesta_lista from window
end type
type cb_filtrar_funeraria from commandbutton within w_encuesta_lista
end type
type cb_informe from commandbutton within w_encuesta_lista
end type
type cb_exp_encuesta from commandbutton within w_encuesta_lista
end type
type dw_exporta from datawindow within w_encuesta_lista
end type
type cb_filtrar from commandbutton within w_encuesta_lista
end type
type rb_todos from radiobutton within w_encuesta_lista
end type
type rb_maestro from radiobutton within w_encuesta_lista
end type
type dw_maestro from datawindow within w_encuesta_lista
end type
type st_2 from statictext within w_encuesta_lista
end type
type dw_tipo from datawindow within w_encuesta_lista
end type
type st_1 from statictext within w_encuesta_lista
end type
type em_ctto from editmask within w_encuesta_lista
end type
type pb_buscar from picturebutton within w_encuesta_lista
end type
type cb_encuesta from commandbutton within w_encuesta_lista
end type
type cb_imprimir from commandbutton within w_encuesta_lista
end type
type cb_ordenar from commandbutton within w_encuesta_lista
end type
type cb_exportar from commandbutton within w_encuesta_lista
end type
type pb_aceptar from picturebutton within w_encuesta_lista
end type
type p_termino from picture within w_encuesta_lista
end type
type p_inicio from picture within w_encuesta_lista
end type
type st_desde from statictext within w_encuesta_lista
end type
type em_termino from editmask within w_encuesta_lista
end type
type em_inicio from editmask within w_encuesta_lista
end type
type st_hasta from statictext within w_encuesta_lista
end type
type dw_lista from datawindow within w_encuesta_lista
end type
type cb_cerrar from commandbutton within w_encuesta_lista
end type
type gb_periodo from groupbox within w_encuesta_lista
end type
type gb_1 from groupbox within w_encuesta_lista
end type
type gb_2 from groupbox within w_encuesta_lista
end type
end forward

global type w_encuesta_lista from window
integer width = 3785
integer height = 2400
boolean titlebar = true
string title = "Lista Encuesta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar_funeraria cb_filtrar_funeraria
cb_informe cb_informe
cb_exp_encuesta cb_exp_encuesta
dw_exporta dw_exporta
cb_filtrar cb_filtrar
rb_todos rb_todos
rb_maestro rb_maestro
dw_maestro dw_maestro
st_2 st_2
dw_tipo dw_tipo
st_1 st_1
em_ctto em_ctto
pb_buscar pb_buscar
cb_encuesta cb_encuesta
cb_imprimir cb_imprimir
cb_ordenar cb_ordenar
cb_exportar cb_exportar
pb_aceptar pb_aceptar
p_termino p_termino
p_inicio p_inicio
st_desde st_desde
em_termino em_termino
em_inicio em_inicio
st_hasta st_hasta
dw_lista dw_lista
cb_cerrar cb_cerrar
gb_periodo gb_periodo
gb_1 gb_1
gb_2 gb_2
end type
global w_encuesta_lista w_encuesta_lista

type variables
Long	il_mes,il_ano,il_row
end variables

on w_encuesta_lista.create
this.cb_filtrar_funeraria=create cb_filtrar_funeraria
this.cb_informe=create cb_informe
this.cb_exp_encuesta=create cb_exp_encuesta
this.dw_exporta=create dw_exporta
this.cb_filtrar=create cb_filtrar
this.rb_todos=create rb_todos
this.rb_maestro=create rb_maestro
this.dw_maestro=create dw_maestro
this.st_2=create st_2
this.dw_tipo=create dw_tipo
this.st_1=create st_1
this.em_ctto=create em_ctto
this.pb_buscar=create pb_buscar
this.cb_encuesta=create cb_encuesta
this.cb_imprimir=create cb_imprimir
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.pb_aceptar=create pb_aceptar
this.p_termino=create p_termino
this.p_inicio=create p_inicio
this.st_desde=create st_desde
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.st_hasta=create st_hasta
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.gb_periodo=create gb_periodo
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_filtrar_funeraria,&
this.cb_informe,&
this.cb_exp_encuesta,&
this.dw_exporta,&
this.cb_filtrar,&
this.rb_todos,&
this.rb_maestro,&
this.dw_maestro,&
this.st_2,&
this.dw_tipo,&
this.st_1,&
this.em_ctto,&
this.pb_buscar,&
this.cb_encuesta,&
this.cb_imprimir,&
this.cb_ordenar,&
this.cb_exportar,&
this.pb_aceptar,&
this.p_termino,&
this.p_inicio,&
this.st_desde,&
this.em_termino,&
this.em_inicio,&
this.st_hasta,&
this.dw_lista,&
this.cb_cerrar,&
this.gb_periodo,&
this.gb_1,&
this.gb_2}
end on

on w_encuesta_lista.destroy
destroy(this.cb_filtrar_funeraria)
destroy(this.cb_informe)
destroy(this.cb_exp_encuesta)
destroy(this.dw_exporta)
destroy(this.cb_filtrar)
destroy(this.rb_todos)
destroy(this.rb_maestro)
destroy(this.dw_maestro)
destroy(this.st_2)
destroy(this.dw_tipo)
destroy(this.st_1)
destroy(this.em_ctto)
destroy(this.pb_buscar)
destroy(this.cb_encuesta)
destroy(this.cb_imprimir)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.pb_aceptar)
destroy(this.p_termino)
destroy(this.p_inicio)
destroy(this.st_desde)
destroy(this.em_termino)
destroy(this.em_inicio)
destroy(this.st_hasta)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.gb_periodo)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;datetime	ldt_fec_ini,ldt_fec_fin
long	ll_cta

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_encuesta_lista)
dw_tipo.settransobject(sqlca)
dw_tipo.insertrow(0)
dw_lista.settransobject(sqlca)
dw_maestro.settransobject(sqlca)
dw_maestro.insertrow(0)
em_termino.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
ldt_fec_fin						= datetime(date(em_termino.text),time('00:00:00'))
em_inicio.text					= string('01/'+ string(month(date(gdt_fec_sistema)),'00')+ '/' +string(year(date(gdt_fec_sistema)),'0000'))
ldt_fec_ini						= datetime(date(em_inicio.text),time('00:00:00'))

SELECT	count("AGENTES"."COD_AGE")
INTO		:ll_cta
FROM		"ENCARGADOS","AGENTES"  
WHERE	"ENCARGADOS"."CODIGO_USUARIO" = "AGENTES"."COD_AGE" and  
     		"ENCARGADOS"."DEPTO" = 'X' AND  
      		"ENCARGADOS"."ESTADO" = 'A' AND  
         	"AGENTES"."DEPTO" = 'P' AND  
         	"AGENTES"."CANAL" = 'EM' AND
			"CODIGO_USUARIO" = :gs_user
USING	sqlca;
if isnull(ll_cta) then ll_cta=0
if ll_cta>0 then
	rb_maestro.visible				= false
	rb_todos.visible					= false
	gb_2.visible						= false
	dw_maestro.visible			= false	
	cb_exp_encuesta.enabled	= false
	cb_informe.enabled			= false	
end if


	





end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_filtrar_funeraria from commandbutton within w_encuesta_lista
integer x = 1829
integer y = 2160
integer width = 325
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar Fune."
end type

event clicked;string nulo,ls_filtro,ls_filtro_2,ls_busqueda
setnull (nulo)
ls_filtro_2					= "'"
ls_busqueda						= 'F'
//ls_filtro						= "contrato = '"+ls_base+ls_filtro_2  
ls_filtro						= "codigo = '" +ls_busqueda+ls_filtro_2
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
end event

type cb_informe from commandbutton within w_encuesta_lista
integer x = 786
integer y = 2156
integer width = 279
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Informes"
end type

event clicked;string		ls_string
datetime	ldt_fec_ini,ldt_fec_fin

ldt_fec_ini					= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fec_fin					= datetime(date(em_termino.text),time('00:00:00'))
ls_string						= string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')
if isvalid(w_encuesta_informe) then close(w_encuesta_informe)
OpenWithParm (w_encuesta_informe,ls_string)
end event

type cb_exp_encuesta from commandbutton within w_encuesta_lista
integer x = 416
integer y = 2156
integer width = 370
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exp.E&ncuesta"
end type

event clicked;long		ll_tot_reg
datetime	ldt_fec_ini,ldt_fec_fin

ldt_fec_ini									= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fec_fin									= datetime(date(em_termino.text),time('00:00:00'))

if not isnull(ldt_fec_ini) and not isnull(ldt_fec_fin) then
	if ldt_fec_ini>ldt_fec_fin then
		messagebox("Advertencia","Rango Fecha Invalido")
	else
		dw_exporta.dataobject		='dw_encuesta_lista_exporta'
		dw_exporta.settransobject(sqlca)
		ll_tot_reg					= dw_exporta.retrieve(ldt_fec_ini,ldt_fec_fin)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos Rango Fecha Seleccionado")
		else
			datawindow dw_paso
			dw_paso	= dw_exporta
			if dw_exporta.rowcount() > 0 then f_DWToExcel( dw_paso )
		end if
	end if
end if




end event

type dw_exporta from datawindow within w_encuesta_lista
integer x = 3785
integer y = 800
integer width = 686
integer height = 400
integer taborder = 70
string title = "none"
string dataobject = "dw_encuesta_lista_exporta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_filtrar from commandbutton within w_encuesta_lista
integer x = 1335
integer y = 2160
integer width = 233
integer height = 84
integer taborder = 70
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

type rb_todos from radiobutton within w_encuesta_lista
integer x = 3365
integer y = 4
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;string	ls_filtro

dw_maestro.reset()
dw_maestro.insertrow(0)
dw_maestro.enabled 				= false
ls_filtro 								= ''
dw_lista.SetFilter(ls_filtro)
dw_lista.Filter( )

end event

type rb_maestro from radiobutton within w_encuesta_lista
integer x = 2546
integer y = 4
integer width = 613
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Maestros Ceremonia"
end type

event clicked;long	ll_tot_reg

ll_tot_reg							= dw_lista.rowcount()
if ll_tot_reg>0 then
	dw_maestro.enabled 			= true
else
	messagebox("Advertencia","Debe Generar La Lista a Consultar")
	rb_todos.checked				= true
end if
	

end event

type dw_maestro from datawindow within w_encuesta_lista
integer x = 2510
integer y = 88
integer width = 1189
integer height = 88
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "dwe_maestro_ceremonia"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_maestro,ls_filtro

dw_maestro.accepttext()
ls_maestro				= dw_maestro.getitemstring(1,'cod_maestro')
if not isnull(ls_maestro) and ls_maestro<>'' then
	ls_filtro 				= "usuario_creador = '"+ls_maestro+"'"
	dw_lista.SetFilter(ls_filtro)
	dw_lista.Filter( )
else
	messagebox("Advertencia","Debe Seleccionar Maestro Ceremonia")	
end if

end event

type st_2 from statictext within w_encuesta_lista
integer x = 1335
integer y = 92
integer width = 338
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Tipo Cliente:"
boolean focusrectangle = false
end type

type dw_tipo from datawindow within w_encuesta_lista
integer x = 1664
integer y = 84
integer width = 517
integer height = 88
integer taborder = 30
string title = "none"
string dataobject = "dwe_tipo_cliente"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type st_1 from statictext within w_encuesta_lista
integer x = 2464
integer y = 2172
integer width = 411
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Nº Ctto:"
boolean focusrectangle = false
end type

type em_ctto from editmask within w_encuesta_lista
integer x = 2880
integer y = 2156
integer width = 407
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if double(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_encuesta_lista
integer x = 3287
integer y = 2156
integer width = 110
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string		ls_string
double	ldb_numero

ldb_numero				= double(em_ctto.text)
ll_tot_reg				= dw_lista.rowcount()
if ldb_numero>0 and ll_tot_reg>0 then
	ls_string				= "numero = "+string(ldb_numero)
	ll_fila 					= dw_lista.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.SelectRow(ll_fila, true)
	else
		messagebox("Advertencia","Nº Contrato No Existe en Lista")
		dw_lista.scrolltorow(1)
	end if
end if

end event

type cb_encuesta from commandbutton within w_encuesta_lista
integer x = 37
integer y = 2156
integer width = 352
integer height = 96
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Encuesta"
end type

event clicked;string		ls_base,ls_serie,ls_string,ls_usuario_gestion,ls_est_gestion,ls_time
long		ll_folio,ll_grupo,ll_correl,ll_rut_fall,ll_hora,ll_minutos
double	ldb_numero
datetime	ldt_fec_sep

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ls_base					= dw_lista.getitemstring(il_row,'codigo')
	ls_serie					= dw_lista.getitemstring(il_row,'serie')
	ldb_numero				= dw_lista.getitemnumber(il_row,'numero')
	ldt_fec_sep				= dw_lista.getitemdatetime(il_row,'fec_sep')
	ll_folio					= dw_lista.getitemnumber(il_row,'folio_encuesta')
	ll_grupo					= dw_lista.getitemnumber(il_row,'grupo')
	ll_correl					= dw_lista.getitemnumber(il_row,'correlativo')
	ll_rut_fall					= dw_lista.getitemnumber(il_row,'rut_fall')
	
	SELECT 	"ENCUESTA_CONTROL_GESTION"."ESTADO_GESTION",  "ENCUESTA_CONTROL_GESTION"."USUARIO_GESTOR"
	INTO 		:ls_est_gestion, :ls_usuario_gestion
	FROM 	"ENCUESTA_CONTROL_GESTION"  
	WHERE	"ENCUESTA_CONTROL_GESTION"."RUT_FALLECIDO" = :ll_rut_fall
	USING	sqlca;	
	if ls_base = 'F' then
		ll_hora							= long(string(ldt_fec_sep,'hh'))
		ll_minutos						= long(string(ldt_fec_sep,'mm'))
		ls_time							= string(string(ll_hora)+':'+string(ll_minutos)+':00')
	end if	
//	if ls_est_gestion = 'G' and ls_usuario_gestion <> gs_user and gs_user <> 'MHERRERA' and gs_user <> 'ALICIA' then
//		Messagebox('Advertencia','Registro Gestionado por Otro Usuario')
//	elseif
	if ls_est_gestion = 'C' and ls_usuario_gestion <> gs_user then
		Messagebox('Advertencia','Registro Esta siendo Gestionado')
	else
		if isnull(ll_folio) then ll_folio=0
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
			if ls_base = 'F' then
				ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(ldt_fec_sep,'dd/mm/yyyy')+'~t'+string(ll_grupo)+'~t'+string(ll_correl)+'~t'+string(ll_folio)+'~t'+string(ll_rut_fall)+'~t'+string(ls_time)				
				OpenWithParm(w_encuenta_atc,ls_string)
			else
				ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(ldt_fec_sep,'dd/mm/yyyy')+'~t'+string(ll_grupo)+'~t'+string(ll_correl)+'~t'+string(ll_folio)+'~t'+string(ll_rut_fall)
				OpenWithParm(w_encuenta_atc,ls_string)
			end if	
		end if
	end if	
end if
end event

type cb_imprimir from commandbutton within w_encuesta_lista
event ue_mousemove pbm_mousemove
integer x = 2190
integer y = 2160
integer width = 247
integer height = 84
integer taborder = 130
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
end if
end event

type cb_ordenar from commandbutton within w_encuesta_lista
integer x = 1582
integer y = 2160
integer width = 233
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_encuesta_lista
integer x = 1097
integer y = 2160
integer width = 233
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type pb_aceptar from picturebutton within w_encuesta_lista
integer x = 2208
integer y = 52
integer width = 142
integer height = 120
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_tipo_cliente,ls_canal
long		ll_tot_reg
datetime	ldt_fec_ini,ldt_fec_fin

dw_lista.settransobject(sqlca)
em_ctto.text									= ''
ldt_fec_ini									= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fec_fin									= datetime(date(em_termino.text),time('00:00:00'))
ls_tipo_cliente								= dw_tipo.getitemstring(1,'tipo_cliente')
if isnull(ls_tipo_cliente) or ls_tipo_cliente='' then
	messagebox("Advertencia","Debe Ingresar Tipo Cliente")
	dw_tipo.setfocus()
	dw_tipo.setcolumn('tipo_cliente')
else
	if not isnull(ldt_fec_ini) and not isnull(ldt_fec_fin) then
		if ldt_fec_ini>ldt_fec_fin then
			messagebox("Advertencia","Rango Fecha Invalido")
		else
			if gs_depto='X' then
				SELECT	"AGENTES"."CANAL"
				INTO		:ls_canal
				FROM 	"AGENTES"  
				WHERE 	"AGENTES"."COD_AGE" = :gs_user
				USING	sqlca;
				if isnull(ls_canal) then ls_canal=''
				if ls_canal='EM' then
					dw_lista.dataobject		='dw_encuesta_lista_user'
					dw_lista.settransobject(sqlca)
					ll_tot_reg					= dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin,ls_tipo_cliente,gs_user)
				else
					messagebox("Advertencia",'Usuario No Pertenece a Canal "Maestros de Ceremonias"')
				end if
			else
				dw_lista.dataobject		='dw_encuesta_lista'
				dw_lista.settransobject(sqlca)
				ll_tot_reg					= dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin,ls_tipo_cliente)
			end if
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Datos")
			end if
		end if
	end if
end if
end event

type p_termino from picture within w_encuesta_lista
integer x = 1193
integer y = 72
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha

if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF
dw_lista.reset()
end event

type p_inicio from picture within w_encuesta_lista
integer x = 585
integer y = 72
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;STRING ls_fecha
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	

if em_inicio.text<>'00/00/0000' then
	ls_fecha = em_inicio.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
END IF
dw_lista.reset()
end event

type st_desde from statictext within w_encuesta_lista
integer x = 50
integer y = 84
integer width = 187
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type em_termino from editmask within w_encuesta_lista
integer x = 841
integer y = 76
integer width = 347
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type em_inicio from editmask within w_encuesta_lista
integer x = 238
integer y = 76
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_hasta from statictext within w_encuesta_lista
integer x = 677
integer y = 84
integer width = 165
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_encuesta_lista
integer x = 37
integer y = 196
integer width = 3689
integer height = 1916
integer taborder = 60
string title = "none"
string dataobject = "dw_encuesta_lista"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_filtro

dw_lista.accepttext()
ls_columna 							= dwo.name

if ls_columna='t_sin_encue' or ls_columna='c_sin_encue' then
	ls_filtro 						= "isnull(evalua)"
	dw_lista.SetFilter(ls_filtro)
	dw_lista.Filter()
elseif ls_columna='t_con_encue' or ls_columna='c_con_encue' then
	ls_filtro 						= "evalua > 0"
	dw_lista.SetFilter(ls_filtro)
	dw_lista.Filter()
elseif ls_columna='t_todos' then	
	ls_filtro 						= ""
	dw_lista.SetFilter(ls_filtro)
	dw_lista.Filter()
end if


end event

event rowfocuschanged;il_row									= getrow()
if il_row>0 then
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;cb_encuesta.triggerevent(clicked!)
end event

type cb_cerrar from commandbutton within w_encuesta_lista
integer x = 3429
integer y = 2156
integer width = 306
integer height = 96
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_encuesta_lista)
end event

type gb_periodo from groupbox within w_encuesta_lista
integer x = 37
integer y = 16
integer width = 1266
integer height = 164
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 80269524
string text = "Período"
end type

type gb_1 from groupbox within w_encuesta_lista
integer x = 1083
integer y = 2112
integer width = 1371
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_encuesta_lista
integer x = 2496
integer y = 8
integer width = 1230
integer height = 184
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

