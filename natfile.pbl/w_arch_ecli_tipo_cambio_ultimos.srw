//objectcomments Autor: César Vilela~r~nFunción: Debe mostrar 5 últimos
forward
global type w_arch_ecli_tipo_cambio_ultimos from wa_response
end type
end forward

global type w_arch_ecli_tipo_cambio_ultimos from wa_response
integer width = 960
integer height = 1140
string title = "Tipo de Cambio - Últimos"
boolean controlmenu = false
end type
global w_arch_ecli_tipo_cambio_ultimos w_arch_ecli_tipo_cambio_ultimos

on w_arch_ecli_tipo_cambio_ultimos.create
call super::create
end on

on w_arch_ecli_tipo_cambio_ultimos.destroy
call super::destroy
end on

event open;call super::open;
dw_list.Retrieve( )


end event

type dw_list from wa_response`dw_list within w_arch_ecli_tipo_cambio_ultimos
integer x = 37
integer y = 32
integer width = 864
integer height = 832
integer taborder = 0
string dataobject = "d_arch_ecli_tipo_cambio_ultimos"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type dw_1 from wa_response`dw_1 within w_arch_ecli_tipo_cambio_ultimos
integer width = 1056
integer height = 888
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_ecli_tipo_cambio_ultimos
integer x = 539
integer y = 928
end type

event cb_cancelar::clicked;s_parm	lstr_parm


lstr_parm.n_num[ 1] = 0

CloseWithReturn( Parent, lstr_parm )
end event

type cb_aceptar from wa_response`cb_aceptar within w_arch_ecli_tipo_cambio_ultimos
integer x = 160
integer y = 928
boolean enabled = true
end type

event cb_aceptar::clicked;call super::clicked;DateTime	ld_tc
Decimal	ldc_tc
Long		ll_row
String	ls_ser, ls_usd
s_parm	lstr_parm


If dw_list.RowCount( ) <= 0 Then Return

dw_list.AcceptText( )

ll_row = dw_list.GetRow( )
ldc_tc = dw_list.Object.n_tipcam_tic[ ll_row]
ld_tc = dw_list.Object.d_tipcam_tic[ ll_row]

lstr_parm.n_num[ 1] = ldc_tc
lstr_parm.d_fecha[ 1] = ld_tc

CloseWithReturn( Parent, lstr_parm )
end event

