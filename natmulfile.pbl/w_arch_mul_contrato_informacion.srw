//objectcomments Autor: César Vilela R.~r~nFunción: Consulta del contrato
forward
global type w_arch_mul_contrato_informacion from w_gen_document_doc
end type
type tab_1 from tab within w_arch_mul_contrato_informacion
end type
type tabpage_1 from userobject within tab_1
end type
type dw_cto from uo_dw_edit within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_cto dw_cto
end type
type tabpage_2 from userobject within tab_1
end type
type dw_dh1 from uo_dw_list within tabpage_2
end type
type dw_h1 from uo_dw_edit within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_dh1 dw_dh1
dw_h1 dw_h1
end type
type tabpage_3 from userobject within tab_1
end type
type dw_dh2 from uo_dw_list within tabpage_3
end type
type dw_h2 from uo_dw_edit within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_dh2 dw_dh2
dw_h2 dw_h2
end type
type tabpage_4 from userobject within tab_1
end type
type dw_dh3 from uo_dw_list within tabpage_4
end type
type dw_h3 from uo_dw_edit within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_dh3 dw_dh3
dw_h3 dw_h3
end type
type tabpage_5 from userobject within tab_1
end type
type dw_dh4 from uo_dw_list within tabpage_5
end type
type dw_h4 from uo_dw_edit within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_dh4 dw_dh4
dw_h4 dw_h4
end type
type tabpage_6 from userobject within tab_1
end type
type dw_dh5 from uo_dw_list within tabpage_6
end type
type dw_h5 from uo_dw_edit within tabpage_6
end type
type tabpage_6 from userobject within tab_1
dw_dh5 dw_dh5
dw_h5 dw_h5
end type
type tabpage_7 from userobject within tab_1
end type
type dw_dh6 from uo_dw_list within tabpage_7
end type
type dw_h6 from uo_dw_edit within tabpage_7
end type
type tabpage_7 from userobject within tab_1
dw_dh6 dw_dh6
dw_h6 dw_h6
end type
type tab_1 from tab within w_arch_mul_contrato_informacion
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type
end forward

global type w_arch_mul_contrato_informacion from w_gen_document_doc
integer width = 5019
integer height = 2744
string title = "Información del Contrato"
boolean ib_fulllist = true
boolean ib_cbdelete = false
boolean ib_cbsave = false
boolean ib_cbshare = false
boolean ib_permitemod = true
boolean ib_new = true
event postopen ( )
tab_1 tab_1
end type
global w_arch_mul_contrato_informacion w_arch_mul_contrato_informacion

type variables

Boolean	ib_det = False
Integer	ii_idx = 0
Long		il_y, il_H, il_yAmp, il_HAmp, il_YCon, il_HCon
DateTime	id_ini, id_fin 

String	is_doc, is_dir, &
			is_cli, is_cto 

uo_DataStore	ids_back[]
uo_DW_Edit idw_cto
uo_dw_List idw_dh1, idw_dh2, idw_dh3, idw_dh4, idw_dh5, idw_dh6
end variables

forward prototypes
public function integer wf_new ()
public function integer wf_config ()
public function integer wf_opendoc (string as_bas, string as_ser, double an_nro, double an_rut, string as_db)
end prototypes

event postopen();
This.il_h = dw_list.Height
//dw_list.Height = 
end event

public function integer wf_new ();
ib_new = True
ib_saved = True

is_emp = gs_emp

dw_1.Reset( )
dw_1.SetTransObject( SqlCa )

dw_list.Reset( )
dw_list.SetTransObject( SqlCa )

dw_1.InsertRow(0)
dw_1.SetFocus( )

dw_1.Object.c_codigo_emp[ 1] = is_emp
dw_1.Object.c_codigo_cli[ 1] = ' '
dw_1.Object.v_nombre_cli[ 1] = ' '
dw_1.Object.c_codigo_cto[ 1] = ' '

//wf_RutMask( 'c_codigo_cli' )

dw_1.AcceptText( )
dw_1.SetColumn( 'c_codigo_cli' ) 

Return 1
end function

public function integer wf_config ();

tab_1.TabPage_1.Visible = False
tab_1.TabPage_2.Visible = False
tab_1.TabPage_3.Visible = False
tab_1.TabPage_4.Visible = False
tab_1.TabPage_5.Visible = False
tab_1.TabPage_6.Visible = False
tab_1.TabPage_7.Visible = False

f_SetObjectColorA( dw_1, {'c_codigo_cli', 'v_nombre_cli', 'c_codigo_cto'}, '', 'o' )
f_SetObjectColor( dw_1, 'v_nombre_par', '', 'ba' )
/*
dw_list.SetObjectColor( 'c_codigo_cto', 'o' )
dw_list.SetObjectColor( 'v_nombre_gru', 'st' )
dw_list.SetObjectColor( 'v_norows_log', 'bx' )
*/

Return 1
end function

public function integer wf_opendoc (string as_bas, string as_ser, double an_nro, double an_rut, string as_db);

dw_1.SetRedraw( False )
dw_1.Retrieve( as_bas, as_ser, an_nro, an_rut, as_DB )
dw_list.Retrieve( as_bas, as_ser, an_nro, as_DB )
dw_1.SetRedraw( True )


uo_DataStore lds_1
Integer	li_ret, i, li_par
String	ls_cto, ls_tip, ls_bar


SetNull( li_par )
ls_cto = as_bas + as_ser + String( an_nro )

idw_cto.Retrieve( ls_cto, an_rut, li_par, 'MUL', as_DB )

f_CreateDS( lds_1, 'd_arch_mul_contrato_consulta_det', SqlCa )
li_ret = lds_1.Retrieve( ls_cto, an_rut, as_DB, 'CTO' )

tab_1.TabPage_1.Visible = False
tab_1.TabPage_2.Visible = False
tab_1.TabPage_3.Visible = False
tab_1.TabPage_4.Visible = False
tab_1.TabPage_5.Visible = False
tab_1.TabPage_6.Visible = False
tab_1.TabPage_7.Visible = False

If li_ret > 0 Then
	ls_tip = 'MultiProducto '  
	ls_bar = ls_cto
	tab_1.TabPage_1.Visible = True
	tab_1.TabPage_1.Text = ls_tip + ' ' + ls_bar
End If



Long		ll_nro
String	ls_bas, ls_ser, ls_dw, ls_opc

For i = 1 To li_ret
	ls_tip = f_WordCap( lds_1.Object.TipoContrato_h[ i] )
	ls_bar = Upper( lds_1.Object.Barra_h[ i] )
	ls_bas = Upper( lds_1.Object.Base_h[ i] )
	ls_ser = Upper( lds_1.Object.Serie_h[ i] )
	ll_nro = f_Zero( lds_1.Object.Numero_h[ i] )
	
	Choose Case ls_bas
		Case 'O'
			ls_dw = 'd_arch_mul_contrato_informacion_ofe'
			ls_opc = 'OFE'
		Case 'L'
			ls_dw = 'd_arch_mul_contrato_informacion_lib'
			ls_opc = 'LIB'
		Case 'F'
			ls_dw = 'd_arch_mul_contrato_informacion_fun'
			ls_opc = 'FUN'
		Case 'G'
			ls_dw = 'd_arch_mul_contrato_informacion_cre'
			ls_opc = 'CRE'
	End Choose
	
	Choose Case ( i + 1 )
		Case 1
			tab_1.TabPage_1.Visible = True
			tab_1.TabPage_1.Text = ls_tip + ' ' + ls_bar
		Case 2
			tab_1.TabPage_2.Visible = True
			tab_1.TabPage_2.Text = ls_tip + ' ' + ls_bar
			tab_1.TabPage_2.dw_h1.DataObject = ls_dw
			tab_1.TabPage_2.dw_h1.Event Constructor( )
			tab_1.TabPage_2.dw_h1.Retrieve( ls_bar, an_rut, li_par, ls_opc, as_DB )
			tab_1.TabPage_2.dw_dh1.Retrieve( ls_bas, ls_ser, ll_nro, as_DB )
		Case 3
			tab_1.TabPage_3.Visible = True
			tab_1.TabPage_3.Text = ls_tip + ' ' + ls_bar
			tab_1.TabPage_3.dw_h2.DataObject = ls_dw
			tab_1.TabPage_3.dw_h2.Event Constructor( )
			tab_1.TabPage_3.dw_h2.Retrieve( ls_bar, an_rut, li_par, ls_opc, as_DB )
			tab_1.TabPage_3.dw_dh2.Retrieve( ls_bas, ls_ser, ll_nro, as_DB )
		Case 4
			tab_1.TabPage_4.Visible = True
			tab_1.TabPage_4.Text = ls_tip + ' ' + ls_bar
			tab_1.TabPage_4.dw_h3.DataObject = ls_dw
			tab_1.TabPage_4.dw_h3.Event Constructor( )
			tab_1.TabPage_4.dw_h3.Retrieve( ls_bar, an_rut, li_par, ls_opc, as_DB )
			tab_1.TabPage_4.dw_dh3.Retrieve( ls_bas, ls_ser, ll_nro, as_DB )
		Case 5
			tab_1.TabPage_5.Visible = True
			tab_1.TabPage_5.Text = ls_tip + ' ' + ls_bar
			tab_1.TabPage_5.dw_h4.DataObject = ls_dw
			tab_1.TabPage_5.dw_h4.Event Constructor( )
			tab_1.TabPage_5.dw_h4.Retrieve( ls_bar, an_rut, li_par, ls_opc, as_DB )
			tab_1.TabPage_5.dw_dh4.Retrieve( ls_bas, ls_ser, ll_nro, as_DB )
		Case 6
			tab_1.TabPage_6.Visible = True
			tab_1.TabPage_6.Text = ls_tip + ' ' + ls_bar
			tab_1.TabPage_6.dw_h5.DataObject = ls_dw
			tab_1.TabPage_6.dw_h5.Event Constructor( )
			tab_1.TabPage_6.dw_h5.Retrieve( ls_bar, an_rut, li_par, ls_opc, as_DB )
			tab_1.TabPage_6.dw_dh5.Retrieve( ls_bas, ls_ser, ll_nro, as_DB )
		Case 7
			tab_1.TabPage_7.Visible = True
			tab_1.TabPage_7.Text = ls_tip + ' ' + ls_bar
			tab_1.TabPage_7.dw_h6.DataObject = ls_dw
			tab_1.TabPage_7.dw_h6.Event Constructor( )
			tab_1.TabPage_7.dw_h6.Retrieve( ls_bar, an_rut, li_par, ls_opc, as_DB )
			tab_1.TabPage_7.dw_dh6.Retrieve( ls_bas, ls_ser, ll_nro, as_DB )
	End Choose
	tab_1.SetRedraw( True )
Next

Destroy lds_1

Return 1

end function

on w_arch_mul_contrato_informacion.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on w_arch_mul_contrato_informacion.destroy
call super::destroy
destroy(this.tab_1)
end on

event open;call super::open;


PostEvent( 'PostOpen' )
end event

event resize;call super::resize;
//dw_amp.Width = dw_1.Width
tab_1.Width = dw_1.Width - 100
tab_1.height = newheight - (tab_1.y ) - 70


idw_dh1.Resize( dw_list.Width, dw_list.Height )
idw_dh2.Resize( dw_list.Width, dw_list.Height )
idw_dh3.Resize( dw_list.Width, dw_list.Height )
idw_dh4.Resize( dw_list.Width, dw_list.Height )
idw_dh5.Resize( dw_list.Width, dw_list.Height )
idw_dh6.Resize( dw_list.Width, dw_list.Height )


end event

type dw_1 from w_gen_document_doc`dw_1 within w_arch_mul_contrato_informacion
integer width = 4686
integer height = 920
string dataobject = "d_arch_mul_informacion"
boolean ib_ind = false
end type

event dw_1::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_mensajes'
		Long		ll_nro, ll_rut
		String	ls_bas, ls_ser, ls_DB
		
		ls_bas = f_Trim( This.Object.Base[ row] )
		ls_ser = f_Trim( This.Object.Serie[ row] )
		ll_nro = f_Zero( This.Object.Numero[ row] )
		ll_rut = f_Zero( This.Object.Rut[ row] )
		ls_DB  = f_Trim( This.Object.DB[ row] )
		/*
		OpenSheet( w_arch_caj_mensajes_consulta, gw_frame, 1, Original! )
		w_arch_caj_mensajes_consulta.wf_New()
		w_arch_caj_mensajes_consulta.wf_OpenDoc( ll_rut , ls_bas, ls_ser, ll_nro )*/
End Choose
end event

event dw_1::itemchanged;call super::itemchanged;
String	ls_nom


dw_list.Reset( )

Choose Case dwo.Name
		
	Case 'c_codigo_cli'
		
		Object.c_codigo_cto[ row] = ''
		Object.v_nombre_cli[ row] = ''
		If data = '' Then Return 
		
		ls_nom = f_GetGenerica( data, 'CLI' )
		If Not data = '' And ls_nom = '' Then
			data = f_GenBuscar( '@' + data, 'c_codigo_cli', 'CLI', This )
		End If
		
		data = f_GlobalReplace( f_Trim( data ), '-', '' )
		SetText( data )
		Object.v_nombre_cli[ row] = ls_nom
		AcceptText( )
		
		If data = '' Then Return 1
		
		wf_RutMask( dwo.Name )
		Return 2	
		
	Case 'c_codigo_cto'
		
		Object.c_codigo_cli[ row] = ''
		Object.v_nombre_cli[ row] = ''
		AcceptText( )

	Case 'v_nombre_cli'
		
		Object.c_codigo_cli[ row] = ''
		Object.c_codigo_cto[ row] = ''
		AcceptText( )
		
End Choose
end event

event dw_1::key;call super::key;String	ls_cod


If Not KeyDown( KeyF3! ) Then Return

Choose Case GetColumnName( )
	Case 'c_codigo_cli' 
		This.Event ButtonClicked( 1, 1, Object.cb_cli )
				
End Choose

end event

event dw_1::itemerror;call super::itemerror;
Return 1
end event

event dw_1::error;call super::error;
Return 
end event

event dw_1::dberror;call super::dberror;
Return 3
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_mul_contrato_informacion
integer width = 3497
string dataobject = "d_gen_menu_toolbar_return"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_mul_contrato_informacion
boolean visible = true
integer x = 251
integer y = 2120
integer width = 4064
integer height = 372
string dataobject = "d_arch_mul_informacion_det"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_detselect = true
boolean ib_exportxls = false
integer ii_detheight = 110
integer ii_posdety = 25
end type

event dw_list::buttonclicked;call super::buttonclicked;
Long		ll_error
String	ls_row, ls_band, ls_gru, ls_ngru, ls_ret
s_parm	lstr_parm	


Choose Case dwo.Name
		
	Case 'cb_ampliar'
		If This.Object.cb_ampliar.Text = 'Ampliar' Then
			This.y = tab_1.Y + tab_1.tabpage_1.Y + idw_cto.Y 
			This.Object.cb_ampliar.Text = 'Contraer' 
			This.Height = tab_1.Height - (tab_1.tabpage_1.Y + idw_cto.Y )//200
		Else
			This.y = il_Y
			This.Object.cb_ampliar.Text = 'Ampliar'
			This.Height = il_H //Parent.Height - (dw_list.y ) - 170
		End If
		
		idw_cto.Visible = ( Not dw_list.y = idw_cto.Y )

		
	Case 'cb_cob'
		/* Nivel 1 - Grupo */
		ls_band = This.GetBandAtPointer( )
		ls_row = Mid( ls_band, Pos( ls_band, '	', 1 ) + 1 )
		row = Long( ls_row )
		
		If Not f_Zero( row ) > 0 Then Return
		
		ls_gru = UpperTrim( This.Object.c_codigo_gru[ row] )
		ls_ngru = f_Trim( This.Object.v_nombre_gru[ row] )
		
		lstr_parm.s_cad[ 1] = UpperTrim( dw_1.Object.c_codigo_emp[ 1] )
		lstr_parm.s_cad[ 2] = UpperTrim( dw_1.Object.c_codigo_cto[ 1] )
		lstr_parm.s_cad[ 3] = UpperTrim( dw_1.Object.c_codigo_cli[ 1] )
		lstr_parm.s_cad[ 4] = ls_gru
		lstr_parm.s_cad[ 5] = ls_ngru
		
		//OpenWithParm( w_arch_cto_cobranza_hist_edit, lstr_parm )
		ls_ret = f_Trim( Message.StringParm )
		
		If ls_ret = '' Then Return
		
		wf_Refresh( )
		
		This.Find( 'c_codigo_gru = "' + ls_gru + '"', True )
		
		Return
		
End Choose

Return
end event

event dw_list::clicked;call super::clicked;
If row <= 0 Then Return

s_parm	lstr_parm

Choose Case dwo.Name
	Case 'cb_det'
		lstr_parm.s_cad[ 1] = This.Object.tipo_cob[ row]
		lstr_parm.s_cad[ 2] = String( LongLong( This.Object.folio[ row] ) )
		lstr_parm.s_cad[ 3] = This.Object.DB[ row]
		
		//OpenWithParm( w_arch_caj_docingreso_consulta, lstr_parm )

End Choose
end event

event dw_list::rbuttondown;call super::rbuttondown;
wf_Task( )
end event

event dw_list::constructor;call super::constructor;
This.BringToTop = True
il_y = This.Y

end event

type tab_1 from tab within w_arch_mul_contrato_informacion
integer x = 133
integer y = 760
integer width = 4110
integer height = 1516
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
end on

event selectionchanged;
tab_1.tabpage_1.tabtextcolor = f_Gen_Color( 'o' )
tab_1.tabpage_2.tabtextcolor = f_Gen_Color( 'o' )
tab_1.tabpage_3.tabtextcolor = f_Gen_Color( 'o' )
tab_1.tabpage_4.tabtextcolor = f_Gen_Color( 'o' )
tab_1.tabpage_5.tabtextcolor = f_Gen_Color( 'o' )
tab_1.tabpage_6.tabtextcolor = f_Gen_Color( 'o' )
tab_1.tabpage_7.tabtextcolor = f_Gen_Color( 'o' )
dw_list.Visible = False

Choose Case newIndex
	Case 1
		tab_1.tabpage_1.tabtextcolor = f_Gen_Color( 'st' )
		dw_list.Visible = True
	Case 2
		tab_1.tabpage_2.tabtextcolor = f_Gen_Color( 'st' )
	Case 3
		tab_1.tabpage_3.tabtextcolor = f_Gen_Color( 'st' )
	Case 4
		tab_1.tabpage_4.tabtextcolor = f_Gen_Color( 'st' )
	Case 5
		tab_1.tabpage_5.tabtextcolor = f_Gen_Color( 'st' )
	Case 6
		tab_1.tabpage_6.tabtextcolor = f_Gen_Color( 'st' )
	Case 7
		tab_1.tabpage_7.tabtextcolor = f_Gen_Color( 'st' )
		
End Choose
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4073
integer height = 1400
string text = "Contrato"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_cto dw_cto
end type

on tabpage_1.create
this.dw_cto=create dw_cto
this.Control[]={this.dw_cto}
end on

on tabpage_1.destroy
destroy(this.dw_cto)
end on

type dw_cto from uo_dw_edit within tabpage_1
integer y = 40
integer width = 4686
integer height = 1216
integer taborder = 30
boolean bringtotop = true
string title = ""
string dataobject = "d_arch_mul_contrato_informacion_mul"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_ind = false
end type

event constructor;call super::constructor;
idw_cto = This
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4073
integer height = 1400
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_dh1 dw_dh1
dw_h1 dw_h1
end type

on tabpage_2.create
this.dw_dh1=create dw_dh1
this.dw_h1=create dw_h1
this.Control[]={this.dw_dh1,&
this.dw_h1}
end on

on tabpage_2.destroy
destroy(this.dw_dh1)
destroy(this.dw_h1)
end on

type dw_dh1 from uo_dw_list within tabpage_2
integer x = 101
integer y = 1260
integer width = 3753
integer height = 320
integer taborder = 11
string dataobject = "d_arch_mul_informacion_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_detselect = true
integer ii_detheight = 110
integer ii_posdety = 25
end type

event constructor;call super::constructor;
idw_dh1 = This

If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
end event

type dw_h1 from uo_dw_edit within tabpage_2
integer y = 40
integer width = 4686
integer height = 1208
integer taborder = 40
boolean bringtotop = true
string title = ""
string dataobject = "d_arch_mul_contrato_informacion_ofe"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_ind = false
end type

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4073
integer height = 1400
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_dh2 dw_dh2
dw_h2 dw_h2
end type

on tabpage_3.create
this.dw_dh2=create dw_dh2
this.dw_h2=create dw_h2
this.Control[]={this.dw_dh2,&
this.dw_h2}
end on

on tabpage_3.destroy
destroy(this.dw_dh2)
destroy(this.dw_h2)
end on

type dw_dh2 from uo_dw_list within tabpage_3
integer x = 101
integer y = 1260
integer width = 3753
integer height = 320
integer taborder = 21
string dataobject = "d_arch_mul_informacion_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_detselect = true
integer ii_detheight = 110
integer ii_posdety = 25
end type

event constructor;call super::constructor;
idw_dh2 = This

If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
end event

type dw_h2 from uo_dw_edit within tabpage_3
integer y = 40
integer width = 4686
integer height = 1208
integer taborder = 40
boolean bringtotop = true
string title = ""
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_ind = false
end type

type tabpage_4 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4073
integer height = 1400
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_dh3 dw_dh3
dw_h3 dw_h3
end type

on tabpage_4.create
this.dw_dh3=create dw_dh3
this.dw_h3=create dw_h3
this.Control[]={this.dw_dh3,&
this.dw_h3}
end on

on tabpage_4.destroy
destroy(this.dw_dh3)
destroy(this.dw_h3)
end on

type dw_dh3 from uo_dw_list within tabpage_4
integer x = 101
integer y = 1260
integer width = 3753
integer height = 320
integer taborder = 21
string dataobject = "d_arch_mul_informacion_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_detselect = true
integer ii_detheight = 110
integer ii_posdety = 25
end type

event constructor;call super::constructor;
idw_dh3 = This

If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
end event

type dw_h3 from uo_dw_edit within tabpage_4
integer y = 40
integer width = 4686
integer height = 1208
integer taborder = 40
boolean bringtotop = true
string title = ""
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_ind = false
end type

type tabpage_5 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4073
integer height = 1400
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_dh4 dw_dh4
dw_h4 dw_h4
end type

on tabpage_5.create
this.dw_dh4=create dw_dh4
this.dw_h4=create dw_h4
this.Control[]={this.dw_dh4,&
this.dw_h4}
end on

on tabpage_5.destroy
destroy(this.dw_dh4)
destroy(this.dw_h4)
end on

type dw_dh4 from uo_dw_list within tabpage_5
integer x = 101
integer y = 1260
integer width = 3753
integer height = 320
integer taborder = 21
string dataobject = "d_arch_mul_informacion_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_detselect = true
integer ii_detheight = 110
integer ii_posdety = 25
end type

event constructor;call super::constructor;
idw_dh4 = This

If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
end event

type dw_h4 from uo_dw_edit within tabpage_5
integer y = 40
integer width = 4686
integer height = 1208
integer taborder = 40
boolean bringtotop = true
string title = ""
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_ind = false
end type

type tabpage_6 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4073
integer height = 1400
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_dh5 dw_dh5
dw_h5 dw_h5
end type

on tabpage_6.create
this.dw_dh5=create dw_dh5
this.dw_h5=create dw_h5
this.Control[]={this.dw_dh5,&
this.dw_h5}
end on

on tabpage_6.destroy
destroy(this.dw_dh5)
destroy(this.dw_h5)
end on

type dw_dh5 from uo_dw_list within tabpage_6
integer x = 101
integer y = 1260
integer width = 3753
integer height = 320
integer taborder = 21
string dataobject = "d_arch_mul_informacion_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_detselect = true
integer ii_detheight = 110
integer ii_posdety = 25
end type

event constructor;call super::constructor;
idw_dh5 = This

If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
end event

type dw_h5 from uo_dw_edit within tabpage_6
integer y = 40
integer width = 4686
integer height = 1208
integer taborder = 40
boolean bringtotop = true
string title = ""
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_ind = false
end type

type tabpage_7 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4073
integer height = 1400
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_dh6 dw_dh6
dw_h6 dw_h6
end type

on tabpage_7.create
this.dw_dh6=create dw_dh6
this.dw_h6=create dw_h6
this.Control[]={this.dw_dh6,&
this.dw_h6}
end on

on tabpage_7.destroy
destroy(this.dw_dh6)
destroy(this.dw_h6)
end on

type dw_dh6 from uo_dw_list within tabpage_7
integer x = 101
integer y = 1260
integer width = 3753
integer height = 320
integer taborder = 21
string dataobject = "d_arch_mul_informacion_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_detselect = true
end type

event constructor;call super::constructor;
idw_dh6 = This

If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
end event

type dw_h6 from uo_dw_edit within tabpage_7
integer y = 40
integer width = 4686
integer height = 1208
integer taborder = 40
boolean bringtotop = true
string title = ""
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_ind = false
end type

