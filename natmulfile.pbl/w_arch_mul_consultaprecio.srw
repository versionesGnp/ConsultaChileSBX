forward
global type w_arch_mul_consultaprecio from wa_response
end type
end forward

global type w_arch_mul_consultaprecio from wa_response
integer width = 4009
integer height = 1592
string title = "Consulta Precio MultiProducto"
windowanimationstyle closeanimation = noanimation!
end type
global w_arch_mul_consultaprecio w_arch_mul_consultaprecio

type variables

MP MP
end variables

forward prototypes
public function integer wf_open ()
end prototypes

public function integer wf_open ();
Int		li_nil, li_cmp
String	ls_db, ls_nil


dw_1.AcceptText( )

li_cmp = f_Zero( dw_1.Object.CodigoMP[ 1] )
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

dw_list.Retrieve( li_cmp, ls_nil, 'LIST', ls_DB )

dw_list.SetRedraw( True )
dw_list.SetFocus( )
//f_GenProcesando( '' )

Return 1
end function

on w_arch_mul_consultaprecio.create
call super::create
end on

on w_arch_mul_consultaprecio.destroy
call super::destroy
end on

event open;call super::open;

MP = Message.PowerObjectParm

dw_1.InsertRow( 1 )
dw_1.Object.CodigoMP[ 1] = MP.Codigomp
dw_1.Object.DB[ 1] = MP.Db
dw_1.Accepttext( )

dw_list.Object.DataWindow.ReadOnly = True
dw_list.Object.cb_add.Visible = False

dw_list.SetObjectColor( 'Codigo', 'Grupo = 1', {'o', 't'})
dw_list.SetObjectColor( 'Descripcion', 'Grupo = 1', {'o', 't'})
dw_list.SetObjectColor( 'Total', 'Grupo = 1', {'o', 't'})
dw_list.SetObjectColor( 'Tipo_Producto', 'Grupo = 1', {'st', 't'})

wf_Open( )
end event

type dw_list from wa_response`dw_list within w_arch_mul_consultaprecio
integer x = 110
integer y = 324
integer width = 3762
integer height = 988
string dataobject = "d_arch_mul_consultaprecio_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detselect = true
boolean ib_exportxls = false
integer ii_detheight = 100
end type

type dw_1 from wa_response`dw_1 within w_arch_mul_consultaprecio
integer width = 4018
integer height = 1352
string dataobject = "d_arch_mul_consultaprecio"
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

type cb_cancelar from wa_response`cb_cancelar within w_arch_mul_consultaprecio
boolean visible = false
integer x = 2962
integer y = 1384
boolean enabled = false
boolean cancel = false
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_mul_consultaprecio
integer x = 3525
integer y = 1384
boolean enabled = true
boolean cancel = true
end type

event cb_aceptar::clicked;call super::clicked;
Close( Parent )
end event

