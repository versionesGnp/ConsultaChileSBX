forward
global type cliente from nonvisualobject
end type
end forward

global type cliente from nonvisualobject autoinstantiate
end type

type variables

Boolean	Existe
Dec		RentaLiquida
DateTime	Fecha_nac
LongLong	Rut
Int		Cod_Parque
String	DB, tabla, DataObject, &
			DV, a_paterno, a_materno, nombre, nomCliente
end variables

forward prototypes
public function string edit (longlong al_rut, string asdb)
public function string info (long alrut)
end prototypes

public function string edit (longlong al_rut, string asdb);/*
lstr_parm.s_cad[ 1] = ls_DB
		lstr_parm.n_num[ 1] = ll_rut
		FadeEffect( True )
		OpenWithParm( w_arch_mul_cliente_edit, lstr_parm )
		FadeEffect( False )
		*/
		Return ''
end function

public function string info (long alrut);
Dec		ln_total_rent
DateTime	ld_nac
String	ls_dv, ls_nom, ls_pat, ls_mat, ls_no1

Select	DV, NVL( cli.a_paterno, '' ), NVL( cli.a_materno, ''), Nvl( cli.Nombre, ''), 
         NVL( cli.a_paterno, '' ) || ' ' || NVL( cli.a_materno, '') || ' ' || Nvl( cli.Nombre, ''), Fecha_Nac,
			total_rent
Into		:ls_dv, :ls_pat, :ls_mat, :ls_no1, :ls_nom, :ld_nac, :ln_total_rent
From		cliente cli
Where		cli.rut = :alRut
Using		SqlCa ;

This.a_paterno = ls_pat
This.a_materno = ls_mat
This.nombre = ls_no1
This.RUT = alRut
This.DV = ls_dv
This.nomcliente = ls_nom
This.Fecha_nac  = ld_nac
This.RentaLiquida = ln_total_rent


This.Existe = False
If SqlCa.SqlCode = 0 Then
	This.Existe = True
End If

Return ls_dv
end function

on cliente.create
call super::create
TriggerEvent( this, "constructor" )
end on

on cliente.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

