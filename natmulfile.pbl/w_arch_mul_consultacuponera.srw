forward
global type w_arch_mul_consultacuponera from wa_response
end type
end forward

global type w_arch_mul_consultacuponera from wa_response
integer width = 4471
integer height = 1716
string title = "Consulta Cuponera MultiProducto"
windowanimationstyle closeanimation = noanimation!
end type
global w_arch_mul_consultacuponera w_arch_mul_consultacuponera

type variables

MP MP
end variables

forward prototypes
public function integer wf_open ()
end prototypes

public function integer wf_open ();
DateTime	ld_ini, ld_fin
Double	ldc_nro
String	ls_emp, ls_fec, ls_caj, ls_cup, ls_cto


SetNull( ls_cto )
SetNull( ls_caj )
SetNull( ls_cup )
SetNull( ld_ini )
SetNull( ld_fin )

dw_1.AcceptText( )
dw_1.SetFocus( )

ls_emp = '01' 
ls_cto = f_Trim( dw_1.Object.Barra[ 1] )

dw_list.SetRedraw( False )

dw_list.Retrieve( ls_emp, ls_cto, ls_cup, ls_caj, ld_ini, ld_fin )
If Not f_Trim( ls_cup ) = '' Then dw_list.Find( 'nro_cupon = ' + ls_cup, True )

dw_list.SetRedraw( True )
dw_list.SetFocus( )

Return 1

end function

on w_arch_mul_consultacuponera.create
call super::create
end on

on w_arch_mul_consultacuponera.destroy
call super::destroy
end on

event open;call super::open;

MP = Message.PowerObjectParm

dw_1.InsertRow( 1 )
dw_1.Object.CodigoMP[ 1] = MP.Codigomp
dw_1.Object.MPBarra[ 1] = MP.MPBarra
dw_1.Object.Barra[ 1] = MP.Barra
dw_1.Object.RUT[ 1] = MP.RUT
dw_1.Object.DV[ 1] = MP.DV
dw_1.Object.DB[ 1] = MP.Db
dw_1.Accepttext( )

dw_1.ColEnabled( False )

dw_list.Object.DataWindow.ReadOnly = True
//dw_list.Object.cb_det.Visible = False
//dw_list.Object.p_det.Visible = False
dw_1.SetObjectColor( 'MPbarra', 'st')
dw_1.SetObjectColor( 'barra', 'ba')

dw_list.Object.Rut.Visible = False
dw_list.Object.Rut_t.Visible = False

dw_list.Object.DB.Visible = False
dw_list.Object.DB_t.Visible = False

dw_list.SetObjectColor( 'EstadoPago', 'UpperTrim( EstadoPago ) = "VIGENTE"', {'t', 'Alegria2'} )
dw_list.SetObjectColor( 'nro_cupon', 'o' )
dw_list.SetObjectColor( 'Contrato', 'ba' )

wf_Open( )
end event

type dw_list from wa_response`dw_list within w_arch_mul_consultacuponera
integer x = 110
integer y = 324
integer width = 4242
integer height = 1112
string dataobject = "d_arch_mul_consultacuponera_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detselect = true
boolean ib_exportxls = false
integer ii_detheight = 100
end type

type dw_1 from wa_response`dw_1 within w_arch_mul_consultacuponera
integer width = 4498
integer height = 1476
string dataobject = "d_arch_mul_consultacuponera"
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

type cb_cancelar from wa_response`cb_cancelar within w_arch_mul_consultacuponera
boolean visible = false
integer x = 3401
integer y = 1512
boolean enabled = false
boolean cancel = false
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_mul_consultacuponera
integer x = 3963
integer y = 1512
boolean enabled = true
boolean cancel = true
end type

event cb_aceptar::clicked;call super::clicked;
Close( Parent )
end event

