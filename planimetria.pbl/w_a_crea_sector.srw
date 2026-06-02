forward
global type w_a_crea_sector from window
end type
type dw_a_crea_sector from datawindow within w_a_crea_sector
end type
type cb_3 from commandbutton within w_a_crea_sector
end type
type st_2 from statictext within w_a_crea_sector
end type
type cb_2 from commandbutton within w_a_crea_sector
end type
type em_total from editmask within w_a_crea_sector
end type
type st_total from statictext within w_a_crea_sector
end type
type st_capa from statictext within w_a_crea_sector
end type
type st_sector from statictext within w_a_crea_sector
end type
type sle_capacidad from singlelineedit within w_a_crea_sector
end type
type sle_sector from singlelineedit within w_a_crea_sector
end type
type st_1 from statictext within w_a_crea_sector
end type
type sle_zona from singlelineedit within w_a_crea_sector
end type
type cb_1 from commandbutton within w_a_crea_sector
end type
type gb_1 from groupbox within w_a_crea_sector
end type
end forward

global type w_a_crea_sector from window
integer x = 1335
integer y = 684
integer width = 3118
integer height = 1804
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_a_crea_sector dw_a_crea_sector
cb_3 cb_3
st_2 st_2
cb_2 cb_2
em_total em_total
st_total st_total
st_capa st_capa
st_sector st_sector
sle_capacidad sle_capacidad
sle_sector sle_sector
st_1 st_1
sle_zona sle_zona
cb_1 cb_1
gb_1 gb_1
end type
global w_a_crea_sector w_a_crea_sector

forward prototypes
public function integer f_ingresar_plan (long al_parque, string as_zona, string as_sector, long al_sistema, string as_estado)
end prototypes

public function integer f_ingresar_plan (long al_parque, string as_zona, string as_sector, long al_sistema, string as_estado);
  INSERT INTO "PLANIMETRIA"  
         ( "PARQUE",   
           "ZONA",   
           "SECTOR",   
           "NRO_SISTEMA",   
           "SEPULTURA",   
           "NRO_TECNICO",   
           "CAPACIDAD",   
           "TIPO_CONSTRUCCION",   
           "ESTADO_SEPULTURA",   
           "BASE",   
           "SERIE",   
           "NRO_CONTRATO",   
           "UBS",   
           "XX",   
           "YY" )  
  VALUES ( :al_parque,   
           :as_zona,   
           :as_sector,   
           :al_sistema,   
           null,   
           null,   
           null,   
           null,   
           :as_estado,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null )  ;

return 0
end function

on w_a_crea_sector.create
this.dw_a_crea_sector=create dw_a_crea_sector
this.cb_3=create cb_3
this.st_2=create st_2
this.cb_2=create cb_2
this.em_total=create em_total
this.st_total=create st_total
this.st_capa=create st_capa
this.st_sector=create st_sector
this.sle_capacidad=create sle_capacidad
this.sle_sector=create sle_sector
this.st_1=create st_1
this.sle_zona=create sle_zona
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.dw_a_crea_sector,&
this.cb_3,&
this.st_2,&
this.cb_2,&
this.em_total,&
this.st_total,&
this.st_capa,&
this.st_sector,&
this.sle_capacidad,&
this.sle_sector,&
this.st_1,&
this.sle_zona,&
this.cb_1,&
this.gb_1}
end on

on w_a_crea_sector.destroy
destroy(this.dw_a_crea_sector)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.em_total)
destroy(this.st_total)
destroy(this.st_capa)
destroy(this.st_sector)
destroy(this.sle_capacidad)
destroy(this.sle_sector)
destroy(this.st_1)
destroy(this.sle_zona)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;
gf_centrar(w_a_crea_sector)

//DataWindowChild dwch
//
//
//
//dw_a_crea_sector.GetChild('nro_sistema', dwch)
//dwch.SetTransObject(SQLCA)
//
//dwch.Retrieve()
//dw_a_crea_sector.SetTransObject(SQLCA)
//
end event

type dw_a_crea_sector from datawindow within w_a_crea_sector
integer x = 64
integer y = 704
integer width = 2962
integer height = 784
string dataobject = "a_crea_sector"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_a_crea_sector
integer x = 2510
integer y = 1540
integer width = 517
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_a_crea_sector)
end event

type st_2 from statictext within w_a_crea_sector
integer x = 82
integer y = 32
integer width = 1582
integer height = 116
integer textsize = -18
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Creacion Total de Sepulturas"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_a_crea_sector
integer x = 1061
integer y = 232
integer width = 498
integer height = 120
integer taborder = 50
string dragicon = "Application!"
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crear &Planilla"
end type

event clicked;integer fila, n_sepul, i
long ll_monto, ll_total, parque
STRING area, sector

n_sepul = Integer(em_total.text)
area=string(sle_zona.text)
sector=string(sle_sector.text)

//area = "A2"
//sector ="A1"

parque = 1

//n_cheques=10
IF n_sepul > 0 THEN
	// SI existían cheques, deben ser borrados
	IF dw_a_crea_sector.RowCount() > 0 THEN
		FOR i = dw_a_crea_sector.RowCount() TO 1 STEP -1
			dw_a_crea_sector.DeleteRow(i)
		NEXT
	END IF
//	ll_total = long(st_saldo.text)
//	ll_monto = truncate(ll_total / n_cheques, 0)
	FOR i = 1 TO n_sepul
		fila = dw_a_crea_sector.InsertRow(0)
//		IF i <> n_cheques THEN
//			dw_a_crea_sector.SetItem(fila, "nro_sistema", fila)
//		ELSE
//			dw_a_crea_sector.SetItem(fila, "nro_sistema", ll_total - ((n_cheques - 1) * ll_monto))
//		END IF
		dw_a_crea_sector.SetItem(fila, "parque", parque)
		dw_a_crea_sector.SetItem(fila, "zona", area)
		dw_a_crea_sector.SetItem(fila, "sector", sector)
		dw_a_crea_sector.SetItem(fila, "nro_sistema", i)
		dw_a_crea_sector.SetItem(fila, "estado", "D")

	NEXT
END IF









//
//integer i
//long ll_banco, ll_n_cheque
//string ls_n_cheque
//
//dw_a_crea_sector.AcceptText()
//IF dw_a_crea_sector.RowCount() > 1 THEN
////	ll_banco = dw_a_crea_sector.GetItemNumber(1, "cod_banco")
////	ll_n_cheque = dw_a_crea_sector.GetItemNumber(1, "n_cheque")
////	//ll_n_cheque = Long(ls_n_cheque)
//ll_banco=1
//dw_a_crea_sector.SetItem(1,"nro_sistema",ll_banco)
//
//	FOR i = 2 TO 10
////		dw_a_crea_sector.RowCount()
//		dw_a_crea_sector.SetItem(i,"nro_sistema",ll_banco+ i - 1)
////		dw_a_crea_sector.SetItem(i,"n_cheque", (ll_n_cheque + i - 1))
//	NEXT
//END IF
//
end event

type em_total from editmask within w_a_crea_sector
integer x = 539
integer y = 524
integer width = 402
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###,###"
string displaydata = ""
end type

type st_total from statictext within w_a_crea_sector
integer x = 105
integer y = 528
integer width = 375
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Cantidad"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_capa from statictext within w_a_crea_sector
integer x = 105
integer y = 428
integer width = 375
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Capacidad"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_sector from statictext within w_a_crea_sector
integer x = 105
integer y = 328
integer width = 375
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Sector"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_capacidad from singlelineedit within w_a_crea_sector
integer x = 539
integer y = 424
integer width = 402
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type sle_sector from singlelineedit within w_a_crea_sector
integer x = 539
integer y = 324
integer width = 402
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_1 from statictext within w_a_crea_sector
integer x = 105
integer y = 228
integer width = 375
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Zona"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_zona from singlelineedit within w_a_crea_sector
integer x = 539
integer y = 224
integer width = 402
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type cb_1 from commandbutton within w_a_crea_sector
integer x = 64
integer y = 1540
integer width = 517
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Graba Sector"
end type

event clicked;long net, ll_cant_cheques, i, ll_parque, ll_sistema
string ls_zona, ls_sector, ls_estado

Net = MessageBox("INGRESAR SEPULTURAS ", "Desea INSERTAR A PLANIMETRIA " + " ?", Exclamation!, YesNo!, 2)
IF Net = 1 THEN 
	// Process OK.
			// Insertar documentos de pago...

				ll_cant_cheques = dw_a_crea_sector.RowCount()
				FOR i = 1 TO dw_a_crea_sector.RowCount()
					ll_parque = dw_a_crea_sector.GetItemNumber(i, "parque")
					ls_zona   = dw_a_crea_sector.GetItemString(i, "zona")
					ls_sector = dw_a_crea_sector.GetItemString(i, "sector")
					ll_sistema = dw_a_crea_sector.GetItemNumber(i, "nro_sistema")
					ls_estado  = dw_a_crea_sector.GetItemString(i, "estado")
					f_ingresar_plan(ll_parque, ls_zona, ls_sector,ll_sistema, ls_estado)
//					else MessageBox("no grabo Datos no grabados ", Information!,())
//					f_ingresar_doc(ll_n_cheque, ll_cod_banco, ll_monto, ld_vencimiento, 'CH', ll_cant_cheques)
				NEXT
			END IF
			commit;
close(w_a_crea_sector)
			// Insertar instancia de Ingreso e Ingre

end event

type gb_1 from groupbox within w_a_crea_sector
integer x = 64
integer y = 148
integer width = 1563
integer height = 516
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
borderstyle borderstyle = styleraised!
end type

