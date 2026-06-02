forward
global type w_encuenta_atc from window
end type
type cb_beneficiarios from commandbutton within w_encuenta_atc
end type
type pb_estado_titular from picturebutton within w_encuenta_atc
end type
type cb_imprimir from commandbutton within w_encuenta_atc
end type
type dw_impresion from datawindow within w_encuenta_atc
end type
type cb_anula from commandbutton within w_encuenta_atc
end type
type dw_evalua from datawindow within w_encuenta_atc
end type
type cb_grabar from commandbutton within w_encuenta_atc
end type
type cb_cerrar from commandbutton within w_encuenta_atc
end type
type dw_encuesta from datawindow within w_encuenta_atc
end type
type dw_carga from datawindow within w_encuenta_atc
end type
end forward

global type w_encuenta_atc from window
integer width = 3237
integer height = 2772
boolean titlebar = true
string title = "Ingreso Encuesta"
long backcolor = 67108864
cb_beneficiarios cb_beneficiarios
pb_estado_titular pb_estado_titular
cb_imprimir cb_imprimir
dw_impresion dw_impresion
cb_anula cb_anula
dw_evalua dw_evalua
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_encuesta dw_encuesta
dw_carga dw_carga
end type
global w_encuenta_atc w_encuenta_atc

type variables
long il_row,il_rut_falle
end variables

forward prototypes
public subroutine wf_carga_nota (string as_columna)
public subroutine wf_carga_datos (long al_folio)
end prototypes

public subroutine wf_carga_nota (string as_columna);long	ll_nulo

//wf_carga_nota(as_columna)
setnull(ll_nulo)
if as_columna='nota1' then
	dw_evalua.setitem(il_row,'nota0',ll_nulo)	
	dw_evalua.setitem(il_row,'nota1',1)
	dw_evalua.setitem(il_row,'puntos',1)
	dw_evalua.setitem(il_row,'nota2',ll_nulo)
	dw_evalua.setitem(il_row,'nota3',ll_nulo)
	dw_evalua.setitem(il_row,'nota4',ll_nulo)
	dw_evalua.setitem(il_row,'nota5',ll_nulo)
	dw_evalua.setitem(il_row,'nota6',ll_nulo)
	dw_evalua.setitem(il_row,'nota7',ll_nulo)
elseif as_columna='nota2' then
	dw_evalua.setitem(il_row,'nota0',ll_nulo)	
	dw_evalua.setitem(il_row,'nota1',ll_nulo)
	dw_evalua.setitem(il_row,'nota2',2)
	dw_evalua.setitem(il_row,'puntos',2)
	dw_evalua.setitem(il_row,'nota3',ll_nulo)
	dw_evalua.setitem(il_row,'nota4',ll_nulo)
	dw_evalua.setitem(il_row,'nota5',ll_nulo)
	dw_evalua.setitem(il_row,'nota6',ll_nulo)
	dw_evalua.setitem(il_row,'nota7',ll_nulo)
elseif as_columna='nota3' then
	dw_evalua.setitem(il_row,'nota0',ll_nulo)	
	dw_evalua.setitem(il_row,'nota1',ll_nulo)
	dw_evalua.setitem(il_row,'nota2',ll_nulo)
	dw_evalua.setitem(il_row,'nota3',3)
	dw_evalua.setitem(il_row,'puntos',3)
	dw_evalua.setitem(il_row,'nota4',ll_nulo)
	dw_evalua.setitem(il_row,'nota5',ll_nulo)
	dw_evalua.setitem(il_row,'nota6',ll_nulo)
	dw_evalua.setitem(il_row,'nota7',ll_nulo)	
elseif as_columna='nota4' then
	dw_evalua.setitem(il_row,'nota0',ll_nulo)
	dw_evalua.setitem(il_row,'nota1',ll_nulo)
	dw_evalua.setitem(il_row,'nota2',ll_nulo)
	dw_evalua.setitem(il_row,'nota3',ll_nulo)
	dw_evalua.setitem(il_row,'nota4',4)
	dw_evalua.setitem(il_row,'puntos',4)
	dw_evalua.setitem(il_row,'nota5',ll_nulo)
	dw_evalua.setitem(il_row,'nota6',ll_nulo)
	dw_evalua.setitem(il_row,'nota7',ll_nulo)
elseif as_columna='nota5' then
	dw_evalua.setitem(il_row,'nota0',ll_nulo)
	dw_evalua.setitem(il_row,'nota1',ll_nulo)
	dw_evalua.setitem(il_row,'nota2',ll_nulo)
	dw_evalua.setitem(il_row,'nota3',ll_nulo)
	dw_evalua.setitem(il_row,'nota4',ll_nulo)
	dw_evalua.setitem(il_row,'nota5',5)
	dw_evalua.setitem(il_row,'puntos',5)
	dw_evalua.setitem(il_row,'nota6',ll_nulo)
	dw_evalua.setitem(il_row,'nota7',ll_nulo)
elseif as_columna='nota6' then
	dw_evalua.setitem(il_row,'nota0',ll_nulo)
	dw_evalua.setitem(il_row,'nota1',ll_nulo)
	dw_evalua.setitem(il_row,'nota2',ll_nulo)
	dw_evalua.setitem(il_row,'nota3',ll_nulo)
	dw_evalua.setitem(il_row,'nota4',ll_nulo)
	dw_evalua.setitem(il_row,'nota5',ll_nulo)
	dw_evalua.setitem(il_row,'nota6',6)
	dw_evalua.setitem(il_row,'puntos',6)
	dw_evalua.setitem(il_row,'nota7',ll_nulo)	
elseif as_columna='nota7' then
	dw_evalua.setitem(il_row,'nota0',ll_nulo)
	dw_evalua.setitem(il_row,'nota1',ll_nulo)
	dw_evalua.setitem(il_row,'nota2',ll_nulo)
	dw_evalua.setitem(il_row,'nota3',ll_nulo)
	dw_evalua.setitem(il_row,'nota4',ll_nulo)
	dw_evalua.setitem(il_row,'nota5',ll_nulo)
	dw_evalua.setitem(il_row,'nota6',ll_nulo)
	dw_evalua.setitem(il_row,'nota7',7)
	dw_evalua.setitem(il_row,'puntos',7)
elseif as_columna='nota0' then
	dw_evalua.setitem(il_row,'nota0',1)	
	dw_evalua.setitem(il_row,'nota1',ll_nulo)
	dw_evalua.setitem(il_row,'nota2',ll_nulo)
	dw_evalua.setitem(il_row,'nota3',ll_nulo)
	dw_evalua.setitem(il_row,'nota4',ll_nulo)
	dw_evalua.setitem(il_row,'nota5',ll_nulo)
	dw_evalua.setitem(il_row,'nota6',ll_nulo)
	dw_evalua.setitem(il_row,'nota7',ll_nulo)
	dw_evalua.setitem(il_row,'puntos',ll_nulo)	
end if
dw_evalua.accepttext()
end subroutine

public subroutine wf_carga_datos (long al_folio);long	ll_tot_reg,ll_cod_encu,ll_ptos,ll_indi,ll_nulo,ll_cod,ll_cta

//wf_carga_datos(al_folio)
setnull(ll_nulo)
ll_tot_reg							= dw_evalua.retrieve()
if al_folio>0 then
	dw_carga.retrieve(al_folio)
	SELECT 		count("FOLIO") 
	INTO			:ll_cta
  	FROM			"ENCUESTA_EVALUACION"  
   	WHERE		"ENCUESTA_EVALUACION"."FOLIO" = :al_folio AND  
         			"ENCUESTA_EVALUACION"."ESTADO" = 'V'
	USING		sqlca;
	if isnull(ll_cta) then ll_cta=0
	if ll_cta=0 then
		dw_evalua.enabled		= false
		for	ll_indi=1 to ll_tot_reg
			dw_evalua.setitem(ll_indi,'nota0',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota1',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota2',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota3',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota4',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota5',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota6',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota7',ll_nulo)
			dw_evalua.accepttext()
		next
	else
		cb_grabar.enabled							= false
		dw_carga.enabled							= false
		DECLARE x1 CURSOR FOR
		SELECT 		"COD_ENCUESTA","PUNTOS"  
		FROM			"ENCUESTA_EVALUACION"  
		WHERE		"ENCUESTA_EVALUACION"."FOLIO" = :al_folio AND  
						"ENCUESTA_EVALUACION"."ESTADO" = 'V'
		ORDER BY 	"COD_ENCUESTA" ASC
		USING		sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
			fetch x1 INTO	:ll_cod_encu,:ll_ptos;
				if not isnull(ll_cod_encu) and ll_cod_encu>0 /*and not isnull(ll_ptos) and ll_ptos>0*/ then
					for	ll_indi=1 to ll_tot_reg
						ll_cod							= dw_evalua.getitemnumber(ll_indi,'cod_encuesta')
						if ll_cod=ll_cod_encu then
//							if ll_ptos=0 then
							if isnull(ll_ptos) then
								dw_evalua.setitem(ll_indi,'nota0',1)
								dw_evalua.setitem(ll_indi,'nota1',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota2',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota3',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota4',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota5',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota6',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota7',ll_nulo)
							elseif ll_ptos=1 then
//							if ll_ptos=1 then	
								dw_evalua.setitem(ll_indi,'nota0',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota1',ll_ptos)
								dw_evalua.setitem(ll_indi,'nota2',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota3',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota4',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota5',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota6',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota7',ll_nulo)
							elseif ll_ptos=2 then
								dw_evalua.setitem(ll_indi,'nota0',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota1',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota2',ll_ptos)
								dw_evalua.setitem(ll_indi,'nota3',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota4',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota5',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota6',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota7',ll_nulo)
							elseif ll_ptos=3 then
								dw_evalua.setitem(ll_indi,'nota0',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota1',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota2',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota3',ll_ptos)
								dw_evalua.setitem(ll_indi,'nota4',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota5',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota6',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota7',ll_nulo)
							elseif ll_ptos=4 then
								dw_evalua.setitem(ll_indi,'nota0',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota1',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota2',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota3',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota4',ll_ptos)
								dw_evalua.setitem(ll_indi,'nota5',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota6',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota7',ll_nulo)
							elseif ll_ptos=5 then
								dw_evalua.setitem(ll_indi,'nota0',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota1',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota2',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota3',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota4',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota5',ll_ptos)
								dw_evalua.setitem(ll_indi,'nota6',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota7',ll_nulo)
							elseif ll_ptos=6 then
								dw_evalua.setitem(ll_indi,'nota0',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota1',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota2',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota3',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota4',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota5',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota6',ll_ptos)
								dw_evalua.setitem(ll_indi,'nota7',ll_nulo)
							elseif ll_ptos=7 then
								dw_evalua.setitem(ll_indi,'nota0',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota1',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota2',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota3',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota4',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota5',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota6',ll_nulo)
								dw_evalua.setitem(ll_indi,'nota7',ll_ptos)
							end if
							dw_evalua.accepttext()
							dw_evalua.enabled	= false 
						end if
					next
				end if
				setnull(ll_cod_encu);setnull(ll_ptos)
			LOOP
		end if
		close x1;
	end if
else
	if ll_tot_reg>0 then
		for	ll_indi=1 to ll_tot_reg
			dw_evalua.setitem(ll_indi,'nota0',1)
			dw_evalua.setitem(ll_indi,'nota1',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota2',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota3',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota4',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota5',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota6',ll_nulo)
			dw_evalua.setitem(ll_indi,'nota7',ll_nulo)
			dw_evalua.accepttext()
		next
		dw_carga.insertrow(0)
	end if
end if
end subroutine

on w_encuenta_atc.create
this.cb_beneficiarios=create cb_beneficiarios
this.pb_estado_titular=create pb_estado_titular
this.cb_imprimir=create cb_imprimir
this.dw_impresion=create dw_impresion
this.cb_anula=create cb_anula
this.dw_evalua=create dw_evalua
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_encuesta=create dw_encuesta
this.dw_carga=create dw_carga
this.Control[]={this.cb_beneficiarios,&
this.pb_estado_titular,&
this.cb_imprimir,&
this.dw_impresion,&
this.cb_anula,&
this.dw_evalua,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_encuesta,&
this.dw_carga}
end on

on w_encuenta_atc.destroy
destroy(this.cb_beneficiarios)
destroy(this.pb_estado_titular)
destroy(this.cb_imprimir)
destroy(this.dw_impresion)
destroy(this.cb_anula)
destroy(this.dw_evalua)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_encuesta)
destroy(this.dw_carga)
end on

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

event open;string		ls_base,ls_serie,ls_estado_titular,ls_dv_falle,ls_sector,ls_sepultura,ll_parque,ls_time
long		ll_folio,ll_tot_reg,ll_impr,ll_grupo,ll_correl,ll_folio_valida,ll_rut_falle,ll_rut_cont= 0,ll_hora,ll_minutos
double	ldb_numero
datetime	ldt_fec_sep

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_encuenta_atc)
dw_evalua.settransobject(sqlca)
dw_encuesta.settransobject(sqlca)
dw_carga.settransobject(sqlca)
dw_impresion.settransobject(sqlca)
ls_base									= substr(1,1,Message.StringParm)
ls_serie									= substr(1,2,Message.StringParm)
ldb_numero								= double(substr(1,3,Message.StringParm))
ldt_fec_sep								= datetime(date(substr(1,4,Message.StringParm)))	
ll_grupo									= long(substr(1,5,Message.StringParm))
ll_correl									= long(substr(1,6,Message.StringParm)) 
ll_folio									= long(substr(1,7,Message.StringParm))
ll_rut_falle								= long(substr(1,8,Message.StringParm))
il_rut_falle								= ll_rut_falle
if ls_base = 'F' then
	ls_time									= substr(1,9,Message.StringParm)
//	ll_minutos								= long(substr(1,10,Message.StringParm))
//	ls_time									= string(string(ll_hora)+':'+string(ll_minutos)+':00')
//	ldt_fec_sep								= datetime(date(ldt_fec_sep),time(ls_time))
end if	
if ll_grupo = 0 then
	if ls_base = 'F' then
		dw_evalua.dataobject = 'dw_encuesta_evalua_fune'
		dw_evalua.settransobject(sqlca)
	else	
		dw_evalua.dataobject = 'dw_encuesta_evalua_ficha'
		dw_evalua.settransobject(sqlca)
	end if	
end if	

if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
	ll_tot_reg							= dw_encuesta.retrieve(ls_base,ls_serie,ldb_numero,ldt_fec_sep,ll_grupo,ll_correl)
	//-- Estado Titular
		SELECT 	"CLIENTE"."ESTADO_TITULAR"
		INTO		:ls_estado_titular
		FROM		"CLIENTE","CADENA"  
		WHERE	"CLIENTE"."RUT" = "CADENA"."RUT" and  
					"CADENA"."CODIGO" = :ls_base AND  
					"CADENA"."SERIE" = :ls_serie AND  
					"CADENA"."NUMERO" = :ldb_numero  
		USING	sqlca;
		if ls_estado_titular = '1' then
			pb_estado_titular.visible = true
		else
			pb_estado_titular.visible = false
		end if	
	//-- fin	
//	ll_folio_valida							= dw_encuesta.getitemnumber(1,'folio_encuesta')
//	if ll_folio_valida > 0 or not isnull(ll_folio_valida) then
//		
//	end if	
	if ll_tot_reg>0 then
		wf_carga_datos(ll_folio)
		if ll_folio>0 then
			ll_impr						= dw_impresion.retrieve(ll_folio)
			if ll_impr>0 then
				cb_imprimir.enabled	= true
				//-- grabado de registro tomado --
				if ll_rut_falle > 0	 then
					SELECT "FICHA_SEPULTACION"."DV_FALLECIDO",   
						"FICHA_SEPULTACION"."SECTOR",   
						"FICHA_SEPULTACION"."SEPULTURA",   
						"FICHA_SEPULTACION"."COD_PARQUE"  
					INTO :ls_dv_falle, :ls_sector, :ls_sepultura, :ll_parque  
					FROM "FICHA_SEPULTACION"  
					WHERE "FICHA_SEPULTACION"."RUT_FALLECIDO" = :ll_rut_falle
					USING sqlca;
					if not isnull(ll_rut_falle)  then //and not isnull(ls_dv_falle) then
						SELECT 	count("ENCUESTA_CONTROL_GESTION"."RUT_FALLECIDO")
						INTO 		:ll_rut_cont
						FROM 	"ENCUESTA_CONTROL_GESTION"  
						WHERE	"ENCUESTA_CONTROL_GESTION"."RUT_FALLECIDO" = :ll_rut_falle
						USING	sqlca;
						if ll_rut_cont = 0 then
							INSERT INTO "ENCUESTA_CONTROL_GESTION"  
										( "RUT_FALLECIDO", "DV_FALLECIDO", "PARQUE", "SECTOR", "SEPULTURA", "ESTADO_GESTION", "USUARIO_GESTOR" )  
							VALUES ( :ll_rut_falle,  :ls_dv_falle, :ll_parque, :ls_sector,  :ls_sepultura , 'C',  :gs_user )
							USING sqlca;
						else	
							UPDATE	"ENCUESTA_CONTROL_GESTION"
							SET		"RUT_FALLECIDO" = :ll_rut_falle ,
										"DV_FALLECIDO" = :ls_dv_falle ,
										"PARQUE" = :ll_parque ,
										"SECTOR" = :ls_sector ,
										"SEPULTURA" = :ls_sepultura ,
										"ESTADO_GESTION" = 'L',
										"USUARIO_GESTOR"  = :gs_user
							WHERE	"ENCUESTA_CONTROL_GESTION"."RUT_FALLECIDO" = :il_rut_falle
							USING	sqlca;
							if sqlca.sqlcode = 0 then
								commit using sqlca;
							else
								rollback using sqlca;
							end if
						end if	
					else
						messagebox("Advertencia","No Guardo Registro Encuesta no Quedo Protegida")
					end if
				end if 
				//--
			else
				cb_imprimir.enabled	= false
				messagebox("Advertencia","No Registra Folio Para Impresión")
			end if
		else
			if ll_rut_falle > 0	 then
				SELECT "FICHA_SEPULTACION"."DV_FALLECIDO",   
							"FICHA_SEPULTACION"."SECTOR",   
							"FICHA_SEPULTACION"."SEPULTURA",   
							"FICHA_SEPULTACION"."COD_PARQUE"  
						INTO :ls_dv_falle, :ls_sector, :ls_sepultura, :ll_parque  
						FROM "FICHA_SEPULTACION"  
						WHERE "FICHA_SEPULTACION"."RUT_FALLECIDO" = :ll_rut_falle
						USING sqlca;
				if not isnull(ll_rut_falle)  then //and not isnull(ls_dv_falle) then
					INSERT INTO "ENCUESTA_CONTROL_GESTION"  
								( "RUT_FALLECIDO", "DV_FALLECIDO", "PARQUE", "SECTOR", "SEPULTURA", "ESTADO_GESTION", "USUARIO_GESTOR" )  
					VALUES ( :ll_rut_falle,  :ls_dv_falle, :ll_parque, :ls_sector,  :ls_sepultura , 'C',  :gs_user )
					USING sqlca;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
					else
						rollback using sqlca;
					end if
				else
					messagebox("Advertencia","No Guardo Registro Encuesta no Quedo Protegida")
				end if	
			end if	
		end if
	else
		messagebox("Advertencia","No Registra Datos")
		close(w_encuenta_atc)
	end if
end if
end event

type cb_beneficiarios from commandbutton within w_encuenta_atc
integer x = 1979
integer y = 2536
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Beneficiarios"
end type

event clicked;string ls_base,ls_serie,ls_string
double	ll_numero

if dw_encuesta.rowcount()>0 then
	ls_base 									= dw_encuesta.GetItemString(1,"codigo")
	ls_serie 									= dw_encuesta.GetItemString(1,"serie")
	ll_numero 								= dw_encuesta.GetItemNumber(1,"numero")
	if not isnull(ls_base) and ll_numero>0 then
//		dw_1.visible 						= false
		CHOOSE CASE ls_base
			CASE "O" // Oferta
				if isvalid(w_listado_beneficiarios) then close(w_listado_beneficiarios)
					ls_string	=  ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
					Openwithparm(w_listado_beneficiarios_encuesta,ls_string)
			CASE "C" // ISACRUZ
				if isvalid(w_listado_beneficiarios2) then close(w_listado_beneficiarios2)
					ls_string	=  ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
					Openwithparm(w_listado_beneficiarios2_encuesta,ls_string)
			CASE ELSE
				messagebox("Advertencia","Solo Promesas y Contrato IsaCruz tienen Beneficiarios")
			END CHOOSE	
	end if
end if
end event

type pb_estado_titular from picturebutton within w_encuenta_atc
boolean visible = false
integer x = 2373
integer y = 80
integer width = 155
integer height = 132
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fallecidos.bmp"
alignment htextalign = left!
end type

type cb_imprimir from commandbutton within w_encuenta_atc
event ue_mousemove pbm_mousemove
integer x = 2551
integer y = 2540
integer width = 302
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimir"
end type

event clicked;if dw_impresion.rowcount()>0 then
	dw_impresion.object.usuario.text						= gs_user
	f_Print( dw_impresion )
end if
end event

type dw_impresion from datawindow within w_encuenta_atc
boolean visible = false
integer x = 3319
integer y = 780
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
string dataobject = "dw_encuesta_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_anula from commandbutton within w_encuenta_atc
integer x = 1339
integer y = 2540
integer width = 302
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anular"
end type

event clicked;string	ls_tipo_cliente
long	ll_tot_carga,ll_tot_evalua,ll_res,ll_folio,ll_graba=0,ll_nulo,ll_fila

setnull(ll_nulo)
dw_carga.accepttext()
dw_evalua.accepttext()
ll_tot_carga								= dw_carga.rowcount()
ll_tot_evalua							= dw_carga.rowcount()
ll_res										= MessageBox("Eliminar", ' ¿Desea Eliminar Encuesta?', Exclamation!, YesNo!, 2)
if ll_res=1 then
	ll_folio								= dw_encuesta.getitemnumber(1,'folio_encuesta')
	ls_tipo_cliente						= dw_encuesta.getitemstring(1,'tipo_cliente')
	if ll_tot_carga>0 then
		UPDATE	"ENCUESTA"  
   		SET 		"ESTADO" = 'A'  
   		WHERE	"ENCUESTA"."FOLIO" = :ll_folio
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			ll_graba++
		else
			rollback using sqlca;
		end if
	else
		ll_graba++
	end if
	if ll_tot_evalua>0 then
		UPDATE	"ENCUESTA_EVALUACION"  
   		SET 		"ESTADO" = 'A'  
   		WHERE 	"ENCUESTA_EVALUACION"."FOLIO" = :ll_folio
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			ll_graba++
		else
			rollback using sqlca;
		end if
	else
		ll_graba++
	end if
	
	if ls_tipo_cliente='C' then
		UPDATE	"CLIENTE"  
		SET 		"FOLIO_ENCUESTA" = :ll_nulo 
		WHERE	"CLIENTE"."FOLIO_ENCUESTA" = :ll_folio
		USING	sqlca;
	elseif ls_tipo_cliente='A' then
		UPDATE	"UGN_CLIENTE"  
		SET 		"FOLIO_ENCUESTA" = :ll_nulo 
		WHERE	"UGN_CLIENTE"."FOLIO_ENCUESTA" = :ll_folio
		USING	sqlca;
	end if
	if sqlca.sqlcode = 0 then
		commit using sqlca;
		ll_graba++
	else
		rollback using sqlca;
	end if
	
	if ll_graba=3 then
		messagebox("Eliminar","Encuesta Eliminada")
		if isvalid(w_encuesta_lista) then
			ll_fila			= w_encuesta_lista.dw_lista.getrow()
			w_encuesta_lista.pb_aceptar.triggerevent(clicked!)
			if ll_fila>0 then
				w_encuesta_lista.dw_lista.scrolltorow(ll_fila)
				w_encuesta_lista.dw_lista.setfocus()
			end if
		end if
		close(w_encuenta_atc)
	end if
end if
end event

type dw_evalua from datawindow within w_encuenta_atc
integer x = 23
integer y = 940
integer width = 3145
integer height = 1248
integer taborder = 10
string title = "none"
string dataobject = "dw_encuesta_evalua"
boolean border = false
boolean livescroll = true
end type

event clicked;string	ls_columna
long	ll_cod_encuesta

this.accepttext()
dw_evalua.accepttext()
ls_columna 								= dwo.name
il_row										= row
if il_row>0 then
	if ls_columna='nota1' then
		ll_cod_encuesta				= dw_evalua.getitemnumber(il_row,'cod_encuesta')
		wf_carga_nota(ls_columna)
	elseif ls_columna='nota2' then
		ll_cod_encuesta				= dw_evalua.getitemnumber(il_row,'cod_encuesta')
		wf_carga_nota(ls_columna)
	elseif ls_columna='nota3' then
		ll_cod_encuesta				= dw_evalua.getitemnumber(il_row,'cod_encuesta')
		wf_carga_nota(ls_columna)
	elseif ls_columna='nota4' then
		ll_cod_encuesta				= dw_evalua.getitemnumber(il_row,'cod_encuesta')
		wf_carga_nota(ls_columna)
	elseif ls_columna='nota5' then
		ll_cod_encuesta				= dw_evalua.getitemnumber(il_row,'cod_encuesta')
		wf_carga_nota(ls_columna)
	elseif ls_columna='nota6' then
		ll_cod_encuesta				= dw_evalua.getitemnumber(il_row,'cod_encuesta')
		wf_carga_nota(ls_columna)
	elseif ls_columna='nota7' then
		ll_cod_encuesta				= dw_evalua.getitemnumber(il_row,'cod_encuesta')
		wf_carga_nota(ls_columna)	
	elseif ls_columna='nota0' then
		ll_cod_encuesta				= dw_evalua.getitemnumber(il_row,'cod_encuesta')
		wf_carga_nota(ls_columna)		
	end if
end if
end event

event doubleclicked;long	ll_nulo
setnull(ll_nulo)
dw_evalua.setitem(il_row,'nota0',1)
dw_evalua.setitem(il_row,'nota1',ll_nulo)
dw_evalua.setitem(il_row,'nota2',ll_nulo)
dw_evalua.setitem(il_row,'nota3',ll_nulo)
dw_evalua.setitem(il_row,'nota4',ll_nulo)
dw_evalua.setitem(il_row,'nota5',ll_nulo)
dw_evalua.setitem(il_row,'nota6',ll_nulo)
dw_evalua.setitem(il_row,'nota7',ll_nulo)
dw_evalua.setitem(il_row,'puntos',ll_nulo)
dw_evalua.accepttext()
end event

type cb_grabar from commandbutton within w_encuenta_atc
integer x = 23
integer y = 2540
integer width = 302
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_pasa='S',ls_evalua='S',ls_base,ls_serie,ls_usuario,ls_estado,ls_observ,ls_resp,ls_ok,ls_tipo_cliente,ls_maestro,ls_aplica,ls_sector,&
			ls_sepultura
long		ll_tot_reg,ll_res,ll_indi,ll_indi1,ll_folio,ll_rut,ll_cod_encuesta,ll_puntos,ll_graba=0,ll_tot_carga,ll_res_enc,&
			ll_ptos1,ll_ptos2,ll_ptos3,ll_encu1,ll_encu2,ll_encu3,ll_cod_box,ll_res_eva,ll_impr,ll_grupo,ll_correl,ll_fila,rut_fallecido,ll_aplica,ll_folio_ant,ll_numero,ll_count
double	ldb_numero
datetime	ldt_fec_crea

dw_carga.accepttext()
dw_evalua.accepttext()
dw_encuesta.accepttext()
	
ll_tot_carga												= dw_carga.rowcount()
if ll_tot_carga>0 then
	for ll_indi=1 to ll_tot_carga
		ll_cod_box										= dw_carga.getitemnumber(ll_indi,'cod_box')
		if isnull(ll_cod_box) or ll_cod_box=0 then
			messagebox("Advertencia","Debe Seleccionar Estado Llamado Teléfonico")
			dw_carga.setfocus()
			dw_carga.setcolumn('cod_box')
			ls_pasa										= 'N'
		end if
		if ls_pasa='S' then
			SELECT	"ESTADO_RESPUESTA"  
			INTO 		:ls_resp  
			FROM 	"ENCUESTA_BOX"  
			WHERE 	"ENCUESTA_BOX"."COD_BOX" = :ll_cod_box
			USING	sqlca;
			if isnull(ls_resp) then ls_resp='S'
			if ls_resp='S' then
				ll_tot_reg								= dw_evalua.rowcount() 
				if ll_tot_reg>0 then
					for ll_indi1=1 to ll_tot_reg
						ll_cod_encuesta				= dw_evalua.getitemnumber(ll_indi1,'cod_encuesta')
						ll_puntos							= dw_evalua.getitemnumber(ll_indi1,'puntos')
						ll_aplica							= dw_evalua.getitemnumber(ll_indi1,'nota0')
						if ll_cod_encuesta=1 then
							ll_encu1						= ll_cod_encuesta
							ll_ptos1						= ll_puntos
							if ll_aplica = 1 or ll_ptos1 <> 0 then
								ls_aplica	= 'S'
							else
								ls_aplica	= 'N'
							end if	
						elseif ll_cod_encuesta=2 then
							ll_encu2						= ll_cod_encuesta
							ll_ptos2						= ll_puntos
							if ll_aplica = 1 or ll_ptos2 <> 0 then
								ls_aplica	= 'S'
							else
								ls_aplica	= 'N'
							end if	
						elseif ll_cod_encuesta=3 then
							ll_encu3						= ll_cod_encuesta
							ll_ptos3						= ll_puntos
							if ll_aplica = 1 or ll_ptos3 <> 0 then
								ls_aplica	= 'S'
							else
								ls_aplica	= 'N'
							end if	
						end if
					next
					if ll_encu1=1 and (( ll_ptos1=0 or isnull(ll_ptos1)) AND ls_aplica ='N' ) then
//					if ll_encu1=1 and ( ll_ptos1=0 or isnull(ll_ptos1))  then	
						messagebox("Advertencia","Debe Seleccionar Evaluación, Pregunta 1")
						dw_evalua.setfocus()
						dw_evalua.setcolumn('nota1')
						ls_evalua							= 'N'
					elseif ll_encu2=2 and (( ll_ptos2=0 or isnull(ll_ptos2)) and ls_aplica ='N' ) then
//					elseif ll_encu2=2 and ( ll_ptos2=0 or isnull(ll_ptos2)) then	
						messagebox("Advertencia","Debe Seleccionar Evaluación, Pregunta 2")
						dw_evalua.setfocus()
						dw_evalua.setcolumn('nota1')
						ls_evalua							= 'N'
					elseif ll_encu3=3 and (( ll_ptos3=0 or isnull(ll_ptos3)) and  ls_aplica ='N' ) then
//					elseif ll_encu3=3 and ( ll_ptos3=0 or isnull(ll_ptos3)) then	
						messagebox("Advertencia","Debe Seleccionar Evaluación, Pregunta 3")
						dw_evalua.setfocus()
						dw_evalua.setcolumn('nota1')
						ls_evalua							= 'N'
					else	
						ls_observ						= dw_carga.getitemstring(ll_indi,'observacion')
						if isnull(ls_observ) or ls_observ='' then
							ll_res							= MessageBox("Advertencia", ' "No Registra Observación" ¿Desea Grabar Sin Observación?', Exclamation!, YesNo!, 2)
							if ll_res=1 then
								ls_pasa					= 'S'
							else
								dw_carga.setfocus()
								dw_carga.setcolumn('observacion')
								ls_pasa					= 'N'
							end if
						end if
					end if
				end if
			end if
		end if
	next
end if
if ls_pasa='S' and ls_evalua='S' then
	rut_fallecido									= dw_encuesta.getitemnumber(1,'rut_fall')
	ls_base										= dw_encuesta.getitemstring(1,'codigo')
	ls_serie										= dw_encuesta.getitemstring(1,'serie')
	ldb_numero									= dw_encuesta.getitemnumber(1,'numero')
	ls_sector										= dw_encuesta.getitemstring(1,'sector_sep')
	ls_sepultura									= dw_encuesta.getitemstring(1,'sepultura')
	
//	SELECT 	count("FALLECIDOS"."FOLIO_ENCUESTA")
//	INTO		:ll_count
//	FROM		"FALLECIDOS"  
//	WHERE 	( "FALLECIDOS"."BASE" = :ls_base ) AND  
//				( "FALLECIDOS"."SS" = :ls_serie ) AND  
//				( "FALLECIDOS"."CONTRATO" = :ldb_numero ) AND  
//				( "FALLECIDOS"."RUT" = :rut_fallecido );
			
	SELECT 	count("ENCUESTA"."FOLIO")
	INTO		:ll_count
	FROM 	"ENCUESTA"  
	WHERE 	( "ENCUESTA"."BASE" = :ls_base ) AND  
				( "ENCUESTA"."SERIE" = :ls_serie ) AND  
				( "ENCUESTA"."NUMERO" = :ldb_numero ) AND
				( "ENCUESTA"."ESTADO" = 'V') AND
				( "ENCUESTA"."COD_BOX" = '1') AND
				( "ENCUESTA"."RUT_FALLECIDO" = :rut_fallecido )   ;
	
	if ll_count = 0 then	
		ll_res												= MessageBox("Advertencia", 'Esta Seguro de Grabar Registro(s)', Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			ll_folio_ant									= dw_carga.getitemnumber(1,'folio')
//			rut_fallecido									= dw_encuesta.getitemnumber(1,'rut_fall')
			if isnull(ll_folio_ant) then
				SELECT	max("FOLIO")  
				INTO 		:ll_folio  
				FROM		"ENCUESTA"
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ll_folio) and ll_folio>=1 then
						ll_folio++
					else
						ll_folio				= 1
					end if
				else
					ll_folio					= 1
				end if
				dw_carga.setitem(1,'folio',ll_folio)
			end if
			dw_carga.accepttext()
			if dw_carga.update() = 1 then
				commit using sqlca;
				ll_folio									= dw_carga.getitemnumber(1,'folio')
				ll_rut										= dw_carga.getitemnumber(1,'rut')
				ldt_fec_crea								= dw_carga.getitemdatetime(1,'fecha_crea')
				ls_estado								= dw_carga.getitemstring(1,'estado')
				ls_usuario								= dw_carga.getitemstring(1,'usuario_crea')
				if ls_resp='S' then
					ll_tot_reg							= dw_evalua.rowcount() 
					if ll_tot_reg>0 then
						for ll_indi1=1 to ll_tot_reg
							ll_cod_encuesta			= dw_evalua.getitemnumber(ll_indi1,'cod_encuesta')
							ll_puntos						= dw_evalua.getitemnumber(ll_indi1,'puntos')
							ll_aplica						= dw_evalua.getitemnumber(ll_indi1,'nota0')
							if ll_aplica = 0 then
								INSERT INTO "ENCUESTA_EVALUACION"  
											( "FOLIO",	"RUT",	"COD_ENCUESTA",	"PUNTOS",	"ESTADO",	"FECHA_CREA" )  
								VALUES	( :ll_folio,	:ll_rut,	:ll_cod_encuesta,	:ll_puntos,	:ls_estado,	:ldt_fec_crea )
								USING	sqlca;
								if sqlca.sqlcode = 0 then
									commit using sqlca;
									ll_graba++
								else
									rollback using sqlca;
								end if
							else
								INSERT INTO "ENCUESTA_EVALUACION"  
											( "FOLIO",	"RUT",	"COD_ENCUESTA",	"PUNTOS",	"ESTADO",	"FECHA_CREA" )  
								VALUES	( :ll_folio,	:ll_rut,	:ll_cod_encuesta,		:ll_puntos,	:ls_estado,	:ldt_fec_crea )
								USING	sqlca;
								if sqlca.sqlcode = 0 then
									commit using sqlca;
									ll_graba++
								else
									rollback using sqlca;
								end if
							end if
						next
					end if
					if (ll_indi1 - 1) =ll_graba then
						ls_ok						 		= 'S'	
					end if
				elseif ls_resp='N' then
					//messageBox("Advertencia","El Estado de Llamado Elimina Evaluación")
					dw_evalua.enabled				= false
					ls_ok							 		= 'S'	
				end if
			else
				rollback  using sqlca;
				ls_ok							 			= 'N'	
			end if
			if ls_ok='S' then
				ls_tipo_cliente							= dw_encuesta.getitemstring(1,'tipo_cliente')
				ll_grupo									= dw_encuesta.getitemnumber(1,'grupo')
				ll_correl									= dw_encuesta.getitemnumber(1,'correlativo')
				rut_fallecido								= dw_encuesta.getitemnumber(1,'rut_fall')
				ls_sector									= dw_encuesta.getitemstring(1,'sector_sep')
				ls_sepultura								= dw_encuesta.getitemstring(1,'sepultura')
				ls_base									= dw_encuesta.getitemstring(1,'codigo')
				ls_serie									= dw_encuesta.getitemstring(1,'serie')
				ll_numero								= dw_encuesta.getitemnumber(1,'numero')
				
				if ls_tipo_cliente='C' then
//					if ls_base = 'F' then
//						UPDATE	"PRODUCTO_BENEFICIARIO"
//						SET		"FOLIO_ENCUESTA" = :ll_folio  
//						WHERE	"PRODUCTO_BENEFICIARIO"."RUT" = :rut_fallecido and
//									"PRODUCTO_BENEFICIARIO"."SERIE" = :ls_serie and
//									"PRODUCTO_BENEFICIARIO"."NUMERO" = :ll_numero
//						USING	sqlca;
//					else	
						UPDATE	"FALLECIDOS"  
						SET		"FOLIO_ENCUESTA" = :ll_folio  
						WHERE	"FALLECIDOS"."RUT" = :rut_fallecido and
									"FALLECIDOS"."SECTOR" = :ls_sector and
									"FALLECIDOS"."N_SEP" = :ls_sepultura  AND
									"FALLECIDOS"."ESTADO_REG" = 'A' 
						USING	sqlca;
				//	end if	
				elseif ls_tipo_cliente = 'A' then
					UPDATE	"UGN_CLIENTE"  
					SET		"FOLIO_ENCUESTA" = :ll_folio  
					WHERE	"UGN_CLIENTE"."GRUPO" = :ll_grupo AND 
								"UGN_CLIENTE"."CORRELATIVO" = :ll_correl
					USING	sqlca;
				end if
				if sqlca.sqlcode = 0 then
					commit using sqlca;
					messagebox("Grabar","Grabación Exitosa")
					//--
					if ls_base = 'F' then
						UPDATE	"ENCUESTA_CONTROL_GESTION"
						SET		"ESTADO_GESTION" = 'G', 
									"FOLIO_ENCUESTA" = :ll_folio  
						WHERE	"ENCUESTA_CONTROL_GESTION"."RUT_FALLECIDO" = :rut_fallecido
						USING	sqlca;
					else
						UPDATE	"ENCUESTA_CONTROL_GESTION"
						SET		"ESTADO_GESTION" = 'G', 
									"FOLIO_ENCUESTA" = :ll_folio  
						WHERE	"ENCUESTA_CONTROL_GESTION"."RUT_FALLECIDO" = :rut_fallecido AND
									"ENCUESTA_CONTROL_GESTION"."SECTOR" = :ls_sector AND
									"ENCUESTA_CONTROL_GESTION"."SEPULTURA" = :ls_sepultura 
						USING	sqlca;
					end if	
					if sqlca.sqlcode = 0 then
						commit using sqlca;
					end if
					//--
					if isvalid(w_encuesta_lista) then
						ll_fila							= w_encuesta_lista.dw_lista.getrow()
						w_encuesta_lista.pb_aceptar.triggerevent(clicked!)
						if w_encuesta_lista.rb_maestro.checked = true then
							 w_encuesta_lista.dw_maestro.accepttext()
							ls_maestro				= w_encuesta_lista.dw_maestro.getitemstring(1,'cod_maestro')
							if not isnull(ls_maestro) and ls_maestro<>'' then
								ls_maestro			= "usuario_creador = '"+ls_maestro+"'"
								w_encuesta_lista.dw_lista.SetFilter(ls_maestro)
								w_encuesta_lista.dw_lista.Filter( )
								 w_encuesta_lista.dw_maestro.accepttext()
							end if
						end if
						
						if ll_fila>0 then
							w_encuesta_lista.dw_lista.scrolltorow(ll_fila)
							w_encuesta_lista.dw_lista.setfocus()
						end if
					end if
					if ll_cod_box=1 then
						ll_impr							= dw_impresion.retrieve(ll_folio)
						if ll_impr>0 then
							cb_imprimir.enabled		= true
							ll_res_enc					= MessageBox("Advertencia", 'Desea Imprimir Encuesta', Exclamation!, YesNo!, 2)
							if ll_res_enc=1 then
								cb_imprimir.triggerevent(Clicked!)
								close(w_encuenta_atc)
							else
								close(w_encuenta_atc)
							end if
						else
							cb_imprimir.enabled		= false
							messagebox("Advertencia","No Registra Folio Para Impresión")
						end if
					else
						close(w_encuenta_atc)
					end if
				else
					rollback using sqlca;
				end if
			end if
		end if
	else
		 MessageBox("Advertencia", 'Este Fallecido Ya tiene encuesta Asociada')
	end if	
end if
end event

type cb_cerrar from commandbutton within w_encuenta_atc
integer x = 2866
integer y = 2540
integer width = 302
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;string	ls_estado_encuesta

	SELECT 	"ENCUESTA_CONTROL_GESTION"."ESTADO_GESTION"  
	INTO 		:ls_estado_encuesta  
	FROM 	"ENCUESTA_CONTROL_GESTION"  
	WHERE (	"ENCUESTA_CONTROL_GESTION"."RUT_FALLECIDO" = :il_rut_falle );
	if ls_estado_encuesta = 'C' then
		UPDATE	"ENCUESTA_CONTROL_GESTION"
		SET		"ESTADO_GESTION" = 'L' ,"USUARIO_GESTOR"  = null
		WHERE	"ENCUESTA_CONTROL_GESTION"."RUT_FALLECIDO" = :il_rut_falle
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
		end if
	end if	


close(w_encuenta_atc)
end event

type dw_encuesta from datawindow within w_encuenta_atc
integer x = 23
integer y = 20
integer width = 3154
integer height = 808
integer taborder = 30
string title = "none"
string dataobject = "dw_encuesta_atc"
boolean border = false
boolean livescroll = true
end type

type dw_carga from datawindow within w_encuenta_atc
integer y = 828
integer width = 3200
integer height = 1676
integer taborder = 40
string title = "none"
string dataobject = "dw_encuesta_carga"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string		ls_columna,ls_string,ls_base,ls_serie,ls_resp
long		ll_rut,ll_fila,ll_folio,ll_cod_box,ll_tot_reg,ll_nulo,ll_indi,ll_rut_falle
double	ldb_numero
Datetime	ldt_fecha_box

setnull(ll_nulo)
dw_carga.accepttext()
SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;

il_row										= row
ls_columna 								= dwo.name
if il_row>0 then
	if ls_columna='cod_box' then
		ll_cod_box						= dw_carga.getitemnumber(1,'cod_box')
		ldt_fecha_box					= dw_carga.getitemdatetime(1,'fecha_box')
		SELECT	"ESTADO_RESPUESTA"  
		INTO 		:ls_resp  
		FROM 	"ENCUESTA_BOX"  
		WHERE 	"ENCUESTA_BOX"."COD_BOX" = :ll_cod_box
		USING	sqlca;
		if isnull(ls_resp) then ls_resp='S'
		if ls_resp='S' then
			dw_evalua.enabled		= true
		else
			dw_evalua.enabled		= false
			dw_evalua.reset()
			ll_tot_reg					= dw_evalua.retrieve()
			if ll_tot_reg>0 then
				for	ll_indi=1 to ll_tot_reg
					dw_evalua.setitem(ll_indi,'nota1',ll_nulo)
					dw_evalua.setitem(ll_indi,'nota2',ll_nulo)
					dw_evalua.setitem(ll_indi,'nota3',ll_nulo)
					dw_evalua.setitem(ll_indi,'nota4',ll_nulo)
					dw_evalua.setitem(ll_indi,'nota5',ll_nulo)
					dw_evalua.setitem(ll_indi,'nota6',ll_nulo)
					dw_evalua.setitem(ll_indi,'nota7',ll_nulo)
					dw_evalua.accepttext()
				next
			end if
		end if
		ll_rut								= dw_encuesta.getitemnumber(1,'rut')
		ll_rut_falle						= dw_encuesta.getitemnumber(1,'rut_fall') 
		if isnull(ll_rut) then ll_rut=0
		ls_string							= "rut="+trim(string(ll_rut))
		ll_fila	 							= dw_carga.Find(ls_string, 1, dw_carga.rowcount() )
//		if ll_fila<=0 THEN
			ls_base						= dw_encuesta.getitemstring(1,'codigo')
			ls_serie						= dw_encuesta.getitemstring(1,'serie') 
			ldb_numero					= dw_encuesta.getitemnumber(1,'numero')
			
			dw_carga.setitem(1,'base',ls_base)
			dw_carga.setitem(1,'serie',ls_serie)
			dw_carga.setitem(1,'numero',ldb_numero)
			dw_carga.setitem(1,'rut',ll_rut)
			dw_carga.setitem(1,'rut_fallecido',ll_rut_falle)
//			if isnull(ldt_fecha_box) then dw_carga.setitem(1,'fecha_crea',gdt_fec_sistema)
			dw_carga.setitem(1,'fecha_box',gdt_fec_sistema)
			dw_carga.setitem(1,'fecha_crea',gdt_fec_sistema)
			dw_carga.setitem(1,'usuario_crea',gs_user)
			dw_carga.setitem(1,'estado','V')
			dw_carga.accepttext()
//		end if
	end if
end if
end event

