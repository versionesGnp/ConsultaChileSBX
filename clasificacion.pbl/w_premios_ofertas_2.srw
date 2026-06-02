forward
global type w_premios_ofertas_2 from window
end type
type hpb_1 from hprogressbar within w_premios_ofertas_2
end type
type rb_con from radiobutton within w_premios_ofertas_2
end type
type rb_sin from radiobutton within w_premios_ofertas_2
end type
type st_3 from statictext within w_premios_ofertas_2
end type
type ddlb_1 from dropdownlistbox within w_premios_ofertas_2
end type
type rb_estadistica from radiobutton within w_premios_ofertas_2
end type
type st_fecha from statictext within w_premios_ofertas_2
end type
type rb_resumen from radiobutton within w_premios_ofertas_2
end type
type rb_supervisores from radiobutton within w_premios_ofertas_2
end type
type rb_agentes from radiobutton within w_premios_ofertas_2
end type
type dw_2 from datawindow within w_premios_ofertas_2
end type
type cb_3 from commandbutton within w_premios_ofertas_2
end type
type cb_imprimir from commandbutton within w_premios_ofertas_2
end type
type dw_paso from datawindow within w_premios_ofertas_2
end type
type dw_1 from datawindow within w_premios_ofertas_2
end type
type dw_ofertas from datawindow within w_premios_ofertas_2
end type
type st_2 from statictext within w_premios_ofertas_2
end type
type st_1 from statictext within w_premios_ofertas_2
end type
type p_2 from picture within w_premios_ofertas_2
end type
type em_2 from editmask within w_premios_ofertas_2
end type
type p_1 from picture within w_premios_ofertas_2
end type
type em_1 from editmask within w_premios_ofertas_2
end type
type cb_2 from commandbutton within w_premios_ofertas_2
end type
type cb_1 from commandbutton within w_premios_ofertas_2
end type
type gb_2 from groupbox within w_premios_ofertas_2
end type
type gb_1 from groupbox within w_premios_ofertas_2
end type
type gb_3 from groupbox within w_premios_ofertas_2
end type
type gb_5 from groupbox within w_premios_ofertas_2
end type
end forward

global type w_premios_ofertas_2 from window
integer x = 837
integer y = 588
integer width = 1705
integer height = 1484
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
hpb_1 hpb_1
rb_con rb_con
rb_sin rb_sin
st_3 st_3
ddlb_1 ddlb_1
rb_estadistica rb_estadistica
st_fecha st_fecha
rb_resumen rb_resumen
rb_supervisores rb_supervisores
rb_agentes rb_agentes
dw_2 dw_2
cb_3 cb_3
cb_imprimir cb_imprimir
dw_paso dw_paso
dw_1 dw_1
dw_ofertas dw_ofertas
st_2 st_2
st_1 st_1
p_2 p_2
em_2 em_2
p_1 p_1
em_1 em_1
cb_2 cb_2
cb_1 cb_1
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
gb_5 gb_5
end type
global w_premios_ofertas_2 w_premios_ofertas_2

type variables
datetime fecha_ingreso
end variables

forward prototypes
public function integer wf_super ()
public function integer wf_verifica_venta_directa_ (double valor, double venta, string age, string sup, string sql, string canal)
public function integer wf_jefes ()
public subroutine wf_open ()
end prototypes

public function integer wf_super ();//integer porc,i,a,numero,CONT
//double monto,tope_sup,total,suma_ni,min,max,UNIDAD,CONT_DIV,vta_mensual,total_total,ABONO
//long total_old
//string CANAL,SUP
//if dw_paso.rowcount() >0 then	
//	for a = 1 to dw_paso.rowcount()
//		canal    	= dw_paso.getitemstring(a,'tipo')
//		monto    	= dw_paso.getitemnumber(a,'monto_sup')
//		tope_sup 	= dw_paso.getitemnumber(a,'tope_max_sup')
//		porc     	= dw_paso.getitemnumber(a,'porc_supint')
//		min      	= dw_paso.getitemnumber(a,'rango_min')
//		max      	= dw_paso.getitemnumber(a,'rango_max')
//		vta_mensual = dw_paso.getitemnumber(a,'vta_mensual')
//		dw_1.retrieve(CANAL,int(min))
//		if dw_1.rowcount() > 0 then
//			numero = dw_1.rowcount()
//			for i = 1 to dw_1.rowcount()
//				SUP = DW_1.GETITEMSTRING(i,'COD_SUP')
//				total = monto/numero
//				SELECT count("META_SUPER"."COD_SUP") INTO :CONT_DIV
//			   FROM "META_SUPER"   
////   			WHERE "META_SUPER"."TOTAL_UNIDAD"+"META_SUPER"."ABONO" >=:vta_mensual  and 
////				"META_SUPER"."TIPO_CANAL"=:canal;
//   			WHERE "META_SUPER"."TOTAL_TOTAL" >=:vta_mensual  and 
//				"META_SUPER"."TIPO_CANAL"=:canal;
//
//				IF tope_sup <> 0 AND total > tope_sup then total = tope_sup
//				
//				select "MONTO_SUP","ABONO","TOTAL_UNIDAD","TOTAL_TOTAL"
//				into :total_old,:ABONO,:UNIDAD,:total_total 
//				from "META_SUPER"  
//				WHERE "META_SUPER"."TIPO_CANAL"=:canal and "META_SUPER"."COD_SUP"=:sup;
//				if sqlca.sqlcode <> 0 then total_old = 0
//				if CONT_DIV > 0 then
//					TOTAL = (TOTAL/CONT_DIV)					
//					TOTAL = TOTAL_OLD + TOTAL
// 				   ABONO = ABONO + UNIDAD
//				else
//					TOTAL = TOTAL_OLD + TOTAL// + (suma_ni*(porc/100))
//				   ABONO = ABONO + UNIDAD
//				end if
////---------------------------------				
//				if canal='NI' then 
//	    	 		SELECT "NECESIDAD_INMEDIATA"."MONTO_SUP"  into :total
//					FROM "NECESIDAD_INMEDIATA"  
//					WHERE ( "NECESIDAD_INMEDIATA"."RANGO_MAX" >= :abono ) ;
//				end if
////---------------------------------				
//				UPDATE "META_SUPER" 
//				SET "MONTO_SUP"=:total,
//					 "FECHA_INGRESO"=:fecha_ingreso,
//					 "TOTAL_TOTAL"=:ABONO 
//				WHERE "META_SUPER"."TIPO_CANAL"=:canal and "META_SUPER"."COD_SUP"=:sup;
//				if sqlca.sqlcode = 0 then
//					commit;
//				else
//					ROLLBACK;					
//				end if
//			next
//		end if
//	next
//end if	
return 1
end function

public function integer wf_verifica_venta_directa_ (double valor, double venta, string age, string sup, string sql, string canal);integer min,max,VTA,porc,i,cont
double unidades,uno,dos,monto,tope_sup,total
long premio,medio_premio,suma_ni,top,int_valor,total_old,top_total
string jefe

PREPARE sqlsa FROM :sql;
DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
OPEN DYNAMIC dyn_cursor;  
IF sqlca.sqlcode < 0 THEN
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_inserta_valor()")
	Return -1
END IF
Do While sqlca.sqlcode = 0
	Fetch dyn_cursor into :min,:max,:vta,:unidades,:premio,:medio_premio,:monto,:tope_sup,:porc,:top,:int_valor;
	If sqlca.sqlcode = 0 Then
		if venta >= min and venta <= max then 
			Close dyn_cursor;
//------------agentes--------------------------------------------------------------------			
			IF unidades <> 0 then
				if valor >= unidades then
					uno = premio
					if uno > 0 then
						dos = (valor - unidades) / 0.5
						dos = dos * medio_premio
					end if
				end if	
			else
				uno = 0
				dos = 0
			end if	
			uno = uno + dos
			INSERT INTO "META_AGENTE" ( "COD_AGE","COD_SUP","TOTAL_UNIDAD","TOTAL" ,"FECHA")  
			  VALUES ( :age,:sup,:VALOR,:uno,:fecha_ingreso )  ;
			if sqlca.sqlcode <> 0 then
				update "META_AGENTE" 
				set  "TOTAL_UNIDAD"=:VALOR,
					  "TOTAL"=:uno,
					  "FECHA"=:fecha_ingreso
				where "COD_AGE"=:age and "COD_SUP"=:sup;
				if sqlca.sqlcode = 0 then
					commit;
				else
					ROLLBACK;					
				end if	
			else
				commit;
			end if
			if venta >= top then
//-----------------------------------------------------
//				if canal = 'NI' then
//					SELECT sum("META_AGENTE"."TOTAL") into :suma_ni
//					FROM "META_AGENTE","META_SUPER"  
//					WHERE ( "META_AGENTE"."COD_SUP" = "META_SUPER"."COD_SUP" ) and  
//					( ( "META_SUPER"."TIPO_CANAL" = :canal ) )   ;
//					int_valor = int_valor + (suma_ni*(porc/100))
//				end if
//				if canal = 'PV' then
//					select count(total_total) into :cont
//					from supervisor,meta_super
//					where supervisor.cod_sup=meta_super.cod_sup and
//							supervisor.cod_jefe=:jefe  and  
//							meta_super.tipo_canal='PV' and
//							total_total >= (select distinct supint_top from punto_venta );
//					select distinct supint_valor into :top_total from punto_venta		;
//				end if		
//				if canal = 'VD' then
//					select count(total_total) into :cont
//					from supervisor,meta_super
//					where supervisor.cod_sup=meta_super.cod_sup and
//							supervisor.cod_jefe=:jefe  and  
//							meta_super.tipo_canal='VD' and
//							total_total >= (select distinct supint_top from venta_directa );
//				select distinct supint_valor into :top_total from venta_directa;
//				end if		
//				if isnull(cont) or cont<=0 then cont = 1
//				int_valor = top_total*cont
//-----------------------------------------------------
//				select jefe_venta into :jefe from meta_super where cod_sup =:sup;
//				select total into :total_old from META_SUPERINT where jefe_venta =:jefe;
//				int_valor = int_valor + total_old
//				INSERT INTO "META_SUPERINT" ( "JEFE_VENTA","COD_SUP","TOTAL" ,"FECHA")  
//  				VALUES ( :jefe,:sup,:int_valor,:fecha_ingreso )  ;
//				if sqlca.sqlcode <> 0 then
//					UPDATE "META_SUPERINT"  
//					SET "TOTAL" = :int_valor  ,"META_SUPERINT"."FECHA"=:fecha_ingreso 
//					WHERE ( "META_SUPERINT"."JEFE_VENTA" = :jefe ) AND  
//					( "META_SUPERINT"."COD_SUP" = :sup);
//					if sqlca.sqlcode = 0 then
//						commit;
//					else
//						ROLLBACK;					
//					end if
//				else
//					commit;
//				end if	
			end if	
		end if
	END IF
Loop
Close dyn_cursor;
return 1
end function

public function integer wf_jefes ();integer i,cont,meta
long int_valor,top_total,suma_ni,total_old
string sup,jefe,canal
dw_2.settransobject(sqlca)
dw_2.retrieve()
if dw_2.rowcount() > 0 then
	for i = 1 to dw_2.rowcount()
		sup       = dw_2.getitemstring(i,'supervisor_cod_sup')
		jefe      = dw_2.getitemstring(i,'jefe_ventas_jefe_ventas')
		canal     = dw_2.getitemstring(i,'meta_super_tipo_canal')
		meta      = dw_2.getitemnumber(i,'meta')		
		int_valor = dw_2.getitemnumber(i,'meta_super_total_total')
		if meta = 1 then
			if canal='PV' then
				select count(total_total) into :cont
				from supervisor,meta_super
				where supervisor.cod_sup=meta_super.cod_sup and
						supervisor.cod_jefe=:jefe  and  
						meta_super.tipo_canal=:canal and
						total_total >= (select distinct supint_top from punto_venta );
				select distinct supint_valor into :top_total from punto_venta		;
				int_valor = top_total * cont							
				if cont > 0 then
					int_valor = top_total * 1
				end if	
			elseif canal='VD' then
				select count(total_total) into :cont
				from supervisor,meta_super
				where supervisor.cod_sup=meta_super.cod_sup and
						supervisor.cod_jefe=:jefe  and  
						meta_super.tipo_canal=:canal and
						total_total >= (select distinct supint_top from venta_directa );
				select distinct supint_valor into :top_total from venta_directa		;
				int_valor = top_total * cont			
				if cont > 0 then
					int_valor = top_total * 1
				end if				
			elseif canal = 'NI' then
				SELECT sum("META_AGENTE"."TOTAL") into :suma_ni
				FROM "META_AGENTE","META_SUPER"  
				WHERE ( "META_AGENTE"."COD_SUP" = "META_SUPER"."COD_SUP" ) and  
				( ( "META_SUPER"."TIPO_CANAL" = :canal ) )   ;
				int_valor = (suma_ni*(10/100))
			end if
	//		select total into :total_old from META_SUPERINT
	//		WHERE ( "META_SUPERINT"."JEFE_VENTA" = :jefe );
	//		int_valor = int_valor + total_old
			INSERT INTO "META_SUPERINT" ( "JEFE_VENTA","COD_SUP","TOTAL" ,"FECHA")  
			VALUES ( :jefe,:sup,:int_valor,:fecha_ingreso )  ;
			if sqlca.sqlcode <> 0 then
				UPDATE "META_SUPERINT"  
				SET "TOTAL" = :int_valor  ,"META_SUPERINT"."FECHA"=:fecha_ingreso 
				WHERE ( "META_SUPERINT"."JEFE_VENTA" = :jefe ) AND  
				( "META_SUPERINT"."COD_SUP" = :sup);
				if sqlca.sqlcode = 0 then
					commit;
				else
					ROLLBACK;					
				end if
			else
				commit;
			end if
		end if	
	next
end if
return 1
end function

public subroutine wf_open ();datetime fecha_oferta
string inicio,fin

select max(u_fecha) into :fecha_oferta from oferta_v;
inicio 						= 'Espere unos minutos, Procesando Registros'
fin    						= 'La última fecha de actualización es : '+"'"+string(fecha_oferta,'dd/mm/yyyy')+"'"
gd_fecha_inicio     		= datetime(date(em_1.text),time('00:00:00'))
gd_fecha_fin	     		= datetime(date(em_2.text),time('00:00:00'))
gd_fecha_inicio_sup 		= datetime(date(em_1.text),time('00:00:00'))
gd_fecha_fin_sup	  		= datetime(date(em_2.text),time('00:00:00'))
gs_canal        			= ddlb_1.text
if rb_agentes.checked = true then
	st_fecha.textcolor	= rgb(0,0,255)
	st_fecha.text 			= inicio
	open(w_datos_vendedor)
	st_fecha.textcolor 	= rgb(255,0,0)
	st_fecha.text 			= fin
//elseif rb_supervisores.checked = true then
//	st_fecha.textcolor = rgb(0,0,255)
//	st_fecha.text = inicio
//	open(w_datos_supervisor)
//	st_fecha.textcolor = rgb(255,0,0)
//	st_fecha.text = fin
//elseif rb_resumen.checked = true then
//	st_fecha.textcolor = rgb(0,0,255)
//	st_fecha.text = inicio
//	open(w_datos_supervisor_resumen)
//	st_fecha.textcolor = rgb(255,0,0)
//	st_fecha.text = fin
//elseif rb_estadistica.checked = true then
//	st_fecha.textcolor = rgb(0,0,255)
//	st_fecha.text = inicio
//	open(w_estadisticas)
//	st_fecha.textcolor = rgb(255,0,0)
//	st_fecha.text = fin
end if
end subroutine

on w_premios_ofertas_2.create
this.hpb_1=create hpb_1
this.rb_con=create rb_con
this.rb_sin=create rb_sin
this.st_3=create st_3
this.ddlb_1=create ddlb_1
this.rb_estadistica=create rb_estadistica
this.st_fecha=create st_fecha
this.rb_resumen=create rb_resumen
this.rb_supervisores=create rb_supervisores
this.rb_agentes=create rb_agentes
this.dw_2=create dw_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.dw_paso=create dw_paso
this.dw_1=create dw_1
this.dw_ofertas=create dw_ofertas
this.st_2=create st_2
this.st_1=create st_1
this.p_2=create p_2
this.em_2=create em_2
this.p_1=create p_1
this.em_1=create em_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_5=create gb_5
this.Control[]={this.hpb_1,&
this.rb_con,&
this.rb_sin,&
this.st_3,&
this.ddlb_1,&
this.rb_estadistica,&
this.st_fecha,&
this.rb_resumen,&
this.rb_supervisores,&
this.rb_agentes,&
this.dw_2,&
this.cb_3,&
this.cb_imprimir,&
this.dw_paso,&
this.dw_1,&
this.dw_ofertas,&
this.st_2,&
this.st_1,&
this.p_2,&
this.em_2,&
this.p_1,&
this.em_1,&
this.cb_2,&
this.cb_1,&
this.gb_2,&
this.gb_1,&
this.gb_3,&
this.gb_5}
end on

on w_premios_ofertas_2.destroy
destroy(this.hpb_1)
destroy(this.rb_con)
destroy(this.rb_sin)
destroy(this.st_3)
destroy(this.ddlb_1)
destroy(this.rb_estadistica)
destroy(this.st_fecha)
destroy(this.rb_resumen)
destroy(this.rb_supervisores)
destroy(this.rb_agentes)
destroy(this.dw_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.dw_paso)
destroy(this.dw_1)
destroy(this.dw_ofertas)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_2)
destroy(this.em_2)
destroy(this.p_1)
destroy(this.em_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_5)
end on

event open;datetime fecha_oferta
integer i
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
select max(u_fecha) into :fecha_oferta from oferta_v;
st_fecha.text = '        La última fecha de actualización es : '+"'"+string(fecha_oferta,'dd/mm/yyyy')+"'"
this.title = mid(gs_app_name,1,len(gs_app_name) -4)
em_1.text = string(today(),gs_formato_fecha)
em_2.text = string(today(),gs_formato_fecha)
//i = '01/'+month( RelativeDate( today() ,30 ) )
ddlb_1.SelectItem(1)
if ddlb_1.text = 'NI' then
	em_1.text = '01/'+string(month(RelativeDate(date(em_2.text),- 360)),'00')+'/'+string(year(RelativeDate(date(em_2.text),- 360)))
else
	em_1.text = '01/'+string(month(RelativeDate(date(em_2.text),- 180)),'00')+'/'+string(year(RelativeDate(date(em_2.text),- 180)))
end if


end event

type hpb_1 from hprogressbar within w_premios_ofertas_2
integer x = 55
integer y = 992
integer width = 1545
integer height = 128
unsignedinteger maxposition = 100
integer setstep = 10
end type

type rb_con from radiobutton within w_premios_ofertas_2
integer x = 96
integer y = 376
integer width = 1079
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Con Licencia Medica."
borderstyle borderstyle = stylelowered!
end type

type rb_sin from radiobutton within w_premios_ofertas_2
integer x = 96
integer y = 284
integer width = 1051
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Sin Licencia Medica."
boolean checked = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_premios_ofertas_2
integer x = 96
integer y = 100
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Tipo Canal :"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_premios_ofertas_2
integer x = 503
integer y = 84
integer width = 274
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
string item[] = {"NI","NF"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if this.text = 'NI' then
	em_1.text = '01/'+string(month(RelativeDate(date(em_2.text),- 360)),'00')+'/'+string(year(RelativeDate(date(em_2.text),- 360)))
else
	em_1.text = '01/'+string(month(RelativeDate(date(em_2.text),- 180)),'00')+'/'+string(year(RelativeDate(date(em_2.text),- 180)))
end if
end event

type rb_estadistica from radiobutton within w_premios_ofertas_2
integer x = 1975
integer y = 404
integer width = 663
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Estadistica"
end type

type st_fecha from statictext within w_premios_ofertas_2
integer x = 55
integer y = 1152
integer width = 1545
integer height = 188
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_resumen from radiobutton within w_premios_ofertas_2
integer x = 1975
integer y = 312
integer width = 663
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Resumen por Sup."
end type

type rb_supervisores from radiobutton within w_premios_ofertas_2
integer x = 1975
integer y = 220
integer width = 521
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Supervisores"
end type

type rb_agentes from radiobutton within w_premios_ofertas_2
integer x = 1975
integer y = 128
integer width = 521
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Agentes"
boolean checked = true
end type

type dw_2 from datawindow within w_premios_ofertas_2
integer x = 2802
integer y = 400
integer width = 494
integer height = 360
boolean titlebar = true
string dataobject = "dw_jefes"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type cb_3 from commandbutton within w_premios_ofertas_2
event clicked pbm_bnclicked
integer x = 2990
integer y = 1512
integer width = 302
integer height = 176
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;dateTIME fecha1,fecha2

fecha1 = datetime(date(em_1.text),time('00:00:00'))
fecha2 = datetime(date(em_2.text),time('00:00:00'))
dw_ofertas.settransobject(sqlca)
dw_ofertas.retrieve(fecha1,fecha2)
end event

type cb_imprimir from commandbutton within w_premios_ofertas_2
boolean visible = false
integer x = 608
integer y = 860
integer width = 306
integer height = 108
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;//cb_1.enabled = false
//cb_2.enabled = false
//open(w_seleccion_impresion)
//cb_1.enabled = true
//cb_2.enabled = true
end event

type dw_paso from datawindow within w_premios_ofertas_2
integer x = 2802
integer y = 1140
integer width = 494
integer height = 360
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_1 from datawindow within w_premios_ofertas_2
integer x = 2802
integer y = 768
integer width = 494
integer height = 360
boolean titlebar = true
string dataobject = "dw_supervisores"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_ofertas from datawindow within w_premios_ofertas_2
integer x = 2802
integer y = 32
integer width = 494
integer height = 360
boolean titlebar = true
string dataobject = "dw_ofertas_periodo"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

event rowfocuschanged;SelectRow(0, FALSE)
SelectRow(GetRow(), TRUE)
end event

event doubleclicked;print()
end event

type st_2 from statictext within w_premios_ofertas_2
integer x = 850
integer y = 584
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Fecha final del periodo"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_premios_ofertas_2
integer x = 96
integer y = 584
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Fecha inicio del periodo"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_2 from picture within w_premios_ofertas_2
integer x = 1422
integer y = 672
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf,mes

if f_valida_fecha(em_2.text)=-1 then 
	em_2.text=string(today(),gs_formato_fecha)
	em_2.setfocus()
	return
end if	
if em_2.text<>'00/00/0000' then
	ls_fecha = em_2.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

//IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(EM_1.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_2.setfocus()
		return
	else	
		em_2.text = Message.StringParm
		if ddlb_1.text = 'NI' then
			em_1.text = '01/'+string(month(RelativeDate(date(em_2.text),- 360)),'00')+'/'+string(year(RelativeDate(date(em_2.text),- 360)))
//			em_1.text = '06/01/2005'
		else
			em_1.text = '01/'+string(month(RelativeDate(date(em_2.text),- 180)),'00')+'/'+string(year(RelativeDate(date(em_2.text),- 180)))
//			em_1.text = '06/01/2005'
		end if
	end if	
//END IF
end event

type em_2 from editmask within w_premios_ofertas_2
integer x = 965
integer y = 664
integer width = 425
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type p_1 from picture within w_premios_ofertas_2
boolean visible = false
integer x = 663
integer y = 320
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_1.text)=-1 then 
	em_1.text=string(today(),gs_formato_fecha)
	em_1.setfocus()
	return
end if	
if em_1.text<>'00/00/0000' then
	ls_fecha = em_1.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(EM_2.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_1.setfocus()
		return
	else	
		em_1.text = Message.StringParm
	end if	
END IF
end event

type em_1 from editmask within w_premios_ofertas_2
integer x = 215
integer y = 664
integer width = 425
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type cb_2 from commandbutton within w_premios_ofertas_2
integer x = 1198
integer y = 852
integer width = 402
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premios_ofertas_2)
end event

type cb_1 from commandbutton within w_premios_ofertas_2
integer x = 50
integer y = 852
integer width = 402
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;if rb_sin.checked = true then
	gs_lic = '0'
elseif rb_con.checked = true then
	gs_lic = '1'
end if
wf_open()
end event

type gb_2 from groupbox within w_premios_ofertas_2
integer x = 1870
integer y = 56
integer width = 827
integer height = 480
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_premios_ofertas_2
integer x = 55
integer y = 12
integer width = 1545
integer height = 212
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
borderstyle borderstyle = styleraised!
end type

type gb_3 from groupbox within w_premios_ofertas_2
integer x = 55
integer y = 224
integer width = 1545
integer height = 264
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
borderstyle borderstyle = styleraised!
end type

type gb_5 from groupbox within w_premios_ofertas_2
integer x = 50
integer y = 496
integer width = 1545
integer height = 340
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
borderstyle borderstyle = styleraised!
end type

