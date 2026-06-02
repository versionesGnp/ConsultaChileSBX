//objectcomments /* Autor: César Vilela */
forward
global type w_mant_gen_etiqueta_list from w_gen_document_mant
end type
end forward

global type w_mant_gen_etiqueta_list from w_gen_document_mant
string title = "Etiqueta"
boolean ib_retxemp = true
end type
global w_mant_gen_etiqueta_list w_mant_gen_etiqueta_list

type variables
w_mant_gen_etiqueta_edit  iw_edit
end variables

forward prototypes
public function boolean wf_mant ()
end prototypes

public function boolean wf_mant ();OpenSheetWithParm( iw_edit, istr_parm, gw_frame, 0, Original! )
Return True
end function

on w_mant_gen_etiqueta_list.create
call super::create
end on

on w_mant_gen_etiqueta_list.destroy
call super::destroy
end on

type dw_1 from w_gen_document_mant`dw_1 within w_mant_gen_etiqueta_list
string dataobject = "d_mant_gen_etiqueta_list"
end type

type dw_menu from w_gen_document_mant`dw_menu within w_mant_gen_etiqueta_list
end type

type st_sincontenido from w_gen_document_mant`st_sincontenido within w_mant_gen_etiqueta_list
end type

