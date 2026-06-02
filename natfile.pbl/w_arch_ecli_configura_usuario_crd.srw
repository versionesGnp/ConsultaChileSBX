//objectcomments /* Autor: César Vilela ~r~n    Función: usuario CRD~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_usuario_crd from wa_response
end type
type cb_print from uo_cbother within w_arch_ecli_configura_usuario_crd
end type
end forward

global type w_arch_ecli_configura_usuario_crd from wa_response
integer width = 3922
integer height = 1372
string title = "Clave de Coordenadas"
boolean controlmenu = false
cb_print cb_print
end type
global w_arch_ecli_configura_usuario_crd w_arch_ecli_configura_usuario_crd

forward prototypes
public subroutine wf_genera ()
public function boolean wf_esduplicado (string as_crd)
end prototypes

public subroutine wf_genera ();
Integer	li_crd, i, j, li_rand 
String	ls_crd, ls_char, ls_row, ls_col


Randomize(0)

f_GenProcesando( 'Generando coordenadas...' )
For i = 1 To 10
	ls_char = Char( 64 + i )
	For j = 1 To 5
		ls_row = String( j )
		ls_crd = ''
		ls_col = 'c_' + Lower( ls_char + ls_row )
		dw_1.SetItem( 1, ls_col, ls_crd )
	Next
Next

dw_1.AcceptText( )
For i = 1 To 10
	//f_GenProcesando( 'Generando coordenadas...' )
	ls_char = Char( 64 + i )
	For j = 1 To 5
		Do While True
			li_crd = Rand( 99 )
			ls_row = String( j )
			ls_crd = String( li_crd, '00' )
			If Not wf_EsDuplicado( ls_crd ) Then Exit
		Loop
		ls_col = 'c_' + Lower( ls_char + ls_row )
		dw_1.SetItem( 1, ls_col, ls_crd )
		li_rand ++
		dw_1.AcceptText( )
		//f_GenProcesando( 'Generando coordenada Nº ' + ls_crd )
		//Randomize(li_rand * 10)
	Next
	f_Delay( 1 ) 
	SetRedraw( True )
Next

Randomize(0)
f_GenProcesando( '' )
cb_aceptar.Enabled = False

end subroutine

public function boolean wf_esduplicado (string as_crd);
Integer	li_crd, i, j, li_rand 
String	ls_crd, ls_char, ls_row, ls_col


dw_1.AcceptText( )

For i = 1 To 10
	ls_char = Char( 64 + i )
	For j = 1 To 5
		ls_row = String( j )
		ls_crd = ''
		ls_col = 'c_' + Lower( ls_char + ls_row )
		ls_crd  = dw_1.GetItemString( 1, ls_col )
		If as_crd = ls_crd Then
			Return True
		End If
	Next
Next

Return False

end function

on w_arch_ecli_configura_usuario_crd.create
int iCurrent
call super::create
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
end on

on w_arch_ecli_configura_usuario_crd.destroy
call super::destroy
destroy(this.cb_print)
end on

event open;call super::open;
String	ls_usu


ls_usu = Message.StringParm

If dw_1.Retrieve( ls_usu ) <= 0 Then
	dw_1.InsertRow( 0 )
	dw_1.Object.c_codigo_usu[ 1] = ls_usu
Else
	dw_1.Object.cb_generar.Text = 'Volver a Generar'
End If


end event

type dw_list from wa_response`dw_list within w_arch_ecli_configura_usuario_crd
boolean visible = false
integer y = 848
integer width = 631
integer height = 432
integer taborder = 0
boolean enabled = false
string dataobject = "d_rpt_ecli_configura_usuario_crd"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean livescroll = false
end type

event dw_list::constructor;// 
end event

event dw_list::retrieveend;call super::retrieveend; SelectRow( 0, False )
end event

type dw_1 from wa_response`dw_1 within w_arch_ecli_configura_usuario_crd
integer width = 3922
integer height = 1128
string dataobject = "d_arch_ecli_configura_usuario_crd"
end type

event dw_1::buttonclicked;call super::buttonclicked;

Choose Case dwo.Name 
	Case 'cb_generar'
		wf_Genera( )
		cb_aceptar.Enabled = True
		This.Object.cb_generar.Text = 'Volver a Generar'

End Choose
end event

type cb_cancelar from wa_response`cb_cancelar within w_arch_ecli_configura_usuario_crd
integer x = 3424
integer y = 1164
end type

event cb_cancelar::clicked;s_parm	lstr_parm


lstr_parm.s_cad[ 1] = ''
lstr_parm.n_num[ 1] = 0

CloseWithReturn( Parent, lstr_parm )
end event

type cb_aceptar from wa_response`cb_aceptar within w_arch_ecli_configura_usuario_crd
integer x = 3045
integer y = 1164
end type

event cb_aceptar::clicked;call super::clicked;
dw_1.AcceptText( )

If Not dw_1.Update( ) = 1 Then
	RollBack Using SqlCa ;
	MessageBox( Title, 'No se pudo guardar tarjeta digital de clave de coordenadas.', Exclamation! )
	Return
End If

Commit Using SqlCa ;

end event

type cb_print from uo_cbother within w_arch_ecli_configura_usuario_crd
integer x = 2665
integer y = 1164
integer taborder = 40
boolean bringtotop = true
string text = "Imprimir"
end type

event clicked;call super::clicked;
String	ls_usu


dw_1.AcceptText( )
ls_usu = f_Trim( dw_1.Object.c_codigo_usu[ 1] )

dw_list.SetTransObject( SqlCa )
If Not dw_list.Retrieve( ls_usu ) > 0 Then
	MessageBox( Title, 'No se ha generado tarjeta de Clave de Coordenadas.' + Char(13) + &
								'No se puede continuar.', Exclamation! )
	Return
End If

f_Print( dw_list )

Return 
end event

