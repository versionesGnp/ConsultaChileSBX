forward
global type w_busqueda_sep_plano_vs_datos from window
end type
type cb_2 from commandbutton within w_busqueda_sep_plano_vs_datos
end type
type cb_1 from commandbutton within w_busqueda_sep_plano_vs_datos
end type
type dw_2 from datawindow within w_busqueda_sep_plano_vs_datos
end type
type dw_1 from datawindow within w_busqueda_sep_plano_vs_datos
end type
end forward

global type w_busqueda_sep_plano_vs_datos from window
integer width = 2903
integer height = 1208
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
long backcolor = 67108864
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
end type
global w_busqueda_sep_plano_vs_datos w_busqueda_sep_plano_vs_datos

event open;long sep,i,j,numero,rut,parque
string sep_const,sep1,sep2,base,serie,sector


gf_centrar(w_busqueda_sep_plano_vs_datos)
parque = w_plano_sector_parque.id_parque
dw_2.dataobject = 'dw_busqueda_sep_plano_vs_datos'
dw_2.settransobject(sqlca)
if dw_2.retrieve(gs_sector,parque) > 0 then
	for i = 1 to dw_2.rowcount()
		for j = 1 to 80
			sep    = dw_2.getitemnumber(i,'campo'+string(j))
			sector = dw_2.getitemstring(i,'sector')
			if sep > 0 then
				dw_1.insertrow(0)
				dw_1.setitem(dw_1.rowcount(),'sector',string(sector))
				dw_1.setitem(dw_1.rowcount(),'sep',string(sep))
				SELECT "BASE","SERIE","NUMERO","RUT"  
				INTO :base,:serie,:numero,:rut  
				FROM "INVENTARIO_PLANI"  
				WHERE ("SECTOR" = :gs_sector ) AND ( "SEPULTURA" = :sep ) and (cod_parque =:parque)  ;
				if sqlca.sqlcode <> 0 then
					dw_1.setitem(dw_1.rowcount(),'mensaje','NO')
					setnull(base);setnull(serie);setnull(numero)
				elseif sqlca.sqlcode = 0 then
					dw_1.setitem(dw_1.rowcount(),'mensaje','SI')
				end if
				dw_1.setitem(dw_1.rowcount(),'base',base)
				dw_1.setitem(dw_1.rowcount(),'serie',serie)
				dw_1.setitem(dw_1.rowcount(),'numero',numero)
			end if
		next
	next
else
	dw_2.dataobject = 'dw_busqueda_sep_plano_vs_datos_const'
	dw_2.settransobject(sqlca)
	if dw_2.retrieve(gs_sector,parque) > 0 then
		for i = 1 to dw_2.rowcount()
			for j = 1 to 80
				sep_const = dw_2.getitemstring(i,'campo'+string(j))
				sector = dw_2.getitemstring(i,'sector')
				if sep_const <> '0' then
					dw_1.insertrow(0)
					dw_1.setitem(dw_1.rowcount(),'sector',sector)
					dw_1.setitem(dw_1.rowcount(),'sep',sep_const)
					SELECT "BASE","SERIE","NUMERO","RUT"  
					INTO :base,:serie,:numero,:rut  
					FROM "INVENTARIO_PLANI"  
					WHERE ("SECTOR" = :gs_sector ) AND ( "SEPULTURA" = :sep_const )  and (cod_parque =:parque)    ;
					if sqlca.sqlcode <> 0 then
						dw_1.setitem(dw_1.rowcount(),'mensaje','NO')
						setnull(base);setnull(serie);setnull(numero)
					elseif sqlca.sqlcode = 0 then
						dw_1.setitem(dw_1.rowcount(),'mensaje','SI')
					end if
					dw_1.setitem(dw_1.rowcount(),'base',base)
					dw_1.setitem(dw_1.rowcount(),'serie',serie)
					dw_1.setitem(dw_1.rowcount(),'numero',numero)
				end if
			next
		next
	end if
end if
dw_1.setsort('sector A and sep A')
dw_1.sort()
for i = 1 to dw_1.rowcount()
	if i <= dw_1.rowcount() then
		if i > 1 then 
			sep1 = dw_1.getitemstring(i,'sep')
			sep2 = dw_1.getitemstring(i - 1,'sep')
			if sep1 = sep2 then
				dw_1.deleterow(i)
				i --
			end if
		end if
	end if
next
end event

on w_busqueda_sep_plano_vs_datos.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_2,&
this.dw_1}
end on

on w_busqueda_sep_plano_vs_datos.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

type cb_2 from commandbutton within w_busqueda_sep_plano_vs_datos
integer x = 2021
integer y = 928
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;SaveAsType TipoArchivo

datawindow dw_paso
dw_paso	= dw_1
if dw_1.rowcount() > 0 then
//	OpenWithParm(w_exportar, dw_paso)
	f_DWToExcel( dw_1 )
//	dw_1.SaveAs("C:\duplicados.XLS", Excel!, TRUE)
end if

end event

type cb_1 from commandbutton within w_busqueda_sep_plano_vs_datos
integer x = 2432
integer y = 928
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_busqueda_sep_plano_vs_datos)
end event

type dw_2 from datawindow within w_busqueda_sep_plano_vs_datos
integer x = 1632
integer y = 1160
integer width = 411
integer height = 432
integer taborder = 20
string title = "none"
string dataobject = "dw_busqueda_sep_plano_vs_datos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_busqueda_sep_plano_vs_datos
integer x = 59
integer y = 56
integer width = 2775
integer height = 804
integer taborder = 10
string title = "none"
string dataobject = "dw_resultado_sep_plano_vs_datos"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

