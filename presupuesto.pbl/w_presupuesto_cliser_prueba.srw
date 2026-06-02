forward
global type w_presupuesto_cliser_prueba from window
end type
type cb_vista_anual from commandbutton within w_presupuesto_cliser_prueba
end type
type cb_vista from commandbutton within w_presupuesto_cliser_prueba
end type
type st_3 from statictext within w_presupuesto_cliser_prueba
end type
type pb_ok from picturebutton within w_presupuesto_cliser_prueba
end type
type em_anno from editmask within w_presupuesto_cliser_prueba
end type
type st_2 from statictext within w_presupuesto_cliser_prueba
end type
type ddlb_empresa from dropdownlistbox within w_presupuesto_cliser_prueba
end type
type st_1 from statictext within w_presupuesto_cliser_prueba
end type
type cb_cerrar from commandbutton within w_presupuesto_cliser_prueba
end type
type dw_lista from datawindow within w_presupuesto_cliser_prueba
end type
type ddlb_mes from dropdownlistbox within w_presupuesto_cliser_prueba
end type
end forward

global type w_presupuesto_cliser_prueba from window
integer width = 3291
integer height = 2240
boolean titlebar = true
string title = "Presupuesto"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_vista_anual cb_vista_anual
cb_vista cb_vista
st_3 st_3
pb_ok pb_ok
em_anno em_anno
st_2 st_2
ddlb_empresa ddlb_empresa
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
ddlb_mes ddlb_mes
end type
global w_presupuesto_cliser_prueba w_presupuesto_cliser_prueba

event open;String	ls_cod,ls_nom_emp,ls_string
Long		ll_max_anno,ll_max_mes

gf_centrar(w_presupuesto_cliser)
Connect Using Trans_3;
dw_lista.settransobject(Trans_3)
ddlb_empresa.reset()

SELECT 	MAX("PRESUPUESTO_CONSULTA"."ANNO"),   
		 	MAX("PRESUPUESTO_CONSULTA"."MES") 
INTO		:ll_max_anno,
			:ll_max_mes
FROM 		"PRESUPUESTO_CONSULTA"  
USING		Trans_3;
if ll_max_mes > 0 and ll_max_anno > 0 then
	ll_max_mes ++
	if ll_max_mes > 12 then
		ll_max_mes	= 1
		ll_max_anno ++
	end if
else
	ll_max_mes		= month(date(gdt_fec_sistema))
	ll_max_anno		= year(date(gdt_fec_sistema))
end if
ddlb_mes.text		= string(ll_max_mes,'00')
em_anno.text		= string(ll_max_anno,'0000')
DECLARE x1 CURSOR FOR  
SELECT	"CLISER"."GRL_EMPRES"."COD_EMPRES",   
			"CLISER"."GRL_EMPRES"."NOM_EMPRES"  
FROM 		"CLISER"."GRL_EMPRES"  
USING		Trans_3;
Open x1;
if Trans_3.sqlcode=0 then
	DO WHILE Trans_3.sqlcode=0 
		Fetch x1 into :ls_cod, :ls_nom_emp;
		if not isnull(ls_cod) and not isnull(ls_nom_emp) then
			ls_string	= UPPER(ls_cod)+' - '+UPPER(ls_nom_emp)
			ddlb_empresa.additem(ls_string)
		end if
		Setnull(ls_cod);Setnull(ls_nom_emp)
	LOOP
end if
close x1;
em_anno.text			= String(year(Date(gdt_fec_sistema)),'0000')

end event

on w_presupuesto_cliser_prueba.create
this.cb_vista_anual=create cb_vista_anual
this.cb_vista=create cb_vista
this.st_3=create st_3
this.pb_ok=create pb_ok
this.em_anno=create em_anno
this.st_2=create st_2
this.ddlb_empresa=create ddlb_empresa
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.ddlb_mes=create ddlb_mes
this.Control[]={this.cb_vista_anual,&
this.cb_vista,&
this.st_3,&
this.pb_ok,&
this.em_anno,&
this.st_2,&
this.ddlb_empresa,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.ddlb_mes}
end on

on w_presupuesto_cliser_prueba.destroy
destroy(this.cb_vista_anual)
destroy(this.cb_vista)
destroy(this.st_3)
destroy(this.pb_ok)
destroy(this.em_anno)
destroy(this.st_2)
destroy(this.ddlb_empresa)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.ddlb_mes)
end on

event close;Disconnect Using Trans_3;
end event

type cb_vista_anual from commandbutton within w_presupuesto_cliser_prueba
integer x = 1449
integer y = 1968
integer width = 389
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Vista &Anual"
end type

event clicked;String	ls_cod,ls_string
Long		ll_mes,ll_anno

ls_cod		= mid(ddlb_empresa.text,1,3)
ll_mes		= long(mid(ddlb_mes.text,1,2))
ll_anno		= Long(em_anno.text)
ls_string	= ls_cod+'~t'+string(ll_mes)+'~t'+string(ll_anno)
if ll_mes > 0 and ll_anno > 0 and not isnull(ls_cod) then
	openwithparm(w_vista_presupuesto_anual,ls_string)
else
	messagebox("Advertencia","Debe Ingresar Dato")
end if
end event

type cb_vista from commandbutton within w_presupuesto_cliser_prueba
integer x = 41
integer y = 1968
integer width = 389
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Vista Mensual"
end type

event clicked;String	ls_cod,ls_string
Long		ll_mes,ll_anno

ls_cod		= mid(ddlb_empresa.text,1,3)
ll_mes		= long(mid(ddlb_mes.text,1,2))
ll_anno		= Long(em_anno.text)
ls_string	= ls_cod+'~t'+string(ll_mes)+'~t'+string(ll_anno)
if ll_mes > 0 and ll_anno > 0 and not isnull(ls_cod) then
	openwithparm(w_vista_presupuesto,ls_string)
else
	messagebox("Advertencia","Debe Ingresar Dato")
end if
end event

type st_3 from statictext within w_presupuesto_cliser_prueba
integer x = 1522
integer y = 76
integer width = 133
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_presupuesto_cliser_prueba
integer x = 3072
integer y = 36
integer width = 178
integer height = 156
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
end type

event clicked;String		ls_cod,ls_fecha,ls_nom_empresa,ls_mes,ls_pasa='N'
Long		ll_anno,ll_mes,ll_count,ll_res,ll_count_periodo,ll_res_2

ls_cod	= mid(ddlb_empresa.text,1,3)
ll_mes	= long(mid(ddlb_mes.text,1,2))
ll_anno	= Long(em_anno.text)
if isnull(ll_mes) then ll_mes=0
if isnull(ls_cod) or ls_cod='' then
	messagebox("Advertencia","Debe Seleccionar Empresa")
	ddlb_empresa.setfocus()
elseif ll_mes < 1 or ll_mes > 12 then
	messagebox("Advertencia","Debe Seleccionar Mes a Consultar")
	ddlb_mes.setfocus()
elseif isnull(ll_anno) or ll_anno=0 then
	messagebox("Advertencia","Debe Ingresar Año a Consultar")
	em_anno.setfocus()
else
	SetPointer(HourGlass!)
	SELECT	COUNT("PRESUPUESTO_CONSULTA"."COD_EMP")  
	INTO 		:ll_count  
	FROM 		"PRESUPUESTO_CONSULTA"  
	WHERE  ( "PRESUPUESTO_CONSULTA"."COD_EMP" = :ls_cod ) AND  
			 ( "PRESUPUESTO_CONSULTA"."ANNO" = :ll_anno ) AND  
			 ( "PRESUPUESTO_CONSULTA"."MES" = :ll_mes )   
	USING		Trans_3;
	if ll_count > 0 then
		CHOOSE CASE ll_mes
			CASE 1
			ls_fecha					= 'Enero'
			CASE 2
			ls_fecha					= 'Febrero'
			CASE 3
			ls_fecha					= 'Marzo'
			CASE 4
			ls_fecha					= 'Abril'
			CASE 5
			ls_fecha					= 'Mayo'
			CASE 6
			ls_fecha					= 'Junio'
			CASE 7
			ls_fecha					= 'Julio'
			CASE 8
			ls_fecha					= 'Agosto'
			CASE 9
			ls_fecha					= 'Septiembre'
			CASE 10
			ls_fecha					= 'Octubre'
			CASE 11
			ls_fecha					= 'Noviembre'
			CASE 12
			ls_fecha					= 'Diciembre'
		END CHOOSE
		SELECT "GRL_EMPRES"."NOM_EMPRES"  
		INTO 	 :ls_nom_empresa  
		FROM 	 "GRL_EMPRES"  
		WHERE  "GRL_EMPRES"."COD_EMPRES" = :ls_cod
		USING	 Trans_3;
		ll_res = messagebox("Advertencia","Periodo Presupuesto a Consultar "+ls_fecha+" Año "+string(ll_anno)+" Empresa "+ls_nom_empresa+" Ya Existe, Desea Re-Procesar",Exclamation!,YesNo!,2)
		if ll_res = 1 then
			DELETE FROM "PRESUPUESTO_CONSULTA"  
   			WHERE	 ( "PRESUPUESTO_CONSULTA"."COD_EMP" = :ls_cod ) AND  
     	   			 	 ( "PRESUPUESTO_CONSULTA"."ANNO" = :ll_anno ) AND  
    				        	 ( "PRESUPUESTO_CONSULTA"."MES" = :ll_mes )   
			USING	Trans_3;
			if Trans_3.sqlcode=0 then
				//commit using Trans_3;
				ls_mes						= string(ll_mes,'00')
				DELETE FROM "PRESUPUESTO_PERIODO"  
				WHERE ( "PRESUPUESTO_PERIODO"."ANNO" = :ll_anno ) AND  
         				  ( "PRESUPUESTO_PERIODO"."MES" = :ls_mes )   
				USING  Trans_3;
				if Trans_3.sqlcode=0 then
					commit using Trans_3;
					SELECT	Count("PRESUPUESTO_PERIODO"."MES")  
					INTO 		:ll_count_periodo  
					FROM 		"PRESUPUESTO_PERIODO"  
					WHERE  ( "PRESUPUESTO_PERIODO"."MES" = :ls_mes ) AND  
							 ( "PRESUPUESTO_PERIODO"."ANNO" = :ll_anno )   
					USING		Trans_3;
					if ll_count_periodo=0 then
						INSERT INTO   "PRESUPUESTO_PERIODO"  
										( "MES",		"ANNO" )
						VALUES 		( :ls_mes,	:ll_anno )  
						USING		Trans_3;
						if Trans_3.sqlcode=0 then
							commit using Trans_3;
							ls_pasa	= 'S'
						else
							rollback using Trans_3;
							messagebox("Error Grabar","Error al Grabar Periodo "+ls_mes+" Año "+string(ll_anno)+" Tabla PRESUPUESTO_PERIODO SQL: "+trans_3.sqlerrtext)
						end if
					end if
				else
					rollback using Trans_3;
					messagebox("Error Borrar","Error al Borrar Periodo "+ls_mes+" Año "+string(ll_anno)+" Tabla PRESUPUESTO_PERIODO SQL: "+trans_3.sqlerrtext)	
				end if
			else
				rollback using Trans_3;
				messagebox("Error Borrar","Error al Presupuesto"+ls_mes+" Año "+string(ll_anno)+" Tabla PRESUPUESTO_CONSULTA SQL: "+trans_3.sqlerrtext)	
			end if
		else	
			ll_res_2	= messagebox("Advertencia","Periodo Presupuesto a Consultar "+ls_fecha+" Año "+string(ll_anno)+" Empresa "+ls_nom_empresa+" Ya Existe, desea Desplegar",Exclamation!,YesNo!,2)
			if ll_res_2 =1 then
				if dw_lista.retrieve(ls_cod,ll_anno,ll_mes) = 0 then
					messagebox("Advertencia","No Registra Dato Presupuesto Año "+String(ll_anno))
				end if
			end if
		end if
	else
		ls_mes						= string(ll_mes,'00')
		SELECT	Count("PRESUPUESTO_PERIODO"."MES")  
		INTO 		:ll_count_periodo  
		FROM 		"PRESUPUESTO_PERIODO"  
		WHERE  ( "PRESUPUESTO_PERIODO"."MES" = :ls_mes ) AND  
				 ( "PRESUPUESTO_PERIODO"."ANNO" = :ll_anno )   
		USING		Trans_3;
		if ll_count_periodo=0 then
			INSERT INTO   "PRESUPUESTO_PERIODO"  
							( "MES",		"ANNO" )  
			VALUES 		( :ls_mes,	:ll_anno )  
			USING		Trans_3;
			if Trans_3.sqlcode=0 then
				commit using Trans_3;
				ls_pasa	= 'S'
			else
				rollback using Trans_3;
				messagebox("Error Grabar","Error al Grabar Periodo "+ls_mes+" Año "+string(ll_anno)+" Tabla PRESUPUESTO_PERIODO SQL: "+trans_3.sqlerrtext)
			end if
		end if
	end if
	if ls_pasa = 'S' then
			DECLARE sp_presupuesto PROCEDURE FOR cliser.presupuesto(:ls_cod,:ll_anno,:ll_mes);
			EXECUTE sp_presupuesto;
			if dw_lista.retrieve(ls_cod,ll_anno,ll_mes) = 0 then
				messagebox("Advertencia","No Registra Dato Presupuesto Año "+String(ll_anno))
			end if
		end if
	SetPointer(Arrow!)
end if
end event

type em_anno from editmask within w_presupuesto_cliser_prueba
integer x = 2533
integer y = 64
integer width = 411
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_presupuesto_cliser_prueba
integer x = 2359
integer y = 76
integer width = 142
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_empresa from dropdownlistbox within w_presupuesto_cliser_prueba
integer x = 320
integer y = 64
integer width = 1161
integer height = 612
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event modified;dw_lista.reset()
end event

type st_1 from statictext within w_presupuesto_cliser_prueba
integer x = 41
integer y = 76
integer width = 251
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empresa"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_presupuesto_cliser_prueba
integer x = 2853
integer y = 1968
integer width = 389
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_presupuesto_cliser)
end event

type dw_lista from datawindow within w_presupuesto_cliser_prueba
integer x = 41
integer y = 224
integer width = 3200
integer height = 1692
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_presupuesto_por_periodo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type ddlb_mes from dropdownlistbox within w_presupuesto_cliser_prueba
integer x = 1669
integer y = 64
integer width = 645
integer height = 604
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
string text = "none"
boolean vscrollbar = true
string item[] = {"01 - Enero","02 - Febrero","03 - Marzo","04 - Abril","05 - Mayo","06 - Junio","07 - Julio","08 - Agosto","09 - Septiembre","10 - Octubre","11 - Noviembre","12 - Diciembre"}
borderstyle borderstyle = stylelowered!
end type

event modified;dw_lista.reset()
end event

