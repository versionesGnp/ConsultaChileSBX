//objectcomments Generated Application Object
forward
global type p_consulta19 from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type p_consulta19 from application
string appname = "p_consulta19"
string appruntimeversion = "19.2.0.2779"
end type
global p_consulta19 p_consulta19

on p_consulta19.create
appname = "p_consulta19"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on p_consulta19.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

