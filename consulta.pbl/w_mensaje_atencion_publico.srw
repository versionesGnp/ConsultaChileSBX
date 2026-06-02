forward
global type w_mensaje_atencion_publico from window
end type
type st_5 from statictext within w_mensaje_atencion_publico
end type
type st_4 from statictext within w_mensaje_atencion_publico
end type
type st_3 from statictext within w_mensaje_atencion_publico
end type
type st_2 from statictext within w_mensaje_atencion_publico
end type
type st_1 from statictext within w_mensaje_atencion_publico
end type
type em_1 from editmask within w_mensaje_atencion_publico
end type
type cb_2 from commandbutton within w_mensaje_atencion_publico
end type
type cb_1 from commandbutton within w_mensaje_atencion_publico
end type
type ddlb_1 from dropdownlistbox within w_mensaje_atencion_publico
end type
type mle_1 from multilineedit within w_mensaje_atencion_publico
end type
end forward

global type w_mensaje_atencion_publico from window
integer x = 837
integer y = 588
integer width = 1920
integer height = 848
boolean titlebar = true
string title = "Atención Público"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
em_1 em_1
cb_2 cb_2
cb_1 cb_1
ddlb_1 ddlb_1
mle_1 mle_1
end type
global w_mensaje_atencion_publico w_mensaje_atencion_publico

type variables
integer 	ii_i
string 	ls_estado
end variables

on w_mensaje_atencion_publico.create
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.em_1=create em_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ddlb_1=create ddlb_1
this.mle_1=create mle_1
this.Control[]={this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.em_1,&
this.cb_2,&
this.cb_1,&
this.ddlb_1,&
this.mle_1}
end on

on w_mensaje_atencion_publico.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ddlb_1)
destroy(this.mle_1)
end on

event open;string 	ls_titulo,ls_base,ls_serie,ls_glosa,ls_estado_1,ls_sql
datetime ldt_fecha_cob
long 		ll_rut,i
Double	ll_numero

//if integer(gs_acceso) < 3 then
//	messagebox('No tiene Acceso','               ¡ Usted no tiene acceso !           ~n~nComuníquese con el Departamento de Informática.')
//	close(w_mensaje_cobranza_telefonica)
//else
	ls_sql 			= 'SELECT ESTADO_ATENCION.COD_ESATDO, ESTADO_ATENCION.GLOSA_ESTADO FROM ESTADO_ATENCION WHERE ESTADO_ATENCION.TIPO_COBRANZA IS null ORDER BY ESTADO_ATENCION.COD_ESATDO ASC'
	f_ddlb1_all(ddlb_1,ls_sql)
	st_4.text 			= gs_user
	ls_base   		= gs_base
	ls_serie  			= gs_serie
	ll_numero 		= gi_numero
	ll_rut    			= gi_rut
	CHOOSE CASE ls_base
		CASE 'O'
			ls_titulo 	= 'Promesa N° : '
		CASE 'U'
			ls_titulo 	= 'Columbario N° : '
		CASE 'L'
			ls_titulo 	= 'Liberador N° : '
		CASE 'C'
			ls_titulo 	= 'Contrato N° : '
		CASE 'D'
			ls_titulo 	= 'Derecho N° : '
		CASE 'P'
			ls_titulo	= 'Pagare N° : '
		CASE 'F'
			ls_titulo 	= 'Producto N° : '
		CASE 'R' 
			ls_titulo 	= 'Reprog.Mant. N° : '
		CASE 'A'
			ls_titulo 	= 'Aumento Cap. N° : '
	END CHOOSE
	
	this.title 			= ls_titulo+ls_base+' - '+ls_serie+' - '+string(ll_numero,'###,###,###,###')
//	SELECT "CLIENTE"."ESTADO_COBRANZA","CLIENTE"."FECHA_COBRANZA","CLIENTE"."GLOSA_COBRANZA"  
//		 INTO :ls_estado               ,:ldt_fecha_cob            ,:ls_glosa  
//		 FROM "CLIENTE"  
//		WHERE "CLIENTE"."RUT" = :ll_rut   ;
//	if not isnull(ldt_fecha_cob) then
//		em_1.text = string (ldt_fecha_cob)
//		mle_1.text = ls_glosa
//	else
	  SELECT DISTINCT sysdate  into :ldt_fecha_cob FROM AGENTES ;
	  em_1.text 	= string(ldt_fecha_cob)
//	end if
//	for i = 1 to ddlb_1.TotalItems( )
//		ls_estado_1 = mid(ddlb_1.text(i),1,pos(ddlb_1.text(i),'-')-2)
//		if ls_estado_1 = ls_estado then
			ddlb_1.SelectItem(1)
//			exit
//		end if
//	next
	gf_centrar(w_mensaje_atencion_publico)
	mle_1.text 	= ' '
//end if
end event

type st_5 from statictext within w_mensaje_atencion_publico
integer x = 901
integer y = 44
integer width = 375
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
boolean enabled = false
string text = "Usuario"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_mensaje_atencion_publico
integer x = 901
integer y = 120
integer width = 375
integer height = 84
integer textsize = -8
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

type st_3 from statictext within w_mensaje_atencion_publico
integer x = 1289
integer y = 44
integer width = 576
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
boolean enabled = false
string text = "Fecha de Atención"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mensaje_atencion_publico
integer x = 41
integer y = 44
integer width = 850
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
boolean enabled = false
string text = "Estados de Atención"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_mensaje_atencion_publico
integer x = 41
integer y = 236
integer width = 1824
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
boolean enabled = false
string text = "Observación"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_mensaje_atencion_publico
integer x = 1289
integer y = 120
integer width = 576
integer height = 84
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
string displaydata = ""
end type

type cb_2 from commandbutton within w_mensaje_atencion_publico
integer x = 41
integer y = 584
integer width = 261
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long 		ll_ret,ll_rut
string 	ls_glosa

ll_rut    			= gi_rut
ls_glosa			= trim(mle_1.text)
ll_ret 				= messagebox('Actulizar','¿ Desea actualizar los datos ?',Question!,YesNo!,1)
if ll_ret = 1 then
	ls_estado 	= trim(mid(ddlb_1.text,1,2))
	SELECT	sysdate
	INTO 		:gdt_fec_sistema
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
	USING	sqlca;
	
	INSERT INTO "ATENCION_LOG"  
					( "RUT"  ,	"ESTADO"  ,"FECHA"  ,			"GLOSA"    ,"USUARIO" ,	"BASE"  ,"SERIE"  ,	"NUMERO" )  
	VALUES 		( :ll_rut,		:ls_estado,	:gdt_fec_sistema,	:ls_glosa,	:gs_user,	:gs_base,:gs_serie,	:gi_numero)  ;
	if sqlca.sqlcode <> 0 then
		messagebox('Error','Error al Grabar '+sqlca.SQLErrText,information!)
		ROLLBACK;
	else
		commit;
		messagebox("Grabar","Grabación Exitosa")
		UPDATE	"CLIENTE"  
		SET 		"ULT_ESTADO_PUB" = :ls_estado,   
					"ULT_GLOSA_PUB" = :ls_glosa,   
					"ULT_FECHA_PUB" = :gdt_fec_sistema  
		WHERE 	"CLIENTE"."RUT" = :ll_rut   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		if isvalid(w_cobranza_historica) then 
			w_cobranza_historica.tab_1.tabpage_3.dw_at_pub.retrieve (gs_base,gs_serie,gi_numero)
		end if
	end if
	ii_i = 0
	close(w_mensaje_atencion_publico)
else
	ii_i ++
end if
end event

type cb_1 from commandbutton within w_mensaje_atencion_publico
integer x = 1563
integer y = 584
integer width = 302
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;string ls_usuario
long ll_ret,ll_rut
datetime ld_fecha

ll_rut 		= gi_rut
ld_fecha 	= datetime(em_1.text)
ls_usuario 	= st_4.text
if ii_i > 0 then
	ll_ret 	= messagebox('Actulizar','¿ Desea actualizar los datos ?',Question!,YesNoCancel!,3)
	if ll_ret = 1 then
		SELECT DISTINCT sysdate  
		INTO :ld_fecha  
		FROM "AGENTES"  ;
		ls_estado = trim(mid(ddlb_1.text,1,2))
	   INSERT INTO "ATENCION_LOG"  
					( "RUT"  ,"ESTADO"  ,"FECHA"  ,"GLOSA"    ,"USUARIO" ,"BASE"  ,"SERIE"  ,"NUMERO" )  
		VALUES ( :ll_rut,:ls_estado,:ld_fecha,:mle_1.text,:ls_usuario,:gs_base,:gs_serie,:gi_numero)  ;
		if sqlca.sqlcode <> 0 then
			messagebox('Error','Error al Grabar '+sqlca.SQLErrText,information!)
			ROLLBACK;
		else
			commit;
		end if
		if isvalid(w_cobranza_historica) then
			close(w_mensaje_atencion_publico)
		else
			CloseWithReturn(w_mensaje_atencion_publico, trim(ddlb_1.Text))
		end if
	elseif ll_ret = 2 then
		if isvalid(w_cobranza_historica) then
			close(w_mensaje_atencion_publico)
		else
			CloseWithReturn(w_mensaje_atencion_publico, trim(ls_estado))
		end if
	end if
else
	if isvalid(w_cobranza_historica) then
		close(w_mensaje_atencion_publico)
	else
		CloseWithReturn(w_mensaje_atencion_publico, trim(ls_estado))
	end if
end if
end event

type ddlb_1 from dropdownlistbox within w_mensaje_atencion_publico
integer x = 41
integer y = 120
integer width = 850
integer height = 640
integer taborder = 20
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_i ++
end event

type mle_1 from multilineedit within w_mensaje_atencion_publico
integer x = 41
integer y = 312
integer width = 1824
integer height = 204
integer taborder = 10
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
textcase textcase = upper!
integer limit = 500
borderstyle borderstyle = stylelowered!
end type

event modified;ii_i ++
end event

