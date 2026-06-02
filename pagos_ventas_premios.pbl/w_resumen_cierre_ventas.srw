forward
global type w_resumen_cierre_ventas from window
end type
type cb_exportar from commandbutton within w_resumen_cierre_ventas
end type
type cb_filtrar from commandbutton within w_resumen_cierre_ventas
end type
type cb_imprimir from commandbutton within w_resumen_cierre_ventas
end type
type dw_fecha_cierre from datawindow within w_resumen_cierre_ventas
end type
type dw_cierre_ventas from datawindow within w_resumen_cierre_ventas
end type
type pb_aceptar from picturebutton within w_resumen_cierre_ventas
end type
type cb_cerrar from commandbutton within w_resumen_cierre_ventas
end type
type gb_3 from groupbox within w_resumen_cierre_ventas
end type
end forward

global type w_resumen_cierre_ventas from window
integer width = 3355
integer height = 1916
boolean titlebar = true
string title = "Resumen Cierre Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
dw_fecha_cierre dw_fecha_cierre
dw_cierre_ventas dw_cierre_ventas
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
gb_3 gb_3
end type
global w_resumen_cierre_ventas w_resumen_cierre_ventas

type variables
Long	il_mes,il_ano,il_row
end variables

on w_resumen_cierre_ventas.create
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.dw_fecha_cierre=create dw_fecha_cierre
this.dw_cierre_ventas=create dw_cierre_ventas
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.Control[]={this.cb_exportar,&
this.cb_filtrar,&
this.cb_imprimir,&
this.dw_fecha_cierre,&
this.dw_cierre_ventas,&
this.pb_aceptar,&
this.cb_cerrar,&
this.gb_3}
end on

on w_resumen_cierre_ventas.destroy
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.dw_fecha_cierre)
destroy(this.dw_cierre_ventas)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.gb_3)
end on

event close;disconnect using Trans_1;
end event

event open;connect using Trans_1;

gf_centrar(w_resumen_cierre_ventas)

dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/01/2000'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)
end event

type cb_exportar from commandbutton within w_resumen_cierre_ventas
integer x = 1440
integer y = 1664
integer width = 238
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
dw_paso	= dw_cierre_ventas
if dw_cierre_ventas.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_resumen_cierre_ventas
integer x = 1682
integer y = 1664
integer width = 238
integer height = 84
integer taborder = 60
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
dw_cierre_ventas.SETfilter(NULO)
dw_cierre_ventas.filter()
end event

type cb_imprimir from commandbutton within w_resumen_cierre_ventas
integer x = 37
integer y = 1648
integer width = 297
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

event clicked;if dw_cierre_ventas.rowcount() >0 then 
	f_Print( dw_cierre_ventas )
end if
end event

type dw_fecha_cierre from datawindow within w_resumen_cierre_ventas
integer x = 37
integer y = 44
integer width = 841
integer height = 100
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

type dw_cierre_ventas from datawindow within w_resumen_cierre_ventas
integer x = 37
integer y = 152
integer width = 3259
integer height = 1472
integer taborder = 40
string title = "none"
string dataobject = "dw_cierre_resumen"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
this.accepttext()
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type pb_aceptar from picturebutton within w_resumen_cierre_ventas
integer x = 891
integer y = 24
integer width = 128
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_cod_jef,ls_cod_sup,ls_conexion,ls_base,ls_canal,ls_nombre_sup,ls_a_pater_sup,ls_a_mater_sup,ls_superv,&
			ls_nombre_jef,ls_a_pater_jef,ls_a_mater_jef,ls_jefe_venta
long		ll_cod_parque,ll_new,ll_cta_pro,ll_cta_lib,ll_cta_aum
datetime	ldt_fecha,ldt_fech_ing_jef,ldt_fech_ing_sup,ldt_fecha_ini
double	ldb_uf_pro,ldb_uf_lib,ldb_uf_aum		

dw_cierre_ventas.reset()
ldt_fecha																= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
INTO 		:ldt_fecha_ini  
FROM		"CIERRE_VENTA"  
WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha
USING		sqlca;
dw_cierre_ventas.Object.titulo2.text	 						= 'Período de Ventas desde '+string(ldt_fecha_ini,'dd/mm/yyyy')+' hasta '+string(ldt_fecha,'dd/mm/yyyy')
dw_cierre_ventas.Object.usuario.text	 						= gs_user

DECLARE x1 CURSOR FOR
SELECT DISTINCT	"CONEXION","COD_PARQUE","CANAL","FECH_ING_JEF","COD_JEF","COD_SUP","FECH_ING_SUP"	  
FROM			"VISTA_DETALLE_CIERRE_VTA"  
WHERE		"VISTA_DETALLE_CIERRE_VTA"."CIERRE_VENTA" = :ldt_fecha
ORDER BY	"VISTA_DETALLE_CIERRE_VTA"."CONEXION" DESC,
				"VISTA_DETALLE_CIERRE_VTA"."FECH_ING_JEF" ASC,
				"VISTA_DETALLE_CIERRE_VTA"."COD_PARQUE" ASC,
				"VISTA_DETALLE_CIERRE_VTA"."FECH_ING_SUP" ASC,
				"VISTA_DETALLE_CIERRE_VTA"."CANAL" ASC
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ls_conexion,:ll_cod_parque,:ls_canal,:ldt_fech_ing_jef,:ls_cod_jef,:ls_cod_sup,:ldt_fech_ing_sup; 
		if not isnull(ls_conexion) and ls_conexion <> '' and not isnull(ll_cod_parque) and ll_cod_parque>0 then
			if ls_conexion = 'PRADO' THEN
				SELECT	"PRADO"."SUPERVISOR"."NOMBRE","PRADO"."SUPERVISOR"."A_PATERNO","PRADO"."SUPERVISOR"."A_MATERNO"  
    				INTO		:ls_nombre_sup,:ls_a_pater_sup,:ls_a_mater_sup  
         		FROM		"PRADO"."SUPERVISOR"  
   				WHERE 	"PRADO"."SUPERVISOR"."COD_SUP" = :ls_cod_sup
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_superv											= ls_cod_sup+' - '+ls_nombre_sup+' '+ls_a_pater_sup+' '+ls_a_mater_sup
				end if
				SELECT	"PRADO"."JEFE_VENTAS"."NOMBRE","PRADO"."JEFE_VENTAS"."A_PATERNO","PRADO"."JEFE_VENTAS"."A_MATERNO"  
    				INTO		:ls_nombre_jef,:ls_a_pater_jef,:ls_a_mater_jef  
         		FROM		"PRADO"."JEFE_VENTAS"  
   				WHERE 	"PRADO"."JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jef
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_jefe_venta										= ls_cod_jef+' - '+ls_nombre_jef+' '+ls_a_pater_jef+' '+ls_a_mater_jef
				end if
			elseif ls_conexion = 'FORESTA' THEN
				SELECT	"FORESTA"."SUPERVISOR"."NOMBRE","FORESTA"."SUPERVISOR"."A_PATERNO","FORESTA"."SUPERVISOR"."A_MATERNO"  
    				INTO		:ls_nombre_sup,:ls_a_pater_sup,:ls_a_mater_sup  
         		FROM		"FORESTA"."SUPERVISOR"  
   				WHERE 	"FORESTA"."SUPERVISOR"."COD_SUP" = :ls_cod_sup
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_superv											= ls_cod_sup+' - '+ls_nombre_sup+' '+ls_a_pater_sup+' '+ls_a_mater_sup
				end if
				SELECT	"FORESTA"."JEFE_VENTAS"."NOMBRE","FORESTA"."JEFE_VENTAS"."A_PATERNO","FORESTA"."JEFE_VENTAS"."A_MATERNO"  
    				INTO		:ls_nombre_jef,:ls_a_pater_jef,:ls_a_mater_jef  
         		FROM		"FORESTA"."JEFE_VENTAS"  
   				WHERE 	"FORESTA"."JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jef
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_jefe_venta										= ls_cod_jef+' - '+ls_nombre_jef+' '+ls_a_pater_jef+' '+ls_a_mater_jef
				end if
			end if
			
			SELECT	COUNT("BASE"),SUM("PRECIO_UF")
			INTO		:ll_cta_pro,:ldb_uf_pro		
    			FROM 	"VISTA_DETALLE_CIERRE_VTA"  
   			WHERE	( "VISTA_DETALLE_CIERRE_VTA"."COD_PARQUE" = :ll_cod_parque ) AND  
         				( "VISTA_DETALLE_CIERRE_VTA"."COD_SUP" = :ls_cod_sup ) AND
						( "VISTA_DETALLE_CIERRE_VTA"."COD_JEF" = :ls_cod_jef ) AND
         				( "VISTA_DETALLE_CIERRE_VTA"."CIERRE_VENTA" = :ldt_fecha ) AND  
         				( "VISTA_DETALLE_CIERRE_VTA"."CONEXION" = :ls_conexion ) AND
						( "VISTA_DETALLE_CIERRE_VTA"."BASE" = 'O' )
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if (not isnull(ll_cta_pro) or ll_cta_pro>0) and (not isnull(ldb_uf_pro) or ldb_uf_pro>0) then
					ll_cta_pro											= ll_cta_pro
					ldb_uf_pro											= ldb_uf_pro
				else
					ll_cta_pro											= 0
					ldb_uf_pro											= 0
				end if
			else
				ll_cta_pro												= 0
				ldb_uf_pro												= 0
			end if
			
			SELECT	COUNT("BASE"),SUM("PRECIO_UF")
			INTO		:ll_cta_lib,:ldb_uf_lib		
    			FROM 	"VISTA_DETALLE_CIERRE_VTA"  
   			WHERE	( "VISTA_DETALLE_CIERRE_VTA"."COD_PARQUE" = :ll_cod_parque ) AND  
         				( "VISTA_DETALLE_CIERRE_VTA"."COD_SUP" = :ls_cod_sup ) AND
						( "VISTA_DETALLE_CIERRE_VTA"."COD_JEF" = :ls_cod_jef ) AND
         				( "VISTA_DETALLE_CIERRE_VTA"."CIERRE_VENTA" = :ldt_fecha ) AND  
         				( "VISTA_DETALLE_CIERRE_VTA"."CONEXION" = :ls_conexion ) AND
						( "VISTA_DETALLE_CIERRE_VTA"."BASE" = 'L' )
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if (not isnull(ll_cta_lib) or ll_cta_lib>0) and (not isnull(ldb_uf_lib) or ldb_uf_lib>0) then
					ll_cta_lib											= ll_cta_lib
					ldb_uf_lib										= ldb_uf_lib
				else
					ll_cta_lib											= 0
					ldb_uf_lib										= 0
				end if
			else
				ll_cta_lib												= 0
				ldb_uf_lib											= 0
			end if
			SELECT	COUNT("BASE"),SUM("PRECIO_UF")
			INTO		:ll_cta_aum,:ldb_uf_aum		
    			FROM 	"VISTA_DETALLE_CIERRE_VTA"  
   			WHERE	( "VISTA_DETALLE_CIERRE_VTA"."COD_PARQUE" = :ll_cod_parque ) AND  
         				( "VISTA_DETALLE_CIERRE_VTA"."COD_SUP" = :ls_cod_sup ) AND
						( "VISTA_DETALLE_CIERRE_VTA"."COD_JEF" = :ls_cod_jef ) AND
         				( "VISTA_DETALLE_CIERRE_VTA"."CIERRE_VENTA" = :ldt_fecha ) AND  
         				( "VISTA_DETALLE_CIERRE_VTA"."CONEXION" = :ls_conexion ) AND
						( "VISTA_DETALLE_CIERRE_VTA"."BASE" = 'A' )
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if (not isnull(ll_cta_aum) or ll_cta_aum>0) and (not isnull(ldb_uf_aum) or ldb_uf_aum>0) then
					ll_cta_aum										= ll_cta_aum
					ldb_uf_aum										= ldb_uf_aum
				else
					ll_cta_aum										= 0
					ldb_uf_aum										= 0
				end if
			else
				ll_cta_aum											= 0
				ldb_uf_aum											= 0
			end if
			
			ll_new														= dw_cierre_ventas.insertrow(0)
			dw_cierre_ventas.scrolltorow(ll_new)
			dw_cierre_ventas.setitem(ll_new,"conexion",ls_conexion)
			dw_cierre_ventas.setitem(ll_new,"cod_parque",ll_cod_parque)
			dw_cierre_ventas.setitem(ll_new,"cod_jef",ls_jefe_venta)
			dw_cierre_ventas.setitem(ll_new,"fech_ing_jef",ldt_fech_ing_jef)
			dw_cierre_ventas.setitem(ll_new,"cod_sup",ls_superv)
			dw_cierre_ventas.setitem(ll_new,"fech_ing_sup",ldt_fech_ing_sup)
			dw_cierre_ventas.setitem(ll_new,"promesa_cta",ll_cta_pro)
			dw_cierre_ventas.setitem(ll_new,"promesa_uf",ldb_uf_pro)
			dw_cierre_ventas.setitem(ll_new,"libera_cta",ll_cta_lib)
			dw_cierre_ventas.setitem(ll_new,"libera_uf",ldb_uf_lib)
			dw_cierre_ventas.setitem(ll_new,"aumento_cta",ll_cta_aum)
			dw_cierre_ventas.setitem(ll_new,"aumento_uf",ldb_uf_aum)
		end if
		setnull(ls_conexion);setnull(ll_cod_parque)
	LOOP
end if
close x1;

end event

type cb_cerrar from commandbutton within w_resumen_cierre_ventas
integer x = 2999
integer y = 1648
integer width = 297
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_resumen_cierre_ventas)
end event

type gb_3 from groupbox within w_resumen_cierre_ventas
integer x = 1417
integer y = 1616
integer width = 521
integer height = 156
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

