//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Documento en PrintPreview ~r~n    Recomendación: NO MODIFICAR - AFECTA TODO EL SISTEMA~r~n*/
forward
global type w_arch_gen_preview from w_gen_document_doc
end type
end forward

global type w_arch_gen_preview from w_gen_document_doc
end type
global w_arch_gen_preview w_arch_gen_preview

type variables
Integer ii_zoom = 100
end variables

forward prototypes
public function long wf_print ()
public subroutine wf_menu (string as_obj)
public subroutine wf_zoom (string as_zoom)
public subroutine wf_setup ()
public subroutine wf_xls ()
public function integer wf_adjust ()
end prototypes

public function long wf_print ();
f_Print( dw_1 )

Return 1
end function

public subroutine wf_menu (string as_obj);/* Debe estar activo el extend */
String	ls_dir, ls_printer


ls_dir = GetCurrentDirectory()

Choose Case as_obj
	Case 'p_logo'
		//OpenSheet( w_gen_pagina_web, gw_frame )
		
	Case 'cb_new'
		wf_New( )
		
	Case 'cb_open'
		wf_Open( )
		
	Case 'cb_save'
		wf_Save( )
		
	Case 'cb_delete'
		wf_Delete( )
		
	Case 'cb_print'
		wf_Print( )
		
	Case 'cb_task'
		wf_Task( )
		
	Case 'cb_add'
		wf_add( )
		
	Case 'cb_setup'
		wf_Setup( )
		
	Case 'cb_xls'
		wf_xls( )
		
	Case 'cb_ampliar'
		wf_Zoom( '+' )
		
	Case 'cb_reducir'
		wf_Zoom( '-' )
				
	Case 'cb_ajustar'
		wf_Adjust( )
				
	Case 'cb_first'
		dw_1.ScrollToRow( 1)
		//iw_win.dw_2.Object.DataWindow.FirstRowOnPage
	Case 'cb_prior'
		dw_1.ScrollPriorPage( )
		
	Case 'cb_next'
		dw_1.ScrollNextPage( )
		
	Case 'cb_last'
		Do While True
			dw_1.ScrollNextPage( )
			If dw_1.RowCount() = Integer( dw_1.Describe( "DataWindow.LastRowOnPage")) Then
				Exit
			End If
		Loop
	
	Case 'cb_pdf'
		f_GetRegistry( 'PDF_Printer', ls_printer )
		If ls_printer = '' Or KeyDown( KeyShift! ) Then
			Open( w_arch_gen_printer_pdf )
			ls_printer = Message.StringParm
			
			ls_printer = f_Trim( ls_printer )
			
			If ls_printer = '' Then Return 
			
		End If

		dw_1.Object.DataWindow.Printer= ls_printer
		dw_1.Print( )

		ChangeDirectory( ls_dir )
		
	Case 'cb_info'
		MessageBox( Title, 'Info: ~r~n~r~n' + dw_1.DataObject )
		
	Case 'cb_return'
		Close( This )
		
End Choose

end subroutine

public subroutine wf_zoom (string as_zoom);/* wf_Zoom( as_zoom ) */
String	ls_zoom


If as_zoom = '+' Then
	ii_zoom = ii_zoom + 10
Else
	ii_zoom = ii_zoom - 10
End If
	
	
ls_zoom = String( ii_zoom )
If KeyDown( KeyShift! ) Then
	dw_1.Object.DataWindow.Zoom = ls_zoom
Else
	dw_1.Object.DataWindow.Print.Preview.Zoom = ls_zoom
End If
	

end subroutine

public subroutine wf_setup ();dw_1.SetRedraw( False )

If f_Zero( PrintSetup( ) ) = 1 Then
	//ls_setting = iw_win.dw_2.Object.DataWindow.Printer
	dw_1.Modify("DataWindow.print.preview=No")
	dw_1.Modify("DataWindow.print.preview=YES")
	dw_1.SetRedraw( True )
	//SetMicroHelp( ls_setting )
End If

dw_1.SetRedraw( True )
end subroutine

public subroutine wf_xls ();f_DWToExcel( dw_1 )
end subroutine

public function integer wf_adjust ();Long		ll_zoom
String	ls_pag


ls_pag = f_Trim( String( dw_1.Describe("Evaluate('PageCountAcross( )', 1)") ) )

f_GenProcesando( 'Ajustando Página...' )

Do While Integer( ls_pag ) > 1 
	ll_zoom = Long( dw_1.Object.Datawindow.Zoom )
	dw_1.object.Datawindow.Zoom = ll_zoom - 1

	ls_pag = f_Trim( String( dw_1.Describe("Evaluate('PageCountAcross( )', 1)") ) )
	gw_frame.SetMicroHelp( 'Reducción: ' + String( ll_zoom ) )

Loop 

f_GenProcesando( '' )

Return 1
end function

on w_arch_gen_preview.create
call super::create
end on

on w_arch_gen_preview.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_gen_preview
event adjust ( )
boolean hscrollbar = true
boolean vscrollbar = true
end type

event dw_1::adjust();
wf_Adjust( )
end event

event dw_1::retrievestart;call super::retrievestart;f_GenProcesando( 'Generando Reporte~r~nEspere un momento...' )

end event

event dw_1::retrieveend;call super::retrieveend;f_GenProcesando( '' )
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_gen_preview
string dataobject = "d_gen_menu_toolbar_print_preview"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_gen_preview
boolean enabled = false
boolean border = false
end type

