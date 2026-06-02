forward
global type w_arch_mul_consultahijos from wa_response
end type
end forward

global type w_arch_mul_consultahijos from wa_response
integer width = 4009
integer height = 1592
string title = "Consulta MultiProducto y Contratos Hijos"
windowanimationstyle closeanimation = noanimation!
end type
global w_arch_mul_consultahijos w_arch_mul_consultahijos

type variables

MP MP
end variables

forward prototypes
public function integer wf_open ()
end prototypes

public function integer wf_open ();
Int		li_nil, li_cmp
String	ls_db, ls_nil, ls_cto
Long		ln_rut

dw_1.AcceptText( )

li_cmp = f_Zero( dw_1.Object.CodigoMP[ 1] )
ls_cto = f_Trim( dw_1.Object.Barra[ 1] )
ln_rut = f_Zero( dw_1.Object.rut[ 1] )
ls_DB = UpperTrim( dw_1.Object.DB[ 1] )

SetNull( li_nil ) ; SetNull( ls_nil ) ;

If li_cmp = 0 Then
	dw_1.Setfocus( 'CodigoMP' )
	blEclipse.Messagebox( Title, 'Debe Seleccionar MultiProducto para continuar.', Exclamation! )
	Return 0
End If

If ls_DB = '' Then
	blEclipse.Messagebox( Title, 'Debe Seleccionar DB para continuar.', Exclamation! )
	Return 0
End If

//f_GenProcesando( 'Generando Consulta, Espere...' )

dw_list.SetRedraw( False )

Long	rows

rows = dw_list.Retrieve( ls_cto, ln_rut, ls_DB, 'CTO' )
dw_list.ExpandAll( )

dw_list.SetRedraw( True )
dw_list.SetFocus( )
//f_GenProcesando( '' )

Return 1
end function

on w_arch_mul_consultahijos.create
call super::create
end on

on w_arch_mul_consultahijos.destroy
call super::destroy
end on

event open;call super::open;

MP = Message.PowerObjectParm

dw_1.InsertRow( 1 )
dw_1.Object.CodigoMP[ 1] = MP.Codigomp
dw_1.Object.Barra[ 1] = MP.Barra
dw_1.Object.RUT[ 1] = MP.RUT
dw_1.Object.DV[ 1] = MP.DV
dw_1.Object.DB[ 1] = MP.Db
dw_1.Accepttext( )

dw_1.ColEnabled( False )

dw_list.Object.DataWindow.ReadOnly = True
dw_list.Object.cb_det.Visible = False
dw_list.Object.p_det.Visible = False
dw_list.Object.cb_mcup.Visible = False
dw_list.Object.p_mcup.Visible = False
dw_list.SetObjectColor( 'barra', 'st')
dw_list.SetObjectColor( 'barra_h', 'ba')
dw_1.SetObjectColor( 'barra', 'st')

wf_Open( )
end event

type dw_list from wa_response`dw_list within w_arch_mul_consultahijos
integer x = 110
integer y = 324
integer width = 3762
integer height = 988
string dataobject = "d_arch_mul_contrato_consulta_Det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detselect = true
boolean ib_exportxls = false
integer ii_detheight = 100
end type

event dw_list::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name

	Case 'cb_cup'
		MP.CodigoMP = dw_1.Object.CodigoMP[ 1] 
		MP.MPBarra = dw_1.Object.Barra[ 1] 
		MP.Barra = dw_list.Object.Barra_H[ row] 
		MP.RUT = dw_1.Object.RUT[ 1] 
		MP.DV  = UpperTrim( dw_1.Object.DV[ 1] )
		MP.DB  = UpperTrim( dw_1.Object.DB[ 1] )
		
		OpenWithParm( w_arch_mul_consultaCuponera, MP )

End Choose
end event

type dw_1 from wa_response`dw_1 within w_arch_mul_consultahijos
integer width = 4018
integer height = 1352
string dataobject = "d_arch_mul_consultahijos"
end type

event dw_1::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_open'
		wf_Open( )
		
End Choose
end event

event dw_1::itemchanged;call super::itemchanged;

dw_list.Reset( )
end event

type cb_cancelar from wa_response`cb_cancelar within w_arch_mul_consultahijos
boolean visible = false
integer x = 2962
integer y = 1384
boolean enabled = false
boolean cancel = false
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_mul_consultahijos
integer x = 3525
integer y = 1384
boolean enabled = true
boolean cancel = true
end type

event cb_aceptar::clicked;call super::clicked;
Close( Parent )
end event

