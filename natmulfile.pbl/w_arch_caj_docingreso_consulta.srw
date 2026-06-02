//objectcomments Autor: César Vilela R.~r~nFunción: Consulta list de contratos y sus doc. de ingresos
forward
global type w_arch_caj_docingreso_consulta from wa_response
end type
end forward

global type w_arch_caj_docingreso_consulta from wa_response
integer width = 3776
integer height = 1784
string title = "Consulta - Detalle Documento de Ingreso"
boolean controlmenu = false
windowanimationstyle openanimation = centeranimation!
boolean ib_posy = true
boolean ib_ind = true
end type
global w_arch_caj_docingreso_consulta w_arch_caj_docingreso_consulta

type variables

Boolean	ib_cli = False
String	is_aut
end variables

on w_arch_caj_docingreso_consulta.create
call super::create
end on

on w_arch_caj_docingreso_consulta.destroy
call super::destroy
end on

event open;call super::open;
Long		ll_fol
String	ls_tdo, ls_DB


istr_parm = Message.PowerObjectparm

ls_tdo = istr_parm.s_cad[ 1]
ll_fol = Long( istr_parm.s_cad[ 2] )
ls_DB  = istr_parm.s_cad[ 3]

dw_1.InsertRow(0)

dw_1.Event SetObjectColor( 'c_codigo_ing', 'o' )
dw_1.Event SetObjectColor( 'c_codigo_cto', 'ba' )
dw_list.SetObjectColor( 'v_nombre_gru', 'st' ) 


dw_list.Retrieve( gs_emp, ll_fol, ls_tdo, ls_DB )

If dw_list.Rowcount( ) <= 0 Then Return

dw_1.Object.c_codigo_tdo[ 1] = ls_tdo
dw_1.Object.folio[ 1] = ll_fol
dw_1.Object.c_codigo_ing[ 1] = dw_list.Object.c_codigo_ing[ 1]
dw_1.Object.d_documento_ing[ 1] = dw_list.Object.d_documento_ing[ 1]
dw_1.Object.c_rezago[ 1] = dw_list.Object.c_rezago[ 1]
dw_1.Object.c_codigo_cli[ 1] = dw_list.Object.c_codigo_cli[ 1]
dw_1.Object.v_nombre_cli[ 1] = dw_list.Object.v_nombre_cli[ 1]
dw_1.Object.c_codigo_cto[ 1] = dw_list.Object.c_codigo_cto[ 1]
dw_1.Object.nro_cupon[ 1] = dw_list.Object.nro_cupon[ 1]

dw_1.Accepttext( )

end event

type dw_list from wa_response`dw_list within w_arch_caj_docingreso_consulta
event ue_checkall ( )
integer x = 146
integer y = 344
integer width = 3474
integer height = 1172
integer taborder = 0
string dataobject = "d_arch_caj_docingreso_consulta_det"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean ib_detzebra = false
boolean ib_selectrow = false
integer ii_detheight = 80
end type

type dw_1 from wa_response`dw_1 within w_arch_caj_docingreso_consulta
integer width = 3794
integer height = 1544
string dataobject = "d_arch_caj_docingreso_consulta"
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_caj_docingreso_consulta
integer x = 3273
integer y = 1580
string text = "Cerrar"
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_caj_docingreso_consulta
boolean visible = false
integer x = 2853
integer y = 1580
boolean default = false
end type

