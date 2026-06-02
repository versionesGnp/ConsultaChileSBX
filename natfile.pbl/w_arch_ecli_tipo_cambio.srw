//objectcomments /* Autor: César Vilela ~r~n    Función: Edición tipo cambio~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_tipo_cambio from w_gen_document_doc
end type
type dw_uf from uo_dw_list within w_arch_ecli_tipo_cambio
end type
end forward

global type w_arch_ecli_tipo_cambio from w_gen_document_doc
string title = "Tipo de Cambio"
long backcolor = 67108864
boolean ib_fulllist = true
boolean ib_permitemod = true
boolean ib_posy = false
event postopen ( )
dw_uf dw_uf
end type
global w_arch_ecli_tipo_cambio w_arch_ecli_tipo_cambio

type variables

Boolean ib_refresh = False
DateTime	id_sys
String is_wsTCini
end variables

forward prototypes
public function integer wf_new ()
public function boolean wf_readyforadd ()
public subroutine wf_consultar ()
public subroutine wf_add ()
public function boolean wf_savedocument ()
public function boolean wf_tchoy ()
public function integer wf_tcchile (string as_pai)
public subroutine wf_tabpage (string as_tab)
public function string wf_profilewstc ()
public function integer wf_config ()
end prototypes

event postopen();
wf_Consultar( )
dw_1.SetFocus( )
Return



If ib_task Then
	dw_menu.Object.cb_task.color = f_Gen_Color( 'white' )
End If

wf_New( )
end event

public function integer wf_new ();Decimal	ldc_tc
DateTime	ld_hoy


ib_new = True
ib_saved = True

dw_1.Reset( )
dw_list.Reset( )
dw_uf.Reset( )

dw_1.SetTransObject( SqlCa )
dw_1.InsertRow(0)
dw_1.SetFocus( )

ld_hoy = DateTime( Today( ) )
ldc_tc = f_GenTipoCambio( ld_hoy ) 

wf_tab( 'PG1')

dw_1.Object.n_factor_tic[ 1] = ldc_tc
dw_1.Object.d_trabajo_tic[ 1] = ld_hoy

dw_1.AcceptText( )

Return 1
end function

public function boolean wf_readyforadd ();/* wf_ReadyForAdd( ) */

Boolean	lb_ready

lb_ready = ( dw_1.GetColumnName( ) = 'n_factor_tic' )

If lb_ready Then
	wf_Add( )
End If

Return lb_ready

end function

public subroutine wf_consultar ();DateTime	ld_hoy, ld_sys
Integer	li_anio, li_fnd
String	ls_fnd


dw_1.AcceptText( )

ld_hoy = dw_1.Object.d_trabajo_tic[ 1]
li_anio = Year( Date( ld_hoy ) )
ib_saved = True

dw_list.SetRedraw( False )
dw_uf.SetRedraw( False )

f_GenProcesando( 'Espere un momento...' )

dw_list.Reset( )
dw_list.Retrieve( li_anio, is_pai )
ls_fnd = 'n_dia = ' + String( ld_hoy, 'dd' ) +''
dw_uf.Reset( )
dw_uf.Retrieve( li_anio, is_pai )
li_fnd = dw_list.Find( ls_fnd, True )
li_fnd = dw_uf.Find( ls_fnd, True )

dw_list.SetRedraw( True )
dw_uf.SetRedraw( True )
f_GenProcesando( '' )

Return

end subroutine

public subroutine wf_add ();wf_SaveDocument( )
end subroutine

public function boolean wf_savedocument ();Boolean	lb_err
DateTime	ld_hoy, ld_crea
Decimal	ldc_tc
String	ls_cod


dw_1.AcceptText( )

ld_hoy = dw_1.Object.d_trabajo_tic[ 1]
ldc_tc = dw_1.Object.n_factor_tic[ 1]
ld_crea = DateTime( Today( ), Now( ) )

Select	c_codigo_tic
Into		:ls_cod
From		gentipocambio
Where		d_trabajo_tic = :ld_hoy 
And		c_codigo_pai = :is_pai ;

ls_cod = f_Trim( ls_cod )

Choose Case is_tab
	Case 'PG1'
		If ls_cod = '' Then
			ls_cod = String( ld_hoy, 'yymmdd' )
		
			Insert Into gentipocambio
				( c_codigo_pai, c_codigo_tic, d_trabajo_tic, n_factor_tic, c_codigo_usu, d_creacion_tic, c_activo_tic )
			Values
				( :is_pai, :ls_cod, :ld_hoy, :ldc_tc, :gs_usuario, :ld_crea, '1' ) 
			Using SqlCa ;
		Else
			Update	gentipocambio
			Set		n_factor_tic = :ldc_tc,
						c_usumod_tic = :gs_usuario,
						d_modifi_tic = :ld_crea
			Where		c_codigo_tic = :ls_cod
			And		c_codigo_pai = :is_pai 
			And		d_trabajo_tic = :ld_hoy ;
		End If

	Case 'PG2'
		If ls_cod = '' Then
			ls_cod = String( ld_hoy, 'yymmdd' )
		
			Insert Into gentipocambio
				( c_codigo_pai, c_codigo_tic, d_trabajo_tic, n_factor_tic, n_unifom_tic, c_codigo_usu, d_creacion_tic, c_activo_tic )
			Values
				( :is_pai, :ls_cod, :ld_hoy, 0, :ldc_tc, :gs_usuario, :ld_crea, '1' ) 
			Using SqlCa ;
		Else
			Update	gentipocambio
			Set		n_unifom_tic = :ldc_tc,
						c_usumod_tic = :gs_usuario,
						d_modifi_tic = :ld_crea
			Where		c_codigo_tic = :ls_cod
			And		c_codigo_pai = :is_pai 
			And		d_trabajo_tic = :ld_hoy ;
		End If
End Choose

If f_SqlError( SqlCa, 'No se pudo actualizar el tipo de cambio' ) = -1 Then
	RollBack Using SqlCa ;
	lb_err = True
Else
	Commit Using SqlCa ;
	lb_err = False
End If

ib_saved = True
ib_new = False

wf_Consultar( )
If lb_err Then
	MessageBox( Title, 'No se pudo guardar el Tipo de Cambio.', Exclamation! )
Else
	If ld_hoy = id_sys Then f_genHeaderRefresh( ) 
	MessageBox( Title, 'Tipo de Cambio guardado correctamente.' )
End If
gw_frame.SetMicroHelp( 'Listo' )

Return True
end function

public function boolean wf_tchoy ();/* wf_TCHoy( ) */
s_parm	lstr_parm

Choose Case is_pai
	Case 'CL' 
		ib_refresh = True
		//wf_TCChile( is_pai )
		wf_ProfileWStc( )
		
	Case Else
		Open( w_arch_ecli_tipo_cambio_hoy )
		lstr_parm = Message.PowerObjectParm
		
		If lstr_parm.s_cad[ 1] = '' Then Return False
		
		dw_1.Object.d_trabajo_tic[ 1] = lstr_parm.d_fecha[ 1]
		dw_1.Object.n_factor_tic[ 1] = lstr_parm.n_num[ 1]
		
		wf_SaveDocument( )
End Choose

Return True


end function

public function integer wf_tcchile (string as_pai);
/* wf_TCChile( as_pai ) */


// Ya no ejecutará esta función, debe llamar a wf_ProfileWS
Return 1


DateTime ld_hoy
String ls_dir, ls_hoy, ls_exe, ls_ini, ls_run, ls_parm


ls_dir = GetCurrentDirectory( )

dw_1.AcceptText( )

ld_hoy = dw_1.Object.d_trabajo_tic[ 1]
ls_hoy = String( ld_hoy, 'yymmdd' )
ls_Exe = 'WSTC\bl-eclipseWSTC.exe'
is_wsTCini = 'WSTC\bl-eclipseWSTC.ini'
ls_ini = ls_dir + '\' + gs_ini
ls_exe = ls_dir + '\' + ls_exe
is_wsTCini = ls_dir + '\' + is_wsTCini

ls_parm = gs_emp + ' ' + gs_usuario + ' ' + as_pai + ' ' + ls_hoy + ' ' + ls_ini + ' ' + gs_iniProfile
ls_run = ls_exe + ' ' + ls_parm

If Not FileExists( ls_ini ) Then
	MessageBox( Title, 'No se pudo encontrar archivo de configuración:' + Char(13) + &
							ls_ini, Exclamation! )
	Return -1
End If

If Not FileExists( ls_exe ) Then
	MessageBox( Title, 'No se pudo encontrar programa ejecutable WS:' + Char(13) + &
							ls_exe, Exclamation! )
	Return -1
End If

Run(ls_run)

Return 1
end function

public subroutine wf_tabpage (string as_tab);DateTime	ld_hoy
String	ls_mda = 'USD'

dw_list.Visible = ( as_tab = 'PG1' )
dw_uf.Visible = ( as_tab = 'PG2' )

ld_hoy = dw_1.Object.d_trabajo_tic[ 1]
If as_tab = 'PG2' Then ls_mda = 'UF'

dw_1.Object.n_factor_tic[ 1] = f_GenTipoCambioMda( ld_hoy, ls_mda )

dw_1.AcceptText( )

end subroutine

public function string wf_profilewstc ();
/* wf_ProfileWSTC( ) */
Int		li_ret
DateTime	ld_hoy, ld_ser
Dec{2}	ldc_fac, ldc_int, ldc_uf
String	ls_emp, ls_tic, ls_pai, ls_usu, ls_fac, ls_int, ls_uf, &
			ls_section, ls_ora
String	ls_cod, ls_est, ls_msg


f_GenProcesando( 'Buscando Indicadores/Tipo de Cambio' )

dw_1.AcceptText( )
ld_hoy = dw_1.Object.d_trabajo_tic[ 1]
ld_ser = f_ServerDate( )
ls_tic = String( ld_hoy, 'yymmdd' )
ls_emp = gs_emp
ls_usu = gs_usuario

li_ret = f_GenTCWeb( ld_hoy, ld_ser, ldc_fac, ldc_uf, ldc_int ) 
// Por Compatibilidad
ls_fac = String( ldc_fac ); ls_int = String( ldc_int ) ; ls_uf = String( ldc_uf )
ls_ora = '0'
If f_IsOracle( ) Then ls_ora = '1'

Choose Case ls_ora
	Case '1'
		ldc_fac = 0; ldc_uf = 0; ldc_int = 0;
		
		Select	to_number( :ls_fac ), to_number( :ls_int ), to_number( :ls_uf ) 
					Into :ldc_fac, :ldc_int, :ldc_uf
		From		dual ;
		
		ls_msg = SqlCa.SqlErrText 
		
		Declare usp_regTC Procedure For 
			usp_gen_blregistraTipoCambio( as_emp => :ls_emp, as_pai => :ls_pai, as_tic => :ls_tic, 
													an_fac => :ldc_fac, an_int => :ldc_int, an_uf => :ldc_uf, as_usu => :ls_usu )
		Using SqlCa ;
		
		Execute usp_regTC;
		ls_msg = SqlCa.SqlErrText 
		
		Fetch usp_regTC Into :ls_cod, :ls_est, :ls_msg ;
		ls_msg = SqlCa.SqlErrText 
		
		Close usp_regTC;
		Commit Using SqlCa ;
		
	Case '0'
		ldc_fac	= Dec(ls_fac) 
		ldc_int	= Dec(ls_int) 
		ldc_uf	= Dec(ls_uf)
	
		uo_DataStore	lds_wstc
		
		Destroy	lds_wstc
		lds_wstc= Create uo_DataStore
		lds_wstc.DataObject = 'd_arch_ecli_tipo_cambio_registra'
		lds_wstc.SetTransObject( SqlCa )
		lds_wstc.ib_mod = True
		
		If lds_wstc.Retrieve( ls_emp, ls_pai, ls_tic, ldc_fac, ldc_int, ldc_uf, ls_usu ) > 0 Then
			ls_cod = f_Trim( lds_wstc.Object.CodigoGenerado[ 1] )
			ls_est = f_Trim( lds_wstc.Object.Estado[ 1] )
			ls_msg = f_Trim( lds_wstc.Object.MensajeResultado[ 1] )	
		Else
			ls_msg = f_Trim( lds_wstc.istr_parm.s_cad[ 4] )
		End If
		
		Destroy	lds_wstc
		Commit Using SqlCa ;

End Choose

f_GenProcesando( '' )

dw_1.AcceptText( )
dw_1.Event ItemChanged( 1, dw_1.Object.d_trabajo_tic, String( dw_1.Object.d_trabajo_tic[ 1]))

If ld_hoy = id_sys Then f_GenHeaderRefresh( )

wf_Consultar( )
dw_1.SetFocus( ) 
dw_1.SetColumn( 'd_trabajo_tic' ) 

Return ls_cod



/* WEB Service uso externo
ls_section = 'WSTC' + gs_emp
ls_emp = ProfileString (is_wsTCini, ls_section, 'emp', '')
ls_tic = ProfileString (is_wsTCini, ls_section, 'tic', '')
ls_pai = ProfileString (is_wsTCini, ls_section, 'pai', '')
ls_usu = ProfileString (is_wsTCini, ls_section, 'usu', '')
ls_fac = ProfileString (is_wsTCini, ls_section, 'fac', '')
ls_int = ProfileString (is_wsTCini, ls_section, 'int', '')
ls_uf  = ProfileString (is_wsTCini, ls_section, 'uf', '')
*/



end function

public function integer wf_config ();
Select c_codigo_pai
Into  :is_pai
From  genEmpresa
Where c_codigo_emp = :gs_emp ;

is_pai = f_Trim( is_pai )		

id_sys = f_ServerDate( )

Return 1
end function

on w_arch_ecli_tipo_cambio.create
int iCurrent
call super::create
this.dw_uf=create dw_uf
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_uf
end on

on w_arch_ecli_tipo_cambio.destroy
call super::destroy
destroy(this.dw_uf)
end on

event activate;call super::activate;
Return

String	ls_wsTC

/* Verifica si usa información por DB o por extracción del INI de WS */
ls_wsTC = Upper( ProfileString ( gs_ini, gs_iniProfile, 'WSTC', 'DB') )

If ib_refresh Then 
	
	If ls_wsTC = 'LOCAL' And Not is_wsTCini = '' Then
		//wf_ProfileWSTC( )
	End If
	
	dw_1.AcceptText( )
	dw_1.Event ItemChanged( 1, dw_1.Object.d_trabajo_tic, String( dw_1.Object.d_trabajo_tic[ 1]))
	wf_Consultar( )
End If
ib_refresh = False

end event

event resize;call super::resize;Long	ll_x1


dw_uf.Height = dw_list.Height 
dw_uf.Width = dw_list.Width 

dw_uf.X = dw_list.X
dw_uf.Y = dw_list.Y

ll_x1 = Long( dw_1.Object.l_tabpage.X1 ) 
dw_1.Object.l_tabpage.X2 = newWidth - ( ll_x1 * 2)

end event

event open;call super::open;
PostEvent( 'PostOpen' )
end event

type dw_1 from w_gen_document_doc`dw_1 within w_arch_ecli_tipo_cambio
integer width = 3694
integer height = 624
string dataobject = "d_arch_ecli_tipo_cambio"
end type

event dw_1::buttonclicked;call super::buttonclicked;Integer	li_rc
String	ls_xml, ls_error, ls_dia, ls_usp, ls_sql


Choose Case dwo.Name
	Case 'cb_consultar'
		wf_Consultar( )	
		
	Case 'cb_guardar'
		wf_SaveDocument( )	
		
	Case 'cb_tchoy'
		wf_TCHoy( )
		
End Choose
end event

event dw_1::itemchanged;call super::itemchanged;DateTime	ld_hoy
Decimal	ldc_tc
String	ls_mda = 'USD'


ib_saved = False

Choose Case dwo.Name
	Case 'd_trabajo_tic'
		ld_hoy = DateTime( data ) 
		If is_tab = 'PG2' Then ls_mda = 'UF'
		ldc_tc = f_GenTipoCambioMda( ld_hoy, ls_mda )
		This.Object.n_factor_tic[ row] = ldc_tc 

End Choose
end event

event dw_1::editchanged;call super::editchanged;ib_saved = False
end event

event dw_1::clicked;call super::clicked;


Choose Case dwo.Name
		
	Case 'tab_page1'
		wf_Tab( 'PG1' )
		
	Case 'tab_page2'
		wf_Tab( 'PG2' )
		
End Choose
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_ecli_tipo_cambio
string dataobject = "d_gen_menu_toolbar_xls"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_ecli_tipo_cambio
boolean visible = true
integer x = 165
integer y = 776
integer width = 3570
integer height = 1028
string dataobject = "d_arch_ecli_tipo_cambio_det"
boolean border = false
end type

event dw_list::constructor;call super::constructor;This.Object.DataWindow.Header.Height = 0
end event

type dw_uf from uo_dw_list within w_arch_ecli_tipo_cambio
integer y = 932
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_arch_ecli_tipo_cambio_uf_det"
boolean border = false
end type

event constructor;call super::constructor;
If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
This.Object.DataWindow.Header.Height = 0
end event

