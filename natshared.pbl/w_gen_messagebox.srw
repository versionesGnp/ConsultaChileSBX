//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - nuevo MessageBox de Eclipse, proporciona un nivel visual para WEB y Móvil~r~n    Recomendación: NO MODIFICAR~r~n*/
forward
global type w_gen_messagebox from wa_response
end type
type cb_ignorar from uo_cbother within w_gen_messagebox
end type
end forward

global type w_gen_messagebox from wa_response
integer width = 2098
integer height = 732
windowanimationstyle openanimation = centeranimation!
integer animationtime = 250
integer ii_headerheight = 0
cb_ignorar cb_ignorar
end type
global w_gen_messagebox w_gen_messagebox

on w_gen_messagebox.create
int iCurrent
call super::create
this.cb_ignorar=create cb_ignorar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ignorar
end on

on w_gen_messagebox.destroy
call super::destroy
destroy(this.cb_ignorar)
end on

event open;call super::open;
istr_parm = Message.PowerObjectParm

This.Title = istr_parm.s_cad[ 1]
dw_1.InsertRow(0) 
dw_1.Object.v_message[ 1] = istr_parm.s_cad[ 2]


Choose Case istr_parm.s_cad[ 3]
	Case 'Exclamation'
		dw_1.Object.v_icon[ 1] = 'Images\mbExclamation.png'
		
	Case 'Question'
		dw_1.Object.v_icon[ 1] = 'Images\mbQuestion.png'
		
	Case 'StopSign'
		dw_1.Object.v_icon[ 1] = 'Images\mbStopSign.png'
		
	Case Else
		dw_1.Object.v_icon[ 1] = 'Images\mb' + istr_parm.s_cad[ 3] + '.png'
		
End Choose

dw_1.AcceptText( )
dw_1.Object.icon.FileName = dw_1.Object.v_icon[ 1]


cb_ignorar.Visible = False

// Define Botón Default por Script
If istr_parm.s_cad[ 5] = '2' Then 
	cb_cancelar.Default = True
	cb_aceptar.Default = False
End If


Choose Case istr_parm.s_cad[ 4]
	Case 'YesNo'
		cb_aceptar.Text = '&Sí'
		cb_cancelar.Text = '&No'
		
	Case 'OkCancel'
		cb_aceptar.Text = 'Aceptar'
		cb_cancelar.Text = 'Cancelar'
		
	Case 'RetryCancel'
		cb_aceptar.Text = 'Reintentar'
		cb_cancelar.Text = 'Cancelar'
		
	Case 'YesNoCancel'
		Long	ll_x1, ll_x2, ll_x3
		
		ll_x1 = cb_ignorar.X
		ll_x2 = cb_aceptar.X
		ll_x3 = cb_cancelar.X
		
		cb_aceptar.X = ll_x1
		cb_cancelar.X = ll_x2
		cb_ignorar.X = ll_x3 
		
		cb_aceptar.Text = '&Sí'
		cb_cancelar.Text = '&No'
		cb_ignorar.Text = 'Cancelar'
		cb_ignorar.Enabled = True
		cb_ignorar.Visible = True

		cb_cancelar.Default = False
		cb_aceptar.Default = False
		cb_ignorar.Default = False
		
		Choose Case istr_parm.s_cad[ 5] 
			Case '2'  
				cb_cancelar.Default = True
			Case '3'  
				cb_ignorar.Default = True
			Case Else
				cb_aceptar.Default = True
		End Choose
		
	Case Else
		cb_aceptar.Text = 'Aceptar'
		cb_aceptar.X = cb_cancelar.X
		cb_cancelar.Visible = False
		cb_aceptar.cancel = True				
End Choose

dw_1.AcceptText( )

If Not UpperBound( istr_parm.s_cad[ ] ) > 5 Then Return

// Uso de Negritas
dw_1.Object.v_msgBold[ 1] = istr_parm.s_cad[ 6]
	
dw_1.AcceptText( )

end event

type dw_list from wa_response`dw_list within w_gen_messagebox
boolean visible = false
boolean enabled = false
end type

type dw_1 from wa_response`dw_1 within w_gen_messagebox
integer width = 2126
integer height = 480
string dataobject = "d_gen_messagebox"
boolean ib_procenter = false
boolean ib_ind = false
end type

type cb_cancelar from wa_response`cb_cancelar within w_gen_messagebox
integer x = 1627
integer y = 516
end type

event cb_cancelar::clicked;
CloseWithReturn( Parent, 2 )

end event

type cb_aceptar from wa_response`cb_aceptar within w_gen_messagebox
integer x = 1243
integer y = 516
boolean enabled = true
end type

event cb_aceptar::clicked;call super::clicked;
CloseWithReturn( Parent, 1 )

end event

type cb_ignorar from uo_cbother within w_gen_messagebox
integer x = 859
integer y = 516
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string text = "Ignorar"
end type

event clicked;call super::clicked;
CloseWithReturn( Parent, 3 )

end event

