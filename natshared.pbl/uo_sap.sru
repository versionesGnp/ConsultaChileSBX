forward
global type uo_sap from nonvisualobject
end type
end forward

global type uo_sap from nonvisualobject autoinstantiate
end type

type variables

Boolean	b_SelectDB = True
String s_soc, s_tca, s_caj, s_gru, s_DB
DateTime d_ini, d_fin


end variables

forward prototypes
public function boolean preparativosok (boolean ib_msg)
end prototypes

public function boolean preparativosok (boolean ib_msg);
// PreparativosOK( ib_MSG )
Boolean	lb_OK = False
DateTime	ld_hoy
String	ls_DB, ls_fase1, ls_fase2, ls_fase3


ld_hoy = f_ServerDate()
ls_DB = This.s_db

Select fase1, fase2, fase3 
Into   :ls_fase1, :ls_fase2, :ls_fase3
From   utSapPreparativos 
Where  dpreparativo = :ld_hoy
And    DB = :ls_DB
;

ls_fase1 = f_Trim( ls_fase1 )
ls_fase2 = f_Trim( ls_fase2 )
ls_fase3 = f_Trim( ls_fase3 )

lb_OK = ( ls_fase1 = '1' And ls_fase2 = '1' And ls_fase3 = '1' )

If lb_ok Then 
	Return True
End If

String	ls_msg

ls_msg = 'Preparativos Pendientes' + Char(13) + Char(13) 
If Not ls_fase1 = '1' Then ls_msg = ls_msg + 'Falta Aplicar Fase 1.' + Char(13) 
If Not ls_fase2 = '1' Then ls_msg = ls_msg + 'Falta Aplicar Fase 2.' + Char(13) 
If Not ls_fase3 = '1' Then ls_msg = ls_msg + 'Falta Aplicar Fase 3.' 

ls_msg = ls_msg +  Char(13) +  Char(13) + 'No se puede continuar.'

If ib_msg Then
	blEclipse.MessageBox( 'Preparativos de Inf. Cuadratura', ls_msg, Exclamation! )
End If

Return False






end function

on uo_sap.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_sap.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

