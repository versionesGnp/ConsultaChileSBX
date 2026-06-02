//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Ancestra de Diálogos - Popups, contiene clases visuales y s_parm~r~n    Recomendación: NO MODIFICAR - AFECTA TODO EL SISTEMA~r~n*/
forward
global type wa_response from window
end type
type dw_list from uo_dw_list within wa_response
end type
type dw_1 from uo_dw_edit within wa_response
end type
type cb_cancelar from uo_cbcancelar within wa_response
end type
type cb_aceptar from uo_cbaceptar within wa_response
end type
end forward

global type wa_response from window
integer x = 1056
integer y = 484
integer width = 2336
integer height = 896
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
boolean center = true
windowanimationstyle openanimation = fadeanimation!
windowanimationstyle closeanimation = fadeanimation!
event ue_cargamenu ( )
dw_list dw_list
dw_1 dw_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
end type
global wa_response wa_response

type variables
s_parm istr_parm

Boolean	ib_saved = True, ib_new= True, ib_posY = False, ib_readonly = False
Integer	ii_headerHeight = 124
String	is_codtem = ''


/* Create Column Indicator */
Boolean ib_ind 

Boolean ib_fadeeffect = false
end variables

forward prototypes
public subroutine wf_imprimir ()
public subroutine wf_colenabled (string as_acol[], boolean ab_enabled)
public function boolean wf_postopen ()
public function integer wf_buscargenerica (string as_cod, string as_tabla, string as_col, boolean ab_nombre, boolean ab_masdatos)
public function boolean wf_buscarmasdatos (string as_cod, string as_tabla, boolean ab_found)
public function string wf_rutmask (string as_col)
public function boolean columnindicator (boolean bshow)
end prototypes

public subroutine wf_imprimir ();Return
end subroutine

public subroutine wf_colenabled (string as_acol[], boolean ab_enabled);Integer	i

For i = 1 To UpperBound( as_acol[] )
	//f_ColEnabled( dw_1, as_acol[i], ab_enabled )
Next

end subroutine

public function boolean wf_postopen ();Return True
end function

public function integer wf_buscargenerica (string as_cod, string as_tabla, string as_col, boolean ab_nombre, boolean ab_masdatos);/* wf_BuscarGenerica( as_cod, as_tabla, as_col, ab_nombre, ab_masdatos ) */

Boolean	lb_found = False
String	ls_nom, ls_parm


dw_1.AcceptText( )
as_cod = f_Trim( as_cod )

If as_cod = '' Then
	OpenWithParm( w_mant_gen_buscar_x_nombre, as_tabla )
	ls_parm = Message.StringParm
	
	ls_parm = f_Trim( ls_parm )
	
	If Not ls_parm = '' Then
		lb_found = True
		as_cod = ls_parm
		dw_1.SetItem( 1, 'c_codigo_' + as_col, as_cod )
		If ab_nombre Then
			dw_1.SetItem( 1, 'v_nombre_' + as_col, f_GetGenerica( as_cod, as_tabla ) )
		End If
	End If
Else
	ls_nom = f_GetGenerica( as_cod, as_tabla )
	If ls_nom = '' Then
		MessageBox( Title, 'Código no encontrado.', Exclamation! )
	Else
		lb_found = True
	End If
	If ab_nombre Then
		dw_1.SetItem( 1, 'v_nombre_' + as_col, f_GetGenerica( as_cod, as_tabla ) )
	End If
End If

If ab_masdatos Then
	wf_BuscarMasDatos( as_cod, as_tabla, lb_found )
End If

dw_1.AcceptText( )

ib_saved = False

Return 1
end function

public function boolean wf_buscarmasdatos (string as_cod, string as_tabla, boolean ab_found);Return True
end function

public function string wf_rutmask (string as_col);
String	ls_fmt

ls_fmt = f_GenRUTMask( dw_1, as_col )

Return ls_fmt
end function

public function boolean columnindicator (boolean bshow);

dw_1.Object.r_ind.Visible = bShow

Return True
end function

on wa_response.create
this.dw_list=create dw_list
this.dw_1=create dw_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.Control[]={this.dw_list,&
this.dw_1,&
this.cb_cancelar,&
this.cb_aceptar}
end on

on wa_response.destroy
destroy(this.dw_list)
destroy(this.dw_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
end on

event open;
This.BackColor = f_Gen_Color( 'm' )
end event

type dw_list from uo_dw_list within wa_response
integer y = 660
integer width = 283
integer height = 156
integer taborder = 40
end type

event constructor;call super::constructor;
If ib_posY Then f_SetDWPositionY( This, ii_posdetY )
end event

type dw_1 from uo_dw_edit within wa_response
event setobjectcolora ( string as_obj[],  string as_clr )
event setobjectcolor ( string as_obj,  string as_clr )
event key pbm_dwnkey
integer width = 2363
integer height = 612
integer taborder = 10
string title = ""
boolean border = false
end type

event setobjectcolora(string as_obj[], string as_clr);
// CVILELA 02-Sep-2021

// CVILELA 02-Dic-2022
// Se reedita por cambio de objeto clase
This.SetObjectcolorA( as_obj[], as_clr )

end event

event constructor;call super::constructor;
// CVilela 15-Dic-2022
// Edición por Cambio de Objeto y Clase.

// CVilela 07-Dic-2021
If This.DataObject = '' Then Return

This.Object.DataWindow.Header.Color = f_Gen_Color( 'titwin' )
This.Object.DataWindow.Header.Height = ii_headerHeight
This.SetObjectColor( 'st_titulo', 'o' )


end event

event editchanged;If Not cb_aceptar.Enabled Then
	cb_aceptar.Enabled = True
End If
end event

event itemchanged;If Not cb_aceptar.Enabled Then
	cb_aceptar.Enabled = True
End If
end event

type cb_cancelar from uo_cbcancelar within wa_response
integer x = 1893
integer y = 668
integer taborder = 30
end type

type cb_aceptar from uo_cbaceptar within wa_response
integer x = 1513
integer y = 668
integer taborder = 20
boolean enabled = false
end type

