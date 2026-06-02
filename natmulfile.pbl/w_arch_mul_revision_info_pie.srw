forward
global type w_arch_mul_revision_info_pie from wa_response
end type
end forward

global type w_arch_mul_revision_info_pie from wa_response
integer width = 2505
integer height = 968
string title = "Calculadora Pie"
integer ii_headerheight = 100
end type
global w_arch_mul_revision_info_pie w_arch_mul_revision_info_pie

type variables

MP mp
end variables

on w_arch_mul_revision_info_pie.create
call super::create
end on

on w_arch_mul_revision_info_pie.destroy
call super::destroy
end on

event open;call super::open;
MP = Message.PowerObjectParm

dw_1.InsertRow( 1 )
//dw_1.Object.CodigoMP[ 1] = MP.Codigomp
//dw_1.Object.Barra[ 1] = MP.Barra
//dw_1.Object.Base[ 1] = MP.Base
//dw_1.Object.Serie[ 1] = MP.Serie
//dw_1.Object.Numero[ 1] = MP.Numero

dw_1.Object.Moneda[ 1]	= MP.Moneda
dw_1.Object.Precio[ 1]	= MP.Precio
dw_1.Object.PorcentajePie[ 1] = MP.PorcentajePie
dw_1.Object.PieMinimo[ 1] = MP.PieMinimo
dw_1.Object.Pie[ 1]		= MP.Pie
dw_1.Object.UF[ 1]		= MP.UF
dw_1.Object.PiePesos[ 1]		= MP.PiePesos


dw_1.Accepttext( )

dw_1.SetObjectcolor( 'Moneda', 'ba' )
dw_1.SetObjectcolor( 'PieMinimo', 'st' )
dw_1.SetObjectcolor( 'nPorcentajePie', 'nPorcentajePie > 100 Or nPie < PieMinimo', {'bx', 't'} )
dw_1.SetObjectcolor( 'nPie', 'nPorcentajePie > 100 Or nPie < PieMinimo', {'bx', 't'} )
dw_1.ColEnabled( {'Precio', 'PorcentajePie', 'Pie', 'UF', 'PiePesos' }, False )
dw_1.ColEnabled( {'nPrecio', 'nPorcentajePie', 'nPie', 'nUF' }, False )


end event

type dw_list from wa_response`dw_list within w_arch_mul_revision_info_pie
boolean visible = false
integer y = 812
boolean enabled = false
boolean border = false
end type

type dw_1 from wa_response`dw_1 within w_arch_mul_revision_info_pie
integer width = 2597
integer height = 736
string dataobject = "d_arch_mul_revision_info_pie"
end type

event dw_1::itemchanged;call super::itemchanged;
Choose Case dwo.Name
	Case 'npiepesos'
		Dec	nPie
		
		Accepttext( )
		If MP.Moneda = '2' Then
			nPie = dw_1.Object.nPiePesos[ 1] / dw_1.Object.nUF[ 1]
		Else
			nPie = dw_1.Object.nPiePesos[ 1]
		End If
		dw_1.Object.nPie[ 1] = nPie
		dw_1.Object.nPorcentajePie[ 1] = nPie * 100 / MP.Precio 
		
End Choose		

Accepttext( )

end event

type cb_cancelar from wa_response`cb_cancelar within w_arch_mul_revision_info_pie
integer x = 2007
integer y = 764
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_mul_revision_info_pie
integer x = 1627
integer y = 764
end type

event cb_aceptar::clicked;call super::clicked;

dw_1.AcceptText( )
MP.Moneda = dw_1.Object.Moneda[ 1]
MP.PorcentajePie = dw_1.Object.nPorcentajePie[ 1] 
MP.Pie = dw_1.Object.nPie[ 1]
MP.UF = dw_1.Object.UF[ 1]
MP.PiePesos = MP.Pie
If MP.Moneda = '2' Then
	MP.PiePesos = MP.Pie * MP.UF
End If

If MP.PieMinimo > MP.Pie Then
	blEclipse.MessageBox( Title, 'Pie Calculado no puede ser menor al Pie Mínimo.', Exclamation! )
	dw_1.SetFocus( 'nPiePesos' )
	Return
End If

If MP.PorcentajePie > 100 Then
	blEclipse.MessageBox( Title, 'Porcentaje Pie calculado no puede ser mayor al 100%.', Exclamation! )
	dw_1.SetFocus( 'nPiePesos' )
	Return
End If

CloseWithReturn( Parent, MP )

end event

