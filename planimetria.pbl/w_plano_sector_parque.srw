forward
global type w_plano_sector_parque from window
end type
type pb_mostrar_mapa from picturebutton within w_plano_sector_parque
end type
type ddlb_parque from dropdownlistbox within w_plano_sector_parque
end type
type pb_105 from picturebutton within w_plano_sector_parque
end type
type pb_103 from picturebutton within w_plano_sector_parque
end type
type pb_12 from picturebutton within w_plano_sector_parque
end type
type st_40 from statictext within w_plano_sector_parque
end type
type dw_1 from datawindow within w_plano_sector_parque
end type
type st_parque from statictext within w_plano_sector_parque
end type
type pb_11 from picturebutton within w_plano_sector_parque
end type
type cb_2 from commandbutton within w_plano_sector_parque
end type
type pb_10 from picturebutton within w_plano_sector_parque
end type
type shl_1 from statichyperlink within w_plano_sector_parque
end type
type st_7 from statictext within w_plano_sector_parque
end type
type pb_9 from picturebutton within w_plano_sector_parque
end type
type pb_8 from picturebutton within w_plano_sector_parque
end type
type pb_7 from picturebutton within w_plano_sector_parque
end type
type cb_1 from commandbutton within w_plano_sector_parque
end type
type st_10 from statictext within w_plano_sector_parque
end type
type pb_6 from picturebutton within w_plano_sector_parque
end type
type st_22 from statictext within w_plano_sector_parque
end type
type pb_5 from picturebutton within w_plano_sector_parque
end type
type pb_4 from picturebutton within w_plano_sector_parque
end type
type pb_3 from picturebutton within w_plano_sector_parque
end type
type pb_2 from picturebutton within w_plano_sector_parque
end type
type pb_1 from picturebutton within w_plano_sector_parque
end type
type st_2 from statictext within w_plano_sector_parque
end type
type cb_8 from commandbutton within w_plano_sector_parque
end type
type st_21 from statictext within w_plano_sector_parque
end type
type ddlb_2 from dropdownlistbox within w_plano_sector_parque
end type
type cb_4 from commandbutton within w_plano_sector_parque
end type
type ddplb_1 from dropdownpicturelistbox within w_plano_sector_parque
end type
type ddlb_1 from dropdownlistbox within w_plano_sector_parque
end type
type gb_2 from groupbox within w_plano_sector_parque
end type
type hpb_1 from hprogressbar within w_plano_sector_parque
end type
type st_1 from statictext within w_plano_sector_parque
end type
type gb_3 from groupbox within w_plano_sector_parque
end type
type gb_9 from groupbox within w_plano_sector_parque
end type
type dw_plano_sector_parque from datawindow within w_plano_sector_parque
end type
type gb_4 from groupbox within w_plano_sector_parque
end type
type gb_6 from groupbox within w_plano_sector_parque
end type
type gb_58 from groupbox within w_plano_sector_parque
end type
end forward

global type w_plano_sector_parque from window
integer width = 3643
integer height = 1120
boolean titlebar = true
string title = "Planimetria 5.26"
boolean controlmenu = true
long backcolor = 67108864
pb_mostrar_mapa pb_mostrar_mapa
ddlb_parque ddlb_parque
pb_105 pb_105
pb_103 pb_103
pb_12 pb_12
st_40 st_40
dw_1 dw_1
st_parque st_parque
pb_11 pb_11
cb_2 cb_2
pb_10 pb_10
shl_1 shl_1
st_7 st_7
pb_9 pb_9
pb_8 pb_8
pb_7 pb_7
cb_1 cb_1
st_10 st_10
pb_6 pb_6
st_22 st_22
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_2 st_2
cb_8 cb_8
st_21 st_21
ddlb_2 ddlb_2
cb_4 cb_4
ddplb_1 ddplb_1
ddlb_1 ddlb_1
gb_2 gb_2
hpb_1 hpb_1
st_1 st_1
gb_3 gb_3
gb_9 gb_9
dw_plano_sector_parque dw_plano_sector_parque
gb_4 gb_4
gb_6 gb_6
gb_58 gb_58
end type
global w_plano_sector_parque w_plano_sector_parque

type variables
datawindow dw_paso_menu

long fila,cambio_sector
string cadena_tipo
Double	ll_numero
string MenuHabilitado
string dw_construdida,dw_jardin
public integer id_parque


end variables

forward prototypes
public subroutine wf_pinta_asig_s_fall (datawindow dw_paso)
public subroutine wf_porcentajes ()
public subroutine wf_reservadas (ref datawindow dw_paso)
public subroutine wf_sepult_indiv (datawindow dw_paso)
public subroutine wf_sin_asig_con_fall (datawindow dw_paso)
public subroutine wf_pinta_sector (ref datawindow dw_paso)
public subroutine wf_sin_asig_sin_fall (datawindow dw_paso)
public subroutine wf_asig_con_fall (datawindow dw_paso)
end prototypes

public subroutine wf_pinta_asig_s_fall (datawindow dw_paso);long i,j,h,sepultura,can_fall,cant_inv_asig,cant_inv_no_asig,cant_inv_t,cant_fall
string sepultura_nd,sub_sector,n_sep
Double	numero
cant_fall = 0
ddlb_1.SelectItem("100", 1)
dw_plano_sector_parque.Object.DataWindow.Zoom = integer(ddlb_1.text)
if dw_paso.rowcount() > 0 then
	if dw_paso.dataobject = dw_jardin then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura = dw_paso.getitemnumber(i,'campo'+string(j))
				if sepultura > 0 then
					SELECT "INVENTARIO_PLANI"."NUMERO"  
					INTO :numero
					FROM "INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'compute_'+string(j),sepultura)
						dw_paso.setitem(i,'campo'+string(j),0)
					end if
					SELECT count("FALLECIDOS"."CONTRATO") 
					INTO :can_fall  
					FROM "FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura )  AND ( "FALLECIDOS"."ESTADO_REG" = 'A' )  ;
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',sepultura)
						dw_paso.setitem(i,'campo'+string(j),0)
						cant_fall ++
					end if
				end if
				h ++
				hpb_1.minposition = 0
				hpb_1.maxposition = dw_paso.rowcount() * 80
				hpb_1.position    = h
				st_1.text = string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	elseif dw_paso.dataobject = dw_construdida then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura_nd = dw_paso.getitemstring(i,'campo'+string(j))
				if sepultura_nd <> '0' then
					SELECT "INVENTARIO_PLANI"."NUMERO","INVENTARIO_PLANI"."SUB_SECTOR"  
					INTO :numero,:sub_sector 
					FROM "INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'compute_'+string(j),sepultura_nd)
						dw_paso.setitem(i,'campo'+string(j),'0')
					end if
					n_sep = sepultura_nd
					sepultura_nd = mid( sepultura_nd , 1 , len ( sepultura_nd ) -2 )
					SELECT count("FALLECIDOS"."CONTRATO") 
					INTO :can_fall  
					FROM "FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura_nd )   AND ( "FALLECIDOS"."ESTADO_REG" = 'A' ) ;//sub_sector
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',n_sep)
						cant_fall ++
						dw_paso.setitem(i,'campo'+string(j),'0')
					end if
				end if
				h ++
				hpb_1.minposition = 0
				hpb_1.maxposition = dw_paso.rowcount() * 80
				hpb_1.position    = h
				st_1.text = string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	end if
end if

//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_asig  
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" > 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_9.text = string(cant_inv_asig,'###,###,##0') 
//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_no_asig 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" = 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_10.text = string(cant_inv_no_asig,'###,###,##0') 
//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_t 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_11.text = string (cant_inv_t,'###,###,##0') 
//dw_paso.object.t_17.text = string (cant_fall,'###,###,##0')
//dw_paso.object.t_15.text = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//dw_paso.object.t_16.text = string ( ( cant_inv_no_asig * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//dw_paso.object.t_18.text = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//
//
//st_17.text = string (cant_fall,'###,###,##0')
//st_16.text = string (cant_inv_asig,'###,###,##0')
//st_15.text = string (cant_inv_no_asig,'###,###,##0')
//st_14.text = string (cant_inv_t,'###,###,##0')
//st_18.text = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//st_20.text = string ( ( cant_inv_no_asig * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//st_19.text = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
hpb_1.position = 0
end subroutine

public subroutine wf_porcentajes ();//double fallecidos,sepulturas,asignadas,disponibles,resultado,count_reserv
//
//SELECT count(*) INTO :count_reserv FROM "RESERVA_SEPULTURA" 
//WHERE ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) ;
//
//SELECT count(*)  into:fallecidos FROM "FALLECIDOS" ;
//SELECT sum("BASE_PLANI"."TOTAL_SEP"),   
//       sum("BASE_PLANI"."TOTAL_ASIGNADAS"),
//	    sum("BASE_PLANI"."TOTAL_SEP") - sum("BASE_PLANI"."TOTAL_ASIGNADAS")
//		 into :sepulturas,:asignadas,:disponibles
//FROM "BASE_PLANI" ;
//
//	 
//	 
//st_102.text = string(count_reserv,'###,###,###,###')                          //reservados
//resultado   = (count_reserv*100)/sepulturas                                  //reservados %
//st_101.text = string(resultado,'##0.00')+'%'                                //reservados %
//st_17.text  = string(fallecidos,'###,###,###,###')                         //fallecidos
//resultado   = (fallecidos*100)/sepulturas                                 //fallecidos %
//st_18.text  = string(resultado,'##0.00')+'%'                             //fallecidos %
//st_16.text  = string(asignadas,'###,###,###,###')                       //asignadas
//resultado   = (asignadas*100)/sepulturas                               //asignadas %
//st_19.text  = string(resultado,'##0.00')+'%'                          //asignadas %
//st_15.text  = string(disponibles - count_reserv,'###,###,###,###')   //disponibles
//resultado   = ((disponibles - count_reserv)*100)/sepulturas         //disponibles %
//st_20.text  = string(resultado,'##0.00')+'%'                       //disponibles %
//st_14.text  = string(sepulturas,'###,###,###,###')                //total
//	
//st_21.text = ''
//st_2.text = '** Doble Click para Reservar Sepultura **'
end subroutine

public subroutine wf_reservadas (ref datawindow dw_paso);long i,j,h,sepultura,can_fall,cant_inv_asig,&
     cant_inv_no_asig,cant_inv_t,cant_fall,folio
string sepultura_nd,sub_sector,n_sep
Double	numero
cant_fall = 0
ddlb_1.SelectItem("100", 1)
dw_plano_sector_parque.Object.DataWindow.Zoom = integer(ddlb_1.text)
if dw_paso.rowcount() > 0 then
	if dw_paso.dataobject = dw_jardin then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura_nd 	= string(dw_paso.getitemnumber(i,'campo'+string(j)))
				sepultura 		= long(sepultura_nd)
				if sepultura > 0 then
					//--------------------------------------------------------------------------------------------
					SELECT	"RESERVA_SEPULTURA"."FOLIO_RESERVA" INTO :folio
    					FROM 	"RESERVA_SEPULTURA"  
				   	WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) AND  
         					  ( "RESERVA_SEPULTURA"."SEPULTURA" = :sepultura_nd )  and 
         					  ( "RESERVA_SEPULTURA"."ESTADO" = 1 )  ;
					if sqlca.sqlcode = 0 and folio > 0 then
						dw_paso.setitem(i,'compute_'+string(j),0)
						dw_paso.setitem(i,'compute_'+string(j)+'_1_1',sepultura)
					else
						dw_paso.setitem(i,'campo'+string(j),0)
					end if
					//--------------------------------------------------------------------------------------------
				end if
				h ++
				hpb_1.minposition 	= 0
				hpb_1.maxposition 	= dw_paso.rowcount() * 80
				hpb_1.position    		= h
				st_1.text 					= string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	elseif dw_paso.dataobject = dw_construdida then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura_nd = dw_paso.getitemstring(i,'campo'+string(j))
				if sepultura_nd <> '0' then
//					if sepultura_nd = '15S7C2' THEN
						SELECT 	"RESERVA_SEPULTURA"."FOLIO_RESERVA" INTO :folio
						FROM 	"RESERVA_SEPULTURA"  
						WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) AND  
								   ( "RESERVA_SEPULTURA"."SEPULTURA" = :sepultura_nd )    and 
								   ( "RESERVA_SEPULTURA"."ESTADO" = 1 )  ;
						if sqlca.sqlcode = 0 and folio > 0 then
							dw_paso.setitem(i,'compute_'+string(j),'0')
							dw_paso.setitem(i,'compute_'+string(j)+'_4',sepultura_nd)
						else
							dw_paso.setitem(i,'campo'+string(j),'0')
						end if
//					END IF
				end if
				h ++
				hpb_1.minposition 	= 0
				hpb_1.maxposition 	= dw_paso.rowcount() * 80
				hpb_1.position   		= h
				st_1.text 					= string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	end if
end if

//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_asig  
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" > 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_9.text = string(cant_inv_asig,'###,###,##0') 
//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_no_asig 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" = 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_10.text = string(cant_inv_no_asig,'###,###,##0') 
//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_t 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_11.text = string (cant_inv_t,'###,###,##0') 
//dw_paso.object.t_17.text = string (cant_fall,'###,###,##0')
//dw_paso.object.t_15.text = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//dw_paso.object.t_16.text = string ( ( cant_inv_no_asig * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//dw_paso.object.t_18.text = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//
//
//st_17.text = string (cant_fall,'###,###,##0')
//st_16.text = string (cant_inv_asig,'###,###,##0')
//st_15.text = string (cant_inv_no_asig,'###,###,##0')
//st_14.text = string (cant_inv_t,'###,###,##0')
//st_18.text = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//st_20.text = string ( ( cant_inv_no_asig * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//st_19.text = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
hpb_1.position = 0
end subroutine

public subroutine wf_sepult_indiv (datawindow dw_paso);long i,j,h,sepultura,can_fall,cant_inv_asig,cant_inv_no_asig,cant_inv_t,cant_fall
string sepultura_nd,sub_sector,n_sep
Double	numero
cant_fall = 0
ddlb_1.SelectItem("100", 1)
dw_plano_sector_parque.Object.DataWindow.Zoom = integer(ddlb_1.text)
if dw_paso.rowcount() > 0 then
	if dw_paso.dataobject = dw_jardin then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura = dw_paso.getitemnumber(i,'campo'+string(j))
				if sepultura > 0 then
					SELECT 	"INVENTARIO_PLANI"."NUMERO"  
					INTO 		:numero
					FROM 	"INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'compute_'+string(j),sepultura)
					end if
					if numero <> 10000000 and numero <> 90000000 then
						dw_paso.setitem(i,'campo'+string(j),0)
					end if
					SELECT 	count("FALLECIDOS"."CONTRATO") 
					INTO 		:can_fall  
					FROM 	"FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura )  AND ( "FALLECIDOS"."ESTADO_REG" = 'A' )  ;
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',sepultura)
						cant_fall ++
					end if
				end if
				h ++
				hpb_1.minposition 	= 0
				hpb_1.maxposition 	= dw_paso.rowcount() * 80
				hpb_1.position    		= h
				st_1.text 					= string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	elseif dw_paso.dataobject = dw_construdida then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura_nd = dw_paso.getitemstring(i,'campo'+string(j))
				if sepultura_nd <> '0' then
					SELECT 	"INVENTARIO_PLANI"."NUMERO","INVENTARIO_PLANI"."SUB_SECTOR"  
					INTO 		:numero,:sub_sector 
					FROM 	"INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'compute_'+string(j),sepultura_nd)
					else	
						dw_paso.setitem(i,'compute_'+string(j)+'_3',sepultura_nd)
					end if
					if numero <> 10000000 and numero <> 90000000 then
						dw_paso.setitem(i,'campo'+string(j),'0')
					end if
					n_sep = sepultura_nd
					sepultura_nd = mid( sepultura_nd , 1 , len ( sepultura_nd ) -2 )
					SELECT 	count("FALLECIDOS"."CONTRATO") 
					INTO 		:can_fall  
					FROM 	"FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :sub_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura_nd )   AND	( "FALLECIDOS"."ESTADO_REG" = 'A' ) ;
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',n_sep)
						cant_fall ++
					end if
				end if
				h ++
				hpb_1.minposition 	= 0
				hpb_1.maxposition 	= dw_paso.rowcount() * 80
				hpb_1.position    		= h
				st_1.text 					= string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	end if
end if

//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_asig  
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" > 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_9.text = string(cant_inv_asig,'###,###,##0') 
//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_no_asig 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" = 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_10.text = string(cant_inv_no_asig,'###,###,##0') 
//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_t 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_11.text = string (cant_inv_t,'###,###,##0') 
//dw_paso.object.t_17.text = string (cant_fall,'###,###,##0')
//dw_paso.object.t_15.text = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//dw_paso.object.t_16.text = string ( ( cant_inv_no_asig * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//dw_paso.object.t_18.text = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//
//
//st_17.text = string (cant_fall,'###,###,##0')
//st_16.text = string (cant_inv_asig,'###,###,##0')
//st_15.text = string (cant_inv_no_asig,'###,###,##0')
//st_14.text = string (cant_inv_t,'###,###,##0')
//st_18.text = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//st_20.text = string ( ( cant_inv_no_asig * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//st_19.text = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
hpb_1.position = 0
end subroutine

public subroutine wf_sin_asig_con_fall (datawindow dw_paso);long i,j,h,sepultura,can_fall,cant_inv_asig,cant_inv_no_asig,cant_inv_t,cant_fall
string sepultura_nd,sub_sector,n_sep
Double	numero
cant_fall = 0
ddlb_1.SelectItem("100", 1)
dw_plano_sector_parque.Object.DataWindow.Zoom = integer(ddlb_1.text)
if dw_paso.rowcount() > 0 then
	if dw_paso.dataobject = dw_jardin then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura = dw_paso.getitemnumber(i,'campo'+string(j))
				sepultura_nd = string(sepultura)
				if sepultura > 0 then
					SELECT 	"INVENTARIO_PLANI"."NUMERO"  
					INTO 		:numero
					FROM 	"INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'compute_'+string(j),sepultura)
					else
						dw_paso.setitem(i,'campo'+string(j),0)
					end if
					SELECT 	count("FALLECIDOS"."CONTRATO") 
					INTO 		:can_fall  
					FROM 	"FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura )   AND ( "FALLECIDOS"."ESTADO_REG" = 'A' ) ;
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',sepultura)
						cant_fall ++
					else
						dw_paso.setitem(i,'campo'+string(j),0)
					end if
				end if
				h ++
				hpb_1.minposition = 0
				hpb_1.maxposition = dw_paso.rowcount() * 80
				hpb_1.position    = h
				st_1.text = string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	elseif dw_paso.dataobject = dw_construdida then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura_nd = dw_paso.getitemstring(i,'campo'+string(j))
				if sepultura_nd <> '0' then
					SELECT 	"INVENTARIO_PLANI"."NUMERO","INVENTARIO_PLANI"."SUB_SECTOR"  
					INTO 		:numero,:sub_sector 
					FROM 	"INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'compute_'+string(j),sepultura_nd)
					else
						dw_paso.setitem(i,'campo'+string(j),'0')
					end if
					n_sep = sepultura_nd
					sepultura_nd = mid( sepultura_nd , 1 , len ( sepultura_nd ) -2 )
					SELECT 	count("FALLECIDOS"."CONTRATO") 
					INTO 		:can_fall  
					FROM 	"FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :sub_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura_nd )  AND ( "FALLECIDOS"."ESTADO_REG" = 'A' )  ;
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',n_sep)
						cant_fall ++
					else
						dw_paso.setitem(i,'campo'+string(j),'0')
					end if
				end if
				h ++
				hpb_1.minposition = 0
				hpb_1.maxposition = dw_paso.rowcount() * 80
				hpb_1.position    = h
				st_1.text = string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	end if
end if

//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_asig  
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" > 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_9.text = string(cant_inv_asig,'###,###,##0') 
//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_no_asig 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" = 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_10.text = string(cant_inv_no_asig,'###,###,##0') 
//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_t 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_11.text = string (cant_inv_t,'###,###,##0') 
//dw_paso.object.t_17.text = string (cant_fall,'###,###,##0')
//dw_paso.object.t_15.text = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//dw_paso.object.t_16.text = string ( ( cant_inv_no_asig * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//dw_paso.object.t_18.text = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//
//
//st_17.text = string (cant_fall,'###,###,##0')
//st_16.text = string (cant_inv_asig,'###,###,##0')
//st_15.text = string (cant_inv_no_asig,'###,###,##0')
//st_14.text = string (cant_inv_t,'###,###,##0')
//st_18.text = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//st_20.text = string ( ( cant_inv_no_asig * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//st_19.text = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
hpb_1.position = 0
end subroutine

public subroutine wf_pinta_sector (ref datawindow dw_paso);long i,j,h,sepultura,can_fall,cant_inv_asig, cant_inv_no_asig,cant_inv_t,cant_fall,folio,count_reserv
string sepultura_nd,sub_sector,n_sep
Double	numero
cant_fall = 0
ddlb_1.SelectItem("100", 1)
dw_plano_sector_parque.Object.DataWindow.Zoom = integer(ddlb_1.text)
if dw_paso.rowcount() > 0 then
	if dw_paso.dataobject = dw_jardin then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura_nd = string(dw_paso.getitemnumber(i,'campo'+string(j)))
				sepultura = long(sepultura_nd)
				if sepultura > 0 then
					SELECT "INVENTARIO_PLANI"."NUMERO"  
					INTO :numero
					FROM "INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'compute_'+string(j),long(sepultura_nd))
					else	
					end if
					SELECT count("FALLECIDOS"."CONTRATO") 
					INTO :can_fall  
					FROM "FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura_nd )  AND ( "FALLECIDOS"."ESTADO_REG" = 'A' )  ;
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',sepultura)
//						cant_fall ++
						cant_fall = cant_fall + can_fall
					end if
					//--------------------------------------------------------------------------------------------
					SELECT "RESERVA_SEPULTURA"."FOLIO_RESERVA" INTO :folio
					FROM "RESERVA_SEPULTURA"  
					WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) AND  
							( "RESERVA_SEPULTURA"."SEPULTURA" = :sepultura_nd )   and 
         				( "RESERVA_SEPULTURA"."ESTADO" = 1 )  ;
					if sqlca.sqlcode = 0 and folio > 0 then
						dw_paso.setitem(i,'compute_'+string(j),0)
						dw_paso.setitem(i,'compute_'+string(j)+'_1_1',sepultura)
					end if
					//--------------------------------------------------------------------------------------------
				end if
				h ++
				hpb_1.minposition = 0
				hpb_1.maxposition = dw_paso.rowcount() * 80
				hpb_1.position    = h
				st_1.text = string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	elseif dw_paso.dataobject = dw_construdida then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura_nd = dw_paso.getitemstring(i,'campo'+string(j))
				if sepultura_nd <> '0' then
					SELECT "INVENTARIO_PLANI"."NUMERO","INVENTARIO_PLANI"."SUB_SECTOR"  
					INTO :numero,:sub_sector 
					FROM "INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'compute_'+string(j),sepultura_nd)
					else	
						if numero = 10000000 then
							dw_paso.setitem(i,'compute_'+string(j)+'_3',sepultura_nd)
						end if
					end if
					n_sep = sepultura_nd
					sepultura_nd = sepultura_nd//mid( sepultura_nd , 1 , len ( sepultura_nd ) -2 )
					SELECT count("FALLECIDOS"."CONTRATO") 
					INTO :can_fall  
					FROM "FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura_nd )  AND ( "FALLECIDOS"."ESTADO_REG" = 'A' )  ;//sub_sector
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',n_sep)
						cant_fall = cant_fall + can_fall						
//						cant_fall ++
					end if
					SELECT "RESERVA_SEPULTURA"."FOLIO_RESERVA" INTO :folio
					FROM "RESERVA_SEPULTURA"  
					WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) AND  
							( "RESERVA_SEPULTURA"."SEPULTURA" = :n_sep )   and 
         				( "RESERVA_SEPULTURA"."ESTADO" = 1 )  ;
					if sqlca.sqlcode = 0 and folio > 0 then
						dw_paso.setitem(i,'compute_'+string(j),'0')
						dw_paso.setitem(i,'compute_'+string(j)+'_4',n_sep)
					end if					
				end if
				h ++
				hpb_1.minposition = 0
				hpb_1.maxposition = dw_paso.rowcount() * 80
				hpb_1.position    = h
				st_1.text = string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	end if
end if

//SELECT count(*) INTO :count_reserv FROM "RESERVA_SEPULTURA" 
//WHERE ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) AND ( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) ;
//SELECT count(*)  
//INTO :cant_inv_asig  
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" > 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_9.text = string(cant_inv_asig,'###,###,##0') 
//SELECT count(*)  
//INTO :cant_inv_no_asig 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" = 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_10.text = string(cant_inv_no_asig,'###,###,##0') 
//SELECT count(*)  
//INTO :cant_inv_t 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//st_17.text  = string (cant_fall,'###,###,##0')                                                                    //con fallecidos
//st_16.text  = string (cant_inv_asig,'###,###,##0')                                                               //asignadas
//st_15.text  = string (cant_inv_no_asig - count_reserv ,'###,###,##0')                                           //disponibles
//st_102.text = string (count_reserv ,'###,###,##0')                                                             //reservadas
//st_14.text  = string (cant_inv_t,'###,###,##0')                                                               //total sepulturas
//st_18.text  = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0.00' ) +'%'                            // % con fallecidos
//st_20.text  = string ( ( ( cant_inv_no_asig - count_reserv ) * 100 ) / cant_inv_t , '###,###,##0.00' ) +'%' // % disponibles
//st_19.text  = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0.00' ) +'%'                   // % asignadas
//st_101.text = string ( ( count_reserv    * 100 ) / cant_inv_t , '###,###,##0.00' ) +'%'                   // % asignadas
hpb_1.position = 0
end subroutine

public subroutine wf_sin_asig_sin_fall (datawindow dw_paso);long i,j,h,sepultura,can_fall,cant_inv_asig,cant_inv_no_asig,cant_inv_t,cant_fall,cant_reserv
string sepultura_nd,sub_sector,n_sep
Double	numero
cant_fall = 0
ddlb_1.SelectItem("100", 1)
dw_plano_sector_parque.Object.DataWindow.Zoom = integer(ddlb_1.text)
if dw_paso.rowcount() > 0 then
	if dw_paso.dataobject = dw_jardin then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura 		= dw_paso.getitemnumber(i,'campo'+string(j))
				sepultura_nd 	= string(sepultura)
				if sepultura > 0 then
					SELECT 	"INVENTARIO_PLANI"."NUMERO"  
					INTO 		:numero
					FROM 	"INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'compute_'+string(j),sepultura)
					else
						dw_paso.setitem(i,'campo'+string(j),0)
					end if
					SELECT 	count("FALLECIDOS"."CONTRATO") 
					INTO 		:can_fall  
					FROM 	"FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura )  AND ( "FALLECIDOS"."ESTADO_REG" = 'A' )  ;
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',sepultura)
						cant_fall ++
						dw_paso.setitem(i,'campo'+string(j),0)
					end if
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------					
					SELECT 	count(1) into :cant_reserv 
					FROM 	"RESERVA_SEPULTURA"  
					WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) AND 
							  ( "RESERVA_SEPULTURA"."SEPULTURA" = :sepultura ) AND 
							  ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) ;
					if sqlca.sqlcode = 0 and cant_reserv > 0 then
						dw_paso.setitem(i,'campo'+string(j),0)
					end if
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------					
				end if
				h ++
				hpb_1.minposition 	= 0
				hpb_1.maxposition 	= dw_paso.rowcount() * 80
				hpb_1.position    		= h
				st_1.text 					= string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	elseif dw_paso.dataobject = dw_construdida then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura_nd = dw_paso.getitemstring(i,'campo'+string(j))
				if sepultura_nd <> '0' then
					SELECT 	"INVENTARIO_PLANI"."NUMERO","INVENTARIO_PLANI"."SUB_SECTOR"  
					INTO 		:numero,:sub_sector 
					FROM 	"INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'compute_'+string(j),sepultura_nd)
					else
						dw_paso.setitem(i,'campo'+string(j),'0')
					end if
					n_sep 			= sepultura_nd
					sepultura_nd 	= mid( sepultura_nd , 1 , len ( sepultura_nd ) -2 )
					SELECT 	count("FALLECIDOS"."CONTRATO") 
					INTO 		:can_fall  
					FROM 	"FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :sub_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura_nd )  AND ( "FALLECIDOS"."ESTADO_REG" = 'A' )  ;
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',n_sep)
						dw_paso.setitem(i,'campo'+string(j),'0')
						cant_fall ++
					end if
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------					
					SELECT count(1) into :cant_reserv 
					FROM 	"RESERVA_SEPULTURA"  
					WHERE ( "RESERVA_SEPULTURA"."SECTOR" = :gs_sector ) AND 
							  ( "RESERVA_SEPULTURA"."SEPULTURA" = :n_sep ) AND 
							  ( "RESERVA_SEPULTURA"."ESTADO" = 1 ) ;
					if sqlca.sqlcode = 0 and cant_reserv > 0 then
							dw_paso.setitem(i,'campo'+string(j),'0')
					end if
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------					
				end if
				h ++
				hpb_1.minposition 	= 0
				hpb_1.maxposition 	= dw_paso.rowcount() * 80
				hpb_1.position    		= h
				st_1.text 					= string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	end if
end if
hpb_1.position = 0
end subroutine

public subroutine wf_asig_con_fall (datawindow dw_paso);long i,j,h,sepultura,can_fall,cant_inv_asig,cant_inv_no_asig,cant_inv_t,cant_fall
string sepultura_nd,sub_sector,n_sep
Double	numero
cant_fall = 0
ddlb_1.SelectItem("100", 1)
dw_plano_sector_parque.Object.DataWindow.Zoom = integer(ddlb_1.text)
if dw_paso.rowcount() > 0 then
	if dw_paso.dataobject = dw_jardin then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura = dw_paso.getitemnumber(i,'campo'+string(j))
				if sepultura > 0 then
					SELECT "INVENTARIO_PLANI"."NUMERO"  
					INTO :numero
					FROM "INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'campo'+string(j),0)
					end if
					SELECT count("FALLECIDOS"."CONTRATO") 
					INTO :can_fall  
					FROM "FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura )  AND ( "FALLECIDOS"."ESTADO_REG" = 'A' )  ;
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',sepultura)
						cant_fall ++
					else
						dw_paso.setitem(i,'campo'+string(j),0)
					end if
				end if
				h ++
				hpb_1.minposition = 0
				hpb_1.maxposition = dw_paso.rowcount() * 80
				hpb_1.position    = h
				st_1.text = string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	elseif dw_paso.dataobject = dw_construdida then
		for i = 1 to dw_paso.rowcount()
			for j = 1 to 80
				sepultura_nd = dw_paso.getitemstring(i,'campo'+string(j))
				if sepultura_nd <> '0' then
					SELECT "INVENTARIO_PLANI"."NUMERO","INVENTARIO_PLANI"."SUB_SECTOR"  
					INTO :numero,:sub_sector 
					FROM "INVENTARIO_PLANI"  
					WHERE ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )   ;
					if sqlca.sqlcode = 0 and numero = 0 then
						dw_paso.setitem(i,'campo'+string(j),'0')
					end if
					n_sep = sepultura_nd
					sepultura_nd = mid( sepultura_nd , 1 , len ( sepultura_nd ) -2 )
					SELECT count("FALLECIDOS"."CONTRATO") 
					INTO :can_fall  
					FROM "FALLECIDOS"  
					WHERE ( "FALLECIDOS"."SECTOR" = :sub_sector ) AND ( "FALLECIDOS"."N_SEP" = :sepultura_nd )  AND ( "FALLECIDOS"."ESTADO_REG" = 'A' )  ;
					if sqlca.sqlcode = 0 and can_fall > 0 then
						dw_paso.setitem(i,'compute_'+string(j)+'_1',n_sep)
						cant_fall ++
					else
						dw_paso.setitem(i,'campo'+string(j),'0')
					end if
				end if
				h ++
				hpb_1.minposition = 0
				hpb_1.maxposition = dw_paso.rowcount() * 80
				hpb_1.position    = h
				st_1.text = string(round(h * 100 / (dw_paso.rowcount() * 80),0))+'%'
			next
		next
	end if
end if

dw_paso.accepttext ()

//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_asig  
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" > 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_9.text = string(cant_inv_asig,'###,###,##0') 
//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_no_asig 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."NUMERO" = 0 ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_10.text = string(cant_inv_no_asig,'###,###,##0') 
//SELECT count("INVENTARIO_PLANI"."BASE")  
//INTO :cant_inv_t 
//FROM "INVENTARIO_PLANI"  
//WHERE ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) ; 
//dw_paso.object.t_11.text = string (cant_inv_t,'###,###,##0') 
//dw_paso.object.t_17.text = string (cant_fall,'###,###,##0')
//dw_paso.object.t_15.text = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//dw_paso.object.t_16.text = string ( ( cant_inv_no_asig * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//dw_paso.object.t_18.text = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//
//st_17.text = string (cant_fall,'###,###,##0')
//st_16.text = string (cant_inv_asig,'###,###,##0')
//st_15.text = string (cant_inv_no_asig,'###,###,##0')
//st_14.text = string (cant_inv_t,'###,###,##0')
//st_18.text = string ( ( cant_fall * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//st_20.text = string ( ( cant_inv_no_asig * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
//st_19.text = string ( ( cant_inv_asig    * 100 ) / cant_inv_t , '###,###,##0' ) +'%'
hpb_1.position = 0
end subroutine

on w_plano_sector_parque.create
this.pb_mostrar_mapa=create pb_mostrar_mapa
this.ddlb_parque=create ddlb_parque
this.pb_105=create pb_105
this.pb_103=create pb_103
this.pb_12=create pb_12
this.st_40=create st_40
this.dw_1=create dw_1
this.st_parque=create st_parque
this.pb_11=create pb_11
this.cb_2=create cb_2
this.pb_10=create pb_10
this.shl_1=create shl_1
this.st_7=create st_7
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_7=create pb_7
this.cb_1=create cb_1
this.st_10=create st_10
this.pb_6=create pb_6
this.st_22=create st_22
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_2=create st_2
this.cb_8=create cb_8
this.st_21=create st_21
this.ddlb_2=create ddlb_2
this.cb_4=create cb_4
this.ddplb_1=create ddplb_1
this.ddlb_1=create ddlb_1
this.gb_2=create gb_2
this.hpb_1=create hpb_1
this.st_1=create st_1
this.gb_3=create gb_3
this.gb_9=create gb_9
this.dw_plano_sector_parque=create dw_plano_sector_parque
this.gb_4=create gb_4
this.gb_6=create gb_6
this.gb_58=create gb_58
this.Control[]={this.pb_mostrar_mapa,&
this.ddlb_parque,&
this.pb_105,&
this.pb_103,&
this.pb_12,&
this.st_40,&
this.dw_1,&
this.st_parque,&
this.pb_11,&
this.cb_2,&
this.pb_10,&
this.shl_1,&
this.st_7,&
this.pb_9,&
this.pb_8,&
this.pb_7,&
this.cb_1,&
this.st_10,&
this.pb_6,&
this.st_22,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_2,&
this.cb_8,&
this.st_21,&
this.ddlb_2,&
this.cb_4,&
this.ddplb_1,&
this.ddlb_1,&
this.gb_2,&
this.hpb_1,&
this.st_1,&
this.gb_3,&
this.gb_9,&
this.dw_plano_sector_parque,&
this.gb_4,&
this.gb_6,&
this.gb_58}
end on

on w_plano_sector_parque.destroy
destroy(this.pb_mostrar_mapa)
destroy(this.ddlb_parque)
destroy(this.pb_105)
destroy(this.pb_103)
destroy(this.pb_12)
destroy(this.st_40)
destroy(this.dw_1)
destroy(this.st_parque)
destroy(this.pb_11)
destroy(this.cb_2)
destroy(this.pb_10)
destroy(this.shl_1)
destroy(this.st_7)
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.cb_1)
destroy(this.st_10)
destroy(this.pb_6)
destroy(this.st_22)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.cb_8)
destroy(this.st_21)
destroy(this.ddlb_2)
destroy(this.cb_4)
destroy(this.ddplb_1)
destroy(this.ddlb_1)
destroy(this.gb_2)
destroy(this.hpb_1)
destroy(this.st_1)
destroy(this.gb_3)
destroy(this.gb_9)
destroy(this.dw_plano_sector_parque)
destroy(this.gb_4)
destroy(this.gb_6)
destroy(this.gb_58)
end on

event open;string 	sql,ls_depto,ls_descrip_parque,ls_parque,ls_text_parque
long 		i, ll_parque,ll_codigo

gs_ventana = 'w_plano_sector_parque'
f_valida_objeto()
ddlb_2.reset()
dw_1.settransobject(sqlca)
dw_1.retrieve()
title = gs_app_name	//'Planimetria 6.02  (11/05/2007)'
//if gs_empresa 	= 'El Prado' then
//	id_parque 			= 1
//	pb_11.visible 		= true
//	pb_103.visible 		= true
//	pb_105.visible 		= true
//	sql 					= 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = '+string(id_parque)+' ORDER BY "BASE_PLANI"."AREA" ASC'   
//	f_ddlb_all(ddlb_2,sql)
//	dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo'
//	dw_plano_sector_parque.Object.p_1.Filename = "plano_prado.jpg"//"prado_plano.bmp"
//elseif gs_empresa 	= 'La Foresta' then
//	id_parque 			= 11
//	pb_11.visible 		= false
//	pb_103.visible 		= false
//	pb_105.visible 		= false
//	sql 					= 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = '+string(id_parque)+' ORDER BY "BASE_PLANI"."AREA" ASC'   
//	f_ddlb_all(ddlb_2,sql)
//	dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_serena'
//	dw_plano_sector_parque.Object.p_1.Filename = "plano_serena.bmp"//'Foresta_new6.bmp'
//elseif gs_empresa = 'Concepcion' then
//	pb_1.picturename 	= 'logo_parque_conce.bmp'
//	id_parque 			= 801
//	pb_11.visible 		= false
//	pb_103.visible 		= false
//	pb_105.visible 		= false
//	sql 					= 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = '+string(id_parque)+' ORDER BY "BASE_PLANI"."AREA" ASC'   
//	f_ddlb_all(ddlb_2,sql)
//	dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_conce'
//	dw_plano_sector_parque.Object.p_1.Filename = "plano_conce.jpg"
//end if
//**************************************************************************************************
//if ls_depto = 'S' and ll_parque = 1 then 
//	pb_1.enabled  		= true
//	pb_1.visible  		= true
//	pb_11.enabled 		= false
//	pb_11.visible 		= false
//	pb_103.visible		= false
//	pb_105.visible		= false
//	pb_103.enabled	= false
//	pb_105.enabled	= false
//	pb_1.triggerevent (clicked!)
//elseif ls_depto = 'S' and ll_parque = 102 then 
//	pb_1.enabled  		= false
//	pb_1.visible  		= false
//	pb_11.enabled 		= true
//	pb_11.visible 		= true
//	pb_103.visible  		= false
//	pb_105.visible  		= false
//	pb_103.enabled	= false
//	pb_105.enabled	= false
//	pb_11.triggerevent (clicked!)
//elseif ls_depto = 'S' and ll_parque = 103 then 
//	pb_1.enabled  		= false
//	pb_1.visible  		= false
//	pb_11.enabled 		= false
//	pb_11.visible 		= false
//	pb_103.visible  		= true
//	pb_105.visible  		= true
//	pb_103.enabled 	= true
//	pb_105.enabled 	= true
//	pb_105.triggerevent (clicked!)
//elseif ls_depto='S' and (ll_parque = 801 or ll_parque=11) then
//	pb_1.enabled  		= true
//	pb_1.visible  		= true
//	pb_11.enabled 		= false
//	pb_11.visible 		= false
//	pb_103.visible  		= false
//	pb_105.visible  		= false
//	pb_103.enabled	= false
//	pb_105.enabled	= false
//	pb_1.triggerevent (clicked!)
//end if
//**************************************************************************************************
dw_plano_sector_parque.insertrow(0)
dw_plano_sector_parque.Object.DataWindow.Zoom = 100
//-----------------------------------------
dw_jardin      			= 'dw_plano_sector_parque_retrieve'//'dw_plano_sector_parque1_1'
dw_construdida 		= 'dw_plano_sector_parque_retrieve_paint'//'dw_plano_sector_parque2_2'
//-----------------------------------------
st_7.text = '100%'
st_parque.text = string(id_parque)
for i = 1 to 12
	dw_1.insertrow(0)
	dw_1.setitem(i,'estado',i)
	CHOOSE CASE i
		CASE 1
			dw_1.setitem(i,'glosa','Asig.')
		CASE 2
			dw_1.setitem(i,'glosa','Asig.c/fall')
		CASE 3
			dw_1.setitem(i,'glosa','Disp.')
		CASE 4
			dw_1.setitem(i,'glosa','Disp.c/fall')
		CASE 5
			dw_1.setitem(i,'glosa','Reserv.')
		CASE 6
			dw_1.setitem(i,'glosa','Reserv.c/fall')
		CASE 7
			dw_1.setitem(i,'glosa','Indiv')
		CASE 8
			dw_1.setitem(i,'glosa','Indiv.c/fall')
		CASE 9
			dw_1.setitem(i,'glosa','Resc.')
		CASE 10
			dw_1.setitem(i,'glosa','Resc.c/fall')
		CASE 11
			dw_1.setitem(i,'glosa','Todo')
		CASE 12
			dw_1.setitem(i,'glosa','Reser.Técnica')
	END CHOOSE
next
dw_1.accepttext ()
dw_1.setsort('estado D')
dw_1.sort()
ddlb_parque.reset()
SELECT COD_PARQUE into :ll_parque FROM ENCARGADOS WHERE CODIGO_USUARIO = :gs_user ;
//if gs_depto='S' then
if gs_depto<>'I' and ll_parque <> 9999 then
	DECLARE	x3 CURSOR FOR  
	SELECT 	"COD_PARQ"."CODIGO",   
				"COD_PARQ"."NOMBRE"  
	FROM 	"COD_PARQ"  
	WHERE 	"COD_PARQ"."CODIGO" = :ll_parque  AND "COD_PARQ"."CODIGO" <> 106 and "COD_PARQ"."CODIGO" <> 142 and "COD_PARQ"."CODIGO" <> 130
	USING	sqlca;
	open x3;
	DO WHILE sqlca.sqlcode=0
		fetch x3 into :ll_codigo, :ls_descrip_parque;
		if not isnull(ll_codigo) and ll_codigo>0 then
			ls_parque					= string(ll_codigo)+' - '+ls_descrip_parque
			ddlb_parque.additem(ls_parque)
			if ll_codigo = ll_parque then
				ddlb_parque.text		= ls_parque
			end if
		end if
		setnull(ll_codigo);setnull(ls_descrip_parque);setnull(ls_parque)
	LOOP
	close x3;
else
	DECLARE	x4 CURSOR FOR  
	SELECT 	"COD_PARQ"."CODIGO",   
				"COD_PARQ"."NOMBRE"  
	FROM 	"COD_PARQ"  
	WHERE 	"COD_PARQ"."GRUPO" = 1  AND "COD_PARQ"."CODIGO" <> 106 and "COD_PARQ"."CODIGO" <> 142 and "COD_PARQ"."CODIGO" <> 130
	USING	sqlca;
	open x4;
	DO WHILE sqlca.sqlcode=0
		fetch x4 into :ll_codigo, :ls_descrip_parque;
		if not isnull(ll_codigo) and ll_codigo>0 then
			ls_parque					= trim(string(ll_codigo)+' - '+ls_descrip_parque)
			ddlb_parque.additem(ls_parque)
		end if
		setnull(ll_codigo);setnull(ls_descrip_parque);setnull(ls_parque)
	LOOP
	close x4;
	if gs_empresa = 'El Prado' then
		ddlb_parque.text				= '1 - EL PRADO'
		ddlb_parque.additem('103 - SANTIAGO 2')
	elseif gs_empresa = 'La Foresta' then
		ddlb_parque.text				= '11 - LA FORESTA'
	end if
end if
if gs_empresa = 'El Prado' and ll_parque=103 then
	ddlb_parque.additem('103 - SANTIAGO 2')
end if
//ls_text_parque							= trim(ddlb_parque.text)
//if isnull(ls_text_parque) or ls_text_parque='' then
//	if gs_empresa = 'El Prado' then
//		ddlb_parque.text				= '1 - EL PRADO'
//	elseif gs_empresa = 'La Foresta' then
//		ddlb_parque.text				= '11 - LA FORESTA'
//	end if
//end if
pb_mostrar_mapa.triggerevent(clicked!)
end event

event resize;dw_plano_sector_parque.x = 10
dw_plano_sector_parque.Height = this.Height - 170 - dw_plano_sector_parque.y
st_2.y  = dw_plano_sector_parque.Height + dw_plano_sector_parque.y + 5
hpb_1.y = dw_plano_sector_parque.Height + dw_plano_sector_parque.y + 5
st_1.y  = dw_plano_sector_parque.Height + dw_plano_sector_parque.y + 5
dw_plano_sector_parque.Width   = this.Width - 50
hpb_1.Width = this.Width - 400
st_1.x      = dw_plano_sector_parque.Width - 145
gb_9.Width  = this.Width - 2700
st_21.Width = this.Width - 2780
gb_4.Width  = this.Width - 2700
st_22.Width = this.Width - 2780
end event

event mousemove;st_10.visible =  false
end event

event timer;//datetime fecha
//
//select distinct sysdate into:fecha from agentes;
//this.title = 'Planimetria 5.25'+space(10)+'( fecha Hora Servidor: '+string(fecha,'dd/mm/yyyy hh:mm:ss')+' )'
end event

type pb_mostrar_mapa from picturebutton within w_plano_sector_parque
integer x = 2377
integer y = 108
integer width = 123
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ubicacion.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_pos,i,ll_parque_asig
String		ls_cod_parque,ls_descrip_parque,sql,ls_depto_asig,ls_imagen,ls_dw,ls_pasa='S'

ll_pos						= pos(ddlb_parque.text,'-')
ls_cod_parque			= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
id_parque				= long(ls_cod_parque)
gl_cod_parque_cta	= id_parque
if gl_cod_parque_cta <> 9999 then
	ls_descrip_parque		= trim(mid(ddlb_parque.text,(ll_pos + 1)))
	SELECT COD_PARQUE, DEPTO into :ll_parque_asig,:ls_depto_asig FROM ENCARGADOS WHERE CODIGO_USUARIO = :gs_user ;
	st_10.visible 			= false
	dw_plano_sector_parque.reset()
	ddlb_2.reset()
	ddplb_1.reset()
	if ls_depto_asig='S' then
		if id_parque = ll_parque_asig then
			ls_pasa									= 'S'
			
		else
			messagebox("Advertencia","Ud. No tiene Acceso Planimetria Parque "+ls_descrip_parque)
			ls_pasa									= 'N'
		end if
	else
		ll_parque_asig								= id_parque
	end if
	if ls_pasa='S' then
		dw_plano_sector_parque.enabled		= true
		SELECT	"MEMBRETE_EMPRESA"."DW_PLANIMETRIA",   
					"MEMBRETE_EMPRESA"."NOMBRE_IMAGEN_PLANIMETRIA"  
		INTO 		:ls_dw,   
					:ls_imagen  
		FROM 	"MEMBRETE_EMPRESA"  
		WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :id_parque   ;
		if id_parque = 103 and ls_descrip_parque='SANTIAGO'  and id_parque = ll_parque_asig then	//'Santiago' 
			sql = "SELECT DISTINCT BASE_PLANI.AREA FROM BASE_PLANI WHERE BASE_PLANI.COD_PARQUE = 103 AND SUBSTR(BASE_PLANI.AREA,1,1) = 'A' ORDER BY BASE_PLANI.AREA ASC"   
		elseif id_parque = 103 and ls_descrip_parque='SANTIAGO 2'  and id_parque = ll_parque_asig then	//'Santiago2' 
			sql = "SELECT DISTINCT BASE_PLANI.AREA FROM BASE_PLANI WHERE BASE_PLANI.COD_PARQUE = 103 AND SUBSTR(BASE_PLANI.AREA,1,1) = 'P' ORDER BY BASE_PLANI.AREA ASC"  
			SELECT	"MEMBRETE_EMPRESA"."DW_PLANIMETRIA",   
						"MEMBRETE_EMPRESA"."NOMBRE_IMAGEN_PLANIMETRIA"  
			INTO 		:ls_dw,   
						:ls_imagen  
			FROM 	"MEMBRETE_EMPRESA"  
			WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = 106   ;
		elseif id_parque=1 and id_parque = ll_parque_asig then		// El Prado
			sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = '+string(id_parque)+' ORDER BY "BASE_PLANI"."AREA" ASC'   
		elseif id_parque=11  and id_parque = ll_parque_asig then	// La Foresta
			sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = 11 ORDER BY "BASE_PLANI"."AREA" ASC'   
		elseif id_parque=101  and id_parque = ll_parque_asig then	// Canaan
			sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = 101 ORDER BY "BASE_PLANI"."AREA" ASC'   
		elseif id_parque = 102 and id_parque = ll_parque_asig then	//'El Manantial'
			sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = 102 ORDER BY "BASE_PLANI"."AREA" ASC'   
		elseif id_parque = 801  and id_parque = ll_parque_asig then	//'Concepcion'
			sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = 801 ORDER BY "BASE_PLANI"."AREA" ASC'   
		end if
		f_ddlb_all(ddlb_2,sql)
		dw_plano_sector_parque.dataobject 					= ls_dw
		dw_plano_sector_parque.Object.p_1.Filename 	= ls_imagen
		dw_plano_sector_parque.settransobject(sqlca)
		dw_plano_sector_parque.insertrow(0)
		ddlb_1.SelectItem('100', 0)
		dw_plano_sector_parque.Object.DataWindow.Zoom = 100
		st_21.text 		= ''
		st_1.text 			= ''
		setnull(gi_numero)
		setnull(gs_sector)
		setnull(gs_base)
		setnull(gs_serie)
		setnull(gi_numero)
		setnull(gi_rut)
		st_7.text 			= '100%'
		st_parque.text 	= string(id_parque)
	end if
end if
end event

type ddlb_parque from dropdownlistbox within w_plano_sector_parque
integer x = 1678
integer y = 108
integer width = 686
integer height = 656
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if not isnull(ddlb_parque.text) and ddlb_parque.text<>'' then pb_mostrar_mapa.triggerevent(clicked!)
end event

type pb_105 from picturebutton within w_plano_sector_parque
event movemause pbm_mousemove
boolean visible = false
integer x = 4389
integer y = 196
integer width = 137
integer height = 108
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
string pointer = "HyperLink!"
boolean enabled = false
string text = "2"
string picturename = "logo_parque_stgo.bmp"
string disabledname = "boton_parque_stgo2.bmp"
end type

event movemause;st_10.visible 	=  true
st_10.text 		= 'Volver Plano Santiago 2'
st_10.x 			= 2112
st_10.y 			= 360
end event

event clicked;string sql
integer i

st_10.visible = false
dw_plano_sector_parque.reset()
ddlb_2.reset()
ddplb_1.reset()
if gs_empresa = 'El Prado' then
	id_parque = 103
	ddlb_2.reset()
	sql = "SELECT DISTINCT BASE_PLANI.AREA FROM BASE_PLANI WHERE BASE_PLANI.COD_PARQUE = 103 AND SUBSTR(BASE_PLANI.AREA,1,1) = 'P' ORDER BY BASE_PLANI.AREA ASC"  
//	sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = 103 ORDER BY "BASE_PLANI"."AREA" ASC'   
	f_ddlb_all(ddlb_2,sql)
	dw_plano_sector_parque.dataobject 					= 'dw_prueba_dibujo_santiago2'
	dw_plano_sector_parque.Object.p_1.Filename 	= 'mapa_santiago2.jpg'
elseif gs_empresa = 'La Foresta' then
	id_parque = 11
	dw_plano_sector_parque.dataobject 					= 'dw_prueba_dibujo_serena'
	dw_plano_sector_parque.Object.p_1.Filename 	= "plano_serena.bmp"//"prado_plano.bmp"	
elseif gs_empresa = 'Santiago' then
	id_parque = 103
	dw_plano_sector_parque.dataobject 					= 'dw_prueba_dibujo_santiago'
	dw_plano_sector_parque.Object.p_1.Filename 	= "mapa_santiago.png"
elseif gs_empresa = 'Concepcion' then
	id_parque = 801
	dw_plano_sector_parque.dataobject 					= 'dw_prueba_dibujo_conce'
	dw_plano_sector_parque.Object.p_1.Filename 	= "plano_conce.jpg"
end if
gl_cod_parque_cta	= id_parque
dw_plano_sector_parque.insertrow(0)
ddlb_1.SelectItem('100', 0)
dw_plano_sector_parque.Object.DataWindow.Zoom = 100
//sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" ORDER BY "BASE_PLANI"."AREA" ASC'   
//f_ddlb_all(ddlb_2,sql)
st_21.text = ''
st_1.text = ''
setnull(gi_numero)
setnull(gs_sector)
setnull(gs_base)
setnull(gs_serie)
setnull(gi_numero)
setnull(gi_rut)
//------------
//wf_porcentajes()
st_7.text = '100%'
//cb_10.enabled = false
st_parque.text = string(id_parque)
end event

type pb_103 from picturebutton within w_plano_sector_parque
event movemause pbm_mousemove
boolean visible = false
integer x = 4389
integer y = 80
integer width = 137
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean enabled = false
string picturename = "logo_parque_stgo.bmp"
string disabledname = "boton_parque_stgo.bmp"
alignment htextalign = left!
end type

event movemause;st_10.visible 	=  true
st_10.text 		= 'Volver Plano Santiago'
st_10.x 			= 2112
st_10.y 			= 56
end event

event clicked;string sql
integer i

st_10.visible = false
dw_plano_sector_parque.reset()
ddlb_2.reset()
ddplb_1.reset()
if gs_empresa = 'El Prado' then
	id_parque = 103
	ddlb_2.reset()
	sql = "SELECT DISTINCT BASE_PLANI.AREA FROM BASE_PLANI WHERE BASE_PLANI.COD_PARQUE = 103 AND SUBSTR(BASE_PLANI.AREA,1,1) = 'A' ORDER BY BASE_PLANI.AREA ASC"   
	f_ddlb_all(ddlb_2,sql)
	dw_plano_sector_parque.dataobject 				= 'dw_prueba_dibujo_santiago'
	dw_plano_sector_parque.Object.p_1.Filename 	= 'mapa_santiago.png'
elseif gs_empresa = 'La Foresta' then
	id_parque = 11
	dw_plano_sector_parque.dataobject 				= 'dw_prueba_dibujo_serena'
	dw_plano_sector_parque.Object.p_1.Filename 	= "plano_serena.bmp"//"prado_plano.bmp"	
elseif gs_empresa = 'Santiago' then
	id_parque = 103
	dw_plano_sector_parque.dataobject 				= 'dw_prueba_dibujo_santiago'
	dw_plano_sector_parque.Object.p_1.Filename 	= "mapa_santiago.png"
elseif gs_empresa = 'Concepcion' then
	id_parque = 801
	dw_plano_sector_parque.dataobject 					= 'dw_prueba_dibujo_conce'
	dw_plano_sector_parque.Object.p_1.Filename 	= "plano_conce.jpg"
end if
gl_cod_parque_cta	= id_parque
dw_plano_sector_parque.insertrow(0)
ddlb_1.SelectItem('100', 0)
dw_plano_sector_parque.Object.DataWindow.Zoom = 100
//sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" ORDER BY "BASE_PLANI"."AREA" ASC'   
//f_ddlb_all(ddlb_2,sql)
st_21.text = ''
st_1.text = ''
setnull(gi_numero)
setnull(gs_sector)
setnull(gs_base)
setnull(gs_serie)
setnull(gi_numero)
setnull(gi_rut)
//------------
//wf_porcentajes()
st_7.text = '100%'
//cb_10.enabled = false
st_parque.text = string(id_parque)
end event

type pb_12 from picturebutton within w_plano_sector_parque
event mousemove pbm_mousemove
integer x = 1184
integer y = 132
integer width = 151
integer height = 120
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Egreso (o).BMP"
string disabledname = "Egreso (o).BMP"
alignment htextalign = left!
end type

event mousemove;st_10.visible =  true
st_10.text = 'Desbloquear Reserva'
st_10.x = 960
st_10.y = 64




end event

event clicked;st_10.visible = false
open(w_desbloqueo_reserv)
end event

type st_40 from statictext within w_plano_sector_parque
boolean visible = false
integer x = 2112
integer y = 468
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "actualiza"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event clicked;string sector,tipo,ret_sector
long capacidad

SetPointer(HourGlass!)
dw_jardin      		= 'dw_plano_sector_parque_retrieve'
dw_construdida 	= 'dw_plano_sector_parque_retrieve_paint'

gs_sector = trim(ddplb_1.text)
SELECT distinct "PLANO_PARQUE_CONST"."SECTOR" 
INTO 		:ret_sector 
FROM 	"PLANO_PARQUE_CONST"  
WHERE 	"PLANO_PARQUE_CONST"."SECTOR" = :gs_sector  and "PLANO_PARQUE_CONST"."COD_PARQUE" = :id_parque ;
if sqlca.sqlcode = 0 then
	dw_plano_sector_parque.dataobject = dw_construdida
	DECLARE sp_plani_const_paint PROCEDURE FOR SP_PLANIMETRIA_CONST_PAINT_PP(:gs_sector,:id_parque,'0' ) ;
	execute sp_plani_const_paint;
	dw_plano_sector_parque.settransobject(sqlca)
	dw_plano_sector_parque.retrieve(gs_sector,id_parque)
	dw_plano_sector_parque.setsort( "correlativo A")
	dw_plano_sector_parque.sort( )
else
	dw_plano_sector_parque.dataobject = dw_jardin
	DECLARE sp_plani_paint PROCEDURE FOR SP_PLANIMETRIA_PAINT_PP(:gs_sector,:id_parque,0 ) ;
	execute sp_plani_paint;
	dw_plano_sector_parque.settransobject(sqlca)
	dw_plano_sector_parque.retrieve(gs_sector,id_parque)
	dw_plano_sector_parque.setsort( "correlativo A")
	dw_plano_sector_parque.sort( )
end if
if dw_plano_sector_parque.dataobject = 'dw_plano_sector_parque1_1' or&
	dw_plano_sector_parque.dataobject = 'dw_plano_sector_parque2_2' then
	dw_plano_sector_parque.object.t_21.text = 'User: '+gs_user
end if
SetPointer(arrow!)
end event

type dw_1 from datawindow within w_plano_sector_parque
integer x = 101
integer y = 104
integer width = 521
integer height = 312
integer taborder = 50
string title = "none"
string dataobject = "dw_estado_colores"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event clicked;string		sector,tipo,ret_sector,parque, s_i,ls_descrip_parque
long 		capacidad,si,i,ll_pos,s_i2
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	i 		= getitemnumber(row,1)
	if i = 11 then i = 0
	s_i 	= string(i)
	s_i2	= i
	if dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_manantial' and &
		dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and &
		dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce' and &
		dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan' then
		si 						= 0
		parque 				= string(id_parque)
		dw_jardin      		= 'dw_plano_sector_parque_retrieve'
		dw_construdida 	= 'dw_plano_sector_parque_retrieve_paint'
		st_7.text 				= '100%'
		SetPointer(HourGlass!)
		SELECT distinct "PLANO_PARQUE_CONST"."SECTOR" INTO :ret_sector FROM "PLANO_PARQUE_CONST"  
		WHERE "PLANO_PARQUE_CONST"."SECTOR" = :gs_sector AND "PLANO_PARQUE_CONST"."COD_PARQUE" = :id_parque  ;
		if sqlca.sqlcode = 0 then
			dw_plano_sector_parque.dataobject = dw_construdida
			DECLARE sp_plani_const_paint PROCEDURE FOR SP_PLANIMETRIA_CONST_PAINT_PP(:gs_sector,:id_parque,:i ) ;
			execute sp_plani_const_paint;
			dw_plano_sector_parque.settransobject(sqlca)
			if dw_plano_sector_parque.retrieve(gs_sector,id_parque,'C') > 0 then
				dw_plano_sector_parque.setsort( "correlativo A")
				dw_plano_sector_parque.sort( )
				si ++
			else
				dw_plano_sector_parque.dataobject = 'dw_no_hay_datos'
			end if
		else
			dw_plano_sector_parque.dataobject = dw_jardin
			DECLARE sp_plani_paint PROCEDURE FOR SP_PLANIMETRIA_PAINT_PP(:gs_sector,:id_parque,:s_i2 ) ;
			execute sp_plani_paint;
			if sqlca.sqlcode = -1 then
				MessageBox("SQL error", SQLCA.SQLErrText)
			end if
			dw_plano_sector_parque.settransobject(sqlca)
			if dw_plano_sector_parque.retrieve(gs_sector,id_parque,'T') > 0 then
				dw_plano_sector_parque.setsort( "correlativo A")
				dw_plano_sector_parque.sort()
				si ++
			else
				dw_plano_sector_parque.dataobject = 'dw_no_hay_datos'
			end if
		end if
		SetPointer(arrow!)
		if si > 0 then
			dw_plano_sector_parque.object.t_21.text 		= 'User: '+gs_user
			ll_pos														= pos(ddlb_parque.text,'-')
			ls_descrip_parque										= trim(mid(ddlb_parque.text,(ll_pos + 1)))
			dw_plano_sector_parque.object.t_20.text 		= 'Parque '+ls_descrip_parque
		end if
	else
		messagebox('Debe Seleccionar Sector','Debe Seleccionar Sector para aplicar Filtros', information!)
	end if
end if
end event

type st_parque from statictext within w_plano_sector_parque
boolean visible = false
integer x = 1733
integer y = 496
integer width = 105
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_11 from picturebutton within w_plano_sector_parque
event movemause pbm_mousemove
boolean visible = false
integer x = 4389
integer y = 320
integer width = 137
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean enabled = false
string picturename = "logo_manantial_r.jpg"
string disabledname = "manantial_off.JPG"
alignment htextalign = left!
end type

event movemause;st_10.visible 	=  true
st_10.text 		= 'Volver Plano El Manantial'
st_10.x 			= 1426
st_10.y 			= 360

end event

event clicked;string sql
integer i

st_10.visible = false
dw_plano_sector_parque.reset()
ddlb_2.reset()
ddplb_1.reset()
if gs_empresa = 'El Prado' then
	id_parque = 102
	ddlb_2.reset()
	sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = 102 ORDER BY "BASE_PLANI"."AREA" ASC'   
	f_ddlb_all(ddlb_2,sql)
	dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_manantial'
	dw_plano_sector_parque.Object.p_1.Filename = 'plano_manantial.jpg'	
elseif gs_empresa = 'La Foresta' then
	id_parque = 11
	dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_serena'
	dw_plano_sector_parque.Object.p_1.Filename = "plano_serena.bmp"//"prado_plano.bmp"	
elseif gs_empresa = 'Santiago' then
	id_parque = 103
	dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_santiago'
	dw_plano_sector_parque.Object.p_1.Filename = "mapa_santiago.png"
elseif gs_empresa = 'Concepcion' then
	id_parque = 801
	dw_plano_sector_parque.dataobject 					= 'dw_prueba_dibujo_conce'
	dw_plano_sector_parque.Object.p_1.Filename 	= "plano_conce.jpg"
end if
gl_cod_parque_cta	= id_parque
dw_plano_sector_parque.insertrow(0)
ddlb_1.SelectItem('100', 0)
dw_plano_sector_parque.Object.DataWindow.Zoom = 100
//sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" ORDER BY "BASE_PLANI"."AREA" ASC'   
//f_ddlb_all(ddlb_2,sql)
st_21.text = ''
st_1.text = ''
setnull(gi_numero)
setnull(gs_sector)
setnull(gs_base)
setnull(gs_serie)
setnull(gi_numero)
setnull(gi_rut)
//------------
//wf_porcentajes()
st_7.text = '100%'
//cb_10.enabled = false
st_parque.text = string(id_parque)
end event

type cb_2 from commandbutton within w_plano_sector_parque
boolean visible = false
integer x = 2935
integer y = 728
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_plano_sector_parque.rowcount() > 0 then
	dw_plano_sector_parque.object.datawindow.print.Preview = true
	dw_plano_sector_parque.Object.DataWindow.Zoom = 70
	f_Print( dw_plano_sector_parque )
	dw_plano_sector_parque.Object.DataWindow.Zoom = 100
	dw_plano_sector_parque.object.datawindow.print.Preview = false
end if	




//dw_plano_sector_parque.object.datawindow.print.Preview = false
//dw_plano_sector_parque.Object.DataWindow.Zoom = 100
end event

type pb_10 from picturebutton within w_plano_sector_parque
event mousemove pbm_mousemove
integer x = 1184
integer y = 284
integer width = 151
integer height = 120
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
string disabledname = "salir.bmp"
alignment htextalign = left!
end type

event mousemove;st_10.visible 	=  true
st_10.text 		= 'Salir de Planimetria'
st_10.x 			= 960
st_10.y 			= 404
end event

event clicked;st_10.visible = false
close(w_plano_sector_parque)
end event

type shl_1 from statichyperlink within w_plano_sector_parque
boolean visible = false
integer x = 1787
integer y = 824
integer width = 535
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 67108864
string text = "mirkom@elprado.cl"
boolean focusrectangle = false
end type

event clicked;mailSession mSes
mailReturnCode mRet
mailMessage mMsg
mSes = create mailSession
mRet = mSes.mailLogon(mailNewSession!)
IF mRet <> mailReturnSuccess! THEN
    RETURN
END IF
mMsg.Recipient[1].name	= 'mirkom@elprado.cl'
mMsg.Subject				= "Planimetria"
mMsg.NoteText				= "Problemas con la Planimetria"
mSes.mailSend(mMsg)
IF mRet <> mailReturnSuccess! THEN
   RETURN
END IF
mSes.mailLogoff()
DESTROY mSes
end event

type st_7 from statictext within w_plano_sector_parque
integer x = 1417
integer y = 336
integer width = 174
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_9 from picturebutton within w_plano_sector_parque
integer x = 1445
integer y = 220
integer width = 119
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "menos.bmp"
alignment htextalign = left!
end type

event clicked;if long(dw_plano_sector_parque.Describe("DataWindow.Zoom"))  >= 80 then
	dw_plano_sector_parque.Object.DataWindow.Zoom = long(dw_plano_sector_parque.Describe("DataWindow.Zoom")) - 10
	ddlb_1.SelectItem(dw_plano_sector_parque.Describe("DataWindow.Zoom"), 1)
	st_7.text = dw_plano_sector_parque.Describe("DataWindow.Zoom")+'%'
end if
end event

type pb_8 from picturebutton within w_plano_sector_parque
event mousemove pbm_mousemove
integer x = 1445
integer y = 112
integer width = 119
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "mas.bmp"
alignment htextalign = left!
end type

event mousemove;st_10.visible = false
end event

event clicked;if long(dw_plano_sector_parque.Describe("DataWindow.Zoom"))  < 200 then
	dw_plano_sector_parque.Object.DataWindow.Zoom = long(dw_plano_sector_parque.Describe("DataWindow.Zoom")) + 10
	ddlb_1.SelectItem(dw_plano_sector_parque.Describe("DataWindow.Zoom"), 1)
	st_7.text = dw_plano_sector_parque.Describe("DataWindow.Zoom")+'%'
end if
end event

type pb_7 from picturebutton within w_plano_sector_parque
event mousemove pbm_mousemove
integer x = 1024
integer y = 132
integer width = 151
integer height = 120
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Desembosos (o).BMP"
string disabledname = "Desembosos (o).BMP"
alignment htextalign = left!
end type

event mousemove;st_10.visible =  true
st_10.text = 'Posicionamiento Global'
st_10.x = 800
st_10.y = 64
end event

event clicked;st_10.visible = false
if dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo' or dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_serena' or &
   dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_manantial' or dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_santiago2' or &
   dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_santiago' or dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_conce' or &
   dw_plano_sector_parque.dataobject = 'dw_prueba_dibujo_canaan' then
	messagebox('Seleccione Sector','Debe Selecionar un Sector.', information!)	
else
	open(w_ubicacion_plano)
end if
	
end event

type cb_1 from commandbutton within w_plano_sector_parque
boolean visible = false
integer x = 2117
integer y = 556
integer width = 485
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;open(w_proceso_fall)
end event

type st_10 from statictext within w_plano_sector_parque
event mousemove pbm_mousemove
boolean visible = false
integer x = 960
integer y = 64
integer width = 599
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 30867188
alignment alignment = center!
boolean border = true
boolean righttoleft = true
boolean disabledlook = true
end type

event mousemove;st_10.visible = false
end event

type pb_6 from picturebutton within w_plano_sector_parque
event movemause pbm_mousemove
integer x = 1024
integer y = 284
integer width = 151
integer height = 120
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "Aclaraciones (o).BMP"
string disabledname = "Aclaraciones (o).BMP"
alignment htextalign = left!
end type

event movemause;st_10.visible =  true
st_10.text = 'Resumen General'
st_10.x = 800
st_10.y = 404
end event

event clicked;st_10.visible = false
open(w_reseumen_porcentaje)

end event

type st_22 from statictext within w_plano_sector_parque
integer x = 2601
integer y = 312
integer width = 375
integer height = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_5 from picturebutton within w_plano_sector_parque
event mosemause pbm_mousemove
integer x = 864
integer y = 284
integer width = 151
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "Compañias (o).BMP"
string disabledname = "Compañias (o).BMP"
alignment htextalign = left!
end type

event mosemause;st_10.visible =  true
st_10.text = 'Asignación directa'
st_10.x = 640
st_10.y = 404
end event

event clicked;st_10.visible = false

if w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
	w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and &
	w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce' and w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan' then 
	open(w_asignacion_general)
else
	messagebox ('Seleccione Sector','Debe Seleccionar un Sector',stopsign!)
end if





end event

type pb_4 from picturebutton within w_plano_sector_parque
event movemause pbm_mousemove
integer x = 704
integer y = 284
integer width = 151
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "Outsoursing (o).BMP"
string disabledname = "Outsoursing (o).BMP"
alignment htextalign = left!
end type

event movemause;st_10.visible	=  true
st_10.text 		= 'Reserva directa'
st_10.x 			= 480
st_10.y 			= 404
end event

event clicked;st_10.visible 	= false
if w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
	w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and &
	w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce' and w_plano_sector_parque.dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan'then 
	open(w_reserva_directa)
else
	messagebox ('Seleccione Sector','Debe Seleccionar un Sector',stopsign!)
end if
end event

type pb_3 from picturebutton within w_plano_sector_parque
event movemause pbm_mousemove
integer x = 864
integer y = 132
integer width = 151
integer height = 120
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "Agenc.BMP"
string disabledname = "Agenc.BMP"
alignment htextalign = left!
end type

event movemause;st_10.visible =  true
st_10.text = 'Informes Asignación Sep.'
st_10.x = 640
st_10.y = 64
end event

event clicked;st_10.visible = false
open(w_resumenes_planimetria)

end event

type pb_2 from picturebutton within w_plano_sector_parque
event movemause pbm_mousemove
integer x = 704
integer y = 132
integer width = 151
integer height = 120
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "buscar.bmp"
string disabledname = "buscar.bmp"
alignment htextalign = left!
end type

event movemause;st_10.visible =  true
st_10.text = 'Busqueda Sepult.'
st_10.x = 480
st_10.y = 64
end event

event clicked;st_10.visible = false
if dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo'  and dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
	dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_manantial' and dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and &
	dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce' and &
	dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan' then
	st_10.visible = false
	open(w_busqueda_directa_sepultura)
else
//	open(w_busqueda_sep_directa)
	messagebox('Seleccione Sector','Selecione el Sector y luego la Sepultura.', information!)
end if
end event

type pb_1 from picturebutton within w_plano_sector_parque
event movemause pbm_mousemove
boolean visible = false
integer x = 4389
integer y = 444
integer width = 137
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean enabled = false
string picturename = "prado_logo.JPG"
string disabledname = "prado_logo.JPG"
alignment htextalign = left!
end type

event movemause;st_10.visible =  true
if gs_empresa = 'El Prado' then
	st_10.text = 'Volver Plano El Prado'
elseif gs_empresa = 'La Foresta' then
	st_10.text = 'Volver Plano La Foresta'
elseif gs_empresa = 'Santiago' then
	st_10.text = 'Volver Plano Santiago'
elseif gs_empresa = 'Concepcion' then
	st_10.text = 'Volver Plano Concepción'
end if
st_10.x = 1426
st_10.y = 56
end event

event clicked;string sql
integer i

st_10.visible = false
dw_plano_sector_parque.reset()
ddlb_2.reset()
ddplb_1.reset()
if gs_empresa = 'El Prado' then
	id_parque = 1
	ddlb_2.reset()
	sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "BASE_PLANI"."COD_PARQUE" = 1 ORDER BY "BASE_PLANI"."AREA" ASC'   
	f_ddlb_all(ddlb_2,sql)
	dw_plano_sector_parque.dataobject 					= 'dw_prueba_dibujo'
	dw_plano_sector_parque.Object.p_1.Filename 	= "plano_prado.jpg"
elseif gs_empresa = 'La Foresta' then
	id_parque = 11
	dw_plano_sector_parque.dataobject 					= 'dw_prueba_dibujo_serena'
	dw_plano_sector_parque.Object.p_1.Filename		= "plano_serena.bmp"
elseif gs_empresa = 'Santiago' then
	id_parque = 103
	dw_plano_sector_parque.dataobject 					= 'dw_prueba_dibujo_santiago'
	dw_plano_sector_parque.Object.p_1.Filename 	= "mapa_santiago.jpg"
elseif gs_empresa = 'Concepcion' then
	id_parque = 801
	dw_plano_sector_parque.dataobject 					= 'dw_prueba_dibujo_conce'
	dw_plano_sector_parque.Object.p_1.Filename 	= "plano_conce.jpg"
end if
gl_cod_parque_cta	= id_parque
dw_plano_sector_parque.insertrow(0)
ddlb_1.SelectItem('100', 0)
dw_plano_sector_parque.Object.DataWindow.Zoom = 100
st_21.text = ''
st_1.text = ''
setnull(gi_numero)
setnull(gs_sector)
setnull(gs_base)
setnull(gs_serie)
setnull(gi_numero)
setnull(gi_rut)
st_7.text = '100%'
st_parque.text = string(id_parque)
end event

type st_2 from statictext within w_plano_sector_parque
boolean visible = false
integer x = 1591
integer y = 600
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type cb_8 from commandbutton within w_plano_sector_parque
boolean visible = false
integer x = 2386
integer y = 844
integer width = 485
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Carga Archivos"
end type

event clicked;open(w_proceso_traspaso_reg)
//OPEN(w_prueba_rtf)
end event

type st_21 from statictext within w_plano_sector_parque
integer x = 2601
integer y = 120
integer width = 375
integer height = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_plano_sector_parque
integer x = 1678
integer y = 216
integer width = 823
integer height = 660
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string sql

//sql = 'SELECT DISTINCT "BASE_PLANI"."SECTOR_PLANO" FROM "BASE_PLANI" '+&  
//		'WHERE "BASE_PLANI"."AREA" = '+"'"+trim(this.text)+"'"+' ORDER BY "BASE_PLANI"."SECTOR_PLANO" ASC '

sql = ' SELECT DISTINCT "INVENTARIO_PLANI"."SECTOR" FROM "BASE_PLANI", "INVENTARIO_PLANI"   '+&
      ' WHERE ( "BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" ) and '+&
		'("BASE_PLANI"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" ) and '+&
		'("BASE_PLANI"."AREA" = '+"'"+trim(this.text)+"'"+' ) AND '+&
      ' "INVENTARIO_PLANI"."COD_PARQUE" = '+string(id_parque)+' ORDER BY "INVENTARIO_PLANI"."SECTOR" ASC  '
gs_area = trim(this.text)
f_ddlb_all(ddplb_1,sql)
//st_14.text  = ''
//st_15.text  = ''
//st_18.text  = ''
//st_16.text  = ''
//st_17.text  = ''
//st_19.text  = ''
//st_20.text  = ''
//st_21.text  = ''
//st_101.text = ''
//st_102.text = ''

end event

type cb_4 from commandbutton within w_plano_sector_parque
boolean visible = false
integer x = 3058
integer y = 444
integer width = 485
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Link"
end type

event clicked;open(w_busqueda_sep_plano_vs_datos)

//string sector, ubica
//long ret
//Inet  iinet_base
//
//if ddplb_1.text = '' then
//	messagebox('Sector','Debe seleccionar algun sector.',stopsign!)
//	return
//end if
//if gs_conexion ="Parque El Prado" then
//	ret = GetContextService("Internet", iinet_base)
//	if ret = -1 then
//		messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
//		return
//	end if
//	ret = iinet_base.HyperlinkToURL("http://50.50.50.0/prado/plani/"+gs_sector+"/im1.dwf")
//	if ret = -1 then
//		messagebox('No Existe','No existe el plano del sector buscado.',stopsign!)
//		return
//	end if
//else
//	ret = GetContextService("Internet", iinet_base)
//	if ret = -1 then
//		messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
//		return
//	end if
//	ret = iinet_base.HyperlinkToURL("http://50.50.50.0/foresta/plani/"+gs_sector+"/im1.dwf")
//	if ret = -1 then
//		messagebox('No Existe','No existe el plano del sector buscado.',stopsign!)
//		return
//	end if
//end if
end event

type ddplb_1 from dropdownpicturelistbox within w_plano_sector_parque
integer x = 1678
integer y = 324
integer width = 823
integer height = 680
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"",""}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,1}
long picturemaskcolor = 536870912
end type

event selectionchanged;string sector,tipo,ret_sector,parque
long capacidad,si

si 					= 0
parque 				= string(id_parque)
dw_jardin      		= 'dw_plano_sector_parque_retrieve'
dw_construdida 	= 'dw_plano_sector_parque_retrieve_paint'

IF MessageBox("Buscar", "Desea Mostrar Sector Selecionado", Exclamation!, YesNo!, 2) = 1 THEN
	st_7.text 		= '100%'
	SetPointer(HourGlass!)
	gs_sector 		= trim(this.text)
	SELECT distinct "PLANO_PARQUE_CONST"."SECTOR" INTO :ret_sector FROM "PLANO_PARQUE_CONST"  
   	WHERE "PLANO_PARQUE_CONST"."SECTOR" = :gs_sector AND "PLANO_PARQUE_CONST"."COD_PARQUE" = :id_parque  ;
	if sqlca.sqlcode = 0 then
		dw_plano_sector_parque.dataobject = dw_construdida
		DECLARE sp_plani_const_paint PROCEDURE FOR SP_PLANIMETRIA_CONST_PAINT_PP(:gs_sector,:id_parque,0 ) ;
		execute sp_plani_const_paint;
		dw_plano_sector_parque.settransobject(sqlca)
		if dw_plano_sector_parque.retrieve(gs_sector,id_parque,'C') > 0 then
			dw_plano_sector_parque.setsort( "correlativo A")
			dw_plano_sector_parque.sort( )
			si ++
		else
			dw_plano_sector_parque.dataobject	= 'dw_no_hay_datos'
		end if
	else
		dw_plano_sector_parque.dataobject 		= dw_jardin
		DECLARE sp_plani_paint PROCEDURE FOR SP_PLANIMETRIA_PAINT_PP(:gs_sector,:id_parque,'0' ) ;
		execute sp_plani_paint;
		if sqlca.sqlcode = -1 then
			MessageBox("SQL error", SQLCA.SQLErrText)
		end if
		dw_plano_sector_parque.settransobject(sqlca)
		if dw_plano_sector_parque.retrieve(gs_sector,id_parque,'T') > 0 then
			dw_plano_sector_parque.setsort( "correlativo A")
			dw_plano_sector_parque.sort()
			si ++
		else
			dw_plano_sector_parque.dataobject = 'dw_no_hay_datos'
		end if
	end if
	SetPointer(arrow!)
END IF

if si > 0 then
	dw_plano_sector_parque.object.t_21.text = 'User: '+gs_user
	if id_parque = 1 then
		dw_plano_sector_parque.object.t_20.text = 'Parque El Prado'
	elseif id_parque = 11 then
		dw_plano_sector_parque.object.t_20.text = 'Parque La Foresta'
	elseif id_parque = 102 then
		dw_plano_sector_parque.object.t_20.text = 'Parque El Manantial'
	elseif id_parque = 103 then
		dw_plano_sector_parque.object.t_20.text = 'Parque Santiago'
	elseif id_parque = 105 then
		dw_plano_sector_parque.object.t_20.text = 'Parque Santiago Dos'
	elseif id_parque = 801 then
		dw_plano_sector_parque.object.t_20.text = 'Parque Concepción'
	end if
end if
end event

type ddlb_1 from dropdownlistbox within w_plano_sector_parque
boolean visible = false
integer x = 2752
integer y = 580
integer width = 370
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"70","80","90","100","110","120","130","140","150","160","170","180","190","200"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_plano_sector_parque.Object.DataWindow.Zoom = integer(this.text)
end event

type gb_2 from groupbox within w_plano_sector_parque
integer x = 1385
integer y = 48
integer width = 229
integer height = 392
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Zoom"
end type

type hpb_1 from hprogressbar within w_plano_sector_parque
integer x = 73
integer y = 860
integer width = 1349
integer height = 52
unsignedinteger maxposition = 100
integer setstep = 10
end type

type st_1 from statictext within w_plano_sector_parque
integer x = 1477
integer y = 860
integer width = 142
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_plano_sector_parque
event movemause pbm_mousemove
integer x = 681
integer y = 48
integer width = 681
integer height = 392
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Herramientas"
end type

event movemause;if gs_empresa = 'El Prado' then
	pb_11.enabled =  true
else
	pb_11.enabled =  false
end if
st_10.visible = false
end event

type gb_9 from groupbox within w_plano_sector_parque
integer x = 2565
integer y = 48
integer width = 448
integer height = 200
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Observaciones"
end type

type dw_plano_sector_parque from datawindow within w_plano_sector_parque
event mousemove pbm_dwnmousemove
integer x = 73
integer y = 464
integer width = 1742
integer height = 520
integer taborder = 10
string title = "none"
string dataobject = "dw_prueba_dibujo_santiago2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;long i,sepultura,count_fall,numero_reserva  
string columna,base,serie,sepultura_nd,sub_sector,cadena,sep,sector,area,base_reserva,serie_reserva,obs
Double	numero
st_10.visible =  false
if dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' AND dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
	dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_manantial' AND dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and &
	dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and  dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce' and &
	dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan' then
	setnull(gs_base  )
	setnull(base     )
	setnull(gs_serie )
	setnull(serie    )
	setnull(gi_numero)
	setnull(numero   )
	setnull(gi_rut)
	setnull(obs)
	fila = row
	if dataobject = dw_jardin then
		for i = 1 to rowcount()
			setitem(i,'boton',0)
		next
		if row > 0  and dwo.name <> 'datawindow' and mid(dwo.name,1,2) <> 'r_'then
			columna 			= dwo.name
			sepultura 		= getitemnumber(row,columna)
			sepultura_nd 	= string(sepultura)
			gs_sepultura 	= string(sepultura)
			setitem(row,'boton',sepultura)
			accepttext ()
			SELECT	"INVENTARIO_PLANI"."BASE",	"INVENTARIO_PLANI"."SERIE",	"INVENTARIO_PLANI"."NUMERO"  
			INTO 		:base ,							:serie, 								:numero
			FROM 	"INVENTARIO_PLANI"  
			WHERE  ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND 
					 ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) AND 
					 ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) ;
			if sqlca.sqlcode = 0 and numero > 0 then
				gs_base	= base; gs_serie = serie; gi_numero = numero
			else	
				setnull(gs_base);setnull(base);setnull(gs_serie);setnull(serie);setnull(gi_numero);setnull(numero)
			end if
			SELECT	count("FALLECIDOS"."CONTRATO") 
			INTO 		:count_fall 
			FROM 	"FALLECIDOS"  
			WHERE  ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND 
					 ( "FALLECIDOS"."N_SEP" = :sepultura ) AND 
					 ( "FALLECIDOS"."COD_PARQUE" = :id_parque )  AND
					( "FALLECIDOS"."ESTADO_REG" = 'A' );
		end if
	elseif dataobject = dw_construdida then
		for i = 1 to rowcount()
			setitem(i,'boton','0')
		next
		if row > 0  and dwo.name <> 'datawindow' and mid(dwo.name,1,2) <> 'r_'then
			columna 			= dwo.name
			sepultura_nd 	= getitemstring(row,columna)
			gs_sepultura 	= sepultura_nd
			sep 				= getitemstring(row,columna)
			setitem(row,'boton',sepultura_nd)
			accepttext ()
			SELECT	"INVENTARIO_PLANI"."BASE",	"INVENTARIO_PLANI"."SERIE",	"INVENTARIO_PLANI"."NUMERO",	"INVENTARIO_PLANI"."SUB_SECTOR"  
			INTO 		:base ,							:serie, 								:numero,								:sub_sector 
			FROM 		"INVENTARIO_PLANI"  
			WHERE  ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND 
					 ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) AND 
					 ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) ;
			if sqlca.sqlcode = 0 and numero > 0 then
				gs_base		= base; gs_serie = serie; gi_numero = numero
			else	
				setnull(gs_base);setnull(base);setnull(gs_serie);setnull(serie);setnull(gi_numero);setnull(numero)
			end if
			sepultura_nd	= mid ( sepultura_nd , 1 , len( sepultura_nd ) - 2 )
			SELECT	count("FALLECIDOS"."CONTRATO") 
			INTO 		:count_fall 
			FROM 		"FALLECIDOS"  
			WHERE  ( "FALLECIDOS"."SECTOR" = :sub_sector ) AND 
					 ( "FALLECIDOS"."N_SEP" = :sepultura_nd ) AND 
					 ( "FALLECIDOS"."COD_PARQUE" = :id_parque )  AND
					( "FALLECIDOS"."ESTADO_REG" = 'A' );
		end if
	end if
	SELECT	"OFERTA_V"."SERIE",	"OFERTA_V"."NRO_OFERTA"  
	INTO 		:serie,					:numero  
	FROM		"CADENA",	"OFERTA_V",	"PAGO_OFERTA"  
	WHERE  ( "OFERTA_V"."SERIE"  = "PAGO_OFERTA"."SERIE" ) and  
			 ( "OFERTA_V"."NRO_OFERTA"   = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			 ( "OFERTA_V"."ULT_FOLIO"    = "PAGO_OFERTA"."FOLIO" ) and  
			 ( "CADENA"."SERIE"          = "OFERTA_V"."SERIE" ) and  
			 ( "CADENA"."NUMERO"         = "OFERTA_V"."NRO_OFERTA" ) and  
			 (("CADENA"."CODIGO"       = 'O' ) AND  
			 ( "PAGO_OFERTA"."SECTOR"    = :gs_sector ) AND  
			 ( "PAGO_OFERTA"."SEPULTURA" = :sepultura ) AND  
			 ( "CADENA"."COD_PARQUE"     = :id_parque ) )   ;		
	if sqlca.sqlcode <> 0 then
		SELECT	"OFERTA_V"."SERIE",	"OFERTA_V"."NRO_OFERTA"  
		INTO 		:serie,					:numero  
		FROM 		"CADENA",	"OFERTA_V",	"PAGO_OFERTA"  
		WHERE  ( "OFERTA_V"."SERIE"  = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA"   = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO"    = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE"          = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO"         = "OFERTA_V"."NRO_OFERTA" ) and  
				 (("CADENA"."CODIGO"       = 'O' ) AND  
				 ( "PAGO_OFERTA"."SECTOR"    = :gs_sector ) AND  
				 ( "PAGO_OFERTA"."SEPULTURA" = :sepultura_nd ) AND  
				 ( "CADENA"."COD_PARQUE"     = :id_parque ) )   ;		
		if sqlca.sqlcode <> 0 then
			SELECT	"CONTRATO"."SERIE_C",	"CONTRATO"."NRO_CONTRATO"  
		   INTO 		:serie,						:numero  
			FROM 		"CADENA",	"CONTRATO"  
			WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO"      = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO"    = 'C' ) AND  
					 ( "CONTRATO"."SECTOR"    = :gs_sector ) AND  
					 ( "CONTRATO"."SEPULTURA" = :sepultura ) AND  
					 ( "CADENA"."COD_PARQUE"  = :id_parque ) )   ;
			if sqlca.sqlcode <> 0 then
				SELECT	"CONTRATO"."SERIE_C",	"CONTRATO"."NRO_CONTRATO"  
				INTO 		:serie,						:numero  
				FROM 		"CADENA",	"CONTRATO"  
				WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						 ( "CADENA"."NUMERO"      = "CONTRATO"."NRO_CONTRATO" ) and  
						 (("CADENA"."CODIGO"    = 'C' ) AND  
						 ( "CONTRATO"."SECTOR"    = :gs_sector ) AND  
						 ( "CONTRATO"."SEPULTURA" = :sepultura_nd ) AND  
						 ( "CADENA"."COD_PARQUE"  = :id_parque ) )   ;
				if sqlca.sqlcode = 0 then 
					base = 'C'
				else
					Setnull(base)
				end if
			else
				base = 'C'
			end if
		else
			base = 'O'
		end if
	else 
		base = 'O'
	end if
	if rowcount() > 0 then
		object.t_8.text	= 'Promesa: '+gs_base+' - '+gs_serie+' - '+string(gi_numero,'###,###,###,###,##0')
		if not isnull(base) and (serie <> gs_serie and numero <> gi_numero) then
			object.t_8.text = trim(object.t_8.text) +' -- > Reprog. por Promesa: '+base+' - '+serie+' - '+string(numero,'###,###,###,###,##0')
		end if
		if isnull(object.t_8.text) or object.t_8.text = '' then
			if dataobject 	= dw_jardin then
				SELECT	"FALLECIDOS"."BASE",	"FALLECIDOS"."SS",	"FALLECIDOS"."CONTRATO"  
				into 		:gs_base,				:gs_serie,				:gi_numero
				FROM 		"FALLECIDOS"  
				WHERE  ( "FALLECIDOS"."N_SEP" = :sepultura ) AND 
						 ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND 
						 ( "FALLECIDOS"."COD_PARQUE" = :id_parque )  AND
						( "FALLECIDOS"."ESTADO_REG" = 'A' );
			else
				SELECT	"FALLECIDOS"."BASE",	"FALLECIDOS"."SS",	"FALLECIDOS"."CONTRATO"  
				into 		:gs_base,				:gs_serie,				:gi_numero
				FROM 		"FALLECIDOS"  
				WHERE  ( "FALLECIDOS"."N_SEP" = :sepultura_nd ) AND 
						 ( "FALLECIDOS"."SECTOR" = :sub_sector ) AND 
						 ( "FALLECIDOS"."COD_PARQUE" = :id_parque )  AND
						( "FALLECIDOS"."ESTADO_REG" = 'A' );
			end if
			if gi_numero <=0 or isnull(gi_numero) then
				SELECT 	BASE,				SERIE,				NUMERO  
			   INTO 		:base_reserva,	:serie_reserva,	:numero_reserva  
				FROM 		RESERVA_SEPULTURA  
				WHERE  ( SECTOR = :gs_sector ) AND ( SEPULTURA = :gs_sepultura )  AND 
						 ( ESTADO = 1 ) AND ( COD_PARQUE = :id_parque ) ;//AND (CORRE_INVENTARIO <> 0) 
				if sqlca.sqlcode = 0 then
					object.t_8.text 	= 'Reservada a la Promesa '+base_reserva+' - '+serie_reserva+' - '+string(numero_reserva,'###,###,###,###')
				else
					object.t_8.text 	= 'Sepultura No Asignada.'
				end if
			else
				object.t_8.text 		= 'Revisar asignación de Sepult. ( Asig. Promesa: '+gs_base+' - '+gs_serie+' - '+string(gi_numero,'###,###,###,###,##0')+' ).'
			end if
		end if
		if isnull(sepultura) or sepultura =0 then
			cadena 						= 'N° Sepult.: '+sep
		else
			cadena 						= 'N° Sepult.: '+string(sepultura,'###,###,###,##0')
		end if
		SELECT  "CADENA"."RUT" INTO :gi_rut      FROM "CADENA"  
		WHERE ( "CADENA"."CODIGO" = :gs_base )   AND  
				( "CADENA"."SERIE"  = :gs_serie )  AND  
				( "CADENA"."NUMERO" = :gi_numero ) AND
				( "CADENA"."COD_PARQUE" = :id_parque ) ;
		if sqlca.sqlcode = 0 then
			object.t_8.text 		= cadena + ' [ ' + object.t_8.text + '  Rut: '+string(gi_rut,'###,###,###,##0') + ' ]'
		else
			object.t_8.text 		= cadena + ' [ ' + object.t_8.text + ' ]'
		end if
		st_21.text 					= object.t_8.text
		if numero = 10000000 then
			st_21.text 				=  'Sepultura Colectiva'
		end if
		if dwo.name = 'datawindow' or sepultura_nd = '0' then
			st_21.text 				=  'Seleccione una Sepultura'
		end if
	end if
else
	if row > 0  and dwo.name <> 'datawindow' then
		if mid(upper(dwo.name),2) <> '_1' then
			st_21.text				= 'Sector Seleccionado:'+mid(upper(dwo.name),2)
		else
			st_21.text				= 'Seleccione un Sector '
		end if
	end if
end if
SELECT	"INVENTARIO_PLANI"."OBSERVACIONES"  
INTO 		:obs  
FROM 		"INVENTARIO_PLANI"  
WHERE  ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) AND  
		 ( "INVENTARIO_PLANI"."SEPULTURA" = :gs_sepultura )  AND 
		 ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ) ;
if sqlca.sqlcode <> 0  or isnull(gs_sepultura) or gs_sepultura = '0' or dwo.name = 'datawindow' then
	SELECT	"INVENTARIO_PLANI_CONST"."OBSERVACIONES"  
	INTO 		:obs  
	FROM 		"INVENTARIO_PLANI_CONST"  
	WHERE  ( "INVENTARIO_PLANI_CONST"."SECTOR" = :gs_sector ) AND  
			 ( "INVENTARIO_PLANI_CONST"."SEPULTURA" = :gs_sepultura )  AND 
			 ( "INVENTARIO_PLANI_CONST"."COD_PARQUE" = :id_parque ) ;
	if sqlca.sqlcode <> 0 or isnull(gs_sepultura) or gs_sepultura = '0' or dwo.name = 'datawindow' then
		st_22.text	= ''
	else
		st_22.text	= obs
	end if
	st_22.text 		= ''
else
	st_22.text 		= obs
end if

if gi_numero = 10000000 then
	MenuHabilitado	= '000010000'
else
	MenuHabilitado	= '000100000'
end if
end event

event clicked;long 		i,sepultura,count_fall
string 	columna,base,serie,sepultura_nd,sub_sector,cadena,sep,sector,area,sql,ls_producto
Double	numero
if dataobject <> 'dw_prueba_dibujo' and dataobject <> 'dw_prueba_dibujo_serena' and dataobject <> 'dw_prueba_dibujo_conce' and &
	dataobject <> 'dw_prueba_dibujo_manantial' and dataobject <> 'dw_prueba_dibujo_santiago' and dataobject <> 'dw_prueba_dibujo_santiago2' and &
	dataobject <> 'dw_prueba_dibujo_conce' and dataobject <> 'dw_prueba_dibujo_canaan' then
	setnull(gs_base)
	setnull(base)
	setnull(gs_serie)
	setnull(serie)
	setnull(gi_numero)
	setnull(numero)
	setnull(gi_rut)

	fila		= row
	if dataobject = dw_jardin then
		for i = 1 to rowcount()
			setitem(i,'boton',0)
		next
		if row > 0  and dwo.name <> 'datawindow' then
			columna 			= dwo.name
			sepultura 		= getitemnumber(row,columna)
			sepultura_nd 	= string(sepultura)
			gs_sepultura 	= string(sepultura)
			setitem(row,'boton',sepultura)
			accepttext ()
			SELECT	"INVENTARIO_PLANI"."BASE",	"INVENTARIO_PLANI"."SERIE",	"INVENTARIO_PLANI"."NUMERO"  
			INTO 		:base ,							:serie, 								:numero
			FROM 	"INVENTARIO_PLANI"  
			WHERE  ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector ) AND ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque ); 
			if sqlca.sqlcode = 0 and numero > 0 then
				gs_base = base; gs_serie = serie; gi_numero = numero
			else	
				setnull(gs_base);setnull(base);setnull(gs_serie);setnull(serie);setnull(gi_numero);setnull(numero)
			end if
			SELECT	count("FALLECIDOS"."CONTRATO") 
			INTO 		:count_fall 
			FROM 	"FALLECIDOS"  
			WHERE  ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND 
					 ( "FALLECIDOS"."N_SEP" = :sepultura ) AND 
					  ( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND 
					 ( "FALLECIDOS"."COD_PARQUE" = :id_parque ) ;
		end if
	elseif dataobject = dw_construdida then
		for i = 1 to rowcount()
			setitem(i,'boton','0')
		next
		if row > 0  and dwo.name <> 'datawindow' then
			columna = dwo.name
			sepultura_nd = getitemstring(row,columna)
			gs_sepultura = sepultura_nd
			sep = getitemstring(row,columna)
			setitem(row,'boton',sepultura_nd)
			accepttext ()
			SELECT	"INVENTARIO_PLANI"."BASE",	"INVENTARIO_PLANI"."SERIE",	"INVENTARIO_PLANI"."NUMERO",	"INVENTARIO_PLANI"."SUB_SECTOR"  
			INTO 		:base,							:serie, 								:numero,								:sub_sector 
			FROM 	"INVENTARIO_PLANI"  
			WHERE  ( "INVENTARIO_PLANI"."SEPULTURA" = :sepultura_nd ) AND 
					 ( "INVENTARIO_PLANI"."SECTOR" = :gs_sector )  AND 
					 ( "INVENTARIO_PLANI"."COD_PARQUE" = :id_parque );
			if sqlca.sqlcode = 0 and numero > 0 then
				gs_base = base; gs_serie = serie; gi_numero = numero
			else	
				setnull(gs_base);setnull(base);setnull(gs_serie);setnull(serie);setnull(gi_numero);setnull(numero)
			end if
			sepultura_nd  = mid ( sepultura_nd , 1 , len( sepultura_nd ) - 2 )
			SELECT	count("FALLECIDOS"."CONTRATO") 
			INTO 		:count_fall 
			FROM 	"FALLECIDOS"  
			WHERE  ( "FALLECIDOS"."SECTOR" = :sub_sector ) AND 
					 ( "FALLECIDOS"."N_SEP" = :sepultura_nd ) AND 
					 ( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND 
					 ( "FALLECIDOS"."COD_PARQUE" = :id_parque ) ;
		end if
	end if
	SELECT	"OFERTA_V"."SERIE",	"OFERTA_V"."NRO_OFERTA"  
	INTO 		:serie,					:numero  
	FROM 	"CADENA",	"OFERTA_V",	"PAGO_OFERTA"  
	WHERE  ( "OFERTA_V"."SERIE"  = "PAGO_OFERTA"."SERIE" ) and  
			 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
			 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
			 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
			 (("CADENA"."CODIGO" = 'O' or "CADENA"."CODIGO" = 'U' ) AND  
			 ( "PAGO_OFERTA"."SECTOR"    = :gs_sector ) AND  
			 ( "PAGO_OFERTA"."SEPULTURA" = :sepultura ) AND  
			 ( "CADENA"."COD_PARQUE"     = :id_parque ) )   ;
	if sqlca.sqlcode <> 0 then
		SELECT	"OFERTA_V"."SERIE",	"OFERTA_V"."NRO_OFERTA"  
		INTO 		:serie,					:numero  
		FROM 		"CADENA",	"OFERTA_V",	"PAGO_OFERTA"  
		WHERE  ( "OFERTA_V"."SERIE"  = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 (("CADENA"."CODIGO" = 'O' or "CADENA"."CODIGO" = 'U') AND  
				 ( "PAGO_OFERTA"."SECTOR" = :gs_sector ) AND  
				 ( "PAGO_OFERTA"."SEPULTURA" = :sepultura_nd ) AND  
				 ( "CADENA"."COD_PARQUE" = :id_parque ) )   ;
		if sqlca.sqlcode <> 0 then
			SELECT	"CONTRATO"."SERIE_C",	"CONTRATO"."NRO_CONTRATO"  
		   INTO 		:serie,						:numero  
			FROM 		"CADENA",	"CONTRATO"  
			WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO" = 'C' ) AND  
					 ( "CONTRATO"."SECTOR" = :gs_sector ) AND  
					 ( "CONTRATO"."SEPULTURA" = :sepultura ) AND  
					 ( "CADENA"."COD_PARQUE" = :id_parque ) )   ;
			if sqlca.sqlcode <> 0 then
				SELECT	"CONTRATO"."SERIE_C",	"CONTRATO"."NRO_CONTRATO"  
				INTO 		:serie,						:numero  
				FROM 		"CADENA",	"CONTRATO"  
				WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
						 (("CADENA"."CODIGO" = 'C' ) AND  
						 ( "CONTRATO"."SECTOR" = :gs_sector ) AND  
						 ( "CONTRATO"."SEPULTURA" = :sepultura_nd ) AND  
						 ( "CADENA"."COD_PARQUE" = :id_parque ) )   ;
				if sqlca.sqlcode = 0 then 
					base 	= 'C'
				else
					Setnull(base)
				end if
			else
				base 		= 'C'
			end if
		else
			
			base			= gs_base		//base = 'O'
		end if
	else 
		base				= gs_base		//base = 'O'
	end if
	if gs_base='O' then
		ls_producto		= 'Promesa'
	elseif gs_base='U' then
		ls_producto		= 'Columbario'
	end if
	object.t_8.text		= ls_producto+': '+gs_base+' - '+gs_serie+' - '+string(gi_numero,'###,###,###,###,##0')
	if not isnull(base) and (serie <> gs_serie and numero <> gi_numero) then
		object.t_8.text = trim(object.t_8.text) +' -- > Reprog. por '+ls_producto+': '+base+' - '+serie+' - '+string(numero,'###,###,###,###,##0')
	end if
	if isnull(object.t_8.text) or object.t_8.text = '' then
		if dataobject = 'dw_plano_sector_parque1' then
			SELECT	"FALLECIDOS"."BASE",	"FALLECIDOS"."SS",	"FALLECIDOS"."CONTRATO"  
			into 		:gs_base,				:gs_serie,				:gi_numero
			FROM 	"FALLECIDOS"  
			WHERE  ( "FALLECIDOS"."N_SEP" = :sepultura ) AND 
					 ( "FALLECIDOS"."SECTOR" = :gs_sector ) AND 
					 ( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND 
					 ( "FALLECIDOS"."COD_PARQUE" = :id_parque ) ;
		else
			SELECT	"FALLECIDOS"."BASE",	"FALLECIDOS"."SS",	"FALLECIDOS"."CONTRATO"  
			into 		:gs_base,				:gs_serie,				:gi_numero
			FROM 		"FALLECIDOS"  
			WHERE  ( "FALLECIDOS"."N_SEP" = :sepultura_nd ) AND 
					 ( "FALLECIDOS"."SECTOR" = :sub_sector ) AND 
					  ( "FALLECIDOS"."ESTADO_REG" = 'A' ) AND 
					 ( "FALLECIDOS"."COD_PARQUE" = :id_parque ) ;
		end if
		if gi_numero <=0 or isnull(gi_numero) then
			object.t_8.text	= ls_producto+' No Asignada.'
		else
			object.t_8.text	= 'Revisar asignación de Sepult. ( Asig. '+ls_producto+': '+gs_base+' - '+gs_serie+' - '+string(gi_numero,'###,###,###,###,##0')+' ).'
		end if
	end if
	if isnull(sepultura) or sepultura =0 then
		cadena 					= 'N° Sepult.: '+sep
	else
		cadena 					= 'N° Sepult.: '+string(sepultura,'###,###,###,##0')
	end if
	SELECT  "CADENA"."RUT"     INTO :gi_rut      FROM "CADENA"  
	WHERE ( "CADENA"."CODIGO"     = :gs_base )   AND  
			( "CADENA"."SERIE"      = :gs_serie )  AND  
			( "CADENA"."NUMERO"     = :gi_numero ) AND 
			( "CADENA"."COD_PARQUE" = :id_parque )    ;
	if sqlca.sqlcode = 0 then
		object.t_8.text 		= cadena + ' [ ' + object.t_8.text + '  Rut: '+string(gi_rut,'###,###,###,##0') + ' ]'
	else
		object.t_8.text 		= cadena + ' [ ' + object.t_8.text + ' ]'
	end if
	st_21.text 					= object.t_8.text
	if numero = 10000000 then
		st_21.text 				= 'Sepultura Colectiva'
	end if
else
	if dwo.name <> 'datawindow' and  dwo.name <> 'ed82_1' then
		sql = 'SELECT DISTINCT "BASE_PLANI"."AREA" FROM "BASE_PLANI" WHERE "COD_PARQUE" = '+string(id_parque)+' ORDER BY "BASE_PLANI"."AREA" ASC'   
		f_ddlb_all(ddlb_2,sql)
		if row > 0  and dwo.name <> 'datawindow' then
			sector = mid(upper(dwo.name),2)
			if sector <> '_1' then
				SELECT DISTINCT "BASE_PLANI"."AREA" into:area FROM "BASE_PLANI" 
				WHERE   "BASE_PLANI"."SECTOR_PLANO"  = :sector and 
						  	"BASE_PLANI"."COD_PARQUE"    = :id_parque ;
				
				ddlb_2.SelectItem(area, 0)
				ddlb_2.TriggerEvent(selectionchanged!)
				ddplb_1.SelectItem(sector, 0)
				ddplb_1.TriggerEvent(selectionchanged!)
			end if
		end if
	end if
end if
if gi_numero = 10000000 then
	MenuHabilitado='00000100'
else
	MenuHabilitado='00000000'
end if
end event

event rbuttondown;integer count_fall

if dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo' and dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_serena' and &
   dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago' and dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_santiago2' and &
   dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_conce' and dw_plano_sector_parque.dataobject <> 'dw_prueba_dibujo_canaan' and &
   dw_plano_sector_parque.dataobject <> 'dw_no_hay_datos' 	then
	m_planimetria_popup Menu
	Menu 																		= Create m_planimetria_popup
	Menu.m_popup.m_cuentacorriente.Visible                			= (Mid(MenuHabilitado, 1, 1) = "0")
	Menu.m_popup.m_fallecidos.Visible                    		 		= (Mid(MenuHabilitado, 2, 1) = "0")
	Menu.m_popup.m_detallesepultura.Visible               			= (Mid(MenuHabilitado, 3, 1) = "0")
	Menu.m_popup.m_sepulturasindividuales.Visible		   		= (Mid(MenuHabilitado, 4, 1) = "0")
	Menu.m_popup.m_ingresodereserva.Visible               		= (Mid(MenuHabilitado, 5, 1) = "0")
	Menu.m_popup.m_0.Visible                              				= (Mid(MenuHabilitado, 6, 1) = "0")
	Menu.m_popup.m_liberarsepulturadelapromnesa.Visible   	= (Mid(MenuHabilitado, 7, 1) = "0")
	Menu.m_popup.m_historicoreservasporsepult.Visible    		= (Mid(MenuHabilitado, 8, 1) = "0")
	Menu.m_popup.m_listarsector.Visible                   			= (Mid(MenuHabilitado, 9, 1) = "0")
	menu.dw_paso_menu 												= This
	Menu.m_popup.PopMenu(This.X + PointerX(), This.Y + PointerY()-20)
	gs_ventana 																= 'w_plano_sector_parque'
	f_valida_objeto()
else
	
end if
end event

type gb_4 from groupbox within w_plano_sector_parque
integer x = 2565
integer y = 248
integer width = 539
integer height = 192
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Obs. de Sepultura"
end type

type gb_6 from groupbox within w_plano_sector_parque
event movemause pbm_mousemove
integer x = 69
integer y = 48
integer width = 585
integer height = 392
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Filtros"
end type

event movemause;st_10.visible = false
end event

type gb_58 from groupbox within w_plano_sector_parque
event mousemove pbm_mousemove
integer x = 1632
integer y = 48
integer width = 905
integer height = 392
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque - Area - Sector"
end type

event mousemove;st_10.visible = false
end event

