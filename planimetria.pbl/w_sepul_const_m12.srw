forward
global type w_sepul_const_m12 from window
end type
type cb_5 from commandbutton within w_sepul_const_m12
end type
type cb_3 from commandbutton within w_sepul_const_m12
end type
type cb_2 from commandbutton within w_sepul_const_m12
end type
type cb_4 from commandbutton within w_sepul_const_m12
end type
type dw_1 from datawindow within w_sepul_const_m12
end type
type cb_1 from commandbutton within w_sepul_const_m12
end type
end forward

global type w_sepul_const_m12 from window
integer width = 3387
integer height = 1056
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_4 cb_4
dw_1 dw_1
cb_1 cb_1
end type
global w_sepul_const_m12 w_sepul_const_m12

type variables
integer il_row
integer id_parque
end variables

on w_sepul_const_m12.create
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_4=create cb_4
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.cb_5,&
this.cb_3,&
this.cb_2,&
this.cb_4,&
this.dw_1,&
this.cb_1}
end on

on w_sepul_const_m12.destroy
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;string sepultura,numero
long i,folio,numero_cont,correlativo,CORRE
DataWindowChild idw_promesas
Double	contrato

id_parque = integer(w_plano_sector_parque.st_parque.text)
gs_ventana = 'w_sepul_const_m12'
f_valida_objeto()

w_plano_sector_parque.dw_plano_sector_parque.enabled = false
numero 				= Message.StringParm
gf_centrar(w_sepul_const_m12)
dw_1.settransobject(sqlca)
dw_1.retrieve(gs_sector,numero)
this.title = 'Sector: '+gs_sector
for i = 1 to dw_1.rowcount()
	numero_cont 	= dw_1.getitemnumber(i,'numero')
	correlativo 		= dw_1.getitemnumber(i,'correlativo')
	if numero_cont = 0 then
		SETNULL(folio)
		SELECT 	"RESERVA_SEPULTURA"."FOLIO_RESERVA",	"RESERVA_SEPULTURA"."CORRE_INVENTARIO"  
		INTO 		:FOLIO,													:CORRE   
		FROM 	"RESERVA_SEPULTURA"  
		WHERE 	( "RESERVA_SEPULTURA"."SECTOR" = :GS_SECTOR ) AND ( "RESERVA_SEPULTURA"."SEPULTURA" = :GS_SEPULTURA ) AND 
					( "RESERVA_SEPULTURA"."CORRE_INVENTARIO" = :correlativo ) AND   
					( ESTADO = 1 ) ;
		if not isnull(folio) and folio > 0 AND correlativo = CORRE then
			dw_1.setitem(i,'campo',3)// naranja
		else
			dw_1.setitem(i,'campo',2)//azul
		end if
	else
		dw_1.setitem(i,'campo',1)//verde
	end if
	setnull(folio)
next
end event

event close;//w_plano_sector_parque.cb_1.enabled = true
w_plano_sector_parque.dw_plano_sector_parque.enabled = true
id_parque = w_plano_sector_parque.id_parque
end event

type cb_5 from commandbutton within w_sepul_const_m12
integer x = 1047
integer y = 792
integer width = 489
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reservar"
end type

event clicked;string ls_var,sepultura
long i,numero_cont,folio,correlativo,CORRE

if il_row > 0 then
	gs_base   		= dw_1.getitemstring(il_row,'base')
	gs_serie  		= dw_1.getitemstring(il_row,'serie')
	gi_numero 		= dw_1.getitemnumber(il_row,'numero')
	gs_sepultura 	= dw_1.getitemstring(il_row,'sepultura')
	OpenWithParm(w_solicitud_reserva,string(dw_1.getitemnumber(il_row,'correlativo')))
end if

end event

type cb_3 from commandbutton within w_sepul_const_m12
integer x = 553
integer y = 792
integer width = 489
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta.Cte"
end type

event clicked;//gi_tipo_busqueda = 8// por cta cte
gi_tipo_busqueda = 1// por rut
Open(w_listado_contratos)
end event

type cb_2 from commandbutton within w_sepul_const_m12
integer x = 59
integer y = 792
integer width = 489
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Detalle"
end type

event clicked;open(w_detalle_sepultura)
end event

type cb_4 from commandbutton within w_sepul_const_m12
integer x = 2807
integer y = 792
integer width = 489
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

event clicked;//close(w_sepul_const_m12)
CloseWithReturn(parent, '1')
end event

type dw_1 from datawindow within w_sepul_const_m12
event post_event pbm_custom01
integer x = 59
integer y = 48
integer width = 3237
integer height = 720
integer taborder = 10
string title = "none"
string dataobject = "dw_sepul_const_m12"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event post_event;long 		i,folio
Double	numero_cont
//------------------------------------------------------------------------------------------------------------
for i = 1 to dw_1.rowcount()
	numero_cont 	= dw_1.getitemnumber(i,'numero')
	if numero_cont = 0 then
		SELECT 	"RESERVA_SEPULTURA"."FOLIO_RESERVA" 
		INTO 		:folio 
		FROM 	"RESERVA_SEPULTURA" 
		WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) AND ( "RESERVA_SEPULTURA"."SEPULTURA" = :	gs_sepultura ) AND 
		( "RESERVA_SEPULTURA"."ESTADO" = 1 ) and ( "RESERVA_SEPULTURA"."CORRE_INVENTARIO" = :i) ;
		if not isnull(folio) and folio > 0 then
			dw_1.setitem(i,'campo',3)// naranja
		else
			dw_1.setitem(i,'campo',2)//azul
		end if
	else
		dw_1.setitem(i,'campo',1)//verde
	end if
	setnull(folio)
next
//------------------------------------------------------------------------------------------------------------
end event

event rowfocuschanged;if il_row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;//string ls_var,sepultura
//long i,numero_cont,folio
//
//if row > 0 then
//	il_row = row
//	gs_base   = getitemstring(il_row,'base')
//	gs_serie  = getitemstring(il_row,'serie')
//	gi_numero = getitemnumber(il_row,'numero')
//	gs_sepultura = getitemstring(il_row,'sepultura')
//	open (w_acceso_asigna)
//	LS_VAR = Message.StringParm
//	if LS_VAR = 'XX1' then 	
////		cb_1.enabled = false
//		OpenWithParm(w_solicitud_reserva,string(getitemnumber(il_row,'correlativo')))//w_solicitud_reserva_const
//		PostEvent("post_event")
//	elseif LS_VAR = '' then
//		return
//	else
//		messagebox('No Tiene Acceso','No tiene acceso para modificar.',stopsign!)
//	end if
//end if
//
end event

event clicked;
if row > 0 then
	il_row = row
	gs_sepultura 	= dw_1.getitemstring(il_row,'sepultura')
	gi_rut       		= dw_1.getitemnumber(il_row,'rut')
	gs_base      		= dw_1.getitemstring(il_row,'base')
	gs_serie     		= dw_1.getitemstring(il_row,'serie')
	gi_numero    	= dw_1.getitemnumber(il_row,'numero')
end if
end event

type cb_1 from commandbutton within w_sepul_const_m12
integer x = 1541
integer y = 792
integer width = 489
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Libera Promesa."
end type

event clicked;string ls_var,sepultura
if il_row > 0 then
	gs_base   	 = dw_1.getitemstring(il_row,'base')
	gs_serie  	 = dw_1.getitemstring(il_row,'serie')
	gi_numero 	 = dw_1.getitemnumber(il_row,'numero')
	gs_sepultura = dw_1.getitemstring(il_row,'sepultura')
	OpenWithParm(w_libera_sepultura_const,string(dw_1.getitemnumber(il_row,'correlativo')))
end if
end event

