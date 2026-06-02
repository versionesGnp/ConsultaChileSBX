forward
global type w_mensaje_cobranza_telefonica_ultimo from window
end type
type dw_datos_cliente from datawindow within w_mensaje_cobranza_telefonica_ultimo
end type
type mle_glosa from multilineedit within w_mensaje_cobranza_telefonica_ultimo
end type
type em_fecha_cob from editmask within w_mensaje_cobranza_telefonica_ultimo
end type
type em_usuario from editmask within w_mensaje_cobranza_telefonica_ultimo
end type
type em_estado_cob from editmask within w_mensaje_cobranza_telefonica_ultimo
end type
type st_33 from statictext within w_mensaje_cobranza_telefonica_ultimo
end type
type st_55 from statictext within w_mensaje_cobranza_telefonica_ultimo
end type
type st_11 from statictext within w_mensaje_cobranza_telefonica_ultimo
end type
type st_22 from statictext within w_mensaje_cobranza_telefonica_ultimo
end type
type st_5 from statictext within w_mensaje_cobranza_telefonica_ultimo
end type
type st_4 from statictext within w_mensaje_cobranza_telefonica_ultimo
end type
type st_3 from statictext within w_mensaje_cobranza_telefonica_ultimo
end type
type st_2 from statictext within w_mensaje_cobranza_telefonica_ultimo
end type
type st_1 from statictext within w_mensaje_cobranza_telefonica_ultimo
end type
type em_1 from editmask within w_mensaje_cobranza_telefonica_ultimo
end type
type cb_2 from commandbutton within w_mensaje_cobranza_telefonica_ultimo
end type
type cb_1 from commandbutton within w_mensaje_cobranza_telefonica_ultimo
end type
type ddlb_1 from dropdownlistbox within w_mensaje_cobranza_telefonica_ultimo
end type
type mle_1 from multilineedit within w_mensaje_cobranza_telefonica_ultimo
end type
type gb_1 from groupbox within w_mensaje_cobranza_telefonica_ultimo
end type
type gb_2 from groupbox within w_mensaje_cobranza_telefonica_ultimo
end type
type gb_11 from groupbox within w_mensaje_cobranza_telefonica_ultimo
end type
end forward

global type w_mensaje_cobranza_telefonica_ultimo from window
integer x = 837
integer y = 588
integer width = 2327
integer height = 2020
boolean titlebar = true
string title = "Cobranza Telefónica"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
dw_datos_cliente dw_datos_cliente
mle_glosa mle_glosa
em_fecha_cob em_fecha_cob
em_usuario em_usuario
em_estado_cob em_estado_cob
st_33 st_33
st_55 st_55
st_11 st_11
st_22 st_22
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
gb_1 gb_1
gb_2 gb_2
gb_11 gb_11
end type
global w_mensaje_cobranza_telefonica_ultimo w_mensaje_cobranza_telefonica_ultimo

type variables
string 	ls_estado,is_base,is_serie
Double	il_numero
end variables

on w_mensaje_cobranza_telefonica_ultimo.create
this.dw_datos_cliente=create dw_datos_cliente
this.mle_glosa=create mle_glosa
this.em_fecha_cob=create em_fecha_cob
this.em_usuario=create em_usuario
this.em_estado_cob=create em_estado_cob
this.st_33=create st_33
this.st_55=create st_55
this.st_11=create st_11
this.st_22=create st_22
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
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_11=create gb_11
this.Control[]={this.dw_datos_cliente,&
this.mle_glosa,&
this.em_fecha_cob,&
this.em_usuario,&
this.em_estado_cob,&
this.st_33,&
this.st_55,&
this.st_11,&
this.st_22,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.em_1,&
this.cb_2,&
this.cb_1,&
this.ddlb_1,&
this.mle_1,&
this.gb_1,&
this.gb_2,&
this.gb_11}
end on

on w_mensaje_cobranza_telefonica_ultimo.destroy
destroy(this.dw_datos_cliente)
destroy(this.mle_glosa)
destroy(this.em_fecha_cob)
destroy(this.em_usuario)
destroy(this.em_estado_cob)
destroy(this.st_33)
destroy(this.st_55)
destroy(this.st_11)
destroy(this.st_22)
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
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_11)
end on

event open;string 	ls_titulo,ls_base,ls_serie,ls_glosa,ls_estado_1,ls_sql,ls_estado_cob,ls_glosa_cob,&
			ls_estado_descrip,ls_usuario
datetime ldt_fecha_cob,ld_fecha_cob
long		ll_rut,i
Double	ll_numero

SetPointer(HourGlass!)
gf_centrar(w_mensaje_cobranza_telefonica)
dw_datos_cliente.settransobject(sqlca)
if gi_acceso < 3 AND gs_depto<>'I' then
	messagebox('No tiene Acceso','               ¡ Usted no tiene acceso !           ~n~nComuníquese con el Departamento de Informática.')
	close(w_mensaje_cobranza_telefonica)
else
	ls_sql 		= 'SELECT ESTADO_COBRANZA.COD_ESATDO, ESTADO_COBRANZA.GLOSA_ESTADO  FROM ESTADO_COBRANZA  '
	f_ddlb_all(ddlb_1,ls_sql)
	st_4.text 	= gs_user
	ls_base   	= substr(1,1,Message.StringParm)
	ls_serie  		= substr(1,2,Message.StringParm)
	ll_numero 	= Double(substr(1,3,Message.StringParm))
	ll_rut    		= long(substr(1,4,Message.StringParm))
	dw_datos_cliente.retrieve(ll_rut)
	SELECT	"TELE_LOG"."ESTADO",   
				"TELE_LOG"."FECHA",   
				"TELE_LOG"."GLOSA",
				"TELE_LOG"."USUARIO"
	INTO 		:ls_estado_cob,   
				:ld_fecha_cob,   
				:ls_glosa_cob,
				:ls_usuario
	FROM 		"CLIENTE",   
				"TELE_LOG"  
	WHERE  ( "CLIENTE"."RUT" = "TELE_LOG"."RUT" ) and  
			 (("CLIENTE"."RUT" = :ll_rut ) AND  
			 ( "TELE_LOG"."FECHA" = (SELECT MAX("TELE_LOG"."FECHA") FROM "TELE_LOG" WHERE "TELE_LOG"."RUT" = :ll_rut  ) ) )  
	USING		sqlca;
	if not isnull(ls_glosa_cob) and ls_glosa_cob<>'' then
		SELECT	"ESTADO_COBRANZA"."GLOSA_ESTADO"  
		INTO 		:ls_estado_descrip  
		FROM 		"ESTADO_COBRANZA"  
		WHERE 	"ESTADO_COBRANZA"."COD_ESATDO" = :ls_estado_cob   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			em_estado_cob.text	= ls_estado_cob+' - '+ls_estado_descrip
			em_usuario.text		= ls_usuario
			em_fecha_cob.text		= string(ld_fecha_cob,"dd/mm/yyyy hh:mm:ss")
			mle_glosa.text			= ls_glosa_cob
		else
			mle_glosa.text			= 'NO REGISTRA COBRANZA TELEFONICA'
		end if
	else
		mle_glosa.text				= 'NO REGISTRA COBRANZA TELEFONICA'
	end if
	is_base   						= ls_base
	is_serie  							= ls_serie
	il_numero 						= ll_numero
	CHOOSE CASE ls_base
		CASE 'O'
			ls_titulo 				= 'Promesa N° : '
		CASE 'U'
			ls_titulo 				= 'Columbario N° : '
		CASE 'L'
			ls_titulo 				= 'Liberador N° : '
		CASE 'C'
			ls_titulo 				= 'Contrato N° : '
		CASE 'D'
			ls_titulo 				= 'Derecho N° : '
		CASE 'P'
			ls_titulo 				= 'Pagare N° : '
	END CHOOSE
	this.title						= ls_titulo+ls_base+' - '+ls_serie+' - '+string(ll_numero,'###,###,###,###')
	SELECT DISTINCT sysdate  into :ldt_fecha_cob FROM AGENTES ;
	em_1.text						= string(ldt_fecha_cob)
	for i = 1 to ddlb_1.TotalItems( )
		ls_estado_1					= mid(ddlb_1.text(i),1,pos(ddlb_1.text(i),'-')-2)
		if ls_estado_1 			= ls_estado then
			ddlb_1.SelectItem(i)
			exit
		end if
	next
end if
SetPointer(Arrow!)
end event

type dw_datos_cliente from datawindow within w_mensaje_cobranza_telefonica_ultimo
integer x = 78
integer y = 100
integer width = 2171
integer height = 360
string dataobject = "dw_datos_del_cliente"
boolean border = false
boolean livescroll = true
end type

type mle_glosa from multilineedit within w_mensaje_cobranza_telefonica_ultimo
integer x = 82
integer y = 852
integer width = 2144
integer height = 204
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type em_fecha_cob from editmask within w_mensaje_cobranza_telefonica_ultimo
integer x = 960
integer y = 660
integer width = 695
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm:ss"
end type

type em_usuario from editmask within w_mensaje_cobranza_telefonica_ultimo
integer x = 1659
integer y = 660
integer width = 562
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type em_estado_cob from editmask within w_mensaje_cobranza_telefonica_ultimo
integer x = 87
integer y = 660
integer width = 869
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type st_33 from statictext within w_mensaje_cobranza_telefonica_ultimo
integer x = 960
integer y = 584
integer width = 695
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "Fecha de Cobranza"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_55 from statictext within w_mensaje_cobranza_telefonica_ultimo
integer x = 1659
integer y = 584
integer width = 562
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "Usuario"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_11 from statictext within w_mensaje_cobranza_telefonica_ultimo
integer x = 82
integer y = 772
integer width = 2144
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "Observación"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_22 from statictext within w_mensaje_cobranza_telefonica_ultimo
integer x = 87
integer y = 584
integer width = 869
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "Estados de Cobranza"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_mensaje_cobranza_telefonica_ultimo
integer x = 1659
integer y = 1240
integer width = 562
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

type st_4 from statictext within w_mensaje_cobranza_telefonica_ultimo
integer x = 1659
integer y = 1316
integer width = 562
integer height = 92
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
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

type st_3 from statictext within w_mensaje_cobranza_telefonica_ultimo
integer x = 960
integer y = 1240
integer width = 695
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
boolean enabled = false
string text = "Fecha de Cobranza"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mensaje_cobranza_telefonica_ultimo
integer x = 87
integer y = 1240
integer width = 869
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
boolean enabled = false
string text = "Estados de Cobranza"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_mensaje_cobranza_telefonica_ultimo
integer x = 82
integer y = 1432
integer width = 2144
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

type em_1 from editmask within w_mensaje_cobranza_telefonica_ultimo
integer x = 960
integer y = 1316
integer width = 695
integer height = 92
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
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

type cb_2 from commandbutton within w_mensaje_cobranza_telefonica_ultimo
integer x = 32
integer y = 1784
integer width = 302
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
string 	ls_usuario
datetime ldt_fecha

ll_rut    			= long(substr(1,4,Message.StringParm))
ll_ret 				= messagebox('Actulizar','Desea actualizar los datos',Question!,YesNo!,2)
if ll_ret = 1 then
	SELECT DISTINCT sysdate  
	INTO 		:ldt_fecha  
	FROM 		"AGENTES"  ;
	ls_estado	= trim(mid(ddlb_1.text,1,2))
	UPDATE	"CLIENTE"  
	SET 		"ESTADO_COBRANZA" = :ls_estado,   
		 		"FECHA_COBRANZA"  = :ldt_fecha,   
		 		"GLOSA_COBRANZA"  = :mle_1.text,  
		 		"USUARIO"         = :gs_user 
	WHERE 	"CLIENTE"."RUT" = :ll_rut   
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		commit;
	   	INSERT INTO "TELE_LOG"  
             ( "RUT"  ,"ESTADO"  ,"FECHA"   ,"GLOSA"    ,"USUARIO"  ,"BASE"  ,"SERIE"  ,"NUMERO" )  
		VALUES ( :ll_rut,:ls_estado,:ldt_fecha,:mle_1.text,:gs_user	  ,:is_base,:is_serie,:il_numero)  ;
		if sqlca.sqlcode = 0 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			CloseWithReturn(w_mensaje_cobranza_telefonica, trim(ddlb_1.Text))
			if isvalid(w_cobranza_historica) then
				w_cobranza_historica.tab_1.tabpage_2.dw_cob_tele.retrieve (gi_rut)
			end if
		else
			messagebox('Error2','Error al Grabar '+sqlca.SQLErrText,information!)
			ROLLBACK;
		end if
	else
		messagebox('Error1','Error al Grabar '+sqlca.SQLErrText,information!)
		ROLLBACK;
	end if
end if
end event

type cb_1 from commandbutton within w_mensaje_cobranza_telefonica_ultimo
integer x = 1979
integer y = 1784
integer width = 302
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;ls_estado	= ''
CloseWithReturn(w_mensaje_cobranza_telefonica, trim(ls_estado))
end event

type ddlb_1 from dropdownlistbox within w_mensaje_cobranza_telefonica_ultimo
integer x = 87
integer y = 1316
integer width = 869
integer height = 640
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_mensaje_cobranza_telefonica_ultimo
integer x = 82
integer y = 1508
integer width = 2144
integer height = 204
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
textcase textcase = upper!
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_mensaje_cobranza_telefonica_ultimo
integer x = 32
integer y = 1136
integer width = 2249
integer height = 616
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Nueva Gestión Telefónica"
end type

type gb_2 from groupbox within w_mensaje_cobranza_telefonica_ultimo
integer x = 32
integer y = 36
integer width = 2249
integer height = 440
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Antecedentes del Cliente"
end type

type gb_11 from groupbox within w_mensaje_cobranza_telefonica_ultimo
integer x = 32
integer y = 496
integer width = 2249
integer height = 616
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Ultima Gestión Telefónica"
end type

