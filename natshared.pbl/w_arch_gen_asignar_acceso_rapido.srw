//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Documento para que login selecciones sus accesos para página inicio~r~n    Recomendación: NO MODIFICAR - Experto~r~n*/
forward
global type w_arch_gen_asignar_acceso_rapido from w_gen_document_doc
end type
end forward

global type w_arch_gen_asignar_acceso_rapido from w_gen_document_doc
integer width = 4530
string title = "Asignar Acceso Rápido"
boolean controlmenu = false
boolean ib_fulllist = true
end type
global w_arch_gen_asignar_acceso_rapido w_arch_gen_asignar_acceso_rapido

forward prototypes
public function integer wf_new ()
end prototypes

public function integer wf_new ();
dw_1.Retrieve( gs_emp, gs_usuario )
dw_list.Retrieve( gs_usuario )

Return 1
end function

on w_arch_gen_asignar_acceso_rapido.create
call super::create
end on

on w_arch_gen_asignar_acceso_rapido.destroy
call super::destroy
end on

event closequery;call super::closequery;

If IsValid( w_arch_gen_pagina_inicio ) Then
	w_arch_gen_pagina_inicio.wf_LoginOpc( )
End If
end event

type dw_1 from w_gen_document_doc`dw_1 within w_arch_gen_asignar_acceso_rapido
integer width = 4265
integer height = 1180
string dataobject = "d_arch_gen_asignar_acceso_rapido"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_menu from w_gen_document_doc`dw_menu within w_arch_gen_asignar_acceso_rapido
string dataobject = "d_gen_menu_toolbar_return"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_gen_asignar_acceso_rapido
boolean visible = true
integer x = 206
integer y = 512
integer width = 3730
integer height = 708
string dataobject = "d_arch_gen_asignar_acceso_rapido_Det"
boolean border = false
end type

event dw_list::constructor;call super::constructor;

This.Object.DataWindow.Detail.Color = String( f_Gen_Color( 'blanco' ) )
end event

event dw_list::rowfocuschanged;call super::rowfocuschanged;SelectRow( 0, False )
end event

event dw_list::retrieveend;call super::retrieveend;SelectRow( 0, False )
end event

event dw_list::clicked;call super::clicked;SelectRow( 0, False )
end event

event dw_list::itemchanged;call super::itemchanged;Integer	li_dock
String	ls_usu, ls_opc, ls_fav


dw_1.AcceptText( )
dw_list.AcceptText( )

ls_usu = f_Trim( dw_list.Object.c_codigo_usu[ row ] )
ls_opc = f_Trim( dw_list.Object.c_codigo_opc[ row ] )
ls_fav = f_Trim( dw_list.Object.c_favorito_opc[ row ] )

Choose Case dwo.Name
	Case 'c_favorito_opc'
		ls_fav = data
		
		Update	genloginopc
		Set		c_favorito_opc = :ls_fav
		Where		c_codigo_usu = :ls_usu
		And		c_codigo_opc = :ls_opc
		Using		SqlCa ;
		
		If f_SqlError( SqlCa, 'No se pudo actualizar las opciones (Favorito) del usuario.' ) = -1 Then
			RollBack Using SqlCa ;
			Return 
		End If
		
		Commit Using SqlCa ;
		
	Case 'n_dock_opc'
		li_dock = Integer( data )
		
		Update	genloginopc
		Set		n_dock_opc = :li_dock
		Where		c_codigo_usu = :ls_usu
		And		c_codigo_opc = :ls_opc
		Using		SqlCa ;
		
		If f_SqlError( SqlCa, 'No se pudo actualizar las opciones (Dock) del usuario.' ) = -1 Then
			RollBack Using SqlCa ;
			Return 
		End If
		
		Commit Using SqlCa ;
		
		If IsValid( w_arch_gen_dock ) Then w_arch_gen_dock.wf_Retrieve( )
		
End Choose
end event

