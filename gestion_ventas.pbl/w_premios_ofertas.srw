forward
global type w_premios_ofertas from window
end type
type rb_grupo from radiobutton within w_premios_ofertas
end type
type rb_1 from radiobutton within w_premios_ofertas
end type
type rb_estadistica from radiobutton within w_premios_ofertas
end type
type st_fecha from statictext within w_premios_ofertas
end type
type rb_resumen from radiobutton within w_premios_ofertas
end type
type rb_supervisores from radiobutton within w_premios_ofertas
end type
type rb_agentes from radiobutton within w_premios_ofertas
end type
type dw_2 from datawindow within w_premios_ofertas
end type
type cb_3 from commandbutton within w_premios_ofertas
end type
type cb_imprimir from commandbutton within w_premios_ofertas
end type
type dw_paso from datawindow within w_premios_ofertas
end type
type dw_1 from datawindow within w_premios_ofertas
end type
type dw_ofertas from datawindow within w_premios_ofertas
end type
type st_2 from statictext within w_premios_ofertas
end type
type st_1 from statictext within w_premios_ofertas
end type
type p_2 from picture within w_premios_ofertas
end type
type em_2 from editmask within w_premios_ofertas
end type
type p_1 from picture within w_premios_ofertas
end type
type em_1 from editmask within w_premios_ofertas
end type
type cb_2 from commandbutton within w_premios_ofertas
end type
type cb_1 from commandbutton within w_premios_ofertas
end type
type gb_2 from groupbox within w_premios_ofertas
end type
type gb_1 from groupbox within w_premios_ofertas
end type
end forward

global type w_premios_ofertas from window
integer x = 837
integer y = 588
integer width = 1833
integer height = 968
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
rb_grupo rb_grupo
rb_1 rb_1
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
end type
global w_premios_ofertas w_premios_ofertas

type variables
datetime fecha_ingreso
end variables

forward prototypes
public function integer wf_verifica_venta_directa_ (double valor, double venta, string age, string sup, string sql, string canal)
public function integer wf_super ()
public function integer wf_jefes ()
end prototypes

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

public function integer wf_super ();integer porc,i,a,numero,CONT
double monto,tope_sup,total,suma_ni,min,max,UNIDAD,CONT_DIV,vta_mensual,total_total,ABONO
long total_old
string CANAL,SUP
if dw_paso.rowcount() >0 then	
	for a = 1 to dw_paso.rowcount()
		canal    	= dw_paso.getitemstring(a,'tipo')
		monto    	= dw_paso.getitemnumber(a,'monto_sup')
		tope_sup 	= dw_paso.getitemnumber(a,'tope_max_sup')
		porc     	= dw_paso.getitemnumber(a,'porc_supint')
		min      	= dw_paso.getitemnumber(a,'rango_min')
		max      	= dw_paso.getitemnumber(a,'rango_max')
		vta_mensual = dw_paso.getitemnumber(a,'vta_mensual')
		dw_1.retrieve(CANAL,int(min))
		if dw_1.rowcount() > 0 then
			numero = dw_1.rowcount()
			for i = 1 to dw_1.rowcount()
				SUP = DW_1.GETITEMSTRING(i,'COD_SUP')
				total = monto/numero
				SELECT count("META_SUPER"."COD_SUP") INTO :CONT_DIV
			   FROM "META_SUPER"   
//   			WHERE "META_SUPER"."TOTAL_UNIDAD"+"META_SUPER"."ABONO" >=:vta_mensual  and 
//				"META_SUPER"."TIPO_CANAL"=:canal;
   			WHERE "META_SUPER"."TOTAL_TOTAL" >=:vta_mensual  and 
				"META_SUPER"."TIPO_CANAL"=:canal;

				IF tope_sup <> 0 AND total > tope_sup then total = tope_sup
				
				select "MONTO_SUP","ABONO","TOTAL_UNIDAD","TOTAL_TOTAL"
				into :total_old,:ABONO,:UNIDAD,:total_total 
				from "META_SUPER"  
				WHERE "META_SUPER"."TIPO_CANAL"=:canal and "META_SUPER"."COD_SUP"=:sup;
				if sqlca.sqlcode <> 0 then total_old = 0
				if CONT_DIV > 0 then
					TOTAL = (TOTAL/CONT_DIV)					
					TOTAL = TOTAL_OLD + TOTAL
 				   ABONO = ABONO + UNIDAD
				else
					TOTAL = TOTAL_OLD + TOTAL// + (suma_ni*(porc/100))
				   ABONO = ABONO + UNIDAD
				end if
//---------------------------------				
				if canal='NI' then 
	    	 		SELECT "NECESIDAD_INMEDIATA"."MONTO_SUP"  into :total
					FROM "NECESIDAD_INMEDIATA"  
					WHERE ( "NECESIDAD_INMEDIATA"."RANGO_MAX" >= :abono ) ;
				end if
//---------------------------------				
				UPDATE "META_SUPER" 
				SET "MONTO_SUP"=:total,
					 "FECHA_INGRESO"=:fecha_ingreso,
					 "TOTAL_TOTAL"=:ABONO 
				WHERE "META_SUPER"."TIPO_CANAL"=:canal and "META_SUPER"."COD_SUP"=:sup;
				if sqlca.sqlcode = 0 then
					commit;
				else
					ROLLBACK;					
				end if
			next
		end if
	next
end if	
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

on w_premios_ofertas.create
this.rb_grupo=create rb_grupo
this.rb_1=create rb_1
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
this.Control[]={this.rb_grupo,&
this.rb_1,&
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
this.gb_1}
end on

on w_premios_ofertas.destroy
destroy(this.rb_grupo)
destroy(this.rb_1)
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
end on

event open;datetime fecha_oferta

gf_centrar(w_premios_ofertas)
gs_ventana		= 'w_premios_ofertas'
f_valida_objeto2()
select max(u_fecha) into :fecha_oferta from oferta_v;
st_fecha.text 	= '        La última fecha de actualización es : '+"'"+string(fecha_oferta,'dd/mm/yyyy')+"'"
this.title 		= mid(gs_app_name,1,pos(gs_app_name,' ',15))+' ( Promesas )'
em_1.text 		= string(today(),gs_formato_fecha)
em_2.text 		= string(today(),gs_formato_fecha)

end event

type rb_grupo from radiobutton within w_premios_ofertas
integer x = 987
integer y = 396
integer width = 713
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Estadistica por Grupo"
end type

type rb_1 from radiobutton within w_premios_ofertas
boolean visible = false
integer x = 1001
integer y = 496
integer width = 663
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Estadistica"
end type

type rb_estadistica from radiobutton within w_premios_ofertas
integer x = 987
integer y = 324
integer width = 713
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Estadistica"
end type

type st_fecha from statictext within w_premios_ofertas
integer x = 55
integer y = 728
integer width = 1701
integer height = 104
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean enabled = false
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type rb_resumen from radiobutton within w_premios_ofertas
integer x = 987
integer y = 256
integer width = 713
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Resumen por Sup."
end type

type rb_supervisores from radiobutton within w_premios_ofertas
integer x = 987
integer y = 188
integer width = 713
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Supervisores"
end type

type rb_agentes from radiobutton within w_premios_ofertas
integer x = 987
integer y = 120
integer width = 713
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Agentes"
boolean checked = true
end type

type dw_2 from datawindow within w_premios_ofertas
integer x = 2661
integer y = 200
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

type cb_3 from commandbutton within w_premios_ofertas
event clicked pbm_bnclicked
integer x = 2313
integer y = 916
integer width = 302
integer height = 108
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

type cb_imprimir from commandbutton within w_premios_ofertas
boolean visible = false
integer x = 535
integer y = 924
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

type dw_paso from datawindow within w_premios_ofertas
integer x = 1856
integer y = 840
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

type dw_1 from datawindow within w_premios_ofertas
integer x = 1842
integer y = 428
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

type dw_ofertas from datawindow within w_premios_ofertas
integer x = 1874
integer y = 48
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

type st_2 from statictext within w_premios_ofertas
integer x = 101
integer y = 436
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha final del periodo"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_premios_ofertas
integer x = 96
integer y = 184
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha inicio del periodo"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_2 from picture within w_premios_ofertas
integer x = 663
integer y = 524
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

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

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(EM_1.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_2.setfocus()
		return
	else	
		em_2.text = Message.StringParm
	end if	
END IF
end event

type em_2 from editmask within w_premios_ofertas
integer x = 215
integer y = 516
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

type p_1 from picture within w_premios_ofertas
integer x = 663
integer y = 272
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

type em_1 from editmask within w_premios_ofertas
integer x = 215
integer y = 264
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

type cb_2 from commandbutton within w_premios_ofertas
integer x = 1349
integer y = 572
integer width = 402
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premios_ofertas)
end event

type cb_1 from commandbutton within w_premios_ofertas
integer x = 896
integer y = 572
integer width = 402
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;gd_fecha_inicio = datetime(date(em_1.text),time('00:00:00'))
gd_fecha_fin	 = datetime(date(em_2.text),time('00:00:00'))

if rb_agentes.checked = true then
	open(w_datos_vendedor)
elseif rb_supervisores.checked = true then
	open(w_datos_supervisor)
elseif rb_resumen.checked = true then
	open(w_datos_supervisor_resumen)
elseif rb_estadistica.checked = true then
	open(w_estadisticas)
elseif rb_1.checked = true then
	open(w_datos_vendedor_anual)
elseif rb_grupo.checked= true then
	open(w_estadisticas_grupo)
end if	
end event

type gb_2 from groupbox within w_premios_ofertas
integer x = 896
integer y = 56
integer width = 855
integer height = 452
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_premios_ofertas
integer x = 55
integer y = 56
integer width = 827
integer height = 624
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
string text = "Ventas Periodo"
borderstyle borderstyle = styleraised!
end type

