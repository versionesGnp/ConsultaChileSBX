forward
global type w_busqueda_sep_directa from window
end type
type st_2 from statictext within w_busqueda_sep_directa
end type
type st_1 from statictext within w_busqueda_sep_directa
end type
type ddlb_2 from dropdownlistbox within w_busqueda_sep_directa
end type
type ddlb_1 from dropdownlistbox within w_busqueda_sep_directa
end type
type cb_2 from commandbutton within w_busqueda_sep_directa
end type
type gb_1 from groupbox within w_busqueda_sep_directa
end type
end forward

global type w_busqueda_sep_directa from window
integer width = 1074
integer height = 808
boolean titlebar = true
string title = "Busqueda Directa"
boolean controlmenu = true
long backcolor = 67108864
st_2 st_2
st_1 st_1
ddlb_2 ddlb_2
ddlb_1 ddlb_1
cb_2 cb_2
gb_1 gb_1
end type
global w_busqueda_sep_directa w_busqueda_sep_directa

type variables
integer id_parque
end variables

forward prototypes
public subroutine wf_limpiar ()
end prototypes

public subroutine wf_limpiar ();integer i,j,corr
long    registros,sep_jardin
double  pos
string  sep_const,posicio_x,posicio_y,spos,smax

setnull(posicio_x);setnull(posicio_y)
//---------------Limpia en Sectores Tierra---------------
if w_plano_sector_parque.dw_plano_sector_parque.dataobject = 'dw_plano_sector_parque_retrieve' then
	registros = w_plano_sector_parque.dw_plano_sector_parque.rowcount()
	if registros > 0 then
		for i = 1 to registros
			for j = 3 to 80
				sep_jardin = w_plano_sector_parque.dw_plano_sector_parque.getitemnumber(i,j)
				if sep_jardin <> 0 then
					w_plano_sector_parque.dw_plano_sector_parque.setitem(i,'boton_1',1000000)
					w_plano_sector_parque.dw_plano_sector_parque.Modify('r_1.visible = false')
				end if
			next
		next
	end if
else//---------------Limpia en Sectores Construidos---------------
	registros = w_plano_sector_parque.dw_plano_sector_parque.rowcount()
	if registros > 0 then
		for i = 1 to registros
			for j = 3 to 80
				sep_const = w_plano_sector_parque.dw_plano_sector_parque.getitemstring(i,j)
				if sep_const <> '0' then
					w_plano_sector_parque.dw_plano_sector_parque.setitem(i,'boton_1','1000000')
					w_plano_sector_parque.dw_plano_sector_parque.Modify('r_1.visible = false')
				end if
			next
		next
	end if
end if
end subroutine

event open;string ls_sql
environment env
integer rtn
w_plano_sector_parque.dw_plano_sector_parque.enabled = false
rtn 			= GetEnvironment(env)
IF rtn <> 1 THEN RETURN 0
gf_centrar(w_busqueda_sep_directa)

setnull(gi_tipo_busqueda)
setnull(gi_rut)
setnull(gs_apellido_paterno)
setnull(gs_apellido_materno)
setnull(gs_nombres)
//st_2.text = gs_sector

id_parque 	= integer(w_plano_sector_parque.st_parque.text)


ls_sql = 'SELECT DISTINCT SECTOR FROM BASE_PLANI WHERE COD_PARQUE = '+string(id_parque)
f_ddlb_all(ddlb_1,ls_sql)
end event

on w_busqueda_sep_directa.create
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.cb_2=create cb_2
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.st_1,&
this.ddlb_2,&
this.ddlb_1,&
this.cb_2,&
this.gb_1}
end on

on w_busqueda_sep_directa.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.cb_2)
destroy(this.gb_1)
end on

event close;w_plano_sector_parque.dw_plano_sector_parque.enabled = true
end event

type st_2 from statictext within w_busqueda_sep_directa
integer x = 69
integer y = 312
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Sepultura"
boolean focusrectangle = false
end type

type st_1 from statictext within w_busqueda_sep_directa
integer x = 69
integer y = 120
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Sector"
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_busqueda_sep_directa
integer x = 69
integer y = 388
integer width = 905
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
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;integer i,j,corr
long    registros,sep_jardin
double  pos
string  sep_const,posicio_x,posicio_y,spos,smax

SetPointer(HourGlass!)
setnull(posicio_x);setnull(posicio_y)
wf_limpiar()
//---------------Busqueda en sectores Tierra---------------
if w_plano_sector_parque.dw_plano_sector_parque.dataobject = 'dw_plano_sector_parque_retrieve' then
	registros = w_plano_sector_parque.dw_plano_sector_parque.rowcount()
	if registros > 0 then
		for i = 1 to registros
			for j = 3 to 80
				sep_jardin = w_plano_sector_parque.dw_plano_sector_parque.getitemnumber(i,j)
				w_plano_sector_parque.dw_plano_sector_parque.setitem(i,'boton_1',10000000)
				if sep_jardin <> 0 then
					if sep_jardin = long(ddlb_2.text) then
						w_plano_sector_parque.dw_plano_sector_parque.setitem(i,'boton_1',sep_jardin)
						w_plano_sector_parque.dw_plano_sector_parque.Modify('r_1.visible = true')
						w_plano_sector_parque.dw_plano_sector_parque.Modify("DataWindow.HorizontalScrollPosition = 0")
						spos = w_plano_sector_parque.dw_plano_sector_parque.Describe('campo'+string(j)+'.x')
						if integer(spos) < 1000 then spos = '0'
						w_plano_sector_parque.dw_plano_sector_parque.Modify("DataWindow.HorizontalScrollPosition = " + string(integer(spos)/2))
						w_plano_sector_parque.dw_plano_sector_parque.ScrollToRow(i)
//						w_plano_sector_parque.st_21.text = w_plano_sector_parque.dw_plano_sector_parque.describe("DataWindow.HorizontalScrollPosition")
//						if cbx_1.checked = true then
//							corr = w_plano_sector_parque.dw_plano_sector_parque.getitemnumber(i,'plano_parque_correlativo')
//							OpenWithParm(w_busqueda_grafica,string(i)+'~t'+string(j)+'~t'+string(corr)+'~t'+'0'+'~t'+string(sep_jardin))
//						end if
						close(w_busqueda_sep_directa)
						return
//						exit
					end if
				end if
			next
		next
	end if
else//---------------Busqueda en sectores Construidas---------------
	registros = w_plano_sector_parque.dw_plano_sector_parque.rowcount()
	if registros > 0 then
		for i = 1 to registros
			for j = 3 to 80
				sep_const = w_plano_sector_parque.dw_plano_sector_parque.getitemstring(i,j)
				w_plano_sector_parque.dw_plano_sector_parque.setitem(i,'boton_1','10000000')
				if sep_const <> '0' then
					if sep_const = ddlb_2.text then
						w_plano_sector_parque.dw_plano_sector_parque.setitem(i,'boton_1',sep_const)
						w_plano_sector_parque.dw_plano_sector_parque.Modify('r_1.visible = true')
						w_plano_sector_parque.dw_plano_sector_parque.Modify("DataWindow.HorizontalScrollPosition = 0")
						spos = w_plano_sector_parque.dw_plano_sector_parque.Describe('plano_parque_const_campo'+string(j)+'.x')
						if integer(spos) < 1000 then spos = '0'
						w_plano_sector_parque.dw_plano_sector_parque.Modify("DataWindow.HorizontalScrollPosition = " + string(integer(spos)/2))
						w_plano_sector_parque.dw_plano_sector_parque.ScrollToRow(i)
//						w_plano_sector_parque.st_21.text = w_plano_sector_parque.dw_plano_sector_parque.describe("DataWindow.HorizontalScrollPosition")
//						if cbx_1.checked = true then
//							corr = w_plano_sector_parque.dw_plano_sector_parque.getitemnumber(i,'plano_parque_const_correlativo')
//							OpenWithParm(w_busqueda_grafica,string(i)+'~t'+string(j)+'~t'+string(corr)+'~t'+'1'+'~t'+sep_const)
//						end if
						close(w_busqueda_sep_directa)
						return
//						exit
					end if
				end if
			next
		next
	end if
end if
SetPointer(arrow!)
end event

type ddlb_1 from dropdownlistbox within w_busqueda_sep_directa
integer x = 69
integer y = 192
integer width = 905
integer height = 452
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_sql,ls_descrip_parque
string sector,tipo,ret_sector,parque
long capacidad,si

gs_sector = this.text

ddlb_2.reset()
ls_sql = 'SELECT DISTINCT SEPULTURA FROM INVENTARIO_PLANI WHERE COD_PARQUE = '+string(id_parque)+' AND SECTOR = '+"'"+ gs_sector+"'"
f_ddlb_all(ddlb_2,ls_sql)

si = 0
parque = string(id_parque)
w_plano_sector_parque.dw_jardin      	= 'dw_plano_sector_parque_retrieve'
w_plano_sector_parque.dw_construdida = 'dw_plano_sector_parque_retrieve_paint'
gs_sector = ddlb_1.text

w_plano_sector_parque.st_7.text = '100%'
SetPointer(HourGlass!)
SELECT distinct "PLANO_PARQUE_CONST"."SECTOR" INTO :ret_sector FROM "PLANO_PARQUE_CONST"  
WHERE "PLANO_PARQUE_CONST"."SECTOR" = :gs_sector AND "PLANO_PARQUE_CONST"."COD_PARQUE" = :id_parque  ;
if sqlca.sqlcode = 0 then
	w_plano_sector_parque.dw_plano_sector_parque.dataobject = w_plano_sector_parque.dw_construdida
	DECLARE sp_plani_const_paint PROCEDURE FOR SP_PLANIMETRIA_CONST_PAINT_PP(:gs_sector,:id_parque,0 ) ;
	execute sp_plani_const_paint;
	w_plano_sector_parque.dw_plano_sector_parque.settransobject(sqlca)
	if w_plano_sector_parque.dw_plano_sector_parque.retrieve(gs_sector,id_parque) > 0 then
		w_plano_sector_parque.dw_plano_sector_parque.setsort( "correlativo A")
		w_plano_sector_parque.dw_plano_sector_parque.sort( )
		si ++
	else
		w_plano_sector_parque.dw_plano_sector_parque.dataobject = 'dw_no_hay_datos'
	end if
else
	w_plano_sector_parque.dw_plano_sector_parque.dataobject = w_plano_sector_parque.dw_jardin
	DECLARE sp_plani_paint PROCEDURE FOR SP_PLANIMETRIA_PAINT_PP(:gs_sector,:id_parque,'0' ) ;
	execute sp_plani_paint;
	if sqlca.sqlcode = -1 then
		MessageBox("SQL error", SQLCA.SQLErrText)
	end if
	w_plano_sector_parque.dw_plano_sector_parque.settransobject(sqlca)
	if w_plano_sector_parque.dw_plano_sector_parque.retrieve(gs_sector,id_parque) > 0 then
		w_plano_sector_parque.dw_plano_sector_parque.setsort( "correlativo A")
		w_plano_sector_parque.dw_plano_sector_parque.sort()
		si ++
	else
		w_plano_sector_parque.dw_plano_sector_parque.dataobject = 'dw_no_hay_datos'
	end if
end if
SetPointer(arrow!)

if si > 0 then
	w_plano_sector_parque.dw_plano_sector_parque.object.t_21.text = 'User: '+gs_user
	SELECT	"COD_PARQ"."NOMBRE"  
	INTO		:ls_descrip_parque  
	FROM		"COD_PARQ"  
	WHERE	"COD_PARQ"."CODIGO" = :id_parque   ;
//	if id_parque = 1 then
		w_plano_sector_parque.dw_plano_sector_parque.object.t_20.text = 'Parque '+ls_descrip_parque
//	elseif id_parque = 11 then
//		w_plano_sector_parque.dw_plano_sector_parque.object.t_20.text = 'Parque La Foresta'
//	elseif id_parque = 102 then
//		w_plano_sector_parque.dw_plano_sector_parque.object.t_20.text = 'Parque El Manantial'
//	elseif id_parque = 103 then
//		w_plano_sector_parque.dw_plano_sector_parque.object.t_20.text = 'Parque Santiago'
//	elseif id_parque = 105 then
//		w_plano_sector_parque.dw_plano_sector_parque.object.t_20.text = 'Parque Santiago Dos'
//	elseif id_parque = 801 then
//		w_plano_sector_parque.dw_plano_sector_parque.object.t_20.text = 'Parque Concepción'
//	end if
end if


//open(w_busqueda_sep_directa)
//close(w_busqueda_sep_directa)
end event

type cb_2 from commandbutton within w_busqueda_sep_directa
integer x = 613
integer y = 576
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_busqueda_sep_directa)
end event

type gb_1 from groupbox within w_busqueda_sep_directa
integer x = 27
integer y = 32
integer width = 987
integer height = 516
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Selección"
end type

