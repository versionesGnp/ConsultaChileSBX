forward
global type w_rescomi_terreno from window
end type
type cb_2 from commandbutton within w_rescomi_terreno
end type
type cb_1 from commandbutton within w_rescomi_terreno
end type
type dw_rescomi from datawindow within w_rescomi_terreno
end type
end forward

global type w_rescomi_terreno from window
integer width = 2747
integer height = 1656
boolean titlebar = true
string title = "Res-Comi por Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_2 cb_2
cb_1 cb_1
dw_rescomi dw_rescomi
end type
global w_rescomi_terreno w_rescomi_terreno

on w_rescomi_terreno.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_rescomi=create dw_rescomi
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_rescomi}
end on

on w_rescomi_terreno.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_rescomi)
end on

event open;string	ls_base,ls_serie,ls_status_comision
long		ll_plazo,ll_tot_reg
Double	ldb_numero,ldb_1,ldb_2,ldb_3,ldb_4,ldb_5,ldb_6,ldb_7,ldb_8,ldb_9,ldb_10,ldb_11,ldb_12

connect using Trans_1;

gf_centrar(w_rescomi_terreno)
ls_base					= substr(1,1,Message.StringParm)
ls_serie					= substr(1,2,Message.StringParm)
ldb_numero				= double(substr(1,3,Message.StringParm))
dw_rescomi.dataobject	= 'dw_res_comi_terreno'
dw_rescomi.settransobject(sqlca)
ll_tot_reg				= dw_rescomi.retrieve(ls_base,ls_serie,ldb_numero)
if ll_tot_reg=0 then
	messagebox("Advertencia","No registra Pagos")
else
	SELECT	"PAGO_OFERTA"."NRO_CUOTAS",	"OFERTA_V"."ESTATUS_COMISION" 
  	INTO		:ll_plazo,							:ls_status_comision		 
   	FROM		"OFERTA_V","PAGO_OFERTA","CADENA"  
   	WHERE	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
         		( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
         		( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
         		( "PAGO_OFERTA"."SERIE" = "CADENA"."SERIE" ) and  
         		( "PAGO_OFERTA"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
         		( ( "CADENA"."CODIGO" = :ls_base ) AND  
         		( "OFERTA_V"."SERIE" = :ls_serie ) AND  
         		( "OFERTA_V"."NRO_OFERTA" = :ldb_numero ))
	USING	sqlca;
	if sqlca.sqlcode=0 then
		SELECT	"UNO",	"DOS",	"TRES",	"CUATRO",	"CINCO",	"SEIS",	"SIETE",	"OCHO",	"NUEVE",	"DIES",	"ONCE",	"DOCE"  
    		INTO		:ldb_1,	:ldb_2,	:ldb_3,	:ldb_4,		:ldb_5,	:ldb_6,	:ldb_7,	:ldb_8,	:ldb_9,	:ldb_10,	:ldb_11,	:ldb_12  
    		FROM		"COMISION_ATENCION_TERRENO"  
   		WHERE	( "COMISION_ATENCION_TERRENO"."CRED_MIN" <= :ll_plazo ) AND  
      			   	( "COMISION_ATENCION_TERRENO"."CRED_MAX" >= :ll_plazo )
		USING	Trans_1;
		if Trans_1.sqlcode=0 then
		//	dw_rescomi.object.t_titulo.text		= 'Cta. Nº 1: '+string(ldb_1,"###,##0.0")+'      Cta. Nº 2: '+string(ldb_2,"###,##0.0")+'      Cta. Nº 3: '+string(ldb_3,"###,##0.0")+'      Cta. Nº  4: '+string(ldb_4,"###,##0.0")+'       Cta. Nº  5:  '+string(ldb_5,"###,##0.0")+'      Cta. Nº  6:  '+string(ldb_6,"###,##0.0")
		//	dw_rescomi.object.t_titulo_1.text	= 'Cta. Nº 7: '+string(ldb_7,"###,##0.0")+'      Cta. Nº 8: '+string(ldb_8,"###,##0.0")+'      Cta. Nº 9: '+string(ldb_9,"###,##0.0")+'      Cta. Nº 10: '+string(ldb_10,"###,##0.0")+'      Cta. Nº 11: '+string(ldb_11,"###,##0.0")+'      Cta. Nº 12: '+string(ldb_12,"###,##0.0") 
		end if
	end if
end if
end event

event close;disconnect using Trans_1;
end event

type cb_2 from commandbutton within w_rescomi_terreno
integer x = 46
integer y = 1420
integer width = 306
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_rescomi.rowcount() > 0 then dw_rescomi.print()
end event

type cb_1 from commandbutton within w_rescomi_terreno
integer x = 2359
integer y = 1420
integer width = 325
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_rescomi_terreno)
end event

type dw_rescomi from datawindow within w_rescomi_terreno
integer x = 46
integer y = 44
integer width = 2638
integer height = 1348
integer taborder = 10
string dataobject = "dw_res_comi_terreno"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

