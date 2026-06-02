forward
global type w_busqueda_directa_sepultura from window
end type
type cb_2 from commandbutton within w_busqueda_directa_sepultura
end type
type cb_1 from commandbutton within w_busqueda_directa_sepultura
end type
type cbx_1 from checkbox within w_busqueda_directa_sepultura
end type
type st_2 from statictext within w_busqueda_directa_sepultura
end type
type cb_cancelar from commandbutton within w_busqueda_directa_sepultura
end type
type cb_buscar from commandbutton within w_busqueda_directa_sepultura
end type
type st_7 from statictext within w_busqueda_directa_sepultura
end type
type st_6 from statictext within w_busqueda_directa_sepultura
end type
type ddlb_sepultura from dropdownlistbox within w_busqueda_directa_sepultura
end type
type gb_3 from groupbox within w_busqueda_directa_sepultura
end type
end forward

global type w_busqueda_directa_sepultura from window
integer width = 1202
integer height = 760
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_2 cb_2
cb_1 cb_1
cbx_1 cbx_1
st_2 st_2
cb_cancelar cb_cancelar
cb_buscar cb_buscar
st_7 st_7
st_6 st_6
ddlb_sepultura ddlb_sepultura
gb_3 gb_3
end type
global w_busqueda_directa_sepultura w_busqueda_directa_sepultura

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

on w_busqueda_directa_sepultura.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cbx_1=create cbx_1
this.st_2=create st_2
this.cb_cancelar=create cb_cancelar
this.cb_buscar=create cb_buscar
this.st_7=create st_7
this.st_6=create st_6
this.ddlb_sepultura=create ddlb_sepultura
this.gb_3=create gb_3
this.Control[]={this.cb_2,&
this.cb_1,&
this.cbx_1,&
this.st_2,&
this.cb_cancelar,&
this.cb_buscar,&
this.st_7,&
this.st_6,&
this.ddlb_sepultura,&
this.gb_3}
end on

on w_busqueda_directa_sepultura.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.cb_cancelar)
destroy(this.cb_buscar)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.ddlb_sepultura)
destroy(this.gb_3)
end on

event open;string ls_sql
environment env
integer rtn

rtn = GetEnvironment(env)
IF rtn <> 1 THEN RETURN 0
gf_centrar(w_busqueda_directa_sepultura)

setnull(gi_tipo_busqueda)
setnull(gi_rut)
setnull(gs_apellido_paterno)
setnull(gs_apellido_materno)
setnull(gs_nombres)
st_2.text = gs_sector

id_parque = integer(w_plano_sector_parque.st_parque.text)


ls_sql = 'SELECT DISTINCT SEPULTURA FROM INVENTARIO_PLANI WHERE SECTOR = '+"'"+gs_sector+"'" +'  AND COD_PARQUE = '+string(id_parque)
f_ddlb_all(ddlb_sepultura,ls_sql)
end event

type cb_2 from commandbutton within w_busqueda_directa_sepultura
integer x = 1554
integer y = 204
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;//long numero,count_fall,count_reserv
//string ls_sector, ls_sep,ret
//
//ls_sector = 'G10'
//ls_sep = '2705C4'
//
//SELECT "INVENTARIO_PLANI"."NUMERO" INTO :numero FROM "INVENTARIO_PLANI"      
//WHERE ( "INVENTARIO_PLANI"."SECTOR" = :ls_sector ) AND ( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sep );   
//if ( numero > 0 and numero < 10000000 ) then   
//  SELECT count(1) INTO :count_fall     
//  FROM "FALLECIDOS"     
//  WHERE ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND ( "FALLECIDOS"."N_SEP" = :ls_sep );   
//  if count_fall > 0 then   
//	  ret= '2'   
//  else   
//	  ret= '1'   
//  end if   
//elseif numero = 10000000 then   
//  SELECT count(1) INTO :count_fall     
//  FROM "FALLECIDOS"     
//  WHERE ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND ( "FALLECIDOS"."N_SEP" = :ls_sep );   
//  if count_fall > 0 then   
//	  ret= '8'   
//  else   
//	  ret= '7'   
//  end if;   
//elseif numero = 0 then   
//  SELECT count(1) INTO :count_fall     
//  FROM "FALLECIDOS"     
//  WHERE ( "FALLECIDOS"."SECTOR" = :ls_sector ) AND ( "FALLECIDOS"."N_SEP" = :ls_sep );   
//  if count_fall > 0 then   
//	  SELECT count(1) INTO :count_reserv     
//	  FROM "RESERVA_SEPULTURA"     
//	  WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND     
//	  ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sep ) and ( "RESERVA_SEPULTURA"."ESTADO" = 1 );   
//	  if count_reserv > 0 then   
//		  ret= '6'   
//	  else
//		  ret= '4'
//	  end if   
//  else   
//	  SELECT count(1) INTO :count_reserv     
//	  FROM "RESERVA_SEPULTURA"     
//	  WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND     
//	  ( "RESERVA_SEPULTURA"."SEPULTURA" = :ls_sep ) and ( "RESERVA_SEPULTURA"."ESTADO" = 1 );   
//	  if count_reserv > 0 then   
//		  ret= '5'   
//	  else     
//		  ret= '3'  
//	  end if   
//  end if   
//end if   
//messagebox('Retorno','sector: '+ls_sector+' - sep: '+ls_sep +' - Retorno: '+ret)
end event

type cb_1 from commandbutton within w_busqueda_directa_sepultura
integer x = 640
integer y = 796
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;//long numero,count_fall,count_reserv
//string ret,sector,sep
//
//sector = 'A26'
//sep = '1336'
//SELECT NUMERO INTO :numero FROM INVENTARIO_PLANI WHERE ( SECTOR = :sector ) AND ( SEPULTURA = :sep );   
//
//if ( numero > 0 and numero < 10000000 ) then   
//  SELECT count(1) INTO :count_fall     
//  FROM "FALLECIDOS"     
//  WHERE ( "FALLECIDOS"."SECTOR" = :sector ) AND ( "FALLECIDOS"."N_SEP" = :sector );   
//  if count_fall > 0 then   
//	  ret= '2'   
//  else   
//	  ret= '1'   
//  end if   
//elseif numero = 10000000 then   
//  SELECT count(1) INTO :count_fall     
//  FROM "FALLECIDOS"     
//  WHERE ( "FALLECIDOS"."SECTOR" = :sector ) AND ( "FALLECIDOS"."N_SEP" = :sector );   
//  if count_fall > 0 then   
//	  ret= '8'   
//  else   
//	  ret= '7'   
//  end if   
//elseif numero = 0 then   
//  SELECT count(1) INTO :count_fall     
//  FROM "FALLECIDOS"     
//  WHERE ( "FALLECIDOS"."SECTOR" = :sector ) AND ( "FALLECIDOS"."N_SEP" = :sector );   
//  if count_fall > 0 then   
//	  SELECT count(1) INTO :count_reserv     
//	  FROM "RESERVA_SEPULTURA"     
//	  WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :sector ) AND     
//	  ( "RESERVA_SEPULTURA"."SEPULTURA" = :sector ) and ( "RESERVA_SEPULTURA"."ESTADO" = 1 );   
//	  if count_reserv > 0 then   
//		  ret= '6'   
//	  else
//		  ret= '4'
//	  end if   
//  else   
//	  SELECT count(1) INTO :count_reserv     
//	  FROM "RESERVA_SEPULTURA"     
//	  WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :sector ) AND     
//	  ( "RESERVA_SEPULTURA"."SEPULTURA" = :sector ) and ( "RESERVA_SEPULTURA"."ESTADO" = 1 );   
//	  if count_reserv > 0 then   
//		  ret= '5'   
//	  else     
//		  ret= '3'  
//	  end if   
//  end if   
//end if   
//messagebox(ret,ret)
//
end event

type cbx_1 from checkbox within w_busqueda_directa_sepultura
integer x = 46
integer y = 504
integer width = 535
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Busqueda Gráfica"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_busqueda_directa_sepultura
integer x = 489
integer y = 88
integer width = 571
integer height = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_busqueda_directa_sepultura
integer x = 741
integer y = 368
integer width = 366
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;
close(w_busqueda_directa_sepultura)
end event

type cb_buscar from commandbutton within w_busqueda_directa_sepultura
integer x = 46
integer y = 376
integer width = 366
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
boolean default = true
end type

event clicked;integer i,j,corr
long    registros,sep_jardin
double  pos
string  sep_const,posicio_x,posicio_y,spos,smax

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
					if sep_jardin = long(ddlb_sepultura.text) then
						w_plano_sector_parque.dw_plano_sector_parque.setitem(i,'boton_1',sep_jardin)
						w_plano_sector_parque.dw_plano_sector_parque.Modify('r_1.visible = true')
						w_plano_sector_parque.dw_plano_sector_parque.Modify("DataWindow.HorizontalScrollPosition = 0")
						spos = w_plano_sector_parque.dw_plano_sector_parque.Describe('campo'+string(j)+'.x')
						if integer(spos) < 1000 then spos = '0'
						w_plano_sector_parque.dw_plano_sector_parque.Modify("DataWindow.HorizontalScrollPosition = " + string(integer(spos)/2))
						w_plano_sector_parque.dw_plano_sector_parque.ScrollToRow(i)
						w_plano_sector_parque.st_21.text = w_plano_sector_parque.dw_plano_sector_parque.describe("DataWindow.HorizontalScrollPosition")
						if cbx_1.checked = true then
							corr = w_plano_sector_parque.dw_plano_sector_parque.getitemnumber(i,'plano_parque_correlativo')
							OpenWithParm(w_busqueda_grafica,string(i)+'~t'+string(j)+'~t'+string(corr)+'~t'+'0'+'~t'+string(sep_jardin))
						end if
						close(w_busqueda_directa_sepultura)
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
					if sep_const = ddlb_sepultura.text then
						w_plano_sector_parque.dw_plano_sector_parque.setitem(i,'boton_1',sep_const)
						w_plano_sector_parque.dw_plano_sector_parque.Modify('r_1.visible = true')
						w_plano_sector_parque.dw_plano_sector_parque.Modify("DataWindow.HorizontalScrollPosition = 0")
						spos = w_plano_sector_parque.dw_plano_sector_parque.Describe('plano_parque_const_campo'+string(j)+'.x')
						if integer(spos) < 1000 then spos = '0'
						w_plano_sector_parque.dw_plano_sector_parque.Modify("DataWindow.HorizontalScrollPosition = " + string(integer(spos)/2))
						w_plano_sector_parque.dw_plano_sector_parque.ScrollToRow(i)
						w_plano_sector_parque.st_21.text = w_plano_sector_parque.dw_plano_sector_parque.describe("DataWindow.HorizontalScrollPosition")
						if cbx_1.checked = true then
							corr = w_plano_sector_parque.dw_plano_sector_parque.getitemnumber(i,'plano_parque_const_correlativo')
							OpenWithParm(w_busqueda_grafica,string(i)+'~t'+string(j)+'~t'+string(corr)+'~t'+'1'+'~t'+sep_const)
						end if
						close(w_busqueda_directa_sepultura)
						return
//						exit
					end if
				end if
			next
		next
	end if
end if

end event

type st_7 from statictext within w_busqueda_directa_sepultura
integer x = 105
integer y = 204
integer width = 366
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Sepultura:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_busqueda_directa_sepultura
integer x = 105
integer y = 92
integer width = 366
integer height = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Sector:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_sepultura from dropdownlistbox within w_busqueda_directa_sepultura
integer x = 489
integer y = 204
integer width = 571
integer height = 964
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_busqueda_directa_sepultura
integer x = 46
integer y = 20
integer width = 1061
integer height = 324
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

