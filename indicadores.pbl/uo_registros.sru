forward
global type uo_registros from userobject
end type
type hpb_1 from hprogressbar within uo_registros
end type
type st_reg from statictext within uo_registros
end type
type st_1 from statictext within uo_registros
end type
end forward

global type uo_registros from userobject
integer width = 1230
integer height = 548
long backcolor = 80269524
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
hpb_1 hpb_1
st_reg st_reg
st_1 st_1
end type
global uo_registros uo_registros

on uo_registros.create
this.hpb_1=create hpb_1
this.st_reg=create st_reg
this.st_1=create st_1
this.Control[]={this.hpb_1,&
this.st_reg,&
this.st_1}
end on

on uo_registros.destroy
destroy(this.hpb_1)
destroy(this.st_reg)
destroy(this.st_1)
end on

type hpb_1 from hprogressbar within uo_registros
integer x = 46
integer y = 392
integer width = 1120
integer height = 88
unsignedinteger minposition = 1
unsignedinteger maxposition = 100
integer setstep = 10
end type

type st_reg from statictext within uo_registros
integer x = 55
integer y = 256
integer width = 1097
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within uo_registros
integer x = 55
integer y = 104
integer width = 1097
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "El Proceso tardará algunos segundos"
alignment alignment = center!
boolean focusrectangle = false
end type

