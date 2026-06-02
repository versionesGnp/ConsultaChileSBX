forward
global type w_mensaje_pie from window
end type
type st_canal from statictext within w_mensaje_pie
end type
type st_pie from statictext within w_mensaje_pie
end type
type st_6 from statictext within w_mensaje_pie
end type
type st_promesa from statictext within w_mensaje_pie
end type
type st_4 from statictext within w_mensaje_pie
end type
type st_3 from statictext within w_mensaje_pie
end type
type st_2 from statictext within w_mensaje_pie
end type
type st_1 from statictext within w_mensaje_pie
end type
type cb_no from commandbutton within w_mensaje_pie
end type
type cb_si from commandbutton within w_mensaje_pie
end type
type cb_cancelar from commandbutton within w_mensaje_pie
end type
end forward

global type w_mensaje_pie from window
integer width = 2514
integer height = 2036
boolean titlebar = true
string title = "Advertencia"
windowtype windowtype = response!
long backcolor = 67108864
st_canal st_canal
st_pie st_pie
st_6 st_6
st_promesa st_promesa
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_no cb_no
cb_si cb_si
cb_cancelar cb_cancelar
end type
global w_mensaje_pie w_mensaje_pie

on w_mensaje_pie.create
this.st_canal=create st_canal
this.st_pie=create st_pie
this.st_6=create st_6
this.st_promesa=create st_promesa
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_no=create cb_no
this.cb_si=create cb_si
this.cb_cancelar=create cb_cancelar
this.Control[]={this.st_canal,&
this.st_pie,&
this.st_6,&
this.st_promesa,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_no,&
this.cb_si,&
this.cb_cancelar}
end on

on w_mensaje_pie.destroy
destroy(this.st_canal)
destroy(this.st_pie)
destroy(this.st_6)
destroy(this.st_promesa)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_no)
destroy(this.cb_si)
destroy(this.cb_cancelar)
end on

event open;String	ls_base,ls_serie,ls_uso
Long		ll_count_cuota
Double	ldb_pie,ldb_sum_cuota,ll_numero

gf_centrar(w_mensaje_pie)
ls_base 				= trim(substr(1,1,Message.StringParm))
ls_serie				= trim(substr(1,2,Message.StringParm))
ll_numero			= Double(substr(1,3,Message.StringParm))
ldb_pie				= double(substr(1,4,Message.StringParm))
ls_uso				= substr(1,5,Message.StringParm)
st_pie.text			= string(ldb_pie,"###,###,###,##0.0###")
st_canal.text		= ls_uso
st_promesa.text	= ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")
SELECT	SUM("DETALLE_PAGO_PIE"."MONTO_CUOTA")  
INTO 		:ldb_sum_cuota  
FROM 	"DETALLE_PAGO_PIE"  
WHERE	"DETALLE_PAGO_PIE"."BASE" = :ls_base AND  
			"DETALLE_PAGO_PIE"."SERIE" = :ls_serie AND  
		 	"DETALLE_PAGO_PIE"."NUMERO" = :ll_numero    
Using		sqlca;
if ldb_sum_cuota>0 then
	if ldb_sum_cuota<>ldb_pie then
		SELECT	Count("DETALLE_PAGO_PIE"."MONTO_CUOTA")  
		INTO 		:ll_count_cuota  
		FROM 	"DETALLE_PAGO_PIE"  
		WHERE	"DETALLE_PAGO_PIE"."BASE" = :ls_base AND  
					"DETALLE_PAGO_PIE"."SERIE" = :ls_serie AND  
				 	"DETALLE_PAGO_PIE"."NUMERO" = :ll_numero AND
				 	"DETALLE_PAGO_PIE"."ESTADO" = 'C' 
		Using		sqlca;
		IF ll_count_cuota>0 THEN
			if isvalid(w_ingresar_oferta) then
				cb_si.enabled	= false
				cb_no.enabled	= false
				w_ingresar_oferta.dw_oferta_v.setitem(1,'pago_oferta_pie',ldb_sum_cuota)
			elseif isvalid(w_ingresar_funeraria) then
				cb_si.enabled	= false
				cb_no.enabled	= false
				w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_sum_cuota)
			end if
		END IF
	end if
end if
if isvalid(w_ingresar_oferta) then
	w_ingresar_oferta.dw_oferta_v.accepttext()
elseif isvalid(w_ingresar_funeraria) then	
	w_ingresar_funeraria.dw_anexo_funeraria.accepttext()
end if
end event

type st_canal from statictext within w_mensaje_pie
integer x = 1952
integer y = 88
integer width = 357
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_pie from statictext within w_mensaje_pie
integer x = 795
integer y = 264
integer width = 1115
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_mensaje_pie
integer x = 73
integer y = 272
integer width = 699
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pie:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_promesa from statictext within w_mensaje_pie
integer x = 795
integer y = 88
integer width = 1115
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_mensaje_pie
integer x = 73
integer y = 88
integer width = 699
integer height = 164
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Promesa:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mensaje_pie
integer x = 603
integer y = 1196
integer width = 1312
integer height = 200
integer textsize = -28
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Desea ingresar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mensaje_pie
integer x = 50
integer y = 748
integer width = 2373
integer height = 340
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recuerde que solo Canal: ~"NI~" es posible realizar esta Operación"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_mensaje_pie
integer x = 50
integer y = 500
integer width = 2373
integer height = 164
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
string text = "Pactará más de 1 Cuota el Pie"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_no from commandbutton within w_mensaje_pie
integer x = 901
integer y = 1600
integer width = 485
integer height = 156
integer taborder = 10
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&No"
boolean default = true
end type

event clicked;String	ls_base,ls_serie
Long		ll_count_cuota
Double	ll_numero
if isvalid(w_ingresar_oferta) or isvalid(w_ingresar_funeraria) then 
	ls_base 				= trim(substr(1,1,Message.StringParm))
	ls_serie				= trim(substr(1,2,Message.StringParm))
	ll_numero			= Double(substr(1,3,Message.StringParm))
	SELECT	Count("DETALLE_PAGO_PIE"."MONTO_CUOTA")  
	INTO 		:ll_count_cuota  
	FROM 		"DETALLE_PAGO_PIE"  
	WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
			 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
			 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero ) AND
			 ( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )
	Using		sqlca;
	IF ll_count_cuota=0 or isnull(ll_count_cuota) THEN
		DELETE FROM "DETALLE_PAGO_PIE"  
		WHERE	( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
				( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
				( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
	END IF
	if isvalid(w_ingresar_oferta) then
		w_ingresar_oferta.dw_oferta_v.accepttext()
	elseif isvalid(w_ingresar_funeraria) then	
		w_ingresar_funeraria.dw_anexo_funeraria.accepttext()
	end if
end if
CloseWithReturn(w_mensaje_pie,'N')
end event

type cb_si from commandbutton within w_mensaje_pie
integer x = 146
integer y = 1600
integer width = 485
integer height = 156
integer taborder = 30
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Si"
end type

event clicked;CloseWithReturn(w_mensaje_pie,'S')
end event

type cb_cancelar from commandbutton within w_mensaje_pie
integer x = 1655
integer y = 1600
integer width = 686
integer height = 156
integer taborder = 20
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;String	ls_base,ls_serie
Double	ldb_pie,ldb_sum_cuota,ll_numero
Long		ll_nulo,ll_count_cuota
setnull(ll_nulo)
if isvalid(w_ingresar_oferta) or isvalid(w_ingresar_funeraria) then 
	ls_base 				= trim(substr(1,1,Message.StringParm))
	ls_serie				= trim(substr(1,2,Message.StringParm))
	ll_numero			= Double(substr(1,3,Message.StringParm))
	ldb_pie				= double(substr(1,4,Message.StringParm))
	SELECT	SUM("DETALLE_PAGO_PIE"."MONTO_CUOTA")  
	INTO 		:ldb_sum_cuota  
	FROM 		"DETALLE_PAGO_PIE"  
	WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
			 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
			 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero )   
	Using		sqlca;
	if ldb_sum_cuota>0 then
		if ldb_sum_cuota<>ldb_pie then
			SELECT	Count("DETALLE_PAGO_PIE"."MONTO_CUOTA")  
			INTO 		:ll_count_cuota  
			FROM 		"DETALLE_PAGO_PIE"  
			WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
					 ( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
					 ( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero ) AND
					 ( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )
			Using		sqlca;
			IF ll_count_cuota>0 THEN
				if isvalid(w_ingresar_oferta) then
					w_ingresar_oferta.dw_oferta_v.setitem(1,'pago_oferta_pie',ldb_sum_cuota)
				elseif isvalid(w_ingresar_funeraria) then
					w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_sum_cuota)
				end if
			else
				DELETE FROM "DETALLE_PAGO_PIE"  
				WHERE	( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
						( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
						( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			END IF
		else
			DELETE FROM "DETALLE_PAGO_PIE"  
			WHERE	( "DETALLE_PAGO_PIE"."BASE" = :ls_base ) AND  
					( "DETALLE_PAGO_PIE"."SERIE" = :ls_serie ) AND  
					( "DETALLE_PAGO_PIE"."NUMERO" = :ll_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		end if
	else
		if isvalid(w_ingresar_oferta) then
			w_ingresar_oferta.dw_oferta_v.accepttext()
			w_ingresar_oferta.cb_3.TriggerEvent(Clicked!)
		elseif isvalid(w_ingresar_funeraria) then
			w_ingresar_funeraria.dw_anexo_funeraria.accepttext()
			w_ingresar_funeraria.cb_3.TriggerEvent(Clicked!)
		end if
	end if
	if isvalid(w_ingresar_oferta) then
		w_ingresar_oferta.dw_oferta_v.accepttext()
	elseif isvalid(w_ingresar_funeraria) then
		w_ingresar_funeraria.dw_anexo_funeraria.accepttext()
	end if
end if
CloseWithReturn(w_mensaje_pie,'C')
end event

