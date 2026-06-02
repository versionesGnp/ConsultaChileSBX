forward
global type w_plan_de_carrera from window
end type
type cb_clasif_hist from commandbutton within w_plan_de_carrera
end type
type st_1 from statictext within w_plan_de_carrera
end type
type dw_parque from datawindow within w_plan_de_carrera
end type
type cb_exportar from commandbutton within w_plan_de_carrera
end type
type cb_5 from commandbutton within w_plan_de_carrera
end type
type cb_3 from commandbutton within w_plan_de_carrera
end type
type cb_4 from commandbutton within w_plan_de_carrera
end type
type pb_aceptar from picturebutton within w_plan_de_carrera
end type
type cb_cerrar from commandbutton within w_plan_de_carrera
end type
type cb_limpiar from commandbutton within w_plan_de_carrera
end type
type dw_cierre_venta from datawindow within w_plan_de_carrera
end type
type dw_plan_carrera from datawindow within w_plan_de_carrera
end type
type gb_2 from groupbox within w_plan_de_carrera
end type
end forward

global type w_plan_de_carrera from window
integer width = 4087
integer height = 2256
boolean titlebar = true
string title = "Plan de Carrera"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_clasif_hist cb_clasif_hist
st_1 st_1
dw_parque dw_parque
cb_exportar cb_exportar
cb_5 cb_5
cb_3 cb_3
cb_4 cb_4
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
cb_limpiar cb_limpiar
dw_cierre_venta dw_cierre_venta
dw_plan_carrera dw_plan_carrera
gb_2 gb_2
end type
global w_plan_de_carrera w_plan_de_carrera

type variables
long il_row
end variables

on w_plan_de_carrera.create
this.cb_clasif_hist=create cb_clasif_hist
this.st_1=create st_1
this.dw_parque=create dw_parque
this.cb_exportar=create cb_exportar
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_4=create cb_4
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.cb_limpiar=create cb_limpiar
this.dw_cierre_venta=create dw_cierre_venta
this.dw_plan_carrera=create dw_plan_carrera
this.gb_2=create gb_2
this.Control[]={this.cb_clasif_hist,&
this.st_1,&
this.dw_parque,&
this.cb_exportar,&
this.cb_5,&
this.cb_3,&
this.cb_4,&
this.pb_aceptar,&
this.cb_cerrar,&
this.cb_limpiar,&
this.dw_cierre_venta,&
this.dw_plan_carrera,&
this.gb_2}
end on

on w_plan_de_carrera.destroy
destroy(this.cb_clasif_hist)
destroy(this.st_1)
destroy(this.dw_parque)
destroy(this.cb_exportar)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.cb_limpiar)
destroy(this.dw_cierre_venta)
destroy(this.dw_plan_carrera)
destroy(this.gb_2)
end on

event open;connect using Trans_1;
connect using Trans_2;
connect using Trans_4;

gf_centrar(w_plan_de_carrera)

dw_cierre_venta.settransobject(sqlca)
dw_cierre_venta.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/01/1997'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_cierre_venta.insertrow(0)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_plan_carrera.settransobject(sqlca)

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_clasif_hist from commandbutton within w_plan_de_carrera
integer x = 1303
integer y = 2032
integer width = 562
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasificación Historica"
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha

dw_parque.accepttext()
dw_cierre_venta.accepttext()

if dw_plan_carrera.rowcount() > 0 then
	ls_codigo								= dw_plan_carrera.getitemstring(il_row,'cod_age')
	ldt_fecha								= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
end if
if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fecha) then
	ls_string								= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')
	if isvalid(w_clasifica_historica) then close(w_clasifica_historica)
	OpenWithParm (w_clasifica_historica,ls_string)
end if
end event

type st_1 from statictext within w_plan_de_carrera
integer x = 64
integer y = 56
integer width = 224
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque:"
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_plan_de_carrera
integer x = 274
integer y = 44
integer width = 713
integer height = 100
integer taborder = 10
string title = "none"
string dataobject = "dwe_parques"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_plan_carrera.reset()
end event

type cb_exportar from commandbutton within w_plan_de_carrera
integer x = 1934
integer y = 2032
integer width = 242
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_plan_carrera.rowcount() > 0 then
//	OpenWithParm(w_exportar, dw_plan_carrera)
	f_DWToExcel( dw_plan_carrera )
end if
end event

type cb_5 from commandbutton within w_plan_de_carrera
integer x = 2181
integer y = 2032
integer width = 242
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_plan_carrera.SETSORT(NULO)
dw_plan_carrera.SORT()

end event

type cb_3 from commandbutton within w_plan_de_carrera
integer x = 2427
integer y = 2032
integer width = 206
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_plan_carrera.SETfilter(ls_texto)
dw_plan_carrera.filter()
end event

type cb_4 from commandbutton within w_plan_de_carrera
integer x = 2706
integer y = 2032
integer width = 229
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_plan_carrera.rowcount() > 0 then 
	dw_plan_carrera.object.datawindow.Print.Preview	= true
	dw_plan_carrera.object.datawindow.zoom				= 82
	f_Print( dw_plan_carrera )
//	f_printdlg(dw_plan_carrera,gstr_print,parent)
	dw_plan_carrera.object.datawindow.Print.Preview	= False
	dw_plan_carrera.object.datawindow.zoom				= 100
end if
end event

type pb_aceptar from picturebutton within w_plan_de_carrera
integer x = 1856
integer y = 24
integer width = 128
integer height = 108
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

event clicked;string		ls_cod_age,ls_canal,ls_nombre,ls_a_paterno,ls_a_materno,ls_estado,ls_jefe_venta,ls_clasif_hist,ls_desc_cod,ls_cod_sup
long		ll_cod_parque,ll_new,ll_prom_mes_1,ll_prom_mes_1_m2,ll_prom_mes_2,ll_prom_mes_2_m2,ll_prom_mes_3,&
			ll_prom_mes_3_m2,ll_total_prom,ll_total_trim,ll_meses,ll_cod_premio
datetime	ldt_fecha_cierre,ldt_fecha_ini_3,ldt_fecha_fin_3,ldt_fecha_3,ldt_fecha_2,ldt_fecha_ini_2,ldt_fecha_fin_2,&
			ldt_fecha_1,ldt_fecha_ini_1,ldt_fecha_fin_1,ldt_fecha_inicio,ldt_fecha_vig

dw_cierre_venta.accepttext()
ldt_fecha_cierre														= dw_cierre_venta.getitemdatetime(1,'cierre_ventas')
ll_cod_parque															= dw_parque.getitemnumber(1,'parque')
dw_plan_carrera.reset()
if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ldt_fecha_cierre) then
	SetPointer(HourGlass!)
	dw_plan_carrera.object.usuario.text		= gs_user
	SELECT  "CIERRE_VENTA_INI",  "CIERRE_VENTA"  
	INTO    :ldt_fecha_ini_3,    :ldt_fecha_fin_3  
	FROM    "CIERRE_VENTA"  
	WHERE   "CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
	USING   sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_3) then
			ldt_fecha_3													= ldt_fecha_cierre
			dw_plan_carrera.object.mes_3.text					= string(ldt_fecha_3,'dd/mm/yyyy')
		end if
	end if
	ldt_fecha_2 														= datetime(RelativeDate(date(ldt_fecha_ini_3), - 1))
	SELECT  "CIERRE_VENTA_INI",  "CIERRE_VENTA"  
	INTO    :ldt_fecha_ini_2,     :ldt_fecha_fin_2  
	FROM    "CIERRE_VENTA"  
	WHERE   "CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_2
	USING   sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_2) then
			dw_plan_carrera.object.mes_2.text					= string(ldt_fecha_2,'dd/mm/yyyy')
		end if
	end if
	ldt_fecha_1 = datetime(RelativeDate(date(ldt_fecha_ini_2), - 1))
	SELECT  "CIERRE_VENTA_INI",  "CIERRE_VENTA"  
	INTO    :ldt_fecha_ini_1,    :ldt_fecha_fin_1  
	FROM    "CIERRE_VENTA"  
	WHERE   "CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_1
	USING    sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_1) then
			dw_plan_carrera.object.mes_1.text					= string(ldt_fecha_1,'dd/mm/yyyy')
		end if
	end if
	DECLARE xage CURSOR FOR
	SELECT	"AGENTES"."COD_AGE",	"AGENTES"."FECHA_INI",	"AGENTES"."COD_PARQUE",	"AGENTES"."CANAL", "AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"AGENTES"."ESTADO",	"JEFE_VENTAS"."JEFE_VENTAS", "AGENTES"."COD_SUP" 
	FROM		"AGENTES",	"JEFE_VENTAS",	"SUPERVISOR"  
	WHERE		( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
				( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
				( "AGENTES"."ESTADO" = 'A' ) AND
				( "AGENTES"."FECHA_INI" <= :ldt_fecha_3 ) AND
				( "AGENTES"."COD_PARQUE" = :ll_cod_parque ) AND
				( "AGENTES"."DEPTO" = 'M' OR "AGENTES"."DEPTO" = 'K')
	USING		sqlca;
	open xage;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch xage INTO	:ls_cod_age,	:ldt_fecha_inicio,	:ll_cod_parque,	:ls_canal,	:ls_nombre,	:ls_a_paterno,	:ls_a_materno,	:ls_estado, :ls_jefe_venta, :ls_cod_sup;
			if not isnull(ls_cod_age) and ls_cod_age<>'' then
				ll_new					= dw_plan_carrera.insertrow(0)
				dw_plan_carrera.scrolltorow(ll_new)
				dw_plan_carrera.setitem(ll_new,'cod_age',ls_cod_age)
				dw_plan_carrera.setitem(ll_new,'cod_sup',ls_cod_sup)
				dw_plan_carrera.setitem(ll_new,'fecha_inicio_age',ldt_fecha_inicio)
				dw_plan_carrera.setitem(ll_new,'cod_parque',ll_cod_parque)
				dw_plan_carrera.setitem(ll_new,'canal',ls_canal)
				dw_plan_carrera.setitem(ll_new,'nombre_age',ls_nombre)
				dw_plan_carrera.setitem(ll_new,'a_paterno_age',ls_a_paterno)
				dw_plan_carrera.setitem(ll_new,'a_materno_age',ls_a_materno)		
				dw_plan_carrera.setitem(ll_new,'cod_jefe',ls_jefe_venta)		
				dw_plan_carrera.setitem(ll_new,'estado', ls_estado)
				ls_clasif_hist											= f_clasif_hist(ls_cod_age,ldt_fecha_cierre)
				ll_prom_mes_1        								= f_cta_promesa_cierre(ls_cod_age,ldt_fecha_1)
				ll_prom_mes_2        								= f_cta_promesa_cierre(ls_cod_age,ldt_fecha_2)
				ll_prom_mes_3        								= f_cta_promesa_cierre(ls_cod_age,ldt_fecha_3)
				ll_total_prom 											= ll_prom_mes_1 + ll_prom_mes_2 + ll_prom_mes_3
				ll_meses      											= f_calculo_meses(ldt_fecha_inicio,ldt_fecha_cierre)
				
				dw_plan_carrera.setitem(ll_new,'clasificacion',ls_clasif_hist)
				dw_plan_carrera.setitem(ll_new,'numero_vta_1',ll_prom_mes_1)
				dw_plan_carrera.setitem(ll_new,'numero_vta_2',ll_prom_mes_2)
				dw_plan_carrera.setitem(ll_new,'numero_vta_3',ll_prom_mes_3)
				dw_plan_carrera.setitem(ll_new,'total_vta',ll_total_prom)
				dw_plan_carrera.setitem(ll_new,'meses', ll_meses)
				
				SELECT DISTINCT max("FECHA_VIG")  
    				INTO	:ldt_fecha_vig
				FROM	"PLAN_CARRERA_COD"
				WHERE	"PLAN_CARRERA_COD"."FECHA_VIG" <= :ldt_fecha_cierre
				USING	sqlca;
				
				if ldt_fecha_vig = datetime(date(string('31/12/2009'))) then //modificado
					ll_prom_mes_1_m2									= f_cta_promesa_cierre_mayor_2%(ls_cod_age,ldt_fecha_1)
					ll_prom_mes_2_m2									= f_cta_promesa_cierre_mayor_2%(ls_cod_age,ldt_fecha_2)	
					ll_prom_mes_3_m2									= f_cta_promesa_cierre_mayor_2%(ls_cod_age,ldt_fecha_3)
				else
					ll_prom_mes_1_m2									= f_cta_promesa_cierre_mayor_ab(ls_cod_age,ldt_fecha_1)
					ll_prom_mes_2_m2									= f_cta_promesa_cierre_mayor_ab(ls_cod_age,ldt_fecha_2)	
					ll_prom_mes_3_m2									= f_cta_promesa_cierre_mayor_ab(ls_cod_age,ldt_fecha_3)
				end if
				ll_total_trim 											= ll_prom_mes_1_m2 + ll_prom_mes_2_m2 + ll_prom_mes_3_m2
				dw_plan_carrera.setitem(ll_new,'vta_mayor_1',ll_prom_mes_1_m2)
				dw_plan_carrera.setitem(ll_new,'vta_mayor_2',ll_prom_mes_2_m2)
				dw_plan_carrera.setitem(ll_new,'vta_mayor_3',ll_prom_mes_3_m2)
				dw_plan_carrera.setitem(ll_new,'tot_vta_x_trimestre',ll_total_trim)
							
				SELECT	"CODIGO_PREMIO"
				INTO		:ll_cod_premio
				FROM		"PLAN_CARRERA_TRAMOS"
				WHERE		( "PLAN_CARRERA_TRAMOS"."CANAL" = :ls_canal ) AND
							( "PLAN_CARRERA_TRAMOS"."ANTIGUEDAD_INI" <= :ll_meses ) AND
							( "PLAN_CARRERA_TRAMOS"."ANTIGUEDAD_FIN" >= :ll_meses ) AND
							( "PLAN_CARRERA_TRAMOS"."TRAMO_INI" <= :ll_total_trim ) AND
							( "PLAN_CARRERA_TRAMOS"."TRAMO_FIN" >= :ll_total_trim ) AND
							( "PLAN_CARRERA_TRAMOS"."CLASIFICACION" = :ls_clasif_hist) and
							( "PLAN_CARRERA_TRAMOS"."ESTADO" = 'V')
				USING		Trans_1;
				if Trans_1.sqlcode=0 then
				else
					SELECT	"CODIGO_PREMIO"
					INTO		:ll_cod_premio
					FROM		"PLAN_CARRERA_TRAMOS"
					WHERE		( "PLAN_CARRERA_TRAMOS"."CANAL" = :ls_canal ) AND
								( "PLAN_CARRERA_TRAMOS"."ANTIGUEDAD_INI" <= :ll_meses ) AND
								( "PLAN_CARRERA_TRAMOS"."TRAMO_INI" <= :ll_total_trim ) AND
								( "PLAN_CARRERA_TRAMOS"."TRAMO_FIN" >= :ll_total_trim ) AND
								( "PLAN_CARRERA_TRAMOS"."CLASIFICACION" = :ls_clasif_hist) AND
								( "PLAN_CARRERA_TRAMOS"."ESTADO" = 'V')
					USING		Trans_2;
					if Trans_2.sqlcode=0 then
					else
						SELECT	MAX("CODIGO_PREMIO")
						INTO		:ll_cod_premio
						FROM		"PLAN_CARRERA_TRAMOS"
						WHERE		( "PLAN_CARRERA_TRAMOS"."CANAL" = :ls_canal ) AND
									( "PLAN_CARRERA_TRAMOS"."ANTIGUEDAD_INI" <= :ll_meses ) AND
									( "PLAN_CARRERA_TRAMOS"."CLASIFICACION" = :ls_clasif_hist) AND
									( "PLAN_CARRERA_TRAMOS"."ESTADO" = 'V')
						USING		Trans_4;
						if Trans_4.sqlcode=0 then
						end if
					end if
				end if 
				if ldt_fecha_vig = datetime(date(string('31/12/2009'))) then //modificado
					if ll_meses <= 3 then
						ll_cod_premio 										= 1
					end if
					if ls_clasif_hist = 'D' then
						ll_cod_premio 										= 1
					end if
				end if
				
				dw_plan_carrera.setitem(ll_new,'tipo_premio', ll_cod_premio)
				SELECT	"PLAN_CARRERA_COD"."DESCRIPCION"  
				INTO		:ls_desc_cod  
				FROM		"PLAN_CARRERA_COD"  
				WHERE 	"PLAN_CARRERA_COD"."CODIGO" = :ll_cod_premio AND
							"PLAN_CARRERA_COD"."ESTADO" = 'V'
				USING    Trans_1;
				if Trans_1.sqlcode=0 then
					dw_plan_carrera.setitem(ll_new,'clas_des', ls_desc_cod)
				end if
			end if
			Setnull(ls_cod_age)
		LOOP
	end if
	close xage;
	SetPointer(Arrow!)
else
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_parque.setfocus()
	elseif isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_cierre_venta.setfocus()
	end if
end if
end event

type cb_cerrar from commandbutton within w_plan_de_carrera
integer x = 3703
integer y = 2032
integer width = 315
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_plan_de_carrera)
end event

type cb_limpiar from commandbutton within w_plan_de_carrera
integer x = 41
integer y = 2032
integer width = 315
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_plan_carrera.reset()
dw_cierre_venta.reset()
dw_parque.reset()
dw_plan_carrera.insertrow(0)
dw_cierre_venta.insertrow(0)
dw_parque.insertrow(0)
end event

type dw_cierre_venta from datawindow within w_plan_de_carrera
integer x = 1001
integer y = 44
integer width = 846
integer height = 100
integer taborder = 10
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_plan_carrera.reset()
end event

type dw_plan_carrera from datawindow within w_plan_de_carrera
integer x = 41
integer y = 152
integer width = 3995
integer height = 1836
integer taborder = 10
string title = "none"
string dataobject = "dwe_plan_carrera"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_2 from groupbox within w_plan_de_carrera
integer x = 1280
integer y = 1984
integer width = 1687
integer height = 152
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

