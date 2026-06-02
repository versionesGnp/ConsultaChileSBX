forward
global type w_calculo from window
end type
type hpb_1 from hprogressbar within w_calculo
end type
type dw_4 from datawindow within w_calculo
end type
type st_4 from statictext within w_calculo
end type
type dw_6 from datawindow within w_calculo
end type
type dw_5 from datawindow within w_calculo
end type
type dw_3 from datawindow within w_calculo
end type
type dw_2 from datawindow within w_calculo
end type
type st_3 from statictext within w_calculo
end type
type st_2 from statictext within w_calculo
end type
type dw_1 from datawindow within w_calculo
end type
type cb_3 from commandbutton within w_calculo
end type
type cb_2 from commandbutton within w_calculo
end type
type cb_1 from commandbutton within w_calculo
end type
type gb_1 from groupbox within w_calculo
end type
end forward

global type w_calculo from window
integer x = 832
integer y = 360
integer width = 1472
integer height = 728
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
hpb_1 hpb_1
dw_4 dw_4
st_4 st_4
dw_6 dw_6
dw_5 dw_5
dw_3 dw_3
dw_2 dw_2
st_3 st_3
st_2 st_2
dw_1 dw_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_calculo w_calculo

forward prototypes
public subroutine f_borra_plani_aux ()
public subroutine f_borra_plani ()
public function integer f_busca_estado_fallecido (string base, string serie, double numero, ref string n_o_v)
public subroutine wf_reg_malos (long parque, string area, string sector, string sepultura, string nro_tecnico, string tipo_sepultura, string tipo_cons, string codigo, string serie, double numero, string est)
end prototypes

public subroutine f_borra_plani_aux ();long i,a,count,j,COUNT_ROW

LONG CORRELATIVO,PARQUE,NUMERO_CORR,CAPACIDAD
Double	NUMERO
STRING SECTOR,SEPULTURA,NRO_TECNICO,TIPO_SEPULTURA,TIPO_CONSTRUCCION,CODIGO,SERIE,AREA,tipo_cons


if dw_2.retrieve() > 0 then
	for i = 1 to dw_2.rowcount()
		area = dw_2.getitemstring(i,'area')
		sector = dw_2.getitemstring(i,'sector')
		ST_4.TEXT = SECTOR
		if dw_6.retrieve(sector) > 0 then
			SELECT count("PLANIMETRIA"."SECTOR")  
			INTO :count  
			FROM "PLANIMETRIA"  
			WHERE ( "PLANIMETRIA"."SECTOR" = :sector )   ;
			j = 0;a = 0		
			hpb_1.minposition = 1
			COUNT_ROW = DW_6.ROWCOUNT() 
			IF COUNT_ROW > 10000 THEN
				hpb_1.maxposition =  COUNT_ROW/4
			ELSE
				IF COUNT_ROW <= 1 THEN COUNT_ROW = 2 
				hpb_1.maxposition =  COUNT_ROW
			END IF	
			
			for a = 1 to dw_6.rowcount()
				NUMERO            = DW_6.GETITEMNUMBER(A,'nro_sistema')
				SECTOR            = DW_6.GETITEMSTRING(A,'SECTOR')
				DELETE FROM "PLANIMETRIA_AUX"  
				WHERE ( "PLANIMETRIA_AUX"."SECTOR" = :SECTOR ) AND  
						( "PLANIMETRIA_AUX"."NRO_SISTEMA" = :NUMERO )   ;
				if sqlca.sqlcode = 0 then
					commit;
				else
					messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
					ROLLBACK;
				end if				
				IF dw_6.rowcount() > 10000 THEN
					j = a/4
				ELSE	
					j = a
				END IF	
			   hpb_1.position = int(j)
				st_3.text = string(j,'###,###,###,##0')+' '
			next	
		end if	
//		messagebox(gs_app_name,'Proceso terminado :~r~n'+string(cont,'###,###,##0')+' registros grabados con exito~r~n'+&
//					'y '+string(malos,'###,###,##0')+' registros con problemas.',information!)
	next	
end if
end subroutine

public subroutine f_borra_plani ();long i,a,count,j,COUNT_ROW

LONG CORRELATIVO,PARQUE,NUMERO_CORR,CAPACIDAD
Double	NUMERO
STRING SECTOR,SEPULTURA,NRO_TECNICO,TIPO_SEPULTURA,TIPO_CONSTRUCCION,CODIGO,SERIE,AREA,tipo_cons


if dw_2.retrieve() > 0 then
	for i = 1 to dw_2.rowcount()
		area = dw_2.getitemstring(i,'area')
		sector = dw_2.getitemstring(i,'sector')
		ST_4.TEXT = SECTOR
		if dw_4.retrieve(sector) > 0 then
			SELECT count("PLANIMETRIA"."SECTOR")  
			INTO :count  
			FROM "PLANIMETRIA"  
			WHERE ( "PLANIMETRIA"."SECTOR" = :sector )   ;
			j = 0;a = 0		
			hpb_1.minposition = 1
			COUNT_ROW = dw_4.ROWCOUNT() 
			IF COUNT_ROW > 10000 THEN
				hpb_1.maxposition =  COUNT_ROW/4
			ELSE
				IF COUNT_ROW <= 1 THEN COUNT_ROW = 2 
				hpb_1.maxposition =  COUNT_ROW
			END IF	
			
			for a = 1 to dw_4.rowcount()
				NUMERO            = dw_4.GETITEMNUMBER(A,'nro_sistema')
				SECTOR            = dw_4.GETITEMSTRING(A,'SECTOR')
				UPDATE "PLANIMETRIA"   
				  SET "PARQUE" 				= 1,    
						"SEPULTURA" 			= null,    
						"NRO_TECNICO" 			= null,    
						"CAPACIDAD" 			= null,    
						"TIPO_CONSTRUCCION" 	= null,    
						"ESTADO_SEPULTURA" 	= 'D',    
						"BASE" 					= null,    
						"SERIE" 					= null,    
						"NRO_CONTRATO" 		= null,    
						"UBS" 					= null,    
						"XX" 						= null,    
						"YY" 						= null,
						"FALLECIDOS" 			= null,
						"TIPO_SEPULT"        = null
				WHERE ( "PLANIMETRIA"."SECTOR" = :SECTOR ) AND  
						( "PLANIMETRIA"."NRO_SISTEMA" = :NUMERO )   ;
				if sqlca.sqlcode = 0 then
					commit;
				else
					messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
					ROLLBACK;
				end if				
				IF dw_4.rowcount() > 10000 THEN
					j = a/4
				ELSE	
					j = a
				END IF	
			   hpb_1.position = int(j)
				st_3.text = string(j,'###,###,###,##0')+' '
			next	
		end if	
//		messagebox(gs_app_name,'Proceso terminado :~r~n'+string(cont,'###,###,##0')+' registros grabados con exito~r~n'+&
//					'y '+string(malos,'###,###,##0')+' registros con problemas.',information!)
	next	
end if
end subroutine

public function integer f_busca_estado_fallecido (string base, string serie, double numero, ref string n_o_v);string estado
integer cant_fallecidos

SELECT "CADENA"."ESTADO"  
INTO :estado  
FROM "CADENA"  
WHERE ( "CADENA"."CODIGO" = :base ) AND  
      ( "CADENA"."SERIE" = :serie ) AND  
      ( "CADENA"."NUMERO" = :numero )   ;
		
cant_fallecidos = f_fallecido ( serie , numero , base )

if     ( estado = 'N' or estado = 'R' or estado = 'P' ) and cant_fallecidos >= 1 then
	n_o_v = 'N'
	return cant_fallecidos
elseif ( estado = 'N' or estado = 'R' or estado = 'P' ) and cant_fallecidos = 0 then
	n_o_v = 'N'
	return 0
elseif ( estado = 'C' or estado = 'V' ) then
	n_o_v = 'V'
	return cant_fallecidos
end if
end function

public subroutine wf_reg_malos (long parque, string area, string sector, string sepultura, string nro_tecnico, string tipo_sepultura, string tipo_cons, string codigo, string serie, double numero, string est);UPDATE "PLANIMETRIA_AUX"  
SET "REG_FALLIDO" = :est
WHERE ( "PLANIMETRIA_AUX"."SECTOR" = :sector ) AND  
      ( "PLANIMETRIA_AUX"."NRO_SISTEMA" = :NRO_TECNICO )   ;
commit;

end subroutine

on w_calculo.create
this.hpb_1=create hpb_1
this.dw_4=create dw_4
this.st_4=create st_4
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_3=create dw_3
this.dw_2=create dw_2
this.st_3=create st_3
this.st_2=create st_2
this.dw_1=create dw_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.hpb_1,&
this.dw_4,&
this.st_4,&
this.dw_6,&
this.dw_5,&
this.dw_3,&
this.dw_2,&
this.st_3,&
this.st_2,&
this.dw_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_calculo.destroy
destroy(this.hpb_1)
destroy(this.dw_4)
destroy(this.st_4)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;gf_centrar(w_calculo)
this.title = gs_app_name

dw_2.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_2.retrieve()
end event

type hpb_1 from hprogressbar within w_calculo
integer x = 101
integer y = 280
integer width = 1234
integer height = 120
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_4 from datawindow within w_calculo
integer x = 1522
integer y = 68
integer width = 1262
integer height = 360
boolean titlebar = true
string title = "Planimetria"
string dataobject = "dw_planimetria"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type st_4 from statictext within w_calculo
integer x = 1083
integer y = 132
integer width = 247
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_calculo
integer x = 1522
integer y = 796
integer width = 1262
integer height = 360
boolean titlebar = true
string title = "Planimetria_aux"
string dataobject = "dw_plani_aux"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_5 from datawindow within w_calculo
integer x = 1522
integer y = 432
integer width = 1262
integer height = 360
boolean titlebar = true
string title = "Contrato"
string dataobject = "dw_contrato"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_3 from datawindow within w_calculo
integer x = 64
integer y = 1400
integer width = 1262
integer height = 360
boolean titlebar = true
string title = "reg_fallidos"
string dataobject = "dw_ofertas_sin_sector"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_2 from datawindow within w_calculo
integer x = 64
integer y = 1032
integer width = 1262
integer height = 360
boolean titlebar = true
string title = "Base_plani"
string dataobject = "dw_base_plani"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type st_3 from statictext within w_calculo
integer x = 699
integer y = 132
integer width = 361
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_calculo
integer x = 155
integer y = 144
integer width = 521
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "N° de Registros  :"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_calculo
integer x = 64
integer y = 668
integer width = 1262
integer height = 360
boolean titlebar = true
string title = "ofertas"
string dataobject = "w_plani_oferta_v"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type cb_3 from commandbutton within w_calculo
integer x = 576
integer y = 500
integer width = 311
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;dw_3.settransobject(sqlca)
if dw_3.retrieve() > 0 then
	dw_3.print()
end if
end event

type cb_2 from commandbutton within w_calculo
integer x = 1074
integer y = 500
integer width = 311
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_calculo)
end event

type cb_1 from commandbutton within w_calculo
integer x = 69
integer y = 500
integer width = 311
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Proceso"
end type

event clicked;//GB_1.TEXT = ' BORRA PLANIMETRIA_AUX '
GB_1.TEXT = ' BORRA PLANIMETRIA_AUX '
long i,a,count,j,COUNT_ROW,sumar = 0,ASIGNADAS,ret
LONG CORRELATIVO,PARQUE,NUMERO_CORR,CAPACIDAD,NRO_SIS
STRING SECTOR,SEPULTURA,NRO_TECNICO,TIPO_SEPULTURA,TIPO_CONSTRUCCION,&
		 CODIGO,SERIE,AREA,tipo_cons,n_o_v
Double	NUMERO
if messagebox('Contunuar','¿ Desea continuar con el proceso de actualización ?',Exclamation!, OKCancel!, 1) = 2 then
	return
end if
setpointer(HourGlass!)
GB_1.TEXT = ' BORRA PLANIMETRIA_AUX '
f_borra_plani_aux()
GB_1.TEXT = 'UPDATE (NULL) PLANIMETRIA'
F_BORRA_PLANI()
//----------Ofertas----------
dw_1.settransobject(sqlca)
if dw_2.retrieve() > 0 then
	for i = 1 to dw_2.rowcount()
		area = dw_2.getitemstring(i,'area')
		sector = dw_2.getitemstring(i,'sector')
		if dw_1.retrieve(sector) > 0 then
			SELECT count("PLANIMETRIA"."SECTOR")  
			INTO :count  
			FROM "PLANIMETRIA"  
			WHERE ( "PLANIMETRIA"."SECTOR" = :sector )   ;
			j = 0;a = 0		
			hpb_1.minposition = 1
			COUNT_ROW = DW_1.ROWCOUNT() 
			IF COUNT_ROW > 10000 THEN
				hpb_1.maxposition =  COUNT_ROW/4
			ELSE
				IF COUNT_ROW <= 1 THEN COUNT_ROW = 2 
				hpb_1.maxposition =  COUNT_ROW
			END IF	
			for a = 1 to dw_1.rowcount()
					PARQUE = DW_1.GETITEMNUMBER(A,'PARQUE')
					AREA = DW_1.GETITEMSTRING(A,'AREA')
					SECTOR = DW_1.GETITEMSTRING(A,'SECTOR')
					ST_4.TEXT = SECTOR
					GB_1.TEXT = 'PLANIMETRIA PROMESAS'
					SEPULTURA = DW_1.GETITEMSTRING(A,'SEPULTURA')
					NRO_TECNICO = DW_1.GETITEMSTRING(A,'NRO_TECNICO')
					CAPACIDAD = DW_1.GETITEMNUMBER(A,'capacidad')
					TIPO_SEPULTURA = DW_1.GETITEMSTRING(A,'TIPO_SEPULT')
					TIPO_CONSTRUCCION = DW_1.GETITEMSTRING(A,'tipo_cons')
					CODIGO = DW_1.GETITEMSTRING(A,'CODIGO')
					SERIE = DW_1.GETITEMSTRING(A,'SERIE')
					NUMERO = DW_1.GETITEMNUMBER(A,'NUMERO')
//				if A <= count then
				ret = f_busca_estado_fallecido(CODIGO,SERIE,NUMERO,n_o_v)
				if (( ret >= 0 and n_o_v = 'V' ) OR ( ret > 0 and n_o_v = 'N' )) then
					INSERT INTO "PLANIMETRIA_AUX"  
					       ( "PARQUE","ZONA","SECTOR","NRO_SISTEMA","SEPULTURA","NRO_TECNICO","CAPACIDAD","TIPO_CONTRUCCION","ESTADO_SEPULTURA","BASE" ,"SERIE","NRO_CONTRATO","UBS","XX","YY","TIPO_SEPULT" )  
		  			VALUES ( :PARQUE ,:AREA ,:SECTOR ,:A           ,:SEPULTURA ,:NRO_TECNICO ,:CAPACIDAD ,:TIPO_CONSTRUCCION,'D'               ,'O'    ,:SERIE ,:numero       ,null ,null,null,:TIPO_SEPULTURA )  ;
					if sqlca.sqlcode = 0 then
						commit;
					else
						messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
						ROLLBACK;
						WF_REG_MALOS(PARQUE,AREA,SECTOR,SEPULTURA,NRO_TECNICO,TIPO_SEPULTURA,tipo_cons,CODIGO,SERIE,NUMERO,'3')
					end if				
				ELSE
					WF_REG_MALOS(PARQUE,AREA,SECTOR,SEPULTURA,NRO_TECNICO,TIPO_SEPULTURA,tipo_cons,CODIGO,SERIE,NUMERO,'3')
				end if
				IF dw_1.rowcount() > 10000 THEN
					j = a/4
				ELSE	
					j = a
				END IF	
			   hpb_1.position = int(j)	
				st_3.text = string(j,'###,###,###,##0')+' '
			next
		end if	
//		messagebox(gs_app_name,'Proceso terminado :~r~n'+string(cont,'###,###,##0')+' registros grabados con exito~r~n'+&
//					'y '+string(malos,'###,###,##0')+' registros con problemas.',information!)
	next	
end if
//--------Contratos------------
dw_5.settransobject(sqlca)
if dw_2.retrieve() > 0 then
	for i = 1 to dw_2.rowcount()
		area = dw_2.getitemstring(i,'area')
		sector = dw_2.getitemstring(i,'sector')
		if dw_5.retrieve(sector) > 0 then
			j = 0;a = 0		
			hpb_1.minposition = 1
			COUNT_ROW = DW_5.ROWCOUNT() 
			IF COUNT_ROW > 10000 THEN
				hpb_1.maxposition =  COUNT_ROW/4
			ELSE
				IF COUNT_ROW <= 1 THEN COUNT_ROW = 2 
				hpb_1.maxposition =  COUNT_ROW
			END IF	
			for a = 1 to dw_5.rowcount()
				PARQUE = DW_5.GETITEMNUMBER(A,'PARQUE')
				AREA = DW_5.GETITEMSTRING(A,'ZONA')
				SECTOR = DW_5.GETITEMSTRING(A,'SECTOR')
				ST_4.TEXT = SECTOR					
				GB_1.TEXT = 'PLANIMETRIA CONTRATOS'
				SEPULTURA = DW_5.GETITEMSTRING(A,'SEPULTURA')
				NRO_TECNICO = STRING(DW_5.GETITEMNUMBER(A,'NRO_TEC'))
				CAPACIDAD = DW_5.GETITEMNUMBER(A,'capacidad')
				SELECT "BASE_PLANI"."TIPO" into :TIPO_CONSTRUCCION FROM "BASE_PLANI" WHERE "BASE_PLANI"."SECTOR" = :sector ;
				CODIGO = DW_5.GETITEMSTRING(A,'CODIGO')
				SERIE = DW_5.GETITEMSTRING(A,'SERIE_C')
				NUMERO = DW_5.GETITEMNUMBER(A,'NRO_CONTRATO')
				SELECT MAX("PLANIMETRIA_AUX"."NRO_SISTEMA") + 1    
				INTO :count  
				FROM "PLANIMETRIA_AUX"  
				WHERE ( "PLANIMETRIA_AUX"."SECTOR" = :sector )   ;
				IF ISNULL(COUNT) OR COUNT <= 0 THEN COUNT = 1
				ret = f_busca_estado_fallecido(CODIGO,SERIE,NUMERO,n_o_v)
				if (( ret >= 0 and n_o_v = 'V' ) OR ( ret > 0 and n_o_v = 'N' )) then
//				if f_busca_estado_fallecido(CODIGO,SERIE,NUMERO,n_o_v) = 1 then
					INSERT INTO "PLANIMETRIA_AUX"  
							 ( "PARQUE","ZONA","SECTOR","NRO_SISTEMA","SEPULTURA","NRO_TECNICO","CAPACIDAD","TIPO_CONTRUCCION","ESTADO_SEPULTURA","BASE" ,"SERIE","NRO_CONTRATO","UBS","XX","YY","TIPO_SEPULT" )  
					VALUES ( :PARQUE ,:AREA ,:SECTOR ,:COUNT       ,:SEPULTURA ,:NRO_TECNICO ,:CAPACIDAD ,:TIPO_CONSTRUCCION,'D'               ,'C'    ,:SERIE ,:numero       ,null ,null,null,'1' )  ;
					if sqlca.sqlcode = 0 then
						commit;
					else
						messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
						ROLLBACK;
						WF_REG_MALOS(PARQUE,AREA,SECTOR,SEPULTURA,NRO_TECNICO,TIPO_SEPULTURA,tipo_cons,CODIGO,SERIE,NUMERO,'3')
					end if
				else
					WF_REG_MALOS(PARQUE,AREA,SECTOR,SEPULTURA,string(NRO_SIS),TIPO_SEPULTURA,tipo_cons,CODIGO,SERIE,NUMERO,'2')
				end if
				IF dw_5.rowcount() > 10000 THEN
					j = a/4
				ELSE	
					j = a
				END IF	
			   hpb_1.position = int(j)
				st_3.text = string(j,'###,###,###,##0')+' '
			next
		end if	
//		messagebox(gs_app_name,'Proceso terminado :~r~n'+string(cont,'###,###,##0')+' registros grabados con exito~r~n'+&
//					'y '+string(malos,'###,###,##0')+' registros con problemas.',information!)
	next	
end if
//---------Traspaso-----------
if dw_2.retrieve() > 0 then
	for i = 1 to dw_2.rowcount()
		area = dw_2.getitemstring(i,'area')
		sector = dw_2.getitemstring(i,'sector')
		if dw_6.retrieve(sector) > 0 then
			SELECT count("PLANIMETRIA"."SECTOR")  
			INTO :count  
			FROM "PLANIMETRIA"  
			WHERE ( "PLANIMETRIA"."SECTOR" = :sector )   ;
			j = 0;a = 0		
			hpb_1.minposition = 1
			COUNT_ROW = DW_6.ROWCOUNT() 
			IF COUNT_ROW > 10000 THEN
				hpb_1.maxposition =  COUNT_ROW/4
			ELSE
				IF COUNT_ROW <= 1 THEN COUNT_ROW = 2 
				hpb_1.maxposition =  COUNT_ROW
			END IF	
			for a = 1 to dw_6.rowcount()
					PARQUE            = DW_6.GETITEMNUMBER(A,'PARQUE')
					AREA              = DW_6.GETITEMSTRING(A,'ZONA')
					SECTOR            = DW_6.GETITEMSTRING(A,'SECTOR')
					NRO_SIS	         = DW_6.GETITEMNUMBER(A,'nro_sistema')
					ST_4.TEXT         = SECTOR
					GB_1.TEXT         = 'PLANIMETRIA ORDENAMIENTOS'
					SEPULTURA         = DW_6.GETITEMSTRING(A,'SEPULTURA')
					NRO_TECNICO       = DW_6.GETITEMSTRING(A,'NRO_TECNICO')
					CAPACIDAD         = DW_6.GETITEMNUMBER(A,'capacidad')
					TIPO_SEPULTURA 	= DW_6.GETITEMSTRING(A,'TIPO_SEPULT')
					TIPO_CONSTRUCCION = DW_6.GETITEMSTRING(A,'TIPO_CONSTRUCCION')
					CODIGO            = DW_6.GETITEMSTRING(A,'BASE')
					SERIE             = DW_6.GETITEMSTRING(A,'SERIE')
					NUMERO            = DW_6.GETITEMNUMBER(A,'NRO_CONTRATO')
				ret = f_busca_estado_fallecido(CODIGO,SERIE,NUMERO,n_o_v)
				if A <= count and (( ret >= 0 and n_o_v = 'V' ) OR ( ret > 0 and n_o_v = 'N' )) then
//				if A <= count and f_busca_estado_fallecido(CODIGO,SERIE,NUMERO,n_o_v) = 1 then
  				   UPDATE "PLANIMETRIA"  
					  SET "PARQUE"                      = 1,   
							"SEPULTURA"                   = :SEPULTURA,   
							"NRO_TECNICO"                 = :NRO_TECNICO,   
							"CAPACIDAD"                   = :CAPACIDAD,   
							"TIPO_CONSTRUCCION"           = :TIPO_CONSTRUCCION,   
							"ESTADO_SEPULTURA"            = 'A',   
							"BASE"                        = :CODIGO,   
							"SERIE"                       = :SERIE,   
							"NRO_CONTRATO"                = :numero,  
							"FALLECIDOS"						= :RET,
							"TIPO_SEPULT" 						= :TIPO_SEPULTURA 
					WHERE ( "PLANIMETRIA"."SECTOR"      = :SECTOR ) AND  
							( "PLANIMETRIA"."NRO_SISTEMA" = :A )   ;
					if sqlca.sqlcode = 0 then
						commit;
					else
						messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
						WF_REG_MALOS(PARQUE,AREA,SECTOR,SEPULTURA,string(NRO_SIS),TIPO_SEPULTURA,tipo_cons,CODIGO,SERIE,NUMERO,'1')
						sumar ++
						ROLLBACK;
					end if				
				ELSEif A > count then
					WF_REG_MALOS(PARQUE,AREA,SECTOR,SEPULTURA,string(NRO_SIS),TIPO_SEPULTURA,tipo_cons,CODIGO,SERIE,NUMERO,'2')
					sumar ++					
				end if
				IF dw_6.rowcount() > 10000 THEN
					j = a/4
				ELSE	
					j = a
				END IF	
			   hpb_1.position = int(j)
				st_3.text = string(j,'###,###,###,##0')+' '
			next
			dw_2.setitem(i,'total_asignadas',a - ( 1 + sumar ) )
			dw_2.update()
			a = 0 ; sumar = 0
		end if	
//		messagebox(gs_app_name,'Proceso terminado :~r~n'+string(cont,'###,###,##0')+' registros grabados con exito~r~n'+&
//					'y '+string(malos,'###,###,##0')+' registros con problemas.',information!)
	next	
end if
//------------------------------------*****----------------------------------
GB_1.TEXT = 'UPDATE BASE_PLANI'
hpb_1.minposition = 1
if dw_2.retrieve() > 0 then
	for i = 1 to dw_2.rowcount()
		hpb_1.maxposition = dw_2.rowcount()
		sector = dw_2.getitemstring(i,'sector')
		SELECT COUNT("PLANIMETRIA"."SECTOR")  
	   INTO :ASIGNADAS  
      FROM "PLANIMETRIA"  
      WHERE ( "PLANIMETRIA"."SECTOR" = :sector ) AND  
            ( "PLANIMETRIA"."ESTADO_SEPULTURA" = 'A' )   ;
	   UPDATE "BASE_PLANI"  
      SET "TOTAL_ASIGNADAS" = :ASIGNADAS  
      WHERE "BASE_PLANI"."SECTOR" = :sector   ;
		commit;
			   hpb_1.position = i	
		st_3.text = string(i,'###,###,###,##0')+' '
		st_4.text = sector+' '
	next	
end if
//------------------------------------*****----------------------------------
GB_1.TEXT = 'PROCESO TERMINADO'
st_3.text = ''
st_4.text = ''
setpointer(Arrow!)
end event

type gb_1 from groupbox within w_calculo
integer x = 69
integer y = 48
integer width = 1317
integer height = 408
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
string text = "PLANIMETRIA"
end type

