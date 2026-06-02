forward
global type w_arch_printers2 from window
end type
type cb_cerrar from commandbutton within w_arch_printers2
end type
type cb_aceptar from commandbutton within w_arch_printers2
end type
type dw_list from datawindow within w_arch_printers2
end type
type dw_1 from datawindow within w_arch_printers2
end type
end forward

global type w_arch_printers2 from window
integer width = 2080
integer height = 1600
boolean titlebar = true
string title = "Imprimir"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_list dw_list
dw_1 dw_1
end type
global w_arch_printers2 w_arch_printers2

type variables
DataWindow	idw_rpt
end variables

forward prototypes
public function string wf_printers ()
end prototypes

public function string wf_printers ();
Long		ll_place, i, k 
String	ls_left, ls_prntrs, ls_ret


ls_prntrs  = PrintGetPrinters ( )

Do While True
	ll_place = Pos ( ls_prntrs, "~t" ) 
	
	ls_left = Left (ls_prntrs, ll_place - 1)
	ls_ret = ls_ret + ls_left + '	' + ls_left + '/'
	
	ll_place = Pos ( ls_prntrs, "~n" ) 
	ls_prntrs = Mid (ls_prntrs, ll_place + 1)
	
	
	If ls_left = '' Or ll_place <= 0 Then Exit
Loop

Return ls_ret
end function

on w_arch_printers2.create
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_list=create dw_list
this.dw_1=create dw_1
this.Control[]={this.cb_cerrar,&
this.cb_aceptar,&
this.dw_list,&
this.dw_1}
end on

on w_arch_printers2.destroy
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_list)
destroy(this.dw_1)
end on

event open;Integer	li_copies
String		ls_printers,ls_dw

gf_centrar(w_arch_printers2)
idw_rpt 								= message.PowerObjectParm 
dw_1.InsertRow(0)
ls_dw									= idw_rpt.dataobject
dw_1.Object.v_document[ 1] 	= ls_dw		//f_Trim( idw_rpt.Describe( 'DataWindow.Print.DocumentName' ) )
ls_printers 							= wf_Printers( )
dw_1.Object.v_printers.Values = ls_printers
dw_1.Object.v_printers[ 1] 		= f_Trim( idw_rpt.Describe ( "DataWindow.Printer" ))
li_copies 								= f_Zero( Integer ( idw_rpt.Describe ( "DataWindow.Print.Copies" ) ) )
If li_copies < 1 Then li_copies = 1
dw_1.Object.n_copies[ 1] 		= li_copies 	
dw_1.AcceptText( )
end event

type cb_cerrar from commandbutton within w_arch_printers2
integer x = 1669
integer y = 1360
integer width = 347
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;Integer		li_ret
li_ret	= 0
Close( w_arch_printers2)
end event

type cb_aceptar from commandbutton within w_arch_printers2
integer x = 32
integer y = 1360
integer width = 347
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Integer	li_ret
String	ls_doc, ls_prt, ls_cop, ls_pag, ls_ran

dw_1.AcceptText( )

ls_doc 		= f_Trim( dw_1.Object.v_document[ 1] )
ls_prt 		= f_Trim( dw_1.Object.v_printers[ 1] )
ls_pag 		= f_Trim( dw_1.Object.v_pages[ 1] )
ls_ran 		= f_Trim( dw_1.Object.v_range[ 1] )
ls_cop 		= f_Trim( String( dw_1.Object.n_copies[ 1] ) )

idw_rpt.Modify ( "DataWindow.Print.DocumentName = '" + ls_doc + "'" )
idw_rpt.Modify ( "DataWindow.Print.Copies = " + ls_cop ) 
idw_rpt.Modify ( "DataWindow.Printer = " + ls_prt ) 
idw_rpt.Modify ( "DataWindow.Print.Copies = " + ls_cop ) 

If ls_pag = 'ALL' Then
	idw_rpt.Modify ( "DataWindow.Print.Page.Range = ''" ) 
Else
	idw_rpt.Modify ( "DataWindow.Print.Page.Range = '" + ls_ran + "'" ) 
End If

li_ret 			= idw_rpt.Print( True )

Close( w_arch_printers2)
end event

type dw_list from datawindow within w_arch_printers2
integer x = 2482
integer y = 656
integer width = 686
integer height = 400
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_arch_printers2
integer x = 32
integer y = 40
integer width = 1979
integer height = 1272
integer taborder = 10
string title = "none"
string dataobject = "d_arch_gen_printer"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Choose Case dwo.Name
	Case 'cb_properties'
		PrintSetupPrinter ( )
		
	Case 'cb_config'
		PrintSetup ( )
		This.Object.v_printers[ 1] =  f_Trim( idw_rpt.Describe ( 'DataWindow.Printer' ))
		
End Choose
end event

event itemchanged;String		ls_v_pages,ls_columna

ls_columna		= dwo.name
Choose Case ls_columna
	Case 'v_printers'
		idw_rpt.SetRedraw( False )
		PrintSetPrinter ( data )
		idw_rpt.SetRedraw( True )

	Case 'v_range'
		If data = '' Then
			This.Object.v_pages[ 1] = 'ALL'
		Else
			This.Object.v_pages[ 1] = 'PAG'
		End If
	Case 'v_pages'
		ls_v_pages	= data
		if ls_v_pages='ALL' then
			This.Object.v_range[ 1] = ''
		end if
End Choose
This.accepttext()
end event

