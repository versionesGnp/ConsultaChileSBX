//objectcomments /* Autor: César Vilela */
forward
global type w_mant_gen_etiqueta_edit from w_gen_document_mant_edit
end type
type hsb_r from hscrollbar within w_mant_gen_etiqueta_edit
end type
type hsb_g from hscrollbar within w_mant_gen_etiqueta_edit
end type
type hsb_b from hscrollbar within w_mant_gen_etiqueta_edit
end type
end forward

global type w_mant_gen_etiqueta_edit from w_gen_document_mant_edit
integer height = 1920
string title = "Etiquetas"
boolean ib_retxemp = true
hsb_r hsb_r
hsb_g hsb_g
hsb_b hsb_b
end type
global w_mant_gen_etiqueta_edit w_mant_gen_etiqueta_edit

forward prototypes
public function boolean wf_validareg ()
public function boolean wf_gencod (boolean ab_valida)
public function integer wf_rgb ()
public function long wf_getrgb ()
public function long wf_setrgb ()
public function boolean wf_postopen ()
public function boolean wf_checkactionm ()
public function boolean wf_checkactioni ()
end prototypes

public function boolean wf_validareg ();
dw_1.AcceptText( )

If istr_parm.s_cad[ 1] = 'I' Then	/* insertar */
	/* validamos que el codigo ingresado no exista */
	If Not wf_GenCod( True) Then
		Return False
	End If
End If

/* Validamos que campos mandatorios esten ingresados */
/* Descripcion */
If f_trim( dw_1.Object.v_nombre[ 1])= '' Then
	MessageBox( Title, 'Debe ingresar nombre/descripción.', Exclamation!)
	Return False
End If

Return True
end function

public function boolean wf_gencod (boolean ab_valida);/* wf_GenCod( ab_valida ) */
Integer	li_limit
String	ls_emp, ls_cod, ls_new


dw_1.AcceptText( )
ls_emp = f_Trim( dw_1.Object.c_codigo_emp[ 1])
ls_cod = f_Trim( dw_1.Object.c_codigo[ 1])
li_limit = Integer( dw_1.Object.c_codigo.edit.limit )

/* validamos que el codigo ingresado no exista */
If ls_cod <> '' Then
	ls_cod = f_Trim( ls_cod )
	ls_cod = Right( Fill( '0', li_limit) + f_Trim( ls_cod ), li_limit )
	dw_1.Object.c_codigo[ 1] = ls_cod 
	
	Select	v_nombre_ett
	Into 		:ls_new
	From		genetiqueta
	Where		c_codigo_emp = :ls_emp
	And		c_codigo_ett = :ls_cod ;
	
	If f_SqlError( SqlCa, 'No se pudo obtener información de la tabla genetiqueta (Where)' ) =-1 Then
		Return False
	End If
	
	If f_Trim( ls_new ) <> '' Then
		ls_cod = ''
		MessageBox( Title, 'Código ingresado ya existe.~n~rPertenece a ' + ls_new + &
								'~r~n~r~nEl sistema generará el código.', Exclamation!)
	End If
Else
	If ab_valida Then
		/* El mensaje sólo debe mostrarse cuando está en modo validación */
		MessageBox( Title, 'Debe ingresar el código.' + '~r~n~r~nEl sistema generará el código.', Exclamation!)
	End If
End If

If ls_cod = '' Then
	ls_new = ''
	Select	Max( c_codigo_ett )
	Into 		:ls_new
	From		genetiqueta 
	Where		c_codigo_emp = :ls_emp ;
	
	If f_SqlError( SqlCa, 'No se pudo obtener información de la tabla genetiqueta (Max)' ) =-1 Then
		Return False
	End If
	ls_new = f_Trim( ls_new )
	ls_new = Right( Fill( '0', li_limit) + f_Trim( String( Integer( ls_new ) + 1 )), li_limit )
	dw_1.Object.c_codigo[ 1] = ls_new 
	Return False
End If

dw_1.SetColumn( 'v_nombre' )

Return True
end function

public function integer wf_rgb ();Long	ll_backcolor
String	ls_col


dw_1.AcceptText( )

ll_backcolor = RGB( f_Zero( hsb_r.Position ), f_Zero( hsb_g.Position ), f_Zero( hsb_b.Position ))

dw_1.SetItem( 1, 'n_color_ett' , ll_backcolor )
dw_1.SetItem( 1, 'n_r_ett' , f_Zero( hsb_r.Position ) )
dw_1.SetItem( 1, 'n_g_ett' , f_Zero( hsb_g.Position ) )
dw_1.SetItem( 1, 'n_b_ett' , f_Zero( hsb_b.Position ) )

dw_1.AcceptText( )

dw_1.Object.n_color_ett.background.color = ll_backcolor

Return	ll_backcolor
end function

public function long wf_getrgb ();Long	ll_r, ll_g, ll_b, ll_backcolor
String	ls_col


dw_1.AcceptText( )

ll_r = dw_1.GetItemNumber( 1, 'n_r_ett' )
ll_g = dw_1.GetItemNumber( 1, 'n_g_ett' )
ll_b = dw_1.GetItemNumber( 1, 'n_b_ett' )

hsb_r.Position = ll_r
hsb_g.Position = ll_g
hsb_b.Position = ll_b

ll_backcolor = RGB( hsb_r.Position, hsb_g.Position, hsb_b.Position )

dw_1.AcceptText( )

Return	ll_backcolor
end function

public function long wf_setrgb ();Long	ll_r, ll_g, ll_b, ll_backcolor
String	ls_col


dw_1.AcceptText( )

ll_r = f_Zero( dw_1.GetItemNumber( 1, 'n_r_ett' ) )
ll_g = f_Zero( dw_1.GetItemNumber( 1, 'n_g_ett' ) )
ll_b = f_Zero( dw_1.GetItemNumber( 1, 'n_b_ett' ) )

hsb_r.Position = ll_r
hsb_g.Position = ll_g
hsb_b.Position = ll_b

dw_1.SetItem( 1, 'n_r_ett', ll_r )
dw_1.SetItem( 1, 'n_g_ett', ll_g )
dw_1.SetItem( 1, 'n_b_ett', ll_b )

ll_backcolor = RGB( hsb_r.Position, hsb_g.Position, hsb_b.Position )

dw_1.SetItem( 1, 'n_color_ett', ll_backcolor )

dw_1.AcceptText( )

Return	ll_backcolor
end function

public function boolean wf_postopen ();



wf_GetRGB( )


Return True
end function

public function boolean wf_checkactionm ();
f_ColEnabled( dw_1, 'c_codigo', False )

Return True
end function

public function boolean wf_checkactioni ();

dw_1.Object.c_codigo_emp[ 1] = gs_emp
f_ColEnabled( dw_1, 'c_codigo', True )

Super::wf_CheckActionI( )

Return True

end function

on w_mant_gen_etiqueta_edit.create
int iCurrent
call super::create
this.hsb_r=create hsb_r
this.hsb_g=create hsb_g
this.hsb_b=create hsb_b
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.hsb_r
this.Control[iCurrent+2]=this.hsb_g
this.Control[iCurrent+3]=this.hsb_b
end on

on w_mant_gen_etiqueta_edit.destroy
call super::destroy
destroy(this.hsb_r)
destroy(this.hsb_g)
destroy(this.hsb_b)
end on

type dw_1 from w_gen_document_mant_edit`dw_1 within w_mant_gen_etiqueta_edit
integer height = 1108
string dataobject = "d_mant_gen_etiqueta_edit"
end type

event dw_1::itemchanged;call super::itemchanged;
Long	ll_rgb

Choose Case dwo.Name
		
	Case 'n_r_ett', 'n_g_ett', 'n_b_ett'
		data = f_Trim(data)
		ll_rgb = Long(data)
		If ll_rgb > 255 Then
			MessageBox( Parent.Title, 'Valor especificado fuera de rango ( 0 - 255 )')
			SetText( '255' )
			AcceptText( )
			Return 2
		End If
		wf_SetRGB( )
		
End Choose


end event

type dw_menu from w_gen_document_mant_edit`dw_menu within w_mant_gen_etiqueta_edit
end type

type hsb_r from hscrollbar within w_mant_gen_etiqueta_edit
event thumbposition pbm_sbnthumbposition
integer x = 878
integer y = 760
integer width = 905
integer height = 68
boolean bringtotop = true
integer maxposition = 255
end type

event lineleft;If This.Position > 0 Then This.Position =  This.Position - 1
wf_RGB( )
end event

event lineright;If This.Position < 255 Then This.Position =  This.Position + 1
wf_RGB( )
end event

event moved;wf_RGB( )
end event

type hsb_g from hscrollbar within w_mant_gen_etiqueta_edit
integer x = 878
integer y = 884
integer width = 905
integer height = 68
boolean bringtotop = true
integer maxposition = 255
end type

event lineleft;If This.Position > 0 Then This.Position =  This.Position - 1
wf_RGB( )
end event

event lineright;If This.Position < 255 Then This.Position =  This.Position + 1
wf_RGB( )
end event

event moved;wf_RGB( )
end event

type hsb_b from hscrollbar within w_mant_gen_etiqueta_edit
integer x = 878
integer y = 1012
integer width = 905
integer height = 68
boolean bringtotop = true
integer maxposition = 255
end type

event lineleft;If This.Position > 0 Then This.Position =  This.Position - 1
wf_RGB( )
end event

event lineright;If This.Position < 255 Then This.Position =  This.Position + 1
wf_RGB( )
end event

event moved;
wf_RGB( )
end event

