//objectcomments Autor: César Vilela R.~r~nFunción: Solo consulta de lista de precios MultiProducto (hereda de w_arch_mul_preciolista)
forward
global type w_arch_mul_preciolista_consulta from w_arch_mul_preciolista
end type
end forward

global type w_arch_mul_preciolista_consulta from w_arch_mul_preciolista
boolean ib_edit = false
end type
global w_arch_mul_preciolista_consulta w_arch_mul_preciolista_consulta

on w_arch_mul_preciolista_consulta.create
call super::create
end on

on w_arch_mul_preciolista_consulta.destroy
call super::destroy
end on

type dw_1 from w_arch_mul_preciolista`dw_1 within w_arch_mul_preciolista_consulta
end type

type dw_menu from w_arch_mul_preciolista`dw_menu within w_arch_mul_preciolista_consulta
end type

type dw_list from w_arch_mul_preciolista`dw_list within w_arch_mul_preciolista_consulta
end type

