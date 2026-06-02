forward
global type w_update_oferta_v from window
end type
type dw_1 from datawindow within w_update_oferta_v
end type
type hpb_1 from hprogressbar within w_update_oferta_v
end type
type dw_2 from datawindow within w_update_oferta_v
end type
type st_4 from statictext within w_update_oferta_v
end type
type st_3 from statictext within w_update_oferta_v
end type
type st_2 from statictext within w_update_oferta_v
end type
type st_1 from statictext within w_update_oferta_v
end type
type p_2 from picture within w_update_oferta_v
end type
type em_2 from editmask within w_update_oferta_v
end type
type p_1 from picture within w_update_oferta_v
end type
type em_1 from editmask within w_update_oferta_v
end type
type cb_2 from commandbutton within w_update_oferta_v
end type
type cb_1 from commandbutton within w_update_oferta_v
end type
type gb_1 from groupbox within w_update_oferta_v
end type
end forward

global type w_update_oferta_v from window
integer x = 837
integer y = 588
integer width = 1422
integer height = 1188
boolean titlebar = true
string title = "Actualiza U.Fecha "
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
hpb_1 hpb_1
dw_2 dw_2
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
p_2 p_2
em_2 em_2
p_1 p_1
em_1 em_1
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_update_oferta_v w_update_oferta_v

type variables
long	il_folio
datetime	idt_fec_pago,idt_servipag
end variables

forward prototypes
public function integer wf_trae_datos (string sql, datetime fecha_1, datetime fecha_2)
end prototypes

public function integer wf_trae_datos (string sql, datetime fecha_1, datetime fecha_2);datetime fecha
string serie
long contrato

PREPARE sqlsa FROM :sql;
DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
OPEN DYNAMIC dyn_cursor;  
IF sqlca.sqlcode < 0 THEN
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_trae_datos()")
	Return -1
END IF
Do While sqlca.sqlcode = 0
	Fetch dyn_cursor into :serie,:contrato,:fecha;
	If sqlca.sqlcode = 0 Then
	
	END IF
Loop
Close dyn_cursor;
return 1
end function

on w_update_oferta_v.create
this.dw_1=create dw_1
this.hpb_1=create hpb_1
this.dw_2=create dw_2
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.p_2=create p_2
this.em_2=create em_2
this.p_1=create p_1
this.em_1=create em_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.hpb_1,&
this.dw_2,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.p_2,&
this.em_2,&
this.p_1,&
this.em_1,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_update_oferta_v.destroy
destroy(this.dw_1)
destroy(this.hpb_1)
destroy(this.dw_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_2)
destroy(this.em_2)
destroy(this.p_1)
destroy(this.em_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;
gf_centrar(w_update_oferta_v)

em_1.text 		= string(today(),gs_formato_fecha)
em_2.text 		= string(today(),gs_formato_fecha)
end event

type dw_1 from datawindow within w_update_oferta_v
integer x = 2487
integer y = 584
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_fecha_pago"
boolean livescroll = true
end type

type hpb_1 from hprogressbar within w_update_oferta_v
integer x = 119
integer y = 692
integer width = 1175
integer height = 112
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_2 from datawindow within w_update_oferta_v
integer x = 1605
integer y = 60
integer width = 800
integer height = 748
boolean titlebar = true
string dataobject = "dw_resultado_ingreso_nuevo"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type st_4 from statictext within w_update_oferta_v
integer x = 626
integer y = 556
integer width = 375
integer height = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_update_oferta_v
integer x = 165
integer y = 568
integer width = 503
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Registro N°"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_update_oferta_v
integer x = 366
integer y = 340
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

type st_1 from statictext within w_update_oferta_v
integer x = 361
integer y = 148
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

type p_2 from picture within w_update_oferta_v
integer x = 928
integer y = 428
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

type em_2 from editmask within w_update_oferta_v
integer x = 480
integer y = 420
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

type p_1 from picture within w_update_oferta_v
integer x = 919
integer y = 236
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

type em_1 from editmask within w_update_oferta_v
integer x = 480
integer y = 228
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

type cb_2 from commandbutton within w_update_oferta_v
integer x = 1051
integer y = 924
integer width = 302
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_update_oferta_v)
end event

type cb_1 from commandbutton within w_update_oferta_v
integer x = 55
integer y = 924
integer width = 302
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string		ls_serie,ls_base,ls_tipo_cob,ls_tipo_mov
long		ll_tot_reg,ll_indi,ll_cta,ll_folio,ll_graba = 1
double	ldb_numero
datetime	ldt_fec_ini,ldt_fec_fin,ldt_fecha,ldt_fec_pago,ldt_fec_ing,ldt_servipag
date 		ld_u_fecha


cb_1.enabled = false
cb_2.enabled = false
SetPointer(HourGlass!)
ldt_fec_ini 								= datetime(date(em_1.text),time('00:00:00'))
ldt_fec_fin 								= datetime(date(em_2.text),time('23:59:59'))
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
ll_tot_reg								=  dw_2.retrieve(ldt_fec_ini,ldt_fec_fin) 
if ll_tot_reg>0 then
	hpb_1.maxposition 				= ll_tot_reg
	hpb_1.minposition 				= 0
	hpb_1.setstep 						= 10
	for ll_indi = 1 to ll_tot_reg
		ls_base       						= dw_2.getitemstring(ll_indi,'cadena_codigo')
		ls_serie         					= dw_2.getitemstring(ll_indi,'cadena_serie')
		ldb_numero      				= dw_2.getitemnumber(ll_indi,'cadena_numero')
		ldt_fec_ing						= dw_2.getitemdatetime(ll_indi,'fecha_ingreso')
		ldt_fecha							= dw_2.getitemdatetime(ll_indi,'fecha_min')
			
		if ldt_fecha >= ldt_fec_ini and ldt_fecha <= ldt_fec_fin then
			if dw_1.retrieve(ls_base,ls_serie,ldb_numero) > 0 then
				ldt_fec_pago			= dw_1.getitemdatetime(1,'fecha_pago')
				ldt_servipag			  	= dw_1.getitemdatetime(1,'servipag')
				ll_folio					= dw_1.getitemnumber(1,'folio')
			end if
			if sqlca.sqlcode = 0 then
				if ldt_fec_pago <= ldt_fec_ing then
					ld_u_fecha  			= date(ldt_fec_ing)
				elseif ldt_fec_pago > ldt_fec_ing then
					ld_u_fecha  			= date(ldt_fec_pago)
				end if
				ld_u_fecha  				= date(ldt_servipag)
				if ls_base = 'L' then
					UPDATE	"ANEXO_LIBERADOR"  
					SET 		"U_FOLIO" = :ll_folio,   
						 		"U_FECHA" = :ld_u_fecha  
					WHERE 	"ANEXO_LIBERADOR"."SERIE_M" = :ls_serie AND  
								"ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero
					USING	sqlca;
				elseif ls_base = 'O' then
					UPDATE 	"OFERTA_V"  
					SET 		"U_FOLIO" = :ll_folio,   
						 		"U_FECHA" = :ld_u_fecha  
					WHERE 	"OFERTA_V"."SERIE" = :ls_serie AND  
								"OFERTA_V"."NRO_OFERTA" = :ldb_numero
					USING	sqlca;
				elseif ls_base = 'A' then
					UPDATE	"ANEXO_AUMENTO"  
					SET 		"U_FOLIO" = :ll_folio,   
					    			"U_FECHA" = :ld_u_fecha 
					WHERE 	"ANEXO_AUMENTO"."SERIE_M" = :ls_serie AND  
								"ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero
					USING	sqlca;
				end if
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;		
				end if
			end if	
		end if
		hpb_1.position 			= ll_graba
		st_4.text 					= string(ll_graba)
		ll_graba++
	next
end if
cb_1.enabled = true
cb_2.enabled = true
SetPointer(Arrow!)
close(w_update_oferta_v)
end event

event dragenter;//SELECT INGRESO.SERIE,                                   
//     INGRESO.CONTRATO,                                       
//     MIN(INGRESO.FECHA_PAGO)                                 
//	  FROM INGRESO,OFERTA_V                                   
//	  WHERE ( INGRESO.SERIE    = OFERTA_V.SERIE ) and         
//	  ( INGRESO.CONTRATO       = OFERTA_V.NRO_OFERTA ) and    
//	  (INGRESO.TIPO_MOV        = A OR                 
//	  INGRESO.TIPO_MOV         = E OR                 
//	  INGRESO.TIPO_MOV        = I OR                  
//	  INGRESO.TIPO_MOV        = K) AND                
//	  (INGRESO.FECHA_PAGO >= fecha) AND             
//	  INGRESO.FECHA_PAGO <= fecha_1) AND           	  
//	  (INGRESO.PAGO_HIST      <> R) OR                
//	  (OFERTA_V.ULT_FOLIO      = 0)                           
//	  GROUP BY INGRESO.SERIE,                                 
//	  INGRESO.CONTRATO,                                       
//	  INGRESO.FECHA_PAGO                                      
//	  HAVING ( INGRESO.FECHA_PAGO = min(INGRESO.FECHA_PAGO) )
end event

type gb_1 from groupbox within w_update_oferta_v
integer x = 55
integer y = 60
integer width = 1298
integer height = 804
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 80269524
string text = "Actualización Contratos ( Primer Pago. )."
borderstyle borderstyle = styleraised!
end type

