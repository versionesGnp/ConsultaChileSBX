//objectcomments /* Autor: César Vilela */
forward
global type w_mant_gen_estado_list from w_gen_document_mant
end type
end forward

global type w_mant_gen_estado_list from w_gen_document_mant
string title = "Estado (Entidades)"
end type
global w_mant_gen_estado_list w_mant_gen_estado_list

type variables
w_mant_gen_estado_edit  iw_edit
end variables

forward prototypes
public function boolean wf_mant ()
end prototypes

public function boolean wf_mant ();OpenSheetWithParm( iw_edit, istr_parm, gw_frame, 0, Original! )
Return True
end function

on w_mant_gen_estado_list.create
call super::create
end on

on w_mant_gen_estado_list.destroy
call super::destroy
end on

type dw_1 from w_gen_document_mant`dw_1 within w_mant_gen_estado_list
string dataobject = "d_mant_gen_estado_list"
end type

event dw_1::buttonclicked;call super::buttonclicked;
String	ls_edo

 
Choose Case dwo.Name
	Case 'cb_pai'
		
	Case 'cb_det'
		ls_edo = dw_1.Object.v_nombre[ row]
End Choose
end event

type dw_menu from w_gen_document_mant`dw_menu within w_mant_gen_estado_list
end type

type st_sincontenido from w_gen_document_mant`st_sincontenido within w_mant_gen_estado_list
end type

