forward
global type mp from nonvisualobject
end type
end forward

global type mp from nonvisualobject autoinstantiate
end type

type variables

Integer CodigoMP, CodParque, Capacidad, TipoBeneficiarios, Servicio
String DB
String Base, Serie, Barra, DV, MPBarra
Long	Numero, Rut

Dec	Precio, PorcentajePie, Pie, UF, PiePesos, PieMinimo
String Moneda
end variables

forward prototypes
public function decimal porcentajepie (integer icodigomp)
public function string moneda (integer icodigomp)
end prototypes

public function decimal porcentajepie (integer icodigomp);
Dec	ln_min

Select	PorcentajePie
Into		:ln_min
From		mpProducto
Where		CodigoMP = :iCodigoMP
Using		SqlCa ;

ln_min = f_Zero( ln_min )

Return ln_min
end function

public function string moneda (integer icodigomp);
String	ls_moneda

Select Moneda 
Into :ls_moneda
From   MPproducto 
Where  codigoMP = :iCodigoMP ;

ls_moneda = f_Trim( ls_moneda )

Return ls_moneda
end function

on mp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on mp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

