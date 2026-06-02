//objectcomments Calendario
forward
global type w_calendar from window
end type
type p_next from picture within w_calendar
end type
type st_fecha from statictext within w_calendar
end type
type cb_cancel from commandbutton within w_calendar
end type
type cb_ok from commandbutton within w_calendar
end type
type p_prior from picture within w_calendar
end type
type dw_1 from datawindow within w_calendar
end type
end forward

global type w_calendar from window
integer x = 832
integer y = 360
integer width = 1024
integer height = 1172
boolean titlebar = true
string title = "Calendario"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
p_next p_next
st_fecha st_fecha
cb_cancel cb_cancel
cb_ok cb_ok
p_prior p_prior
dw_1 dw_1
end type
global w_calendar w_calendar

type variables
int ii_old_cell, ii_total_dia, ii_DayNum

Long il_color_today, il_color_selected
Long il_color_default

/* Días */
Int ii_agno, ii_mes, ii_dia, ii_cell_hoy

String is_fecha

end variables

forward prototypes
public function integer wf_dias_del_mes (integer ai_mes, integer ai_agno)
public subroutine wf_hoy ()
public subroutine wf_ingreso_dias ()
public subroutine wf_carga ()
public subroutine wf_carga_fecha ()
public function string wf_name_month (integer ai_month)
end prototypes

public function integer wf_dias_del_mes (integer ai_mes, integer ai_agno);Int li_DaysInMonth
Boolean lb_LeapYear

CHOOSE CASE ai_mes
	CASE 1, 3, 5, 7, 8, 10, 12
		li_DaysInMonth = 31
	CASE 4, 6, 9, 11
		li_DaysInMonth = 30
	CASE 2
		If Mod(ai_agno,4) = 0 then 
			lb_LeapYear = True
		elseIf Mod(ai_agno,100) = 0 then
			lb_LeapYear = False
		Else 
			lb_LeapYear = False
		End If
		If lb_LeapYear then
			li_DaysInMonth = 29
		Else
			li_DaysInMonth = 28
		End If
END CHOOSE

return li_DaysInMonth

end function

public subroutine wf_hoy ();//Día de Hoy

STRING ls_modify, ls_return
INT li_DayNum
DATE ld_FirstDay

IF ii_mes = Month(ToDay()) and ii_agno = Year(ToDay())THEN
	ld_FirstDay		= Date(ii_agno,ii_mes,1)				//1° Día del mes
	li_DayNum		= DayNumber(ld_FirstDay)				//N° del 1° Día
	li_DayNum		= li_DayNum + Day(ToDay()) - 1		//Celda del Día
	ls_Modify = "#" + string(li_DayNum) + ".border=6"
	ls_Return = Modify(dw_1,ls_Modify)
	ii_cell_hoy = li_DayNum
ELSEIF ii_cell_hoy > 0 THEN
	ls_Modify = "#" + string(ii_cell_hoy) + ".border=5"
	ls_Return = Modify(dw_1,ls_Modify)
END IF
end subroutine

public subroutine wf_ingreso_dias ();/* Ingresa días en el dw */

Int li_Count, li_DayCount, li_ult_dia
string	ls_modify, ls_Return

// Sin Número antes del mes
For li_Count = 1 to ii_daynum - 1
	dw_1.SetItem(1,li_Count,"")
Next

// Dias
For li_Count = 1 to ii_total_dia
	li_DayCount = ii_daynum + li_Count - 1
	dw_1.SetItem(1,li_DayCount,String(li_Count))
Next
li_ult_dia = li_DayCount + 1

// Sin Número despues del mes
For li_Count = li_ult_dia to 42
	dw_1.SetItem(1,li_Count,"")
Next

end subroutine

public subroutine wf_carga ();INT  li_cell
DATE ld_FirstDay
STRING ls_namemonth, ls_modify, ls_return

ii_total_dia	= wf_dias_del_mes(ii_mes,ii_agno)	//Total de días del mes
// Consistencia de fechas
IF ii_dia > ii_total_dia THEN ii_dia = ii_total_dia

ld_FirstDay		= Date(ii_agno,ii_mes,1)				//1° Día del mes
ii_DayNum		= DayNumber(ld_FirstDay)				//N° del 1° Día
li_cell 			= ii_DayNum + ii_dia - 1				//Celda del Día

ls_NameMonth	= wf_name_month(ii_mes) + " " + string(ii_agno)
dw_1.Modify("st_month.text=~"" + ls_nameMonth + "~"")	//Titulo del mes

wf_ingreso_dias()

wf_hoy() //destaca día de hoy

IF ii_old_cell <> 0 THEN // Normal día anterior
	ls_Modify = "#" + string(ii_old_cell) + ".BackGround.color="+STRING(il_color_default)
	ls_Return = dw_1.Modify(ls_Modify)
	ls_Modify = "#" + string(ii_old_cell) + ".color=0"
	ls_Return = dw_1.Modify(ls_Modify)
END IF

// Destaca día seleccionado
ls_Modify = "#" + string(li_cell) + ".BackGround.color="+STRING(il_color_selected)
ls_Return = Modify(dw_1,ls_Modify)
ls_Modify = "#" + string(li_cell) + ".color="+STRING(RGB(255,255,255))
ls_Return = Modify(dw_1,ls_Modify)

// Celda anterior
ii_old_cell = li_cell

end subroutine

public subroutine wf_carga_fecha ();st_fecha.text = STRING(ii_dia,"00")+'/'+STRING(ii_mes,"00")+'/'+STRING(ii_agno,"0000")
end subroutine

public function string wf_name_month (integer ai_month);String strMonth

CHOOSE CASE ai_month
	CASE 1
		strMonth = "Enero"
	CASE 2
		strMonth = "Febrero"
	CASE 3
		strMonth = "Marzo"
	CASE 4
		strMonth = "Abril"
	CASE 5
		strMonth = "Mayo"
	CASE 6
		strMonth = "Junio"
	CASE 7
		strMonth = "Julio"
	CASE 8
		strMonth = "Agosto"
	CASE 9
		strMonth = "Septiembre"
	CASE 10
		strMonth = "Octubre"
	CASE 11
		strMonth = "Noviembre"
	CASE 12
		strMonth = "Diciembre"
END CHOOSE

return strMonth

end function

on w_calendar.create
this.p_next=create p_next
this.st_fecha=create st_fecha
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.p_prior=create p_prior
this.dw_1=create dw_1
this.Control[]={this.p_next,&
this.st_fecha,&
this.cb_cancel,&
this.cb_ok,&
this.p_prior,&
this.dw_1}
end on

on w_calendar.destroy
destroy(this.p_next)
destroy(this.st_fecha)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.p_prior)
destroy(this.dw_1)
end on

event open;/* Ventana Utiliza Estructura Message. */

gf_centrar(w_calendar)
dw_1.InsertRow(0)

il_color_today		= RGB(0,0,0)	//Red, Hoy
il_color_selected	= RGB(255,0,0)	//Red, Día seleccionado
il_color_default	= RGB(192,192,192)

//st_hoy.BackColor = il_color_default
//st_hoy.TextColor = RGB(0,0,0)

//st_seleccionado.BackColor = il_color_selected
//st_seleccionado.TextColor = RGB(255,255,255)

/* dd/mm/yyyy */
ii_agno	= INTEGER(MID(Message.StringParm,7,4))
ii_mes	= INTEGER(MID(Message.StringParm,4,2))
ii_dia	= INTEGER(MID(Message.StringParm,1,2))

is_fecha = MID(Message.StringParm,1,10)
st_fecha.text = is_fecha

wf_carga()

end event

type p_next from picture within w_calendar
integer x = 841
integer y = 88
integer width = 82
integer height = 104
string picturename = "Flec_de.bmp"
boolean focusrectangle = false
end type

event clicked;
ii_mes++

IF ii_mes > 12 THEN
	ii_mes = 1
	ii_agno++
END IF

wf_carga()


wf_carga_fecha()


end event

type st_fecha from statictext within w_calendar
integer x = 50
integer y = 820
integer width = 891
integer height = 92
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 12632256
boolean enabled = false
string text = "none"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_calendar
integer x = 498
integer y = 920
integer width = 443
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;CloseWithReturn(Parent,is_fecha)


end event

type cb_ok from commandbutton within w_calendar
integer x = 50
integer y = 920
integer width = 443
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

event clicked;is_fecha = st_fecha.text
CloseWithReturn(Parent,is_fecha)

end event

type p_prior from picture within w_calendar
integer x = 55
integer y = 88
integer width = 91
integer height = 104
string picturename = "flec_iz.bmp"
boolean focusrectangle = false
end type

event clicked;
ii_mes = ii_mes - 1

IF ii_mes < 1 THEN
	ii_mes = 12
	ii_agno = ii_agno - 1
END IF

wf_carga()
wf_carga_fecha()

end event

type dw_1 from datawindow within w_calendar
integer x = 50
integer y = 56
integer width = 891
integer height = 760
integer taborder = 20
string dataobject = "d_calendar"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;String ls_ClickedColumn
Int li_cell
String ls_Modify, ls_Return

ls_ClickedColumn	= dwo.name
li_cell				= INTEGER(MID(ls_ClickedColumn,5))

IF li_cell = 0 THEN Return

IF li_cell < ii_daynum THEN Return

IF li_cell > ii_daynum + ii_total_dia - 1 THEN Return

IF li_cell <> ii_old_cell THEN
	ls_Modify = "#" + string(li_cell) + ".BackGround.color="+STRING(il_color_selected)
	ls_Return = dw_1.Modify(ls_Modify)
	If ls_Return <> "" then MessageBox("Modify",ls_Return)
	
	ls_Modify = "#" + string(li_cell) + ".color="+STRING(RGB(255,255,255))
	ls_Return = dw_1.Modify(ls_Modify)
	If ls_Return <> "" then MessageBox("Modify",ls_Return)
	
	ls_Modify = "#" + string(ii_old_cell) + ".BackGround.color="+STRING(il_color_default)
	ls_Return = dw_1.Modify(ls_Modify)
	If ls_Return <> "" then MessageBox("Modify",ls_Return)
	
	ls_Modify = "#" + string(ii_old_cell) + ".color=0"
	ls_Return = dw_1.Modify(ls_Modify)
	If ls_Return <> "" then MessageBox("Modify",ls_Return)

	ii_old_cell = li_cell
//	wf_hoy()
	
	ii_dia = li_cell - ii_DayNum + 1
	wf_carga_fecha()
END IF

end event

event doubleclicked;String ls_ClickedColumn
Int li_cell
String ls_Modify, ls_Return

ls_ClickedColumn	= dwo.name
li_cell				= INTEGER(MID(ls_ClickedColumn,5))

IF li_cell = 0 THEN Return

IF li_cell < ii_daynum THEN Return

IF li_cell > ii_daynum + ii_total_dia - 1 THEN Return

IF li_cell <> ii_old_cell THEN
	ls_Modify = "#" + string(li_cell) + ".BackGround.color="+STRING(il_color_selected)
	ls_Return = dw_1.Modify(ls_Modify)
	If ls_Return <> "" then MessageBox("Modify",ls_Return)
	
	ls_Modify = "#" + string(li_cell) + ".color="+STRING(RGB(255,255,255))
	ls_Return = dw_1.Modify(ls_Modify)
	If ls_Return <> "" then MessageBox("Modify",ls_Return)
	
	ls_Modify = "#" + string(ii_old_cell) + ".BackGround.color="+STRING(il_color_default)
	ls_Return = dw_1.Modify(ls_Modify)
	If ls_Return <> "" then MessageBox("Modify",ls_Return)
	
	ls_Modify = "#" + string(ii_old_cell) + ".color=0"
	ls_Return = dw_1.Modify(ls_Modify)
	If ls_Return <> "" then MessageBox("Modify",ls_Return)

	ii_old_cell = li_cell
//	wf_hoy()
	
	ii_dia = li_cell - ii_DayNum + 1
	wf_carga_fecha()
END IF
cb_ok.TriggerEvent(Clicked!)

end event

