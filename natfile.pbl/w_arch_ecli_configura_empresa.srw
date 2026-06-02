//objectcomments /* Autor: César Vilela ~r~n    Función: Edición de config. empresa~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_empresa from w_gen_document_mant
end type
end forward

global type w_arch_ecli_configura_empresa from w_gen_document_mant
string title = "Administrar y Configurar Empresas"
boolean ib_posy = false
string is_fnsqlref = "fn_gen_blintegridadref_emp"
integer ii_detheight = 420
integer ii_headheight = 150
end type
global w_arch_ecli_configura_empresa w_arch_ecli_configura_empresa

type variables
w_arch_ecli_configura_empresa_edit  iw_edit
end variables

forward prototypes
public function boolean wf_mant ()
end prototypes

public function boolean wf_mant ();OpenSheetWithParm( iw_edit, istr_parm, gw_frame )
Return True
end function

on w_arch_ecli_configura_empresa.create
call super::create
end on

on w_arch_ecli_configura_empresa.destroy
call super::destroy
end on

type dw_1 from w_gen_document_mant`dw_1 within w_arch_ecli_configura_empresa
string dataobject = "d_arch_ecli_configura_empresa"
end type

event dw_1::constructor;call super::constructor;

f_SetObjectColor( This, '', 'text', String( f_Gen_Color('t') ) )
end event

event dw_1::retrieveend;call super::retrieveend;SelectRow( 0, False )
end event

event dw_1::rowfocuschanged;SelectRow( 0, False )
end event

event dw_1::clicked;SelectRow( 0, False )
end event

type dw_menu from w_gen_document_mant`dw_menu within w_arch_ecli_configura_empresa
end type

type st_sincontenido from w_gen_document_mant`st_sincontenido within w_arch_ecli_configura_empresa
end type

