forward
global type w_comision_resumen_ventas from window
end type
type dw_parque from datawindow within w_comision_resumen_ventas
end type
type rb_2 from radiobutton within w_comision_resumen_ventas
end type
type rb_1 from radiobutton within w_comision_resumen_ventas
end type
type pb_aceptar from picturebutton within w_comision_resumen_ventas
end type
type em_termino from editmask within w_comision_resumen_ventas
end type
type rb_inactivo from radiobutton within w_comision_resumen_ventas
end type
type rb_activo from radiobutton within w_comision_resumen_ventas
end type
type cb_cerrar from commandbutton within w_comision_resumen_ventas
end type
type dw_resumen from datawindow within w_comision_resumen_ventas
end type
type gb_estado from groupbox within w_comision_resumen_ventas
end type
type gb_1 from groupbox within w_comision_resumen_ventas
end type
type cb_imprimir from commandbutton within w_comision_resumen_ventas
end type
type cb_ordenar from commandbutton within w_comision_resumen_ventas
end type
type cb_filtrar from commandbutton within w_comision_resumen_ventas
end type
type cb_exportar from commandbutton within w_comision_resumen_ventas
end type
type gb_2 from groupbox within w_comision_resumen_ventas
end type
type rb_promesa from radiobutton within w_comision_resumen_ventas
end type
type rb_aumento from radiobutton within w_comision_resumen_ventas
end type
type rb_liberador from radiobutton within w_comision_resumen_ventas
end type
type rb_persis_pro from radiobutton within w_comision_resumen_ventas
end type
type rb_persis_aum from radiobutton within w_comision_resumen_ventas
end type
type rb_persis_lib from radiobutton within w_comision_resumen_ventas
end type
type gb_contrato from groupbox within w_comision_resumen_ventas
end type
end forward

global type w_comision_resumen_ventas from window
integer width = 3808
integer height = 1972
boolean titlebar = true
string title = "Resumen Comisiones por Ventas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
dw_parque dw_parque
rb_2 rb_2
rb_1 rb_1
pb_aceptar pb_aceptar
em_termino em_termino
rb_inactivo rb_inactivo
rb_activo rb_activo
cb_cerrar cb_cerrar
dw_resumen dw_resumen
gb_estado gb_estado
gb_1 gb_1
cb_imprimir cb_imprimir
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
gb_2 gb_2
rb_promesa rb_promesa
rb_aumento rb_aumento
rb_liberador rb_liberador
rb_persis_pro rb_persis_pro
rb_persis_aum rb_persis_aum
rb_persis_lib rb_persis_lib
gb_contrato gb_contrato
end type
global w_comision_resumen_ventas w_comision_resumen_ventas

type variables

end variables

on w_comision_resumen_ventas.create
this.dw_parque=create dw_parque
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_aceptar=create pb_aceptar
this.em_termino=create em_termino
this.rb_inactivo=create rb_inactivo
this.rb_activo=create rb_activo
this.cb_cerrar=create cb_cerrar
this.dw_resumen=create dw_resumen
this.gb_estado=create gb_estado
this.gb_1=create gb_1
this.cb_imprimir=create cb_imprimir
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.gb_2=create gb_2
this.rb_promesa=create rb_promesa
this.rb_aumento=create rb_aumento
this.rb_liberador=create rb_liberador
this.rb_persis_pro=create rb_persis_pro
this.rb_persis_aum=create rb_persis_aum
this.rb_persis_lib=create rb_persis_lib
this.gb_contrato=create gb_contrato
this.Control[]={this.dw_parque,&
this.rb_2,&
this.rb_1,&
this.pb_aceptar,&
this.em_termino,&
this.rb_inactivo,&
this.rb_activo,&
this.cb_cerrar,&
this.dw_resumen,&
this.gb_estado,&
this.gb_1,&
this.cb_imprimir,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.gb_2,&
this.rb_promesa,&
this.rb_aumento,&
this.rb_liberador,&
this.rb_persis_pro,&
this.rb_persis_aum,&
this.rb_persis_lib,&
this.gb_contrato}
end on

on w_comision_resumen_ventas.destroy
destroy(this.dw_parque)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_aceptar)
destroy(this.em_termino)
destroy(this.rb_inactivo)
destroy(this.rb_activo)
destroy(this.cb_cerrar)
destroy(this.dw_resumen)
destroy(this.gb_estado)
destroy(this.gb_1)
destroy(this.cb_imprimir)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.gb_2)
destroy(this.rb_promesa)
destroy(this.rb_aumento)
destroy(this.rb_liberador)
destroy(this.rb_persis_pro)
destroy(this.rb_persis_aum)
destroy(this.rb_persis_lib)
destroy(this.gb_contrato)
end on

event open;string	ls_estado,ls_fecha
long		ll_tot_reg
datetime	ldt_fecha_comision
date		ld_fecha_comi

connect using Trans_1;
gf_centrar(w_comision_resumen_ventas)

ldt_fecha_comision					= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
em_termino.text						= string(ldt_fecha_comision,'dd/mm/yyyy')
ls_estado								= 'A'
dw_resumen.dataobject				= 'dwe_comision_resumen_ventas'
dw_resumen.settransobject(sqlca)
dw_resumen.Object.usuario.text	= gs_user
dw_resumen.Object.estado.text 	= 'Activo'
dw_parque.dataobject				= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)

end event

event close;disconnect using Trans_1;
end event

type dw_parque from datawindow within w_comision_resumen_ventas
integer x = 46
integer y = 72
integer width = 754
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_resumen.reset()
pb_aceptar.triggerevent(clicked!)


end event

type rb_2 from radiobutton within w_comision_resumen_ventas
integer x = 1157
integer y = 80
integer width = 361
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Persistencia"
end type

event clicked;rb_promesa.visible			= false
rb_aumento.visible			= false
rb_liberador.visible			= false

rb_persis_pro.visible			= true
rb_persis_aum.visible			= true
rb_persis_lib.visible			= true

rb_persis_pro.checked		= true
pb_aceptar.triggerevent(clicked!)

end event

type rb_1 from radiobutton within w_comision_resumen_ventas
integer x = 869
integer y = 80
integer width = 389
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Comisión"
boolean checked = true
end type

event clicked;rb_promesa.visible			= true
rb_aumento.visible			= true
rb_liberador.visible			= true

rb_persis_pro.visible			= false
rb_persis_aum.visible			= false
rb_persis_lib.visible			= false

rb_promesa.checked			= true
pb_aceptar.triggerevent(clicked!)

end event

type pb_aceptar from picturebutton within w_comision_resumen_ventas
boolean visible = false
integer x = 3849
integer y = 204
integer width = 142
integer height = 120
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_codigo,ls_depto,ls_estado,ls_cargo,ls_nombre,ls_a_paterno,ls_a_materno,ls_nombre_compl,ls_descrip,&
			ls_tipo,ls_base,ls_cod_contab,ls_cod_01,ls_cod_02,ls_cod_03,ls_pasa='S'
long		ll_rut,ll_new,ll_tot_reg,ll_cod_parque
datetime	ldt_fecha_comi,ldt_fecha_res_comi

SetPointer(HourGlass!)
dw_resumen.reset()
dw_parque.accepttext()
ldt_fecha_comi											= datetime(date(em_termino.text),time('00:00:00'))
ll_cod_parque											= dw_parque.getitemnumber(1,'parque')
if isnull(ll_cod_parque) or ll_cod_parque=0 then
	messagebox("Advertencia", "Debe Ingresar Parque")
	dw_parque.setfocus()
	ls_pasa												='N'
end if
if ls_pasa='S' then
	SELECT DISTINCT	"RES_COMI"."FECHA"  
	INTO		:ldt_fecha_res_comi  
	FROM		"RES_COMI"  
	WHERE	( "FECHA" = :ldt_fecha_comi ) AND  
				(	"COD_CONTABLE" = '022' OR "COD_CONTABLE" = '023' OR "COD_CONTABLE" = '036' OR "COD_CONTABLE" = '037' OR "COD_CONTABLE" = '089' OR "COD_CONTABLE" = '090' OR "COD_CONTABLE" = '050' OR "COD_CONTABLE" = '053' OR "COD_CONTABLE" = '028')
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if rb_activo.checked = true then
			ls_estado										= 'A'
			dw_resumen.Object.estado.text 			= 'Activo'
		elseif rb_inactivo.checked = true then
			ls_estado										= 'I'
			dw_resumen.Object.estado.text 			= 'Inactivo'
		end if
		dw_resumen.Object.t_empresa.text 			= gs_nombre_parque
		dw_resumen.Object.usuario.text 				= gs_user
		if rb_promesa.checked = true then
			ls_tipo											= 'CP'
			ls_base											= 'O'
			dw_resumen.Object.titulo.text 				= 'Resumen Comisión (Promesas de Ventas)'
			dw_resumen.Object.titulo1.text 			= 'Promesas de Ventas'
			ls_cod_01										= '023'
			ls_cod_02										= '037'
			ls_cod_03										= '089'
		elseif rb_aumento.checked = true then
			ls_tipo											= 'CA'
			ls_base											= 'A'
			dw_resumen.Object.titulo.text 				= 'Resumen Comisión (Anexo Aumento Capacidad)'
			dw_resumen.Object.titulo1.text 			= 'Anexo Aumento Capacidad'	
			ls_cod_01										= '050'
			ls_cod_02										= '050'
			ls_cod_03										= '050'
		elseif rb_liberador.checked = true then
			ls_tipo											= 'CL'
			ls_base											= 'L'
			dw_resumen.Object.titulo.text 				= 'Resumen Comisión (Anexo Liberador de Mantención)'
			dw_resumen.Object.titulo1.text 			= 'Anexo Liberador de Mantención'
			ls_cod_01										= '022'
			ls_cod_02										= '036'
			ls_cod_03										= '036'
		
		elseif rb_persis_pro.checked = true then
			ls_tipo											= 'PP'
			ls_base											= 'O'
			dw_resumen.Object.titulo.text 				= 'Resumen Premio Persistencia (Promesas de Ventas)'
			dw_resumen.Object.titulo1.text 			= 'Promesas de Ventas'
			ls_cod_01										= '090'
			ls_cod_02										= '090'
			ls_cod_03										= '090'
		elseif rb_persis_aum.checked = true then
			ls_tipo											= 'PA'
			ls_base											= 'A'
			dw_resumen.Object.titulo.text 				= 'Resumen Premio Persistencia (Anexo Aumento Capacidad)'
			dw_resumen.Object.titulo1.text 			= 'Anexo Aumento Capacidad'
			ls_cod_01										= '028'
			ls_cod_02										= '028'
			ls_cod_03										= '028'	
		elseif rb_persis_lib.checked = true then
			ls_tipo											= 'PL'
			ls_base											= 'L'
			dw_resumen.Object.titulo.text 				= 'Resumen Premio Persistencia (Anexo Liberador Mantención)'
			dw_resumen.Object.titulo1.text 			= 'Anexo Liberador de Mantención'
			ls_cod_01										= '053'
			ls_cod_02										= '053'
			ls_cod_03										= '053'	
		end if
		dw_resumen.Object.usuario.text 				= gs_user
		dw_resumen.Object.fecha_comi.text 			= string(ldt_fecha_comi,'dd/mm/yyyy')
		dw_resumen.Object.valor_uf.text	 			= string(ldt_fecha_comi,'dd/mm/yyyy')
			
		DECLARE x1 CURSOR FOR	
		SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"AGENTES"."DEPTO",	"RES_COMI"."RUT",	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"RES_COMI"."COD_CONTABLE",	'Agentes:' AS CARGO
		FROM			"RES_COMI",	"AGENTES"  
		WHERE		"RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" and  
						"RES_COMI"."FECHA" = :ldt_fecha_comi AND  
						("RES_COMI"."COD_CONTABLE" = :ls_cod_01 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_02 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_03) AND  
						"RES_COMI"."BASE" = :ls_base AND  
						"RES_COMI"."ESTADO_AGE_SUP" = :ls_estado AND
						"AGENTES"."PAGOS_VENTA" = 'S' AND
						"AGENTES"."COD_PARQUE" = :ll_cod_parque
		UNION   
		SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"SUPERVISOR"."DEPTO",	"RES_COMI"."RUT",	"SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO",	"RES_COMI"."COD_CONTABLE",	'Supervisor:' AS CARGO
		FROM			"RES_COMI",	"SUPERVISOR"  
		WHERE		"RES_COMI"."COD_AGE_SUP" = "SUPERVISOR"."COD_SUP" and  
						"RES_COMI"."FECHA" = :ldt_fecha_comi AND  
						("RES_COMI"."COD_CONTABLE" = :ls_cod_01 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_02 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_03) AND  
						"RES_COMI"."BASE" = :ls_base AND  
						"RES_COMI"."ESTADO_AGE_SUP" = :ls_estado AND
						"SUPERVISOR"."PAGOS_VENTA" = 'S' and
						"SUPERVISOR"."COD_PARQUE" = :ll_cod_parque
		UNION   
		SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"JEFE_VENTAS"."DEPTO",	"RES_COMI"."RUT",	"JEFE_VENTAS"."NOMBRE",	"JEFE_VENTAS"."A_PATERNO",	"JEFE_VENTAS"."A_MATERNO",	"RES_COMI"."COD_CONTABLE",	'Jefe Ventas:' AS CARGO
		FROM			"RES_COMI",	"JEFE_VENTAS"  
		WHERE		"RES_COMI"."COD_AGE_SUP" = "JEFE_VENTAS"."JEFE_VENTAS" and  
						"RES_COMI"."FECHA" = :ldt_fecha_comi AND  
						("RES_COMI"."COD_CONTABLE" = :ls_cod_01 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_02 OR "RES_COMI"."COD_CONTABLE" = :ls_cod_03) AND  
						"RES_COMI"."BASE" = :ls_base AND  
						"RES_COMI"."ESTADO_AGE_SUP" = :ls_estado AND
						"JEFE_VENTAS"."PAGOS_VENTA" = 'S' AND
						"JEFE_VENTAS"."COD_PARQUE" = :ll_cod_parque
		ORDER BY	CARGO DESC
		USING		sqlca ;
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
			fetch x1 INTO	:ls_codigo,	:ls_depto,	:ll_rut,	:ls_nombre,	:ls_a_paterno, :ls_a_materno,	:ls_cod_contab,	:ls_cargo;
				if not isnull(ls_codigo) and ls_codigo <> '' then 
					ls_nombre_compl				= ls_cargo+' '+ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
					ll_total_pago	 				= f_res_comi_consul(ls_codigo,ls_cod_contab,ldt_fecha_comi)
					SELECT	"CODIGO_CONTABLE"."DESCRIPCION"  
					INTO 		:ls_descrip  
					FROM 	"CODIGO_CONTABLE"  
					WHERE 	"CODIGO_CONTABLE"."CODIGO" = :ls_cod_contab
					USING	sqlca;
					if sqlca.sqlcode=0 then
					end if
					ll_new							= dw_resumen.insertrow(0)
					dw_resumen.scrolltorow(ll_new)
					dw_resumen.setitem(ll_new,"codigo",ls_codigo)
					dw_resumen.setitem(ll_new,"rut",ll_rut)
					dw_resumen.setitem(ll_new,"cod_contab",ls_cod_contab)
					dw_resumen.setitem(ll_new,"descripcion",ls_descrip)
					dw_resumen.setitem(ll_new,"nombre",ls_nombre_compl)
					dw_resumen.setitem(ll_new,"total_pago",ll_total_pago)
					dw_resumen.setitem(ll_new,"cod_parque",ll_cod_parque)
					dw_resumen.accepttext()
				end if
				setnull(ls_codigo)
			LOOP
		end if
		close x1;
	else
		messagebox("Advertencia","No Registra Pago de comisiones con Fecha :"+string(ldt_fecha_res_comi,"dd/mm/yyyy"))
	end if
	SetPointer(Arrow!)
end if
end event

type em_termino from editmask within w_comision_resumen_ventas
boolean visible = false
integer x = 3835
integer y = 96
integer width = 320
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type rb_inactivo from radiobutton within w_comision_resumen_ventas
integer x = 1934
integer y = 80
integer width = 261
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Inactivo"
end type

event clicked;pb_aceptar.triggerevent(clicked!)
end event

type rb_activo from radiobutton within w_comision_resumen_ventas
integer x = 1678
integer y = 80
integer width = 293
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Activo"
boolean checked = true
end type

event clicked;pb_aceptar.triggerevent(clicked!)
end event

type cb_cerrar from commandbutton within w_comision_resumen_ventas
integer x = 3447
integer y = 1696
integer width = 279
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_resumen_ventas)
end event

type dw_resumen from datawindow within w_comision_resumen_ventas
integer x = 41
integer y = 208
integer width = 3685
integer height = 1420
integer taborder = 10
string title = "none"
string dataobject = "dwe_comision_resumen_ventas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_estado from groupbox within w_comision_resumen_ventas
integer x = 1637
integer y = 16
integer width = 571
integer height = 168
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Estado"
end type

type gb_1 from groupbox within w_comision_resumen_ventas
integer x = 1312
integer y = 1644
integer width = 1083
integer height = 156
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

type cb_imprimir from commandbutton within w_comision_resumen_ventas
integer x = 2112
integer y = 1696
integer width = 256
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long		ll_res

if dw_resumen.rowcount() > 0 then
	ll_res			= MessageBox("Imprimir", "Desea Imprimir el Informe", Exclamation!, YesNo!, 2)
	if ll_res=1 then
		f_Print( dw_resumen )
	else
		messagebox('Advertencia','Proceso Cancelado')
	end if
else
	messagebox('Advertencia','No Registra Datos para Imprimir')
end if
end event

type cb_ordenar from commandbutton within w_comision_resumen_ventas
integer x = 1851
integer y = 1696
integer width = 256
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_resumen.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_resumen.SETSORT(NULO)
	dw_resumen.SORT()
end if
end event

type cb_filtrar from commandbutton within w_comision_resumen_ventas
integer x = 1595
integer y = 1696
integer width = 256
integer height = 84
integer taborder = 40
boolean bringtotop = true
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
dw_resumen.SETfilter(NULO)
dw_resumen.filter()
end event

type cb_exportar from commandbutton within w_comision_resumen_ventas
integer x = 1339
integer y = 1696
integer width = 256
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_resumen
if dw_resumen.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type gb_2 from groupbox within w_comision_resumen_ventas
integer x = 837
integer y = 16
integer width = 699
integer height = 168
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Tipo Pago"
end type

type rb_promesa from radiobutton within w_comision_resumen_ventas
integer x = 2341
integer y = 80
integer width = 384
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Prom. Ventas"
boolean checked = true
end type

event clicked;pb_aceptar.triggerevent(clicked!)
end event

type rb_aumento from radiobutton within w_comision_resumen_ventas
integer x = 2734
integer y = 80
integer width = 466
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Aum. Capacidad"
end type

event clicked;pb_aceptar.triggerevent(clicked!)
end event

type rb_liberador from radiobutton within w_comision_resumen_ventas
integer x = 3223
integer y = 80
integer width = 485
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Liber. Mantención"
end type

event clicked;pb_aceptar.triggerevent(clicked!)
end event

type rb_persis_pro from radiobutton within w_comision_resumen_ventas
integer x = 2341
integer y = 80
integer width = 384
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Prom. Ventas"
end type

event clicked;pb_aceptar.triggerevent(clicked!)
end event

type rb_persis_aum from radiobutton within w_comision_resumen_ventas
integer x = 2734
integer y = 80
integer width = 466
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Aum. Capacidad"
end type

event clicked;pb_aceptar.triggerevent(clicked!)
end event

type rb_persis_lib from radiobutton within w_comision_resumen_ventas
integer x = 3223
integer y = 80
integer width = 498
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Liber. Mantención"
end type

event clicked;pb_aceptar.triggerevent(clicked!)
end event

type gb_contrato from groupbox within w_comision_resumen_ventas
integer x = 2299
integer y = 16
integer width = 1426
integer height = 168
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Resumen"
end type

