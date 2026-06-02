forward
global type w_base_plani from window
end type
type dw_2 from datawindow within w_base_plani
end type
type cb_2 from commandbutton within w_base_plani
end type
type cb_1 from commandbutton within w_base_plani
end type
end forward

global type w_base_plani from window
integer x = 741
integer y = 600
integer width = 2185
integer height = 1204
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
end type
global w_base_plani w_base_plani

on w_base_plani.create
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_2,&
this.cb_2,&
this.cb_1}
end on

on w_base_plani.destroy
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;integer i,total
string area
dw_2.ImportFile("C:\desarrollo\planimetria\correcto.TXT")
dw_2.accepttext ()

//if dw_2.retrieve() > 0 then
//	for i = 1 to dw_2.rowcount()
//		area = dw_2.getitemstring(i,'area')
//		total = dw_2.getitemnumber(i,'total')
//		  UPDATE "BASE_PLANI"  
//   	  SET "TOTAL_ASIGNADAS" = :total  
//	     WHERE "BASE_PLANI"."SECTOR" = :area   ;
//
//	next
//end if

end event

type dw_2 from datawindow within w_base_plani
integer x = 229
integer y = 108
integer width = 1765
integer height = 636
integer taborder = 10
string dataobject = "dw_archivo"
boolean livescroll = true
end type

type cb_2 from commandbutton within w_base_plani
integer x = 1646
integer y = 852
integer width = 247
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;close(w_base_plani)
end event

type cb_1 from commandbutton within w_base_plani
integer x = 133
integer y = 896
integer width = 247
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;integer i,total
string area


if dw_2.rowcount() > 0 then
	for i = 1 to dw_2.rowcount()
		area = dw_2.getitemstring(i,'area')
		total = dw_2.getitemnumber(i,'total')
		dw_2.SelectRow(0, FALSE)
		dw_2.SelectRow(i, TRUE)
		  UPDATE "BASE_PLANI"  
   	  SET "TOTAL_ASIGNADAS" = :total  
	     WHERE "BASE_PLANI"."SECTOR" = :area   ;
		  commit;
	next
end if

end event

