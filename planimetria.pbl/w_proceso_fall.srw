forward
global type w_proceso_fall from window
end type
type dw_4 from datawindow within w_proceso_fall
end type
type dw_3 from datawindow within w_proceso_fall
end type
type dw_2 from datawindow within w_proceso_fall
end type
type dw_1 from datawindow within w_proceso_fall
end type
type cb_2 from commandbutton within w_proceso_fall
end type
type cb_1 from commandbutton within w_proceso_fall
end type
end forward

global type w_proceso_fall from window
integer width = 4503
integer height = 2248
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean resizable = true
long backcolor = 67108864
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_proceso_fall w_proceso_fall

on w_proceso_fall.create
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_4,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_proceso_fall.destroy
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;gf_centrar(w_proceso_fall)

dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type dw_4 from datawindow within w_proceso_fall
integer x = 3159
integer y = 60
integer width = 1225
integer height = 992
integer taborder = 20
boolean titlebar = true
string title = "none"
string dataobject = "dw_asigna_falle_encontrados"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type dw_3 from datawindow within w_proceso_fall
integer x = 82
integer y = 1376
integer width = 3095
integer height = 688
integer taborder = 30
boolean titlebar = true
string title = "none"
string dataobject = "dw_asigna_fallecidos_log"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type dw_2 from datawindow within w_proceso_fall
integer x = 1266
integer y = 56
integer width = 1856
integer height = 1012
integer taborder = 20
boolean titlebar = true
string title = "none"
string dataobject = "dw_proceso_fall_sector"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type dw_1 from datawindow within w_proceso_fall
integer x = 78
integer y = 76
integer width = 1001
integer height = 1016
integer taborder = 10
string title = "none"
string dataobject = "dw_proceso_fall"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_proceso_fall
integer x = 795
integer y = 1132
integer width = 283
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_proceso_fall)
end event

type cb_1 from commandbutton within w_proceso_fall
integer x = 78
integer y = 1132
integer width = 283
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;long i,j,h,k,ubs,ubs_v,ubc,capacidad,rut,contrato,bien,mal
string sector,tipo_const,nivel,sep,base,ss
date fecha
datetime fec_sep

dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
if dw_1.rowcount() > 0 then
	for i = 1 to dw_1.rowcount()
		dw_1.SelectRow(0, FALSE)
		dw_1.SelectRow(i, TRUE)
		dw_1.ScrollToRow(i)
		sector     = dw_1.getitemstring(i,'sector')
		tipo_const = dw_1.getitemstring(i,'tipo_const')
		dw_3.reset()
		if dw_2.retrieve(sector) > 0 then
			for j = 1 to dw_2.rowcount()
				dw_2.SelectRow(0, FALSE)
				dw_2.SelectRow(i, TRUE)
				dw_2.ScrollToRow(i)
				ubs       = dw_2.getitemnumber(j,'ubs')
				capacidad = dw_2.getitemnumber(j,'capacidad')
				sep       = dw_2.getitemstring(j,'sepultura')
				SELECT "MATRIS_SEPULTURA"."UBS_MATRIS",   
						 "MATRIS_SEPULTURA"."UBC_MATRIS"   
				INTO :ubs,:ubc
				FROM   "MATRIS_SEPULTURA"  
				WHERE ("MATRIS_SEPULTURA"."TIPO_CONST_MATRIS" = :tipo_const ) AND  
						("MATRIS_SEPULTURA"."CAPACIDAD_MATRIS"  = :capacidad ) AND  
						("MATRIS_SEPULTURA"."UBS_MATRIS" = :ubs ) AND 
						("MATRIS_SEPULTURA"."COD_MATRIS" = (  SELECT max("MATRIS_SEPULTURA"."COD_MATRIS")  
																		  FROM       "MATRIS_SEPULTURA"  
																		  WHERE     ("MATRIS_SEPULTURA"."TIPO_CONST_MATRIS" = :tipo_const ) AND  
																						("MATRIS_SEPULTURA"."UBS_MATRIS" = :ubs ) AND 
																			         ("MATRIS_SEPULTURA"."CAPACIDAD_MATRIS" = :capacidad )));
				dw_2.setitem(j,'ubc',ubc)
//---------------------------------------------------------------------------------------------------------------------------
				if sqlca.sqlcode = 0 then
					ubs_v = ubs
					for h = 1 to ubc
						for k = 1 to ubs
							if ubs_v = 3 then
								if k <> 2 then
									nivel = string(k)+'.'+string(h)+'.'+string(capacidad)
									dw_3.insertrow(0)
									dw_3.setitem(dw_3.rowcount(),'sector',sector)
									dw_3.setitem(dw_3.rowcount(),'sepultura',sep)
									dw_3.setitem(dw_3.rowcount(),'ubs',k)
									dw_3.setitem(dw_3.rowcount(),'ubc',h)
									dw_3.setitem(dw_3.rowcount(),'capacidad',capacidad)
									dw_3.setitem(dw_3.rowcount(),'fecha',today ())
								elseif  k = 2 and capacidad = 12 and tipo_const = 'T' then
									nivel = string(k)+'.'+string(h)+'.'+string(capacidad)
									dw_3.insertrow(0)
									dw_3.setitem(dw_3.rowcount(),'sector',sector)
									dw_3.setitem(dw_3.rowcount(),'sepultura',sep)
									dw_3.setitem(dw_3.rowcount(),'ubs',k)
									dw_3.setitem(dw_3.rowcount(),'ubc',h)
									dw_3.setitem(dw_3.rowcount(),'capacidad',capacidad)
									dw_3.setitem(dw_3.rowcount(),'fecha',today ())									
								end if
							else
								nivel = string(k)+'.'+string(h)+'.'+string(capacidad)
								dw_3.insertrow(0)
								dw_3.setitem(dw_3.rowcount(),'sector',sector)
								dw_3.setitem(dw_3.rowcount(),'sepultura',sep)
								dw_3.setitem(dw_3.rowcount(),'ubs',k)
								dw_3.setitem(dw_3.rowcount(),'ubc',h)
								dw_3.setitem(dw_3.rowcount(),'capacidad',capacidad)
								dw_3.setitem(dw_3.rowcount(),'fecha',today ())
							end if
						next
					next
					dw_3.setsort('ubs A, ubc D')
					dw_3.sort()
//---------------------------------------------------------------------------------------------------------------------------
					if dw_4.retrieve(sector,sep) > 0 then
						for i = 1 to dw_4.rowcount()
//							if dw_3.rowcount() >= dw_4.rowcount() then
								rut       = dw_4.getitemnumber(i,'rut')
								contrato  = dw_4.getitemnumber(i,'contrato')
								base      = dw_4.getitemstring(i,'base')
								ss        = dw_4.getitemstring(i,'ss')
								fec_sep   = dw_4.getitemdatetime(i,'fec_sep')
								fecha     = date(dw_3.getitemdatetime(i,'fecha'))
								ubs       = dw_3.getitemnumber(i,'ubs')
								ubc       = dw_3.getitemnumber(i,'ubc')
								capacidad = dw_3.getitemnumber(i,'capacidad')
								INSERT INTO "ASIGNACION_FALLECIDOS_LOG"  
										 ( "SECTOR","SEPULTURA","STATUS","RUT_FALLECIDO","FECHA_SEP","UBS","UBC","CAPACIDAD","BASE","SERIE","NUMERO" ,"OBSERVACION","FECHA","USUARIO" )  
								VALUES ( :sector ,:sep       ,1       ,:rut           ,:fec_sep   ,:ubs ,:ubc ,:capacidad ,:base ,:ss    ,:contrato,null         ,:fecha ,'VJ1' )  ;
								if sqlca.sqlcode = 0 then
									commit;
									bien ++
								else
									rollback;
									mal ++
								end if
//							end if
						next
					end if
//---------------------------------------------------------------------------------------------------------------------------
				end if
//---------------------------------------------------------------------------------------------------------------------------
			next
		end if
	next
end if


dw_3.setsort('sepultura A, ubs A, ubc D')
dw_3.sort()
MessageBox('Proceso terminado','Proceso terminado',information!)
end event

