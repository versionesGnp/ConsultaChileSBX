forward
global type w_informe_detallado_gestion_reclamo from window
end type
type cb_limpiar from commandbutton within w_informe_detallado_gestion_reclamo
end type
type pb_tipo_filtrar from picturebutton within w_informe_detallado_gestion_reclamo
end type
type ddplb_estado from dropdownpicturelistbox within w_informe_detallado_gestion_reclamo
end type
type st_3 from statictext within w_informe_detallado_gestion_reclamo
end type
type ddplb_usuario from dropdownpicturelistbox within w_informe_detallado_gestion_reclamo
end type
type st_2 from statictext within w_informe_detallado_gestion_reclamo
end type
type ddplb_parque from dropdownpicturelistbox within w_informe_detallado_gestion_reclamo
end type
type st_1 from statictext within w_informe_detallado_gestion_reclamo
end type
type cb_ordenar from commandbutton within w_informe_detallado_gestion_reclamo
end type
type cb_filtrar from commandbutton within w_informe_detallado_gestion_reclamo
end type
type cb_exportar from commandbutton within w_informe_detallado_gestion_reclamo
end type
type p_inicio from picture within w_informe_detallado_gestion_reclamo
end type
type st_hasta from statictext within w_informe_detallado_gestion_reclamo
end type
type em_inicio from editmask within w_informe_detallado_gestion_reclamo
end type
type em_termino from editmask within w_informe_detallado_gestion_reclamo
end type
type st_desde from statictext within w_informe_detallado_gestion_reclamo
end type
type p_termino from picture within w_informe_detallado_gestion_reclamo
end type
type pb_ok from picturebutton within w_informe_detallado_gestion_reclamo
end type
type cb_imprimir from commandbutton within w_informe_detallado_gestion_reclamo
end type
type cb_cerrar from commandbutton within w_informe_detallado_gestion_reclamo
end type
type dw_lista from datawindow within w_informe_detallado_gestion_reclamo
end type
type gb_periodo from groupbox within w_informe_detallado_gestion_reclamo
end type
type gb_3 from groupbox within w_informe_detallado_gestion_reclamo
end type
type gb_1 from groupbox within w_informe_detallado_gestion_reclamo
end type
end forward

global type w_informe_detallado_gestion_reclamo from window
integer width = 4000
integer height = 1880
boolean titlebar = true
string title = "Informe Resumen Gestión Requerimiento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_limpiar cb_limpiar
pb_tipo_filtrar pb_tipo_filtrar
ddplb_estado ddplb_estado
st_3 st_3
ddplb_usuario ddplb_usuario
st_2 st_2
ddplb_parque ddplb_parque
st_1 st_1
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
p_inicio p_inicio
st_hasta st_hasta
em_inicio em_inicio
em_termino em_termino
st_desde st_desde
p_termino p_termino
pb_ok pb_ok
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_periodo gb_periodo
gb_3 gb_3
gb_1 gb_1
end type
global w_informe_detallado_gestion_reclamo w_informe_detallado_gestion_reclamo

on w_informe_detallado_gestion_reclamo.create
this.cb_limpiar=create cb_limpiar
this.pb_tipo_filtrar=create pb_tipo_filtrar
this.ddplb_estado=create ddplb_estado
this.st_3=create st_3
this.ddplb_usuario=create ddplb_usuario
this.st_2=create st_2
this.ddplb_parque=create ddplb_parque
this.st_1=create st_1
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.p_inicio=create p_inicio
this.st_hasta=create st_hasta
this.em_inicio=create em_inicio
this.em_termino=create em_termino
this.st_desde=create st_desde
this.p_termino=create p_termino
this.pb_ok=create pb_ok
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_periodo=create gb_periodo
this.gb_3=create gb_3
this.gb_1=create gb_1
this.Control[]={this.cb_limpiar,&
this.pb_tipo_filtrar,&
this.ddplb_estado,&
this.st_3,&
this.ddplb_usuario,&
this.st_2,&
this.ddplb_parque,&
this.st_1,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.p_inicio,&
this.st_hasta,&
this.em_inicio,&
this.em_termino,&
this.st_desde,&
this.p_termino,&
this.pb_ok,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_periodo,&
this.gb_3,&
this.gb_1}
end on

on w_informe_detallado_gestion_reclamo.destroy
destroy(this.cb_limpiar)
destroy(this.pb_tipo_filtrar)
destroy(this.ddplb_estado)
destroy(this.st_3)
destroy(this.ddplb_usuario)
destroy(this.st_2)
destroy(this.ddplb_parque)
destroy(this.st_1)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.p_inicio)
destroy(this.st_hasta)
destroy(this.em_inicio)
destroy(this.em_termino)
destroy(this.st_desde)
destroy(this.p_termino)
destroy(this.pb_ok)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_periodo)
destroy(this.gb_3)
destroy(this.gb_1)
end on

event open;Datetime		ldt_fec_ini,ldt_fec_fin,ldt_fecha_proc
Long			ll_mes,ll_ano,ll_tot_reg,ll_cod_parque,ll_cod_reclamo
String			ls_estado,ls_descrip,ls_string,ls_cod_usuario

gf_centrar(w_informe_detallado_gestion_reclamo)
dw_lista.settransobject(sqlca)
if isvalid(w_informe_estadistico_gestion_reclamo) then
	if w_informe_estadistico_gestion_reclamo.dw_lista.rowcount() > 0 then 
		ldt_fec_ini			= datetime(date(substr(1,1,Message.StringParm)))
		ldt_fec_fin			= datetime(date(substr(1,2,Message.StringParm)))
		em_inicio.text		= string(ldt_fec_ini,'dd/mm/yyyy')
		em_termino.text	= string(ldt_fec_fin,'dd/mm/yyyy')
		ldt_fecha_proc		= datetime(date(substr(1,3,Message.StringParm)))
		ls_estado			= substr(1,4,Message.StringParm)
		if ls_estado='F' then
			em_inicio.text		= string(ldt_fecha_proc,'dd/mm/yyyy')
			em_termino.text	= string(ldt_fecha_proc,'dd/mm/yyyy')
			w_informe_detallado_gestion_reclamo.title	= 'Resumen Gestión Requerimiento del día '+string(ldt_fecha_proc,'dd/mm/yyyy')
		elseif ls_estado='T' then
			em_inicio.text		= string(ldt_fec_ini,'dd/mm/yyyy')
			em_termino.text	= string(ldt_fec_fin,'dd/mm/yyyy')
			w_informe_detallado_gestion_reclamo.title	= 'Resumen Gestión Requerimiento del día '+string(em_inicio.text,'dd/mm/yyyy')+' al '+string(em_termino.text,'dd/mm/yyyy')
		end if
		ldt_fec_ini				= datetime(date(em_inicio.text),time('00:00:00'))
		ldt_fec_fin				= datetime(date(em_termino.text),time('23:59:59'))
		em_inicio.enabled		= false
		em_termino.enabled	= false
		p_inicio.enabled		= false
		p_termino.enabled		= false
		pb_ok.enabled			= false
		ll_tot_reg				= dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Dato")
		end if
	end if
else
	w_informe_detallado_gestion_reclamo.title	= 'Resumen Gestión Requerimiento'
	ll_mes					= month(date(gdt_fec_sistema))
	ll_ano						= year(date(gdt_fec_sistema))
	em_inicio.text			= string('01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))
	em_termino.text		= string(gdt_fec_sistema,"dd/mm/yyyy")
	em_inicio.enabled		= true
	em_termino.enabled	= true
	p_inicio.enabled		= true
	p_termino.enabled		= true
	pb_ok.enabled			= true
end if
ddplb_parque.reset()
ddplb_usuario.reset()
ddplb_estado.reset()
DECLARE x1 CURSOR FOR  
SELECT	"COD_PARQ"."CODIGO",   
			"COD_PARQ"."NOMBRE"  
FROM		"COD_PARQ"  
WHERE	"COD_PARQ"."GRUPO" = 1  
USING	sqlca;
open x1;
if sqlca.sqlcode=0 then
	do while sqlca.sqlcode=0
		fetch x1 into :ll_cod_parque, :ls_descrip;
		if not isnull(ll_cod_parque) and ll_cod_parque > 0 then
			ls_string		= string(ll_cod_parque)+' - '+ls_descrip
			ddplb_parque.additem(ls_string)
		end if
		setnull(ll_cod_parque)
	loop
end if
close x1;

DECLARE x2 CURSOR FOR  
SELECT	"ENCARGADOS"."CODIGO_USUARIO",   
			"ENCARGADOS"."NOMBRE"  
FROM 	"ENCARGADOS",   
			"RECLAMO_USUARIO_RESPONSABLE"  
WHERE ( "ENCARGADOS"."CODIGO_USUARIO" = "RECLAMO_USUARIO_RESPONSABLE"."USUARIO_ASIGNADO" ) and  
		  ( "RECLAMO_USUARIO_RESPONSABLE"."USUARIO_ASIGNA" = :gs_user ) AND
		  ( "ENCARGADOS"."ESTADO" = 'A' )   
ORDER BY "ENCARGADOS"."CODIGO_USUARIO" ASC 
USING	sqlca;
// ( "ENCARGADOS"."DEPTO" = :gs_depto ) AND  
open x2;
if sqlca.sqlcode=0 then
	do while sqlca.sqlcode=0
		fetch x2 into :ls_cod_usuario, :ls_descrip;
		if not isnull(ls_cod_usuario) then
			ls_string		= ls_cod_usuario+' - '+ls_descrip
			ddplb_usuario.additem(ls_string)
		end if
		setnull(ls_cod_usuario)
	loop
end if
close x2;

DECLARE x3 CURSOR FOR  
SELECT	"RECLAMO_ESTADO"."CODIGO_ESTADO",   
			"RECLAMO_ESTADO"."DESCRIPCION"  
FROM 	"RECLAMO_ESTADO"  
ORDER BY "RECLAMO_ESTADO"."CODIGO_ESTADO" ASC
USING	sqlca;
open x3;
if sqlca.sqlcode=0 then
	do while sqlca.sqlcode=0
		fetch x3 into :ll_cod_reclamo, :ls_descrip;
		if not isnull(ll_cod_reclamo) then
			ls_string		= string(ll_cod_reclamo)+' - '+ls_descrip
			ddplb_estado.additem(ls_string)
		end if
		setnull(ll_cod_reclamo)
	loop
end if
close x3;

end event

type cb_limpiar from commandbutton within w_informe_detallado_gestion_reclamo
integer x = 3698
integer y = 64
integer width = 224
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long		ll_cod_parque,ll_cod_reclamo,ll_mes,ll_ano
String		ls_string,ls_descrip,ls_cod_usuario

if isvalid(w_informe_estadistico_gestion_reclamo) then
	ddplb_parque.reset()
	ddplb_usuario.reset()
	ddplb_estado.reset()
	DECLARE x1 CURSOR FOR  
	SELECT	"COD_PARQ"."CODIGO",   
				"COD_PARQ"."NOMBRE"  
	FROM		"COD_PARQ"  
	WHERE	"COD_PARQ"."GRUPO" = 1  
	USING	sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			fetch x1 into :ll_cod_parque, :ls_descrip;
			if not isnull(ll_cod_parque) and ll_cod_parque > 0 then
				ls_string		= string(ll_cod_parque)+' - '+ls_descrip
				ddplb_parque.additem(ls_string)
			end if
			setnull(ll_cod_parque)
		loop
	end if
	close x1;
	DECLARE x2 CURSOR FOR  
	SELECT	"ENCARGADOS"."CODIGO_USUARIO",   
				"ENCARGADOS"."NOMBRE"  
	FROM 	"ENCARGADOS",   
				"RECLAMO_USUARIO_RESPONSABLE"  
	WHERE ( "ENCARGADOS"."CODIGO_USUARIO" = "RECLAMO_USUARIO_RESPONSABLE"."USUARIO_ASIGNADO" ) and  
			  ( "RECLAMO_USUARIO_RESPONSABLE"."USUARIO_ASIGNA" = :gs_user ) AND
			  ( "ENCARGADOS"."ESTADO" = 'A' )   
	ORDER BY "ENCARGADOS"."CODIGO_USUARIO" ASC 
	USING	sqlca;
	open x2;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			fetch x2 into :ls_cod_usuario, :ls_descrip;
			if not isnull(ls_cod_usuario) then
				ls_string		= ls_cod_usuario+' - '+ls_descrip
				ddplb_usuario.additem(ls_string)
			end if
			setnull(ls_cod_usuario)
		loop
	end if
	close x2;
	
	DECLARE x3 CURSOR FOR  
	SELECT	"RECLAMO_ESTADO"."CODIGO_ESTADO",   
				"RECLAMO_ESTADO"."DESCRIPCION"  
	FROM 	"RECLAMO_ESTADO"  
	ORDER BY "RECLAMO_ESTADO"."CODIGO_ESTADO" ASC
	USING	sqlca;
	open x3;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			fetch x3 into :ll_cod_reclamo, :ls_descrip;
			if not isnull(ll_cod_reclamo) then
				ls_string		= string(ll_cod_reclamo)+' - '+ls_descrip
				ddplb_estado.additem(ls_string)
			end if
			setnull(ll_cod_reclamo)
		loop
	end if
	close x3;
	dw_lista.setfilter('')
	dw_lista.filter()
else
	ll_mes					= month(date(gdt_fec_sistema))
	ll_ano						= year(date(gdt_fec_sistema))
	em_inicio.text			= string('01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))
	em_termino.text		= string(gdt_fec_sistema,"dd/mm/yyyy")
	ddplb_parque.reset()
	ddplb_usuario.reset()
	ddplb_estado.reset()
	DECLARE x4	CURSOR FOR  
	SELECT	"COD_PARQ"."CODIGO",   
				"COD_PARQ"."NOMBRE"  
	FROM		"COD_PARQ"  
	WHERE	"COD_PARQ"."GRUPO" = 1  
	USING	sqlca;
	open x4;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			fetch x4 into :ll_cod_parque, :ls_descrip;
			if not isnull(ll_cod_parque) and ll_cod_parque > 0 then
				ls_string		= string(ll_cod_parque)+' - '+ls_descrip
				ddplb_parque.additem(ls_string)
			end if
			setnull(ll_cod_parque)
		loop
	end if
	close x4;
	
	DECLARE x5 CURSOR FOR  
	SELECT	"ENCARGADOS"."CODIGO_USUARIO",   
				"ENCARGADOS"."NOMBRE"  
	FROM 	"ENCARGADOS",   
				"RECLAMO_USUARIO_RESPONSABLE"  
	WHERE ( "ENCARGADOS"."CODIGO_USUARIO" = "RECLAMO_USUARIO_RESPONSABLE"."USUARIO_ASIGNADO" ) and  
			  ( "RECLAMO_USUARIO_RESPONSABLE"."USUARIO_ASIGNA" = :gs_user ) AND
			  ( "ENCARGADOS"."ESTADO" = 'A' )   
	ORDER BY "ENCARGADOS"."CODIGO_USUARIO" ASC 
	USING	sqlca;
	open x5;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			fetch x5 into :ls_cod_usuario, :ls_descrip;
			if not isnull(ls_cod_usuario) then
				ls_string		= ls_cod_usuario+' - '+ls_descrip
				ddplb_usuario.additem(ls_string)
			end if
			setnull(ls_cod_usuario)
		loop
	end if
	close x5;
	
	DECLARE x6 CURSOR FOR  
	SELECT	"RECLAMO_ESTADO"."CODIGO_ESTADO",   
				"RECLAMO_ESTADO"."DESCRIPCION"  
	FROM 	"RECLAMO_ESTADO"  
	ORDER BY "RECLAMO_ESTADO"."CODIGO_ESTADO" ASC
	USING	sqlca;
	open x6;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			fetch x6 into :ll_cod_reclamo, :ls_descrip;
			if not isnull(ll_cod_reclamo) then
				ls_string		= string(ll_cod_reclamo)+' - '+ls_descrip
				ddplb_estado.additem(ls_string)
			end if
			setnull(ll_cod_reclamo)
		loop
	end if
	close x6;
	dw_lista.setfilter('')
	dw_lista.filter()
end if
pb_ok.triggerevent(clicked!)
end event

type pb_tipo_filtrar from picturebutton within w_informe_detallado_gestion_reclamo
integer x = 3351
integer y = 1632
integer width = 123
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "estado_cheques.bmp"
alignment htextalign = right!
end type

event clicked;String		ls_usuario,ls_string,ls_pasa='S'
Long		ll_cod_parque,ll_codigo_estado,ll_pos

ll_pos					= pos(ddplb_parque.text,'-')
ll_cod_parque		= long(mid(ddplb_parque.text,1,(ll_pos - 1)) )

ll_pos					= pos(ddplb_usuario.text,'-')
ls_usuario			= mid(ddplb_usuario.text,1,(ll_pos - 1))

ll_pos					= pos(ddplb_estado.text,'-')
ll_codigo_estado	= long(mid(ddplb_estado.text,1,(ll_pos - 1)) )
if ddplb_estado.text='' or isnull(ddplb_estado.text) then
	Setnull(ll_codigo_estado)
end if
if ll_cod_parque=0 then setnull(ll_cod_parque)
if ls_usuario='' then setnull(ls_usuario)
//if ll_codigo_estado=0 then setnull(ll_codigo_estado)

if ll_cod_parque > 0 and not isnull(ls_usuario) and not isnull(ll_codigo_estado) then
	ls_string			= "cod_parque = "+string(ll_cod_parque)+" and usuario_asignado ='"+ls_usuario+"' and ult_estado_gestion = "+string(ll_codigo_estado)
elseif ll_cod_parque > 0 and isnull(ls_usuario) and isnull(ll_codigo_estado) then
	ls_string			= "cod_parque = "+string(ll_cod_parque)
elseif ll_cod_parque > 0 and isnull(ls_usuario) and not isnull(ll_codigo_estado) then
	ls_string			= "cod_parque = "+string(ll_cod_parque)+" and ult_estado_gestion = "+string(ll_codigo_estado)
elseif ll_cod_parque > 0 and not isnull(ls_usuario) and isnull(ll_codigo_estado) then
	ls_string			= "cod_parque = "+string(ll_cod_parque)+" and usuario_asignado ='"+ls_usuario
elseif isnull(ll_cod_parque) and not isnull(ls_usuario) and isnull(ll_codigo_estado) then
	ls_string			= "usuario_asignado ='"+ls_usuario
elseif isnull(ll_cod_parque) and not isnull(ls_usuario) and not isnull(ll_codigo_estado) then
	ls_string			="usuario_asignado ='"+ls_usuario+"' and ult_estado_gestion = "+string(ll_codigo_estado)
elseif isnull(ll_cod_parque) and isnull(ls_usuario) and not isnull(ll_codigo_estado) then
	ls_string			= "ult_estado_gestion = "+string(ll_codigo_estado)
else
	ls_pasa		= 'N'
end if
if ls_pasa='S' then
	dw_lista.setfilter(ls_string)
	dw_lista.filter()
end if


end event

type ddplb_estado from dropdownpicturelistbox within w_informe_detallado_gestion_reclamo
integer x = 2496
integer y = 1636
integer width = 827
integer height = 348
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

type st_3 from statictext within w_informe_detallado_gestion_reclamo
integer x = 2309
integer y = 1652
integer width = 174
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddplb_usuario from dropdownpicturelistbox within w_informe_detallado_gestion_reclamo
integer x = 1458
integer y = 1636
integer width = 791
integer height = 348
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

type st_2 from statictext within w_informe_detallado_gestion_reclamo
integer x = 1230
integer y = 1652
integer width = 201
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuario"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddplb_parque from dropdownpicturelistbox within w_informe_detallado_gestion_reclamo
integer x = 571
integer y = 1636
integer width = 594
integer height = 348
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

type st_1 from statictext within w_informe_detallado_gestion_reclamo
integer x = 361
integer y = 1652
integer width = 187
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_ordenar from commandbutton within w_informe_detallado_gestion_reclamo
integer x = 3392
integer y = 64
integer width = 224
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string ls_nulo
long	ll_tot_reg
setnull (ls_nulo)

ll_tot_reg					= dw_lista.rowcount()
if ll_tot_reg > 0 then 
	dw_lista.setsort(ls_nulo)
	dw_lista.sort()
end if

end event

type cb_filtrar from commandbutton within w_informe_detallado_gestion_reclamo
integer x = 3168
integer y = 64
integer width = 224
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

event clicked;string ls_nulo
long	ll_tot_reg

setnull (ls_nulo)
ll_tot_reg					= dw_lista.rowcount()
if ll_tot_reg > 0 then
	dw_lista.setfilter(ls_nulo)
	dw_lista.filter()
end if

end event

type cb_exportar from commandbutton within w_informe_detallado_gestion_reclamo
integer x = 2944
integer y = 64
integer width = 224
integer height = 84
integer taborder = 60
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

type p_inicio from picture within w_informe_detallado_gestion_reclamo
integer x = 599
integer y = 68
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha

dw_lista.reset()
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text					= string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if em_inicio.text<>'00/00/0000' then
	ls_fecha 							= em_inicio.text
else
	ls_fecha 							= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
if Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
end if

end event

type st_hasta from statictext within w_informe_detallado_gestion_reclamo
integer x = 699
integer y = 80
integer width = 146
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_inicio from editmask within w_informe_detallado_gestion_reclamo
integer x = 251
integer y = 72
integer width = 343
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;dw_lista.reset()
end event

type em_termino from editmask within w_informe_detallado_gestion_reclamo
integer x = 869
integer y = 72
integer width = 357
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;dw_lista.reset()
end event

type st_desde from statictext within w_informe_detallado_gestion_reclamo
integer x = 59
integer y = 84
integer width = 169
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_termino from picture within w_informe_detallado_gestion_reclamo
integer x = 1230
integer y = 68
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha

dw_lista.reset()
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text					= string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if em_inicio.text<>'00/00/0000' then
	ls_fecha 							= em_inicio.text
else
	ls_fecha 							= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
if Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
end if
end event

type pb_ok from picturebutton within w_informe_detallado_gestion_reclamo
integer x = 1426
integer y = 24
integer width = 178
integer height = 156
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok.bmp"
alignment htextalign = right!
end type

event clicked;Datetime		ldt_fec_ini,ldt_fec_fin
Long			ll_tot_reg

ldt_fec_ini			= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fec_fin			= datetime(date(em_termino.text),time('23:59:59'))
if ldt_fec_ini>ldt_fec_fin then
	messagebox("Advertencia","Fecha Inicio No Puede ser Mayor a Fecha Término")
else
	dw_lista.setfilter('')
	dw_lista.filter()
	ll_tot_reg		= dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
end if
dw_lista.accepttext()
end event

type cb_imprimir from commandbutton within w_informe_detallado_gestion_reclamo
integer x = 50
integer y = 1632
integer width = 274
integer height = 100
integer taborder = 50
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

type cb_cerrar from commandbutton within w_informe_detallado_gestion_reclamo
integer x = 3607
integer y = 1632
integer width = 343
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_detallado_gestion_reclamo)
end event

type dw_lista from datawindow within w_informe_detallado_gestion_reclamo
integer x = 50
integer y = 224
integer width = 3899
integer height = 1344
integer taborder = 40
string title = "none"
string dataobject = "dw_listado_detalle_gestion_reclamos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String		ls_columna

ls_columna		= dwo.name
if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
else
	if ls_columna='t_todo' then
		dw_lista.setfilter('')
		dw_lista.filter()
	end if
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

type gb_periodo from groupbox within w_informe_detallado_gestion_reclamo
integer x = 41
integer y = 12
integer width = 1307
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Ingrese Rango Fecha"
end type

type gb_3 from groupbox within w_informe_detallado_gestion_reclamo
integer x = 2921
integer y = 16
integer width = 1024
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_informe_detallado_gestion_reclamo
integer x = 347
integer y = 1576
integer width = 3154
integer height = 184
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Filtro"
end type

